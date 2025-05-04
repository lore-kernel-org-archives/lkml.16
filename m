Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2EC525771;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746373295; cv=none; b=h6bIlULfPIU0sWRPh99P9gCmJkq6Fxwekmrfl/aH5W+pbbw5XtJMudJxwhxaQKsDI+RHxZ0TUAsyko18t4+PexM3IAnfdJ8MVpqfYaJ0LXwQ05nDOM9D9yfA9tKXcZlnOlpUskBEq/hL+2b8qEEdP8F/tm0qihT6RCuPF31vzjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746373295; c=relaxed/simple;
	bh=1cBdEpcvMFybvOQ8uSvYyiWsiuwoC6kZ4LAfj3DpQ84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pINPVwfI2hCjok4834jNXIixh9SrPY/IMkmrbhttViVrs9vOwhU8xUIzD4ntWlyHOQTy6qK5qkOJjxuexe0OGQIkQ9kr9CvoiT6um3M3ovJHy+S4uPXtRrhb5pqTZ5cQ/vGDUvzolGCdbIPT7gjEtj3JSrNjM3zsB5Xhd1kuhCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6anp4QV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6anp4QV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5DD6FC4CEED;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746373295;
	bh=1cBdEpcvMFybvOQ8uSvYyiWsiuwoC6kZ4LAfj3DpQ84=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d6anp4QVmkOZLpZzByHuo4sMoF4qFAlz/JYaCg3I524uarG6Splei2T1CV/5CbKbo
	 MC5HL1+7pxUPx4JQnAv0P6Qdut7bP8h+aE0KVL02ErtMKZs+JYaNeReuGTGp80+2aQ
	 vthjXPcdoWxj+nwwP7rIX605qEDxxVKF7OZURBDsxWqX5s9Exbx70F4o4+vrsSjE7P
	 nIvX1dp9XxHAeYydNoRaiuO3So4XlLJf6T4zfX24whNz1VX7iyVAsXSgjtAYm149eI
	 Yj9ZbGGoNn3pcLBnxvOjPmJsYQ5xnRqm73Mzpl0ywcLJjv7CEsKvoYhsl/7QaFiV3l
	 +34M9++uPOWSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA9BC3ABB6;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
From: Alban Kurti via B4 Relay <devnull+kurti.invicto.ai@kernel.org>
Date: Sun, 04 May 2025 17:41:14 +0200
Subject: [PATCH v4 1/2] rust: samples: add missing newline to pr_info!
 calls in rust_print_main
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-pr_info-newline-fix-v4-1-53467c401eb6@invicto.ai>
References: <20250504-pr_info-newline-fix-v4-0-53467c401eb6@invicto.ai>
In-Reply-To: <20250504-pr_info-newline-fix-v4-0-53467c401eb6@invicto.ai>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: Fiona Behrens <me@kloenk.dev>, Alban Kurti <kurti@invicto.ai>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746373294; l=1213;
 i=kurti@invicto.ai; s=20250504; h=from:subject:message-id;
 bh=WqmT9bkLvd4AJUblF1ztL4Nd9ksadB1FIaF6HWuwtwM=;
 b=60ax0KZSu0JTP+EZvd1+mR/HafmRHqulLSczy1JexTcm9XkIAOj2Gkr3yi6SjHvNU2JtPr2xT
 GEVLEpXPZLgAs2juJZCq2slmDnoy6qiQLckZiqWhiWW3wB2uwtsxq8C
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=7724GF1zrN6rA3Z2xkyAmVGkoOQxv7bMUvXB4IsIPUs=
X-Endpoint-Received: by B4 Relay for kurti@invicto.ai/20250504 with
 auth_id=398
X-Original-From: Alban Kurti <kurti@invicto.ai>
Reply-To: kurti@invicto.ai

From: Alban Kurti <kurti@invicto.ai>

Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc printing")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 samples/rust/rust_print_main.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 8ea95e8c2f3647650577c4e9dab853e0e3a8bf20..899a6d25f4dc0e0ccebdf4f95aaaf780b425e3af 100644
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
@@ -53,7 +53,7 @@ fn arc_dyn_print(arc: &Arc<dyn Display>) {
     }
 
     // Pretty-prints the debug formatting with lower-case hexadecimal integers.
-    pr_info!("{:#x?}", a);
+    pr_info!("{:#x?}\n", a);
 
     Ok(())
 }

-- 
2.49.0


