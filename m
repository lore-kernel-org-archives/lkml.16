Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5031F225A35;
	Wed, 14 May 2025 09:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747214398; cv=fail; b=a1mIqPQl3i80bOgWYvmXPznNPPv8TYi1+t38IFrzNIIljxsSmhCnH0iT0JkA7X7UKXiQcfVr+LP8FF2EoMgLcb5AL0IR52WCHqb8Ok3aHPbPq0VsHaXu6iCeXGp3az81LyFCYWuTjuKLlfZ1YGksyAifGQj858sfw3JsIjRa3kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747214398; c=relaxed/simple;
	bh=BnkcqNptr9IGgVnl1VGIOBuiX+b4JsCT5cSFNL9y+bw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qL8Tr07gbvH4tYcTxgKZ5WyhBEOM74yGROVW8KMPKjHA9i6UvkOvoNU0bYMD5QfE4SPwV/YSp2RVZXKYxgKvDtoKQxJhISqvlR3g4vlsAGLdAD3VoviMbNggpyaT4lp1lNuwMPvHZFXDJ1TIxbFgzdl72MVk0lAtNFcfXXgjo70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=N2Bi08Gs; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="N2Bi08Gs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UuGFAy3KduRJhWRuSRnnJf2TPhr/fz50xYEjvGVbJB8lp0BOc4gxPgSHXriXMLf1hyqoP2h9BtHw650qU1X4fDXeU5VRRFp7FmXynHsD4qpUCPtM/jsGspWCu01leCfwEzO8BBYTNwWQpqBbj3S76MVd6jO1rdi7A6iDg7kWciDB2KTg66Nuaukgvr/60ry1wjmg0WF1+pWzrdGR596oeeIkbRrC0ZcM8PY38JmWGb/lfVtud1d4n5iT86IVv7VctWlHD4aBSWTS5RORNfB3AW/kFlMwe9y+iv2+653LuZH2qXZ9zYGcbSWozQVAoiamw2l9eACrD+FA5Ol/EQwGjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHdAyc7T37crNON7aP7QYhLqQwfhCBf0oqkYLA2PY6c=;
 b=JWPWR8OhqtacCsgViih5lfhDa1fiicnyZwm6Gsx1jNbqplabfMUxL91OyqQE5YK5SHFvz1hnfZogTcHjDtiCED1SK5AArnY1XwBrRdSWSogZn8v6N9ibAtvS9WfkaraFoh5ScXAyOVxokKv7/sDf6Q0RWYmTA+U61BR8EQCivfvzdiaMAWyTNe3210B42INC3ZbP4mQTLL/HjIiOEodkBDP+ZtjqNZQDDzmuDMKP0eOTENDnxSKeBy3Yg5mYP4AxidSO5/YU2IAa3jnfO0Zrg9MkOmjyizpuDjnDDyEJgfC+d2xVEDkCnHnBnhwazHT5Z7xvmqp6xQHHzHMaMGvwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHdAyc7T37crNON7aP7QYhLqQwfhCBf0oqkYLA2PY6c=;
 b=N2Bi08Gs4frfuOz9kdP0xNxNo4D3PZrCToynCWI583AG+170w0o0WvYccwXcfxXlGCoMB7emSvrbI2Ic8x0mWrhT7UxBHmrTE+f3woaMiqw1PIitZ6KKYgFQl5OwU1kDE0vKiFujNiEcdCm/nMYIxDsv8/cn6UYPMXH8W1qi80U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB9PR04MB10010.eurprd04.prod.outlook.com (2603:10a6:10:4ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Wed, 14 May
 2025 09:19:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 09:19:49 +0000
Message-ID: <72f7ad52-a6b4-446b-8c2a-50f030307e31@cherry.de>
Date: Wed, 14 May 2025 11:19:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: rockchip: add px30-cobra base dtsi and
 board variants
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250513150234.2331221-1-heiko@sntech.de>
 <20250513150234.2331221-5-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250513150234.2331221-5-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB9PR04MB10010:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea6d70f-f317-4151-2118-08dd92c879c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NGhUSTZ3WEV3QjQ4cjdVMVNXUXVWODNtbFFoYW9pd05mbVM3WWFSb1JxdER6?=
 =?utf-8?B?bFZQSjM5Q2xINzNybUxQUkZYcUgwZGVJQTFsNFBNdXpJTy91OEFOYmRCRjVw?=
 =?utf-8?B?bk1CcTF6VFo3VG90TWR2ZTZJQktVVGU5blhBMmZYMkhySFowWnU5V29xc2VB?=
 =?utf-8?B?WHByalJzZ0svSk5UUm51dmVneFY3WERuai8rUHVIR1pxaW1BU3c1dW4rdHZD?=
 =?utf-8?B?Y2VsbFlObnhaa0U2SzdiSkZPelJaMXVUWkVPYWFGakROOXhZT0RYM3NZblk2?=
 =?utf-8?B?NTI4Yk42Nkcwd2JaOVlRcFNJZWN1aERleC9mWmVHa2h3MUl3RUhKRGw0QzNx?=
 =?utf-8?B?UldxQjlienU3S2phODlDVFJ5S1czT0hpUkxxdWV0SlRoNk1nKy9Bb2FuMVJi?=
 =?utf-8?B?c1U1MWNXaENxQmJqaXBqaU9kTktOZWlDMlRwSWVqdzVvNUlyN0xzV202T2xw?=
 =?utf-8?B?QXJTd2FGQ2VjcVhSdllYR2JjNm1zeEJOVzAvajF4dkREZkE1aUp3Q21zaUg0?=
 =?utf-8?B?bFRxVHE5WTNweFNyaEZMNy9kU0NnWnhGSFRZajNVME93dHZoYzljNE1ycWZu?=
 =?utf-8?B?OU01aWQ5Q2c5aXVlc0FNQ3QrYUdDVE94b2xxYlk3aUkxaWtxNC8vQkVoNUwx?=
 =?utf-8?B?QzltKzZOUjV1RThuSklNWUtwRDc4d1Zod0JhK2RBbWdnbG96ck9wbmNabmR6?=
 =?utf-8?B?ekxwZUtQejZyWHZzTGkvVmdEdzZGN3NaV0s2ZDJyUkdLN2gwOEdweG4wZjJ0?=
 =?utf-8?B?aG8rcTBOWmJVaVZEY0doZEFhdWdzbFVFemRjWGU4eDhHL3FVU3FSQjZIRnUr?=
 =?utf-8?B?NlhmbDhVNnFvYTRrV0hKanZoUFlObzAxMHRUOE9hakdrVVorT3JmUU9odW5j?=
 =?utf-8?B?cEozaUt0SnIydk8xRUdNZHZJKy9zUnM3VUl2MXFVSXZSdlgrdHpBc1VkcHlK?=
 =?utf-8?B?QVBDVTBIODFpSmdOMWozaXZOV2ZBWkZsSVBQS1B1NU1oNlVPc3lTTFI2Z3ov?=
 =?utf-8?B?ZmtQUFBKZ1Z5UjE0QlVTTE4rNEFDRFFFbU1VdmNhZGJxeWtObVNnM0FvelRM?=
 =?utf-8?B?UEt0MmpsMXFyUG5BdGxvbFNINHJRNit5K0FRWjVFQXF4Tkl3NlRoRjBUWi9P?=
 =?utf-8?B?elZtbGFSWUpNbW9kbXJxR3lteXVVSEJMWllvWDBEN285Y0FwMndiQ0s4a0VV?=
 =?utf-8?B?T0U2c0dBNS9RWUV0Q1lxQ09XbzNLMU9DNFB5UzFEdEhOb1dqQUhRbldnUDB1?=
 =?utf-8?B?UUord0hHbnkxNmdOclhJZk5hK2wwNDdVTnVkTUhDMGVDTlFBVnR0YTNRS0Yr?=
 =?utf-8?B?QkFrUFQ4ZFR2clRUblVabmdlVXBBSFlUVUY1MnI0OSszaWZGM3BFV2JWczdU?=
 =?utf-8?B?RmpuTDk4VXptaEVXSGxvY0J3VVlFSDA2ZENVNnVSbmNqTFNZK2lOclFGU05J?=
 =?utf-8?B?UnVzcERyZWVJL1VaVy9Bc2doc1ZkaVZmQVNIS1Z2VWx1cExLL2JQcHp5eTk0?=
 =?utf-8?B?L1FYMkNrU2FGT21YWnhoK3FSMVN4SG0zR2QwdU5KUk55b2NjOVphVGhOMUpl?=
 =?utf-8?B?aFRZTEtZaW5tTEdtZEVBbHpVeVJvMGkrUitycm1TVFBZaVY3K1V2UGFCT3Ax?=
 =?utf-8?B?aTIrb0lmYkRnbkJTUlNuQjExTGtTbkRjOGc0Y2Q3WWMxME9mTzd4NWMwc3kw?=
 =?utf-8?B?bnNmbVJBWW5ZSWdHUzYzd1JlY0dyZ3phU3hxK0ZFQytCL2VWZXFkc2VBUXkv?=
 =?utf-8?B?Y0NOT1hjRWNodDQ0M0N3T1pKeDYzZStZNFkzS29zSHpvQ2YxUDVsVXpGdVZE?=
 =?utf-8?B?NVV2bEdpQldibUcrVHhOMnY3M2FuTEt3Sk1maHJvaHVreXRVZTVZc2F5akNO?=
 =?utf-8?B?RmE5SUVnZHltQ2NQcjh4YXY2UmQxcjBlc2NtVVVvdWptVEM5ZzN6dmlFUUxm?=
 =?utf-8?Q?ob8b0KuSkmU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ckVyMXdzL0lGVWJMWE9OeW9nSG9LOHNjazJPd0prbUZpTG1LTGY5VDRzNk1v?=
 =?utf-8?B?NENxakxpcnBxS1ZCb3VhNXpPMVlVWTRqKy9xVCtlREZmVFcvNWxwVmFnNGh4?=
 =?utf-8?B?bElzbUJxTXdYTjNhMVVlMTFBNnRrVmU2Sk5weDRmdUg2YkdkUW9kYi9pL2Rp?=
 =?utf-8?B?VGZVMWsyUTQ1SUNiWEZNT1NWaXRvOTVMZ2JWZG9VK2ZMR29tNlR2MmhNVHcy?=
 =?utf-8?B?NlV0RCtBWVhZeDF4aTNaRGxtTEhQb0hKUEwrQWsrbi8zUFF3QkhxemMvUHhW?=
 =?utf-8?B?OTdLVkplUXNTMWppSWFSeThVWStEUzlaeHRtLytpd2FGMGNtaG8xem1vMEgr?=
 =?utf-8?B?bGpuTzBQNnU3ak1YUzE5bmloZko1VjJJMHpmdmNhZVcveFZtVFJDemFmRXhu?=
 =?utf-8?B?TFZiOWlnZWRsOS9TV3BYS0xTSVVlQXp6NUx2dFR5QVRjY3pwTnh4d2lKYW9z?=
 =?utf-8?B?dEYxTzlWRjliL3hDTFBIa2hMM1NDdVd1RWdxNUk5ejVnd2daL1RndnIrUXpF?=
 =?utf-8?B?ZHhxR3dCOTlzeVpOanAxdFh4SGx1UjVYSHpFdnhOdjg0ai94cUUxUS9qdE5B?=
 =?utf-8?B?Y1RiNHlIZ3FyN2RpK2pWOEFIeDJQSkg1dTNIaUJtd1FlN3Q4VmRYNWJCdjln?=
 =?utf-8?B?dUVYR2NxN1ltSWlicmZtWTZqOXhDeTVlK0k5Ukx1UWZvU0xvU2lrT1Z3VXM0?=
 =?utf-8?B?MnBuMnhucklhVDgvSldVQTB5dHQyN09ZblpnN3FVeVJ5Q3pTVWo4bk11dXUr?=
 =?utf-8?B?Uk01WU1NNFdTMzlGT243djNMZnpDY1FlM2lhMEZZOGJTbGRRZmJ3T28yN3g4?=
 =?utf-8?B?RUQ5SmN5N2Fpbm52ZUsrVnE0Z0thcG9yell4Q1lZUXFIaGdJSGp6V0J1Y2tK?=
 =?utf-8?B?c24rMi8zWEZFOGVUZlN0R2IxTXNSZ0JUQkhFOGxPcmpwTWgvOHBrektNN2tw?=
 =?utf-8?B?TTcrOFBQWlh2MHVtd2hmVHBkS1ZpdFhIdWdvMC9xUmg4N0RXMUxKREluZnd2?=
 =?utf-8?B?MFJXTjMxdUNJTnNMSUJzbHE0aEVCNFVvU3BLOVN5Ty9DSDYyRWxvWlkvdTZw?=
 =?utf-8?B?V3dJNS9sQzFxaDNVeXo5RW0xS08rRytzcW90ZSt4VktsM2ZrMEEvVG1QWXFz?=
 =?utf-8?B?SHl3VVlvR0tzOGFKbmxHQjdETm50QlRRNWlUK2ttUE5KeTFYSG00U3U5SHFv?=
 =?utf-8?B?OTdpNHM5ODVrOXV5d2hodVNLdDEzVXpJak94TXI0b2hzR1JJQ05yNXNramc2?=
 =?utf-8?B?VE9DNEdGOWtYc1Byc3hTZW0xOXIyKy9QOFVDTlhiTEhsNWJjTG85RldJN0ZX?=
 =?utf-8?B?NGt1WmVtTExCSStYdU5GQlFtQlBHdnlYMzNtQ08zSU9zRk42YzhSMGZXeEZ1?=
 =?utf-8?B?dGl1d082OTVaWDhGd2pXMEYxZ1kzZmJTMmlMbENOb3dTeHNvZW02ODRWczUx?=
 =?utf-8?B?ZzNLSm1WMks5emdxT0Q0OXYrNHc1WGYwZzltMXZjcFV3REx1dHRZaXNTaEdp?=
 =?utf-8?B?M2xtcGFMSXhBTjFlOXBOd1krNmRuVitVb0xhMWpTV0F2THBKT3pRRHk1b0Y0?=
 =?utf-8?B?MGFFNW1aMVRTT1VEbGhuSytIWlprakNtS1lETE9rMHZ3YWxHdU9KN1hQWm5U?=
 =?utf-8?B?ZU9JcXFNL1pIMUhhTGpGZ0FBTDBUSEpRYnk5TmdFSDZTcC9hb3pFc1BkVlRE?=
 =?utf-8?B?QXR0K3RBNHdFN3RicFFiU2pNd2xBdGpySlJ1amRmM2RZaEZ4VFp2OXIzeE9B?=
 =?utf-8?B?K0NUS1I5T1NjaWkxbHh5YjMydnJIemZiSmJQT3lzN1V0alRzeStjQThPL2cr?=
 =?utf-8?B?UWRkMzZhMjFpTytmM3JsblBudFRoamlEeFR4R2krUXJNNSt2V2dYTVVUajd6?=
 =?utf-8?B?QTdEV0ZmZ0VDOTNoQ285ZWxYNVJZenpndzdHTW5CR1Z5MStqOEFZYjEzeUc2?=
 =?utf-8?B?MlJwMkthNjNpTk54bERaV05NejRsRGg5T1VBT0tRU1lQYjEvdmxYSEZpRjFC?=
 =?utf-8?B?N29oTzQxTExiZldVQkxxWWxoc2RoaG0zcHFpbk9XTWV6RkdBd3RZOXd4cE15?=
 =?utf-8?B?M3lzVktiRHgvSDAyMENPWHF4d04vR3pKcUxYU0FxNW5UbnU1ZHdxbC92dTFF?=
 =?utf-8?B?d1BKYkRmYkpsT2JYZkhQY0VtZ0EzSFlNVVhjOWJsTGJleUhZVFNUWnVVNE9h?=
 =?utf-8?B?dFE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea6d70f-f317-4151-2118-08dd92c879c0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 09:19:49.1799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mB5/k+YgAcOoYB8HiB5Xjnr04//+VtUI02Sd/plXmlq8StzUQ3DX5v7LUXzppLwW8LwUhnFUh5cH+YWxiSNvmQITNCfHXRmCabdgrIrAVxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10010

Hi Heiko,

On 5/13/25 5:02 PM, Heiko Stuebner wrote:

[...]

> +	rk809: pmic@20 {
> +		compatible = "rockchip,rk809";
> +		reg = <0x20>;
> +		#clock-cells = <0>;
> +		clock-output-names = "xin32k";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PA7 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		wakeup-source;
> +		system-power-controller;

Please order the properties alphabetically, system-power-controller is 
not where it should be.

[...]

> +	panel {
> +		dsp_rst: dsp-rst {
> +			rockchip,pins =
> +				<0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +

I would actually have a pull down here to hold the display in reset 
until the driver is probed and goes through the reset procedure?

With the two above done:

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
