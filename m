Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011004.outbound.protection.outlook.com [40.107.130.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83E64A01
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.4
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751261355; cv=fail; b=AMvkycy2BFYYRHDo5vWG78JrXnEZ5FOrzelPZh/6ZZ2hZ+e6dPKr0dqXmj1OOxk9VqmVL5r9Klls/I0byHruxrwibaKsp8Gb5+/tRx9Sfg6Nc1eO7zdVeasGxCa+oko6jPUUk37AObrtiFk9olcoCk0VNN/5rtp0UeLKGm+cfMs=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751261355; c=relaxed/simple;
	bh=pj1PyPQALrtKPlno701KR8Y5LPoLp0x+RsHAu+Mfw68=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZzcAjIUlEu2u81plZToNa5hch4SjhEcOkAX69BrcLo1XTVSBjTQT3QkPJQNRi62xvlIPbb61fYh7SjWct9+God5HNjsSkfm1smTSfzFe0zavuua7VjhoOpl1N9z3UiANLlNSDGQkZ2IMKJf4QCdC/cbyvaK52+er2p+NMdVotNs=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NYks99wk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NYks99wk; arc=fail smtp.client-ip=40.107.130.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NYks99wk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NYks99wk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=JyrrEKQZp0KlSUhuf/uJep7EVSuUdiBfUD0x7q9WelBuB1fdNNZXSHkIiKV33mWTzwtqv1aYaUQaZqULeXWkZLv/j+Pl0krQ+owAdgjS6Ka6xN7KyuRGdYlTk9RwTdCZdCISf1glaYhrzdLevQpEUo+5rmbYZkqeH4QiEDw4TdQIKMa+1ubOTMcxpFbiHn9+/G97HQgNID3PiEVgx8gsinhqd1rV+Fl++Kzk3SYLADeNq/NVmmd/ZUY/fnjfXZGtSpm0fqYkf66Uwo0LeMEsfiEl0GJxvb8vKNKIzkgXXrclcmAxZT/xtDAyw//9zmD4CCJmV8ICUMoQvKeWIIiG7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLJNyGwfFpP3H1FEOXjNemR8ho+4AYpp729u+6+UbO0=;
 b=Yht1HDZNGpAiIz1tvkG5ksH/99hlMKyBDgEP+OGxh20LmAIawCSDk8VeJlsFRCvVf4FQhjv+3N1orQ0MEeTm6pxbXQKzr/4z5reTR6N5kwS1qYjRJExeYW3sr3B1WXeeCtU6V8FQvsoYj4PoqodE7cQVoRXWRdAYQ8ED9BmEVGE9n/qNIb934nRcsuemUqdVlsLs6pdFQe48Bsfv05YcD4925lbQVIN3wti6TK0qAp1yaWlI7spy3DHnfV5JPiqcXUaLULEuSX/TjUZ95zxrq7awvWjjBMCX8uBRsmVcc0WDZL6egCAC19upfTY11pCLBfgyPiwA1mRxMSSngPUlKg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kenip.in smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLJNyGwfFpP3H1FEOXjNemR8ho+4AYpp729u+6+UbO0=;
 b=NYks99wk6F87Wfvd2ciZMs82YCkw4ihXvH7yoZbQaNtNLQgaXkrKeoNaqfb5xcIo+pWttY2cQfi3Qp/74B+IWOUie6MYUhCSXGp+7gnOk8Xxrs0VPZlFghA23ukejLbxASxsVl0Jwpi8xkz5tDCXxTxMuPgLuxdxblEx/gDXr+0=
Received: from AS4P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::15)
 by DB5PR08MB10138.eurprd08.prod.outlook.com (2603:10a6:10:4a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Mon, 30 Jun
 2025 05:29:05 +0000
Received: from AM3PEPF0000A796.eurprd04.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::c8) by AS4P190CA0024.outlook.office365.com
 (2603:10a6:20b:5d0::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.31 via Frontend Transport; Mon,
 30 Jun 2025 05:29:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM3PEPF0000A796.mail.protection.outlook.com (10.167.16.101) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.15
 via Frontend Transport; Mon, 30 Jun 2025 05:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HpIwh1miDAecBGZABvgc5KuLxNF+Iiez5fl5GxdzWbarYpnH0obXePfvdLbkh8uR2ah41xmlvywxpIbOSIACo/9BK9cbEfc0mRFK2Iyw6TvVlxwhE9dsXAitF4GLHNYFef/uQSLtu8ntsh7zbNu8YBWt+4I3ojTjxAUCpHtPqGMqMlptaR5lKALFkX3ASYtHb0PS9dYYqfGUlrhC/HwvHHuTHUDJPGt1MjcrZ4gvcJ+eGQZcL2jaOjs3SuCsDVhpue41r4hNc2QJve6HDtnHRm9s28b65Do3Nu6b0DIkbD9YjLJtdrZCoSMkXaCOF0+LkU+5Y5xFKeRTZqWLKX5x+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oLJNyGwfFpP3H1FEOXjNemR8ho+4AYpp729u+6+UbO0=;
 b=AImrpP6HClevsDrrDuBlb4LAvP7oRD/A1s6Taa5NTQmCBO6ePkn8pmDOgxiZ/h+se+6EdndoJteCK0ibtEAuozX9dsZA022AIBiKCbZwq9UEXxdpFA0+44VpXxHjUs+bRMp43ohpQPQnWW2xvgQ4RVdwshMJ8xeUNwxsQpzde25t3pEKN0VTvxZraQHJipsRebQQFDBpmsXQ497PqzQN0uNRQvNP3FNIgQjne4RfPz1Ppkd4KPXUqvH3/ndLtRGi7LFpmUwKw+WOO7HOlmf2qJbREhRiWMtR12QmDCfi54le1AqDxjt2kDjqnPTRI5x736/Mnt9L3C4svY8rPoqv5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLJNyGwfFpP3H1FEOXjNemR8ho+4AYpp729u+6+UbO0=;
 b=NYks99wk6F87Wfvd2ciZMs82YCkw4ihXvH7yoZbQaNtNLQgaXkrKeoNaqfb5xcIo+pWttY2cQfi3Qp/74B+IWOUie6MYUhCSXGp+7gnOk8Xxrs0VPZlFghA23ukejLbxASxsVl0Jwpi8xkz5tDCXxTxMuPgLuxdxblEx/gDXr+0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by AM8PR08MB6385.eurprd08.prod.outlook.com (2603:10a6:20b:36a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.29; Mon, 30 Jun
 2025 05:28:31 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.027; Mon, 30 Jun 2025
 05:28:31 +0000
Message-ID: <415ab4bb-3c7a-47f1-937a-5b324d761f64@arm.com>
Date: Mon, 30 Jun 2025 10:58:27 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
From: Dev Jain <dev.jain@arm.com>
To: siddhartha@kenip.in
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, mgorman@suse.de
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
 <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
 <3ee2e7fea6f263aa884e3e715632b09f@kenip.in>
 <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
Content-Language: en-US
In-Reply-To: <d8ffe547-5516-43e5-9f33-56b2698a0b4f@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0071.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::11) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|AM8PR08MB6385:EE_|AM3PEPF0000A796:EE_|DB5PR08MB10138:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b5150f1-bd9d-4556-968c-08ddb79706c7
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?UW1PbjFJQlo4MDJXUXRyeGhFMzZvS0tObGsyZWxoZU5kbmlDekxYVXF0Y0tL?=
 =?utf-8?B?MWwyYk5zaVRKYU5hdmNOWHZpeVVyRG5sVnkwcDgraFM1MDBGS093YVdRQlFo?=
 =?utf-8?B?OXYzbjNSM0p6RW9BUUYycTI5aVlGMGFHaGZUWjd6VEV5Y3JxV2xBenBWc0N0?=
 =?utf-8?B?QnYvQzZKbFB5VXI2K0xUY3M5Z0RPbHNGSGlXTzBDQXFlalpWL3RBK1oyYmJN?=
 =?utf-8?B?VkdzeFJGNXV3SUwxQm1NdmkxQ0JWZFZvN1J4d0FhQXZ5UkRBcUdPenVFeUlo?=
 =?utf-8?B?U2FDeUlGY2lUbWNhRG5MNEtSWFl0M0ZFcmp4VUtVTDcrUDBJTnNXWmxoRkcr?=
 =?utf-8?B?TWdWTXNIdms4eEduOWZ4aFFBcDMxTE1rSi9halhHQ0xad2Y4bjVSd0NJR2ZY?=
 =?utf-8?B?K0NWSkFTN2l3MXpGcTBEVWlRRXc4aWZUTlpuZGRjbFJTY2lLdjFqQ0FxZHlT?=
 =?utf-8?B?TDZVYVI5Y0pKelpYS3lpak1CN0FBNXFIR1RLNTYweFc4ZWR4M0NXYWhRMmYw?=
 =?utf-8?B?ZlJSNWsydmZpNDEzNjZkWTY2KzFXUnpkTldDbXk0cVg4WFRqd2ZZNy82YzVP?=
 =?utf-8?B?a2hZWW9ONmsraEQrN0JrVVRPbmRadmJjaitRTzQyWDVUKzJPb2RRVUZNMklp?=
 =?utf-8?B?NnRGZlpiT0N0aXhWYjNKa2NsWWEvd0dXQSs1R25MVE0wYWp0TXdBVytnUWJM?=
 =?utf-8?B?dlpGSVJGVzhvaFdrOWc2Mld0Sms4Y2Nocng5QWtzNEZEemdCa1ZNYzhwejVn?=
 =?utf-8?B?NzU1UWNsbFNXOXpqSTFmTzhYS0VMRUNsU3lzNllidisxTWZBajZ6S2hJU0lh?=
 =?utf-8?B?Zk9oczdZaHN2UGZsZ1o2b2ZGcnI0cHJpaDFWU0J0VFluUjFyVjYvYlhqTmhG?=
 =?utf-8?B?aUxTcWhrTDVldEF0Znp3eWtndC9RYlBVODc0ME0wU2daTm1XRlo2MFZ4QTFr?=
 =?utf-8?B?QzF1TDkvYzlYblBucmtFejRSTTlUc1BzRFUyWDZoR3MrS0U0bUZkT1hkMWN2?=
 =?utf-8?B?WVJLMnBITHNOQzFuaWYvRTV5eWF5QzdLYXp5bEx4TGJXYmM4RkFjMWhtV0dP?=
 =?utf-8?B?QWl3YWFqOER6dzhDRElMV0oxUUF4NEVvU2RESmowL0ttOHFsZnErS1VIa3BK?=
 =?utf-8?B?cForVHJHYmZSUUpPeVBFUnVzSFFIZTA1VDlzUERaak9ReGw3VEgwbzU0NEFk?=
 =?utf-8?B?MWRWSUJsRjJQWjFwTDJQMEJxdGRYQjNtSS8xVldKQkJqa3FyazNONU9vWU9w?=
 =?utf-8?B?QVFva1FFYlQ3QlRCTjdYTGdXWE1vd1VIdThCTHB3aXVNN0crcVJ4aFdSYzRK?=
 =?utf-8?B?ZlpEa0VVV014UjBldFdTSEFFRWRDOTIxVU0xNUNiNW1LeDlKUUZlL3hndTVm?=
 =?utf-8?B?QWw0ZTljTHRvZ2xXby9MaGI2UzRyZTUxaXBzdDJDUVFQaFRyc3d2bWtCSnY0?=
 =?utf-8?B?emdZZm9YWUtFNWRpMWJUT0hBLzdtdHFkcW1JZE5hMTNwNUlKSEhUdVFLNzVy?=
 =?utf-8?B?d0lXK1U2aks2R2xuOGRVTGF1ckhWT21QTGV3UEwxQmpuTDYybUlTeG1EemQw?=
 =?utf-8?B?VzhxSDc0UkJQdjNMWXlKWllNdnY5MGZQTkhSVlAvcEY3cE1tZnpCdXhMSnkz?=
 =?utf-8?B?dlFlcUlmdEk1TmJQMWZYYU1QdTUzWVN0V2d4amx1QSs3cW5EK3FjQVNiYXlG?=
 =?utf-8?B?cjJvZGp0ZHIrcG1JcEIweUxia3UvdDdXWmdhMTREK3gwK2JVNnpERUtBN2V2?=
 =?utf-8?B?Rkd2aW9jdkpKZy9JR3VlcFl5VStIV2hEU3dOU2p4d3N0TlpSMnBoSFRJY0VF?=
 =?utf-8?B?RnJsVkFXRTFhZGNTbUVVYzJSRnpTbkhEcVFzbFh6MC9ROENBUzB3QjJwcTg0?=
 =?utf-8?B?d1pyOHJUMnRsOWJqOUFHKzJHU0MwZFFNVytUbzZWQVkyNHVkTW1MMVh2VEll?=
 =?utf-8?Q?aEWKwlmwsks=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6385
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ffd767f0-4724-46cc-c65b-08ddb796f374
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|82310400026|1800799024|36860700013|376014|35042699022|13003099007|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0l0eVh6cE1FSVNRUmpHb2V3Vk56WFNOenVPdDFmQTRVbFlhUHVuZWFGeDcv?=
 =?utf-8?B?MlBvTTUzaGkydU9RMXJVak9Xd2w5M0RmamZTd1RBdzlnYlBNanRiYkdMck9F?=
 =?utf-8?B?elR4YldpZjZ4Q20wNzN5OEdmWjFlSHA5QzJUdkRGbU9QbUthYzRwWmh4TE5a?=
 =?utf-8?B?Q1FBZ0gyRUFNMnBFNkFZYm9GUjVFM0RmWXUxMGlKOXBVUFBueDJuclFRRVlZ?=
 =?utf-8?B?TWNyU04rd2dnNTZuRU5wMkZMU0MyYzFWcSs5MC8yTmtGNGR4MW53R3VGR3lj?=
 =?utf-8?B?RTlsWWhmNFNXOGV5clgyTGRwNFZ3bmpna1NNcHZ1eWlxTWtmSW9Ec0RJSjhY?=
 =?utf-8?B?RllFU2ZVblYwTi9UOFp1bzc4aGZnQnpnSVVlWEpiUERKN1pMQkpZTDd1YTZn?=
 =?utf-8?B?d044SjgyZTFwZW0ybm92K0I2MjRZTk8yVjY4UnhiZ2RPZDRXSHdpV0FaaVZn?=
 =?utf-8?B?czFDWjJMQ2VpUlNNRmtBcVMwdmNyVkJYY1krLzNjaWtkczFUVElldU1WeHN5?=
 =?utf-8?B?V2U5MUxwUStUZWMzSGVoUy9CaUU2Z25OQi9BeE5wVCthdElicmFxdHFKdW13?=
 =?utf-8?B?K2VsRWJXZXBkQVJuV2ZQbnl2ejYvcERSRkNmNGVucVNRUWFGS2hIT2lwaUVM?=
 =?utf-8?B?cFhFMVJVRHdOWnc2cXp2ZkNTYWVKSi91MmFMMnR6c0MvNFlaQTFaNXd5TndD?=
 =?utf-8?B?blZHTHg2MmovaDErT0t0YlBOWnlRcS9Lc0oreURucDAvSFY1MnRhbVppd2pW?=
 =?utf-8?B?ZmdrMTFyWHMvUlRSTkRmeHdlNWsrRTJ5bVY1bnphR2M3Mk1uc2RWVEN3VmE5?=
 =?utf-8?B?ZzQ0K2E4c1pTR2c2aDBOZHEzRHY2K3dPeXpnSSs0aHJ6UzlYQVE0QnYrdHA2?=
 =?utf-8?B?RU1iNkhpR1B5VXhCY1hETVMzVVdZRHFUc3h3dzJqb2ROWFlpaVVmWlFublpX?=
 =?utf-8?B?VGdXZW1JTnZmdHdvU21teHJIVWtLR3p1Umk1MHBiY0Vub01SMVZMOHZCRFNp?=
 =?utf-8?B?eGhuU1JTYlZ5QXdNZ2JwZk1ySGl4K2NsamFVdkRKelFuRjRaMmZPK3lMRUlS?=
 =?utf-8?B?MDNMelZtcGlnK2gzcTQ4V2VuQTk0YU1uMFhMdlFUcnY1OUlEZEpXdS9EM3kv?=
 =?utf-8?B?bExuaDVJQ21SaVoxYkhONDREM1dPWStmeUdKTE1zYWZQWGlBaDlZcWR2WEp4?=
 =?utf-8?B?cG03MmhYa1l2VkR4RjU4Y1crNG9mcWxEOHZxaEFPUkJENXJMTVFpWEkwTDFj?=
 =?utf-8?B?TTJKOTNFWWVxb1YranFPNVpaa1V0Q3dyazFhaGpKRGJXMzFoQ2NFQ0U0SEUz?=
 =?utf-8?B?MXo0cHRMeHJQRHZ5UjNmSHBpSlQwdUs1dmZCSVB2dUJFQXAybjBXdHViTE1V?=
 =?utf-8?B?dVI4bTRUR3VMNTdjeWYyOWlIaDlTcnFzamVwUUVJZmg5VHF0YlYwRCtabTdV?=
 =?utf-8?B?TnhsNnhYS2xZaVJFajM3Y3ZaWW92ZE0zaS90amFkVUlncXZtMVhMcWdQMjJ0?=
 =?utf-8?B?b0ViSng4OTA4UDlMMXNhS1llVlZCanBEKzFyb0JXRGIxc0tXaXZzb0RZTnlX?=
 =?utf-8?B?NXNMdGlXRHB2c04rc2lhS2xITnYzdmJDTDBjbS9ITDVYOVJvKzFvd1BuNlFU?=
 =?utf-8?B?UGRDSXRYWXMyMUdLSFl6ZlUrZWlYQ1NwMDVjczZpK2ozK3NuemxDWGdhRjN2?=
 =?utf-8?B?NE9wTHBSSWtTanZ1d1ZzK041cjRQZG5MdkVxRWhZeVc0SnpUQmhweFBuY2or?=
 =?utf-8?B?L3ZzZ3hVaC92N1IrRkpsSHlkZFFBSlMzaEJXcjY0bHpMOHIwQnBCNVBwMktY?=
 =?utf-8?B?RXRpZmxyOEFDZUFLdXpHZXJUVTd5aDBtVzgrQzJ2a0RTMXJmaGROK2I3enZW?=
 =?utf-8?B?ejFBbDhDUlRDMDJCR1RYS29XZVA5dGc1MDBLN1lIMldHM0NCL0dMRGpMN1Y5?=
 =?utf-8?B?clE2REF5OEY0OXNDSGp5Ri81OXVUa0xIaWRSblJOWGd4dWl4bk9QMXlka29j?=
 =?utf-8?B?ZjdFRmZKL1Q1dmpLOE9GQTlSTnVpcWU4WnFPS1VvUHBleU1PUnEvVE12Wmgy?=
 =?utf-8?B?dEhuYWF0VzM4UlUreStIbHBKYnFTbCtCSkljZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(82310400026)(1800799024)(36860700013)(376014)(35042699022)(13003099007)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 05:29:03.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b5150f1-bd9d-4556-968c-08ddb79706c7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF0000A796.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10138


On 30/06/25 10:55 am, Dev Jain wrote:
>
> On 30/06/25 6:13 am, siddhartha@kenip.in wrote:
>> On 2025-06-28 09:19, Dev Jain wrote:
>>> On 27/06/25 9:00 pm, Lorenzo Stoakes wrote:
>>>> +cc Vlata
>>>>
>>>> On Fri, Jun 27, 2025 at 04:09:16PM +0530, siddhartha@kenip.in wrote:
>>>>> Hi all,
>>>>>
>>>>> I wanted to share validation data from a Hugging Face-based AI 
>>>>> inferencing
>>>>> workload,
>>>>> which was significantly impacted by the THP alignment logic 
>>>>> introduced in
>>>>> commit efa7df3e3bb5.
>>>>>
>>>>> Using transformer models with dynamic input lengths on Intel Xeon 
>>>>> (Cooper
>>>>> Lake),
>>>>> we observed up to a 3200% throughput improvement after applying 
>>>>> the patch
>>>>> from Oct 2024:
>>>>>
>>>>>    mm: limit THP alignment of anonymous mappings to PMD-aligned sizes
>>>> All congratulations are owed to Vlastimil Babka for doing this, 
>>>> cc'd :)
>>>>
>>>> I gather he enjoys novelty beer mugs as tokens of thanks ;)
>>>
>>> I was wondering how the change can get us such a big optimization - the
>>> alignment causes us to gain at most 1 extra PMD-THP mapping. Is there
>>> something else I am missing?
>>>
>>> I ask because when I was reading the code I was thinking whether a 
>>> similar
>>> change can be done for mTHPs.
>>>
>>>>
>>>>> Metrics:
>>>>> - Model: BERT-base
>>>>> - Inference engine: Transformers + ONNX Runtime
>>>>> - Kernel: 6.6 vs patched 6.6.8
>>>>> - Batch size: 8-32, input length: 64-512 tokens
>>>>> - Metric: inference throughput (samples/sec)
>>>>>
>>>>> Thanks for the fix -- this change had real impact on a 
>>>>> production-relevant
>>>>> workload.
>>>>>
>>>>> Best Regards,
>>>>> Siddhartha Sharma
>>>>> ISV @ Kenip
>>>>> Solution Link: 
>>>>> https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
>>>>>
>>
>> Hi Dev Jain,
>>
>> Thank you for reviewing and for your thoughtful question.
>>
>> You're absolutely right that, in isolation, gaining one additional 
>> PMD-THP mapping wouldn't explain a 3200% speedup. But in our use case 
>> (Hugging Face inference workloads with dynamic input sizes and many 
>> allocations), the original PMD alignment logic caused a cascade of 
>> side effects:
>>
>> The performance improvement comes from how that interacts with 
>> dynamic memory allocation patterns in AI inference workloads, 
>> especially those using frameworks like Hugging Face Transformers.
>>
>> In our specific use case, the workloads were running on Intel 
>> Developer Cloud, but I no longer have access to that particular 
>> environment or the original profiling output. However, I’d like to 
>> highlight why this patch had such an outsized effect:
>>
>> 🔹 1. Fragmentation Avoidance
>> In model shard loading (e.g., large BERT or GPT2 models split into 
>> multiple memory segments), many medium-sized anonymous allocations 
>> occur in rapid succession. These workloads tend to allocate many 512 
>> KB – 1.5 MB buffers dynamically (token buffers, intermediate 
>> tensors). Aligning each one to PMD size, even when their length 
>> wasn’t PMD-aligned, led to gaps between them — defeating natural 
>> coalescing into a single THP.
>>
>> 🔹 2. TLB aliasing and cache index pressure
>>
>> These fragmented mappings caused frequent TLB misses and poor L1/L2 
>> cache reuse.
>>
>> The result was what looks like “memory thrashing,” with slow memory 
>> access dominating total inference time.
>> When every mapping is PMD-aligned (even if not PMD-sized), the gaps 
>> between them prevent Transparent Huge Pages (THPs) from activating 
>> effectively.
>>
>> This breaks THP coalescence and causes fragmented page tables and 
>> higher memory overhead per shard.
>>
>> 🔹 3. Latency & Throughput Penalty from Memory Misalignment
>> This leads to higher TLB miss rates, especially under multi-threaded 
>> load, which dramatically slows down token embedding and attention 
>> calculations.
>>
>> When loading model shards, memory initialization becomes 
>> cache-unfriendly, with poor reuse across cores.
>>
>> This affects not only inference latency but also model cold-start 
>> time — which is critical in autoscaling deployments.
>>
>> 🔹 4. Qualitative Observation
>> Without this patch: shard loading stuttered, warm-up was slow, and we 
>> saw CPU cycles dominated by page_fault and TLB miss handlers.
>>
>> With this patch: shard loading smoothed out, THPs were correctly 
>> applied (based on smaps), and throughput shot up by an order of 
>> magnitude.
>>
>> 🔹 5. Measured Impact
>> On Intel Xeon (Cooper Lake), a 6.6.0 kernel with PMD alignment on 
>> non-aligned sizes showed 11–32× worse performance.
>>
>> With the patched kernel (which skips alignment unless the length is 
>> PMD-aligned), memory layout was contiguous again and THP was 
>> consistently utilized.
>>
>> This isn’t about one extra THP — it’s about preventing widespread THP 
>> fragmentation and the resulting dramatic cache/TLB degradation. For 
>> AI workloads with high concurrency and dynamic shapes, this small 
>> patch has a massive effect on layout and locality.
>>
>> So, it's not just “1 more huge page” — it's avoiding massive 
>> fragmentation that leads to:
>>
>> 1. TLB miss storms
>>
>> 2. Poor locality
>>
>> 3. Cache index thrashing
>>
>> 4. Improvement in latency and throughput
>>
>> This applies across many adjacent, odd-length allocations typical of 
>> AI inference workloads.
>>
>> The original alignment logic created a pattern of broken contiguity — 
>> defeating THP benefits altogether.
>>
>> In AI workloads using Hugging Face Transformers, model shards and 
>> intermediate tensors are dynamically allocated during inference. 
>> These allocations often fall just below or above the 2MB threshold 
>> that THP relies on. Misalignment or forced alignment to PMD 
>> boundaries causes fragmentation and disrupts huge page coalescence, 
>> affecting performance.
>>
>> 📊 Memory Allocation Pattern Diagram
>>
>> Without Patch (PMD Alignment Forced):
>>
>> |<--2MB-->|<--Gap-->|<--2MB-->|<--Gap-->|<--2MB-->
>> | Alloc A |         | Alloc B |         | Alloc C |
>>
>> Each allocation is PMD-aligned, even if it’s not PMD-sized
>>
>> Gaps prevent THP coalescence → TLB/cache fragmentation
>>
>> With Patch (PMD Alignment Conditional):
>>
>> |<---------6MB Contiguous Region--------->|
>> |  Alloc A  | Alloc B | Alloc C | Padding |
>>
>> Contiguous anonymous memory region
>>
>> Coalesced into one or more THPs
>>
>> Improved locality and TLB efficiency
>>
>> While I regret not having the raw perf output at hand, I’d be happy 
>> to replicate a similar test locally and share reproducible results if 
>> helpful.
>>
>> Best Regards,
>>
>> Siddhartha Sharma
>
> Thanks for your detailed explanation! I misunderstood that the 
> optimization you were talking about
>
> was due to efa7df3e3bb5, instead it was due to the alignment. Your 
> explanation makes a lot of
>
> sense!
>
>
> For this workload, do you enable mTHPs on your system? My plan is to 
> make a similar patch for
>
> the mTHP case and I'd be grateful if you can get me some results : )

Oh I see that you are using the 6.6 kernel, which probably won't have 
the mTHP patches.


>
>>
>>
>
