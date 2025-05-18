Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC5A1D5CE0;
	Sun, 18 May 2025 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747572553; cv=fail; b=bC05RLa1DITE1ejXpEGNrE6jYvZcBd73lWfyS9Nyljl6hcCLNhKurtKkVyvCSuM4sYGyVoKJ0Bkjbee0qho22Gv2V06KHlNR+ID72VixvQkVZgmTZ0gkHvn1FrOTGqRbIX0rrjfP3UIEDTjVfxpM5vs7iXIxVI339Vw5yofyIZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747572553; c=relaxed/simple;
	bh=W86dyAoO6Ys2Q3D9olDtUFlULvz6CF4WGxOViqKcPjk=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=R1AYRbLyz+wyMLAPVGps1JhUO5WJ/XneZHGfl+OzAeC1IDlGp3atPjqdqKSzpF8CtEbLjAzc61jxC+CGeYwRi4vLd4i9NvuzUhCmCPWGoAoU/I9d+uI9ADrrrrzv7U5dYkJ2aslGQkWc36y37SXcrbv70oRiNpkzZhz7LDEwgmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Sf1AAPHv; arc=fail smtp.client-ip=40.107.212.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Sf1AAPHv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dtQxrWFr5ecQd3qG48M9oj2GjN1wy6gjRx61f27yrPgvmTImgW5ZF3jTjOqJEtSPkwbR9cT3ceWVD+O0VzCGbCwefQz730tglEepIotoKPss7xLTjWK+g/WHGxAdosGSHbQYK/U9xv43iGyKKjm2G8XU7fd1hU++Zh9dUUMoe4YPkstJG8/f7zMZLeKDZYTvF7hI+QULx2oFgPVLO72v10Wn+XIDEJFhhXyR4AU4W30cw/2OeKwf5dL7Q4YTGGQGQZWZ4Qr1X1VQ5E7ht7zXVEoV5yU+SvNYslNDOdhWp1dqyEABgAbSa6ic/Tai55LoMVGk9MHgZF6FaPAltfXcEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W86dyAoO6Ys2Q3D9olDtUFlULvz6CF4WGxOViqKcPjk=;
 b=LGbzL4GcAaBCRLxpbHmuhpUHvrj9ABiy17qwxJ/K0M5aWbef1+3+GX1TKFhPqLbtZiuMmlXDTXZmVb9YJ2QxkHGk+kHtSU3XiiG1wwXEwGex1xxWIv/eVfsvXNgaQaPbhOAcoj0GzFiaq9oFKW+hFUF35FwTECTsIQDA55IKFVg9j48CXQeSeko4afwnwlHulGW8BAIQJqQXdsRzF3XEdIyitY7ySAsUo6fEoFO2QT/wCdAUP5tdp4QalXUJc3QmptNeknhgcqJo8KmtCyDFW8Yw2wzn3w/SzY8xrnd/hyqODbJnHLy+pj4eMYxYudMitkWkV6IuXX5dX/npB2pQgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W86dyAoO6Ys2Q3D9olDtUFlULvz6CF4WGxOViqKcPjk=;
 b=Sf1AAPHv15fnVf6Cr/GuryL5MdjO9RbrsrKYLiXTMVjleIMYTdUk/jfMNMuflSNIZWe0tVgn2Fsgswwsk+dv5VGiWr5pzIIJ6fOWtcWjZojWEj2zbYKff0cESbeLwxWD1YC3jF5EsVhCdsok65sNmCwcJzD67VxzJvXIQGVLyxAYkk0iK+xy9sybWxezTyjLRm0/trzEpUgdlnBRXCgpmfKf3+IoQwk+FnkXEz5zIvNX6ytgW/DdI+oyPueEaVm+GwI16btan5FAlOV524ERcosW35qQCyKCXozNRE0pxUxLs/IUWAH5oB+hXLs16lGS/zwnjWMUC4HNFDAvKNt/4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by BY5PR12MB4193.namprd12.prod.outlook.com (2603:10b6:a03:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.29; Sun, 18 May
 2025 12:49:06 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%6]) with mapi id 15.20.8746.029; Sun, 18 May 2025
 12:49:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 18 May 2025 21:49:00 +0900
Message-Id: <D9ZARI7RQWFF.459GMJWNQ6FJ@nvidia.com>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <benno.lossin@proton.me>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, "Sebastian Reichel"
 <sebastian.reichel@collabora.com>, "Liam Girdwood" <lgirdwood@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3] rust: regulator: add a bare minimum regulator
 abstraction
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Mark Brown" <broonie@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com>
 <D9YXK1J1XO37.JVILKENRKYXD@nvidia.com>
 <aCnP6QNDzCUUjplk@finisterre.sirena.org.uk>
