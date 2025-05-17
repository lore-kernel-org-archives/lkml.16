Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010007.outbound.protection.outlook.com [52.103.67.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE33E3C26;
	Sat, 17 May 2025 03:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747452148; cv=fail; b=E9l7TdDMxvXsixQm6BEnCyikckZQO+3zX0sCP7+BmU+g0fC7Ucm3L43ZLbYRGBBL11BPxN1F588CpKIJuy0K4B2423PiOcg5HqvCTUezelDmMAKyuJUZnnc+2z4gj3natgRFk2IuKO2zqcIKEXOFDWTUgB17N1qZnMlbOglD4RY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747452148; c=relaxed/simple;
	bh=G7JtiJaKDYBz5KAAgQuX1dRW7SrFHcRogxTTSlKFpqg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iHCfRvd9VtTdOjdm/yNqNbs9Gmt1xxkcjxWZnbiyM9gN95MyK2ss9SHwTovWFpwD0O0N771FeRrY2cQ11urnmZktKbx3R12C2mq8c7BJ5wApGb2oSOLmBgPpMlnRRHFKZvIWV0J1BmQ8zp6y/MrO9YSbvoq9xu+L63lBmheeXrM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=WUSzSxqk; arc=fail smtp.client-ip=52.103.67.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="WUSzSxqk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFYy22B1BY87qizRJz5J3L6Zugkt4j4iJe9YY0CGUuCiUOZY8Z2RhWD3rsZ6f3Nq3s7NCG5chOySYEHk3SEOzhqkRpv4aETFDlHqTGGLf5kUjYFphLc87Q8qFBuB/ISnMWllrGFUNIwN5Twsj6vBAnG+ZZVSnxaGOSvR+4E1xW6RIqV3mOSgh4H7eYcTNeRqHy561srOu5i4UD3dyeZtPpTv6W5ZGhA/PCy4BxrMRDKhvJZqwkQ34mUrMMhgd9Vq01Wf9UOuDTeW6Y+OKWOKQ0Jb27JraUiKWrhAW9pZ41YaPiuNUf6QuH2e7F27nPPfR6b9U/nSUafPQw531I04dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Htul95APSt3//phsPfovEMF5inKzYcShUnFm62N2Q2E=;
 b=ygmWTSVIT2JpFwLD0CbspMsX7UE+Fxr0jTEJGF94/Snao5zUFgXK+jA+oAFa7UrxUzl+f/Z9HmotAarhUyPhdArH+w29+EzlC0A7ggkoaxRWFMFqyok0k4APihw+qvTBxPXWVBVReNGmU5kZ0AvckSnrtzxFR8oMs2Li4kDEp2SbREFo9fFaZGYCPO6oLNiM/XyDoJIEiy4F1/KR+AFmUdb3Cr+UH+F3JyAa000UJ8g+TSmPhAxoux7EDTPBxb/7FI0KEnKwkaBhKZiGaa4KbFO8A0t4XCvUngZ3nbQhlFFMIDIYlcieuiA/UONsO3lt5fan1xglicHw3n13q0B7hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Htul95APSt3//phsPfovEMF5inKzYcShUnFm62N2Q2E=;
 b=WUSzSxqkAqsmwIhQvrr6P3FVq+gzSdpxW0sCvEA0n9CbrF7UPgssCtYT9MXf0DtWG7TPzhujaJgJ2zLatKFu9WF6HREwozExUlPJnL4wt6CWzAPo5RBufCa1Ejt82ouhOjesKldX3dWV6WcnZtq+hkMY6hYEciyftnYtiq8QCFhfJMQF3RopzUvtQ1A8wXN8cZbdI1bdV2E8tNLidBFpa+pEYy2kQSwtC/YnEfbvnDT/yu86xTGDEEKabEpTUOS9yjH8oHf/mzvxTCtZ/hZgW+O/PkBaQyCNea8POkgEbs3sWWGXPcuHKyk2TW5AvI+tFNYkAsrvZkdVkWxRrS5PSA==
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:100::6)
 by PN3P287MB0834.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 03:22:19 +0000
Received: from MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4]) by MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 ([fe80::ca81:3600:b1e4:fcf4%5]) with mapi id 15.20.8722.031; Sat, 17 May 2025
 03:22:19 +0000
Message-ID:
 <MA0P287MB2262AB8F3A790B876AA2E989FE92A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Date: Sat, 17 May 2025 11:22:12 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V1.X
 board device tree
To: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Inochi Amaoto <inochiama@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
From: Chen Wang <unicorn_wang@outlook.com>
In-Reply-To: <4f5eaf5285dbeb0de1c8aa4700ca0910273e7674.1747231254.git.rabenda.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:1::32) To MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:100::6)
X-Microsoft-Original-Message-ID:
 <321a7d7b-8198-432d-9f86-049e57c37796@outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2262:EE_|PN3P287MB0834:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7d1e19-998e-41d8-fbbc-08dd94f20781
