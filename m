Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1180F1C5D4C
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738326750; cv=fail; b=RZDbLxi2HVFMTqanl23o8XX9k/sNcSHuFxC/UuoKKVHrptPgp7jx8a9hZclqtuUQO4Yd+j3G8DCILsqx8y4l+gWOTWbCO11APzZZR68YgD/DyqafOkGwAHfRSEl/93MOoTgFwS5C0nxQe46ISC0UeHiNdcVHSNYas6QJeKpaXcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738326750; c=relaxed/simple;
	bh=+9/nuMT6vDqlIg5xj9zT5Vw91Vy5xybBbpFgXUp+ueU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JUSzDpWv7pp+ic7hwb6bAJiLC25CvMqo+ZieTS6XzKWt4JEQXcnJh+dOdBypVQeRa2XvHM1GQ3J3rWL5MN1ee8L5walJiQ/EDwbXS3HjisBmcait4QoO0ab2cnKVO3qjiotY5rko/C/v92ZmbD5DTuEFwk6tQcf+BZsfRuEgHnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VXf8zCNH; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=ZMyLaeo0; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VXf8zCNH";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="ZMyLaeo0"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50VBlKZc010868;
	Fri, 31 Jan 2025 12:32:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=; b=
	VXf8zCNHLHopJpsTjH7RkJ6avRnk9TlyB1omOzT5rmdTvmVTqmuPvamYZUHmirKD
	siKOrpJNukS7iFhP1NlGCtEh30bON8yd55aLn3r0JQxqBEuJZHtekbYSFY/6B3KR
	c/lM8ueVxLa2c33YZefY583B0P+yovjV5Y8wW7gsNkKbGRj8/iX59aStgTR9RKEr
	E+vZFraOS7LZfHACQxkslogemlzxTYCZU8ucrvohHkWdxtg1+zuzV5UyWUTjMguf
	iFSZBPBLVuAl0GeONJG/ATLfzaNYKwYD6IRa9L/TdTQHu6SlR1nhQE5ihxoW5evq
	zpUdmZVMWcFag1pTz6SGCA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44gwxqg1ss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50VBqJVI009186;
	Fri, 31 Jan 2025 12:32:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2176.outbound.protection.outlook.com [104.47.57.176])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44gg1gauwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 12:32:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hOLEfFOevPE8Rn4ccx0uJz9czJKUBnoJJZGrEGxOLw6TnrYUHEQOhZmdhFaSxE1qD79JvKKe5+pyMJW94bzmOrKCF3K84ZV+1y75a001WWqz21dXcrKBNz2LjuBxSU0KJ3ZntGYV6ze0BxBcrHTWB8ZKz8lB2i58DnKKjRWL5TC0KEbwy0XywkLssaemBLIC97e2AMRiU1+robdS7OKGcAciG3ZXYaeLy9kSXfqNF5wHsF9ss0y4Nw7FSsaSkEw3TmrJ47HF+A03aMYaQdGKhH5RFk3oRjbXbR5FJ2JaKMz4xj+DcDvqFatZGPX4uLkyzOZM13KKfHzRudXpZkH2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=;
 b=Vas0uvxKlkiz5l80MI8sQx0TmjZINGQPBS1uHA9Q81fMQO4chIW+cmyo3K8zZK/ND08g3/f75w7AUmSfGN75AJQpnr/H+r//9/aItw4Y7cREXrSwfLRBf7HSkdzO2KS3BFpVEOsqU4tpn/Yma2hNW2RjtLIEAn14Xkp95IgbfgtGnIYJUnSGN96f1My/Zbl+Sr8Y1mQqOENLgLI+yuuoFyLqd+0mBEzeoTWjyZXm07HnXP6EQ4wjk8+73o2o+QFSZOvJkT8OGYxjdiijSRMuDK3ppk64VeLKa80cGlmIkpoC7mvv6V2WxjD9Lv1Xp7sy01B6DYQdCsk2asUBDQDI0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YJSKWlatYWLBz+jZN7/O6d3gx2Ck2wdZ4ueX3ZXgvIM=;
 b=ZMyLaeo0Uql18avIZy+qSThlh9aYfx9zkOrfKaL/pwE4NlPklbznZFuggBYtVsBTdUr8UJ0e/a0r9OauWp07lgh4Ajub51X20ycMMSF7yu4iVBHtC1qPsl+QNuV0RqjFrN0AinemjkD7AnPhoa5lXD0nvVASXGgt8bfW0Isvy3M=
