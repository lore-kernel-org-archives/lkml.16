Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D815A856
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 04:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.72
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748232308; cv=fail; b=j3VbLp76BUPjiA9Wpc3U8m+pKOemqR+NkMlH38c6wfiwx1G4sV+7aNZSk+1sjYHU2+RvSMt73NczayU74UBJgHp/+OkfakZHzIojKw0dUtviDunE1QZbQtjNz5AnsygW2IK4zCQdHN+XyMDsgi1yp5kAxCQsrxnJKNAAsdS6Mr8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748232308; c=relaxed/simple;
	bh=bfySRyxVtDOUXbKcODMBJlirA3b+dR+mXT0OJZHAUQI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QOtknMX4dV0cyeN0HquOWusm8tnByVyuUGktD4UtR/vfUIopRnJGBYrPDoZAmPnM/ahWEYPpOSMeaHZtjBQJyErJEzQ276p+CO5izMe+VquCyhy246rjDGbjAZGcDGboKOKbk/gqcUpLv+Z8M0RMwEna/zKc/p4gek6UrUxir44=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mazwnLZY; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=mazwnLZY; arc=fail smtp.client-ip=40.107.21.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mazwnLZY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="mazwnLZY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=y5hnd4QwZR67OckjmrpbEfnN/8CCWcEWqpsPBf+sP+sgfAaLzE/HHlk6oL8uhEjb/wvq5ku3iHHfRnaw3Ksf145lED39k1dE8HH9+hjE99YAvroeP2af/P24g9/wrKKaZowx1/mE3YreY9zvBYh66n2aVVzclREfv1nj0NEuX+QXptV2iJWZeXv4lZP4FgmOhGzAShnWnYvZifYFxhBm6CJuC/PlMag/gYN0ca3B2BEjazH8WzUMNOtKVXvn/1WGh8nb9twuP6rR2BxqoFRArhTTYU/LRr0vnOXigJ1FdDSEQNpBdMktCJefituwKJSlz3gUqPHdhWgw6aLAEkOhmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/595641JRgGTeI8SfWe2QjFGnkjpifZOtCEx047hQE=;
 b=mTacx5YxvksfFKRAvihSQ4niuGcXs3Dr47DosQlopPgoi7D2AchVLfozt1uLVVsaS3wYNfUkr4mFtaVczNxZcKHRJ5uiRNc02vNIttw9EDNQLD1wtTBQ5XkZFTGIaUScmDDGMMUNVCtAJijGf8mQ4bULfB5e5KenMwhzlLs8Wi7R12KtcNoYl1itFx0eiiVhti2++UrpOHlxzveSgfNuYLxDLBuXQGm4LNS08NYMYpZocUE++O+WfkDpgCmK7iLT9+wt1qrNZIHQSzZs2Rb2JjOh/9YXDvCsoi0lnNM1ZTgt1wE5zr5GQoWZBKv0X7PyGL4UH/6NGfW1hKUTHzDG/A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/595641JRgGTeI8SfWe2QjFGnkjpifZOtCEx047hQE=;
 b=mazwnLZYnUmb8abTpm6S2GjzIQn2HCdW/+0XnfVMdGfqUyP+wjTy3YgprCmqsVtG3KO1L8XU4INzWtJQ1dPimXi/4bFOp05fLBra4Oc+ZQ7kXd7j9l+uco4IUMVPBklqLu4C9zFL6tYQdK+ij/psXHU8Za3d6OwhseBaJwOFZ1U=
