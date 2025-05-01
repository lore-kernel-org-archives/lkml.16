Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 277102741A0
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746104378; cv=fail; b=RD4G00lURnRPPabtFeebLzDOnM2iTst/pbMc4sOHWYOKo0ced9KXxKZjTWIorGXTJaz4NHX7AyhrjKeE7wllCjL+atdJ8+n6rWYQzKWK7opMYZMzhrtKGtHSGJgtKNkBFCXBTRKsjKtwUHO7SYjq7PKXdhiNTg7Azkwo/cAF450=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746104378; c=relaxed/simple;
	bh=BavIX5vH1tfv+h+QyInomGBrVq+UEXxI/8HLQBBG+KY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uW4Uf98LdGDlKLx7FJoBXJ8tiryvZny8ttN0BCMvlSnLmTwIHBhyF2Wi3nnqc5fgvrAN/FBcIB+618Xim//nRVp+m5Xn7FX0dMQxK3EjM2zIh+w+IYEqbUXISfybWsIbw+hTN4l8Glq64yjwpqCLjGrKKxz9wsA2nVvRQ37KDdk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L6jcCqoB; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Fc6Mslq+; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L6jcCqoB";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fc6Mslq+"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5418g5x5013593;
	Thu, 1 May 2025 12:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=Y5bBe0+SWjNmHrsjoQ
	QQvLkIVdC1Et1/cqom6JME6a8=; b=L6jcCqoBN8qfeLlkixkF0HgmJVTux82f85
	JTuRBwlRXEjLLOdctKZmIIZEXG8wkBmf4Sb/cVz61kd8ERgxYjt6fSnte6O9jPUj
	5tWTmh0JThrFZE//nFOgXQDfwu/fr2D9gxy0kmy1a66Dk6YGfFI36WHTSMeNjhyl
	wLd2x2P7vajziHhB/mLR2D9YROA7Hm6qjej4s7d2TEn/HnJlLDe0ciayUF/mKRJc
	iem8K59aApleHPw10PIXLLTrekeUCNQS+Cpn4sqxy/A55RXZ75H84HREqzkeaC8M
	gh1PZk77HAzXQAAYuDpNUX35/jF9q2nyJEYuDvbjDp+x1hsmr92A==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6uqk10k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 12:58:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 541B0HOm014048;
	Thu, 1 May 2025 12:58:57 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazlp17011028.outbound.protection.outlook.com [40.93.13.28])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 468nxch3hx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 01 May 2025 12:58:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXJB5BpbDT1pIAJeUIl2Kbxj9kpLN15cFljvqJR/hj1p2Z+xf/cA4sNmJwLPyakymbBalfhbQtQt75Hbo/AKIY8mk0hAr6CobA6s5nucTyXwGolL+foV0X6Whyhgr4oxn8HoTj84QvNLkqHrFiCZEqCehIWcpUTydOMVKq4MHBJAW/kwgEkvOs+lMuTT9Eri7YWRdmdwsNyJocVZe9H/Emg9x04bD4YwaWBIindem+hEx3aQf1vD0//WdAwEvR2lvpA/x22E2FNL8N9UM+pWiz8nLyCvpAg83Bn9VLVSj7WDSAZcDNFPfpJTyAdwEgnSTb9qjf6cyixZbZm10XqsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y5bBe0+SWjNmHrsjoQQQvLkIVdC1Et1/cqom6JME6a8=;
 b=owvbRwe+zUt4jxvrT4z9iL17HfC/XuMFmJycxqszLNV+WoQUs/B8jC389V2mclKFiduYj1xtRvIel9HDetneU3LOoCpMWoYH89MZy43gbl7PWwLlDlN6D3aQ+KG66oKZIAeTGkSS458jXeBP97aCxqt17Pyj9fWtuyDok43wFUATYldZX0XC6CkMrXCBsG0VNWqrjcnCjL6eOw2wLKRY36btq9SNzHQv4gyLc1PiE09mYUBm9OHT3/Gh5Hk37dEK6AGw+2mJrPPQRMEgkvznakB04mmcJAJ3zCo7dOgtSD097B18DHp3z0sNOeFkch71MGdENWpwYJQWJfE2H/NnAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y5bBe0+SWjNmHrsjoQQQvLkIVdC1Et1/cqom6JME6a8=;
 b=Fc6Mslq+hVYjuOiOAfDaF9DBUuAqTwYy7NWveDW8i/2xzVdU7wjCUu2TLqzl/rrEuUD1YRRoUmjCzR8bI0KoiiLDX3wz7UBXfOjbXV4UU9XDIPGyP/F9eSwk9vWfbxunQAiVmJ+LUCxyffbJcXgSbrUBbdVIxTc72IKeaxTO0bU=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CO1PR10MB4545.namprd10.prod.outlook.com (2603:10b6:303:9a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Thu, 1 May
 2025 12:58:54 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%5]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 12:58:54 +0000
