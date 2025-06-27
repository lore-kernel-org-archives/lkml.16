Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83ED2E8E08
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751038961; cv=fail; b=sJ20AZbbe/fzuZLFf/DcCZnZpAGqtFP6GCowfiFGT95/l3YPZBbfmv2YYNCiEo2jwNku0RNPm87AuqN7r+u1IiPl9CBWMBZEFIm3RZsHF1gi6gRt5LEiynojr0/j9dMDbPbTedl4rg39PTszSM4nY/XPD63Y96keJMskM5HEkJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751038961; c=relaxed/simple;
	bh=dbpPCr7Q/mq2UwERy8FKii11MBvc6DzyIFIYwGJDWX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTWZwc5ktOMk5N5mfWyopNKZjFczt9+G6n/cM0rwm2/uoU1hjjrSlxr8x4ZPicQ/sNtfVL4r2gStY4lLUOtFg1LFATS5OemaZ3j+SqMCG9BAL4u9aXzdm5d146wiJFTzr+3UmpPBVRnvAgL0VS/LHRCt/ZqzaBsL5QZAnUzBUvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=TCdLrIHO; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fjwsqtzs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="TCdLrIHO";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fjwsqtzs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55REYkc0009668;
	Fri, 27 Jun 2025 10:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=ypUv/WuC0eik30NrCE
	nSAviAo9KE8slNDk6SPjJHNJI=; b=TCdLrIHOAwgStOthm436R2o+YO9/hEYD7O
	dv6l+Gv27tDO2xjl5Kk/uiZ9F6Iby8f9tYE9C62ZDViuZHT4vxTTzkXStLmgjvs0
	53WH6QdrMnDeupnl0EkR0rp4Nn+QbuwPMmNewjnMh8qw8DagfGONpkfwJ/K1D1aR
	61a7pBTeVxZI1+IUtYFO0K/hObTH8NtE1FdRDkmiqMkMQVk9801W3/czinCu6lpW
	2c1oNfte26q8bOhvrkmQTGUgFPX+0O7mvdGAnt09JA+8gmotVAIH9o5Z5WBtcqby
	jI+GlZwhf9JhfFkAbgoJgRe7l1/nv7NX16eAMVH4+SD3lxYACkKw==
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2109.outbound.protection.outlook.com [40.107.237.109])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5u003ay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jun 2025 10:42:32 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NuDgS9VpflB/uDKwsSBCXyDvBTk1Q4TVEzJn91qg4fzStf9ishOzys13QjFY529lFQhAY/trePqWAcuJKipvj0LjUAmxjzgK1uvsNcxwiHm4/mn7/OYwx37Hcx9lNR6AGRLMBhzLWawBBBYzf+Inkst/lWP/FlpfHMXcReI3Jc4cQhCvRSeMtH72G//Xr3v/fjtpY+pDAbKW0qZMZxCAtC+vBP8NiX/WWT895A3QfsQcDpJrLS66z2yrwrkz3xTRIGeofrvowd9TAwcXtHS7t2mCWXa2fMdCZPrCno+Wmc/r532YrxwBjHSmAVdPtC56xv7BlfNiKv5EfqdcGCYu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypUv/WuC0eik30NrCEnSAviAo9KE8slNDk6SPjJHNJI=;
 b=AaG9BJVnfyLufME0kpyEZNwKwqG+ujR8QVdHmQdCIrMQM28G5mD/JHCCR/qvIglbA2lSdOr0q6pIxR8QAjvyQfn/QXoR4tgAafMyZ5lVxFSO2lHMvjjZV/G3fmpg2PMEC1Vn3rRKEWmcRg45gdgiV/OXEHsVsdn6+A68MFnzHJ9zuCC96521vrpCiSliDHRACR0yVSbal/T4U2EvTds7qCAh6IGsBgeqI4s+hJWAN4/8SVh78HIlLJaNBW3tBK0YVFzbj24xSccKtP4lzl+8cqTREjfZfgOzzRdWFsqr03SZsqHChlHBUadzGOLEKtCZkcnSKiUja3t5wuhEcjCtaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypUv/WuC0eik30NrCEnSAviAo9KE8slNDk6SPjJHNJI=;
 b=fjwsqtzsojNI7NQKnXe8+KS2UrAFXgYF0SNsUZlVl/o0jPaeD0NLkWIOi83+CEA2KdY9o/uV4edGtbK2wRs1VXdQzlmuyzNCGV5pSEcVcwKnkstgQla2IsB1XDq0orGE1MsEF6Qo5nx+ypyFP+dDnMttwxjSDL4opjC3Ne2QdWg=
