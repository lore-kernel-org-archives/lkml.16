Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637226A09A;
	Thu, 12 Jun 2025 14:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739919; cv=none; b=OeJRKOAfhV3c+Pm/DMMF3pmrp2/vSTTcoNd4zdmQVgEw7PVT+w5DRsyOLU+w9Myd2T8bEKL23B0EFvDoL091tP3bcD4EXV8yzzDbFg8ZDvPaljgc6emiTp2TAZ0FJ5mCwDgDGDoqETOL+QGbkWCMd/qlhW+PzwjExgX489tDxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739919; c=relaxed/simple;
	bh=PPi+XfbHE5odGwqunvYnbbCiAfWSew9KjdZ3KwbpavE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kaPxd6GeFUfnQPKvps/5QwwyLgezLGzz67FdFIFQX07TCkBYe793sceg4TyGdpeBiQ3gCS1IgxH1FDVxme0XfG/AB0Ui5pwLgS8fNN3LLF7xTYfHR9EogzpQQ8oVYk8OCSpsDp+LdqBK+gp5NB9tvevuSIVnD0tEH+KsQHEOKtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XXDh+HJG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XXDh+HJG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33C3C4CEEA;
	Thu, 12 Jun 2025 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739918;
	bh=PPi+XfbHE5odGwqunvYnbbCiAfWSew9KjdZ3KwbpavE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XXDh+HJGnmxrPduEZOkYPQJRJRkM8qPQiToJ2OT16Rt8MBmo/2jhFbcfKJ87oIY3l
	 mawu50ForaPXdIs4EZjayFH8MketLBOtECWkwdJ4U2BL7KtIcxPvxY1vpH68r0nG+q
	 QMBE4TYk/QgcHa2xVw4eFH1suNCxDc/zychd511bGG8FARQMSx3VBn6rWk2KdDitgs
	 3OE9gHS4SulG4t2KHWAhP2wJH6nX6ECrdk+WpwI08dX5ktDWo3+NTB4wWN+S6mHN2L
	 wi69VsR6ZeoKBopju4SSu4dGvTXqv60X4rdACWIUMxrj435qfHcYpM9JG4yzWJ3dqo
	 CIIY2omntahSw==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Airlie <airlied@redhat.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH 2/4] rust: devres: replace Devres::new_foreign_owned()
Date: Thu, 12 Jun 2025 16:51:39 +0200
Message-ID: <20250612145145.12143-3-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612145145.12143-1-dakr@kernel.org>
References: <20250612145145.12143-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace Devres::new_foreign_owned() with
devres::register_foreign_boxed().

The current implementation of Devres::new_foreign_owned() creates a full
Devres container instance, including the internal Revocable and
completion.

However, none of that is necessary for the intended use of giving full
ownership of an object to devres and getting it dropped once the given
device is unbound.

Hence, implement devres::register_foreign_boxed(), which is limited to
consume the given data, wrap it in a KBox and drop the KBox once the
given device is unbound, without any other synchronization.

Cc: Dave Airlie <airlied@redhat.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/device.c     |  7 ++++
 rust/kernel/cpufreq.rs    |  8 ++---
 rust/kernel/devres.rs     | 73 +++++++++++++++++++++++++++++++++------
 rust/kernel/drm/driver.rs | 11 +++---
 4 files changed, 79 insertions(+), 20 deletions(-)

diff --git a/rust/helpers/device.c b/rust/helpers/device.c
index b2135c6686b0..502fef7e9ae8 100644
--- a/rust/helpers/device.c
+++ b/rust/helpers/device.c
@@ -8,3 +8,10 @@ int rust_helper_devm_add_action(struct device *dev,
 {
 	return devm_add_action(dev, action, data);
 }
+
+int rust_helper_devm_add_action_or_reset(struct device *dev,
+					 void (*action)(void *),
+					 void *data)
+{
+	return devm_add_action_or_reset(dev, action, data);
+}
diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
index b0a9c6182aec..f20636079f7a 100644
--- a/rust/kernel/cpufreq.rs
+++ b/rust/kernel/cpufreq.rs
@@ -12,7 +12,7 @@
     clk::Hertz,
     cpumask,
     device::{Bound, Device},
-    devres::Devres,
+    devres,
     error::{code::*, from_err_ptr, from_result, to_result, Result, VTABLE_DEFAULT_ERROR},
     ffi::{c_char, c_ulong},
     prelude::*,
@@ -910,7 +910,7 @@ unsafe impl<T: Driver> Sync for Registration<T> {}
 /// thread.
 unsafe impl<T: Driver> Send for Registration<T> {}
 
-impl<T: Driver> Registration<T> {
+impl<T: Driver + 'static> Registration<T> {
     const VTABLE: bindings::cpufreq_driver = bindings::cpufreq_driver {
         name: Self::copy_name(T::NAME),
         boost_enabled: T::BOOST_ENABLED,
@@ -1044,10 +1044,10 @@ pub fn new() -> Result<Self> {
 
     /// Same as [`Registration::new`], but does not return a [`Registration`] instance.
     ///
-    /// Instead the [`Registration`] is owned by [`Devres`] and will be revoked / dropped, once the
+    /// Instead the [`Registration`] is owned by [`kernel::devres`] and will be dropped, once the
     /// device is detached.
     pub fn new_foreign_owned(dev: &Device<Bound>) -> Result {
-        Devres::new_foreign_owned(dev, Self::new()?, GFP_KERNEL)
+        devres::register_foreign_boxed(dev, Self::new()?, GFP_KERNEL)
     }
 }
 
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index a7df9fbd724f..04435e810249 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -9,12 +9,12 @@
     alloc::Flags,
     bindings,
     device::{Bound, Device},
-    error::{Error, Result},
+    error::{to_result, Error, Result},
     ffi::c_void,
     prelude::*,
     revocable::{Revocable, RevocableGuard},
     sync::{rcu, Arc, Completion},
-    types::ARef,
+    types::{ARef, ForeignOwnable},
 };
 
 #[pin_data]
@@ -182,14 +182,6 @@ pub fn new(dev: &Device<Bound>, data: T, flags: Flags) -> Result<Self> {
         Ok(Devres(inner))
     }
 
-    /// Same as [`Devres::new`], but does not return a `Devres` instance. Instead the given `data`
-    /// is owned by devres and will be revoked / dropped, once the device is detached.
-    pub fn new_foreign_owned(dev: &Device<Bound>, data: T, flags: Flags) -> Result {
-        let _ = DevresInner::new(dev, data, flags)?;
-
-        Ok(())
-    }
-
     /// Obtain `&'a T`, bypassing the [`Revocable`].
     ///
     /// This method allows to directly obtain a `&'a T`, bypassing the [`Revocable`], by presenting
@@ -259,3 +251,64 @@ fn drop(&mut self) {
         }
     }
 }
