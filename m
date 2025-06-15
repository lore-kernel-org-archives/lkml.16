Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2086.outbound.protection.outlook.com [40.107.102.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A54322A;
	Sun, 15 Jun 2025 13:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749994329; cv=fail; b=nPXP9wkNGlaeDhpnz6/LVPMyfAQ/47S1eiV6hPNlqp611DjNNBDlc01o7u9hr691i/piu6lgkbg98CNn0wohI9otD0lGop7ETsyxDVuAhiAHfvXTdG+uIZUrzzWW6fpjONv+iFevhmVhqw/Agbw4u00Cp2O1xx2mv/vmfkLbobg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749994329; c=relaxed/simple;
	bh=L2BP7Z0xqf9AaGNSAojIkp8P2mQET6+xdGrvGzKJpy0=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=dqcXkrspfaTS9icePpInR21//+xEwcaFL8CVy53UUQ2raVIuEka/gPLd/520pcVv3M33F38iOyQka6N0KtVvmuDv1WgvJ+AeMSnIIXuMi3XhnoeN/NB6ML845ArveaTj3rIHxr3uv9jwjxd/Noku6WKRhlGY97gky9jPqntS+FA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=X0Qd+u66; arc=fail smtp.client-ip=40.107.102.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="X0Qd+u66"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QNiWVB4q0RieJFbxzAWQ/PLt7CDkF0VxNYZHHUER+mxe1diLO2HIUSbFvWz0NjMZRFmmoSAQuJwetSmJGrj35/Mqm8/9aMpsCcg3RsJYsJxC1VikBUolDEdLFGlt1LRqHl92bdvs+CW+pSN6s17ghw3Po9P6Au5p2qS6hGPu2QP14ujyGsFojog0oEQWzvri1ur6mCYI66RMjgaXVsrbImgwnGB85YoK99Jj0oglz8ctYoR3k3WCmW/1LG4mJqxooqfP67ESvNh3nseoHKsN00OXmEDfkEhUljTN7ANRjNdHbZb71JUj0ZQkb2xOvFDnj45ecjTkdig46YlNLCVwqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJFWjjCJBbsM4G+X8MK5p1I14wDH1vxTQLqUx3EgN2Y=;
 b=JimPaq9egdFkg7Mvgnng8ad4RMcpJKXxvV5QMWelqv3sIWw6IFlDqMHXRVXiAQb07zKwzb9pEV1er81ba141gwsI9ldL7icCLDPpn24gnvs0hKK6/qW6mobMeWb4lJ8GQzz6MOZZq52GzPcGda5CDbQwEX3sF+zktCKirRXZD+9bTpEg0iOaD6RQF6tXiNa8WFJ0VeBSHMGW2XlHBkJJ8GmljqNSaRA75kTD2qyfjOI5RxmzmCbbi6KO/r+FnhSCWZyxw0WrghkhY7vPe6gEQzOwg3vkPJ8Hjl0DyV1RpnrIfXcrlgCqUVC63QI+aWC/T4M66LrLp6dalcnQU5AT5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJFWjjCJBbsM4G+X8MK5p1I14wDH1vxTQLqUx3EgN2Y=;
 b=X0Qd+u66F9ENse5NO5Q3SkU6U5PnrGM5QJRHAriiYPnWLmYxNmFsr40JHTIIr0X8U8guW1Rasjub3h+6CJnx0z7B/GWYJ2SzqBanboLkUMC51O98m01W/Lk0I6j1Fv84zeOxhgF3nKgmPH2kcD627CO6ktYUvVtuUDi6xaAVMPPhKTmk56WXqPhAZFDhZa41+GwxVedrASG7Wdr0rJc7B2s0Cx2Hgv2tbdTLr5YQQwoZMEQZkLjWA27oNdHBYV+h625o7ZtzmxJCFK0HbB3FiPbtpukx0IYGdiBCNkkpW6PuLsnNJvdd4O9PyiJwqeHkbpq09MGU0nA3xOBRHi4Q4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4323.namprd12.prod.outlook.com (2603:10b6:a03:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Sun, 15 Jun
 2025 13:32:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8835.027; Sun, 15 Jun 2025
 13:32:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Jun 2025 22:31:59 +0900
Message-Id: <DAN57NVEBNIF.270U4DKHZC13P@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Mark Brown" <broonie@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
In-Reply-To: <20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com>
X-ClientProxiedBy: TYCPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:405:1::27) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4323:EE_
X-MS-Office365-Filtering-Correlation-Id: 13dfbb76-b3bf-4d7d-df9e-08ddac110316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGM4YW9NWUxMdjVMTnNTbUJ0dll0ZExtYlRkbk9OZmJBYStXTWZqc09HQzNm?=
 =?utf-8?B?TXg0emlqc3VRUFZpS1FwTjBDcFdUclZVNm1ONVRtZFZMcHVlSENHWHhLU2o0?=
 =?utf-8?B?MFBxWCttUzJoNUxxOGFlTVQ0aGc2VnNPVG1BblJDaU5xdU8wOVpkbnYxblhF?=
 =?utf-8?B?UFRMY1gwWWpKR0ZnSWUzaXlzaGlTeEczTGRJenBsVEVvU3pTbkZTVkJpOUxu?=
 =?utf-8?B?WmljWER6ZkU0R0pwVElodzVvN0VVbm9ZWFVXYUdjZzVxd2tEeDhCeTQ0WTht?=
 =?utf-8?B?Yzd4MG9wSUxITEZQRHpVTyt6ZmFSUVNTOUpuellzWkdlcmkydWJTMGhxMk1k?=
 =?utf-8?B?VWNBdlRMK3R2ZmVXNTlnb0dYQ0pPNjYvS1dTbituWG5mL0RyRkRTUEoyNEtB?=
 =?utf-8?B?dmcySjZ4UUsvRE13TklGM1JhTHNPc0VrQTZXY3F1Nk1DMFowdkEzb3FLQmpu?=
 =?utf-8?B?dmtxRUI4TmN3eVNWR3V4cDNmK0FMY0VvUDVLLzN2MytkOG9tN3h6dHg1YmRs?=
 =?utf-8?B?ZkNwTVpsTGRKS1ZXd3V2QWErNkJ4U1BVSytkY2U2S2VPcndPSnFxSzVLOE5R?=
 =?utf-8?B?b3o1aGV2L3VMNWNiRjNMREpjNm5iY3dqNEtONlFCd1UyYmM0OHhyWnJsS2ZZ?=
 =?utf-8?B?Z0RER2s1ZDhGYUtISkNwRk5uZjROVk5xR25TZUpDMWx2SkxYUVB2QWRFUTdw?=
 =?utf-8?B?aGxhS2RHcjZMbjVJQXNxZGxtaTVKcmtUM3NqUExXQmRydlkxcEhjNjAyWC95?=
 =?utf-8?B?UHY5dHByVjFnNFFBeSsxTlVVOXJHcFU2Y2tTUFY1NWMwZCtncloyREtpd2wz?=
 =?utf-8?B?OEhVS2dxbHYyMzNIM0VCRTg1c3orb1FQZHFDWGduSUVmUWNLeXJLWndLNmdW?=
 =?utf-8?B?YWVxajBsM1FNVG45UGFsSEc5U2l0Myt2dWI1Q0U1UzZic0RCb2piRTFhTTdl?=
 =?utf-8?B?QlV4K2ZpMGJCdFp5SW5tOGVxazJpeHM0TzR3cm1Oc0Iwb05HNVpsM1grck43?=
 =?utf-8?B?TkYzc1ROWnV1S2V0UnkxRlZYd3FzMTFxZ2pPV2JzZzJ0T2dlMEt6T2VoR09u?=
 =?utf-8?B?MEJ0NnBkRFVSQVNrQmlSc01SSlBLclBTR005Ynl1TjVabnpIV3lxZEdPZGRu?=
 =?utf-8?B?amZFK0dUTVZCVERUeXdrMHNMamZleEphSjA2eVdnWFRldzUwaXh1QTdYVmhM?=
 =?utf-8?B?SDVDWHBWMjVteldVQ1BGV01mU0VtK3JuRzh5NjZvTTRTblpoeW1selRJMDh2?=
 =?utf-8?B?NU44WTZxaFQwdU1GVEI5TnBOTEtML0NjbFVGUVlySTVBT0ZaQmNVZmd1RE8v?=
 =?utf-8?B?Z2FJOHVSN2lIK3drRnBHTzFDSlRkdWVNeUk2RGozNElKRGJ1T1FYNlcxVlNr?=
 =?utf-8?B?WjJJSjIvd2x2ZmdkU0xNcjZsQzlQYS9GYWpGWVpRd3FNYllPbDJMSWtORHEw?=
 =?utf-8?B?dFpTTzc5TDQ4VnpLdWorV3RYWHY0YzUwUFU2ckNyd29yY0l4WmJmV3pYZ0ph?=
 =?utf-8?B?bmpqM3F4bHJRZlNuQWszTm1BYnFaR3NWUFhUM1JySE5IWFErWFlFeWlFSm42?=
 =?utf-8?B?aGNIYXg1ZkdOb3dqVStQWjBCeHNPUlBjSDRBNENZK0JXcmpjQTFSbm9oK3E2?=
 =?utf-8?B?UTh2RFdzWEgrN01iaHc3NnFqSlZMV1ZSblAyS0ZmeXMzdGNZeitLUmhLUVZ0?=
 =?utf-8?B?eDJPV1E3aEdvY1VlY1VTMTJodzJLMmdaUlNGQWtxSVo0QWJLalN5MjgvempI?=
 =?utf-8?B?RG9kVXZGNlNKSmFzWWRNZlZ6WGlhT3RrNDFZTUdOSFI2L1psRDd0TG9yRUg2?=
 =?utf-8?B?TjlVT2VLaDdLZVdpYjNTSHVRaEdHKzVaZFdVdXRKWWhwbW9jUmJyeWRKTDZI?=
 =?utf-8?B?bEd3TXBSanlRbVplZCsvbXVCdDk2VWpvZVFrakdXRzJzSUtwRHNSMXNqcUMr?=
 =?utf-8?B?N2dGSFE4WGsyMmp2aEI4U1B6ZXA5WFNFR3Z0TXowS1p1ZkFZRzhldkZBenR0?=
 =?utf-8?B?cG9PYzhFQUtBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QTVYQ0JmNENuR3hPdU9VUFJ3RDIxUHJnV0NXUStjaWE1MTRKblBUd0RyN0Ft?=
 =?utf-8?B?S2xlWVg1UStNQjUrSjQ1Yjl0YXdpOFJiaE5wNTdNdDlacTlBVEUzeWhRUklF?=
 =?utf-8?B?eURyd1Nud2o3dW93QXlYQTNzRVVIa09teXJXbU1yY0JwR0xXUGJ1OFpwODBN?=
 =?utf-8?B?YitkUWlEREJGd2RDdU0wam5mZXJpL0RnOFhrZ2pBbitxa3p6Z1NhMUIvVkhr?=
 =?utf-8?B?U0JVTGFqenU5eEoxM1U3NGlhN0FkaGxwbG54L1h2Z29kRFk1VFFKa0hxV2lj?=
 =?utf-8?B?UWV0NWc0Uk84QngzZ3owUGt2OUozZWtBcUtJTmFvcm5FNVd6TndQWld3SG13?=
 =?utf-8?B?c213WTkxdktDTUpmYzRrS2pRazZBa0FEVm1wV05Va09rZnBtT28va09wNDAv?=
 =?utf-8?B?OUhvWTUzR3FyQnVrekcweVZNMFRsL3NJZ2pOT1gxMG1PMHhKalpNTmdJZzB1?=
 =?utf-8?B?Z082bUQvSWVERjZiY2RKVmIrTkRJTStZMFV3RTNBT3UwOFhzNmgwcGMwVVh4?=
 =?utf-8?B?d1pyc3BQVFJZMVRVQzA0aWRreWQwMmcrMkZIdFlaUEZtbnhubzhOdzRxbSsr?=
 =?utf-8?B?YUhZbERGZEU3T0FJcnUweUZYWlVPM1huNUlqU0ZkcFZYQWFyV2QrV0NPL1dP?=
 =?utf-8?B?Ly9mVWlzZDBOcE0xbWZtODJibVkvRmNaWFFrV0xEUm5maGxQTUVYU1g4STJu?=
 =?utf-8?B?VURjaU1PQUJiU2VLMXpOUm5aTlNDL2pOSVkvSHJSRVFqNVQ4dkN6UEZoTXVi?=
 =?utf-8?B?MVN4NnFEc2N4cHlhdlNtZ0hiZ0VFOTNLNndlWTRlNnFwazdaeE1EdTVUS0Jk?=
 =?utf-8?B?SytxTTZ6MmkrWkloRDlLTExuaFJwNEE2RVF5bVJsRFA1dk1jWDNucitNcTVo?=
 =?utf-8?B?M1hPU2RMVUlNWGVLQVdhNGVGR2k0YTkxSytTWWM0M2t1ditRT1pJRTlMNi84?=
 =?utf-8?B?SzdqRVNYNzdwQWkyTmdmVWgraWxxQ1ZZSzdiLzVIVVZTWmN4WEJhUnU0eEFG?=
 =?utf-8?B?d3lzUUJYb1ByTWVjQThNV2p4aG15Vy9mZHFYWUpkK3FTc1F2RStpSDZDQWMv?=
 =?utf-8?B?QzVvUC9mWXVOaEhOd0RnOWsyaGhQYXR0Uk9vc2hUQXZhN0pwbzZ0ZVY3VGxF?=
 =?utf-8?B?V3NDT0hRY0NtZ0g5eDNsR2taajB4MS9Tc0RjK1JvRHJhc2k4Q2dwbzNzK0hn?=
 =?utf-8?B?Mis0dldjMlE2N29rdVpxZXRaRmNQNkU4R0VDVWc4MmhLUHJvaFQvaEZHOVJz?=
 =?utf-8?B?VXNLTnlSYlcwcFdCRWVsMGlRblVNZFNNOVZrNHZiZ2RlL2NXM3lBZncxNkdX?=
 =?utf-8?B?S2RKTk43S3prRkxwU21OVlNETy9JalJNb2dJMjl4Zkd2eFVLYlNmYWgyU2Rv?=
 =?utf-8?B?ZWZVV2k0M2VhM2c1TGgrOHVzSHZFZm02Y1o1Y1hEa2V4R2htRHh1OUpaQ25Y?=
 =?utf-8?B?ZVJMTFAwQlBWQnUxb2NxTG02NjduYjJJVTBWYnk2R3RNQ2pWMEVkREJpR1Na?=
 =?utf-8?B?cThsUEV6K2JGZHl5a0lTNFYrNCtIRUtwVGUvQXYvS21jM3lFRSsrR1YvbTBO?=
 =?utf-8?B?MTNabllPUjZtTVR1OVJWaW1GdS9QMXVINm91cGRTY0FKZExmY2pVV09BWno2?=
 =?utf-8?B?blNjTHpYNEFiM2IwZThITlpJSDlVRVkzUTh0ODRyVEpvSG5ZdnBwWlQ4bnIz?=
 =?utf-8?B?YnFtMmgva0dncW4rTE9wdVgxWktacnEzNFdWNU9UbnJUWmdRR0FtZDRxS3R2?=
 =?utf-8?B?SDh4N08yUzFaNkNleUh2ZUs5MHV3ZENRcHNJNTRxSlVHYnpwaWRTMGVBRkhN?=
 =?utf-8?B?RDRBdHdYYWxJZEY0NUZuU3JjZktCWlpLbEduLzlJdTJZbzNhTHRIS0JGOFg0?=
 =?utf-8?B?SkdrUmN2VERhMituZ2lYQmw4cm0vOG0rbVJFOSs5ZmJXcW1kREgwSWl0RklJ?=
 =?utf-8?B?d0Zud2d6L09BejRxT0IzU040cGJBYVlRSm5hTy9iYXZFbzFmTFZTQ1lKanpD?=
 =?utf-8?B?QVlCRmNQT0R5bE5jNkxFeVNhN0xHUFlSOEZHMjBOQktpR05FQStKTjdEcEFY?=
 =?utf-8?B?cUIxK1VKb21pc3dhZzBqd0luWm51UTlza2lXN2FQN0ZtZnVMbUZtM0VaWHhU?=
 =?utf-8?B?VnZUcmNnSEZTZWw0WEo2S1JndDJPRmRWdURZdndtalp5MkJobExjSGx4ekJ3?=
 =?utf-8?Q?S9aPDl7JMq4ySLO3Dcy9ZD4QM274ALZJqkLFiDjB7twq?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dfbb76-b3bf-4d7d-df9e-08ddac110316
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2025 13:32:02.4886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w33b7DC92rkiciCEkD+ShH7x1cVOgP6XGdh7zTzgBZXv6D4p59BU/nXgcJ8D8wVrovjWAW7fpuyDyFnoXKy+DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4323

Hi Daniel,

To no surprise, I like this iteration. :) A few comments below after a
first pass.

