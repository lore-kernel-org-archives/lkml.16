Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sg2apc01on2138.outbound.protection.outlook.com [40.107.215.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E533F63CF;
	Mon, 14 Apr 2025 03:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.215.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744601530; cv=fail; b=AY8olSanM3nPGgOFa8NSIT8yzJYOo8ueiMJcpuQ1+q4S+maIek5MollpqhIg+7ECyTaeMkXUu+XZqm+g06lBN7frV1hFJm+u8J6CYh/URAs9NOanK8qP8V0vPnatb3s9/qgdi5Vef+g0qpWXlXB+rWgoaSDYvaffRQ3wmL9m5qM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744601530; c=relaxed/simple;
	bh=D9wraj4SPEK2xoo1m/AonG0BQBfFlV9JH0wmmDKKvP0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HXi6j/VombdFnulSnQalWWWcU6HpWdxtsppIbYGqWrGMOvTlfwJW+oHE3TbxQhVuqs4+z7dT6zovj8DPbmkjJsA6/XeqYgfn0YZsi19xYIr1qawYHLTVc7e3Nxcx+35DKiiJ9h2TwAW1Ut5x0hvuKQOkQv0FFVQQejUq6allKRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=l4nSH49A; arc=fail smtp.client-ip=40.107.215.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="l4nSH49A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cSErXmdaf7u3U2qYRmCnxTuHnmH/SV4AprtKhW3uZhBpjyG1pMChz2zmG2R/QtRyic41CpYHye6Bd87tnafDskVop/lo/9UQTykm+yg/CRCexdfJ5uC/RF0hFi0KUUFnK+n4jkM/8L/+/BnGT0ziM9MZ2Lvtf0b/FoeSuVZKbHyQjv98tTO1aBnbo7qPSYeM8n6IZetsUpXu9lJ7lTiz6UvJkbiAaTFdfOUFzR66OKDC55JA24AdLZO6vRNBCuaZB3XNEIXQgtT8sdI02c/Fd8JPZ9eq71Ch0qFUKkx9Jnw8aYWTIG8y0NYb8c/A9mku4J+tnzjxK7H7mHE/O8OLSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV7fg5wOUgk0fyr8x5AtY6A5+CAPZb129BqzOiqDu0s=;
 b=vh3VrnE2vaX6g8ka+QJFbevmvtw+dJj2DFUwtER2T4492UYi0xRoC+fiZuguv7MJ+ySjqjMsQkFFj/qlA4bKlFTB9zl1UXEva/FtBA/47VmZB5FK8A2xcTCxlFiW6YKMV5k7BQkG5/YB9YGx8l24SM+3zAxFWoOYRbA89I+zw0kTUmNorfu8VBdlw4iSWwq48+8mTtuoNkqUvqY6hD2hZu8FVbfihH2ZRqZ4NVa8ixtvLtxqg2VxFL8hNwqY5yxWPcy9JLYhvwB6JbaurV5oeFXQHyUDL6ab7r0PrVb+N2yX26Dqd/o3l/v2jU5xWS+lCnC860i1m6J/w8hY8MjUmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uV7fg5wOUgk0fyr8x5AtY6A5+CAPZb129BqzOiqDu0s=;
 b=l4nSH49AZY7pAlXRMS7ZC1sMYDvN4UvGke0dnbOQEW0MoOhO/GqdgCttIImpVAn/r7Hpz+k3nro6w/vD2ewnFYmX8YSgNR1cmHYEPw2g5jLtcY9rpBTIIRdx5DG5Vptre95h85EQWolMVmrYYxRE0rWwi1ZeJnTIW699s18AvGDkB8VYTU4zwm+Z2zkvCg70pZpNnIKkK8lUz04NHJQcT7RbDqiZMxN4nTkCkk/yStvvfqx9pcxvxzH4q2QXO3xfFugQDjnWSS1Yt5mxmw6ufbkx4iszALsuAXq5THJfGYQE4aSTl/YvM/oXt5S66R21GBe762RRM61kPfeJzGRWRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by PUZPR03MB7064.apcprd03.prod.outlook.com (2603:1096:301:11f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 03:32:01 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 03:32:01 +0000
Message-ID: <c6072fa7-9cb0-445f-ba6c-58a950bda2f3@amlogic.com>
Date: Mon, 14 Apr 2025 11:31:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] soc: amlogic: clk-measure: Define MSR_CLK's register
 offset separately
To: neil.armstrong@linaro.org, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250411-clk-measure-v1-0-cb46a78d019a@amlogic.com>
 <20250411-clk-measure-v1-1-cb46a78d019a@amlogic.com>
 <9f10bc53-10c8-4312-b7f7-2935990fb193@linaro.org>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <9f10bc53-10c8-4312-b7f7-2935990fb193@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|PUZPR03MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aea7fdb-76d7-407f-8cd3-08dd7b04eadb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MC9mdENEeTZrdklxZDNpMm9PS2FsZDNUVU5KNG9ZcWxiQVZSNFRvRVlrL0xw?=
 =?utf-8?B?bkxpTVh0SEhFK2FSN29MbDdTei8wK0JORFBuRHJaS1BEYXpzNGdhWUQvUUVJ?=
 =?utf-8?B?b3lraWwzV3djRlY4S0FVeEk3NStJWFRQQ2pxeDFzQUVrQlFKUmJpU1ZJcDlw?=
 =?utf-8?B?Z01ZQWNNUXVnVXFBcnV2R0VlMGdNMGNkN01QSFhFZkhsdkdCNSsvY3VKNmU0?=
 =?utf-8?B?V0N3Ui9Iak43anZ3OWlTRUdpRDlVempab3ovUGt3Qk1RVkFjbE9VUVRkRlg2?=
 =?utf-8?B?aGwrblA4VFl1T3NyOGRxRWR2aU1zNGJaMHVrRGpNL3JDOWpDb0xzWVpKcGtJ?=
 =?utf-8?B?cVpBcndHQXVvSk9sZXVldzdsN3NmSG5VdjNvZzZHZXRXaG5KVVNjVmdjMWt5?=
 =?utf-8?B?SU54UmtDWXFlVXl6OWRJR0Z4eG4xS1VpbGgwLzhuMWpwRHRyRWtGOVFRVktv?=
 =?utf-8?B?RllnN0RjdmxUcUZtS3FndnNESUlTUkJ6VVhxeFY5alJwWEprQXk0cFYzblo4?=
 =?utf-8?B?Y1NpZkhaRXY2WXVORGJMRFgwVVYybk14NFduY0hmMWQxaG9UUzU2OUhndjda?=
 =?utf-8?B?cHo5UDdqMHhlcFoyeUFQN2xETFVQL3hHOWtQMHlzaE14Z011K0dIYVFDUElu?=
 =?utf-8?B?WVYwNHp3bzA5M0hYUG9HL1Q0cHhLelBTR3NLY0V3VmpuWG9OdzJBS2lsd0lZ?=
 =?utf-8?B?UlFFUmw2UEtRWVAraW0yNkxtNUNXMlAzWnNQaGtOK1NULytFdFk3Ny9ERlhS?=
 =?utf-8?B?N1V2M3dHZVNxdnRZVWVBYmt0WENqWWljT0FsaHVGUlJnanJGWDN3WlhKVDhI?=
 =?utf-8?B?VlR5RXUyTHhYOVUraDNPMkpwdzJUNk1jQ0g2NzJBQnRzUlRwSi9oT0RxSnZv?=
 =?utf-8?B?dU5seVVSVHlBdXJzR3BYamljL2N6b1lXdE5iS1IxV0lzRHNobWNDNENuRVZh?=
 =?utf-8?B?dHFjT1RSSjdSdEZBdnVQdXM3bCtORVpLN1RqMzhtL21XZENRZjFxL3NaNjhS?=
 =?utf-8?B?dVVNckM3b216NTRVYXZkd3N4azIrV1JvL0dDUHdwNExwSGVCeTVkcVRWK3dp?=
 =?utf-8?B?Rm5sMmV4UGFZKys5RjJXWGNoY2E5OWIreXJtdEhNN0hSSSt4Qy96VCtuM3BR?=
 =?utf-8?B?R1dzdHF1aDlpM25acHpleXdhbmNhbmgvM0ZwUUZBbnZnUHNXaTNuaVBOSmww?=
 =?utf-8?B?RmVHOURSOVdOMmczT2tHZ1dMR2QyOTZweGtQOVY0Vk9IMzE3VzIxdEtqcWhu?=
 =?utf-8?B?UEFoTDNnZlVmb1puZHRyYkFQQjZTYWN4NVgwWmxMNjVyZ3RSeXdJM3pwa3ZJ?=
 =?utf-8?B?TG12NHVHZW5WdlVYUXNYY2R2WHN2eVgrYzJQS3RRbjBYRmU0MUZSTUVhbVl6?=
 =?utf-8?B?ai9pSG1MNC83NWpkV2x4NG1BakhEaEtFWlBrRVBydHpVRnl1OUpqMndabFEv?=
 =?utf-8?B?c1AraGUyNGxqK2wvaVhHa0J5dHIycHdneVI2bHA5YUo1WVpnN0t3bjhiT21I?=
 =?utf-8?B?YmI1Y3lhUXdDbTdqVTBGN05EMzJUcGZQNTk1enR6dElHNjd3eUQxLzRuY0dZ?=
 =?utf-8?B?SmNvZ2ZIUytjcHA4QWVEd2MzNklJK1lsTG1KSlNDL1ZRc2Q2R2Z4VEFuWUZU?=
 =?utf-8?B?Z2JvaUs5NzhIdDlnTUl3ZEJtVkxhYzJZZVAvSmtLYU5KYjF2UjNvdENoa0Zj?=
 =?utf-8?B?WC8yNmd2NW9acm0rWW9kM2NGT1pLV2R5V0pGMTQ3Y0pVSm5valJKSllTZ0l2?=
 =?utf-8?B?YnU5d1pFYkgwdWJOK3dzNDV4TCtpYXFwVG5RaUtQSEoxM21EN0NVdmVOR2VV?=
 =?utf-8?B?MjRVN2o0SkVncW1RUjlDeVFXRlEvbVltVVd3MlFrL0xJWHJ1TVVsdGw2M1NP?=
 =?utf-8?B?dEZKa3N1ZVNtVURxRmlvanphNGQ2MEJkV3RZK2JkcjMyOXhHZUtVS3haWmMr?=
 =?utf-8?Q?j4c2mFHCquk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUtrR2pGK2Rmek52d2RHM2ZVU01wRVVSSmtXNEVBRmhteWtQMXFqWTI2VEk1?=
 =?utf-8?B?QlJSUE4rN3h4d3dJTEluQzNyaXMxNXI1b0s1L1h6K25LOS91NHQyaWZtOXNT?=
 =?utf-8?B?TGV4eVcvS2RycXRpZTliNFgrbWNWelExWHNRek1iRTc0OWdJZWt2dm9RTFAw?=
 =?utf-8?B?blpTSEUyL3I3RldSUUUreGI5RTNPdUR3NTJ2VUxHZVp3QVBRUHVBWVN4WjNo?=
 =?utf-8?B?MGJaNzRTekNvak9HTjdyKzVPTlhxbU03NHFUdllzTVRZZGxlbFlBSWNKNmFP?=
 =?utf-8?B?Y2JmcVJCeWQrdWQyczVWZHpRcUw4OFUvc1o5WFNHRWhycDBqVGIvdVZTSzRh?=
 =?utf-8?B?a3F0c2ZKbWFCcG95Z2F6c3U1QkNWZUd1SUE2OHdQbzRxRWZyM0N6Uk1xSDY0?=
 =?utf-8?B?OWpBVC9RRnI1M1NOU2NaUjUyeXFVQ0tWcTNzWkczaXZqbDNhOHFiS0ZFVnNx?=
 =?utf-8?B?YzgyWko3ODM0bkprVGhmcjBOUXF1cmRaRmRjU2J6Zjl3Z2VoMi9MM00zYmVT?=
 =?utf-8?B?S3ptanFlZ2dOQ01xT1NVZldjRnlEdUs5aldZSkZlWXhrblVwWnVrS200MEFx?=
 =?utf-8?B?VDFmZHZkUWhLVWRFckd0Z2VwdVNQVGVOYUFSUEV3MVVEWk1IV21nbVNISlJl?=
 =?utf-8?B?VXI2OE9xVmFxdlg4bzA3OFRrM0NVeENTekxCaU1KSml6ZTQ5Q29hUFVSUU1w?=
 =?utf-8?B?NFgweTRXRFJZK0ZCVzVJY29VR0pUYjZwY3RqRXhFeVdOQlJYbzU4VTJMaWxM?=
 =?utf-8?B?WCsrektKM2EweEtSWU1YVnFmb0pXdlY0dTRQQ29jdzhWRTFDcjlwbVZ5NHZ4?=
 =?utf-8?B?NThFbnRKRk1vZkQxakRJNFhRUXRGNlVtcVJsQ1ErYWY2dVIxb0lBbnFvUmxS?=
 =?utf-8?B?YUZ4M1cyUG5mUm5DeTN6Vm54b0tMa3QxOFQ0Y0M3cUFsTFZhWlVlRTI3djYw?=
 =?utf-8?B?L0lWdnM0ZHpCaVdmd3NtbnREbUxhQnowMTRleGJxS1JMdDQ5cmVTLzNiUVBu?=
 =?utf-8?B?dk9MQ1VweG5DSmdrSXlVaE9XQXQ4QzI0Vy9xZGdWc21MSm91NWowSWRTbWE5?=
 =?utf-8?B?SVREbFllN1E4enFMOFY0QUtqdGJSbGxYRDBEcGFLZlJCUGg0V3JYM3RWMEhm?=
 =?utf-8?B?L0V1Y3h1M2wzWGJYb2QvQ1VYOXFxYXU4UXF1ZlAwUjN5ZS82ajBCK1gzbGE4?=
 =?utf-8?B?eXNYVmgydy8zUlIrakV3SHd5ZGg2Y2RKSUtZaVFTTXd4M0FNQTF5c1licDlN?=
 =?utf-8?B?RGlSWFdQNk1LZ0d4KzlteVczczBFZktaNkVYN3UwbjhRbUh1TW5DdGRRNHNL?=
 =?utf-8?B?NERJYTlYSFRGWWl3RHAzZTl5Vmlnb2I1UDcrdXpkVkRzbHE4eFpCZ3FkNjli?=
 =?utf-8?B?dEhRVGM0ZjVIeUM4TGp4dTJNU3E3dkdNd0pwSE1aQzY2WjVqQi9TeE1PbUhz?=
 =?utf-8?B?cG9YY0U1ckNDaVdNa0hRK3BtWWllajNKV0hVQ01yUEo3Q2JqOXdVSFlwTjdh?=
 =?utf-8?B?azBabW1ublZnRllidnVReGI3ejJiM3NnYTF2M29nZFl2bHIwam1IOW9xdk82?=
 =?utf-8?B?M0NhMWQ2UmlOSWVFaWwwcjJmSGlhQm05V0hzejZKaHc4R3lrWDRUblBWOVFq?=
 =?utf-8?B?ekhBNUkrYzRycTlRV3dyOWp6U2xGY3psVjM0QWdzTCs1TWw0ZEd6NVBvWnNs?=
 =?utf-8?B?SFN0VEFqbWZBN3M1MFpPTXlsSGdBQ2hqTnlWSGlhM2E3Y2tJSkkwZjVQNEF2?=
 =?utf-8?B?M1lJTjhEeUhYRCtKcGZyZlBBUi81dmo3QVJQSERHSVEyK2oyTERBOFNnVjJ2?=
 =?utf-8?B?d3hMY1h5YXlmNThWRHdia1FsU1BVanFTenR5aVA4YVVOWXY0V2hhaXd3Qmto?=
 =?utf-8?B?SW1NSDZxOXVxaU9oQ0hvRTFTWWxyQ3JqQWdTUGFxUnRJWHZFMEVyR2U1SC83?=
 =?utf-8?B?RE1nOXVWUE9VaTlLd0RtY3VtL3RWb2g1UUx2ZTVjYmQveS9MekF0STlzdy91?=
 =?utf-8?B?RkF6UCtpYStrbmZ1T2h0WjJZVU9YaFFGM3RFV0I3dVo2N29YMHM3dTd0T2lK?=
 =?utf-8?B?QkRDbjZvQU5WQWpJcXcxYWRpRTFVNnVnaHBBVlVJalFxZnY0Y2dYSUdjODhy?=
 =?utf-8?Q?Sa5bFhFzD+4X+bO2Y5KMlbqiI?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aea7fdb-76d7-407f-8cd3-08dd7b04eadb
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 03:32:00.9383
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHXIH1vJEN1aHyS13xiCAeqrrD1sxgxXbpSJHnBpWRacduURymOfDj8As9BYf36366YVqphlFyBy5s4/MNfM2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7064

Hi Neil:

     Thanks for your suggestion.


On 4/11/2025 9:31 PM, Neil Armstrong wrote:
> [ EXTERNAL EMAIL ]
>
> Hi,
>
> On 11/04/2025 14:42, Chuan Liu via B4 Relay wrote:
>> From: Chuan Liu <chuan.liu@amlogic.com>
>>
>> Since the MSR_CLK register offset differs between chip variants, we
>> replace the macro-based definition with chip-specific assignments.
>>
>> Change the max_register in regmap_config to be retrieved from DTS.
>>
>> Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
>> ---
>>   drivers/soc/amlogic/meson-clk-measure.c | 70 
>> ++++++++++++++++++++++++++-------
>>   1 file changed, 55 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/soc/amlogic/meson-clk-measure.c 
>> b/drivers/soc/amlogic/meson-clk-measure.c
>> index 39638d6a593c..30387d26307c 100644
>> --- a/drivers/soc/amlogic/meson-clk-measure.c
>> +++ b/drivers/soc/amlogic/meson-clk-measure.c
>> @@ -14,11 +14,6 @@
>>
>>   static DEFINE_MUTEX(measure_lock);
>>
>> -#define MSR_CLK_DUTY         0x0
>> -#define MSR_CLK_REG0         0x4
>> -#define MSR_CLK_REG1         0x8
>> -#define MSR_CLK_REG2         0xc
>> -
>>   #define MSR_DURATION                GENMASK(15, 0)
>>   #define MSR_ENABLE          BIT(16)
>>   #define MSR_CONT            BIT(17) /* continuous measurement */
>> @@ -39,9 +34,20 @@ struct meson_msr_id {
>>       const char *name;
>>   };
>>
>> +struct msr_reg_offset {
>> +     unsigned int duty;
>> +     unsigned int reg0;
>> +     unsigned int reg1;
>> +     unsigned int reg2;
>> +     unsigned int reg3;
>> +     unsigned int reg4;
>> +     unsigned int reg5;
>> +};
>
> I don't object, but:
> 1) could you help actually put a real name on those registers ?


