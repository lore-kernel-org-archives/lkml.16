Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2049.outbound.protection.outlook.com [40.107.212.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AEE2746A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234715; cv=fail; b=RTnAKsyUmvNyOv+2Ha4sXwYhHAYtUOznuFeCWWh7VFvn/THyL7a25+gdhvkD7MzO7h58kfCwyh9wPREQz8qKyql3pdM4Y7ez8uI9D4ZoyHOC0H0Lxvwd8vkpnCiL0VmSsvhmEmgtgZxMJwMHq5jrKFWrssmg38eojk5wgnUyrGE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234715; c=relaxed/simple;
	bh=LXdATZ7O4iCP91tvZwFhQGv6bx6Pqxepg/8uErFBd0Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f1Lm0VK27vVhmBXys9NdmEe+DuuFSfT7weOyFUH3lwVIruO98/9Z3hk+bZ+9r0AmWbR6W2GpZpkyka+uTXH35ycnfb5T4FN6gdwmUsSyvGPzQ/k6oFWkEt2fn345V8VMKmV8AKKQKuDbjhH9FcHxL6802usHItxqErDaGUfKwkY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Xrqwibk7; arc=fail smtp.client-ip=40.107.212.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Xrqwibk7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ek81Ohk9TB+p48n4/JQwtd9a/mnpouqlX4TD3MmvPjrpwuj3Y2LeBwpXK0YFSVPdskOXRdCrpXnSPTfHEcoqbW5utuydNFQkIPoeqrGqln6ju8DQi15LUqNW6sgou3K2DkMuPsM9a6IJr4unFbUDHbBypoCUgM0RqjJACE72wXw5eYEbd3jgS9XdbZPee0zjKeSP6mmqm5HYxU+iNuh5+1aDegt5x/wlGocwfMuG8tTXct0pOwtrUMy9o8HqRzI2WPajbnxyHKY/fJKKxIgyxMdyM2yYjY5ouA7x6VnwhhlZ//RkcRVzvfsofN/ttLdwHqAcjFwpG6A0sTe+3xwejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bG1D+uMGlEskZWeTXZpPGrwn1715+OsT7l0YojdTq0A=;
 b=O2btjjua5ngP0aaAAErXhHFasFN/2EM19J+Ut6tjDPigotX6yPD78nsUwTHzIzwgM42rtAMgbO+CJIkeBMDFe/QJKwa8kL1S6/gCpGIXK19blj48BzhiGtv2gK5x61gu4E4dqN2N0uurJOatXKjgNJJSuNtv2hvAP+pOFJKaGzgdfV5+k7JpLxNmnyUMHfCS5gWswdOaGvJDO3b0WEjCPGZfJ8Zs0lhRYqfauxNT8Yn8u34Ivy5hDnP9mabzi4Q9kNA9X4C1PWMj8yp5FsmSG/hPo0+9JQ1XOgxhCx9nejF1AU+sPAbLjkuKE6IrIGNP9tiKlUOWTdht758MIjXoMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bG1D+uMGlEskZWeTXZpPGrwn1715+OsT7l0YojdTq0A=;
 b=Xrqwibk7diFweeCeP+cXxaPYlW/muQVZ0Vy04oFryCBkquItXzbG3zRlls3ZvCqaaXAdaqfn1ZLccDYx85Kfqi9EPtiNFHrrd/8+CPeoYJzIPDhDWrdUMYL0m+I02wbj5vyH4ZrwWwMUPifhbUJeMEfwIZE5uOvjJeVzZLCdtTTBGCE6a/hrw7O7RMC5HwHgZAw2iHelmpgcgN4p6vagNve+OYBvPebgmYoJZW5gYUTLn4OmG1/qYXOHTa19MLRpvtLnUqlvUYSHIn9u1XdHKUENALBqiAZ/SRBIRav+vmLzeHwSx4wSLc2Dsmfs+/d/SbLnz2dHFYLwDdwYMjr6AA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by DM3PR12MB9350.namprd12.prod.outlook.com (2603:10b6:8:1ae::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Fri, 6 Jun
 2025 18:31:47 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 18:31:47 +0000
Message-ID: <5d0d0542-5994-49e1-820a-02fd7e7551c5@nvidia.com>
Date: Fri, 6 Jun 2025 11:31:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 <e898e52e-a223-4567-9514-b4a021b5d460@nvidia.com>
 <72bb36f2-65b6-4785-af9d-5b1f8126fc78@lucifer.local>
 <2f866f12-2aa0-4456-b215-08ddc9b13b1e@redhat.com>
 <3dfbbd63-697d-42aa-8906-539d74df9123@nvidia.com>
 <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <44af8f5a-2d94-498b-a3e0-31f5dde74538@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0146.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::31) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|DM3PR12MB9350:EE_
X-MS-Office365-Filtering-Correlation-Id: 5052663f-e030-4359-f0af-08dda5286567
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmQ4V0ZWZXN5KzQ2VmdLaGFKZ2h2Y25RTldtaUhncVh5RnAxT1Bna0RxbmxZ?=
 =?utf-8?B?TmVVejhFMkpoSFpCN2w4Wk9VVjN0eG10b3FBNFZRQkk3U1V3NU9ud0VvejZO?=
 =?utf-8?B?R1ZQUXhWTFh1bHF3c0gzT29iTU9IaFcwLzF0QytrWXNCd0Yxd1pQOTJ6Q2NB?=
 =?utf-8?B?YVRSbk13ZnozNTNxVVpyRDZhT2NDQlpDeEdEMXFnUmc3c1JyY0VxSDZTS2tq?=
 =?utf-8?B?SnFuYWpINHQzOEphdlEzdnBTelVTdG5zUngwOGR6OGw2REVMZS9MWVQ4YXdC?=
 =?utf-8?B?V0Z6RUNXMWxQVHBNN3VoeldRZ0QvTDFOejZWVFppeDBNZENwNXlLM1NIMzZq?=
 =?utf-8?B?R25kalNSdU5TRm8yeHFSeFBtUVRjaHcvZmxLeE9XSHpWZ2NaMG12RkR1WjUz?=
 =?utf-8?B?VlRMWml0NVFkWWJHNzZ6bmZKM3FTMHVzUGx0ZkdNcG9nUk1WR243QUYzUVg4?=
 =?utf-8?B?cVlKRlhnOWNDekZVLyttck1rQjFpbGFQV21tOTZsd2c0YXRnWmV4ZGxCTlFP?=
 =?utf-8?B?ZXc2bERORStOUTFpS3FHbjdicTFpK1ZobXIyOFhZdkhJY1k4YS9OVHg5UjJt?=
 =?utf-8?B?S204ZHNXVWFSQUcrQ1Q5YXBMK2wwdnpxZVRJUmoxa0hYamp1R01oVHkzRS8v?=
 =?utf-8?B?VnQ2OTh4ZTZuQUxLSTBacjVnNjFIcFhjZU05Ny9MRVVhTWQ4YlB2RmRXNzZ1?=
 =?utf-8?B?WHF6MVlCa0V3Z01jQzRmR2dxYmcyK2pna3h2WU1WKzN3WmdweG8xVzlYdVBC?=
 =?utf-8?B?L215TWhYRnNhUTBqd2Rjb3FMT2tQZ0hZRVRJVFFGOGdwc0VwenZ4eDMwek5o?=
 =?utf-8?B?SHFaRUlXNFk5cXpDMFJjNTlST2pEWHBXUUpTK0dtRGhTU3V2SGlLcnFHZWo4?=
 =?utf-8?B?Wi9jQnFKMXpKQmVjYmNseFJoN1ZwZ1NaMjFSOXM4QkRnRys5cTduaDY1VllO?=
 =?utf-8?B?KzVIdlRPdTlZRmsyKzVNeTkwMjlmdTRPaUN1SGJVNVFWeEpONjJlcVVXZ3Ry?=
 =?utf-8?B?WkNnVWt6WDY4Y3B0Zy9wM3RFUjhDRkZYdHlCNWhjdVRBUzRVN253VVZJeDBI?=
 =?utf-8?B?ZG9VU1ZwcWhpYXVRenY4cDlGbTg2QzZINjNUbWJDUHVLU0FGbEJyWExQRDlx?=
 =?utf-8?B?THVpWmVVWW1yMnpNMjZ5dG1Kd3YvR2NQNEdGUmhxbXlTWEExeGNZeXRBNEhI?=
 =?utf-8?B?VnJrbkUwMHlCMW9WQXp5a293STZ1MHZzSHlxT2svbWd3WWRFR2l4RHFLY2Mx?=
 =?utf-8?B?TmdNQVR1eHdTN2lPZms3akxRRnFXYW9GSURUcGlza3NDTUx2WEVKRmtNd2hG?=
 =?utf-8?B?VENrSURUNGZMdjgxVEdvMXF4UGRCQW1lM3JMRTcwLzJVTmdZaFBmTTYzQTg3?=
 =?utf-8?B?RzluNXhKZ1Zid0pUT2VVaTRSWE1WM1lKbEtRRERIc2laalhmMlRMelpoUWdw?=
 =?utf-8?B?bFBwRTFyWnp0RXQvQmJsdmIwRUd2ZmFDRXhxdWJPUFhidEp3N1JBWFQxZlIz?=
 =?utf-8?B?RnMvbVA3NU54djgyN0FCM0pkRzZiRmw1TFZtejMyV0VpMVlKNDRWUmM2blNL?=
 =?utf-8?B?eFVPOURibnVzYnZkNnJCMnpHanhBbUMwY1RpWjRCQUh3cWVTUDVqVDI4Wkls?=
 =?utf-8?B?V2hWRHdBbThKMC9pczBDK1QvaUs0NmRzSytXTlhsOXBhK2xvd1d2Wmloc0Vx?=
 =?utf-8?B?TS9tZ0RjZVJxTkMvbHl6N0ZpMFlOM1pOS29mKzJEWVYrVW83dmhpSXlkUmRi?=
 =?utf-8?B?UlVZcEw0dlVrZ1c2RUd1NTlRamUrbDVtangwTVlsQU15NWVMUkd0bTRnckk5?=
 =?utf-8?B?UVFEV0FrZHV0Q3lITGRVeS9pb1J4Yjc0N2hnY05UN2VOMlNMZjR2VjJOaHZQ?=
 =?utf-8?B?dmtPYkR3VkE2NlNCNnozdmVYbCt5T0U0ZjVyaHFUcnZUYjlyZnorbzh4Wjll?=
 =?utf-8?Q?Ra6FwORzk6o=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mkl2dGQ3OFRwaFhrWVFhdms0NmhjYStkT1pQOFhEZTBZTTZLTVo0bm5aZ3Iw?=
 =?utf-8?B?c20rT2VSakZYT3VpbjJZcDBrWDFHZ1JGbXpCRjViN3AxRnRFTHB0VDllbmRj?=
 =?utf-8?B?d2IyWWlLby9aUytDY0IyYVkramhwRnFaTWp1dnpwMVo5RCtWMlNKZzhKcEFL?=
 =?utf-8?B?MUxpNE1HQnQvTk1hOXpSSkFQVHpIUDlwWGdSRU1qUytCU1JzWkowS0FkVDNO?=
 =?utf-8?B?NUFDdjhvVXNkSHM1ZVdpL3lWSzVBelpHaC9oT0htbVRYbkRMTWVVQXh2a0cz?=
 =?utf-8?B?Y043a0N1M0JUMnR4VXo0YmRQVzVENUh3c1FGY2o3eHQ3dGZSWEh1NC9kelZh?=
 =?utf-8?B?cU1DTkZEcVF5dXp6bElwdEt5cEc4NEErdVowVlJneUZZVEFka1RJOHNWOWpZ?=
 =?utf-8?B?REd0eFVmTVdkcnlrZWNTWHJFUDdjLy9UZmFqZVZpYjZFd3NLZjBmejJVWUN3?=
 =?utf-8?B?T0tyQXl2NlJwU3dXZFRFVWJsY3FpcUJQVWJWZUVPcDVRdjdLTk8yWHRaSlhS?=
 =?utf-8?B?NlU4V3FzTG84K0dwNU14MkVOMjJkVVNYUVlDMTNWN1NHZHZkWEpDdU9xa1Js?=
 =?utf-8?B?ZnBYNHBFbW9ZZUtZamphekZUZUI3SjUxMGJ5UWZLaFBOaWNYbjRoZ2hmRTN6?=
 =?utf-8?B?MGNqTS9YdGhsTS9QTk1GTkV5ZmVqQ1pOOERQTkVJOHFXNkIxRmtmaXphMVZ6?=
 =?utf-8?B?MldOUE9lbHcvV0dwSmlZNlEzOVo5N0RiZHJ0MXJWMTYzNjc4Z2xFME5MQ3dK?=
 =?utf-8?B?MEFxZ0pjYmxJbGlxV0VGUGlMeWhQcmM3RnQvWjJXK3F6WmVuTjlrYTdCNHRW?=
 =?utf-8?B?RnY3UGhCZktUd2F6RGxhaWptMXJZWE83ZHR4UkE1YkJMcFF6QkNFS3ZCVTBn?=
 =?utf-8?B?Ulp3ZE83aTA0SS9DTW94anhHWUUxNW5mME80QVorbjJEd2Y1Y0xhWXR1c3Jr?=
 =?utf-8?B?UzF0TzVuY1k0TERob00zZ1BNeCtzK2NJbi9pZVhJc2RWNW5vdHhGeXIvNytt?=
 =?utf-8?B?TUM0Sm9PSk5aVnVrbEZuVy94dFBHamU1dVlLKytBSFp6NFRkeXJlNGNyNUF0?=
 =?utf-8?B?MzJTeU85WW5XNUYxVTlUdzZuUDE5dnNQWTJ0Q2RjbnArbHlEWkU4UU5tSnht?=
 =?utf-8?B?aU1zRUxVbE81WENYOGlHVGhRelB0c0RWYjc5SFZNZXcyL2poK1JOL0xlRWU5?=
 =?utf-8?B?UmZlR3FiWGJ4MDdMbUlFSEZJYk5UMStkekU1RERKeEUwV1M3Y3k3N2F2UElp?=
 =?utf-8?B?NXZJb0R6V0MzdHkrMmx1ODZERFYwbkY1UGdha0pKdlBPZU9VVm5aeWdsRDRL?=
 =?utf-8?B?VWtkTUV3N0FLTXkrVTc3R2o4eFRCNnJIUFZnTzN4c3E2ZnF6Vmc1bjFaY24x?=
 =?utf-8?B?MkpuVGRmbFJyL21GTU5yOUVheG9TNW8rVlNhMzdEeVhjTWUwcWVtQXBZZnNY?=
 =?utf-8?B?TUU5K0FEOWlQL0hOb3JYTW95VjI1dkpYMWVadlVKakluNHlCNkt1bkxvaml3?=
 =?utf-8?B?UlBEWGh5bzZmeG5UeEwrdktVNXhadFVmSjdPUW9hTGw2dGh6djNuS3JkTkpo?=
 =?utf-8?B?WmF5N2JBdHIvSEpXUitQaHN0SG9XdU1FS1VpQUhZeFd0TXhlVUc2WnBScVd2?=
 =?utf-8?B?VHlRaHlpdGNpaCtqdDFXamVtT1N2ZGM3WjZ2d0liVmdpVlhHOG9CakVCclFX?=
 =?utf-8?B?Q2hkSkJzdkVCRlpPS0NjNjRtcjlVNUlOTDB4dTI3amhTc3NRZ0lGWTN4cGhK?=
 =?utf-8?B?MHd0Z3RRdXN6NWltV1dmUGlOa09RRUdkWDNoVlBMenVCSUtObmlTMHhONi9E?=
 =?utf-8?B?V3lHQm5VSmVCUUN5UElXWUZMNjNFcmMrckt5V09NdUs4MnRxaEdsbHBiWldT?=
 =?utf-8?B?TjlNY0dVS1JheWpnazc4OUlVbDU0ZDZmV0VERDdqbXU4VWhKYTFiZGJuc1FU?=
 =?utf-8?B?eWFiR2Y1VXVlYitYWExLKzdVWXRnNFdsb1Y0bWhRYlZzSWh2dnZ1L0I4VmlL?=
 =?utf-8?B?OEZhOXM1NlNvcTBydVZzK3RhQXBKNW1JakowS0g1MjVjUWJiTXVNL3hRRFFE?=
 =?utf-8?B?cGUxWlliS3liN3o3MUhOaHZxODh6cUE1eXFxWUdNNFdzZUh1cVVwdEs2clNi?=
 =?utf-8?Q?KNF1hb293Oi4OjkbyAtJGbjBu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5052663f-e030-4359-f0af-08dda5286567
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:31:47.6711
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1rllz39goh8Q0LVQ9wJWkJFRVuKtWz5xpaYMMTWUxQxV0zV1qElhTYkRnDhQzDQF0IhwWljdITOEAmRe1KX7iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9350

...
>>>> David, what do you think?
>>>
>>> Well, in this patch here I deliberately want _ONCE for the unpin sanity
>>> checks. Because if they start happening (IOW, now after 5 years observed
>>> for the first time?) I *absolutely don't* want to get flooded and
>>> *really* figure out what is going on by seeing what else failed.
>>>
>>> And crashing on VM_BUG_ON() and not observing anything else was also not
>>> particularly helpful :)
>>>
>>> Because ... they shouldn't be happening ...
>>>
>>> (well, it goes back to my initial point about requiring individual
>>> decisions etc ...)
>>>
>>> Not sure what's best now in the general case, in the end I don't care
>>> that much.
>>>
>>> Roll a dice? ;)
>>
>> One last data point: I've often logged onto systems that were running
>> long enough that the dmesg had long since rolled over. And this makes
>> the WARN_ON_ONCE() items disappear.
> 
> I think what would be *really* helpful would be quick access to the very 
> first warning that triggered. At least that's what I usually dig for ... :)
> 

These two use cases cannot be simultaneously solved, at least not
perfectly. Fortunately, since a VM_BUG_ON() case cannot ever happen,
either choice will work. hahaha :)

thanks,
-- 
John Hubbard

