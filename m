Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D9426AA88;
	Mon, 19 May 2025 14:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747665793; cv=fail; b=g5NczyKePpVVpnWNelBpLIJsxywOszryPCsplGcYMfLpJVkGD8YVV6Mgpon2UwWKhEeEjnL7PKeycixBACWfuV047lL2LLDFN/PyxlgihqParNnCCD/+PJExZZLNZ1ZWwx5ZgBB9+EVW5KoM8mM0EAO+A4aTUEV/S+1J8HErFIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747665793; c=relaxed/simple;
	bh=MpzeGHXdZYN8MlExSZmJqsNl2PdfF1JTmIx9X8BuxW4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jV5+WZ1rBkhAfRDmeuyF5FZpwtlNyVD1+wQHkYThFKlYxvo5LQr9i+hLv3PPvbyFgPdUk3dus3JgWCac0uqhIZUI2HNOHN9blsFMmCNjpWCW9bsorQZ9jljcXesndJDTUphDtSOkpQqdNPQYt4Tl3Ze3IZAhJ7X184ekZ4/uTLk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=lAhh1EMG; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=JFvIlF91; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lAhh1EMG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="JFvIlF91"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JEOHlI001157;
	Mon, 19 May 2025 14:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=jS8ouSyDa8YooyXkJkU4/HXaOBAAKjEIzD4NowO77p0=; b=
	lAhh1EMGwYXEt9wq/IGK955kIaOnhPDYRK0J0aLDcmIR4UfBWSytWddtlBoyJb/C
	VlwsopxVkKOIJAxRfS2NmLk0PbGOzphSLaNR51Vs1w8u1mK6JbIOVMeJRs6mop2X
	beTW0ka9FF0Hc7I8pCCSswUx92wD/v5L0upGfq+ow2LuwvDAncPLODps0RwbZB7f
	XP6z2rRpu4RarEJG8i4K3cLbIx/WzgBpgGUBVfrwwbR8G6j+U1B9dsMXTh935AAB
	H5bEHml9z9sws1FdEHkjmMjltzy/Ewj8jvdPJiodqLbDwP5zWj08S/Ks8M7gGDaT
	iZw1912hMiLyxuFuxzdKng==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46pjbcu4g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 14:42:50 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54JDZ6T3000949;
	Mon, 19 May 2025 14:42:48 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azlp17010018.outbound.protection.outlook.com [40.93.12.18])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46pgw6t4yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 14:42:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugBGcaeRhRG2PyMb4SPWGFpSXrcCSN7IRsvDnmFvHqEFnfK6UXchmKoVTDAu46IS0j6dw0NeeXg7tFHQOIocfYv+bwe+guSwz3qDzfqgU54dM9/2AohijazhuEHTIMD+CVEXCodPL6vR7gZfIClnULlR8SF554yhK2a9hJuZDKnEZkCdFWp9JWM2kVQ+4ok0hq9QaJm9hLlYx7C88KFmqRPJUIzWxCCbV9OsGNIBJKR0Y7iZlS7M3IgukD4fz4Vg+6PvB0t6sPfoYXcobpPR23d8fgS8p91NjG3k0ojM850N+hBkfK8v77t7/CcQVJLjHE4bgUJbDUqeAa6yp+IIOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jS8ouSyDa8YooyXkJkU4/HXaOBAAKjEIzD4NowO77p0=;
 b=FhICACbgtDo+GqAsmXVUv7hZdPR9+KjNV27LbKHW5RJBZG0yvgyHCWddu3yXC+nhQEgJ5tHE8VnzJ/KejydERz/488xqZuT/rVakuguT+8q/EVb2MO0GblwoTlyrcKOos5xOuIbj/38Zs6eLu+1YAdHRZCI1eYhoRtOiJLsmCOpXjiC5EDbhqnBZwF9MlSuFko8qgipSgQQmTaI0p5nfMHhqOK62TWd5Xu8erZPEQtoeTukF+sDjmvXCGFq9JxXHuQhAK5c4Qc+Ogh/ICQE0feD5KBqzt1LgMBHeLfVwv2ETfXsOB3R7BKbUS9r3m4dSthgJ235zVvG15iEVwdZv9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jS8ouSyDa8YooyXkJkU4/HXaOBAAKjEIzD4NowO77p0=;
 b=JFvIlF91vU19o3ejk73OFFLCA8yNDKlF+j/rt231+zLsbNvVNjr6u0VGQyNq5+AhW0fw9lLRKpt8XRH03L5/1nD1ug03wvxnDZ2rq2kE1FVyU1yDIHIgtQrxLKDIluDYR/HWHiT90h/cP5ox8XeWlcRyYOah6l6ZdOjL9xgcSw4=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by SJ0PR10MB4703.namprd10.prod.outlook.com (2603:10b6:a03:2d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Mon, 19 May
 2025 14:42:46 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8699.022; Mon, 19 May 2025
 14:42:46 +0000
Message-ID: <83ce3ca8-c014-4814-8c51-9f7fd5151a41@oracle.com>
Date: Mon, 19 May 2025 20:12:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: stm32: add STM32MP21 clocks and reset
 bindings
To: gabriel.fernandez@foss.st.com,
        Michael Turquette
 <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Le Bayon <nicolas.le.bayon@st.com>
References: <20250519142057.260549-1-gabriel.fernandez@foss.st.com>
 <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250519142057.260549-2-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::18) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|SJ0PR10MB4703:EE_
