Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1179015746F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 13:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744119929; cv=fail; b=H+aDJUITvMa+0IHe6CstTMmy0Z83cnkBJYKz/pFDBiaC17eI+ulbNH2weCQzAj/c/iVn4Uol6n7/O1xoM4G064nRWTJ1At12yoSsH5m8NdBwN0GxwEjFB14aVRzGegJtuP3vx0owdfR0gDdDJTaL4w2asoiEzZJnroco5ptV/F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744119929; c=relaxed/simple;
	bh=TPXA7szGRp3JqYVFbls2d16OVdF/h5DX/Io9E4MOO+s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T7OQXgJBDCkwh/JGbQhCk/bghkySO2dc1xrlRFCYPeFwFZS1Am+b7+l/M/ZSDGry0EfjY1rEyj4k44fcHZngr2GRFMsRqBVK+slZOLsvhWScMVN3nSmPfmmjylYVbDjYj+8981MGyEQwiPvpS9gCCmoP9leO7st/XCErztY6hnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=f02bXZkj; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=pkPs8jkz; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="f02bXZkj";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="pkPs8jkz"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538C6eM6025764;
	Tue, 8 Apr 2025 13:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=upFpykHKDoTXKXarVM
	yS5SN0POu+FnnZsTsCq+yahc8=; b=f02bXZkjkED+YrLMSVc9BDDxq2DkkYocfM
	FxPu2ngg9r6A3QV9kmp5wucoHd084nCJ4BVt74y6Fs3n6JONvaI3bItgGMGHZB54
	k13vPqs7MQ1psq9GGtgUCl68rqQCcOnO0Wp5RIuar8/QAAFnIrhlilIg8pBfMkzt
	zdiM60kI5nvo+Lr7dYrpF91rjgqR4Aitc3cXBE9UBV9C+ZMP8bKCFWGI6LiRdB1r
	k8AKyWHX/X/thM2X8gF0I05kT42LgcE1RutJwddVAIRMdQSlKARM2E8LJHaaHfLy
	Z770j2EPEURP9Vnti7NqOXer3eshq6vM5Ve9hY+FU2cm3Ghr/PXA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45tv4svu1f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:44:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 538Chw6G021216;
	Tue, 8 Apr 2025 13:44:43 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2044.outbound.protection.outlook.com [104.47.58.44])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttyfks4n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Apr 2025 13:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nG3/wRf5ouOgi6sQ2Zv5fzlv/mtU1Es60KrHab33euONclUr7Z0F0XSQ/nIxRPWhLd1jkuv6BCtjMN+l5Zg+LN54+snwoyaK47Yz7daRYkxGUOqFIreg7Z+p+QTZcvv2oGO8ntPBDxFw+KjkPizDLnkG5j6Nfy9Rj0HbR/VkYiTml/dw238CPbAB5eIep8hOiOvSI8S1cRNImrqiv8Xc3tjsUC0wh7eveZmieCq3ZKgniGOjGH4q/OTT0QtUO6DcMlR6GPBjDUdnv+q6gPcakFeE2DL8moEUzFlq0gjfJAlocMIBL+Wfsg0sd0XQY/3jEPScDtoRHeFWohNCibuA8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upFpykHKDoTXKXarVMyS5SN0POu+FnnZsTsCq+yahc8=;
 b=s9kgVNB5UTcZ/QuOIEauS1gyIPOIwJswkQfYZniF78ezrZnQHCpV4OspQu1xdM2Mp0psdnrNAcrIOi7oqfTODvJ4F9zThUBVY8YHM7hwml4oY3AMdrqxFTgBb3cApQ5YleK8YHWXw23ivoXNNX8R+DjA63njddYBIPhVe6uDZxTfrBl6ZO27JX2vhAK857QEhnljrEjYmtG9eTCuOL5Wr9x5TeKDO+chjIkKVmJdRHUYCtD1cP1l9NaFNGlAymvgHXKkrU9ZPw/DzIqZoDOvmPQ04TJ87EoF7AkdeySE5vJj1xggn3hfFXM9lLOmVK5bWOvy/2QTyJuGXrefbSFY/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=upFpykHKDoTXKXarVMyS5SN0POu+FnnZsTsCq+yahc8=;
 b=pkPs8jkzEmuU8kfVcx7ciLnWbswxq5skuKD4UXiv34N/bIzANuU1AczDK5NqwzaTTdzrluQVj6sDT+xjZgrwNdacK9OcXbrzldTe0YAGewsAkU7eBLh/gJXLZaOds+GukI4PC6L7xv6IlY9KOCj5ZrSCJl7Eruf2EYCHlfg/Bvo=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BN0PR10MB5077.namprd10.prod.outlook.com (2603:10b6:408:12e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 13:44:41 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%3]) with mapi id 15.20.8632.017; Tue, 8 Apr 2025
 13:44:41 +0000
