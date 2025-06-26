Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012007.outbound.protection.outlook.com [52.101.71.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FE0A43159
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909774; cv=fail; b=Ha3vGN0Cme+EqHiyW9B9oCmxqqaS9AzzX03o1Y7c4elAlwWUrnq4wlx0W1dgZvKU6tK7IeHX58uXIcN3Hq7uO5fxZip4xcakL6XNESCTSK4lyngYtIyGupYM0/RKMz+isI8kZEycrECICXVab2svvvU698iAPGBgFuYvovP5jlY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909774; c=relaxed/simple;
	bh=KQwAS5O5Wn92JWpdDfYRw+hmdmNbatjh+XCnioLOCDY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BAw9YklVOJHLBRCRdNXO4L/t34Q5ffvYou+ATI2o1kiwf27qhlxpnIWYlQv6VOaRU52WlFIBNbgo0msQUelybPwdEq4rgN3WMMvRxOufcGQ48fFSlsbSXH06DuBxxOJHYaiu4asnAYYrVt/BLc009uiIJaudar07eNKmVOhttNg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qjYz5qSy; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qjYz5qSy; arc=fail smtp.client-ip=52.101.71.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qjYz5qSy";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qjYz5qSy"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=H7qYHKJb6iiGC0+bJKTEEzOlP4flwfJqegPc/iO0gvF7x57Mk/LZTWLsit+dbf/zQmkm9s7Zs2yIJBITBEqA59K7IbvS7A5PP64G/FfeYGpTJ2zqogyCyujxom7XiizKMgCAehjR0ijh6enEHMfswnwnZLnjjRU8YY2pxJonG2cejzrjiTYYRFaeRfMUxNrHKuXeEqMgI1U1DFxtLpvhui/Jb6btH2u3dzq6bVpvyBDoz4kHwMGDm7jvRr8257ZuZjxidM1Q6JgNfkCpfTYHJ8Ub5KPUWOwp2ujYEb7JOqIUFcCILAhWnj0swdk8NS5xHOyHrtmmtsEmREeZVMPrkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlKuQg4DYFmXFHYP2fkT1Ivo4AmrQMejrFoPwIbS+Jg=;
 b=NOSmsT6Jl+a1uuejUbRpp0Wjy+9QD3CVIrThs+bLRQGo6pWRk71OUO6NlnCMRqUx8+9Ie4P65ssv6rCJHKVJI8SNDjDH7z1DtFubghPzDSyJWK0GUMUAaVNNqZVGLtl9w3wpKGG+uDZHYA96EgkPJT9D19Xio6ZDlkV4ID1pEpDcRAXCy/FvNgSk1jeuDWlXTH7RdkJpSK/EP+nB/kSw8LX0Y3PZ4hcUI8UKy74PzaAoDJd1SPLRtQlwA1cDrrqHzHOSvc4kaJAJKTt4WY+ArdPV68hiyhaU5w1DW2OqSm9xwDpIDlrTQd1Wlh/I3oEP16l+e8ICOlFpMpGZA6F58A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlKuQg4DYFmXFHYP2fkT1Ivo4AmrQMejrFoPwIbS+Jg=;
 b=qjYz5qSyoNz8Bp4qWkYL5C1GZiGB02dmRHSpPDXPVo0UIEuXmqCUBfPB3ZDtVXaKlJjN032a37N801bJbZnMI2Y19+Cw9A1veuK3vijfY8y+9vT3+93aN4jHnywqeQO24g2pnRaZoeotFVYV7eF4Y2XLi4fVH05cTUAOhT7K+4M=
Received: from DUZPR01CA0104.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::17) by AS1PR08MB7586.eurprd08.prod.outlook.com
 (2603:10a6:20b:472::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Thu, 26 Jun
 2025 03:49:26 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:4bb:cafe::5c) by DUZPR01CA0104.outlook.office365.com
 (2603:10a6:10:4bb::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Thu,
 26 Jun 2025 03:49:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 03:49:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+LTlVr2Ah3dFLJXvb/HXmfDklUVlMx0/lStczdCFiGVRm/BC7vPvEStGZmquoGQ18af0GKa2jS0lOiMLH+DFE+GQzrT8xfhvwdWZHNsAbCo19go3B00TFz53DmiCMBrNmpzKDYvT//hQzIHDN+QW+iwi8k8TkZ+l6CBaFTXXDFI57dlrlfppQ7QCdg6GgjBZDNgCDoa+/+Ygl3SVzbIPSoFowXnlKp0HH5w+3MGzIq908exExrI1FaL2lcqNr43SJIBZiu4eb60tRMMowAHy8jCkIVGJquB7g9GGIsYPpwWTmZKAr1X99wt2yRZVsnQGvbE56AMpK9n4DiiPoR89w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nlKuQg4DYFmXFHYP2fkT1Ivo4AmrQMejrFoPwIbS+Jg=;
 b=J+NIz56wInIzQWXnLgRxiPzovk5JMYDtL1zXpcrnM1A+cFr3G4fuP0I6TINCUR9bnciaCabWP1yx3l3wKhS5CrCUwWv/GD4JGL62Nk+lX4BdSha500xb9865y+ckZd8FzEznO1JqchiVUGMQf8J4iGZG+FdSWiFFsiT0uVzbNv+8bJGAISPTFa6YfbvBPsWknWaHcPQGwImzi01S936fRHSu5V26aORL5SRw9gzyvQUXSODAXuDSO/1JjQU1SWdW2R0CoooQthuvmpUi21o22CeUkMbjUlXMBdv1L4ZPUP8TLW80VhtjdWo9V3eOcYZ+sMUw49yIsB86hwuLhh5uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nlKuQg4DYFmXFHYP2fkT1Ivo4AmrQMejrFoPwIbS+Jg=;
 b=qjYz5qSyoNz8Bp4qWkYL5C1GZiGB02dmRHSpPDXPVo0UIEuXmqCUBfPB3ZDtVXaKlJjN032a37N801bJbZnMI2Y19+Cw9A1veuK3vijfY8y+9vT3+93aN4jHnywqeQO24g2pnRaZoeotFVYV7eF4Y2XLi4fVH05cTUAOhT7K+4M=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6005.eurprd08.prod.outlook.com (2603:10a6:20b:298::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 03:48:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 03:48:52 +0000
Message-ID: <8109236a-9288-4935-8321-dbff361dc529@arm.com>
Date: Thu, 26 Jun 2025 09:18:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] khugepaged: Optimize collapse_pte_mapped_thp() for
 large folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-3-dev.jain@arm.com>
 <71350398-b5d8-45b9-b05c-d2b63030f766@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <71350398-b5d8-45b9-b05c-d2b63030f766@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0165.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::35) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6005:EE_|DU2PEPF00028D00:EE_|AS1PR08MB7586:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e6eaca-c20b-43ef-ece6-08ddb46471d3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ZCtlQ29VdGZud2hsYnVycEJ5enpOQTd6NGs0VDBoTGoxOXlNNUd0Q2tIaStm?=
 =?utf-8?B?NzBVQ3N6ZkFsbGM2QVFidmE4cWRQNlVqelR0Si85NXJRVnUvY2doMlV0ZVZn?=
 =?utf-8?B?clVBVGxrSGtnQitHaHJBZkZuNkhQS1Uzam1xSHR5WlhOVHExK1dLMzQyWmpO?=
 =?utf-8?B?SUJ4U3NENmp1VHpUeGFLUHNTUWZTU21jSUJtd0puTnJ5OXlqNSt3TVE4ZWEw?=
 =?utf-8?B?RlBwNGNnN2lEbEFBc1FXb0dobU9BMUpPUDE2aXJ4WDBKUklMall1ZGl3cjRs?=
 =?utf-8?B?TVZFZkltcmlvbXVLRzExMUpFVVFNSlk3YUdBWWt1TFFaQVI2OXIydmNsRDlS?=
 =?utf-8?B?djlxa1hLSWdTK09KcDBQZlRWSFJ0QktoSXpsY0RydlNNczRHVW1jTlBnL1l2?=
 =?utf-8?B?UWxkNy9vNEZCMVh5OXNoU1hYOGJPTDlRNlROQTR1RS9mTjF5c0RqOHFLYTdm?=
 =?utf-8?B?WjJFbE0yWm5xaWlOb1BoWjZSMzlrZWMzdm56QjduQ3F2N3YrSEs3eDRHdnhY?=
 =?utf-8?B?MlFPR0VXQUExUUFvVlBNT2pDSkJGSmEySW9YRDNkdlFmNWZkaUNaMW9YbE5w?=
 =?utf-8?B?bXp4M0plTjZEcGxtV1dPOURqU3cvNFJqdElYZy9FS0NlbEo2Lzgvdyt6eU11?=
 =?utf-8?B?NHZhaHBIZ251ejhiZllyRnpoVHQxcHhqNXp0bFhzRjk1RGJuOXYzbENhejJK?=
 =?utf-8?B?QVJRRGpHZm1rbmppMEdIeFhDbmFxUEVFWVgwaHhSUFFkLzB4andRUHRjeUtZ?=
 =?utf-8?B?SitLQzltTFFwRjI1bDM0ZVRicmRVa3BKWThJQnl3dnphVXZwTDFQN1FoL2t4?=
 =?utf-8?B?WFJ1VElhMkgybFV3RW1yb0FOWmlSbkpvYy8rWExzQUc1QWtwbkViS3lCZTNs?=
 =?utf-8?B?U2g2VFREVjc3ZTMxUFRJQnkzdHNSR21RRHRzZ1JnSkNSQkRENEpSb1U1NlFL?=
 =?utf-8?B?akpJYk0xa1c4akRTMzM2ZkZGTUYrSEhrd0JnRHhRR0p0L2R6VmZaTW80T0Zs?=
 =?utf-8?B?a0dZZ0lTdkdPb21CUWE1WFhlMVptcnVzWnJOOGgyUWZ6WFVIdlNrK1VIZy9O?=
 =?utf-8?B?NCtZM1ROYTZ4S2NDWkxaWS83VXVEZlk4aE9DdXBMUXd3NkVlK2tTYm5jNGpX?=
 =?utf-8?B?WHJMNUlwcXllRE5TWFdOMUI4WUtoMmZXNTgrRUtOaWVxQ2taSWhPeXhmM0w1?=
 =?utf-8?B?QWcyeS9BNUNaSFp6SUtNYTVJS05PK0o0aS8vYW5JZzk4Z3UxeHN1OHM2OGdz?=
 =?utf-8?B?YlBsRlJEb3Nyc3Y1ZkVpY0o1TDQ1UlpUVFExM2M1aTRKbHBLSXVwRXFOTHls?=
 =?utf-8?B?WEZIQ1ptaEpVbmI1M29nNGNmT01nR2hrSUZXS2RVNGtVQ2ppNkhKSzdJems5?=
 =?utf-8?B?Q1AzdjNRZ0NvTEpVVG00TU5qVFREdk5hcTladFVMTzhWa0QrRGhSdEZYQ0lK?=
 =?utf-8?B?WHBFVXZva0NqN2tUTmJ5Vm1GWmh0bGt0Yzl2d1RqcEZ4bUNMQjNlYWFNSDMy?=
 =?utf-8?B?Nnd6dFp4UVkvS21pYXhHanNwWXFaSnpyTUtnQmpMbkNkL1JBUmRESkM1dXJp?=
 =?utf-8?B?RVBNRzF5TFhVSHF2bWNpV1ZWa3dlYWhvcmVzL1ZQUjRGcDRqYVNzVUQyUG11?=
 =?utf-8?B?RmVHcVMwbzdVU2VNUUpaR1QwWEFCcGROVlNvNzgxa1c1QWNRQ1RyNUVNdVNY?=
 =?utf-8?B?VlhraGxXRGdFekFiWXpPNHU0cWx5ZSsxQ3ZWOWxPbzN4anlUbW5YSDI4RFZw?=
 =?utf-8?B?eDBWMzAxcHVWRFF6RUlPN1h5elhOTGtialNiZEsyazc2WjJHc054MDFlMnR3?=
 =?utf-8?B?MVdpU2Q2QzFCaFhVdVhjYUVHcmt4VlNPZTE2RG9qWUlYV2dhcUZRbkVjK24v?=
 =?utf-8?B?U3lWUVFLMVVNTm9TaGl6ZmJjTW5IQ2t4WFVWd0Rla1R0UVE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d7ae5ba7-1be8-43e8-9766-08ddb4645e36
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|1800799024|82310400026|7416014|376014|14060799003|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K0dQcG5QZnFVZWVRNWNvN2VvM0Q2Qk1yUFZSS3FYNXZTWm51NWl5RkJNRkJt?=
 =?utf-8?B?elhBN25VbkwrTTZKKzVsTWh3NzRDejZXSHQ1NTZobWtmeXpCRHBQdkIrNE5O?=
 =?utf-8?B?eVY4eDRsUUZFU2JUVWNFUUwyd0VwaTh1U3FIVUczS0NrNG96S0dwWi9adXVj?=
 =?utf-8?B?aE9Ub05IaTF3eE90UjVDZ0lmeEczV1QrZ3pOcVd2bGhRTXIybFBZMDRtNnRy?=
 =?utf-8?B?OWpOc05UelJ4dENXKzlPS2tXck8zME13c2R2MHFnS09oc21NdVpyRVd4dFgr?=
 =?utf-8?B?OGEvVjNEVmZkZzhZUjRBZ1NRTXVWN01qS0VWUXdxY3Y3VkpKeGVBWjU0SXo1?=
 =?utf-8?B?Yk01MUlvaUNncTQwVWtVQnFjS1JDK1lPQUw0V0dXMXhCMUdiWTk5VFpkUHVU?=
 =?utf-8?B?L1Zld0RCYmhMNzBxckFpM3RrS0cyQVFvSnpXSk82T2c1WVMrUy9UZjBmZlRt?=
 =?utf-8?B?THo5UDErU0ova0tFUEM1WVVyMENGUkhIcHNyR2YxckI0SkFvYWdycHlaQnFI?=
 =?utf-8?B?Zk5vNm1SME5hWWhqZmh6LzM5VCt5akVYbGZEcXB4SFN3TVNHU0s5UThQZTV3?=
 =?utf-8?B?QWVCdGN6WjNtbysrdjNwWFY5ZEZ0MVI0UVhCbUF4aTVOLzN2N0k2dE1MeUgx?=
 =?utf-8?B?Q1UyeitsVllTUWNQWjh0QVhlVWRkSE81RFBSQXErSkhrMVJQS2w3dHVyWDdu?=
 =?utf-8?B?MnNUTUIrT2RGT3BLRkErSytoSEF4aUdGZ1llcWo5WGZSRWNoOUd3MURTQi8x?=
 =?utf-8?B?MnV3dmMyWXRqQ0hVMVF0MXZoVGhZdm9KZW13SHAzNmYvVkY3dEs2TUY1akZV?=
 =?utf-8?B?a2pVSEZjSHJEUkVHN0dxRHZxdlgyTXRqK2xVQmRJbVRDVExYVytpWGFKalBa?=
 =?utf-8?B?TXFrV1M5SFovTDY0VUtuc3lvSFk0eWtYd203d1RVNFp6V1dQQnNKQmVzNHp0?=
 =?utf-8?B?b1F1SlN0T1hHOVhwUzJYZFBnYWhPV05oTWY4ejBZWmw4VVI3cmU1cUlCZEJI?=
 =?utf-8?B?Z2hQMHd0eXcvZ2t5ViszY2xaKzcxSVlwR3hDaENkTjFidlhCWFdzRHN3ZFU4?=
 =?utf-8?B?Uk81TFhzYi9WaCs3TEV1Zy9TQlByMlNNbFJJd2x5dVRtM1NxRzJtYzlOK1BK?=
 =?utf-8?B?OWptb09WdnN3eHlrc2R4Y2ZYb3pjb3hnc3U3RGZPbWdRQnAvanBIZmpqWEpq?=
 =?utf-8?B?Y1VMZWg2Z2xwcUZaVGVWMkx5L1lVdUZFRkxJdE1SS01yV3pmdXF3ck1tTzBF?=
 =?utf-8?B?N3JCYnZPSFNZNlZYNllWczBRK1QvdEU1c1YrU29ucFdmRERmTHZ1OU5rdm1O?=
 =?utf-8?B?cWVBNnlSbld2LzBPSDIwbGtFcnBvMDVxOFBrUjUvdTZmUjVHRjV2TFg3dGNy?=
 =?utf-8?B?WHdaeGJ6Q1Bta3luOS9GQkFGWEZaeTNsY3JPWW5iTjZtU25xNkdaS0FmVFZn?=
 =?utf-8?B?NFNXdGw3WHpiUUc0Z05TR1RicWVCTm1pWGRJVW0xYXJDUmIyeGxSYmhkWDBz?=
 =?utf-8?B?RVNzYkE5UGV1dVg1VHBGbWhlSThrUU5sdnVDa0pzVlFORnVvY0JqMnl0R1l1?=
 =?utf-8?B?SmlSK0dYdjM3VTRhVUlRTXhJeFpJOC9nZTB3eWpSY1RydWFha250WFkwbm15?=
 =?utf-8?B?SGw0TTlnUXhpaForc1ltUjNSU3dYZTM5MFFUOGUwdVYyK1doNTBFeUkrdnl1?=
 =?utf-8?B?Skk5Y1JWaXVjNlNkU0h2SjkyZ3dUNlhVRkxkdkxsTVEwQVhZSllKemxocGgy?=
 =?utf-8?B?V1AxaTh6TUp6R3FGSFQyS09RN2xiY0lHVmdwUUlsa1hwYS84a0FGVENhMmYr?=
 =?utf-8?B?YmlhWlJXdVMxMmN2cGhpU2lhRUZjQisvSlZEY1RvWlhPdWE5MS9Rd1VoVkN1?=
 =?utf-8?B?MFR2UEtwU0kzNTZRY2lQZUpYem93WGkydjhtZWRRRHpPeDlvK0NnWW5KOW9q?=
 =?utf-8?B?MFJ6MmhMcW96SmVYMC9zRHgxbHZCT3lFVHhWT0NReDc3Y2NrV1VuMkdnUUtC?=
 =?utf-8?B?MnFHenkwU3dBUE55RmFBZERJemxPdU8yYm5VcUNCeDF3eDlaOEoyaDJvbmgz?=
 =?utf-8?Q?9ou3WU?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(1800799024)(82310400026)(7416014)(376014)(14060799003)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:49:25.4825
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e6eaca-c20b-43ef-ece6-08ddb46471d3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7586


