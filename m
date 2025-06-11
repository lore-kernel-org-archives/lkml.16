Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011065.outbound.protection.outlook.com [52.101.70.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813491DEFC8;
	Wed, 11 Jun 2025 15:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656062; cv=fail; b=s+WqldIvth4dgxdDDO0Zb0lEYjPavHeOlw+Xyfs/4ZpskkgDUEQaDdjLTTiCdlCJH4kHJxNJNkOsX5He6CQkCHAXwRQdu2AbCfjmueOsKmLpNbF7DaaC3ULS56ZuYaM56Q17h/XddipaK348DoQE22QNpInASRbGH0ObRtNu2FY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656062; c=relaxed/simple;
	bh=KKDT8T0sje3DnsEu74X4C5q81fEus7EuhOZ82Fh7KQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fSujETCLtJh2ploaI1x/G1z2POq8qrPPbnLCzlcSnc9xW6IqMnVD6Vydu6RHe82zYsCT5w8cLtuaWfKeyvcgArl8dzgNc8f58kLNA45IwHEHyW9G8Ct8Fq225oW6FjhT7fSFMO+XKF6TBUkw3ZSD9sjrjzUXtNwmb4yRU0jBlGo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PmUKU0Wq; arc=fail smtp.client-ip=52.101.70.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PmUKU0Wq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUAZ1PPJ2KOGtHrLFATJzkY+r4wSw3IWhNylhn42JxjqsaBPX78EvTMl7MtB20i3dZ2ou1k0WqycJUhB06UhReM4p1eP3sAIAj0EdfXezoxy2b+L4PyoCYioOosifv1nUzAb1vdwO646h51vRb/x9m+dSf+GS3/o+GQedco+MO8VIsLdX05KbQhzJfZBv7Txls+tH/BEJDp6V+Zomwkr775XyUf/KT2Sm20hfaJ++nXBCyF4D+tOIRY70Z0nu5WpEqFjbuJSXVTgAn/2PJye14EDOL8bZAMuu0RSUaGlK47LyQhxyANYiJ5rn1+Tr6uDjPez+DCXjiT2LPh0Afh2rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fc/TAL+ahJnAvgE2KMulLQYMU7iuw4wQz4UA3enZlA=;
 b=CkOSjEDgnkOZVWfm95ix/gMZZiZ1GNacbsankG/2JEYtSAO3xc7kxcfTnrjQ0ErSXfd2QaJYMj5TngKIJmhvMI84y0st9xha5mRavLs+YuwkLM66R9/HfWQqROHvCgpSTFHByJk2djvuK77R7+l2Iw+LdHLHEeYI2wT8iAE/ZVW0/OXD42YC8UGfM5uD6SPfFt865u/PXdu++mZYYKG9aKsbCpi0RYueqJE+bhI2jVQTeQkFWGlaV7t25blfxJQZgk/WlFkyCfnFYqbYaxUBaBw3d4toOo5FEfC3QbICC2OAQlWwOF1KXBS5XlvffHyzpZo7ssLomz4fSc9C0yGUEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fc/TAL+ahJnAvgE2KMulLQYMU7iuw4wQz4UA3enZlA=;
 b=PmUKU0WqQs1Hpzkt2xAq6/pA1uwZzZ1REi9X7uiq26FuNCH4sikwE3r94vUNYvYx8k3EsMlTF2lVFNmYBKhZm22apJRN03VPf/zJkcQIPqczHD7iXCKioljB1HhrARAebr+LaQqoHpz920yae5UnE9VMBwfXtoTFj9R/Vlk8AxG2wCNRha/w7D7ir4OL9azrp1npjMfTEVBzrCz/fsrbaZxYpmmOZ+3nTPEmAphg30qfVOUDxL+EFn9Bv3C6V6cMMfgLay3uiNgZ6jOxh995dtbN1l6AK9dlcPkBh6c8JbN6fYOwfHZzoc2NWYHkiraMxfsccDw0MgHS2SKVRMiAhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8399.eurprd04.prod.outlook.com (2603:10a6:20b:3e6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 15:34:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8813.024; Wed, 11 Jun 2025
 15:34:15 +0000
Date: Wed, 11 Jun 2025 11:34:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: Goran =?utf-8?B?UmHEkWVub3ZpxIc=?= <goran.radni@gmail.com>
Cc: boerge.struempfel@gmail.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: imx8mp: Add initial support for
 Ultratronik imx8mp-ultra-mach-sbc board
Message-ID: <aEmh7VL7BHkXp5Fu@lizhi-Precision-Tower-5810>
References: <20250611113039.304742-1-goran.radni@gmail.com>
 <20250611113039.304742-4-goran.radni@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611113039.304742-4-goran.radni@gmail.com>
X-ClientProxiedBy: BYAPR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::35) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8399:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1e590b-c1a9-4991-3d7a-08dda8fd6c2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MUhHa1Flem1LV0g2aE9XZHlWdnFyMFNVRitYWUtvOVRPSGNldGw0UXBaKy9x?=
 =?utf-8?B?dUNUTVU1RWdlTjJTTWtrUWI4Q0Jxc1lJYU5LMVp1NUV0MXExRlI1UWYxakJW?=
 =?utf-8?B?cXpPak9oWDliOW9HelR6SGhnMWlzaWZuT2JVRlRwdTNTMzJKdnAyYTc2UC9K?=
 =?utf-8?B?eEUwY1NlYTJPa2tBTFFLRmltNzJTZXhiakM1TE9nV2RnS1YvMWhQc2tjY3lV?=
 =?utf-8?B?c2RxNXZSZUthVmZ1Z041QXN0UHVkcXZBQnBjNS80Qm5DdW9zcUJraElXdW5Q?=
 =?utf-8?B?Yys1M3UwNy9qUHNRbnVjb0dHb2RPQWZVcDE0RlRJU1RTR2w4dFhFWXk0VE1y?=
 =?utf-8?B?dmpEQ05VbFl1TUh6dGtCZXVua04xYmRkMEFDSmRrVHBqRHZMZzArQ3pmVXh3?=
 =?utf-8?B?SFVuMXRwazBwOWlHRGJHbFhSMm92bFFCMjJFYktrbXBDT0tmdmtFbXd6dHBK?=
 =?utf-8?B?VE1zUG9NYlJTa1UvN3YvRk8zR1FLUFpVeHZHbHZLWkdLdmlRT0RxN1BER0dm?=
 =?utf-8?B?dzQ2YU1heVJWVTh2bW42a0h0OU55aEpCUExndVY0ald5ZmR1Z2ZOVVdlVngx?=
 =?utf-8?B?WGx6QzhSRFJ4QTVjaFhnZjNpMEpDejdoVHg0c1YyQVNEbDZLZE9oWmpxSGJY?=
 =?utf-8?B?ZkV6YWMvd2dhZk1QMzFWUkZqeFdVVll6SXlyYloxaFRTOWtVSHpVeCsxbXBa?=
 =?utf-8?B?Nkd2dGExTXdkbmFLamJ1a3MwakJWZldlSXBiL0VudDVweGhDaUVUT0lPazZw?=
 =?utf-8?B?MDZXKzhJVlY2VHZGVG9NTVZzSlFielBIWmdka2ZxcCtOZ2F3Sk9TbzB3dGRs?=
 =?utf-8?B?VTZNM3dhT3NudmxUS3JXN3E0Yzc0M2JpRVF2blZ1bVRYTlcrWm11NkhSeEt6?=
 =?utf-8?B?Q3dvTE9TZ00zOEppajBhczJ1Qnk3WG9TUVd0Z2h2UnM5UnIyS3dpeFBsRW5r?=
 =?utf-8?B?TU15dEVTUFVicm14UmJuazduVytOKzZOWStDY2tLZ0xLYkxxM0E2ZFFranNI?=
 =?utf-8?B?bU1MTDJVa0FkR1g3cTVUaVJZZkoyeG1qWTZidFdYa0lPK001Z1BuQWtia1I4?=
 =?utf-8?B?b1U5UEFxMlIyZjR1WjhkTC81WU5KTzFYc1FJUGw2YVdjNzlCRzlObis3VGVZ?=
 =?utf-8?B?OTg3YTZZN0lneU9FNDJYTkN6K1ZVU2ZONXc4OWtha25PcCs2dlRNdmh2VTd4?=
 =?utf-8?B?bHlrb1NpM0JEd291MjlFcHNuSTlYckVuY2JiejZ6dFdzOUhna2JLSitoVElV?=
 =?utf-8?B?c2tXQ2RMYTdMeWMwaUNTemxubUMzQTFBMUlGMmJvSXh3QlF3SHp5K3BDaTFj?=
 =?utf-8?B?Qkt3Q3Q3dzgwUXVaRkVTZThhTmVnelozM28wSDg1TDBQeXY1Vm80WkN3Tzl2?=
 =?utf-8?B?bkZvZm1JRXNrRjY3Lzd2UFh2cVJseXo3UHFpbE53R0htRVdGQm1ia0pFZk1w?=
 =?utf-8?B?bGg2RU51T29JbnFxRkNRNUtjT1NPZG1RSEQvVUtSeXg2ckxKWVBWQlk5Z0JH?=
 =?utf-8?B?VTlINEhacWlVTE4yWTlYc0dMSFZuVitBRnZJK2QzZEFZYnlWUkIzaUtmNy9r?=
 =?utf-8?B?VVVueElya0ZhK2VuU3VjZmpWNmZRRFlQV3R6UmY3a29Lb0lueEZEU1hMZFlD?=
 =?utf-8?B?enIvTHhMUjVHZ2kxS2xRYjVQQm1PWFFsQTBITjdaaHArKzhiVmRKeGliNDY4?=
 =?utf-8?B?NlUwb3hwUXZEMjRRbldiOVJEVzByR21TZnYvclBQa294YTVCZEhkMktCOXNH?=
 =?utf-8?B?NC9TTmJGcTQybGdCdUhpVzR2SjRBNmttb25HZDdIWTE3TnlBeGdNVnNvWmZv?=
 =?utf-8?B?YllWeGZ5U20ySXJ6ZWQwZ3Bnakd5aWxyOUNVTEpYc0hUcXpjWVpFSDE5Uzdu?=
 =?utf-8?B?cWg2TmpXZGgrWGhBOU1QRXJ5czZjU2pqbTgwT3RXMEhVYlRpZXZoRFZXdWZC?=
 =?utf-8?B?VGpDM013UmxndWE0eExwNUpWejJ1TXFkaHhSVjI5a25VNVZEZkJnbTN1RVNk?=
 =?utf-8?B?ZGpCQy9vTmNRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SzRSWlEzZjZJYnpPaTQvOTRDMnpIdXNSRDlnQkkrU25VYURIZmI0eGVBV1Yx?=
 =?utf-8?B?N05XRjUzWHhSY1RZZkhUS0x3YlNpVG91OHA2S1k2Q2tZSGFLVXByaU9KY0lv?=
 =?utf-8?B?OGhoc29saGJzanc4d2VKMVU5YldydG1RWjVFN05wQjlFKy9iY2crQ3I5dmNv?=
 =?utf-8?B?RklUVXdEbFg1UnpkZXlOK2NxMnIyaGtPMnU3cHY1QVJCSyszSTZ2WFBwTXhm?=
 =?utf-8?B?enI5QWdSSVBRQktCL2hhQnNWcWpSTEtMcjVVc2VoR0JuL3RBVTFRdExiZ2NW?=
 =?utf-8?B?aytxbWFlVmNkVzAra2p2S1FTeEd5Q2E4QjJZMkljZUxoR29xUzYyaFcyTlYy?=
 =?utf-8?B?TzhvaWd4ellKRWxxVHVrUlhHMUNXZ0ZqbFRXa3hzQlhnN1hKL0pKZUdTQ0Q2?=
 =?utf-8?B?SkEzdEF2MUgyamlYQmRoampzZWpiRFVmYnhoNS9mRkZwMFlod1hGRUJuWVdo?=
 =?utf-8?B?bHFhQklTRkJxRmN1MlYwMjR3bi8zUjM4c2dZUnFlVFRUZnZlOXpNcnVJLzFt?=
 =?utf-8?B?MENqR2VqRitWdXlwN3NlbUJKSXpKWXVFRnRXbXpaT2FKWDlwVEtyVGRiRkxa?=
 =?utf-8?B?RWZab21ZeldMK2d4em1ueWlVZHVWQWRGcndnZDVwMkFWUEJDUGNNZEVNbEFK?=
 =?utf-8?B?MjRQakxTTTJ1YzViR3Yzam1qcmVlUGZQanIvUlQxQkJNWTdSNGhrWDVpSko4?=
 =?utf-8?B?Mjkrb09FQ3NFVVdqUExYYXlrbnl0ZDFZUmx0bm5JUkJyUTRZR21JZWRwZTc0?=
 =?utf-8?B?U0twaE1McnZNTys5dldQQllBOW1sVEg0R3daMWJCTXBhdUk3Ynh0Y2dtSEZv?=
 =?utf-8?B?elZtQ1M2cWFZSXlXTEc3ZWNEVE5Ca0xzK2NncUhmL09yUE1MRjJaQXNUU2Uz?=
 =?utf-8?B?a0JHQ25ySWJqSkZwa3Ziek1uekdrWjVib25xZDRQekIxNUhRSytnNWozNjl5?=
 =?utf-8?B?Y0ZWMzZNSkJyZ0VuaWFaOXpOQktvZHpuSmhMdkIybHVFNFNSZFFKVHpXMU8r?=
 =?utf-8?B?R2ZvU2Z1M1E1anFPQ3VZd2lFaVp3b2VoY29aeUdneEgveElCR29SVUhORFlT?=
 =?utf-8?B?c2Q4RWc3RHNWejRabkQ3T2hsdTFZTzRyTVNsLzg0UDVWM1o1S1ZZUHF2Q1Na?=
 =?utf-8?B?MUM4MUpodlJpcWJlM3A5WXE1YnBxVDh1M2NVeVpKU0xDQVIzUEdxU1c5Rjh5?=
 =?utf-8?B?dVA0NFNoSlVuNWc3M05mQWc2dk5MMHUwdHh0SCtXZS9NclhrREQxNWtiY0NU?=
 =?utf-8?B?Y01ZQXMxN0VKWGFKT0tTZklONEg1bmJTSFY2MmU0QUhlU0wxQkw2Z3VlVTFK?=
 =?utf-8?B?R1pEZDJOdTc0WWNnbXNtbnFuZHNabGFnTHFnSUdPcWh5UjFmaGgzVndIL2I4?=
 =?utf-8?B?UVZQNGFKL3c2NHg2VjI5b2I0WnZYMC82aHBWb01oeDJGbFJXMUFGWTk5MHJr?=
 =?utf-8?B?eXRCTmRLZUE0VGtQdDV2NVFRTnF6T2ZFTW1xd0IwWVhtSk9mVDY5VjBQSGhP?=
 =?utf-8?B?K3pvZnZQdkw2bzJpbmdlUllEa0Y3TjhjMTlkbjBLOEJOMnZ4dUwxckZzTW9w?=
 =?utf-8?B?Z2VKR2R0cmtBRzdVSktsbzZvM1UrcDJzUENxMTlvZVZra3NBSVNwRWY5b3lW?=
 =?utf-8?B?VGxCUzN2THR0b3YwLzNrbmpLMHJUR3RSMWJWYUVEdzdNNWE5UVVZcUxLSERp?=
 =?utf-8?B?MDgvbUsxQVUweEh1VjRodzVzOEZiRnFCR0x0ZzVEc3FjUzdVOEYvM3pFaWtr?=
 =?utf-8?B?SEdxZWtPMjJya05OSnBmc1RENHZndlVoR1cwVWhrd0prcDJDR2dkSkcxS29X?=
 =?utf-8?B?VVk0eGpuVDI5NTNKNGlENnl6VlhYc0tTa1BVOUt1THFJY3FFaFZUb2Nxd2Uw?=
 =?utf-8?B?QUUxdTFSZFZFTWt2dWhLRkc2bG81QVJUQnBuditYZVlzQkJrMWJlWjJVaGRm?=
 =?utf-8?B?Q0FwNTJ4cTNLUHVHU1N5VWs3ZVU1WGluRXpMV09Vb2xSV2JESWRENnFEdGw4?=
 =?utf-8?B?WXgrb3FWUWFxcmtXQVFjYXg0Vy85K21ySzBCb2VyQ3UxcUZJb1Iybk5ySC9B?=
 =?utf-8?B?TGtvaS9VRjhxSTZqU0I2MTRzVGRCeVZxWm56bjVSaFJsaFJSRU1FYitCY3di?=
 =?utf-8?Q?UGopVBfs86ZyH7ZNdToFFYHfZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1e590b-c1a9-4991-3d7a-08dda8fd6c2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 15:34:15.4637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27m9pOrhz0iwCM5G9oypAiHw7Xe+Zcg05Qv44XyYgMpEM0HuNGcXBSIfu+3CUGuA3qjqpXaxyVza/O2ePk2QUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8399

On Wed, Jun 11, 2025 at 01:30:38PM +0200, Goran Rađenović wrote:
> Add initial device tree support for the Ultratronik Ultra-MACH SBC
> based on the NXP i.MX8M Plus SoC with 2GB LPDDR4.
>
> The board features:
> - 1 x USB 2.0 Host
> - 1 x USB 2.0 via USB-C
> - Debug UART + 1 x UART + 1 x USART
> - SD card and eMMC support
> - 2 x Ethernet (RJ45)
> - HDMI
>
> This initial DTS enables basic board support for booting via
> SD card or eMMC.
>
> Signed-off-by: Goran Rađenović <goran.radni@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx8mp-ultra-mach-sbc.dts   | 909 ++++++++++++++++++
>  2 files changed, 910 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0b473a23d120..e2f2500238fe 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -229,6 +229,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-ultra-mach-sbc.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw71xx-2x.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-venice-gw72xx-2x.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> new file mode 100644
> index 000000000000..cb99145a4308
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-ultra-mach-sbc.dts
> @@ -0,0 +1,909 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 Ultratronik
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/usb/pd.h>
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model = "NXP i.MX8MPlus Ultratronik MMI_A53 board";
> +	compatible = "ultratronik,imx8mp-ultra-mach-sbc", "fsl,imx8mp";
> +
> +	aliases {
> +		ethernet0 = &fec;
> +		ethernet1 = &eqos;
> +		rtc0 = &hwrtc;
> +		rtc1 = &snvs_rtc;
> +	};
> +
...
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_slb9670>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +};
> +
> +&ecspi2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>,
> +				<&gpio1 8 GPIO_ACTIVE_LOW>,
> +				<&gpio1 9 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	nfc_transceiver@1 {

node name use -, nfc-transceiver@1

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_nfc>;
> +		reg = <1>;
> +		compatible = "st,st95hf";

compatible should first property
reg should be second one.

> +		spi-max-frequency = <100000>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
> +		enable-gpio = <&gpio1 6 GPIO_ACTIVE_HIGH>;
> +		status = "okay";
> +	};
> +};
> +
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x1>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@2 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0x2>;
> +			interrupt-parent = <&gpio4>;
> +			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +	};
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"#TPM_IRQ", "GPIO1", "", "#PMIC_INT",
> +		"SD2_VSEL", "#TOUCH_IRQ", "#NFC_INT_I", "#NFC_INT",
> +		"#SPI2_CS2", "#SPI2_CS3", "#RTS4", "",
> +		"USB_PWR", "GPIO2", "GPIO3", "";
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "#SD2_CD", "", "", "",
> +		"", "", "", "", "#USB-C_EN", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "DISP_POW", "GPIO4",
> +		"#", "", "", "", "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		"BKL_POW", "#ETH1_INT", "#TPM_RES", "#PCAP_RES",
> +		"", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "#ETH0_INT", "#USB-C_ALERT",
> +		"#USB-C_SEL", "", "", "",
> +		"LED_RED", "LED_GREEN", "LED_YELLOW", "#WAKEUP",
> +		"", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "#SPI1_CS", "", "", "", "#SPI2_CS1", "", "",
> +		"", "", "", "", "ENA_KAM", "ENA_LED", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	ddc-i2c-bus = <&i2c5>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		reg = <0x25>;
> +		compatible = "nxp,pca9450c";