Date: Tue, 8 Apr 2025 14:44:40 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 0/4] mm/madvise: batch tlb flushes for MADV_DONTNEED
 and MADV_FREE
Message-ID: <f06859c3-c7bf-470e-b0bb-2dd352f3afe9@lucifer.local>
References: <20250404210700.2156-1-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404210700.2156-1-sj@kernel.org>
X-ClientProxiedBy: LO4P123CA0640.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::21) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BN0PR10MB5077:EE_
X-MS-Office365-Filtering-Correlation-Id: 8add83e8-340e-409c-62d2-08dd76a3839d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qmiNd0gZA0qC3KN7ffmFqufG7VuQPTRbjhJAR21P9meUgu9671/w2WEqkVg0?=
 =?us-ascii?Q?1jkAIUGvK2jNWnVK5RnIo6/eI2YPo1chIUVOLi208cPbyBzFH4MdpwOOS56R?=
 =?us-ascii?Q?Pp9ToCCHnTl5Ly8bYBkusCkJ2WUWdmE4FK+WSU0GKwkhSRrsHsDZu/zsAMkF?=
 =?us-ascii?Q?U0feQ1yWHJYvg1DlHBztygafFArWc17lvQ7RGGhJLHJ6H9f5lUFeyGHXKjXy?=
 =?us-ascii?Q?Twaj1ga8vVXnmLhwG5xxzWgixdinj14Nlu76IDsUYw6jvN+7lQA6bb40BoUC?=
 =?us-ascii?Q?xGCn9UvCnPsRcF8sON4AQY6SZrtXrQiRN+WEwnYnj/QaHyQrbJdsJ9V5Abkg?=
 =?us-ascii?Q?/Y3k6Txsvxh2nPEUw4AUz0RJP81PlrvSUpnJBkHRPHDHMMgW8ktR3sHh6Q6+?=
 =?us-ascii?Q?GiRNc7pvwcEsZy3m2QIhm4LNnfnuD6nQgeu1vLg5Wu13xLxGjz56Te72px5Z?=
 =?us-ascii?Q?WPLYE7d4W5N1nuUX364YcG5b5Q5ZM3GZr/b3j0+y9OBIuJvuc5fH3R3qxnlN?=
 =?us-ascii?Q?s+pLLw24tqdABq6dRfDgEv7WQcW4qKkAn4S5vZZCMLEFoEqWK4muNNp8OIyo?=
 =?us-ascii?Q?FVx24lBhN0qfV9ZnwqVZScpnYre0V3bkuD/TjvT0Ktkhi8hJ0c4ozAsE4yeu?=
 =?us-ascii?Q?lNPhgaZ757ubqZOanIZkmTvUR/OIt5AgQf6liqFHrjn30v96imDIAlAfuR2H?=
 =?us-ascii?Q?xrw02ze/RewKvZ7YhkX5WHKWMw7IVitk05XAyU/YoUsxw3ave6BE5q3RjsvD?=
 =?us-ascii?Q?Xk8vQHgkkTsF+FfqsPCrgvNL9DfsS4Tc5OTNWWlJ7pdUxDlk6kBWRxBJEV4l?=
 =?us-ascii?Q?phTt6enI+0QBL0NEQbtaJkp4458Eb06pA1kA0FTRpnw9Ih3H6silzwM6yfFy?=
 =?us-ascii?Q?hk+gJZKhN8Y6maDoxo/QPu8QXeTvWoKui1ZECB36ZpSpxIucDzs98W4farZe?=
 =?us-ascii?Q?Lal06HGUnoWmm/hJLTQwuGtd/yqcjHZICqX3KWIbk7cD3VUOgIZyH/j1JGqh?=
 =?us-ascii?Q?N/HDEtuDnSTdxoSaoouhASK6JO5fnM+dfa8TFRuh5/i7LlJdY5ZqdqF2/GnS?=
 =?us-ascii?Q?cBvhcEaNEeC/huT8NGoPOKdBnEXtz7sCONBWsJ/BdhQNg5bx9e9isV//WtOv?=
 =?us-ascii?Q?/dOhbC7IeRoaYHHW81EIVc7Lh6ig7MXFGCgcFviXONHDXYmR1i5tw2jn5Zvy?=
 =?us-ascii?Q?dcWUzWKTjMSTIaIJCrrmx83KJynCraWU1U8ktvYmDkI8IipiAwn7/NPhcSHZ?=
 =?us-ascii?Q?UhFRd5zLlNOXYfX/MxyWBc8jz8ryWwWrT4JGkhdTZD2qXQodXyvd8yNaUjdO?=
 =?us-ascii?Q?XO04y2GK2iZDWoSoikytyqTSUqCCUTAMkN55f3HwIDzEj0+tfizfHvHNl8jP?=
 =?us-ascii?Q?yReEMbGtZq2VbhJfgcMj1f6QcXHD+4aBEuLgaP5K4iLGmlBQOw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2Oblq8fqejc78Cjo/oj99Fekn6dRvRbyXQo2JtYbKQoE4QyPz1KfSfACiqmD?=
 =?us-ascii?Q?xhCNeyhjMaUhNPvArjN+ipJrKGIxVcHHxljJ5Lsbjkd2FFTHtn4A9bnP++sT?=
 =?us-ascii?Q?FCnA/X/BqMY1W3NzARtT1TyB1xi3wI6l5s9PiaUcnleyoneo30Cu9Tj5ZPa/?=
 =?us-ascii?Q?S0oOsXtQie/tkTgJx6kKuRC969dxIrhML1sozleivwCagw7EDbAn+y9ZrI87?=
 =?us-ascii?Q?WxoDnnhWUSvzzoXsVlTWfk8Dhj9Bo3YhXpH0iC+CctYs5Ftbk6RwvEEx3KDY?=
 =?us-ascii?Q?hy1/8+sB+c08nYoqeYH4NdXcxSx8SXBJgMuPTYwwxKWYngfHlFAX7ETWdNT5?=
 =?us-ascii?Q?5iTy8v9F48egIvLeXyuhVJYVqtang6BH66Rxy0aB0W93AWniUGqcnNpn+slf?=
 =?us-ascii?Q?xKK4Y2GdS3xaDscmuOJubTvTomhXB7jrDNr7LXoE7xwBGkMIPtf7yJd8daYc?=
 =?us-ascii?Q?jucqe8vtHsYpqnvI8GbmVQp6/uD9GfE/eGtwCew2oQp6x0zmWf4UetyYR/P4?=
 =?us-ascii?Q?umMrwMHpraSNEebrNSFF9y3whbKmYs5O+e5oQVO40yZvoHN7dDAH3iGG5XVd?=
 =?us-ascii?Q?xZJxAG9z0f7qgiTjcH0Iw4Sv/t6ZftTSuZV0GhMqnIfHVu7jHRqXHwUet/qT?=
 =?us-ascii?Q?BjzjfLBWZeytFKrfaqSqPaLUHD+19ezt+Lf3kX7hPZO2SSf6A/T+SNsrnARI?=
 =?us-ascii?Q?IA6zA5qYDC+qE/1YOiOAac8mKIpu9syg4YQGlLr6TycwK0UElt9odv+xmYdg?=
 =?us-ascii?Q?neI3sU621rIeV1naNuyU18DY/CUhHMP/rzCOSI/pjnT+yLRTyIeZXiF/2PaJ?=
 =?us-ascii?Q?xTYBX7EJ77+DiaKRDUSzsFEPxNaWwXZ7M70lRIt87ytdwFvXjVcjoHeW/Lgm?=
 =?us-ascii?Q?vysonvpIIYcG+zdW8yeLs/sVRw3dWZa+rFzz+S70x8z6xUihjTZlNcVyE7xf?=
 =?us-ascii?Q?f36/LlUAv4OIhklccU1MHT3a5xst2bfec7r0cbcsJxM+INds7vGFeGvORkeX?=
 =?us-ascii?Q?8+Klj79JTysRkAIp80P9Jl7mNNnZPEJG7gn+VGxbfQyc3vQ0NEbwjjIxUxWN?=
 =?us-ascii?Q?c7BFfVVAXkLhwPiAsfJu+vT9w8Lbtw9TMQRqKMavHUnjGGNdX3LnZLI7dk8v?=
 =?us-ascii?Q?b6Y5OYnrYTNLT7L8+h5QgN88r+dEXxjC93hO9ylg6g1MW8+wZAJNyx/3P+Pd?=
 =?us-ascii?Q?lRBt0uBl7ILfUgwyGsvi5HGB8S43qOVlSQJyBziTrG6fJ6IzLBaXO9LMJPea?=
 =?us-ascii?Q?acU70WYBZpbMco0cMJn5fOuKP2C7+SivwPeIjQerns4TgSCb4bwhg6zs+GbW?=
 =?us-ascii?Q?st+hnBYKoBeBu9xFbkVwetQuMbhBAuWQWJMzQcVvTemKVaIKMe/o10/gFfqc?=
 =?us-ascii?Q?AEx3YsDpNdrtPFGY8O8uzP74PRWCRn87HUe4uidEMJ5OKDr5IIivoBYKob3X?=
 =?us-ascii?Q?hr9eozaY1l/3c9jxzCUXWej7noi+hOmxplWkcADCCQX5MJjhlFwpQ2NSmrDB?=
 =?us-ascii?Q?IYIDDLRslRrXgoeAXd+b5Hx7F2atkXIYE6Phn+rUePnq8UCZrBwLnfOGB/UW?=
 =?us-ascii?Q?8IBOE2EkICEWeCmf9RxbiZA0LMVDhSN6UXTBLw48a+FSYOOHIZOtU200fMkQ?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	R2XquvxcubDm2w3B80NJSpNc6vDJEsJTlysBZYl32nBUZi76znE8w++1rV9qFblURHbuMn0euFTw4K4KWaxPgQLsxL110d5S8kOM3nf4TWCVDe4B8cdHG5LiTdR/XbV/dty3HeI4rcYGuFjg/Q0W9y9/L4bFYWt5NxdOpk5x7d2B4CSg9Q32W662Vn+JLCfNcqMI0Dx+frLxsZRtE1zDzP8nrzDpGxCEP8pd/pPiU/otrRhKVTytCjaq+POLKSZpOtZ/ekKrIF8Pmp+rBJf6iSChQ0h7fAMfUErQ7/hEyf8AJQ73/VcQcaonGZxp2xAcBL3dMpi2VCtnhMO8brMkyXuGOlrNChNAo5Th26U/oiClDB+OgKCXd7vTNnYSUs94XPwySpixtVxUJHeumtKbcB8Al8kwOU+803eItSH6b8KkmYGYtWsz6Sp3nHrDhTNjDFe89APrI1gRD21ijVRygehHUX7wR/P5CxLSMsMyyBOdZCfd5SzMzOdPZOpXJTz99G7UEaY72a9uDBHupRoyvPB4RMIHHb+pH/THQ2UdvOIHIqNw9Wh18bnjq5tFCvg/Jjl1Eb3GNvo19fDHLg56tBqL/mw78lStkCni3GOpOjE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8add83e8-340e-409c-62d2-08dd76a3839d
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 13:44:41.7922
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qr1XBGCsdGEjvpu3EwwVE1Yg3MjOYl03fKeZcmjLIh9/59UKxVwRkZbs4MwHxGCKL5/zTSRPT4AGclOzhJm4zR9O1u7k88yFriqJVQWqrtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5077
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504080097
X-Proofpoint-ORIG-GUID: HZV4DTjjXEg_sYEvHGmmKEz6Yhi83NMy
X-Proofpoint-GUID: HZV4DTjjXEg_sYEvHGmmKEz6Yhi83NMy

