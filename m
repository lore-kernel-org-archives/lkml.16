Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57CBD2797B2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735779; cv=fail; b=F+PtL39GUWbsfFNxcvjLnQLswad1Mag7qO9GsgAHzql67VPPjAW8LlLFdc+MX8WuR55K6B84L5VdYdMtXNTcWMGQtGbUiosOnau4pJARv2/q/o6dNtprRR+yELUYDtAnqTiGNGYmFSZoR8xrh1fimaHgPiUjZ3+kD0KmvI3j5Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735779; c=relaxed/simple;
	bh=lzmMnT4NdNcicG6mXO90PvIXr6jc+tdt53lqrg4E8qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gP38S4X1AZMQav5soK9TQ0cUXk+ifeTV+UFehFDJDIeOZJ+DHh+bTptxBd1JmEWJy0HabeM1LMhQPj+zu/AUonuQcUNeLP9Zz1MjX8nX+vNtwCOWc2qLH1DV1fQp9PgC3qSeH8HYW4JSFkOqY58o++UENngjP4QQZX+caysRYGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nEP2luiP; arc=fail smtp.client-ip=40.107.243.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nEP2luiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vQkDKB45R7zQ6H5QYT+GUXn78F7fgraWsswx5hvFBYNEXm+/civXWt88NAPlw3YAkwb8kcuBnto+w9E5feqjsA0UFWiIqBZK4NLVecgAkijAoPdg51r0hXpaI2xarZBSl6Ho4JhpQG3e9zLWxVetPC+wLj5UJ2e6la5A7jxrfmygRk2R1LIX5+GGZAUzq0bnGogOlFmvyKBWrl5xCCXqM9iAI4CJXO1nkv/kgoJ95aIFNqzD+1G2kQ+zJvDbIIKafstBxXWiEo2Un4OOw3pWXE9E78vgJ9RUDRVCFwpfBRYKw37vYuw3K0hkLmEFwa1aTVWaZ/I5UlSbZg+JN5Nnzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+tFCbZ+RplVLT5O0MVLvjkunh8PfChUONfKzqVRLAE=;
 b=xCRzAV/gXjhZSCBgOeMPqyZdFppYz+gHq9tHUN+VVfghUNaGZTzeKbSnWTGj8k6x+spaDbifim0xm2iD3i5WGkeKj+/qdQeYvLkuN2wkCk80m4Gv7sYo69e8jfJJw4V/apOkmmnYrosZFjt6DEkBuQsjoAbOCSvLqzQXXSLVqCdGpfHklJN0qqRiHueOu5ga9Ycvy8d3FZNZIeoCviYvryK9i4v6oK5swFUs7ONwH/clIYJj9CkCdcGg6Z75N9Mx1QldozLdu3d9W4bPBmfFPmwvhQ1EKA4R2HFV9BYMhrKC4+7o1LYNbv+H72FSOLrgp9H+TTo41MPnkpRMHmcveg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+tFCbZ+RplVLT5O0MVLvjkunh8PfChUONfKzqVRLAE=;
 b=nEP2luiPGoWEPTC6z60w7tyY5ZjcFzEexoZxEBsR+9CJ0rDmuiLrcNgklDvFVp2nzQGjPaYONYVMuh8RHSzsRVkDVGSSoRph8CTmFM79AMKEZgfo9wiBpOISVcMGVBdJXYcyKaiWy2tfpa/4++BZ/TAbW0H8xujdhiK1bvzl+w+3lt07s1VfxkXmmQjZeO+C/qEFgutlU+ccxDKCov9nWX2rDOrcdPPcj0pliOuZfnOIYh8BC5bKazoUywTefKuFd8hQpk20Gq+uqgVi/+y5V3/WHYCUE1g7UU0k0zj6ktBv8ys4ly4klamSTtfaVeGkqPRDbBigTE37ojWrS/HZPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DS5PPF884E1ABEC.namprd12.prod.outlook.com (2603:10b6:f:fc00::658) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 20:22:46 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 20:22:46 +0000
From: Zi Yan <ziy@nvidia.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang <richardycc@google.com>,
 linux-kernel@vger.kernel.org, Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v3 1/4] mm/page_isolation: make page isolation a
 standalone bit.
