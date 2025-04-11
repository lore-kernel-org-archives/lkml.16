Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1215835946
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377099; cv=fail; b=c14BDO6oN4loGnGvFRPEhg8ZLjDhvuCEvVxMLTbryWWkDU7F270qf/NOWSRJXPEfbWco+y+mW7xWsQxLJ1Vcsn6ZdwKSPUtHcx1ZrwQS7juZNKo5X3XwfMagw7PiRnNVRh5WqIWD1QHJnSMbSAWLT5NGzVbxDMpVQJcNA8Yne3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377099; c=relaxed/simple;
	bh=RyPKq301bE/K41osCvx2o36/wTz/SpQY6e1DlaRnGbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kc4wvR1gdHeoS3EnovnfkyhvrD+Gv0G40xiJ7VmSRsOA0VdytKL027CH78BRILaUx3a6SUKjcO6j1EuVz5rYPILFTwnyeEi2xV5o07r5DJ9xny5FU7CcLvaSNLvqwVusvk5JTCEq0i3ycRNnyJgw/o1tFijZTc50FCTBa7Ek4R0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=YICYJP4a; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=MGpAqeIl; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="YICYJP4a";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="MGpAqeIl"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53BD8obK025747;
	Fri, 11 Apr 2025 13:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=ehc9YDAdeEMp06U3+D
	7RXfCqZBtL//msjCqN2DGOOfI=; b=YICYJP4aBQje1UKwpdaA2vr6xWQm0edySR
	qaBVi2PkBr6hqWwtm3gSBLGHc0CvsBECuFcIHu3T2wvw0m1l0b85tnQlP+1foL0h
	3A1DXBeRThe93oOa+d6BjFaSKf4RM1avwzTkfHmH4DGxqWC8QlO+q5sS8enSFAsF
	tHrq8VpX6uaVwYdrxdtbRzVnSnt9LRYX9RcGSpx1kAe3xMZphx0DU/a4wAwDVvg2
	Of+EVP93PX0nTpJ/1UELnlQqG3MEutEHlI2ntb6LaFdV0E68/UGyxX7eLGBVZGW8
	5PYB8xVqALDZgEPn/yDEL+J1O/uB7JEHg1cWrBGv0CFTzqi90pdw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45y3hjg128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:10:54 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53BCHVuw013772;
	Fri, 11 Apr 2025 13:10:52 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazlp17012032.outbound.protection.outlook.com [40.93.1.32])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45ttym1ckn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Apr 2025 13:10:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dnq6G/xbfbrnIVjWsEYp/O07X36VtAxCCpmZGB73fABcnxyLNIszTfrg2Q4BaTWCgaNxL3vzgunSbYuZ7F2Aax54wXGKc+DE97785VnO4A3RbDnCLB4LCnAXJQ1nAZZABD0GPH8Jo+8NWZ2P9HyZX0+yUfvQLiYhFsMKvVy4UjQ6zA0WyT/UGmMnjvB+gZcl9A+Z9uFM2dlHKB68BcwxxwEfuhR18DpS8Sqh6yL5oPqAmj8gtZxTCQzswQ31jS4FbdLajpGwRtiwW3CJiT3ZZVIRRpDyAa2z+KKOOlTDAIp6xDLAsWxC76HQWohPEkln92h4dZoaE/MBKI1lQa5slQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehc9YDAdeEMp06U3+D7RXfCqZBtL//msjCqN2DGOOfI=;
 b=m2GRaLgYiwQsLrQGEYXmOFxxVSKR4P5QgdHJCt8yfhmwg5Denm7Xv7PsO3H7s68rpukOcS/KynJ5b4EIwaCrw5eWTo/dHRNfd/yOzFOYIYTuhlMDp/CTKnLa1zq6kjf1TpLmdE6R88DW+DxY0w85A9ULeIZoXKHfbYk0MQxZkeqYAtue3wgyLB7Ko4/98qxh6JvreMz8OFL8GEFIj1agN+OGpMeGlcdVUSia97g1KAJhB8KeAu2bmi2I89tv/18xnnquJZRT4MheM39MThb2G9Yi/lT+/CGF7MzGquEI1hXM0hzadt0E3zU71PsUC0U6PV3uVXp5aDkrS9XLdO8Ezg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehc9YDAdeEMp06U3+D7RXfCqZBtL//msjCqN2DGOOfI=;
 b=MGpAqeIl8gqIx8PcWdVRRgCAD0BdgFWracgjwo9re9wQkzmj4x7475WAIbpmq55KWq92exvbInho+xSae52pRd/ANbJRhXekuxYnS5tpbvcsRf/GHcrz9xKtqX/14knEqmbJHlZujX6OKN3hvDZv4DniP3J3VpjVaHHw4CktAeg=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by DM3PPF2E1953992.namprd10.prod.outlook.com (2603:10b6:f:fc00::c15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.24; Fri, 11 Apr
 2025 13:10:50 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%4]) with mapi id 15.20.8632.017; Fri, 11 Apr 2025
 13:10:50 +0000
