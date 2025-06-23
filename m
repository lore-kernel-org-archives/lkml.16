Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12999139D;
	Mon, 23 Jun 2025 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703560; cv=pass; b=fsY7ByTsbraFzvmfyY1c91HHE8/1jf47oBRqNHntmUabp4cFfAtAG/nrkxrteEeo32hfZvDNEhmSON4I4IuYmIZiv2tSkwIjNCrDLrn8KWJ6W7i91U20A7BLVIAlpRkwuOTkm9xmrafqJdqIbQwuFqmhlq4+/ufUvriEEHn65Tg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703560; c=relaxed/simple;
	bh=MyBbYI83wZlDQG4L/ii7WX0/ddv/V4PuAwMhE1Xcyek=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=d2h4C1UAim46/GPMFXYE8V/MW4uu570OOOZpCUB0Szjg9AvjdaJgvOjnl2YXLRG+G5viqrJ1VnAiS34svU82bec72v/yT+JWD0XeSxkx4JBEVmhbou6EuLql2qAA98GR8i4VvN9E+fafE2E3FpeQJelqj5aOR27+cxsclxW/EOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=D4eiB8km; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="D4eiB8km"
ARC-Seal: i=1; a=rsa-sha256; t=1750703537; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ElSgkYf1DFAFqFiABm+MeEoLmVlwkjst0k7ID9Y9X4biQtq1bQy/abqE7tk+y109XAquZeFu/bOelg8Q+jnhv0KnEZekgg7KlnqjMQBA+gdoqSoNmcL+5KZrGyVXghfDH1rxzgPTeV+88rhdR4bCaad+cNu00EODBHizdn2SaaM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750703537; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=MyBbYI83wZlDQG4L/ii7WX0/ddv/V4PuAwMhE1Xcyek=; 
	b=BEruOpgYEF7XGdiAwskfXzcrmc6txZdBkEoVUP2Eai2oDSmVjPhBbfNKP75PGRjJ6QvCcnnE63v0JhrsFJSVU+MntvzgXjgJXgeZ/K9/3tF2YcEgyynOHfEpNnpl85C3EuTilU2jmvRv1WZt1lVbAXd8ozVPGSn686Jqz2Uba8A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750703537;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=MyBbYI83wZlDQG4L/ii7WX0/ddv/V4PuAwMhE1Xcyek=;
	b=D4eiB8kmQqDobAXRCRgvleympivXTYAZBLhukz30yYDGtTHOKo9j/89TtJtWvSmI
	cc/tMfEvsWk/lEknXUoh26R6d3Y9VOWAXlnHkvqtEUK7XioRguF6VWCiTQqYS+IDS3v
	xkrQ/+ZJppGH/FRhuwFxYDzPVhqfNOggkVpVgzOg=
Received: by mx.zohomail.com with SMTPS id 1750703535862791.2797506732994;
	Mon, 23 Jun 2025 11:32:15 -0700 (PDT)
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
In-Reply-To: <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
Date: Mon, 23 Jun 2025 15:32:00 -0300
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
Message-Id: <79BAA514-E57D-4F0E-B297-F178184E36C9@collabora.com>
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
 <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Alex,

>> +
>> +/// A voltage in microvolts.
>> +///
>> +/// The explicit type is used to avoid confusion with other =
multiples of the
>> +/// volt, which can be desastrous.
>> +#[repr(transparent)]
>> +#[derive(Copy, Clone, PartialEq, Eq)]
>> +pub struct Microvolt(pub i32);
>=20
> This type actually contains a voltage, but is named after the unit it
> stores. A bit like if `Duration` was named `Nanoseconds`. How about =
just
> naming it `Voltage` and give it `from_microvolts` and `as_microvolts`
> methods? We might not need to use other units, but at least it doesn't
> close that option.

I think that not accepting anything other than microvolts is by design, =
and
that changing this to `Voltage` would defeat the purpose, which is to =
make it
crystal clear that the unit is microvolts.

Also, the places where this type is used take microvolts, so I don't see =
why we
should add this indirection, which would require a convertion back and =
forth
from volt.

By the way, I went ahead and sent a new version [0] without this change.

=E2=80=94 Daniel

[0] =
https://lore.kernel.org/rust-for-linux/20250623-topics-tyr-regulator-v5-0-=
99069658cb54@collabora.com/T/#t


