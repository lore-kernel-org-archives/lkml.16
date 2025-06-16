Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C722BEFEB;
	Mon, 16 Jun 2025 14:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085804; cv=pass; b=dODtuZoWnCG+aSspemgdQFGu4M0Rw/v0IdbfkMxvRQ+fKLyJGFC8oen4z2U6+cmwBOc4PUhglh6t5tNrLe7bDBKLP2lvwiQ5uizvZgsCrO1kA4bWTnL81U2hRQ4160omw2/TtNWOG+kt1IAhlBGiu8QZQoJmnyEagz98vBXSyhE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085804; c=relaxed/simple;
	bh=FHA0qXxH97hrMpK1m8eyFVAD3IhyOatmTyHQSe8khfs=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=I8BnUcJGcygQAX+yPDTIKDPSUl52bF3vGgPafrk8zLbIY/bdYGhw4lnlAkNB6Yc+E3Qj9EGHGq66pAcyFWocjtHPWB2Tqx/krBsHL13+FAyjisubxHKo+WDyVuPm07CbA0/1t3ry93AHuoW74jg4myhBoiRgfSouV6uT26GbFXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=f7619JxT; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="f7619JxT"
ARC-Seal: i=1; a=rsa-sha256; t=1750085783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=N9dWNo7I2HlyV+sYWjI8Ob3/p92WpGS1VgqstYxavj1x2w1o7h95OonO6JCLvymRHvI/v+xfZopCwAfW6G0mRBBeU3S38JkBafQUA7jrEbV7Bz8TyScGIonEcATQdxGXbyRLdh7x91CfwSHX3N27Axny4Rl02fQlnN2G6FgT+cg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750085783; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FHA0qXxH97hrMpK1m8eyFVAD3IhyOatmTyHQSe8khfs=; 
	b=GckFlxZK4x5CEzw6YzyU6v4lAucKxdOaZ8T3M3L7KABRRABBF/WmuTlOwqKSKxdEeOIpBcbIMKkxBVJNqsNGM0E+S3h4CIPHwJ9B4bt1yM30UH+fdpRk8F77+DR8Cs3Gw6u76YVFcr6VB/jepe42RJ55QRupw9byi7lCR4x4l6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750085783;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=FHA0qXxH97hrMpK1m8eyFVAD3IhyOatmTyHQSe8khfs=;
	b=f7619JxTxaVC0lISJRSuqOPQ16AF7xlL2mh4yEaxEu3YF481jw1zJ2mZe9EwAiBD
	fCbsiQb20r+MV8iKcP20aoskorbHdjtdEe7MvDRN8I6GcdiOZwPf6XWttjcGPp3HxaX
	Wedx/VvHjJghcr3mqRSCc9PFHfl54+jkpOJBPH2M=
Received: by mx.zohomail.com with SMTPS id 1750085781588401.0239276513456;
	Mon, 16 Jun 2025 07:56:21 -0700 (PDT)
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
In-Reply-To: <DAO1K5YIFVRH.31XI173DWYYX1@nvidia.com>
Date: Mon, 16 Jun 2025 11:56:06 -0300
Cc: Boqun Feng <boqun.feng@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>,
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3EAB4EAE-DDCF-47C4-A712-77B37AEDF4E8@collabora.com>
References: <20250610-topic-panthor-rs-genmask-v6-1-50fa1a981bc1@collabora.com>
 <DAMAPVAI3V8X.N8SAQD6KOO1Q@nvidia.com>
 <9578ECFC-6C59-40E3-9340-A426E8D2328A@collabora.com>
 <aFAqLYBMHkC_X-dr@Mac.home>
 <D29BB87C-356E-4885-8308-456028AE3B6F@collabora.com>
 <D12DC02A-E1EE-47F1-86AF-C25C492FA3D4@collabora.com>
 <DAO1K5YIFVRH.31XI173DWYYX1@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-ZohoMailClient: External

Hi Alex,

> On 16 Jun 2025, at 11:52, Alexandre Courbot <acourbot@nvidia.com> =
wrote:
>=20
> On Mon Jun 16, 2025 at 11:45 PM JST, Daniel Almeida wrote:
>>=20
>>=20
>>> On 16 Jun 2025, at 11:42, Daniel Almeida =
<daniel.almeida@collabora.com> wrote:
>>>=20
>>> Hi Boqun,
>>>=20
>>>>=20
>>>> We should tell/educate people to do the right thing, if a..b is not
>>>> inclusive in Rust, then we should treat them as non-inclusive in =
Rust
>>>> kernel code. Otherwise you create confusion for no reason. My =
assumption
>>>> is that most people will ask "what's the right way to do this" =
first
>>>> instead of replicating the old way.
>>>>=20
>>>> Regards,
>>>> Boqun
>>>>=20
>>>=20
>>> This is just my opinion, of course:
>>>=20
>>> I _hardly_ believe this will be the case. When people see genmask =
and two
>>> numbers, they expect the range to be inclusive, full stop (at least =
IMHO). That's how it has
>>> worked for decades, so it=E2=80=99s only natural to expect this =
behavior to transfer over.
>>>=20
>>> However, I do understand and agree with your point, and I will =
change the
>>> implementation here to comply. Perhaps we can use some markdown to =
alert users?
>>>=20
>>> =E2=80=94 Daniel
>>=20
>> Or better yet, perhaps we should only support a..=3Db.
>=20
> ... or just drop the ranges and do as Daniel initially did, using two
> arguments. But I agree with Boqun that we should not deviate from the
> official interpretation of ranges if we use them - the fact that =
`Range`
> is exclusive on its upper bound is documented and a property of the =
type
> itself.

By the same token, I agree that we should use ranges instead of two =
arguments,
if said two arguments represent a range anyways. So my vote is for a..=3Db=
 JFYI.


