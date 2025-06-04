Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D72428DF1B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048563; cv=fail; b=SW72HtXb6kMcZQ8kvKos/V+TWkLGNEt5SFOaRbQcNDhbT+Ja7HxFCmLQ77RNBicdMjy+8DbjPV2WCKyaASkciRTo/0vIf1DgRk/SjtjUl2FrgAU2pcrZJbNk7+C5lrT0f9tN5RhpmRps3SwGBLgGtWmU2LkzWpPeXPfU1os9Nzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048563; c=relaxed/simple;
	bh=BlwTlCc+JO8MUQpQ0hB3wf3WsTPYDUSxyVU6V9Rt7Ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hgOmGWbdS3M+vhs6X6Uk4f8x3gEvbpa5+6v7ULTWRk0OhUktzaLXPhdaRuQuAXpe51s3A/N0Lop2Hqysu3qbDTh7799NgklbPIrz/nVHabyhzqRz+VlKMAnqJK5kw9stPAqpNPg9LdyjH0rKcLAVdslXsOcExFhrIyXa+dZwmuY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=V/8x8IC5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Soh7rbed; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="V/8x8IC5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Soh7rbed"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 554EfvLm014542;
	Wed, 4 Jun 2025 14:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=xE/S+3fGUBD3YAM8Bj
	JZGAcYlGviEX9tMWljwHQ8lGM=; b=V/8x8IC5XCZTYfq0JTt/ZAqGb1ia2emm/T
	RZsOFK1XmndbKxCYmyjLzNHHA/nSg7P/UeB0nb3Bkr0aTZT6CSqyUKeZbtc5ro4t
	U0IGlo+fIZc8Ki++t+HK4TCPEKopCoRsgkDvVTFulVTMvOKMmZHCnle1raRmsC3I
	tMiEUbhuAj59NKVJ3oNg+jIAaICcbDA0aP1lhc/zJMyMuZdRAfirVtZO8nw0xnTO
	eysX2gIA4gejjQuCR9YTL0QfwHfjsrRMRkjaV/xS4dPMHALICMva2IJ2WnPBYwSL
	rKotYHGVk7Dh3aYgwqsxb3A5h8HCxMUD4plhlxN+A2KrlNiBXFew==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471gahc8q8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 14:49:05 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 554DXflA035106;
	Wed, 4 Jun 2025 14:49:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7b3s2j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 04 Jun 2025 14:49:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=av7JXKMiXN+R0mCB1re2zxPZMsgVYFY3PpledJvKpl4BM+s56qyHFd3JVqKo03EcwhuKhGggIHsJTLK2rZRG/lYlh3CNODOvmq1H0I1NXLqLM2kHf72N/iWX1zSY5w/0sD4MCro+8lHsYwAALn4orjo2DKAD483bwRy9nHbdQwJhEsZGrD6b2QyeB3qjO3azQOYVKKpTFyy+cCGSxfJZs6rersEyO8PMgAQKleEoGDpP3+MnUYDYaYnvuMb+3VyJ5ibEssFVjWF+K3aGOaFVjlPt7Sy5Hg13NvVcS+TqIjamMf5zYbhom1RgRWLP4kPi9ZaWsnRnkWNb8ZWqeSRzQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xE/S+3fGUBD3YAM8BjJZGAcYlGviEX9tMWljwHQ8lGM=;
 b=mg5u1mec+kHMYdRBcZqqz3dICo7MOXAU43dSisZjz1sVbM6zPVXTddiAJNcprvPhm+czrmlL+MTQvCHa3K8i6wayIojt0GVSeRseTi11mM+JYRlxmoouh0L+Mj12QuAtOsKPuIYhivjtrInJ9LF5EKds/8KsZm8vfTJpjK64hvx+52Dfl4uXD5CN4bVx1xoGIU06aRf83acuNKO8gm3phh3bpPG3Fah7pWwFzxQweC7f7Y0NabBoobQ+mevfiMOSlWkdJ+G+CufB0MHfBDQzO6DVVebeGxNt55hWPWoiuWS9lzb/ANhLGCgPnwdMeDycsyjuEItJADbYjFTBNFEqGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xE/S+3fGUBD3YAM8BjJZGAcYlGviEX9tMWljwHQ8lGM=;
 b=Soh7rbedpsQQmOqu2lsF4ugwtNFlw7aLw2yF2/WFxv+sXPd/K67VeTTNA2AxB8bG1EfcdzYtJih3jnBuh8MAK23gc/ea7BRAquNqZTxKCSIT8QncMzu/Y5SXgatpAvxZLSg+Iqr8l+svb6i3DqvFORCOII4heG3wzKKqnYaGjyw=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH8PR10MB6291.namprd10.prod.outlook.com (2603:10b6:510:1c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.40; Wed, 4 Jun
 2025 14:49:00 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%6]) with mapi id 15.20.8746.041; Wed, 4 Jun 2025
 14:49:00 +0000
