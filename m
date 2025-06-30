Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011016.outbound.protection.outlook.com [52.101.70.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF1E3D69
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.16
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293894; cv=fail; b=YSwxcH0UWsL5QvuRkcqoEHiDPsy8LBnV0SXiYv4om57aE1o+WaVlXh90P0qYdvnNoGEJO9sRkRmDFiqvzYx6GEHShmqYGGjUAXwG3TEyvyE5ZuST6q2jionY+Rr5FDhPGfB0T71nIY50C7YDM2HP6sIHEyUN4kMQy1z7Hjpxgzs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293894; c=relaxed/simple;
	bh=vfsjClZTiaF2MiLSvH631mdj0nXNxck857U5Ryog/b4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D/WcnQbioXGUmcYkB3egZz5nzpXubmLBwxWMub05RCOxDBGGVmv+vp7OASO76ghqVKKiRaobF4zuR0TramcKiGpryEN3WpucPCA13p+mijoX/7bgKKv1OWPYgG1wKz7oiLpcadETCXdZNZhArCuZbO4WoJogR9NXp9nIo0uIkb8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l61mvQzj; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l61mvQzj; arc=fail smtp.client-ip=52.101.70.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l61mvQzj";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l61mvQzj"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=LhOzd5REhILmYzp7NxigpD38X7sBIAj5I4H3zDDeLz8+FUujJSq60XQ9xNT47JeCeY72kde6crv/uuMqxR2jnE12oPL6LUl9hdyo488dP345iFMeXP5it8HvNOpJQtABKCvacxpKhwXZa2WPJgU3aPrDwlmZG21Rt3y+xt8iEbrcrQ5x4yq8HBthLp/t+v+OZlOlfVp2xmz/9/wiBYmGkafCmQnoeIS4Uk/VGRGHVHGIzsVKcBXo/UhG8+ZCeJth1MxSf1+v9hFJcsnPnlALJaycYsCnd0ka8iLgjevau1Fb0c2fOqYakC2AvZJuqNTSwNNlKRdboR8FX3tGNheGgA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCcUTPnPJG+iIjBrwWsJA0FQnvHoRrr3yJFo6jZ9foU=;
 b=BohdlJsPHjuLObuV7LiuE7NWz83tXuyj7tr9N/S9Bf3aCBgwX552ZPivUMarm7TkuCfoyyeUL1AQVJy5PvY8e2lZsV6qVK62SOK6nYwPKpF1sC2f4hoH830Aqj9tbXRXz2elYFQr5RtM1BT+kF1tpSO7TOBMagB2O5vYzQREtfT/chKfun7OWrvgTCNA1zsZ8Hip9rfKsXBur1U8O+NBaAnTsZ6bJccPnSXlbF5dmH9e4xDAjbu+1Rl/kPw06S+ht5RpsVSgQSQA6Fj+f/ONDLxMUW3k6HR6lcDoDKhv08KjK2xRoNg60wRkRV5LEtUpmJvlELZU6gyaPOI4EpzZIA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCcUTPnPJG+iIjBrwWsJA0FQnvHoRrr3yJFo6jZ9foU=;
 b=l61mvQzjVdP/yrHfYe4gpK+Gc0BlsosRPzqwVy3h9grg6dvd1vZJpyrvh8N57YblshEvTLBDUL6nbQ7UIb0xV3VTmGxmJU8+V/iO7qd9BjBU+z4lMSF1+c+8gBVni8OOzxkw3CDrn5JcEES9Y+jXTc4yAvid2n+U4BagN19k8Pk=
Received: from AM0PR10CA0012.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::22)
 by DU4PR08MB10983.eurprd08.prod.outlook.com (2603:10a6:10:570::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 14:31:29 +0000
Received: from AM2PEPF0001C712.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::36) by AM0PR10CA0012.outlook.office365.com
 (2603:10a6:208:17c::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.32 via Frontend Transport; Mon,
 30 Jun 2025 14:31:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C712.mail.protection.outlook.com (10.167.16.182) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 14:31:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yrW73jEliCRntjulglVGrfAmpvEwoWbHUQFUgfYzKmO54sXUbDpw4sREInvdwNRf6xQjMqA5z/WF0gEfSva9McrM81jHkuF2fcA1ueMW/q3Ldaz98tEmbm5n04YZFMIGmXrKm4U7E3SeOCIpZaxg+aMnOTLzjK4TCXQlgPqzOs6N1M7Q9adNhvnMzwtKiGliYTJ3vun4LnYESIBkKkpYRkyua4U9c1Jcoda5H1SSkps22Pd7GWjZBj07KzDTQzs/AUqS8/dOXsx2cFktvA/jggETKv9i0h6uVtMj6EBNKt3A5EnJsspNfxHC9ZaHvE9VP6IKg4qKY/ZVtdFdV8vtJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCcUTPnPJG+iIjBrwWsJA0FQnvHoRrr3yJFo6jZ9foU=;
 b=Q8j5oUfWeGFYPhkQN0pA2s28rdMgIaamnyG0Bg8q2O0GxEsph8MQPM8PLFlvjIiT3+seuwXyVfjgOZellLB2qb1rqdOArmZ+QA5fzkZuBD76Ey1GXL1KUDpud6e1dGcwWXNraEk9B0wF7UN3zotYRy5vy35C689V67QL8tMluBS4qG0fs4yqnITtlJ/x265M7hOFaaXwz6uwZvTbpLBUDHOPzVyVRFoEfdu9cDbNb6ajoxqWOu4+xF0qER8T//4Iysng6/aBvTLbVzV2CVUzlNbUUp5RT8XLptiAC3DT61NRGRq8twAXztDffPtlj1EJ8D3GHr5cPp8BFOJ6rEE7Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCcUTPnPJG+iIjBrwWsJA0FQnvHoRrr3yJFo6jZ9foU=;
 b=l61mvQzjVdP/yrHfYe4gpK+Gc0BlsosRPzqwVy3h9grg6dvd1vZJpyrvh8N57YblshEvTLBDUL6nbQ7UIb0xV3VTmGxmJU8+V/iO7qd9BjBU+z4lMSF1+c+8gBVni8OOzxkw3CDrn5JcEES9Y+jXTc4yAvid2n+U4BagN19k8Pk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB8627.eurprd08.prod.outlook.com (2603:10a6:10:3d1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Mon, 30 Jun
 2025 14:30:55 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 14:30:54 +0000
Message-ID: <4e2ea3d3-d519-43cb-8026-d448e1d8df98@arm.com>
Date: Mon, 30 Jun 2025 20:00:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Reduce race probability between migration and
 khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630044837.4675-1-dev.jain@arm.com>
 <e05103e1-3cdc-4271-b78f-84299d1a4efe@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e05103e1-3cdc-4271-b78f-84299d1a4efe@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0010.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::15) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB8627:EE_|AM2PEPF0001C712:EE_|DU4PR08MB10983:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1ff889-f429-4ad8-6199-08ddb7e2ccb8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YVdQZnAxU1RFOXhISDJ6VWQxcUhUK2Vzb1QxRmhaM3Zhc3dnamlrTmxhNWVC?=
 =?utf-8?B?S21IelRNRTVPSE9ZcmQ2eWc3MXJyblRLWFR3VmhEREtLbkhvSHNYRkFGTUF2?=
 =?utf-8?B?MFBJQ1RlbmZ3UVIwVmVETHpTdzZWN0FPQk4xMHZ3aDlUbTNTZmpIakdsTm1l?=
 =?utf-8?B?VHU1b0ZZTFloaC9aWHh3WFAzU3VhZ2RFT0RNY0U5UUFrNUxINTVQUUZacjRx?=
 =?utf-8?B?cTdzbnZUek5ybndvUnJRY3BaMXh5OTBZd1kwL0F3ZEZiTThMWTlUS3JyS1ZX?=
 =?utf-8?B?UzZmbWlOcC82TWxTb2JCNGpyaXJYL0dyUkY4UDdCNzh1elVmTzlqeWU2TjJy?=
 =?utf-8?B?Q2ZPRm42d1N2YjEyaStYQVE2VGxQSGxxSEFvUlRNNkJYdExyVFh6bVM1NW9n?=
 =?utf-8?B?MUhwQjVhZzhoMjJJZFBVRXh3TjRQKzE1TXlkeVpvV01jR3kyN2c4NXc5dno2?=
 =?utf-8?B?YmY5YWxaOUpPS3Q5N1BmUnAxQ3JxSnlFZE5pR040TU1ieTAzTTlINGtmNUxZ?=
 =?utf-8?B?anZBS2ZjZVNsZGdkOUtYUkJ2SXQzdEVYUFkycjJZZEhYM093QUpCUmJhUUFW?=
 =?utf-8?B?bDdUVXppeEdxc2lQcEtRTkN4NjFkd01lNkhXS0F4QWZvNldwTjdaVXpJWUVr?=
 =?utf-8?B?dUpIUzJtY0QwQlM5bytRTnNzSnd4UkE5akZsbEZVSEwvVmk4TjdwTnJReVdl?=
 =?utf-8?B?dDBIN0NWZnphcjEwVjNZZFRKd3lIZGM2TXFFNnV4M2loQm5RUk9kU1c3c0oz?=
 =?utf-8?B?d3QxeU5wS241ZW0wNEkvdFNWczREd2J6N1V2ZTNESG1LVnRSc0hSMldHSVNz?=
 =?utf-8?B?KzQ2RFR1TjN0VWxqZkJYY0gvRjBWVXZKVDBuemlscjVXZTRzRlQveGlWWUZZ?=
 =?utf-8?B?Ky9iMFdwUEpQNkNadTJwNlF5ZVVqN29wc0N1SGplQlNTMGtJaXF6Nnpldm5H?=
 =?utf-8?B?dmVsb0M4OU50eWh1UWtUUXYzUjIrNi9kMHQ0cC9oZWFValIxVnMvT0JJSUZ2?=
 =?utf-8?B?dndUejJlV01UVC83K2I5NjRMcDNoeTV5TGgza0VVWW9YVVNNOXpOM3JESExT?=
 =?utf-8?B?T0FuOEN3QW5KUUMvd29xK3lCUmJZc3RwRDR5UncxWEZxOVZlbzExdnRwdUFR?=
 =?utf-8?B?RDExSThBZkNIcXhGQnFaNGtJSGp5eDFUV2JOc0x6Vm9EV21xVVp5cHdVanF2?=
 =?utf-8?B?VG5EVUtSZjJVU1lRdzk5cG9EMnpuTXdFbmFmN2xBZUdWYzBkN0dvK2Rlcy8x?=
 =?utf-8?B?Vkh4d2tySjFSTFdwdHdwaFFyb1VBRUl4Z0RMZkJlM2hkc1Fualdad01xTWlv?=
 =?utf-8?B?bTJiNGJwL0lKT2o2NXdiWUFOWlBEd09URjEwWDJtb0Qvb0w4WU50bjlMbTMx?=
 =?utf-8?B?Q09TUWlUOEVHditIMTdvUnI0SzhPNkVlUG9MQVg4aEJtSFlSNWxBMlJVMGhp?=
 =?utf-8?B?UElVejIxWVM1ZzZQVFoyTE4vMmJpNTVmaE5rMlZTTk5ZSXM2TlZhbGJZU2th?=
 =?utf-8?B?Q0N4Y1k4SlZOQ0Q1WGVmWTJ4QzZ3TUtaK1VKcjBUUzJ0eDFsdzBZcXFyL0sx?=
 =?utf-8?B?c3hrOU9HY0FubUdrMFZWR3ZvbHNTblZVVFNhTmF0MGo0elpKaDlBTC9TdGxX?=
 =?utf-8?B?SzBuaGZmUHpMZjVzVW0wK2NaME1LZk0rMW1JWEQ1YzltclZ1MmREMzVsK3Rq?=
 =?utf-8?B?aUVhNnJHYlZxekpDekthUFMrdTBwWnlrNG1TcTJSSkI5eis0Uno4YmZYNC8w?=
 =?utf-8?B?YmlaUUh5TFNxZlZIOGlaNlhLS0hHRk95VEVycFRoeHE4RmZ3YnpXNndDQW1V?=
 =?utf-8?B?VFN0U2VsY2FkbUt0STRJMW5vRUNtdkdrOVVnVFUzVVNYNWRXSnFUYTd4RUdr?=
 =?utf-8?B?UExJV2Z3WnBsZGdzL2ZKSUJ6cTVudzJhYjBRd1U3dnExZldJVk5VOGtzbDd5?=
 =?utf-8?Q?jqebAR5hg14=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8627
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffd2d9da-f9ce-4678-951e-08ddb7e2b8a8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|14060799003|7416014|35042699022|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UVJnRjRnRFpuUTBuc2hjNWRvUlJWeUFLa0FIRGxQSEpWUkhpbnJ2Y05xQUdC?=
 =?utf-8?B?RFpsR0NJd1pRM25DZXdYZUZIWlhnL2V2emRoZldQMWYxVFlUV2toZlBhUG5C?=
 =?utf-8?B?cnJ2WDl0dCszL2Z0QnU2dVN4b3g0TUhEV1JKMWk3L3g3UWJjOTdlZWhNOEhV?=
 =?utf-8?B?UTg4RjRzU2N6SFRIZ2dGMEIrWTllSnNkRStDQzV4OWZmVWhqN1N0czBxUEt2?=
 =?utf-8?B?dXpCVEhiN29mTzdFVktpOUNDN0RoaXYyVDVTTDJ0SVJpV0g2SGpNa0s3cmow?=
 =?utf-8?B?RWhSdmtoNWp2YzBPdUpoNWEzUCtLRnNJZ2oxYVJZbEVtWmVjbmZNZTdPT1hn?=
 =?utf-8?B?R3Q1aDdvMnhIT1hHcmRJTEVFQjdHRFRUVEN3MGtCa2p6a3RsUDBSb3d3elVK?=
 =?utf-8?B?YXlPUlpZVGlSRURyNVJETnN3d0wvbE5GNnhjTy9ZZzV0YmZKQ01BV3BTbzNw?=
 =?utf-8?B?ZS9iN2RYOW83OWJVTTJ2UkpwaEdRSlIrMVYyZnJHSTAyaXgvUFFmSjdyUWc4?=
 =?utf-8?B?M0llWEFUUVlEOERWd1FKRjlsWnZ1dVJYMjNyUHZibStvL3plL3l3b2gwOUlq?=
 =?utf-8?B?bVJHSW0wKzZzUDQrVU1YWnF6b1FYUWk4M0xxdXQzVmluVFdtK29JcGEvK1U4?=
 =?utf-8?B?Qk1WUEo4TldrUUh1L3o5NmE5UWZCSDZxWUxCVFBGRk5Ia2c1c1hSYzdZRTkv?=
 =?utf-8?B?N1BMY3ZyQisxVmprdlQ1dGFhUjg1OWZJVjc4OTNHUDcrekRva2xNbVpkUW1L?=
 =?utf-8?B?S1hHTkNPVXNwa3V1S0oyejlPeCtXcldhc2pMUmJGOGtiRW96amhWbEtmakxN?=
 =?utf-8?B?cm9FVVZLaGMydExwL2dGaFlqQW1sa2hqdFBJK3MwMklzR2ZCQnQrd2d0YnZ0?=
 =?utf-8?B?Q2Z1WWlTRnNYeG5zSUJZalRXMHMwdjJlNFBOWm5JbnFLZnM4NzhkYTd0cEZS?=
 =?utf-8?B?cm5sMk5sQlZvWE5iQ1JrZHgycE9mVDRMdk9zRktyckIzVERBaVB0WStadmw4?=
 =?utf-8?B?NktxSlVxVnczc2FNMGpsT1V4SklaKzFPd3lPNWtUdTBsYmtDN1RtLzgwQ0F3?=
 =?utf-8?B?Z2lFQ3VKaGtCaGs4WTJDT0ovR1pvZ3AvUVFzVlFDaHd3QklnNmtBWGhUL0I4?=
 =?utf-8?B?bk1HQzV4dzNBL1FTMXRMSTBKeEZtZUM4dFlUYm43RHYvSkhKcldlZERjNGto?=
 =?utf-8?B?UXdtd01EQmZFdG54TG56RVpJdkJ1NUlSdDdtamk0UVF3eG5rVVhqNTQrZGxs?=
 =?utf-8?B?QUcwSE1VbXFTQ1J2U1dsQkE0K2lTYnJjVDJLc21LZ1FoYnZlRFAxQ1dLRGp5?=
 =?utf-8?B?UWc4OGZZQmZSWE5NY1FqMER2YS9pa2pyYTFnNTkxS2hpTXJjb2tieWZwS29L?=
 =?utf-8?B?ZnFnN0ZScllmUDlQd0hxNjdPenJPaTZkM1BSbU5ZdEsvWGNRZ0lSTVBGY3Yy?=
 =?utf-8?B?VEtFM2Fza2xtNUdlTGZMWmJCcFl4d2RpTk1SSWcrWEVsODAzeVYzV0o2QldT?=
 =?utf-8?B?RUx0d1dobGp4NXR1WU15RkpsL2FvN2E0YkFmd0tmQ3NxdzVPcDNjVGVUbVY0?=
 =?utf-8?B?ZXoxUVJmanBFZksreTh6U2hTM1VkLzErUjNIRkhmMEZXK3h1UVExdFJZUG9p?=
 =?utf-8?B?aDlKeUVEYVk5MHdvT1RUT3pRNXh2OVBKVCt2bmVQN2RlS1BSd2RQNUV4UWdC?=
 =?utf-8?B?bmFLNlEwMGM2V3FsTTBaZlNEU2VwMG5Kbkx3MWl2WFFEN1AwTy9Id3NrUWNZ?=
 =?utf-8?B?enl3eXpMMmJJd3c5clIxWHltQjlwcE5wSmhSM1lFVUlVSnZpQW93N2JPdGVB?=
 =?utf-8?B?dVQzKzZFTFlTYWtPdEUzOFhZa3IzTVBPbjQvcVA0eERsdlhwQllGclUrS0di?=
 =?utf-8?B?em9qay9CTy9NbFRodUR0Q2k3RWZLanJQdU5SdGhpTVNhQzBnWmpERHRmWTJn?=
 =?utf-8?B?R0VNNzJ1Z1JEOEdGckMzQjRUWFFnMWtISUZsRGhndTNVdjV4V25ZR05HN1Jw?=
 =?utf-8?B?b2RCTnoxQ01XWTdtOEVIZHZvMC9WbGZYWEgyWVBFQ0VLV29sYnhQK0ZJVGJE?=
 =?utf-8?B?dGxrMmNWTHdETW05MVN1NmV6Uy90eG9nelNVZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(14060799003)(7416014)(35042699022)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 14:31:28.0575
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1ff889-f429-4ad8-6199-08ddb7e2ccb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C712.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB10983


On 30/06/25 6:57 pm, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 10:18:37AM +0530, Dev Jain wrote:
>> Suppose a folio is under migration, and khugepaged is also trying to
>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>> and sleeping on the folio lock, since the lock is held by the migration
>> path. Migration will then fail in
>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>> such a race happening (leading to migration failure) by bailing out
>> if we detect a PMD is marked with a migration entry.
> This is a nice find!
>
>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
>>
>> Note that, this is not a "fix" since it only reduces the chance of
>> interference of khugepaged with migration, wherein both the kernel
>> functionalities are deemed "best-effort".
> Thanks for separating this out, appreciated!
>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>
>> This patch was part of
>> https://lore.kernel.org/all/20250625055806.82645-1-dev.jain@arm.com/
>> but I have sent it separately on suggestion of Lorenzo, and also because
>> I plan to send the first two patches after David Hildenbrand's
>> folio_pte_batch series gets merged.
>>
>>   mm/khugepaged.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 1aa7ca67c756..99977bb9bf6a 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -31,6 +31,7 @@ enum scan_result {
>>   	SCAN_FAIL,
>>   	SCAN_SUCCEED,
>>   	SCAN_PMD_NULL,
>> +	SCAN_PMD_MIGRATION,
>>   	SCAN_PMD_NONE,
>>   	SCAN_PMD_MAPPED,
>>   	SCAN_EXCEED_NONE_PTE,
>> @@ -941,6 +942,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>
>>   	if (pmd_none(pmde))
>>   		return SCAN_PMD_NONE;
>> +	if (is_pmd_migration_entry(pmde))
>> +		return SCAN_PMD_MIGRATION;
> With David's suggestions I guess this boils down to simply adding this line.

I think it should be

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 1aa7ca67c756..8a6ba5c8ba4d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -941,10 +941,10 @@ static inline int check_pmd_state(pmd_t *pmd)
  
  	if (pmd_none(pmde))
  		return SCAN_PMD_NONE;
+	if (is_pmd_migration_entry(pmde) || pmd_trans_huge(pmde))
+		return SCAN_PMD_MAPPED;
  	if (!pmd_present(pmde))
  		return SCAN_PMD_NULL;
-	if (pmd_trans_huge(pmde))
-		return SCAN_PMD_MAPPED;
  	if (pmd_bad(pmde))
  		return SCAN_PMD_NULL;
  	return SCAN_SUCCEED;

Moving this line above since we don't want to exit prematurely
due to !pmd_present(pmde).


>
> Could we add a quick comment to explain why here?

Sure.

>
> Thanks!
>
>>   	if (!pmd_present(pmde))
>>   		return SCAN_PMD_NULL;
>>   	if (pmd_trans_huge(pmde))
>> @@ -1502,9 +1505,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   	    !range_in_vma(vma, haddr, haddr + HPAGE_PMD_SIZE))
>>   		return SCAN_VMA_CHECK;
>>
>> -	/* Fast check before locking page if already PMD-mapped */
>> +	/*
>> +	 * Fast check before locking folio if already PMD-mapped, or if the
>> +	 * folio is under migration
>> +	 */
>>   	result = find_pmd_or_thp_or_none(mm, haddr, &pmd);
>> -	if (result == SCAN_PMD_MAPPED)
>> +	if (result == SCAN_PMD_MAPPED || result == SCAN_PMD_MIGRATION)
>>   		return result;
>>
>>   	/*
>> @@ -2716,6 +2722,7 @@ static int madvise_collapse_errno(enum scan_result r)
>>   	case SCAN_PAGE_LRU:
>>   	case SCAN_DEL_PAGE_LRU:
>>   	case SCAN_PAGE_FILLED:
>> +	case SCAN_PMD_MIGRATION:
>>   		return -EAGAIN;
>>   	/*
>>   	 * Other: Trying again likely not to succeed / error intrinsic to
>> @@ -2802,6 +2809,7 @@ int madvise_collapse(struct vm_area_struct *vma, unsigned long start,
>>   			goto handle_result;
>>   		/* Whitelisted set of results where continuing OK */
>>   		case SCAN_PMD_NULL:
>> +		case SCAN_PMD_MIGRATION:
>>   		case SCAN_PTE_NON_PRESENT:
>>   		case SCAN_PTE_UFFD_WP:
>>   		case SCAN_PAGE_RO:
>> --
>> 2.30.2
>>
