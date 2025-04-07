Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2089.outbound.protection.outlook.com [40.107.22.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973B479FD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743993964; cv=fail; b=aHNN/qeHfTPKwITxr14rckf6p68IbcI1vzY1OltQyrg6/zKCx4nTU2h0IXbCWBACfGtSc1oNN7d0TJfcM7WAAExCkzOmG73hX0UWxEe4e/WCZVBy8agPRj1hF/UBMJimiwIe8tqJZO1Hj+iGUXMqf7gAulQ3qh4OhNaUZZ/+2H0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743993964; c=relaxed/simple;
	bh=AkkJQB5I9B1nD2Ln5HlQjxnMxVUUPjeR+UPcWHuHQ5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RVRRVNfu+YfcUu3sWxBGXy04/9GU4pNrEY5qhbRnZgwS1xqaAO0W5T3ohTfLPHdShXapo1e6cukINmYLl2lQ4H/6TdCViLdRSLRjF4Akxum3jS+ItInocNGOmJEXVfyxQ27ezhH0MPMFGBqa8F9lLk0o8+8P0Qj32MzK+2hcy4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CLyAcIlK; arc=fail smtp.client-ip=40.107.22.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CLyAcIlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8/AnR1NgnCIo3ETboqCpnFlcOKXc+7jVUCkLEYIfIyM3bebW47me8jyuEDRf2a04OJFaBGgb7U0rLmH3AHmRi3UjfpUwyhgjHcwL4qZem+IGzyxIlrliKYPAL+kU4s5y/5voZ9zterOzD6UC36EQml29gLtEQwP8U69b+bj7cDYcpoo3iXsWMWbVTWNe/yEwgx1fIXms4FyYJdLigpCa6slYlQxHisW9kaUAwa95N3lI3bJVI5XZy2v/i6ZRSGhVQF5Nz7hUgu0IxW1vqnUYTi1t38onhSJxKlLDz34jXX+/f+72P7mNa/JZFLDhNP9q8R0yQ/iUN1cGSCe+ShyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kyBo46J2+XE0HpLFLgjfp9g0JrBk5+Gvk6E3aEjeOvY=;
 b=ZHc8NGVqvcK96YfmNdwl97Cr+0OhtPhypEcTJ6jpkypEAePvCaYP5OCtct7c63WrHk2B5wo98kz19wCP1csMLjvCJdavBHI4eLpLzIKbzfVVBF+6/Clna0mAcuE0Bl8JJ7YILhzqj3DtPc+tWAoDE0aBnAZYlFeEU90QJV6HzKtATBxd1v3Y+hbbAbyTH86LI6/tp6j1UEKPeNJrP2+pGIB1xCaw2kuAT9/wceajzjiKGIx341IEgfkoFQT5X14S1lS8yYfnH3ns77M79EITvM3JcFiom6JWtBlaq1oxPLAHT5uIttGYA+OhQ9kvFJsX4v+ov/bDXosY/b87c31izQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kyBo46J2+XE0HpLFLgjfp9g0JrBk5+Gvk6E3aEjeOvY=;
 b=CLyAcIlKviee3Jb3tVVEtr9mN516hh/+OamcmcOSqHYz1tySuyeCn+xY4TZTwnIWNuJ9Pdmf/0lb15uG40ed6d7nBRrC2ysCk9IzN9msg6q7PVuo1VzsFrDkAE8vmyUqiv/DWZYfsCv6fLCKdO8SR0IpGMdESdmFIBS2vC2yMqZO2KWHhR/nINUVJq7VJsf10pFvabeXt/gejEb5WfDWK1SFujwS9oCDYDYJdu5l/U68V8TGI4YsKuxBoq+6+I8D1/Ol34zRKgej5ogbqu6FehrBaBkrymptsjMX0QOqT80W2kpppceCYvVt8LU+bIlXH339eqX058d/uTeF6YiwYw==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by PAXPR04MB8797.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 02:45:54 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 02:45:54 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Johannes Weiner <hannes@cmpxchg.org>
CC: "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
	"ying.huang@intel.com" <ying.huang@intel.com>, "vbabka@suse.cz"
	<vbabka@suse.cz>, "david@redhat.com" <david@redhat.com>,
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>, "ziy@nvidia.com"
	<ziy@nvidia.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>
Subject: Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Thread-Topic: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Thread-Index: AQHbp2cuXfH5jKWGkkG/dVY6D52CXw==
Date: Mon, 7 Apr 2025 02:45:54 +0000
Message-ID:
 <VI2PR04MB11147ECA18A5BB7976207919DE8AA2@VI2PR04MB11147.eurprd04.prod.outlook.com>
References:
 <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250402194425.GB198651@cmpxchg.org>
 <VI2PR04MB11147FA8008C118F375650623E8AE2@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250403211820.GA447372@cmpxchg.org>
In-Reply-To: <20250403211820.GA447372@cmpxchg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|PAXPR04MB8797:EE_
x-ms-office365-filtering-correlation-id: 018acc7a-8288-4312-4e7e-08dd757e5109
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?6lPCN0RcWLBx8cR1eOTTWzgd5VeA4BofqOFyjn0GmpJ3otgcN9CqdYmQlrRt?=
 =?us-ascii?Q?dEllli9+8DCDWogf+VT9k6UPj+OccigHqBrmVYZBfI+ZaU/weuq7R9861W5x?=
 =?us-ascii?Q?Wmhn5Ords6aZB3YlDo/GCa1mzVZs6n+Dm9VGJJ2aF6VUZELI13SIixb/NJjf?=
 =?us-ascii?Q?9CLc2eFUnJ2H4ia3KP/D2hIE5Tl2uLWpEkMwbO3Yq1ECaZ/95NIBGLA6XDn0?=
 =?us-ascii?Q?Y00j3Qp2Avn/FB9e+no73pmR5M1BxMn22hWm1/z2YsrhMiHQJHUbV4t+nmxh?=
 =?us-ascii?Q?c+5L9NDNiNCKJv//Hxl/E0PJsR+dXCWKPiJkRTde8xOIQ79crbCHhFAKZCCo?=
 =?us-ascii?Q?pgqF+YeNjUUmiK7LM8vWSMQ6c0y4FhP7l9r2h8xlTnejHhf5BJRde49Rme8D?=
 =?us-ascii?Q?xYtxQ8MKd2KPvi6ft/XHlzChbM2Be0Z1w3OiyZrAaSblOyMoWBXvGlDMLoD8?=
 =?us-ascii?Q?XoH8CPJMC9dyOrJvuQe1ZU1nvF/adAHGpgNl9o73PxVqeR70vrWnJvIC8zzP?=
 =?us-ascii?Q?rDz+XbfCVuUbjorHP2yYfjLw/zb9TBa1YAtlIGw2Le8dnfSI5P/+ZSGEq3XS?=
 =?us-ascii?Q?2+wrg4PA1BMdzDf7vLRJygaTomk+oU7eXIXWtqUud5vgVeqtWCKgPxQ2oMfr?=
 =?us-ascii?Q?clQxDdD+/WVGsoGGLnaBQCmvpgh9IFv2hNvF9Bqf1Cebt8gvTCMYgxL7D49B?=
 =?us-ascii?Q?NSclTgFX2Q0zU1b6hQK51gfm+F9K0oVPVW9XzYyByIIJ01lwb/w3X45NvKRZ?=
 =?us-ascii?Q?G90+Jbt35eFJ1zBfyk+fjN75mK5OqhM8eYjIamBMTWZx3aeFb0uwA5tN63Dw?=
 =?us-ascii?Q?+z87T56W3md0Z20KKUlWRb2PbdludksgfO470b+APwsE8Q0b1AvTVS4u6dpg?=
 =?us-ascii?Q?Q6sawaWxHF5bePGtN7aDvGUaQn/FHANpAOSGsRafExC9aW/Vkxert9+e5r00?=
 =?us-ascii?Q?DcWdx+W6Bf5SVHhprcEUIGEvYdxxLhbQ9Ui2fQ9lyHhy3Q3ohNZwS/A+EPLc?=
 =?us-ascii?Q?jy6v9fWIeB/Eg3+qffnd72xHK2FiS/ZYxf/F1RxHf2y3Co9ZfIttsUeiiYnk?=
 =?us-ascii?Q?HX8Tt28JpPuKWrYsCGme49CSI2VLTyG4iGB//EXc1ummC0SLQaYACZXVJj9x?=
 =?us-ascii?Q?daNU60y8Qn0Z8OzTPgF0f5yJuvvCCewYG+ONPGQPfo0JwsyERRNNDXYmOE97?=
 =?us-ascii?Q?lTwLqKiL+vYHLPoT10Y19BPqkA0JHpAUyzfZaeFHvFXRT3ZsCHk4pLN6kw24?=
 =?us-ascii?Q?1cunu2dUQ0gGi9W+KKE3gbMaxASthCd4yBRBFB4lcyw5I4EHLX1ZfkIKdBIk?=
 =?us-ascii?Q?QplAd+8itc1j/96YrZNT1T2Ep7v2Tu9SYV5q8sh2YOPbI6s91fUaoW+5hgY/?=
 =?us-ascii?Q?jwngYHn6Qb2uwcnOSkSZB4aEYEKMf/kyFA/A/tfziWgN2s1g/+5uvD69FsaL?=
 =?us-ascii?Q?QwesQ1wl13ZUZF5LcrQm7UO3Ofbs6z1a?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?dLXkF1IBy4w457+M8Kl/otmlAFiIVZIUHF9xXoFH1WkVmx7afuxTU+s7jbur?=
 =?us-ascii?Q?i9e/GSm1LjAm/bfhXR02aeagJbI9OxknbyDVwTbp+65wYy+ip5UQO2Tql/QD?=
 =?us-ascii?Q?JfLJ7Cz9eLDmpabO/3C5pLES2LzKdkZXo/IQkRRLca8dSb64WNP4Z0CgS8Om?=
 =?us-ascii?Q?o4ZsVk4iTIKQBIKg/59Z4O5YLi0Le0ea59ByNPs5iFavsEX5M0lNJS0dJwRq?=
 =?us-ascii?Q?rTyLc+dbbIMcRRj4DK6chmCtTVe6yN1tglP/HLMTnouSxBkMBwUQGMIeYEU6?=
 =?us-ascii?Q?f4GjVj1BjB6UbhNftJvJySIdAqkThjhM5gqlJFf8Ja1HhneYFKEVGSYGTELa?=
 =?us-ascii?Q?YeKL+Q7tH2bXsLdTIf6oB8C80kV355AIE+0JNkVXq1Ryt1MKQqrZvR5LSzou?=
 =?us-ascii?Q?lTKyFn376i0EQkwWEcY1iL1UQgH73DGdTn1v5UPCOulkD5ta/lt0ggK6CEhQ?=
 =?us-ascii?Q?Ua1QJX6VMiAQzvaFMVy7feCHU6HVW/u0yx/wvcUlXAm51SAOR+4TwPbrqxlG?=
 =?us-ascii?Q?WepkgtXMfrUhtTKBUcxRNSb2f/J+gkQTv9JqB+lD5YXyH4F3m6OCr2NRcDlC?=
 =?us-ascii?Q?PQTJU9HQvYXo1cccb45ZMr4rkgpeEtS3iIiLh4vrBRQKnBGmCOHRSjNNqIks?=
 =?us-ascii?Q?hh8RapcaRHhbFDqmmYUte6dtlXKRFPgFCmPM2tOsgirE34+EJTLmKC0kVVef?=
 =?us-ascii?Q?toYhTYECxpNWTlk9HxT0GG8aGXJ8YF3D/G12yRJB+VHr/uBntoHQy1v2AT6K?=
 =?us-ascii?Q?khV927Ad9ELAyXngLFYnccjCI5j1JLI7+9GcyfyRYDSDeFDd0sSNzAALGX74?=
 =?us-ascii?Q?Trpl16spldNUyyBHQzP9Lr/F3d7UarEpDr0bzn5psCbl/2rL1LqnTHtWEbgn?=
 =?us-ascii?Q?e7T8PPMyZUbEyZ0OwIJ7Yfyb3TUbh1Ujjoyoul6rXzM6QTywJJZhkCAVjEE9?=
 =?us-ascii?Q?4K4x9ZUIDShNGjqWKrz3MZydjvEMQRAtBjIPmIwYvHPc890pzw+UMwuVkJu2?=
 =?us-ascii?Q?rmXJPBmBU2ymXDFbwZP6WMD2V+7BEU1Yg3QV7lr/ZSzELELir8QhhBYP2Fn6?=
 =?us-ascii?Q?XT8Z4O2KNOnPTalaX07wM5CdXrxpb8SWSVgY4cM70yNNYBhCmTVYxgch9zGt?=
 =?us-ascii?Q?mMV6ZarT2TTNxMfFKtR0/3HYkZJf9r65CGp7Uubwck8r/nXePk3bg4pWqMKU?=
 =?us-ascii?Q?AHXgSj5s7rIWqiX+vrqkpc8C48vkzbb6JE4FjcRAeGSHHSFfxeqsQgFHeoJJ?=
 =?us-ascii?Q?GJphFUEY/svil67pSsNjsDVmoZ04WeQ0Pk8CSCT78gcK70EjuX/OhakfpxUK?=
 =?us-ascii?Q?q4I5oheJGRc1cC+WN/FBLCjJBOl+kZeLFrxzYLG3tNhZvn4i1jYnEWpKI7xf?=
 =?us-ascii?Q?xXZFXnRWol/8Y3UWb62d1qbkg6+pK+siKqNNaJHOEyuEQgyuvMVGdIlMNH21?=
 =?us-ascii?Q?kPG4/tYBSYyWVCCNOe8RbsaIhyplwXNZzytovoGxWF0C2ExGczaWVdRcix6C?=
 =?us-ascii?Q?kgVoHp/qk3oDhiNdD7ngcNOlqfcDxic3ofIlth4H6cNsTPdLsW3QvkDHhb4K?=
 =?us-ascii?Q?3wAXe73b3L/Dgsj3iXYYSAeEEp5tnfu7MSgscHPO?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 018acc7a-8288-4312-4e7e-08dd757e5109
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2025 02:45:54.2297
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CeVbix68VvWIPhE0ITaqs6d0+LKOovrCX2rhTupradFTIHO+j/3/DyNs4+ALumNGkfwKORNWgsjJKFc+G5enpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8797



> -----Original Message-----
> From: Johannes Weiner <hannes@cmpxchg.org>
> Sent: Friday, April 4, 2025 5:18 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: baolin.wang@linux.alibaba.com; ying.huang@intel.com; vbabka@suse.cz;
> david@redhat.com; mgorman@techsingularity.net; ziy@nvidia.com;
> akpm@linux-foundation.org; linux-mm@kvack.org;
> linux-kernel@vger.kernel.org; Brendan Jackman <jackmanb@google.com>
> Subject: [EXT] Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc=
: fix
> freelist movement during block conversion"
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>=20
>=20
> Hi Carlos,
>=20
> On Thu, Apr 03, 2025 at 09:23:55AM +0000, Carlos Song wrote:
> > Thank you for your quick ack and help! After applied this patch, it imp=
roved
> well.
> > I apply this patch at this HEAD:
> > f0a16f536332 (tag: next-20250403, origin/master, origin/HEAD) Add
> > linux-next specific files for 20250403
> >
> > and do 10 times same test like what I have done before in IMX7D:
> > The IRQ off tracer shows the irq_off time 7~10ms. Is this what you expe=
cted?
>=20
> This is great, thank you for testing it!
>=20
> > # irqsoff latency trace v1.1.5 on
> > 6.14.0-next-20250403-00003-gf9e8473ee91a
> > # --------------------------------------------------------------------
> > # latency: 8111 us, #4323/4323, CPU#0 | (M:NONE VP:0, KP:0, SP:0 HP:0 #=
P:2)
> > #    -----------------
> > #    | task: dd-820 (uid:0 nice:0 policy:0 rt_prio:0)
> > #    -----------------
> > #  =3D> started at: __rmqueue_pcplist
> > #  =3D> ended at:   _raw_spin_unlock_irqrestore
> > #
> > #
> > #                    _------=3D> CPU#
> > #                   / _-----=3D> irqs-off/BH-disabled
> > #                  | / _----=3D> need-resched
> > #                  || / _---=3D> hardirq/softirq
> > #                  ||| / _--=3D> preempt-depth
> > #                  |||| / _-=3D> migrate-disable
> > #                  ||||| /     delay
> > #  cmd     pid     |||||| time  |   caller
> > #     \   /        ||||||  \    |    /
> >       dd-820       0d....    1us : __rmqueue_pcplist
> >       dd-820       0d....    3us : _raw_spin_trylock
> <-__rmqueue_pcplist
> >       dd-820       0d....    7us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   11us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   13us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   15us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   17us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   19us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   21us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   23us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d....   25us : __mod_zone_page_state
> <-__rmqueue_pcplist
> > ...
> >       dd-820       0d.... 1326us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1328us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1330us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1332us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1334us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1336us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1337us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1339us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1341us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1343us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1345us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1347us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1349us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1351us : __mod_zone_page_state
> <-__rmqueue_pcplist
> > ...
> >       dd-820       0d.... 1660us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1662us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1664us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1666us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1668us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1670us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1672us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1727us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1729us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1806us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1807us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1809us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1854us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1856us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1893us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1895us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1896us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1898us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1954us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 1956us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-820       0d.... 2012us : find_suitable_fallback
> <-__rmqueue_pcplist
> > ...
> >      dd-820       0d.... 8077us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8079us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8081us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8083us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8084us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8086us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8088us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8089us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8091us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8093us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8095us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8097us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8098us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8100us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8102us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8104us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8105us : __mod_zone_page_state
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8107us : _raw_spin_unlock_irqrestore
> <-__rmqueue_pcplist
> >       dd-820       0d.... 8110us : _raw_spin_unlock_irqrestore
> >       dd-820       0d.... 8113us+: trace_hardirqs_on
> <-_raw_spin_unlock_irqrestore
> >       dd-820       0d.... 8156us : <stack trace>
>=20
> This pattern looks much better. Once it fails to claim blocks, it goes st=
raight to
> single-page stealing.
>=20
> Another observation is that find_suitable_callback() is hot. Looking clos=
er at that
> function, I think there are a few optimizations we can do. Attaching anot=
her
> patch below, to go on top of the previous one.
>=20
> Carlos, would you be able to give this a spin?
>=20
> Thanks!
>=20
Hi,

