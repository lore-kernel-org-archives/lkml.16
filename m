Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2086.outbound.protection.outlook.com [40.107.20.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4CB23B0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593527; cv=fail; b=N3Dh73EXALADWR6AulzheHz431+7ojVWeyy2HtaJ0EVOJuuzLw5naemxXC54eNRYJbu+PBwZqhbPHtqNKQdm69AomurliG38O7YEYMJcuamPI2knEULw5PeI3UDs9RZSvIChr7/hpIeFehKXJ2MoOjzM4xA9fnK7loeYS/Pd1Mk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593527; c=relaxed/simple;
	bh=ZT4Y4QCGybynER3Vc+y20LJkLZ7MBwWA5Gm5ezYBKD8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qRUUx46rIiYbGofXGcf+RYqofdsZ6Q2KLGO2ETr51qgbXt6hZgsVIZhfuK2beG6ox/pYCrzFD2h/DuQ1cHtAbPcugwl358KnyxlDUF9R2aJvxEEhbmnLji9oF69Sn4uWhirxfNNVn2fLDcAsKcL+hAnqhG1G+0OyxDlyTJPYqyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fdGzQeOY; arc=fail smtp.client-ip=40.107.20.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fdGzQeOY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oqPgEAON+j/pWAFd3G2fNA7+sLCOcBXN3a9PIPCjP6FkyrLOpm8vXfc7emClSi1+TqbeBM2JPla1u+5zY9TAhPseI+5RexGN/7g/IfAXj4VluvUXyEA22NfGSksk8I9GyGXTdknWaBz9nedoMrsCx0BGkVGQDnL5hxkxqnE037V+yho4HuMhfhsueNJiYDW4lRmOQLoJlg9KgQxujkbCo4OwJYk0ztpkoP4HIZZqTf13fxKfgRfHSDhe6Vch2IaI0aFSJ3shIekFgmPimFNG0OblcRiz+yuj0oKzFVQr1/wohxhDD9CYmWSq7SbgZwv6wt3OYlkDs/Tpfm0nH7m76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FdtBQT0TyeO8ybB0Y8yeaop+zyKZBhvpoRFeptzXA64=;
 b=jkVKAbOiOiQ3ezYoKOcQXxQzISoSSyhNOeEy0UBbBCbs0nF5RA2okW5B46BKganPaXJ4wyQDAz1ZFtdljhqr7yrqStOIwRVy93qsP63giIWleZ4nNZdA2ljBMOPXYod2+gpjAvY1AAZ6JoRSD+b044m1DOI1qGQInrfu3MO1kiW1PpMpaQr3DNJu8qLkGaWXymoFe34FMQg3h5IQkd+cpxvOaI5UBq/XhVZ1KWi03C1nMdOgP/glUtsNOpe5r5Op959iXG618errF4l68qusF0K8cqvyVoBNSlly99tz/pgRM4kchgtyIjmFdlTVUoWWeVM8CcKJneonxF6nzECmew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FdtBQT0TyeO8ybB0Y8yeaop+zyKZBhvpoRFeptzXA64=;
 b=fdGzQeOYeMExOIOiKQLBBIqoq+1l1lhUfMv5jj3aeGM/QAADebX3ppojKu4pLiHvVoyd5Hi1r2QlElEcDPK3nqSyehevnG/5rGv8S+j2llqInJE+PEL1URVM+xVbxHjZUvGHTNIPUqs0gpvia9wY5RQlmitaS38xPlM2zkufAzvNI3nQHdJdGH+hPLAZos4sZZ3JftJXrf51nuj67kiyBNSB5ATyXFmp+kVwID/4wUUhZvznF+o0WKgLS7FhejyV2w9ZJgzqcjTAfAK5RZzOOs9xV4X4eLbo1dzkd24pVqfwSTGaEl5voj1UOriRoQSqrTgnblc/493CqkegrcrtGA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AM9PR04MB8747.eurprd04.prod.outlook.com
 (2603:10a6:20b:408::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.54; Wed, 2 Apr
 2025 11:31:59 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8534.043; Wed, 2 Apr 2025
 11:31:58 +0000
From: Carlos Song <carlos.song@nxp.com>
To: "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "ying.huang@intel.com"
	<ying.huang@intel.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "david@redhat.com"
	<david@redhat.com>, "mgorman@techsingularity.net"
	<mgorman@techsingularity.net>, "ziy@nvidia.com" <ziy@nvidia.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix freelist
 movement during block conversion"
Thread-Topic: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Thread-Index: AdujumZZ34Xk3NDpQVWRuUIeWzcGfw==
Date: Wed, 2 Apr 2025 11:31:58 +0000
Message-ID:
 <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AM9PR04MB8747:EE_
x-ms-office365-filtering-correlation-id: 26f699db-3367-4853-6f2a-08dd71d9fab8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iS7U+9XZCeVFM4ay3G657VKKYwQistN1LoGE9ZjRcIpuP2EMsZsowOJ9MWzq?=
 =?us-ascii?Q?YpKm6a9OA6kTZjo3FOvWDZh0NbdLDI0UoVOvPXYxtskYf3lmw8HpvHmhZUAt?=
 =?us-ascii?Q?Lk1E/fXKPDxMjPzzNmFNgWnBrk3OVeCXpslnmaT+6SmVLu5SljF8lcF0lBtL?=
 =?us-ascii?Q?o+sRYhDnoDG+V5KdLyhg7iKoxl6i1KpdRPaqX0WCRTKjjDBAT8iMBv7DmYDW?=
 =?us-ascii?Q?YORYMgpgQ835Rj0Hq0w4eJY3iAxHDW0bAZZ1j1KIgc88iv63brLrebpNJbvD?=
 =?us-ascii?Q?vcpPEHmHbIyL0djqNxh+/+Zndraf+1QPo4uXN6giz8ULLLeIPzvYiwqSDqIM?=
 =?us-ascii?Q?VV02EwApQXCU3ebNQg6MlPAfozthcrmzUv1ywkpih7cvcr/M/ki1hqC+Eid9?=
 =?us-ascii?Q?U9XQlbZcVNz7AfMMwtmmD77Z/sPIEg5dlJIBgUqsEb71tmXl3FshSKr7eGPr?=
 =?us-ascii?Q?LEthFcGpkbPCUApWq43KgT5tk0nArUPOAmTfqcqRPDbkxP+Xz9xTukrq1N2i?=
 =?us-ascii?Q?/GoT2JY7MCJpkOKFY6/4SPd9TkJRD+mfkw/JwF8Kd8fayOVjn8yGRHUgbT6d?=
 =?us-ascii?Q?zBLcinNfGMcxQGchPOEMUlGkdc4mmgcSYO+37FrwdhM89BDo0Jso7RxocJNy?=
 =?us-ascii?Q?eAG1SoMcjnjLgHmhUJXG5LqaT3eDqT0zGYVEFScovlqWhPNpI+MjhOQ5l7Qg?=
 =?us-ascii?Q?NURAE+snFRzeWl3nJUX4zQRjt3DecG8yDLskOv7GGFSFYZpTzaKj100x2KvC?=
 =?us-ascii?Q?NjtlNU51IpVwyAFuBd36FqBxvz8UFfvPBoJ6nzEAd2LytlnICH08d9OdYufD?=
 =?us-ascii?Q?E+rF3N+avm/FBL5gQpJm9xpiRfwVGDSK5A9RQfV1eAO/UMtQ5CnyuCG8gIfC?=
 =?us-ascii?Q?OPc+bgle8RDDRKUj3HtP0VJ79wxfYEq38jykb4RLXWbAatSX4dlciFiyqxac?=
 =?us-ascii?Q?TG3Rdj7VkR8pj9gT512cotaIyjt0Ri06b3KTfiu9neN/kfogqIiWm4W0l3ya?=
 =?us-ascii?Q?rAbvj/kgsMXWzmk91e3IA6zDsWQauZ3anbh7+ywmUGVD8XFO+Lvssg/pYxPq?=
 =?us-ascii?Q?dQ3R/wrKu5vnddR6bnsZKp9ZRgftjH52XSacazLG+hwPV9U653cMlgJ5Eq9W?=
 =?us-ascii?Q?83QroKxH3emkng2t94JuiB5YfmvHDPgX1AMqrOtppxGS0A4Fr1kXwolwL5WV?=
 =?us-ascii?Q?7h25J4SQ6jYo/Qd3YGYoCaM5AHvSKMXZvnM6JmATZrUp2yTdRUiehSjA+zO5?=
 =?us-ascii?Q?u4iCPgsYoOg84TceaUHgslWn2YyT427FldUgo0e/FaNcsydouT9jR1Akp0/M?=
 =?us-ascii?Q?ig0ur+exTfGRqyYU96Icr9pGyCZgJ+eKoI/jwKyJar5JAdPlcdZ6SxscwMjm?=
 =?us-ascii?Q?hkgbpd6hSfFVRlIAzV2QRZ+6v0ot?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?eiAl22eBwdcFlBIklaXBTMJPkdKKU1nW/SL/UAnxIxP6Qu/jW6355fIM5CtG?=
 =?us-ascii?Q?I8m2mg/hzqQKPF5ezbKGZgDC9xf7w7zvVEG5OLOql8hBMvG4u0twgjw+uorZ?=
 =?us-ascii?Q?kt1sRqFcQAGAtEvs85+EF0VIQvFUfT1bH+NC8bLllM6g+ogB+WM6tPkAJmGG?=
 =?us-ascii?Q?3Fj91bNAnQ+h7sB4shH7JXAtIuz9R0Vx5ViDtAX23EiVay3IdVVjnSBh2hEl?=
 =?us-ascii?Q?TEttu3BwyL3HcqeBapdpUpKn/GHqS9v1DW1yDAxTBg88AefpJcsDcX14q8Cu?=
 =?us-ascii?Q?hDkxlACr8dQ/hkGxUaz8eYKJxeinERsx+ADxhn+ZWy+22vuWygkTQjzLmG3A?=
 =?us-ascii?Q?n2LZndDBOv0hmHf9t0Tdd5j58aOfBvO8juGldCdWLGA4ejuueTC/eYZXnJZr?=
 =?us-ascii?Q?RyoBjMQQ3aG2n4fjE/dQLzA9827Z6Vldg4DS6HgDNzSF4EjnQXUAFPjpo7es?=
 =?us-ascii?Q?JFAVGo2Cv09/FFXzOFqqP9g9K1vZDD2/eHUHfMtF6oAK4Fb4FsPzgM2u8i5a?=
 =?us-ascii?Q?xPyhZhf07WszvvICacEQtN4qr9hQPS+Q4kP09M7JpNqyU8eBvG6QPfBRoqLn?=
 =?us-ascii?Q?/cPoK6cz7K9I/jBeELDBYezZZrKKQrVFWdL5KvhKGdByqEd+KiGtEff3i6Tu?=
 =?us-ascii?Q?FPosd+8a/qjdmgGmjqOmoF1PkFpCxmO3xTHTM8c5ouF1+ZzCL/O4Ux/nnV2+?=
 =?us-ascii?Q?c0MStieXmVc5nrb2t+GPtDhTZNaV44nP0jinZxSE+Re0WioAcFrymsWsUBFK?=
 =?us-ascii?Q?3KYhBu4J3LGtoCgu47DnFgXb6fMBuPjyNOimLz24Gwzc2A/4srVTuo3y1yIX?=
 =?us-ascii?Q?I4hAvPw+K4o/Oeifs75OMs6zXmmET1BMgUG6n3oh+HjiQ0mu7n4sr0mP56X+?=
 =?us-ascii?Q?WnVjW8pwQXtX1SiH0PAW4uwfRuUnDgEk6f/pcr9kIPuzcj6086zjbko9r2Pv?=
 =?us-ascii?Q?SgJqTD3hOK7mw3UHbli4K7lGb6mctxd0BCwXrZ6sBX+aG4qUTjifVpvrI8j+?=
 =?us-ascii?Q?jHxPdQirbwoAV94HjfYqd+FimL3v+RJx3DJLhcsv6SamKLcyaWbczVBYPXPY?=
 =?us-ascii?Q?tzTAwV44E6fgYxyMnT+j58tWlMIssUpDjQ4151bjytYiykug5L16SmEZXAH5?=
 =?us-ascii?Q?Q4Y5cGxA3Il5qaycn51rWbSh8K6kpXb8bNuwboJqorG5cW2yi7okZTnzLR+2?=
 =?us-ascii?Q?iO2WMjR3o5R+4w4bu0u6XyQ64IfTtwtMC16nkFpcuk/LQRHQjpc7CIfelUyG?=
 =?us-ascii?Q?9zkxWltPXZHjWKtOt+e7l7h0QJcAL1uKMi7tw2bGkpikxcD/RGExcZ+w7Oyf?=
 =?us-ascii?Q?gnqkn5fvMXWFkDSkFoToAqfdjtpZeuloL11vZ6RO8uemtB/v+LTxj6Yyxder?=
 =?us-ascii?Q?pq0soi2RqWtFvhHFQ4kCIQ+hHy9O2xkGRnDj8UO6zi6ePNMGdqM6EVDg6vHb?=
 =?us-ascii?Q?4t41mh9VYsn/p+GBs5pyyeBzBwGG+pc9SxmX1g1xtDjk09WLetXsRUKucKi2?=
 =?us-ascii?Q?mdPOhvbwPrWY5ic8G6M7meXYNZ3wZlpXhHc4MatKnUkmPpLG+Ql7oI0DKaPu?=
 =?us-ascii?Q?xWnACfrJTPepWaEf+OeYEx17FB3vvBNSIXWbmXd0?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI2PR04MB11147.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26f699db-3367-4853-6f2a-08dd71d9fab8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2025 11:31:58.4648
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQd3eD+mlSdQRi//rFvRjBWl0cjReN1Wg73yC8vQ8dZ2Om+oiFk2wK8H9Q53f2fanhyFhYAK5+FrJr0puSqYAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8747

Hi, all

I found a 300ms~600ms IRQ off when writing 1Gb data to storage device at I.=
MX7d SDB board at Linux-kernel-v6.14.
From this discussion I find the regression root cause:
https://lore.kernel.org/linux-mm/CAJuCfpGajtAP8-kw5B5mKmhfyq6Pn67+PJgMjBeoz=
W-qzjQMkw@mail.gmail.com/T/

Before add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movement d=
uring block conversion", this longest IRQ off time is only 1ms~2ms.
After add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movement du=
ring block conversion", this longest IRQ off time is only ~100ms.
This patch is added in linux-kernel 6.10.
In the same test case and environment. From 6.10, as other PATCHs are added=
, the spinlock time gradually increases. At 6.12 the IRQ off is ~150ms
and at 6.14, the IRQ off time is ~300ms.

Run this cmd to test:
dd if=3D/dev/zero of=3D/dev/mmcblk0p3 bs=3D4096 seek=3D12500 count=3D256000=
 conv=3Dfsync

I use Ftrace irqoff tracer to trace the longest IRQ off event. Here is my t=
est log. Do I trigger a bug?

4 Ftrace logs of irqoff tracing on the same environment using the same case=
 only with different kernel version:=20
1. Not add the patch 2. Add the patch 3. At 6.12 4. At 6.14.

Log is here:

1. Before add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movemen=
t during block conversion":
# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 6.9.0-rc4-00115-g2dd482ba627d
# --------------------------------------------------------------------
# latency: 1075 us, #517/517, CPU#0 | (M:server VP:0, KP:0, SP:0 HP:0 #P:2)
#    -----------------
#    | task: dd-760 (uid:0 nice:0 policy:0 rt_prio:0)
#    -----------------
#  =3D> started at: _raw_spin_lock_irqsave
#  =3D> ended at:   _raw_spin_unlock_irqrestore
#
#
#                    _------=3D> CPU#
#                   / _-----=3D> irqs-off/BH-disabled
#                  | / _----=3D> need-resched
#                  || / _---=3D> hardirq/softirq
#                  ||| / _--=3D> preempt-depth
#                  |||| / _-=3D> migrate-disable
#                  ||||| /     delay
#  cmd     pid     |||||| time  |   caller
#     \   /        ||||||  \    |    /
      dd-760       0d....    1us : _raw_spin_lock_irqsave
      dd-760       0d....    6us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   11us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   13us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   15us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   17us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   19us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   21us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   24us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   25us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   27us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   29us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   32us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   34us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   36us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   38us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   40us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   42us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   44us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   46us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   48us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   50us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   52us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   53us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   55us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   57us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   59us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   61us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   64us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   66us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   68us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   70us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   72us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   74us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   75us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   77us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   80us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   81us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   83us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   85us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   87us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   89us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   91us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   93us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   95us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   97us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....   99us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  104us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  106us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  108us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  110us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  112us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  114us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  116us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  118us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  120us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  122us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  124us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  126us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  128us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  131us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  133us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  135us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  137us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  139us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  141us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  143us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  145us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  148us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  150us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  151us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  153us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  155us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  157us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  159us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  161us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  164us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  166us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  168us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  169us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  172us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  173us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  175us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  177us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  180us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  182us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  183us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  185us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  187us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  189us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  191us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  193us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  196us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  198us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  200us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  202us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  204us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  205us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  207us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  209us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  212us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  214us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  216us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  218us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  220us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  222us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  224us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  226us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  228us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  230us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  232us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  234us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  236us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  238us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  240us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  242us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  244us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  246us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  248us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  250us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  252us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  254us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  256us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  258us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  260us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  262us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  264us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  266us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  268us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  270us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  272us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  274us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  276us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  278us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  280us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  282us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  284us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  286us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  288us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  290us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  292us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  294us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  296us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  298us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  300us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  302us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  304us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  306us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  308us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  310us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  312us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  314us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  316us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  319us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  321us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  322us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  325us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  327us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  329us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  331us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  333us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  335us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  337us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  339us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  341us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  343us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  345us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  347us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  349us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  351us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  353us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  355us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  357us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  359us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  361us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  363us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  365us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  367us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  369us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  371us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  373us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  375us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  377us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  379us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  381us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  383us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  385us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  387us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  389us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  391us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  393us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  395us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  397us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  399us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  401us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  403us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  405us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  407us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  409us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  411us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  413us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  415us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  417us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  419us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  421us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  423us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  425us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  427us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  429us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  431us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  433us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  435us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  437us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  439us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  441us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  443us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  445us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  447us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  449us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  451us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  454us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  455us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  458us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  460us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  462us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  464us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  466us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  467us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  470us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  472us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  474us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  475us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  478us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  480us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  482us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  484us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  486us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  488us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  490us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  492us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  494us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  497us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  499us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  501us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  503us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  505us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  507us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  509us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  511us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  513us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  515us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  519us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  521us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  523us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  525us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  527us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  530us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  532us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  534us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  536us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  538us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  540us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  542us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  544us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  546us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  548us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  550us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  552us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  555us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  557us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  559us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  561us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  563us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  565us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  567us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  569us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  571us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  573us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  576us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  577us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  580us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  582us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  584us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  586us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  588us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  590us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  592us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  594us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  596us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  598us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  600us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  602us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  604us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  606us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  608us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  610us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  612us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  614us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  616us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  618us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  620us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  622us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  624us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  626us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  628us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  630us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  632us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  635us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  637us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  639us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  641us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  643us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  645us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  647us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  649us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  651us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  653us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  655us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  657us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  659us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  661us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  663us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  665us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  667us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  669us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  671us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  673us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  675us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  677us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  679us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  681us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  684us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  686us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  688us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  690us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  693us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  695us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  697us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  699us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  701us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  703us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  706us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  708us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  710us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  712us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  714us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  716us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  719us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  721us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  723us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  725us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  727us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  729us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  731us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  733us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  735us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  737us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  740us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  742us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  744us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  746us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  749us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  751us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  753us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  755us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  757us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  760us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  762us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  764us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  766us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  769us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  771us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  773us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  775us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  777us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  779us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  781us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  783us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  785us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  788us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  790us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  792us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  794us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  796us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  798us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  801us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  803us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  805us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  807us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  809us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  811us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  813us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  816us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  818us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  820us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  822us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  824us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  827us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  829us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  831us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  833us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  835us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  837us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  840us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  842us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  844us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  846us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  848us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  850us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  852us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  854us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  856us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  858us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  860us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  862us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  865us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  867us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  869us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  871us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  873us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  875us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  877us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  879us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  881us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  883us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  885us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  887us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  890us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  892us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  894us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  896us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  898us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  900us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  903us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  905us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  907us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  909us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  911us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  914us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  916us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  918us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  920us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  922us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  924us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  926us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  928us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  930us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  933us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  935us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  937us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  939us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  941us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  943us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  945us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  947us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  951us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  953us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  956us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  958us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  960us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  962us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  964us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  966us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  968us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  970us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  972us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  974us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  976us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  978us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  981us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  983us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  985us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  987us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  989us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  991us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  993us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  995us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  997us : __mod_zone_page_state <-__free_one_page
      dd-760       0d....  999us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1001us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1003us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1006us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1008us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1010us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1012us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1014us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1016us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1018us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1020us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1022us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1024us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1026us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1028us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1031us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1033us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1035us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1037us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1039us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1041us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1043us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1045us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1047us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1049us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1051us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1053us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1056us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1058us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1060us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1062us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1064us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1066us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1068us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1070us : __mod_zone_page_state <-__free_one_page
      dd-760       0d.... 1072us : _raw_spin_unlock_irqrestore <-drain_page=
s_zone
      dd-760       0d.... 1074us : _raw_spin_unlock_irqrestore
      dd-760       0d.... 1077us+: tracer_hardirqs_on <-_raw_spin_unlock_ir=
qrestore
      dd-760       0d.... 1116us : <stack trace>
 =3D> __drain_all_pages
 =3D> __alloc_pages_noprof
 =3D> __folio_alloc_noprof
 =3D> __filemap_get_folio
 =3D> iomap_write_begin
 =3D> iomap_file_buffered_write
 =3D> blkdev_write_iter
 =3D> vfs_write
 =3D> ksys_write
 =3D> ret_fast_syscall
2. After add this patch: c0cd6f557b90 "mm: page_alloc: fix freelist movemen=
t during block conversion"
# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 6.9.0-rc4-00116-gc0cd6f557b90
# --------------------------------------------------------------------
# latency: 93635 us, #13758/13758, CPU#0 | (M:server VP:0, KP:0, SP:0 HP:0 =
#P:2)
#    -----------------
#    | task: dd-764 (uid:0 nice:0 policy:0 rt_prio:0)
#    -----------------
#  =3D> started at: _raw_spin_lock_irqsave
#  =3D> ended at:   _raw_spin_unlock_irqrestore
#
#
#                    _------=3D> CPU#           =20
#                   / _-----=3D> irqs-off/BH-disabled
#                  | / _----=3D> need-resched   =20
#                  || / _---=3D> hardirq/softirq=20
#                  ||| / _--=3D> preempt-depth  =20
#                  |||| / _-=3D> migrate-disable=20
#                  ||||| /     delay          =20
#  cmd     pid     |||||| time  |   caller    =20
#     \   /        ||||||  \    |    /      =20
      dd-764       0d....    1us!: _raw_spin_lock_irqsave
      dd-764       0d....  206us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  209us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  210us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  213us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d....  281us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  282us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  284us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  286us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  288us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d....  338us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  340us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  341us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  343us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  345us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  347us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d....  396us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  398us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  399us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  401us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  403us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  404us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d....  454us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  456us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  458us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  459us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-764       0d....  461us : find_suitable_fallback <-__rmqueue_pcpli=
st
...
      dd-764       0d.... 93458us+: steal_suitable_fallback <-__rmqueue_pcp=
list
      dd-764       0d.... 93524us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93525us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93527us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93529us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93530us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93532us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93534us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93535us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93537us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93539us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93540us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93542us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93544us+: steal_suitable_fallback <-__rmqueue_pcp=
list
      dd-764       0d.... 93610us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93611us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93613us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93615us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93616us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93618us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93620us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93621us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93623us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93625us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93626us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93628us : find_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-764       0d.... 93630us : __mod_zone_page_state <-__rmqueue_pcpli=
st
      dd-764       0d.... 93632us : _raw_spin_unlock_irqrestore <-__rmqueue=
_pcplist
      dd-764       0d.... 93634us : _raw_spin_unlock_irqrestore
      dd-764       0d.... 93637us+: tracer_hardirqs_on <-_raw_spin_unlock_i=
rqrestore
      dd-764       0d.... 93678us : <stack trace>
 =3D> get_page_from_freelist
 =3D> __alloc_pages_noprof
 =3D> __folio_alloc_noprof
 =3D> __filemap_get_folio
 =3D> iomap_write_begin
 =3D> iomap_file_buffered_write
 =3D> blkdev_write_iter
 =3D> vfs_write
 =3D> ksys_write
 =3D> ret_fast_syscall

At 6.12:
# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 6.12.0
# --------------------------------------------------------------------
# latency: 152764 us, #25905/25905, CPU#0 | (M:server VP:0, KP:0, SP:0 HP:0=
 #P:2)
#    -----------------
#    | task: dd-769 (uid:0 nice:0 policy:0 rt_prio:0)
#    -----------------
#  =3D> started at: _raw_spin_lock_irqsave
#  =3D> ended at:   _raw_spin_unlock_irqrestore
#
#
#                    _------=3D> CPU#           =20
#                   / _-----=3D> irqs-off/BH-disabled
#                  | / _----=3D> need-resched   =20
#                  || / _---=3D> hardirq/softirq=20
#                  ||| / _--=3D> preempt-depth  =20
#                  |||| / _-=3D> migrate-disable=20
#                  ||||| /     delay          =20
#  cmd     pid     |||||| time  |   caller    =20
#     \   /        ||||||  \    |    /      =20
      dd-769       0d....    1us : _raw_spin_lock_irqsave
      dd-769       0d....    4us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....    8us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   10us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   12us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   13us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   16us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   18us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   20us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   21us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   23us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   25us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   27us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   29us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-769       0d....   32us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....   35us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....   36us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....   39us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  106us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  109us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  111us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  112us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  114us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  116us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  183us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  185us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  187us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  188us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  190us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  192us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  237us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  239us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  241us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  242us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  244us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  246us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  306us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  308us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  310us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  311us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  313us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  315us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  317us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  366us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  368us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  370us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  372us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  373us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  375us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  377us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  423us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  425us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  427us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  428us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  430us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  432us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  434us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  477us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  479us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  480us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  482us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  484us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  485us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  487us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  534us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  537us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  538us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  540us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  542us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  543us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  545us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  588us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  590us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  592us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  593us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  595us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  597us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  598us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  639us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  642us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  643us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  645us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  646us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  648us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  650us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  652us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  698us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  700us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  702us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  704us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  705us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  707us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  709us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  710us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d....  756us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d....  759us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  760us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  762us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  763us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  765us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  767us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d....  769us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
...
      dd-769       0d.... 1489us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1491us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1493us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1494us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1496us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1498us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1499us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1501us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d.... 1551us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d.... 1553us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1555us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1557us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1558us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1560us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1562us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1563us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1565us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d.... 1613us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d.... 1615us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1617us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1618us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1620us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1621us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1623us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1625us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1626us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
      dd-769       0d.... 1687us : __mod_zone_page_state <-steal_suitable_f=
allback
      dd-769       0d.... 1690us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1691us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1693us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1695us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1696us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1698us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1700us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-769       0d.... 1701us+: steal_suitable_fallback <-__rmqueue_pcpl=
ist
...
      dd-769       0d.... 152238us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152240us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152241us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152243us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152297us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152299us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152301us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152303us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152304us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152308us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152309us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152311us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152313us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152314us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152316us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152318us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152319us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152321us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152375us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152377us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152379us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152381us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152382us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152384us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152386us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152387us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152389us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152391us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152392us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152394us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152395us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152397us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152451us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152453us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152455us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152457us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152458us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152460us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152462us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152464us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152465us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152467us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152469us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152470us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152472us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152474us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152527us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152530us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152531us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152533us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152535us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152536us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152538us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152540us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152541us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152543us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152544us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152546us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152548us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152550us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152604us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152606us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152608us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152610us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152611us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152613us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152615us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152616us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152618us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152620us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152621us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152623us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152625us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152626us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152681us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152683us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152685us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152687us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152688us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152690us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152692us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152693us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152695us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152697us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152698us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152700us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152702us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-769       0d.... 152703us+: steal_suitable_fallback <-__rmqueue_pc=
plist
      dd-769       0d.... 152759us : __mod_zone_page_state <-steal_suitable=
_fallback
      dd-769       0d.... 152761us : _raw_spin_unlock_irqrestore <-__rmqueu=
e_pcplist
      dd-769       0d.... 152763us : _raw_spin_unlock_irqrestore
      dd-769       0d.... 152766us+: tracer_hardirqs_on <-_raw_spin_unlock_=
irqrestore
      dd-769       0d.... 152807us : <stack trace>
 =3D> get_page_from_freelist
 =3D> __alloc_pages_noprof
 =3D> __folio_alloc_noprof
 =3D> __filemap_get_folio
 =3D> iomap_write_begin
 =3D> iomap_file_buffered_write
 =3D> blkdev_write_iter
 =3D> vfs_write
 =3D> ksys_write
 =3D> ret_fast_syscall
At 6.14:
# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 6.14.0-rc7-next-20250319
# --------------------------------------------------------------------
# latency: 288231 us, #20842/20842, CPU#0 | (M:NONE VP:0, KP:0, SP:0 HP:0 #=
P:2)
#    -----------------
#    | task: dd-767 (uid:0 nice:0 policy:0 rt_prio:0)
#    -----------------
#  =3D> started at: __rmqueue_pcplist
#  =3D> ended at:   _raw_spin_unlock_irqrestore
#
#
#                    _------=3D> CPU#           =20
#                   / _-----=3D> irqs-off/BH-disabled
#                  | / _----=3D> need-resched   =20
#                  || / _---=3D> hardirq/softirq=20
#                  ||| / _--=3D> preempt-depth  =20
#                  |||| / _-=3D> migrate-disable=20
#                  ||||| /     delay          =20
#  cmd     pid     |||||| time  |   caller    =20
#     \   /        ||||||  \    |    /      =20
      dd-767       0d....    1us : __rmqueue_pcplist
      dd-767       0d....    3us : _raw_spin_trylock <-__rmqueue_pcplist
      dd-767       0d....    8us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   11us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   13us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   18us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   20us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   22us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   24us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   26us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   28us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   30us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   32us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   33us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   35us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   37us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   39us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   41us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   44us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   45us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   47us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   49us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   51us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   53us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   55us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   57us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   59us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   61us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   62us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   64us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   66us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   68us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   70us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   71us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   75us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   77us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   79us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   81us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   83us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   84us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   86us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   88us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   90us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   92us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   94us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   96us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....   98us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  100us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  101us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  103us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  106us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  107us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  109us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  111us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  113us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  115us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  117us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  118us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  121us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  123us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  124us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  126us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  128us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  130us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  132us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  134us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  136us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  138us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  140us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  142us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  144us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  146us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  148us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  149us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  151us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  153us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  155us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  157us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  159us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  161us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  163us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  165us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  167us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  169us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  171us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  172us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  174us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  176us : __mod_zone_page_state <-__rmqueue_pcplis=
t
...
      dd-767       0d....  605us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  606us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  608us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  610us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  612us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  614us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  616us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  618us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  620us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  621us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  624us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  625us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  627us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  629us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  632us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  633us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  635us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  637us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  639us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  641us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  643us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  644us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  647us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  648us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  650us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  652us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  654us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  656us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  658us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  659us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  662us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  664us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  665us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  667us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  669us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  671us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  673us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  675us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  677us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  679us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  681us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  682us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  684us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  686us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  688us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  690us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  693us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  694us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  696us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  698us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  700us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  702us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  703us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  705us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  707us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  709us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  711us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  713us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  715us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  717us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  718us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  720us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  723us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  724us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  726us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  728us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  730us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  732us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  734us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  735us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  738us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  740us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  741us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  743us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  745us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  747us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  749us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  750us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  753us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  755us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  757us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  758us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  760us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  762us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  764us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  766us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  768us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  770us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  772us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  773us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  775us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  777us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  779us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  781us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  783us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  785us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  787us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  788us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  791us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  792us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  794us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  796us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  798us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  800us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  802us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  805us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  807us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  809us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  811us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  813us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  816us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  818us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  819us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  821us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  823us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  825us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  827us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  829us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  831us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  833us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  834us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  836us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d....  838us : __mod_zone_page_state <-__rmqueue_pcplis=
t
...
    dd-767       0d.... 2043us : find_suitable_fallback <-__rmqueue_pcplist
      dd-767       0d.... 2045us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2047us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2049us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2101us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2103us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2181us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2184us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2220us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2222us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2304us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2306us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2365us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2367us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2368us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2370us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2372us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2434us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2436us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2438us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2442us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 2445us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2446us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2448us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2450us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2490us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2492us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2548us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2550us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2586us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2588us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2652us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2654us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2712us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2714us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2715us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2717us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2719us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2720us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2778us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2780us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 2783us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2784us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2786us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2788us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2824us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2826us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2881us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2883us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2918us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2920us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 2978us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 2980us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3037us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3039us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3040us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3042us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3044us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3045us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3047us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3049us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3050us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3052us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3054us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3056us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 3058us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3059us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3061us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3063us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3099us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3100us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3155us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3157us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3192us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3193us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3251us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3253us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3312us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3314us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3373us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3375us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3434us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3436us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3495us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3497us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3557us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3559us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3618us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3620us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 3622us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3624us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3625us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3627us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3662us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3664us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3718us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3720us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3755us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3757us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3815us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3817us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3877us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3879us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3938us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 3940us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 3999us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4001us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4061us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4063us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4123us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4125us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4126us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4128us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 4130us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4132us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4133us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4135us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4170us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4172us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4226us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4228us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4263us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4265us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4323us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4325us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4382us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4384us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4441us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4443us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4501us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4503us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4560us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4562us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4564us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4622us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4624us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 4626us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4628us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4630us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4631us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4666us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4668us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4723us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4724us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4759us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4761us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4819us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4821us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4879us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4880us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4938us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 4940us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 4998us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5000us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5059us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5061us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5063us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5064us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5066us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5068us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 5070us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5071us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5073us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5075us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5110us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5112us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5166us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5168us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5203us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5204us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5262us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5267us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5324us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5326us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5383us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5385us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5442us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5444us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5446us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5502us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5504us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5562us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5564us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-767       0d.... 5566us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5567us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5569us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5571us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5606us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-767       0d.... 5607us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 5662us : find_suitable_fallback <-__rmqueue_pcpli=
st
...
      dd-767       0d.... 287032us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 287034us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287035us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287037us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287039us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287040us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287094us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287096us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287098us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287151us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287153us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287155us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287157us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287158us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287212us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287213us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287266us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287268us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287321us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287323us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 287326us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287327us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287329us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287330us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287332us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287386us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287388us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287389us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287443us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287445us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287446us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287448us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287450us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287502us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287504us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287557us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287559us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287560us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287562us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 287564us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287566us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287567us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287569us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287571us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287624us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287625us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287627us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287681us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287682us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287684us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287686us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287687us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287740us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287742us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287744us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287797us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287799us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 287801us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287802us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287804us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287806us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287807us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287861us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287863us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287864us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287917us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287919us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287921us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287922us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287926us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 287979us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287980us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287982us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287984us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287985us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287987us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 287989us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287991us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287993us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287994us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 287996us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 288049us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288051us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288053us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 288106us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288107us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288109us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288111us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288112us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288114us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 288167us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288169us+: try_to_claim_block <-__rmqueue_pcplist
      dd-767       0d.... 288223us : find_suitable_fallback <-__rmqueue_pcp=
list
      dd-767       0d.... 288225us : __mod_zone_page_state <-__rmqueue_pcpl=
ist
      dd-767       0d.... 288227us : _raw_spin_unlock_irqrestore <-__rmqueu=
e_pcplist
      dd-767       0d.... 288230us : _raw_spin_unlock_irqrestore
      dd-767       0d.... 288234us+: trace_hardirqs_on <-_raw_spin_unlock_i=
rqrestore
      dd-767       0d.... 288277us : <stack trace>
 =3D> get_page_from_freelist
 =3D> __alloc_frozen_pages_noprof
 =3D> __folio_alloc_noprof
 =3D> __filemap_get_folio
 =3D> iomap_write_begin
 =3D> iomap_file_buffered_write
 =3D> blkdev_write_iter
 =3D> vfs_write
 =3D> ksys_write
 =3D> ret_fast_syscall


Best Regard
Carlos Song

