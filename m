Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C05216E863
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 19:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.153.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748977379; cv=fail; b=Pcy+PyAVWE4URs00x58fW3Gxv1ecyONXoNX3jrpd8L5aNk6VVWMq93tjaIEmemnjUbhtILq+wEn+w8FJGlaeHfuJ6otaNdiwQjfAy4r65c6R4GCKiKCXwrw9NE28T0o1tniB9kWX7SmLyGPjtJNDnZejZah3+PzJrS6D+qJsml0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748977379; c=relaxed/simple;
	bh=bMYVl9ConZzGUynq4SRGTu3KouXGzwb8tgQVtHyb/HE=;
	h=Message-ID:Date:From:To:Subject:Content-Type:MIME-Version; b=LrgRuPoNvI40uGtdZ9Vdm3ow6gFzk+Mlcw/Ugg6sya7A7a+y9UCqd5abKNUaUJ5ZYmJCDwa25zBzaM1q8fGdjDqm4sKUzCIy8ymWKmJQ85et5Af80q5+TEWe0c1TRc9FWnDyUrxz9iVVZcWZW5h8qKayt6/jWG1RdWUk4mErxOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b=g9lkKohN; arc=fail smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=meta.com header.i=@meta.com header.b="g9lkKohN"
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553IrIja012592;
	Tue, 3 Jun 2025 12:02:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2021-q4; bh=Ify+wjnBGpUC0GJJx1
	eH1tDiiG6+hrAdx0IqCQuHa/E=; b=g9lkKohN4sWivBz3f64MVha2dfHPAxg6lk
	SvGKKoGJB/SoIzadYLyztvg7oJNb4EboToesS6TMr5wG9I/4coEqzRQbCR3zrNBF
	/wStFX7ymiZCfbHRv6TgYe1sFrBZuDya10xW/1gwS2BO14g5VPlQJixbTqFBUAoB
	ojtuSMCa1FPBMyPBvtAlFzYrCCr55L/tl23+QwvGSxF8LNafcPX/4UZKHhGewDM4
	c/SjqGM/fOX/SaDZ+UvsK/y4VpuNERkbKMYvyZPLxIS3joOOiWnjIauCEu7uEiGa
	P5NKii+aFJjn2jimEvEtfDZVAqcFLMnMAZuI3lRc4YQo+4whhkaA==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4725gcgpq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 12:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCf9XqDcA8Ec/czdvJFfJ0mv0Jc5QV53b89iyk7g7Ay5o34Y5DzFOzuIWEW7LAgy70W+yJui1tfNnVPv2ab+XqFUXGfyBKiEWH/XjfHAGBHKbpv+AfzIX/kokLuYmbBei2vZfmWQiPkhny/VJEuyCUT3uXAsZgXdil0WvO8O6j95/xL9HYL/uNR2fWtyktnN8h2rbI9bk/i9IV6bMYYLG8zl2vf1HDBzbxsQpLnLsBfadnSurSTPhjyLlt0ElDUVlWsPYyTfoTU1tMu9B1r28mf1SYJ2CboIfdRTmihwVF0MKjeeP1EMUxCYZl9oe1gE6hWFsof6o2gKrCN6+63kDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ify+wjnBGpUC0GJJx1eH1tDiiG6+hrAdx0IqCQuHa/E=;
 b=SaWkFt8OTMBSXsn/82+zOLy0H+U0oum8MWLrV2WPdHFpa1sSzkjjNOErfVL5QgWzEAboxQQSdY+qjDJ7/F8r05NjxgcdgqumTl32tuT/tHS9cKJEs2FXZvZuxQKUeHS5DXAj3A7fOltuMSNmM5NbrpxDDWruSdIR58FCZff0pxd4YvUfc0pCsQdGpb1hERH4MbyhPinM/2lSEzcE2E1GQ9WygtaZ/dPpIjI4Yhjf8lwvD/HNLUCzdr6gMV4v3W5R6xJQLk4Td2eDIJP2bnJH/bIHWQxzWYjAvzqlUXeSwpjM8m3L03wkjKlP0n15K4TNMvAv3+YUnCT8Y3sezfKz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by BL1PR15MB5314.namprd15.prod.outlook.com (2603:10b6:208:385::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Tue, 3 Jun
 2025 19:02:40 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::595a:4648:51bc:d6e0%7]) with mapi id 15.20.8769.037; Tue, 3 Jun 2025
 19:02:40 +0000