Now I have applied both patches and get the log.
The IRQ off time become 4ms~5ms from the tracer.

# tracer: irqsoff
#
# irqsoff latency trace v1.1.5 on 6.14.0-next-20250403-00004-ga2dc7fa77e16
# --------------------------------------------------------------------
# latency: 4504 us, #2044/2044, CPU#0 | (M:NONE VP:0, KP:0, SP:0 HP:0 #P:2)
#    -----------------
#    | task: dd-801 (uid:0 nice:0 policy:0 rt_prio:0)
#    -----------------
#  =3D> started at: __rmqueue_pcplist
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
      dd-801       0d....    1us : __rmqueue_pcplist
      dd-801       0d....    3us : _raw_spin_trylock <-__rmqueue_pcplist
      dd-801       0d....    7us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   12us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   14us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   16us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   18us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   20us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   21us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   23us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   25us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   27us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   29us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   31us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   33us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   35us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   37us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   38us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   40us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   43us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   45us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   47us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   48us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   50us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   52us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   54us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   56us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   58us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   60us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   61us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   63us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   65us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   67us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   69us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   71us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   74us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   76us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   78us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   79us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   81us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   83us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   85us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   87us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   89us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   91us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   93us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   94us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   96us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....   98us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  100us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  102us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  104us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  106us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  108us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  110us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  112us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  114us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  115us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  117us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  119us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  121us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  123us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  125us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  127us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  129us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  131us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  132us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  135us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  137us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  139us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  141us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  143us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  144us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  146us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  148us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  150us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  152us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  154us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  156us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  158us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  159us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  161us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  163us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  165us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  167us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  169us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  171us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  173us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  175us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  177us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  178us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  181us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  182us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  184us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  186us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  188us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  190us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  192us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  193us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  196us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  198us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  200us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  202us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  204us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  206us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  207us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  209us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  211us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  213us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  215us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  217us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  219us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  220us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  222us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  224us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  227us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  228us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  230us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  232us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  234us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  236us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  238us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  239us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  242us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  243us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  245us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  247us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  249us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  251us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  253us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  254us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  257us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  259us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  261us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  262us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  264us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  266us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  268us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  270us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  272us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  274us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  276us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  278us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  280us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  281us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  283us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  285us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  287us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  289us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  291us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  293us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  295us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  297us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  298us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  300us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  302us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  304us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  306us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  308us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  310us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  312us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  313us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  315us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  319us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  320us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  322us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  324us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  326us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  328us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  330us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  331us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  334us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  335us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  337us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  339us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  341us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  343us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  345us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  346us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  349us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  351us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  352us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  354us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  356us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  358us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  360us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  362us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  364us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  366us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  367us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  369us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  371us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  373us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  375us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  377us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  379us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  381us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  383us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  385us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  387us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  389us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  390us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  395us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  397us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  399us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  401us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  403us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  405us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  407us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  408us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  410us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  412us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  414us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  416us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  418us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  420us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  422us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  423us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  425us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  427us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  429us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  431us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  433us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  435us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  437us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  439us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  440us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  443us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  445us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  447us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  449us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  451us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  452us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  454us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  456us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  458us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  460us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  462us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  463us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  465us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  467us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  469us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  471us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  473us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  475us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  477us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  479us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  481us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  483us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  484us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  486us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  488us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  490us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  492us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  494us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  496us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  498us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  500us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  501us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  504us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  506us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  508us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  509us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  511us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  513us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  515us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  517us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  519us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  521us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  523us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  524us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  526us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  528us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  530us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  532us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  534us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  536us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  538us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  540us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  542us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  543us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  545us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  547us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  549us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  551us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  553us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  555us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  557us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  558us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  560us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  562us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  565us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  567us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  569us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  571us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  573us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  574us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  576us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  578us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  580us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  582us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  584us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  585us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  587us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  589us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  591us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  593us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  595us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  597us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  599us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  601us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  603us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  605us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  607us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  608us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  610us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  612us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  614us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  616us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  618us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  620us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  621us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  623us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  626us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  628us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  630us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  631us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  633us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  635us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  637us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  639us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  641us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  643us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  645us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  646us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  648us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  650us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  652us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  654us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  656us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  658us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  660us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  662us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  664us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  666us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  667us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  669us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  671us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  673us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  675us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  677us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  679us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  680us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  682us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  684us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  687us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  689us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  690us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  692us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  694us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  696us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  698us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  700us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  702us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  704us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  706us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  707us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  709us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  711us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  713us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  715us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  717us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  719us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  721us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  723us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  725us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  726us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  728us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  730us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  732us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  734us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  736us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  738us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  740us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  741us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  743us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  745us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  748us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  749us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  751us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  753us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  755us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  757us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  759us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  761us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  763us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  765us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  767us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  768us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  770us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  772us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  774us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  776us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  778us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  780us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  782us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  785us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  788us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  789us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  791us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  793us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  795us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  797us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  799us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  801us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  803us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  804us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  806us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  808us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d....  810us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  813us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  814us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  817us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d....  880us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  882us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d....  937us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  939us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d....  978us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d....  980us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1023us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1025us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1064us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1066us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1148us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1150us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1198us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1200us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1257us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1259us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1303us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-801       0d.... 1305us+: try_to_claim_block <-__rmqueue_pcplist
      dd-801       0d.... 1364us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1366us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1368us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1370us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1372us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1374us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1376us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1378us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1380us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1382us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1384us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1386us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1388us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1389us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1391us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1393us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1395us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1397us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1399us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1401us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1403us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1404us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1406us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1408us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1410us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1412us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1414us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1416us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1418us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1420us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1421us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1423us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1425us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1427us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1429us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1431us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1433us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1435us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1437us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1438us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1440us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1442us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1444us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1446us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1448us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1450us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1452us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1454us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1456us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1458us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1460us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1461us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1463us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1465us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1467us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1469us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1471us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1473us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1476us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1478us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1480us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1482us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1484us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1485us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1488us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1489us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1491us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1493us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1495us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1497us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1499us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1501us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1503us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1505us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1507us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1509us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1511us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1513us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1515us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1517us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1519us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1521us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1523us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1525us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1527us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1529us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1531us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1533us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1535us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1537us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1539us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1541us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1543us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1545us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1547us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1549us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1551us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1553us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1555us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1557us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1560us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1562us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1563us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1565us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1568us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1569us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1571us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1573us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1575us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1577us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1579us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1581us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1583us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1585us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1587us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1589us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1591us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1593us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1595us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1597us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1599us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1601us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1603us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1605us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1607us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1609us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1611us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1613us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1616us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1617us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1619us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1621us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1623us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1625us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1627us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1629us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1631us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1633us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1635us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1637us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1639us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1641us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1643us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1645us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1648us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1650us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1651us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1653us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1655us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1657us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1659us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1661us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1663us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1665us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1667us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1669us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1671us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1673us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1675us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1677us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1679us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1681us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1683us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1685us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1687us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1689us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1691us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1692us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1695us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1699us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1702us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1703us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1706us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1707us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1709us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1711us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1714us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1716us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1718us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1720us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1722us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1724us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1726us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1727us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1730us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1731us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1733us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1735us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1737us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1739us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1741us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1743us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1745us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1747us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1749us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1751us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1753us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1755us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1757us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1759us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1761us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1763us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1764us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1766us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1768us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1770us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1772us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1774us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1776us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1778us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1780us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1782us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1784us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1786us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1788us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1790us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1792us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1794us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1795us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1797us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1799us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1801us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1803us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1805us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1808us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1809us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1811us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1813us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1815us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1817us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1819us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1821us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1823us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1825us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1827us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1829us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1831us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1833us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1834us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1836us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1839us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1841us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1842us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1844us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1846us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1848us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1850us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1852us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1854us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1856us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1858us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1860us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1862us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1863us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1865us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1867us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1870us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1872us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1874us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1876us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1878us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1879us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1881us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1883us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1885us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1887us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1889us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1891us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1893us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1895us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1897us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1899us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1901us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1903us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1905us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1907us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1909us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1911us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1912us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1914us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1917us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1918us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1920us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1922us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1924us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1926us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1928us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1930us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1932us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1934us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1936us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1938us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1940us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1942us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1944us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1945us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1947us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1949us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1951us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1953us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1955us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1957us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1959us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1961us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1963us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1965us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1967us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1969us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1971us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1972us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1974us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1976us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1978us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1980us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1982us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1984us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1986us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1988us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1990us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1992us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1994us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1996us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 1998us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2000us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2002us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2004us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2005us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2007us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2010us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2011us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2013us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2015us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2017us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2019us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2021us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2023us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2025us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2027us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2029us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2031us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2033us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2035us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2037us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2038us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2041us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2042us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2044us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2046us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2048us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2050us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2052us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2054us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2056us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2058us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2060us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2062us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2064us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2065us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2067us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2069us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2071us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2073us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2075us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2077us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2079us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2081us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2082us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2084us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2087us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2089us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2090us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2092us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2094us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2098us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2100us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2102us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2104us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2106us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2108us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2110us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2112us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2113us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2115us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2117us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2120us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2122us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2124us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2126us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2128us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2130us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2131us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2133us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2135us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2137us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2139us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2141us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2143us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2145us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2147us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2149us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2151us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2153us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2155us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2157us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2159us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2161us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2163us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2164us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2167us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2169us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2170us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2172us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2174us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2176us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2178us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2180us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2183us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2184us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2186us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2188us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2190us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2192us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2194us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2196us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2198us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2200us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2202us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2204us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2206us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2208us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2210us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2211us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2214us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2216us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2218us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2219us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2222us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2223us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2225us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2227us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2229us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2231us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2233us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2235us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2237us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2239us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2240us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2242us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2245us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2247us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2249us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2251us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2253us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2255us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2257us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2258us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2261us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2263us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2264us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2266us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2268us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2270us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2272us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2274us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2276us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2278us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2280us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2282us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2284us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2286us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2288us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2289us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2292us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2293us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2295us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2297us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2299us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2301us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2303us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2305us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2307us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2309us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2311us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2313us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2315us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2317us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2319us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2320us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2323us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2325us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2326us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2328us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2331us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2332us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2334us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2336us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2338us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2340us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2342us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2344us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2346us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2348us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2350us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2352us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2354us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2356us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2358us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2359us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2361us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2363us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2365us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2367us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2370us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2372us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2374us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2376us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2378us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2380us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2382us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2383us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2386us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2388us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2390us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2391us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2393us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2395us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2397us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 2399us : __mod_zone_page_state <-__rmqueue_pcplis=