Date: Thu, 1 May 2025 13:58:50 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, namit@vmware.com,
        hughd@google.com, yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v2 3/7] mm: Add batched versions of
 ptep_modify_prot_start/commit
Message-ID: <3b53d194-95fc-4067-97b4-59e9c1832f68@lucifer.local>
References: <20250429052336.18912-1-dev.jain@arm.com>
 <20250429052336.18912-4-dev.jain@arm.com>
 <8780e63d-22c1-4133-a800-dec50fd1b5fa@lucifer.local>
 <f561dab6-c70e-485c-a3f7-2c5198fcf8c6@arm.com>
 <9a2129ce-55b6-47e7-a879-00e7982c8ec4@lucifer.local>
 <76cac3c0-2a52-4ff6-b7df-7a316983d197@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <76cac3c0-2a52-4ff6-b7df-7a316983d197@arm.com>
X-ClientProxiedBy: LO4P123CA0365.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::10) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CO1PR10MB4545:EE_
X-MS-Office365-Filtering-Correlation-Id: b2bb4a04-348d-4e74-8331-08dd88afed7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QeCTRTCQ55/0C2naYB0DU6g4SE8N4N81qMOVy0LWD+IjnIGxmDf3E4ZDOByJ?=
 =?us-ascii?Q?VRK5CEdUPQCMumWq9gv7srIsKVCA19Om3nKo2qFZI8+Z8BDeaZaA/mrxxP5W?=
 =?us-ascii?Q?p4PydxCppfSF+pA4VkcH3aGpTnQJYGQlDIpCQn8vA7F3iDkKrdQjUhtu6rvV?=
 =?us-ascii?Q?wGg1uoQJY8ekkLZ5sxh+Kjk2VqIxSTmc90WRB9Tp2+V/nev2Q5OXL+3g22gs?=
 =?us-ascii?Q?DJFb/O708U+kTYtmTknPnRndGiyk0Rh4ZpTFB79YkllIYVVC/w6O/SXEw7K3?=
 =?us-ascii?Q?ojstujcTXdopRy+Mc5Ij8JAZ/LygIy5xpEJFuW9kUKtCyl/XLKr+y0bwqTSr?=
 =?us-ascii?Q?rBimzAui/+2zjhauCL0Gz/jd/G//S51JbmC40Vghus4dnGn6Ylsy8BivSjGK?=
 =?us-ascii?Q?nPHhRUzTGE3tqKhq0ygQcKyKSn2oBXaTh+8F5x5vO/rSWMqKRh/Fo8vdlRQh?=
 =?us-ascii?Q?gYCGzkU/FqMt6ivlNtn2NtGXYBrRPfpPCrD79ZyFIJsUKUdqjZWuuFsyGsWK?=
 =?us-ascii?Q?sq8eLlDv58sBPvesnIasxWIwWxqlYaAZnkmCb9JVeEHTtv+RVAYQxuAkctXe?=
 =?us-ascii?Q?F+rG1UUEMl6AYgKO56Wp39FZiRFpSjozFc/ExwA5dIpZaqfw0dyuxD8VHrwX?=
 =?us-ascii?Q?60h7X/nFcwO1xBIlQUHQq42H44FpJeC0z8z6R23jtJjkj4kEbLB6dCU1l+vl?=
 =?us-ascii?Q?08ED9iQqN8IQTNEC6/PA09gQGHOrf+vt8wH/4tN9XQbsanrU0xoXsdiX74aJ?=
 =?us-ascii?Q?bhdX2ZqaOhLz/oIwLCwiLxwEAEyL5JWXAxpC6qNlQwnIvt/WLEKZRwx3eyoF?=
 =?us-ascii?Q?BDOmiGb2tyq2cbhRQrL7TvdiTocuXhjDeGT+8CN92q382gGlM6M0+cEnt5Cj?=
 =?us-ascii?Q?7GENhZpLlrHO7e6FHrjQlZolnciS2Uvdm6BWcYk4ee06Q2BhhuTCIfBouXKV?=
 =?us-ascii?Q?6L8MNRwcRJl3IDb93u79sGqSWcad5KNiJXyydBfq9VIrVbgUIRimgk+0NnEC?=
 =?us-ascii?Q?LET6gZx6EDvf6JOzEroZBSjgqNFQBs5Rbdgs/wCnChXL0Ck0s0CgwEPQyiFZ?=
 =?us-ascii?Q?fcmsCZlTogtbRWeeWE65FEfxfx/gsLNfyYmQuo073JnjxxbtXG5sfyXGhsJn?=
 =?us-ascii?Q?f3Wm8sILplGTFUAb9acO2FS4GPt4R56r+WiKO6fd+UYrXhQGxu3q7VbfE/02?=
 =?us-ascii?Q?fYLvQR+dQW2A0b7mDwQOckeuUuJ4GdIEEDyU0fFJONQL/8zXoArQv6WK0uqI?=
 =?us-ascii?Q?5CTmCmz4V2cHrLAhyaNESfzbpgLfJXrbfSFr6mVCshTHSTvLmd1vU2dAiXWd?=
 =?us-ascii?Q?8wZakhunvNFBx3yZvLwhNtADgvXFzMfsDHJH2MM03guDnd9bWXk2Nsv3jGb5?=
 =?us-ascii?Q?4sHblB4IyIXihq2Hjz6fKsBz6NVZ2p/nYl4gEHLAVVNpSmmchY9/C/umK/Uk?=
 =?us-ascii?Q?4o5rxGigFbU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lbQi8bPZa+TimtbKBZ90KwYw5rZ063YhBGyX+hAunqnL5G7GD9ptytPbtcLk?=
 =?us-ascii?Q?3OF5AuyolWPwGvxt+sD1u+zxUx8O5Dt6AFumXVtiR2PAxClYoGwOjnFnn/+2?=
 =?us-ascii?Q?fWheC2Ct5GAtYXGT4xnd0rRCX0kBNLrnXUGXj338AC30BvAcuTvd4GJKLvP1?=
 =?us-ascii?Q?7ntcOqx+GRn5K8W4/s9XEkqykSEcPCTXMMa8y1Jm/bC3Zs8JxR2hDnAyS8uP?=
 =?us-ascii?Q?e83R2mX09VxWtFnxzZrPxJqybVRyT0Ee5//K5QQpw0RMbZhtJWLphgtXVMkN?=
 =?us-ascii?Q?fiyKvR7d8dsz6mCCaRuvwiD1huNAR1C09aWM3dnJPXoRM1MUUbdX/M0o3rm1?=
 =?us-ascii?Q?+xH0T/PgXKRWHejHkfQxU2HEDwMMoruTVEXqGRk4e4IB+YW2SOdD6C1YePhA?=
 =?us-ascii?Q?3AuvM/8Y+/0HsEsTThmSlhoB1BnPpAqvNTfJpqzkIbpMYwVhMdN8R82yYCTa?=
 =?us-ascii?Q?1DtyJwCMQus1AkPamd3HGOzpMMwxc9dFKzgZV44fH+F7zaYMmaR6c7LnWacT?=
 =?us-ascii?Q?DyMs0KOte/2PXuy3Klz3eQYrYG2mMDujwgvvEEEfBmR7EHrLREgXiqGAgsn2?=
 =?us-ascii?Q?CRvlHg2+zLRpLZCHn4NI2gkxmxFLq91avj0gKovltjhMOMuH1ledKYYjx+7w?=
 =?us-ascii?Q?Bez280UT2udKwmkzM7YRP8F1+twUWgWWamVHQ6zfwjkgUXlPkNU0Wdq+Gnky?=
 =?us-ascii?Q?YovpyxpbKlSrbtB/KKMTaX3B/j/lIkdjMmvG0Dy9/UsaJJi2RcAvtRjOcRKg?=
 =?us-ascii?Q?WUWkhTaejhPCDAF0NHO0/ynatoJbODEwUB+5lGuAZiNxTKU84Wfbro+SbTDT?=
 =?us-ascii?Q?E4OfYqvGonUS0OuNkFjayPk5pS5iNXSOUVKWPZkRi+kBiX0u8pSBPq5nEsCz?=
 =?us-ascii?Q?k4VD6u4xr/uLwPrWzFlxYoQoR5QVBlh/jF/MJVoOgzn3EZLAHjrJDdxkwixQ?=
 =?us-ascii?Q?Wyvh3w5t3+Dh+8u/JW0ceyseag/zRu/EARBfV79jH4qbNquJzokISlzwYBWA?=
 =?us-ascii?Q?WRC0WfJmrhfEtSwm9FAhXUB70Uddmqu/eJmngS5TT8R5WParfbvWH4YX4Wfh?=
 =?us-ascii?Q?y2NPdyvZzp8z1hzI75gN6xLk3kA9FUycfqMKS3yfolagTiK3okOGuN07PWhv?=
 =?us-ascii?Q?8qnQYyZRu8DZUbztHx65K/B/7uUn59DP2msdPXATDueOevIo5ZOANTd9cKZh?=
 =?us-ascii?Q?/FGyy8gsrvWHH0Yel9iMbPpcUQ+GzAlq5zZqEmiZTWdlwDwKmzavUAk5uDR1?=
 =?us-ascii?Q?6P2S7MLkDGSoU3AtxOevb6yw/cG66e2MDhvmFbLwqfp964J9l8rHfsH8obKO?=
 =?us-ascii?Q?xzo929qdnO/wgiC1GIRkkVkFk6JqyU6h1Z6WsyNI+RAFuXWeS3BE9U5CTaBd?=
 =?us-ascii?Q?HO2PSoMvFVQhodzIsPh7Fh63iWdj0JV44M06XtvrEc1a8rZV376e4OjyVc98?=
 =?us-ascii?Q?CG2wk1KPMvLuKWfdS0hidIFujJe0CHeED3M+9uBzBtXZ6y5P521fMvzqaMOH?=
 =?us-ascii?Q?O4MeKMFA/KCY0v+aRGY8tPNDyFyKO3BWIeRglZm0VPdEM3uAydTYgVT+7VKr?=
 =?us-ascii?Q?/LXQJ0FLIKacDBxw2PFpgSVqRohniY2wzWmcm7RczgBswYwxzmLMUt5h2LGH?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7wsl8SnE72qFw8tfFFrNu45cDGpctdxmUNvnA6wmCVuT1fJ4u4IXzjuGYlZuim88HMRKTJfsMl+0nJkWuRqNuyhd5Ot4vcPmTn8AO4Wws4qCT3cYINC+ssE492uJIRAEoBPtOvyJZRRriBye63KXs2hyGyt4uY0xhchF5xYftQL3qcATr+120kA9nv9Uo11NaR7cglxfgOTjmxa2Tt8+nBlQ3hnUGu/vEyD26Mte2evapOgJEv0zkOfQ1DFTyAFxKdKlIA8IVMBPn8jgSc5YclhzWhVqz2KIbwQAnh6MDazE5oLQQnH2ixNcrWzPhHc5nkPacUNI04fspCZSVv9mMNJGuBt070NOlq6hZFtAFqgmb56KeuS+WenCwQ8S9EOTQ0z5EQCQE4el286atEYgOYmRLGaByVSIcRCZxPIx+8sySEJr1H/hjuYEsSI1EHA6MSdRtKiMZ1s/nXzO8XUhMjcsUQhSg+J1+m58NjoYrChlYyXXppLJDZVFtoXcsacI/vtinLllLx9QUYqyY7P94P2zcREk7S6CWGRm5Ri0HtCkydEq/DElW7aDRxHWZHvyVjCX8Omq/ZFfQHfBIa0XSjB7GfQWz5AB7dIOY6rwGOQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2bb4a04-348d-4e74-8331-08dd88afed7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:58:54.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nWKrkRwO8G+Ho4NGheXWp6luSp1o6GGR+8i3WsS70RQEMx3Ok+aKGVIqHFBa155i1q8obfeo/w9tb0SwfuYhMD9SgwQ4AHovNheamIL3cY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4545
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2504070000
 definitions=main-2505010097
