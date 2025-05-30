Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B85C188A0E;
	Fri, 30 May 2025 14:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615097; cv=none; b=r4+pSlpc06fdk2WWsOk34Cv9EBwHBVj7BuHM8vQbGt2CnKEM4bNy1Ib5COrKrUgaGkMQp3s7SUujoC5flcAasqtl0pV6mQlSOEhMRk5ESlZ15ujE/ffzy9918xPxwn7vznKBIlVKWqNSges6d1yfLnEVjLIUcfT9yyrdjG/+rXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615097; c=relaxed/simple;
	bh=qPGJ3y/S7HIYr+nPyeDAb0tXbFUHa7n2dS4AYNlkSwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taD9mc0e1g0U3cTkR3p7AuehYlYAOv0FaP3gO2aUVARXaDHRRKeoFXej33R7Hcn3clCnGCWBkCpd3gl1UQ7ICapm2NdXQtO09zjTXP62W6MAC1CO0TJSXIJ/ZQzI4T3dCxOgBCgPZ5Jdnj1ywUkZjZ6ggAgjEBRiLwdxiVmbikU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBqlLGJI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBqlLGJI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F309CC4CEEB;
	Fri, 30 May 2025 14:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615097;
	bh=qPGJ3y/S7HIYr+nPyeDAb0tXbFUHa7n2dS4AYNlkSwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBqlLGJIKwPG1rMMDnz8Axpoj+7NEdWvcYcyRGl3EEi/+VHMupf9205xAPTpyw7os
	 goXJCZJzzDEeVLCvTn8cMU3YMwCy3tgMOX3LEbJbIu1NJq7oJ+ZmDdngVvo8RTIllU
	 bvxj2tbksgOA8FsE1a+PHcPekZGSNw/mYF4rBBBgZGEfRSHRAf3ERwq8S8J7PGrOra
	 HgYyhkafhfepavlxnkDmBchQmoVBFbSkpRNV/RSub4JwbiDoIM+mGq9YaMJdDQYCtr
	 3V8jX98IdptxPFyXerey2wn/CgatxW97UnrsqLJRxGo3y7JbS4p2znXhpCut5+wgy9
	 keRlTeuefiMRA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	chrisi.schrefl@gmail.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/7] rust: types: support fallible PinInit types in Opaque::pin_init
Date: Fri, 30 May 2025 16:24:14 +0200
Message-ID: <20250530142447.166524-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250530142447.166524-1-dakr@kernel.org>
References: <20250530142447.166524-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Opaque::pin_init only supports infallible PinInit
implementations, i.e. impl PinInit<T, Infallible>.

This has been sufficient so far, since users such as Revocable do not
support fallibility.

Since this is about to change, make Opaque::pin_init() generic over the
error type E.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/types.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
index 22985b6f6982..75c99d6facf9 100644
--- a/rust/kernel/types.rs
+++ b/rust/kernel/types.rs
@@ -354,13 +354,13 @@ pub const fn zeroed() -> Self {
     }
 
     /// Create an opaque pin-initializer from the given pin-initializer.
-    pub fn pin_init(slot: impl PinInit<T>) -> impl PinInit<Self> {
-        Self::ffi_init(|ptr: *mut T| {
+    pub fn pin_init<E>(slot: impl PinInit<T, E>) -> impl PinInit<Self, E> {
+        Self::try_ffi_init(|ptr: *mut T| -> Result<(), E> {
             // SAFETY:
             //   - `ptr` is a valid pointer to uninitialized memory,
-            //   - `slot` is not accessed on error; the call is infallible,
+            //   - `slot` is not accessed on error,
             //   - `slot` is pinned in memory.
-            let _ = unsafe { PinInit::<T>::__pinned_init(slot, ptr) };
+            unsafe { PinInit::<T, E>::__pinned_init(slot, ptr) }
         })
     }
 
-- 
2.49.0

