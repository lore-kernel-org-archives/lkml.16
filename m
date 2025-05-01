Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3C2265CD6
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746139672; cv=none; b=DO3qD4fYLCczHFx0PaIIhhSfydcBo513/8d5KWEeNUTjJNP3A+xDU6a5sCiV5ExKRmoMQGF6n/B3NQKTBbIQQh4xNXhUbxByt31M3SY7fuJH46JksZruDDqm9kifrOkdmXF17ri0S2hFRPV9UcpwAEk3Pfw+MaTnek7XFGSG89U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746139672; c=relaxed/simple;
	bh=HbnP5HAr/7GrvIZ/usUBfS0jEKFbS6C4taoCnpgU62M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XKOCx+uVVpCyVT7tp6VjPaF7DrKj7j+Fmb8zymcClxG2hopM9UPEi5yQrlNwVe5qizOICyYVN7eFhaXQSZuadh5dvTfAG+DC16vfxPrglI6+5Ou8Pn1okfdsbzA302gb/+q736fot8ZuDC4QoYAd6kpfWp1OZjssS2Qd+AAnQLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l2v97HjN; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l2v97HjN"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-73c09e99069so1611193b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746139670; x=1746744470; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QvSZKcf5Ez4NdQxzj0zDxtHsG3SSXzKb6tYz9Hk+k2s=;
        b=l2v97HjNkg1OY7WuM7mO56VE1xMMbEb+Ltm7o4tZkEkBJKvPGkUAsAKzukxPMZKMv3
         Djvks725XsXIxPmLTnFk//9W+XD7buVgiGBuX6TREGTZdAY3dlquBX8SMQqbgQm4l5kg
         RhKltHUA1I4zfexp6QaGCtPQBSlUDnbPqnMGGzOoBXikStDwdo6lKpQ57vZTvcwrDahf
         wBzSWNZWSTqbWEmckJUr3mtbRCa01jhQ725kQRD4G50ChjbIZS/hUm4m/24XIYBF+aIt
         gzKuOLfPijKxWIhK42D9FBhfqJl5bV9yWDcWPOqk+dX6abA4CI+FX5DCoJAGwCgctFH4
         xv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746139670; x=1746744470;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QvSZKcf5Ez4NdQxzj0zDxtHsG3SSXzKb6tYz9Hk+k2s=;
        b=e4+JtsvhrYEZ1YQ7g10IPVYi4TrWegZVsspVdworzzD7Qc30Yo7Fwe5UI3B+W4yBrY
         hIYYmmGuHkBL9F8AhUjE+1HI2IB7P12DGtnARX01tLDaojQ2TNYDTj8PWAwM2MzUUvwy
         DT2pM7vEqLAdK154JY1cZ8HFGSEsHlLhw4AS7HLG+J3CnvFAcd4mhjZxxONcikhoGKMu
         PSO0lW0zlUOr2cwmTWfQHRtUk/+rp2eSj5kjCeycxR3oyfNRs4VaJnuumBRKjEBqB2FO
         LRyLEDwEou3/9TyqX0IU1txBiU6KlNNKNR02kTESK3GJqp19FVpO4exDv/dpaBfVWeie
         5tTw==
X-Gm-Message-State: AOJu0Yxgc1ASplK4+7bHCEyQb9kKtjlMq1eYWACqQ04yrCzg3EKGgZ51
	VYTe3qtWSfNM4OfcdNkcTj0Tp4Lzc6+wkHGyl5skqa1N+Bs5FA3PGqH4hrxEQSu88qwXVGugo8D
	C81R0LQ==
X-Google-Smtp-Source: AGHT+IEPkIEce4lfj55Uh62mCtxMLmgEn7c5rBVaAwAF/1wZO8ZRtpT8zH0RVHOjC6G6T2zH+9JNs5/yLg4Q
X-Received: from pggj20.prod.google.com ([2002:a63:cf14:0:b0:b13:7874:b1b3])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3514:b0:203:bb3b:5f1d
 with SMTP id adf61e73a8af0-20cde46dc23mr968514637.6.1746139670023; Thu, 01
 May 2025 15:47:50 -0700 (PDT)
Date: Thu, 01 May 2025 22:47:43 +0000
In-Reply-To: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501-debugfs-rust-v3-0-850869fab672@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746139663; l=6626;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=HbnP5HAr/7GrvIZ/usUBfS0jEKFbS6C4taoCnpgU62M=; b=u9TN62e2FvLUjy7e71xyNxi3VK9E1i80eBawwFQs2oOwRS4zHRI8D+/UJYvZJSkeoHVuQ6tj7
 U0bDOHcgntcBwgDsIU3Ak1/hrqkMsT3alE+uXQ0neeT67GincPxwKkP
X-Mailer: b4 0.14.2
Message-ID: <20250501-debugfs-rust-v3-3-850869fab672@google.com>
Subject: [PATCH v3 3/4] rust: debugfs: Support format hooks
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
 rust/kernel/debugfs.rs | 118 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 117 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index ef69ae8f550a9fe6b0afc1c51bebaad2fc087811..9689e21cb24903e9f5a21fb93e6652adc5cafbdc 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -7,6 +7,7 @@
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
 use crate::str::CStr;
+use core::fmt;
 use core::fmt::Display;
 use core::mem::ManuallyDrop;
 use core::ops::Deref;
@@ -133,6 +134,48 @@ fn as_ptr(&self) -> *mut bindings::dentry {
     /// // "my_debugfs_dir/foo" now contains the number 200.
     /// ```
     pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) -> File {
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
+    ) -> File {
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
+    unsafe fn display_file_raw<T: Display + Sized>(&self, name: &CStr, data: *const T) -> File {
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
         // * `parent` is a live `dentry` since we have a reference to it.
@@ -161,6 +204,32 @@ pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'static T) ->
         };
         File(ManuallyDrop::new(dir))
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
+    ) -> File {
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
@@ -228,7 +297,9 @@ pub fn remove(self) {
 mod helpers {
     use crate::seq_file::SeqFile;
     use crate::seq_print;
-    use core::fmt::Display;
+    use core::fmt;
+    use core::fmt::{Display, Formatter};
+    use core::marker::PhantomData;
 
     /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
     ///
@@ -283,6 +354,51 @@ pub(crate) trait DisplayFile: Display + Sized {
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

