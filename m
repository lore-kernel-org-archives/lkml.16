Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B882F4A
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 05:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749446518; cv=fail; b=WT9Q+rBcnKqEy54UZKY9SpjKHK9nbUCq7qCq+bCGIDa6KhFu++yM3omngCNothTUEqTol1ZzuU6jUZK9OwK+GR25fbDrgJYSrtNFOslEFprDAUJjS9KXgWb2u4V9o0p++LFEo7GseGAPvmlrVZ9K9yDhb7yqV2MKGT3iWc7/rIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749446518; c=relaxed/simple;
	bh=yeRTQNzE3RVjldt66QpijyYZC8hShstP4daXT3Yq2I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lUuH/1qj8zpCOIvQO2IZyydc2UN5upafpuRUofP9Zxc4jpJfhPN/QmgdWqpQ4ik1dI+UF3U6bszo/mv1vm5ZpC4frylZT5Loq0x/z2D1kQTi15L86QLADjuDgfCZO3OuOAR9ue+gHw1trgH7t1ZMN3arfHS1HPx52Wzd3kZ1JNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mw/alxHY; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=sFoUuGvp; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mw/alxHY";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="sFoUuGvp"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593idsN006154;
	Mon, 9 Jun 2025 05:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=FnJJuu61Yd5l6BoPfP
	Eo5WQ8pwtjfUEwayUvBKwRrSw=; b=mw/alxHYkkOte3FAM/7B1XOmqNx0x9/rcU
	F9ZYjS+nXdUWC4gNhGlKfkJnBLivrQb5usOyClZZTiLQjB09tLchgcMGwaD29nBU
	aqwE6yYmZn2Lrff0YIslsnzBRN2GHOs1YN5fbQP4SqZWy2R2T5dAsByoL9UToFdj
	XAoNA6aM175Q1Z/+/zKcc8nSYqKMjlh9jkDrkloVZ8uwTRfklnlM7XhUGW3TDTuI
	s/SK6mCITXGBOECc1MPqHoePNRpZBJ+p8HB2REqMWkDJpv6UMNXB+eeThz/ZLB3H
	5Mak4CRvvDKTBlgka9Bk0dkvFSux/IyLEhhUyNfgNc+B1+yMgzjw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4752xjrtym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 05:21:28 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5593FAQS031941;
	Mon, 9 Jun 2025 05:21:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2077.outbound.protection.outlook.com [40.107.93.77])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv71uu7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 05:21:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H756pMv1F34PeiTm9VNq9wG5OTrxgOIw/WOgwNXyGPf9PTBy1tS0kZsFckLVzv+mf/KPSrt0oWD+6cKXxFIb1HkWfYaYaJ3zUXvcDJ2nHfI17q63oCeWwQAXZnED+80eLjEtazw1Qzx8Mr0bl67CvVa+HTxKt9SaO69ucoKWRnEKu0PfZtrFGHsg8KXxJn4EG0j5G691Kh0P44ujV0uTPoQi2xogfat4K3fg6ZuLsIC4cvegemzFAjiKeeBXLNSUwnOBT+7BoNds5YvEphK5yVRIlgm6ZYqnCs1gQgKuEhTXHTMNKWz7x85hgA+fXhJ2+1Qn+r3vdGNKxcuwBNkq+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FnJJuu61Yd5l6BoPfPEo5WQ8pwtjfUEwayUvBKwRrSw=;
 b=N+nHKMGig7bQ6dXkwh+4vg7dkpNKEdbOjReJ3Si1kC4uJPAMHp9wj/7JjoHjcM0H4c+pUZvHYomgQNDORd0K6nCuh/yDGqTpovfXExK6Ba64DHpGRtAf32nVFtVj/j8kTxRKNS0FIAYCrIjnpca/3Gjv4zGjeTDX7NCgrBT/ef3Gak6Fv96clZIafT8ll+NWKg+NZRTUcUg7aTE5PM3m6G0ta2WPPTFs07JiI7pzrCoUf9hxSkc7orYxsUmd+nhg2DbNl7K6cTu1/TEAe6saA3C9pI+sXiwm4xh1/SqmlVG0AeKlAmNnEtVCHC3vzjD3gSNNsNPizLpXbsk6HNq4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FnJJuu61Yd5l6BoPfPEo5WQ8pwtjfUEwayUvBKwRrSw=;
 b=sFoUuGvpfri0S9LbtHsXq2yhoMFa9T9s1WtMtSJovejHFjm3TqUs0ly6k6NE80E1NNssMT2xp9NBe4INSxh6P3VpdCOIbrry9XtK8RXBzFFganTZcV0qiustiRiTz51kX7rTXzPbbr54GfLC0HnM1ChPPoDhiL/zIfrrTsxJsQ8=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CH3PR10MB7609.namprd10.prod.outlook.com (2603:10b6:610:173::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 05:21:25 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 05:21:25 +0000
Date: Mon, 9 Jun 2025 06:21:20 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Barry Song <baohua@kernel.org>,
        David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as a THP reviewer
Message-ID: <8f5b94d7-d1df-4ac9-9304-a0b32050c411@lucifer.local>
References: <20250609002442.1856-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609002442.1856-1-21cnbao@gmail.com>
X-ClientProxiedBy: LO4P123CA0142.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::21) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CH3PR10MB7609:EE_
X-MS-Office365-Filtering-Correlation-Id: 28494fa4-6dfc-4f36-5912-08dda7157aa7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dIgkG8LC/haIeO+gbXOLt0WnKSVsujFGlsjcf5/MlzwoTB6fiGbsAfpf1U7L?=
 =?us-ascii?Q?+xHfY+un5jmoyHGT1gpz9YZ0eqYBCbKnn6ejdvkGbwQJ+kzi7ZUxCnt8l1qW?=
 =?us-ascii?Q?WeHIAFunsS3SbKNXrIrLaOvGOqYrqjl0Oksvys9Qdn/J/TPbphUbRo/2QagW?=
 =?us-ascii?Q?OrXW0BlA/1l+9V8ECc5Dv2JpVdGH/cD7qfsFpJ0QsyVX7a3c+9/XviLHo2M9?=
 =?us-ascii?Q?5CboZpd5GWqCbnNS3O30Q+7Wz8ke1wq/RxkyhaFe9ISaVSbp9fO31Szvp9po?=
 =?us-ascii?Q?l9AXZu/Hc7aqNraBhQznM0CEiD+4vBFUXOIADaf9KY6gvUCEQAcTPs8er5sV?=
 =?us-ascii?Q?y4y8lnhH11SFCRkL1pWlM7R9sY6RYdnij94VakJMxXcNIG7uaPOZDR3Rv5so?=
 =?us-ascii?Q?iG0qqr/mz7eDgkfsMYEcRqTM4Sj0WKszuA4txM11xWhaMK6bvw+aKy1tqO11?=
 =?us-ascii?Q?1vQrqWh6H54htaEd+cQGckxv1SMtku5kCzsTedfVPV+NXi80420g0F6MJOCS?=
 =?us-ascii?Q?HJ4OMkpH74yI9OYKVtQAPEvdy7l+twVl3JwwnUd2P50OWC9lEgHFDICd506l?=
 =?us-ascii?Q?Hg29HYrcPTgrQbd4fZb7xHYdXxA7sDFWtAk0x/To8jb7+U0doSCY6BDoerkw?=
 =?us-ascii?Q?ViiYbINUuS6jzUG82JOZtfmQvjgMilG0nkkeKR1qVEKgFOhD+J59fuHhiSBm?=
 =?us-ascii?Q?pLWrzNDRFemYakdxDer+134VoOc8JnM8BjevcRLPxUdcjOr5zdQsIUyFp3mS?=
 =?us-ascii?Q?I9+dFXRkrGRPj3uEIERJ8Yaon+BPswtQ3g51+18CVe4t8/taQhUKidmc8VG8?=
 =?us-ascii?Q?YpesNfTPHpj/NDfpG5MgCvxY2S9mG5QBZDkEw97fG2PTFPBTeYn/YTSvDRIC?=
 =?us-ascii?Q?o1NOqRE+/3lKz6/peB0+FG3ODIyxdcxyNyg1d9Hi5ESk8fLlA6N7XW3+MDnw?=
 =?us-ascii?Q?XWnU5rMQusN7ulmA9nhJDrZY8sBO/3pHNi4R7BxchKRGF4dgt2yjDDLlHkLP?=
 =?us-ascii?Q?uaS/scNOcH1YDpEUw5uTotCU6PW9Bz76YbDLc59vF+tUIUM/6HLeOarqpTCp?=
 =?us-ascii?Q?KPs9X5ldXG/hDGKsYcDTEJb7fiaEWkAlmaHAFsjvHQFvzIC+91dCiS8S1Qxu?=
 =?us-ascii?Q?yFl7FHm/QFGb794XOknKOa+yyBpJSmjhV9fBs7onRHrB+zFpwjSySroKh2u3?=
 =?us-ascii?Q?/XlZXdORCOZo48+Kwle2oo79PUSGgH/2JrQD+PAbcP9o7tfHd4hSnE0zM0su?=
 =?us-ascii?Q?01aoJnSLTlJe1WpTf2nwyhDvx09VVGeULlIblj/N6eLEvIxDDvVXO67JEpYW?=
 =?us-ascii?Q?nsANqpPLOGICEGOk+OIQULFzt5pmr73HKfyp36RTjVGkJHUvdMlxpcFDMxRt?=
 =?us-ascii?Q?XpnGMhE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Er6d33DgQBOD5yREtxehOBZ0Yb+waS2L+wYsuJ1rO2oQ6HF9b5Qn1kuqgq/y?=
 =?us-ascii?Q?/ZKt5NgmJYoF+gXNYTQ5UMgDlb8QLBYtak85458f+QTuOipoCVtDLCIknTnk?=
 =?us-ascii?Q?r7MSfAYZIgC/fAQxkYWWtGy483V6IzMAQELeyHGEFS4ZsNn1lX6pv0kB1Pyz?=
 =?us-ascii?Q?z5PArSqJ8KRSFDmT49XDuXGvCEc8+DebSvCyN4NpuXQADxXxFy+2Hc17jyEP?=
 =?us-ascii?Q?Wup2j0jkia6rSD7HexT2kn/6WnuNP/BJEFQpX5LJF0aHgzmkfJcW/XEsgyTD?=
 =?us-ascii?Q?mkea4YUkQ4kHXinbV9W3GdQ5cuHj9CAWmGTswEfuedI0FN0M4Fd3jXg8y+26?=
 =?us-ascii?Q?O2TdM+C/lwdZNpPp+dKMd+gcP8y8EOM9U1p6EbeJxqKR1noEcekyXr7atoKD?=
 =?us-ascii?Q?CMLU1RWw2qwcLKq4CiN5QnMuPgeQoe7BCHL3nxCOlsGBN/DGZp6f4XIoUbCW?=
 =?us-ascii?Q?oSkX1uyBVRf12KObUmonmpe93nFXYkQoK4edBVXSVEk2g+3Rv8RhHkxNCz3G?=
 =?us-ascii?Q?sHExEo2dgtXoD1vwcCiON6IU8uz7VaNDLTpfE4wvJlaC167S4T0Xw72p+5LQ?=
 =?us-ascii?Q?JdbTAsGRrx3U7tCzc74cgRj8VQ080ZYBaO+BjoNYrcaAjfVXjFWD91Ob1rF7?=
 =?us-ascii?Q?gTgpAFcf2JHTwcZACJyaMZBycKLrXx3SFJ9Kgikp0cf2aG+t2Kb/3Xn5xJID?=
 =?us-ascii?Q?W3sARwr0T9sl0tLpoKheL5E8ExG4GNM2wDUANukPDonlOy2AV+hXjnlYYkkl?=
 =?us-ascii?Q?ztr5Suy/4taZ2DHhNLjlLbfvZU0rFyxqsnKf/u55eZwNAjZXjz1wqpL0egOm?=
 =?us-ascii?Q?GBtrX7PiSgT+TeHIbJ1679yFu4XfpfqDz8S//AzxQDzJl0GKRemfAVMiO6pK?=
 =?us-ascii?Q?DSJ2bn3H8EvR7p/FSf5eYsJa/iYRu3UrpWGgscF6Uvm+Efm0vN0moclDp46s?=
 =?us-ascii?Q?8vrZQUQ9NFDn23ssk7s+qH3QgoVMSGJhWAkveDWwgUB4WHZil+7ecw3rWJAy?=
 =?us-ascii?Q?dWFtaukNPK/ks7Z5mEKqcfgO7U37NhjmNSVba7RtlB1wzt+dxIMUaxCHKq3d?=
 =?us-ascii?Q?dWrDygFRZY2wDT59dGm9KxLt6QLDZF62WGdP8WwFt+dCgFsGKZ7PGk9QVl8h?=
 =?us-ascii?Q?Hmj/IpV1+884ou7NNbwb/Y8pBPOlbUW3Mm4Q6NGfrTwFrR8/saWL+z9HxLep?=
 =?us-ascii?Q?/Bej1rdLXGaBmSofQ+M/qqr7HTILtxIAbj648bAizjxRbhOd4wwZWpiMsWI1?=
 =?us-ascii?Q?GVtJt3iga7M2PfHOu+714u7s0cibZnZiXoKinZma45+vu6h7pqJolw1Uir3P?=
 =?us-ascii?Q?ohRtnk4JoWZ0qHM0BNADhgEJC/tKqK0Bdl9IpZL04xRQf0m3ns0MFuE4/Cfh?=
 =?us-ascii?Q?7VwIEu81W17rDXnuaMvA6x703lfEYjoRsFTEdb+KhhBGY0B/YO3hjzqkEN+f?=
 =?us-ascii?Q?t6dRNov+sKpeqciyuhx2+TsOc21jp2XuRMVtb5EVY261dbJSCWo9guXx1QRT?=
 =?us-ascii?Q?sAxhavrVrAOeOmZkAnv2jSRyW9Me6fpIrNu4/pJxkMzdskLOZpKPppazRGs+?=
 =?us-ascii?Q?BXu4aBz4xEk5pHrMWeVxnuiN9qzmrOfrEtVzhrHoFDlZZ+DLxlPr5aO4+WjZ?=
 =?us-ascii?Q?Kg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+ioBQ7ITu0kDhvuSkTEhbpBiC1YikN/iCRBvWB27t7JWjF7ychMHrR3EymgKTMKlSo47RDdwO0wbV9brrBrPNgHDdAcwWcrtX8/pIoxVxz091XVgQrxMBzB4wJRWF/LS077sIOtW5pEMM5dKoLrn6/XMT/pvXpcU8MOpCvQ08FeeJF0LoTN+XkwjVLbbKs7PMW31ZjWgPGV2CLPFBp1EdQnCfNBwiR47cfWapUEXeEq8beDAtXiWpN7bmoUdgEOLnK4TsSiH7aEnkva9NpCNOzp6yCzBZ9eA8hElnuASLpr65kZ2aGTOmNA2hHXji094TtTMVnPVSN2KMJM8vuVhT1ZuuGumJFc825v7L1LDoQ1Jg2Qxo4Xskl2aALiaaOwFj0au0JnqPQlI3DF9fYZeRjfVSJRITcGROe0atfQY0StSB2Dq/Qm1ebbtj2u95mYkacHn1Mdj0KId2mPy0Isa8qt1l3PNGOikYOzW/V2wSuHVY/QzZ3bLwD40f6Pu/NY5fJkqVbdeRrsfySrvibg+pkfxTpUgpY6237LD/IyD3pKjpp/XNluQUamAkAjyaMXxApZ8s4Rulw/zLrYOgoYRHXDQALPNnK0XWqCDUGSJHWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28494fa4-6dfc-4f36-5912-08dda7157aa7
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 05:21:25.1543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ppJelDD2eYJaNaffXF4w+43XsDI4ueSgLvjHNy/wZa248QO/NMw9sW4Hil4YKfTSLbFZ/H966tFskitF5gzRr/HH34Xzh3s9L0QWGX/+nTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7609
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090040
X-Authority-Analysis: v=2.4 cv=K4AiHzWI c=1 sm=1 tr=0 ts=68466f58 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=Ikd4Dj_1AAAA:8 a=SRrdq9N9AAAA:8 a=yPCof4ZbAAAA:8 a=7CQSdrXTAAAA:8 a=37rDS-QxAAAA:8
 a=uOfGiP3dBfq78NCPK6oA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=k1Nq6YrhK2t884LQW06G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDA0MCBTYWx0ZWRfX+VpHTpavvDwz ibLH8MdtQj52nQcWHeBRjLEw6uNstneKC8t/ooHfmpm970x7AjOtq54nO09jcschG5PiHHdruTG oXHP3W7oxL2Y6+0svXXfPYXy6eg9OlTfHUkSfBclXEZyTQ8mUuBwaVCX23mURKJwXTJxxKddgmM
 AxEzi9AM4eye3GwksgxpYKN3hKxNjORPCIwYAVzEcgD2EhBYk6JEdHtnty7v7QFm+UKxU4sPy+2 3Pe5kfs3IyPMHFad/xhigSEBsbCmcOd6CsBsSHmqcHidXZS+dtdYEDxJLt7CnHoZ9wEfTCT0bzG VPGweSIrsiOOQF+YXofQxxoPJXdh7tdHEnIz9NsiM9qI1CwDx0ArImwnaBPADO7RphPDbcs+Gy/
 A6z5foL5IBMEimsicrtrtehyv8AHmsBrzQgSdFQTCcP6vv4Q5cmS93WquUpGuZ+o5XOmg3iK
X-Proofpoint-ORIG-GUID: 1F6FQUcKAnuYI8OcSdcN_RZK9vGGSWpd
X-Proofpoint-GUID: 1F6FQUcKAnuYI8OcSdcN_RZK9vGGSWpd

On Mon, Jun 09, 2025 at 12:24:42PM +1200, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
>
> I have been actively contributing to mTHP and reviewing related patches
> for an extended period, and I would like to continue supporting patch
> reviews.

Welcome to the party :)

>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Liam R. Howlett <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Barry Song <baohua@kernel.org>

Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 99dcf9036b9d..c6770ebe2927 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15845,6 +15845,7 @@ R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>  R:	Nico Pache <npache@redhat.com>
>  R:	Ryan Roberts <ryan.roberts@arm.com>
>  R:	Dev Jain <dev.jain@arm.com>
> +R:	Barry Song <baohua@kernel.org>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org
> --
> 2.39.3 (Apple Git-146)
>
