Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A217E107;
	Wed, 28 May 2025 17:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748453435; cv=pass; b=drPQNUk09/D8+uyblVSySiFgFwIO2IGQdoRo7bA7l77hTb3hRpG//uIlivX2EKyB9g/i5ahrUHCUpuRWPU5QBmOWaqHmfehpkE7wZlTujPuCGlaqDVGRBIij/UgDfd4ElkAIeFBqbgghF5m1xpfErI8DKhxQDn1Va/3BkIN8VyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748453435; c=relaxed/simple;
	bh=oxapIJUhuAH7C5mchQDq2upP03mEfxyRa2A9sT6SIrs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MOghUTgPFCXdJht0ORpOQQa70YSNZZsz9M3fEgW33EtZ9ydq2gSi7R/HTov7r06nVaEzjMpItgAnN+ZVPDlR4TQJKMJ9LTPcthluiQf01qJ8ZxDNTnZ03NIYf48gEKsi6GkCkSTNDJa8dXDQcSGgLP1sxLMWJNATP2zf2Yd8rwo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=VzCrRYax; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="VzCrRYax"
ARC-Seal: i=1; a=rsa-sha256; t=1748453402; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A9brW/8mv1YNAt58KcT18LlPzEOQaZkEEzKoTQeX0IVGFAtOxfusodD3nJuX93wAlbWvsCpi5XQ3ssR/oRjzWTIEM/YhhqDoGGZohLle6VqAo1QZbPwGn8tLY/G1Tlv3Jq2T4WkH1HtLsG29NLwhSOCg9KByOLGLu06JesgcGaw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1748453402; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vijCCIgMRuv2HsNGVhwlJlzo9DZfoqJJX6CBYjOowuY=; 
	b=IszMaJO+SwvxiQ2yplc/xe1W/znJemQPVTwlwXOkgFnpypMbZGxiKmE2PTNtiukZqR0D02JqxKko5YCZMOB4MJnmgUrp25a5RY1tKZ8u69ej2jt4erXPtLpoQLn0CKVTeE5I5yiB0FMcIe1mTIpSTAgZ/y5xcXHPe61uBph+9+U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1748453402;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=vijCCIgMRuv2HsNGVhwlJlzo9DZfoqJJX6CBYjOowuY=;
	b=VzCrRYaxx1JMo6Yq85D/aWmwpLLtucRJZPvz9vGKX/RZSA6UQFwGgZnwLN7T1oEo
	z92RWsDoLohqZWTYigceeA+GR4ZmRBTYpBUL1Sn15bsrWVgb8XJ/n4CjLRDyQPWvivg
	IwE1iAL1KkD6vFoKR6opedMjguv89hCMjvRksN2I=
Received: by mx.zohomail.com with SMTPS id 1748453401588404.8876402861505;
	Wed, 28 May 2025 10:30:01 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v8 3/3] rust: platform: allow ioremap of platform
 resources
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aCYVG-VVdJXYnSTt@pollux>
Date: Wed, 28 May 2025 14:29:44 -0300
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
 Andrew Morton <akpm@linux-foundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Ying Huang <huang.ying.caritas@gmail.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <5B875DFB-D655-4BAC-A475-43AE309520E2@collabora.com>
References: <20250509-topics-tyr-platform_iomem-v8-0-e9f1725a40da@collabora.com>
 <20250509-topics-tyr-platform_iomem-v8-3-e9f1725a40da@collabora.com>
 <aCYVG-VVdJXYnSTt@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Danilo,

[=E2=80=A6]

>=20
>> +    ///     let offset =3D 0; // Some offset.
>> +    ///
>> +    ///     // If the size is known at compile time, use =
`ioremap_resource_sized`.
>> +    ///     // No runtime checks will apply when reading and =
writing.
>> +    ///     let resource =3D pdev.resource(0).ok_or(ENODEV)?;
>> +    ///     let iomem =3D =
pdev.ioremap_resource_sized::<42>(&resource)?;
>> +    ///
>> +    ///     // Read and write a 32-bit value at `offset`. Calling =
`try_access()` on
>> +    ///     // the `Devres` makes sure that the resource is still =
valid.
>> +    ///     let data =3D =
iomem.try_access().ok_or(ENODEV)?.read32_relaxed(offset);
>> +    ///
>> +    ///     iomem.try_access().ok_or(ENODEV)?.write32_relaxed(data, =
offset);
>=20
> Since this won't land for v6.16, can you please use Devres::access() =
[1]
> instead? I.e.
>=20
> let iomem =3D pdev.ioremap_resource_sized::<42>(&resource)?;
> let io =3D Devres::access(pdev.as_ref())?;
>=20
> let data =3D io.read32_relaxed(offset);
> io.write32_relaxed(data, offset);
>=20
> Devres::access() is in nova-next and lands in v6.16.
>=20
> [1] =
https://gitlab.freedesktop.org/drm/nova/-/commit/f301cb978c068faa8fcd630be=
2cb317a2d0ec063

Devres:access takes &Device<Bound>, but the argument in probe() is
&Device<Core>.

Are these two types supposed to convert between them? I see no explicit
function to do so.

=E2=80=94 Daniel

