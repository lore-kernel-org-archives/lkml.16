Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022115.outbound.protection.outlook.com [40.107.75.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03542D028F;
	Thu,  3 Jul 2025 08:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751531503; cv=fail; b=XxTAl48ZlrvOAGbdfKQUpvSIO7P+SDLPGT1nk3OtkcM2hpFIh9WKWgBaxfp1yU580EJ8pFtnTI/83Lw5WmMG+1P5XD7zQMMeb/sf1JpaH4uxm4Ym1ptukaOnUDW0ucu4MMhyTbHreHBG5+ZoRoLoiKHZ+M5mIFUecKLgY8Ec8XE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751531503; c=relaxed/simple;
	bh=5Xwu7WrKbAnUP4Fhz+64kpjd9yiWWouPYnuLZCEfXBU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tqd8yj0s9nbq5yuUd9UCa52wNaLyk0yv+Gq2b8gbQaTa260bu3wgRbFdYpoJD15BsIdrg4oDqviZ745bQzW+m2geAdoNfbMy7mmd82X5LfSaduIbbJoYnXs7TA5dMr7CUMEvGz4+7B9yQSxBorZCCGjUT9v2fnTXUJL0MozqXgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=Sd4VWqq5; arc=fail smtp.client-ip=40.107.75.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="Sd4VWqq5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YtJwB6xJIHmB3XrR9D6kSXfFSHTdy/4EQ8O5guSiD3R/Igc1I0XCiYCGixtYHrbEDUlINl5rHbEyPVcqskIqT8+gjzeBzfkI5JoJcc+9qR158yU+81RK263nWY7LKd5a9QtobVjl009x5rdzMFCo+U1NtVXfgpF8cpv6SYFGnRS1inRhOBubmRtrX+/h8/yk2OLuz2Hb+2l56l5lK4xbm6jMYdV0AlLu88oHeU0i00zD3IQGoHX/k6tVkOqA9oGw+YbSEjeDl+q+OftBF5lZPA+/Q6uIGMR5NVMq/7Va9shu4NZuKQfKG7On3ASmGTGewZgWZOrgU/0qNBxoJtO2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MhbFLosuFgyUJLwj/BeZ1Pq94S1JDah0J3JWLHh62NU=;
 b=URr863j+j0/etUSkeOoo7JBsf0V+NrdV+mkUVHIFf6Mj+1nLP3Y0sb35mUXHlyfwI8A/OYb2YNQPcVnrxUhTZX6/S9GsL2P1bGHPJtphwEhRKZV8FN+bDsU18JAXM1kBWfaIqLAM8vLX3awvA4pw/58uPY5/UCE7z1ewz4KGcbSb6hVg/BVqztA24tCGa8/7ArSaheLOqrHdLZXWii+6KkrHlca0Nc0HAK5p7jc56t92sWsBqzQqHIvAc4HvMJp1o2jVGpvhx1LY/4+D06QWnuX36C/lAKN+9oLfmonaLbaBSWTogLYwDgOe0sMf9ySsmEd3p8jQNWLzSmrrRBgx/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MhbFLosuFgyUJLwj/BeZ1Pq94S1JDah0J3JWLHh62NU=;
 b=Sd4VWqq5RxQJf7lc6M+KH7IP6+su7y9pvQLyiPeDskjS0l7BOqsgliSOn4o8Btoa++HqSVrbcB7LgQRyoMN6H7Mbf3i1721wTbRMjmqY50uriZ3eu9tVOuu9xJn8bdFbZsn3viLpLJUZu4bgrctptqW4sjtY2urYlGV1UBmtPmRgAqT4aCjQAPp3FWfPL7CxTagyZ963LEJ6DY66tWzVwlSMAgz590Tya8jvId/nEo2dMXQIIc2+9eJwG+hp3RjgrMW2bok1QOs42N6r2YUXPQx2SRgd1Hg0hfTH10wB1PUmnhEeVf1xMVhUkPENyqRUZSsGHg96iXGOaFwyg45b1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by TYZPR03MB7555.apcprd03.prod.outlook.com (2603:1096:400:3ca::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Thu, 3 Jul
 2025 08:31:38 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%6]) with mapi id 15.20.8901.021; Thu, 3 Jul 2025
 08:31:37 +0000
