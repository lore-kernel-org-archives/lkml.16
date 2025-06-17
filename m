Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2118.outbound.protection.outlook.com [40.107.220.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5801D2EFDA8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194123; cv=fail; b=bLLpjeWrx8LJlzKbeCE9Sx6jYUIBNKcCAXSBB7L2CwEnxKbF7KNEhZ3CoYdJIxB9ksJbIXrbH7drk3v7oSv703RF396hGdKvWYCw6NGyvta5KzWEW2wc4cqBoifiz0IYd/vlaQNRa16VjbtIzJT7jQRzSti6ZGynmgej1X8wQT8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194123; c=relaxed/simple;
	bh=LfkJfSlF/ZNtBQh9jZIQQQ9Goo3g2BuiqPfow10xv2o=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=H24vOU8AgczTm86dCijMGQW4Pl6PXuWv8pF2VQiQmvGPENAxtQzS9QvwvR/V1uBPfe7+2SohEUVo9PFcHgIK8303Kwd6IKy9nqAQHLmH2/iViMtLk4uB2an7iymssljXDnV3c4XE+iUXlt9kKshoXWXQwsX0fWKJiyTNIoXpn3Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com; spf=pass smtp.mailfrom=os.amperecomputing.com; dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b=rSHHCTjJ; arc=fail smtp.client-ip=40.107.220.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=os.amperecomputing.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=os.amperecomputing.com header.i=@os.amperecomputing.com header.b="rSHHCTjJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csMuYvvYqaVoOgNtPQJBeUZBs1R2LBKCoS2gEOrKpSLj4h4OkT+3wqzwtZWRFIvny1sTN8vK/4CkwyBLZkNdZhh6IDBGG2naxB/vurDSS5F3eKxiWQcNHP+YPc5v2SLkCH5XCKcR9aiJiAphaJN9UHGsIJsg0VRGBgUcueB1fEj6CCEup2l+9JqHoNgyfglRbhvtgbMYyivM5Vf8SVfOGpZ8OcPPx6g5XgwinXMEjPPccc7NiO01LbfY4LIHvws7M6jOMivS25sqe7rB2fSS3Q3OAa4jsW1PiUQ3wnjGCwLUTq3cs0rPfGUVCoZyDADBJw7UUzn50lbocjzyDIXYeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i5VJeruZ0qbWtkUkzu0T0b8P9aa2uRLMc43WTU52hAo=;
 b=trQBmEuY50RH1z8kNh6QaOMpLzT28RPbbSXBo30WBgyZYd41Sl0rtmwoxcZoaYaQWcLEam6ZtQJRHYNYjysxCA2YZjabXI+s7CytSusHSfydqP0Ixh2vxx6hPCwt2cKQCJSEDenZp59SkMkAtROqNhVK1/vncZ9WOYFXSEWuQORd8aHsZC4VsZuDveEwLQeIK9Hf1GhXy0rt7fyX5sQJ6zX0utDKd7NSwvhbugqvOdwkVcc3T7bN+PmDd4gBhowKC0ayZz7KsLk05UX8QE7lthgNYTmz42BS8elyw3ZqxbtfIjVeq3a/hEEFscSTw+kLay/3QdKR+anOc5Ha5d2+/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=os.amperecomputing.com; dmarc=pass action=none
 header.from=os.amperecomputing.com; dkim=pass
 header.d=os.amperecomputing.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=os.amperecomputing.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i5VJeruZ0qbWtkUkzu0T0b8P9aa2uRLMc43WTU52hAo=;
 b=rSHHCTjJcxlA9/YHGKoofdJQWbvU0P0S1NIDeVqd0amszq9xfs8GeVFik3vNBpsBlaRASxPL3xx+xUPW1oFSsxWTbGft2iAQclMTLQq9MOVUmAv0EZrDoBjb9XwLbVVzcDmzqsLEBaNEhIhCTPUyW8npShX3YMWhZ5Pn6Uk9vqI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=os.amperecomputing.com;
Received: from CH0PR01MB6873.prod.exchangelabs.com (2603:10b6:610:112::22) by
 SJ0PR01MB6494.prod.exchangelabs.com (2603:10b6:a03:2a0::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.25; Tue, 17 Jun 2025 21:01:56 +0000
Received: from CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460]) by CH0PR01MB6873.prod.exchangelabs.com
 ([fe80::3850:9112:f3bf:6460%6]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 21:01:56 +0000
Message-ID: <1b93a5a8-f2b9-4c74-b3c9-8a1776efd8cc@os.amperecomputing.com>
Date: Tue, 17 Jun 2025 14:01:53 -0700
User-Agent: Mozilla Thunderbird
From: Yang Shi <yang@os.amperecomputing.com>
Subject: Re: [PATCH 3/4] arm64: mm: support large block mapping when
 rodata=full
To: Ryan Roberts <ryan.roberts@arm.com>, will@kernel.org,
 catalin.marinas@arm.com, Miko.Lenczewski@arm.com, dev.jain@arm.com,
 scott@os.amperecomputing.com, cl@gentwo.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250531024545.1101304-1-yang@os.amperecomputing.com>
 <20250531024545.1101304-4-yang@os.amperecomputing.com>
 <60a7e30e-73f4-4e0f-aee5-606808a18a61@arm.com>
 <aa932ea3-d408-40a1-a734-60ac8fc73a50@arm.com>
Content-Language: en-US
In-Reply-To: <aa932ea3-d408-40a1-a734-60ac8fc73a50@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CY8PR10CA0047.namprd10.prod.outlook.com
 (2603:10b6:930:4b::25) To CH0PR01MB6873.prod.exchangelabs.com
 (2603:10b6:610:112::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR01MB6873:EE_|SJ0PR01MB6494:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c37a340-42e2-4eab-3ed1-08ddade231bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDRSaE9xMDAxTlFQNDJZcjBlTEh0TGhhV2grOWRVdmM4RENlYTFJaGpCcVNv?=
 =?utf-8?B?RGVra3dCbTV2RzFPaXdGQ1luNEQ4RzJJVkZZNVc3RlE1UHhhQXhWdkpzVk8x?=
 =?utf-8?B?YmdUUHlMOWRYVEZiSVZITHFsa0JNZUtCdnJVMzVGbDF4eGlNZ3pkNnpWVEZB?=
 =?utf-8?B?UUJWUitXSXNzK0I0ZTZZeWJ6S2VnUloxK2pjYVNLUHlRU3BGQzVQZmV5Z3lq?=
 =?utf-8?B?c21vOFlsUGd0UXFOZUpOTzFYcE9Ud0R4ZnVJVWdnS29TdjR2bHhzcW9nMTJL?=
 =?utf-8?B?RTlOYks4VmhQSE1MZ3orb2w1UElRanFuQWg2eGloRWR3cVpPeXl3Nzdtd0hz?=
 =?utf-8?B?cGVxbnIvSEFGN21iTHoyMDJadE5YcDRvUCt2VG5PbERBY1ltYjVpZ1F1bjBu?=
 =?utf-8?B?U3pMWTdpRktrbVl4dVY5R0Z2T3dsVzNaUGx2K2diT0NMTGpBcDMyNWtmSDhN?=
 =?utf-8?B?YTY4U2dyQksrTzJ5VjJpbEM1d1I0SFQ0a0lqbTdrMnU0d3l1Z3VNNGFpMFBw?=
 =?utf-8?B?QVhhYjJiWlhjbnY1cllVK3I3clhiQ1F1M3cvQ3YwVDJwMFYrUlE4cmg2Rkkv?=
 =?utf-8?B?VWVyOG95QTY0dEtYTTBPUXpZT3RRVHZGbVlydVhHamM2THVpWFJ5bnJGdGpa?=
 =?utf-8?B?aEl0SWRLWFBSVG5lOTlaNDVrQmJleFgwci9Wd3BOaDBycWtLamZzZlI2MFZF?=
 =?utf-8?B?aTlUQUdFWTdCdS9iWGFNY092bFdWSVAxVWpiSFFLL2J1WFBuVmV0M0xHNzRz?=
 =?utf-8?B?cFFpNXFzUWFPRktOd3U2eGN1SWtzbVZiazBpZGZtbCtzS01XZXdNWG9QOW9P?=
 =?utf-8?B?ZnFsREZNQStSM2MwSEJsQ2hnYnZFcHNuRWN5UVh5Q0R3cTNzelUwR2pqUE9W?=
 =?utf-8?B?SkNNMENGVUY4SC83bnR4enhhR3djU3RISEtYd0pTSUN1SU5WVWVCUC9JWU11?=
 =?utf-8?B?c2xYZnN5K1pzSWRrOUxDZnBLUWNobk1PcHZIbnFTTDlLR040eU1vR1Z3eXVi?=
 =?utf-8?B?OHpxdmhBWlBMV0R5YVlDMW5oYnZSOS9oeEhVZkpZcWFMNUE4N3prQTdyZk0r?=
 =?utf-8?B?MEd3RUVSOUd1TWVONFFNbHNmK3Fwd01mVkpxbHNjazRISENBTSthQllVTFlm?=
 =?utf-8?B?RW93ejhmaEh6ZW04VTBiM0puY3RGTi8ydlRxQTVXV0hKeGZYa09UQzdVYjdL?=
 =?utf-8?B?cXRRU3pRWFhiSUtaMHFvVFBhb1RXQnZZVkRTVEpxc2RMRjJhbUw1eDlieGtG?=
 =?utf-8?B?TXRrNVlaTzhKb3dkaStMT292TmtOdDdKUjVGbk8ybGtiR3ZWUDB0Qmw2SlVT?=
 =?utf-8?B?cllnNVdEMnBFaHVLMEx3bGFFaW9BbGxlLzIvRlVENjBBU2hOck9VOGUzQ2Fu?=
 =?utf-8?B?Y0RrZFd5YURDcnd1TUwvc2RtVG0yc1BYK3dJUVQyb2hLeExvR3dpb2tJWk9x?=
 =?utf-8?B?OG1hVzA4ZTU1TE16eFlHcklPK29hZDJiLytVZm1rTVdBVXB2NS9YbFVTQTZS?=
 =?utf-8?B?VUo4cllLanpGazExYnFsRmVBSmlUL3pycTdmMWlPTTV2b3d1U3hoNlNHN21K?=
 =?utf-8?B?aEFaT1AweW1Ta0p1L2xrRldnS3lRR01SbVZmellialVUUldqOVpyQ01yZDB3?=
 =?utf-8?B?aWx1SDBJUGhsSjNLcXVkN2ZzNFpnQU16c2hHdXJ2WHdDQ2Z4aVR1VXVsKzR2?=
 =?utf-8?B?NWZJRkhuQzcwZjh3UFZyZW56ci9WdTEvY2JOQjh4RFU0MEc0TWxXUUJhZ2pi?=
 =?utf-8?B?R0ZtSlk2Y2h2YXJkaGVFWncrb0FpQm93R3poUzhPRnRhc08xeWhJS2FPb0wv?=
 =?utf-8?B?VWREVDhaMHI3T29iR1UvRkFlbkw3NzIvY0ZBR2tBYTJCOHJkd2hiV0VwY1JR?=
 =?utf-8?B?SUxRb01CdEcvaU1rQXdFSHFsMDZod2pObWlpVU9Kb2UxTnVNS2NaSS9FcHBj?=
 =?utf-8?Q?4tYoja05in0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR01MB6873.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cmhkbFB6L1lpOHNhc1lXZmdJdzlZcmxmZG5kbjMvbUZpRnVKYmNNT2lkUW5w?=
 =?utf-8?B?L21MMXUzT2FjQmsreTFmeXhwN0IrZkg0cFRUNEJ2Qjcza1ZobVUxTU5nNkZn?=
 =?utf-8?B?Z2lSSENMemM5TVdLVXBMcTdJVTQ4cFV1bXN2a1JLaTZ3L0ZCeEtoeXZIUHFW?=
 =?utf-8?B?L1VRWVNXeGZmN09sTHB0enlKV25SS0Z0TzZHMmxPRUdyOUgrcVFMVXZveGhJ?=
 =?utf-8?B?RFBHOFBPdUdoL3RKMGluTDk5cklMZnA5SmovVmdNd2F6MkVtNE9kRDI5bUlM?=
 =?utf-8?B?ZnY3YS93Q0R0TG54K1BlYTM4U01uNTJXaGZ4WWp5MEEwSHhVYlVrckR1VDFV?=
 =?utf-8?B?aVhUQUR3VWNjdXNualhlei9oaXpoR1VWQVQyeHVIUXg4WTZTc2tQQXpkN2RM?=
 =?utf-8?B?cmF1L3RUR1d6eFkrQzlNa0FtNGVrSGdpSm9QQktlSy9PL2xWdTVFN2UvN0Nm?=
 =?utf-8?B?Ui8yY25VRTdXdXplRkxvMDd2Sk1aVElrK2Z0eWxRM3pLbzcwUjVrRHAvdHhQ?=
 =?utf-8?B?cGJuK00vYm1ndjlmZHkza2VjZE9vUTVjUkZaaWdkbW40MVZtRjNDVlFBK1hj?=
 =?utf-8?B?NkVWdENlV0dxczlNZUFHR2owdmZYb3lRV2daajNhYVBIMmRzcDd5eVJobE44?=
 =?utf-8?B?dURWUjNhTkJSNWRmTU1MWGtsaURvNjBwUjNTTVRpWno2dkRmYmF2aHZEajlr?=
 =?utf-8?B?SnNtTm40Z3hmZ2lwTHMzYjBZZG5UaEd1UENOR2VQRC84NHJtMERqQmZ3YitB?=
 =?utf-8?B?a2UrWndHMUVEcmU3TGQxdk02YWlRMmdaUDFwL3JLUnRTWnQ5YWdOSWxZcWg3?=
 =?utf-8?B?bXo3M0NzUEZ4R1hIQS9DeUoycVFudE1YUENiNnljc3gxNEJrdHg0dXU4ME1E?=
 =?utf-8?B?Y3FPMWRnTG1abVNNUEZZNFlGaVBOeEZISkFDSnhBWXI5UjNnSTRpS09DWURB?=
 =?utf-8?B?WUxvRmRMT29TOGhZQ0dudU1taDBOd0lYMllva08wUkJ0YVpyM0l2emcvUXg3?=
 =?utf-8?B?am93cUxWcVBlZDVYbENPRjVBZHVGMmNWWmpUL2t3UWp5Z2ZzdGsxRTEzM1dx?=
 =?utf-8?B?TUYwRWRLMTlBNHZxSVZMM21FN2NJQlZncjh2TXpzU0hNZ3IxOFd1Q0Z1SG01?=
 =?utf-8?B?WHZQYWZuQ21Gb1NzQ1VzU0RqZkltWFVHS2VjR1Nvb0hEQ3FRUjdsRmtxTHVR?=
 =?utf-8?B?UnRicU9rVEkyRC9lUFR2eVpnUGhSdW9jdnpuaS9MTlB3SEZZblUzVmp4VStV?=
 =?utf-8?B?R2JydENCc3psZXZxRnVQWWxWK2U5ajNqN3FaQXBRcVZxcXJqTGhUUXBpRjNO?=
 =?utf-8?B?eCt6c0RKSFYzOXphWjYveHVRUGE0V1JONEtRS3BSQldubjdURXMwSU5CV01i?=
 =?utf-8?B?MkpVZ0VPLytoMkRWZFpEaStmamhpM1QwQjhXSjM4Qk9EWUVTaHlVa1MxajBS?=
 =?utf-8?B?cXRXc0VHZytkaUozWHRWcFBaS0Rlb0VsR2xwd0NXeHBKMEJJN3o3SmN6Q0Vx?=
 =?utf-8?B?Q1p0UmZsYXJ5WUQyQUlYOURUeHFkUHlEZ09xSjUyOVNKQzJ1TEdTeEhtV3Fz?=
 =?utf-8?B?S2U1eHl2Ti9wT0l3VFFRQldrRE93cjhLUm01WTNXazI5ZU9IcnhhcnZqdTV0?=
 =?utf-8?B?NkMzSmNDellyendwZWNLSWI5Z0JuUFQ3RFlkUmxVdnU3T3lMWkI5eUlnV09n?=
 =?utf-8?B?cFZOQVBpbUlKaWs0SWVCYmZsRHZ4OWszdlE5Z1lTYVYyRjNDM0d1anl0UlhG?=
 =?utf-8?B?aVhrUU9LcXpoRGV0ekFhYVRxYjN2K1NEVVd5SGFTZnRuazNTdTQ4Wm1FRmRp?=
 =?utf-8?B?SE1uZWwrdUlVaTN0NGlON0ZySlpCSndydkJsRVRvVEc2WXluT2o0ZnNCVkoy?=
 =?utf-8?B?dUtwWnF5ZEMvWFJkdDQzK00xUllPL0JPYmxPb0tVNnMzWk5vNkJWTEg4VGQ0?=
 =?utf-8?B?MEd3NjVJWkJldmhoVzRmZnNvYjJoN3ZFNmZNbHpkdmhjTjdKWGFjbWU2c3Vi?=
 =?utf-8?B?QWdaTUZzQ1RZWTlUaFlTUDFMVVR5U2JYeko4OHFDRHRBdEQ4ZWZsTjY5VTRs?=
 =?utf-8?B?dFNWOG14citJakkyMEtQZHhRS2dBU0gxZTEvVDF0bzJDNmtZWENHWDB4U1A4?=
 =?utf-8?B?R29IMDFNTGZDRnByUkJxSFAyRmZLVTFQMlJKUnpEQUZjR0hTNnZrR2dwU1Ja?=
 =?utf-8?Q?QrAKiLH48yJ2op9BqsY0DdU=3D?=
X-OriginatorOrg: os.amperecomputing.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c37a340-42e2-4eab-3ed1-08ddade231bd
X-MS-Exchange-CrossTenant-AuthSource: CH0PR01MB6873.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 21:01:56.6534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3bc2b170-fd94-476d-b0ce-4229bdc904a7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8LfVhPWGb/UcMmas6JnLOxK5hVbJjmTUcDb1/ZXmZpijPnD2QhpvolFCst+pXbGLPGKplHwmz+Ygqm+PbjVuwy+yMPNXTBUpdE86sT1G9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR01MB6494



On 6/16/25 5:33 AM, Ryan Roberts wrote:
> On 16/06/2025 12:58, Ryan Roberts wrote:
>> On 31/05/2025 03:41, Yang Shi wrote:
>>> When rodata=full is specified, kernel linear mapping has to be mapped at
>>> PTE level since large page table can't be split due to break-before-make
>>> rule on ARM64.
>>>
>>> This resulted in a couple of problems:
>>>    - performance degradation
>>>    - more TLB pressure
>>>    - memory waste for kernel page table
>>>
>>> With FEAT_BBM level 2 support, splitting large block page table to
>>> smaller ones doesn't need to make the page table entry invalid anymore.
>>> This allows kernel split large block mapping on the fly.
>>>
>>> Add kernel page table split support and use large block mapping by
>>> default when FEAT_BBM level 2 is supported for rodata=full.  When
>>> changing permissions for kernel linear mapping, the page table will be
>>> split to smaller size.
>>>
>>> The machine without FEAT_BBM level 2 will fallback to have kernel linear
>>> mapping PTE-mapped when rodata=full.
>>>
>>> With this we saw significant performance boost with some benchmarks and
>>> much less memory consumption on my AmpereOne machine (192 cores, 1P) with
>>> 256GB memory.
>>>
>>> * Memory use after boot
>>> Before:
>>> MemTotal:       258988984 kB
>>> MemFree:        254821700 kB
>>>
>>> After:
>>> MemTotal:       259505132 kB
>>> MemFree:        255410264 kB
>>>
>>> Around 500MB more memory are free to use.  The larger the machine, the
>>> more memory saved.
>>>
>>> * Memcached
>>> We saw performance degradation when running Memcached benchmark with
>>> rodata=full vs rodata=on.  Our profiling pointed to kernel TLB pressure.
>>> With this patchset we saw ops/sec is increased by around 3.5%, P99
>>> latency is reduced by around 9.6%.
>>> The gain mainly came from reduced kernel TLB misses.  The kernel TLB
>>> MPKI is reduced by 28.5%.
>>>
>>> The benchmark data is now on par with rodata=on too.
>>>
>>> * Disk encryption (dm-crypt) benchmark
>>> Ran fio benchmark with the below command on a 128G ramdisk (ext4) with disk
>>> encryption (by dm-crypt).
>>> fio --directory=/data --random_generator=lfsr --norandommap --randrepeat 1 \
>>>      --status-interval=999 --rw=write --bs=4k --loops=1 --ioengine=sync \
>>>      --iodepth=1 --numjobs=1 --fsync_on_close=1 --group_reporting --thread \
>>>      --name=iops-test-job --eta-newline=1 --size 100G
>>>
>>> The IOPS is increased by 90% - 150% (the variance is high, but the worst
>>> number of good case is around 90% more than the best number of bad case).
>>> The bandwidth is increased and the avg clat is reduced proportionally.
>>>
>>> * Sequential file read
>>> Read 100G file sequentially on XFS (xfs_io read with page cache populated).
>>> The bandwidth is increased by 150%.
>>>
>>> Signed-off-by: Yang Shi<yang@os.amperecomputing.com>
>>> ---
>>>   arch/arm64/include/asm/cpufeature.h |  26 +++
>>>   arch/arm64/include/asm/mmu.h        |   1 +
>>>   arch/arm64/include/asm/pgtable.h    |  12 +-
>>>   arch/arm64/kernel/cpufeature.c      |   2 +-
>>>   arch/arm64/mm/mmu.c                 | 269 +++++++++++++++++++++++++---
>>>   arch/arm64/mm/pageattr.c            |  37 +++-
>>>   6 files changed, 319 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>>> index 8f36ffa16b73..a95806980298 100644
>>> --- a/arch/arm64/include/asm/cpufeature.h
>>> +++ b/arch/arm64/include/asm/cpufeature.h
>>> @@ -1053,6 +1053,32 @@ static inline bool cpu_has_lpa2(void)
>>>   #endif
>>>   }
>>>   
>>> +bool cpu_has_bbml2_noabort(unsigned int cpu_midr);
>>> +
>>> +static inline bool has_nobbml2_override(void)
>>> +{
>>> +	u64 mmfr2;
>>> +	unsigned int bbm;
>>> +
>>> +	mmfr2 = read_sysreg_s(SYS_ID_AA64MMFR2_EL1);
>>> +	mmfr2 &= ~id_aa64mmfr2_override.mask;
>>> +	mmfr2 |= id_aa64mmfr2_override.val;
>>> +	bbm = cpuid_feature_extract_unsigned_field(mmfr2,
>>> +						   ID_AA64MMFR2_EL1_BBM_SHIFT);
>>> +	return bbm == 0;
>>> +}
>>> +
>>> +/*
>>> + * Called at early boot stage on boot CPU before cpu info and cpu feature
>>> + * are ready.
>>> + */
>>> +static inline bool bbml2_noabort_available(void)
>>> +{
>>> +	return IS_ENABLED(CONFIG_ARM64_BBML2_NOABORT) &&
>>> +	       cpu_has_bbml2_noabort(read_cpuid_id()) &&
>>> +	       !has_nobbml2_override();
>> Based on Will's feedback, The Kconfig and the cmdline override will both
>> disappear in Miko's next version and we will only use the MIDR list to decide
>> BBML2_NOABORT status, so this will significantly simplify. Sorry about the churn
>> here.

Good news! I just saw Miko's v7 series, will rebase on to it.

>>> +}
>>> +
>>>   #endif /* __ASSEMBLY__ */
>>>   
>>>   #endif
>>> diff --git a/arch/arm64/include/asm/mmu.h b/arch/arm64/include/asm/mmu.h
>>> index 6e8aa8e72601..2693d63bf837 100644
>>> --- a/arch/arm64/include/asm/mmu.h
>>> +++ b/arch/arm64/include/asm/mmu.h
>>> @@ -71,6 +71,7 @@ extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>>>   			       pgprot_t prot, bool page_mappings_only);
>>>   extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
>>>   extern void mark_linear_text_alias_ro(void);
>>> +extern int split_linear_mapping(unsigned long start, unsigned long end);
>> nit: Perhaps split_leaf_mapping() or split_kernel_pgtable_mapping() or something
>> similar is more generic which will benefit us in future when using this for
>> vmalloc too?