X-Proofpoint-ORIG-GUID: ee85S--riEWP5WN1CZNrx5aUdRbfIKgJ
X-Authority-Analysis: v=2.4 cv=Vq8jA/2n c=1 sm=1 tr=0 ts=68137012 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=7CQSdrXTAAAA:8 a=xyrYsSZ92rdYoxVj3hcA:9 a=CjuIK1q_8ugA:10 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: ee85S--riEWP5WN1CZNrx5aUdRbfIKgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDA5NyBTYWx0ZWRfX1srjEhydGfs/ Vo2QEAGHN+J5wxI9t7+ZzITshnHDqhJ7MOb3iiTtbOHwQIeeIjIYpf6+P9KiW4sn6Yo3lzW3NCL k2vY7+NlhpIkvk9bgdoz/BrLvb63hAhq9Mxs27u44/M/OL0rcSPcZiex6qZTa4/UQTZLquKARzt
 dEZbIcRc7M3OADq7FedDlc+yLt4iukg6orLQCQqr3aR/PlPsxVaeYLA4Iv4gG6g0SdqBtBfVk/D uZ2LXktLORBJpcrXia7V8z/fj6o/MN9O3grGeKy8yvcQQXsEGZ/mmgpZ9KMN5jV9vduGRUCHT1/ FY/d/g/ih44LbK5lUsaVUQR60MVwmVnuHF7Ioz1vpXwlUOYgW+wqV1YgBuHuFP04JHsHAy/XWXz
 Omq0ZuBWCgWEktm5dsbIuJY5jSwEl35YG8b63faeMkZdmQBJ9Rj+d5foRQCGffryvh29wzTj

