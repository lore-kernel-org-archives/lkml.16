Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2068.outbound.protection.outlook.com [40.107.247.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773242CA6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671853; cv=fail; b=P075vo5n9za10uveF/TWcJ+A9hy0wnPddRK0vGjWQ7zvtcS6IBSpKw7PxAmopGHe39JNOZd0EXGAis28Bjpkevz160kth6FjQcr4NWaGQBe1LxRNSHvqMLzgLr3P1yna7BLEumKQUiD6yCRiR+ahUiezCO1A+gZZgJCcB2oKA1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671853; c=relaxed/simple;
	bh=u9UkWu0L/czlv203m224+kPyqTN2RmbYkviubFs/EHk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sUY/AWkWYd4dDXiEaiXlaV4QoAviQwDxZPVcZ7zZPt+qagcMoJLO4DHkdXDafG6sp6kXyIg9z5cT0uoylMibEBjyqpGoQiA7MbW04BZE/m88PjOCRlB0htZDP2ggaodduQhBFbNSiTOxpwxp/BLF6Z+EaVJwnKLhaXK2quTHWWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=i0xMhGgb; arc=fail smtp.client-ip=40.107.247.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="i0xMhGgb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6UI/yRWcAD+KVqhMk5NuMn7gkhyROWbTv524by37Ehy5caEvJsEFiwIumwoLl0lj9Vm/WECNfs+FTpaJXLry0i/Pj7WMezoiyoP81MWefbRQwyqLhMZpc1BYDlcZFu3ud/x5ucEQ0OeVx5ZEcjaBmNDVwbCYpNa0Hd9qjqvWpxY4fqeiMvj54rY+KCdVuMK/PVQzEJmUA7diPG7MTdseA/+gDOXR8Oz0tfVlJwMm9e23+ccYIcfJtf9vXk6WHihuF9XdpB4j8AOxH0LyRYMy0nbrbTiulP7OcqZ5BSP/I4xfwa8RlQRCNVP6lPvKC18tfRSuUoHOTUq1DB56tXH3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9UkWu0L/czlv203m224+kPyqTN2RmbYkviubFs/EHk=;
 b=AzrNykID4auis7nk6qPeVUHOHg3XLC8yuqVQt8Hz640KYndnSzK89a6hj256Kevi3fAbh4V1CBrrA3KcNcXbgd9mMvrH19Z6cMzjd52AYg/0xEVruGY0CBLEXl28Gjnb+cXoLBGFnnHNdbyr1/1iOA0RbRm+qn7THjDu3nSmGPHY6xXuPGNbOgUh131ADILsBtOT2Jmo+pzRl2aJVy1fWccl/EHrD9EswUzNT0hDxGIjTVV5uW5Q66XQQiAP+NrsEmXddzdIi03XIFECGu+T+qIhF6ltVno/qYPOw5n4uXKaLiRflrAvslPOefdUm3T+938nl2meaT43aK6zO+ez1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9UkWu0L/czlv203m224+kPyqTN2RmbYkviubFs/EHk=;
 b=i0xMhGgb3U0U0WPa5a5FGAw6JK9QLj0S+NDSEKEblXweMZJIag+kywA5uxpKUZMdkquckdOuzZugbyC3XMa5e0UleJaYpMSQk9srFWNuJYTZn9JOVPwOMvHUdH7/T9xVvo/FSyycKu9Sm+RhKMh1OUfzADlifJfdXF00ahoxmtLcxhRvg9GYWetkNIgKfe0m2l1NROabJDRgEP5lJAS4iikIGsGJUv0vnPvEEjiaUIIPGUg8jCEeyQlh+E84JZLNgapWPg6E7JH5kaOjEPtyWEdLvOMO/BJsHvXX4f1xcQpo6WoToHzvB+yQb+67DhIGUIiXLTF2kfLgoCErJulQaA==
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 (2603:10a6:800:293::14) by GV1PR04MB10632.eurprd04.prod.outlook.com
 (2603:10a6:150:206::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 09:17:26 +0000
Received: from VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687]) by VI2PR04MB11147.eurprd04.prod.outlook.com
 ([fe80::75ad:fac7:cfe7:b687%7]) with mapi id 15.20.8534.043; Thu, 3 Apr 2025
 09:17:25 +0000
