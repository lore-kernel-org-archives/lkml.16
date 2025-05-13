Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE911B3950;
	Tue, 13 May 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747162381; cv=pass; b=bSGwt/vUffUAMF/ikCfiispWD/TYKXSd/PDcx3UHyK2cgmvOAWIaaOJ47JVIP31kuq2+6DiItpoo6QMRGKMWFt0Q9TmAge3JA14SKg7HJnBDs5bDNft694/5v3Vds0zhbB8Ez3Vz9fz9cdOfLvxeBsxitIgZCm7UEmB9nRZQwWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747162381; c=relaxed/simple;
	bh=eZ347tx+t0nPAWttcZqkZ1phwJ4PIypiq+sek0qihqc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MrHYtFhhAhvQ/uqBj8uNlq+ZE6EivoYzLfKQllBBqrZmJwHEGd0AFt25hBKRNUYG6W7ojghYcLZrqOGReTu42WC/+WLbJTjYcROFyoz3mFx1ZW1geyAD+bwyahnpkniRKjnsTneWvCk7S+Pnu/G/xxF4LKp3E40HcFo3treZyYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Uln6ZtRE; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Uln6ZtRE"
ARC-Seal: i=1; a=rsa-sha256; t=1747162352; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HQkGxt/8X1UaUWVzMy1CTaNsqIrwQUUCEhcK7I14sX6lnkXLaDQJc8B+in1lc92kW1y+iEXTbZUerSsQLfStmMXnm2Sr0dnB60GWAczLSkXaSsXO/mdco81j4yd+COlF7eRdM8iyk+7vyBQ5V+JKZNvaDLNObMjHGWtjjQeVsPc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747162352; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WB8PCTNKLyayZszlJCjzQ7N6J+zjdxftgAeIEULoWGA=; 
	b=LvGAKSLpMu9SN7kp247Bj+JrWN7JQ2JAYRdvgD2veesXfZ15Gemf3LlKFaQ7sq+GxwdOOojqxF1CHtIyrGRXpHJCBxKZSb9x8V73s+D5xSPAp3Q0LbjNskTCvfLAlfWAk14ypuOpr5HEmtaS3w1JfEdiQrZ0Dmoa7rskgOIy+AA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747162352;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=WB8PCTNKLyayZszlJCjzQ7N6J+zjdxftgAeIEULoWGA=;
	b=Uln6ZtRES/DpZJotpnAoNQZYQqIwU2sfoaPaG13e3hQE+FD3sYNGAg8F5+IGm3dm
	pZgzqqFMdkTtoswA55WDkPG5oczCm668zM0Jlv0OHfo266Pn2G6KYrnYPgWhc7nBNX+
	NAyn6ndzE3o8rd0d5CvtyHlLaH3ZYXiB0jZYHSHE=
Received: by mx.zohomail.com with SMTPS id 1747162349863789.8507475498036;
	Tue, 13 May 2025 11:52:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v5] rust: kernel: add support for bits/genmask macros
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <CANiq72kkgBtEWNQtu_tZpUYC+b-_3RsnWFO2biHPB74mrKE=AQ@mail.gmail.com>
Date: Tue, 13 May 2025 15:52:12 -0300
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
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,
 Fiona Behrens <me@kloenk.dev>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8998B971-BB46-4624-8077-5C85FE5FA97A@collabora.com>
References: <20250326-topic-panthor-rs-genmask-v5-1-bfa6140214da@collabora.com>
 <CANiq72kkgBtEWNQtu_tZpUYC+b-_3RsnWFO2biHPB74mrKE=AQ@mail.gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External

Hi Miguel,

> On 27 Mar 2025, at 18:27, Miguel Ojeda =
<miguel.ojeda.sandonis@gmail.com> wrote:
>=20
> Hi Daniel,
>=20
> My usual docs-only review... I hope that helps!
>=20
> On Wed, Mar 26, 2025 at 3:07=E2=80=AFPM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
>>=20
>> +/// Equivalent to the kernel's `BIT` macro.
>=20
> "To the C `BIT` macro" or "The C side ..." or similar -- these one
> would be also the kernel's :)
>=20
>> +/// Create a contiguous bitmask starting at bit position `l` and =
ending at
>> +/// position `h`, where `h >=3D l`.
>=20
> The first paragraph is a "short description" / title -- you may want
> to leave the details to a second sentence, i.e. in a second paragraph.
> Please check in any case how it looks in the rendered docs -- it may
> be fine to have all in the title.
>=20
> In fact, given you `assert!`, we should probably mention that very
> prominently e.g. in a `# Panics` section. Or, better, avoid the panics
> to begin with if it makes sense.

I have been staring at this for a little while.

I wonder what is everyone's opinions on an extra set of:

// e.g.: for u32
const fn const_genmask_u32<const H: u32, const L: u32>() -> u32 {
  crate::build_assert!(H >=3D L);
  ...
}

..on top of the current genmask functions we already have?

This lets us move the checks to compile time for most cases, because for =
the
majority of users, h and l are simply integer literals. =20

For the rest, we can probably modify the current functions:

fn genmask_u32(h: u32, l: u32) -> Result<u32> {
  if(h < l) {
    return Err(EINVAL);
  }
  ..
}

The implementation can probably be shared by using macros like =
kernel::io::Io,
for example, and the panics would be gone.

=E2=80=94 Daniel=