On Thu, May 01, 2025 at 12:33:30PM +0100, Ryan Roberts wrote:
> On 30/04/2025 15:34, Lorenzo Stoakes wrote:
> > On Wed, Apr 30, 2025 at 03:09:50PM +0100, Ryan Roberts wrote:
> >> On 29/04/2025 14:52, Lorenzo Stoakes wrote:
> >>> On Tue, Apr 29, 2025 at 10:53:32AM +0530, Dev Jain wrote:
> >>>> Batch ptep_modify_prot_start/commit in preparation for optimizing mprotect.
> >>>> Architecture can override these helpers.
> >>>>
> >>>> Signed-off-by: Dev Jain <dev.jain@arm.com>
> >>>> ---
> >>>>  include/linux/pgtable.h | 38 ++++++++++++++++++++++++++++++++++++++
> >>>>  1 file changed, 38 insertions(+)
> >>>>
> >>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>> index b50447ef1c92..ed287289335f 100644
> >>>> --- a/include/linux/pgtable.h
> >>>> +++ b/include/linux/pgtable.h
> >>>> @@ -891,6 +891,44 @@ static inline void wrprotect_ptes(struct mm_struct *mm, unsigned long addr,
> >>>>  }
> >>>>  #endif
> >>>>
> >>>> +/* See the comment for ptep_modify_prot_start */
> >>>
> >>> I feel like you really should add a little more here, perhaps point out
> >>> that it's batched etc.
> >>>
> >>>> +#ifndef modify_prot_start_ptes
> >>>> +static inline pte_t modify_prot_start_ptes(struct vm_area_struct *vma,
> >>>> +		unsigned long addr, pte_t *ptep, unsigned int nr)
> >>>
> >>> This name is a bit confusing,
> >>
> >> On naming, the existing (modern) convention for single-pte helpers is to start
> >> the function name with ptep_. When we started adding batched versions, we took
> >> the approach of adding _ptes as a suffix. For example:
> >>
> >> set_pte_at()
> >> ptep_get_and_clear_full()
> >> ptep_set_wrprotect()
> >>
> >> set_ptes()
> >> get_and_clear_full_ptes()
> >> wrprotect_ptes()
> >>
> >> In this case, we already have ptep_modify_prot_start() and
> >> ptep_modify_prot_commit() for the existing single-pte helper versions. So
> >> according to the convention (or at least how I interpret the convention), the
> >> proposed names seem reasonable.
> >>
> >
> > Right, I'm fine with following convention (we should), I just find 'ptes'
> > really ambiguous. It's not just a -set of PTE entries- it's very explicitly
> > for a large folio. I'd interpret some 'ptes' case to mean 'any number of
> > pte entries', though I suppose it'd not in practice be any different if
> > that were the intended use.
> >
> > However, the proposed use case is large folio 'sub' PTEs and it'd be useful
> > in callers to know this is explicitly what you're doing.
> >
> > I feel like '_batched_ptes' makes it clear it's a _specific_ set of PTE
> > entriess you're after (not just in effect multiple PTE entries).
>
> I don't mind _batched_ptes. _pte_batch would be shorter though - what do you think?