On Fri, Apr 04, 2025 at 02:06:56PM -0700, SeongJae Park wrote:
> When process_madvise() is called to do MADV_DONTNEED[_LOCKED] or
> MADV_FREE with multiple address ranges, tlb flushes happen for each of
> the given address ranges.  Because such tlb flushes are for same

Nit: for _the_ same.

> process, doing those in a batch is more efficient while still being
> safe.  Modify process_madvise() entry level code path to do such batched
> tlb flushes, while the internal unmap logics do only gathering of the
> tlb entries to flush.
>
> In more detail, modify the entry functions to initialize an mmu_gather
> ojbect and pass it to the internal logics.  And make the internal logics

Typo: ojbect -> object, logics -> logic.

> do only gathering of the tlb entries to flush into the received
> mmu_gather object.  After all internal function calls are done, the
> entry functions flush the gathered tlb entries at once.
>
> Because process_madvise() and madvise() share the internal unmap logic,
> make same change to madvise() entry code together, to make code
> consistent and cleaner.  It is only for keeping the code clean, and
> shouldn't degrade madvise().  It could rather provide a potential tlb
> flushes reduction benefit for a case that there are multiple vmas for
> the given address range.  It is only a side effect from an effort to
> keep code clean, so we don't measure it separately.
>
> Similar optimizations might be applicable to other madvise behaviros

