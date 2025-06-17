Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7CD24E4AF
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170609; cv=fail; b=EwJ0AoPhQb7lszY2QuS7Y/gqNIUqKrNrgVRV9N54HAYV+LVSP15wDjANV/U9gJbzV2zUdGABczX9Auk3TBW1b+A2NKIJVlSSJKSupU8SsLeMm5z00Uew+bC4bnmM8JU93LCT01PDxATQSAAwJPId/yVBRIr3EXLC6YkWojeZzbU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170609; c=relaxed/simple;
	bh=3ZsAVPadQVQ8kBjVUhjaLDmPMoQlch1zff8riGYQZcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=X6OOHZxM7jj6rOeVpf2GG6Zbi69WbW32yt4qKjra7eC8STjuYunQwTSMONTpAI2aGVCRYG+RDpMIWhfoUwdYvG3YpaFknkQUBEekDPtTc6R/tskSJuO0Yjbi7eK+NLeB4rApzxHOaPj7iyiGEwGixe9z+Rd9yy4nWs63hHJjHQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=m/apabYF; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W9gqiEht; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="m/apabYF";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W9gqiEht"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tdk7000569;
	Tue, 17 Jun 2025 14:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=m1TBx3g/SN/Ns3j+0D
	TUo/BcIQ0TlyCVH+NzIdR93Ak=; b=m/apabYFGpW+NdCgJlG9hpKB73RYIzC6US
	iEC8ejQI6mZkLidzmagKck/xNl4F+7TQMucIx8qDSFoNZ9elJ+hfNcXZ7oaXbGwv
	wOIVYYD6YG/7svC6YcqIBzK9Rds4LaGWqMACwYziFNWYwG/CJEYClllbo/BkePqR
	hT4AM5SEaYIsGTRasjVZY5D57axqPE6K9v+kITjOWzgitYGYY5uV7fHKjUq6Ofjv
	oLRKu2GtMTZoCiygWujQ0ivpli9yK7cyycjIgZ43DhbZ1fwVGEeELj0PvvaI27vl
	bnyK7aj08GnZXYjod3ihrQ0abr+7iag10oivFgx+0wpjrnepALig==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd5ega-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 14:29:53 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55HEASvC025998;
	Tue, 17 Jun 2025 14:29:52 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhfjq2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 14:29:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fcMyMtekc52DeMeSgSXARXPgnNFHYqpywjQcAIqymtyi/58pABfKT5HNcU1Vc0Ly65hs2bDqN4SDu7cy2bA2yYxEcYm5dtY5UdMfrdTX+Th54RO3Qfp+2rdf+Zx8hdTogVzC33Fi+GihOjdhcwqQP6V+sGt0INjG68K+IATEtGiGWiT0mGipVai2gHHwTgfnE3ixAbur6a4nokDp09Oe+jsd3z97cLcFtz+QGNWmiPlTZ9ypNtNc+6N/V4ekmmHm6GVeJ698SBtUWCRpAi4WE2ODt+IGDON5Nbvxoet/N4H1PdcHOHvV/gqNVzcGdG22rQXWrdVYIgLFoXCjRVoIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m1TBx3g/SN/Ns3j+0DTUo/BcIQ0TlyCVH+NzIdR93Ak=;
 b=mBc5KfNPS2WOBF2zMPA/JlOeUKJkJLBWX/A1BrgmToLF9qM5Gmd4NQqCv8dmFtl5tx0F4LdYUm0S6OkyOoCUXPmcPiYyiwtb+dIRTOhGE1LJuvjytM22Dqx6cJ0/F4rt870CHoEWMhXYAThQM2snWlYRnDDACh1nC6A12s6EWwKaclzhIIpng8R9S9v4xwB8zz+DrDiCd6dpQbnAPiRMCsAsXEaih9lWE3pirjmBpvz2xcgc3Dv4SggJgDUKcGkvvtt85QxC5wniPnWCCZADTK23kkH5+RpCJHX10gWyx3skZhMQdXfRtQwTBmeuX547GeJ8xMyTWkSMHb/xoS4FPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m1TBx3g/SN/Ns3j+0DTUo/BcIQ0TlyCVH+NzIdR93Ak=;
 b=W9gqiEhtyony4cIUBI40cengWx4zsUg//9n1A9FgnzdqP+DKAP0KRkIXH33GBd266SjZLqSbAnXkPyLr5bjkI2GssV5+dIQ8UTQTLvmqGlyUY/QZXD97yh7fZsaffgZQQU/Wg6gcwE+EmsA4L2/n6PaLgo4ytQ3wZhjJsMTutpo=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BY5PR10MB4387.namprd10.prod.outlook.com (2603:10b6:a03:211::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.25; Tue, 17 Jun
 2025 14:29:49 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 14:29:49 +0000
