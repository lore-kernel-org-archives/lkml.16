Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B965126989D;
	Thu, 12 Jun 2025 14:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739914; cv=none; b=s2Ad0OW1I7a/xMc9XjzS62OKKYpZppGkzo2WXuAPIuqntsbBjxNKTLPW8E7zFQqrEhZQs/JWBJJidPS26GXHkQFe0k93bTqWWJrzP8zlR5lxTThLa63imuwBsYYfxqhpEiStzKRuiwV6bLVBzHXUy4dkEzNNL7hOiqjingWEwt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739914; c=relaxed/simple;
	bh=TciDSg9bcuZTke1QmCC3h0bSb7BA7urmikCTCcO+ODA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bmy+8qygk6z7Wn5mQ8KWMiB4yPKr17KeUwqoX5vjOg5tnhSzmgtVNSfBqatJssJtrQzHH9pSZlrQaqCWdswlcY4X6CMvO7gN+xQPWK0/orXTl6LxmYsEUjaRQXe6nX0Ox3bXcp6cduOjJWhinSKCoMIEyohs5UUJ1/T2zdaS3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=npDvdYDp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="npDvdYDp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A75CC4CEEB;
	Thu, 12 Jun 2025 14:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739914;
	bh=TciDSg9bcuZTke1QmCC3h0bSb7BA7urmikCTCcO+ODA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=npDvdYDpZPF8qJItRNBDBsBt/8K/dj0ueU5u6GBWQ9px9kW52AY1RQ9cs/0TvhUf9
	 AypKQTD06JJkB2lg0vl9DD/Q+nOR4CRnQvV7nIeg1APEaloYlq/jZSb13/hTxGUMbh
	 ysDRJFxb8Xd0y3QKi8wC0Ttsu6GELZYoubSmHFibrWUsDPbEElbskjyGZO4PSxsic/
	 +jqIk09HZALyhIZNBWO8abHXYHyVs75hH6pDOjFZd8kurG2wvZCeuoaPm+YTkEjPaU
	 HYsCIrNtxfvToQLoB4yJkI6jE5XOmvcHdRx3eXjsLeh5QkzUHaeQurbbETQcKhxi8Y
	 KaWZqiipAuSkA==
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
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/4] rust: revocable: support fallible PinInit types
Date: Thu, 12 Jun 2025 16:51:38 +0200
Message-ID: <20250612145145.12143-2-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145145.12143-1-dakr@kernel.org>
References: <20250612145145.12143-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, Revocable::new() only supports infallible PinInit
implementations, i.e. impl PinInit<T, Infallible>.

This has been sufficient so far, since users such as Devres do not
support fallibility.

Since this is about to change, make Revocable::new() generic over the
error type E.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs    | 2 +-
 rust/kernel/revocable.rs | 7 +++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index d8bdf2bdb879..a7df9fbd724f 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -98,7 +98,7 @@ struct DevresInner<T> {
 impl<T> DevresInner<T> {
     fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Arc<DevresInner<T>>> {
         let inner = Arc::pin_init(
-            pin_init!( DevresInner {
+            try_pin_init!( DevresInner {
                 dev: dev.into(),
                 callback: Self::devres_callback,
                 data <- Revocable::new(data),
diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index fa1fd70efa27..41b8fe374af6 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -82,8 +82,11 @@ unsafe impl<T: Sync + Send> Sync for Revocable<T> {}
 
 impl<T> Revocable<T> {
     /// Creates a new revocable instance of the given data.
-    pub fn new(data: impl PinInit<T>) -> impl PinInit<Self> {
-        pin_init!(Self {
+    pub fn new<E>(data: impl PinInit<T, E>) -> impl PinInit<Self, Error>
+    where
+        Error: From<E>,
+    {
+        try_pin_init!(Self {
             is_available: AtomicBool::new(true),
             data <- Opaque::pin_init(data),
         })
-- 
2.49.0

