Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010024.outbound.protection.outlook.com [52.101.69.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B02288A8
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.24
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750304967; cv=fail; b=EUTNsfiTdU84kv09geA8H77hGOy0M42MI5pdX5DL+ATvRgNu/2KdzKyIzYMNUvkTYlTOmTUT54DmqJDfpMddrpU6qPBhiuvAvzA1tyJzpkadELWriMjtnRb57s2B0E8VmBI9DTKIomo+0joqpw9i+4cXg+Vlexi3Pn0h+qBdK1I=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750304967; c=relaxed/simple;
	bh=PRekhejw76pnbOnYFk5+/VGJ0o5/rcYXMRg2MKAfwHY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qgBM/ZL4/NmVep7sS8aH/eKhVVTtPh6ob3SHXEGgeK0JFVPyxX4wYaYF22ZtS+5UA9zhPH/IaStbnF9EYk4dViZSSWo+tMKnYIzDPR80nMaUXv8JEtZgB+0jHR0OmF4iIm5pc2TYjg5SJj86h4JrFPUqHrtdqBEoCjrXWXKjuJY=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ILp4aJBf; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ILp4aJBf; arc=fail smtp.client-ip=52.101.69.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ILp4aJBf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ILp4aJBf"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ICvjIlujb6eO/poHiByoCLp4mJugNxd0QCckqMhbVJDQKYRx2Jhc+c6ltXW4T5ggZBGxtvdqCrxVD94MOZF1z/wZGKB51VUjZgE84+7AhYYu0poGCZSrUS5Ogt1QP+bzOpBe1cHkphu0W3+oyJe8tHRwWhd1CZ+8yp2PbMivr+QnNyKMX3YFWYUOoz3mX7SzhK1yApD1shl6Z/KvNlR4eAc5E5qDR2NPFNNHmnw1uEQikcJObIg5EFCTRpo1+Mw8yr6VBzA47l0v4++idpqepef74B8wUt3WmJZ6FlV+dZ9gkWaSAcexpSVYT5bXga0Eddc6e8VQOxNZyLAcQ8GSwg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF25Fp8mDlJ2GE1ZEaSrLssgm4ItH40RTKcRbMZNvSc=;
 b=N+4eUpgnaem2etqxQPG1PMB5rPX8b12ItL/W8oZP3LU1M8W6tigPHetLplnpCGR+W+oA4YLuSAikvllflVIiQqSl0sh3/L15bFaFJspxmrW2u72aoXAnmZor+p7WADMgxHqmXFbfKpruRb+bzCaB/biktwF+8HRb7849YKjvQO3TuYCQjVaXpAQJ4S2aP2CZsRuO0X2kyRGnh9UgSeMEGiEUD67AYh+G4wjigrmLTgrJOVEqS/DpF3wlrEHU6QtJrhnM4MA2magk1f0Pu5tU0arPm+bFrmFlPLhUj9KGBiQnwB5/GL1XRbeV8zCNHyGN4J3hJaxHPUqTuTzJ9eZdtg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF25Fp8mDlJ2GE1ZEaSrLssgm4ItH40RTKcRbMZNvSc=;
 b=ILp4aJBfXNiAIT52GCn5KKGNz8Ww7MqkONFdkvQmeEyI+KCn7gcVSSuINYgu4hgP5FKunfIAIDMewbGD1MHrM1thPk2NjhDyU3abc+HsOOqEHnwTz0N6kBW8YCiQ21hF91yxaqLsDqYYOcGqZC9KNUPUD1P2VBDZd4l4pSHVZqE=
Received: from AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17)
 by VI0PR08MB10617.eurprd08.prod.outlook.com (2603:10a6:800:20e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.38; Thu, 19 Jun
 2025 03:49:18 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:208:fa:cafe::3c) by AM0PR06CA0076.outlook.office365.com
 (2603:10a6:208:fa::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.36 via Frontend Transport; Thu,
 19 Jun 2025 03:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 03:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0cG9bHFP1mp/B8MN7xXa5rHhsbTQBYRHlvr1QCDczmFDtQlnBu5Jr6o/mAxvznlPMIg1rcSlxxci298Fxtlr2Q/HUpytCON5//rifSb57evbToeQrek+jTEgDllVdy160CW4aAg5ZACIq8bYmX2tUIKw3jG7Zio8Rox1Eu1zY16sKGcs1My+CDWc9Zq4WL7M03RJRmsOLvMlzLuiXrUxUJUdWVHTRaBA6mM8XOQkrZ78jEkZ+XHn3v64cyF3py3OfbXwBlPd+2Xp9Z/DqVyX12/igq5qbCDCApxoRAmu7xp6Fxj+EKBlZOR1IJ9dmNZiS+awgBfjsq/oCuhoJzl/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hF25Fp8mDlJ2GE1ZEaSrLssgm4ItH40RTKcRbMZNvSc=;
 b=vI9q7rtHGb6aB8aZTy0M1RtIfNU03oQgeXrhRdGVUdpc5/VCNNO3H4lvKzh+wJ0D9zZL9PGuDTyYzLitDrKkEAIQmZO+avkMHoiK+hIo1+fnuMF2tbbrF4pMadCZYMggvas2Dblmr0N3d7qIXzRlkfoHvkSGV0hvzNiUVp+AGK5AzykhkxD3iuXmPRJLX93ZTtU13NFB7X4L+hafiG+aPVU9N5S9EiLQ3hMAk2kGiSpmv5d/RNWre9FvHCxmT1W5tkjfMwXbjvVRdmxNDTvZMItm7vaYvXg1IMDPpstJQbDG1qq/beSdarJyf8+g0A+RwOmQZSoNcJaPmJ1pRY8oNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hF25Fp8mDlJ2GE1ZEaSrLssgm4ItH40RTKcRbMZNvSc=;
 b=ILp4aJBfXNiAIT52GCn5KKGNz8Ww7MqkONFdkvQmeEyI+KCn7gcVSSuINYgu4hgP5FKunfIAIDMewbGD1MHrM1thPk2NjhDyU3abc+HsOOqEHnwTz0N6kBW8YCiQ21hF91yxaqLsDqYYOcGqZC9KNUPUD1P2VBDZd4l4pSHVZqE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB9PR08MB9777.eurprd08.prod.outlook.com (2603:10a6:10:462::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 03:48:44 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 03:48:44 +0000
Message-ID: <164d06b5-1640-4b0e-bc60-cd886bc5a98a@arm.com>
Date: Thu, 19 Jun 2025 09:18:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] khugepaged: Optimize collapse_pte_mapped_thp() for large
 folios by PTE batching
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250618155608.18580-1-dev.jain@arm.com>
 <cd871535-f606-4f2b-8fb2-e3520a2b000f@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <cd871535-f606-4f2b-8fb2-e3520a2b000f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0116.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB9PR08MB9777:EE_|AMS0EPF000001A2:EE_|VI0PR08MB10617:EE_
X-MS-Office365-Filtering-Correlation-Id: 6189b309-4d71-4125-3bf8-08ddaee44422
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MjdXUFdTck1VU0hXLzVlb3M1aU1BOFdvUWd4TzVZZ3lvNS9YQ3J6cTc1dVBD?=
 =?utf-8?B?eGdnNVI0alovVE5hd296eDl6SU1pR3c1T3l2cWJQbis2bDY1YmIrc1lZOGhY?=
 =?utf-8?B?VmRiT0x6WVFrQ3FzNjI4cnpWOTV0N01uTUpJVWs5WDl0N2V4RmtEWWhtZWdC?=
 =?utf-8?B?SUZaUlNNNkR3MC8xazhZbVFkZXVJNjRjVCtCYUZDcjI2WGYwek5uOUxwR1A5?=
 =?utf-8?B?ZWozZFFVdFl3eWQ5d2dNK25yRVFsN0lXbFNsU0tkc2pwRDF2Vk9qTHN0OWVN?=
 =?utf-8?B?UDJReGt4MjVIRG9zVUZnR0VBNFh3a2U2a1RTcHlPYzM4M3pYUGtEMDZoOHZ6?=
 =?utf-8?B?T21ZZGszTEJoNTFMNVlFZFlyU1RnSkxDL253cHRGb3RlZURqSytaQllyWnZP?=
 =?utf-8?B?eW52eFBvVGp1a1VYcXF2S0dwYVRiVFRmR1czYW1BbW0wQTVGR2F6NVBPK3hq?=
 =?utf-8?B?ZGJjL3hDWVEzd1hFRllnMDlxTHVIc01PWDJsMUxFY0dJd1JVMkFEamMxYjRo?=
 =?utf-8?B?RE1LT0pIQ3pDWnIzUXJjSlR1dlVmbHhCVEtQQkt2M3R6QVZ0NnlNd0Z5a2Qr?=
 =?utf-8?B?aXdta0VGa0lOV2Ywanpabyt4akN2TW5aekpSeitLTDdyN1FYcit5d3RaeHdn?=
 =?utf-8?B?Y0tLaTc0NEdKbks3cW43MEwyc0xSUWkxbktlQkcxRWU4SklwZTRFSzE5ZmVI?=
 =?utf-8?B?RHZRd2ZwczJ3M2RxMXlBVTFGZ0hsQXhVY2JpWTVUUGp1eGNYcklHMXhKTDdp?=
 =?utf-8?B?bzZFbTNuOXNhbzBFOU1idG1URFhCOUxIUkdMWDkyMTlBWFZha3NhNmNwczBM?=
 =?utf-8?B?TUR0dGdxb3ZTMXpsVloyeE9VaUN4SXhFSTBzd3cvdHY2eStRYmgwanJpbk5T?=
 =?utf-8?B?U1ZKeU1oNmtEdVZBTGFkRk9oaUpEL2kyZmFWaldzZ3BjUW5qYTExaTVUQXha?=
 =?utf-8?B?ZEROZFBoQUJHTFdQaWJWeFNKWEtYRlJLbWlxWWpHSkNCMmRGaGNqQ1NUTXZV?=
 =?utf-8?B?R3oreDh2UWZaNkZibFVNYmMrYnRFRUdFVml1alg4UG95RWtjK1d0Qkg3VG5l?=
 =?utf-8?B?ZjR5Nkc5bjBWVzM3Szg0cTBabnJnbkgxR3pHV3FKNUdwSmcwZXNaNStRN2E2?=
 =?utf-8?B?MUkvNFViOGJDUndUTzFBQVk0OVdRaHFFU1NSTDZ0bjlsQS9HZjlSbEZrTVZo?=
 =?utf-8?B?MTEyaDA0emh2S3ViUEdMNWFrcjF3Tk93MGtXUThWc1Y2WWx1N1Q4cTNZc3hl?=
 =?utf-8?B?ZTZ2QzlmTEdMaFNmVWpsRlUzOWF4VS9DaHJJOE9KQjRUdVk1SHdjVkJmY3Fr?=
 =?utf-8?B?OVhGdUtoWDNOVFMvVHk1T0hmallpbmIremdIZzdTSmRvRGJBNE90eTRoN2lI?=
 =?utf-8?B?TU9Sc0R6VFR3d1VDTzZieEdQb3NMSVE5alhWOTBPZEE0c05XUkZyOVZUYWt1?=
 =?utf-8?B?d1B6MXhHV2t1NzVKY0Y3ZFgzTnFGdE9LRWY3bEpxeGxtb2E0T21sRlNPVE9F?=
 =?utf-8?B?elN5SkxTKzNpK0QxckQveUcrYVQvSWtFaGMvVnl5TlVWWm11ZmVFdngvY3Zo?=
 =?utf-8?B?RVZCaUNvejA4Vk5mQklmZG9tdFlaUlNDZ29DeE1nMDNuck53NkIvSUorTVdW?=
 =?utf-8?B?dFg0MlFSU0owWDg4T28wVXVRbFZQRHRRNW5BVXRCbWh0RElQYUFSWEZPRFZq?=
 =?utf-8?B?eDk0dUtJRFpwdnFKZzZzNGptT1k5V1dIYk9adTgyVGxIaUlMSFkveDF3NzNQ?=
 =?utf-8?B?d21CMHd1eVZ5ZXRQcHhkZlZSRFBRWEo0K1dhTEs4NnZvL0pyS1lESStpbCs2?=
 =?utf-8?B?QUJXd0JTa3FLRlNUZUpvV3pRMEJrU0ovWk44UFdLSHlybjdOd1lsNi9lTlM5?=
 =?utf-8?B?cWZUN0Flc2tweTRSNXpxc0tjbXVtL0ZQQkZwOFp2NzROSE1hZEhycTVuaUdY?=
 =?utf-8?Q?+bskh6ZzWNE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9777
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98f2542b-d5ad-4081-68df-08ddaee43019
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|36860700013|14060799003|1800799024|30052699003|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dSs4ZDFYOUJpN1pkMUF1dmpYb0kwR2Q2SnNUWlhFSnU1V3RBS05ZK0dlNjlV?=
 =?utf-8?B?TzRUNVFrcnp5Nm1SOGcrcGZUN3dnbjl6YWpycFh0eUN2UERBUTF1bVVOMjdh?=
 =?utf-8?B?RGFHeGZRZ3VJZEZXS2Eva1hJeC9FZkp6MDZjM2dHc1VjQ25Oc0d0VkQ4UTdp?=
 =?utf-8?B?YXBGcThjT1FrZDF0b1haaFVvZ0R1ZkhwcmYyY2RhamZEWk5CU3UzK1MyRUli?=
 =?utf-8?B?aTNEY2lNb21NYnV0OFpzcFpPR0JyejVjM0pDdWNybGh0N0x0SFViOGdLNG5a?=
 =?utf-8?B?WkgwRVM4NTB0MUhyVFRibzRtZFk3N0Y1Z2pUQy9sb0U1VjFockswU04xTitS?=
 =?utf-8?B?MWNBTm9VeElJN3lYZGNRR1VBelhnNjh3cG5iakhXeUIzb1RoMFZ6K3JlZXE3?=
 =?utf-8?B?ZzZDMkVXaklNMlBGUEJvcXBOOHBpbytUNlNJTGZwUzgzSmtnUzlrcC9nV216?=
 =?utf-8?B?NDVVVC84M3BaM2hodjlMOXdnaU5hM2dxMTdhOVdyaHdRTkc5T1JmYVpmbERF?=
 =?utf-8?B?L0FXRXdwUVZHSjFmNHFjR3pDSVQzckUzQ3d4TlpsYTV6U2tVcHJmWTd2Mmll?=
 =?utf-8?B?cXIwUmwvOXVzM254cTIveDdDU0xML3BqQ3ljeGFBVlU4aFFwZjJsL3J0QjZQ?=
 =?utf-8?B?aml4OHlPN3lyMlN1QTZGazhmQmZ0b3RxVnQyQlJFR2tzYWdGbFl3c0NZb0kv?=
 =?utf-8?B?YUhlSVFXUmNMSHJmN09MWUlaWGpkdDBGSTFPYmx3Tnp6eDlRRlJmN2FpWU0w?=
 =?utf-8?B?WFc0KzBJS29HeFlOdFF4NHZPdXFKT1doTW43ZnZnR0FWM1hBVDJBRDVJUzdU?=
 =?utf-8?B?cDBrVTZ2VXV3VEFncXZHbXYzSjRpYVlqUTZOdE1wTVRYK3VGU3pXbXk2MCtV?=
 =?utf-8?B?TzdCb2hCTWV0bW82MGU2RHk5QnhLWENSL2JPallDbFBoMDU5NXBmaHBrbHZi?=
 =?utf-8?B?S3EvUmcyYWpiYWVoN2libHNLSjhOZlBxc252WWNOblhFTGJIRUpPYVc0dEhr?=
 =?utf-8?B?RXBOSitMV0ZOV2tBeEhxS2dHWk41R2dwaFd4T0NQRC83bFJld0E0bW9nMHd3?=
 =?utf-8?B?Vlo4cUY3QVZhdHZ5WlJuamRFcWR6Vlk4bndSQTJwdSsxRElhOW1GNmpDbkJG?=
 =?utf-8?B?ZEpZeDcrVThTczQxY0pzSFJtellBeU1sdW9pL0ttamFXNnRvdUViamJaeVR2?=
 =?utf-8?B?MHlGOThvUEFvWUFBYnQwbVhqRFBaOGRKTkpkN3N2K01qcUNUWkJBZG9rMXds?=
 =?utf-8?B?c1ZpenhoOEQxbjFIZDMycDUydHFvNVEzdk0rcndkaWhwb0VwOTRudFNUVmRm?=
 =?utf-8?B?MTdCNHM5NENOTy84LzFpTUxFQkxYWUl1di94MjJZTW1WblAxSHkvUUJpSEhp?=
 =?utf-8?B?eXhLcXlQT2puZ3dUWVlZUnZNNnVTSVBNODhadlhKN0pKZngwUlA2UjRLQzdN?=
 =?utf-8?B?bm5kWDNQNU4vRHVQRFBweGovSmZ2a1JjN094YnBmM2N6eHZLMmhsRS80Y3Iz?=
 =?utf-8?B?NTBCbHA4TTlIM0U2OW8rTFhhckM4RkdyRk1QTVFqMnB5UzcyUXVMR2wwT2J0?=
 =?utf-8?B?U0lybUZaK3hPdDE4cXpKc0VOcjdtZStVRGkyUnRSOVpPd1ZwNE9KV3NJWmJN?=
 =?utf-8?B?WFRpcWFSb2VoU0tVV3o4b3RiS2VrZWpyU3pMVlhNVThncmpKdkZCTUVNdnpP?=
 =?utf-8?B?RzRrSUZLL2JCdTE1SWpyTTRiQW55cGRqdmV6Rkpza3dlcmNNTHpzanROMFB3?=
 =?utf-8?B?bW83MXRxVDdtT3JHbmUrSmJEbXRCMWxFczBYbXk5OGJYdGRLUjI1QmJtaG9w?=
 =?utf-8?B?Y3kvN0QrUWUycXZXOGpuL1Brdzh6WGJFeE41ZnRVYlhtb21jemNHT1EwNFV1?=
 =?utf-8?B?STJFTW1FNHlueE9OM2tza2QrL3lsRUtMemNkTE9SdXdGSUZJTm9lUG4yTGt4?=
 =?utf-8?B?U2NaSEtiZmlrNHhqNHhxYU4zK3BYMVMvWURNenNiTzhtd08va2tCbTFlSldX?=
 =?utf-8?B?VFpNYTZzWlVTLzRadnV5RE13aElJbmprVjdIUitNYjRZKzBWb0lwc3R6Sm9F?=
 =?utf-8?B?d3UyaFg0VklOTzJyUUpCOVYxbndjV20wVWNSdz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(14060799003)(1800799024)(30052699003)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 03:49:17.4295
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6189b309-4d71-4125-3bf8-08ddaee44422
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB10617


On 18/06/25 11:20 pm, Lorenzo Stoakes wrote:
> This series has a lot of duplication in it esp vs. your other series [0], but
> perhaps something we can tackle in a follow up.
>
> It'd be nice if we could find a way to de-duplicate some of the near-identical
> code though.
>
> But it's a 'maybe' on that because hey, the code in this file is hideous anyway
> and needs a mega rework in any case...
>
> [0]: https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
>
> On Wed, Jun 18, 2025 at 09:26:08PM +0530, Dev Jain wrote:
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
>>
>> This is rebased on:
>> https://lore.kernel.org/all/20250618102607.10551-1-dev.jain@arm.com/
>> If there will be a v2 of either version I'll send them together.
> Hmmm I say again - slow down a bit :) there's no need to shoot out multiple
> patches in a single day and you'd maybe avoid some of this kind of thing.
>
> It's really preferable to avoid possible conflicts like this or at least reduce
> the chance by having review on one thing done first.
>
> I mean, why not just put both of these in a series for the respin? Just a
> thought ;) in fact this is probably an ideal use of a series for that as you can
> ensure you deal with both if any conflicts arise.

