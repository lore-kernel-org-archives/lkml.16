Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC062D3A8C;
	Mon, 23 Jun 2025 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702969; cv=pass; b=odJQK8YK19Qy8lDR0agHwqXLDwoqENB3vTMf/inKeEtD7Cji8GxcsagEfRR1cSgrlm2YGowGa5HkhjLKNYQu2H5CmFfQHsXi90cvvHvvANgccZfbjw++Ia4hICDKH8f2+5m+CcR+6tExzA2bOy9a4rG4zEojvcQx56dqQXX+dFk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702969; c=relaxed/simple;
	bh=gi21jFCt7u6E8M2usV7AXIeFhe2OIx09j8QuIn6BLjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcloGu9v8SE9ZO29jn0Xdtsjja52CZsyCTnGOmcnHkJvpkIzFJH2NbjmjfPJmEHBEljinMEUYNopTaI8BQvXqDNKgGi0Caio7TkUDVCoVzcQtAXg8WdgyvUwyzLFCBCfg5qO+7d97OxhTWV0OQ3xGtsAO6xmh7Yl+BVBWs7OMO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ZU/UWFo6; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZU/UWFo6"
ARC-Seal: i=1; a=rsa-sha256; t=1750702934; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LY7MyW7Z2LmpEbgT8lMfDg9XbVurwVcjD1GEeeoFSU0dh6YRZQtqkTrNuURdv/AzCaCUe7ylfbJtZToonL+2pYUQoHydjW5HM60xhGp/GzTR9e2ROyKuv0iV8E8x5hkzETEy2ngS7tCZqG2bJSrHNz8bFom0UYMLKtCm8bRd354=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750702934; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BvZwsBRRnw+XQVZodXUyd872Zp6jX7q6FaaWDrqBHHw=; 
	b=dHmrdqguhJ1Yqub7JPcWZznINHUX7hM1Z6Q+ZeWCyryf7Q5s0YFX8pL5/bG/KsbWudXXv0TagQ7R26YPRUK4elbfWvR7QY22DRGNMnnSmKGapJF60603xgwPXgk9N+Z1uL7dn47p36vw9UWYYLrKHqMskz/PY0BKg/PUlHiIbU4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750702934;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BvZwsBRRnw+XQVZodXUyd872Zp6jX7q6FaaWDrqBHHw=;
	b=ZU/UWFo6RYA+p0Jgkq0xHcR5jEIcawLbcjw0+LO3YVSYri1j0oC23MTkRw5iHB/s
	CBQQOe9gzHRYo1jEm0C5M/6MXMWT4aMb8ncP8fCB44TDKfSs7PHVaOj9BIvkmY9UmQx
	jqU8f6gJc+d3fA08deCQTeNoRWMv6XZ+YlPQ2Xn8=
Received: by mx.zohomail.com with SMTPS id 1750702932418825.1956168177345;
	Mon, 23 Jun 2025 11:22:12 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 15:21:56 -0300
Subject: [PATCH v5 1/2] rust: regulator: add a bare minimum regulator
 abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-regulator-v5-1-99069658cb54@collabora.com>
References: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
In-Reply-To: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External

Add a bare minimum regulator abstraction to be used by Rust drivers.
This abstraction adds a small subset of the regulator API, which is
thought to be sufficient for the drivers we have now.

Regulators provide the power needed by many hardware blocks and thus are
likely to be needed by a lot of drivers.

It was tested on rk3588, where it was used to power up the "mali"
regulator in order to power up the GPU.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/regulator.rs        | 382 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+)

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index ab37e1d35c70d52e69b754bf855bc19911d156d8..e14cce03338ef5f6a09a23fd41ca47b8c913fa65 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -31,6 +31,7 @@
 #include <linux/poll.h>
 #include <linux/property.h>
 #include <linux/refcount.h>
+#include <linux/regulator/consumer.h>
 #include <linux/sched.h>
 #include <linux/security.h>
 #include <linux/slab.h>
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 28007be98fbad0e875d7e5345e164e2af2c5da32..c8fd7e4e036e9e5b6958acf0dcfa952b916a3d48 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -86,6 +86,8 @@
 pub mod prelude;
 pub mod print;
 pub mod rbtree;
