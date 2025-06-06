Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D871DF755
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235186; cv=fail; b=UDiUCWqmwQdIsQxwoprh34PuD/DbJnrN2vkNyFlGE8yQxrXa5fQzzUVGg6CU1uQOqeaPCTQ6kuR+6DPVKAAd3m2gPme0TNqYkGyfvFpeIqr3OQKQoR/Xcx6eDp5S1Joz3e8UtO96hWXUbhP7gD+FedysQJT7y6U457zitMuyHT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235186; c=relaxed/simple;
	bh=9jWQ/CtMS2cWOeGfdTZCrqMR49ltaxa5rN47i5xR2Js=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cX0synQAcTbaImT/SKxnZX1UdYtNs4wF6d77bgxuYzUhqlFTRbn1Ia8fZOZMEmanWEuZs4iB25IrjO1TEpOi01JYxDFN1BjHuGl3xrJ9KJah9dTiYfVbqOu6Sn6URNiAq6JvlbaIKBBSLcMQplZK1feX+uVqkpONzhQKLFJ2v/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DtbrbHk5; arc=fail smtp.client-ip=40.107.94.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DtbrbHk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ng7U0CPMC5mPoDw+flipwQrSMwctJvnA/FlYR45L+MNZGnav4iloPRa30Z0E/z6UpI3JnHOrmHtF5MlSUnQA+Liy5wzS19cWhtw51z5gZmjN2UlfvuwO0m7DB7ge2XxBKOfSnrYZPmo/X79NmO3p9UFMdq93z6NTVKhuj2C/9zjZktAsHyTkjTNZ0J+KSQtd1VwZHalIx7exPQzx7yJkRRSz1MCPSrjkYUYtSQM79p8i/umWSwYo7jVsmW6fE/lwOu9mCfZ7dbZoTRQBrUSTF4a98xO10xGQQ0DGnyWokRm3I+RHOK5iV9KQm67Og9oxUi+aYffXsdoUxmtsaD2Jjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpBjishyXhNl04k7Equp558XH+rKH1MhwGKmj1f+XdM=;
 b=N2W+4F5AH/nVPtCS3WY18t7FKh8sffHFBR7/xRpHflGfDkYwHhRru60ZhyYQ1NYAUB/sibIhr9N79Cl1gtJyLFgPnuS+qZ0bOSKXonyRjOL/8MdsS3gl5nzuzypO41MY+cVYfhNqvJrM+CW287Y8jrdijZNjhmyZ6uO4ohPbnhkIpJslHzQFQwABrB5zXMn89fAUaqtB/m8Uk0+SU7mw30Zn+2BokeCyixKez9eJAsHguzARAiZ3A16jM8bVpRfGq/92SirNh+6BU/fVnlfo5jehGlMF6LcOZqNhJeAiI+/QNO1P6NRiFdYS4f4kxDzkr4ukSqLn9SCwhcgcQqHYNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpBjishyXhNl04k7Equp558XH+rKH1MhwGKmj1f+XdM=;
 b=DtbrbHk5ei8iGKD6Pnd/ncaDi5ZtUWU8JcywKUOBWgEQfXyZiNHzRzHmLrWBXAnpcbDwdyk/xfceXXhMJIf8s3axafuLwZmiR3QZvTFb3pqF05939OzfgkOgWpi1gL92wieqkOqi1uvKGdOwP+8YmRGbK6BhBhO4gfCDasxVAbLihx3CtlyizF0IwF3qLroVcd2UcR4Jv7A2RIKdoUleo3SJ4PU9Y/cUwtN7rWaPTITQaTzPkKwiD2d7motjcuke1e06fx0+3Mu+dFotq1a0Af2oxbvUOaewelGjK5enxSg4x5vEVPyXmHhnYhCT8wV74fLeBdduq5mI+ixrMZ+qXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7)
 by CY8PR12MB7415.namprd12.prod.outlook.com (2603:10b6:930:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.36; Fri, 6 Jun
 2025 18:39:26 +0000
Received: from LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4]) by LV2PR12MB5968.namprd12.prod.outlook.com
 ([fe80::e6dd:1206:6677:f9c4%4]) with mapi id 15.20.8769.037; Fri, 6 Jun 2025
 18:39:26 +0000
