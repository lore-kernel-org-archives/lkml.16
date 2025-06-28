Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052BA198A09
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082633; cv=fail; b=PXDSb3qrbGf7eq1tfORY3JIAI2Bjn6gJr3skUiMC8oM6Gb4lZ/shxpURLceCKh6erxhBpMaNziDM8WMKc/RQk2KgWRuCLmXSBPmRuQYUdV9zgHVr2YNbcuYktBRFNVsBtQoZSaTvcmDYpdhVFonFf2+THijgLRALGUkF0TI9QDA=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082633; c=relaxed/simple;
	bh=U+yIIuiSquOkCoxqksNnz1j5+erk0SetOAv0Ni3OEGc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Uoh9yjxI+Hxg8nbRr4p7BFJRQMc6RAjzRFigPfL+cpSQKsK49j85G6BVTm56dO/hhkTWGaUZXZUhfKr9mlTMDrnL7yzBbzGC/h3TiSO5XJ7tB2WayswPIQpF9drqS8GgoOBe2yAhC7QD2wt1h0IaYnb9aO07MwXby0/6Q0XJcn4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FXbRfJXc; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FXbRfJXc; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FXbRfJXc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FXbRfJXc"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=HCjWALVHcBHcu7By0uFknuSVkx393XH/xUUunytUOsgpFnPFPtkvK+t2yCJqpzeuFAy2/g+8vOcNnr+Y8cyPnqwM86nox3iEs9d9T4XbYcAFmh9b73ygSw4eRA/WMGKEYO3X8J0oR4AWV1CBMQlAGQOcFOXWQEoStk9/ILr2LVBq9oY7f0pNVJkgXa3LwVYoeezFFm1muGHVU8bw4l3R1Dt9jhUImi4wkXsPrGGFULmV52Vww7qjugQ5qQ9m3iSXkSCBvvBAcgFNtUlljfW6FR8Zi6B3dYeeF/oM0S55pssLuWVMxTxgkL2/Mx+ztMDhKzIBdk78enEuUFGJOaDOZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT1VAC+7zsN5lzv8R1aUfN7RR4FDqUnLhunJjwmUqNU=;
 b=a0zqIB/ucesaGvHneZiJTy+l3kbnva7a/XMxS6SDOAttl76SF3ZsQ2RnZBm12fQyeGXslScB+YJSp5NgmAFZ9QCcAcl5iUDbjDBTIImRhjpQiYIhS9hOG9HaJMpSoUWm+efJR5DoC8sRxdtoEnJAH9UwRgyPYsrgB5AX4ND3LQbm7tfRpyknubDEJv8ruzhiid0+tULi7RPNJSSxh1biL86NjVaNgQ1xKjVIUYDC9RJIPTiB8z3pK/hUCsiJWFvucVf3gBNXTl9oLljUEfNH/FUkKOjkNjJ9CVzAXEjEGBQdcOMYdEIE7XM/sSJzAMjYeV3aReUbpsLSkJuNhA5+GA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oracle.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT1VAC+7zsN5lzv8R1aUfN7RR4FDqUnLhunJjwmUqNU=;
 b=FXbRfJXcTqVULYVYu0myfaF9qzuIXz1m8R1EWfGv5Z7NDXBRVZtvhvdJSAjsHVq926B92hOJxG7mDWB+8mZLth3jSJ6Zrl6n7Qtmzwl7/jnLfhGM6RelOYolsbx8s2kkAJw9O0oZ0XvXTD7MINWOlpDvxwuzF6JbRS3rZOyMll4=
