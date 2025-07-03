Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807BA1FDA89
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 22:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751582403; cv=fail; b=MVlnuF/9hla1nIAtJRk529tOwwUtIKE8J5YbjkQzAQi0rupmgvjiR6JTyrEnOLkfVGQv+I4HvpmQLef0/K05Ioxmab6/Dvkct4xRM5t3RSzkcu1ucv0RgOXGbgcczIbXH5ZGVutLLFWiEIOXMSna346xADl0S6tKtVtOmGEaVAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751582403; c=relaxed/simple;
	bh=iy2WIF4W1N1ZWWWb2hjx8z3sIAINMvZxX71HA1LLgX4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=P/eQP1oAo8EbicWTyqacQY4iXdfUtuTKPCgCrVGgwgx5kdoiQ/kN2Hqn5+Peh0vfpOtgZ8UWU7N6gh6XI6qMV0rxh6fbovG/2T8n8OwQmbcGZy7OH9zP2RlKgeslUTX0gZj+NvLyGu6/VSJcgfY6mIzj6wdA9D1/5wA1UMaWzYA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IY2X9OEo; arc=fail smtp.client-ip=40.107.236.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IY2X9OEo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiRmYVWxRi9lDdZMGeTQ+Rs2Wo5Q/sRskW0EnY2Z0K4KFeqHPMXKCQFAsHMbzBcwt4zs/vTkox7fisvI3FR0JQtHV7/MK2CsKIBcbajcYPeWZaB7NHRMZp9GNEyz5cLzBpn9GRrssAzLep9bTw3nIjwhnrf5fJPux2Zaaqz2Ys0WAhme0O0QT0CxtKypgRYHIG7Sw4Pg00EWkg/Zbjm4gPSQ/b5P1GhJ0NEr3AzVWHjPiPaAEH9LAZGW/17VrJ9lG98qMWiji5oNNCAHCSACNVoxOXiOVFYMS2fMGa9DJwtOoaCj8PWORGINjTUZ0faR0gr0kcvL1a1rpzMnVwBTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwSamTv6WNgMZAdnN4bCUKfoT2Lumz1JB3MYpFyYNHQ=;
 b=kXWj+nib35KlHh8GNvSPsvZySBc4dg6GUbRZk+IPll+vGpSK2Cn7tKUHqvkN281OKAfel9eMJBSJ+l1ra5sb2t2vxbUMnSyo54/MMB/eus9LMsQSL63uqcM5rfM+4uHOBAboL7RHQHhfcEXI04Fr0ftZjOM9qK1rf7GBrD3xaxS7JIbhqPijtkIIvvmBIY3mkjKz3PfivbZwJ4chc7z8nLEGoNDy5eMSnP466731GvYpeOi45Iwxxgu5oqP7sGxq4KMX8XqPhyUi6qJsQM35FueN1pul6Lz6WuPIbV4YqsZElWDJ8pAhC1skevinQnlyTWuzLqqp4rWBNwTTjiVIzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwSamTv6WNgMZAdnN4bCUKfoT2Lumz1JB3MYpFyYNHQ=;
 b=IY2X9OEol0O3hlp6tCpGSJMgHgT2fRuz3zZV8sqb5D0WTYOX3K969dl0xSdx21vCxvdLJT90fdvqrQdhhSojw9s9onfTrkyPGl84l5oKgZb4mIR7VwFsITVxWkc3le3/rjjZgX6fW4axPvkVvXAuM9geVzrREVrSccLtby8t9yiX4q9G+kHfp7pG4Y6zE8Vt7hYvtT8utfe+5p76W6Jd0UF8h6mms9WJbNx5bIFw7hd8gO7RXo+VZOP2CQkjxVOwiFHRte6EqZhxCzDWh1McJY5tfwxBq58N4HZBe2YKxkDLTv4EJ+vxTZFzW/BtZhTh+nEDTWK823pR+xw6fEPIPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by IA0PR12MB7722.namprd12.prod.outlook.com (2603:10b6:208:432::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 22:39:58 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 22:39:58 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-mm@kvack.org
Cc: akpm@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Balbir Singh <balbirs@nvidia.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	David Hildenbrand <david@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Matthew Wilcox <willy@infradead.org>,
	Peter Xu <peterx@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Jane Chu <jane.chu@oracle.com>,
	Alistair Popple <apopple@nvidia.com>,
	Donet Tom <donettom@linux.ibm.com>
Subject: [v1 00/12] THP support for zone device page migration
Date: Fri,  4 Jul 2025 08:27:47 +1000
Message-ID: <20250703222759.1943776-1-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MEWPR01CA0159.ausprd01.prod.outlook.com
 (2603:10c6:220:1d9::18) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|IA0PR12MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 7127a9e0-b8d8-45f3-aa39-08ddba8289cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TTZuVjRiTkUwUzR1N0t6eUk2Y1hoc3E0bjV0WER2ZnE0TURXT2dTa0F5QUt2?=
 =?utf-8?B?VmRnUkZBaUJKVmxISFdsSENDZy9JSzFQbmxXRnk0L2xsZXIyN1puWlU4YU02?=
 =?utf-8?B?L3JlVkJXazRYYU13em1lOFBqdndrMUFZTWVkRnFLN094anBkZ2lNamtNSlZ2?=
 =?utf-8?B?djlxUENUZnZTZVNqQzBRalhZV2YvcGI5bHRJdy8wUDNSc3VzbEdrc1hQRzZR?=
 =?utf-8?B?a0ltcnMybVBqK2xQYnByd2lNc3FsL1hqM20vekxlWkVObExvNUd1ekplYWxD?=
 =?utf-8?B?Zi9GbXo1MkROZEx0MXQ3NG4xQkc4RjNnakdvWUswOXVQRDZJY2p0QmgzQUdm?=
 =?utf-8?B?RUdaU2k2ZndXM2FxQ08vS3NKYWpXMVR0SEVaQ1NFRlFOd011U0tzNDR3dFFp?=
 =?utf-8?B?VUw5eXZERlZyVTJDbndqM1dYRmRNZ3ZIM1ZXdVcrZ3ZEaGZmNnEzQlM2dits?=
 =?utf-8?B?WFFZZFZlYzlHQXNDdWJDMU5MdlREemlKR2ZnQldRSmQ4VVljZGdVREVocll3?=
 =?utf-8?B?a1ZTNmpkS01zVVh4a3NmYkFoOGJGczIyRnZXd2w3YmV0M0plMjVVNzY3Tzcv?=
 =?utf-8?B?L1VDMEk0ZTRaR0R3bnNvYnR6ZUpEV2JtaGR4SFZOOHFMalNDcndVSHRyZytz?=
 =?utf-8?B?N3Qrd2RQUjJFRGpaRGhTYy9yN3VyUytBVmtaMFhZbG1kSVdYdkN6Y1JZYUov?=
 =?utf-8?B?R0MzRjl6Q3RCUVhtTTdIbjFJRW9IVm8rZ2Z1SEpUU2dUbXVDSjZidS92ajl5?=
 =?utf-8?B?eE8xcVhCemZBeDhRd1p5UDhHb013UFh5dFgxeTJ1YmJDZnlzcGdBR0tac09m?=
 =?utf-8?B?YmVEWk9wb2ZyV3pscmFYRGxSa1JoWTczMlYwTVRMUXNIcnh1K2Y3R0lnQ0FE?=
 =?utf-8?B?bkxrQmdJelR1TzJLMlFVcGxsckZaWVhWaTdqQmN0cnFuakFFUGUybUI3RmRP?=
 =?utf-8?B?WnZ2L3Z0cCtYNFRnTnJjYmNCaEc3d0VjY0htODFIdVE1S1FpR3VGWHR0TDVl?=
 =?utf-8?B?UUVrODllY1ZTUlpWaGx0ODlXenBIb2t2Q29xT255OGJ3T0tDZWdVbkVjMHNq?=
 =?utf-8?B?Q0FHbjlOVk9Mbk85WnBZbzZBVjhhR0RMNEFiUm9XbEg3dWFwdVpVTy9sTHhq?=
 =?utf-8?B?VWFxUmo1eWZqYmNjVXA0TVlLVk9hZFNTdEtwTFNnN0FaeHVuWGttczB3YjNH?=
 =?utf-8?B?eVJEWEZQZ1pnVExDblJVZ1VOeVlNTXRlSEttZlk4YUFUN2M3UGk2T2N2aW9E?=
 =?utf-8?B?ZjFBcGx1c2RtYko4SDJRYnhPNlNSa2daYnJkTGtNMFNLeFFkY3N3a3I0S0F4?=
 =?utf-8?B?Vm5yeWcrenh0Q1F2ekt4QjhsNGUrbzIzSklsQVFPREtFZE5uZnlERzIxUFBP?=
 =?utf-8?B?ZzlUeVBsMG93STZlc29pUDR1Qkd0Z2FPTk1yMThtbFFDY04vVlI2Z1I2Ujda?=
 =?utf-8?B?UFc1K01SWXRoOER3WEZTaGRvaVFzMkcyMm5NUTErOFFPQS9UcWp4VElOOXJy?=
 =?utf-8?B?SmFkSTl3V0p1WnpOYmpVZEI1UUxjQnNhSVdvWEZRR0F0d2lsbVVhT0JKQnZo?=
 =?utf-8?B?eGpTV2JnR0M2ZFlLNE5wcXlKTEsrK2EwUEZmbEh4cDFaSnFjWEVDbC85TGVX?=
 =?utf-8?B?cnBlUlk3ejNoRVE5NklDdDBPNGNObGhXblVXeElMRHlBWW43UkIvOEtoYVhq?=
 =?utf-8?B?N1BheTlIZ1dLTjRDd3AwNVExd25QS3dJSHIwNnZNUGdia2xMZkl5dlRzWGp2?=
 =?utf-8?B?dmczT3VqRXhkc1RabERDSS8vNVFEOEFVL1JqNFgrWWpNbVhKSkxMWlgxRGdr?=
 =?utf-8?B?SUZnNUZSNjk3cTNOL3pubWJsZGhFY2d4a1kzQUpOMnM4U3JLa3NwUXhFUHg0?=
 =?utf-8?B?S05QMXhRWkhMQmIrQlhmUHBHMlVqMFZqdjhWYlZjYlVLOUF4ck9Rd0dGQXdS?=
 =?utf-8?Q?2SC2UfSzeTY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V1VEdGJQVldqMG1hZzBZN2tyajcwdmMyR3h1ZGxxbEE5RFd2b3Y5aXJFTkMy?=
 =?utf-8?B?M0tLOEI3dDNTeWJhRHk0T2lPcVhEZkJvYm9vVlJOd1NmKzdJRmpBbXhMMmJT?=
 =?utf-8?B?MmpWb0pvQkxnNmNDZG1GL29lVTRiNFMrS1ppamU5S2FkZER6UHd6NjVjMUNi?=
 =?utf-8?B?b05zT3B3czFjVmpjVHBzb3c2cFcyaG5sZktvTnYrdlBFWFdSMWtwQlVGM01i?=
 =?utf-8?B?bHZIVTZXM1VFaVNucHpTbVNsbkovSW91T21yU3IvZzRjWGhWVmlkSVh4VmZx?=
 =?utf-8?B?bG0vWWNGTlhqM2kxWG90UHZxMER2VWpuU0R1UHVmTGt2elVkQ2JxVzZ0eHA0?=
 =?utf-8?B?U1U3YUhEaWlyZVV5RHc2UFdEWnlvSVQyZVBlZWY0WmVza2NROGJqa3hjWktr?=
 =?utf-8?B?K1RwNVdrNGM3M2ZSMUNDeEF5OVJiNnpWaXRVS09UT0pLcTNndjZuS0p0TWcv?=
 =?utf-8?B?U3VOdzZZVElMNlJVMTlDL2x0dHM4ZTgxV0lPMUNnQXRTUGpROEhiTVY3WlBk?=
 =?utf-8?B?K3BFSWhOY0lDSWQ3eFgxUUtHUERjMTVlTTlWa3A4djkrUlVFc1YxTVFzREkr?=
 =?utf-8?B?NS9mbk9GajY0dFVWekt2V3k3cXJlNlV0ZVIvMkl4a1RES1NuTVdhQ0NFa1Vp?=
 =?utf-8?B?R09LTDBuWkY5NHc0OG5uNXZaSE1kL0N3cGhmODArbS9uQ1dRcHZqTURVRWhR?=
 =?utf-8?B?Y09zT20xY0o2THdQcm53N0dsTy9RMzNFbmg3THBzSCtyajBxTEl4TlgxUElN?=
 =?utf-8?B?VVI3bUZZVVIwaVFFMlh2aXBRUHhDbmF2YnByWG5JZk9jUVRjVWJXRlhMeHpR?=
 =?utf-8?B?Vnpqdk5TVGJzS0ZxMnZnOVRsTTlwL28raFh4N09WQmpoczhYbFNFRTFmZExP?=
 =?utf-8?B?MFRpeUlMUVpQMEFtNWhEV3FjYVVpZUl1emNtd1VrWEdRR2w5K3lqcy9vYzFR?=
 =?utf-8?B?N3ZCQlFqTlg2ZkRMZmN3ckxEbWhTS0lTcHl4SGkzMzMvQzEwUk4xV202RUht?=
 =?utf-8?B?MFVGemxxbHdRVmtONmE3Y29vUCtlam1YK1NyZDVuRk5UOSt0SDU4VU9zK2J5?=
 =?utf-8?B?ckdUSXhNdFZUMk9vSHNFK1d3SEs0ZU05azYzcHZJbFQvcFM0ZElpVDl4T1Rz?=
 =?utf-8?B?dFFvVmc3N2R4MFA2eHBTYlpoSzV6My9YZVFld3A4RjhGY3hEa20xRUZ4QkNy?=
 =?utf-8?B?Q1BiSmE1ckptMkNGSVFiUzhwd0E2VDNRM1FrUjk2YlBlQk12TWZQWHlYU0ps?=
 =?utf-8?B?WEh1Z3N4cjR0K3JOS1NuNXQvWEJwWGoxOERSZHEvd3NHOWZobkFhRHdOdE5Q?=
 =?utf-8?B?a1ZmR2ErV3hZU2ZvM0dlTkFHU3VQdDFTR0tiVjJZTTcrOFIvbHBVK3JDRHR4?=
 =?utf-8?B?d0tRc3VEK28xaC9iYjJZMkVxY282c2x5ZTYzbnRKeVNIN29ZejFlZVkyZk4x?=
 =?utf-8?B?QzAwYkxYdEdKd1ZtQjg3cDBQSC9CbjU1NVZrOTBsbUpxbzhqZW1YbTRzMTRZ?=
 =?utf-8?B?cGpWVlZ6UW9WMlVRY1c5R3IxS1l1SC9UbjNJYVhLQ0hIODNDYnJ1VUt4c0Ns?=
 =?utf-8?B?VXhrVW5SNEtHVk9TK2xCTWZwOGtQODJOdlhwc01jZkhDSGQwZW1CeEUySkFZ?=
 =?utf-8?B?YkpwU0R3dE9LbHZRam5JQjRQVDVkYW41cGNlNUZOM1l5Y2xXOUhWT1RrN0c5?=
 =?utf-8?B?MkxxYzBOYUFnRlpvelhObFpZR2Y1V2ZpS3hRTVU3enNUWk9VclFZZm0wbkhG?=
 =?utf-8?B?d2d6bFpRTk5iSUE2N09Tanh0WkN3b204cmk0UTBaODBuaS9YSWowc1pvS0JN?=
 =?utf-8?B?b25IZVgvNzNvQTFlSGNuRnVaSWV0aWRsNWFKNVcvd280Nm9SWlVPU0phSFNV?=
 =?utf-8?B?aXVwZjJQckFjQXFMSUg0NmkxTjJSaVdIZXhMWWxJaTFnL2o1ZWlTeithMXVO?=
 =?utf-8?B?M2Z1V29oa3oxMmxzRFBHTWVSUXFqeW5JMFJjRm9tVmhMWVlJUGZZTzlzSEpj?=
 =?utf-8?B?SkoyZWlhMGJGRFVVMGZFZU1PV3c0M09EbGVqay9YYlBKbzdmRUhnU2VZTEYx?=
 =?utf-8?B?SUI3dDNQS2RvNk14Zk9Xbld1Sk1oYmlaK3Nnc09XblpiYWVrRWNRblMyT01N?=
 =?utf-8?Q?K8H2Mf3ETbYttIGWdLGDyJ4x5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7127a9e0-b8d8-45f3-aa39-08ddba8289cd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 22:39:57.9533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mE2EcxVoicg4gHPwzG50aii15dAaPiaIm6eHzhODpVMqJo+i0pd8WziOsJxsLWYkTAosOUSBJ20pUi2WrGG7dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7722

This patch series adds support for THP migration of zone device pages.
To do so, the patches implement support for folio zone device pages
by adding support for setting up larger order pages.

These patches build on the earlier posts by Ralph Campbell [1]

Two new flags are added in vma_migration to select and mark compound pages.
migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
is passed in as arguments.

The series also adds zone device awareness to (m)THP pages along
with fault handling of large zone device private pages. page vma walk
and the rmap code is also zone device aware. Support has also been
added for folios that might need to be split in the middle
of migration (when the src and dst do not agree on
MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
migrate large pages, but the destination has not been able to allocate
large pages. The code supported and used folio_split() when migrating
THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
as an argument to migrate_vma_setup().

The test infrastructure lib/test_hmm.c has been enhanced to support THP
migration. A new ioctl to emulate failure of large page allocations has
been added to test the folio split code path. hmm-tests.c has new test
cases for huge page migration and to test the folio split path. A new
throughput test has been added as well.

The nouveau dmem code has been enhanced to use the new THP migration
capability.

Feedback from the RFC [2]:

It was advised that prep_compound_page() not be exposed just for the purposes
of testing (test driver lib/test_hmm.c). Work arounds of copy and split the
folios did not work due to lock order dependency in the callback for
split folio.

mTHP support:

The patches hard code, HPAGE_PMD_NR in a few places, but the code has
been kept generic to support various order sizes. With additional
refactoring of the code support of different order sizes should be
possible.

The future plan is to post enhancements to support mTHP with a rough
design as follows:

1. Add the notion of allowable thp orders to the HMM based test driver
2. For non PMD based THP paths in migrate_device.c, check to see if
   a suitable order is found and supported by the driver
3. Iterate across orders to check the highest supported order for migration
4. Migrate and finalize

The mTHP patches can be built on top of this series, the key design elements
that need to be worked out are infrastructure and driver support for multiple
ordered pages and their migration.

References:
[1] https://lore.kernel.org/linux-mm/20201106005147.20113-1-rcampbell@nvidia.com/
[2] https://lore.kernel.org/linux-mm/20250306044239.3874247-3-balbirs@nvidia.com/T/

These patches are built on top of mm-unstable

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: "Jérôme Glisse" <jglisse@redhat.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Peter Xu <peterx@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jane Chu <jane.chu@oracle.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Donet Tom <donettom@linux.ibm.com>

Changelog v1:
- Changes from RFC [2], include support for handling fault_folio and using
  trylock in the fault path
- A new test case has been added to measure the throughput improvement
- General refactoring of code to keep up with the changes in mm
- New split folio callback when the entire split is complete/done. The
  callback is used to know when the head order needs to be reset.

Testing:
- Testing was done with ZONE_DEVICE private pages on an x86 VM
- Throughput showed upto 5x improvement with THP migration, system to device
  migration is slower due to the mirroring of data (see buffer->mirror)

Balbir Singh (12):
  mm/zone_device: support large zone device private folios
  mm/migrate_device: flags for selecting device private THP pages
  mm/thp: zone_device awareness in THP handling code
  mm/migrate_device: THP migration of zone device pages
  mm/memory/fault: Add support for zone device THP fault handling
  lib/test_hmm: test cases and support for zone device private THP
  mm/memremap: Add folio_split support
  mm/thp: add split during migration support
  lib/test_hmm: add test case for split pages
  selftests/mm/hmm-tests: new tests for zone device THP migration
  gpu/drm/nouveau: Add THP migration support
  selftests/mm/hmm-tests: New throughput tests including THP

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 246 +++++---
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 include/linux/huge_mm.h                |  18 +-
 include/linux/memremap.h               |  29 +-
 include/linux/migrate.h                |   2 +
 include/linux/mm.h                     |   1 +
 lib/test_hmm.c                         | 428 ++++++++++---
 lib/test_hmm_uapi.h                    |   3 +
 mm/huge_memory.c                       | 261 ++++++--
 mm/memory.c                            |   6 +-
 mm/memremap.c                          |  50 +-
 mm/migrate.c                           |   2 +
 mm/migrate_device.c                    | 488 ++++++++++++---
 mm/page_alloc.c                        |   1 +
 mm/page_vma_mapped.c                   |  10 +
 mm/pgtable-generic.c                   |   6 +
 mm/rmap.c                              |  19 +-
 tools/testing/selftests/mm/hmm-tests.c | 805 ++++++++++++++++++++++++-
 19 files changed, 2072 insertions(+), 312 deletions(-)

-- 
2.49.0

