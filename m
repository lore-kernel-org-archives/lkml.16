Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013066.outbound.protection.outlook.com [40.107.162.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E6C24166D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672241; cv=fail; b=YfKfzjbGa8NTMa16TCpj+bU56kj4cn7qWCY6rW/I6+5TJhnkmdgjP0TJfVFsBp7ekHGIGibVeI9BKgkEu9joW45AIvqFMRljg5z5LZyOYdOGpNAuwJpYABBfB4VYVwkbdWaLrseI98yQJRmstcUUq6516a7BUvwUuQinjiGFTrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672241; c=relaxed/simple;
	bh=GII8vT6jd3zX0XrLmyRUnM4mlUDpZMNNb+UvFfGhy1Q=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OjsGaXlVP0zxjkJKqBI8ZJGwVGzZfnA2gmk7BA6fSpfbyOUvgX7BNXKWUgI8fbXnjCpegDBo1p7LXsIkwOGJQMcfr7kfaxNK93Ix71CswoGsabS0pfJX2RKFXXfzX+v4/WPebCyP0UrBD8UDsJEKFetjOj0rqLwWKGHg60xrQ9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JzZylByf; arc=fail smtp.client-ip=40.107.162.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JzZylByf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mo30TgpDsZvQi4sedk1uKGKnWtMGvCGfSgMYgfUAIhFFC3dNbsPfesW2jyA36gn0UKJbHNkde/Rna6fJIxh4H5qFDDAoTNlCkkwBg/mkPav3XxQeE/bgGXTEOjpEihQrsm6JR3AOy7ELpOhtrk3GicRmXcgqubR+d1YESXZfUMuo+pvnf5A9d3abJQmtxNlrf3PfdDR19/KN5ITb7X0+OUvFB+EufzJEo9ewxlvyYq1SPST2S+BQwdreM8cfH+jlUmcYXzg3TSN4kF5LKOEzL5Kd1ZjfaAwt9Y2y6UnBUgj91/ghr3p/HBZspFrFCg/wUxF9/6sRZp5gqTtiUXnqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt00r372FDIu3OC6ZAKRbKin5JNeDjxZn2/Mom8ePxo=;
 b=FF7dvvnS5Chr9w4Ibd5VEIAa2y2eHCOzLMv92UVjyZDx5DBRAHrcFUrwHrbVFMzt2HnvFPekq/6l46ThCiA6QKryO13OHDvXpIke4iLxOKmI0wjl8MDCRmYTbR27DrgDC50lDLGP2qHsyvX5Ezyou0LrY7Pep4WYg9K0pLP0mAk1vZeVcnIZYqE1g83pnGN55+CdB9qXTVYG2QJqWD0szf9JehMTawg9psyb14+jHYehxyX4PwjgMgsho2dfPuURfK6lraSXlf6x+tAZb8mgXOA85uc2qzDLVjgoVP+TXw1DVz8JmPZ8/a8kMFxWxR7+DOoaJlbOYxv+0Woy5KNzlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt00r372FDIu3OC6ZAKRbKin5JNeDjxZn2/Mom8ePxo=;
 b=JzZylByf8fk4kkb7L3UW6BLLkdejHftJLNhvBKUkGJ2X9PfZQrtcf5qlO+7P+AqakCfeZJRBkSNhWK7vbMzOS55FfGhBk2mzj+WPJuIAIEGpulgfvu0zq8ltMU1iW68iE49ldDhFXAy/Qr+FQmrAQKhYQ5Kz75/WUH9AeuoIgwDNX2njSQf/VLWAV6kJxzPukdU2nip/2vtxyH/XgIflrAa16QzWtguXqSHIYDr+Z5FXiAVVmcMi+fKEMFpMaO87meLLvO5Pbsza753JdDPKLbSEbomPXyifH81Q0Dt/Ec5iEqaUCh3RRECm2MQ5hUPP6plzhQGeCZdyk+Lu9vOAXA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by AS8PR04MB8610.eurprd04.prod.outlook.com
 (2603:10a6:20b:425::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 09:23:55 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 09:23:55 +0000
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
Thread-Index: AQHbpHoeMxSiBZ+qbkGECgEkTPeO2A==
Date: Thu, 3 Apr 2025 09:23:55 +0000
Message-ID:
 <VI2PR04MB11147FA8008C118F375650623E8AE2@VI2PR04MB11147.eurprd04.prod.outlook.com>
References:
 <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <20250402194425.GB198651@cmpxchg.org>
In-Reply-To: <20250402194425.GB198651@cmpxchg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|AS8PR04MB8610:EE_
x-ms-office365-filtering-correlation-id: 0134c434-b37f-40eb-e777-08dd7291417a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Pk3L165CbncvN1+IDZXw/IebJX4WWs6HPKVnPbHafw5HBO2pk4Xq0+CtH4JI?=
 =?us-ascii?Q?2Vc9dy1u1H4/ImJFf/cTxN6sHJdueeEW2QdPlBBxghU7tzxtBUNKaTJiP695?=
 =?us-ascii?Q?9gIGG4buGiDifEVk9O8ga7IibddXcUiU6+Cit5pgAzLe9OrVfaeeKhyQvrk0?=
 =?us-ascii?Q?1i9GpMVBMsLqAp/2ukwd4bNRnijKNoh5hcNV+S8zfjbcoRp1zsGCOpQDhZpV?=
 =?us-ascii?Q?6jVayNFgUHK8Fu9cBU91oOawu/fVBSSMP9yijZ6QUlAybuvOMjSJ3zAaA3H5?=
 =?us-ascii?Q?jTLEpqaGpW0ih/xhIOSBNRBoKfvjprmkum7mXdHNuh22IyNi6uFEZMdPj4Cu?=
 =?us-ascii?Q?KnUd5JVtaG1r1q4JXTquk8ZglIYzt/KzieFgow2+K1WO+GoNJhpdnxiNI4vi?=
 =?us-ascii?Q?C4R/SpMEMXaTv32XDzabAu4O70H1lAFyYZjo+3iY6fG1sLaPWXDLQCykgBmb?=
 =?us-ascii?Q?C4hxqZyWDLUDvEAryB1AlFYA//a2tXB++8RST1bxwEnLbb4UsCUZZNZvUnFO?=
 =?us-ascii?Q?Z+l6Eb3s5lYRHvCEun2NqjQVJM7hvmzNUMAgglrpb43Nc7e5P0chBR3F9WIF?=
 =?us-ascii?Q?iPFElkEqz+6ATkUVMpHNqKUMRoAUyU6twvBTnQlLU3K1OpG7ypuWGCbyz9OP?=
 =?us-ascii?Q?hbJRPQ21rEjMEAcK8XBM4cGnm99xkx3o3a80uS2ciU/cloAS8XYp3nBbwPYK?=
 =?us-ascii?Q?QdUW/JQeB24KSVwpces3dbGqoQSXZ8e2IZIgE4/mRzXj86A2Gknb40U75uC1?=
 =?us-ascii?Q?WIJXT3KhUiExlVnfBaf4krKbENHDMPC11OMTWfske5D/1KEeGLFT3UfXus/P?=
 =?us-ascii?Q?ly2K7xq6/b9UZzqutudW9bMyQ8pws8tApcNELDkw2eZUCA8fmvyMNM3k3Nud?=
 =?us-ascii?Q?uNqUXeka5zjYIGx94JsNfwnetSNc2XUoZIcZnUtssTxbXso+RI2MYnJG/4RP?=
 =?us-ascii?Q?/8Nl1YdxgZcG2JSVILMaBwz1bh2bdryieTiqqUTmoiwQx39DJPEIHOdpjhoe?=
 =?us-ascii?Q?161oyNLrLtevBb8IEjrmCHP9r05ddtDkq4OtWewiSNhbhUnkJFx8iRiVBtES?=
 =?us-ascii?Q?jB7jZwRtPKoQxSSYkZoPh3uZ7eRgZiI5Ulw5uS+ekUrgDSfczaDcxUJy3xAw?=
 =?us-ascii?Q?Jm0TpltMQKzmZl6WU/4VoslK+6joeIwLgcLPT/gKQjwfvvXlt0Ktz3yaxEe6?=
 =?us-ascii?Q?RdIYnRSiYveu/bkFSljJ1OG/Vd0qlbyKTiFBhUxEbGpg3PL9rZYR+GNfYhXe?=
 =?us-ascii?Q?G5oob3y6VWImtfDef/gYAuOBNQK0QSwmWqoN2WYSwPWVRdF1sX5tjDztcG5w?=
 =?us-ascii?Q?eYA8Ton/fH/GS5gm1GKO2u8XpJPw0c8klRyD/je71l5ZcPbdj5LYHLWNrlZv?=
 =?us-ascii?Q?YvfK74vfgr2DT0Xtos1kzcz7phMV?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Bfen7dldv+5dxZkvGYBwrsoj1lESR04QfPtkgO33OTD2UkRd2j7BobvgGxaX?=
 =?us-ascii?Q?Xr8uRmvZHBAAskksI0HqmeSm6/AjsarzY0t/x3SzL2gNa21usA+m5yeSfDGb?=
 =?us-ascii?Q?xlKGLm+aoFPD8Chb8jWZMyEzejiA1lFSWxBkvM20YkVDZEjdAKNeI7/ZEC5/?=
 =?us-ascii?Q?p+20zHp+pwrGFtFMS2aUD8g8TCG8slAByY+Uu6dK2xYUhMQdE1KJ0SZtf/10?=
 =?us-ascii?Q?wm0IZ1nJN9GMr8BQWm5WcCwB8aQdXfx2qiAMK8/mlZqGJ4CSxXxQeB1Dj+1c?=
 =?us-ascii?Q?x8cIvmwiI/71xRZOdjWQ7FWFKh1e4UBGeKAuqlkigEdKgnzVBgsZqfV57K1k?=
 =?us-ascii?Q?ZUR2RY9392voJfTh2OgKBX+NMd+Y5eXiQm+8R7P7oUlShaG4FaRBp4WemreV?=
 =?us-ascii?Q?C0VI2uVihgPnMMAJ1D5OQ/fpc0IsUy0GTgAsdEFWGQc+NSahNJTxYXtbe2hj?=
 =?us-ascii?Q?xXLGYjGaubKQDi4x98ceEeBOrCQ09hSMrvfOa/iFsn81Fm76BmvJvN1eK9+V?=
 =?us-ascii?Q?sTi9puQrxgK3MUVDhgM4sKFHlxYVh/0ZDig1Qd2gardmtgugycZTx2Eq3uYo?=
 =?us-ascii?Q?6PNPPdXie1G+RZNhNbYf2I49iIgJM7/oNBScMEwZfnH0dPPKoy6y8Hhu0epK?=
 =?us-ascii?Q?KGOOVnLUSzuQy7kCz4MOgLLyzVBXMuVXVpLTdmnMXxKRYEEpsQ0++Msq6U04?=
 =?us-ascii?Q?TZYQBoLC2qs6rPvS79zW86r9/ZAywhE4hdbj6ITe2uRkGloG89h5XP+ryyZM?=
 =?us-ascii?Q?mapkuUXCZ0Xr3uJLvkTO/QMgCDtLCgdb5Gn9ALaE67dYgMqxzpmQvjB4WXI5?=
 =?us-ascii?Q?FgsWmCCrILEA3KhC7ZoOCYeClHu/Ac4KP/5EWwaWL0IqtwPW4td/f18wYZVF?=
 =?us-ascii?Q?IBX32VH+l0VRYS4s8KvEjNumFxAVIfl6Sfn25YZNG441eaHHY6BBa4/Nzwdt?=
 =?us-ascii?Q?BJw1Kq3ncn4NTjgeBS7aaosBf9ZjmSPRueD1GnmKxCPhNoSwwJU/U/Xam+Db?=
 =?us-ascii?Q?SFODR+Fav1rtHmQ8WrX5Mm03jsudTbX8jQUOjxZq9Koh932yxl3zVT97K0Hb?=
 =?us-ascii?Q?n1+zIIyry8jWqjlW4KqCzij5fKBz2gwLWiHGHxVEfcuFZc+tvJv2lDFghA17?=
 =?us-ascii?Q?WfLpysDjBmjUYOdWWx/4Go0FWHv5NYTrzPJv2Bllz0ta5hzL+431CQy0wybl?=
 =?us-ascii?Q?8kcfeos+O/sttiQH7YvfY9jfzTu/XjLAmSwEz4pe4CEKJAissmEiJ4nyAwcj?=
 =?us-ascii?Q?O1vUawJu+qxX7S60zp7E2smBqQBB/yEDdz+NW68V0m121+QdLDxLIbyrUvk5?=
 =?us-ascii?Q?jaV9x7OSztMhzBdVTOLvl5FB2L/kTmeXdOh8nVSZLUH+iKmxd1iYAY/Cpuzj?=
 =?us-ascii?Q?nW9RDRkztropAKQNC2juYUUu0pfBtHi1qDj164YQoDuCSpDVrvLDNkd4jn6I?=
 =?us-ascii?Q?zkXQJC4TjNiZMVfeepqL0q/nS+gj88BvJYW0IlMesbgJWqzTO1ueyELeIC+W?=
 =?us-ascii?Q?i272f+EXhwVBQiq6Gt28ZiVlhbtbDjefeGhIDBCzHOMwMoi9NpTeyHmux2/v?=
 =?us-ascii?Q?z5WnebPzEm65NRgYF9sb4rcakJ3MSfUPebh2Hpbe?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 0134c434-b37f-40eb-e777-08dd7291417a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 09:23:55.0628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 20T/nHroqDfIWDYjzK0ixAOlR0LAboHkCTYKAL1PGmshf8b9g8U3apMpW1bmiz8h5LphOx/5rCZZG6fnceIRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610



> -----Original Message-----
> From: Johannes Weiner <hannes@cmpxchg.org>
> Sent: Thursday, April 3, 2025 3:44 AM
> To: Carlos Song <carlos.song@nxp.com>
> Cc: baolin.wang@linux.alibaba.com; ying.huang@intel.com; vbabka@suse.cz;
> david@redhat.com; mgorman@techsingularity.net; ziy@nvidia.com;
> akpm@linux-foundation.org; linux-mm@kvack.org;
> linux-kernel@vger.kernel.org; Brendan Jackman <jackmanb@google.com>
> Subject: [EXT] Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc=
: fix
> freelist movement during block conversion"
>
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report =
this
> email' button
>
>
> Hi Carlos,
>
> On Wed, Apr 02, 2025 at 11:31:58AM +0000, Carlos Song wrote:
> > Hi, all
> >
> > I found a 300ms~600ms IRQ off when writing 1Gb data to storage device a=
t
> I.MX7d SDB board at Linux-kernel-v6.14.
> > From this discussion I find the regression root cause:
> > https://lore/
> > .kernel.org%2Flinux-mm%2FCAJuCfpGajtAP8-kw5B5mKmhfyq6Pn67%2BPJgMj
> BeozW
> >
> -qzjQMkw%40mail.gmail.com%2FT%2F&data=3D05%7C02%7Ccarlos.song%40nxp
> .com%
> >
> 7Cd7694a8c3df242bbfafb08dd721eca68%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%
> >
> 7C0%7C0%7C638792198771816986%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> eU1hcGkiO
> >
> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> >
> 3D%3D%7C0%7C%7C%7C&sdata=3DuLdowX74RLIC8Lwd0u9UGub1Lx7MI6YLT1e2
> ERF5VmY%3
> > D&reserved=3D0
>
> Thanks for the report!
>
> > 2. After add this patch: c0cd6f557b90 "mm: page_alloc: fix freelist mov=
ement
> during block conversion"
> > # tracer: irqsoff
> > #
> > # irqsoff latency trace v1.1.5 on 6.9.0-rc4-00116-gc0cd6f557b90 #
> > --------------------------------------------------------------------
> > # latency: 93635 us, #13758/13758, CPU#0 | (M:server VP:0, KP:0, SP:0 H=
P:0
> #P:2)
> > #    -----------------
> > #    | task: dd-764 (uid:0 nice:0 policy:0 rt_prio:0)
> > #    -----------------
> > #  =3D> started at: _raw_spin_lock_irqsave
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
> >       dd-764       0d....    1us!: _raw_spin_lock_irqsave
> >       dd-764       0d....  206us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  209us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  210us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  213us+: steal_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  281us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  282us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  284us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  286us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-764       0d....  288us+: steal_suitable_fallback
> <-__rmqueue_pcplist
>
> This is the freelists being replenished with a loop over __rmqueue(). Two=
 things
> stand out:
>
> 1. steal_suitable_fallback() is the expensive part. The patch in
>    question made this slightly worse because stealability is checked
>    up-front instead of just stealing optimistically like before. So
>    the pages in the block are iterated twice. This can explain some of
>    the issue, but not a 100x increase in lock hold time.
>
> 2. We're doing it *a lot*. And this is the likely culprit. Whereas
>    before the patch, we'd steal whole buddies and their remainders,
>    afterwards there is a lot more single page stealing when grabbing
>    the whole block fails. This means __rmqueue_smallest() fails more
>    often and we end up doing a lot more topdown fallback scans:
>
> >     dd-767       0d.... 2043us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2045us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2047us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2049us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2101us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2103us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2181us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2184us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2220us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2222us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2304us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2306us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2365us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2367us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2368us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2370us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2372us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2434us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2436us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2438us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2442us : __mod_zone_page_state
> <-__rmqueue_pcplist
>
> The __mod_zone_page_state() is the successful allocation after attempting=
 to
> steal a few different blocks. If this had succeeded, it would have replen=
ished the
> native freelist and we'd see another
> __mod_zone_page_state() quickly. Alas it failed:
>
> >       dd-767       0d.... 2445us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2446us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2448us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2450us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2490us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2492us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2548us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2550us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2586us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2588us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2652us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2654us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2712us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2714us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2715us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2717us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2719us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2720us+: try_to_claim_block
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2778us : find_suitable_fallback
> <-__rmqueue_pcplist
> >       dd-767       0d.... 2780us : __mod_zone_page_state
> <-__rmqueue_pcplist
>
> ... and we go through the whole fallback spiel for the next page.
>
> We can definitely do better. rmqueue_bulk() holds the zone->lock the enti=
re
> time, which means nobody else can modify the freelists underneath us. Onc=
e
> block claiming has failed, there is no point in trying it again for the n=
ext page.
>
> In fact, the recent kernel test bot report [1] appears to be related to t=
his. It
> points to c2f6ea38fc1b640aa7a2e155cc1c0410ff91afa2 ("mm:
> page_alloc: don't steal single pages from biggest buddy"), a patch that f=
urther
> forces bottom-up freelist scans if block stealing fails.
>
> Attached is a patch that has __rmqueue() remember which fallback level it=
 had
> to stoop to in order to succeed; for the next page, it restarts the searc=
h from
> there.
>
> I cannot reproduce Carlos' setup, but testing with lru-file-mmap-read fro=
m the
> kernel test bot, it shows a stark difference:
>
>          upstream          patched
> real     0m8.939s         0m5.546s
> user     0m2.617s         0m2.528s
> sys     0m52.885s        0m30.183s
>
> Trace points confirm that try_to_reclaim_block() is called about two orde=
rs of
> magnitudes less than before.
>
> [1]
> https://lore.kern/
> el.org%2Fall%2F202503271547.fc08b188-lkp%40intel.com%2F&data=3D05%7C02
> %7Ccarlos.song%40nxp.com%7Cd7694a8c3df242bbfafb08dd721eca68%7C686e
> a1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638792198771844055%7CUnk
> nown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsI
> lAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> DyKhob0zA5ujzeidYFYx9EdvvM5Kps3YDk94wsIfTG0%3D&reserved=3D0
>

Hi,

Thank you for your quick ack and help! After applied this patch, it improve=
d well.
I apply this patch at this HEAD:
f0a16f536332 (tag: next-20250403, origin/master, origin/HEAD) Add linux-nex=
t specific files for 20250403

and do 10 times same test like what I have done before in IMX7D:
The IRQ off tracer shows the irq_off time 7~10ms. Is this what you expected=
?

#
# irqsoff latency trace v1.1.5 on 6.14.0-next-20250403-00003-gf9e8473ee91a
# --------------------------------------------------------------------
# latency: 8111 us, #4323/4323, CPU#0 | (M:NONE VP:0, KP:0, SP:0 HP:0 #P:2)
#    -----------------
#    | task: dd-820 (uid:0 nice:0 policy:0 rt_prio:0)
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
      dd-820       0d....    1us : __rmqueue_pcplist
      dd-820       0d....    3us : _raw_spin_trylock <-__rmqueue_pcplist
      dd-820       0d....    7us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   11us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   13us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   15us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   17us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   19us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   21us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   23us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d....   25us : __mod_zone_page_state <-__rmqueue_pcplis=
t
...
      dd-820       0d.... 1326us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1328us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1330us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1332us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1334us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1336us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1337us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1339us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1341us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1343us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1345us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1347us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1349us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1351us : __mod_zone_page_state <-__rmqueue_pcplis=
t
...
      dd-820       0d.... 1660us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1662us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1664us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 1666us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1668us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1670us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1672us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 1727us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1729us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 1806us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1807us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1809us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 1854us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1856us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 1893us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1895us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1896us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1898us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 1954us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 1956us+: try_to_claim_block <-__rmqueue_pcplist
      dd-820       0d.... 2012us : find_suitable_fallback <-__rmqueue_pcpli=
st
...
     dd-820       0d.... 8077us : find_suitable_fallback <-__rmqueue_pcplis=
t
      dd-820       0d.... 8079us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8081us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8083us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8084us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8086us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8088us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8089us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8091us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8093us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8095us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8097us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8098us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8100us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8102us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8104us : find_suitable_fallback <-__rmqueue_pcpli=
st
      dd-820       0d.... 8105us : __mod_zone_page_state <-__rmqueue_pcplis=
t
      dd-820       0d.... 8107us : _raw_spin_unlock_irqrestore <-__rmqueue_=
pcplist
      dd-820       0d.... 8110us : _raw_spin_unlock_irqrestore
      dd-820       0d.... 8113us+: trace_hardirqs_on <-_raw_spin_unlock_irq=
restore
      dd-820       0d.... 8156us : <stack trace>
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


Carlos Song
> ---
>
> From 13433454403e0c6f99ccc3b76c609034fe47e41c Mon Sep 17 00:00:00
> 2001
> From: Johannes Weiner <hannes@cmpxchg.org>
> Date: Wed, 2 Apr 2025 14:23:53 -0400
> Subject: [PATCH] mm: page_alloc: speed up fallbacks in rmqueue_bulk()
>
> Not-yet-signed-off-by: Johannes Weiner <hannes@cmpxchg.org>
> ---
>  mm/page_alloc.c | 100 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 74 insertions(+), 26 deletions(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c index
> f51aa6051a99..03b0d45ed45a 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2194,11 +2194,11 @@ try_to_claim_block(struct zone *zone, struct page
> *page,
>   * The use of signed ints for order and current_order is a deliberate
>   * deviation from the rest of this file, to make the for loop
>   * condition simpler.
> - *
> - * Return the stolen page, or NULL if none can be found.
>   */
> +
> +/* Try to claim a whole foreign block, take a page, expand the
> +remainder */
>  static __always_inline struct page *
> -__rmqueue_fallback(struct zone *zone, int order, int start_migratetype,
> +__rmqueue_claim(struct zone *zone, int order, int start_migratetype,
>                                                 unsigned int
> alloc_flags)  {
>         struct free_area *area;
> @@ -2236,14 +2236,26 @@ __rmqueue_fallback(struct zone *zone, int order,
> int start_migratetype,
>                 page =3D try_to_claim_block(zone, page, current_order, or=
der,
>                                           start_migratetype,
> fallback_mt,
>                                           alloc_flags);
> -               if (page)
> -                       goto got_one;
> +               if (page) {
> +                       trace_mm_page_alloc_extfrag(page, order,
> current_order,
> +
> start_migratetype, fallback_mt);
> +                       return page;
> +               }
>         }
>
> -       if (alloc_flags & ALLOC_NOFRAGMENT)
> -               return NULL;
> +       return NULL;
> +}
> +
> +/* Try to steal a single page from a foreign block */ static
> +__always_inline struct page * __rmqueue_steal(struct zone *zone, int
> +order, int start_migratetype) {
> +       struct free_area *area;
> +       int current_order;
> +       struct page *page;
> +       int fallback_mt;
> +       bool claim_block;
>
> -       /* No luck claiming pageblock. Find the smallest fallback page */
>         for (current_order =3D order; current_order < NR_PAGE_ORDERS;
> current_order++) {
>                 area =3D &(zone->free_area[current_order]);
>                 fallback_mt =3D find_suitable_fallback(area, current_orde=
r,
> @@ -2253,25 +2265,28 @@ __rmqueue_fallback(struct zone *zone, int order,
> int start_migratetype,
>
>                 page =3D get_page_from_free_area(area, fallback_mt);
>                 page_del_and_expand(zone, page, order, current_order,
> fallback_mt);
> -               goto got_one;
> +               trace_mm_page_alloc_extfrag(page, order, current_order,
> +                                           start_migratetype,
> fallback_mt);
> +               return page;
>         }
>
>         return NULL;
> -
> -got_one:
> -       trace_mm_page_alloc_extfrag(page, order, current_order,
> -               start_migratetype, fallback_mt);
> -
> -       return page;
>  }
>
> +enum rmqueue_mode {
> +       RMQUEUE_NORMAL,
> +       RMQUEUE_CMA,
> +       RMQUEUE_CLAIM,
> +       RMQUEUE_STEAL,
> +};
> +
>  /*
>   * Do the hard work of removing an element from the buddy allocator.
>   * Call me with the zone->lock already held.
>   */
>  static __always_inline struct page *
>  __rmqueue(struct zone *zone, unsigned int order, int migratetype,
> -                                               unsigned int
> alloc_flags)
> +         unsigned int alloc_flags, enum rmqueue_mode *mode)
>  {
>         struct page *page;
>
> @@ -2290,16 +2305,47 @@ __rmqueue(struct zone *zone, unsigned int order,
> int migratetype,
>                 }
>         }
>
> -       page =3D __rmqueue_smallest(zone, order, migratetype);
> -       if (unlikely(!page)) {
> -               if (alloc_flags & ALLOC_CMA)
> +       /*
> +        * Try the different freelists, native then foreign.
> +        *
> +        * The fallback logic is expensive and rmqueue_bulk() calls in
> +        * a loop with the zone->lock held, meaning the freelists are
> +        * not subject to any outside changes. Remember in *mode where
> +        * we found pay dirt, to save us the search on the next call.
> +        */
> +       switch (*mode) {
> +       case RMQUEUE_NORMAL:
> +               page =3D __rmqueue_smallest(zone, order, migratetype);
> +               if (page)
> +                       return page;
> +               fallthrough;
> +       case RMQUEUE_CMA:
> +               if (alloc_flags & ALLOC_CMA) {
>                         page =3D __rmqueue_cma_fallback(zone, order);
> -
> -               if (!page)
> -                       page =3D __rmqueue_fallback(zone, order,
> migratetype,
> -                                                 alloc_flags);
> +                       if (page) {
> +                               *mode =3D RMQUEUE_CMA;
> +                               return page;
> +                       }
> +               }
> +               fallthrough;
> +       case RMQUEUE_CLAIM:
> +               page =3D __rmqueue_claim(zone, order, migratetype,
> alloc_flags);
> +               if (page) {
> +                       /* Replenished native freelist, back to normal
> mode */
> +                       *mode =3D RMQUEUE_NORMAL;
> +                       return page;
> +               }
> +               fallthrough;
> +       case RMQUEUE_STEAL:
> +               if (!(alloc_flags & ALLOC_NOFRAGMENT)) {
> +                       page =3D __rmqueue_steal(zone, order,
> migratetype);
> +                       if (page) {
> +                               *mode =3D RMQUEUE_STEAL;
> +                               return page;
> +                       }
> +               }
>         }
> -       return page;
> +       return NULL;
>  }
>
>  /*
> @@ -2311,6 +2357,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned
> int order,
>                         unsigned long count, struct list_head *list,
>                         int migratetype, unsigned int alloc_flags)  {
> +       enum rmqueue_mode rmqm =3D RMQUEUE_NORMAL;
>         unsigned long flags;
>         int i;
>
> @@ -2321,7 +2368,7 @@ static int rmqueue_bulk(struct zone *zone, unsigned
> int order,
>         }
>         for (i =3D 0; i < count; ++i) {
>                 struct page *page =3D __rmqueue(zone, order, migratetype,
> -
> alloc_flags);
> +                                             alloc_flags, &rmqm);
>                 if (unlikely(page =3D=3D NULL))
>                         break;
>
> @@ -2934,6 +2981,7 @@ struct page *rmqueue_buddy(struct zone
> *preferred_zone, struct zone *zone,  {
>         struct page *page;
>         unsigned long flags;
> +       enum rmqueue_mode rmqm =3D RMQUEUE_NORMAL;
>
>         do {
>                 page =3D NULL;
> @@ -2945,7 +2993,7 @@ struct page *rmqueue_buddy(struct zone
> *preferred_zone, struct zone *zone,
>                 if (alloc_flags & ALLOC_HIGHATOMIC)
>                         page =3D __rmqueue_smallest(zone, order,
> MIGRATE_HIGHATOMIC);
>                 if (!page) {
> -                       page =3D __rmqueue(zone, order, migratetype,
> alloc_flags);
> +                       page =3D __rmqueue(zone, order, migratetype,
> + alloc_flags, &rmqm);
>
>                         /*
>                          * If the allocation fails, allow OOM handling an=
d
> --
> 2.49.0

