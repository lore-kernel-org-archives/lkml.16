Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE6954918
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284359; cv=fail; b=Ex8cTlBTcDoCMBvDXo79DHUyzIgcJ7rvWs/0dxuSwruiLf2P71o1TpNqqUbDcLvfkVO1/KZPRPJTyyLlKtMcDuhWYkVrg2WdZTv3A+MmO9cpYfgalq1nMxal8VpzjzsaIa1jmjiPcwe7tqmR3azh6JppTeFDy6DTuikFsoCmVKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284359; c=relaxed/simple;
	bh=C+MBnFb72SZzsfImrKh34lxYAtl2pxEn1t8nGXnsuIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hzVF+HMGMYGk2ja7QrCZgrdU05aVHrlyNxU6UntHrYDApLh1VcQny7E+v085BE0knirRPV7UvycbjTvPM2TaHOMn1opnscBNpf3ER087w65DZUJZtdIZtgeq4AuodmjFBR4Fa5ucvGKQuPRByXar68/chKvkHDUDj/1iV7KOK+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=cWEMIdoW; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=rwfVo/Rl; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="cWEMIdoW";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="rwfVo/Rl"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U84eps011293;
	Mon, 30 Jun 2025 11:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=C+MBnFb72SZzsfImrK
	h34lxYAtl2pxEn1t8nGXnsuIQ=; b=cWEMIdoWa2Sx+1bbJU7f6goHMhy6ajZcIS
	0/1Q42jqF/gh6VJb/tuysBAynzyF2kLUh4RWT+ZNSHB2QRiMSLjPDHnYGoI2mU8P
	Y4niYVWofmUcXAr8BgpByFPhsnBEd3zFzCSFhhkNbeKanTsCwOwG53m8FXBDWiSp
	LL39TKdFKBLRJDn+VJc2Zl6ICxehWcMk7N02r8d7IZFLXkA9czo1W4kM3gry3zCb
	QrXJwUvOUAPp3WZXhKPec0mv0o2rxRNR9lRsOnH1FSsWOHwfTADOo4S93RQvGUH3
	dDxysOLDVmwuaeK+LStZJbXQM4xHKL4aNmut2aPAVN3so+I/WQsw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tfab4d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:52:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UB79ZU038437;
	Mon, 30 Jun 2025 11:52:00 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u87tr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 11:52:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mf16VUfw/76uHHhj5rpYZ0AZbrvbDueKP2sSCzeMsvGHyFnwluQi3GEap51kz2BGOfO4SbuC5jrqAwJ6Y+QVNeLsb7VQ1x0GpCgOaWZp1ALfL57HzHiCcSidQTC3CGE1JT6doD9PbUXVBxBeOJ07Inr2yfw4sgr/r9AU7vIY3aPwhji4dSaVOvKqJnIyrs9ivFLfB76fZIXXPvkNiUNy8DBVuUTnWVWr6a213EEgjbdb+UfG1fGACF474l/TIQYgb3nc7U9MxPldeOrtr81O1Ju8w2HbhTrtwDYTvfYC2A2kl4V6VmvbTfCdkTB493+KjXAF467BJSyBNn0LxMnMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C+MBnFb72SZzsfImrKh34lxYAtl2pxEn1t8nGXnsuIQ=;
 b=s6lOPRuTyj1lZMFtt5An4d9TNEU7E/KTYC2UiFbh+ruu3bGZCNhzEdooid/bG9ATHiL/aUo9f8d1Rmg2kAa8elzHnprti+l7bBndTpJIfiYQo7iLic9Wnl+UuDF0g/hYNhI3FgzdJQ42gFxdAtMY/OFwJ/9c0IDryYedyF2/jzSR8wF99GnP3dCKuy/VEyyIMShraq4QbC3O93kjIo1eGxJe0AwBmWK7KxzRyyS8bj6y5F9TrXw7MXGaJZHAW9dboLFKJRvTgRcxzIxwTZQ61JrEYWVc2gi1cytnaKdwGYJBAbdi26g9fHINGCt5vw6czH3gXfiLeYufZYQOw9XkjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C+MBnFb72SZzsfImrKh34lxYAtl2pxEn1t8nGXnsuIQ=;
 b=rwfVo/RlmNr1UW+0sk3HxYyuS/SCc/89SSA2r3BsskZ9d/jV/qShbT5TPxTLSecvQE+Uum0XY47LN6L92eNMhElIpaIegO23Kjhq5JgcvUPlP8agSsWAQiMH6qkFvJG4LH/ZRwMRifrxKWQX2WfgcxXoFcnDkXdO2SNjhST6vmg=
