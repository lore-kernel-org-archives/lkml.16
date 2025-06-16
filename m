Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD462737E1;
	Mon, 16 Jun 2025 09:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750065251; cv=fail; b=Ym++R9ZYfStZP9lX+Mr8JaABQYjt6D5mNxUXKxZ70pYvN8V/q4c/vgtqo4FyXhG5rKetHITHqTSWATEkQ+QfnTUGWs1IgE8kzWdFiHRs2icZCvQik2i3nRBvPaxGcZaA61v9PYCLeNU/sYr1Lf/nwZ3axaJ+/CAbokeOvsKZaJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750065251; c=relaxed/simple;
	bh=5F9yvspxOZ5xlmvNYBDFe1xU60kVFEe/8HI1H2LV9b8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CJioUw/VyOvTLLRLCujGokr1HxXNn9XomwB8IzN3jTskLnH7vywLqq3kA2oYrbVdb+8gtW1RJ1uAcPGudy5frVLBY/tfTJ7ECIaT+ziH4225grIdWiaGrA8rwlYktqKHzzg0vjsXLC4nfw9qMh8L5YhIUk8xF5bdg73cbYslLXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=E9xbOgen; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="E9xbOgen"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOMoiMmhDKV2Wa1FqY02LPmmE7GOV5eDEjWakYMwVwzVXTWbl+QOT/6D1JD3kUPzlOBgVfhxnGY+ai+UXEWURaV+NPgmdiDQq0JwVqPfLzkM5XD14kS7ncaGElf0NX1aZ+gZlH9AywaTht6Gu1qJhfNnWDXwdpwBt4ql7g96FBzJO5XnVp7mCIPbhhoZSAn4D64MlJdehBk/Tx0zdytF5aOjYT9enw2criBO8czl0IAvGUGyW16UKx08d4Qg9X2VOTbA6b+pkjXAVr6rtE173FyC9/7Dm9kSbuincXQMp51kfz/1dgB70FSv1t23JqsqVO3h1Rin7d/XsA6cqBWjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T5AblgMIgfJT36bKWhO2j6nN3NVjCiBPyX7fbTiFv0Y=;
 b=tpPciTNLau1aJAGyENCX7kohVzX+g4F5daYF/w/6YA6s4gRgaUfNWb+yK4PK/ZnoygxjAC97Xpl5MCWgTOF95rDENsFGTVHDGSPcgpFkogi5gwAh7ibaUX8cKHgGsao0wqmPuubZHhb8gMPsbvbUrQE77FUEB5aRshcOC3wTjUX7PfDaSsrg24illlN1LQoic0UJG5ofTs27tNILkWpmvvXkizUfaPCGHATi6/7ns6pYB+QJZ2WiGyZYiymLSGHPb5aU07K9Ual4Z7Oum86fjhJwwK0M3TPn5TFVcggboFhzmzS3z/2CQ2qDV7t5FzHqegrf2M9eol58W5B2Y+sGxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T5AblgMIgfJT36bKWhO2j6nN3NVjCiBPyX7fbTiFv0Y=;
 b=E9xbOgenYq0Hw4Nt+ojxrljRnsK/mB0WI28qqV7cXVxOoVmqh3S6DPREXWMDo37Cpg/yEtAwPZINy11hV4rlpXId/ZTfaO/mr2jbiuzvR2XNORL1iMCmqx7JVxfpL/ZtlO8BtpzVOWQvoWinCGL7c8/dbJyocasNA5zKN/brxYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GVXPR04MB9804.eurprd04.prod.outlook.com (2603:10a6:150:114::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Mon, 16 Jun
 2025 09:14:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Mon, 16 Jun 2025
 09:14:03 +0000
Message-ID: <b0be71ba-e2e0-4a6d-94ba-72d54959c929@cherry.de>
Date: Mon, 16 Jun 2025 11:14:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
To: Andrew Lunn <andrew@lunn.ch>
Cc: Jakob Unterwurzacher <jakobunt@gmail.com>, foss+kernel@0leil.net,
 conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, robh@kernel.org,
 Kever Yang <kever.yang@rock-chips.com>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
 <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
 <380ba32b-bb9a-411e-8006-127461cac08a@cherry.de>
 <3303d8d4-ec5a-4cdc-8391-ab6e35d76b33@lunn.ch>
 <96d32ce8-394b-4454-8910-a66be2813588@cherry.de>
 <bb3486c6-93df-4453-acc6-deba3c8f7f0e@lunn.ch>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <bb3486c6-93df-4453-acc6-deba3c8f7f0e@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA3P292CA0005.ESPP292.PROD.OUTLOOK.COM
 (2603:10a6:250:2c::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GVXPR04MB9804:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc6e89c-a535-41c1-3adc-08ddacb62321
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUtQSmVhQkZBTlRXU3d0VmN5SGEvc0Z0VjhqeEF4SVBpTVVnZVdrMnh4dm9P?=
 =?utf-8?B?dUFDcTJld1A3eWNRUWVpZFBTVU1sVytsRWNwekVHd3IxaXNNbmM3NDFxUHRY?=
 =?utf-8?B?bnJRWXZBRDhITnQ5TExyYUZUYWJIeVdaVytXSklKcHJaYVc5Sk1rSXlPUHlK?=
 =?utf-8?B?SU5ZMitrWFlWL1dUdUZHeldsRHV3VjNKSmxxS1FLNlZ1d3prWHhKbTVRelNp?=
 =?utf-8?B?NU9mV1JEcmNEZ1N1QWo2TEpWa0JYMDA0M3RCUWVYMEhVOFJaa1FheHNhdVBu?=
 =?utf-8?B?VHh2cEcvTlE1NFUzOXIvRWszVjBZOG41cHh5STRteTl2Y2dRbDNlc0tSdU5r?=
 =?utf-8?B?NmNoa3pTQTN5YWd3TmpCQ0h5aHM2QjBSdlMzUTMrMy9lcXFNZWpNR29BbGEz?=
 =?utf-8?B?TWlBSTlJU1gySmdvU2c1NkF2UnNZQkZ2MUJhbDR6dHZ3S1A5WXpHTHo2MEYw?=
 =?utf-8?B?TXM2ZkY1OHhoVGJ3SnpaUTF4aEVxS0g0eWhuelV5UTB1ZkgxdG95aGV1NFV4?=
 =?utf-8?B?MW1RWnc3Z0I1NDM5ak54NVNoVWpTOWdOYVREckdDcm50N0NmR2dubzV0MFpq?=
 =?utf-8?B?VEFBaTJwNklsY211UCtXUG45QVBIS2FyRHAxc3Rld0NybGs3T3VMNXlFSTRn?=
 =?utf-8?B?VTZOcm4vblpJU2lxVkowL2srRXZwckFTTC9ZdnRUOVlrZnJKSkNaa1hRSWtH?=
 =?utf-8?B?M1JnUURBbHREVzFNRUJnNGdwRnFQY011NkJkUUc5QkYzTzF1YlpON0hvWGpV?=
 =?utf-8?B?NXJjclQ4Q1VqY2VvUWtNK20xc3Z1NWpGR2lCeVVBLzd6V00zWEt4QWorUlBQ?=
 =?utf-8?B?RW1BbTRQMW92RHpTdEkrM1VkQjhXeFhsbjF2Rjc0L0w1bnZMZXhIc3FIcisy?=
 =?utf-8?B?VGxsS01qUVRPMnJaSlFKLzRZOEN1VG5LZy9OYTNJSWo1aWtlT0xwVWptMHhS?=
 =?utf-8?B?ZEo2TU1WMmkyT0MzK0NyeERtY0JiOE1sekZmSEFnQ0VWLzNRWWFWOVl2amFK?=
 =?utf-8?B?aXAyTHFGdngxaUJBcXViZk5Bek93aVUvUlBzOTNqam5CVEhZOXdnSWxJY2Uv?=
 =?utf-8?B?TXkrNlZ1UzhuMGxWOEZjRS9YVk9wUW55YmVmUXUvTUpmQlgwemNZOEdDRi9Y?=
 =?utf-8?B?UFV1SDlKcU9VcG9wU0ZWWGFjSHdQU1dQbldyZHJSQWxrNnhGWE1rU1krY3VO?=
 =?utf-8?B?R2dUdjVuQkN1TVVDa0c4UDJPZjZuVEJ3OFBRN3FmUzlhd0REeEhOMFBXYWVv?=
 =?utf-8?B?bmdmZjdzUHFTaG1xL1lUR0VBV1pVcW5KamdvQUpCckNCck5mb2YyMWI0MGQ2?=
 =?utf-8?B?aGJxLzNBNU8xY2JJWkZTbGwyYkRjeTJnRm15a3AyNkJBWGdYdEFsNkh3ZFhm?=
 =?utf-8?B?QS9kVXJlU0x2M2tpTjYrOHRVYWYrK2x3ZFhSNmc2QkpOM0FFamQzeWpFYWZ0?=
 =?utf-8?B?VTlqY2ZJK2JrRFcvN3B5MldFOE8wbkhydHA3NUFicnFKU0pwc0F1SjRGUXZp?=
 =?utf-8?B?U3pBU3pkNThaOC85NVR6NHRrcHJqS1d3SXFVVVExZ1VpaHg4SkRUTlRQVEEv?=
 =?utf-8?B?clZPK0VLNEdyYStOa0JFSFg3RWdXbmd1TkxVa3RkSUFkU0lvS1RKT0RjZXBk?=
 =?utf-8?B?aTY1NGsxT243UXB0aUtiQzIyY2lpdWpxUFNFakx2K3l3aHhMRWtXNjZrWlJ1?=
 =?utf-8?B?aWtOTFVHelpmbE5vZEgzK0UxemlWeFdzK2wvQ0JaK0o3WGR3T2VRQk16RFRy?=
 =?utf-8?B?bGRVOE1XbnJYNkZ2enhRNi9vcDFnaUlJUnFpVWdxNDVQTWFmdFFKK0s4b1lk?=
 =?utf-8?B?QlptdnVCZS92WHlMMTlmQlFoTlJKVXRnWno2dGhIWUtZcDhrRkIrL0lycDJ5?=
 =?utf-8?B?ZXIyK0gxV2ZxRlNBSTIwR0grb2xHWUl3eFN1cld6a1RLZzRUUmY5MW11YTYv?=
 =?utf-8?Q?lnD34pXE368=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0hzVlIyWkEyVFduSCttejk0YlZReHBQdTFXVm8xRzdFUjI1TUNOdmRqQWQw?=
 =?utf-8?B?R1QvVzR2THpybFJNdHBtTlVYS3hBK3BOY1dDRXVaMTlpVkJlaGN5dVpjRGxL?=
 =?utf-8?B?RlBoRENRR1RIclkzeFdwMVh5Vm5kYis1QmhGTHhXTWpzMEVGck5XTnVaWEJB?=
 =?utf-8?B?R282L0RWNUtaL1JjSkZpK0FRS0RvNGEvUlBVYmVTQkcwVFJRUFZpRWdKTXpk?=
 =?utf-8?B?dURPY0x0czk2akp6TXFGd0hucUd1ZitEQVdhRHdyRjBiTWd3VytCQnh1Q2RB?=
 =?utf-8?B?QXFaV2Y5cGdvRlVHQmRZRHFISjVLdTM1K2Vra0RydGdxZDBvTVJOWUMvVVBa?=
 =?utf-8?B?MWdnNFpDc3RCREtxNHQrTDVrNkF3M3NycGtvQmVDeG9xUVhrcW5tZXViR0g4?=
 =?utf-8?B?NTZ5Y1lBK2JIaXFJSXdFMVRLVVkwWUtMdjc2d1JXdlN1dmlMVDNaenUzR1Bh?=
 =?utf-8?B?eklGWmhCNWYrTmp3U09qSGtZYklSM1NLbDlud05FNnZNd1J3QXJKVEx1NHl5?=
 =?utf-8?B?SERpRTNoWXE2bk1rSmk5V000M0l6bmNBMUZzOW1IUFd2cWo4aE55Nm1STndZ?=
 =?utf-8?B?L21rRTVKUlZWSkdlUmF4dTlKa1g5c0Z1dGJMalBUaC9NREtsR25CNXFGbnNI?=
 =?utf-8?B?ZEphUFZhNHpwNUJtWmpYVWRrUlVhZ1k2emFBWGQzWVZocFNSdHhBc0EzOUJn?=
 =?utf-8?B?LzFJZVVqTWN1ZEZBWDViS0hjdjVPNFpBMEhPWDBuT1hSS0gva0dieFdQN2tP?=
 =?utf-8?B?aVc2WHMzc0NBd0FPdy93d0RHQ0FUZm9MNC9rUDBDSkFGci9CWDhHRnF2ZDRk?=
 =?utf-8?B?ZlV6cWh3TmVFOGhvUVZKZksvNzgxbEY1ZkFSaHJKNDNzQnNtMU9STmxoUnZM?=
 =?utf-8?B?YzNJRjRreThRU2FwUnJKSU4wcXZHblZ0S1hXOThYR01lVVJvYTFVd3ZIbjU2?=
 =?utf-8?B?QVptN1pnVWpsUzBQVnhwL2ZvZGJLY3FFWWhncWNlRkMycTR1L3R1Tk4yYkhu?=
 =?utf-8?B?RWFlaUNXODFGZXFXMVdiV0Q5ajNJMUtZd2llNjBYOW9mVkRtMlAwK2FzdVc3?=
 =?utf-8?B?c2ZRUWFXTzBFMTlXYUFZQ1h4RHY0dUFISEtmS2htOHV3ZDFUWHRQL0Y5K1V3?=
 =?utf-8?B?UE9SZktrR2dITEtyQmVzeFhKVk5jVFFzbm1WYnJpeDcwR3FvSlBlcTc3d3Ux?=
 =?utf-8?B?ZVhiY3k3d2RKTkZSeE9QRDkvT1VPNjFHbmZOdENaUXRnOUpmNTV5MHhhd3Jv?=
 =?utf-8?B?L00xaFFVdWRnOWtkL0lGbmJyVmFQd2k1VGtVbVN6SzQwRkpZNkRDa083bzZO?=
 =?utf-8?B?aE4vUks1YmpudnhwUDdFa1FJNjBZdVFxRU90QmNSbEFjeWI4dTh4Z1BQS2lR?=
 =?utf-8?B?c2JaM05pY0oyUVRiVis3elRsb0tBY2crZVdQUEt3L09IWk1JN21yOE0vNm8y?=
 =?utf-8?B?WDdZK0MwK0xyenEzMG9Pc1h2cnRObEEwMzRIWkRMNDd1UGp2Y0MweWZEZ043?=
 =?utf-8?B?ZlZnZ3B0ZXI2bjBkOXFRWnJtZit1R3RObkUzc1kzeEx2NTdDbDh6WnFCWXM5?=
 =?utf-8?B?U0pXVERwU3BQV0NYV1hUSkhRTk16U25SUS9UV2lHYnNpcFRXM2Y3bm9hb2k1?=
 =?utf-8?B?bER3R0hBR2pTVldlc3BVNzJNWjJCMFNmWWNBcVMrZEUyMDhRS1pSTXhtcHVO?=
 =?utf-8?B?d2pEblMvdTJ0amM5dGg4MW5RUk9hdXhQcWdEV3BGU29VYUVScnpwN2JzUW9I?=
 =?utf-8?B?cVM5bG5helJnRTBOUDQzL2dWdmlia256U1N3SnVON1g3eVR3aUlXK1JJQlB3?=
 =?utf-8?B?ZXduM1VrR2d5clZtMjVRQzFyd0lJVjhIVXZUcVdpKzdLTGs5VXpDeFBEWi8x?=
 =?utf-8?B?bzI5amxoczY2dDFtdjZoUEtXeHIvVFJFeGF6OC9DSFdRd0w0dDJlQWtnWEU2?=
 =?utf-8?B?SFlnRHY3UmRKenBRWDdlWHRJVkUxUTJDend1RFBFTU9jQzc4WkpKa3RhWVVH?=
 =?utf-8?B?QWlELzlES1NDVEFUd2hZQm43TExSOEVWcEc4S3RNaEp0dExCUDdZTzNzSW9Z?=
 =?utf-8?B?Q2NYYS9oRHZtTDY0cGJOQUFtT2d0SUxTNGNDYUtFaGZFNkRIRXJJOHpYM1Vy?=
 =?utf-8?B?a2Z1ZXVrNG43UVBMOXY2TkpYNkJudTNpb2VQWDlIZGlYNmh2bDRESm5GNnlK?=
 =?utf-8?B?ZWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc6e89c-a535-41c1-3adc-08ddacb62321
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 09:14:03.1810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MEXFAlNBM4+vD3fr6kuiu/h8P/2c8SDd4lMkEyHFIw5BQCmAxam+VkyrE7wk4yuINv9fGvNdl9BOtVMsLrjO0BqXlldRLffHIFTP3WufV70=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9804

Hi Andrew,

On 6/15/25 4:53 PM, Andrew Lunn wrote:
> On Fri, Jun 13, 2025 at 04:27:54PM +0200, Quentin Schulz wrote:
>> Hi Andrew,
>>
>> On 5/28/25 3:09 PM, Andrew Lunn wrote:
>>> On Wed, May 28, 2025 at 09:56:51AM +0200, Quentin Schulz wrote:
>>>> Hi Andrew,
>>>>
>>>> On 5/27/25 6:18 PM, Andrew Lunn wrote:
>>>>> On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
[...]
>>>> I'll need to implement reading the delay from the stmmac driver to use this
>>>> property, do I need to restrict reading this property to the SoC we tested
>>>> (RK3588)?
>>>
>>> Yes, please only allow it to be used on RK3588, and any other SoC you
>>> can test and verify its behaviour.
>>
>> Coming back to this topic, I'm unfortunately the bearer of some bad news.
>>
>> I implemented the suggested logic (see at the end of this mail) and then
>> went to validate it with Jakob's help. Unfortunately, it seems that the
>> delay value really isn't stable or reliable.
>>
>> We tested the same adapter with two different main boards (the same product,
>> just two different units). With a value of 0x40 for tx_delay (which should
>> be ~2000ps if we have a 31ps per tx_delay unit as empirically decided), we
>> have one board with 1778ps and one with 1391ps. Following a hunch, we
>> started to stress (or cool) the device (with stress-ng/a fan) and it did
>> slightly change the result too. Changing the CPU operating points (and by
>> extension at least CPU clocks) didn't impact the result though.
> 
> Thanks for taking such a scientific approach to this. Most developers
> try values until it works, and call it done. It is nice to see
> somebody doing some real study.
> 
> Russell quoted the standard, which says the delay needs to be between
> 1ns and 2.6ns, which is quite a wide range. So for a tx_delay value of
> 0x40, nominally 2000ps, your two values are within that range, and so
> conform to the standard.
> 

If there's a source about the 2.6ns being the upper limit, I would 
appreciate a link to it (or the maths leading to this claim) :) My 
understanding is: at least 1.2ns.

Considering that for 125MHz TXC (for 1GbE), the clock period is 8ns and 
that two

>> While this could be observed with tx_delay property too, this property
>> doesn't claim to provide a value in picoseconds that tx-internal-delay-ps
>> would (but at the same time this didn't stop it to be implemented for the
>> DSA switch we have which claims "more than 1.5ns" and nothing more, so maybe
>> that would be acceptable?).
>>
>> I feel uncomfortable contributing this considering the wildly different
>> results across our very small test sample pool of two units and slightly
>> different operating temperature.
> 
> I can understand that. But there is another way to look at this. I am
> making a big jump from just two boards, but it seems to me, tx_delay
> and rx_delay are pointless, if they produce such a wide range of
> values from what should be identical boards. They cannot be used for
> fine tuning because the same value has a 387ps difference, which is
> huge compared to the 31ps step.
> 

I'm making the same conclusion.

I'm not sure though it's a good idea to force the user to implement the 
delay in the PHY only. I can tell you that we have two variants of 
RK3399 Puma, RK3588 Jaguar and RK3588 Tiger with either a KSZ9031 or a 
KSZ9131 PHY. As far as I understood from reading the driver, the delay 
is implemented differently for both PHYs. KSZ9131 adds a DLL-based clock 
skew (4.9.3.1 in datasheet[1]) in the appropriate direction whenever 
phy-mode requires a delay be added by MAC/PHY. KSZ9031 doesn't. Both 
KSZ9031 and KSZ9131 have per-lane skews. If I wanted the delay to be 
added by the PHY in the DT, I basically wouldn't be able to share the DT 
between both variants of our boards as the KSZ9131 would add a 2ns 
delay[2] based on phy-mode but not KSZ9031 where I assume I would need 
to use pad skews instead to add up to 1.9ns (TXC; 1.4ns for RXC) but 
then we would have ~4ns for KSZ9131 which is likely out of spec :/ Today 
it works by "chance" because our phy-mode is rgmii but the delay is 
added by the MAC (due to the long-standing mistake in the Rockchip GMAC 
driver). I have not tested any of the above claims.

[1] 
https://ww1.microchip.com/downloads/aemDocuments/documents/UNG/ProductDocuments/DataSheets/00002841D.pdf
[2] Link [1] at 4.9.3 RGMII TIMING

> It seems to me, rx_delay and tx_delay should be deprecated, set to 0,
> and let the PHY do they delays. If i remember correctly, that is what
> you ended up with for you board?
> 

This is what we ended up doing for our adapter board indeed.

I'm trying to figure out if there's a way to not break stuff by forcing 
the properties to 0 and deprecating the values.

tx_delay is used (by the driver) whenever the delay is added by the PCB 
on TXC (based on phy-mode, which is incorrect). Same for rx_delay but 
for RXC. So if we set phy-mode correctly (as it's being pushed lately 
for Rockchip boards), tx_delay/rx_delay will need to be set to 0 
explicitly whenever the delay is expected to be NOT implemented by the 
PCB (so in addition to the phy-mode saying "delay not added by the PCB").

If the properties are missing in the DT, they are assigned a default 
value. So we cannot simply remove them or expect them gone (we also want 
DT backward compatibility so cannot change the driver behavior :/).

The only way forward that I see is forcing the properties to be 0 in 
device tree and warn if they are non-zero or something. Will trigger a 
bunch of warning/errors on existing Device Trees though. And this will 
not allow us to use two slightly different PHYs for our products without 
having two separate Device Trees.

Cheers,
Quentin