Date: Thu, 08 May 2025 16:22:43 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <50BB00FF-746E-4623-8F48-F74209EDBD0A@nvidia.com>
In-Reply-To: <20250507211059.2211628-2-ziy@nvidia.com>
References: <20250507211059.2211628-1-ziy@nvidia.com>
 <20250507211059.2211628-2-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN1PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:408:e0::33) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DS5PPF884E1ABEC:EE_
X-MS-Office365-Filtering-Correlation-Id: c58efc62-9bba-4ec6-c9f5-08dd8e6e1867
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V2dGT2pvK053V0xHeDRGaU1MZitRTTdKMStWcTM2aFd2c1RHcGhOVEFHM3Nh?=
 =?utf-8?B?QUxKQTNYeFNudTY1cDB5Y0p4bEdXZ2VsaTFuc2x5TTJPeGZWK2R0TmE5Nng4?=
 =?utf-8?B?bmVJY3BDM1lnNXRtYlBzeGc1RVVjOHcyQTRvMEhJSUFMUFloR0FlTndZNVkx?=
 =?utf-8?B?eklBOHJ4N2lZangxNGR5MWlQNFRuazhEZ2lHUTNlSG9SSVVJU1QrYTZoSTZQ?=
 =?utf-8?B?TGlNOEJEMFJnT2FQQmFZTVFLKzR5Um8vcWhwUExCVnhCd3U1RWpqd3JjVGtt?=
 =?utf-8?B?Lzl6NU1zTjNhL29BSTNMdGtoUU1qVGkxZ3FlZmZ6VC90N1p3dCt2MmV6SUhV?=
 =?utf-8?B?aE1wQWNPRWxwcys0b1BSeG0zWWNJZ0FVVjhzUldqdkI2RnpwOWZ5VlNHd2xM?=
 =?utf-8?B?VzhPQXEwT2ZVeVV0aHJSSmlhT1E3R0E1dU44b1dkbXpZTGJjaXFTbVIyYjBY?=
 =?utf-8?B?YlJyNUszejFTY1dBR1ZvcXlISXduVDRRR1dxYmwvc1hoTVFZa0hGc3MrdE5K?=
 =?utf-8?B?Zk5EYmFrODBXMEp5THNPSVk0b3lmNUJPd0pwS1BkSCtRSHRwUFRmSzNNRHJJ?=
 =?utf-8?B?Y0JuUDNNYmFyZGZFWi9mZFBaTWNNZHhCT0dUdXpRWmdrRExXT081RUJuSEN1?=
 =?utf-8?B?WVZIWlZXQkFjZXd3NUFGb1UxZWYwUytJVDRRK2FydExyRTRxQlZ1b1lLRlF2?=
 =?utf-8?B?SGd1TGhlV3pkWHM4aUxReUg2YVdabHNWZ21lU2xNQTJUUVJYNmozdWd5Rmpt?=
 =?utf-8?B?bWJtRDQ5SUUzbG42TWJGT2NNUXJLa2dIWFRrN1RERkJJZmFhcGpMYkRJd0My?=
 =?utf-8?B?aDU3KzJTSE8ybzY0SDFCNXJYakpqZ1dCMzRqeXNHclQvc2ZhS2xZWHhPY0FH?=
 =?utf-8?B?dFFmWk45V09OWndjOXhZUC9ZWVExb0pONFFGL2JWT1gwcjk1WkJqMHhBYXZT?=
 =?utf-8?B?MVp4YnNWdDR6aHpDdXNLdUNadlMwWmduL3RnNTZ5cEhzVUxQY2pSblBtUHVy?=
 =?utf-8?B?NG9lTXZnNGIvaHBvUlNJbmRvY0tnbTU0Tk9jWDlZR3haV0Zzb3c4QUlBUTBR?=
 =?utf-8?B?YXIrQ3hLMXZ3cXRSMFZRYklmL09EdnUvVWs2NUtwK3J3U1pnOXhMMUlid0wy?=
 =?utf-8?B?aW83R2JuajZISWVPNFowaFA5SDIrc2hMc0tEbXJ1OWJvN3lGOUo5VTNUWkdx?=
 =?utf-8?B?RnZoc1llR2ZHeDMwUkRsV3lwY3hDRGEvTGJmUW1aMUxLanJZTFJiOExCcUtG?=
 =?utf-8?B?YWdtUkdJU0pHbWNMRHJUdWZBcXo2aG52WEcvWmtnRzZ1cnJEa1dTbUIvNG52?=
 =?utf-8?B?czBtSXowWFI2dlR5UDBGbmdyRGcxcUxTazNBVEl1enhJZGM3UityaVRGeEtS?=
 =?utf-8?B?dnFmZkRzYXRLUGJmTVRxOFNiTHBGOWlMaGJHOU9HMnI5bVZ3VXQ1VzQreHR4?=
 =?utf-8?B?Mk9WSlFPSXNneDEvV0VzVm5VSStCditCb3ZrVEoxcGsvcmR0NndGQ0cyS2ty?=
 =?utf-8?B?T001MDR6bU1RYkdGV25GUkxDb29wSlpQSG9WMzRyc3FKSWNEZ2gzQkNzZzg5?=
 =?utf-8?B?U0ZibWNPdDVHdXNKbzZjSXkwYy8zWTdySUNQSTNianlyVzYyc3VVbi9nOTJ6?=
 =?utf-8?B?Si83ZU56RHF4cFRoTzVHMkVQMVZ6aUV0QlBTblYrcDd1aDQzYTJ6WmFxK3lx?=
 =?utf-8?B?eGtZZkN1bzlkemJNbHkvRC9iZlowRjZRbjRkTnZsZHpQMC9mWUcyRHFqU2Jh?=
 =?utf-8?B?UlBZenJWK2RkZDBnMTVXR3F3ODMvOWtTNWh2cWpVbVFML09hRkpXc2FqYXBY?=
 =?utf-8?B?cWdkbThCZy9UTUdLaG1oNVE2SjlDWjM4anN5d21xS1lHS0o1Zk52aGxTSDBX?=
 =?utf-8?B?QVRKNzlVekY1aElIYXgwVUE2cHQrc0VZcjN3UHVUZTd6T0YvdzIyZ210V2cz?=
 =?utf-8?Q?R5fuuIRjCn8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UElaU3F3eWRrSVhXZUlKWWJ5TUYwdEFsK1JDTUdiR0xPSnZUZDNoUUMvWWF2?=
 =?utf-8?B?NlFXVjF0NWpDZXFGbXVoNFRWK2VnN2VuVys5RlJLUFowb0pPQkhUYURJVGR0?=
 =?utf-8?B?bmpldXl2MDNTQmZRR3ZRTS9xcDhnQ09PM2FLZk1iYlNPelJYZXYrTjBmM1hQ?=
 =?utf-8?B?MlVRdGkxdis5S00vQy90RHFqcGhGaDd5cHNvWU4xUXlrUUtnMXZIa285c3g1?=
 =?utf-8?B?YVNRbit3VHdKOCtNdVJhMm9Qbm5oRlg3NktDQWZmb3ROZm9NNWZnazMwOXZm?=
 =?utf-8?B?emZQN09vUVNYQXpDQVJTV0Qrem1HWTYrV09EQWNrZVJvclI2d1p6TkRPOXVE?=
 =?utf-8?B?TC9CdVFkb2JLZThOVU5JRTZJMHJnZlVvUnRqSW1aYzlSQzFaR0VJOVBmVDJL?=
 =?utf-8?B?ZExMWFBNSldVVVp4NmhlUklsTDI4VlJBSG9WbW85YTNjTFd3RVAvTkZlS01M?=
 =?utf-8?B?TDc1Y0J1RHhVa203OUVjYU45U0tOcmVzOFBHalN3aE9mMms4R0JYbWlSTVJy?=
 =?utf-8?B?aGxJT1c0VmRLaWRGL2Y4M21xVUgvWVhLZFhLQVZneXhlRG54L2IyUVllcmZR?=
 =?utf-8?B?bGw5OUllelNQVUJISUJic2ZQd3RPRUFuQTByTXM1a3B5ZTcydzEzcnJmQUtt?=
 =?utf-8?B?c2ROcUhiV2VjM20vTjZhbHlJWEFKR09Zbng1cjhTWnpsdXQ1T25rRkl2S0Iy?=
 =?utf-8?B?clZISlJQbGovaDk1RmRsZzBKVnBWNkdFU0h6NWN0b2tnTURQREhLcDFmMk9Y?=
 =?utf-8?B?ajVpRE4xZVRPVWlWa2pwRnlUYkxqNmJsQXE5TGN2eDhNamd4MzhpUXNIckVu?=
 =?utf-8?B?R2w1TVRXMHExQ3d0L0UzTlVDQ2g3S2JTWXVVNWZzWGpTa1RaOGk4cTZSZ1lW?=
 =?utf-8?B?VVVsU2lXZTlWU29rNmZNcVM2UkRJYmIzOC9WY2hiM1cyR1RkdkhMTndUenNT?=
 =?utf-8?B?ZW9pV2E3V2JCSUlteVpBNVhscWsxaEpzYVZaWmFDd25QeDhyU3FzRUcrRUt1?=
 =?utf-8?B?bWZFVnBML1RCUmZmeVVIdWpNaUdvV08xOFh6WDFBK0lMdXNZQ0tBUVFxZEd4?=
 =?utf-8?B?aE5NQXVNd01kdkdwYU1lRTYrdjhLSWZiUnB0dWlrTDhjSXZTZktHWlJiVm5O?=
 =?utf-8?B?bDR0WXdYOUhUNm9OUElWRHNpVXhOWHNtOHh3OVZKSkt2bXEwTzdyc1JFUmZV?=
 =?utf-8?B?S0g4RjdabVBsQVE4SEZnZW9YczhlWDI0aDBKZkNRb05UNjNPZ0hLRTlVSXVD?=
 =?utf-8?B?dlpCaWdzM0Y0aUJMbU5aZENBQ0JvYllFdDdLc3ZNVDJDM3BZeEk0cU42U0U1?=
 =?utf-8?B?NWJ2dnVOTVZ0ZnlUdjBWL0c0MEJCVFppQ0N0U3RJb2U0VVpMS0pUeFJIbkpq?=
 =?utf-8?B?Vlo0N05sdkpCN25Fb21tRUtENStEYlFUNjEvYW96Z2srVzM5MER6ZkV6dWdp?=
 =?utf-8?B?QVBkcWFBcUxzTm5pSWxNRjBsdjdnb3pZYThxSjlCQXJRd0hGYWFHb1FiR3NE?=
 =?utf-8?B?S2Z1MzBxVGJzYVFJRXRXSVB2WnpzZm1XOGpKaXpVbXdlZmpBOXRNdjNDYTZO?=
 =?utf-8?B?WU1Ta2g3Y3VxU1ltQngwbHRRYWJSRVNLMEJwc0Fna0k0UnJmcTdXUVNEWHJk?=
 =?utf-8?B?YjMyd3VNKzNjZ1JOS1dhMm4yMHdmZ3pTVzEreU5IS2hQRk8xWStMa1g0QjhV?=
 =?utf-8?B?cUwzRUNRYWVSRlc1Mm5vMW81TWw1cWpJcXphSkd3eU5HUXoyRlJndlpoc2lS?=
 =?utf-8?B?bW1SSXp0ejhOeXRZZGhPS3grU0FBN0tUWEVnb3UyV2xOOFpCazNmZXVHUldt?=
 =?utf-8?B?aEFIK011dDNiOGpnSFFycTR0SjRnbkhDRzdBZDRqREhzU0REL0Y4OUR1c250?=
 =?utf-8?B?VEIrVHpsUlJRSk1EendoaHpYRmhJbzN2TXZBWllzS0dpQVdIckNYQld0bzZr?=
 =?utf-8?B?T3RCNGhlOFI4Uk8xYWkwM2VWckVRczVtWkVPOW1kLzgranJDSUwyRUplWHlY?=
 =?utf-8?B?Z3ExS2ZWV1l1b1ZUVHNrSTVzYlJhTDVJT1NKVmhpcWZBR05xUHhpNFFPS3JE?=
 =?utf-8?B?S095VFF2OWFSV3N0QjJLU1FGeE1NZTlhUCtCMmdLcWdReFNOZmszRUpFQ3Nm?=
 =?utf-8?Q?SwMNAHki6XLLBnHdggtUasC7q?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58efc62-9bba-4ec6-c9f5-08dd8e6e1867
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 20:22:46.4695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di5JFl6A4OwrFa+E3KQyoBcB3WWzhGTiSoM3JoR8ChoOIiPQZdFcbZ3rvDnpJR2/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF884E1ABEC

