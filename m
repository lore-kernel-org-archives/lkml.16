Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE7C270EA4;
	Wed, 14 May 2025 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747227733; cv=pass; b=UGXL5mKllN030NOQVVq45bqHl9JYxQlHU4TypbqsXqDKzJN26zNW4dZDcTd1kh9BSmsTqo5jHwGRMa9AYZLwUfKMlChXYmwexb5+v6fTmW4LVdzrdbz1gG78inXx3rFMPcThq1BROxssoOPfYAqiXDCg+IsnEdCZYSLSHiA6zzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747227733; c=relaxed/simple;
	bh=p9r6O331AJ4r4Wcqa6M7x5SSQV7iiv/+EHtBdWNXFF8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=djwecCaTO6Njfr0bIAFFZmkF+iqpPihhIPriICIXcHEd1tw+MVvdB4ylsEH/2GKuum0Fe7hVkxitSqgo5/SED1k7PfbiVHs7GNuY5J/yD9kSVpQSPJL3dUG2hkYCQfA98R1hEEurxdHeOFkuog/yeTmO0y/g87S114WPkO7RKko=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Y0fl0BTa; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Y0fl0BTa"
ARC-Seal: i=1; a=rsa-sha256; t=1747227704; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TNyqrLGMcOdUGQ2l7W5ki+10cDGAPpmnGXSQOsg4Xoi3o+mE8KMavTT7fraX57+dpc2q7wl2E4IbJmsXaVJ1UM02qqX8YntoJey/Wwjw4fTjWegBpqyQ0oBDIFKqbYcejxFWpqUmL1BBa13iCZ7JfTcOUcJnVf1XHf3Ijcl3vqI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747227704; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=twf4ykxCP/D3c5PBMNSbJYpzis0uKSfZP5jGEGEcUc0=; 
	b=bE6iuzrWGphfsq56PwomvpZI8VhzPsDNOsNaf6edxz3G3iOyXPG03Zv7ZIGhm8v1osBqMHUDipx6E5BKkKdFJqPppaecJ2KD/cuzDRsKv2clMMMv9w/I26jQClHl/bhFjxStFk/1Ahe1/ZfnIjO4Ez9cuIjduZf+hHN2EzvyKD4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747227704;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=twf4ykxCP/D3c5PBMNSbJYpzis0uKSfZP5jGEGEcUc0=;
	b=Y0fl0BTacjFnLO6o9pZ4iWd9ynzuN1+XIninAQMcj9YHUJjC3YAFfY3GqapbnDkI
	iYssKiXDDBQ82+fMgvEfx+sh0QrcUT/vjOy9sA4O5OFJpf7maNfqsiQLdK0U5cHjKMW
	A3bxluLR9Xg0IlL/I7gZGbL1JbMviDpiFRcoliYQ=
Received: by mx.zohomail.com with SMTPS id 17472277023271020.7864144501841;
	Wed, 14 May 2025 06:01:42 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
Date: Wed, 14 May 2025 10:01:26 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Benno,

> On 13 May 2025, at 17:01, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Tue May 13, 2025 at 5:44 PM CEST, Daniel Almeida wrote:
>> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
>> new file mode 100644
>> index =
0000000000000000000000000000000000000000..7b07b64f61fdd4a84ffb38e9b0f90830=
d5291ab9
>> --- /dev/null
>> +++ b/rust/kernel/regulator.rs
>> @@ -0,0 +1,211 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Regulator abstractions, providing a standard kernel interface to =
control
>> +//! voltage and current regulators.
>> +//!
>> +//! The intention is to allow systems to dynamically control =
regulator power
>> +//! output in order to save power and prolong battery life. This =
applies to both
>> +//! voltage regulators (where voltage output is controllable) and =
current sinks
>> +//! (where current limit is controllable).
>> +//!
>> +//! C header: =
[`include/linux/regulator/consumer.h`](srctree/include/linux/regulator/con=
sumer.h)
>> +//!
>> +//! Regulators are modeled in Rust with two types: [`Regulator`] and
>> +//! [`EnabledRegulator`].
>=20
> Would it make sense to store this in a generic variable acting as a =
type
> state instead of using two different names? So:
>=20
>    pub struct Regulator<State: RegulatorState> { /* ... */ }
>=20
>    pub trait RegulatorState: private::Sealed {}
>=20
>    pub struct Enabled;
>    pub struct Disabled;
>=20
>    impl RegulatorState for Enabled {}
>    impl RegulatorState for Disabled {}
>=20
> And then one would use `Regulator<Enabled>` and `Regulator<Disabled>`.

This seems like just another way of doing the same thing.

I have nothing against a typestate, it's an elegant solution really, but =
so is
the current one. I'd say let's keep what we have unless there is =
something
objectively better about a typestatethat makes it worthy to change this.

