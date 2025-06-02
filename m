Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013046.outbound.protection.outlook.com [40.107.162.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B27664A0F;
	Mon,  2 Jun 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748870500; cv=fail; b=rTjl31/1fki5c/uQYkDLsAMvpvzTjupOZxCNVwoDtvxfsgK+TmaaaqmxtPLpstgEy+xtePW6n3EQuUMjns1G2XJ9WJVH+548iXoC7m5dFjcjyFZXDThptPR8Kdgoz6k4IWXLgh5vQvvzat7cvQSd62/eM+s/l7fFozqvLO+DxZc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748870500; c=relaxed/simple;
	bh=pu58ew8x3w19AOzh/bfuO6S0fubXEWkrK0FpjcEVN94=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vFuFqpia7uz308v3R/5F6O48vllWp7vxfTq30abjFGuxhGlvaosfKbqk32pVhH58FQmrwnRR93BabZ8r6z0XQ8jwT6Oh+M9js7kHn97zBDtS8T25KsMKe3F8USDo7WeSv1Myshld/baIjSx5LEMHui82VcrVWYCUO0/lwkjW4aE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=Egy8so9t; arc=fail smtp.client-ip=40.107.162.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="Egy8so9t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X7O4ysDUiuz/WwIpnBNDek+VkdwKNHd8oooRyRavDmzAoW5BmI4oLbzW/b1IySXxmuyZ5zzwgjSvBWLjzt7q+1O2l98M6k/SRJBGJzIJ0CE+D1V4qNtt5ysDC/+fR/0SyGJo6yRkExFCevR4eGkcz+i4Uc5IWeP12MLjZLl2WJXYk2Kh/N3InXoQzDozrL843BItIAgd4Cyp561d/4C4YlHl5VGbR4swqsMlJoGBaseq4xE3ClhUfd3kG7iYYfORkEKvVZPkqCiUDRaEaY4Xks1tgKwKD91yXdLJuknoJtdz2rmABhc5pd0qLk40R6U5ocPhNHWMIECEiazmkwMZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bc+wfsRfbCR/8i/wLV87bjJOiHVEdB300o2zGzK8kis=;
 b=MwsZ3XRgRsVMzb/Yb5JQGyucW5TgmCBAcGDmdqwXFf4pU6ZpxOJcEeZbg3aHSBmjlvZ9DNty4URNWovBZQbhE7syS+bf4n5GzdcW3U974oiKHMNBlZV8viVEL2o4KmiXXElUpLXLsCELMuzO3J1oD1I9h3zZPKkR+dmuF3L1X4+b6aq5xoiP96GkU01BtykqSCcjTVhXOU2G1d1FVu5fRYFD9WsB0B8kYGv85e9v+mKV1IoLzLq7SzMbTXqa8xePyxKWSI/022e3WGIhkTrDb5bUbQGQBdXd4xv/4csaJse3tj3J18i4PdaeZibg+5n82XPr5t9AQNrLU+93fPgFXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bc+wfsRfbCR/8i/wLV87bjJOiHVEdB300o2zGzK8kis=;
 b=Egy8so9tG72Ll5RUuqea1kukYbr5cHtrxzyDwK7EArPMaXNM50/eIz/pVsdRnpLLTCjZNX4ielZ2RBAMX+usoyL5PJryHze81PCJUCjl9vY4b/LHTLABIR6PuOH0z+iZIazkyQo2hHDS7z9NhiHfd77WD35IEv/QBmv526/i7+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB11034.eurprd04.prod.outlook.com (2603:10a6:102:483::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 13:21:34 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 13:21:34 +0000
Message-ID: <517a6335-9246-4de6-aab4-24949eb7277f@cherry.de>
Date: Mon, 2 Jun 2025 15:21:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwmon: (amc6821) Move reading fan data from OF to a
 function
To: =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Farouk Bouabid <farouk.bouabid@cherry.de>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
References: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-0-7bb98496c969@toradex.com>
 <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-2-7bb98496c969@toradex.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250530-b4-v1-amc6821-cooling-device-support-b4-v1-2-7bb98496c969@toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0150.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::7) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB11034:EE_
X-MS-Office365-Filtering-Correlation-Id: 5874d692-09d2-48fb-3c94-08dda1d86534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S3NwVi9jVzYyTXZnaTdPd3lhSTE0dGxwZlp4VGVMcCtLS1B2K0JHOVpISEk2?=
 =?utf-8?B?TzVjSHhXc3AzVXdqYWhMZWhmMFpiN3ptbk5FQUFEQmpjOEFaenpla0d0Z0Ru?=
 =?utf-8?B?MkE4WnhUZzJDR1VUZ0JmNisvMjl5WkpYQUZySUxxRkV4dFl6WEZsbmY1dWRU?=
 =?utf-8?B?TG5IYW5KR042eGlzYm9DQWNnaGtCZVdTWHJyUUwvRXhjMkFKaTZYUXVzcHha?=
 =?utf-8?B?N0NiZ0RySkIwWFZ0U1VjeWhIQW5vdHVZUmFrK3p6K0xxNytOSjRoeGVGbzZy?=
 =?utf-8?B?MS9MckI0cVU0UjVhdTAwbTNGRjU2ZDZMcVRLczJRclU1Nk5VSlFQOEZRSzVL?=
 =?utf-8?B?VUx5Y3JlUXNSWTEwMm9MTFdqTUJydXJJSno0clhQWDFEVUdzRXlSLzNnZ3RQ?=
 =?utf-8?B?Ym4zdDQzTXBPWVlSTjJtQjA3NUZRQmQvYllNREdoTFdBcUVZdHUvMlZPRWVr?=
 =?utf-8?B?U3R0dGsvZzJ3Z1FlZ3dFVDJvaTE5YVZNa1ZiM1c2djMwRnFGNU5EUEYwWXNh?=
 =?utf-8?B?bkNDQm13SE9VdHVYUmZzbERFOWlwdHRLQ2RnOC9LcFpSTXR2am1GL2wvNGQ4?=
 =?utf-8?B?VjM0TGk1SktuNk5hbkh0SlVaaGd4cU5GRXVOMXAwQVhyRkk4Z1NLMGV6SUVy?=
 =?utf-8?B?Z3RIUnV2VTVRZjA0cTVUcUV4NjNoUHloUjZPRmJtUVhkcUh0WmZCeUdaZll0?=
 =?utf-8?B?cGZRa01SblRFK0NVRDEwaVJPZDFNNjl2bUMxdExndWVNdTNGMmFVd0FlL0JG?=
 =?utf-8?B?TXNlQ3pGSnErVHBsclhpNjB3Z3prUmRCY0xvT2tUNnQwWjNmNmRzRWUvWUhv?=
 =?utf-8?B?a0N1dkVLaEFXNHFvdTZjTG12aHhWd3BKWXVYMFI5MmcydzE2UzYwaWxpc1Zh?=
 =?utf-8?B?TFlISDl6NCsxMWVNVVhvSWw4SW5aTnNMWVg1a2NtMlJycGxkcVhjSjBNVkpp?=
 =?utf-8?B?YmdwTjlRZ0ZSVURvWktKakhtOS9UWWUvdnpDTGhieDk4SUFaVDNVM3pKc3J4?=
 =?utf-8?B?TU5BbGRxWmw2UVozS1lKenZoUUpTVDg1ZzQvU3c2ZEMzaFh4TzJwQmp2d1pJ?=
 =?utf-8?B?bENtSWpRZHhJdmlZRllGcUFMR0xXYk5rVWlZd1VsdHMxVGU3SkpaR1VISWdm?=
 =?utf-8?B?WkdsSlBkcnNjdjJ4SGZnbzRDa0dJUGNGTXV1cEdtTG81OHBISE93Qm8rdHll?=
 =?utf-8?B?dVBWN0NUaVBvLzBjSEhmSUlIUEk3SDRWejA3VjhTRjBMRXZHdXpHMTd1TXlP?=
 =?utf-8?B?aXBJVUpnVkJLRGxTMWVyRVRjVlJIZEFBNnl2ZzJRaC84OE9HczZhSk15VThM?=
 =?utf-8?B?eDJmeUlsMWwvTjdmSlZVOFIvd09Eb0xqQXJPVGxISkJYcExhZ2VHOXJMeTA2?=
 =?utf-8?B?YkpRTlA4S0huVGEydEs0VDhaQy8vV1lmQ0daQnNWL25HZ2xhanJZWDNrL1Rk?=
 =?utf-8?B?UzdkM1BWU01ydXZDeVkweVVhdHpYRGF6VEZHOXJzc3Raa2FCeGxxcXV3aGNq?=
 =?utf-8?B?L3BPOHVpMk5TdWRSS1VVM29iQmM3anBGbXVBUlF1L3F5bEF1ekRha0hTWHZP?=
 =?utf-8?B?cmx2YUx5eXlsaU5qYkRzOG91NVYrUVArakMwSkxjOXI3alFPNTJEaE5wQ09q?=
 =?utf-8?B?VUpsbDJqWXlBaTdmbW5hYUFjdTJERGpiWlF4dXZKNXpocUh3OUp2NWw4eTZl?=
 =?utf-8?B?M2Njcnh0WlJ3K01IQWJDVkdhazJTWTZGKzBFME5jU3pidFd1dUViUGo0Tnl4?=
 =?utf-8?B?N29VL3ljVi85WXBHT0hvUnRHWjVpdEhSalR5cjVzdFErZGpScWNuYzlIdDZR?=
 =?utf-8?Q?Y1h8PnzTde9pjP4GYwtNPk5mCceVL3d/O96jU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ym85cWtGeXVCaXhaa0JBVmdyQXp3TkRUREdTOGdpMnpOdHlCcU5md2p4emN5?=
 =?utf-8?B?VzQ1RHhjbTdQNG1iYURDZFVUaisranhacS95VU05NHBQN2NCTEd3SEFhY0s5?=
 =?utf-8?B?Qkc4c0RLQTdRcTVhb3J1bVAzcVcvL1FEdDZFZEJGa2JkWUdpUlZWb2c5aGhX?=
 =?utf-8?B?NUo2RG52aFlOcHdOWmtxZWJjckl4bEdXTUlJbEs0cGd6VEI1dlE4aWR4TjdU?=
 =?utf-8?B?aGc4R2laSjZOOG9wb21iOFMvQUI2M2lFZTBkajNrYzM0V2tQaXVjY3JHa3Fr?=
 =?utf-8?B?TG9kWUw2S3ltZk8yS0VjOGlCV1JTWEZ5UGRiM2xCc3VJUjBqcEdjWkpMa1Zk?=
 =?utf-8?B?QURsUUJUY3IzNCtrNEhXM2h1UWdqUDVrRElZRStnTERlQUJjSVM3aXhpVmg4?=
 =?utf-8?B?V3MzN1VQcmNoUjR6dHJTdVhaYzRIS21CVDFWNGhVU1lrYWZKWmJKVUNrK2RX?=
 =?utf-8?B?QlE2OVhvcEhnWXAydkQyU0FnWlhrNXdCVVU3RUJwTTJVbFg2S3BIUVdtanBr?=
 =?utf-8?B?UzJMS2hvUGU0MisveXJDbkFNQk51Qjg4UTNsajh4dXo5VHVpWXZrVGxraXA1?=
 =?utf-8?B?MUkrUU1OWUwvM3QwcEdaQUhSN05wK21VQW1ua2l2OEZQT3VNcWFyOExRcEtQ?=
 =?utf-8?B?STFEUlNJVUxKYTFtZi9DeDg3QXRLcVpPQXVyRkxNMWc2SDVkN2Y4ek5mY20y?=
 =?utf-8?B?ZkdZcFBSNkF4bENOZmYwRFNJSnlPM0NvYVhndU9yUUNYMXR5TWtsU3pUa0J5?=
 =?utf-8?B?V2V2NGx5KzF5VGhmSytPeEdiL3V3cDNhWVVBMGI1TmtPbHhYbmgrMlY4VEo1?=
 =?utf-8?B?VjVaSG5PRllkQUt5TWdYdnZWTGZLNlFYbEdZK29naXJrZ2ZUVHIzejBBY0VV?=
 =?utf-8?B?eVp3UXJoOS81UzFCSWxrL1RSdFVIelhLa0ZIb25CTjVZNnhsaXZyOUZJMnQ2?=
 =?utf-8?B?VFhtWnJ3YnBUMHRRVW9tMVJPZ0ZHZzE2NEV4M0UrVEVIcU1uYUhWVG9xZEJQ?=
 =?utf-8?B?bDVGUklVMHo2UnNJTVJiWGp4eStkREYvclVWWkhkTTZySk1MeE52bVdwb2tM?=
 =?utf-8?B?YjVNd1dFY09IKzRmV2hnSTBVWXFLUTBqSHF5MityS0FRdXpySVFnemtHRlRH?=
 =?utf-8?B?a2xTNFIrTzZ3dTNNWk1zODJibWFsUFhwMXVrNWtEOEdrUFhuTWt5V2hrYWFy?=
 =?utf-8?B?aXBuMURZR3d4WWpTQ3hkK01GRWtYRTk5Snhza2Qxa3AvYXZRMUpFaFNLc2R5?=
 =?utf-8?B?TEpmUU1VY2dJV0pMeUhlWlg2Z1NhaFZTbDJyNUlzVzVJbGVFZTFETGU1V042?=
 =?utf-8?B?VXA5ZjBXS0I1Y1dSeUZOQVFIZWNhYnVFeDRTQmRtRTN3Mi8rblc5OHUrK0d6?=
 =?utf-8?B?Qkh0K0p4dFhGWEU3VzBZZGZ0U2FGMERVSTU4RlZYOFlpUHFKbkxoUURmeGF3?=
 =?utf-8?B?L0JhZVl6aVpvYytYWTVMaEVpR1czemtNVjNsY2JKY01PVWtncHhmN3lIQTNm?=
 =?utf-8?B?UERMUmZHTVdkNUsrVnZZdDI5QXc0TzR3Zk9sSHJsR0ttYkVIZzFPR1BnRTVr?=
 =?utf-8?B?YzdUbUoxRUZrU0xSb3V6ckdyWHBSMlArRm5NYUpLZG5IckhiNmNlSVlLVEt1?=
 =?utf-8?B?TnZkN2pZbGR4cnI4SHJzQVFFbldZdFM2ald3aFY0UFA2L1dRL1UzL3QreUhC?=
 =?utf-8?B?cVFOM0UwT2cyaExPWnVtN1FHVXdaQ2YzUU5DUHE3Wk1JNWNRanpORkhLZnVP?=
 =?utf-8?B?aXVsa1FwdXRuZ2xhNm9lRVpnVW41VW85bjVrVkFDdzhsWEFvaDlKUVg2QUxx?=
 =?utf-8?B?NHNEdHRnaHo3ekJReDlVWklLeDV5c1MrazdDak8rd29CaHowRi9ZZEQ4bHBB?=
 =?utf-8?B?UlRsZDgzQ3dhdUR1dkN0c3FBOU5Xb1IyY2wyZDg2c0FDbjduME9sRTRQdkNI?=
 =?utf-8?B?bmhVUDBWYkxEL0pYSU5SRXdFRHBGYXpHeUt4SDdBYUVJejRLOHFoSTEzZjkz?=
 =?utf-8?B?eEdyZU5iZzdRVTVxVTZPQzZ1NWpKTDJHRWNlME5sSGc1eFc3OTlXaWdXWnF4?=
 =?utf-8?B?T2lCa010Q000TXFkTW5ZdEJkL3BDWVgwcVJnRUFmalJUNnRQL0ZTOENiSVd4?=
 =?utf-8?B?S3owRjBuT1BHREFIWGJRVEsvVWVGc21VS1Q1eFAvUlVTOG1xM3RNcEpndExG?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 5874d692-09d2-48fb-3c94-08dda1d86534
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:21:34.0902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VTakxFVZTMRqW/XlmI4r5ATyKSIssp24Q2pXUb877gBw0OXoXhUZtDau94yS4qgF35dI60hu5TDarGwG7V9POWpvbsumALXmOKfRKOATrjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11034

Hi João Paulo,

On 5/30/25 7:46 PM, João Paulo Gonçalves wrote:
> From: João Paulo Gonçalves <joao.goncalves@toradex.com>
> 
> Move fan property reading from OF to a separate function. This keeps OF
> data handling separate from the code logic and makes it easier to add
> features like cooling device support that use the same fan node.
> 
> Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
> ---
>   drivers/hwmon/amc6821.c | 58 +++++++++++++++++++++++++++++++------------------
>   1 file changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/amc6821.c b/drivers/hwmon/amc6821.c
> index 13a789cc85d24da282430eb2d4edf0003617fe6b..a969fad803ae1abb05113ce15f2476e83df029d9 100644
> --- a/drivers/hwmon/amc6821.c
> +++ b/drivers/hwmon/amc6821.c
> @@ -126,6 +126,7 @@ module_param(init, int, 0444);
>   struct amc6821_data {
>   	struct regmap *regmap;
>   	struct mutex update_lock;
> +	enum pwm_polarity of_pwm_polarity;

Do we actually need to keep the information about the OF polarity?

Are you trying to handle runtime modification of the pwminv module 
parameter where we could set it to -1 to force reading from the Device 
Tree again? This seems to be possible, c.f. https://lwn.net/Articles/85443/

Otherwise I would have said we just need to store the "computed" 
polarity, the output of amc6821_pwm_polarity instead of going through 
the logic every time we ask for the polarity.

Justify in the commit log why we want to keep the OF value instead of 
the resolved one (with the module param one).

[...]

> @@ -938,13 +935,21 @@ static const struct regmap_config amc6821_regmap_config = {
>   	.cache_type = REGCACHE_MAPLE,
>   };
>   
> +static void amc6821_of_fan_put(void *data)
> +{
> +	struct device_node *fan_np = data;
> +
> +	of_node_put(fan_np);
> +}
> +
>   static int amc6821_probe(struct i2c_client *client)
>   {
>   	struct device *dev = &client->dev;
>   	struct amc6821_data *data;
>   	struct device *hwmon_dev;
>   	struct regmap *regmap;
> -	int err;
> +	struct device_node *fan_np;
> +	int err = 0;
>   
>   	data = devm_kzalloc(dev, sizeof(struct amc6821_data), GFP_KERNEL);
>   	if (!data)
> @@ -956,6 +961,17 @@ static int amc6821_probe(struct i2c_client *client)
>   				     "Failed to initialize regmap\n");
>   	data->regmap = regmap;
>   
> +	fan_np = of_get_child_by_name(dev->of_node, "fan");
> +	if (fan_np)
> +		err = devm_add_action_or_reset(dev, amc6821_of_fan_put, fan_np);
> +

This seems a bit overkill to me. If I'm not mistaken, we should be able 
to do something simpler such as:

fan_np = of_get_child_by_name(dev->of_node, "fan");
if (fan_np) {
     amc6821_of_fan_read_data(data, fan_np);
     of_node_put(fan_np);
}

(not tested) what do you think? What made you pick the 
devm_add_action_or_reset here? What am I missing :)

Cheers,
Quentin