Received: from DB7PR05CA0009.eurprd05.prod.outlook.com (2603:10a6:10:36::22)
 by DU0PR08MB9371.eurprd08.prod.outlook.com (2603:10a6:10:421::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Sat, 28 Jun
 2025 03:50:26 +0000
Received: from DB5PEPF00014B9D.eurprd02.prod.outlook.com
 (2603:10a6:10:36:cafe::33) by DB7PR05CA0009.outlook.office365.com
 (2603:10a6:10:36::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.24 via Frontend Transport; Sat,
 28 Jun 2025 03:50:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B9D.mail.protection.outlook.com (10.167.8.164) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Sat, 28 Jun 2025 03:50:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2lGk2bKED91olRQvuKf6cLoRFTl+b3uV82EQMX7afUKiPgARXhAcB+Xp8LcQQauMzc9Pw0DVuJvT0jMbVPriW0OMQ4Ea8o41dxa2mGHEz8uw0SQ3q2RbhIb2b6ZolPPkJajfkE679fh9T6YzPvDVPXsT940rXTa1T0dRAh9Wgo8t8v5eiRCZhGnNpzDkr726eR3ycilFdBlyPLidvkX8oI/xH/nNedYNRWnmZ5oQwwXFZmPCnyBLktM2IpEtUV7/LLbSlgEgNZlsgIXZehXGydYc3oNdH349EFCcpcKt8zupKwfRVMZbXGfpopj+t4NVcshyieLe+RGklT6EgVN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XT1VAC+7zsN5lzv8R1aUfN7RR4FDqUnLhunJjwmUqNU=;
 b=o1PC2uHxFgKYPmn6eR9y4vZpKp5K37m0Mc/XDhgValzM0346NNUhCdLIVuLXhvYdcWSazf0QU1/I02sm59VjN0KpFUbgGwxM1sDlnqhrGxx0D1rtY4myWruyGY0fjYxjpFTL5/XemzRCm5FU4ahcY5j0YquUlEo1jruitydbyIJVEkzmrgfcOLnZdrwlozMHEVdLjZE4yimKN4vR69y+PwQ3/19oj2LqUuqv8DnihMsb5BBRdDb9AthaFE/BMHaxxHzb17CMhmy4xys17V46zua2YKCZPC01fz3Xc1MNU/PcCvLyUCCtmo/oaqwxQ0BLKKIFlHLDA8nNCVG+spZPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XT1VAC+7zsN5lzv8R1aUfN7RR4FDqUnLhunJjwmUqNU=;
 b=FXbRfJXcTqVULYVYu0myfaF9qzuIXz1m8R1EWfGv5Z7NDXBRVZtvhvdJSAjsHVq926B92hOJxG7mDWB+8mZLth3jSJ6Zrl6n7Qtmzwl7/jnLfhGM6RelOYolsbx8s2kkAJw9O0oZ0XvXTD7MINWOlpDvxwuzF6JbRS3rZOyMll4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com (2603:10a6:20b:3dc::22)
 by GV2PR08MB8679.eurprd08.prod.outlook.com (2603:10a6:150:b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Sat, 28 Jun
 2025 03:49:50 +0000
Received: from AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e]) by AM9PR08MB7120.eurprd08.prod.outlook.com
 ([fe80::2933:29aa:2693:d12e%3]) with mapi id 15.20.8880.015; Sat, 28 Jun 2025
 03:49:50 +0000
Message-ID: <19714cae-6b73-43ec-af7a-1455196561d1@arm.com>
Date: Sat, 28 Jun 2025 09:19:45 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BPATCH=5D_mm=3A_limit_THP_alignment_=E2=80=93_per?=
 =?UTF-8?Q?formance_gain_observed_in_AI_inference_workloads?=
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, siddhartha@kenip.in
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, mgorman@suse.de,
 Vlastimil Babka <vbabka@suse.cz>
References: <28338f055b3c9afa8b69ff6f05ea20ed@kenip.in>
 <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <4990838b-660d-46a2-b21c-67adcba61ff9@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::18) To AM9PR08MB7120.eurprd08.prod.outlook.com
 (2603:10a6:20b:3dc::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB7120:EE_|GV2PR08MB8679:EE_|DB5PEPF00014B9D:EE_|DU0PR08MB9371:EE_
X-MS-Office365-Filtering-Correlation-Id: 366f0529-d3fe-4c7a-b675-08ddb5f6ea8e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TWczT09JYkVtNmVWRFF1UVdpMXBFUVF3ZG1BUUhGRkIxejdMNmFZNDY4SzR6?=
 =?utf-8?B?dXh2Nlhqdy9KSGY3MkZObTlDMkFsSW0yRkhWR3ZQMzNJZHRNc2g5Mi9MbU5t?=
 =?utf-8?B?NFQ2RWN5dUozZkJra2dzRG4zSDVrMm95NTQ3YlhLek9EdmFDNk94dnp5bUk2?=
 =?utf-8?B?anB1SzQ1RUc4bjFCd2V6M25NMXZLYld2UmM2MTdXTmp6d2Zqejg4dFVuaHpv?=
 =?utf-8?B?QnRvdDVWR0YwUlZEZkVKb2NBQzNXR0FsMzVFVVFVS1RYQ1A5bGdqeGhCZHRE?=
 =?utf-8?B?cFFCdFdQZ0MrZzVPRTRQQWhEdjZocTNlVEJCZHdPWGVDSmR2eFlCWWpHY3cw?=
 =?utf-8?B?ZzNiUEVBNHc5RzNsYlNndUxHM3ZDSXlWLytURFJRTGw1SC8rKzJ1WXlqZ0Yv?=
 =?utf-8?B?dlJwMHJXd1YrcVNVbEpXQjFPeDFQMVBLOWRtVzhRckY0QWZ3bmdGeVliZTgy?=
 =?utf-8?B?OG9FQmsxV0V3emhMT214NlR6a1dJSEhaMUVhRnNSbVhBV3JTMW0rNm9mMkNu?=
 =?utf-8?B?ZGEyb1BMSUplamFLbllVQ0NYWmIvck02bFU1UEduNDE3QzdsLzhyd3ExdUZq?=
 =?utf-8?B?VVpIUm5PWXp5cW9CanRLeERXRHhHRHMwd2R2a094UlBkdkVzTXV1RmtQMnhJ?=
 =?utf-8?B?SG45Q0FZQXVQb21EQlBJS2VXdHJRNC9pcDVRcG1RQTlDcisvM2toV0NqcVVp?=
 =?utf-8?B?aTh3a2JoN1Uzbjg5Wk0yenVSMDJNdjE5K2JPSytCV2VBaVhrVzVzVXNkcTJ4?=
 =?utf-8?B?ZHlSeHAvZkVqOE45REF0QVhJWGdmLytFcUI5enVjNk5UQ005eDFiMHdzWTZU?=
 =?utf-8?B?amR0Tzloazl5bGdERnoyQ1YxajVNOTFGR2R5VHpvR1drcERlYTdneFk3UGVy?=
 =?utf-8?B?YU96eExSWG12TzVTd3dLSG5namlIR2xkbnhkM1ZML1I5ekcyV1BpMUMvQUZ6?=
 =?utf-8?B?TmRNUXlHTzQ1RGh6ZElXZG5KdnpKdE1WcXZaNGFUNVBKN29OaVFrY3lDSzRX?=
 =?utf-8?B?czN3TnU2OVRsaFAwbFNwV0RrTDh5NnRxQ244UzNLSTRJeU9ielovWEtDZXVl?=
 =?utf-8?B?bUZWYlVucm96cVdLL1poa1JjTFhPNzFnZVRxMU0wZUFNTVJQWXUwYjMrem9y?=
 =?utf-8?B?RVEwREFtc3RGVUhPMjB5OExndjdIeWxBSndVdmhJU1BJNVVOREZnT2dYZXV4?=
 =?utf-8?B?TW9POUFqOEpwU1FISXR3RmlYa3NZVW1GREhHdUZzVEhLamx1QWF6VHBOSjNy?=
 =?utf-8?B?VEJyRUpTZTUwMVBaa2ZsU2NxWTRWZWVTWmlacUR2S2s3b3dudjFLdXgySG5N?=
 =?utf-8?B?VGwwZk5lNmtxdWFFUWhDNm13ZFl2azVxYXNsSFVYcERSbTFsMXJVM0FLUExT?=
 =?utf-8?B?VzNaejhSQkZ5c2NFa1lHbmhYOS91akhuNTlQZk8vL21TTFIzNGQrbWhObC9n?=
 =?utf-8?B?d0c1RE5jS2syaFo2SXpCS3FRSnVZU2pMemVKcU5JTCtzbld2THlVTTBkUzd2?=
 =?utf-8?B?R2tyeE9MQTg2RTR3V1RwRzZtblpwdDMybXphaUtYK0xvNk5ONUs3ZVdZM2c3?=
 =?utf-8?B?VCtidDNaYnRXRkZFWjUxc2ZkMkk0SlJxQjlCeXYyY0ZXWUR4T2xSUk00clY4?=
 =?utf-8?B?NEZXdHFRNXBweERoQlpWNG1Wc1hQVVRCU3pJbCs4b3phUUVKMDFheUQvUnp1?=
 =?utf-8?B?bSszNDZ2YytEZklNdHd0a21xL2ZnWm84U2RtbHZQdmJNN0Z5USs3Rm1YeXpa?=
 =?utf-8?B?M21oMEZodXRGZzJ5TWo2eXlUd0p6Y2VQV3JSRzlrQzdlTjdtWWJjVXRNWXNF?=
 =?utf-8?B?Zys2SW84MjlaaGwzdytGUHArUWNlUW9JTXRwUGhVR0RESVR4YThBaStBZFN2?=
 =?utf-8?B?RE1LRkg4cDJPMkZmQUJYZGNIejdFbEZEVTR1bjRCUktGYUF1USs3amVqbjNG?=
 =?utf-8?Q?JCv9r5Mn6Hs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB7120.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8679
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3575c74a-fd7f-4684-f6b9-08ddb5f6d525
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|1800799024|35042699022|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFZDaSswcC9DV2xKVkd6cFZjdW1jN1Q5V0hyNmpETk1sWEgrQm4wblFGc0k4?=
 =?utf-8?B?UGg0RE8rTVZocVFraUlJdTNRdk5uZU82bVdzQTNCSm1kdzFVOU1GbEZPK2tu?=
 =?utf-8?B?anRFM3BxNFhteGM3YXdzTldTZWgrSTNucU5uY2YydVhlLzJVVFJpdWpUdFY2?=
 =?utf-8?B?cmo5OXl0OTgrVCsvNVFEbEJjdlJwSUhOMkJFVDRqQ29OMzRhMExGR0xibE9x?=
 =?utf-8?B?Nkl1cjJ0NUh1WFNGQ2wrTmZmZEdMRENEWWJ3Z1hFWGFIUVhabTllU3UydDZa?=
 =?utf-8?B?VDg4NWJTbGZHbzJWZ3ZxZFVpN3JRc1dVeE5ZMDZ3S0VEQmdFTndKNjE2eW1y?=
 =?utf-8?B?RUlrVGx3L1A2UzF2eC9UTmM1dFJBUEZtSkt1M0ZpdFFoWTVtV0hLRm1YWGJw?=
 =?utf-8?B?aFcxNHB5RXNLTXYxenpzU3Fzc0RBM3o1dkljQUxRbUdQY2gwQTNwazlxUnhp?=
 =?utf-8?B?YW1OSlY1RFNCT2NYZS9vWUhUSzlZdUZVNkpHZzZsR3psWXZ5SXhTRmRkM1lF?=
 =?utf-8?B?WGJydWxVRnVNUzZhczg2RVRRKytHQzlXZ0hrRHBLN2crQTFQb0xwRmtTcUZn?=
 =?utf-8?B?aGNNcUE1aGJVTTdzWXBCajNsSC82cTNwT0NsbHZVb2h0RjYxK3FvYlBpcUlS?=
 =?utf-8?B?RU9sS1c0UFNRMTdKNjRzQVNZeE5pRVNjNkFKUVRBVjJxQ2hTbVh5N1NEZjZY?=
 =?utf-8?B?amt2eURTZXJva2Q3NEFzSTN5ZnN5dnZ0TVN3ZnNEUnlrZkt4WTY0dmNSZEJL?=
 =?utf-8?B?UWx5Ni8rL1luRVFhZTZXYkN6T2p2c01zWXEzcWwxRXAzMkk5V3k4cENlQXBC?=
 =?utf-8?B?UlNndjNwSE9RK2NVQVA0OGRKR0NjdUloS0lYKzlaY1RqYk51amhoZ0NZYXR3?=
 =?utf-8?B?cjV1UXhwOWN3b3JFSWF6VlJZbjJ4eG8rVy9xc3U3cUMzcjhsYnM1ZHRtd1lC?=
 =?utf-8?B?UWpra3VFQkNYU0htSTdxa3ZBVStwZmxWamtmVnkxVWdBeUJiTlNEMWZoaFla?=
 =?utf-8?B?WEFxSkk4ZTNnRGhxd25idExMYmFZOGxBaFZoNC9aQmd5ZWM0dVBDRTRObEVZ?=
 =?utf-8?B?djJxbm1uZnVSNHlacDJVT0xNaHJVSkE3azFudGkvL3VvcFJPU3c1Zlo4MlJu?=
 =?utf-8?B?aExUaHFIdyt2aTFDMzBpUmlZRzAybktmN2ptcEJsd3FwWnk2TXluVmdjMld5?=
 =?utf-8?B?SUVlYXpPNHlRSnZyNytMZmRwNmhlcmRqU0ZjWmVvNFlHdkRabXNhRGd5czl2?=
 =?utf-8?B?OCtvZjU1Z0YyWk9ZUDNCeHNacFJZcm1rQndvOENUOEJBRnovUDBNbUZ1Vzhh?=
 =?utf-8?B?NXIyZVpoNDFrS1VQazRRU3RjN2tLTWNQSDk3RzdVYitpNTBwRUtnNHhpTVow?=
 =?utf-8?B?cjlyclRMMWprWGIraDNmaVozN29oMnFGUVd5MWFKRXFYcWlBS0dtK0c0YnBm?=
 =?utf-8?B?VFUxRm1yU3c4ckNYeSticmZHV3hOOS93S0kxUGdSUnNnNXArWXZhMkwrWVpW?=
 =?utf-8?B?aTVuV0NDVE8yd2x6WW51M0tFajZmUmtPNDhSemd2N0tTbmZOSHhlVjV2SUZC?=
 =?utf-8?B?SjdXN2hKRFpYYjJRRFBsZnBKd21ZYWdMSTI1VzZLbzNFUjdFdVprMDlWaTBa?=
 =?utf-8?B?TUk2MGlva3M2Vi9tbmRSd21TNzFqQjk3UXkzN1oyRURsRnc0NElzRHBKY3dZ?=
 =?utf-8?B?QXdMQzNrZlRSb0orVllFZzNkNy9CZTFjbkJkcmZpMFQ5ZjV2bVVEOVEyUU4z?=
 =?utf-8?B?SFNIQ0RyTlIyWURWOUd2SC9PTHlWTUJxS1hGandxODlmWS9SV1Zna1dicjBa?=
 =?utf-8?B?dGxjQy9YbUUwRy9BcTgvNzFGM0dldTBmVm1WRGJqeXIrbHVVcEVpSlJNb2Nm?=
 =?utf-8?B?ZUVwZjd2MzYxYjhtZkxvbHFYaElNTGpEVDNzcks2d2NIeC83bytKTlZhT0JX?=
 =?utf-8?B?MzVwK1Zvb2dSL3hDSzVWMjJKUG5tanJNRk1UM3JXSkduOUgwcUE5SzhDcm82?=
 =?utf-8?B?VXYxdG44MEpQVUMzV1NKZWlVSEZ4Yk9CemxzN3VjSThwMnBJY212NVRPMUJF?=
 =?utf-8?B?RlZuVFJQc2R5dGwvQ3U5dDRha2RUTXBCMFZxZz09?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(1800799024)(35042699022)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 03:50:25.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 366f0529-d3fe-4c7a-b675-08ddb5f6ea8e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9371


On 27/06/25 9:00 pm, Lorenzo Stoakes wrote:
> +cc Vlata
>
> On Fri, Jun 27, 2025 at 04:09:16PM +0530, siddhartha@kenip.in wrote:
>> Hi all,
>>
>> I wanted to share validation data from a Hugging Face-based AI inferencing
>> workload,
>> which was significantly impacted by the THP alignment logic introduced in
>> commit efa7df3e3bb5.
>>
>> Using transformer models with dynamic input lengths on Intel Xeon (Cooper
>> Lake),
>> we observed up to a 3200% throughput improvement after applying the patch
>> from Oct 2024:
>>
>>    mm: limit THP alignment of anonymous mappings to PMD-aligned sizes
> All congratulations are owed to Vlastimil Babka for doing this, cc'd :)
>
> I gather he enjoys novelty beer mugs as tokens of thanks ;)

I was wondering how the change can get us such a big optimization - the
alignment causes us to gain at most 1 extra PMD-THP mapping. Is there
something else I am missing?

I ask because when I was reading the code I was thinking whether a similar
change can be done for mTHPs.

>
>> Metrics:
>> - Model: BERT-base
>> - Inference engine: Transformers + ONNX Runtime
>> - Kernel: 6.6 vs patched 6.6.8
>> - Batch size: 8-32, input length: 64-512 tokens
>> - Metric: inference throughput (samples/sec)
>>
>> Thanks for the fix -- this change had real impact on a production-relevant
>> workload.
>>
>> Best Regards,
>> Siddhartha Sharma
>> ISV @ Kenip
>> Solution Link: https://www.intel.com/content/www/us/en/partner/showcase/offering/a5bHo00000045YUIAY/deadlock-clearance.html
>>