Received: from BYAPR10MB3366.namprd10.prod.outlook.com (2603:10b6:a03:14f::25)
 by CH3PR10MB7741.namprd10.prod.outlook.com (2603:10b6:610:1bc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 12:32:16 +0000
Received: from BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9]) by BYAPR10MB3366.namprd10.prod.outlook.com
 ([fe80::baf2:dff1:d471:1c9%6]) with mapi id 15.20.8398.020; Fri, 31 Jan 2025
 12:32:16 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R . Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/5] mm: completely abstract unnecessary adj_start calculation
Date: Fri, 31 Jan 2025 12:31:53 +0000
Message-ID: <7bce2cd4b5afb56211822835d145471280c3dccc.1738326519.git.lorenzo.stoakes@oracle.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
References: <cover.1738326519.git.lorenzo.stoakes@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO0P265CA0005.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::10) To BYAPR10MB3366.namprd10.prod.outlook.com
 (2603:10b6:a03:14f::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR10MB3366:EE_|CH3PR10MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ac8ba62-a103-47e6-67a8-08dd41f34bb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uxL3DlYdh+WGPli8ekLjpD54Z+JSZBu2thmOkH5VvDwYyf3MFDRP1+PbH0F/?=
 =?us-ascii?Q?haUiDn88v+SXdyTLfF7fVs2NoCD7R5zDzotN1lqN39IjI8IR0KjtJDsqI1Hy?=
 =?us-ascii?Q?NzRLMiXBQ+iUuoRBiNH1riRwU8pDmPqtHs7qt6VIujHmYozRnckq9z0hM/5N?=
 =?us-ascii?Q?QS0+Vx4dLMRwK3SX+ItzEVgZTnHA7YPymKGnr2Cnf1iv/9nnJpbT+6ccEdc7?=
 =?us-ascii?Q?V5aChigbDOtRh1nGbDZCIABUR0sWsJ/VMk9zPYnav/dpp0N4l+iUCB9ocZlS?=
 =?us-ascii?Q?tlFLeJDWFYOWxrgSs1UJTeMt4h+/6nZIhL2B7uu6WqizmNW2GvwgwuGMs7up?=
 =?us-ascii?Q?xswQnDhcCvZd5aKCX8y8Q2b5mzNL+YbE1SqEDzuDw9qL2W1ilL4Uzdk3GAo/?=
 =?us-ascii?Q?vSauac5vak0jCr5kcEAwe+IhpKG9VqvZSvjs5WNeXMxwbPBTtGX2AFssOtnx?=
 =?us-ascii?Q?xTKx5VErecShCH0p6MJm+WN2VYpyrlEeED8wZTv6e5C83USljLYBPsjIQ4zc?=
 =?us-ascii?Q?Vz00F4nblDPlupgdk5MKSs9DUK4G39XIC/ulvjJ1jSIzdT7608LpeuEgkcI0?=
 =?us-ascii?Q?KOyiFR2BudGnc7Yo0i+vJ0+eap2f/cBGp5NqPY/vgX1Ucup3LSsCHmghGWu/?=
 =?us-ascii?Q?TxRJ2BAv2pTpkhxuq3B3OobrfGhBDP0G6L0953ADje1j+oTX2GIVdWUF0SpY?=
 =?us-ascii?Q?H25hfU85pi2TGBUk8s7AncIsHvcdO/WfiX2TunT3oyxsMbRivxFuXwLVCrxH?=
 =?us-ascii?Q?fA9/efcduoZnjUKZRpSV6+SVC3gqy4D8zvTH2HI5OqpJni7pGDbjGRDQYYin?=
 =?us-ascii?Q?JR1Oc4eBL3nu48kT2KT8mLehvTpDVsfXR/mWa9GbE0okygl7NPd4KgVov953?=
 =?us-ascii?Q?CLSNP9gH5LG+vyZJcuVCL6m2L3yoLl48fek8sxLODbwqcPIu3uiiSLajir7E?=
 =?us-ascii?Q?yd9DxutU13P7ew4v1nY41UyTUUY/uW2Ye7UfhKrLLOxu8BLAsNOoClgcwqoT?=
 =?us-ascii?Q?hy8lNDHPjhs8VUUth7XavROfyV7I5EY6Q619e9G7r1xFK53j7WoqrHiFQonf?=
 =?us-ascii?Q?AD0gISGZpJBLJZcJgtwJEFzSrc2ZogUq6WVw9C1Xor53MEqhFol9PDgC84GJ?=
 =?us-ascii?Q?aJbadQ6tRP5hRjDi6TVJArmAUdeNA1QR2ISGS5gK6hi/q+XVMik/msQO1o7O?=
 =?us-ascii?Q?Tp1k1ixTRnitVo3EMe2LPZwGpCBmblcJdAu1gWmfHLuAIjS/q9rC7cAsXCBn?=
 =?us-ascii?Q?dZhQYjNxX9vuUq8mf6QmZ8NAGWw49y7R2SQSbULMRbmeIdqdNbTTrgU37B45?=
 =?us-ascii?Q?vBtIBzL+rCvd6NL2ABrh3jPvURRfG72y451UykfAYYNbOv968vgBt/ZKl7t9?=
 =?us-ascii?Q?qSn3fQezrwIy/ve36CzoM7/n/9BT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR10MB3366.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ClTJHKLMApSYdQ7MmRZ4MxIH8uraVrLDh8KXrL4iNM1HrAWRHPj33UtkSyO?=
 =?us-ascii?Q?NE75ppuGWoZHlLyR8g7BVb3VC0UTxqZXv6a/9+BmF+COQSyKz1QGnG4GSVIS?=
 =?us-ascii?Q?tCCSxNQNHP0XU1K2Nsqtio/iOcg7VZcYoKBQq3mdTwJZsTnjxhXf7ZLRCE2G?=
 =?us-ascii?Q?UZWBuDTzJopas4Ia/fmJWpc2srqFwB8vsyQcnNcipSWDnD///V5xEhrB6yhA?=
 =?us-ascii?Q?dloMGMSkSouXFTVpvmRqvcD2c+UnWFmWRXtzADnHdmpmapC/5i0s3ou2Huvw?=
 =?us-ascii?Q?PiwhozBuO31nYHlueIEJU8gEV2BvIeljtxiebtnJBBAV/sjkQsthkSMCG4H1?=
 =?us-ascii?Q?bp/tEvNhbQKsXSocSYLdyeTzQUUNpeFnCTlvuadadGo4SbczqoP/4ryJdW9m?=
 =?us-ascii?Q?34/RX5Y3+EDlRim+akTCOyu+WwNVyCnUt2TnVntK6oTdxcEwNDi7hVdxbwuU?=
 =?us-ascii?Q?QpFZrgom7KA7x6vC/enDJPs+NpJ7PcK1ZDfozgZRRhKo3tZPy+0j/ypQWlZc?=
 =?us-ascii?Q?N0P+JFI6wPTpKmySHFTquZ1eHY4igDmc25rQInezvlOzxKYKTIhWIcdiewAU?=
 =?us-ascii?Q?6z2eib4+mwmZGrtkvglRbTagspPPaG26j/kZmPvrl27IFLum9T5DKJd/9XlZ?=
 =?us-ascii?Q?USRrbuWddUrBG0U3YGwE8yBmWIB5W2K3eOojF3r7/gmcAhCKKgXMmDr3xGGh?=
 =?us-ascii?Q?cNdVWzFSDOcqdqNnZEZfdueF2oKi+lDAPlYrJa0XdNWW0D+XhS8RYeIaLWvc?=
 =?us-ascii?Q?qlde2dCIllktfMScU5wOZoYEquoqrNwCGMGi5e0FVcL0tPreQc/4d4FbuXRp?=
 =?us-ascii?Q?NRPuicXnfGZTaPpw3KxSwUe9ReTRRz+9KUCdVMVmcolX5u+vH5qnZ8/GHvfZ?=
 =?us-ascii?Q?u1WXdVzXVvjkmWDEyULlX5/uZQev+Bxgz//ju3OJLpUAgNTt6yVPPDjSZMOd?=
 =?us-ascii?Q?1XM1qYFpVoo5ke/NnNEERVs+PtDc1fs//fq3y0ZUFKDRKKSmsfyHQb+tv9NO?=
 =?us-ascii?Q?YhR6nxrf6gP+tJT0FHS2yndqGXwh3Hcr9ybfoG0GyFtCU9Pdx1DQQvIriGEr?=
 =?us-ascii?Q?cu+hB/dtdRZhAGyWf1a9OXAqqGHpvL0+c0EyCVEPq7v8uIrt548UlLg2jre6?=
 =?us-ascii?Q?vJsgBqqIJzyJWNLcMgHkuhT96hsvC4/1iTEnrUi65eWM5zLf4Z1M2t9o8895?=
 =?us-ascii?Q?lXMoQql5F03pthX2mHJ+A5QkNjBonmOQ+iQiH7+IXvwPKtwZpMXUdU1X7m9R?=
 =?us-ascii?Q?EqEmdXhiQ4r5LQyZytILvLAOEBkYHbUpY2THE3ySZ1xVO8e6w4E/6T00hBPv?=
 =?us-ascii?Q?g3ODzvj9ATO1T+uJGm47elRGVT5WbQBaVW/rCiU9Ap74Pj5yKjKZcqeyyozS?=
 =?us-ascii?Q?yXcfJbd9O0KpLAC6b0MqTVa1+p+yXKwwO9oWOn9WIsKA1s1L9DWPgxh53hjm?=
 =?us-ascii?Q?+nrcVJzRbVn/YIfcJcvzXeJhuxy3AYeCOBkPSXo94BTfBGyUDlnC7RkJTA45?=
 =?us-ascii?Q?8pCb6QmJLJ7+BbHK4bSCUAPbLG0g5IPhvwH3g50xkT209dr6TGZluxAhpzVH?=
 =?us-ascii?Q?N9CeDkglO+1+f+ndYNg/m/elgiHoB2psuXPdKaVWhqRSkpxBk2wfHYaObSug?=
 =?us-ascii?Q?5Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Quocla/XeuAPJqlX2JjxBNA9mx/NsJQKWk/dKLMPY92PX4RbYJSL9jHcHqn83Ury66CRNXLqxcOMcMEXUBnQZVBD3tntVeq5u23tT03Ns3JIxRWV4M6CRV6qT+f+cG1yiju4dN4wlvaR4UBq1R3H2ajSo5zBKUF4Ou5LvdZydAB6B7n3HGGl1Llg9S24XM2S1p+Mog/ganE8KKF7vJMWICI5kOPfHPqM4KqNVMa2e1gys0ejf33Ya6YC+DRsnYtSf+gJKyum7cdV1GMOxoLK6MX2zYCK3aKkj+KK2lBEFCAdiTINjLi1mLvmGqHdWYXonRL7TotRdslKClkekj1Nb8e1LdhkoaRLqbHxCZr+4yducqSWDrCTAJR6/6ngEnLTPcE87nRctheEx82JzW5M9+mzJM/5r2zc6ueEvOPz5uDuy0UtzIlbNbnO4p3a/Uab98ag00laleMEBHLXET6dVvdeZZTj387obwwACPcEEiv40N1FmOEkTyE8hdrZuo1mzRm7iwwgeVzPw4BcRt+hzR3fhcCSB6OOY9V8+lHtz2MXowPKxVaDECuMF2+MJde197KV927S5kmYGNEHH3yxr3vPU9X+rhQ8yzsKbgkVYZ4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ac8ba62-a103-47e6-67a8-08dd41f34bb5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3366.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 12:32:16.2308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +2DQjDBrvmhVnPxfD+slBaoD4tIpDNFdKzFDW6Aj/ktCfBX20rTmU9264JzcWODYzgLgsR/ST8Xw+R005RKj7d885yPL4RRAUwj/txW+LsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7741
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2501170000
 definitions=main-2501310095
X-Proofpoint-GUID: aCKY9io9eFkg-fHgracWT9lU1CCIouAV
X-Proofpoint-ORIG-GUID: aCKY9io9eFkg-fHgracWT9lU1CCIouAV

The adj_start calculation has been a constant source of confusion in the
VMA merge code.

There are two cases to consider, one where we adjust the start of the
vmg->middle VMA (i.e. the vmg->__adjust_middle_start merge flag is set), in
which case adj_start is calculated as:

(1) adj_start = vmg->end - vmg->middle->vm_start

And the case where we adjust the start of the vmg->next VMA (i.e. the
vmg->__adjust_next_start merge flag is set), in which case adj_start is
calculated as:

(2) adj_start = -(vmg->middle->vm_end - vmg->end)

We apply (1) thusly:

vmg->middle->vm_start =
	vmg->middle->vm_start + vmg->end - vmg->middle->vm_start

Which simplifies to:

vmg->middle->vm_start = vmg->end

Similarly, we apply (2) as:

vmg->next->vm_start =
	vmg->next->vm_start + -(vmg->middle->vm_end - vmg->end)

Noting that for these VMAs to be mergeable vmg->middle->vm_end ==
vmg->next->vm_start and so this simplifies to:

vmg->next->vm_start =
	vmg->next->vm_start + -(vmg->next->vm_start - vmg->end)

Which simplifies to:

vmg->next->vm_start = vmg->end

Therefore in each case, we simply need to adjust the start of the VMA to
vmg->end (!) and can do away with this adj_start calculation. The only
caveat is that we must ensure we update the vm_pgoff field correctly.

We therefore abstract this entire calculation to a new function
vmg_adjust_set_range() which performs this calculation and sets the
adjusted VMA's new range using the general vma_set_range() function.

We also must update vma_adjust_trans_huge() which expects the
now-abstracted adj_start parameter. It turns out this is wholly
unnecessary.

In vma_adjust_trans_huge() the relevant code is:

	if (adjust_next > 0) {
		struct vm_area_struct *next = find_vma(vma->vm_mm, vma->vm_end);
		unsigned long nstart = next->vm_start;
		nstart += adjust_next;
		split_huge_pmd_if_needed(next, nstart);
	}

The only case where this is relevant is when vmg->__adjust_middle_start is
specified (in which case adj_next would have been positive), i.e. the one
in which the vma specified is vmg->prev and this the sought 'next' VMA
would be vmg->middle.

We can therefore eliminate the find_vma() invocation altogether and simply
provide the vmg->middle VMA in this instance, or NULL otherwise.

Again we have an adj_next offset calculation:

next->vm_start + vmg->end - vmg->middle->vm_start

Where next == vmg->middle this simplifies to vmg->end as previously
demonstrated.

Therefore nstart is equal to vmg->end, which is already passed to
vma_adjust_trans_huge() via the 'end' parameter and so this code (rather
delightfully) simplifies to:

	if (next)
		split_huge_pmd_if_needed(next, end);

With these changes in place, it becomes silly for commit_merge() to return
vmg->target, as it is always the same and threaded through vmg, so we
finally change commit_merge() to return an error value once again.

This patch has no change in functional behaviour.

Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
---
 include/linux/huge_mm.h          |  4 +-
 mm/huge_memory.c                 | 19 ++----
 mm/vma.c                         | 99 +++++++++++++++-----------------
 tools/testing/vma/vma_internal.h |  4 +-
 4 files changed, 57 insertions(+), 69 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index 93e509b6c00e..e1bea54820ff 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -404,7 +404,7 @@ int madvise_collapse(struct vm_area_struct *vma,
 		     struct vm_area_struct **prev,
 		     unsigned long start, unsigned long end);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
-			   unsigned long end, long adjust_next);
+			   unsigned long end, struct vm_area_struct *next);
 spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
 spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);
 
