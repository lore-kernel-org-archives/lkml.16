Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazolkn19012042.outbound.protection.outlook.com [52.103.7.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FAAFC0A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 01:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.7.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746668602; cv=fail; b=jR9v6rO3jDJVqgUFs9tliWsATvF46EXKLdMr2GIu3CsXLPN2W0RhElVE1VeHksnLzgizWamGUAXZHtRQaRK/e9iss6uVrs+qCRDVfh5ifPDx4uns2m7y2vjqwEDxhKqWhuTESPt0KYM6wO3Sz7b+RcCwBLG7Vn6gTb18VxoFYQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746668602; c=relaxed/simple;
	bh=vrZdvfR8U94m+DJN++U8sjSlc8JisCbvux+ItqZacTQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XVnIhjQiQw60BF63BFJCcBrOlLV4VQopUSWvHO1I7EucinDbUKFo29y4jUVnuzcP3SYFI4cDbWwRtid7jAfogymzTVQCc9bGcpWTERTgcVKsp4HLDz19PMUOJKldExgPICzmdQBz8/eeE+FKx+X+g48DIsj02Q/O83JZ8RfD35A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=oRxsntXg; arc=fail smtp.client-ip=52.103.7.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="oRxsntXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gGjfRMLQY8YOMUljoAZnKP2iWYvHQ1TcPm5bkwKAsX0N/2MVC8b8baq/koD/o43hWDCgvmxgUWz3JMmIRu/hA8mr0hirt50ZkkmL/L5onP8vZGO34l3hXz26nIDcZ+Y7F7NkF+1d3HJWwzYX+92ezswgjhQTZazW028WN5tLZiilWmox4SbqgVg1+S5SW8MN9sd0cbPikGHcwrVm225nPktUdJN3oHzOto0u6079txjp5/fy68YgOVcE//r6kdRfJsukKu1esbLPrSVzIB+C1EiPwlNUXqH9yqgsnlmPVt9/T2PzNZqPAcoPnWhi6uEPGtWo1Aet9Imi7JPKqF6rbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVU7gX6Pxv6guD88z3OiYCtquiVo3hongWxtHwCNXPg=;
 b=UJ/nR7+o5aTScwOZnwaKsqqpHEhSQJOpGbweSsKjF0ePfsKOe5WY74pFJUNrFtVbX8RtOJckagiR+xndjlnyrRBEZFcKygUpM9nO4Qmr9eUxUfrmsqnB6+FrDi4Jy17UIHxkCP/mu+dSzGIueTgx5sA0gQdvBl3RswPAMxskrXy0yhfALpE6LMERg6JMtrH60TBHtTG0VY6KWCTIIZ/z3aOIUKrOCKmQJuxDnV1XND845kpXHENBxxyD789Q4pX7pUSFBBWJ/Z9CXAgXpiqLWau2es18SgvqUznnqXNCyzgUIa0+EWWLD+AMmMZgoSyAIYDaIZtKEw+i1srWfEGuvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVU7gX6Pxv6guD88z3OiYCtquiVo3hongWxtHwCNXPg=;
 b=oRxsntXg0EL1PTf4c9XM9vjQJ/xFaGYRIc7+AGwUpIAJq4KzJu+jXV6+IuDVN9nO4bUJwF0Mimh/nbwezfWuSg8d9NsKkJQjWOxclJnSlsWVZ4SCwM1+XUClbCJYKKN0qIMwvicvjFfJbwlIawYiKfXTKeGLzk/K09P2xr2H9FG1ra7q5Rni1m1MDJ60eXqH3N1M3jygNV8a0J8ElSUgG2ltUdpLAmkeKrCRPXx+SPlV0IYFy2TCTXVbZeOXwjp2BBUovVKt7q8V/WBpRngWMZ5EGnRziFqTgbinnplLte10ONVzosSerRmkEq92sDcOHes6HyBv/oIJJS60jth11w==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB9127.namprd02.prod.outlook.com (2603:10b6:8:11c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 01:43:16 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%3]) with mapi id 15.20.8699.022; Thu, 8 May 2025
 01:43:16 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Ingo Molnar <mingo@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "H . Peter
 Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter
 Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Thomas
 Gleixner <tglx@linutronix.de>, Ard Biesheuvel <ardb@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Carlos Bilbao <carlos.bilbao@kernel.org>, David
 Woodhouse <dwmw@amazon.co.uk>, Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>, Juergen
 Gross <jgross@suse.com>, "Kirill A . Shutemov"
	<kirill.shutemov@linux.intel.com>, Masahiro Yamada
	<yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: RE: [PATCH -v2 09/15] x86/kconfig/64: Enable more virtualization
 guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel
 TDX and Hyper-V
Thread-Topic: [PATCH -v2 09/15] x86/kconfig/64: Enable more virtualization
 guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel
 TDX and Hyper-V
Thread-Index: AQHbvqi7/pxO3B9zxke3gU1wtmt6X7PH9uAg
Date: Thu, 8 May 2025 01:43:15 +0000
Message-ID:
 <SN6PR02MB415751056C485BAFFE617EB8D48BA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-10-mingo@kernel.org> <87msbp278e.fsf@redhat.com>
 <aBpArFOCEhP5ZESO@gmail.com>
