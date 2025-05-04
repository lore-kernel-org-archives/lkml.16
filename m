Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F8C1C84AF;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746373295; cv=none; b=ImVQpw7W6NoOMz6XcQYxfGFl9/l/WYdHzD2lG4g2hk0mkYC9Lm8vQIzQPSfxC7xJ8b2NXSkl8q2s+aSNfXqmr/QJM8nR6GZuvfSjdYeN2KF28eBh2YGD/K2WoepfSiK5f+DIHPjvb4TI2kbsE8sT+7TI8iaLz9CjWcnNhq9Eywg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746373295; c=relaxed/simple;
	bh=QZBWP+bl9RsydAJjbEm+QEiZ1vGYgQsHPscH0XJc0fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSHhG/4GJWv5ND/i5ELlwAOeG7elZVxjfoF6H0H0D5ZE5PdjhYZQY1bDgT3TSNI7HYsALL53RWY66hW8+IjAcrKx4cQG03/r48cRj6SG7e/R5n7aXnlswnSwu0pS09S2exnxHz2NcnRrFUYTj+zbQ4LWI0vx+DyFjC5NiYd3n40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwVb/ZZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwVb/ZZG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AA50C4CEF0;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746373295;
	bh=QZBWP+bl9RsydAJjbEm+QEiZ1vGYgQsHPscH0XJc0fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fwVb/ZZGPXCGvSaRdN3xRY+NpJMN/6YvAoj8BXiVQZ4fwOrjjhmxHXIG2w3jx88H/
	 WW1AztDicQFA7rlEW2kdbJ0zo6b4p/vTZnyhXFLODV1BXpmjMIDNfdO3cqFS2IgSZW
	 IYnqdBrcxu/vgAJ5FxgGhyZu58qIostmfm2ibJwKXA/Vf+wyc/NGqzdvcUuM+/IqhH
	 /4qkYsRE/WyTn/j3OizaM+/FFZvmYApxtH+4drQCGj8kJv6pZU4iDzjNa5W63w9I0e
	 D1zkSWHw2rtyS9v2PEOqhjYPSvEFHv9iZ43kJOxXYIpwofJLH+AtF8l9OzxDqcp7+h
	 qZ5Ueg/RcI6Vg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59BC4C3ABAC;
	Sun,  4 May 2025 15:41:35 +0000 (UTC)
From: Alban Kurti via B4 Relay <devnull+kurti.invicto.ai@kernel.org>
Date: Sun, 04 May 2025 17:41:15 +0200
Subject: [PATCH v4 2/2] rust: samples: add missing newline to pr_info!
 calls in rust_print_main
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250504-pr_info-newline-fix-v4-2-53467c401eb6@invicto.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746373294; l=937;
 i=kurti@invicto.ai; s=20250504; h=from:subject:message-id;
 bh=DSEqWE0u/GE7NzFen9Dcl1jZYuo1Vd0DtsX8YqbKu8E=;
 b=qaYzqjfuy5W+yyNJtWYK7ZNq5t4Jl79u9xQ7m/jeUVt4zs7VMoZaCVvipoAtqHHWkNQlym+xF
 ejebzOxIRscAW5pa4AN0uJ3E3Zg5j8+sBXF5ONHtW2IVocSzjZWjwM/
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=7724GF1zrN6rA3Z2xkyAmVGkoOQxv7bMUvXB4IsIPUs=
X-Endpoint-Received: by B4 Relay for kurti@invicto.ai/20250504 with
 auth_id=398
X-Original-From: Alban Kurti <kurti@invicto.ai>
Reply-To: kurti@invicto.ai

From: Alban Kurti <kurti@invicto.ai>

Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >= 1.84.0")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 samples/rust/rust_print_main.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_print_main.rs b/samples/rust/rust_print_main.rs
index 899a6d25f4dc0e0ccebdf4f95aaaf780b425e3af..ed90f78d0b9125f3806d6e13e5a3352dec935140 100644
--- a/samples/rust/rust_print_main.rs
+++ b/samples/rust/rust_print_main.rs
@@ -42,7 +42,7 @@ fn arc_print() -> Result {
 
         use core::fmt::Display;
         fn arc_dyn_print(arc: &Arc<dyn Display>) {
-            pr_info!("Arc<dyn Display> says {arc}");
+            pr_info!("Arc<dyn Display> says {arc}\n");
         }
 
         let a_i32_display: Arc<dyn Display> = Arc::new(42i32, GFP_KERNEL)?;

-- 
2.49.0


