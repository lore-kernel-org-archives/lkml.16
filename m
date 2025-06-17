Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013033.outbound.protection.outlook.com [40.107.159.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6CC28DB55
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.33
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151929; cv=fail; b=uxR5WYEZxe9Bcsr1rWdGEc1ymzWdgMnvnzkb/Fjo9J2H+tRorWBnSrgVF1MqAwdL7VTq+9ZgOTQUfzCcgTkwP3KKGk1o2Do5hRCS2B65noEtgsWDhEsmVNsggMyY4p7Zd1ZsZsJAJwTz47Z8GNfqkCp14fMYZxdGHaZXY3y2JsQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151929; c=relaxed/simple;
	bh=hVzBrQPKuM5Dh+R5EgQVPOJIDIvnjuVooB0N9vJyOys=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VSWQSE0NiCzH1PuIKLAlOkRlLmqD+t70a3MFb8OIytpy0iYrihyxbtR06gxvZMFEydFx6cC6skMFXFLYReF9sOIvsXE+9hU1Jqg7X1K1VAvqFr3Nugh14jW6NOjQvDsiQCqFU6tNQf19JsofPmzi+CTMFxEEi/59zizSDTVzND4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pDeGu2lY; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pDeGu2lY; arc=fail smtp.client-ip=40.107.159.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pDeGu2lY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pDeGu2lY"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pyLa0pBM5too7U2O29kf0p0libpn7nkwd43ryRx9G4YI1WWOzFf3bvOtKX0Ij/6y+QusADfYDMdqVthFzXEix7ZaseF3KwA/s6Cnt+4zwtO9JJ0K65GbGU7f8rnh3pmZy7kXC2m9KQDReVjxg3clgN8HYpl5lLYXzG88dG0kWj/6WWLu3xMIuX1uaELAXFfYQCFgmsMwjxMJ/ri9LXB0+D3B+i+PyrVcfZKt3CMtMDmaxiqPtd+8Lg027mRE9QrRMAGUs+N/znCH0Juhtw9JuxHebkmmMARkCyj+HZeiK01a2q8JCDzGS/1biz8lj+WKQB/0LIeOYOblpmvalGws+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR+4nDWAcO+VsFzq4jX9WNlDmDXRTiGSnMfVBXbljD0=;
 b=Z0xdRHQZH4JbldnZWmHj2o9yCcICu2/zB3oQVr8mua7OGixZ7FKu6Bubd16P5oQLvdhEvgaqKWNcUtrnyu45t/KDkf42+eQpyquXRG+CFjsWIxaG2gNUJKcJeptDEIZbb5XIBIoQW5hLTI8pM1yuja124WGhOhgVjAcpN0gRpujC7FU+3MJFgLWn2gs4Sg6Zube6fdKSGKTDPhG9w+gLX/IDkdpuGvHNT1gBhM7KLEOCUKNlE4Et35SmRClIk6JY+y/seMTcFHpJySP6RUsO6VKLNiVP+cI/tr0ew3AdvnsUOrp1CTyMmbCwHJsXUNwOn2+3Aro07fpcV6vUVkQ3pw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR+4nDWAcO+VsFzq4jX9WNlDmDXRTiGSnMfVBXbljD0=;
 b=pDeGu2lYwVdq88aAE4/vEsvO+jP8eMh7odDTXduADeIqf72CIl71c+muT0wYELeoDJzIWOmcTT+6UtevHDFxEIgzXI1gCFpnQrH1qYeHz+AXiM/2HSOsOB/os3ZMq10ZYosHLC8JhDAy0KDI1UCVAM1J6MVl2kMBDN6hm+YeTrc=
Received: from DB8PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:110::14)
 by PAXPR08MB7334.eurprd08.prod.outlook.com (2603:10a6:102:231::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 09:18:40 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:110:cafe::41) by DB8PR04CA0004.outlook.office365.com
 (2603:10a6:10:110::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.25 via Frontend Transport; Tue,
 17 Jun 2025 09:18:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 09:18:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9QppAL2jwDKivwBz5cOpYeY1NDHm07OLWuay68NPMthPUFYIUq1s6VVdnx9kHk9RCs1JdWhP3Gd5WBo1ggJdH3NOjyG7YxZjce6h2LNs5By/qL6sJ/yjOf0b8oUUeqEXqD7ktNmU6YtSdEoojcLoP5bqGbRUlaLZY3ajHFIUMT8XG7T+fXiROk3GRroaTLrLWJmDdEeRDMBuH/NdkvEH0d4+mjzAkORg5f0dVGG871tlB/o4/UE/g1Tf92qMePaaFf6Qtu5tX/1HqdBguIBXpBSzpp6m78zsActiSNCQa0CKvjLqmfIjnM3EXCtcVpNA15jWecl6on7N7+pkl92Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GR+4nDWAcO+VsFzq4jX9WNlDmDXRTiGSnMfVBXbljD0=;
 b=a14k+iK1ey/83LNJt98sXL2VSB4/YZTMyS9YFPL3UcGMRjmJvgmTrWD1ovh7MUWr5s70ctGoDVrrNhykuyO9wl4X95xXHhQa82lAoa5Wa7mYRSHtO5pWdbyPFMpcEIzAnW03JzD9lDYFIImgw/O9GyZk4P7kgwuUOBTfeoH6eOMQZPox9Hr61BGO59sK970Hnc17Vft36MNVIb4uR5bhc4Lurz1io634RVObpxzjm0A93VdTfvL0Z1rJRXxh8ItT/XfOd9qnANXDikfsh14FQVS/Kl6UmF8LZHHzpz9EK6yHyIjAQlRgrVrPU6KSTRmQEbm2pWCxIZLpEBwYbmYLwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GR+4nDWAcO+VsFzq4jX9WNlDmDXRTiGSnMfVBXbljD0=;
 b=pDeGu2lYwVdq88aAE4/vEsvO+jP8eMh7odDTXduADeIqf72CIl71c+muT0wYELeoDJzIWOmcTT+6UtevHDFxEIgzXI1gCFpnQrH1qYeHz+AXiM/2HSOsOB/os3ZMq10ZYosHLC8JhDAy0KDI1UCVAM1J6MVl2kMBDN6hm+YeTrc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AS2PR08MB8783.eurprd08.prod.outlook.com (2603:10a6:20b:5e7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 09:18:06 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 09:18:06 +0000
Message-ID: <8b8ce450-0300-4eed-a80f-2e8e18fb4e11@arm.com>
Date: Tue, 17 Jun 2025 14:48:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: David Hildenbrand <david@redhat.com>, ziy@nvidia.com,
 willy@infradead.org, dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
 <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
 <5bbf39b9-ddfc-4d97-8f08-8bd43223982f@redhat.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <5bbf39b9-ddfc-4d97-8f08-8bd43223982f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::7) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AS2PR08MB8783:EE_|DB1PEPF000509FA:EE_|PAXPR08MB7334:EE_
X-MS-Office365-Filtering-Correlation-Id: 9345cb0d-c254-4e3a-1ba0-08ddad7ff2bf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cVBZOVhJZ3ljbGpCdzB2UEhjQWNpTmJlVmtQOEN1Nmt1byswbkY0VWcvZEZa?=
 =?utf-8?B?Q05rRkNwMGtRdldpZnpwTjRLZ3ZSWTNKOWRXMGwxeHQ2dFNYbVpqUHJwZEVk?=
 =?utf-8?B?cjFJL1RBYzBHVVBpNFFTOUFYN2NvTGRITFlDT0s2TGtzN3JkTXltTDcxTnVT?=
 =?utf-8?B?NW56VVlieHFBQjRhL3lxM2REdllaV1BuTkR3K1NqNHpxRVE4aDdmVjd2VFJ3?=
 =?utf-8?B?MEZzbjhudG96TU10L0JLYTEyUGRmK3RjaU0vRVE2WS9GVWhlaGxLZSt2YmRV?=
 =?utf-8?B?bVYwMXQ4RExDQWJuV3B3UWVmRlRkYUgvRTJVOWVFdFdxY1lhdFFILzFpYzdq?=
 =?utf-8?B?K0x1M2RDTjlEQ0EvM3p3UXlDVzVhVHdHdkhwSjJMVVFrTEthUjQ5VFRXMnVt?=
 =?utf-8?B?dEdHTHJZNDRHRy9EaUxYV1gyMXdrMDZkV3Zac0hsZTBCeVNEVXpvZ2pLRU84?=
 =?utf-8?B?MkpsemtRQVhyaUdYMGZvbENrUCt0SkFWSGdVSW9XdXNiTnZyekhibldEUEph?=
 =?utf-8?B?cWgwZ3JWQkVqRHowV0J4ZEZPUWZ3ZEJaeWpuRnBFK0lNbUZ4Wkw5UDZXNHl0?=
 =?utf-8?B?MitIRXZsQlZMbFQ0MmYzSU1GSWY2NzF3ZXVaT0ZONzVYN0FCYmM3OTNzMkM0?=
 =?utf-8?B?YU4rOHJ2eWVrMWw3ZmhyQlJBVitKVnFid1gwN09hUXlSbmd2Wk4vM25Bckwv?=
 =?utf-8?B?NFFjaGczMjdTVHJGT2FHK0s4SXlZa0RaaEljUmtXUDdPVlA4Z0p6RWg0RlUr?=
 =?utf-8?B?SjRBcFRTa3JiOE1RT1VtUGhyR2FRMHVlMUtJTXpnVU1YcHRrdzYrMkJqRlRm?=
 =?utf-8?B?aTMvK0dHSVV5cW1zVEVsNE1ZUGRLTU9Oc0M4OG9aZkYyTlNmbFdxZlJmU3NC?=
 =?utf-8?B?N1RhNWwyQkxwRWoyVUpXeFhXbFF4b0lWV2hLVDRtQXNPWkpwVVRIYjUwb1k3?=
 =?utf-8?B?THNZZ1lwNGJ5SXVXOTFVbVN0dHBhMk5nT1daeDNYSGVNeGtyRk9DUGpVU01y?=
 =?utf-8?B?QlBrRnVjMS80RFRleWFzZHlmUHhaeW4zMHR6NXJpNGhFOSs3blk4cCtzbmpW?=
 =?utf-8?B?VkZMSGxYOE04dU5mdkp6VHJIaiswYi9jSDdrNTN3UXBQamo5UzI4Y1AwT1hL?=
 =?utf-8?B?TjRiNlRKeWhOTmsxTkNZS2IwWlBZdk52NGpSa2R2b0x1SzI4VG5LN3RwakxF?=
 =?utf-8?B?UG9NV1psWHFxOHExWlROM0JRRE1nckRpbFFLTlJLMDhSS21XaUVMaWxxQWFJ?=
 =?utf-8?B?a2xoRVVUbkpOME91U0llZ2lsSThlZlRhd3JHM0Nwcjk5YTVyTHMrRDdBbmtH?=
 =?utf-8?B?TkZCL2FUUzB2c3Nqc2VMclc0RFkzekZDakRuWHMwbklxdXJlQkY1SVVueTN5?=
 =?utf-8?B?MFFlY1diOVhablQ0dWphQkVGcC9FejlZWVZ6VHVWUVJoaTNMMkxhVWJZVU5T?=
 =?utf-8?B?U3BwTGVucHc4ek8wc2d5OHZaRXBuQmQ4Y3BvemZGTEQ2dzVYZG5LM2dJNFFW?=
 =?utf-8?B?SjJTanFnQmkxTFlicWJpRUh6Uld6UVUzUkw4RHhGRE0xeVRZWllXNC9LajZh?=
 =?utf-8?B?SE1OZEU2b0RwREZZZ0t6VzlsMVprdnk5Y3JzdElyUFBBVk5JUDBGY2t0N0JK?=
 =?utf-8?B?OWYwZXZJT0pwL0RqTVVYd0N1NFBJdXdMd0JwazR1V0RUSzhXaGhNbHZuYWtC?=
 =?utf-8?B?TUErR1JJRnl2TUU2WUNleW9wMVc2dm1SSEpjNUF6cDVaZjV1YWdmd0QzVEQy?=
 =?utf-8?B?MlJXd294YU5tY2E0WG9vYndoL0xzR0NHeUorM05zVUlzVmVteWNqSVBCQ3pK?=
 =?utf-8?B?SXMzY3REeU9sM1YvQ2FXUFh3ajVRZEpFcGRUQ25wcEYxakw2YVZPWXZpOWdE?=
 =?utf-8?B?UFdPc0RvY3pWUG1TVUJ1Z0tJcmVacktjL2xuLzgwQndvd1E9PQ==?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8783
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f3ec0d6-7751-47c2-95a7-08ddad7fde44
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0FBOFJFUUJVMFhHZERXZTQweFFNdFlCWHJub0lXQXBsak91SU00cENTc2dK?=
 =?utf-8?B?YzcwK2x3ckduM1BZQlBQZDZVVVJ3Nittbm5KazgwQ1pIc3dvUWZacTJOcUZi?=
 =?utf-8?B?Nk1wMmpoc0pBTWpaYVBETXhsVkFFdFgvWE1MZUZUOHYxV25iSHdIM3lHNExn?=
 =?utf-8?B?dXBEZk9wdVZHQ01yLzN1NXhYeW5pWElrU1hkc1I1SC92di9TcklnaVE3b0o1?=
 =?utf-8?B?aFF2NWJKdEZUbU1qbGFuY0ErSFlmSFRObjRvQTlyY1JDaHpTaTE1cnN3WVZw?=
 =?utf-8?B?SUhBRHc0cC9XMUozN3I5V2Z5U1lZa2gyNVZUQUVGak1XVHIvQUlJQlV6YVdG?=
 =?utf-8?B?azhBRGV0dVdiZlhERiszcnNrNm02Ri9tNVpYUmwzQnJYWlhHT1IwVEwyWG1o?=
 =?utf-8?B?Y1E4cGM5bXpjME5jdGVjYWp5U0c4ZVlyNC8zdXpieG5VTjJMaU9DUENvcitr?=
 =?utf-8?B?QzIrOTJ1VzNXU2M4a0ZjZklwSDZZN2JVdFhTS01wN2JjNEthNmU3S3hSVE1T?=
 =?utf-8?B?Z1pydFUxU0tCVkJVZ043MFBINGZmS0tyUFljTXJRSEVxNUltaFBFbWR4Q1dL?=
 =?utf-8?B?S05JRWdqSHdYMkhINEFhQVFwOHFNN2JQbXRJNjFxc3p5ZE95ckkrQzBWNEJE?=
 =?utf-8?B?Wm1tSzNkVjdaOXpxWmFXN0hGWFUvaDZpRjg5U2NYMjFtYmkzMTZaK3NDQ1cy?=
 =?utf-8?B?TjRiTEozaHBzOGJ6OVJHSW1xY2hTaDhRS2JXNk5tbUlOaytVMHdjTWw5TzE5?=
 =?utf-8?B?TWd6eXZtdS9YSEE5RmtQa05qd20wZjE3aHlEQjF5cHY4ekt1MGZkWnNnNCt0?=
 =?utf-8?B?Mm4wSTF5U3ljL0RrUDFaWFZZSThkNU1CK1RpUDZKZFFMTkRDQi93UjFWTS9w?=
 =?utf-8?B?eVlQZjVTVDdXeXVIb011RWJPZjRCRWxEVHJUZ3NaZTYwUHdmalBkNi9SQmNP?=
 =?utf-8?B?N2s1bGtueVZzcWVSckYzRGo0clI1SGtTc3Bnb1E3eSs1VmxLbS9BSmNqY2Mv?=
 =?utf-8?B?L0sraTZyN1FMcWd4RENOU3UrZjUrbUNvS2Zrb2Y3bStwRHFHOXdLRzVHVnRx?=
 =?utf-8?B?VVFBWWQwN1diajJvbzhGN1hNYTQ0QUEzcWxFSFB0cEhaTXJ2NXhtRWt5eSsw?=
 =?utf-8?B?RG5NYnVHUnR2b3VmTzFrdEFySkQvcW1BMUtCb2VGQ09kb0NmeFNhdFN5aFk0?=
 =?utf-8?B?L2pvQmg4YmFXQXVHSTcxSlExektYenNFeW05dDE2bHM5UW1NaDNMNjMyYnFz?=
 =?utf-8?B?cDBTWDM5alhzd2hrVjhkRDhlbWU1OGF3SDkxVnQzR0s2T0hQVXFTSnV2ZFIr?=
 =?utf-8?B?d3RSMDBEMERDa2wyTE54QUpzZ2w4K1QyNkhRbys3VW5tZGR6WEprSFpqZFE3?=
 =?utf-8?B?Wk9OSlVFQXRwQ08yc2czZlE3djJtb3JSbjIrZ2RLOUpGZEgrcXdyclN4YnhP?=
 =?utf-8?B?WHJzNHdNUklKYWw2SHNtQ2tjOERTeVhmOHZsWWNlRHRPZHlDUHpVNU1ld1RI?=
 =?utf-8?B?MU9uL0piNHlUQ1BjZTd2R1hmL0pyaGF1SVNVR3JtalhtTmdacTVQOUlOMHhW?=
 =?utf-8?B?UHdHL0czbkExQ2pUbzdzWld3WitaWHV6U3RsY0MxZlQySnRFdDJRaW9VMkhM?=
 =?utf-8?B?K2hiL21NTVN3YnVLaFFNWHhPUzVMRjFZUW1IUElqZ3VzcUhzUE1uUDdmYTVp?=
 =?utf-8?B?alFmdHN2NzkrZW9pRktKdXFmM0F2VkNKVU1JbWR1M3Y4VlpHOGRINzNYeXg0?=
 =?utf-8?B?YWZYcEdkSkNBMklnOURWTXh2V2lMb1RjVndGZmROSlRQR1p4MU5pT0lwVjdy?=
 =?utf-8?B?R0l0UThGREUxaFRsc2dSaDNQN1JLQ2pKS2FVbERQaUdUS1lKWnNCcUdmQ00y?=
 =?utf-8?B?U2ViNHJML2Jsd2F5b0dWZ2RaQVFmd1YvQWJLZy9yT0h2ZWY5RTRPcWJhK0hm?=
 =?utf-8?B?WGFJZEhEcGVockViVkgzcjFGME5tN29RT1dpRFBaQzV4djhieUpEMncvcHAz?=
 =?utf-8?B?dmdFV2d6Nm4xRGFxVFovTlRHVFg5Sm1oaCtaNm43QlU4YUNXbGcrRUJmUmhB?=
 =?utf-8?Q?dadDSj?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 09:18:40.0548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9345cb0d-c254-4e3a-1ba0-08ddad7ff2bf
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7334


On 17/06/25 1:17 pm, David Hildenbrand wrote:
> On 17.06.25 07:10, Dev Jain wrote:
>>
>> On 26/05/25 12:05 pm, Dev Jain wrote:
>>> Hello all,
>>>
>>> After doing an xas_load() and xas_retry(), we take neither a 
>>> reference nor a lock
>>> on the folio, and we do an xas_reload(). Is this just to reduce the 
>>> time window
>>> for a race?
>>>
>>> If the above is true, then, there is a negligible window between 
>>> xas_load() and
>>> xas_reload(), because only xas_retry() exists between them, so why 
>>> to even reload()?
>>>
>>> Thanks,
>>> Dev
>>
>> I do not completely remember our discussion in THP Cabal; I recall 
>> David Howells maybe
>> saying that the folios are already locked, so it is safe to do 
>> xas_load and then do
>> a folio_get()? Even if we remove the redundant xas_reload(), I still 
>> don't understand
>> why we won't need xas_reload() at least after folio_get()?
>
> I think the points where
>
> (a) this should go all away soon
>
> (b) there is the expectation that the folios cannot get truncated
>     concurrently. So we can do an unconditional folio_get(), don't have
>     to check folio->mapping etc.

Well...pretty sure the file read path is taking the inode->i_rwsem or 
i_lock somewhere,

to synchronize with truncation/reclaim, can't figure out where. Reclaim 
takes the i_lock in __remove_mapping and

then freezes the folio reference, so the read path must lock i_lock 
somewhere.


>
> (c) The xas_reload() seems unnecessary and can be dropped.
>
