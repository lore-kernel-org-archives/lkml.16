Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573B1223DED
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124672; cv=none; b=hLGbfj7YD+qfGw3gfh4NwL9fyJO9FqTLZSwi42yXX74pvr5D8Qjn9JdKFF6h2DouPirYvAJEICqqS9N30j1O/mX6KkQmoi5H5LGql/yepVwpleBl+5ioe7CAJ1HDaMStgl/YNYECcDUp67t7WWBbLdQRa/4myuzjjqj1+eaBuTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124672; c=relaxed/simple;
	bh=SrzFAyg30d6oGKEyLW8zbG9Y5AMJTECOWzAs9Z0xqlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kNLc+ar/Kdz0zt5tg+WRKa6JtVY16nNCD54URklUXOzdCc2/cF7fmWs/N3/KIPAhv4Yx+dMtMPXMQh33opygo85+usen59v795hQwa7x9h6akF6ferD9puL62NMsXJmyY36trvl98Diba5fpPUaerpZx8A47P5RXMEQ2JTwVZH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JFYajEIl; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JFYajEIl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746124668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRNBnPmAgdVGuEdAa7ItVzU96gbWj7IMk8GXzUCuJj8=;
	b=JFYajEIlcQeoe10bwaukanJMNFVxWCJ6pF5XdmCzjNd1Qem9GFDv3WhEcDBLKRNFDY0jUn
	Dq9XP8wDnvF0s1V53yBz/t/fW5uAPs0i74CJd1Z9QzTDc1TZLpt3hBmP/NSG9IwvzRUzLC
	jvLwQfjyz4iaIO7x5koje3DqYZx64m0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-gnVgooa7MYmArRUfhUZFwg-1; Thu,
 01 May 2025 14:37:45 -0400
X-MC-Unique: gnVgooa7MYmArRUfhUZFwg-1
X-Mimecast-MFC-AGG-ID: gnVgooa7MYmArRUfhUZFwg_1746124662
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D64771801A0F;
	Thu,  1 May 2025 18:37:41 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 033881800115;
	Thu,  1 May 2025 18:37:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
	Danilo Krummrich <dakr@kernel.org>,
	Asahi Lina <lina@asahilina.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>
Subject: [PATCH 2/4] rust: drm: gem: Refactor IntoGEMObject::from_gem_obj() to as_ref()
Date: Thu,  1 May 2025 14:33:17 -0400
Message-ID: <20250501183717.2058109-3-lyude@redhat.com>
In-Reply-To: <20250501183717.2058109-1-lyude@redhat.com>
References: <20250501183717.2058109-1-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

There's a few issues with this function, mainly:

* This function -probably- should have been unsafe from the start. Pointers
  are not always necessarily valid, but you want a function that does
  field-projection for a pointer that can travel outside of the original
  struct to be unsafe, at least if I understand properly.
* *mut Self is not terribly useful in this context, the majority of uses of
  from_gem_obj() grab a *mut Self and then immediately convert it into a
  &'a Self. It also goes against the ffi conventions we've set in the rest
  of the kernel thus far.
* from_gem_obj() also doesn't follow the naming conventions in the rest of
  the DRM bindings at the moment, as_ref() would be a better name.

So, let's:

* Make from_gem_obj() unsafe
* Convert it to return &'a Self
* Rename it to as_ref()
* Update all call locations

Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/kernel/drm/gem/mod.rs | 67 ++++++++++++++++++++++++--------------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/rust/kernel/drm/gem/mod.rs b/rust/kernel/drm/gem/mod.rs
index df8f9fdae5c22..f70531889c21f 100644
--- a/rust/kernel/drm/gem/mod.rs
+++ b/rust/kernel/drm/gem/mod.rs
@@ -45,8 +45,12 @@ pub trait IntoGEMObject: Sized + super::private::Sealed {
     #[allow(clippy::wrong_self_convention)]
     fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object>;
 
-    /// Converts a pointer to a `struct drm_gem_object` into a pointer to `Self`.
-    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self;
+    /// Converts a pointer to a `struct drm_gem_object` into a reference to `Self`.
+    ///
+    /// # Safety
+    ///
+    /// `self_ptr` must be a valid pointer to `Self`.
+    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self;
 }
 
 /// Trait which must be implemented by drivers using base GEM objects.
