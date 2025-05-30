Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2069.outbound.protection.outlook.com [40.107.249.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4831C84A5
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.69
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748599868; cv=fail; b=uWT1V9JqhpMEqvdlhM+g6KPeTG3txeBv7MpDiC52A/ri2e3IrkW9xAp6FvoQd6LlyLCJW3Qos+bGDgcszaOrqGvyXS6BkJxM0FapnqjGRYGTABkXSrAnJRmLzeqvmnyzBjn8R+jUhituKMc16tWTkMIOYy1jnp3OEXsF+bvEMQc=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748599868; c=relaxed/simple;
	bh=+vONsYcheRGyMyJkzaBO7834m4ZKKOvP2uZZTl6P0AY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KBA/t4W1ZirhAhuCP5e1BFYFapE/ZhsiAD3BlDBUpvxtqN7XeRStY68TktjV1mDvazZmwRsDoMrtjFRwiNNq+M6gUENqxzvC1/U6KP02BIeIYan89xYcA2OnkG2OIInrtIBM3FXGddJUTQbBlyIHJWPjPZlZEc59LamqTivqtxo=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UGyvOMYF; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UGyvOMYF; arc=fail smtp.client-ip=40.107.249.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UGyvOMYF";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UGyvOMYF"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JDSxRztX9naHxYIWTSrziZ1RmUFOGib4z3MQvWWRvuUdcbZaENutiRYpouwZLSweFOUepHQy5B5sq/CW3O073QegkQtDfEj8NBq6jCHxLe7Em7Sa8cJuvQHQ3coIv0YagFGEDAKqkfM8JbnNAUeQZQMEQDzs/VrPCU+swgQm0l9APloKgcAmj7M6WmhEMq9DHia9qXbl7MJeWzEh/hJy1slbomWM8coHU2W8GcN4ZqVOE2LOn9V8anYM8FNFRCOg3a0fMm0XfPAym2zAnPtn2YAsGqWRC0IKO9waAlh2YxxujzVEfp4N26OrumwJURhYmcdzqhAec1jBh1IA53H2PA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWoVN2yYhdHWFvZx5ad+b6OClDZzSYz108dWpAtyfU0=;
 b=ZKSrQKa9TBXPjzBTdKRwJDugD0DHIZi+u0e8D4d5yizlMiBwdRjJbkdmfTKd8DaTH0eFhPkzaNjuKeFu4Rp2CePEFXGEA6s/47NknTkMZ1KZKD8ea4g48sqVJjRtDFrE/qFnzTskMIbuP67wPlm0xIjuNBEEiotzeTVAYqyl6W/Tkd141M6s3Y5Qa8lV++ZuUzS6NeY2W8ASskJvaqhO1Ea+os3IX5Fd0HbNMo6iJ4YjAbX+SoxoZVVRAfI5TtOGrjDqtKDWt1t2r0uKoo2j6Ztqi0xRW3uaIMqpFMi/YkkanlgJBQKM0Gc5m6Au6MuxeBOJEx3RIIztMDE7b5o1MQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWoVN2yYhdHWFvZx5ad+b6OClDZzSYz108dWpAtyfU0=;
 b=UGyvOMYFgly8xb5I8AiA9sUy78P4bDfyrOzzmLcNVhDzpdh5A6faywpSKbgizb0OryrNnWPLZc5N44+zSP5tk1OEbxKbwe5FIyxDjq152zJg6Op5dvc2gdyrxpysbrCls32S9pGIXya+L9VJgni0aQHvlYjh1jlVrGz0N0lEWJw=
Received: from DU2PR04CA0193.eurprd04.prod.outlook.com (2603:10a6:10:28d::18)
 by PAWPR08MB10319.eurprd08.prod.outlook.com (2603:10a6:102:332::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Fri, 30 May
 2025 10:11:01 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:28d:cafe::63) by DU2PR04CA0193.outlook.office365.com
 (2603:10a6:10:28d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.22 via Frontend Transport; Fri,
 30 May 2025 10:11:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Fri, 30 May 2025 10:10:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ASOFXmBdvtsK36FmyANaAwH/wVNWjaxNIpocSZDIoWZnT/aw01rny8in5S81F4w5xeI9+NxOMSpSLqz+mYDQvK3+ovoBL7vfQteT7B4HdrDRqWGB3GDCvWqbs9VX/XetlPhLgrKsy7eR9QmR2OSmOfN33vAc7P9fUMdOqJreJ8UU161/ldr1WwTxU2gBNei1rXnqF0ITl4wtbLrP5bmWgmsmJyDzSg16UXOGECDhl9DNXtoDe9iwF4tUQ4116Nyygh9LdXPaFKY37SSbqToEVDyZnCdkWjT1bVfV7wcDa7KTyrXHg5OLIuOweCOlMMprrbK/eMU5yoJldK7oid4gPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OWoVN2yYhdHWFvZx5ad+b6OClDZzSYz108dWpAtyfU0=;
 b=LUQAQSeLc68Ujwn+iwKYpezIXGAUP//L9/N77KC95oUkEcimuW3E6LYDBxIkM+DyyD5XjWhUKsxvjFR6XLEJt4OwmSrDbcU6wxRmRuRV6ChMeB5GQfbOKdPSNRR8C10p11RqrNbztCtAMf9mtobm0+IUEBNHRZwCeFrK3rkCIc/URda7pDPTJtYkPf/uVQBEQHKhwm0hxKuupt+LlN9Q5bOODI8PVHVh8ZBOovDBRXoWmKNh93d6pZKlyo2eC5NuMEnZ5/6QM4t4ogHuMdXusZmEomtsIvv8JpsFrlpyrYX5x34uLbOn0v+mdoK6cxUp09TPGuuVnWeOXuUnjXJzVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OWoVN2yYhdHWFvZx5ad+b6OClDZzSYz108dWpAtyfU0=;
 b=UGyvOMYFgly8xb5I8AiA9sUy78P4bDfyrOzzmLcNVhDzpdh5A6faywpSKbgizb0OryrNnWPLZc5N44+zSP5tk1OEbxKbwe5FIyxDjq152zJg6Op5dvc2gdyrxpysbrCls32S9pGIXya+L9VJgni0aQHvlYjh1jlVrGz0N0lEWJw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by PAWPR08MB10996.eurprd08.prod.outlook.com (2603:10a6:102:471::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.30; Fri, 30 May
 2025 10:10:27 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 10:10:27 +0000
Message-ID: <381fec11-0e05-4bf0-9cd8-f272fde7558f@arm.com>
Date: Fri, 30 May 2025 15:40:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable huge-vmalloc permission change
To: Ryan Roberts <ryan.roberts@arm.com>, akpm@linux-foundation.org,
 david@redhat.com, catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0038.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|PAWPR08MB10996:EE_|DU2PEPF00028D05:EE_|PAWPR08MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: e44579ba-6702-4278-8f4f-08dd9f6246c4
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RlNtaUlER1JTV05IcE5KR01zSUhnRkRTTkFPM0hqZGo5OXVBdHdrcW5HZm41?=
 =?utf-8?B?ZnBsOHFBT3RpRHVRY3Fzc1NyRnZUZ1RidjRuL0tkY1ArTVVheWJTRFNJaGkx?=
 =?utf-8?B?RExzR0p0UDFIMm53Rk96UGU1Q0JmdzhJamtwT0Freml2cnNtd2lxNjlnOFda?=
 =?utf-8?B?aTFVbmpMVTkwS1hwaVZIdHJadWQvK0JnUUZybXA0cVlURGFzamRNZlZnQ3lZ?=
 =?utf-8?B?MzQzbWpqeURMQVdQK1cyNjFtYkZmZzA3WWtYemduSTZDU2xRMDNrMVMzRzFr?=
 =?utf-8?B?K2FxOWREQmQ0QVFLRklXYzV0ZlpWUGozMEowblZuc0NrN01VQXlhV0czZGd5?=
 =?utf-8?B?b3ZRd3Vqcmh4dVdnU2g5SzRwcUZVZXNFVUxoRXhPc25DbWVSV3QrdnF0ajN1?=
 =?utf-8?B?M3VZRFU5MkpmMWx2REpsdUxtRHRmbjIwWU9QUTQwVmF5czlER2cwaSt0NHV5?=
 =?utf-8?B?S3puRmpoVisreTNVc0JDc3VycU1KVlBpbis1dGlWTlVoUmh2bSt6OHlmcDl4?=
 =?utf-8?B?UzhOc2RwVi9sTnQraElaNkVLcDNhZHBSL2tUQkxVMGZQQi9FSWg4elVadVB1?=
 =?utf-8?B?U0dEWVRWWVBjaDZleTFkeXoyR1NkenVwdkluMGczYVIrY2NrQWQ2YW1TZ3lX?=
 =?utf-8?B?VEdiek9WaDNqWEZyUDN1dllWbVdpbm9CcGUwNjh2SDEwYyswekYxZ1ZJSU5h?=
 =?utf-8?B?Rlo0VDhVNFgwdGRCOUVxYmU4aEVqeHpUeXBPQVNHVEttK0RrRm1HQmVMSlZh?=
 =?utf-8?B?eStxeXVXN0U5WFRlTG5zMXlmZHNnTGc3a3V3azArc2RkUUsvSUFORGlVVlYx?=
 =?utf-8?B?SmVPRmU1emQ4VzhRV0UwaXBJUzVURTJKdkpPWVB2R0wxdmRLN3FxVnE0ZzlN?=
 =?utf-8?B?SGxlSC9FNUdaZlZaL3JyMFJoRzJNcWZUbmM5OGhiSnhRNXVjYzh1YTZxSjM5?=
 =?utf-8?B?cTd4ek9KWEc0azc4WVhkYVg4ZlZtRTdDYUE5UWQyV0pMYWhxRXFvMDNvVmJk?=
 =?utf-8?B?QnlXek03eFZ4UXhDMkM2Mmk0UHlxSll4VU1CM0VrWEZNbEEyd1lUT0xJVE54?=
 =?utf-8?B?MVhzMDBkYW5nZC8xRmdpR2JvYXJBN0ZtbEVldUZoKzdBaVZ4Ny91M2hlbStJ?=
 =?utf-8?B?ejRjempXYllsTWx5cDJYZ3BxSVVGb296TEsrU1JlYmNRWUE1algweHQyUVFa?=
 =?utf-8?B?Wkd4Y2xwMDF0Q2E0aHNTaEt4YkVPcGpTL015TnRTTGZBUUR2SlMyVWM1YTVS?=
 =?utf-8?B?WTRDMmNXdE0rYUI4S2xSaFBqeVVLYTc4aWFrY202aTFwR3dzYTBXcTRTUXR5?=
 =?utf-8?B?M3NNVUpmOS9IUlVoYlhUMzgwYndyMEM2L2YwNHNDTmtNS0J3d0VjZTlLSC9w?=
 =?utf-8?B?eDNBaFBiTU9uaEFjeEl3NmhEYmo1TzRCaTRsQklmR2RMNjkxa3VxSUIwYUxO?=
 =?utf-8?B?R1ppcnZnUGNoNS9NVFdzcXNNdVZBOStKOVZKbFArS0dHR2Y0VndOK2VBK0VZ?=
 =?utf-8?B?NXNXb3JYb3BMSlY4MllGeHJRTVZpMC9Bc3JXckt3ZTJLMWhpSzZLMVlYNXVu?=
 =?utf-8?B?SmxydWdqWWxtYlNhS3BpRFVyU2xpclJ1eUhWaURGMXJQb3NqWjh6RGd6c0VI?=
 =?utf-8?B?TVBnWmp1ME9CT3NsWnc2cUNvRHJiSFk0dUEwakd5SkQxR1c1bE8yOVhXYldZ?=
 =?utf-8?B?VDU3VW0zSGowSTZyN1QvcEhjSkpiVy9pcUtONUk0bVd1c0k4T2hJRFFDbkVy?=
 =?utf-8?B?NWZrV25rM01qQm9jdWY4N3QrejJVY2JBY2NHeHVhNlF2amhnSjA1YzNxU3Iv?=
 =?utf-8?B?NmtOcEVqcldVRlZQRlVzY3FvNkRUR2xQZnB6QjRJZjg0SXM0S0I0TFhSNS9w?=
 =?utf-8?B?S2dvMktVZCtqblRaeVhxenZkUTU3cG1oT0NJanE2SzlaR3NxMm90eUFjQmpa?=
 =?utf-8?Q?16uOELgIB5M=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10996
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d37274bd-7180-4886-b42c-08dd9f62335a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|35042699022|376014|7416014|14060799003|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkYyeFljRW00SytpLzlNY05zc0ovVGM3VlQvdHNCYk1VRmtUWmRBMlFDeXNK?=
 =?utf-8?B?eGpPbW5Wa2NMa0E0OFNBNTY5RXYvVkJnUUFQYzRzTmZlTnRsNmVhVG9zZFZQ?=
 =?utf-8?B?WkhPdHNvek1vOVZmcG5yWUk1U0c3T2Nua3dZUHFkV0RBN0R1Yktud241Q3hT?=
 =?utf-8?B?TkQwWGkyZnV0N0wzT3RVWjBQUnBxWHBuZjNSdGtFaFNVdmIrMjQ3eURoL2Fh?=
 =?utf-8?B?ay9NNVAzNVFZREVWMTN2ZzB6V2xvK3hpTnNXeGgyd3lzbFlZV09GTjJvYi9t?=
 =?utf-8?B?QTcxWTZPUWNqY1hsOHJYK28rci9DVEhLblBqaDUrMVl3VzQyVlE5Q3Vhempo?=
 =?utf-8?B?M2wwVk43d0ZNSTV2NjMrUG9BZnRRaVUrMVNsdXdqaVZ4ZW9rM2dZWlFveEhS?=
 =?utf-8?B?b1h0V1dyUzNZYVFndEhtOVprRWUreis4SGtOTFRoeE9ZNktwMlFoOWFITDM0?=
 =?utf-8?B?dDV1blBCejlISWRlZDgwOHhNaW9yd3JBK1R2b0xHa2FSNnFBU1lIdXhOT092?=
 =?utf-8?B?ajBFWGR0bmorV0prckhPOVQ3WGhDb0F4azVGaDBGVkRvL0pEM0RKSUhIWlYv?=
 =?utf-8?B?dEozYVFsakxMUVVKaGdVWHZrQjhCTmFsM0Q4dlpkaURDREpteXBkbEdseXNv?=
 =?utf-8?B?QnM5L29oZTE2TzZJVk5RUmRoNksrMFJRUENCMk5qRVB4cStkaVlHcjZzZ2No?=
 =?utf-8?B?b3BJN3F0SzZEMVZrN3c0ZWl5czM2bnN5K3ZDRDBzR1B3U0VnMTlxWWFUL0M4?=
 =?utf-8?B?M0lDdlRzN2lCWGsrT24rOGVIdFIyUUtlVTBDVlpVOU5RRExGQUZOelZLV2wr?=
 =?utf-8?B?S3IwSzNlc2ZzNVdTV3EzZDRlSWlVMktCbWFsVVRzM1V1cm5ldkpFbG9qd2Zh?=
 =?utf-8?B?NG1HM29LMGM2VzZDbTVPbnlWNmJYVTRuMm1CWmhVWHk5ZDNwUU5GT3FpOWRS?=
 =?utf-8?B?cHNPZyszaGZUUXNXYmhIU2F4NkVHWVRPRnJNcnBQOVg5Q0tuaEtUTTNRR2w0?=
 =?utf-8?B?amoxMFNCWm4wckoyaGp1a3dNQWpTcmh2WlhiTnMzN0lXSFdZSkpSbStXVkpB?=
 =?utf-8?B?MlluVWZndkVBbWZJQUU1OWhZaHlxc21sNDBvNHorU21HSldJT1FYQ0lGUnhT?=
 =?utf-8?B?d0hGRVhPbm56VzVCTEt0WWg2N0FqZ2tJcGRKK1g1dkpUK3N5Q0gyenVDVisv?=
 =?utf-8?B?eWJRS09pTHA1UTlEVmxwYTBRUlByU0FXbHlyY3lHTXFqRDUwUkI4MHMzK2gv?=
 =?utf-8?B?bktKTXJ3cHJ3MHBic2Jzb2pia2pBRVp3enRoR096S1dYam9XTjUzaTFaeWtv?=
 =?utf-8?B?K2p3V0s3d1FyQ1ZxeTQ3RkVTam5GMUhTZnBiSE1TM2Rma0Y5RmUrNHJEQ2VN?=
 =?utf-8?B?YTllTDlHMU4yOFVSUFdsVDNFc0pEQzdPc0Ztam5XOExKRWhSK25Td21kaE5Z?=
 =?utf-8?B?L0JLMTBtcElCanZ2UmE5bU1IRFRjdlFCSWxKQzd2R1B4Y2Q1MzIvR21sS2I4?=
 =?utf-8?B?ZGh1RXN2b25kYU82dHpvcUxONFRwdHpNTmdSU004RHVobFNnTlZyckh3eGN6?=
 =?utf-8?B?MHRxMFNCY2xGMC91S3NLdmR2YXJNNUZNQ0hQSHJIdHV5N2J6VkxBdnZSMnRw?=
 =?utf-8?B?S1NpS3F4U0ZWTzlwOUxzaUpKSkp0alJoTUVpazE5RG1IZ3dPMW03WVdicVVn?=
 =?utf-8?B?RXJ5NHQvSHVmdGdEM0pqSFQ0cG9LVG5qM1UvL3ROUjJ0aVgyT0ErWUxndnlV?=
 =?utf-8?B?RE1id25GbHJIdXVBMDdkVjcvWlJtSGJlK2FCWFBZVWpMWndOWFhXT1JEMThV?=
 =?utf-8?B?dTZENXlTTDlmK0lwUG5uNnNENkRWZGJyYWc1b3o5eUJuMWtDS0xVNThiZEFu?=
 =?utf-8?B?UWpQSTN0Ni8xL3JGaHpsVVQzcU0rZVYyZlRBKzZGbSszdklxSGRHek54bUlm?=
 =?utf-8?B?dlp5OHpXNjRMMG9nRXhKMXB5SDFnc3MyUjVXL255cHk3TnhZY2R6RjJzaDJR?=
 =?utf-8?B?OElwZUhEWmY5Vk9tWkVtREw2WGZVZDBIVk1PZm5vWldYREhwM2RoakNIT3g5?=
 =?utf-8?B?SnVYS2hEelNrVzNaZjhRUUhrZ1dzemZEbTVmdz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(35042699022)(376014)(7416014)(14060799003)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 10:10:59.8403
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e44579ba-6702-4278-8f4f-08dd9f6246c4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB10319


On 30/05/25 3:33 pm, Ryan Roberts wrote:
> On 30/05/2025 10:04, Dev Jain wrote:
>> This series paves the path to enable huge mappings in vmalloc space by
>> default on arm64. > For this we must ensure that we can handle any permission
>> games on vmalloc space.
> And the linear map :)
>
>> Currently, __change_memory_common() uses
>> apply_to_page_range() which does not support changing permissions for
>> leaf mappings.
> nit: A "leaf mapping" is the lowest level entry in the page tables for a given
> address - i.e. it maps an address to some actual memory rather than to another
> pgtable. It includes what the Arm ARM calls "page mappings" (PTE level) and
> "block mappings" (PMD/PUD/.. level). apply_to_page_range() does support page
> mappings, so saying it doesn't support leaf mappings is incorrect. It doesn't
> support block mappings.

Sorry, again got confused by nomenclature : )

>
>> We attempt to move away from this by using walk_page_range_novma(),
>> similar to what riscv does right now; however, it is the responsibility
>> of the caller to ensure that we do not pass a range, or split the range
>> covering a partial leaf mapping.
>>
>> This series is tied with Yang Shi's attempt [1] at using huge mappings
>> in the linear mapping in case the system supports BBML2, in which case
>> we will be able to split the linear mapping if needed without break-before-make.
>> Thus, Yang's series, IIUC, will be one such user of my series; suppose we
>> are changing permissions on a range of the linear map backed by PMD-hugepages,
>> then the sequence of operations should look like the following:
>>
>> split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
>> split_range(end & ~HPAGE_PMD_MASK, end);
> I don't understand what the HPAGE_PMD_MASK twiddling is doing? That's not right.
> It's going to give you the offset within the 2M region. You just want:
>
> split_range(start)
> split_range(end)
>
> right?

Suppose start = 2M + 4K, end = 8M + 5K. Then my sequence will compute to
split_range(2M + 4K, 3M)
split_range(8M, 8M + 5K)
__change_memory_common(2M + 4K, 8M + 5K)

So now __change_memory_common() wouldn't have to deal with splitting the
starts and ends. Please correct me if I am wrong.

>
>> __change_memory_common(start, end);
>>
>> However, this series can be used independently of Yang's; since currently
>> permission games are being played only on pte mappings (due to apply_to_page_range
>> not supporting otherwise), this series provides the mechanism for enabling
>> huge mappings for various kernel mappings like linear map and vmalloc.
> In other words, you are saying that this series is a prerequisite for Yang's
> series (and both are prerequisites for huge vmalloc by default). Your series
> adds a new capability that Yang's series will rely on (the ability to change
> permissions on block mappings).

That's right.

>
> Thanks,
> Ryan
>
>> [1] https://lore.kernel.org/all/20250304222018.615808-1-yang@os.amperecomputing.com/
>>
>> Dev Jain (3):
>>    mm: Allow pagewalk without locks
>>    arm64: pageattr: Use walk_page_range_novma() to change memory
>>      permissions
>>    mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
>>
>>   arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
>>   include/linux/pagewalk.h |  4 ++
>>   mm/pagewalk.c            | 18 +++++++--
>>   3 files changed, 94 insertions(+), 9 deletions(-)
>>
