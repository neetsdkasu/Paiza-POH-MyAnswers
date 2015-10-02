-module(main).
-export([main/1]).
-import(string,[concat/2,copies/2]).

main(_) ->
    io:format("~s",[palindrome(getwords())]),
    halt().

palindrome(W) -> palindrome(map_data(mapping(W)),"","","").
palindrome([{W,{N,symmetry}}|T], L, C, R) ->
    NC = if (N rem 2 == 1) and ((C == "") or (W < C)) -> W; true -> C end,
    P = copies(W, N div 2),
    palindrome(T, concat(L, P), NC, concat(P, R));
palindrome([{W,{N,WR}}|T], L, C, R) ->
    P = copies(W, N div 2),
    PR = copies(WR, N div 2),
    palindrome(T, concat(L, P), C, concat(PR, R));
palindrome([], L, C, R) -> concat(L, concat(C, R)).
    

mapping(W) -> mapping(W, map_new()).
mapping([], M) -> M;
mapping([H|T], M) ->
    R = lists:reverse(H),
    {K, KR} = case comp(H, R) of
            eq -> {H, symmetry};
            lt -> {H, R};
            gt -> {R, H}
        end,
    X = case map_get(K,M) of
            {ok, {V, _}} -> V + 1;
            nothing -> 1
        end,
    mapping(T, map_put(K,{X, KR},M)).

comp([],[]) -> eq;
comp(_,[]) -> gt;
comp([],_) -> lt;
comp([A|B],[C|D]) -> if A < C -> lt; A > C -> gt; true -> comp(B,D) end.

map_new() -> emptymap.

map_get(FK, {map, {K,V}, L, R, _}) ->
    case comp(FK, K) of
        eq -> {ok, V};
        lt -> map_get(FK, L);
        gt -> map_get(FK, R)
    end;
map_get(_, emptymap) -> nothing.

map_put(NK,NV, {map, {K,V}, L, R, D}) ->
    case comp(NK, K) of
        eq -> {map, {K, NV}, L, R, D};
        lt -> map_rotate({map, {K, V}, map_put(NK,NV,L), R, D});
        gt -> map_rotate({map, {K, V}, L, map_put(NK,NV,R), D})
    end;
map_put(NK,NV, emptymap) -> {map, {NK, NV}, emptymap, emptymap, 1}.


map_rotate({map, KV, L, R, _}) ->
    LD = map_depth(L),
    RD = map_depth(R),
    case LD - RD of
        X when X > 1 ->
            {_, KVL, LL, RL, _} = L,
            {map, KVL, LL, {map, KV, RL, R, RD + 1}, LD};
        Y when Y < -1 ->
            {_, KVR, LR, RR, _} = R,
            {map, KVR, {map, KV, L, LR, LD + 1}, RR, RD};
        _Else ->
            D = if LD > RD -> LD; true -> RD end,
            {map, KV, L, R, D + 1}
    end.

map_depth({map, _, _, _, D}) -> D;
map_depth(emptymap) -> 0.

map_data(emptymap) -> [];
map_data({map, KV, L, R, _}) -> map_data(L) ++ [KV] ++ map_data(R).

split(S) -> split(S,"",[]).
split([],"",L) -> L;
split([],W,L) -> [W] ++ L;
split([$\n|T],"",L) -> split(T,"",L);
split([$\n|T],W,L) -> split(T,"",[W] ++ L);
split([H|T],W,L) -> split(T,[H|W],L).

delfirst([$\n|T]) -> T;
delfirst([_|T]) -> delfirst(T).

%% 単語リスト取得
getwords() ->
    case io:get_chars("",20000) of
        eof -> eof;
        {error, E} -> {error, E};
        S -> split(delfirst(S))
    end.
