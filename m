Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2046.outbound.protection.outlook.com [40.107.20.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E8926A09E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 10:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.46
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908515; cv=fail; b=UQ1SDOTqKPjnpnRdRlTiNi9MoeKqPrZLpa76onkqKSdgxpqa+8keGkt2XRfFZoPuPVhgYW1OlpkmfV+qpCwMc1gJQktxnqZMce7vNKiqsjQl48k0YbpYH2jxLG2DI54cWINuGXVlsU0uXkA7s+RrQ7mdSYO7dAgLmnO5pQeI6a0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908515; c=relaxed/simple;
	bh=FtUwrnDLxJ4FJuLFNWor5ONDEW3ltl7YmSKwG9cSOzY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fkIhexcIkEE55oSFpDHEzf5PTQA418b64Ted1t37jFxvdnAwSqfYgs7Dudxz6YVsVPZGh/sO22ePUG7/mVb2SdQr5BnhqgrGOPcUQMEmISPDP5x0bq+27PzTyZ6nZfkaDh6P9TOI+I/qMdlfB01fM+TlTa78g/ocTnZjuCWQXVI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q/8FUni3; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=q/8FUni3; arc=fail smtp.client-ip=40.107.20.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q/8FUni3";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="q/8FUni3"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h78UqrUG40jSjygOlWPU9TqJB4SiJ612K1WfO+V2ERE7tMmk1mRnhDQeQzJoPezLnchQ8nf5HyPwQFpm0h8+LzIXbrfOvZdTFjRQQG7VKAS9BhdbxLt2cmeTRgn21gXkSirzB6VdPRLuqFCbQJKaWfRaOi3NwRh//HCFZRTJle7utOCmVV0gqwysTT+NvRQpxxeUwMlTSrFYskVDuf8gxdgAAeivT+J6kxthtBLlxR9aUubir3knNCNlvZtjPgTmjbDnTaN4eSZ81eLmRUJHtKoefGc6Hkd4P638xXfPCm/2ntzdP3pZk4DHQlTJQHKhniw/4QQbLtAetjzHzMnQlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sek9K4YdNbNFk0r6zu+mOc6nbUg/tYyVLqGZWnvVTWY=;
 b=B8AbTkY0d/HTOzq46LhE5QkAkmRJSh21p6+JMIHa/+bAMNuY2579SdEpjuHr3BSWFYnuGAzeq3DS2yMimLggVQ+SVcMhde4j8nL8JPYa8FLg6Ysmioz5YraocP7NSid7vyBOu8ZKiEmHm349aM+wEbfsl7Aip0hkegJEt6MmEBcTAz5kWBn8a+jzBjalS+eg4ophy9L2UFvJFyRAUTRVAz2aQg+2QqjqPQnpkA2CrACE0jsNBmpuSF1qTolyCZPuBKEMj5LcgP8Va0N2gLpFs8mHvXM1YcBGndXiUkMUPbrDyX4mCJ/BSB9gr64QGfybdZqB+QyMhmb5FM6BfQFS2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=amd.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sek9K4YdNbNFk0r6zu+mOc6nbUg/tYyVLqGZWnvVTWY=;
 b=q/8FUni3MNur/CZh2HFO4GHEKXn+6WJAmuxDRjzj2PG0SfRDda+k//rwJBJFGs49OiJGqPvEV/0nEMsm/ec18hNgWBgk7v0uBntGFxUpmOc3+VJvZjHpnJcFiQPRNetOn+0NGbCuUO+kl2fKoikW77s34G8D0pLWyQrQoYG4kCU=
Received: from AS4P251CA0009.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::20)
 by PAWPR08MB11087.eurprd08.prod.outlook.com (2603:10a6:102:46b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Thu, 22 May
 2025 10:08:28 +0000
Received: from AMS1EPF00000048.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::5d) by AS4P251CA0009.outlook.office365.com
 (2603:10a6:20b:5d2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.31 via Frontend Transport; Thu,
 22 May 2025 10:08:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS1EPF00000048.mail.protection.outlook.com (10.167.16.132) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Thu, 22 May 2025 10:08:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQ26DjXBQDLkyLQfnfJ5GmdP5aBGuqazYiixOFVPqrBXMSnZ5inoq0oGbUdJxzjCDSQJdejg4z0W5jV3GfAroCVh6lExLhPrOZEo2NKsZ+/ajmwWMAQFKKIHdGJCZWCZigvH7s2LdobxqkDFGApYGcHoiwQY022jhbX9x1L0Z9gqBZGNCxUL3D05M8vibEsG8nni0ZEFeaMCzXeVP8WH4ew1kL5kMJ8Ywq+vIu/4Z/Q7pqGPaSEGTb08bcibm/PgQeIpGCYYymC/uUnw2bKLK7dYAFIqJn4MgwzGq+mYX5Mb9XodtGA7RkiUeGEoRZpQOUW1benqSlO21c9wsjSUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sek9K4YdNbNFk0r6zu+mOc6nbUg/tYyVLqGZWnvVTWY=;
 b=RfKq0axUK9xSd1cUHZi8nSLxEGsbgqFVWNWy1X+0GF+vvd28tMDEVRTeaXRFZILxk9T1g+DJtICTxVZg9tLIpoWcDt0q1jPw1dX8SRmQTsV5hQszcW1ayGIBiyOph0umynKbu56ySpVuV/MXWfZGGNPu7Jpf7c8E7AwDiLOKIvyB4FApKzd1as5WucT/mTiRMV+xkdfxId7GBfMQgHeV/WK2r6M039tNa0W92RUGpJmPjbUY8w7BUmciqVI9bWHSvHgoNweOqKg4syD+caYLtt+ngLLln0oRVAiBvHR8wsqhQNN06WIbu4FG1bULJK6kYoY9qaGnh4UWgFNC0uqcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sek9K4YdNbNFk0r6zu+mOc6nbUg/tYyVLqGZWnvVTWY=;
 b=q/8FUni3MNur/CZh2HFO4GHEKXn+6WJAmuxDRjzj2PG0SfRDda+k//rwJBJFGs49OiJGqPvEV/0nEMsm/ec18hNgWBgk7v0uBntGFxUpmOc3+VJvZjHpnJcFiQPRNetOn+0NGbCuUO+kl2fKoikW77s34G8D0pLWyQrQoYG4kCU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DU0PR08MB8162.eurprd08.prod.outlook.com (2603:10a6:10:3ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 10:07:53 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 10:07:53 +0000
Message-ID: <25cb53a2-f90e-4a70-9541-2aee51d71561@arm.com>
Date: Thu, 22 May 2025 15:37:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/khugepaged: Fix race with folio splitting in
 hpage_collapse_scan_file()
To: Shivank Garg <shivankg@amd.com>, akpm@linux-foundation.org,
 david@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: ziy@nvidia.com, baolin.wang@linux.alibaba.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, fengwei.yin@intel.com, bharata@amd.com,
 syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
References: <20250522093452.6379-1-shivankg@amd.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20250522093452.6379-1-shivankg@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0015.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::27) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DU0PR08MB8162:EE_|AMS1EPF00000048:EE_|PAWPR08MB11087:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e225647-7f31-43e0-ebf8-08dd99189862
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?MnZMNURNRW41SHhUZ2JTbkU2disrbGhYVWR2bStnU1lrMGJmaEhTMHpGOTI2?=
 =?utf-8?B?Ni9DYnRIeWhDbm1wbG5iQnFwRUJBQi96bzY2cENxdW5qSjlLN0p6UzdZTmV2?=
 =?utf-8?B?Wk1hVTN3Nzc3SDF6bWNzRG5qUjFvZE9SaENEazJmY3Zpb002aXFwODE0eHpZ?=
 =?utf-8?B?anQ0ZTZvSHRRNnZ4bkNEbXRZUGN1SHhJL1FVVjZIN2pmM0R5dkU5dWRpS1p6?=
 =?utf-8?B?dHZEK2lsRzVoczVucGczL2ZFYmVkYnpBNDltUlRXZW52NjQ5OEJ3ekNJdWFu?=
 =?utf-8?B?TnhtTGZDR0U4Y3Z4cHV5TlhLMzdZdUtXbW5xQVdaalV5cVJGcTFqU3pINXZ1?=
 =?utf-8?B?cEFDNkZCYkh0cThtUHpIZTdDMUpIckZuY2M5NmNnVkFhZHlVRHlVTHYreldU?=
 =?utf-8?B?WXRuSUlqT1Z3NkdjdW1IcmJncVhubG03djBnayt1YTd1OWhockVrWnI5QjF0?=
 =?utf-8?B?TWpTb1Myc1VvTDBCdjNRM3JuWnQ3bG9CYW5tQUwrSXFEN0g5RHlXZWNWTkY1?=
 =?utf-8?B?MG1zN0R6dVN3R0ZpMXZ3aHlZV2pVWmRiZ1M0bzNsSDBBTEdNT1N1SFIxREhW?=
 =?utf-8?B?NUxPb1hPdkFLTXJXc3hnTUJ6b0hlNlNHTU1tSjQ1MGZkV0t4RkxQZWVmTm01?=
 =?utf-8?B?NFpCUWlkcGZiVDdjWUVCWnVmTk05bkZUWWtoZENsZ25XVitpZ1I0Y2pFa1lH?=
 =?utf-8?B?anZGdzB5Q2tDSkpPWVNPVUZueHpYTFZjK0tqRGp2SVMxbW5lRW5WRGxMaFBK?=
 =?utf-8?B?eUNoSjVCRGx1RDlNYVU3TmowZWt2dllBcTFwRFI3SkdPTklaaWlkcHNXdnZH?=
 =?utf-8?B?TFFSQ1UramU1TDYvZ1RmRUMxaHlnOVhhVVh2ZWxPbzZ2VVU0aXliZklKa2Fl?=
 =?utf-8?B?OURFSHBrMUJXSy93TXRiOUdmdGFndlBjRWJVZHZKcXU4d0V0bkR3TUFxNUdY?=
 =?utf-8?B?VHc4L1FseW9nTzgxZmlvSDR6c2ZnVENoajhrbUNFNHhId1lMZGt5Wk5zengz?=
 =?utf-8?B?TjhsaExlcW4ydG5lb0FndVBpeHlCOUkzY3R5amdpcnZvdFVLdU45bU5nR1ds?=
 =?utf-8?B?UkttMTI4ODBzdFcvS0FsaFNVWlRwajhGbyt1aXhacE5xaFlvV1F1emxDNHdr?=
 =?utf-8?B?NmJHbEMzLytJMkN4UENHVDZtMHgxU0laMU5PVmxjTHp6QzhKZC9TaGtMVWwx?=
 =?utf-8?B?RkxIeUdHQ3lzWjRFYlZTQ00xOUk2QmZ5L1RRaDl3a1NqOFlvMUNHN3E5aUhM?=
 =?utf-8?B?bzVLL0xYWFE1bmw1SXpIRVJZcGQzQlQzWHdTVUZUOFNTZHN2dVVaZXNwYkEw?=
 =?utf-8?B?d1JrU3RUS2hrd0hwZGRzUytlUHhiTkZEblJlc0NaZDYvM2lrZlN2ejFLREN0?=
 =?utf-8?B?STdJcXlqb2Z3SHYzbmpSL2ZxZTBmdWFMemFhMStBVktaUkRpNkE4bXJmbkU3?=
 =?utf-8?B?UFRtRTJTZkNmRGdrbkEwaW9QNFFTVjJpNUxWM251bEtOcVV1dHNFRVBUakJN?=
 =?utf-8?B?c2Ercjc2UW1adDluWCtDeTI5NWdDbzJIVjlFMUE0dmorMGlxaFEwWjVQOEhK?=
 =?utf-8?B?WVcvcVhpODlVcEFPT2dTM0xzbEpwam8zY09pZmhxR0F0ek8zVERUVnM4YUFj?=
 =?utf-8?B?Vk5Wd2k2U25DR2V1NSs3eWlBdXU4d0d3NFVFOE9WZ3NnTXg4LzNKS1V4Uy92?=
 =?utf-8?B?b3VlKzRJRkV1MlNFSnBLSzV6L0RJejRDNG8xaU02czgrZkhFeENISHlUaS9Z?=
 =?utf-8?B?dkNvTnlKZXE3bVNKMlMwQ2k4eml0WTFDc2R5Znp0eEJ6MzRiTDRpcFNRUGFJ?=
 =?utf-8?Q?WXo7qwPYiFVtiXGGigMrXFfrdAqiajj2aaab0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8162
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9e55fc0-e0b7-4d81-458f-08dd99188435
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|35042699022|14060799003|7416014|1800799024|36860700013|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VVJrNzhzOFVlZjFjc1hSZ3BDYXB3d2J0YkI5UytvQ21WNXVCZzFnOTNXOVFE?=
 =?utf-8?B?eVBKOFVCZUx0SVhvQ3pBU010TGhqZDFkeVhuTXp2REpqb1JwUTRjdG1mUVNQ?=
 =?utf-8?B?MGl2SmE2ZXFrTzUxZjhjdlFLMkJDREY5TUFxUE9uaFBpNVRCbUVxL1JzZGpV?=
 =?utf-8?B?eW05OXJzMUI3U3VVVHltTDJ5L3JyWkJlTWFKVlpRL3huLzN2czJoTU5lVFZ3?=
 =?utf-8?B?VnJ4UGtNNzFuSHlvdzZ6cnV2UWp3SVIvQ1UzcTAvZXNMUUpVc1ZlVzYvcE9P?=
 =?utf-8?B?aWcwcHFYOVRkVFRQSU9YRjdtOGdZcHdFUHVMQW5hRXVyTldGdUxZTjJ5eTBO?=
 =?utf-8?B?T0RmT05DUGZNNC9jcUROVTNSOVM1SE5BUU1KMVN2djNPYjFQclY0eHNQV0N1?=
 =?utf-8?B?a0tJL2hzbkZ0bU1pamptTS96RndqT0YvbjBtNURQMjUyWWN1SHdPbm9UYkZs?=
 =?utf-8?B?ZWpBVnZyUXRPUTMrLzJHbFBRYXlhazI4WG1pWWNadk42YUVJdllHb2ZlaHAv?=
 =?utf-8?B?UkNRc3puTE9oNHFVczMyVWZOdnk2bC9xRnhpN21mU3NYelUzK2pwY2F5VGh1?=
 =?utf-8?B?aC9hMnYzWVNqWHE3NG9KT3VBVjduanFKbFlseGo5U2p2cEN3OWJJNERPVUdF?=
 =?utf-8?B?VGpRTWFiRE51ZEF2d0FmUUFlL1NIZnJ0SFZJejUvNUNsalVRUDJMREdHbDFa?=
 =?utf-8?B?T2VyZFNLbCtVRnlHem9NWVZmWlY5aDFGN2NzSXVxTW9NUUhiend4U0Q1MU9j?=
 =?utf-8?B?bkpwYTdpWDVnN1RNWGV5QjhwVmx2ZHd4VGNVTUE2SUZ2NzlacHNMRzNKT0hy?=
 =?utf-8?B?WEovU3VDVlFGQkpFSTZYQ3NzR1ZNbDJaQVBpMkFHc2czMGtpZFNMU1FGVnZt?=
 =?utf-8?B?R3YyMDBmclN3TlNHekV0UThiazJiWmNuYmQvWGV6dW1Lak9Ldy95cjdiN2dB?=
 =?utf-8?B?U2poUmN4Unh5V3Frd1VLdStHOVZ3WGlWSzVIZGl4ZkZJQ2RZK2d6VjJhRmlS?=
 =?utf-8?B?QXM1Rjd1UVpWV1R3VEJ6NHY4MDQ1VmtISzZibkhjTlVzT3ZvWGZDRGpXdC8w?=
 =?utf-8?B?YUo4TDdFdUQyMGxzSlJrVjQzTEdQdGRvQnU0K0o0eTJQd3NVU09TdXBZWkkx?=
 =?utf-8?B?VGZrSy9CNmtTRTg4cHplZkNDSjdtZzltY0ltbi9LN0lXUVVaZ3JpSzdBU3RZ?=
 =?utf-8?B?eDVUUHFtY3gzUVZxYzVDWENCdTRyYnBUTDVUdk1TZG8xVTdxMmNndm9OOWZT?=
 =?utf-8?B?cFVKRzVwTkY0cUs4c3J2VmkrQ0UxSjFGS1pUaWFLeG1tbEt4ejZNaXlTUWg1?=
 =?utf-8?B?UXJLZHg2U2lRVmovZGVkamdwNTNQOEtTbkIyYUliSlhSZFY5SnFFRHNNcy9G?=
 =?utf-8?B?cVFkTG5JcjN4SnZsNEJ0UGNoM09LTy9ON2Vvbk1XWFplZStpYTdmbHROclVV?=
 =?utf-8?B?bEo1YVI1MzdWb3pnK3dUZXNmb3pPWHhHNzIvN2pKSHM5T05XZ25wem92WmVG?=
 =?utf-8?B?clFTb3JyZ1QrNk9ZL1JnYzhha2pSanRqLzdQd1haOGZRL1BIa0RJdnJWNWJK?=
 =?utf-8?B?SnBMSFhzNVpxWlFzVTJyZ3A1RHk1bnJLa09vTFJYVEZZMFVsZ21sU1YxbnNs?=
 =?utf-8?B?aUZqMGVVcnJRc3BSNVFUbWk2VVFwSzdrcktNVldqRElCM2NnRzBHS2VnenVN?=
 =?utf-8?B?eUo0UmJLbG93c2x3RVhsVVl1bVVpSU5BemdxcG1xSGV0dkFnd1JkVTVBNUh1?=
 =?utf-8?B?R0RMNGl5clYwQWVCVWd6UUZiRm42UTNmWGJPRUxHUFF1QTdKTFhmVkpaeE80?=
 =?utf-8?B?UzZRK25RM2NsZmppendBbTE3eCtGUzlBZXl0ellKWEF4Ymx4aGZIS2VHMUNN?=
 =?utf-8?B?MDJkckNjTm1OcDE2VWVDQkZzOElTdHBwdnBFOWp5L0pzc24xbWppR3prSmdK?=
 =?utf-8?B?SDQ4WGNKMjZDMGFxNi9GQnhMblkxSmxZdkVUYTlZcnZ4bkY1VjhDZTFmWGxG?=
 =?utf-8?B?UXljdGRULzd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(35042699022)(14060799003)(7416014)(1800799024)(36860700013)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 10:08:27.0520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e225647-7f31-43e0-ebf8-08dd99189862
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000048.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB11087


