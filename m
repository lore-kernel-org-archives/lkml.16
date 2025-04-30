Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DF722A4EF
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055933; cv=none; b=I38VE+Ge4YQgtzPo0zM9AygCBOoLrv/+cXoLVzRxewM+5LLimbiW/7Yg3dqwl+kq/RRSoeW7i3TglNli49jKja+Z+v+FkSCxVgB6iGEz65jw1EUZVnZifquMr8egR0Ul2mtFQr0yE/qYmkct+Aw8CqZtCx1/WF7wYMfOV8p3oqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055933; c=relaxed/simple;
	bh=qzcAKC5z+jfCNwA4KzH4cSbQhEndXssauIghnf8+6Iw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=s3hfONMXmmaDydeATPd4sRQe7qvPX82WUTnUZozD7ql/dOAIEEZlmVAJ1Gd7bIq9LVtS9DMQ0fxxjCuI8Hh6Ur9jWKsZqqU9AtPm/gZYQC9BfDzOyFS6hq+yi8knyif/2ZPs0A0Iapslj+DXQQMs490gEItrTNbp4cLYj88hdqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gp+3aqkC; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gp+3aqkC"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af8f28f85a7so215613a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746055930; x=1746660730; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5080AaWuHxY/+zOzJ0GujJhdmP9WodPLpLxIiRjde1k=;
        b=Gp+3aqkC9JSfAvNTZcipa07IRiR2v953NNvuVeX3z0LKEfMgyTz241a7FxsOcpJVuN
         w5IG2LtzDzC6bvOiHS/P3waWhJbVUXkGfwE2BNMr4+IeWM3zk6RQuIJyNpSdMsnLN+t0
         y+OvTWAPKuknNLyWs47FDdWoAXL3wRIvHNzMzaDzp3Fl3DoOPBuWmGb3nH5mLAhiHczf
         QCFxswjcf/qAU371+PIVy8UY2OKtaVpl0OK7IoxE+36xX++w+0mgh/WVcWc5WgvimCdE
         K0TomsNPj54tTR9MW1tvEnPz1tzGfSrkJAbs7rgQruz7r10UXlNcSHaFiaGvTIqWke3o
         r9IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055930; x=1746660730;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5080AaWuHxY/+zOzJ0GujJhdmP9WodPLpLxIiRjde1k=;
        b=vb8PnL8zlFZVL1fTTo3kPfBYzhJMgJ48flgOYptM0VtXnjlxBzt8Opn/O6V2FtkVVs
         I5J0HFNSNvO4Cey0zDwY7bC5zURUd3i966CTPZ0ZGOY9pn7wsKn0hDaYYDoaTKa2Lq3m
         Kzo9cUqbUO09VnHBjD210f8zKRbScmttEUDA9g7u23nS6zzR+pxixHLO5snklg6OJ7ar
         mkcaTkKexAQyVCONAjoI6vz8yTKKXDjEexvXbTlG5Z+cz+i09qtjU2C4sZDB0UTwo6zg
         bRTvWzDx0QjqHEWRy7Hsp0SXQJjBJGS/SMZ5uC4QcS7OBuKqR8A1sEGvwOiXYp7JKb9T
         wEYg==
X-Gm-Message-State: AOJu0Yy0L6Z1Mzw4d+8EVe8VcWIfeM4GB1JXefJA2TwlMimVacZE6aof
	+U4Q0k5zcK9UcVig6IKaHoUy9VY4MHC9QphC/nGrj+kYnKgDvnwQoQh1t9l9MSutZoGLUEr0Hco
	yNlIi9w==
X-Google-Smtp-Source: AGHT+IElgHFwEamhzSuEWWDqRNvDc8mU6IwdF7N8R9tOi4vLjCZKi6WUSh+RMkJJbUhBrb1Jw3Yo32RnfcMo
X-Received: from pfoc24.prod.google.com ([2002:aa7:8818:0:b0:740:3d9e:4ca4])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:9992:b0:203:bb3b:5f1e
 with SMTP id adf61e73a8af0-20ba6a20256mr1575665637.1.1746055930537; Wed, 30
 Apr 2025 16:32:10 -0700 (PDT)
Date: Wed, 30 Apr 2025 23:31:58 +0000
In-Reply-To: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-debugfs-rust-v2-0-2e8d3985812b@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746055923; l=6267;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=qzcAKC5z+jfCNwA4KzH4cSbQhEndXssauIghnf8+6Iw=; b=BLUTi5wgUiCtHSwywOnXg7KwtoWkKYwPHNnn1kBJkmDnSNGjVUhs/H0jmIrBAmfcN8j69iqTe
 6tMnI1IVqOaA3z54jzttXFC6Wep2R8JNFk02WWa8jQNYibUMq2L4bMl
X-Mailer: b4 0.14.2
Message-ID: <20250430-debugfs-rust-v2-3-2e8d3985812b@google.com>
Subject: [PATCH v2 3/4] rust: debugfs: Support format hooks
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
 rust/kernel/debugfs.rs | 110 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 109 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 87de94da3b27c2a399bb377afd47280f65208d41..2935c7ffbfaf460fff5b5f1ffc768f803c2da345 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt;
 use core::fmt::Display;
 
 /// Handle to a DebugFS directory.
@@ -136,6 +137,47 @@ pub fn keep(self) {
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// ```
     pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> Self {
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
+    pub fn fmt_file<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &'static T,
+        f: &'static F,
+    ) -> Self {
+        // SAFETY: As `data` lives for the static lifetime, it outlives the file
+        unsafe { self.fmt_file_raw(name, data, f) }
+    }
+
+    /// Creates a DebugFS file backed by the display implementation of the provided pointer.
+    ///
+    /// # Safety
+    /// The pointee of `data` must outlive the accessibility of the `Dir` returned by this function.
+    /// This means that before `data` may become invalid, either:
+    /// * The refcount must go to zero
+    /// * The file must be rendered inaccessible, e.g. via `debugfs_remove`
+    unsafe fn display_file_raw<T: Display + Sized>(&self, name: &CStr, data: *const T) -> Self {
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by CStr invariant
         // * `parent` is a live dentry since we have a reference to it
@@ -163,6 +205,32 @@ pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) ->
             Self()
         }
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
+    unsafe fn fmt_file_raw<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &T,
+        f: &'static F,
+    ) -> Self {
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
 
 impl Drop for Dir {
@@ -180,7 +248,9 @@ fn drop(&mut self) {
 mod helpers {
     use crate::seq_file::SeqFile;
     use crate::seq_print;
-    use core::fmt::Display;
+    use core::fmt;
+    use core::fmt::{Display, Formatter};
+    use core::marker::PhantomData;
 
     /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`
     ///
@@ -231,6 +301,44 @@ pub(crate) trait DisplayFile: Display + Sized {
     }
 
     impl<T: Display + Sized> DisplayFile for T {}
+
+    // INVARIANT: F is inhabited
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
+    /// # Safety
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