From: Carlos Song <carlos.song@nxp.com>
To: Vlastimil Babka <vbabka@suse.cz>, "hannes@cmpxchg.org"
	<hannes@cmpxchg.org>, "baolin.wang@linux.alibaba.com"
	<baolin.wang@linux.alibaba.com>, "ying.huang@intel.com"
	<ying.huang@intel.com>, "david@redhat.com" <david@redhat.com>,
	"mgorman@techsingularity.net" <mgorman@techsingularity.net>, "ziy@nvidia.com"
	<ziy@nvidia.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>
CC: "linux-mm@kvack.org" <linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Thread-Topic: Ask help about this patch c0cd6f557b90 "mm: page_alloc: fix
 freelist movement during block conversion"
Thread-Index: AQHbpHk2jXqDl02QvkWW6WicLYIFaQ==
Date: Thu, 3 Apr 2025 09:17:25 +0000
Message-ID:
 <VI2PR04MB111478EE6156B444B978C799EE8AE2@VI2PR04MB11147.eurprd04.prod.outlook.com>
References:
 <VI2PR04MB11147E11724F867F4FCB6677DE8AF2@VI2PR04MB11147.eurprd04.prod.outlook.com>
 <d9a8d187-a05f-45b1-ac4b-ed6bd04b99a5@suse.cz>
