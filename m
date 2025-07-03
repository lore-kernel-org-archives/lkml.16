Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023118.outbound.protection.outlook.com [52.101.127.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA5D28FFEC;
	Thu,  3 Jul 2025 07:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751526379; cv=fail; b=HWVKbgsxuE4w9Ttyg+R2kmHXK3eNfaNL3mCgfxiqPvzwCSsY7Buc6SPvVF0CStE2UpndzgymCnEOC683OBxWiguE+qxxQ8Ks8IhXsD/W31cbCEO1heAHGHdrz/JVT0LGlSxHaqBl6tZ4J3UyQUnnJzm+oqFxG7CWSj9uQy1yLy8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751526379; c=relaxed/simple;
	bh=yCxMvTtcfogOxKwsZp/0NCqJ8kelujE47/nIsPBUfi0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rP2aS1IaKSDNVzNRYG8WjbUzO7I9zh7ttMKJQdRp/an95M/WBH5W5dLTewZgCAyMtC4uTMlp5JazETiBJ45cSXhoD2ojfJlydpiBc2s/RFqGoURLSeIXHzy3DmJ7wAF6hGIh5x2SkvT9NgjsrdUAQ5yMLeemVbeDBjnD9w1KlbI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=H+SiPIfZ; arc=fail smtp.client-ip=52.101.127.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="H+SiPIfZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xyNzcCX8TYLpKGt+tqMqeQVcWQ5xKFazrcKkDlx6r8xEnln2GVCaQTiGOL3p9Ssh+Qu1txWd9XJNSBXCStwZzMuNBJFSX8pG3YwsAa4nyvCZlOsYJl3sdqcImkDwJhyx8CGGI+C9Ubb0xM2Ma4h2cEbMddFx+fSTOUM5ALGvs/0djyt38pBqcJ9Z9htxXr3Hq/sr8yLkFgrgnQBAyhP19XKE2DCgZAlBybPwfn0kdlnAY51y+LyziOmdSi7fSMD6QeAEaqxBEBRVv8mpSy5uI/tPrg4OySyXt6P8dFdhOWeY1iBX7DfU0rjwzWk8ttUP+mA18aooVSxzIA6rqybRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvEDZP3qrIzdmdUmAy+LRLdiXjInEALuJ/RQ7Ax83Ng=;
 b=MUBmQ/ar8QfGVqnbHxrJNf65cjtKjmVae1sKAMyjkSSZBpzhCaMfWk8u04kkRspu+fUhToPpnrj1lttXiewMEd11yxJ8Njxz0MxTSfbl3vf+RV3zji7uH2+6qrot2BXhbraXK5wujMFxMNHBLxkLrc06J0t0W0JywEof8VHE5r/zNGyWHfYGmS6G3iSv0qZ5ubV3HsBAqhj0IRsy66KBHENjKitXta23/aDz98mISiEWC9trZm1bWKgkc1iZQWn20Udp9BnT6/KCnbzeAQr3XTZBFll7Jyvq3Y1n8SavzhnYFVVF3AXQeAc05opSGYnIkJvi1MhM5Y+5fPYzqcvqVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvEDZP3qrIzdmdUmAy+LRLdiXjInEALuJ/RQ7Ax83Ng=;
 b=H+SiPIfZJLzxDsqqiNYv+3YUpIABdry/sAbL4jyaZbTnSPzcUxo425sBeP/sOcuOiepchZ/Z7+EvkqYD36PsgHU6LMcerKxBrUJ/Xm9LSsnPScXMjULV5HV2NHP8zpt2Q72wIsJ8ZyQHJJPmCEZFQfMafaBCij8l2IOtmnxgCQkUHSFst7yjQ94NEKT3YvDvsck2eURblQwJH2/6yMkzc4q1bZuk5Z64b9HEY2HRmNJUj06TBlNW21fs3qMVPKz6zXzYjAXWyajgmpsT/07p47Q13ORAk+u2mvevdnXye5eIWNB1kf3YtsV0/6fvGxvd1fRPLRH5/+aRILsl80hIyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8266.apcprd03.prod.outlook.com (2603:1096:101:19d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 3 Jul
 2025 07:06:12 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:06:12 +0000
Message-ID: <10cc2b6e-fd23-4d77-9a86-5ea91bd68e3a@amlogic.com>
Date: Thu, 3 Jul 2025 15:05:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/26] clk: amlogic: pclk explicitly use CLK_IGNORE_UNUSED
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-21-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-21-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::18) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: a38087c4-0e03-4434-4717-08ddba0017de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UG9ZNk9janFsNWNSWTFxaFRjSmdjMVZsMFNwVUcxUTRZMlFwTm5kR0IyZmR1?=
 =?utf-8?B?YjR1SDJOV09PWEtxUTMzeTFmZXUzV3p6TUllL0JoMW1ud2J3LzU2RytGRlJj?=
 =?utf-8?B?eGRab1hTWjJCVlNTaEFjbUh5YTJ5Wk5zckpQakdzRlg2cGQ3aUc5YkMvUGw1?=
 =?utf-8?B?VHdVRit2N0NMNVA2cUhVTVhwdlluNHdHaldEMUlPV1VQV3huaFJnK2o1bytt?=
 =?utf-8?B?eHl4V1J6bm9WM25WOENkK1IzNkRpOEJpZlptYUxHSW1ObGRTd0pvWlZaYnVr?=
 =?utf-8?B?dGRXZkp6T0FOQVU1cDdyeXU5R0FMQVBuaTQ5WGtBbDJuZWNwRUh1REtGZXFt?=
 =?utf-8?B?UUVXK3pmNTBXdyt6dGtJUXg0QUtSSGJuVDhEQkpocXVsTmtFUWtsczMwdmZa?=
 =?utf-8?B?ditaWUFSZHVXQi9jL3FjcU4wVUJESjYyM1dzc0RwenNrVHMvOUhWL3U3VFBH?=
 =?utf-8?B?U0RwTjgwcEkwNGVlK3lrZ3o1dzlrVVZHRWZzWTBVd0MxbzJBSGs2QkhrQ25v?=
 =?utf-8?B?YVlKeC94LzJjb1M0YWl1RUxZVTFXSXlWY3pIdFVPK0Q1ai9JbnhiVHBGQ24r?=
 =?utf-8?B?a3U3bHNEOWIxRWNub0h6MVkweXZIUWdVK2haM1hiRmJLZlpkeER6OHhlUHdv?=
 =?utf-8?B?ZzJUS2hEOXBmb2dRTThuK1lXQ2ozZm5VMjJvNVBlL3M1RVNJbkZzUERaSFVa?=
 =?utf-8?B?OFRqR1lUSERVMjhMdlpJRGs5endqcGRkMi96czVBVzhsWndUOHBZWGhXS2Jo?=
 =?utf-8?B?V05lOTZQUjdFNGplRHFXSWRXOEh1ZDlIZnhQMG5WY085czZCZEdZL3pzdGs2?=
 =?utf-8?B?VEg1WUhPcEhsT0poNVFrUW9kRmZnMDJybDUva28xR3FRcGQ3R0Y4VmMxQVZy?=
 =?utf-8?B?cThZOFJ1cFcwQ0tDZjZuYUpjaktwRnREbGYvN29JdWs0aXpXNFRjOVcxRUND?=
 =?utf-8?B?UnZDU0RMSGN0bVdaRE1sMWZzalZGQ3ZkS1JWVit1YTR4dERjUFA2RURZcytv?=
 =?utf-8?B?d2FoaUpyaTRGS1pGZG5KN2JwdFo3aEg1eE9YQjFDRjQzK2w1RkhHRjJqdVZn?=
 =?utf-8?B?dExyMmRhS2dGMHpQRExldUVYN2pLR05YUHJFaHQwQmxqZGQvWFJDbEVMcnJx?=
 =?utf-8?B?WTVIY0RyV25vamFETHB1d2xiOGowOWk4N0Z0bGdYcTRaTGRqWTUrNmkwMkYy?=
 =?utf-8?B?WmpLTFVtSXNWQkNwZTFlVG5vZU95TjA0R0ovTUVNRXBGV01vMUp6RFdad1dU?=
 =?utf-8?B?NksrL253UEdMWk9jOXFGZEpaR2FMRXp6WVZCbldocjNHWHl4ZFQ0cEFJRUNy?=
 =?utf-8?B?Q0lQcHZmcHo4dW5pa2NpZEF2THpkS3JZR3MxNlJVUmdtdTJ4bXp4dVpneVZB?=
 =?utf-8?B?NVhRYkxoWjdzS1R3OUV1VE1JaU1rRTV6VytOajJPbmhORVEzN2lwanh1cHRl?=
 =?utf-8?B?RUNtYm95dXlKZlcxY1NuekdhYk8rbU81ZW5CMzhuWTFJTm42OVExUWZhTFlJ?=
 =?utf-8?B?blAwSXBQeFh5OGdwaVFYTTVQdlZ0V2laNUpZK1RBMWhzdE0zYjNmN1dZTDRT?=
 =?utf-8?B?VzFVeTEzREFEbVNUTkxQNTFDUG9OZWs0TlJBd3kxM1lkOFo1WmlRNXhTNmFn?=
 =?utf-8?B?MFF5VU1sZC9xL2YvYzB4V1pieFlYRkFsY2IvRi81bldabzRWcG92Z2VEN2hu?=
 =?utf-8?B?WEl4ZmxLQXZUM09XVDhRMzJGRzZEbFZOR2lFQTcwQ2svanFzcEpvNHZZdmZK?=
 =?utf-8?B?UFdNS0QrWVlMN3ZBdjFNVjkyWWdaeW5zbldxT3huL1AzS3BkNEM1Y1pmVEJw?=
 =?utf-8?B?WWV2c2Z2d284UmZpNkxZanM0YSszc05ESmQ1NmlWYW1QMDQxNzNFd2pGZSts?=
 =?utf-8?B?K0tGVzR6QWYwbGRZU2JHeVEzaG1SZEVWVEd1MGttZUN3VEZaMERvVjc3UENH?=
 =?utf-8?Q?dyV73dZgp/0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDlsV2dPamQvWm1zZHBQQnUyWkJxU3kyL3crRnQyWHNLY2dwV28zS3dBTXhP?=
 =?utf-8?B?bldoN0NpNnM2SjFlNFZzUkJnaHN6ek5tUjl0UEk2cU5Ja2x2ZlVQbHBWRU55?=
 =?utf-8?B?eVVmOXh4TG9jNy9kdzBURGN3L3dxOGVzeUhPem9TUG9KUmNQUzJWOVdRdXZR?=
 =?utf-8?B?SXZxb21tdlNhT1VUcFUxTm8vTm5wNTlrQkNCVmtVdEcwdzJ0STUzKzJSWlNp?=
 =?utf-8?B?bGdrRnJpQnJUR2plR0tBTTFnQzdmczVDNnhMNmQ0VUVVVWZOZXNobEFxTWFW?=
 =?utf-8?B?TU9PelQ4YUNzRkZlMHJXZFpGL1lJSy9hejByS3VwZXlsMXo3Q1BSYTl3MGt6?=
 =?utf-8?B?WHRNcThlaktFWkZNSG9KRU5GMnZLNm9WbDVZbnRhcUd3Tkp2OXE3bHB4Y0pw?=
 =?utf-8?B?Vk5rU0ZHMkZZd2hLU3YzRlcrdHpGeXB5TEhIb0liWFFzQ2JHVENGOVZlb1FM?=
 =?utf-8?B?VnpYUkoxOTQ5Nm5Cc1J1Wmxoc29KYzhpYmkxeDU3Z1hmeXRsaDRPWDRBVjZv?=
 =?utf-8?B?N1ROS2t2MXpDNE5CcG1EcmlJSVp3R2xkYWI2eUpVb3hGL0xOUTRFaHhySXlt?=
 =?utf-8?B?aHlqRUZ0cHVpbzJwcUhvWS9OL0h1RE9GemRHT2lKbFJ4YTM5V2pleVZOYUtP?=
 =?utf-8?B?Qk82aDBFME84cC9qeU1ZTFZsRVc4dkh3YkZ1d1FOSlhoYVJOWUg3N0tWd3FD?=
 =?utf-8?B?bVl2S1VLVExJZERaZ0s3TUlFY1RrNHFoLzdSQ3U3QU5MUG9wUkVnV01KM0Fs?=
 =?utf-8?B?NVp5eHc2VVpIYVNCcmN0RmVycllRcFp5VXFWNXRpMjVDZ3Mzd3hGYURpNlFC?=
 =?utf-8?B?cXU2eG1FMjQyeVVSRmJzRURickRubEhNdVdBem1oUGUwalVFbEwvZEYyM2Ir?=
 =?utf-8?B?WW90WXdENHR6Ym8wYXVRdmxOcUtmVFNxcHJsWXNTYTVXV25pWGxxYkFmeWRK?=
 =?utf-8?B?Z0ZJOVhHdmlVcGVzQkFuTHdLY1ZmUmNhRk5Hc0l5MU5FNkdYT1h6UDBVU2pQ?=
 =?utf-8?B?S0tRY1MzNzRTM09JMmp5UUVIcXN4NEdIVjhGWjgxMVlDdUZSR2dNVWVXcUNX?=
 =?utf-8?B?S0ROSm1CRkRNbkRVUkh5Zy9YTU9UQXA3K1FZMkNiTGxIMFkxUGNWY3l2ZXVJ?=
 =?utf-8?B?aGtrTFNzYlJZNndmc2s4cXRvOXdOYVUyZmZhdjk4VGxFMjQ2ZVEzY1BhOFlJ?=
 =?utf-8?B?ZmpycE1YRlUxTmpkMHB2dTluNFl6UFpFdHBSek9xallXN2NpSDJBUFZySGt1?=
 =?utf-8?B?cm0wZlRXSW1NTVo1b1ZZdUl2aFZtK2ljakk2TE5MTitVeEFMalVhRjlWajdn?=
 =?utf-8?B?ZnRlUGNIMFBmdmx4UWU5RXJOTVU2VFd6S3F4emJnZFNqMGhrZGRlSUVpbGxT?=
 =?utf-8?B?NDQyb0ZQZXRDS29qdWRKNEFDaGZHMDVTdGdrVGtGeFVza3VrNXBSV1F5ZUZT?=
 =?utf-8?B?YVV5NE9TZ0hjQ29ublhOQ21mTEpERE5JMkhJQ3lLRWx1azdQWDdCQmJzenRt?=
 =?utf-8?B?dklMZDdzZ1l0ZGE5M28xWWlnZWpDZWd4clR3bmdXL1Z6ZGJkbEI3Rk1jUFZq?=
 =?utf-8?B?UkFjR0lkdWFoR2ZBS3Q0TzlIM2RjaXVxdjhzOVF1TCtxSDFLQ0t0ZGY2L2Z6?=
 =?utf-8?B?Y3FZSW4wWG5NTVZLalZwOVdaNExuL2hXbllnRHllZG1QMFRnSlFNWFZoMEN5?=
 =?utf-8?B?OXYwSWlrdTliQmdvYlgzclo5V3dIaTEwMWNPYlUzemxJS2x2YTRqL283NTVW?=
 =?utf-8?B?bStZT0xETndSUWF6UVNKdENJc0x4ekRlejQ5YlNrdnRFRituL3ArUE1qZFpK?=
 =?utf-8?B?Kzg4UnA5cEJXdS8rUnZxOGRORDZvc0NUaUJJTlBwbjRXRVNNNlBhK2NyTGFB?=
 =?utf-8?B?c1hSUzZSYVJ6cks2eHhJaGs2ZFFmbjNTcEtSdlVIVUsvRGxYL3lnK0xlbmo1?=
 =?utf-8?B?Kzlha2JwNWZ0L3lOc0Q0R3dKNUkzYmxodHJ2VFV4UDhsRUJGczRRZmZwVkFY?=
 =?utf-8?B?QmVVbnllb2RGQk8vQWlzNzNwdFBDYkI1dnl4cFhvcERKRmV1RURDdUpYdzN0?=
 =?utf-8?B?blpWRzlFZFZURnNXa3JRbDlZWkhKQ0RVUERjTjAxU1loNmFZQW5idlBxaGF5?=
 =?utf-8?Q?d9R6rzqHVvKKLv5C035QiaR62?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a38087c4-0e03-4434-4717-08ddba0017de
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:06:12.1200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xc2xxbcD7vaoldcSal7ajc7rtjR9a/rrWGa3kA93HZQi9AD6md/aHVb6mHusIptebohRHfZNpR0aQjEWOdlkKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8266

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Every usage of CLK_IGNORE_UNUSED should be explicitly motivated and
> documented. However, the PCLK macros used by most Amlogic platforms are
> adding that flag systematically. Because of this, all pclks are marked with
> CLK_IGNORE_UNUSED, without any form of distinction or motivation.
>
> This may have been fine in the early days of CCF but it is not anymore.
>
> Just removing the flag is not an option at this stage since it could cause
> regression on existing platforms.
>
> Instead, drop the flag from the macro definition and add it to the each
> clock definition, for the existing clocks. This makes quite a nasty change
> but it will make it a lot easier for people to contribute to fixing the
> problem, clock by clock. It will also prevent new platform from being added
> with a silent use of the flag.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/a1-peripherals.c   | 125 ++++++++++++-----------
>   drivers/clk/meson/axg-aoclk.c        |  18 ++--
>   drivers/clk/meson/axg.c              | 110 ++++++++++----------
>   drivers/clk/meson/g12a-aoclk.c       |  49 ++++-----
>   drivers/clk/meson/g12a.c             | 176 ++++++++++++++++----------------
>   drivers/clk/meson/gxbb-aoclk.c       |  16 +--
>   drivers/clk/meson/gxbb.c             | 188 ++++++++++++++++++-----------------
>   drivers/clk/meson/meson-clkc-utils.h |  12 +--
>   drivers/clk/meson/meson8b.c          | 183 ++++++++++++++++++----------------
>   drivers/clk/meson/s4-peripherals.c   | 119 ++++++++++++----------