Date: Wed, 4 Jun 2025 15:48:58 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
        Peter Xu <peterx@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
Message-ID: <fb548cd0-4a6a-4e90-92b8-24c7b35df416@lucifer.local>
References: <20250604140544.688711-1-david@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604140544.688711-1-david@redhat.com>
X-ClientProxiedBy: LO2P265CA0159.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::27) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH8PR10MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: bb5830b6-6bb0-4e7f-4a5a-08dda376f15c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MnaOFYw39BB/xJMKxpb7uU1yWyJG1gMQ/nTZa+E2bHAyS2RtzI1zJ15ItSP0?=
 =?us-ascii?Q?01FCM5RWTTohP460i5FIMLc0kqBGhm3o7QBoELdF57fw6LFOjDi1bAAvqR2D?=
 =?us-ascii?Q?/OUJXijsDY41pDFTtwOW7oBi9Kztmn4UQZBpgxnNQQ/5CT72jHPbhwqYmTGh?=
 =?us-ascii?Q?OHwMSi8zlALpbRl4K1CfztGm0mxk7bUrFu587IDHapwTRb5zqDI+enNyVKdu?=
 =?us-ascii?Q?we0QJiVeDGuVVfPtmNXLGMzUhrrG3GWlTCPVEIW+YIOXhFNMgeTIo+ebFSq0?=
 =?us-ascii?Q?i32th/ZzEYtXNY5mLxfJjNXMb5WMvJ20vSmQeAfa9NlubttRiYsfgIrIt8Z4?=
 =?us-ascii?Q?aXIKfwcBh7jzIwkwmNwMokbOvD5Eyc4cUJIfkRrkGyLsxMz6DL5nxW8QMt1m?=
 =?us-ascii?Q?VLPGoEOeOEgPplhHpIRPAdZfKpxlzuFCrsOTq/0FfMqK+06Vh4TCMzbe40fU?=
 =?us-ascii?Q?FjqJqFajn15b7R1xia3o/+dweasoWFyc/PXo+3c+1QPqLcTUO/GYyJOBxIRZ?=
 =?us-ascii?Q?0FY11gQrKTYvcAgT7A4WZ4L/0cb5n8Y0XTv1OAkYJC+brxBgEblJHgCElspx?=
 =?us-ascii?Q?cDo0ABC+pe5kBeupakLnEekRAVSlbsj0rSVAFquVzuQv4l3hzuXWN2+sPztK?=
 =?us-ascii?Q?hJRnezVi4SRaDb07d7CKwNSFxw24dlJbfxtSnQXRwHXDBANEt75DZp10QNUx?=
 =?us-ascii?Q?iWUJupbRE3nW6ODyOd1gREBtZWNdcZ/NjfWykE/BSE6jzZfSTBvjKzoxbI5k?=
 =?us-ascii?Q?MjQE2NBOsYpNLNu8nGaY7++ND6l/+5O/wDrNUWGiWfLhdIaj76/3Ztcfz7VQ?=
 =?us-ascii?Q?Zoevzdb7yCwB3RNsu+oIasV7b9kN+/RKNKQZXkxyss0+vi2XNpxpnFfWyR02?=
 =?us-ascii?Q?hMGcCoNmJmG1yMjh1ff8RS6AsUxZZYOnDy1ZfkfGnS3uwNz7BdQme53oZDmw?=
 =?us-ascii?Q?8leU7m5ZoHL4YtH4jrgudZhwj7/SmU+XgwvEUCvdc8b3wKqUT7ihylGUPGS0?=
 =?us-ascii?Q?4mdWk8O7s7w4iaoVpxbs+ZWAk1J8hxHZkDa5l4+fvDbd1fZ58ewb9sMLzV/F?=
 =?us-ascii?Q?OvA28BifS4o71yqFzsfVXv/sOe6GLDhlVF7H9lY0xcD63xWMyBA9ZLgdJRIi?=
 =?us-ascii?Q?I6AALbmOxe2DchxWStP9pVNgzRVzFcZZgQCv91RWZ31BqxQ5v8/AhL8PiIi8?=
 =?us-ascii?Q?7alIyqCBvIBK7PswFrRQSrmBf0UM2rM+/hrLmJjT0d3Zlt5Jyp5o4qRZgHj1?=
 =?us-ascii?Q?vy8Z1DJFRCv4OS0VCOj0ErleqBPF/qiAwUk4eaiy9KbQevifPsf0dKtV/PG5?=
 =?us-ascii?Q?hWpnbkXppMGPOdIwcZpvZNLzRiPBGHvXr9s1SJ/HWITF1dUxKbhAEIwx7Hez?=
 =?us-ascii?Q?UH0neJ4yG96hUBpaUn9nDK+KE9MUjkq+inT5SErKR7aza0q2AZ7twchET/0f?=
 =?us-ascii?Q?J1jRZvibcnU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mKKxwUqmkBm16vbq9NwBkLB55cLP9/jnUo3wTqbALFM8nPHGIdx3aFsZXaql?=
 =?us-ascii?Q?DcfInjLPvzP7ozuvzLTVQ4nKKIDH05W1uelNtskey9ZGA0S9kxQ3zCP2CqeT?=
 =?us-ascii?Q?YYSa3rPYkQFd/jxzzGYR1OlwHHWmqlrfvaHxbLAC/GH2ZqVAYW+nhwikwqEs?=
 =?us-ascii?Q?eroLBEk5dX6/nGyj0LC7NgkQZqyh0AILsxCK2YGStG6AT1DXMJGM7XWlwtFF?=
 =?us-ascii?Q?utmfw2K+nYuRpjczIkHjcU22W1yNZWtKqxmbQeC5tJono/5QrVDet5q6M4Fb?=
 =?us-ascii?Q?26XWAlrdkiYykPw9d4uTZhomoyPpxjnVy4P/jvC5umK3M0s49/+na4ar59j1?=
 =?us-ascii?Q?xgNh3jPK59qoFPg1Jj0JRQ67avtRzLfqxRu3+eOB3Ax+bE+qIQ9ZcgvCxW5P?=
 =?us-ascii?Q?T6J899pVRXBfNbm9OUf0RLX42t3/2hqkYuLt7p4Taq6wOFScxgzEoH6j16gw?=
 =?us-ascii?Q?C9cN0Hzs3N9dzR3hNTG+b0keo1JPmsG+uh4ThXs02ArYWsYhlJwSWDqUuliT?=
 =?us-ascii?Q?NbPutALS1Etzznb2aRy+Fu//SokTxoBR8Mf1UylyZdCuCB0JV6ToFC/G1ubZ?=
 =?us-ascii?Q?barFChR6dpvy511+LSI//UKRkkzz/MPzskSvWE7WTdqP/fr+MdLmdSgKrvhN?=
 =?us-ascii?Q?CI2mkycf6pe570uh5IC/3z8Mzn+T6P26aYBojQZRCvOrN652Ms80XenSR2sw?=
 =?us-ascii?Q?0iiLYUQwjMRzvE4Pfz4rRE/saI7W7sfqzJLRGMe0THECkAhUxirkkL5hS/uL?=
 =?us-ascii?Q?zskz9lBV7fEFbvekbWExc4+ZGBb7dGw59jZVhde7+qWo3tSDr20zNXDzGWiW?=
 =?us-ascii?Q?py6oGBIaGfaM8UfExLGt/6oqaogF66L3UXPVhUlrsVWF0jOWqITjVODc2+/p?=
 =?us-ascii?Q?I0tjaPBi6lk55Ip8YGhn0f1fTMxpc4HnGBJAg5KZGcChSw8cOxFh2mGFK1pl?=
 =?us-ascii?Q?F7OEllOwjdsV+gp1Q4Hkb4clHLz3u4p5LpNRExplQYSNNXZiLnHmvzs/rWf0?=
 =?us-ascii?Q?kSMraFfMawC0hVR8I9hhmYyedsVV1IYsJH7qBlAECAxGDvovcQBn3aXQGgMN?=
 =?us-ascii?Q?ArAJnO9qpYE1RNmIXf81wG6sxNZE0nVuFf6IfXtKMQ3qSj2Q5mFvrn2//JO3?=
 =?us-ascii?Q?wQou9vWiDuSRaAztHllLnY1GffDyB/Gyha2WU9Z8B+khYVCgzGUcFerWweoZ?=
 =?us-ascii?Q?9BGRzKBDyCbL7m0Zcd0kUAt3vYUR4rWAdnVKXKVUmqXFy1tPQrxbYec+tOly?=
 =?us-ascii?Q?U1AR+TfB2JRYMOBZqW5aO/p1MFXJJ7rDXNpQ3qYFKU7laUOjh4WgivglvbA2?=
 =?us-ascii?Q?h9Kp6dhdNNrHgn9aYJX8c07svqvJSsKAAfL+NrI8x3KdB6QInYNK7rXvneoh?=
 =?us-ascii?Q?seD7PnAb0t/CK+7AgitQGBmfxqOyRpzbiDpoELAlJQOAykgLlS+jcJCrrT+Y?=
 =?us-ascii?Q?YgLfiDxrBhvpt0JUXS6f7IGpyGgxvfacTfri1/iGZh89e/UpekdsBlO1GJxS?=
 =?us-ascii?Q?faBXM/7xCt/b0Ok3Tb08Uy5sSLCqZvX3WJaC0iMRgNzfbrRTXNVe5ShVQ8KD?=
 =?us-ascii?Q?bST+uHs3orIRxkpPGXDBeLsMDWp2Chg8LK8QdBf8o63yXDcrufvj6t79+pFM?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	5v3wfkRMqo88gUNT1etYWymBjeWqfuKi3yAbqnd7BSgAbgfx2DuoV0oy9sPODjQLpcS05aztemCzx+ZUjSl766jCpfPMSXO5EbhlZGjBMcDA8Lu/otiXZwsu6ilV4b2+6Ku6LeSjSOwO5h3+kiWyID33piPb0lbUxN1EFx/H6w3xvTPRlmnVFXF2NpMYHetMBHHweHujnVWFO0F5o2pbKkDVuxnRHHS4limDqvdnUOYb0Lg1ZU1dWqrkGnsdTxp3+09yasK7UZrxoTVLEZTrVWpSycSB6tytGAbjxzobwN2xLUSUFwqd9r73XbmPgQblQ9ZYxBe1l3m4XpC3jLwNG/nh44kvBVQOHvCdzPwkCg8BPLC80Va0hIn5Wyu9rvH57IyMxZ9OeN1MxjjoMc19V2YtWbmShYNHBohYSG+SIUKjMta8EA8zQkfX8rFdXW0YxZZJDQxFIqhruyM3bh7PLDmJ+/a++s/HGK1QcxK6q3NbB19rfoV+ZmQ68jilNGE/SWtIe3a72WWMRZ/LTTR43u35LMmGuCpSn0qzGubow6AVv7iBYL896KF7o5eZ1P4dRK+0QmhQSC8/LFDePu7SdDglLhGdzu95ni0ugVtA1wA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb5830b6-6bb0-4e7f-4a5a-08dda376f15c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:49:00.8221
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9IRpKu7cbs4VSjnaE8bWu39zvJWSzmyo7AztmmeyVWJ3qBiEsdAFfJ0wgog74wY+YA2Inb7IqEXLhjWlZMNVkMLD0n9A4r2DFRNa/dHoKfE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6291
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506040110
X-Authority-Analysis: v=2.4 cv=aqqyCTZV c=1 sm=1 tr=0 ts=68405ce2 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=Z4Rwk6OoAAAA:8 a=yPCof4ZbAAAA:8 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=iox4zFpeAAAA:8 a=9jRdOu3wAAAA:8 a=Ikd4Dj_1AAAA:8 a=20KFwNOVAAAA:8
 a=mahIxz4hQRZhQ-iHszkA:9 a=CjuIK1q_8ugA:10 a=HkZW87K1Qel5hWWM3VKY:22 a=WzC6qhA0u3u7Ye7llzcV:22 a=ZE6KLimJVUuLrTuGpvhn:22
