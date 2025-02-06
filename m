Received: from seahorse.cherry.relay.mailchannels.net (seahorse.cherry.relay.mailchannels.net [23.83.223.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ED81DF270;
	Thu,  6 Feb 2025 21:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.161
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876098; cv=pass; b=u3KzmXEa0EopA4R/s2HYFbr85gx7B2QKHPSWUFqoP8Y9Tt2wUDI53+u42BQ26oB21X3YSla1LJq1bte3AHx4SPIEQJKKVCduHE/868PQktKEKdXlT3Ds3zPKjjJsdj5Jl8/Zkho1GhDPDmSopasQahpN0vqCbC3pHIllEJW+7zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876098; c=relaxed/simple;
	bh=Dk/Fa6RXmzhRQdv0qguvoAWvZrZfOdR+7TeALJAqGSU=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=YhCx5pulkj2ld3lGW0XcEVVB+lnq2kYG6wCVnWbrobsx+kT7XLYYm9YG21lEWvrtxIMEW5f57FGdjKM47uMMpEVxCXnTXqZxvt+cEW5lf5U91GwdduyoitrddXUoxjBRu24YMBfAcjS9xw3mryk7CM5pidyrgxu2g7W0CX+oKjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=U7JYa2M6 reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="U7JYa2M6"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 10B931645E9;
	Thu,  6 Feb 2025 21:08:09 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-9.trex.outbound.svc.cluster.local [100.124.213.208])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A45EE163EE6;
	Thu,  6 Feb 2025 21:08:01 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876088; a=rsa-sha256;
	cv=none;
	b=bSP/4kCY+vXD9FHAxK3ECGmENi3QY9qfv3WNjT9q6RmtIe2NwGbacVflLTsg04thapOsw5
	542Bh9ogmjPfH74tatv+o2zhd9nzx7Pm4jPvPjHnioAgLiNViSBTJyQOMpmChE5pa+cQ2J
	mOSED40yGGEHzchoy9qT3vcaKJOV0KdLTTE/3CYyeV6sdiJRXtYV2jFFKxvMtSQjEhhQd5
	odBn5V4Oa1XGALrhMQyf0YAiy2NqeeWKjdtPUIepTpapylqa0HzrXxchOTJS6b8YWe12An
	5vDj5d/Wl+PoS9zNt9Ugi/eMyyZggVTroq+6LMrtbG2FMIHFdpgboZSMkOvc2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ZhpLIq9iFJvhqgLiSK+xAjgUUwQGLpQH0XTHM0rA0ss=;
	b=JXkee8M3XhyFrvzjNs0CsX81WRQvumaYdDz21pSlZdeS7MdL4aAGmE6S47GowWOkFWRV0z
	NDd8YCeQrRmYflseICMBc/BchCBofoGkzBUDqyWimBoUYVXQkp4KJvMGtrUZT90o8/Ujo9
	7pGS2ZZ+t4NuLy9uQUJBIELfTWKJOtuYWvNVa8VX+w/pgijua/r+Hs62E2NepWgshPLR4R
	DAFmZfQLBgdJTIG4JikCI6WLe0qHKv88k28Lm8lJ//IC0HQM/bg7qQBTH2HLImpknbtKYW
	7GhsjVklkM3EhLtsriUkhFfuMsFEjK2pMBj0k7bO1bbATn35uiroOS1TJzIj/g==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-zkzf8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Plucky-Tart: 67652802074b8bf0_1738876088589_1794236910
X-MC-Loop-Signature: 1738876088589:3020997883
X-MC-Ingress-Time: 1738876088589
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.213.208 (trex/7.0.2);
	Thu, 06 Feb 2025 21:08:08 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZhpLIq9iFJvhqgLiSK+xAjgUUwQGLpQH0XTHM0rA0ss=;
	b=U7JYa2M6zLbgdq3dD+J/69XFuwQeETLwF7W9BocTEUKgIUrVBmITzyXod12WJrq+4nH/Y/
	ZaZ4UsdUr3l9xWbdmaS1fCpfW8IQNvZeIaFEyQE2E027rfvbNNulBAwhZHpiEZ3EJQoX6h
	2ZMy2xsBC5FZGgaEc9CyxefZOjbI1X5vlW9TwjbABqiCDi5Es2F+XaDasKdG0IejXiuA+i
	G/UwIorbDOBolcL3JQ74WXQ956stcQPBfAcNTIIyGA88tYm8ukYpEcHVs85OwoscUbFLRp
	gJJUgKrl0M/9cKDGWn3H/baEmzdw0bE0JQsdbHdbRYOsaCCJgGjIoVfT9LmKAg==
Subject: [PATCH v3 6/6] rust: samples: add missing newline to pr_info!
 calls in rust_print_main
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-6-a85273b501ae@invicto.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=1836;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=Dk/Fa6RXmzhRQdv0qguvoAWvZrZfOdR+7TeALJAqGSU=;
 b=/d2nSDIhhSGGJCAwLpmENScPF0743qpkJbNwez1ylf7fHFNs9PHDMxMFTvGR1ulXE/IKNc9O8
 rn0sNEtWgyLBh7g6iVOTC4ifbPpn/mCxliUNgQjSo+niH0wXfM4ewem
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:57 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524ae a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=FcvrMFPuEi2Jl8-4TIoA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfBc1mrP7eMiwYiSWN9lpbOhKgdKFPuGHKx/mBwefHzzLTAFz+TZoaVWCdSpFfFDYzHr3It4Ma8aGSRrsx/uEEeBd/FLUDMf9V3IaIKDNd0FBRpw+Gra1 KDMBpGiCMUz6b8sHhojlsOtJyll4454/+A/KQJ/10sFsWW//UpEpoK7d+3V0ocg5rf20FF+qdCqU3RAvUZlDEp69nRMG6VLmvRrOttd+PsPIOp3vXA3L0HF/ aW+gwaLUMlDUpLeZAavIhRIw7hJ9vC7N1JwnFFpcZmBbd7cVKoyznH/ZJMSqufXvhezcqiL+XRxH5ry+n+JESq78tuDH6tphGmsDEdEwYZdZcktcFspfW52a rY0CM6Jn+D+A3Scxpqq0XUjokT7MKgBmMoBfFFYyhGfOzgDF3iUwkLlsQ1lWj+ZKXXPpZDvcXmLWRk7BTfXl/4tGjffzd1WpwQf+yFehTmRWLGxkOChuEoJl g0TikBpKKS4lj4iVwJPubSTxjrLJlG6Pe1XbNq+/NN8osFfpd6eovj1xsF2DLcF217KH4111vifzlp1gKVUomP5iEn1lk/+JvCmICJIJj54OkYw15aCnddGa AsvQ1LeEsvcWAzp9D27EUj3JcW/+blfVydwGJW1gZH2kx6Owb4WU6AO9d4qJdvi+6vJFA0YCQ2xV3aD9rsG92ocY6xUsJcx0Bmiion20U7R6guNV1leZrU0w 0c9Vdq0SG9PAYnU+0zqCOUCQHATTYtq7e9+xdM3yaWe4EI16h9nidWptEfCDnVASvFfx7joWGdshXJTnG4nQ6tBmlhqgUR9qH4iBOL2fLofMJYkM9JBk24jB CnMNGwxzpxOV/WsgPUKxo2fA+AIw9zpIm83K2BpfCqwNFqdh7R/ZMb60gphRqSXyH6W7fUGvN9B4ekUo2zwdxo/ew964CaLpEMto8qelT7VnwyEfGr1yGGPX Q0taS07mn/Fl8mu
 KB/AjWO/b3zDfPvVNzxB3Iylb4ONl3WXg
X-AuthUser: kurti@invicto.ai

The sample code in samples/rust/rust_print_main.rs contained pr_info!
calls without a newline. This commit updates those calls, ensuring
that the output is properly formatted when the sample is run.

Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc printing")
Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >= 1.84.0")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 samples/rust/rust_print_main.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 7e8af5f176a33925881c7d65b34c823028b7b93b..7ef3cecc65a15627276699c691273608253c9df5 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -23,10 +23,10 @@ fn arc_print() -> Result {
     let b = UniqueArc::new("hello, world", GFP_KERNEL)?;
 
     // Prints the value of data in `a`.
-    pr_info!("{}", a);
+    pr_info!("{}\n", a);
 
     // Uses ":?" to print debug fmt of `b`.
-    pr_info!("{:?}", b);
+    pr_info!("{:?}\n", b);
 
     let a: Arc<&str> = b.into();
     let c = a.clone();
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use core::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }

-- 
2.48.1

