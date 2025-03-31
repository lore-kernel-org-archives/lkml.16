Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9821A7046
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743417344; cv=fail; b=dKg7w/jiQFwXISpHJobRYnvXgr5YedoS0LW4e7y3gZglgF/qVoLU0hXOx97Ye596ubyNVQPyzAVe8arDgiiRjDRIZ0hYxRS1kRSoCapVovAY1KtVxxVyawGq9riHRWKHwo9yOg+/j0V3Wje5q0FMpsaPEYnulKXCawGGTLlMF4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743417344; c=relaxed/simple;
	bh=thDnsOQw+ksCfOa2NrvONN5qnCS3vajYi/7DZ3ORwpw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=e2TXqPtXLNFAsr3BCtaYA79BZz4qr5mE9x+AtnH9VJ6rfxVGT2rXU5SyTmpOEqPOa5C9lhsyxMkvB79EKT5pCvxgGAiDB81q/GGpHxMCJ8LtomRf5RqcSaSWz3VjfbJkHCCmWR0q0oBgQEIBU0+zhAednI9aj5QE6t8pk9fJWxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KfAUgrMP; arc=fail smtp.client-ip=52.101.72.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KfAUgrMP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJo3KvS07SvKkqbzcqME2bxx9gQcEoLRmCMAMlvQ2eyFZOoJCzgPqky6YyaTWd2C1W80XNwoANyJ848okmUs/VtSOKHZVAGij9xrQcKZs1nz/gMipeIdcJcFv3wPa78me9CPfFhKMuCBZ0/9Gf0umjoB35nGrp0gjc0TgXW3OspoBRKYpHqpSgH2HMwAgKYqgicUCLboZcH55SZiORuUN9ZXt4Mgmx2O9+UyjAFRhoLKyQR1ACqVDWDTRj1i+VtMJBLIbRiTj/KZGDm/jtBcYexM0DzY59FB6nzZk6/NO/OqfPyDUhnqda/m3i2P7Bb6kp2coEZPuvAhkHWLjefwYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buF+oFZUjJTeZkoeUl7ey4pz3EtuA0+GsJFVpKYcO/Q=;
 b=I+/V6rQKkxZ0zjQrYX9lZrNO1gBK2WG6UUxLZatTPdf05VWoEXVCivdWi9sg2vt2Sm+8l+cz6WIAAR4bUG5D/Ml09orm9BAlD8Gx4UiyiS9HvMOxZCfB/KSgjZf0bOz1GBCpNARxa7bA20HQoc3jFx3MSl87z1ZdSwqeubZKb83Lt+Flvs8CS5x5tmcx16DyfY+MAmv8fMdMulgJ9/7N/rhgXVLY3ZMY9t6IujuC0KSqy1Hl7YuICyhNyvc/e0xB6SLwbtPM7gte/dNBt6JqHxzXkK1rpy4z4kINOp7J+HRhAZIH5sPPdZJzl+LnyvFEICufg9fpImr5q01GqAP+lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buF+oFZUjJTeZkoeUl7ey4pz3EtuA0+GsJFVpKYcO/Q=;
 b=KfAUgrMP3RDejC19+ZxM8ERCpTuCOp5YOUm6kM4euviSbvWX9GP4bQmDNdcjBVHCZJcivWBuTGK3J0Ghy/oyHhZkvq86gomEOS2z0xvOmUS90y96wejWmCvU+Q6W9nD3f4wJ2XEyUm5RwEzY/CW10p+xxIch1uZGDIi+lq+6z4aW169xmy+ab01sFKoHN4d06o/nvgD4hKyNZXYuqYCP6VfIC28ZJAwZ0PoxZyKNQ2F+NlSFlYd3+8nWLF/6OVjW0QQe0jxbdYS8/iBOMejAI+wyjn5E3hbUL7DUSvJPgDt9AHEP6MjBNlAtXwwo5iegvs1ItfKVR4J+Hv1cO3TcmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com (2603:10a6:10:2d9::24)
 by DB9PR04MB9703.eurprd04.prod.outlook.com (2603:10a6:10:302::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 10:35:37 +0000
Received: from DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74]) by DU2PR04MB8582.eurprd04.prod.outlook.com
 ([fe80::c96e:12f1:67b7:ed74%5]) with mapi id 15.20.8534.052; Mon, 31 Mar 2025
 10:35:36 +0000
