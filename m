Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F71220F24
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343789; cv=fail; b=Y6r8w6xgwKnHRkWV9L/3Y7KQuQqlefUU11NJ3rTNrov97VEkLk2hXjcZRdXbaULpjkJeOzOVq8UMUYPXQt53Kk3VvCrjulZRtfnovmhJrDwOO5DpK4BlcIK0+38wiuLoso1JVcyMQ2cjYQkCCiSA4XtCRkAjt/JxOgSr4vscTuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343789; c=relaxed/simple;
	bh=PMcxU5QIo3NxPGqRxy7jG9qqhYl+KvFLRt0IE05Q6CI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZBE8UQhnyULnGzLIKnWB4O4rLYgspFKcWo4uirlLHzSOqCu/nMRd8dO0cNkLIyPpnXNQldl3KMrhxcmBdy1UJ6TgOqOmM5ZA6hq23+TKbntHn0L4pGf4/4op+05TAf5o1FFMGrRz5cocwIdMyJftxSEQrj1o6QVkXkmjuIOAGuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Bwm4F/a0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LeLF75sF; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Bwm4F/a0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LeLF75sF"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JEMYns023213;
	Thu, 19 Jun 2025 14:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Nnj2It7SA3nO8EhuTo
	SsvpfScRFZ+glW9L16ynBy4os=; b=Bwm4F/a0dfQ+Wthh2q+hrp37CP7U1YXohc
	5rhOfpOOcjOa3+qfLpHASsOA3qIv/ft1cIkX0144hpL09da0fOd1FCa92N89LRHx
	X72yxYVOgPG/++bGhF0BZ2HN5cjNIwSy4fxU2QeLprJIIc189370KpzxnYzW7qPU
	bw2JZEH8QSh0J2s1DaIySrP39MPZgbr/rQfc10Za3MW61z8l16H85Ps+orAwB4Ng
	Tzfos50IqYPPiQOOhZmV9z4Uwx9cVtvr30AJSNmtTiQQKSdI3uGmdkfhcRePFjCu
	J0u50MUjvJRS6ZGZF4HrJfFChzXj/Le4UfZdhmvWsEVmPkYkJ8cA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r91w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:36:13 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55JDOh6l038208;
	Thu, 19 Jun 2025 14:36:12 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2040.outbound.protection.outlook.com [40.107.102.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhbyg8f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Jun 2025 14:36:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=blWq4aBNgSrnVyJHYswp0rfd214vREJchAR5iW8jVH8Zi7kY3odIk65lReiN9JwdUQncrfxx3Ylbi9N7sLdEOiJfBUPHfUpaS/Pgqt4FKfwlZpI8gnnIiQjbHnG+Yu4fgY0PNJ523I/si5FwEmK/U9GDTLLZFy1z9p+rM+YGs4cd7lnrEo3kyUEWwFCsQQrqhMaZt9ydjvJWnYnNV104yhqw4o47bUx763UYzktUFzE4ys1t9zfZBdPw9mKYzLNflBQi2G8+pF35CFDnIacl+dS9Juqu1SKq4WaY0SsYHvgHE/Bye7IbNH4QKd84he/34rWBeQjhlRUAzWSrvXlb5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nnj2It7SA3nO8EhuToSsvpfScRFZ+glW9L16ynBy4os=;
 b=eq54jTxWUiKmCekFtocpSk5L+mu3cg2/YdYbtVNJiY5w5zn33fk3L4nQMMhfsRBt0gYoMGoURq1fqSLeVD9+mOCpQhtd/xUKdbHSujX++UEMxQT663tWdqDibNIBZpxnxvV7zFnXe10VAGoWrstW2Rb9rfRn31W6p3hQmLXtuqI7cMjvaS4ttd8Pt1XFnRewqiELSDfuzIVNoS2BceSRsJpmG0t6mxCXpMSDfhrM+1Md5toypx8qnuyBtphegKV4bXyNewOlL8H6dK95sm3g6f+Sp1sX24480Mg4BN52TyZhWbG9/0+/L+obUWmQxgliWTUTuhhpwSMvsitZCjTRkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nnj2It7SA3nO8EhuToSsvpfScRFZ+glW9L16ynBy4os=;
 b=LeLF75sFbczePytRH1QB2EBtyPXGd67X2ktK5S0rq8Q5Rd823ncY2lgLqi2sWRu+pqlDwhcEdaTJTZoMAWnJKLDzRMI5iGOFzNBgXBn9nfdk157UmD3V5ReJ2ijhMzTVRo1Moas0Y9ZecaLzYCjoAB9KRllI5xPiM78mPdhLDzs=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6676.namprd10.prod.outlook.com (2603:10b6:510:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Thu, 19 Jun
 2025 14:36:05 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 14:36:05 +0000
Date: Thu, 19 Jun 2025 15:36:03 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        Pedro Falcato <pfalcato@suse.de>, Kees Cook <kees@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/vma: use vmg->target to specify target VMA for new
 VMA merge
Message-ID: <c54f45e3-a6ac-4749-93c0-cc9e3080ee37@lucifer.local>
References: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613184807.108089-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: LO4P123CA0524.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2c5::9) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6676:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b271ce-f6d8-4d94-59ed-08ddaf3e9f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pBi98USqvoea2+JNWY9OdQY773143SFr9uaLkiA0CGVth8nkmrzQZkU1SjxL?=
 =?us-ascii?Q?VmVc5K0QERWu9ou51H5yuR9Av/kGxUVc8iT+FjsGzX0VibV4YBrCvl+t0PFT?=
 =?us-ascii?Q?nbb7cdwVSIZdBoca7/FF4pEqkDA6BoxL8MVeSO6PnCGjQ8+l1lbpB2MXwk5z?=
 =?us-ascii?Q?SNHHFQ0vj1Nsb30QOqPTYGam9zT1KdTEDSSPIaOtaif4rEbKNto96aqZQ2iQ?=
 =?us-ascii?Q?dJGqmP12PgjjtTw0kcmMByzwI3rp5tminGQkYRmjflRsSz2G94oIkroEfI5N?=
 =?us-ascii?Q?P6dUjkvYDt7dWa4MuzjE22mY9pWlqMnMoWP2iFmswM+toFTsFDmY8vlaHhpx?=
 =?us-ascii?Q?DT4sOpqcohnwB1KbAFhj8xX2UHLzBchTZeuIdIjoJ8Z1JYEaR6I0xAca0RJR?=
 =?us-ascii?Q?X+8gbWZxi2CIzATP/Hmoe7k25+jQs/1nAl3Lufkxjz1n5YGVraRcsHD2vj4D?=
 =?us-ascii?Q?d6Sx226cVbGf0n7M1AgnRLLmpwt7ReWTcvpvNrkdMrjklrsZAeXDMqtZ/eeQ?=
 =?us-ascii?Q?8s0CYAoRtFLcJU00n2AH30FR2ywrzQVJqCfKqlgfUtCaljAEibLQJkUvQ7Lq?=
 =?us-ascii?Q?7RYwfnrJXhm7ch7PfvNmZ8QoCYrbX1ubNGAQwUs611v+wLMYWLxi1lM8gqcO?=
 =?us-ascii?Q?ccdm4qc3zFa8cvaxnqmN4MQ7B7i+Y0QRp5HPGe42AZgF6C6r2fN2IMVzbPdw?=
 =?us-ascii?Q?jML+ysW8kaXzpSYlgaiFJ4Jy7FPORTDwDl2Mx6YdoKfe0faUJ3cehRwPkQKR?=
 =?us-ascii?Q?m8rwG4PUdhtjXwMJK8RU2hik8WfwB9fw+UdIiWjLnamHWpzFWyULmSObUOWd?=
 =?us-ascii?Q?vMTVcGjwjR90Eqh9Q2g5chwpETnwZagCCcfFOy3uUIacSLCSKmai5A3cArR/?=
 =?us-ascii?Q?qpH5OqHJl+wqP3w8rVlKSfS19eodLhYSVoeoKNasYlf6Ey/TAswxqI+zABZ2?=
 =?us-ascii?Q?tBjJQBQOo7QGt8TG8uSGktzIZgnFaQc8RmrgF8lr3hrQNQfBpsHNaQHUREpl?=
 =?us-ascii?Q?nhAwuyfVyqf7gB05vEMr9B/2kpTphSj9iRFbwoXh362y612P+B3dHbARvKwv?=
 =?us-ascii?Q?iTk5qdEx8z06Qg+jdKmRD2xLTPfg0YcwR/nHOQaESn6rtV1Z4tKOMzEAzIVm?=
 =?us-ascii?Q?DknolPxz/x2F0XjVYFckoTU3r/xs39X/Xmsokt1HZ9nQWUfiZYJhpmhi125x?=
 =?us-ascii?Q?kxUuSNCr2XXEbD/QOgPGi0paJGuBpFFZktBB2e8e37Kh+nPK6Ifm5B2mz3qE?=
 =?us-ascii?Q?HaNYCCoGhZu+6BAHwz3C9w3wiZdh3Qdwy1uUztlsyYfJxDTx4GQ6NRrOj7zB?=
 =?us-ascii?Q?BU4eTcYUwTgw08k10lPjOQjtRC5bF7xEYRSbCHw6kcrFLLxBjsDcBW7uavR8?=
 =?us-ascii?Q?lPP9/7VNPa32hd8gbcq2zJfZoPaMVbIq0beyW8mv9BIvD674eeVTuWr0xD/z?=
 =?us-ascii?Q?/uyOU6+LUW8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jJ51EZXV9wvq+ZBhk9cEO3X0UfLQ6YZ6lQl1mD2SiDiHEEyz1nfc7WT1oMel?=
 =?us-ascii?Q?PLn0YtmPh+Nv7qJlkFMCbQq0tor3NG9VulnjVfZfLgp81DlxG93kfYRkAIgv?=
 =?us-ascii?Q?94hr2RwpNjcCN89qiHQmCE63Ly7KBdNIb+KswngX/WlNim5pf4dBStUq2wQa?=
 =?us-ascii?Q?dSWgZil0zaoZ4UQy9D8kABM+Kg8+rgNMUtnM5vnvJmFjxm7RQ9AEeQO+eG4j?=
 =?us-ascii?Q?7P7lMSs/ZCjB6MaJBmoaGRdG+TM0uSnYFlN6xLJaEX/7TSm0xrPeF8MLzWx3?=
 =?us-ascii?Q?LxnQ3kQqKOAhudYfuVdoEimsno6sliVRygT393p47EF8ndLo4yS5V/0m7+fm?=
 =?us-ascii?Q?Eg5ESLY39NquJBkD5JtW7IhD7g6RnjjaD1WFmfIFOrx5s0JAmF06udd/tBcd?=
 =?us-ascii?Q?hzy2XhNpcKUf2SIznHLqEhGLbvAZ3WQs3Fr6bRVV+ImFZ5WL12lBrJQSEQkh?=
 =?us-ascii?Q?PoAcSFeQmKd4diYRP4x+bHlwTkVoEdSgk5HZGTylruAYTGtz/Rjxwz6ofHOx?=
 =?us-ascii?Q?DYoufDRSK7Wp/lrtW+xFVQibwIN8bIm6pp/oqaG1s2AM+2ygobiaUxI3CFyA?=
 =?us-ascii?Q?P9rFiUarOFlcbqfCBNXpMhNIH3IWnI2/j1Yh2v2fQg4GfLxp2vNLK55DAt1b?=
 =?us-ascii?Q?eyJwjzw8HdalsUvTfAP3w14ND/lg08RJFJ3hYUj45XL/UfaZQXBFtd1UBvmh?=
 =?us-ascii?Q?qcLTDIFSjXnD5OX4S9VesCq7+rqHHGne15nRT0r5VJgQ91EJquMRm9KFXNAh?=
 =?us-ascii?Q?ZgipKXfcs1OJyv9HN/1U+UbytuK6M9uVXES9kJN2usjPds/ipzEfIbOd8e+Z?=
 =?us-ascii?Q?4t/EPL2i9Z5LVMl8Z6s204JJTtf7i9/6+QByXB3PxzyNNvlIawKXwRJ6ldCU?=
 =?us-ascii?Q?PPNvFqcL+XKmron19irbTE5bQka6oDyWAT5IH26mqQjcS/rveq6Umnejousd?=
 =?us-ascii?Q?xdda5QnpdpKxkN69iU+5TCVH/wuf953QWlgXI+ai+cC084lsTK97LviqvmUT?=
 =?us-ascii?Q?2g1GB0vQMFEXteXT5Xi9jOLES5NfWWQ2H6oqY9SQfSpoLta4YwBPUdRnQ/Ig?=
 =?us-ascii?Q?vbpIIgiunkOZ+nPgOBqb9a76vZf4LfW7IaNmWP22GXnWEON0hsD+JaQLqUoB?=
 =?us-ascii?Q?CgA+Xc7+h3CSd3S8V9RI+CgG2lacWeFhb2fEwSx/bNkA5zwLZOo+ZsYZJMP6?=
 =?us-ascii?Q?BFtIIfJ1F0NbHExjkhBXOnKDCO0+4qCbftVmWY3P6a+VRE8SHEJOvHA5o3Wl?=
 =?us-ascii?Q?Ef/0iK561vYpDThZvEbTci0nFNrAXJAb8Yxq2X+OsnV5wYKIyKEdiJj9+qhe?=
 =?us-ascii?Q?C5GxtBMW2OmEsST7vpNIYINs3NcCJTStikW7uvfNHGhKlpy506W6pI0RYTgG?=
 =?us-ascii?Q?9UvWlW/aryyguDqWpapU9xalnrOdNfFsFFzzi5gUD+Xe4nw68mtSU3ehM0z4?=
 =?us-ascii?Q?b1yqIwxLgEYhv5oMuoslK64AAmm4Pxn9sH6kOJ+npyRGyppkW+eBkE6QKCi5?=
 =?us-ascii?Q?Dx1HpcRcDIL77p75KMdMhoqtQ8rINYvGpQp3ngRQiMXZWeL6jpwo6XkW3bnn?=
 =?us-ascii?Q?vR4ma7rKOBPL5R6sgT2V+qujezgcOKviPD/wzxn46DN3d/M/yBZJ8d7ej15c?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	tqGTTJd1ogYpcYQQbJGGLWakEay7zrCfmjzpw0z33NpnTLaH17ZFDy9Dp8+PX4BbSRm3SywHjFw1pzVVYBxbLNC4FYdbSicr8APd6kzpfh8IaW5u17+RWF5k7byygmLseUOCNVfGuU7zKMHGHioRYQMA5Nv6JbsgL9u0C4n1yc9v3GgfogjKFXhQNyAzBYt63PjyC3fwp3QQa1lzQrdxb1mmsapPRuQTsnhSeWUM7Lp0oAFTgbdTivwCsKsheqW0IG9LkGQwA5x1Tjno4YFkDEtKirgZ1kY36QiEecbypQ0OWFM+gejyzYg92ag9MPpmX1DzB26QDQE+LcPxJb5O92GKeCQ925oFoAm3Gvvpd+xhReZXjfSoY+3YAlsNGmO4MI9Q+cbaZaENuc6ZPBqn3VFjOxl0MnVkXZq2BOmgCHI4aSc1WsRYW4OxSx9Orr9wLIKev/aIZpGdZ8phydsrrVkvfTY+CR/gAEsq5Du+rWjCJHPzpvkJRvotS4Bg1y4268m2wUFiJ7YrLqC40lM3I2QrNO7wp1z0OSgF2xqSVYYOznjJ/ogiJSAYBZbELD4RElrfiowff4xhvmGqnItnfFitoKu4lYN3J0dYf4Rv7vI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b271ce-f6d8-4d94-59ed-08ddaf3e9f68
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 14:36:05.4747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h1vvNePlGhn7dKmEW+lVMOZAkMK5W/jeBClAyOy224l1jllGnP7HeRKGuGug+O3336Fl+9DieYUFXnZ7jSyGVWEAgOXtuT2Me2nPOOrfX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6676
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_05,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506190121
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDEyMSBTYWx0ZWRfXzMuGRjBDPghf tDU6noiMfA0nQo/rIenXUyDZm0h9l7GSdac50SxKFz+wdo5Jb44vswjVy4GOuWr3H7w3GRRNERw J270HX9q7a/zohAwEw9qw9cMAO7C3vVG+pvR4njbgjpVwc5EDAznlGNLHksq1qiry02bmldleX1
 jQqsFuTyELltk5xjq3e/ZmStgkqH3rWXxef8vNSg62TnTpW79st0vjUSDFnm7o9rXTnCeugCOzL jQvi2ffYh5tispSqYm2w0PYm7VyA7CAV/ezHtgVFbD4cLm4/W555VypvWlATo9G6s9cOTjtRclY Fx0o7ZcQw9wey1FZNyx0L3/aVoCWjw+PjDE+5hvyS92BvNOBdqFKK09Z/A4kYOXuf22NGF3gbe6
 Ojxs9N1vxntMllachFmKlJgJFitLpRrHMUaXoJEWs8K9CXQJWddVBmSMOW0sNmNP5IugPFYP
X-Proofpoint-GUID: Wm-PhnO7yT1vuAsF0l0zXgyezNwNO9IW
X-Proofpoint-ORIG-GUID: Wm-PhnO7yT1vuAsF0l0zXgyezNwNO9IW
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=6854205d b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=ksiVF9dgOlpLBcIbF8cA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13206

Hi Andrew,

Small fix-patch to correct a comment here as per Vlastimil's feedback.

Thanks, Lorenzo

----8<----
From 0a84d237b05e6cf801933267488c8353ced7913b Mon Sep 17 00:00:00 2001
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Date: Thu, 19 Jun 2025 15:32:57 +0100
Subject: [PATCH] mm: make comment consistent in vma_expand()

The VMA merge structure contains a pointer to mm_struct so we don't need to
determine it from an input VMA's vm_mm field. Update the comment to reflect
this and make it consistent with vma_merge_new_range() and
vma_merge_existing_range().

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
---
 mm/vma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vma.c b/mm/vma.c
index 13794a0ac5fe..4abed296d882 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -1094,7 +1094,7 @@ struct vm_area_struct *vma_merge_new_range(struct vma_merge_struct *vmg)
  * Returns: 0 on success.
  *
  * ASSUMPTIONS:
- * - The caller must hold a WRITE lock on vmg->target->mm->mmap_lock.
+ * - The caller must hold a WRITE lock on the mm_struct->mmap_lock.
  * - The caller must have set @vmg->target and @vmg->next.
  */
 int vma_expand(struct vma_merge_struct *vmg)
--
2.49.0
