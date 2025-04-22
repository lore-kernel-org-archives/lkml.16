Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25003238C2F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309411; cv=fail; b=P6fIfKWzvqDIMFcQE0uPdu19cNBzlJBtMw8WPr37zL3EdtzMBELtUUMMHSwooAFHQyFYbnVuMSn38akP9+4jX028V1GfQH4MqwumDoxFhT4jhSH2+3TTk7WJ7vh40OTViUK0R9M/V1ubdaGcrSSlRrVY6H9g8gPp6zwts1bbRww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309411; c=relaxed/simple;
	bh=Fupl4z2TcH+WS4XjsvQBa8gAwbCW2hAQ+oCC0Dvzwac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RMX6p12/YWj77+Ph5UXZsoB5GXnhHCn9fn5xGw7e88mkWr0NdppUzyoCbTK/uZEm4zltJB1OWV6wftU+N/ESj7d0kAhmkJBZcZVkpbTZnBUvJhnzaCRUY2nVS6PaTLdU5/0kEli+As0nxy5nq1oaWzRRctUTalrcI1Gmo97bDnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OBE86Vlt; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Eqh/NeET; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OBE86Vlt";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Eqh/NeET"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M7MxSL026357;
	Tue, 22 Apr 2025 08:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=wSV4zN21Wa7EchPbF45UaiWDq/8ezLpFW+z3ul22b2k=; b=
	OBE86VltrOaZP1tmGTrTDiy53VSH+kX5IQhdXmaYHyXsr9zWhSNcywdN1Ncr1SAA
	42AlHcmB3galUZST0ksK2a9OQbDJ84dj5Qwp6G6Q9A5zUWDED4i27LSGH55j10aP
	ehLPXKfx0vVsO/jVn7DhOgxdhFHPVsmzsdAlfzHpH+DAZ6W5ouggucvWfLTD2Se1
	2OmWPdudkFHWjafKbzdtDxssvL5PnFv/veuW5tEYKLWpLDcqMDvx0fGyhPkl6w9m
	QknVw4HAqYNYgao9yOZsfOz9Y/S9cMJplakhM/A1KOgL3oVLKlvN1I9SAd0koqGY
	HlZTe75wO1yiI1WlLjiSeA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4643q8ux5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53M709EG021160;
	Tue, 22 Apr 2025 08:09:52 GMT
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazlp17010002.outbound.protection.outlook.com [40.93.20.2])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46429fhsf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 08:09:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CM6lqtIyGkRpsey7hg+/BwV/U5elIt+zOZLm5aCvTQyIQRG/Qp3d81bHJae+IMk4DW20u5qpTmzR5RcntM6XIDZ1vvxBLPWqAVX1CHhPOjT9Kqiz/fRp+HXI3UcmoAzNrafw0+vl2xKJ2Y+paD4FzJKqI2UFJdBoa4MIg+nG6BV9qvrSC2YVxmBU8t6QO7TBNUfaZ+OlVwDd4qqkYb9TTp/zJdEVpqLA8IgI/eRGbrDTSjDixJgCYTTJSHAIUOyn22yoKv1AiT6F2LWlNIP/uI3c9kbn5F/xqn3RyP3J2ig9vE1AlQw2YpiRwIiSuqpTfN1JW7NFGKmZWVOvNZ8giQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSV4zN21Wa7EchPbF45UaiWDq/8ezLpFW+z3ul22b2k=;
 b=MFp8FQWPNhlYxdnnthsrKfQtHwyTJfSQMWwK+EO5DzP20AplE0JrMYzzNJV4xh6dVPg+y+4Qh4tsmnMyEepARc2Y1oCzfel5kcpOFrijXTYlslputj7qCa5BE5TMfazjT+A+5ewU9Ipi+886yMD7VqqbVxo88Au0y+gtro76NZ9K8iMNrRqwAwYby+HPwzXZ0wrPF6DIkt3ptajSouDmQ85NFpSbr9gzVvfRZ3zlT1Rp/OOwYo/LxGsce3dOmg9BK9uVP3uwAgzd/ARg90vOdTpIFmfJbILEnewCFyOOcNQasnQhN29i1hZHgO7bO8N+4iRX2BS5Ez/GHwpiJX9vqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wSV4zN21Wa7EchPbF45UaiWDq/8ezLpFW+z3ul22b2k=;
 b=Eqh/NeETRYLSI+bwTreUMnHtZ3LfMm7rtnnZmLa7ZL+Iej086y9cVmGSShpQ2jORv5b5jj8So07pDNN6+47C4IeAepbllOXBI8bwgVzUnT2tJXNm1tiQ6iv8R7+NGd1tEcs/ZhRr6MGgpfn55bG+hV2fmKjflq8XmviokZgNDwU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SA2PR10MB4587.namprd10.prod.outlook.com (2603:10b6:806:114::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Tue, 22 Apr
 2025 08:09:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8655.031; Tue, 22 Apr 2025
 08:09:50 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        David Hildenbrand <david@redhat.com>, Pedro Falcato <pfalcato@suse.de>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 03/10] mm/mremap: add MREMAP[_MUST]_RELOCATE_ANON support for large folios
