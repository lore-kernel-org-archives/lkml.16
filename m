Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013047.outbound.protection.outlook.com [40.107.159.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C672172632
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749113849; cv=fail; b=pnONBtJU3w9e+2VgElBgtC94/rwYXok8We1hqFnyi2+eGnOodXByR1fPv9G8mvdwMlMCgh5AtL2hkQoCMQ+EljE9Q+wxN6QKCPxf28/CKCNcvvwmuDBe5oUox3d0hd7NDNhtHhjoXfSrQCSXRmXn6U2I24VpkG7axghu8At74xU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749113849; c=relaxed/simple;
	bh=1S/Efka9B82S7Fpr29gGW7rr1irRczbNNauP00KDq4c=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Apz8cKCxT/i4unJum9aPCY8NdGtt/2hdKM4NJAsh+RLwXM7iKZPWvmUwtPW3BEQ/WIPIVqLVLuejZuAejCRW86JEvQ9L7i3r0O/wpBxd/KnLUaU9cg44SuKe8GBDY9XgbGTnil3A4hu9f+cO7sjFqyQOkNBpJCCqNxELLkas1EI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de; spf=pass smtp.mailfrom=cherry.de; dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b=R4iZ9hGw; arc=fail smtp.client-ip=40.107.159.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cherry.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherry.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cherry.de header.i=@cherry.de header.b="R4iZ9hGw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ITv95x20rVkTslgteQeyoipbKmTbAV8RfejfjPNCKrUzFQgmtWOryeBYbQdn557FxGebtt9aN/NsAfKvIx6i3T55KZpAcTMdKLEJnBOMQ7kJ72uXzzCHxUdpz6zSPP5ABqvGvoCnGZubbv/LE8Sm9AbOq1LV69AQshoRDtmcBEO2eTuHDp51WoE4hciLQU1J2E7sPAgw7sRPsBpqfWHq65yVAtA+9BCNGJl9Zzej7d7FC2ImwsV3quezP4httTNfC6sibat59rxHv0MWy/wVCFSXpiWqM+hzy+q54g436fULQWCmRyAxHMN0JV/p01WCbmxh6o7zzdfjPAAY7jvd5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVHfhI+mQ+g8i7HMu+gihQeEw/3T1qdWdRxzFcZUp2I=;
 b=ZLR9/ff1FP14eLY85ldFRhGovVBpoONJV745cOvwFCigl7emg3r0vJntnEX5BPK+68fQECcj8ndc8QcJeL8RuAkfzfppBDgRraMa62OOpLIsUCQbEg1QKNv1PMRwH1CGqckZkQmfYsZQ4Tz2uxRRgP0U1xJcs/vqZukU4LsDlimPXPT0FT6BN/j3f2nvw14o0B+x23mzbak9w4R29VLX2rgMeFUYrqPAF9n1Bq8szWEFLZDnAB0ZrWPeJ7T71GTFnU49P1VZ3zb4OQ+hdNnDoFMbfIJXAZXb+RRafjdoVX/liqn2Kn6mz1x8IZFrdB5zypRw5pfiE0FxyePXeSFiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVHfhI+mQ+g8i7HMu+gihQeEw/3T1qdWdRxzFcZUp2I=;
 b=R4iZ9hGwPSbbVVyY2Tyfw4OTBPoNcFhp3vIKRwYiH6qfjBXo45ZO0oze89ojkCd2pMrvWZQUmXAK9NPPx857hjeD9p6u2x31jw2H0NGgzv1l7kO4i9v8ml0//uQkBG2DOnqn2r223gP+9GNOhI+RmJfucOrWumv5AmYItbNR8tg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM9PR04MB7570.eurprd04.prod.outlook.com (2603:10a6:20b:281::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 5 Jun
 2025 08:57:14 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 08:57:14 +0000
Message-ID: <e4a1bf0a-0fc5-4c15-96dc-7e9c7ae3ccd5@cherry.de>
Date: Thu, 5 Jun 2025 10:57:13 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: add regulator-enable-ramp-delay to
 RK860-2/-3 regulators
To: Heiko Stuebner <heiko@sntech.de>
Cc: jonas@kwiboo.se, dsimic@manjaro.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250604202425.239924-1-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250604202425.239924-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::9) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM9PR04MB7570:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f4f8eed-84f6-42cd-af1a-08dda40ef72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGxtcHBONzlzd1crWXR6aUVwMS8zUEltOEFURmk5bFBFaVR0N0ZkM0c2QUs2?=
 =?utf-8?B?a3lHc2JTbXBkWTg2Rmc0ZTlJQ2h3YkFNS0RGZ3I3Q1B1SGlxUWdTMFVORmh6?=
 =?utf-8?B?NGxGb3hoMytvOVhwaE84REFubW5oVTV1ckFyQWp6Y09xenY4dHliK21kRDls?=
 =?utf-8?B?SlJINGtFMlVINXNtelcxS1BIMmMyUEZodEZ2SGlpeVg4RUxkMlRRL3FKZFRH?=
 =?utf-8?B?SzFmZHRFWDdSUEExSTkreEQrYlNML09ySkRkVjRIK2VKY045K2tqQ0hsd3d1?=
 =?utf-8?B?d3Z6QnRuSTB4TnVKb2thbWJkcWcvMFlkSTByREVhcTdmYUxtbTZycHJnQzFO?=
 =?utf-8?B?YUt1bmkwamVTNXg4ZVRlWUJwNHRTcXlqb1R6Qkx5eEVyQU1IY1N1TU41Szk5?=
 =?utf-8?B?WVU4NnpKRGp4aHBCeVFGbDRNejhwaDJmYUVzYTc0QXZTWkQ3OWk0OWIzQTJN?=
 =?utf-8?B?ZlFpdHNiNmhYS1ZPeUdWbEFWN1Q3RFJ3UDcvMnVxNUp0WWhQVGc2dkt3WlZw?=
 =?utf-8?B?a0VTaU83dGh3UjlOYk50S0lqV08xT215YnBCMklBeS9WVXo0UlBpYzlMVzh0?=
 =?utf-8?B?VDhiTFRNbWJwMHN2L2tTbncrbWo0V1lqMEIrRnJlZHAzWnpWQk5yNjYzelkr?=
 =?utf-8?B?cStaR0FGMW9NeTFsaWJmcHlwb3BUVC9KbWhzbElVT0wrYjlLekhicFZFM3dN?=
 =?utf-8?B?YkRUa1BiZWNxaEVoL3BpK2tPSGgzdVFrTlJGZnRCdWZmQ2h0UFZDZmk1RDNx?=
 =?utf-8?B?TjRHbGNoWGhjV1ZQVFp0NzZ2NUtOT2NwR2liRStHazFwZGhCQUxBM1g5c0Zj?=
 =?utf-8?B?RHZPWmYwcDYzQ0tjZStJMldPYVdQT3gwa0wvYjBwVmhPMUx3a2lhcjlwMXgr?=
 =?utf-8?B?V1dyL1ZRbitoaHRJeGhBM2dxd0RBazJnYVhKS1RSdFltc3cwVEVmclhlSWlQ?=
 =?utf-8?B?bnk5blQrMHVQY2I0SkFaUHZFU1lBSlhPS1R6Ri9CclFwUFNFUmw2QnQrZ2VW?=
 =?utf-8?B?VXJMSE9vckhMaUQzeDhtbEpQZ2k5MWJRTUovYkQyWExhRTFUSXJpNXZFN25k?=
 =?utf-8?B?b0pmYWpmWEd4Z243K09BOGhvUUNlRFNvK0FmUThRRnQxWWhDMlIxdFpNZXc1?=
 =?utf-8?B?bFlra2tyYXNhdzF3U1V4bXVkb1U3UU5aSCtFaUtCdlBIMzZGcXNzMmFEazh6?=
 =?utf-8?B?UGRXdHVyOUpnRlNhMmsrQUVnRngra0tzRnJqVzc1QkJ1MzZ2ais0NGljUE9a?=
 =?utf-8?B?NGZxU1hIWWNXSWc5Z0lwYVhLT2tubGNvYjhqM1F6WmQvVUhTMTlXbG4wREpD?=
 =?utf-8?B?YkdaaWU5NE94QnpCOTYyS1BzejJPTXBWZTFKQ1JCKytJL0FHclZTNURwM1Jo?=
 =?utf-8?B?OFpVZ2Nhb01zRVFKa0Z2RTFrZDRkRGowYlhZQk01c0RkbFB4eG5RN1VnZTRT?=
 =?utf-8?B?Snl0R2ZxMStrYS9tWGpLdHJNR2VHWTRsMWwyT0U4c1VJcXhJUXJvMzZrRFM1?=
 =?utf-8?B?NjVMNXBlQUhTWkQyM3lKS0c2eXdHaE5GV3lzVFl0bFAwRmt4eHRSaXlWRlpl?=
 =?utf-8?B?RDhob3BRYTYra256RzJFVkJKQW45SEpHekVEN0ozeTR4cnFkTmNEeGxMR2Qv?=
 =?utf-8?B?RXd6YkhzSHUyemwvUU9hcUxyZ2l1eUhNaTVIZDRlRDFjTzB5bWZ6Y2d4YUhu?=
 =?utf-8?B?VE14YUVjdnJHSXVUS3ZhZzlHWitQQXZ3aFA3UGozcUozd2NxT3JnY1pzenFH?=
 =?utf-8?B?YUtaSnE0THhzYnRMaHdQeEpkSXZoaTZxSi8reWRsVlV2aHhqVjBUUjQ2RHpK?=
 =?utf-8?B?TmJLeU42TlZEZE0vNzE1eUV0WDZMcURWSURIY2NuT0JHWkVQaTJtRGVJcXdt?=
 =?utf-8?B?bDh0a0c1V2p2em9tdkMvOTlCOWswM0tHd1NQNGd3ZzdtVUtSeW5ISGkzNXBt?=
 =?utf-8?Q?CEXoIv32NsI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?azZhaTFaWUIxQkFXRjJ6ZGhrUzZIZFdrKy9oRXVPZ3cyTEduSGRMSTBDczMz?=
 =?utf-8?B?OXh5SEZxeUw0c25IYUxSMndoWFNaZVVrOWd6NytlQW1pbkg0ZmUxcFo0eUxH?=
 =?utf-8?B?RmNseVVGdDR5OVVqbFZGV241M3QxSzZNeFM4UDVwd2lGVitwYVU3bnkxLzFq?=
 =?utf-8?B?VlJEY1FRVGFzY0QrMzlRWDJydmlrOTM2VkVIWTlHNzZ3YUd2b3UwSmpoRHYw?=
 =?utf-8?B?OERtNlo5MUJ3MTR0VHBSM0kwNm5ubEpNamZWRnAzQk5iWW1WTzd5d1M4Q3NR?=
 =?utf-8?B?ZFI0OFIvdjh0M1lkckJ5ZDQvYm44UmZDaVlIR09HblYrZnVFcmhoeFFreE1w?=
 =?utf-8?B?Y3ZlaTRnR2tsR09SNU1JdFEwejlxdkxvdm5JaWVORjdXVERSRmJuNTdhYW5T?=
 =?utf-8?B?WG9sTWdOZXpJenBRNkV5M3VUaWFDZDd6djdJSG5SbnMyQkYxTnk4aVZHRzVl?=
 =?utf-8?B?bWJaZElLdzZDRXZnaXM4Qkx5eTdzZ3VRUDRGRGdpWWJLOVhwbGtTQXdzeHlE?=
 =?utf-8?B?MDhTTStPMVdRY29yWWN5eHVVbEcyR3NQaUtOZUg4YndKWTJSWDNOTStaVDFH?=
 =?utf-8?B?QnRVT2VxdmtscmNoZXRBbENHT1RaamxkSUZUREJmNHpqaXVQWGtTWVlsSXov?=
 =?utf-8?B?c2E2WHlHWUMzUEpYNEJ1RzY3SHREdHZ1aFBVRHREak91RTZlcWRKdTB3eFZV?=
 =?utf-8?B?M3BTU3hnbFZJN0ZpTHdZOVN1MStPdUcvSDhqdWl4a0k5WU1RenRIblMzb1Vx?=
 =?utf-8?B?cFpMMjZvMXZtZzlmZkI3QWdMa2NjVDcwS3J6bHY2ZXpWalh6UXpkaDBldDFs?=
 =?utf-8?B?cmdoYjRGM21IU3gwUEh0bE9FRmF2MHBIQm1rWGF1UjlzcHZVczNYc0JMaTB1?=
 =?utf-8?B?b2g2SEgrT0FCWEVKWHZwOWF6d2ZSamxjSkJndXdtM1NTeERCcE4wL0djaTNz?=
 =?utf-8?B?NC8vUGRDVy9ZU294c05rb2NNSUdKSHRUZ2RHbnY5Q3RibEM5RGk1YU5YbFh4?=
 =?utf-8?B?NUg2dzI1TWNHUng2am5QaTNaOXhIWkhFdnBjcFNsNVRlS3pPK1pDTS9sL1BE?=
 =?utf-8?B?M2NLSGN6SHhBcEEvQ1JTc2d3azgwWlFrWHErOUZEYmtmV0VQcm1CYVZpQUgr?=
 =?utf-8?B?dGxsSmxJeStDQ1drYkoxTVg0aEdYVElSZFBycXMwb1VBd3pnR0tZa3kxZ1p1?=
 =?utf-8?B?NWdHOHRzRFp1TkNmRUJiZ0UwS2RteGF6ZGNZR2xHMXNwblh1TXl1Z3l2M3k5?=
 =?utf-8?B?NDJtSHpIZE5PYkUvTHUrTVdmK0thclN4NGUvYTVKMmplTFN5bmpnZjVnaWR0?=
 =?utf-8?B?SElwMk91ZmE0KzBhTnRFaGpOWUJuYzVaL2FMdXpRd3NDN3lOZGVlOGlTbUJx?=
 =?utf-8?B?Vzh1d3JmcU0wRUlCeGoyanBvNnQ5S0lZRWpxZnJsd21DNWpiRmJjSjlUL3Fz?=
 =?utf-8?B?WnREZUo1RExUVFp0NnIyN0RGNE9aeldxZkNQZ01QWCtqY3RDNTY4SFp3cGYx?=
 =?utf-8?B?cUFqZmh2R0NKQjBoa3ArVlpBN3J2aFdMTDUwaXkvKzRFNTRoSmVzdEFlVGxw?=
 =?utf-8?B?TXJ3NlZLODMyQkdiYVZrNm44RnNRbFpIS1JGby96WEhWSjRJdEE5REFFRWUw?=
 =?utf-8?B?QUQxSENzQ0Fod1FlL0JHcDZ2MmlHbS9Xdm1tNFdOWG0yemdBcmYyeEphSUQ5?=
 =?utf-8?B?NnJnSUhGOEZXeVJ1MGk1VTFSSjUvdVlNUmNmVnBHaUZvcGdUOFVPWEQxUmQ3?=
 =?utf-8?B?UXdNcEtZN1dPaEhrMjFCeUptOWlEd1liS2R2djRxU21OTFBsMkt5UXBWUFZh?=
 =?utf-8?B?Q09zbXFsS0dFc2x6dVZHcTY2Mi9YZWxYaVU1K0R4R0g5eld3YzFCS1dVZTh6?=
 =?utf-8?B?RUx4b2FSTjRtMGQ4RDdDeDR5dmorSis2NUlkS1RUUTUzeWozQm1GUFJRSjRl?=
 =?utf-8?B?L0E4RUlldE5QNS9UT3BWTHVCd2Q5TXdQSjdOTitSYmhycTlUeU51dGpySWJW?=
 =?utf-8?B?MTR6REZVRnhEcnF0eUJ4bHdQSldyU1U4VWwwajhEOEkzZXJ6WFU1Qlp5Yzdj?=
 =?utf-8?B?TE0vQVdZdXBLTmRVVm1ZUjhOdHZEclhhR2RKY0JPd0NtNmJhc2x0K2taOGxS?=
 =?utf-8?B?TjZ0aDZjSi9udzZaU0ZBeVAvSk93UkVmdVQ4WHRxK0wwVllNdXM3SU9nVXpl?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f4f8eed-84f6-42cd-af1a-08dda40ef72a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 08:57:14.2192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FMKiqGayJMxs/33fFwU0A2UqcwqOVSreQC9qMl5wuc3awLiLekThuYoyFjpKF7qhGnXTjGJQDgzpj+Abv9sjRrO/CGMsTarYTPEgvEv/05A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7570

