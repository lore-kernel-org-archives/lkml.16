Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0044129899D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 01:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746493459; cv=none; b=oba1cFZFHXmz1QgmnQpuGngwzEZSJhFJPSzy5LlcIDrprM013wzwqWII/dWiLjSMaslSdzo9LW8/s+IexJZGCowS6H1FIdyfT1lS0aefKy0zPVKrrClpWsgFg263nHwLf9mblgGBDQ1tGsTIy1YESSnbGC8czzWlE2eVOvROFBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746493459; c=relaxed/simple;
	bh=NAIRHl9jRwApoLdgJlgRFmMt3m5CcZE9so5qmj5XRdo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=C1Y6HYq/OPjUgkBvEgLW24SxT16dPbgLhY18GO/YWrgJEuEqpOqPMNHjFHlFaru2WTpLrLcZOfrqQOWcjoAAzYRd39BqOYqyZiMHA3cGRpaUTgzSKY6OMgoxnOD8KAozjLzVKEJzRRicguRhfiYrpEO4DxoqfW+zM8782zZsEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tWNxcKGy; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tWNxcKGy"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2242ce15cc3so47725315ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 18:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746493457; x=1747098257; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YNg/75q6BfSe8D1KXAmFCz3H50TWhsSoQGs55Qs/RH8=;
        b=tWNxcKGymebuJEDsLT9E+wdS39VmAQ0p33b1d9a/RCzEynXpwhzbG27ZwjX0IOxGah
         SD04ZeYYTpPVz38PfPvxN4EkW/npmvsubXDtd204cbH2J+9mkAfC+H4Fi50bT8pWYMhW
         jpSTh1DYYxma5Yu3FtZ0+u7fV9KTUko5ZMTcS8iddj4MjDBvO7OqHdIRTDE3Lo/C+Eux
         jIfVvPDqf3GG10vb1xFsYKacQm6+1+6/dc75nOACZGUka3WMiNEUeRWsuM7whIPp5fF6
         Pk1CHyU47luFL0qS7/Va1ikTLNkMmJbyTOJlw0EaGlxBCACKAqSlqPKNkBvb9gmvyG55
         JKRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746493457; x=1747098257;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YNg/75q6BfSe8D1KXAmFCz3H50TWhsSoQGs55Qs/RH8=;
        b=Xvgz1Q917lpS33IQLt1yyus31LGHBnGu/EdqmtK7f055Z1BTQepddd0YU4Go7rQL0v
         QQ6LAWZrBzaxMthYE/rywig9FnWrDIur8XutEtkxZ69zeRMVEleqXjtBCWMMyAkLdJdd
         YLvClvDRVUaLskFzWpNNl2jGlOGRytZmTlJE94fkEu9EoJsuS198mQMUe3lMbA+3YvNJ
         pF+TMCm5IkCqrO7PuTUFgiNCNiUbzJy+8la9lKGDrC8B6nXhFgpr/Jl100bcWxBJ5HT3
         PQSrDHGdzdkqfyWFUzUZdm+J1URSWaAMYa0VLIUxnAgUu5FgSgJVN0NsySxKPzjY81mr
         T8nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGOp0Tbqti3AjBo69HTZ7CzZhvV+7LgthN3ZD66+Y0AV2RFORzf7L/gSA0qIknqWKuaabB4XhOjHyZ8sI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1MEUzT0izJ56FhAvIHdrP9jtXR2NoAne/kG7izKJkSD5uHZc9
	22IcqNvj77ozUphKjlQWu7fqdlChb2xGc+xZFLQWCIPwWHeJZDkkX4flg//zsLmuloOUYzKbDFP
	U5vns2A==
X-Google-Smtp-Source: AGHT+IF6woG3grc42jD9/hM5kbZtDO4mWv1QeZMCoSy1twB/zymf2W6+Y2yIWZd/t0aJHDcjkf0blutiyAVD
X-Received: from plso8.prod.google.com ([2002:a17:902:bcc8:b0:220:dc21:7a39])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d402:b0:22e:4509:cb8a
 with SMTP id d9443c01a7336-22e4509e0bbmr943085ad.21.1746493456998; Mon, 05
 May 2025 18:04:16 -0700 (PDT)
Date: Tue, 06 May 2025 01:04:13 +0000
In-Reply-To: <20250506-debugfs-rust-attach-v2-0-c6f88be3890a@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506-debugfs-rust-attach-v2-0-c6f88be3890a@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746493453; l=11182;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=NAIRHl9jRwApoLdgJlgRFmMt3m5CcZE9so5qmj5XRdo=; b=zWBWiJ3hiBmYSlpNujsN1jzH4rN0ip5oVQa4UNc5k39QLFJFcavaLbxOIMCWd1ndl/lTH3g4i
 KhK1E72hWX0BYe7Ur04/zZ6SGpeHZCDerAaRKM7y2mAsCOOuNHBKJmG
