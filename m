Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37169277805;
	Tue, 22 Apr 2025 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326722; cv=none; b=GYyj4XYCTtOyj6mKfsfqYLhOLHtnEke63uiTEhGHoSNqMyTXSEx7xbRWUJwx/Idmm+RV/zlzT5Wi3QFZh5Te5Qn9MNlA+Qi/o3rs58+on5BoBIkQ6TVG9xFtQhWPNoKvQjherEOXKLsUq6GbL8Mtclcxb05/+Oax5teQjqKp/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326722; c=relaxed/simple;
	bh=sLvmh0xXz03b1n8p3I3OjCJD1USIuRy6gtjcc3HKS68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpUGGkpZe3ZEdhzv7JNoyJm6uXEDymZZ94w9ZfdAw0dI1g1uAMa7ffI5gRWv4Q0ZvE25emSj+qe6Djx3Mu9o5EFynu8GuYLPV/qEJyG2LtXxMRsU/19uydrkSLTxuALdZW5O8j/ZnEh2M8H7zExcgbOkxyJbRKkkC/BDvmf9ifg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id E4BCEC1A9B;
	Tue, 22 Apr 2025 12:58:37 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
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
Subject: [PATCH v3 1/2] checkpatch.pl: warn about // comments on private Rust
 items
Date: Tue, 22 Apr 2025 14:58:24 +0200
Message-ID: <20250422125824.30525-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250422125633.30413-1-contact@arnaud-lcm.com>
References: <20250422125633.30413-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174532671854.21235.5865498379948025370@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Add a new checkpatch.pl warning to detect //-style comments above
private Rust items that were likely intended to be doc comments (///).
This helps catch documentation that won't appear in rustdoc output.

The detection uses multiple heuristics to identify likely doc comments:
  - Comments containing markdown
  - Comments starting with an imperative tone
  - Comments with mention of params
  - Comments with code block
  - Comments with keywords: Returns, ...
  - Block comments longer than 3 lines.
  - Comments with references: @see, @link, ...

Comments are only flagged if they:
 - Appear above private items
 - Don't contain obvious non-doc patterns (TODO, FIXME)
 - Score sufficiently on heuristics

The warning triggered then suggests to convert flagged comments to
doc comments.

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
Changes in v3:
- Add heuristics to decide whether we should trigger the warning on comments
- Link to v2: https://lore.kernel.org/all/20250420194806.54354-1-contact@arnaud-lcm.com/
---
 scripts/checkpatch.pl | 110 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3d22bf863eec..eb564a119d68 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1987,6 +1987,97 @@ sub ctx_locate_comment {
 	chomp($current_comment);
 	return($current_comment);
 }
+
+sub ctx_detect_missing_doc_comment_behind_rust_private_item {
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
+		return unless $rawlines[$idx -1] !~ /^\+?\s*#\s*\[\s*macro_export\s*\]\s*$/;
+    } else {
+		# Check if it's a Rust item
+		return unless $rawlines[$start_line] =~ /^\+?\s*\b(fn|struct|const|enum|trait|type|mod|impl|use)\b/;
+    }
+
+    # Walk backwards through non-empty lines
+    $idx--;
+    my @comment_lines;
+    while ($idx >= 0 && $rawlines[$idx] !~ /^\s*\+?\s*$/) {
+		# Stop if a doc comment is found
+        last if $rawlines[$idx] =~ m@^\+?\s*///@;
+		# Clean the line first (remove diff markers, trim spaces)
+    	my $clean_line = $rawlines[$idx];
+    	$clean_line =~ s/^\+?\s*//;
+		$clean_line =~ s/\s*$//;
+		if($clean_line =~ m@^\+?\s*//@) { # Only add comments
+	    	unshift @comment_lines, $clean_line;
+		}
+		$idx--;
+    }
+
+    # No comments to check
+    return unless @comment_lines;
+
+    # Heuristic: Check for documentation keywords
+    my $keywords = qr/Returns|Arguments|Examples?|Panics|Safety|Note|Errors|See\s+Also/i;
+    my $has_keywords = grep { /\/\/\s*$keywords/ } @comment_lines;
+
+    # Heuristic: Markdown syntax
+	my $markdown = qr{
+		`[^`]+`               # Inline code
+		| \*\*[^*]+\*\*       # Bold with proper boundaries
+		| \b_[^_\s][^_]*_\b   # Italic with word boundaries
+		| \#[^#\s]            # Headings like # Title
+		| ^\s*```[\w]*\s*$    # Code block marker line (allow optional language)
+	}x;
+
+    my $has_markdown = grep { /$markdown/ } @comment_lines;
+
+    # Heuristic: Parameter mentions
+    my $item_line = $rawlines[$start_line];
+    my @params = ($item_line =~ /(\b\w+)\s*:\s*\w+/g); # Extract param names
+    my $param_mentions = 0;
+    if (@params) {
+        $param_mentions = grep { my $line = $_; grep { $line =~ /\b$_\b/ } @params } @comment_lines;
+    }
+
+    # Heuristic: Start with imperative tones
+    my $first_line = $comment_lines[0];
+    my $imperative_tone = $first_line =~ /^\s*\/\/\s*(Returns?|Computes?|Checks?|Converts?|Creates?)\b/i;
+
+    # Heuristic: References
+    my $has_refs = grep { /\[`\w+`\]|\@see|\@link/i } @comment_lines;
+
+    # Heuristic: Code block
+    my $has_code_block = grep { /```|\buse\s+\w+::|^\s*\/\/\s*\w+\(.*\)/ } @comment_lines;
+    # Combine heuristics
+    my $score = 0;
+    $score += 1 if $has_keywords;
+    $score += 2 if $has_markdown;
+    $score += 1 if $param_mentions;
+    $score += 2 if $imperative_tone;
+    $score += 2 if $has_refs;
+    $score += 2 if scalar(@comment_lines) >= 3;
+    $score += 2 if $has_code_block;
+
+    # Trigger if score meets threshold
+    return unless $score >= 2;
+
+    return ($idx+1, $start_line);
+}
+
+
 sub ctx_has_comment {
 	my ($first_line, $end_line) = @_;
 	my $cmt = ctx_locate_comment($first_line, $end_line);
@@ -2950,6 +3041,25 @@ sub process {
 			}
 		}
 
+# check for incorrect use of `//` instead of `\\\` for doc comments in Rust
+		if ($perl_version_ok && $realfile =~ /\.rs$/) {
+			my ($start_l, $end_l) = ctx_detect_missing_doc_comment_behind_rust_private_item($linenr);
+			if (defined($start_l) && defined($end_l)) {
+				for (my $i = $start_l; $i <= $end_l; $i++) {
+					my $comment_line = $rawlines[$i - 1];
+					next unless $comment_line =~ m@^\+//([^/].*)$@;
+					my $comment = $1;
+					# Skip obvious non-doc comments
+					next if $comment =~ m@^\s*(?:TODO|FIXME|XXX|NOTE|HACK|SAFETY):?@i;
+					next if $comment =~ m@^\s*[[:punct:]]{2,}@;
+					my $line_issue = $i - 3;
+					WARN("POSSIBLE_MISSING_RUST_DOC",
+						"Consider using `///` if the comment was intended as documentation (line $line_issue).\n" .
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

