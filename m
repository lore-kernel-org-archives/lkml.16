Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B861B4223
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213702; cv=none; b=emrZCGIDhNuC+xYvkATifG6VhVrX3EKEFVmxvgVkqDWY4GRWtST46MMsdBj6hgu1Euu0AxPQh9qZTg5Yo+j53j0jjmESFBXAPgClfeEa1sgaZNkVnKjy3Y/2s5Z9bsdJOjrOv2Y+py+CWGZe01uDJwl//QQCC8O9fVb9vq6e4gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213702; c=relaxed/simple;
	bh=7DbO/U0Rj2wyZtj+j8Z2FBKA+3rtUseZ8Hbvsru8fEM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=YJqIXURl0iPHvhgxIp6o3tsUBkceGO+znXyg3jeieKQNJULBeD9NtP09vJCek9E+ASicAGHC1gtsB/AnIOLawi6uCetF/C762FbkKwAEFK508+MVekLpJcmt4I0UEOU3u7xHB8dSWtnWlyBaj1is9o3I8kakwMW8hG2ktNKMQNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V9Nfm9Gp; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9Nfm9Gp"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-234b133b428so47572995ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213700; x=1750818500; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DMo2kOcPe/ZWoI8EPcGG6fh15t/rhnw+MiWtIgoq4ZU=;
        b=V9Nfm9GpKI5HKyae4HvjYdg1CYuL5jU5fnZyb560EUSgPTFLSMSnLCtsqvxsM2Y9xS
         G3fUGNVLLbn8MD1czCz+JR1ofdl7L3+vBm3wjXO1Xsr/5tmn3oqi8TYMrY7P53Sr8DQg
         MnHaaK8MZCvnyx/kQlPjUvhGIAemx2bbz+gEpuYAuTOtdVtHhKSsxZZ3j1kuum3/b/Ro
         6ZbLIEJiVA3I/h4y35K4eMJEI5ivREa7cqlitmvqyJqSU204H209OqB0kKZGEFlL1FP+
         E2qIw6R/7qITwIUHvzjJsWX1foRO6DVtCb31vImUflD5PKHSV5iOA4smnvFK2+NG/DJI
         MsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213700; x=1750818500;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DMo2kOcPe/ZWoI8EPcGG6fh15t/rhnw+MiWtIgoq4ZU=;
        b=AsrH11Nw8Q5tKNafNwgyt6btoZv5zGbNWlwQr0GF5DwdYvmk6oyOj/lypFuTKbrAR8
         kLLUkk8MsLEdCjcYuf8dOvW1Mijm1vTzkruDPRMNobluaSCnHs6WXk1kupcxMKZnmyGh
         5EMlw1VKRWMDoY2JuwJcb5ShCc87+23Ypxtlek4bHzEGm2Sgx9lSrBlk4YvBadgMPBS6
         NfSXs16qtupI/QtCOTchoNNYNE+Nbxd3zmf0TMUzQK5wC5YMJzeLMfX455rjWdAlKAXH
         lNvcYZ/MBgVIlN4V+EtdFN1/+da7kEKMq+7PtkqTHue1enmrnhxTdCU8N3sDIOhYigNq
         5xEg==
X-Gm-Message-State: AOJu0YwPVMCzNu4bLPit0cGGf67u0Udorre/kCByL6Jui3T//+afW9No
	ggeAAGXK1IgSzFIh2ycdQUYzqGf/tJrb86iyqLzFWpeqJlKHt7euZbve7+MCszXfvYUfxVWLlAI
	DmIDXxhwc3g==