reg is second one.

Frank

> +		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 GPIO_ACTIVE_LOW>;
> +
> +		/*
> +		 * i.MX 8M Plus Data Sheet for Consumer Products
> +		 * 3.1.4 Operating ranges
> +		 * MIMX8ML8DVNLZAB
> +		 */
> +		regulators {
> +			buck1: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1050000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			buck2: BUCK2 {	/* VDD_ARM */
> +				regulator-min-microvolt = <850000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			buck4: BUCK4 {	/* +3V3 */
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck5: BUCK5 {	/* +1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			buck6: BUCK6 {	/* DRAM_1V1 */
> +				regulator-min-microvolt = <1100000>;
> +				regulator-max-microvolt = <1100000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo1: LDO1 {	/* NVCC_SNVS_1V8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo3: LDO3 {	/* VDDA_1P8 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo4: LDO4 {	/* ENET_2V5 */
> +				regulator-min-microvolt = <2500000>;
> +				regulator-max-microvolt = <2500000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +
> +			ldo5: LDO5 {	/* NVCC_SD2 */
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-always-on;
> +				regulator-boot-on;
> +			};
> +		};
> +	};
> +
> +	crypto@35 {
> +		compatible = "atmel,atecc508a";
> +		reg = <0x35>;
> +	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +
> +	hwrtc: rtc@32 {
> +		compatible = "epson,rx8900";
> +		reg = <0x32>;
> +		epson,vdet-disable;
> +		trickle-diode-disable;
> +	};
> +
> +	tcpc@52 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5110>;
> +		reg = <0x52>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> +
> +		usb_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +				     PDO_VAR(5000, 5000, 3000)>;
> +			op-sink-microwatt = <15000000>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					typec_dr_sw: endpoint {
> +						remote-endpoint = <&usb3_drd_sw>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&i2c5 {	/* HDMI EDID bus */
> +	clock-frequency = <100000>;
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c5>;
> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	status = "okay";
> +};
> +
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&pwm1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm1>;
> +	status = "okay";
> +};
> +
> +&pwm2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pwm2>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	/* system console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	/* expansion port serial connection */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart4>;
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_drd_sw: endpoint {
> +			remote-endpoint = <&typec_dr_sw>;
> +		};
> +	};
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usba_vbus>;
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +	snps,hsphy_interface = "utmi";
> +};
> +
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	bus-width = <4>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	vqmmc-supply = <&ldo5>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	vmmc-supply = <&buck4>;
> +	vqmmc-supply = <&buck5>;
> +	bus-width = <8>;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&wdog1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_wdog>;
> +	fsl,ext-reset-output;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_ecspi1_cs: ecspi1-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x40	/* #SPI1_CS */
> +		>;
> +	};
> +
> +	pinctrl_ecspi1: ecspi1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_ecspi2_cs: ecspi2-cs-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x40	/* #SPI2_CS */
> +			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08		0x40	/* #SPI2_CS2 */
> +			MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09		0x40	/* #SPI2_CS3 */
> +		>;
> +	};
> +
> +	pinctrl_ecspi2: ecspi2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x82
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x82
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x82
> +		>;
> +	};
> +
> +	pinctrl_eqos: eqos-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC		0x0
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO		0x0
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0	0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1	0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2	0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3	0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0	0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1	0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2	0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3	0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL	0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x10	/* #ETH0_INT */
> +		>;
> +	};
> +
> +	pinctrl_fec: fec-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC               0x0
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO              0x0
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0         0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1         0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2         0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3         0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC          0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL      0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0         0x16
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1         0x16
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2         0x16
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3         0x16
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL      0x16
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC         0x16
> +			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01               0x10	/* #ETH1_INT */
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> +		>;
> +	};
> +
> +	pinctrl_gpio_key_wakeup: gpio-key-wakeup-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27		0x40	/* #WAKEUP */
> +		>;
> +	};
> +
> +	pinctrl_gpio_leds: gpio-leds-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24		0x40	/* LED_RED */
> +			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40	/* LED_GREEN */
> +			MX8MP_IOMUXC_SAI2_TXD0__GPIO4_IO26		0x40	/* LED_YELLOW */
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmi-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x154
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x154
> +		>;
> +	};
> +
> +	pinctrl_hog: hog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO01__GPIO1_IO01	0x40	/* GPIO1 */
> +			MX8MP_IOMUXC_GPIO1_IO13__GPIO1_IO13	0x40	/* GPIO2 */
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x40	/* GPIO3 */
> +			MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23	0x40	/* GPIO4 */
> +			MX8MP_IOMUXC_I2C4_SCL__GPIO5_IO20	0x40	/* ENA_KAM */
> +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x40	/* ENA_LED */
> +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* #PCAP_RES */
> +			MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10	0x40	/* #RTS4 */
> +		>;
> +	};
> +
> +	pinctrl_i2c1: i2c1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c1_gpio: i2c1-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14		0xc0
> +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c0
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c0
> +		>;
> +	};
> +
> +	pinctrl_i2c2_gpio: i2c2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0xc0
> +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0xc0
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL			0x400001c2
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3_gpio: i2c3-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18		0xc2
> +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19		0xc2
> +		>;
> +	};
> +
> +	pinctrl_i2c5: i2c5-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL		0x400000c4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA		0x400000c4
> +		>;
> +	};
> +
> +	pinctrl_i2c5_gpio: i2c5-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26		0xc4
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27		0xc4
> +		>;
> +	};
> +
> +	pinctrl_nfc: nfc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40	/* NFC_INT_I */
> +			MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07		0x40	/* NFC_INT */
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmic-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03		0x40	/* #PMIC_INT */
> +		>;
> +	};
> +
> +	pinctrl_ptn5110: ptn5110-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x1c4	/* #USB-C_ALERT */
> +		>;
> +	};
> +
> +	pinctrl_pwm1: pwm1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__PWM1_OUT		0x116
> +		>;
> +	};
> +
> +	pinctrl_pwm2: pwm2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_RXD0__PWM2_OUT		0x116	/* EXT_PWM */
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: reg-usdhc2-vmmc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
> +	pinctrl_sbu_mux: sbu-mux-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_MCLK__GPIO4_IO20		0x16	/* #USB-C_SEL */
> +			MX8MP_IOMUXC_SD2_WP__GPIO2_IO20			0x16	/* #USB-C_EN */
> +		>;
> +	};
> +
> +	pinctrl_slb9670: slb9670-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO00__GPIO1_IO00		0x40	/* #TPM_IRQ */
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x40	/* #TPM_RES */
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART3_RXD__UART3_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART3_TXD__UART3_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x40
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x40
> +		>;
> +	};
> +
> +	pinctrl_usb1: usb1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO12__GPIO1_IO12		0x40	/* USB_PWR */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0xc0	/* SD2_VSEL */
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2-gpio-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12		0x1c4
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x190
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d0
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d0
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d0
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d0
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d0
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d0
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x190
> +			MX8MP_IOMUXC_NAND_READY_B__USDHC3_RESET_B	0x40	/* #SD3_RESET */
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x194
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d4
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d4
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d4
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d4
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d4
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d4
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK		0x192
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2		0x1d2
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3		0x1d2
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4		0x1d2
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5		0x1d2
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6		0x1d2
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7		0x1d2
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE		0x192
> +		>;
> +	};
> +
> +	pinctrl_wdog: wdog-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B		0xc6	/* #WDOG */
> +		>;
> +	};
> +};
> --
> 2.43.0
>
