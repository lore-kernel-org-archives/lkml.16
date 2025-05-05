Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D571313048
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746489104; cv=none; b=PgnfYNjE57bsMDKnqw8Gx1d6pdtPnpYAw3Qdkx5n6bydxTNHx9yQEOD+pt9hvgOdFyf/5RSylFYh0xq0f6IlzzxCGWy07J9QXNk8NAYN5WEcxfC54fIxgUEiwI8mHp+IUBSJCLBUvrg5B9knWgxs6t2EpLfpRhJ43yVoykjGUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746489104; c=relaxed/simple;
	bh=vA+3O1t3AGi/2mn5IPfBFihGnHyNUnS1wn1tz2cJ2+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IzoPAgl/V81nioTa4oUf38Sh2nmzvlWjvW/OaWkrOTLlE5JsDiAi4VMDQ10vEMdlrn0OpwL4qM3lRDTZfznvWsJX9ctMJqQ6lU4XGz+8EYiQK8MPdBmZDxMfODq9W0Rv5ZqIwNC41FVjW2IR/6JbFu2DAvXDMTplH2wem9efUT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nWkjZ/S/; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nWkjZ/S/"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2241e7e3addso45350375ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 16:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746489102; x=1747093902; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jacHybD5l2r2uNkGTUFeSA2UwX+BWUuxXqoE7r0Z5kU=;
        b=nWkjZ/S/ovy7CNNOYIy8je/lm/5m02UD8NuxxNUYDuXQ+HhxAcU0V2unkQB0yOrBBb
         bSmLj9IVT104Hm59o/uW06j6w3QC4zgA29EqbysrigRHuO046/O5FXW8MXDpUVJGfqh/
         bmKiNp8B/3PsHtp5UcXD6VkkzUb0v6xI44MN+62Efx1uS79eh2LUn9z99ogXozer32By
         acWBZmMRDEZNnDS9WNiLcG/3gwu3vhpxRfZdH3KBf63Z16ZYTSppEimAYS+cqUNOizz1
         NcDkYF70dtYk4pZPqURnLwrXXaKf54DBtrn8h6DRuRM+wPtdNN+bvRCqXWn62GqIxHfA
         poiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746489102; x=1747093902;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jacHybD5l2r2uNkGTUFeSA2UwX+BWUuxXqoE7r0Z5kU=;
        b=Lk/edUAC310XMoYrykb+8XwpWXEfdkXUCk5E2VCsEuzKxvmWA3aH0aD3/zkbvmBNGt
         jaM4ZNIfrVkpGS+SQx7arSP/5kZaibMyDi+oF3pvWS3nELOV29H+UhmufIjKxPDMwOOJ
         7XzkHr+kg0YCZgBCgG2njEnFlPXa/uC6eMDdJn29tTuYx6KQxub5MhgCfdvldHnfnpoa
         uXHh0vmcNiloTmXKCj+dsIDeCGV+3FKLbYJ8lhESDjmVpTEZ5xc2DkNsiio05o9qP9x8
         s1gM/6FB665TdPOrt4DdaDK4qI3urC8d9QSLxT4KmnFGZ5MOXiboSzNQ61sGdOU90Tk0
         dUSg==
X-Gm-Message-State: AOJu0YzwNM5wJEBvJWOHVFmj9ywGEjZq/boHdQ1VLrckRqeEl9Ekokj7
	IqvnN/PYS1l/tSRGtRz8SN+xJdkBAG0t+M6o/50b+pnYYmR2CdRJRKlFqe51rhDmeo6mQpBLB8s
	2fewvvA==
X-Google-Smtp-Source: AGHT+IGlOzGin2PKFA5mkv3PM64Fa1xlk2aR4bHHjsQrq6I6muDss5yiDkB6A08sID82xIf/IFdy+5L3Pem4
X-Received: from plop13.prod.google.com ([2002:a17:902:8a8d:b0:22d:e49c:3cb])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da8c:b0:223:2630:6b82
 with SMTP id d9443c01a7336-22e102b8c91mr236889605ad.10.1746489101802; Mon, 05
 May 2025 16:51:41 -0700 (PDT)
Date: Mon, 05 May 2025 23:51:36 +0000
In-Reply-To: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746489094; l=6727;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=vA+3O1t3AGi/2mn5IPfBFihGnHyNUnS1wn1tz2cJ2+U=; b=tSSeDVBlQ7e9YMpXKBMRXFBdgOdeR5lLT0Oc9eMsrvbh/aDxJR6EmeGVRBQRPPoWXCd15gAL5
 /vydOhPRrLKDRaqDpSE2y9wZ7/ub5ENCys4kDQlf+Ew82H9anaCun5O
X-Mailer: b4 0.14.2
Message-ID: <20250505-debugfs-rust-v5-3-3e93ce7bb76e@google.com>
Subject: [PATCH v5 3/4] rust: debugfs: Support format hooks
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Rather than always using Display, allow hooking arbitrary functions to
arbitrary files. Display technically has the expressiveness to do this,
but requires a new type be declared for every different way to render
things, which can be very clumsy.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 123 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 4a138717bd0fdb320033d07446a192c9f520a17b..e2f5960bb87f24607780b3f4e67039e379f3bda6 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -6,6 +6,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt;
 use core::fmt::Display;
 use core::marker::PhantomData;
 
@@ -154,6 +155,52 @@ pub fn display_file<'b, T: Display + Sized>(
         &'b self,
         name: &CStr,
         data: &'static T,
