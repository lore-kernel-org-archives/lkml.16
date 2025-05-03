Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD4E18E20
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746233046; cv=none; b=iUIcJ9/yfYm64KVYnE8tx/kAyqhIEZN5RVj1rZECiTPC+58lPSkO3cVfluGntUdYL+DbMuvPMwCqOl1Z9PQgHYkIUa6Jng3IEZp66sNac5ZUL4xwbEzSdN4M0rlWw38/X07KS5ZhPUCy5N93bKB2P/E7+6MaLdH1+SusU19UjWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746233046; c=relaxed/simple;
	bh=Q0V/7T4cKd+Hj1NuV7Avo5kdt9xbrW+CzMbeUF44XGQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pBpdYf9SU9HdKpM/H4nd9fLguX7lfYrCom4P8QJPTzqLTPkLrOcai6+keuJwNy5DhRfkvMac6u5GIgbjBGT8gcX8DRLhEdLBkaIGZPg/spwaYXeCSEVTj+2bvMRQJ5QAbM+CJq/sDD0ZHYcOc/ACRCSc9IoJg4+YerLwKg6lOKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CFyuXI26; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CFyuXI26"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-af2f03fcc95so2682958a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746233044; x=1746837844; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XLOAFGYchUsWq3pl/3pRNy4+RBC58NG/aDrtXm40ObA=;
        b=CFyuXI265EnACqBIgcIcfg0h8ywPXwLiUcobKImwRpky5SxZy/ysS7brip6EA7ugnE
         DwcCGWVdV/wPwGzjeXypfad0qDqx5PW/QZ7T955tauS3YMh38DcLXX/NBPLHSYuIXZUz
         gKo4X3qRd4dg27Muu74lbaHfjUi12FS1THtsUyI4ZtTCO85Xl4HQDE6GEUqu9Shi0aXR
         BnDMGWCo1jaaIctEYzbWkWm0DIT0BNyo+wLRU3YWiTyZ+XHebsxlw6f9Ls4mG8gHa8Hv
         K6/+sjIlZ07SwOmZZunAqBqqFuA7+93iRstj9zYal4pSXKcCJFf+ZWt+QlIyl7r3cu0x
         qs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746233044; x=1746837844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XLOAFGYchUsWq3pl/3pRNy4+RBC58NG/aDrtXm40ObA=;
        b=LHTrGlqfvORJqmRiCae2ZyQJG//Ji5iFaDhq1z0TcyK4jmJWjaydlIYEm99qI/h6wr
         3KUzTFtkoNc3xD8R6TBBKVm/jDakZWAfs1k8SAUHh9MoAJW+G43vuMsn7J1pkVcL9FKH
         lZPw95LF/Lggm+0667TgKnDQJI86B8AoDTOGyCAWResZjr70rz4VYzv2fNezi8SfMTOj
         6z0CAi0ZgOjiL/3OzTN3AfFCPSrpQ2C9LhlSmMzQX+do5xiNYFuj0Rp+xvsehd36OyMT
         CJFaKkAN053uq2674LbcLYNoL18n9VGAanGNn9xYChRURxzmE8m62MO3MzgMm2HD+vg4
         vknA==
X-Forwarded-Encrypted: i=1; AJvYcCXGxtbis/V2Q944xks+T4OAr7+iGtWP3M63MipFmua8QWArtxkvb1RyycqzzEw75D3VgchN+LdHn7xLGpA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQP6G9qHQdYbzx4Jd+5wXuOwm8Om87sf2XdSR5TAsdMYvnCJgM
	hPXihNXX08JHIWjPyyJfuYXLHGqaCwHqfp8yFpQIY6zaPXTlw4UjGzMxT3TqayHysqr5xF0c+rI
	e0IziiA==