In-Reply-To: <aCnP6QNDzCUUjplk@finisterre.sirena.org.uk>
X-ClientProxiedBy: TYCP301CA0088.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::16) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|BY5PR12MB4193:EE_
X-MS-Office365-Filtering-Correlation-Id: c84da849-cd82-4ca8-03ca-08dd960a5eee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7416014|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WDZOQUhMbjVBcGRYMHFUWGRwaHpFZ2lmT2hZMkZ6b3NKempKTG5WK3psRU55?=
 =?utf-8?B?TUxsN2gzNFFVRVZkdnIyZTAxcUUzYXBXTU92Z2k1VTRSUVAzM0Y3cER3ZW9a?=
 =?utf-8?B?OGRLa1oxMis0T0JVUDc5TXV6RmIzV2FjTE05aHV3REVFWno2cFVYdG5JamlC?=
 =?utf-8?B?a0dnK3k0UER0aE5YOFFzN2ZydFMydkthbXF2R0M1TDdRYWhBOWRqa3dpUGZs?=
 =?utf-8?B?MFl1SlV5M3N4ZHFPcVo3VVRaa1h6czI2bytvL1hZbVlqSmxOS1VXeXFtamlU?=
 =?utf-8?B?SnNGUS9GbEpYMGVQdXQwU3lRV3ZsNFFOeXdXRmdKMHNTdWNVWkIwQTdteGxK?=
 =?utf-8?B?MVNNRFVSMll5N01SQnhsUmRYR0lwbHZ3TlBCMDZ1cXpqaFlZbTdOb2hYOUll?=
 =?utf-8?B?Q0F5eTQ0SFRhVVhYRTM3OXFCSDZOZUFYRFF6VkdvMkRMT1FuTGVYbTQ3QXJB?=
 =?utf-8?B?WnlvSU8rMk5HOE94eHc4a2oxVTYxVW1OV3hkN0s2VFJHeDVUMWNsdU15aVMz?=
 =?utf-8?B?TGhDYXNqL0J6Ui91MHBRdmN2ZSs1T1hkeHptSzVzcGtGZWl0SDNMNEVRdjUy?=
 =?utf-8?B?SUVZZTJHSlB5TWoxM2NBSmpZNGtaQzFxcGVndmhibVFrdFdhMkxzeURwUm5I?=
 =?utf-8?B?Y25ZRnl0dFNsaTczbUxWOGFpZlBiZmRELzBuS2dBMzBTL0pkR2k4SmFNeDdD?=
 =?utf-8?B?dEpuQWNFdCs3OUZpWnFXVDlIWUVPVDJ0bEVzb3JOZ0p5bFRnMTNqOU5raERL?=
 =?utf-8?B?NDRJdEVBdTIyR2JXN29CSWpjRmVwMThnLzczSVp5d3l2UlBUdnRudTNrSitD?=
 =?utf-8?B?UlBGam5TZTFiNXEwV2xYR0drUXhiS1ZpWGhNdDdUSGdoRzlwQTU1U0xHdG5a?=
 =?utf-8?B?ZDBST1ZSZVZ3dy9QNUNNTGJFNWtoMTZpUzlrQkpQMnRFdWxwQjFPbXc1VHJs?=
 =?utf-8?B?VEM1a1RZRTY2ODdFSWNkU2VWMW4xZ3l3UWdOU25EemJ2cjc1WjBZTkVqa2FB?=
 =?utf-8?B?TGFPeGl3bStSUE5wQ2dHRjlQMVpZMDFlUlloa0tmWlBtUTlTQTZSNy83L3VF?=
 =?utf-8?B?WXJ3S0x5cVlwaGx5UDEwRHB6UXcrMEoveXQwM0pDK0gyRytmVFdic3Z0Smo3?=
 =?utf-8?B?STFEVEtLYm9uWVNTeHJ0TVdUaG1OZ29hS25VdFJDR0x2cjcrR3ZabTVlZi82?=
 =?utf-8?B?ME9jK2NaOVVRZkhjaVFiekVYZkd0Z1ZielhlRkhjN3p0dm16Slc1OHZiVVJz?=
 =?utf-8?B?blVnejNyWXFEVTZBYXNoZk1Wd2JaV3hzWmpVNTJBUWs3UW9BN1NxMDVKdWh4?=
 =?utf-8?B?VHFQTXpBS0E2RktwRDVVWTFOMUg3RnJPSFNLWHZNdWt3Z3gzcmxaRHVvYXJJ?=
 =?utf-8?B?cWZGQjlZV2wxSjl4NlVrZHlkbkFtL3hkUzZEZU5Rdk1SbFdPd1BwTGk1OHc3?=
 =?utf-8?B?WVdzMzd0WU01SWorb0MvTnE0TGdoaVN1c0t1Tk9ZeFZDWHF4WVhyeGo3TWVv?=
 =?utf-8?B?WWJUNU1ua09wWG0rdmZnQ1NFWkRRd0RWcXpiY25VSTJYZ01WdXR6NHhCdVdk?=
 =?utf-8?B?QVEyL3kwQVQrRmp6ZXhNOGV2QmRrWEg1ZGhZb3ZtNUt0UGxoR2VWT1dWZ0lD?=
 =?utf-8?B?TGRwWjFhUG45Q0RmVkMwOWtDM1NRakthSVB0S0loUTh5VlM2azVZazA2ZjhX?=
 =?utf-8?B?aWFKQTg2RnFFWjBZZ1NNZWsxczZQUDArZ3kxcEprblVrdUdnRy81ckozQzdV?=
 =?utf-8?B?QUZRaG9LUDNYem9ZZGJWZVo3MEgvcEhBRGJXS0JWb1N3U09VTWt2OGYyYXV0?=
 =?utf-8?B?eUR1aVFuTUFEd01CZVNCVzMzV1RSRVFyYjZ1Rm80RVhIeEN5bjdPTmdONWVZ?=
 =?utf-8?B?eG1ONjEvNnRkYzgyQnduSnF6OVJmZUZxMEtFb3g4UDZRN2RTMDFKakI4WXB3?=
 =?utf-8?Q?tsLKa9yMzuw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFBXc3k4QUtZRG03Q3hLOTFvUzI4cDBPNi8rQis0K3lJRlJ2TVJ3VnhPRi9r?=
 =?utf-8?B?SlpnZlo5MWp0YW9GRG0yTG43bGs5Sm9XeXdVRTBOSmtwQkVsYzRHQ29JWUJq?=
 =?utf-8?B?QlpXaEE5RjdQYXpEYmhEcE1zUnVYNFh5MW5uVXVobklsR0NZSWpjRFIxRCtZ?=
 =?utf-8?B?aDdZSHlNTGljOTVqWkhuVzlybVYrM0RMOHg3YmhtbzZwZkxnY2R6YTNHR25M?=
 =?utf-8?B?ZytTa1RVQ3U0UUd0YlYzN1FiMDdTVmpyV0treW1vTkdqSHpmU0xHemlmdXJx?=
 =?utf-8?B?L0RhQmxDYzYxYjNZeFJ1UElzTmxpV2ZUa05ZbEgzQVpEMTVmN05JSEUxdjlq?=
 =?utf-8?B?RW5UL0hhLzJEV1A2S3BoaGRuL3FIVy9KSDBhendsRGpjMWVOek9CRXlWYnN1?=
 =?utf-8?B?a0hocDlWMjA4eFpzOERGRm5nVUxleHFncVdMUERzZXVnbTRveVhlNWhZVDVN?=
 =?utf-8?B?Z2JRaXRjV1JYMWp6SW1qZnNlTXpCVjBtWGJ2Z3d2eUdUSmRPSjJMSE5NcWd3?=
 =?utf-8?B?Ykg0ZEVjZXlhZzNuK0s4cjQ3VjhDVnFCUUV4cnBGYkIwc1JqTzRjbll1VnVk?=
 =?utf-8?B?RVJTeCs4SjRQd3hHMmYwMDYyR0s2M3lWZ0J0c0UvOHVqZTBnSTlKN05hUlhr?=
 =?utf-8?B?UWZPRjFBK2VVZ2hBZ0xxSE1ZUUVZd0k1YlNVYVkxa3NQYklFbjNLUW5jT3pX?=
 =?utf-8?B?MFFhVkVUMUNiMFZrUUZlY2N1MnB0WnVTT0hWOGdXcGFQaTZJMGo2cnk2VlYv?=
 =?utf-8?B?c3B6WWJQZUYxenZueW1mbWU3SEw1NHpOR0gvNzhCQ1NBbVJVQnp0V1hvR1Fo?=
 =?utf-8?B?L1ZCVGdxRldzVUM2WTlicGQ3SU5WMDNzd3dCbzF0UzRrbmgrbHVmbGdmY0dV?=
 =?utf-8?B?OW8xZ29ObXJGamo1OWM5OCtydnNlTzZ3ZlNHenZ6N09tSG5ROUhxTGlFZUx0?=
 =?utf-8?B?UGlFL0RQWnQ0UDlXdnAvc216Y1JFVXEzSDlmYVU1Tld4NGZmaFN3Vzd0djhF?=
 =?utf-8?B?OUpiQ2gzYlhBNlh0ejFmUVlIZ3REUncyRENOdHl6UWlJam9XcHBSYlk5K1pO?=
 =?utf-8?B?dmVwTFkrdC9FN01PTWhYbnlqSHowMWN4Mjl3RVZJZ1o3Y2NLbHlNREJlTldR?=
 =?utf-8?B?SnozTHk3aU9lRWhIcFRKSGhZK3RWcUNjWkgzR1ZWM2QzR1p4VDR1b2ZVdTlM?=
 =?utf-8?B?RndUZlFCdklYTmsvTTQ5UVZFTTZpN1VvRDlmYVNuNTMvUjY1VzRuTERhVEUv?=
 =?utf-8?B?ZkIrQzRIRVk2OVBidFZORE1TdmVpTFBNNDkyTlB1c2VTMTl0SUVMK1FlamhQ?=
 =?utf-8?B?L0NjRUJXdm1Qbk81YVVESk9qMk9RUmZKKzRPL1pEU3hldjN3UU16emJNTFVn?=
 =?utf-8?B?Y25KbnhLVkU0blJIcEFla3lKSytzL0hLamZ5TGtKczlFbUIwOVdjUFF2TENP?=
 =?utf-8?B?Q0Ixd2VxTnpHd0RFL2Z0dFNHSlZlU1V0WVo0YzJoM2RKVjNMTnZJa2tQSjlr?=
 =?utf-8?B?NDdpKzEydjhUSGdINnVsVUlwR2Z4WFdBSzNtTTFZN0dFQWV3TTd3M290OEZ1?=
 =?utf-8?B?M0I5b0FrUWMyYkV2VlZuMTZYWXR1UVAvK3Robk5pNmdXb0dEUncyOVZVT3R0?=
 =?utf-8?B?RVVDeStEUUxmdnM2WERJSUN3bkkrU2RBNVRSNFB3elNnYldLNzdMcW5ESC9Y?=
 =?utf-8?B?NElUUFhoWmVHM3BmbXJ2eURoL2RwNk5XeGFkcVNkU2dIeEs3eUN4b3o0VmNr?=
 =?utf-8?B?YlJNSWVKMnBzUDZRcTVxUWxiT2phMkJzNmhabXNWUnA1aG12S3JWb3hneGVJ?=
 =?utf-8?B?elRkdlN1VjZ3cVlCM2NRbE5lWXZsNlZ6SVR0bDlTOUJZQjRjd0ZLbmpPL3pU?=
 =?utf-8?B?T0YwdWpYM0pVc3FRVEF0dlAxUVpYaElvTlRoZlEyOUpSdUpLZGNlV25uNlUr?=
 =?utf-8?B?cWhiWFJKT3dqUDE2YzcyeTNvY3IxK1ZhcHRwcGZHUEtyRGV3RDlJcDlpQWNV?=
 =?utf-8?B?cnBuTlljVVhLc2xMR05mYjZHSkZJaUJKOEF6d0IvemxxdkRHUkRDR1VhVlNr?=
 =?utf-8?B?NTlrc1p1eHkycUJGcXNKa0dOSXhTUHVVT2xTTzdwb1JVVHh0ZWpDYS9VRXR3?=
 =?utf-8?B?UHVtbWZoc0hud3JDRXJ1SlN0anRJV1gxZ0tndnNRSFNkd1FocDRDTWtQYjdr?=
 =?utf-8?Q?ZBIowMRZotl2nKGYtrbeXHogQpAv9Lp6GAhs17ZywmJE?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c84da849-cd82-4ca8-03ca-08dd960a5eee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 12:49:06.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: le5IztS6s8d1UfyIrfCEzM28D3Mrppa7iVJpxXC0IRTc2wox336ak6UqWnJeIrJ5tmjHlQ0e30e1B5xT6Lrf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4193

On Sun May 18, 2025 at 9:17 PM JST, Mark Brown wrote:
> On Sun, May 18, 2025 at 11:28:01AM +0900, Alexandre Courbot wrote:
>
>> Alongside the `Enabled` and `Disabled` states, there would be a third
>> state (`Dynamic`?) in which the regulator could either be enabled or
>> disabled. This `Dynamic` state is the only one providing `enable` and
>> `disable` methods (as well as `is_enabled`) to change its operational
>> state without affecting its type.
>
> Note that checking is_enabled() is a red flag, it's only there for
> bootstrapping purposes as drivers are probing where there's some
> different sequence might be needed - the use cases are quite limited,
> most drivers shold just enable the regulator and initialise the
> device.

What things that are possible with the C API do you think should *not*
ever be done? That's typically around these kind of restrictions that
Rust abstractions should be designed, so you cannot end up in any
undesired state no matter what sequence of methods you call.