On 25/06/25 6:41 pm, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 11:28:05AM +0530, Dev Jain wrote:
>> Use PTE batching to optimize collapse_pte_mapped_thp().
>>
>> On arm64, suppose khugepaged is scanning a pte-mapped 2MB THP for collapse.
>> Then, calling ptep_clear() for every pte will cause a TLB flush for every
>> contpte block. Instead, clear_full_ptes() does a
>> contpte_try_unfold_partial() which will flush the TLB only for the (if any)
>> starting and ending contpte block, if they partially overlap with the range
>> khugepaged is looking at.
>>
>> For all arches, there should be a benefit due to batching atomic operations
>> on mapcounts due to folio_remove_rmap_ptes().
>>
>> Note that we do not need to make a change to the check
>> "if (folio_page(folio, i) != page)"; if i'th page of the folio is equal
>> to the first page of our batch, then i + 1, .... i + nr_batch_ptes - 1
>> pages of the folio will be equal to the corresponding pages of our
>> batch mapping consecutive pages.
>>
>> No issues were observed with mm-selftests.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 38 ++++++++++++++++++++++++++------------
>>   1 file changed, 26 insertions(+), 12 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 3944b112d452..4c8d33abfbd8 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>>   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			    bool install_pmd)
>>   {
>> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
>>   	struct mmu_notifier_range range;
>>   	bool notified = false;
>>   	unsigned long haddr = addr & HPAGE_PMD_MASK;
>> +	unsigned long end = haddr + HPAGE_PMD_SIZE;
>>   	struct vm_area_struct *vma = vma_lookup(mm, haddr);
>>   	struct folio *folio;
>>   	pte_t *start_pte, *pte;
>>   	pmd_t *pmd, pgt_pmd;
>>   	spinlock_t *pml = NULL, *ptl;
>> -	int nr_ptes = 0, result = SCAN_FAIL;
>>   	int i;
>>
>>   	mmap_assert_locked(mm);
>> @@ -1621,11 +1622,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   		goto abort;
>>
>>   	/* step 2: clear page table and adjust rmap */
>> -	for (i = 0, addr = haddr, pte = start_pte;
>> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>> +	for (i = 0, addr = haddr, pte = start_pte; i < HPAGE_PMD_NR;
>> +	     i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
>> +	     pte += nr_batch_ptes) {
>> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
>> +		struct folio *mapped_folio;
>>   		struct page *page;
>>   		pte_t ptent = ptep_get(pte);
>>
>> +		nr_batch_ptes = 1;
>> +
>>   		if (pte_none(ptent))
>>   			continue;
>>   		/*
>> @@ -1639,26 +1646,33 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			goto abort;
>>   		}
>>   		page = vm_normal_page(vma, addr, ptent);
>> +		mapped_folio = page_folio(page);
>> +
>>   		if (folio_page(folio, i) != page)
>>   			goto abort;
> Isn't this asserting that folio == mapped_folio here? We're saying page is the
> ith page of folio, so why do we need to look up mapped_folio?

We need to check for all PTEs whether they map the right page or not. This may
get disturbed due to mremap and stuff.

>
>> +		mapped_folio = page_folio(page);
> You're assigning this twice.

Forgot to remove, thanks.

>
>> +		nr_batch_ptes = folio_pte_batch(mapped_folio, addr, pte, ptent,
>> +						max_nr_batch_ptes, flags,
>> +						NULL, NULL, NULL);
>> +
>>   		/*
>>   		 * Must clear entry, or a racing truncate may re-remove it.
>>   		 * TLB flush can be left until pmdp_collapse_flush() does it.
>>   		 * PTE dirty? Shmem page is already dirty; file is read-only.
>>   		 */
>> -		ptep_clear(mm, addr, pte);
>> -		folio_remove_rmap_pte(folio, page, vma);
>> -		nr_ptes++;
>> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, /* full = */ false);
>> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
>> +		nr_mapped_ptes += nr_batch_ptes;
>>   	}
>>
>>   	if (!pml)
>>   		spin_unlock(ptl);
>>
>>   	/* step 3: set proper refcount and mm_counters. */
>> -	if (nr_ptes) {
>> -		folio_ref_sub(folio, nr_ptes);
>> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>> +	if (nr_mapped_ptes) {
>> +		folio_ref_sub(folio, nr_mapped_ptes);
>> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>   	}
>>
>>   	/* step 4: remove empty page table */
>> @@ -1691,10 +1705,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			: SCAN_SUCCEED;
>>   	goto drop_folio;
>>   abort:
>> -	if (nr_ptes) {
>> +	if (nr_mapped_ptes) {
> I know it's ironic coming from me :P but I'm not sure why we need to churn this
> up by renaming?

Because nr_ptes is an existing variable and I need a new variable to make
the jump at the end of the PTE batch.

>
>>   		flush_tlb_mm(mm);
>> -		folio_ref_sub(folio, nr_ptes);
>> -		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
>> +		folio_ref_sub(folio, nr_mapped_ptes);
>> +		add_mm_counter(mm, mm_counter_file(folio), -nr_mapped_ptes);
>>   	}
>>   unlock:
>>   	if (start_pte)
>> --
>> 2.30.2
>>
> V