t
...   =20
      dd-801       0d.... 4018us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4019us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4021us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4023us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4025us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4027us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4029us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4031us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4033us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4035us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4037us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4039us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4041us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4043us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4044us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4047us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4049us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4050us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4052us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4054us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4056us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4058us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4060us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4062us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4064us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4066us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4068us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4070us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4072us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4074us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4075us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4078us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4080us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4081us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4083us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4085us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4087us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4089us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4091us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4093us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4097us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4099us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4101us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4103us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4105us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4107us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4108us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4111us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4112us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4114us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4116us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4118us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4120us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4122us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4124us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4127us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4129us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4131us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4133us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4135us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4136us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4138us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4140us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4142us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4144us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4146us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4148us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4150us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4152us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4154us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4156us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4158us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4160us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4162us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4164us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4166us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4168us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4169us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4171us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4174us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4175us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4177us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4179us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4181us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4183us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4185us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4187us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4189us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4191us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4193us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4195us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4197us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4199us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4201us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4203us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4205us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4207us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4208us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4210us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4212us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4214us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4216us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4218us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4220us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4222us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4224us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4226us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4228us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4230us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4231us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4233us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4236us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4237us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4239us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4241us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4243us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4245us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4247us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4249us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4252us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4253us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4255us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4257us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4259us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4261us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4263us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4265us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4267us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4269us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4271us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4273us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4275us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4276us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4278us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4280us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4283us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4284us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4286us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4288us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4290us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4292us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4294us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4296us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4298us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4300us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4302us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4304us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4306us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4308us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4309us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4311us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4314us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4316us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4318us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4319us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4322us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4323us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4325us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4327us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4329us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4331us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4333us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4335us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4337us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4339us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4341us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4342us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4345us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4347us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4349us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4350us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4353us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4354us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4356us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4358us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4360us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4362us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4364us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4366us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4368us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4370us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4372us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4374us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4377us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4379us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4380us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4382us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4384us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4386us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4388us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4390us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4392us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4394us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4396us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4398us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4400us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4402us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4404us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4405us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4408us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4410us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4412us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4413us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4416us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4417us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4419us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4421us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4423us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4425us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4427us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4429us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4431us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4433us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4435us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4436us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4439us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4441us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4443us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4445us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4447us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4449us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4450us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4452us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4454us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4456us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4458us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4460us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4462us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4464us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4466us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4468us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4470us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4472us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4474us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4475us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4478us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4479us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4481us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4483us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4485us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4487us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4489us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4491us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4493us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4497us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4499us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-801       0d.... 4500us : _raw_spin_unlock_irqrestore <-__rmqueue_=
