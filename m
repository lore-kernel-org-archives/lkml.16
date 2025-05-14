Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846B61C1F21;
	Wed, 14 May 2025 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747239607; cv=pass; b=d9X9F5uTCSFYGscQ7Vs3B7NS/Dn89UFqsaAb6FSKaVa6zmphssB+Naezt48vSexHuT7nvUwn9BFlbBhqMEqcdA0ZV6z2oWntIA6L4Ro8LrRRjWNUBpUKlDMuYprfWhzjRBw2bTKhBvydJYVRMY0Yj5zx4evNpZkGnKFrqILywhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747239607; c=relaxed/simple;
	bh=2G+M15EQbYwGAgukNxEv6MgmCeL5df7cIPPArFKep7I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=Ffv7rjkFOnjj48VfE66QESddZkqQQRORsU37lw6TslKHmBH50BL4XR6xF2wJgJQlesoLoeCAsS4kgQsey06kxo9ka9msofUEGoFI33Xsk/YnfB8F6Aoc/oOagAlyhMRBK+xUuTPriPmSiAc1+J2x0t8eewh+ovyHbp6yWL1uaOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=aTnYd4+y; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="aTnYd4+y"
ARC-Seal: i=1; a=rsa-sha256; t=1747239568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Hc7dZGm807F1p6R/TOxmHK4d8cETpXT+6oRYTc1ZXk5MwpR14cKtQiDv/tPdX6FxSLfnlCwuqYsEwBoBAKB514bjQFwH8Pp4XEIN2/0xrP74vq1OUgZjmZA1gZfb+rkzS19+vS49vZXVb6UdjXvBRDW1Ip3kquGC+x5mNbE4G64=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747239568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=K8FUb7R/lhRxhB8tRt9FoMFnmews7FGVpIhujTqgtoo=; 
	b=kkLku6nWXpj8xIjY1qRigIMu6ALDHMU1MagzUSt9qnhRlyOykr2YyeH/+sswiTme4qLgQxVmGTggdOYbItAgBnhNWx7czIlfBmaWxViHxmgYYMAHfq4ClzGF/17tJikdF9MAyA+9OBzg7dJVIsUbAwnPByUFJtaVFuVP2pY0Prk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747239568;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
	bh=K8FUb7R/lhRxhB8tRt9FoMFnmews7FGVpIhujTqgtoo=;
	b=aTnYd4+yNOpoX+YDO3zUHJw/waIJdDQfJmbr1j+tf/IOgibVlT8sS1YeH24wvMxJ
	P3TynORK1vtuVJLCs4svIzb+Gk76t+tGZOsT7MfOJdmz/ygQlgNODOWFyNm3BoffxFd
	DXybpkfJAnYV5gups0SyiVlw6OhkKHC+5qdR6hQg=
Received: by mx.zohomail.com with SMTPS id 1747239566200994.4257827108297;
	Wed, 14 May 2025 09:19:26 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
Date: Wed, 14 May 2025 13:19:10 -0300
Cc: Mark Brown <broonie@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>,
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
 linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <B58EF4F3-6ADD-4311-BE9D-CCE82CBAEBF2@collabora.com>
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9VATLUHDGU8.53I80TGVRV0J@kernel.org>
 <B288AFB1-BA0A-4383-9823-EAC9E5DCA59F@collabora.com>
 <D9VXPNT4HNXP.1PKET0Q1H7O9Y@kernel.org>
 <52CFFCA2-F253-49F1-9EA5-2865BD094B25@collabora.com>
 <D9VZV8APBYWU.2SWXJLHIQ18ZB@kernel.org>
 <aCS71sbQKn7zeosR@finisterre.sirena.org.uk>
 <D9W0FJ6MKPTE.1NI5HK0TJRHCM@kernel.org>
To: Benno Lossin <lossin@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External



> On 14 May 2025, at 13:05, Benno Lossin <lossin@kernel.org> wrote:
>=20
> On Wed May 14, 2025 at 5:50 PM CEST, Mark Brown wrote:
>> On Wed, May 14, 2025 at 05:38:40PM +0200, Benno Lossin wrote:
>>> On Wed May 14, 2025 at 4:40 PM CEST, Daniel Almeida wrote:
>>>> By the way, IIUC, regulator_disable() does not disable a regulator =
necessarily.
>>>> It just tells the system that you don't care about it being enabled =
anymore. It can
>>>> still remain on if there are other users.
>>=20
>>> Hmm, so a `struct regulator` might already be enabled and calling
>>> `regulator_enable` doesn't do anything?
>>=20
>> It takes a reference to the regulator.  This may or may not result in =
a
>> change in an underlying physical regulator.
>=20
> Gotcha. So calling `regulator_enable` twice on the same regulator is
> fine?
>=20
> If that is the case -- and after re-reading the functions exposed on
> both types `EnabledRegulator` and `Regulator` -- I am confused why we
> even need two different type states? Both expose the same functions
> (except `enable` and `disable`) and I don't otherwise see the purpose =
of
> having two types.
>=20
> ---
> Cheers,
> Benno
>=20


As Mark said:

> IIUC the point is to allow Rust's type system to keep track of the
> reference on the regulator, otherwise the user code has to keep track =
of
> the number of enables it's done like it currently does in C code.

So this all started because keeping track of the enables was rather =
clunky. See
v1 [0].

[0] =
https://lore.kernel.org/rust-for-linux/20250219162517.278362-1-daniel.alme=
ida@collabora.com/=
