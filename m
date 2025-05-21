Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B962BE115
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860505; cv=none; b=QNIbrpexH0FQd+T9KkAt0YmWIj1cEEOxZFjdCtZQ/QLk5yLQirjFgBaeFFKgdJcEhKmrt6eAMueA2LwQsW5uYFE7xA0BWD9bki/d0GTlHM+ntbrAg1zX8NutcgWcRrMdnw4xPXNvlouKX3tnMgP4+5AGE7X8+E46TQwJFoQPKsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860505; c=relaxed/simple;
	bh=1hLp9YB0dUeupve8c1B71AcVofklKMworlY+n6rCOK0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WgzlZp78NeitmcnjUHev45al0GxWNQnp3t7beCNajNKHbMUHZFXn17CauCx6FxRtpa9rditcMWpw9cA/FTiGiAWwIplpONfIlprHFKaHF0dMwZ1cHAA9tZ22vzeuyoVsyqtLXBGNcXpNaSs35GEmuBC9uX+5VqYIHhdMykkjUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cLQncVSQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cLQncVSQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860502;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bc4vl3FfO4NWd/Y8TRWSzMpXYyQRCKKle6LlSMQQ/wk=;
	b=cLQncVSQSZXDHoEFGIwv5msrZm7bdlQ0ZzrCmXrJoW7+zKY1qhuPn59/7pbvhq4HX/iLpX
	5OWMGvmoHKqMEZL1jLyMkow/fSx/W3oOM3pB2bwaKc7EcbV4fJay9DjoRXX18vJLRvbUrc
	5E0H8aN6whG1RuuneoteKsF295nvRzk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-ZDoT-cCNMqG29_PosTHevQ-1; Wed,
 21 May 2025 16:48:19 -0400
X-MC-Unique: ZDoT-cCNMqG29_PosTHevQ-1
X-Mimecast-MFC-AGG-ID: ZDoT-cCNMqG29_PosTHevQ_1747860496
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9BF281800447;
	Wed, 21 May 2025 20:48:16 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.80.100])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5A9A519560B7;
	Wed, 21 May 2025 20:48:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Asahi Lina <lina@asahilina.net>,
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
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v2 08/12] rust: drm: gem: shmem: Add share_dma_resv to ObjectConfig
Date: Wed, 21 May 2025 16:29:15 -0400
Message-ID: <20250521204654.1610607-9-lyude@redhat.com>
In-Reply-To: <20250521204654.1610607-1-lyude@redhat.com>
References: <20250521204654.1610607-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40

From: Asahi Lina <lina@asahilina.net>

Allow a GEM object to share another object's DMA reservation, for use
with drm_gpuvm. To keep memory safety, we hold a reference to the GEM
object owning the resv, and drop it when the child object is freed.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/shmem.rs | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/gem/shmem.rs b/rust/kernel/drm/gem/shmem.rs
index 57ec2538a905e..c38fca715429e 100644
--- a/rust/kernel/drm/gem/shmem.rs
+++ b/rust/kernel/drm/gem/shmem.rs
@@ -41,9 +41,14 @@
 /// This is used with [`Object::new()`] to control various properties that can only be set when
 /// initially creating a shmem-backed GEM object.
 #[derive(Default)]
-pub struct ObjectConfig {
+pub struct ObjectConfig<'a, T: BaseDriverObject> {
     /// Whether to set the write-combine map flag.
     pub map_wc: bool,
+
+    /// Reuse the DMA reservation from another GEM object.
+    ///
+    /// The newly created [`Object`] will hold an owned refcount to `parent_resv_obj` if specified.
+    pub parent_resv_obj: Option<&'a OpaqueObject<T::Driver>>,
 }
 
 /// A shmem-backed GEM object.
@@ -57,6 +62,8 @@ pub struct Object<T: BaseDriverObject> {
     #[pin]
     obj: Opaque<bindings::drm_gem_shmem_object>,
     dev: NonNull<device::Device<T::Driver>>,
+    // Parent object that owns this object's DMA reservation object
+    parent_resv_obj: Option<ARef<OpaqueObject<T::Driver>>>,
     #[pin]
     inner: T,
 }
@@ -96,13 +103,14 @@ fn as_shmem(&self) -> *mut bindings::drm_gem_shmem_object {
     pub fn new(
         dev: &device::Device<T::Driver>,
         size: usize,
-        config: ObjectConfig,
+        config: ObjectConfig<'_, T>,
         args: T::Args,
     ) -> Result<ARef<Self>> {
         let new: Pin<KBox<Self>> = KBox::try_pin_init(
             try_pin_init!(Self {
                 obj <- pin_init::zeroed(),
                 dev: NonNull::from(dev),
+                parent_resv_obj: config.parent_resv_obj.map(|p| p.into()),
                 inner <- T::new(dev, size, args),
             }),
             GFP_KERNEL
@@ -118,7 +126,14 @@ pub fn new(
         let new = KBox::into_raw(unsafe { Pin::into_inner_unchecked(new) });
 
         // SAFETY: We're taking over the owned refcount from `drm_gem_shmem_init`.
-        let mut obj = unsafe { ARef::from_raw(NonNull::new_unchecked(new)) };
+        let obj = unsafe { ARef::from_raw(NonNull::new_unchecked(new)) };
+
+        // Start filling out values from `config`
+        if let Some(parent_resv) = config.parent_resv_obj {
+            // SAFETY: We have yet to expose the new gem object outside of this function, so it is
+            // safe to modify this field.
+            unsafe { (*obj.obj.get()).base.resv = parent_resv.raw_dma_resv() };
+        }
 
         // SAFETY: We have yet to expose this object outside of this function, so we're guaranteed
         // to have exclusive access - thus making this safe to hold a mutable reference to.
-- 
2.49.0

