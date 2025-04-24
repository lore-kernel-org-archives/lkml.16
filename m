Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023104.outbound.protection.outlook.com [52.101.127.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1F7221F39;
	Thu, 24 Apr 2025 10:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745489700; cv=fail; b=OFfM0ma7JjYMCVXRql772R/HtYIMFU4a5Be9PgorS2tKRgl7d857EMvXB7vEcPxw3NvKJguieGRAMVL9lN86iMr7sg0AuzWZ7oLCog2zEB2LbDoTFHgvB0WPjwRx/CmRlDVJRO5Q5Ob2fBkBSkknpGx4/Q0n7D0VCThoDunwFXE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745489700; c=relaxed/simple;
	bh=VDnYPDzu3Ky+EonvsBF+P+SGPStZjDNWfJrpJM8TG4o=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=PzZ2JzwZytcj7ig+Jl9IPh39QN/HBm750T78KM6hrsgegftg4vX2iCR1He2nUxfT3QMlqwMQjyaF6oL7xhewF6vzsG/T1mo5MTD+foRsfOenyUJ1dazeXqtcSYr2klTBAOufGQnzqJ0+JJESBt1G/GyKIv20RSKbZooO0YBzu3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com; spf=pass smtp.mailfrom=wesion.com; arc=fail smtp.client-ip=52.101.127.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=wesion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wesion.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M0iBqvIOzmwpXPchjj7aDKPDJy6+0kLBaT3cTjR6eBzW56KQp8IT46UCRmjElrqlluXtpaG8ShlU/o2tL71jc17d8YFNXkMRni6f/9dTPwf+/xkWlWWy621gZFZG+ntNIPTrXGuioQqqPH/4vmwqgUMiANE4cUTUKG6aPx/6h5azFCM395BA80oIApo60RF1WgDS4wEfKbE2kgToIUTuqik07hvmj6pQwu46MypWFVyHiV12UefL6zO+AUMplEqM81mzz7rV9E5mEUQkGQgJdXNQizroJp0kNXrZLeuceQw0udqzqxevPbEwr48SphIvbhfacR3XfS1NgiJ7snGJ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sY02lAhEFKMKF4VjOBdlBG9SDdFGrH80+1gSetcKGxs=;
 b=xzP2CYcYP/PTfmHSAAYYijEEVdPpoMsEVvgjWTww/TWuGx+uiyN6Eed+Lb8CY0dYdMXh2If/EBGfSQZsvbHDsBMbpi6Ukay/AUogcaWuq/UnEzZXeut1W/pYzA+M+4gpoXOM/lxkCVpagwOjEmVtd4Q9wGTG4MvZeoHCuL+ndivu6pG6Uoa7NPnkmF/aMH9WxWEdX65swtCtLoyaDpwHiT4skIL0rZFQLEHvWmqeGqxGaSBvmbV/mjxJ7M/qGJoV1UbV2puPOsH8CI3/UO0zqMdXsTXMwM1dPtOqDwp8Sc8dqljrBld3F5fnzAsKsja+JRNf1gUlev0fJI8Ya+Ox4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wesion.com; dmarc=pass action=none header.from=wesion.com;
 dkim=pass header.d=wesion.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wesion.com;
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com (2603:1096:400:26a::14)
 by TY2PPFC1C818470.apcprd03.prod.outlook.com (2603:1096:408::9e8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Thu, 24 Apr
 2025 10:14:50 +0000
Received: from TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0]) by TYZPR03MB7001.apcprd03.prod.outlook.com
 ([fe80::78dd:5e68:1a9c:36c0%4]) with mapi id 15.20.8678.021; Thu, 24 Apr 2025
 10:14:50 +0000
From: Jacobe Zang <jacobe.zang@wesion.com>
Subject: [PATCH 0/3] arm64: dts: Add board support for Khadas Edge2
Date: Thu, 24 Apr 2025 18:14:39 +0800
Message-Id: <20250424-edge-v1-0-314aad01d9ab@wesion.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA8PCmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3dQUoJihuZGBsUWipbFhkqUSUGlBUWpaZgXYmOjY2loAERtGuFY
 AAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 nick@khadas.com, Jacobe Zang <jacobe.zang@wesion.com>, 
 Muhammed Efe Cetin <efectn@protonmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=jacobe.zang@wesion.com;
 h=from:subject:message-id; bh=VDnYPDzu3Ky+EonvsBF+P+SGPStZjDNWfJrpJM8TG4o=;
 b=owGbwMvMwCXGEJfeJ5AmN4HxtFoSQwYXv+DG9+f+6OvkrcmumH9w2sVJf94IdwXU/AueujNCr
 dMxImxbRykLgxgXg6yYIovUMlGpCHfetK3L47/BzGFlAhnCwMUpABMRaGBkWJe05+7102uN+Lia
 bR4v19lXFK3uvon7steLcP5V04Ue6DP8j/0vrPXtsZab7Z3jf5zftS4oKpnuEaQ9X/b0qejc5So
 BnAA=
