Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF292820D5
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750849994; cv=fail; b=GIeyHi7W9Ehdl6TxbVXvjlvCEgf4JUvj6qcTmlWj32fBsmqoMHEdOvmr/i5FerXpEXgAv3MMiIF09nM8U9GSL9e6/GAImWkuqppXX3K3Xxp72MPhCR1KkZUMDinfchYZaRBnFYoxjkGF5uzR9uzQv0WuqFCixcDtxuGWOh2I1TM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750849994; c=relaxed/simple;
	bh=Wiv+Kh7ze4OVJNZF9CWJ6DhSxR1unK0rd2ZsSk6lFYs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=niEU8GSUsN+M/W1KVTI71rEPjICM8Lxmsga4yoRLQL3BSpEzyKeC/yN93JntAUKaimI0ghYClR54JqzF+9mbzO+Fzu2nTyWShuPUhKOSvHEECa7NGxzdu1jOw1SDxQKGhT5k5Q2RZDy0627KtnJmb2fLcHV5Azg0PiEggFb0ZX4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eE45bIu5; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eE45bIu5; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eE45bIu5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eE45bIu5"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=md0f0lsh6UB/zJmn81gcA5tP/PS5DfrVud0DlH3opK21LT3o1nXZUY1doZcDiVHnlxocnweCoyg/VIcaF3G+BrV45tC2DunDQAvn5KxpTvAaEPG8tXs9lLQiktE9t+TBFVTS6dP3juA4Afh0+KY8SESrbogRk7Oapnz5s/meaU8FlE7GGAy0cKESLAtCPBMS9sQndyKmI/MiUXUvhwclwqa3aoSS+jDHxe4K/azYADs7SDWgphX7exYvFt/sq6SEELrB3LmJ71RrpmkL4XuJjvgNOgdVmlhEhGVT0WtHHSxQgMpeJIhcAWa86Ou60fMlmr+EpQxyiRaZzSSnm0VsKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiO08GXvCOp8n2rL26XB+oa3z8lnjURczMR1h63ZbbY=;
 b=Tk8LrZpOpqzh2xCBQnCkT64s+h1eB8BrIOxD92L09W/pu9Nzh5W8opq8dlWaCt9Et720uTi4DhpyI57tkCXEzD86SOzd3O1OHDZ7YHS3mp8Kedu5ezbUvnt1UOz8xPLk4Q1XWWHumwnkmWohnGdA5vSIrRJzaIbAp+bn9hMB8NqyfsMlYuj/klKCEQ/Fcb0XYpvz92Y4vxoQLPwgHItSRS31f0Mm9y7Fr0DDrwSK5FeTCCFgoVATwfC/S+nstz/b864Lz2eX5lSKVhBG90ijatu9b62QvzbITrcs4SiU5qKp6yAKn+NpdCU071dhCXKHFGKhc81a2qw/SwhMVhtTKA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiO08GXvCOp8n2rL26XB+oa3z8lnjURczMR1h63ZbbY=;
 b=eE45bIu5f14Zpdvkdp9avxO54a+QK2GY1tbhIOgFNd8umc+T4wTcQpKanjFNTUnVDFam1b6sdFZP6OTcscwpLtpWyZhYsECSDIoNTNfQOYRxqsuRTKt5H0v+0ZgjLwISDJ1csRwRlvdbUmCqSd5qpDY01wOerUAgaQQFvmSlF1U=
