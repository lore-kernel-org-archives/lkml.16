Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6E073477
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 16:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744475491; cv=fail; b=ehtmBri8w6GvF8iQ+KHVGEx7QyLlQvPFLL6qFY0no3YzvNW37S34LsBBT1IjdX8A/IF1x6+Bjk4OnNXMPCuwbqPxhYK8Yig+mtBwRzv7czvNdgZXFHmL+jr8efukJq98LfJypIcjkyexyWuiX2qje3rTnF05k08lgMXBgOPzJMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744475491; c=relaxed/simple;
	bh=je11Wrr0/ZurdFNr25Da7MaVjahA/2qDw4FBnAMf4ns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k/IHQJjeUXXx+AGXhF7YTFT1uuCrbOCUheyI89FH4RH14gOdMl2Wbl2Mi16WDuhERPRn6JlGENkTI+Z3ASDkgLJnq5iHYtBUn5NnCrrOzBP1Ur/GVbf5DUcsoXicnv0NPy+etK8Ys3VC3EriyTldNYQhrWWb2olHsTwu48vf8PA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=n2iLdVCz; arc=fail smtp.client-ip=40.107.236.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="n2iLdVCz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XTJAcCqdxNpayPh4Z/wH1UPj+LgreOWlhDyL75EavSYntHg/S8g/NEKzmDzqN/++SJGhd088/pZo/DeMLPUqfoaxzNfhet0cCtVXL7HaTKxnts//9RFFCFwDsw7+1W1kV9+GwFH/oPg7WdrJ9aItDbViWwbCBpz6blgEVZaX75epJyrRsBdz9QoG5m3NZ1U3aSmACEpyhcjQaYG5hsFYc/jR4tt2HEe6c4u0GSnXRb2bhI/Hqy8GhCTW+wlVqJ7b4U4Ek/DdRYdowdRXy5Nh9Ou4j63rsX9laKmF69CCEt3iSiWoufLJ2nBPylNJQtVVoayVKRMoOjnx0CxNnH8JyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyMmttWRp2x7yJXK56OZhZDtm/RZJhlOuLZ/XMQlLp8=;
 b=KTbUzqqniMhr2fbJlrb1A21M6uJjbU5xDDAxMDp7NceYBe/KUjRaPo2EQI5tMWKHLOd8Mew67xnaCivkJqLftEgEuxjOgJr63qGQgNYFt8/6cGl67DjXkS/fvSkzSr09LQmqJSAckIkspwJsVLu+VjYf6u9tgEP4XO5tzcILV8zc7nTWo59UJsBCyLErS8/Do/J0nx+tQKlBupxXeLu0FNqTjOY66oTY12Md/MPzkrVbscVbQovEVN1UwVvvj1kN1XEA2D1wJHOIzzDiOR6EnewD1/tDXCBOTOerCtoK0BvdXRDMKtwE7PjNHy/zYBM932cQ/eNsArQkgVnHOgrV/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyMmttWRp2x7yJXK56OZhZDtm/RZJhlOuLZ/XMQlLp8=;
 b=n2iLdVCz52Jk2tLZ01h19v+l9BOWe1vv0asX0Dfvd2+VaW+UDKyE/LixM0liT8ISt54SXk2p3+PdO9m5T854A+R1louh1Cbksaz1sNEa9Lx74yF8jxrI6d+g3/PEw7DniZGaqVipaO3iF1K+/GI2H8QQrAOnlnVvsIDn8Yx6kuItZqC9YDL74JLCqbuy+opKOhlWMqisizETtQ2xg2FhsPZaaz4W3Yg5mvb4ixTmPU9c6zWrLB8gntz07ZO4O5gCyV7ONQw49kuI8v7eYCYmrC9lXGUK8d09TgNXlh+n+mnyyyhHOdWTZHSa5BdbRoi4NSqX7iP9Z5xWoO5uL6rjdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.29; Sat, 12 Apr
 2025 16:31:27 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8632.025; Sat, 12 Apr 2025
 16:31:26 +0000
From: Zi Yan <ziy@nvidia.com>
To: Barry Song <21cnbao@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Barry Song <v-songbaohua@oppo.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 David Hildenbrand <david@redhat.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>,
 Ryan Roberts <ryan.roberts@arm.com>
