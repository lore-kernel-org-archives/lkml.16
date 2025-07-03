Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023114.outbound.protection.outlook.com [40.107.44.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB275239562;
	Thu,  3 Jul 2025 03:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751514148; cv=fail; b=I/RiLF22+cHw9Stf+YkGRKgryNC8g0288Jdm34L7l2TZsjF1KO22LIbpt4J/PNWqU1BOADLumz7UG/Fqgi/bXUuZh1JtvG43hW/O9VmWN9BMVeEPSZRp8K9/xC7BQhSZMNaHP7v8dAjWAI+y+0f7VF5mkRiMGTIeFbvsATkOB3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751514148; c=relaxed/simple;
	bh=bk7ntFuhAqLnQQgfd54yt3pn87d3+WpLaIifGlXpLI4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LRt05lA4cwOy0ha2ASP7iW5CzWrMNJ927pqS1Ti7Teke3+qd6SD9LeE4zmOBwANSwDO6a+ji7QuYR5Y2uQTEDiAgL+yhfTL85wSq0BFmlPXs6CdTG98oxHBWktgIYVNXaEvtG0mWPb/gycENGOChPSD1lKZq8WzSHtjXdtoPXnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=zew83Azn; arc=fail smtp.client-ip=40.107.44.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="zew83Azn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRd0RZhvA+qEwR1VYI2098rBXjmvi/vG7Jxplr/Czaz2QOY/qGqHGcrgF9FLYVOaW0BUKXnTy3+HCsTg742OKkqWYJlnB69PxkkcAn4DC2qIXVr1J48O0HdIVlFQI/XcjIAkcKWV8jt3i+kXal+e3+XKXdL5QGOzeU0sZzhvjWyA19CqZ2292H/lDTyFLkmErsgIpKpRH+nGF1MwbjAKuxbP9Abv0hN3b7te+SCp4upZBiHZ7G4/Sy3pk2YZmVipRvXfJGETTvCJik6v5ljHg5/pWQybnUpvLYySfU9SugpG9rWPnmLve1D3qcHviAPmDsBuaUdA1ogekd/uSneHPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sByetnw4LR2FTA52xGZ97GxS+efL9v9o3UY2MDL0Bcw=;
 b=FQ5ovR+PACCGiNkN/4OZhMiK+H8Z9NuY34Mvd4L7KUAXOEXq9p3vZvKcio6pxbgU4mLIaxvgYM8oGJnOxv/Y+8Lc/hVz97Z52DH9FuiU5LFDTGhBcIss/3ybh3BZiS7x4V15aB8BZF8ez9CKRWE20uiyUJPWtqUROUaVRTceywLBlHdM8Q0XOCvCWHoQfkpgdGnUgPmfC3dN7k5n0ZBbwLiSNcnp+/lVvjc635IVox/s2NUcFacxY/YsHzswLms5eLrJfOS2SlZ91UdPOlYgycAA4vXC/JHBYSnaUtFvPkygApr6No8Y4zlLUvGssNK5SYGJNw7rGy7ATUt4g2ALIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sByetnw4LR2FTA52xGZ97GxS+efL9v9o3UY2MDL0Bcw=;
 b=zew83AznrACkJZDgQ70T2sJTcL1NFJVZSsfaZrpfhnY9XHVd9HUbJR6buFBezhH1dUmKd7vJTlLm1FCkpDjCm6HpgVgV14Q9M+0+mzUp8u6Uly6FKRqw6IcwB+zDPhY4gwaJBjR382tmMmcPi9Ni6hIJN1FLoPM9qN8QmZVfm0V4u3DL7sNGa7Oy7GUAZtuSwejHkF/5whnoKprDKnqBqtxRYaXEorabdqc+rtarBLwFu9MWnym/dgMrgshi9Ynx4T7NRwza2PHq9F9nQOghU6FTABMWWx2ISShYSieII6JiiXcknjMFlMIidhUyYlPrv2ILHWb7yak5Z8AdUZgzGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com (2603:1096:820:ca::7)
 by TYZPR03MB8338.apcprd03.prod.outlook.com (2603:1096:405:24::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 03:42:22 +0000
Received: from KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf]) by KL1PR03MB7149.apcprd03.prod.outlook.com
 ([fe80::a311:33f6:519d:73bf%3]) with mapi id 15.20.8880.027; Thu, 3 Jul 2025
 03:42:21 +0000
