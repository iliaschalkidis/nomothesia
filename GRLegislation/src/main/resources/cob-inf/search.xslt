<?xml version="1.0" encoding="UTF-8"?>
<!--
  Licensed to the Apache Software Foundation (ASF) under one or more
  contributor license agreements.  See the NOTICE file distributed with
  this work for additional information regarding copyright ownership.
  The ASF licenses this file to You under the Apache License, Version 2.0
  (the "License"); you may not use this file except in compliance with
  the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:param name="relative_path" />
  <xsl:template match="/">
    <html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ΝΟΜΟΘΕΣΙ@</title>
    <meta name="keywords" content="" />
    <meta name="description" content="Η ελληνική νομοθεσία τώρα στο ανοιχτά στο διαδίκτυο!" />
    <link href='http://fonts.googleapis.com/css?family=Ubuntu+Condensed' rel='stylesheet' type='text/css'/>
        <link href='http://fonts.googleapis.com/css?family=Jura&amp;subset=latin,greek' rel='stylesheet' type='text/css'/>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css"/>
    <script src="http://code.jquery.com/jquery-1.9.1.js">//</script>
    <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js">//</script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js">//</script>
    <link href="css/styles.css" rel="stylesheet"/>
    <script>
      $(function() {
         $( "#datepicker" ).datepicker({ 
        dateFormat: 'yy-mm-dd',
         closeText: 'Κλείσιμο',
                prevText: 'Προηγούμενος',
                nextText: 'Επόμενος',
                currentText: 'Τρέχων Μήνας',
                monthNames: ['Ιανουάριος','Φεβρουάριος','Μάρτιος','Απρίλιος','Μάιος','Ιούνιος',
                'Ιούλιος','Αύγουστος','Σεπτέμβριος','Οκτώβριος','Νοέμβριος','Δεκέμβριος'],
                monthNamesShort: ['Ιαν','Φεβ','Μαρ','Απρ','Μαι','Ιουν',
                'Ιουλ','Αυγ','Σεπ','Οκτ','Νοε','Δεκ'],
                dayNames: ['Κυριακή','Δευτέρα','Τρίτη','Τετάρτη','Πέμπτη','Παρασκευή','Σάββατο'],
                dayNamesShort: ['Κυρ','Δευ','Τρι','Τετ','Πεμ','Παρ','Σαβ'],
                dayNamesMin: ['Κυ','Δε','Τρ','Τε','Πε','Πα','Σα'],
                weekHeader: 'Εβδ',
                maxDate: '0'
    
    });
         $( "#datepicker2" ).datepicker({ 
        dateFormat: 'yy-mm-dd',
         closeText: 'Κλείσιμο',
                prevText: 'Προηγούμενος',
                nextText: 'Επόμενος',
                currentText: 'Τρέχων Μήνας',
                monthNames: ['Ιανουάριος','Φεβρουάριος','Μάρτιος','Απρίλιος','Μάιος','Ιούνιος',
                'Ιούλιος','Αύγουστος','Σεπτέμβριος','Οκτώβριος','Νοέμβριος','Δεκέμβριος'],
                monthNamesShort: ['Ιαν','Φεβ','Μαρ','Απρ','Μαι','Ιουν',
                'Ιουλ','Αυγ','Σεπ','Οκτ','Νοε','Δεκ'],
                dayNames: ['Κυριακή','Δευτέρα','Τρίτη','Τετάρτη','Πέμπτη','Παρασκευή','Σάββατο'],
                dayNamesShort: ['Κυρ','Δευ','Τρι','Τετ','Πεμ','Παρ','Σαβ'],
                dayNamesMin: ['Κυ','Δε','Τρ','Τε','Πε','Πα','Σα'],
                weekHeader: 'Εβδ',
                maxDate: '0'
    
    });
         $( "#datepicker3" ).datepicker({ 
        dateFormat: 'yy-mm-dd',
         closeText: 'Κλείσιμο',
                prevText: 'Προηγούμενος',
                nextText: 'Επόμενος',
                currentText: 'Τρέχων Μήνας',
                monthNames: ['Ιανουάριος','Φεβρουάριος','Μάρτιος','Απρίλιος','Μάιος','Ιούνιος',
                'Ιούλιος','Αύγουστος','Σεπτέμβριος','Οκτώβριος','Νοέμβριος','Δεκέμβριος'],
                monthNamesShort: ['Ιαν','Φεβ','Μαρ','Απρ','Μαι','Ιουν',
                'Ιουλ','Αυγ','Σεπ','Οκτ','Νοε','Δεκ'],
                dayNames: ['Κυριακή','Δευτέρα','Τρίτη','Τετάρτη','Πέμπτη','Παρασκευή','Σάββατο'],
                dayNamesShort: ['Κυρ','Δευ','Τρι','Τετ','Πεμ','Παρ','Σαβ'],
                dayNamesMin: ['Κυ','Δε','Τρ','Τε','Πε','Πα','Σα'],
                weekHeader: 'Εβδ',
                maxDate: '0'
    
    });
      });

      $(document).ready(function(){
      $('#trends').dataTable({
          aaSorting: [[ 2, "desc" ]],
           bSortable: true,
          "iDisplayLength": 4,
           aoColumnDefs: [
                { "aTargets": [ 0 ], "bSortable": true },
                { "aTargets": [ 1 ], "bSortable": true },
                { "aTargets": [ 2 ], "bSortable": true },
            ],
          "bLengthChange": false,
          "oLanguage": {
                            "sLengthMenu": "Εμφάνισε _MENU_ εγγραφές ",
                            "sZeroRecords": "Δεν βρέθηκε τίποτα",
                            "sInfo": "Εμφανίζει από _START_ μέχρι _END_ των _TOTAL_ εγγραφών",
                            "sInfoEmpty": "Εμφανίζει 0 εγγραφές",
                            "sInfoFiltered": "(φιλτραρισμένες _MAX_ συνολικά εγγραφές)",
                            "sSearch": "Αναζήτηση",
                            "oPaginate": {
                                        "sNext": "Επόμενη",
                                         "sPrevious": "Προηγούμενη"
                             }
                    }
      });
        
      $( "#tabs" ).tabs();
        
  
    });
    </script>
    </head>
    <body style="background-image:url('images/background3.jpg')">
        <div id="wrapper">
            <div id="header2" style="background-image:url('images/header.jpg')">
                <div id="title"><h1>ΝΟΜΟΘΕΣΙ@</h1></div>
                <div id="header_menu">
                    <ul>
                        <li><a href="./">Αρχική</a></li>
                        <li><a href="developer">Πληροφορίες</a></li>
                        <li><a href="about">Σχετικά</a></li>
                        <li><a href="about">Επικοινωνία</a></li>
                    </ul>
                </div>
            </div>

            <div id="content">
                    <div id="tabs">
                        <ul>
                        <li><a href="#tabs-1">Αποτελέσματα Αναζήτησης</a></li>
                        </ul>
                    <div id="tabs-1">
                        <table id="trends" style="white-space: normal;line-height: normal;font-weight: normal;font-variant: normal;font-style: normal;text-align: justify; text-justify:inter-word;">
                        <thead>
                            <tr>
                                <th>Τίτλος</th>
                                <th>Κωδικός</th>
                                <th>Ημερομήνια</th>
                            </tr>
                        </thead>
                        <tbody>
                        <xsl:for-each select="results/result">
                        <tr>
                            <td>
                                 <a><xsl:attribute name="href">
                                     <xsl:value-of select="$relative_path"/><xsl:value-of select="legtype"/>/<xsl:value-of select="year"/>/<xsl:value-of select="number"/>
                                 </xsl:attribute>
                                 <xsl:value-of select="title"/>
                                 </a>
                            </td>
                            <td>
                                <xsl:value-of select="type"/>&#160;
                                <xsl:value-of select="year"/>/<xsl:value-of select="number"/>
                            </td>
                            <td>
                                <xsl:value-of select="date"/>
                            </td>
                        </tr>
                        </xsl:for-each>
                        </tbody>
                        </table>
                    </div>
                    <br/><br/>
                </div>
                    <div id="content_mainsearch">
                <div id="middle_first4">
            <form action="search">    
            <table border="0" style="font-size:medium;" >
            <tr>
            <td>Λέξεις - Κλειδιά:</td>
            <td><input type="text" name="keywords" title="Χωρίστε τις λέξεις με κόμμα (,)" style="width: 240px;"/></td>
            </tr>
            <tr>
            <td>Τύπος νομοθεσίας:</td>
            <td><select name="type">
              <option>-</option>
              <option value="con">Σύνταγμα</option>
              <option value="law">Νόμος</option>
              <option value="pd">Προεδρικό Διάταγμα (ΠΔ)</option>
              <option value="amc">Πράξη Υπουργικού Συμβουλίου (ΠΥΣ)</option>
              <option value="la">Πράξη Νομοθετικού Περιεχομένου (ΠΝΠ)</option>
              <option value="md">Κοινή Υπουργική Απόφαση (ΚΥΑ)</option>
              <option value="md">Υπουργική Απόφαση (ΥΑ)</option>
            </select></td>
            </tr>
            <tr>
            <td>Αριθμός Κυκλοφορίας:</td>
            <td>
            <select name="year">
              <option>-</option>
              <option value="2013">2013</option>
              <option value="2012">2012</option>
              <option value="2011">2011</option>
              <option value="2010">2010</option>
              <option value="2009">2009</option>
              <option value="2008">2008</option>
              <option value="2007">2007</option>
            </select>
            / <input type="text" name="id" style="width: 170px;"/>
            </td>
            </tr>
            <tr>
            <td>Ημερομηνία Κυκλοφορίας:</td>
            <td> <input type="text" id="datepicker" title="Επιλέξτε ημερομηνία με την βοήθεια του παραθύρου" name="date"/></td>
            </tr>
            <tr>
            <td></td>
            <td align="right"> <input type="submit" class="button" value="Αναζήτηση"/></td>
            </tr>
            </table>
            
            </form>
            </div>
            <br/>
                <div id="middle_first4">
                <form>
                    <table style="font-size:medium;">
                        <tr>
                            <td>ΦΕΚ Κυκλοφορίας:</td>
                            <td><select>
                              <option value="a">Τεύχος Πρώτο (Α)</option>
                              <option value="b">Τεύχος Δεύτερο (Β)</option>
                            </select></td>
                        </tr>
                        <tr>
                            <td>Αριθμός ΦΕΚ:</td>
                            <td><select name="fekyear">
              <option>-</option>
              <option value="2014">2014</option> 
              <option value="2013">2013</option>
              <option value="2012">2012</option>
              <option value="2011">2011</option>
              <option value="2010">2010</option>
              <option value="2009">2009</option>
              <option value="2008">2008</option>
              <option value="2007">2007</option>
            </select>&#160;/&#160;<input type="text" name="fekNumber" style="width: 110px"/></td>
                        </tr>
                        <tr>
                            <td>Ημερομηνία Κυκλοφορίας:</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>Απο:</td>
                            <td>Μέχρι:</td>
                        </tr>
                        <tr>
                            <td> <input type="text" id="datepicker2" name="date2"/></td>
                            <td> <input type="text" id="datepicker3" name="date3"/></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td align="right"><div class="button3"><a href="advancedsearch" style="font-size:20px;">Προχωρημένη Αναζήτηση</a></div></td>
                        </tr>
                    </table>
                </form>
            </div>
            </div>
            
            
                    </div>
                    

                <div id="footer" style="background-image:url('images/footer.jpg')" >   
            <br/>
            <br/>
            <br/>
            <h6>Τμήμα Πληροφορικής &amp; Τηλ/νωνιών ΕΚΠΑ - Open Data&#160;&#160; <img src="images/rdf.png" width="15"/> </h6>
            </div>
        </div>
    </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