X-Proofpoint-GUID: -6ok24GlNzEFfV5hN5U46qAppwQY-dl3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDExMSBTYWx0ZWRfX+VQrN8fpZO1y 4Gw88BnbMDDlT+2X7esXTFPC5jnCwB3zu+nfrbqn1Yt2/4qnvp5I3VMM+dIXNYPqC8fRKxtNtMF hte80dJC7G6jyUxSqaA6sDwgsyC/1iMkhCWwhw7LhChpiMY+PD+XLet7dhnVe/pjWyRT1RKFMvc
 0DCoUChnYgK+8RRbl3WU/jn1AcEc5PTfIqlKTCXlpS+G3FCj3+NsgcgPMT2GCn1S5S+4hpuJlJm 3yPTgjgE8vqU1Gh21RPfyvKJRmkvu4UFq4zFmTFENwqqCOzdYlAlDkYkntoz7bkKm1Y2D0Fy9j9 E9jvBeHk+i2/4hHzT/QkoNl35BF92jblMQnVtAw02IycU+Dt6+TbYq8EPiDVXgBUKrJE6IxHiY8
 Xcp8IYqL7Ct0aaYGKVfEN4UVVMJalTDswnW61hqpiZNmpWzAfko5pEYDUePxddwJDX+/o/RN
