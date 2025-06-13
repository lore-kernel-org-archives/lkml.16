Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012008.outbound.protection.outlook.com [52.101.66.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF1C111BF
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.8
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824666; cv=fail; b=FUbn2FiqwgXcHj51WmYRYOH5lHagUbcw4ftK4/9QkOAjiIWO+lQMg/ljvWg4TBN1ki+WbeODqFtSr9Ghi3udyK2FlWDUWfFSJQseXfPaDSXrDkJK+aOJtGS3DkEozHWvlgrLPAHKBuAhjVH1MyiWBh/yl+YBGJO0XBxT1TDd8ek=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824666; c=relaxed/simple;
	bh=zy+I5EqQwgPQQIMsWF5xcRTbGODSZfG5pXv8V3MqXCg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=licMLASFFhLWh5lvpkDF9NkUM59ZNH3nSglL6KFDGQ68BrMxei0bLSva4q1BCmc1hD81xBJ5+xW9ujiv6rsqNmqNxgs0IynTVZOt9IFGPBQYZ/+Dxha4PFQhKuQ5cO3Rg9M9asvSOlmP8dw9Z50Z5+XY98zTiEmeADd/n33Er0A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jYikpHOG; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jYikpHOG; arc=fail smtp.client-ip=52.101.66.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jYikpHOG";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jYikpHOG"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AanQ9XrjF0ZPA/R4pJwUmrFL9+/7IN1CPU7XVqLDFrRQIFzsmVdKSZex5jdB3er0Howh+jWkFMKVcWKyaU18M8nMkgKPhAQmG+//RbMVSaxE6AAhTagJSBXA1oQLm4d5goKGGB6RDmm4Pb1Z+Sx7BckQ0BmDtqNBJXCun950UXOScBz2qoanmF5WQhvigX1GUtx6LQ6Uh67xeyZMIwuOsxJR3FFAEqOh4vjcjlnfjLwITISsyKmTja1A2ROH9EJhhAFpWLq6SchfDsyOZcmUV3RToJ1EDbkzo2JPKphyPtxyEycU0K6aakk+m0T7XtwNSLrGdfbE9sZCMqoh43CGeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNNdehApNhe5aZAaWCfSTw7AOlHoXdRZKvvxbG0hC3U=;
 b=m87jEFAEJPCP/I/v62YYzfHyKn7orWX4ERWhENnVsqmh2Ikkc4ZcaTG8j3LPuwENQJWBlFqqXItaExIdQcLOfXZmJu6Oq3pfYIQCI7cVP+n8IWOA0e0G+76DcpWFjCkwgOFVLqeD49fuR6PZ2w91AJK9wXrKnPJesLcoYmcu39cgkEEQmp7WSuZZVxY5CDxQUrcg8q9xoDXfxieSToSclupTpJlPa9/VZUIDqavLv34wZmiOA/idCbbw331B1lyyngLBzbqHyqkkH+zydChwVb/02WKN9LUcDPBAodNjnnA7fn0XWGVSwZO6sWns1xurQgvyRUSbQohD8cq96NqHkg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNNdehApNhe5aZAaWCfSTw7AOlHoXdRZKvvxbG0hC3U=;
 b=jYikpHOGXodeoQE2A9nHjZhD30oRmuFQ4uZwqEdb2h9k7TA/1/2pIFw6nZAcnh4BaFaKRvo2SlK1hMZct/1K5lO+a8YuS+PmMVfihgNAx6xggSCWqD7BQNsP3hMdpd00wcJ9m2vCkmrWTApuSu2QEJ89YAtPZbUT+O2fhixDFZk=
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by DU0PR08MB7518.eurprd08.prod.outlook.com (2603:10a6:10:312::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Fri, 13 Jun
 2025 14:24:18 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::b8) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.23 via Frontend Transport; Fri,
 13 Jun 2025 14:24:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Fri, 13 Jun 2025 14:24:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y+SK4xMDYaeY8rwi8n7A7aQwhiZrIYWlU/2BleGEtJbHcFY5S1XbDoIPE3oulbhEhVwZkvBiZ/H49OhaukBLtB+rpTd7hF1p5UMBbNGvD1rMl7YdZGmjpkou/E/TJJ/xCamWjyUai4s8KeqQOZrQsa6aJowd5ZEP4j0G9fdcMHL4pkeAmjwJFFtjcMMjGKZ/yiqTyuQPJ1oJR4F+KGboKOyXQnDjzEfEl2je3ZLmJpluxXtmzVuP1ENSQFdaxneD6MZk7bxo/zYGXmoVsvWrDJ+mbpTcMqQUA9tLTpQIb2aYltT782zgGWQVKyf1/rV79QTPaK006P0KBRBp5y9ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kNNdehApNhe5aZAaWCfSTw7AOlHoXdRZKvvxbG0hC3U=;
 b=ivp4iiZK6FfY3kJXxF8U5jtJlhATppD85e/fredFceT81OMuCvV2xy22sQfOOiVmCojVHS2wvf4Vms6+FFZVjjPw2k0AMffR9PHnWzs8Dlp9jVFv/6OrMMR7OihoYJ4/74beDOK8f3cTuPeULHWsOKnUvMLGC9P6+4viB/STt/eOXqUNISdFp9vt4X8ft2xpAPxyanpekzilRbTIc4RDNyl/FxkP1jPwdgIZJzdz7LiT1nN4D7Ldxh1d6BSp3g8+GauvS4AJ2iOqnIRmOWqeBclGRf45ZnxM8yEWKHblc8wzNV4yis83ASe8smMyVlf4pbuAIzUqQRSceD5G4YPn7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kNNdehApNhe5aZAaWCfSTw7AOlHoXdRZKvvxbG0hC3U=;
 b=jYikpHOGXodeoQE2A9nHjZhD30oRmuFQ4uZwqEdb2h9k7TA/1/2pIFw6nZAcnh4BaFaKRvo2SlK1hMZct/1K5lO+a8YuS+PmMVfihgNAx6xggSCWqD7BQNsP3hMdpd00wcJ9m2vCkmrWTApuSu2QEJ89YAtPZbUT+O2fhixDFZk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB7591.eurprd08.prod.outlook.com (2603:10a6:10:31d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.22; Fri, 13 Jun
 2025 14:23:42 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8835.023; Fri, 13 Jun 2025
 14:23:42 +0000
Message-ID: <b28374e1-a387-4a2c-8986-02cd5081a8ab@arm.com>
Date: Fri, 13 Jun 2025 19:53:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] lib/test_vmalloc.c: Allow built-in execution
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 LKML <linux-kernel@vger.kernel.org>, Baoquan He <bhe@redhat.com>,
 Christoph Hellwig <hch@infradead.org>,
 Oleksiy Avramchenko <oleksiy.avramchenko@sony.com>,
 Ryan Roberts <ryan.roberts@arm.com>
References: <20250417161216.88318-1-urezki@gmail.com>
 <20250417161216.88318-2-urezki@gmail.com>
 <6c6f1cfa-7f1b-4133-ae2a-c6b1ef2d82e8@arm.com> <aEwzcsDM2PPsx1h-@pc636>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <aEwzcsDM2PPsx1h-@pc636>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0063.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::17) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB7591:EE_|AM2PEPF0001C70F:EE_|DU0PR08MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: a4413f17-0984-446a-26f1-08ddaa85fa98
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VEdGZTVZck14NjR2MDNuemMyYVZsTW8rdEVwTDRrOWNBUzFvWHNWN3ZFWm1h?=
 =?utf-8?B?U0NwL0xzejU2YW1xUFArbHE2RGdDeDBYVFZCOS9XNEdUZCtwcEg1elZ0VEYr?=
 =?utf-8?B?cTFqVFVLaXBHMGlQVzNqZ0hBSU56Y1pGQWpMSWJCb0I1RDFrc2xBeWg5TGpm?=
 =?utf-8?B?SlJHUkcraU5OblE0L0J4cE5NWFF0T1pCRThsK3ZESTRjWTU5aXBPWGlJelc1?=
 =?utf-8?B?bXFlK1VzcFZLeUFmMkY2ZGtSSHBoQzYyR2RmYXNycEhRY2dGeHM2OEtGNlJz?=
 =?utf-8?B?eVRoQjRGNTgzYnByNFV2aEFJL0Zta3dLU3lhMWxSTnlwZDg2OGFhMnhMQVRM?=
 =?utf-8?B?V3cyNFdoODkvY3FBU3V1NGlOOUhIS04yc2N1QWRpMjhMbXBFU29uTTM1bjU0?=
 =?utf-8?B?aHMyYXVGOTZ1NlBKRXc1VzIrQ2VGSWpHdnRqWC9rZU03YXJuc1dSWXUvcWZG?=
 =?utf-8?B?WW1WNkZhL3hYRFBSOEpMdER5bWg3M0haTU4raUs2aTd0MjJZSnJtc3paUk4w?=
 =?utf-8?B?bmxwNmhEUWU2bXdrUUlvNHRobW5PdjBLMXMzWEFGditJb1dPL0loOFlBckto?=
 =?utf-8?B?UGI0ZzFDaGJHMi9JaG5jOFQ5UDNPaE4wWjN6QllCeDlVTlgwekZSeFpUZWVh?=
 =?utf-8?B?NnhWQ0NtYkZqaHpaWnlsUy9iWFlzODJMdlRGSjVKejdXc3M3MVFTNXpWWmZl?=
 =?utf-8?B?YmdwQmRvTzEvOEFScitVL1dVaVBqQVhNUzM2VmtsM043a0ZxUDRNRm80QkFU?=
 =?utf-8?B?a3JYQVoxUmJLcDRRRDRRSUJZZGZyRklXanA3WG1VZEZUT2paMStTd29MeEpv?=
 =?utf-8?B?YVZRTmRrdDV1Z2Vuek1wOHVaR0Y0cWlIbnRsb0NxN0xXQ0gvR2hqdVEzMXIy?=
 =?utf-8?B?RUNjV0pqU001YlJiNEpEaXZ6Q2F6Q3llaDZtVEo0YXZqNy91SlExTm1tdjNC?=
 =?utf-8?B?bnlsaW1tL1dVYmlxNGJzbDljSUlKR05MZWE5U1ZPTU5INDlBaXFvSk9icmtu?=
 =?utf-8?B?R0RvL3l1d2NnYlVJaWQrcGYyT3BnWmRLTEl6aFExU0Z3NDRxZTNpdEtBNWlT?=
 =?utf-8?B?OTAxbld5QlZFYk5aNWczcFl4Uk9jMVdvZnZjeDNVaEFnUHFOektHOTVIY3VP?=
 =?utf-8?B?Z3phbXhpL0ZIYUNMdmh5ODNzbjZKWDlkMXlRVDY1dThpdjRWZmF6dzZVS2Zz?=
 =?utf-8?B?REZEcFpBRkVOd1J1VFRVQWNJZXVLZ3diU3ZFNVE1YkFna3ZuYkUvdFArci9M?=
 =?utf-8?B?UVRuT1pyRWkzUlRySnZOYkpDcFZadW5JbjlrdGYxQVB5SW1OeVoxSndKV2Iw?=
 =?utf-8?B?ZlQ0U3BNNUdrQkFoNkFSQ0JaYVM2Z2NQQXc3VGkrUXFCZlFiMlM0YjRiTXp6?=
 =?utf-8?B?UEY1UGcrU25vTVhFL0JtdlZPWFNFbXlQaWV6WUQyOGlXTGRQdE1ZODAxdUZN?=
 =?utf-8?B?blg1RXdlS2dFa1djNHk4RXRteWpLb203VGxwL3NTcnpGUzNKZEswcEhMcm9W?=
 =?utf-8?B?bkQ4aktia3V5RDVrTnZIdlA4YUM4c0JISWs0MnBWMldCWTZDbis3MDJSL2hX?=
 =?utf-8?B?TUs2R2NTNm5pdW1SODgyajM0QnNtZ01UUE8rWk90Q3JXT2VsR0Z6cnVneFJm?=
 =?utf-8?B?dzg2VlVxaUV5djJSRjhaRzJJanpYQVJWUm91MFJpM1p3c0FZUTZEeklmWmJq?=
 =?utf-8?B?NHBBWStxUkdaK1orRVJmc1Q0MFBJNHl2V3l5d1hualUxYlFMbk80VEtKVHRQ?=
 =?utf-8?B?MFlHMmw0N1FoNENFalFtRGErWkRydzJYZEhYaVEyV0NKcWU1enR2dnhReUVv?=
 =?utf-8?B?N2pOOVdlSUdTVFdkS0xFem9QZDFIUDRqcFRCemtlSlUvK3V4R3R6MGVYWnY5?=
 =?utf-8?B?Wk8rMlIrN3FnWFovY1IzWGI4Z09NeU4rMkZQVU55NU1YMzFxWld0ejRCeFNG?=
 =?utf-8?Q?iblmp3OLZb0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7591
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	55ee188e-1c13-47b0-6991-08ddaa85e5e1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|14060799003|376014|36860700013|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MGJsRjZzK3gxSGJvamdmYUdIOFJYK3puTGMrWFJMZi9BUWFoanRCVXN0cXBY?=
 =?utf-8?B?eWpnK2dpNCtpZEV2L01GZVdLV3g5VUpRZHp2TmdyYXZjb2pBYVhwUTkwNG0x?=
 =?utf-8?B?TWVwWkJVcEZmQUNBREQyZTN3eGc5NVpzZGJIR2MwMnRHQWttb1NlcGQrSmVw?=
 =?utf-8?B?QUVEMGtDaE15V0RINzZFMFZyMjJOTGcvNjZTaUVmMkdscC80RGMrZFVFYk90?=
 =?utf-8?B?SnAwYVI2R0drTWloN3VRN1pzalRPb3o2YW4ra09tLzM0M1JvOTh0QXcwaGlu?=
 =?utf-8?B?Qmg1ZkxreWYzYkVwVEpmT2hIQnVIVUVPTmlwRjR0YTJMVGJsb2FScDRpUVl1?=
 =?utf-8?B?U3Q4TkpIQjN3Mlc4eUdvQmxyWDlxSW1JTkdxR1B3M2ZsVFVLR2YxSmhWVVBw?=
 =?utf-8?B?YnlKd3ZZTTN3OW9qdG0wQWVzbXRsL0F2Y1R4YjZEbjdiV0R2V2ZkYThYUHMr?=
 =?utf-8?B?Y3oydUx5N01sam5nL0FoV2NqNjFYUDBJRkpEQ2U2MmdsV2gzYWEyOUdQSGJj?=
 =?utf-8?B?QmZodGlmK3pRdTdYbndCUERzdjF3T3JJbGF2SnhmRnVyc09oLzNSZTYrVXNv?=
 =?utf-8?B?RUhUSEpHSE4vZlZtSnVhaDlYUE5jOHdsYSsvMnltY0ZwazhoanFmdzJVa09O?=
 =?utf-8?B?Rkd5OXJ0aTAvY0xHTkxmYnNuYjFsSmhwWmlJcXJvTWhlU3QyMzJ1ZGliTWlL?=
 =?utf-8?B?VDNWRmRsUVA2SWJaZjlsaWIzSWtuRERtcWRDY1dOZnJSaytOY0hiSXBhZFFJ?=
 =?utf-8?B?Nnk1S3lqV0NMRVplOENJRHArTEJ5M0pUOUhRWWd0NmJWbjhpN1hXS0libTc5?=
 =?utf-8?B?cnJTMVMxYXltbWRlZWp6N2VKcWRvenNxNGNOTE9pMWQxeUZDQTBDMmx0akhl?=
 =?utf-8?B?TVhyRzdlWXVvWmxiZEg4NFdab0pXVUZlMmZPYUNITUowekFNYmxSSjV1djhG?=
 =?utf-8?B?NlVPNWxGM1ovOWxaUERheVR4MGhEak1KaENpNU83MlZ2RFJYc3Vzd0ozc1M5?=
 =?utf-8?B?OUxvblV1Yk5ZQTR2aTFML2xrT21sdGJNczM5R0FOcThhZ0ZrVTBvZlJVUWp4?=
 =?utf-8?B?OUFhV2k2TXRyMXlkOThtMTA1MFZSQzBIcFhDdnRjUEVvRGd4NzlSdjNicEE0?=
 =?utf-8?B?VTg5N1VVc0tpR1RxZjd6N0RadGZuRWZlcjljeCtVZmZzcTR2SEhwOC9XZGU5?=
 =?utf-8?B?Zy9peWdPOHc4ekpXV2lRWldzbGtlQmt2TWpBN00vcXBzUHpnNU55TUdISnRp?=
 =?utf-8?B?UXpwUGFsdDlXZkdzaGthaXFpZUtva1Z2d21pM0EwL3ZkTXovT01PV0hHMzdw?=
 =?utf-8?B?elBTK1ZtbEdhM2xhai81OGlpRzFzcEpCNVFnN1V1MVFrZzRSS2FVTkNvQm9h?=
 =?utf-8?B?c0VleERjV01aS0x0UVJwK0VySW1pWDlFRjdDRDJKMTNQSm82UjNwZkg4UVpq?=
 =?utf-8?B?Y3AyaDI3MlJSWDlscC82elozOFZOQXBCdm9OUVE1RVZKVUQ2cVBlL1crYlIz?=
 =?utf-8?B?Sm0vN0RzcEs4UmJSaGFNWThnMUdIcUtEbDhEeU9RQ1JYNlVMWTJWR0tPVG02?=
 =?utf-8?B?SndpeENJQUM2Y0lqUHJwSVovQXQwQmNIYXIrblhkWHJ0amluTWc4Qk1RM2d1?=
 =?utf-8?B?NFo3TkdQUW9sbWExSVdHTmdyTHJsbFIweXJNSjA1REZwU2hmMGFHL29URHZC?=
 =?utf-8?B?aTQrYXBTbVdUdlN2MVBJcHl2ZURIYWdXeDVIZUlHRi9uUFpob2pJUVY1NU8w?=
 =?utf-8?B?NjJlZm0ydGZzUGx0VFFDT3pZZFE1K0ZCQ3dWanFjWWh2ZjNONWZzWUZ3U0xH?=
 =?utf-8?B?azluamVhNDl4MHJxdnpsNWIxR2YvWVJXMjdHMTVEZUszU2pqd2VDcWFyRWc2?=
 =?utf-8?B?em4vbGk1c2dyck0yZlRZT2lPdElZeGNRUFc5WVhHKytycnlPTExTUkZFdmNa?=
 =?utf-8?B?VWZNcVlDTVZLdWttd0RnTlVSYmF1ajMwZ3oxcU5qam94VlR4Y3pMMWJSNmY1?=
 =?utf-8?B?VHJmdzlhT2xrUkN1RTFXS3c1U294b0Q3UTgrQlpMVlpXdU5aa2dxai9CUG1k?=
 =?utf-8?Q?OIOg15?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(14060799003)(376014)(36860700013)(35042699022)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:24:16.7285
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4413f17-0984-446a-26f1-08ddaa85fa98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7518


