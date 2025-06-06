Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D551E5B88
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 17:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749232670; cv=fail; b=ceRJmRAKRVbIOCj/siQj4gM04CR2bMspDO0RhvYMGpZtAWeiFYJnf9CEvNvLsRSVU6fiE32Wp9WXey59PHJkjy4VbYTtgGosVSgl2ShmAbi5gJzcNoAPiahHvgreZkuho0OIwaysy9ulvGNuFkCyFEll86EQMk5iZvoe9yzSQl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749232670; c=relaxed/simple;
	bh=OezR0aMqaExf41idnNJlvzGUXUJYIWu+lIBEU1GSbZo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jLnvH1c9b1LRY2+p1n5kHSm9QwtlcVYG2b6qArBHr/9xXJ1+Oh1d8ijFiKK0SxdPrIsRS2n+dwVF0uGbUWHYx8AoZJgncetCYpHicWTAqfW4NfrZp0kAwqghyVG9wu8x9pLXl8p5W11y1WdVcEZO/oHx0GSEiR67MOAclR1w++A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NTYnGcJ3; arc=fail smtp.client-ip=40.107.101.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NTYnGcJ3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZtAMiZmYTahty9EHqJoMx7mj0sfRAubuabPtLgQ5A7/qs0YVwYng409/hqolAdr3w15RH+E8us9zMfJl411TIIl0L3OCRJL1Lj5JhbZ5Q++zCYewsU1MrwrQs2387YvdIoF3jaLNPJPl9BOWypQV5n/MV3pD9FNN3o6eB1GqR6BVaZwUGD/4AZBvW+5gAITpGUr8ZkcoI/kUofxNYYsoehTMl+93dIGW8rbiRLHe7mcNWt0G9sR6vLirk/2vaSnjIRYdzKTzFoEzHfx5meUsUk8F/+o6qaNTgxmhFtKlg0XJgG1vDZLFgtpEmBP5bN9zRzGL5d6PcyKbufzIeIf3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuLAdqnQ0cJXUULnq8wevZEw68SjAfueG6iotdCoH/s=;
 b=W85v10pqPDEocGhaKy8PT9GbVsDSBs88xMROSQoviAk10VdEGeZw9xldLTbxHikw4xuWRfeFYKm8PErOf73PO3EmRLpjk3yPSRYsu5q7lZPCc6zhAI/M0pMnX/x/ZXfvq7mNB4aoF9KyrbCo0u/xJzynFP59U1+vMcF9OGKYEDXQYCPe/1KEC961HZYidTi3gai0dAWLQU99gbjrzqoJ+h+5Qeu9TSkQ8HHukt+wFtKMs5SFTNGJgrE7VxWVVkNUbYNMPOkFEYL727xvbC51ppNkf4WW987iaQ6eqhdBXGqVLkeUBo7m0sqkwuv33fl3BJoLOEAov/FRaYSZbNE1Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuLAdqnQ0cJXUULnq8wevZEw68SjAfueG6iotdCoH/s=;
 b=NTYnGcJ3VFRk93PHeZ6+6bH6/cD4eb/OxrpvB9rsyrb9sJRwWkH527w4XQFZt4tLxwkjiX8GR1qpfkHLkAyP/QjIqvRUU5w3y8YEpU9S1c0i6FuZzXAx76C4bF+5QNgK+6dZviBzsz2adNKjSFdQkgthaxYZVQl0DaVEgXLNKvq9aBKJt7b/vuWx/MrsTHKKFIiIe30YUBJ/gAP2G/1GHW4OUgQwXXFBWsgc5eIx0AGvO2D+hwiokD2mSZxLy11VyhJjUu2PEu4twLJN1A2N3AV44nB8yMsmwZbI75JMTi5GY3X5HMsXu6QHAyUumCJbJjaZTn1RoVmmo3Wl7O2dDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by BL3PR12MB6449.namprd12.prod.outlook.com (2603:10b6:208:3b8::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Fri, 6 Jun
 2025 17:57:46 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 17:57:46 +0000
Message-ID: <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
Date: Fri, 6 Jun 2025 10:57:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0050.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::25) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|BL3PR12MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 3de083e0-bea5-41e5-e554-08dda523a4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEl6RkhrTHoyNEV2eVRISm9FV0psMEdXcldIb2R0Rk4yZTJLRDNqS0xuNE9L?=
 =?utf-8?B?am9ZVkIvZkNTaW9NUDZ1eG5QZ1Q3SlFhYmdRaGxpeFVocW00U2E0aHMycGFh?=
 =?utf-8?B?N3RROHVmeFU2QjRjaDEvbHptV2lkYmliTVlvcWl0NlJjdmhjUWx3WlRGY2kz?=
 =?utf-8?B?SU50Q1VibmVNMGxveEVVU2V2VGdGNFBndXRzNloya1FHYyt2UXo4eXI5Y1Br?=
 =?utf-8?B?eld1akl6R254R0lnYnNPWTNOcE9pb2I3d00xZ1NQQ296b3pQclkrUEtaaDlO?=
 =?utf-8?B?SWUvWE9iL0tHV0REMk9LMjE5OWhhMnJZM0lwbEhJOGFrSVN6ckl6NW1oUVBB?=
 =?utf-8?B?N2FGRGM2N3QxMkpicFVsUGI0M2gvNGRhNUg3bmhoaVcvY2d1MDZiYjZBTGV3?=
 =?utf-8?B?V25aUjR5ZGpQbHFpa21jcXFxbjBaQitYWTVBWExLbWV2QnFyTVA1N0dPZ0pQ?=
 =?utf-8?B?NWE0WXVRYXZKbHorVjV6S1pkOGtodE0xOWM5MzE2VnVWa3pRck4yUkM1UGg5?=
 =?utf-8?B?TXEyZ2FQVzNZeFlWR283ejBhZGhWaUMzRHBraDZhdHpxVWJFMWtzNG12Z1Uz?=
 =?utf-8?B?NDF3Q1Vpb1pXenlLbVg1Y3VUM2NUSUVrVkVoSU5sWUFaL3FiSHl6NkxWMjVq?=
 =?utf-8?B?NmsxMW5WM1NYQlJod0tvclVTYTN0K3VrN0tRTEV3cUgwRGswRVVZL3hoRDRG?=
 =?utf-8?B?TEh6Y1NqakY4bUNHMGpHTy91MVJaNWVsc09CQms4OEdIT2VFYmRGcWRGcVdQ?=
 =?utf-8?B?WTc4ci9LdkRHeU8yNVVPUnVRU0tmN3JuTDFnc3RaMDljc2dmVjBxZWdqMHF4?=
 =?utf-8?B?ZVNmYWFURFJtQmFrcnE1N3lDeEprREJ5ZmdTeTJZNW1idDk4TFZzNCtmeko2?=
 =?utf-8?B?OWJwRnVYQlF2YXdYai9FZ0xoU0t2T3c3MytnRzY2b2phL0lybmlPRnBydjdE?=
 =?utf-8?B?bmhBTDJ3VkFuRlltTURkRXhGTk5pWlhnRTM0VGtJUmI0YTFDM3BFTHV2NzIx?=
 =?utf-8?B?SnkvZVVDUjhBVGpISGdLSVAwdDEvaW81c1RPc2o4QnIvUndnaDdObjZEUm95?=
 =?utf-8?B?dEIrSDhpZXcrSmV5L1IveDIzdExNcm5xdElsRVBJTXVEOENZekR3TmR2cXpC?=
 =?utf-8?B?c2JaODd5TU9oYkI2anJDanlNdHlETHpMNFpZTk5NaERKWk1lS0pJVHphRWVS?=
 =?utf-8?B?Wml0ZWFBVDBwZzNydnpVdHVaYU9BcGZmRWhoNEtxcUlsOUxqVW9OQzR4eTRE?=
 =?utf-8?B?VzVVZDNmZy9sbi9BK1RoZ3c1NFA5TmZFbVdjalV5b05mTnNkZENPZmZXTXBz?=
 =?utf-8?B?djdZOWVJZEZuREJoVFF1R3FMVVNhc09tUklRUm5wNU02VjZSTnEwdHlHUUFk?=
 =?utf-8?B?TGtZdHJkZHBxWkZXQklDRGNaamJ3cXhtWWs5TS9WdnkxR09OUWh4OTJZZkY3?=
 =?utf-8?B?ZDVJeEJORTJFb3RPd29tV1h2ZTluQjZGM1ZodWlzNzVpVEZBbEtHVm5PU0oz?=
 =?utf-8?B?QnBBUWkwbmxtVHVMOGtKam91M0JCWTF0ZktMbXNsRnVmMGhTOVMxTzRmUUR6?=
 =?utf-8?B?WkJuUGlQc1JpWGg0NHBiTjljV2htSUFKYS9mUm02RmkvUU5VNUg5RmJUNjBO?=
 =?utf-8?B?cGdHS1VLd1lxTFpsL3BkSzFSeFQ4Y2dYZ3l3VE5say93MDhTajVZN2Y0RzN0?=
 =?utf-8?B?eUJFMjR1aExVSHc4WnBFKzBrUnB1VllrNW9jYWY2S3lpVUhJS015aUw5WnpH?=
 =?utf-8?B?bm5lVmZZb1dNTlB5VThRT1dkamxVbDBkazZRMGQvWjhPbTFKb2N5aU4yTmNt?=
 =?utf-8?B?VTJDZWN1a0czWTJ1YnphQnhVYmRqb1Rnb2IyalhPdXdEWFlOREtSRGtoeWJV?=
 =?utf-8?B?elNVR0k2VndIYS9YV2JDUnNwMDhsQWU2dEUrTWNPbzYwcnlMbkJjbFNYazJH?=
 =?utf-8?Q?TwDBehyYkl0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3NUVFc2ZXYyOXpzWmRYTzIrRHVMU1dId2k1RXB3b0FVZzMySWwvR2dTN09R?=
 =?utf-8?B?dks4aVlXajF1UDNMWFhJSVRYRmkyTjNhTzQvbWxnRTh4dS9ydExGN3Y1Vys3?=
 =?utf-8?B?QlUyTlRHY3RrcFkzU2RnbTl3VG03c0RLalZVbWN3WTQ1R1ozRTlCZEZ2emtk?=
 =?utf-8?B?NnRGR3lOUzdQb3N4L0I3bGdsdERDQjYvckU5WVFqNnNITkRhWmZQUGlNUEFG?=
 =?utf-8?B?eUJDWkJDZHJkWTVlcXM5cTJwSUJMWWZTT2ZFbDVpalNpUmpiTGh6WXdoVWtO?=
 =?utf-8?B?TjFNSVdWVXRIYmdIK0xVMkU5SFBUemJ1ZGtCVXdlTHRhaUJYOEszUzIvNzFr?=
 =?utf-8?B?c1BnUWk1cDc3cXkzUVJRbHV0MUNDSFhZUk53RDFjLzZtU09FaTNtMlFMSitI?=
 =?utf-8?B?UU04eW9WMndOYUx2V2RmMEp6V3d3NUpKQk1idUVldmF5bm90cW4wd3B1NXAw?=
 =?utf-8?B?bkk1QktaZlowRkZCMnRPMW95alpldjZnUlBiUHExemo5cXYwR3gwUjFnWXpv?=
 =?utf-8?B?dGhCSndwRXVEbGVXREp5Uy9XdHJTN244cFU2MkdINkdHT1hON2VTWi84RGFE?=
 =?utf-8?B?eFF6bUZGU0RQcnVLWWRFSUV2QU8zci9nWTJhNzkzYndYcXlzUFBmVkR1MHVJ?=
 =?utf-8?B?T2x0Z1RFNkN2SmwyM0ZoQTF5LzVxMytFVlBXT0JkRTVmQXVLQ0RPRDNiWXVU?=
 =?utf-8?B?ZjQ2c0xUY3N6SjlQOXBxNnhPTUc4SzlDTjU5WFNxSkJ5NENjQStDNzdueVIr?=
 =?utf-8?B?djJKbVEwWnpQa3I4d0R4MHpGK0wrWXRkanZDWHVhVjBySTlmS2N5L0dheUJ6?=
 =?utf-8?B?b1pmVEFZSTJQR2ZPZmpGVko0TVpaMUlueDBFTkdBSFhYTEU0Y0ZnL2ZxL3FI?=
 =?utf-8?B?M3MvMEpjNGNqSEYwQk5oM1g1bnMyMjd2aXJPa252RWcxbHQyUWROdUlwQmhk?=
 =?utf-8?B?MDFhK0dSK0dQbHVsazlhRzFLMHc5RkdJUkNuMGc5M01sTHFCcyt6V2lsMlAv?=
 =?utf-8?B?R2tDYmNHUEFYbnNDQmxORTRBUDhDU3RwaGI0bnJHa0lxR2F3UmRRYnVsVVJr?=
 =?utf-8?B?Tkc2eUM1YnNPY1R1TUc0R3JUYjVuRitNc2xCc1VCaE5wVWZOOHlQRjBKdzNZ?=
 =?utf-8?B?Ylc0S3ZOUFpjbUI3SVlydEhYNEhrUjJqb3FuRS9VN2pWNFozNFZ1OS9CeVp5?=
 =?utf-8?B?TEYvay9weUgvSnVnVmQyZWV6M096d1dMN3NrR1hqQzUwejZZTUxqVFl1RUNF?=
 =?utf-8?B?WWxwT1lwVEdDN1lsRVFENDNtZzR5RFd2dzRlTDhEc0FLVHdnb3ROTFRPYXpE?=
 =?utf-8?B?VGE0WG9ZRW4zbnlzNlZDODQ5cnl6V3FhRFJ4Mmk1NWQ2VU84MTVhdVB1Qkty?=
 =?utf-8?B?R05uSi9CWGVKY2ZyWmNHbmJITFA4UWk4M0lkN0xGd1hvRmxPTHRta3VleEZp?=
 =?utf-8?B?enpwak9XemdaKzV4VkdjNUdZcGg0bWkwSmVtOEFucHdZMXk5ell4SWt4OW1z?=
 =?utf-8?B?SXFSWkhha05qaUpQNUZhV2svY2p3VGg3YjNyWTNWbkZHNlk0eGRkaEhYcGRK?=
 =?utf-8?B?U3NCRWQ2MklqYnBHSmo1clVpdXNWMVFMSzU0YVN1dWl5UVMvSUs3YklweDBk?=
 =?utf-8?B?V05jSFFiT25qUWd1dWFQN1JkNlZ1QWowSUpqZGVwamd1NXFHSmdqTzFGNGxi?=
 =?utf-8?B?S2lscUc2VVlMVGR3a2ZieGY4MFcvaENmNmhBb1JPVUUyekdxRTNTdnpBc2w3?=
 =?utf-8?B?OG1QMG53V21IR0c2ei84amlzbkcxdVdMZDQ4TmxIdUhxSEh5aWdneXlvS2Vl?=
 =?utf-8?B?dU9ITWR3aW43aHI2Z0tTcDBjMDAwZ0hTQ1JnVkVSQzNvb1E2TU9SS3dZa0JG?=
 =?utf-8?B?Ymo0Vkk1LzZ1WGFVM3hIcUttd3JEblE4UWhDam5sQ1B6Y2h1YnRWV2x5aVdl?=
 =?utf-8?B?QkprbU5vanpkc2hIQkFrMFRJenhQb3QwUlJhOEVyRWVJbmNWM0ZIei9jV3Ft?=
 =?utf-8?B?UVFPaXdrbWI5b3djczlGN3JvVmlwZkRESFpMMkxmdm9VRk9oM2VOYm9PT3Fh?=
 =?utf-8?B?dzdmcDlzNmZSY2ZyNkozZlhGKzFHTFdwaEVhWUxGK3BaV0dXUENQVHpna1Rk?=
 =?utf-8?Q?7j4QpnR0OtW3Z5jaDndMuqlcZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de083e0-bea5-41e5-e554-08dda523a4e9
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:57:46.7405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BVQMoI1uQvH2BfFWovNDRlmkNoBkRhU6wXBuyuIRXRIKi1hMhTnIEuEBLDPJnVqRXMDgJ/x0gNQYKB0H8MChig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6449

