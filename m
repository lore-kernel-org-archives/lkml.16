Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazolkn19010007.outbound.protection.outlook.com [52.103.13.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2E22A1A4
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 16:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.13.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749919587; cv=fail; b=NCIRSfvrAe202z/Z2jIMLmiHM2gzRdPiPpn2yBe6Wo+ABnD1vTqf6xwE/651kAmKke0jD5zakNyzwxofO1rRoFEi0O1RGCoqWtkGYBOvq5nZn8z6pRJYnayzxj619OvGespkDoOTDLq4h0lyjK77L/e4BtyAmUMj/+SpgpcrD6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749919587; c=relaxed/simple;
	bh=yfNK5PHMacFA4gjjW8S4qsMWxXrU7BqK0gyL3ZmohuA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=vEUBiSABDzM6mfI1fK65UautG2ZZmEmhErICaVNjGMrqsgKRV7b8dzm0MHHqiQMYEoCcXih1WVer4jYjy9YaXjo5xTeaZGits1eTWk5CW6/ldXRhn1vlGgunp+4dC+Oxivh0VdP1cgZy7YLdoOFh0PTYTsmEyqG28aKS6o1x6Rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=rHmJ94Cr; arc=fail smtp.client-ip=52.103.13.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="rHmJ94Cr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/mBcKOW//0K1GLZcQm7d1K9HbL34mMA6bHq9xO4EBw98OcxYH60vzFu2kP0VsuVwfaw5n44lQ9WLVu8WJe81uIwg8F2LMy9dmQVD+u+WcwaisRvIqHs0WWLXhlcAJVS/l1UP6/an8xdrBoe/KA7JfE2pbCk/UwCbFMrcELjShrNegoWoHAOjDjehiQxTsgnkyqt2SovYeyzDc5XBD9aQf8rkGgaFC/6fNlp1QGcvd1FQyFWadT04k3daBc5XONGqmSaUnm8RcChB6QMkjSmuLyq9I93ckeLnKo6zKMB0HoSR/YVkBnh8N9x1kHRfFa5pHbJg2H99e0TZ/nOx+mS2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zASgnMtwFDrcSYWKgx1gcGOZbJNbTv5Pw+pCSb4vB0c=;
 b=uHqcUY6wijzimzuxCWCY4uc7OprKDA555goydcCyoWV0WgbJQ3uGJU8AYUFxS8DGsBA7nF+ZCk7MdHB31s9u1okyQ494pbERci5rzIWn5ApO+h/qCPPkuOb8t7cu/ym5bfZx0xodnNOVURvx4lIk0VBkR49dK5rGzKtMrsDXp5QuIjjD41HUfCPSE5eP0rWlqPL/F3JutC7q7i8DG+Ej/82sEWmB10AnROespVLQuL0pDDpy2S18Wzn1eOy8JhyL1y2Wx9AE357PzY45hJ5RdTxbBvcqZsWcb7RCwEpFHKGUuqWcPWnppuMuqR/tTrZNLFlBIMBpnSs176TNaOxZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zASgnMtwFDrcSYWKgx1gcGOZbJNbTv5Pw+pCSb4vB0c=;
 b=rHmJ94Crn/KboXr753m553kOQkR7HdAV65lUeSyHLajItOyBBtbgqRAlORiK0PcB9ZGoY5Y0sE0CKb0rrY/tUjzq1oPCmvqGij9PAyPzTZJwEH0NFZX05Wh+k0WtApGy51QFUyOnncxaCmpFAkejuQ2Yiev44xIFiJhyP61ip3FRmowENJGZsumvZ6VrDtmMnBwpgW3XmtaB7Nje24qdXG0ekHyriXc0Px17embPEZ45HKvEopigiS6vwTxld0E7o0iPVMIOLK9lV4g/soC35HEV38EHLneTASaoNpGbBMJQm1zKFNpbLQHh4gyPgdBKj7NqwM3H4VLS+V6jIOK4aw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH0PR02MB8025.namprd02.prod.outlook.com (2603:10b6:610:106::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.17; Sat, 14 Jun
 2025 16:46:23 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8835.018; Sat, 14 Jun 2025
 16:46:23 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Ingo Molnar <mingo@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, "H .
 Peter Anvin" <hpa@zytor.com>, Linus Torvalds <torvalds@linux-foundation.org>,
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
Thread-Index: AQHbxZ1YC+PpYlMrdEWmJA8YTn00c7PUVs8wgC5Mx4CAAGQWcA==
Date: Sat, 14 Jun 2025 16:46:23 +0000
Message-ID:
 <SN6PR02MB4157DAB3E543F77B72167721D476A@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <20250614103055.GL2278213@noisy.programming.kicks-ass.net>
In-Reply-To: <20250614103055.GL2278213@noisy.programming.kicks-ass.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH0PR02MB8025:EE_
x-ms-office365-filtering-correlation-id: 4178aaba-470d-4596-3504-08ddab62ff33
x-ms-exchange-slblob-mailprops:
 mWtqiNqNgRsEhNT4t6jk2H1j8zLufitW+DJsD2kdvmW0nzirBbfLxfs/fNCthWBgQr2Gnd6EjpMlfd1baqpm25+9HWR9u1OXxSCvPVFIBAaeApI3wuGGcpw1KhmfAewOzBxhLW7cObAUQZadi7OKr6HusJVjKUgIn64UBq0zRK30pFUVkhBxIiunDb/QUxfLfQ6f/pBDGWF9DYsLqyMTP7Vor26hQTjnD8TCTSm1vbE24DxXC9xaIHKX3bElNYSFFLQKLTw6Wsqm9faUTM8YBhEdke8ZfwBF3+gGBda0KCzqBf0EGlwMER6RS1ElaogKU3zGd4qaADonT4ETm9C25D3ySJPtyzj1o5c4gepcS8vuRjXRELjtzkUcXeoPinuwhQm0i+jgk0L5kQQ+hDuWC+X7vK0oPV+Wsgm0SSbizqm4imUGMorAjfhb22xAKFtA6ls5fb1X1G4lIrJuE2Yj5Ihc3oxMlSf1GifPzDI09yETC/Pdj0GnfogRfhV6O/9xJ1+fUxMAogOpczLhribSfg1cY2moe1FjKkwrsQ/gWfOrTUhCyRtkchod+ZL5gECJ3J/OF+jDz0aUSY7pCB8H6dSSNkZNWC7MQJ6sCbrLcytGaTAmZBPiAieqlF0Ld+VT40Udv6nYqv6RU08prIQ7NLHwuh8jcT2KY5uHuwQL3aE1CqgHBiniiEVTsIyA+bP58MHhQhviFFNdQXipVjdmmWeqAF7ZaWOLVzgfAWc5+dhAbxM93N156S+oiJ/P0dv7NSicGptz1aZ50itZnFH6myxBXXrDz7Tn9H6pCa0/iVw=
x-microsoft-antispam:
 BCL:0;ARA:14566002|8062599006|461199028|19110799006|15080799009|8060799009|440099028|52005399003|3412199025|102099032|40105399003|41105399003;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?V/Hwd5zThY2hHJStUG00pGyKzZBvTKMtqzcsp8iIXYmNkocWSr9zxqY2ES?=
 =?iso-8859-1?Q?snIaDY73I1Hp+Rf3iZFybs4DTBXD3MgOQQidsa/QbW0lep33RMLz4l+bEG?=
 =?iso-8859-1?Q?92avIl0+ezo9b3NVz//f8h+ugEhn4+2GA9R/Sjp1lbGm6VmGBTvY3lGWng?=
 =?iso-8859-1?Q?X8j8VJzQzxRGjt5lXaB7La8ms/3RwJ624fqNXGT6eLB+1yfVmMWI9c1S6u?=
 =?iso-8859-1?Q?Kwm11AK93YWBzLvRo5Fx3N+Zf4lRkDKGqUQb0LpUMlJPKG51DHbqquY+Rd?=
 =?iso-8859-1?Q?izWaDQwy50m9lnj4CzQDK3ojLKSr5VG/yCAcaJHbnCOcY10m058nSDvInT?=
 =?iso-8859-1?Q?dKKL2moDNA0/4MkG+Uss4vWa2p9PqgJosdPlRbRehM5j033aCsBTxofsMA?=
 =?iso-8859-1?Q?0t4VxDtJysSV2N1ExC74i2NgyDpu87VRLr9lm8sSBcbB0I/rkkYGgL73bK?=
 =?iso-8859-1?Q?V5vmBEV9qF/Bk1LnDiBVOwAQ0q+utz3K0P0NRbRSG6z4PtMzaO/ZM/SuXs?=
 =?iso-8859-1?Q?7swPkCqs+BXwEGyQx7XKxyRMXm0RXpElv56KijJCIjghzJZ11bGcHtk4bQ?=
 =?iso-8859-1?Q?jl4vlvhm0W81XTQPdPLvcxTrafxwiAS1XUNGorKLi55IqvkZUPwlXa/Oi5?=
 =?iso-8859-1?Q?ZNAEFDVgkstOqoWOgu/ulZ//2NNewciRJBv1tu5DBLclqwegiIJPWdu9QK?=
 =?iso-8859-1?Q?RYrxopzUAA2bF14AKm5o0NvYwCsAxjT9uh23kfeNF7uMsQ4pFCo/z3hETN?=
 =?iso-8859-1?Q?d8jsCKEGi/zjalIFcUlF/CrGSpukmpeUamSHfs9ituz05gl7C2R/03/JOF?=
 =?iso-8859-1?Q?GgITb+5DnMtBl/rz82HLFtgBvawH1G61Ejp9O2fMpcf7+tz6pwlMENaVYy?=
 =?iso-8859-1?Q?9XdD7t5RTKlTpr4yTmOlFmOWEoanMGFKY4IlwfTHpsevyLN6HmPnSZGUpd?=
 =?iso-8859-1?Q?cgCZem96c5iTm2avL8Dw+4CDC41uadQKEGMNR/rYPjJrl0cFoObaZqOsVr?=
 =?iso-8859-1?Q?ZC90Rs2hkPatSoF/tVU3+9X6OD1YnrH8EcVHXbYdEwJ1Tj7waLr3Ec1dky?=
 =?iso-8859-1?Q?0Ns0hN1u5XJWgi9HSQb4yhtBHIQ7OMSaBKgPEH55DbGXGmUuNXQr4juvd6?=
 =?iso-8859-1?Q?ARtz1PxDAsIaOCA2hMIWxclyBak4R9wn896dB7FOxNPfYA2/hD5BH2JA6T?=
 =?iso-8859-1?Q?vw9XCTU0+LurT3ysDVYsWU403QBBSxvq6ZE=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?6FOrCVT3uWaq+J/iZfaXS23s2ZVaD9Ep0jGUewWDdXHz6njEloaGiUckK5?=
 =?iso-8859-1?Q?qK8X+ETcqyM4vO7JmJhIOocE6eEnLWMFs95jxUotjeLUgRqU3jFl18emgx?=
 =?iso-8859-1?Q?VpiU8/EKG2Ldc6yt5snJC94Q4SS5AzO0a6TxPQ/2pUz5ezGsm/Xg2+EHs6?=
 =?iso-8859-1?Q?F3VDdh/fMkYItBGfQUQRV1HzhtzzFyHYsfK4sWS0MeobH+T1FMQdcf/72i?=
 =?iso-8859-1?Q?q7eBkTYx430sp6Ws3FZDqmAK7rfz4QM1P086WM6MwG7nxPdEzPJGsrBYuV?=
 =?iso-8859-1?Q?OWNFr4uNyO4EG0E8S0bReDydCS/THcffGMcMi7e98KUbXmhiBi0bP0++fy?=
 =?iso-8859-1?Q?6nDopg7HXv5MtVw2zvuAXO6wKrDxmo9CQilrico5dpnRdMXQkKHCqbt3IU?=
 =?iso-8859-1?Q?C1DCoUXrij1ZMkYPWGypYdxm0upEhGmgr33b9+DEMhN05K9q0Bdx3OGtW9?=
 =?iso-8859-1?Q?0QzmvpC+KhVBqwUJZrNJ1vDVrAxptPn4rT6Ar+FsN6Lhr14bdqgkB/caGe?=
 =?iso-8859-1?Q?Xr5ToouSMMap+0XWJDpdeLHcUeLLwpTmD+/GslMigv4XcfWunvGjv8pa4l?=
 =?iso-8859-1?Q?X7n59JTH0VIfrt8KHM3UKRxYRT6rWr7pZuj24vLBP6+8SZrC6pUO87WyPJ?=
 =?iso-8859-1?Q?qDOXoQAS0YAko+UdVvbz/kMGm4EhH2+CZLO+TuGs/aAYGihR+keEaReAQ1?=
 =?iso-8859-1?Q?dZzW7n3u+w7Ka75eIUF3AVXef7cZyJXmdPoEKkdNxbIGqxaoadh/dc46Wu?=
 =?iso-8859-1?Q?s9nfWnYMylg/45JSwSOfG0k4C9ot9vvmQUpWeWod2t4iL2GVULzLk7xKfC?=
 =?iso-8859-1?Q?xkilzYudtkudzxTqEQDCffIoTp2SJppxY1hptz8yzgtZQjRMT0pMuPhxkZ?=
 =?iso-8859-1?Q?P532kwcfCJQ8OGbARDhzNUZLhhDJLwYgBYiwU5q22KyIupbK9t0dUwxR8h?=
 =?iso-8859-1?Q?YFWxoXOIpdrsgULqUa3fgopU2jeGVf+ezgrlAJ5CWsw3Q51/7PdodHquzA?=
 =?iso-8859-1?Q?BzdVVMLkcra8s6OTreJj0VuN4LSG4v8wGcFMY/8HqA6KN0Ob5fvgeA+F9b?=
 =?iso-8859-1?Q?1H7mgqMqLnggjmOTmv3+g3r2PO4ic+cxdT6lSFiO0P68farEf/NYXeCItT?=
 =?iso-8859-1?Q?fm3kDKpx7hTm54i4FyRTT6duNb6TrEbM+z5CBN4m8svU+5nmaqIATJTyRd?=
 =?iso-8859-1?Q?LKMcQ6mk7jIyu44hOxO2o9+zJyf2XQ+3rauT7JluyOIdw/Lg3mWoRhyvTC?=
 =?iso-8859-1?Q?d5p/3Owlfs6h14D/fZ8KK4BfDQFf3JB0tkjfoKNXU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4178aaba-470d-4596-3504-08ddab62ff33
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2025 16:46:23.2647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR02MB8025

From: Peter Zijlstra <peterz@infradead.org> Sent: Saturday, June 14, 2025 3=
:31 AM
>=20
> On Thu, May 15, 2025 at 11:40:06PM +0000, Michael Kelley wrote:
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
> > I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
> > and keyboard drivers are pulled in automatically, so my previous
> > comment about them being "missing" is moot.
> >
> > But the Linux console for each Hyper-V guest is a synthetic graphics
> > console,
>=20
> So clearly I'm a caveman like creature, but surely those things have
> serial console, right? I mean, that's how I access all my test boxes,
> serial console and ssh. What more does one really need :-)
>=20
> /me crawls back into his cave.

When Hyper-V is set up with Windows 10/11 on a laptop/desktop,
or with Windows Server on a lab/datacenter server, the UI to a new
VM is always a graphics console. The VM does have a virtual UART
for the serial console, but it requires manual steps to map to a named
pipe on the Windows host, and then running something like PuTTY
against the named pipe. I do exactly that when debugging a Linux
boot problem, but otherwise it's less hassle to use the graphics
console to boot up, and then ssh into the VM.

It would be nice if Hyper-V had an option to set up new VMs with
a serial console by default, but I doubt that will ever happen. That's
Hyper-V's legacy as a hypervisor for running Windows guests. :-(

In an Azure cloud VM, Azure automatically does the steps to set
up the serial console, which appears in the Azure Portal. So there's
no additional hassle.

Michael
