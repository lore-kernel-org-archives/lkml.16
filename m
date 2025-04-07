Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB421F4E21
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035880; cv=fail; b=tu8Zw5aoY5JzXB/t3AEWTVzk99dxpMvFmgCeduVrXalh2pgc4c9nX8+StuzlJmMkn7RxPlqrciKIFEk/zgsElJ3hWQZ66VEHC/IMxNU5PRtgTL8ck12vMfxqd4o/oXlrqGlceTqOY740Bn7fA+3af4VQZSHZP7CzPNoCT9kW/OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035880; c=relaxed/simple;
	bh=5izLL/EwcjzoeG7HCyqdGT7uYc5UYkY7jlatg1ikIRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hKUwMtGIkPcPa4YhbaFvq9gH2f8a/LoDcxmQm8Ekuq219jq/h8Ll5UuxCNiXdBRHugaZ6KHcGfOGzqpLh4GJsbTyNIdRx+BylqwQaKyeZe34P8Svag7XKKLBdBS5ska2ZCgeL3CKRjGF/0p3VxQScrsFwJfkMWMHd7jfF6yAQrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=d6s9RHpl; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="d6s9RHpl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2kVa5ow9H+l1SUbiZHfHq47ePGsxZIwAR9yc56Z6L0oux2Zd9Rw5agA9pvPgvR6NDmssnS6VvIA8IE0Ats35qZA7sv3phOJUjXzVbwgegIQkgtl2AThdasNibIas9IbIg6rThYlpuke658w2rCgHHxYmDz/gr85nG35XXvq8FWf1FuaUVQoxAosNOfjfpHlq0Spq3YdUQlZD3eagCm0MQsSO50x2q730wBZGfD8/wz+cf8o9/hTQup7xIPZ6/zSjvL9Cn9Hc31ZWgXwTtTbfBFwbqGFjCfAdYq0yp84UiOwrIpx566L0r8ok8K/AX1eZk9rgJWQ5PFSHNo3WkEnxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNyOlytN7u+tGt6CtdjyrqXop5de2f1ReKufoRdabOI=;
 b=IPrixl6t8jK2ClCLamQcAkjqLHeQLsF3Ww2FvHSOYBXNS+XNrJdS76qsZPFJqLn74E+2w7pl8e0vzLEtAn4P9doBYrDZBv9+MSfUwA9aB+JXX6JpiDu6TwFFrX5LDcC/mqzABQ+oZfpyk7kQXMJuUYLx2o7DlIHCBu8XcOY2WwSZHjg+rIHgzJmZv974hVQnnmNUw+lC42qvsoCxbj3aMwCn96trvSsYjBN11xGBh4CcTAcnaGHShJz+6abTHOQLh1moXMgMGms5rwtCLn5XAiS1Y1L6hD+bxFiUU6L7/0Ps/TJp+vUA3mJLrQ6IjKE7doQwRcXWSk+PoboTv4f7hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNyOlytN7u+tGt6CtdjyrqXop5de2f1ReKufoRdabOI=;
 b=d6s9RHplRQfRlSutd4iE0dqybt2TZEnE375TGrtLIfIE6ZmGST5SM2TRs5LnBbJss0fiFsqz5mqZotcmWJHlovmcKvUTwO+T/darCtEKmPRQRHWCViYbF9yYDJc4clw2ajp4omfI2WI3Itd2OLe4hE7lvGPnm6SQCBSZN67JqYCeoXxdW64VARSZY36KJo7+2JPEmDV85qpgiTEZG1PNMZqGrzIzqLPp8cn412pusdARMBtOPm2CGANL1B4keGxpMj2flZrOAVWyw7QgMpSCiiC1ZS/WvkTn7dH+4qemJ58+6RZX1KiSkVjo2GB3oL98xCbOVu0+08wMiz/dU2PjMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 7 Apr
 2025 14:24:35 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8583.041; Mon, 7 Apr 2025
 14:24:34 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, willy@infradead.org,
 david@redhat.com, 21cnbao@gmail.com, ryan.roberts@arm.com,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] selftests: mincore: fix tmpfs mincore test failure
