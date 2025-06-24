Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5410726C38E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 23:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807538; cv=none; b=Z0KEmEUH+SIqsiB21cnQjqN3ICLgrImOES3GiLALyzW1I/kcYVGxpB4f5ONzsNqCFnHNKrIrjkGmj0hIN7ZwM266wJBTJgnqCcVNlzNYBOqBOndyXoq8CZuGn8wvUwdNLDXEsv3q9flRFk8IK7/MCO2yy7gboLkQpV9cQAK8d/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807538; c=relaxed/simple;
	bh=CAjW4qWEATQAhifD7XkDU8mnRpNkpHK/ka6oGRsQ4qs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n06jcFBRdrhte62Dk7PI3CWoXDAGH6reSafvbAZBAHnN/nKxukdkdOvc5W/MO17sgTTThCIcjkr8cF1xOYltZiOF0OpjXD2xHdVqRrlOpbgNwBGUkThxMCNFwDcRoKbdCu9xdripZOO469tvqXS04uaqaBgCkEhl3qlpK8joVkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mA+/KCOJ; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mA+/KCOJ"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-235c897d378so8614535ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750807536; x=1751412336; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gpUS+EX77lZKoaVBWmim3dqnGXias1I977cCfQoRsAA=;
        b=mA+/KCOJR5BUcUo88K/tgyFsrrlJVrB2VJn74HdXAkgdm8VWru7XcIQihLZk2pc2jF
         6WZiDR6t7VjuZVLJCoHCsuGK2139dOwprsi3MT0mnnSzWAns2VGMPeqzHH5NXddaXvte
         VoNH9H1oMhMzaGpTLAqF40VvzwnA1qgs2+ExSSzC6UHU0CBADvY6pHOvFKeuFSBukXd9
         LSlQSacpqov+6XF3yOHbNkbqDoIUJ3m2phCL0D7NpKT1niBOxm4vPueZvh2uRkexWmLH
         xs3vyMfSKW6dRdrtDowI9sX177Yqmu5XoyHyGu/p3vSe79OplqHFke0DWWena6ho8uBA
         UIXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750807536; x=1751412336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gpUS+EX77lZKoaVBWmim3dqnGXias1I977cCfQoRsAA=;
        b=OLFuN/0DreQ2HyuKhktE8JFvz/68iV2ztuZQGJw8Uuh7WjcAovAi+mLl9pb0OuGiRj
         0G17WakqOp/0GA9bS095/nS9MJvx9lDPSTcmi352MWyekVKfCyRZacSCp2H3WGbUi701
         xvvt/4/xGFnzBy0VHKhGhv7JzlgA4e+073oPOZunD5muuPrNEbAluc3h0Gd7DOr0V4on
         UhRxVYMNaAvHL7gkKsKL5hMpUf5WDaJ8Y16ehCewdy1NeYC+GuM3Jz+21CJ3oZKaQNtD
         2t0txXr9yb2U/qURmCTR9q+1g32ingbl2j8xj1KePSvy0L7V55wgdOVte2puD9wXMMEP
         rtrg==
X-Gm-Message-State: AOJu0Yw1flV4QhCKBiX2oE9tmoMk3L0SUzvQoksqMv9pCUmIhj56RWhg
	jrrMx4s+APWAFOm9UiaKogurmyK/WrE1SoRDoXmQzESYY+b4fDxTn7g84/t0e0fqBWsPR0jCHwY
	NCFQhoNjxqg==
X-Google-Smtp-Source: AGHT+IEDp9updf55BfUA08pmBhU8YEuSsF1HIz2zGLaUKLG0XPXQu8Q68M6BPJ2uiz0kFU7UI6Lz8+REqopx
X-Received: from plbmi11.prod.google.com ([2002:a17:902:fccb:b0:234:c918:aa1b])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea0e:b0:235:f298:cbbe
 with SMTP id d9443c01a7336-23823fc3f70mr19229955ad.12.1750807536641; Tue, 24
 Jun 2025 16:25:36 -0700 (PDT)
Date: Tue, 24 Jun 2025 23:25:24 +0000
In-Reply-To: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250624-debugfs-rust-v7-0-9c8835a7a20f@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750807526; l=6428;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=CAjW4qWEATQAhifD7XkDU8mnRpNkpHK/ka6oGRsQ4qs=; b=kryJzDpp6myFWv9gqYuI4yuSx3w9/sqq3gr4Gp89vHVyREZmgBuhlYOpGJE/UjM6jQeBuhO4S
 wz+ISRrNIMID3mbPaFrE6bUgDWVhw0BmCwRrWduzSnMxF0qQE0uyTfV
X-Mailer: b4 0.14.2
Message-ID: <20250624-debugfs-rust-v7-5-9c8835a7a20f@google.com>
Subject: [PATCH v7 5/6] rust: debugfs: Support format hooks
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

Rather than always using Display, allow hooking arbitrary functions to
arbitrary files. Display technically has the expressiveness to do this,
but requires a new type be declared for every different way to render
things, which can be very clumsy.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/debugfs.rs              | 45 ++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 85 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index 929e55ee5629f6888edf29997b9ed77d274e11c8..d74b599e8534536b10502e6db8c6f3197f7ab4a5 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -10,7 +10,9 @@
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
 use crate::types::ForeignOwnable;
+use core::fmt;
 use core::fmt::Display;