+
+/// Consume `data` and [`Drop::drop`] `data` once `dev` is unbound.
+fn register_foreign<P: ForeignOwnable>(dev: &Device<Bound>, data: P) -> Result {
+    let ptr = data.into_foreign();
+
+    #[allow(clippy::missing_safety_doc)]
+    unsafe extern "C" fn callback<P: ForeignOwnable>(ptr: *mut kernel::ffi::c_void) {
+        // SAFETY: `ptr` is the pointer to the `ForeignOwnable` leaked above and hence valid.
+        let _ = unsafe { P::from_foreign(ptr.cast()) };
+    }
+
+    // SAFETY:
+    // - `dev.as_raw()` is a pointer to a valid and bound device.
+    // - `ptr` is a valid pointer the `ForeignOwnable` devres takes ownership of.
+    to_result(unsafe {
+        // `devm_add_action_or_reset()` also calls `callback` on failure, such that the
+        // `ForeignOwnable` is released eventually.
+        bindings::devm_add_action_or_reset(dev.as_raw(), Some(callback::<P>), ptr.cast())
+    })
+}
+
+/// Encapsulate `data` in a [`KBox`] and [`Drop::drop`] `data` once `dev` is unbound.
+///
+/// # Examples
+///
+/// ```no_run
+/// use kernel::{device::{Bound, Device}, devres};
+///
+/// struct Registration;
+///
+/// impl Registration {
+///     fn new() -> Self {
+///         // register (e.g. class device, IRQ, etc.)
+///
+///         Self
+///     }
+/// }
+///
+/// impl Drop for Registration {
+///     fn drop(&mut self) {
+///        // unregister
+///     }
+/// }
+///
+/// fn from_bound_context(dev: &Device<Bound>) -> Result {
+///     devres::register_foreign_boxed(dev, Registration::new(), GFP_KERNEL)
+/// }
+/// ```
+pub fn register_foreign_boxed<T, E>(
+    dev: &Device<Bound>,
+    data: impl PinInit<T, E>,
+    flags: Flags,
+) -> Result
+where
+    T: 'static,
+    Error: From<E>,
+{
+    let data = KBox::pin_init(data, flags)?;
+
+    register_foreign(dev, data)
+}
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index acb638086131..3b0cb80c1984 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -5,9 +5,7 @@
 //! C header: [`include/linux/drm/drm_drv.h`](srctree/include/linux/drm/drm_drv.h)
 
 use crate::{
-    bindings, device,
-    devres::Devres,
-    drm,
+    bindings, device, devres, drm,
     error::{to_result, Result},
     prelude::*,
     str::CStr,
@@ -120,7 +118,7 @@ pub trait Driver {
 /// Once the `Registration` structure is dropped, the device is unregistered.
 pub struct Registration<T: Driver>(ARef<drm::Device<T>>);
 
-impl<T: Driver> Registration<T> {
+impl<T: Driver + 'static> Registration<T> {
     /// Creates a new [`Registration`] and registers it.
     fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
         // SAFETY: `drm.as_raw()` is valid by the invariants of `drm::Device`.
@@ -130,7 +128,7 @@ fn new(drm: &drm::Device<T>, flags: usize) -> Result<Self> {
     }
 
     /// Same as [`Registration::new`}, but transfers ownership of the [`Registration`] to
-    /// [`Devres`].
+    /// [`devres::register_foreign_boxed`].
     pub fn new_foreign_owned(
         drm: &drm::Device<T>,
         dev: &device::Device<device::Bound>,
@@ -141,7 +139,8 @@ pub fn new_foreign_owned(
         }
 
         let reg = Registration::<T>::new(drm, flags)?;
-        Devres::new_foreign_owned(dev, reg, GFP_KERNEL)
+
+        devres::register_foreign_boxed(dev, reg, GFP_KERNEL)
     }
 
     /// Returns a reference to the `Device` instance for this registration.
-- 
2.49.0

