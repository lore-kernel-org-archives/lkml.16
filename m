Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F483A1B6;
	Mon,  9 Jun 2025 16:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749486696; cv=pass; b=Utpmz663rusCqZ/htXN5FgynEhnj8WJ4VMctywBMfgowNsSr8CPqcPWbmkMFc9Cl+/d+PMwtHo8dsLPyV1PwRViS4IcTDS8DgpQqU9XypqOrLGIN+Z9QwytgVAM+Xgt+9t05VvtZ8crS1H+PatyVteQHAroEn9C28zhXiDPaSdo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749486696; c=relaxed/simple;
	bh=RIqUGHWj9G1NHN2LaUPxE8EZCB7QaOCQlXKKlDcIt3w=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=J3Ylp9uof9IgQirNiY+ubhv7udWQmNfk2ffF7m8tR2ZWR/L0FLSL9R66iKfUkdV1E6vFeCdqjjHZZjBQfCjX306SrOe2HDBE7yLSx2lzcN7gO4OPQjo+7YMx2otGX+F1ODCFUrHrMUYWGzSnrElYJFTlacQi27eDKCVDxN9plO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IDlwgt3h; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IDlwgt3h"
ARC-Seal: i=1; a=rsa-sha256; t=1749486670; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cD/hGH9ef3n3ol2dV9xcmlS4/oFxjes7q353WZe76/hYXi5wHtSrZOxzjPUOkO4IiL83uhCe31K1S+dKve2egIVc3NSFHvT8yxn8BCy8x45Fau8stPZH/nxRl3RoHB8IA0i6lhxBF8ur0Av3MfxRjo4GFunOkwck7+VIu6e/6Ak=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749486670; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=He8HfUMJPmf3+p3sciXTNekEt/o7neEWLhlyiB54XII=; 
	b=mqJS4wzwcrqMqKH/F/EadRzfEOrzVHxcZkPV2Tq2xC8Ykbry/bcbuGZpCLjRDi2ihY+DYyTY9/0vArFFpy/TLy6nh/GgGsgpAUJfH/02ko+NCd38AZbYsXNOmhZuEemsuTL1Aafy8AKgbh/oYnDAgF81MsQiYKUtL2g01UanORE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749486670;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=He8HfUMJPmf3+p3sciXTNekEt/o7neEWLhlyiB54XII=;
	b=IDlwgt3hIzNfsOtPqZQR7fZy6lW5jg9Tx9ezgCpGUyx4NB2b9Sh71f/LW5mWwCIe
	KbpHUE6/EcN1iNJpnLh9GcIs4HLqqW0RykpmAfA4cZOEg/TJfvw1U8MyQkSL9zLt1Vs
	Wm2PbV6Iz/Z/gh4CRm4TWTSRrqY7Z9EW7AMSGAXw=
Received: by mx.zohomail.com with SMTPS id 174948666825955.29392187532949;
	Mon, 9 Jun 2025 09:31:08 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v4] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72kcF-CqUwvCBRt5FjX2Yrj517UYjXHA9Sf7-Xevsy=2Kw@mail.gmail.com>
Date: Mon, 9 Jun 2025 13:30:52 -0300
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
Message-Id: <09F9A01B-70CA-421C-9A48-E0FD0A192026@collabora.com>
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
 <CANiq72kcF-CqUwvCBRt5FjX2Yrj517UYjXHA9Sf7-Xevsy=2Kw@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Miguel,

Sure, thank you!

By the way, are you using some lint to generate this?

> On 9 Jun 2025, at 13:23, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Mon, Jun 9, 2025 at 5:34=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> Add a bare minimum regulator abstraction to be used by Rust drivers.
>> This abstraction adds a small subset of the regulator API, which is
>> thought to be sufficient for the drivers we have now.
>=20
> For future versions, or at apply time, please see the attached diff
> for some documentation fixes (mostly) -- please check with
> `--ignore-space-change`, since some indentation fixes can hide other
> changes.
>=20
> Most should be self-explanatory, but if there is something that you
> think should not be done, please let me know of course.
>=20
> Thanks!
>=20
> Cheers,
> Miguel
> <docfixes.diff>


Also,

> -/// Enabling a regulator:
> +/// ## Enabling a regulator
>  ///

Did you try to render this? I tried it before submitting, but it did not =
render
correctly after the first time it was used, i.e.: only the first =
subsection was
rendered correctly and the others remained as-is.

=E2=80=94 Daniel=
