Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1732B171C9
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 16:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748277003; cv=fail; b=P+6ymm75+Y7lfFK+Kj5/+lMVamTB+VrJi6LW7XRcmJPyawxKipx/FeuDNkD422rZO6drVuLGUuyapaRrHQxE4WhUwDgbfTuVklQGcq7wDxj9EG4wF2UZIMSzAfn4MDBMwOJV1Qhj1CxAv7duX3fokYwuqryS14z5IX6RQyMF3GY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748277003; c=relaxed/simple;
	bh=sh8xEkNwaDzxnampjkuplRzJXbLkRVc5gSUWwsHuSG4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=HCxSwCV+EfWHe6loj9XQHnZsp3VH+Co11hd+s/jARb3ecchPhvpPvrGRWSWFJ1Zdx89K+E/Iul9UA06o5aOfQWx3Lq7wgnPmU6zmbS+rCbG0EJJWWDkm+6dJomBcx0lQxa+pspFdwDER2ZSGmRDtuyxcxa9oBmTXpyUIAhUi39U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eXl8cd74; arc=fail smtp.client-ip=40.107.22.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eXl8cd74"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tOiOc9lDC+z3tT/IRBV1CFfY+mhkHqKSKClrlBtJXabdBF/fsgEa5qp8LLlQCNjtzULT2joH2m19ml3WCRpE4wLZsz0K7TtyGx8ejD/tKlu3MrROx4ggcYHNFhHOXR1biWPMhRWIOn3RhAia9xUOc8v87VKWF5LIM1bPu4p1IeRqQ8sln24JgK5FZZFjrOJ1pjU20nhoWzCjGNZi1D1m8+TpDSHnqAnnf0aW76uTOYcG89C/VE2shL5JLGo85nWpSAqjex889McxW3wPxVQRlaoMO6sybz5Lmb3+C/LpxSMBfUX9Y/UKOYf4IcFF3M8XKGcjJT908CdsNXb4l16oWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QNpa4GVkIXJG0wDX9VDfII3oceIlZMMmFqdB400VhWM=;
 b=u2NFNA3xXEm65lTqOB8ao+ErwuIAY0cEYUjdEyLJXF6NhR/TidKLL1a0XB5qPbBpRhjW5f0FHKHUmuQKm8TogZhn9xB59Ppn9sDmWgFAIuCUsCDaRbsBrVPb9BW0qZpEeThdDv/000A5NCZsQsKukMuQvSKiKFvOQRKYJ6AnbBUEZnqumrU63DlnuZ1gS0vDG8asdmBUQEsEur/6kMqv3y5Rr1CjHLgcz04ybXJrNuvX3LRy7Mri5j6KmDIVXLXjOHLg+si69mQE3xIB/lz37ovmHPvDGlM7CljAbajI97oxXuTsbiYybM0FqrLTEbybNQy/t75ek6yokLXhzWWRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QNpa4GVkIXJG0wDX9VDfII3oceIlZMMmFqdB400VhWM=;
 b=eXl8cd74JZFh4FjckuxZbtEdaUAkmRUnF4zH4lgEfFoIrHeHMn5VzIPWwP2AQSBv5mZuo2mEVinRqQjRpLq708pErn+779jGlohuWjil8IDGVnEiJOwlsrSO6GyTE/KnmTJMbq33hF5XkYHQ12t+wMKp+Y5xZBRkBd8HENOY9cdTw0fCqFG76q4RsO9jNO8c1Scg9ApeUAZD7ekSRFnnzFPwZtHrMRqF6ktbfPxR3ORnqgqTNyDcudOKL1nubKWRsnOc59ixCbslqLTgXkqrw+wT32JbH9r5ALAswkwbYBdUNRHZARGjEP0NdT+jUsAa8MgIylibAdk3yyQQDWzomw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Mon, 26 May
 2025 16:29:57 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8769.022; Mon, 26 May 2025
 16:29:57 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	imx@lists.linux.dev,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] arm64: dts: s32g: add RTC node