On 6/6/25 4:04 AM, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 12:28:28PM +0200, David Hildenbrand wrote:
>> On 06.06.25 12:19, Lorenzo Stoakes wrote:
>>> On Fri, Jun 06, 2025 at 12:13:27PM +0200, Michal Hocko wrote:
>>>> On Fri 06-06-25 11:01:18, David Hildenbrand wrote:
>>>>> On 06.06.25 10:31, Michal Hocko wrote:
>>>> [...]
> So to me the only assessment needed is 'do we want to warn on this or not?'.
> 
> And as you say, really WARN_ON_ONCE() seems appropriate, because nearly always
> we will get flooded with useless information.
> 

As yet another victim of such WARN_ON() floods at times, I've followed
this thread with great interest. And after reflecting on it a bit, I believe
that, surprisingly enough, WARN_ON() is a better replacement for VM_BUG_ON()
than WARN_ON_ONCE(), because:

* The only time you'll be flooded with WARN_ON() messages is when *two*
things happen at once:

    a) Something that used to completely crash the machine (a VM_BUG_ON
       condition) happens, and

    b) You're in a loop and it keeps on happening. Yes, in -mm, that does
       happen a lot (per-page loops, for example), but still.

* It's *so* easy to miss a WARN_ON_ONCE(). We don't want that, not for a
critical failure case that used to be a VM_BUG_ON().


thanks,
-- 
John Hubbard

