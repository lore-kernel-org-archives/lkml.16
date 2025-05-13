Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E120C009
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174284; cv=none; b=hEQjhph4HCruEcr9POsjxBE3mF0d7AUoEtTJ5F4XWBECU3Ha81OCXhY/SSkMfJhbm0U80ZctlM43fdxZqYJHx0WKYanA/PgARYM9pep/KOayBvqLAgi2uVbWtVM7vb2LgF8T2eo4w6kTwHKd3LEZpOTN1hPLYPj3MZD7BdGoBxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174284; c=relaxed/simple;
	bh=snAJJ4dqpLVI5y1ozRwgddYi9+s23TmxoUqv5KcTbrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILP4JWqECV/esp/+B4y/PKr/fpRwG87SNK46axeK+G1wlLRNi85Rkh3DHEj3tjW6WHI6jCnWtyFbTfniOWhA+SKQ32B/gy42qH76QP9wjTLZNvZr3jucqCM1A0xe6XAbtbCmgqseJKh4a0KuCu6cqGn7bXvTQjKoe/veXY7I4xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ba/vdOEP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ba/vdOEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747174281;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+eRdN+ZheJAEz/HIzsmMzXqUM9+/iVZmHsdLdFswD3U=;
	b=ba/vdOEPJBd8xTy+LrBp+h2luo+yf5JjYnOZf2+wwik2k/b9U0TKwcon4+/hmWHhQXS2b5
	qrHpxRoH2SuJW4hXu2qvp8jgsA9UZzQEC3ELqsntHSzYCm1bjz8L3ToPANAtZUWKmu1fUK
	l8XZreV2Gw9SN/TqK8jBNPACyxHoRtY=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-647-lmH3wHABP0iRzkoMnM7q2w-1; Tue,
 13 May 2025 18:11:19 -0400
X-MC-Unique: lmH3wHABP0iRzkoMnM7q2w-1
X-Mimecast-MFC-AGG-ID: lmH3wHABP0iRzkoMnM7q2w_1747174277
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 354891955BF2;
	Tue, 13 May 2025 22:11:16 +0000 (UTC)
Received: from chopper.lyude.net (unknown [10.22.64.99])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C52021944A82;
	Tue, 13 May 2025 22:11:11 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Asahi Lina <lina@asahilina.net>
Subject: [PATCH v2 3/4] rust: drm: gem: s/into_gem_obj()/as_raw()/
Date: Tue, 13 May 2025 18:09:56 -0400
Message-ID: <20250513221046.903358-4-lyude@redhat.com>
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

There's a few changes here:
* The rename, of course (this should also let us drop the clippy annotation
  here)
* Return *mut bindings::drm_gem_object instead of
  &Opaque<bindings::drm_gem_object> - the latter doesn't really have any
  benefit and just results in conversion from the rust type to the C type
  having to be more verbose than necessary.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>

---
V2:

Rename to as_raw()

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index 1ea1f15d8313c..fa293c08f431d 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -12,7 +12,7 @@
     prelude::*,
     types::{ARef, Opaque},
 };
-use core::{mem, ops::Deref, ptr, ptr::NonNull};
+use core::{mem, ops::Deref, ptr::NonNull};
 
 /// GEM object functions, which must be implemented by drivers.
 pub trait BaseDriverObject<T: BaseObject>: Sync + Send + Sized {
@@ -42,8 +42,7 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
 
     /// Returns a reference to the raw `drm_gem_object` structure, which must be valid as long as
     /// this owning object is valid.
-    #[allow(clippy::wrong_self_convention)]
-    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
+    fn as_raw(&self) -> *mut bindings::drm_gem_object;
 
     /// Converts a pointer to a `struct drm_gem_object` into a reference to `Self`.
     ///
@@ -101,8 +100,8 @@ extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
 impl<T: DriverObject> IntoGEMObject for Object<T> {
     type Driver = T::Driver;
 
-    fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object> {
-        &self.obj
+    fn as_raw(&self) -> *mut bindings::drm_gem_object {
+        self.obj.get()
     }
 
     unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
@@ -121,7 +120,7 @@ pub trait BaseObject
     fn size(&self) -> usize {
         // SAFETY: `self.into_gem_obj()` is guaranteed to be a pointer to a valid `struct
         // drm_gem_object`.
-        unsafe { (*self.into_gem_obj().get()).size }
+        unsafe { (*self.as_raw()).size }
     }
 
     /// Creates a new handle for the object associated with a given `File`
@@ -133,11 +132,7 @@ fn create_handle(
         let mut handle: u32 = 0;
         // SAFETY: The arguments are all valid per the type invariants.
         to_result(unsafe {
-            bindings::drm_gem_handle_create(
-                file.as_raw().cast(),
-                self.into_gem_obj().get(),
-                &mut handle,
-            )
+            bindings::drm_gem_handle_create(file.as_raw().cast(), self.as_raw(), &mut handle)
         })?;
         Ok(handle)
     }
@@ -171,14 +166,10 @@ fn lookup_handle(
     /// Creates an mmap offset to map the object from userspace.
     fn create_mmap_offset(&self) -> Result<u64> {
         // SAFETY: The arguments are valid per the type invariant.
-        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.into_gem_obj().get()) })?;
+        to_result(unsafe { bindings::drm_gem_create_mmap_offset(self.as_raw()) })?;
 
         // SAFETY: The arguments are valid per the type invariant.
-        Ok(unsafe {
-            bindings::drm_vma_node_offset_addr(ptr::addr_of_mut!(
-                (*self.into_gem_obj().get()).vma_node
-            ))
-        })
+        Ok(unsafe { bindings::drm_vma_node_offset_addr(&raw mut (*self.as_raw()).vma_node) })
     }
 }
 
-- 
2.49.0

