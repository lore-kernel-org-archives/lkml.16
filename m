Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF322DDCF9
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745968567; cv=none; b=RosLknHrgGRxWhFJRF1xK8fPS7vfUMW/qwwmWcNhTT33k03x0SHFxfIxM1b6bS7TsIUJU6yCBFNmbILNsC96fD7v6ooNQ5Cm1jvNcdvTAs7m+0wODAus3wQV6KjYTBEdPKTGhtDSNksk5CrRBd6Qev5ZLj4LIDZwKnEn9Y707X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745968567; c=relaxed/simple;
	bh=x4XZw/uTNiFUFZkmeUpFkUNuBS3nSzEJUNzJJbd28To=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jMY4pi4QsmSBpnckES1pgq1WONSRo6sjKrCIjQ/pMvhS2PxXM7HWLCowdqg2HVaA7lwVCsbGuoGBoFrJQw6XTXES6XxnXSxWZgM6+OfTyfinCjkWMc+x+x4ZuUZRV10esTc+NsTf6oFyZ8oq+EUWj9smd1zHebV4Ekrhqr0JNFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JhQQeZn+; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JhQQeZn+"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b115fb801bcso7211044a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745968565; x=1746573365; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj0VSHlz8BjkzXgQvs/OfvhGS6FJ+3Bdr3wHl5UDFLg=;
        b=JhQQeZn+3yq5XXiE4txIMnBTrR9XqumXfCqZJ4+U+TtH3sVUHjNzE1xjkML+sRbhow
         SIMHiflDcdpxtw7exPxpMmVYkP+2JikPMSoLItaFAkrVHI47BB+fa6SLk6JeumDppoxT
         u3DpwC8mnPTArkW7ZXNreW3bRDti7dTfQ5dDWTCw19uLU2EwmRBKxHkIa5BcVEdtcpqs
         IefA3LVnBbzLj98lwl/YIuqzLx9RP1nKWlocxnlvCI05+wba1hSROXSr6xE0Z3TlGPds
         dW523gGkn9cRkQ+PI/C3XTiqsGSI9uyjscVhfiz845kN/pcZVxkxOD1wj5a9Tz+QBCup
         /aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745968565; x=1746573365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nj0VSHlz8BjkzXgQvs/OfvhGS6FJ+3Bdr3wHl5UDFLg=;
        b=SUkIPrAtC3QQwt59YqhkjRk71KvWy3xoVAwcfuq1Cqz7VyMgUS9ajtrNqVEObeDnT7
         oEnbXky7P48v8Mixv5E/XL130gsrCk/erw+M/eihk/sLjR836z9L+/K9ZkgRkmk1aBZr
         CNedmFcdjmLu0kX18EFaZYBVGlT//4XUIVFmAnPeitwuiRhnf9nYASyznLNHm5BvnuOH
         UwFnYlYVgcN6TaotJxQSodjhBeLPAZrfHmqfuz2eMfOG0W2AM6VMePKzS6unBtFc1A6y
         6Hoqr1MrX57oTlMmpj97892qV0kf4sDTpb8AK+V3uNynThIIkERtM0s4DqgGMqMgNr5w
         yI3w==
X-Gm-Message-State: AOJu0Yypuy5WnvbQlHt0TuRAjC8LnWo4OzKaAKHWOf0+T2J5X6S/FYWb
	FiVXxOGHcsbGbav2ixKz8xa1snHpAi6uIvAQE3p0keP4jgf9oeP/RJ1yepZ4uHnvVU6JBfDs0I+
	m4F0DKQ==
X-Google-Smtp-Source: AGHT+IFT32I5q1oA2JLaQdeDAqcxKTZkmZkXJgAh4y6hiXwQQLMuZzFKwV9VD5ZJmQj5jS5uSTIZORke0qFU
X-Received: from pjh13.prod.google.com ([2002:a17:90b:3f8d:b0:301:b354:8d63])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5825:b0:308:65d4:9dda
 with SMTP id 98e67ed59e1d1-30a332ff7b4mr1377756a91.16.1745968565127; Tue, 29
 Apr 2025 16:16:05 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:15:59 +0000
In-Reply-To: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-debugfs-rust-v1-0-6b6e7cb7929f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745968555; l=7024;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=x4XZw/uTNiFUFZkmeUpFkUNuBS3nSzEJUNzJJbd28To=; b=dVctqUrYDf8t/2h5pL9lo8+x2qaU1YgRWyK2F0Bad8DxKr7DpUupHRiM58GxUNZaTIcJDIZcH
 CAiKlRsMXk5D97OU4P9nZarLci6d0pP5nhFhJr/VP/Ej97DYgRW01P8
X-Mailer: b4 0.14.2
Message-ID: <20250429-debugfs-rust-v1-5-6b6e7cb7929f@google.com>
Subject: [PATCH 5/8] rust: debugfs: Support format hooks
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

Rather than always using Display, allow hooking arbitrary functions to
arbitrary files. Display technically has the expressiveness to do this,
but requires a new type be declared for every different way to render
things, which can be very clumsy.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs | 125 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 6c7cf7e97741b98d2c0654d01fca3de0d8047e97..2faa59d2dae44ab708cb8fca0d23f06f73a95a3a 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -11,7 +11,8 @@
 use crate::seq_print;
 use crate::str::CStr;
 use crate::types::{ARef, AlwaysRefCounted, Opaque};
-use core::fmt::Display;
+use core::fmt;
+use core::fmt::{Display, Formatter};
 use core::marker::{PhantomData, PhantomPinned};
 use core::mem::ManuallyDrop;
 use core::ops::Deref;
