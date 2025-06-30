Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011035.outbound.protection.outlook.com [52.101.70.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DF12580CA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.35
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751283834; cv=fail; b=lAdsZ0KZ/3Of8yHhxH90svN0dxnANUNs6Sd/t7JLpbflECPMB2ksLmJDPHQnfVyWMhouI9ue2joW353MuKtUIXNuhFdcvAPeRcGKU1/ju64r5wwAa/4x8kPMf657BsqCv//xgZLtubnptL6YCMBitaWhEjnxKVk9s0OUejI4uEg=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751283834; c=relaxed/simple;
	bh=a/PtJyRXZKyz37ILEcoijTp4FqCQySv49I4wIBnrVWs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KL8z8T9nTxocRUlLT00N40aqwT2yx693Q3Z9SJfxD3pcWzqQKXMqsnWsWvYz4PdIjPQm1jds8oaM6gXEw37+AYpsGKH1KjA/xw9T/y1E0MwPWmAs70fxt/bWhA7llZEXw/cgkS30+dE0ABPSqMmgRACb92BIMiKINf1m5Ym9cmg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pXB3vL2w; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pXB3vL2w; arc=fail smtp.client-ip=52.101.70.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pXB3vL2w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pXB3vL2w"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ABaG+I6TRiPW8XmLbq6BAPJR42e6yFXr3XAG9AsNa7AmCYaqNbp+hqPgjqW+C0MqWh785+p/w3fHHYqkqe3osoVuY5Py/qFvQZT9me62bKwwC1x3i6eXuwDl5PJbmv/pD5jek7ltI+MP4YzdeeV57Nm6TKTiplE/mn5sBNspa4AIh9yIS+2iscP3Jqy3FzscZceFRt4vlfMGbvh0uBpvwJEp1+5wqZqWMb3zSNBA9jolauJtchnq8XChv64CoFQ+tTpnNrRD/dWuHguq2hz7g/HLtAWnvXKmL0yLq3IcHTCGihbdBgcNRLlb06r+R8XKx8flTmMEJvdWKtP9m2Bx2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/PtJyRXZKyz37ILEcoijTp4FqCQySv49I4wIBnrVWs=;
 b=wejp15HipYCp8FPhig9XKZ8xVcYOvS7N9ore/3F9Fnp+Cn3/NMw3pxlfIe6JQ0kwAC6gVrNU3tgni3DJh3uOua4jbnuO5Lh/LZFTHqJuNHaUsEq2yyfb0fd47Xhe930da16KbfpXr4e7U9GAxIKVuk1HJ64XASeeHl0HKGpMJVbg9ik/cUOIN4s3ehi1v7w+neCxEsXEQj3lG3QLcKaHZLh7576nuy1bBByaYhuyzYH2h2/zqTEhbESNSWm+Kq4mjssZ7e+NvLp5pbIuzejredMznapg9I0Vamw8jXVbM4GDOzO/lNsYOCRt6o7+xguYmjgzMMzPkVpGf1a2aEo5ag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/PtJyRXZKyz37ILEcoijTp4FqCQySv49I4wIBnrVWs=;
 b=pXB3vL2w/vXjyyGDmDqZaQumm9unGgRe0Uwan74VHwgBV8ibStA6GcTJuAmlmid7m7c50EZLgamVfg+HOzstDsz+/9UYTP52P1SdIakVmE6GsC9W2KcDdRx2K2ikKM4aOlHLZja7OSzgPitoLHCviic5p2SQ3V/4keLuKNOTsJA=
Received: from DU7P191CA0015.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::7) by
 PAVPR08MB9038.eurprd08.prod.outlook.com (2603:10a6:102:32d::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.29; Mon, 30 Jun 2025 11:43:48 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::21) by DU7P191CA0015.outlook.office365.com
 (2603:10a6:10:54e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Mon,
 30 Jun 2025 11:43:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15 via
 Frontend Transport; Mon, 30 Jun 2025 11:43:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XePgOXWH0pLvRiAcGx1aV/TZzCFgKKf21cm3wm0OqCGG6XAawaQnjbNdRREe8zVB9wowsE12bdmFqGGv8ImRIVao6kBA82BUNlUSXzs/ynCS2ekQ9PoaD7IAUSOzBhCA8c4OTmfacyH/Cx2HNG8o1I/cLjHyh8TRAeZaBmkHiLwwtUY6im/WWFqoS6idricEVnOBecoXs6A1rDYSSoXHMkIBZcQO8xFaU+yuWFdwTzuyr26sFefptxWDsvluBO2iL3Nmd46DE0gVFLC0Jr2lnyeEjTlsmSFoNT+iRyFudHfjW4MPz8DSyjvGdP06vVPlooDafMvAED7fJ0tkQmH4SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/PtJyRXZKyz37ILEcoijTp4FqCQySv49I4wIBnrVWs=;
 b=cPp0qVEF/iTONt3WDOkTPOGOuohGluzRrgzYJWFpq2nCQgkYgVDdCji8h2cqFt0BQ65rZuf3Ra2WG7eji6370eiwoj6e07ZQCdtbfd774Lxwhr14pS3jFeqXqlfPxc2GEsWPH9R56VjDij5zdO0nzsokL9Wids9Ri7VXEXogMXibznbU0GkHcmB0PMHvvZSfvTVjwNcwybKMzKjhZePHK9G693C6EUOL88t0QU3M+HMXaSX9EfLoslb0ra13XK3n8ttiLQ2203I84QmepNaVTFguxJWgVuLuEOkenWtNK0ToSyrAZYrGCwekAmZPn3XnAaSB2Y14rNb+pcxslBtrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/PtJyRXZKyz37ILEcoijTp4FqCQySv49I4wIBnrVWs=;
 b=pXB3vL2w/vXjyyGDmDqZaQumm9unGgRe0Uwan74VHwgBV8ibStA6GcTJuAmlmid7m7c50EZLgamVfg+HOzstDsz+/9UYTP52P1SdIakVmE6GsC9W2KcDdRx2K2ikKM4aOlHLZja7OSzgPitoLHCviic5p2SQ3V/4keLuKNOTsJA=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB9399.eurprd08.prod.outlook.com (2603:10a6:150:e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Mon, 30 Jun
 2025 11:43:14 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 11:43:14 +0000
Message-ID: <daa7a396-5737-4b06-bb25-fb06dd7f803b@arm.com>
Date: Mon, 30 Jun 2025 17:13:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Optimize mprotect() for large folios
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, ryan.roberts@arm.com, david@redhat.com,
 willy@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 catalin.marinas@arm.com, will@kernel.org, Liam.Howlett@oracle.com,
 vbabka@suse.cz, jannh@google.com, anshuman.khandual@arm.com,
 peterx@redhat.com, joey.gouly@arm.com, ioworker0@gmail.com,
 baohua@kernel.org, kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com,
 christophe.leroy@csgroup.eu, yangyicong@hisilicon.com,
 linux-arm-kernel@lists.infradead.org, hughd@google.com,
 yang@os.amperecomputing.com, ziy@nvidia.com
References: <20250628113435.46678-1-dev.jain@arm.com>
 <abb9d742-d7ee-4379-aa0c-9f5d68cd076f@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <abb9d742-d7ee-4379-aa0c-9f5d68cd076f@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0042.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::13) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB9399:EE_|DU6PEPF0000A7E3:EE_|PAVPR08MB9038:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b69272d-a336-4cd2-9f02-08ddb7cb60a9
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UzZIOUFndFJEbS9BM3dPVUhEUWpocHJFaTZwVG9jMGNQSkRWTGZQZjNJU21x?=
 =?utf-8?B?MC9zZkZvY2FkZFNsd1FBSk5vSit3SVp1UXBnMXREb2VhSno2QlRyRVJSU1Jx?=
 =?utf-8?B?MHBsT0tmSWdjczcrNmZFWmFSZ3dNRjdaaURYT3RXUU1FODFEYmQwVVdzVnRJ?=
 =?utf-8?B?RWp4elZpZUN5a21mNHQzZjJuVnUwN0xENHRwZmFwdDJqMnNLUlZlancrM05u?=
 =?utf-8?B?bTVrUWwwa1R5K3pEMlJ0RVZoNmIyUmNvOUpyQ2pBelkxc25yZ3lWRVcrelFN?=
 =?utf-8?B?bnVaalJPRWVlanN3TzRNNGdrcVU1L1NZaktCZTNocjY2dEtnbWNOWU5XSzR6?=
 =?utf-8?B?bGZxcmowbkVuTGE2eU9Bb0dMQkNtejQzRldvS3JUb0ZpbU9vc3B6V2lnL2lK?=
 =?utf-8?B?ZmdOOVp6WHZuSWY3N3lvU0ZIak5TQm9hUlBEK2dybkVjZGQraWZ2MDQ3RjUy?=
 =?utf-8?B?UGJtM0tPdjAwZ0FpaURsNCswUXFVZ3RzVnU3YmNINGFiTURPbzVnT1Z4K25q?=
 =?utf-8?B?WTVmYTlqbE9Nd0dLYVlEeEt4R21xQ2kxVDZ0K0w3UXhWQjNDbWdVeFFBVkRt?=
 =?utf-8?B?ZndIK0dZVjZlTFdEWVhUNnpXV1BVU2RsZWdpbkFYbXVBeitDckk4dE53djdJ?=
 =?utf-8?B?SjBVZ1gyaW9KT05GYlphSWpaNXozUjl3SnpLZ1NsNlpVMGpUc0lZMnV2Q2Ry?=
 =?utf-8?B?UzBlUEhCY3VaeWZuaWxHZWdUTjVKTGc2bmFBbm11U25aUUNRYUZyZGhUdGJ2?=
 =?utf-8?B?Vjh2aUlwandFTlFvRDJnOE9NeFZDSVBSRXFoVEhSNHhhcnhTQmd1R0tFbmJ3?=
 =?utf-8?B?bEpRTWhJNHpwNGx3M1p4N0hQendqZzAvZE9mODZwRjlGRmthK05XUFpiN1pM?=
 =?utf-8?B?UkFrbktwczhRMGFXeXRZMUtONmhlOHdRckhuTGpPd1RrSjFxQ0hqdHdNeWNH?=
 =?utf-8?B?L25QUzBpSytWQ2d6VkNsdnVCTDBCS3BkS0ZZQkhDQ254MmlLUEx4R3c3U0da?=
 =?utf-8?B?QU4ybzMzM0g5aFMzVG9BMEhOM2FBbDNZR294cjJ3RS9qaG1TNTR1RlFOckxF?=
 =?utf-8?B?SERwek9UOUFNVllWSFJWbVFYNElhTUgyWDJXd0JOUk1JdVJvZGhjZHF2NVhS?=
 =?utf-8?B?ZU9rZWYvamlhdUVmUVJqSUdDTnFRNEFrR0ptRUVPMVc1aHpVeUNjRk5nc0o3?=
 =?utf-8?B?enprdngxZVRQcXFTWStOQ2JORkF0TGFnQ1ptTklOOFNJT2xPZ2ZUcU01bkVC?=
 =?utf-8?B?cU1qdC9uNEdHNWdaaURIZXZMSGpXSFpzcmFmWEFMWGpnTjc3R0drb0c4Yk9j?=
 =?utf-8?B?dDhadDF0OTZlY2xPRHkrRjhsbDhiVzMyN0V4bllPUE9FMWEvMktibXZJQUp0?=
 =?utf-8?B?dnoyQlJWZ2ZPU3o2WDIrZGtmUml0VXpaWGhiNktaRGJTVm9UTVcyelFxNXdD?=
 =?utf-8?B?b0dIc3U5VytteDFweStkTnNpQ2YvcEZDMEVpVDFJaWZIUGZianFPeitJQXRU?=
 =?utf-8?B?RXh0ZzU0OGcxY20zaGxZQTkzMC9PS1FjNTRBaUZCalJYT2VZRXorUHloWUVy?=
 =?utf-8?B?SjZrczIvc1REZUpDdFltdTRWZGRGOVZFWmtub0FCbFJMbDRmK0tTSVJ1eTh1?=
 =?utf-8?B?a2NKeGR2UEZ1b2ZxMng0bGtNWGJ1OTNJNDJqK3ZMb21QTHE0SUMxb2kxb3Q1?=
 =?utf-8?B?aFlpM2xIbXVEVDdCYU9kRlllQWd0ODJMcTZpcTNxMGtPYmNJUEZHSlo1TnF3?=
 =?utf-8?B?a1NmM1d2MW0xUUZuUU5jbzVJUWJSQktMVG5JMWlrOHBpaHNLdG5VMDZIdGl4?=
 =?utf-8?B?UkdTYUtJQnJqb3dWdFVXaXlQVm5hcXBkZ2VXTlpTQzljTVU5eUxiWlVxMkxC?=
 =?utf-8?B?SEk3TXhVRFNCL3NNNXZvcDFTcEJjVnNrQm1iZ1VBNTkwSTR0M2sxSHBnS0Q5?=
 =?utf-8?Q?CMzlNavO52Q=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB9399
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a3398283-5de2-416b-feb6-08ddb7cb4c22
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|7416014|376014|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Uy9vL0pWWms3dVJtNGQvZytnMWkxWWdOWGlwQ3ViZGxlVnFtSU1lcXdVcTJv?=
 =?utf-8?B?OHRERERWMDIyOWtCM1VmQnN5NndTZkl6dmNCbURqcnN0K29IQTBGQVlHT1N5?=
 =?utf-8?B?anlWM1AzWkh0M1BheCtUWjZhNlVFSHN4VHV1aURsZUJ4enFMaHpuK0pGWG9p?=
 =?utf-8?B?R2J6ZFpCNUVCSTBhVk1UMkFxZTFKcS92bklkazc0QTlQUmYwMWZsTkIrNjFQ?=
 =?utf-8?B?bm8wdnhyL0ZGOWxscG4vVU94YVluZE1FZCtycUVLU3FvME4vNmROSXNGQktl?=
 =?utf-8?B?Y3UxSDQ3QldveUJIbnVrS0xKMCtSdkNSQVovTzZHZHhiUTFBUWtLaUN5SVc3?=
 =?utf-8?B?WXNJaVduczJRSTk3Q1dxb0xXVU52bVo3ZzM1WTZIeFBoVjJSYU5vbEthem1G?=
 =?utf-8?B?d2VDcmU2K0phSjQ0WG9IUEhZSDJRWWFnTlJTK2d0alpYcGx3c2V0Ly9XQUpG?=
 =?utf-8?B?MThpTXNBZnN2ZHlPeUdGaUlHZ2VwWkxDQ2x5VG81dTBUc0J3WlNhK1RqMGZ5?=
 =?utf-8?B?ek1aS3VZWlBmWVRkYXRlNk5PODlRNWt3dGk0WklGTnVVdW8wL0RxQ2VhRktk?=
 =?utf-8?B?Vy8xeDlzWjN6cWdkRjhOMUQrUkQwaEx1TUZiM0hYZjZ4WVVOR1dIOGVWU2tn?=
 =?utf-8?B?a0hVT2EySTdoTHREdGVNZkFZcDA5ZjhxNUNrV203WFhnOExjZkUzNkxqMFJk?=
 =?utf-8?B?NzZBK1NsUjhFU1VyMGc4dW1RaTNtdTZhUy93dEVaZU5PcC8rQmw1MUNlZVRB?=
 =?utf-8?B?dEZCNU0rWERLeUtWdEhtbVR5YWVvU2tyeC9mU1lNZHdZQ3c0ekFpQU1nU1FH?=
 =?utf-8?B?dzFRNno5Y3VrelNkWlFGVVFsdTVOMnBkMHFzNUI3K1Y2YXN6UzlCWUV5Q0tY?=
 =?utf-8?B?VE5HUnRYMW1kUXZJSXRCeFA1a1gzc2xOdGNUTndEVXlhQitsSzBiMjFURzRW?=
 =?utf-8?B?VGVha3JQeis4elFTaW0vUTFBYm9XdHo5Wi9tQ1M2dTNMUzcvbVc1WWNSNTZW?=
 =?utf-8?B?RS9OOG9mNnluN2xpVVhRWEh3VGJ2cDJNSVlxQThhYVFQRHhOa1RuZmR5c0pj?=
 =?utf-8?B?a1FiVlYwS1RCY09UQnVFY0pOR1lvTU9NVG5zS3lYMEhXZ0FpNkEwQnFJRkpx?=
 =?utf-8?B?a3dEb3VsMnBsWFJuMVJhamRGd1I1RnNGL0drdEdBMTh5dHAwRVlYVXRnR2pz?=
 =?utf-8?B?L2F0SUlMcHlKZy9BMmNKYk5MSEFaZ1l0ZGtsWFNPVFZEK21CRkhGYUlsTWpQ?=
 =?utf-8?B?a2xjVmlUc09UYzhINERPbEE3WHlBc1Zuay9ZTW9xTjlmamcxVUxsRHdocGlh?=
 =?utf-8?B?TXhEdXNCVnN3NWczZnVwK0NjOUdYa3FxN3ZVTE50VkI0MlQvb3A5UjJBbTFL?=
 =?utf-8?B?N3lGaTVXU2JKWjBMNkpYNVZrQXNveHQ1Rkx2M2JPRkpjQzNZRmwxeHhhQ1FS?=
 =?utf-8?B?UDlRR1IyNlNZQ2lTMmEvZ2gxMWRscisvRlhCWCt0Z3J0RFNqRkU3WGxYRDRC?=
 =?utf-8?B?NHZLTG44akJERTB1UEtHTEtUUVZXbnJGVWpoNi8vbklsa1hZWmc5bWNKbE9u?=
 =?utf-8?B?K3BlUmJHK1RwYWFnWGE5TWFhZ3lEQ0dtc1lDa1NJQzVRYWxzZVgxenM4dU1l?=
 =?utf-8?B?L0FjU3puVE1IWGxWT25nMEtQb2dqdFg5dkY4MjVIV1ZJR0xieUh5Z1ZrZlNs?=
 =?utf-8?B?VUQyb0VobC95M09vUE5ZLzlHZmVQVjVRUzhnTmpXNXNnT2pjcDcraHNjZVpY?=
 =?utf-8?B?VWROc0ZlVEJlSVREVEJneTNvR1pJMEFER1lWNEptZFVhS0JDeHU1RHJqRWox?=
 =?utf-8?B?TWZOSXVsS1JPVlNyQ0pJTVFXSXRYdDdyMkRuZ2g4QTlEYUxCOHc4QVh3NGdS?=
 =?utf-8?B?S3hyVUs4a0NUYWxDRDMvYW03MFFyZGtIOTgvYkl4NWthS3UwNEpUdWhwVnEr?=
 =?utf-8?B?RFdCM0NvUGE4ZGtkT1A2OGhFLzNpOWNHVVpMU1JNWE9lbEUxRkl5NmNCQ1o3?=
 =?utf-8?B?ZkJrbkVmQ25YN3BNV0wvcERWbzJ2eWFTRFFyc0lNaHg3OEk4NTdkb3BYMDBh?=
 =?utf-8?Q?YNbGWP?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(7416014)(376014)(35042699022);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 11:43:48.3469
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b69272d-a336-4cd2-9f02-08ddb7cb60a9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9038


On 30/06/25 4:57 pm, Lorenzo Stoakes wrote:
> To reiterate what I said on 1/4 - overall since this series conflicts with
> David's changes - can we hold off on any respin please until David's
> settles and lands in mm-new at least?
>
> Thanks.

I agree, David's series should get stable by the time I get ready to post
the next version, @Andrew could you remove this from mm-new please?