X-Proofpoint-ORIG-GUID: -6ok24GlNzEFfV5hN5U46qAppwQY-dl3

+Linus in case he has an opinion about BUG_ON() in general...

On Wed, Jun 04, 2025 at 04:05:44PM +0200, David Hildenbrand wrote:
> Especially once we hit one of the assertions in
> sanity_check_pinned_pages(), observing follow-up assertions failing
> in other code can give good clues about what went wrong, so use
> VM_WARN_ON_ONCE instead.

I guess the situation where you'd actually want a BUG_ON() is one where
carrying on might cause further corruption so you just want things to stop.

But usually we're already pretty screwed if the thing happened right? So
it's rare if ever that this would be legit?

Linus's point of view is that we shouldn't use them _at all_ right? So
maybe even this situation isn't one where we'd want to use one?

>
> While at it, let's just convert all VM_BUG_ON to VM_WARN_ON_ONCE as
> well. Add one comment for the pfn_valid() check.

Yeah VM_BUG_ON() is just _weird_. Maybe we should get rid of all of them
full stop?

>
> We have to introduce VM_WARN_ON_ONCE_VMA() to make that fly.

I checked the implementation vs. the other VM_WARN_ON_ONCE_*()'s and it
looks good.

I wonder if we can find a way to not duplicate this code... but one for a
follow up I think :>)

