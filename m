Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D456A55;
	Wed,  2 Jul 2025 13:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751461428; cv=pass; b=aW8Z4wnnFWswtZWP+vX2zyzHpF0LHBWI2HYNwHoANbteWLIrE7n/fyoys5gwx9JmaTCO+mTc7rc1BspOgxp170u0zFqsmYtZtJv3TP57RKTxco/fGLUcbgveYzZaIiyq7c7kdg5JbwAN/X6WD0XNPUtK9DTrr2F0heX7iM9ddQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751461428; c=relaxed/simple;
	bh=vOCYCvkAhXAcixMZrU83lNCfy99zM7lOFMnQrE1/j+8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=f3lMIQa3PuBLMqpcN3DQn+Vv4OggrAvNbGb0TYkDn2ZPmLzxwAxlfvt7NR3mNw75EES3Fve+wr02BzGAs+8OpfOsMr3tMm2K72f/YOglHEPiK+2MmUet9/JLHejFd7pb36J2WJgnxdQyYS4GCBM6t6CcP0j5VEWVpH8rRFsbEYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dStIQqI9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dStIQqI9"
ARC-Seal: i=1; a=rsa-sha256; t=1751461407; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J7FJsSTGq2NrBJWkpuLvwJduoDsBGXL0sr6rNsg/KX6QQRql7ZAkQlrnIEVUZPcZ0/PEjCjT1k8Cp5VgXlm2HpYOxh+KI2QSCMJs2EuU3u2bXDTVHRP9QDxgIbzrwHM8K5jZudvyYrU+B4CWmoYuylirsRJA0uwxNR4MDYAtCqk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751461407; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=byRuEdbt3yBp4cJY83tL1v8nZ7RW6HbIN82zNgWJ2EE=; 
	b=BAL2xJf6JVgp09oGwwNtGgYdIRTBtXn83nJNiFQBzSNqb6wOi52T5MALECUAXknVKuXpgATN6Ivdzipy8OhfXCJ8yN3qo7Ex4lDJvGoECvghtIaSvJn6n6V27p4PuBWmk+ipeWHT66/IW9QBXG22Ng8cyz2kqgZv0QmgwJ9XFPo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751461407;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=byRuEdbt3yBp4cJY83tL1v8nZ7RW6HbIN82zNgWJ2EE=;
	b=dStIQqI96/PkjZx4dU21WmrCKtRgm3UH6T0i5m+VJ5ai9M1DMJHBU8+IixVky7Bt
	VCeJ6z95xoMX066Q+UPs1gmRD08uexsOoFf8gUQtcHMFqBzIXgrNWt5wLF/pwFDgZAm
	e2Jb0Mrex3lq0w13By7uitaf9gdST3G0ypVdyUZU=
Received: by mx.zohomail.com with SMTPS id 17514614054171015.6028273805258;
	Wed, 2 Jul 2025 06:03:25 -0700 (PDT)
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
In-Reply-To: <CAH5fLgj_eKuo=E7HPgmd1bJNfidGUS37MM1QqRaQ_MJ2kTgCmg@mail.gmail.com>
Date: Wed, 2 Jul 2025 10:03:08 -0300
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
Message-Id: <1DFECD1D-9445-4D59-A727-37C527B5DFF5@collabora.com>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
 <20250627-topics-tyr-regulator-v6-1-1d015219b454@collabora.com>
 <CAH5fLgj_eKuo=E7HPgmd1bJNfidGUS37MM1QqRaQ_MJ2kTgCmg@mail.gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Alice,

> On 2 Jul 2025, at 07:35, Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> On Fri, Jun 27, 2025 at 7:11=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
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
>=20
> Overall looks reasonable to me.
>=20
>> +/// A trait that abstracts the ability to check if a [`Regulator`] =
is enabled.
>> +pub trait IsEnabled: RegulatorState {}
>> +impl IsEnabled for Disabled {}
>> +impl IsEnabled for Dynamic {}
>=20
> Naming-wise, it's a bit weird that IsEnabled applies to everything
> *but* enabled. And also, the is_enabled() method should probably exist
> for only Dynamic anyway?

I think it's the other way around? Enabled doesn't need this impl =
precisely
because of the Enabled token. IOW:

Regulator<Enabled>::is_enabled() doesn't make sense.

>  And also, the is_enabled() method should probably exist for only =
Dynamic anyway?

Also no, because Regulator<Disabled> isn't necessarily disabled. It just =
was
not enabled by us, but might have been enabled by somebody else in the =
system.


[=E2=80=A6]

>=20
>=20
>> +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
>> +    fn drop(&mut self) {
>> +        if core::any::TypeId::of::<T>() =3D=3D =
core::any::TypeId::of::<Enabled>() {
>=20
> I would avoid this kind of logic. Instead, you can add an
> `disable_on_drop()` method or constant to the trait and check it here.
>=20
> Alice
>=20

Can you expand on this?

=E2=80=94 Daniel