@@ -571,7 +571,7 @@ static inline int madvise_collapse(struct vm_area_struct *vma,
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
-					 long adjust_next)
+					 struct vm_area_struct *next)
 {
 }
 static inline int is_swap_pmd(pmd_t pmd)
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 8d21218dc740..de72713b1c45 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3017,9 +3017,9 @@ static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned
 }
 
 void vma_adjust_trans_huge(struct vm_area_struct *vma,
-			     unsigned long start,
-			     unsigned long end,
-			     long adjust_next)
+			   unsigned long start,
+			   unsigned long end,
+			   struct vm_area_struct *next)
 {
 	/* Check if we need to split start first. */
 	split_huge_pmd_if_needed(vma, start);
@@ -3027,16 +3027,9 @@ void vma_adjust_trans_huge(struct vm_area_struct *vma,
 	/* Check if we need to split end next. */
 	split_huge_pmd_if_needed(vma, end);
 
-	/*
-	 * If we're also updating the next vma vm_start,
-	 * check if we need to split it.
-	 */
-	if (adjust_next > 0) {
-		struct vm_area_struct *next = find_vma(vma->vm_mm, vma->vm_end);
-		unsigned long nstart = next->vm_start;
-		nstart += adjust_next;
-		split_huge_pmd_if_needed(next, nstart);
-	}
+	/* If we're incrementing next->vm_start, we might need to split it. */
+	if (next)
+		split_huge_pmd_if_needed(next, end);
 }
 
 static void unmap_folio(struct folio *folio)
diff --git a/mm/vma.c b/mm/vma.c
index 75bbe82b2e65..39146c19f316 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -513,7 +513,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
 	init_vma_prep(&vp, vma);
 	vp.insert = new;
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, vma->vm_start, addr, 0);
+	vma_adjust_trans_huge(vma, vma->vm_start, addr, NULL);
 
 	if (new_below) {
 		vma->vm_start = addr;
@@ -644,46 +644,44 @@ void validate_mm(struct mm_struct *mm)
 #endif /* CONFIG_DEBUG_VM_MAPLE_TREE */
 
 /*
- * Actually perform the VMA merge operation.
- *
- * On success, returns the merged VMA. Otherwise returns NULL.
+ * Based on the vmg flag indicating whether we need to adjust the vm_start field
+ * for the middle or next VMA, we calculate what the range of the newly adjusted
+ * VMA ought to be, and set the VMA's range accordingly.
  */
-static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
+static void vmg_adjust_set_range(struct vma_merge_struct *vmg)
 {
-	struct vm_area_struct *vma;
-	struct vma_prepare vp;
 	struct vm_area_struct *adjust;
-	long adj_start;
+	pgoff_t pgoff;
 
-	/*
-	 * If modifying an existing VMA and we don't remove vmg->middle, then we
-	 * shrink the adjacent VMA.
-	 */
 	if (vmg->__adjust_middle_start) {
-		vma = vmg->target;
 		adjust = vmg->middle;
-		/* The POSITIVE value by which we offset vmg->middle->vm_start. */
-		adj_start = vmg->end - vmg->middle->vm_start;
-
-		 /* Note: vma iterator must be pointing to 'start'. */
-		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
+		pgoff = adjust->vm_pgoff + PHYS_PFN(vmg->end - adjust->vm_start);
 	} else if (vmg->__adjust_next_start) {
-		/*
-		 * In this case alone, the VMA we manipulate is vmg->middle, but
-		 * we ultimately return vmg->next.
-		 */
-		vma = vmg->middle;
 		adjust = vmg->next;
-		/* The NEGATIVE value by which we offset vmg->next->vm_start. */
-		adj_start = -(vmg->middle->vm_end - vmg->end);
+		pgoff = adjust->vm_pgoff - PHYS_PFN(adjust->vm_start - vmg->end);
+	} else {
+		return;
+	}
+
+	vma_set_range(adjust, vmg->end, adjust->vm_end, pgoff);
+}
+
+/*
+ * Actually perform the VMA merge operation.
+ *
+ * Returns 0 on success, or an error value on failure.
+ */
+static int commit_merge(struct vma_merge_struct *vmg)
+{
+	struct vm_area_struct *vma;
+	struct vma_prepare vp;
 
-		vma_iter_config(vmg->vmi, vmg->next->vm_start + adj_start,
-				vmg->next->vm_end);
+	if (vmg->__adjust_next_start) {
+		/* We manipulate middle and adjust next, which is the target. */
+		vma = vmg->middle;
+		vma_iter_config(vmg->vmi, vmg->end, vmg->next->vm_end);
 	} else {
 		vma = vmg->target;
-		adjust = NULL;
-		adj_start = 0;
-
 		 /* Note: vma iterator must be pointing to 'start'. */
 		vma_iter_config(vmg->vmi, vmg->start, vmg->end);
 	}
@@ -691,22 +689,22 @@ static struct vm_area_struct *commit_merge(struct vma_merge_struct *vmg)
 	init_multi_vma_prep(&vp, vma, vmg);
 
 	if (vma_iter_prealloc(vmg->vmi, vma))
-		return NULL;
+		return -ENOMEM;
 
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, vmg->start, vmg->end, adj_start);
+	/*
+	 * THP pages may need to do additional splits if we increase
+	 * middle->vm_start.
+	 */
+	vma_adjust_trans_huge(vma, vmg->start, vmg->end,
+			      vmg->__adjust_middle_start ? vmg->middle : NULL);
 	vma_set_range(vma, vmg->start, vmg->end, vmg->pgoff);
-
-	if (adj_start) {
-		adjust->vm_start += adj_start;
-		adjust->vm_pgoff += PHYS_PFN(adj_start);
-	}
-
+	vmg_adjust_set_range(vmg);
 	vma_iter_store(vmg->vmi, vmg->target);
 
 	vma_complete(&vp, vmg->vmi, vma->vm_mm);
 
-	return vmg->target;
+	return 0;
 }
 
 /* We can only remove VMAs when merging if they do not have a close hook. */