X-Google-Smtp-Source: AGHT+IHLLmO2+2COBaCiPQUQ2aZiyF2aMmTHgGG9hkU78sySo5jkiz9ScIwnxSFaP9yWZPDCHZU1r3AFS2b0
X-Received: from plly18.prod.google.com ([2002:a17:902:7c92:b0:223:4c5f:3494])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:a613:b0:236:7333:f183
 with SMTP id d9443c01a7336-2367333f74emr154142285ad.19.1750213700484; Tue, 17
 Jun 2025 19:28:20 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:15 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=4592;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=7DbO/U0Rj2wyZtj+j8Z2FBKA+3rtUseZ8Hbvsru8fEM=; b=+GncevBBFmPb+hkR23fxazLrX2DyWqwKtQRDSzgmSa/c74FiR0bg8QZWEX64eVGOhwQUQ3OPY
 V1Mh+9iicqMCrX5Snibeexc6j949EbZHPl4v85RZVgyuLJtw3gVPXi4
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-3-72cae211b133@google.com>
Subject: [PATCH v6 3/5] rust: debugfs: Support arbitrary owned backing for File
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This allows `File`s to be backed by `Deref<Target=T>` rather than just
`&'static T`. This means that dynamically allocated objects can be
attached to `File`s without needing to take extra steps to create a
pinned reference that's guaranteed to live long enough.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 51 ++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 12 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 6a89557d8cf49327d2984d15741ffb6640defd70..cd83f21cf2818f406575941ebbc6c426575643e4 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -5,12 +5,13 @@
 //!
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
-#[cfg(CONFIG_DEBUG_FS)]
+use crate::alloc::KBox;
 use crate::prelude::GFP_KERNEL;
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use core::fmt::Display;
+use core::ops::Deref;
 
 #[cfg(CONFIG_DEBUG_FS)]
 mod display_file;
@@ -61,40 +62,59 @@ fn create(_name: &CStr, _parent: Option<&Dir>) -> Self {
     }
 
     #[cfg(CONFIG_DEBUG_FS)]
-    fn create_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+    fn create_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
+        &self,
+        name: &CStr,
+        data: D,
+    ) -> File {
+        let mut file = File {
+            _entry: entry::Entry::empty(),
+            _data: None,
+        };
+        let Some(data) = KBox::new(data, GFP_KERNEL).ok() else {
+            return file;
+        };
+
         let Some(parent) = &self.0 else {
-            return File {
-                _entry: entry::Entry::empty(),
-            };
+            return file;
         };
+
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
         // * `parent` is a live `dentry` since we have a reference to it.
         // * `vtable` is all stock `seq_file` implementations except for `open`.
         //   `open`'s only requirement beyond what is provided to all open functions is that the
         //   inode's data pointer must point to a `T` that will outlive it, which we know because
-        //   we have a static reference.
+        //   we have an owning `D` in the `File`, and we tear down the file during `Drop`.
         let ptr = unsafe {
             bindings::debugfs_create_file_full(
                 name.as_char_ptr(),
                 0o444,
                 parent.as_ptr(),
-                data as *const _ as *mut _,
+                data.deref() as *const _ as *mut _,
                 core::ptr::null(),
                 &<T as display_file::DisplayFile>::VTABLE,
             )
         };
 
+        file._data = Some(data);
+
         // SAFETY: `debugfs_create_file_full` either returns an error code or a legal
         // dentry pointer, so `Entry::new` is safe to call here.
-        let entry = unsafe { entry::Entry::new(ptr, Some(parent.clone())) };
+        file._entry = unsafe { entry::Entry::new(ptr, Some(parent.clone())) };
 
-        File { _entry: entry }
+        file
     }
 
     #[cfg(not(CONFIG_DEBUG_FS))]
-    fn create_file<T: Display + Sized>(&self, _name: &CStr, _data: &'static T) -> File {
-        File {}
+    fn create_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
+        &self,
+        _name: &CStr,
+        data: D,
+    ) -> File {
+        File {
+            _data: KBox::new(data, GFP_KERNEL).ok().map(|x| x as _),
+        }
     }
 
     /// Create a DebugFS subdirectory.
@@ -125,7 +145,11 @@ pub fn subdir(&self, name: &CStr) -> Self {
     /// dir.display_file(c_str!("foo"), &200);
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// ```
-    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
+    pub fn display_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
+        &self,
+        name: &CStr,
+        data: D,
+    ) -> File {
         self.create_file(name, data)
     }
 
@@ -147,4 +171,7 @@ pub fn new(name: &CStr) -> Self {
 pub struct File {
     #[cfg(CONFIG_DEBUG_FS)]
     _entry: entry::Entry,
+    // The data needs to be kept in a `Box` to prevent it from moving when the file does, as
+    // this might invalidate the pointer that's been passed to debugfs.
+    _data: Option<KBox<dyn Send + Sync>>,
 }

-- 
2.50.0.rc2.696.g1fc2a0284f-goog

