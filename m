Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD6C1DB546
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744377360; cv=fail; b=UylwANMCk/6YbMripbNYkUuZuMOVxWz/vw39F5DetuEi3hWfywg/fyi3ib0D5Vc3NvdF5hQ0dbHW6HWYRsJAi1u+0dN5VFL1+OhYU92KaIcnFJ/Xwg5VFT3oWONgl1J1XFamU01r5lyhdFjXU/u3Hu1gwqGeGZR/oZn5fxz3xLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744377360; c=relaxed/simple;
	bh=Bz08zFquicGFTPgoFwsIJ5cJrT3TuvXiW1PgzqKh48c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ROCX6hmuz3jaQFjGNlL4zdkcc0Mf/36wuaEmHQu4cl8b9YfOQDyU1OgvjTBNfmyMyNjb5wjxsnASJ9aEqQjaSAuPOETQhZAUrMCf2hSCKd2KWytBtJLRLdf2/t9DOkCj0UDIVmp85H5Bq/8pnFNTB8jJmvoXi9s11nHNPzdVxdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aPVr3HuH; arc=fail smtp.client-ip=40.107.21.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aPVr3HuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhJiufF7b+SG9aqyRPf2UDzNgRQZUi53gepGMcdiI4ITtEipRpM0CjRRkDe6nN1kcy1ItLISM7aU+MZVoi/R/P6fdzwXCdWfQdPKmUNyZ3vIDa+ApURPG1CsBWNixSZIAJwD+AOpVmDM3i/GyUK1GXHBR07AjZ29MTFpUApkNZEF8ZHbsQTAb1+5A6ymLbj3d4CbXQgQ0VfmQtnENJFH2upsyMYAZHfle6o1Y43cwnBcZl5gdRXjgDe6pShMF3DOB6NCqmRowCJWy5/d7ZoGIMhLzjYSSaR28XDj/0W2SffPg/NeGLzUlcej4MIhhSrWXByLaSMlvzMEgfcHNEZuaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTHV2qgU1prfpwBDa963H3u8WNnRC6Z+uZ/cfEsZAvA=;
 b=KCklGYOND7TIE0WE6myJcb6nsx0PgyJNfRLZNMN6/TvdxWqtDUi5EXi6AUZ3HHohr//1+szTaVamMgwMFWSMOhl/NqwE+MhV3x9/o+eUuTQFVJVLqKd7L/SCZBtQ2Rv/bhunbbeQpEsJndfwKI+Kl0VcHeSzFiKRbZa95W+L/kOvCybOBsTmGy9pvKzcrHeGEdcx2HIXT/972xJBv2zFNPJzcrDyS2eO1pj0L0sFKj6pip6TywurEgnLSJoKymfECMote5Qn3eJo/4IUv+mBGdRpZEYws9sFcsSM8L7J4SX1Wg+57xlD3OZ/UXnu1EDOzCL8RijgFrfFhP2y9jkx7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTHV2qgU1prfpwBDa963H3u8WNnRC6Z+uZ/cfEsZAvA=;
 b=aPVr3HuHx9InmZ34VBNBZJe4skszjli7ZQZU46VYMySqsOV/EftfoLYYXYKrV6b9etf++dVxDkBoBqzA5SciAMuzIWIAw8nvJEJ/YdDCfa4N+9qYTMlBRxRFSgg3gVM/rD3OuYWydDegl1h+OWgll9OB78xZjKUoZuZQFdzMfOd6jQqD0ESyt/j3XXUUvxHc49YBqflnJzTVkfAhAG9t1PL3395gBv/zZEgnf/WON2krr7otZf5rYbUzDsayfQqCQxR7S/KhzWqKwg8AHwnN1riaCsq/B962tETc1L+OH6WPWR+rDRL+61vZoeF4F7QU2lGHU/NcuGG7pf7A0Uo6Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10674.eurprd04.prod.outlook.com (2603:10a6:102:483::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 13:15:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 13:15:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 11 Apr 2025 21:14:12 +0800
Subject: [PATCH 4/6] mailbox: Remove devm_mbox_controller_unregister
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250411-mailbox-cleanup-v1-4-8db541394dc2@nxp.com>
References: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
In-Reply-To: <20250411-mailbox-cleanup-v1-0-8db541394dc2@nxp.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 linux-kernel@vger.kernel.org, mailbox@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744377279; l=2656;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qTUZX6uQuNoQ4SfjQO/8uSs1vqq9cmt7z8wr+U8spb4=;
 b=sg1UOIQUU9oiWSI4OznC8vBAKJhl3GWinLnLDik2qzbP7ctvh4tw9w/+7KV94Bzewt5SCMLLa
 SkdjJ+w9e8GCfN4EJTNhJJXFkdv6sUoMsOsZF1qqdou3lrU5kKZiSvW
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: MAXPR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::22) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA1PR04MB10674:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b5d2892-ed3d-4fe6-d94c-08dd78fafe08
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VWNrSXlOZjZsc2lFUnFjTE5kWFQwSFhKM0IzSThWVmdDRHpsQ1BYbStBZFNM?=
 =?utf-8?B?TzQyVHZEKzFiR3FDQzNPTXNxWk4xc1E3WlJnRlo1MFFlR2x1Z1l0dHpJVk1H?=
 =?utf-8?B?SEVCMmxqWEh6ZklzT2Ewb0tHU0RneTVJSmdWWFlGNkxwNks3TWxBM00wSlFC?=
 =?utf-8?B?a1BVV2RtclM4SDFFdS95L1ZvWE02a1ZSc0ZTMFJ4QkJ5OUZWazBrRkI5eURl?=
 =?utf-8?B?THVwY3Vocit5cGI2bXlxOVdxbXh1d3piNkRoMUREaWtlSkNsV0dWV0hMYldh?=
 =?utf-8?B?bmtPY3Ywb0NYbXFYQ3FYeTNaUzY2QllMd1lIUCtHREpIa0VjL0QySytzNHV3?=
 =?utf-8?B?ZUtNQWxPcGVhM21YNVpPMDVFclZNWC9SOE5DQVk2L3ZrZTFreUZMb240a3U5?=
 =?utf-8?B?N2xuRDJiWmFZc0JwdWFSN1Zwd3NFOGhOMyt4MURCN1Yyb2pMRld3Wi9nbFRw?=
 =?utf-8?B?SzdUcUFyRHJjWlhrWmVoOWdiZmRUK3dodXNTTTdONHRGUEkvamVMZWJNa1FZ?=
 =?utf-8?B?WkRYVXRaOXJWcjRnWGlKTjQrU2xjdHVSSTZLYmsvcnNnb01pMDZ4WW9heXRS?=
 =?utf-8?B?a0w2a3ZMRmdHNVg1VXN6ZTZQZVIxNEZYYjBsSExvWHFBU3NLUXVyNjdNSkQ4?=
 =?utf-8?B?UXpLZEpUT3Z5aXE3L0NIdXVyQ1VyNjdWQWZNWHdYazV5bVJtMWtrTzhXQWlN?=
 =?utf-8?B?TjhjTGFSb1FrZVdZU2xOWDhzM3ZvVzVaalhFZVlNbkxuNWRhVVpRR0haSmVV?=
 =?utf-8?B?b1NNcHFiZDVyb3JBZDMvZFoxeDE4UTg0cEd5MlBwcWUzTjd0eWIzazVQbUF6?=
 =?utf-8?B?cEM1N201VkV4R3F1bXlWMVpmRnNlak1meGdZb0VpWjhXa1dzRG0xRUZyU1Jh?=
 =?utf-8?B?b1Evdy9xQjFSaWRkeURCa2RrQkJzM3ZwVWxyTjhwQiswejVxbC9lai9wVXJw?=
 =?utf-8?B?NVQrRmdSL2RxbnNPeWVrdnZLSHErK1ZNTEJkanFEVFVTcTlnZTN0S0dZZ1JM?=
 =?utf-8?B?V28wUit2WTJ6ZDhvaUNzaklqamFjalhnTWVqNnBBUit6SlpYVWZqaERiQ3ky?=
 =?utf-8?B?MUgySUpLQ2cyakp0L1RQTXljK3pveW5ZclNmRUZrUEY4NWJJSDloSHJJZWlG?=
 =?utf-8?B?NTQ5dURhRkRTZHFYaCtzUTkwRG9xQnNnQWxjeHpTWHhYRmYrQ0oxbVVxdUNI?=
 =?utf-8?B?eGx4Yy8xTG81bXRZSVNDR2JEdkQzY2loSFd2Z2pZckNOaHJxWUhUVUVRalk0?=
 =?utf-8?B?QXVwcG1zTDQ3UEJXUmI4bFFlOU5rNnRLZWg3clFDZnRaOGJTREhCdmJvYzA3?=
 =?utf-8?B?QmpQV2I2YktrNm8wejB5MmEwM1U5UnFkeWdoK1ErdGNJdDBLRW1WNjhrbnlq?=
 =?utf-8?B?aEhrRllJSUpLNFk5cS9VMmlDbVN0dTIydmtrTWlDVzI0b0hMbWJ5TEh0b2Fx?=
 =?utf-8?B?WEtRVEhURzRKRytwK241MmZlV2tVa3gwekxpY2ZPT01OaXlCZWJ5REROamNx?=
 =?utf-8?B?Q3FTTWdLMEhqVHdpbExxaUVkQ00zSWdCVXlaVk1CdGZQKzBidFpETjVDL0RD?=
 =?utf-8?B?Vkc0V1YyeUhWNFcwMStvZVJlQmVoWnZKNU5Za3o1MTh2RTdod0NkOFQ1cTdu?=
 =?utf-8?B?dXAvVVQyQml1dFVqeTZNYXZqQjhmMWpuQ3FxUFpBdlR0UnZsdVVJaG04YlM2?=
 =?utf-8?B?Z3Aya1hhVjJhYitlR3lzMHM1T0FOa1NVY3d2M1ZQVzIzTFIzRU1TZlNpdDBC?=
 =?utf-8?B?aE1GZUU3MTRXcmJKOWdaVDVkeEw4ZHBDWUcxTEpPUnpObUtsTU5jbEdEY2ZL?=
 =?utf-8?B?ajJENUJja1RrTk5SeTRvT0ZpREhLQ3dvWDVKTDMxeFd5UVhIM2U4blJZUFly?=
 =?utf-8?B?QlJTcmpYcllMdmFkc2VsRXJDT21iMTQ3M2xZeEk4TEpyUS9VUUlsRnJxWHZa?=
 =?utf-8?B?N1JDRWlpYzhYNml1bHh2eWlBTDllQzM2UUxobkNoZUZ2bDBIKzdxSEY0eWNR?=
 =?utf-8?B?Y3lCdkRsYVJ3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cWRYd2xsM2NlZ2loVzNDL2g3cFJQZjlxSGtVaDdDMmY3L1hROXAzMEw3MkNE?=
 =?utf-8?B?NXhmU29Mb0lqWG5reThTVnJOSjlIOWxGUkFMajEzMWJIajlZc0ttbjFnZ0o3?=
 =?utf-8?B?UnRYajk2U3VJZGhxT05leXJGZEpuSy9YaUJFNVNVUW1NOUNvZTd5a1dDSWMy?=
 =?utf-8?B?NjFGRjh6MllES1FEczIzdjlyeHJuQmNjVXN2Y3AyV2FuQXErRDZGZWpEd2J1?=
 =?utf-8?B?RDNaOWlTelRwTGZsbHpHUXlrek5aVEppVGY4QzdPSWxoTTltY3pWWEtxTUxk?=
 =?utf-8?B?dEtodlFJRWJybFgvUkNZdnFUa2VlNktSV09kMDViL3hlcU9OeForcWhIRkds?=
 =?utf-8?B?eFhuOG9xWmhwUDlPejhSdHZQSUhpWWFpbC8vNUZrMmxjWHh1YlJLTXh1YTlM?=
 =?utf-8?B?dGo0d1pTRW5SWEJvRHFuUTg4MlRQM0V1WXptVUtKSXpZTW54RmJkamNTKzNw?=
 =?utf-8?B?a3V1dFliQjlNUmVzN2svRTFDYjlZVTNmRmtYVGFDOWU3MWt1L1N6cG12T1k1?=
 =?utf-8?B?bitnOUhsU3ozVGxiYXVWL3ZpV0FLeWlXdFRsRUNXdzB0RlY5RG1pY3FHUkc1?=
 =?utf-8?B?ek45MnRiaXorTFVjcE1pTjdzb1dIUFJUZ0YyVnVyRy9zalArWk5tYkl1RE53?=
 =?utf-8?B?Y1JGNFlmV29VVG9qL3pCZjE5RUZkZ28yNHZkTXlUN2hwaHdsd21zNVRmV1A4?=
 =?utf-8?B?WGg5NVFkOWQvUzNwRk91cmxCT3N0Y1EyVUNhOFNpTENaRjJpbEk1Q1JEdC95?=
 =?utf-8?B?N2htK2FPbE5jNmhqZHlWSFJzdTdLalk2cE1GYnBTK2hGS1VTbW9xSlJwQmsz?=
 =?utf-8?B?dXFkNXRaNGlHYy9jZUVyRHZxeCtmMDZkU0RlYVZaNmZxTVhEeDY3SVRZNDh3?=
 =?utf-8?B?MDNqR01qRWZoNC9FVnplYlBaaTIyMnllZkkxc1gybGgzMm9FaFpmQVY5U0hM?=
 =?utf-8?B?TEFrSkFqVnpaclVqUkNhbTFkQ2Y3ME9qWE8yWENYZmlYS09HOFN0WXM4Mnds?=
 =?utf-8?B?RndDMEY4UEc3b0xFR0JQYndrUzZuTDN0a3dPbStBM0doVlIrVExZcWRodkMy?=
 =?utf-8?B?eUhiVjU3VkR4Q0JhTHAySG9wMS8wYms2MnN0cUduL3F6UERnV1VJSlVsWWF4?=
 =?utf-8?B?UGw4bzBZT3ZEaTJ2N1oyZVp0azhOTUU0VUNHT1ZvcUxKdFFZUzZpVjNxV2xJ?=
 =?utf-8?B?dmt6akl6amhSTExMTFFaQ2I3N2d2TjVQUS9ETXcyZDhnSzEvWUxaY1V3aGJI?=
 =?utf-8?B?eFh6aXN2MW01OURaV0hOWldhTVVGZGlSd3FJdlYwR0ZYek5jKzZ4RFF3ZjZa?=
 =?utf-8?B?a05rd0ZHVEJCVS9jL25jS0FNSVUrTzZROUZ4b0ZzZlE5cGNnQ2xjVDhQOGVT?=
 =?utf-8?B?Z0o2QzVZMVo5bkRNNlN4c3lzdlNHakw2MVFKdmdnMENFVDBSTjdDNEZyR0dW?=
 =?utf-8?B?S1JzRDVERGwvOU1nZG9haTYwUHZLaVAvQzR3M3NxQ3Ftem5vYklpK2hTQnoz?=
 =?utf-8?B?eUNnZHlUbFBKdUljaWRCK0pOald5bm5RYW5uSngwRUt5VlFsalp0MTRqWHpE?=
 =?utf-8?B?K0U5TVdJUEkzTmdVUHVtQVlnSHFFRUk2SHpES1lZSzdsNnhaQVNRQzRPbEpm?=
 =?utf-8?B?dmd2NkE5TTdmYTQ2S01oZS9QTVkyTU9xNEE1THlKMWpBRmQ1RXlvenpYV2pl?=
 =?utf-8?B?WXF2MHV4UldDc3J2MGZNL2dlTHpwVnl4N05uYlVRWXdhMVVUMVJCcG82TTlW?=
 =?utf-8?B?S0NBdHJCY3BKVlFkSm5jV09ncHQ1Rkw5R1FIVVlDc1FNbTJ0dzJIOHVlUXZP?=
 =?utf-8?B?Y0lKRnJCWXZvYk4zZDZMTHlNWTVCR3hrZjlWa2hncGdwZGlRUVZhNG5QZGJD?=
 =?utf-8?B?RFdnYlI2MWpVUXNaMzhWcDVpZGpGeklHRml4dUF1a1A5QWp5TTB3ajhsT0JD?=
 =?utf-8?B?R2VJbXRqeGUzakN2Mi9XL0kwZ0ZiMDVGamxkVmh4WWNFQjNqV2RyeS9hNWNS?=
 =?utf-8?B?cmZnL2h5aE1UNzh5SWdLMlk4T0FFYzF2ZytQV1hQY2FNL3BKdTRVVDdub1lJ?=
 =?utf-8?B?RFRWcndxYk4yOFRmNitvZzdzeU0vcHFianZKODRVZzgrcUFmM3dsVzZadUY3?=
 =?utf-8?Q?fyGyMkicKxkFc/zZLz0SmKFdL?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5d2892-ed3d-4fe6-d94c-08dd78fafe08
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 13:15:55.7212
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U6U1VcGH5/cZXonEUCK91H+aW5kmzIO/GQXQgeE9FDO0bR5vftgAKdZXzdCc/E9NvhubGIiWRc46faEyudnvJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10674

