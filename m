Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012043.outbound.protection.outlook.com [52.101.66.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0D1F12FB;
	Fri, 27 Jun 2025 06:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751004372; cv=fail; b=RGAl/4ckyRwmo1DgJGfJH+wFQm9PZECBKRBgcW4X32SZ/1VOfa2sHPPU+yo7Gx+MkSWNF8WomX05aMSxpAhidvOcLOf17/59g/BnZjzWmMz5jBGYEVGR/OUDnOCPgmVXJ/xSIkexNBEkMbIHsUcHazjuvcn78Bo16EZ/cm1wHmY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751004372; c=relaxed/simple;
	bh=Ta0K1hW4eDnxvc+J1tB4tIoOouW4eZFR7UDLT0whO00=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=SRhVolLBkxUR0INeA8UdpAbFwTsfKhKbTmClOdlc1UBVYoDsWaOJecUX8/lbbEtTkbrKFGo/HXtDmYcoN9MvI3gIHU4BECsEEPKs0phfnX8Qh+DEbOcjNeqtyVndZSYj5G3EiAQB+rcppHwZjrWnyq8iUJvt00ss+Y9FnrdqHX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gj7eJ8we; arc=fail smtp.client-ip=52.101.66.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gj7eJ8we"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNyq7u92UsrPRs43R0Qvs6Vkd+9PhvRYp2NMjb9Ob/1qdf48wckvSzbclwB+IRA/gvlOyhQth3IsTDy5vUtu0Tt7jnDr3ZGllgTyYs0Eh9paOZkstjYb0oa3QDACMr8S8ksQpCOGVKyYhjvLt1v94oP4Dt0PRJzI+ZpuAemYTTwhLwXNxMd+zWiKscB3Fc0Tyc9/tXG6Fz00W9ZpOAtE5utmvh//aBPSuJUKVo/pvC+WQm/fc7U3pWejVanmAvCY87FHUquWJvmmM2Vq5AMxmcpZdl9PFQfg+6C7pxA81dJlvgJuh33Lkc+beAtSthXCK3TMbBsQzBFoHECPS3ZgeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TpV5bpZNNb/GZm9XFhDA5kdOTIrUK+dv4g+udHhdmpg=;
 b=qqFaO4xe+BVHZN5ANdNGCRHbz6Yz+HdH4AAEn+0ck/7Ru5aJd8cNtN3Q/q33YgXFkGzA6hq+pidkHOQpKahwSFnKmG1O7yf1bsKPeXtT78rueXNGcej+9qRHEMDIvv2sXdIqdYOtTro2q+BaJ5g8NPE4tjEoMmGepFtPHm9Swx48t9iTkC98hLNspEwRicWGNB4gOJWQx7uwO6iD2QdKYD1HgztLY+7ZwgOQ2oA8kvW+MoX8XEBx6Qh+nQd9D+da8l01V6J136B2mOQK2YThTo2zPgptFIXcZn40+3AtwEeIgm6BpIWT0/gZENONWqXfbLcEJU9S7m5hNAdbYtjnnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TpV5bpZNNb/GZm9XFhDA5kdOTIrUK+dv4g+udHhdmpg=;
 b=gj7eJ8weDU3yIIiCj2pHy52GRMeCeMPY/MxLfaBxHtXlLlx7VH/dxtzI6eBa0nzF/aUAkSotD/kyJUFRzLscxZ9SRqWMU6+tEYlfk5Y3Y09dJ1uFiRATplsgQxUv602xe7hS2DfGnvTibVYVXBJGfL7/IJQg1rlRU38pPDZzoD3vUw6zLHHyvYAplAWSHGStNE8mwnYzsbFkyciq8AAlup74R4L5ZVDQTumcgS+ODldSdzHqEdYU4iIjQOP9RNjg6lw2I/ucY9/c39UEoPJXw3ireusycnADMPHxW/Oq64kUZwjj2zd+kYpP6iA8RNFN0pvT6icrqGOHxDahLYHO4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10943.eurprd04.prod.outlook.com (2603:10a6:150:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Fri, 27 Jun
 2025 06:06:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8880.021; Fri, 27 Jun 2025
 06:06:04 +0000
From: Peng Fan <peng.fan@nxp.com>
Date: Fri, 27 Jun 2025 14:03:49 +0800
Subject: [PATCH 6/7] firmware: arm_scmi: imx: Support getting board info of
 MISC protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-sm-misc-api-v1-v1-6-2b99481fe825@nxp.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
In-Reply-To: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: arm-scmi@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751004238; l=3523;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=Ta0K1hW4eDnxvc+J1tB4tIoOouW4eZFR7UDLT0whO00=;
 b=e+0b8pa5FTmnU+77zXb7+rmFkJDYrGxGGe9/7GMO3eaAZAJhYfb5MDAlV9Tw4iEEM57zwFo2K
 hJwmHaop8ChCI7j2Tq9OghlkTc1mslanzyf8DoSatu+ET1rVYAqstjC
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::27) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10943:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b12048a-b2e2-4e3a-c76f-08ddb540b350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NVkxY1YxdTQyVDBjcm53VHdQZjZRNEkyWlF1a0ZPa01zNWFmalBvbmJ0aGZj?=
 =?utf-8?B?ckZmT24wRGozODkvRHA5RXc2UHkwS29yUU9aSU0rbEMvU20vZEMwVHpzSXFR?=
 =?utf-8?B?TmZ6UFVjd3dnVnhHbXR0MDhQdUFFTmVZMHRwUHBSbzU0K0xsM2lUd1JwUUs4?=
 =?utf-8?B?R3hsbnJLSkFHMm1CSlRmOE5oY3FUa3RWamhRd0lVbVE4emZWckkwNHR0RHB4?=
 =?utf-8?B?dGxzZVU1VXBJd3hPeU5OL1hYN2hDemQxWVJnME5ob05WWHhjSVBtWm9aVUtS?=
 =?utf-8?B?WnlCSVNlNVNtNzJVSk1VdUFmbE1IdGpOTlRqUkdXYU9Sd3RWb01PZVhrdGJv?=
 =?utf-8?B?dTBvbEF2WXA5bWJNd0ZjR1YrY2cxbjRIcTc2THh2N2ZGeHF5L0xBZEMwTUZr?=
 =?utf-8?B?QkhiQW8wQkJjRndvdDc0WlB0K3Z4bEdENVM1OEU3Qys0S2NHbkZ1NlorRlFR?=
 =?utf-8?B?cWIwSGJrWlh0Y1hBa001U3hFL295TWhiRUJkZVVGNWtsTVNBZ2pYeG01WGdN?=
 =?utf-8?B?aWFxalJFTUoybTVpYVNjcXhTWjVKNE9YWW9wc1M4USt3Z0ovQ1BZVlBEWjlM?=
 =?utf-8?B?WW1sTkhpejQ0akc2Q1pibUt5dDIwRG83WnhTOTFFb2FzMldjSURmL2FWVUFh?=
 =?utf-8?B?RXhlaCtsYU1HdHYxaW9CYVIvMk1qZUhFYVlaYjJuSkVWNnFaMXJ3bUpXZFl6?=
 =?utf-8?B?blgyRVZRVzhEMTYwbDRXOU5UUkY0aGdsd2ovdnBIWGtHdDVQUnZHMjJKai92?=
 =?utf-8?B?RHpaQ1ozREFMd0d1cU1EOVB5VWgyN0IvSkprSEF5b0puNjdmQW0vU1VDaVRP?=
 =?utf-8?B?Nk4vVkNFeE9qajF0WnlOWXpMZTZETEh4aVF6cjIrN01rdkhjelJKOURaOE1k?=
 =?utf-8?B?T0RFdzAxNENDQnRBUyt6Qlp6MGN5TVpaTHVVVGNveDcrNEptMXQvOFViL2dW?=
 =?utf-8?B?VTQxNEtKN1RPL3hMaFVwMzJhTFI3blZJVE5lS0hlZDcvc21tTkp0NUE5M3J5?=
 =?utf-8?B?Nis1UEpMV3JLSkJ3T0xPZjgzWDhCTTJ1eVIxREM4MXBkelo2UlRKbVVHSW1F?=
 =?utf-8?B?M2ZQUlJOZlVOcGx5QzZ3T1dXcHdGVWpKa0JYUzBVSUxvVzlIVGNtR2ZKQS9L?=
 =?utf-8?B?OU5IYkdhZktJMHNKVHNpenBsb3hPcmhzSUpTWXBEdGtiQndQdUU5WTlCbGln?=
 =?utf-8?B?UHF1bUsyZXdMRVlvK00rZXN6OW9KMCtidWExaTFmVXU5TWhvTkpidEEzZXo5?=
 =?utf-8?B?cE1jSlNramZZSWx0dGprMzNZWjF5NzAwZXpGUVFYdzhrOHU4bWpmUkVyUEpZ?=
 =?utf-8?B?c3VkRFFJek9iaUtiZksyVktIZzBrcTFUUlQzMVNaMjVpSXNRbUlJa3hIWkVC?=
 =?utf-8?B?bGpJMVluTDZZK3NqT3doZWFqcDNETE5rVGt4eGd3R3hkSzNpb21yVEo2dEdT?=
 =?utf-8?B?bjFzWFdVYkM2OXRJZGhmMkkxbXhTT3RNVDJQZThiWlNKY3NvR1VmaTJJWWx6?=
 =?utf-8?B?YWNZU2NZR2tld0hRZTdLZzRaMjZLRytySHRBNm1KNzdrWndmS0g2VkNWN0pQ?=
 =?utf-8?B?b09SSDdKbHJTNTR0UGlFcEZaT2k1cHRMbGZZSjhoTGRRM044UElmbU9Bb1Jj?=
 =?utf-8?B?K2JGeEozWVlqRFV4SDU4ZHhqZ2JydnNGbTRlbENQWllaZ3lnR3lTbmkzK3Vr?=
 =?utf-8?B?WDl6a1k4K0FtUU9LUVEwUzEzd1VWcE5VRUpnRlpQUkZRd09QRFVNcDFWOU9D?=
 =?utf-8?B?SFhWOHgxNkN1QWxhYldqdmlxYTY0SjFRTFR5M3E4anAxd3NGNmNRYi9hSjNq?=
 =?utf-8?B?dTRvbjF6MVJqV2lJbnNDSE90VFF2aEFHU2JGQ09NV0xFbE5yVGhiNm1IaVFP?=
 =?utf-8?B?cG9za3VMUzJGK1ViTWtFVGxFR004NkswZUYvTkpPcHpLSlVqS01hTCtqbDBL?=
 =?utf-8?B?ZkdpWSt4Q3VQblN1UjkrbXUwSVdNMjdsQ1V2eXVRTGhOK0s3ejdyc0VJeGEy?=
 =?utf-8?B?bFJsWHB4bWF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T2t5Ky9ZRjNMWUZ3S0tzSms1TkZucWsrS3JmVzJqQU1nS3JNT05vQTNqemJB?=
 =?utf-8?B?L1hQNU5nS2NMVnkrOFN6dmlWN3lwWHFpcnRtb3paWld2dCtSUTNxdU4rWTVw?=
 =?utf-8?B?S0VweFhJT1BLay80QSt6eXJDaDRCcDh2Rmh3Z1ZkbVZ2TzNlRHUyTmFhbVd4?=
 =?utf-8?B?aUgyVXJVR0ZxQnlUOHkrd2dieTlCRnVYdFlrM2FIcUx4T1JtYlRIdG5VQ2tS?=
 =?utf-8?B?Yi9ldGxJNkhPWllyamJiY0M4MlkwalJZakZpbGx1ZTJrV3BsRGVMaUUyWUFE?=
 =?utf-8?B?UitEUUZ2YjRJS1RJSFZBU0pzMlBoZngzamZiVTgrTFBZNDFzYWxyR0Nhczk3?=
 =?utf-8?B?Q0pTN041cEtRY2MvV2VGZkJhZHBqN0xYSzVOUG54VlRtMnZsd3hBUURKZFdm?=
 =?utf-8?B?UXV6d3R2d2tKZ2xHamxjYzc4SVlnOFdGcXdPNnNyRWpkZWFxMVhhRHVrbnF0?=
 =?utf-8?B?QlhXZEVudjEzZzJMT2lhZVhvK3h5OU4vMXoxNEhoZzFubHNYR01PQW9VYjlG?=
 =?utf-8?B?N21GY0tqQTUvOXRqYzNiUGdKSXErVTF0V1ArWHhnS2xFSFl1MDBLMi9XeGxZ?=
 =?utf-8?B?eElHVDBYVmFhb2EyaU5SbTZnT2VHaEp2Y05wdmNBRVVab3ovOURqVVVXcGJy?=
 =?utf-8?B?N25kc3NVcDJBRW1aeXlzY3pCdzFScHp1OXBoV1hHVDNKaTZrQ2NCM1lzTnc5?=
 =?utf-8?B?WWVHeGgyVC81ck5XNEk2QXpJeWJHSlE5d2lVNlJBTjlIbEhWSkQ2YUhYdHpC?=
 =?utf-8?B?MTMxVlk3WHRTaitlODJGZEhkRnNwbXdpRUpTTHJNQXkwMSs2TFVKMm4vMmVV?=
 =?utf-8?B?VjdXUS90MVFjczdodlRYWmhlVVRxdFFoRWJ3QUoranhXdHZLblE3UEVWamtM?=
 =?utf-8?B?NGRaYnJ5Qk9WY0pnaXR2NURHcmpQSXNUbEZQdUNjdEFULzFSdVBwaVI1LzNy?=
 =?utf-8?B?aVFBdFFtbGVNcnd2MFVEOUtidDBBdmxqbjlhM1IvRC9oYzZFRjNMc0xlZ3ZZ?=
 =?utf-8?B?WXRJSWNrcnJYUDRCYjJqVmZkYys3cG8ySlhGNUF5MnRvZ1NkRFJsekJPUEZO?=
 =?utf-8?B?NlJ5cnBNOWMxdHRVRTJQWVpZUGd4SUduclQzMXIvcFZ5VGVPbEhCa1VQWk8z?=
 =?utf-8?B?LzhCNXBZL1B5T3NSTHdTbWlXUGg5RHM4Z2RwaWlFKyswU3gwYmJpRUpoU25U?=
 =?utf-8?B?dHZBVGlWNVVhTkJaeTBXVHlSdDVOMWNKZkZMcklJWnhTREJBdkQ1bFBaVDFJ?=
 =?utf-8?B?L3NzWjNYNmdBSFgxWmUrRHlqS0xad0hsMzVUVlhnYmc1NXpPdmJrUTdvbHBw?=
 =?utf-8?B?dkhpdXlUck9hVnRmMVRScU9ldjB1MkdZNGs1WmVsd0JYNlV5a0t1L2VpUEJs?=
 =?utf-8?B?R3BEUlJ3ZnpNU1BqQmpYb0NxWDkvb2lkeTRRMTBCZTFSaFN5bHBvUk1vQzE3?=
 =?utf-8?B?NTlrc3YzZUpuNUc2dWxLbHI4eFBFeE1hbVcrNTdIUDRORjVsMXRLdzRKOU5r?=
 =?utf-8?B?MEdtMkY3MlBnL1ZTQTUyYyszMEFkeElVYktCbENBZVV0UmxiaE9Ka1BnNElB?=
 =?utf-8?B?RTVxKy9GQTRRVThuMHBpMVJ5NXc1MlF5ZDdVVXlJeWdIWUxxWEdZRXY2Q1BS?=
 =?utf-8?B?TmVyS0ZRcGJNLy9VcFRwd3Nwd3hySys1bENPNW8vQkdqV2Z3TS9kOTk1UWRk?=
 =?utf-8?B?L1QrMUtxTFRXM3QyR0lLL2cwcWJPRkNRaENSOGI0UEFSOHpJdjZSVTVEVEZ3?=
 =?utf-8?B?SlJMbUljaTYxY1FuSTJnU3ExaEdHWXA4M3dtVE54YUVoRWFBVGJsUit3Zklx?=
 =?utf-8?B?T2w3SHhLc3NVZW41Q0piL28wK0xWeWkyN2RoK0ZVUEYyWCtQRWhuODl6SUZx?=
 =?utf-8?B?UzJFZ3RBd0pwQzY5MjdldlNOSFpneVFpVXo5QkZ3OXpOM3VFRjh0eENOYXpi?=
 =?utf-8?B?L1VxTmJaMFZ0VldFaUFYYmVabEJmRDYwTkoyMXhVTGNiWW9xVngyQmdTVkZl?=
 =?utf-8?B?RHZVd0VBTDNqdjhHejFkVy84QlFRUjBCdXUvcER3ZStPMnlMeTZDekxGY0tr?=
 =?utf-8?B?YVRVZ0VvOGhrNkEwYm9sZldZY3FUbldrUFRwT2FRMDJ1WjhQTXcrVXQwcmQ2?=
 =?utf-8?Q?qvH2z7zZA388HGZDTK9mhxlk3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b12048a-b2e2-4e3a-c76f-08ddb540b350
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 06:06:04.8473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e0o3vlAIJvZc9HOIZIpyKxYkbP0Nf3LZIzmiw+nYZn7qoSUtxqlEpkgeRb3Psq3Ew3p4ogWFSVxnVbu+zgMgWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10943

MISC protocol supports getting board information. Add the API for user
to retrieve the information from SM

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../firmware/arm_scmi/vendors/imx/imx-sm-misc.c    | 30 ++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h                  |  5 ++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
index 1a6d75357b76ce6bb7d06461999b368c27f1fa43..35c63e7cb189475807ed1e6723dbcb61ab66800a 100644
--- a/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
+++ b/drivers/firmware/arm_scmi/vendors/imx/imx-sm-misc.c
@@ -29,6 +29,7 @@ enum scmi_imx_misc_protocol_cmd {
 	SCMI_IMX_MISC_SI_INFO = 0xB,
 	SCMI_IMX_MISC_CFG_INFO = 0xC,
 	SCMI_IMX_MISC_SYSLOG = 0xD,
+	SCMI_IMX_MISC_BOARD_INFO = 0xE,
 	SCMI_IMX_MISC_CTRL_NOTIFY = 0x8,
 };
 
@@ -76,6 +77,11 @@ struct scmi_imx_misc_buildinfo_out {
 	u8 buildtime[MISC_MAX_BUILDTIME];
 };
 
+struct scmi_imx_misc_board_info_out {
+	__le32 attributes;
+	u8 brdname[MISC_MAX_BRDNAME];
+};
+
 struct scmi_imx_misc_cfg_info_out {
 	__le32 msel;
 	u8 cfgname[MISC_MAX_CFGNAME];
@@ -334,6 +340,29 @@ static int scmi_imx_discover_build_info(const struct scmi_protocol_handle *ph,
 	return ret;
 }
 
+static int scmi_imx_misc_board_info(const struct scmi_protocol_handle *ph,
+				    struct scmi_imx_misc_system_info *info)
+{
+	struct scmi_imx_misc_board_info_out *out;
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, SCMI_IMX_MISC_BOARD_INFO, 0, sizeof(*out), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		out = t->rx.buf;
+		info->brd_attributes = le32_to_cpu(out->attributes);
+		strscpy(info->brdname, out->brdname, MISC_MAX_BRDNAME);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
 static int scmi_imx_misc_cfg_info(const struct scmi_protocol_handle *ph,
 				  struct scmi_imx_misc_system_info *info)
 {
@@ -446,6 +475,7 @@ static int scmi_imx_misc_syslog(const struct scmi_protocol_handle *ph, u16 size,
 }
 
 static const struct scmi_imx_misc_proto_ops scmi_imx_misc_proto_ops = {
+	.misc_board_info = scmi_imx_misc_board_info,
 	.misc_cfg_info = scmi_imx_misc_cfg_info,
 	.misc_ctrl_set = scmi_imx_misc_ctrl_set,
 	.misc_ctrl_get = scmi_imx_misc_ctrl_get,
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
index ff34d974046aa982fa9f5d46fc673412e01a532d..4950cd6f50aa7b3038bd519a7287e805f70e1cf5 100644
--- a/include/linux/scmi_imx_protocol.h
+++ b/include/linux/scmi_imx_protocol.h
@@ -56,6 +56,7 @@ struct scmi_imx_misc_ctrl_notify_report {
 #define MISC_MAX_BUILDTIME	16
 #define MISC_MAX_CFGNAME	16
 #define MISC_MAX_SINAME		16
+#define MISC_MAX_BRDNAME	16
 
 struct scmi_imx_misc_system_info {
 	u32 buildnum;
@@ -69,6 +70,8 @@ struct scmi_imx_misc_system_info {
 	u32 sirev;
 	u32 partnum;
 	u8 siname[MISC_MAX_SINAME];
+	u32 brd_attributes;
+	u8 brdname[MISC_MAX_BRDNAME];
 };
 
 struct scmi_imx_misc_sys_sleep_rec {
@@ -89,6 +92,8 @@ struct scmi_imx_misc_syslog {
 };
 
 struct scmi_imx_misc_proto_ops {
+	int (*misc_board_info)(const struct scmi_protocol_handle *ph,
+			       struct scmi_imx_misc_system_info *info);
 	int (*misc_cfg_info)(const struct scmi_protocol_handle *ph,
 			     struct scmi_imx_misc_system_info *info);
 	int (*misc_ctrl_set)(const struct scmi_protocol_handle *ph, u32 id,

-- 
2.37.1

