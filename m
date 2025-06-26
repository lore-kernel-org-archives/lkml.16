Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013046.outbound.protection.outlook.com [40.107.159.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87AAC43159
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 03:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750909994; cv=fail; b=HUoLNya34Nt/7Z0nbA+l0Ec10h6n2tUiMBVP4GoOnk7keg551lRK1Qm2G3T/9CQIoF8PsqT285yvU6fF/jooMoEIvBn8fiwWep30qYmCVCwiu+xGf505Ul0GQ/8C58q393I64J5GI4puJWTnS7Fhd4xT65s3w91ZqPbI72DfG74=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750909994; c=relaxed/simple;
	bh=V+wHANlCdEo2fhGKA4B0OGcH+ksLUoqP5CvWawxNHd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dFWe5EcBzNa03+eTvPyPxDDFa0mS0m/EYbK3delXR3H9CeygfRw8ljx0L5tKBe/I1e/YZUrsT+mjvcdg1Fjzwd5GR1wbiHNlUdKOBbsFd/FQ0FaGLvywryIug3pHkE3sJbehf5nKXv/rCTWj8ObU6SgUbFhhMENvAXHiFTJiwDs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qqjcv5dk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Qqjcv5dk; arc=fail smtp.client-ip=40.107.159.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qqjcv5dk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Qqjcv5dk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=m2gDNVbMCUqO0rsSUKKO/Rkb1mJq3+FVvZTbW8QxUICcLi2C5PNIc+gK/q9siletn/rkSxgPvwXHA6JoJsPxIK2oL9j9wtJN2oU7lh0nluVH1AyPmhGVZSHwQGLJuQCs0W06Duql0yOsBFrM3bBZfjfsOYFoZ8rnvQOq66XtJvI0HbzpsBDztbzrpwI3/dvJScB2KSqzcfExjgVSvRHDPgNh6HqLgPSD18Tux9gO13CYSkX1j/o7kx5CCV9zSh5cJ7PojiqWFRKchtGMGTk2722bKEQV2hxkW1pP7PrpTO4oZ0RvpRAaNjYNUE6yf+DxtdQned0mrgcKNreXE6OmnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5eVAKPfJPyXLpg+bHUTCaLdYDdIQJw0O7vtqR2sBew=;
 b=u61UZH3hMhyaTJGGD2irPGke8uJBA4kw4xjryZ3gFViOko1I9NTPmU9Y3torkIhFQlT97EYUDo5AzxngBQ+pC23FpPckOfp3wdce3LOZ/d6F3jzw4p5/dF1TuiYlyk+Wvcit1IHNWhagRG4o9eMzirIwPxKg0sjZGl+ee+KIuocLiOYMc+gIuz/HZjPUTPAnRpiXRw6HXrIfB3T6OseeK4ug+sQPxhJHQzT57tm6r9CHXhg6hwlbPNElbKxcMAV6yXuL4APu4JtLiF+P9zgVAT2SOF2W/Vadq2yqX7SBJWqGtDPn1afq4fD5IDKBdudaZaGmUHstQNgAMq8NGskjYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5eVAKPfJPyXLpg+bHUTCaLdYDdIQJw0O7vtqR2sBew=;
 b=Qqjcv5dkZGMSy38BQqtfps6/6SenlKUG/EmCgHaXji75kMQ0/LkM3gBFFbxLp77XSZyhYmIFXJoMpek7RXZE8/d6HYZmwJKidLrv3ynDEfJI80gRbXDNFQ7CSGHHnJSDL0z76dJ6lAsm3rotIdtwEGDx0zgXiGW1XzbJJ/sr+wE=
Received: from AM6PR10CA0015.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::28)
 by DBBPR08MB6283.eurprd08.prod.outlook.com (2603:10a6:10:1f7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Thu, 26 Jun
 2025 03:53:07 +0000
Received: from AM2PEPF0001C708.eurprd05.prod.outlook.com
 (2603:10a6:209:89:cafe::1a) by AM6PR10CA0015.outlook.office365.com
 (2603:10a6:209:89::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.20 via Frontend Transport; Thu,
 26 Jun 2025 03:53:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C708.mail.protection.outlook.com (10.167.16.196) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Thu, 26 Jun 2025 03:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlwuR8oI6/RSE8DfLvxF/J5yO8XBiNXA19yauBtraIsxfAUiXUjyoW/wiBrZ6CLEELrEWtqk5YO74zF9YMJR9OIRrdoGn8m8O+TtR39pMEsdU26M0Vyfe23kWKExYhPk/EuQ/EWSGyTHsyX0M9bCXnKJZq6+wtdFJdmK3J6yr9fzOjI1cORaaL/0YWyPQR0Tp3O8VeE8MCafzbw2RvMRYtmiKbnzwzxXB+za12K0CsFdov9JPCiNP85/EK7r9oSLYnPLse7fY1W5ywOYpmiD3v4V0u0GiGXtTQh7V3SOhRD+++gZMthtWHWqGHU1P6L6dx+t5cQtJnZLwG3rCl2aXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5eVAKPfJPyXLpg+bHUTCaLdYDdIQJw0O7vtqR2sBew=;
 b=SZZg2E2fHqtqxh7eqm9RUjAlNp8I6j2q9rmIHOXoyuQetu4A64clGbrTcC1Ai8TxHJY5chwOVmgZeoI6m6aZ4GdBAIjgfxPJods9pb9OJ3e3Tt8uJ40EXv7WUcq3JHq8aGcGnF20vr1xS36a1mHuIawuy4qrJ2Eyysw7YZzs+CGV2ZrcFHTgzC10csphDf5MnwADqIswzhZgqvQcUaCF3uA9veDgt1NLQEnNDKyfENBzNsafZRV4l4F1GKD5nlkwtgC1eDriBjynp9X6ZBqoXEz6Pye5F856l6vJ3jof9N9YgU1SVbklJlOkLKsFGWwW0qLJXLEBn8/NFwB1EIhl9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5eVAKPfJPyXLpg+bHUTCaLdYDdIQJw0O7vtqR2sBew=;
 b=Qqjcv5dkZGMSy38BQqtfps6/6SenlKUG/EmCgHaXji75kMQ0/LkM3gBFFbxLp77XSZyhYmIFXJoMpek7RXZE8/d6HYZmwJKidLrv3ynDEfJI80gRbXDNFQ7CSGHHnJSDL0z76dJ6lAsm3rotIdtwEGDx0zgXiGW1XzbJJ/sr+wE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS8PR08MB6005.eurprd08.prod.outlook.com (2603:10a6:20b:298::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Thu, 26 Jun
 2025 03:52:33 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Thu, 26 Jun 2025
 03:52:33 +0000
Message-ID: <6989406d-dfdf-4be5-b467-bb3b0d32d384@arm.com>
Date: Thu, 26 Jun 2025 09:22:28 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] khugepaged: Reduce race probability between
 migration and khugepaged
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, baohua@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250625055806.82645-1-dev.jain@arm.com>
 <20250625055806.82645-4-dev.jain@arm.com>
 <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <e94c3460-144d-4243-98a3-fbced10feefe@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS8PR08MB6005:EE_|AM2PEPF0001C708:EE_|DBBPR08MB6283:EE_
X-MS-Office365-Filtering-Correlation-Id: 22259c31-bc01-4832-83b5-08ddb464f4cc
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TEwrSHJYdGk0ckVMK1JxYnhicXJrdk9SNFV1OUpDUG9tVEIzaFdmcCtNYm43?=
 =?utf-8?B?bm1iRjFXT2ZJUmR5MG5xVStNaWpnMjFBWUFGNXpzR1EvRmc2Mng5N1E4cXE5?=
 =?utf-8?B?b3NNbTB3NVNldU8yN0J3YnZ6RkxjeDNqVk80K1RRTVBwU205dUZEakh5K3J6?=
 =?utf-8?B?cWFGeWhhK0M2MnBmZjVlUTEwQzAwTWNhNDViVk5uMU1PL3hyRFBUaHlEUTRU?=
 =?utf-8?B?d0gzUFFjd0dBS2FzS3hyWHRsbzNadUdDNVF0T2I0R092VnFYZ0NldjZBTXRh?=
 =?utf-8?B?RTh4M0FjU0JPUHlTYkJRM282QS9hRmVLSjhvdmVvd24rM2NoZGg3aGcvSlo3?=
 =?utf-8?B?MU9hRlJPQ201amdISlJ1am1maFlQLzM4QjM3cDRyYndOSk92QnhNQjhmVlRs?=
 =?utf-8?B?NkJlNVFmWWRXQkh6UDRUNVZ0dkNybm5yTm1SV1UyZk92TTZxeW1admZnR09E?=
 =?utf-8?B?STU2bXF6S1RFZjZTSkYvNDhqNUZZRHJyK1h2QXoyRnRQKzZyczJwK2p4RzVi?=
 =?utf-8?B?ZDRiZEsyRVlqcFdPcFg5T0RHUlZYVVIyVTRzZ1RySGVISVkzZ1N5NnNPREhr?=
 =?utf-8?B?UzNid0drK3VQZ0NwOWJTdUduOWpCKzdBRGo1bnVhOUFEVGd5MEhVTjVLVTFZ?=
 =?utf-8?B?dGFKbkNhVzRSTm9WQ29PVUNvejlzRXBHZ2MybjBqRTFGZ21KY2JiOENERzV3?=
 =?utf-8?B?ZzBCdUw5VkZpc2taY0kzYmNFazlvRFhKNW4yditvelIvaDV4RFZYSjR4STk0?=
 =?utf-8?B?RFl5aEpYOTZaZGZZSllONlJnejRUV2xyMlRLYWZRTU4yMHh4d2lPVE05Q0JW?=
 =?utf-8?B?ZEtFbDluRTUwN3JPWkpQV0s4UXA1YjZMdUhuZlhXc1RvcW5jM0RnYUZxc2Vy?=
 =?utf-8?B?YkdZRGdzZDExVkVZLzZMTEhGbW90SEhGb2JqMXVSL2dLdkt2RTc0eXVacFBp?=
 =?utf-8?B?L2dXdWRFMlE1TGltbytXbVprTllXRmFwNGJnalpqRGVjNFF1N1ptTUxxWFp0?=
 =?utf-8?B?ZXFERkNTV3hqY01mUm42VjJpTUg1K0RvdVdiUkcwbDRHN3F5dTBjWnpvNEsy?=
 =?utf-8?B?V0JHZS9pbmI0aWp4RnZzN2xJaEdwQjUxQVJNNFJkdTBLYm10UGkxSXNhdmM5?=
 =?utf-8?B?Z0Y0VFpTaUtsZjU0aEh4TlRaMWZIcUJKMjRFUk10MU9URnJTWFJlWThZK0ZR?=
 =?utf-8?B?M25tTlNzemtUZGF5Um9GN3o0OXZ0WGJCcE9ucmZiSHFPaVlTRFRMRXFuaUhE?=
 =?utf-8?B?T3BPREcvYWpNZFVnenZDQ1BXZ3R2S3hBZWZaVlhaNkNLcnhITEF6NXRKeHNE?=
 =?utf-8?B?RW45Q05zZWlrVEtlOFdPQTgwSWg3OGFremJQSE1FNDdML1FZQVRmZmVHOXFI?=
 =?utf-8?B?QktDaFI2NWgyU2pWVkEyVlJqMFNkSDVBQTNWQmkvM2ZkMjdBZVhMdFlPWEtN?=
 =?utf-8?B?a2tRbmJtVDluTmFyNWY5bm43VUhLblREUDhyZXFHbzR5NENsMjdwYTRtczlP?=
 =?utf-8?B?NmgzbU9vL0FrK3lwMm12TXoxaDNUM3ZUVWE3SUxFdjRPUjVaU3BqUU53bE9V?=
 =?utf-8?B?cXAxYWhFZEk0M3l6TTcxS09tUlVJNEVXa0JqNzhlVncyUUNIcUtQbkpkdkxV?=
 =?utf-8?B?UklKYVhxQnRNVjN5OFo2MTgrMHcvV3FMRkJDdDV3L3ZiN29UQkVqWktQeldh?=
 =?utf-8?B?Y1RmaFJVZXVUbm5VZGc4cnZvcDN6ZVVSUUk3alhSZTJ6SHlacnMxTCtjK05U?=
 =?utf-8?B?YkpWQmZVdE1Ud3RNYzVJNWE0RGhaSEFiZ3U2bjhObkYyR09IRXdJYWRhT1Bz?=
 =?utf-8?B?K0lhc05xRTRJUlFxM2Q1VHpVc2JPVDdydXR3dGJvMld1cnJLcHE1eFAvMVJJ?=
 =?utf-8?B?dmxoVnMwN0pIenVxUDZCUFBrUzJLc3ZOOGZhbC91UHlJYTFna1hLVWpYV3h5?=
 =?utf-8?Q?AnxT86CVl8k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6005
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e551a26a-3c9e-4c54-8b09-08ddb464e192
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|376014|14060799003|7416014|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWpEYnkxRldvOWJrdjQxbVVvMDlja1JiakYrOEloSkZ1dmNFajRNKzN3WDAx?=
 =?utf-8?B?Z1dvUktGSTU1S3NCWUxnQkI0b21uOEFjb0p6VTcvZm8zaVBuWmx2RVg5aE1S?=
 =?utf-8?B?c25kZDRIUWFpQjM2Q0s1RDVvZnN6YWQvbEpMc3MxZ05hYWNqMmlKdDJhUUg4?=
 =?utf-8?B?MHMwZ1dJWGFTaDZPYzBvVVRadUtqdklDTkhjeFQ4aVloWTQ3SWY2a2ZwcEVy?=
 =?utf-8?B?Y3J5eEJ1TlloR2E3U2pFMEwwNVdtS2dkWjRQNmdtTnIya1BXb0RYQlVvcUZN?=
 =?utf-8?B?OGIrM2hNN2w0NVJ3VXBNdDMzVXY2ekg4RTU3dENnRmZaR3VGTExnS1d5bTNU?=
 =?utf-8?B?bFYwY04vMGNvOHdXeWhFbTBwZTFEL3g3dTZNSWd5Y0NVai9xMHcxUllGdHA3?=
 =?utf-8?B?UlN2RnM2TFVERnl5WHVRUjBtNDI4RGZCZjE2eGUrUTdQUkdwN0xDdk1UMGpy?=
 =?utf-8?B?aENZRm45R1lhM2lSQ3hJWmRIeDFBalBBQ3oyZEdPVjVwT2FXK2dEUnBHblI3?=
 =?utf-8?B?RTNTNzRMd09tWGM3dWFFazdaNWxEVjRGQ2ZmZ3lBcTN0ZWJIazVzWVdTalJi?=
 =?utf-8?B?VmQwM1p6c2lpd1hEMkI4b2F1aFFyankrcjVzRHBTbGY2MjREUkk3eDJ3OU5V?=
 =?utf-8?B?Q0ZSSGNCZkZIN0NkalY0WkJDeFkrcnZHMnF4V1VxViswUThHMGpZaFlZbGhH?=
 =?utf-8?B?NWJLdnhQaEhyTlVYeWVYeWkrTlN0bEJ1WVVRN1N2Y0M0L0RXaXRZYnhKa1N5?=
 =?utf-8?B?YnljQzBMWjNESGkyUFFVTis3VG1QZFRPUXJ6eGM5QU9DdDdPSGJtb1MwS0gx?=
 =?utf-8?B?MEp0cStwV05PeW53TTRRczh0SEM3MFJnVk1wRSt5YjRQVjZQZGtISGNLL0JZ?=
 =?utf-8?B?K2pKY1gwNGEreHc1bWd5VG1YRVhWUE5TbFF5aGlFb1Zla3ovaU10Q3FnRlNG?=
 =?utf-8?B?S1VyZzdGb3prUlhhMlpMbUtmSmFmZ25rNmVKSHpiblh6WStZT3VES0JNcWV1?=
 =?utf-8?B?Tmd6SXNuZHNYNTlxMFVFcDlOV3ArTHF2OGhYeFlUWklMTzl6RWtLbFArYmcx?=
 =?utf-8?B?cVlxNlNPUS9FYlUvdm41d2ZybGpOK01nbXZOam1ZN3FLSGxYSnNQOEg0cVZV?=
 =?utf-8?B?QzF6TGN6d1NiNk92clJ2VU5ka1FHZzVxeUxuMkxjTHA5eUVUMDdoMWpxZ1dN?=
 =?utf-8?B?UnZsYS9DQzdKeG5CbTd4QndKMURhd3lsTWRVSVFOK2E4WVVscUxscEJpaW9i?=
 =?utf-8?B?elJSME5IWEFJb2YzVHNkVEwzSUQ0TFFSODRwbDY2b3F3SFMydEUyS0RVS2JU?=
 =?utf-8?B?M1ZKVHlaY1ZqcllJM3g5Ukl3a2sxVDhVd3NDUUQyc2hPY2J5ZU5rM01YK2hi?=
 =?utf-8?B?cFl4b0VZV2lxVmx0Nm9Qa05QTXd5R3JacjBGRjlEZjdMTkk4aHlPZ1pzZm0v?=
 =?utf-8?B?ZmRyWjhXWjE3R0xNdzFrOHlCM21CWlFtU1FzbHlnUG5Ua1oxRUUyNGs2Z0lD?=
 =?utf-8?B?UXdPV3MyKzExVnBHV1JtSW81d2VtRk9COXRhcFduWW9uMFBlMVpvV0s4S2tX?=
 =?utf-8?B?NlQ4L1dkbW4vMklUU2FxdkVySU5qUVhZaFFMY0x6S1FyUUo2Q0hqcmZnSmNm?=
 =?utf-8?B?ZTViRGNKQStzVzZKaDRSWE42S3dvKzBUUHBCR0MwRGpaU0psejE4a3loOVRp?=
 =?utf-8?B?RXorVEhBblRkK0tVeStkelBON1FCTnJKZG1xTUs4UWN0SGRwNHM0N1E2UjJX?=
 =?utf-8?B?bnBybUV6QmJhVmRkVTBuV1ZBeDd4RWMvRFRoR3dmM1EyRm9UN29wRkx1N1B6?=
 =?utf-8?B?OEpHUkRDeXlwT2pvVjB3TGhmR3VvMmFDWU9zdVJKUXEyUFNDaFkvazZWempL?=
 =?utf-8?B?TzdwY08yVnpUUFhoRVJXQzJwQ1R3dlBHYll1VGxhZzA3TE1QNG9ZYVBvSlRK?=
 =?utf-8?B?a3hQUVJLSk9JVk9zU0JnMUppUTVxWDRpd1hXdHlsU2lXeWdSNURPYlZLcHVk?=
 =?utf-8?B?NVQ0QTBGcUxHRmNDTS9lakIxVjh2bzlpbVRyQitrOWhUSEdtK2dUYjd4STc5?=
 =?utf-8?B?ZUFOVjhVR0hnSTNKaGVBMXdmOENjM1VEQ2hvZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(376014)(14060799003)(7416014)(82310400026)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:53:05.2346
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 22259c31-bc01-4832-83b5-08ddb464f4cc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C708.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6283


On 25/06/25 6:58 pm, Lorenzo Stoakes wrote:
> On Wed, Jun 25, 2025 at 11:28:06AM +0530, Dev Jain wrote:
>> Suppose a folio is under migration, and khugepaged is also trying to
>> collapse it. collapse_pte_mapped_thp() will retrieve the folio from the
>> page cache via filemap_lock_folio(), thus taking a reference on the folio
>> and sleeping on the folio lock, since the lock is held by the migration
>> path. Migration will then fail in
>> __folio_migrate_mapping -> folio_ref_freeze. Reduce the probability of
>> such a race happening (leading to migration failure) by bailing out
>> if we detect a PMD is marked with a migration entry.
>>
>> This fixes the migration-shared-anon-thp testcase failure on Apple M3.
> Hm is this related to the series at all? Seems somewhat unrelated?

Not related.

>
> Is there a Fixes, Closes, etc.? Do we need something in stable?

We don't need anything. This is an "expected race" in the sense that
both migration and khugepaged collapse are best effort algorithms.
I am just seeing a test failure on my system because my system hits
the race more often. So this patch reduces the window for the race.

For some previous context, you may look at:

https://lore.kernel.org/all/20240801081657.1386743-1-dev.jain@arm.com/
and
https://lore.kernel.org/all/20240830051609.4037834-1-dev.jain@arm.com/

>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   mm/khugepaged.c | 12 ++++++++++--
>>   1 file changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index 4c8d33abfbd8..bc8774f62e86 100644
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
>> @@ -956,6 +957,8 @@ static inline int check_pmd_state(pmd_t *pmd)
>>
>>   	if (pmd_none(pmde))
>>   		return SCAN_PMD_NONE;
>> +	if (is_pmd_migration_entry(pmde))
>> +		return SCAN_PMD_MIGRATION;
>>   	if (!pmd_present(pmde))
>>   		return SCAN_PMD_NULL;
>>   	if (pmd_trans_huge(pmde))
>> @@ -1518,9 +1521,12 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
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
>> @@ -2745,6 +2751,7 @@ static int madvise_collapse_errno(enum scan_result r)
>>   	case SCAN_PAGE_LRU:
>>   	case SCAN_DEL_PAGE_LRU:
>>   	case SCAN_PAGE_FILLED:
>> +	case SCAN_PMD_MIGRATION:
>>   		return -EAGAIN;
>>   	/*
>>   	 * Other: Trying again likely not to succeed / error intrinsic to
>> @@ -2834,6 +2841,7 @@ int madvise_collapse(struct vm_area_struct *vma, struct vm_area_struct **prev,
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
