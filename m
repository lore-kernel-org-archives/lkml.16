Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010014.outbound.protection.outlook.com [52.103.67.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D828F7D;
	Mon, 10 Feb 2025 01:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739149677; cv=fail; b=h87ADmZ6bQa9zMU/f2htaJCzntlcMC9Ddxd6kiC4UF9p+UyhCkBNTr75RSSIXYBfnAkSdMmbSuPTeHTWSnpZi9DhfRSeLRxNJB0fqH0UiTs+qiMyDN9v+9aagJWoPPgniV1unn8dkZ6aKURtk/Cl+OfSwbsVU1Roe2gO/x9eWMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739149677; c=relaxed/simple;
	bh=gnQ0N1a479JuJ5V4pNoQL1TfPExfeY15G8WOYG0bIus=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ncOCTSlw+/15BsB6intoCP8JmUCHtB2FkrOaEtLd3F5jGoafVrQKHd8Npzo9JXpFx8BjuY/0PJWM+mMIFRMk/BEZgZmhyXmuc2CEDY9jvUF6JAC16L+d0D39rmZzN6z6JasHCDXPYaQbOAAC8GUJyrEALnda5gHJsb2BdzRwk/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=QTkGdEe1; arc=fail smtp.client-ip=52.103.67.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="QTkGdEe1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DJZ7bjpIa6AaGTFqM/NXbjQJ4uEeW2IrigWO+VFxuoTrpwuvKVPbyllZ1uoEztO2jjSoIlDKlFbzu+3ycLmNFl9GVqVpxeptr4iArT0nzKZdjHd0R21aHio+AhB0D7XIUAeage8070zF4Pa3bZxOxVpxYwluRmXc4Z7OCdGLxF/6dLUxpoXyBkGNr2KcQfUHxh9uXDDlynLeocL4s1BiwrBmX/QYEKP5VRY3cqXDo58GICnaaLP3gBwoUs4HJ7B21hpj3vFW8SEPjcVrGzKHoYyWBc5r8aevdi/Cu4a+WW3aPoyLMu78jFFzK/LTJb74zuDtPsO255s1Onxqzb5c5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVTPEH2psno42gw4xXwLKQkjxWvOMF87txcG9fao5xA=;
 b=KB+bBQjcllBweTkG96XfdXoOokl1tcc1W11kVQ1F7eY77tvhqpmaXuB0/6IXLYHXXuiJV8nDZVs4Myja0zufuAb427PuaUFZ5NTac41by+BN5Y/v5hzftI6rHuwMv1RhXjN/8E3PoBNO8xdLAgWhSrgvulPtbMst3N3kOSLdt/k6VAGxgBuukApkxi7DELjcE/G8C2czpYoib3c4OcyQAhQG5pqdj7Gn1B1clQ6hubIftqaG2WHfWOTONELAOhsPeQtNte+C/6zcuZ/XPNIFdzDOchhsfUoHMkXJh8SHDS21YR5+cUBsklg2U/r+rGSbnNmpT8qHtkQjJAbe0c2yag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVTPEH2psno42gw4xXwLKQkjxWvOMF87txcG9fao5xA=;
 b=QTkGdEe1u0RbYVH2OVjI1ynPcep83lJFpeZH8t3m58Aa+zIFD4F30xLpZKbf5CguFyb8Yxh8rrPO8wRR72maCFtDJk88Ufrucg72zdnMLYe29pNSBq5ntdgtOjCuJT5Ju6VdwjXZG+LzwqBs6b+7e/5PTtVX0oOZQqUMV3ENkUTDEKfV96OfrujHeFk7taZ3Ay7HH13uwD8M8DH0IlaYEJnEVgkfOt2TIwESSupx9oT+SaheNzrp18j8c0EXcSLKnH97GQWTHu/rKE5t4TLFgttUG/EdIunwkUbSSTUT1bILsmUwFCDNDs+lioUkgfFAJf2UUEhbRZsJV0A42kxV/A==
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3a::19)
 by PN3PR01MB6149.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:88::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Mon, 10 Feb
 2025 01:07:48 +0000
Received: from BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71]) by BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2148:4778:79a3:ba71%7]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 01:07:47 +0000
Message-ID:
 <BMXPR01MB24405F6AD115D27D42EDB2ADFEF22@BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Feb 2025 09:07:42 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] riscv: dts: sophgo: add reset configuration for
 Sophgo CV1800 series SoC