In-Reply-To: <d9a8d187-a05f-45b1-ac4b-ed6bd04b99a5@suse.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI2PR04MB11147:EE_|GV1PR04MB10632:EE_
x-ms-office365-filtering-correlation-id: 87615b89-5461-4730-a77b-08dd72905974
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hUxdMiWgnjxs2IYPJlS0A80lKx/nNbMVTZmtHYJlZARTCau4uWoskwC6TWdU?=
 =?us-ascii?Q?FwrsBjrSy/ipzPhDrwpE28cOY/AX5Xx3wAL1ZtKYaXHcoqouz2zAdRMFXZmF?=
 =?us-ascii?Q?R0uUtNsCG/HvCcCI80gFdGp8yByBLUX9hN3m60t2hftUyk2bn8X6zMQ1MrL5?=
 =?us-ascii?Q?/EWRQmi7Md85qDv9/sjOILXRawV30lGjbMEzzgw272KMX+blHFGr2fBLnBQk?=
 =?us-ascii?Q?T6+fj5q3DwhiWtbfoTJ0P0RgVm9qJNWr5/3r0XozwuKLRghqWjoK2MhMpxxr?=
 =?us-ascii?Q?bwWhFSSGFgoCcgVtv4CUPbJ1D3oSI6ziSdmvnOBkp/bw1Q/8QPq7lF2gWmvB?=
 =?us-ascii?Q?/RxZ85CNXSVHP/re6iAgWUH75Pq8+jV4k8BNN7GlFIMXg9LcIcAho8HmOKuI?=
 =?us-ascii?Q?/fa5f9t0SlErsG6lmfvkqZCA7jh0f2dARbWqwC3RKeAKWfLCvJOB0M0jYcaC?=
 =?us-ascii?Q?fa9R4EtCt0Ti44tIwsxqIPfRDvf9Ph1wmsy19NFrCuuZvbU7wN6WeyIjmrRT?=
 =?us-ascii?Q?cdO5e6Omr+eFsazaqkiN76ckSbR90mXNJzev2a16nYKKcQdqcMnA8qg/LNZl?=
 =?us-ascii?Q?HzbSFxG59do+mgs+zrQHffcavGAD6oS03oMRrn4AaaMAGCsoJC/YsKZ5iRmA?=
 =?us-ascii?Q?dhaWR0NKdmydoRVU4ajthrleGzlm5gCxKhcQbzYjnFLpX5kbwainPgncl2b3?=
 =?us-ascii?Q?E9MCjTf/3EWg0gIRCEwZpie5EKIWylo0kp/2XGkF3qOxyG8zgKfl5d1/FQY8?=
 =?us-ascii?Q?vT1YDvw5IZ5dSa4Q2myHgYCkcSeyu4IGA9I8zMH1vwS8mmMNUxFRI1o6fL9j?=
 =?us-ascii?Q?W2LJ99Fr4TRzsXVtDTCBmEJeVqvEmXbvVi56/vpF2geOf7jZz0KEVrgvlBq4?=
 =?us-ascii?Q?IpIV/WrE0o0rehDu4bRSQ1pKXLrT50O0q/VAplKfwkKJCeRfoIiAigYESPTN?=
 =?us-ascii?Q?miTj1YwrW0H4og7T2YWeIv/4qbdMgI2/j7aZiWSCajYuqwa1qrqAbsSnmBOc?=
 =?us-ascii?Q?nhb9/JVDMiQK5KHTtDWcLTeP7D9gdzUvKAxKy98rfj5cVOaJy1PGSRCvy3bw?=
 =?us-ascii?Q?faC2aJbAHM/RCIC6DFAYGwWvbxVL5MxgQA9N+dkZ6Q/L1kiq7/uC3GRpe4R+?=
 =?us-ascii?Q?kcJGLnOxuihOmPr6DkoUBh2XZ76I5xYIsvJQstNOgLXeeOGLBxoxOd/f0eig?=
 =?us-ascii?Q?ULkBqKaDpz58VcbwbiWNPDgsdSQfi7xBWZoN+qhGH2A/sHWiFlr2Q7bufC6H?=
 =?us-ascii?Q?0TW0upW9w1a9Y5s4wJd4aLPl2rQ37BbUvcEe7CsISOVmCRE+EkUklFGlevjD?=
 =?us-ascii?Q?HprWIZL3sDsC0TTH8KatKHbkn0t9DQn672xHhUIaynKhPJqpnmBK7/5DRHef?=
 =?us-ascii?Q?KL/y+IsItyZ/FmtcovwLyWXbx4VRDWQI/q+btJSlVS+6t/iEVpUNYvyzqgOy?=
 =?us-ascii?Q?Z/7B9DItjHM8CcvktkGGDqKNG6MgVgPt?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI2PR04MB11147.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FqV0Rgo6Bbcxyw0BQGcWBPDd3AHcRZev2D9CS0zSaFe0nhBdQjDQA8Np60cy?=
 =?us-ascii?Q?frMTmRoCBsAoaMbggUevaXbWYlJRhi/YRaqvJp9I+APGisA4BxF9lC3zYeSA?=
 =?us-ascii?Q?HuCLqQrH8d7WI8NmAbWqCoVxKBKvjHYZlXoWX9u2VL73mNKkec/9czkDhskL?=
 =?us-ascii?Q?pYbXYqkkQc2L4SmBGqdypzSLvKrnEzV3S2TaHFNfuTZvpxGJNNGBaztT1X2g?=
 =?us-ascii?Q?HEMtmmscgxolOhAXE/MHbcOSrk7ZT79/a1aHxvXc72tVzLjU7ajMZ7wljSE0?=
 =?us-ascii?Q?g5u51hb4PR4mktXzJs4+e9meJmUcQUrQVY4C7/oLQrornWnX+b82tUKi/ia3?=
 =?us-ascii?Q?w6btmerZbsKLeD7nEDUzJIX53DXpH2QD/d2duKtQXZj67mvgrb8gxyOhPz9Q?=
 =?us-ascii?Q?JtGJdDNBSArq0KbSeCCZxiIWvj/PaM9Q1as4yERP75qGEe4VIWwD9BJ4I1hJ?=
 =?us-ascii?Q?Pn2PaTJqf//bp1rCqLFixd7TV9rQNPbVTk6u28F9aJ5qg3mn/bKNJWQlHPJV?=
 =?us-ascii?Q?7o4Tu+taoDv/IFuIQRzjx5y7V5JTReFUEI/f+/IbhceNJ5stt6prTaLu6ka5?=
 =?us-ascii?Q?all9ZtYoBpsazSmIho1gtkg2/k+Y5xI6AeBoDcDGlprxrEEollyUA3xA+QJG?=
 =?us-ascii?Q?AL9PsBCu1auELgA2vFbG3wtsCWcjdB1fTlyovHHBMycrCz6cdYinZwn0pXb8?=
 =?us-ascii?Q?xY1ThMZM7yUuUDFCLDHoWngtbQnNU+hRg2mcLkd4poBYYiJ/VbDtqCOwvSYL?=
 =?us-ascii?Q?8Sd5mx/mgOCIhFzCd7kI+sWhoNo8cUfGhIqqVVpKPTKv+QJDuqfVwmNsKWMH?=
 =?us-ascii?Q?2ckcW9JwhV6LoZn+4Zoq6wNyDAT4wduI0kGlNRsXq4opVlasrrrSzhSilG9Q?=
 =?us-ascii?Q?hLPG/yRXoKjWlxnK8WjUyaMFjZAYPBuIGdusqDj2r4xQ1iBijUz8lrrF8xOM?=
 =?us-ascii?Q?ExkhYe9hI3ShOH3Jjv48md41xUYaBGt2tqDwQJUIISjwsuFXF7DiDHvaH5Ey?=
 =?us-ascii?Q?8mcq/B+1OW5EKL6MzGhEeMU1vWMhcWgcIAD3SxeUGZ3HADNBe1c2ed3e7lHU?=
 =?us-ascii?Q?zz2JS30c7ErKHeAagOlofJo3ARleeerjQ1sQoFYvIlIefRozqTmyKldExvbm?=
 =?us-ascii?Q?sIsMPukR8IBhZz1605mFkywjUE4/asRroq0ItASst+MUDuZqrtSmIAGKaZHf?=
 =?us-ascii?Q?w7LdSujvnhvRcOFRoIsO5qxNsnyLj9Wpki5J6aT6sg5mEAXgobAWqfNFsIok?=
 =?us-ascii?Q?cY3Wd4ZNvNcBbKk1FlM1fSFepkPD5XOiEXJkpFtwhU2TPuYw/afS94AkZsCx?=
 =?us-ascii?Q?LjadgewA6ryVUtGqiUxB969hjkdKK6AKJApNX9lspHHtMqA/0RazBkGjHhfq?=
 =?us-ascii?Q?rPSyvL+isDqS40/5o0Ak76tvZtknyj122AjFOEaH1BI4ceF7Wha7nuXFQws7?=
 =?us-ascii?Q?aQzuqXydB4FInwWrLbsFhWgoKZfx5UbBvXnMdBF0gSBRN5z05ECN9Clk3WWm?=
 =?us-ascii?Q?DxJzwLufnQVwa8yrORbwkkCvHQw4d+8ZVH0rvueNH5+/kUSLkRgA9H/1zHIS?=
 =?us-ascii?Q?4h5n7ItZvLLfd+szFYVtTrbW1WMvUyJnQhOb1G7L?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 87615b89-5461-4730-a77b-08dd72905974
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2025 09:17:25.7657
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PdbYWVuSOFu8syMQ4tF+RkPT3hQ5otl6cIS7MyWAchEPObWCgczxPFgFmV6onChm4Ki//C4q2WfEQUh9ZtALnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10632