Hi Heiko,

On 6/4/25 10:24 PM, Heiko Stuebner wrote:
> The RK860-2/-3 regulators are used on rk3588 boards to supply components
> like the big cpu-clusters and npu individually.
> 
> Most of these things will be, and in fact most regulator nodes right now are,
> always-on - probably nobody has tried completely turning of the big clusters
> for example.
> 

This is a bit of a confusing wording here. If most things will be (and 
are) always-on, then the ramp-up typically shouldn't be an issue I 
assume? I'm not too familiar with the regulator subsystem but I guess 
for the first initial enable this could be an issue?

> This changed with the new NPU driver, which does combined runtime-suspends
> with the regulator being tied to the power-domain (it supplies the pd).
> 
> If the NPU runtime-suspends while running a load and then starts again
> hangs can be observed with messages like
> 
>    rockchip-pm-domain fd8d8000.power-management:power-controller: failed to set domain 'nputop' on, val=0
> 
> Removing the regulator from the domain and instead setting it to always-on
> "fixes" the issue, which suggests that the domain is trying to get current
> from the regulator before it is ready when it gets turned back on.
> 

If I'm not mistaken, this is also misleading as nothing currently uses 
that (NPU support not merged yet and most if not all NPU regulators 
currently are always-on so typically not impacted by this issue).

