Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azolkn19011032.outbound.protection.outlook.com [52.103.12.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56E628032E
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 23:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.12.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747352412; cv=fail; b=XWif6zwolNPeeYdO8aieBiz5wSJY3/PgrxfkYmYlX5tbOg39R1qSBhZc4eZS2Djv/MAqQv+TeIgkoP0YBmTM3ER5aDdStaD/euLvFNZpd92a4vmUSfnjfTnA0kUGCFMWaQuXkq1kqJDkH9AK6j1mZKQSDzuyexX0Zubg1LBw72s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747352412; c=relaxed/simple;
	bh=AqPWKTyzs0vev7KZ27gmnZqN1a6mcgpT0e63Xh5sXw8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fEvywV5zEM8Z9SZjIhMJGj08bfkTIjdrT30CNqZpaGFKz6SYwdTOzZEFvLarchCgd9XzNQLwvVti67TSsF8bIwCtdeycFpxrfgOA3YXg8OBwzNJ+aRpgKdAGdNI+C25vz7ViSnxxbk7Svo2QmbCgB2NBQKL8hu4mAwHaq2nciHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=cX042K0V; arc=fail smtp.client-ip=52.103.12.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="cX042K0V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qQlDnfw46V5+dhfJVdUJKPIq70kyLscFfcXYIAAMit5jcEB3E7eHNUU9nf+ymy4kyAQPj9w2hKN6ZokqTdogqjYkJxg+5d99bqdX9PpXsY2hj+k9MDo9xEghm7NfcZAXbmObzQnm6QiNVdipLDybnSgsCF7+jKaykKFGgxstygUrlbfrwdcce8lN0Ro1s2zhu6YFxktCR9Ckw3jngfdljSQ1rxeQm73dsOQNFdpJ5ppAAx3/Ogpry5UUF4BBnwZeVBvlrqmaJNx/8BQ+6e1Qq8xkT3t8n3zRuZvBW8qsVa/SuiQWAwlQTYbLX+MYM1TSOISLYTq1+dMRC8Eah8LbJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x3FZTwwBvKxiYciOft0IiYNVY6zbA0kvjeDV2cRqvp4=;
 b=QoDokknwDTwyKMOGfjGCf5QQ2faiUgw3YvJcXPHHz/shFohUEVvG60nPPU7m7z2KUUvIa5dcZjncL6hole60MQuxg1RV1NvGLYCDcBdGQl/UPMkIs72k223B0i5phbyrsHVUK11MZAGOvcSCbu8DE9yU2ZW/oCtZbfTBe6joHIg0zKLXO50g2j9RSE/ePiculUPfE6HpqQQnwXB40adDWvpZwhaG+ii4s2v0nPq65ML6rrQfW3jLUbnkfjpg528qLZRdMHB8yd0Ekx/HP+bztaKwZsrmvHTN78VERC0FXKlT0Fu8Vz3/HliAMXad5kYodZLbzjnJWwT67vrttv772Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x3FZTwwBvKxiYciOft0IiYNVY6zbA0kvjeDV2cRqvp4=;
 b=cX042K0VpyFxSX9cQRvHZUlbVYe4drbzz0fbqpnayDTqgwXuqlP6DJcGWAgf++x+t+Z7cU0p9HW/pZr3ln/XUizxdpegmRoZWHrcl48wyNUCSRtQb/UHFNJxiZhK4NqPkvQcovlOn3QBMQFxrUSkmHX8OJf7hMzrFAuH4Tu03v4mOI0yWFzy82epw2WFji9JYOj08p7fMGgekOGahveyDPh5QT+R8BdP61Y5qaVCYqVRMKpll94+JmuNrOe67xpqq+KCgod0qUs/dtQPnhaE52+AQrI8womfsNcSsA8HqOyT/4ldb29NZ8xP/fch9iFa+7tvz8oGO91qfCxwSx2cOg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB9484.namprd02.prod.outlook.com (2603:10b6:8:f1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.23; Thu, 15 May
 2025 23:40:07 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 23:40:07 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Ingo Molnar <mingo@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
CC: "H . Peter Anvin" <hpa@zytor.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, "Kirill A . Shutemov"
	<kirill.shutemov@linux.intel.com>, Ard Biesheuvel <ardb@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>, David
 Woodhouse <dwmw@amazon.co.uk>, Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, Masahiro
 Yamada <yamada.masahiro@socionext.com>, Michal Marek
	<michal.lkml@markovi.net>, Paolo Bonzini <pbonzini@redhat.com>, Sean
 Christopherson <seanjc@google.com>, Stefano Stabellini
	<sstabellini@kernel.org>
Subject: RE: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
Thread-Topic: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and
 Hyper-V
Thread-Index: AQHbxZ1YC+PpYlMrdEWmJA8YTn00c7PUVs8w
Date: Thu, 15 May 2025 23:40:06 +0000
Message-ID:
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
In-Reply-To: <20250515132719.31868-8-mingo@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB9484:EE_
x-ms-office365-filtering-correlation-id: fd6ed6e8-dd02-46a3-5d9c-08dd9409d2ea
x-microsoft-antispam:
 BCL:0;ARA:14566002|461199028|41001999006|8062599006|19110799006|15080799009|8060799009|3412199025|440099028|30101999003|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?R+ss3kH1Y1aMdEri90KynNQGeviQvYPRVKVeAU4xiQg5o7st3rM5xULVfy?=
 =?iso-8859-1?Q?gfB6dfmRU73zpJjVVT9ipx5kuclruWkySSd+0mg26u41bjGORdg91/bQL4?=
 =?iso-8859-1?Q?CJAwSS4cWwg1YioiGhhU1UGdydRdxkf5wDcd8mzZW6AM9uqvhYqg8Ix+Fv?=
 =?iso-8859-1?Q?uw9+4tjd+R+Vu1dXZubM+rzCdNBxTBpm84Xmz5xYP1ovv5NcdvdaLxR8NI?=
 =?iso-8859-1?Q?34bQWRSptFJp0ZC2qoK1YLF303dq2ZYmrdGxZc+/VXaxROV1B6vWgv8itd?=
 =?iso-8859-1?Q?QBlSkzsgylGnifllDpKHpmZE81JJof2NfYhFwdVYiFFXHTBvELjHE3OqAI?=
 =?iso-8859-1?Q?n4MMnbaT7Y/qJPaBIF6AQboMab0Tj0Ef61UuJ0Hil46LqhhCPKcmWYY3Lu?=
 =?iso-8859-1?Q?V8D4zWoiCGiDYzm6je2o/SgtXC9V3VXIN5/JyA+R/IERhruEVRZ3hvzZ/7?=
 =?iso-8859-1?Q?ef12eFgV91/dQ/CbFnVlBLr2vVMFmm5RpIlKlmgsz1A/gp/v0gfQhZeWh1?=
 =?iso-8859-1?Q?SzAUDQQbHu4NuSohs2TqRn6djIKSUwfYq+U6c6m8gZWlXHwXU6R3TdcrDy?=
 =?iso-8859-1?Q?8uGz7h5Ae9C5Bi4yXBKq1nB0CWYGmWCV1LpmnWyaWvdro1XZiox0b1eiWv?=
 =?iso-8859-1?Q?EE5wMnHTdwB77yQUVk4ln9QbtesmyFkDmgio/xVOl7ilDMRlp+WKIVURjp?=
 =?iso-8859-1?Q?tZx3tgLQsfEQEDUnmSvCebOrxJDanapo9D4RYrc+pXtwD5fOjzsSg8/nzs?=
 =?iso-8859-1?Q?jXal5VtDRN740ydhT4Zf6DlY2WmoN4/Qjrrjcl4VpOoO5yukJD+mLDbeNI?=
 =?iso-8859-1?Q?Y7ts2baHQKcV79kXHcqvGt2uQXMWusNzdtaEfZ2ZHtBMW6jo9kIfdMf6Iv?=
 =?iso-8859-1?Q?826/45nH6kj8/MK9sFoizdkOsWHD03u+lwI+JkAl0aLFeXzD537oi4z+RN?=
 =?iso-8859-1?Q?/PlgGdt5TGVsAxyWbP5FGkPmb3YqbZ3ij0lGhFD3NsCxu8Ejxd8DWgcvJy?=
 =?iso-8859-1?Q?pu/+rY4rtvi3/TO4BOYS6s5fh0IBkYgiItv1ty2PXYa1EdfQyBbwnqJlEE?=
 =?iso-8859-1?Q?ssPzT13aw6wXyBZVRRhGfyOHheqGbWsaTPWtqUHYPMkPzMQyu0VlmrBS0+?=
 =?iso-8859-1?Q?ASU9f1EfGifJWo6fdjN1P3UUTW7Z5IJiyveOfCbF7dyb3De0IKmIKGSOjK?=
 =?iso-8859-1?Q?SLqoTRhIEDyoOA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?QZf+RBDzyFFUB0f4jwJZJ5rPhyW1PZcSnv2FHQhfJ97CMJezJSmp72wKmC?=
 =?iso-8859-1?Q?F0nUTBWRZa9TgBIj51cQ7uq/I7AsC5OD+Dt5k4fjPDHnOEyo7vzyw7iuWR?=
 =?iso-8859-1?Q?otl0eRW5bbPaawZ7dFM0M3rjSxou3plQLgLqkOZp1qZNzBntWSdhHkOn6d?=
 =?iso-8859-1?Q?LnYdISZKM/F6iHoUMrSJ0I/SJiYOvka4QRJZMnq7Lnt9fdcWH9tzYeZx4g?=
 =?iso-8859-1?Q?12Tkz9nKmZSQbn8qwpoBIUf1KpepK0MbZ2Tu57mEQx+OKQ5T4XSYSwYCwJ?=
 =?iso-8859-1?Q?/jPDikNinvWZjOZ7lJK+JS41ZzKGsY01VFfL28/qFiTU00KnqXnqVqm8dk?=
 =?iso-8859-1?Q?KSw5/Apa5/B0W0K/weScYrQenY1YF0jaPbY0mKPJfPb35qTRyDn38QTV56?=
 =?iso-8859-1?Q?w5d2rBVQDuI2RrI4b1q8n4QAkslkKf3a/3eneZgrhUzfIItFCVeErcioi2?=
 =?iso-8859-1?Q?cLwZDFExoJ8jFaHkLAQI3sOG7Kkqo28jviLM/8o74oSlv2ZTxIO0y591Ve?=
 =?iso-8859-1?Q?xpPidZXmnbYDtm3NIVqFZV3MV0p//+MFKTGpwkn/Ew91oV+mJ2+EOM/LWU?=
 =?iso-8859-1?Q?f/NwgemhDFiUXWnqn5iat85Azi1ycNC9riJe509fo8COr/Wu6k32U4YuP7?=
 =?iso-8859-1?Q?tSbJTVwJlmBjFYuQWLbvtCE5VBa5JMV/NH4vuIiTdv4cjE69gCbKl0ikzL?=
 =?iso-8859-1?Q?pf4496hS7GgU6ZuHzY6rJH2LEKMNjk2GxMfKB3+KWWxzkZAIlSVDgVdUBf?=
 =?iso-8859-1?Q?MEVoJ8dHNLKaMZIj7y78xHpDg2seg40BofjnGN/LVqw6dZuUYRvZoRAHCz?=
 =?iso-8859-1?Q?os31UXRCx8gUtMtZAFCGyDfnXraGXtgJvvHgW0Tv/CdGr1pP4lIsuoOiBt?=
 =?iso-8859-1?Q?POuAeU86t9zl7JcAod35gMHc9CtsZB7ZXzO+Dy+yezfllDw05vuBo5BtYd?=
 =?iso-8859-1?Q?mKYfDfuBufVhv8oBFNDF54zdr98H69SPWlQMDUbJ0zAm+gFAg0MUV+odpn?=
 =?iso-8859-1?Q?vEbbaPqM7hKGPGLpEPBFiVFTLCjjXeWnKrXcy1fp6JrarspsBiuKzJ/w7l?=
 =?iso-8859-1?Q?TaIAufoPj3prX3Nwj5fcUXacfEaKzgaUgRrTsLE4a78cpIg0fYLxqbRyrc?=
 =?iso-8859-1?Q?EnMqOYi7wRaFGWVrcwb68Xqu7wMXCIkkNiGfB1Q684xXsu8WUN+BJHV/hK?=
 =?iso-8859-1?Q?ANidlEjVLc4Tu73nXR8ROe2zIBlRvtMzQxdVRLRRi3hHh1mlcj8qvhL71r?=
 =?iso-8859-1?Q?kO8wCQGfHV95cJDpsSwTMg2950l90Hylpg6kxmVLE=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6ed6e8-dd02-46a3-5d9c-08dd9409d2ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 23:40:07.0034
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9484

From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 AM
>=20
> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, refresh all the virtualization
> guest Kconfig features, enabling paravirt spinlocks, and
> enabling the guest support code for the following guests:
>=20
>  - Xen
>  - Xen_PVH
>  - Jailhouse
>  - ACRN
>  - Intel TDX
>  - Hyper-V

I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
and keyboard drivers are pulled in automatically, so my previous
comment about them being "missing" is moot.

But the Linux console for each Hyper-V guest is a synthetic graphics
console, and that didn't work with the DRM_HYPERV driver. Missing
the console pretty much kills any usefulness. DRM doesn't have=20
Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
to be set, and defconfig doesn't have it.

So either CONFIG_DRM_FBDEV_EMULATION needs to be added, or
defconfig should switch to the older HYPERV_FB driver. I think we'd
rather do the former. Vitaly -- any thoughts?

Michael

>=20
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: Elena Reshetova <elena.reshetova@intel.com>
> Cc: Fei Li <fei1.li@intel.com>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> ---
>  arch/x86/configs/x86_64_defconfig | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_=
defconfig
> index 156e9490e29b..df786b8b4e85 100644
> --- a/arch/x86/configs/x86_64_defconfig
> +++ b/arch/x86/configs/x86_64_defconfig
> @@ -30,7 +30,12 @@ CONFIG_PROFILING=3Dy
>  CONFIG_KEXEC=3Dy
>  CONFIG_SMP=3Dy
>  CONFIG_HYPERVISOR_GUEST=3Dy
> -CONFIG_PARAVIRT=3Dy
> +CONFIG_PARAVIRT_SPINLOCKS=3Dy
> +CONFIG_XEN=3Dy
> +CONFIG_XEN_PVH=3Dy
> +CONFIG_JAILHOUSE_GUEST=3Dy
> +CONFIG_ACRN_GUEST=3Dy
> +CONFIG_INTEL_TDX_GUEST=3Dy
>  CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>  CONFIG_X86_MSR=3Dy
>  CONFIG_X86_CPUID=3Dy
> @@ -128,6 +133,7 @@ CONFIG_NET_9P=3Dy
>  CONFIG_NET_9P_VIRTIO=3Dy
>  CONFIG_PCI=3Dy
>  CONFIG_PCIEPORTBUS=3Dy
> +CONFIG_PCI_HYPERV=3Dy
>  CONFIG_HOTPLUG_PCI=3Dy
>  CONFIG_PCCARD=3Dy
>  CONFIG_YENTA=3Dy
> @@ -168,6 +174,7 @@ CONFIG_SKY2=3Dy
>  CONFIG_FORCEDETH=3Dy
>  CONFIG_8139TOO=3Dy
>  CONFIG_R8169=3Dy
> +CONFIG_HYPERV_NET=3Dy
>  CONFIG_INPUT_EVDEV=3Dy
>  CONFIG_INPUT_JOYSTICK=3Dy
>  CONFIG_INPUT_TABLET=3Dy
> @@ -198,6 +205,7 @@ CONFIG_AGP_INTEL=3Dy
>  CONFIG_DRM=3Dy
>  CONFIG_DRM_I915=3Dy
>  CONFIG_DRM_VIRTIO_GPU=3Dy
> +CONFIG_DRM_HYPERV=3Dy
>  CONFIG_SOUND=3Dy
>  CONFIG_SND=3Dy
>  CONFIG_SND_HRTIMER=3Dy
> @@ -214,6 +222,7 @@ CONFIG_HID_PETALYNX=3Dy
>  CONFIG_HID_SAMSUNG=3Dy
>  CONFIG_HID_SONY=3Dy
>  CONFIG_HID_SUNPLUS=3Dy
> +CONFIG_HID_HYPERV_MOUSE=3Dy
>  CONFIG_HID_TOPSEED=3Dy
>  CONFIG_HID_PID=3Dy
>  CONFIG_USB_HIDDEV=3Dy
> @@ -231,6 +240,9 @@ CONFIG_RTC_CLASS=3Dy
>  CONFIG_DMADEVICES=3Dy
>  CONFIG_VIRTIO_PCI=3Dy
>  CONFIG_VIRTIO_INPUT=3Dy
> +CONFIG_HYPERV=3Dy
> +CONFIG_HYPERV_UTILS=3Dy
> +CONFIG_HYPERV_BALLOON=3Dy
>  CONFIG_EEEPC_LAPTOP=3Dy
>  CONFIG_AMD_IOMMU=3Dy
>  CONFIG_INTEL_IOMMU=3Dy
> --
> 2.45.2
>=20

