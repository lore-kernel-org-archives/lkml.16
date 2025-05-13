Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C182149E17;
	Tue, 13 May 2025 15:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747151124; cv=pass; b=nvZDeKXrku2DAwoBloEOL5Q0B1aVcGC/3ZzztB/wBHSQJRktDAWaUS77r7AHDVEkXZCSzOFer9JS7OZlnJomT7+tbfgS6mCi/cblpwqQ6rVFakwyBMBlrRYWCMdeJuI0ZrskcUMI50IG9T8gh5bfGbxdLb+w5vpLCDdrFpbq9CI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747151124; c=relaxed/simple;
	bh=XRru0fNuN4kPTqC3dhLT+4XG1bY2hdBoP4QqcruBUVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=uAYxDJ99cHHNWT6l2gDVymOK+K7XnF2USxIamnhVy0SnHIdjO2xCZZ7So8NeOb+xmy5AYUMOA6TbHcDtmbWGXFHKwzdlX08ybtvkWRAsdJHsD61tbtkOHTfSwO6/BDZdjUHHK4oW0+YEZUDrk5poWdeQIyh60SXsuWyzgPnwxFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=eYd4FRnA; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="eYd4FRnA"
ARC-Seal: i=1; a=rsa-sha256; t=1747151088; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aRqlFm/kAYJAZcZEB2+HO1SMzlsrctJk8VTiSmbc/upif7Uoj5tzwrTc39a+7Yri26GepkANwGtweF0ElVBlcciNnfy3I4zJ/19GQmtRvUgbOr+xHgJx15eoUmHX6M2ggsIkCI3uc7QaiQsqOu0YwGDp6xBaypHkg5ABND5Lz8c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747151088; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DCxUd+PL/O8kO0cjXoWb+/YHUZfnQuN6UjzGTATdG+I=; 
	b=LJQsipcMpV2SY6JXE1ty3q1fC60YOwbHuI3NWyL+lZa+8XtTerZDI64da/F2S1GBCInm2OFZ176NvTaacfURKLxUmQyJCaT8xV2T2GoteTTUjGlL4OogeFvIchdaAzxaEfEPQ9xuwYsQEQlgowKvpdr7qJVds1uZ7ghucM3QRpA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747151088;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=DCxUd+PL/O8kO0cjXoWb+/YHUZfnQuN6UjzGTATdG+I=;
	b=eYd4FRnA74nTC+QZN51J638ApcKC5uJqHeC+ebt0GuU6mc0IxAxKVIDc270hDqm4
	URATiJbRFPGdeck9n50bCwOoYA3xAuOgvKqKjCVVb48G5D1sRG8IKf5WU7pBAH5sZfk
	zZ05SrRJeUSPqfryx0KKrf9hPKuqX9UEj41F0AXM=
Received: by mx.zohomail.com with SMTPS id 1747151087127853.6400557201932;
	Tue, 13 May 2025 08:44:47 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 13 May 2025 12:44:08 -0300
Subject: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
X-B4-Tracking: v=1; b=H4sIAMdoI2gC/4XOsQ6CMBDG8VcxnS2hJZTq5HsYhqMcckmh5IpEQ
 nh3i4uJi+N/uN99m4jIhFFcT5tgXChSGFMU55NwPYwPlNSmFjrXZV5oI+cwkYtyXlkyPp4e5sA
 SbXOxnbEmbyuRTifGjl4f9l6n7jgMcu4Z4YtpdVFGl6rKdGULo6WSLYyEPgM/ILVwc8F7aAJD5
 sJwsD3F9G39jF30gf/ZtRyqyxEMWKMaND9mve/7G9/pd/oDAQAA
X-Change-ID: 20250326-topics-tyr-regulator-e8b98f6860d7
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
Changes in v3:
- Rebased on rust-next
- Added examples to showcase the API
- Fixed some rendering issues in the docs
- Exposed {get|set}_voltage for both Regulator and EnabledRegulator
- Derived Clone, Copy, PartialEq and Eq for Microvolt
- Link to v2: https://lore.kernel.org/r/20250326-topics-tyr-regulator-v2-1-c0ea6a861be6@collabora.com

Resend v2:
  - cc Regulator maintainers
Changes from v1:
  - Rebased on rust-next
  - Split the design into two types as suggested by Alice Ryhl.
  - Modify the docs to highlight how users can use kernel::types::Either
    or an enum to enable and disable the regulator at runtime.
  - Link to v1: https://lore.kernel.org/rust-for-linux/20250219162517.278362-1-daniel.almeida@collabora.com/