On 7 May 2025, at 17:10, Zi Yan wrote:

> During page isolation, the original migratetype is overwritten, since
> MIGRATE_* are enums and stored in pageblock bitmaps. Change
> MIGRATE_ISOLATE to be stored a standalone bit, PB_migrate_isolate, like
> PB_migrate_skip, so that migratetype is not lost during pageblock
> isolation. pageblock bits needs to be word aligned, so expand
> the number of pageblock bits from 4 to 8 and make PB_migrate_isolate bit =
7.
>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h          | 17 ++++++++++----
>  include/linux/page-isolation.h  |  2 +-
>  include/linux/pageblock-flags.h | 33 +++++++++++++++++++++++++-
>  mm/page_alloc.c                 | 41 ++++++++++++++++++++++++++++++++-
>  4 files changed, 86 insertions(+), 7 deletions(-)
>

Here is the fixup 1/3 to address Johannes=E2=80=99 comments.

From 7eb1d9fa58fdab216862436181e5d2baf2958c54 Mon Sep 17 00:00:00 2001
From: Zi Yan <ziy@nvidia.com>
Date: Thu, 8 May 2025 12:05:59 -0400
Subject: [PATCH] fixup for mm/page_isolation: make page isolation a standal=
one
 bit

1. keep the original is_migrate_isolate_page()
2. move {get,set,clear}_pageblock_isolate() to mm/page_isolation.c
3. use a single version for get_pageblock_migratetype() and
   get_pfnblock_migratetype().