X-Mailer: b4 0.14.2
Message-ID: <20250506-debugfs-rust-attach-v2-1-c6f88be3890a@google.com>
Subject: [PATCH WIP v2 1/2] rust: debugfs: Add interface to build debugfs off
 pinned objects
From: Matthew Maurer <mmaurer@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

Previously, we could only expose `'static` references to DebugFS because
we don't know how long the file could live. This provides a way to
package data alongside an owning directory to guarantee that it will
live long enough to be accessed by the DebugFS files, while still
allowing a dynamic lifecycle.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 218 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 208 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index e2f5960bb87f24607780b3f4e67039e379f3bda6..560a2b68c7d28371ae11bc90efd15e7ada17ff77 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -5,10 +5,15 @@
 //!
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
+use crate::prelude::PinInit;
 use crate::str::CStr;
 use core::fmt;
 use core::fmt::Display;
-use core::marker::PhantomData;
+use core::marker::{PhantomData, PhantomPinned};
+use core::mem::ManuallyDrop;
+use core::ops::Deref;
+use core::pin::Pin;
+use pin_init::pin_data;
 
 /// Owning handle to a DebugFS entry.
 ///
@@ -80,6 +85,19 @@ fn new() -> Self {
     fn as_ptr(&self) -> *mut bindings::dentry {
         self.entry
     }
+
+    /// Rescopes the entry based on a borrow.
+    ///
+    /// # Safety
+    ///
+    /// Caller promises they will not drop the wrapped entry.
+    unsafe fn borrow<'b>(&'b self) -> ManuallyDrop<Entry<'b>> {
+        ManuallyDrop::new(Entry {
+            #[cfg(CONFIG_DEBUG_FS)]
+            entry: self.entry,
+            _phantom: PhantomData,
+        })
+    }
 }
 
 impl Drop for Entry<'_> {
@@ -186,6 +204,8 @@ pub fn fmt_file<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
         f: &'static F,
     ) -> File<'b> {
         // SAFETY: As `data` lives for the static lifetime, it outlives the file
+        // As we return `File<'b>`, and we have a borrow to a directory with lifetime 'b, we have a
+        // lower bound of `'b` on the directory.
         unsafe { self.fmt_file_raw(name, data, f) }
     }
 
@@ -197,11 +217,10 @@ pub fn fmt_file<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
     /// This means that before `data` may become invalid, either:
     /// * The refcount must go to zero.
     /// * The file must be rendered inaccessible, e.g. via `debugfs_remove`.
-    unsafe fn display_file_raw<'b, T: Display + Sized>(
-        &'b self,
-        name: &CStr,
-        data: *const T,
-    ) -> File<'b> {
+    /// * If `self` may take longer than `'a` to be destroyed, the caller is responsible for
+    ///   shortening the lifetime of the return value to a lower bound for the lifetime of that
+    ///   object.
+    unsafe fn display_file_raw<T: Display + Sized>(&self, name: &CStr, data: *const T) -> File<'a> {
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by `CStr` invariant.
         // * `parent` is a live `dentry` since we have a reference to it.
@@ -243,13 +262,16 @@ unsafe fn display_file_raw<'b, T: Display + Sized>(
     ///
     /// # Safety
     ///
-    /// `data` must outlive the resulting file's accessibility
-    unsafe fn fmt_file_raw<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
-        &'b self,
+    /// * `data` must outlive the resulting file's accessibility
+    /// * If `self` may take longer than `'a` to be destroyed, the caller is responsible for
+    ///   shortening the lifetime of the return value to a lower bound for the lifetime of that
+    ///   object.
+    unsafe fn fmt_file_raw<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
         name: &CStr,
         data: &T,
         f: &'static F,
-    ) -> File<'b> {
+    ) -> File<'a> {
         #[cfg(CONFIG_DEBUG_FS)]
         let data_adapted = FormatAdapter::new(data, f);
         #[cfg(not(CONFIG_DEBUG_FS))]
@@ -280,6 +302,182 @@ pub fn new(name: &CStr) -> Self {
 #[repr(transparent)]
 pub struct File<'a>(Entry<'a>);
 
