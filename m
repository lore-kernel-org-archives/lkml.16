Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022096.outbound.protection.outlook.com [40.107.75.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E73E2D77E3;
	Thu,  3 Jul 2025 09:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751534663; cv=fail; b=mtPM/Q/JyKWAWSk6+NhaGEe3PZWGXYOWHirSjvi2zpNDJqVfaKHLh0Uwn8Ho8XVutJqqlkQtOvSE5bziPZdl+tc/xFuwunAIldmR+BpOGYmqwvkkIvWJXZaSRmKeIpiS4I6FETTNMunUwm9Y4F4rNTIuYHFyQS4/N9+APLn4rSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751534663; c=relaxed/simple;
	bh=0362iGsZeesHdyE/PrOVuSDyhP3OrWacmeUkU0iOyfA=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eQR4fG5ko1CrCvu5cEIuhCamGNHuifCmqHyYA+ahwUUsdBZraMKm4pBx7AaZFHU4gyj77zpk1Ne2pvWsYsushS2OQJQGO+SGMWaVNEclvMx14UpNF9bmgKlkkedBpWi5YMtLrhuJR5XgMFA3NklQqYH/6MlS42I4J1JQYaxKHdI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=AIAaexRR; arc=fail smtp.client-ip=40.107.75.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="AIAaexRR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M3VJawjTC8Js/+Xk9/vhLsNzf+tC8Idzdn4ifcW72BGAVANqzht5eRBPGTNmvytUyZ6gSnDEusXj9AxrUrvGRvrRky7BspDq33DjpYUOrdhuOs6S1J8gt08HXIG2o0ZVY5UVT1x184r1YlKM48TfkbDY2ntVe0jVj1ov26H+DceC2hEPx9jXr36YgE0gViDYzF9fFgDfpo+FJvfMCaiaKt3hkEdyB9Mz5zt/FP/gi97St/Wmmf4PiE33zlnX+Ev4SLQfsy2OZ4WnRCuL4N0mNgll42C4jxMmwjnKKW7m+ZnxciPM+8x268XAM2E0TREEcTjuKvT409fPBdqQGxCFkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eFQhmM4Nk60c+wuX4KBIT87zeCSlbPnsea536NcW05o=;
 b=b5Gu7Gs5LP4N92Ug8twB/kQWYg4W3tS1uBAUfGu9G6qZmZ0i2R0l3IONBd90J2s88yLSSvZvh3xJFWH/wt/ZJ/0ktyPTsg9/0q7ui7NbhYeut2mj3UafQ9pa2XfqhlgeikiAzglYxrOmIb+35DP9MZ7luakoUsyolNJM2xlkCczpH1/vh3+s2lPD84lAdPTns1vlhjNlHle+11R4+2umaJ6VTu11UMbIEhxo1fF8uY6Pit0jgkWXMNsDxuhHqM3OcMzddgKhce/dppXq0ce2kBJRRQSJz9ieiyD8bP61Uumfa+17Lg3WLDjL4G6HcgtHaJxFiyl/LH9yNdkbjuZ5+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eFQhmM4Nk60c+wuX4KBIT87zeCSlbPnsea536NcW05o=;
 b=AIAaexRR4BoqKH7xzC6mrufYxNVSCl38dgsd0Xrftyk+kxHT8AQ3N7WJw0iibMMOzT79o28V+DnZhfWCPRMnfjO1B1Bg40ZEd0mzxm/4DJwpGTO/k6AuQUUZ45Z8keaSvwZ6jimYEQRvSqgzE0fgQUYZixl2RcjsF7Zw+2jjixol/SSjQr+OoqezZPMDsiTI0PuvccgqZNzEGWxkUPLZZ0KAH7Ef4qdJmlxOToKwcg2IGPfgs9LZviuss8IjDANjAh6HcvSeetcBy4y7Lh4be3rmntxnRnjKq2eALxjnQE3MsTDc5olIwP6WSJz5sYaEBrYRja83AY2i6LAIvOIGAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by JH0PR03MB7559.apcprd03.prod.outlook.com (2603:1096:990:16::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Thu, 3 Jul
 2025 09:24:15 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 09:24:14 +0000
Message-ID: <2a124e5a-9efe-42c3-8193-a7e8cf1d59b5@amlogic.com>
Date: Thu, 3 Jul 2025 17:23:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/26] clk: amlogic: c3-peripherals: naming consistency
 alignment
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-5-e163c9a1fc21@baylibre.com>
 <eb233f20-1927-4944-9b57-f90c998db19a@amlogic.com>
 <1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
 <99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com>
 <1jtt3tbqam.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jtt3tbqam.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|JH0PR03MB7559:EE_
X-MS-Office365-Filtering-Correlation-Id: f1d95d70-0415-441e-9cd7-08ddba13609a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y0FaQnV2bXF4VkJkbU83c3pQU1ZtMkVFNUhZVWdqU1Q2cGp1MmdzbU9NR0pj?=
 =?utf-8?B?WWtVTStwQUluN2tNaTA2dG1ZMWZzUmwxSkZjV0JMczdDalk4MWRMM1RxU3hk?=
 =?utf-8?B?RzZieWNSRUU0M2ZpSEZxNCtsYm5XcXl2RE5BWFhtVkdLbUdjTnhlNFpUUjhZ?=
 =?utf-8?B?U1FDVngzcDhheURPM1FnNjJ5K2FUZjlhOW5KcTdZUnJwVjI3U2g3RFVzYWxC?=
 =?utf-8?B?dmNLS0JpVVFpWHN4QnN5VU15Q0xVOVR4Z0hDY1VjYk16eGs1ZENpWVh0ckp4?=
 =?utf-8?B?bmNjMnh5Q0ErdWZneW1mU0NJcElrTSthZWxXdURUQ1NHaVN6UnRjaUk2ZWtm?=
 =?utf-8?B?UkxwaS90VTJIWldQZFhlcWdUdjRZcmpKbi9LVWRkYld3bFZMUjg4YlRnTWYw?=
 =?utf-8?B?SmhyTGFuNmV6b0tqakp4R1ZJQ0FIVWttTHZQWGljQXo2aGxqbmpodzYvUyt2?=
 =?utf-8?B?T0dubEJ6SG91N0hXT1YwcDNveW5KcENMak1xOVNpcDZZRnR0YUNkRWVBeUZj?=
 =?utf-8?B?UU5rMjEzOUtLcGRQc0cwL202aHlvWEx0T0t4bDI2V1NwTmpMVnhtbEd3aVli?=
 =?utf-8?B?WU1CRFJJMkI5cHVFaVNIN0dYaWVtZEREYkcrbUxmdnp3VTVIcjh5UWl4M2NJ?=
 =?utf-8?B?cGh0RjFVWlNBNWVqZHdzcGdGQXBOUGZNNWM1ckYwRGhNdzFCWDdEMXd4Tmxa?=
 =?utf-8?B?VTErdUVOL0U2OFJIaVBlR0gvNlJYTUFpTjJVT21Ob2pQekVLbWxCeEJQUndD?=
 =?utf-8?B?MG9OYVNpWTJpQjZ6dXdsZXBDTi9wbFg3eG01ZTdqbUQva3dkNEtjaWhHOElR?=
 =?utf-8?B?U0l3dllhbGJacDcrTFVQUTExNHlyb2p3ZnlkVjJSa3NyT2Jpck11MVNRRHZr?=
 =?utf-8?B?djROWVdOaGo3dHc4eHloVzlmMER3Zk92aVVtREdtaTJWcnBvd29SdkxxTUVN?=
 =?utf-8?B?UzVDS050MVowRWZUL2M3dUVsZWhxSUFMcEZ3VjBKa01uVGNSa0RObVFUbVpw?=
 =?utf-8?B?V0RiN3lNa3I4YjVrUytxSk42NjljMU4rTjBqL3JpcnNiN2V4Nk9FYnh1WU1Q?=
 =?utf-8?B?ZWJDbnRHUVRnZnV0ZXA2UmxYMkFLeDFZVlNVV0dyWkJ1U0xGMlNkSno5eE1w?=
 =?utf-8?B?MjNuVkhaelNtYVN5Uzc5VHlTUzEyZURKWnBieGVjVjNweDFUU01PT01DTUFE?=
 =?utf-8?B?Z29XZnhNaXVXMUt4MGdRWkJCT2xjVUNpM0RTYng3NGszem1XL0hhNDFNTEZZ?=
 =?utf-8?B?ZWk4NE5pc0EzMitPT2xXNTlNZkIzL3RZc0lNVkgwbExVQTQ2c3FJYlNaWEM4?=
 =?utf-8?B?b2FxTk1ZZE1CU1VBeTMrT2plRkQ5VEE3NmcxcXFqME9aZUJDT3NUcXkzZjFG?=
 =?utf-8?B?dU9zbWZuNEVQdFM5MkFKeUtMUDRtYVZsTTJvOHNjeGZEaGIxOE5FZzk1bWZi?=
 =?utf-8?B?R1N4ODlwTjIxKysxS3BwM3d3SDBBS2w3QWd6WWNTY3JvYjA2Rm41SlZudzhr?=
 =?utf-8?B?b1lGREpPQ0wwc21sMW5MMTFKaUhOaGIwQVZJNEVaOWRCUjdsSVRzaENaR3Qx?=
 =?utf-8?B?ckZPRGFOOHNDbmp0Z3dDeVBYb0FJWVVjZXg0Qm5FbWd3T2xFUk5tdTdhcVov?=
 =?utf-8?B?c0c1V0lad2hhMm5COGVLNWZPUDVCZVlXUldYWnBXZnM0b0NFZk1UN2g0OGg4?=
 =?utf-8?B?TTRDRFZvQkM2TVVlRlNlSjhqZWlST0I2V0VJUlJBcVlDK2RKdE5QRXZmREY1?=
 =?utf-8?B?M2NzTDNyanBXd2c0TTBteFByckxoVHpEQVUrNVo4dkI4cmQ2TGF2MFNMNExN?=
 =?utf-8?B?RUpic2U2bStwc1FlbGN6d1oxeVJzQmhOVDRmekxwTlh4MXVtVjYxandqaFZZ?=
 =?utf-8?B?dEZxeWtVZFpLbVlBbXB1dG0zZzdIVWxvaStKUVdsWkwrR0VPQWZMUXBEUnNI?=
 =?utf-8?Q?9S6jSot8aQY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVJMTW0rYlpnMWsvTmNMUXlncWVUNVhHYzBpNENWTDJUK0VpL2ZXMnVRanB5?=
 =?utf-8?B?ek9zOERncGVaUHZ6ZGpQNkxuM1UxUk4rMGptbmRRdVZDYmxiRUhDSm1paVVL?=
 =?utf-8?B?aENWS3JsRU5zNzIzTzhjSEp3allwM1J4NTJZcGQ0dzNERE1jdy9oblhIa3V1?=
 =?utf-8?B?T3dBc042S3JqdERLVkVJbjZSVW5PT3A2VTlkQUFKbnRCUllwNTlkLzNYc2h3?=
 =?utf-8?B?MGxLUy9ZZTQ1WWdLQXFkbDhXU2dYZ1ZNbmc3WTd5Mjg4Sk80dTdKU0R4NXBY?=
 =?utf-8?B?NU5URXdaMENyRHlKUHBjVnVRN3ZvUklaKzE1T1dkWDJacmpuUEcrckljeTlO?=
 =?utf-8?B?ODZ0TEJtNDRNa2tJaEVUTWRyQjJaTnVxT1ptaGFuUlVpa1ZmS3JOai9vQzBk?=
 =?utf-8?B?VXlWeXpuZW1yT2Z2ekdqNmU2T1JMakJvaytibHN0NUYxVmlmeXhrRnZianhX?=
 =?utf-8?B?VTlOT1l2TkNuWFNzUlB5elpHbEk0TWIrY3pXU3dOb2lUQ1ZtaWVBcEVmOE1k?=
 =?utf-8?B?Ym9jVTZBNmdjYlNnTWZ3c050VHJQQ1ZYRDRqaVQ5YUM5bEptaCsvTkVmUEZK?=
 =?utf-8?B?YVB3QXcwZ2J3N04xTUtVaGxhbVZxQmErUjZydk1CU093dlZObUJXNjQwTk5h?=
 =?utf-8?B?d0lRSjM3WVoyTlN1L2xVN0V2WUtjN2FoU3pFYThiZ0M1V2s4bVAzVVVpMWJQ?=
 =?utf-8?B?T3EwcmZjbFZ6UzJIVXhyRGVRbk1HdVIvbFBUd0RjMUxFd2lmRjhMR1QrM1Ex?=
 =?utf-8?B?YVNoMkV6SHlMenFQNTB3L216SHRmMmxmaG00Z1d5enNONis5TUc5YnNpM3J4?=
 =?utf-8?B?VjUrUXZETzEwTXJCT3F5dThHOUhzd21TemdSdHlaVm1PODlLNFB6T2U3K08r?=
 =?utf-8?B?bGVXbjNueWJiK2VadndUT0lkK09ObElJeTlUSVA5QlZsU2MxMWpabEVCNWkw?=
 =?utf-8?B?bEhsRmk5d3lEQko0NjFJNTFDRFBrNFBlSDBZNHdKaXJpdHNBdEQ4QlgrcUdN?=
 =?utf-8?B?bVF4UHU5VWF0c0VvQzEvOHhpb2V4Q2E0aG91OWdlZEV0d3ZSc2FsUWFWak85?=
 =?utf-8?B?allTYmJEZHBrM1AzL0M1eWVGdU1OYlMxVE9VZmNmc0pjcitmR2JUUXpHakx1?=
 =?utf-8?B?VlFvTlZYSTA5akdFaklpTTZBdytjZDZ3OXFSdVRaYndaaW02ZG5oVi9aYmxs?=
 =?utf-8?B?SHJiMHhBNkVlVGs4dXRoZll3NTlrV2hNZ0xZeVpqNzVySWgzU0dNMHYrQmV1?=
 =?utf-8?B?WC9URU5EdmdTaEdwUGdlbE45Q2VFMFZwQ1E0UDl0WnlQWGxCajdsTTFaWE5L?=
 =?utf-8?B?WEdxUUw3QUs4YkFndzZ1cFhCbjE0UU9SMUNBTmlWVGxLeldOZCtidTZ1ZEkw?=
 =?utf-8?B?cGp4RmR1bzdNdFB1S1BwWkY5cmlaK2NUMkZ4OWR0ak85UGFITnRlM1ozeE96?=
 =?utf-8?B?WG5VdGwwMC8vU2dzWU5sZTM5QlhPV3RvNHFoTHQ1ZUZRRENGdGtpSHFVVHl3?=
 =?utf-8?B?OXcvQzZOdkVaRDU2Q3JOclZkVzdOVFNkd3l3SFpDd2pLR0Zoazh4UGEySERr?=
 =?utf-8?B?YWIyUTdPZVkva0hDTXhwa2ZsNFNMZDQ4NXhPNUk0SkpTSEl3akZQZFpxOXhq?=
 =?utf-8?B?Wm9Za3YwdnRyYmM0MHVLd3F5SXBYK2Y4VmZRLytlalZIL1VuSC9saGVRdmRK?=
 =?utf-8?B?ZGdXUnBoYWNFcDFpSmdFMWt1eWpWOTFCL2dwNVRUVFVNVlZPQTJxcjE3Qkl5?=
 =?utf-8?B?aEpZQnUzRE02UXVJNlNHS0ZTZnlWSEdlMllvVUF2SUtGY2wvYW9VYkVaZ1VR?=
 =?utf-8?B?b1MwbVcrZ091UTVIYzVxankxb1Y0WVd0aVFXa2l4MElxLzQyaWFVcHh0OXht?=
 =?utf-8?B?cEp3VUVaZ3RJenZSMHlYYk41b1psU1hMUFAwUnpXQ3ZVRkMzZjdtZ0pTNGto?=
 =?utf-8?B?TTl1M2MxNkhuaERCUjRIaDBrQStSZTFVUVJqRk5mMThOZFNiZEVkNlNXRzF3?=
 =?utf-8?B?UENlMzJrOFRTbTRYNE9QWEJMWmtjMFZEY2RWNHIzb25DWWJtU3VTY2M3eTJw?=
 =?utf-8?B?bTY2SEFvZVlwbGZyTzVHNnJKcXBnY2VkYyt0ZzRTSm85ZzA3a2Z3UXMwMVp3?=
 =?utf-8?Q?Dx0dz3fRFAMnvfd6OufNew/X0?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1d95d70-0415-441e-9cd7-08ddba13609a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 09:24:14.6250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VsZNiIpgRqA1wQIY3d7eQeNsXgQD+m43p+rLOfZ7zuD1rFU/blLN3/5cUiAfsM0qC1q35yCuoANfqPqupln5+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR03MB7559


On 7/3/2025 5:02 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
>>>>> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)         \
>>>>> -struct clk_regmap _name = {                                            \
>>>>> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
>>>>> +struct clk_regmap c3_##_name = {                                       \
>>>>>            .data = &(struct clk_regmap_gate_data){                         \
>>>>>                    .offset = (_reg),                                       \
>>>>>                    .bit_idx = (_bit),                                      \
>>>>>            },                                                              \
>>>>>            .hw.init = &(struct clk_init_data) {                            \
>>>>> -               .name = #_name,                                         \
>>>>> +               .name = "c3_" #_name,                                   \
>>>> Prefixing variable names with 'SoC' is understandable (to avoid duplicate
>>>> definitions and facilitate variable searching), but is it necessary to add
>>>> 'SoC' prefixes to clock names?
>>> This is part of the description but I'll ellaborate.
>>>
>>> Some controllers do so, some do not. This is a typical pointless
>>> difference that make code sharing difficult and lead to the duplication
>>> I'm addressing now.
>>
>> Yes, in fact most clock configurations are consistent across our SoCs. Over
>> the years, we've been continuously working to make our driver code more
>> 'common'
>> and efficient.
>>
> No they are not consistent at all when it come to this
>
> Controller prefixing the pclks:
> * axg-ao
> * axg
> * g12-ao
> * g12
> * gxbb
> * s4-periphs
>
> Controllers not prefixing the pclks
> * gxbb-ao
> * a1-periphs
> * c3-periphs
> * meson8b
>
> I do not want to invent new names to avoid the names clashes if the
> prefixes are dropped. I tried that way and it was a mess.
>
> As noted in the description, clock names will not be prefixed with SoC
> name, *except* for the pclks for the historic reason explained above.


Understood, I'm no further questions. Thanks!


Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


>>> Both with and without are fine but picking one a sticking to it helps a
>>> lot. I would have preferred to drop the prefix from the pclk clock
>>> names, same as the other clock, but:
>>
>> I still prefer adding SoC prefixes to variable names but not to clock names.
>> clocks with the same name generally have similar functions across different
>> chips.
> It is not a matter of preference.
>
>>
>>> * It would have changed more clock names and I prefer to minimize those
>>> changes
>>
>> Your recent patch series has already made significant changes, and this is
>> relatively a minor adjustment😉
>>
>>
>>> * It would have caused several name clashes with other clocks.
>>>
>>> so prefix it is for the peripheral clock.
>>>
>>> In the end, what matters is consistency.
>>>
>>>>>                    .ops = _ops,                                            \
>>>>>                    .parent_data = &(const struct clk_parent_data) {        \
>>>>> -                       .fw_name = #_fw_name,                           \
>>>>> +                       .fw_name = (_fw_name),                          \
>>>>>                    },                                                      \
>>>>>                    .num_parents = 1,                                       \
>>>>>                    .flags = (_flags),                                      \
>>>>>            },                                                              \
>>>>>     }
>>>> [...]
>>> --
>>> Jerome
> --
> Jerome
