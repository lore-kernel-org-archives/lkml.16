Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1960B67F;
	Thu, 29 May 2025 08:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748506235; cv=none; b=lsxeFeZqLf4f8bVxROaNLLH3xlOYsqgdWW5RpGCJ3A1h+rnwBSAmc3FOvTA3MHEq+sMhdouvgb2u9NEiHKIip28rqGWNeV6EXV7rYtBdBmopV96BLLuTWX441Zxb6OfnMB2yx9Xh+cvp9A1A1zPX11wSRsm4nZPoEK9CmNFnlek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748506235; c=relaxed/simple;
	bh=+lHk1ruVvY5WebBq9pkPMeztSNWygqotaAUu45ETap8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cv3P/+t4KY52RaADuEVen5yXhXIlOlbJzYbRCnTwTNWa+BA+dxsAo6GUoLU0/eT04LB5+9vVnHGorQ7r9GNXwTJFkGqBei2Me9HFEjZl6jCoHh+h36wXec2Tx5kiXaQ+ZI/FrVh4H+0yHN22vuG0BrXRxmKUnxjUWgdDv/8Nx34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XhMeP7kS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XhMeP7kS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA55C4CEE7;
	Thu, 29 May 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748506234;
	bh=+lHk1ruVvY5WebBq9pkPMeztSNWygqotaAUu45ETap8=;
	h=From:To:Cc:Subject:Date:From;
	b=XhMeP7kSfztMgwOIb6h7ZxH48kAgF36jRSsHvUfQnX5MMxf71o92UUuLbDHoN+XrD
	 BX6xm2E6XGnD8eg3+k1CcjD96E58a3aTZLqZsR33ojuR3rHHVeB2TLsMkyFw1kfmws
	 6hmyAzm+SstPBBm293eDB0AkJ45bngGNsAgDktYe6mCGPCvR/IhzeIwFxQC70iqZqe
	 UQ7A6/XliNRY2KBolxuqRN/dOO+1PrOXxnwJdIREN8pkh49YmWDR5bdb7Y8hRQzc65
	 sktvJP3xvqk47U6hk/QuOFX16WBUUekg3Fk7NRNxFGbmMJOeo9vAng89jO5CV7YLQA
	 zsI6z1HxqlN0g==
From: Benno Lossin <lossin@kernel.org>
To: Benno Lossin <lossin@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Fiona Behrens <me@kloenk.dev>,
	Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: pin-init: improve safety documentation for `impl<T> [Pin]Init<T> for T`
Date: Thu, 29 May 2025 10:10:23 +0200
Message-ID: <20250529081027.297648-1-lossin@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The inner SAFETY comments were missing since commit 5cfe7bef6751 ("rust:
enable `clippy::undocumented_unsafe_blocks` lint").

Also rework the implementation of `__pinned_init` to better justify the
SAFETY comment.

Link: https://github.com/Rust-for-Linux/pin-init/pull/62/commits/df925b2e27d499b7144df7e62b01acb00d4b94b8
Signed-off-by: Benno Lossin <lossin@kernel.org>
---
 rust/pin-init/src/lib.rs | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/rust/pin-init/src/lib.rs b/rust/pin-init/src/lib.rs
index 9ab34036e6bc..d1c3ca5cfff4 100644
--- a/rust/pin-init/src/lib.rs
+++ b/rust/pin-init/src/lib.rs
@@ -1390,20 +1390,22 @@ pub fn pin_init_array_from_fn<I, const N: usize, T, E>(
     unsafe { pin_init_from_closure(init) }
 }
 
-// SAFETY: Every type can be initialized by-value.
+// SAFETY: the `__init` function always returns `Ok(())` and initializes every field of `slot`.
 unsafe impl<T, E> Init<T, E> for T {
     unsafe fn __init(self, slot: *mut T) -> Result<(), E> {
-        // SAFETY: TODO.
+        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
         unsafe { slot.write(self) };
         Ok(())
     }
 }
 
-// SAFETY: Every type can be initialized by-value. `__pinned_init` calls `__init`.
+// SAFETY: the `__pinned_init` function always returns `Ok(())` and initializes every field of
+// `slot`. Additionally, all pinning invariants of `T` are upheld.
 unsafe impl<T, E> PinInit<T, E> for T {
     unsafe fn __pinned_init(self, slot: *mut T) -> Result<(), E> {
-        // SAFETY: TODO.
-        unsafe { self.__init(slot) }
+        // SAFETY: `slot` is valid for writes by the safety requirements of this function.
+        unsafe { slot.write(self) };
+        Ok(())
     }
 }
 

base-commit: 1ce98bb2bb30713ec4374ef11ead0d7d3e856766
-- 
2.49.0

