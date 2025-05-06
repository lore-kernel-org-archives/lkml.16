Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2120.outbound.protection.outlook.com [40.107.21.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B3B278750;
	Tue,  6 May 2025 11:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746530458; cv=fail; b=cZFygL+HxGiqD3R829vnxuwibKQxbptHA+5XIArFOATct6Lquc93asLqJrpuRjJUkchBTR0BpRVLmgIgkwT0y+LWxDPR2xc2XTn/JRKiPpLZZ8CXkgJn8UWRpcQvMZGESepaQLa+w+KRtJHznWotfUtqMXWUpbVtL+EV8E9U6TI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746530458; c=relaxed/simple;
	bh=nvhawmGgSx6wmQrAh1W9Ucl1KsaEacSev+/j6TyIQ5Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=quEF14P74l19rrJ3WwLH1Kk9s3kU78cIyyA95G4JQjW2Gyr9oiAmPvZ+3D4pp4dbcqeATEzC1TODXicx4mLjQeju7hG+ybfE8m7vGakt7Yx1FGrO7PRh2FA8StBCJ3HOusazCA/GUJQF5RO9o6yVbtezFnhNbQx0F2JsLvn/xoA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=NJHABPeQ; arc=fail smtp.client-ip=40.107.21.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="NJHABPeQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AE027nnMp4RgfyIV8RU6jRNM4WyNe1Mg3JFowO7JfDZuH7azYDUqsgprIrz39wnMkm+SRAhdHLx+SYDdU0RmVS8/WdhWYtWtfSfdmfco1x/ZCKGF+e0HtQ/FIQo75VcXF7GLQCiITVaJ3jfwAqGuHna9SkmxdUlc8LR4CRRVwPZ3SlfmCTHSzqWWdEW9me+WyEitKoSuQcwx0o45jUtfJoLhCeXYBf2MDIegGNY0PEk96xD2hOVoWET39y+EMFEANzpzEYk2S0G7h814vu25Zh+qN0j/VEZFmMcLWAm9oVX/5olTxdGITDMNlgWWKcxFbqbc8CN71Ac7bLqYVK1lQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0x5lLgtLetSozm2k0oNPLKn/8Cx9yWykGRASmBYbeeQ=;
 b=BepDqzylAGEfwk+YTqI4FDQdoRiJ8KSqUtvErjtu4AYdVnNzXPQBFqFrPRixyMoKyg22/EyrckuYCsIHUgJR/rVAdN+E+g0WJR6gXPAVB34nYee9CKoyC8Dq/ayFikZIvJRFcEW+pgJFRhUOYFGIOQRN2BCbQuKr/I98+WTuB5u+hiBhynpgYAM3thyFALAvIAKa75px9VPEoKXYXvJgHG2yHbVR5Jq0CVn2C1j5G2GOfjHm6j58UNClsfG/EuOdCWTM9p3qqymbRcvLtqe+wVaHQLEjDoWqFeIJszTMmLrL5yeBQiPS76CUzye+a2eTADWZnTvxIRsUZZ0XY+34Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=phytec.de; dmarc=pass action=none header.from=phytec.de;
 dkim=pass header.d=phytec.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0x5lLgtLetSozm2k0oNPLKn/8Cx9yWykGRASmBYbeeQ=;
 b=NJHABPeQNNmzqzSknIKP9VzluRe58GKtrAhuEdA9XVPjf4aGA4eENiip8xA4XJajeAQbcfbwmHAS4oDJmJ+XRPcbdZXbBkw5M7/V70182XLIfNvcwDmFoFxYPm4tbr3vtTimobf8vkGidpjzWLqb7nbK8jMfDv3Qrem3NhfVBp0sFlcAleYq0OauG51xVPqlnW54UzTDwkiYj/IY/fnFiRyCv+aj39FPqzqYFBFFxXRQmmfguQrXC7or3LYdJangEol6l5gzrjccbCS5MtN/tpRPYOpw1LrGAp5cTuHgR79qD9Ye/P9VmXCGXGuWWd3O1kx/bUIXDgB7E8xT5hoPjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=phytec.de;
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:248::6)
 by VI1P195MB0560.EURP195.PROD.OUTLOOK.COM (2603:10a6:800:155::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Tue, 6 May
 2025 11:20:49 +0000
Received: from VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981]) by VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 ([fe80::24f:8371:2871:5981%4]) with mapi id 15.20.8699.019; Tue, 6 May 2025
 11:20:49 +0000
