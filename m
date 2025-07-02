Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2051.outbound.protection.outlook.com [40.107.243.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8C91F5820
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 14:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466251; cv=fail; b=nkAUG93GCjwtC0htTGrTbzRRXRGYkqUOQQZ7iGnLjYVPoKZwaJczL2Zr7w712386w7BiNW+kA0BOz/++0G9FRxR2Mmhgv7zNRmFvdQSBGdMo5f6MfCk+qZIitYDI0hgVd2Utnfv/XE+0B2w/jbqQFVimBsFe5vczhYQjoigHSSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466251; c=relaxed/simple;
	bh=K+KPupQVJSN1N/xSxnjaKFkcL6c7pm+cDcdncShrxx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z3VW0yuq3dlY0/l2buH17C90GIfzxEZUeZfQFCAPL6p86DtAq90jL7LUSpHNb4+qLjK/cC36Wyh2GThEt1A8Lym+XX7AftRIQWX38TACoiS0TGwIDtLwbiEtz3mBddp07oyfcfY5JF9HgkWL2S9bT96Q86u8w9FUrjhbaPcTZ2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Gi47KyM0; arc=fail smtp.client-ip=40.107.243.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Gi47KyM0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nu0qQOKa127tJcNtWBfmsywRjA0d3BM2vm6KtjymW6V9E8BmqAl9cHpJtllGlUmFCpCjQZ8pSOIZCmtlj8d+xM9dp326bRSdl7xJsr0r32epApVWsIWFUCrWokIUcbhTHleNzBQfaZ8IEUOyt/OVPDsYhpICKmRzLjITIZDxmVxMOzRQAmUggmLE95gfO9vbWSLIe321005TjCMKOtVh+elLD674MVKLA/5GarvKEoPrksasFRFI94tiTKkc+RWmseYW7FUkKJxHimgL/T91MG3TNWoWa3hg8FI8ZSs8uCKVPU0Xq/S17GOwm97LAea64pc88UoKU5L6p0mA2AW4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAtmTX4CUL8St6LH1QC+o93qdxRbclxwlW6TI4cWMIQ=;
 b=nCKPqpUwnzU4XKwI8vVh65HEiDs/0rnykQdVN69/8+Kmmmo90TZkuWEh3HaLlgu2vuqlGi8CRCNUfBT4SB7oCTdSuUmTUvnKNy+QIwKoUi3tQoSXH4YNfbY8ZB7wZYtESNGEJT/LdJaVs/qfsUrkc3E9fSJcHqmW67fXTAqstrkLqc9FQ7MGrnSe9mFbPXkYZZYUmmHM+4/Foz7LXTdxUNVo3J9ux3IrEnouUK36e06BAicUMS7APcl878CY9cWicifnnHPVkHj6775WBzddiWcVz5r0TjlELTu4TAnmtMTk6ky5msxonydTyY2GCBVbdip8gSkKbSWo9EeEFuZWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAtmTX4CUL8St6LH1QC+o93qdxRbclxwlW6TI4cWMIQ=;
 b=Gi47KyM0YV1BdX6rgBLVJMhcxa3pbG0vy1HLQaI/op6HaWHXIHnjGpXYCntqHHXUl7V6DGzCdCN4EwZPOGu1QxY0sNpJhca9gQjFajIBOLu6czWFlY+ed0n4ur0srszMBJiuRt9G36gOJBbYrCbOjzY38TjUQClpW9WS0PsA7pvtnoCR5SFoE1aO312gOlcoGRthNIDAvWsRsKRxwUsZzBlRYQpKEkpYOe4l05Iv5U7LpLVzkFYj1JAM8WoBY6p5D66dcs95CV668/5NWZscyu72aI+nDJrbo3PNpbjUxMInaT4jF0BZeSawLjxOYZurChJc/9a3u+qzTkpt3qhSnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 by DS0PR12MB8344.namprd12.prod.outlook.com (2603:10b6:8:fe::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Wed, 2 Jul 2025 14:24:07 +0000
Received: from BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9]) by BL4PR12MB9478.namprd12.prod.outlook.com
 ([fe80::b90:212f:996:6eb9%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 14:24:07 +0000
From: Zi Yan <ziy@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>,
 Lance Yang <ioworker0@gmail.com>, Oscar Salvador <osalvador@suse.de>,
 Lance Yang <lance.yang@linux.dev>
Subject: Re: [PATCH v2 2/4] mm: smaller folio_pte_batch() improvements
Date: Wed, 02 Jul 2025 10:24:05 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <E8B3515C-BECA-4F8E-8EE4-46A0C119E395@nvidia.com>
In-Reply-To: <20250702104926.212243-3-david@redhat.com>
References: <20250702104926.212243-1-david@redhat.com>
 <20250702104926.212243-3-david@redhat.com>
Content-Type: text/plain
X-ClientProxiedBy: BL6PEPF00013DF6.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:a) To BL4PR12MB9478.namprd12.prod.outlook.com
 (2603:10b6:208:58e::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR12MB9478:EE_|DS0PR12MB8344:EE_
X-MS-Office365-Filtering-Correlation-Id: b7990d52-77ba-40e4-9f36-08ddb9741ae8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vpGSNURm1a/aTBJuQOqZ0B4N1FRd978Ic3IaPFKh21OLfmAB+OKme32dYLjU?=
 =?us-ascii?Q?OZLzzJ6Z12agKxVVKhmbHeBaK/M6eVOyy0IaZOa6+7sfGVgyUq2TeHnhRpMy?=
 =?us-ascii?Q?g9sPwbdUX4z4+8oB4Q6aQy6OLexxyKFEfIR1srRmRNz2oEN3pHbV1ch3wF9d?=
 =?us-ascii?Q?vRK5uC6JdytTX/26AE2PqE4PVLhDuU7O4CR0S7qcw2CkcolgOyF0COhHm25y?=
 =?us-ascii?Q?SSgvImJqJq3jyOpKSg6cDq/3H30vmSXl1t6DtN4pxOzj8fgT9A6vIxQfkVP5?=
 =?us-ascii?Q?ll/wB9Nw33X88n/RLHDgP2+HUXKD15OQ4joRPkyp2+ldi4cuf4BlbbdU7UxP?=
 =?us-ascii?Q?45Cq2v2StxqJetfqd9JO3gl3DFXvwlSxmwwm/a12VxT9c+KFpf7vaRVAXaYu?=
 =?us-ascii?Q?xvV+ni8Wq4zztAwEU6CiX1BjajZV54NV1LOR0OZqaxngaehmBcR3xtPn5qw/?=
 =?us-ascii?Q?WU/Yhf2ECQ/tQ4CSKjS/j0UM5Vd82kiIyzNH4S0OxVpy/S4JkgC53iSlLgVq?=
 =?us-ascii?Q?hCdYprBsE/9u6MG4Mh/Bvw+nVke31kyn1nReMsjGXXRQ8UfyPcVBK3O3biOr?=
 =?us-ascii?Q?ZYIUBvZBrVpC09CUWFocSFN/YJqtSGWZx7s6PgpDd5pMa8FE8UQrBAkwxIP+?=
 =?us-ascii?Q?9vDb6rtKGmWxDnMK7HTl7Q1ApxzcG7c5XiR5W2Hyw1Pev/yC+c3rxih8ZiNf?=
 =?us-ascii?Q?zleAKO0ndbUhJdiFtzhqGPrRXEzLX48Q4/sE4zY7CNbgKxPDNTr6tGBWpupL?=
 =?us-ascii?Q?VZY/su0xAnvSNnkypWVj7bi/aRBRDfcuZ7jw3oEPqsIni1rzIMclpnaRlQTn?=
 =?us-ascii?Q?IxyWNTOta+RiIPRS9FitwUqo2DspN7hvGJAR+UYpFdKfbCd2UffuAtE7zChn?=
 =?us-ascii?Q?D9QE6YukSlZgw3oYp3GtHkx2rt+rc8h17bsOFHH682oRn8DEqIuzyXWtQwwr?=
 =?us-ascii?Q?sj29Fo4yjXP0Wln/Xam/og+wlldvayhoWqlcGddXuuqdgw6BC540NCchIB/Y?=
 =?us-ascii?Q?GwAasSitEIp6xDokaEAuE/FWS2guc7kB/sKiSYMf9plyObin437qBoF+P7B3?=
 =?us-ascii?Q?f55MOHJiUXezipLrPbBd0bcugIrwmHT77UnayJFQdgqYITVZ8nba6JZF5kv4?=
 =?us-ascii?Q?WzrmCiyFqj8O/PL+qnzn80MAVQ1c/kPVVoiJvBt13d2mKPnopijaeYIrPF8w?=
 =?us-ascii?Q?vXG45/cMLAjdpNplHHw+AgbSomPtGaIJxc7LAiocxz9xjCXh4IIH9e0RPa7m?=
 =?us-ascii?Q?Wq6rL/Q2ei+hT6/We8gWYoOzoYEbmr69OXV9YEfFErbgRKv13Ydwsb2Ppczp?=
 =?us-ascii?Q?BoJX5K5qNQ6MLHG8FbuFm49SAjGeAygnFMK4K/FtQ17UvQXW+znsx6Cs5hSV?=
 =?us-ascii?Q?v/7ZCZzuq26/pplBGDrNBWAED9KypBjhLg46HB7SoXbPw+aVsiKUB/iik66J?=
 =?us-ascii?Q?H4wP/1p4r5Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR12MB9478.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VzV7xgWfvzYu8WR1ZSXWmGRj3wfJKL/+Yn83rQzNRtSF28RWbduSzbOpuUAG?=
 =?us-ascii?Q?54SdZI0C1CeenL6cNidDnwJZkIAqAPNNWGSuaYjmG9RGqfSZ0z00i8a8KIf6?=
 =?us-ascii?Q?/jf5v8sAbwYZVAgDnDT+nq2Pa+DuYvjFrBipYkjZ/d79lEtmaQm+bqmFbC7m?=
 =?us-ascii?Q?+SVRB+ceXrrKGlglSRlVjBwb4coalytuavUJOt4uepAcg4SOBly32M6rg0Xp?=
 =?us-ascii?Q?JFmGPQLJhQPbs9m2VAjxs/crf7LRN2uKiirQOoupqbYnAfCi6xufr/M8/QsQ?=
 =?us-ascii?Q?wCv9AbDEb7hyEIMcj6yCVUnduBSNgjS+Aom1xO5PDosa/V3nSVV1o1FsNkdV?=
 =?us-ascii?Q?RCjjHsT80XpLe8oJ+ecrFov3SJz/XltaWR0Eaw/7XeR+2S5jH6WIVhKWhXRh?=
 =?us-ascii?Q?lc3ASZ9Ez0rpbAvwcrL838q6t2HEzgj6LNBjemJUFylG1s7mXhYQ41ttSG3G?=
 =?us-ascii?Q?bhKZeFLp8d7gGWqNcdbWzNc9cf9rNRX1tDZYFgPoUUmRvu5ZhRxYVeN76x1J?=
 =?us-ascii?Q?DlE6nAstZT/8vx1c0oLeePmxfjBoMQWS7FTdPdTQu1RuUDGOdzjArtTtZC+O?=
 =?us-ascii?Q?CMZvO79unPbb4RIqWAby4gwZM35aJiBCJ+QiCdmTcrxAZaAMilxirx/2dtCn?=
 =?us-ascii?Q?cIEcCfeGPl6joeDu57wa7TIHI0bN3dEqG1ne92t1uxfumWZ1YDJAts6KlT7c?=
 =?us-ascii?Q?KCxNHxMF9LQYRngNL98oFlmBWed0Gf2o/HVymsGg1Q7T3uY6Myl7JsVFLC90?=
 =?us-ascii?Q?YeW+yPawKqOd4JsO5CWAzptytGCPOx1ifOPw6qdSifxcROd60Fsd+9V8341j?=
 =?us-ascii?Q?EEd6yFzbV6xMABF9SPsd5lXmYTnZsMfgptuPdBijCqrcTyPjzdQORsW7whHc?=
 =?us-ascii?Q?ITJvlBOlP9K4SzKnsTgdNTKM613fgHl8IuNQnOEFepF0T9so7pGGNYKm09au?=
 =?us-ascii?Q?Lq7IwlLg+WabQjiWEJAoCVBimN+aaHjYRvWPk569L8VIf85EYdAm6grajtMp?=
 =?us-ascii?Q?CWSeb/bUqHvoFIe1rr3pZZme+CGOHJDuDLb3Zn4vHDoiDA6NAI1pMLv+XfTP?=
 =?us-ascii?Q?ti94HuofEkLIBdQlxliGlVYPYfYKqOhVwp5MIPEb9mcQUL7dUEkkDHVLzL7+?=
 =?us-ascii?Q?HN8ak/r4EBq0DzN6E/DNHC3Fg/41lntsdex+xRo5BqyBp9Ti13f2rLp0f0SJ?=
 =?us-ascii?Q?AGxvDwT7SQIdHahIv99DwMqVxNcsE+LWfGOje/2c95zGbfv1bTyMConyyBcX?=
 =?us-ascii?Q?KX6XIn0ELGEAK3flnbAPFS/7sR7VCdOBekMEwnUUdf/zp5rAcyECyLfN+gsU?=
 =?us-ascii?Q?Y5zBEEIa9P1ViQ04AkgQIKYNL8Hfv19WaiIUA2w4uSxT0pwlIn66/3264qIS?=
 =?us-ascii?Q?DgSS5llPmvONGSbcb5gEHkbgiqUVZz0ZJ6914y2y2MMLlMbUGvYmcPH2yyES?=
 =?us-ascii?Q?S2FFIGtwOEKUyAHTsNFt7TD5dWUU0t6vOZrUcl4qQim8MoizzTc3bP8axlq7?=
 =?us-ascii?Q?822GNxo/1lJUPvUWHFXzefJ2BEOwcdu5spSoGbiBeDp7STA5hv4wHsK0dglj?=
 =?us-ascii?Q?YxOcFIr/K15GTyZq8uzScbl4eKH++StD7Dpycm9q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7990d52-77ba-40e4-9f36-08ddb9741ae8
X-MS-Exchange-CrossTenant-AuthSource: BL4PR12MB9478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:24:07.6498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zhN99Ybedyjxdnatx2WlYjPjeti+G2BZwLQNbdOWQLdbdNDFhS5RZH4XbBcREjOB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8344

On 2 Jul 2025, at 6:49, David Hildenbrand wrote:

> Let's clean up a bit:
>
> (1) No need for start_ptep vs. ptep anymore, we can simply use ptep.
>
> (2) Let's switch to "unsigned int" for everything. Negative values do
>     not make sense.
>
> (3) We can simplify the code by leaving the pte unchanged after the
>     pte_same() check.
>
> (4) Clarify that we should never exceed a single VMA; it indicates a
>     problem in the caller.
>
> No functional change intended.
>
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  mm/internal.h | 37 +++++++++++++++----------------------
>  1 file changed, 15 insertions(+), 22 deletions(-)
>
Reviewed-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi
