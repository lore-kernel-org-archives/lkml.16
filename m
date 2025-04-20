Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE0D1A317D;
	Sun, 20 Apr 2025 19:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745178510; cv=none; b=IPCZBTf4ME1+zSjqDWQXJy8vcCnHBOQeQrq9/CT3Xl10IjHirOIpilu+w1rYl3GohbpxWV/Bt16uO2ZItMapBnqO4lA4UkDo/6soDN81akT3dcl2T58iD7Ix8PsVr6IW5lv9lvJiqFcgLsu0345NEeUtgEPAR5Gc/mpAwinllAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745178510; c=relaxed/simple;
	bh=4EwKkpS2ZqV9H5OCUZKK3dCZ1BtNrKYU9hXV5V4nlY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GeATNZU3okE9SQ0/yJgqKfeaNGmwpaCCSxyjtDdHRooaQr1+MbCsFfcPWVvS+Ul8V/4x04onroVNTyC26SbZc0SyBiXjTuYmiqk3mbrwX/ZstR4osYxMPSJ3nzlX0VZpVidCHNQwYl8OPrVjlkOoPn9dut7EhMz6MGCpstUqgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:729e:aceb:e7bf:d311])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id D13FB545B8;
	Sun, 20 Apr 2025 19:48:19 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:729e:aceb:e7bf:d311) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
Received-SPF: pass (Plesk: connection is authenticated)
From: Arnaud Lecomte <contact@arnaud-lcm.com>
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev,
	contact@arnaud-lcm.com,
	skhan@linuxfoundation.org
Subject: [PATCH v2 1/2] checkpatch.pl: warn about // comments on private Rust
 items
Date: Sun, 20 Apr 2025 21:48:06 +0200
Message-ID: <20250420194806.54354-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420184700.47144-1-contact@arnaud-lcm.com>
References: <20250420184700.47144-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174517850050.9276.9846534401847999489@Plesk>
X-PPP-Vhost: arnaud-lcm.com

This patch adds a checkpatch.pl warning to detect //-style comments
placed above private Rust items.

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Changes in v2:
- Don't trigger a warning when the block of comments above a private rust item
  contains at least one doc comment.
- Trigger warning on private macros.
- Link to v1: https://lore.kernel.org/all/20250419212458.105705-1-contact@arnaud-lcm.com/
---
 scripts/checkpatch.pl | 56 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d22bf863eec..e49857c23034 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1987,6 +1987,41 @@ sub ctx_locate_comment {
 	chomp($current_comment);
 	return($current_comment);
 }
+
+sub ctx_get_comment_behind_rust_private_item {
+    my ($linenr) = @_;
+    my $start_line = $linenr - 1;
+    my $idx = $start_line;
+
+    # Skip if it's a public Rust item (starts with 'pub')
+    return unless $rawlines[$start_line] !~ /^\+?\s*pub(\s|\([^)]*\)\s)/;
+    
+    # Check if it's an empty line
+    return unless $rawlines[$start_line] !~ /^\s*\+?\s*$/;
+
+    # Check if it's a comment
+    return unless $rawlines[$start_line] !~ /^\+?\s*\/\/\/?\/?.*$/;
+
+    # Check if it is a private macro
+    if ($rawlines[$start_line] =~ /^\+?\s*macro_rules!\s+([a-zA-Z_][a-zA-Z0-9_]*|#?[a-zA-Z_][a-zA-Z0-9_]*)\s*(?:\{|$)/ && $idx > 0) {
+	return unless $rawlines[$idx -1] !~ /^\+?\s*#\s*\[\s*macro_export\s*\]\s*$/;
+    } else {
+	# Check if it's a Rust item
+	return unless $rawlines[$start_line] =~ /^\+?\s*\b(fn|struct|const|enum|trait|type|mod|impl|use)\b/;
+    }
+
+    # Walk backwards through non-empty lines
+    $idx--;
+    while ($idx >= 0 && $rawlines[$idx] !~ /^\s*\+?\s*$/) {
+	# Check if is a document comment
+	return unless $rawlines[$idx] !~ m@^\+?\s*///([^/].*)?$@;
+	$idx--;
+    }
+
+    return ($idx+1, $start_line);
+}
+
+
 sub ctx_has_comment {
 	my ($first_line, $end_line) = @_;
 	my $cmt = ctx_locate_comment($first_line, $end_line);
@@ -2950,6 +2985,27 @@ sub process {
 			}
 		}
 
+# check for incorrect use of `//` instead of `\\\` for doc comments in Rust
+		if ($perl_version_ok && $realfile =~ /\.rs$/) {
+			my ($start_l, $end_l) = ctx_get_comment_behind_rust_private_item($linenr);
+			if (defined($start_l) && defined($end_l)) {
+				for (my $i = $start_l; $i <= $end_l; $i++) {
+					my $comment_line = $rawlines[$i - 1];
+					next unless $comment_line =~ m@^\+//([^/].*)$@;
+					my $comment = $1;
+			
+					# Skip obvious non-doc comments
+					next if $comment =~ m@^\s*(?:TODO|FIXME|XXX|NOTE|HACK|SAFETY):?@i;
+					next if $comment =~ m@^\s*[[:punct:]]{2,}@;	
+					my $line_issue = $i - 3;
+					
+					WARN("POSSIBLE_MISSING_RUST_DOC",
+						"Consider using `///` for private item documentation (line $line_issue)\n" .
+					"$here\n$comment_line");
+				}
+			}
+		}
+
 # Check the patch for a From:
 		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
 			$author = $1;
-- 
2.43.0

