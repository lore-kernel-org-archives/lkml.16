Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFCE2DCB65
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968564; cv=none; b=qG0H0uiNlUiLOXwu8+q8ADHzdb38gF2tMaSkaeq23B1xf2hXxaDodxLpvmmaqhwdDDF15GJq1B+io0xP8BqPS/1Z66dh9p9w9bBEOBrLKQzVQ/j0ATCmRKKvIDXzkLbeiEQQnM7EcfJzwqpmO6jxUZ3qXVhvEXJltp8E5j2COtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968564; c=relaxed/simple;
	bh=H0R9xHVE5gD9DZFvSrwWRzIrE3Yf2OJnI5T8aKnv0sk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Tc28scg80u7Ct2u8xMWQVWnzxhwL/llpsgrUIBzdX6ZW9iwKDHV++LhXuXCNIDShfIebg3CvwWUtqHtbp47vRNuDKW5/wJtDb5GL7N6w/GbbVH3Febmy5Hppeu753OlDtLAiSvsqsVQL/g5MAcVcfjmwjl9cvu5QYVxCIo1q5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I9HLDrCs; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I9HLDrCs"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254bdd4982so91284545ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968562; x=1746573362; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X5VRlHQlSmC4CwxYYUA0ffbYeWW2fuMVuSEdC5ZxOIA=;
        b=I9HLDrCsPN2/cQHz6PuEj4zcSjGlVXHgAtsV6HvSbw/RLuMINCuDkbpFKKKcXp2EQG
         77MaTaUyYHpLxb5+D7zrPlwlVL3xKm338ZFsrTlG1k3LCAv0JIvKBTugNsKulBbgDPwZ
         cIRtSoUU6X/IK6uXc51fLqM8J6Wg4kj7Y5/NnDBJbP2w7xmU3953Eoj2sVWuoirnFaG8
         +tEr0HWbdjDLCzwi00FbOW+BVMRRqT5yTsWh0Q1pMrKh+9eut8iCEpKVZvNDsNa5UFFs
         Hn0oGKvQG/UEFIZoupCYEtjIKqXQKTGYoFkBHQqLrbDJWHQ2qsGtw6/mqBf5b43tpQ4Y
         tz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968562; x=1746573362;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X5VRlHQlSmC4CwxYYUA0ffbYeWW2fuMVuSEdC5ZxOIA=;
        b=j60Da+pmLi5XwV6ti2P5V8IH1L7w8UtpvRsWoAEKzkwtZB0IAbeF+nMPW7aNySu5a2
         tOXLKWUKKKYF/JrddgC+GdCL9f0eOnWq9bGPn67p7GAHhu4HVWtgK8eDlwh196ZqVl8p
         9LB9qaRuT5YxX8XJNKN/1dp5o7COT3f4go2+u1+fvwRI/q2FF3b47nqgfQGTn3U/cjdh
         Ar4sS+csYXzcYKayga++OA6AGnr3RqUrNwP+6mmNnrWQNkXZyALcf/47JsdpWSicP6bb
         Nzi23uTZJRfdTt7Y+xlJSaL6ZAxhzxT5IuSkVykNwKGE25LqoaOOMg9Evsq0akedC1y+
         XdWQ==
X-Gm-Message-State: AOJu0YwmuemWPLUCtHQglKCoWmBuVt1pv0LDH4MpHBPyFtCe1EuG2kvJ
	wvM5CsDfjIMqXdSXBNs1Bo6uiw09G6fFhU6+yvnNxcx+wHN7YXsznjzO/yH9BOIS2HEaz+pt6Nt
	cnKMMcg==
X-Google-Smtp-Source: AGHT+IFxxc0wQTCm2CgU9b9O3RucwHFoW4xkdzab40kcTUqv90QWwXPAjjdzUErLc9VjQdew+JyvUwT0cKV+
X-Received: from pjbpb12.prod.google.com ([2002:a17:90b:3c0c:b0:2ff:5df6:7e03])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2285:b0:216:3d72:1712
 with SMTP id d9443c01a7336-22df35d361bmr17507905ad.48.1745968562045; Tue, 29
 Apr 2025 16:16:02 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:57 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=7881;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=H0R9xHVE5gD9DZFvSrwWRzIrE3Yf2OJnI5T8aKnv0sk=; b=46P5hVkwKySULaTTK9ZmqOkS0tS5e3gKnWvAkWPppSF7Z0wJXRN4QbwOsM7SlrLfcCqQBZbrU
 0dNHOqzSpvhBmyRuWNtGvgngAxE24d4gCV/5CZfBJKTCIUki4sJQTNY
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-3-6b6e7cb7929f@google.com>
Subject: [PATCH 3/8] rust: debugfs: Add scoped builder interface
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This adds an interface which allows access to references which may not
live indefinitely by forcing them to live at least as long as the
DebugFS directory itself.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 163 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 163 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index b20df5fce692b3047c804f7ad5af90fc4248979b..f6240fd056f8598d5ef06bdaf61c5c33eab5b734 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -12,7 +12,12 @@
 use crate::str::CStr;
 use crate::types::{ARef, AlwaysRefCounted, Opaque};
 use core::fmt::Display;
+use core::marker::{PhantomData, PhantomPinned};
+use core::mem::ManuallyDrop;
+use core::ops::Deref;
+use core::pin::Pin;
 use core::ptr::NonNull;