@@ -749,7 +747,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 {
 	struct vm_area_struct *middle = vmg->middle;
 	struct vm_area_struct *prev = vmg->prev;
-	struct vm_area_struct *next, *res;
+	struct vm_area_struct *next;
 	struct vm_area_struct *anon_dup = NULL;
 	unsigned long start = vmg->start;
 	unsigned long end = vmg->end;
@@ -900,12 +898,7 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 			vmg->end = next->vm_end;
 			vmg->pgoff = next->vm_pgoff - pglen;
 		} else {
-			/*
-			 * We shrink middle and expand next.
-			 *
-			 * IMPORTANT: This is the ONLY case where the final
-			 * merged VMA is NOT vmg->target, but rather vmg->next.
-			 */
+			/* We shrink middle and expand next. */
 			vmg->__adjust_next_start = true;
 			vmg->start = middle->vm_start;
 			vmg->end = start;
@@ -918,8 +911,10 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 	if (err)
 		goto abort;
 
-	res = commit_merge(vmg);
-	if (!res) {
+	err = commit_merge(vmg);
+	if (err) {
+		VM_WARN_ON(err != -ENOMEM);
+
 		if (anon_dup)
 			unlink_anon_vmas(anon_dup);
 
@@ -927,9 +922,9 @@ static __must_check struct vm_area_struct *vma_merge_existing_range(
 		return NULL;
 	}
 
-	khugepaged_enter_vma(res, vmg->flags);
+	khugepaged_enter_vma(vmg->target, vmg->flags);
 	vmg->state = VMA_MERGE_SUCCESS;
-	return res;
+	return vmg->target;
 
 abort:
 	vma_iter_set(vmg->vmi, start);
@@ -1092,7 +1087,7 @@ int vma_expand(struct vma_merge_struct *vmg)
 	if (remove_next)
 		vmg->__remove_next = true;
 
-	if (!commit_merge(vmg))
+	if (commit_merge(vmg))
 		goto nomem;
 
 	return 0;
@@ -1132,7 +1127,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
 
 	init_vma_prep(&vp, vma);
 	vma_prepare(&vp);
-	vma_adjust_trans_huge(vma, start, end, 0);
+	vma_adjust_trans_huge(vma, start, end, NULL);
 
 	vma_iter_clear(vmi);
 	vma_set_range(vma, start, end, pgoff);
diff --git a/tools/testing/vma/vma_internal.h b/tools/testing/vma/vma_internal.h
index 1eae23039854..bb273927af0f 100644
--- a/tools/testing/vma/vma_internal.h
+++ b/tools/testing/vma/vma_internal.h
@@ -796,12 +796,12 @@ static inline void vma_start_write(struct vm_area_struct *vma)
 static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 unsigned long start,
 					 unsigned long end,
-					 long adjust_next)
+					 struct vm_area_struct *next)
 {
 	(void)vma;
 	(void)start;
 	(void)end;
-	(void)adjust_next;
+	(void)next;
 }
 
 static inline void vma_iter_free(struct vma_iterator *vmi)
-- 
2.48.1