X-MS-Exchange-SLBlob-MailProps:
	obhAqMD0nT+76ZruCrigLPUIQMEMZUn+hLtixdBrCQRkEBA5SwUHPfOYijHlHsbzblbD6xLCwMjTXcXanSJh/NajhBoiag+cHkeomERQROaw7bRVIMg2GIirqFKDhnNczJrXpvQdMoOtXRvlio2AqISG9B9FmzHlYKYMEF4joZG4FDi1arShUr49sOUyPpgkPp6ApgkSnx0bBaq+zNSmq2ICZC11V6+PrMPw3y7WJ5eVkb3+sw/3B9TKLo5Z4Z8NsNqFSVuhxo79VGgcBNbEJAfOfuutzGAKMbEYIJJydWTOINAlLIVxxxWREXYJz0LQW8CwgCw040Qhwnyfi05RUnuocEpp3PdjpMZius5GMXxOdaBu43wnEoWBqmB41C7mG5Y73W7a7RwN3Hez2f+IA0ILlH7MdVmvCwmI3zAzOuyAomKw8cNpVISBXVn4S+7fwCHDedTGGycvSBgdJJICI5LDMP82vgj0jiYjosyYrJ0YOTPAWRK8T3i9/PeYy+03aT9YCmf/XO7qbR4/qVUHJAaMFz1uCYdcuZMM04BvCaXEhS0mGaTBzbckzZS5zusLNq63uN47BRN0M099ufRfgzEbi0NOGzYHCtJpT1kTB6p7UJxIkRSvCWD/Pjtq/7i61SSM9FP0191ew4/sYUcnCojl0WzKXPd8UOgHASB1N0E8+F3Nh6ArBp9zKlILtBpvss1pBNcWEdJdEnvMcdW+DQ8sNwKIPRQSkMM7FLfT0iMsvt6VfiP5Vy+JfK7BoQR6WnfMSyfGsfb4NsQzO2jM1fFxoiYPxXLhl0Hcacu5jlzIflZehOTF3NdI7VsDSZ5Q
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|41001999006|19110799006|5072599009|7092599006|8060799009|15080799009|6090799003|461199028|10035399007|440099028|3412199025|34005399003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?U0I5dXpTSitwUk9QY1FGZlI5U2lSUkFFUkJiZ21CbGxhcE5xWXNHL3RvUkJ1?=
 =?utf-8?B?d1dUVFVxT012ZFg0OGc0cUZDVittTWFPZk1MdTZsandKangrNlpCN3E3YWtC?=
 =?utf-8?B?RFVQdXJHRjUwUjc2Rnl1c3JBUVJKZkM4a1FieUdSTUE4Tm1nMW0wM3pGTFp3?=
 =?utf-8?B?ZkIrZHlENFVRaDhpdldYck1YSG5hd1JkVHd2Q1VKUW9uRHA1RzhQVXRkK2Ey?=
 =?utf-8?B?TlJrN2htdVpTY3ZUNFdvNjNuK2lKQUpEZG9yWnBDcHdJWXBmMzNlaVE0RTlU?=
 =?utf-8?B?MVB4MHYxVDV2YWNEcDh2cWRadXhUNVNzYWRURStFWGlMUUdMMjNKMnZFSE1q?=
 =?utf-8?B?cFUxM0dQYjZlVkVvR0orWm9qamhCN0FRT3BGWklsL2ZaUk9sVFowRk9xM3ZV?=
 =?utf-8?B?Z3c1VGJRdncrT3FhbU95bDQ2UmdtMWx0UVJJMkxJajFIUlV0K2FtK2ZnR1RD?=
 =?utf-8?B?Q3JWa1JpK3E1TjUwOVpOZWlmalY2VS9SVnd2VW9tbEkzMWcvM2NUQnN1d0lj?=
 =?utf-8?B?ZTE2L3F6OFVSdEl1MGdSdC9LYnNlYzNDUUJIbE9OY0lVclFiQ2FmQXY1NHZt?=
 =?utf-8?B?REtMRUpxY2pXUXJRcWI1VzE4ODFoYTFaa3QrcFh4OHFsUVdvUVI2SnFidTl2?=
 =?utf-8?B?dE1CQzNUS1dFQkZpUGZWRzExWDRtTVEvLzZ4d1FFV09OblYvaDlJOERMR2Zy?=
 =?utf-8?B?ZDJManByc3BTbWI3eFJtTnMwME1kSnZJWDZDVDNmVU5MazdCOThOV2d5ZERa?=
 =?utf-8?B?alZjVnNhWFhmNkU5QkN4d3dUOS9SZ1JkOVY0dlNnaENFRHpzODFwS1gybm9l?=
 =?utf-8?B?NHB0SE9XM0p5SW9VMzdkMWxraTg2VEZBRjIyNE9VcVJyb0dHMWV2c1FJaDF1?=
 =?utf-8?B?Uk9vbFBuUUg3ZTBvNURXNmdUQkwzSUZySjRHbEVPSnJJNGNaNmZlZndWTzRh?=
 =?utf-8?B?c0xWM1R0OExGaERDTks5WnRVYy9oY2FKTitha1hvajdrbUJieHN0Z3ByV2pE?=
 =?utf-8?B?MnIvb2JVQzVSZkc0Z2hBTHFHcEsxR2JDRDVtQ0s2Z1NWaHJXSTc5dnA0VnhV?=
 =?utf-8?B?bEd4RWNYeU1kckYzeU0yVTZFODROMFAyOE83YXNXditRVERJVkJ6dWpmdVRj?=
 =?utf-8?B?MHdGakNFcWtId3R0TjZDVGdYYk9hWUJxM0I1eVRRWkVORENxUEtSaFJPSWI4?=
 =?utf-8?B?ZFlFSzRqNk0yUlNjbDh5U2NyV0w0T2t4d0hBYk1BYXp0SzE0eEIxL3FMc3Jp?=
 =?utf-8?B?V2RBMGtJMmtOeU1XVGdvUXhYRjFqUXNtK3RQMTF2TlUvNTVXMHgxbE1SbEd6?=
 =?utf-8?B?QUR1OW56aXNlVkQwaE1jTTByUktWOTFPRDlTaWlKUWoybVlmSDNJbUZxSjZM?=
 =?utf-8?B?aTZnTHVNUVFJSWNiOHNiQkw3Y2p2SUxJZ2dHN2FjTWZUNGpMR0h6YVczUW91?=
 =?utf-8?B?dExoVWRsM2VINEtzMU1uaXowYVJyblFLNU9MOXJoU1hqZ24vQS9IaFFUK05m?=
 =?utf-8?B?YXVqZkNNTGxrZ1RielIzWEN3T295blRhNkUzdm5GdkFCRCtIRjczK2RnL0NR?=
 =?utf-8?B?aVl6N0hLS2ZTYlFiMjYyVVU5N3hiVFNlV014NDRWeHU5djRqaWRIbUtFTDJ4?=
 =?utf-8?B?aWovb3E4V3VlNU1mc2VKUCsyRWdLdkRUUXhEVDUzajg3Z3BmOElZeG42WVhu?=
 =?utf-8?Q?goMNy1zOALe7ph9Ya1hD?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVlxcm5NNmMrNnBxUDZicnFkcFJ3K3JTK2xBbm5oUVZGSjg0RGRJdWVUZjdG?=
 =?utf-8?B?NjVVSWh2MUJjdGtMbnpQV2xqbnpPRFA3bStaRjZsckVEdnQweGdhbDlrVFNP?=
 =?utf-8?B?cEpWOWc5NHgvWHg4eGZtT0FtWTl5TWhVUzhZa1pJWjI4Vk4vcDhrSExzQ1Nv?=
 =?utf-8?B?dXNnRUtHNGdaT0NEejVEVk9HY2VtMGExeDRkNllqSnIxZlFQYTJScFhtZ29Y?=
 =?utf-8?B?NElOQXRpK1VHQjY2aVhUQVd3Rks3a2FreFJjSElULzhMZklUTVBhN1JDbDBF?=
 =?utf-8?B?QTBDT2c1SDJsdW13WGlUSDFRTlIxRElzQ3VTSlM2dk04M0hzNHp4Z3h5Uk1U?=
 =?utf-8?B?b0Z3QmJpbFBDeUsyNmdGTjRIdVUxQWhwOFdSbnZSR1IvL3dEMGNRTHlHNXNy?=
 =?utf-8?B?ZzZLYTBhQUZUT21pSDVhNUlCc240RGpzNnNLd25lSlkvM0d1SGUrd2J1VUNU?=
 =?utf-8?B?Rlk1REZZVVU3eHZpTjhBWmp0ZWhLeTlKVzlrc3RBVm0relZybHQ3YmpQMmYv?=
 =?utf-8?B?MmtQcHBvZE1uM2plN2NxVkV2NHNPbkd3U3lXY2gzRW4yTGRPS3VLWmFxZjlh?=
 =?utf-8?B?SDdMUVJNbzZKZjZPNVg4TnNwdkdOcVdrQStyL0xOU3lmd1JLazVjTmZWYjls?=
 =?utf-8?B?SER2d3R2K2toYjU1Vlk4YjBVUDg5eFZ3Zng1a2lNYlVIMStxU05ZM0xTL0ZY?=
 =?utf-8?B?ckkyYzFoV2RCa2dHeHdMK2xwQUE2cVJpcmNiaWd6SUFBZ3RhYWJ0dVhKRkxk?=
 =?utf-8?B?Ry94QU9wSFRNRzBLSjBtaEgrc0oyQWRuZkJ0ZEtXbWxsa3V5VStzNXc0bWlE?=
 =?utf-8?B?bmlaVHBWQTlISWdLRytnTVNmRkdtSEdkWUZ4YXpzUVUzcnJBM2traGxwNzNn?=
 =?utf-8?B?Q3RUZlZyUXllcXUvL3d6K2xmVEJ5dmJSL2M4Ri9XdTRjb003TWhQTmdMMlpl?=
 =?utf-8?B?b3J4TlQwcEhjb3ZpcCt1Unh4bVN2aUtoeU1HS1ZWODNGMzJkTWF4UUVFZDZk?=
 =?utf-8?B?VS9JMjdlZGtnRzRucFB3OUFpQUhiZ1EvbFpwWG5tWmFoQ0cxeitHMGdWWElZ?=
 =?utf-8?B?Rk1qTlpHSDhWUGdUdFJmRjlaSDRsQm41UkhjdzAyZjVTK2ovYWpDUjYzSlBC?=
 =?utf-8?B?ODI4bjdrZzdoWFdZVWk5NjZkTUMvNVBucm1ZTEM5aVdWMHRNQUN4R1hMZlVr?=
 =?utf-8?B?QUFyYTFrZ2pYaUR2czBFQVkxOVNkbGRDMzE5dCtjbWZJUUVzN3BpdEg5aWl6?=
 =?utf-8?B?dUt3bDd4b2VEeFZyT2tCbmpCTDRVMDIrRlRHRSsvdmJBQzJGYUFvMkl2QWhR?=
 =?utf-8?B?a25ONDdPTTliOXZVODRlMUc4Y2NCREg5Y2hkVGpMYVFLVEZ5MGFZN3NCUWtn?=
 =?utf-8?B?dXJiUmJIZHFmYk1TLzF6bDJvd3o5SUlpMXgrWGIva3hMQ1NOU1NVd0kvYWJ1?=
 =?utf-8?B?Um9GTllzcHZ6RlhTRFJ6TDFQZ085RFkrdGpZbE9kYjVXY0xSZU91VHdQR3Aw?=
 =?utf-8?B?WGx2UHU2SGRHSVFSeW5rdnFJekhSM3J1UldmOHU3cTFadWYvTUR5ZlZENSt0?=
 =?utf-8?B?cjJDVHR2R2QvUHp6bHBueFd3TzVxOEUvNDNrQmszSEhGVy9HNWdhRW81TEJI?=
 =?utf-8?B?RGV4Wk9DaFc1WnE5aU14R05Hem12cTUveXQ5OTdnQ0xHOWxub3NJS1JsWWZs?=
 =?utf-8?B?VTk5NVMwcXZ5VUp6VzlMdkZCUDlLb1NUSkhFS3haOEFRZXN5MlVvbFZ2RTJl?=
 =?utf-8?Q?vrrhOLZ8zUilhNUo9l2j5cptt/hcfZMMfTWO3zk?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7d1e19-998e-41d8-fbbc-08dd94f20781
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2262.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 03:22:18.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB0834

Hi, Han,

On 2025/5/14 22:09, Han Gao wrote:
> Sophgo SG2042_EVB_V1.X [1] is a prototype development board based on SG2042
>
> Currently supports serial port, sdcard/emmc, pwm, fan speed control.
>
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x8-EVB [1]
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>
> ---
>   arch/riscv/boot/dts/sophgo/Makefile          |   1 +
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 247 +++++++++++++++++++
>   2 files changed, 248 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 47d4243a8f35..2470e30ae901 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
> new file mode 100644
> index 000000000000..4f39a2575b8e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts

Please run "make CHECK_DTBS=y W=1 your_dtb_file" before submitting 
patch. I have a quick check and get following warnings/errors:

Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:67.1-7 Label 
or path gmac0 not found
Error: ....../arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts:86.14-15 
syntax error
FATAL ERROR: Unable to parse input tree

And the similar issues existing for sg2042-evb-v2.dts.

[......]

> +&gmac0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		phy0: phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <100000>;
> +			reset-deassert-us = <100000>;
> +		};
> +	};
> +};

This should be dropped, we can add this after ethernet support is 
upstreamed.

The same for evb_v2.

[......]

Thanks.

Chen