+use pin_init::{pin_data, pinned_drop, PinInit};
 
 /// Handle to a DebugFS directory.
 pub struct Dir {
@@ -117,6 +122,22 @@ pub fn display_file<T: Display + Sized>(
         &self,
         name: &CStr,
         data: &'static T,
+    ) -> Result<ARef<Self>> {
+        // SAFETY: As `data` lives for the static lifetime, it outlives the file.
+        unsafe { self.display_file_raw(name, data) }
+    }
+
+    /// Creates a DebugFS file backed by the display implementation of the provided pointer.
+    ///
+    /// # Safety
+    /// The pointee of `data` must outlive the accessibility of the `Dir` returned by this function.
+    /// This means that before `data` may become invalid, either:
+    /// * The refcount must go to zero
+    /// * The file must be rendered inaccessible, e.g. via `debugfs_remove`
+    unsafe fn display_file_raw<T: Display + Sized>(
+        &self,
+        name: &CStr,
+        data: *const T,
     ) -> Result<ARef<Self>> {
         // SAFETY:
         // * `name` is a NUL-terminated C string, living across the call, by CStr invariant
@@ -192,3 +213,145 @@ trait DisplayFile: Display + Sized {
 }
 
 impl<T: Display + Sized> DisplayFile for T {}
+
+#[pin_data(PinnedDrop)]
+/// A DebugFS directory combined with a backing store for data to implement it
+pub struct Values<T> {
+    #[pin]
+    backing: T,
+    // Calling `debugfs_remove`, as we will do in our `Drop` impl, will consume the refcount we
+    // hold after cleaning up all the child directories.
+    dir: ManuallyDrop<ARef<Dir>>,
+    // Since the files present under our directory may point into backing, we are !Unpin
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
+    /// Attach backing data to a DebugFS directory. When the resulting object is destroyed, the
+    /// DebugFS directory will be recursively removed as well.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// let _foo = KBox::pin_init(Values::attach(0, dir), GFP_KERNEL)?;
+    /// // foo can now be used with `Values::build` to allow access to the attached value when
+    /// // printing
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn attach(backing: impl PinInit<T>, dir: ARef<Dir>) -> impl PinInit<Self> {
+        pin_init::pin_init! { Self {
+            backing <- backing,
+            dir: ManuallyDrop::new(dir),
+            _pin: PhantomPinned,
+        } }
+    }
+
+    /// Runs a closure which has access to the backing data and a builder that will allow you to
+    /// build a DebugFS structure off the backing data using its methods.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// let foo = KBox::pin_init(Values::attach(0, dir), GFP_KERNEL)?;
+    /// foo.as_ref().build(|_value, _builder| {
+    ///   // Construct debugfs with access to the attached value here
+    /// });
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn build<U, F: for<'a> FnOnce(&'a T, Builder<'a>) -> U>(self: Pin<&Self>, f: F) -> U {
+        // SAFETY: The Builder produced here is technically at the lifetime of self, but is
+        // being used only in a universal context, so that information is immediately erased and
+        // replaced with the universally quantified 'a. By taking a Pin<&Self>, we enforce that
+        // self.backing remains alive for any 'a less than the lifetime of the struct. By not
+        // providing any mutable access to self.backing, we ensure that it's always safe to
+        // materialize a read-only reference to &self.backing for any 'a less than the lifetime of
+        // the struct.
+        f(&self.backing, unsafe { Builder::new(&self.dir) })
+    }
+}
+
+#[pinned_drop]
+impl<T> PinnedDrop for Values<T> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: Our internal dir holds its own reference count, so it's always valid.
+        unsafe { kernel::bindings::debugfs_remove(self.dir.as_ptr()) }
+    }
+}
+
+/// A Dir, scoped to the lifetime for which it will exist. Unlike `&'a Dir`, this is equivariant,
+/// preventing the shortening of the lifetime.
+///
+/// # Invariants
+/// Builder will only ever be used with 'static or a universally quantified lifetime that is
+/// unified only with the lifetime of data structures guaranteed to outlive it and not have mutable
+/// references taken.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub struct Builder<'a> {
+    inner: &'a Dir,
+    _equivariant: PhantomData<fn(&'a ()) -> &'a ()>,
+}
+
+impl<'a> Builder<'a> {
+    /// # Safety
+    /// Caller must promise to use this function at static lifetime or only expose it to
+    /// universally quantified functions, unified only with lifetimes guaranteed to extend beyond
+    /// when the directory will be rendered inaccessible.
+    unsafe fn new(inner: &'a Dir) -> Self {
+        Self {
+            inner,
+            _equivariant: PhantomData,
+        }
+    }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking
+    /// [`Display::fmt`] on the provided reference.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::{try_pin_init, c_str};
+    /// # use pin_init::stack_try_pin_init;
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// stack_try_pin_init!(let foo =? Values::attach((1, 2), dir));
+    /// foo.as_ref().build(|value, builder| {
+    ///   builder.display_file(c_str!("bar"), &value.0)?;
+    ///   builder.display_file(c_str!("baz"), &value.1)
+    /// })?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn display_file<T: Display + Sized>(&self, name: &CStr, data: &'a T) -> Result<()> {
+        // We forget the reference because its reference count is implicitly "owned" by the root
+        // builder, which we know will use `debugfs_remove` to clean this up. If we release the
+        // file here, it will be immediately deleted.
+        // SAFETY:
+        // Because `Builder`'s invariant says that our lifetime is how long the directory will
+        // be available, and is equivariant, `'a` will outlive the base directory, which will be
+        // torn down by `debugfs_remove` to prevent access even if an extra refcount is held
+        // somewhere.
+        core::mem::forget(unsafe { self.inner.display_file_raw(name, data)? });
+        Ok(())
+    }
+}
+
+impl<'a> Deref for Builder<'a> {
+    type Target = Dir;
+    fn deref(&self) -> &Self::Target {
+        &self.inner
+    }
+}

-- 
2.49.0.901.g37484f566f-goog