Message-ID: <bd68352f-7f8c-4cbc-9f4f-f83645cc1f70@amlogic.com>
Date: Thu, 3 Jul 2025 11:42:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] clk: meson: t7: add support for the T7 SoC PLL
 clock
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
 <20250509074825.1933254-5-jian.hu@amlogic.com>
 <1jtt5ny6gq.fsf@starbuckisacylon.baylibre.com>
 <4dd25114-212d-44d6-938a-63871750c292@amlogic.com>
 <1jh60fd52u.fsf@starbuckisacylon.baylibre.com>
 <22a24fe6-9e62-4aba-825e-aee214f683ee@amlogic.com>
 <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
From: Jian Hu <jian.hu@amlogic.com>
In-Reply-To: <1j7c10jmbp.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To KL1PR03MB7149.apcprd03.prod.outlook.com
 (2603:1096:820:ca::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7149:EE_|TYZPR03MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e308440-9f06-405f-d560-08ddb9e39ddd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVZPYUhoeTJwRVFQUUVaWklzZXY1UjFFWVNFLy9rU0FSQ3YrNFZLaE10TXB4?=
 =?utf-8?B?ZW5KbkpxRTJYeWJNWEVtWmRuNWVzdFZ6aEV2Y240UXYwdC80cjRVUUg2ZUFG?=
 =?utf-8?B?eU9FL2FDV3dLem9YeDQ1UENLbGkwaGd4TzVUenBMeEdmOEhuWU4rT0N4ZVlW?=
 =?utf-8?B?Sk9EZ2RwZ0Mwb0xiRTdaUUVhZS9wMGxST1A2Z3g5VEVwM1dzU3krb2NOMUc4?=
 =?utf-8?B?WFU4emFPZEY4N1hCM3A5eVZUZnpZak5yVVZ3K1A2WDdMUnRSUGgwRWRSdVBK?=
 =?utf-8?B?cDBYZ0xCTXdXRCt5TjBRaDdMQXVvczA4L1E5KzM4aFJ3aTNwTnlwK3VCM3hQ?=
 =?utf-8?B?WGp2eWpvSmo1WDk2TzZkRjBTODlYQVVlVlNkSVFsTHAwZnZZRVJHS2VpcVJt?=
 =?utf-8?B?MXAwblNrc2dHMHJ6eTZNOHBCcytEdkZmVSt0STFZc3Facmx3dmxkdHRtUVlH?=
 =?utf-8?B?amdadDdTczBvWEZhd09sUGp5VXNDZU5GRHMxYU1RSUNtZWpHN3JjLzJtUWxB?=
 =?utf-8?B?SjBBb1Y4VklXMURwQVFMNTBRYmw0bmpaVmdFSG5ZV2hQWXg0MG0zb2c0TGJr?=
 =?utf-8?B?NkFPT01FVm40NUVhUlIwZDYvVEdTK21TUjlrOVBtL0FXOVdpUVFTN0RrcXA4?=
 =?utf-8?B?cHV3NVNXbW43ZFphUnB3UGo5YkxTMHR1eHZMeFdVSVNBYkpuOUJLWGNPZkEv?=
 =?utf-8?B?OWRxRXdsQ3BjSUkreXE1VWh6SlVXQzRUMExpcGR0VERnNFdFRjdJYnQvQlZU?=
 =?utf-8?B?QzRhd3RFbDZTUEYvTERmeEhYNHVIVnkvZnpQQldBSytFRGRuVFNFcFlRbmho?=
 =?utf-8?B?aW9Va1lUNXBOSTQvQU9TaDFLNFh4V0ZjSVVDLytnanBRMVBhSzhyTG4vYUdo?=
 =?utf-8?B?eUQxeEFJekFRQkNnU1ZRTjQxanNjMGUyK3Q3SmF3dm9JSnZPaHhxbDhKSVR0?=
 =?utf-8?B?elh5SFN1R2pmaFhyWEZWeEZaL0dhZFdvMmluV2NYWmNtamJuQUdKRFM4dk9K?=
 =?utf-8?B?RloyenZVazlNNjlSR3dvaitsOTZIYmZtOWVuVHRreHZlaWYxZjRxeXRhOTRG?=
 =?utf-8?B?Tlo5V1dJd3lnbEhhMzJORlBHLzBLZlN4ZTZkVUU5eXBMWUQ3VTIrOTFHUVMr?=
 =?utf-8?B?bXRKM0g4Vi9VN3RVdk5mMDJrVFcyanJDc2xvbVBaN1RDbzVla01scExGYU50?=
 =?utf-8?B?dkt5Q3pwajQvYXVQUVAxZ1Zldm0xd29FNXVWdjAzUU4xMC9GSTMrTU5LMUpj?=
 =?utf-8?B?V0pIZUttdksvbTRQYm1KTGpLZFN3TEEwYTBaVFRsQklaSlRlYUFwbURYRXYx?=
 =?utf-8?B?a0lWaUNtYy9wVTlVb21BYVIzUVdNbU1VY2hnUTg4ZDNoOXJSd0Y0YXVKR3Fi?=
 =?utf-8?B?N1liRE1XOStVVjYyZlZocGJtNmpDYkdxTmpqSkNnNTQzb2E1ZHBjR1NCalhK?=
 =?utf-8?B?TEZvemY2L0R2bUpiTXlUMmhMaTlvZ3FESTFKWkpTVnpQbWZDeDNrdkdnbXdx?=
 =?utf-8?B?VzJCR25BclRUZEM0RlpJSzRYZ0FTY2RBTVBjTmVwamF6Y1JEbEZlV2E3MDR6?=
 =?utf-8?B?T2NNcTlmUTQyQitKeVVDMmJ3amlDRDVQSmFkVHhwczdXcCtWVG4zZE96QVE5?=
 =?utf-8?B?dldwVmlsL1gwaG1zN2RkdWt3N1NWaDRnSzcxSWRoSlM2U2FmUGUveWpCS0FK?=
 =?utf-8?B?MUxoMmJHYS9wd1lreEVwaWFNTnlMZ3NHNWNMZEpvUzNERUhxWUtUeXZGQ21P?=
 =?utf-8?B?ZGVBZ1lJdkJhcHlQNlhTSU9OSGhEU0NXeHhLWVNINkJtaDE5QUZuYXNBeng1?=
 =?utf-8?B?dEYzVnRSblRITUtJUlNPVmU1UVBzUmFvdWtHRko2dTVIUTZjRHE2dW8zWjVt?=
 =?utf-8?B?L1gvNFhoWTZyUlZsQTlLREwrOVNpRUJnWDBEU0lnSlU3SGQ0NlVtTTQ3Qmth?=
 =?utf-8?Q?YsMhmoinQJk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB7149.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVcxdjhHaXN4ZUxtK25mMGo5a0E1NEo1SFpDSHpuSml6aDBxQ01uQzZveXJN?=
 =?utf-8?B?bHo0ZnVZVnBiMmZJeHJlZXh2dkxiVE92Rk1RdlRoS1F3RHR6dXRWblJvMEVi?=
 =?utf-8?B?ZzFBWndUMVFUTGVDb0RISlo2dkpKYTEzZ0RGUllYdk1MUGVLTFZ5M2VqMlll?=
 =?utf-8?B?Wm1OR2EvNjZESm5ocHF1bnB5NDM0Z01UbGVQbTlYYitISUtrWlk2Zm1kdm1E?=
 =?utf-8?B?eUs2U2FTWTcxam5jWTJjWjEzL0ljdS8vaW9aY3pNc0gxUHptcXY4Uk5YV1hi?=
 =?utf-8?B?YjZRdVZDQlNzWHQrTEpLcWFWQm1WSGJ3M0piTm9vVTVxVjlvS3NtYjVraXlI?=
 =?utf-8?B?dFRhcFlCUDhuWFMya2gyL3VrT2RMM3RCTTB3Qk1BOCtneEFvWnR5M1J1cjBD?=
 =?utf-8?B?UnpFbTBKbXpUVzJ4YU8vbWpjM0V2WC9nWlNMcWEzenVzRFNLNnFMb2hDTWIr?=
 =?utf-8?B?VGtjTzk5bFA0Q05tb1NObmtkRXBqTFpCUnJDemdkZnNZYmZnYUlNS1hlbW12?=
 =?utf-8?B?dzhMckprUmlTMGdVendLTm1EaHdsL0Y3Y2d5YzF5OGIxSGo5eUI0ejIremZP?=
 =?utf-8?B?WGJieG1rUzNXdUdBZlV0aVNvVFFOUmVFaG55eDZuRVRJM21kdSs4cngrQ2RK?=
 =?utf-8?B?ZkdKUjBKSFcvcWVkQytaSmVlQm11RUNsTkJMa0lnZ3h3dm40WVI3dHQzbzdo?=
 =?utf-8?B?RjJLMnBSbXhqcFBXaTFxQnIyWnV5Zmxyb2Z5NndZRzZzWVRvTkdxVC9JTGxB?=
 =?utf-8?B?WlNlc25kOGZzRnM3Qm1HZVJlYW1EMTJwZmJyelFEU0FRaDhQeXZ5Z1QyRUd0?=
 =?utf-8?B?MW5IMmlJWXVxU2RhYVRncDZjVlNMMVN2R1VLa3lFay91S3pCUEx3amhrM2J3?=
 =?utf-8?B?SjkwQkJCYWlTTU9rMWFuNjZia2w5WFk0R0FaRGY5NUE3N2xMSGRPUk5Qcnln?=
 =?utf-8?B?ZDZVT0pYMWlRUzN6UFNhS0hNeGxQRU9UZGdWNWNmL25WWHhYZjNzVGFPN013?=
 =?utf-8?B?anFyY1UwWmdGVXREZjhZd3V3MzdRQ2Fvc3hwSk0zK05sUlFNU2NSYnpXY0to?=
 =?utf-8?B?Q1FTVlVmdjdzak4xSjZTbjAvYmVhUXNGSlBYVGdkcXBzaVZDek9Sd0FqVTk4?=
 =?utf-8?B?bFpPVVBENENxeWNsNlhrTDZwS29aZWNWSTllUWI3Z3ZkNzA3eFFBYUpGZUZT?=
 =?utf-8?B?NHBvRnZMQlMxZXRjUTVtdDFYZ2N0N0xIOVVEY2NWbGVzcm04dXQveU8vYzVD?=
 =?utf-8?B?b081Nk9sMVU1WFlFT2k3SElsVXQ5N0lWZjltT0wrWEFxZ0hxejlRY0JYUnBV?=
 =?utf-8?B?WmJGSjB5aGtpbndnTXM4UlBGU3EvaldJaUxobGsyOWpiaHVrd2V2cnQvcE9X?=
 =?utf-8?B?b2tpM2g3M0JxT054OExueG9qWHR4eUo2NENZQ2FoZ2Z2aEdaSTk0RHV5elNW?=
 =?utf-8?B?MVVIb04rTmFsc2cyMXlxaDkvNlRhNHJZamRxWlNMaTdrcmRBbURvT3BEbkZs?=
 =?utf-8?B?TjZxNmdNWDhoV3BIaTdmbEwrMGtLVkdkeGVKb08yaUNWVktUSkJ3b2JGTnAr?=
 =?utf-8?B?TDBZT01NRG9qRjBicjNKcmxWVndhVFFwUTFBa3o3ZlUzRW5TTUxaUXZma1I2?=
 =?utf-8?B?dEZmOXR3MnY5Ry93ZXNqeTdmM3JuNkk3N3orZ3dnMVo1QmJFVUdhbHRwQTlE?=
 =?utf-8?B?UXk0OVREWGVUWWJuWDlDV2tsYVhaQkhnVHNJMlFzeWFVZldTcVdUZThnUVdD?=
 =?utf-8?B?cVpnZ0Q0alphRGlMODJzZ0JYcTltbGk3bjQrWnFHUUROVVlWenkydGZ4cnE5?=
 =?utf-8?B?b1daVTFOcGE1TCt0SURwY0VwNm9GR3dMNGtkK3lPaWZmT0h2OTRtZVFQUXRh?=
 =?utf-8?B?RjE0MC9FenNTZXF1V2FFL0E2V1lOdEttdE5VUTd2bGUwQXF2c3hBa1JIMHFY?=
 =?utf-8?B?TG43VGV6ZnhkR2lWOUUwTkI4WUhSbjV4UncvN3VSNkh1K1Q4WW8zQ0ZOdTBj?=
 =?utf-8?B?TCt5U3FBcTU5R0VVaWtEeDVXVG5LcGJhTTRrQXMzYWR4OWIzVFhteGpnN2c5?=
 =?utf-8?B?N2g2NEdFaXpycnVsS2trRDNRZnNUbmF2a0VyV3FJTkdUU1E5RjZHSEF5Wm5J?=
 =?utf-8?Q?noXtW1PknT7HW1zPkAoscNzJ6?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e308440-9f06-405f-d560-08ddb9e39ddd
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7149.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 03:42:21.5477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vlHG1NaggJauRNULGJQUYW4ztKRXKdXmd6Bg7QLRflteI9MfRaLzkQBTZBk7yZ711RgjQWfiO3VW7VoDHFRvEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB8338


On 2025/6/25 15:46, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Wed 25 Jun 2025 at 10:52, Jian Hu <jian.hu@amlogic.com> wrote:
>
>> On 2025/6/17 0:27, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu 12 Jun 2025 at 21:02, Jian Hu <jian.hu@amlogic.com> wrote:
>>>
>>>>>> +
>>>>>> +static struct clk_regmap t7_pcie_pll_od = {
>>>>>> +     .data = &(struct clk_regmap_div_data){
>>>>>> +             .offset = ANACTRL_PCIEPLL_CTRL0,
>>>>>> +             .shift = 16,
>>>>>> +             .width = 5,
>>>>>> +             .flags = CLK_DIVIDER_ONE_BASED |
>>>>>> +                      CLK_DIVIDER_ALLOW_ZERO,
>>>>> What's the behaviour of the divider on zero then ?
>>>> If there is no CLK_DIVDER_ALLOW_ZERO, there is a warning when registering
>>>> t7_pcie_pll_od.
>>>>
>>>> like this:
>>>>
>>>>     ------------[ cut here ]------------
>>>>     WARNING: CPU: 1 PID: 1 at drivers/clk/clk-divider.c:140
>>>> divider_recalc_rate+0xfc/0x100
>>>>     pcie_pll_od: Zero divisor and CLK_DIVIDER_ALLOW_ZERO not set
>>>>     Modules linked in:
>>>>    CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>>>> 5.4.283-09976-ga803e94eed88-dirty #91
>>>>     Hardware name: tm2_t962e2_ab311 (DT)
>>>>    Call trace:
>>>>     [ffffffc020003750+  64][<ffffffc0100e3e3c>] dump_backtrace+0x0/0x1e4
>>>>     [ffffffc020003790+  32][<ffffffc0100e4044>] show_stack+0x24/0x34
>>>>     [ffffffc0200037b0+  96][<ffffffc01130a2e8>] dump_stack+0xbc/0x108
>>>>    [ffffffc020003810+ 144][<ffffffc01010c484>] __warn+0xf4/0x1b8
>>>>     [ffffffc0200038a0+  64][<ffffffc01010c5f4>] warn_slowpath_fmt+0xac/0xc8
>>>>    [ffffffc0200038e0+  64][<ffffffc01061d364>] divider_recalc_rate+0xfc/0x100
>>>>    [ffffffc020003920+  80][<ffffffc010624e84>]
>>>> clk_regmap_div_recalc_rate+0x74/0x88
>>>>     [ffffffc020003970+  96][<ffffffc010616a54>] __clk_register+0x62c/0xb78
>>>>
>>>> so add it to avoid the warning.
>>> That does not really answer my question
>>
>> Sorry, I did not get you before.
>>
>> I have set OD to 0.  And measure pcie frequency,  It is 37.5Mhz.
>>
>> 4800Mhz/2/32/2=37.5Mhz, and the OD equal zero means divided by 32 in fact.
>>
> CLK_DIVIDER_MAX_AT_ZERO maybe ?


You are right, CLK_DIVIDER_MAX_AT_ZERO makes sense here.


its width is 5, and the divisor is 2^5 = 32.


I will add CLK_DIVIDER_MAX_AT_ZERO  and remove CLK_DIVIDER_ALLOW_ZERO in 
the next version.

>> Here is the test result:
>>
>> devm 0xfe008140 32
>>
>> 0xD40C04C8
>>
>> cat /sys/kernel/debug/meson-clk-msr/measure_summary | grep pcie
>>
>> [16] pcie_clk_inp      37500000  +/1 3125HZ
>>
>>
>> the OD divider is N crossover. it is one based.
>>
>> and It's possible to go from 1 to 31 crossovers.
> --
> Jerome
