Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011062.outbound.protection.outlook.com [40.107.130.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6C2397B0
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.62
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750305858; cv=fail; b=ie1eXFivH4dswLlFHFIe4xUDmlWXJ3/hgX06vLGHFWKBQqEAVve7uDgq+NS4K/Z+m0+rq5lO07x/TnJ8ZpqtZboMaTQrTmMhyxG+4MYbV9KHHUqt93MhWA6iXTN10fyFt+H6aCTBqCf7z8s3YMJ9rRz2ZF19PTGa+2+P6PFsaG8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750305858; c=relaxed/simple;
	bh=Qdvt/Yu+cntPq7HJuYX+CYNooEADw9UR3j5H0UXluu4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=W15jH3omOOz+7BwMmpnl7MAVuHJMOH3ed7+cgsAOX1AiYNsLtJfsxMli2R//JpoVSH1vdp6doVRJeZkVBOrJepDhVwbG73q/JncAn87t7PzOEAJF96jboUHic5lzrG6vx1WCaa4O21BmfG/3fwwFv5C8N0QCGS7zjxfTm6y8i8o=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IGjsELuq; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IGjsELuq; arc=fail smtp.client-ip=40.107.130.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IGjsELuq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IGjsELuq"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=NLHYNt//CSjdl0kWyU/QBjzVDZCuZEINIpCAL+tbKfSUMVfEqbXPwbxAs9P3RXNqpQMmcQ0JsK4cxzdRIdDsw2vpNj3wbXb+1kxbC8q3LSPX5TSdc4IwTpIpaGq/qXbw/+gZxW98+tJR/Zbe2w4PqCEHCsIcgYNTz/RKYUVsOWO7XYPLGcYvQI9pTf9m4qlONDzj6+giPDooDGtrF7A83DdqKuL4ew46A4KmE+5VNoLXjSpZcj7utdJlmGr77lC1kncxyCF5QE1MOP23e78sK1EBLpJf1TPhhpGVbFESfx7GEeGxMqk6/NUJB6hmcDmpPMxaOLkuTy/oq5lAGEayMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKWjNS/Xs8pqGkqtSFzvkABgQhROuvj7DCq6S8sb0cA=;
 b=x6rl04OKWovNX3cyIguyupB1p0qBmacG8ML+Z0kSbPFDA6oEbHODNf78FZffdXEBMlujgeChM/9/sWOeCrneKK1P5p6PzoyoIYrrCzHfuIZspeS8UhdXF/BkgS4RfQAIpfHeY09bhZxNKvmVelaGmGpCX3Hilg6W3kOhhp8AyqTYRA6280WQ2lMLcEsumdVCBrQl1Y++BLzJ9AYECoSazDGgZASfAF/uPTWWnBSuLqdGTrfg0tSQHpyi6v5igXX46SYV+q92wUH7Wto1DQBXLssBxwAza9LtDxdem3BPByf4BZ6FiYRjFHLCfOKv+QWng1SQsce9udf7Dzy010W5Xg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKWjNS/Xs8pqGkqtSFzvkABgQhROuvj7DCq6S8sb0cA=;
 b=IGjsELuqfW+QyW720k2DNQ/aF24R5kGk4LmJsESDSw0USTVj5jyh5nbD2PS4aatyAW+ln3WO46AYEW4jziTISgB4K+iPcDJo4ysM9gNp2Yrf+aG7exdaWg948kvWgVzJpNouwZVGZTDCQydAN9TbYbV1b84ZIiIa1jvkNpyMKZ8=
Received: from DB8PR06CA0063.eurprd06.prod.outlook.com (2603:10a6:10:120::37)
 by PA4PR08MB7458.eurprd08.prod.outlook.com (2603:10a6:102:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Thu, 19 Jun
 2025 04:04:10 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::9) by DB8PR06CA0063.outlook.office365.com
 (2603:10a6:10:120::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.34 via Frontend Transport; Thu,
 19 Jun 2025 04:04:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.21
 via Frontend Transport; Thu, 19 Jun 2025 04:04:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l4fVB+C/z8dr3+TFDLzsQ8wDb/Jbf2TqSgo+WCEynkerM4t20iGfDI4GA7CStMlfUWmip8Ifm9cOZau1+3k0XSNgzXBjRLb2iK/oZ5iZkuzZx3moydAAUsi9qC0+tojSPK5Qj8x6kGx5UfGDjXD70aujw6uU3rzUJlBKObFf88LvVBGnnYBQJAlFU5/3TnLNMpHR8Lsq1XkzPKCQrSLxBWyZUVsiSI5TEty5CxqKJXF16vIktYxmwVfFO2I/EqLWREDG8UPUnEOGg9NGSaTdygG3gXJCmPSEnQt+2vxULDl+G45Rlu4FBH7RMKu0ewUGw114MKunu01oL4r7qNgWlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKWjNS/Xs8pqGkqtSFzvkABgQhROuvj7DCq6S8sb0cA=;
 b=VtuaRfjcdHKq8a2TTuwTDDti+SXI3vCTQpKlr86GiQUXz8osSEBVd47ZdvfIemIAvXse9F2Pbl8anKqrTKtE1Aj3jIbAiBpbiyhUcdoJ8mb0Ioshn7jey25nZtX0798MgTVS1ievZN2Zy2OdC+i0ujXMDtcDqKgjY+6bZt4RlZJHXSU29ubSuiE9LMGGyHaefy4iNH8rN2SmOwiiKnDIMXW09nLlO/V9puQJ3AjWY7GP3/M9zMSpkPeV+Q7ak0gmY+2css15alJJG7PxekQB++VCQvr5tJC8F+A9i2MSu1N1vz/mXUV5W5TUeL55SNk4eGD0Xb0JdoDhmeuKjqVADA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eKWjNS/Xs8pqGkqtSFzvkABgQhROuvj7DCq6S8sb0cA=;
 b=IGjsELuqfW+QyW720k2DNQ/aF24R5kGk4LmJsESDSw0USTVj5jyh5nbD2PS4aatyAW+ln3WO46AYEW4jziTISgB4K+iPcDJo4ysM9gNp2Yrf+aG7exdaWg948kvWgVzJpNouwZVGZTDCQydAN9TbYbV1b84ZIiIa1jvkNpyMKZ8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAVPR08MB9860.eurprd08.prod.outlook.com (2603:10a6:102:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.34; Thu, 19 Jun
 2025 04:03:36 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8857.020; Thu, 19 Jun 2025
 04:03:36 +0000
Message-ID: <1c7ba21a-7038-4edf-8734-fdba0c617c52@arm.com>
Date: Thu, 19 Jun 2025 09:33:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: pageattr: Use pagewalk API to change memory
 permissions
To: Karim Manaouil <kmanaouil.dev@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, david@redhat.com, catalin.marinas@arm.com,
 will@kernel.org, Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
 surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, ryan.roberts@arm.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-2-dev.jain@arm.com>
 <8077b321-8953-46aa-b06d-95c91823e6ce@lucifer.local>
 <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250614145021.7yve56wcxf3dlvwg@ed.ac.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0074.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAVPR08MB9860:EE_|DU6PEPF0000B61D:EE_|PA4PR08MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c4b5bf-ec32-40b2-5c09-08ddaee65712
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?ek1EbWJ5Mk9UeHZVNGkzVnJjQWc1aVMvTFN6YnZLTTdRUWxXM3lOZHh5ejho?=
 =?utf-8?B?Z1dEOTRpV1BONHlJeFcvVXV6R1oyRTBsSmxZVnhReXY3Vmx6MlFkRDI2TmdT?=
 =?utf-8?B?bk93ZlVpcGY5OXRmRVJORUFJdVkzNENJY3E3RUZtUnh0TFRhT1NmWkxjYTdJ?=
 =?utf-8?B?T0cvZVYxSFVTWFJZUGh6QXlUSE9tMkxZUHNWZWtQQ3QvRHVnNXJyY0pOS0dv?=
 =?utf-8?B?Q3BlWUR5VzdoVU1IMkFTcGpJYUZxTE8vcVpOSHVtdjRSb2xLT1FrQk1uNklN?=
 =?utf-8?B?c0FIZHNmQi9WWDRHL0RSbEorUndOb2VjVE4wMjd3Q0E0ME10THNtcWdURlRT?=
 =?utf-8?B?R1lHUHFoV0VvbU9YTHJqem1tRjJEeWpOWTFSUmtEWmM5ZEE0OElpTTFhbVNl?=
 =?utf-8?B?VytqVUxPSzRLbFRodnBBRk9uMWpzZzVPRTBscFhCbnlqSktwRlFDOGRLNVly?=
 =?utf-8?B?ell2MWM5ditFMU45RkdQV0l5RjcvN1pCQW5YV1NDNXYvenpMc3dOUWtiT0p2?=
 =?utf-8?B?WVNyTVIvK2ZYNVY4RG1wcjVKZHMwNU1VQm5tUTVxenF1eE5zYnpMdzFJVGI3?=
 =?utf-8?B?Tk82UXB5VWJqRi91YVpTbTg3L2ZOQUhTdzJlTk9BMjlDUzAyYTRKY1d5bXNE?=
 =?utf-8?B?ZmhkQlVneitMR3RkSTNHYytkMDZJQjJ3SkMxd21Jb3ZaSTFlNWN4NUFyeXNH?=
 =?utf-8?B?VkJURnpSTWgyS2hnVHFMQ0FDTDBuSUgvZmNvcHdtK0NZUlNidmlUUFZnWUFG?=
 =?utf-8?B?YW8xMVQvbkh6b0dsdXZxblo1MWttcWw1eVZnbWlieHNsRzBxWmdUN09WaXUv?=
 =?utf-8?B?M1E1MmkvQnNJa25kZHRzeXhJV2lRQ09COFdnOEtWNURJWFJtdm9IOGZnNW9T?=
 =?utf-8?B?L2JETHFDMEhtbDR0T2dSUVJrZkt6K2JUaHNYalRoeGE3RC9FQURiUlJSdkJP?=
 =?utf-8?B?L1kzVHE2MjlLMU1oMXJvTUN1VXczbG1nK0RRWXMrTUZQQVFQNEp0YitFcTRx?=
 =?utf-8?B?OGRtL3dCSG9WWkt4bTdvNCtWampqeGRKeUxWS1F2RnBaK1FYRWhVZUZFL1ZH?=
 =?utf-8?B?RVZ3dHRLbTlrSFRFTWh0b0tkNWRneUhzZ09DUUJva1lOYXd1akFOQlRxbTVE?=
 =?utf-8?B?azR1TzMzS2JNL3RkQWtQMnQrUG9qU2FOVTRrcDluazJjY0xNNTVhVDNEajV0?=
 =?utf-8?B?U0tYNXByZmt6MkFJWllnSjRGQ1ZIcWQ2d3ZLWDBFbGFxckJxVE1adkNkaCtW?=
 =?utf-8?B?N2Jqc2xNY2F1akU2cFQ3S3RQRGRIbEtIRVh5dEtWenVaSE15aDFSZUlXRTVz?=
 =?utf-8?B?Z0hHWThrL3Z2NEg0TjdvdDU2QzQ0UWcvSHN1eklNS0d0Q2NrUDZNS0N3K3hs?=
 =?utf-8?B?UXE0bmhvNC9XUmNVcFoyU09pRUF2c0Zhdk1xeUl3Mk9ITkdBdHl2a1hsb05s?=
 =?utf-8?B?NmRwbTNhdWdxQ1RRbitwODR6ekRvRW1wdEQ5eVVpaDdSZk1ybVRZOW0yRmRI?=
 =?utf-8?B?azNXWGg0MXlNRU1oNDZseG91TjVqN0cxTWRtYzFQS05aRmdtMmd5SmNLNEhK?=
 =?utf-8?B?dFc0Q0lKQXJVU2N1YnlGc2szUkVxdFFxd2I3S2V1SlVndGJ4Ry9DTkVtSDZQ?=
 =?utf-8?B?aVUyZU9qb2UrSFlqVCtEcVVHVUYrNE1odHdXZlBtdXFlY1B0QTArLzkvUEd1?=
 =?utf-8?B?R2xHdFVSOGNjZmJJdXZXMk9FRzNsTlJ6a3FYaHlvS3Q1U0ZreGVhNTZoRTBz?=
 =?utf-8?B?K2hJa0p3UjhNUkQwaGZWUGpZbDk1b1EreFB4TTlyeEpsOUlrZjVjcjZQODB4?=
 =?utf-8?B?YWMzbWpkODBmZnkrelRidXpIQ3RCQ1VkblROSTNhRjdWWHNvR2tYRVdvRnNp?=
 =?utf-8?B?Q0FmSzJuZTVDeHRNK3JsVWhSOVJELzdyVXNHR2o1UlBsSmQ4TnV6UytJd2JS?=
 =?utf-8?Q?nH8GwXHchPc=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9860
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2aa2ffdf-6031-4be1-7353-08ddaee643c4
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|14060799003|35042699022|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?KzRpYXQ0dVlYMFJycVo3SDRKeXdCMXYvSDRpclQ3a1R6Y1B2c3NIbm5kNVdV?=
 =?utf-8?B?QXVucTFrd01mY2dCQmp6N3RYcmVyNlRjSWE5SGdSTFp3cmFDYzlzWElEL21q?=
 =?utf-8?B?WG5NRGxpVlFsRlpWWjZyU29NT2s1YjE1WXJLSlBRalBCWU9naU5ZVkVHVGN3?=
 =?utf-8?B?blZwdFNWU3BqSGVQUFA5aUI3d2syL2dOYnMxUkFPMVlsYlVGaEhHQUFoNEpR?=
 =?utf-8?B?QVlVQjVpcFpSdCswU1ZsT0JoekpjdFhFYlVJMmR3SmtDL3FtM0F3a2JrWHFr?=
 =?utf-8?B?MmNmTE56bVRYUnlpQllDS3pLd1ExbGFyZGIzTTUvMk9pNWpIajVNVkNEZkNz?=
 =?utf-8?B?TjFia096eXJRSG43WHVBREEzc0wrWlpRQ2VTell0bFluN0VYUEVLNDBTbXpt?=
 =?utf-8?B?MXZDN3FqNFQwRXRZclVYMDliRU5tZk5uRDlZNlIrRnJPOGpmMDhpV3ByUHcx?=
 =?utf-8?B?MTVlOWwvNEZpczk3SWVvczJoeTVOTEk3TXVvb2JmM2wzaVhLL0FFbUZTR3Bq?=
 =?utf-8?B?MWJPM1F2eDQ3THN5RnlNeVNmL01LUE5XQXhzSWtKUXFiRzdXTE9ZYVdHRkl6?=
 =?utf-8?B?eXZJeTJaYWRIQ3IwTjlNZ2c3aHRIMHc4RlhWdEcvei9uWXNUbURmblhTTm1t?=
 =?utf-8?B?YmF0T2E4RDNjWWdLd3RFU0Y1MzhjUTFrVUZZbVZhUEZFUmErSitTOGpwR0oz?=
 =?utf-8?B?bklGTTFLMFQ5RkNEWW5OQWdsc3VKSHlzMFRhemY4ZmhNUVBPMEhRL1piTHJk?=
 =?utf-8?B?VGpZTitBU3EyeVRQaFFpYndib0E0TnRYZFJleE9kRStRbFhBUjQzU2NvdkEy?=
 =?utf-8?B?QzFmdDFMZHA5Z3JCcjV0U0RhL3ZOSlNJcStSRFhQZ0FvTldZRmhKZVRIWURa?=
 =?utf-8?B?UE9ROFo1U1A3OFpsQmVSSWlTRnZLaGJLS2pVcWtQaDdMODMzWC9BU3lPdTJP?=
 =?utf-8?B?SDBsdVI5d2hKekRkdHBRMjc3NDg1aWRlV0pDK29aRmxxYkV6TEZGQmR3S21O?=
 =?utf-8?B?YisvbDhHWFMvODRhdmFPdGpoS1dUSlhSK3ZkZXIxaDZwZmRnVHc5NTdqbGJX?=
 =?utf-8?B?SVVpWlc2TmF1TGNsQzlsV2pnSUlucHRFM2tpY3AwSjI4ZHgyNU4ycUtFMmRP?=
 =?utf-8?B?WWlWdzg3RGxIdlZQMnN3YjlYTnRsTmU5YWRtOGhmSXlwbXFubG1TZ0QwWlNM?=
 =?utf-8?B?RVJ2TjV2NGlPRGFSWVRLV0xMU1NWRHYwYysxWDdEVzFNSy93SmtUL0lvZmww?=
 =?utf-8?B?Uk5hQmZIcCtqY0N2ZkM2bzVVSkdOVklPaWFQdnI1Um1RSlVLWDE4R2lIUDFn?=
 =?utf-8?B?UFhGVlZnYWRRTkdsRm9SSytZMStrOTRjZHBwVHlwSjFwQ3VFak9wSTIvN0V1?=
 =?utf-8?B?ay90aFhFNlpaNzBLSkx0Q3NFa3BEKzRmWFFEWVV4U0k1aG0rdmpDSWlpWGVV?=
 =?utf-8?B?M1VXTGNpUWxGL3Y1STBaWHpVUEhkTDYrVGR4NlpoTU4zV1Z0NFhSZ1NFcCtj?=
 =?utf-8?B?WWVDWEgyMHpKWmZCSlJIa3Fxek0vbWdsaGhLRVR2RTZsKzdaS29zOUNZY3hT?=
 =?utf-8?B?K1RvbytRK2NvTzk2empmdUVkTlZUTEk0YlhrSGx1cXNZbHdlV1FSSVN0eVdx?=
 =?utf-8?B?RENmcXNNbllYSGVJNVNQL0pIVmkwTFRPdmI5dE9xMEh3a3c1T1pDYXVVWm5F?=
 =?utf-8?B?WGZKL2w3MHl4VE51SnBoRHUxczVrMkZWS0lSdEoyWnNvdnJ6NVIybGxDTXU4?=
 =?utf-8?B?MGtJVFFtOUtvTURMK0wzT25mZWV1dzB2SU1nN3BzTkpHZVhZUi9yaS9xeHFU?=
 =?utf-8?B?RGdMYmsvWkFxNFpocExEeVFZVG0xcVBsYS9saW41S2NzYThaalNxclVnNmkr?=
 =?utf-8?B?dkRQZU5wMHNCeWlJV1UzWVQ3UmRBbGMzZjZlVGxWMEtYZHhWR2VvSUVKbVp3?=
 =?utf-8?B?QUZtNmcvQm1mQlpKWHZDL2ZQenB2QTVjNmpPWlNlUHVWNXFKNldyMWJKR0ZD?=
 =?utf-8?B?eTBkV0tRZnEzUFhUUVkzaU1IeDFzeC9HWDBuMXJmbStDeFFLRDg0dnl4QnNz?=
 =?utf-8?Q?1IoYQu?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(14060799003)(35042699022)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 04:04:08.2040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c4b5bf-ec32-40b2-5c09-08ddaee65712
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7458


On 14/06/25 8:20 pm, Karim Manaouil wrote:
> On Fri, Jun 13, 2025 at 05:27:27PM +0100, Lorenzo Stoakes wrote:
>> On Fri, Jun 13, 2025 at 07:13:51PM +0530, Dev Jain wrote:
>>> +		if (WARN_ON_ONCE((next - addr) != PGDIR_SIZE))
>>> +			return -EINVAL;
>> I guess the point here is to assert that the searched range _entirely
>> spans_ the folio that the higher order leaf page table entry describes.
>>
>> I'm guessing this is desired.
>>
>> But I'm not sure this should be a warning?
>>
>> What if you happen to walk a range that isn't aligned like this?
> My understandging is that the caller must ensure that addr is
> pud/pmd/pte-aligned. But, imho, since -EINVAL is returned, I don't think
> the WARN_ON_ONCE() is needed.

I don't really have a strong opinion on this. Ryan may be better fitted
to answer.

>