Date: Tue, 17 Jun 2025 15:29:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH] MAINTAINERS: add additional mmap-related files to mmap
 section
Message-ID: <1bac2893-4013-4a33-9a78-413f1b9368f7@lucifer.local>
References: <20250616203503.565448-1-lorenzo.stoakes@oracle.com>
 <f76e4f7b-1cac-4ce3-bd68-80d6c2ab5146@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f76e4f7b-1cac-4ce3-bd68-80d6c2ab5146@redhat.com>
X-ClientProxiedBy: LO4P123CA0505.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BY5PR10MB4387:EE_
X-MS-Office365-Filtering-Correlation-Id: 9205d5e6-7ee2-497e-eb79-08ddadab6a39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lDPzCEUuPHu+PsN1tF6XAltj0wMPOTYbsUqyKP7Az2jekAMa91L3mpq0P11y?=
 =?us-ascii?Q?f90n4eLE6WnmnDBOdzghLrRT1fGsvA0qEsGHhLU2Ju8D9F9vLhYRtHivFTJf?=
 =?us-ascii?Q?6NVUX6sovFBIWxNRlBZYxE2TkrDdx8lO5tiTIAlElpqUQ66M1uGpOcn1K15c?=
 =?us-ascii?Q?xuth2BaWmUm8+5tXdD/5DzulaKgqUavj24J/nU+pX2eR8L+OyjT/pAlAotun?=
 =?us-ascii?Q?ezzBPtBMG1GmT1mONDs//DiRkK6U1nkyrcZ4S3N8TSviLqoEobq9gJAyLOxe?=
 =?us-ascii?Q?OdaANux0o+BNvK2Km2Z3AtRjFq4FFypqTlVjkolsr21KTjJt0Q+L61eU6mzh?=
 =?us-ascii?Q?J5zbnjXRM1w2piB5gZ0/mr1kEej1bEsu3p4540hhJXmiQN4eP0Ao5RUvvMMd?=
 =?us-ascii?Q?vCKNvReVN55teQzgz9Va+jdJvwn8ZwiLHBHOUHjAiyxAxr2+ZcgDUPCPtt7A?=
 =?us-ascii?Q?2w9eFMgZWgjEZjoxdaBFAPbMN5gzM+YALiJCC1TOsDh+Mo2lNyqSridNYvwO?=
 =?us-ascii?Q?32GCh6SSg0m+p6CN5K8FO2r1neLaM9/7i0HgW3bT1fMnWzaHnmVfXIwPpBB7?=
 =?us-ascii?Q?dXRzwmNLP5UyXw6yFJwsAcsUAgHyQpgGZpQF9P4XyDMuxqEyyYIGIlgzo1mW?=
 =?us-ascii?Q?pW3X1CpnHXxFgT7gegzCEKuh6xBNj3O39RT75+vlmK83TG2Kyf1TRmno77x3?=
 =?us-ascii?Q?021qZ2Ag3zkg46LgM3LoCDgw+YeL1glHKeBsRq7OAKL4jZwAiwQJeMR4Dd0K?=
 =?us-ascii?Q?zFBUEj1I+CDcV6YvjTSfEx6QmWxEBAh4WnEo8kUw6sWgPv4rCdFJRyYxCXzs?=
 =?us-ascii?Q?pia/J+8Setm9vFSiyOK/v7C5/5tJDzvCMDSX3UNzidTF84VzzOoEfJPY/o62?=
 =?us-ascii?Q?aic3kSxWD0Eey6gd6Dc4DxKP6Y7RSapB525fg663xPo9y3he1a8n9XQYUc+f?=
 =?us-ascii?Q?p8QQh9rXpGj1RWezfdoyFPOrreiuv3lYFg2a1Ev5bMKYxp/NYopxTOP+o8J7?=
 =?us-ascii?Q?PaEC3vO7bwKDlBluXSc5OAWOa2dMx/q83hNTgLWf2YFwj9P2y1TjWmYZrJFq?=
 =?us-ascii?Q?ZYNt/nMt6nleNfO+jvaVqo3ofCL4H2cFMwM5D2VjHjfwD7SOi/MY5vGEV6vL?=
 =?us-ascii?Q?jdH2ixHHl6V1WWTWGXKDDQoUTIdsai9XqcbdKq3fy0pLr5FrBizbYPeGqrH5?=
 =?us-ascii?Q?ozS1PHSoXV4Dr1gHxjjIjj6i8VShl+9SQekOowqYkG2uNIFKDMJ83BOtTnEj?=
 =?us-ascii?Q?Gb/wYYRi3rSswgt1++RlBsVA13bjo54Yc/QkLJzVs4IIBz+0GXXpB87Ip9Wn?=
 =?us-ascii?Q?VnbPTrvXUspJp7QVRP0VU1NGq/jwkTCs8FjzS0UjuqK0y7HZ8rY0/VguT9VN?=
 =?us-ascii?Q?c2IcS40=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?loJwWOUomsWAngn16PTDRvMhLwOxz3uZnpEz7hqfy8r0E0GTn63akQad+cwy?=
 =?us-ascii?Q?9ZsaTZ5MtEhUQN1Ea/bQ6xsQaRC8iywESPc0lvsI/AjBffyw7otVyQ00c+0d?=
 =?us-ascii?Q?NTQnP3ICO/ET2EimqbgpFKPM2xM2P+Ot9sXpXhlEwVuklcSTjxsPlfNjsxiM?=
 =?us-ascii?Q?QgmiumbPnzSikefrEsaXonj1PvlQUvtlJ+aVR8jLu8UHuxwHZHN/8RbUwH8u?=
 =?us-ascii?Q?Wk6UsrYlxcW0cI6/Jg5klgNsaf5MFi6eJ620lHuiq1DHa7Tn7rVTxyx9fICp?=
 =?us-ascii?Q?K5qvNXC7wzw/2xUvJDhd1TNsYTkrup4fh0RrD2mLoT07kXCTHapABDuM2DM2?=
 =?us-ascii?Q?ACkt7W+4EcqjitFkA5HMCCQF9m2Oz9Xt7KMLLId1rQi7HWe7HqNjO4YnbAVa?=
 =?us-ascii?Q?+raKylrRAqeFRriYSeyQ2u30Xkjr2IwLnuivXrpCLt1LOoZABPdN/DhYvW+l?=
 =?us-ascii?Q?EOdBogf03vk+FPUf0rt98ruH7LbKnZ2r66DZPbDR0FmNDwa0YzurRF2/CDwJ?=
 =?us-ascii?Q?+Rx5HnzQmWSubFn0QpH10UNhaEhEKEMWebbKcRTEEWg3Wu1fvPeeRBOTGA9J?=
 =?us-ascii?Q?MdGKgn2RGi9MKtKrQaxxHsct5r6SCCYP1CA7+F66Qo5Z+UMbIJkI4qWVG/jm?=
 =?us-ascii?Q?dOIhMtaqM7TIiYe7xMUouEHSPw8SnVLQnTGGAGF9PquVhX7G4CsqvN7VkrxW?=
 =?us-ascii?Q?P8NEZ4OHzsL3vzobvaVgs1UC0HtXEG2RpWYkOqXBL/5o1U0+2p2sfPc2xs6Y?=
 =?us-ascii?Q?QKjoabLAn0MTqIbQHx2PYa3QZjR7+FNSpmxvzPiF/5L5sZu1CfWO61KLBO+y?=
 =?us-ascii?Q?mw9N6Y8HYBL0hCedvNJZlLfGatCI0IdbKsxkkC9fGuC7LSA+85NwsAYyRQDT?=
 =?us-ascii?Q?8t7Ddosl09f//9xxmdYOi04ud2O3Pliy6dOFQsFG91S9I9tUuLghdCEGLB/l?=
 =?us-ascii?Q?dpKxksn0j+3l9q3hCYYMHKOzPfL+s1e9/tqoV2Bit50jGD57ZDqTG1la2QOy?=
 =?us-ascii?Q?S95K7njp3VQjv4SDJUugjCPffGtXy2s2A3l1uUGVJ0aeq8Ba6EYvu+q2hRC8?=
 =?us-ascii?Q?b2ptmO0BFvpV1e8S/Aeur8Tw+V/AsG8qED3VjBOWfXUCFiEhlfqy+bsbMe3D?=
 =?us-ascii?Q?35Xq8UdcX0W6pOExvWdO6c6OgIAwQ8c3WKa2eSLqtMLghQeLM0DQvIkLKQEu?=
 =?us-ascii?Q?tz6GZWef4l5PsjQQTy39fCJETQoArfgeUDpdeCcM9qTwychjPe9J2Xkd9PkA?=
 =?us-ascii?Q?Adn/lqyCaTf4FzADSyR8s89tuirFItdEMThkDT4km660NgeaQjldQOGb8gHy?=
 =?us-ascii?Q?SxrVYej3pvPK6MfvLZ/2Fa4o/ZUicduufN9lMr0Zxemc86GdxyUKTnXjtFR0?=
 =?us-ascii?Q?VxA2NzWmFRanaG0G/zeE2HiUQ8/JU0ly25cGrvj8S21tFh9GOnCmE0/pUEbi?=
 =?us-ascii?Q?rbvi4UjKQ3RfJ+ybGOaM3oLMh6m7ioq7W2+ZPyXXmiYeHPUsQ4jptRpgnYbj?=
 =?us-ascii?Q?uCCqbr5giwROIy7w0SUezmc8ue/ZnsrX308OjuYOyXw9Se9muUuMIFeb78yw?=
 =?us-ascii?Q?kpDmcSiz5VsyvDOOKUxa4lheeg1HXl+XFbgFN3mZ0Mz4Ux4qDQ0roaeKnbAb?=
 =?us-ascii?Q?HQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	hW/hSC/P1Yj/uQcERIfJh28ZdktINUzSGFcGMPMnUhfMyGSwJ8HcUh77WwOMyL05/TyRBmYfea3JxlFC0ny2kxnYqbs3CXL4FgjU3Rqu2bSmR+q484M1dMcPmBLIsGGBUFoOu6ecJjVqAIBGowH7iKhQy+k/nvbzIQ7eeh4eNVnQAjAe+4iy2t8o+2HCJAH+riVpQMLOxIglHkS+ZLaBqB8Eoe2kEz3jCQ2lG3gm50XZ4+qan898gfWe2m8K8Foe+eAmMHwJSHRJvJ2V9+1Btx8KqV91ouEBRi5cEhqPqLhaHR0BnTgoSMvafx7zCpV81w6hEHO/CLZGLLQHVaV0u6HT+jkkiLysO7rqE7x7WCz907NibDvB1che6VzwI2qC0q+rEJZOjMb23JfcyvuHb87O3PTQZXJ1+ziMXdRoQMuCpi7nntpY6LF0ZE34D76WHKsXIj5XRS1CuLIKOU3QdLXT+6kXlmLL0/hSxRL69ODlI2dnOBIPnC0yuvGwu/GTVtj/LPbZnn4D/BIzbteGGa/OkLA/4aPtBR8rz77zt4zkFLolFt+nkvJoqsSchCkht8D3gswV1QnGxhz2xIyO9GOdwiFfTA9U1g6RIowOml0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9205d5e6-7ee2-497e-eb79-08ddadab6a39
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:29:49.0599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gIV5TJGjRBQlJKja3hAlxPcRmTlQU5UFoXUUGfKUXUwW8+gBVQW4aj0qY1v88GUBlxDaCKgUTggB3b1A/M+aN+/nxWdXLazexA5GUP0cz8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4387
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170113
X-Proofpoint-GUID: UJvwMlxS4Hetu1t_YQ5iZBTCsE58Ywb2
X-Proofpoint-ORIG-GUID: UJvwMlxS4Hetu1t_YQ5iZBTCsE58Ywb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDExMiBTYWx0ZWRfX7I8066tAL0sr fFvX6GzdlEd7NauhO19f0jYGQ4/IFZFoWUZxjI0C+mjuCK1YQM2hJp76J00r3WDdl6gpu86vRvJ eN+1VxGfLaCM1LwmQ5fHIkImohe6rfIJnhT2/S0BhhgxctVFu40ZEPUu5vLuZBSeRgaAy4FgTlE
 1gDxmBCz93MfWjAzA/hRHZUke69qkIm/VjEwVN1Mchtl+Aw+81bxsgbENWnpCwNzjnQPX2Z0Jsk G+zNyedLkSGwhFeQxA6EdNGr2pA4PkcCSBvd2vqp21MLQ9M+VqN1LE3ujyUuCexGK41dNfbOifB 9ld48OjZQt4T+ACdEvetQCRHLaV/TtyeeWuPHisSuxBGxOF160F2svsgvAqkOYlld/U/M8PGt5C
 GrkBjyxfafOUFImeWtNkR/FUbC8CJM3JmGojvbBa3sNczDqCtQB78M7cQSjW4lsvgQvsPlEL
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=68517be1 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=1-S1nHsFAAAA:8 a=yPCof4ZbAAAA:8 a=37rDS-QxAAAA:8 a=VwQbUJbxAAAA:8 a=rxEqbu5H2w3Q1OqRHDwA:9 a=CjuIK1q_8ugA:10 a=gK44uIRsrOYWoX5St5dO:22
 a=k1Nq6YrhK2t884LQW06G:22 cc=ntf awl=host:13207