>
> Drop the BUG_ON after mmap_read_lock_killable(), if that ever returns
> something > 0 we're in bigger trouble. Convert the other BUG_ON's into
> VM_WARN_ON_ONCE as well, they are in a similar domain "should never
> happen", but more reasonable to check for during early testing.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Vlastimil Babka <vbabka@suse.cz>
> Cc: Mike Rapoport <rppt@kernel.org>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

LGTM so,

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

One nit below.

> ---
>
> Wanted to do this for a long time, but my todo list keeps growing ...

Sounds familiar :) Merge window a chance to do some of these things...

>
> Based on mm/mm-unstable
>
> ---
>  include/linux/mmdebug.h | 12 ++++++++++++
>  mm/gup.c                | 41 +++++++++++++++++++----------------------
>  2 files changed, 31 insertions(+), 22 deletions(-)
>
> diff --git a/include/linux/mmdebug.h b/include/linux/mmdebug.h
> index a0a3894900ed4..14a45979cccc9 100644
> --- a/include/linux/mmdebug.h
> +++ b/include/linux/mmdebug.h
> @@ -89,6 +89,17 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  	}								\
>  	unlikely(__ret_warn_once);					\
>  })
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)		({			\
> +	static bool __section(".data..once") __warned;			\
> +	int __ret_warn_once = !!(cond);					\
> +									\
> +	if (unlikely(__ret_warn_once && !__warned)) {			\
> +		dump_vma(vma);						\
> +		__warned = true;					\
> +		WARN_ON(1);						\
> +	}								\
> +	unlikely(__ret_warn_once);					\
> +})