On Tue Jun 10, 2025 at 12:32 AM JST, Daniel Almeida wrote:
> Add a bare minimum regulator abstraction to be used by Rust drivers.
> This abstraction adds a small subset of the regulator API, which is
> thought to be sufficient for the drivers we have now.
>
> Regulators provide the power needed by many hardware blocks and thus are
> likely to be needed by a lot of drivers.
>
> It was tested on rk3588, where it was used to power up the "mali"
> regulator in order to power up the GPU.
>
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
> Changes in v4:
> - Rewrote the abstraction to use typestates as per the suggestions by
>   Benno and Alex.
> - Introduced the `Dynamic` state.
> - Added more examples.
> - Fixed some broken docs.
> - Link to v3: https://lore.kernel.org/r/20250513-topics-tyr-regulator-v3-=
1-4cc2704dfec6@collabora.com
>
> Changes in v3:
> - Rebased on rust-next
> - Added examples to showcase the API
> - Fixed some rendering issues in the docs
> - Exposed {get|set}_voltage for both Regulator and EnabledRegulator
> - Derived Clone, Copy, PartialEq and Eq for Microvolt
> - Link to v2: https://lore.kernel.org/r/20250326-topics-tyr-regulator-v2-=
1-c0ea6a861be6@collabora.com
>
> Resend v2:
>   - cc Regulator maintainers
> Changes from v1:
>   - Rebased on rust-next
>   - Split the design into two types as suggested by Alice Ryhl.
>   - Modify the docs to highlight how users can use kernel::types::Either
>     or an enum to enable and disable the regulator at runtime.
>   - Link to v1: https://lore.kernel.org/rust-for-linux/20250219162517.278=
362-1-daniel.almeida@collabora.com/
> ---
>  rust/bindings/bindings_helper.h |   1 +
>  rust/kernel/lib.rs              |   2 +
>  rust/kernel/regulator.rs        | 385 ++++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 388 insertions(+)
>
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_hel=
per.h
> index ab37e1d35c70d52e69b754bf855bc19911d156d8..e14cce03338ef5f6a09a23fd4=
1ca47b8c913fa65 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -31,6 +31,7 @@
>  #include <linux/poll.h>
>  #include <linux/property.h>
>  #include <linux/refcount.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/sched.h>
>  #include <linux/security.h>
>  #include <linux/slab.h>
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 28007be98fbad0e875d7e5345e164e2af2c5da32..c8fd7e4e036e9e5b6958acf0d=
cfa952b916a3d48 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -86,6 +86,8 @@
>  pub mod prelude;
>  pub mod print;
>  pub mod rbtree;
> +#[cfg(CONFIG_REGULATOR)]
> +pub mod regulator;
>  pub mod revocable;
>  pub mod security;
>  pub mod seq_file;
> diff --git a/rust/kernel/regulator.rs b/rust/kernel/regulator.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..338fc653c32b49e630ecb6a32=
0ac26aea973cd64
> --- /dev/null
> +++ b/rust/kernel/regulator.rs
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Regulator abstractions, providing a standard kernel interface to con=
trol
> +//! voltage and current regulators.
> +//!
> +//! The intention is to allow systems to dynamically control regulator p=
ower
> +//! output in order to save power and prolong battery life. This applies=
 to both