Date: Mon, 07 Apr 2025 10:24:32 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <E4EAA455-4AB0-4122-92B6-F0F5FE56041A@nvidia.com>
In-Reply-To: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
References: <9a00856cc6a8b4e46f4ab8b1af11ce5fc1a31851.1744025467.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
X-ClientProxiedBy: MN0PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:208:530::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 45797d99-a377-40e4-3e54-08dd75dfeb5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JbbHlxb+za63wGOFdhPpL6545MPSj2UauyjTxrgU/tAW50laxtGkNCm3SdHl?=
 =?us-ascii?Q?BDAr990XqRYWx1wSWTyibUK7dZ8Iy0440VZPBolEGmS5yZTKJrsilMs/2cuv?=
 =?us-ascii?Q?MIlm9W3F6lWUhpzdcDdyJX9sH4U1OKDnOlXWhly1fan9bXK2bZwIHics13HY?=
 =?us-ascii?Q?a44dbcpvEKtlk331Ulg/ysGz7+AC8dZ4ieJIsS8NuZUN+DiPaj/J0T/eNymX?=
 =?us-ascii?Q?q0i3ymjST0pLaA+GZW89ky8zU5DRrp8Ly6hK1BcaRHW+k39sGbBao85K130q?=
 =?us-ascii?Q?vxU4P9Jw2XY6ppqKzPC2seQFT1D8bflm4FpasaYjpJe9VuoMfkJYaUxcPPZX?=
 =?us-ascii?Q?dLRIISqWQPcz0Q39nKXUh+4vSSfQVgai3K5nWuudZ7T0RFihh8DxzUZnyHwX?=
 =?us-ascii?Q?mdgzzi5BwmSNsRxZWPskMiqX+pYgiVJZH+au3RpxgDBpwSHI3Q4ipS9e/tKR?=
 =?us-ascii?Q?SV60/S/nfsluefnN7wTnntqg3zhE2UA8KwJV1wVKaY8bS3BJ4oCGXrM3SFsh?=
 =?us-ascii?Q?G17usWeCdu6DkGVK59WpubZxWwEvnXj+z5q1a53Dj5kLQyl/JzJft+Zf/EaU?=
 =?us-ascii?Q?VYjWGVfNSi9GHDCRhDRfWa32bD6Mr1J/biIn16380hNRb7aoohYhJnm8CRMF?=
 =?us-ascii?Q?sfIGgn8wbn97bZewT26094UpxSWB43NMBHsW+1S8xLhOMlN4SA+SCyWs3PAG?=
 =?us-ascii?Q?/3If94Db/9epg6PfDcT53eTNNNwIVsto28AoSF3HEidyC99+YrXUto3Xxws8?=
 =?us-ascii?Q?LA0w79zDI/vfyh6hlG9g5diIGRN4ea7GDwRJj8q1281SSMPKFGiXFZJoWbjX?=
 =?us-ascii?Q?Fx5ofIeJGibJRbb78QrvXtcTAZTEXCmF3oFupPgiaj0Y3ObugZcyoASiOgSi?=
 =?us-ascii?Q?a/5fwjtLprgpP+d/DQ3hEFRH2pmDuV9+vBofY8j6Svh79ZzIwhcH2biqD4HT?=
 =?us-ascii?Q?Hzhyilm8MlZaoCyiJqB9e85ofStyK3sMMf/ThroVmufrZAT19Hfa0mbbZl0Q?=
 =?us-ascii?Q?XagumJ124tuxwgz588NvI0LMPs++ftRuB2CYwHtwTRjNIIHcZkanA1GSiK0d?=
 =?us-ascii?Q?6bI9j7dTkIQg3/5urx9zCJiIKfBpZpnY7JkkyR2QVEXW1m9wOUbagQJvwRE+?=
 =?us-ascii?Q?LsD3ruRithC69lGBvmOWKCbkCyntgVyZHBMetN0FYUynIa4CrxM21vLBN3Ke?=
 =?us-ascii?Q?qrRqqitIsdnbAhMD/Bm14DQurSp+NN96qKVLsDk4UNGsHwFHohtpM5BMyOZ0?=
 =?us-ascii?Q?etvgeC2DV/ro4WOskDZIgEP4yBpxplG7nw8ePf2RsNGUZ+a/Ix5VUMXsG1pP?=
 =?us-ascii?Q?WMOR6ShUBoKLBSnS/vUP4GqH8HojvOzE4L+I+Sf70shu01FmoS7LUuyISUBM?=
 =?us-ascii?Q?PI+o3rAFe6ckRBOu5fZR3rgNhlFQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kK8RNwJvn/fuVjOie7LqKxt50R6bYPxjv1lKL4zp/H0n3R6BOFJkoj8XF5z9?=
 =?us-ascii?Q?vMtmR8u9YrW7JO21hVGP76qf6D/qtDygdJWgs6/tR5XOB1YpG6hRBE48yMvW?=
 =?us-ascii?Q?KupVcWdiHNVMf3jFL1sdPvUZLZHrNo60p2TkIhe4Z/v+0oyJ7mslMcX9oaVs?=
 =?us-ascii?Q?YSb8D4bCcssa3iw49rUrNgn4RGoz6CpfIwM7JBGeQJlpXLg1Xk7r2ZCGh2X/?=
 =?us-ascii?Q?CI6tFnzaWKqHVnSYHbwJbX/r7RfC7RRJYUQhl2zsiQP9d9LNbkE7v2QAdPMc?=
 =?us-ascii?Q?CMX+DEqD2ifZjaaDugni2yuF1p4lteX6LCYGuQad7AOv1/RjkkBkTKKCs+Pm?=
 =?us-ascii?Q?oTr/IMV/FzCORJ2upqrR5cQ9JVPv+vFsz2Ovf9/I37/qlhta4dC3d6QJEDrJ?=
 =?us-ascii?Q?0s8Y+a4lyTW+Dh8xewI7Ywn/keLlmGhVBTjUOZP9jcoz2neTb6Yv/6z3PTxh?=
 =?us-ascii?Q?kCDx7ESFM9dEyPPqTkBGVheycDX7iDDcW/S+t6EqjjIpGcFbrpGRQ35TGasi?=
 =?us-ascii?Q?GqNijp5RVmX9hnjwZKzeYqDk2JPzwbmjHlYQoa3d80yf7gc+T/FoMBNjfKHd?=
 =?us-ascii?Q?bUFyjipr/SA/6jJIcIOhQV+QRXtYhK/Q3KnWn8ns+8xlgsyqOte+ZyZ4AmKD?=
 =?us-ascii?Q?pKVwjvSDM3549+u7tTd2WzNY7Iokel125xjqk3sylXT5mQ9w9kNzP74+cbjz?=
 =?us-ascii?Q?ltk/U8hLmAHKpp77n52uEVGgelrv5/UAp32RFT+b+pwARgsRGxm/MM8EdePQ?=
 =?us-ascii?Q?OQBBVH2Y646R2/Iq1ePYNNIRNOjSl3CAzjPFuJpEvrz7jYaJSu5eEQUKcAu7?=
 =?us-ascii?Q?fVOdfrMZU9IGC6Wmg4JSqIXJLtJXXJ1V5FUqCgMyrtKdqo9qHJ7QBIF5LcR2?=
 =?us-ascii?Q?zRok5h/H1Lth19Sz0MvQuSyMr7eOmDVXljfRXAWiEg01/22lJTiyE2C6VjZg?=
 =?us-ascii?Q?3zO6PWgWiLYjsk+LqFrfxAzfgL5abZl5orKYbOMBCK+BHEgVcBxwOjeyIrvN?=
 =?us-ascii?Q?yT8RYzzMpmPjKGNo9WkHYsgc8pv/RKy1JwwXbR1ZzGF+HeYXzW5bwnSTJC8+?=
 =?us-ascii?Q?138zySjxFpxkUNombAm2nc4CJRhxUJqS9Bex4p74JuJXxDdf3iLWWUYQMSZ5?=
 =?us-ascii?Q?XXFuUF9wdD2TG+SO/zt6UdOgegRw8YDjMTZ3Ql4tBoiGLdeIwKSDfsxZYDAR?=
 =?us-ascii?Q?V1+nwhD5ft8NpdR493LOF5qEWbfguI+rJFcd/xfpSwWnu8srfC15lItmUnv2?=
 =?us-ascii?Q?5xsS9K47TyM2EAav4CC9V9gLhVVJCaSYG21OoIqLQfX/yrDJdmFYdf1ZcU1w?=
 =?us-ascii?Q?89ssNUKRtl4m50UokhX0c/lPlH+w9DmoN0enHs2HmjEDVYdy80YEFUsPUOv8?=
 =?us-ascii?Q?QO2EYpl+O0iBewolMBFcMdUZflK7uFTu3Fs20O8WCF4mpoXqSrGpXXRZ1OEh?=
 =?us-ascii?Q?tdKkd3F7/u3u0NVO8vowwPzYYW6e/w666rgOMb6dwLbad4Xd7XuMoQEBsrXA?=
 =?us-ascii?Q?7TCUi+iUcUe7wpIUgm0zLXfHfhRVRC444SMzV6B4/FsNFDQ/XybDFJ5tCpbh?=
 =?us-ascii?Q?lH6OPP0VZTv9PXxPdQaMzDFKJUUsYzFK0twpk12F?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45797d99-a377-40e4-3e54-08dd75dfeb5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:24:34.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OP1XeAZd/pVfXWCwZYx8nvRK/QJTKscJLa0KCXwnxZd55YoIhzQZmoJu6j7W0Ikn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590

On 7 Apr 2025, at 7:31, Baolin Wang wrote:

> When running mincore test cases, I encountered the following failures:
>
> "
> mincore_selftest.c:359:check_tmpfs_mmap:Expected ra_pages (511) == 0 (0)
> mincore_selftest.c:360:check_tmpfs_mmap:Read-ahead pages found in memory
> check_tmpfs_mmap: Test terminated by assertion
>           FAIL  global.check_tmpfs_mmap
> not ok 5 global.check_tmpfs_mmap
> FAILED: 4 / 5 tests passed
> "
>
> The reason for the test case failure is that my system automatically enabled
> tmpfs large folio allocation by adding the 'transparent_hugepage_tmpfs=always'
> cmdline. However, the test case still expects the tmpfs mounted on /dev/shm to
> allocate small folios, which leads to assertion failures when verifying readahead
> pages.
>
> As discussed with David, there's no reason to continue checking the readahead
> logic for tmpfs. Drop it to fix this issue.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>  - Drop the readahead logic check, per David.
> ---
>  .../testing/selftests/mincore/mincore_selftest.c | 16 ++--------------
>  1 file changed, 2 insertions(+), 14 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