pcplist
      dd-801       0d.... 4503us : _raw_spin_unlock_irqrestore
      dd-801       0d.... 4507us+: trace_hardirqs_on <-_raw_spin_unlock_irq=
restore
      dd-801       0d.... 4548us : <stack trace>
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

> ---
>=20
> From 621b1842b9fbbb26848296a5feb4daf5b038ba33 Mon Sep 17 00:00:00
> 2001
> From: Johannes Weiner <hannes@cmpxchg.org>
> Date: Thu, 3 Apr 2025 16:44:32 -0400
> Subject: [PATCH] mm: page_alloc: tighten up find_suitable_fallback()
>=20
> find_suitable_fallback() is not as efficient as it could be:
>=20
> 1. should_try_claim_block() is a loop invariant. There is no point in
>    checking fallback areas if the caller is interested in claimable
>    blocks but the order and the migratetype don't allow for that.
>=20
> 2. __rmqueue_steal() doesn't care about claimability, so it shouldn't
>    have to run those tests.
>=20
> Different callers want different things from this helper:
>=20
> 1. __compact_finished() scans orders up until it finds a claimable block =
2.
> __rmqueue_claim() scans orders down as long as blocks are claimable 3.
> __rmqueue_steal() doesn't care about claimability at all
>=20
> Move should_try_claim_block() out of the loop. Only test it for the two c=
allers
> who care in the first place. Distinguish "no blocks" from "order + mt are=
 not
