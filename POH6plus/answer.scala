object Main extends App{
    def f(v:Seq[String], s:String, c:String):Unit = {
        if (v.isEmpty) {
            println(s+c+s.reverse)
        } else {
            val h = v.head
            val t = v.tail
            val r = h.reverse
            var j = t.indexOf(r)
            if (j > 0) 
                f(t.take(j) ++ t.drop(j + 1), s+h, c)
            else if (j == 0)
            	f(t.tail, s+h, c)
            else
                if (h == r && (c == "" || h < c))
                    f(t, s, h)
                else
                    f(t, s, c)
        }
    }
    val n = scala.io.StdIn.readLine().toInt
    val w = (1 to n).map(x=>scala.io.StdIn.readLine()).sorted
    f(w, "", "")
}