Message-ID: <e996f88c-0e43-4935-89d4-46ebe07d6442@phytec.de>
Date: Tue, 6 May 2025 13:20:37 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 03/11] arm64: dts: ti: k3-am62a-mcu: Add R5F remote
 proc node
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Hari Nagalla <hnagalla@ti.com>,
 Beleswar Padhi <b-padhi@ti.com>, Markus Schneider-Pargmann
 <msp@baylibre.com>, Andrew Davis <afd@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502220325.3230653-1-jm@ti.com>
 <20250502220325.3230653-4-jm@ti.com>
Content-Language: en-US
From: Daniel Schultz <d.schultz@phytec.de>
In-Reply-To: <20250502220325.3230653-4-jm@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:303:b5::18) To VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:800:248::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0P195MB2484:EE_|VI1P195MB0560:EE_
X-MS-Office365-Filtering-Correlation-Id: cde38d75-30a4-4b7f-97da-08dd8c900d7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cmMxNkVqWWtCMm5kUXlaUUx0TktjUFVyby9FZ2w1b0FDcWVKa1pFN3RDWmFt?=
 =?utf-8?B?UkNFNE5MQlpUL0Z2Y2l1N1pqemY5OFVzalVhWkt1WGJlNm55M1JWblI1SjF3?=
 =?utf-8?B?S282NUVXYVJrVUhiT2oxbitNWmZ4Nk82Vlo5T1hvMUhhSHhTZTFYVnQzTmVq?=
 =?utf-8?B?bjdRQkhkNWlnR1lJVm55MXlRYUdQamlHK2hZZ1NCb2FnVTNKZ200b3dQL00z?=
 =?utf-8?B?UVFmWkRPY013M2twQkJFcWxoc2xxZHhuNGRyOVFvQ0N0T0h5WHFobXRlZDhE?=
 =?utf-8?B?ZUpUYUNyMjFPR01RK0NTb3dzWkJEbVAzT1R6NFV2MHlxejJqNkc2Y1FVa0ta?=
 =?utf-8?B?Wm1wYmgvSGN5dmdHZjVBUkFmdFhCUDRwSnhTWjZESlVlNm5rd1ZONlAzcnY1?=
 =?utf-8?B?Q3BiOTB5VzdqVXIwNXdNWERzejdWUnZWSjExYjk2dnNBZGlDRWFXelZleHFK?=
 =?utf-8?B?a3RBaWx1MFQ2OTIrMUlNNjlSdGRlQXArVk02NG5HZ2JXRldJTFVpOVZaVWVj?=
 =?utf-8?B?WXkvTmRVSU1iTWFrRFBoSEVSN1YybGdNMHRHaHUwZ0sxa1lwZTRuZVJCbG5R?=
 =?utf-8?B?VHR1WlpWWHlKZWtQQ2lsV3N0bmpJdGRvbDFlNnlyTnJFTHJwTHlzblRKay9W?=
 =?utf-8?B?cjlKT3VOVFd2Rzl1MU9WWGlZdVpsSzN4T0RkcGlqR0o1R3ZYaXJjc21ia21T?=
 =?utf-8?B?Lzh4NlhkQ3hINWZQRGI4TjBjTzBpSW1QVXIrSW4wSXV2Q3RuS01pQmJWd3Nq?=
 =?utf-8?B?R3JJcUt0Z0xKb1JVNW93TDNaZVFEK25xT2JhT1E2MC9rVFNrVFpLUkttSllW?=
 =?utf-8?B?cW9zelowK2xOVWlpQ1BDZllEUCtwR2RFS2E0S0tuK29KL2lXdit4ODBBNUg0?=
 =?utf-8?B?RkFidTNrOHUxa1ZMbFExVDgzbVNiTTJUelJCeTgyUFRsRm5FMzBJZm9JVUU2?=
 =?utf-8?B?U3FJbnduNk9ieldpQm5lNVlVMWNlUnVHQmhJdGlLZyttdk1HVE9lQlF2dStB?=
 =?utf-8?B?R1AzbW9zQm9UbldHOU44UlFwbVVlSWt2bkhEd2Jkd3lqQXV3VTIyT1d3bEp3?=
 =?utf-8?B?NHVrc2hXZTR1dytUT2plS1BwZDR3SERIc01TYm5WUVlMRktjajIyQVVOcUV5?=
 =?utf-8?B?TTFhVmJ3NUhDNUZQcDNEdUpXb2RtUVV5bFNwcDVoMW1Tdm42U1Q1ejl4bnB2?=
 =?utf-8?B?bXhIVG4vdmlRcC93RUp3SS92bXdESVRlcWVoOTA4Zitmclptb1pQbURCTmlD?=
 =?utf-8?B?QkRhd0tGQ3lhMVdLQTVVUUUzRWJhN1h5dzlMdTZjcFZzRjNtSERaUGFsYmFN?=
 =?utf-8?B?eFJ4V3V0aitzcFE0QldXVzNqU3k5a25wUE5HQ05YcjJBSTVraUNzQlY3ODVB?=
 =?utf-8?B?c3hoNEFxZEYxUndaOTVzY3FOeFZqNFZKOUFFN1ZzV3ZGMWdsSlFGOFZQd2FE?=
 =?utf-8?B?d3A3U3JRbU1WYTV4KzZsK0RUWkVpeW9hQ25aWEFPWWFxK0xadTV0M3JsSGxo?=
 =?utf-8?B?S1BqZFJ0SUozendRNkw4dmdXdHRta1RRbVlHMXRKN2dmMkJxcXpBNktiNGEw?=
 =?utf-8?B?Sjg3Wi9LclA0WTNTcmNQVStzM0tLVHZxREdMYnh6RWQxOW1iR3g2dTZ2MXIr?=
 =?utf-8?B?dVlHVnBwZTdxWG1Vb0dhZFhmQUhXc1NkRUt4VFpOSVEzZ0JNVnd0WkRiTmFh?=
 =?utf-8?B?TWV5dUFPRGdqVjFSK0I5blRobWs4RzkzcFh4S3VBVkw0TEtrdGsxNkJQRjJk?=
 =?utf-8?B?NVM0SHZhQzk3emljRnEyL3RoeXZwN1FhUU8zSHRDU2lTYUlTb2NTQUtBTjBk?=
 =?utf-8?B?VmNncTA1M09Wb2ppbFdHbi9hQW9JTmJVc3QzOUVXVkpJNXVIZ0kzYkRhWjZL?=
 =?utf-8?B?cUwvcGxUL3JSa0VtcFFhN25LdFR2TkhDbUUxeGQ3VlQ1Q1psSmtiMjYxV1po?=
 =?utf-8?Q?NKmzeyaapGI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0P195MB2484.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWhVWlFRZHNabEpCMUJlcWdTN0MrWG9xMUpCWWE5MFQ1OGNFVmR0VnphWURM?=
 =?utf-8?B?NGtFdi9OajZxU01heE01ZFFXMjZJbnFBeVFoS1BweHlRQjRCb0NvQjQyT05B?=
 =?utf-8?B?aTA1T1JaTHhDeUpiU2VVMmp6cGRDVStIN1Nyam41VnZwMWxuL1hmMDdoZVdK?=
 =?utf-8?B?NHptYzIrWlE3MHpCYVRxTVJzTEx2K09MTWZUVENlcFNOWDk0blRWbnRuNlo1?=
 =?utf-8?B?SEVhckxNdmdTRUJYMzJ0eUhCMXNTU0tOU213WHZZY2t6cFYyZExqSnFMOTEw?=
 =?utf-8?B?Vk9pVU5qUXlCVDVCL2haQzdnUTdWRDkwaTZXTFdXVVVDbDRVcE0wWXEybVBG?=
 =?utf-8?B?VEhyRkFNRTNIU2orWjNndTFCWjFIeDZ6RSt6TUY3WFpzb0sxd0V4QW1EeU1z?=
 =?utf-8?B?clRwREcxbFBjZXhTdW1Oek5mZ3FzYXdscXNCWGtvTlpnM3BleVlJc01tVTJj?=
 =?utf-8?B?R3NBdzQ2ZnBwN1hOVy9lMk9vdUhpSjcyTkVuS3MrVEdQVjNpUFR5c2dENE5h?=
 =?utf-8?B?WXhOUjlqZjdNSkNFSTkrSEovQnN5QTd5Uk1VQzhJeW9GaVEzaDlCUzlVNkF3?=
 =?utf-8?B?cEk5bGJEOEpHVm1IRXZrQ2J2YmF4aXF1MUJvWFRHbEJlQUpES2tscUF2bU41?=
 =?utf-8?B?VzZVRUY4VElLaFZVUXVqSDhYdllmR0JQcC9XQUlnQS9UOU04K20vLzVocjFV?=
 =?utf-8?B?MHY0ZEZtLzBiU1RuRHVlREZsRGZuSlNHSUx6T0NZcHd2T2RJR3U4RFhrOUdt?=
 =?utf-8?B?MlZla0RYTE51N2FqQy9Qdys5VVBPeTNKWlJjTDYzOVdrRCtjdWFFSGZxRGQ5?=
 =?utf-8?B?NW9HWHNrU3dXYnhzWVFaaldESFZScEdDSDl0eGFDYkVEUnB3SERlVENHWmlF?=
 =?utf-8?B?N25HcjF6MW1DVWxpNHFlak1mZFI2emJHRTUwdE85TGdQdnQ0SG0xNEpuUlg1?=
 =?utf-8?B?TDB2UEtLemhxUGdBdnViY09QSmVqUStzWGlrVEFXM3VSUWlBUU9uSmN0cWZo?=
 =?utf-8?B?VFY3SjZSWXZiWS9YMmxONUNXVDN1Wk9wMWQ2U1Vhbmp4Zi94b3JDNEdHbEFD?=
 =?utf-8?B?cCs0MFZKRWpSOW93SlA1UU9vdkZQT1QvWnFnclprOXIwSHNWL0k5SUN2MUll?=
 =?utf-8?B?b1ZGZTNGM0FZNGgwRFVnTk9aV0YySEk1Q04xUVRJbVJBa2pBTFVWc1lFUjhM?=
 =?utf-8?B?SnpOaTNIb3pmUVFaVzdjQnpxeG1vSituRnQ1SlRrd2wvYzVROXRERmlDQjlZ?=
 =?utf-8?B?TW4reFJFbHB1NCtNMXZGMGkzanpNT0ptdFplclFlMlFmbnVjamlzQ0tOUVg0?=
 =?utf-8?B?TnlqOUZ2Mm9wSDVpVEp3ZTVQay96bUdKQ3NRaitJVUxYZlQ4MS81QXUxZzhD?=
 =?utf-8?B?aGQ5eTNJYWVSeFllbkw5VDlISFdWWU04dGZ0a0UzNkgrUkg4Vk9ta0xJeWts?=
 =?utf-8?B?K2FtY3F1alVhdWFKWW5BUmErUGVoVWVIOC9UK1c1Q1I4a3J3Rmkya1pRc0lN?=
 =?utf-8?B?TVVKa01wMzhMSUlwYkE4elF1bkpxMmRacVRvMHFVTm9heXltZVdkekY3bis4?=
 =?utf-8?B?NnBsVnlLNlM4QWtuczlwbWVycFZDSGFqa2hrNUg1RlpuSWRDaUlzU0dBZEhV?=
 =?utf-8?B?bi9RSW9ESGRwSFlnVTNPdmNuWXg3WUJmVysrYkQ5QnZnOHpFUEc1VlhCRHJm?=
 =?utf-8?B?NmVKSHI0RkJxVVZDSWxidUZKRS8rSnBRSlZZYlRhem9KdUFHVjZuSGZ1T0cy?=
 =?utf-8?B?MGxXNXJaNXVqbDFPd1lWUEJ6dERhYndTckxybU4xOEN1SWRQUkRMRk5hc3Jn?=
 =?utf-8?B?djZaV3RpVVNPdm5HM3JlWWpnM1ZWdmpBemZvRStxc09ncW5JeWFQUmN4OVRx?=
 =?utf-8?B?OUhuUTdzUmJ6d01BS05LM2Nrd2VjRUFtMWh6WWFCQUp5TVlCaWx0L0lmK0FZ?=
 =?utf-8?B?b1V2U05CeTQ5UVR6YXFKSGMxelhReVByVDdONjB2aktPejFtV0JoQ0szcWNE?=
 =?utf-8?B?U1Q4emhrYm5FVjdDVkZ4Rjh5K25Mc1hOMUQrcnJVbzdadFBlVlRheVU3aUZh?=
 =?utf-8?B?d2ZLdU5SaG1qcGpBUEtsYXkrNTRRUnlDV1plM3VQSmhsY1VDVlliL1A5UmNG?=
 =?utf-8?B?UzBjTDJQMEVCU0lqM0VLTXhQZ1llUk1PNVpybDZTMjRnMlprRTZUdzZvWVhs?=
 =?utf-8?Q?mBjuHduRX56einBsDpVBm8Neev9hX4jwGF1guo/6mb3d?=
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cde38d75-30a4-4b7f-97da-08dd8c900d7f
X-MS-Exchange-CrossTenant-AuthSource: VI0P195MB2484.EURP195.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 11:20:48.9625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vTqpgyMoQ5lirYIMAFtAScq3SmzcQMCF3ATMndtRWJJaiPEBYkjNO+i3ur3IEdrx2Yn0VwBOsP/Ndz3jCxp/tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P195MB0560


