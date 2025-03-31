Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013015.outbound.protection.outlook.com [52.101.72.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D55442049;
	Mon, 31 Mar 2025 10:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418154; cv=fail; b=ooIfEFgccQtq9URE5qb64fMGYTqIC9vDZNKj7EJXAGIfum5UccqJSrUAMLjWSn+m845cvqZxAcFUes8s1bSdFdbppKiuODm/l4MMXhatCSQDDP/kGXb4ON+6Ajmaq38f/kAzcc7HBWnKBwe37/sNIhQEPOxbyn2+vaJ3ELOhQlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418154; c=relaxed/simple;
	bh=iVKQLjAqai15GWEEbrAk8rcxJPYuy3wR3nCJ44HCmnQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CqTNF9GEEyQhMJA5lOl5HAfDuOLJg8UPIxrRapPgoJO+wxC+WqLu7mxQ2lAsjP2lpmuE5fnXtwObR1d0xZ5PX0zFikVOR7O3t7Z8Joe46BqxTICjV/ooJB3DFP9PCSghhr2fJyZLz9jm8iwA4CUcphSG+8vG+QrbuXuvtB4H3U0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=caHKMb77; arc=fail smtp.client-ip=52.101.72.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="caHKMb77"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pzu2Lt2tjbwOVKGL567BBhS4XX40oWLsy8EXDXEI8B9gfuuvreqxljP7yX96CFxbc0mNeAFQsysnN99L5io9nN0u6G7JqdE2u8owgG+ORQusCy4YoJ7er4lUUfbGpLOQ/nszDgCm11bFxIufdvBHLNUV80rbLqtL9FrBLxAOqwj+/OROlZKNdlV4yp/KLsIzbdcLqqDsWp1JKr226dNlhwEyvx3ZyJzqXQst0/TmkjwGrE7F+n1txQwzUpOTAujLCz2Xmd9mE/mlE8/3TPz0+P8PFv/8iWgLRSYFbvLU3/SKd0HV9pxEj/H+freQ5SRh0d/UjNUITpclf6SggoEA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=um9N8GbfRlMOYQSDVW2TBuAL9mHcfbhXGJzBd91iKFY=;
 b=NEGaQfCZtiYa5jnUZFAq0rQSAzKqgcPt2YM7ZwHsQNlp41p0/rSoYLC6dDGlxUujtKo3t5QA1S319Zxo9zoWOOrblODjYNMjZp3uUo0ke5ZEhT/4u2hTszGqC9WpmrKMqfHlGd39xD7yJnRCb8jXxYLuJAJ6ocskUv6E5LAo/p7UvGwd0Kz60eHTCSSr7Um4NITUxlM5gX9q1e0B2R7emdEQH/+hRWxcEOb1QIQ5VBR8Cly1vyBpmF/+9uR0RwnILRHGDIiNnF/uQ/ZMvdSNqLTRa7VYzUo1Id1Aa0yLZ/LXDEcrTNZhjgdeiTKlVel19jfjwoGML1zn4IF8PQ00gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=um9N8GbfRlMOYQSDVW2TBuAL9mHcfbhXGJzBd91iKFY=;
 b=caHKMb77j+ZhNyxrR1Ifr44dR+HNEGPV7E8+JI4mJWrhwEKIzjc3YXfl2vANKI2217Ox9DaAqJqHX3hmcJpMNMkNKrX/ouwWiCCQ9MvXbF2T6itd1YyhNRZwvc9J+SSFE3vkjJbiDyJ8ifSzNSCgRtRXzBFCv9K8qBVVW6OPfxoJUlfirSrAVrpBw3m5T4LeOxjoZX4LlRE8mDM7XgrY/p0ZN7UeXuJiuKQ4pjoz6w97c1agt5MRY/mErnVagUQsTCEUVOa4zx5/N7G+CdqJTl+BC1Snh2Dihx7P+D3Q6uJRfS0ZABqK5D/rx5kysKiNQxnLWuCmfHeL9QzPXzyRiA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by GVXPR04MB10491.eurprd04.prod.outlook.com (2603:10a6:150:1eb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:49:03 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 10:49:03 +0000
Message-ID: <1bbc1ddf-4aed-cea9-6c3f-c3497f03e123@oss.nxp.com>
Date: Mon, 31 Mar 2025 13:49:00 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: NXP System Timer Module
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thomas Fossati <thomas.fossati@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250324100008.346009-1-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250324100008.346009-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM0PR08CA0010.eurprd08.prod.outlook.com
 (2603:10a6:208:d2::23) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|GVXPR04MB10491:EE_
X-MS-Office365-Filtering-Correlation-Id: eba6dfd7-328c-4874-265e-08dd7041a6f2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YU5YNFlFNGJ3MmduQ1B4U2hsNUdUUDM1ZUhKWFRCeExNNDJ0V1BEWllCcldK?=
 =?utf-8?B?V3h1K2swSEVsUFVzUDRaZktHM1BCa1I4VkRRUjFxMkpkUUVjbVk4QjdiQ1R3?=
 =?utf-8?B?b1RDVVZ6UngvVHQrV05PR3cza0l5WW1HQWhsa3dRRzBCM2JWYXBwYVdsOVhz?=
 =?utf-8?B?S1loZlE5T0xGejJzOHEzN1o2d3ozcXU4a2dXTGNSU1hlUUdqWWJGYUwrekJ2?=
 =?utf-8?B?QXh4UVUraFRINXVoa3ZYSG0vQzNsYVl4bWxoUTB6VS9peWtRTHJqREV0RlZp?=
 =?utf-8?B?aW5qZGsrZWpldXVPKzBLZC9SWXRUR24wKzVJd21VbmgxeWJYRUM2bkhYWThT?=
 =?utf-8?B?Nnk4bmhxUlV6TE5MdlJMUDZIOTljeVBrOGNBRUlMckxLdEVOVVQ0STB1N0pI?=
 =?utf-8?B?aEw0ZlF2elRoNUVlem1vN1dhc3hqR1VMemc2REdVaGtGdERXVmg1Q2dNUmMw?=
 =?utf-8?B?QVZuUEsrUTRNVzdtTGF1ajV5VXAzdUtrMGZsZUlaaGtoc2pSWmZ3T2kzNmN5?=
 =?utf-8?B?WTNqUFhvbkJJN2lyS1dtc0ZxME5hK0RDVmZpZEx3bFQraUVDRmVDZVlCcVZR?=
 =?utf-8?B?U3NWZWZnd1U2dXRnT0t4dGVIVmhJaHJkNDlHUUx1V1hvT3RNMG05dkpFZjNR?=
 =?utf-8?B?SFptRjF2YlVJM0FrNGZaNytMUkJVYnI4N3U1V0h2M0FRTGpWRWlEeTgzY01U?=
 =?utf-8?B?dUMyWTd6TC9ZdXNjelZoN3lFMmo5R0p4dVBuN25CanNWQWw1ME9xQktDTmR1?=
 =?utf-8?B?MmtFemFpV1oyOXJCdUltNFdiWDl3TndoV0xaOXcwdmFOSmx1V1l2enJpc1Fo?=
 =?utf-8?B?N2VFM09WbXFIa0lJT1djTGJaU1Rpd1BWN1JBT2tCcFEwWTBhaVdlbUxyUWRR?=
 =?utf-8?B?TWZac0g4U2ZKSk12TDlFbHpFZ2kxbEZORHI3Y0dITFhnRitDVDRQRktRaFNN?=
 =?utf-8?B?OVYxTFBSc0UvTU5oM1ZEZVp6ZWszV2ROdW5KVURrMENtdm55OFJ2TkRXQjJX?=
 =?utf-8?B?eUIxY0Z2eHdUN2laMG5vUDgzWlRHOHlrQW1hM05vc2NCUEE1YmxDMHF2ZVFS?=
 =?utf-8?B?eVIrMDltbm12d01aYTZZcWxobDNzZmNYZUFUT05zaDh6QTVzbC82VnBraGFN?=
 =?utf-8?B?cW51S3dBNlVQQThNSmpHTEVldFF5a1EvemtTMWpBcjhwZVJOYXJMRnYwK1Nk?=
 =?utf-8?B?ZWpLNEVYSThLMEhFdlc3N21QL3I1cXM1aTRyb3ZpZ1U3Vi91cGtSaUJVUlFK?=
 =?utf-8?B?S0VHRHVPamhBWHZmeVJXM1hrL0IwOWVjMlhjQnc4bFQ3SGdPdEhyL3cvM0My?=
 =?utf-8?B?WEoyTzFzd2VyYTRWbkdVSm9rampaazlxc0tLS1NJTnhPRkdGVWVDb3FvTFNS?=
 =?utf-8?B?S2F6UmM3Y05sckNnak9yaW9xS1NBVWJjMFlOYUMwc2tIYndvSXJQMWM1dldZ?=
 =?utf-8?B?V2dYZ3lmYXFqbm1uaVB1a3ZWeVR0NlRjYlByUnJzeGt4Q1kzTEdRUTNJMXly?=
 =?utf-8?B?U1Yva29rdzI4Zk9YTE02Vlc1VXBtek80b3NZeXp0eU00MzFscERJZ25veFNm?=
 =?utf-8?B?VWQzZVZ1M0YwbGc4SWRGejFGRVBEekxwSG5YZEsrd1BVQjVPOTQwZlpSaHpX?=
 =?utf-8?B?NVhtWC9EalgwZTFaSmtTelRQNlU5amdjRVdMZUVUQkltTVNQcitoYXVLemFU?=
 =?utf-8?B?RGlacFBXZ3VaZmpkSU55WFhjV0JzTEJBRUwrNDJrVEg0alE0R09PNkpqUzBE?=
 =?utf-8?B?UVgyZjR2eDhscVdqRWdScFdpb3ZobDhkaDBVdnBNNEtab3BxbXV4RjdPOUFx?=
 =?utf-8?B?blZ3Nk5zaGU0RXV0U0RaUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzZzWVR3bFlVWTIzeTR3cWdpelRxNXNrdXlwQXVWbVZyYWpPTWNkUVlJQmRT?=
 =?utf-8?B?TFdhamhrbzFNMjFUaTcrbUtjNlVLWnRlWEQ1bzlHcFRvV2l2b3V0bzU3VXBY?=
 =?utf-8?B?V0FveGh4QnI3bCtQTDd5R3V3K21rWkJkb1RXaGlOSnVudEhHZUl5TzBMUHA1?=
 =?utf-8?B?bXdHSHpoYjNLRFJPNVI3UWZUcVRjeklWUnUxZ0FGQVZ5MXgrdzAvM3FNeVQz?=
 =?utf-8?B?djdLZDR4L2hXSldObHhXU1BtUnE0ZDYxM0VITHR5d0xBR01pWjZTQmZQRUhN?=
 =?utf-8?B?NlVWdEVCK3RXekk5cGwxZU1lVXhROVJOVTI4MFdBb0xseXUxVEg3LzVUNU9r?=
 =?utf-8?B?Rk1UUVBTK2E5eFNGdDJpaHM1RDRHY0grc1RuUkNhdkE5L3NWY0RqU2QzVUVh?=
 =?utf-8?B?VTlvQzc1QU1ReUl0NDZaSENrSzV2bWhxRGtQTC9ERFBNbUNlSk93cjZsaWIy?=
 =?utf-8?B?RDFFSGYrU2lCR05JdmZwdlFXWlJESDFFSStrQjFud1EzbzZZSWNYYk9zL3pm?=
 =?utf-8?B?ZFM1eXNMRUdzcXFpNXZ2VHVQd0JvUmtudGc4V2ZTSVZObHl0QURoZER4cVlj?=
 =?utf-8?B?RnplWDk1eUxtdHNZMEdvc3J5TzVVazBrYjJwL1I0b0lDbDhlTEN0ZzdzakFO?=
 =?utf-8?B?MFVQUHp2bUlqeDYvTk92YVBSZkJMOTkveEloeXVkbFM5T2hEM0tHejlnZlQw?=
 =?utf-8?B?WEloZytsWlRDNTliTGtUT1l1amVqNTFVMWtkbjBDZVJaWHdlRnUzcUFYcXBp?=
 =?utf-8?B?ZlFLRzJ3Q1VRMXJ2QWxtdVVkWlZ6ZWFRdjFpTlY0QTFpME1BVmp2YnMrMWhD?=
 =?utf-8?B?OTZQbytmaFA1Z2NzK0J3WnRJZHdOR1BMeVI2N2EwS0UvSGs5ZTJXTWxNOWU1?=
 =?utf-8?B?djcrV1NIYlZLOEV6RXB6dTlyTHFmM1lFSXI1Q3RxRFVpT3Vmb01FRnE2R0NQ?=
 =?utf-8?B?VjZycU9kM0taTjgrcXJzOUtMMHg2MjdqWEw0cjdUbS8ya2hZQWxwcjZqSGQ4?=
 =?utf-8?B?WWRTTXo4OE1WVkxTMlFINzJzT2ZVeDZoclg4U3BrRTdWaXo2ZTRNdUhFNGZk?=
 =?utf-8?B?RUs2b1FSS3FwOHVLWGorZE1sNTF2QkpoYTkvNE9TQ0JydHNMTmRubUU1VFFW?=
 =?utf-8?B?aTFUbEdLd3lRUDc3TWorSzcreU1DS1JBM3dKbzRhdWFUUGZOVitWMU9aMzR4?=
 =?utf-8?B?Y0NQOFphc0lBWm1BNG1DZi8zblJKajk0UVlCKzRkRTAwQTl6clYvKzZEc2g0?=
 =?utf-8?B?RmljeXdLbU0wdjBEY0tIYWxUbzhDdk91NTdFVzdBcWFUaXFHaXFpUFQrNUhZ?=
 =?utf-8?B?M1ROTVEvcFh1MTBKWFgrMnR1dmtjbXdoelRZc09hUVVablUwcUFPWUgxRmNu?=
 =?utf-8?B?U3FDcXU2WTdYZ2RLOFhGV1J2bS9MQVNhWjFmeThDUkVEaGdyUU9neWlXMmVx?=
 =?utf-8?B?Yll6cUtYcGN0K1c3eHlpZFZ2c0ZXc0hoRVdvUFVMeGZ5bFpQTEV5OXlRRk05?=
 =?utf-8?B?d3ZCbUtCaUMzSmVCZDA1SEdJUTh3SC82YUh4VzIvbVR4eG01UFJZVEFyVjBw?=
 =?utf-8?B?Y3Zwd3FGQm5wd2ZrcEZTQkgzaXZjZlg5cVlyN3YrY3NOc0FicTROeXkvbG1z?=
 =?utf-8?B?bCtYOWprUE8wZ2hKUzJOTXRCVlQ4ODltamRiRlVSdTQ3VXhHWXFGc0phUUFn?=
 =?utf-8?B?R3M5bS9PWWtqV05RUlArZlZXRjlOb21hbkE4b3NxT3dYWlVBeTIxK0F3R2FK?=
 =?utf-8?B?UDJvVERsa3RQMThHNlJ5Zm4zZG5lbG92dUlHeUcxU0N6RGVjQlp2TWJtMS9i?=
 =?utf-8?B?K1FnU24rVG42RFN6YXlHRnNJV2tQdHJjaTZKME5mdHlCd3ZZMGlqTUtJajZT?=
 =?utf-8?B?SEVPeHJlRDFtTVpUditmZlVKTjNUR0R1STBZL0JtUmQ4NGZPUm80OU5OTHhQ?=
 =?utf-8?B?TE9nNmJSNjlad3dlZlN5UE5QekJubmhmdzhuVFNSMGRoTkRIUTdjV3Z6S2pU?=
 =?utf-8?B?NTZhS0VWamZid1lyeEloM2RZdHVQc0J5MVBPcmNmbVBhaXhFU2pSOFgwblFi?=
 =?utf-8?B?aXppQ1JoVWh1R24vQklaQ3llQVBCNDJ0SDNQYllncGtBNDU4ak1LbnRnSkwz?=
 =?utf-8?B?ckViSUtHRmo3Qi9BdUszcjJOSTZJQ2FTWnQ3YkNqUWdGaTlOVXFIT3ptQ2Fl?=
 =?utf-8?Q?q88w/Heedkk7e6DLx0jU6Cs=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eba6dfd7-328c-4874-265e-08dd7041a6f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:49:03.4575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8yVkCvuan93tDjtOqF+alZ+6i9W3H+zRbhcvT7nJo9pnnqY2O3ZpUAUKPg2trvNi5YRFCaXD2RJ1TBYvirCCZEr3I48dA18iIHnbmqXF8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10491

On 3/24/2025 12:00 PM, Daniel Lezcano wrote:
> Add the System Timer Module description found on the NXP s32 platform
> and the compatible for the s32g2 variant.
> 
> Cc: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Thomas Fossati <thomas.fossati@linaro.org>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
>  .../bindings/timer/nxp,stm-timer.yaml         | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> 
> diff --git a/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> new file mode 100644
> index 000000000000..41093892c617
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/timer/nxp,stm-timer.yaml
> @@ -0,0 +1,59 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/timer/nxp,stm-timer.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP System Timer Module (STM)
> +
> +maintainers:
> +  - Daniel Lezcano <daniel.lezcano@kernel.org>
> +
> +description: |
> +  The System Timer Module supports commonly required system and
> +  application software timing functions. STM includes a 32-bit
> +  count-up timer and four 32-bit compare channels with a separate
> +  interrupt source for each channel. The timer is driven by the STM
> +  module clock divided by an 8-bit prescale value.
> +

Please update the description, as this one refers to STM instead of SWT.

-- 
Regards,
Ghennadi