The clk-measure registers and their corresponding functions in our
released documentation are as follows:
MSR_CLK_DUTY: Accumulates counts of clock high/low levels within a
measurement window for duty cycle calculation.
MSR_CLK_REG0: Control register for clock frequency measurement.
MSR_CLK_REG1: Control register for clock duty cycle measurement.
MSR_CLK_REG2: Accumulates total cycle counts within the measurement
window for frequency calculation.
MSR_CLK_REG3-6: Debug status registers for clk-measure (typically
unused in normal operation).

Register Renaming for Next Version:
"duty" -> "duty_val"
"reg0" -> "freq_ctrl"
"reg1" -> "duty_ctrl"
"reg2" -> "freq_val"


> 2) why adding regs 3, 4 & 5 if you don't use them ?


These three registers are unused in normal operation and will be removed
in the next version.


>
>> +
>>   struct meson_msr_data {
>>       struct meson_msr_id *msr_table;
>>       unsigned int msr_count;
>> +     struct msr_reg_offset reg;
>>   };
>>
>>   struct meson_msr {
>> @@ -495,6 +501,7 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>                           unsigned int duration)
>>   {
>>       struct meson_msr *priv = clk_msr_id->priv;
>> +     struct msr_reg_offset *reg = &priv->data.reg;
>>       unsigned int val;
>>       int ret;
>>
>> @@ -502,22 +509,22 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       if (ret)
>>               return ret;
>>
>> -     regmap_write(priv->regmap, MSR_CLK_REG0, 0);
>> +     regmap_write(priv->regmap, reg->reg0, 0);
>>
>>       /* Set measurement duration */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_DURATION,
>> +     regmap_update_bits(priv->regmap, reg->reg0, MSR_DURATION,
>>                          FIELD_PREP(MSR_DURATION, duration - 1));
>>
>>       /* Set ID */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_CLK_SRC,
>> +     regmap_update_bits(priv->regmap, reg->reg0, MSR_CLK_SRC,
>>                          FIELD_PREP(MSR_CLK_SRC, clk_msr_id->id));
>>
>>       /* Enable & Start */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0,
>> +     regmap_update_bits(priv->regmap, reg->reg0,
>>                          MSR_RUN | MSR_ENABLE,
>>                          MSR_RUN | MSR_ENABLE);
>>
>> -     ret = regmap_read_poll_timeout(priv->regmap, MSR_CLK_REG0,
>> +     ret = regmap_read_poll_timeout(priv->regmap, reg->reg0,
>>                                      val, !(val & MSR_BUSY), 10, 10000);
>>       if (ret) {
>>               mutex_unlock(&measure_lock);
>> @@ -525,10 +532,10 @@ static int meson_measure_id(struct meson_msr_id 
>> *clk_msr_id,
>>       }
>>
>>       /* Disable */
>> -     regmap_update_bits(priv->regmap, MSR_CLK_REG0, MSR_ENABLE, 0);
>> +     regmap_update_bits(priv->regmap, reg->reg0, MSR_ENABLE, 0);
>>
>>       /* Get the value in multiple of gate time counts */
>> -     regmap_read(priv->regmap, MSR_CLK_REG2, &val);
>> +     regmap_read(priv->regmap, reg->reg2, &val);
>>
>>       mutex_unlock(&measure_lock);
>>
>> @@ -599,11 +606,10 @@ static int clk_msr_summary_show(struct seq_file 
>> *s, void *data)
>>   }
>>   DEFINE_SHOW_ATTRIBUTE(clk_msr_summary);
>>
>> -static const struct regmap_config meson_clk_msr_regmap_config = {
>> +static struct regmap_config meson_clk_msr_regmap_config = {
>>       .reg_bits = 32,
>>       .val_bits = 32,
>>       .reg_stride = 4,
>> -     .max_register = MSR_CLK_REG2,
>>   };
>>
>>   static int meson_msr_probe(struct platform_device *pdev)
>> @@ -611,6 +617,7 @@ static int meson_msr_probe(struct platform_device 
>> *pdev)
>>       const struct meson_msr_data *match_data;
>>       struct meson_msr *priv;
>>       struct dentry *root, *clks;
>> +     struct resource *res;
>>       void __iomem *base;
>>       int i;
>>
>> @@ -636,15 +643,18 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>              match_data->msr_count * sizeof(struct meson_msr_id));
>>       priv->data.msr_count = match_data->msr_count;
>>
>> -     base = devm_platform_ioremap_resource(pdev, 0);
>> +     base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>>       if (IS_ERR(base))
>>               return PTR_ERR(base);
>>
>> +     meson_clk_msr_regmap_config.max_register = resource_size(res) - 4;
>>       priv->regmap = devm_regmap_init_mmio(&pdev->dev, base,
>> &meson_clk_msr_regmap_config);
>>       if (IS_ERR(priv->regmap))
>>               return PTR_ERR(priv->regmap);
>>
>> +     memcpy(&priv->data.reg, &match_data->reg, sizeof(struct 
>> msr_reg_offset));
>> +
>>       root = debugfs_create_dir("meson-clk-msr", NULL);
>>       clks = debugfs_create_dir("clks", root);
>>
>> @@ -667,26 +677,56 @@ static int meson_msr_probe(struct 
>> platform_device *pdev)
>>   static const struct meson_msr_data clk_msr_gx_data = {
>>       .msr_table = (void *)clk_msr_gx,
>>       .msr_count = ARRAY_SIZE(clk_msr_gx),
>> +     .reg = {
>> +             .duty = 0x0,
>> +             .reg0 = 0x4,
>> +             .reg1 = 0x8,
>> +             .reg2 = 0xc,
>> +     },
>
> Would be great to not duplicate this struct.


Okay, I'll change it to use the same struct across multiplechips.


>
>>   };
>>
>>   static const struct meson_msr_data clk_msr_m8_data = {
>>       .msr_table = (void *)clk_msr_m8,
>>       .msr_count = ARRAY_SIZE(clk_msr_m8),
>> +     .reg = {
>> +             .duty = 0x0,
>> +             .reg0 = 0x4,
>> +             .reg1 = 0x8,
>> +             .reg2 = 0xc,
>> +     },
>>   };
>>
>>   static const struct meson_msr_data clk_msr_axg_data = {
>>       .msr_table = (void *)clk_msr_axg,
>>       .msr_count = ARRAY_SIZE(clk_msr_axg),
>> +     .reg = {
>> +             .duty = 0x0,
>> +             .reg0 = 0x4,
>> +             .reg1 = 0x8,
>> +             .reg2 = 0xc,
>> +     },
>>   };
>>
>>   static const struct meson_msr_data clk_msr_g12a_data = {
>>       .msr_table = (void *)clk_msr_g12a,
>>       .msr_count = ARRAY_SIZE(clk_msr_g12a),
>> +     .reg = {
>> +             .duty = 0x0,
>> +             .reg0 = 0x4,
>> +             .reg1 = 0x8,
>> +             .reg2 = 0xc,
>> +     },
>>   };
>>
>>   static const struct meson_msr_data clk_msr_sm1_data = {
>>       .msr_table = (void *)clk_msr_sm1,
>>       .msr_count = ARRAY_SIZE(clk_msr_sm1),
>> +     .reg = {
>> +             .duty = 0x0,
>> +             .reg0 = 0x4,
>> +             .reg1 = 0x8,
>> +             .reg2 = 0xc,
>> +     },
>>   };
>>
>>   static const struct of_device_id meson_msr_match_table[] = {
>>
>
> Thanks,
> Neil