Yeah, sure. Will use split_kernel_pgtable_mapping().

>>>   
>>>   /*
>>>    * This check is triggered during the early boot before the cpufeature
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>>> index d3b538be1500..bf3cef31d243 100644
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -293,6 +293,11 @@ static inline pmd_t pmd_mkcont(pmd_t pmd)
>>>   	return __pmd(pmd_val(pmd) | PMD_SECT_CONT);
>>>   }
>>>   
>>> +static inline pmd_t pmd_mknoncont(pmd_t pmd)
>>> +{
>>> +	return __pmd(pmd_val(pmd) & ~PMD_SECT_CONT);
>>> +}
>>> +
>>>   static inline pte_t pte_mkdevmap(pte_t pte)
>>>   {
>>>   	return set_pte_bit(pte, __pgprot(PTE_DEVMAP | PTE_SPECIAL));
>>> @@ -769,7 +774,7 @@ static inline bool in_swapper_pgdir(void *addr)
>>>   	        ((unsigned long)swapper_pg_dir & PAGE_MASK);
>>>   }
>>>   
>>> -static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>> +static inline void __set_pmd_nosync(pmd_t *pmdp, pmd_t pmd)
>>>   {
>>>   #ifdef __PAGETABLE_PMD_FOLDED
>>>   	if (in_swapper_pgdir(pmdp)) {
>>> @@ -779,6 +784,11 @@ static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>>   #endif /* __PAGETABLE_PMD_FOLDED */
>>>   
>>>   	WRITE_ONCE(*pmdp, pmd);
>>> +}
>>> +
>>> +static inline void set_pmd(pmd_t *pmdp, pmd_t pmd)
>>> +{
>>> +	__set_pmd_nosync(pmdp, pmd);
>>>   
>>>   	if (pmd_valid(pmd)) {
>>>   		dsb(ishst);
>>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>>> index e879bfcf853b..5fc2a4a804de 100644
>>> --- a/arch/arm64/kernel/cpufeature.c
>>> +++ b/arch/arm64/kernel/cpufeature.c
>>> @@ -2209,7 +2209,7 @@ static bool hvhe_possible(const struct arm64_cpu_capabilities *entry,
>>>   	return arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_HVHE);
>>>   }
>>>   
>>> -static bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>>> +bool cpu_has_bbml2_noabort(unsigned int cpu_midr)
>>>   {
>>>   	/*
>>>   	 * We want to allow usage of bbml2 in as wide a range of kernel contexts
>> [...] I'll send a separate response for the mmu.c table walker changes.
>>
>>>   
>>> +int split_linear_mapping(unsigned long start, unsigned long end)
>>> +{
>>> +	int ret = 0;
>>> +
>>> +	if (!system_supports_bbml2_noabort())
>>> +		return 0;
>> Hmm... I guess the thinking here is that for !BBML2_NOABORT you are expecting
>> this function should only be called in the first place if we know we are
>> pte-mapped. So I guess this is ok... it just means that if we are not
>> pte-mapped, warnings will be emitted while walking the pgtables (as is the case
>> today). So I think this approach is ok.

Yes, we can't split kernel page table on the fly w/o BBML2_NOABORT and 
kernel linear mapping should be always PTE-mapped so it returns 0 
instead of errno.

>>> +
>>> +	mmap_write_lock(&init_mm);
>> What is the lock protecting? I was orignally thinking no locking should be
>> needed because it's not needed for permission changes today; But I think you are
>> right here and we do need locking; multiple owners could share a large leaf
>> mapping, I guess? And in that case you could get concurrent attempts to split
>> from both owners.

Yes, for example, [addr, addr + 4K) and [addr + 4K, addr + 8K) may 
belong to two different owners. There may be race when both the owners 
want to split the page table.

>> I'm not really a fan of adding the extra locking though; It might introduce a
>> new bottleneck. I wonder if there is a way we could do this locklessly? i.e.
>> allocate the new table, then cmpxchg to insert and the loser has to free? That
>> doesn't work for contiguous mappings though...

I'm not sure whether it is going to be a real bottleneck or not. I saw 
x86 uses a dedicated lock, called cpa_lock. So it seems the lock 
contention is not a real problem.
I used init_mm mmap_lock instead of inventing a new lock. My thought is 
we can start from something simple, we can optimize it if it turns out 
to be a problem.

>>> +	/* NO_EXEC_MAPPINGS is needed when splitting linear map */
>>> +	ret = __create_pgd_mapping_locked(init_mm.pgd, virt_to_phys((void *)start),
>>> +					  start, (end - start), __pgprot(0),
>>> +					  __pgd_pgtable_alloc,
>>> +					  NO_EXEC_MAPPINGS | SPLIT_MAPPINGS);
>>> +	mmap_write_unlock(&init_mm);
>>> +	flush_tlb_kernel_range(start, end);
>> I don't believe we should need to flush the TLB when only changing entry sizes
>> when BBML2 is supported. Miko's series has a massive comment explaining the
>> reasoning. That applies to user space though. We should consider if this all
>> works safely for kernel space too, and hopefully remove the flush.

I think it should be same with userspace. The point is hardware will 
handle TLB conflict gracefully with BBML2_NOABORT, and hardware does the 
same thing for userspace address and kernel address, so the tlb flush 
should be not necessary. The TLB pressure or implicit invalidation for 
conflict TLB will do the job.

>>> +
>>> +	return ret;
>>> +}
>>> +
>>>   /*
>>>    * This function can only be used to modify existing table entries,
>>>    * without allocating new levels of table. Note that this permits the
>>> @@ -676,6 +887,24 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
>>>   
>>>   #endif /* CONFIG_KFENCE */
>>>   
>>> +static inline bool force_pte_mapping(void)
>>> +{
>>> +	/*
>>> +	 * Can't use cpufeature API to determine whether BBML2 supported
>>> +	 * or not since cpufeature have not been finalized yet.
>>> +	 *
>>> +	 * Checking the boot CPU only for now.  If the boot CPU has
>>> +	 * BBML2, paint linear mapping with block mapping.  If it turns
>>> +	 * out the secondary CPUs don't support BBML2 once cpufeature is
>>> +	 * fininalized, the linear mapping will be repainted with PTE
>>> +	 * mapping.
>>> +	 */
>>> +	return (rodata_full && !bbml2_noabort_available()) ||
>> So this is the case where we don't have BBML2 and need to modify protections at
>> page granularity - I agree we need to force pte mappings here.
>>
>>> +		debug_pagealloc_enabled() ||
>> This is the case where every page is made invalid on free and valid on
>> allocation, so no point in having block mappings because it will soon degenerate
>> into page mappings because we will have to split on every allocation. Agree here
>> too.
>>
>>> +		arm64_kfence_can_set_direct_map() ||
>> After looking into how kfence works, I don't agree with this one. It has a
>> dedicated pool where it allocates from. That pool may be allocated early by the
>> arch or may be allocated late by the core code. Either way, kfence will only
>> modify protections within that pool. You current approach is forcing pte
>> mappings if the pool allocation is late (i.e. not performed by the arch code
>> during boot). But I think "late" is the most common case; kfence is compiled
>> into the kernel but not active at boot. Certainly that's how my Ubuntu kernel is
>> configured. So I think we should just ignore kfence here. If it's "early" then
>> we map the pool with page granularity (as an optimization). If it's "late" your
>> splitter will degenerate the whole kfence pool to page mappings over time as
>> kfence_protect_page() -> set_memory_valid() is called. But the bulk of the
>> linear map will remain mapped with large blocks.

OK, thanks for looking into this. I misunderstood how the late pool works.

>>> +		is_realm_world();
>> I think the only reason this requires pte mappings is for
>> __set_memory_enc_dec(). But that can now deal with block mappings given the
>> ability to split the mappings as needed. So I think this condition can be
>> removed too.

Sure

> To clarify; the latter 2 would still be needed for the !BBML2_NOABORT case. So I
> think the expression becomes:
>
> 	return (!bbml2_noabort_available() && (rodata_full ||
> 		arm64_kfence_can_set_direct_map() || is_realm_world())) ||
> 		debug_pagealloc_enabled();

Thanks for coming up with this expression.

Thanks,
Yang

> Thanks,
> Ryan
>
>>> +}
>> Additionally, for can_set_direct_map(); at minimum it's comment should be tidied
>> up, but really I think it should return true if "BBML2_NOABORT ||
>> force_pte_mapping()". Because they are the conditions under which we can now
>> safely modify the linear map.
>>
>>> +
>>>   static void __init map_mem(pgd_t *pgdp)
>>>   {
>>>   	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
>>> @@ -701,7 +930,7 @@ static void __init map_mem(pgd_t *pgdp)
>>>   
>>>   	early_kfence_pool = arm64_kfence_alloc_pool();
>>>   
>>> -	if (can_set_direct_map())
>>> +	if (force_pte_mapping())
>>>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>   
>>>   	/*
>>> @@ -1402,7 +1631,7 @@ int arch_add_memory(int nid, u64 start, u64 size,
>>>   
>>>   	VM_BUG_ON(!mhp_range_allowed(start, size, true));
>>>   
>>> -	if (can_set_direct_map())
>>> +	if (force_pte_mapping())
>>>   		flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>>>   
>>>   	__create_pgd_mapping(swapper_pg_dir, start, __phys_to_virt(start),
>>> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>>> index 39fd1f7ff02a..25c068712cb5 100644
>>> --- a/arch/arm64/mm/pageattr.c
>>> +++ b/arch/arm64/mm/pageattr.c
>>> @@ -10,6 +10,7 @@
>>>   #include <linux/vmalloc.h>
>>>   
>>>   #include <asm/cacheflush.h>
>>> +#include <asm/mmu.h>
>>>   #include <asm/pgtable-prot.h>
>>>   #include <asm/set_memory.h>
>>>   #include <asm/tlbflush.h>
>>> @@ -42,6 +43,8 @@ static int change_page_range(pte_t *ptep, unsigned long addr, void *data)
>>>   	struct page_change_data *cdata = data;
>>>   	pte_t pte = __ptep_get(ptep);
>>>   
>>> +	BUG_ON(pte_cont(pte));
>> I don't think this is required; We want to enable using contiguous mappings
>> where it makes sense. As long as we have BBML2, we can update contiguous pte
>> mappings in place, as long as we update all of the ptes in the contiguous block.
>> split_linear_map() should either have converted to non-cont mappings if the
>> contiguous block straddled the split point, or would have left as is (or
>> downgraded a PMD-block to a contpte block) if fully contained within the split
>> range.
>>
>>> +
>>>   	pte = clear_pte_bit(pte, cdata->clear_mask);
>>>   	pte = set_pte_bit(pte, cdata->set_mask);
>>>   
>>> @@ -80,8 +83,9 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>   	unsigned long start = addr;
>>>   	unsigned long size = PAGE_SIZE * numpages;
>>>   	unsigned long end = start + size;
>>> +	unsigned long l_start;
>>>   	struct vm_struct *area;
>>> -	int i;
>>> +	int i, ret;
>>>   
>>>   	if (!PAGE_ALIGNED(addr)) {
>>>   		start &= PAGE_MASK;
>>> @@ -118,7 +122,12 @@ static int change_memory_common(unsigned long addr, int numpages,
>>>   	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>>>   			    pgprot_val(clear_mask) == PTE_RDONLY)) {
>>>   		for (i = 0; i < area->nr_pages; i++) {
>>> -			__change_memory_common((u64)page_address(area->pages[i]),
>>> +			l_start = (u64)page_address(area->pages[i]);
>>> +			ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
>>> +			if (WARN_ON_ONCE(ret))
>>> +				return ret;
>> I don't think this is the right place to integrate; I think the split should be
>> done inside __change_memory_common(). Then it caters to all possibilities (i.e.
>> set_memory_valid() and __set_memory_enc_dec()). This means it will run for
>> vmalloc too, but for now, that will be a nop because everything should already
>> be split as required on entry and in future we will get that for free.
>>
>> Once you have integrated Dev's series, the hook becomes
>> ___change_memory_common() (3 underscores)...
>>
>>> +
>>> +			__change_memory_common(l_start,
>>>   					       PAGE_SIZE, set_mask, clear_mask);
>>>   		}
>>>   	}
>>> @@ -174,6 +183,9 @@ int set_memory_valid(unsigned long addr, int numpages, int enable)
>>>   
>>>   int set_direct_map_invalid_noflush(struct page *page)
>>>   {
>>> +	unsigned long l_start;
>>> +	int ret;
>>> +
>>>   	struct page_change_data data = {
>>>   		.set_mask = __pgprot(0),
>>>   		.clear_mask = __pgprot(PTE_VALID),
>>> @@ -182,13 +194,21 @@ int set_direct_map_invalid_noflush(struct page *page)
>>>   	if (!can_set_direct_map())
>>>   		return 0;
>>>   
>>> +	l_start = (unsigned long)page_address(page);
>>> +	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
>>> +	if (WARN_ON_ONCE(ret))
>>> +		return ret;
>>> +
>>>   	return apply_to_page_range(&init_mm,
>>> -				   (unsigned long)page_address(page),
>>> -				   PAGE_SIZE, change_page_range, &data);
>>> +				   l_start, PAGE_SIZE, change_page_range,
>>> +				   &data);
>> ...and once integrated with Dev's series you don't need any changes here...
>>
>>>   }
>>>   
>>>   int set_direct_map_default_noflush(struct page *page)
>>>   {
>>> +	unsigned long l_start;
>>> +	int ret;
>>> +
>>>   	struct page_change_data data = {
>>>   		.set_mask = __pgprot(PTE_VALID | PTE_WRITE),
>>>   		.clear_mask = __pgprot(PTE_RDONLY),
>>> @@ -197,9 +217,14 @@ int set_direct_map_default_noflush(struct page *page)
>>>   	if (!can_set_direct_map())
>>>   		return 0;
>>>   
>>> +	l_start = (unsigned long)page_address(page);
>>> +	ret = split_linear_mapping(l_start, l_start + PAGE_SIZE);
>>> +	if (WARN_ON_ONCE(ret))
>>> +		return ret;
>>> +
>>>   	return apply_to_page_range(&init_mm,
>>> -				   (unsigned long)page_address(page),
>>> -				   PAGE_SIZE, change_page_range, &data);
>>> +				   l_start, PAGE_SIZE, change_page_range,
>>> +				   &data);
>> ...or here.
>>
>> Thanks,
>> Ryan
>>
>>>   }
>>>   
>>>   static int __set_memory_enc_dec(unsigned long addr,

