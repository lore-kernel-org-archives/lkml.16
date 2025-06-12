Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94C629B8C3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749748735; cv=fail; b=pDn0AciKdApkExw8J3tkCgE6ws6H1NQdH3IKUbcqy76VN6w7klKctpzQW7jQPjRgxnXsVw2r7bsVdIUOKs3d51pkz0PUIoToM5dpUE6Lzo+OSNWPB7PaUYQE+8d8iItYGbtwIEruUvUDjsBRoXBFCQJWm7xqSpQ/ZIkmlc1k6wo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749748735; c=relaxed/simple;
	bh=K0Xir47WiiCWddzJwfQx9FKndGhGDJWu3ArBGzbvcgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rhEmRpBZY8ikai9+yaISNAYvNDrxdMy8XgmKHXmwmbVF4jX70TPd6dGXUjgV52yVU3XPddGlxb83/qrpaXsWIrsKU6uUrPpn/gQzF5J7llEwHlL90P5LMPglCJJWWzPSWZrT2xstkZsL5XzHUbgkZbIZuJDkVHFXybOJcH63/Bk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z1gkYXd8; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=HSvIMhDd; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z1gkYXd8";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="HSvIMhDd"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CEtjmf000477;
	Thu, 12 Jun 2025 17:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=MSQw0hM3sIh+JM1h1h
	f3Aqs3T/XKKGxG4Zh/6h0F6GM=; b=Z1gkYXd87+1nDx6IkdiQeo6v1tvQQxjW8U
	IA72nU3uHLSPgbn9JO2TEG2f/VOT9LdfL80YEvjtgpqZK/UhCsKVI/i3v1wnIMSM
	Skwm/P/x+wOR31w4xH6+0aMigbqdckbuz943NeEZhCTxYN+rIHTzREOmhSxRCoHO
	C6A2mwk0KsQgnSE9sL3xe+cigDGDZf+jNOXb860EmEK6rOGscftPUzLHdTA1j3ZI
	WZOr4ZPRoVAcZvfQnjIF78Q/mSM/mz2e7ojIf0uGqHcCinVgPXzFxyvTyNrydFvW
	aYomgr2VnVRIovu9ct5NJbG+XoK1TeCaYvj3KHjNvhPqFS6VuXXw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 474d1va7a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:17:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55CHGMSr037859;
	Thu, 12 Jun 2025 17:17:50 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 474bvj401v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:17:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wdej8dk6vqslqWD9iJozotTw43FUT6R3KmkPJ6mCrMHKcnMVaXrqWo9T9oPET86L4UJVXDEjqKuR7R+nCHFwigVLf/114wtJae/ZUlxZD39ND+XysBzZcn4m7lQW6eM6CeS+PzARObBWsS0qmctiDXIAOFkyaGvDEEDVyDG3opx0ivTOQ9r3im334S0CIFtXVE9ysrj8WfZK7pM/2rYAYdXqBUuysoyHIj1hxk+6vIUUAWijpYEndJpyKakZg5JisEX0YRLauAdPszumCGvhZZgufHLCUwUAUh1laTWmnugcTTOmPoDMm9n/D3GnljvJRJ1GKQZUd40iV20SxxUh3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSQw0hM3sIh+JM1h1hf3Aqs3T/XKKGxG4Zh/6h0F6GM=;
 b=SjW5MgktvN4/gEIzgP90UVd6hAIFwQC1NU/dzt+hupqIBL1PXm79D1SaVAwxiv9F+uiUgDWhDA0YeO/zc8Wa+Laca1GC1BV8j0nVQF5heOswUQXx/T2Z1CPARcXSehFa+aM9HlOi0WR/2w7phOCn2EpwFGLYDE6Ejeae87J0rK5qWafOa9gCpnxxS3lzLW+tWkn5NJ1jPnm8KKPucUljAiciyfdFuIW1/1IYUNBqxoATfbp5xQFsYoM2h4JNTnV3BZPD5x6sjmW8MvmU3L/M49KNVOZzUWYj8K8JXe1MG92K7MJ2JLWeWjKP7Kg9qVjBNggbXSJB81FzsoeClOKxSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSQw0hM3sIh+JM1h1hf3Aqs3T/XKKGxG4Zh/6h0F6GM=;
 b=HSvIMhDdC2qEXVi5jPbA2kfyp43/k+Dfibp9d+rW2C18uX1OOFNo5UQ4xQm9PHfcnqq5oDkOLdVa14q/PnPJigWBL4skCq5psU+CH1P22uO8zfVfNbA7y9Vm+D5EARv0RPB6L4lFfJLh3L6aHylM48JuUFeM7vVA6xzW71/gVvE=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by BL3PR10MB6234.namprd10.prod.outlook.com (2603:10b6:208:38d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Thu, 12 Jun
 2025 17:17:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 17:17:47 +0000
Date: Thu, 12 Jun 2025 18:17:45 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>, David Hildenbrand <david@redhat.com>,
        Rik van Riel <riel@surriel.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH v1] mm: Remove arch_flush_tlb_batched_pending() arch
 helper