Date: Fri, 11 Apr 2025 14:10:47 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: SeongJae Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        "Liam R.Howlett" <howlett@gmail.com>,
        David Hildenbrand <david@redhat.com>, Rik van Riel <riel@surriel.com>,
        Shakeel Butt <shakeel.butt@linux.dev>,
        Vlastimil Babka <vbabka@suse.cz>, kernel-team@meta.com,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 4/4] mm/madvise: batch tlb flushes for
 MADV_DONTNEED[_LOCKED]
Message-ID: <ead4dd45-449f-4362-81d7-a25e634a4c5f@lucifer.local>
References: <20250410000022.1901-1-sj@kernel.org>
 <20250410000022.1901-5-sj@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410000022.1901-5-sj@kernel.org>
X-ClientProxiedBy: LO4P265CA0174.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|DM3PPF2E1953992:EE_
X-MS-Office365-Filtering-Correlation-Id: 445b2d3d-1f54-4c56-7784-08dd78fa47f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l8gny01rze1ZdOFlWppj0lV6pjZ8CEEOicShrGWSFyDLX6FOUIfraiVqoaXM?=
 =?us-ascii?Q?/cIEwYvQ2dLQ6zX+9hypeKYmFUfE3oMgWAeGINsrrxN410r0h7q06sWGIcZa?=
 =?us-ascii?Q?M0GmncVZ9/qbl+jAazmxpEWZk8rf04ivEz5GvfEByANa4cV46+J84sgMvR2y?=
 =?us-ascii?Q?sD/M9QUZZY/Ag3r7oKb3Hq3gejgpui2XnJTgfQzijZfHRElFNDdcCv1S6lbo?=
 =?us-ascii?Q?UWnWCAgIgXreAQwMZ6cUsVoJjvCEBLfgOF1enKp7tuU4i3+PFpS+QQgXzYKr?=
 =?us-ascii?Q?IgncjoATaKdDpupKCXnA5dbOikt1Xd2L+gIXhA2r8OwhHD4Q+w4JZKRNxCb+?=
 =?us-ascii?Q?zcjzbpQrlV57FuS3qEkg8AiiJ/2yu/RKl4vw4txOdXjs3iG05x8Q/JiyuafY?=
 =?us-ascii?Q?fxqHxF8ZiodKVqYLrJ4yqUbPHDJ2aUsnSLNcRDg9KG7FKhRTupwWlv+ek1YW?=
 =?us-ascii?Q?Ydtpy6EJHGZwR7c+8fEt/eIhYJ/RfOZ0/+D9/bSnfxrchirvpuuXXjUuSVdP?=
 =?us-ascii?Q?PCUTBIVQPkjIk5nkmTID0DriMG/kCSsNfu0mJqkLPPHohObopDU96pterYeN?=
 =?us-ascii?Q?5dAbgCKNmLnW970vOrIyH6m5Xzf9nd+hhCPyD6D6SeF/uKbqjdWCYDFnvOYd?=
 =?us-ascii?Q?dwlQvQRjNfVkj0MTb5XpBtg0JZuU6lg4HpAyMUleMilwf0WDuv9RdJZYCvLY?=
 =?us-ascii?Q?JWAagcc9vrVdgrxH/S76A1NPWA7v9Y8l1RBuAMmM9ab/zRIzpEGr+nc2y3Ua?=
 =?us-ascii?Q?V4QsBERW/QsMOfl4/cTUDxS94fJANVfZtFLs4fXtd4oCXoXl/0lghd4mFdMu?=
 =?us-ascii?Q?HrGc4jX1EAg7+UrXhRIfJIJxPxlIx5BXk1hmDGl3u6l8SoFn4IZmX5v/4mhs?=
 =?us-ascii?Q?IkvieZ/TV1/oZHkjWt3EULmntvJK4R67aKFkbuJgsLctpGKiuoWgG8zhwg1X?=
 =?us-ascii?Q?9r6l7qnoVexS+y4oNbtgr59HfOXu2PfHDs0/S8s0kuGhenMlOvUqu0WSnxYg?=
 =?us-ascii?Q?9qbCUv9Ju1U6Eojd8BuJeP47vU++RRc0nmU2EtkQRd9ua8erDDEog8FJnCT5?=
 =?us-ascii?Q?HOcpj0UaM0ajc2Gdl3AoB2M8pnZmeTqQh8zYILyOerLyX/CMpKH1wx2iudvv?=
 =?us-ascii?Q?HzitOAE6SNJJ7WD0XKIpE9UodH8Zntpe3dkpKtzRCBY0dyS1PtGgbyn+beJy?=
 =?us-ascii?Q?ppr1hwixfzblpQTp4g9AKY2kpybyOwV7Gk2jLeY/Slns2hJ7CBVz4Tj4KaAZ?=
 =?us-ascii?Q?cd6rMRmzD7gOYCnQ2ONS9znYPCXt+vj+AMsqZHoHNJRzBQ4UUjyQnaj5dBot?=
 =?us-ascii?Q?wuZyMADuuOXGg90cc4pt2qu/rEcLwExJrGVDlHPR6ZkfcqxGKvBSsb3S6erB?=
 =?us-ascii?Q?bFJX2cu1TLs9hqxTU3jz97QP1Sl5UOr75uW8AnP3J++SXA4Cklb5sbZmK7lX?=
 =?us-ascii?Q?tizkxo4+XPg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8IK47G0yse7V3AfPdlzPI5/HSMMwgqZiZNnCK4xG+dnUnL3BCCQhXCdhS9gh?=
 =?us-ascii?Q?1WLB2ezIy8QsylV8DoUeBiYGbAvchoWFkPNBiuUIa0IGclk5HXOeJQO5UG6B?=
 =?us-ascii?Q?Cp0r1ZRDR949EBhiIsz6mSl4xdam602DRKwd+DkOEbJMKWNazNzwF5dBjfnX?=
 =?us-ascii?Q?nxx1MDu/xDSeWo/mua4JSWuOPOFlNf/vqqJmyKQT847CDx+FJTiZmm3qMlSr?=
 =?us-ascii?Q?nLXt+KvivxCA6RhLsyc9pxCU4a1nlnsJNw7NAarLRqUIcB63dLCfFw0REHm4?=
 =?us-ascii?Q?RzrBH2S26uBM4OdpM8s1bLTwGXz/XQn5zJOn4En4nZtD28JQUgpJriqZZKs+?=
 =?us-ascii?Q?rwAvqHwwhjkovAQJk+XVklmOfdv3mMpZ6IVWhSu0W0rC338BeBQ2cjXraVSw?=
 =?us-ascii?Q?N81IkrUo+MAATwf4yXNpoqJvPN0v+oUIGyBjD0LX/0HWgLUU1rXiAes2dmvW?=
 =?us-ascii?Q?KKQRJEkpRq31cSpX43yPEB0U0ZI9KVPwRU8haF4x9Ba609SGuT7/bEAAsEid?=
 =?us-ascii?Q?VR9g46fTnRpdGjhpH4RBhjRhsWPNlhYYJ60nJ6a2LC/Any++Cfxy8Hd/TNFP?=
 =?us-ascii?Q?z03qG0FMV0uqbRL6psHGWmtFEhqd3Rj9WxkLpiW3UsMAxzQwR8AZ0peYlHjV?=
 =?us-ascii?Q?ZSZyo7BCsKyA7T61uuJTHtg1SLxOOk8GNarrJQRqxFNdthP5g0EFKx+U0k3N?=
 =?us-ascii?Q?qy72LhpBngG6JV/1youGKuWONzJH4IUFwsWtJZWYvARMRyndrqM5PF+csQv2?=
 =?us-ascii?Q?ffSzvGvL63WGPbsPYyhnq6nDMJQlhiGQFOzU2jSRZXR3wRG8hJJVL+lJCSnM?=
 =?us-ascii?Q?7dZZcHzuTqC+rmcLOwN8wIksvVYpwzngZSaW6i/qpJZxqDYH/lAgL0gYYKf2?=
 =?us-ascii?Q?Bjs+Dz1/ITU5jhVfc4vCnYaL7nS6UJt/J6SvLukeRmfE45TYy+sZbIkhORTH?=
 =?us-ascii?Q?9OfZgoPUH04x62mLtV5Xs2Sly5WmvsC9glpTyaHjxmMU2TrgkaLPQGbMQAEd?=
 =?us-ascii?Q?YqZk9nccCFVfCgMYmOUFTh1CDQ+lOSn1rU8PcCKwmxCCltluZM/tWpB4/Lxm?=
 =?us-ascii?Q?1UDadzWjRrmVecnAZ0k0TwwLaOef7v21X97wzdmwjJi2WeCf4OTv4pftT4bb?=
 =?us-ascii?Q?0WOTpX8IOKgoLr52bMscKMSzG6aLHeokmB53XNBxODCT/HLmvaDGSdYD6L2f?=
 =?us-ascii?Q?b9ewxFIKfxTW9DZZNFCX8V3/CpttV2wtBWQIYh/mtFlB5BYAB49Yhn32Ors5?=
 =?us-ascii?Q?MSCBsy5Rkz9NhSYtfK+YwRxm89bgei9oZLZvMkhDczs6Y5jjRtEikuLi7+gG?=
 =?us-ascii?Q?hw5LM64/bWeq0uUw7ojaYBQhO8Wtmj9mMDbYVVZHheXGPFmh3r5OuDGgZ+UC?=
 =?us-ascii?Q?YPAQFa61MCmNEHX51lAYQI6GvK0tcEpHByneke2twxQnNiELm5buZO7Xcz4B?=
 =?us-ascii?Q?UIcPluXm1spnDblwiq7x3wf6XECDaguOHe+EOvcKA8JRDThmV/lAHPevRGiY?=
 =?us-ascii?Q?leHx6qakf7FxF9uSCCis/MbXf9bYyjjQXFwP0VP6N5HL4N0h80hl0qD8gTci?=
 =?us-ascii?Q?+uxtRvOXPqCXR1y302uF7SwN/1/jtgN0IXIt/rBdnAuDnLDnv4ew7U15kW/J?=
 =?us-ascii?Q?1g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	US7JpXp2zQj+vcKoff9YUaTfq0oA0/rl+p3ASVPw66YDpD5RUvKu0lHlGVOO+BMB+n+T8S3Xp4PMyV09OZapq3BYp2iuTALglwkYpe87kCKXW4L9Y/rKds8cDep/ZPU7K26YFo4L2dF7mUnwpEG2vHaroeYLHPMjgn0Os1Sjw+5+jG4dopj9GBvxXnHsgi5OinU4RslnZzsCzOHSwASNSohvAgQJRMa2Bs+1bjRcDJqBjjFfWchDCl5ow+6WcHGH8JyizN80W8c+9fqENJPmnj4YxP/aNTCd4L7oBkFL7pyIJpyfgYUaOEKofDw0FFRgdZxCovQ7MLSM0XmquTevbJ81IKGrkUTchMgREqOjghGzqGB7n0XPhO55cBeGgG4AqCVrgpubrFce5jmakRGvx+aLlpRzLiX+WbV+hEI1uCLRstOKI0fIZWOpNOyGNzeRkxUB0rBqoFaAKBAbj4G1KrtgIqBfcT4PnKnhGi251r/JPwFGHFLnvt7sMx4wGipePDFN5x1UWbJBRZLoNuXxHqpvnC9OIHqehqN2bXfYVlutMzsI6cYXzwaJEv5iC083u/+axciijnYKJ6VyZJfxy1BnwKk7QnzXn5j+pCn94P0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 445b2d3d-1f54-4c56-7784-08dd78fa47f1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:10:50.1744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q85+aSdwOfVSGT5tf8AHMwga6DMxsiybYMZTCuHXhv4QHH8hDy+ScnSsnzq4ALVh8r1z19HLI8RWlNK7W89lEd2MM0RAS1rbJVq+6/1WCxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF2E1953992
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504110083
X-Proofpoint-ORIG-GUID: 5GkUPIG6bgBNmzaTG-yEUmVZF70_dNKM
X-Proofpoint-GUID: 5GkUPIG6bgBNmzaTG-yEUmVZF70_dNKM