Subject: Re: [RFC PATCH] mm: don't promote exclusive file folios of dying
 processes
Date: Sat, 12 Apr 2025 12:31:23 -0400
X-Mailer: MailMate (2.0r6238)
Message-ID: <F7DF65A3-ABF1-43C0-B4F2-DC0EBB2B1668@nvidia.com>
In-Reply-To: <20250412085852.48524-1-21cnbao@gmail.com>
References: <20250412085852.48524-1-21cnbao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0099.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::14) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: e77ad59d-bbc0-47e7-29b1-08dd79df7848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZktrRUlNVFFielZ0OWo4ZGNZa1NNQzlHbHRqTVVZRFBiVlFFZmhjdDFUZm9H?=
 =?utf-8?B?Y212by83VVpFbFF0S0F3OGFyTFZPcERNMzE5WGYyZnE3VjRyN0R2cXYyR3ds?=
 =?utf-8?B?UURUSEVhbVdKTCs0WXNVcG5tY2piclNUdkdWeExCVk02eVh6M3AxMXc2dEtS?=
 =?utf-8?B?ZUsrV3NucEtSbzFnbDFTbTRBMDFTK214YjRUVm5DK01xajgvenJHamVvYVd6?=
 =?utf-8?B?cG4xczg0Wmg4dDNhUmJNY21UNFpOcHJqdWNLemR0THpxdUxZM0duaG5wakQr?=
 =?utf-8?B?WGEwaFBRK2pRd2djdWNCZXdLaFVwTmRFSGhTc05yVGk5RHQ0VlVOYzNMVEd1?=
 =?utf-8?B?cWRwZWhMZVk0VmN1REZ1Tnl2dXBzVllYTjd0SGRuR0FGSjNLNy9HVmxtUEdJ?=
 =?utf-8?B?L0N6dWkxcXdVbC9tSFlHWmM0VmVTQnEyWGZzVmozZm5RZDBFMkRXYzhYd25S?=
 =?utf-8?B?aGg0aEExZjJOSlAwZ2U2azZCMzlhUkhSa2hHWVh5byswYXFENDdrQXRnU1Rz?=
 =?utf-8?B?aXBLcnl4WGhtMFVRTnR2RUJBc2ZpZVFqNkhwVThwcGgvM2NJcW5wNGxGekNz?=
 =?utf-8?B?dU9PVk5IMGs5czFlT215QkN1SExpMHhUS0xQVi9pbDNRQThTSE5wM3NYVnNz?=
 =?utf-8?B?TEFmblcyOXJuM0MxV3FGZWxHaGpkUnlmTndtYVQrWHZUQ1Y5MGNWVjAreTJW?=
 =?utf-8?B?MlVUQWdPcUZ3RnRYYWM2MDlsbEhrTU56MmdtMGFBNmptTTArRUpMSXRBQ1Vv?=
 =?utf-8?B?ZDYrbnlHaDBiM0I5THVGenlTMHlKQkF2ODc3Z010NUVVbitaajZ3em9LV1E3?=
 =?utf-8?B?Y3FuMExpWHhOdEc5djFZYWxrdHZVclN5WFY5clRna1BHZUR5ckhJZFl5UTFI?=
 =?utf-8?B?RUJXczlFWXpLOUlVY3pGS01HNWZoektJYXFrSC9kQzMxLy9GTm5pMjVYWWhC?=
 =?utf-8?B?OXNjYnBwTlhIQ3FtbkVyaFpyMHZsakwzL3BMcGFaU1hzZ2FtYlpzbU9UQVB4?=
 =?utf-8?B?L3dkYWp3S3J4bU1PdGVibzMvVDBBWGZ4bFhldjhIRG9YVVA5ak5RQ28yVVVm?=
 =?utf-8?B?ZzJncjM3R0FIbTBkZkgySTJ1Kzg1T1daUXFIWVpSNXFEL0tJYkdCc01JUnJ0?=
 =?utf-8?B?aElzeElrRldhelpTRTd3eE5HSzBvbU1LdE9ZK2RSbVI5L0xJREJwRjUxV2VT?=
 =?utf-8?B?dlRDQy9vTWYxRS9yaCtkVThLeEZzbmlDMVh5NXAvakpGNkpDdEdNL2NwK2N4?=
 =?utf-8?B?RDdCTE9IVWhrdTBORWRlc3hZKzZoeDBVTlBzWis5Uzl4bE5lTDluWEJjRnlv?=
 =?utf-8?B?MXEvbVNMTnVZNXQwd1pwNU40ZENiSWdGbWJHQ3dDcEJGcHRBOEU1a0kwU05G?=
 =?utf-8?B?VkZuTWlMV01NczR5QWRwZzhqR21QdktLK2grUmF6c1lGWVY2NzNmdFc5d2xB?=
 =?utf-8?B?SEtpSHVYcW9rczhEcXQzNXJ1WjYyRFNkYU91Szg0ZzZ6SDFpTG8zTFlOTUht?=
 =?utf-8?B?QStmYkFBQ09pYzh5dkRjUXRrMlFMVmJmU2Q3MDJPWE0ydlM5ak91TW1CT3hh?=
 =?utf-8?B?ZDRBaVc0RnRQU0U1Y2FFcXl1NmJyekV3bmxkM3RvNWhTaDdmdFJWdXpXQzVS?=
 =?utf-8?B?MjBsMVg3UTdrU2wxc3puOG5EcHlQYXVsWTJJd0huQ2EvOTBXZHJlRWVFUllj?=
 =?utf-8?B?akl1V3pKT1I2Y21lZ0k4N3BvY0tWM1RVcERvby8vYlQ5VVdYN2FaZTZNcWhx?=
 =?utf-8?B?WHF6Uys2eXRZUXRxcUlCS09SaEtQTFpyc0VDWm9lWDlTRWMzR2JibXRtNGRQ?=
 =?utf-8?B?WTVVZVBaL2dOeUJ3RXgrd2JxQ2VvVm1UQnlReFh5T3RpTGdwT05NaXJtVXpD?=
 =?utf-8?B?c0NDcUl3bENSZThxR3BBR3o4dE1rNEc2a0R1WUxYYkZzNGExNmEwQnpJTEpw?=
 =?utf-8?Q?b1GyB7o7gog=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RSttdlJteDBKQmRVSkZZNU1udnlZcllwRzg0dkswWGxOK0UxdmhvV3FpbWti?=
 =?utf-8?B?SStLR3JjZGcwSlNFZjlOQUJMMm5JWVZ2b1k5ZmsyWTJYZjVYV0d3SFVJM2U4?=
 =?utf-8?B?c3RtM0VIdEw0cWZVN1hPQ2JqZW5md0VMSjFuK1JtRjhDL0grZ2pQdWkxOStN?=
 =?utf-8?B?ZnpZSW1mV0VZUlRvWkM1TFNwWFdBMTM0ekM0cHVLWC9FVG8yTHFERGxIdWZM?=
 =?utf-8?B?WWduL0RHaGNyS0g5MFA3T0lQTTJhc2U5ZFlpZHhtVElsbG01MXh1TzFOaUxK?=
 =?utf-8?B?dS83TDdyNFVwaER2enV4bnZyU0VhSVE0cDJ0RkRVUVVPRUR3NXhOOVpDcndZ?=
 =?utf-8?B?cmZ0eDNCZHNySDRObjdBZTFxQWFqNjhCcVcrSjFRWkFpeVFYai9qL3N1MGtv?=
 =?utf-8?B?b20vU3N4Q2M2ZTdtV0NPa1hrT2xOSlovcEZJSFJvTHVsanorRWV3V1RaRFR2?=
 =?utf-8?B?ZFkwTllURmVXTzAxZkh1K3BnR200MTR6RHE2ajBoVmpMUWx3enl4Tm5VQW9n?=
 =?utf-8?B?czNITkNnYXdDY3dVR3N5ZFo0UzVXSnYrVHQ3aUkzOXBmS0pDalFkVWR0aTNk?=
 =?utf-8?B?SWE4K1ZwajhNVDJCUE5LZEVNOENsampITXlJQitJdk94bEVHV2sxdm1zNnRo?=
 =?utf-8?B?Vk4vaHlDRWI2dWdMMUJkMEttZ0JqL0lqZmEyYnUvaXZkQmRIbGdaQUpTS254?=
 =?utf-8?B?TklqMVJwVHlTaVJkdTNXQmxWZGNWaVprcDEyYmk3M3ZGTzF0c1N0bkpvNXdu?=
 =?utf-8?B?R0lUK2p5ejl0ajcwYmk2OVBxZXNwWUZqSFZaaFNRVldMY293cUFoeE9tblhU?=
 =?utf-8?B?YlZMZHJOckxnRTRSUXpOMkNEQmN0b0pST3ZSODV3WmQ5QkVMcjhlaVQwV0Nt?=
 =?utf-8?B?OXlQN2ZTcDRQRHZ6S29LQVlGaTMwQmRZLy9ZR2tCUVNMc3BHbmRMTUtnbjVw?=
 =?utf-8?B?MjQ1d0dsMzJzUXpYVkxjc3YwR3I2SUhnNEFNWkxRZEFkOU9wc3lFZEZiQ0kx?=
 =?utf-8?B?cGppcFNST0Z1SDJXTHhNelMrQ3B3ay9IdXdGdHZFelVUVXQ0bzZ3QnhyaFhT?=
 =?utf-8?B?NGlXWllIRzdWVm1ZeHFyTUFtVkVZd1R5VnNlSHZOY1daZ3o4OU9VWUx6OHpE?=
 =?utf-8?B?UWVZZGFydFpUallUK2MwY0FrZFBIZElNQkx3UEdJbVR5bERBTWNDcm5mdjhH?=
 =?utf-8?B?U2FLeXFWdEZ1WWtxWXJnK1Y0M1grbDgzL1pJSStwdVNkeitJcHZsbGdMdjIy?=
 =?utf-8?B?elFZN21QTkxDZFVKNzJySVJUdTFtbm9Venp2Q1dsb281OS9hdVg4bWZZekpR?=
 =?utf-8?B?WU85TGRvSEdUeEFwdkR1SFdsMm9ra01Gak9IcW91ZytHOFdsV1YrcVhGREJP?=
 =?utf-8?B?S2RyWC9IZEZHTWJWcjRKU1g1aTkrWnZ0ZERXUlZxQ3A5QVlueElPQXcrR1d2?=
 =?utf-8?B?bmQ2d2RXWU01Z1FpUGdOWmRoSnorbXZIbHZOSTY0aDRRNHFJdC8rWlBoOUc5?=
 =?utf-8?B?ZjduTVhWNGJNZ1VFMDNadkpsRlVNUFY2Z2ZrajV0b2NLcWVjUnVEL0R6ZDFu?=
 =?utf-8?B?cjUzSjFjWkg5VkJndkUza3dlSXNINUk0bjNyemdnZnFiTkp5d1JKV1FkZGdT?=
 =?utf-8?B?UURNdHZSMndQWjF1RWRJdzRVYnRLaTg3MUVMcEdKcUVvR0xYUWRmcHhUYUZE?=
 =?utf-8?B?SnIzeVVPK2NzZzhkLzhJdURoaU1ONUxDd0htczlodC81U2ZGYUJmTUVYQXUz?=
 =?utf-8?B?YnhhSjR6VUNETG83c0hRcDNlR2Z5c2JjZWxNK2xlMlh4eWgyNlUwc2wvdmR4?=
 =?utf-8?B?dU9GNWp4cnVQWFV2VWFoRVRySU1HQkk3QTN3UlRWRlhvL20rOTdVaVpDL2U5?=
 =?utf-8?B?NzR1S3ZFN1lneTdNdWRGS251eTJBSk1RbllRak9ITXlXT3VTVFgxNzlpWU9C?=
 =?utf-8?B?OCtWTnEwZFk2WStla0pEOGY5VkRTemdhQzQzZTJPOTFhUVlXUGNmTlovZVEr?=
 =?utf-8?B?d0xQQ00zay9LU2h3ZjF4empEZDMzb1J3V09sQXNldUM4aTdVMTdtMlMzU2lo?=
 =?utf-8?B?VjFydUl2T2hEV09RYjNZSmd1R25OV01WUW9mM3pnRk12Y2gwVTVvOWU1SnZO?=
 =?utf-8?Q?ZlLWagYoT3l2JjCtemjjmV/ZA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e77ad59d-bbc0-47e7-29b1-08dd79df7848
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2025 16:31:26.0374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+tjnzlDgdQT+0/UmqC4u7Xt9oGwhBaOkCf38RhK4DEToTSTcSoqQwHgzpILzGbg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