Message-ID: <7053e5e5-289a-00d0-8f18-41d1cfc52e9d@oss.nxp.com>
Date: Mon, 31 Mar 2025 13:35:33 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 2/2] clocksource/drivers/nxp-timer: Add the System
 Timer Module for the s32g platform
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, thomas.fossati@linaro.org,
 Larisa.Grigore@nxp.com, ghennadi.procopciuc@nxp.com, krzk@kernel.org,
 S32@nxp.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250328134208.2183653-1-daniel.lezcano@linaro.org>
 <20250328134208.2183653-3-daniel.lezcano@linaro.org>
From: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
In-Reply-To: <20250328134208.2183653-3-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0024.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::37) To DU2PR04MB8582.eurprd04.prod.outlook.com
 (2603:10a6:10:2d9::24)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8582:EE_|DB9PR04MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: baf1b17d-5976-4933-b863-08dd703fc615
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QjRSUElmcGpMTDQvWm9GekxxQXBkcnhYQWZtcnNHazdpaTkwa0NPSWJiNGd0?=
 =?utf-8?B?SHRrSS9WblFZZU1uTUFZSWdweVRIWlNYYXVLQXVkV1loWU5uMHNwREFUUVlZ?=
 =?utf-8?B?M1o0NGZiRjZTclpRRmNOcjhRcElLQ2hTeCt2VEc0TTRUUXVtVUxacUc2dExU?=
 =?utf-8?B?eEhHZmRzM21sTEpHdms2L2dQK0VwbnVGY2M4blpkQjhVSEJZTFBOc3hMaVVW?=
 =?utf-8?B?R3dmR2lxUllkRUErMjhXWElFZjk0UEFJTE5QUGxaQlR3TWs0QlJSQkl5RmNr?=
 =?utf-8?B?L2s2bUdoYzRPazFhTUlwVFhRaHhJUTlCKzFNSEtOQWVYNVdNWjNjcG1ZNXY4?=
 =?utf-8?B?SDVjNlVybUV0NDBJMXk3a2RUWFJRbnZqOUFmNi8xdnVMRHQvSVNSb1RnNTBY?=
 =?utf-8?B?c01YMnF2aTNnSU16enFMK0UrQnhJREFqbGFPcDBzYW5TM0hBMTBDT1FodThR?=
 =?utf-8?B?Uk9BVHkvYWozUCtJazZOejdNbHExRDNyWnFNVitsc1YzTEZOelFuR005UjVq?=
 =?utf-8?B?Q2c3eUtkb2kwc2tsaHlJc215U1h3ZDVIUlY4SW0wNkhITGxCeUxXRStBV0sr?=
 =?utf-8?B?N2F5anBBNlJia2djYmNJVUxRYjdDVzV2TEVySDdRaFBlUlpweG5tTEEralRx?=
 =?utf-8?B?UGRycUY5dVRBaXpIdnFTZG1xc1JIdUN5UEYxbVZIYkozQTY2T3Q3blhwL3hN?=
 =?utf-8?B?NTlXb0pHTFcwMnJwaytoQ3Z3cG4xZTQwL1o4eEwvSi9ZdjRBbmhxMmN3eW82?=
 =?utf-8?B?UUZXaXp3WGdRaEx1akw5Rm5xL2R1bjIrS3JNUTlYZEdMd3FvdzFKOWZZbmFY?=
 =?utf-8?B?eHgwSjN3UWtBUmlPZU1DUGpuVU5zUVF3bS9OT2JadkdiY1ZPL2tkOCtUYjhj?=
 =?utf-8?B?eWh0Ukx4QnRiVGlSalJlMlZ6eTl2UEhHTjlZUVZCbk8vL2VJc2pPb3FSWjJV?=
 =?utf-8?B?T2xVZmRvTWNXQVlaRnZGM211ZjI2MEJPY0djOXFna3ZpeFA3N3U4bndaa3ky?=
 =?utf-8?B?azY0TnV5YVpUakI1VERKZ1k4N3MwUTlQUS9pNnAyTml4aW0wY2JkRytQRWFt?=
 =?utf-8?B?bm1JOE1jQnB5dVZCc2pUeEJvaVdyOXh4Vk5abTMxc0V0YlNEVmE2WjdIRktv?=
 =?utf-8?B?WHVwdTUxWTRhWHovOUNDdFFSSVRVOXV2c0dQbENsLy9iVlZLaEtpL0RmSG1N?=
 =?utf-8?B?RTJrOVZKckVxdnNHbmN2TVBqZkt5ejJCeFBxN0ZkK014dXNoTnU4a1ppUXVl?=
 =?utf-8?B?KytxT2RJOC9jMmZPR3g3ZFFvbGh3WVZYMVYzYVJFVkFwNTN5OTBuWFJTUzhV?=
 =?utf-8?B?T0huMSszRUI4V0ExK3MxU2pYNlBsNW1FQ0FNMVpIZXZMcmJrQlYrTDZIdTFq?=
 =?utf-8?B?d1Z5SXdxTmNNck1EbzhWbzI0a1pZR0xCaGp1R0ZySlhIc3Bjd2pOVWRkeTNX?=
 =?utf-8?B?eE0rWWVIYTg2eFF1Y2RIMkRnU2FrUWpmbEFtelZVbDR1aHl4L0F4cnpIUzNv?=
 =?utf-8?B?Rm1VT1FCdjhGWWMwK1RDaHRKVCtOK0JGTU1BTnh0b3MxSDk3ZitwbFdiVWZP?=
 =?utf-8?B?SUhzY2lVV2NyR2lzd0ZKWFMzaktyNUJZRFMxTGNTaFl3cUIxSkFpMkQvc3U3?=
 =?utf-8?B?cytwRkt4aVF2U3g3akg1OURvRmxxaXpBajNBVm1pN0tXR3cxS3Z2eU1IdjRq?=
 =?utf-8?B?T2NuVFBBejZNZXpydE0rQVlSM3dyTkN6MGxZUllVRk90UTNnSUxXWGlKVWZq?=
 =?utf-8?B?ZURDaGJ0WGRHYkU3STZhNU5NcnJ6QUozWmVoeERDVEhSYTNtTmNSWFFaTm5F?=
 =?utf-8?B?YitSQkE2M3pmdlZrN1RIUTVqQ21UUHdrYkFxdjg4MGRjNXFPMFVsa0IvWUNi?=
 =?utf-8?Q?UqqoT43a/TBnO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8582.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UDJIWXZ0TDI4dkhManl6Z01FMjQzbmFoRzRMWHpQRHhIQkhneWtXYnpPbTIy?=
 =?utf-8?B?Z0xFSk5yeG1OaTFsT05uSVBQdXlrV0RId1pVcVlJY0Jya2dyZTlUV2tsZmxh?=
 =?utf-8?B?dTRFUEdWamo1VERxTFlFYTNhdFN4d3R4T09EbmxTcnFaak9oMFc4MXI2Z2g3?=
 =?utf-8?B?aVUvT3owU05QY2s0NE91VTZFb2tjblRDbkVadDl4Vi9mNFpHbldwbkdnOEJ2?=
 =?utf-8?B?algxUkFsQWowbE9lSURjWmJoVXJGanY4dm9XUVBNR3lRWitRdlRpZGhzZ0No?=
 =?utf-8?B?NVVSaktBVnM3Z0QrY1VOL3lUamcvZXA4N2tNY0gxRDE2MXBoTHdDVi9pR0J2?=
 =?utf-8?B?RDNlSEo0RHdHcEduNlFiSTJmeVFHVmE3aStsM1FlZEJpYnplUENPd1IyWk1S?=
 =?utf-8?B?ZDgvZDVvdlZBaU9rWGRxS3hGdWF1d1B0S2FGaElPUEwxWGp4THUrSFRhS2NY?=
 =?utf-8?B?ZUtvMDFvR1NUa0JzY3dqMzNuMjBLZkRvOHJ0SkdURjhZbUllSVJoVFBpRHJk?=
 =?utf-8?B?ZVRYWWlGdVE3SUllQnhnQ0I1Qm5tejdvbnNZNEx4UnpNem9xTk1SYzd6K29G?=
 =?utf-8?B?NzA2azREMzZPY2pPS09sdHZnWVlvcWxBK21KWjMxMjlBUmJZV0x3SGM3VWcx?=
 =?utf-8?B?NlVHUEZiU21XSDZKTE1vVmdlYnZqVlQyNkRBaTk0WGRmMG9obWtRMGdGYzRV?=
 =?utf-8?B?NmJNQitMKzZyT0ZhSFQvVVdINjh3bDZXajFEc3RHemplY0lDV3VobVFESzZv?=
 =?utf-8?B?aXA5YW9LYmVDSzJpVDVXWnlKT0IxVU5md3lta3VKaVlrekJPZ2lIb1kySVIv?=
 =?utf-8?B?UmtNb0pEV0ZKdFpSQlUwbUZqc2ErcEk2YjBzYW54Yk5sdnlrbDMvY3pmazY3?=
 =?utf-8?B?WFVFYnZtdjRYU0UwdmVvOCsvUWJPUTEwUGFFa2U3VytLRVVZMUcxaTcxVytS?=
 =?utf-8?B?b2Z0MnhTUm5YMVRHaTByN1VJZTdWNEVvUGR0ZVpDaml2Q3h5VTErelVSSVll?=
 =?utf-8?B?Znloc2liV29JbFlTc1dQOFAraXlyMnpoT2pQWER0c1VJNmtydzQ1VEdIeWZX?=
 =?utf-8?B?bGIwbjRvNWVxUis2RlBQVkRsWVZtVU9xdm5DYTZleUpaKzFObllvUXNxOWhF?=
 =?utf-8?B?ek5sZ3RqTkhIdWhjREJweTh4clRLN2JDREZiY00rNDNKSkVUSEJnT212UUJQ?=
 =?utf-8?B?MWNEOHVLN0xzNDVaMUovRDRuZ3hycjMzaU9YeVBvemkxZFNqZTlSa1VJbTI3?=
 =?utf-8?B?ekx3TG9uM0liUlUvZ1Y0R3JQTDNRUUd3Qk9xbWlIdXRRT3Myd3RpdmlnbTJB?=
 =?utf-8?B?emI2VjRPbHBPaVl2UDNSMXpqcUxmVVloSjA1ZGFiOWZVRHdQcXlqWFI3b0dq?=
 =?utf-8?B?Sk44dnQyTUVhU2VwTitmdkJtdWxnZzZBVktZdTFvc1dLVXNWczNGbFlVQklR?=
 =?utf-8?B?bENmeTI2aVZnNk5LVG9wLzVrdDBVSGl2eHdBMmNaWGtGYXBFZ3crczlHSk8w?=
 =?utf-8?B?SVp6Z1ZQakF4VGdLWlo1aHJDV0dXV252ZHBOWjdVNVRHRTRvK1ZiSTN3bU1W?=
 =?utf-8?B?VlZTb3VYRzByMXZKdU55Q1NWOWsxSTNXdm84cXhxMS9TMjZUWUVmemJNSmxo?=
 =?utf-8?B?QXNhTVBsSEZPSllrRzVENS8yMm9jRk82R1Jxb3FjZnBNSVY0MmVYR0x1a2hY?=
 =?utf-8?B?YXZIbUtuRi9YRTdYSERHdjhMSlhveTJrRFdVM0dqdXZtV2dDQVFza1RvYXNI?=
 =?utf-8?B?d3FYck5odXhENCtKbThrWjdWSE9yVk1YVWR3dURJMU5idnFYNW9Ua21VMUF5?=
 =?utf-8?B?VGp0YVFvaTNPU0g0RWdMS0o2RU5mZVZvMElaMWhsUHdHVk45UjZlUWdOK0RT?=
 =?utf-8?B?aEM1bWR1OUllUVN3R1lUeWsxL1RpZlNySDByZEsrMVlpTmFhbjRiejBibXNG?=
 =?utf-8?B?cnkxYnNlbXhNeVV5SVBFbWdNRW9PTURVOERER0ZPNVhPRTAybWJDMmtjTWhk?=
 =?utf-8?B?SjZkOHpTSksxMGozTG5yRWd1MEFzcnNRTUYxenJQWnRiK0lBYWlaOVFOaGY0?=
 =?utf-8?B?Wk5xMmN4YWZJMmxFS1JYOGpoL3dnQ2x0dG5acSs3UnFOZEVoOERMcW1zMmlX?=
 =?utf-8?B?MlU3dmtBNDdTaUZMK3h5a0FLS3R2VUVmY2lKeEppcjV2cnZtcjczMXRHWTRU?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf1b17d-5976-4933-b863-08dd703fc615
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8582.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 10:35:36.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8KkLOE2jif3V4F8z8eap3TekVsWP2S+nhjfigNLWzxr9aLdIquHyT9FUOi/OspKZazrQBj134cvisWakxa5qiXut12z3hiq4EOb/CWBnLKk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9703