Signed-off-by: Zi Yan <ziy@nvidia.com>
---
 include/linux/mmzone.h          |  6 ------
 include/linux/page-isolation.h  |  2 +-
 include/linux/pageblock-flags.h | 24 ------------------------
 mm/page_alloc.c                 | 25 ++++++++++---------------
 mm/page_isolation.c             | 17 +++++++++++++++++
 5 files changed, 28 insertions(+), 46 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index 9ec022a0b826..7ef01fe148ce 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -112,13 +112,7 @@ extern int page_group_by_mobility_disabled;
 #define MIGRATETYPE_MASK (BIT(PB_migratetype_bits) - 1)
 #endif

-#ifdef CONFIG_MEMORY_ISOLATION
 unsigned long get_pageblock_migratetype(const struct page *page);
-#else
-#define get_pageblock_migratetype(page)					\
-	get_pfnblock_flags_mask(page, page_to_pfn(page), MIGRATETYPE_MASK)
-
-#endif

 #define folio_migratetype(folio)					\
 	get_pageblock_migratetype(&folio->page)
diff --git a/include/linux/page-isolation.h b/include/linux/page-isolation.=
h
index 51797dc39cbc..898bb788243b 100644
--- a/include/linux/page-isolation.h
+++ b/include/linux/page-isolation.h
@@ -5,7 +5,7 @@
 #ifdef CONFIG_MEMORY_ISOLATION
 static inline bool is_migrate_isolate_page(struct page *page)
 {
-	return get_pageblock_isolate(page);
+	return get_pageblock_migratetype(page) =3D=3D MIGRATE_ISOLATE;
 }
 static inline bool is_migrate_isolate(int migratetype)
 {
diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flag=
s.h
index 9fadae5892b2..00040e7df8c8 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -112,28 +112,4 @@ static inline void set_pageblock_skip(struct page *pag=
e)
 }
 #endif /* CONFIG_COMPACTION */

