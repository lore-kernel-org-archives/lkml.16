Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CBAD28D84E;
	Wed, 28 May 2025 16:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748450246; cv=fail; b=d0W26qzN0SKX5NZ1JAU3X7l9RAC18yB5Y0pRte268NP3XcXcen6jUehP413JvgEhtTX6TkUAu4kgBi+s4pR+zOPIvBbHMgU1K2+yTCuDkKHyRNijRrIC4+1yg0a97VQHFnoRz6SOPHwsdPbAxWx8xnZXycRg02gSJkyLuaOO7mE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748450246; c=relaxed/simple;
	bh=vCopkKifyqdcDAY/IhSHS3HEaeHOIqL94+WZaQcR3Jo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Xv6RYF52v49EMq6k4oSdDR9FDbGriwzUWtRQ0GDzNB1rTH3kI6n7kL9HtQmMvR0PHFD7Ke214YQSikWTWErwiZdtSixd2MOITuW6e2i5JKDAdqxspO82LdOpTgNTyWPMod5RnKUEsY+H3bbM02FkyNrUL3r91t7IpOP7kE5io6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Q83LbETL; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=CM/yn245; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Q83LbETL";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="CM/yn245"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SCqJlk024345;
	Wed, 28 May 2025 16:36:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Lfai0c9Ax9+GalVE4J
	8QJ5DnMG4BNVQFoXAqR6saybo=; b=Q83LbETLC4mBMFTw8HNRxbb/Tm2zenGDfW
	PL5lA+SglgU3Y3POFESeVyZbEbYwpa1jZjXQiGk29yU9vuBgCHxw2sGa2Bdu59C3
	P+BbomcNu4uG5Y0cUNwQ8vZs6YQcGfvVNkCoJp8WB6MLKR2rBG3p/p2ZJ/N7TTvB
	LiHLS3DwvYkz3PEgVxBVU5AwpZXO3fvyO0GiT/soR9LfnIvN/BQto3JmH+OwAlwM
	wdUK86gT8tggR4w5Yn33R3GeOnnnkgHJUrjZQgIKRJi1AlObJSPRFCnB3xQa3V1k
	0htmhU561qVWHMoTM9ShwKXhmnCJSXKHyyN3IIMGr8Mo9GdqX8fg==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46v46txdwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 16:36:55 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54SFJNI6035618;
	Wed, 28 May 2025 16:36:54 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2056.outbound.protection.outlook.com [40.107.100.56])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46u4jbmsh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 16:36:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xGD1qwGZ7JutYenHGw9SSjD5RZp+IXaAwFA/gbaqlf0VEaAL/eNfadC6uYlIJYWQu28v5XGTRMdc4jP1JzGpOiSfkdLtZI8QClh0LlDLnzP51zR3U8DEgt702fDfraVd/0FebhPewSwjrPq1U9AIfpVd0OiLM1/VPUbhVnWfNblvmMGH+MMG1LcFrWh1dV41eftiL9usL9nSXiB+2BLQajQb2OeTIklAv0+g82RJuGmT8NBOvfgS9qP9UnjxFvxhhMprRJuZS/BHW21H4ExBaZRqc60hpV+3OmKMtrCm9qWl50twR1V1FEIxVWZ03JDaAeRXnrkYHkMB7n2djlaMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lfai0c9Ax9+GalVE4J8QJ5DnMG4BNVQFoXAqR6saybo=;
 b=Tqi57XuN6xAVAawQ1YJJRtzBo/y2WNZZTaXaT3Z2LO9nKotvStX2jSx2wpDPcLC76Oj++zfSgx79KiYav+n5NCXKkRFY40+nZIccX4V7stgAomfT8NTpOZFh+TpIueWXzVbGVuTJfmYMUWLfQrQAFJdXEzfZ4ukC2wXBCsyFDzYjDFqPIDVWEcsRrBv4BSikLFQ2k1CKrnIRvhNGK9MOpBqN8vvtVyd+okuJVTrt5h6fCln4IFUwyj5sibtHkdWZ7nJHEib+nmLKjUP/Bon6QVarAOFxHX7c1HWs1oWsoXTllNf+N6EQ38V4tdGuDVWqYQWIYrFxayQi1mrVybKvEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lfai0c9Ax9+GalVE4J8QJ5DnMG4BNVQFoXAqR6saybo=;
 b=CM/yn245sVulzSJ2Mrhqq/ECFlNuUkiEvmPBiA5rQkI9Pk8DiL+QAiKFRgAcVpwgVaF2AAlr4kipBbuk8DBKIC3Ezmn2Tsv8iGUud32XdDbQtOKC4EVmeT7auH8eFIO2fp3Z1V0zXeC+69cliMbqd83fBU8+OIw/2Yi6rTPgeRQ=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA1PR10MB6097.namprd10.prod.outlook.com (2603:10b6:208:3ae::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 28 May
 2025 16:36:51 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8746.035; Wed, 28 May 2025
 16:36:50 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Ye Liu <ye.liu@linux.dev>, akpm@linux-foundation.org
Cc: linux-debuggers@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linux-toolchains@vger.kernel.org,
        osandov@osandov.com, paulmck@kernel.org, sweettea-kernel@dorminy.me,
        liuye@kylinos.cn, ye.liu@linux.dev, fweimer@redhat.com, sj@kernel.org
Subject: Re: [PATCH v4] tools/mm: Add script to display page state for a
 given PID and VADDR
In-Reply-To: <20250528091543.355386-1-ye.liu@linux.dev>
References: <20250528091543.355386-1-ye.liu@linux.dev>
Date: Wed, 28 May 2025 09:36:49 -0700
Message-ID: <87iklkadzy.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA1PR10MB6097:EE_
X-MS-Office365-Filtering-Correlation-Id: 25248369-6bf9-4360-32e4-08dd9e05d8b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3YX4x+5tyW4sZrgFcRLQV3wC+nxICfTj+cV55oSUHEfkvVkEDHG4Bri2ryXw?=
 =?us-ascii?Q?t6cVwwbT80sgzbJp7EJiXtO4SqaOms67+yDbxW0fcO+XTnVZVPq+0BFG1XWa?=
 =?us-ascii?Q?7VO1bhYj575I1IZO60rJMS6WdmKJxjB+ACC36duA4shjs4tNTeNg7ILrYUdu?=
 =?us-ascii?Q?fQ+hl7iB/AqLrQXb4gWBs77QBnu6A73NSVozQixE4aFNnzeUngrxXdaEcPln?=
 =?us-ascii?Q?xcGniS312mCSxrNd2FQiOjkKhHfCJHusWF+BadrvYLeD4FneHsPXVripqdv1?=
 =?us-ascii?Q?1vmpOO8TpmuJT65UZneVlX6qb5CEEiY9eSebdMywjsXWI/OL09pwNDTE2xjt?=
 =?us-ascii?Q?JyumLs2lQ7sF4E9SqKEz5UgB4Nq4tGxS/U8/nlqsrGY9GEGhKEdUSNC4x4UC?=
 =?us-ascii?Q?AOa/vdempMFrV1my1yziso0aL9skDhMu+Po2fLFWjdhx5x8680Z/pGxUijc7?=
 =?us-ascii?Q?x0o6si2fRzSSkfZmi5gkrdn0siKOMN5G/drQ6YDMv5bCvs0KyJxzRpppFQF+?=
 =?us-ascii?Q?noj/jeEeUg8A15bMasGUslqcML8dh5gk+hCzVFQB107jqZqKk4YA9Qv3UVPw?=
 =?us-ascii?Q?fTVNiK2TeaKB6ySsr5B1iNZxfc0omz4fyf0UUUoaztpVbeyazkHdSi4EyRis?=
 =?us-ascii?Q?eDAS5j5vdzUZTfqB8GFJanzmbPXSYtDFJ8N4E9SwFWpoCF4qQfR5fVxDv3XM?=
 =?us-ascii?Q?nNb0liF1chBIPb0i9Pn/uHoBjxLyWbuekquOWvAMblkvJ9c3ksx24O5Z2gF6?=
 =?us-ascii?Q?LrK4F73VK0bXn+EPDjaUkfnVJ9t36iFaTOY+c1yT71sgmvI/5HfZcewuSuf3?=
 =?us-ascii?Q?Lj7Fz2HWd1Oc/DJotiv5JRYJkqPoBjQhhufCBEJDHbpr+F9RZG3Q3XOAjhyR?=
 =?us-ascii?Q?8x/N4RlzCia05eMr3KGjtRX3QXVg/Lw48RMLRGrAGpLTX6+Jv/PTC3+Mhfsv?=
 =?us-ascii?Q?bwm9E5kVTWbNvV/zloSx2pF3P3FbOqMzMjl2yqDMdeaV2w+UYszGqsXyxVh8?=
 =?us-ascii?Q?eg2uxzsUIdQ533Qd1hfUUvGX+PtMJBXZ5nxatauilxBSt6TPOLDYErvEdQgL?=
 =?us-ascii?Q?cKQA7OSdQZUi+pab0QaEemA2OK9GXmf3+Nnt8e6lFesK6kAoUnzcUaP5diTq?=
 =?us-ascii?Q?zWTr0fbLZdw13Lm6ItPZ78mghReTep0a3KZbg8Zqm78V6SwkoLtVwMEoMWmJ?=
 =?us-ascii?Q?4QIAxzWB3oGsP1OZZ0/yoOETtuMv1hIF1v0npPpOkKrUwaGTpDpR0AqEpTpM?=
 =?us-ascii?Q?OXMgHYBU+n7646WiXtz0EDUOfYUh49I0HJEYcrl4XjJBQxvZzIA+fMS2/rr2?=
 =?us-ascii?Q?+WDoDuVn8Yqe9I5SP5ItQ6mEms36s0vBxm8FlbG4OOhZpzUwQa30ILf3Kc0F?=
 =?us-ascii?Q?LqKlRk0g72x22u9W9a0KPx2QvYprXTSFQP8Z/9v1rhIeWhixYwY9Dqyt9sQV?=
 =?us-ascii?Q?TVVXVqJo5usIUxDdOgbIbZVq+E7ZehnG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?afyiSr4kZE8Ite63+XjisAObNjJDD0kuyjiNOi9Zw+KC/Jndvbih2Cy2l67C?=
 =?us-ascii?Q?zC6kQoeOgkgWgvaVFb2u5ukdnSs007jvyx18h7JScEc2JZ0AIz1MLr2D+efu?=
 =?us-ascii?Q?XX1K8nYDbnemwGj8c/ZvJ3WqrlDOjfy0N1tck//fQezM0K8T3A2D572B+Mmj?=
 =?us-ascii?Q?HYALQYkGaRP4+T+y+uBTFJKB4ER5YeNkjm8XSzRmY9xbKESVHtLyPDjBizUK?=
 =?us-ascii?Q?t/+VewxfvAhLnpjincnZEGDbJ4pNcmKHAYrQ3+rhB1GxDDWH4MJlPYb6AY0g?=
 =?us-ascii?Q?vkGkQKOSpFLHqRsKuEiffeyYlMqAFE3i5juESH+7gRc4lj+GcVsMt1NLsLA1?=
 =?us-ascii?Q?TPGeIdYY1biXOeKjtbZ43SSqSRnLcak0oDMB6q36VLkftEzlpXVH6zhWHiAq?=
 =?us-ascii?Q?CqAWa9HpiDaDUTEQlJgYEzYrF35anlAblJkkcmRcTKvwqs+sS4R1to3E9Yja?=
 =?us-ascii?Q?IYoZh1xsxCGhcT/9jFc4X3pqEhnkMpOQquPSRyf9PKs3YEFrddi9yTTexSR/?=
 =?us-ascii?Q?qTFHqXmYoPH3Pp5NEEVpQ4Ng8UdBYq9VGnlgNcV8uvHto90JQOc95ydhgHf9?=
 =?us-ascii?Q?72zVLyLfDu/BIfOnXh539r2fUy/CPXgGkjxTHVhefZEHyZhirGpEfxPOLCWm?=
 =?us-ascii?Q?3kf5Dc7SpgmQAtox/FOx2I7fMji39jUYcIe4GPyzzBwH/Un/mANT5nMyUYfg?=
 =?us-ascii?Q?dVK0DHH+FcpmilPiAf6DYe9RwpFbjyd3ivx7ROkjpQIXIG8ItzHT/1eMTwaA?=
 =?us-ascii?Q?52mGAYJQNlA4p8rA8YsAsiXG/hEfK1buDbBPIqWf76GiTMFWg7r8YOnpEC+j?=
 =?us-ascii?Q?f7m5kX1iZFAQUZdeXAqnLylCtFQZDzWJ/PAflzawFGq3cO8GeocVuw2k/gC7?=
 =?us-ascii?Q?NrwDTC1ukOBlLpoweT6rlpxzANix1UEAVCUzRWYvqv/1NJkFQ8iEeaK3MBEt?=
 =?us-ascii?Q?oHgQRPnWOdvT/kR3YBvmmaT2yTH7pG+MhLk1rDHSc5yd3eHNavKAe8dhqoEZ?=
 =?us-ascii?Q?3aCpszM92e7ma4WZJahI37FwdrMubvGXp3yDg8OLh7ulWThk3f67TMPCGzF8?=
 =?us-ascii?Q?qlJSlbtSadcwZ1n8gLy+kvS9hpnCTRtsEwuyZBMfJO7AgJMIirxfeqS04IXY?=
 =?us-ascii?Q?ABwU3qBlTC7rSKebfGaSqXNiP4cHgBiuRh4ll1jPU5HjMPm9j1518hQd+GeW?=
 =?us-ascii?Q?Zkag7ofVHTJ/GHf+55lVVjE+5JMi3g9UbCNJNEM6j98pi4LwPwh8Gh7Q5y/A?=
 =?us-ascii?Q?Lxm/QvB+sZwHVUXEhC0CwtdKkuvPER4V8Vfv3yH+bsOxsRBZhaWfyGArrrbw?=
 =?us-ascii?Q?8juS5O/odRAUBPHUizG6jZsOkh8gLiFXBV2y+b+r0MguvTWs8gjiMpvEWKE9?=
 =?us-ascii?Q?NKNe6vji17j51EqI/EC3d6n0bjD/zR8RwV7ZNulPanc0uxcpG86Xw0iv/srw?=
 =?us-ascii?Q?wLTiozRelkIEXI6/m2Eg7knYRFCeLWjZBe15KHI03j+nosxdaSl18cMlIO38?=
 =?us-ascii?Q?xL5kQmkncdZZLMcXwSAwpzEt3ZJM7qH230MPBatTqsgZyd7kz03hGppVsFmU?=
 =?us-ascii?Q?HdLXReZ6I0FIPM4+2DJbWGlIhQzYjXr2b7iyVL8Srdbpe96gSUGe68RZopgT?=
 =?us-ascii?Q?NA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	W3+Mw4XMcX/uYsMFAfQkqysmaZNnunSlrCFEu9kjBO8lbnyriOR46odZM8UOeNYYL3INmso81hUg5t9Ev3PtWu1cTH63Z68pqDqJGq/Gksxv4mcfCzWebvTmM40eTT4oRoC78L6yHaVeX6ZLqnweSYmM4nIwdgPgn4okMYYh6rL9D/Qd2O/CVa9iWmqQ9OxsdQpcDJP/zdqDrqUOfTW6t/Vh3L6ZyUDGi73vfgV3YaxISXRcOUnypGT8/TMSGO7oiWCQlYVSQ2jfaryLjmeyEhEYqp9mNuPuxWX+7eNHIOkXEtDe8OwGRTciPMB2JMd/29mMliOu/KbZFnMTg+V8Mu10ED8sm921lf2anFcSx3THdpXxK5v6LAVWWzIIcO9PBd/VvVWy6zA/uFnSXOSJsO+4py/OUHQ3GIKejn/zfLGAWfrOxhHw4rVmBJRz/xz6unL8RPqojL5Jd5AqoSO2XgmuLu4aGe/sjLGlrzTA47/vYNMTJl4aMwbd/W3V/e5WQ6Ye3yLxKiybCXiFz7QbJVM4aPJ7lSEt0s2ggwsfOc4++bHxDTtj67ouFBATKubp70DWlz5or2ApnizRtJF9PCmPS9Up+wAn1pXjl5wKv4g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25248369-6bf9-4360-32e4-08dd9e05d8b2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 16:36:50.5971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a+WoRCXLUfMtvnKoKHkmzkri72eDmKFxVQ9O/8Ay8tN3CLpi59p7GREdTKLDs1pvxvrBmKSdC0ddVzGaQRVWNOfzBMhLNzll63RqME3c1Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6097
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_08,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505280145
X-Proofpoint-GUID: ti8LUW6ftGKDvxn1HFctZDaeYLbt9PKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE0NSBTYWx0ZWRfX23tbxkBnk3WU 5fKmhLc3Yk9/yOSGoE6SO5UBlppo+bcmdOttTLB+sd/97UAEj+BTk7QHi6xBMUOgihIEHovUgTI ClHqDLrPZ4Wh+VIelHQQ8eLot1fq4qC0hvcaokvWEb39l5vt1sApTCpres6A5TRwSuqSofvR7YQ
 P/6MoPl7RvblXV7Hi/g2oYMhk82cpyhK9W0OkoOB/pPpuM7tCzd8XjEPZJd0LEGGabxU4zZtRZz XtcLpRiv2nmb52wLoQYTFW8Qv5OLZpO0xJddY3lCTkLj6wgAK06zaaKdSqXqch7D7r1q7qLEOvj jU5gKp2vFgU7sDMRq/FtlwwoyHk4tVSJYIe4ftg+D80WKmw0nE+s+zGQKHZr+ZXi44kaTl+DqYN
 7s3ZmLlnRjWhQJh3VUWYQIhaLO6yTm+Cjef9U98A4HuYuyxDxspFEPMI2ZWFyGD77wqjHUKj
X-Authority-Analysis: v=2.4 cv=VskjA/2n c=1 sm=1 tr=0 ts=68373ba7 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=q21qj0CsJDf3oBTIheAA:9 a=dUo62Pl7dQeOs3m6:21
X-Proofpoint-ORIG-GUID: ti8LUW6ftGKDvxn1HFctZDaeYLbt9PKG

Hi Ye,

I just wanted to leave a code review related to the drgn/Python elements
of this patch. I'm no mm expert, and most of the things I'm flagging
here are small changes that I don't think are critical.

Ye Liu <ye.liu@linux.dev> writes:
> From: Ye Liu <liuye@kylinos.cn>
>
> Introduces a new drgn script, `show_page_info.py`, which allows users
> to analyze the state of a page given a process ID (PID) and a virtual
> address (VADDR). This can help kernel developers or debuggers easily
> inspect page-related information in a live kernel or vmcore.
>
> The script extracts information such as the page flags, mapping, and
> other metadata relevant to diagnosing memory issues.
>
> Output example:
> sudo ./show_page_info.py 1 0x7fb3eb1b2000
> PID: 1 Comm: systemd mm: 0xffff8d27279f9cc0
> Raw: 0017ffffc000416c fffff31105a61b08 fffff31105a63608 ffff8d27121326a8
> Raw: 0000000000000000 ffff8d271b9dcc40 0000002500000007 ffff8d2711f12700
> User Virtual Address: 0x7fb3eb1b2000
> Page Address:         0xfffff31106356a00
> Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
>                       PG_private|PG_reported|PG_has_hwpoisoned
> Page Size:            4096
> Page PFN:             0x18d5a8
> Page Physical:        0x18d5a8000
> Page Virtual:         0xffff8d274d5a8000
> Page Refcount:        37
> Page Mapcount:        7
> Page Index:           0x0
> Page Memcg Data:      0xffff8d2711f12700
> Memcg Name:           init.scope
> Memcg Path:           /sys/fs/cgroup/memory/init.scope
> Page Mapping:         0xffff8d27121326a8
> Page Anon/File:       File
> Page VMA:             0xffff8d26cac47600
> VMA Start:            0x7fb3eb1b2000
> VMA End:              0x7fb3eb1b6000
> This page is part of a compound page.
> This page is the head page of a compound page.
> Head Page:            0xfffff31106356a00
> Compound Order:       2
> Number of Pages:      4
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
>
> Changes in v4:
> - Add error and exception handling.
> - Adjust the way to obtain PAGE_SIZE.
> - Fix the acquisition of memcg.
> - Link to v3:https://lore.kernel.org/all/20250423014850.344501-1-ye.liu@linux.dev/
>
> Changes in v3:
> - Adjust display style.
> - Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/
>
> Changes in v2:
> - Move the show_page_info.py file to tools/mm.
> - Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
> ---
>  MAINTAINERS                |   5 ++
>  tools/mm/show_page_info.py | 152 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 157 insertions(+)
>  create mode 100755 tools/mm/show_page_info.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0cb9e55021cb..3cbd46bf1eab 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18726,6 +18726,11 @@ F:	Documentation/mm/page_table_check.rst
>  F:	include/linux/page_table_check.h
>  F:	mm/page_table_check.c
>  
> +PAGE STATE DEBUG SCRIPT
> +M:	Ye Liu <liuye@kylinos.cn>
> +S:	Maintained
> +F:	tools/mm/show_page_info.py
> +
>  PANASONIC LAPTOP ACPI EXTRAS DRIVER
>  M:	Kenneth Chan <kenneth.t.chan@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
> diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
> new file mode 100755
> index 000000000000..5c46501e24f4
> --- /dev/null
> +++ b/tools/mm/show_page_info.py
> @@ -0,0 +1,152 @@
> +#!/usr/bin/env drgn
> +# SPDX-License-Identifier: GPL-2.0-only
> +# Copyright (C) 2025 Ye Liu <liuye@kylinos.cn>
> +
> +import argparse
> +from drgn import Object, FaultError
> +from drgn.helpers.linux import find_task, follow_page, page_size
> +from drgn.helpers.linux.mm import (
> +    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_find,
> +    PageSlab, PageCompound, PageHead, PageTail, compound_head, compound_order, compound_nr
> +)
> +from drgn.helpers.linux.cgroup import cgroup_name, cgroup_path

Anything in "drgn.helpers.linux.*" can be imported from
"drgn.helpers.linux" instead, which would help if any helper moved
around from one module to another. I've recently started preferring
that, but I don't know if it's a huge improvement. EG:

from drgn.helpers.linux import (
    PageCompound, PageHead, PageSlab, PageTail, cgroup_name,
    cgroup_path, compound_head, compound_nr, compound_order,
    decode_page_flags, find_task, follow_page, page_size, page_to_pfn,
    page_to_phys, page_to_virt, vma_find,
)

Again, not sure it improves anything :)