@@ -127,6 +128,35 @@ pub fn display_file<T: Display + Sized>(
         unsafe { self.display_file_raw(name, data) }
     }
 
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking `f`
+    /// on the provided reference. `f` must be a function item or a non-capturing closure, or this
+    /// will fail to compile.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use core::sync::atomic::{AtomicU32, Ordering};
+    /// # use kernel::c_str;
+    /// # use kernel::debugfs::Dir;
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// static MY_ATOMIC: AtomicU32 = AtomicU32::new(3);
+    /// let file = dir.fmt_file(c_str!("bar"), &MY_ATOMIC, &|val, f| {
+    ///   let out = val.load(Ordering::Relaxed);
+    ///   write!(f, "{out:#010x}\n")
+    /// })?;
+    /// MY_ATOMIC.store(10, Ordering::Relaxed);
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn fmt_file<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &'static T,
+        f: &'static F,
+    ) -> Result<ARef<Self>> {
+        // SAFETY: As `data` lives for the static lifetime, it outlives the file
+        unsafe { self.fmt_file_raw(name, data, f) }
+    }
+
     /// Creates a DebugFS file backed by the display implementation of the provided pointer.
     ///
     /// # Safety
@@ -162,6 +192,24 @@ unsafe fn display_file_raw<T: Display + Sized>(
         // owning dentry from debugfs_create_dir, so we can wrap it in an ARef
         Ok(unsafe { ARef::from_raw(ptr.cast()) })
     }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking the
+    /// fomatter on the attached data. The attached function must be a ZST, and will cause a
+    /// compilation error if it is not.
+    ///
+    /// # Safety
+    ///
+    /// `data` must outlive the resulting file's accessibility
+    unsafe fn fmt_file_raw<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &T,
+        f: &'static F,
+    ) -> Result<ARef<Self>> {
+        let data_adapted = FormatAdapter::new(data, f);
+        // SAFETY: data outlives the file's accessibility, so data_adapted does too
+        unsafe { self.display_file_raw(name, data_adapted) }
+    }
 }
 
 /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`
@@ -373,6 +421,43 @@ pub fn dir(&self, name: &CStr) -> Result<Builder<'a>> {
         // SAFETY: Since 'a is a builder lifetime, we can propagate our invariants
         Ok(unsafe { Builder::new(dir) })
     }
+
+    /// Create a file in a DebugFS directory with the provided name, and contents from invoking `f`
+    /// on the provided reference. `f` must be a function item or a non-capturing closure, or this
+    /// will fail to compile.
+    ///
+    /// # Example
+    ///
+    /// ```
+    /// # use kernel::{c_str, new_mutex};
+    /// # use kernel::debugfs::{Dir, Values};
+    /// let dir = Dir::new(c_str!("foo"), None)?;
+    /// let foo = KBox::pin_init(Values::attach(new_mutex!(0), dir), GFP_KERNEL)?;
+    /// foo.as_ref().build(|value, builder| {
+    ///   builder.fmt_file(c_str!("bar"), value, &|val, f| {
+    ///     write!(f, "Mutex read: {}", *val.lock())
+    ///   })
+    /// })?;
+    /// *foo.lock() = 23;
+    /// # Ok::<(), Error>(())
+    /// ```
+    pub fn fmt_file<T, F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result>(
+        &self,
+        name: &CStr,
+        data: &'a T,
+        f: &'static F,
+    ) -> Result<()> {
+        // We forget the reference because its reference count is implicitly "owned" by the root
+        // builder, which we know will use `debugfs_remove` to clean this up. If we release the
+        // file here, it will be immediately deleted.
+        // SAFETY:
+        // Because `Builder`'s invariant says that our lifetime is how long the directory will
+        // be available, and is equivariant, `'a` will outlive the base directory, which will be
+        // torn down by `debugfs_remove` to prevent access even if an extra refcount is held
+        // somewhere.
+        core::mem::forget(unsafe { self.fmt_file_raw(name, data, f) }?);
+        Ok(())
+    }
 }
 
 impl<'a> Deref for Builder<'a> {
@@ -381,3 +466,41 @@ fn deref(&self) -> &Self::Target {
         &self.inner
     }
 }
+
+// INVARIANT: F is inhabited
+#[repr(transparent)]
+struct FormatAdapter<T, F> {
+    inner: T,
+    _formatter: PhantomData<F>,
+}
+
+impl<T, F> FormatAdapter<T, F> {
+    fn new<'a>(inner: &'a T, _f: &'static F) -> &'a Self {
+        // SAFETY: FormatAdapater is a repr(transparent) wrapper around T, so
+        // casting a reference is legal
+        // INVARIANT: We were passed a reference to F, so it is inhabited.
+        unsafe { core::mem::transmute(inner) }
+    }
+}
+
+impl<T, F: Fn(&T, &mut Formatter<'_>) -> fmt::Result + 'static> Display for FormatAdapter<T, F> {
+    fn fmt(&self, fmt: &mut Formatter<'_>) -> fmt::Result {
+        // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+        let f: &F = unsafe { materialize_zst_fmt() };
+        f(&self.inner, fmt)
+    }
+}
+
+/// # Safety
+/// The caller asserts that F is inhabited
+unsafe fn materialize_zst_fmt<F>() -> &'static F {
+    // We don't have generic_const_exprs, and const items inside the function get promoted out and
+    // lose type variables, so we need to do the old-style assert to check for ZSTness
+    [(); 1][core::mem::size_of::<F>()];
+    let zst_dangle: NonNull<F> = NonNull::dangling();
+    // SAFETY:
+    // While the pointer is dangling, it is a dangling pointer to a ZST, based on the array
+    // assertion above. The type is also inhabited, by the caller's assertion. This means
+    // we can materialize it.
+    unsafe { zst_dangle.as_ref() }
+}

-- 
2.49.0.901.g37484f566f-goog

