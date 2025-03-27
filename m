Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CAD1F94A;
	Thu, 27 Mar 2025 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743076040; cv=pass; b=SeqcAABftSAbl94jcaHm1eVuaLQMhKhJgI992RKQe1Q8/utJRQf4h2GcSwWkHuWDJTyn2jzdAojiR7BuhYfth1jIsukDk3ewRBL1LUj0WgHpgjOGrndjIXa5hXoC0m1YAEej7HMDIqHeQ7D84F/3ZyH+NnS8aozKgHl+q4EqX9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743076040; c=relaxed/simple;
	bh=B0F6xvi62XtdN3jBvAHF73z3nzzlNq+vFLwDxvr3n8E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=GzZxD+lMfhfODMuV1MmLXzAksAAt5gEAhVWl5GxrRSAbt2mLufwb96v8i6hKoD1UyWVbG7YAJCX+fBrqDNktC7BY4qxr/AuGtODRXjdhlwOOuoUn7/VFiN/mbS1Uzm199X9i1Usft6CYVbUcdRfjhbKAcV0nbhT7fHsM9yG5ciE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=SskbvwwL; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="SskbvwwL"
ARC-Seal: i=1; a=rsa-sha256; t=1743076014; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TWV2T4aqmLJ5IEWBHY4MzW82t7Ka7fPOFMqOx0NIfUeBUOs7dWiz03iYWU4dRRE5qY75XvxRM8ATxvIsfztXJw44Bx8EamfBgOIpZHfy8moTO4gjX2ZJCrS2HksTnOTJKpZ5prPTvGKOD9byHD0pI+PR1ivJxnMYYDl1UHCIPkI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1743076014; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lEHkj5Yx4zM0auDPQ9llr7Y10Y+yqKkLT+9PKE6Q5jY=; 
	b=aOcZAmnTye+W/wF+AxWbjzCaza0bajpLQIrIFZWqWJ/Yll+pta/ut3mD9yLohZN3w2PKqE1bPoas3R7/eDp81XWxNc/XjNWzxCE+sVYxjbJNE39zbd7GAamiLF/fI7nZ6prQLpO+m/QdQDNV/vfXkur48jt3WXZMJNz7BQzyvM0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1743076014;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=lEHkj5Yx4zM0auDPQ9llr7Y10Y+yqKkLT+9PKE6Q5jY=;
	b=SskbvwwLDDSsfOmdShIC1FZ8qtVJ+DK/Mn1rO0yyZejsb8QPvvdkxISL99xNu5lY
	ZOTE39UJDSc1b4TxRLAXqFGMH1xGJyXoNti2Ss7uPBNoJeUle8k/tNG9/GAYdwMi8OO
	yzsCLOzJHkra8ZQP8sNCVXUunLiCkY7u/zgHv0ew=
Received: by mx.zohomail.com with SMTPS id 1743076013029441.6226911590842;
	Thu, 27 Mar 2025 04:46:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH RESEND v2] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
Date: Thu, 27 Mar 2025 08:46:29 -0300
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
 lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9ADCA08-C3B3-4964-BDB9-E62A2C7DE85F@collabora.com>
References: <20250326-topics-tyr-regulator-v2-1-780b0362f70d@collabora.com>
 <a98eb789-4c49-4607-ad15-76e260888d64@sirena.org.uk>
 <0698A75E-D43C-4D02-B734-BFE1B3CC5D34@collabora.com>
 <f22cbd85-1896-4842-8746-d74ee160ab3c@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-ZohoMailClient: External

Hi Mark,

> On 27 Mar 2025, at 08:32, Mark Brown <broonie@kernel.org> wrote:
>=20
> On Wed, Mar 26, 2025 at 04:49:26PM -0300, Daniel Almeida wrote:
>>> On 26 Mar 2025, at 15:56, Mark Brown <broonie@kernel.org> wrote:
>=20
>>>> +    /// Disables the regulator.
>>>> +    pub fn disable(self) -> Result<Regulator> {
>>>> +        // Keep the count on `regulator_get()`.
>>>> +        let regulator =3D ManuallyDrop::new(self);
>=20
>>> This looks like user code could manually call it which feels like =
asking
>>> for trouble?
>=20
>> Yes, user code can call this. My understanding is that drivers may =
want to
>> disable the regulator at runtime, possibly to save power when the =
device is
>> idle?
>=20
>> What trouble are you referring to?
>=20
> My understanding was that the enable was done by transforming a
> Regulator into an EnabledRegulator but if you can explicitly call
> disable() on an EnabledRegulator without destroying it then you've got
> an EnabledRegulator which isn't actually enabled.  Perhaps it's not
> clear to me how the API should work?

No, you misunderstood a bit, but that=E2=80=99s on me, I should have =
included examples.

> +impl EnabledRegulator {

> +    /// Disables the regulator.
> +    pub fn disable(self) -> Result<Regulator>=20

disable() consumes EnabledRegulator to return Regulator.

Any function that takes 'self' by value (i.e.: =E2=80=9Cself" instead of =
=E2=80=9C&self=E2=80=9D )
effectively kills it. So, in that sense, disable() performs a conversion
between the two types after calling regulator_disable().

=E2=80=94 Daniel