Message-ID: <a1a5c621-fbfa-4796-b424-c6cfb2267ed7@lucifer.local>
References: <20250609103132.447370-1-ryan.roberts@arm.com>
 <48375ad8-7461-446e-9002-8d326fba137b@lucifer.local>
 <b86971db-c326-46df-9553-d89cf5609a75@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b86971db-c326-46df-9553-d89cf5609a75@arm.com>
X-ClientProxiedBy: LO2P265CA0116.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:c::32) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|BL3PR10MB6234:EE_
X-MS-Office365-Filtering-Correlation-Id: 85660079-32d7-4411-d18c-08dda9d50d83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8SgVxcfzqCFCgVtF1qozKBSc1LKGw6+k5MZKlQ9LhEp+N4J/A2uzxG3NJPfu?=
 =?us-ascii?Q?AlmkouYuch6FpQ6cMg/BTvnTKrpmy4zuMqFp4Pg7Vj8gSFN9j0LWd0Kue6vT?=
 =?us-ascii?Q?MBZ0mR6JvgbVxRcgsCsvezUvY2VlYA01ajmURViz98P2C+c29Rp8vUFwgHx4?=
 =?us-ascii?Q?3x3Varw62eCrDCSdxstjbbqxC5qGQOIRIaaGzc3zXt4I10TM6SBmG2aUlZHC?=
 =?us-ascii?Q?UaGgi3vyQd5XxmyPzJVxcPGiJ+JLNoj/Bi5M4TZX+Iy9EatmzzTKigyPikel?=
 =?us-ascii?Q?ElKTAUqpv6iIUtXmmEnvo1YSzbSduOGBLlColT93fjQg8Ucmy3IwdDVe+xox?=
 =?us-ascii?Q?pwhb8iyNT9v+SqOaGEvaZ3fb7eGDHvHQQdux/xTmHO1bU3tePsdBfP71nNz6?=
 =?us-ascii?Q?YBwYa5Wk+RtxVSk9CUBYfFVf0rh4ulRperw6mPmRVBybAyf36NcvGHFHlVTU?=
 =?us-ascii?Q?v5FEb4QogflOQaLtHI57Zj3tK593mx4lafpRxNzhswSrSxNHeByJk+92Aq7c?=
 =?us-ascii?Q?4oDnUFcufZT5Q0HUGkv7p+R7SIMwqO9gwPPiKUKd9p88r1GydxomXuMYCGZG?=
 =?us-ascii?Q?2uCwrrhC72mFygPUuEknQJO1BclVN9ZmibdOvwedvxBJRdZ2zybDxRUStzSL?=
 =?us-ascii?Q?WGiTDvhYEzJ42vLVa0PcypHrgHqrvpFMp6pxycNDtO2BvFHmCBotkjg6Xj6l?=
 =?us-ascii?Q?ENlnE5ChPgCuoMDQZjqqxGHWeOccLYJOpt33qrVE7pU0dhEU2eD15XfZyEqB?=
 =?us-ascii?Q?hH2WJ0qjzH16aREUjacqn8XsILqNXiuQs7aAKuGOB/9xQAanRuCslmFpPP/Z?=
 =?us-ascii?Q?YV34L261UxzBycL6FTd/VjdLRauHVIC5IRcFaT2RQfLPPUpqOoL4/Y2aAM2a?=
 =?us-ascii?Q?oPMJUE6OZem5XEiVuNepEO/yqNDVVUlbCnuVLOUL7+Qsh0mo8AM8IEfyuKY/?=
 =?us-ascii?Q?xkfjDaxfOI4/xQy++183Qhl5s31552igPn4WD9tbKQa9i01SpDlF3VDK6j/V?=
 =?us-ascii?Q?+m9GSL5mnBamlmIQVM0vhKKEnX8zCOPiqYAZyZPIt+lonAwJj49cd6jsfJPI?=
 =?us-ascii?Q?IUN3CjrEb7vO7d4NII8FYheNn5lej7lBTmD0nSYkwrvb2noQSP/3TrB/HCuH?=
 =?us-ascii?Q?uCU2nkYv5dSBq/U5goXx5GpVtTjIOYYSQ03/7nq3avpSeSxffizxLv6RvgUy?=
 =?us-ascii?Q?2o2MT1MRmMQoaTxH9N+6wVaApShO6cr4264Eqyzc1/tphPm6GXtpVdiXCq4m?=
 =?us-ascii?Q?JA98ttYjhRZotcTIN88as1RqJ2WLd31WG6TR1SxnWwDDc0oup4ykxqEEJYyc?=
 =?us-ascii?Q?uS1/svWrQx3VtF5fn8VbtP94RzJQQEbvVahap398P9EDW9mE2nRx5S4YSiUR?=
 =?us-ascii?Q?jm61BgKlHO1VQ4Vhm0Zea7wKvCzRiFtvLFjZ6+CacbrM2mV+sOEU+YgQvU+T?=
 =?us-ascii?Q?LLt6h5ycM1g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phKaKVUHPHqJBpPUC+7Q5s4BBNIwY8Y8tyGkM7HFprYF+JOnqoJj2FWFuF0K?=
 =?us-ascii?Q?G27GGi22WuaZaY5HgfCtlWSarqpqw4/YKRMyzhC+VP7MQkd5wUYtZq/qJ8g+?=
 =?us-ascii?Q?SKNDamJXYIT6OTG2nVG7UG61kGrsrD+vr2nyqm2QgaZ9IFJfVvtjAlhkab61?=
 =?us-ascii?Q?idAbAEedD16wjh6Qc9LUj/iYFMSevN3uv0LQ6JbVVevwh/F6f4eRM3JGZGuU?=
 =?us-ascii?Q?8O6mZB11kU4ysw+huiB2h3H6aqDk16g5ZFFVoWarHFavv5JV6bQ0eycxtUVn?=
 =?us-ascii?Q?NDa8yESGjZWU/q2bgxr0Olv/aBh741cfmqprCHbVMcNZyJTg0ypUvkXALHtg?=
 =?us-ascii?Q?Dwwxta+RPCvKljD408/Ma+a1hGpwDjWKKTDr7mzxhk5zrNYYqNDlUcPaIo0w?=
 =?us-ascii?Q?vaduoCFPCsN1WLeY2WTIYAsO8lk+ILC7nz9Ssra3R5pHZnX0xq0F9Wij7lI9?=
 =?us-ascii?Q?jEoVQYFQe5i038m8mO4z5K0wwz103uhbSnfR1o7di+Aw6X2H613jea18HXC/?=
 =?us-ascii?Q?qdPKXXWwKNLuyA1YQ1eKC295KF2KBzwVeD1RSwS9gnC9WKD3N9l8UHp81Xji?=
 =?us-ascii?Q?rtB9owhpi+C5ohRdtD1P7aRUlyH4VrFiVBhjyEx38k18/rHp5/X2ps2keCRG?=
 =?us-ascii?Q?Ca29FhHPhWLALU93rR6YBrLF5H11CPVfTuNl92YPRLuLkIiDJR10Z5e0I8Jg?=
 =?us-ascii?Q?x26NoU5yMlMZPLLQDojxxTlCF4RjUHNvBycpuJP2dR7aJNLLf5Z19I2A7W7W?=
 =?us-ascii?Q?Pq72j1AhKNnGVc9MkoU3+tv612yZHO0GWRfJz63Z27uoU7URTk8OL6VZiHkt?=
 =?us-ascii?Q?lzeaC1Y+IqtwfpRT5Cd/3d/ldc7HMFnwPJ31gNTol2RMc9obv+YFMk1lDK91?=
 =?us-ascii?Q?eDB7liWkqixngkah+BE78e+k+kVrc9mwFzfE89Jj/Ur4HFNDJP3iqpU9EX/D?=
 =?us-ascii?Q?KSF9llnWmoATv/Pzk5TlVS9LBIO4vFAimDH/huoLezSSfOjw6ouW8v+Lin2I?=
 =?us-ascii?Q?VIoYXGnhvVChE8wMAxDcOgGKMIysNilSfgLZaTO+Uc8+tNxDE8Q0WBQXa+Un?=
 =?us-ascii?Q?O2jrKcdaX8geKVnA1p0Dh/A+tI4HNzwyRMpx3AuFo/IOnlCELkbd03oIwTio?=
 =?us-ascii?Q?bvvDMY60kTyq9EFkCK5S/LBMJwBWU/D3om2mvLfKUqrKAPXH5j202BQwpoqc?=
 =?us-ascii?Q?ZrLmvmOlCNRyrv+S1sSRRVwK8ShdwDKWgYsXSAC4f1cqAd6D1VX5pmh4ctcZ?=
 =?us-ascii?Q?Cq+1xHRqlxJxHi8vuyQ8zdxMsouKxThdNG34136QUI4XLn4KkUyfrVcUS8mf?=
 =?us-ascii?Q?ea9PZx5NXeXOHYu6Luu0D4Kei1NaWUCQfF8V9Yred6k18bVEXIKHmJi/hHU+?=
 =?us-ascii?Q?RsC1V4/olLzAcVAG0DrpZXMlr4WoDRkOG95LbonzOojBdkcdh8CzjIt0CQh8?=
 =?us-ascii?Q?AsBelmoJW0tURro+Zo0MpR2F+FsGe2IM1obtOIgSdyIa3FSjdkO5ow3GJ1x6?=
 =?us-ascii?Q?dpdsvHNPwZvueoi18+aNCsV4l2Xpycwvc5lv4WSusxJdtLD2DO+QXUg3gjBG?=
 =?us-ascii?Q?7Co0OFR9xdlHfBVXuvLsHTsmB7/aP8jzwZySkE+4q6DboYvDguzSYgw5Gz0K?=
 =?us-ascii?Q?5g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XnuSlUw55Li8s8aC/h9D0lAAgoZvvq4JxfZWebaRB+Y11ieY8G1Kd07qVrQ3iRFAsksRWnZdGR2mMKMRIUmroD/cQOfTm5UoPbFWEEuij5ghs7PwfGlWuLY3AWoj3nqhznzckkL+M3PW3oPYqpHNGz5kwPFp/1/GKQ4vsbpkTHmYRAVsmXNhdx0yEvPSmgsv6t3PfGfnY/pUNu1/QHIHXKrsGKFYZjWoQfm48afI9CbwNxIcMKGuLU85PprjRbKDdI76LVkrRlknsvitecZTXfFeTf01SQh1BDVkKN9ebSQO6VoazWsdqGmv0D8JY4ancjNwb9GYit3maa5D90xs4pfICIGQiyhrtkA598F5Esup+sirCF1Sv8jXe6+JuptT6e/ZkMUNzELEVEfgiKtMLJJVp7LM7twCG+hFXTgtB0zx25SKxWMbKULRNUxCcPDHc2KAh2yNVEmlLkfFg5nsy3P4ZVMZdhvq2f2IQoFMAe+W2hQsN46KVR5ORemaPLS4Q8LhxRlW917A5b5mrsLdvRQHG4raW1koEfqTK/3Ul7V5PYhPvnTQgkjBvql9Um6EFjQcN+L48pXu4ZHNruIuIdlXyS0zSEJdx2Le3Bov5Us=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85660079-32d7-4411-d18c-08dda9d50d83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 17:17:47.7675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sKNKoDonfnUhGgNt+Bd9PSyCzCfMkZPiKmLLXAByRh1SPnVrCd9n06SJA52KZdsiuHdIIA75U4QBn8+IR34lkso0GDKOw4A8a+a3duPlGxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6234
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506120132
X-Proofpoint-GUID: VY3IKhBjlQYbpSgbyVWuJeHbJ72iK1JJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX7PBUlWrDPvw8 REt1B6I6CJbzUVRb5+0a7AIGIehcO2oRQ/SQJIhViMy5QNS031u9CvtBcF/4tV2irod4CiGN5cr YroD9pzaUtXsDLSxLWfWz7LMlKurnljO+0NQxUjzX1WKlvgoatxjFo9yfKHAByM+kcx8aMqyLiQ
 YuHeXNEqlIXq7pMsF1XMaY6QvNKwDhbAuq9o8ITC2HqAaUPOfPXctZn7dlPXm0n7iqMMdaJdvTV kFkzPAvSTwRbk4txPfPizgGcCP2b5OCg/4Ix3woThhXcbbuL9OeX+BYWbzFB86o7XMC2v7qKPgB NAl0+09+A8C08ezlPNEemgJnYJ6SaIbN6nyAnlOc7TJUEyzlg90tX1oK7nxxRqSxaj7Nq+iNkjK
 43Yr++DJt0mRHrqgcjdHiHCDTN9PwzJOkqKyE2XyMSYKBA1p4bsQ1k+/CxvhjlrjQ3exGnkv