On Mon, Jun 16, 2025 at 11:17:09PM +0200, David Hildenbrand wrote:
> On 16.06.25 22:35, Lorenzo Stoakes wrote:
> > msync and nommu are directly related to memory mapping, memfd and mincore
> > are less so but are roughly speaking operating on virtual memory mappings
> > from the point of view of the user so this seems the most appropriate place
> > for them.
> >
> > Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >   MAINTAINERS | 6 +++++-
> >   1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 4523a6409186..a5d1ff923a62 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -15735,7 +15735,6 @@ F:	Documentation/admin-guide/mm/
> >   F:	Documentation/mm/
> >   F:	include/linux/gfp.h
> >   F:	include/linux/gfp_types.h
> > -F:	include/linux/memfd.h
> >   F:	include/linux/memory_hotplug.h
> >   F:	include/linux/memory-tiers.h
> >   F:	include/linux/mempolicy.h
> > @@ -15974,12 +15973,17 @@ L:	linux-mm@kvack.org
> >   S:	Maintained
> >   W:	http://www.linux-mm.org
> >   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> > +F:	include/linux/memfd.h
> >   F:	include/trace/events/mmap.h
> > +F:	mm/memfd.c
>
> This is much more shmem related than it is mapping related (I mean, there is
> almost nothing mapping related in there)?
>
> > +F:	mm/mincore.c
> >   F:	mm/mlock.c
> >   F:	mm/mmap.c
> >   F:	mm/mprotect.c
> >   F:	mm/mremap.c
> >   F:	mm/mseal.c
> > +F:	mm/msync.c
> > +F:	mm/nommu.c
>
> There is a lot of mmap logic in there, correct. + a bunch of other weird
> things ... :(

:) Sounds like the kernel in general...

>
> --
> Cheers,
>
> David / dhildenb
>