> +//! voltage regulators (where voltage output is controllable) and curren=
t sinks
> +//! (where current limit is controllable).
> +//!
> +//! C header: [`include/linux/regulator/consumer.h`](srctree/include/lin=
ux/regulator/consumer.h)
> +//!
> +//! Regulators are modeled in Rust with a collection of states. Each sta=
te may
> +//! enforce a given invariant, and they may convert between each other w=
here applicable.
> +//!
> +//! See [`Voltage and current regulator API`]("https://docs.kernel.org/d=
river-api/regulator.html")
> +//! for more information.
> +
> +use crate::{
> +    bindings,
> +    device::Device,
> +    error::{from_err_ptr, to_result, Result},
> +    prelude::*,
> +};
> +
> +use core::{marker::PhantomData, ptr::NonNull};
> +
> +mod private {
> +    pub trait Sealed {}
> +
> +    impl Sealed for super::Enabled {}
> +    impl Sealed for super::Disabled {}
> +    impl Sealed for super::Dynamic {}
> +}
> +
> +/// A trait representing the different states a [`Regulator`] can be in.
> +pub trait RegulatorState: private::Sealed {}
> +
> +/// A state where the [`Regulator`] is known to be enabled.
> +pub struct Enabled;
> +
> +/// A state where this [`Regulator`] handle has not specifically asked f=
or the
> +/// underlying regulator to be enabled. This means that this reference d=
oes not
> +/// own an `enable` reference count, but the regulator may still be on.
> +pub struct Disabled;
> +
> +/// A state that models the C API. The [`Regulator`] can be either enabl=
ed or
> +/// disabled, and the user is in control of the reference count. This is=
 also
