Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7908FB672;
	Tue, 13 May 2025 20:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747166471; cv=none; b=vDejtxwf7fBNTpD0wSIj7V4A4Nr4v3ddrwLG8zBLai3U72LJWSBUNjCObeu27p6WVggWR6QSub7tBcjZK7pBprUt7y1iHTdHRzIgpljAaDOOyXVKTjyHvXfTKB12bWGPvZg1dHCbJQRhcx7a7PW7ngx3LUwy65pfB71yKpJ4M+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747166471; c=relaxed/simple;
	bh=J/Ln1rCxUNZn4wx2VeA4kXZwDs79KYnOBQkoQDHvPCw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kfxbtpBkqOBjSWn7dogr878quqqPnhpf0SEzI6C3hmqrYoXxWxNXoVZnbaoQ4s+P3WDM2RvvFHvnE66FV1CnXwGE9JDQMCr4hAlJIgT+kYVCqzJwRPtckbuvDI5sjkS49iiA4WjUcEa0uYjtOAO5+mY/VZFpPh0/pCNZmHAd9uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asxJi18G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asxJi18G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6E66C4CEE4;
	Tue, 13 May 2025 20:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747166470;
	bh=J/Ln1rCxUNZn4wx2VeA4kXZwDs79KYnOBQkoQDHvPCw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=asxJi18G2UGx577cdwdm0AOhuPcFEK00mpbkMzLANX9L4i4bWKo1SS02qFVlrDfME
	 1iM1qErv4dHvNBmOQWp7CKEHW9z9tfZ7vT/rKB342UV959q3alzbu0IRMceQ22Zv3U
	 o2vEfzJLF+HM2g5K0gEMGIhwT73eREL73CkuIwGbPAtIwoshEycilesc+ayI4l6abJ
	 5Zh7FkXM0lmllS+vsxkgS33sefMvOFuJjP5/+1Ct6jBtg1T4arf3F5/1Q2mtPbMdEh
	 agOohrWdKvNsd/lu4ZDNAo0gFmjZitt8VURay9pBZEIv5ksqE3f1v7xxf+2xneyHOn
	 3CDqTS/GwJFGA==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 May 2025 22:01:05 +0200
Message-Id: <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Benno Lossin" <lossin@kernel.org>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
In-Reply-To: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>

On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e9b=
0f90830d5291ab9
> --- /dev/null
> +++ b/rust/kernel/regulator.rs
> @@ -0,0 +1,211 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Regulator abstractions, providing a standard kernel interface to con=
trol
> +//! voltage and current regulators.
> +//!
> +//! The intention is to allow systems to dynamically control regulator p=
ower
> +//! output in order to save power and prolong battery life. This applies=
 to both
> +//! voltage regulators (where voltage output is controllable) and curren=
t sinks
> +//! (where current limit is controllable).
> +//!
> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/lin=
ux/regulator/consumer.h)
> +//!
> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
> +//! [`EnabledRegulator`].

Would it make sense to store this in a generic variable acting as a type
state instead of using two different names? So:

    pub struct Regulator<State: RegulatorState> { /* ... */ }

    pub trait RegulatorState: private::Sealed {}

    pub struct Enabled;
    pub struct Disabled;

    impl RegulatorState for Enabled {}
    impl RegulatorState for Disabled {}

And then one would use `Regulator<Enabled>` and `Regulator<Disabled>`.

