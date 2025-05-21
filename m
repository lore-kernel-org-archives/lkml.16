Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB22238173;
	Wed, 21 May 2025 09:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747820106; cv=fail; b=ssgEjxi4VoFQjaDs1oxxwt8wNJ3OL21Mmj1YyhIAsY3tVvA5s1smX9cl7H9nzSxW37bIRZGpSWwdIfwwUdTDDWpCzbJ3hX1LHnIet00GWpE5SOoO6XrZpfXIDAvbQp/pVChttw0c+P8F0NmJZfIywwjNJrkD/DENI8EiBkbDUKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747820106; c=relaxed/simple;
	bh=p2zymYfaYMtH6du/q9gCbBW3laiW3zjnrauzpULi9ig=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VKtjq3FYKwH5KMZyLVjBxWXk87PP35nVrp0FkAJoXyej+3m4Zc3YwYCvpGTUB0LQFrqo0X7s6hqX+mVPOtIxG4hRfB+zuj2o+1/34m/oePDBYFs5WLaT7u3coeK5Hqr2ZkBWnKeIHe0jiv5K1+eEwuxJGvgHi3A3Df4b2TYVV8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=OoKX7WXq; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Hh5PMEI9; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="OoKX7WXq";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Hh5PMEI9"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L8EHZ5027798;
	Wed, 21 May 2025 09:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=I1Ipjjt1ThrDcgGH+zXPow7O4HR7IyboP/OsmZQ31uw=; b=
	OoKX7WXqSqH03dLkDCD/eE9Eftz740kHoPywMteqwl5FaW0EpT9pkqtdEqVnEf8s
	1K2t3fEr1BlfkIqb4JBI3dmQmZHTAwRuvNGPXYnD+T0l1JTnWcua22v5hrv4OcoT
	SE+Oyw+Fk+kt+xfcEPG1j6SqDrvWWaRqVQZ4lDG1v3/E72FWzNGnFyKftFd5ksCy
	MmOnHeamgelmh0hD70KhIq9zkuuv6hEsfHyvWTi99C4URKJfWVEi6uBBDgUnaQUt
	/SWIUN3dkXSHpImN57diNGAWEGyi6ZtUB2hR4svno+z2Xa0x8aeJUT01H+ATruG9
	7nsrqjgdVCpOD4DYuMQ+fg==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46saya05pv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 09:34:16 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54L9Vnlf020218;
	Wed, 21 May 2025 09:34:15 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2081.outbound.protection.outlook.com [40.107.93.81])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46rwetkxdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 May 2025 09:34:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xr0hpgALGT4gBkTcZXqm7W0OGcfPVSO6IZv6nDJaFBunLq10koZ4P+YaoiqE3cPBOq/6kRSrwMIq6FyWuP6LZXspESkku7Xhlmy2SWCHE8RbvcJ3dM8enssiBquGNm/avFbAx1CykqItWrD0PAHvWmavPsyYhBreFxXJyFWBhnN/mZFjXOooSTdqhIiH8Piy0amPNf+VpNuqeb/Ps5w/kfvS3LaPx7tZ8DojqR40Lp948FTWlc3U+bZ5xWLYPBVzN3qNBUnWllTf8iYGNScY2xD2l7OAaFq/VCjSzemkYSteGo7Qxy3m2+qFrSZK0oiwp8CNqWTQAf9xDtGqxMfxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1Ipjjt1ThrDcgGH+zXPow7O4HR7IyboP/OsmZQ31uw=;
 b=LigsW0PjhAhH18PvJild4eFSGGDXxZY/T2hIM62oAM5hJQIIq/y3zzLVORffzG+X7A/sKaLarJICDOvnpgvMc4O8hdV0X4pvWLykkcVxYz1TLRAdKBAJFoKqMqb10betL2SV/AtvgI7dGO/yhZKYwO/09a6v15wLl14Is7GC8Oih7VkaTCXD503odmgoObsWMrzTib5sxf1EICFXQAxEVA2dTAajAN3zYewisFQ2p3ImGQCku66pefqaJwlUr9emRVfIYd5//ttkIHKuwS1oxfSGEeiUQlerDi//D1wHs+retg7o3wO7iYkTAV43yfJw4tAQkNhXXnpFgY8Fp8MLvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1Ipjjt1ThrDcgGH+zXPow7O4HR7IyboP/OsmZQ31uw=;
 b=Hh5PMEI939SOqry3MaYb0bcuEqIZNeMg6Kf/OEekzGRYWFTSklUc7qXwMoxsFqgvq2/06Px1HdVxeLcuSCN8jCnVwUFa2EsD9Yq2hdC2DeUbFTxcKH3dLIx8mt2nSEOlUcODchyhCLpv4X1A8yYIc0UahZ5xtV8UMcP3h+XYAUM=
Received: from DS7PR10MB5328.namprd10.prod.outlook.com (2603:10b6:5:3a6::12)
 by CH3PR10MB7530.namprd10.prod.outlook.com (2603:10b6:610:155::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 09:34:12 +0000
Received: from DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c]) by DS7PR10MB5328.namprd10.prod.outlook.com
 ([fe80::ea13:c6c1:9956:b29c%2]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 09:34:11 +0000
Message-ID: <1dd1f372-3a4c-4763-8c3b-d77ac1b36660@oracle.com>
Date: Wed, 21 May 2025 15:03:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] clk: stm32: introduce clocks for STM32MP21
 platform
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
References: <20250520-upstream_rcc_mp21-v2-0-3c776a6e5862@foss.st.com>
 <20250520-upstream_rcc_mp21-v2-2-3c776a6e5862@foss.st.com>