In-Reply-To: <aBpArFOCEhP5ZESO@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB9127:EE_
x-ms-office365-filtering-correlation-id: 9efcc0ca-d3cd-443f-1726-08dd8dd1b3b7
x-microsoft-antispam:
 BCL:0;ARA:14566002|8060799009|8062599006|461199028|41001999006|19110799006|15080799009|3412199025|440099028|30101999003|102099032;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FqQhuMWWJIdZ8ygdEYHq2YotXvpFg1Lpd9tiyiBWILcDx5orXFKD9Htuu1hp?=
 =?us-ascii?Q?59qwAhKwBt7PSRgeY0Re7bF6K7vCW5LgIHLlRK/U9ddl7PL++b1iAJP4HkCF?=
 =?us-ascii?Q?V4vfcT/bF45QYi9/iENqm8UcyRJJGA9nWsLxCK7xEllJXKANi71LeakBPo3a?=
 =?us-ascii?Q?4h9fug8wR6+ZiKYUnQK3Cy95On7fbb0/5bFzCQnHNwel8EX1ubrcHAjcyIqn?=
 =?us-ascii?Q?tvPtNz8Dq+vMCXpSMNPWYYWz2HxqYjA1d6jbehN9upcIHCA8EoRZPfA53Fml?=
 =?us-ascii?Q?pr2GUMh8Sh+akG5Y6/yVYsreoNIeSTht7zUwZ5TbYoEXu6bXRGjj4GRzUmyS?=
 =?us-ascii?Q?oghfq6KZmwKMboRJrheZQ0NBrorz6jJWNujgL27vHWVnR5PPRR7hPScZLw32?=
 =?us-ascii?Q?e1UWGRu7Io8mp75YY10bKdauLksEI1YwTCjJ5AWCWhSinOeY5yloajRy9x34?=
 =?us-ascii?Q?VWIl7M9PpIvnJFeenBjN9W7iX9dDxIy2MpyfbypF298MJKdDNMqiTEF56F6W?=
 =?us-ascii?Q?bcmWr53isClPAM+AHj0PYPArN8TGVmIeqf7Vn8QnxrktjKavjYDm4cgoN2yn?=
 =?us-ascii?Q?ObPtXnQF9cvAJxIl+XDXlFkvohR2KP+hM3WKB33ZACyWzMciklHtkon3JsIT?=
 =?us-ascii?Q?jE72VLjvx/1dGvb15B0HOgLHJDaXmlVEQJjLkyHJhhn/49KhBKGSsLaQgyv7?=
 =?us-ascii?Q?ugTtk0LeCcVLgdMHzvaTa66KaYxkKJyVi5b8vt3yuSPY12wMSqwBzDJwTQYf?=
 =?us-ascii?Q?wJPmxalhMZ2VWxBUKn1PGWHFVgkoLDztRZ2RXN41ktoziAvFVFviWilkM+Hy?=
 =?us-ascii?Q?3bqmBQpxNXso6C2WpB8jo9h48snR7f0qgL0bxRwx2W5+mgDsXZMqfFJr0A5v?=
 =?us-ascii?Q?dU4xCa/e2tiF4dwRwfW1KOHKiCtltwxGWRDEswxVVcuSp2mExkXQsLB+diFJ?=
 =?us-ascii?Q?wMp/0hEwaM9Aoy4uosTjQx+242bD3cG92miI5IEBPQ6aTkZUQDxgyolqgGt8?=
 =?us-ascii?Q?LYo1ukO7LNqtJybNfY1NUgyqSmt/fwphSM3+x4XzH61lsD4QgzHiXr8/K2Sf?=
 =?us-ascii?Q?XCb4/h6JJ8Yf6Gn3bepEwkhzim+LCqj7RsD5uBL0iMN50qIOiOvWOjOrIVMY?=
 =?us-ascii?Q?HSKmKQ6/UjMXLoHxzTFrUQDznKJ0B72cHA=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?sAy6xwHFPwgaeO2fecvIIwV2ervxXN7DwOMX8PF1nQyrAwLexNP6FtDlhtKo?=
 =?us-ascii?Q?+udinSy3GD0hl80HUGvMSD9QviWGdc9xRLdAQv+l6jlVmH3CH1k99/EqENR5?=
 =?us-ascii?Q?J8ZAfuZqIs0wFI9gQ0YmJa4he67EzzMN0Sc+gNoBVpL1gqGl+xIeQHUzSUn/?=
 =?us-ascii?Q?dUXLkR+DFcujH/3XdvEVv8DQLPngRShlWjiPjDNQEi1w9MptsqNNFDDWD7oK?=
 =?us-ascii?Q?iRGn45yE9cPduMHxRIscg/9uu9Orl2YQtO1hMsEAWKc3EO874LSeirs7JCDQ?=
 =?us-ascii?Q?Zr6SqVSxZizMFF+VAfO3laDHZCPEO8oy6tGUxcu2vv3pm/QfrV04oVqIJnf+?=
 =?us-ascii?Q?YsDmkgpAhqVNXAUQPZJsO/HMaqu6/2Js4ss19QkUkNUAdclJ3RS9ySL0SUyh?=
 =?us-ascii?Q?eYUW7Ys0hKV546KieNnhCK6uH7ZdPacGsEUIsi0XXpy2e5UBhjy/u5FXxsvO?=
 =?us-ascii?Q?Qbq1kzXDR7w7CEuOUYGEaogDwRcwAYmrK2ZCc4dPjXVa9fitqWGgWnD3STZb?=
 =?us-ascii?Q?UpBsCmnkFR4zrQhVkmvReGsQ75SNAe6XaxhKW5ZjdchTYsCcrVkJh/fV13bg?=
 =?us-ascii?Q?1QRwzMqRRCtx61hAK1c4h6QQ0Hj9fp5IhLAcSEA6v70InIUOR/Z6VKIbrtK/?=
 =?us-ascii?Q?SWkscaG6zWYqqL99sFXQUpP09xpMZGCDVySVIzm1r+CZKpKCYbGC25o9tN2m?=
 =?us-ascii?Q?JkCDTzijuQYN476q3vOwxlO8HPFZ5b8TYtyj96awW17Sud0Oy+oy6op4cW27?=
 =?us-ascii?Q?p06wl9QHcSN1jTrvqsB7GSkibuinALUxLrUO5xQ2eK47U7HB+JVVCDEpQTVz?=
 =?us-ascii?Q?q7hru+tCKfAl8WGqElkvED73YimwE0g0McPNRRiWHZFzQTsh3lv9Miwd6n/P?=
 =?us-ascii?Q?lhPTm+jAvhtn9Lp8etWDlV+WdGNj1te3vjfRUUkgbtxi3zo6y4eMak+7ildk?=
 =?us-ascii?Q?lCSAhfSFJYh7nVvaUshHOrFFwpLMG7oT++kDJuEbsa6dyunMrd/4JEQhVNh9?=
 =?us-ascii?Q?8cRQoyZnb2Gf9Ut5HONq2Cm1ztbBcCzKbRlH8J5sXtOBd6OfMaor9f3/CBxM?=
 =?us-ascii?Q?UR9DlFPLQ0Bs8ausi0cXaVGGydu+XzILS0VABDF1cm5+BJenjo0pAXnvGgWw?=
 =?us-ascii?Q?032lKnvigKwUTccLQJu4aAftWC3pPe5D/EZjfMYjSAV+vQ/PXxFL4Q81zOVR?=
 =?us-ascii?Q?tRQLBZrWHZkTXvqEfjJzXJdQV+T+PCeLQwzI0+R/Juc687jdrkIk/dFwxfk?=
 =?us-ascii?Q?=3D?=
