Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1D638B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 03:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748404082; cv=fail; b=Kc5SK4SDvWep7BDnOWvSy5r1QP9ZUq/FfMTeDTI1lPizieD/LQD20AqFRcNlgIAVJHL1iYpg5QJL4Anz97sIYzku6sE0wfjfei/V1WuKrF0+nU2k6lGE0iIPC5Z/4wfjc0V7YcC0+44IJpIhhC+AugrfV+bkwxQDMq4Eb/5g3OA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748404082; c=relaxed/simple;
	bh=lGmm6Ecg3oXSOaWkcuDT0sWjqW7VH4mPINRkPP9xuxE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BAwtwF+NRUQJr8QK3IUCnXteY1g0h7xmLH4lEhscZWnLweZWllCiW8LIc29tZhTHp46nF2wb2LcIE2t84rofHsjptSUbLNh1ka2EqnkJllUQs82MSKEzifpvGbNWoYSEB4XUK1uBSLgm7jaen2zwY8OkoTTYA/oedXUOE2sDjCM=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TA2x+ZNN; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TA2x+ZNN; arc=fail smtp.client-ip=52.101.69.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TA2x+ZNN";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TA2x+ZNN"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=AwVmCvAigsTY1xD+Pk7+r0QdIZo3JUI2ZE5jZVHgW+Oq4wmPiEce1p4N+ogPfWBJ2kbs7zjVrKyH3g75GjYpaB2kcMtynoCkksxfRnwjLDo+Mu6daLB03icj26kJe4S6uPvGWNOsjPf+VPzNpnvFEcDKWtLaIwBPd0O7qm0Y4FKmWAlDzGzrr/46Lq/TtiWeO92kUDr52DqlMMNhuvhhwZt/k/Xpzs8HkxCQTbzELWas/QrLckDwnsXNqUA2dXxozsiPybrXHVSjmjTN5xRE7KUQkm7fbMitLzJv96X1rHyGNdilANMM1ssnXO9VjrKWtSg99XEupaBXvVQL8JO8Sg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64+L3ryNqHstM/plbTQY9vqAHq5G90JWTQCgTRtDtDA=;
 b=rI493SmDok/h11IHr12410fg5l1meI4S/Fe0Ke0SUQVml/5V0WS9QNq8rNKDjmSz2b+6mRM4ROeaLI1HbKbXuZ0G/Y4zWWIkgXmho5GvQIOVBQVne2NTdKzlVtVkoeedWPk6c8hG072RnkIX3udBW5C9k1rSDgfQjy4yFDJxpmGusQmDTADaxUMDwtiHkk2l9ugq4DTwRLX38AW27pXkMd7J67aUhKKVrqYJ78MF5q6lZ5zuigbj1cOGcuIsjtIrz1PgIrRa+TPd6aUvzmRfg1rZaNZey50bud5CXO3WEJfDzejD+AMPBGS/XoRtcLIfoeL/ywKpTttAj9NdNB3icQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=os.amperecomputing.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64+L3ryNqHstM/plbTQY9vqAHq5G90JWTQCgTRtDtDA=;
 b=TA2x+ZNNUX9tMLRqZ5jMvq90IxwOGr0ZA1zE9GsMMTptTevLcirILO80pspp1cGfmgwHfWHFl7Ivp3hUqv8HM0PH5hSnO9Oaj0yRCwCE7Kq/Ul1R4J1dDaTbjYEM9Rxpe41rOtpvYKmb5uO0XjpjOtmrdg+raDJTblLe8ZECo/w=