Sorry for this. I found these two patches independently with a couple of
hours difference, and I posted this one yesterday because stupid me thought
someone will, after seeing my first patch, point out that the optimization
can be made at one more place. So I will send this and the other patch as
a series anyway for v2.

>
>>   mm/khugepaged.c | 38 +++++++++++++++++++++++++-------------
>>   1 file changed, 25 insertions(+), 13 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 649ccb2670f8..7d37058eda5b 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -1499,15 +1499,16 @@ static int set_huge_pmd(struct vm_area_struct *vma, unsigned long addr,
>>   int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			    bool install_pmd)
>>   {
>> +	int nr_mapped_ptes = 0, nr_batch_ptes, result = SCAN_FAIL;
> NIT: I don't know why you're moving this, and while y'know it's kind of the fun
> of subjective stuff I'd rather the assigned values and unassigned values be on
> different lines (yes I know this codebase violates this with the pml, ptl below
> but hey :P)

To maintain a reverse Xmas fashion. Now I know that the declarations are already
not in an Xmas fashion, but I wanted to make sure the code I change maintains
that for the part I am changing :)

>
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
>> @@ -1620,12 +1621,17 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
>>   		goto abort;
>>
>> +	i = 0, addr = haddr, pte = start_pte;
> This is horrid, no absolutely not. This is not how we do assignment in arbitrary
> C code.
>
> I don't know why we need a do/while here in general, I think the for loop should
> still work ok no?