To: Inochi Amaoto <inochiama@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Inochi Amaoto <inochiama@outlook.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-5-inochiama@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <20250209122936.2338821-5-inochiama@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:194::17) To BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:3a::19)
X-Microsoft-Original-Message-ID:
 <fa6073fe-533d-4f42-b9c0-44036cc81482@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BMXPR01MB2440:EE_|PN3PR01MB6149:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d4e1c1-6447-4830-9ed9-08dd496f5539
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|5072599009|6090799003|19110799003|15080799006|461199028|8060799006|7092599003|3412199025|440099028|12071999003|21061999003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTRUeEJLNHNOSktDYklkVEJTc0YrTHh4TWdBZm45eCtPVXcvbmsyVWZPN0Fq?=
 =?utf-8?B?QUZ5elEwU2R0SEZJT25OZXhXb2U0WFFXZVFzZHl5eGNVMXZCbk0wMDZMK2hH?=
 =?utf-8?B?TE9KdWlxNktWbEdvZ1NzMzVYYVhTQk0yaEVmdHloVFgxc0xKV05JOW9vWWhs?=
 =?utf-8?B?amc0OW1FdndnUGhYNUlUK1RmbjZ1MWNmUU1EaDJtNTB5TEJZU1kvenJ0VWti?=
 =?utf-8?B?ZTNnbDdCbTRMQUR1MnRXOE5FTitVdnJvL2JKSXlhaktXanFkYy9CSkR6RmtO?=
 =?utf-8?B?cWN1cElHTER5WHB1a2FOOU9XbVlqcFRzcXN0S1ZUb2pDR0k5dzRvT29pdVY0?=
 =?utf-8?B?U0ZDUVZPZWdaSytBNU9XTTMvb3ZkYzg5MGRFdFFuYlYxOTdnd2VFcjVVTWRO?=
 =?utf-8?B?Q21NTUJERXhYVUV5enM5K2lNZ3lXN3Z0MlBscGxsR1J0ZVZXaUJOcWtCbFly?=
 =?utf-8?B?QWhxS3N4YStHcHRtWWxjd2kza2VvVFFoUEFTdWF3dnR4b09zY09ETjNSdGN5?=
 =?utf-8?B?dFk5S2FUaitxZzI2MTJwL1pKUUNnUTN0QmlCejRVdDFwbHVkZDh1eXpacDFl?=
 =?utf-8?B?NENxSnNXc3h0ZktESEVSck9uOWNMKzcrbGpUVms1cXBvd0NSS3lTSmJTanpQ?=
 =?utf-8?B?bVJwVTM5dkNBckhMTXVyV05Va3JpOXZYeWRKdlZZWmtES0tMZ0xKbERNMi95?=
 =?utf-8?B?Y2NHNXZ2cnR2Rmozc05QS2Nrb1JRcjVKMWFtMDZROTZaS01hUmpqUk93bTBh?=
 =?utf-8?B?RVdrUi9VN3NIcXVBbzdLTnk0VU9jYitUSjh5cEE5REZxc3VLbTFkNVBaU0dp?=
 =?utf-8?B?MXNVRzlxWHhxSFltYW9rQnkxeDVsSWhZOEtQb25BcHo1VGtkUWJhWFRDeCtU?=
 =?utf-8?B?d2E5WkpEK1g1bmRPMG9BdE9KZW9jY2NwU2thbmVScm1CZ080c0YxTVN5anll?=
 =?utf-8?B?d25qUW05WHRQcVk2TFhWa28yaVRHOVpmbURjcDJaZTkxSzFtcDM0NmlXYi95?=
 =?utf-8?B?STEzS3RoampwU2ZBMEs4VCthVkVQVjlDaExzRVMxVHJtTDlWUlluZEJab2Fr?=
 =?utf-8?B?Tm5idVJmMHhRYjNsYUJMWGhoeXBlQ0YzWXlTN0VJQThOZjZKK3dVUnp1UlVK?=
 =?utf-8?B?eUZhOEJDc3FucFhSelVTb293U1VXY294S0xMWFhnQjFDZWxhWFZ3dWNteCtx?=
 =?utf-8?B?WHRqaVFFaGp3SVY3NXVqODVENFgxR1pobkFMcEYyTWNTdGxBam40dG03Zm5N?=
 =?utf-8?B?VDcvZmdSbmRhaTJtMXpuNEFaa3pQaFd2bG13U3BTTTNQSWd2TnlQS2dvelNT?=
 =?utf-8?B?VlhaN0ZXWittc09JM2NqY0RiOVNKOVI0TEZZTyttT3kzeDV2bW5DUXdVdnA3?=
 =?utf-8?B?Z2huMmNkWkgwRnlMVkFTTjBhT1UzRnNERlNtOXNmUG9SRWFmT3pPSWdTRHlU?=
 =?utf-8?B?dEhsTm5DeFNSSnVmWldjUHF4UWNESEg2MDdMVHpIbDV2NmZmcTN0ZGlvNHR6?=
 =?utf-8?B?SlkvN0o2Y0xjd0YxVjVSQXl2TG5qZkhUYmlMTFZQVTJkYTZ1bGdNWW9sNkJC?=
 =?utf-8?Q?KUE9zbP6Iw1UCnYCMnlh2KoXU=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1dycUFYeTIyOVl4VHdFeEFpR1VUaVkrWTVXZEhIa1FNSzBQRHlYajF4a3V1?=
 =?utf-8?B?S0J5NlJKMXluL3lMVjZGQTNZTDJ4TTFaaEZ0S01LUHdEV2VheFdJMjZpcXAr?=
 =?utf-8?B?UjBydEtzWEJFZWpwcHVXQTRTcTEvZG9jdzlTNDd0YzlyRjh5ZFpkMzE3UWNW?=
 =?utf-8?B?bTQ5a3FITERmVEkvb1lTTS9neGZnYTFDRisvakNoOUxsTU5tN1VUTzVtMWM4?=
 =?utf-8?B?TWY0NDlMU1EvWUNCcnBpS01xUmZwcXJuTDFocTNONWF5ZXE0OVlqSHJLamxR?=
 =?utf-8?B?cm5IVW82aXljWndNNEhsSFp4emYxVXpyZDk5MWs5WmtQVEl3R01JRkV3a1Zn?=
 =?utf-8?B?OTVSRGVGV0hvZDFaT3pOL0RWNGdWNWxQVFBEMU9QeG9oeTcvQjRZKzlnN1Fm?=
 =?utf-8?B?WFdjQXpocStIYkUvVnA4MnBXZ05PUzBSV3dNOW1xenhONjBRRTNQQ2hVbit5?=
 =?utf-8?B?cUxtVnlESGJTTFAvcXVYV21RMGZ5ZEJhZUVVSlJkWWExQ0xTcHpQMldPdmov?=
 =?utf-8?B?cWNKZUhjNm5DMFBqMmI1TGszcDZtTnJCNjZyclU3d1piWkVvcVZtTkdOV1JR?=
 =?utf-8?B?aUltcXlYekRrQWJpV3dna2xqRjF4VlRiZ1F0aXZpTVFEM3NjQlNjRUNQQkZy?=
 =?utf-8?B?YWdLYmZjRjA1VU1DU3dmZTV6VWFKRzRncFZYUWVuVmcxVVFZT1F2L1o2UVQr?=
 =?utf-8?B?b2wrTlAxZ1htRTdiKzdsM1JIZnBrUVhhN2x1VFN5VHZTK1VHRG5xUHUrNllw?=
 =?utf-8?B?eFVZQ21ucU9Tei9QeVUvcWV4WCtpUHFJQ0hoZTdXMGZwNWgxcHMwUzEvZTZC?=
 =?utf-8?B?WUNKTXdrbUJUY2U4R2MvL0RRWWJDRzRCV1RPcmo3eFR3RTN1WENud3NveXJB?=
 =?utf-8?B?bWN1aGNmRFZZRVJaYWRCZDBiejdGOUVjOEk1ZHhRaExwOUtjd09LbytDSk14?=
 =?utf-8?B?ZmtJUUtCRjhOL09ld1lPYzZUSStLYiswdFBjMzZic3V5YzloMFpMbG5IbDdN?=
 =?utf-8?B?eXMzYXZSS0RXYnBzNGNBRkJiMkE1MjRXTTFHbmdtYnlFZGJPOTJ2cmRLNWRW?=
 =?utf-8?B?c0VaMW5XSUZPNUtJU3VFcXZlaHRlTHJSa1M3U3FreWRSTHg3Mm8rWkJCRGNB?=
 =?utf-8?B?d0JsRXFHU2M2M0dIcElTVFRwRG1lZ0g2bTZsSy9lWVAyN3JtZ0JsYm1uTGJ3?=
 =?utf-8?B?MkN0N2hEZElYOG9KNy9hUWw4S2szenJVYStpcVFUVEtOaitkNUlRcy9taDZ2?=
 =?utf-8?B?dmZMT1cxVHhwQVBXbEpLSDRRaUpTbnlFbGpQTVk4c0pwN3NCUVZQU3FvTlRT?=
 =?utf-8?B?MEVpejdIR1FxMzhZaHJnQldwRGFTY2hKRkczeWhjLzY0aUxZQSsrY1B0cGNM?=
 =?utf-8?B?QU5NR3BDdTQyUVJRcVZidklBKytpbFFFMVplUDBvM0x5MkFUbUgrYU12aUNn?=
 =?utf-8?B?RXkwTXNreW5Galhhb3piWWZLUll3U3R3eTRGNEU0WFMrajU3ek9PQ3VqN3NK?=
 =?utf-8?B?dldTTTVxQ0lVbnBJWTFaYzJUMGdobE11U0l5YkliVy9RV2VldmFCYldpbmU3?=
 =?utf-8?B?bVgyeHUyUVk2aUxWUGR6QmI0cjkrc0k5empSTUd2UnZramtwWnNmejRWWEox?=
 =?utf-8?B?Y3lkVlBlcU5OdjhLeVkwY1R2aFNwcXEvVVdKSEN5UFg5ZVhZd3dKOGQveVVY?=
 =?utf-8?B?NHhLRFhGTmVORFZqam1sSk1XSldXeDBQNnBDOWEwT3JNWHIyKzNDaTVNdjI2?=
 =?utf-8?Q?GFvLeRMcD3aJNCCZmXih4WKTPloEcgrReF2MkT2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d4e1c1-6447-4830-9ed9-08dd496f5539
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB2440.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 01:07:47.8780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6149

