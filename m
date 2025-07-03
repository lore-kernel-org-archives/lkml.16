Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022081.outbound.protection.outlook.com [52.101.126.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043F298279;
	Thu,  3 Jul 2025 07:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526660; cv=fail; b=UMNxHJyJjhPmRpnBlrur7/6U/Z93C8ORqnG0teHtI6qNyFwAeb0Lo5/6WlwKENPjlKIrwC0zWm4GzuEWZbou1lpFFEtkIUe7CYnuTn3IvvwnGJHYXR0FLnnU5dR2LFM/P4HrGTnhKyqnU/dZrTP1wASPkwi6UkUEMWUuTmn4WpU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526660; c=relaxed/simple;
	bh=vPLx85d8cG6FLBoQs4mOuT7j86U8Gwb+yzDApbYTzOM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WNwW/Mg5JVhJwlYn2ixlY6NMXls3b//1w3YPLxKTp5VNRBO8IPt3oCKOmBnKj5GwQBQwZ/78q0sBBN8YDz/S2qJMDO7uIOqMFPXMRkJOgC0SLrHe44HyJqq7EtdJzwbTa5ICtr3gNEcODI5QQ6ByKkyL0WxbsiFy1Y05oqs2Ujc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=s+oKsylZ; arc=fail smtp.client-ip=52.101.126.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="s+oKsylZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRrACjQw4T9dghYTjra63M/qhR23R7jWX4+tpKOlkPyE+J7r6waRDrSZeZoLewyKRo9CvYr98/kx9zL8K9Xbv7fdZ4wBhXklaSnV63c4UKCjux+kyiWJrUURDV2XLVyOHKGyFsbMKT4Hdw/aLX3TOl/Io8LnCfJigNV21mip9k7Zt9vcjmkCgfFzI4fKGjN70xmXzB3jJQPpjFTqs8FqWlRg0UwdWXGhsTzoLEHitYC+Y+93PFhWUu5OkjaAzk0vlfoNSqeu3Ft1GSP/lxkuKf5ik177YSOjyt9/AGF4RcpxCnup+dxbItpfcUxVhdfq/XIl2pwvWOqFV7hZytv39w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u27/opzAjDkkF2N2905CZ/texGV038jvUGC163uiOFM=;
 b=pljofX9hvvllALc0qVU6O3u0vHMvPjJ0ERBCOH+UxDdaIJ/tf3qI3V88KKiYTwDX9cL7EX+DeBbYvdK7Sz7njI3Nbo4Rmliq+dEXQiHUDri0H/lUC1WIn95X8EC5nYlGIeuQKxALR9Kx+9Y2Q9N0AA2kvyj4Pb7lbvGWDnkPz8yscPGFWWJoWCMjgqg9mvu8WZ39O5yNph9nxn72XYPz8wi89lkHe62I+b/TAx/VtM4OzUfSbxx4128hiJZBXYvrpk3zhSAzHeqtt7OWtp9QPzu+hleQK79eu2evbmeUPTpsPHTQgvgh/y/Ar4ELc/BvcrRMW4vYbuDcP1V3jFA5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u27/opzAjDkkF2N2905CZ/texGV038jvUGC163uiOFM=;
 b=s+oKsylZeAZdRFlr7//EwhvUJQxB6daOZtTvOzao7p7kzpTRZ0YIVBasHN9aRUaLfu1cSqGrZDqZMNP8x5/4S0LunwMe3RkrvzHINiJHjMTEYuZOpa8Jvs0D7tX1NUFFdJVsVLaBrnW5EcsiRS0t7Q/GIkm0STvAb7+dP2J4D+OoB3C7MGiHb3vCQz0d9IOMEOExgubescQO1f+d5TKl3Aioaeg3rdoahZ2+FA/0IZqxP2Mk4eRNuz4jZ4WMytkdgpOz/Wa6cL7N9Igcgtu7KHSyb8+MLUyhYPMQh1bJDVuAsbb+HZiFLHlzM2CQ8iQKU26QSQkmc8bLLttLo/pwAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TY0PR03MB8248.apcprd03.prod.outlook.com (2603:1096:405:17::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Thu, 3 Jul
 2025 07:10:53 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:10:53 +0000
Message-ID: <c68f9274-7faa-4273-80b0-402af0c33ecf@amlogic.com>
Date: Thu, 3 Jul 2025 15:10:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/26] clk: amlogic: introduce a common pclk definition
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-22-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-22-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0022.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::16) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TY0PR03MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: cfff6f4b-403e-474c-8287-08ddba00bfb4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0owcVdWeVA5OUdNMVpUVDgwVWhJR0pqdXdHbFIzZk5zZCtvaDFUK0c1Z2Nm?=
 =?utf-8?B?aHdYN3lhc1VjMEV1bWVvSThRbWRLcHRPenBhcXZIOG1BcE96STNFU3VOUU9Z?=
 =?utf-8?B?MS83anpsTHRJUm84NHFGem1yTUttdHVyR3FCNzJLUEtGYnpMN1dZcHZ0Qmlr?=
 =?utf-8?B?T242SHhyYWVIQVg2ZkNTdEQyU1MyOW1yRk5VTWhxYzYySzhjMzJxazBRWHZk?=
 =?utf-8?B?SWQvZ3AxSXdmemJjY1BmMlFPVC9VZGZYRUFzd1NUNHNFcG1IbDhsYzB3bkd5?=
 =?utf-8?B?SDF6dUlnL3VJcThzNnVhOERBME1DYXdVYkZIRFBrcm5vT3M3UXY5dm1naC8v?=
 =?utf-8?B?aVB2YU8vbmUyODZSbVZwU0VxVUJoRE84a0ljeGJrUjFxRXFQNW9peUk5eC8w?=
 =?utf-8?B?MG93U0VkTUh1RmFqbGl3Sk9Qbngxdm04Qis0akpMLzRhTjFCS2FEYUpHQ1ZD?=
 =?utf-8?B?VVBpbUFIeVNrZkp0dTJaR3U3dmRtWVY0dHVXSnNwWW9rdEs5eTh5c1dTSm9v?=
 =?utf-8?B?UXRPMmlwd3dJZHR1dFArQ3FrSDJyMWV6bm9DcG9WM3hOR3BuQmFwaUd4UkNM?=
 =?utf-8?B?TytUd3B2Z3pDazNBSmc4ayszSXV2dnZDRFFQa0I1MVhlYWNxWlZqeGkwL2Qr?=
 =?utf-8?B?WVNvR0J2bHpZSEpaRVgyV2J5R2NJRnJwNndmdE9rU3JKMWoyUjUwdkRmNHMr?=
 =?utf-8?B?MlBVSDhVLzhNelhvZi9TK0hJYkl4S0M2SUQvUGhYdWNlSmZScUI0R2Q5akp5?=
 =?utf-8?B?Y1hHNnhZRXdldG4vUDFkZGVJUFNGVGFzSWVTZEgveEtEbklMbWNqZFQ4dVN0?=
 =?utf-8?B?aElIWXB2aGNpaHRqTVFYK3R2OTFNYmxXR0RkdW5DRTJQbUFlUlNKYmo2Nnhl?=
 =?utf-8?B?MUJlY1lIU1hGMGVQWVZXWjg4dVRGbmJCZExPTmpmWGlVamk1NFZnMXRLT2N4?=
 =?utf-8?B?TXk4Y2xxbDBYVGJRMnV1RW4wQ1dyZU1kS2ZTQW53eUNuaEtjWStFTFV6U2JJ?=
 =?utf-8?B?ZE5VVkZ1TTNIc0RWMnVnZkE1VUd5S3dMaWRuZTRMYjcrOGxzK0xVOVNVb0FR?=
 =?utf-8?B?Y1duQ2c3c1E0aExqenRyd3BkYWQ5OXlhMWJmYVZzZVgza3N0akFSRVdzZE93?=
 =?utf-8?B?eVRJNU8yaG9zOEZneGZicXR2Q25ERms3YU8wOHNiRjZHRGVCa0FsQm5DQlN2?=
 =?utf-8?B?M0czMVZCVUVXUGViQXVuSUtxQjF1bHJoYU9Qd0REUnpOc1hCZnJaWmc0STF3?=
 =?utf-8?B?ckFSMTRmRUJ2eWlZSjg1amc3dGxxZkJDUDNmLzE1SkxiVmlUZGx2bkF6Rkt2?=
 =?utf-8?B?c2ZMeGxCTTk3VlUyZy9hcjQrblAwQzdlRFc0L1FLR2h3QUE0S0prNHRtS0li?=
 =?utf-8?B?MmtpUmd6OEZaSno0K2ZQOU9wdnVIQjVrajluQjZMakdHMGZ1RXpzK3JFbGFC?=
 =?utf-8?B?UGxJR1lHYUZwMkhFVzZlZFZsWlc2MytObFcvUUR5VmVEdXdtejc3Z3hZTjJQ?=
 =?utf-8?B?TUFRRnM0a3Q3SlF2UGNTd1hXdENZN2d5L1dpK2JKRi9TU2NGV0hHLzNLa1RW?=
 =?utf-8?B?RXBxSHByZkN3cWFTMVdNR2lPZ2RhbXliV0hxWUl2TDg5NTF5a0c2akxmSlM1?=
 =?utf-8?B?K28xaWpnWFp0cklQWTc4ejMvZ1RUK3JuT0U3cmNEUzlXb0N3Nm9UUjF6cWNx?=
 =?utf-8?B?b2t4OG83Q0cvR1dUWW4zR3hETFYvb3dZN2NuOXF6QnhKNEQ4bXYrUEp3U3VT?=
 =?utf-8?B?YzViMHQ1N09hajNLcmZJYy9vaWsxTERhNWg0b0w3d2JvTkoyUDk3K1Z1V1dD?=
 =?utf-8?B?QlV1MXJONlBsV3lZK25oY0FRWGVWMGFXdVR6azBQakZTZlIwZEpubTBJbTZM?=
 =?utf-8?B?RnRBd0drUy9Bb29MdXE2bk93YlQweS9rYkdiZzBQNXU0NGE3SGZ2bnRwL0pu?=
 =?utf-8?Q?pp9cPth71s0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cXZIS29wR2tEL0d1SVFoU0pUaXNQbUdRQUNHMWRpaTN0b24xM3d1V3JXQkZ5?=
 =?utf-8?B?NzhScnZWWmcxMStyS1VpMXRwVUhYc0F2TVZneSttQXBPOFB3RW83djJXd3Zw?=
 =?utf-8?B?OFVDM0hHU3RiR0NjOG5KazQzT2dGdDVCdGk5UUk2cXZSeEVtOG1IeFdUZVh3?=
 =?utf-8?B?clFOWkN2aU1acUlVckdSbDlrMm85L3l0S216Rk9Ybmc1RjY2WkU3bTJYOXJK?=
 =?utf-8?B?bVQxMDJVRXp0U1IxWG92aXRUQ0VFL3Y5dko0NDFaSk1LMm91VzAwUVgvSlRa?=
 =?utf-8?B?TXBjN0x4dHg5cTdXbGV5NnpybG1wMWgrRHVzNWNnRFRMVGo4c0pZQTNHT1hh?=
 =?utf-8?B?STZDcitJeXE3L2RjazNJN1FlS1FxK0VVRk9WQm0xMU01WWx2Q1oxUHZBUW4y?=
 =?utf-8?B?a2JHejBOT1JJbUdpK0JnRDdOcFQySm1LOVo2OCs2R3VXQmpZZjdqZWVvNURF?=
 =?utf-8?B?MmNINGdZN0RCSG5sSTNPWFFqOHdWNm91M0VRRFNzcmpHVHN4UXUydWRRbWFr?=
 =?utf-8?B?NHp3TUwvUVFGUiszMmxHWVNCRWdGZGNnRjFGOVhpY1c1Mk9NSkRZQzJBZVRs?=
 =?utf-8?B?NStUVGdnZnpjNzltcTlaK3RqOVc5bm5MNGcvazVBRFBSRFF3MDk1VlcwajlP?=
 =?utf-8?B?anNybWl2Z1E5ejlxSU9BbjVUT2JodjJocDRVQkNxeUFDcDE3S0NKV3VpaUd6?=
 =?utf-8?B?M0VXVU52dVpZdUpMeTU5YlluTHYyZmc5dGZybStBZGdJMEZFNWJndTF6VEZD?=
 =?utf-8?B?dE1iV0tFL0lPWkdJQUtrTjIrWUZBNzhxcXhKbVEzbHd6M0lGUVVrQmFGSVZl?=
 =?utf-8?B?TU1USEQzdW1FeTc5aFdVUEtlOEF3aFlXMU1BY3FHY0pHcytFZmtKMmVpbDZQ?=
 =?utf-8?B?MW5ESmpneUxjdUE0TGhtT0ZYWnNYbnhrMFNSUWE1RWhKUmRvN1lnYzlTMHhY?=
 =?utf-8?B?UTNlU1BIa0JobVo1YXJnL3RDYjlwWVp0QnpndE1YTmF0NUI5WU55OG9EeUdQ?=
 =?utf-8?B?SGhCaEVVMjVFRDd1Z0lTbnpobFFaUXFNTitqUGJyR0NJY1ZQS3paRGNZZ2lJ?=
 =?utf-8?B?Wm9VTVJyRGtmL24vS3ZjVUx3d2JraktMSEZVQVh3S3plVHZvMEJZUTdxbW90?=
 =?utf-8?B?c1k3c0VNNnVEeUdzM1BmTmZyK0M5UGprSDVkdlZFcnpIZlJPSWZjUWJ0a2hO?=
 =?utf-8?B?QWxPY2lyZVBzZFhIVnVVMUYrakxLa2x6RXdEL0lVR2d2aDF5MjRzVUFDRzA0?=
 =?utf-8?B?aXliMmZDSEtsNlorTXo5cnhQbG9rcGhrNEw4dTVEbDNKdTVsNG9GMmpLaHYv?=
 =?utf-8?B?L09XR29qeitoM1dWdXpxWVhxNUVGWk9ndWFQdkdmWDBPaS95TjNOdXBoQTVn?=
 =?utf-8?B?OWN0Rzl6NjRGTGRJaUN0OFlvNW8rZjgybm9vTjhFcXMvUGVNNnJjc3V3cE1t?=
 =?utf-8?B?S2pycDlkMDZ5dmpBbCtPMnRYVlBKUXQvVWkrZWlZVXFKcFFpbmZ1cWxBUDlK?=
 =?utf-8?B?SXRPcDZ4VHVVaTFMRXhvbS8wZEJselR5THgzUVZRR1pITERUM3RMMjErZXdq?=
 =?utf-8?B?MGxOQ05OR01lRVo5WjBwNlpkcmNsSXdoblpEaSsrL1ZMMFBNUThkVTNmTFdo?=
 =?utf-8?B?RFRGaGpVMDIxQjZ4VlJ4a2ZVODVVS2Y2ZVh0Mmt0T2FDb0tUMithUHl3eE5r?=
 =?utf-8?B?K0dhT3VJcG4vQTJNRnZIRklWeEljV1VabU9uc0NFSW5KM2pSUENtcE5tWVRj?=
 =?utf-8?B?Vkh1R2k5Y0s1anZ4VHdEc3c0TzZDOFFyaS9tYkU3MDF6TXVucXNHd0syeEsv?=
 =?utf-8?B?cEsyemxVaTB1Q2UwWjNZRWJ5UVd6MWFTYVNHeHZoREdXZGw4STJyaUxNK1ZB?=
 =?utf-8?B?ODJhMVJJYU9yY1RtTWxidDRSd0lvMm9BdnZYSER1Y3U4L3Bwd0U5RVorK1dJ?=
 =?utf-8?B?WkZqSjhOUUkzNjU3QWhNdjVJZlFaSHZUWFRjVWtYTlFrajlJUXJpMmxRUi9o?=
 =?utf-8?B?TTZQV2owMHNoY1JrVUFOWW4xYWR2ZnlwN1VFR2dlSVFNamFOdGdiMDFHVW5U?=
 =?utf-8?B?bjFxcU52d2JrKzZtTEp3VklRejlnQzUramhjMnZ4TG5mV0VoZ1BuM1pGVzU5?=
 =?utf-8?Q?sictqMdcYxX03I8bG1IeDOhpB?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfff6f4b-403e-474c-8287-08ddba00bfb4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:10:53.6831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1kMij9EHm/exxwTTTb6QeIawOE4iPigIAbAsvSpQW+vIakrC+jcm5GzImgoNZoXhse2RN0HPXi1cZrXu/SrzrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR03MB8248

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> All Amlogic peripheral clocks are more or less the same. The only thing
> that differs is the parent data.
>
> Adapt the common pclk definition so it takes clk_parent_data and can be
> used by all controllers.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/a1-peripherals.c   |  4 +++-
>   drivers/clk/meson/axg.c              |  4 +++-
>   drivers/clk/meson/g12a.c             |  6 ++++--
>   drivers/clk/meson/gxbb.c             | 26 +++++++++++++++++---------
>   drivers/clk/meson/meson-clkc-utils.h | 12 ++++++------
>   drivers/clk/meson/meson8b.c          | 31 ++++++++++++++++++-------------
>   drivers/clk/meson/s4-peripherals.c   |  4 +++-
>   7 files changed, 54 insertions(+), 33 deletions(-)


for 'drivers/clk/meson/s4-peripherals.c'.

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index 23b51d84d8de40aa540dbc6dd5db9fb627e579de..3e048e645b080f9e5982ef908e3f9c43578a0b5f 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3165,8 +3165,10 @@ static struct clk_regmap s4_gen_clk = {
>          },
>   };
>
> +static const struct clk_parent_data s4_pclk_parents = { .hw = &s4_sys_clk.hw };
> +
>   #define S4_PCLK(_name, _reg, _bit, _flags) \
> -       MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw, _flags)
> +       MESON_PCLK(_name, _reg, _bit, &s4_pclk_parents, _flags)
>
>   /*
>    * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
