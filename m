Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63051DE3DB
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 05:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750137102; cv=fail; b=NCyjVrQKVNBgIsaTl7YKvesATHKHeZB3HyROxW4RauDQxWwfRQz3LYBLHGj2ejEOus0FY2052b3DplkdO/WICqJNaFJniMUOlo2n9acnuOTvQuMuOBAjeYbcO9llpf/bPXC+9bBUQMZlSQJBZWSWOWCCiMYj0Y1LqvBisOhRccE=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750137102; c=relaxed/simple;
	bh=KWSutEhKCMnOm2E5ZsIHFR/o4duivevPQOUIWorQhYo=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sGzXL9BCs2R9urONkEKAQ890dfj0RkpuQXNjECk3pSr3tHbD2rbGHGVLylYt1lu+jr9ey3moU8Od3aKINM6H/P7kuXXn6QVA2tP7AsNL5Ysoh4tOzxMQUzp0Qstp+sU5lchySLuy96e66RqRlLfjXxlIxPQbNOIzTzim+6rCxtA=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UuIqncm/; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=UuIqncm/; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UuIqncm/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="UuIqncm/"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=drqaTf3fVgKfwe1/CCy5F6cALMSVppxaDE3hiIYqxbKhH53wPYHM+vcstxSvj0A++MLL8toVRWhWX7qT5nvJPri5JbiXJnrl7NXFYoMoQAzi/p2IVxM5gh+6QStsj2dDB87hzKL2YGhWJ8GXkJBFPyRq8V2FVFGFxj5+bOkw4VRSOE1c8p1SGevXRb+p2zPH8Y7j2aXGjADQ9+yM5K/mmeAtm6iGh1Bdmj/eUnj8Vrt7x9cHsB/2Utg5PmWC7sT0I6UPkqFK+Mp08MMslwHOogEVngKPnginPmj9xQ+vKleAuszUvr9hg0alli+eMindmt/YLqVsYknuYGmuuAVX7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSutEhKCMnOm2E5ZsIHFR/o4duivevPQOUIWorQhYo=;
 b=vSeFdsn3h+OX4aSUqu/+auwoAWWDKa/C9WOHM+LSpzC3Mmwox/JbDv2rE2fK/amuZjOC7GkQxKxvBMUYOzWWvNyYvQBuJVTjnSrwjwHaoGG3dB8zIoGoHhKtE11qGZtguS14v8M1/uG/3a39AzOnOsBkPS0Ha8XSZTtE0ZC0Q/5ECjgvlQNeD4tUEcAesaQ6y90ULDoQEFX2qOolhkOBonLhA8wr09W7/l1iM8dT69eJIw4QNhWHHjl0Xe/eDkNM630hGf87rxw+w3qS6/jYuHN/x4cuZ4DBaZSiG9qSAj43OLHa39V8GB3gv4C5/eN9C5j8cJSzXQi9dMbcWxlxXg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=redhat.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWSutEhKCMnOm2E5ZsIHFR/o4duivevPQOUIWorQhYo=;
 b=UuIqncm/VH7dcyxU9P25Aqx1twkddnIieCVC6WcTVuKgQfnid8t2D5WWMUf6Ow4IZ5FGO8rin3hMRjFyHbUZuxxHzx3tXz/qYKkM+HBGmU5ejR/70CnH+0LIrToy6csx39CShwBDBXkyGsaYkkYQa2t7kpZ3FxFYPzKDM5Bubrg=