Received: from DU7P189CA0023.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::16)
 by DB4PR08MB8104.eurprd08.prod.outlook.com (2603:10a6:10:384::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.31; Mon, 26 May
 2025 04:05:01 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::40) by DU7P189CA0023.outlook.office365.com
 (2603:10a6:10:552::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.26 via Frontend Transport; Mon,
 26 May 2025 04:05:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Mon, 26 May 2025 04:05:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qhJgtpjLc8gOV3TeiwT+nAWlH7XeBiIENRG9Vifmzs0QZDoW3drurq1adv/PXl1Dgq5TiVGexiWvc9GPZS+OtANLkmUTX/hlVcBdNfw872VAPej97r8TjVPhEt8tb2y5WKNdUlHvkNhFliGsg+3lgB6mp2zD6DWBuNnpi+WCDQuyPvBVajFzoAZqSeGLMzHOD/O+K802D45/dDFGlScG4F7oz2HL2gLn7oMCIwfQr4gbJYUCf15sjq+CbFKoP18juflpNOKDuIxvO64NjliHWBs6DMD72icjMXOHenMCN2GqOh0DdAy+uXIRGI+45RCchjybEnzbrK4+V4AHVAXp1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f/595641JRgGTeI8SfWe2QjFGnkjpifZOtCEx047hQE=;
 b=Lc3JsxdNDoz+Vs1pNt/2mXH/qLvS7eMr7MGMtHQoTnq57K9B1+Fupo5eoB+On7gR5/LzPGIwzZcFoT4B14wMn4c7CBy+2kW0HAYLJDZtvoITJB4IkIv4n3SaSgi8ZG9jtAiQDlwWz/wWVufK34GaUBmoMBNErd5wNMmQIY2M5yeKQxy0mSf8va/xt6SHw2BrWNsJJK3xOESzIMvmutwnkQxKCdaHBo54FiZaLK12iLQNHG5gNsNwcelLjEQ01Cg+ZX2ORiQs3dg736Q0+w+i9nLdzoikSaDKal1NnyGUZwhGUUpyGHLkNB2kuTh8PI19rwSWHmfj/wO5NuW0jvLeJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f/595641JRgGTeI8SfWe2QjFGnkjpifZOtCEx047hQE=;
 b=mazwnLZYnUmb8abTpm6S2GjzIQn2HCdW/+0XnfVMdGfqUyP+wjTy3YgprCmqsVtG3KO1L8XU4INzWtJQ1dPimXi/4bFOp05fLBra4Oc+ZQ7kXd7j9l+uco4IUMVPBklqLu4C9zFL6tYQdK+ij/psXHU8Za3d6OwhseBaJwOFZ1U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8040.eurprd08.prod.outlook.com (2603:10a6:20b:54a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Mon, 26 May
 2025 04:04:29 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 04:04:29 +0000
Message-ID: <ab2e26c6-d98f-4e7b-ac81-969e9c87409b@arm.com>
Date: Mon, 26 May 2025 09:34:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: Elide dsb in kernel TLB invalidations
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: will@kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com,
 anshuman.khandual@arm.com, yang@os.amperecomputing.com,
 wangkefeng.wang@huawei.com, yangyicong@hisilicon.com, baohua@kernel.org,
 pjaroszynski@nvidia.com, ardb@kernel.org, david@redhat.com,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250522114414.72322-1-dev.jain@arm.com>
 <aC83jRwPNGv0yWn_@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aC83jRwPNGv0yWn_@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0176.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8040:EE_|DB5PEPF00014B8C:EE_|DB4PR08MB8104:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b081395-2454-4b89-670b-08dd9c0a7cf4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Nm5tS3NLY2FmM29PVGMzQlVYdWc0ZEwyNFVYRUVRcEQyem80TVM5UW9YQlJD?=
 =?utf-8?B?b050RTl1SzdhY0V1RDBuZlhxYXZleVB0d1RKUkJSOWVFVk1OcGJRQnpFYTZD?=
 =?utf-8?B?ZXFucEpLekVCUzExcWNKNmtyZ1RtUmZhUURYem1zdkZtK05vTkVzTGl5bnlW?=
 =?utf-8?B?UXNaNEtLZVBmbC9oZXZQdUM0TXpVc0h0bFBXeEdKaHJiQjJFMzBYazl3eWZL?=
 =?utf-8?B?QTRuVlRJck9yd09wcHQ5bzBYMnlTOTRJTFU1RGhVQzVOdTFWS0JZd1Q3SEI0?=
 =?utf-8?B?ZTY4MFkwWitvN2N6Z2Q5dFZUSEtPRUdMdDhOL1hWVnJXQ2RtUytmNTBxV1No?=
 =?utf-8?B?bWxaY0NnS0lIbGFQcC80Z0RkTHRCbEEvdFBtVzh1M1EzWFR5TXBCN2FjNGNl?=
 =?utf-8?B?U2M0TVo0UnFhYURsajd5WnZmc1NKc1QzWldvR25tNDdMYTZCTFdreHB1YWF2?=
 =?utf-8?B?YlNGKzR0TG5uOVliRi93SVJTTWR1V09uYmNaTStLM3o4WXJWUlI1cW5nd1Ri?=
 =?utf-8?B?cmNmZVlWZGZwQnlaVEttNTUvdWF0WXpLcy9RdWxxOFJVSzNMTHVFYWhQSkdv?=
 =?utf-8?B?U09WbnROWFFjUVhzVmx2NUNkRW5MeGtKL09PRlBIYVR0KzM2NDQxUjU3OWpS?=
 =?utf-8?B?Q2x1WGtHNi9BcjhKSVNzakIyWGZPYUV5ZnNiRlJWSUwxMnA0aUo4cDNnZWlr?=
 =?utf-8?B?dUhaNGJiWWZ0clQrQjNyUklQTkhhMHc0NW9wVDdremNxR0RKSFJ1OWxlNXFH?=
 =?utf-8?B?aStVTDZ5dTd1TTNvTzVLMzhIK0pmLzlKZHNEZjFneXZheTVtQ0NqRy9OeEFP?=
 =?utf-8?B?eFc3UzVQYXR2OFVqSjlhalJiUy83ZUxXYzdpaUYvRTBoditCWnd2WEx4UFdX?=
 =?utf-8?B?WlFraWZIczhpYXFQcE91NXdwOUMzVkpHcGQrZ1dMdjVhdDVHeHZjSFhWTnlQ?=
 =?utf-8?B?akx1Zk16RVVQYjZVYUFjQWFDZWJERVZ4REc0T0RWR0lseWt4L3lGM2ZGMlJh?=
 =?utf-8?B?NkRKTDE3aEx2Z21LNnVXUXY4WWM3SE5NWnZtNlIzYmx4SXRUZTNoNUdrQm1v?=
 =?utf-8?B?OVJNR2FnQ01qTzc3UExsNEpEcGVUaXFEcm4zdEVVQUVwVTdxZmtvUGwxMTZq?=
 =?utf-8?B?SWl1THFUYW1sc1Q4MHdmTW5MaDB1dDNidUJrVHdIQUF6WmhCUDRlWFJETEVH?=
 =?utf-8?B?eXZKOWd4UWo5aHBhQndwVHB4WFhXQ1d4OGhYZXJtU2E2RThlOG5KZUlSYlkr?=
 =?utf-8?B?a2JzTlQwbU1oWTR2TEZ3V0tlM3dLdjdRT255cUhHbTI1OHduS1hVN3dscCtw?=
 =?utf-8?B?R2pPSzNWQ29wbW5sRE1OR1dqek12QnY3ejBJTHdqK09ZMHVraEdCT2dKMi9q?=
 =?utf-8?B?eDJ0azNXaTZFYXgzalFoUEJFTkE1VEZuVDZxSkV5VUpCRTBMQ1UwZURsYjVa?=
 =?utf-8?B?bGNwa0h4WnVDODJ0NHYwVUF3SjJycm5Rd2pyd1lFZHkrZ3RobnZEUzdyOGhQ?=
 =?utf-8?B?UjRIazZIbUh3MVZodHUvL1RLdGRPbEVQbGI4cTg2QUhPM2ZaNUlpK0VsdUhS?=
 =?utf-8?B?cjh5bWpQWDBwZ1dKZCt1UVhvaW9wdDA4d1lxWFFySlFiN3RidGxjMll6dm51?=
 =?utf-8?B?WmxxNVBXa2FSR1lRTEJPNlpNZ2EvSGVqVFcrVUFoanh3VkEvcmhjeWF4RGZS?=
 =?utf-8?B?Q3RUT3dCbmo1bnpJOTUwSURUeWY2TjlLVDk0R2QwdEVpRVNYazZCUjZsOEJN?=
 =?utf-8?B?bTFSWDlwai84VTBYaHJacWEwWHkvOGszZ2k5blVFUHhmdGN6MU02L1YyZVNF?=
 =?utf-8?B?Zmlqd2NwbGlrNmVRMDVrNk0vNWpPV1grOVRFaGw0UWFDNUt0NlhkQ2ZJWVM2?=
 =?utf-8?B?RFFZcElsTktJQkxtZHh3QzNlelR2Sy9sNWFGRlQwSS9OeFE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8040
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ec0cf172-b2cf-4464-1aac-08dd9c0a6953
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|7416014|14060799003|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEIyczNmemtDUVF3RnkvQU8rUktITWV0UzM4ZWFZKzI3TEJCZ0R4VWlza3B5?=
 =?utf-8?B?T0Jmdk9ac2NuYUV4eFl6cmtlV1AwN2FQQlpyZThHOVJ6d1NKOGhBbUxCdEl2?=
 =?utf-8?B?WmdCd0VVZVpKK2NIbFQyU1k1OU5XcUh5ck1WT1ZZZXdmSXMrMkszVzMwZFpE?=
 =?utf-8?B?c2JMWVMxSFExVlBoSkc1ZmtIdGZkMGlZWGlUV2RESVE1N1R2L2RZN21WSVFC?=
 =?utf-8?B?dUkzMVhTanlZbXYwSUk2M3dvSTJNZFF1SjdNUGsyTE1FOXM0VGJ0M25jWDR6?=
 =?utf-8?B?NnNlS3ZtaXRYTFJOMDczQXRydHByOXJ1Y2ttdmlxMEN4dzZmeFdFN3hZM1VU?=
 =?utf-8?B?aHVBTUdIOEVFenVQWGQvQlNCWjd6dkFxN2Z1amw0N0VuZnRhQWdhbCsxd2dD?=
 =?utf-8?B?RWE3MDJZZ0h1a1NoNmRteVZBQkc4bEdDZjB1TkhmY1B4dnFnRDhDckRrTzFZ?=
 =?utf-8?B?b3Y0MFR5MnhJQzB2alVySldqbi90YW5COWtQVHdXL2pLODQ1T0dOR2Fub3Nq?=
 =?utf-8?B?Q3k1eUtoUHhtQ2hQRFJWYytUOG1vanVNa05scG5oRzNLR0RKcHhnd0hnWHVK?=
 =?utf-8?B?bWVic3FMSFdqWjczVEVONm5JbGE4T2VQVm5tcFV0OGVBSHpuQ0dNTDlMMkpP?=
 =?utf-8?B?K2MxTU1pa0M2S1A0MDR5Vm1IYndlY28xZ0ludm04U0NrcExrNnN2dU1OdXlW?=
 =?utf-8?B?Z3MyZnpUWEoyeUV2dVBNajJuZldJUkd2eFZ6S05qQ0dIand4Z0xtK200aDdK?=
 =?utf-8?B?dTg3UFIzeEUzaTJrd1d6eStsdjRGaXVjNDE0UzZmUUo3cklMck4yRGZHazl2?=
 =?utf-8?B?SXRTY1B2QXRvNTRhOEJvZE1oVjRiL1F2Szd6a1lBT2ZUVFJ6RkYxTnQxNTFi?=
 =?utf-8?B?WEZ0bVUrUUxMQmFSZGNXTlduRE9uVEZ3TTFnS2VRblBsRit6azJRa3c5N3dL?=
 =?utf-8?B?Q1NkTE1qQ29Rcmw3ZmdlaHRHRXh4dVE5bzUyQmNNU0k0citYNzkzc2syMVFQ?=
 =?utf-8?B?SzBrM1Z1UWU3WXptek9Vcjl1Zks1NW9scWVQR1hDa0YzUXJXSURDWVNCZHNa?=
 =?utf-8?B?SGJ5eWViaFAxb3VSWGNxWGtMUU9SZ3ErU3pmNEIzYnBEbFFYeFpRMmx4Kys1?=
 =?utf-8?B?dFBNSmJuUEZRRy9UTUswQ1BBWmlWRzlMYjREcHBMUldLd1VnNTRma1E4SVpM?=
 =?utf-8?B?K21BbnpQWFFVRjFMZ3R6RG85SmlEYlFGZGFSMnIzZkkrYmROaSs3cXUyZllh?=
 =?utf-8?B?Q1Rtd0RxVTgyUmZ2ci9lZElpV29rR05jU3o2YTRndTFzazd4WWdjWW5pTlkx?=
 =?utf-8?B?U2t0SWNxWnQyYkphdXd2Z05vUEpqaHdkUDVUWm9jem9nOUZCVFpNMW9rai8x?=
 =?utf-8?B?RGc4YVRaN2pTTVcwdnN0R1JYRUUvSTE2RHMrZzJYQ0dXaXQ4TjJJd0hoUnZz?=
 =?utf-8?B?anhSSzkvWkMxSzBKRnBjOXM0Z2RiS216RE5FWU5XZmNkREhxVDgraUtFYzkv?=
 =?utf-8?B?b05HR0pmRlY4R2VqcVdmS3dINmxZWVRrZ0k3NG9PSVFmWkszM2xjWkVOYk96?=
 =?utf-8?B?QmVhVEFRay9LTmhnSS82c0pMakQ1aklBOGdMYWppWUVRVGROZVZGa05FenRH?=
 =?utf-8?B?UGJqSWk2cXhkK1NvRDdoenBnNEVHdkcwTVVHU0tBK3hoeFJ6UEh4RlUrODh3?=
 =?utf-8?B?bHBqditoaHNoQnU5bkpmSVg4VTJQNzJJOXUvdnBYYlRWWnhUVkxXaWlOVHJn?=
 =?utf-8?B?UzdoT0ZjNkxZM1h5TTFLMFVPdEdDMlRFSTJIazB0N2NuUzYrangrR2ZQcU9B?=
 =?utf-8?B?M00rUk5GWkVvbUg2Y0lJSEREWGhWc1hkamJYVE1ieEVMaGY3NzN3b1pTKzdW?=
 =?utf-8?B?QzhqUEV6NlJzdkNRRjVmUlBVVzQ1MFFpS2hlYmNUSXc5MU03T1ZPUWlsV2Yv?=
 =?utf-8?B?ZjF5MjB3Rjh1QU9NVGt1U29XU1p5aS83R1lFNEt4aHFIbW1aeWdWN25lcE4z?=
 =?utf-8?B?MWgzbHRWcW9PUzFINkNBQkI5bHNYVGh3NmxnZzZUQmpkd2oxR2xITFk2d0k4?=
 =?utf-8?Q?lJQWlW?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(7416014)(14060799003)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 04:05:01.5468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b081395-2454-4b89-670b-08dd9c0a7cf4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8104


On 22/05/25 8:11 pm, Catalin Marinas wrote:
> On Thu, May 22, 2025 at 05:14:14PM +0530, Dev Jain wrote:
>> dsb(ishst) is used to ensure that prior pagetable updates are completed.
>> But, set_pmd/set_pud etc already issue a dsb-isb sequence for the exact
>> same purpose. Therefore, we can elide the dsb in kernel tlb invalidation.
>>
>> There were no issues observed while running mm selftests, including
>> test_vmalloc.sh selftest to stress the vmalloc subsystem.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/tlbflush.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>> index eba1a98657f1..9b4adf1ee45e 100644
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -508,7 +508,7 @@ static inline void flush_tlb_kernel_range(unsigned long start, unsigned long end
>>   		return;
>>   	}
>>   
>> -	dsb(ishst);
>> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>>   	__flush_tlb_range_op(vaale1is, start, pages, stride, 0,
>>   			     TLBI_TTL_UNKNOWN, false, lpa2_is_enabled());
>>   	dsb(ish);
>> @@ -523,7 +523,7 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
>>   {
>>   	unsigned long addr = __TLBI_VADDR(kaddr, 0);
>>   
>> -	dsb(ishst);
>> +	/* dsb(ishst) not needed as callers (set_pxd) have that */
>>   	__tlbi(vaae1is, addr);
>>   	dsb(ish);
>>   	isb();
> What about __set_pte()? We only issue (or rather queue) a barrier if we
> set a valid kernel pte. I recall we added them for the case where a TLBI
> won't happen, see commit 7f0b1bf04511 ("arm64: Fix barriers used for
> page table modifications"). When we clear a PTE, we rely on the TLB
> maintenance to issue barriers.


I see, so I think one example also can be __set_fixmap -> __pte_clear -> 
__set_pte.

My original motivation was that it would be good to identify all the callers

instead of unconditionally issuing it for every tlb flush.


>
> Maybe something that can be optimised following Ryan's reworking but I
> don't think it is safe to remove them now, given that
> __set_pte_complete() skips the barriers for invalid ptes. Possibly the
> __flush_tlb_kernel_pgtable() is alright but not the
> flush_tlb_kernel_range() one.


Sure, I think Ryan's optimizations haven't landed yet? I'll take a look 
after that.