+    ) -> File<'b> {
+        // SAFETY: As `data` lives for the static lifetime, it outlives the file.
+        unsafe { self.display_file_raw(name, data) }
+    }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking `f`
+    /// on the provided reference.
+    ///
+    /// `f` must be a function item or a non-capturing closure, or this will fail to compile.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use core::sync::atomic::{AtomicU32, Ordering};
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("foo"));
+    /// static MY_ATOMIC: AtomicU32 = AtomicU32::new(3);
+    /// let file = dir.fmt_file(c_str!("bar"), &MY_ATOMIC, &|val, f| {
+    ///   let out = val.load(Ordering::Relaxed);
+    ///   writeln!(f, "{out:#010x}")
+    /// });
+    /// MY_ATOMIC.store(10, Ordering::Relaxed);
+    /// ```
+    pub fn fmt_file<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &'b self,
+        name: &CStr,
+        data: &'static T,
+        f: &'static F,
+    ) -> File<'b> {
+        // SAFETY: As `data` lives for the static lifetime, it outlives the file
+        unsafe { self.fmt_file_raw(name, data, f) }
+    }
+
+    /// Creates a DebugFS file backed by the display implementation of the provided pointer.
+    ///
+    /// # Safety
+    ///
+    /// The pointee of `data` must outlive the accessibility of the `Dir` returned by this function.
+    /// This means that before `data` may become invalid, either:
+    /// * The refcount must go to zero.
+    /// * The file must be rendered inaccessible, e.g. via `debugfs_remove`.
+    unsafe fn display_file_raw<'b, T: Display + Sized>(
+        &'b self,
+        name: &CStr,
+        data: *const T,
     ) -> File<'b> {
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
@@ -189,6 +236,32 @@ pub fn display_file<'b, T: Display + Sized>(
         File(entry)
     }
 
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking the
+    /// fomatter on the attached data.
+    ///
+    /// The attached function must be a ZST, and will cause a compilation error if it is not.
+    ///
+    /// # Safety
+    ///
+    /// `data` must outlive the resulting file's accessibility
+    unsafe fn fmt_file_raw<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &'b self,
+        name: &CStr,
+        data: &T,
+        f: &'static F,
+    ) -> File<'b> {
+        #[cfg(CONFIG_DEBUG_FS)]
+        let data_adapted = FormatAdapter::new(data, f);
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        let data_adapted = {
+            // Mark used
+            let (_, _) = (data, f);
+            &0
+        };
+        // SAFETY: data outlives the file's accessibility, so data_adapted does too
+        unsafe { self.display_file_raw(name, data_adapted) }
+    }
+
     /// Create a new directory in DebugFS at the root.
     ///
     /// # Examples
@@ -202,6 +275,7 @@ pub fn new(name: &CStr) -> Self {
         Dir::create(name, None)
     }
 }
+
 /// Handle to a DebugFS file.
 #[repr(transparent)]
 pub struct File<'a>(Entry<'a>);
@@ -210,7 +284,9 @@ pub fn new(name: &CStr) -> Self {
 mod helpers {
     use crate::seq_file::SeqFile;
     use crate::seq_print;
-    use core::fmt::Display;
+    use core::fmt;
+    use core::fmt::{Display, Formatter};
+    use core::marker::PhantomData;
 
     /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
     ///
@@ -265,6 +341,51 @@ pub(crate) trait DisplayFile: Display + Sized {
     }
 
     impl<T: Display + Sized> DisplayFile for T {}
+
+    /// Adapter to implement `Display` via a callback with the same representation as `T`.
+    ///
+    /// # Invariants
+    ///
+    /// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inhabited.
+    #[repr(transparent)]
+    pub(crate) struct FormatAdapter<T, F> {
+        inner: T,
+        _formatter: PhantomData<F>,
+    }
+
+    impl<T, F> FormatAdapter<T, F> {
+        pub(crate) fn new<'a>(inner: &'a T, _f: &'static F) -> &'a Self {
+            // SAFETY: FormatAdapater is a repr(transparent) wrapper around T, so
+            // casting a reference is legal
+            // INVARIANT: We were passed a reference to F, so it is inhabited.
+            unsafe { core::mem::transmute(inner) }
+        }
+    }
+
+    impl<T, F> Display for FormatAdapter<T, F>
+    where
+        F: Fn(&T, &mut Formatter<'_>) -> fmt::Result + 'static,
+    {
+        fn fmt(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+            // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+            let f: &F = unsafe { materialize_zst_fmt() };
+            f(&self.inner, fmt)
+        }
+    }
+
+    /// For types with a unique value, produce a static reference to it.
+    ///
+    /// # Safety
+    ///
+    /// The caller asserts that F is inhabited
+    unsafe fn materialize_zst_fmt<F>() -> &'static F {
+        const { assert!(core::mem::size_of::<F>() == 0) };
+        let zst_dangle: core::ptr::NonNull<F> = core::ptr::NonNull::dangling();
+        // SAFETY: While the pointer is dangling, it is a dangling pointer to a ZST, based on the
+        // assertion above. The type is also inhabited, by the caller's assertion. This means
+        // we can materialize it.
+        unsafe { zst_dangle.as_ref() }
+    }
 }
 
 #[cfg(CONFIG_DEBUG_FS)]

-- 
2.49.0.967.g6a0df3ecc3-goog

