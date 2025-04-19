Received: from plesk.hostmyservers.fr (plesk.hostmyservers.fr [45.145.164.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7977155A25;
	Sat, 19 Apr 2025 22:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.145.164.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745101516; cv=none; b=dPR+7dI6ckf6ZQkXdHNvIbzPqjScwaIxg5HDqdnTwcAXROz5RmdAJrd/UkJ9jFrnREodstr+isjQmLBTINysEZuSv+463lTpKfWbmJpOty3EZ/ddMJlD1QcxqaT6CHwR77l6yeQVxT29ioqAIJwaChO9EtrW4nIX+tKBIEYLgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745101516; c=relaxed/simple;
	bh=cdTNpfhuay5ffdJi1HZdHnOCA6ro26dkIyJFUgZ1ct4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V29BtzkWj1N8+LxAEtJMVVVHMPAuc3jwHv8SVj8vYfkrVlvqzkgvVRPczgHRuIBilJbJxGllbyCQW9XWmB8gaopBZtT11suvO+BjN5n3/TbcbO8oPa3ubod4KKP566DpqXpH3MxenwvNIleyvjDwopsr8MgI0widDno8edtHMXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com; spf=pass smtp.mailfrom=arnaud-lcm.com; arc=none smtp.client-ip=45.145.164.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arnaud-lcm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arnaud-lcm.com
Received: from arnaudlcm-X570-UD.. (unknown [IPv6:2a01:e0a:3e8:c0d0:8155:f81b:b47e:43cd])
	by plesk.hostmyservers.fr (Postfix) with ESMTPSA id 5A23B539BD;
	Sat, 19 Apr 2025 22:25:11 +0000 (UTC)
Authentication-Results: Plesk;
	spf=pass (sender IP is 2a01:e0a:3e8:c0d0:8155:f81b:b47e:43cd) smtp.mailfrom=contact@arnaud-lcm.com smtp.helo=arnaudlcm-X570-UD..
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
Subject: [PATCH 2/2] checkpatch.pl: add `--fix` support for `//` comments on
 private Rust items
Date: Sun, 20 Apr 2025 00:25:05 +0200
Message-ID: <20250419222505.9009-1-contact@arnaud-lcm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250419212458.105705-1-contact@arnaud-lcm.com>
References: <20250419212458.105705-1-contact@arnaud-lcm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <174510151196.16436.13846620260833130321@Plesk>
X-PPP-Vhost: arnaud-lcm.com

Extend the Rust private item documentation checker (added in the previous
patch) to support automatic fixes when the `--fix` option is enabled.

Signed-off-by: Arnaud Lecomte <contact@arnaud-lcm.com>
---
 scripts/checkpatch.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7ef658a70bfc..ce3ba9af6da7 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2992,9 +2992,11 @@ sub process {
 					next if $comment =~ m@^\s*[[:punct:]]{2,}@;	
 					my $line_issue = $i - 3;
 					
-					WARN("POSSIBLE_MISSING_RUST_DOC",
+					if(WARN("POSSIBLE_MISSING_RUST_DOC",
 						"Consider using `///` for private item documentation (line $line_issue)\n" .
-					"$here\n$comment_line");
+					"$here\n$comment_line") && $fix) {
+						$fixed[$i - 1] =~ s/^\+(\/\/)/+$1\//;	
+					}
 				}
 			}
 		}
-- 
2.43.0