> +/// the default state.
> +///
> +/// Use [`Regulator::is_enabled`] to check the regulator's current state=
.
> +pub struct Dynamic;
> +
> +impl RegulatorState for Enabled {}
> +impl RegulatorState for Disabled {}
> +impl RegulatorState for Dynamic {}
> +
> +/// A trait that abstracts the conversion of a [`Regulator`] to an enabl=
ed state.
> +pub trait TryIntoEnabled: RegulatorState {}
> +impl TryIntoEnabled for Disabled {}

Since `TryIntoEnabled` is only implemented for `Disabled`, it doesn't
look like we need a trait to factorize code. Why not just implement
`try_into_enabled` directly in the `Disabled` state?

> +
> +/// A trait that abstracts the conversion of a [`Regulator`] to a disabl=
ed state.
> +pub trait TryIntoDisabled: RegulatorState {}
> +impl TryIntoDisabled for Enabled {}

Same remark.

> +
> +/// A trait that abstracts the ability to check if a [`Regulator`] is en=
abled.
> +pub trait IsEnabled: RegulatorState {}
> +impl IsEnabled for Disabled {}
> +impl IsEnabled for Dynamic {}
> +
> +/// An error that can occur when trying to convert a [`Regulator`] betwe=
en states.
> +pub struct Error<State: RegulatorState + 'static> {
> +    /// The error that occurred.
> +    pub error: kernel::error::Error,
> +    /// The regulator that caused the error, so that the operation may b=
e retried.
> +    pub regulator: Regulator<State>,
> +}
> +
> +/// A `struct regulator` abstraction.
> +///
> +/// # Examples
> +///
> +/// Enabling a regulator:
> +///
> +/// This example uses [`Regulator<Enabled>`], which is suitable for driv=
ers that
> +/// enable a regulator at probe time and leave them on until the device =
is
> +/// removed or otherwise shutdown.
> +///
> +/// These users can store [`Regulator<Enabled>`] directly in their drive=
r's
> +/// private data struct.
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, Disabled, Enabled};
> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Res=
ult {
> +///    // Obtain a reference to a (fictitious) regulator.
> +///    let regulator: Regulator<Disabled> =3D Regulator::<Disabled>::get=
(dev, c_str!("vcc"))?;
> +///
> +///    // The voltage can be set before enabling the regulator if needed=
, e.g.:
> +///    regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///    // The same applies for `get_voltage()`, i.e.:
> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///    // Enables the regulator, consuming the previous value.
> +///    //
> +///    // From now on, the regulator is known to be enabled because of t=
he type
> +///    // `Enabled`.
> +///    //
> +///    // If this operation fails, the `Error` will contain the regulato=
r
> +///    // reference, so that the operation may be retried.
> +///    let regulator: Regulator<Enabled> =3D regulator.try_into_enabled(=
).map_err(|error| error.error)?;
> +///
> +///    // The voltage can also be set after enabling the regulator, e.g.=
:
> +///    regulator.set_voltage(min_uv, max_uv)?;
> +///
> +///    // The same applies for `get_voltage()`, i.e.:
> +///    let voltage: Microvolt =3D regulator.get_voltage()?;
> +///
> +///    // Dropping an enabled regulator will disable it. The refcount wi=
ll be
> +///    // decremented.
> +///    drop(regulator);
> +///    // ...
> +///    # Ok::<(), Error>(())
> +/// }
> +///```
> +///
> +/// A more concise shortcut is available for enabling a regulator. This =
is
> +/// equivalent to `regulator_get_enable()`:
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Microvolt, Regulator, Enabled};
> +/// fn enable(dev: &Device, min_uv: Microvolt, max_uv: Microvolt) -> Res=
ult {
> +///    // Obtain a reference to a (fictitious) regulator and enable it.
> +///    let regulator: Regulator<Enabled> =3D Regulator::<Enabled>::get(d=
ev, c_str!("vcc"))?;
> +///
> +///    // Dropping an enabled regulator will disable it. The refcount wi=
ll be
> +///    // decremented.
> +///    drop(regulator);
> +///    // ...
> +///    # Ok::<(), Error>(())
> +/// }
> +/// ```
> +///
> +/// Disabling a regulator:
> +///
> +///```
> +/// # use kernel::prelude::*;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Regulator, Enabled, Disabled};
> +/// fn disable(dev: &Device, regulator: Regulator<Enabled>) -> Result {
> +///    // We can also disable an enabled regulator without reliquinshing=
 our