Date: Tue, 22 Apr 2025 09:09:22 +0100
Message-ID: <59f428f2981d4a3349e8fb5c3a01a782fd5de2d1.1745307301.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
References: <cover.1745307301.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0186.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::13) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SA2PR10MB4587:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5762c1-d4ab-44a1-28b6-08dd81750e33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t7R5ljsPCYMq1UG36TZhI3ZP+JFBTF3GY9wqvHMkdW2jkFCJIj1bIiuKxU9v?=
 =?us-ascii?Q?62nSOzIPtjoYsIK6UY+eqtZxQ6WqNQCR1xs+liJkedYkFesmDOov4gJ2WhiB?=
 =?us-ascii?Q?rrklk/OKzXC3+CeHwnh6377NViTxoPMXBPlqBN+ZouKFy54AgRs0k028Aajj?=
 =?us-ascii?Q?dmGDF2KxeD4XacqxwkVFyr5jsyPKfEmdIuD+IWTeTmQZoPK4hDkfZSQaf2OM?=
 =?us-ascii?Q?/ABmtL/nxFXSRJ49TMGMu0rTxx7+A84UIBVGPOa8PltnF4fEimHHZSDTmuxJ?=
 =?us-ascii?Q?DnfnDMH1lV2rxXGsPqypxA/qGOEKafTmkMlCM6dSZjcddsj5gzTr7SU9hmQM?=
 =?us-ascii?Q?MordF2/58pvVZk4/OQ5u4lu2v7IEPS8pWFjCUwBqotLPECQBcmT4NWFhvi8F?=
 =?us-ascii?Q?nesS5eAWloRjNRisHch2oE3JHhHY4W5boKn8zrNByMbraZ0s1VmrAaT0CZlK?=
 =?us-ascii?Q?vVjYQv9ojLaUeBxAkriclsHXoHQEhcpohDgigitvMaLLh2AWpQzYO8w2w1O3?=
 =?us-ascii?Q?ZIThD17Wq39rji6rE8QLEjvyhXEnYTT+FuClSWVmRDgff8MfniYGq/TTsPlP?=
 =?us-ascii?Q?f9OKdXs5+Wo5LXTPyFzRJzfoN8xzjuL3K69SNXuey+B5LMiEGvtuADNaXuJf?=
 =?us-ascii?Q?kdihDnK7pDa7ukVEnk6jnbYOtaBvGP52za6nlHHGPhbabRH35gcdjh01ncB/?=
 =?us-ascii?Q?EgoHAMl+5uFmi3xRXOWFvu7M7MRbEhJwfXfsWxwmxb52EZ1Nh15vLLf16JJX?=
 =?us-ascii?Q?O+Wj9jC8Ph+tqI+Am9xa9llZyV0P0BWUPOAqdriTDLaGkuBQQqBCp0BBu3dg?=
 =?us-ascii?Q?5k6FWdIdxvZv3EYLYht/Vny+UzUtWCjcyYdgujp+WKAxQaM9jTgPWYz3WkX2?=
 =?us-ascii?Q?aYnZbrITikHc0WXnVZ2b8z7oosjbQt2Ic4LddjxC+quucbcziw/mKehLV1k8?=
 =?us-ascii?Q?Kta0mLADftKK4h/v8kdjzAZ/CmjSiHiH4JWp7GvaLP7uHcgInYTpQMc3j3MB?=
 =?us-ascii?Q?3fjy17RtqfCOzfRvmP9BJBjiCrdVSRVNCRp7MP2oBoLAgCEWaaJVnSr8R7ex?=
 =?us-ascii?Q?xX3KhGtZUNm4TxxKaFAoRH3BuxXY+/dE5wAQWxD3RVgoDWAmNcL5mgmhQJ4V?=
 =?us-ascii?Q?Wmo0BFToDNyVFSKydx7qejwfwaXHg5tYLySfSY8Npdza74EOVnP6fXmPyfmV?=
 =?us-ascii?Q?YrsdYzYYFOOFItbPQW70ptrCEuMDa6IDVUPhvA1IeqekrHickbBkbD03rYhN?=
 =?us-ascii?Q?OAjEPBGhXgPTzZz+OJW7dM1NOWa2xcihKRr6T4bcORqkp3QKT5DQkt4QnW3G?=
 =?us-ascii?Q?Q5L+ktSrJtucXTlpTZTc34Om4DktoM6FLveq4emQTt50o6Kz5h88Xchd01X1?=
 =?us-ascii?Q?3G7lXgTPPQz+JZzZuzQMOj173j64Kt5JQ1VjdKPEgzFy6zc7HJVZXmaoza9S?=
 =?us-ascii?Q?zRks2u+v2ic=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?K+OWyNntsXL2RiWSxgDSs4zASz8k/E8al6vpUu+refDGD0u0/F3vLesd5VA3?=
 =?us-ascii?Q?RdIjuRl50xgkaagR1f5RuFXCo1K/JpZghvVr9gB75Lvp1m8CAcUnym+qBlCb?=
 =?us-ascii?Q?Zua0XnryqIqW+3f1S/fAw2Sa3nuCiRV6+dSZRwJwIVaagb9KyFN8yMs9masy?=
 =?us-ascii?Q?yUweSIBy6xfmy3uQ8OMRQj1LLFj88kygL3dK7TbuHbW4paE+JmJdOAFW0K+0?=
 =?us-ascii?Q?RxoCyazZeD6le7mYYbQziBwH7CT2lmwjNg8ia+2UrN4fBvTCM2KW06eozgPQ?=
 =?us-ascii?Q?nKCHOw3OpxurFQyEdJdIzEE+7jPBXLsxPRRM2VrSimYp63zi2McY9qBpkcjO?=
 =?us-ascii?Q?X+9EAHtMZ7+GXIeM3LNXpvIkvrqAr5p1Vb9Pi05TFTn6FAquYcW+MgUSLNQd?=
 =?us-ascii?Q?b1PtB1QYvum2lT2IEh52DqLk17bK5tJTwRq8gda77AYKvQL2CpHOjpIByQPc?=
 =?us-ascii?Q?gqB+bZwam3v25ohQ+2fHd6ifOaMUOxTs08QbmeiBZv3wEiLxmjR062Jy1Q99?=
 =?us-ascii?Q?S8hYVrzBLmRqcMdaT8OZDPk2JXO9I7K6E9qWuDc3WzcGGwU7o2Xhos/GdbXF?=
 =?us-ascii?Q?CAxhrjNNhtbdOehgKguJfnaxS1FdYdY4ZpnAjs8ea+YencOXE4KZkQfgefHz?=
 =?us-ascii?Q?YHIFrz7WIIcNAdXTgdP6QdP+KUQDnh9ZqMzyJgjHyLMao6cE1oFUXgy0XcFl?=
 =?us-ascii?Q?YctU3IZX0Eg3zTKdI5Jh2Mc7iJSNBuEw6uWrCN/M4MV0OPbwCzIJgcuLMkwz?=
 =?us-ascii?Q?z2+k1a/thg6dP93y6+bjOpWGiqhf99ictGk9GhN1EbO65zW0zkBxTPDeZQB7?=
 =?us-ascii?Q?jTy3HqGlOH5tObaB+QhitxUuvKkUOwSkc+BQoR2BcFIA7Sh12eNmdkwYoYBO?=
 =?us-ascii?Q?qji9dpCIpXUORynwZdjvAwOuQ337GVRnQL2iVUMvj0L+QMULxDa7hk8+fECj?=
 =?us-ascii?Q?aGphw+0BqjUenciK6UrOtVxY8c97C25TGaNe2PRp9q1RGK6ivHRQDOV3290m?=
 =?us-ascii?Q?Upfm1D2tdGS8ciJ+cI94Apfql4D27kmKs6gh3H48/39P/JSPOUg9CTO5xumM?=
 =?us-ascii?Q?B/ekEbK+qlzKA/UbyMOGG6VwyNKMFhcQIsahlBXA3NKN6yl1EniIdxklsVrA?=
 =?us-ascii?Q?F+m3sOzVIBY1T9lHfGi/GgrUSeTQyVheR+VVkoJaXOlR30KcW0dCvcp6u82f?=
 =?us-ascii?Q?6NH3XHOi3u9ntJzG9K8kYjymaM2ZXShnSOJPTfcg+JwIQzRMKDsuBg1+l7Yq?=
 =?us-ascii?Q?1SPePVVMTMksHriF9e+gaye8NscWiBiEipwk0BvBU4+DFKFPszw5v/DDtYGg?=
 =?us-ascii?Q?DMmBdrx6ySsbHz6PORjXGOIlq+W51k+nCvD0hIHAEJ9EGEK2il/kKedtOkQN?=
 =?us-ascii?Q?zXR0HnArFuqq89s/wm7iJl3L6CC9zQPIfwfj6d1IH7l+2UFz73OZzu0ggNVM?=
 =?us-ascii?Q?z9tnqy9l7p2/2p8oirEtmXWoq/cEdcD1nXWh005mw7WdijhNHvS31XsRt12M?=
 =?us-ascii?Q?ofahUn8ThL7ZWvZoLxzG4golqkS2DqfyHUbhTS5X0OR0xnBvMYd9L9uksAW+?=
 =?us-ascii?Q?u3nBY5DCaiQMw/E9Ewb5vteZghCIJEPYUEbyDKLFz4AztQPjm+VtTjXeNuJA?=
 =?us-ascii?Q?PQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	sptZT2DjJ6Cmot/+W/jmaVLMGjxME9wg0nriaDjuvCOujIiYge+nQ2lDWVyaR4T45NmtwdzJwv3PQO3nakjmGrpXzx4gAllplDyJM1Cv36OqhCTogyGc5U+4URrFqWkkIr954slTq7F7GZsHeb4iDzVTmYgrFthKrYv83gxCeYac5M1XKmKTnWJdwSSuhGXQX4wNtbX13Pp/iHfkyO1YomMGuD4alnY3vDauw4X+A+kVCG26Q9AxsOQrxt9odRjgOQUphywAyXKrCWINJnp16ogavXPQrPSNHoEakg/WObFkgVEcXl4z5g/M0orvOwRGkLQBactHsLF5RsbFB9d6i7dEORAqgxz9a2m8MzFUlJON+XCgawgNlX85F8bcGDI0g/x4y0ODPx4JaMIPruUalPRzT2lhwmeC6B7s6MUjavJSIBI+lElfZ4kmiBgpQYVxwa0wTkV9+ONzQvzenAHdmptc/TJirRAegPQ67LB2vwwZN5cgJZiU1jwHF26jhrEA5EGZtpk/tnRI09lZXXFyzoaOm/zO+bysTOfnR6X8Pxt4qkAZ3naozD+ZT0/QhavhOvPnyiyouw4LJ4nY203QJUDclCE/aVmFkTwjCpEzkRU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5762c1-d4ab-44a1-28b6-08dd81750e33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 08:09:50.7625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f74v+BklhWmCQk3RO07J5kutM/9/etQhZHT1TdClQR1bu3D299sbpJYH3b7fDv7s3XAmfPiplVvw4wbXGhBKDhW+QCmdwNBMvSs1zSEGiiE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4587
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 suspectscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504220061
X-Proofpoint-GUID: sie6S85W_KaTsEytWEwUu9D88UhAtnqy
X-Proofpoint-ORIG-GUID: sie6S85W_KaTsEytWEwUu9D88UhAtnqy