Typo: behaviros -> behavior (or 'behaviors', but since behavior is already plural
probably unnecessary).

> such as MADV_COLD and MADV_PAGEOUT.  Those are simply out of the scope
> of this patch series, though.

Well well, for now :)

>
> Patches Seuquence

Typo: Seuquence -> Sequence.

> =================
>
> First patch defines new data structure for managing information that

Nit: _The_ first patch. _a_ new data structure. that -> 'that is'.

> required for batched tlb flushes (mmu_gather and behavior), and update
> code paths for MADV_DONTNEED[_LOCKED] and MADV_FREE handling internal
> logics to receive it.

Typo: logics -> logic.

>
> Second patch batches tlb flushes for MADV_FREE handling for both

Nit: _The_ second patch.

> madvise() and process_madvise().
>
> Remaining two patches are for MADV_DONTNEED[_LOCKED] tlb flushes
> batching.  Third patch splits zap_page_range_single() for batching of

Nit: Third patch -> _The_ third patch.

> MADV_DONTNEED[_LOCKED] handling.  The final and fourth patch batches tlb

Nit: 'patch batches' -> 'patches batch'.

> flushes for the hint using the sub-logic that the third patch split out,
> and the helpers for batched tlb flushes that intorduced for MADV_FREE

Typo: intorduced -> introduced.