@@ -63,14 +67,13 @@ extern "C" fn open_callback<T: BaseDriverObject<U>, U: BaseObject>(
     let file = unsafe {
         drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
     };
-    let obj =
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
-            raw_obj,
-        );
-
-    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
-    // `raw_obj` we got is valid.
-    match T::open(unsafe { &*obj }, file) {
+    // SAFETY: `open_callback` is specified in the AllocOps structure for `Object<T>`, ensuring that
+    // `raw_obj` is indeed contained within a `Object<T>`.
+    let obj = unsafe {
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+    };
+
+    match T::open(obj, file) {
         Err(e) => e.to_errno(),
         Ok(()) => 0,
     }
@@ -84,14 +87,13 @@ extern "C" fn close_callback<T: BaseDriverObject<U>, U: BaseObject>(
     let file = unsafe {
         drm::File::<<<U as IntoGEMObject>::Driver as drm::Driver>::File>::as_ref(raw_file)
     };
-    let obj =
-        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::from_gem_obj(
-            raw_obj,
-        );
-
-    // SAFETY: `from_gem_obj()` returns a valid pointer as long as the type is correct and the
-    // `raw_obj` we got is valid.
-    T::close(unsafe { &*obj }, file);
+    // SAFETY: `close_callback` is specified in the AllocOps structure for `Object<T>`, ensuring
+    // that `raw_obj` is indeed contained within a `Object<T>`.
+    let obj = unsafe {
+        <<<U as IntoGEMObject>::Driver as drm::Driver>::Object as IntoGEMObject>::as_ref(raw_obj)
+    };
+
+    T::close(obj, file);
 }
 
 impl<T: DriverObject> IntoGEMObject for Object<T> {
@@ -101,9 +103,10 @@ fn into_gem_obj(&self) -> &Opaque<bindings::drm_gem_object> {
         &self.obj
     }
 
-    fn from_gem_obj(obj: *mut bindings::drm_gem_object) -> *mut Self {
-        // SAFETY: All of our objects are Object<T>.
-        unsafe { crate::container_of!(obj, Object<T>, obj).cast_mut() }
+    unsafe fn as_ref<'a>(self_ptr: *mut bindings::drm_gem_object) -> &'a Self {
+        // SAFETY: `obj` is guaranteed to be in an `Object<T>` via the safety contract of this
+        // function
+        unsafe { &*crate::container_of!(self_ptr, Object<T>, obj) }
     }
 }
 
@@ -144,11 +147,25 @@ fn lookup_handle(
     ) -> Result<ARef<Self>> {
         // SAFETY: The arguments are all valid per the type invariants.
         let ptr = unsafe { bindings::drm_gem_object_lookup(file.as_raw().cast(), handle) };
-        let ptr = <Self as IntoGEMObject>::from_gem_obj(ptr);
-        let ptr = NonNull::new(ptr).ok_or(ENOENT)?;
 
-        // SAFETY: We take ownership of the reference of `drm_gem_object_lookup()`.
-        Ok(unsafe { ARef::from_raw(ptr) })
+        // SAFETY:
+        // - A `drm::Driver` can only have a single `File` implementation.
+        // - `file` uses the same `drm::Driver` as `Self`.
+        // - Therefore, we're guaranteed that `ptr` must be a gem object embedded within `Self`.
+        // - And we check if the pointer is null befoe calling as_ref(), ensuring that `ptr` is a
+        //   valid pointer to an initialized `Self`.
+        // XXX: The expect lint here is to workaround
+        // https://github.com/rust-lang/rust-clippy/issues/13024
+        #[expect(clippy::undocumented_unsafe_blocks)]
+        let obj = (!ptr.is_null())
+            .then(|| unsafe { Self::as_ref(ptr) })
+            .ok_or(ENOENT)?;
+
+        // SAFETY:
+        // - We take ownership of the reference of `drm_gem_object_lookup()`.
+        // - Our `NonNull` comes from an immutable reference, thus ensuring it is a valid pointer to
+        //   `Self`.
+        Ok(unsafe { ARef::from_raw(obj.into()) })
     }
 
     /// Creates an mmap offset to map the object from userspace.
-- 
2.48.1