+#[cfg(CONFIG_REGULATOR)]
+pub mod regulator;
 pub mod revocable;
 pub mod security;
 pub mod seq_file;
diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
new file mode 100644
index 0000000000000000000000000000000000000000..9972fa6056a74c09a4bad45c1f36558be768b097
--- /dev/null
+++ b/rust/kernel/regulator.rs
@@ -0,0 +1,382 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Regulator abstractions, providing a standard kernel interface to control
+//! voltage and current regulators.
+//!
+//! The intention is to allow systems to dynamically control regulator power
+//! output in order to save power and prolong battery life. This applies to both
+//! voltage regulators (where voltage output is controllable) and current sinks
+//! (where current limit is controllable).
+//!
+//! C header: [`include/linux/regulator/consumer.h`](srctree/include/linux/regulator/consumer.h)
+//!
+//! Regulators are modeled in Rust with a collection of states. Each state may
+//! enforce a given invariant, and they may convert between each other where applicable.
+//!
+//! See [Voltage and current regulator API](https://docs.kernel.org/driver-api/regulator.html)
+//! for more information.
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    prelude::*,
+};
+
+use core::{marker::PhantomData, ptr::NonNull};
+
+mod private {
+    pub trait Sealed {}
+
+    impl Sealed for super::Enabled {}
+    impl Sealed for super::Disabled {}
+    impl Sealed for super::Dynamic {}
+}
+
+/// A trait representing the different states a [`Regulator`] can be in.
+pub trait RegulatorState: private::Sealed {}
+
+/// A state where the [`Regulator`] is known to be enabled.
+pub struct Enabled;
+
+/// A state where this [`Regulator`] handle has not specifically asked for the
+/// underlying regulator to be enabled. This means that this reference does not
+/// own an `enable` reference count, but the regulator may still be on.
+pub struct Disabled;
+
+/// A state that models the C API. The [`Regulator`] can be either enabled or
+/// disabled, and the user is in control of the reference count. This is also
+/// the default state.
+///
+/// Use [`Regulator::is_enabled`] to check the regulator's current state.
+pub struct Dynamic;
+
+impl RegulatorState for Enabled {}
+impl RegulatorState for Disabled {}
+impl RegulatorState for Dynamic {}
+
+/// A trait that abstracts the ability to check if a [`Regulator`] is enabled.
+pub trait IsEnabled: RegulatorState {}
+impl IsEnabled for Disabled {}
+impl IsEnabled for Dynamic {}
+
+/// An error that can occur when trying to convert a [`Regulator`] between states.
+pub struct Error<State: RegulatorState + 'static> {
+    /// The error that occurred.
+    pub error: kernel::error::Error,
+
+    /// The regulator that caused the error, so that the operation may be retried.
+    pub regulator: Regulator<State>,
+}
+
+/// A `struct regulator` abstraction.
+///
+/// # Examples
+///
+/// ## Enabling a regulator
+///
+/// This example uses [`Regulator<Enabled>`], which is suitable for drivers that
+/// enable a regulator at probe time and leave them on until the device is
+/// removed or otherwise shutdown.
+///
+/// These users can store [`Regulator<Enabled>`] directly in their driver's
+/// private data struct.
+///
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::c_str;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Microvolt, Regulator, Disabled, Enabled};
+/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Result {
+///     // Obtain a reference to a (fictitious) regulator.
+///     let regulator: Regulator<Disabled> = Regulator::<Disabled>::get(dev, c_str!("vcc"))?;
+///
+///     // The voltage can be set before enabling the regulator if needed, e.g.:
+///     regulator.set_voltage(min_uv, max_uv)?;
+///
+///     // The same applies for `get_voltage()`, i.e.:
+///     let voltage: Microvolt = regulator.get_voltage()?;
+///
+///     // Enables the regulator, consuming the previous value.
+///     //
+///     // From now on, the regulator is known to be enabled because of the type
+///     // `Enabled`.
+///     //
+///     // If this operation fails, the `Error` will contain the regulator
+///     // reference, so that the operation may be retried.
+///     let regulator: Regulator<Enabled> =
+///         regulator.try_into_enabled().map_err(|error| error.error)?;
+///
+///     // The voltage can also be set after enabling the regulator, e.g.:
+///     regulator.set_voltage(min_uv, max_uv)?;
+///
+///     // The same applies for `get_voltage()`, i.e.:
+///     let voltage: Microvolt = regulator.get_voltage()?;
+///
+///     // Dropping an enabled regulator will disable it. The refcount will be
+///     // decremented.
+///     drop(regulator);
+///
+///     // ...
+///
+///     Ok(())
+/// }
+/// ```
+///
+/// A more concise shortcut is available for enabling a regulator. This is
+/// equivalent to `regulator_get_enable()`:
+///
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::c_str;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Microvolt, Regulator, Enabled};
+/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Result {
+///     // Obtain a reference to a (fictitious) regulator and enable it.
+///     let regulator: Regulator<Enabled> = Regulator::<Enabled>::get(dev, c_str!("vcc"))?;
+///
+///     // Dropping an enabled regulator will disable it. The refcount will be
+///     // decremented.
+///     drop(regulator);
+///
+///     // ...
+///
+///     Ok(())
+/// }
+/// ```
+///
+/// ## Disabling a regulator
+///
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Regulator, Enabled, Disabled};
+/// fn disable(dev: &Device, regulator: Regulator<Enabled>) -> Result {
+///     // We can also disable an enabled regulator without reliquinshing our
+///     // refcount:
+///     //
+///     // If this operation fails, the `Error` will contain the regulator
+///     // reference, so that the operation may be retried.
+///     let regulator: Regulator<Disabled> =
+///         regulator.try_into_disabled().map_err(|error| error.error)?;
+///
+///     // The refcount will be decremented when `regulator` is dropped.
+///     drop(regulator);
+///
+///     // ...
+///
+///     Ok(())
+/// }
+/// ```
+///
+/// ## Using [`Regulator<Dynamic>`]
+///
+/// This example mimics the behavior of the C API, where the user is in
+/// control of the enabled reference count. This is useful for drivers that
+/// might call enable and disable to manage the `enable` reference count at
+/// runtime, perhaps as a result of `open()` and `close()` calls or whatever
+/// other driver-specific or subsystem-specific hooks.
+///
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::c_str;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Regulator, Dynamic};
+/// struct PrivateData {
+///     regulator: Regulator<Dynamic>,
+/// }
+///
+/// // A fictictious probe function that obtains a regulator and sets it up.
+/// fn probe(dev: &Device, data: &mut PrivateData) -> Result<PrivateData> {
+///     // Obtain a reference to a (fictitious) regulator.
+///     let mut regulator = Regulator::<Dynamic>::get(dev, c_str!("vcc"))?;
+///
+///     // Enable the regulator. The type is still `Regulator<Dynamic>`.
+///     regulator.enable()?;
+///
+///     Ok(PrivateData { regulator })
+/// }
+///
+/// // A fictictious function that indicates that the device is going to be used.
+/// fn open(dev: &Device, data: &mut PrivateData) -> Result {
+///     // Increase the `enabled` reference count.
+///     data.regulator.enable()?;
+///
+///     Ok(())
+/// }
+///
+/// fn close(dev: &Device, data: &mut PrivateData) -> Result {
+///     // Decrease the `enabled` reference count.
+///     data.regulator.disable()?;
+///
+///     Ok(())
+/// }
+///
+/// fn remove(dev: &Device, data: PrivateData) -> Result {
+///     // `PrivateData` is dropped here, which will drop the
+///     // `Regulator<Dynamic>` in turn.
+///     //
+///     // The reference that was obtained by `regulator_get()` will be
+///     // released, but it is up to the user to make sure that the number of calls
+///     // to `enable()` and `disabled()` are balanced before this point.
+///     Ok(())
+/// }
+/// ```
+///
+/// # Invariants
+///
+/// - `inner` is a non-null wrapper over a pointer to a `struct
+///   regulator` obtained from [`regulator_get()`].
+///
+/// [`regulator_get()`]: https://docs.kernel.org/driver-api/regulator.html#c.regulator_get
+pub struct Regulator<State = Dynamic>
+where
+    State: RegulatorState + 'static,
+{
+    inner: NonNull<bindings::regulator>,
+    _phantom: PhantomData<State>,
+}
+
+impl<T: RegulatorState + 'static> Regulator<T> {
+    /// Sets the voltage for the regulator.
+    ///
+    /// This can be used to ensure that the device powers up cleanly.
+    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) -> Result {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        to_result(unsafe {
+            bindings::regulator_set_voltage(self.inner.as_ptr(), min_uv.0, max_uv.0)
+        })
+    }
+
+    /// Gets the current voltage of the regulator.
+    pub fn get_voltage(&self) -> Result<Microvolt> {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        let voltage = unsafe { bindings::regulator_get_voltage(self.inner.as_ptr()) };
+        if voltage < 0 {
+            Err(kernel::error::Error::from_errno(voltage))
+        } else {
+            Ok(Microvolt(voltage))
+        }
+    }
+
+    fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
+        // SAFETY: It is safe to call `regulator_get()`, on a device pointer
+        // received from the C code.
+        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
+
+        // SAFETY: We can safely trust `inner` to be a pointer to a valid
+        // regulator if `ERR_PTR` was not returned.
+        let inner = unsafe { NonNull::new_unchecked(inner) };
+
+        Ok(Self {
+            inner,
+            _phantom: PhantomData,
+        })
+    }
+
+    fn enable_internal(&mut self) -> Result {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) })
+    }
+
+    fn disable_internal(&mut self) -> Result {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        to_result(unsafe { bindings::regulator_disable(self.inner.as_ptr()) })
+    }
+}
+
+impl Regulator<Disabled> {
+    /// Obtains a [`Regulator`] instance from the system.
+    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
+        Regulator::get_internal(dev, name)
+    }
+
+    /// Attempts to convert the regulator to an enabled state.
+    pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, Error<Disabled>> {
+        self.enable_internal()
+            .map(|()| Regulator {
+                inner: self.inner,
+                _phantom: PhantomData,
+            })
+            .map_err(|error| Error {
+                error,
+                regulator: self,
+            })
+    }
+}
+
+impl Regulator<Enabled> {
+    /// Obtains a [`Regulator`] instance from the system and enables it.
+    ///
+    /// This is equivalent to calling `regulator_get_enable()` in the C API.
+    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
+        Regulator::<Disabled>::get_internal(dev, name)?
+            .try_into_enabled()
+            .map_err(|error| error.error)
+    }
+
+    /// Attempts to convert the regulator to a disabled state.
+    pub fn try_into_disabled(mut self) -> Result<Regulator<Disabled>, Error<Enabled>> {
+        self.disable_internal()
+            .map(|()| Regulator {
+                inner: self.inner,
+                _phantom: PhantomData,
+            })
+            .map_err(|error| Error {
+                error,
+                regulator: self,
+            })
+    }
+}
+
+impl Regulator<Dynamic> {
+    /// Obtains a [`Regulator`] instance from the system. The current state of
+    /// the regulator is unknown and it is up to the user to manage the enabled
+    /// reference count.
+    ///
+    /// This closely mimics the behavior of the C API and can be used to
+    /// dynamically manage the enabled reference count at runtime.
+    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
+        Regulator::get_internal(dev, name)
+    }
+
+    /// Increases the `enabled` reference count.
+    pub fn enable(&mut self) -> Result {
+        self.enable_internal()
+    }
+
+    /// Decreases the `enabled` reference count.
+    pub fn disable(&mut self) -> Result {
+        self.disable_internal()
+    }
+}
+
+impl<T: IsEnabled> Regulator<T> {
+    /// Checks if the regulator is enabled.
+    pub fn is_enabled(&self) -> bool {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        unsafe { bindings::regulator_is_enabled(self.inner.as_ptr()) != 0 }
+    }
+}
+
+impl<T: RegulatorState + 'static> Drop for Regulator<T> {
+    fn drop(&mut self) {
+        if core::any::TypeId::of::<T>() == core::any::TypeId::of::<Enabled>() {
+            // SAFETY: By the type invariants, we know that `self` owns a
+            // reference on the enabled refcount, so it is safe to relinquish it
+            // now.
+            unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
+        }
+        // SAFETY: By the type invariants, we know that `self` owns a reference,
+        // so it is safe to relinquish it now.
+        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
+    }
+}
+
+/// A voltage in microvolts.
+///
+/// The explicit type is used to avoid confusion with other multiples of the
+/// volt, which can be disastrous.
+#[repr(transparent)]
+#[derive(Copy, Clone, PartialEq, Eq)]
+pub struct Microvolt(pub i32);

-- 
2.50.0

