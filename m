Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2081.outbound.protection.outlook.com [40.107.249.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F43213E61;
	Tue, 11 Feb 2025 12:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739278781; cv=fail; b=CgNLxFtusiRqAvG11+kEH4UcfsUpq7jbvi0HwrFLju4aFh6NsPbnHV+JcoAvgUh9UawFBdxGumxfT3LFk/BkMktHrPWiv41vydkkGBRdxwo53IDxN6uf4zbFTe2UHLBCTt6A8RqdGq89mctq7H07BE1zzWt5qa/P2J4nuV4qFCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739278781; c=relaxed/simple;
	bh=wUzjZ5uskqGQNzLtzi8w4Ptc3q0f0t6eVr6bDvOvjlw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ujrhCcyKqTpW2j9/GDmv5xdam3qlVX2u9lSt3x6+xaweu03ZCbowaRZn07jH392bfxkjLYU+jh6VpqafAsjlGIAobRojn7tghBDJU7IyyPv3PFCxJWFIkW9Vwqm0CHfYPNm4DfycGnUTx93mp5MMkyib1w/VGOyLLtAoPZcF2n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Q733gD2F; arc=fail smtp.client-ip=40.107.249.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Q733gD2F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TlKNjvGUbJBIJhcaLoRgo920mMULYhg789eu4tCnSQsml9Byx8yqkVhX53edtPrWjUKoDKbJ7i6OaDqSTRFG8o/fZUCnZxt01/jpd5mDtAKBibVhDC3E1/NWcswIX5yH/ZTqiFzWQJvEWanOKUa4XDQYq0g0qYGnHSH379viDL6ph+K9sZYOe2eYdOYisypx/Ytv2i2hzGjClYCPFEoukeXbTfCsi1jKuGeWLCkNoCEXxJkgXdrJ6mJLmUQUOKgHiuDSBS8fqUyjUc2/oJycu3EMRyyyWoJIgDZoNhf8bv2ykkjGY1uLJcYO76Zqu3CNqUoqJ03nD4xIx0Z3Dx/nOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tbq3zs2kxvf0eYsLKoQnr/CdG402zEjTr+umWKPqlhQ=;
 b=DLzR5Jm/Dsdgf1gtH+RcUEKFzvXLmzt+C/ebDIRno/c56eLUCh8o6L04AJLupbSYc60jDnbZkH79oN3DKj3Z+1C0jNEJU3KiTc4JBIcPYoL8gbitngb4KvEBr2P4qIcgeqBjxmgc2mqLlfibpTkSTfPPHHYMnW45CAoEi2IeBfoaVVeVpeAmKjzwW/3T4eSKutUBm8XS9/0hOKjQNSPHuMSP2Hgw4HRoRuMMzcserxQnUAi2deM1G2O7oa1HqtcpcQdkUNo3wZLCsiMw9Hv6Oh62Ur44+wNzJL7a5W+Yac8JkMZUMwwTmD49+nVLLRp+jCpkqyQo7J9wNrDETnXIhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tbq3zs2kxvf0eYsLKoQnr/CdG402zEjTr+umWKPqlhQ=;
 b=Q733gD2FKdgNm5x/RDamba3kXudcOht8lbds9Zro4SJa34kZGM2A7doNMTzUP6yZQDY+sgoz5mjEgB4S8ylRCXxI4ekBfTWppWyoHHIyOUYF2afObavGob0VYjaKmvrSeczsFXZLuoF0o9xy2PIlZUtiJDgjyFWzlPsAKgL6Z5M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB8537.eurprd04.prod.outlook.com (2603:10a6:20b:434::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 12:59:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8422.012; Tue, 11 Feb 2025
 12:59:36 +0000
Message-ID: <06f1f9f4-8a79-4505-98b8-992accf1fb87@cherry.de>
Date: Tue, 11 Feb 2025 13:59:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/4] arm64: dts: rockchip: add overlay test for Edgeble
 NCM6A
To: Dragan Simic <dsimic@manjaro.org>
Cc: Jagan Teki <jagan@edgeble.ai>, Quentin Schulz <foss+kernel@0leil.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Jonas Karlman <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250207-pre-ict-jaguar-v5-0-a70819ea0692@cherry.de>
 <20250207-pre-ict-jaguar-v5-2-a70819ea0692@cherry.de>
 <CA+VMnFyom=2BmJ_nt-At6hTQP0v+Auaw-DkCVbT9mjndMmLKtQ@mail.gmail.com>
 <8d830c2c-6268-4c70-ae8a-47183b8cbace@cherry.de>
 <74502f5556584ee7378c63d4971f2a66@manjaro.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <74502f5556584ee7378c63d4971f2a66@manjaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0028.eurprd05.prod.outlook.com
 (2603:10a6:803:1::41) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB8537:EE_
X-MS-Office365-Filtering-Correlation-Id: 9afbec75-23ac-4fcb-19f7-08dd4a9befeb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGNUdjlGZnh2WHhNYStWRlk4bWsyYzRmUi9Od2NobVl0YUs5RkQ1b3krUllD?=
 =?utf-8?B?MUNtR3Y2eksydWlRRGNsdUlFTHp1MmdKcmJuQi8xMVp1eXUxTkRSMVZTQVBH?=
 =?utf-8?B?VkR3L0srNk9FL056Q3Jsd1VnZTh2MVJDK1JuN0I3SWxsK0RJUFlaODhVaXBw?=
 =?utf-8?B?TEVySkRoUVoyS3c2Zjg5ZjFNTjhycnpveWRQb3J3dVdTSFkyMSs5RGVPZkhV?=
 =?utf-8?B?U0dSUVowYnFkSHNWeEZ1dlY2ODJhU003RWdUaGNNSktwRk5nSUsxenJuNmZa?=
 =?utf-8?B?LzB3RENxUjdDS1ZlT1F3a2NVZUs5RS9xcWRZNGs2OHRxdGlmVStWZCtiSTNI?=
 =?utf-8?B?UEpuSlMvK1EwOWluNWtnZGlERHRmNUFsZFpMd25yUnNrSjhaL2JRL2R2Tm1C?=
 =?utf-8?B?VHJPQUplK0hMOVlGRTZHYjk0RHN2dG1CTTlDb2JYTTI0VUI4T2o4blRZQ1N2?=
 =?utf-8?B?dGUxbm0vR3cyRTdqemdaUEtzb3lXbGlOc1o1NGlRTXM3UjZXL0d3c1VYWXJs?=
 =?utf-8?B?Ung5YTFScUJZL1pqWTl0eUdSMXN2b1QraFpONkFHT013bTNXdHBHQk84ZUJa?=
 =?utf-8?B?TXdDcTVjOGJUTGdTWkZ2S0JsVXl5elZhcjRsQmNpM2dTeVRTOHFVZkFXcFlN?=
 =?utf-8?B?dGxYUWJ2bUFFaG5CZG9oalBSek50YnlsTXdCL2lsaG5vdjM0ek9HZ2U5WXBG?=
 =?utf-8?B?Rlp0SEVaM1QrTjZvbHQ0SGVWR3dic3pSR2JyRVUzOXVkd0crczJJZitpL1ZD?=
 =?utf-8?B?NVNQRm1JdEtIQTJUMVFkUWtCVGZ2aTcvS01aSVR3Y1JSYmVKSHZ0amxLVWJQ?=
 =?utf-8?B?OS8vQ3Qwc1NJbnNFS0UvWTlYb3cvd0RuWXIySDRvMkR0d05Ba3BMcmwyaU1C?=
 =?utf-8?B?RmtGRDFyUVo2M3hwdzR1Z0EwYXorLzk1clQzTUY1ZU82OWRFemRGODluTW5s?=
 =?utf-8?B?TmlSaGc2c3c3SWszcEl1WGhBaTIyNXFFcDZyYXhqRXErWFFLNHBHUnVWTHZk?=
 =?utf-8?B?TWQ1cUhkQ2tJMnZWRkxBL3BWenQrZTNYWGxVR3NITTBSbnFhV3hTMjB5QThQ?=
 =?utf-8?B?UFo2N1pTcTJpTlBEc2htY3RCQ1d0cDFTNnZaYnQ4eWxXM2lUb1M4bVphUWIr?=
 =?utf-8?B?ZFN5NVdSNjBoOVR2WXFLS2NzNWt1YmU3dHF1bFBOVjdvZDcwSS9OMDFieUFs?=
 =?utf-8?B?RlhzWThBcElPQmk0VEVzQkExV0V0TnVKRmE4bTg3SGQxdUFJdnRjL0JQaEMv?=
 =?utf-8?B?VWlsdVdhdmUrZG5mUVUwdFczbUVGcmV1Ym00NWZmRzh2QXd0VVR3MWR5RGlm?=
 =?utf-8?B?VVR5blJydGZERXlxZE9kQzBWbkxBTkx5QkdmdEhrRzNyMWthRFlFeGphS1V6?=
 =?utf-8?B?VmdQRGU3QzFFcVEzQUFxL3ptMzcvZU5wY2g1NUtIMXgvNzUxSUIyQ21zc0Nm?=
 =?utf-8?B?K1BzcVN5R3FsOUdMSDAvcW9ZVkZUZ2VCdGlwaGJjY2hvTlJCVEpOK1E5TWt6?=
 =?utf-8?B?ZWRDTHZDUWZXRWRJQisrUll5QlJYT01ZdTUxRy9IZHJFV0E4T0dsZStaQ2s2?=
 =?utf-8?B?b2k5ZzArNWh6QTl3U0J3TnEvblYwbUlEdjI3Szh2N25CR1BmNHo1UTZFOThr?=
 =?utf-8?B?djllam5ISFNPZFJGeHY5aHZYYlI1R1g2YkdLeEY0OEdhOUxLL3F1SzIzdFZu?=
 =?utf-8?B?Vks0UkdFeE5GSXZKUExPTmhhRysyZmk1NHd5SFlJWWlUTW03YW9MUVl4WkVw?=
 =?utf-8?B?NFljZVRMNklCNU5MZUJTNWV3elpKR2plRS8yaGZXR2x2ckE3VmNTMzJWN2tm?=
 =?utf-8?Q?a4vJnYAeg5tPW5Ne4cmLXX3HwvHHA5rwoDAwE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzROVWxMY2RyWlMxVk9tdHd1eGdiVzZ0Q3BSb2I0R0hBdkxocEZsd1J2eXl3?=
 =?utf-8?B?MGV2SGNJbjJTZzg5ZFkxcFpLSHhkWjAva1dDR2l1WFgvc0NqeUxORElPTm4r?=
 =?utf-8?B?SHBldllaakdLV1dFWVdaMDRld3JUZzlBNTFKNFB0dUFxMnFJM243S1RxTTc3?=
 =?utf-8?B?WmJJSlAzaWlWUUJ2dFlyd1Z6UTIzNFRONmlHa0RQT1ZMVTBEdUJVZXMvOFdG?=
 =?utf-8?B?a3UzbHhLZERwVkpIR3c1dDVONTQwbEUwSjZ4aXpabkI3S1RjMVk0NEdubU94?=
 =?utf-8?B?cjJvS0NUUkVJM1B1MXV1YTV4Q0pMSDRXRTZBM3JLWTFHQkJEVExPOFRvK2Fv?=
 =?utf-8?B?aUhnbzdZZm1RS3B3Nzg2NjN6WFFJaUQrQWo3Y2hiM3I2VWVxQjNTdWFxa1ZP?=
 =?utf-8?B?dHlTZWFobDdrZ3U1SmtWbDQ5K1hLcFBMR3pJTWQ2am4xb2tmcFpRTFNQa0J3?=
 =?utf-8?B?TUVORTNydDA5eXp2dGRzMHhlZTdvK2FOdENxTmxpUVdyVVQ2SDU1cHh5M0FK?=
 =?utf-8?B?QXZCdC9aZ2hrQXdoallFaVhRdWNjVHNob3Joak10SnlBRWNwY0tQSUJjSndN?=
 =?utf-8?B?empGeFZkdnF6eTFoMGRkcUNKVzdYd25yUSs3RFA4aWtZa2dlaDBsUE02RTVu?=
 =?utf-8?B?SGdtMGhXOXhRWjBXd1FlNXpyaGdTZDRZNytvTm1wQWk5R3IrYkhZZUlxVUpk?=
 =?utf-8?B?UXhFYnVRTnlVQnd5M3NsZDNtN2kyazV5K0kvc3RaeThvTXplVjA3MFBpVTlI?=
 =?utf-8?B?RkI2WncyUVlFZGN5SHVEOUNRT3pvM0tnd0IxQXRKbEF5Z3VjLy8wVU9aWE1H?=
 =?utf-8?B?TkF2cXR4dDRLVlMzSDJWSTZCVlJDaFFMdXFBNnpmQnI5Ui94dFYwTzRWWTdS?=
 =?utf-8?B?M0hDTkxObkR3Q3FYSU5uZVh5UDdObnliM1dSSFBHQ1AyWjE3dmgxbmZUVlFZ?=
 =?utf-8?B?NGNoK3Y5djRIMUJVd3F6TlpXcUhlWlR4amRiNlhlUHNSVjBsSXdNN29oSG84?=
 =?utf-8?B?TmRxMXd4NEZnbDRvcVJFRmMwSW1tajNxV3ZLbFJQUXQ5N0NFTUs2L2d2blJL?=
 =?utf-8?B?cnlOeDRNUnpSUDBKRFZDZGU1bm1CMDU0MjdoTjNnYk9BK09ZVDZuSk5MbFo1?=
 =?utf-8?B?SmpnMGxQNUVKTVpJUkZCUkM0L2JDcG9NV1p3QWY0cXZnaWRjQ1QwWC8zV3dw?=
 =?utf-8?B?V1JhODRXRmtoWmJ6emt6dXVjOHUrUW5DbC8vQkNId25yaU1pMTBrY0FybEN2?=
 =?utf-8?B?MExvc01hZDRwWlFKNXUyenRyejdPd2U2dVd0NXYvdlBmREk1VmIxQ3Y3cHZU?=
 =?utf-8?B?NEwxSDRtb2RsckJOUC9zTTM5bElQN1d3Y1p3NVVQM3BoZFNMK01Vd2JWL0M2?=
 =?utf-8?B?WUY0enlaR01rNjN3d0xzb2FwdDRrUGFhbFJ4cUtpZ3h2QTJ2anQyWFVqR0ZO?=
 =?utf-8?B?bEJZSFZkWHBVNG10R2NIa0xNMjBLUkR6RCtXamwzTGN4UmowL0FESVRlYVZ4?=
 =?utf-8?B?RjBHUWkwYUdHd1lJclk5QTUzczhibnBLNHQ3cC8rTW02TG1vN3Z3NEZncmtC?=
 =?utf-8?B?Njdkb3pGSnhvc2phZXBkMERVUms2OHN5WFo4VE1JdkVlRWhIMzBQaXREYWU1?=
 =?utf-8?B?aHJtTzduem92eDNiak9nSVBDM1dVS3Ftdm9VTi9mLzUrb1Nva0NhWHV1U3BD?=
 =?utf-8?B?YmtQRVR3bUs1Tk5NMVVROUpzc1MrRHpSNGJENFlzcWFLdk5tZ0dKcFJmaGVv?=
 =?utf-8?B?NjRZTTFXcHdycGd4a0p6YTltNnRTVkN2dVh3NTlEbm1OUGhHbjJTR3VmUUlm?=
 =?utf-8?B?ZVNiaWNYZmJpN2g3c2pGSUtIaHdTZWhvZU1TenphZ0lOam1jREpQcWdHWlRB?=
 =?utf-8?B?cnBZdzQybVJkOFFRRThHMkxuVi9qd3FPWEN3emtTTWMvZjB5all3TnAyTlk1?=
 =?utf-8?B?QXZGKzBRUDZYR1dFZzUraVRoOEhlSnRZK0FZWEcrZkd4K2RQK3NDM09FQk5j?=
 =?utf-8?B?cG5TYW9rMGRmZWdZcGJ3b1NDaDZuMHAyMDVzVDFkL0VzNW1xc1NPSFNJMmow?=
 =?utf-8?B?T2srNDdiVFpxMGZUMEs1TEk5Z282cytGYjZ3TXJZeEFBTnhIOGNldUdxYVVp?=
 =?utf-8?B?RHFBQnltNlRwVy95Q2IzdTBaQzl0d1NwaVZtTlJKVyt0SzUrQXpvNFFMcnpM?=
 =?utf-8?Q?Wgpd/rf7SSOeSs/4BkWJgPU=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9afbec75-23ac-4fcb-19f7-08dd4a9befeb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 12:59:36.4029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVFeCwA9aIh9c+BDuxIc3Mea5BCLZlRLiz0QG5rvzGATUX8WJ8yTN39YG41jwx5cgYwe9llQcOXo+tsmlCKOdourfTNOKwViariYEeMZQN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8537

Hi Dragan,

On 2/10/25 7:29 PM, Dragan Simic wrote:
> Hello Quentin and Jagan,
> 
> On 2025-02-10 18:57, Quentin Schulz wrote:
>> On 2/10/25 3:11 PM, Jagan Teki wrote:
>>> On Fri, 7 Feb 2025 at 20:50, Quentin Schulz <foss+kernel@0leil.net> 
>>> wrote:
>>>>
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> The Edgeble NCM6A can have WiFi modules connected and this is handled
>>>> via an overlay (commit 951d6aaa37fe ("arm64: dts: rockchip: Add Edgeble
>>>> NCM6A WiFi6 Overlay")).
>>>>
>>>> In order to make sure the overlay is still valid in the future, let's
>>>> add a validation test by applying the overlay on top of the main base
>>>> at build time.
>>>>
>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>>   arch/arm64/boot/dts/rockchip/Makefile | 4 ++++
>>>>   1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/ 
>>>> boot/dts/rockchip/Makefile
>>>> index 
>>>> 534e70a649eeada7f9b6f12596b83f5c47b184b4..02f98abe1df10f44f2ac27ea5f6c6e6c6334724e 100644
>>>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>>>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>>>> @@ -192,3 +192,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3568- 
>>>> wolfvision-pf5-vz-2-uhd.dtb
>>>>   rk3568-wolfvision-pf5-vz-2-uhd-dtbs := rk3568-wolfvision-pf5.dtb \
>>>>          rk3568-wolfvision-pf5-display-vz.dtbo \
>>>>          rk3568-wolfvision-pf5-io-expander.dtbo
>>>> +
>>>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtb
>>>> +rk3588-edgeble-neu6a-wifi-dtbs := rk3588-edgeble-neu6a-io.dtb \
>>>> +       rk3588-edgeble-neu6a-wifi.dtbo
>>>
>>> Please add neu6b-io as well, wifi dtbo is similar for it as well.
>>
>> Similar or identical :)?
>>
>> Should the overlay be renamed if it applies to neu6b AND neu6a instead
>> of implying it's only for neu6a based on the name of the overlay?
> 
> I'm afraid it's a bit too late for renaming the .dtso file. :/

How is it too late? Is there some rule somewhere about renaming I missed?

Cheers,
Quentin
