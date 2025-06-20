Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023074.outbound.protection.outlook.com [52.101.127.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F5E280A5A;
	Fri, 20 Jun 2025 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411281; cv=fail; b=YWV8EW7LjC1K0/g7bDMmre8eAwZA7j2yP4qCQ3g9+rCYU1mWAycWBBkhKNYCe4N2nc5MhczJMStDOuv+wsKojdhu/eLlMIDPaakewhptc8VblNN5UXkZd7BWaxa1lLbbeT2wJqGKGIyWsZhybweoPvXSV8XaiNGkLsvJ95z+NYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411281; c=relaxed/simple;
	bh=ZOX3eJK6wfjMMQpr/a75xDt5LIiM+GSrbAyIMFxEbRA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DV8UbUcRqyiB03VH384IVuPAuVXDttQeHU7iyobfwtrkL5EXjHfnlhAtDzQQVaiAq5rzHaGLI8BvSCRVsGwFZ8A4jaAiTr5VdAo81G8blWt5ldvdHvvR+ziJ3FgcWb1iEf/xRL9E7iGjz1EwuPA2QaXyE2lcos2rGrwu3RaTnrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Mu0fOWbj; arc=fail smtp.client-ip=52.101.127.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Mu0fOWbj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZTGbQxuuVE6Cv8cvVPvI4wpz4LH+OUXm54T/BxMFkhj3OBtnfUfsMeK00x7lWh0rgrcXBVxLiUDRw4ZCYv7DLEdQIf864J0QgUUVQc+IG7JWtLmgaFAOwuUx36y5RIfWoJtMXOqCHnOE+8mzGzhNYyUpqRNXm/P+gMUI3f22rnD7ZjRBV1dsPe9dp/zOTmw9aXTzIzWx8qJr25v7hmnxnRHgFz95aWKJXEr602ssT806e3qrAb9nBCJ4qNIkwl2nWVBU2xljaValWA0mGehbAN1B1dqG9kjh9mSbwGzjJ4PJfw3kjecbfCMNQ5PAy9r34WElwtFFi8blOlAnKQB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=krtgKmIZ4+cgGj8sKGuQ4fzO1lo4Jytvs46OGzR+OKA=;
 b=JS4/IXKP5BnR9rSQO2JQeThrHwTr+hEtIh4D6rgk0LDlJhNKeoIDj0KTvrH7lgIXh7W6Nk8Lh8nFuCllHBEBt2CwHBxis1/5Mogs2JOSKk+jo7pnw7qTJKBor8yTVQ+IC75DjI71SmsyIbRkhJTLil5ObYWLy6Rc/nuVxEZVxebHVdnjltqbwsMAzSDQ8UqyWxOFicXXpIU+pwUyoweA1/iGfxOduznksvsyHGuKMJG/Xs5Yahu0D3oY5lWiwjuUhHII7R7mA8UzOcZYy/zQ2yJmytBvC2/OmeL2SzH7we3B+/U6WI4dwtbLUgw7LfGMu5Ddt22zEcYy5KMyYAE8rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=krtgKmIZ4+cgGj8sKGuQ4fzO1lo4Jytvs46OGzR+OKA=;
 b=Mu0fOWbjbAlW6/O0ONE/XLksst4YuuUcK+5hws8LqKydpKiIKO718ADYxF+Qv5Kx9cK+TqJoSmm2gptrVVWqC/ZN4gc7aMAy85w+duqeMIq8HuxFIZ/M0y1jJUBS1mWqZxzvysS3ujZ+QtymHQb92YTrAPTOfZnI3JNhESPVZMEZWQfmFvzislSZhQH9Y5Opc0pmgFrg9fbtsk4WEAi3PFHWGi2WALTG8DsLAc9kVYB4KaLLwaSkiGzEpT1pwWszl9AeQTtgZVJAJWdf3OGL8eWcLclf3glr0yWgGrbvu+QZ7QKG0kMVeFYQmeCvPm47cDbz9ukB61idSSJRfw4uQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
 by SE1PPFB8A17DC0E.apcprd03.prod.outlook.com (2603:1096:108:1::861) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 09:21:14 +0000
Received: from SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8]) by SEZPR03MB7146.apcprd03.prod.outlook.com
 ([fe80::f608:5d7a:df6:35f8%6]) with mapi id 15.20.8857.022; Fri, 20 Jun 2025
 09:21:13 +0000
