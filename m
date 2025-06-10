Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A2223909F;
	Tue, 10 Jun 2025 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749588794; cv=pass; b=m7uH32qQKmQouAer/eqPDYDsAl9zqZgbIyK32YcCtzu7CLdFLuvJ9zJ2fczLXgRQ/OVtCFVR2bAjh2jEQA5YHG1HUVOx6dYUMBgW4VEoZGSId81vYyM/sy6LK91YW0zIRdDWjc9GTmkJ0wfq+w/rs1NcFn/7kFzoOw57uiA26N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749588794; c=relaxed/simple;
	bh=8BwPVmK64VFnrIhMKkDZ+DxVV442z8pfMi1pRltCTAE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=KAG66KxKE9sdNkyY5U6PM6YT4sgTYcgqk3N7cq8EUoc5Em59LpKJgpWVq47JBa7snjFz3GxDJ6DJa6dGQu4Zqi9x5VG4/oCt8H2QI2WxCktyLikXE2OP58+oABgRmbE49v6PG20YgrpvAYfIV0NKv7JGI6j6s6h1K4cmZYULeVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=lBK5Ym3F; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="lBK5Ym3F"
ARC-Seal: i=1; a=rsa-sha256; t=1749588771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AJGQRUHWBoJMr/xavwTXREsyQRIFay5qtRHGXq1D1XdrFQ/VfPTb2jvac4c/QKXowe+JYI246noHcUBMhdAHXiU4bP7WRtpTfg1xfR0fT9QvdDRR8HXavsHz8yEY0oztH6/LwIBbh+DjkWxHhNJ5diMiqMm39aXGOfPF62S2YHo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749588771; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8ohbf0fVC2bweHQzX/NMFiOeF906+iaMjeRr67c5dI8=; 
	b=ACKcKvZqV6gRXNll5SIUjJxCj23gSNkczoRTuz4D1vsQ1g8T8s3w4MSo6VQMrqGSfAdujiFvXN9OFMjrbSfI8vyGIJ6aPRLGSAoOWS+GZ/hmRH/VHYEMbNop4wqSYMc6AFvFCSWN0hMf81k0ngbUL3z3x8bYDdAxPnDhCn9sLhs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749588771;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=8ohbf0fVC2bweHQzX/NMFiOeF906+iaMjeRr67c5dI8=;
	b=lBK5Ym3FgAOfv22C+sDEn2e3yJywZJhB8CdO3Yt3oJfvi5ukS/+kTIQnD2J5W9Ea
	+XfP8mR8/MiWeNmgYqnA9MzOQdMHRXEw87x642vSfCEfymWiYtlyfy8riW4le9cre8L
	+k41ME7FsMNP2kWcztwjLictoYwfqBkPlxBl94pw=
Received: by mx.zohomail.com with SMTPS id 1749588770444499.07877296780373;
	Tue, 10 Jun 2025 13:52:50 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v6] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72nHzEN9D2yEkXNAWGySQADtUCW_V0YtpnCvHG=nxdeDCQ@mail.gmail.com>
Date: Tue, 10 Jun 2025 17:52:34 -0300
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
 Alexandre Courbot <acourbot@nvidia.com>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <79427200-D82D-4EC8-BE6A-A1964DACEB5C@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <CANiq72nHzEN9D2yEkXNAWGySQADtUCW_V0YtpnCvHG=nxdeDCQ@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Miguel,

> On 10 Jun 2025, at 15:08, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> On Tue, Jun 10, 2025 at 4:16=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> +use crate::build_assert;
>=20
> You can include the prelude instead.
>=20
>> +            (1 as $ty) .checked_shl(n)
>=20
> Formatting.
>=20
>> +        pub fn $unbounded_name(n: u32) -> $ty {
>=20
> We may want to have a comment inside here to remind ourselves to
> forward the call to the standard library one when available (1.87.0).
>=20
>> +        /// Creates a compile-time contiguous bitmask for the given =
range by
>> +        /// validating the range at runtime.
>=20
> I may be confused by what you are trying to do here, but how are these
> `checked` and `unbounded` ones compile-time?

This is wrong indeed, thanks for catching that.

>=20
> Also, you can probably simplify the macro `impl` calls by removing
> parameters by using `paste!`, e.g.
>=20
>    let high =3D ::kernel::macros::paste!([<checked_bit_ =
$ty>])(range.end)?;

I personally find paste=E2=80=99s syntax a bit hard to read, but sure, I =
have nothing against this.

>=20
>> base-commit: cf25bc61f8aecad9b0c45fe32697e35ea4b13378
>=20
> This is a fairly old base now (the patch does not apply cleanly).

Sorry about that.=20

Anyways, let's see if others are happy with the direction this patch is =
now
taking. I will rebase on the next iteration :)

>=20
> Thanks!
>=20
> Cheers,
> Miguel
>=20

=E2=80=94 Daniel=
