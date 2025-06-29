Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02olkn2031.outbound.protection.outlook.com [40.92.50.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49B3A1B6
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 08:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.50.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751185164; cv=fail; b=ptTbgFdNJUwGCyZNjTQFAQ1OPyJ4mpMxT1kpu1XAutPppEqrOLQozxpCxFG6L5zi6sJt9u4hTyPx1Uc8R2ecebU3V/pu44QaUm2nFgyWGM6U36d9KFH/gZWaieImmUbkStOnbe3qr6LTXGcvGWgjgYi3uOKUyNlxdD7YdFKT6+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751185164; c=relaxed/simple;
	bh=djoLYYNJygzNDuyrNg9IPfSrzLq6JuN+TgtIcELSVjk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AlQePkQbctt8ClUJlyNKyhMHhyhna15zXRMROENDQeFy5Ic4AHwmTrNCGHa8LQyRhKV1LpRUWznHELVJqv+xgmhV8Vvbkj3k26yRc5AWisd5HIyBNT3OvyRw4aI5qhNImwD1Grq4OgUtI4m3dTsPNNoQmavMpKpuwvIhAItAaxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=mWyRfx8g; arc=fail smtp.client-ip=40.92.50.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="mWyRfx8g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HnTFtYNRg/MEfur3cMEsuzaXYw+LDvLeFzc27jN5NftsJJzsOmKvYnG3vI2bPFBM9iqUBr8RBIsdcLmZZi1JP8sQF34NgdxQmB5CX/nrr+WclVzuaHYbAp0Am9pKd6oD/+/z+w9BUg4lcEWPTvYGiqLLoAH9G2e1YLi0d3GG/SbugK9gWmsAlezeTph8fOHMs22bdsdCye77DyRM/WazauzIx9E82tdKiA6gVIHguEKmBZsLwQ3pENmZri/L5s2EPNFxdesfH/rAqWVwTX6EpWMC62+IZqfNq4V7xLmTZIQ22EuA/lD5Km77342os3Iqz6H0Y4O+vsej8qabo+JfjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djoLYYNJygzNDuyrNg9IPfSrzLq6JuN+TgtIcELSVjk=;
 b=WwjECPscLaJdLLTl+3KPETIJ5cqy2VLOHI07r1uLYO5JmLwD0n6k67hHGDBLrfxlDKuFB5TkYv869Ft0rUkdTpTCNKwXyKYaD9iXLiChoLgEWdrfVwb9tjqfhvMsOqX+kcWAJPkgj+swuBWn9CYXYAFJ6vaJff1HGZQbzpvF6vf9o9HMzwE2JhRWJPsH/Kq75j1aCK+J4puGUmH/69NvmQ3IhtQ7FotkwVQOcuLftv6QKlISxRol2haSDo961XibKVmb9/M8FxbKDjOH3hb50z41+XDPdM8yhR3hi1rXNanNGO/j1LJFN7FSl9pvd1DIRRIeuI+VQWhP3Jp+F2UinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djoLYYNJygzNDuyrNg9IPfSrzLq6JuN+TgtIcELSVjk=;
 b=mWyRfx8gaWeUOqAyeuTAEhjpom6AxNFklEYfTTL2koTnoFYUvQZkmrxdkywlG7R//0/nholJJeHcHXMZgU7BZ4Q+JXAZP7kljH7JYCnhckM5UVVSKPVeQEHAKXPYi9jKqcSMgYNdleX8XAXhd8BRdJS1bgWTnBFevgpyzik7PRCX14pDJYBQmjjMyzbQ+J/4RVcQfp+xOzuy+KkR91qDOH3beYD/QuzkmKMGCQD8EX5AjTXfeTeJYh5Nh6ZxKkCQrXlFnfFDmIVGpOBeQuM2rAdATDnx51xRD+ShdPPsD/fO8WabwxKbVERIkmBjxXm48FaGfEo24WG+DbTtlvA9dw==
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:323::12)
 by DU0P192MB1674.EURP192.PROD.OUTLOOK.COM (2603:10a6:10:3a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.21; Sun, 29 Jun
 2025 08:19:20 +0000
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e]) by PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e%7]) with mapi id 15.20.8901.012; Sun, 29 Jun 2025
 08:19:20 +0000
From: =?iso-8859-1?Q?Ywe_C=E6rlyn?= <ywec4rlyn@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Ta vs Ya (the polarities of opensource) (was fair pay philosophy,
 low-jitter)
Thread-Topic: Ta vs Ya (the polarities of opensource) (was fair pay
 philosophy, low-jitter)
Thread-Index: AQHb6M3bhso1tC5AY0WGzWbFOqh4CA==
Date: Sun, 29 Jun 2025 08:19:19 +0000
Message-ID:
 <PAVP192MB213597C53F7C49240992225BE947A@PAVP192MB2135.EURP192.PROD.OUTLOOK.COM>
