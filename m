Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51EA2EBDCC
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 15:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750175030; cv=none; b=ezKljkx3opK52O//5FcgT0yka5j+EaZjJ57xSIdar4voJ1ysbQaBfX1sZeSYkjzzjAQ/Slnp/s0Mm+dTfv3efSRRldQlfLxizVgk2d+hYZGUSGGE1QTZA8YEdKnQcAayEb7OLiyt46PlTRnMKRA5+ycJ+7UNe483P4psvM0vcCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750175030; c=relaxed/simple;
	bh=ZK6wdPM/LAMfxobRZbf8/Cd8P1nRnEFSuEy9Ztd/cu0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=EU+SDPfbe6SoUp3RwbNnY1O6d0gD7JpZrPXyqxC5srJOdRci/3OOgID81yNKA1wHdtVL3WuMU5hmUQPLQxnkIMEE/E6qB5SI79dHkF6YPDY+c33c3hXrBzCbJcmfa7NrNz6ps5N03Vfw1nePs6mx7PKdM0ebiKpkRpNqn/Jn7Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass smtp.mailfrom=goodmis.org; arc=none smtp.client-ip=216.40.44.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id D887A100AB5;
	Tue, 17 Jun 2025 15:43:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: nevets@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id 93E7A60009;
	Tue, 17 Jun 2025 15:43:45 +0000 (UTC)
Received: from rostedt by gandalf with local (Exim 4.98.2)
	(envelope-from <rostedt@goodmis.org>)
	id 1uRYTX-000000029HK-2ps8;
	Tue, 17 Jun 2025 11:43:51 -0400
Message-ID: <20250617154351.528852085@goodmis.org>
User-Agent: quilt/0.68
Date: Tue, 17 Jun 2025 11:43:04 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: linux-kernel@vger.kernel.org
Cc: "John Warthog9 Hawley" <warthog9@kernel.org>,
 dhaval@gianis.ca
Subject: [PATCH 1/4] ktest.pl: Add -D option to override variables
References: <20250617154303.952651744@goodmis.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Rspamd-Queue-Id: 93E7A60009
X-Stat-Signature: c7x6w1wxtou1ggpm1hppeyn1sh8rc5m5
X-Rspamd-Server: rspamout06
X-Session-Marker: 6E657665747340676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+EogeoPDcIAbEAhpHecPtck4vBovZJ0hw=
X-HE-Tag: 1750175025-600547
X-HE-Meta: U2FsdGVkX1+rlAn1Fb8dflKyHVqDWRmpbV5slNi5dCZHgv/3CDTRDQGd4N1b18mgq7WgoTf63V1neSh6BygSoSHLBbuurFTUW9NBNnJV1uPL9rJ2J+8KljwZUETGR2ykwCSGqDlmc/U/pbjkjxF4syY94GR5QgqFWPQC/R04CyKR10T2zO3WPW0AdNBqCreg4oJuCHCgVgiTPRalTW8KswkjFXpn2pA7yteubN4izuwqcjztYcC9OAYNq9UpDvyepzZgZFNjui1XVchKybVEWngxX8EnGRd+ZiZulSYt9xxdAin9HXjG/v6O4Sz6i7XCexyj8lSRm2IxDRSnaoV2GrKJg34h6X3zBGjGKwxEsx8rNUUs5VlLcMVm3trAJYCN+Zo05ISuEl+4kITnKugruA==

From: Steven Rostedt <rostedt@goodmis.org>

Add -D option that lets the user override variables in the config.

For instance, if the config has: BUILD_NOCLEAN=1 which prevents mrproper
from being called before builds, and the user wants to call it once. The
user can run:

  ktest -D BUILD_NOCLEAN=0 config

And the default "BUILD_NOCLEAN" variable will be disabled.

If the user wants to change the second test to do a build and not boot,
the user can run:

  ktest -D 'TEST_TYPE[2]=build' config

Where the '[#]' is for the test to assign the variable for.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
---
 tools/testing/ktest/ktest.pl | 45 +++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/testing/ktest/ktest.pl b/tools/testing/ktest/ktest.pl
index a5f7fdd0c1fb..8fcc09893986 100755
--- a/tools/testing/ktest/ktest.pl
+++ b/tools/testing/ktest/ktest.pl
@@ -21,6 +21,7 @@ my %opt;
 my %repeat_tests;
 my %repeats;
 my %evals;
+my @command_vars;
 
 #default opts
 my %default = (
@@ -1286,6 +1287,19 @@ sub read_config {
 
     $test_case = __read_config $config, \$test_num;
 
+    foreach my $val (@command_vars) {
+	chomp $val;
+	my %command_overrides;
+	if ($val =~ m/^\s*([A-Z_\[\]\d]+)\s*=\s*(.*?)\s*$/) {
+	    my $lvalue = $1;
+	    my $rvalue = $2;
+
+	    set_value($lvalue, $rvalue, 1, \%command_overrides, "COMMAND LINE");
+	} else {
+	    die "Invalid variable definition '$val'\n";
+	}
+    }
+
     # make sure we have all mandatory configs
     get_mandatory_configs;
 
@@ -4242,8 +4256,37 @@ sub cancel_test {
     die "\nCaught Sig Int, test interrupted: $!\n"
 }
 
-$#ARGV < 1 or die "ktest.pl version: $VERSION\n   usage: ktest.pl [config-file]\n";
+sub die_usage {
+    die << "EOF"
+ktest.pl version: $VERSION
+   usage: ktest.pl [options] [config-file]
+    [options]:
+       -D value: Where value can act as an override.
+                -D BUILD_NOCLEAN=1
+                    Sets global BUILD_NOCLEAN to 1
+                -D TEST_TYPE[2]=build
+                    Sets TEST_TYPE of test 2 to "build"
+
+EOF
+;
+}
+
+while ( $#ARGV >= 0 ) {
+    if ( $ARGV[0] eq "-D" ) {
+	shift;
+	die_usage if ($#ARGV < 1);
+	my $val = shift;
+
+	$command_vars[$#command_vars + 1] = $val;
+
+    } elsif ( $ARGV[0] eq "-h" ) {
+	die_usage;
+    } else {
+	last;
+    }
+}
 
+$#ARGV < 1 or die_usage;
 if ($#ARGV == 0) {
     $ktest_config = $ARGV[0];
     if (! -f $ktest_config) {
-- 
2.47.2


