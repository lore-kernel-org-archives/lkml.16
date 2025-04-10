Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012015.outbound.protection.outlook.com [52.101.66.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 366CA78F4E;
	Thu, 10 Apr 2025 13:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744291837; cv=fail; b=ZsCdhRMGTnMp7la66qMzitdoS2N0YuK0s1BU58+kaYARDA/2W3Ubh6uJIOY9EuCi/ep7h4sBkdcr+ReiswY5mbfP2FpQf+54pBeddoUMQLPlelsLnNEvKzrRFXJvvZaEAAaEB8XYaNQo9zkal8SW7Y+OM2ZADj5/7merO0HN2Xg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744291837; c=relaxed/simple;
	bh=kNFrlvuWokrLxVTyyDqfMiooIQGZ4Eg7sQtPeO1zeq0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VL7s7bEcGKhZm+crL+9bFkXh0cuYd43kIkot5XuPICLQ8FOjYPCiaJbwKPmOCu0Gv/pXVtRDDpI2Cd9clZKlJf7Y1Nmh8VOMSUyPgIq0Thkk7hCqAQxbFYHqM0NQhN4Zdbs9JT87ktW8zofRTrh3/NUDxDxt8zYhwZ2weYXI6Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uIawje35; arc=fail smtp.client-ip=52.101.66.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uIawje35"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TL2RyJ+zBoXuWlL17UnDMgkn5cPMCT1kDQ+Zl2BECx5VdqcZL6Lab0ZWEXlQKkPVD93nQvzqsLy9Nu5Tpvs9WQ9ZS4z5Ll5Rzg2Wvo1WKxmHWDfjevQO8LaIGuB0/vdsNJCxLzm3g9bt0E2ZkKuPUiwS8i9VhZUzE4e2PaZ2hh0T9F+cYD9tTLPS/31h/s9fxCKr4zKIIvnxUIfptFARc7GqkjrJdhwZW8BwV8iNgYXO3D8PFj9Hu4qYElmwMz3d37FrKuaKVEJkcYpsmoZwDDOas4ywBb6mgjVfCSwjPXVuaam3XVPvlx9VHTf7ZcybU/x/uKENnMvT9V3181QHrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBtfMvI5EjQ+mEoX+o97JhXXXpMzme6J3M6iCWCTuqE=;
 b=MHd44UevA4VzyQJBdDhiFgHiQE2cBBsbW+/1ckZgS7lYtskZLVZHDKBXqFYwC1oP7sUdedBTexNQHnkGc3Vex9pOgnZF7Aek9+yMi1+pQ3g9JOA19bVOPVaz8+/jgW94LhKBD3QjmKsvrlsD0LW913XNVfJCEWOruFhesPXWfP2Vpxama3ttKggGAQNeJPljgiB7us9qS/N80PdHWQZb7SZZtXJfHCES3yZlBpefExkjYgYKyyFXiODEVceJaB7f9AoR1fpFwwfRjwb5bYC5uWC1ZZ9iE8cMo1U+yJgCrnuaqvOLtV2nVYP0f4devZOpPZgcDU4+pbLf8bHfQOx2Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBtfMvI5EjQ+mEoX+o97JhXXXpMzme6J3M6iCWCTuqE=;
 b=uIawje35scdpkH+2+/PdNxV0epajcgfu9dKf8urBbW3nEXC2Qz7DgtBHbMOIqbN8uwrb2qFGDa8Nrwi/3HDPmjDvV/A68WH3DMOhoS/GC6y2mk661Ks+iCw++bxvCP1UU7DgQIzcYkvOixCsGmXSHnPpl48B5950TP1arj4mTm5ZtTy3ujKBPN/PxLZh3rbAKr2ez3JNq6CqgsjQ/6budk9vJPWRcHkW+NIa5CbMaU6b40ajOgxg1cSUXU8gUxR1n6INhhdnvntXpTdfYJ6R3ONESFW/u0MuAU7vrI5YGdN+piwKBb0EH37BE4v6SkuurLjc8glE8AfBMmDxvFPYRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS1PR04MB9630.eurprd04.prod.outlook.com (2603:10a6:20b:475::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Thu, 10 Apr
 2025 13:30:31 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 13:30:31 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH] arm64: dts: s32gxxxa-rdb: add RTC module over I2C0
Date: Thu, 10 Apr 2025 16:30:28 +0300
Message-ID: <20250410133028.5871-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0157.eurprd02.prod.outlook.com
 (2603:10a6:20b:28d::24) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS1PR04MB9630:EE_
X-MS-Office365-Filtering-Correlation-Id: c31a53a9-5bbb-4235-8d37-08dd7833dda7
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1daSVpxZlA3dDN1WTJBQ2xKeVNIaWZrcHo5TVMwQnVGR2VPYWY0Sk1WQWwv?=
 =?utf-8?B?SzhjS1IxenJkMWh4OWJiTmpCVFpQRG9IVUpHVGpQRklIR08rNDZIM0ttV3dW?=
 =?utf-8?B?QkxyOGVUamZ5ZmptaE9ubzliam43UldUWThHdWZHa045QjZLK3krV0VVRHN0?=
 =?utf-8?B?RVVRZ040N3ByVS9sUHNoaWdTQmxYbnlSSExaK1VKSVZjMkVxdGVJak9RZTlr?=
 =?utf-8?B?N1NCVkV6Wm85WDRMYTRORVdYN3FnNVQ2N2p1THZLN1pidEw0OGFiLzdGODJK?=
 =?utf-8?B?cDhyTFVHMlVUMEJ4NmE4alJWSEJ5aCtiREozWndYTkVCdndGODEzTVVOSkFn?=
 =?utf-8?B?Q1V6bVlQN2ZJVWpJc21XaGVxUk9NMUM3K1lmSSszNHI0Tm5sZEc0Vys1Mmxh?=
 =?utf-8?B?MUY0T3p1bXE5L2VQN1dBREU1NjY1R0Jha0RGZUdSMkdXVnlVeUZJakFZd3JU?=
 =?utf-8?B?enlYS0FoUmlpRnljMEdmaXZzczQyWHB1TFBYY2hPT0tlSEh4QWVlMnBKcDhR?=
 =?utf-8?B?Nm9pYWhoNmUxVzNHcjU0YVRXbXA3aDNnSXhUWG55aGU0Yk5FZTRzaThOV3dM?=
 =?utf-8?B?NjFudW5qUU5TYVgwT2FLWE9udkpQNzgrTHl3L0Zhc3h0aFpVU3o1WFZHckVo?=
 =?utf-8?B?Qjh1VXJzZE94dFlHaEowMS93bjE5ZmIyTi9VR09VYnFBN3N5ZHRleTBKcnVE?=
 =?utf-8?B?NStuVGpNUFpLQTNXZXpnRXZpMDZuVFE5OGdkbFZXYVJ5aFRNNnk2QmFaa2gw?=
 =?utf-8?B?R1hmN2t6Y3JURVFTZTkzRHN2R3hJNTNSUjNnM2hPOU03Mm54UVRYYWhoRVhk?=
 =?utf-8?B?ZDJyaStxbllab0hiR29TZ2hNMkpBQ2FOdEd2UStCSzRYVzJ2QnNxWG54N2RB?=
 =?utf-8?B?WXN6eDlBeXVpYmZVdmNRNDQ5U0xUZEJZWHhyeE1jNXptWEExMkc3Y2N6M3Bh?=
 =?utf-8?B?bk9nWlZLanF4RHVVVkxRU3BqVmR3dGF5ajJKMTBROGpZMGZuSDc3bXdnV1pq?=
 =?utf-8?B?djBBZVBOTjM2NFREa0FlYWdWb0FqamhZdnJUNUZyT0JvbDN0VzhvWXp5bGRJ?=
 =?utf-8?B?U0RvUDFIT014VlFBeDd3bmQ4ZmM4Z3pCeXlNRDA5YnlEdndDUXpWQTQ5U21Z?=
 =?utf-8?B?OUthbEszSlJLWmE4bGxJMjNNNDcwZW5IbUJvczNLRHl0OW1jS0lGYkNzMWJL?=
 =?utf-8?B?NldhMTRpUXAyUUNLOXlIbHFRVHpFcDF3WXFRemlzUFVUbTUwMGxsUElPRVYw?=
 =?utf-8?B?ZUVDbWR4bUJweHJYaHhVWWxkQmpLd3BhMVd3bHFML2c5MzBuaDU4alhaS0tS?=
 =?utf-8?B?UkdtaVU4K2ltYnFTbDAxUDRLYkZzMEZuR09oZ2Q5S2RBNk9BYkIvK2IrQWUr?=
 =?utf-8?B?ckl2b1VhSVpTNEdyT1cwU0FlR01pQkdBMjJUSnVjNTV1WjEyTTRaZ0ZpNGFL?=
 =?utf-8?B?akM1aFdEK3NrWkV0MG5MOUM5emh3c0M2TFZKcVE5dDNjWnp5T2RaTitGZ3U5?=
 =?utf-8?B?Y0RvSTBFQ3F0dlNiQisyL2hEQjl0dEpQbXRpK0x5a2YvZlJUNm9PVnliSEZZ?=
 =?utf-8?B?Q3EvMWluYkFZTC9qazhjTUhQd0NtRURtTEoyV3NDM2R3Qk9TbTdjcGo1WXA4?=
 =?utf-8?B?Tjc4RkVoeHFYVnZSeW5CdEJuNi9MYnpQcWp1YnVkakVFWEZhS0lRTG9WeFpR?=
 =?utf-8?B?R093Qk9GVnZ2RUZIODhsYzAxQjZkS2dIdE1UWXRVR0hhTWVoanBweU13M0Zk?=
 =?utf-8?B?UDd3YnJBVFJGUUppZm5UV1lkUnQ1aXhCWW1qQTBxOU5IVWkvR3NrU3FReXJz?=
 =?utf-8?B?cnp0dDVPejJrbzVLbTRGOVZweEdRanF5OXQycmxoZFFtV09jcEFaRGJsd0Yv?=
 =?utf-8?Q?6MV/io2Eh3uXo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXVBVmlaam5NNlhRVStiUzI4Vlh5Y1hTOWk5RWsyc3gyUDNuRXQ0a2tMUC9t?=
 =?utf-8?B?TDF0cG5reTlxVnRoM09iQXBSZ1Y0ekRxaGg0RmE4Z0phb2JZN2xZd05GVnFQ?=
 =?utf-8?B?V1ZFNmlidXpkT0hhY2dCZzZZeWYvZDdVVklLalB5Y1FpYnBZZ2JkK0JBYkIx?=
 =?utf-8?B?bWV3dFZFQVhPcWxNUHdlQUMveXY0OTVSK0N6UHJrZG41R1o5RjN2TXFlYTVq?=
 =?utf-8?B?aS9qMTJLYTFrTmxDYVFnQmI3d0NES3IzeXc1ZkkwN2tIT2NvRkYvRElUa0d3?=
 =?utf-8?B?TW93MjljeUpXM3BqT2xvWm9WY3VLU25nSy9VYUsxVGdROGVOaTJVQ0paY21O?=
 =?utf-8?B?czZ2VjZCNFo2TEdNVHhnK2dhTVNsVWZWdkwyV0o5WDZrcXZVVkNiVEFQT0hG?=
 =?utf-8?B?eC8zdU50Z1pwMmNDMWFBQlNNRTQ3dTJERTZocFFrejFrRjFGRmZJS05vQXZa?=
 =?utf-8?B?eFZsdlY5TzZsYXBKZG9pOVhndjFRMU5kM016cmpROE5JcFd1T2dPN3I2Q3Vx?=
 =?utf-8?B?ZnNqUTRqcFNvYTlNMjVxYzloYk5iL09iZS91TlJibUpNVjJodWErWHdOWkMz?=
 =?utf-8?B?WUxkeG5YajBUaHFBdm1zZCtSVDAvTHZFcVpvVDdTVXRpMFVaUHNZK3lKQ0R6?=
 =?utf-8?B?bmpkWjZOMklnVE9VL0JmbnhQL1JVM1duNXd5SlgzVTIvOUgzZVZWSDRUb3Fp?=
 =?utf-8?B?c29DUm90aHRrN2lvc2xmNFVuQjNKM0VPbTRwTnlaZlRYV3FMOTdMNEtzQU5n?=
 =?utf-8?B?SXRuUU9pcmw3V2Q4Z1U2RHo3cnQ5WmtMY1pGanhTejUrclpWM1RVZHBUbjhO?=
 =?utf-8?B?bDJGRDBtNVlkTElkbnM5L25mQm1GamtMaHV5ckJId3RwVUdCdk5tQ3pxdTRP?=
 =?utf-8?B?eDUwSVQvcHMwMzJ0WXl0Uk92MGhYWEpxbmtWZEpRWitPNk92dkJkZ0k0ZzQ3?=
 =?utf-8?B?V09rWWVJQStDa2F3Qi9ZTUdhd3Q4aHgzYzVzRUlxOWtRNE9BYy9UWFVyajRq?=
 =?utf-8?B?SE43NjV5Tm0vdEJ1bmZTSEZYc0hWUkFHbXdnWTB6aFZvNkg4MmlUSENmM2FX?=
 =?utf-8?B?anVMRCtZdTNEVEF6a3RXL0RpM0hlanBzb2lod2RUS2NMcG1Xck5zSTlGNkVq?=
 =?utf-8?B?c3pLdDJwZmxJdVR0dURuTG1LMmFQSG9EVjVWeHd4QmMwOWpGOGs2WXJ6b0lt?=
 =?utf-8?B?OUFHczQrZ3dqM3U5UHlvakJzYnNkMzBFQm9GUlpJZ2xraTdwOWxoMzZxRjFB?=
 =?utf-8?B?NDZkUXA1bWJNbSszY3VjUXZGOGExMUpBVi9iU1NoV0xjc096UVUrQkdkaFg0?=
 =?utf-8?B?MWlZTUJ5NmxPT1ZkQkpwZXRGUHhQdHlzbUZ0ekxmTXZUODU4bEJjcW84NmVC?=
 =?utf-8?B?ZWhDY1NvcXJ1MFlnNlhPKzh2REJMVlUyRWRrd0wrTmp1U2p1d3diQ2txY3Nv?=
 =?utf-8?B?Ynh4cEE4a0JhaWdHZUQwUWIwSGlKRDVmc1JIVWNQM2JJS3pKYjdDdmEvSGxE?=
 =?utf-8?B?Y2dOc0R4Vks4eTMvMVpXRENuNkw0SmhucDc3YXlRZ0lWQzFJK0NZR0ozczdB?=
 =?utf-8?B?U2EzbWxyYVFCc3ZkQXM2R3ZUbGhlb1QwNkhjeE9WQ2s4YU56dHV2NmhoTmph?=
 =?utf-8?B?SkdJYlE5VWpxb2ppWGJSQVBoNUM4bTZOQkMwT1FoM1ZkNHJGUlNQSE10aFNH?=
 =?utf-8?B?UDJac3pQYm1Vd2kxdyt6TWFmWkdZcG1ac3hhWW1KV1B5SWhXWThSSGgrQ3Nh?=
 =?utf-8?B?M2pZdyt6RUwyQkVFUE1xU2tGb2lXcGowRVVSeklLZmZvd0NLNjlQQStQYm1L?=
 =?utf-8?B?MDBXY0NYWG5VZ1VQWW1nZ2QvTU1RaXdGano0SEFVcXJGa05VWUlZQWh0dHFr?=
 =?utf-8?B?WWsxM2o3S21Fd2RhQWZTc1VtT1pNaSt1b1FobC9zZXkrZy9NSVRiR3JMUHR5?=
 =?utf-8?B?cVlhRDF4ZndWSmJxaStCb1phNitlZVl5b3RxTE1YWlNOVnRKUEhNRUNMOHE0?=
 =?utf-8?B?QWVCbkoreFJDVHF5VkFwSEZwRE1IcGgrMWEvbk5BbVA2Q3J6N21UVDdsRjJQ?=
 =?utf-8?B?L2tqUUFRemVjUXp2WGxVQlR1YXFEOHpaSXhEQmRlcGMvVzF1eFcycGZPNSsv?=
 =?utf-8?B?VE84UEFxOURIQ3hWN2NDQlZYbmZmU0tnQ1dnQmVXR0lhYVRtUWFuY0IySnV5?=
 =?utf-8?B?WXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c31a53a9-5bbb-4235-8d37-08dd7833dda7
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 13:30:31.5899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUPEM76khiaiyX8n1UFOCOvhEMDL5I8+lmCxjvCyI7zd+wLXDbpzL1HUns9iHHdP2k5Ov73E3MSV9tdYXW8AjIVAkERVMBMFCTp/m01qcBo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9630

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

S32G274A-RDB2 and S32G399A-RDB3 boards have a PCA85073A RTC hardware module
available and connected over I2C0. Note that the RTC module is not battery
backed.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
index ba53ec622f0b..4587e1cb8835 100644
--- a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
@@ -153,6 +153,11 @@ pcal6524: gpio-expander@22 {
 		gpio-controller;
 		#gpio-cells = <2>;
 	};
+
+	pca85073a: rtc@51 {
+		compatible = "nxp,pca85073a";
+		reg = <0x51>;
+	};
 };
 
 &i2c2 {
-- 
2.45.2