Larger folios are a challenge, as they might be mapped across multiple
VMAs, and can be mapped at a higher page table level (PUD, PMD) or also at
PTE level.

Handle them correctly by checking whether they are fully spanned by the VMA
we are examining. If so, then we can simply relocate the folio as we would
any other.

If not, then we must split the folio. If there is a higher level page table
level mapping the large folio directly then we must also split this.

This will be the minority of cases, and if the operation is performed on a
large, mapping will only be those folios at the start and end of the
mapping which the mapping is not aligned to.

The net result is that we are able to handle large folios mapped in any
form which might be encountered correctly.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/mremap.c | 327 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 297 insertions(+), 30 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 883ff9499e8c..48a2fa7e91b0 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -77,6 +77,7 @@ struct pte_state {
 	unsigned long new_addr;
 	unsigned long old_end;
 	pte_t *ptep;
+	pmd_t *pmdp;
 	spinlock_t *ptl;
 };
 
@@ -532,40 +533,67 @@ enum pgt_entry {
 	HPAGE_PUD,
 };
 
-/*
- * Returns an extent of the corresponding size for the pgt_entry specified if
- * valid. Else returns a smaller extent bounded by the end of the source and
- * destination pgt_entry.
- */
-static __always_inline unsigned long get_extent(enum pgt_entry entry,
-						struct pagetable_move_control *pmc)
+static void __get_mask_size(enum pgt_entry entry,
+		unsigned long *mask, unsigned long *size)
 {
-	unsigned long next, extent, mask, size;
-	unsigned long old_addr = pmc->old_addr;
-	unsigned long old_end = pmc->old_end;
-	unsigned long new_addr = pmc->new_addr;
-
 	switch (entry) {
 	case HPAGE_PMD:
 	case NORMAL_PMD:
-		mask = PMD_MASK;
-		size = PMD_SIZE;
+		*mask = PMD_MASK;
+		*size = PMD_SIZE;
 		break;
 	case HPAGE_PUD:
 	case NORMAL_PUD:
-		mask = PUD_MASK;
-		size = PUD_SIZE;
+		*mask = PUD_MASK;
+		*size = PUD_SIZE;
 		break;
 	default:
 		BUILD_BUG();
 		break;
 	}
+}
+
+/* Same as get extent, only ignores new address.  */
+static unsigned long __get_old_extent(struct pagetable_move_control *pmc,
+		unsigned long mask, unsigned long size)
+{
+	unsigned long next, extent;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long old_end = pmc->old_end;
 
 	next = (old_addr + size) & mask;
 	/* even if next overflowed, extent below will be ok */
 	extent = next - old_addr;
 	if (extent > old_end - old_addr)
 		extent = old_end - old_addr;
+
+	return extent;
+}
+
+static unsigned long get_old_extent(enum pgt_entry entry,
+		struct pagetable_move_control *pmc)
+{
+	unsigned long mask, size;
+
+	__get_mask_size(entry, &mask, &size);
+	return __get_old_extent(pmc, mask, size);
+}
+
+/*
+ * Returns an extent of the corresponding size for the pgt_entry specified if
+ * valid. Else returns a smaller extent bounded by the end of the source and
+ * destination pgt_entry.
+ */
+static __always_inline unsigned long get_extent(enum pgt_entry entry,
+						struct pagetable_move_control *pmc)
+{
+	unsigned long next, extent, mask, size;
+	unsigned long new_addr = pmc->new_addr;
+
+	__get_mask_size(entry, &mask, &size);
+
+	extent = __get_old_extent(pmc, mask, size);
+
 	next = (new_addr + size) & mask;
 	if (extent > next - new_addr)
 		extent = next - new_addr;
@@ -795,6 +823,165 @@ static unsigned long pmc_progress(struct pagetable_move_control *pmc)
 	return old_addr < orig_old_addr ? 0 : old_addr - orig_old_addr;
 }
 