> +DESC = """
> +This is a drgn script to show the page state.
> +For more info on drgn, visit https://github.com/osandov/drgn.
> +"""
> +
> +MEMCG_DATA_OBJEXTS = 1 << 0
> +MEMCG_DATA_KMEM = 1 << 1
> +__NR_MEMCG_DATA_FLAGS = 1 << 2

These are available as enums since commit 87944e2992bd2 ("mm: Introduce
page memcg flags"). So you can access them without redeclaring their
values like this:

prog.constant("MEMCG_DATA_OBJEXTS")

You can still save them as globals for efficiency.

> +def format_page_data(data):
> +    """Format raw page data into a readable hex dump."""
> +    try:
> +        chunks = [data[i:i+8] for i in range(0, len(data), 8)]
> +        hex_chunks = ["".join(f"{b:02x}" for b in chunk[::-1]) for chunk in chunks]
> +        lines = [" ".join(hex_chunks[i:i+4]) for i in range(0, len(hex_chunks), 4)]
> +        return "\n".join(f"Raw: {line}" for line in lines)
> +    except Exception as e:
> +        return f"Error formatting page data: {e}"

I'm thinking this would show big-endian addresses backwards, and on
32-bit architectures it would group the data into 8-byte words, when I
think it would probably be more valuable to show them in the native word
size.

You could resolve the endianness issue by using Program.read_word() to
read each individual word of memory in the correct byte order, and use
Program.platform.flags to distinguish a 32-bit architecture so that you
can compute each address. In fact, check print_annotated_memory() in
drgn which has very similar logic:

https://github.com/osandov/drgn/blob/main/drgn/helpers/common/memory.py

> +def get_memcg_info(page):
> +    """Retrieve memory cgroup information for a page."""
> +    try:
> +        memcg_data = page.memcg_data.value_()
> +        if memcg_data & MEMCG_DATA_OBJEXTS:
> +            slabobj_ext = Object(prog, "struct slabobj_ext *", address=memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1))

