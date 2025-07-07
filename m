Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012022.outbound.protection.outlook.com [52.101.71.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E9228BABF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879526; cv=fail; b=RP4U0hFfl4hUzYBGhDbm+cd9CG7BLGwloiyj8E9LBU5CuKIRJlgEUV6Xo6VbCPaNnQo9yDUzglir7OpO0twdw17e0TVGGOk9kut9s7mixCLInY6zIubgmGs5MsCXECeBmtRYHlx+Sl7bdx8F72NBj0n9mPRg+Mg0SWk3VDYOO1E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879526; c=relaxed/simple;
	bh=FQQ/P5gPrOFoOS+rnZNHSS52ZZ6M9Gzfs26Zkco8Sf4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EFsEL/fe1GEG4w1+pVv3op4X5zXCcvPCZPllt0O4ueKKShebAci7Cvv86upevivkkzsEf+uuUPe2IPwfjiT8LN6G+VeGVtJzYaHaEGaRnwrzkpMNPi6SljoM5aIJ7Yj6eHEypwPbmEaGw93HubnyGYlE5EKVRMglG/7K4UmxaFA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CRK+EFRK; arc=fail smtp.client-ip=52.101.71.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CRK+EFRK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL+Mc+wn6FJ4hVZikv8UTHRph/xQAUXQxrtcav9UuOMy9RQXDfLskxnbYX6TyvrqTyttLFDtM9SgdqQa6776oW9TxDULTDN8MXYFiH4eEuspt/vj5Q6plQiBaVQQGF7wgeBGIvASx4M5SteetxEDwbG9IW1h4o2umIkq3oMDwil01HJJvShSCyNpY/Uc4mS45oU5ZYyzdCjmSjxUNPgnmynvAulQlgcVy8385WB0a3CjEfpixkU72/kMuJqhYBNMl3BGDq0uG3hHK6QSzq2mh8UeVBMyNkDzCbN44VZ57kkNnCstYbEYcZrElfcFePP6YVoxEMnqwaRy4Ta76qHDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+cqCrAyEyKnuN8AjDvh5paFvVTRhfv/6SFiz1NqAbU=;
 b=UGyuN2HbXoAphXThz8j5NPMN0WLuzMQhgth1hJccQFCOJdbl9LnIFrqFWOVRlzq2pnv7cysBPao5eqgtpNzPTDFUKrbQgQya+Uil7WHcmOVbqGr0XvVg1fpRpecsk3krA9m5xBB9P9sd2mQ3y1Px32pW++1tJGmIdi8b9DCGdI2k2ekjSxi5Ic7xbb0ctdijdYYNe4uZNt57dDlCc6SiKaJjDmeE+DNwF93MhEeE9cJN3h43Juo3TO2Fu1Vm+/faccgSDFaKqPuCECTd+4qHleaUwsF60lwY8Z/GhswmOexVwqQcxltaO/m83dQytQjfbgvShC5nRMltCUUzViQWow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+cqCrAyEyKnuN8AjDvh5paFvVTRhfv/6SFiz1NqAbU=;
 b=CRK+EFRKdZ0ioLwPlkugyS+ZvxLvzApARkfSNBEhxlQtzjLz0HyJxMEuKTLiTXv5l8ANxyv5Ql1IOkQnwG2+Aybvbr581Ym7Xock5dAT8TEk1WxUk1YLfybp/fg1HBpalnt3x9Ct5JowaC9OaKH68+AmpL3H7GfCbRkiAnuokaL8ud/67oylSmEuwVTaQ6sDCp78MEMequeyvw5bpv6UvIzYnQUS05cDmBPwYAZby3AwF4pxuY+i3yueLrhx840LPVQASCrzShzo01TJ1BZNfI/98LKV1H8+gO77B73B88fKj5NOdxrgrBZdVuQFfPwOrhXmBSp1OV5z+GqAA22B/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by PAXPR04MB9186.eurprd04.prod.outlook.com (2603:10a6:102:232::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:11:57 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%3]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:11:57 +0000
Message-ID: <3f67623f-4781-4ee7-a2f0-97082130b7f7@oss.nxp.com>
Date: Mon, 7 Jul 2025 12:11:47 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/20] clocksource/drivers/vf-pit: Replace
 raw_readl/writel to reald/writel
