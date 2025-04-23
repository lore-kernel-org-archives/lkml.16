Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2055.outbound.protection.outlook.com [40.107.105.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02179149E17
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 14:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745419116; cv=fail; b=bA7LMVgp1zRlT1GWMu9bFls+vzE8nSK8d49eA/1m1vbw5RieRvKD/WJkNob+P7uc27x25yhgNik2F9ASoEvzD3G2puHu0vVJB7NhliNlX+DY4nA/QDWAHKk6xZaN47iBkkbqEWn2geDbURIVoeImIl2PJYlMTCfd2QvTugw/Dvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745419116; c=relaxed/simple;
	bh=ZM6dqcQ6B0iOxNm/Um3fz5GceOQuobCdyZjImYSNCF4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=k0oc4jy3CEb1R68pWSPixArpgDHpeHbYMtrSWTeFls19XPzMKHKlooTb7BSHuR7HhS3IUp0r0cHwc7wBXoaE3SsL0jdMbYCrSY+8wVT/VZeI1MJey09LiWobxXq9M56O9QbPQxJ2sYoZ3DTSFKwdSnbw4nANkSKNgG5Dpp8uA0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vE+QctjT; arc=fail smtp.client-ip=40.107.105.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vE+QctjT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NXqyJPb69m2U1iNXd9wyrvrQmI+J2VffIYOrDcj5IMZSTSlS+wIZwxyO+AjNJ+gSwAu8Jb9fHgTmfYtToTYq9OibV89SpVHLgObR1wzzB64qYv5rKbC0bobHkcIGkfzA1muNmiiR2FRzdJcrPggt0UJxY/2qfpoT/CabrYQfczjNlZ3hOIhNNggVeSKn5EsdczXx1xj9xxCWdMtSqC9IEwPJQ8Nedj4MhsC0qFgA1LXnF7gDFQyfezC1XSCZBQl5ZSaznvrd7u9b3xdwku+L9FG6p+lQm+C9OdAEWtVrUa67W0ksZd/nd4pSngPdD4GTXc/sqJMCgoKDpJHX3XxZnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpANIKjkX7IPQWPtgMnXaSLoSAMps8E3YXqUo0Rw52Q=;
 b=yRexNFPJ8XBtG1BZJViAU0BRZL3Lj58PE6Z5PiMZqx50KyXX7OS5SCt2uZ6SOZGxbGFEE2TmHK14fBqXLmhQUwGbzrd93HK+t9sDd3oq6+PPmkKV8+V2fiF/6NCtT0Mp7Acxkp+xbLt5YrOUoEXEG1VQAl+jg3g/RyorCi8/kTgaGORHrrLadC00sQl34v9RHugmyYVqsv4I0pFxV0HXMWrDI6tus7aI57TdUx07I3irha84WtDU8LAn4UTsXhBCw3wq7BToKnUBJESHI0bwGyB7aARjkMEFGAhEtVGgTuhAiK1ZpjE9vKrgV3sq/p7q7J0jgjhQXBw9WVjigTYcWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpANIKjkX7IPQWPtgMnXaSLoSAMps8E3YXqUo0Rw52Q=;
 b=vE+QctjTJbTuAWNso1fJ5yB8U6SKxo3bgzM/evDanLd4khNTdq9GLQRbnFIZ96tzBir/44SdiUv8TEB5oLXmkqo8Jv+5vss3JcvkVh+g7q2Lv2KRqQQeELR56dfkMfDVuvc5yCkivlEjF0GfeXIvyI9LslI8Yvhz6R9iZIX9STSNO4iI1QLfM2zUeIuVHG73ovN/GA15EKgxWmpPqWJ6gV464sSXZneLRg661BUq/6lgeh+60NTQ81qe+J5bTxvjkSjajgoyz0bzww1PsTY6au+JVMq88Wk0i7EHjuGVFWEqZc50tMepX8I8kp5ks/R/FhQ3xI3iraELFcRZ7F7dWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10844.eurprd04.prod.outlook.com (2603:10a6:102:493::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Wed, 23 Apr
 2025 14:38:31 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8655.033; Wed, 23 Apr 2025
 14:38:31 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v2 0/3] soc: imx8m: Dump higher 64bits UID
Date: Wed, 23 Apr 2025 22:37:03 +0800
Message-Id: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/7CGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyND3dLMFF1DIwvdRIM0y8QUUyMLE2NzJaDqgqLUtMwKsEnRsbW1AFI
 kpRRZAAAA
X-Change-ID: 20250421-uid-128-a0f9ad528437
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745419041; l=1094;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=ZM6dqcQ6B0iOxNm/Um3fz5GceOQuobCdyZjImYSNCF4=;
 b=e4sfhnbWlsUkmgf27vtE8daUsiv20wUHmvNxxdKypZUf0XH6qDhexkz7o/ML5qcnJD4NR04iE
 XGuPcOglbjEDUOOX7cnmOaNZquHO45nCxO+nvLW1N38ClaOyDDK3zGa
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10844:EE_
X-MS-Office365-Filtering-Correlation-Id: 341e4014-2316-4bfe-920e-08dd8274848c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dXNYME44a3hqNkhJYWxzVXRjcnliYkFLSHhqRUloVmRuSXJlZnhMbmx0ckhB?=
 =?utf-8?B?UUNDa1MyMXo1RWxncEdMalVXTUQyV3h4blVIOWlUU1ByaVNVc0NtdXIyUWd5?=
 =?utf-8?B?WmUvNHRSSXEwenQ0aUg1d1dsUThXUVlJS3dvekhFRHZyaHVSN3VCVkt0cXlV?=
 =?utf-8?B?V2M1NE9KOXk1UFo2cXdYK0JKY1AxbjU1N1hwczRMSzR3RFZ4ZGNSTVh6MTUr?=
 =?utf-8?B?cDRDaXdpWE1wcGN0ZzF0VFhRQnBXSDlaaE5yU2xDOGVaSDdzRDJuSVczNkxQ?=
 =?utf-8?B?Ryt6OHZidGtwbzlld2tRVCtWby91U1NFY0JGaFR4VWFZLzBXb2tyZTBlaGg2?=
 =?utf-8?B?SllwTnZ4V0tnb0d1akJ0MDFIWHU0STBWYTlxdTBzbTFsQy8zbTVad2xEbndj?=
 =?utf-8?B?anRZY1VDVFcrU1hFbkJScWJDRU10OFpjaExnTmtobTVnb3JIYXZFR05BUU93?=
 =?utf-8?B?Zms4ajEzbDRZRXd5SnY1S2FjaTg1QWlDZUppQWRnVSsvaFFkUzlTeHdDaHpC?=
 =?utf-8?B?emtLeHVKZWhsNkllSDJ4MitocU9KUnpxSWN2VHNBSTcramljNDVETmxEMDcx?=
 =?utf-8?B?aXhTeDNNWmc1VjVMdFpMb2o5eUVWdERiaXhvZ2pRRkRidlJJdkh5alhYVjl2?=
 =?utf-8?B?Yjc0bjBGNVgvNkxWY0FTWFRFVkVvN203R0dVai8vTHBpdmcyRytZK2FHc3Vx?=
 =?utf-8?B?MjM5dU1CZExiak85UURaMjlmTkFmV3hxbHcxYUNEclpsdDBoUnViRnE1a1BX?=
 =?utf-8?B?TktLOWRzTkQ0YnFNQy8zNEpEOU42UWRvQjFFU3h0Q0g2NlNjZTdZN1Z1Z29n?=
 =?utf-8?B?TUVLQVlPbTRrL2ZBMGQ3OTJpZW5GTjlyYWZldGxrRXJhSmJneGVLR1ZBY3Z2?=
 =?utf-8?B?MGZJTEJ4cEhNZ1dNSVhWN3dqU2RGUHplRSt5encrOGcyV2Ntc293SlNJMHJj?=
 =?utf-8?B?N0JkZVZaWFZNVDVVeFlWc1FTdzdqeHpHaHU5a2tjaVprRmhHUVRia1hsQmRh?=
 =?utf-8?B?VXh3ZnNOT3RvRjJHL1JyK013Zzl3UklFbWN2aUFCTTRhejViQ250S1F1TFB1?=
 =?utf-8?B?ZmFXUFVQL2wwZ0FPb3pkaEl5aE1UUlVOMW00R0dFcmp2Uys3b1h0U2gzbzZC?=
 =?utf-8?B?NEVqdmZpT3NuSUVWSG50TkhqaURRVTd6ekxoQk9jS3lLdTBoLzdHbmkvQW9I?=
 =?utf-8?B?N0VBYkJKSi81VGpjZjhPL01xSlhUMVdtVzZNZXN3TGpxRVZwVmRwN1FZT0tj?=
 =?utf-8?B?dzRqeFpSdENnaVJ5QWU3eld3SURsVzdzMGRKblhiMjlzVGdTTVBjalNUWXh5?=
 =?utf-8?B?Q0k2b05CK01vbUc3a21HdGdOcm9XUDg5K3FuelVQajlQRHRCcVBzdnRudkJp?=
 =?utf-8?B?Rk81VFR6ZFdFdU9sR0llVmFyQythYnB1V1Rrc1FYTGJpRXNvOEZhcG9oTFFr?=
 =?utf-8?B?OE9pckdxZXpuMmREcnpTSmhXZHVqdU5ieGFSRUlTd0U4c0FLWmlNSmh1V3B5?=
 =?utf-8?B?Ti9pdFZ0TjczUTlmS0pvNmRMeXg1Ymk2QzUvbjBUcEFadjFDV3Z5RTNCUVdt?=
 =?utf-8?B?L0JBM2hJbkZEaEpFTTVGaXVGc0pOMTF0MmYxNzU4aWl6NXhHQVRWZkdGV0Ry?=
 =?utf-8?B?N0ExVXBYeXUrU1NuU3k2bUl6cjNOU1NMdGE4WDlOVVJiU1VubFZMay9JaUU0?=
 =?utf-8?B?bktvVXhlb1FUMjhIREZ6VWhOZVpacmZMWHo3Z3BSc0IrZS9SVGdTZ1lYMnpK?=
 =?utf-8?B?VHpndmZGbFNpc2tJcElEYkVjM0YrMHJML1o1UXBsNHk0VUxUUXBCd2NZdlJv?=
 =?utf-8?B?MDhyeXlxemtXeTYzSlRCN1A4OGI1Tlp5VUduQ2NkdHNFblFHQ2k2SExDYnJm?=
 =?utf-8?B?V1ZES0h4bGFtZXVRTFpWYS9CTlNjWUVmUDRSTUlHOWtQYVBmT1JibkdtL1oy?=
 =?utf-8?B?VFhuREpsV0N5VlFvOHAyL0c4SzVoczBBL0dWTmZ2ZUhWUldGUkJhZEdIVVZr?=
 =?utf-8?Q?jb+pnUlbeXi37p8gUjUvHZ6d8BpgmE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkUyL0RHSjRIaXhRZkZoM1EzNGdFZ3RFZGQwazNsVTVCbXlYZkdvbHZ2WEwx?=
 =?utf-8?B?K2tOWUhxNzBncHNwTldVZWhoODkrM3UwUUdNQ3ZHemlrSXorUnJ1VkNKZzJ6?=
 =?utf-8?B?WG1yeUlSeEdGajE1eFc4SS96MGV2L2xyRm81V1hwNjVmN3V0cDgvQnNUbWhG?=
 =?utf-8?B?MENJY2V3c2R3S0FZNGxwOUZEbGdPV3BGSU5EdWJQb1FVeE80V3VpRWJ2MVU0?=
 =?utf-8?B?NXU4U3YweUJWK1RGdDBwQWJ6cXJLMzdWQUNQTFcwV3RieDNpNThrMU84eTlZ?=
 =?utf-8?B?VHVycmxFV0w5WC9hbWtMR2R2MDBJR3JnQlBDNm12TU9kWGFFTUh5SWFLNTF1?=
 =?utf-8?B?MXo0dUxmVjU2blc4Y0VwN0hwZ3BGRXZEMFRNbFdTM0xITHF0dndZTCsvSURx?=
 =?utf-8?B?YXlvUFVOQ010U3RNbWh4amdtdGZiVzRPY1VCaEE3SGg3RHI2QnUwZEI3SWFO?=
 =?utf-8?B?ZTg1Qm9ieVIycU1mTzdmSmVySUxJQTBZWmkvL2FuNHhUelZsenVNZjNzRDRY?=
 =?utf-8?B?WExsWnoyWTZvWjFjTTVLV2hsTU1PeFV1Sjk1SmhCamdwcUU5M3BTOU1QSlVE?=
 =?utf-8?B?MmRGR2pLM05NalVKOGI0d1RjV0NpbEk1d0V5NlI2cWsvNGp1d3NiVGRHTjlF?=
 =?utf-8?B?WnpwQnhKaVFrVS9vUHM4UmRJVmE3UTlCUVphSnFGM2tnZjFLajdRck1na0xJ?=
 =?utf-8?B?SnBndWFZeFJtakplb0RheWFoZjNURjJ0YTdWZkp6bmhmVWpsT09hMzJydWl6?=
 =?utf-8?B?T1FxbkVmNEVqODhlbDhvN1g1MVNTUWFsalhUWlBFTmZTTlcraStrNWN0TE0z?=
 =?utf-8?B?SVNDeW9YT25IU3BUd1JpTTZRaHJsdmo2M3Vjb0pMZExqRnZMdFF3T1VNcVVY?=
 =?utf-8?B?MXpZWlRJdDQ0MHJBd3lzN1VrUHV6MXhnazRlc04xL04wRzdGZ0FHdGdPVFFa?=
 =?utf-8?B?bXVjRC9SSGFtZHNJWmw0Qm1EK1ltSWhXdUpWVWJ0UUFQdXJNYTVIRldBbWZo?=
 =?utf-8?B?a25VL214Wk54STlkeUhyY2d0RE5DSkF5dmpjQ1BLZ1BDb1BGL3dDKzVoWWxU?=
 =?utf-8?B?c0hqTGJjQW04MUkycUJkSHBlSXh0cWlydHVhVWw0VUVtNVBPdldFN0xJakxu?=
 =?utf-8?B?cUVyUXd1V21GVGZQMmtOckVuZ2xMZG9xbVN0NC8xakh0blU5Zll0bStSOVVO?=
 =?utf-8?B?Zll0OW1BYUR0SkVpeVJIRHl6L3RSOFJ3dTZvclhoZTBROFVLNk9kM2g4TUZQ?=
 =?utf-8?B?eXhOY01mNmdPNVp1OXFNVjZJYzJ5Rjc4MThXTkVNcFNnZFRJZjk2MHpDcHlH?=
 =?utf-8?B?QURtKzFDcTJqaUowS3lzUjNDTy9zZ25ZR0Y3eHlFQUh5aGpsSWRmS2JlSnFz?=
 =?utf-8?B?aWxXSWFoaGxsclZRTDFhQzRKdXRWOU5naEh2d1d4UVk5QXg1N0xVVHoyQlN5?=
 =?utf-8?B?cFlDellGTE8xSHJiQjFVQTJaK1lRa1FvcmlLRTJlR2V1cTZibEtrdnNpUGI1?=
 =?utf-8?B?MkdMQ0J5SnBiNm0zTHV5djlJM0tDWXFPelRCQjl3SU9HZzNYam1ZT3pUbXpB?=
 =?utf-8?B?YjBUSk16dk5rYWNkbEd5WkNIYXJXVDdXdFQvR0twZUtFU0hWUjBTM2VmY0NI?=
 =?utf-8?B?dTBRSERSTTlNaU41WUtGY2R6dEc1WUpnR0xEV3JWRWpIZE1YYVo4c1VqTzZU?=
 =?utf-8?B?dkdkdGxOUE9tSUo5a3JlZ3ZHakRkdnArY0dLNURYSFRnTlJDU2xma3pUK3Va?=
 =?utf-8?B?Q1YwVjZkTnU3bHZJYVFqM21kTUljdkZid2dQZzdscGQ2bGZOZnlraUZiaHM4?=
 =?utf-8?B?QTlPbHoxVFAxWUdZNTN4R2FmNWZxZElUVUVzWmtXZ2hWZHJYcm5lbCtwaDA5?=
 =?utf-8?B?SExCU2gwbDJTOTZDNk9nN1lhaXlUNUdCOVFPRmx2T2NlL2xUMlp5N0JGTHhP?=
 =?utf-8?B?ZmFQcldFQ2xBUk41MjN5Y2NVdGIvRFRDSEJLUFV0TG5GVHZvbm4wZ0Z5bWxV?=
 =?utf-8?B?ZUJxNEtRM2FKYlNLd3llS2I0WnFnWnlGWXk4Z2d5dmd4b25ucVlLaXM4cW5F?=
 =?utf-8?B?VnFhYy9sZXYwYkttcllmVTdCVk5TYVpSQTBqZ3lleHh2VDBFby80NDhnYm1o?=
 =?utf-8?Q?B+4I7SSv/jIrtz3SGFxNP+ZAR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 341e4014-2316-4bfe-920e-08dd8274848c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2025 14:38:30.9764
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jKxrrIxoUTv892XQil6r4oCMk/eE36PI95zr/zxmjj9Qpv/8lxklcwzFCEj9EkjJMNgcSo3BUEnv9SHPpeW0Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10844

i.MX8MP UID is actually 128bits and partitioned into two parts.
The 1st 64bits are at 0x410 and 0x420, and 2nd 64bits are at 0xE00
and 0xE10.

patch 1, 2 is for code cleanup.
patch 3 is for i.MX8MP 128bits support

Marco comments on v1[1] to introduce soc_uid hook.
To do it further, introduce imx8m_soc_prepare/unprepare.

[1]https://lore.kernel.org/all/20250317094518.yf2hbq5sjl7lgfwb@pengutronix.de/

Tested on i.MX8MP/M-EVK

V2:
 Introduce soc_uid hook
 Introduce imx8m_soc_prepare/unprepare

V1: https://lore.kernel.org/all/20250314065225.442717-1-peng.fan@oss.nxp.com/

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (3):
      soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare
      soc: imx8m: Introduce soc_uid hook
      soc: imx8m: Dump higher 64bits UID

 drivers/soc/imx/soc-imx8m.c | 177 +++++++++++++++++++++++++++-----------------
 1 file changed, 108 insertions(+), 69 deletions(-)
---
base-commit: bc8aa6cdadcc00862f2b5720e5de2e17f696a081
change-id: 20250421-uid-128-a0f9ad528437

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

