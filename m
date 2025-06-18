Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA46F1CEACB
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750213705; cv=none; b=BI/iHvktxEC8id/M6iGVie3bYV7SNgE4CEz5t7NTut1v0ZkPqMKS7soNTwDdrpV0pv1ybTB43ig8wjKDLI3f5cEC5dRaBEkqtfIkm7ueOcmUAWOhNaUAvCXjTq86rNn/BVAifPrsdoKSoFlMv7ihiRnIVIIXmbIrvPuSQnegKmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750213705; c=relaxed/simple;
	bh=oKl2z85IL+nZOqvaoXori7duEOA4yiwEy+q0plhD4uo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mc11fOmw7lfWTaFw238o1wjeUW3oHq+FRgdPSTp9hEWZBRJUHiFQDttbMzGJvEqJ/hArcqJKAZeX2wGEkY7NuEimZikZUmPeFwMlJxp02WxeW4x6wxE99JyJplSTSscRBtpPLFwwiAeW4Kqx60l8vxC70xzwFGTvxkwuRUfc+Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2TpPziff; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2TpPziff"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so5506398a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 19:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750213702; x=1750818502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji5LW4YxsgtGLzHKx3kLMSLSenw4FylgJNlVG7ZKEt0=;
        b=2TpPziffMtiOew/A55p7sPKNV1vEOYUxzHOjxRCWLk2Qs5yCWkzBPOIpAkBfrit2yR
         mXKuhCx9NVgrGPwaaZUL7RkaSv7ivmLFBtLzdaa0jW267hX8cCndsOBbbhw9F+bAD5uf
         jyNKo69te2PbepWyn6m+2qAwDANq1ApR4/j2Fp/yL90PCm8hySJGEgOI/add9McRF1Z1
         2dc35t4BYFvub1G88dDW2Yfgwix3m6Gf9iAeFfxPJAJ5wH/epPSji00FTdlCiJRX/whc
         XeDmdujUgrh9aTrC8rKD3x2l3yF9K7WJN/ccT5PCycuY5DZe2EyUgYLpAXU9Egy5zz5y
         mBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750213702; x=1750818502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ji5LW4YxsgtGLzHKx3kLMSLSenw4FylgJNlVG7ZKEt0=;
        b=HWUwwauLpAG2bbsULmS7INQFp/8Ni5uE1AjG3+WYDaorLRBBz/DQMFtGIAx9z5OZTu
         A8gVA9ZCLQLLxUP8r+1Z1nOkrnoDgOslLNRUfiJvSFCp6ZlPU/ZPUOy59VzZCtrs26mr
         zXIGUzZAia/exugLyCEQx5MGVc8ttQdvxrXx3yFvw7iyIalYcW/WGaCFkGlD29ulmSPn
         vDcZCsU7Unw+MRzX9e//QDmK63dszGbhIKSt3s6Ne8narQ5cnWeW906fPfUZU7pJ0vrV
         aISHtpJP5B4DxYeyG2/A71mtowSZ8aofV1rNsETfiHOj4QLtoWGOm+CmDWlrrS1U2Wni
         0qYA==
X-Gm-Message-State: AOJu0YxK1AjtdG3nR1yRdtrF0FgXbBF4gN/2tMLCGF/lRHLto8QZvFhD
	uHEZs4pHgi4A6lMRClX5zJ4Pa/OgKyAHO7Hmf4DS92CwNJbvY+M4nv/LamrFAQUIVjoAKExZHdA
	2O3YRBcGViw==
X-Google-Smtp-Source: AGHT+IHAQpDx0027kALvg1jSe/gar3r1FYw4JgvW4VzKKZpfVlGqi7+hrvadAqyyRO0ld8W2IiZRCSTaLsiI
X-Received: from pjbtc8.prod.google.com ([2002:a17:90b:5408:b0:2fb:fa85:1678])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5847:b0:312:1b53:5ea8
 with SMTP id 98e67ed59e1d1-313f1ce2aa1mr23177238a91.24.1750213702122; Tue, 17
 Jun 2025 19:28:22 -0700 (PDT)
Date: Wed, 18 Jun 2025 02:28:16 +0000
In-Reply-To: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750213694; l=4975;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=oKl2z85IL+nZOqvaoXori7duEOA4yiwEy+q0plhD4uo=; b=JfyQqUjWgCEhfJVm3XmVU9Mcp3CRaqdG8HbDyyicg5nbnzGjcEPq+0U/NFwsTKdij84wHXHye
 CL4qseLURoXBz69rJh20wKqp7a/H3zhKEQ6peB4FLh/bIGzwBVfAS90
X-Mailer: b4 0.14.2
Message-ID: <20250618-debugfs-rust-v6-4-72cae211b133@google.com>
Subject: [PATCH v6 4/5] rust: debugfs: Support format hooks
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
 rust/kernel/debugfs.rs              | 41 ++++++++++++++++++++++++++
 rust/kernel/debugfs/display_file.rs | 57 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 97 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index cd83f21cf2818f406575941ebbc6c426575643e4..78544653b46d959c1520b1210170d22a0e973989 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -10,6 +10,7 @@
 use crate::str::CStr;
 #[cfg(CONFIG_DEBUG_FS)]
 use crate::sync::Arc;
+use core::fmt;
 use core::fmt::Display;
 use core::ops::Deref;
 
@@ -153,6 +154,46 @@ pub fn display_file<D: Deref<Target = T> + 'static + Send + Sync, T: Display>(
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
+        D: Deref<Target = T> + 'static + Send + Sync,
+        T: Sync,
+        F: Fn(&T, &mut fmt::Formatter<'_>) -> fmt::Result + Send + Sync,
+    >(
+        &self,
+        name: &CStr,
+        data: D,
+        f: &'static F,
+    ) -> File {
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
index 65e37e34d7b587482492dc296637a3bc517b9fe3..75f2e1c560840324117bc1bc73aa89e3823aaf0e 100644
--- a/rust/kernel/debugfs/display_file.rs
+++ b/rust/kernel/debugfs/display_file.rs
@@ -3,7 +3,9 @@
 
 use crate::seq_file::SeqFile;
 use crate::seq_print;
-use core::fmt::Display;
+use core::fmt::{Display, Formatter, Result};
+use core::marker::PhantomData;
+use core::ops::Deref;
 
 /// Implements `open` for `file_operations` via `single_open` to fill out a `seq_file`.
 ///
@@ -58,3 +60,56 @@ pub(crate) trait DisplayFile: Display + Sized {
 }
 
 impl<T: Display + Sized> DisplayFile for T {}
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
+impl<D: Deref<Target = T>, T, F> Display for FormatAdapter<D, F>
+where
+    F: Fn(&T, &mut Formatter<'_>) -> Result + 'static,
+{
+    fn fmt(&self, fmt: &mut Formatter<'_>) -> Result {
+        // SAFETY: FormatAdapter<_, F> can only be constructed if F is inhabited
+        let f: &F = unsafe { materialize_zst_fmt() };
+        f(&self.inner, fmt)
+    }
+}
+
+impl<D, F> Deref for FormatAdapter<D, F> {
+    type Target = Self;
+    fn deref(&self) -> &Self {
+        self
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
2.50.0.rc2.696.g1fc2a0284f-goog