Message-ID: <7ae5cc8c-410b-4be7-84b8-7a6273a45717@amlogic.com>
Date: Fri, 20 Jun 2025 17:21:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] clk: meson: add MESON_PCLK_V2 for sys gate clock
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Chuan Liu
 <chuan.liu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Dmitry Rokosov <ddrokosov@sberdevices.ru>, robh+dt <robh+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree <devicetree@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <20250509074825.1933254-1-jian.hu@amlogic.com>
 <20250509074825.1933254-6-jian.hu@amlogic.com>
 <1jzfffy738.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1jzfffy738.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0049.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::18)
 To SEZPR03MB7146.apcprd03.prod.outlook.com (2603:1096:101:ee::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR03MB7146:EE_|SE1PPFB8A17DC0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 542765eb-b083-4b4b-a5d0-08ddafdbcd6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVh2WmNlUWowVVF5akJDdHBJU3lNUDcrbGNvTmg0ckFvREw0QzdTamRDcVgx?=
 =?utf-8?B?MC93a3BPWFlOUlNXeVkwdGh4M2lSQlYza3l4VkFJRzg5MGhSNzBOR3N0ZTZG?=
 =?utf-8?B?RElrcHVnNmpEeSt6bW55SWp1WEtlcGFtSUw4UDc5QlBNeFRVbzJMOFJjWXpJ?=
 =?utf-8?B?aEJFMUt6Mkg3dGlHNU1JZG9jWEdCVXdwenlxQ2tPcnlhZmE3OWoyUFNIZ1ZQ?=
 =?utf-8?B?MjNrYW5rTkgrQ2tNZzRJK21QdGF0Zml4QW5vOHBvVit1UmZ1TU42UGJ6QkNU?=
 =?utf-8?B?Kyt3Rk95cytvVis0NTZFZDMzNUlMam9ubVd0dXVYcjh5SXltR1kydlFJUXlo?=
 =?utf-8?B?UDJVNDkrY0VDQnVLdHBKcUpkVmdUK2FlY2NzalRUNytrQmlqbVRwWUxCK3gy?=
 =?utf-8?B?eTVWZXNQdzRzNW9lRXUreUI3RDJHR1hadDZXanMweGlYcHZEaTRUNmRZM0RZ?=
 =?utf-8?B?SWJOc2FzWHNkMmppY09GZGQzS3l4bU43TVU2dEdJVXJwZWk2dWdjWWw3THJZ?=
 =?utf-8?B?akRVaGdlb2NmOFVuNjV1VGYrcmFIUnFscXByeHcxeXpxZzVtcDFCdWZWOVFZ?=
 =?utf-8?B?Q1NnS0huaGFBZnZkaURPZWNiN29PRUFPeUdzNldnVHkwRzFlL2lGLzhUcVJi?=
 =?utf-8?B?R2lwdkxJQXM1RzBKSzVLREdJaXZXVUNPaUJpd0dQTExjOXFvTjdDUGlPMFFY?=
 =?utf-8?B?Y3BZSlR2TVZ2cTRwaUJyRnN5K2RTc1l5NnBqYzh1ZXZLVHRiaGt0TjFVbWNV?=
 =?utf-8?B?S3MrL3pYbFJjbVJCblZGbXFrQzBJb1dRZXppSjk4WnU2U2dETm5ta3pjQnhM?=
 =?utf-8?B?c2p0SFk1dFJYZGNybldHVzNGU1dRemFkK2ZSa3QzVW1nNnlUTXp3TUtDdXpK?=
 =?utf-8?B?NEY4VWNOWThMbWoxaDhKalBDOWc2NWF6WHpBUzIzNHdSWWpTYlMxdmFKSmlu?=
 =?utf-8?B?VUNtQWtsektKbWNybGhMRUtNeTRCdTdHajVqMGVvYXpuT0FrWmVpVVAyMEp1?=
 =?utf-8?B?U2VqYU9LNU5mNjlYYnA3V0NZVlUySklIOWFrYk9BWG5QOWtpQ0FuMnZqekhV?=
 =?utf-8?B?WW1TcGZXN1hRYUdLcjVhY094TDdGY2lwTjA2aEt6a3FCbkt6S0RzRGtGdEp5?=
 =?utf-8?B?a0FBc3g1elR2Ky9CS0h6QWtmelVmbXdtdWZJU0lZUGZpZnQ1ci9mK3FLdFVZ?=
 =?utf-8?B?WitjamZEeEh2N2I2UlJZZ0NKU3A0N0w0Q3VFS0pEWXVnaEQ2S1RudGtGenFj?=
 =?utf-8?B?N25vbk1CcEtFRU14S2RRbFgvYkFnMFBScU9BTjdlNDJROTJvdEhDdnBCb1FV?=
 =?utf-8?B?U0JjN0I1TXQybUhUaldya0tyVFFPUjZVd1A1MlJQcWZwWFFNRng2OHJXbkVw?=
 =?utf-8?B?bWpRMTVMK2xpYmtGSE1NTHJFUHNZcHluNE90TW1iYmNCL01wdjFnMmFXSzkw?=
 =?utf-8?B?dFg5Vnd3Sk9WS2Y3anppWHVyRm1UWEVGR25TVkwwVHVVZzdpNGRNQ2E5VlJZ?=
 =?utf-8?B?Q3NRajA1djNIbDA4VTk1dXZvZkFOdFh4U3MrbG12a3g2MDNBaWgxUzRseTdo?=
 =?utf-8?B?NkRSWUJkaWpLMkUwd0RDNUlobXhpb25NWnBvOE9QOFRvdkNITWd2VnRjbGVT?=
 =?utf-8?B?c3ZKWTBKb1dFUThxdm9rR0lHQ2JTcWtEV2tvMXVUb3FHbXJldmJDcjZxZlho?=
 =?utf-8?B?bVR5S0o3NXY4NzlicFFpWGdmUGg2aWZpeFJXb1Y2MktVSkRSdmJMdVFJL3BJ?=
 =?utf-8?B?NDRjcXFHdTA5WVNaTTkwdjNOVmNGQ28vVEx5K3VyTm4zS0xVcmEyV2JEbGpO?=
 =?utf-8?Q?0An3XZISJB6PJ3hNEmwdZnXXaCqVL/f2ljXHs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR03MB7146.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QlU0RmdSVm8wYlZucnM2bGl4Vy9OZ0c5M3NLTDgwR1VRdFdqY2J5MnB3Q1J2?=
 =?utf-8?B?ZGRDWHg4RzBjVmtjOGFJdnNsbjdpb1hYd2hxWHNmeWQ3dTNZYTUzaHJ0V090?=
 =?utf-8?B?L1ZRVkZvWkNMcTJDQ1lBc2xibGxsVGVFd2dMejQrL0JSUjN1T1ZGbmYwaWQv?=
 =?utf-8?B?dWh2VDVqNkZmanhEcjJVM3dwV2JWMExHdjhWOUdObWdaN0F1ODErYy9tcnBD?=
 =?utf-8?B?U0Nmb3JYRWxQaDh4aGFmYXlKY0JVb0c2U0dqbnRnYS9IOUo4ZU5abnFIR2o0?=
 =?utf-8?B?RlVRL0pCRVdRYU52MUs4WFY4NTkyS3hQS1ZuVUhFZ2JIZFlkK1dhZmFNNkN1?=
 =?utf-8?B?d0VDTXhxQmtYdUtCb3ZBTWZBSUxnRTRVeWNxUk9uT0taNU1Ed05ocno4ZS81?=
 =?utf-8?B?ZWRnOEY2aDFyL0drekhPYUVwSXNpN2ZQNGFobGpOQjBBRGlVYzZqa2VDYlBI?=
 =?utf-8?B?NTVtM3JBVTlUbkZUZWFEVktURWIwZjYvZ3M3cXNUQWhSOEkyZ2gycjZHL3hl?=
 =?utf-8?B?UTU4b0ZkL3VQb3pNcXdGOXJNZGlqUHBSYXZBNCs1VUhQWGhkdnZiQWhBK2tZ?=
 =?utf-8?B?ZE52MlR2dldtcHJkVFNYUWlqZ0hFbllmL243L211WlV6T1NoaS9jY0lOQ1Bz?=
 =?utf-8?B?K3VST01LZzEvb3ArZXZLaTdBU29XalhHV09OdGRSWmpNUk1QYktnMUw3a1J4?=
 =?utf-8?B?NWJCcCtRN1hMMlppQWRTK1p4dlFTOFRqWExJa1pqOWtUWDg3VlBVMFdFMVVp?=
 =?utf-8?B?aUY4ZWpTU1JVYXdUNVc1c0dTdkxMdXhTb2xpbUM4djdOc0VPdmF3bEFiOVUr?=
 =?utf-8?B?cmF6dzZSYWMvOEVJay84cG1qbEsvMkx6M2plRWFjdmRYRUN4QW9WbWY0aGhH?=
 =?utf-8?B?TkNxWVI4OWsxYUVOSFhIaGpTNjRMcVNCQlZsanplNm4yUHJzYmU4Q2MvemJi?=
 =?utf-8?B?V3ZkZVRKdHMvby9CMXR3TGhXQTVHZXVtWUg4dVAzTUxPeUZ3TDlsNXRjL3ZP?=
 =?utf-8?B?WWp2VXpWZ2h1V01vTVZRZEtvTE05ZTFoTGhBbjVvbTV2S3A4WHVjVFNKaUxy?=
 =?utf-8?B?ZmhkSmh5ZG53QVBEUFpZK3dQT1FyQU5WSFdES1Y1VldvVXhKdENMWE5DcFlI?=
 =?utf-8?B?Um9Xby9LdnBTUVovZGpuZ0ZGaVlua1hQU3FjN0FRN0NBdlBEMmVsa0RCNlpC?=
 =?utf-8?B?MFI4ZlovTk8vUXVBa2s3SXRJbVlxY3N1cG0rbVlwUXFpYnNnblBrZFVsckVS?=
 =?utf-8?B?Mi9EQmUzcWl2NE9tbmdtRHZSTDgwcEZya29mTXdkUEJpRHZPamJ4SmU5VXI2?=
 =?utf-8?B?ajg4WlJ6Z2lVa0VVUVRzVFFLbGZEeWkyVVowdmFFZ1pPTXM1dkM2SHQzNHpG?=
 =?utf-8?B?VUdrOGFoWXI3RkdjZE9BTkFHblRwOHR2bzJuNWFSUXRocWk4VS90aXBOaWg5?=
 =?utf-8?B?OFBBRlBRYnVuYVhwTzlTK3dSYWhyajNycWJlVVdUVDRTTkhuczZzd01IWnNH?=
 =?utf-8?B?MmNreGN6a2dCY0w2Qy9PZlhQRHQ0cWdDRnpKVWVmaWVVNlY3V3JCTk1Oc1VI?=
 =?utf-8?B?eklKSUpFd1ZTam9sc1duRUFuMkhRa29ObVZHemxTQ2NtTWx4bERZUGYvMXNT?=
 =?utf-8?B?blRZMTY4bHl6TDNUaGlUNjNDMEFKbENXREpocUhhdWhZWDJPK0w3a3Ruelh3?=
 =?utf-8?B?WmNBM0NiSUx1TkFTamFaUTc5Qzd4VnlWU1Z0eHdXM056N2tVOHl1K1hQTFJJ?=
 =?utf-8?B?K2IvL2dIa01iemIrdmdnWFdxeWI2bUxrN0I0bE9tbnFWbE5HLytnM0RlVk45?=
 =?utf-8?B?RkIxQ3RoY0QzUnphSExrS1NRd2U2Y0RwK3JkbzhVN2h5L1RnYTJWYnFocnFi?=
 =?utf-8?B?bWliWGhUanI3T0pZeTg5OG0rVlBBL2g3dmswQk5oWmNOZnpEQTJDai9uN05W?=
 =?utf-8?B?TjFyT3hTb3hHZEdzblZ2RlBGYVpnMC80aXRMQ3VuU25PeTc1cE9HUGw1VnJU?=
 =?utf-8?B?dnRIcTloaklTZ3VnSXh6S2I4SkJjR3VzMG5sakdwY3RRZ3JkY0F2djRVVXdL?=
 =?utf-8?B?SnZuU3Q3eFV2dnE5TWs5K3FLUTI1OEF6SUhxY3R6UFgyU2R4RkpHSlp0NU1F?=
 =?utf-8?Q?cZx5HRI1Ac32brQ1+6vFG0IMu?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 542765eb-b083-4b4b-a5d0-08ddafdbcd6b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR03MB7146.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 09:21:13.7501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 67SbzYjDRFVx76TYuFeNyHMvnYg1Vd3T3OvuuxlqoDeIMAs2qVwV0J3qkiSCa4xzKrK0p3eKixx4G98BEYXN1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFB8A17DC0E

Resend it because it refused to receive html messages.


On 2025/5/14 15:39, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Fri 09 May 2025 at 07:48, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> A new MESON_PCLK_V2 macro is introduced for the sys gate clock. Its parent
>> is an SCMI clock. It belongs to another clock controller, and the parent
>> configuration is different from  that of MESON_PCLK. This avoids new macro
>> definition in the peripheral clock driver.
>>
>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>> ---
>>   drivers/clk/meson/clk-regmap.h | 24 ++++++++++++++++++++++++
>>   1 file changed, 24 insertions(+)
>>
>> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
>> index e365312da54e..61b8fc2d875f 100644
>> --- a/drivers/clk/meson/clk-regmap.h
>> +++ b/drivers/clk/meson/clk-regmap.h
> This file is not meant for amlogic specific stuff. I know some found
> their way in regardless but that's being fixed


OK,  I found macro MESON_PCLK is used in G12A/MESON8B/GXBB/S4.

New macro is needed for T7 .

>> @@ -134,4 +134,28 @@ struct clk_regmap _name = {                                              \
>>
>>   #define MESON_PCLK_RO(_name, _reg, _bit, _pname)     \
>>        __MESON_PCLK(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
>> +
>> +#define __MESON_PCLK_V2(_name, _reg, _bit, _ops, _pname)             \
>> +struct clk_regmap _name = {                                          \
>> +     .data = &(struct clk_regmap_gate_data){                         \
>> +             .offset = (_reg),                                       \
>> +             .bit_idx = (_bit),                                      \
>> +     },                                                              \
>> +     .hw.init = &(struct clk_init_data) {                            \
>> +             .name = #_name,                                         \
>> +             .ops = _ops,                                            \
>> +             .parent_data = &(const struct clk_parent_data) {        \
>> +                     .fw_name = #_pname,                             \
>> +             },                                                      \
>> +             .num_parents = 1,                                       \
>> +             .flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),     \
>> +     },                                                              \
>> +}
> The proliferation of those macros has been going on for far too long,
> add using CLK_IGNORE_UNUSED inside is certainly a mistake I won't
> repeat.
>
> This will be part of more general clean-up that currently depends on a
> this [1] patch to go further. You'll have to be patient.
>
> [1]: https://lore.kernel.org/r/20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com


OK, CLK_IGNORE_UNUSED is added for all gate clocks.

And  quote your comments in v2.  the T7_CLK_GATE is newly added in T7 
Peripheral driver in v2.

If I understand you correctly.  A common macro should be added for it 
and remove T7_CLK_GATE.


So I add a common macro in clk-regmap.h, and it can be used for 
different SoCs.

MESON_PCLK and MESON_PCLK_V2 difference is a clocks's parent defination.

the sys gate clock parent is in another clock controller. So parent_data 
member is needed for it.

and parent_hw member is for previous SoCs which clock and parent clock 
are in one clock controller.


How should we deal with it.

1.Add the macro in T7 Perpheral driver.

2.Or add a common macro for parent_data,   and where the macro should be 
placed? maybe put it in meson-clkc-utils.h?

>> +
>> +#define MESON_PCLK_V2(_name, _reg, _bit, _pname)     \
>> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ops, _pname)
>> +
>> +#define MESON_PCLK_RO_V2(_name, _reg, _bit, _pname)  \
>> +     __MESON_PCLK_V2(_name, _reg, _bit, &clk_regmap_gate_ro_ops, _pname)
>> +
>>   #endif /* __CLK_REGMAP_H */
> --
> Jerome