+use core::ops::Deref;
 
 #[cfg(CONFIG_DEBUG_FS)]
 mod display_file;
@@ -157,6 +159,49 @@ pub fn display_file<D: ForeignOwnable + Send + Sync>(&self, name: &CStr, data: D
         self.create_file(name, data)
     }
 
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
+    pub fn fmt_file<
+        D: ForeignOwnable + Send + Sync,
+        T,
+        F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
+    >(
+        &self,
+        name: &CStr,
+        data: D,
+        f: &'static F,
+    ) -> File
+    where
+        for<'a> D::Borrowed<'a>: Deref<Target = T>,
+    {
+        #[cfg(CONFIG_DEBUG_FS)]
+        let data_adapted = display_file::FormatAdapter::new(data, f);
+        #[cfg(not(CONFIG_DEBUG_FS))]
+        let data_adapted = {
+            // Mark used
+            let (_, _) = (data, f);
+            &0
+        };
+        self.display_file(name, data_adapted)
+    }
+
     /// Create a new directory in DebugFS at the root.
     ///
     /// # Examples
diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/display_file.rs
index 0c2dd756fa866425d1b7771beceaa2fb43bf11e5..b38675a90e1b2e359fb54afd91062b26d1c32ba2 100644
--- a/rust/kernel/debugfs/display_file.rs
+++ b/rust/kernel/debugfs/display_file.rs
@@ -5,7 +5,9 @@
 use crate::seq_file::SeqFile;
 use crate::seq_print;
 use crate::types::ForeignOwnable;
-use core::fmt::Display;
+use core::fmt::{Display, Formatter, Result};
+use core::marker::PhantomData;
+use core::ops::Deref;
 
 /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
 ///
@@ -70,3 +72,84 @@ impl<D: ForeignOwnable + Sync> DisplayFile for D
         ..unsafe { core::mem::zeroed() }
     };
 }
+
+/// Adapter to implement `Display` via a callback with the same representation as `T`.
+///
+/// # Invariants
+///
+/// If an instance for `FormatAdapter<_, F>` is constructed, `F` is inhabited.
+#[repr(transparent)]
+pub(crate) struct FormatAdapter<D, F> {
+    inner: D,
+    _formatter: PhantomData<F>,
+}
+
+impl<D, F> FormatAdapter<D, F> {
+    pub(crate) fn new(inner: D, _f: &'static F) -> Self {
+        // INVARIANT: We were passed a reference to F, so it is inhabited.
+        FormatAdapter {
+            inner,
+            _formatter: PhantomData,
+        }
+    }
+}
+
+pub(crate) struct BorrowedAdapter<'a, D: ForeignOwnable, F> {
+    borrowed: D::Borrowed<'a>,
+    _formatter: PhantomData<F>,
+}
+
+// SAFETY: We delegate to D's implementation of `ForeignOwnable`, so `into_foreign` produced aligned
+// pointers.
+unsafe impl<D: ForeignOwnable, F> ForeignOwnable for FormatAdapter<D, F> {
+    type PointedTo = D::PointedTo;
+    type Borrowed<'a> = BorrowedAdapter<'a, D, F>;
+    type BorrowedMut<'a> = Self::Borrowed<'a>;
+    fn into_foreign(self) -> *mut Self::PointedTo {
+        self.inner.into_foreign()
+    }
+    unsafe fn from_foreign(foreign: *mut Self::PointedTo) -> Self {
+        Self {
+            // SAFETY: `into_foreign` is delegated, so a delegated `from_foreign` is safe.
+            inner: unsafe { D::from_foreign(foreign) },
+            _formatter: PhantomData,
+        }
+    }
+    unsafe fn borrow<'a>(foreign: *mut Self::PointedTo) -> Self::Borrowed<'a> {
+        BorrowedAdapter {
+            // SAFETY: `into_foreign` is delegated, so a delegated `borrow` is safe.
+            borrowed: unsafe { D::borrow(foreign) },
+            _formatter: PhantomData,
+        }
+    }
+    unsafe fn borrow_mut<'a>(foreign: *mut Self::PointedTo) -> Self::BorrowedMut<'a> {
+        // SAFETY: `borrow_mut` has stricter requirements than `borrow`
+        unsafe { Self::borrow(foreign) }
+    }
+}
+
+impl<'a, D: ForeignOwnable<Borrowed<'a>: Deref<Target = T>>, T, F> Display
+    for BorrowedAdapter<'a, D, F>
+where
+    F: Fn(&T, &mut Formatter<'_>) -> Result + 'static,
+{
+    fn fmt(&self, fmt: &mut Formatter<'_>) -> Result {
+        // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+        let f: &F = unsafe { materialize_zst_fmt() };
+        f(&self.borrowed, fmt)
+    }
+}
+
+/// For types with a unique value, produce a static reference to it.
+///
+/// # Safety
+///
+/// The caller asserts that F is inhabited
+unsafe fn materialize_zst_fmt<F>() -> &'static F {
+    const { assert!(core::mem::size_of::<F>() == 0) };
+    let zst_dangle: core::ptr::NonNull<F> = core::ptr::NonNull::dangling();
+    // SAFETY: While the pointer is dangling, it is a dangling pointer to a ZST, based on the
+    // assertion above. The type is also inhabited, by the caller's assertion. This means
+    // we can materialize it.
+    unsafe { zst_dangle.as_ref() }
+}

-- 
2.50.0.714.g196bf9f422-goog