On 5/3/25 00:03, Judith Mendez wrote:
> From: Hari Nagalla <hnagalla@ti.com>
>
> AM62A SoCs have a single R5F core in the MCU voltage domain.
> Add the R5FSS node with the child node for core0 in MCU voltage
> domain .dtsi file.
>
> Signed-off-by: Hari Nagalla <hnagalla@ti.com>
> Signed-off-by: Judith Mendez <jm@ti.com>
> Acked-by: Andrew Davis <afd@ti.com>
Tested-by: Daniel Schultz <d.schultz@phytec.de>
> ---
>   arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi | 25 ++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> index 9ed9d703ff24..ee961ced7208 100644
> --- a/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> +++ b/arch/arm64/boot/dts/ti/k3-am62a-mcu.dtsi
> @@ -174,4 +174,29 @@ mcu_mcan1: can@4e18000 {
>   		bosch,mram-cfg = <0x0 128 64 64 64 64 32 32>;
>   		status = "disabled";
>   	};
> +
> +	mcu_r5fss0: r5fss@79000000 {
> +		compatible = "ti,am62-r5fss";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x79000000 0x00 0x79000000 0x8000>,
> +			 <0x79020000 0x00 0x79020000 0x8000>;
> +		power-domains = <&k3_pds 7 TI_SCI_PD_EXCLUSIVE>;
> +		status = "disabled";
> +
> +		mcu_r5fss0_core0: r5f@79000000 {
> +			compatible = "ti,am62-r5f";
> +			reg = <0x79000000 0x00008000>,
> +			      <0x79020000 0x00008000>;
> +			reg-names = "atcm", "btcm";
> +			resets = <&k3_reset 9 1>;
> +			firmware-name = "am62a-mcu-r5f0_0-fw";
> +			ti,atcm-enable = <0>;
> +			ti,btcm-enable = <1>;
> +			ti,loczrama = <0>;
> +			ti,sci = <&dmsc>;
> +			ti,sci-dev-id = <9>;
> +			ti,sci-proc-ids = <0x03 0xff>;
> +		};
> +	};
>   };