An aside, I wonder if we could somehow make this generic for various
WARN_ON_ONCE()'s?

>  #define VM_WARN_ON_VMG(cond, vmg)		({			\
>  	int __ret_warn = !!(cond);					\
>  									\
> @@ -115,6 +126,7 @@ void vma_iter_dump_tree(const struct vma_iterator *vmi);
>  #define VM_WARN_ON_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_FOLIO(cond, folio)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_ONCE_MM(cond, mm)  BUILD_BUG_ON_INVALID(cond)
> +#define VM_WARN_ON_ONCE_VMA(cond, vma)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ON_VMG(cond, vmg)  BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN_ONCE(cond, format...) BUILD_BUG_ON_INVALID(cond)
>  #define VM_WARN(cond, format...) BUILD_BUG_ON_INVALID(cond)
> diff --git a/mm/gup.c b/mm/gup.c
> index e065a49842a87..3c3931fcdd820 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -64,11 +64,11 @@ static inline void sanity_check_pinned_pages(struct page **pages,
>  		    !folio_test_anon(folio))
>  			continue;
>  		if (!folio_test_large(folio) || folio_test_hugetlb(folio))
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page), page);
>  		else
>  			/* Either a PTE-mapped or a PMD-mapped THP. */
> -			VM_BUG_ON_PAGE(!PageAnonExclusive(&folio->page) &&
> -				       !PageAnonExclusive(page), page);
> +			VM_WARN_ON_ONCE_PAGE(!PageAnonExclusive(&folio->page) &&
> +					     !PageAnonExclusive(page), page);

Nit but wouldn't VM_WARN_ON_ONCE_FOLIO() work better here?