> +///    // refcount:
> +///    //
> +///    // If this operation fails, the `Error` will contain the regulato=
r
> +///    // reference, so that the operation may be retried.
> +///    let regulator: Regulator<Disabled> =3D regulator.try_into_disable=
d().map_err(|error| error.error)?;
> +///
> +///    // The refcount will be decremented when `regulator` is dropped.
> +///    drop(regulator);
> +///    // ...
> +///    # Ok::<(), Error>(())
> +/// }
> +/// ```
> +///
> +///
> +/// Using `Regulator<Dynamic>`:
> +///
> +/// This example mimics the behavior of the C API, where the user is in
> +/// control of the enabled reference count. This is useful for drivers t=
hat
> +/// might call enable and disable to manage the `enable` reference count=
 at
> +/// runtime, perhaps as a result of `open()` and `close()` calls or what=
ever
> +/// other driver-specific or subsystem-specific hooks.
> +///
> +/// ```
> +/// # use kernel::prelude::*;
> +/// # use kernel::c_str;
> +/// # use kernel::device::Device;
> +/// # use kernel::regulator::{Regulator, Dynamic};
> +///
> +/// struct PrivateData {
> +///     regulator: Regulator<Dynamic>,
> +/// }
> +///
> +/// // A fictictious probe function that obtains a regulator and sets it=
 up.
