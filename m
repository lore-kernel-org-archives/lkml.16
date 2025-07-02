Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0F3275AFF;
	Wed,  2 Jul 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462085; cv=pass; b=eCKMPZlA+EaZvJiQg0zt4IMxiQSED9niH/QCKBt4Q6xL7MTRJ4Llr3K05Px/OYANhmX+tUgQzvemBjFsDSpm8+6vtlARmMj1ht1A+c/SrCMGbZh/J51pFj1QZHgvxgHxiRbq3p5ZvyNRiQuWO0pzmcW0U7CGkTcfL1AAvfZ+jS0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462085; c=relaxed/simple;
	bh=ZDkq31mV+uhs8Uuyx642C5Fpj1d+m5wEOZRDd4QkaEw=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hZKOnV+TwuVCwKnXB3KYMen1THX3RddFuBeauBHXK3LMMZ5qzOIJYeGyKchcHwMY9jWJZg83Eim6p/JRGkfIxjR5l3/AsVVb5JlMkfR3xyp0TrlLnZsOMEIE9LpkLbo1zZJJ0AzdgKfjIEWeCAhz8r581+GFbujZRivFDyoXGPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=FcvHW1+q; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="FcvHW1+q"
ARC-Seal: i=1; a=rsa-sha256; t=1751462063; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iFbSwsqhBq4otegwQvzoqZyVGvcdPzxgFMjb6bFPdZejdHH3cYY+gJ3tTpSiMFjQf2hjroON1zAMUPSJdgEt841nVxf7M4gU2t39XFgMrMhIOUVJvbPlBiHWERfp1OO0gRXE/rp9Ars73I1IrHRqq+D7SbumD9q+gnElF8crjTM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751462063; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0kWiHd1qdcCThaYd52BxxMVESal++GotlrEBuaZtyTM=; 
	b=TsGFs8xpYKSXsZWuExsySZPAs8CwwpaLOJpng9ry5Tc6BlV7xa19Oy6KKGPg86JWI0mXMI95Muco9ekQk1zdiUVj807wuHCV+4rJHWdwZxAfyVrhiczb3YFMMh31v6X7BNZEvTI4X4CrHbsMEgbV8NHk7QqvV2bJaWwXent38IQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751462063;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=0kWiHd1qdcCThaYd52BxxMVESal++GotlrEBuaZtyTM=;
	b=FcvHW1+q1t7ckCOg8MdYfRkE56KyDnsJCf+jD5k9ut0l6dOglS9qCFYlpHnqW09B
	O5ETE/51fQ72dO1D87oyanUSq1U7aNxMwGtSWDbnnJ+iGiWxSrdx8Mn8y37/wX+ssuT
	KJflbKxwJ56WHigsyr5yn6WURm/Xlr11A/erw+0s=
Received: by mx.zohomail.com with SMTPS id 1751462060902807.575235946391;
	Wed, 2 Jul 2025 06:14:20 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6 1/2] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CAH5fLgg1-K6x0wRO79mt4fGvJeNanr9Km75=1Z9G0gy-WbeU2g@mail.gmail.com>
Date: Wed, 2 Jul 2025 10:14:04 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <0FD01582-58D1-4DC2-89DB-A4C8771F7750@collabora.com>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
 <CAH5fLgj_eKuo=E7HPgmd1bJNfidGUS37MM1QqRaQ_MJ2kTgCmg@mail.gmail.com>
 <1DFECD1D-9445-4D59-A727-37C527B5DFF5@collabora.com>
 <CAH5fLgg1-K6x0wRO79mt4fGvJeNanr9Km75=1Z9G0gy-WbeU2g@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External


>=20
>>>> +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
>>>> +    fn drop(&mut self) {
>>>> +        if core::any::TypeId::of::<T>() =3D=3D =
core::any::TypeId::of::<Enabled>() {
>>>=20
>>> I would avoid this kind of logic. Instead, you can add an
>>> `disable_on_drop()` method or constant to the trait and check it =
here.
>>>=20
>>> Alice
>>>=20
>>=20
>> Can you expand on this?
>=20
> Along these lines:
>=20
> pub trait RegulatorState: 'static {
>    const DISABLE_ON_DROP: bool;
> }
>=20
> impl RegulatorState for Enabled {
>    const DISABLE_ON_DROP: bool =3D true;
> }
> impl RegulatorState for Disabled {
>    const DISABLE_ON_DROP: bool =3D false;
> }
> impl RegulatorState for Dynamic {
>    const DISABLE_ON_DROP: bool =3D false;
> }
>=20
> impl<T: RegulatorState> Drop for Regulator<T> {
>    fn drop(&mut self) {
>        if T::DISABLE_ON_DROP {
>            unsafe { bindings::regulator_disable(self.inner.as_ptr()) =
};
>        }
>        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
>    }
> }

Ah, that indeed looks better, thanks.

=E2=80=94 Daniel


