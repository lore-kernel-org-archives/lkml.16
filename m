Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B81DA55;
	Sun, 18 May 2025 15:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747581124; cv=pass; b=tZE2kNXcuGvY4gY21E/emKc0Fv1UbwOaMUmnd3ODGbZ0ERy7gUQ0REtk/VSSmmOpYi8LGyCb3KL8onsRHU4Jy5NpzegHlUepHpJqA5aaixh9oCig2GcMfYP2TXKiJnwixditiaACVOFkGXVAYHPvpEVMuqk23dFeks5fDABe35A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747581124; c=relaxed/simple;
	bh=wtZ2YMU8abjpMYetEe+5TsQoM/cawwe5xHdXXhaGlCs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f4PmIee7Gg0bsIpUD9It4fpYZC2A1i3tt7lpb2TpGgF5ze/isEjmBC2UX+yN1KH2J6drJ+dl2mWcQABfslxVGZp+7TiI9rsJ/noQe7lEDO7TKJPM08NUgdPGW5quUxMtGATBwnMzxu0ymW3GY5jUvlechp/jUd7SplpjdWXyjDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=aEh4LWUR; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="aEh4LWUR"
ARC-Seal: i=1; a=rsa-sha256; t=1747581101; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nRfiOBZ9R0dDF2S8naoHg1GEm1h6kjl7nEl9Jl0UvObdao8xnri+23yv7JbAL7cF3CtsaoBhQ97OkLJoSbxj9tDnmabHX0MbK67sIR8wV8lz+JDlkYy3jsWnfPgmhICodgtD6Eep8X5ppPDKyn0ILT3JrnYLJ7QIstWq1Z8FXo4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747581101; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XXY39+MoeS1A32UUA1yH/mgShdYRvKucTp+dAjTRYMk=; 
	b=T7UwHKpa9Iv9eYc//Y85tAeQBreYm+fdeaf1WiiDO9QekzCEHKqI3Y8iOgchKBU6ycKhYaeBg6x7s0r0deyo2okhWLieG/16fdHnjwQdbcN3Qr5d3aYtRz/4rcH0XB+eknNeSeLWj0lRKAd37ytmUUkPutwPHnHbZCePxzeb0Pk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747581101;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=XXY39+MoeS1A32UUA1yH/mgShdYRvKucTp+dAjTRYMk=;
	b=aEh4LWURbhEA0JZ9KhETu9zl8OxeZl6cwF0BmvRJZ5OR4E69ASLQhMgZfB/EjlVK
	QIpjQsKEms6VBG4KNITooPCyuv8jYP9BsrV8ZcS71kIRCrmbXi9PqyIVuXDKKpdH/ez
	a74MFFnpNFLsT5dAQMjcxY4AiX7FdRg75EQPoGP4=
Received: by mx.zohomail.com with SMTPS id 1747581099582551.3011890611695;
	Sun, 18 May 2025 08:11:39 -0700 (PDT)
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
In-Reply-To: <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
Date: Sun, 18 May 2025 12:11:23 -0300
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
Message-Id: <498AB71C-58EF-487E-8D9B-C7C113862948@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Alex, thanks for looking at this!

> On 17 May 2025, at 23:28, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> Hi Daniel,
>=20
> On Wed May 14, 2025 at 12:44 AM JST, Daniel Almeida wrote:
>> Add a bare minimum regulator abstraction to be used by Rust drivers.
>> This abstraction adds a small subset of the regulator API, which is
>> thought to be sufficient for the drivers we have now.
>>=20
>> Regulators provide the power needed by many hardware blocks and thus =
are
>> likely to be needed by a lot of drivers.
>>=20
>> It was tested on rk3588, where it was used to power up the "mali"
>> regulator in order to power up the GPU.
>>=20
>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>> ---
>> Changes in v3:
>> - Rebased on rust-next
>> - Added examples to showcase the API
>> - Fixed some rendering issues in the docs
>> - Exposed {get|set}_voltage for both Regulator and EnabledRegulator
>> - Derived Clone, Copy, PartialEq and Eq for Microvolt
>> - Link to v2: =
https://lore.kernel.org/r/20250326-topics-tyr-regulator-v2-1-c0ea6a861be6@=
collabora.com
>>=20
>> Resend v2:
>>  - cc Regulator maintainers
>> Changes from v1:
>>  - Rebased on rust-next
>>  - Split the design into two types as suggested by Alice Ryhl.
>>  - Modify the docs to highlight how users can use =
kernel::types::Either
>>    or an enum to enable and disable the regulator at runtime.
>>  - Link to v1: =
https://lore.kernel.org/rust-for-linux/20250219162517.278362-1-daniel.alme=
ida@collabora.com/
>> ---
>> rust/bindings/bindings_helper.h |   1 +
>> rust/kernel/lib.rs              |   2 +
>> rust/kernel/regulator.rs        | 211 =
++++++++++++++++++++++++++++++++++++++++
>> 3 files changed, 214 insertions(+)
>>=20
>> diff --git a/rust/bindings/bindings_helper.h =
b/rust/bindings/bindings_helper.h
>> index =
ab37e1d35c70d52e69b754bf855bc19911d156d8..e14cce03338ef5f6a09a23fd41ca47b8=
c913fa65 100644
>> --- a/rust/bindings/bindings_helper.h
>> +++ b/rust/bindings/bindings_helper.h
>> @@ -31,6 +31,7 @@
>> #include <linux/poll.h>
>> #include <linux/property.h>
>> #include <linux/refcount.h>
>> +#include <linux/regulator/consumer.h>
>> #include <linux/sched.h>
>> #include <linux/security.h>
>> #include <linux/slab.h>
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index =
28007be98fbad0e875d7e5345e164e2af2c5da32..c8fd7e4e036e9e5b6958acf0dcfa952b=
916a3d48 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -86,6 +86,8 @@
>> pub mod prelude;
>> pub mod print;
>> pub mod rbtree;
>> +#[cfg(CONFIG_REGULATOR)]
>> +pub mod regulator;
>> pub mod revocable;
>> pub mod security;
>> pub mod seq_file;
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
>=20
> Having the enabled or disabled state baked into the type is indeed
> valuable for drivers that just need to acquire and enable a regulator =
at
> probe time. However, there are also more dynamic use cases and I don't
> think the burden of managing this aspect - by either performing a =
manual
> match to call any method (even the shared ones), or implementing =
custom
> dispatch types (which will lead to many similar ad-hoc =
implementations)
> - should fall on the user. Thus I strongly suggest that this module
> provides a solution for this as well.