> +//!
> +//! The transition between these types is done by calling
> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] respecti=
vely.
> +//!
> +//! Use an enum or [`kernel::types::Either`] to gracefully transition be=
tween
> +//! the two states at runtime if needed. Store [`EnabledRegulator`] dire=
ctly
> +//! otherwise.
> +//!
> +//! See [`Voltage and current regulator API`]("https://docs.kernel.org/d=
river-api/regulator.html")
> +//! for more information.
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::{from_err_ptr, to_result, Result},
> +    prelude::*,
> +};
> +
> +use core::{mem::ManuallyDrop, ptr::NonNull};
> +
> +/// A `struct regulator` abstraction.
> +///
> +/// # Examples
> +///
> +/// Enabling a regulator:
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, EnabledRegulator};
> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Res=
ult {
> +///    // Obtain a reference to a (fictitious) regulator.
> +///    let regulator: Regulator =3D Regulator::get(dev, c_str!("vcc"))?;
> +///
> +///    // The voltage can be set before enabling the regulator if needed=
, e.g.:
> +///    regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///    // The same applies for `get_voltage()`, i.e.:
> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///    // Enables the regulator, consuming the previous value.
> +///    //
> +///    // From now on, the regulator is known to be enabled because of t=
he type
> +///    // `EnabledRegulator`.
> +///    let regulator: EnabledRegulator =3D regulator.enable()?;
> +///
> +///    // The voltage can also be set after enabling the regulator, e.g.=
:
> +///    regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///    // The same applies for `get_voltage()`, i.e.:
> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///    // Dropping an enabled regulator will disable it. The refcount wi=
ll be
> +///    // decremented.

Where would you normally store an enabled regulator to keep it alive?
Maybe adjust the example to do just that?

> +///    drop(regulator);
> +///    // ...
> +///    # Ok::<(), Error>(())
> +/// }
> +///```
> +///
> +/// Disabling a regulator:
> +///
> +///```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, EnabledRegulator};
> +/// fn disable(dev: &Device, regulator: EnabledRegulator) -> Result {
> +///    // We can also disable an enabled regulator without reliquinshing=
 our
> +///    // refcount:
> +///    let regulator: Regulator =3D regulator.disable()?;
> +///
> +///    // The refcount will be decremented when `regulator` is dropped.
> +///    drop(regulator);
> +///    // ...
> +///    # Ok::<(), Error>(())
> +/// }
> +/// ```
> +///
> +/// # Invariants
> +///
> +/// - [`Regulator`] is a non-null wrapper over a pointer to a `struct
> +///   regulator` obtained from [`regulator_get()`](https://docs.kernel.o=
rg/driver-api/regulator.html#c.regulator_get).

This should be "`inner` is a pointer obtained from
[`regulator_get()`](...)".

> +/// - Each instance of [`Regulator`] is associated with a single count o=
f
> +///   [`regulator_get()`](https://docs.kernel.org/driver-api/regulator.h=
tml#c.regulator_get).

This is redundant, so we should remove it.

> +pub struct Regulator {
> +    inner: NonNull<bindings::regulator>,
> +}
> +
> +impl Regulator {
> +    /// Obtains a [`Regulator`] instance from the system.
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        // SAFETY: It is safe to call `regulator_get()`, on a device poi=
nter
> +        // received from the C code.
> +        let inner =3D from_err_ptr(unsafe { bindings::regulator_get(dev.=
as_raw(), name.as_ptr()) })?;
> +
> +        // SAFETY: We can safely trust `inner` to be a pointer to a vali=
d
> +        // regulator if `ERR_PTR` was not returned.
> +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> +
> +        Ok(Self { inner })
> +    }
> +
> +    /// Enables the regulator.
> +    pub fn enable(self) -> Result<EnabledRegulator> {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        let res =3D to_result(unsafe { bindings::regulator_enable(self.i=
nner.as_ptr()) });
> +        res.map(|()| EnabledRegulator { inner: self })
> +    }
> +
> +    /// Sets the voltage for the regulator.
> +    ///
> +    /// This can be used to ensure that the device powers up cleanly.
> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) -> R=
esult {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        to_result(unsafe {
> +            bindings::regulator_set_voltage(self.inner.as_ptr(), min_uv.=
0, max_uv.0)
> +        })
> +    }
> +
> +    /// Gets the current voltage of the regulator.
> +    pub fn get_voltage(&self) -> Result<Microvolt> {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        let voltage =3D unsafe { bindings::regulator_get_voltage(self.in=
ner.as_ptr()) };
> +        if voltage < 0 {
> +            Err(Error::from_errno(voltage))
> +        } else {
> +            Ok(Microvolt(voltage))
> +        }
> +    }
> +}
> +
> +impl Drop for Regulator {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a re=
ference,
> +        // so it is safe to relinquish it now.
> +        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
> +    }
> +}
> +
> +/// A [`Regulator`] that is known to be enabled.
> +///
> +/// # Invariants
> +///
> +/// - [`EnabledRegulator`] is a valid regulator that has been enabled.

This isn't fully clear what it's supposed to mean to me. Maybe mention
the `regulator_enable` function?

> +/// - Each instance of [`EnabledRegulator`] is associated with a single =
count
> +///   of [`regulator_enable()`](https://docs.kernel.org/driver-api/regul=
ator.html#c.regulator_enable)
> +///   that was obtained from the [`Regulator`] instance once it was enab=
led.

Ah I see you mention it here, then what is the bullet point above about?

Also, please refer to `inner` instead of [`EnabledRegulator`].

> +pub struct EnabledRegulator {
> +    inner: Regulator,
> +}
> +
> +impl EnabledRegulator {
> +    fn as_ptr(&self) -> *mut bindings::regulator {
> +        self.inner.inner.as_ptr()
> +    }
> +
> +    /// Disables the regulator.
> +    pub fn disable(self) -> Result<Regulator> {
> +        // Keep the count on `regulator_get()`.
> +        let regulator =3D ManuallyDrop::new(self);

Why don't we drop the refcount if the `regulator_disable` call fails?

> +
> +        // SAFETY: Safe as per the type invariants of `Self`.
> +        let res =3D to_result(unsafe { bindings::regulator_disable(regul=
ator.as_ptr()) });
> +
> +        res.map(|()| Regulator {
> +            inner: regulator.inner.inner,
> +        })
> +    }
> +
> +    /// Sets the voltage for the regulator.
> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) -> R=
esult {
> +        self.inner.set_voltage(min_uv, max_uv)
> +    }
> +
> +    /// Gets the current voltage of the regulator.
> +    pub fn get_voltage(&self) -> Result<Microvolt> {
> +        self.inner.get_voltage()
> +    }
> +}
> +
> +impl Drop for EnabledRegulator {
> +    fn drop(&mut self) {
> +        // SAFETY: By the type invariants, we know that `self` owns a re=
ference,
> +        // so it is safe to relinquish it now.
> +        unsafe { bindings::regulator_disable(self.as_ptr()) };

Same here, what happens to the refcount?

---
Cheers,
Benno

> +    }
> +}
> +
> +/// A voltage in microvolts.
> +///
> +/// The explicit type is used to avoid confusion with other multiples of=
 the
> +/// volt, which can be desastrous.
> +#[repr(transparent)]
> +#[derive(Copy, Clone, PartialEq, Eq)]
> +pub struct Microvolt(pub i32);
>
> ---
> base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
> change-id: 20250326-topics-tyr-regulator-e8b98f6860d7
>
> Best regards,