Received: from DU7P194CA0027.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::7) by
 DB9PR08MB9707.eurprd08.prod.outlook.com (2603:10a6:10:45d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Tue, 17 Jun 2025 05:11:32 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::de) by DU7P194CA0027.outlook.office365.com
 (2603:10a6:10:553::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.29 via Frontend Transport; Tue,
 17 Jun 2025 05:11:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.15
 via Frontend Transport; Tue, 17 Jun 2025 05:11:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYvqY34EFCIu//fLH72MeMgAMN5HizzCdjKpqpYRYZlhplfYU/Ue4CROBZ3CSwzmy3hPxDvvMiCIWi/ue7gMiawe3Oq2cDjnjOf7JT+06Qv5dkEgPvm/e9+/5YuqbwMXWaw4ghC+d2dKHAArDXooc9se5OotXKfl5A40mJEt+Kin/3QTVcpxooxzACaTBYKram2cFcmcxBbhqC/whKcv4NSanqBmDkrxwnuxvvv5oBRYshksGlSb8Z5NNzKVAp24F/Rq5gxUg5Dxg3iKPsgKdDSRvqK/kwlQWr2bjZYIOjr/dsDJsQmQJv4M1vEU4wr2YRBH2UIR2r0WrS0bkkdcxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWSutEhKCMnOm2E5ZsIHFR/o4duivevPQOUIWorQhYo=;
 b=IaDFkp58i4yKbRKfPAt1+DGdp5UAvIQAlZkmnckJFAhTO4a3Rn78sTVFHF5jpDNYPmrTt7N2B2VVLRAShGuFUzK4EC/8YlIr4uhADZNkwOZywZn0YBcsCLr3/kKkfs8J/jQhluRqLQBwNPBrLbxJD0M6Gi6zn00z0/SmbpVQyLL31NVpHlWL626fRIuuMso9iUo1kvoVnoPq1gHIEuQafla3lKRsqVeXpzP/HmBHraU+XE5h4zPe0OR7zjTM1h/M/GMmP8YwD4palSx3lTXOh+t4ANUffduhI42+TliKBARI1mwJDnLBmlV1I8qX8EMROj6iIFEdabYasob6HxXGPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWSutEhKCMnOm2E5ZsIHFR/o4duivevPQOUIWorQhYo=;
 b=UuIqncm/VH7dcyxU9P25Aqx1twkddnIieCVC6WcTVuKgQfnid8t2D5WWMUf6Ow4IZ5FGO8rin3hMRjFyHbUZuxxHzx3tXz/qYKkM+HBGmU5ejR/70CnH+0LIrToy6csx39CShwBDBXkyGsaYkkYQa2t7kpZ3FxFYPzKDM5Bubrg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM9PR08MB5876.eurprd08.prod.outlook.com (2603:10a6:20b:2d5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.27; Tue, 17 Jun
 2025 05:10:56 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 05:10:56 +0000
Message-ID: <918d552a-085a-4529-8f20-a060b1f0c9f1@arm.com>
Date: Tue, 17 Jun 2025 10:40:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
From: Dev Jain <dev.jain@arm.com>
To: david@redhat.com, ziy@nvidia.com, willy@infradead.org,
 dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
Content-Language: en-US
In-Reply-To: <20250526063524.22597-1-dev.jain@arm.com>
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
	AM9PR08MB7120:EE_|AM9PR08MB5876:EE_|DB5PEPF00014B96:EE_|DB9PR08MB9707:EE_
X-MS-Office365-Filtering-Correlation-Id: e46e62c8-9e08-45c8-4334-08ddad5d6bef
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?bjJ1bk1acmVuWlQ0L2hkU25JaXBmZ3o5akJHT3VtQ001MytCWkZxWG1sMnc4?=
 =?utf-8?B?SUp3QkpOeDFPQXV5NzY2ZDVtRmpDRDFQTUp6OTdBR1pJSUFPMDhrdXpHT1ZQ?=
 =?utf-8?B?WFR1bWoxelFhNllIaVYvQVpiRDdSaEcvZUwrRVJyTWJFOGMxUmY2Z1BMMXZ6?=
 =?utf-8?B?aVNyQkNZZGh2bnl0QTdRNUtiTkxVL29lY2JZMisyeWJmMmxXZVVYbTExSFpW?=
 =?utf-8?B?NlY2dmJxL3V0TS9VaWZtdi8wWnkxUVl6TjVHeHFGS2Q5ZzM3aFBWcXprMjBq?=
 =?utf-8?B?QUw0QU5XN0EvOWhQSFM2aDBhNDQxSEVVZStValJQbFlhR0xpRHFFd2RTM3pQ?=
 =?utf-8?B?dWk3alErQmNuQVNFZG0xUVNmVXp0ZHRCY3JSNkpodHJpTWhBT0FUaUdFUXZ0?=
 =?utf-8?B?UjVhKzhXOTEyMVArcGhWWWhPaE1aY3JHVGhCa2p4UmM1SmlweHdydXM0T3Y3?=
 =?utf-8?B?cW1hd0E0M2VkM21JeGI2Rm9BemZOMThGYlQzaFgyNzlOa0U4dlNQVkNrZFJq?=
 =?utf-8?B?WEpEVUtZOXc0d1R0Y1kxM1I3bjdMWVFqanBjL2R0R0R6ZGRVL2NlcmJmR0k0?=
 =?utf-8?B?RXFSRGVPd2R2bGZ5aFJ3RG5uR3BmZ3pjenFIcDY5dkxpYmIwZ2dvR2ZWSTVj?=
 =?utf-8?B?ZTJzelkyQnpmbUdmNk8wcHUrL3BDVnFad2VEaWRTYWdSNGd1RVJRb3ltOTVq?=
 =?utf-8?B?RXBKZlY3VEV3NHRwU3dHKzRmOHlPSDZScnZRWExhRzFyLzRHdEZxR1lDVEZk?=
 =?utf-8?B?b0E0amdMOUR1L1o1QmFsN2NLa2FFYzdTanA3Y3pwSGNLTUE5VE05ZmFSL0xw?=
 =?utf-8?B?RHM2NWxwZW4wTmNCcEw1anJsYmtTeU5DWWdaMWtHc3NjMFhPVWFqMjFVcnlD?=
 =?utf-8?B?OFFDdDVGWnZsWlVJODFPS1pBUFRHQUVBRHZFRW8zWTJiazB3RXlwSHJDL016?=
 =?utf-8?B?N1RvRXUzUUFtZm5mZ2lsb1lGcGQyeVJUcEVFdEFnTDZ4ekhKTnVUaFJRN2Fr?=
 =?utf-8?B?c1pEc2FxWFJZWjFTM2lqNXdNS2FKRFU4bkt3T2FkR0FFVVFOK2JONWlkVjVl?=
 =?utf-8?B?eHV4VTE4dHNEeGlWcXViTTl2QlB5eWtYNHNEVUxoN0dtbkFLTUQ5ZnU2Rm5w?=
 =?utf-8?B?Q1EzMHgydGFFRmJMU3NtQjBJY05IQnM4aExlUmdaUWhTRWVYSXIxdFdyN2RN?=
 =?utf-8?B?SEhBekZ6MDNNTkFVN2xmNXpKYU1wZENtMDQzdkZUV3lvZ1VybmtVcmVoanN1?=
 =?utf-8?B?M0RCVmx2Z1M3QUdEOVk4RGlVNGdpZ0xaM2pVcEx3clFQRUVpN1N3UmhqRTFz?=
 =?utf-8?B?K0pLaXBMR1VobmlhVUdGRjRVWnBUaHVKT1BTWm1lWDEvUUNra3oxdHFiQ3NE?=
 =?utf-8?B?bzQ2ZzhQRzFoVCttSDg1QkdRK041eWlBeDVVYmF0WUFRLy9Ucks3WjI3R2x3?=
 =?utf-8?B?VjNLRGdMWm5yWU00dW1XTG1vRHpsVWlYMUttK0xMWmZVR2F6UkhJdHhDM0VF?=
 =?utf-8?B?NHI1QzVMMnNhdXVUbzVqYlYzM3lweUZ1dnZqbWRBeHQ3S21wMVRuU1VkOHYz?=
 =?utf-8?B?YlJCTW5sdjBMZElEUXNOSEFVMUFDQlBERlZRaTBHcVpyVUxPTEVtTUoxMGlP?=
 =?utf-8?B?WDJyQ0JVU3ArTUpYREI2M2U1dCt6cGZnVnM3Y3JOWW1iWkhlWE9ERFB5S3Vo?=
 =?utf-8?B?UHNyVTdraFZ2NURGSDdIRDQvMkF4cVpzdndsRFVkWjNoSFJPa0ovVk9nTmYy?=
 =?utf-8?B?VGdadENpZkFKbjRMWTdUYmdlZEZZc0x5a2l0QW1UelpEbUdscWYxTjY0enE2?=
 =?utf-8?B?WTRjbnp5WHFTQTNXbmdXY3hITlJpeWFBazFBL3BFNDVCWWg4LzZBUkh0K2ps?=
 =?utf-8?B?V01BNi9pa0FxaHZsbDRTakVLRnliODBHS1kydjdYT2lnQWhiVTFkVlBad0hO?=
 =?utf-8?Q?VmbsXT+d39I=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5876
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5fcf8bdc-9662-4f87-9f66-08ddad5d570d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|14060799003|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VUw1c09MSjM0R0QxWitKSmFXQnV0UHl4cnFmSGhIMWs4bkp6UGlzUWNFUUds?=
 =?utf-8?B?MzFpcFM3aXVHNkVOT3o1dStZS0Z5UUw4aytQUUJtQ0hvNlEzRFc4eVExQURK?=
 =?utf-8?B?Y2ZVbTVjV3MzbkZxK2VxYUM3N1pLRW10UW4rSjlmdUs3L3RJVmdlT1dsZll5?=
 =?utf-8?B?Y0pSQy9nUEEwU25hQW9SSkxwKzNTWG9wemdRTnkvR3M2T2dmSWs4U0J5ZTJu?=
 =?utf-8?B?WEJ2eEJ3V1QrcmRQT3EvWUh5THBTdVBWRjgvRjV4MmMzV0s0SnZaTzBwVERO?=
 =?utf-8?B?eGZNa0QrUkxNZE1pTDVGbGxvYUVnbGg3aUpYZGhxeElpQ01TSjFaNFhRbGRU?=
 =?utf-8?B?R3dxTllkRExENkNYTU10WTZNdTJtQjNDYk1ya3RNTkpXNGhqdEZOeEQvcGhJ?=
 =?utf-8?B?cmwzelpZWDNjVlFCNWJGdDhjbTdRSnFDdlc0aDBPY29lWXBpMFoyQzJvZVc5?=
 =?utf-8?B?R1FVeW5SUkxXV3V0UCtoRmd0dHJINmdZWU9OMXdJQWtadmpSOXpXcEVXL2hB?=
 =?utf-8?B?YVpVZEt2azNMazNpYmZCZ29pdzRxSTJCRnRnd1BET1VwUWtyTU5QNUQ0SG5B?=
 =?utf-8?B?aXhFbzVJZkJNd0Y2ZjBvekVpdHpEeG5SQUNndjNETS80Y2ZWeVpzWmQyOHlF?=
 =?utf-8?B?NnJrQ3ZSSk9sbE8zdC9UMzhSQW9WcjdiK1h0Zkc2dU13L2RMVmQ0VlhheUIr?=
 =?utf-8?B?ZU5QSXhnb3JlYlNEdFhHYmZUTWxLSzl2MjF3dXpuSDZNaHhBenArbVVzK2o0?=
 =?utf-8?B?RzBVTHV5S0pZWWdyRC8rS0J4aHpPblM2UHZvYTM4T3dlUld6aDFKSm9nVW92?=
 =?utf-8?B?dm1DK1lrNmdxdTRhWlZsejNoaVlDSkZtNzAvYm9tcEM5cE1JQjl6NjlpRi9h?=
 =?utf-8?B?WkxHdHpKbWNZalVvcW0zZzFSTFlnVm9laFRZVitHalhSRStSekJXc0RGTkZM?=
 =?utf-8?B?NVZ2WFdVMStIczVhc2Q4dmE2cmE0TFdIeDJpMGg5M2MwOElTQkhvcGpRVDc3?=
 =?utf-8?B?NytDUm5rVVMyeTlmRGJJMFBLTUV3Y0hhTUUvaC9oOUpxZHlnditoYXlpb2Nx?=
 =?utf-8?B?TTRkZjl3MHVTemhmSis4L0MrMmdNS05OdjhiR0QvbW50elZrc0tVRVZUVWpy?=
 =?utf-8?B?enloMDJLdi9kMFBGbHhkQmJ4d3dOM0RXa1VmRndYcFpITVhCdW1qa0c0T29v?=
 =?utf-8?B?NTI2ZlU4Sjg0RnJEZ3BOQmwxK2VFdTFXZ2t2N3VwbGRGQW5CZ0tLYjJEYlBC?=
 =?utf-8?B?WE5laWhVeENzZGZDT1Y1OTQrRDJIUEpjUnB3SzE4ZEFVWUZnc3ZYU2pHS2FY?=
 =?utf-8?B?VEticGtBeWYrTGgwRjIxL3dKL1pnWTlzRk5VTHVTQmlkWmJHTmkvc3lrdFVF?=
 =?utf-8?B?dHk3VUcrQkZvK1IyU2NNczlMajVYcjFIQzhqbWVYYXRMK3JMam44REEwQXZG?=
 =?utf-8?B?dEZZeGVGS01yT01KRFJaUVRhTjNhYUo4Ulo5WFR4WGIzWGMzWWhNdVBnMmhU?=
 =?utf-8?B?dFc1ek1iR1Rod0xLc01UeE9VK0xJNklheG1qLzBSSEVZWmdzQkpUaEJUY2V1?=
 =?utf-8?B?WmNmU0FwQXA3WThRUlMzNytSRllsSUlLVmZvUzhsQ2FheXhFMjhTRmJnZUIx?=
 =?utf-8?B?L2V3Nk51bVdGT1VwYXpCaHErUkM4YXhsWVUwTkNMdGlDRjRGQWF6Q0R3bm5h?=
 =?utf-8?B?bEpBNW0wQWlJMWRvcVhxdy9HR0lRa0szVXg3cWEyVkcvckg4K0FQMW9ObFhm?=
 =?utf-8?B?SWxnTUN0c1BiSW9CZlBNSnZuaTRVWEtQd05BUkZlQkJFUkQrY3JIZzJUekww?=
 =?utf-8?B?bDUyUGdLcEZWOGtCR0NOVVhqYkZJKzU5SDYxQURRcjBIT01telRyZ3RROTRH?=
 =?utf-8?B?eTh1UWtaS2swb3p6KzlpbjgyV09sZWVOZmFYSTIvVFpvK0h0MjVqM3kydjB5?=
 =?utf-8?B?L1VjSU5HQzlVbFNvTXBLOENUVi9CdFNJU2JFUjd5WHVaa2h2QVIzK0J1ZTNs?=
 =?utf-8?B?d0dHcG83a1dxMENYZTlJQ2sxSFJIcUJsZ2Q1MmhGNnFCRkdZUktDV01zTVdR?=
 =?utf-8?Q?Cpu8tt?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(14060799003)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 05:11:30.9886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e46e62c8-9e08-45c8-4334-08ddad5d6bef
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9707


On 26/05/25 12:05 pm, Dev Jain wrote:
> Hello all,
>
> After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
> on the folio, and we do an xas_reload(). Is this just to reduce the time window
> for a race?
>
> If the above is true, then, there is a negligible window between xas_load() and
> xas_reload(), because only xas_retry() exists between them, so why to even reload()?
>
> Thanks,
> Dev

I do not completely remember our discussion in THP Cabal; I recall David Howells maybe
saying that the folios are already locked, so it is safe to do xas_load and then do
a folio_get()? Even if we remove the redundant xas_reload(), I still don't understand
why we won't need xas_reload() at least after folio_get()?