+/* Assumes folio lock is held. */
+static bool __relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	pgoff_t new_index;
+	struct vm_area_struct *old = pmc->old;
+	struct vm_area_struct *new = pmc->new;
+
+	VM_WARN_ON_ONCE(!folio_test_locked(folio));
+
+	/* Impermissible. */
+	if (!folio_test_large(folio) || folio_test_ksm(folio) ||
+	    folio_test_large_maybe_mapped_shared(folio))
+		return false;
+
+	/* no-op. */
+	if (!folio_test_anon(folio))
+		return true;
+
+	if (!undo)
+		new_index = linear_page_index(new, new_addr);
+	else
+		new_index = linear_page_index(old, old_addr);
+
+	/* See comment in relocate_anon_pte(). */
+	folio_move_anon_rmap(folio, undo ? old : new);
+	WRITE_ONCE(folio->index, new_index);
+	return true;
+}
+
+static bool relocate_large_folio(struct pagetable_move_control *pmc,
+		unsigned long old_addr, unsigned long new_addr,
+		struct folio *folio, bool undo)
+{
+	bool ret;
+
+	folio_lock(folio);
+
+	/* See relocate_anon_pte() for description. */
+	if (WARN_ON_ONCE(folio_maybe_mapped_shared(folio))) {
+		ret = false;
+		goto out;
+	}
+	if (folio_maybe_dma_pinned(folio)) {
+		ret = false;
+		goto out;
+	}
+
+	ret = __relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	folio_unlock(folio);
+	return ret;
+}
+
+static bool relocate_anon_pud(struct pagetable_move_control *pmc,
+		pud_t *pudp, bool undo)
+{
+	spinlock_t *ptl;
+	pud_t pud;
+	struct folio *folio;
+	struct page *page;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PUD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PUD_MASK);
+
+	ptl = pud_trans_huge_lock(pudp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pud = pudp_get(pudp);
+	if (!pud_present(pud)) {
+		ret = true;
+		goto out;
+	}
+	if (!pud_leaf(pud)) {
+		ret = false;
+		goto out;
+	}
+
+	page = pud_page(pud);
+	if (!page) {
+		ret = true;
+		goto out;
+	}
+
+	folio = page_folio(page);
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+static bool relocate_anon_pmd(struct pagetable_move_control *pmc,
+		pmd_t *pmdp, bool undo)
+{
+	spinlock_t *ptl;
+	pmd_t pmd;
+	struct folio *folio;
+	bool ret;
+	unsigned long old_addr = pmc->old_addr;
+	unsigned long new_addr = pmc->new_addr;
+
+	VM_WARN_ON(old_addr & ~HPAGE_PMD_MASK);
+	VM_WARN_ON(new_addr & ~HPAGE_PMD_MASK);
+
+	ptl = pmd_trans_huge_lock(pmdp, pmc->old);
+	if (!ptl)
+		return false;
+
+	pmd = pmdp_get(pmdp);
+	if (!pmd_present(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (is_huge_zero_pmd(pmd)) {
+		ret = true;
+		goto out;
+	}
+	if (!pmd_leaf(pmd)) {
+		ret = false;
+		goto out;
+	}
+
+	folio = pmd_folio(pmd);
+	if (!folio) {
+		ret = true;
+		goto out;
+	}
+
+	ret = relocate_large_folio(pmc, old_addr, new_addr, folio, undo);
+out:
+	spin_unlock(ptl);
+	return ret;
+}
+
+/*
+ * Is the THP discovered at old_addr fully spanned at both the old and new VMAs?
+ */
+static bool is_thp_fully_spanned(struct pagetable_move_control *pmc,
+				 unsigned long old_addr,
+				 size_t thp_size)
+{
+	unsigned long old_end = pmc->old_end;
+	unsigned long orig_old_addr = old_end - pmc->len_in;
+	unsigned long aligned_start = old_addr & ~(thp_size - 1);
+	unsigned long aligned_end = aligned_start + thp_size;
+
+	if (aligned_start < orig_old_addr || aligned_end > old_end)
+		return false;
+
+	return true;
+}
+
 /*
  * If the folio mapped at the specified pte entry can have its index and mapping
  * relocated, then do so.
@@ -811,10 +998,12 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	unsigned long ret = 1;
 	unsigned long old_addr = state->old_addr;
 	unsigned long new_addr = state->new_addr;
+	struct mm_struct *mm = current->mm;
 
 	old = pmc->old;
 	new = pmc->new;
 
+retry:
 	pte = ptep_get(state->ptep);
 
 	/* Ensure we have truly got an anon folio. */
@@ -851,13 +1040,55 @@ static unsigned long relocate_anon_pte(struct pagetable_move_control *pmc,
 	if (folio_maybe_dma_pinned(folio))
 		goto out;
 
-	/*
-	 * This should not happen as we explicitly disallow this, but check
-	 * anyway.
-	 */
+	/* If a split huge PMD, try to relocate all at once. */
 	if (folio_test_large(folio)) {
-		ret = 0;
-		goto out;
+		size_t size = folio_size(folio);
+
+		if (is_thp_fully_spanned(pmc, old_addr, size) &&
+		    __relocate_large_folio(pmc, old_addr, new_addr, folio, undo)) {
+			VM_WARN_ON_ONCE(old_addr & (size - 1));
+			ret = folio_nr_pages(folio);
+			goto out;
+		} else {
+			int err;
+			struct anon_vma *anon_vma = folio_anon_vma(folio);
+
+			/*
+			 * If the folio has the anon_vma whose lock we hold, we
+			 * have a problem, as split_folio() will attempt to lock
+			 * the already-locked anon_vma causing a deadlock. In
+			 * this case, bail out.
+			 */
+			if (anon_vma->root == pmc->relocate_locked->anon_vma->root) {
+				ret = 0;
+				goto out;
+			}
+
+			/* split_folio() expects elevated refcount. */
+			folio_get(folio);
+
+			/*
+			 * We must relinquish/reacquire the PTE lock over this
+			 * operation. We hold the folio lock and an increased
+			 * reference count, so there's no danger of the folio
+			 * disappearing beneath us.
+			 */
+			pte_unmap_unlock(state->ptep, state->ptl);
+			err = split_folio(folio);
+			state->ptep = pte_offset_map_lock(mm, state->pmdp,
+							  old_addr, &state->ptl);
+			folio_unlock(folio);
+			folio_put(folio);
+
+			if (err || !state->ptep)
+				return 0;
+
+			/*
+			 * If we split, we need to look up the folio again, so
+			 * simply retry the operation.
+			 */
+			goto retry;
+		}
 	}
 
 	if (!undo)
@@ -904,6 +1135,7 @@ static bool relocate_anon_ptes(struct pagetable_move_control *pmc,
 		.old_addr = pmc->old_addr,
 		.new_addr = pmc->new_addr,
 		.old_end = pmc->old_addr + extent,
+		.pmdp = pmdp,
 	};
 	pte_t *ptep_start;
 	bool ret;
@@ -953,29 +1185,64 @@ static bool __relocate_anon_folios(struct pagetable_move_control *pmc, bool undo
 		pmd_t pmd;
 		pud_t pud;
 
-		extent = get_extent(NORMAL_PUD, pmc);
+		extent = get_old_extent(NORMAL_PUD, pmc);
 
 		pudp = get_old_pud(mm, pmc->old_addr);
 		if (!pudp)
 			continue;
 		pud = pudp_get(pudp);
+		if (pud_trans_huge(pud)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PUD_SIZE)
+				return false;
 
-		if (pud_trans_huge(pud) || pud_devmap(pud))
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PUD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PUD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PUD_SIZE)) {
+				if (!relocate_anon_pud(pmc, pudp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PMDs/PTEs. */
+			split_huge_pud(pmc->old, pudp, old_addr);
+		} else if (pud_devmap(pud)) {
 			return false;
+		}
 
-		extent = get_extent(NORMAL_PMD, pmc);
+		extent = get_old_extent(NORMAL_PMD, pmc);
 		pmdp = get_old_pmd(mm, pmc->old_addr);
 		if (!pmdp)
 			continue;
 		pmd = pmdp_get(pmdp);
-
-		if (is_swap_pmd(pmd) || pmd_trans_huge(pmd) ||
-		    pmd_devmap(pmd))
-			return false;
-
 		if (pmd_none(pmd))
 			continue;
 
+		if (pmd_trans_huge(pmd)) {
+			unsigned long old_addr = pmc->old_addr;
+
+			if (extent != HPAGE_PMD_SIZE)
+				return false;
+
+			VM_WARN_ON_ONCE(old_addr & ~HPAGE_PMD_MASK);
+
+			/* We may relocate iff the new address is aligned. */
+			if (!(pmc->new_addr & ~HPAGE_PMD_MASK) &&
+			    is_thp_fully_spanned(pmc, old_addr, HPAGE_PMD_SIZE)) {
+				if (!relocate_anon_pmd(pmc, pmdp, undo))
+					return false;
+				continue;
+			}
+
+			/* Otherwise, we split so we can do this with PTEs. */
+			split_huge_pmd(pmc->old, pmdp, old_addr);
+		} else if (is_swap_pmd(pmd) || pmd_devmap(pmd)) {
+			return false;
+		}
+
 		if (!relocate_anon_ptes(pmc, extent, pmdp, undo))
 			return false;
 	}
-- 
2.49.0

