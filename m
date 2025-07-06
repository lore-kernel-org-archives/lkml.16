Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2046.outbound.protection.outlook.com [40.107.236.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA14CDDA9
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751764904; cv=fail; b=ePjXwSP1VRaVFkEwmmzFN9KQlRDXY0Esof1DJ3dSTXK8NgP/VWkGPpF2NvygAEnOEt/TOICQmSnEmVXXcLTCuNJr3AcRKfd9UO1cvH6IuT9YTYupiKyCyqzcineB9jtUM00zHd8DvHN1Pfv62gIzzs1Hd12UpRAyIQFQRsqPHJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751764904; c=relaxed/simple;
	bh=0BtT2eF1SOmPak2xk4fzG6xrO23r/ZJl/WyzbZ4UXHk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=teutlHYhDQBzDOI8x8muWGiTcztB9FKU0SaIMCndmIaoJ0XbddhwBwmNIK8UIy4cOT7b5nbq0HPobHKx8l4hytnlPkghUjolidoZx9An7Prh0A3oY+qmyIzVUmFEhsCtmEGSYV1agw75dwdKmSCUE/bpLqmpu0d7WscqDmMlmSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=mZks6ltI; arc=fail smtp.client-ip=40.107.236.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="mZks6ltI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c1EnvNlzyEzbiGD6dHRrDfiO7m4ilH8jTTCzadSKJ6VSuW4V1w49/m/5uj9SImdRlj0yjVmrTMly7sWVo0kc05Hs465NT3PmLejceGZws4pa5gfBKRk5kWcXx8f5Wao8jod8blpsv9w+Qaw+cuaRIpWPh4G3/hFBh0V7z4QKb2aS78QG2mLkKh3PUimkDm5qtIXEF64vMSD/tJt/iBM9SPIiCc1CvYndb9eeTIb99gqrrIrK8Ip1Pkx+fE5HWYAZ+zW688/Vw9BSTbvQ1R/jXo7PPAY7+ljslCQIgo4Fa3bbVqBjUYIaFmQSnB+R/CPfl7+FlA3G8DAuF2RjIhAm3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbgJ8g2l8y9IplkBppXrILR/j1IybOglD208GMrVakY=;
 b=jyHj/5WFba5cA5gSP2qt3pLNpyZmq3AdZwkTgHnW2bVydcGMlF+ryHHUVYjeZvgn6OoMpkQs+6rv3o7XFIj6efSk7lZfzSOdg86yc3fX8O6LLPJvl/y5ATnj3ulbnObDa7XT+y9QrjENXvd/Q6kaeMkB4VWtZjETQc4I1UqVIB7lKAPyLBCqyz7G0Q7WLEPquJSWvxvpgm6LQxYiwGh6T2E/xltMQGs508VeTeLQDKpBAEU4CvkgsnduDk8q+Ess7GPp/QetxwTjlwcY+BWWgjpqhOEguctEtXDMQ5ZdT24H1qQ3vNlzgu9djO63FybnOD3HCNLx+IJoOZtXeKPQmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbgJ8g2l8y9IplkBppXrILR/j1IybOglD208GMrVakY=;
 b=mZks6ltIkzLJMRZCxmR/BY24zSM2Tnxmp3tzMvNQZWxDpuVbyXri6aQaorMtk7RxrC3nw8pjliyNf0wmeRc7PW2SihtZWz8qreo+hU2LxM+iAhiBkcXSnZaidHdtPuzt8iMvte1h0f7qWqD0kamFRsODFJYMtpOGbUO4yM48mC4TmtjtDtT66EKCmIfavVZF386LrdWqU4FpcUZa7HMTuZyOO84Ha4P5ePzGlA6LFxCyLo/MLAEhRs0mMdC+YGG+le+ScAffkXAtsosjqw2VEjsUzt0YkgY16uahdVqmqAbnF3TiuNNtmHSwjdvI3OStHUfPJSutgLzdiaaahE+sSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Sun, 6 Jul
 2025 01:21:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 01:21:39 +0000
Message-ID: <5c77bf07-3a8d-4bda-9281-ac9f4bf76381@nvidia.com>
Date: Sun, 6 Jul 2025 11:21:32 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 03/12] mm/thp: zone_device awareness in THP handling
 code