On 3/28/2025 3:42 PM, Daniel Lezcano wrote:
> STM supports commonly required system and application software timing
> functions. STM includes a 32-bit count-up timer and four 32-bit
> compare channels with a separate interrupt source for each
> channel. The timer is driven by the STM module clock divided by an
> 8-bit prescale value (1 to 256).
> 
> STM has the following features:
>     • One 32-bit count-up timer with an 8-bit prescaler
>     • Four 32-bit compare channels
>     • An independent interrupt source for each channel
>     • Ability to stop the timer in Debug mode
> 
> The s32g platform is declined into two versions, the s32g2 and the
> s32g3. The former has a STM block with 8 timers and the latter has 12
> timers.
> 
> The platform is designed to have one usable STM instance per core on
> the system which is composed of 3 x Cortex-M3 + 4 Cortex-A53 for the
> s32g2 and 3 x Cortex-M3 + 8 Cortex-A53.
Missing: ' ... for S32G3' ?

> 
> There is a special STM instance called STM_TS which is dedicated to
> the timestamp. The 7th STM instance STM_07 is directly tied to the
> STM_TS which means it is not usable as a clockevent.
> 
> The driver instanciate each STM instance described in the device tree
instanciate  - > instantiate ?

[ ... ]
> +#include <linux/clk.h>
> +#include <linux/clockchips.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/debugfs.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched_clock.h>
> +#include <linux/units.h>
> +
> +#define STM_CR(__base)		(__base)
> +
> +#define STM_CR_TEN		BIT(0)
> +#define STM_CR_FRZ		BIT(1)
> +#define STM_CR_CPS_OFFSET	8u
> +#define STM_CR_CPS_MASK		GENMASK(15, STM_CR_CPS_OFFSET)
> +
> +#define STM_CNT(__base)		(__base + 0x04)