X-Google-Smtp-Source: AGHT+IEheVpNcB61uU4TezgUWrVoE57NnlVXi6U78otZIFBnPcIrxl333pVJ4K2QPQ55SIdfFRxgFCQR9suA
X-Received: from pgtv9.prod.google.com ([2002:a63:b649:0:b0:ad5:5004:836f])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:c6cb:b0:1f5:64fd:68ea
 with SMTP id adf61e73a8af0-20cde46cd69mr7428934637.4.1746233044017; Fri, 02
 May 2025 17:44:04 -0700 (PDT)
Date: Sat, 03 May 2025 00:43:59 +0000
In-Reply-To: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250503-debugfs-rust-attach-v1-0-dc37081fbfbc@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746233040; l=10617;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Q0V/7T4cKd+Hj1NuV7Avo5kdt9xbrW+CzMbeUF44XGQ=; b=soC+Nw8dZJSSvBLZWA8WLFw7ZLkQ2trEyyK0zxJsgCnNadrmuOFJs9iPhqSKkDCcKvXSEzj3v
 F9PzNrjBuBsBi0ZVUHshGq7u9kIz9EZ5/NPYetR6AiRTZMgYEFSKD4U
X-Mailer: b4 0.14.2
Message-ID: <20250503-debugfs-rust-attach-v1-1-dc37081fbfbc@google.com>
Subject: [PATCH WIP 1/2] rust: debugfs: Add interface to build debugfs off
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
 rust/kernel/debugfs.rs | 206 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 196 insertions(+), 10 deletions(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index cfdff63c10517f1aebf757c965289a49fed6ae85..f232598b510e036bd25e6846f153572ebfb459f3 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -6,10 +6,14 @@
 //!
 //! C header: [`include/linux/debugfs.h`](srctree/include/linux/debugfs.h)
 
+use crate::prelude::PinInit;
 use crate::str::CStr;
 use core::fmt;
 use core::fmt::Display;
-use core::marker::PhantomData;
+use core::marker::{PhantomData, PhantomPinned};
+use core::ops::Deref;
+use core::pin::Pin;
+use pin_init::pin_data;
 
 /// Owning handle to a DebugFS directory.
 ///
@@ -158,6 +162,8 @@ pub fn fmt_file<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
         f: &'static F,
     ) -> File<'b> {
         // SAFETY: As `data` lives for the static lifetime, it outlives the file
+        // As we return `File<'b>`, and we have a borrow to a directory with lifetime 'b, we have a
+        // lower bound of `'b` on the directory.
         unsafe { self.fmt_file_raw(name, data, f) }
     }
 
@@ -169,11 +175,10 @@ pub fn fmt_file<'b, T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
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
@@ -215,13 +220,16 @@ unsafe fn display_file_raw<'b, T: Display + Sized>(
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
@@ -303,6 +311,184 @@ pub fn remove(self) {
     }
 }
 
+/// A DebugFS directory combined with a backing store for data to implement it.
+#[pin_data]
+pub struct Values<T> {
+    dir: Dir<'static, false>,
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
+    pub fn attach(backing: impl PinInit<T>, dir: Dir<'static, false>) -> impl PinInit<Self> {
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
+    dir: Dir<'a, true>,
+    _invariant: PhantomData<fn(&'a ()) -> &'a ()>,
+}
+
+impl<'a> BoundDir<'a> {
+    /// Create a new bound directory.
+    ///
+    /// # Safety
+    ///
+    /// `'a` is being used in a context where it is existentially quantified.
+    unsafe fn new(dir: &'a Dir<'_, false>) -> Self {
+        Self {
+            // We can create a non-owning `Dir` with our restricted lifetime because we do not
+            // allow this `dir` to be upgraded to an owning reference, and the owning reference
+            // provided necessarily outlives us.
+            dir: Dir {
+                dir: dir.dir,
+                _phantom: PhantomData,
+            },
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
+    pub fn subdir(&self, name: &CStr) -> Self {
+        Self {
+            dir: Dir::create(name, Some(&self.dir)),
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
2.49.0.906.g1f30a19c02-goog