for 'drivers/clk/meson/s4-peripherals.c'.

Reviewed-by: Chuan Liu <chuan.liu@amlogic.com>


>   10 files changed, 528 insertions(+), 468 deletions(-)
>

[...]


> diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
> index fc1500df926d056ce17252987dd91095a8399b55..23b51d84d8de40aa540dbc6dd5db9fb627e579de 100644
> --- a/drivers/clk/meson/s4-peripherals.c
> +++ b/drivers/clk/meson/s4-peripherals.c
> @@ -3165,61 +3165,70 @@ static struct clk_regmap s4_gen_clk = {
>          },
>   };
>
> -#define S4_PCLK(_name, _reg, _bit) \
> -       MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw)
> -
> -static S4_PCLK(s4_ddr,         CLKCTRL_SYS_CLK_EN0_REG0, 0);
> -static S4_PCLK(s4_dos,         CLKCTRL_SYS_CLK_EN0_REG0, 1);
> -static S4_PCLK(s4_ethphy,      CLKCTRL_SYS_CLK_EN0_REG0, 4);
> -static S4_PCLK(s4_mali,                CLKCTRL_SYS_CLK_EN0_REG0, 6);
> -static S4_PCLK(s4_aocpu,       CLKCTRL_SYS_CLK_EN0_REG0, 13);
> -static S4_PCLK(s4_aucpu,       CLKCTRL_SYS_CLK_EN0_REG0, 14);
> -static S4_PCLK(s4_cec,         CLKCTRL_SYS_CLK_EN0_REG0, 16);
> -static S4_PCLK(s4_sdemmca,     CLKCTRL_SYS_CLK_EN0_REG0, 24);
> -static S4_PCLK(s4_sdemmcb,     CLKCTRL_SYS_CLK_EN0_REG0, 25);
> -static S4_PCLK(s4_nand,                CLKCTRL_SYS_CLK_EN0_REG0, 26);
> -static S4_PCLK(s4_smartcard,   CLKCTRL_SYS_CLK_EN0_REG0, 27);
> -static S4_PCLK(s4_acodec,      CLKCTRL_SYS_CLK_EN0_REG0, 28);
> -static S4_PCLK(s4_spifc,       CLKCTRL_SYS_CLK_EN0_REG0, 29);
> -static S4_PCLK(s4_msr_clk,     CLKCTRL_SYS_CLK_EN0_REG0, 30);
> -static S4_PCLK(s4_ir_ctrl,     CLKCTRL_SYS_CLK_EN0_REG0, 31);
> -
> -static S4_PCLK(s4_audio,       CLKCTRL_SYS_CLK_EN0_REG1, 0);
> -static S4_PCLK(s4_eth,         CLKCTRL_SYS_CLK_EN0_REG1, 3);
> -static S4_PCLK(s4_uart_a,      CLKCTRL_SYS_CLK_EN0_REG1, 5);
> -static S4_PCLK(s4_uart_b,      CLKCTRL_SYS_CLK_EN0_REG1, 6);
> -static S4_PCLK(s4_uart_c,      CLKCTRL_SYS_CLK_EN0_REG1, 7);
> -static S4_PCLK(s4_uart_d,      CLKCTRL_SYS_CLK_EN0_REG1, 8);
> -static S4_PCLK(s4_uart_e,      CLKCTRL_SYS_CLK_EN0_REG1, 9);
> -static S4_PCLK(s4_aififo,      CLKCTRL_SYS_CLK_EN0_REG1, 11);
> -static S4_PCLK(s4_ts_ddr,      CLKCTRL_SYS_CLK_EN0_REG1, 15);
> -static S4_PCLK(s4_ts_pll,      CLKCTRL_SYS_CLK_EN0_REG1, 16);
> -static S4_PCLK(s4_g2d,         CLKCTRL_SYS_CLK_EN0_REG1, 20);
> -static S4_PCLK(s4_spicc0,      CLKCTRL_SYS_CLK_EN0_REG1, 21);
> -static S4_PCLK(s4_usb,         CLKCTRL_SYS_CLK_EN0_REG1, 26);
> -static S4_PCLK(s4_i2c_m_a,     CLKCTRL_SYS_CLK_EN0_REG1, 30);
> -static S4_PCLK(s4_i2c_m_b,     CLKCTRL_SYS_CLK_EN0_REG1, 31);
> -
> -static S4_PCLK(s4_i2c_m_c,     CLKCTRL_SYS_CLK_EN0_REG2, 0);
> -static S4_PCLK(s4_i2c_m_d,     CLKCTRL_SYS_CLK_EN0_REG2, 1);
> -static S4_PCLK(s4_i2c_m_e,     CLKCTRL_SYS_CLK_EN0_REG2, 2);
> -static S4_PCLK(s4_hdmitx_apb,  CLKCTRL_SYS_CLK_EN0_REG2, 4);
> -static S4_PCLK(s4_i2c_s_a,     CLKCTRL_SYS_CLK_EN0_REG2, 5);
> -static S4_PCLK(s4_usb1_to_ddr, CLKCTRL_SYS_CLK_EN0_REG2, 8);
> -static S4_PCLK(s4_hdcp22,      CLKCTRL_SYS_CLK_EN0_REG2, 10);
> -static S4_PCLK(s4_mmc_apb,     CLKCTRL_SYS_CLK_EN0_REG2, 11);
> -static S4_PCLK(s4_rsa,         CLKCTRL_SYS_CLK_EN0_REG2, 18);
> -static S4_PCLK(s4_cpu_debug,   CLKCTRL_SYS_CLK_EN0_REG2, 19);
> -static S4_PCLK(s4_vpu_intr,    CLKCTRL_SYS_CLK_EN0_REG2, 25);
> -static S4_PCLK(s4_demod,       CLKCTRL_SYS_CLK_EN0_REG2, 27);
> -static S4_PCLK(s4_sar_adc,     CLKCTRL_SYS_CLK_EN0_REG2, 28);
> -static S4_PCLK(s4_gic,         CLKCTRL_SYS_CLK_EN0_REG2, 30);
> -
> -static S4_PCLK(s4_pwm_ab,      CLKCTRL_SYS_CLK_EN0_REG3, 7);
> -static S4_PCLK(s4_pwm_cd,      CLKCTRL_SYS_CLK_EN0_REG3, 8);
> -static S4_PCLK(s4_pwm_ef,      CLKCTRL_SYS_CLK_EN0_REG3, 9);
> -static S4_PCLK(s4_pwm_gh,      CLKCTRL_SYS_CLK_EN0_REG3, 10);
> -static S4_PCLK(s4_pwm_ij,      CLKCTRL_SYS_CLK_EN0_REG3, 11);
> +#define S4_PCLK(_name, _reg, _bit, _flags) \
> +       MESON_PCLK(_name, _reg, _bit, &s4_sys_clk.hw, _flags)
> +
> +/*
> + * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
> + * Users are encouraged to test without it and submit changes to:
> + *  - remove the flag if not necessary
> + *  - replace the flag with something more adequate, such as CLK_IS_CRITICAL,
> + *    if appropriate.
> + *  - add a comment explaining why the use of CLK_IGNORE_UNUSED is desirable
> + *    for a particular clock.
> + */
> +static S4_PCLK(s4_ddr,         CLKCTRL_SYS_CLK_EN0_REG0,  0, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_dos,         CLKCTRL_SYS_CLK_EN0_REG0,  1, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_ethphy,      CLKCTRL_SYS_CLK_EN0_REG0,  4, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_mali,                CLKCTRL_SYS_CLK_EN0_REG0,  6, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_aocpu,       CLKCTRL_SYS_CLK_EN0_REG0, 13, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_aucpu,       CLKCTRL_SYS_CLK_EN0_REG0, 14, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_cec,         CLKCTRL_SYS_CLK_EN0_REG0, 16, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_sdemmca,     CLKCTRL_SYS_CLK_EN0_REG0, 24, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_sdemmcb,     CLKCTRL_SYS_CLK_EN0_REG0, 25, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_nand,                CLKCTRL_SYS_CLK_EN0_REG0, 26, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_smartcard,   CLKCTRL_SYS_CLK_EN0_REG0, 27, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_acodec,      CLKCTRL_SYS_CLK_EN0_REG0, 28, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_spifc,       CLKCTRL_SYS_CLK_EN0_REG0, 29, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_msr_clk,     CLKCTRL_SYS_CLK_EN0_REG0, 30, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_ir_ctrl,     CLKCTRL_SYS_CLK_EN0_REG0, 31, CLK_IGNORE_UNUSED);
> +
> +static S4_PCLK(s4_audio,       CLKCTRL_SYS_CLK_EN0_REG1,  0, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_eth,         CLKCTRL_SYS_CLK_EN0_REG1,  3, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_uart_a,      CLKCTRL_SYS_CLK_EN0_REG1,  5, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_uart_b,      CLKCTRL_SYS_CLK_EN0_REG1,  6, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_uart_c,      CLKCTRL_SYS_CLK_EN0_REG1,  7, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_uart_d,      CLKCTRL_SYS_CLK_EN0_REG1,  8, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_uart_e,      CLKCTRL_SYS_CLK_EN0_REG1,  9, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_aififo,      CLKCTRL_SYS_CLK_EN0_REG1, 11, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_ts_ddr,      CLKCTRL_SYS_CLK_EN0_REG1, 15, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_ts_pll,      CLKCTRL_SYS_CLK_EN0_REG1, 16, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_g2d,         CLKCTRL_SYS_CLK_EN0_REG1, 20, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_spicc0,      CLKCTRL_SYS_CLK_EN0_REG1, 21, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_usb,         CLKCTRL_SYS_CLK_EN0_REG1, 26, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_i2c_m_a,     CLKCTRL_SYS_CLK_EN0_REG1, 30, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_i2c_m_b,     CLKCTRL_SYS_CLK_EN0_REG1, 31, CLK_IGNORE_UNUSED);
> +
> +static S4_PCLK(s4_i2c_m_c,     CLKCTRL_SYS_CLK_EN0_REG2,  0, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_i2c_m_d,     CLKCTRL_SYS_CLK_EN0_REG2,  1, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_i2c_m_e,     CLKCTRL_SYS_CLK_EN0_REG2,  2, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_hdmitx_apb,  CLKCTRL_SYS_CLK_EN0_REG2,  4, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_i2c_s_a,     CLKCTRL_SYS_CLK_EN0_REG2,  5, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_usb1_to_ddr, CLKCTRL_SYS_CLK_EN0_REG2,  8, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_hdcp22,      CLKCTRL_SYS_CLK_EN0_REG2, 10, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_mmc_apb,     CLKCTRL_SYS_CLK_EN0_REG2, 11, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_rsa,         CLKCTRL_SYS_CLK_EN0_REG2, 18, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_cpu_debug,   CLKCTRL_SYS_CLK_EN0_REG2, 19, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_vpu_intr,    CLKCTRL_SYS_CLK_EN0_REG2, 25, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_demod,       CLKCTRL_SYS_CLK_EN0_REG2, 27, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_sar_adc,     CLKCTRL_SYS_CLK_EN0_REG2, 28, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_gic,         CLKCTRL_SYS_CLK_EN0_REG2, 30, CLK_IGNORE_UNUSED);
> +
> +static S4_PCLK(s4_pwm_ab,      CLKCTRL_SYS_CLK_EN0_REG3,  7, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_pwm_cd,      CLKCTRL_SYS_CLK_EN0_REG3,  8, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_pwm_ef,      CLKCTRL_SYS_CLK_EN0_REG3,  9, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_pwm_gh,      CLKCTRL_SYS_CLK_EN0_REG3, 10, CLK_IGNORE_UNUSED);
> +static S4_PCLK(s4_pwm_ij,      CLKCTRL_SYS_CLK_EN0_REG3, 11, CLK_IGNORE_UNUSED);
>
>   /* Array of all clocks provided by this provider */
>   static struct clk_hw *s4_peripherals_hw_clks[] = {
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
