Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A542F296FC2;
	Fri, 23 May 2025 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748011963; cv=none; b=e5F9ue26BkN8eMM7x1sAz+ND4oTaoa9sEE2in+TjWVNuLkEyPBXMcTzyRsCsZcltjraXfNCRCAICYl5YNJDI8oCCdG6Ip74oWSXs2ZO4/UFqY+b4b2mn/3hqqotW4aC8OKZtz+5cpAt41fM32HbT0e1ZAC0fAKCO2mieifcl4eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748011963; c=relaxed/simple;
	bh=uDf18kPzGdXm2nIfij017Ap++yRaWCXs7zQ/AOF0vwM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OlLIKTDbvRlWzblIxpXc8tvSvzcsN95K2ttSB9Qw40dSY/pqJ+9k22Q6+XG7zPZC9yfW6hPdIL0Mi2I54olvqqcuj0b1ZX1rbk0sM0m1iP5/xVo+f9kOJ9VaKm3oiaTWHTTBnpx/+/lO3iE3nYJCKl2ZcE4rVsMGdswCoCFfWTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugKRHtmu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugKRHtmu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5397BC4CEE9;
	Fri, 23 May 2025 14:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748011963;
	bh=uDf18kPzGdXm2nIfij017Ap++yRaWCXs7zQ/AOF0vwM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ugKRHtmuHxjni2xr9XxAUOVoK2NekJ9JM4gZhAwh6YL/L0UVmYoMxCVia9AM9ZdFU
	 syrW8Ly8jTLRP7RSjwNWTQpRHL3mLReuW3E5k//wdbQBLsvop8Ows20BjviLfI8alt
	 GcNgfSCgaj3A4VliYTYlN/dmQxtUsWIykebHzoQ/Eot0zMhi6jvyvxD42jM+/WNiIY
	 ELISvMafUT6NCKXmcqZKD+ADxIQcqXvuilimxlCedgS+K8kSej3rdCOmPWoEKWdOhB
	 f0xChRCyoCp4pX/IRLqeki02H/8Z0HY+f0oyI03zwlILbR698+wi7p9rY0zZ5floys
	 yc6hbsCknVDAA==
From: Benno Lossin <lossin@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Fiona Behrens <me@kloenk.dev>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/13] rust: security: replace `core::mem::zeroed` with `pin_init::zeroed`
Date: Fri, 23 May 2025 16:51:09 +0200
Message-ID: <20250523145125.523275-14-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523145125.523275-1-lossin@kernel.org>
References: <20250523145125.523275-1-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All types in `bindings` implement `Zeroable` if they can, so use
`pin_init::zeroed` instead of relying on `unsafe` code.

If this ends up not compiling in the future, something in bindgen or on
the C side changed and is most likely incorrect.

Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/kernel/security.rs | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/rust/kernel/security.rs b/rust/kernel/security.rs
index 0c63e9e7e564..11a6493525f3 100644
--- a/rust/kernel/security.rs
+++ b/rust/kernel/security.rs
@@ -25,8 +25,7 @@ impl SecurityCtx {
     /// Get the security context given its id.
     #[inline]
     pub fn from_secid(secid: u32) -> Result<Self> {
-        // SAFETY: `struct lsm_context` can be initialized to all zeros.
-        let mut ctx: bindings::lsm_context = unsafe { core::mem::zeroed() };
+        let mut ctx: bindings::lsm_context = pin_init::zeroed();
 
         // SAFETY: Just a C FFI call. The pointer is valid for writes.
         to_result(unsafe { bindings::security_secid_to_secctx(secid, &mut ctx) })?;
-- 
2.49.0

