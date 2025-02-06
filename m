Received: from sienna.cherry.relay.mailchannels.net (sienna.cherry.relay.mailchannels.net [23.83.223.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EBF1CEAC8;
	Thu,  6 Feb 2025 21:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.165
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876089; cv=pass; b=dlxOGyRmehnQK0YndB+Dua3z+qPECV0VgLVwlJbIbqlDXkC5aZK0C4wpZNTt+cmbyk5TQlD/SsRgIUVlo+8RaMaBPbZRF4hVxr8U3M42I+ZeSy4ucRYuyMV+mmfNwPhdOsTp1axvMUBjnzDNGJRIrTjWYppTLh4WhvZED51GPNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876089; c=relaxed/simple;
	bh=7L31dPYGw7Pxe40Cf9TC1lYjwHWfvUUWN98ZTOblSOw=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=ae+oKpktqWMSBQociRFcI6RMsNzIPpcPtWbEiccaq8IxLeMeGCUE6Ot8pHfUIYiQR8ljBV8nu9+rBrBLaX0Abnit/366iYErhSGTGMVzEBfuafJ8YpWK4B8F35xgcNmjHe/C0Ev8yYgk2GM0MFYNAolU/MxtPeXbhLx8B3bhrVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=L+QWLl/N reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="L+QWLl/N"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 309A64E4B48;
	Thu,  6 Feb 2025 21:08:01 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-0.trex.outbound.svc.cluster.local [100.127.46.110])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 339CA4E563E;
	Thu,  6 Feb 2025 21:07:56 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876080; a=rsa-sha256;
	cv=none;
	b=3qk3bG01wNKYS3Z+8vCipPFu1fafB2gVQ8idDweUjahL4roEX1CAaTH/Wsh8fzFIbTKMwY
	yDVcCjluTsMM3VwRFoNpVGXQvr4LDzB3+hN/WmtJ85CcvipdHg8YCU1aDUFeuIRHI2DJs8
	EMmQTbvFOKS75GZO9H80olQj/Vuag5zWqnLbRUiL6e3NOypO4qUqgPldo+VgwjNX0Ya6pl
	VR2ZtSPgkTgkM7KBybcs/AeMbg8r6Vn8ulToc9GUqW0j7sseuX/WU+/CYTsN3jKDHk1BRR
	1vSMkH7MgcoqrfwDKLzFXd2dYtlqdqThK3Y1DZF0p+kAHKwzzcj2Qoi1Pr8oIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=mboWAuygJDRJOd489iUzrH063I+FbtqSBfcS25mYKxc=;
	b=wDcNfOaR/miavz00fjUHj1sAX7Y7Ogdv8KP0IwFRxJTUll56iQUC9HlZ1iWy2XQEpbVmWD
	S11DUCHoPCjfi63v4OeuB8mBBaZaIktjsKfwqaLgJkqAmxULSwRE8gkUsQVpNik3zGLga9
	UqbJRFcH3QYTY67w4GkCWDRB4qgG8d7TbIUa1IBTxZ6EmBTdnKck/Pve3M3V+HsFAuDciD
	FuD66l+yCOJwkSGfKqUREGtjpMa89UXG8VD9AMv2B5YSPJfHKKCkog32FtWMdfkj9Q46rD
	Gt0a3PwH0oLbiYb4d+a5Bb0n5mT758gnXXvdT5digTYfBcWtQp81vw8P/evgQg==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-xmhdh;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Trouble-Callous: 7200ee0e378d10d3_1738876081058_1262071984
X-MC-Loop-Signature: 1738876081058:3642678018
X-MC-Ingress-Time: 1738876081058
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.46.110 (trex/7.0.2);
	Thu, 06 Feb 2025 21:08:01 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mboWAuygJDRJOd489iUzrH063I+FbtqSBfcS25mYKxc=;
	b=L+QWLl/NIGljSUgPyFWB0NYmjel8p4RdAxtIbPYzN3RoZTFasyqPIN0TcwWC0wweDt6F3f
	Wae/td6B5LnjGTEgJDcf1jxTsLdKlece/X2KKxS1PQZ8FfOM/Ydd2/kdYAWEXgQMoJyGRr
	rSzh6yeqnMQtwoQyq9cizGTyAbAO0g8KLffMjD1MaJzzkB9cKCIZVo0VmRpF2qCynbztxi
	e1tgkWFvhvELjp94fKyLWW9ShCAA1aX7pOTVh/rXfZB15XTIrjuMW2hAfikGwmTHq358NU
	1bItBnuaRwZjxUB3hWBSWjit9K3CX5IRqqs8XAekFNZWnliMT88DEfEqcwBW9w==
Subject: [PATCH v3 2/6] rust: error: add missing newline to pr_warn! calls
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-2-a85273b501ae@invicto.ai>
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 David Gow <davidgow@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alban Kurti <kurti@invicto.ai>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Fox Chen <foxhlchen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=1035;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=7L31dPYGw7Pxe40Cf9TC1lYjwHWfvUUWN98ZTOblSOw=;
 b=5NY9J+xUMZNQlhO9wORf3WMxkYDAqjsEjCtxJK8zBrAIV7XPj9JP9Ro5v6D3uNgJWCm9XMLJy
 ob7o4tT+2VhBeOsvnpmhcjTGPmajbIXZUEwVmj6Ti3ejd5n1zIDqinY
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:53 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524aa a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=a7_a2XaVlCDEdv-p5PoA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfGaF6Dw32A7ngSBQwII2tyW85uHilPVB+nnbOOKMIurIo3X5lTWumOjJpiONd6WfhobJa0a8iyYUl1UOeV0RTUDSBC8ATVeZie9E+o+5f3B0LL3tEiKj W+n6ZC6yVV2L9Y4RyyqJAfdjyEbdIkp8prrs3FknMmYgq8U9Yj9NpZ8iQd9tth6sBmKtoQ5KY9c1hrF3/+zfwzseaqyVtpucqJOYMKf0XFQbyTgPVm8RZbu2 bpSskbFmTXpLfclX2YOvSmq/2b9g/7LhCzI3HIdHyqR8QuFnzx5pD0HwB9jS6dc99h2lJ7Uo3vGnkGUrxJsdKfujw3M2tFbCTq7C1AwD/nGo9sk6nOs4B53B 4AefMfFjZnBWWRKyOCUw7A9KCsRM5+anbbm8FdE0dhfvxlDwGKd1ifAEx1gvMqARall3RuSPAXjV3qAvJr6p7HnqtgCF2YSYzfmvJY2hCVSfC+LSR990yL2f RAn9GKmuXi19K/RpEp5AsBuf1zgOsMTthwGBINHHNY8HbMXvVf+N+GG1gizuAQVg2oBWpAdbBdiL4SnXAi0IrCJpRG72qjSGaM85ZFJx4fJV8Vsorp62Vj9r 7G3UQjvHjq1tfDif1KbzcxPsqoDdLwL5slI/XJlXhEWUb4BlBiBoaD24DIgTYBLnjfiY1P/L103qERPjV4HI7GNKbxUQhZZOq1UQvmmyAuljxS6T7T/8p47t 0asC7Be5OKTZxSzVSlAO3t+XdPJqHY+O1w8WvRdPn+q08c9FDGZLJj0URZwxUKMuMEdMJlYRS3yRt6zVNobxO90/KYLQZSosLmeI+KSKAOOY8ykASz4LtN+X JUbfqrQ4tjvXlgiXS5W+ksiohqCem21Hu0diFGoKm62kVGc3WTZbL34L2TJW4umrgGQGnWCvzBivtX59ozdqsvSNe9yVFT4nZkat1kIltDAdwMKoALhkuDjW QS6Kk/PeYaA/f9y
 IkOZ1INlKCkgL68dOn+usqQZ4/TouDeF8
X-AuthUser: kurti@invicto.ai

Added missing newline at the end of pr_warn! usage
so the log is not missed.

Fixes: 6551a7fe0acb ("rust: error: Add Error::from_errno{_unchecked}()")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 rust/kernel/error.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index f6ecf09cb65f4ebe9b88da68b3830ae79aa4f182..a194d83e6835c03b84cc849b641ce8fff548047d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -107,7 +107,7 @@ pub fn from_errno(errno: crate::ffi::c_int) -> Error {
         } else {
             // TODO: Make it a `WARN_ONCE` once available.
             crate::pr_warn!(
-                "attempted to create `Error` with out of range `errno`: {}",
+                "attempted to create `Error` with out of range `errno`: {}\n",
                 errno
             );
             code::EINVAL

-- 
2.48.1