> -----Original Message-----
> From: Vlastimil Babka <vbabka@suse.cz>
> Sent: Wednesday, April 2, 2025 11:01 PM
> To: Carlos Song <carlos.song@nxp.com>; hannes@cmpxchg.org;
> baolin.wang@linux.alibaba.com; ying.huang@intel.com; david@redhat.com;
> mgorman@techsingularity.net; ziy@nvidia.com; akpm@linux-foundation.org
> Cc: linux-mm@kvack.org; linux-kernel@vger.kernel.org
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
> On 4/2/25 13:31, Carlos Song wrote:
> > Hi, all
>=20
> Hi,
>=20
> > I found a 300ms~600ms IRQ off when writing 1Gb data to storage device a=
t
> I.MX7d SDB board at Linux-kernel-v6.14.
> > From this discussion I find the regression root cause:
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Flinux-mm%2FCAJuCfpGajtAP8-kw5B5mKmhfyq6Pn67%2BPJgMj
> BeozW
> >
> -qzjQMkw%40mail.gmail.com%2FT%2F&data=3D05%7C02%7Ccarlos.song%40nxp
> .com%
> >
> 7C30f153ecf3234bf3619a08dd71f72e6b%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%
> >
> 7C0%7C0%7C638792028628801379%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0
> eU1hcGkiO
> >
> nRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%
> >
> 3D%3D%7C0%7C%7C%7C&sdata=3DhqeX9jfdbi7wcq7JZaVawvZKoD9yLGyJ9aIzGX
> pdS38%3
> > D&reserved=3D0
> >
> > Before add this patch c0cd6f557b90 "mm: page_alloc: fix freelist moveme=
nt
> during block conversion", this longest IRQ off time is only 1ms~2ms.
> > After add this patch c0cd6f557b90 "mm: page_alloc: fix freelist movemen=
t
> during block conversion", this longest IRQ off time is only ~100ms.
> > This patch is added in linux-kernel 6.10.
> > In the same test case and environment. From 6.10, as other PATCHs are
> > added, the spinlock time gradually increases. At 6.12 the IRQ off is ~1=
50ms and
> at 6.14, the IRQ off time is ~300ms.
> >
> > Run this cmd to test:
> > dd if=3D/dev/zero of=3D/dev/mmcblk0p3 bs=3D4096 seek=3D12500 count=3D25=
6000
> > conv=3Dfsync
> >
> > I use Ftrace irqoff tracer to trace the longest IRQ off event. Here is =
my test log.
> Do I trigger a bug?
> >
> > 4 Ftrace logs of irqoff tracing on the same environment using the same =
case
> only with different kernel version:
> > 1. Not add the patch 2. Add the patch 3. At 6.12 4. At 6.14.
> >
> > Log is here:
>=20