>  	}
>  }
>
> @@ -760,8 +760,8 @@ static struct page *follow_huge_pmd(struct vm_area_struct *vma,
>  	if (!pmd_write(pmdval) && gup_must_unshare(vma, flags, page))
>  		return ERR_PTR(-EMLINK);
>
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -			!PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>
>  	ret = try_grab_folio(page_folio(page), 1, flags);
>  	if (ret)
> @@ -899,8 +899,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>  		goto out;
>  	}
>
> -	VM_BUG_ON_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> -		       !PageAnonExclusive(page), page);
> +	VM_WARN_ON_ONCE_PAGE((flags & FOLL_PIN) && PageAnon(page) &&
> +			     !PageAnonExclusive(page), page);
>
>  	/* try_grab_folio() does nothing unless FOLL_GET or FOLL_PIN is set. */
>  	ret = try_grab_folio(folio, 1, flags);
> @@ -1180,7 +1180,7 @@ static int faultin_page(struct vm_area_struct *vma,
>  	if (unshare) {
>  		fault_flags |= FAULT_FLAG_UNSHARE;
>  		/* FAULT_FLAG_WRITE and FAULT_FLAG_UNSHARE are incompatible */
> -		VM_BUG_ON(fault_flags & FAULT_FLAG_WRITE);
> +		VM_WARN_ON_ONCE(fault_flags & FAULT_FLAG_WRITE);
>  	}
>
>  	ret = handle_mm_fault(vma, address, fault_flags, NULL);
> @@ -1760,10 +1760,7 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  		}
>
>  		/* VM_FAULT_RETRY or VM_FAULT_COMPLETED cannot return errors */
> -		if (!*locked) {
> -			BUG_ON(ret < 0);
> -			BUG_ON(ret >= nr_pages);
> -		}
> +		VM_WARN_ON_ONCE(!*locked && (ret < 0 || ret >= nr_pages));

Yeah this is neater too :)

>
>  		if (ret > 0) {
>  			nr_pages -= ret;
> @@ -1808,7 +1805,6 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>
>  		ret = mmap_read_lock_killable(mm);
>  		if (ret) {
> -			BUG_ON(ret > 0);

This is a really weird one... not sure why this was ever there...

>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1819,11 +1815,11 @@ static __always_inline long __get_user_pages_locked(struct mm_struct *mm,
>  				       pages, locked);
>  		if (!*locked) {
>  			/* Continue to retry until we succeeded */
> -			BUG_ON(ret != 0);
> +			VM_WARN_ON_ONCE(ret != 0);
>  			goto retry;
>  		}
>  		if (ret != 1) {
> -			BUG_ON(ret > 1);
> +			VM_WARN_ON_ONCE(ret > 1);
>  			if (!pages_done)
>  				pages_done = ret;
>  			break;
> @@ -1885,10 +1881,10 @@ long populate_vma_page_range(struct vm_area_struct *vma,
>  	int gup_flags;
>  	long ret;
>
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> -	VM_BUG_ON_VMA(start < vma->vm_start, vma);
> -	VM_BUG_ON_VMA(end   > vma->vm_end, vma);
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE_VMA(start < vma->vm_start, vma);
> +	VM_WARN_ON_ONCE_VMA(end   > vma->vm_end, vma);
>  	mmap_assert_locked(mm);
>
>  	/*
> @@ -1957,8 +1953,8 @@ long faultin_page_range(struct mm_struct *mm, unsigned long start,
>  	int gup_flags;
>  	long ret;
>
> -	VM_BUG_ON(!PAGE_ALIGNED(start));
> -	VM_BUG_ON(!PAGE_ALIGNED(end));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(start));
> +	VM_WARN_ON_ONCE(!PAGE_ALIGNED(end));
>  	mmap_assert_locked(mm);
>
>  	/*
> @@ -2908,7 +2904,8 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  		} else if (pte_special(pte))
>  			goto pte_unmap;
>
> -		VM_BUG_ON(!pfn_valid(pte_pfn(pte)));
> +		/* If it's not marked as special it must have a valid memmap. */

Nice to add a bit of documentation here too!

> +		VM_WARN_ON_ONCE(!pfn_valid(pte_pfn(pte)));
>  		page = pte_page(pte);
>
>  		folio = try_grab_folio_fast(page, 1, flags);
>
> base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
> --
> 2.49.0
>