On 12 Apr 2025, at 4:58, Barry Song wrote:

> From: Barry Song <v-songbaohua@oppo.com>
>
> Promoting exclusive file folios of a dying process is unnecessary and
> harmful. For example, while Firefox is killed and LibreOffice is
> launched, activating Firefox's young file-backed folios makes it
> harder to reclaim memory that LibreOffice doesn't use at all.
>
> An exiting process is unlikely to be restarted right away=E2=80=94it's
> either terminated by the user or killed by the OOM handler.

The proposal looks reasonable to me. Do you have any performance number
about the improvement?

>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Johannes Weiner <hannes@cmpxchg.org>
> Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> ---
>  mm/huge_memory.c |  4 ++--
>  mm/internal.h    | 19 +++++++++++++++++++
>  mm/memory.c      |  9 ++++++++-
>  3 files changed, 29 insertions(+), 3 deletions(-)
>
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index e97a97586478..05b83d2fcbb6 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2264,8 +2264,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_=
area_struct *vma,
>  			 * Use flush_needed to indicate whether the PMD entry
>  			 * is present, instead of checking pmd_present() again.
>  			 */
> -			if (flush_needed && pmd_young(orig_pmd) &&
> -			    likely(vma_has_recency(vma)))
> +			if (!exclusive_folio_of_dying_process(folio, vma) && flush_needed &&
> +			    pmd_young(orig_pmd) && likely(vma_has_recency(vma)))
>  				folio_mark_accessed(folio);
>  		}
>
> diff --git a/mm/internal.h b/mm/internal.h
> index 4e0ea83aaf1c..666de96a293d 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -11,6 +11,7 @@
>  #include <linux/khugepaged.h>
>  #include <linux/mm.h>
>  #include <linux/mm_inline.h>
> +#include <linux/oom.h>
>  #include <linux/pagemap.h>
>  #include <linux/pagewalk.h>
>  #include <linux/rmap.h>
> @@ -130,6 +131,24 @@ static inline int folio_nr_pages_mapped(const struct=
 folio *folio)
