Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D58C188A0E;
	Fri, 30 May 2025 14:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615104; cv=none; b=ZLuRriL8DvJYcTXuRHjdBHLyteKX6uNHfYzHxzU5mtg+UmaPzUEHJ0HYDXxzbLeRQHW2Y0k3bKr6vnpPdaIASCCzI3cDBtJrJDwv5Teto9QPPbRrwejzfEOTHUhZ5L+vGwTgNkGPWsx+HR7bm9QqOy8FIMv0R/f3ZRkhpCgXVkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615104; c=relaxed/simple;
	bh=mGiSKd4T9J6G6QXOn/6eU1w9NZ+tMNSzAqmLqysSbEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRN8y/3AekvUiltEefOdnMr5dVMwK1qqhpAnarHfWzkCVQb7UB00qBNcC+z8BqldoPRfLmyhllslgYLvKwS8UmJ8IgOX/tlZBV2Z2CVk0bdSmXcgAVSnMvzb/tDuDQZ3t1vKC6I8Ou8ouemcpCMUuvE/WGwWVNiJ/4ZOIFWRFek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NC/3F1mL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NC/3F1mL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00992C4CEE9;
	Fri, 30 May 2025 14:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615104;
	bh=mGiSKd4T9J6G6QXOn/6eU1w9NZ+tMNSzAqmLqysSbEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NC/3F1mLHpQNX6xsAK4ArqvUk+DOlfS21gRRBlRtnyYusmAja1ljmLFlhowhn5vfX
	 mJC/fKP0Sa6oBzDIXnS/2VO2yTXO0irhVZRWdI8efeK+qL5NogShibbvrObLpFFx4E
	 uX1kbkhr8H+pstT0rj5e2qQaqVbR/RHoSkzpUCnNxMcURveupSt4Oo34XI+fRKNKHT
	 qJ8As1lnSKXkrDg1CPcVLjef4Dp9XBsx3/kdhYx+RkB87VAjolx7NKB42BRCbbtygz
	 rIug+YMiVTZgCH5BypdViw1H7jZXVidv0MUE150IZRfKK+Ds4BGdpTBBCLMcfu53QB
	 v2V8ygVzd3ViQ==
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
Subject: [PATCH 3/7] rust: devres: support fallible in-place init for data
Date: Fri, 30 May 2025 16:24:16 +0200
Message-ID: <20250530142447.166524-4-dakr@kernel.org>
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

Currently, Devres only supports a data argument of type T. However,
DevresInner already uses pin-init to initialize the Revocable. Hence,
there is no need for this limitation and we can take a data argument of
type impl PinInit<T, E> instead.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 2dbe17d6ea1f..47aeb5196dd2 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -96,9 +96,16 @@ struct DevresInner<T> {
 pub struct Devres<T>(Arc<DevresInner<T>>);
 
 impl<T> DevresInner<T> {
-    fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
-        let inner = Arc::pin_init(
-            try_pin_init!( DevresInner {
+    fn new<E>(
+        dev: &Device<Bound>,
+        data: impl PinInit<T, E>,
+        flags: Flags,
+    ) -> Result<Arc<DevresInner<T>>>
+    where
+        Error: From<E>,
+    {
+        let inner = Arc::pin_init::<Error>(
+            try_pin_init!( Self {
                 dev: dev.into(),
                 callback: Self::devres_callback,
                 data <- Revocable::new(data),
@@ -168,7 +175,10 @@ fn remove_action(this: &Arc<Self>) {
 impl<T> Devres<T> {
     /// Creates a new [`Devres`] instance of the given `data`. The `data` encapsulated within the
     /// returned `Devres` instance' `data` will be revoked once the device is detached.
-    pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
+    pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>, flags: Flags) -> Result<Self>
+    where
+        Error: From<E>,
+    {
         let inner = DevresInner::new(dev, data, flags)?;
 
         Ok(Devres(inner))
@@ -176,7 +186,14 @@ pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
 
     /// Same as [`Devres::new`], but does not return a `Devres` instance. Instead the given `data`
     /// is owned by devres and will be revoked / dropped, once the device is detached.
-    pub fn new_foreign_owned(dev: &Device<Bound>, data: T, flags: Flags) -> Result {
+    pub fn new_foreign_owned<E>(
+        dev: &Device<Bound>,
+        data: impl PinInit<T, E>,
+        flags: Flags,
+    ) -> Result
+    where
+        Error: From<E>,
+    {
         let _ = DevresInner::new(dev, data, flags)?;
 
         Ok(())
-- 
2.49.0