Message-ID: <38bed9bf-eba2-479d-a3d6-75be0a129afe@nvidia.com>
Date: Fri, 6 Jun 2025 11:39:24 -0700
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
 <5d0d0542-5994-49e1-820a-02fd7e7551c5@nvidia.com>
 <e0f17454-241c-4a88-be32-ea34d3769930@redhat.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <e0f17454-241c-4a88-be32-ea34d3769930@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:a03:180::24) To LV2PR12MB5968.namprd12.prod.outlook.com
 (2603:10b6:408:14f::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5968:EE_|CY8PR12MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: 8755f7e2-7cec-4a10-434b-08dda52976e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N285MXQzRTg1QmpvaWtRQ2M1TFpkL0tmMjRSYWcyd1NLaHFCVDkreTRkS1ZD?=
 =?utf-8?B?TVlDT25GUG81SWpzVzNMUU40UEJiU1ZCK2pyM1JodWpHSDJ1TTVGUzNoS2V6?=
 =?utf-8?B?bTl0TSsvL1A4Ky9vSE9FeVl6UzJTOUc1aGZralprUThuOFRWZWR1L09kSnd2?=
 =?utf-8?B?YXJUU0I0NmJ5R3dXSDBJWTdXWTVSUzM3VDRHN3J5YnRBQ0Z3VDk5VnBocEln?=
 =?utf-8?B?SUwzSkhhZnJENXJpVWMxeFVmZHB3ckw3SFFaRTMydGx1b0xnc2wwVWlTeUJE?=
 =?utf-8?B?V2treHhhTTIrOThyaU1zVXhERmcvaGlpQTlZTEZlaXQrZ0w4eEhjWnJ1STRr?=
 =?utf-8?B?dmpXcW4zKzkzOE9vK3F4THl0VWRmZ09YQWVzN3lqTEFMWUllTmh5VzQybFJJ?=
 =?utf-8?B?UzBHcjdNckxaSm45K09GVmRVZDRkcUhJeFZhK0VKdlZZMDhhRmFqVkg3MVl0?=
 =?utf-8?B?SjJPSGJHUXlVbTJtT3lHUW1rdUlSY0hnSkw1TVErQTRTY1lkWGFBZzdkdmo0?=
 =?utf-8?B?NEsvdUxPUzFxZ2hvOHNBUTZmeVhWVVZPdFllN0drSVYwUDBrbzErZ2Uxem5z?=
 =?utf-8?B?RkltTXBvUmNQbXlaRVd4Rmw3SDZscGcvbGVUeW9zRlNlWnVya0JybFh3QlB5?=
 =?utf-8?B?Mm55ODI3YUpqUjFvNDNRVmhtWHkxUFpzSXZYYnZJTGhPOG5Vb1l5VzJ3STBj?=
 =?utf-8?B?STB5eHYwcVZ1SDlBM3lxdlJ0T0VFeVBRTis1Z0R3ekZxMGJiM0c4L3lZWUVP?=
 =?utf-8?B?OXJ2ZU0zODU1UitEa0h6VzV0QnIvRmt5VG5RaVFnQ01vc0treThJYTNuY0R6?=
 =?utf-8?B?N3RLUXlSNE1BNEUyRW90MHkyRlBRRWVZQjRKdmZpb3laNWE1Y1VLd24rTE85?=
 =?utf-8?B?c3NaTzRiY2h1aXR5a1lyMklEaHA4VGJmbC9qV2JkMjduUGUzSTh3Y25DSU1P?=
 =?utf-8?B?SVgzcU5BSFh6ODV3TndnUHk4cXd3b21RSWFidTN6N09HMkVsNEFNT0x4dmxD?=
 =?utf-8?B?WURjWTFuVUJuQzVEMHd3OFYrRjB3QXFmR21rU1ZndWQ0ay9nSVZyeGg3NUZt?=
 =?utf-8?B?T1k0QWh3Q3VlSHBzSWJnNVlCSDZyTTRTTDd5b0FPSjJXZy9QT3dZL1BXbm1k?=
 =?utf-8?B?MzczdzkvQTZrWjdkMDUyVldHUzhjVmtkOTJqOVYrZ09BSS9XSFhGWG5ibjA2?=
 =?utf-8?B?K1NZVXZrSU8vbWFrNEV2TkQ1SWlXY2ppRXRFYytoenFZdndtMVRPMm9YMER2?=
 =?utf-8?B?WnBVYUQzSnM1YUhCdkk5MmJKT3VMbDJZbzFFdWlKYzIyRklsTGlWeWVjbEdM?=
 =?utf-8?B?SWtCWjRtaFRWOW4xTUh5Q3dRejhBSHVBZEkzMG5POWdpYS90aUl2UVE4MUgw?=
 =?utf-8?B?VjhvemRzNXBBSHFpSkRyaHFoTjdKMjdmYVMwcU1UTDNTOEVGTm5QaGtseXhr?=
 =?utf-8?B?dUtZc0RheHhyb1AwaWN5SjBIUkxadzFhMHRvNENpODFlMjVXT3NTVUR5TG9H?=
 =?utf-8?B?aDJXcE1RVHBNQlh6ZXN2N2RxNjdEVm1kWkVPaHpxb3Q4TDRiZzFEeXYwNnNL?=
 =?utf-8?B?SHRWd09lLzNjK3QwMHBRWjdoVDFWZ3RXS3NLWUk2VVFFUDBvUnhnNTdaZVQ5?=
 =?utf-8?B?Y0pqclpBODBjbXFMdkJHM2k2MWhHU2o5YWFkK1plSzFVY2RqR0t4Skh4Sy8z?=
 =?utf-8?B?aHNGdlN5dVRpRU9EenI5dmY5dWlienJVelE2ZzlOS3FFRG1Rbjc0R3pBd2lp?=
 =?utf-8?B?WU1pdE9wdjVwMm9MLzdIcVNrTEprb3dQSU44d1VucVZDM29ldExmU1puUXhx?=
 =?utf-8?B?ZmhubFVaM0o4b1hUbHhMYS9MWDJ2bmp3QWp6NHJLeHljalQ4SHhDT0V5clhS?=
 =?utf-8?B?Wk9MRHhFVnFZQTZYUERNcDA3aGQzZkVhSmVCSFBqeEloS0Q0VlBvVGZPTkJ1?=
 =?utf-8?Q?6dW8jQ+LGLk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV2PR12MB5968.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTJydGswWVZBczJUV2dKeDVvWnFHMlFLd213ZFVJYjdQNWRUZFBybnJxeEhn?=
 =?utf-8?B?TnBhazErRE1OZysyQU0xc2dDK2ROWGpXaU82MW5CcExDVFJrdUpKL1RRUTlp?=
 =?utf-8?B?b0IwTnoxZzFrejRsR1VQdVJKTjRvbUtlazNtZEpIUmdpWllSVjUvUGNJUEc3?=
 =?utf-8?B?NWZWaG1QZmhYa1FXOU93ZWtkeUZnVzUrUm1Yc0ZSTEtNRTUzSFNBYVJ5cHhG?=
 =?utf-8?B?UWpmV09heXFJKzdtZEdXVThaR0tQUmRuY2NBekFra3BvYko5U3p0cXkvQjJG?=
 =?utf-8?B?bDdOYUg5bzkzYXdXRStkOURLeHFUdjFDYW9DMk4ybWcwSDhJV25DS0NiUFRu?=
 =?utf-8?B?eDRhT3VjcXBZRHZMRDVGMFRMdERNTHZyRi81NG5ZcE1ZMm1VdnV6dkgyampl?=
 =?utf-8?B?c0IzSVpYSjFiYkVuNERtY2d1eDdHcjYvTyttZkJYYVAwNTdxMGJ0cHZlT2ZE?=
 =?utf-8?B?YzZRWjBCdWpQUXpQV3pWTkRHbXhXT0ErSlpUMzVET0xoenRERktDMnk1clBO?=
 =?utf-8?B?cHVPOUZGWHArenhVNXpxV2huS0ZHN0lRaExnek5HMWtQMWVYZmFWZnJYb1VT?=
 =?utf-8?B?NFRXYWhVNWx3dFZmbk1KU2huSmdkZzdsSnFzLzBNcVpVcUQ3aml3Wmd1S29t?=
 =?utf-8?B?Zm9MY3p2UGFkOW9KOXVTYU9ULzlUQTdvajF0ckxNTHdWeFVNRUl6blNzR25m?=
 =?utf-8?B?RmxBRzZJZ2VBcW1VZUVXRzUvalQzUCtPamMwR1p6ekM2UWpRQ3EwdGplcDdN?=
 =?utf-8?B?d2J6QXE2QmRZL0pTNjVVdlNpQWlPYzJiWk9EME1PUENONlFhendmZ3g5QWF3?=
 =?utf-8?B?cXpYQkdyRmJkR0c4d2dRSU5ZbkwyRE5NdEQ4WVBjSE1GZnUwRUhkV2NwTXc5?=
 =?utf-8?B?ZXBSSEhvRVJtcFltODFqUEx1Nlo2LzkyOTRUeWVkcUUrZkxmSG5FQzFrT0hv?=
 =?utf-8?B?V0hsTmdFSjZOUjR0cWtidW5ab054UEc3ZE9vSnNaSm91VmxEekpKdHhXRC8r?=
 =?utf-8?B?eGpBcHlkWHB4VmRUUVV0YmNHaVpBYXdrOFZwVEZxOWJES29XeWRqd2RXQXh5?=
 =?utf-8?B?enREUGIyNkZxZENrTGpGRUNnSE9tNzR3OWo1eWs4end4TWxKd24xSWNoeXhY?=
 =?utf-8?B?NGcrUW5LeTRxQitQcDZVeGtOMDBLRmUvRXdVWVEyZmFEWTRIRFlLVkNYd3FE?=
 =?utf-8?B?RCt5Z3g1K3dDWFhjaFNVQWlQcWoxQjVMZ0hWdHpmUVVQbmlMLy9aM1B0NVdz?=
 =?utf-8?B?ZnZKVlZxYkxNWWF3MUJyWjFpTmVzcENqTHdKNTYxdEdvYUVmNTl6c1dpcmJM?=
 =?utf-8?B?NVgwOTl3ZmNKam4zNmlPUCs5TWtYMEM1dTBBaG5Oa2w1ejJoWHRCZGNaYjJM?=
 =?utf-8?B?ZXI4aldzN0RmRGVCa3JOVTBiOEhUN3YweHNYS3BwQW0rRjErbE5kSEQzSXlE?=
 =?utf-8?B?clR6MTlRUE44azdlSldiaUhleldML1N2M0NSUTRwRUtVU1ZpenpIL0pJNnBr?=
 =?utf-8?B?S3F2ZjFadUxqbTB3QkpGcEluaTRBMWd0NVVmSy91UzhFTUtnQytPZnFONHJi?=
 =?utf-8?B?bmIrd2dlUHFSM1p2UFQ5eEdrRHR0R3UzaXFlUktLVVFkUW91eHBGRGFOWmZX?=
 =?utf-8?B?cTB5WnFPZDJBV3YySkFXYktyYWErdERWaHdpbWVtb2M1UjR0aW9MdTV6QUU5?=
 =?utf-8?B?cjI5K1oyajZPcmFJcjhWRTVScTgreEFTWjRQRm51NTRhaVhXT29SZklhajB4?=
 =?utf-8?B?TTNuVkJsTmdPRzRsU1VFYnFGWW5mRTljM1hRcGNiTzFPcFd0ZE1SNmVzcXNW?=
 =?utf-8?B?OVZ2V1E1czNiU2Urc2JYYlZUNEJOdGlVK3RzOTFZa2l0SGdvU3ZwbTZRNWhl?=
 =?utf-8?B?WWRNeWx2SnlxTkZFeEVWOWw1N0RzNFVhN3J1WWs0S1k3d2JJLzY1OXpZS0RC?=
 =?utf-8?B?bnhJS0o1UktCMkpTeDlzOTE5QVpzbmdzaHpweWNiaC9OdVBSMmlxUGpNNUEx?=
 =?utf-8?B?VFJWOFU2ei9LdTA3VmZndEZzb0NzWDZCQXAyRFFuaWxlRnN5SVQzS1VxdzFN?=
 =?utf-8?B?eUlkZmlhcGcxd3dwUHB6S3dKdmU4SmZNc2VFZVNKTVpjZm5PZFUxYWNySmpX?=
 =?utf-8?Q?n+BpNiWyHtgqvKa452hXK4dOT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8755f7e2-7cec-4a10-434b-08dda52976e3
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5968.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 18:39:26.4996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9M4roSESFHXesau7H42mUUYKlqNnHAZjrMCkpycabmWznRpx8NMBIz2rwfzRY8ePNkM7K+iPBpnT9Tf2jzrfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7415

On 6/6/25 11:36 AM, David Hildenbrand wrote:
> On 06.06.25 20:31, John Hubbard wrote:
>> ...
>>> I think what would be *really* helpful would be quick access to the very
>>> first warning that triggered. At least that's what I usually dig 
>>> for ... :)
>>>
>>
>> These two use cases cannot be simultaneously solved, at least not
>> perfectly.
> 
> I guess we'd have to store the first WARN data separately away, just 
> like when tainting the kernel or so. Not sure.
> 

Tainting seems like a great building block. I like this idea, because
it does seem to mitigate the missing WARN_ON_ONCE(), especially if we
can capture the whole thing, backtrace and all.

thanks,
-- 
John Hubbard