On Wed, Apr 09, 2025 at 05:00:22PM -0700, SeongJae Park wrote:
> MADV_DONTNEED[_LOCKED] handling for [process_]madvise() flushes tlb for
> each vma of each address range.  Update the logic to do tlb flushes in a
> batched way.  Initialize an mmu_gather object from do_madvise() and
> vector_madvise(), which are the entry level functions for
> [process_]madvise(), respectively.  And pass those objects to the
> function for per-vma work, via madvise_behavior struct.  Make the
> per-vma logic not flushes tlb on their own but just saves the tlb
> entries to the received mmu_gather object.  For this internal logic
> change, make zap_page_range_single_batched() non-static and use it
> directly from madvise_dontneed_single_vma().  Finally, the entry level
> functions flush the tlb entries that gathered for the entire user
> request, at once.
>
> Signed-off-by: SeongJae Park <sj@kernel.org>

Thanks, as usual always a pleasure to review your series :) Cheers for
these changes!

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  mm/internal.h |  3 +++
>  mm/madvise.c  | 11 ++++++++---
>  mm/memory.c   |  4 ++--
>  3 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/mm/internal.h b/mm/internal.h
> index ef92e88738fe..c5f9dd007215 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -435,6 +435,9 @@ void unmap_page_range(struct mmu_gather *tlb,
>  			     struct vm_area_struct *vma,
>  			     unsigned long addr, unsigned long end,
>  			     struct zap_details *details);
> +void zap_page_range_single_batched(struct mmu_gather *tlb,
> +		struct vm_area_struct *vma, unsigned long addr,
> +		unsigned long size, struct zap_details *details);
>  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  			   gfp_t gfp);
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 951038a9f36f..8433ac9b27e0 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -851,7 +851,8 @@ static int madvise_free_single_vma(struct madvise_behavior *madv_behavior,
>   * An interface that causes the system to free clean pages and flush
>   * dirty pages is already available as msync(MS_INVALIDATE).
>   */
> -static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
> +static long madvise_dontneed_single_vma(struct madvise_behavior *madv_behavior,
> +					struct vm_area_struct *vma,
>  					unsigned long start, unsigned long end)
>  {
>  	struct zap_details details = {
> @@ -859,7 +860,8 @@ static long madvise_dontneed_single_vma(struct vm_area_struct *vma,
>  		.even_cows = true,
>  	};
>
> -	zap_page_range_single(vma, start, end - start, &details);
> +	zap_page_range_single_batched(
> +			madv_behavior->tlb, vma, start, end - start, &details);
>  	return 0;
>  }
>
> @@ -950,7 +952,8 @@ static long madvise_dontneed_free(struct vm_area_struct *vma,
>  	}
>
>  	if (behavior == MADV_DONTNEED || behavior == MADV_DONTNEED_LOCKED)
> -		return madvise_dontneed_single_vma(vma, start, end);
> +		return madvise_dontneed_single_vma(
> +				madv_behavior, vma, start, end);
>  	else if (behavior == MADV_FREE)
>  		return madvise_free_single_vma(madv_behavior, vma, start, end);
>  	else
> @@ -1628,6 +1631,8 @@ static void madvise_unlock(struct mm_struct *mm, int behavior)
>  static bool madvise_batch_tlb_flush(int behavior)
>  {
>  	switch (behavior) {
> +	case MADV_DONTNEED:
> +	case MADV_DONTNEED_LOCKED:
>  	case MADV_FREE:
>  		return true;
>  	default:
> diff --git a/mm/memory.c b/mm/memory.c
> index 690695643dfb..559f3e194438 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1998,7 +1998,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>  	mmu_notifier_invalidate_range_end(&range);
>  }
>
> -/*
> +/**
>   * zap_page_range_single_batched - remove user pages in a given range
>   * @tlb: pointer to the caller's struct mmu_gather
>   * @vma: vm_area_struct holding the applicable pages
> @@ -2009,7 +2009,7 @@ void unmap_vmas(struct mmu_gather *tlb, struct ma_state *mas,
>   * @tlb shouldn't be NULL.  The range must fit into one VMA.  If @vma is for
>   * hugetlb, @tlb is flushed and re-initialized by this function.
>   */
> -static void zap_page_range_single_batched(struct mmu_gather *tlb,
> +void zap_page_range_single_batched(struct mmu_gather *tlb,
>  		struct vm_area_struct *vma, unsigned long address,
>  		unsigned long size, struct zap_details *details)
>  {
> --
> 2.39.5
