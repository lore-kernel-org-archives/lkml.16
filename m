Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DF6292B43
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 23:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751066343; cv=none; b=fyNbCw7DnW6zo/LCk6134vzWzXvuqmO3/EtdCtrcgcriCT/2DaLXhPYrvUQ0UjkVh3Bjht1aBsWFKQpkRl/GB7UaghJteGmbZ4fZ00qkODpqz/33QZY97Jg18aA6nM+X9PTRLeeC5Lcfv1WAOH/iNOLG1cJC0qZoJOaQR6WJJSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751066343; c=relaxed/simple;
	bh=Gc2so4smdIf1i7j4gTeIU1kaRlnXyNxsJaXUAE7o+/U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q8O+okQFIMQH2HLnmas8Hn/7vwRI+uJRDlzZqaYgmAjujBgB3TjFAAbR5sGGZAo9cyYtNABtoPrwRX+UgfUJL2yBnF+jamMgzj/ynGrFYKOIW8Ws5fcl0xpW22fmVGCjIAAec3Wp12pl6NMLQhxmjUDDMbG7971eYcscA124NOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=po83a66J; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="po83a66J"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-747ddba7c90so366797b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751066341; x=1751671141; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=wqFaGm4GB0KNYo2CZziN4flSoFd+I3+UISgZDI1zvM4=;
        b=po83a66JxPvOH1ZmfVVfgaC8M0NwQucnYMw6eUXZM/rWHoorfU+Hs7WBx5NHPiwNNu
         7ftsX9HFLfX/b2b2khGSeEPcfpUKQJ/+I4E90ZlsgpY53FWyZGlcA2Por537yfYxMoBg
         zW/UlHGOPc9jyLvgFdEtoREK0asBOB2T9VZ6mDZUg2Xo/KphXt3OO7gVhpNUwSaZo8Ny
         m/jY/Hfau9yP/e3SfjoorjuqkNpbfHTZlnBsRLzA4CT7v91po+L5FohqsF09Vb8V31sI
         Qkafam0FXQvRAh2R83W3ig4cdmZhXNukimagxaWy3QDLjSbAhRa2gwUhIZyZnAIr0H4R
         AeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751066341; x=1751671141;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqFaGm4GB0KNYo2CZziN4flSoFd+I3+UISgZDI1zvM4=;
        b=rJMxgDDe9LNRxm/nQsb97tOW8rkCBqgc/IvEKp9GbLGI9EyjFBPoLRCYB2NxcChYU2
         Dm/cT2IClTM/AdTu6dWfnZKHIhHuluM6/g5BxM4XFIMjUk7B8dabtshHaMKUt9JbyJBx
         jgNSBEdz3B+Wx6DxZS91aaTHvojLzICfUtzHxXqC/IxQbX0AusYo5ELSjZ9sXKKSunMJ
         iPl4oPvXNrhFXtu/JJc8C65N0znf8bRlpNnE93h5fXQGe56VRLbnGq8AL7Dcscf+KwL6
         pF16wUEEpySJcM1O7ZIy0s0b9QM7uI4VmiLngBLUJgc/heVvn6/i2mEPsscean39B5fX
         ryQQ==
X-Gm-Message-State: AOJu0YxX/BUbuL8Wl11yXKxuJfYv0sE3s+GPYtswq9bb58pKfuKKZf69
	oA8sCamyYW2eY+aWC8KlLuG+3giUfPVc3DZ66njHGnT8Ug28DYOEztq1uNAykxEquk23vsNVhI9
	VS0oJskMfig==
X-Google-Smtp-Source: AGHT+IFDyZVe59e1MBXO1oPmvtzkDr7PIQbOg90cm+dhUGt0VZUUBO/sieOBpJwoyIDRyGYZaerypthGmizH
X-Received: from pfbf3.prod.google.com ([2002:a05:6a00:ad83:b0:748:4f7c:c605])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2409:b0:730:9946:5973
 with SMTP id d2e1a72fcca58-74af6e39feemr6156140b3a.5.1751066341323; Fri, 27
 Jun 2025 16:19:01 -0700 (PDT)
Date: Fri, 27 Jun 2025 23:18:28 +0000
In-Reply-To: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250627-debugfs-rust-v8-0-c6526e413d40@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751066331; l=6477;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=Gc2so4smdIf1i7j4gTeIU1kaRlnXyNxsJaXUAE7o+/U=; b=NnjWslr8ptGBmFKeniz9+u0oXUjE79BjuxcBOaP34x0Gbvc1Tc1q7nO3wQbBUflUsoXSKqAfu
 RLqE54dGrgIDYfsz8A5jmu2j2i8oECONjNTKMg68zF8MDcC9hmj7q7V
X-Mailer: b4 0.14.2
Message-ID: <20250627-debugfs-rust-v8-5-c6526e413d40@google.com>
Subject: [PATCH v8 5/6] rust: debugfs: Support format hooks
From: Matthew Maurer <mmaurer@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="utf-8"

Rather than always using Display, allow hooking arbitrary functions to
arbitrary files. Display technically has the expressiveness to do this,
but requires a new type be declared for every different way to render
things, which can be very clumsy.

Tested-by: Dirk Behme <dirk.behme@de.bosch.com>
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
2.50.0.727.gbf7dc18ff4-goog