---
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   2 +
 rust/kernel/regulator.rs        | 211 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 214 insertions(+)

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
index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e9b0f90830d5291ab9
--- /dev/null
+++ b/rust/kernel/regulator.rs
@@ -0,0 +1,211 @@
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
+//! Regulators are modeled in Rust with two types: [`Regulator`] and
+//! [`EnabledRegulator`].
+//!
+//! The transition between these types is done by calling
+//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respectively.
+//!
+//! Use an enum or [`kernel::types::Either`] to gracefully transition between
+//! the two states at runtime if needed. Store [`EnabledRegulator`] directly
+//! otherwise.
+//!
+//! See [`Voltage and current regulator API`]("https://docs.kernel.org/driver-api/regulator.html")
+//! for more information.
+
+use crate::{
+    bindings,
+    device::Device,
+    error::{from_err_ptr, to_result, Result},
+    prelude::*,
+};
+
+use core::{mem::ManuallyDrop, ptr::NonNull};
+
+/// A `struct regulator` abstraction.
+///
+/// # Examples
+///
+/// Enabling a regulator:
+///
+/// ```
+/// # use kernel::prelude::*;
+/// # use kernel::c_str;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Microvolt, Regulator, EnabledRegulator};
+/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Result {
+///    // Obtain a reference to a (fictitious) regulator.
+///    let regulator: Regulator = Regulator::get(dev, c_str!("vcc"))?;
+///
+///    // The voltage can be set before enabling the regulator if needed, e.g.:
+///    regulator.set_voltage(min_uv, max_uv)?;
+///
+///    // The same applies for `get_voltage()`, i.e.:
+///    let voltage: Microvolt = regulator.get_voltage()?;
+///
+///    // Enables the regulator, consuming the previous value.
+///    //
+///    // From now on, the regulator is known to be enabled because of the type
+///    // `EnabledRegulator`.
+///    let regulator: EnabledRegulator = regulator.enable()?;
+///
+///    // The voltage can also be set after enabling the regulator, e.g.:
+///    regulator.set_voltage(min_uv, max_uv)?;
+///
+///    // The same applies for `get_voltage()`, i.e.:
+///    let voltage: Microvolt = regulator.get_voltage()?;
+///
+///    // Dropping an enabled regulator will disable it. The refcount will be
+///    // decremented.
+///    drop(regulator);
+///    // ...
+///    # Ok::<(), Error>(())
+/// }
+///```
+///
+/// Disabling a regulator:
+///
+///```
+/// # use kernel::prelude::*;
+/// # use kernel::c_str;
+/// # use kernel::device::Device;
+/// # use kernel::regulator::{Microvolt, Regulator, EnabledRegulator};
+/// fn disable(dev: &Device, regulator: EnabledRegulator) -> Result {
+///    // We can also disable an enabled regulator without reliquinshing our
+///    // refcount:
+///    let regulator: Regulator = regulator.disable()?;
+///
+///    // The refcount will be decremented when `regulator` is dropped.
+///    drop(regulator);
+///    // ...
+///    # Ok::<(), Error>(())
+/// }
+/// ```
+///
+/// # Invariants
+///
+/// - [`Regulator`] is a non-null wrapper over a pointer to a `struct
+///   regulator` obtained from [`regulator_get()`](https://docs.kernel.org/driver-api/regulator.html#c.regulator_get).
+/// - Each instance of [`Regulator`] is associated with a single count of
+///   [`regulator_get()`](https://docs.kernel.org/driver-api/regulator.html#c.regulator_get).
+pub struct Regulator {
+    inner: NonNull<bindings::regulator>,
+}
+
+impl Regulator {
+    /// Obtains a [`Regulator`] instance from the system.
+    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
+        // SAFETY: It is safe to call `regulator_get()`, on a device pointer
+        // received from the C code.
+        let inner = from_err_ptr(unsafe { bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
+
+        // SAFETY: We can safely trust `inner` to be a pointer to a valid
+        // regulator if `ERR_PTR` was not returned.
+        let inner = unsafe { NonNull::new_unchecked(inner) };
+
+        Ok(Self { inner })
+    }
+
+    /// Enables the regulator.
+    pub fn enable(self) -> Result<EnabledRegulator> {
+        // SAFETY: Safe as per the type invariants of `Regulator`.
+        let res = to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr()) });
+        res.map(|()| EnabledRegulator { inner: self })
+    }
+
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
+            Err(Error::from_errno(voltage))
+        } else {
+            Ok(Microvolt(voltage))
+        }
+    }
+}
+
+impl Drop for Regulator {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference,
+        // so it is safe to relinquish it now.
+        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
+    }
+}
+
+/// A [`Regulator`] that is known to be enabled.
+///
+/// # Invariants
+///
+/// - [`EnabledRegulator`] is a valid regulator that has been enabled.
+/// - Each instance of [`EnabledRegulator`] is associated with a single count
+///   of [`regulator_enable()`](https://docs.kernel.org/driver-api/regulator.html#c.regulator_enable)
+///   that was obtained from the [`Regulator`] instance once it was enabled.
+pub struct EnabledRegulator {
+    inner: Regulator,
+}
+
+impl EnabledRegulator {
+    fn as_ptr(&self) -> *mut bindings::regulator {
+        self.inner.inner.as_ptr()
+    }
+
+    /// Disables the regulator.
+    pub fn disable(self) -> Result<Regulator> {
+        // Keep the count on `regulator_get()`.
+        let regulator = ManuallyDrop::new(self);
+
+        // SAFETY: Safe as per the type invariants of `Self`.
+        let res = to_result(unsafe { bindings::regulator_disable(regulator.as_ptr()) });
+
+        res.map(|()| Regulator {
+            inner: regulator.inner.inner,
+        })
+    }
+
+    /// Sets the voltage for the regulator.
+    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) -> Result {
+        self.inner.set_voltage(min_uv, max_uv)
+    }
+
+    /// Gets the current voltage of the regulator.
+    pub fn get_voltage(&self) -> Result<Microvolt> {
+        self.inner.get_voltage()
+    }
+}
+
+impl Drop for EnabledRegulator {
+    fn drop(&mut self) {
+        // SAFETY: By the type invariants, we know that `self` owns a reference,
+        // so it is safe to relinquish it now.
+        unsafe { bindings::regulator_disable(self.as_ptr()) };
+    }
+}
+
+/// A voltage in microvolts.
+///
+/// The explicit type is used to avoid confusion with other multiples of the
+/// volt, which can be desastrous.
+#[repr(transparent)]
+#[derive(Copy, Clone, PartialEq, Eq)]
+pub struct Microvolt(pub i32);

---
base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
change-id: 20250326-topics-tyr-regulator-e8b98f6860d7

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

