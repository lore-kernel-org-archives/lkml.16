Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022097.outbound.protection.outlook.com [52.101.126.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680F29A9;
	Thu,  3 Jul 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527027; cv=fail; b=EDgIbcc5kpfExqE8hxnJXMNlGGy6HJzGID8Bzst3f5lsTxDWL2ZEBn0MmpUFLfs6lStdkrLOsPtM6IVyN+AvrAo9JDSBad2XWl/5cUrd9GCB9kDm0sAC6fdmTpONEEgC00eWEUzWIrXSo56Pl/59+GSuOzXF3Lm7tyOynfk85BQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527027; c=relaxed/simple;
	bh=FdBcEtbViYy81FZepkqaNhsA4pPNP91gQ9ivyS/Hj40=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ATzkqlquFwGtfCJt3XeP/kCxZyaAZOH9oghtADONpwFakBWxfpsDwCi8Rekar5C3gT/DirrqgEhX/5dhHyHajMHp7zX1IH5RWmKbZVZMEZHmrDzNvNjf3g6T9QH094/imlRumD0QteP0FawqOCCAUGh96xKBDoW1s2ll6ucXIxQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=dvW8BIpH; arc=fail smtp.client-ip=52.101.126.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="dvW8BIpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzFajaBAV046Uqd8D6XIHR/tRzuQc72HqAyV8trLYU2ri9gaUHpwkRSZ1yf82deJ0Inxj4GBehNbD1XLiwzCshj3J4UY2KFH5p3yDcm1PNBX2mJOxocjPUQCYuz5VXEOUfzZNhOPNO4euUszVFdvwqs7yCU/VW69WblocgmVOJKAyy1tDs3AZrFS3a35Tw025q2yXCfrZNh+zeKoQdWdPFeJnolLKHn5f+g3LiodqxD//6y+ZaEN3ljxxwslf76U1Pd+inEUst3+BBTLmUy0/2Ts0Y2F5DWc+CEXOM6MSQmXhh2+p6SIZ0wONL+nlBsGVYkwgLGOvmwXYhO/EbUFhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10T+OzMrVdDB8TWFEz5Mxt9l2LKvg6ncGq10nbqvXbE=;
 b=So2Pb/mA66sBhvd0ETC/SHFZapYjELlkdLhM/u89FIBdTDr24qMPi8ofSdybP5VWKRXs6GC0BGPr/tWNHR2DVxqK9XJlZCytQj83+mLCiy6zTcvMhPuSq1HLnlboPBj+TTpgsJ7CfssegCVhEZWLmfugJ+U/nNTjSmVauVbox+WRtAuOHUrBSmfOSC49bq+byw+nbmTgy/WK3Hu3CPY8QcaQy8VCpktm4+sTYqsYSVwX0Asr4JSJRlY4HJkphiHd+aC6mnjieZLau+hhu7j6O45C1Qr73HC/GmvZN0ZDySlKs5nRaarmmCO0qazOQjCywTyxblJzrlHxcjKNrOylaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10T+OzMrVdDB8TWFEz5Mxt9l2LKvg6ncGq10nbqvXbE=;
 b=dvW8BIpH3XYMuP3OQrHirJe2Wop67pvRjUAbUuiEQNfcYkhLjOmyArXP+itRUl7c56zED0AYA4UvflzLZCE8USS/YB/JdNPPlJfa5M2RbgQ2TNQ0+gprpYRV7VNE0ScLOv18Dv/j1veCiUDrTFIW5guLzKiFZKFev15D/uvaOMdYOsGLr9nlQv5EOjzt29hM3Kc5d59bs93/BDiccGvv20BeFOgJX7GEJS1l0yTSoq8oHUx96tK0bjJEyaR5m43XRGAzvVnlGHXUF1ylD5UwARL3fedO0FdAYGkkHaWH5ZcnNWs/6ShFs9yODrjso3rHywYBdU2AzPyp0ElQVewC3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SI2PR03MB6613.apcprd03.prod.outlook.com (2603:1096:4:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Thu, 3 Jul
 2025 07:17:02 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 07:17:02 +0000
Message-ID: <1fcf7e52-b265-4341-a360-93aaf293f131@amlogic.com>
Date: Thu, 3 Jul 2025 15:16:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/26] clk: amlogic: use the common pclk definition
To: Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
 <20250702-meson-clk-cleanup-24-v1-23-e163c9a1fc21@baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-23-e163c9a1fc21@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SI2PR03MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: e52b4126-2dff-4e9d-eb89-08ddba019b53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU5mVGhtUmRpZWVCZnpyM0YyUlRqZFY0a0FvZy9zbmtIQjhjNnNMRGNrZlZL?=
 =?utf-8?B?ZUN0dmt0Y3ZmUkdRaHpyQVIyL0RWZkgwYTNHbDBUV1Q0enA2Y3J2NVZHOGNC?=
 =?utf-8?B?Q0RXdGtzYjVmN1Yya0ZvcjNVeC95MHJRUGc5OS9yeDIvcHVKRWNRN2dOZ1hX?=
 =?utf-8?B?S2VhWGkzYlZKVmU5Z2lSemlZS3FXY2pqMEptZk9qbENDaWdwcUdNMllBVW02?=
 =?utf-8?B?M0dLVVNPazJPeVhtaUJoeXM1UGk5SU8vSnl6TjVjLy9SYUh2TEFUZVNmdWUw?=
 =?utf-8?B?WFZXdWVSUThUWG1VN2J2MGFIQy8vcUpXRTJ4N0R6YWdFZjlvelJlSWRxM3FF?=
 =?utf-8?B?NWFGa24rM2NHdHNTVm91R05mbjc0RzFIVGNBL3hENzJmeTEvK084L0lxRTFW?=
 =?utf-8?B?a2NuamRQV0k5ekc4Q0E4d05uT0ZnSThlcGpPc2tMZC84OC9ncFlkaUVmOW8v?=
 =?utf-8?B?T2tCOXM5V0VzSDlVYU5XWUxKN3hWZ2RuVk9HaituYjhCY21SQ3NJU2pqalBs?=
 =?utf-8?B?N3EvL29WMHIxVCtQS2hxMW15dnVqdHhrNVFUak9FaDlFTFJFS3JZenRyaVFQ?=
 =?utf-8?B?RmU3cTVscDk0RVZJWlJqL3BacDJadnJzbFMwZnBieDIxY29nYXRMZTZReHZ6?=
 =?utf-8?B?NXFiNm5ZZWZyUWJMSzhTa0JiTDFmTzhpaGRSSWJoQUdOdEhMbTRaVjRXQ0w2?=
 =?utf-8?B?NTI1ZWtVL1p1Ulh6a1JabTJld1dqUEEzcWhTSVlpZTRtTjJ1c1RkTU81Z3JP?=
 =?utf-8?B?Y2dQNDlVU2VIZ1VtZk51Snd2SzYvbDNNWjFUdFpIZ2YycUQ2VXJOWk5GVnN0?=
 =?utf-8?B?ZU40dEZQUVhrV25QYXZaa0tVZExlL3Ntam5VUUxXd2tvT3NhKy9aeU1YVjhu?=
 =?utf-8?B?YlNvdk5Md2FuMnhCL1E0WHhOTjJhSTFtYTRoNEtMTkthN3NUUUVPL1Zwc09D?=
 =?utf-8?B?cTZ3SXY1T3V6ZHQvR2NlYkZqQ21DeFUrbEhLY20yZlBMUWZNZ3A1UlhoSm8x?=
 =?utf-8?B?N2lUdU1mbUNuckMxdTFuL1dxVHdQUTBvK1Noci9iK29YWkpnQWtMK2N0WXBP?=
 =?utf-8?B?bUpLRE45UXRLWEthdW5rdUxydXVSaFpBZS9XQ01KcXJDVTAxVkplZHRFQ2JG?=
 =?utf-8?B?cW5aVTFtMFdwNjUyMTJLekhGYjFPUzZWRGhwRG0rRWszRytjWDBGZnVHbzNI?=
 =?utf-8?B?a29sbEM0VS83MjRaUEFLMmlUMjVXby9sYVp3eXViT1l0R3M5OGN4V1prSzVM?=
 =?utf-8?B?MS8zMW9Zd1ZCL3MwY2wrSkpMQkJBc3RNcGdkd0Ixd25NcE9iQTlZclM2SjNV?=
 =?utf-8?B?OTJ0b2lIZlk0V0E1OHJxRFhObmdEV2RtQ2ZkT3ZUd0VFZDBYTUovRGRsY3JS?=
 =?utf-8?B?RnpCbEd4WHZUdWRZd0lpVFZOTTVYbDdSLzBUZytBb1RrVWJIWXd0ZXVZOEg0?=
 =?utf-8?B?VTVIUkJ1UGMwNGZXODRhWXhDeUNud0NqT2FLTUI1RWUwN1NKdWp3blBBSTdI?=
 =?utf-8?B?dDR3MVZhSHRraEF2ZFVYaEtYK1hCQkZzbXZoVWJlSzZkdzN2TGJJSG9zSko4?=
 =?utf-8?B?M2Q2UEFiTzRtdFRRU0N2Mm5SRDdYeTFYbUpqRC9uWmZGZTlXaEhGd2QxL1BY?=
 =?utf-8?B?S2VhVjJHSFM2M21aa01BcTZKWDRVYnZFNFJoR1UyMzYxeTFINi9mWHNDdTQx?=
 =?utf-8?B?dGkrQk9abE1Jb0JpSEJrdDd2ckJsSDl3OUh6WnpadjlIQ0xsdURhbWFlcWNJ?=
 =?utf-8?B?U21oZkdwOWhScklPOExMYVBlQlZleVhoQlZOZzRQUHc1QTQrbTB5M0cwTzBJ?=
 =?utf-8?B?TGVQTnBmNFI5RzNJR3NMTC9iQ0xnM3JiSEVaeVE3a2ZqdHJOazV6NUZwSFB6?=
 =?utf-8?B?eWhMRVR6KzBZM1BSR0tZbWZiRmpYYlRoVy84SFI4Vmhzby9icTJMdml3ajNB?=
 =?utf-8?Q?no1zetQJPd4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NENXbWZRbmN2K2cxWXdqb3FDb0NHMlNQWUpmSTJOQ0NQVXNDMWllTjF6TUhM?=
 =?utf-8?B?b1dTVm5pZ2Z5aTQzQXpWYjQxbXZHcGcvM3BiSGxyMlpnMmo0SHFiWkdlMS9E?=
 =?utf-8?B?dkxsM3RDZXFDTWVRUkNmRko2emVnZ3JBZ3JSZGQ5TnJ2bzVzMmtWMDZFUGd2?=
 =?utf-8?B?SUIzV2U5bElQdVdxUi8ra2pZYlZicTcxak9ueXRhem9NQXlIS1dmWVUrK1ln?=
 =?utf-8?B?SHF2YjRGUUpIOVhYYmRuc3l3eFpRbmlkOWZjSDRKU2cwdlZKNm1ONVREN0hz?=
 =?utf-8?B?VXpzZ01WaGJ4ZHNjWFNDdmI2M2ptZy9ZUjNDWENnUThCekdvQ1FZZC81N01D?=
 =?utf-8?B?WnZ4cThtMkcwZHd0SkFpVXlSV2dsSnQ5aXJKaXhXRkUxby9ZdTVReHBTUitH?=
 =?utf-8?B?aC9DQXhQOFNjWlNBb1o2UFJ2dGVTaGNucTFWZlVZbFN1c0kzQkhjNGtJbjQz?=
 =?utf-8?B?aDRUNmFNQTFWQWpJUGZVYTJjZmpCZ2QwUlV3ME9KNE53THZnOTEvT0FSdkx1?=
 =?utf-8?B?TFI1Vm5SMnlDTHU0RjcyekgyY00zd2lOd3RPMlE3OWRiNGJiUmxWa00rUm5x?=
 =?utf-8?B?R0YwbGpaVEY3NUlhdW1vaVB6UUt1aEdPY2ZkeWhqUjRnbmVBZHVmTUQwVzBE?=
 =?utf-8?B?MVNzWHBGRmhENXEyQW1jN1UyeWZ6SnBoSWtsdU9IYTErU0s5MnVKeVdBeWpa?=
 =?utf-8?B?c0xRaWtaUlRzMUJaMVlTQVJOeTFDZHFnamlZdjBuelhza1FhNzQ2ZFhQb1dT?=
 =?utf-8?B?V2tnaHlpOCtjVXllVmZ5b2xKR3VXSmdPYUtOZ0lLcFdsQjF5T000dS9heUxN?=
 =?utf-8?B?WkY5NWZ4M0JMd0I2NnBxWW8yUEVHTVprRHBUck1pZVA5cUNUSDBhQ1VwOHBL?=
 =?utf-8?B?VEI3MHlDaHJIYjdQSCtQOHlzbFBsRm5vaFFtRWQ5TjFkL0hFZ3VJektBYThI?=
 =?utf-8?B?dTRQWSswQU9UTC9iWkMwQ1kxVHhLYnNWTlhlb0dxQWppS0xjT3dEOGZYYTFT?=
 =?utf-8?B?OExEWHBRN2s1enFhTHJRbEtsbVpBYkY1cEpGYWhvZHMvNUJ2MCtxQUYrRE1M?=
 =?utf-8?B?dXl6R0x6NVBKVGJBV2lxejRTa1VWbEN5b0NFRldkcU13ZWRqTjA5aktyejlP?=
 =?utf-8?B?V0ZTSDVjYnY3WkRoUGY0UTB4cUI5SzlCb1p1dUtDNVlRY3dBQXpXU09XVFRt?=
 =?utf-8?B?ZmNTSlp4eGxCMnhBNng3YTZlTTZYcTdCZUl6aThQTTdOakR5SG5DaXE4ck5J?=
 =?utf-8?B?dk9EbHE2QXg0YWpPL1VxZVVuai9RWnRmWVhCRVdEZmU5elNIUG5JSWFoYXln?=
 =?utf-8?B?UDArSjRCWk13WnFzVE0zS3dZNXBwenpxdjhJY2x5UVUrM3ZLMk5jOXJ4VzZi?=
 =?utf-8?B?ajg4L1pXa0g4Zzl3MjJvSVRFdnBrZ2JwczlIL3RVUmFnSmpWMGNDYytUM0tC?=
 =?utf-8?B?bEFOSHZWOEg1amtwUlVZVWE2ZVNWZnIzVmtoTXMzRUhMNXQvVTlQak96cFBF?=
 =?utf-8?B?eWdhZ0c0c0lGS3VoZWZmVWxEWVZ3TlNJWmVzZkxsY0ppUXpXckE4WStBa0g0?=
 =?utf-8?B?aCtIblMxWVJMQTVMdHMxbk5TLzdCUTBqMWlmSjNRMTRWeFBza293SnJPWWhE?=
 =?utf-8?B?WTgyaGR4Rzc0d0VBQUgvM0tteFlCNmRlckc5UmRIYmQ0dXZ6Q0tVVkcvY2s5?=
 =?utf-8?B?VkZsWjZmd0hHREhaNkhpc2pkaEp6NHFsZTNnaGd3WlYvbTdkaHgwOFgvYmNL?=
 =?utf-8?B?bU1qQ3RmcEZ5YUV6S1B2U00vaWU1OVJaenQ2cUVwMTFTS1NvMk5UUXRua0Rr?=
 =?utf-8?B?VSs3Yktrc0Z0YXVOdDlGSWN0YkRYcmxGRzlCeU1jVmdhWWpYdUZJOGoyVjhl?=
 =?utf-8?B?Vy9hdHZwQjhzcEVFKzhHRHVONEE1QkxPSCtvTzZqVjhSMnBuOU5mK3h3KzBU?=
 =?utf-8?B?aXdQUjU3c3dqajBxcHozcG5kN29MU0lHQS9ibVArNHlDL3E2K1krRTZiSkFO?=
 =?utf-8?B?MkphZ1dhZzgvM1o1KzZHemZoM1g0MThxTFNVZGJSWndqVzJ0TWY3Q0R5WHNT?=
 =?utf-8?B?ajVjeTd4R0pnS21yWDNKTksyQ3JMcCsxd2F2aytyZ3dISWF0aWNDbWhKZjRX?=
 =?utf-8?Q?Yb96xDY8CCMsNJRkZpH3p0syk?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52b4126-2dff-4e9d-eb89-08ddba019b53
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 07:17:02.1439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fz2nBwcDWE77c6TrCzP8tMZampk5yR5I/KaHYoeRF/FUMRuijKyE7koVfBSF3GqzANmexJVYgQc1jvmyXOUoGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR03MB6613

Hi Jerome:


On 7/2/2025 11:26 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> Replace marcros defining pclks with the common one, reducing code
> duplication.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>   drivers/clk/meson/axg-aoclk.c      | 35 +++++++++-----------------
>   drivers/clk/meson/c3-peripherals.c | 34 +++++++-------------------
>   drivers/clk/meson/g12a-aoclk.c     | 50 +++++++++++++++-----------------------
>   drivers/clk/meson/gxbb-aoclk.c     | 33 +++++++++----------------
>   4 files changed, 51 insertions(+), 101 deletions(-)
>
> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
> index 74c2f51424f11cc04a80a3a4918e4de0a5d11d08..902fbd34039cc06d512f1237a1e5d9050fd00b4b 100644
> --- a/drivers/clk/meson/axg-aoclk.c
> +++ b/drivers/clk/meson/axg-aoclk.c
> @@ -34,30 +34,19 @@
>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>
> -#define AXG_AO_GATE(_name, _bit, _flags)                               \
> -static struct clk_regmap axg_ao_##_name = {                            \
> -       .data = &(struct clk_regmap_gate_data) {                        \
> -               .offset = (AO_RTI_GEN_CNTL_REG0),                       \
> -               .bit_idx = (_bit),                                      \
> -       },                                                              \
> -       .hw.init = &(struct clk_init_data) {                            \
> -               .name =  "axg_ao_" #_name,                              \
> -               .ops = &clk_regmap_gate_ops,                            \
> -               .parent_data = &(const struct clk_parent_data) {        \
> -                       .fw_name = "mpeg-clk",                          \
> -               },                                                      \
> -               .num_parents = 1,                                       \
> -               .flags = (_flags),                                      \
> -       },                                                              \
> -}
> +static const struct clk_parent_data axg_ao_pclk_parents = { .fw_name = "mpeg-clk" };
>
> -AXG_AO_GATE(remote,    0, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(i2c_master,        1, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(i2c_slave, 2, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(uart1,     3, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(uart2,     5, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(ir_blaster,        6, CLK_IGNORE_UNUSED);
> -AXG_AO_GATE(saradc,    7, CLK_IGNORE_UNUSED);
> +#define AXG_AO_GATE(_name, _bit, _flags)                      \
> +       MESON_PCLK(axg_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
> +                  &axg_ao_pclk_parents, _flags)
> +
> +static AXG_AO_GATE(remote,     0, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(i2c_master, 1, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(i2c_slave,  2, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(uart1,      3, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(uart2,      5, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(ir_blaster, 6, CLK_IGNORE_UNUSED);
> +static AXG_AO_GATE(saradc,     7, CLK_IGNORE_UNUSED);
>
>   static struct clk_regmap axg_ao_cts_oscin = {
>          .data = &(struct clk_regmap_gate_data){
> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
> index e9c1ef99be13d0542b8a972ceffe69c8a9977118..02c9820cd98655e57a290859b595cf09d39e5fe3 100644
> --- a/drivers/clk/meson/c3-peripherals.c
> +++ b/drivers/clk/meson/c3-peripherals.c
> @@ -164,30 +164,13 @@ static struct clk_regmap c3_rtc_clk = {
>          },
>   };
>
> -#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
> -struct clk_regmap c3_##_name = {                                       \
> -       .data = &(struct clk_regmap_gate_data){                         \
> -               .offset = (_reg),                                       \
> -               .bit_idx = (_bit),                                      \
> -       },                                                              \
> -       .hw.init = &(struct clk_init_data) {                            \
> -               .name = "c3_" #_name,                                   \
> -               .ops = _ops,                                            \
> -               .parent_data = &(const struct clk_parent_data) {        \
> -                       .fw_name = (_fw_name),                          \
> -               },                                                      \
> -               .num_parents = 1,                                       \
> -               .flags = (_flags),                                      \
> -       },                                                              \
> -}
> +static const struct clk_parent_data c3_sys_pclk_parents = { .fw_name = "sysclk" };
>
> -#define C3_SYS_PCLK(_name, _reg, _bit, _flags)                         \
> -       C3_PCLK(_name, _reg, _bit, "sysclk",                            \
> -               &clk_regmap_gate_ops, _flags)
> +#define C3_SYS_PCLK(_name, _reg, _bit, _flags) \
> +       MESON_PCLK(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, _flags)
>
> -#define C3_SYS_PCLK_RO(_name, _reg, _bit)                              \
> -       C3_PCLK(_name, _reg, _bit, "sysclk",                            \
> -               &clk_regmap_gate_ro_ops, 0)
> +#define C3_SYS_PCLK_RO(_name, _reg, _bit) \
> +       MESON_PCLK_RO(c3_##_name, _reg, _bit, &c3_sys_pclk_parents, 0)


Adding 'SoC' prefix to clock names appears redundant and inconsistent - only
'sys_clk' carries this prefix while all other clock names don't.


>
>   static C3_SYS_PCLK(sys_reset_ctrl,     SYS_CLK_EN0_REG0, 1, 0);
>   static C3_SYS_PCLK(sys_pwr_ctrl,       SYS_CLK_EN0_REG0, 3, 0);
> @@ -290,9 +273,10 @@ static C3_SYS_PCLK(sys_vc9000e,            SYS_CLK_EN0_REG2, 2, 0);
>   static C3_SYS_PCLK(sys_pwm_mn,         SYS_CLK_EN0_REG2, 3, 0);
>   static C3_SYS_PCLK(sys_sd_emmc_b,      SYS_CLK_EN0_REG2, 4, 0);
>
> -#define C3_AXI_PCLK(_name, _reg, _bit, _flags)                         \
> -       C3_PCLK(_name, _reg, _bit, "axiclk",                            \
> -               &clk_regmap_gate_ops, _flags)
> +static const struct clk_parent_data c3_axi_pclk_parents = { .fw_name = "axiclk" };
> +
> +#define C3_AXI_PCLK(_name, _reg, _bit, _flags) \
> +       MESON_PCLK(c3_##_name, _reg, _bit, &c3_axi_pclk_parents, _flags)
>
>   /*
>    * NOTE: axi_sys_nic provides the clock to the AXI bus of the system NIC. After
> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
> index 45e4df393feb6f916b6e035ad71e379e6e30ee99..96981da271fa1453ebbe433e36cff4409661fa6a 100644
> --- a/drivers/clk/meson/g12a-aoclk.c
> +++ b/drivers/clk/meson/g12a-aoclk.c
> @@ -37,22 +37,10 @@
>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>
> -#define G12A_AO_PCLK(_name, _reg, _bit, _flags)                                \
> -static struct clk_regmap g12a_ao_##_name = {                           \
> -       .data = &(struct clk_regmap_gate_data) {                        \
> -               .offset = (_reg),                                       \
> -               .bit_idx = (_bit),                                      \
> -       },                                                              \
> -       .hw.init = &(struct clk_init_data) {                            \
> -               .name =  "g12a_ao_" #_name,                             \
> -               .ops = &clk_regmap_gate_ops,                            \
> -               .parent_data = &(const struct clk_parent_data) {        \
> -                       .fw_name = "mpeg-clk",                          \
> -               },                                                      \
> -               .num_parents = 1,                                       \
> -               .flags = (_flags),                                      \
> -       },                                                              \
> -}
> +static const struct clk_parent_data g12a_ao_pclk_parents = { .fw_name = "mpeg-clk" };
> +
> +#define G12A_AO_PCLK(_name, _reg, _bit, _flags) \
> +       MESON_PCLK(g12a_ao_##_name, _reg, _bit, &g12a_ao_pclk_parents, _flags)
>
>   /*
>    * NOTE: The gates below are marked with CLK_IGNORE_UNUSED for historic reasons
> @@ -63,22 +51,22 @@ static struct clk_regmap g12a_ao_##_name = {                                \
>    *  - add a comment explaining why the use of CLK_IGNORE_UNUSED is desirable
>    *    for a particular clock.
>    */
> -G12A_AO_PCLK(ahb,      AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(ir_in,    AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(i2c_m0,   AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(i2c_s0,   AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(uart,     AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(prod_i2c, AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(uart2,    AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(ir_out,   AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(saradc,   AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(ahb,       AO_CLK_GATE0,    0, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(ir_in,     AO_CLK_GATE0,    1, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(i2c_m0,    AO_CLK_GATE0,    2, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(i2c_s0,    AO_CLK_GATE0,    3, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(uart,      AO_CLK_GATE0,    4, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(prod_i2c,  AO_CLK_GATE0,    5, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(uart2,     AO_CLK_GATE0,    6, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(ir_out,    AO_CLK_GATE0,    7, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(saradc,    AO_CLK_GATE0,    8, CLK_IGNORE_UNUSED);
>
> -G12A_AO_PCLK(mailbox,  AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(m3,       AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(ahb_sram, AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(rti,      AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(m4_fclk,  AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
> -G12A_AO_PCLK(m4_hclk,  AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(mailbox,   AO_CLK_GATE0_SP, 0, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(m3,                AO_CLK_GATE0_SP, 1, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(ahb_sram,  AO_CLK_GATE0_SP, 2, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(rti,       AO_CLK_GATE0_SP, 3, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(m4_fclk,   AO_CLK_GATE0_SP, 4, CLK_IGNORE_UNUSED);
> +static G12A_AO_PCLK(m4_hclk,   AO_CLK_GATE0_SP, 5, CLK_IGNORE_UNUSED);
>
>   static struct clk_regmap g12a_ao_cts_oscin = {
>          .data = &(struct clk_regmap_gate_data){
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
> index 2bf45fd7fe4ba0783e736fbbb126209870985b22..c7dfb3a06cb5f70c98f65bb91b937e1b870b34fe 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -23,29 +23,18 @@
>   #define AO_RTC_ALT_CLK_CNTL0   0x94
>   #define AO_RTC_ALT_CLK_CNTL1   0x98
>
> -#define GXBB_AO_PCLK(_name, _bit, _flags)                                      \
> -static struct clk_regmap gxbb_ao_##_name = {                           \
> -       .data = &(struct clk_regmap_gate_data) {                        \
> -               .offset = AO_RTI_GEN_CNTL_REG0,                         \
> -               .bit_idx = (_bit),                                      \
> -       },                                                              \
> -       .hw.init = &(struct clk_init_data) {                            \
> -               .name = "gxbb_ao_" #_name,                              \
> -               .ops = &clk_regmap_gate_ops,                            \
> -               .parent_data = &(const struct clk_parent_data) {        \
> -                       .fw_name = "mpeg-clk",                          \
> -               },                                                      \
> -               .num_parents = 1,                                       \
> -               .flags = (_flags),                                      \
> -       },                                                              \
> -}
> +static const struct clk_parent_data gxbb_ao_pclk_parents = { .fw_name = "mpeg-clk" };
>
> -GXBB_AO_PCLK(remote,           0, CLK_IGNORE_UNUSED);
> -GXBB_AO_PCLK(i2c_master,       1, CLK_IGNORE_UNUSED);
> -GXBB_AO_PCLK(i2c_slave,                2, CLK_IGNORE_UNUSED);
> -GXBB_AO_PCLK(uart1,            3, CLK_IGNORE_UNUSED);
> -GXBB_AO_PCLK(uart2,            5, CLK_IGNORE_UNUSED);
> -GXBB_AO_PCLK(ir_blaster,       6, CLK_IGNORE_UNUSED);
> +#define GXBB_AO_PCLK(_name, _bit, _flags)                      \
> +       MESON_PCLK(gxbb_ao_##_name, AO_RTI_GEN_CNTL_REG0, _bit, \
> +                  &gxbb_ao_pclk_parents, _flags)
> +
> +static GXBB_AO_PCLK(remote,    0, CLK_IGNORE_UNUSED);
> +static GXBB_AO_PCLK(i2c_master,        1, CLK_IGNORE_UNUSED);
> +static GXBB_AO_PCLK(i2c_slave, 2, CLK_IGNORE_UNUSED);
> +static GXBB_AO_PCLK(uart1,     3, CLK_IGNORE_UNUSED);
> +static GXBB_AO_PCLK(uart2,     5, CLK_IGNORE_UNUSED);
> +static GXBB_AO_PCLK(ir_blaster,        6, CLK_IGNORE_UNUSED);
>
>   static struct clk_regmap gxbb_ao_cts_oscin = {
>          .data = &(struct clk_regmap_gate_data){
>
> --
> 2.47.2
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