Received: from BL4PR10MB8229.namprd10.prod.outlook.com (2603:10b6:208:4e6::14)
 by BL3PR10MB6066.namprd10.prod.outlook.com (2603:10b6:208:3b5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 11:51:57 +0000
Received: from BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582]) by BL4PR10MB8229.namprd10.prod.outlook.com
 ([fe80::552b:16d2:af:c582%4]) with mapi id 15.20.8880.021; Mon, 30 Jun 2025
 11:51:57 +0000
Date: Mon, 30 Jun 2025 12:51:54 +0100
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Dev Jain <dev.jain@arm.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
        willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
        vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
        peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
        baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
        christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
        linux-arm-kernel@lists.infradead.org, hughd@google.com,
        yang@os.amperecomputing.com, ziy@nvidia.com
Subject: Re: [PATCH v4 1/4] mm: Optimize mprotect() for MM_CP_PROT_NUMA by
 batch-skipping PTEs
Message-ID: <5038680a-1c7c-4e71-8447-38708662a275@lucifer.local>
References: <20250628113435.46678-1-dev.jain@arm.com>
 <20250628113435.46678-2-dev.jain@arm.com>
 <79a48c48-53b1-4002-a8b2-447e69d96e49@lucifer.local>
 <916304ae-abf6-4cfe-90e3-411d992d7488@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916304ae-abf6-4cfe-90e3-411d992d7488@arm.com>