Received: from CWLP265CA0521.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:18c::12)
 by AS8PR08MB8780.eurprd08.prod.outlook.com (2603:10a6:20b:5bd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Wed, 28 May
 2025 03:47:52 +0000
Received: from AM3PEPF0000A790.eurprd04.prod.outlook.com
 (2603:10a6:400:18c:cafe::3e) by CWLP265CA0521.outlook.office365.com
 (2603:10a6:400:18c::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.25 via Frontend Transport; Wed,
 28 May 2025 03:47:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A790.mail.protection.outlook.com (10.167.16.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18
 via Frontend Transport; Wed, 28 May 2025 03:47:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YYWZ7qQRw9yeJEldnPpRyx8didyBCXBVJkZoRYBJlFfh5I33bH1h5Y7TmlbHuW7xb4IHouaHMEVJDf/Qq6vqBRG9Fm/dcBkBVoBEHWRbo7pN3Ab78ih5KNhurMFhSPoqZcdmFtRt1OulCnUe40gGxd1LcqCm12iAdy3srQnfXESb51mUJ9JqaQk9br5SFAQlvwSHqkpOohUGIGnEBxEvUcDWjtyBtd05o/sRR9Jn7hnFjTksQO9elkT3OPMC5rzR537ai0aZQv/ETYb6jl4yDfOIL7KKIMTwe4fLJCJxVBZWn3Enskl9Ci9HGB1l32pZ2g3cZqNSDFInEN4RmayAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=64+L3ryNqHstM/plbTQY9vqAHq5G90JWTQCgTRtDtDA=;
 b=kAHC+FI4R3AXv8eFMVD0soTMmKvQZCF20aNeGYxM6/jPzLU2Xc0RQncN9/R6z/DxhzrV9pBQr2rZ3jWfv/5IQcMbzjJOzjkVwD354IgS7poR1q+CwFk+cXTCOtMTETYDyvXqWaAKVGglWOUDA9VOZrm0d0E40OkFVEYN/NcFpQJM+9J892sSLbhR0ojXWauXO/IiWZHkJfdMcTpZS6BzrYQYpm/YtayUD08BRwDcJiCw+C28Klxs2mU8SgXgChftxyluO0TnB7f+OUthafQJsZ3b0elcBnu89c3+ulzh4nBMNs/TEYVdbBHddXiwC9B7rrK4zBwGxHpijcjcmTfbiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=64+L3ryNqHstM/plbTQY9vqAHq5G90JWTQCgTRtDtDA=;
 b=TA2x+ZNNUX9tMLRqZ5jMvq90IxwOGr0ZA1zE9GsMMTptTevLcirILO80pspp1cGfmgwHfWHFl7Ivp3hUqv8HM0PH5hSnO9Oaj0yRCwCE7Kq/Ul1R4J1dDaTbjYEM9Rxpe41rOtpvYKmb5uO0XjpjOtmrdg+raDJTblLe8ZECo/w=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by DBAPR08MB5735.eurprd08.prod.outlook.com (2603:10a6:10:1a1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 03:47:19 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%2]) with mapi id 15.20.8769.025; Wed, 28 May 2025
 03:47:19 +0000
Message-ID: <de87961e-02f8-4425-92d0-81ad7967a274@arm.com>
Date: Wed, 28 May 2025 09:17:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 PATCH 0/6] arm64: support FEAT_BBM level 2 and large block
 mapping when rodata=full
To: Yang Shi <yang@os.amperecomputing.com>,
 Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250304222018.615808-1-yang@os.amperecomputing.com>
 <3750d3f8-17c6-4bb8-8107-215d442e4ec3@os.amperecomputing.com>
 <2fb974bb-1470-4a5f-90d5-97456140c98f@arm.com>
 <22b53cff-00db-48f1-b1e8-b11a54ebb147@os.amperecomputing.com>
 <4794885d-2e17-4bd8-bdf3-8ac37047e8ee@os.amperecomputing.com>
 <5c6d9706-7684-4288-b630-c60b3766b13f@arm.com>
 <4d02978c-03c0-48fe-84eb-0f3fa0c54fea@os.amperecomputing.com>
 <912c3126-8ba7-4c3a-b168-438f92e89217@arm.com>
 <2ab5f65c-b9dc-471c-9b61-70d765af285e@os.amperecomputing.com>
 <239d4e93-7ab6-4fc9-b907-7ca9d71f81fd@arm.com>
 <1141d96c-f785-48ee-a0f6-9ec658cc11c2@os.amperecomputing.com>
 <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <9cdb027c-27db-4195-825d-1d63bec1b69b@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0154.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::24) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|DBAPR08MB5735:EE_|AM3PEPF0000A790:EE_|AS8PR08MB8780:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a20f198-e5c9-4ecb-c2b5-08dd9d9a6b83
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YVAxRnA1TVJlV2ZXZWZ4MStsMTRxT1BJaFdjdzBQQ1BoMVhhcXZnWk42eUJh?=
 =?utf-8?B?YktvcThXRW1kcG55TnRRMjZLOUxqWDlRSDA3eldVNlNaMUJLNnZlTEZSeW16?=
 =?utf-8?B?NW9pUTRacEx1djJ5Y3pDMWFLdjVncnpRT0tMcmNOd2doOVp0WXUzNnptT1VO?=
 =?utf-8?B?RFFqbyt0YjlOYXFmRWZNeTJoeGMrNHI0TzBzU3QyUzgyNGwyWXd1dzkweGNt?=
 =?utf-8?B?SGlhQWpTWlczYW5Vd2FoeWtIVDNVN2JSL0xKblovaVlhczFGM0s5NmxIZzQw?=
 =?utf-8?B?cTgvT0lORjREdm50aGZKekloT2NwV1NPdWFTc3cyZ20yRDl0T1dBTmtUenpH?=
 =?utf-8?B?dmgzSDJxWnkyTmpvYTEyZ0p2ZWprYnp4MngxQ1lGT3lPY1RVTGtrQmxYRGxp?=
 =?utf-8?B?WGtMTlAwTzN5eUNnVzhBNyt1WHhxWjZsKzVnS2tZVk1ENElXL05tcGFuTGU3?=
 =?utf-8?B?RzhQUDVWVG5NckpWdTRpeWxzRUtBMnYxUTdlRHlQYWoxSjNXSlh0cU1vT01a?=
 =?utf-8?B?ZDRnZDAzeXpOalJVbkgrNWVWU3ZTbXJIZ1AxY3loSERONDFzd3pCM3NDTnh5?=
 =?utf-8?B?c2pseUhYMTBGUzQxRjRRd2c2anlVbmNuUzBvdklhdmVIeWNwQkRkUVVYZlBX?=
 =?utf-8?B?d0VnTkd4aHFway9tZktveEFUTmtuNFczTUUwRk1Sc2RyZjQ4cmpMNzZ0K3Q5?=
 =?utf-8?B?SG1sbEs0akoyMWR0S0RYKzl3NG5tUHFlRTNFQWQ1ZUZWbWozSjROZ3UrQU9E?=
 =?utf-8?B?bzVRTjF3alNUUzFGMmpxWkpRMFROeUF1SUl4TTNrdlNhTG81MlBFcWozc2xm?=
 =?utf-8?B?ckY0Rng0VTcrTS9kWUJwWUtSdnpHZWVKNXVhZEdQa3ZuSmNyNE91a2hLZFRY?=
 =?utf-8?B?YkszMHhlUHNZZGRHK1E0WkhCUEZ1QnppTzErN2J0SFpZTEFaWE8rZEtDMDZt?=
 =?utf-8?B?aEdhcS91dkVsLzFDZnNDMzNiVW9zSzdIWDg5UmFSUVAxTlJzdDhTV1FOY29U?=
 =?utf-8?B?WDQvdHVJMlFHS0JCOGIxdDFDZUw5a0k1VXpCcE9wT2xHWUNXUmxuWU9VSE1z?=
 =?utf-8?B?VWtBRzg2S3U1MkZOVW85L20vUjhHY2psV0ZFa0ZHdzZ3L2s2M3hKOFZqYXhs?=
 =?utf-8?B?ZU9OWGYvT1EyeXR0NXU5MDFkYy9INXZPS3FnMHlqa2tyN3gxWDQySjVDUGd5?=
 =?utf-8?B?VllReVhZU05iaWJpbm0zZTFoNVpwejBUN0M3M096d1FuVkV5QVI1b3NncS9E?=
 =?utf-8?B?U1pXYjA3K0ljNEhhY1lNb2c2UENoUUFyUEJxU1hwdnhGTC9OUzNYOEQ5Z3ph?=
 =?utf-8?B?cDlodFdMNzJGR1ZhZTI5TlRCN241eE8xUGlQN1QzcDU3OFNhbUdTQnovUEZj?=
 =?utf-8?B?Zmx4dVFKcUhPOUNFa1N5TTRDTGVSV0QyMG5EM2c3UnhtamJyNVAwU3kxYXhP?=
 =?utf-8?B?UjEzTnBnMlJNRGlVb25oVk5mQ09OZnQ1TytKekVzT3Q4YTRubDl3eEpibGIx?=
 =?utf-8?B?ZEF4clgxcFcrMnQrL0drUnJJcUtYMUU0Y2Vkc280WGlncVArN3VxdEdIci9Y?=
 =?utf-8?B?d0tOcnQzR3VnNFM2ajdRWllSNkZZQk0reE1yTWEzbUJqWnVQRDJvc1RoWlN1?=
 =?utf-8?B?TjZpdFE2SHBsMGdkeFZRNXpwLytWK2h1aG9DNEhaZGh1eGJ5MjhZS0RUYzQ2?=
 =?utf-8?B?Ly9nN3EyRmo4VHdpWGgyd0VxTTdHZ0hhajBmOTgwYzFOdHp5bnovdjd4dkRq?=
 =?utf-8?B?dG15Yll3NlJMeGVhcVB5bTRpV1dPNEUxN3pvZGxmTHk2b1RXSDhjUUhUa3dy?=
 =?utf-8?B?dlR5LzVQN2JPTmYyUFlFUmQrQ2hld05jdWNSaFhkWjl0Zkc1bXlvekJpUWt3?=
 =?utf-8?Q?PgV8A0B4uhSOF?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5735
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd04c810-b7a9-4d6b-04c6-08dd9d9a5829
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|14060799003|35042699022|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkNuSFBrMTVaNlVCNSthU1JhOXhEMGF2UDBvTC9WYlM4YmYxTnR3RTlqV2ow?=
 =?utf-8?B?dTRGb011Y3o3NVhQNThEOEo5NGpSd0dsU0IyY3pLcjBETzNnNVNZU0s3RFNX?=
 =?utf-8?B?SldOSVpIUm1rbmkvU0N4MzZxU2d4ZklRTjBqT3pYdUNMZ002TndrTlJkMGR1?=
 =?utf-8?B?c2UvSlpkdjllSEdQVVp4c1RYTlFRYTNoRi9uOGphdGpHYk5PRUY1OFc5dGQx?=
 =?utf-8?B?K3V0THRSQmxGYXNYOENnV2ZtVGFKc2ZEOFh1NnBmem1PLzlFU1BSS0tqQkY5?=
 =?utf-8?B?djNYRUR4eUVpZ1djL0JXRkQ1NWFERkNudU5Wc01QZitNb3RHNUZvcmFETlJZ?=
 =?utf-8?B?eTExQ0dMUzBQVTljcWRLWldRaElaQ1lLWDBCVkQrQWNrdFh2eVduRTVBM21l?=
 =?utf-8?B?WUxtS0c3ZTdwbllRM3BUb2d1VmF0WUdDZHlWcHQzbGJzd3Z2NnJVNTZmY3J5?=
 =?utf-8?B?cW0rQnR0OVBFS2taUHA5ZzRsbkFBWnZKTS8wb21rSWwwMWtwWjBQLzFYNUlj?=
 =?utf-8?B?TWFlK1g4QWZqd21WZi9lcFN3UkhvaXA1alZROU4rUUNydHBqc3dJQm1HeDIz?=
 =?utf-8?B?MUpxdEdlQ0VhQ0xDSndUMTN4ODlmejQ3eHhkYkNtTmdFcjFnMWRDK0hLZ0NS?=
 =?utf-8?B?cWd6R1BQWllwZC96d3pUSFBWQm9zZnAvSUt6M0VUbENQZTJML3k2N3V3eFY3?=
 =?utf-8?B?T3JhdXVZbGI2dzF3QXh1aTUveVczREhyL21mVDZEK0xnU2pvaWJuUElFK2dw?=
 =?utf-8?B?MHVPem5DbUtZVmRPWFExa0VPa09uTUtXRy91NFJIcGk2MVZMQTNNbk91ZlBx?=
 =?utf-8?B?RisxUkFxbStudDltTGhLL281UFlEbHNiN3FvckpGRlFwMzBOMDA1VVlFb3Bh?=
 =?utf-8?B?V3VIRTRCUzJzSlV6dkEycTE2NlhQT3QycDl1WUg2MXNuY0lObXdBSll6aW9a?=
 =?utf-8?B?a3VuekNNci9PYlp3dFRIQ1BDVHR3VEtGYStuUXJIY09zZWYrR210S1pFK2Ir?=
 =?utf-8?B?Q3dlWWxlT3JTb01mM1VSRDdMZjk2ZVQxckcvNTVuV2V3UUVrUWd5eGRNWkZF?=
 =?utf-8?B?ZkUzWDEvSEZwbmE1aW1mZTZ3bVU0Mnhmb1U0dERFUFhWeERiUHFPNDZtdjNH?=
 =?utf-8?B?Sk5oMnJmTXZRVWtiRlF3Q3ROYkR0VUEwTkFsNVdXVWoyMHBENTF2T0w5Sisz?=
 =?utf-8?B?Zm9LRzVLeFhWVXduelJkR3cxVGdYeHNyaGpYckc3RlVJR1FKYjljREREcVU3?=
 =?utf-8?B?a1ZyVlJDWXZ1SUJodStXY2FqVkhsWmdCZkF6eE5kWUM2S3hkQlVIV1Evcnh2?=
 =?utf-8?B?T2lJODEyREEwNC90ZVI5QncvK1EwcXBYSHlMVWRudHZZQmJQSElWTFczYWw4?=
 =?utf-8?B?VUk5dFFpVXJ3Y2x3R3RnM0NmRU4yckI3V1h3TjJwK3YyTHA5dGtza2Q4ZXY2?=
 =?utf-8?B?dmJFU3d2eUVwdXh3dTNtVUNzaWF4cGFwL09IZ3RrNDZhTzQyeSt5SG54WmdS?=
 =?utf-8?B?WFlvUkIyak9sQk8rT0hiZ2hzajRoWDZYMEdOTCtGZHc2TlB3eDFKZnFiSERu?=
 =?utf-8?B?bm1lUkM4cEg5bnd4RnFrMWJJZXFoZ3ZmVExXNHExUExwQWd3U0Y1MHNMU05x?=
 =?utf-8?B?V3Q2c3ZwSk9hQnVCYXZGK1Y3U1EzMHM4bHp3dGF3bWx6dTkwWkhsVEdPczFF?=
 =?utf-8?B?UHB0KytaR2ovL2E0S0ZzM09rWmEvcmZQTmhrb2YxZit6ejJnaHZ5akhuN0p0?=
 =?utf-8?B?Q3pXRkFtb1ZPNVdyOTZUTmRKc29RNDdBR3NoWkhZa0tqeWpjTE1FMFhUQkgy?=
 =?utf-8?B?SkpnNldzQWNGU3N5N3UvYVRhWUFxck1PakV4QUgxaGFraXJiTTFiRzYveGJ6?=
 =?utf-8?B?eHhhNG55ZGZ3TVRDVCt5L0luWmp1a25DSFRFNTRDWlRYd0xNdE53NGkwYmcr?=
 =?utf-8?B?cjdEeHB6dmJUNzc5SWRBS2hYaWM0bExxZDRsSTZNOHk5YVBMbDBzVDlLRDhv?=
 =?utf-8?B?QzJ2M2t6WTFRPT0=?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(14060799003)(35042699022)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 03:47:50.9820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a20f198-e5c9-4ecb-c2b5-08dd9d9a6b83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8780


