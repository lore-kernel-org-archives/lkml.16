Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965D27CCE2;
	Tue, 22 Apr 2025 13:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745326964; cv=none; b=bxPWri6H7L5xc+yprtGk+b9uo66x6+CAHkM78znfhMdUTowr0R41Z3a2oaD14PPKVCALuDvWNaYzrhRpUDG76sJXEE69TyZyL1PFA97yaB9PgJG8hYdi3OiAktbQuSay7HzenU3Pg66aLlXE2egCkp3m+tgAYQiwlY+j0eunTAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745326964; c=relaxed/simple;
	bh=v5G3qfsWjeK8GaLIWFfaG5GoaLyq3iNELLsIU4qdgBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ef/yvG+0j0H2NDOdY/cUAJ8RGgOx5uq/ixRoBOC6b7a9ZYpIcVlGj7BmAdyXsuqFa8MKqymowBwI8F9phmN9CEiQyV73zF9/v5xyy6B7s58sNTLVu5TvPMqfWuTPuiKUs8s1f/zptq5wDSg84xEx6KsfA0ABgVkruUzdoSt2tUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:c864:fba8:3048:a3c2])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 43EB828AFAB;
	Tue, 22 Apr 2025 13:02:40 +0000 (UTC)
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
Subject: [PATCH v3 2/2 resend] checkpatch.pl: --fix support for `//` comments
 rust private items
Date: Tue, 22 Apr 2025 15:02:33 +0200
Message-ID: <20250422130233.30881-1-contact@arnaud-lcm.com>
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
X-PPP-Message-ID: <174532696092.25082.15174238390085876202@Plesk>
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

