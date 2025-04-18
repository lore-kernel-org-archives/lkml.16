Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2084.outbound.protection.outlook.com [40.107.237.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CA1275868
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744982766; cv=fail; b=Q5TbReJrFWGerfUsvkq8J+Rm/vPedAietXccmtkSWFjjCUlOSNjMHDAOGPBLSdcXWf36noBxZsD2RQV5nKE0uZ2K2g4PfrOYgXf4L/QWVap01fYr2U98WEW4UCh/NpVSGuvG1ztAiPM7Y4G/NWqVynzvvBQyXF3plZleoKh2FmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744982766; c=relaxed/simple;
	bh=km/ctP089GeXKbGfXVOokxxRmx3l0QoKcNl0ZJ/HbN4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=p4nukzTz7tRIw4itDp2rC9/AjPdfOmZ98m7i9X2JZsLBxmYgkpGavzMwwtASzTgIB8kHg32m+maep2VKtHtJt3X/T6B5TrtEGHMys24DLvh2tp60mk5blBypf0bvewRmLN44GZrnijmzmWUomjoCKpgFjkMgqBV37pTO5CwNFzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SOPjvhe3; arc=fail smtp.client-ip=40.107.237.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SOPjvhe3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nC8U+wcGEgqjpv9ptnbeyTXqXIdVGEEtMcX/e6kENLhekCX2aPDZahkxeHRPzvmhfblYCsAItBxXUxRGDxGoRXhI+si7q7wm2+yrxEQ+ROlNuF/Yfxcdc5WVwVeWYsGuvmqfyqUGRWvQ1fnjcH5p+b5ZOWUHyBbjlBzjiZDW/S99nnav5VK890Auo2aqlXpoXZ21NgYOgO1NkuSl4ia/qaactc/lQ7U2nKChDnxTHfbNDxexqRrwwLxxqP/veOEqTle3+2nmL98uaDp+0Tysi3JIHggWSU7eQQ/AT/JGb9O+QguZ+zhzAWILyNDZY/sMA2UyNW5MV5FrZ3fa1CSh5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3CimwwkIJeU2tZQ+SVZ433RhInvaW1T4xtHGftFMjs=;
 b=pGJtIa+AB1vW0S6o+uTO56S1sROParFAh0lM8cZaH6HdxCP0jnQZLcN8PkWW/F8bHfM5vNMiOncXpQApB3geItqbRTCgGv1KQMdm9HcRfuSqp619XxQAhp5ctKOS5GNhuQstd2f9oWO966keTkpNWCFP7IZ5YTDoF0DkKiF0NP4yJHC4AJ9nMed7WGWorzI4t0hbyNhreyVp5m3vK2AsJo+Ur4/rg45ayxM38Z//I+XiDkzxN4/sVbFEadi59oSURxB6gJsdBXkI6JPGGUUWv2EPqtKRi7p3yXEDLYx424Wn+nBnVV24mI3PWoDpIDT4sDoIDdXIyAf8IGGwp7cBxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3CimwwkIJeU2tZQ+SVZ433RhInvaW1T4xtHGftFMjs=;
 b=SOPjvhe3u4eugQ1pBemIcvn3eSM0b2rR10Y8KbWnvbsks9jdsLE/vSHbT1sqO80RXdDGVBlG3Asi/0F9vLa/jdTorHpF+x+GfgmKqFNdtn6aFH3FF1fdf9uk0MWBrrm5h4ZgrOSQYLOE8LsCnthJfG60dvmb922Py39zO2L88P8/H6IFM+MlevTIWQClj+T6gITFDCvXJmDzAorCPcPAHD8IAwg8Bkf+qBGzuZOsNvludi2YTEtbbhcxX+tuErql7WYk07h2bGnka4Wce6umn3uDSZsvxVzaBXNe2jy/PNzJuitHng6LK8FeEgAs7LZ65Fj55iYWflGF5fbxvdm3qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB7260.namprd12.prod.outlook.com (2603:10b6:510:208::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.30; Fri, 18 Apr
 2025 13:26:00 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8632.040; Fri, 18 Apr 2025
 13:25:59 +0000
From: Zi Yan <ziy@nvidia.com>
To: Hugh Dickins <hughd@google.com>
Cc: Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org, willy@infradead.org, linmiaohe@huawei.com,
 revest@google.com, david@redhat.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org, Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>
Subject: Re: [PATCH] mm/huge_memory: fix dereferencing invalid pmd migration
 entry
Date: Fri, 18 Apr 2025 09:25:57 -0400
X-Mailer: MailMate (2.0r6245)
Message-ID: <537D4547-383D-4AAF-9F9F-8A37B0BCB7BD@nvidia.com>
In-Reply-To: <95e543dd-6b93-9507-d383-1ae91e2e6640@google.com>
References: <20250414072737.1698513-1-gavinguo@igalia.com>
 <A049A15F-1287-4943-8EE4-833CEEC4F988@nvidia.com>
 <83629774-981b-44cb-a106-d549f1a43db9@igalia.com>
 <C055C822-0CE9-4455-9849-7242F31515EB@nvidia.com>
 <95e543dd-6b93-9507-d383-1ae91e2e6640@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0121.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::6) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB7260:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c0a3bd-c6a2-486f-e0c6-08dd7e7c8f17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGtwYVNoY1pWeHNkTmZGRWlGM2MybE1oeG1DTUpJS1ppRER0OHlXREE3blhs?=
 =?utf-8?B?b1VuLzMrc1N6cTRaUFd2U3g3MmVRejNZOVZ0b28rVWFDRzk2SG1lUDlXMjll?=
 =?utf-8?B?QWtOR0JnamZDMVo4dWtNUEZ1WWJDdGE2dFZ5RmNnZnJ1ZHRrNjVZRXJmSGcz?=
 =?utf-8?B?Z0hDbkcvR3pxZzhOdnEwd3pIYW9Dc2xwRG93R0NqUGpJdXhhZlY4WnhwMGd1?=
 =?utf-8?B?ZlhMR21TWjBrd0drTmRmWVpMM2h3ZUMwUmU3Y2RhUURxbGNPT0E3ZFQyNXNT?=
 =?utf-8?B?VS9xYk11Y3orOUI4dmhFTWxRcnR0dHdUMmsxVmdwcWVLWFZndnFYVXVFMWtK?=
 =?utf-8?B?YUZSSy9ySmptdVo1LzM4K0FVRmZqdDZRRHM5aEw1MndIalA0M05DRnNOQk9N?=
 =?utf-8?B?VW1rNDltSmRNRkdBZndYQ0ZSRmhCZzZWZWhRM1liZzFKenBmSFgzSmc5OVQ3?=
 =?utf-8?B?ZndPdFR0aVhsNUY3SFpGVzJGTC9xUXVmcm1TRXF1VEtLci9kYXJlam5uQ0xn?=
 =?utf-8?B?STJibG11SG5sWUFkWk81T2xQZ1RVYjcrdmtDTTM0NHlQKzErcWJKZm92anBC?=
 =?utf-8?B?Z3NLQjlpK3Ird0YyUldXWGU1Ri9nSllhTXBqUk1nSi9ENTcxbC92a28vRlRD?=
 =?utf-8?B?ZGYwTmhLMlMvQ1lNNTRxZ1V6TDhmc2RVdGs4d3gzdGZQTDBNdzJyOFI4ZVBm?=
 =?utf-8?B?a0JjbGoxNDJhREVRbFRnRmliSmNYZU0vVkR6VVNtdWlOUmg2U3c1NlBrSG1V?=
 =?utf-8?B?NmFCTUd6SmZUVWRvdmR2TzdBMnJoUzFscmxIQzBOVmtoVnIzMFQwakxhM25k?=
 =?utf-8?B?Q25WVnhDaU9BWnhOSkc4TG5nY0NpR21MSHNrcy90MFhkbzBkN2w2QVZieC8y?=
 =?utf-8?B?VEZYOXAwV3o1bGZKMjRkY0RMZlRZSEx5VFQ4aXRrUXFvK0V5S2EvVEVPcWVP?=
 =?utf-8?B?a0l3Skg5ZVJBOFNhTXVhU2J3dWJqR05sUitUS0JtTEtXZS83VzVmUFJKR3VT?=
 =?utf-8?B?MER4UnNqbzM5NlhoREdoOExRUEdIamNKWEVZWXNRY0dFS01mZ1l3ekIveHdy?=
 =?utf-8?B?aG1ZbEpFVnRhbzd3VUQvSzI4dURMUCswVmpyZ3RhTW5tdVFlc1ovVENaR3RL?=
 =?utf-8?B?ZmVhWURYL3NCcEhsVkk1OFhtc2l0cUp0aEZPbnJXRk5vUVBCQlgrV1pZQ3N6?=
 =?utf-8?B?dW9uMmNJRW5vYWtKMUtpNXN0SWZRUVRjTTVVbGhsK2thMllTNE9tZ1BiVlND?=
 =?utf-8?B?U1kzaTNmYXFsaWhCbVg0TXRHOVU2cVZJTWMwc3RzbmZ6cnpKQmNCUUdpRFE3?=
 =?utf-8?B?ZDgzRFExbGpkU1o4aGNPVGtUV2N4VDUvdnpQSVg1UW1rNW03T3JlNDRjYnpq?=
 =?utf-8?B?WUo5U2hoVE05K0lmMWpnTXI3cXR0ZTNNNDloWW1Ka0dOSmdDNGpxb1YrYWVB?=
 =?utf-8?B?NCt2cE4vQ2tIS3RpVFNqQ3dLTUFEcko5TUF6eDFPZjExd3FDZTc1ZmdjNFpj?=
 =?utf-8?B?d29wK21yWmMvNGNnWWVhdDREZXgya2poUW96Q0V6WjFnTWpmRlM4dDArKzFN?=
 =?utf-8?B?bmRUQlpXemJSMnVySTM2QVRyWitVNmVRdk5KdzFuQzlFRWdUaTA4WklvVXdz?=
 =?utf-8?B?ckVraUFqRk1zS21TVUI0TmcrUGdMOUMvNzF4Q2wxdFVuMWdIa1hjbEFINWlM?=
 =?utf-8?B?aHdHck1Td0NvbVFYWWI1SFZkU1B2ZGZ6dUhrblkzMUJmbnFNUTlRenRHUEtT?=
 =?utf-8?B?dk9QM0FPMDZsMk1neGV2S0RVQjhmSEY5UmEvZDQ3SDhxczFIMEg0SU9GTXlY?=
 =?utf-8?B?NENmSUxiZDVmOTFnb1pWY2V6dGFPNTZzcE9wVnorYkV0Zzd1U2dRZGNMZWFH?=
 =?utf-8?B?TndpWDdONGRNMFZiZmNJZWcyc3F6YlduSlFVdWJHUnNtbG1XYlFGRFhNMXg3?=
 =?utf-8?Q?lZy94ib7SP8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NkNxazVtUDRaVkNBS1RmaDNDQjk4ZDJXSVdKdWduTm9IYm9RSmRoWHQyeVQy?=
 =?utf-8?B?ejdjNG9VY3lRY2tIK24wMmdGSU10Zk5JSGNyR2RpNVZLZXJvZVVuckc2Y2Nn?=
 =?utf-8?B?LzNCT1ZydmZnWHNFSTUvTjFxWm41WXgxRzJJbE16b1ZBdkxINDd2U2lzOHNU?=
 =?utf-8?B?ajJIWWw2SVlMTHNHZFVPTXN5c2J2L3ViZ3RNZFZZWWhERjh3YjZUTUZkVlgr?=
 =?utf-8?B?bTJkWUF2NmUxMlQ4N0JJUGlla000U3hDYmNIbFUwUy9Ib3EzS0crM0dnZWtO?=
 =?utf-8?B?UnlHblFLWnYxdG5YNXQ2cXJJbWlsajB2WXhIVFhkQmxkV216RXR6RUZkZ012?=
 =?utf-8?B?Tm5vMlNHbFF4dExISVZkOUlDVUMxU2tST2pnOE85Z1o4dk5HYytRVmNvekRj?=
 =?utf-8?B?TVM5bU9zOGZhRUZyV2dZZEVBZFFTNW9iUVYzMWJRdmRVSWVoSnhHVVdLUDJs?=
 =?utf-8?B?Q2pMVngxNi9GQlJ3YTh0TklERERHYjhTYWlYVitoWTQ4b1M0OTdGWGVVSkJP?=
 =?utf-8?B?YU1xREIzdzdsT3Y3K2JlbzYvMVArMVMzM0ZBdFdGVFRpbzBwKzJXVFJVZkhz?=
 =?utf-8?B?bTU2WnBrZVdQWjZvb0lyeHVvMXVhTHAzN01qRTIxNGlBSjE0UU0zbHJhNmVC?=
 =?utf-8?B?c2EyNEN2dWRDcXlXanRmWGZzY3g3S3RtK0d0QzFvTVZ2eW1UT2YzcERkMEN4?=
 =?utf-8?B?RDd1WERNOFBYOHU1Z1plT2tubFp1WWsvR1ZBa0l1MEJDTG9OSk5zTm9PMU0r?=
 =?utf-8?B?K2o3Szd4eXFYcnhDZGlJOXQ4YzJ5N0Z2cGdjZXhyazM2N3ZRdSt1a0NmdTJr?=
 =?utf-8?B?VVVkYzNKWnB0Q05vaEJ2eW1WYkVkaFRWNTVtSmE0ZkpEdEhsc0pqYUthTHZw?=
 =?utf-8?B?NThURjlvRG9SN0dEak1jbyt1aFBuOXlRUTVYK2srMzFZY2E2U3ZTTGU4YmFp?=
 =?utf-8?B?ZFJSdEhMTXc1WThCNU1Oc3BYOHZvTTdYMTJ2QWJNd2RBcFJMdXJISThrSXd3?=
 =?utf-8?B?bTdqN2EzcXhCaG9sQSs5T0ludkVpUTJtak9kNXJUdzlVYjZCYXV1eVJMY24x?=
 =?utf-8?B?TUtraGdjemp1bEpkWStLWHFSbnVQeWxzdmVIK2ZQbGF3ck5mdVFUc2tZcjZh?=
 =?utf-8?B?SjIyUFRKYlVxR2lxMzFxVzl4M1FGTEd4VFlvTUU1R0hHOVVhSUQzbnpxNmdE?=
 =?utf-8?B?Rk9RQTBjUUl0YkQvQ1d2TWlIOHVzdEpxc2xrSWhYejJiVFZ4azBHeUVVRlBE?=
 =?utf-8?B?WlZKTkVnN0lDYWttb3ZHMzFMdzJLSk9oUFBlcWhPNnA5UlVjVlpLaWJOTjgr?=
 =?utf-8?B?SDNrdzIyK3grVWFSMWhQMHpKZVk1L0htNmJpclRDeDJudVpRUk1zTGNKb2dp?=
 =?utf-8?B?THN2Y0kwczJKcGQwRmlQeEh4czFpdWhJMy8rV0grNERFNUxlM1FWbGR3eTYx?=
 =?utf-8?B?YTFqdzRNN25VY3hPUFFyemp1WlNKZW9TYjZqdUh0MmY3Z2lBT1VUMllOQnFn?=
 =?utf-8?B?WFZzUkxCSHM0WnFyejlrVGNiYXh5dEpaQlhUbnpPQ3NqeThFSysycWlBcGM2?=
 =?utf-8?B?MGhrN2x5b1l3dFdod1orTVRuNnJ6Vy9SVGtBYUFqbEFzMmJ3d0ZkeTBOaWFk?=
 =?utf-8?B?N2tFK2ZFTmNwWmhIakRaWGMwdmpBWElSZHREVnZMMWpHZ01JLytxYWdPZFNq?=
 =?utf-8?B?VWVXRDhZZWtlWG5zKzlrVzJ1YnZiT1U5b0puV0pUbUtuUzRQR3BnK3NLb2RR?=
 =?utf-8?B?YU9rL2RBRVd1SndpNmcrV0JmZ1hEOTBWS2NaZ3BaSjdnSUxsN0g0aUxvN1VF?=
 =?utf-8?B?ZWk3c0FvM0gzQ2RGaWtlMndHdlFUOVJ0blIrMEhNWVh0d2YwcXRmeG52UURz?=
 =?utf-8?B?aTlJek1CSk8rU1B6UnNpcWQ4czVaUkNrd25LNGdWOGg5RFdYYnkxc1A4UzJS?=
 =?utf-8?B?dUtWS09mMUtTUnZHQzhQL2JDcy9VK0dVN2dsdUpUU3lzbzh3NXpHN01xRDJZ?=
 =?utf-8?B?SG9Gc0cxa3hYUUg5TW1SNmM1RlhyL3U5R0hxOFVlbEQvZ2tUSTNOcE42ZCsz?=
 =?utf-8?B?ZDlpclhmUHhXWHdFWGRYMUJNYW9KZTdMS25KeHFnWXRHZFdwM2E1MEt5TThi?=
 =?utf-8?Q?aF8Q/HUwyPRFyZAsz6e9eDXj5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c0a3bd-c6a2-486f-e0c6-08dd7e7c8f17
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 13:25:59.9201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZKln49V3Blld6rM7yhgCzfA6qEs3J7M1RFo2ZfrLvYIxmi43fHWVyuSLCpgcJxXy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7260

On 17 Apr 2025, at 1:29, Hugh Dickins wrote:

> On Tue, 15 Apr 2025, Zi Yan wrote:
>>
>> Anyway, we need to figure out why both THP migration and deferred_split_scan()
>> hold the THP lock first, which sounds impossible to me. Or some other execution
>> interleaving is happening.
>
> I think perhaps you're missing that an anon_vma lookup points to a
> location which may contain the folio of interest, but might instead
> contain another folio: and weeding out those other folios is precisely
> what the "folio != pmd_folio((*pmd)" check (and the "risk of replacing
> the wrong folio" comment a few lines above it) is for.

Yes, from Gavin’s commit log, I thought both migration and deferred split
are working on the same folio. But after reread it along with your explanation,
now I understand that both are working on the same pmd migration entry.

Thank you for the explanation.

>
> The "BUG: unable to handle page fault" comes about because that other
> folio might actually be being migrated at this time, so we encounter
> a PMD migration entry instead of a valid PMD entry.  But if it's the
> folio we're looking for, our folio lock excludes a racing migration,
> so it would never be a PMD migration entry for our folio.
>
> Hugh


Best Regards,
Yan, Zi