-#ifdef CONFIG_MEMORY_ISOLATION
-#define get_pageblock_isolate(page) \
-	get_pfnblock_flags_mask(page, page_to_pfn(page),	\
-			PB_migrate_isolate_bit)
-#define clear_pageblock_isolate(page) \
-	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),	\
-			PB_migrate_isolate_bit)
-#define set_pageblock_isolate(page) \
-	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,	\
-			page_to_pfn(page),			\
-			PB_migrate_isolate_bit)
-#else
-static inline bool get_pageblock_isolate(struct page *page)
-{
-	return false;
-}
-static inline void clear_pageblock_isolate(struct page *page)
-{
-}
-static inline void set_pageblock_isolate(struct page *page)
-{
-}
-#endif /* CONFIG_MEMORY_ISOLATION */
-
 #endif	/* PAGEBLOCK_FLAGS_H */
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index acf68ef041d8..04e301fb4879 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -381,16 +381,16 @@ unsigned long get_pfnblock_flags_mask(const struct pa=
ge *page,
 	return (word >> bitidx) & mask;
 }

-#ifdef CONFIG_MEMORY_ISOLATION
 unsigned long get_pageblock_migratetype(const struct page *page)
 {
 	unsigned long flags;

 	flags =3D get_pfnblock_flags_mask(page, page_to_pfn(page),
 			MIGRATETYPE_MASK);
+#ifdef CONFIG_MEMORY_ISOLATION
 	if (flags & PB_migrate_isolate_bit)
 		return MIGRATE_ISOLATE;
-
+#endif
 	return flags;
 }