To: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, linux-mm@kvack.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Jane Chu <jane.chu@oracle.com>,
 Alistair Popple <apopple@nvidia.com>, Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <20250703233511.2028395-4-balbirs@nvidia.com>
 <c1666d8e-2c16-4659-9fba-c270dcd42016@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <c1666d8e-2c16-4659-9fba-c270dcd42016@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0046.prod.exchangelabs.com (2603:10b6:a03:94::23)
 To PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c15d240-5be2-4f05-428d-08ddbc2b74f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eGx4NldhZ1hEUkVjMVUvYThZTTd0UFlRaUZOblNCT3orMU1RSElZenY4QXM3?=
 =?utf-8?B?amY2ZUVoTExTbkhkeXJWMmgyeC8zazJsVzYvSVBOY0ZCaXc1WmV1eXRMZllp?=
 =?utf-8?B?aERBNlRGMC96emxSc2FnK2Z1RFhnekNzdEE4Q21aRkI0emp4VjRwSzNXcnRO?=
 =?utf-8?B?djlOaVpRZkdaWFBSd2NiNXpXa0hOUnFUNEpzQUs3NkFQSjliekxmbGlpNVNn?=
 =?utf-8?B?T1o2bVdsYk5MbEpqdW5TeTNXemFkZHEvZE9JdzJ4UDVWVTFpdkY4Y1FkcGJj?=
 =?utf-8?B?dHl1SllxSUdXbEZFb3FkNFNMUkZDWGtkSGVlbU9lWXJmdENVdHJNazJ1MTJE?=
 =?utf-8?B?cXg4L0xaRDhIbytBNGl0L1oxSE9DN3lkK25wcUxzbi9UZXNaQThDZVIwQnpo?=
 =?utf-8?B?THJMNWtGSnc1VVIrQUZER21pM0lhWXN3OXBBdVlsQzd0U29HejhwVG5mRFNL?=
 =?utf-8?B?ZFFOcERBbFkwdEZOd1g2MExkWG44VzZKbDZLMlhMWldGSElJZDR1RjJJT2hm?=
 =?utf-8?B?U0JvbXVuVHFrdVIrZ0hIMUV0RHZabWxaVkdTZzREbDUrL3dYTURSSVFmWkU1?=
 =?utf-8?B?VHM5NWpHbU5lNVZIVVZtZTRESnZpdXhEL3UzQXhJMUljNVNhSjMzUWk3NFZO?=
 =?utf-8?B?WWNuRnd3TEVDWjYvT0RtekxzeE5TaG1rWE1aRytvRXBCWG5HQ09CNHl3Z29n?=
 =?utf-8?B?ME93L01jaHl3YUNRN3I3eUNLL0FjOU9tT25ReXBRODcvSjczSVlUUWEzamQ5?=
 =?utf-8?B?VUhGczNqTEl2MmVlYjRvcXdySkZEMUttZ29QVjhVK3JXWlBwcEs2MVRBNk83?=
 =?utf-8?B?NHd5ZVVJaVl6RkVaNC9YQk9jYUhSYVBRM1V1YUZyYzJabXpYczZxdnE3SDRn?=
 =?utf-8?B?NkhoaWkwYjk0RXVGOFIzL1FxcFhIZDQyMUk0QWlKWGhpckw2bkVPVkNsOE1t?=
 =?utf-8?B?MUxBVUhDZU9INFFZcHE1SUJDV2FQQjdpM3J0bXV1MklLb3pQOFZTVHdwUThL?=
 =?utf-8?B?K0FIaVNTbzFsdDVUc0Y5YTFrd1orSlJ2Z2ZXUjQxRUJ2WWdMbCtTMTBaSHNq?=
 =?utf-8?B?eG9mUmVURm5INzFTdHg4Z1FEVzZ4R0FOR1NENTcwdHJSUDNXK2pKb3ltZ1VZ?=
 =?utf-8?B?c0JhUlJ6RHF3czFxcUp2NFF2cjVqM201TzRaa1R4ZHZCTG1RbjV5Q3ZiMThG?=
 =?utf-8?B?dzl5d1FNNTVmaGdnTXQ1SnVUSk9DVllWYjh1T1J0elZ4eVl1b29NNVc5TWRu?=
 =?utf-8?B?b1RMMlFFQklXVGRFSTM3VDE1cjhFamhkWTJFbitMbjRoMDFNTDJuYk9GNU5t?=
 =?utf-8?B?SDY3bWtHaTlFOG1zT2dHWFNCZXZCaUhrUW1CaEV6YzBCYjVwanYwNGdyTU9v?=
 =?utf-8?B?WFlKTlFrVVMxMms0a3V3aXg1QnpkdTdIbzV2SkRDaW9aejN1VlJwcUwyOEh0?=
 =?utf-8?B?MkdzWU5lemFkY0VMUDJUWWxmdWpoTXJRcEYvd1NBRW5NclJzWlNMTVZaOHYv?=
 =?utf-8?B?L2IwMzlmTnZMa1ZzNmR2M0trTDNvcFpXeDBYUG9HZGxncHpFL3Q4dVdlaEps?=
 =?utf-8?B?dkVhZVM5ZFpQcnQ4WnBZS2dzM3lNUXdxRWFHM3Q2cWJHZGp4T2o5QlQvT0Rz?=
 =?utf-8?B?ZlhxNTBVc0ZHeGF3RVdpRXZ4MVU0aUZPbDA0QXNrbHc0ZUhISE1yRE0vSnpS?=
 =?utf-8?B?ZXhHakY5RTNpNXZ3bXBBR3VpRTRFQnJPWVU4d2dlQmVLVlk5bkZMYTByQTYy?=
 =?utf-8?B?VVhlWEdmc1FDK21WNXBJQ2pONWFVZWgrMWc1dVNQSnBpRGU1TEdyelR0c2FB?=
 =?utf-8?B?VXE1a1Q4YUlLelkwc2pWMDM4N1kwMThzdEdhNjVjQ2ROTWU3Q1lBVmkwM0Vn?=
 =?utf-8?B?ZzFqNTgvS1hWcUsvWWg2UFduTEczS1Zta2c4WFAzWWd3R0E9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MkgzeGVzZnZub1BkcmZjSlhsY0lPcmlQTUd0eCtkSVd6UHNZUFpSTmY0RGdj?=
 =?utf-8?B?YVVoL2c4TmdxSFlYRmJzam12SmUvTy9zUVpDOWlMa2hRUjRpNkQ0YjVnQVpB?=
 =?utf-8?B?aDhGWlFBYThPRkk3c2NMRi80N0NXYmxnc1ZnWUZUZ1c0ai9tOFZIcWFBK0F2?=
 =?utf-8?B?dzZrODg4ZG9ZQ3FEOXRiVkZDQ05qSU9PcUU5dXFwLy9XcURTazBEcURFQjFu?=
 =?utf-8?B?MGtFZXp6d21uNDEwcHBTMXFzZzRHbEorazhFTlNlZmNtVVFXZGRlanRBTlBn?=
 =?utf-8?B?RnhEUE40d2dzay95bTRWQVVGdXhVUUxNa3ZTN3owaXcvS0tYS2EwRm5QM0tD?=
 =?utf-8?B?bXg0NFVsR2w3N2w2TDVwYVFPOTZCMFRQZmxqUmEzWUNxRG9LV0x2VWxKU0ZG?=
 =?utf-8?B?dDZ3dHFINEkyRUhMYWNNVFE5Smp6RHNkTjgyeHcxMXd1NDBKcURzUUFVR09Y?=
 =?utf-8?B?TmQ4ekdFSVVMK0Q4Z2pVY3VzUmR0ZVcvMzBoNlh0OWlyY0t6MDZ4a0xDcE4v?=
 =?utf-8?B?STVpNHhDQmpwSEpTR1B3OVNMSmFONHN3MnNjV3ZhZ2dkeUNnbkwyVWNIWkdx?=
 =?utf-8?B?SHM1c2ZiNUVUTFJCYWVHWnlTWWpKdzQyTkJIaURLZE5tdTVDcEFHaW9jRHJT?=
 =?utf-8?B?c3FLRitIT214MDFvbDBJSWhQck03TGxJMnpjOVV1MFc2K1dHdFB3R1lzQnFY?=
 =?utf-8?B?RVkyK3FtMlZyTXc1UlBSTTJ4Q3l5L2lvamtlT0hWVWVqZDlla0JxK0Jmd2Z5?=
 =?utf-8?B?ZDBZbTluRm5kNGdLajhvcThJekx4WmNpM2xkeml2REhiMTVlby9uNlVwVG9N?=
 =?utf-8?B?eTFUZWJ1MlJtbWpHVStGRCs0UXQvblNBL0NUd3RGOWE0d09KWnYvN2ViVnNl?=
 =?utf-8?B?bWFPTXMyV0t3RHNTL2x3aXMyS3Q3TXNSd0FLYldwVlUwUmsxYzl5cnVxN3M5?=
 =?utf-8?B?R1UrNkZCcmc3RUw5YVZHNlNobHp2clk2MVpPTTlhbzh4RHFJRGpXNTZ4c2xj?=
 =?utf-8?B?SkdkYUlQYzF4TXZ6Y0Z1YjcvcEZyTVBhM0RqazYxWHdHbFJtTkExVW1maHBq?=
 =?utf-8?B?VTR4cE44TDJESGZiRVRlV3VOd3dCQVIvRlNWdkJ5MUt4c2pkYTcvRFVYcjM3?=
 =?utf-8?B?Q1M1TWNzTWhObFlMRzlrTlZoR29GNy9Zbm1IZlRYNTh1VXpXaHFWb1NYZFZw?=
 =?utf-8?B?OHJYRThjNUUyYTlaU3VwMFlwYTlLUzZpckR2eXJEV21VQ1pYK0trd09WbGxu?=
 =?utf-8?B?bXJVbHJVWjJQYmVacWNxN01SNXJPanJoaDc1bmdBVllPZE9DWHlMeFRoU21I?=
 =?utf-8?B?YnFMUFhEd3EwUnhDY2Q1dEFNVGxkdkd3OGxtSURWMTlBQllHUzgrVE1XcExt?=
 =?utf-8?B?ZW84aG9RVlpBTXlITDd1aVE4bEhQV2RiMU9mSHFiMmxhOVZRN042b1BRRm95?=
 =?utf-8?B?OUVUZDZleksxQTRmK1JXdXZ5R0p3T1VDaG5sT2tCbTJSeGgzdFNuZzhEeU9h?=
 =?utf-8?B?M0UxMjVJREx3Q3dMSm44YWl2SWplV1VlWTFrZkxZZWxtcENOVkEyVGdsb0tF?=
 =?utf-8?B?N0ZZcVluTW55OS9qM09qaUhiMnVhdmxPdkhWQkJEMkFad2JhTHBhUy9mQ3lC?=
 =?utf-8?B?TDdvM2tOVFFzWmNsOThCTXlzNWdpZ2dpMCtzek9zdGgvLzl2eW5ZbE9PT0E1?=
 =?utf-8?B?b0xGT0o5WDFDbVY3VmpMd09mOXJiQWFXQzR3aGJDQzRQb3JVSXNkaDF5VE5h?=
 =?utf-8?B?dTd4NllxcW9ERVdDaUtDL0NoWGFWTXpOYklrWVBXcHU0bFdVVG1CcldsRSti?=
 =?utf-8?B?TUZ3Y0pzL0dRNTFWK0paSjF3VzRLc1FYdVNFRGZqc2dhcFo3UmtLUnYxazNs?=
 =?utf-8?B?d2IzRnFLQ0NKVEhrc2twNm5Tc2RVUGg5aHppdHBPSkh6RGVjVUFjYjBUcnJP?=
 =?utf-8?B?eFpNdDZBcE9vemkwZGRmeHZpNHNlbzZmYkFDaWd1dXBQemZIYXhiNW9peTZ0?=
 =?utf-8?B?U3hMSGhCcjlTbHc4dlNpUUcxZFB4bEpSSm56emJvY0pZc2ZXeVYzdkJGWVpy?=
 =?utf-8?B?TnFsWHlad3gvK0Q3TTNOenNKcjdLNU1MTUZKUXVaeTk3WWNKUHBjQ3dOdUR4?=
 =?utf-8?Q?hNsC2bXJ0ugzg22EhC6pRmagZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c15d240-5be2-4f05-428d-08ddbc2b74f8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 01:21:39.0901
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oVr2ZIF2vjpK9EBjL4jC/fpm9KKRWSyJlBp78pVGJkgEXzHvcmQKT2WBKyWyHthi8IDNF4/S68XGrS2MDjVYqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

On 7/4/25 14:46, Mika Penttilä wrote:
> On 7/4/25 02:35, Balbir Singh wrote:
>>  
>> @@ -2899,20 +2923,25 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>  		return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>  	}
>>  
>> -	pmd_migration = is_pmd_migration_entry(*pmd);
>> -	if (unlikely(pmd_migration)) {
>> -		swp_entry_t entry;
>>  
>> +	present = pmd_present(*pmd);
>> +	if (unlikely(!present)) {
>> +		swp_entry = pmd_to_swp_entry(*pmd);
>>  		old_pmd = *pmd;
>> -		entry = pmd_to_swp_entry(old_pmd);
>> -		page = pfn_swap_entry_to_page(entry);
>> -		write = is_writable_migration_entry(entry);
>> +
>> +		folio = pfn_swap_entry_folio(swp_entry);
>> +		VM_BUG_ON(!is_migration_entry(swp_entry) &&
>> +				!is_device_private_entry(swp_entry));
>> +		page = pfn_swap_entry_to_page(swp_entry);
>> +		write = is_writable_migration_entry(swp_entry);
> 
> Shouldn't write include is_writable_device_private_entry() also?
> 
> 

Good point, will fix.

Balbir