Nit: 'for MADV_FREE' -> 'for the MADV_FREE'.

> case, by the second patch.
>
> Test Results
> ============
>
> I measured the latency to apply MADV_DONTNEED advice to 256 MiB memory
> using multiple process_madvise() calls.  I apply the advice in 4 KiB
> sized regions granularity, but with varying batch size per
> process_madvise() call (vlen) from 1 to 1024.  The source code for the
> measurement is available at GitHub[1].  To reduce measurement errors, I
> did the measurement five times.

Be interesting to see how this behaves with mTHP sizing too! But probably a bit
out of scope perhaps.

>
> The measurement results are as below.  'sz_batch' column shows the batch
> size of process_madvise() calls.  'Before' and 'After' columns show the
> average of latencies in nanoseconds that measured five times on kernels
> that built without and with the tlb flushes batching of this series
> (patches 3 and 4), respectively.  For the baseline, mm-new tree of
> 2025-04-04[2] has been used.  'B-stdev' and 'A-stdev' columns show
> ratios of latency measurements standard deviation to average in percent
> for 'Before' and 'After', respectively.  'Latency_reduction' shows the
> reduction of the latency that the 'After' has achieved compared to
> 'Before', in percent.  Higher 'Latency_reduction' values mean more
> efficiency improvements.
>
>     sz_batch   Before        B-stdev   After         A-stdev   Latency_reduction
>     1          110948138.2   5.55      109476402.8   4.28      1.33
>     2          75678535.6    1.67      70470722.2    3.55      6.88
>     4          59530647.6    4.77      51735606.6    3.44      13.09
>     8          50013051.6    4.39      44377029.8    5.20      11.27
>     16         48657878.2    9.32      37291600.4    3.39      23.36
>     32         43614180.2    6.06      34127428      3.75      21.75
>     64         42466694.2    5.70      26737935.2    2.54      37.04
>     128        42977970      6.99      25050444.2    4.06      41.71
>     256        41549546      1.88      24644375.8    3.77      40.69
>     512        42162698.6    6.17      24068224.8    2.87      42.92
>     1024       40978574      5.44      23872024.2    3.65      41.75

