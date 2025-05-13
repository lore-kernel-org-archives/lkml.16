Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E758202C48
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174269; cv=none; b=r//cM9H4QSuDT5IHYkzWbbJ6/e4sEk9Bs9vyv5H/wTwK/EQhHlcRtclkuNbidIZDB54Xbk3L9Lk0yDXsnfugT9nzehXu7MaYhVtD3QY8PoHTkgrWJqjIQ593C/956/lZZM5a9UzRatjVpku8JB3jMYXxJTuGt8UbyHAcXvaIov0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174269; c=relaxed/simple;
	bh=KoVg+RCs4hMlFuoabocT3S/EpmV31xnUshELhfpKYDk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKkjz/JH7hYTGIm9R+BxxWQbWj/HnEg33cMLr0YhvCaZ0mM8xcXLx8f4E/Dtbz2SIg1PwSU/m5bwQ4NFXoVYIOTeUXv+7Hrh02Xm7yt2/tQBeTn0WdyGShECDSKG8htud7bxdKv2iClzagR+UPMH+eFZGNwpsAh6wk8R2s0isVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TCoz4ubg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TCoz4ubg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747174267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DCw2wvd2m1wTO/RjJyxO6cpVaBvDfLJZ2984Y/kSd2U=;
	b=TCoz4ubg9WIWLnQw40lEriJkk2IKDuBKRz2ptZp0bbwhYPMEYN6GHg2+VkE3Lq3ioAl66s
	6wlEEqFeYpLoK7JtTRAkH2Npu5kE9QMRYBdLASmr0AgcPZVbgYRGfsUK88z16aayjmjr5z
	5/T+/aIJXa/bzFJRlDGfWMlGJ6Q1tzY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-310-wm0OVJk3O6makUvGSG_Vyg-1; Tue,
 13 May 2025 18:11:03 -0400
X-MC-Unique: wm0OVJk3O6makUvGSG_Vyg-1
X-Mimecast-MFC-AGG-ID: wm0OVJk3O6makUvGSG_Vyg_1747174261
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6859A195DE0B;
	Tue, 13 May 2025 22:11:00 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 577821940E95;
	Tue, 13 May 2025 22:10:55 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH v2 1/4] rust: drm: gem: Use NonNull for Object::dev
Date: Tue, 13 May 2025 18:09:54 -0400
Message-ID: <20250513221046.903358-2-lyude@redhat.com>
In-Reply-To: <20250513221046.903358-1-lyude@redhat.com>
References: <20250513221046.903358-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

There is usually not much of a reason to use a raw pointer in a data
struct, so move this to NonNull instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/gem/mod.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 0cafa4a424206..df8f9fdae5c22 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -177,7 +177,7 @@ impl<T> BaseObject for T where Self: crate::types::AlwaysRefCounted + IntoGEMObj
 #[pin_data]
 pub struct Object<T: DriverObject + Send + Sync> {
     obj: Opaque<bindings::drm_gem_object>,
-    dev: *const drm::Device<T::Driver>,
+    dev: NonNull<drm::Device<T::Driver>>,
     #[pin]
     data: T,
 }
@@ -212,7 +212,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
                 data <- T::new(dev, size),
                 // INVARIANT: The drm subsystem guarantees that the `struct drm_device` will live
                 // as long as the GEM object lives.
-                dev,
+                dev: dev.into(),
             }),
             GFP_KERNEL,
         )?;
@@ -237,7 +237,7 @@ pub fn new(dev: &drm::Device<T::Driver>, size: usize) -> Result<ARef<Self>> {
     pub fn dev(&self) -> &drm::Device<T::Driver> {
         // SAFETY: The DRM subsystem guarantees that the `struct drm_device` will live as long as
         // the GEM object lives, hence the pointer must be valid.
-        unsafe { &*self.dev }
+        unsafe { self.dev.as_ref() }
     }
 
     fn as_raw(&self) -> *mut bindings::drm_gem_object {
-- 
2.49.0