Hi,=20

Thank you for your quick ack and help!

> Do you have CONFIG_DEBUG_VM enabled? Or maybe what's the .config in
> general?
>=20
I think we don't enable CONFIG_DEBUG_VM

In .config, I can see
# CONFIG_DEBUG_VM is not set

A Snapshot in .config:

CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_PER_VMA_LOCK_STATS is not set
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_VFS is not set
# CONFIG_DEBUG_VM is not set
CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
# CONFIG_DEBUG_VIRTUAL is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
# CONFIG_DEBUG_PER_CPU_MAPS is not set
# CONFIG_DEBUG_KMAP_LOCAL is not set
# CONFIG_DEBUG_HIGHMEM is not set
# CONFIG_MEM_ALLOC_PROFILING is not set

Carlos Song

> I guess we do more work in __rmqueue_fallback() now under the lock but it
> should not take *that* long, hm. I'm not however sure if we can split the=
 zone
> lock holding here.
>=20
> Guess we could at least optimize account_freepages() done as part of
> __move_freepages_block() -> move_to_free_list() as the migratetypes are
> always the same so it could be a single pair of calls on an accumulated n=
r_pages
> count instead of pair for every page moved. And the loop in
> __move_freepages_block() could have an extra struct page * iterator inste=
ad of
> pfn_to_page() in every iteration.