Content-Language: en-GB
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: S32@nxp.com, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250705160129.3688026-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0034.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::13) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|PAXPR04MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ffd2954-3a75-4a49-185c-08ddbd3652b7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVJuNVg5WDRnUHhBKzhsUWNjUmh2NlRVazhtT2dWZUZtSkFHMXFTczRmVDBH?=
 =?utf-8?B?RXVGYmtaQWlDZm1BdXV6dElYMDBja2dHTGRoZWhLOWE5UUEvc0VZbVhXbE4x?=
 =?utf-8?B?bTYrZ2VhbFVUZDB1TTlTUWc2TGd2akc0VWxmWHNueE9pbjJnNUNzeE51TzN5?=
 =?utf-8?B?ajlPS0dRSHFCVGR4d2dTckZMT3ZadHNZNXgzcGVRcy9DK2E0TldhS1lsTXF0?=
 =?utf-8?B?aVpRVGpVOTB5UytSc2xlT0FRc3JmWWpRdE1ITEg2bFZhNkgvUlpZVVIycEJ6?=
 =?utf-8?B?ZnRpR1hwT3FrZHpLcWVPU3B0Zy9MbW05M2U1bFlJZmE5MEo0eHdJRmYwVHh6?=
 =?utf-8?B?aVR6VmNZTDhLaHJia1hJcHlPOThtWUYyampHdGZ2RjI4UzZrNkdRRlN5a3h1?=
 =?utf-8?B?ODNRRTdTb2ZKZGpQUmY5aFhSSHNuS3VuUUgrZHN3bzM0b2xIS0R1eG0xOGFL?=
 =?utf-8?B?Y0VFYmdPb2R0MzJIUFhjUnBhMnJQTGN2ek54VUdLTWM4dlZCM1Fvcmhva3BV?=
 =?utf-8?B?S1ZCejB5WFRyNWFGRVdWVUlzSjZXQTFwdkF4aUFIS3RDM2YwdFBtSVAzMk96?=
 =?utf-8?B?RENiNFNvcnE5NFRCSFAzbWFwL05mR2ZuMWZmUXVhKzMrL2YvSzBaTklvRVA3?=
 =?utf-8?B?ZTA1NkdrRkRDN3FzanZiRUVvNEgwME5mVWQ2anI0Y1BxTS8wUDZyR0pmaHZi?=
 =?utf-8?B?T041dWdieFVwME0vbDFUWU0ySHA5a0RlT0dZenBIR1A3dmY4WENUenZZNGZT?=
 =?utf-8?B?M2U0MzFDSUQ2Z0hWcVZOZ3FLYkRBMEtLM0pmaEFQT1M4MVZHaHFjNElmODlY?=
 =?utf-8?B?cXVPQmVTeXBIb1lIdlF1T1B2MGVzVUkwUVFlNFQrd2Y0TlNsc0QvcDgxYUtk?=
 =?utf-8?B?OTJmZ3JtZWtCdjgxSmc0U1NjY0xXeDY2UGw5ZTZQV0VIejlVS2o0Um41OU8y?=
 =?utf-8?B?VlI1NGZJbnJLVUxjMjh6eGlyb0FaUHZ1eGdkSGFFUVZxRmJYYVJaSFBTMm9C?=
 =?utf-8?B?SWpYWHJ2bFdpNjN4enQ2V20zQ09hb0c1cjVBT2dkQ2d1TmJTZmRpN2NURVlO?=
 =?utf-8?B?T2ltZnVtZkpERmt2aGlNaGxFYlo5cHBjM29KbHdUbmhFMlM2SDFQaUhLQktZ?=
 =?utf-8?B?a3BZQjJ1VDNnamVUQ3VqNC9KcU9VSUFhWXh6aTZwSUQ1Q1ZQbXFIZU5KdEZL?=
 =?utf-8?B?V3JXcmxBZVBJaW13Z1NvRmNuelVzNkdUY0RSWllVUVRXd1FjYng1TlFnb0dw?=
 =?utf-8?B?b0kycjJ0MFY0NytyTUFQcDlQNVZhaldQYnFxbGdrdzlDR1FQYWt4VGdsZTZz?=
 =?utf-8?B?SUY1b3hEQnordmJ2Zm5ydk5nTUZEYXNCc1N0N0NiTSs3VlJ1Wk9YcFRWN0tx?=
 =?utf-8?B?cGxEZFNkT00vNWV3QzZMalM4cDJVTEFyRmx2WmluSXhPdmczWm9oUWo4Z01p?=
 =?utf-8?B?WENpdzdzSEZNeEw4ZXlranZGaytTUU42amhXSWtSQ1FYWjBmSkRYSlhleEkw?=
 =?utf-8?B?YlJncW9hem4rZy83VXduSW5EckhFNE1XWUlYbjNoTjdMK0RwVHFYN3JqT2U3?=
 =?utf-8?B?bnZ1emUzNVlKd0Z0a25zT3NXUUQ4Z0lDM21EWmd0ZXlNeWV2Q0Z2aUh6cHMv?=
 =?utf-8?B?SDZCTTh0ZC9JTTEwbmJJWlhCYzBtVFhQZGRtTTlWM1RBQ0pTa3Y2NWtVdXFQ?=
 =?utf-8?B?allxRDcra210SVZNazVqYjhaVnZEZ1ptcXlHZGJSVzJuRW1SNmlJalU5c01H?=
 =?utf-8?B?WG5GK3NhOFVhSC9HOUMwSDlYU0hRTHJ1Y281WjZBUGNBZnduMlJNdVRodlU3?=
 =?utf-8?B?cFJIdnl3RWlaWXpoV3AxYW9aMGxzQ0FmRm8wR1dwQ1NIWmNVb3QxL09kQXZD?=
 =?utf-8?B?S2dHZHFFY2RWcjZlNVlKYWRQVE9NSGVrVnBkaUkxOEw4MysrUWo4elVHSGV5?=
 =?utf-8?Q?YhFIcbx1nSw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1lxRVVnc2dWYkpGeGpvNWNPYTEzR3BtRG9WTWM3ZExuVGN0OXBJZUNxemIy?=
 =?utf-8?B?V21iYWZUcUVuOExHaVFCbEtVYkxxQkNnMHRLSUduY0tkdW1menRWZFN1b2tO?=
 =?utf-8?B?U1hMVzhYektSYVkwNENGR21EYkpjbDRaV3o5dWo2WGJWb1ltZGFhc25yZHN4?=
 =?utf-8?B?aWtDalAyYkkySnNjMEtQd0FhR3BoUUVzZXhjY0s3VFV6SjNuRnFKOG1GNDE0?=
 =?utf-8?B?dDhDcEFvdVJhL2YvUGlJYVcwb0wreG1OMzgrbGlMamtseVUyblNqaWZxSTdY?=
 =?utf-8?B?aDF6Ykl4V2prSkVFWFhwQlNzU1Jxc1YyZDdEVXJHMTd3QkFERk1YZnB1emRG?=
 =?utf-8?B?TWFrcW1EY2ozRUY4eGREaFBmQ2s0ODZkMVpPTFBzRjJGWk1XOXlYcnFVN3Jx?=
 =?utf-8?B?ZCsydVpBaGxtc2NwQUlicFE5ZzdpeGsvVnJUcEs4VHBWUFZkQVIvWXl0bTk1?=
 =?utf-8?B?SHMvaFo3blUrYllGWVVYZVBycHV0aGlZeEZ6a3hCcTRzRlhISTArdzlqR3Jq?=
 =?utf-8?B?b0d3dndOMDZCMnVtUlQ3bXA0MEpQaEZHblluUExlakVSamVyMGg1Qy91MUFx?=
 =?utf-8?B?dG9jeHFhdi9zWDJwVmljeVp2UVIrZDJwZWdmbFlHTUdyMUxPcmE0Um1sZDFE?=
 =?utf-8?B?UGErcUN3bXg0R2xzbnVkKzZuNzJEL0FUTjJjSXBmZ2swTTRYR2VBZFlVS1dj?=
 =?utf-8?B?K3hrNGlTNFdFdk1GSnlCTVpUVEhsVTI2cUNLUXAwUUsxaFE4MGFzbmF6MGdm?=
 =?utf-8?B?Vmkxc04xdjRtSElBOVdOQzYxY0pwOWdJbFMycmNrazBlWmpxd1UxTENYSG10?=
 =?utf-8?B?WDQyalc2QUxTZkdNVndOS2w4ZFJpOHBuOFA5OTV5Tkx1d3MwYTR6bnJqMXVJ?=
 =?utf-8?B?OVJjZW51dzRLbE42cDRMenlSUTBadlVTbTFsRGRFVlZqbkFnNXZKYzRaQXo0?=
 =?utf-8?B?RFNYbWVJNXNsdm9LN0cyT1lGMWRjajRtUjFibXBMTG84UDlXRTRXK0txVGkv?=
 =?utf-8?B?WWJwaThrRnd0WUprUlNYWm04ODlubTZoWU45cFhHRVpQcjUzbEY5RVdlMTdi?=
 =?utf-8?B?LzN3MnRVUFB2M25TcWUveHdHQVcxcjRHb1hwaEZ3YWhrSUdTQldIUk55UWh6?=
 =?utf-8?B?Z244TkFycFh0eWExYjVPSW0xUHM4bm8xd3JxbVYvTHZIRFF4M2NuTUp3bHRP?=
 =?utf-8?B?bXYvaElBbm03Y0wvMEtnWC8rUHhzQkRzdzBhc2NsUUsxRWdtbEtJb1Y0Vi9K?=
 =?utf-8?B?N3kzV3gyTXlIM0FNUWJiUWluNmVFSTdHNXpyM1hqVWc4Qmx0aGhlNTZwdGlM?=
 =?utf-8?B?K284NTRIMzdzKzNheXdPQ3d2S21iQnRqNXhLK3pDaU5pVlR2T3kvTVMrNWlG?=
 =?utf-8?B?VXh4cEpuWEhrVlhaV2lkNFNYNnRMT0U2bXhwZjJZQUE3Y2djcjczTm13Rk9I?=
 =?utf-8?B?U1Q1dEFkSERSbEMwa3V2YldKcUZUeU9heitLZWo4MStFRkRZWjBGNzVmOXEw?=
 =?utf-8?B?US9SQUkvbVRaZXZrMnBmb3E4U3U0aTRJSEJ5RjdVU0lUbmZidHpmQlJxclk0?=
 =?utf-8?B?aFcyd1BjUXAySlBaOTZqUk5kT2d5MWlmYUpSQldsTnJCTnRsa3l2V1RtMlhQ?=
 =?utf-8?B?bmV2RUxVZ0VnL3VOaktabHFIVUI3eC9zWHhmVzdOdlJxekxGNVhKRUdyTlp2?=
 =?utf-8?B?OExsR2RnTEpxSnUyK2tGUituVEdCQVFFWEw2NXN4QXMvWExVZ2xmamg3TXdD?=
 =?utf-8?B?V2lHdjdveEc3WkQxaVJGVGNEN1p6aDI3WEdDQnJYQ2RycktGeGNOUnowcmNk?=
 =?utf-8?B?NVB5M2hDV0duMmNwSmI3U2dmUVdrcWpVMGE4bUFzem1yb1B3djV6cFpoNzIy?=
 =?utf-8?B?VlJlc0trY2I5NzRYNE1GOWUxWkRadEc4dDdzTTJSQ3F4WlFUWDU1aHVYLzgw?=
 =?utf-8?B?bmxmRktlRTNFTjRpa0tkVFV4Q2xQOWZDVUFYcUZBMDJuNEplU2prdHZJYnIx?=
 =?utf-8?B?SGt0Z2ZOeUQrKy9Td0o3eEZkczdUbTR4ZVdVd2djQXlsSllhK1MrR0RiVWxQ?=
 =?utf-8?B?c3hJbzI4eFY0cUxhNGVsVGlCZFZRRExqZWJFTDA0Rmtwdklqb0h0c0RINVRn?=
 =?utf-8?B?U0YyMTlwNXVTcEF1TC8yVU56WFcyam1kd1JYN1dmVVRmWFZDVGs2aVJ3dVBt?=
 =?utf-8?Q?nsN063nlzX6+If9VKohxqfg=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffd2954-3a75-4a49-185c-08ddbd3652b7
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:11:57.3737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8PTRWPV0Su0j6C/Q2M/vHSvdKYZgWsHv3jQbQnNFWRTfTR/+Jaaccjl/v2+Ghd49DZbJ202eXkFhuTYFglwNst7P8Ym6eQ1UiGPJ3p3anJw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9186

On 7/5/2025 7:01 PM, Daniel Lezcano wrote:
> The driver uses the raw_readl() and raw_writel() functions. Those are
> not for MMIO devices. Replace them with readl() and writel()
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> ---

Please attach a cover letter.

-- 
Regards,
Ghennadi