I found that the titles of the patches in this patchset are some using 
cv18xx, some using cv1800b, and some using cv1800. Please unify them. 
All in“cv18xx”?

On 2025/2/9 20:29, Inochi Amaoto wrote:
> Add already known reset configuration for existed device.

Please change this description to "Add known reset configurations for 
existing devices."

Regards,

Chen

>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/cv18xx.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> index 9aa28ade73a4..4fadcb8e4359 100644
> --- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
> @@ -170,6 +170,7 @@ i2c0: i2c@4000000 {
>   			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C0>;
>   			clock-names = "ref", "pclk";
>   			interrupts = <49 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_I2C0>;
>   			status = "disabled";
>   		};
>   
> @@ -181,6 +182,7 @@ i2c1: i2c@4010000 {
>   			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C1>;
>   			clock-names = "ref", "pclk";
>   			interrupts = <50 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_I2C1>;
>   			status = "disabled";
>   		};
>   
> @@ -192,6 +194,7 @@ i2c2: i2c@4020000 {
>   			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C2>;
>   			clock-names = "ref", "pclk";
>   			interrupts = <51 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_I2C2>;
>   			status = "disabled";
>   		};
>   
> @@ -203,6 +206,7 @@ i2c3: i2c@4030000 {
>   			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C3>;
>   			clock-names = "ref", "pclk";
>   			interrupts = <52 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_I2C3>;
>   			status = "disabled";
>   		};
>   
> @@ -214,6 +218,7 @@ i2c4: i2c@4040000 {
>   			clocks = <&clk CLK_I2C>, <&clk CLK_APB_I2C4>;
>   			clock-names = "ref", "pclk";
>   			interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_I2C4>;
>   			status = "disabled";
>   		};
>   
> @@ -225,6 +230,7 @@ uart0: serial@4140000 {
>   			clock-names = "baudclk", "apb_pclk";
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> +			resets = <&rst RST_UART0>;
>   			status = "disabled";
>   		};
>   
> @@ -236,6 +242,7 @@ uart1: serial@4150000 {
>   			clock-names = "baudclk", "apb_pclk";
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> +			resets = <&rst RST_UART1>;
>   			status = "disabled";
>   		};
>   
> @@ -247,6 +254,7 @@ uart2: serial@4160000 {
>   			clock-names = "baudclk", "apb_pclk";
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> +			resets = <&rst RST_UART2>;
>   			status = "disabled";
>   		};
>   
> @@ -258,6 +266,7 @@ uart3: serial@4170000 {
>   			clock-names = "baudclk", "apb_pclk";
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> +			resets = <&rst RST_UART3>;
>   			status = "disabled";
>   		};
>   
> @@ -269,6 +278,7 @@ spi0: spi@4180000 {
>   			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI0>;
>   			clock-names = "ssi_clk", "pclk";
>   			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_SPI0>;
>   			status = "disabled";
>   		};
>   
> @@ -280,6 +290,7 @@ spi1: spi@4190000 {
>   			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI1>;
>   			clock-names = "ssi_clk", "pclk";
>   			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_SPI1>;
>   			status = "disabled";
>   		};
>   
> @@ -291,6 +302,7 @@ spi2: spi@41a0000 {
>   			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI2>;
>   			clock-names = "ssi_clk", "pclk";
>   			interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_SPI2>;
>   			status = "disabled";
>   		};
>   
> @@ -302,6 +314,7 @@ spi3: spi@41b0000 {
>   			clocks = <&clk CLK_SPI>, <&clk CLK_APB_SPI3>;
>   			clock-names = "ssi_clk", "pclk";
>   			interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&rst RST_SPI3>;
>   			status = "disabled";
>   		};
>   
> @@ -313,6 +326,7 @@ uart4: serial@41c0000 {
>   			clock-names = "baudclk", "apb_pclk";
>   			reg-shift = <2>;
>   			reg-io-width = <4>;
> +			resets = <&rst RST_UART4>;
>   			status = "disabled";
>   		};
>   
