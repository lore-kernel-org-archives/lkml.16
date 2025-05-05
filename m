Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2101.outbound.protection.outlook.com [40.107.247.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E0725D21A;
	Mon,  5 May 2025 16:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746460876; cv=fail; b=HNJX89nD4PaNQ7UT1jaL3mPekciLTvwV6znpyo+2WcqZYtuZt+yrvb1GGGFsKKWQ1dgygpoXB3dtjuEIJrRJOTxadQ1IEv1T0lFg2n/BVcIdEdAlC2xlmTWkoTuacDN/Geub8GLk1AqDaIBF1rad3O38sJqAZJX5ZbMYcG+si0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746460876; c=relaxed/simple;
	bh=qUuN30/ln1RlPpPfH6tTwGTDeMkyCohAf8d/4qrI7TY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bK8aVPO55pYTkz3HzAGdTjzpx0iSrBOV/A6xd81W7VXLHikDp3Ebw6IFeysV9iP6nW29RVC1H6n9Iw1PrHImdjzMNUyiEg+UOjsQJVLn1LNoNDblpPCOElJOHj82MMsV2NAUK3iC9QhJLDGT/DhQWP9OifVww/0PEasajtM7IR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=aYMhkR1K; arc=fail smtp.client-ip=40.107.247.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="aYMhkR1K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f1YhSjzwC5V9rCa637kA9PnUboXBiJ/093ZUErVmg3BDm6LxkBr59QYLxIf/zvM791SFtMcbSfVkcKPUrNunl/cuMSFh8ToTAQ6XiXT87QoyalLPl6+qtHvuLg5w24a1RZqVwPG0RzXA+yDXWcU8jBqvosOePpcZblVjHtEHwj2jd8nUmoGQ7A0b2UFEwx1dI8KJkBNIAtNY5gMecKVE3GwLWkDCBBRS+6dNzeyUBnop9XQgnTolMf21d15GZjg2D2/knekZxdYwyJ+mns1S5NUXeUWq/REbC3HcavYdw+TtVuoZNjsxXaYPVHsmzkHR5934uUj+M9UFRbyhULIkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6DLzkkxgbFThz1n9+itJZoSSjm9BbZ5p//bZHB2cTzo=;
 b=KQ7vXloY25Z/lYZAEKs7gbHeT8y8i9LXRgSKjU3m7IrmSf4kyz/Gud3vZXTvz3HHXlauSa9lxHrBX+ElDsaKwAMdtM8h9/WuxSPN4tmOyUOUstS6E+hvwUIW5Kn6iD2LHrl+n2OdDLUrTRlADVO1v48GtJFx9okOsjQHRBjeT6vhtNns9axF73nIDbHcZUoxeG/gli0OCWIOLt1xJ54yJ/wfdRYlX7XLlRyml7OFpbhDOBfXJrl5i6krESyu6nwGH7JH7l+vuNDiDXnI7lfufFSUiO9Dp1ipeU3GWxrn09R/fnkftC01jvYsbadjIje1KgL/iVEyg79ckpoDvP2YHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DLzkkxgbFThz1n9+itJZoSSjm9BbZ5p//bZHB2cTzo=;
 b=aYMhkR1KndWO7llOwCLMPoVcVxWAMFvjKfoqkdB88jfZZEy3vT1oaNqhKZEMvxc8zCU8yXfFIaqU0R3oFU/W+pfFxY5XHIXreBDrKMviyTGusoF4TEXFpBxFgvHsUdKqtcppILn9Llf5zGciWEM8V9aDC2rUGOXNEeb9PQLMqKoVjH3TkYdomkXn6ABgxvBPzAuBPCuDajOYro88x0//CvgL77EtV0y2eaAqJmDyMmvExfELdE2CY6YItH8weWnjZMf3Y7T1/tETFEDZrsSKuBeSTws2TZnRS48rqrFE6mCvMpIfpNnwP4ldtbAqA45NoNJKAxWOWoe/hFfN8LIcjw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by VI1P195MB0703.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Mon, 5 May
 2025 16:01:08 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Mon, 5 May 2025
 16:01:07 +0000
Message-ID: <646350fd-3dc5-47eb-ab1b-1a6a9acd69a8@phytec.de>
Date: Mon, 5 May 2025 18:00:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Andrew Davis <afd@ti.com>, "Mendez, Judith" <jm@ti.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Devarsh Thakkar <devarsht@ti.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-4-jm@ti.com>
 <50039c49-a6c5-4f29-a35a-53b9af117fd8@phytec.de>
 <6c5e786d-7581-492f-92fb-be92ecbecd87@ti.com>
 <31d32966-05fe-4369-afda-3278822d8cb5@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <31d32966-05fe-4369-afda-3278822d8cb5@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR04CA0227.namprd04.prod.outlook.com
 (2603:10b6:303:87::22) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|VI1P195MB0703:EE_
X-MS-Office365-Filtering-Correlation-Id: 0530c9bf-3319-42da-3670-08dd8bee0bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U2tSOStyNk9pRXJpampiaks5U0lTQTJRY2xWSkxHVnA0ZFlsckxuMUp4bFdq?=
 =?utf-8?B?bDdLUmc3dUxlRGpaR1FIQmhWY1RFcFFHSUNZeGlVQmJVamFGcHcyZk4zSGgy?=
 =?utf-8?B?ZHNhcWl2ZGdZL1F6YVVaZnVHRGs0QTRGNnpuS2U5Ly85c1ZzNTZDeGlZUCtK?=
 =?utf-8?B?eGgzSko0cys0UXFCUGJjVDk4MVFnejhJRXg4a203Wm1DVmJRZ1JCY291R1pQ?=
 =?utf-8?B?eE51R3dXa0trWXg3MDkyMEwzcWhpTVJwOTJqbjhnUUF0cGY5NmNWeER6S3c4?=
 =?utf-8?B?VFZQeWhNSUZxeGhaTjA3QVBvcDNUQnlQUGhpUEFqa3ZyR3R0bE5mRDBVN0w1?=
 =?utf-8?B?V0lSdEJrODFZWDlxLytlUWM5Q2s3NklQR3o5NWlYS05BblEwbHl1TkJTUUlr?=
 =?utf-8?B?RVZqc0pKSE12V01HZEhJMDRXempGK2Z4UkNQZ0o2aXFncm9YWVlIbUV2cGov?=
 =?utf-8?B?M29CT3pDbFhFZUpKeGEvVFFwUTFBK29NZ1pWcUhFK09Ed0xGd3VCNUQ1NTVO?=
 =?utf-8?B?TG52WWpUQlpsZHIyQ2FaQm9hS01lNmFOYnY3KzF2Q3g5Nm1GUENITTVaTTBQ?=
 =?utf-8?B?WldpUXcyVUxNZnlDY2xxS3BFOWQ2TjZoRndubnpVazlMa3RlWlBGZXRxUEFC?=
 =?utf-8?B?azIraUNjdThQV0J0Wkd1NGFyalZkQm5mUXpERG1jcXhFM05udkxlTDc4am5T?=
 =?utf-8?B?OEhVS3V5V3VnTnljcmdmanJLRUNRNkxBUW1HUWVtMk5tTHVxMjNZY0ZmemQr?=
 =?utf-8?B?RW55ZGQvTjBadFpmNjg4Y1l0dHNZSHJiVzFrenhmQUVsRFdkanYwdTBRQzVr?=
 =?utf-8?B?M3pxWjh1Zlp0UHJqVFR1Y2s1a01CMUVLU1dTdk9Ia2NxUW1heXJuV2NIL21q?=
 =?utf-8?B?T2lUYktUcTc2eW5ib0w4Ung5SmZOWnBLN0tkbm42R1BFaDlMdXlJSERXWllD?=
 =?utf-8?B?bVJwUmdhSUtRWS9DZzlmOWl6VlZaOXRZM2FIcWk5bmlNam5VQkxKKzZGM0c0?=
 =?utf-8?B?ZHZTa2UwR1JaekdESGZoTGptVGtXeWlENkVXWWJ0TlFIU3VjTzVnMXhjNEtx?=
 =?utf-8?B?Q09nOGdyOUZjSm9BUWZKNzdnOFg4U25Fa0l3SXA4eUZqclBHS24zU2tRV0dm?=
 =?utf-8?B?TzA4ZHZwalowT2JNWWN1Y2p4Ry9WZFZMbVFObHdBS0E1bHJ5YzRKWWtjTVE1?=
 =?utf-8?B?VFc1ekVQRXhXODI5UUJYdGJ2Yi9HUkhrQ1VyY1BlSml1d2hDRUpyZFNDUkRW?=
 =?utf-8?B?dHJ0TktUSFVSU3dkb2E3RE9TL2lqdWU4bThRem93Njh6SWNoUklrWldQYTBW?=
 =?utf-8?B?K2l0SVVZVDFxQ0lBdVBYZEpwM0paTE1oY3BONEZsZUU4ZWZEak1aWldaVXJQ?=
 =?utf-8?B?YXBjQVRTWUJlcml6RGdxNUpwVVFqQ0NYeTdheGFFVkd5ditpdC9BalNDd01r?=
 =?utf-8?B?dkVmOXBnanJNVUpmRTBxUzV6UnA4bkNGUG9TQVVpOWhlZEp6ODZEcDhTbEpY?=
 =?utf-8?B?SDZHQUhSQ0FxRmV6WDNOVGJEek4xL1NuM0ZvR1REb3k2ajFQcE5OWEF2VVJL?=
 =?utf-8?B?Q3ZjSTZ4QmVDa2w3VWFLdExiUEdRV2hOVWJwTjJVNTlmbnpySDczTHRPM0No?=
 =?utf-8?B?NlA1NTZrUkJZV1gycnl1Z1hPSnU2NVZFL3dSekI5Y25ycFIvSzhyQk1Ec3M2?=
 =?utf-8?B?YTZFcXZ6NGJDQ21RTGJMM0NJTVREazVYdVJ6c1c4SlBLS25rUTh1VTRlcUhk?=
 =?utf-8?B?T2FYam0rM2VnQk95dURRZ0x0REt2eTBPR0NIQXVFZFk0eEt4d2hCVFE5QTl6?=
 =?utf-8?B?ZHcxYWhXQTAwaW94RkFoYmhxdTQ5UVgrb1Z1bkhaZDN1enRRMDdhbFA5U2FQ?=
 =?utf-8?B?QWlNZFV3Wmt3ZFZPSVNKRmt0MFdEQVdwcFZaTlJZYnBLS1BENmlkd2NzQkdN?=
 =?utf-8?Q?fTlabt6K69s=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU5hWmlrdUQySTljTENzQmwxUzZ1ampxMHQ5dUFPRGtuSkh6K0dobENKNWVP?=
 =?utf-8?B?Zjd5RDJIb0ZBc1VBeEhmZXF5Sm8rYmFaWndidHBpc3BoQk9NQmJaV3NrSysv?=
 =?utf-8?B?OUhYVURTSDdCRmVxSlVmcXREblJKcWlZcDEyRVM3ZEhLampoeFZpbVV6S3hj?=
 =?utf-8?B?aTVONlFtcXdaOSs4YW41MkxSNUwrM2hKdHpRc1VEcGRITDQ0WXhNL3VXd2Ur?=
 =?utf-8?B?Znk5OUhXQ1d2ampNSmlEYnJpSWtuVmxZTlZoUGlQSksrVmozd2x0WlZndnVQ?=
 =?utf-8?B?Tjd3djRvc29pM0orU2plVlNmRndCbCthekJEbE82SzdmRUs2ejhhaW5QL3BO?=
 =?utf-8?B?T01pSVF0WjQwUFFRWXNSZ0JiQjBNWCtROWR5MTQ2bVZaZDNJdUM1ampFeFFJ?=
 =?utf-8?B?QjVxajZJSmZNQW56dDJtWWptN0lvNmZIVGdVZmZEZ21VZlhUVGdZektVdXRQ?=
 =?utf-8?B?NVEybUNFUjNkcVhVdklnZUttaXNuUy9KeVFvYTBXTjFiOVczZGdaUVdtTTBq?=
 =?utf-8?B?RDMreldvU1ZUNklseUFkYTBHWVZOZVBickxXckRqcDhJdFl6YVhIOVQvRGtB?=
 =?utf-8?B?dEE1U1g2QWsvZUpvTXRXTGlQR1RZN3lmNHBQd0c5ZTMyWUw4Q1NhZWNrOHJ4?=
 =?utf-8?B?UFo4cVlyemg2VW5WT3VHOVdhU1JxVE13Y1FWNWNqdWNEcXQrMnQxTmZGWlp1?=
 =?utf-8?B?cFh4SVhkbEd2VkpvTnlSaHNQdnRWU0w2TE4zR1N0bWZSWHZSUXNMeWQ5TUl0?=
 =?utf-8?B?ZExQcFhJVEJ3K2J1UDNJOWludDQ2MFhpcG90VGxDSDQ4alZ3TzZPT1pIRTRz?=
 =?utf-8?B?Z0t6anA3azdFTDhuOWVxVlFqSWMweHJYQlRnU0RoSDdQeENGMXdRSFVWMi9u?=
 =?utf-8?B?d2NtY1NESHNKYWhicG16NS9WVDNJNkw2aFR3M1NGVHA3UytYQ09FR0ZKWkJS?=
 =?utf-8?B?T2IzR1picU5qRFh5WHBlZFpmeHdCd0NJczR1aytxV0lLL2RJWXVkTE51RGlo?=
 =?utf-8?B?ekxHeFNvMTAvdWs0TnYxZ2JYcDRhSzBqQTFObG9NVWwxZDRFWWhSRjhJRXRJ?=
 =?utf-8?B?ZVdUVlF3WEZ4SlVaTVo4ampCdFdpWCtEZEo4VGtMd3V6SFVsVVdNQTZjaTFB?=
 =?utf-8?B?VUZDVlBza2RMemxuVE9HL3liZyt1OTVPcExCemlMMVBhcmlLV3Y0U2hwYm1s?=
 =?utf-8?B?eHJxVHpneGcrUHIwaGV5S2VyR3RvQm1xbzViVURCUU1Fc3B5OTVGZWVqQ1p4?=
 =?utf-8?B?cnRzczhzZlBiV09rcTMxR1FQVUQ4TWdRUlVHVkVzeC9mTGRDdHFPNDBtZUUx?=
 =?utf-8?B?VlBTMTAxWkIvSDlKTm5qeWExYU91clk2R2pHUThqWXhCQXdjcmFnTTRVUTFk?=
 =?utf-8?B?Q1RDejV2NFRTWUQ4TFRNMEZFelM4c1IvbWVYZGExSmRKdHhFLzlSVXd4TXdt?=
 =?utf-8?B?d1hseUVwaDR2NE4rMkJGKytZN2lGYnVzMjJqL2MyL3JYTkcyVldhZEtwTDMv?=
 =?utf-8?B?MHZhN2VJWWhQSTdkRU1mQUZLZ0tsUzRKTHBoelF3MUdSbFZ6dDNldUxwN01P?=
 =?utf-8?B?TGRpOCt1YjhFK3ZKZUtObXlhNzlaRTFMR3BUazkvcE9ZNXNua3lmcU44WllY?=
 =?utf-8?B?NWNJcStnTTlFb01BSWYxVlloVnd4KzIvYm8yMG1VMU96czk0dDQrcStaTlhr?=
 =?utf-8?B?Y0IzSUtlQUdnbEpxQWRDTFJoOXljaHM4bkMrMmJ4Z1NRN21RQlNjOE5LMzhB?=
 =?utf-8?B?cDluTWNMTnE1ajBnZmJEZXRCMjdnYlVudnU1ZzI5dDVsajlnYVBBclNMVmI1?=
 =?utf-8?B?KzhxVTJmcWFMNHVleGpjSUhjV0k1UVFQK1RpVGR5ZktmZVpOTDA3OHdpdzdv?=
 =?utf-8?B?UUpUTUh1M3VaMjgwWDlQblo1TjJMNXJuSHVCaTBRSDZ5OFovZGJ0SjU3c095?=
 =?utf-8?B?MlZaMXZBdFJLbVJoOUVsTEtGN0I4bmNOdENzdFRlZTFIZ2RLYW13Tk1zYld2?=
 =?utf-8?B?YzFIWDQra0NIbTMzV0hYQXdGQUJERWhhYUZlTHVIelBRYS8yT3dGZHVpdVl3?=
 =?utf-8?B?c2hma2hyVGkrdGhtWkNPcExxS1JGaVIzVlVqdDg0QlpMaDBHMnZlNlJ4VzBp?=
 =?utf-8?B?U2FEbXhOZk0yeFNuSys1RGNEZUxrTHhtR094SkRZMFgvQldhdGU0R3B6SGZh?=
 =?utf-8?Q?e9EtSmOaygmjaeCfUHhS9QxZVicwKlwtjvEHw2jsbqXL?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 0530c9bf-3319-42da-3670-08dd8bee0bcf
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:01:07.6949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgHsaPqGVXXwlt9VtKfA0gNfWUy7qxGMX9KlpF58kGKFWJcjSAn2qRadm8nKMhU/gFDHSrmvVOgCk/wF1Vt+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0703

Hey,

On 5/5/25 17:22, Andrew Davis wrote:
> On 5/5/25 10:05 AM, Mendez, Judith wrote:
>> Hi Daniel,
>>
>> On 5/5/2025 4:55 AM, Daniel Schultz wrote:
>>> Hi,
>>>
>>> I'm unable to load the latest TI firmware 
>>> (98efd20ec71f8c1c8f909d34ab656731) with this patch.
>>>
>>> [    7.012889] remoteproc remoteproc1: 79000000.r5f is available
>>> [    7.032640] remoteproc remoteproc1: powering up 79000000.r5f
>>> [    7.038626] remoteproc remoteproc1: Booting fw image am62a-mcu- 
>>> r5f0_0-fw, size 53140
>>> [    7.057209] remoteproc remoteproc1: bad phdr da 0x79100000 mem 
>>> 0x47ea0
>
> So this looks like the firmware has sections in the SRAM region. That 
> would be the
> issue here.
>
>>> [    7.064716] remoteproc remoteproc1: Failed to load program 
>>> segments: -22
>>>
>>> I figured out that the mcu sram node disappeared in v5. Apparently 
>>> adding it back manually doesn't solve this problem. Any idea what's 
>>> wrong?
>>
>> For am62ax, there should be several items changed with this v8
>> series in order for remoteproc to work with the TI default firmware:
What firmware did you use? I was using the latest public default 
firmware from ti-linux-firmware.
>>
>> 1. memory carveouts were reduced to 15MB [0] & edge-ai memory
>> carveouts are not included here
>
> This shouldn't be an issue, the default firmware doesn't
> use the extended carveouts.
Yes, this is just the echo firmware.
>
>> 2. mcu_sram1 node removed [2]
>>
>
> So when you say you added back the SRAM node, did you also add the
> sram = <&mcu_ram>; in the core node?

With that property added, I can load the firmware again! So, what's the 
problem with adding this sram node and did you remove it?

- Daniel

>
> Andrew
>
>> If you want to catch up on the general direction for this series,
>> please refer to [3]. atm remoteproc can fail with the default FW,
>> but we are trying to move away from that firmware and this is the
>> first step in that direction.
>>
>> [0] 
>> https://lore.kernel.org/linux-devicetree/0ab5c5ec-cde3-41f1-8adf-2419b31497c1@ti.com/
>> [1] 
>> https://lore.kernel.org/linux-devicetree/04e77daf-e775-44fa-82bf-8b6ebf73bcef@ti.com/
>> [2] 
>> https://lore.kernel.org/linux-devicetree/32358aa1-0c02-4f4d-9782-2d8376c0d9fc@ti.com/
>> [3] 
>> https://lore.kernel.org/linux-devicetree/e131298f-3713-482a-a740-ff89709270b4@ti.com/
>>
>> ~ Judith
>>
>>>
>>> On 5/3/25 00:03, Judith Mendez wrote:
>>>> From: Hari Nagalla <hnagalla@ti.com>
>>>>
>>>> AM62A SoCs have a single R5F core in the MCU voltage domain.
>>>> Add the R5FSS node with the child node for core0 in MCU voltage
>>>> domain .dtsi file.
>>>>
>>>> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>> Acked-by: Andrew Davis <afd@ti.com>
>>>> ---
>>>>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 
>>>> ++++++++++++++++++++++++
>>>>   1 file changed, 25 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/ 
>>>> boot/dts/ti/k3-am62a-mcu.dtsi
>>>> index 9ed9d703ff24..ee961ced7208 100644
>>>> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>>> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
>>>> @@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
>>>>           bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>>>>           status = "disabled";
>>>>       };
>>>> +
>>>> +    mcu_r5fss0: r5fss@79000000 {
>>>> +        compatible = "ti,am62-r5fss";
>>>> +        #address-cells = <1>;
>>>> +        #size-cells = <1>;
>>>> +        ranges = <0x79000000 0x00 0x79000000 0x8000>,
>>>> +             <0x79020000 0x00 0x79020000 0x8000>;
>>>> +        power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
>>>> +        status = "disabled";
>>>> +
>>>> +        mcu_r5fss0_core0: r5f@79000000 {
>>>> +            compatible = "ti,am62-r5f";
>>>> +            reg = <0x79000000 0x00008000>,
>>>> +                  <0x79020000 0x00008000>;
>>>> +            reg-names = "atcm", "btcm";
>>>> +            resets = <&k3_reset 9 1>;
>>>> +            firmware-name = "am62a-mcu-r5f0_0-fw";
>>>> +            ti,atcm-enable = <0>;
>>>> +            ti,btcm-enable = <1>;
>>>> +            ti,loczrama = <0>;
>>>> +            ti,sci = <&dmsc>;
>>>> +            ti,sci-dev-id = <9>;
>>>> +            ti,sci-proc-ids = <0x03 0xff>;
>>>> +        };
>>>> +    };
>>>>   };
>>
