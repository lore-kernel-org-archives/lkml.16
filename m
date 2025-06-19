Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012005.outbound.protection.outlook.com [52.101.66.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C1C3085D7
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.5
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321092; cv=fail; b=NuEn6jHL6OqvBegf1CHklBKe5gDR/vJ1HH+tHoz11m8jIhXgmWvdzz7UFAiK6puiq0nzKIcKVEIP0++6HLzKcoKSmDtaKx1iOpJ91dsyUMsmEFkE0k90XZ7S4aU49dXH0xzQGaZSQIjGwf5yMuG5HMN7pac2Xgk9xTqL1HihRPM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321092; c=relaxed/simple;
	bh=QQ75XakuemkJpq3jDFfaULl3u9TvXe9FGFiFxV3Qfmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=E78ArL7jt/v/OZGSs/yCtD5JuoId1u+mnO6lrg43X7nNFeTE8PAkJdnYYRIkyixwbEVjOXI3/I6XCzcqdYphmt3Eu0ymLNJf+UCtXDx49ZtSQom+7ZPgRWJ4nhXD6gJ74WwRE4oUn8mjaKspQnYauh1/OSSXikxW9fgAjSfa700=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ibbe9Ycl; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ibbe9Ycl; arc=fail smtp.client-ip=52.101.66.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ibbe9Ycl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ibbe9Ycl"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=v8H1h1XpfwvKfD4gDbffBLk/UVA/iPHNST/62GJMiyLMYspNyw+fpntHgHA7xacjWn6Gkntpt174cIbASCppOI/E2QOkPi/FI5dvKcG1LJdaDiw4Vox9eiFkn/aMy+97YhIPR+HLnY1gSQnnOTilQpye3dyErEoMBevV//OPlaSAXpHjKCsl8bl+cKPsD1sk7Fc5PFTIhi/z3Sl4Z4QDekTnyvtVmKCGJTd7zUoEBK219jCLM7P80HfOHwEmlailMggNFjVeWT2jp1admTW33+PQJFamSyUO3m87Eqdb8CLd0KVbQJi5zbkQZNVBVfdZR3EY7cqbqq38R3SxKWZAqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfELJBliwkglliFqYgYbXRXfquokf9vbRYZIpygasGQ=;
 b=gyR/T9zG6LQCQy9VkHV3PJlgI7XsX9FKBRLvCvu09ED88k3uih1cdetr+Z8s9VvHsjvMUMCLEii1sOv5TOTO9LYcA0xxfkqAI38zbgGsB3K98jz/iDziGMg3squMxyF3w9JCAUz0e16fwsuqP6ff9fCg+T0N51kOWM4bVTp2Lnm9i7S4UrR0+Ar8nLr228jgswWm4Hc7qQD91WDwm19EwTlqJuY6KIrsokjCqfY5EDTpQg0rYNudLeKbG/KBwnDIrg1B7qxVA2kPH2hKAweHP6Om4ntoyF4esqX0CKv1+lWtiP7/SH1HLqdSlTY9+mqDfgejgfckWxVAaGZ4I5EnEw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.dev smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfELJBliwkglliFqYgYbXRXfquokf9vbRYZIpygasGQ=;
 b=Ibbe9YclLnfc6lpR3BDObgqtiiijbljEZnkp3in0CnqO6hUWRLxRPRLn+kUkND5Gf3uOWN7gN5IV+vd8vc8/6UHCDQovjMlTaLFfpKRcEzBdFExazlpLEawwdVf3b8xGMElBI8Oxzt2BdlUN07e7bpOYR9DkTDwFEHKQ5fys5ho=
Received: from DUZP191CA0069.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::22)
 by DU0PR08MB8253.eurprd08.prod.outlook.com (2603:10a6:10:413::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Thu, 19 Jun
 2025 08:18:07 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:4fa:cafe::ee) by DUZP191CA0069.outlook.office365.com
 (2603:10a6:10:4fa::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.35 via Frontend Transport; Thu,
 19 Jun 2025 08:18:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 08:18:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9rRWgonxoPffEJcKSjzqvf41PwSNQBYXO1dFOr3LAN+KltEasf/JQbCFdBHIuBpJdVj5CZsx8qDG/TRHlD51d9Ab/KnmNZ0RmzX/CLoiarZKxJGhIK9KcG1UC126cIjNb2FkSQed3ArM97fJGaNSBfrPRmv+D3vbZq3KLdqNnouwj7mV8cz92NdBSIl2aMHycg1EqCmULfaK6VzO3Vx9HVbktVxMATl3x09KSYUxqrAUFR4FLxUScqdvro0q9+LiAH0Wy/iqnwiUpoH6uEKgSQq4F+TbkVG2n3sFmzCzki0D2RQ3chBdAXg1XnJck2XF70NYNkAmTRPw6tpZhbx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TfELJBliwkglliFqYgYbXRXfquokf9vbRYZIpygasGQ=;
 b=BbKoAxA3IF0WdE3d6y/SH1H6tVKXXmfTbGQd8rQzMRYmZeBLZm17qikHltPQnMNrV4m3boFxk79Bu5My/weyZVnxNocWDXQgHblI4jMnURnUEefxq35r5qeVrGoQwJhhTgRJQ3P4Hir3JCk8oDZn9+RMADgTCsupCdbTZ9BCK5AfQCCcQdN2lDmkFZpf2Y8upSKjwoF2vaRtEERK8DHf7RlRb3I2a6Keu/J/gF+48PXqTk8O03N5VPJXwjgimhlWuSf2gxZca6RcEJcBoy5QyLPUsuqMzmfyTexSnjnzY4Yp400uEch7d54+cspTYSDykDmcy+4QhrwIA7oCRcQmGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TfELJBliwkglliFqYgYbXRXfquokf9vbRYZIpygasGQ=;
 b=Ibbe9YclLnfc6lpR3BDObgqtiiijbljEZnkp3in0CnqO6hUWRLxRPRLn+kUkND5Gf3uOWN7gN5IV+vd8vc8/6UHCDQovjMlTaLFfpKRcEzBdFExazlpLEawwdVf3b8xGMElBI8Oxzt2BdlUN07e7bpOYR9DkTDwFEHKQ5fys5ho=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB8326.eurprd08.prod.outlook.com (2603:10a6:20b:56f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 08:17:31 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 08:17:31 +0000
Message-ID: <9454603f-c187-4386-8244-69f304197954@arm.com>
Date: Thu, 19 Jun 2025 13:47:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/rmap: Add NULL checks for rmap_walk_control callbacks
To: Ye Liu <ye.liu@linux.dev>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Ye Liu <liuye@kylinos.cn>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Rik van Riel <riel@surriel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Harry Yoo <harry.yoo@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250619075040.796047-1-ye.liu@linux.dev>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250619075040.796047-1-ye.liu@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::16) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB8326:EE_|DB1PEPF000509F6:EE_|DU0PR08MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: 960d2cda-1fa7-4339-f3c6-08ddaf09d1fd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?V3RQOUJRcVI3c0ttaWVLZWVMQ0NLd3d4c1F2TUZDUTJvMS9qYjFrRE93L0J2?=
 =?utf-8?B?SWc2bTZYY1I4NzN1dTV1U2FDanludkZDUEVXeSsrbmxkRUhObHhHMy91d2Nl?=
 =?utf-8?B?MlFMUlJJQ3BQTElidEljamMwVFZrNFp6MXhRbzQrem9xWjFyVjYyM3VTOFlD?=
 =?utf-8?B?bmMvczJYWFZMZnNlMkgrUWY4MzRPMFFzd01OdElmVVI1bXJLRm4rYTQ1N3ND?=
 =?utf-8?B?bDhwbWRIaFFWM1ptNTlQMTdiQzUrdzAvbmdyS0Y0VWxpQ29xQkFveDFPU0Zu?=
 =?utf-8?B?eS92WjZDbnZzZVBLTHFHMEhIOEFiWVI4d2o3RGhyUWEvM2pNdmxWQU1sYkdK?=
 =?utf-8?B?ejFoTWc4bzZnY1Z1SFBwSXB5OWRoODdGUytxY1NRYlpCTlppb3BaTGpJb0Uw?=
 =?utf-8?B?SHFIZjhUY1M1aEtUckZuYWRZVDFKSS9zV3VTMldrWkJrYUtycGgxQk1sTXh5?=
 =?utf-8?B?eDFlV3BsSjN3aEt4VTZ5WDhCbE5HbzR4MFFIQWt3TkxKNFdKN2dZSkwyc2JB?=
 =?utf-8?B?OTJXQkVxRDh3Vm1iL3BkRUtwRlo2dWNGZG9Ob2J0T3NubDhPbENiT0dCUCts?=
 =?utf-8?B?US8zSkFXL2VwbWZGNDhRd1k0YmpUM05lUms4MDgxdjF3bGhXV1pyVnpyUjVE?=
 =?utf-8?B?aFdCeDcyUTBYaXdoS09XM2M0TGIyQm9HK2xTdGMyUmQ0RXpqRGVNaGdxWXZ4?=
 =?utf-8?B?ZEZORzI1RVN2NldaZUdGaDVIYTNBNTFGTzI2d2tTaXRUdm1rVnF5ZGE0TVZ4?=
 =?utf-8?B?RE9YeCs4dExPNjZWb2JjYjBmTEZ5UnJjVjV5dWNwcHRlTW9kMHNOMi9rTmFk?=
 =?utf-8?B?QzhQVHJyNEo5dlhuSjl6YUZQdTlYdjVBR0VGMS81MzE3Q3hLZ2JJcUxvYWUx?=
 =?utf-8?B?VllHUkY0WExFMzhDMCtaQ2ppNVJEblcvN0pZT0FJUnQ1VmYrRlQvci9hSVY4?=
 =?utf-8?B?MHNmQ3d0VENLV0V6eGV2czlUVnNLcDltSXMxb2RNTU9idHpWeTJwTTcxRVNu?=
 =?utf-8?B?b21iY0lTNGlPcmlxMUxuZ2JkOEJPTUp4NFNNbG5YUEphc2x2OGRXdWdpNy81?=
 =?utf-8?B?UG15a3RZa2J3WXpuMm9rU2N6SjlXajZEdnZDT1U2VWdDRUlzbmZwYWpmaWIv?=
 =?utf-8?B?cjdPL2hxYmhTVDJTNXd0cSt4bTRvNXNZMGdiakVDZmhLMnJFZjZ6djZ3dllH?=
 =?utf-8?B?b05oQ1NWSTloY21lSEVGdGY4N0tvY3pzeENNODJ4NVQxNC9OTFRmbXRNNHk2?=
 =?utf-8?B?WXpkRy9wSlhZQ0RpNGIrUkNNVG9VZDhtRHRFeG9xc3dhT0JlNHB4SWVXSWg3?=
 =?utf-8?B?NzgrVktKODgyakdlak1PZ1dsVFRubDl1RitGcGR4Y1dWVzViSlJ0MlJMTDgr?=
 =?utf-8?B?UTljVitqamZscjhyN3dCZUdIeGhvQ1BvanMzQmRmaUdVdkxPMDBxSjg4bzZp?=
 =?utf-8?B?VXB1UVlaZGtPWk83M1haY21VNzRNaGlzTVJjUExMVWpiWTdYZnNESVRwSXRj?=
 =?utf-8?B?UmJqRkZrQTIxL0RiVTJ2MnczRUsyU2s3UXV3b3M4b0JsYWQ5cWJKQzEvdGJz?=
 =?utf-8?B?c0RsWlpNeXlrRVdicmVDTWllQ1hOMnROZXk1ZVhRQUdLZ0NSRkZ1VGlLaEZP?=
 =?utf-8?B?dGVyWjh4bEdreU8yUU1Cck03SDgwbUJtcjRneW80VktLR1lFNEtRN3g3VUM0?=
 =?utf-8?B?ZHMwR2JkTjJRVmZmWWFhZDJxUDVBYkVob2NUZDR0RkM5ZjBxeTU3VVlpb2cy?=
 =?utf-8?B?V1JEajVFS3NpR2orb3BsZWQvMlIvb3ZoT05LNnJ4blFpTDRZU0s0cjRNdFRw?=
 =?utf-8?B?bnA2dU5OTnJMMkllV1RvTUxyYnlpSXBWV1pFcjgvV2I5Q1QyMkUvanNLeCsv?=
 =?utf-8?B?V0EyM29meUNCbGFlZFlZczFmazVQdEdTTVFGdXh3cHNkSlJ2Tmp4bFRYcmdt?=
 =?utf-8?Q?c32sQRrGip4=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8326
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	977e4aac-533a-4cca-36e7-08ddaf09bc7f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|1800799024|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGF2SmlNaHhURGU3V1c3eWRKc3RBZGNMbnFMNHgxU01xTy82RGRKOU4xRGl0?=
 =?utf-8?B?OGErMUIrM2NkZUpJUi9zRUFvdC9LanJrSGZwN0pSYjNiSXZVZGxmMExuRkYv?=
 =?utf-8?B?YXl5S3dWTjhoU0xjTTdjS2QzR2tvVFQvSFBEYnZ6Uy9sOEY4ZDFYUU8yVnVz?=
 =?utf-8?B?dElCRm1XSFc4eTJWUWdEYVNSQmhzY252anlTNEx6SlVpTHFFQmkwTk5hbnln?=
 =?utf-8?B?WktWazNmeDkyWlNIdHE4K2dRN0ZRRVkvWmJCeFovOE10Ti9VVmFvQkRvTVpq?=
 =?utf-8?B?V2llY3hBc1RaY0M2cEVFSDlhMTAvZGVTN1lTVnhJS3Z1R0VoeTBWRjRFRmxt?=
 =?utf-8?B?OFV6UkUvdkoxbkZOdTVsWWM3SkR1eUxkMmxtNkYyL0hQOUVHYWNXVU5uRmRM?=
 =?utf-8?B?Q3dKZnViLzREVkNIWTZGZFJNYVU4MXZTREU2MkJnUVArZHhEUSs1MkZudllw?=
 =?utf-8?B?NmYyRnN1Mm42WGxXS21qYU1WL0NLZW5JZjZhSGlscStZMGxmOVdDbG1WSnIr?=
 =?utf-8?B?L0p1VjRkODREK1pQbGF5T3RrZXR3ODBwc3lCbWMvQStZWjQ5MUNOc01Da1hS?=
 =?utf-8?B?OHduYnczbGVSaUFmcFBaNkdnbS9FRGppVjR5SE1uSjVlRGFQSUQ5bGFCR2po?=
 =?utf-8?B?UjVPVEFGdndubmxNZSttc21HVmJ2NFFQd1FGS0R4czFPVWh4Z0VZRzcvRWxO?=
 =?utf-8?B?aHUzR01Cc0x6bDBBcUZxYzJ0NkZ1MCt4RWhJY1hZSnNqdW40eHptN1YydzBS?=
 =?utf-8?B?VWt0bXRGd2xlN1Z1QzMzSHlsckxFTXB4cjUwU0FibVZoTjE3b3NsT1hpT0F3?=
 =?utf-8?B?Sm5pSnJxaHVHKzN4QjhuaUVaOEdrd3JJZnlYVkwxbUJHdUY4L3hzcFlCSDEw?=
 =?utf-8?B?L1lSZFJQL094RldJVXpwM3ZYZ1Q2bW5TMzlPWDhSTnA2N2U5RTZpRXZjUmpF?=
 =?utf-8?B?emRKa0RrQ2pjT0ZpMnZFNVdHbnhYU0ZQZnE4akdrZm5PRS9sdlp0RnN6d1BG?=
 =?utf-8?B?MStWSXppYnhMa1Jncks1TjZpM2t0Ly9ZOVFnL2dzVWk2SWJHUFl6NGRqREpQ?=
 =?utf-8?B?U1BUQ0pWQldlbzIrU2RFY3dOekdDbFpyeFdsWHV3R3Q1dVcyaWY5T3A5c3VT?=
 =?utf-8?B?Q2JWWkFBYXRTZk9GNXVVcmVBeTVnT1c0UjNLREtlSEFyNHJWVkUwakVJZEox?=
 =?utf-8?B?RjVRdlZVeFdKTXpReElZYXJucjBidkhYZ2JiRkswZEpMUjExRkY1NUZpVWFx?=
 =?utf-8?B?dlVpYXBDdzJGQXJ5VElLWGwyL00yaHg5Y2c3dE5NVnZDQzgwN3lGd1daUVo1?=
 =?utf-8?B?OE5ZNWE0bWg0bGE2QnNLbENJbkFaVDA3a3EzNXFiVGF5OXhIdDdBL0pxNFMv?=
 =?utf-8?B?U3RQNmUwQ0RoRXBVQmRtb1lNOXRmSlg0T0kxaENFZHdERGtIOWk2eXhDbklS?=
 =?utf-8?B?OGhsRzdIcjJkTStvYkgvbytPYURCbk5vSm9Fc1RYR2VwZDNoc29yb0F1Z0pn?=
 =?utf-8?B?RkY2SEZkY0p4VUhCVWRndlozbDYwOEFpWHZSNTlnNlV1bHNrWTkxUzJEN09E?=
 =?utf-8?B?WGVDd3BXTkhyRlp4Z1ZGMTA3TDc2Z3l6T29YRWFtWENSZkhrNUxKaThTblJO?=
 =?utf-8?B?dXl5TFk3M3lONzVZVExMZTkvcFRZRU0zemVmNEV1S0UybVlrN0tBTkgraVZq?=
 =?utf-8?B?MFBQUXFHaWtOWk90U1Q0eHptVnlzT0hOQ3Y1bnVpaTFJY3pGOEFJVUtZRkEx?=
 =?utf-8?B?YTJUTDJZbzF6czIzSzBKc2lRY3I3dVE5Tk9aTE5Xc0VZTHRrRVh4cGpQeVkv?=
 =?utf-8?B?RTd1bEdYVUYrKzN0RWN0TzZNWnI0UUFIZ3ZNZjZDaUQycTdHeHEzZGNsSkYz?=
 =?utf-8?B?b0NkR2JiaHhDVEFjSTRHb2NSMTdqTUpPbzdqMmJNSWFSQnV3K1RkVHBDMnRZ?=
 =?utf-8?B?TVQxbmhLbXlMQ3VqVEZmbVVZa1M5cTJQTXlHakJrYndRY1NNNVF4aWwzeDVN?=
 =?utf-8?B?Z2x6WVljSEcwMjFnazQ4OVVIbXhVU0hDU0RYRkZYV2pyUHhDY1ZVWU1mR0N5?=
 =?utf-8?Q?Yz5vRV?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 08:18:06.8131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 960d2cda-1fa7-4339-f3c6-08ddaf09d1fd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8253


On 19/06/25 1:20 pm, Ye Liu wrote:
> From: Ye Liu <liuye@kylinos.cn>
>
> Add NULL pointer checks for rmap_one callback in rmap_walk operations
> to prevent potential NULL pointer dereferences. Also clean up some
> code by removing redundant comments and caching folio_nr_pages().
>
> Signed-off-by: Ye Liu <liuye@kylinos.cn>
> ---

Don't really see the point of this patch. The rmap_one call back will
always be there as we need a way to define how to unmap/do the reverse
map walk for one VMA at a time. And the folio_nr_pages() will probably
get cached by the compiler anyways.

>   mm/ksm.c  |  2 +-
>   mm/rmap.c | 14 +++++++-------
>   2 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/mm/ksm.c b/mm/ksm.c
> index 18b3690bb69a..22ad069d1860 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -3068,7 +3068,7 @@ void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc)
>   			if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>   				continue;
>   
> -			if (!rwc->rmap_one(folio, vma, addr, rwc->arg)) {
> +			if (rwc->rmap_one && !rwc->rmap_one(folio, vma, addr, rwc->arg)) {
>   				anon_vma_unlock_read(anon_vma);
>   				return;
>   			}
> diff --git a/mm/rmap.c b/mm/rmap.c
> index fb63d9256f09..17d43d104a0d 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1202,8 +1202,7 @@ int mapping_wrprotect_range(struct address_space *mapping, pgoff_t pgoff,
>   	if (!mapping)
>   		return 0;
>   
> -	__rmap_walk_file(/* folio = */NULL, mapping, pgoff, nr_pages, &rwc,
> -			 /* locked = */false);
> +	__rmap_walk_file(NULL, mapping, pgoff, nr_pages, &rwc, false);
>   
>   	return state.cleaned;
>   }
> @@ -2806,6 +2805,7 @@ static void rmap_walk_anon(struct folio *folio,
>   	struct anon_vma *anon_vma;
>   	pgoff_t pgoff_start, pgoff_end;
>   	struct anon_vma_chain *avc;
> +	unsigned long nr_pages;
>   
>   	if (locked) {
>   		anon_vma = folio_anon_vma(folio);
> @@ -2817,13 +2817,13 @@ static void rmap_walk_anon(struct folio *folio,
>   	if (!anon_vma)
>   		return;
>   
> +	nr_pages = folio_nr_pages(folio);
>   	pgoff_start = folio_pgoff(folio);
> -	pgoff_end = pgoff_start + folio_nr_pages(folio) - 1;
> +	pgoff_end = pgoff_start + nr_pages - 1;
>   	anon_vma_interval_tree_foreach(avc, &anon_vma->rb_root,
>   			pgoff_start, pgoff_end) {
>   		struct vm_area_struct *vma = avc->vma;
> -		unsigned long address = vma_address(vma, pgoff_start,
> -				folio_nr_pages(folio));
> +		unsigned long address = vma_address(vma, pgoff_start, nr_pages);
>   
>   		VM_BUG_ON_VMA(address == -EFAULT, vma);
>   		cond_resched();
> @@ -2831,7 +2831,7 @@ static void rmap_walk_anon(struct folio *folio,
>   		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>   			continue;
>   
> -		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
> +		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
>   			break;
>   		if (rwc->done && rwc->done(folio))
>   			break;
> @@ -2894,7 +2894,7 @@ static void __rmap_walk_file(struct folio *folio, struct address_space *mapping,
>   		if (rwc->invalid_vma && rwc->invalid_vma(vma, rwc->arg))
>   			continue;
>   
> -		if (!rwc->rmap_one(folio, vma, address, rwc->arg))
> +		if (rwc->rmap_one && !rwc->rmap_one(folio, vma, address, rwc->arg))
>   			goto done;
>   		if (rwc->done && rwc->done(folio))
>   			goto done;