Shouldn't the macro arguments be enclosed in parentheses to avoid
potential evaluation order issues?

[ ... ]
> +static int __init nxp_stm_timer_probe(struct platform_device *pdev)
> +{
> +	struct stm_timer *stm_timer;
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	const char *name = of_node_full_name(np);
> +	struct clk *clk;
> +	void __iomem *base;
> +	int irq, ret;
> +
> +	/*
> +	 * The device tree can have multiple STM nodes described, so
> +	 * it makes this driver a good candidate for the async probe.
> +	 * It is still unclear if the time framework does correctly
> +	 * handle a parallel loading of the timers but at least this
> +	 * driver is ready to support the option.
> +	 */
> +	guard(stm_instances)(&stm_instances_lock);
> +
> +	/*
> +	 * The S32Gx are SoCs featuring a diverse set of cores. Linux
> +	 * is expected to run on Cortex-A53 cores, while other
> +	 * software stacks will operate on Cortex-M cores. The number
> +	 * of STM instances has been sized to include at most one
> +	 * instance per core.
> +	 *
> +	 * As we need a clocksource and a clockevent per cpu, we
> +	 * simply initialize a clocksource per cpu along with the
> +	 * clockevent which makes the resulting code simpler.
> +	 *
> +	 * However if the device tree is describing more STM instances
> +	 * than the number of cores, then we ignore them.
> +	 */
> +	if (stm_instances >= num_possible_cpus())
> +		return 0;
> +
> +	base = devm_of_iomap(dev, np, 0, NULL);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base), "Failed to iomap %pOFn\n", np);
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	if (irq <= 0)
> +		return dev_err_probe(dev, irq, "Failed to parse and map IRQ\n");
> +
> +	ret = devm_add_action_or_reset(dev, devm_irq_dispose_mapping, &irq);
> +	if (ret) {
> +		irq_dispose_mapping(irq);
> +		return dev_err_probe(dev, ret, "Failed to add devm action\n");
> +	}

Wouldn't platform_get_irq achieve the same result, but with less hassle?

-- 
Regards,
Ghennadi