Received: from SJ0PR03CA0268.namprd03.prod.outlook.com (2603:10b6:a03:3a0::33)
 by IA1PR19MB7711.namprd19.prod.outlook.com (2603:10b6:208:3d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Fri, 27 Jun
 2025 15:42:22 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::97) by SJ0PR03CA0268.outlook.office365.com
 (2603:10b6:a03:3a0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.21 via Frontend Transport; Fri,
 27 Jun 2025 15:42:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Fri, 27 Jun 2025 15:42:21 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 06FFF406541;
	Fri, 27 Jun 2025 15:42:20 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E2A2582024A;
	Fri, 27 Jun 2025 15:42:19 +0000 (UTC)
Date: Fri, 27 Jun 2025 16:42:18 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v1 1/1] mfd: wm8350-core: Don't use "proxy" headers
Message-ID: <aF672inWiF70Y7Su@opensource.cirrus.com>
References: <20250626155951.325683-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626155951.325683-1-andriy.shevchenko@linux.intel.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|IA1PR19MB7711:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f09699d-1b06-4cf9-6067-08ddb59134d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GN3Ff79j+PoVi1MyDiYUA3oOF8n/D2Kh7hbi5spTUdTGnEi5/RDs2i8cbaDn?=
 =?us-ascii?Q?JO5clVUixLjfjDpsCb3WYPzbPhYUr52L8pTEM2SKQNnfxji5n8VVc99+nw/9?=
 =?us-ascii?Q?P091IBzM1tO9K1ZyEieImht6nCzh3cZI2X4jcyzpn8adFuCKlf+xeN6QNiBk?=
 =?us-ascii?Q?n9yxMkbE97BzeBcTXrCuCj9We4EFxD7Q81kAiQEl5HSe1y6rZROvp5w5DXw/?=
 =?us-ascii?Q?HTEjNiCYP2pAl8BF4PONLb8+1OLNLRm33JJL8RSeSzHltD4Xh/+FYdcYufdk?=
 =?us-ascii?Q?tVEwNQrWbqarE3UG7ZP5gmrVpU3SuVE4oZyMWmgUcpSqyEBpNIZWop3p2lie?=
 =?us-ascii?Q?JImGgrnlSMDnSpnj0jBktRMFkxBITQ3bGUI3cTi7pB/XNYlLPsvOVt5Z+AdM?=
 =?us-ascii?Q?ORdxEXzpltJspHTpYo8DKhQOosyUsnC3tR+RxSbPDJmT2demilQ5cfR38CcB?=
 =?us-ascii?Q?6osNBbeiFsDIvpNiBx5nI4JIvwv/ZhOGPqegHO54MfEMqiJfRC8o6gpB9JV6?=
 =?us-ascii?Q?6Yc3pl14DpIITZJUXCD/0x8KN9KfG7XSk1Y7VU6t91Sk1zae1LRzMwD0XJ+D?=
 =?us-ascii?Q?6JWGU/kHu3F5pBHr3AdKgn9/o/QTgJxbn+x0KFXNdlyUqZf/b8JFEuptiwwf?=
 =?us-ascii?Q?kIFuYM2Hj0+WoGvJDmguQhcg8l9/XTB6ldnm+8NJ1L4r2zcwMXEaTBkO3Agk?=
 =?us-ascii?Q?7oX78yDYMR6uSL6Oay90+Tl9C4nwVbAy+mfEQxIIoVhL2swGYN+ePtJYfy9/?=
 =?us-ascii?Q?U2jtkM6f9PgIualOhNJD1h4TN8Ic5Kfd0ksgaBVgnxfwpsUeEdiU6PylOc9n?=
 =?us-ascii?Q?eW/DnK8x+ykMZfHdEFLVD23XqYB1iQmE4JqgJXRTU4aoTw/gF4/Ju1avb0fw?=
 =?us-ascii?Q?EclVO2hrmj+JNHfIsHf0z8V9i42hOnVHi+7xTkvMc7KYnceeSuRNbGLQH0Vn?=
 =?us-ascii?Q?sTHPXgo0lkCIoCalK3OweHQ3zmYeO2qauw8IVhkVaxdqUZX+dHfj6Qd5uwBs?=
 =?us-ascii?Q?MP2LI3Fa0DX6GS4pboP37KkfqjJvaJcgFJv6tXLituo9l7Latx+R3+4ViVDq?=
 =?us-ascii?Q?4xvI5KLj5RiKCBskyI+LW7ExdSnzSVMJNMGl0CWWzJsy7Eub9Wk1SWwd2/Ut?=
 =?us-ascii?Q?pqIc9eJpS7tddY2+HsrOqcO8nsfO9kR1MgLPcRUts0MWPcS+pODC2uFlMZ/C?=
 =?us-ascii?Q?7eahyx0tjU7Vx1Dbpc9fuwdj6YCTLKSNwIT4oF29WOPdxcSeUmMjYnGhvXKV?=
 =?us-ascii?Q?tf4HpkHTRhquh3Hql6re0yGTnkH4N9cLrNxyD3lnMtrCHWkL7eLL7HVqf4b6?=
 =?us-ascii?Q?9RlNbbPkTsK7xbkj/8f1zQHmgbTWz6E9jGSHqE7eTGNUgVisW0xAg0MlFA/g?=
 =?us-ascii?Q?HCU/2GjFrV5YAJGABMS9zdMKsJpFWuHDoPs8ptEbaiZRfxk0MZCbBjJJZ6xD?=
 =?us-ascii?Q?AUivzShfbdDVzHpiwW1DS4Xc3wp10AdDgfgqAyQpMkpVjwhUD+7LpxrbBZxa?=
 =?us-ascii?Q?+tDPEgFa9asG0Gi6nWGVb41GxOydJ2QWkroZ?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 15:42:21.4666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f09699d-1b06-4cf9-6067-08ddb59134d9
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR19MB7711
X-Proofpoint-GUID: fGggQfmgkwZ3qaczo3IG30HM1JJnpbs7
X-Proofpoint-ORIG-GUID: fGggQfmgkwZ3qaczo3IG30HM1JJnpbs7
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685ebbe8 cx=c_pps a=IZtX7zTm26LBIsBaguIpxw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=Z00PVQUDKefpqbR5-xMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEyNyBTYWx0ZWRfXxlGhXFwUOl32 5C4+90mtWbqEP1NEKXLNjBbvKTu7IMAFs4/dGbtfeJ1dYbdk9wfLV9/CwWdlBdjZt58d0I0MmEa 0jNpYidsJSjwG08OeHCj1hDTe8xA7OIA6daGNrV71RcN2V8Dz+QnxW86bt/m+dB09vxuuBsUySQ
 ACpsSkEFAHOlweHe/2qFZLmkeUBxj4QBtxbXZGJaCe8B33l9MazKH3QMbn+eKG35odXfkb8EkQU rA9G9WpOzCpRkmAXzU7dqqLtXowgxaHmJlM3V/It5BXp61700axTPe7PP7KhRqSaMWaBpMimRP7 dsO9T8CYpEw3ADMceSR5Dm0FR2471bOM1WjVmmHOVL9BJcmpjuMM+WFSyXvaNjexxO5wDjohJNG
 XUOVvXSsLnkD9U/Lx4Rh9L7eXjDHl8d/ijeXkXQNSxznDXpkUDk7wxFKSVVI0KxmMAE7LNL2
X-Proofpoint-Spam-Reason: safe

On Thu, Jun 26, 2025 at 06:59:51PM +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
