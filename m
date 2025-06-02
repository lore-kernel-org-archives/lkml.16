Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027322A4DB;
	Mon,  2 Jun 2025 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748876233; cv=pass; b=BLNuEX0vVgET4fysWzh45Czew6J6Af8Lq19iYX+opUe6mic2alMYSlyggzImmQwYcAWtemw5osOUQaBHa+GmwTIRCyjCu7g6gpiEY3BnfyPLWMpxRq/EToVTRwImwKRymsmf7sp0V4IxB6FT4IBNoD9/kar3eGGRupDVCJOE+Gs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748876233; c=relaxed/simple;
	bh=fqmaKdL6+SP2p0NooH1UzlIgSWoHuY1uQbCgGLpfntQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kZ21UBY7bo+ZdScufVw8L1ManfKf0YSst66JRRUlLAS45gR2EcAOJNpuL/h8jOxr46jTtR0ZQPjSIY8ja1EbnygLKN4kS3Gftu47zMrr20ItBmcO3hRQ5pWUxJekpze4QfSpk+4Q9of8wkp0Ffi8dAjIXcaTrRQlaxldEMcVrcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IcL/sGjB; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IcL/sGjB"
ARC-Seal: i=1; a=rsa-sha256; t=1748876207; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XmfrqtlhlnldH4kwzX4xslwYHfQBNdHqcBelQXZ6Lrcg7iHEviQmrTe484+B/xbtqKltYjBoA7hv30bsOrW5l+9qFgt5w63z3CLt7Ic4BG9A6qlvwb6xLgm2N/tI8KTnV4yxABMuhHgBBMqrkLAfJn2UzOztNkd0zECYmwQNmaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748876207; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3qYcFLdgo7IjTr+AbRql4HwQ6X5sGT8wD6ZLBAhVXkw=; 
	b=V2Pgs07EDkFlFzQZYf8C2Eu8sLYTW4UkxbSudhkqHGH2B+lucnObRvfhD2J29nmrUPus6qYkq3KfZDcAw4T2IBh5EapHUv/O3uL+MGLhLW8RJSt4/JONbADXfG+5m9HO/o96xTZQ8u69OtgK9awa3NLDBz/URPSXisDM5PWsWU4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748876207;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=3qYcFLdgo7IjTr+AbRql4HwQ6X5sGT8wD6ZLBAhVXkw=;
	b=IcL/sGjBT3DRi2YktskR8cKL3Je68UDw+2KjwU3PSWChgPgVgG/dBjRUtXJTCKJC
	Evu8mwiN6SMxFkupAvGNr8utQwkAxrKvaBB185mzeVeb+yeQ5ZeYiiKQUDwLggDrUOs
	PU/A8XS18f+meXanq4e42XbngvGHl8exX2QywJIw=
Received: by mx.zohomail.com with SMTPS id 1748876204841691.2107514249591;
	Mon, 2 Jun 2025 07:56:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3 2/2] rust: platform: add irq accessors
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCsK7s0qepzIiA-l@pollux>
Date: Mon, 2 Jun 2025 11:56:28 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <CA34AB78-D9DC-433A-B6DF-663849A07370@collabora.com>
References: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
 <20250514-topics-tyr-request_irq-v3-2-d6fcc2591a88@collabora.com>
 <aCsK7s0qepzIiA-l@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Danilo,

[=E2=80=A6]

>> +
>> +    /// Same as [`Self::irq_by_name`] but does not print an error =
message if an IRQ
>> +    /// cannot be obtained.
>> +    pub fn optional_irq_by_name(&self, name: &CStr) -> Result<u32> {
>> +        // SAFETY: `self.as_raw` returns a valid pointer to a =
`struct platform_device`.
>> +        let res =3D unsafe {
>> +            =
bindings::platform_get_irq_byname_optional(self.as_raw(), =
name.as_char_ptr())
>> +        };
>> +
>> +        if res < 0 {
>> +            return Err(Error::from_errno(res));
>> +        }
>> +
>> +        Ok(res as u32)
>> +    }
>=20
> I don't like the indirection of claiming a u32 representing the IRQ =
number from
> a bus device and stuffing it into an irq::Registration.
>=20
> It would be better we we'd make it impossible (or at least harder) for =
a driver
> to pass the wrong number to irq::Registration.
>=20
> I see two options:
>=20
>  1) Make the platform::Device accessors themselves return an
>     irq::Registration.
>=20
>  2) Make the platform::Device accessors return some kind of =
transparent cookie,
>     that drivers can't create themselves that can be fed into the
>     irq::Registration.
>=20
> My preference would be 1) if there's no major ergonomic issue with =
that.

Isn=E2=80=99t 1 way more cluttered?

That's because the accessors would have to forward all of the arguments =
(i.e.:
currently 4) to register().

Going with approach 2 lets us keep the two APIs distinct, we'd only have =
to
take in the cookie in place of the u32, of course.

=E2=80=94 Daniel=