>=20
>> +//!
>> +//! The transition between these types is done by calling
>> +//! [`Regulator::enable()`] and [`EnabledRegulator::disable()`] =
respectively.
>> +//!
>> +//! Use an enum or [`kernel::types::Either`] to gracefully =
transition between
>> +//! the two states at runtime if needed. Store [`EnabledRegulator`] =
directly
>> +//! otherwise.
>> +//!
>> +//! See [`Voltage and current regulator =
API`]("https://docs.kernel.org/driver-api/regulator.html")
>> +//! for more information.
>> +
>> +use crate::{
>> +    bindings,
>> +    device::Device,
>> +    error::{from_err_ptr, to_result, Result},
>> +    prelude::*,
>> +};
>> +
>> +use core::{mem::ManuallyDrop, ptr::NonNull};
>> +
>> +/// A `struct regulator` abstraction.
>> +///
>> +/// # Examples
>> +///
>> +/// Enabling a regulator:
>> +///
>> +/// ```
>> +/// # use kernel::prelude::*;
>> +/// # use kernel::c_str;
>> +/// # use kernel::device::Device;
>> +/// # use kernel::regulator::{Microvolt, Regulator, =
EnabledRegulator};
>> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> =
Result {
>> +///    // Obtain a reference to a (fictitious) regulator.
>> +///    let regulator: Regulator =3D Regulator::get(dev, =
c_str!("vcc"))?;
>> +///
>> +///    // The voltage can be set before enabling the regulator if =
needed, e.g.:
>> +///    regulator.set_voltage(min_uv, max_uv)?;
>> +///
>> +///    // The same applies for `get_voltage()`, i.e.:
>> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
>> +///
>> +///    // Enables the regulator, consuming the previous value.
>> +///    //
>> +///    // =46rom now on, the regulator is known to be enabled =
because of the type
>> +///    // `EnabledRegulator`.
>> +///    let regulator: EnabledRegulator =3D regulator.enable()?;
>> +///
>> +///    // The voltage can also be set after enabling the regulator, =
e.g.:
>> +///    regulator.set_voltage(min_uv, max_uv)?;
>> +///
>> +///    // The same applies for `get_voltage()`, i.e.:
>> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
>> +///
>> +///    // Dropping an enabled regulator will disable it. The =
refcount will be
>> +///    // decremented.
>=20
> Where would you normally store an enabled regulator to keep it alive?
> Maybe adjust the example to do just that?

In your driver=E2=80=99s private data.

>=20
>> +///    drop(regulator);
>> +///    // ...
>> +///    # Ok::<(), Error>(())
>> +/// }
>> +///```
>> +///
>> +/// Disabling a regulator:
>> +///
>> +///```
>> +/// # use kernel::prelude::*;
>> +/// # use kernel::c_str;
>> +/// # use kernel::device::Device;
>> +/// # use kernel::regulator::{Microvolt, Regulator, =
EnabledRegulator};
>> +/// fn disable(dev: &Device, regulator: EnabledRegulator) -> Result =
{
>> +///    // We can also disable an enabled regulator without =
reliquinshing our
>> +///    // refcount:
>> +///    let regulator: Regulator =3D regulator.disable()?;
>> +///
>> +///    // The refcount will be decremented when `regulator` is =
dropped.
>> +///    drop(regulator);
>> +///    // ...
>> +///    # Ok::<(), Error>(())
>> +/// }
>> +/// ```
>> +///
>> +/// # Invariants
>> +///
>> +/// - [`Regulator`] is a non-null wrapper over a pointer to a =
`struct
>> +///   regulator` obtained from =
[`regulator_get()`](https://docs.kernel.org/driver-api/regulator.html#c.re=
gulator_get).
>=20
> This should be "`inner` is a pointer obtained from
> [`regulator_get()`](...)".
>=20
>> +/// - Each instance of [`Regulator`] is associated with a single =
count of
>> +///   =
[`regulator_get()`](https://docs.kernel.org/driver-api/regulator.html#c.re=
gulator_get).
>=20
> This is redundant, so we should remove it.

Why is this redundant? It says that we are associated with a *single* =
refcount.

>=20
>> +pub struct Regulator {
>> +    inner: NonNull<bindings::regulator>,
>> +}
>> +
>> +impl Regulator {
>> +    /// Obtains a [`Regulator`] instance from the system.
>> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
>> +        // SAFETY: It is safe to call `regulator_get()`, on a device =
pointer
>> +        // received from the C code.
>> +        let inner =3D from_err_ptr(unsafe { =
bindings::regulator_get(dev.as_raw(), name.as_ptr()) })?;
>> +
>> +        // SAFETY: We can safely trust `inner` to be a pointer to a =
valid
>> +        // regulator if `ERR_PTR` was not returned.
>> +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
>> +
>> +        Ok(Self { inner })
>> +    }
>> +
>> +    /// Enables the regulator.
>> +    pub fn enable(self) -> Result<EnabledRegulator> {
>> +        // SAFETY: Safe as per the type invariants of `Regulator`.
>> +        let res =3D to_result(unsafe { =
bindings::regulator_enable(self.inner.as_ptr()) });
>> +        res.map(|()| EnabledRegulator { inner: self })
>> +    }
>> +
>> +    /// Sets the voltage for the regulator.
>> +    ///
>> +    /// This can be used to ensure that the device powers up =
cleanly.
>> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) =
-> Result {
>> +        // SAFETY: Safe as per the type invariants of `Regulator`.
>> +        to_result(unsafe {
>> +            bindings::regulator_set_voltage(self.inner.as_ptr(), =
min_uv.0, max_uv.0)
>> +        })
>> +    }
>> +
>> +    /// Gets the current voltage of the regulator.
>> +    pub fn get_voltage(&self) -> Result<Microvolt> {
>> +        // SAFETY: Safe as per the type invariants of `Regulator`.
>> +        let voltage =3D unsafe { =
bindings::regulator_get_voltage(self.inner.as_ptr()) };
>> +        if voltage < 0 {
>> +            Err(Error::from_errno(voltage))
>> +        } else {
>> +            Ok(Microvolt(voltage))
>> +        }
>> +    }
>> +}
>> +
>> +impl Drop for Regulator {
>> +    fn drop(&mut self) {
>> +        // SAFETY: By the type invariants, we know that `self` owns =
a reference,
>> +        // so it is safe to relinquish it now.
>> +        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
>> +    }
>> +}
>> +
>> +/// A [`Regulator`] that is known to be enabled.
>> +///
>> +/// # Invariants
>> +///
>> +/// - [`EnabledRegulator`] is a valid regulator that has been =
enabled.
>=20
> This isn't fully clear what it's supposed to mean to me. Maybe mention
> the `regulator_enable` function?
>=20
>> +/// - Each instance of [`EnabledRegulator`] is associated with a =
single count
>> +///   of =
[`regulator_enable()`](https://docs.kernel.org/driver-api/regulator.html#c=
.regulator_enable)
>> +///   that was obtained from the [`Regulator`] instance once it was =
enabled.
>=20
> Ah I see you mention it here, then what is the bullet point above =
about?