On 28/05/25 5:30 am, Yang Shi wrote:
> Hi Ryan,
>
> I got a new spin ready in my local tree on top of v6.15-rc4. I noticed 
> there were some more comments on Miko's BBML2 patch, it looks like a 
> new spin is needed. But AFAICT there should be no significant change 
> to how I advertise AmpereOne BBML2 in my patches. We will keep using 
> MIDR list to check whether BBML2 is advertised or not and the erratum 
> seems still be needed to fix up AA64MMFR2 BBML2 bits for AmpereOne IIUC.
>
> You also mentioned Dev was working on patches to have 
> __change_memory_common() apply permission change on a contiguous range 
> instead of on page basis (the status quo). But I have not seen the 
> patches on mailing list yet. However I don't think this will result in 
> any significant change to my patches either, particularly the split 
> primitive and linear map repainting.


Hi sorry for the delay, I have too much on my plate right now so will 
try to get that posting ready by end of this week.


>
> So I plan to post v4 patches to the mailing list. We can focus on 
> reviewing the split primitive and linear map repainting. Does it sound 
> good to you?
>
> Thanks,
> Yang
>
>
> On 5/7/25 2:16 PM, Yang Shi wrote:
>>
>>
>> On 5/7/25 12:58 AM, Ryan Roberts wrote:
>>> On 05/05/2025 22:39, Yang Shi wrote:
>>>>
>>>> On 5/2/25 4:51 AM, Ryan Roberts wrote:
>>>>> On 14/04/2025 22:24, Yang Shi wrote:
>>>>>> On 4/14/25 6:03 AM, Ryan Roberts wrote:
>>>>>>> On 10/04/2025 23:00, Yang Shi wrote:
>>>>>>>> Hi Ryan,
>>>>>>>>
>>>>>>>> I know you may have a lot of things to follow up after LSF/MM. 
>>>>>>>> Just gently
>>>>>>>> ping,
>>>>>>>> hopefully we can resume the review soon.
>>>>>>> Hi, I'm out on holiday at the moment, returning on the 22nd 
>>>>>>> April. But I'm very
>>>>>>> keen to move this series forward so will come back to you next 
>>>>>>> week. (although
>>>>>>> TBH, I thought I was waiting for you to respond to me... :-| )
>>>>>>>
>>>>>>> FWIW, having thought about it a bit more, I think some of the 
>>>>>>> suggestions I
>>>>>>> previously made may not have been quite right, but I'll 
>>>>>>> elaborate next week.
>>>>>>> I'm
>>>>>>> keen to build a pgtable splitting primitive here that we can 
>>>>>>> reuse with vmalloc
>>>>>>> as well to enable huge mappings by default with vmalloc too.
>>>>>> Sounds good. I think the patches can support splitting vmalloc 
>>>>>> page table too.
>>>>>> Anyway we can discuss more after you are back. Enjoy your holiday.
>>>>> Hi Yang,
>>>>>
>>>>> Sorry I've taken so long to get back to you. Here's what I'm 
>>>>> currently thinking:
>>>>> I'd eventually like to get to the point where the linear map and 
>>>>> most vmalloc
>>>>> memory is mapped using the largest possible mapping granularity 
>>>>> (i.e. block
>>>>> mappings at PUD/PMD, and contiguous mappings at PMD/PTE level).
>>>>>
>>>>> vmalloc has history with trying to do huge mappings by default; it 
>>>>> ended up
>>>>> having to be turned into an opt-in feature (instead of the 
>>>>> original opt-out
>>>>> approach) because there were problems with some parts of the 
>>>>> kernel expecting
>>>>> page mappings. I think we might be able to overcome those issues 
>>>>> on arm64 with
>>>>> BBML2.
>>>>>
>>>>> arm64 can already support vmalloc PUD and PMD block mappings, and 
>>>>> I have a
>>>>> series (that should make v6.16) that enables contiguous PTE 
>>>>> mappings in vmalloc
>>>>> too. But these are currently limited to when VM_ALLOW_HUGE is 
>>>>> specified. To be
>>>>> able to use that by default, we need to be able to change 
>>>>> permissions on
>>>>> sub-regions of an allocation, which is where BBML2 and your series 
>>>>> come in.
>>>>> (there may be other things we need to solve as well; TBD).
>>>>>
>>>>> I think the key thing we need is a function that can take a 
>>>>> page-aligned kernel
>>>>> VA, will walk to the leaf entry for that VA and if the VA is in 
>>>>> the middle of
>>>>> the leaf entry, it will split it so that the VA is now on a 
>>>>> boundary. This will
>>>>> work for PUD/PMD block entries and contiguous-PMD/contiguous-PTE 
>>>>> entries. The
>>>>> function can assume BBML2 is present. And it will return 0 on 
>>>>> success, -EINVAL
>>>>> if the VA is not mapped or -ENOMEM if it couldn't allocate a 
>>>>> pgtable to perform
>>>>> the split.
>>>> OK, the v3 patches already handled page table allocation failure 
>>>> with returning
>>>> -ENOMEM and BUG_ON if it is not mapped because kernel assumes 
>>>> linear mapping
>>>> should be always present. It is easy to return -EINVAL instead of 
>>>> BUG_ON.
>>>> However I'm wondering what usecases you are thinking about? 
>>>> Splitting vmalloc
>>>> area may run into unmapped VA?
>>> I don't think BUG_ON is the right behaviour; crashing the kernel 
>>> should be
>>> discouraged. I think even for vmalloc under correct conditions we 
>>> shouldn't see
>>> any unmapped VA. But vmalloc does handle it gracefully today; see 
>>> (e.g.)
>>> vunmap_pmd_range() which skips the pmd if its none.
>>>
>>>>> Then we can use that primitive on the start and end address of any 
>>>>> range for
>>>>> which we need exact mapping boundaries (e.g. when changing 
>>>>> permissions on part
>>>>> of linear map or vmalloc allocation, when freeing part of a 
>>>>> vmalloc allocation,
>>>>> etc). This way we only split enough to ensure the boundaries are 
>>>>> precise, and
>>>>> keep larger mappings inside the range.
>>>> Yeah, makes sense to me.
>>>>
>>>>> Next we need to reimplement __change_memory_common() to not use
>>>>> apply_to_page_range(), because that assumes page mappings only. 
>>>>> Dev Jain has
>>>>> been working on a series that converts this to use 
>>>>> walk_page_range_novma() so
>>>>> that we can change permissions on the block/contig entries too. 
>>>>> That's not
>>>>> posted publicly yet, but it's not huge so I'll ask if he is 
>>>>> comfortable with
>>>>> posting an RFC early next week.
>>>> OK, so the new __change_memory_common() will change the permission 
>>>> of page
>>>> table, right?
>>> It will change permissions of all the leaf entries in the range of 
>>> VAs it is
>>> passed. Currently it assumes that all the leaf entries are PTEs. But 
>>> we will
>>> generalize to support all the other types of leaf entries too.,
>>>
>>>> If I remember correctly, you suggested change permissions in
>>>> __create_pgd_mapping_locked() for v3. So I can disregard it?
>>> Yes I did. I think this made sense (in my head at least) because in 
>>> the context
>>> of the linear map, all the PFNs are contiguous so it kind-of makes 
>>> sense to
>>> reuse that infrastructure. But it doesn't generalize to vmalloc 
>>> because vmalloc
>>> PFNs are not contiguous. So for that reason, I think it's preferable 
>>> to have an
>>> independent capability.
>>
>> OK, sounds good to me.
>>
>>>
>>>> The current code assumes the address range passed in by 
>>>> change_memory_common()
>>>> is *NOT* physically contiguous so __change_memory_common() handles 
>>>> page table
>>>> permission on page basis. I'm supposed Dev's patches will handle 
>>>> this then my
>>>> patch can safely assume the linear mapping address range for 
>>>> splitting is
>>>> physically contiguous too otherwise I can't keep large mappings 
>>>> inside the
>>>> range. Splitting vmalloc area doesn't need to worry about this.
>>> I'm not sure I fully understand the point you're making here...
>>>
>>> Dev's series aims to use walk_page_range_novma() similar to riscv's
>>> implementation so that it can walk a VA range and update the 
>>> permissions on each
>>> leaf entry it visits, regadless of which level the leaf entry is at. 
>>> This
>>> doesn't make any assumption of the physical contiguity of 
>>> neighbouring leaf
>>> entries in the page table.
>>>
>>> So if we are changing permissions on the linear map, we have a range 
>>> of VAs to
>>> walk and convert all the leaf entries, regardless of their size. The 
>>> same goes
>>> for vmalloc... But for vmalloc, we will also want to change the 
>>> underlying
>>> permissions in the linear map, so we will have to figure out the 
>>> contiguous
>>> pieces of the linear map and call __change_memory_common() for each; 
>>> there is
>>> definitely some detail to work out there!
>>
>> Yes, this is my point. When changing underlying linear map permission 
>> for vmalloc, the linear map address may be not contiguous. This is 
>> why change_memory_common() calls __change_memory_common() on page basis.
>>
>> But how Dev's patch work should have no impact on how I implement the 
>> split primitive by thinking it further. It should be the caller's 
>> responsibility to make sure __create_pgd_mapping_locked() is called 
>> for contiguous linear map address range.
>>
>>>
>>>>> You'll still need to repaint the whole linear map with page 
>>>>> mappings for the
>>>>> case !BBML2 case, but I'm hoping __create_pgd_mapping_locked() 
>>>>> (potentially with
>>>>> minor modifications?) can do that repainting on the live mappings; 
>>>>> similar to
>>>>> how you are doing it in v3.
>>>> Yes, when repainting I need to split the page table all the way 
>>>> down to PTE
>>>> level. A simple flag should be good enough to tell 
>>>> __create_pgd_mapping_locked()
>>>> do the right thing off the top of my head.
>>> Perhaps it may be sufficient to reuse the NO_BLOCK_MAPPINGS and 
>>> NO_CONT_MAPPINGS
>>> flags? For example, if you are find a leaf mapping and 
>>> NO_BLOCK_MAPPINGS is set,
>>> then you need to split it?
>>
>> Yeah, sounds feasible. Anyway I will figure it out.
>>
>>>
>>>>> Miko's BBML2 series should hopefully get imminently queued for v6.16.
>>>> Great! Anyway my series is based on his advertising BBML2 patch.
>>>>
>>>>> So in summary, what I'm asking for your large block mapping the 
>>>>> linear map
>>>>> series is:
>>>>>     - Paint linear map using blocks/contig if boot CPU supports BBML2
>>>>>     - Repaint linear map using page mappings if secondary CPUs 
>>>>> don't support BBML2
>>>> OK, I just need to add some simple tweak to split down to PTE level 
>>>> to v3.
>>>>
>>>>>     - Integrate Dev's __change_memory_common() series
>>>> OK, I think I have to do my patches on top of it. Because Dev's 
>>>> patch need
>>>> guarantee the linear mapping address range is physically contiguous.
>>>>
>>>>>     - Create primitive to ensure mapping entry boundary at a given 
>>>>> page-aligned VA
>>>>>     - Use primitive when changing permissions on linear map region
>>>> Sure.
>>>>
>>>>> This will be mergable on its own, but will also provide a great 
>>>>> starting base
>>>>> for adding huge-vmalloc-by-default.
>>>>>
>>>>> What do you think?
>>>> Definitely makes sense to me.
>>>>
>>>> If I remember correctly, we still have some unsolved 
>>>> comments/questions for v3
>>>> in my replies on March 17, particularly:
>>>> https://lore.kernel.org/linux-arm-kernel/2b715836-b566-4a9e-
>>>> b344-9401fa4c0feb@os.amperecomputing.com/
>>> Ahh sorry about that. I'll take a look now...
>>
>> No problem.
>>
>> Thanks,
>> Yang
>>
>>>
>>> Thanks,
>>> Ryan
>>>
>>>> Thanks,
>>>> Yang
>>>>
>>>>> Thanks,
>>>>> Ryan
>>>>>
>>>>>
>>>>>> Thanks,
>>>>>> Yang
>>>>>>
>>>>>>> Thanks,
>>>>>>> Ryan
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Yang
>>>>>>>>
>>>>>>>>
>>>>>>>> On 3/13/25 10:40 AM, Yang Shi wrote:
>>>>>>>>> On 3/13/25 10:36 AM, Ryan Roberts wrote:
>>>>>>>>>> On 13/03/2025 17:28, Yang Shi wrote:
>>>>>>>>>>> Hi Ryan,
>>>>>>>>>>>
>>>>>>>>>>> I saw Miko posted a new spin of his patches. There are some 
>>>>>>>>>>> slight changes
>>>>>>>>>>> that
>>>>>>>>>>> have impact to my patches (basically check the new boot 
>>>>>>>>>>> parameter). Do you
>>>>>>>>>>> prefer I rebase my patches on top of his new spin right now 
>>>>>>>>>>> then restart
>>>>>>>>>>> review
>>>>>>>>>>> from the new spin or review the current patches then solve 
>>>>>>>>>>> the new review
>>>>>>>>>>> comments and rebase to Miko's new spin together?
>>>>>>>>>> Hi Yang,
>>>>>>>>>>
>>>>>>>>>> Sorry I haven't got to reviewing this version yet, it's in my 
>>>>>>>>>> queue!
>>>>>>>>>>
>>>>>>>>>> I'm happy to review against v3 as it is. I'm familiar with 
>>>>>>>>>> Miko's series
>>>>>>>>>> and am
>>>>>>>>>> not too bothered about the integration with that; I think 
>>>>>>>>>> it's pretty
>>>>>>>>>> straight
>>>>>>>>>> forward. I'm more interested in how you are handling the 
>>>>>>>>>> splitting, which I
>>>>>>>>>> think is the bulk of the effort.
>>>>>>>>> Yeah, sure, thank you.
>>>>>>>>>
>>>>>>>>>> I'm hoping to get to this next week before heading out to 
>>>>>>>>>> LSF/MM the
>>>>>>>>>> following
>>>>>>>>>> week (might I see you there?)
>>>>>>>>> Unfortunately I can't make it this year. Have a fun!
>>>>>>>>>
>>>>>>>>> Thanks,
>>>>>>>>> Yang
>>>>>>>>>
>>>>>>>>>> Thanks,
>>>>>>>>>> Ryan
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>> Thanks,
>>>>>>>>>>> Yang
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 3/4/25 2:19 PM, Yang Shi wrote:
>>>>>>>>>>>> Changelog
>>>>>>>>>>>> =========
>>>>>>>>>>>> v3:
>>>>>>>>>>>>        * Rebased to v6.14-rc4.
>>>>>>>>>>>>        * Based on Miko's BBML2 cpufeature patch 
>>>>>>>>>>>> (https://lore.kernel.org/
>>>>>>>>>>>> linux-
>>>>>>>>>>>> arm-kernel/20250228182403.6269-3-miko.lenczewski@arm.com/).
>>>>>>>>>>>>          Also included in this series in order to have the 
>>>>>>>>>>>> complete
>>>>>>>>>>>> patchset.
>>>>>>>>>>>>        * Enhanced __create_pgd_mapping() to handle split as 
>>>>>>>>>>>> well per Ryan.
>>>>>>>>>>>>        * Supported CONT mappings per Ryan.
>>>>>>>>>>>>        * Supported asymmetric system by splitting kernel 
>>>>>>>>>>>> linear mapping if
>>>>>>>>>>>> such
>>>>>>>>>>>>          system is detected per Ryan. I don't have such 
>>>>>>>>>>>> system to test,
>>>>>>>>>>>> so the
>>>>>>>>>>>>          testing is done by hacking kernel to call linear 
>>>>>>>>>>>> mapping
>>>>>>>>>>>> repainting
>>>>>>>>>>>>          unconditionally. The linear mapping doesn't have 
>>>>>>>>>>>> any block and
>>>>>>>>>>>> cont
>>>>>>>>>>>>          mappings after booting.
>>>>>>>>>>>>
>>>>>>>>>>>> RFC v2:
>>>>>>>>>>>>        * Used allowlist to advertise BBM lv2 on the CPUs 
>>>>>>>>>>>> which can
>>>>>>>>>>>> handle TLB
>>>>>>>>>>>>          conflict gracefully per Will Deacon
>>>>>>>>>>>>        * Rebased onto v6.13-rc5
>>>>>>>>>>>>        * 
>>>>>>>>>>>> https://lore.kernel.org/linux-arm-kernel/20250103011822.1257189-1- 
>>>>>>>>>>>>
>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>
>>>>>>>>>>>> RFC v1: https://lore.kernel.org/lkml/20241118181711.962576-1-
>>>>>>>>>>>> yang@os.amperecomputing.com/
>>>>>>>>>>>>
>>>>>>>>>>>> Description
>>>>>>>>>>>> ===========
>>>>>>>>>>>> When rodata=full kernel linear mapping is mapped by PTE due 
>>>>>>>>>>>> to arm's
>>>>>>>>>>>> break-before-make rule.
>>>>>>>>>>>>
>>>>>>>>>>>> A number of performance issues arise when the kernel linear 
>>>>>>>>>>>> map is using
>>>>>>>>>>>> PTE entries due to arm's break-before-make rule:
>>>>>>>>>>>>        - performance degradation
>>>>>>>>>>>>        - more TLB pressure
>>>>>>>>>>>>        - memory waste for kernel page table
>>>>>>>>>>>>
>>>>>>>>>>>> These issues can be avoided by specifying rodata=on the 
>>>>>>>>>>>> kernel command
>>>>>>>>>>>> line but this disables the alias checks on page table 
>>>>>>>>>>>> permissions and
>>>>>>>>>>>> therefore compromises security somewhat.
>>>>>>>>>>>>
>>>>>>>>>>>> With FEAT_BBM level 2 support it is no longer necessary to 
>>>>>>>>>>>> invalidate the
>>>>>>>>>>>> page table entry when changing page sizes. This allows the 
>>>>>>>>>>>> kernel to
>>>>>>>>>>>> split large mappings after boot is complete.
>>>>>>>>>>>>
>>>>>>>>>>>> This patch adds support for splitting large mappings when 
>>>>>>>>>>>> FEAT_BBM level 2
>>>>>>>>>>>> is available and rodata=full is used. This functionality 
>>>>>>>>>>>> will be used
>>>>>>>>>>>> when modifying page permissions for individual page frames.
>>>>>>>>>>>>
>>>>>>>>>>>> Without FEAT_BBM level 2 we will keep the kernel linear map 
>>>>>>>>>>>> using PTEs
>>>>>>>>>>>> only.
>>>>>>>>>>>>
>>>>>>>>>>>> If the system is asymmetric, the kernel linear mapping may 
>>>>>>>>>>>> be repainted
>>>>>>>>>>>> once
>>>>>>>>>>>> the BBML2 capability is finalized on all CPUs.  See patch 
>>>>>>>>>>>> #6 for more
>>>>>>>>>>>> details.
>>>>>>>>>>>>
>>>>>>>>>>>> We saw significant performance increases in some benchmarks 
>>>>>>>>>>>> with
>>>>>>>>>>>> rodata=full without compromising the security features of 
>>>>>>>>>>>> the kernel.
>>>>>>>>>>>>
>>>>>>>>>>>> Testing
>>>>>>>>>>>> =======
>>>>>>>>>>>> The test was done on AmpereOne machine (192 cores, 1P) with 
>>>>>>>>>>>> 256GB
>>>>>>>>>>>> memory and
>>>>>>>>>>>> 4K page size + 48 bit VA.
>>>>>>>>>>>>
>>>>>>>>>>>> Function test (4K/16K/64K page size)
>>>>>>>>>>>>        - Kernel boot.  Kernel needs change kernel linear 
>>>>>>>>>>>> mapping
>>>>>>>>>>>> permission at
>>>>>>>>>>>>          boot stage, if the patch didn't work, kernel 
>>>>>>>>>>>> typically didn't
>>>>>>>>>>>> boot.
>>>>>>>>>>>>        - Module stress from stress-ng. Kernel module load 
>>>>>>>>>>>> change permission
>>>>>>>>>>>> for
>>>>>>>>>>>>          linear mapping.
>>>>>>>>>>>>        - A test kernel module which allocates 80% of total 
>>>>>>>>>>>> memory via
>>>>>>>>>>>> vmalloc(),
>>>>>>>>>>>>          then change the vmalloc area permission to RO, 
>>>>>>>>>>>> this also change
>>>>>>>>>>>> linear
>>>>>>>>>>>>          mapping permission to RO, then change it back 
>>>>>>>>>>>> before vfree(). Then
>>>>>>>>>>>> launch
>>>>>>>>>>>>          a VM which consumes almost all physical memory.
>>>>>>>>>>>>        - VM with the patchset applied in guest kernel too.
>>>>>>>>>>>>        - Kernel build in VM with guest kernel which has 
>>>>>>>>>>>> this series
>>>>>>>>>>>> applied.
>>>>>>>>>>>>        - rodata=on. Make sure other rodata mode is not broken.
>>>>>>>>>>>>        - Boot on the machine which doesn't support BBML2.
>>>>>>>>>>>>
>>>>>>>>>>>> Performance
>>>>>>>>>>>> ===========
>>>>>>>>>>>> Memory consumption
>>>>>>>>>>>> Before:
>>>>>>>>>>>> MemTotal:       258988984 kB
>>>>>>>>>>>> MemFree:        254821700 kB
>>>>>>>>>>>>
>>>>>>>>>>>> After:
>>>>>>>>>>>> MemTotal:       259505132 kB
>>>>>>>>>>>> MemFree:        255410264 kB
>>>>>>>>>>>>
>>>>>>>>>>>> Around 500MB more memory are free to use. The larger the 
>>>>>>>>>>>> machine, the
>>>>>>>>>>>> more memory saved.
>>>>>>>>>>>>
>>>>>>>>>>>> Performance benchmarking
>>>>>>>>>>>> * Memcached
>>>>>>>>>>>> We saw performance degradation when running Memcached 
>>>>>>>>>>>> benchmark with
>>>>>>>>>>>> rodata=full vs rodata=on.  Our profiling pointed to kernel 
>>>>>>>>>>>> TLB pressure.
>>>>>>>>>>>> With this patchset we saw ops/sec is increased by around 
>>>>>>>>>>>> 3.5%, P99
>>>>>>>>>>>> latency is reduced by around 9.6%.
>>>>>>>>>>>> The gain mainly came from reduced kernel TLB misses.  The 
>>>>>>>>>>>> kernel TLB
>>>>>>>>>>>> MPKI is reduced by 28.5%.
>>>>>>>>>>>>
>>>>>>>>>>>> The benchmark data is now on par with rodata=on too.
>>>>>>>>>>>>
>>>>>>>>>>>> * Disk encryption (dm-crypt) benchmark
>>>>>>>>>>>> Ran fio benchmark with the below command on a 128G ramdisk 
>>>>>>>>>>>> (ext4) with
>>>>>>>>>>>> disk
>>>>>>>>>>>> encryption (by dm-crypt).
>>>>>>>>>>>> fio --directory=/data --random_generator=lfsr --norandommap --
>>>>>>>>>>>> randrepeat 1 \
>>>>>>>>>>>>          --status-interval=999 --rw=write --bs=4k --loops=1 --
>>>>>>>>>>>> ioengine=sync \
>>>>>>>>>>>>          --iodepth=1 --numjobs=1 --fsync_on_close=1 
>>>>>>>>>>>> --group_reporting --
>>>>>>>>>>>> thread \
>>>>>>>>>>>>          --name=iops-test-job --eta-newline=1 --size 100G
>>>>>>>>>>>>
>>>>>>>>>>>> The IOPS is increased by 90% - 150% (the variance is high, 
>>>>>>>>>>>> but the worst
>>>>>>>>>>>> number of good case is around 90% more than the best number 
>>>>>>>>>>>> of bad case).
>>>>>>>>>>>> The bandwidth is increased and the avg clat is reduced 
>>>>>>>>>>>> proportionally.
>>>>>>>>>>>>
>>>>>>>>>>>> * Sequential file read
>>>>>>>>>>>> Read 100G file sequentially on XFS (xfs_io read with page 
>>>>>>>>>>>> cache
>>>>>>>>>>>> populated).
>>>>>>>>>>>> The bandwidth is increased by 150%.
>>>>>>>>>>>>
>>>>>>>>>>>>
>>>>>>>>>>>> Mikołaj Lenczewski (1):
>>>>>>>>>>>>            arm64: Add BBM Level 2 cpu feature
>>>>>>>>>>>>
>>>>>>>>>>>> Yang Shi (5):
>>>>>>>>>>>>            arm64: cpufeature: add AmpereOne to BBML2 allow 
>>>>>>>>>>>> list
>>>>>>>>>>>>            arm64: mm: make __create_pgd_mapping() and 
>>>>>>>>>>>> helpers non-void
>>>>>>>>>>>>            arm64: mm: support large block mapping when 
>>>>>>>>>>>> rodata=full
>>>>>>>>>>>>            arm64: mm: support split CONT mappings
>>>>>>>>>>>>            arm64: mm: split linear mapping if BBML2 is not 
>>>>>>>>>>>> supported on
>>>>>>>>>>>> secondary
>>>>>>>>>>>> CPUs
>>>>>>>>>>>>
>>>>>>>>>>>>       arch/arm64/Kconfig                  | 11 +++++
>>>>>>>>>>>>       arch/arm64/include/asm/cpucaps.h    | 2 +
>>>>>>>>>>>>       arch/arm64/include/asm/cpufeature.h | 15 ++++++
>>>>>>>>>>>>       arch/arm64/include/asm/mmu.h        | 4 ++
>>>>>>>>>>>>       arch/arm64/include/asm/pgtable.h    | 12 ++++-
>>>>>>>>>>>>       arch/arm64/kernel/cpufeature.c      | 95 
>>>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>>> ++++++
>>>>>>>>>>>> +++++++
>>>>>>>>>>>>       arch/arm64/mm/mmu.c                 | 397 
>>>>>>>>>>>> ++++++++++++++++++++++++
>>>>>>>>>>>> ++++++
>>>>>>>>>>>> ++++
>>>>>>>>>>>> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
>>>>>>>>>>>>
>>>>>>>>>>>> +++++
>>>>>>>>>>>> ++++++++++++++++++++++-------------------
>>>>>>>>>>>>       arch/arm64/mm/pageattr.c            | 37 ++++++++++++---
>>>>>>>>>>>>       arch/arm64/tools/cpucaps            | 1 +
>>>>>>>>>>>>       9 files changed, 518 insertions(+), 56 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>>
>>
>