X-MS-Office365-Filtering-Correlation-Id: ef00b56b-f111-4c39-7661-08dd96e36b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dk51Q0NkWGwxMkozRThxNWNtRU4xWFZ0UmowTU53YngzZ1k1VHBKdWQ0OHoz?=
 =?utf-8?B?S29adEgvWGtlc2k4R2xXL2c3aytkckVJNzIyb29YRm9xdHFFYStMOUt0N1Zt?=
 =?utf-8?B?dlFxNTNkVDJ1azNPWHd3TFBpRXdMSm45MHJ2UFJzQ2tTQUY5RUF5M2Z4eE9p?=
 =?utf-8?B?WUsyVmx6Qko3ZG50WHRvUG81amxEVzRvVTFwSEVQSko4ellmalM2TFErZjN2?=
 =?utf-8?B?VmFZdGZOU3I1cVAzTHNtZzBYWThWWldZTld0SCtOdm5FdFBGdDYyQmtXaWtn?=
 =?utf-8?B?TTZwRXFSZ2lueWRXeFMxZjNIaE9TTkliekd6b0tZKzRjbUkxNjVwdjFFV1JS?=
 =?utf-8?B?TzlNRzg1am5NVFp6d1FKWThZUWFJVUlGMCtycWFYekgrUDlkR3MwajgxV3F4?=
 =?utf-8?B?THdMZnFiTHVYR3BmM3oxNFZYWUp0aGJxK0djZStwNi9zUUZ4bDVNQUMrbmhr?=
 =?utf-8?B?eXllMW1xdjdmS1hVay9ZdFNhdkpLZE9sOFNxczRsZDB4S2NJem5YaFBFTW9h?=
 =?utf-8?B?dDdhNFBuMVJ4SXZlakFjNmI2STBiMzA2TGcrL2VJYzV3Uzd2UXBkVHFnWTJT?=
 =?utf-8?B?RlFBMGwzTVA0YkVPR0tSOG94U3I1OXFxUTc4dXJRNzZWdUVqWVRXWHdEbzFD?=
 =?utf-8?B?am4vUmNEZTd5YWppOHVDMFJIVTgvRE9FODdwSk9uWm1kSFY5NmYrKzhlOTlh?=
 =?utf-8?B?OEhBYkdidGs4RUpRVkJ0Z1JxRC8vakNZSVVyMmg2V0lUM1RERGtQVVhqd0I1?=
 =?utf-8?B?L3MyZDVWMlVwZFRZbjhwd3pQRUc1QUpxSW9rNVVFSWVobTdXSm00UFhLRk15?=
 =?utf-8?B?dFl2c0g1QkNTY3ovelNLcFdzTGxJWFJhV0licHU5L3lUNTU3TFdYbEJERENW?=
 =?utf-8?B?aEQyRXRKUVp5NXVxS2xqK3RzRldlY2YvV1oyUHBPeU5lNHlkbmxKUHRzSG03?=
 =?utf-8?B?VTRVMU9mRHpsclBaZ08rSDFUVTFaZk5vWnJveENRRnVjeXNwUytKZ1ZBbkwv?=
 =?utf-8?B?VWh0bHdZa05qTGJSUWhJZU8zN1dXZUpSUDZaejl6VEt4eFQ1TlVVTUs3eVlU?=
 =?utf-8?B?NWNtdG1TSkc4TjZqM3JsYVRCSEtHQkVlY29wRE1RTk9xanAwTjdIeEp2eGkx?=
 =?utf-8?B?Mkd0STh6cEROSFZaWEt3WitkTUNVUDhIQzZEVUhaSnRzMlFMWnlOblluQmNo?=
 =?utf-8?B?OGF2UHU1NE1Mc2FBMkpmcFYvNVFwTDEybUQrbm9ybEV3RkNKWm1nRk1sYVVW?=
 =?utf-8?B?enRPUVoxVExobWpSUmlsU09GWVpKVVhKYnFuc3NaRkZpVU9LTUhOSjJ6bEZO?=
 =?utf-8?B?a0QrVHdocjhLbmI1Wk9leSt0NVpMekNTYVM0OE5EWTNidVJoM1ovUFQycU9T?=
 =?utf-8?B?ZWFQT2xrYVhuQjNnaVp4YUJsZjJEYlJodTEvNzByUDFOZFBoR0NmalRqcnla?=
 =?utf-8?B?UGhXNWZmV3U2cVpDRHlQdktodmZTUVJtaThkRmFiMWdpQXp6UkpCQ29oWU9H?=
 =?utf-8?B?VWFZYkZGTWY5T3orNVc0V1M0aVhpQmdzRHo1T0JXWTQrRHpMdi9NQjMyQTho?=
 =?utf-8?B?TGhrT1dGSGlXY3pRY245VTdiWElBQlBpSVZZWDdUc0NVcXNSMXNaSTRkNm9w?=
 =?utf-8?B?VjdqbHNBMkdOamJGaXFIcmVoMU1HTHpBRzV4dnEwdFpMa3NjdGdvTDJjOWZk?=
 =?utf-8?B?NnZQcVFEdWprL1FCVGFEUXE0ZHpUdXkxT2k1RjFmaVptY2FvOFdsZUJhM0Fi?=
 =?utf-8?B?alUzZDVBRkNnODVsUDBPQkdLdVIwL1NlUStXQlpSZzNlc1FmYW9mVkVvekJx?=
 =?utf-8?Q?lAulerc6pM86gUBpLB08IARXRerXLgx/fYpGs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDkxSUErZUxNLzZkSmUzR3QyVURLSnpHaVBtTnhSWHBhdDZwU0txK21JUHpv?=
 =?utf-8?B?dFEybHlLZVk4VnVWNzRWazR5U3lOVCt1ajNici9KN2NPQVdWRWJQaGE0bGJD?=
 =?utf-8?B?Q0R5NURPcU9uQXBDSGhGRkxpWHFsTVVJRkVJNlhIWDNweElKM3N1TVduVjVk?=
 =?utf-8?B?K1Y4cTU4R1l3VHU1eXdKdzJOSnFaL1hSYkpuaEkveWhVS1VGMk5JRUwrLy9J?=
 =?utf-8?B?ay9Ycnk2d0k5STY5YVlWYnRlWDFhWUZodEZwZDFEckNaVU1BSHdwRTc4T1F6?=
 =?utf-8?B?aVlOVlVaTDg4MW5pcHFSbE85dDB0YXNQMXY5NDRvSWxKZTYzRU0zaHpRdUFm?=
 =?utf-8?B?NDJlVXBJcXJvcUdQdlpiVVVQSlFqUitzVmFMOW5aYWVRTEdYbkY3YUY2NnhT?=
 =?utf-8?B?SDlMR1B1MThyNkVpZlRuUWQ1K0xoZHFqcmcwbVppZnQ4ajFTRVZZazZhZ2VP?=
 =?utf-8?B?cDRNWmlvMnhTWEJOQ1dxOG5nMklCN3lhMmU1cFZuOUtlTXJFempRMnBHVjhw?=
 =?utf-8?B?VnFxTFIzQjRUMUNzbTF0Um9WaVRtZWc2ZUJOZ20wYTVteTRZSnNMS0JtSVBu?=
 =?utf-8?B?U1NNL2QyY1I1SjJzNzlWVDBIQ1NTcjFNQytJcGM0Znl5TWs1OW5rTWRYTm1P?=
 =?utf-8?B?Z2hLejZuREF0elNlYWlEeWxBK2dZbXRTL0pkM2VjWGxjZ2FXdlRsOXZxSlA5?=
 =?utf-8?B?TUl5c0s4TWgxQzN1Rm4yZWtxcWpKdjNrVkxGYXdvVmpQYnpPUWFBU1doSGNV?=
 =?utf-8?B?SFl5dHh4RjlwcG9rTnVTN3NXVWJPZ3d4eGdERUhLSktQRGVDUEUvcExoWERo?=
 =?utf-8?B?ckkvYnhpbjJRMWJUcEdCWWFQNTR6a1RLbkprMVRMT1VtanYwbUlZeFZoR2Y3?=
 =?utf-8?B?YzhMT3VCNGlJOU9mVDltWGczQlF6aUFrQm5kbUttOEZGSytpVWRvR0hKTHN0?=
 =?utf-8?B?d2Q5NTQweEdlSlc5OWJCc242SUEyTmJ6RzVvMEJTYzN2UTJ0OUFQLytRd2dO?=
 =?utf-8?B?VU03STRaaERucXRobmIwVGVmVmJUaCtTVFFzejN3NkI4NGk1cmU0cHRVN2RH?=
 =?utf-8?B?ek5tR3Z6TjBUK3J3WkwxYy9jYjNnMGxUdVZYYjl3MDN5VzdxeXZ1UUlhYjB3?=
 =?utf-8?B?TytQd2N3SlhkNUsreVhOKzV6TWxoRjVsTjlTd2UvZnV1aXZsdjR5UkFzZThO?=
 =?utf-8?B?cWZUWElPSk5RM3hobENsT3o4a0dkcDVzeFQvNzc3bHpGbVowM2NIL21sSS9p?=
 =?utf-8?B?d3NRUi9RL29rN0hVQXJIWG8yQ0VOVzA2bnZrb1BSSE9NU3crRzRWcUg0cUdn?=
 =?utf-8?B?SzYzUHFRWlM5dVNxQUY5ODVBNnNqaGd0Znh3Q0pOTGtGSTMwUStGMysxbGdC?=
 =?utf-8?B?NzBQL1l3R2lPak5xRXlUT0Y2SktJZ3lSUmp6MSsrMExKeHlxZHkxQ1BPREdH?=
 =?utf-8?B?WllHQWpTcm1EdWZ2WThXS2pmUVlORTlsS2RYWSsrdlR5KzVpYW1LeFVXaWpW?=
 =?utf-8?B?YmJDMXg0eVVsWUZ0OWtZNEtSWFYvbFVvVGxOdCs2NUdLQkhtU3hVeGFQZ1pN?=
 =?utf-8?B?MXVMZE1DRk9BQzdGc2gweE5HUjNTZDMyN2phMFVoRmVFbXdnV09FaDVFcUpV?=
 =?utf-8?B?elhiSjUwN052bndSYW9HdVYvVG0wL3FTczIyTkJWQ0RXWUw0dmtqZTdYUGp3?=
 =?utf-8?B?YSsyMDJEeXc4R0RvcEdzcjBHOWxUMFlBQ1VzNWhWcGtoTDVtODFIMFp4M2g1?=
 =?utf-8?B?QTcya0hicU5kLzNuelVEb2k1ZURyRzNkNktaVzEwMC9uVE1iclVlbTI1ZVkw?=
 =?utf-8?B?RVJrWWVlUWFLS0ljYU1JaVpucTVnOFoyRkE3bmtxUHBCNmlkTzJ3bkMyRHZE?=
 =?utf-8?B?RUlKME5YSnBmNHdWZTRZMWoxSml5SUVzMnFwU2Y5SllZV2IvUlgrWnhId0Y5?=
 =?utf-8?B?OGg3d0FIbVpKNHJPL1c3RUoxSjk1bGZoWFZuR1dYSkdiR0tqNGVaTnptZGhk?=
 =?utf-8?B?Mks1MVRnRnluZGdIOEVSRGZEWkFlNHdxZnJMRlk5bDFKd2ZyUHBLUDIwYzRp?=
 =?utf-8?B?NVNGeUhHYVg1cUM3L1JGb2JpWFFkTXN4ejNXc1FhTVFTdysvakhIM0ZZZkRN?=
 =?utf-8?B?NnBWOGl2MFM3c3A2cEcyczRIcy9QL3BaSjhCWDJwRzNFSzRwQS8wbGFIZzZD?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	NW9kIxc5CbTJXHbRtAiWS4CThFfmE+sScMx+cFvgpPTjv2u+XrQRd5OpH6j3wXVi6hpmnUpaBwEsJOBywzbIlhT8xAP2jpWFSA0ncddfjMRya2OwfB0uKJkMCTjV4TWw0M4LU7jY0RlUjJxzmhCu+l+qI6qiNlGMMEAEVpQ5EfCo2rqyBzyUrnGErH0cA8Ni25VLm07j/SIzx2XnDIcsyHXY3VVLSW8Pq3/MB0NuC2UjNjm+aGmz6t8iuydpY4GT+r06vzVrqjkOavt8NnHLiHf2YAK8bovFZH3T4ZLT/ebEgSmrCRkRF2894iNtRqOEFGZi1pfzhm2phE5aTqi/DNloYopcciK/LIyDPOVAwwsaHgStnYbpkOmN5JA5VWWAD71xOvDnk6PvGhKWb3uX/5ID5bHXUzzzdUACzeauAtlZecBhUebb9yAFfflI3+NO2+0Rz5GkUWDMM1HM+gAILPcZtHD62eKPoiLvNOkVZvUK3GlTyR0s9IdHgZOSoucV4iFbF3Gu60SEJHshn3nkRdDr1E9lDL+K3eP0Dw9zB+DP5+MPdZuuRpd4GnhEv86wXMMdZU8SVsyjxGbJxLbAaw9sf7CvXliD97MJgQBxUWQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef00b56b-f111-4c39-7661-08dd96e36b5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 14:42:46.2854
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BBrKa+qp6yibGtHFqug91D4BxXuCaKoQHPdwitBAKt8ai8kBt51cKvWZifyCI/8kEj8W2EBB//t/DVKMRzer2iqytcGuCeAAecgEBRqo9DQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4703
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505190136
X-Authority-Analysis: v=2.4 cv=ec09f6EH c=1 sm=1 tr=0 ts=682b436b b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=gEfo2CItAAAA:8 a=8b9GpE9nAAAA:8 a=cByCFVr8duI--XUqhdAA:9 a=QEXdDO2ut3YA:10 a=sptkURWiP4Gy88Gu7hUp:22 a=T3LWEMljR5ZiDmsYVIUa:22 cc=ntf awl=host:14694
X-Proofpoint-GUID: Bb6pVXqWIE7VWe_hDNkb6I_wBjzUH5zx
X-Proofpoint-ORIG-GUID: Bb6pVXqWIE7VWe_hDNkb6I_wBjzUH5zx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEzNiBTYWx0ZWRfX2q7Znoh+6ZR0 keXQhrDWKvsJ2m3Va1NrFXbHVR0S8IL+ScMIYW0vWuVhPg0FkSV/Qr51jPeJjUBE6CODkeER823 WKfAGibKh4taXRrR3yX0AJA8X1FICaTOTGspo8xsQ/I/V3MQSIF11YknODzaSKTWEf3aSfPJ26A
 6/zspP/p3mowSeNrBI1SHdOtzPHQgpD7GFIEH16jxdFTHxUg2THmUuBfT7KO7Nc6f9v+b8dZzv6 J/7AtgQYdyJb1BXToJraxd+aDlGAqG/PPQlgoj9X201W9pbHhT7qbNQpAwoNTOlxvTqUbX505v1 xVam+MxEICqAVql4NC48y44FMvS7taqw2Iaw0zXQq2d7E7Qte2gRODlIFCrQBxp+MpeTdk0Dfl5
 nOhb3iDZWs+rtHObXCZ2TE5ty7//zcouCVPcjccN9hfxQAH2+0yAIQ68AkmPlRDktGRAUTTd


> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp21-rcc.yaml
> @@ -0,0 +1,200 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: https://urldefense.com/v3/__http://devicetree.org/schemas/clock/st,stm32mp21-rcc.yaml*__;Iw!!ACWV5N9M2RV99hQ!Nqfcj0yvl-cb4Mu6XFbLz7FVSHkQfpdQGRbVtM1EqANq9n_cdZZNBg-YGSqb-Nkm16LDOQ7TsRAIi2iDug6DIO8uPU0kq3E$
> +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!ACWV5N9M2RV99hQ!Nqfcj0yvl-cb4Mu6XFbLz7FVSHkQfpdQGRbVtM1EqANq9n_cdZZNBg-YGSqb-Nkm16LDOQ7TsRAIi2iDug6DIO8uLNFOSgg$
> +
> +title: STM32MP21 Reset Clock Controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The RCC hardware block is both a reset and a clock controller.
> +  RCC makes also power management (resume/supend).

typo supend

> +
> +  See also::
> +    include/dt-bindings/clock/st,stm32mp21-rcc.h
> +    include/dt-bindings/reset/st,stm32mp21-rcc.h
> +
[clip]
> +      - description: CK_SCMI_ICN_APB2 Peripheral bridge 2
> +      - description: CK_SCMI_ICN_APB3 Peripheral bridge 3
> +      - description: CK_SCMI_ICN_APB4 Peripheral bridge 4
> +      - description: CK_SCMI_ICN_APB5 Peripheral bridge 5
> +      - description: CK_SCMI_ICN_APBDBG Peripheral bridge for degub

typo degub

> +      - description: CK_SCMI_TIMG1 Peripheral bridge for timer1
> +      - description: CK_SCMI_TIMG2 Peripheral bridge for timer2

Thanks,
Alok
