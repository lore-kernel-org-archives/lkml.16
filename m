Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53942ED844
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175035; cv=none; b=brINIxHVY/2mn7Pt0ey7CHPFc76Xq4FIjQR+778RfcANp1cBdzA3t2mw+VzR3JTiNfPWhCGA4IoGItcRzbZRQIKE5rzXz/NiGIEdqT61ZE21l9awvE3VXGlU4jOYQxBLQkuw80BjdX12Qr/mwjWX3HXm6HRHvvtGVqqrq2u6IDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175035; c=relaxed/simple;
	bh=P5CLajP6UCO8cSIeq7vAlm70pO24MmcBN9J83+v7YjA=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=ER8e2RFe1pbmMN5LvzWA5aaeBNTaLM/Dyciw3OpNR3KYGJIetqZ/XVU1IG/OpIpHcwZK+x1WGbn9eiQlAZHHFVeOR8pba1VdxwebaZRebZVFYxhdZCes3ozqzq63b+6WadrWNScX42eJk1tx6p19m8YieJNAfvsDKgYJnqNBp9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf17.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay05.hostedemail.com (Postfix) with ESMTP id DECB3599EF;
	Tue, 17 Jun 2025 15:43:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 8D0BB18;
	Tue, 17 Jun 2025 15:43:45 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uRYTX-000000029Ho-3X9a;
	Tue, 17 Jun 2025 11:43:51 -0400
Message-ID: <20250617154351.696892698@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 17 Jun 2025 11:43:05 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: "John Warthog9 Hawley" <warthog9@kernel.org>,
 dhaval@gianis.ca
Subject: [PATCH 2/4] ktest.pl: Allow command option -D to override temp variables
References: <20250617154303.952651744@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Queue-Id: 8D0BB18
X-Stat-Signature: itxyiwcabtem8chhgy93pjbsm4ec48o6
X-Rspamd-Server: rspamout07
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/ggp3Z0EzBnulcQktgLG4KWJkNocTxjJg=
X-HE-Tag: 1750175025-954248
X-HE-Meta: U2FsdGVkX18Bpq4Txw2dUewEILTVnyZibBIUlgj/NpauFWmaOLdJLape1bm53FmGJSVeVev+/5XHWO9FsmiZw8xBfoTDeyAtxMosXDFqvDd3kAt07V51arQQkaS6OuLEhW9mE2Qwyd+iO0ko7sID3V5S1vG2RTg0Fg2EE0Ke/p1EG0EEUgapjZbeFQ/Lfz84Ir/sUHcH9m/yjgIoNy1nuG58/vuSRBXWZQiyjvjAJjYuBcnzuuu3dkxi/O+l2NhHCt79niKP2vJ4ZKTflPtXDt6obkT2J786U9nxRE10n4tOE9skDT8SfJZ5ow/E0DPvoRv0bwXDml66LXFIM1scdaZojVaEfv36ntkfID0g2PV9CqCZ95GE0c+UQqoWFjm656+0E1IiRm7v8i6c2siu2w==

From: Steven Rostedt <rostedt@goodmis.org>

Currently -D only updates the persistent variables that are defined with
"=". Allow it to also override all temp variables that are defined with
":=".

 ktest.pl -D 'USE_TEMP_DIR:=1' -D 'TEST_TYPE[2]=build' config

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 tools/testing/ktest/ktest.pl | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index 8fcc09893986..c441934f1def 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -22,6 +22,7 @@ my %repeat_tests;
 my %repeats;
 my %evals;
 my @command_vars;
+my %command_tmp_vars;
 
 #default opts
 my %default = (
@@ -901,14 +902,22 @@ sub set_eval {
 }
 
 sub set_variable {
-    my ($lvalue, $rvalue) = @_;
+    my ($lvalue, $rvalue, $command) = @_;
 
+    # Command line variables override all others
+    if (defined($command_tmp_vars{$lvalue})) {
+	return;
+    }
     if ($rvalue =~ /^\s*$/) {
 	delete $variable{$lvalue};
     } else {
 	$rvalue = process_variables($rvalue);
 	$variable{$lvalue} = $rvalue;
     }
+
+    if (defined($command)) {
+	$command_tmp_vars{$lvalue} = 1;
+    }
 }
 
 sub process_compare {
@@ -4267,6 +4276,11 @@ ktest.pl version: $VERSION
                 -D TEST_TYPE[2]=build
                     Sets TEST_TYPE of test 2 to "build"
 
+	        It can also override all temp variables.
+                 -D USE_TEMP_DIR:=1
+                    Will override all variables that use
+                    "USE_TEMP_DIR="
+
 EOF
 ;
 }
@@ -4277,7 +4291,11 @@ while ( $#ARGV >= 0 ) {
 	die_usage if ($#ARGV < 1);
 	my $val = shift;
 
-	$command_vars[$#command_vars + 1] = $val;
+	if ($val =~ m/(.*?):=(.*)$/) {
+	    set_variable($1, $2, 1);
+	} else {
+	    $command_vars[$#command_vars + 1] = $val;
+	}
 
     } elsif ( $ARGV[0] eq "-h" ) {
 	die_usage;
-- 
2.47.2