Message-ID: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
Date: Tue, 3 Jun 2025 15:00:43 -0400
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Chris Mason <clm@meta.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org
Subject: futex performance regression from "futex: Allow automatic allocation
 of process wide futex hash"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL0PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:207:3c::30) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|BL1PR15MB5314:EE_
X-MS-Office365-Filtering-Correlation-Id: 7318b713-2bee-4f0d-b948-08dda2d13633
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aFRFRFJwSTFoWEZTdTRrMXRGRXhDcnRrTnBndUF6M0NZNWU4TU1tNmFaSFdx?=
 =?utf-8?B?VkVabmJiVTN3NmJOZEYvMFJvWlpZeXNGKzdrYUdSa09jWnpBbW1QOGZDSEFi?=
 =?utf-8?B?eWxNMXArNDNhY0UwQ0FhbzBrUzBJb242MWd2aWxMUVRINlh0QTRUY0NoTXdV?=
 =?utf-8?B?dlF1WUxzUlhYZzVmMjVxbDhoSXZEZmhuaklzRmFJdDErbGNjKzJzN2Fab0xJ?=
 =?utf-8?B?ai9XNUNwT2orMDlYWk9OaHorWDdySWpTaWsrd0RQNWcxaGM0anJIL1FzQ09Z?=
 =?utf-8?B?Wmd6RXRRMml0WGNxcnF3NkI5RmtaK0d5ZzFvZjBBUDBKWWJHeXJpaTRaSmJx?=
 =?utf-8?B?Zkh2bzZGL3htb0Vsd0x4cTM2QlZTWFlKNVgwWWtCUEFTcXBNMDVrdE9VQitX?=
 =?utf-8?B?UkJOcVozblJzU1BwM0RObUVkbk5mYzdjYktXNzNJeVNvNTh4bU0xT0JwVGZP?=
 =?utf-8?B?ZjZSZmZmSnpxNllHTkx5RDhhM0FUTDhHVm55ZUp0N2hucEpZOHRuYlRhK2RC?=
 =?utf-8?B?akhwWDd5aXpVUlJuVzZZSXRGbkxrM0lBSlMrNXJhVGRoS0RrQjFlUkw5VnJx?=
 =?utf-8?B?b2xDYTNld3l2OUY2bFVFa212QjdtTHVpb2UzSUUrWHF1amY4OHpyY2piekQ1?=
 =?utf-8?B?NEFIRE1zc1gzWlN6ZTVaczF0aUMrTkMrTTdiemhvZ2xWWmV1dHlRQ3dYTitD?=
 =?utf-8?B?SEd4d0NLQ3lST21OQkI5RHZlWjY0NzlEZGxDSXNteEkraEgvb05aL0pjVEFS?=
 =?utf-8?B?KzZYS2krc01uOFYvZGtyZ3A3aDZxTkFVWVlFdnBKQnNFd2Vza08yVUFyRTJH?=
 =?utf-8?B?Tm4rOStGa01JN0lwdFFzbERYajJ2bTlQa2l5ZzBSNUw2eEgvSDBvSHM2K2lZ?=
 =?utf-8?B?SWM5aFRRY0JWSkVrc3lEcDdtVGhNVlVNbXc1emhjaHYwWVF0WmJtU3RRc3hL?=
 =?utf-8?B?dVpWK1NaKzNDVWN2Q1cwaEM1WlVKVEFVanNuWThIOUQrTDFXbmlXZTI0Uk9I?=
 =?utf-8?B?TGJZbmFjdWY4cVFCajR5V2NUZVl3RVRLYUNvSlVhZzZFbzFXTTRicGFnc3hJ?=
 =?utf-8?B?b2h2UVNtMlYyNldmcElVVjRWWnh6V2VFd1N2MG9GUDgxd3A1WjNQMlhHZkdr?=
 =?utf-8?B?WnR4WStqTFNNd296VEFMQnVJdVAvcjJnUk9WYStlNEk1ZnN4dEoyNmhQWHpq?=
 =?utf-8?B?SHd3K1cxRUhvb09wQkFsQVRsdGVQdEFMc1lsZWpOYWRqN0hXWFEyR3JILzFF?=
 =?utf-8?B?ME8yYi9URU9KWDBDcUpOT2ordG1Uc2t3cTNNUlVhYVRxaXpObWFOckdwSW4w?=
 =?utf-8?B?VGwyZU9ocG1mdXVMWG8xa0NzZzhXWXVaYzBXUG5jY0EzcEQva211ZXRWclNr?=
 =?utf-8?B?VjdBWTdGQWJkamVaclVkMXkycUxpSUhQeDdDeEh3UmRFNFNtaXhSTVM3VTU2?=
 =?utf-8?B?b1M3TlZMVVpiU0pON2RqelN2ZkIwVWNnOHBzRW5EZjJFY0FuTWFlSExTSjFU?=
 =?utf-8?B?RWJLbGsrbHlQbjdyRGZwR0xvSGFRSS95ZXJaNkdtajVXanN2MlZvUys4YmhS?=
 =?utf-8?B?WkpRQjhWSk1ha3ZKUVBwTG12dVJTUzJzd2hlRW85ZXRUVnpYRy9ndDhVVGlG?=
 =?utf-8?B?RTNORTR2c3dCMVoyaDdvYkw1aFpHUU1ra2I1YnlyV3BGaG5Ia3AxeGF0Vm12?=
 =?utf-8?B?Q0tXOXhHcUN4cjMvbE12SDNXVUVuK3V1cVpEcnY1MTQ3Y0xHZ1ZrcEFkRm9J?=
 =?utf-8?B?cGlYbXlFNTBiUnN1QmFvYVEyMXhqQlp2cGlndEdrL1EvVTRlOGRsZjVrWEJR?=
 =?utf-8?B?NFVnaXVRRjZiSWFIYWNWY3BYMEJ4YlZWbXloMUkyRzZaU2t4eHVWNDg0Y1Nx?=
 =?utf-8?B?TDcwMEpmRkZ6SnNmVUp2MFNBbnNoVkl3enlxam9MbUsydmlzWGg0TEZHWFRQ?=
 =?utf-8?Q?8KVm5Mt6msWhjcaagkhoK1BXLgWNjIp0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR15MB6455.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1pnWk9GRGVOMkZ1Ry9VbUxBbFpkb1RsQzlWWW1QNUp6cFQ5NHU2VnQyaWlk?=
 =?utf-8?B?NExvOXhWNU1TNHU0ZnVqLy9NUFNPaGVQVSsyU3JMMWNRdzlKeGoxbzd0Zm5h?=
 =?utf-8?B?WGJRRmxCQTVvai9FLzFWY2FhT1JLSTBPL0RMZTk4WDFjWTI0SS8zWHVuZzk5?=
 =?utf-8?B?L29VcUZTRlZkS3JYa2FnalF4WTJ3NnBQTFB1cVc4L3lsZEJ2T3BuNExZUmlX?=
 =?utf-8?B?dHk1SWZXc2dTZ00xUUpOTTNQSGhLSURJMUxNcmdtdWRNa1JtK2lpd1dEZjFM?=
 =?utf-8?B?T3Q4dzY0UjFhOG43c2hsd1FPektuakg1YmZiOWNZSXJRMWZMeVpDK21jZ0lF?=
 =?utf-8?B?U2FFaU13YkpQMjQ5ODJVZkZDcGNTSndoZFhKTlZ3WjJLTXphYkdmZEpra2JE?=
 =?utf-8?B?dXZSZWE5d01zdHRMcFFXSE9ucldUc3BRdkFINm9CK0p6cGo5bXpQTGNLS201?=
 =?utf-8?B?a1U3YVFobnNVd0ljSkN1dDZPWDRVWTczSzh4QlVmMklqNTk2NGxOeGhIUmE4?=
 =?utf-8?B?WGlMMXBUVVc5c2FHSk9tbzhEYk53emllZmk1SWZNc0w4LzQwZW5zWFlZci9B?=
 =?utf-8?B?ckdHbUFPM0RXK3B0ZnJ2bUlYT0JJR0pkdjU5Yll1eis0b1ZJT1lVMzFUVDJE?=
 =?utf-8?B?VXlYaWxJWmtWNEdjbkovaFJMRjczeXFBKzFuV2RZM3YwNWwxZGk3ZWNwazIx?=
 =?utf-8?B?ZHRPRytEWlN2K3FTVEozWm8vZForQlRzVFprTFl1TW1aZENEQ2FKR0NmVDhT?=
 =?utf-8?B?bWJaN2RHRzlSRCt3T3FuQW9sS2I5cTM5L01UMlErdVVpc1R5R0l4NnpyNmx6?=
 =?utf-8?B?Z09LZWNqcU4xbHZGUmQxUkhINy9OYmtkbDJ0MjdyaWNERHJmZDlDNmhNUllh?=
 =?utf-8?B?QUNWWUlORTlXSDFtU29SeU5JSEhnN3BwNjlwZXoreXVlQjJHYzlFajJYQmJH?=
 =?utf-8?B?T0U0R1BRcGg5RzVPT3gwTCt5TlNNWjlnYm9qM2x3bmNVekVSUWllNEpUNEZI?=
 =?utf-8?B?d3dxRzkyV05leHNkR3hzRDRqUEg5UGxIY3kyQ1Y2Q3U4eFlVUnF5Vm5Ud1pW?=
 =?utf-8?B?amJGdE9QbFlJMmJ5Zm1pc0xmQUhmOFg3QkxuNnpNcllWVnFsMTUwMk9Ca09U?=
 =?utf-8?B?ZmtaTmpwM003NEE5cFBsSkFROFlzalc5ZkwvY25YMHZYWHdQMzFqMThIK3hH?=
 =?utf-8?B?Mmc2RkJjTkViWWNPMWlWZmY2NzdBVThuVXVDR0Ria3F4V3hydkFhbitweDRV?=
 =?utf-8?B?TXhhZHpCY2tKYzEvREFoZnhxMmxpdmxhK3RmenNIOXZDUXZrSHFPK0pvSHc4?=
 =?utf-8?B?TTlZM2tPMUxUMjF1dmhyanVCUUVEbldJNVV6Kyt1Sk54SVJCeGVCNlRSM0Yx?=
 =?utf-8?B?d1RHUWxISHVFV1BxM2dXc3FJMTV0QXovZnlqak44QWNJd3dFbmhxZU1QMmFm?=
 =?utf-8?B?aWhFUUx2UnFHdVdnL09PclltdmllREFTTnFJWjlmMzdUc3BFK2s2NUUzY2Vq?=
 =?utf-8?B?cTUxSGlSU211THdRb1hSYVoyWjdDRHF2MGl0ZXBWeUpWL0VFK3lPdUh5dGxC?=
 =?utf-8?B?Q1RKNG90Sys5a2VyVFZVdDVZNUFCd05CTE10bjJQNTJpUWdZak5QWDJOeVdt?=
 =?utf-8?B?N1VDVDhIbWRUOHh5RU53T1NreDhXeDkxSXN5N0dscDhSMi8vWU8rTzU5RklW?=
 =?utf-8?B?YVZJOEtsRlA5VlkzMW5hUFVLbk1RNm1aVTd5ZUR2SnlPZnNZTkhvK0d4TG9D?=
 =?utf-8?B?TUJPQ2FGeTJzYVVQY1phWTdtV0RuZEE1QmpLQnh2S1NvTWZEZTZOOWJId0pZ?=
 =?utf-8?B?UVFJZllBSDZZR3luSndPQzNuN3FnT1llb2w5Ti95YW16YktXYTRtN09hN0ZI?=
 =?utf-8?B?T1hiK1hiNDlTQXV5MmgrU3hYRnJqeThnSFowY3dPdUVydkk2Qlg2bi9WaGR6?=
 =?utf-8?B?L3UvMFc2TFB0THIxYlF5QzdObUkveE1zaEl2K3hneVFmcUhUc3J5VVY3dktM?=
 =?utf-8?B?V1hsNnZkbU5TU21UNXNwMngvbXB5ZE1XbnlLUkVSR1ZuVm82SGdpTkxUMmZs?=
 =?utf-8?B?djFnSWVNZEF4cU1LMUhudFNabzdBZkVaaWJGdzMwRXhRd1VGT2czNVJsSElk?=
 =?utf-8?Q?eyhs=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7318b713-2bee-4f0d-b948-08dda2d13633
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 19:02:39.9353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EN6L0peP9ilBrMow/22e93sz+qb2KLbte02mjR0RI86+VjrqC0xtd5lpgK/lNnJM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR15MB5314
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDE2NSBTYWx0ZWRfX8OEJQe2byXZW hq9cPwniGPriVAL7Vnh0AfMoqlt6UTbMgtvy8YeNiMbHt3IVF2Wafhmp6AeMljbqemVsG/eU1P6 K/GiIDqodygNghKOZS62s71YUvazmx0RwlXATZIjTxrS/XYrglNqfJQ024AtX30YqghZC8OeeSL
 ESQAgiDjdaGamOZM2oqsVs5PXdyKVBp6Skkjk6xhTf96kogzlwD446A/idclxiuXbkGlivQpLQF +ZREb3E08e/B98DQYzDFj2EzvIK9vlT8Tw/Gxx91u+lr1H6C8jo/kVyZhwPMywq2Yh4dY8WmRY3 CP+EHW+118yhNeVpIpDmrtds1tQo/Hy5/iFTYkmzC+j6w+Dtkt4Deouu2by2o9asLjg5FBxFLUh
 A0DGn/jqhZuXP/yxQITQq049Jyp8Jf7LQniqYW3nufN7LE81X8TIqphIxah16lAh+tMUEG7M