X-Proofpoint-ORIG-GUID: VY3IKhBjlQYbpSgbyVWuJeHbJ72iK1JJ
X-Authority-Analysis: v=2.4 cv=d731yQjE c=1 sm=1 tr=0 ts=684b0bbf b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=yPCof4ZbAAAA:8 a=L7yiDD2y9TzR1MUcP90A:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22 cc=ntf awl=host:13207

On Mon, Jun 09, 2025 at 12:01:28PM +0100, Ryan Roberts wrote:
> On 09/06/2025 11:45, Lorenzo Stoakes wrote:
> > On Mon, Jun 09, 2025 at 11:31:30AM +0100, Ryan Roberts wrote:
> >> Since commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> >> TLB entry remains valid"), all arches that use tlbbatch for reclaim
> >> (arm64, riscv, x86) implement arch_flush_tlb_batched_pending() with a
> >> flush_tlb_mm().
> >>
> >> So let's simplify by removing the unnecessary abstraction and doing the
> >> flush_tlb_mm() directly in flush_tlb_batched_pending(). This effectively
> >> reverts commit db6c1f6f236d ("mm/tlbbatch: introduce
> >> arch_flush_tlb_batched_pending()").
> >>
> >> Suggested-by: Will Deacon <will@kernel.org>
> >> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> >
> > Thanks, love to see an arch_*() helper go :)
> >
> > Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>
> Thanks!
>
> >
> > Couple points below.
> >
> >> ---
> >>  arch/arm64/include/asm/tlbflush.h | 11 -----------
> >>  arch/riscv/include/asm/tlbflush.h |  1 -
> >>  arch/riscv/mm/tlbflush.c          |  5 -----
> >>  arch/x86/include/asm/tlbflush.h   |  5 -----
> >>  mm/rmap.c                         |  2 +-
> >>  5 files changed, 1 insertion(+), 23 deletions(-)
> >>
> >> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
> >> index aa9efee17277..18a5dc0c9a54 100644
> >> --- a/arch/arm64/include/asm/tlbflush.h
> >> +++ b/arch/arm64/include/asm/tlbflush.h
> >> @@ -322,17 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> >>  	return true;
> >>  }
> >>
> >> -/*
> >> - * If mprotect/munmap/etc occurs during TLB batched flushing, we need to ensure
> >> - * all the previously issued TLBIs targeting mm have completed. But since we
> >> - * can be executing on a remote CPU, a DSB cannot guarantee this like it can
> >> - * for arch_tlbbatch_flush(). Our only option is to flush the entire mm.
> >> - */
> >
> > Hm are we losing information here? I guess it's hard to know whewre to put
> > this though.
>
> The generic version of this comment exists above flush_tlb_batched_pending() in
> rmap.c.
>
> For the arm64-specific description of why we need to flush the whole mm, that's
> captured in Commit 4b634918384c ("arm64/mm: Close theoretical race where stale
> TLB entry remains valid"), although I accept that may not be the first place
> someone looks.
>
> I don't think we should be defining arch_ helpers just to provide a hook for
> some arch-specific comments though.

Yeah completely agree.

>
> >
> >> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> >> -{
> >> -	flush_tlb_mm(mm);
> >> -}
> >> -
> >>  /*
> >>   * To support TLB batched flush for multiple pages unmapping, we only send
> >>   * the TLBI for each page in arch_tlbbatch_add_pending() and wait for the
> >> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> >> index 1a20dd746a49..eed0abc40514 100644
> >> --- a/arch/riscv/include/asm/tlbflush.h
> >> +++ b/arch/riscv/include/asm/tlbflush.h
> >> @@ -63,7 +63,6 @@ void flush_pud_tlb_range(struct vm_area_struct *vma, unsigned long start,
> >>  bool arch_tlbbatch_should_defer(struct mm_struct *mm);
> >>  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> >>  		struct mm_struct *mm, unsigned long start, unsigned long end);
> >> -void arch_flush_tlb_batched_pending(struct mm_struct *mm);
> >>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
> >>
> >>  extern unsigned long tlb_flush_all_threshold;
> >> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> >> index e737ba7949b1..8404530ec00f 100644
> >> --- a/arch/riscv/mm/tlbflush.c
> >> +++ b/arch/riscv/mm/tlbflush.c
> >> @@ -234,11 +234,6 @@ void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
> >>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
> >>  }
> >>
> >> -void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> >> -{
> >> -	flush_tlb_mm(mm);
> >> -}
> >> -
> >>  void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
> >>  {
> >>  	__flush_tlb_range(NULL, &batch->cpumask,
> >> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> >> index e9b81876ebe4..00daedfefc1b 100644
> >> --- a/arch/x86/include/asm/tlbflush.h
> >> +++ b/arch/x86/include/asm/tlbflush.h
> >> @@ -356,11 +356,6 @@ static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *b
> >>  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, 0, -1UL);
> >>  }
> >>
> >> -static inline void arch_flush_tlb_batched_pending(struct mm_struct *mm)
> >> -{
> >> -	flush_tlb_mm(mm);
> >> -}
> >> -
> >>  extern void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
> >>
> >>  static inline bool pte_flags_need_flush(unsigned long oldflags,
> >> diff --git a/mm/rmap.c b/mm/rmap.c
> >> index fb63d9256f09..fd160ddaa980 100644
> >> --- a/mm/rmap.c
> >> +++ b/mm/rmap.c
> >> @@ -746,7 +746,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
> >>  	int flushed = batch >> TLB_FLUSH_BATCH_FLUSHED_SHIFT;
> >>
> >>  	if (pending != flushed) {
> >> -		arch_flush_tlb_batched_pending(mm);
> >> +		flush_tlb_mm(mm);
> >
> > I see that CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH is only implemented in
> > riscv (if !nommu), x86, arm64, and therefore we are only going to invoke
> > this for those arches which previously did the same anyway, so this is
> > safe.
>
> It's also the way it used to be done before arm64 joined the party and thought
> it could optimize by just issuing a DSB. I since discoved that the DSB approach
> is buggy so arm64 has now fallen back to flush_tlb_mm() so the reason for the
> original introduction of arch_flush_tlb_batched_pending() has gone.

Ack thanks for the background!

>
> Thanks,
> Ryan
>
> >
> > Kinda wish we could avoid this ugly #ifdef #else #endif pattern here in
> > mm/rmap.c but probably necessary in this case.
> >
> >>  		/*
> >>  		 * If the new TLB flushing is pending during flushing, leave
> >>  		 * mm->tlb_flush_batched as is, to avoid losing flushing.
> >> --
> >> 2.43.0
> >>
>
