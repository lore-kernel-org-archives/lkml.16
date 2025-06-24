Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5238D29E0E6;
	Tue, 24 Jun 2025 19:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750793449; cv=none; b=kxliRNsYbsUREdw5EwrapDJ+f1QqMuCfZmfqP3W2EHahold31jr7lNn1j13LGB745LufbPmrlwAahM4e60qwX4uaYrObgb6Ad2oH/nPA3a03fCqDAATndX8FCGruIq3jLZM02ig+QNf+M254AIHdpqabqISLUWajmn4l9yO9C8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750793449; c=relaxed/simple;
	bh=Qp571uapnnFBFDqcHgQJKSYw6G8t5M3Gr0gR6Fk0TTk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=EkD+vVZotPj0VYHsLE4zTrYdlvOLUtswoW5sSXqWQNtvgXeuDY63+olr9ceHerLveI5GnFoL0kYv5nRlUM/lbez9psXTWC/AF81I2XjQncQXEX0lx94Xr7Tn7ZmZBrMDYyk0R1jK+mCAO2S2NLkEs8oEqADvRS6qq4+lnTMLAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mcuSwWV/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mcuSwWV/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD43FC4CEE3;
	Tue, 24 Jun 2025 19:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750793448;
	bh=Qp571uapnnFBFDqcHgQJKSYw6G8t5M3Gr0gR6Fk0TTk=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=mcuSwWV/L+sQMMr/zxlwNaOcO6gU+Bh6G4VhIEtmTfO5j9TYyV8S5SFRxc2M5Uk8V
	 qQMWzk1Ckr/n4pUBpksOqZq37+0FgADWSsX1FDCkD9R7HvDqXD5TXrsYkPMCP3GtXd
	 53XTMhHpO1EcB+6coc5l0iIlNIWmQd8LgAwUZZ7CbIizf5ulJu1ZqahvfFKbjMizH7
	 //rurPBDnShlwk0hj2KNZDudju5sv6dvL3t9NP8CeOJW2y6nukAgJDhHsGtC7fG0Dy
	 p5skh8uv+ojS0eu2E1KLyEl+2Ir9GjUeZjLPBlSjmOS7ZVsfsNbixUzr54YSJzPilR
	 VSqLfgCGbfdHQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jun 2025 21:30:42 +0200
Message-Id: <DAV0H83BZO0K.376YKJOOGL48H@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v5 1/2] rust: regulator: add a bare minimum regulator
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
X-Mailer: aerc 0.20.1
References: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
 <20250623-topics-tyr-regulator-v5-1-99069658cb54@collabora.com>
 <63C9EBE0-771F-411E-93E0-B22DFDCB960D@collabora.com>
In-Reply-To: <63C9EBE0-771F-411E-93E0-B22DFDCB960D@collabora.com>

On Tue Jun 24, 2025 at 7:31 PM CEST, Daniel Almeida wrote:
> Hi,
>
>> +    /// Attempts to convert the regulator to an enabled state.
>> +    pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, Err=
or<Disabled>> {
>> +        self.enable_internal()
>> +            .map(|()| Regulator {
>> +                inner: self.inner,
>> +                _phantom: PhantomData,
>> +            })
>> +            .map_err(|error| Error {
>> +                error,
>> +                regulator: self,
>> +            })
>> +    }
>> +}
>> +
>> +impl Regulator<Enabled> {
>> +    /// Obtains a [`Regulator`] instance from the system and enables it=
.
>> +    ///
>> +    /// This is equivalent to calling `regulator_get_enable()` in the C=
 API.
>> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
>> +        Regulator::<Disabled>::get_internal(dev, name)?
>> +            .try_into_enabled()
>> +            .map_err(|error| error.error)
>> +    }
>
> I just realized that this is a bug.
>
> The pre-typestate code was using ManuallyDrop<T> here, and it was forgott=
en on
> the newer versions. This means that the destructor for self runs here, wh=
ich
> decreases the refcount by calling regulator_put().

Yeah that is correct.

> My proposed solution is:
>
>     /// Attempts to convert the regulator to an enabled state.
>     pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, Error=
<Disabled>> {
>         // We will be transferring the ownership of our regulator_get() c=
ount to Regulator<Enabled>
>         let mut regulator =3D ManuallyDrop::new(self);
>
>         regulator.enable_internal()
>             .map(|()| Regulator {
>                 inner: regulator.inner,

This will only work if the type of `inner` implements `Copy`. I forgot
if it does.

>                 _phantom: PhantomData,
>             })
>             .map_err(|error| Error {
>                 error,
>                 regulator: ManuallyDrop::into_inner(regulator),
>             })
>     }
> }
>
>
>
> Alex, Benno, thoughts?

Looks correct.

---
Cheers,
Benno