A slightly shorter and more idiomatic way to do it would be using the
cast() function:

slabobj_ext = cast("struct slabobj_ext *", memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1))

> +            memcg_value = slabobj_ext.objcg.memcg.value_()
> +        elif memcg_data & MEMCG_DATA_KMEM:
> +            objcg = Object(prog, "struct obj_cgroup *", address=memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1))
> +            memcg_value = objcg.memcg.value_()
> +        else:
> +            memcg_value = memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1)
> +
> +        if memcg_value == 0:
> +            return "none", "/sys/fs/cgroup/memory/"
> +
> +        memcg = Object(prog, "struct mem_cgroup *", address=memcg_value)
> +        cgrp = memcg.css.cgroup
> +        return cgroup_name(cgrp).decode(), f"/sys/fs/cgroup/memory{cgroup_path(cgrp).decode()}"
> +    except FaultError as e:
> +        return "unknown", f"Error retrieving memcg info: {e}"
> +    except Exception as e:
> +        return "unknown", f"Unexpected error: {e}"
> +
> +def show_page_state(page, addr, mm, pid, task):
> +    """Display detailed information about a page."""
> +    try:
> +        print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {hex(mm)}')
> +        try:
> +            print(format_page_data(prog.read(page.value_(), 64)))

Rather than hard-code the size of struct page, you can use sizeof(page).
And in fact, all drgn Objects have a .bytes_() that will just give you
the bytes of the object directly, which would even avoid the sizeof().