On 13/06/25 7:49 pm, Uladzislau Rezki wrote:
> Hello, Dev!
>
>> On 17/04/25 9:42 pm, Uladzislau Rezki (Sony) wrote:
>>> This patch removes the dependency on module loading ("m")
>>> for the vmalloc test suite, enabling it to be built directly
>>> into the kernel, so both ("=m") and ("=y") are supported.
>>>
>>> Motivation:
>>> - Faster debugging/testing of vmalloc code;
>>> - It allows to configure the test via kernel-boot parameters.
>>>
>>> Configuration example:
>>>     test_vmalloc.nr_threads=64
>>>     test_vmalloc.run_test_mask=7
>>>     test_vmalloc.sequential_test_order=1
>>>
>>> Signed-off-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
>>> ---
>>>    lib/Kconfig.debug  | 3 +--
>>>    lib/test_vmalloc.c | 5 +++--
>>>    2 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
>>> index f9051ab610d54..166b9d830a85a 100644
>>> --- a/lib/Kconfig.debug
>>> +++ b/lib/Kconfig.debug
>>> @@ -2574,8 +2574,7 @@ config TEST_BITOPS
>>>    config TEST_VMALLOC
>>>    	tristate "Test module for stress/performance analysis of vmalloc allocator"
>>>    	default n
>>> -       depends on MMU
>>> -	depends on m
>>> +	depends on MMU
>>>    	help
>>>    	  This builds the "test_vmalloc" module that should be used for
>>>    	  stress and performance analysis. So, any new change for vmalloc
>>> diff --git a/lib/test_vmalloc.c b/lib/test_vmalloc.c
>>> index 4ab23e5e772d0..6d65ef725d42c 100644
>>> --- a/lib/test_vmalloc.c
>>> +++ b/lib/test_vmalloc.c
>>> @@ -591,10 +591,11 @@ static void do_concurrent_test(void)
>>>    	kvfree(tdriver);
>>>    }
>>> -static int vmalloc_test_init(void)
>>> +static int __init vmalloc_test_init(void)
>>>    {
>>>    	do_concurrent_test();
>>> -	return -EAGAIN; /* Fail will directly unload the module */
>>> +	/* Fail will directly unload the module */
>>> +	return IS_BUILTIN(CONFIG_TEST_VMALLOC) ? 0:-EAGAIN;
>>>    }
>>>    module_init(vmalloc_test_init)
>> Hi Uladzislau,
>>
>> Post this patch I am seeing the following problem: while booting the kernel, this test is
>> executed and a particular testcase triggers a warning splat from the kernel, then the boot
>> gets stuck for 3-4 seconds, then proceeds. I am not an expert on modules so I don't know
>> what happened but I am guessing that when the test fails, the delay is due to module
>> unloading time...do you suggest a solution? I reverted your patch and then proceeded with
>> my work, so apologies for not having the dmesg log, if you need it I'll replicate, although
>> there is some subtest which has consistently been spitting out a warning on my Apple M3 Linux
>> VM and I have been just ignoring it for long : )
>>
> This is because CONFIG_TEST_VMALLOC=y is built-in in your case.

Actually, I have a usecase for test_vmalloc :) I wanted to test my
patches through the test, but the problem is that the moment it fails,
it gets unloaded and then I cannot use the test at runtime. Currently it
is set to =m in my .config.

> Therefore the tests are triggered including the ones which generates
> kernel warnings, which is expectable. It takes some time to execute,
> therefore you see a delay.
>
> By default the CONFIG_TEST_VMALLOC is not set. This is just for
> debugging purpose. Please unset it in your kernel configuration.
> It is located under:
>
> Kernel Hacking
>    Kernel Testing and Coverage
>      Runtime Testing
>         Test Module for stress/performance analysis of vmalloc allocator
>
> --
> Uladzislau Rezki