X-ClientProxiedBy: LO0P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::15) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL4PR10MB8229:EE_|BL3PR10MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f376673-1036-4fb6-ebfd-08ddb7cc8376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kiHHEJuaZl2HPewCupkDiBpzgnnlDINoluIUO9m8JSUdNXWHVfB3NFT0o5Td?=
 =?us-ascii?Q?I4RCykvJ8Iydtj4luAyxjyrYJw8dNQalceOOrs07keDuHBfJ86Of93p6tHgN?=
 =?us-ascii?Q?I18apdQfEbqK6M9HXY9nRz7NwhI5FaZh3gVGFbAIRhY1/20k3C7avQqw7Sdo?=
 =?us-ascii?Q?xH+PE4t3wibUL9OuSViu4NpPWtzTlKQO1V4L/aFTPUnPMSQFBJBi8AXBbaxZ?=
 =?us-ascii?Q?bVwvEpcxFCFgKGzKjQVdKuuRTfUmR/uABUeQqX2c/KvhVg+xjmMQzjLsf3Hg?=
 =?us-ascii?Q?OK2v1fDKxkcRkoi3Cjn7yVYqP2FfUStmPUAqFFhxWGgNIu4BFs4moc2G+sS4?=
 =?us-ascii?Q?Zn0WgP1IbTKsKotQDedjBA8wxYOtbm94J+fLSdz4kpU7Wm4wcLa9TTIIWpXr?=
 =?us-ascii?Q?0lCOLQwXiYFsSDaNjniqE+PFNlXJ93hjJv+GBXoufw+ioi9Bg7MHZjZ8b75a?=
 =?us-ascii?Q?LxgPsb4Dpvs1jQXRB8OWGM9g9NP+B+6NB3w/lvUHumHFtfnzJ4y/uhqEUYFu?=
 =?us-ascii?Q?fiIV98O5aKeiG7QDTNGkuyxCqtgyWGYvLAqYI/mpjuLau0QrH2jQQ0jPvRx9?=
 =?us-ascii?Q?X8+yHDuEyGDTVBBr1IF4GxVGT+EhPUtkp4tXC5a6Ah5diLnY8VMVicd8h3F+?=
 =?us-ascii?Q?CUi0O6SjalcK60DxztyRlBpwf+jGohI4BPJXwHLHGS6t3cfjiytMikgNY3ws?=
 =?us-ascii?Q?cFaRGQsM2wuBT9i8GidMRKTw8gpYdBE12Vu+80zS/1sgem/HZpBxh5pJk3n3?=
 =?us-ascii?Q?meJedNQZiy46HHLoSI1N4dTCFE8tI5LwqSOWvEOM7HaFmRaE+DGao1BDGk1G?=
 =?us-ascii?Q?AXVnMyrB7yi6Zig5CCgtDb3X8eSl+YUTOa4JkI9w08M0R6tBUq3h5vUIKLFQ?=
 =?us-ascii?Q?FWrE2oPt4GZTAviNH0C/twSROa5CAm1Ag3qzLtFsk39Phi/nqV5yv2FNSx0J?=
 =?us-ascii?Q?9LL9phZc5CR2X+rnL1oeGHTIgBvfV3dIvLQAoydkKwo/ObVxVJrSQ9Rve9R7?=
 =?us-ascii?Q?EBon1lmfdM8m6MfDh4QQGHWpLQ3Bo2tKDZZEzbdx6mVT7WsI8PTkxxX3qMcy?=
 =?us-ascii?Q?C6bdc97FgismcTpYIng3tTiZt9Ggeb4ntll+Q0bRsGdedLcmp6ANB2noWWcX?=
 =?us-ascii?Q?+5pBe60Vv5j5wDGqQzwfnZTvdzQwA8kdgZxcRnxiDN3e/cb5WxgwB8omfWFT?=
 =?us-ascii?Q?i1rImhQbMhmXr+WWrjFZMQeIj+dryU5yr2WT0vGVWQvx5lxrHsjhCUJ53oQn?=
 =?us-ascii?Q?ygQQrLIet2ijhI/VPI3nm2jg0hzw1b2mjp1xNn6NgMU1EifnpIzeWXPuKZKJ?=
 =?us-ascii?Q?o5H5eiKsyxd3+xd7Hvdhgnx5NNyx0L95rD8lxw486pSCHA20dqs6uCIHuZqg?=
 =?us-ascii?Q?24ui+P3ZBcmZBZB6HJATFERQsLqgItSDT8k++Zw1vaXXRK3SguHkjima7oqN?=
 =?us-ascii?Q?IiddFv/wEYY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL4PR10MB8229.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Hqgnkf4Qj+i2cGCk3kJKveej63OrnVjOoO1JsalQK8wjlXhB1P+JzPyhbHNX?=
 =?us-ascii?Q?92hiy1uR127q0beu3iIClGntuRSeMuiZfyH2rfqwEVNY/82e/nF0mB8QvCMU?=
 =?us-ascii?Q?dMAkQhYQibrIgCri/3olXndLaSshuwKPfxDfOzupPwcnt9cPWfPG/eYT8+w5?=
 =?us-ascii?Q?Nq85PascO7RM128wkKfBOm+0dyf7b2iX2AI3X7T0T8QmWSkXyUwMo9rzfGqD?=
 =?us-ascii?Q?qqFL1vNIYqpbX0Xj6Xa12T0EaMLRmARfDDOCbodoyflwc4JxCn/tqfZPSNT8?=
 =?us-ascii?Q?oIuZu6Xe1YRDQh3shWbuGaoLCsiLOQU2UgoW28U1rPpY9cIDmck5qcyV6Erd?=
 =?us-ascii?Q?XVXmgEh3qsKqndd8ukfgAbUmQLnps9vCQKpygsXE2Jal7ChVWzLcurnXbn68?=
 =?us-ascii?Q?jNzVzeEzBwz5TQDVB5UaCjdPjTbogyhHPKnw/YzRRAIpWPkd8f8Ym+7c79eI?=
 =?us-ascii?Q?ndxXUAPSrCUKW9VowPUtmapjZmSuvlBXnAzkjjERDT00xKPxMQnXKDhfxt1J?=
 =?us-ascii?Q?XIUC66UHHy50YSKznLJlICOowx2bHmwozl1ChiItC8ejOw5bBP2qB6AAxD+W?=
 =?us-ascii?Q?GuvDfzTSa2PypFUH/3v2Y3i+mSDP5XHiNMjvT8aWQ2swZFGPgeskmV54FWJX?=
 =?us-ascii?Q?bTqEkCThFT0m01Bi4E7m+Y3W7mVpOTAIFp0nBzT+afZ0LhDTRv7xUJH7l4zo?=
 =?us-ascii?Q?DiwBvCbQHFIh3HJDf2fYzeOY6aFecrA9BVgumJk5sL1RkT7nbWJLznPlsyEq?=
 =?us-ascii?Q?AZi3yv5P5KHwdBI69eGy0HNdUSv9ZQqUSPfar/PS0vjRlUp0KKku1E+eXtpQ?=
 =?us-ascii?Q?wujsSA2+qb8POajE5eSwNBcoayiSN9aU8FjyhdkrywQJFVTfMTZfeDovdXJc?=
 =?us-ascii?Q?6wiesYmxckuIRcrcBw7EgFVvtL9/H0P6UKS0coxq0eyBkrxGzW4/6qlpRPh6?=
 =?us-ascii?Q?dyv4pX0bLh43tc3bWVgwvzus7NRS/acM0JJLlToOOGGAHn8FO9dYU65IQaH/?=
 =?us-ascii?Q?VEvJe7QILYmgMF+PNfxphN73i0dZ9nMJUKGYFHEVkjhVAYM//TEgsSFrOMOO?=
 =?us-ascii?Q?bVsxkUmFJVYgkZo8WxCO72xBazFwSO9d8/1/vUk9/UwIdLjPL6v3jYLg00JG?=
 =?us-ascii?Q?ixKLLJSf/GehfRxTb79h+D5o1lgYWyHZWfTzHIe9PtQ87FQI+aOnRHV/vaWs?=
 =?us-ascii?Q?00rym3MMnZdU3nfuixtvRUVBFma/gXNd8uo3Y+xBTPAEf6nj+tiRglGU7BPa?=
 =?us-ascii?Q?4As36qdT84vmhqnZ8lPA9FLA+rlcJkiK/7t0kXn9whNNWP0oHyaK2I1b4ZUJ?=
 =?us-ascii?Q?hnv8KNAIDQcaUa50PfynAcbwqzRJ82bSvijcjjS2mI7R14JYLeedBTy9AYxM?=
 =?us-ascii?Q?dXlj4vuBhEufJdTvcJNNe6Sv5i+r9N75ZZnsapKB6boN+9dAX0wQn627r1sl?=
 =?us-ascii?Q?2Trb0iZrKuzCDsB8CV9aZbv+ZnyQPMpYY85TPw6zzV1VBZGz3Ygl7VDc4F85?=
 =?us-ascii?Q?3C/lE58V3jLQs6AhQ2lKvk94QaFlEwjPUiQOAG+QdCPNKJYO5Lrynvoii/qD?=
 =?us-ascii?Q?9b1oS9gFjhUicxxJZHy1/Mbh/JjzmMHewwpyu9m56bDYkYCl7bjQjvD+Ij1S?=
 =?us-ascii?Q?ZA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	9KGp0Hho2+TIx8OnJqZpwVRtGYD3/8QkdQ7wiAgMFmn4xt+nCABcaN/o6W/brMtKFFjHuDAHUgFGs79KEBWZ6aLUX9wZq/JVbYwBZ0ntwScHhuhInw2qcHvK1DP9M2jt/MANV5s4kRtCLwJWaMiiEwls6ycrScDlQlAgcXu1nf0aJSLnK3ARUToqoqjzf4y6Vd/tEzgqVunq+gv3IcY6Ww1n2cM+wzmOVr9j97vgTvkI4/NWCJIZZhefPm6OYWrB8YSb09Tz58bGUqkWO0lIgn8Dky7Xd5MrB/+FSzPGrpjg8GBDm/1U9QDLrqtQz7SA2Q34cP5u7aHVomnN1IIAq1avfu4Hy0PtSUaVCxcos7ue1oYgezfepOMjv2ttR3h9lLk9TW6LFez4086EnVvYoJuZ+UgIcQqxs7Sw6gis4d6z0gZgYUJGqU13Ur3gn+oK5mX4LQcp8S3tD4TNre5oUSMONIAuAiG7EB7e9vZGNb3139Kp48Z6zUcstx+gymKqbfFA19b4skgo0kOgLU0TByoNwxwAb1cGPHsfTdVzTX6B8UdG3r6TpZlEflJjzVYNJtrtU9dPA1f5WJhbkcXoXVtWXpTsVs7nHDJiKzgGCsY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f376673-1036-4fb6-ebfd-08ddb7cc8376
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:51:57.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11nX0cIUNrL7qGzUU4zj4mMCsSYcpuZEK5++Mq2tAHwRZQA3iP+C76I485NBqwdE+Bq/Gsf65OsBbEKG5jxVhN+9H5C1n5AwkPAT+LmQYcI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR10MB6066
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506300096
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68627a62 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=008yg5ouLrPad9MuOxIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: oJDGX-tEZjBoh17CN6P13k6y66PNzkKk
X-Proofpoint-ORIG-GUID: oJDGX-tEZjBoh17CN6P13k6y66PNzkKk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA5NyBTYWx0ZWRfX6VH/P0/IkZ3+ jW4HYynckPX7WHzWy+j6esdVuZNSYShnkZpHHWiInjfOGfCQclo7eLnvrmYFJ9b83bbl5xwSzZm 0+GcSBeBEPAcV6MYrYAe56zw0A0NePyoxWI6rRNbe4kThyAG8JsWWDI6er3HNqnhhx8pgjRwIxR
 A9+5gWej17oHSNSPAlr/2fg4+ZzNajW3Ugj5a46ykQsJ8xuh0SlkiYgaD+W4Aj6WtgaOMHtvvgQ 7yrOGZoqk4ablFYWCBPBQ5bUhhAlUI16etooiyGkwBBghJZ2ftbsmMmY9Hh771XdJAIa1RtSfwA JW+XhSUkf6Z7YN04VYyxXniYmy3f9sX2sIb1eBau/QAaaIb9g84bPEB20OrNc2Hp5sG86CEPO9b
 ruzteN8fyVWu9d4sNuJC5clQ18GWs/dyJa0QeBOViWObJc3bEGVWseBcPWQ4d2SVQcPZCAnY