On 22/05/25 3:04 pm, Shivank Garg wrote:
> folio_mapcount() checks folio_test_large() before proceeding to


It is not very clear in the description, where is this folio_mapcount() 
call present?

Are you talking about is_refcount_suitable()?


> folio_large_mapcount(), but there exists a race window where a folio
> could be split between these checks which triggered the
> VM_WARN_ON_FOLIO(!folio_test_large(folio), folio) in
> folio_large_mapcount().
>
> Take a temporary folio reference in hpage_collapse_scan_file() to prevent
> races with concurrent folio splitting/freeing. This prevent potential
> incorrect large folio detection.
>
> Reported-by: syzbot+2b99589e33edbe9475ca@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/all/6828470d.a70a0220.38f255.000c.GAE@google.com
> Fixes: 05c5323b2a34 ("mm: track mapcount of large folios in single value")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Shivank Garg <shivankg@amd.com>
> ---
>   mm/khugepaged.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index cc945c6ab3bd..6e8902f9d88c 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -2295,6 +2295,17 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			continue;
>   		}
>   
> +		if (!folio_try_get(folio)) {
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
> +		if (unlikely(folio != xas_reload(&xas))) {
> +			folio_put(folio);
> +			xas_reset(&xas);
> +			continue;
> +		}
> +
>   		if (folio_order(folio) == HPAGE_PMD_ORDER &&
>   		    folio->index == start) {
>   			/* Maybe PMD-mapped */
> @@ -2305,23 +2316,27 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   			 * it's safe to skip LRU and refcount checks before
>   			 * returning.
>   			 */
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		node = folio_nid(folio);
>   		if (hpage_collapse_scan_abort(node, cc)) {
>   			result = SCAN_SCAN_ABORT;
> +			folio_put(folio);
>   			break;
>   		}
>   		cc->node_load[node]++;
>   
>   		if (!folio_test_lru(folio)) {
>   			result = SCAN_PAGE_LRU;
> +			folio_put(folio);
>   			break;
>   		}
>   
>   		if (!is_refcount_suitable(folio)) {
>   			result = SCAN_PAGE_COUNT;
> +			folio_put(folio);
>   			break;
>   		}
>   
> @@ -2333,6 +2348,7 @@ static int hpage_collapse_scan_file(struct mm_struct *mm, unsigned long addr,
>   		 */
>   
>   		present += folio_nr_pages(folio);
> +		folio_put(folio);
>   
>   		if (need_resched()) {
>   			xas_pause(&xas);