Message-ID: <99ba0e33-cec2-4577-b949-010537a8c4df@amlogic.com>
Date: Thu, 3 Jul 2025 16:31:12 +0800
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
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jy0t5d8a2.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|TYZPR03MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 0105647e-17fb-4d90-b614-08ddba0c071c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R21VSzg1ZFFvM1hGTHdjMDVCZFhDVE96em1lRUh3K1NUalkxT0NEeWQ4MlJG?=
 =?utf-8?B?UnVxaWF6MzVjUzE0Ri8zbm44ZkViN3N6cS9aRDZ5RVlqQ2U1WHFHbXBuWUEx?=
 =?utf-8?B?TlhkMkRvdC8xT2ZQMzk5blZndy9EV3RvUXROS0Q1blZ6bXluSE1xeG1CZURJ?=
 =?utf-8?B?Q2RiUFdTRmNhYUhJM3EyOFR1SXlJVUliRGhlMnRwdkpiV2MwU1ZrWkNEc1hL?=
 =?utf-8?B?Uld1VDlVd1dzUkV4aHYycCtWdU5Oc090UzROUCtLWStSclpUWkJjQnROQXZs?=
 =?utf-8?B?UTRBOGZpOFVHV004L3NmUVB6MGpqUUhKSDRJY0wrREdTblcwd3B0YzVvOVlL?=
 =?utf-8?B?ZzRKL1lYejE2Y2NHMWhydzRkWGN4OU5xMlc0NlU4cUYzMk9OQTIvckdGU1B6?=
 =?utf-8?B?N2pDY3I0UUFkQ2ZPdXVMR0RtdkFEN0paaUZ0aDh2Z1BFdmI4T3RPaG4yc0VX?=
 =?utf-8?B?NVRWdCtnaVYxaTREaEpJZDdLV2FEQUxhWlhWRjllSjhCSVpOR1YvU3hlUGRW?=
 =?utf-8?B?TlpXNXBJaGtDQ1dtWHpkWFpyTWgreXllNjFyYzBMU2ovZDR4Q1RseTc5NGQr?=
 =?utf-8?B?Rm03QWk1aTdtYUdIL0tGK2k2VXdObktkWTl1NkNaWXllTmdSSHpRUmpRdTNB?=
 =?utf-8?B?bWc5L2YrQnJzS3VLeW1WY1k0RExaczVPZ2E5K0d6QlFwUHM4Ny91Q3B1bzdZ?=
 =?utf-8?B?dkF6cVJ6TEpCamVZd0xQMnpoV2ZiR2hlSi9lQWVwQW5sQlprSDdySXRQQWZn?=
 =?utf-8?B?anNqaXdEWTBBSVBKcUJXTDQ3c2ZHaFVEYWtUSndXbHhJUFJEV2Vlb1o3cmZU?=
 =?utf-8?B?NE12WXYyV0E0eGIyTTdTQWlwbXZCdmNRejNQVEpEd2tnV3dRRDN4NHdoS2pl?=
 =?utf-8?B?RC85bndMMGxQdlo1L0ptSVJ2WklNMStkR0haYmw2RkZxY2tYNjJRQmphOWE5?=
 =?utf-8?B?MDkyaDR4ZXUwR3FiMWRvVys4NXdPT0tFbm1iUmZZaFh6WGttYnJKTk1LV25r?=
 =?utf-8?B?NE9sOGIxaEg5a1JKZFdlMUNqeFRVUGZJSEVqMHcyMXErMFF2c0YyeUNxTzRM?=
 =?utf-8?B?SjRJdVZoT1ZKR3VFVStDVzI1ZytsZjFJK21naGlyV2xQMHVydmIraXpRWlNi?=
 =?utf-8?B?M0RrVG8zaS9zYUdpR1gyK1BIaVlYZ2o3WXAyb0xyTm9sdjVsMFpVK0RualE3?=
 =?utf-8?B?VTVVNmd3MjhtazZhQnlSWXRtSjVvNTNLd25Pc2ozSytVcjBBaGN6eGJUME9u?=
 =?utf-8?B?UGEweHplUXQvZVZrTEd0UEVDZFI1cDBWY0s5WUxHbFdUMlE0Rkh1NU1Rdjk4?=
 =?utf-8?B?VnJQVzlITHlzWG5uUkxiVURJY3VXT0Qwai82NzhjWHI0L2d3b09KOGNkcVpT?=
 =?utf-8?B?eXZhd21XTGhsSGNjQ2RTdC9nY0NnRkJiR2pSR2ZXODRhTFluVXJ3TGdrZzFQ?=
 =?utf-8?B?NVZRM1I5ck9vMXdwZ0VUZ2VKdkg3Rk9Ca3J6VTRGc21Ja1ltcTVyNlBDYU05?=
 =?utf-8?B?K3NFZ1BnQ1hDdlpUek0ySkkzQ3BpTW5xMUVsVzJNWEFzUHE3cWYwZEJBczJv?=
 =?utf-8?B?dzZGTWR0ZkplRks1T1QwV2Q3dXQ3MXlVR1RsbXFBNHkwdEpVRUx6Z0xNdHUy?=
 =?utf-8?B?TFRzSEI4TUduTDNEQWlCVjB3Sy9jNCtPL1A5VkJCMS90UVFla1lBQWVUMUh4?=
 =?utf-8?B?NWRvNlZaaGc5WVp5WFZQUWFZMkdLZUVqOXVzeHllemw1dFFFSGZKdFFIT3hX?=
 =?utf-8?B?eTB2enY4aERZbTFtNG4xeTJMd1J5cHQxRmZMZVUxc3F1WVozZjd1aGFkMndW?=
 =?utf-8?B?eFoyenRxMXVvNzZsaTVzdFRpaWJxbjZ2WHZlSGh4dUczNjNibXZ1QWI4bG1a?=
 =?utf-8?B?aGpnaEI1R1l2TzQzWlArVFNQd1MyREtEV1hwRUdkbVNTeG0rWDJCTVAzN0xk?=
 =?utf-8?Q?4WQJ3f2I25g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TURWS1k2WVlVZ0R6OGw1ZXZiazJhd1A2UUJQWFJOYnFOSUtNdTZLVEI0UzRi?=
 =?utf-8?B?NGZYY2Rad2tGdXJJeWdDUDdySlNTVWZMbVN6SGFnejZ5cis3RnczbXJVQTE4?=
 =?utf-8?B?dlZ6RWx4dHhCamFYR3F0Um9ZVTF4SHBEcUJUd1ZMSHJpeXpJQk9nSjZPb3Jk?=
 =?utf-8?B?NjlNZkVkUHF2bGdrd0tIcldpQTNWNVdOUFEwWldqbExDT3V0ZXFhajJScURZ?=
 =?utf-8?B?SEo2aUZqaGM1U0JFL01BT3lMQUpaQkNOdCtXVSthaWNVbnZYcndFbTQzWDJm?=
 =?utf-8?B?OHlQUkw2K09tVWxFUkhkcWg4TVVUSXA2ZTBnYjRiU0pXVjBlSjFPSjkxRUF5?=
 =?utf-8?B?dG1sYk9nN3NnMUNSYSs2eHQzSE4xYXlIT25lSnVjZUFsQUw0UnlSdERCa0J1?=
 =?utf-8?B?dzJzTVRuQ01lME9iRjRFektjVjd1MytENWNCeDBKQlI3b0dXdUZualRicDJ2?=
 =?utf-8?B?N1BIdWFVR0RDcmxySmxuU3ZqTGJQTTJHQW5VaFJsUzFHOXZRb2pCdzdSQUhD?=
 =?utf-8?B?UjZ3UFg4azluNzRHTjl3eTRTY05aMXVrdW9nL2pvb3VESXF2QXlxMTdxNWhI?=
 =?utf-8?B?THQwVkw1eFVuQ0ViV2VtQXBzR1MrU0hzU1NjOG9SbVZlMUVpaVZCYitFbHN6?=
 =?utf-8?B?V1ozSWZ3Nk16YW1yVjhUR2ZMQnVqSnhlcFZXUGZleWlhdXR2MVR0R3JYK0l2?=
 =?utf-8?B?RTZzVkJWUTBRcGNWaW9oamNRWExOWkVqS3I0ZkZjbkRwYVlrc0NUQ2lBa241?=
 =?utf-8?B?YnBEbi9VK2VYNkpRV3dwV0ZqSE0rTFBqSnR2OTZpRWhjTnNabFBsbzcvUDUw?=
 =?utf-8?B?UkV1dDlKeW9KYm41Um5BT2UvSzR2OWZ2UlFqNkpSdXBSTnRXbXNzemp3cW1j?=
 =?utf-8?B?YmN5blFaQ05salpWa3FPVGdueWJhc0dJYWh1UzArRG1DWE9IUE1zZ0tvWVMw?=
 =?utf-8?B?ekhOVTFQVm1ZWndMaHVua2tRZURYZW9HVHZobi9WK2JHbHFFLzc2MXpYYmM2?=
 =?utf-8?B?N1dBemRPSDhKVkJ6cjlNUzgzS0pVOGM3cUFQdmZSamhqZHVsVnBhelk3VTBn?=
 =?utf-8?B?V3lRMUpTSmJXS2FzL2wvdkdwZEM2T0VHM3dqbTIzODc5dGpteHFYdlkvdWw0?=
 =?utf-8?B?eHQ2bFkwTXA0QVRrK1JHcUplZWI1VGpkVFMrTjhyamdjYktid0FobzRSWUR1?=
 =?utf-8?B?YllFbklmY3BEMVAyVDFzdkRrQThxclN1NzBSQ0VMa1U3SXhxQWFBSWJXNFRi?=
 =?utf-8?B?MmsrS0lXTHA0SnZJalZzM1ozSlkwZlZrQ3ZkZ1lDR1REMnpGdmY5WDlGK1hq?=
 =?utf-8?B?cGphVWFZZVdKWnl1Z0NnQVRrdnhUc1FhVXVTOXVDNnVkVHNpRzRFNzBzRlUw?=
 =?utf-8?B?bG5jUXptUnROVHpQWjVDVmxVajRSa2NEUnpPaURsRVZWSlRhbkFodW8rTjJ5?=
 =?utf-8?B?RCsxZzBjakIvMHBqUjJBenZGVDdUVHphTzUzcFZrVmE0QW9vdkdZYnBpTjhQ?=
 =?utf-8?B?Z2hxaFQzVVNVNHpjcm9KL3hpWlRERTRpV1NyaHp3M2VYeUNMUGkxYUxMR0xp?=
 =?utf-8?B?ajRwbTNyLzNhSTYvZGFuZytvdm80bGFYZ1B5VXE4UTNFZGpOd21LaHlPcUJU?=
 =?utf-8?B?YUp6TGFPYUxmMU5vdjZubng2dHdseVNJWlJ0b1QrRWtyd0p2b3kzcTNXUDdK?=
 =?utf-8?B?VU80Vnh4YVpRUWI0SkY2Z2phdjZhRkdzVDN6alQyeVNyNW12SGdmeGlqcUVo?=
 =?utf-8?B?cmZKbEtoazZwTUNBa1IxaTNBMGZXK0R0b1FVcklmbXMreEZxbStjNVFQSFZl?=
 =?utf-8?B?TEUrMTFWOE1oWHZ1RkxSdFFhd0ROY2FoZUZ1SnVMeHRhTHVBenpHZHR4VUR3?=
 =?utf-8?B?eGhvTDg1dHVod05vMUZYS1FRZ2dKbGRCVGg4bGMwTUw1RkFQa3JKaHJ4TGtS?=
 =?utf-8?B?Z3FURFIxcnhaUHVRVVQ4b2FOQzJPM2svbHBHcWQxb2IwM0dmaDhsOUZBVHlS?=
 =?utf-8?B?VFNaaWlFRjMxNGxNWFJRbDdCTitrYjNZcERKOTBBQ3R6cEw0NHVSZGJneGd0?=
 =?utf-8?B?QUZFT3JLWTRLRHhYNStvTk0zRDJSMWtZdExkakpYY0xOL0s1Mm41dkRoNzJC?=
 =?utf-8?Q?UeKtseg9xUB9eET2Dkkawo14Y?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0105647e-17fb-4d90-b614-08ddba0c071c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 08:31:37.9282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWGf3pHf4ZaBJNDBINtcEHIZXxelnCtQZ2DtLsWY9g7CBboSdxKk1fXB2hbVVW/BYde8QI66XLSAyu95R7j4TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR03MB7555