Very nice! Great work.

>
> As expected, tlb flushes batching provides latency reduction that
> proportional to the batch size.  The efficiency gain ranges from about
> 6.88 percent with batch size 2, to about 40 percent with batch size 128.
>
> Please note that this is a very simple microbenchmark, so real
> efficiency gain on real workload could be very different.

Indeed, accepted, but it makes a great deal of sense to batch these operations,
especially when we get to the point of actually increasing the process_madvise()
iov size.

>
> Chagelong
> =========
>
> Changes from v1
> (https://lore.kernel.org/20250310172318.653630-1-sj@kernel.org)
> - Split code cleanup part out
> - Keep the order between tlb flushes and hugetlb_zap_end()
> - Put mm/memory change just before its real usage
> - Add VM_WARN_ON_ONCE() for invlaid tlb argument to unmap_vma_single()
> - Cleanups following nice reviewers suggestions
>
> Changes from RFC
> (https://lore.kernel.org/20250305181611.54484-1-sj@kernel.org)
> - Clarify motivation of the change on the cover letter
> - Add average and stdev of evaluation results
> - Show latency reduction on evaluation results
> - Fix !CONFIG_MEMORY_FAILURE build error
> - Rename is_memory_populate() to is_madvise_populate()
> - Squash patches 5-8
> - Add kerneldoc for unmap_vm_area_struct()
> - Squash patches 10 and 11
> - Squash patches 12-14
> - Squash patches 15 and 16
>
> References
> ==========
>
> [1] https://github.com/sjp38/eval_proc_madvise
> [2] commit edd67244fe67 ("mm/show_mem: optimize si_meminfo_node by reducing redundant code") # mm-new
>
> SeongJae Park (4):
>   mm/madvise: define and use madvise_behavior struct for
>     madvise_do_behavior()
>   mm/madvise: batch tlb flushes for MADV_FREE
>   mm/memory: split non-tlb flushing part from zap_page_range_single()
>   mm/madvise: batch tlb flushes for MADV_DONTNEED[_LOCKED]
>
>  mm/internal.h |   3 ++
>  mm/madvise.c  | 110 ++++++++++++++++++++++++++++++++++++--------------
>  mm/memory.c   |  47 ++++++++++++++++-----
>  3 files changed, 121 insertions(+), 39 deletions(-)
>
>
> base-commit: 85b87628fae973dedae95f2ea2782b7df4c11322
> --
> 2.39.5
