Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04CBB2BEFF3
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155668; cv=fail; b=EGYlBEX1edy1U8FeeottS8Tsbt9P7pCG6t9scRMFSxsBtXpLZxhcLq9t0BOnJXTcOwnYL6cNdo3Edhgl0U5qxPQUfeLmdmjgB3po/zZ4k/jMLzPJHWP37H1JIRltJ70m+ebYMCpuuwsw0sxBhTZIi7yBQI4rX6TrN9WfG7cRc2k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155668; c=relaxed/simple;
	bh=Q2URmyznxCP+wS44V3sF02xai3Wa06JZUtKKfKSZIMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=f6jIWsX7ItZh8jkMuDwHH3AZWItTCu+2jnNFED+THYLy+NdBLSARSmnrQ6MJ8iJiDak6bLR94osD1NtMi/Y8qas7gXnVFSo3P951UB7g0B9G2Bw6fmwej7128mrpN3WOE4RQFOgVmUjhfkqs83J+vD4YF35BNeYYYLQ6lIzzaMk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GlgCGJLS; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=yBcpztIl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GlgCGJLS";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="yBcpztIl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8taKf025351;
	Tue, 17 Jun 2025 10:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=JrIFG1slUI6sb/I1/R
	OoJFt18OpAJP7dNg1FuYYUosA=; b=GlgCGJLSFrywzS9XFYQNP4JLj6v0VjIQxE
	mJAh6ZpIak6yIeBzc1J5GuwTdXH5MDANL6zYUyxMZzaxzreWu3nwNnneWTlwyqK0
	C4t2ghHXV3TjHm7DKdHnpX4/UXsvP1v98osVAhDdbAt3Mrh7jl0kqrK93wrrrj1I
	zZ7ZXsnxb+3VwutjDV1wk+iuW2B7hyblZzUwj39Ot8AkIek8IgdhPNU800fLAYXC
	wUY67Ff0dNH4ink8OaDG5/XPOSGdG8kAFr03d/5diQVfruneMC2vAZ0buLghwal/
	QzoFQQG/LsTkLBZ/cNmCCaCuCeDOPyGNg2gt89rlOFGOfnQKAaPw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 479q8r42de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:20:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55H94JJ8025973;
	Tue, 17 Jun 2025 10:20:22 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012038.outbound.protection.outlook.com [52.101.43.38])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 478yhfaab1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Jun 2025 10:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4LIG4+yHoffGugWEEV2hktm0wZZmblsW6iBzMUyFAonlgU2eOj1vOG2d5zUpjZiXeKS1SM0HTOH9LM6RK2aHfeyT+6Us6K18vO/PQc3YTdjJ+SdPha4xhrxoeVa4v0wnzhMB0Clp0jtuzdiqnRyzAuo6il/x8TfnnLDdvjZkbt7J9qbpiH/PEzbPkUU8KHSy8U0o1v0CioPmTc1Cf/7if7vxc63y/wJquG3WUZNUswmfopzC7oVKkg6Q4guwjWsW+nPka+qVy4grDmUnkgIGsB/uEIPiNyYtBDNtOWrNsMziHzWGrCZiR+ULX5m659XBmHFcYX37CeVho1vYm6XGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JrIFG1slUI6sb/I1/ROoJFt18OpAJP7dNg1FuYYUosA=;
 b=H18zj02kf4y4q0NGGRcgd4tdWph4cXzi3cyCccp559NIaJSmxfnbZa4N+5LNDMfADqdAwHbZagL8yj79gYhKIltjYFHhDJzCxG82LeB9HKdvUDhINJFA7bqXLd6cqgxSOQjvQDdq7fkk5pki4/dJ5QwMZoDdSyrKSX+G9ubpu1e/MlEtUEsYu3KaF1m3EzWELL7g+qTZ6LFOqCtwqtI3qeawJA4PwWrq5o3ICWoMiwsh+ldt/tcBxz6oaZ/LzqZFM3pH7b30upGebVIQtQ8xSqcMythNuysqRWE0UAeuZfCBvPznQnORDLgjbvnhKLemm1D1ifjBtDkP4g1gXJUrJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JrIFG1slUI6sb/I1/ROoJFt18OpAJP7dNg1FuYYUosA=;
 b=yBcpztIliYVKYpdMrn5mUSh4FqS0I7H0TbM6xmE4XXLq40Wp27x0BAv1k7nq0rNODkl3A8ReBB4JDQu7vEi8Q9hIKNxw64EDO81Ziv97TPAIRQ6EXOUjfeaFQFY6p17fHSjeQVs1fOBrnovhpm6Bta2/3r8tfBcH81eEZ0q6wAM=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB7289.namprd10.prod.outlook.com (2603:10b6:930:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 10:20:19 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8835.026; Tue, 17 Jun 2025
 10:20:19 +0000
Date: Tue, 17 Jun 2025 11:20:15 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>, Rik van Riel <riel@surriel.com>,
        Harry Yoo <harry.yoo@oracle.com>, Zi Yan <ziy@nvidia.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
        Dev Jain <dev.jain@arm.com>, Jakub Matena <matenajakub@gmail.com>,
        Wei Yang <richard.weiyang@gmail.com>, Barry Song <baohua@kernel.org>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/mremap: introduce more mergeable mremap via
 MREMAP_RELOCATE_ANON
Message-ID: <2897750a-3aba-4488-b3e6-4fce23aaa23b@lucifer.local>
References: <cover.1749473726.git.lorenzo.stoakes@oracle.com>
 <7e51e1e2-7272-48d5-9457-40ab87ad7694@redhat.com>
 <b65dd020-5e02-4863-8994-def576e3d3dd@redhat.com>
 <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76zi626uk53dtfzmezzt6cfz45ansam2gpcumddqxnipnw5jkh@qwfzoxgi255b>
X-ClientProxiedBy: LO4P265CA0215.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:33a::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB7289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2db1881c-c99d-4e2c-a857-08ddad888f83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DwpLaZIXNL2yMv+kRPQFf5+EjQleWCIktJKMOYKZJKhToe/6V+stIl1u5S0T?=
 =?us-ascii?Q?x3kL/GCVNMeiVh6Gty/OR0q7TRnQoJsdc4Ey4+MYkpYAs2L4MRYm3YdtAeGo?=
 =?us-ascii?Q?cSdnzcoW1YzGsWMIOrf/nTGzf3XKtW0mf/sBvKcW2Qe8y2YWTYFMtsVScH6B?=
 =?us-ascii?Q?71jdD/UE5e9VrTJjoCH5nikrebsaCpGl3wj4BgUZRSPMv2ouiHAIoI3qAJAr?=
 =?us-ascii?Q?cW5MzaYr+jVwFbMb4HEPGIAWTCubaJlpe0NQv10kLBZvht+ODDsN6k3JauFq?=
 =?us-ascii?Q?ZITJ2xISU9QXuVHoJpSt/8PkpGpChdy+AFM7TppLY8tK2CaDn3rxFO9CeoGn?=
 =?us-ascii?Q?oB/hJ3iIIyUsfyvmR3Mj9pzImdYrVbokr3dxsAfO2CDboMEdvyh14TOrrgS5?=
 =?us-ascii?Q?CFA2zMYupooVS/Zk692MEJDdERn8urz+pB+BEqDY2rKdzNIYucWFw5mPZoGJ?=
 =?us-ascii?Q?kbOJFdBMyEHhP1Qb7TrMFvGk2m21lst2dtkNMeTGGq8A0eWDRvMz2CVm8shC?=
 =?us-ascii?Q?9mMukS4uLmo/txk1p8iJOtjE0Qhnw3KKY6xXNQ1uv7ON3BXP3DvzFFauX4hT?=
 =?us-ascii?Q?d5yyiApwHDjOtKlCAcZeSkFuEGSB7mjh3Mg/Cwv2y7GvokrDvkcAvVFftw4S?=
 =?us-ascii?Q?JkKOE/jXIVMt3l1uXc995rvKceZtWVPp5igSpHBHgW5yLjGBJAxmEUcQfQLD?=
 =?us-ascii?Q?QXcGqTGYDs15PXxIoSFuMtqiZtJVVjx7eWdA0NJ4Qj5KdnJG1M6Z/kJZgka2?=
 =?us-ascii?Q?uxgieQBdng1ebupghp04KfJ6O8bGyeTJfKxzd5Sd+xXgVuU3w11XQsq46Rba?=
 =?us-ascii?Q?/4mz5G78gHIjnkvDv+ZPbVY7f/A94Z0Y1ybDQnK3+myTIcjHbUhT6+c/GNac?=
 =?us-ascii?Q?h3cqA9maYsoSJlmgFXtZILCAQsv7/IMhlKTMos4vL0dOsloWg7ZEJ0BvLoTQ?=
 =?us-ascii?Q?TXCgEJLOF7ELWl9iUeqkyPyfw8MHkJ4T53BRziM0rVrbWAerRZrLniXgBuS2?=
 =?us-ascii?Q?uIjVz6WZvYGgI4dLkvaldQ3xAW/q7nRwrj0YpSW0N2bDJX43aFxJcIDIBrTK?=
 =?us-ascii?Q?ygmAPtwpZh0VQILsGzjvzrhhQ48PLqVy51XDvD+UqUepgi5HeXqSMVQlVLFA?=
 =?us-ascii?Q?MwGosvBZKuDyp40zvJrRIRXeRR3B6MIdDEHF1ACUZbLKnA4YIKuMczkoYvM9?=
 =?us-ascii?Q?OoHuu7VQ/C/uiC8AGJOFMzl+P2cbpyA6p1IFFjj7JUYIZRdWzb8UCfmtRzb4?=
 =?us-ascii?Q?3eLkKL3xXLA59htaNF0pekl2FbLMQzWZhVl9vv0A9Pba6EaQWmRKpkeG1Y7x?=
 =?us-ascii?Q?VNlAJVOvImoWRlh2xIKwsbhSpPPMOet4vGKzwfVo6JLrpfgDcw5oX5dmJSwW?=
 =?us-ascii?Q?2M8kNVhLKDEHQqpi9BOnSmhjBMve4FU96QKiZg8tZZrj9FLf1XMEUpLbCARt?=
 =?us-ascii?Q?FQLI2z13/FE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?p8hG5b0X7e63NeppACiCFQ5wqWZIdNu3u0dFGjILKtYBEVWU4H02/HY/yncB?=
 =?us-ascii?Q?S+bhSBKsQ79ovb9Jj/Tgy6kIIIsRKRMs9MnEfo92vJjk1SWKS4L7tqusvLPg?=
 =?us-ascii?Q?CLm7bMrRRG/BUJcVVFXKqHwTj6+RHZTFpJX0FLqPCxFbzxi3+xRzfva+e8qE?=
 =?us-ascii?Q?0EtdM8HnwpXTh2HpwRspip2Ut0suVC6u004BhOGDBxzp29c+2GZW+aHK43pQ?=
 =?us-ascii?Q?xzxm8779rqv8hjleBGClyl1ccQKvLBEBCD8vMhFqkJdG+0o/fkl2FpQ1rHKu?=
 =?us-ascii?Q?P+BIx6058ZJg1ubxwHi00jmH4Cq4EI/xgFaUaVFaB3n+5KWh7fQ1VmgAKaVp?=
 =?us-ascii?Q?W+i91LGMf+77B7KSg0Xv2uOFDbYKMQ7HgJWJW8MMDbC4W6xTkth+g05IUVHL?=
 =?us-ascii?Q?wsfSkbEtK1AKX/s+3V1zidqIH+P49cyh6ylaFzEEYLftk2MoNsQjcInTF+37?=
 =?us-ascii?Q?s4l0djWKkXrBDl5rUE9yrmkE70czMtIjx4PWyZs0YVsXGpVyHqDL2Xda6u8a?=
 =?us-ascii?Q?wGzgPdTLXDeXwzRmwNB9VZwKG0xjEuw/jtmQ9sJV8h5PpZ2vJYvPXk9B0fZA?=
 =?us-ascii?Q?SvqMkDEzFnumOIFdRtFUpIfPCbYAcOsHKyRed30yoA7BOVt5rAY4KzkypAy5?=
 =?us-ascii?Q?FEkSwGE5Ob47AEE+hS+hgaHnbDOWVQ5xpU52NQG/k0Fq4wjTDZDxGKjciJN5?=
 =?us-ascii?Q?Q28lNF0gulmw0GinSOQlc6rkAMR6HdzoraR5c5B7s9avnDgYLYc8qOLXKxjI?=
 =?us-ascii?Q?+UmuhJ8yuDJbiT6Zk6e/xOIoAbevDfvqzZWfWGTg9PeEDE0d+MMSucyipHX2?=
 =?us-ascii?Q?5sVNa7LuYUz7LrM06QSVSAILIbEBOvYPSnmyJtDauZsMQKTNvUaFLhDjnGwN?=
 =?us-ascii?Q?hob8FfpU717Z8rhDXEo3wdn8heqyXoXjohXF9HtXRDE+yDfY0UN1dQrynMQ9?=
 =?us-ascii?Q?+QhJUVYSMRvicmgeUqYILOVZ5oBsrx4d59NIVUYgUOje88ZmRPiXmOMaJtYj?=
 =?us-ascii?Q?MBS7cE9LajiQZBL+aa3be4yDfSjkev+tv6YQcqouMAcKeL4KPtY1A6DKM2+7?=
 =?us-ascii?Q?wb/YW5Ou7XH1ICmB3YFDBzTSLiCN6gwMSuJr12C3eIxP1UzQTAh3flwltyQd?=
 =?us-ascii?Q?CoeDesUz5+IRn/n6wQWrwcUO2DsnJ4O1iB7km7C9mznhG2CCe6Q3Mt6m3GN7?=
 =?us-ascii?Q?IFHSijt45JAZYvHJZIwmRSYl8Kh4tyYdZa+2OUu/o9OIEFqQy9O6RSRnZFrg?=
 =?us-ascii?Q?YSJ6D7SAG4aUzdNlqf5j4il+3dkSwgg4FMNYMWvc9cACo6LcLhpab+x/PlUK?=
 =?us-ascii?Q?WnOfBsdOTItjdtBZg2SuQ7OFbpSavkN1PP8nUXbS+SFR+YNcacgLywWrg2XD?=
 =?us-ascii?Q?TDovyTQYnqSLQHjTUyHpjwJlcYAj8zLaUDbO1/f7tbIOQBhLMkHJmOMs4lRR?=
 =?us-ascii?Q?d4LwNRN2wXSX8JMxve04yHGMva4OtuHQvHPkmKkni68GUBsXELhQ83Q1RuC/?=
 =?us-ascii?Q?sS2e0Jzu2WGf+drXFucdR43DW1mUOpQti8fcVVCFCNdztnPFp8LigddKa2RJ?=
 =?us-ascii?Q?+vjDQGp21O/aQGHprJpNtrVxvBm+DkdtbZPIQCRtebg5mLneVCO+jVqH0BYD?=
 =?us-ascii?Q?FA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XoFAE3luDCO6B0ikCmmCIYPI+mAb4pB961+qZeu6hFZ+cu68DqfZ+VFXKoQzm2/uTOCthaFRURGI6Sx0XLWikXAiHjWGrOcNlm7uqIYK5trBQn8mzxNPlRVfCXOIAyIuAD98nNRfZZWzMfP6FO+MfM3J5C+tWSChpxavEtnHuPyD/2y/290IsnhsfCyUkN13WO90tXDQDw54ycAeA4rmr4egJUOf7jW12xbY0HgEHMRkZYAOQaD8Ie+/vXFUEv3E1oKOuM7QYGvywKYNEWD3r7wUJ/VNAnz2DuHaFDUV2oOUYEiPzLTie4KPwIZKhnfxPLZVYS8bsn5jOZUFsHw5AuHcrdOK9X30hV/ddOidDG+JETj9VybittARCoVVFJwQPEVNzR58tTy0qO/0bxuMh8cDKvuos9yTRvLh09oDz5coyDtRDNYce7fy7uWFoMqomqSz3akcbOHEp+tMJs3bIavvusoBmWusPD2p5Rp75OEGjtuekSoF0HvUlEz7A5HHw/qowD39eW01t0ndd5b5uNwghLS5st6oRaVXbIQqjQPmWyRgpCOBe6sIKH6/jAT8AyZuEcCmVTd4YAwM2PKoltxs3KwZbdysSuuXfi8BQGc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2db1881c-c99d-4e2c-a857-08ddad888f83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 10:20:19.2220
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B6C7R+sS0RTxP4FEjbESUVlk/OQ6PsqZRuxeCBoDZslnXceR67oaEhY5lGrDizalXvWPQTuQbKoB9+JAJHlYtBrhKwqGka5VU466c9aKAgI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7289
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170084
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA4NCBTYWx0ZWRfX0VoX6h+VtRhb K5RHmVHcrxPo5kIONaTeB26rEYE6zyzfCgSXy+w+NKmfrgvZ2io1/gtcTDM3UP5qz0M2pL7nJFT rRd+xk7x5SM3ckJuIwFbSCvPy1Jf7o0IPA5+95yTF7u3XMR9c2x6MSyKw7VfnVeusZ19jPWzDQ3
 9J06a6uFuMdiDwM4sbqVncBxdFssnCG91wDX7Jkb+kv9h/wUNTjTdQ2eSEeBcqfVrHhg4Hyxkgp bO9sB4Z16/+/ULOanVFIB25qHYJOcgpm/xqpz9HvglNf8bKhrVpCJmIiYAdX1qkFo6I7etZ1N+S cJvWlaP+2wZCb5oFGbvc4bdkx30pjc8HOXQewDkfsul3RcxtG8JS8NUPH1JCDjpdTjIlLXDDePl
 G3yzF4WgbqPkSGP/b+8aKVBLrjxkfScxCVpxF+2dw19/eMrBZ2aqdhN/8SYK5WTRiXyjTP4y
X-Proofpoint-GUID: ESWe0fXhBZtUVCsQlZaaeOX2MC1C0o2-
X-Proofpoint-ORIG-GUID: ESWe0fXhBZtUVCsQlZaaeOX2MC1C0o2-
X-Authority-Analysis: v=2.4 cv=dvLbC0g4 c=1 sm=1 tr=0 ts=68514167 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=PRf6Hbv1JhZWvVx6mnEA:9 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13207

Replying to parent but quickly reply here also... out of order, like pulp
fiction...

On Tue, Jun 17, 2025 at 09:34:16AM +0100, Pedro Falcato wrote:
> On Mon, Jun 16, 2025 at 10:41:20PM +0200, David Hildenbrand wrote:
> > On 16.06.25 22:24, David Hildenbrand wrote:
> > > Hi Lorenzo,
> > >
> > > as discussed offline, there is a lot going on an this is rather ... a
> > > lot of code+complexity for something that is more a corner cases. :)
> > >
> > > Corner-case as in: only select user space will benefit from this, which
> > > is really a shame.
> > >
> > > After your presentation at LSF/MM, I thought about this further, and I
> > > was wondering whether:
> > >
> > > (a) We cannot make this semi-automatic, avoiding flags.
> > >
> > > (b) We cannot simplify further by limiting it to the common+easy cases
> > > first.
> > >
> > > I think you already to some degree did b) as part of this non-RFC, which
> > > is great.
> > >
> > >
> > > So before digging into the details, let's discuss the high level problem
> > > briefly.
> > >
> > > I think there are three parts to it:
> > >
> > > (1) Detecting whether it is safe to adjust the folio->index (small
> > >       folios)
> > >
> > > (2) Performance implications of doing so
> > >
> > > (3) Detecting whether it is safe to adjust the folio->index (large PTE-
> > >       mapped  folios)
> > >
> > >
> > > Regarding (1), if we simply track whether a folio was ever used for
> > > COW-sharing, it would be very easy: and not only for present folios, but
> > > for any anon folios that are referenced by swap/migration entries.
> > > Skimming over patch #1, I think you apply a similar logic, which is good.
> > >
> > > Regarding (2), it would apply when we mremap() anon VMAs and they happen
> > > to reside next to other anon VMAs. Which workloads are we concerned
> > > about harming by implementing this optimization? I recall that the most
> > > common use case for mremap() is actually for file mappings, but I might
>
> realloc() for mmapped allocations commonly calls mremap(), FYI (at least for
> glibc, and musl; can't bother to look at the rest).
>
> > > be wrong. In any case, we could just have a different way to enable this
> > > optimization than for each and every mremap() invocation in a process.
>
> /me thinks of prctl
>
> :P

God please :P

>
>
> FWIW, with regards to the whole feature: While I do understand it's purpose (
> relocating anon might be too much for most workloads, but great for some), I'm
> uncomfortable with the amount of internals we're exposing here. Who's to say
> this is how mm rmap looks in 20 years? And we're stuck maintaining the userspace
> ABI until then.

I'm not sure what internals exactly we're exposing... if we have a future (I am
working on it...) where anon rmap works better then these flags become no-ops
right?

Unless you just mean the name?

I am open to changing the name but I think I already changed it based on what I
thought David might say :P

>
> Personally, I would prefer if we just had a flag 'MREMAP_HARDER' that would
> vaguely be documented as "mremap but harder, even if have to do a little more
> work". Then we could move things around without promising RELOCATE_ANON makes
> conceptual sense, and userspace wouldn't have to think through the implications
> of such a flag by reading Lorenzo's great book.

Well thanks for book plug ;)

I think that's far too vague though. I don't think users would have any idea
what that's supposed to help. And then how does the MREMAP_MUST_RELOCATE_ANON
flag work here?

Naming is hard, basically.

>
> --
> Pedro
>
