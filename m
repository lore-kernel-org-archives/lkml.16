Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022083.outbound.protection.outlook.com [52.101.126.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB602609DD;
	Fri, 27 Jun 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015708; cv=fail; b=da22v+a3g+/eRTp5kf7Du6JbG1AXEz4pTL7ZINzBUNZK+bQqASGPnkSdxz+ule0XDGa+8jeQDnjbGFKRp+YbXrfZ+J7ArNBglY3+5qw3nRY8cWd1U81IUbE5Euxe2PYtOc4nq25eGVOpHlxdNtjcBs9Az4iisBw263QNX6V1//8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015708; c=relaxed/simple;
	bh=D6bzM9guxZ6w+jn3gP9nKXgKtcvbmud0S21zTKh/8p8=;
	h=Message-ID:Date:From:Subject:To:Cc:Content-Type:MIME-Version; b=suXo8lqe7o2QMMDzxxiisKqDMLC+cfKyMg5FnaMTRxRG/iSEXbWQNQeG0IEWeygufEnhBR6NmoveHCv7XQBvHcDZSwDye8c7d2t/4t8Cqj4ojM0DQQXPfzIfL1iGuxE5jfUiHOagHByYEe8uGH/WbEDENkK+HDHQcinz7M1p810=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw; spf=pass smtp.mailfrom=portwell.com.tw; dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b=n1PAGIXF; arc=fail smtp.client-ip=52.101.126.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=portwell.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fetCA905017.onmicrosoft.com header.i=@fetCA905017.onmicrosoft.com header.b="n1PAGIXF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIdXvXHLQjf++Av+moSS4OXgUCWnsQNLjIUjA+Mywgy3kwYNqrNQEjwMW96/aSMq+LML4yKYC/Dlzt1IIyZvQGX2cBLck36tCVk6bhHcPyrjuuS/nq2++i5eU4dlMbWKk6DftiCKk76RRuMUt73EU9ACx7zofhm1TR05aTy4oQ6VNafIRfkFmLEsVYRCIVNkoIyUH93SKMjr0mwdcHa4jB5CQ5KBoh/H06VwmDC3cVOM7J/XHTraS78kXFomgT20btQiG8jwZm+oNUzfm0oMk6U5vM4U58MO6teqmT0JPEsy3uV6nEwYs9GlgXoon4ZQfavgFdzXybj72y+7W3QQ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M2PUOcXK4y8iN8GgWcD/Vnh8WyrrcGR/GYKopOZLrFQ=;
 b=Pag/U+60e2e9xhJv6EDHGWQ3HZ4k5+nMDm7ReUJQkgs+3RjhwEf5NYVitn75XFO+iDfQmwQDysRg5Gya7RzPEr4Ady33QWu+GPLWGTMS627eK1g0twkB2ssZg4cwYp4fyx2YPb4VjB5JHMsSelFPBlVs1TRptgZgaoWeEUX15dMy1XC/NOJLUs5jFdWlRz8WXT7RsP42NyH5ECIc9eqkbwjJpXegF5vU3HrzCGFEL0O5oDQu+ycPfKPUjQDfKkGrLtFAhNPd3ecDcp6K0RdrZVMiyfQSP6kEtNTFfLSEI+GfDAqqTgVA9jgeWgdRGGQj39eaGGWbXrwvDEJvjjrT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=portwell.com.tw; dmarc=pass action=none
 header.from=portwell.com.tw; dkim=pass header.d=portwell.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fetCA905017.onmicrosoft.com; s=selector1-fetCA905017-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M2PUOcXK4y8iN8GgWcD/Vnh8WyrrcGR/GYKopOZLrFQ=;
 b=n1PAGIXF1u5vsdEX8p5Fo9Yqx7BFkWiyneLJJN5cFymuJxp+O7a47wdAMRvn+389yWS76u1zeILzLaOvcI6g/bSJmmnHuqGou4vayvvZLKnmNR7Zc6UKTTIpqMyN3tmVREWOq3qUDoeezJ/lgeRmnJk1PulYAbGUUWt5c0ZKr2Y7XmOULGi/ohBNg+jaHcjN/suMRCAjndMOaieJ+XuBBaGH3QLj61386QdrxlrtTOFJHVnDZKFTfb4E3qY1bfHfYKrWHh8JEL7/FxyvpoyTDq+ug8j9qdPIQ1in5+XS9MUSQgae7ym7cximde45ZpX/3c9qREmdTM+4FD9yUqZq6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=portwell.com.tw;
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com (2603:1096:820:e7::10)
 by SEZPR06MB5898.apcprd06.prod.outlook.com (2603:1096:101:e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.18; Fri, 27 Jun
 2025 09:15:03 +0000
Received: from KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224]) by KL1PR06MB6395.apcprd06.prod.outlook.com
 ([fe80::9235:5570:71b3:224%6]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 09:15:03 +0000
Message-ID: <a35d63e1-424f-48ac-bc97-cdb48929f40d@portwell.com.tw>
Date: Fri, 27 Jun 2025 17:15:01 +0800
User-Agent: Mozilla Thunderbird
From: jesse huang <jesse.huang@portwell.com.tw>
Subject: [PATCH 2/2] platform/x86: portwell-ec: Add hwmon support for voltage
 and temperature
To: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, jdelvare@suse.com,
 linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TPYP295CA0024.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:a::13) To KL1PR06MB6395.apcprd06.prod.outlook.com
 (2603:1096:820:e7::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6395:EE_|SEZPR06MB5898:EE_
X-MS-Office365-Filtering-Correlation-Id: e712dca2-cdfc-4e23-6b6d-08ddb55b195f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WXFEZHBiNGdHMmJlVjNSYk43aUZEQmZxNklScTI2SUVYMEl4SHBid1hQUjlm?=
 =?utf-8?B?ZmdwT1poSUxwcHRydmtiMzFDa3ZCY2lsbmFaS3dSUmN1ZkZSYTdmSTRmTkVL?=
 =?utf-8?B?Wmo5VGFSRFZMdmtJaFFUMGRvR05YVUQ1MzFrZTQydUdlMDZCSVh1NGdPM3FP?=
 =?utf-8?B?WktPS0lBVGtoQ1l2N1RZcXFvV0FkQ0d5eHFGM0Z6TUx1QkF3Z0YrUDBtS0cz?=
 =?utf-8?B?LzdXRzVtVXNPVWdTbGdqZEp3QmJkbldvMWwzd1h5dEVVNHFSSS9vOElBWEVK?=
 =?utf-8?B?T1F5V3BrRm1PV1NDdHJMUDlNeER4QUloQUNDMTVHOTZjb29WUWcyd0FKalQz?=
 =?utf-8?B?Q1NBTnZWWFFrTU1QRldFYWk3N0Q4YW1XRTBaR204ZFBnRnBYOHZyaHVTOVoz?=
 =?utf-8?B?WTIrNTlZaDJuVFk0QXhtQXlqUnlxT3FEcXJsaVFMZkhaaGc3M3pQU2FwcU5B?=
 =?utf-8?B?aU5jWVZBNmJYMXpMVnFZbjl5dUNjVlZ4NHp0T1hiUmFCSTEwVHhXL251Wmp3?=
 =?utf-8?B?VnN5Z1V4UElTcUpFdjBsQkNRbVArVkJjTVU5Y3RsUlJoYldxcXVXU2p2RTFF?=
 =?utf-8?B?SFpJVmFjZ3dPdHd5K1VleENiMjlOQnJ0UDF5Y0xGSkdWeVRLcU41dVRXZWdJ?=
 =?utf-8?B?WGZSV3IzemRLclpuVDNqellnMUEwZDRFb0twLzgwc2RoN3JhQ0dzS2ZFaGN2?=
 =?utf-8?B?YmlXd05XRzViZDBoZmE0R3g0NkZkOXJ5QjVpeTRNc0FWTE51RnA1M2ltSGVW?=
 =?utf-8?B?YlBGeklXLzRUbXQrb3J2NVJURlJkNVE0a29iQStRTUpYS0NCMlBsSWRmRW1R?=
 =?utf-8?B?aWZxb09VTTN1WVJQSkpEUEhVMnUwUWFGc205SmdsVW1FQm9OQjBWaUVTdlA4?=
 =?utf-8?B?ZGluaG9tdC95YkpyQUZRL2hOMENsK0w2VTBuSmxFSVR6bXE4cXF4MWxZdURz?=
 =?utf-8?B?L083Y1NBVW84RThOalk0NHZNRHpOVE1rVGxVazBBMmZhRExsckcrajdwa0sw?=
 =?utf-8?B?SWEvcFphRUZFQ2YybTJXQ2hoSyszWmk4L3NUcGQrQWQwVXRGWDNpOGpXWDhS?=
 =?utf-8?B?OXRveUpQV0JPMHY0ZmJqb0t5ZjF6ODlYdEVnMEpXVkNCaC9oZlNtQ3k4U2NP?=
 =?utf-8?B?VDNjMG4vY091alRHQlAyK3JtVit2VUU5c01aZmRPeXZzRzdVRXdjc1U4YkFz?=
 =?utf-8?B?ZDJtcnFjWGoxWEw5dzdXQTl0S3BSUk5FQ2duY2h5QXY0S0xGZm9KMlFqcGtP?=
 =?utf-8?B?ZXpVemoreUFlSWx0dFFNdGc4TXROdENSZlJheVR3RWs2Ujk1clZzTVdjaVA3?=
 =?utf-8?B?UlRueDN2SWhtbTJQQ3lzckxOY1JrcnBNbjAwaEowU2tlWUNJYi9td2ozVmNO?=
 =?utf-8?B?RUpITU8veXVVZGMrdkV3RGVjckhXNzNZNXJlQ1Z0VkFsRmVvc29XdHp5bjU3?=
 =?utf-8?B?M2VLU3A1V1NmVE9jVTQzRENyRzE2amxVdmlEbHUwdjc0aWhZTFFrb0treGdp?=
 =?utf-8?B?RWR2Tklsc2VqeHgxL01UOHNjcUlqdDk3T0RsaXlZcDNDaHNDemNTcGE0YUh0?=
 =?utf-8?B?aVVzZlBQanphMGxFNzUxeHVYOU9ybFNSM0RibUgrenVnd0VqU3NpOG5DRTla?=
 =?utf-8?B?S05VYWZtVnRuSjBRSkNVM25EV2pNanVEWEV0RjRrUXlDSmNteWZwM1E2WUpj?=
 =?utf-8?B?NzJFbFg3dE15MnBqMnk0TTU0SHliVHF5MWNFQVNqMlgyN09VUFdSem42T2ZV?=
 =?utf-8?B?c0NyOExiOHVNQWprR3dyaSt3bTBtNkVqS2tsQVpIWWNpNnVPSkdmaGpwbFlz?=
 =?utf-8?B?WXEwUlo1OGwrcUNBdzZSTFE4ZDhyOXdSSDFDQzErL3J4azdVYy9ZL1Ywb1NE?=
 =?utf-8?B?VmQwMXV3WiswSndBZE5Dd2tvTGpNTk96TEhBclpsOTFjajZ4V3pNRnZqempq?=
 =?utf-8?Q?bi6OhwArRGQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB6395.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFMyTmlnMSthMlhoVG11bEdzZGdUU0FSMFljUUIxQ3BQRnZBWWwzYVd1NHBM?=
 =?utf-8?B?RjRLcDJVUVo4aVh3QXRNb2ZRaFlwVUZwMWE4OEZ3SGx5bjhsSjhRclZXNzUr?=
 =?utf-8?B?bHhNNFV0V0ZpUWg5WVgxTmxiekU0RWhQNlhaY2Fhd0lQazZPMHF1a2tpZjBm?=
 =?utf-8?B?Y1g0OVlEQjBvV2RqaFM1d2pMcW1iTGUrV2tNeWFZcGRJWWxLWUxkd1JZeXhX?=
 =?utf-8?B?RFNwMmthaXNlc0xwS0tjWDVSRWp2MEFFNlNSdnFRdnpVVG5YcjEvMEFhN1FF?=
 =?utf-8?B?L2pCcTBXVzIxK2syODRmNkJpdlBVQ1pwTzluNkp2a0h1bUZUdzVFdnIzVW9N?=
 =?utf-8?B?MDZPMVJ6cVpEN1BxbjQ4UVJlYlBJRGNKbW8vVWpHQWtES2lNK01vV25kOXE2?=
 =?utf-8?B?SllyWU5RMjRnTmlET0dnQ3d4azc3VXFGSkRMOEo0YUU0b080bDZmVU0rVktR?=
 =?utf-8?B?WjkxLy84bWVvK1pRSmtVSTlKRVI4aU5kUTZnanZ3OS8zZE03cXc0YXh3T3Y3?=
 =?utf-8?B?ckRJaFE4d2ZmZHczcGNrZDdRaHlIQkFMY1hrRWZyWFpIYXVMK041UzNHMWVL?=
 =?utf-8?B?K2kwZlcvQUtyOURCZmRJTSs3S3A0bzd4ZVVmNVpxRUdSUVQ2NGRoc29aY09v?=
 =?utf-8?B?SWp3NWd2ZmZBL2cwa3pTSlgxQ1YzRmpJbkNJMHBVeTJDR29heFlXMlJnUlhp?=
 =?utf-8?B?LzBYLzMxdVJDVWNCR09ZNTF1cHowUDd3MG0zeFU1dSs1Q2cvUnVtRG1ZZHNV?=
 =?utf-8?B?eXpVUnZGb3hGd29oM2NHUkJVcDR3cHpPajNHWUlwYk02MlhacjFPb1Z1bGFq?=
 =?utf-8?B?YXBYUUxQaU5ueTJVTlpaQjc2cXpRRWxGOHdYSUxtS0J5L2x3cGZYbytEYkNs?=
 =?utf-8?B?aUNTNENGcWErQkVwV0lVd3BFSE5oNXpFZDEwLzYwZXlNRmhKUGRZWEdoc0Q1?=
 =?utf-8?B?bWMvd1JHUTFZbTFZY2t0cm9NTWw4Z3Z3cDVCWWxNKzJWdGxVREJuMmJHQnBr?=
 =?utf-8?B?WWRqcEloTzMrSm9iWkl1SjBERmlZenNoYkpiRWVDMmNBcFhLR09UQjdGK0FY?=
 =?utf-8?B?REdQUUdqckFWMHh4YVJ4MExidG1Nd2IrS2FOTXg1R0pJOXBuV1Z2azl6aTJr?=
 =?utf-8?B?TU5janZXR3V4OHNNbUxkaW93N3ltWWE1SmZ0T29sNTJjWXc2ejF6ZU9jdXdw?=
 =?utf-8?B?TzlWSFZGUVV2Z2Qxb0xBS09QUnd4SXQrM24vNDZqREFOcHNpSG9QWWNPOXda?=
 =?utf-8?B?QS8xQWhaM2xtRUxSSGNneU5qK0p2MGllaXBmTlNORDk5Z0R1QVFNM0dzVy90?=
 =?utf-8?B?RHhYNWN1eEZQeVhOSHhWRWJyS2RWN0cvSkNGclA5cXFIWG1qVFc0NGV1c0NB?=
 =?utf-8?B?YTFZeFQrMG5hL3h0Y3Q1RExucE03cHR4QkJhVk9qdE5TcGs5QnNUMlNjcUh3?=
 =?utf-8?B?aGdwYlZ6Ni9kR1dJc3hlQmJIM1ZFWkxJQ3lzV0F2Sk5MSzlIOThpbFEwVlBi?=
 =?utf-8?B?Z2RJbSs0U0hod3cvVWU3US9yYS9idEVSZ2tYNFM2aW12eE9lUE9GU28wN3Jz?=
 =?utf-8?B?S3lycXNkNm10RTZPbXN6TzNMcFU4UmRMN3Rtb2VheFRiNUxaZUNlYnR5NUFp?=
 =?utf-8?B?ekZtT1VGb255dEFSaWk2RG1ablNIbjQ0OWh4MFZpMG0xaFpTNkhqV3dqT3hL?=
 =?utf-8?B?RG83SGxBWjd6WXd1bmhzN3l4amFsTGhYZElzSFNVRmhmcVJMSW1MaE5kazFm?=
 =?utf-8?B?bGpiM2R6Mjh4Qy9GK2xEL3FvOVBzR0ZVTjlROWlYQmpBTXFiSkhXeFZ3VGQz?=
 =?utf-8?B?amhmTWY3ZnRBZ2dNMEp2WEc5WHFJNWFweGpQZlArSFVnV0d6NjhWWnpYQmcv?=
 =?utf-8?B?TnBtTUVqN1FyN0FFWWVvQ3g5b2tDcUZQUUltWTRKcWlCbEp6ZWlSd2Uxc01i?=
 =?utf-8?B?c1VWWlFJaFlSeGJVajkzSUUxaWJJUzR3eW0zeUlTTlNwa0Q1bjJ6dmR0bHYy?=
 =?utf-8?B?S3NlVWhyd2VqUndCTHpsaDRjb2dTUnR2Nmh0Q2Z5M0dZM2tiRmlDNm5HdVlU?=
 =?utf-8?B?SS9qTTRCbGx3RGkzN0ZnME02cFdFLzFWZUZXQXpGSDlyQytKR1ZJZmkzK3M4?=
 =?utf-8?B?S1h4SjMrbUJsVTZjUnA2M2ZZUHQ2UTNkQXZLTkZaUFhxb3JIUWpjNXF5T1BZ?=
 =?utf-8?B?d2c9PQ==?=
X-OriginatorOrg: portwell.com.tw
X-MS-Exchange-CrossTenant-Network-Message-Id: e712dca2-cdfc-4e23-6b6d-08ddb55b195f
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6395.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 09:15:03.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e309f7e-c3ee-443b-8668-97701d998b2c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NTbZRHVM8DQga8MdRX9wSEkmnJw1PAKNoE3V12ZxroMY0p1N9B4Hv4NMEzqmT335ApvOBAr7cl3gyQRveJqs56hVX1G6d0p2ewy8JEwidAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5898

Integrates Vcore, VDIMM, 3.3V, 5V, 12V voltage and system temperature
monitoring into the driver via the hwmon subsystem, enabling
standardized reporting via tools like lm-sensors.

Signed-off-by: Yen-Chi Huang <jesse.huang@portwell.com.tw>
---
 drivers/platform/x86/portwell-ec.c | 188 ++++++++++++++++++++++++++++-
 1 file changed, 186 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/portwell-ec.c b/drivers/platform/x86/portwell-ec.c
index a68522aaa3fa..79597b4b5559 100644
--- a/drivers/platform/x86/portwell-ec.c
+++ b/drivers/platform/x86/portwell-ec.c
@@ -33,6 +33,10 @@
 #include <linux/sizes.h>
 #include <linux/string.h>
 #include <linux/watchdog.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/hwmon-vid.h>
+#include <linux/err.h>
 
 #define PORTWELL_EC_IOSPACE              0xe300
 #define PORTWELL_EC_IOSPACE_LEN          SZ_256
@@ -52,16 +56,59 @@
 #define PORTWELL_EC_FW_VENDOR_LENGTH     3
 #define PORTWELL_EC_FW_VENDOR_NAME       "PWG"
 
+#define PORTWELL_EC_ADC_MAX              1023
+
 static bool force;
 module_param(force, bool, 0444);
 MODULE_PARM_DESC(force, "Force loading EC driver without checking DMI boardname");
 
+enum pwec_board_id {
+	PWEC_BOARD_NANO6064,
+	PWEC_BOARD_ID_MAX
+};
+
+struct pwec_hwmon_data {
+	const char *label;
+	u8 lsb_reg;
+	u8 msb_reg;
+	u32 scale;
+};
+
+struct pwec_data {
+	const struct pwec_hwmon_data *hwmon_in_data;
+	int hwmon_in_num;
+	const struct pwec_hwmon_data *hwmon_temp_data;
+	int hwmon_temp_num;
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_in[] = {
+	{ "Vcore", 0x20, 0x21, 3000 },
+	{ "VDIMM", 0x32, 0x33, 3000 },
+	{ "3.3V",  0x22, 0x23, 6000 },
+	{ "5V",    0x24, 0x25, 9600 },
+	{ "12V",   0x30, 0x31, 19800 },
+};
+
+static const struct pwec_hwmon_data pwec_nano_hwmon_temp[] = {
+	{ "System Temperature", 0x02, 0, 0 },
+};
+
+static const struct pwec_data pwec_board_data[] = {
+	[PWEC_BOARD_NANO6064] = {
+		.hwmon_in_data = pwec_nano_hwmon_in,
+		.hwmon_in_num = ARRAY_SIZE(pwec_nano_hwmon_in),
+		.hwmon_temp_data = pwec_nano_hwmon_temp,
+		.hwmon_temp_num = ARRAY_SIZE(pwec_nano_hwmon_temp),
+	},
+};
+
 static const struct dmi_system_id pwec_dmi_table[] = {
 	{
 		.ident = "NANO-6064 series",
 		.matches = {
 			DMI_MATCH(DMI_BOARD_NAME, "NANO-6064"),
 		},
+		.driver_data = (void *)&pwec_board_data[PWEC_BOARD_NANO6064],
 	},
 	{ }
 };
@@ -79,6 +126,19 @@ static u8 pwec_read(u8 address)
 	return inb(PORTWELL_EC_IOSPACE + address);
 }
 
+static u16 pwec_read16_stable(u8 lsb_reg, u8 msb_reg)
+{
+	u8 lsb, msb, old_msb;
+
+	do {
+		old_msb = pwec_read(msb_reg);
+		lsb = pwec_read(lsb_reg);
+		msb = pwec_read(msb_reg);
+	} while (msb != old_msb);
+
+	return (msb << 8) | lsb;
+}
+
 /* GPIO functions */
 
 static int pwec_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -204,6 +264,122 @@ static struct watchdog_device ec_wdt_dev = {
 	.max_timeout = PORTWELL_WDT_EC_MAX_COUNT_SECOND,
 };
 
+/* HWMON functions */
+
+static umode_t pwec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+		u32 attr, int channel)
+{
+	const struct pwec_data *d = data;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < d->hwmon_temp_num)
+			return 0444;
+		break;
+	case hwmon_in:
+		if (channel < d->hwmon_in_num)
+			return 0444;
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int pwec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+			   u32 attr, int channel, long *val)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+	u16 tmp;
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*val = pwec_read(data->hwmon_temp_data[channel].lsb_reg) * 1000;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			tmp = pwec_read16_stable(data->hwmon_in_data[channel].lsb_reg,
+						 data->hwmon_in_data[channel].msb_reg);
+			*val = (data->hwmon_in_data[channel].scale * tmp) / PORTWELL_EC_ADC_MAX;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static int pwec_hwmon_read_string(struct device *dev, enum hwmon_sensor_types type,
+				  u32 attr, int channel, const char **str)
+{
+	struct pwec_data *data = dev_get_drvdata(dev);
+
+	switch (type) {
+	case hwmon_temp:
+		if (channel < data->hwmon_temp_num) {
+			*str = data->hwmon_temp_data[channel].label;
+			return 0;
+		}
+		break;
+	case hwmon_in:
+		if (channel < data->hwmon_in_num) {
+			*str = data->hwmon_in_data[channel].label;
+			return 0;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return -EOPNOTSUPP;
+}
+
+static const struct hwmon_channel_info *pwec_hwmon_info[] = {
+	HWMON_CHANNEL_INFO(temp, HWMON_T_INPUT | HWMON_T_LABEL),
+	HWMON_CHANNEL_INFO(in,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL,
+			   HWMON_I_INPUT | HWMON_I_LABEL),
+	NULL
+};
+
+static const struct hwmon_ops pwec_hwmon_ops = {
+	.is_visible = pwec_hwmon_is_visible,
+	.read = pwec_hwmon_read,
+	.read_string = pwec_hwmon_read_string,
+};
+
+static const struct hwmon_chip_info pwec_chip_info = {
+	.ops = &pwec_hwmon_ops,
+	.info = pwec_hwmon_info,
+};
+
+static int pwec_hwmon_init(struct device *dev)
+{
+	struct pwec_data *data = dev_get_platdata(dev);
+	void *hwmon;
+	int ret;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	hwmon = devm_hwmon_device_register_with_info(dev, "portwell_ec", data, &pwec_chip_info,
+						     NULL);
+	ret = PTR_ERR_OR_ZERO(hwmon);
+	if (ret)
+		dev_err(dev, "Failed to register hwmon_dev: %d\n", ret);
+
+	return ret;
+}
+
 static int pwec_firmware_vendor_check(void)
 {
 	u8 buf[PORTWELL_EC_FW_VENDOR_LENGTH + 1];
@@ -242,6 +418,10 @@ static int pwec_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = pwec_hwmon_init(&pdev->dev);
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -274,11 +454,14 @@ static struct platform_device *pwec_dev;
 
 static int __init pwec_init(void)
 {
+	const struct dmi_system_id *match;
 	int ret;
 
-	if (!dmi_check_system(pwec_dmi_table)) {
+	match = dmi_first_match(pwec_dmi_table);
+	if (!match) {
 		if (!force)
 			return -ENODEV;
+		match = &pwec_dmi_table[0];
 		pr_warn("force load portwell-ec without DMI check\n");
 	}
 
@@ -286,7 +469,8 @@ static int __init pwec_init(void)
 	if (ret)
 		return ret;
 
-	pwec_dev = platform_device_register_simple("portwell-ec", -1, NULL, 0);
+	pwec_dev = platform_device_register_data(NULL, "portwell-ec", -1, match->driver_data,
+						 sizeof(struct pwec_data));
 	if (IS_ERR(pwec_dev)) {
 		platform_driver_unregister(&pwec_driver);
 		return PTR_ERR(pwec_dev);
-- 
2.34.1