X-Developer-Key: i=jacobe.zang@wesion.com; a=openpgp;
 fpr=1AA6151A58470D66B5A75FF6005E678E10661E90
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To TYZPR03MB7001.apcprd03.prod.outlook.com
 (2603:1096:400:26a::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB7001:EE_|TY2PPFC1C818470:EE_
X-MS-Office365-Filtering-Correlation-Id: 802dcd2a-56b7-4cb2-60df-08dd8318d918
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUNYOUZHWWg1MzZuOEZNcU1adjcxOGgxb2d3VU44bGxuU1FGQnNMYlluN3p6?=
 =?utf-8?B?VE1wejJyakw0VG5rTENDaWhOYjZwdGFCS0hCZ3VNM1RNZnUwazRRZmpxZVVm?=
 =?utf-8?B?YndZQ2Q5U2R3OUdBOGVwd2ZEOTdxM2lRUS9xbW9SajMwanM4cWtKYWNmR2l2?=
 =?utf-8?B?dGpFd0ZsZE1NdnVGOTczSkJublZZeUN6M1BvZ3l5UXV1eUtkSGpRaVJFa1VZ?=
 =?utf-8?B?RlhEbStPMS9WSU9kTTYrc1Q0QkE3enNXZXVCZW9DQ0IyQ2RwYWNaTFNCY3pw?=
 =?utf-8?B?SmNiZHUwaEg5WTVZTXVCZlU5OUVRTGxkam13T1h2cVpFYzlDSEIxT1pJMjQv?=
 =?utf-8?B?QU4zOEhmK05ndTE4ZDJpR3gwVnkyMElmM2hDcTB4cGV6RStuNitZSmdCK0NR?=
 =?utf-8?B?SDBIcjNRQlNwcCtPeXhIenh6aGpJcXYrTU1JWWsxb0RaRFVDWVJYVUNvYWlZ?=
 =?utf-8?B?c3hZekJ1UjN2TDhIZFZmTzVSc0xTV3lFUTBFSW0zKysyOTBqRTlCTnU4Skgw?=
 =?utf-8?B?SURUc3pqZFFjaThRamlZcnRDUFFSaTdRQ3BLUG5pKzRQWU0wQTMwUm83cmdn?=
 =?utf-8?B?R3dENXhVLzZ6b2VGdHZIb2ZZWEY5OTF3bmpPY1JsUERPMVlLZ1lxc2hIcStp?=
 =?utf-8?B?VFlndjBoT2xMZnpyZUNLSFFRRkF0cGxhZ1JKYThvQ1hNSFlOcnphR3hmc3Bs?=
 =?utf-8?B?Q1YxRW96VkpXZHA0ZllIZjc5Rk9QZ29SRlMyUGNqQ3FNV0dPek1OYjJiUklv?=
 =?utf-8?B?L29QeG9OUEpJQUZnWHhvMVh3bE5xd2dMazJuUFlnTEhVc08vVEFyOXkvZjdZ?=
 =?utf-8?B?WGhpSEhiMm9uV2Y5UU5RTjJrQ3ZFUzk2c1F3NUJhK3l0U2ZRUmo4NjNCSFBt?=
 =?utf-8?B?L3RYdTlCckRweE5CVzcwTzVIamZOZkhHOWVoUWFYTnBaTXpkVGwrdXZwRjJV?=
 =?utf-8?B?MFI0WHhXYU51YUxna0ZYTUdnTGpWQnJTbjRET2ZGMElhZ1FtWWg5WSsxWk05?=
 =?utf-8?B?OFVUaHk0V21kUEkxNHl6NVAxVHF3TXZOTUhNdExzOGhob01OamhOdUYxMmlY?=
 =?utf-8?B?SEw3dEFYbE9LUjVxYUZ0QS9tOXVMeFU1cHk4NGdnNHFONXlhWjlRVnkzcXF1?=
 =?utf-8?B?aGlPUVE0OHhjN2xobVJqMnI0WVZSa1J2OTk0M2FzbnBZN2JqNENLcklYaVFP?=
 =?utf-8?B?ek05Tm1pT1FidHlsMVdFWHJYVUYxWmIzZnlXVU5lMDFYMVVaaXZmS0RpNmF2?=
 =?utf-8?B?eWVZY2FmVXM3NlpyWWJ6am1QRWJLZS9pdCsrVjlyQWdEb1pMVjJpM3d3Nlc5?=
 =?utf-8?B?bE9wakc3MmpHclZyMXJ1Vk40L1J5T29GVU1qR3hLTzhlOEF2dFlxc0JXQkti?=
 =?utf-8?B?SHhvWEdSVjJkakpyL0h2dTNqWUdTQmNnZTZ0dTBpSzdVb3JBK0UxaTZldEhs?=
 =?utf-8?B?SU9BZmtpSVVGdGdXUW5SOUhueGNndGVoYllvSEJnQWliTzNoTFRxdUhxWkNa?=
 =?utf-8?B?NTNxWVJuMkhTUHZpTEl4Nm05L09DbjBoRzc2UDBDVUVMNzJHRXZQRm9DV1NY?=
 =?utf-8?B?alR5dlErSGxIbldyaldwVnRzWWtPaXQzM1ZHY0htYXJmU0h2ZDRvWVBvMSts?=
 =?utf-8?B?RDZhZTE1TDFUZm9GS05KLzZFOFgxNGlwRjF5MHNLVXlwMmdNSWtJQmFzZEdm?=
 =?utf-8?B?WnF2WEI2VG5YblpPakg2NGVRZDUxYWVVNHVQTEo4S0hMSGFtL2ZPeE56SDJh?=
 =?utf-8?B?YXFDQVZnVVlOMWh2STRCM1V4SUM1Wnp1b0xjUmJDdnZ1QmhybXVKWnVRTkhl?=
 =?utf-8?B?SnBrSUg1c24zQldmTUIrT09ZV1RHcXFKU0Y2Sis0YklvLytpUDRESnJxNkYz?=
 =?utf-8?B?U3ZXMW9hOUZZbkhTTDl2SjA5VnJneGxUMGp5TVp0TXpIUHdyRzI5Y0JWQlNu?=
 =?utf-8?B?bkQrVFA2aHBvUkE3TER4NFlMbHlWMmt6RlRxN2wzWWhxaWdCdFUyRitFZ2hp?=
 =?utf-8?B?L0NaQkJGRHhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB7001.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXcrM2Fra0k0WktyL0pDWjRVUklpN2s3TGtmWUl3ZFNTaGExMm5BNWZRbE85?=
 =?utf-8?B?YXNZa0JjNWNxV0FFUnQrRFZoZ1g3UmphY3lZekFDSm94VUtQdklGMExYcHdv?=
 =?utf-8?B?TXVvUWo4cVI2cjZUQ01XWUdDT1h1aFVPanRtRE9VUWFsc2VzNUdpY3hMVFZn?=
 =?utf-8?B?Und4NzNxQ0k0ZWdjOHBNNnNqaU1wWEw5R0ozL0ZaQ0c2NVpPZGNVZHEra0Rz?=
 =?utf-8?B?MnQ5MDExRTFEQ1NXa1c0VU05S0p0THg1MjNSd3A4RHROOXIrSE9JOE9nQ29l?=
 =?utf-8?B?RnVYL1FKWXNadGdNRTBwMTJPMjIzYXFyNWJGcnF1ZE9NblhMOUZreXZBUnhI?=
 =?utf-8?B?b0NzZkVLR3g3VWgrZjFOdjZqL1duNGVXMitIUXVHU01INkVreXozNmVnMUJT?=
 =?utf-8?B?amhpcCtqVE90N095VHVFZktMQ1ZvWi80MEpyQWVhU0c2UVo0bjNvczRjT1hl?=
 =?utf-8?B?cWkyMFZvcUlJOTlDUjFoVXRKY3NCdURSVnBMS2xRbHJpeWhzTHVBazhjejNB?=
 =?utf-8?B?Q3p4TDB5NWpYZHRndUhVTVVpK2RXOW43WVRYYjZXdXMvRHUrVUVRQWdHaXhi?=
 =?utf-8?B?ODlJT0dGbFkvNlAvZnlnQ2h1Z1VxOGJiRVFMZVZnL2tNNHROOGd6di9Fekg2?=
 =?utf-8?B?RitTUEVZNXY4Z3ZDVHhEYURCWjBQWEMrY25nWmxrVU90ZXY1TmVpb3EyL0VL?=
 =?utf-8?B?dDNuOTZSRHdkOU9iYlBEdWEyM1B4OUwxTVJ2YVpGaVFrbFBIbzFzWHZtSGl6?=
 =?utf-8?B?R3NRbGw3TWZ1UlZIVWdNdVdvS1Y5K2Jvc283TUJYSHY0UXhPQ3ZmV1dUUy92?=
 =?utf-8?B?WUZ3a29OQVJNOVFFNHVnYktvUldRNHBCWW5sSmc3QWkwZEhaZG5kZXduMWRH?=
 =?utf-8?B?MDl5UVVwLzdCZUJPeG5OajBRSTRjTU1rMno5TzI5Nll3VHQxRE55bGt4a1FE?=
 =?utf-8?B?UFpISTBrb1JmN2psUzBaZW16cjl4Zko2MlQxQmo1c3NmYW1vL2hhY0JMNHA2?=
 =?utf-8?B?Y1dFV0gvNlZwa2Y0WE9FY29Ib01nMVZPbTRWcGY0TUNPWFUzUlhaRWd5dk5O?=
 =?utf-8?B?bTBNaDM2czRLVmhUbjB3U2VnWkNadjRRWWpyaWhJRnZneUVoK3Y3ODdHNDY1?=
 =?utf-8?B?Y3hTZmlKRUFKajI2cnE0L3pJTzZGVk5qL1NhYTdPajVMZytIbW5va3NuNHNs?=
 =?utf-8?B?K3o1RHFKRVFlMGJxTHFrVWZMTnJjTnBvQittSTVWQjRTMUxrOTNYeTVhS3Qv?=
 =?utf-8?B?TjZjdnB3ZkRsMVNKSFAvMGRhamthN28wRHNOZnduQVpsRFNRMXRFd0UxT2Zk?=
 =?utf-8?B?b2F5YmIrY1ZLaDV4Y05RV2V6QU8vSEg5WkJaY1VBamQxeDc4ZjZ6c0xSQ1Fr?=
 =?utf-8?B?MWVlWmZacVB6YjQ5OTBGS0NEaWNUY0Fra2FFUG5xTnRRZEdmeE1uVXB3dFlz?=
 =?utf-8?B?bC9lZWp0T2p1eHdWUnlJbzFuNFVIdUJicEtZYk02NWZSenY4WS9pK3JWbk5R?=
 =?utf-8?B?MThjYnJrdGllb0pWMEhqNElpRi9pMjMxaG91RCtQcHg5bDUzd3hneDhhTFFF?=
 =?utf-8?B?aUgxWW1qSTU1YXJnejc5cEJremhiUE1PekEzTVJKQUc4dUR6L2gxNmdpdTF6?=
 =?utf-8?B?VlJIREZmZG5mMVFMai9EY29vTTlWckE0VWd0eXpVd1BqRmhxeW0xQlkwejZH?=
 =?utf-8?B?aCtHRXZyVTFYci9saGJTYmd6aG1nd3BlaXhnTUJYTWkyUEthb0NKbVVUT0F4?=
 =?utf-8?B?NWwwQkQ0THZ4R3QvY2JZTndJWFIxb2FOUVFSQ3Bud3RTUHdnMzliZnZMOHpJ?=
 =?utf-8?B?bUdvTFBIcGNsOVlNOXdMMGcwY0VQSkF3cG50a2lBV0xlTyszMTdJUmlQRkw4?=
 =?utf-8?B?WXhlNXoxWE5JMWI2aXdMeklxMXZCYTg5enVFYXhUcDlrVkYxMkdRMWZlUkYw?=
 =?utf-8?B?QzhOblZ5R2xsalh5OWlJL2l2MWl5RkNuYkRrQmJlZzl2bHZna1B4OHZOcXBW?=
 =?utf-8?B?OU11MVp5ZmlCWjl3UDl2ekpaaEpnRHVZNDEzMGZsWXhHdTllMDRTYXUvL2RJ?=
 =?utf-8?B?VXNxNHdDUEIvazlTQ1o5eWMzSXdUcHh1bTcyWlFZZTV5SE5iYXBjTlVYTmhl?=
 =?utf-8?B?dFZJODJhUEs3MG5qOTdPN2UyRWVwYUhnQ1hVZlp4cDJ2b3JBcTl1eGc1NzhR?=
 =?utf-8?B?YkE9PQ==?=
X-OriginatorOrg: wesion.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 802dcd2a-56b7-4cb2-60df-08dd8318d918
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB7001.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 10:14:50.2891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 2dc3bd76-7ac2-4780-a5b7-6c6cc6b5af9b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UwmBT5lA38nlWBup0XJ8HwuApwMzABF1iHjG4zobeJJ/ZEIb2+ytTM2TeUY6Q/BWODzyXTpas5Zq8881OhcAqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPFC1C818470

These patches add board support as following:

- HDMI audio and display out
- BCM43438 bluetooth

Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
---
Jacobe Zang (3):
      arm64: dts: rockchip: Add bluetooth support to Khadas Edge2
      arm64: dts: rockchip: Add HDMI & VOP2 to Khadas Edge2
      arm64: dts: rockchip: enable HDMI out audio on Khadas Edge2

 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     | 77 +++++++++++++++++++++-
 1 file changed, 76 insertions(+), 1 deletion(-)
---
base-commit: 9c32cda43eb78f78c73aee4aa344b777714e259b
change-id: 20250423-edge-172038a931b9

Best regards,
-- 
Jacobe Zang <jacobe.zang@wesion.com>

