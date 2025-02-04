Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DB13A265
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 01:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738632508; cv=none; b=leDOKwLnKXR3WHNxPuICDH+B6TTVtH7XTRJjEKghlRw7hjTMQYkH2YrV1MQjXguCrYJJNhbjk6aeC2b1npfz7HceRnomwQDiryWyYUT/qdFRINFzQ6w3x01L02/5tk6T0dLw+jk6A9JLalggQVq13XBEi4dd+6nkt0jATs4ZT8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738632508; c=relaxed/simple;
	bh=psfIx+WTCVEKKF13dXpL3qIBLXlTnhiIzjy/QG/PPbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m2wODqBCQUA5EfkCrPNz5DTfd/WGX1hu6jEx/TucKG+CVkIav5kvJ4M3o2D4+vch7LdMTUg/mPb8gHjmSJj5k2rMADiZAnNPCQwdmXYYHyP0SmTYK76lc0UOWDbCoi6hc/Zxrt4Yr8WQ51Gsmf5grfOr4lR7156SG9Z9z9QvYeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2q6U+ED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2q6U+ED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE8EC4CEE5;
	Tue,  4 Feb 2025 01:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738632507;
	bh=psfIx+WTCVEKKF13dXpL3qIBLXlTnhiIzjy/QG/PPbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l2q6U+EDVBgdqeZGC6BBkBbbb4BIlPKoVysiNE71bWWHUFJtQdOb/unPmkjGDyX9F
	 47bI+3IhESjJBgQsMixqa29wKkql7R7fD5nYeGyoUaZGLsTcNy7xbDLpisapbaRR1S
	 S0PyYLBC94gutTNWZOb3nLvaLfulMJoprhmdTErT5mjRlzVl2Xz7rVQkNazkBnh2n4
	 g1AaQ5b1kNPCuwew8GVSqJ0SqKSFCX46JhHvqxgrM68TfbkUW2iuKUA2HrtpLkvfk4
	 tNS3qVj6zMTfqLErznSC2wuJTJ28vkLHX7v7xdRXcmYZgkIO5L7x3WIjRBmHppei8d
	 /Pn+7BPTw0Gjg==
From: carlos.bilbao@kernel.org
To: apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com
Cc: bilbao@vt.edu,
	linux-kernel@vger.kernel.org,
	Carlos Bilbao <carlos.bilbao@kernel.org>
Subject: [PATCH 1/1] checkpatch: add --branch option to check commits in current branch
Date: Mon,  3 Feb 2025 19:28:22 -0600
Message-ID: <20250204012822.1379477-2-carlos.bilbao@kernel.org>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250204012822.1379477-1-carlos.bilbao@kernel.org>
References: <20250204012822.1379477-1-carlos.bilbao@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Carlos Bilbao <carlos.bilbao@kernel.org>

Add a new option --branch in checkpatch.pl that checks all commits made
in the current branch since it diverged from its upstream branch. If no
explicit branch is found, it prompts the user to specify, defaulting to
'master' otherwise.

Signed-off-by: Carlos Bilbao <carlos.bilbao@kernel.org>
---
 scripts/checkpatch.pl | 68 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f7087dda9ac9..1f929fcf298d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -73,6 +73,7 @@ my $allow_c99_comments = 1; # Can be overridden by --ignore C99_COMMENT_TOLERANC
 # git output parsing needs US English output, so first set backtick child process LANGUAGE
 my $git_command ='export LANGUAGE=en_US.UTF-8; git';
 my $tabsize = 8;
+my $branch;
 my ${CONFIG_} = "CONFIG_";
 
 my %maybe_linker_symbol; # for externs in c exceptions, when seen in *vmlinux.lds.h
@@ -142,6 +143,10 @@ Options:
                              is a terminal ('auto'). Default is 'auto'.
   --kconfig-prefix=WORD      use WORD as a prefix for Kconfig symbols (default
                              ${CONFIG_})
+  --branch                   This option checks all commits made in the
+                             current branch since it diverged from its
+                             parent branch. If no explicit upstream branch
+                             is found, it will try with 'master'.
   -h, --help, --version      display this help and exit
 
 When FILE is - read standard input.
@@ -329,10 +334,73 @@ GetOptions(
 	'no-color'	=> \$color,	#keep old behaviors of -nocolor
 	'nocolor'	=> \$color,	#keep old behaviors of -nocolor
 	'kconfig-prefix=s'	=> \${CONFIG_},
+	'branch'	=> \$branch,
 	'h|help'	=> \$help,
 	'version'	=> \$help
 ) or $help = 2;
 
+if ($branch) {
+
+	my $result = 0;
+	$branch = `git rev-parse --abbrev-ref HEAD 2>/dev/null`;
+
+	my $upstream_branch = `git rev-parse --abbrev-ref --symbolic-full-name \@{u} 2>/dev/null`;
+
+	chomp($branch);
+	chomp($upstream_branch);
+
+	if (!$upstream_branch) {
+		print "No explicit upstream branch found in reflog, trying git branch -vv.\n";
+		my @branches = `git branch -vv`;
+
+		foreach my $branch_info (@branches) {
+			if ($branch_info =~ /\s*$branch\s+\S+\s+\[.*\]$/) {
+				if ($branch_info =~ /\[([^\]]+)\]/) {
+					$upstream_branch = $1;
+					last;
+				}
+			}
+		}
+
+		if (!$upstream_branch) {
+			print "No upstream branch found. Would you like to specify one? [y/n] ";
+			my $response = <STDIN>;
+			chomp($response);
+
+			if (lc($response) eq 'n'){
+				$upstream_branch = 'master';
+			}
+			else {
+				print "Please enter: ";
+				$upstream_branch = <STDIN>;
+				chomp($upstream_branch);
+			}
+		}
+	}
+
+	print "Using as upstream branch: $upstream_branch\n";
+
+	my @commits = `git rev-list $upstream_branch..$branch 2>/dev/null`;
+
+	if (!$commits[0]) {
+		print "No commits found between $upstream_branch and $branch. Exiting.\n";
+		exit(0);
+	}
+
+	print "Checking " . scalar(@commits) . " commits...\n";
+
+	foreach my $commit (@commits) {
+		chomp($commit);
+		$result = system("perl $0 --git $commit @ARGV");
+
+		if ($result != 0) {
+			exit($result);
+		}
+	}
+
+	exit($result);
+}
+
 if ($user_codespellfile) {
 	# Use the user provided codespell file unconditionally
 	$codespellfile = $user_codespellfile;
-- 
2.43.5