On Mon, Jun 30, 2025 at 05:10:36PM +0530, Dev Jain wrote:
>
> On 30/06/25 4:55 pm, Lorenzo Stoakes wrote:
> > On Sat, Jun 28, 2025 at 05:04:32PM +0530, Dev Jain wrote:
> > > In case of prot_numa, there are various cases in which we can skip to the
> > > next iteration. Since the skip condition is based on the folio and not
> > > the PTEs, we can skip a PTE batch. Additionally refactor all of this
> > > into a new function to clean up the existing code.
> > Hmm, is this a completely new concept for this series?
> >
> > Please try not to introduce brand new things to a series midway through.
> >
> > This seems to be adding a whole ton of questionable logic for an edge case.
> >
> > Can we maybe just drop this for this series please?
>
> I refactored this into a new function on David's suggestion:
>
> https://lore.kernel.org/all/912757c0-8a75-4307-a0bd-8755f6135b5a@redhat.com/
>
> Maybe you are saying, having a refactoring patch first and then the "skip a
> PTE batch" second, I'll be happy to do that, that would be cleaner.

OK apologies then, my mistake.

So essentially you were doing this explicitly for the prot numa case and it just
wasn't clear in subject line before, ok.

Yes please separate the two out!

> This series was (ofcourse, IMHO) pretty stable at v3, and there were comments
> coming on David's series, so I guessed that he will have to post a v2 anyways
> after mine gets merged. My guess could have been wrong. For the khugepaged
> batching series, I have sent the migration race patch separately exactly
> because of his series, so that in that case the rebasing burden is mine.