I don't recall now and I cannot even find it, but I have been following this
pattern for some time, by god I cannot remember which pattern I am copying
from. Anyhow I also hate the do/while thingy so I will change this to a
for loop.

>
>>   	/* step 2: clear page table and adjust rmap */
>> -	for (i = 0, addr = haddr, pte = start_pte;
>> -	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
>> +	do {
>> +		const fpb_t flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
>> +		int max_nr_batch_ptes = (end - addr) >> PAGE_SHIFT;
>> +		struct folio *this_folio;
> Hate this name. We are not C#... ;)
>
> Just call it folio no? The 'this_' is redundant.

There is already a struct folio *folio which we retrieve from filemap_lock_folio.
So wanted to differentiate, I didn't think hard about the name. How about mapped_folio?

>
>
>>   		struct page *page;
>>   		pte_t ptent = ptep_get(pte);
>>
>> +		nr_batch_ptes = 1;
>> +
>>   		if (pte_none(ptent))
>>   			continue;
>>   		/*
>> @@ -1639,6 +1645,11 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			goto abort;
>>   		}
>>   		page = vm_normal_page(vma, addr, ptent);
>> +		this_folio = page_folio(page);
>> +		if (folio_test_large(this_folio) && max_nr_batch_ptes != 1)
>> +			nr_batch_ptes = folio_pte_batch(this_folio, addr, pte, ptent,
>> +					max_nr_batch_ptes, flags, NULL, NULL, NULL);
>> +
>>   		if (folio_page(folio, i) != page)
>>   			goto abort;
>>
>> @@ -1647,18 +1658,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   		 * TLB flush can be left until pmdp_collapse_flush() does it.
>>   		 * PTE dirty? Shmem page is already dirty; file is read-only.
>>   		 */
>> -		ptep_clear(mm, addr, pte);
>> -		folio_remove_rmap_pte(folio, page, vma);
>> -		nr_ptes++;
>> -	}
>> +		clear_full_ptes(mm, addr, pte, nr_batch_ptes, false);
>> +		folio_remove_rmap_ptes(folio, page, nr_batch_ptes, vma);
>> +		nr_mapped_ptes += nr_batch_ptes;
>> +	} while (i += nr_batch_ptes, addr += nr_batch_ptes * PAGE_SIZE,
>> +		 pte += nr_batch_ptes, i < HPAGE_PMD_NR);
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
>> @@ -1691,10 +1703,10 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
>>   			: SCAN_SUCCEED;
>>   	goto drop_folio;
>>   abort:
>> -	if (nr_ptes) {
>> +	if (nr_mapped_ptes) {
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
> Logic looks generally sane though... :)
