Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F99C28BAB1;
	Thu, 26 Jun 2025 13:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750944350; cv=none; b=ozQz6aeSF7YgO7ycswFLuZhoMmHa6mQ5ZH5IWKGSWkF1rkJ+/xsk/fWwVT9Ngd6Q3z6Z83LfzQNUzigW1uOCqnt+G5KcyKqmWmrRR21yEATPCSwHsgdyA2/DYj5eoYzMfECjtfCDpIpGiTLA4Rh5Pmy7+f33PzcyZ8rBmIaJEik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750944350; c=relaxed/simple;
	bh=X8oqV9/hrJLm7FxNpugISZbe6ORT3aK7Xh1y/oYOuEk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DYET2xS/gNhCsiflA6b5HnUt6P5JIeKXQHOj++jVDq7BRmUofczPRGgKfhNUfKQbHmJMMN/TrSIJJs/utUaRvW0t0s/xeVrcUmL+XYSdx+WNfYcP/Plz6FJBENj3mIDpvNjrTssbjCniAAw5Bao04CnTSku3vfUN7Ld+kbrgEcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rycJ7FKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rycJ7FKl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5077BC4CEEB;
	Thu, 26 Jun 2025 13:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750944350;
	bh=X8oqV9/hrJLm7FxNpugISZbe6ORT3aK7Xh1y/oYOuEk=;
	h=From:To:Cc:Subject:Date:From;
	b=rycJ7FKl8OUvefVTh9Q5Y6nkQPQaDzp0iy1GGqKaxV0gHJqTRfRb9IjumxKRgP6d+
	 OZG4/rQQXlDfR4KrhYsUy+a1NS/vEAt5N78btw5XgOlsQB/ugilvUmNyRvjPV4ngeU
	 aGXhRT4kx3vffTtygk7OUO+/Le+c9Yg46zCle7FRBgwX5+iptLLiBpPMIxVGU0IJzB
	 Z1zRUiOrs7B+WRpnZQNUnQwfolHHIsacUvB1KlMO4rp4MX8dTQ/A7yssnblN7e+Sqw
	 3DQjk73tzA++u1YDbk+tGJzxf47ZT2x9yEJa7Yu0StFd8qi7XFuKM9srNRYdvWPV69
	 6MHHN1ON/n4jQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] rust: devres: require T: Send for Devres
Date: Thu, 26 Jun 2025 15:24:46 +0200
Message-ID: <20250626132544.72866-1-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Due to calling Revocable::revoke() from Devres::devres_callback() T may
be dropped from Devres::devres_callback() and hence must be Send.

Fix this by adding the corresponding bound to Devres and DevresInner.

Reported-by: Boqun Feng <boqun.feng@gmail.com>
Closes: https://lore.kernel.org/lkml/aFzI5L__OcB9hqdG@Mac.home/
Fixes: 76c01ded724b ("rust: add devres abstraction")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 57502534d985..8ede607414fd 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -18,7 +18,7 @@
 };
 
 #[pin_data]
-struct DevresInner<T> {
+struct DevresInner<T: Send> {
     dev: ARef<Device>,
     callback: unsafe extern "C" fn(*mut c_void),
     #[pin]
@@ -95,9 +95,9 @@ struct DevresInner<T> {
 /// # Ok(())
 /// # }
 /// ```
-pub struct Devres<T>(Arc<DevresInner<T>>);
+pub struct Devres<T: Send>(Arc<DevresInner<T>>);
 
-impl<T> DevresInner<T> {
+impl<T: Send> DevresInner<T> {
     fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         let inner = Arc::pin_init(
             pin_init!( DevresInner {
@@ -175,7 +175,7 @@ fn remove_action(this: &Arc<Self>) -> bool {
     }
 }
 
-impl<T> Devres<T> {
+impl<T: Send> Devres<T> {
     /// Creates a new [`Devres`] instance of the given `data`. The `data` encapsulated within the
     /// returned `Devres` instance' `data` will be revoked once the device is detached.
     pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
@@ -247,7 +247,7 @@ pub fn try_access_with_guard<'a>(&'a self, guard: &'a rcu::Guard) -> Option<&'a
     }
 }
 
-impl<T> Drop for Devres<T> {
+impl<T: Send> Drop for Devres<T> {
     fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.

base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.49.0