On 7/3/2025 3:48 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
>
> On Thu 03 Jul 2025 at 10:51, Chuan Liu <chuan.liu@amlogic.com> wrote:
>
>> hi Jerome:
>>
>>
>> On 7/2/2025 11:26 PM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Amlogic clock controller drivers are all doing the same thing, more or
>>> less. Yet, over the years, tiny (and often pointless) differences have
>>> emerged.
>>>
>>> This makes reviews more difficult, allows some errors to slip through and
>>> make it more difficult to exploit SoC commonalities, leading to code
>>> duplication.
>>>
>>> This change enforce, wherever possible, a consistent and predictable scheme
>>> when it comes to code organisation and naming, The scheme chosen is what
>>> was used the most already, to try and minimise the size of the ugly
>>> resulting diff. Here are some of the rules applied:
>>> - Aligning clock names, variable names and IDs.
>>>     - ID cannot change (used in DT)
>>>     - Variable names w/ SoC name prefixes
>>>     - Clock names w/o SoC name prefixes, except pclks for historic reasons
>>> - Composite clock systematic naming : mux: X_sel, div:X_div, gate:X
>>> - Parent table systematically named with the same name as the clock and
>>>     a '_parents' suffix
>>> - Group various tables next to the related clock
>>> - etc ...
>>>
>>> Doing so removes what would otherwise show up as unrelated diff in
>>> following changes. It will allow to introduce common definitions for
>>> peripheral clocks, probe helpers, composite clocks, etc ... making further
>>> review and maintenance easier.
>>>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>    drivers/clk/meson/c3-peripherals.c | 1261 ++++++++++++++++++------------------
>>>    1 file changed, 630 insertions(+), 631 deletions(-)
>>>
>>> diff --git a/drivers/clk/meson/c3-peripherals.c b/drivers/clk/meson/c3-peripherals.c
>>> index a25e7d5dc6691d2d4a852e3d3da2b36f251cc141..a09cb1435ab108b2dcc209c6557bcd1988c4ba1a 100644
>>> --- a/drivers/clk/meson/c3-peripherals.c
>>> +++ b/drivers/clk/meson/c3-peripherals.c
>>> @@ -48,7 +48,7 @@
>>>    #define SPIFC_CLK_CTRL                         0x1a0
>>>    #define NNA_CLK_CTRL                           0x220
>>>
>>> -static struct clk_regmap rtc_xtal_clkin = {
>>> +static struct clk_regmap c3_rtc_xtal_clkin = {
>>>           .data = &(struct clk_regmap_gate_data) {
>>>                   .offset = RTC_BY_OSCIN_CTRL0,
>>>                   .bit_idx = 31,
>>> @@ -63,12 +63,12 @@ static struct clk_regmap rtc_xtal_clkin = {
>>>           },
>>>    };
>>>
>>> -static const struct meson_clk_dualdiv_param rtc_32k_div_table[] = {
>>> +static const struct meson_clk_dualdiv_param c3_rtc_32k_div_table[] = {
>>>           { 733, 732, 8, 11, 1 },
>>>           { /* sentinel */ }
>>>    };
>>>
>>> -static struct clk_regmap rtc_32k_div = {
>>> +static struct clk_regmap c3_rtc_32k_div = {
>>>           .data = &(struct meson_clk_dualdiv_data) {
>>>                   .n1 = {
>>>                           .reg_off = RTC_BY_OSCIN_CTRL0,
>>> @@ -95,39 +95,39 @@ static struct clk_regmap rtc_32k_div = {
>>>                           .shift   = 28,
>>>                           .width   = 1,
>>>                   },
>>> -               .table = rtc_32k_div_table,
>>> +               .table = c3_rtc_32k_div_table,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>>                   .name = "rtc_32k_div",
>>>                   .ops = &meson_clk_dualdiv_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &rtc_xtal_clkin.hw
>>> +                       &c3_rtc_xtal_clkin.hw
>>>                   },
>>>                   .num_parents = 1,
>>>           },
>>>    };
>>>
>>> -static const struct clk_parent_data rtc_32k_mux_parent_data[] = {
>>> -       { .hw = &rtc_32k_div.hw },
>>> -       { .hw = &rtc_xtal_clkin.hw }
>>> +static const struct clk_parent_data c3_rtc_32k_parents[] = {
>>> +       { .hw = &c3_rtc_32k_div.hw },
>>> +       { .hw = &c3_rtc_xtal_clkin.hw }
>>>    };
>>>
>>> -static struct clk_regmap rtc_32k_mux = {
>>> +static struct clk_regmap c3_rtc_32k_sel = {
>>>           .data = &(struct clk_regmap_mux_data) {
>>>                   .offset = RTC_BY_OSCIN_CTRL1,
>>>                   .mask = 0x1,
>>>                   .shift = 24,
>>>           },
>>>           .hw.init = &(struct clk_init_data) {
>>> -               .name = "rtc_32k_mux",
>>> +               .name = "rtc_32k_sel",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = rtc_32k_mux_parent_data,
>>> -               .num_parents = ARRAY_SIZE(rtc_32k_mux_parent_data),
>>> +               .parent_data = c3_rtc_32k_parents,
>>> +               .num_parents = ARRAY_SIZE(c3_rtc_32k_parents),
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>> -static struct clk_regmap rtc_32k = {
>>> +static struct clk_regmap c3_rtc_32k = {
>>>           .data = &(struct clk_regmap_gate_data) {
>>>                   .offset = RTC_BY_OSCIN_CTRL0,
>>>                   .bit_idx = 30,
>>> @@ -136,20 +136,20 @@ static struct clk_regmap rtc_32k = {
>>>                   .name = "rtc_32k",
>>>                   .ops = &clk_regmap_gate_ops,
>>>                   .parent_hws = (const struct clk_hw *[]) {
>>> -                       &rtc_32k_mux.hw
>>> +                       &c3_rtc_32k_sel.hw
>>>                   },
>>>                   .num_parents = 1,
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>> -static const struct clk_parent_data rtc_clk_mux_parent_data[] = {
>>> +static const struct clk_parent_data c3_rtc_clk_parents[] = {
>>>           { .fw_name = "oscin" },
>>> -       { .hw = &rtc_32k.hw },
>>> +       { .hw = &c3_rtc_32k.hw },
>>>           { .fw_name = "pad_osc" }
>>>    };
>>>
>>> -static struct clk_regmap rtc_clk = {
>>> +static struct clk_regmap c3_rtc_clk = {
>>>           .data = &(struct clk_regmap_mux_data) {
>>>                   .offset = RTC_CTRL,
>>>                   .mask = 0x3,
>>> @@ -158,62 +158,62 @@ static struct clk_regmap rtc_clk = {
>>>           .hw.init = &(struct clk_init_data) {
>>>                   .name = "rtc_clk",
>>>                   .ops = &clk_regmap_mux_ops,
>>> -               .parent_data = rtc_clk_mux_parent_data,
>>> -               .num_parents = ARRAY_SIZE(rtc_clk_mux_parent_data),
>>> +               .parent_data = c3_rtc_clk_parents,
>>> +               .num_parents = ARRAY_SIZE(c3_rtc_clk_parents),
>>>                   .flags = CLK_SET_RATE_PARENT,
>>>           },
>>>    };
>>>
>>> -#define C3_CLK_GATE(_name, _reg, _bit, _fw_name, _ops, _flags)         \
>>> -struct clk_regmap _name = {                                            \
>>> +#define C3_PCLK(_name, _reg, _bit, _fw_name, _ops, _flags)             \
>>> +struct clk_regmap c3_##_name = {                                       \
>>>           .data = &(struct clk_regmap_gate_data){                         \
>>>                   .offset = (_reg),                                       \
>>>                   .bit_idx = (_bit),                                      \
>>>           },                                                              \
>>>           .hw.init = &(struct clk_init_data) {                            \
>>> -               .name = #_name,                                         \
>>> +               .name = "c3_" #_name,                                   \
>>
>> Prefixing variable names with 'SoC' is understandable (to avoid duplicate
>> definitions and facilitate variable searching), but is it necessary to add
>> 'SoC' prefixes to clock names?
> This is part of the description but I'll ellaborate.
>
> Some controllers do so, some do not. This is a typical pointless
> difference that make code sharing difficult and lead to the duplication
> I'm addressing now.


Yes, in fact most clock configurations are consistent across our SoCs. Over
the years, we've been continuously working to make our driver code more 
'common'
and efficient.


>
> Both with and without are fine but picking one a sticking to it helps a
> lot. I would have preferred to drop the prefix from the pclk clock
> names, same as the other clock, but:


I still prefer adding SoC prefixes to variable names but not to clock names.
clocks with the same name generally have similar functions across 
different chips.


> * It would have changed more clock names and I prefer to minimize those
> changes


Your recent patch series has already made significant changes, and this is
relatively a minor adjustment😉


> * It would have caused several name clashes with other clocks.
>
> so prefix it is for the peripheral clock.
>
> In the end, what matters is consistency.
>
>>
>>>                   .ops = _ops,                                            \
>>>                   .parent_data = &(const struct clk_parent_data) {        \
>>> -                       .fw_name = #_fw_name,                           \
>>> +                       .fw_name = (_fw_name),                          \
>>>                   },                                                      \
>>>                   .num_parents = 1,                                       \
>>>                   .flags = (_flags),                                      \
>>>           },                                                              \
>>>    }
>>
>> [...]
> --
> Jerome
