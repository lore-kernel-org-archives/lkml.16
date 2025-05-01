Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C207A2EB1D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124664; cv=none; b=fWbdLg2YWaZATPdHa6un/+AIw7phPZSd5sho93KaCMZ4pwQ69St913UGp2nD+BaslYu/Z6oIVqXaTcvftJ5DkL+nuMvTaIFsFclz0fIkPm+hodGUv07NPWVkwb/qhk71bO7LWhgJARcr9PtJgYwvGwArA6esMT1GmD+rMtI2em4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124664; c=relaxed/simple;
	bh=QKJ4KMIR2LHo4QbyjHq6CKsc6K7OQm8a8lXBoN9U8yo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAv4eCKs1ULmntfSxqWcsIVFY7cMfrQww8+24Wu5sTalgL9/Shkw4pNmksjxbFnKWTnBZxixVBlV2RgC+eXKcz32sRWh6vQ6IkgNe57H3RKv4iHfQdBOk0G1TcDr4iBBtOMQnPWstEqkopPhFoOCzkVE2JUmN9yDnYkrmRQRQcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bP4uz6cz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bP4uz6cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746124660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yk7M5D8H8aC/JgAaxCS1maVk5f6A5cbefflNr0lOROM=;
	b=bP4uz6cz06ZrGNxqsHWjLVFZYWMvfLoybvmZlfCW535Zad0Fl48RjcbP/RUqzI5KgpT+I1
	TE8CRzGFqIbX5+sKvUDXpRjxKPeoaPS6HeA3uO7VXAKPFS1fRRakm263OQKln/XnskGjhP
	wOu1AOHScTWnhNbOJtJKzWel/APMcJA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-402-U4in9u2YObyfp8QPw3IqWA-1; Thu,
 01 May 2025 14:37:37 -0400
X-MC-Unique: U4in9u2YObyfp8QPw3IqWA-1
X-Mimecast-MFC-AGG-ID: U4in9u2YObyfp8QPw3IqWA_1746124655
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B899F1800980;
	Thu,  1 May 2025 18:37:34 +0000 (UTC)
Received: from chopper.redhat.com (unknown [10.22.88.132])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0D2E41800115;
	Thu,  1 May 2025 18:37:29 +0000 (UTC)
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
Subject: [PATCH 1/4] rust: drm: gem: Use NonNull for Object::dev
Date: Thu,  1 May 2025 14:33:16 -0400
Message-ID: <20250501183717.2058109-2-lyude@redhat.com>
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

There is usually not much of a reason to use a raw pointer in a data
struct, so move this to NonNull instead.

Signed-off-by: Lyude Paul <lyude@redhat.com>
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
2.48.1

