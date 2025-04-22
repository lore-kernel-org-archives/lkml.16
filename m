Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EE7280A38;
	Tue, 22 Apr 2025 12:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326743; cv=none; b=O6yb1f0wXZn01WxsO02bc6uSpyDx4v6t/w14NbWeVxMNs7VEN9O+68VzUbaQSBeT+irY4rXeiiIR/D+lQCVXtk34z2LgVprXDME95Lo5k69mS7CjWkH1YxApNTJ1O/uyiNJA8yn9jnzbb4McpZDvo60bRONky/d40Lnezbyl59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326743; c=relaxed/simple;
	bh=v5G3qfsWjeK8GaLIWFfaG5GoaLyq3iNELLsIU4qdgBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEYaiywbxwppTwN/iCk7xi13MgMs2yArhYiHxp+zd1xOBG1euwq7Z1TfbOHxSTFrqZ3qngiJYGuc4tIQZZ9XlagaDql70P7sKkRfjAYbBPXaJR2jDhDNfJ5PHkyYKoVtTTit31Gb9cPdX6oqN7brqmUjGeuFeKn0ARyywgmQckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id EF8C0C1A9B;
	Tue, 22 Apr 2025 12:58:58 +0000 (UTC)
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
Subject: [PATCH v3 3/3] checkpatch.pl: --fix support for `//` comments rust
 private items
Date: Tue, 22 Apr 2025 14:58:52 +0200
Message-ID: <20250422125852.30550-1-contact@arnaud-lcm.com>
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
X-PPP-Message-ID: <174532673956.21423.11992309333932198771@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Extend the Rust private item documentation checker (added in the previous
patch) to support automatic fixes when the `--fix` option is enabled.

Link: https://lore.kernel.org/all/20250419222505.9009-1-contact@arnaud-lcm.com/
Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 scripts/checkpatch.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index eb564a119d68..ad3ae5fdd830 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3053,9 +3053,11 @@ sub process {
 					next if $comment =~ m@^\s*(?:TODO|FIXME|XXX|NOTE|HACK|SAFETY):?@i;
 					next if $comment =~ m@^\s*[[:punct:]]{2,}@;
 					my $line_issue = $i - 3;
-					WARN("POSSIBLE_MISSING_RUST_DOC",
+					if (WARN("POSSIBLE_MISSING_RUST_DOC",
 						"Consider using `///` if the comment was intended as documentation (line $line_issue).\n" .
-					"$here\n$comment_line");
+					"$here\n$comment_line") && $fix) {
+						$fixed[$i - 1] =~ s/^\+(\/\/)/+$1\//;
+					}
 				}
 			}
 		}
-- 
2.43.0

