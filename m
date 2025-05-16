Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02olkn2045.outbound.protection.outlook.com [40.92.43.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C63232
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.43.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401262; cv=fail; b=n1abPzG+EITheUhlBLyLWKsVajOcxCJ4vCPQSdxPPXKtZ7ZHrL02Dh1kNfmuh7pKnSdURF7MSPD5q8+uYmmiOySH/aUWOHKdFsuWGYhGc6PcNCetB0GNkQPOujkmSiXuh/l1px/wJLGhLzy1CQxyHUVdC0K2p2gh/+fkOAQPYl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401262; c=relaxed/simple;
	bh=o3/lReg8bdawlF+UMHUr34aE33CiUS4U+Rnty9bbXgE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GrKM2+K3G2OMU0uiXwZMCu5M9BeN3+TlqwuRSJlWZ2SnCxiqi1Y63T9OSLQ8UsXyMTyclLM7uJKfQdjDFMHr0wFQfEcOqncFtTEUX72/NN91uXrvJjq92AmZqSr+sZhf1Te5N3Mqww61bmkqM5uuo68KLbezb8Jq2M2uz/RhXGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=VGXWV8Bk; arc=fail smtp.client-ip=40.92.43.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="VGXWV8Bk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W31pnxpjYx9XHztU3pm2qCHYz2e8UHq8RfiYJ8OxfCgJ+Qzl9WFT4y3cfrtHY3b8J7myL+Jq56B/3NgNI/LrsVHEnicF1IUQlNcf39FzQT+JVL0Om1NyiDJb2OaYu31qPHXTbqAnqMMaIvcpkZ/915zOgxgwxfWxhBQwxB4Zvru4wNM/e4nzc9M7cSir43AG47fV+C3ONAGh7+dg3gWjqGyFpMzeRlwE670I7TjkifjLpmZfBUsO7M/EsYDxS6vzgxQ6O7fVTrBEQSliOboWDA3ELGs37TWwcdO4VrHciUKpw2Jwg226uzDQ9rAnDKTAkvigxOkGbyNgT6I7Cpij9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WQPgHKFhovU25qrydCP85U8CfbzgGAmrcu9VuVAqFv8=;
 b=PURN9K0Hux5ASPWGRn/gfqVS8w7+1qi8PW7Cvvx4etSJPz3uhzJZad9oAUHVlM8a7aFN2NMps5SZH8njV4X6uWnID+/gFwdW/dbAQjbuUxkDz2qbOyKevyxBCAV0B/qFrqZA/9VMSfuxp/5eOtc2Fms9vnf1iO1gZN6Lbrmm3jcMzy27hgw8piSAMQZLZ0JbrPLxt6AOg6bzy1n7g7TbHgg/ft61ryFRolt61uCLDSCY26tVMz+6C1lygU2h3/SRCWcVT72SOZN9xk3rWmCixDjmDzSu/N3h4BDXg8NSU4ezczHbVNczNd8kO9M3S76i/6vMfu2sflKcUJe6xNi0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WQPgHKFhovU25qrydCP85U8CfbzgGAmrcu9VuVAqFv8=;
 b=VGXWV8Bkhk1Hfzn3NkUfCwoeQK3v8JyzOZUYU69LmjQvQlCKnJYcl0t3SU/ulAvCN+nU71uS82f/H415KCniYbGG8/qYFJ8ppaUYdcGzXaZZZK9mGZQNwDZS9vbSO8psn3sWcUbVvQJ+Nz/KBogdBrhcwHVy0XkQ85tTdqvzRI87CYTt5yg+iDCr6pZtxW68VDI6ErxVLkJOvqUszPWw5+o55GfQBIxLTGR0Yc20YNK7RxraFr+GssDqWAWWhGiSxWK+F8plcfMkQT7a+gjJNxy5MbF9mSEJyhCf1IpITJ6ybeGn2TljVsliGEyklHjADmlBQ3ZZ8Njxedi2pyyOTg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by IA0PR02MB9242.namprd02.prod.outlook.com (2603:10b6:208:435::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 16 May
 2025 13:14:18 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 13:14:18 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Ingo Molnar <mingo@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vitaly
 Kuznetsov <vkuznets@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, Linus
 Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra
	<peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner
	<tglx@linutronix.de>, =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Ard Biesheuvel
	<ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Carlos Bilbao
	<carlos.bilbao@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>, Elena
 Reshetova <elena.reshetova@intel.com>, Fei Li <fei1.li@intel.com>, Jan Kiszka
	<jan.kiszka@siemens.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>, Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
Thread-Topic: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
Thread-Index: AQHbxZ1YC+PpYlMrdEWmJA8YTn00c7PUVs8wgACMEACAAFqXMA==
Date: Fri, 16 May 2025 13:14:17 +0000
Message-ID:
 <SN6PR02MB41576D388C805D8AF497ADBBD493A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <aCbuCMCRqScuEJwH@gmail.com>
In-Reply-To: <aCbuCMCRqScuEJwH@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|IA0PR02MB9242:EE_
x-ms-office365-filtering-correlation-id: fac9926c-4172-460b-b02d-08dd947b9059
x-ms-exchange-slblob-mailprops:
 ZILSnhm0P3mDoogZiIYtj6aHx7ik50F026XcSlSp3XWrYpWUSsuMgCr5pSE7AAsPW/UwLdjqtc1w6ZytMkILHO9riZwZo5e4HjXHpCGhlrifsUZRHkH22ueu0fRihdWyhEcdaBUwn/zJd6sYKVNdUeWYo09rrkL0XJPhu+zUKaTXeXVOqUC1emQHZVX5f1Nmmx9eerGNb10xF3xAbp70rOctOVw1z1YduAmLwVZX/Y3lc2NLDbE6WE3FeK7NRDO6O5oOnXXtBLAhipuUv0AOjEC27zKKV1A0cx1wF+elU24Q0qhH+4Md3qSVn4xfW9WBt+/o3Y3cVcHk5Fulh6ODOlAFymn1YwcVpzps68q7fShmZyX7zXlUgOWL3swmFd72zJSy9G1hvaM+fN7FMQetPeg4AmJ4VuTUIJCGYBUsi/3+azrqJFfXmJiLWA4Dne0suZCnXDkLII2jwAMl6DyIbPrJ8iwf0LEeShFwKdAlpJR2FCUKWdpcGGuuogq/ozdq+JTFG89oF/ghbGoyh/1BH2vvpV/20+ihV7UdkOnmhRR+/+ElRnshoKQmNrhkmgApOZ4W+v6nPzLTKQWrGaemL7DN6I1osuEYMtRwP3uC1+0X9o6le6cn4gVwCnhBwz6Se89UZ4N1piF1ykEWqU9y+W20zpVre3B6gVM6ppvoYbVyqg2NlBmeYDtF5ehHzr2Foxplt8lWzrFE001udNi+s5kA0yBLPvGElcnp8mW4CYCD7vhThaOY1FOIl/PA2bT/uGOb+0fjVXtLYltV4Y2xcDwazoMjRf7p
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|19110799006|15080799009|8060799009|8062599006|102099032|440099028|3412199025;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?q6R/ae1AT6NmiGvavaA6tQZZ/emzuvb5DkwhWLTG4a+znK5So3Pvt+OChj?=
 =?iso-8859-1?Q?iAmdOmHsHkl1Pno9bvhqGsyb2EqiIO1Bzt+0WrYbx+iYjIKJFI7a9lBliz?=
 =?iso-8859-1?Q?TI1lp5lzZk0VuNDNXqgej+tsf9x56cvBDxvZlqaX0itDfjLCKJweRwl3NJ?=
 =?iso-8859-1?Q?KBjQngvQrk009+vnuRC5G06VbS7BwXst9g8K6PbIsWV3yCmAgTzcBt0gz1?=
 =?iso-8859-1?Q?P5ffOcFb0FqDB0fifYXcM+Xbw6xgtG6XlZsnn1xzZDatqq77GB3edgAD63?=
 =?iso-8859-1?Q?X2bqUx7bWPxLpKYHp1XiJfAwf2XWjBMqaRkqvn88+1l8QL7kiW9P2gJo7c?=
 =?iso-8859-1?Q?OeSAHCCXK+2mcrIhI9Uhgjx0XwnumUvtvPWX4LtEL8Ycp3q8o8i7khrh5G?=
 =?iso-8859-1?Q?ixh87aqWhrU+5sbKkvnWfR3YefWT42HfTz02WAW9MEY/YoUGh103Jd/DTo?=
 =?iso-8859-1?Q?GqjRCC9L7Uw8Fe4xzUDrDjyomkC/UjANoyepWHPEg8e9DPDl6meo6vlwKE?=
 =?iso-8859-1?Q?7i+pP6S/J8PWlEdtR9cDm+0Io6+6s7/iLO5dJpPKY8nGjTRmpzIXJW9s8E?=
 =?iso-8859-1?Q?oRt3NQy7f9f7+m6jlDudTr3geocTRMXFc/xYK99FwqejdIfZyVrqq0yx/b?=
 =?iso-8859-1?Q?xNG5se1rAqkmiMqkB/qvn1Ip2vzecevO2yWMUBzDDUi77PDxfUYZRLxzoq?=
 =?iso-8859-1?Q?RU530uYSU3KBV7WSGrahG2cHHeInKqh7oGEk8UIy9HTIj3MGm6drM7R7LC?=
 =?iso-8859-1?Q?TelIv20Ydo4gMd15rvmO+WQ0yqmTX1+Gj8GN5VXu84HFgb9cIxX1EQDbYV?=
 =?iso-8859-1?Q?0QuSseHcYTDWtACopa9w8wcu6Z1M+lkRxJRS78yiYvQN3bjMvuejI+WFjX?=
 =?iso-8859-1?Q?xF7vTTFw6nZEz6nZYzk50+HdPFb4Imdi5NBjS6HPQH1vAaqP9/INemEx2I?=
 =?iso-8859-1?Q?rnBCh9MXZD/UbNcBTsDvp23DD+Wx4ZSRuKHL93A+KQjJxIZHnkb89kSWUI?=
 =?iso-8859-1?Q?I9KnqlS36kczwvWpn5Fvaz6VMHOgh0QzKspDEvytyGvtPixRE6hwzNLMbJ?=
 =?iso-8859-1?Q?/VVAkZyVtL7JmuteWL4EEzda2o8hXbjW3n6idtD+LLJ3xqC/S6ELUsoHRb?=
 =?iso-8859-1?Q?LpUSnhdQ=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?lCO4UtZGPt9RX9zK9g74eqdN4xTQm6eXoS9K8ydFsWXFFL5nCj+IfPxk1j?=
 =?iso-8859-1?Q?YeCLUVokUlk9TU9GhXcSFGfvNn26BdTFxuVofgJmxgbRZOfrVP1HDJjC3X?=
 =?iso-8859-1?Q?knCWESK01SSAUa7IBKLOyyTqqjDEqLDqmcx6/b6v6kufvLORDKoBxyg/yV?=
 =?iso-8859-1?Q?alRTHvUxKKXeXHJjdBje52pbw0fcziejm26YcsnMniOYiM9VRykNtXnHFT?=
 =?iso-8859-1?Q?aiooLOjeQy141vRYYn6cVq7YRR2TnITZztBwbwRSlVbyEv0532pSBnqvI0?=
 =?iso-8859-1?Q?Paz84nuAgAJQxZecugzhCH/HBk6wQP2cRsFknJiXNmmTf4uNlyaEQ5H8KT?=
 =?iso-8859-1?Q?d6H4D4O4RXCycqEQN3MKFGrXzZUFi2bbm96tJmUpH5zRqH0YjHDAda/mQg?=
 =?iso-8859-1?Q?q//FyaOmB7S8jgKs/YhPe+vdHv4REzYzdAyRiFgXve+fTQlt31p9k3ZQkn?=
 =?iso-8859-1?Q?2wDWfwyZR4p0TRX74TdqxF38aw2DkNK0RW2LbF7SwMj0BMAcUUcRWPwLX4?=
 =?iso-8859-1?Q?wFUNqrYWu3hZCX3G+AC8fUZs2tzbE1IZqHw0CCHsldz+cLGVHSxDMIAKUr?=
 =?iso-8859-1?Q?LbqXOAzF3KEIrDA9Ml9r226kU7+e7U/v+kYMbM2DaglTBwkE5PMZmnzZps?=
 =?iso-8859-1?Q?papWglUBNfLsfnZde5V8QYWAdCdlboQA/1pFpjh7ZDgZoJ5gS3tkbYn653?=
 =?iso-8859-1?Q?m1o+ZH9hy+Vk4Pe16xFZeZP2YjYWknOJ+133GRhVPTvXZXYEDhpb088XA5?=
 =?iso-8859-1?Q?EedclDxi2iWZfl+8tbmcSufVvyvLOOiC3OlOTHNvWHzEGqFBuAeZcJVcDq?=
 =?iso-8859-1?Q?NgasRdSY3coWpE+1CJZVTrZUXZ0m4fXDAP9+O+cOqu1ACikq+cK5gTpsI5?=
 =?iso-8859-1?Q?xc/XGwACdImBQOxMQewiY18uO2Enu+7IKMwrGL7cU46ZB//1WmWapsVtV3?=
 =?iso-8859-1?Q?A6DVWdpmmW14Puld6ADskZFVpXDVbcqabts+TtXZhWzDgEFUtynbysN3JO?=
 =?iso-8859-1?Q?u7zboKNhBGdPYKUy7o9qUj5bYL9CzbrcftC1ivECz8xkpIo4fLHGebbU33?=
 =?iso-8859-1?Q?Z6ksi3FE2gPMM7H7n/4lTtyu98KppNxvhVicpkBIO7z/GIotp8UOi2pTyA?=
 =?iso-8859-1?Q?161z/HH9rFWLnKwTu/iBSqsc9+npC8A71yPgzVs2KJYFHbsnh5NiUm13Bg?=
 =?iso-8859-1?Q?Lh2n0IJ7bEdrXPl+QCcQy/M73Yda7mopw3gTnA5FAZfBUKxYLfsxYS2Ro0?=
 =?iso-8859-1?Q?PW96YUhfuOWn6CyRw+VUpl/RW/BjGVMAjslEqhhbQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fac9926c-4172-460b-b02d-08dd947b9059
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 13:14:18.0050
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR02MB9242

From: Ingo Molnar <mingo@kernel.org> Sent: Friday, May 16, 2025 12:49 AM
>=20
> * Michael Kelley <mhklinux@outlook.com> wrote:
>=20
> > From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 =
AM
> > >
> > > Since the x86 defconfig aims to be a distro kernel work-alike with
> > > fewer drivers and a shorter build time, refresh all the virtualizatio=
n
> > > guest Kconfig features, enabling paravirt spinlocks, and
> > > enabling the guest support code for the following guests:
> > >
> > >  - Xen
> > >  - Xen_PVH
> > >  - Jailhouse
> > >  - ACRN
> > >  - Intel TDX
> > >  - Hyper-V
> >
> > I built and tested a Hyper-V guest with defconfig.
>=20
> Thank you!
>=20
> > The Hyper-V storage and keyboard drivers are pulled in automatically,
> > so my previous comment about them being "missing" is moot.
>=20
> Yeah. "defconfig compression" is a bit non-obvious, as the file doesn't
> carry indirect select and default-y-enabled options.
>=20
> > But the Linux console for each Hyper-V guest is a synthetic graphics
> > console, and that didn't work with the DRM_HYPERV driver. Missing
> > the console pretty much kills any usefulness. DRM doesn't have
> > Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
> > to be set, and defconfig doesn't have it.
> >
> > So either CONFIG_DRM_FBDEV_EMULATION needs to be added, or
> > defconfig should switch to the older HYPERV_FB driver. I think we'd
> > rather do the former. Vitaly -- any thoughts?
>=20
> We can certainly enable that option, and it's likely useful for other
> guests as well - see the delta patch below I applied.
>=20
> Based on your description I also added your Tested-by tag:
>=20
>     Tested-by: Michael Kelley <mhklinux@outlook.com> # On Hyper-V
>=20

Sounds good!  Thank you.

Michael

> And pushed it all out to:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/kco=
nfig
>=20
> Thanks,
>=20
> 	Ingo
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D>
>  arch/x86/configs/x86_64_defconfig | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_=
defconfig
> index df786b8b4e85..15c6b5f3b2fc 100644
> --- a/arch/x86/configs/x86_64_defconfig
> +++ b/arch/x86/configs/x86_64_defconfig
> @@ -203,6 +203,7 @@ CONFIG_AGP=3Dy
>  CONFIG_AGP_AMD64=3Dy
>  CONFIG_AGP_INTEL=3Dy
>  CONFIG_DRM=3Dy
> +CONFIG_DRM_FBDEV_EMULATION=3Dy
>  CONFIG_DRM_I915=3Dy
>  CONFIG_DRM_VIRTIO_GPU=3Dy
>  CONFIG_DRM_HYPERV=3Dy
