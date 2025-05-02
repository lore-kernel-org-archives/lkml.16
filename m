Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2671F7060
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 19:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746215393; cv=none; b=P7+QhHHcGsudjyzWDDPZhP7PHmYRMl2ST/WSNN7MGOWNgoRNk+Gyg1qoF693ziOWBtk6uYVBkibzgbrOyu4IFoit6WDRAGYup+1/wW1iLFKKW5l7+ngHwx/JNOyhzsWMSoeaLKMu4+Axt/MGEI/pkBo1nk4TqKcYO8L8BTviCdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746215393; c=relaxed/simple;
	bh=JhApeNpm6KRKmDZL064E5Lc9ddDprNYbokO6XuBFr20=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cXv7srYrlESb4i5WiYPL40+VARz/+csmrZDRMuuLfuFBORHZXXfEwYhkJjtkNcxj5OGBAe+L5C2YqQx8OBGh5k3wmis5xL136gAIybEj48mqH68+MlK98Yp0XOUbeUeW7zpwuUe49Hm4ASh696rF7K8b3VUu3c+1fILb6ZdzZyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0IOK7RgY; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0IOK7RgY"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30872785c3cso3613110a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 12:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746215391; x=1746820191; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iI6/+R49BrXGz9ZHCjQKdNUfmCZ6Bd/PYP3WfSK4eew=;
        b=0IOK7RgY+Qr6sCzBkgjFsqquhyTlWUq3baQYbT/mMGW2CZhWJ4t33DoXF+awKahmgY
         ww7VCdmKjkbnnk3aqxy0ZGCFGy3uaSRJl5BHkRiU3hkrccXevtLx8JjiGArKQjDDEEGl
         Plj+uPKoz9GAgiXkW5d5IOdcUxy1321KjtGxPEmVdKVaBMA09+IrA36/dyBnJwAf6s9O
         CQ6PwpPXDeCyBZgAIYGglSkj13mZ1jxh7ccCH3ErCnBSwRXyW84TV0O4K0mM8+o//+3l
         8tdQMpXQVJ5M9zP/Nc9HLG81GLiiLC+X1cl9AIbZgatIqPADq+ELomDEzhsnjbwZMZ5w
         ov2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746215391; x=1746820191;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iI6/+R49BrXGz9ZHCjQKdNUfmCZ6Bd/PYP3WfSK4eew=;
        b=TE/OoY01HXvEh1qts+xeyUKmg71/bqllJpUIS99qcViq/fNRlVb3SUeBB42OOqZKRY
         eLlaOQ343aoIVWxs6xnnRjdR4hCysXvmrgAgFNRPaMDLd44RIE9+oGFxtB7kVub1Qqvn
         scpEllLw7bcCaz0DoYmL5F5xszKgN6XTB2xXvSQ/N9n1JdCmr2I79fIoRWBrVPw/coKE
         Z4lDXn+3qIK8CKTX7yvSkjfuuFvuiv2wOz56xe4pYGqWaITX0t6unrGy3hhlvSDBl7iX
         yJoSMf4sKEBBJOPG0eCInQFrC2aOaAQuT4wEoq228QhAdF0Z40ctTQ0nQKYPcv8t/p1s
         +p5g==
X-Gm-Message-State: AOJu0YyB7rbh0ZH0nzSwCq/F5KRg3KVtf8ipQy1ZpUgFBfNysA8hZfSU
	fptzQ1dcQpq5xpBbks6jb78R4XEeIUedLAVdYasQi2NhxrxcsKdQ1bF7iTIx6Lb1hmkxXiEf1gb
	hbEq64w==
X-Google-Smtp-Source: AGHT+IHTc7hZUu50VWfyrKHUUfkiL73Zvx1DsxEHHlEKNWDd0bBmcIuaBBUDVwG5blJVXkp7l2oKvJ8RZx23
X-Received: from pjbsq6.prod.google.com ([2002:a17:90b:5306:b0:2fa:2891:e310])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2ccd:b0:2ff:7c2d:6ff3
 with SMTP id 98e67ed59e1d1-30a5aed74b2mr751065a91.35.1746215390696; Fri, 02
 May 2025 12:49:50 -0700 (PDT)
Date: Fri, 02 May 2025 19:49:32 +0000
In-Reply-To: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-debugfs-rust-v4-0-788a9c6c2e77@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746215384; l=6651;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=JhApeNpm6KRKmDZL064E5Lc9ddDprNYbokO6XuBFr20=; b=i6MEteXCHFzqGFc9pgXr5/46UZJsVrF/7VEewzeYl9g8c+Ydi7wnJU9Xz8DXmJsIf/6ECr3gW
 m54roob78oLCLs1MY8gAb9nZomtj/5N86TpmTV+jQ3qZ0Vvv3tczok8
X-Mailer: b4 0.14.2
Message-ID: <20250502-debugfs-rust-v4-3-788a9c6c2e77@google.com>
Subject: [PATCH v4 3/4] rust: debugfs: Support format hooks
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
 rust/kernel/debugfs.rs | 124 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 21b116abad864d303f11cc515fe6f86ce5d51cbf..cfdff63c10517f1aebf757c965289a49fed6ae85 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt;
 use core::fmt::Display;
 use core::marker::PhantomData;
 
@@ -123,9 +124,55 @@ pub fn subdir<'b>(&'b self, name: &CStr) -> Dir<'b, true> {
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// ```
     pub fn display_file<'b, T: Display + Sized>(
-        &'a self,
+        &'b self,
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
@@ -160,6 +207,32 @@ pub fn display_file<'b, T: Display + Sized>(
 
         File(dir)
     }
+
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
 }
 
 impl<'a> Dir<'a, false> {
@@ -234,7 +307,9 @@ pub fn remove(self) {
 mod helpers {
     use crate::seq_file::SeqFile;
     use crate::seq_print;
-    use core::fmt::Display;
+    use core::fmt;
+    use core::fmt::{Display, Formatter};
+    use core::marker::PhantomData;
     use core::ptr::addr_of;
 
     /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
@@ -292,6 +367,51 @@ pub(crate) trait DisplayFile: Display + Sized {
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
2.49.0.906.g1f30a19c02-goog