Again, the word _single_ is what is important here.

>=20
> Also, please refer to `inner` instead of [`EnabledRegulator`].
>=20
>> +pub struct EnabledRegulator {
>> +    inner: Regulator,
>> +}
>> +
>> +impl EnabledRegulator {
>> +    fn as_ptr(&self) -> *mut bindings::regulator {
>> +        self.inner.inner.as_ptr()
>> +    }
>> +
>> +    /// Disables the regulator.
>> +    pub fn disable(self) -> Result<Regulator> {
>> +        // Keep the count on `regulator_get()`.
>> +        let regulator =3D ManuallyDrop::new(self);
>=20
> Why don't we drop the refcount if the `regulator_disable` call fails?

I am operating under the assumption that regulator_enable() and
regulator_disable() do not touch the reference count. Note that we do =
not
acquire a new reference when we build EnabledRegulator in =
Regulator::enable(),
we merely move our instance of Regulator into EnabledRegulator.

disable() takes EnabledRegulator by value in order to convert it to =
Regulator.
If we let the destructor run, that will decrement the refcount as it =
calls
inner.drop(), so that is why the ManuallyDrop is there in the first =
place. =20

Now if disable() fails, perhaps we should somehow return `self` to the =
caller.
That would let them retry the operation, even if it's unlikely to be of =
any
help, as Mark said. In this sense, I agree that there is a leak that I
overlooked.

On a second note, Benno, do you have a clean way to return both =
kernel::Error
and `self` here? I assume that introducing a separate error type just =
for this
function is overkill.


>> +
>> +        // SAFETY: Safe as per the type invariants of `Self`.
>> +        let res =3D to_result(unsafe { =
bindings::regulator_disable(regulator.as_ptr()) });
>> +
>> +        res.map(|()| Regulator {
>> +            inner: regulator.inner.inner,
>> +        })
>> +    }
>> +
>> +    /// Sets the voltage for the regulator.
>> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) =
-> Result {
>> +        self.inner.set_voltage(min_uv, max_uv)
>> +    }
>> +
>> +    /// Gets the current voltage of the regulator.
>> +    pub fn get_voltage(&self) -> Result<Microvolt> {
>> +        self.inner.get_voltage()
>> +    }
>> +}
>> +
>> +impl Drop for EnabledRegulator {
>> +    fn drop(&mut self) {
>> +        // SAFETY: By the type invariants, we know that `self` owns =
a reference,
>> +        // so it is safe to relinquish it now.
>> +        unsafe { bindings::regulator_disable(self.as_ptr()) };
>=20
> Same here, what happens to the refcount?

It remains the same, we never acquired one when we enabled, so we are =
relying
on inner.drop() to decrement it.

>=20
> ---
> Cheers,
> Benno
>=20
>> +    }
>> +}
>> +
>> +/// A voltage in microvolts.
>> +///
>> +/// The explicit type is used to avoid confusion with other =
multiples of the
>> +/// volt, which can be desastrous.
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, PartialEq, Eq)]
>> +pub struct Microvolt(pub i32);
>>=20
>> ---
>> base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
>> change-id: 20250326-topics-tyr-regulator-e8b98f6860d7
>>=20
>> Best regards,
>=20
>=20


=E2=80=94 Daniel