I assume this will be an issue the moment we add support for suspending 
the NPU regulator, which would anyway require modification of the 
various DT. Is that correct?

> And in fact the datasheet for the regulator defines an "Internal soft-start
> time". For a target output voltage of 1.0V the _typical_ time to reach at
> least 92% of the output is given as 260uS.
> 

Indeed. Now looking at the existing Device Trees, it seems some set the 
ramp-up delay already, but to 2300 and not 500 like suggested here. 
Maybe it'd be safer to go for 2300 by default then? This could also be 
the typical "this Device Tree got merged, we use the same node, so we 
simply copy it" case and not really backed by anything (though I would 
hope the Toybrick and Rockchip evaluation boards values are based on 
*something* since Rockchip would (could) have done measurements for those?).

> So that value is dependent on the target voltage (up to 1.5V for the type)
> and also the rest of the board design.
> 
> So add a regulator-enable-ramp-delay to all rk860-2/-3 nodes we have in

Maybe mention that there's currently no rk8601 node upstream, and the 
only rk8600 (arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3.dtsi) 
already has a ramp-up delay configured. Otherwise reading this I'm 
wondering why the rk860-0 and rk860-1 while being handled by the same 
datasheet are implicitly excluded from this change.

> mainline right now. I've chosen 500uS to be on the safe side, as
> 260uS is the "typical" value for 1.0V and sadly no max value is given
> in the datasheet.
> 

Reading the rk808 regulator driver... maybe we should also set the 
typical delay as default in the fan53555.c driver? See rk805_reg which 
sets the enable_time for some (typically the LDO with 400 and the DCDC 
at 0). I assume those can be overridden from the DT anyway, but at least 
we would have some decently safe defaults?

If we do not do this, then we should probably force the presence of 
regulator-ramp-delay property for the rk860x DT binding so we don't 
forget for future Device Trees?

Cheers,
Quentin