Accept-Language: nb-NO, en-US
Content-Language: nb-NO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVP192MB2135:EE_|DU0P192MB1674:EE_
x-ms-office365-filtering-correlation-id: 4c7250f9-6901-4bf0-ff1a-08ddb6e5a5a7
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|15080799009|19110799006|8062599006|8060799009|15030799003|51005399003|40105399003|39105399003|440099028|3412199025|26104999006|10035399007|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?5DfC3zd55Bsbz2dt3S5HuYmBlNYsTLEq8MMi0QlC2zl6/mw6GdrxpgZx+d?=
 =?iso-8859-1?Q?ky66xlPIwrFcUP2/YcinGfF+dMDxtCSCjLpfKQxWH9X9RIL3H/A+iS4bnj?=
 =?iso-8859-1?Q?FzOfN7AuQ3Y3yVRFNNFUyB9fHQJ3kYb4ZTLgEVpsu5NphKh4n4LHy6V9R3?=
 =?iso-8859-1?Q?8Gv7/bB9uND2LivcNqrTyvyLfi4YG1mLF+m3BzTj94CMR+ymYF1Ig0QbqD?=
 =?iso-8859-1?Q?jqvIXgtcZj8VKXl1eBnnxuBrg7x1LCWrvhl6uoO0ZIv+HqbtUU8REJjP8t?=
 =?iso-8859-1?Q?anVODTpIJVnnPTC88xDai9xAIJ1x5pGYUG1gUcANuPqHO0MyngEki8dwtT?=
 =?iso-8859-1?Q?c6EXK3qOr1MmUB+8Vo4iytGKzikTg907uDPzsW0uQmmudUvj7vdnfuKMn7?=
 =?iso-8859-1?Q?K4XhPnC2SZXZakq5TtCyjnHzLUsSL7+eX0XVIU09eFC6HAzm6Ey5Jb8Yj/?=
 =?iso-8859-1?Q?E0hOytX3fgDU1eLMxW/x3NRMe6xvkBLvRPUq/sEPF2mt869m8nxej6Hivi?=
 =?iso-8859-1?Q?NuCGLg2vYqs6an0qiyrVfqhbSVtIfpYCGyyTMUw8MQtdBHSRROgF1mFT8W?=
 =?iso-8859-1?Q?qpmf7E76chlu4DgQMmFxooSyML8IxJzJ2uTUer05KGjbpj2dPGE4pmDi2g?=
 =?iso-8859-1?Q?oDPgbbmi/fW2u7JIDalxUcsCQ6reG5DaSSwgkwbquF3cjr+Htpsi7tpSzU?=
 =?iso-8859-1?Q?Bidurt6q7Gcfp6ilY3QFTcgQZrFImFDl6l2kqHg6lLpwU1WLTdUO1GiJxg?=
 =?iso-8859-1?Q?mNmISMnesRBI1nHXIrRIAzM7gl97a0exAKDUvaT0X94k9bOp3F6N5v4NDH?=
 =?iso-8859-1?Q?OmCtnxwKuRuErlUi1l4FJukWFJhVNivalC9ErrzkoKP82b6sjsJj4uxlAp?=
 =?iso-8859-1?Q?7xvJ1elUwS4QrG/LFTGaNDzl7HYeeEuAT5ncHDvza0HAIa5mvsCbOZgmgq?=
 =?iso-8859-1?Q?zIRpuLrkIZdQv5WcLSfxy5x7qx8L6ZJmNs1gLXt2mO93h2rTjZuNpjGoMW?=
 =?iso-8859-1?Q?VnUDQX4y//qll3GjTAwA2YzdFr2JCpvg7MWVNCH24aeSPZ2x83vyNPgwFb?=
 =?iso-8859-1?Q?OgYtKGUIukQA2tXe7cqSYyZygDEE3d+sU2rt6OPC8rYhAFslYSfHTU1Kzq?=
 =?iso-8859-1?Q?8QWOazWH+c3DuwXvg1Kcs2AxylBpEkG1gdRlcS5xVtwIWK84Lh/hs4uUQI?=
 =?iso-8859-1?Q?rBihV8LWsLocAFgqfE3yA67Kmhly0nPIrQYBFJvqll/a4GyC6X1HkjFBXo?=
 =?iso-8859-1?Q?e0LbfbdLvM76WAE5HDcgLKKXip8Wtw7+4RA3htS5rs120Kva9oh9PBD48C?=
 =?iso-8859-1?Q?SnTc?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?p0/hapkIJVWVxPuoe09cOnjN/43Ba4OC4SMYzCYSCIMRx7uLqEuEAsMTAT?=
 =?iso-8859-1?Q?ub9BmuVpyu6k95H6QH6nutfZQKCra/bdrs5jd1i5le2zah2/LIeGhQeIjK?=
 =?iso-8859-1?Q?v9IrGb+oOmSsaKUASpOTbGFZU9OEM6RpHCQhQR5qVBBUqn3sEzsGkvS593?=
 =?iso-8859-1?Q?jdUlR8tr/KE8uzI4JoHmxuNP16Xm94eDHx0pOif1kUodGL2f6bsF8wvKZR?=
 =?iso-8859-1?Q?AxEu7fW+h8CakudowG98A8WyuRlcRfNsSHPVx0Hxlo1ZfBzLNZwZLFOGFp?=
 =?iso-8859-1?Q?5mrqMUMy9rDkalLQbO/vkZV+p3Tpz1txCicGDzGpZuVdTQw7yFwgydgU87?=
 =?iso-8859-1?Q?n+XOo98jTX6niaDqPClAOdCSb9Ee+ZwiG59FQFvfIi0iychZmEEEzCmGWY?=
 =?iso-8859-1?Q?AqYBQMoXMwS1xiYf82MxwYc2HLFZPdNC0V5uGw2WPEHf0WTHh0rHyzH7bK?=
 =?iso-8859-1?Q?JOxN4cRmU2dCfUPlL0s9puFQ+F3eG0vPeSkB9cCFYTRfW7a72H91prNyNt?=
 =?iso-8859-1?Q?fXzPhauRGcb7dwxwn4RIsBglWJzJHdJUjRFUrU0Y2jnSx7b+8e3mk8hnkp?=
 =?iso-8859-1?Q?7OMFEL7HeG7e1KeedlH8fB8SA4qfsn94VG4oE9ZcsIChFxKU6vpKdNxS5n?=
 =?iso-8859-1?Q?/9Nxx+AEmAK1gAoMStNZe4F/hYRyAB6Xc2w2Ulm9o7SggzTTTwdTJs2G8C?=
 =?iso-8859-1?Q?FLsoao9XDMNSyTmNZtEm45xyJGdFX1kyltNP1l5dFkFlbgto+0rbyh51Ox?=
 =?iso-8859-1?Q?84csa55kGOrJnDXAkc78hFux8q7XjERyUHiDd2wRxEhJG7dwqa3SmN03+p?=
 =?iso-8859-1?Q?9GyOYfRwopm2nuV4Uo/cYp58TxX2yoOPfVfO8DBaAHLs6/CcY+pp3iEboK?=
 =?iso-8859-1?Q?zkSR+kbtWOglGHrMM2EWJ7ZozW1MLRu8IRkmXewAB2GtOUr3vgKgKxJrUC?=
 =?iso-8859-1?Q?k1AqqHwWCgdSyPdQo99QVZBUUfe0nfbS5vhAIceJIA81tuzLoYV/BS8rTN?=
 =?iso-8859-1?Q?o4kN30qbGlfaNFpaLul8TS7XzAKVHdG7Uh1dXT26iLmXx1imwPn0lhne8u?=
 =?iso-8859-1?Q?a3FAAR1g8o+BiWQ260Zagk8/iFLnvjgCfC7qKKJLWHN8aLwteK9hSGY1j3?=
 =?iso-8859-1?Q?9Sk8bHDbKfwHM182ozvs2NJAAI3OrE6AxulJ3eg0tmaKX/IF3u/Cos9KYy?=
 =?iso-8859-1?Q?aw3IpMoJ68UFnXeSXzH3WBYjIWm0AmK1wVdbas3EAyLN797ZprkJlSKaRT?=
 =?iso-8859-1?Q?HJlgVQufKVDf3W98w12bEGS4SAqaDwC9OuxsqaQx3MqWNFIHqp1zsgUuDt?=
 =?iso-8859-1?Q?1hihuJgVuG/C97cdNeGZAnkZ0TtfXsVJ4AUOUyAfwBSSGpw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c7250f9-6901-4bf0-ff1a-08ddb6e5a5a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2025 08:19:19.9353
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P192MB1674

I have refined my philosophy now, to Ta vs Ya.=0A=
=0A=
Ta supports Islam, fair pay, 1:1 reality symbolism and conceptology. (Bitst=
ream OS, CDE, XFS)=0A=
=0A=
Ja typically represents regressions, odd symbolism and conceptology. (Mandr=
ake / comicbook, KDE, Reiser)=0A=
=0A=
I am ofcourse on the Ta side.=0A=
=0A=
My research: https://bitology.eu/ Media: https://www.youtube.com/@Mugoth_St=
ar_Bitstreams=0A=
=0A=
Light,=0A=
Ywe C=E6rlyn=0A=
Bit Budi=0A=
=0A=
=0A=
