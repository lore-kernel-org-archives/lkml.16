Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C2B1799F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751111922; cv=fail; b=jXhcbDrQN9KCNgJJgMC/zc7hYzZA2Yt+1Zq9/VhFDARuQAls+vZXArnHhHML0k/82JrVaJy4WGTOiJjABS0+XXnFCIDfUC8Ilu4Lz4pG3K0+Sfz4imYW6S11+CtznWpqymxQbaeG7HmNxK3ADJNNse81I9XSWSlCX2p9rasNKNU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751111922; c=relaxed/simple;
	bh=ZcaBbak43lvci/N/RLTB3Btx0WmWkdCWHbIhtS7L/Tw=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=YPQpIRhDMYpl14iAUqoP05EnKwh0Nuwdz5ybhAv2JaRV0yDl6KFnOUaGVTAU/yQwYD7bJT9FHw1lH3ZUQnjRfKySsZ1Eho5DBNGmZgv8E1+GNh6jchMfuEiMvG2szhpZutv4QpUFjBY9BLR+hei2TIY0tDzBL3gysjrYjLevrSw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VZosRwqI; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VZosRwqI; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VZosRwqI";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VZosRwqI"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S7jwNlyQABi3D4yhgLVU71zFUGwdQY9iCO/1X7pnH7NXENpMtft5JG2oqtoEejbx3HsREOhymWurQPtd2RVPRHjrhnXdxHzrDebaPhikipEeSaznRzMEEuZEEArO1mAWhvlZnNsY1BND+S7fP84a6UUIEmeJ5TS4f6uHrJQr4XpAUZclRplfZoBHS2EPRRRoOQxIG8JSSNuSNU+UlTavaTUd69HCcxvFsv9yhwhm9/evrGIf3HLNEIzfTp8cSIKv2+yT/vmDm3/6LAfdEJX1h8FodRkVSYhBfFfABEAnM9EAqJ00VcgkZh8gZ0tVk8y1EeITepKgfCsNcnezj/ztZA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSqslvVX3wP5Bsm+BJ5fuK9LkMIwwb9wyo0Xc+XeWt8=;
 b=q+sWUpppvDBiq7NSksrtlZKikSj7Z6yxvu9ZLO05cDfGIuUoC2tCOr2aU9WiMeekuwrzILujqA27nUxvtYQm19vP7C8v5hPFf70NmRXaFBxIdDDEcisOErS0VA4e5wgY3QfCryCBpqA2fVouShrZ0seZjjOLlRkMFUl1/VSVdZFkl6qkM/RA2xvpxU01N37iScFE19Tu7n004gK6MiQUPWPSsZE74S4i2joYz+qH+pyUFH+R0P+GQt9ON6UoPcTb+xSupODISpCHlRfcYDYXYrAVUgum58bVSzUzGgKhYrHOAGa3afIIWdKMZNkXZYCKtWhfhtbQV2ykPC8QHwWERg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSqslvVX3wP5Bsm+BJ5fuK9LkMIwwb9wyo0Xc+XeWt8=;
 b=VZosRwqIpCTC6Suq8+kRkeaN4/Jex7hcSm87xPdG6mVKw72zJ9Ysc0OXbNr8pzOU48ImZqYxvrjePbGAQs5w3PtVq4EPEiBkLnnzrzYjDQcdyjJIDVPyc0GfyBwcAoSUmAb9I7eNuohKAh/Ck2Lu4U6AjRKvTFCOIg5mIUb7fJg=