Sounds good!

>
> But if we go with one of these, then we should consistently apply it to all the
> existing helpers IMHO - perhaps with a preparatory patch at the start of the series.
>
> >
> > However, I'm less insistent on this with a comment that explains what's
> > going on.
>
> That would still get my vote :)

Awesome :)

>
> >
> > I don't want to hold this up with trivialities around naming...
>
> There are TWO hard things in computer science; cache invalidation, naming, and
> off-by-one errors :)

Haha yes... I continue to be surprised at how bloody hard it is as my
career goes on...

>
> >
> > ASIDE: I continue to absolutely HATE the ambiguity between 'PxD/PTE' and
> > 'PxD/PTE entries' and the fact we use both as a short-hand for each
> > other. But that's not related to this series, just a pet peeve... :)
>
> I assume you are referring to the ambiguity between the *table* and the *entry*
> (which just goes to show how ambiguous it is I guess)... I also hate this and
> still trip over it all the time...

Yes. As do I, as does everybody I think... Sadly I think unavoidable :(

>
> >
> >>> it's not any ptes, it's those pte entries
> >>> belonging to a large folio capped to the PTE table right that you are
> >>> batching right?
> >>
> >> Yes, but again by convention, that is captured in the kerneldoc comment for the
> >> functions. We are operating on a batch of *ptes* not on a folio or batch of
> >> folios. But it is a requirement of the function that the batch of ptes all lie
> >> within a single large folio (i.e. the pfns are sequential).
> >
> > Ack, yeah don't love this nr stuff but fine if it's convention...
> >
> >>  > Perhaps modify_prot_start_large_folio() ? Or something with 'batched' in
> >>> the name?
> >>>
> >>> We definitely need to mention in comment or name or _somewhere_ the intent
> >>> and motivation for this.
> >>
> >> Agreed!
> >
> > ...and luckily we are aligned on this :)
> >
> >>
> >>>
> >>>> +{
> >>>> +	pte_t pte, tmp_pte;
> >>>> +
> >>>
> >>> are we not validating what 'nr' is? Even with debug asserts? I'm not sure I
> >>> love this interface, where you require the user to know the number of
> >>> remaining PTE entries in a PTE table.
> >>
> >> For better or worse, that's the established convention. See part of comment for
> >> set_ptes() for example:
> >>
> >> """
> >>  * Context: The caller holds the page table lock.  The pages all belong
> >>  * to the same folio.  The PTEs are all in the same PMD.
> >> """
> >>
> >>>
> >>>> +	pte = ptep_modify_prot_start(vma, addr, ptep);
> >>>> +	while (--nr) {
> >>>
> >>> This loop is a bit horrible. It seems needlessly confusing and you're in
> >>> _dire_ need of comments to explain what's going on.
> >>>
> >>> So my understanding is, you have the user figure out:
> >>>
> >>> nr = min(nr_pte_entries_in_pte, nr_pgs_in_folio)
> >>>
> >>> Then, you want to return the pte entry belonging to the start of the large
> >>> folio batch, but you want to adjust that pte value to propagate dirty and
> >>> young page table flags if any page table entries within the range contain
> >>> those page table flags, having called ptep_modify_prot_start() on all of
> >>> them?
> >>>
> >>> This is quite a bit to a. put in a header like this and b. not
> >>> comment/explain.
> >>
> >> This style is copied from get_and_clear_full_ptes(), which has this comment,
> >> which explains all this complexity. My vote would be to have a simple comment
>
> Oops; I meant "similar" when my fingers somehow typed "simple"... This is not
> simple :)

Ha, yeah indeed :P that makes more sense!

>
> >> for this function:
> >>
> >> /**
> >>  * get_and_clear_full_ptes - Clear present PTEs that map consecutive pages of
> >>  *			     the same folio, collecting dirty/accessed bits.
> >>  * @mm: Address space the pages are mapped into.
> >>  * @addr: Address the first page is mapped at.
> >>  * @ptep: Page table pointer for the first entry.
> >>  * @nr: Number of entries to clear.
> >>  * @full: Whether we are clearing a full mm.
> >>  *
> >>  * May be overridden by the architecture; otherwise, implemented as a simple
> >>  * loop over ptep_get_and_clear_full(), merging dirty/accessed bits into the
> >>  * returned PTE.
> >>  *
> >>  * Note that PTE bits in the PTE range besides the PFN can differ. For example,
> >>  * some PTEs might be write-protected.
> >>  *
> >>  * Context: The caller holds the page table lock.  The PTEs map consecutive
> >>  * pages that belong to the same folio.  The PTEs are all in the same PMD.
> >>  */
> >>
> >
> > OK I think the key bit here is 'consecutive pages of the same folio'.
> >
> > I'd like at least a paragraph about implementation, yes the original
> > function doesn't have that (and should imo), something like:
> >
> > 	We perform the operation on the first PTE, then if any others
> > 	follow, we invoke the ptep_modify_prot_start() for each and
> > 	aggregate A/D bits.
> >
> > Something like this.
> >
> > Point taken on consistency though!
> >
> >>>
> >>> So maybe something like:
> >>>
> >>> pte = ptep_modify_prot_start(vma, addr, ptep);
> >>>
> >>> /* Iterate through large folio tail PTEs. */
> >>> for (pg = 1; pg < nr; pg++) {
> >>> 	pte_t inner_pte;
> >>>
> >>> 	ptep++;
> >>> 	addr += PAGE_SIZE;
> >>>
> >>> 	inner_pte = ptep_modify_prot_start(vma, addr, ptep);
> >>>
> >>> 	/* We must propagate A/D state from tail PTEs. */
> >>> 	if (pte_dirty(inner_pte))
> >>> 		pte = pte_mkdirty(pte);
> >>> 	if (pte_young(inner_pte))
> >>> 		pte = pte_mkyoung(pte);
> >>> }
> >>>
> >>> Would work better?
> >>>
> >>>
> >>>
> >>>> +		ptep++;
> >>>> +		addr += PAGE_SIZE;
> >>>> +		tmp_pte = ptep_modify_prot_start(vma, addr, ptep);
> >>>
> >>>
> >>>
> >>>> +		if (pte_dirty(tmp_pte))
> >>>> +			pte = pte_mkdirty(pte);
> >>>> +		if (pte_young(tmp_pte))
> >>>> +			pte = pte_mkyoung(pte);
> >>>
> >>> Why are you propagating these?
> >>>
> >>>> +	}
> >>>> +	return pte;
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>> +/* See the comment for ptep_modify_prot_commit */
> >>>
> >>> Same comments as above, needs more meat on the bones!
> >>>
> >>>> +#ifndef modify_prot_commit_ptes
> >>>> +static inline void modify_prot_commit_ptes(struct vm_area_struct *vma, unsigned long addr,
> >>>
> >>> Again need to reference large folio, batched or something relevant here,
> >>> 'ptes' is super vague.
> >>>
> >>>> +		pte_t *ptep, pte_t old_pte, pte_t pte, unsigned int nr)
> >>>
> >>> Nit, but you put 'p' suffix on ptep but not on 'old_pte'?
> >>>
> >>> I'm even more concerned about the 'nr' API here now.
> >>>
> >>> So this is now a user-calculated:
> >>>
> >>> min3(large_folio_pages, number of pte entries left in ptep,
> >>> 	number of pte entries left in old_pte)
> >>>
> >>> It really feels like something that should be calculated here, or at least
> >>> be broken out more clearly.
> >>>
> >>> You definitely _at the very least_ need to document it in a comment.
> >>>
> >>>> +{
> >>>> +	for (;;) {
> >>>> +		ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >>>> +		if (--nr == 0)
> >>>> +			break;
> >>>
> >>> Why are you doing an infinite loop here with a break like this? Again feels
> >>> needlessly confusing.
> >>
> >> I agree it's not pretty to look at. But apparently it's the most efficient. This
> >> is Willy's commit that started it all: Commit bcc6cc832573 ("mm: add default
> >> definition of set_ptes()").
> >>
> >> For the record, I think all your comments make good sense, Lorenzo. But there is
> >> an established style, and personally I think at this point is it more confusing
> >> to break from that style.
> >
> > This isn't _quite_ style, I'd say it's implementation, we're kind of
> > crossing over into something a little more I'd say :) but I mean I get your
> > point, sure.
> >
> > I mean, fine, if (I presume you're referring _only_ to the for (;;) case
> > above) you are absolutely certain it is more performant in practice I
> > wouldn't want to stand in the way of that.
>
> No I'm not certain at all... I'm just saying that's been the argument in the
> past. I vaguely recall I even tried changing the loop style in batched helpers I
> implemented in the past and David asked me to stick with the established style.

I definitely defer to David's expertise, but I feel there's some room here
for improving things.

>
> >
> > I would at least like a comment in the commit message about propagating an
> > odd loop for performance though to explain the 'qualities'... :)
>
> Just to make it clear, I'm just trying to provide some historical context, I'm
> not arguing that all those decisions were perfect. How about we take these
> concrete steps:

Ack sure.

>
>   - Stick with the _ptes naming convention
>   - Add kerneldoc comments for the 2 new functions that are very clear about
>     what the function does and the requirements on the batch of ptes (just like
>     the other batched helpers)
>   - Rework the looping styles in the 2 new functions to be more "standard";
>     let's not micro-optimize unless we have real evidence that it is useful.
>   - Merge this patch with the one that uses these new functions
>
> How does that sound as a way forwards?

Sounds good to me!

Cheers, Lorenzo

>
> Thanks,
> Ryan
>
> >
> >>
> >> Thanks,
> >> Ryan
> >>
> >>
> >>>
> >>> I think it's ok to duplicate this single line for the sake of clarity,
> >>> also.
> >>>
> >>> Which gives us:
> >>>
> >>> unsigned long pg;
> >>>
> >>> ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >>> for (pg = 1; pg < nr; pg++) {
> >>> 	ptep++;
> >>> 	addr += PAGE_SIZE;
> >>> 	old_pte = pte_next_pfn(old_pte);
> >>> 	pte = pte_next_pfn(pte);
> >>>
> >>> 	ptep_modify_prot_commit(vma, addr, ptep, old_pte, pte);
> >>> }
> >>>
> >>> There are alternative approaches, but I think doing an infinite loop that
> >>> breaks and especially the confusing 'if (--foo) break;' stuff is much
> >>> harder to parse than a super simple ranged loop.
> >>>
> >>>> +		ptep++;
> >>>> +		addr += PAGE_SIZE;
> >>>> +		old_pte = pte_next_pfn(old_pte);
> >>>> +		pte = pte_next_pfn(pte);
> >>>> +	}
> >>>> +}
> >>>> +#endif
> >>>> +
> >>>>  /*
> >>>>   * On some architectures hardware does not set page access bit when accessing
> >>>>   * memory page, it is responsibility of software setting this bit. It brings
> >>>> --
> >>>> 2.30.2
> >>>>
> >>
>