Content-Type: text/plain; charset="us-ascii"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efcc0ca-d3cd-443f-1726-08dd8dd1b3b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 01:43:15.8636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9127

From: Ingo Molnar <mingo@kernel.org> Sent: Tuesday, May 6, 2025 10:03 AM
>=20
> * Vitaly Kuznetsov <vkuznets@redhat.com> wrote:
>=20
> > Ingo Molnar <mingo@kernel.org> writes:
> >
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
> >
> > Out of curiosity and to get the idea what's good for defconfig and
> > what's not: do we want to enable Hyper-V and its drivers as well? I
> > think all popular distros enable it nowdays because of Azure. E.g.
> >
> > CONFIG_PCI_HYPERV=3Dm
> > CONFIG_HYPERV_STORAGE=3Dm

It looks like CONFIG_HYPERV_STORAGE is missing from your updated
patch below.

> > CONFIG_HYPERV_NET=3Dm
> > CONFIG_HYPERV_KEYBOARD=3Dm

Also CONFIG_HYPERV_KEYBOARD is missing.

Michael

> > CONFIG_DRM_HYPERV=3Dm
> > CONFIG_HID_HYPERV_MOUSE=3Dm
> > CONFIG_HYPERV=3Dm
> > CONFIG_HYPERV_UTILS=3Dm
> > CONFIG_HYPERV_BALLOON=3Dm
>=20
> We can certainly do that. The only reason I missed it is because
> CONFIG_HYPERV et al have hidden away in the 'drivers' section of the
> .config, which I didn't examine. The other guest support options are in
> the generic config section.
>=20
> Updated patch attached.
>=20
> Thanks,
>=20
> 	Ingo
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D>
> From: Ingo Molnar <mingo@kernel.org>
> Date: Mon, 5 May 2025 10:49:11 +0200
> Subject: [PATCH] x86/kconfig/64: Enable more virtualization guest options=
 in the
> defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and Hyper-V
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
>  arch/x86/configs/defconfig.x86_64 | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconf=
ig.x86_64
> index 156e9490e29b..df786b8b4e85 100644
> --- a/arch/x86/configs/defconfig.x86_64
> +++ b/arch/x86/configs/defconfig.x86_64
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