> +/// fn probe(dev: &Device, data: &mut PrivateData) -> Result<PrivateData=
> {
> +///    // Obtain a reference to a (fictitious) regulator.
> +///    let mut regulator =3D Regulator::<Dynamic>::get(dev, c_str!("vcc"=
))?;
> +///    // Enable the regulator. The type is still `Regulator<Dynamic>`.
> +///    regulator.enable()?;
> +///
> +///   Ok(PrivateData {
> +///       regulator,
> +///   })
> +/// }
> +///
> +/// // A fictictious function that indicates that the device is going to=
 be used.
> +/// fn open(dev: &Device, data: &mut PrivateData) -> Result {
> +///     // Increase the `enabled` reference count.
> +///     data.regulator.enable()?;
> +///     Ok(())
> +/// }
> +///
> +/// fn close(dev: &Device, data: &mut PrivateData) -> Result {
> +///    // Decrease the `enabled` reference count.
> +///    data.regulator.disable()?;
> +///     Ok(())
> +/// }
> +///
> +/// fn remove(dev: &Device, data: PrivateData) -> Result {
> +///     // `PrivateData` is dropped here, which will drop the
> +///     // `Regulator<Dynamic>` in turn.
> +///     //
> +///     // The reference that was obtained by `regulator_get()` will be
> +///     // released, but it is up to the user to make sure that the numb=
er of calls
> +///     // to `enable()` and `disabled()` are balanced before this point=
.
> +///     Ok(())
> +/// }
> +///
> +///
> +/// ```
> +/// # Invariants
> +///
> +/// - `inner` is a non-null wrapper over a pointer to a `struct
> +///   regulator` obtained from [`regulator_get()`](https://docs.kernel.o=
rg/driver-api/regulator.html#c.regulator_get).
> +pub struct Regulator<State =3D Dynamic>
> +where
> +    State: RegulatorState + 'static,
> +{
> +    inner: NonNull<bindings::regulator>,
> +    _phantom: PhantomData<State>,
> +}
> +
> +impl<T: RegulatorState + 'static> Regulator<T> {
> +    /// Sets the voltage for the regulator.
> +    ///
> +    /// This can be used to ensure that the device powers up cleanly.
> +    pub fn set_voltage(&self, min_uv: Microvolt, max_uv: Microvolt) -> R=
esult {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        to_result(unsafe {
> +            bindings::regulator_set_voltage(self.inner.as_ptr(), min_uv.=
0, max_uv.0)
> +        })
> +    }
> +
> +    /// Gets the current voltage of the regulator.
> +    pub fn get_voltage(&self) -> Result<Microvolt> {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        let voltage =3D unsafe { bindings::regulator_get_voltage(self.in=
ner.as_ptr()) };
> +        if voltage < 0 {
> +            Err(kernel::error::Error::from_errno(voltage))
> +        } else {
> +            Ok(Microvolt(voltage))
> +        }
> +    }
> +
> +    fn get_internal(dev: &Device, name: &CStr) -> Result<Regulator<T>> {
> +        // SAFETY: It is safe to call `regulator_get()`, on a device poi=
nter
> +        // received from the C code.
> +        let inner =3D from_err_ptr(unsafe { bindings::regulator_get(dev.=
as_raw(), name.as_ptr()) })?;
> +
> +        // SAFETY: We can safely trust `inner` to be a pointer to a vali=
d
> +        // regulator if `ERR_PTR` was not returned.
> +        let inner =3D unsafe { NonNull::new_unchecked(inner) };
> +
> +        Ok(Self {
> +            inner,
> +            _phantom: PhantomData,
> +        })
> +    }
> +
> +    fn enable_internal(&mut self) -> Result {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        to_result(unsafe { bindings::regulator_enable(self.inner.as_ptr(=
)) })
> +    }
> +
> +    fn disable_internal(&mut self) -> Result {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        to_result(unsafe { bindings::regulator_disable(self.inner.as_ptr=
()) })
> +    }
> +}
> +
> +impl Regulator<Disabled> {
> +    /// Obtains a [`Regulator`] instance from the system.
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        Regulator::get_internal(dev, name)
> +    }
> +}
> +
> +impl Regulator<Enabled> {
> +    /// Obtains a [`Regulator`] instance from the system and enables it.
> +    ///
> +    /// This is equivalent to calling `regulator_get_enable()` in the C =
API.
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        Regulator::<Disabled>::get_internal(dev, name)?
> +            .try_into_enabled()
> +            .map_err(|error| error.error)
> +    }
> +}
> +
> +impl Regulator<Dynamic> {
> +    /// Obtains a [`Regulator`] instance from the system. The current st=
ate of
> +    /// the regulator is unknown and it is up to the user to manage the =
enabled
> +    /// reference count.
> +    ///
> +    /// This closely mimics the behavior of the C API and can be used to
> +    /// dynamically manage the enabled reference count at runtime.
> +    pub fn get(dev: &Device, name: &CStr) -> Result<Self> {
> +        Regulator::get_internal(dev, name)
> +    }
> +
> +    /// Increases the `enabled` reference count.
> +    pub fn enable(&mut self) -> Result {
> +        self.enable_internal()
> +    }
> +
> +    /// Decreases the `enabled` reference count.
> +    pub fn disable(&mut self) -> Result {
> +        self.disable_internal()
> +    }
> +}
> +
> +impl<T: TryIntoEnabled> Regulator<T> {
> +    /// Attempts to convert the regulator to an enabled state.
> +    pub fn try_into_enabled(mut self) -> Result<Regulator<Enabled>, Erro=
r<T>> {
> +        self.enable_internal()
> +            .map(|()| Regulator {
> +                inner: self.inner,
> +                _phantom: PhantomData,
> +            })
> +            .map_err(|error| Error {
> +                error,
> +                regulator: self,
> +            })
> +    }
> +}
> +
> +impl<T: TryIntoDisabled> Regulator<T> {
> +    /// Attempts to convert the regulator to a disabled state.
> +    pub fn try_into_disabled(mut self) -> Result<Regulator<Disabled>, Er=
ror<T>> {
> +        self.disable_internal()
> +            .map(|()| Regulator {
> +                inner: self.inner,
> +                _phantom: PhantomData,
> +            })
> +            .map_err(|error| Error {
> +                error,
> +                regulator: self,
> +            })
> +    }
> +}
> +
> +impl<T: IsEnabled> Regulator<T> {
> +    /// Checks if the regulator is enabled.
> +    pub fn is_enabled(&self) -> bool {
> +        // SAFETY: Safe as per the type invariants of `Regulator`.
> +        unsafe { bindings::regulator_is_enabled(self.inner.as_ptr()) !=
=3D 0 }
> +    }
> +}
> +
> +impl<T: RegulatorState + 'static> Drop for Regulator<T> {
> +    fn drop(&mut self) {
> +        if core::any::TypeId::of::<T>() =3D=3D core::any::TypeId::of::<E=
nabled>() {
> +            // SAFETY: By the type invariants, we know that `self` owns =
a
> +            // reference on the enabled refcount, so it is safe to relin=
quish it
> +            // now.
> +            unsafe { bindings::regulator_disable(self.inner.as_ptr()) };
> +        }

Do we want to keep enabled dynamic regulators enabled? IIUC that's what
the C API does, so doing the same is ok, but let's at least mention that
fact in the documentation.

> +        // SAFETY: By the type invariants, we know that `self` owns a re=
ference,
> +        // so it is safe to relinquish it now.
> +        unsafe { bindings::regulator_put(self.inner.as_ptr()) };
> +    }
> +}
> +
> +/// A voltage in microvolts.
> +///
> +/// The explicit type is used to avoid confusion with other multiples of=
 the
> +/// volt, which can be desastrous.
> +#[repr(transparent)]
> +#[derive(Copy, Clone, PartialEq, Eq)]
> +pub struct Microvolt(pub i32);

This type actually contains a voltage, but is named after the unit it
stores. A bit like if `Duration` was named `Nanoseconds`. How about just
naming it `Voltage` and give it `from_microvolts` and `as_microvolts`
methods? We might not need to use other units, but at least it doesn't
close that option.