Received: from DB3PR08CA0019.eurprd08.prod.outlook.com (2603:10a6:8::32) by
 AM0PR08MB5505.eurprd08.prod.outlook.com (2603:10a6:208:18e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Sat, 28 Jun
 2025 11:58:35 +0000
Received: from DU6PEPF0000B622.eurprd02.prod.outlook.com
 (2603:10a6:8:0:cafe::cd) by DB3PR08CA0019.outlook.office365.com
 (2603:10a6:8::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.25 via Frontend Transport; Sat,
 28 Jun 2025 11:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000B622.mail.protection.outlook.com (10.167.8.139) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 11:58:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VY0Rq14cb5zOYUT148MRStPp0DSQ1r2QO4AUuMqVsblwxEFxxizYoc0+jwjDe+n83GFy0SxfKrHclBVQ92NwNq2cXsePRlHYfUw9eL/n/r1gEwE3gib1mCpyS9b8PZ3ilP5kSbjRaNPNn8EZV7dYIlZHDuEXJc450d4LxAHdj6HD8bQGgktkCDuhb4HZpGN5Wq8KqFiqL5OmFT59+yMNua6+X76vDz+4SGAL9eBvS7W9e4gyp1mrBshqy8H0Qp6LioI+lHFCqOOyfntp30B58Ak39VsGM9BIncgrQV32sZv7AiErPlh/5yd+4+IfZCGBleHMvXNw+fh7NngX5gxpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GSqslvVX3wP5Bsm+BJ5fuK9LkMIwwb9wyo0Xc+XeWt8=;
 b=nkFfgQq/sSF0Qml1MjxUJh0TVxACqjcCttG2DZFfkZKMz1sPLNA6uQ4Cdu/GjMjZltyi8CHdoXyEuhy073c+nVvtZ5l5xukho3A5wqsubRx9YKeUeEJfEMd7B/1nhrWmBGUvIGPW8N19yKkZQ0JH9xJ668jic06/1Sbivh6+8azswY6NzSqhCau2UlBAi4u2W9iBDfQoZZRGOmLMdP72Xwm7ufS37vlNtfwXL5XgsJAmSdt9nDeVGpzXuGC85VzDWJ30TG/w0qpBEmOW3ATVBBlE2uyU17mv9/RxOjjrRXijECsgThOyNGk2V7glpT9heHABvD3qzuMiBneC6zWfTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GSqslvVX3wP5Bsm+BJ5fuK9LkMIwwb9wyo0Xc+XeWt8=;
 b=VZosRwqIpCTC6Suq8+kRkeaN4/Jex7hcSm87xPdG6mVKw72zJ9Ysc0OXbNr8pzOU48ImZqYxvrjePbGAQs5w3PtVq4EPEiBkLnnzrzYjDQcdyjJIDVPyc0GfyBwcAoSUmAb9I7eNuohKAh/Ck2Lu4U6AjRKvTFCOIg5mIUb7fJg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DB4PR08MB8055.eurprd08.prod.outlook.com (2603:10a6:10:388::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Sat, 28 Jun
 2025 11:58:01 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 11:58:01 +0000
Message-ID: <58be76a0-8fc3-4d5d-959e-eabe7664e277@arm.com>
Date: Sat, 28 Jun 2025 17:27:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] maple tree: Clean up mtree_range_walk()
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, akpm@linux-foundation.org,
 richard.weiyang@gmail.com, maple-tree@lists.infradead.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250626171918.17261-1-dev.jain@arm.com>
 <3yrtyxb6mwtwrov4vngtcy34pl77easph6hueo5m3nxlqx6o5c@f4frvl5cxees>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <3yrtyxb6mwtwrov4vngtcy34pl77easph6hueo5m3nxlqx6o5c@f4frvl5cxees>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DB4PR08MB8055:EE_|DU6PEPF0000B622:EE_|AM0PR08MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 544e48e2-9b4c-410c-99f8-08ddb63b1bc3
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?aXd2WFFuK2d6eW1yd3hGUlNhaUNkVy9LMnpvV05NcTU4eUtzanVtbnhlRVlF?=
 =?utf-8?B?ZmowQ0c5K2orWTI3eVkvQ3VPZ3psNjh5ZzB4b1IzOEVYa05YbFlNMmpIQ0NG?=
 =?utf-8?B?S3h3SzNkOU9VZExvNjJvT0JOZEVKTzIrQUhOWlNJUmM4RmFXNW1US1VNM09i?=
 =?utf-8?B?RzEra2cyajgyeWdQUllvRlBPdHFWZEhqNlRaZmllcTBTQThCdFFFajJSQzkr?=
 =?utf-8?B?bHNFUndsYWdWa0cyVHE0NGE4RkdXeUxEYStTK0NLWkU5Z2oyeUkzQ3F0Wkcx?=
 =?utf-8?B?eHFaa1Y3M0plWjR2Ry9nUzhZcldVOUxnMEc3N0hBZFAyK3JTN1JxemFqQjE3?=
 =?utf-8?B?MmRlU0t5VmZNMmkzTTczVHgxZ25vNDVMbC9WMFBPSmtaSnNUUDR3YUFpakFk?=
 =?utf-8?B?MnNDUjk5eGVnQzd2SnpFTmtBUjdUaER2QlVhM2VzbnBUMGRqL1hxakJmWE5Q?=
 =?utf-8?B?Nm10R3dVZlBWU00zVVg2d2pCTjU0dXZWYUNUYUhPT0M4RTZGYlBWUEpYZjFo?=
 =?utf-8?B?YkhUL05ueHlyQjBIMFQ0UVlrRDc2SXNWTDRrZWplQ0FrUDlpdWVDNHFlcmln?=
 =?utf-8?B?Z29OQkNIWDJLTFk1NFRKKzBhYXhnZ2ZZbjIxOU84WUNjR0ozNjhGOG1UKzlE?=
 =?utf-8?B?eFdianlHSXBHd0h4aEl2VWI1VlJWN3ZUbDY5Yy9Xd0RkSlRHR3NLMEQxVDly?=
 =?utf-8?B?SENHOUxySU1hdEpLckVkUjFJNUNrZytFK0lpNXIzcVBLQkdOZmJqeEJmUHNl?=
 =?utf-8?B?SXdrNkZ1UUtBV05TWTRVbDF4dHBZd3dxdWVYZDdmM1lSb0lPM1ZhMmtoOHhD?=
 =?utf-8?B?cjB0ZmNVdThIMmZ2dnBrUFl6dHV6MysvelJZTkpSdUx6SExvcFlNMWxoTzcx?=
 =?utf-8?B?L3h5VFRrZkFocnJHKzJMeVRjR2JqWnRRQk1qTmkvQ1FES290SDA5Y092M1NY?=
 =?utf-8?B?T09ISk56MFh0ZzRYQ0Y2VDFXcXd3MXltWlNseFMvc3QzTEE1M1ZObHFqUXpN?=
 =?utf-8?B?OGZmNkl5UE8xNEhUT2NLOVRuanI2TGEwSnV2V1J4ZGpBcktuZ3B2YU5GZVdM?=
 =?utf-8?B?K250WW5XVmJ1UjdKbm03eHVyK0RaelBhSUtQREJxT0ZTbGV6Z3hucEUrMC92?=
 =?utf-8?B?Z0ZFa0tnVnh0dnl0SmZWWFBBNzZTYzNXWnVPMmV0ZTJaY1dWYlN3SCtqNUJH?=
 =?utf-8?B?eGlpQzVlRjdNOFkxSms2MU5hM3RvOENvYWM2amEwSStoa3NXSERSWEMyNnZz?=
 =?utf-8?B?L2V6M0tPVHdUUklINEtiRnlyRy8va0Y1cERaSFFNckRRdlRDL21CbkZoTVl0?=
 =?utf-8?B?bHFBVGFsRk1PbFZrVVlwclBvbFVBTk1sQ0VETERoR1pRb3JyTG03WGxoOWJS?=
 =?utf-8?B?M3lCRERLZ2VQdlpRNEZzeUppdGNDTCszVnFibk5yOWE4dTlpYVB1RXRPSlh0?=
 =?utf-8?B?NkxoeXBYS2xaYlV4UTRNTmhIMm00dUxmZ1UrTlEwZEgxTm9DY25VRUszYjNX?=
 =?utf-8?B?c080N05mcys2Ny9DZ1QwR2dxbU1KRWJONUs3eEJ1T3hBM0Urb2VWUWJwaTFz?=
 =?utf-8?B?K2RzdXBOcStVcHVPeFFvRGg5QVNjb3JjSXE2bmxrekIwenhBeDhUS3I4TWp1?=
 =?utf-8?B?elluem84Y1JTT0NBaEhyd2tJOHVURFdCUEZmcHowZklYcnpCekoyYllJa3Ji?=
 =?utf-8?B?UkJDRWkxRnREcjgwRjVxQmp0Y3Q3U2l2dUVaekJxQ1pPTGtkaEVwT1A1ckEv?=
 =?utf-8?B?M0JuQjJsYVh3VFBxUE4zUHM4SzdWQWFsTjRYQ3B1YVJtYUhST2xCalcyQ05I?=
 =?utf-8?B?TnJqWnlML2dkM08rK1FTeEhhTmFEQkFrLzdOMktka0xmaUw5OHE2SFpGYUxk?=
 =?utf-8?B?Ykh4bHBLRTFCcDhHTUpBbHo4dXlvUTlSMW1vZkkwVTV2UUE9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8055
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2146573c-2a4f-4cc5-5e91-08ddb63b0858
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|30052699003|35042699022|82310400026|14060799003|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Wm50VEN1aXc1K2wrZmVzNXluUDl4d1FTSWdiR2syUWVDL1ZnMU10Q2UyaWlY?=
 =?utf-8?B?VzRqTVFXeVB5d2xjWkR3MVEyNHBXMzJXK0dNNnJWWHFyeW5xSXBvTHFzODFz?=
 =?utf-8?B?WTc5WS95Y2wrTjYzTm4vSnhybFp2T1ViMTc3bVk5SzhiTytDbHRsQ21ORlRI?=
 =?utf-8?B?SUhFeFdZQkVpRHpCRU9TZTdBNG9lU2d0N3g4NFhHS3A3Vk1FODg3d3dRV1BQ?=
 =?utf-8?B?UDJKaGxxRDhTWDFyL0RQak03aUFvVDh6VURtcjczSStqcmhZRm0rWjZBQW42?=
 =?utf-8?B?L3RSR2NSNFZwa3NETjVQQ1M0TDhBZytDaVkxR29PZVA1alJEYzV0WXpVYmtu?=
 =?utf-8?B?dE5DV3RqZnE4RVQxdkhWdDJCZSs4T3VCN3NkSmNjeDdHTTNGemU4TW1FQ2Yy?=
 =?utf-8?B?NFlZWTdKalM2VEhpVzF2ZnBCMmNKajc0d1VCZzRhL0laNVVTR2xRMG9kVnZO?=
 =?utf-8?B?RjFtZkYxbUYyS2IycVNVY09KWjlPNmFuUmFYSlpGMTY4NGRyV3BJSVk4ci9P?=
 =?utf-8?B?cnQ3VVM0aGd1YWcyQm50MWFaQ0VYWjVhc1A1WTVOd1lNYkkrN2lWaFlDMDN5?=
 =?utf-8?B?ZDlRSkhiMG8vM2l3d1hNQTdxdWZwdDJucWFjSytGQ3pUV000eXN6M1pwVGRE?=
 =?utf-8?B?UFBvcmp6Zmo0TmtuaUtTUTZybVdydHBPSFNVeXZ5dVp4OVlKcm5FRHpwZmJs?=
 =?utf-8?B?ZFl3M0pZb2cvNm44aGtCcStyOWNPYWRYbHFVZzBydVgxVmxveEFZR3VJU0Yr?=
 =?utf-8?B?dkg4cE5XZDdoaGs3SU9vS3FwUUNuU0tBNkE0Y3o0SXRUeUNWblA0ZUFWSWoz?=
 =?utf-8?B?TGUxMWJmaU1YUmVqcS83M0x1K3BFS0pnTWRjNjB0WGl6ZUh3bVIzN3BXaWNO?=
 =?utf-8?B?bnlCQlFnQTZoci80dXVTMTcweUFuNDNEVVhoUkhEaGZvS1djRUFmK2l4akZT?=
 =?utf-8?B?VXNleCsxbDJMQXlBSFFiZDB2U3lQbi9ZV1dwOFEyRzB2L3JQZjFiZXVXUEx2?=
 =?utf-8?B?MUo5UzM1UkNGbVhmcXBOd2tibTBONUpsK0Y0TUNyS2dsWndWWUo3TmFNZkVR?=
 =?utf-8?B?UmpvY2Z5ZHlZKzhaRWhMNzl4Zy9HR3A5RXNxbkVIOUtqYWdpYVIyZXZUR3hU?=
 =?utf-8?B?WUd2cEhpcGo3c1VWVFovN2Ztbko5Vm1GNDAySC9iYmxnUlR6UlFCbHJObGVP?=
 =?utf-8?B?Y0ZEakJkakI4TW9Pc3pqbjRGKzhSUzVBaStKVnBGZXJoRVNxdXpTdHN5WXgx?=
 =?utf-8?B?QXM1a0dZdTVyUlhwQ3RMSUN4cnFjdzdQU3hxQitqcEVTZFIxOUtwMkZ2aWtm?=
 =?utf-8?B?Q2xvR0MwUGF1Tkd6LzBxZEtIUEk1Wk1QMElsVUVIMEVNV0Y4SFVuS2tSd255?=
 =?utf-8?B?aTdVR3YwdEZKU0RZY2dsWElKZUdRaWkrNWFDaTdzYXZwSTZWcGZzRUgwaXFo?=
 =?utf-8?B?QWE3eG4zRE9sdzNud243OGt3UlRCUFZlY0M2aExoVnV4bmFiQ3dqR3FBT2Rt?=
 =?utf-8?B?Mm5VMnUzWVo2YURtK0VxbzRWdVkyUit5VS9CTTNRZG45ZzgwWUd2OEVXc0NN?=
 =?utf-8?B?V0FFNWgzNDFNaE8yaWttSWJJOU12Q2FKZ1V3bVZTclVDVGRtQmVqK3RUS3JC?=
 =?utf-8?B?LzN2TURjckxxWUZmd3RRcjhOOGY2RUJ3eVlMek5wNU9wMzY2SjcwL09QVy9h?=
 =?utf-8?B?UlhPcm1BeCtqdXgrZTZQa1VTMG4zbWVNQWRtWkIxSjlXejFhZkZ1NWVOYkhm?=
 =?utf-8?B?UmVNTVNONGtkQXQ5d2lYRWg5QTFWUHA5N1lvZXA0RmNBb3VycXBZWEgwQm5K?=
 =?utf-8?B?RnQxV0pFM1VDR1dGQlFwYjVqSzNhRVpEYkhPdFhWUDZBeGtRQjJSZWhFY1dZ?=
 =?utf-8?B?Y2lxQndQT0pVQVAzMmxpQUllRkh4a0lxV0x1TmEzUUF0R08xK0tRbFhYeUM1?=
 =?utf-8?B?M2xRdzNOTk54ZzJoejlFWm9pbmpyWDlIL0ZjOVVQUXRUV3RESHYxUjRTczZK?=
 =?utf-8?B?dyt2VW41WnRvSzZ1bW44dHFuZXV6MVhSaFU3cDFWT0JTZmhLREt2SkZTZnJN?=
 =?utf-8?Q?U6cKcQ?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(30052699003)(35042699022)(82310400026)(14060799003)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 11:58:34.0599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 544e48e2-9b4c-410c-99f8-08ddb63b1bc3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B622.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5505


On 27/06/25 1:28 am, Liam R. Howlett wrote:
> * Dev Jain <dev.jain@arm.com> [250626 13:19]:
>> The special casing for offset == 0 is being done because min will stay
>> mas->min in this case. So refactor the code to use the while loop for
>> setting the max and getting the corresponding offset, and only set the
>> min for offset > 0.
>>
>> Signed-off-by: Dev Jain <dev.jain@arm.com>
>> ---
>>   lib/maple_tree.c | 11 +++--------
>>   1 file changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/lib/maple_tree.c b/lib/maple_tree.c
>> index 0e85e92c5375..6c89e6790fb5 100644
>> --- a/lib/maple_tree.c
>> +++ b/lib/maple_tree.c
>> @@ -2770,13 +2770,8 @@ static inline void *mtree_range_walk(struct ma_state *mas)
>>   		end = ma_data_end(node, type, pivots, max);
>>   		prev_min = min;
>>   		prev_max = max;
>> -		if (pivots[0] >= mas->index) {
>> -			offset = 0;
>> -			max = pivots[0];
>> -			goto next;
>> -		}
>>   
> This new line should be dropped.
>
>> -		offset = 1;
>> +		offset = 0;
>>   		while (offset < end) {
> This should now be a do {} while();
>
>>   			if (pivots[offset] >= mas->index) {
>>   				max = pivots[offset];
>> @@ -2784,9 +2779,9 @@ static inline void *mtree_range_walk(struct ma_state *mas)
>>   			}
>>   			offset++;
>>   		}
> There should be a new line here.
>
>> +		if (likely(offset))
>> +			min = pivots[offset - 1] + 1;
>>   
>> -		min = pivots[offset - 1] + 1;
>> -next:
>>   		slots = ma_slots(node, type);
>>   		next = mt_slot(mas->tree, slots, offset);
>>   		if (unlikely(ma_dead_node(node)))
>> -- 
>> 2.30.2
>>
> The current way will check pivot 0, then skip the main loop.  Pivot 0
> has an equal chance of being the range you are looking for, but that
> probability increases based on a lower number of entries in the node.
> The root node, which we always pass through, can have as little as two
> entries, so then it's 50/50 you want pivot 0.

My understanding of the tree currently is that ma_root is a single slot.
Or can it be a normal node with 31 slots?

>
> With the way you've written it, it will check offset < end (which will
> always be the case for the first time), then do the same work as the
> out-of-loop check, then check offset an extra time after the loop.
>
> If it's written with a do {} while, the initial check of offset < end is
> avoided, but you will end up checking offset an extra time to see if min
> needs to be set.
>
> If pivot 0 is NOT the entry you want, then the current code will check
> pivot 0, then execute the loop one less time.  In the even of a root
> node with 2 entries, it will not enter the loop at all.
>
> So, the way it is written is less code execution by avoiding unnecessary
> assignment of min and checks (of offset == 0 and offset < end).

Thank you for your detailed explanation. I will have to read more to
understand what you have written : )

>
> Thanks,
> Liam
