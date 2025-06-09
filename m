Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E9313BC02;
	Mon,  9 Jun 2025 14:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749478653; cv=fail; b=hMbockycFLZn/3U4r2xm7g+HliUAL1TyUo/AQjSPO5kzVV2c8QCeovP1gg8MttUotI6CtxKVU4NIaXmDJ/3Ud5D6/Hy9udOpuzFkrhAXQc6XzEktsX8zhpuj59jYBLD7MkBWaDc7Fqw2uzIt7N89LYvWiv2100GrYcyRndxqRqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749478653; c=relaxed/simple;
	bh=jJJA/z15Dy3hlWPl96H7PrtXv3Fa8GFxRsOk9tHuDYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=aqdOCIqVPgqLR3UH2nk7kalqDT6FcN8BEsNeKPCafFDSI2O3LzxRFwO1dUx3WLZtL2ll4ae4Fdh9hzucYuHILWFuMhFaRHwCtBBf8Wbv4XtRW0YeOqWb54NDU5Fn0EX/H1J1FcntNnfl2N7FsTM1AZEsXrRO9gDsaEK0s3PBVx8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Es1oANc9; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JemnafnV; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Es1oANc9";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JemnafnV"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5593fkkx010696;
	Mon, 9 Jun 2025 14:16:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=LFERN1M/NDWaDOs+Ul
	LpSyHr7S7PwUdgvj8O4WPnFPE=; b=Es1oANc9JH2RqeiaHECTkHoztMlyp4nFFz
	RAvExR9JgBO9ng/q9MYScm+U81wWlurFi/rbm4hM0X6gPA/KX2tZdclDevm0V2hW
	K+BHlZAWf64P3jEBqPb7ZFevVKHN6ZPMpYesErt9xsGyni9+YQQKtryQzl0kE3qk
	p6F3TsB22+GMxHsnTCPx6i9FExRpkdcg0BAhITeep79GP0XJVsAjF/Ry23q4Ozxy
	rwaqb0U24bNSDm9hxRuzm2m+nu99Nx0C2efJWiz9ekuuOuaSMIpOOQEWE0CkjDgL
	KmYURPw1ClRpbiQ8UoH7aWnxTUZ3rem/WhAkhAtGkQiTqJSnKa5A==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474cbea82e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:16:36 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 559E4Y0S031327;
	Mon, 9 Jun 2025 14:16:35 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2053.outbound.protection.outlook.com [40.107.237.53])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 474bv7gc61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 09 Jun 2025 14:16:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEvQ8Fp9Guot4JjWR/ev0dVRvSwojf3Na/YUJzQ6AiK1hlVR1qjXE1utEckdVFyxkFk9Jet7Du3fRNmjBSL+ciT9LTRtyDYwJaUw4ZxkgodQEShncT3YxJapVS3BI4weJRTz/pTpKw3uZDeTj6SOxN25fkELD5+t+ssRDTLuDIg5zeDiy4GqNb03hT7HwvZkixCn/YTRRbkYRyd+/nM3Rs6LD+MxrX6zNuMXmo23UBuvJBDKBwTJo4F7xR/J4cKoJ9AkCLqYZDiVQuVXDNXl/MmqzvRre3D9xwYXNF2pHlgLcuc/ihjUOI8LiA1HqEIRKJlX5gcjnOH9JdylRYQl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFERN1M/NDWaDOs+UlLpSyHr7S7PwUdgvj8O4WPnFPE=;
 b=pD0g/xl6Ll7T6Ys7NYJabfy5DineEFIYVC9LLLzS3rF3InlIO0Sgw3QleBz3vzJFzzyrOfHN7JGX2KXPTWDOTSQD5E89Mlnfdg2TpUrkgz5ISiyQaHi0vjlVe+oPuslZSf6idJ+To3usedo6muDGCTbE/k6Es7mmG7L8xw6zYjXKFSOP4cL/YWx8aaQBxMbEQX5M+pfcixy59c1dbT/PEfyxyZ1QDgQ/ttcVIGi8E3uer39Ns9PyRpz9CijfLBpqRFFqXsRP1OG/FDLsmYhOsR9+YvQIztB6VQu+SnKPHIYtg+NN1YJrUQvx1kI7GaxAnXputMqsoD4T6EAuOkflIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFERN1M/NDWaDOs+UlLpSyHr7S7PwUdgvj8O4WPnFPE=;
 b=JemnafnVtwWvb1xaxueSVlutQU+ilOCF0+jeW55Ocpr5p/DThKob1EGhy5xCvYYO2/N3GtzfjERcFJFHtv46w0FYsNQjru6eIweck9s4Ryk3gNdAxc5mvj7iy8lS6M8viq5XQVNVblxfpe+FV1cI1ELOA0d8Onq9lgToI/WUbaM=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by MN2PR10MB4366.namprd10.prod.outlook.com (2603:10b6:208:1dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Mon, 9 Jun
 2025 14:16:31 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 14:16:31 +0000
Date: Mon, 9 Jun 2025 15:16:29 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, david@redhat.com,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
        baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com,
        npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
        hughd@google.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@meta.com,
        Juan Yescas <jyescas@google.com>, Breno Leitao <leitao@debian.org>
Subject: Re: [RFC] mm: khugepaged: use largest enabled hugepage order for
 min_free_kbytes
Message-ID: <0a746461-16f3-4cfb-b1a0-5146c808e354@lucifer.local>
References: <20250606143700.3256414-1-usamaarif642@gmail.com>
 <A409F7B3-A901-40F9-A694-DC3FB00B57FE@nvidia.com>
 <b807deec-99a9-4691-9001-c2f3adf586b9@gmail.com>
 <35A3819F-C8EE-48DB-8EB4-093C04DEF504@nvidia.com>
 <c600a6c0-aa59-4896-9e0d-3649a32d1771@gmail.com>
 <18BEDC9A-77D2-4E9B-BF5A-90F7C789D535@nvidia.com>
 <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bd47006-a38f-4451-8a74-467ddc5f61e1@gmail.com>
X-ClientProxiedBy: LO4P123CA0287.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::22) To BL4PR10MB8229.namprd10.prod.outlook.com
 (2603:10b6:208:4e6::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|MN2PR10MB4366:EE_
X-MS-Office365-Filtering-Correlation-Id: 011af21e-2e20-4b1c-0ae3-08dda7603b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OszSPVlV7Dwdi+jmSoBpU0LN6NrgvhU5OOr6YgNaKDbtjCPQ/8tdcdSO1zb1?=
 =?us-ascii?Q?wjFZK8wy0l3C3jsSYGb/vlRhxaK+A6QGjEFTwcZQLhbYTTXNVE9g88p8hTvA?=
 =?us-ascii?Q?i/x507jQh5TvZ/HBpe6/4H0z5m8FE5thGOd+xkkbIn5Uy+n9JSA6FltsQbaY?=
 =?us-ascii?Q?Lh2rz4WHsxTXhxUgAZkC3NN8Q+foeythO6lCV6axss52pTqyLNI7KybdddYE?=
 =?us-ascii?Q?5RYL9M6rvARHE17IVrqfCjj4UGhJR+M8FGnXiAWZNriWt3tgTEsZX4AMKkKr?=
 =?us-ascii?Q?+jKmyXag+OcHko1JTiPRLrsEL9mDSPp143gWQ9Hhb2EMTLDKEkZZuiFNElMa?=
 =?us-ascii?Q?dqWVHr/3apiDnFt1B4QshhGr+47DbP2CbgshHeu5EObBz6IArHE325MnXvgK?=
 =?us-ascii?Q?cjEkvpEbHGU7/g/cbF/RJY8i8yU/nmRa2Xflndp4HGvdPvDXq/cWElM1TCAS?=
 =?us-ascii?Q?gRnAAk0paltYN9xgc9Q+o4VT/IAsrCXqc7yGlAo9TzTBjOBLNl5Jcn3chzZJ?=
 =?us-ascii?Q?HWYEVQFsZUHccYTNr5qAEFNZgPvVVVmUfs2PZIbfj6YN6nVPzrlc9VPEyt7Q?=
 =?us-ascii?Q?7u5U23yrPRhCgLSGtek/QpewHTQAcZM3XdK8Hz6oh8RpdxnpsU+LKTm48Avq?=
 =?us-ascii?Q?DpLzpcwC0in0EyEiytnL3sj+Vk0c6wfVC0VsWtrJ1Aif/BpaH8zU8lv1btX1?=
 =?us-ascii?Q?EtEOcpCOhhXgTpK5wOW2qBBDGlt30S81p4FUb3gFEb67fJjBpQlyziH+9WKO?=
 =?us-ascii?Q?Ugv2Hxn3c24FvZ8x36F6XVP/MC6KsU9H6rZ/l8uesSqbJzFE+1CVN7ePNm+T?=
 =?us-ascii?Q?GM8n5N9fru3W9exOp7cV6XZDzsKGGF8cz+i6zQWLDKN/F4tJu8dN7+rCU26F?=
 =?us-ascii?Q?RzXlhzoxpxCyZMHVubzVV0C71DvK0zSkOnR0So3xe63k/G4eUXNTGkRq21Ar?=
 =?us-ascii?Q?+pTdVcc+9jBNh1YkcH2kCg+m9YvO3TUI+M32tDrZy7UVi2OSLyuZ+3p5+g5B?=
 =?us-ascii?Q?zSxIGUbomn7ZFnK3W93anBMmsvx7grtPGDXpbEHJWiyFzRjOI/k7Pymq9v9J?=
 =?us-ascii?Q?cjwk5fb2h2p6R2319i5F1Y2v8amVoMW6zW5rRAeLnung2+KMjZVsD33NgrTC?=
 =?us-ascii?Q?zx6sL61vzxz9FEiPnWvp7QX7dRSCuLwj45exSK6f5tN85AivfeK95Nt3WZz7?=
 =?us-ascii?Q?u6w22k7yHEMZBEiQzxXmrloRh+ULMVAOTY4MfTCXljcBMxeoehIUWag9CQJm?=
 =?us-ascii?Q?ekJ4PaGKf4huwbEguoPsRywAEpiS0lUHvoQzOS5Xv1PBlulA+ybTtu5ZuJv8?=
 =?us-ascii?Q?cCQD/ONq9sZFSpJU0keQxi1KB08rok52Fq3i1RLfh0g/wQLnUD+vPE/gYBB8?=
 =?us-ascii?Q?XhLfy8Vuwj9sA1x4hpBFU6MHQBS6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C/WVJwF+4NSI2xC/NyjQ45JxcCiUpPS5vOMT6G1gEDuGnNZ1UaTMkeySuMe5?=
 =?us-ascii?Q?X16z1Qc3ghaU16GW3j0wcR/mQARyhU/WyMO+Qzlm0qQHHqCDtYdyv2lG5kcK?=
 =?us-ascii?Q?zlxt1IMpBKH4Q7wSfKXAIawxfux4l1/r+AkjxqLEFFdGt7LV6Ydj75EmHMzr?=
 =?us-ascii?Q?QZEnwDjIhbgv/HtdvbIdcInNT1SJ8sVnVfbZejgMkk+pAC1zNoR0EzktTiZT?=
 =?us-ascii?Q?XhXuV00dIFrfwKwEe0V33Gg8rJDpYKGlGdqyJTMGGOLh3iJEvaypScwG1nPD?=
 =?us-ascii?Q?/1TdmNzRzYu9IQgvplIWG6NUicPKENNH0dbIObqGyo4mWdC8hAEbH+N+CtY0?=
 =?us-ascii?Q?QzxgDqGCG/uoFpg+HjyMLSYXtvgaoCCSaWM+cYdLZWRUCEYK3zSE55k4gymA?=
 =?us-ascii?Q?pUbXUJqXzL6/3ZTEZPk8R70/UxSYvg+zh43cfiOZRDfVTfNsdauNYJFASMyH?=
 =?us-ascii?Q?hMMXjfxqGYY87ngebH9CXL5dq/8VR6RqCIuVvKllYEjkXXuvCjBN/sh4iKR2?=
 =?us-ascii?Q?IAoWOdt9/ixW5l6J8ZRHiLpDvW83qcXdzV9Ah3v7YCALOje/JScl5r6rjUk9?=
 =?us-ascii?Q?fvuwvudPFwCXHzkByGa++AipDzyeRtApPx93YdakndZQgf4xfUa5gqeNjxcQ?=
 =?us-ascii?Q?vCgnK7lAp1Kow10uFtr0V4cMurd86B/dEsMAoXZ8J5/QEEri59K2+/DZlVpN?=
 =?us-ascii?Q?vjklsxGCoRdpMwq89Y8oKOdC5PX+5wgv3pSs+nBIsNTAigSP4uwUbwfEJ3jh?=
 =?us-ascii?Q?rdKfsy427Se5uWeumGLkhwqAGmPDL6SpcEmezfZkJf7Y7jC9Tq7YM04np4md?=
 =?us-ascii?Q?8ClkOUfgEZQX6WlRd4IKD6YG1jINip0uqkI+0c8hfRpv3o2ODaLauhty4r4F?=
 =?us-ascii?Q?XclnVDgg0N8yOQusK3BQNUuJNEBdGKbSn6V3LP6NBuGQoUvzbK/GMqas0gdx?=
 =?us-ascii?Q?neIsvIvOQiVasC0T9AqQWsOllZdn1nqxRo76O8ZNoj/xDFT7O2sZbHTn1HOt?=
 =?us-ascii?Q?UN//6MZKv/HAGw8k91raQ7VmyqYIWY9opkL7MDK3fiJjM5BF5p1r3ar0ZWuP?=
 =?us-ascii?Q?DgtUGnotLeOm8HKPcYOQ0zYsrvBv3jGuvubrn1HC8TMq1cYpm1iZChFfnnnD?=
 =?us-ascii?Q?4OAEQKYts80nFxQonMPMrxCKwev3lZv/dmUMTyeBB+fFRJf030DVTxTyTKi7?=
 =?us-ascii?Q?+ybPfB+PXuZwdO1+tUFQSDPKj22FT3gBViD2ZedUSa91CTeHVB8agXTTns87?=
 =?us-ascii?Q?CbCxpmcGFHIAMGoJK8tikNJwDnJCFz4B2bDwd0WaTOUvVs9WhC8ocxQoAO12?=
 =?us-ascii?Q?pcf2IjyYYsEWlGGfzxkMV6F25IyRSV/6CwiT16Ex8zhuVyH+lh+w5M6AXtuv?=
 =?us-ascii?Q?7E/sqZlWX6Tlp7H71D3ug/ccjkgkc6ivRB/TBSy6SRyyO90PZvHZrM6WlXSY?=
 =?us-ascii?Q?Fe2Ef6u2tVItB078hd4hsDISlq3K2/KRZt04Avs5q3TAd/5z0pJDoHHTPT9l?=
 =?us-ascii?Q?xPtuhLzQ+uA/F0/S9doe9kEq97mhxSESg3gM9R/qMEqQy91nEtZHwLUxEvy9?=
 =?us-ascii?Q?xbQ4QfLzYqbd0/Ptg2FtQinqRZPkeDRYDHi52PB+jCc5WMYIS/QX8IPjMTBY?=
 =?us-ascii?Q?YQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	fuq5TK8NNcTMkvp62ReROpHO3duO1miop91Xi72npM2QRvpTisKBDxZWwflUhfdJSC2GJwRuuQpbnWr6rAjN4HXDkKEckHQIPFmzDai3X1jPED1W+q9g77DQisAQyFmdK5jN+4tkmAgjvmn4AlJozG6JRthR0LFTfFgTIxxmwRpfjlpFKU0VFyCrPrgYBT/h1sYnMiDiDEBbXW2ZTijiX6UcuUxCRAgqH2M/M1xHWTQ23GR+ajkosaupfwydszpb/StO1zGT48CMEa9y4cmcSU01nDTVR5wIIZU3FEPYuxC6p9vkTSdWD3FgJBOYJnxndIOz8Ho8kuF3YIkxkyMKbIOxaK0TUIVBAflxRgvqrzTslXsejOOMvsmq0I0mc4xvIDrOtu4hvfd6ONGv4fpiUVHvtRc0WP20Pz+gbhvprORi9Kujp7CZuHJgu/hKOTCyg+HKyjs/QT9Z4hTnV9ML20SsyMf4Nz2lZ8VJxOkOdmrxasIxiw8JcHHr3vfdjivcPsOzCFwkbQcaH0KqxAjnJ9xCMbaLIL5dFmGKjGSzN8IU9hv7Vu2bAZtn1KGUyG0KVbEtZZaHENAhhYDch2hkoeVaCwQs3SeTYtw/6mFYJWo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011af21e-2e20-4b1c-0ae3-08dda7603b8f
X-MS-Exchange-CrossTenant-AuthSource: BL4PR10MB8229.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 14:16:31.6116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1ULmkaMAUa37HAUpmWGNAYJf1WC3lNwRV9xeN2DeR7OefAesfmXVWc4Col8t4/SGOtbsCNtwahXbsUvytLcyHC1ta/J+/fMNdja8Ku56qLw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4366
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506090104
X-Proofpoint-GUID: AcWftc5djMW3dSEMQLZiwS1050Uk-ICG
X-Authority-Analysis: v=2.4 cv=BffY0qt2 c=1 sm=1 tr=0 ts=6846ecc4 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=P-IC7800AAAA:8 a=zBxB00S-klUr3E2ZvcUA:9 a=CjuIK1q_8ugA:10 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: AcWftc5djMW3dSEMQLZiwS1050Uk-ICG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwNCBTYWx0ZWRfX/dGvTRTfnK68 EIRgguNQp5/H3U9vr0yWTtPWdr4d1DN4CdfBzU2W01G1fL4HvYTHl+zsi+uBB3aCfGPESPi0gAA YGjYANHHtTUy6F3YofQ6UHfE6ODLdrThj4gNfSn9Y/ukVLGdMc9no2uWwmgJzF6bs+a/2pq6DkF
 7ZRXp0y4hMeZ6xtpm8nbWtK7J9OhGQb5XTWK4XWRjCTdh4aeDRytOylWiwyfyYZeYUkRsK5pzhv +WZOSVmJUoUAU94KeCcXkCdiyt/raOn1u1ypcO1C8Esd3bc0n/JY3dvhpB0fugErzfFRKAxchoJ KDDKVp4bl8C/Hf1Y020r/c6BDEnDQP5KCQ15NCJOMyK7KQagdWnHoH5QpaZ3ofc1VgKeF544yd1
 LR1pIlgqizcOqkmMk2S6BsvJue1svlxCV8H1QiHRnkzcasOr/49E+aU875lJMe5Zd9JOcdVV

On Mon, Jun 09, 2025 at 03:11:27PM +0100, Usama Arif wrote:
>
>
> On 09/06/2025 14:19, Zi Yan wrote:
> > On 9 Jun 2025, at 7:13, Usama Arif wrote:
> >
> >> On 06/06/2025 17:10, Zi Yan wrote:
> >>> On 6 Jun 2025, at 11:38, Usama Arif wrote:
> >>>
> >>>> On 06/06/2025 16:18, Zi Yan wrote:
> >>>>> On 6 Jun 2025, at 10:37, Usama Arif wrote:
> >>>>>
> >>>>>> On arm64 machines with 64K PAGE_SIZE, the min_free_kbytes and hence the
> >>>>>> watermarks are evaluated to extremely high values, for e.g. a server with
> >>>>>> 480G of memory, only 2M mTHP hugepage size set to madvise, with the rest
> >>>>>> of the sizes set to never, the min, low and high watermarks evaluate to
> >>>>>> 11.2G, 14G and 16.8G respectively.
> >>>>>> In contrast for 4K PAGE_SIZE of the same machine, with only 2M THP hugepage
> >>>>>> size set to madvise, the min, low and high watermarks evaluate to 86M, 566M
> >>>>>> and 1G respectively.
> >>>>>> This is because set_recommended_min_free_kbytes is designed for PMD
> >>>>>> hugepages (pageblock_order = min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER)).
> >>>>>> Such high watermark values can cause performance and latency issues in
> >>>>>> memory bound applications on arm servers that use 64K PAGE_SIZE, eventhough
> >>>>>> most of them would never actually use a 512M PMD THP.
> >>>>>>
> >>>>>> Instead of using HPAGE_PMD_ORDER for pageblock_order use the highest large
> >>>>>> folio order enabled in set_recommended_min_free_kbytes.
> >>>>>> With this patch, when only 2M THP hugepage size is set to madvise for the
> >>>>>> same machine with 64K page size, with the rest of the sizes set to never,
> >>>>>> the min, low and high watermarks evaluate to 2.08G, 2.6G and 3.1G
> >>>>>> respectively. When 512M THP hugepage size is set to madvise for the same
> >>>>>> machine with 64K page size, the min, low and high watermarks evaluate to
> >>>>>> 11.2G, 14G and 16.8G respectively, the same as without this patch.
> >>>>>
> >>>>> Getting pageblock_order involved here might be confusing. I think you just
> >>>>> want to adjust min, low and high watermarks to reasonable values.
> >>>>> Is it OK to rename min_thp_pageblock_nr_pages to min_nr_free_pages_per_zone
> >>>>> and move MIGRATE_PCPTYPES * MIGRATE_PCPTYPES inside? Otherwise, the changes
> >>>>> look reasonable to me.
> >>>>
> >>>> Hi Zi,
> >>>>
> >>>> Thanks for the review!
> >>>>
> >>>> I forgot to change it in another place, sorry about that! So can't move
> >>>> MIGRATE_PCPTYPES * MIGRATE_PCPTYPES into the combined function.
> >>>> Have added the additional place where min_thp_pageblock_nr_pages() is called
> >>>> as a fixlet here:
> >>>> https://lore.kernel.org/all/a179fd65-dc3f-4769-9916-3033497188ba@gmail.com/
> >>>>
> >>>> I think atleast in this context the orginal name pageblock_nr_pages isn't
> >>>> correct as its min(HPAGE_PMD_ORDER, PAGE_BLOCK_ORDER).
> >>>> The new name min_thp_pageblock_nr_pages is also not really good, so happy
> >>>> to change it to something appropriate.
> >>>
> >>> Got it. pageblock is the defragmentation granularity. If user only wants
> >>> 2MB mTHP, maybe pageblock order should be adjusted. Otherwise,
> >>> kernel will defragment at 512MB granularity, which might not be efficient.
> >>> Maybe make pageblock_order a boot time parameter?
> >>>
> >>> In addition, we are mixing two things together:
> >>> 1. min, low, and high watermarks: they affect when memory reclaim and compaction
> >>>    will be triggered;
> >>> 2. pageblock order: it is the granularity of defragmentation for creating
> >>>    mTHP/THP.
> >>>
> >>> In your use case, you want to lower watermarks, right? Considering what you
> >>> said below, I wonder if we want a way of enforcing vm.min_free_kbytes,
> >>> like a new sysctl knob, vm.force_min_free_kbytes (yeah the suggestion
> >>> is lame, sorry).
> >>>
> >>> I think for 2, we might want to decouple pageblock order from defragmentation
> >>> granularity.
> >>>
> >>
> >> This is a good point. I only did it for the watermarks in the RFC, but there
> >> is no reason that the defrag granularity is done in 512M chunks and is probably
> >> very inefficient to do so?
> >>
> >> Instead of replacing the pageblock_nr_pages for just set_recommended_min_free_kbytes,
> >> maybe we just need to change the definition of pageblock_order in [1] to take into
> >> account the highest large folio order enabled instead of HPAGE_PMD_ORDER?
> >
> > Ideally, yes. But pageblock migratetypes are stored in a fixed size array
> > determined by pageblock_order at boot time (see usemap_size() in mm/mm_init.c).
> > Changing pageblock_order at runtime means we will need to resize pageblock
> > migratetypes array, which is a little unrealistic. In a system with GBs or TBs
> > memory, reducing pageblock_order by 1 means doubling pageblock migratetypes
> > array and replicating one pageblock migratetypes to two; increasing pageblock
> > order by 1 means halving the array and splitting a pageblock into two.
> > The former, if memory is enough, might be easy, but the latter is a little
> > involved, since for a pageblock with both movable and unmovable pages,
> > you will need to check all pages to decide the migratetypes of the after-split
> > pageblocks to make sure pageblock migratetype matches the pages inside that
> > pageblock.
> >
>
> Thanks for explaining this so well and the code pointer!
>
> Yeah it doesnt seem reasonable to change the size of pageblock_flags at runtime.
> >
> >>
> >> [1] https://elixir.bootlin.com/linux/v6.15.1/source/include/linux/pageblock-flags.h#L50
> >>
> >> I really want to avoid coming up with a solution that requires changing a Kconfig or needs
> >> kernel commandline to change. It would mean a reboot whenever a different workload
> >> runs on a server that works optimally with a different THP size, and that would make
> >> workload orchestration a nightmare.
> >>
> >
> > As I said above, changing pageblock order at runtime might not be easy. But
> > changing defragmentation granularity should be fine, since it just changes
> > the range of memory compaction. That is the reason of my proposal,
> > decoupling pageblock order from defragmentation granularity. We probably
> > need to do some experiments to see the impact of the decoupling, as I
> > imagine defragmenting a range smaller than pageblock order is fine, but
> > defragmenting a range larger than pageblock order might cause issues
> > if there is any unmovable pageblock within that range. Since it is very likely
> > unmovable pages reside in an unmovable pageblock and lead to a defragmentation
> > failure.
> >
> >
>
> I saw you mentioned of a proposal to decouple pageblock order from defrag granularity
> in one of the other replies as well, just wanted to check if there was anything you had
> sent in lore in terms of proposal or RFC that I could look at.
>
> So I guess the question is what should be the next step? The following has been discussed:
>
> - Changing pageblock_order at runtime: This seems unreasonable after Zi's explanation above
>   and might have unintended consequences if done at runtime, so a no go?
> - Decouple only watermark calculation and defrag granularity from pageblock order (also from Zi).
>   The decoupling can be done separately. Watermark calculation can be decoupled using the
>   approach taken in this RFC. Although max order used by pagecache needs to be addressed.
>

I need to catch up with the thread (workload crazy atm), but why isn't it
feasible to simply statically adjust the pageblock size?

The whole point of 'defragmentation' is to _heuristically_ make it less
likely there'll be fragmentation when requesting page blocks.

And the watermark code is explicitly about providing reserves at a
_pageblock granularity_.

Why would we want to 'defragment' to 512MB physically contiguous chunks
that we rarely use?

Since it's all heuristic, it seems reasonable to me to cap it at a sensible
level no?

>
> > --
> > Best Regards,
> > Yan, Zi
>