+/// A DebugFS directory combined with a backing store for data to implement it.
+#[pin_data]
+pub struct Values<T> {
+    dir: Dir<'static>,
+    // The order here is load-bearing - `dir` must be dropped before `backing`, as files under
+    // `dir` may point into `backing`.
+    #[pin]
+    backing: T,
+    // Since the files present under our directory may point into `backing`, we are `!Unpin`.
+    #[pin]
+    _pin: PhantomPinned,
+}
+
+impl<T> Deref for Values<T> {
+    type Target = T;
+    fn deref(&self) -> &T {
+        &self.backing
+    }
+}
+
+impl<T> Values<T> {
+    /// Attach backing data to a DebugFS directory.
+    ///
+    /// Attached data will be available inside [`Values::build`] to use when defining files in
+    /// the provided directory. When this object is dropped, it will remove the provided directory
+    /// before destroying the attached data.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::{c_str, new_mutex};
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"));
+    /// let debugfs = KBox::pin_init(Values::attach(new_mutex!(0), dir), GFP_KERNEL)?;
+    /// // Files can be put inside `debugfs` which reference the constructed mutex.
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn attach(backing: impl PinInit<T>, dir: Dir<'static>) -> impl PinInit<Self> {
+        pin_init::pin_init! { Self {
+            dir: dir,
+            backing <- backing,
+            _pin: PhantomPinned,
+        }}
+    }
+
+    /// Runs a function which can create files from the backing data.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::{c_str, new_mutex};
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"));
+    /// let debugfs = KBox::pin_init(Values::attach(new_mutex!(0), dir), GFP_KERNEL)?;
+    /// debugfs.as_ref().build(|mutex, dir| {
+    ///   // Can access `BoundDir` methods on `dir` here, with lifetime unified to the
+    ///   // lifetime of `mutex`
+    /// });
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn build<U, F: for<'b> FnOnce(&'b T, BoundDir<'b>) -> U>(self: Pin<&Self>, f: F) -> U {
+        // SAFETY: The `BoundDir` here is only being provided as a universally quantified argument
+        // to a function, so in the body, it will only be available in an existentially quantified
+        // context. This means that the function is legal to execute agains the true lifetime of
+        // the directory, even if we don't know exactly what that is.
+        f(&self.backing, unsafe { BoundDir::new(&self.dir) })
+    }
+}
+
+/// A `Dir`, bound to the lifetime for which it will exist. Unlike `&'a Dir`, this has an invariant
+/// lifetime - it cannot be shortened or lengthened.
+///
+/// # Invariants
+///
+/// * `BoundDir`'s lifetime must match the actual lifetime the directory lives for. In practice,
+///   this means that a `BoundDir` may only be used in an existentially quantified context.
+/// * `dir` will never be promoted to an owning reference (e.g. via calling `Dir::owning`)
+#[repr(transparent)]
+pub struct BoundDir<'a> {
+    dir: ManuallyDrop<Dir<'a>>,
+    _invariant: PhantomData<fn(&'a ()) -> &'a ()>,
+}
+
+impl<'a> BoundDir<'a> {
+    /// Create a new bound directory.
+    ///
+    /// # Safety
+    ///
+    /// `'a` is being used in a context where it is existentially quantified.
+    unsafe fn new(dir: &'a Dir<'_>) -> Self {
+        // SAFETY: We will keep the return wrapped in ManuallyDrop, so we will not drop it.
+        let entry = unsafe { dir.0.borrow() };
+        // Rewrap it into a directory
+        let dir = ManuallyDrop::new(Dir(ManuallyDrop::into_inner(entry)));
+        Self {
+            dir,
+            _invariant: PhantomData,
+        }
+    }
+
+    /// Create a DebugFS subdirectory.
+    ///
+    /// This will produce another [`BoundDir`], scoped to the lifetime of the parent [`BoundDir`].
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let values = KBox::pin_init(Values::attach(0, parent), GFP_KERNEL)?;
+    /// values.as_ref().build(|value, builder| {
+    ///   builder.subdir(c_str!("child"));
+    /// });
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn subdir<'b>(&'b self, name: &CStr) -> BoundDir<'b> {
+        BoundDir {
+            dir: ManuallyDrop::new(Dir::create(name, Some(&self.dir))),
+            _invariant: PhantomData,
+        }
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
+    /// # use kernel::{c_str, new_mutex};
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let values = KBox::pin_init(Values::attach(new_mutex!(0), parent), GFP_KERNEL)?;
+    /// values.as_ref().build(|value, builder| {
+    ///   builder.fmt_file(c_str!("child"), value, &|value, f| {
+    ///     writeln!(f, "Reading a mutex: {}", *value.lock())
+    ///   });
+    /// });
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn fmt_file<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &'a T,
+        f: &'static F,
+    ) -> File<'a> {
+        // SAFETY: As `data` lives for the same lifetime as our `BoundDir` lifetime, which is
+        // instantiated as the actual lifetime of the directory, it lives long enough.
+        // We don't need to shorten the file handle because `BoundDir`'s lifetime parameter is both
+        // a lower *and* upper bound.
+        unsafe { self.dir.fmt_file_raw(name, data, f) }
+    }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
+    /// [`Display::fmt`] on the provided reference with a trailing newline.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{c_str, new_mutex};
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let parent = Dir::new(c_str!("parent"));
+    /// let values = KBox::pin_init(Values::attach((1, 2), parent), GFP_KERNEL)?;
+    /// values.as_ref().build(|value, builder| {
+    ///   builder.display_file(c_str!("child_0"), &value.0);
+    ///   builder.display_file(c_str!("child_1"), &value.1);
+    /// });
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn display_file<T: Display>(&self, name: &CStr, data: &'a T) -> File<'a> {
+        self.fmt_file(name, data, &|data, f| writeln!(f, "{}", data))
+    }
+}
+
 #[cfg(CONFIG_DEBUG_FS)]
 mod helpers {
     use crate::seq_file::SeqFile;

-- 
2.49.0.967.g6a0df3ecc3-goog