Content-Language: en-US
From: ALOK TIWARI <alok.a.tiwari@oracle.com>
In-Reply-To: <20250520-upstream_rcc_mp21-v2-2-3c776a6e5862@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To DS7PR10MB5328.namprd10.prod.outlook.com
 (2603:10b6:5:3a6::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR10MB5328:EE_|CH3PR10MB7530:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b8c9f32-33a7-4b88-e87e-08dd984aa469
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?T3VaMTdxaDAybjFzU0VlSkU4TVl4YmFzZjNPNXJTZzNJRFVYbG1WRWVjNWM0?=
 =?utf-8?B?YVVSM1o5N2EwbnBpZTVBU3Vhdm9nVlA2Q21nU0phSldFWVJJajlzQ3RiOW1K?=
 =?utf-8?B?TnlwcXlDdVBpRHdaNnczNis0L0NtM1Q5a2ZKSi8vbTREaXJyQVlBazVMQ2Jq?=
 =?utf-8?B?NCtqazJEQ0twY2JtcU9oSm12Y0I0c0NZQ1pGUkdMV2U4WUpnTCszRjFkTnJN?=
 =?utf-8?B?b1hzdkpucUxNU00rbjR5UDRCQmF0VVJURmhaZ1pKVFE4LzVidDczOXFvL3Y0?=
 =?utf-8?B?NmhZOFk1dndrRnN2ZGpyMng1cm00Nmg4QTVoM0p0bEcyeEVZOHRNSlpYVEVS?=
 =?utf-8?B?Tk81b005NSs5WnVnem5ETERkcjdUQmh2Tkd4a3ZWUnBJcG1ZbHlkY3RwcFFz?=
 =?utf-8?B?M3lWdm50OHM3RGlwREZMUjdmSVZLbWtJU2Q1eXozTHhVYlNHVXVVek5nb0xP?=
 =?utf-8?B?VHVoRFB0ZFA5blVybXVUN1ZNLzdocEo1RmhHWm55ZjltSGNNaW1TM3lxb3Ro?=
 =?utf-8?B?a241VTRxbFJEVHphcXBrWjFmYjBaMktSR0RBQ1F0SXl3SXVKZThwRGliUVFQ?=
 =?utf-8?B?TGZlNE1pM0RNWkRYbVY3TFQrQ2VtUXFVbHhnTTBiV2VJWDcrSjZUSjVCT25W?=
 =?utf-8?B?Z01MQ0h3Qnp6VDk2cDNoa2VRazhtTmZXcjlpZHRqbk1WMXU0UUkxTHMxUjZ2?=
 =?utf-8?B?c1lrMGJOL3hTNm9CaVBlNTVrV2s1YXRzMVBGbWl0T1VFUVRqVkRuZGZWanRt?=
 =?utf-8?B?enhGTkc5RG5uQS82a1dXM3NjeXk2RjQrUkZ4eExMU0hoODFyVXUxV1FYaDFq?=
 =?utf-8?B?ZFFxOWZTbjF5cEwvbTAvZG54QmoyTkorRHF3VEVlajVTMTVXbW9WZ0w5b0M4?=
 =?utf-8?B?M1B4MTJjOGNMT3RyMEQ0QktvbGlzMG9pd1VPcGZuTW9UbEx2bFJUQjkxQ1lO?=
 =?utf-8?B?ZSsxaEhqTlFpakV0UlNKNkYyc0hhdkVxTnF5R3NRdGtZaTN1OXh4ZVYvdzRE?=
 =?utf-8?B?RVFJbkV3WFdOTjN6YXJ1emRmaFhsZzA2bGMxV2hXMEdqOXhhMWp2N3FGUjYy?=
 =?utf-8?B?aC9iR21xU2Yra3ZlSHBwd05RNHlLZDdXdVFKZGhxUmNZWnZSMG5ZNDZiekZV?=
 =?utf-8?B?ZnlmUmpna01EN3JnT1dkdTZ3ZTlxcXljbkNzZEx2NzJZN3BVTFpuWmtWN1V6?=
 =?utf-8?B?TlBvamlqNytocHM1SFlSakhydGkrbWg1MlM5aHVNQkF3QWdHY1UrOU9CRUx1?=
 =?utf-8?B?QzJ0czZWUWRYcUh6RWx4Znd5UjJjNGFzVzBEL3BVV0t3OS9tMUFFWHNJVjRW?=
 =?utf-8?B?MjFsdytnM0dFbkxFTjdMaitiMkJUdE85MWROb3o2RHRnTFdJNnNYN2ZZa3dR?=
 =?utf-8?B?MDZ5M3RMK0t6REVrcnpYWjhYcnREQmdnQWdpTVJHRnY3aU0zb1lPaG1pbWEr?=
 =?utf-8?B?RGNFL0dOUHgveDdXbG13bEhPS3hrS0JLZGwwVmdSMzNZWWdxM29IdTVvOGlo?=
 =?utf-8?B?ZjRoTDlDK1V0T21yK0I4U1FYSWV6VjExVXVHK3AwS3gwcTB3UThtbGo4VW9l?=
 =?utf-8?B?aHN1bEFiemtiem5sRXcxWldkZThxMjBLSHFYNjFYdmtwdk1HVDJlbVE2VUlt?=
 =?utf-8?B?ZmZMTUt5K2xGemNWcURHZ0ZtODd4VlpOU0JLdHZBSjErYVlya0tteWV6VXRH?=
 =?utf-8?B?NUtsQnRrc2NOV1BPWkNFR21yMlNhWmdWdDZjeVhYMlFFNUxXTGo1aGc5R2d4?=
 =?utf-8?B?OTZYTmN4NkFyZTV3SjVkcmFUbGNCK2Z2OUtIVjl1dk0xOGhoSnV1WjdUUGFV?=
 =?utf-8?B?L0tpYWdsbVJyako5Vko4MHNGaEZJeXJaODkwZ2lheDdacTkwdjk4cUt3YkVh?=
 =?utf-8?B?R3puMGhIekJUUGNpeWNaZEV6cnlUR2RuRDE0NzQzc2NHNEE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR10MB5328.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWN2eE5TMld1cFVxTUVqeERJeU5qQTdLN25teDA4cDUxL2szUCtHd2Qzd1dO?=
 =?utf-8?B?ZXJFbEZieEdhOTEwallzaWV3OTA4Zms2SlFkZ1VuMHZ2aFNPRy95RWRrRjRi?=
 =?utf-8?B?K3NXNWF4aWZSWlJTVmtFVTNzTjA0U3dWVi9Ld20zcUJJd2t1cVRZei9xbm1N?=
 =?utf-8?B?YjJQb1M0TW1vOUxFV3N4c1hHQ1R1bGNLVHhiNWM2SGI2Zmg1M3RLaW9oTTY2?=
 =?utf-8?B?Z2FSazYvSFlTWHh1SGRrbk14N0ZXMENKdlNlTXM2MVU3eEgvSUhFNmM2dS9X?=
 =?utf-8?B?Q0trbVBqUnBwYzFadUZLbUdkbUZ5OGZwQ0hBaDBEQXlFTVRGVDdWM29SdjB0?=
 =?utf-8?B?bkp5S2xiOWxhR1EyVmpSLzFqVG1Pc3RUTHdEOEd5RzFkK2VOcTd0Zm9CZkNk?=
 =?utf-8?B?OHFJV1l6Ti9mWXE2WkwxZnZSWnF2c2gwWXFYZkYvbFlTS2lqbElFRVBpOGcx?=
 =?utf-8?B?QTdXUGdpc1YyRjJzYXVIT3hGWTU5ajhPWklUdGR4MHdwd2g3aFBrK2ZjelJz?=
 =?utf-8?B?M1lYTjJNUFlLTUpEU0lrOW5McGl3Q2hxT0t3WE11ZVdRNDdCUnczc0pxZVov?=
 =?utf-8?B?ZDJuN2R5ZUVVR3lVZzFKMVhSL1pGSjlQRmxMS1FJeVpaR3ZaY2QreWRwSlN1?=
 =?utf-8?B?NUNNUndod1VHSndCcnpjVGR1elpRU05LbEk5MUdTSXRiUjFpZjQ4NFhvdVVh?=
 =?utf-8?B?eWRwOU9INjVIZjIrbVdGWUZvZXZ4bVJpSk5vMWsweTh4R094Y01xTjBFZDJI?=
 =?utf-8?B?TlNsVWFrY1RRRXJUWFJqRXZZU2E3TzVneXo4MjM5eWx4TmFma1NqdzVET3Jh?=
 =?utf-8?B?RWMyai83R2x5ZTlpTHl3RDRHRHJib05pS2hTcEhFL0ppMTFJNTBrYmNtWG9x?=
 =?utf-8?B?YTJDRkZkRXF0SC9HWlZMeUJWMWRKdTIwY2tjQlB6aS9iV084UHNwMnhBZnl6?=
 =?utf-8?B?VnVvVk1MKzBZYVprNEV1Nmo5ZmpMMEc2VEVFRGhybWVZeGcrV3RTcFphNnlQ?=
 =?utf-8?B?YzAvZ01nVDRkbTNpankwajBNV3JUYnBlQ3lHUThYWENpS3VrSkRBNHFGaWpn?=
 =?utf-8?B?SDU5SVhZaldZZWVQeFZoaW54UGRnNEdmWEtZWmJDTXVXQTk4V1hSZTNNVnkr?=
 =?utf-8?B?Q1lFdno3SGJTMDJrU0hUSkdIa21wWDAxY0svV3dJamFMbWdlc3IyTTA4MDZs?=
 =?utf-8?B?Nmlob3Y3bWtUWUV3VmZIakttSTlhY01WRHZCNEgyajVrMzZsR3ZocmYvUGww?=
 =?utf-8?B?TUhsRVpzSDQ2eFI4djZXeHNpZWdGVmVRY2lDdTRpUmFXVHd4YStwbDdRWFp4?=
 =?utf-8?B?amtXVlRWNmMycWZ5VlRhY2M2cjJCSUFHYnpUaFdoWm1nbHJCRS9lZkgyQTBj?=
 =?utf-8?B?UHJYN2RHNG1VZ1psK0MyYzcwdndNVEtKUnhnSVFwaHBQRzRPbUNRSWI1L0RS?=
 =?utf-8?B?S3BsVmdlVFlRYWk1SFk1US84cFlXS2tMQXMwek51NmZFNGg3UmMvTmU1ZDBi?=
 =?utf-8?B?bi9XcFQwTk16ZUczOWpna2VJQ3B6cTM4NmhYR3lvYW93TGt3TFc4V294ZVFt?=
 =?utf-8?B?cGhHbDYzMHdlQ1NsMldKOHFoQW05QmR2ZjczeXRHRFRHcVJPSXU3OVY3K0lQ?=
 =?utf-8?B?REE1WDNPVnFkRStObHdFOFNVMnBpL3M4aWZPaHpJQUxuWXRTQTZlejY5WWRo?=
 =?utf-8?B?M3piSnJrZWhHT0JyaE5ySmtyUk1rVVlCek1LTGZHMkk2Q1plN1g5cnRGdS8z?=
 =?utf-8?B?MnB0elJ2VXo2eCt4Ny9aOWNDMXpZSGo2VDg1VU1ScjBjbTRQN1hrMHhhT0d1?=
 =?utf-8?B?eTBJRjZKb05ZRHE0UHNMdzFUd1BldExXeU9IUStmNHR0Ty93UmRiNTh5TnE0?=
 =?utf-8?B?YjlmWWw4NzkrUm9aQzlLUXJYZkUxQllaZnBOZnFTblFQRWxPNm5janRrSXA5?=
 =?utf-8?B?aVVwaldrVGttM2NvajBTbE1uc04yVlUwRE1yVWppZ0hDYzhFVDlZQTcrUDUr?=
 =?utf-8?B?T3AwdUc4cklTNXg1VGpVZDF5a1orbzI3SWZ2d1NFa1ZqVEZROTl2My8zM0tY?=
 =?utf-8?B?RkRlZzhYcHVnRDFiNzVORnR1T0NjV3o5WGVzcE9iU28yZnFsb214MVhYLzl0?=
 =?utf-8?B?cWJWd1V6MGd2NXB4eHZFYmpwRzRFSUQxNUs3eUxqZVpJQlFDTGJLM01BdXpN?=
 =?utf-8?B?ZEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OV3nuntbqxtUkFce1sDzsIJyxVAs5srrg0Lo0iX/nfbGe+ZLS84yJGpeBA9/PR86YnYpU6L4usBJB5rkyDVp9qzuHnYMzDLAniz0w986q+2poOjOJKFJwBQPzBH75Rr8h7AXo2wo8n3J/PLKsSPfDGQAj1ou5xnDbahifxmy8tchfpQnUBpjQJFx45p2s86ZONAfRQfSgm5LVuKMx0SK1SrJdVEUWgIqKjElhEtHfCUnxiRyJ4YwUdSuk8+IAmyKDKQB3yo5QoJQSFqcPea1/hXnEZt0AR3NVBKQ6HwZ7pgUp7LAmGmI+4imkmJ/cHX7WbA118WHhTKUaMXuiahpWYECnrRBvspF/NeUgvb0iW/6oVTy0G33G1iG+mYThDDkrnyXa0Zo7qlrIsWCMJa7/vygom8U0RbHMa4V7Nh+V+HmtRN9SBtzi6ZOmEb8DRU58yDDosCCSI62QvVHdHxHuXgwNU2ohJY/ofxw7Aq5nw0jQJGTeEeb5YNBies5JfcMeiIXJ/lDRxjNjiFoaSD6X9t/t1Vef9jKdxqzZOmn6YpJqmMaycx1vzD9YDysde9UWN0cHF0q/GeFOp6KtSBjzrVYV9mn0BISDLdljyn/NEQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b8c9f32-33a7-4b88-e87e-08dd984aa469
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB5328.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 09:34:11.5875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t01bNZeH2ocuVBK67S62DBtykYHROSZ1cepJWtAcb13oXHqY73OnNDrnNufCo4VDX01VjVN1SCUFFip/CHcWcqyMFW5K5nUP3UcRHPrefIM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7530
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_02,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2505210094
X-Proofpoint-ORIG-GUID: wsThvdF_Am7xPhtatEehsufikb0Biz_l
X-Authority-Analysis: v=2.4 cv=deWA3WXe c=1 sm=1 tr=0 ts=682d9e18 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=8b9GpE9nAAAA:8 a=Hv1789SJC8wgBgxPX68A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22 cc=ntf awl=host:13207
X-Proofpoint-GUID: wsThvdF_Am7xPhtatEehsufikb0Biz_l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDA5MyBTYWx0ZWRfX6KbhmWeh9aLK scmn8scGIB/143gT7WKpFQcpCJM5wbi+YtWDgb/2h0noro+V0Z6IWo4JyRY2NZZGj9EUCsOKOrv VxuXTPJidjQ1cpzu6rmBhpTAgRqb02oGJOc2nkv840N4Z3LARj0nDDcaskqiLeEqzFO5GAK5VXB
 XfVLDj7+dQdNQ+UXcViQMYk1OUsH3Y+Dtz9A7PXGu/wLnLrgxkhEOonstjtTOq0+VnoDCALM3wB Xp9p1wVw6QWfBi5k8wpF+69scZ9eYsH0tD2nFlik6a1v+b91TW3L3LHWTJ9WPU3DsR2LtEouKto kTQx5yAWSanWSIdp4gmbZI0jq/mdR5d1hxjjnKdoN620YXEwoY38W09UwE6w4NragEojcTir7wc
 R4TepiFzYXQ/bUibbvD/aJy9bKFFv+gH3DlXuKQ3qG1VdAasKnTUp+sZDsn1KkkvTykJyM23



On 20-05-2025 20:58, Gabriel Fernandez wrote:
> This driver is intended for the STM32MP21 clock family.
> 
> Signed-off-by: Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
[snip]
> +
> +enum enum_mux_cfg {
> +	MUX_ADC1,
> +	MUX_ADC2,
> +	MUX_DTS,
> +	MUX_MCO1,
> +	MUX_MCO2,
> +	MUX_USB2PHY1,
> +	MUX_USB2PHY2,
> +	MUX_NB
> +};
> +
> +#define MUX_CFG(id, _offset, _shift, _witdh)	\
> +	[id] = {				\
> +		.offset		= (_offset),	\
> +		.shift		= (_shift),	\
> +		.width		= (_witdh),	\
> +	}

typo _witdh -> _width

> +
> +static const struct stm32_mux_cfg stm32mp21_muxes[MUX_NB] = {
> +	MUX_CFG(MUX_ADC1,		RCC_ADC1CFGR,		12,	1),
> +	MUX_CFG(MUX_ADC2,		RCC_ADC2CFGR,		12,	2),
> +	MUX_CFG(MUX_DTS,		RCC_DTSCFGR,		12,	2),
> +	MUX_CFG(MUX_MCO1,		RCC_MCO1CFGR,		0,	1),
> +	MUX_CFG(MUX_MCO2,		RCC_MCO2CFGR,		0,	1),
> +	MUX_CFG(MUX_USB2PHY1,		RCC_USB2PHY1CFGR,	15,	1),
> +	MUX_CFG(MUX_USB2PHY2,		RCC_USB2PHY2CFGR,	15,	1),
> +};
> +
> +enum enum_gate_cfg {
> +	GATE_ADC1,
> +	GATE_ADC2,
> +	GATE_CRC,
> +	GATE_CRYP1,
> +	GATE_CRYP2,
> +	GATE_CSI,
> +	GATE_DCMIPP,
> +	GATE_DCMIPSSI,
> +	GATE_DDRPERFM,
> +	GATE_DTS,
> +	GATE_ETH1,
> +	GATE_ETH1MAC,
> +	GATE_ETH1RX,
> +	GATE_ETH1STP,
> +	GATE_ETH1TX,
> +	GATE_ETH2,
> +	GATE_ETH2MAC,
> +	GATE_ETH2RX,
> +	GATE_ETH2STP,
> +	GATE_ETH2TX,
> +	GATE_FDCAN,
> +	GATE_HASH1,
> +	GATE_HASH2,
> +	GATE_HDP,
> +	GATE_I2C1,
> +	GATE_I2C2,
> +	GATE_I2C3,
> +	GATE_I3C1,
> +	GATE_I3C2,
> +	GATE_I3C3,
> +	GATE_IWDG1,
> +	GATE_IWDG2,
> +	GATE_IWDG3,
> +	GATE_IWDG4,
> +	GATE_LPTIM1,
> +	GATE_LPTIM2,
> +	GATE_LPTIM3,
> +	GATE_LPTIM4,
> +	GATE_LPTIM5,
> +	GATE_LPUART1,
> +	GATE_LTDC,
> +	GATE_MCO1,
> +	GATE_MCO2,
> +	GATE_MDF1,
> +	GATE_OTG,
> +	GATE_PKA,
> +	GATE_RNG1,
> +	GATE_RNG2,
> +	GATE_SAES,
> +	GATE_SAI1,
> +	GATE_SAI2,
> +	GATE_SAI3,
> +	GATE_SAI4,
> +	GATE_SDMMC1,
> +	GATE_SDMMC2,
> +	GATE_SDMMC3,
> +	GATE_SERC,
> +	GATE_SPDIFRX,
> +	GATE_SPI1,
> +	GATE_SPI2,
> +	GATE_SPI3,
> +	GATE_SPI4,
> +	GATE_SPI5,
> +	GATE_SPI6,
> +	GATE_TIM1,
> +	GATE_TIM10,
> +	GATE_TIM11,
> +	GATE_TIM12,
> +	GATE_TIM13,
> +	GATE_TIM14,
> +	GATE_TIM15,
> +	GATE_TIM16,
> +	GATE_TIM17,
> +	GATE_TIM2,
> +	GATE_TIM3,
> +	GATE_TIM4,
> +	GATE_TIM5,
> +	GATE_TIM6,
> +	GATE_TIM7,
> +	GATE_TIM8,
> +	GATE_UART4,
> +	GATE_UART5,
> +	GATE_UART7,
> +	GATE_USART1,
> +	GATE_USART2,
> +	GATE_USART3,
> +	GATE_USART6,
> +	GATE_USB2PHY1,
> +	GATE_USB2PHY2,
> +	GATE_USBH,
> +	GATE_VREF,
> +	GATE_WWDG1,
> +	GATE_NB
> +};
> +
> +#define GATE_CFG(id, _offset, _bit_idx, _offset_clr)	\
> +	[id] = {					\
> +		.offset		= (_offset),		\
> +		.bit_idx	= (_bit_idx),		\
> +		.set_clr	= (_offset_clr),	\
> +	}
> +
> +static const struct stm32_gate_cfg stm32mp21_gates[GATE_NB] = {
> +	GATE_CFG(GATE_ADC1,		RCC_ADC1CFGR,		1,	0),
> +	GATE_CFG(GATE_ADC2,		RCC_ADC2CFGR,		1,	0),
> +	GATE_CFG(GATE_CRC,		RCC_CRCCFGR,		1,	0),
> +	GATE_CFG(GATE_CRYP1,		RCC_CRYP1CFGR,		1,	0),
> +	GATE_CFG(GATE_CRYP2,		RCC_CRYP2CFGR,		1,	0),
> +	GATE_CFG(GATE_CSI,		RCC_CSICFGR,		1,	0),
> +	GATE_CFG(GATE_DCMIPP,		RCC_DCMIPPCFGR,		1,	0),
> +	GATE_CFG(GATE_DCMIPSSI,		RCC_DCMIPSSICFGR,	1,	0),
> +	GATE_CFG(GATE_DDRPERFM,		RCC_DDRPERFMCFGR,	1,	0),
> +	GATE_CFG(GATE_DTS,		RCC_DTSCFGR,		1,	0),
> +	GATE_CFG(GATE_ETH1,		RCC_ETH1CFGR,		5,	0),
> +	GATE_CFG(GATE_ETH1MAC,		RCC_ETH1CFGR,		1,	0),
> +	GATE_CFG(GATE_ETH1RX,		RCC_ETH1CFGR,		10,	0),
> +	GATE_CFG(GATE_ETH1STP,		RCC_ETH1CFGR,		4,	0),
> +	GATE_CFG(GATE_ETH1TX,		RCC_ETH1CFGR,		8,	0),
> +	GATE_CFG(GATE_ETH2,		RCC_ETH2CFGR,		5,	0),
> +	GATE_CFG(GATE_ETH2MAC,		RCC_ETH2CFGR,		1,	0),
> +	GATE_CFG(GATE_ETH2RX,		RCC_ETH2CFGR,		10,	0),
> +	GATE_CFG(GATE_ETH2STP,		RCC_ETH2CFGR,		4,	0),
> +	GATE_CFG(GATE_ETH2TX,		RCC_ETH2CFGR,		8,	0),
> +	GATE_CFG(GATE_FDCAN,		RCC_FDCANCFGR,		1,	0),
> +	GATE_CFG(GATE_HASH1,		RCC_HASH1CFGR,		1,	0),
> +	GATE_CFG(GATE_HASH2,		RCC_HASH2CFGR,		1,	0),
> +	GATE_CFG(GATE_HDP,		RCC_HDPCFGR,		1,	0),
> +	GATE_CFG(GATE_I2C1,		RCC_I2C1CFGR,		1,	0),
> +	GATE_CFG(GATE_I2C2,		RCC_I2C2CFGR,		1,	0),
> +	GATE_CFG(GATE_I2C3,		RCC_I2C3CFGR,		1,	0),
> +	GATE_CFG(GATE_I3C1,		RCC_I3C1CFGR,		1,	0),
> +	GATE_CFG(GATE_I3C2,		RCC_I3C2CFGR,		1,	0),
> +	GATE_CFG(GATE_I3C3,		RCC_I3C3CFGR,		1,	0),
> +	GATE_CFG(GATE_IWDG1,		RCC_IWDG1CFGR,		1,	0),
> +	GATE_CFG(GATE_IWDG2,		RCC_IWDG2CFGR,		1,	0),
> +	GATE_CFG(GATE_IWDG3,		RCC_IWDG3CFGR,		1,	0),
> +	GATE_CFG(GATE_IWDG4,		RCC_IWDG4CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM1,		RCC_LPTIM1CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM2,		RCC_LPTIM2CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM3,		RCC_LPTIM3CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM4,		RCC_LPTIM4CFGR,		1,	0),
> +	GATE_CFG(GATE_LPTIM5,		RCC_LPTIM5CFGR,		1,	0),
> +	GATE_CFG(GATE_LPUART1,		RCC_LPUART1CFGR,	1,	0),
> +	GATE_CFG(GATE_LTDC,		RCC_LTDCCFGR,		1,	0),
> +	GATE_CFG(GATE_MCO1,		RCC_MCO1CFGR,		8,	0),
> +	GATE_CFG(GATE_MCO2,		RCC_MCO2CFGR,		8,	0),
> +	GATE_CFG(GATE_MDF1,		RCC_MDF1CFGR,		1,	0),
> +	GATE_CFG(GATE_OTG,		RCC_OTGCFGR,		1,	0),
> +	GATE_CFG(GATE_PKA,		RCC_PKACFGR,		1,	0),
> +	GATE_CFG(GATE_RNG1,		RCC_RNG1CFGR,		1,	0),
> +	GATE_CFG(GATE_RNG2,		RCC_RNG2CFGR,		1,	0),
> +	GATE_CFG(GATE_SAES,		RCC_SAESCFGR,		1,	0),
> +	GATE_CFG(GATE_SAI1,		RCC_SAI1CFGR,		1,	0),
> +	GATE_CFG(GATE_SAI2,		RCC_SAI2CFGR,		1,	0),
> +	GATE_CFG(GATE_SAI3,		RCC_SAI3CFGR,		1,	0),
> +	GATE_CFG(GATE_SAI4,		RCC_SAI4CFGR,		1,	0),
> +	GATE_CFG(GATE_SDMMC1,		RCC_SDMMC1CFGR,		1,	0),
> +	GATE_CFG(GATE_SDMMC2,		RCC_SDMMC2CFGR,		1,	0),
> +	GATE_CFG(GATE_SDMMC3,		RCC_SDMMC3CFGR,		1,	0),
> +	GATE_CFG(GATE_SERC,		RCC_SERCCFGR,		1,	0),
> +	GATE_CFG(GATE_SPDIFRX,		RCC_SPDIFRXCFGR,	1,	0),
> +	GATE_CFG(GATE_SPI1,		RCC_SPI1CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI2,		RCC_SPI2CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI3,		RCC_SPI3CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI4,		RCC_SPI4CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI5,		RCC_SPI5CFGR,		1,	0),
> +	GATE_CFG(GATE_SPI6,		RCC_SPI6CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM1,		RCC_TIM1CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM10,		RCC_TIM10CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM11,		RCC_TIM11CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM12,		RCC_TIM12CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM13,		RCC_TIM13CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM14,		RCC_TIM14CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM15,		RCC_TIM15CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM16,		RCC_TIM16CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM17,		RCC_TIM17CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM2,		RCC_TIM2CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM3,		RCC_TIM3CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM4,		RCC_TIM4CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM5,		RCC_TIM5CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM6,		RCC_TIM6CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM7,		RCC_TIM7CFGR,		1,	0),
> +	GATE_CFG(GATE_TIM8,		RCC_TIM8CFGR,		1,	0),
> +	GATE_CFG(GATE_UART4,		RCC_UART4CFGR,		1,	0),
> +	GATE_CFG(GATE_UART5,		RCC_UART5CFGR,		1,	0),
> +	GATE_CFG(GATE_UART7,		RCC_UART7CFGR,		1,	0),
> +	GATE_CFG(GATE_USART1,		RCC_USART1CFGR,		1,	0),
> +	GATE_CFG(GATE_USART2,		RCC_USART2CFGR,		1,	0),
> +	GATE_CFG(GATE_USART3,		RCC_USART3CFGR,		1,	0),
> +	GATE_CFG(GATE_USART6,		RCC_USART6CFGR,		1,	0),
> +	GATE_CFG(GATE_USB2PHY1,		RCC_USB2PHY1CFGR,	1,	0),
> +	GATE_CFG(GATE_USB2PHY2,		RCC_USB2PHY2CFGR,	1,	0),
> +	GATE_CFG(GATE_USBH,		RCC_USBHCFGR,		1,	0),
> +	GATE_CFG(GATE_VREF,		RCC_VREFCFGR,		1,	0),
> +	GATE_CFG(GATE_WWDG1,		RCC_WWDG1CFGR,		1,	0),
> +};
> +
> +#define CLK_HW_INIT_INDEX(_name, _parent, _ops, _flags)		\
> +	(&(struct clk_init_data) {					\
> +		.flags		= _flags,				\
> +		.name		= _name,				\
> +		.parent_data	= (const struct clk_parent_data[]) {	\
> +					{ .index = _parent },		\
> +				  },					\
> +		.num_parents	= 1,					\
> +		.ops		= _ops,					\
> +	})
> +
> +/* ADC */
> +static struct clk_stm32_gate ck_icn_p_adc1 = {
> +	.gate_id = GATE_ADC1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_composite ck_ker_adc1 = {
> +	.gate_id = GATE_ADC1,
> +	.mux_id = MUX_ADC1,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc1", adc1_src, &clk_stm32_composite_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_adc2 = {
> +	.gate_id = GATE_ADC2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_adc2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_composite ck_ker_adc2 = {
> +	.gate_id = GATE_ADC2,
> +	.mux_id = MUX_ADC2,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_adc2", adc2_src, &clk_stm32_composite_ops, 0),
> +};
> +
> +/* CSI-HOST */
> +static struct clk_stm32_gate ck_icn_p_csi = {
> +	.gate_id = GATE_CSI,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_csi", ICN_APB4, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_csi = {
> +	.gate_id = GATE_CSI,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csi", FLEXGEN_29, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_csitxesc = {
> +	.gate_id = GATE_CSI,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csitxesc", FLEXGEN_30, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* CSI-PHY */
> +static struct clk_stm32_gate ck_ker_csiphy = {
> +	.gate_id = GATE_CSI,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_csiphy", FLEXGEN_31, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* DCMIPP */
> +static struct clk_stm32_gate ck_icn_p_dcmipp = {
> +	.gate_id = GATE_DCMIPP,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipp", ICN_APB4, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_dcmipssi = {
> +	.gate_id = GATE_DCMIPSSI,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_dcmipssi", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* DDRPERMF */
> +static struct clk_stm32_gate ck_icn_p_ddrperfm = {
> +	.gate_id = GATE_DDRPERFM,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ddrperfm", ICN_APB4, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* CRC */
> +static struct clk_stm32_gate ck_icn_p_crc = {
> +	.gate_id = GATE_CRC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_crc", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* CRYP */
> +static struct clk_stm32_gate ck_icn_p_cryp1 = {
> +	.gate_id = GATE_CRYP1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_cryp2 = {
> +	.gate_id = GATE_CRYP2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_cryp2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* DBG & TRACE*/

' ' after */

> +/* Trace and debug clocks are managed by SCMI */
> +
> +/* LTDC */
> +static struct clk_stm32_gate ck_icn_p_ltdc = {
> +	.gate_id = GATE_LTDC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_ltdc", ICN_APB4, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_ltdc = {
> +	.gate_id = GATE_LTDC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_ltdc", FLEXGEN_27, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +/* DTS */
> +static struct clk_stm32_composite ck_ker_dts = {
> +	.gate_id = GATE_DTS,
> +	.mux_id = MUX_DTS,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_dts", dts_src,
> +					    &clk_stm32_composite_ops, 0),
> +};
> +
> +/* ETHERNET */
> +static struct clk_stm32_gate ck_icn_p_eth1 = {
> +	.gate_id = GATE_ETH1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1stp = {
> +	.gate_id = GATE_ETH1STP,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1stp", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1 = {
> +	.gate_id = GATE_ETH1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1", FLEXGEN_54, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1ptp = {
> +	.gate_id = GATE_ETH1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1ptp", FLEXGEN_56, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1mac = {
> +	.gate_id = GATE_ETH1MAC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1mac", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1tx = {
> +	.gate_id = GATE_ETH1TX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1tx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth1rx = {
> +	.gate_id = GATE_ETH1RX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth1rx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_eth2 = {
> +	.gate_id = GATE_ETH2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_eth2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth2stp = {
> +	.gate_id = GATE_ETH2STP,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2stp", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth2 = {
> +	.gate_id = GATE_ETH2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2", FLEXGEN_55, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth2ptp = {
> +	.gate_id = GATE_ETH2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2ptp", FLEXGEN_56, &clk_stm32_gate_ops, 0),
> +};

ck_ker_eth2ptp and ck_ker_eth1ptp both use FLEXGEN_56, is this ok?

> +
> +static struct clk_stm32_gate ck_ker_eth2mac = {
> +	.gate_id = GATE_ETH2MAC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2mac", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth2tx = {
> +	.gate_id = GATE_ETH2TX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2tx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_eth2rx = {
> +	.gate_id = GATE_ETH2RX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_eth2rx", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* FDCAN */
> +static struct clk_stm32_gate ck_icn_p_fdcan = {
> +	.gate_id = GATE_FDCAN,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_fdcan", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_fdcan = {
> +	.gate_id = GATE_FDCAN,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_fdcan", FLEXGEN_26, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* HASH */
> +static struct clk_stm32_gate ck_icn_p_hash1 = {
> +	.gate_id = GATE_HASH1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_hash2 = {
> +	.gate_id = GATE_HASH2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hash2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* HDP */
> +static struct clk_stm32_gate ck_icn_p_hdp = {
> +	.gate_id = GATE_HDP,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_hdp", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* I2C */
> +static struct clk_stm32_gate ck_icn_p_i2c1 = {
> +	.gate_id = GATE_I2C1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c1", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_i2c2 = {
> +	.gate_id = GATE_I2C2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_i2c3 = {
> +	.gate_id = GATE_I2C3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i2c3", ICN_APB5, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i2c1 = {
> +	.gate_id = GATE_I2C1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c1", FLEXGEN_13, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i2c2 = {
> +	.gate_id = GATE_I2C2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c2", FLEXGEN_13, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i2c3 = {
> +	.gate_id = GATE_I2C3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i2c3", FLEXGEN_38, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* I3C */
> +static struct clk_stm32_gate ck_icn_p_i3c1 = {
> +	.gate_id = GATE_I3C1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c1", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_i3c2 = {
> +	.gate_id = GATE_I3C2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_i3c3 = {
> +	.gate_id = GATE_I3C3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_i3c3", ICN_APB5, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i3c1 = {
> +	.gate_id = GATE_I3C1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c1", FLEXGEN_14, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i3c2 = {
> +	.gate_id = GATE_I3C2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c2", FLEXGEN_14, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_i3c3 = {
> +	.gate_id = GATE_I3C3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_i3c3", FLEXGEN_36, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* IWDG */
> +static struct clk_stm32_gate ck_icn_p_iwdg1 = {
> +	.gate_id = GATE_IWDG1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg1", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_iwdg2 = {
> +	.gate_id = GATE_IWDG2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg2", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_iwdg3 = {
> +	.gate_id = GATE_IWDG3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg3", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_iwdg4 = {
> +	.gate_id = GATE_IWDG4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_iwdg4", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* LPTIM */
> +static struct clk_stm32_gate ck_icn_p_lptim1 = {
> +	.gate_id = GATE_LPTIM1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim1", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_lptim2 = {
> +	.gate_id = GATE_LPTIM2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_lptim3 = {
> +	.gate_id = GATE_LPTIM3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim3", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_lptim4 = {
> +	.gate_id = GATE_LPTIM4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim4", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_lptim5 = {
> +	.gate_id = GATE_LPTIM5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lptim5", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lptim1 = {
> +	.gate_id = GATE_LPTIM1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim1", FLEXGEN_07, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lptim2 = {
> +	.gate_id = GATE_LPTIM2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim2", FLEXGEN_07, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lptim3 = {
> +	.gate_id = GATE_LPTIM3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim3", FLEXGEN_40, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lptim4 = {
> +	.gate_id = GATE_LPTIM4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim4", FLEXGEN_41, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lptim5 = {
> +	.gate_id = GATE_LPTIM5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lptim5", FLEXGEN_42, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* LPUART */
> +static struct clk_stm32_gate ck_icn_p_lpuart1 = {
> +	.gate_id = GATE_LPUART1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_lpuart1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_lpuart1 = {
> +	.gate_id = GATE_LPUART1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_lpuart1", FLEXGEN_39, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* MCO1 & MCO2 */
> +static struct clk_stm32_composite ck_mco1 = {
> +	.gate_id = GATE_MCO1,
> +	.mux_id = MUX_MCO1,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco1", mco1_src, &clk_stm32_composite_ops, 0),
> +};
> +
> +static struct clk_stm32_composite ck_mco2 = {
> +	.gate_id = GATE_MCO2,
> +	.mux_id = MUX_MCO2,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_mco2", mco2_src, &clk_stm32_composite_ops, 0),
> +};
> +
> +/* MDF */
> +static struct clk_stm32_gate ck_icn_p_mdf1 = {
> +	.gate_id = GATE_MDF1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_mdf1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_mdf1 = {
> +	.gate_id = GATE_MDF1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_mdf1", FLEXGEN_21, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* OTG */
> +static struct clk_stm32_gate ck_icn_m_otg = {
> +	.gate_id = GATE_OTG,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_otg", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* PKA */
> +static struct clk_stm32_gate ck_icn_p_pka = {
> +	.gate_id = GATE_PKA,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_pka", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* RNG */
> +static struct clk_stm32_gate ck_icn_p_rng1 = {
> +	.gate_id = GATE_RNG1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng1", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_rng2 = {
> +	.gate_id = GATE_RNG2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_rng2", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* SAES */
> +static struct clk_stm32_gate ck_icn_p_saes = {
> +	.gate_id = GATE_SAES,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_saes", ICN_LS_MCU, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* SAI */
> +static struct clk_stm32_gate ck_icn_p_sai1 = {
> +	.gate_id = GATE_SAI1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai1", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_sai2 = {
> +	.gate_id = GATE_SAI2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai2", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_sai3 = {
> +	.gate_id = GATE_SAI3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai3", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_sai4 = {
> +	.gate_id = GATE_SAI4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_sai4", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sai1 = {
> +	.gate_id = GATE_SAI1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai1", FLEXGEN_22, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sai2 = {
> +	.gate_id = GATE_SAI2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai2", FLEXGEN_23, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sai3 = {
> +	.gate_id = GATE_SAI3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai3", FLEXGEN_24, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sai4 = {
> +	.gate_id = GATE_SAI4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sai4", FLEXGEN_25, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +/* SDMMC */
> +static struct clk_stm32_gate ck_icn_m_sdmmc1 = {
> +	.gate_id = GATE_SDMMC1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc1", ICN_SDMMC, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_m_sdmmc2 = {
> +	.gate_id = GATE_SDMMC2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc2", ICN_SDMMC, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_m_sdmmc3 = {
> +	.gate_id = GATE_SDMMC3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_sdmmc3", ICN_SDMMC, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sdmmc1 = {
> +	.gate_id = GATE_SDMMC1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc1", FLEXGEN_51, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sdmmc2 = {
> +	.gate_id = GATE_SDMMC2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc2", FLEXGEN_52, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_sdmmc3 = {
> +	.gate_id = GATE_SDMMC3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_sdmmc3", FLEXGEN_53, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* SERC */
> +static struct clk_stm32_gate ck_icn_p_serc = {
> +	.gate_id = GATE_SERC,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_serc", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* SPDIF */
> +static struct clk_stm32_gate ck_icn_p_spdifrx = {
> +	.gate_id = GATE_SPDIFRX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spdifrx", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spdifrx = {
> +	.gate_id = GATE_SPDIFRX,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spdifrx", FLEXGEN_12, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* SPI */
> +static struct clk_stm32_gate ck_icn_p_spi1 = {
> +	.gate_id = GATE_SPI1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi1", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_spi2 = {
> +	.gate_id = GATE_SPI2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_spi3 = {
> +	.gate_id = GATE_SPI3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi3", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_spi4 = {
> +	.gate_id = GATE_SPI4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi4", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_spi5 = {
> +	.gate_id = GATE_SPI5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi5", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_spi6 = {
> +	.gate_id = GATE_SPI6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_spi6", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spi1 = {
> +	.gate_id = GATE_SPI1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi1", FLEXGEN_16, &clk_stm32_gate_ops,
> +				     CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spi2 = {
> +	.gate_id = GATE_SPI2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi2", FLEXGEN_10, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spi3 = {
> +	.gate_id = GATE_SPI3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi3", FLEXGEN_11, &clk_stm32_gate_ops,
> +				       CLK_SET_RATE_PARENT),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spi4 = {
> +	.gate_id = GATE_SPI4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi4", FLEXGEN_17, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_spi5 = {
> +	.gate_id = GATE_SPI5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi5", FLEXGEN_17, &clk_stm32_gate_ops, 0),
> +};
> +

SPI4 and SPI5 both use FLEXGEN_17

> +static struct clk_stm32_gate ck_ker_spi6 = {
> +	.gate_id = GATE_SPI6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_spi6", FLEXGEN_37, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* Timers */
> +static struct clk_stm32_gate ck_icn_p_tim2 = {
> +	.gate_id = GATE_TIM2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim3 = {
> +	.gate_id = GATE_TIM3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim3", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim4 = {
> +	.gate_id = GATE_TIM4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim4", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim5 = {
> +	.gate_id = GATE_TIM5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim5", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim6 = {
> +	.gate_id = GATE_TIM6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim6", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim7 = {
> +	.gate_id = GATE_TIM7,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim7", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim10 = {
> +	.gate_id = GATE_TIM10,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim10", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim11 = {
> +	.gate_id = GATE_TIM11,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim11", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim12 = {
> +	.gate_id = GATE_TIM12,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim12", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim13 = {
> +	.gate_id = GATE_TIM13,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim13", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim14 = {
> +	.gate_id = GATE_TIM14,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim14", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim1 = {
> +	.gate_id = GATE_TIM1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim1", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim8 = {
> +	.gate_id = GATE_TIM8,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim8", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim15 = {
> +	.gate_id = GATE_TIM15,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim15", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim16 = {
> +	.gate_id = GATE_TIM16,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim16", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_tim17 = {
> +	.gate_id = GATE_TIM17,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_tim17", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim2 = {
> +	.gate_id = GATE_TIM2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim2", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim3 = {
> +	.gate_id = GATE_TIM3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim3", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim4 = {
> +	.gate_id = GATE_TIM4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim4", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim5 = {
> +	.gate_id = GATE_TIM5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim5", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim6 = {
> +	.gate_id = GATE_TIM6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim6", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim7 = {
> +	.gate_id = GATE_TIM7,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim7", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim10 = {
> +	.gate_id = GATE_TIM10,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim10", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim11 = {
> +	.gate_id = GATE_TIM11,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim11", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim12 = {
> +	.gate_id = GATE_TIM12,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim12", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim13 = {
> +	.gate_id = GATE_TIM13,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim13", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim14 = {
> +	.gate_id = GATE_TIM14,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim14", TIMG1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim1 = {
> +	.gate_id = GATE_TIM1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim1", TIMG2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim8 = {
> +	.gate_id = GATE_TIM8,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim8", TIMG2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim15 = {
> +	.gate_id = GATE_TIM15,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim15", TIMG2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim16 = {
> +	.gate_id = GATE_TIM16,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim16", TIMG2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_tim17 = {
> +	.gate_id = GATE_TIM17,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_tim17", TIMG2, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* UART/USART */
> +static struct clk_stm32_gate ck_icn_p_usart2 = {
> +	.gate_id = GATE_USART2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart2", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_usart3 = {
> +	.gate_id = GATE_USART3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart3", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_uart4 = {
> +	.gate_id = GATE_UART4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart4", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_uart5 = {
> +	.gate_id = GATE_UART5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart5", ICN_APB1, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_usart1 = {
> +	.gate_id = GATE_USART1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart1", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_usart6 = {
> +	.gate_id = GATE_USART6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_usart6", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_p_uart7 = {
> +	.gate_id = GATE_UART7,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_uart7", ICN_APB2, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_usart2 = {
> +	.gate_id = GATE_USART2,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart2", FLEXGEN_08, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_uart4 = {
> +	.gate_id = GATE_UART4,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart4", FLEXGEN_08, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_usart3 = {
> +	.gate_id = GATE_USART3,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart3", FLEXGEN_09, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_uart5 = {
> +	.gate_id = GATE_UART5,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart5", FLEXGEN_09, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_usart1 = {
> +	.gate_id = GATE_USART1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart1", FLEXGEN_18, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_usart6 = {
> +	.gate_id = GATE_USART6,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_usart6", FLEXGEN_19, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_ker_uart7 = {
> +	.gate_id = GATE_UART7,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_ker_uart7", FLEXGEN_20, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* USB2PHY1 */
> +static struct clk_stm32_composite ck_ker_usb2phy1 = {
> +	.gate_id = GATE_USB2PHY1,
> +	.mux_id = MUX_USB2PHY1,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy1", usb2phy1_src,
> +					    &clk_stm32_composite_ops, 0),
> +};
> +
> +/* USBH */
> +static struct clk_stm32_gate ck_icn_m_usbhehci = {
> +	.gate_id = GATE_USBH,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhehci", ICN_HSL, &clk_stm32_gate_ops, 0),
> +};
> +
> +static struct clk_stm32_gate ck_icn_m_usbhohci = {
> +	.gate_id = GATE_USBH,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_m_usbhohci", ICN_HSL, &clk_stm32_gate_ops, 0),
> +};

Confirm whether GATE_USBH is intended to be shared or if GATE_USBH_EHCI 
and GATE_USBH_OHCI similar

> +
> +/* USB2PHY2 */
> +static struct clk_stm32_composite ck_ker_usb2phy2_en = {
> +	.gate_id = GATE_USB2PHY2,
> +	.mux_id = MUX_USB2PHY2,
> +	.div_id = NO_STM32_DIV,
> +	.hw.init = CLK_HW_INIT_PARENTS_DATA("ck_ker_usb2phy2_en", usb2phy2_src,
> +					    &clk_stm32_composite_ops, 0),
> +};
> +
> +/* VREF */
> +static struct clk_stm32_gate ck_icn_p_vref = {
> +	.gate_id = GATE_VREF,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_vref", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};
> +
> +/* WWDG */
> +static struct clk_stm32_gate ck_icn_p_wwdg1 = {
> +	.gate_id = GATE_WWDG1,
> +	.hw.init = CLK_HW_INIT_INDEX("ck_icn_p_wwdg1", ICN_APB3, &clk_stm32_gate_ops, 0),
> +};


Thanks,
Alok