X-Proofpoint-GUID: iARmZPi3Z2_lpsCwWTtN39b_0R757KBs
X-Authority-Analysis: v=2.4 cv=DLWP4zNb c=1 sm=1 tr=0 ts=683f46d1 cx=c_pps a=oIGq2KA8uRSuafZxYVdIhA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=1sWoMFGueSrtZMIvD1QA:9 a=QEXdDO2ut3YA:10 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: iARmZPi3Z2_lpsCwWTtN39b_0R757KBs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_02,2025-06-02_01,2025-03-28_01

Hi everyone,

While testing Peter's latest scheduler patches against current Linus
git, I found a pretty big performance regression with schbench:

https://github.com/masoncl/schbench

The command line I was using:

schbench -L -m 4 -M auto -t 256 -n 0 -r 60 -s 0

Bisecting the problem I landed on commit:

commit 7c4f75a21f636486d2969d9b6680403ea8483539 (HEAD -> update)
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Wed Apr 16 18:29:13 2025 +0200

futex: Allow automatic allocation of process wide futex hash

Allocate a private futex hash with 16 slots if a task forks its first
thread.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link:
https://lore.kernel.org/r/20250416162921.513656-14bigeasy@linutronix.de


schbench uses one futex per thread, and the command line ends up
allocating 1024 threads, so the default bucket size used by this commit
is just too small.  Using 2048 buckets makes the problem go away.

On my big turin system, this commit slows down RPS by 36%.  But even a
VM on a skylake machine sees a 29% difference.

schbench is a microbenchmark, so grain of salt on all of this, but I
think our defaults are probably too low.

-chris