From: Peng Fan <peng.fan@nxp.com>

Commit e898d9cdd3a9("mailbox: Add device-managed registration functions")
introduced device-managed API for mailbox, but in the past 7 years,
there is no user for devm_mbox_controller_unregister. So remove it.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/mailbox/mailbox.c          | 27 ---------------------------
 include/linux/mailbox_controller.h |  3 ---
 2 files changed, 30 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 3a58dc56f015b0bf0ebc7551713af38c16439e11..3c3bdf278b8e729f494b0e61c008b63dbc4f9344 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -587,16 +587,6 @@ static void __devm_mbox_controller_unregister(struct device *dev, void *res)
 	mbox_controller_unregister(*mbox);
 }
 
-static int devm_mbox_controller_match(struct device *dev, void *res, void *data)
-{
-	struct mbox_controller **mbox = res;
-
-	if (WARN_ON(!mbox || !*mbox))
-		return 0;
-
-	return *mbox == data;
-}
-
 /**
  * devm_mbox_controller_register() - managed mbox_controller_register()
  * @dev: device owning the mailbox controller being registered
@@ -632,20 +622,3 @@ int devm_mbox_controller_register(struct device *dev,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(devm_mbox_controller_register);
-
-/**
- * devm_mbox_controller_unregister() - managed mbox_controller_unregister()
- * @dev: device owning the mailbox controller being unregistered
- * @mbox: mailbox controller being unregistered
- *
- * This function unregisters the mailbox controller and removes the device-
- * managed resource that was set up to automatically unregister the mailbox
- * controller on driver probe failure or driver removal. It's typically not
- * necessary to call this function.
- */
-void devm_mbox_controller_unregister(struct device *dev, struct mbox_controller *mbox)
-{
-	WARN_ON(devres_release(dev, __devm_mbox_controller_unregister,
-			       devm_mbox_controller_match, mbox));
-}
-EXPORT_SYMBOL_GPL(devm_mbox_controller_unregister);
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 5fb0b65f45a2c2ea987bc307758af1e6601767d5..ad01c4082358648c4ba51a7f73554bc1bbf80c78 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -134,7 +134,4 @@ void mbox_chan_txdone(struct mbox_chan *chan, int r); /* atomic */
 
 int devm_mbox_controller_register(struct device *dev,
 				  struct mbox_controller *mbox);
-void devm_mbox_controller_unregister(struct device *dev,
-				     struct mbox_controller *mbox);
-
 #endif /* __MAILBOX_CONTROLLER_H */

-- 
2.37.1

