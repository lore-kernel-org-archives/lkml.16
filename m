Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012050.outbound.protection.outlook.com [52.101.66.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82EF29AB07
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889751; cv=fail; b=Z389rR8SFhUVieoKPk5aB+4VSwsNMeq2kmsYJ0tpLhoWn/zcX8wyv3TulX5uUT4W0Ni3eIYMFiXT5/i5emUZLIpVlPqwbe2dJWz3wP9x5cz+fK/0nD3kC5syOFJl66t4ZDE1R0MPXmNws9sVcYLzSF9FQ0exlhEYIlBlUzd53+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889751; c=relaxed/simple;
	bh=ikjpDUBq8PsD7MOnCaPR6cpGI2hZ2wgk0Z+lTZ8XC5I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZDVXOsy5B1MP3La18WhtReYqHVOkGC5d2LgF0N5evZmdiKMEXgBpxOsffDECkIpL6EPvtklnJqablu01mx0fUnB2rxrpR0sYMNP5UK/TvD5N8LEgm7rTazzZpPo58V1McIeT4vteoU9p5HelqoWLmqgPQy/weqxOdiuBklXov+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B2ygUW6x; arc=fail smtp.client-ip=52.101.66.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B2ygUW6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6eWEZIShni7W3oO52qin7dm07ZNHObwzTLYBz2+UKrUcU82SKaXLuUhXPZhrJWbbHHw0x9OH/OivOH8VIbY7U7MI2Y2nEjZylXfdM4+oqkcBhExIwnCtSWkI96dTE4ziiDBoTa8gYGC7lRsjfmzrb9xqZoHx2cxv9u7XTQqp37FaCxMTpJQzMnxTpzRYJOEEcUuSU3A04hVawz/QODN6M9QUwlTH7d9baXL4tKsDfOzEr1m5s4OGM5H0fhjMuBYVpjjJXrwwpdt9ADX7whlS5Um+xWqEZBzS4cY9i3TCzI11NcQ7tPi05+bC6N106jfIIAfxlEjIPa+CvONuK8qjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8ZjbuKIXd+W+VykMtrZL3kgexrQowgcVqAxKlkahNU=;
 b=TrFsNk1hBtpBDHIR0E2DkJmk61BFCOF/1AkGLvgR+2iJ7KbCWBgGSHlDwKAX3DY/cTfirNIzkKgC3347tTFXrgycdhDtXfBKc3Cc5OeYvQoX3yustZkMEUwRhBpmJ4ZNqV4V42EE4xIwFywV5ZafYW135V5NWKEYB2u8p07MBXJtNasWF1xNEqoURSAsI7PZs9Mjgse9dVYdopbi5B6p5OAjwm5DZzK4/X3Kchs5KH9OSZCNrtlps5bp1V+px1xXg0EAY/zQtmi6Ahx81r/Yx7D7DgOmw4n9MpXdciG7c4jCwy9A0FTZZFq8DfnLzjlO9Pckrh+PmYovtuEIpqCbVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8ZjbuKIXd+W+VykMtrZL3kgexrQowgcVqAxKlkahNU=;
 b=B2ygUW6xp3EpB19cjxnSINIewz2Bw3lZFlhcJIukfYwzzNqzszCjQrnwQez3FdaUCMcuKtHXS3IpJLdRX/uYbg6FI4mdS+Sajjbu9GLZQb7NTFssHa1FDDVreiq++obYOezZN5vPEDLR2qStmfjSAHTxQt982Nxgw5sPWW+0qkzw9CroJ9MGre+gzu9fN0e8uWKcyewrjhkynprMGI+Q7p4QZnfj42oQxenJ+pp51gInttmyyIMGEchMYTQQt82U3p+30OTqLyDvxG67WiiPj6yTxFC4oaWhPRVDvz3HV8BoMiwcYs20Qw/IUW8dbGM0kZVMtJxXpbObC1FUl3qT7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by VI0PR04MB10298.eurprd04.prod.outlook.com (2603:10a6:800:21b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Mon, 7 Jul
 2025 12:02:23 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 12:02:22 +0000
Message-ID: <9a16e06c-c96f-4a86-a017-b02e8f067498@oss.nxp.com>
Date: Mon, 7 Jul 2025 15:02:20 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] clocksource/drivers/nxp-pit: Add NXP Automotive
 s32g2 / s32g3 support
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
 <20250705160129.3688026-19-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-19-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0364.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::12) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|VI0PR04MB10298:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a6d967f-ec20-4093-9b95-08ddbd4e21a9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RGVVSGpLb0lXVEVqV3ZoUkZYRnBOR0lyUmRhZXpOc2NHeTlseVRkcC91RWdE?=
 =?utf-8?B?OGowN3g5VXVxdzRhTjZuMnVseGFUS1diODhJZENOdGF3ZHFTazJ2WEIyalQv?=
 =?utf-8?B?RlpkcE4xQmhYNTk1M2w1bW00Rk5OWXkySm00YndqVkRWM1JNSGZNNW82KzVn?=
 =?utf-8?B?OUc2RVJ2Z0l1OGsyNzNkdHlFTVl2Z0duN2pFV2dNUmJUR0sremNwaTduK3JP?=
 =?utf-8?B?N2lMWU0yWlV0SHpzMVl6S01wbERSOTF6bklHL29QZ2hCZlJaeUJmclVaS3ph?=
 =?utf-8?B?VlFES2g0TmIyR2RGUk5UMWplWHdZUVRSR0RjRnhnbkoyenNQWm9ZWGFmYTlx?=
 =?utf-8?B?UG9NNGpEWkFqc3RmcERERkdVTFNueXRyeTF4L2RjRjZWMWlzeUVZTG5meXlx?=
 =?utf-8?B?QTJZSGJObU1ndUVZTHBTMVZOdVdEZUYxZy9NZ1Raa2ZwVGxMOVJpeENZVHNu?=
 =?utf-8?B?dTVSb3N0SCtQVVBBOWJHbzIxRTBmWFFBOHJHc1J6L2VSbmErb0dDNTRSMkZP?=
 =?utf-8?B?NXRrc0tab0oxUU1FYTNZRURKVGZsVXdvc25WcU5JTHBVM3Jvc3FvTXJQWEZs?=
 =?utf-8?B?VE4xd2RDTVZzOVorTzRwd0t1SDM3NWdPZmI4VDEzcnBnWWVPZkpCUWIzWUNh?=
 =?utf-8?B?WGxKNW9yWTlHR2JWTDluYldxNDJzY2FLK3VFVmhxd01MaHM1dzMxNjBhQ25K?=
 =?utf-8?B?OWNYT1h3NDZNWHE2dTBRa2NTbzRqbmxTSy9TZVBFZDF5Q3VoR1lMQlpLZ1BV?=
 =?utf-8?B?bjltbVNPSzNjazEzSW1wSTducE5neDJaeTZHZEI3bjVVK0JhSlZuNWlHeDlI?=
 =?utf-8?B?L0dmbWk4U3FIT04wdFBVWU1OZitYNUJtcUt1c2VIM0tHRGdoTkd0UjIrc2Nx?=
 =?utf-8?B?VCtNdVQwVjNSdk5iTlFyWHZTM04vczdVZFEvOXRjUnlISVpyeWFGdWdoRUU0?=
 =?utf-8?B?cEF3MWx5eWZ6cTVXallWT2x2SDIvbm96ZStTSVFSUGVrV2dvU0pYaUJyMDFU?=
 =?utf-8?B?bzNSVWtYWGR3cWMzYjZuekFmeVQ4SE00VlpSd2F4Qm5NZmxEWHd4QUVwV1h0?=
 =?utf-8?B?Qm84QkovMU5qOHhNOFQxZ3I3QVFkUDFIUXBSKzVKZy8rN3h0MWZ1TWprN2tN?=
 =?utf-8?B?TnU1WEh0QVJyb1NpNE9rVVZEQTZWQXNMbElkUEpiYzI4UEp6ZnZLdm14amFP?=
 =?utf-8?B?VWRWZVlYVnVmNzloeHF2cHE1YXhWUFkyNjlPQTFyK3hVanB2Sk5zeEIzZzdT?=
 =?utf-8?B?QnMyaWsyYXNRdytzOFZaUzZCM2l5U1oyZElxbC81bGV1Qmk0YVhQQ0RvZHdV?=
 =?utf-8?B?RnRackxGVE5IRWNaSUNnUWRWQ3k4dWFCN282a1Y4ZjFzYXRBYXE2VmpNZnNr?=
 =?utf-8?B?OTBneThHT1VUQ2lTeERaczZnTDFlbGF3MVVBS2NnVFhUR21BRFZQdkEwbFlB?=
 =?utf-8?B?elFtaXE0WDh1VlJUZFR0NW1nelBwdjFKUnVEOXhHeGtYMm5HUEhrejhsUmIy?=
 =?utf-8?B?Nyt1Q3RyV01SUXpUaEJlTDBiMFhha1lsM1dqQ0pGK3BaZHBUUFZnSlpCNmlu?=
 =?utf-8?B?a2J4dllRRWJoUlNTUGhoSFRlc0x4VTl0ZUZZWHJGTDhucXQwRVluSEdOclE5?=
 =?utf-8?B?cS9INyszUlZHb1NwSWRqQnZLVFY3R1hnUzEwNGJJRnNCOTd0UWJEdnJkdm9T?=
 =?utf-8?B?c09uK2ppbTZ3SnNEUVp1ZG8vdEllNXE3UXlRVlRVb05MOFF4NlQxblBHQWkx?=
 =?utf-8?B?Y3I5eFVhaUNjRHYyMFBmTU1GemJtKytuVEhLUWU3NXFycHptZWxMUHBnK25o?=
 =?utf-8?B?aEVHRElVKzdlekJqcW5TbTk1VU9LWTc3NjJsVTg2Vk43K2xVRE43YXppZ3BM?=
 =?utf-8?B?NitWcTBXWGJRR3YyVnJGUnRNZG9mbzNlalJHZU5XVERzeVBEUXB1NWxlRms1?=
 =?utf-8?Q?l0KcSIA2RzI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZGs5cTM5UXNrS09uNXMybVJxSzFXMWhnUTM3TWdtZDd4TnhzNWtjMURNRm1I?=
 =?utf-8?B?Q0wrd2xjQVdZV05aSUVjVTVhM0s5R01EQ3E2RnEwcWpaQzloQnQzUld1SzhD?=
 =?utf-8?B?UzJyRHBFeGJQaVluRmdncVRVblltb0NCdXp6K1JVTTVocGhHaXd2WmpERFcv?=
 =?utf-8?B?N21IdmNpeTZ5NHBUeXhJWitJRVZ4dEcyWEEvd3dISUxxYVZIcGtPeGxpMEhC?=
 =?utf-8?B?L05vZi9ZVXNsOUF3NmE2MTE5dFk3NTZaU1FvazA1R1lqYTNSWko3VzZWdGha?=
 =?utf-8?B?VnNhOXdLcXQ0WENIaDVDSllRU3FzdkFIT2lLRVc3aDQ2eFF0K3JIZ1RYbVB3?=
 =?utf-8?B?ZG9iS0VKSDRQUm5WQ2xVWHlpVFNtbk1tWDVvSThhUlNVZXFWc2dPeFRLVG83?=
 =?utf-8?B?enYybFM0VEJST1kzM1lkTmorc1RqR2lhUUR0dHJwZS93OWRHTjVRNUVKSXBS?=
 =?utf-8?B?bTBQd0hhMlBWL3VNQnFjaldkcHVmOG8yNFMzampIUjdCUUJ4dllPUU9yc2s3?=
 =?utf-8?B?Mk9IL3hadFBwMHU3Z3RFMXlNOEc0dkZSRnlOL2h3VDUwbXg5VytJUDdBTWhJ?=
 =?utf-8?B?enZkOFNsbktlTmx1ekN2UHl2bE0wUmxvYnc4OFFlY1A0eWRwaTRqZmdUdjJO?=
 =?utf-8?B?SS9nY0RXa2hUcDhjMjVlN2FNOWRDRnplaFJJayt1YTR1Y01xRGJDVnFzaWRj?=
 =?utf-8?B?L0d3WURwZ3ZYSlY4bUp6dysydnB0aE5NdEZKUU9KSjNLREdnSG05KzNiZHg3?=
 =?utf-8?B?WVVFak91MUxURG9naTBxNHA1Z3RFYlI0ZUVKZDhSZDB2TVpzUUhBeWljWnVx?=
 =?utf-8?B?eXJaVG9nUDZtVytmS2FKUFJUMCtidkJ2VGxjVEJ5QWRIbHJlaGlMSGYyczhS?=
 =?utf-8?B?MFRFcFdBOFBXSS9zUnhZYnE0eWJZNE42VG9YT24rTmh4aXJxbDVoVHdDZWta?=
 =?utf-8?B?bkhKVG9BZWs1ZC8yT1NRTzdnRE9TcVRYQnhJV1NYa3pBdXE4VGg3bkxZVUpZ?=
 =?utf-8?B?R0ptTThlYmFmSVVSamRrUlRYWDAzZ0tCYUhjaFg1WGlVaGZ0TmM1anYxZmtN?=
 =?utf-8?B?MmllODFHd0RHNitFNTBMVXFxMUIrVnhXS0FidlBqNmZwMVRoZkkyQlRXWDRM?=
 =?utf-8?B?b3VSOTRRQjVybWN5UG1hVExiaW1KT2FHWWs3MDFndHpGcFdhVTZydHZyc1Rw?=
 =?utf-8?B?Z2NOVjdzVk1sRi9MQzVNcjBUUVhidHprYno1b0VZUWhMRUtVTnhQOHFsdXVU?=
 =?utf-8?B?Sm9mUHo5NHhad1lvVGFBRlNGOHluam9xSGRWZnhTUjZlZSs5NlN1RlVDaklL?=
 =?utf-8?B?bjk3VTdxTEVIOXpLMDlYc2dVWkN5ZkhtLzdCQTVxd3VBY0thdTk0Z21uVGpT?=
 =?utf-8?B?Nk9OR3FhVUlVTVJTeWlOQ1JscVRnblNRY2svVmp2eCtkNnorZVo1UHB3UFBs?=
 =?utf-8?B?SHk5Skc0VU9WQVErWnc5MVhEOHI3VEpxeDZDV3hnMEdjYStkbFAzU251bjZI?=
 =?utf-8?B?WWVGMm1WS2pQSTFFcTNMUnFjNjlvSlJFQkU3cWI1S1YvbndxVXFCMmRKa3Bt?=
 =?utf-8?B?TVpadHZaOHJZU0doaFJqY09mdHk3QU5RUHNkMUJvY1Y3cXdscElybVQ2d3NH?=
 =?utf-8?B?WWRCcFpGOU5tMFRXdlBUQndNSE5ORDM4dk5iVEw1dHFLOE1Ha2hoZ0V1YWFl?=
 =?utf-8?B?Q3BqWElJWWFqZmVjeUN0M0xUMmhtaC8waXpRRjZxcEk0bEZqQkdGN1lrQVd3?=
 =?utf-8?B?WjBDYWJwb21KRVEwck4rQStEdDZXbDQ2SGRudmsvVkZFQjNJR1ordzBXbWFv?=
 =?utf-8?B?T1pyQmoybEpuUDBtaWZ6MzZQTzBzbEkyby9GT0lzc0dZc3ljd1NoTTRQSHRX?=
 =?utf-8?B?U2EyVldZMVRjWTE3c1lIWFdHbmV6WlphTUpIZTljWThMZ1dEcGxYeVVrTVVL?=
 =?utf-8?B?Uy9EMzVWdFlVdHo1N1IzdE54c2JtR0Zya2tLaTMwR3FTU0Eya04xdkQyMVFh?=
 =?utf-8?B?b3B4ZU8wN3g0d0NqVmZ2UEhxTWVkaUtEWnZlOUlJLzB0VXhseHFrUjgzUGxr?=
 =?utf-8?B?MW5LbVFIY05sQjlwM01DeERCbE56a2lrcURpTEZKaXhRN1hrSk9uamJvc2M0?=
 =?utf-8?B?QUZRRk9ZVFhoQmttM3B2MXY4NXdSbklkU0VwLy9JT3VpRFRsRDJ0ei82UXc5?=
 =?utf-8?Q?b3+/aW0y4yHQY3aTD1EzCkI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a6d967f-ec20-4093-9b95-08ddbd4e21a9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 12:02:22.9445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z/Llpo96ydkplxex7Cgto+rWNZpfaK/+21fLqzJkymhRINvX2sJkBli5mUuXPzhJNLms15fh5TdrtaoPBDAFuU91Ys09Jt5DeNUq7tEWYCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10298

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
> The S32G platform has two Periodic Interrupt Timer (PIT). The IP is
> exactly the same as the VF platform.
> 
> The setup found for this platform is each timer instance is bound to
> CPU0 and CPU1.
> 
> The changes bring the support for multiple timer instances. When we
> reach the maximum PIT instances for this platform, which is described
> in the match table data, the hotplug callbacks are called where they
> finish the per CPU setup.
> 
> Tested on a s32g274a-rdb2.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---