I am not sure I understand what you mean by =E2=80=9Cdynamic use =
cases=E2=80=9D.

Can you expand a bit on that?

>=20
> It has been proposed earlier to use a typestate, and this would indeed
> provide several benefits, the first one being the ability to have =
shared
> impl blocks (and shared documentation) between the enabled and =
disabled
> states for methods like set/get_voltage().
>=20
> But the key benefit I see is that it could also address the
> aforementioned dynamic management problem through the introduction of =
a
> third state.
>=20
> Alongside the `Enabled` and `Disabled` states, there would be a third
> state (`Dynamic`?) in which the regulator could either be enabled or
> disabled. This `Dynamic` state is the only one providing `enable` and
> `disable` methods (as well as `is_enabled`) to change its operational
> state without affecting its type.

Dynamic is just "Regulator" in the current version of this patch. There =
is no
"Disabled" because there is no guarantee that someone else won't enable =
the
regulator, trivially breaking this invariant at any moment.

The only thing we can guarantee is "Enabled", through our own call to
"regulator_enable()".

In fact, for the typestate solution, I was thinking about "UnknownState" =
and
"Enabled", or any nomenclature along these lines.

>=20
> All three states then implement `set_voltage` and `get_voltage` =
through
> a common impl block, that could be extended with other methods from =
the
> C API that are independent of the state, as needed.
>=20
> To handle typestate transitions:
>=20
> - The `Disabled` and `Dynamic` states provide a `try_into_enabled()`
>  method to transition the regulator to the `Enabled` state.

Why not =E2=80=9Cenable()=E2=80=9D as we currently have?

If we go with the "Dynamic" nomenclature, and we agree that there's no
"Disabled",  then we can implement "pub fn enable(self) -> =
Regulator<Enabled>",
for "Dynamic", which is what we currently have, but with other names.

Also, I personally dislike this term: it's hard to tell what =
Regulator<Dynamic>
means on a first glance.

> - The `Enabled` and `Dynamic` states provide `try_into_disabled()`.
> - `Enabled` and `Disabled` also provide `into_dynamic()` (which cannot
>  fail).
>=20
> Essentially, the `Enabled` and `Disabled` states simply enforce an
> additional operational state invariant on the underlying regulator, =
and
> do not provide methods to change it.
>=20
> The `Dynamic` state would be the default for `Regulator`, so by just
> using `Regulator`, the user gets an interface that works very =
similarly
> to the C API it abstracts, making it intuitive to those familiar with
> it.

This is already how it works: Regulator is the default and =
EnabledRegulator
adds an extra invariant.

>=20
> But for cases where the regulator is known to always be in a specific
> state like `Enabled`, one can use `Regulator<Enabled>` and simplify
> their code.
>=20
> This should retain the compile-time safety that your version proposed
> for common cases, while still exposing the flexibility of the C API =
when
> needed.
>=20

Yeah, I agree.

> <snip>
>> +impl EnabledRegulator {
>> +    fn as_ptr(&self) -> *mut bindings::regulator {
>> +        self.inner.inner.as_ptr()
>> +    }
>> +
>> +    /// Disables the regulator.
>> +    pub fn disable(self) -> Result<Regulator> {
>=20
> This has been mentioned, but I think you will want to return `self` in
> case of failure. Granted, most users won't do anything with it and =
fail,
> but this is allowed by the C API and we shouldn't restrict it.

That is true.

=E2=80=94 Daniel