@@ -401,19 +401,12 @@ static __always_inline int get_pfnblock_migratetype(c=
onst struct page *page,

 	flags =3D get_pfnblock_flags_mask(page, pfn,
 			MIGRATETYPE_MASK);
+#ifdef CONFIG_MEMORY_ISOLATION
 	if (flags & PB_migrate_isolate_bit)
 		return MIGRATE_ISOLATE;
-
+#endif
 	return flags;
 }
-#else
-static __always_inline int get_pfnblock_migratetype(const struct page *pag=
e,
-					unsigned long pfn)
-{
-	return get_pfnblock_flags_mask(page, pfn, MIGRATETYPE_MASK);
-}
-
-#endif

 /**
  * set_pfnblock_flags_mask - Set the requested group of flags for a pagebl=
ock_nr_pages block of pages
@@ -461,11 +454,13 @@ void set_pageblock_migratetype(struct page *page, int=
 migratetype)
 		migratetype =3D MIGRATE_UNMOVABLE;

 #ifdef CONFIG_MEMORY_ISOLATION
-	if (migratetype =3D=3D MIGRATE_ISOLATE)
-		set_pageblock_isolate(page);
-	else
+	if (migratetype =3D=3D MIGRATE_ISOLATE) {
+		set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
+				page_to_pfn(page), PB_migrate_isolate_bit);
+		return;
+	}
 #endif
-		set_pfnblock_flags_mask(page, (unsigned long)migratetype,
+	set_pfnblock_flags_mask(page, (unsigned long)migratetype,
 				page_to_pfn(page), MIGRATETYPE_MASK);
 }

diff --git a/mm/page_isolation.c b/mm/page_isolation.c
index b2fc5266e3d2..b6a62132e20e 100644
--- a/mm/page_isolation.c
+++ b/mm/page_isolation.c
@@ -15,6 +15,23 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/page_isolation.h>

+static inline bool get_pageblock_isolate(struct page *page)
+{
+	return get_pfnblock_flags_mask(page, page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
+static inline void clear_pageblock_isolate(struct page *page)
+{
+	set_pfnblock_flags_mask(page, 0, page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
+static inline void set_pageblock_isolate(struct page *page)
+{
+	set_pfnblock_flags_mask(page, PB_migrate_isolate_bit,
+			page_to_pfn(page),
+			PB_migrate_isolate_bit);
+}
+
 /*
  * This function checks whether the range [start_pfn, end_pfn) includes
  * unmovable pages or not. The range must fall into a single pageblock and
--=20
2.47.2



Best Regards,
Yan, Zi