The current description does not clearly explain how the resources are used within the driver. It would be helpful to mention that channel 2 is used as the clocksource, while channel 3 is designated for clockevents.

Additionally, the S32G2 platform supports suspend and resume functionality. However, this capability is not yet implemented in the driver. Do you plan to include support for it in a future patch?

[...]

> -static int __init pit_timer_init(struct device_node *np)
> +static int pit_timer_init(struct device_node *np)
>  {
>  	struct pit_timer *pit;
>  	struct clk *pit_clk;
> @@ -261,16 +296,31 @@ static int __init pit_timer_init(struct device_node *np)
>  
>  	clk_rate = clk_get_rate(pit_clk);
>  
> -	/* enable the pit module */
> -	pit_module_enable(timer_base);
> +	pit_module_disable(timer_base);
>  
>  	ret = pit_clocksource_init(pit, name, timer_base, clk_rate);
> -	if (ret)
> +	if (ret) {
> +		pr_err("Failed to initialize clocksource '%pOF'\n", np);
>  		goto out_pit_module_disable;
> +	}
>  
> -	ret = pit_clockevent_init(pit, name, timer_base, clk_rate, irq, 0);
> -	if (ret)
> +	ret = pit_clockevent_per_cpu_init(pit, name, timer_base, clk_rate, irq, pit_instances);
> +	if (ret) {
> +		pr_err("Failed to initialize clockevent '%pOF'\n", np);
>  		goto out_pit_clocksource_unregister;
> +	}

This mechanism is very restrictive and will allow to assign the PIT0 and PIT1 to CPU0 and CPU1 only. Have you considered alternatives where the mapping is given as mask through early_param?

-- 
Regards,
Ghennadi