Though in this case, I'd argue for just passing the page into
format_page_data() and letting it use Program.read_word() to read each
word in the correct endianness, like I said above.

> +        except FaultError as e:
> +            print(f"Error reading page data: {e}")
> +
> +        fields = {
> +            "User Virtual Address": hex(addr),
> +            "Page Address": hex(page.value_()),
> +            "Page Flags": decode_page_flags(page),
> +            "Page Size": prog["PAGE_SIZE"].value_(),
> +            "Page PFN": hex(page_to_pfn(page).value_()),
> +            "Page Physical": hex(page_to_phys(page).value_()),
> +            "Page Virtual": hex(page_to_virt(page).value_()),
> +            "Page Refcount": page._refcount.counter.value_(),
> +            "Page Mapcount": page._mapcount.counter.value_(),
> +            "Page Index": hex(page.__folio_index.value_()),
> +            "Page Memcg Data": hex(page.memcg_data.value_()),
> +        }
> +
> +        memcg_name, memcg_path = get_memcg_info(page)
> +        fields["Memcg Name"] = memcg_name
> +        fields["Memcg Path"] = memcg_path
> +        fields["Page Mapping"] = hex(page.mapping.value_())
> +        fields["Page Anon/File"] = "Anon" if page.mapping.value_() & 0x1 else "File"
> +
> +        try:
> +            vma = vma_find(mm, addr)
> +            fields["Page VMA"] = hex(vma.value_())
> +            fields["VMA Start"] = hex(vma.vm_start.value_())
> +            fields["VMA End"] = hex(vma.vm_end.value_())
> +        except FaultError as e:
> +            fields["Page VMA"] = "Unavailable"
> +            fields["VMA Start"] = "Unavailable"
> +            fields["VMA End"] = "Unavailable"
> +            print(f"Error retrieving VMA information: {e}")
> +
> +        # Calculate the maximum field name length for alignment
> +        max_field_len = max(len(field) for field in fields)
> +
> +        # Print aligned fields
> +        for field, value in fields.items():
> +            print(f"{field}:".ljust(max_field_len + 2) + f"{value}")
> +
> +        # Additional information about the page
> +        if PageSlab(page):
> +            print("This page belongs to the slab allocator.")
> +
> +        if PageCompound(page):
> +            print("This page is part of a compound page.")
> +            if PageHead(page):
> +                print("This page is the head page of a compound page.")
> +            if PageTail(page):
> +                print("This page is the tail page of a compound page.")
> +            print(f"{'Head Page:'.ljust(max_field_len + 2)}{hex(compound_head(page).value_())}")
> +            print(f"{'Compound Order:'.ljust(max_field_len + 2)}{compound_order(page).value_()}")
> +            print(f"{'Number of Pages:'.ljust(max_field_len + 2)}{compound_nr(page).value_()}")
> +        else:
> +            print("This page is not part of a compound page.")
> +    except FaultError as e:
> +        print(f"Error accessing page state: {e}")
> +    except Exception as e:
> +        print(f"Unexpected error: {e}")
> +
> +def main():
> +    """Main function to parse arguments and display page state."""
> +    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
> +    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
> +    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
> +    args = parser.parse_args()
> +
> +    try:
> +        vaddr = int(args.vaddr, 16)
> +    except ValueError:
> +        print(f"Error: Invalid virtual address format: {args.vaddr}")
> +        return

I find it quite useful to replace things like this with:

    sys.exit(f"Error: Invalid virtual address format: {args.vaddr}")

Which will result in the script exiting with a non-zero exit code, and
it will print the message to stderr, rather than stdout. All while being
one line shorter, for the code golfers :)

The actual logic looks excellent, and most of my suggestions are just
that: suggestions. Sorry for putting this review on v4, I should have
sat down and done this sooner.

Regards,
Stephen

> +    try:
> +        task = find_task(args.pid)
> +        mm = task.mm
> +        page = follow_page(mm, vaddr)
> +
> +        if page:
> +            show_page_state(page, vaddr, mm, args.pid, task)
> +        else:
> +            print(f"Address {hex(vaddr)} is not mapped.")
> +    except FaultError as e:
> +        print(f"Error accessing task or memory: {e}")
> +    except Exception as e:
> +        print(f"Unexpected error: {e}")
> +
> +if __name__ == "__main__":
> +    main()
> -- 
> 2.25.1