This stuff can be difficult to align on, but I'd suggest that when there's
another series in the interim that is fundamentally changing a function
signature that will make your code not compile it's probably best to hold off.

And that's why I'm suggesting this here.

>
> >
> > I know you like to rush out a dozen series at once, but once again I'm asking
> > maybe please hold off?
>
> Lorenzo : ) Except for the mremap series which you pointed out, I make it a point
> to never repost in the same week, unless it is an obvious single patch, and even
> in that case I give 2-3 days for the reviews to settle. I posted
> v3 of this series more than a month ago, so it makes total sense to post this.
> Also I have seen many people spamming the list with the next versions on literally
> the same day, not that I am using this as a precedent. The mistake I made here
> is that on Saturday I saw David's series but then forgot that I am using the
> same infrastructure he is changing and went ahead posting this. I suddenly
> remembered this during the khugepaged series and dropped the first two patches
> for that.

I'm not saying you shot this out shortly after a previous version, I'm saying
you have a whole bunch of series at once (I know as I'm cc'd on them all I think
:), and I'm politely asking you to maybe not send another that causes a known
conflict.

Whether or not you do so is up to you, it was a request.

>
> >
> > I seem to remember David asked you for the same thing because of this, but maybe
> > I'm misremembering.
>
> I don't recollect that happening, maybe I am wrong.

Yeah maybe I'm misremembering, apologies if so!