> claimable" in the return value; __rmqueue_claim() can stop once order
> becomes unclaimable, __compact_finished() can keep advancing until order
> becomes claimable.
>=20
> Signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/compaction.c |  4 +---
>  mm/internal.h   |  2 +-
>  mm/page_alloc.c | 31 +++++++++++++------------------
>  3 files changed, 15 insertions(+), 22 deletions(-)
>=20
> diff --git a/mm/compaction.c b/mm/compaction.c index
> 139f00c0308a..7462a02802a5 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -2348,7 +2348,6 @@ static enum compact_result
> __compact_finished(struct compact_control *cc)
>         ret =3D COMPACT_NO_SUITABLE_PAGE;
>         for (order =3D cc->order; order < NR_PAGE_ORDERS; order++) {
>                 struct free_area *area =3D &cc->zone->free_area[order];
> -               bool claim_block;
>=20
>                 /* Job done if page is free of the right migratetype */
>                 if (!free_area_empty(area, migratetype)) @@ -2364,8
> +2363,7 @@ static enum compact_result __compact_finished(struct
> compact_control *cc)
>                  * Job done if allocation would steal freepages from
>                  * other migratetype buddy lists.
>                  */
> -               if (find_suitable_fallback(area, order, migratetype,
> -                                               true,
> &claim_block) !=3D -1)
> +               if (find_suitable_fallback(area, order, migratetype,
> + true) >=3D 0)
>                         /*
>                          * Movable pages are OK in any pageblock. If we
> are
>                          * stealing for a non-movable allocation, make
> sure diff --git a/mm/internal.h b/mm/internal.h index
> 50c2f590b2d0..55384b9971c3 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -915,7 +915,7 @@ static inline void init_cma_pageblock(struct page
> *page)
>=20
>=20
>  int find_suitable_fallback(struct free_area *area, unsigned int order,
> -                       int migratetype, bool claim_only, bool
> *claim_block);
> +                          int migratetype, bool claimable);
>=20
>  static inline bool free_area_empty(struct free_area *area, int migratety=
pe)
> { diff --git a/mm/page_alloc.c b/mm/page_alloc.c index
> 03b0d45ed45a..1522e3a29b16 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2077,31 +2077,25 @@ static bool should_try_claim_block(unsigned int
> order, int start_mt)
>=20
>  /*
>   * Check whether there is a suitable fallback freepage with requested or=
der.
> - * Sets *claim_block to instruct the caller whether it should convert a =
whole
> - * pageblock to the returned migratetype.
> - * If only_claim is true, this function returns fallback_mt only if
> + * If claimable is true, this function returns fallback_mt only if
>   * we would do this whole-block claiming. This would help to reduce
>   * fragmentation due to mixed migratetype pages in one pageblock.
>   */
>  int find_suitable_fallback(struct free_area *area, unsigned int order,
> -                       int migratetype, bool only_claim, bool
> *claim_block)
> +                          int migratetype, bool claimable)
>  {
>         int i;
> -       int fallback_mt;
> +
> +       if (claimable && !should_try_claim_block(order, migratetype))
> +               return -2;
>=20
>         if (area->nr_free =3D=3D 0)
>                 return -1;
>=20
> -       *claim_block =3D false;
>         for (i =3D 0; i < MIGRATE_PCPTYPES - 1 ; i++) {
> -               fallback_mt =3D fallbacks[migratetype][i];
> -               if (free_area_empty(area, fallback_mt))
> -                       continue;
> +               int fallback_mt =3D fallbacks[migratetype][i];
>=20
> -               if (should_try_claim_block(order, migratetype))
> -                       *claim_block =3D true;
> -
> -               if (*claim_block || !only_claim)
> +               if (!free_area_empty(area, fallback_mt))
>                         return fallback_mt;
>         }
>=20
> @@ -2206,7 +2200,6 @@ __rmqueue_claim(struct zone *zone, int order, int
> start_migratetype,
>         int min_order =3D order;
>         struct page *page;
>         int fallback_mt;
> -       bool claim_block;
>=20
>         /*
>          * Do not steal pages from freelists belonging to other pageblock=
s
> @@ -2225,11 +2218,14 @@ __rmqueue_claim(struct zone *zone, int order, int
> start_migratetype,
>                                 --current_order) {
>                 area =3D &(zone->free_area[current_order]);
>                 fallback_mt =3D find_suitable_fallback(area, current_orde=
r,
> -                               start_migratetype, false, &claim_block);
> +
> start_migratetype,
> + true);
> +
> +               /* No block in that order */
>                 if (fallback_mt =3D=3D -1)
>                         continue;
>=20
> -               if (!claim_block)
> +               /* Advanced into orders too low to claim, abort */
> +               if (fallback_mt =3D=3D -2)
>                         break;
>=20
>                 page =3D get_page_from_free_area(area, fallback_mt); @@
> -2254,12 +2250,11 @@ __rmqueue_steal(struct zone *zone, int order, int
> start_migratetype)
>         int current_order;
>         struct page *page;
>         int fallback_mt;
> -       bool claim_block;
>=20
>         for (current_order =3D order; current_order < NR_PAGE_ORDERS;
> current_order++) {
>                 area =3D &(zone->free_area[current_order]);
>                 fallback_mt =3D find_suitable_fallback(area, current_orde=
r,
> -                               start_migratetype, false, &claim_block);
> +
> start_migratetype,
> + false);
>                 if (fallback_mt =3D=3D -1)
>                         continue;
>=20
> --
> 2.49.0
>=20