Received: from PA7P264CA0268.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:375::16)
 by DB9PR08MB7651.eurprd08.prod.outlook.com (2603:10a6:10:30e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 11:13:02 +0000
Received: from AM1PEPF000252DE.eurprd07.prod.outlook.com
 (2603:10a6:102:375:cafe::bc) by PA7P264CA0268.outlook.office365.com
 (2603:10a6:102:375::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 11:13:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DE.mail.protection.outlook.com (10.167.16.56) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Wed, 25 Jun 2025 11:13:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSiO/DUdD6Ltux4jDLegsjprkZV1S+jnxQ9o7IRiTgWnhe9NBKOUZI75Q0A+SB0ecKoNW/Gt7oDyb3zBYy79EUdzPXjmyr3GKWFc+YRLaejYzmnimwv66QLBZZE6uu29drbR6XfvMa3Sdgz95N76tlOOdz7p61WA88+JS038V9rxoYeCtEowPXlG+wO4ka5KYTRf5y4r4Ol6W07YyTBCtqF6EQC7m9zQaQT1QroCmK/FNzeWrj9XhrxE33jQllNVW4ec1Zk1Gy2b+fgdmFqKk8XV+hCK9Bv3GpJNRy/mnGdx0JVr/7oeimRQDkh/w494T0NT7YJF9zLV0rOpCjLOqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uiO08GXvCOp8n2rL26XB+oa3z8lnjURczMR1h63ZbbY=;
 b=tnJi3jt7ZyMQ+tqMjlQwdH3voIaax9+yrQZY3lJr51nWYjhbI0XBmRRNTwtM7yn8/juz8mdjNQVcac88uJH4m5WJa55V0yDGt67dy8wvmZZJjBGUgzGKnvd/TiiTAzmwmK76AvEPXIqBV6e7rgwwlYvyYlU6JN4YGFxfmPvvJ2yOCxL6OPy/JOiqgRAMkd0b0NSNHb+dWubl2YBFBLhE7fwASbWkPYs2G62dttIuwX4PEDtw7YyGUdnY57rR3Jt+TtKtd67Vn/YDeX4nwhfA9e2JjUh1s41jVY7YaWLYHLHluOJmYfZ7TD165ZaZDS29EZTXhNdjLY5weDSnl+gDUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uiO08GXvCOp8n2rL26XB+oa3z8lnjURczMR1h63ZbbY=;
 b=eE45bIu5f14Zpdvkdp9avxO54a+QK2GY1tbhIOgFNd8umc+T4wTcQpKanjFNTUnVDFam1b6sdFZP6OTcscwpLtpWyZhYsECSDIoNTNfQOYRxqsuRTKt5H0v+0ZgjLwISDJ1csRwRlvdbUmCqSd5qpDY01wOerUAgaQQFvmSlF1U=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com (2603:10a6:10:2c7::19)
 by AM8PR08MB6372.eurprd08.prod.outlook.com (2603:10a6:20b:369::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Wed, 25 Jun
 2025 11:12:26 +0000
Received: from DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb]) by DB9PR08MB7114.eurprd08.prod.outlook.com
 ([fe80::515:9f73:5a61:fddb%7]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:12:26 +0000
Message-ID: <805f60c7-9c76-4adc-a679-658d60e08a3e@arm.com>
Date: Wed, 25 Jun 2025 16:42:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
To: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
Cc: anshuman.khandual@arm.com, quic_zhenhuah@quicinc.com,
 kevin.brodsky@arm.com, yangyicong@hisilicon.com, joey.gouly@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 david@redhat.com
References: <20250616103310.17625-1-dev.jain@arm.com>
 <01b48f6c-81cf-499c-97f7-0b537364c5e7@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <01b48f6c-81cf-499c-97f7-0b537364c5e7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0120.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::9) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7114:EE_|AM8PR08MB6372:EE_|AM1PEPF000252DE:EE_|DB9PR08MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: 5689fd0e-8cf8-4986-2b55-08ddb3d93f3a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K1lKcFN4TzRhNGUzUHo3ME94MU00QitKU3pFRWVJQmZKbE8wK2JuejVmaDZq?=
 =?utf-8?B?Z3RyV1RuVmc5b1cxWFRhdk9iWnNJVDJTUUgxU1VYcDd2c1lXZ2tyd0IyOTl2?=
 =?utf-8?B?eTN5WWtMYVF5eWVabU1LZDR3cDNuM3oxNTlBV1lZS1JodDlKWTdCaWt2NXpl?=
 =?utf-8?B?eVdURExIMUtXZFhsSitxVXlwT25mY0YrWndFc2tlT1VBblhDalpLb1BTY0Ex?=
 =?utf-8?B?L0gxalBQMzVGTnRObWxmVmNqTW91YVpBREVKOFRvdHZyU1RWVXkyZ3NSTUZ3?=
 =?utf-8?B?R0hQK25KeXIwU25pZlNYaUtFVm9mVDVKNisvOTJPVmJjT1JuZDA4eUtIWTIy?=
 =?utf-8?B?dTlUSDFyVEZFeDArRTBMTUJBVnlaRWtOdncvOFJSUDBhOGJKUFJRbnNhREhY?=
 =?utf-8?B?NG9PRnhIaTI4YU1MM1VVcjBZQ1dKRGhMNmprRjNxc3ZlbXMvNk8zQlZ5eW45?=
 =?utf-8?B?WWJHRHZTbS9RTEVjdG1FQnZ1eUtwS2YyUTBSc3VKNEpoVVBoTStrZ2hwWXV0?=
 =?utf-8?B?YkpUVTdldEdpY3VKVGpWcDJGZmIvR01TYnQ1VmxTS3lCbFp6a2FUbTBKU3lt?=
 =?utf-8?B?RTNpUmpqRk02NXU2VHBLRmJXcGF1QllLMzl2WjB0QWRLc21DN3lQMXYzL21K?=
 =?utf-8?B?UTdmSyszUW8xK0F0NytaaCtKS0Y3dXViT1IrdG4yQ0kweUVDM09yME53RGg3?=
 =?utf-8?B?SENzSHpZbmxLN1UrU3RvaDF6WERJaDdZZFVTdW5nTkpJTmZ3dGJmNDErSVkr?=
 =?utf-8?B?d2FlTkY0R0h4bVJqMFk5a3ZuV1JldFZMN1JRL1VhM3IyUitmck5PcG1VeEJY?=
 =?utf-8?B?ZmQ0QUNnK1FPRmdacmFDeEdKd0FseTcrTUJ3Vzdrb3JCYmF2NzNPS0gxSHE1?=
 =?utf-8?B?aGhzRm9Yd21ROGZoL0JMRWJLVnJhYTEvcGpYbU4xZ05ZZWR1TUVhRWJxUTNN?=
 =?utf-8?B?TFNrQVVuYmtkTC9Oclc5aXlyUnRMcFNhUGZVeWJlMkFDVnRoYXBJVUtyWnVu?=
 =?utf-8?B?NGd4MkF2dlhOTHN4cWxyTjA4KytuM1N4dVExT0dyaGdOSGNSVnJDZWVmbWpn?=
 =?utf-8?B?eUlLbkttOFZaWXRLQTJPQ0p2Umg2aGxVS003c3ZlOFRqbzNlc0dFV0RMOThx?=
 =?utf-8?B?ekx3ck1VdTR3SWJPOUovaHdmZVEzRkUvaFl2MEZYV2FyNG9URDRBYlF4Sm1U?=
 =?utf-8?B?VGJ5SXlhanhheEk0ZTExSm12aGtaMkFVL3FJeGE0ME5NdUxNUmIvdUFraGx4?=
 =?utf-8?B?aEhIYnBtRGdkK052bW5QQXpWNHdUWkt3VS9jK0tGS01aWjcrWlArczREOTFE?=
 =?utf-8?B?SUNoUE1kdEVkeXRzalhHb2FsT1lwZ2VDcUFJV0pmbjR2Wnc0N2k5TlZaamQz?=
 =?utf-8?B?S1g0emgxUDN6ZmRVNm9LaHAvWG9OTENmRGNtVW1JVmxyNXZVazQzYlFQOVFH?=
 =?utf-8?B?ZmJDbEplYW1pTTNBN0dERWRISDUwL3A5Y0lZQ0hNMjJGaUlxRjJPbnNpa3FI?=
 =?utf-8?B?WFVHVGF4SE1XSldBR1Vvd0JXMEdpdnpiMk1QY09hSFBlZHIySnBrdkZxbjNt?=
 =?utf-8?B?SDJza3dMc1BDZnYyUkRoZHJlclYyWGZja0RmM1RlVXZQMldSQUtsMWpuYXhE?=
 =?utf-8?B?WnROaDBxMDhLaUFiNDc1cjlrSURwaDM1ZzVJbVRlTmFoS1l1NTd3ekRQQ2py?=
 =?utf-8?B?emtnTWdoWHlRYzFuTE9zK0dXQTk1N2lwK2VXM0l2ODFQWWlFOVFmOExOMEE2?=
 =?utf-8?B?ZFNmY01qN1VJN1dpbHFSL3pOMU1MWmdwYWZmSW1nd0VZTXFvd1N6NWlvV01q?=
 =?utf-8?B?OWNHV2RZMkxlcmtDNXo4bXROMndlZXhac0Yxa3hlVFRXNFhVdTR1Z0FNODZi?=
 =?utf-8?B?ZmtkOTRKazl1emVlU0JIOWtMUW4wMnloQ244REZwRndLdlE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR08MB7114.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6372
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b85a6c36-32d7-4114-fdd0-08ddb3d92a74
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|36860700013|376014|30052699003|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzNBQ2FwcVV2Z0hrV1d4OE5kV1cxVStLWnd6OTl3cEoyWlVRK0NPeW5TdVFF?=
 =?utf-8?B?cVlnalM3TEtCS0NMN2dCbXdXMHZzNnQvbisxS2tTcnBjN3RKOFlQT2lZUDZo?=
 =?utf-8?B?dkNSUVRoN2hkZjZvTlB0Qm5IVE9lb2MzaWpVYmNwUGFrbHZYNkhwWUNsNG50?=
 =?utf-8?B?Vk52c0tpRlk0T1JEemp3REhXb04vYnorVlhtc1JTY2NjQlg2ZmdwRFpRK3ht?=
 =?utf-8?B?bUZNT3Z5VUlzNGJFU3VVd2RHYVduWUk4aHZzY3dNNVh6M0syRGpZTGVuY3dU?=
 =?utf-8?B?UWI4ZCtYMmppa3k0azZuZnloMkxMbzFrbm82ZGJFYTcrd0hXMUdXdk9DNTlL?=
 =?utf-8?B?M0lvRUdTd09zY0VEYll1WHVoVVdvNW9JUEM4ZHlWaVJYZXpOVHJJWUVvem9t?=
 =?utf-8?B?cloxT0I2UnNuNjVKVUxBU0t6bDA4QTVmakUySjZHSGNTUjJiZ3NUWFBJS0d5?=
 =?utf-8?B?TW5CMGIvaGQzaTlzc29ZcUp4N0tCZTRQOUFkUk03K2o1T0pWZW5PdEtHYm1a?=
 =?utf-8?B?elJhTnZmZFo4VWY4OEpsZjV3TFk1WlZnZGdBRUs0V3NNRkNMdkROR3p1eHdG?=
 =?utf-8?B?UDBiWFFLcTRIT2k1bUo5UHZ4MzRFbldXSmxreE9YcHV0SGVvM1k4NHl5ZkdO?=
 =?utf-8?B?Q1BwR3ZMVGpSSkFua1BTS1paUlMwMkhmdWxyTXZmT2E4OHRxcmxkNmU4WVFV?=
 =?utf-8?B?cDRXdkw1SVkyTTJJTDM3ZnlUcmp4Q0l5VFd3NGc3SDcwaHZZaGNhTkRYSEsr?=
 =?utf-8?B?dkU4NkxoRGVYZjVpcnEwMSsvT0dCOExOWGdHU0J2RFBBRkdrckdxRzNrNkh3?=
 =?utf-8?B?TXhOK1BVWE9uR21xL0ExS0l0NDIweXNEdTRwTVdxcGJweEZSNGNsR21adnFp?=
 =?utf-8?B?SkJFQVNmc3owamFsUlQ2b3JIUi9QcXQwM3U0bHppOU9PRzRvbjNOdSsxOWJQ?=
 =?utf-8?B?NFFNeFF5QlEzdUt1WG9aNGVQeWlFN0tQV3d0U3R2Mk9MYVFxcDJUc0E3elZ4?=
 =?utf-8?B?YlJEZGlsOS9GeWk0TDZOMlpXRTFobmxnN2hmQm1SNmEvaVpoK3UzK2JydHRN?=
 =?utf-8?B?SHRsSmUvYTVBZG9LYVU0ajliUUwvTHJqc0hhNnlMZjc5ck1Za3VqbWJCZUhi?=
 =?utf-8?B?RkdCbnl6MnlseXJNTzllMTJKVGxEM1BaaHU1VHBUcVl5bUh6R0pqSTh2ZGcz?=
 =?utf-8?B?c25FWkRPMk1ZbG5GdkR1OEc2Z2VQajJHSWdHRWhhcXJDNWh1aUY3clV2ZXlD?=
 =?utf-8?B?MGxaNWMzMkMvcUF6bkhhR1J3WXpyMlFEenVmS3U3TFRSUzFjVXNxeHE0TXhC?=
 =?utf-8?B?ckNaZCtSR2ZSVGZMOTZ2Q2g4MVd2UkVGemg2UDE0U0RIYjR3ZXVmQVNDUjRy?=
 =?utf-8?B?bFhoWDgwQjU0TzdVQUM1cnZhNnE0M3laVFRXSUtGV3pXT2V3NVQwTGk2UTBM?=
 =?utf-8?B?Q0hHa05aVEJWbHBCc0pSZ2JlQW9jSkMxUHJBQWR0ditSZ3FKd1VHVkY4bFAr?=
 =?utf-8?B?c2NDR0Z2NHIzVURCYU9mSC9vOTBiQ2RsV2N0OWZXKzRJQUhQUTQvYTAyblc5?=
 =?utf-8?B?WXZ1ZDNHZnhUZTV5OW9DUXFrN1NXaGh4SnVDY2VIVjR4U2ZFSVNicEg0Mnlo?=
 =?utf-8?B?MkJkOThhS1pHaWNheEoyZ205SDJCN0JlZXM5MER5a3hpdGJVTlZybWVJRFNi?=
 =?utf-8?B?R00yeVdUUmtJZ2NWM2lGTVltK015VTN0NVh4OEZGb2dlQ1RsT2F1L0FONXFS?=
 =?utf-8?B?YnZDZjUvOHJ6WVFHdnAwMTdrNlFmVVl4QXlCSWpQWW1pa0ppdXM5andmbUdE?=
 =?utf-8?B?TFNmdGxFdVF3SjNHbU9kMWRYQzFOLzNVMVRrYk9LZmtiSm9tS1VyYjh2V0pP?=
 =?utf-8?B?MUtiTUxSN1IxdE9Dc2N0Mjl4N0RydVFVVDhabUJHQVlGN0h4bmR6U04rN2lk?=
 =?utf-8?B?dFNOdzBDK3NPbWJMZS83ckl4Y05KeUlOYUFDNEgwZFE4VUhJU2p1bjh6MlNv?=
 =?utf-8?B?a1ZWaTNUTmdNS25HWEtlbm00TjY2ZFpmWW1WWGtpazloNGNPeDJnYkVtQkhu?=
 =?utf-8?Q?rFqxbv?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(36860700013)(376014)(30052699003)(35042699022)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:13:00.5537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5689fd0e-8cf8-4986-2b55-08ddb3d93f3a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM1PEPF000252DE.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7651


On 25/06/25 4:05 pm, Ryan Roberts wrote:
> On 16/06/2025 11:33, Dev Jain wrote:
>> arm64 disables vmalloc-huge when kernel page table dumping is enabled,
>> because an intermediate table may be removed, potentially causing the
>> ptdump code to dereference an invalid address. We want to be able to
>> analyze block vs page mappings for kernel mappings with ptdump, so to
>> enable vmalloc-huge with ptdump, synchronize between page table removal in
>> pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
>> use mmap_read_lock and not write lock because we don't need to synchronize
>> between two different vm_structs; two vmalloc objects running this same
>> code path will point to different page tables, hence there is no race.
>>
>> For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
>> 512 times again via pmd_free_pte_page().
>>
>> We implement the locking mechanism using static keys, since the chance
>> of a race is very small. Observe that the synchronization is needed
>> to avoid the following race:
>>
>> CPU1							CPU2
>> 						take reference of PMD table
>> pud_clear()
>> pte_free_kernel()
>> 						walk freed PMD table
>>
>> and similar race between pmd_free_pte_page and ptdump_walk_pgd.
>>
>> Therefore, there are two cases: if ptdump sees the cleared PUD, then
>> we are safe. If not, then the patched-in read and write locks help us
>> avoid the race.
>>
>> To implement the mechanism, we need the static key access from mmu.c and
>> ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
>> target in the Makefile, therefore we cannot initialize the key there, as
>> is being done, for example, in the static key implementation of
>> hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
>> the jump_label mechanism. Declare the key there and define the key to false
>> in mmu.c.
>>
>> No issues were observed with mm-selftests. No issues were observed while
>> parallelly running test_vmalloc.sh and dumping the kernel pagetable through
>> sysfs in a loop.
>>
>> v2->v3:
>>   - Use static key mechanism
>>
>> v1->v2:
>>   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
>>   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
>>     the lock 512 times again via pmd_free_pte_page()
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   arch/arm64/include/asm/cpufeature.h |  1 +
>>   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
>>   arch/arm64/mm/ptdump.c              |  5 +++
>>   3 files changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index c4326f1cb917..3e386563b587 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -26,6 +26,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/cpumask.h>
>>   
>> +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> Is this really the correct header file for this declaration? Perhaps it would be
> better in arch/arm64/include/asm/ptdump.h ?

I tried a lot of things; this didn't work. I get the following:

ld: arch/arm64/mm/mmu.o:(__jump_table+0x8): undefined reference to `ptdump_lock_key'
ld: arch/arm64/mm/mmu.o:(__jump_table+0x48): undefined reference to `ptdump_lock_key'

in case of !CONFIG_PTDUMP_DEBUGFS.

>
>>   /*
>>    * CPU feature register tracking
>>    *
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index 8fcf59ba39db..e242ba428820 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -41,11 +41,14 @@
>>   #include <asm/tlbflush.h>
>>   #include <asm/pgalloc.h>
>>   #include <asm/kfence.h>
>> +#include <asm/cpufeature.h>
>>   
>>   #define NO_BLOCK_MAPPINGS	BIT(0)
>>   #define NO_CONT_MAPPINGS	BIT(1)
>>   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
>>   
>> +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
>> +
>>   enum pgtable_type {
>>   	TABLE_PTE,
>>   	TABLE_PMD,
>> @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
>>   	return 1;
>>   }
>>   
>> -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
>>   {
>> +	bool lock_taken = false;
> As David commented, no need for this.
>
>>   	pte_t *table;
>>   	pmd_t pmd;
>>   
>> @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>>   		return 1;
>>   	}
>>   
>> +	/* See comment in pud_free_pmd_page for static key logic */
>>   	table = pte_offset_kernel(pmdp, addr);
>>   	pmd_clear(pmdp);
>>   	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
>> +		mmap_read_lock(&init_mm);
>> +		lock_taken = true;
>> +	}
>> +	if (unlikely(lock_taken))
>> +		mmap_read_unlock(&init_mm);
>> +
> As per David's comment this can just be:
>
> if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> 	mmap_read_lock(&init_mm);
> 	mmap_read_unlock(&init_mm);
> }
>
>>   	pte_free_kernel(NULL, table);
>>   	return 1;
>>   }
>>   
>> +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
>> +{
>> +	return __pmd_free_pte_page(pmdp, addr, true);
>> +}
>> +
>>   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   {
>> +	bool lock_taken = false;
> Same comment.
>
>>   	pmd_t *table;
>>   	pmd_t *pmdp;
>>   	pud_t pud;
>> @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
>>   	}
>>   
>>   	table = pmd_offset(pudp, addr);
>> +	/*
>> +	 * Isolate the PMD table; in case of race with ptdump, this helps
>> +	 * us to avoid taking the lock in __pmd_free_pte_page().
>> +	 *
>> +	 * Static key logic:
>> +	 *
>> +	 * Case 1: If ptdump does static_branch_enable(), and after that we
>> +	 * execute the if block, then this patches in the read lock, ptdump has
>> +	 * the write lock patched in, therefore ptdump will never read from
>> +	 * a potentially freed PMD table.
>> +	 *
>> +	 * Case 2: If the if block starts executing before ptdump's
>> +	 * static_branch_enable(), then no locking synchronization
>> +	 * will be done. However, pud_clear() + the dsb() in
>> +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
>> +	 * empty PUD. Thus, it will never walk over a potentially freed
>> +	 * PMD table.
>> +	 */
>> +	pud_clear(pudp);
>> +	__flush_tlb_kernel_pgtable(addr);
>> +	if (static_branch_unlikely(&ptdump_lock_key)) {
>> +		mmap_read_lock(&init_mm);
>> +		lock_taken = true;
>> +	}
>> +	if (unlikely(lock_taken))
>> +		mmap_read_unlock(&init_mm);
> Same comment.
>
>> +
>>   	pmdp = table;
>>   	next = addr;
>>   	end = addr + PUD_SIZE;
>>   	do {
>> -		pmd_free_pte_page(pmdp, next);
>> +		__pmd_free_pte_page(pmdp, next, false);
>>   	} while (pmdp++, next += PMD_SIZE, next != end);
>>   
>> -	pud_clear(pudp);
>> -	__flush_tlb_kernel_pgtable(addr);
>>   	pmd_free(NULL, table);
>>   	return 1;
>>   }
>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>> index 421a5de806c6..f75e12a1d068 100644
>> --- a/arch/arm64/mm/ptdump.c
>> +++ b/arch/arm64/mm/ptdump.c
>> @@ -25,6 +25,7 @@
>>   #include <asm/pgtable-hwdef.h>
>>   #include <asm/ptdump.h>
>>   
>> +#include <asm/cpufeature.h>
>>   
>>   #define pt_dump_seq_printf(m, fmt, args...)	\
>>   ({						\
>> @@ -311,7 +312,9 @@ void ptdump_walk(struct seq_file *s, struct ptdump_info *info)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, info->mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   }
>>   
>>   static void __init ptdump_initialize(void)
>> @@ -353,7 +356,9 @@ bool ptdump_check_wx(void)
>>   		}
>>   	};
>>   
>> +	static_branch_enable(&ptdump_lock_key);
>>   	ptdump_walk_pgd(&st.ptdump, &init_mm, NULL);
>> +	static_branch_disable(&ptdump_lock_key);
>>   
>>   	if (st.wx_pages || st.uxn_pages) {
>>   		pr_warn("Checked W+X mappings: FAILED, %lu W+X pages found, %lu non-UXN pages found\n",
>
> With the improvements as suggested, LGTM:
>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
>
>