Date: Mon, 26 May 2025 19:29:53 +0300
Message-ID: <20250526162954.2467894-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM8P251CA0014.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::19) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: c6eef146-12c8-4ad1-5494-08dd9c728da4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHhMNGU1Slowc2F6VEVFd3RlM2dLSit5MmluNGhZNXlQY01xZ3dMQlF4aXBP?=
 =?utf-8?B?OWpGU01zZFluWUpOUC9MNkJURHNTWUZnRGdTWUF2amRCTk9rRTZGWnY3eS8w?=
 =?utf-8?B?TktiT2VhNG54R3g0TDYwSmpwYzNlbVBFUjgzcnE3NUZBaWRPS2pIS3JzRkRs?=
 =?utf-8?B?YmYyS3p3OUdVbEYzMytBMVRDemRReGg2TktWKzFGaU9wZHQ0ZG9CLzc3OG5D?=
 =?utf-8?B?OTVqVEtjQytvYlEzNnRvNU90NFZSdUdDbDNqbTJjMW5CQUhzaXQveUpWazlP?=
 =?utf-8?B?dXFRUEJSazdITUg3bVJpU0dhZ1VWbjBVVGNXK0NuUHpucU5FcmM2NVNmcWRn?=
 =?utf-8?B?OFYyb2ZzdVFMZjVoMVVGV0taYTFtRDV5b2JvcFFBclh5VkI5VU9nSUlIbHdh?=
 =?utf-8?B?N2dvZk50TlRpbkl3U0xoSWtrV3UwNmR2RWk0OS9UZTdPZ2FIbTZVUFIyRGw3?=
 =?utf-8?B?blFxN2ZLelV1S01oSjIyTjNPQk13QUdadllXWlpyRUpCOWV6cGZpU3BtWnFv?=
 =?utf-8?B?ak5XZGlmTmhXdjdaYWpDc2RySjRXUHN6RVdVQUh3cVd6Y3NUK0ZWQWw4VXhq?=
 =?utf-8?B?UHZMc2ZPVE9sbTQrQXlGMmlwSEdGMnBqc2cxQkNwYnR4aHJrVXduTHJLbVZK?=
 =?utf-8?B?SEhQb0h4dTl1YlBoV3Uzeit2Rkpobk9jRGxQT2JTaWo2aEwrNjEwOWNyOWNE?=
 =?utf-8?B?KzFJOHFtOHQyeXRzWDFxS1U2b2R0MlVpTFh3ZUZkd3Rid2gzcTFXWUlLa1Ez?=
 =?utf-8?B?RVVpcjNrdEo5bTczN09OK3A0ckpEQldhQXBiQXh5ejRHb1RhWEtLT1RFQU15?=
 =?utf-8?B?ZVVzK2VaV2ZPZW1yVTVtd1FrVWtwNWprZzFscnN4WnpoQXZqcVJyc0NhaVNX?=
 =?utf-8?B?Q1ozYWFXSS9SVVZHcFNkNDhrQ3c1eis4ZUY2UHVUbzg4TTM5WFFUWDlZMnRN?=
 =?utf-8?B?UnFVLy80V2l5ZEd5bTVrVDJlU1RLMkNUbGJrcE1ZZnlvVHFpa0c1VkY4SVF1?=
 =?utf-8?B?SkhiYitxUUVPcm9HSEpzSjhXUHhRMDI3RUZzVnhSMk00WlQzejVzb2xjKzZi?=
 =?utf-8?B?VnhGY2ZaSnhjSUwrcEdsSUk0c3dpWStpNTJraDlaTjR3a3lXcmE1MlhIaXkx?=
 =?utf-8?B?VFRnVVNqTDFGWEY5NlJlQTJWZ2xPNFI4aFJ5ZVZTcFEyTldKRXl6UGErK2Ix?=
 =?utf-8?B?ekRaSzhmU2V5SWdDRW1xcWJnUkRnTFpWWTdycDU4WU12TjlUSFBrcHBwMHhQ?=
 =?utf-8?B?amViUEdHRXVrRFJpMFVwMVp4Y3VJWVpiN2ZTNVhFbXE2QkhUQ294QUY3ekZm?=
 =?utf-8?B?cHQ3Y0E5a25IbHFaY3FhREI4d2I4R2VqejluaXRmb1V4cHRiMGhHYnBKaTNh?=
 =?utf-8?B?T0c4YlVrWC9JRmtUL24yaHphOHhLb3JBT09WRGZnd2s2RGRJK0VZVnc2aEJr?=
 =?utf-8?B?em5rd3kzYVBqL3dBTnhjcjExNFR3c1MyeVUyQWd5M2R1MDFpZkZPYU5qQ2Fx?=
 =?utf-8?B?b0NqeXUvNkU5L1pXdXRlbmJpbmwzQ0NYOFNPQmdMUWVSNVlmUElRVENSVktK?=
 =?utf-8?B?MmltRTYxNmNyOFBVVE50SFUxYmM1ZjJWRnRQUWgvSVJPZHZEYzhCeUpXcFRC?=
 =?utf-8?B?dlVKbWZBR09HSFdLTFc4czdGeWRpVWtSWVAzV2VlU2pYYXJrb3g5OEcxRlVL?=
 =?utf-8?B?VFNxbFlqYUJMNGQ3cTBGVngrYThLb0lmc3NFaHl3L2VLMzVac0JucWtiVkpa?=
 =?utf-8?B?aG1xdEIzbnhwTndwK3NSaTlkSnY2RHBOTE1RWnh2UGZleHFDNFp6R1o4b1BW?=
 =?utf-8?B?ZjhIMmpjLzdSeHpoK05lam5hNlJvVkZVYS8vWjJveFlSaDE5b2Mram16TkF1?=
 =?utf-8?B?Ry9MMG8rNkUyMUdQSjZJUW1oUUYyQ1hqdXRMUFdwMzlHRTNFOXI3VCtjTXAz?=
 =?utf-8?Q?27PTS4UoCR4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlRoV08walFsNFN6dVE5K0hRWHVubG5PeEYvamlya1dHNVlXUXdIbWh1VDhT?=
 =?utf-8?B?TG5ScU5PT2h2ZnFmMWlEUjQvYnV4dks5TTd5Uk4wNzFuYXI1WEVmZHNGcS9G?=
 =?utf-8?B?TTVTQW40c3NIQUEzbm1hUHJzU2Jxd0ZXamRLaVpWR1E5K24yMzlEeFlERFZM?=
 =?utf-8?B?RkkvUTdrV3E5TVV5VzZKVnBIL3FxeWJDTFV6Z0RrTnJLREU2ZTFvZU1JNUVD?=
 =?utf-8?B?cERVOGJmbjdUTUhpaFJ6VFU4RVA2RmNOUUMva3c1aGRkbnhreFRoOFlieDhs?=
 =?utf-8?B?SDJpVk1SSm8rQWhLd1NHNTkzbHV1MS94cWMxQVdFWTExcXNOaktlWm5yZ0s3?=
 =?utf-8?B?QlhyTkNkNjBsY05YVHJqQ2NEdzhXL0gveVdvUlVxY3RNUU5QZDByVzMvVVpN?=
 =?utf-8?B?MDhEajVJcDlkUkFVR2p2a1J1Mk1ZYW81Um9IYjFjKzAzTTFFVWE1ZnJnbGhS?=
 =?utf-8?B?emNpLzRFT1VwYitOR0tnaXlML2J4SjVMOWtveFpFeHBmU0ZvT2J2QzRxWlNB?=
 =?utf-8?B?OEV3SngvOTkvOTBuTGZISE5vNTQvNjBhTjE5NHdsSWx3MUI5WWp0amFDdThk?=
 =?utf-8?B?bWJDcm0yRGEveEtDSUtnVzBIUW1RWXgwRHdiV3hkYkVDOTY2QUNEaHlvV01r?=
 =?utf-8?B?SmV2VlROUjRwclBXRjZLcjJvRVFBemJzZUphd2tpSzFuM1h4WnRKNzR4NEpL?=
 =?utf-8?B?WFp6MTl1OEdRdUlNRVF3MlFmVjBmcDRYR2Nmb0lmU1FQWTZjbUpKTXgzT1pq?=
 =?utf-8?B?eFMwOFRwMDVFeFZnR3E2RElpQi9LM1dnVGxTQ1oxZUxOV1R3SUttK0xzRUVp?=
 =?utf-8?B?R1Q2WXFteHFFTG83cEthQmN1YUJrVTlmdDZMMzRXRTBXOWpHOWE1MHFKTGJR?=
 =?utf-8?B?bFYzV2VTcnBJU2RSc1hzWmM3ejM5MFNqZ1YwZktObXU3UC9kUWM0dGtUOUJZ?=
 =?utf-8?B?bEo3SjJnekFUbWZnN2ZPNVFmY2krU25IcGkrQ0lGR294OHVmOVkxelJKaUY5?=
 =?utf-8?B?eUJ2cG5WaE5OVGJ0TjVtSEhLczVWdzNLbVNMTmNBK1EvV0N5Qi9hbThNZkVF?=
 =?utf-8?B?S2RTODZqNHJETG93andyVmdSdkpqQUFZSkVyTkFmZEV5Tmk1UHJTYmIxOFc4?=
 =?utf-8?B?RzgwbFV1TWI3eEZFQVpPamNVMFVBMk9WeGpHMk02d0NCL1poN2VqQm5ZaDBM?=
 =?utf-8?B?cEt4Ulp2Ulc5ZXIyUUUyZVpnb0Z4ODIxZXZHdXFxNndtczNBSGV6bWNkWlZt?=
 =?utf-8?B?NVQrNWhtQ2RnTXMxNDdCWHRDS2V4bndkeEg1VWhuK1UwYkpNaVlzQmJ2T2hQ?=
 =?utf-8?B?Z2U1QmlQMkJhTGZtZ3VoSzJCRnFDSDc2dDJsZlhwZW42RnZ0Z2o1TndPSXRW?=
 =?utf-8?B?d2RDWk1LeS9uZzJ5M0tZOVh1RDV3ckFyMGJtU013SEVBRFFXM1ljcXBKSUhh?=
 =?utf-8?B?RFFYd0RmSmlKaEdtdXBtN0ZFdXcxTUlsSm5CaGI1V3FGUEtZT3B5M0JoeDZx?=
 =?utf-8?B?S2ZiMjhhWDhvSXlWaXVOQWR2NEdUWDV5K1lxc2pSOGJSUE1JeUZqS1E4M1pE?=
 =?utf-8?B?czhQUmFIN0pwajdXQU9yR20rQUQ1Q0o2WXh2MEE3ZmluTWlkRWF6T0x4ZUQy?=
 =?utf-8?B?WDNOMzgwd2xWYjdrczU1UkdFNUZQdHRpdzM2TFNsamVkNmpnYjg5THkrU1Q2?=
 =?utf-8?B?V3Q5d0dwdUt2Sk5NT05Dd1VWKzZRVVBEUlh1NG5TRDd0LzlrMDgvaXJ1L3Ux?=
 =?utf-8?B?U2lKVFBDTVhXY2ZHbUpuaGh0bVU1SGJhcklXdGRvc3lIOFdmamNIWWpiNEJj?=
 =?utf-8?B?U2RqRUhjb2szY0lCWUdUM2JKMXRYZ0E5RVVtT2VESmVudWdueVVaMEpNYzZT?=
 =?utf-8?B?T1pDZVAyZnc2d2NXQXh4dDFqeXJQNXBhcVk4OU5FZjdaR1c4WUpDT05aRmk4?=
 =?utf-8?B?YkI2NlNENTFvS2FPTnQxSGF2L2dtM2xNUExoakNjcnpqZWQveXF3VDA1SDI5?=
 =?utf-8?B?NEFuaUxocHFMUnNta21Od1BYKyt2N0R0S3RKWm5iZmliSDJoYlU5cmZodTNG?=
 =?utf-8?B?OXI3RGJ4TEdlT1g0U2hObjZ4ak1LWTcxdlc4MGxVUTBWeXRseksrSFd5b2N1?=
 =?utf-8?B?U01jeXJSZEtJQ2FWTy9UQVBrbGFBckRKNnpmazVFWTNlMnBYNW52b0VheXpP?=
 =?utf-8?B?Q1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6eef146-12c8-4ad1-5494-08dd9c728da4
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2025 16:29:57.5032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0oX5ycd4WDfVwc7T66YCSkWZc6gDCm5aYPbDPwWVRlfsRv9YVDplwR8uMbA0lGv57BZNLiDrkxyr0LCKUurmIlUBi50YBvOOsf5Er3YIQ4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC module on S32G2/S32G3 based SoCs is used as a wakeup source from
system suspend.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index fa054bfe7d5c..39d12422e3f3 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -114,6 +114,14 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
+		rtc0: rtc@40060000 {
+			compatible = "nxp,s32g2-rtc";
+			reg = <0x40060000 0x1000>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 54>, <&clks 55>;
+			clock-names = "ipg", "source0";
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index b4226a9143c8..e71b80e048dc 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -171,6 +171,15 @@ soc@0 {
 		#size-cells = <1>;
 		ranges = <0 0 0 0x80000000>;
 
+		rtc0: rtc@40060000 {
+			compatible = "nxp,s32g3-rtc",
+				     "nxp,s32g2-rtc";
+			reg = <0x40060000 0x1000>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clks 54>, <&clks 55>;
+			clock-names = "ipg", "source0";
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
-- 
2.45.2