>  	return atomic_read(&folio->_nr_pages_mapped) & FOLIO_PAGES_MAPPED;
>  }
>
> +/*
> + * Return true if a folio is exclusive and belongs to an exiting or
> + * oom-reaped process; otherwise, return false.
> + */
> +static inline bool exclusive_folio_of_dying_process(struct folio *folio,
> +		struct vm_area_struct *vma)
> +{
> +	if (folio_maybe_mapped_shared(folio))
> +		return false;
> +
> +	if (!atomic_read(&vma->vm_mm->mm_users))
> +		return true;
> +	if (check_stable_address_space(vma->vm_mm))
> +		return true;
> +
> +	return false;
> +}
> +
>  /*
>   * Retrieve the first entry of a folio based on a provided entry within =
the
>   * folio. We cannot rely on folio->swap as there is no guarantee that it=
 has
> diff --git a/mm/memory.c b/mm/memory.c
> index b9e8443aaa86..cab69275e473 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -1515,7 +1515,14 @@ static __always_inline void zap_present_folio_ptes=
(struct mmu_gather *tlb,
>  				*force_flush =3D true;
>  			}
>  		}
> -		if (pte_young(ptent) && likely(vma_has_recency(vma)))
> +
> +		/*
> +		 * Skip marking exclusive file folios as accessed for processes that a=
re
> +		 * exiting or have been reaped due to OOM. This prevents unnecessary
> +		 * promotion of folios that won't benefit the new process being launch=
ed.
> +		 */
> +		if (!exclusive_folio_of_dying_process(folio, vma) && pte_young(ptent) =
&&
> +				likely(vma_has_recency(vma)))
>  			folio_mark_accessed(folio);
>  		rss[mm_counter(folio)] -=3D nr;
>  	} else {
> --=20
> 2.39.3 (Apple Git-146)


--
Best Regards,
Yan, Zi
