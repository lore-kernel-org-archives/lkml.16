Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A72DCC05
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 23:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751585767; cv=fail; b=ecRyLc+9K8idtfWl/FLDewLmAWOog5qQXzhJDqhcLjkRBgaEO95ssR7ATpkuWSrt3VBgQeVCtkmHVlFamHFvRZoyK+9/vwG6o59NOkw6Qj0F8sof0+FpDI67PXOeDkSlnmMd4hHLeRo8TECy8wbbaT2WTuok3Vv6/TxxQB2VJr0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751585767; c=relaxed/simple;
	bh=0yqWyczuqE+gUWoqPRa9V2My3YPOLYcoFaCMlsVhPkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DdPyvAHfiyYFqK71Ec22eZX8Ahs98pcAHo9aHnR/ygDmcNbasd24/X0gHQ7+0e2jr4R32WTkUmlyLkon5D7BWS+hUD6W1ZraaHvwLERZY+pG4LwPTv6Is2O6YkCiHMaAuCe+7ehYYY1MlMuQAteNly7Kj60KdyUZ8pEZX6UufxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=kHDSD79O; arc=fail smtp.client-ip=40.107.243.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="kHDSD79O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GZJU3KskijVjn2AOkxGrOB7UFXxs+152AwcliTZat38Wh/vetgbIEhO47nGTYfh57BXLcOjf/pqJkwC3A3gAqs0lT0mY7vSy5UcSF5GzTymX1krgGRfuoZ+0W9QWH28iGPh90DROtBWwALtHapOWvdWdoGLO7ukBbBrtFl5Cll3f68BeGCpkkHhoDMiz5n6fF3Fe2BMYQaCat/hXkaEFUNhrqjWroOUDbV3Hoj486LoyB58B7MexL2Ah7VBP3RxcD/MDHC7PFxsGR0sVwGHwyLxOpYmcOFz2D5Hc/0oc7E32c5IFQ2VkAloJXmgoJAOzQKfheYCpo4pxeB2W/cY7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq6sKISZzXGpkEUoSzEdig80iQVYhb/R87TXdqFtzME=;
 b=vY/WyEPSQtQzN61snc3ur2akLk4LZ4Oe1DcXlewEtFjg5YRIq4fJY/BxfMhm1k7KltkecF43saI92wzQW1t++GJh7TDa9qgOR6ardDES7PQX0NB4bfbzAb8c0RuamXudejKUZw8nbDwzg4bm2o2Ib8f5P2mg6nPoDXM7jkIFwwe1ZQq45w6LsHmmVk2+iV98oBQICsEBju7ZfnGZW5h1B8jFgxUzujFolbvPQ6nGUaOXVFjymw3L89CJ4XjWhPRfVVMHbMtpEEBsvev0ykivonQr9BzroVjzuU25Q1V13IFA018/PkBKk2KffhiYQat/+311x0ln464TCzqcWzf8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq6sKISZzXGpkEUoSzEdig80iQVYhb/R87TXdqFtzME=;
 b=kHDSD79OmrtFH0LTWtgQDyKoQnyohxZIjPs6WWQtKv/WUC4vQbLD4S1PBJY3Hxemltuxn6iNNmP0bEIo5J6wsyy0VGmP7HKoTjxTk3fiQlsit5BjyJdUFtBs5LeBbmUsRwKsXruh3/goUORRIiVEMi4oRNBpSuxeAcXaJUlTXDfW3+aekgwh2gXvQXbz6l/9KzyFP99hE2mlD6RdvuF1rajw7I/7mN7XMtYC+UJ99BhI7qEzuVAT178bnqn0Rq7JgUV+6GosAUzr7Yi8RSCgb9tNE6W2zdkX+WUhDk9EXQDd/OtClbc/cSRzd8pprzqSQnJCkzpGJPBqjcsGPw+wtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB7459.namprd12.prod.outlook.com (2603:10b6:a03:48d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.22; Thu, 3 Jul
 2025 23:35:59 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8880.015; Thu, 3 Jul 2025
 23:35:59 +0000
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
Subject: [v1 resend 04/12] mm/migrate_device: THP migration of zone device pages
Date: Fri,  4 Jul 2025 09:35:03 +1000
Message-ID: <20250703233511.2028395-5-balbirs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703233511.2028395-1-balbirs@nvidia.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0026.namprd11.prod.outlook.com
 (2603:10b6:806:d3::31) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 30e5bd56-86b8-49b6-5f9e-08ddba8a5d36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aWhWVzFpUUQzYnZ4b3dDMDVqbm82ODQ0VWNza1VRK1h0T0ZCbXBhdnRMSU5k?=
 =?utf-8?B?Mks2ZVlQbXpDbWtGSTg5MGRCUk1EdzdPQ3lrNmtLdDJsOGs2eG9NUEtBdXVs?=
 =?utf-8?B?bXp4NnhoTXB1T3NaM2lMTmEzSlBVTUo4d0FZdkFQNTl1NmEvcEFKVm8rN21W?=
 =?utf-8?B?N0FZRWludzBCSVM2bGMyOFdEdVg4Rkcxa3puN2hkdlVxTUg5WjRWZ3lhQlZY?=
 =?utf-8?B?MmpURHl5ZGhFUVByOGN4a1VVelllZTNHenhkRWlUUFRSUUpXcGtCOTl5OWNu?=
 =?utf-8?B?Q2h1ejZFbnpYTEFSaFNIbjNML3dSMW04VS9HUmhFUVlQNXhFYktOTWVMTzdF?=
 =?utf-8?B?MXJ4ajhRVlMxeHlJeVhiWCtOUkxEY3pXWGtnSXB3OXEvMGZ1aW9HbVQwT29N?=
 =?utf-8?B?UzhLOVpUWFBJYVVwTlFMbUlmaVdxQ1RhM0lGR1EyZ0w3ZU1LZkY3T2RkTVVC?=
 =?utf-8?B?OEE3cmRTTkhIYTNaQlVxd3d1akFTUHdoWWdKM2IxVVFhQU40eVJ2aTl6eUxX?=
 =?utf-8?B?TDU0WWpydTYyOWZPWDhxMzA3ZDF0a0FGbWtlUGcyZkR5WWpkNXNWdndJZ1Rj?=
 =?utf-8?B?WHNUZm4vM3pvRnRCdnh1UnJtaDVTc0pvNDViMllWWnUvdmJBUCtBamxSWjAv?=
 =?utf-8?B?WHB3cTl4U1NPQ1BZSDl4dkVLS3NNMThncGlGaGZMeUxaN05sT1NpdDdocjVr?=
 =?utf-8?B?WkFVRjVzZ2V6enFhOFhzN3NjbGxaT1V4dHhTQmJZZEJaUHdMb0FXQ2hPVVls?=
 =?utf-8?B?aFlaNDZwazJ4RUdTZlFmRStIc1hPczlQNWQrZFV1Nmh3Q1BudmwrOXkrWFpC?=
 =?utf-8?B?Y21DMmF0TUFGbWNWa2RKNWx1YkZObEFHbklsQ2NCRUExb09IMVBiZ2RFU1hk?=
 =?utf-8?B?MmErdFJSeThvVjArakRYclgrUkpDQjhwa3N0bW01KzZPYU9DMjBSSlQzUWJM?=
 =?utf-8?B?a0NadzFLUmMxRlJ5MkZhU254eUFLdEhwa2p1NDViUFlRM3c5QktFeVNMUnJV?=
 =?utf-8?B?RWZzcU9KcmNnVzhKYjhwMysxUHJkN0VaK09VZDk0Sk9Yak1ORk9ETXlCaWlu?=
 =?utf-8?B?eVpCMVkxL2U1TWUwR3pzZFk2QWgzcll6NVM2Q0hwRnUxbzl4RWwyd1dHWERH?=
 =?utf-8?B?Q3ltKzc1Ylc2TElMVzRTQmJRSTVNK3BIT09YdGh6a2txdHFIMEV6MXJxNG5L?=
 =?utf-8?B?dnQ5NTFnUHIycDlnbkN6TDBuMUFFT00vazN6ejlaL1JyVHMwSjJGcmlEUk1J?=
 =?utf-8?B?Q05lbEZRUW5nd3Uvc3dZRUMyWmVxSDhQRU5EcUJHSkRHSnpILzJjcE1MbGRG?=
 =?utf-8?B?Ym1QMGYzeTMycURKMDFTM3loK0xQS254aVhJNW40K0lEWHpzUTN4cjJGemsr?=
 =?utf-8?B?b3Ztak1JSlE2OC9kT3E5QVVmcTN2aXh1UWRUZEQvRjNCUTcrMndtSmxPNkJr?=
 =?utf-8?B?RWl2K0lRM1k5VURQUXlHNjRiMGU2bW5ZRElpSGNhS1cyRkZPUlpQenNVRndF?=
 =?utf-8?B?aVpLeENWNU9sejUybEl1YUN5VXZwMTZJTThaYXhGUEtDT1hFTExXR0sxc0lo?=
 =?utf-8?B?bU4rb1VSVThoWFdyWUhoQjA2L2llanY3QzF1K0tuWjhGM2VRSm5oVnE2am93?=
 =?utf-8?B?dUpHdFNrUmtxZU1tdm0xaFdFblBDWW4vM1czU3JEN0ZrOVk4Um1HcjhLTEl3?=
 =?utf-8?B?eFVwWlZwZENiSVg3UVJ3bFVGRzVUMEpYTmsxaC9GdVdseEIycS9Nb2VIVmg0?=
 =?utf-8?B?WUpuTjZtTTBhQ29FbUhXanVIYlZVbGZUMFhvZEtmV2M2RVpzZmIwVERNcEUx?=
 =?utf-8?B?cEU1U1JPbkRUS0JDZFE3ckRmbjFaemlrVEdIc0trRjNENjdVZGZ1VnltUTRE?=
 =?utf-8?B?THRweXEwN1J0NlBiU1lFZCtpVkV6Ym9Yb0UxVlVqMmM1Zk5najVhRWM5bEsr?=
 =?utf-8?Q?nouDo/JiKjk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?My92cmZFajZRalk3aDh1dkNrQnM4alF4NXIzOXZMdlJTTGZZeTM3OXU2RUty?=
 =?utf-8?B?aUNKMERiaGRaUjdWTENTK25GSjQwYmpIVUdhK0NIWm5yWWplUmMvRlFtS1or?=
 =?utf-8?B?VGpuaGlBRGFDQkVxWjdWcmVqemhvZTJ2c3k4cFZXQ3Rrb21Ld1A5YkhSb1Rp?=
 =?utf-8?B?RW5odVh1MVBXY2l6d1gwUm05QjVBZkMyRTNRY1N0dUJxU1RYR3l4bU1XVDBu?=
 =?utf-8?B?Z2owWlRYTzc5SmxWQjJCWm01ZUhPcncvekpESzQ4Wm5vTVJORzhscGorVjdt?=
 =?utf-8?B?SG5zN2prZnVaZmNzTEx3UU45UFlocmp4NFpWZDJpV2hFUXJhaS9XbXZUUkhJ?=
 =?utf-8?B?OEMwVTExNmRDQWdEL2x6STR0RHdFZ0pPSndkR2R4bkxlTHhoNWlpOG93alZL?=
 =?utf-8?B?bDNhMHpaSVRudVZOUWpyQXFqTCthN2x2c3pZaHkwQVR0Y1pzeFZXQS9PTzU0?=
 =?utf-8?B?TU4zYUg3YkVWYU9IWlhac2NUQzhXVUgxVFRrUlkxTnBLdWMreXVnQjVHWU83?=
 =?utf-8?B?SGVCbGtRaTFMbUplaW8vUjRLa0RNZXkvekZsTHpRbXI4NDExZEJlK09MU0pE?=
 =?utf-8?B?bWpmZXYwZ3JVUWV4cTJiL3I0NnZ4MEFJOWRpV1pMSHdsUnN1TUp3WHF2b2V4?=
 =?utf-8?B?MzNURDNhK2JwaTFKbTFqOWRGVHZsc2tnN3JJVFlJZHlleVlFUldUb2V5M05X?=
 =?utf-8?B?d08xaGxTQzZVLzI0cGZLRlVtOEk0MU1sNTdxTk9zVWtCOUxWTCs4dmdHL3oy?=
 =?utf-8?B?b1EwdGQwSWd3YTgzdE5lRHgvVkZYWXpsNDk3UHRRQlp4enZGQ3BycTBKUHgz?=
 =?utf-8?B?V0l5Yk85M2V1ZEJrMDdrb3lINllIM3k2dmJJZjlRb1VUZHN4MUZENlB4K0Zn?=
 =?utf-8?B?ZVNqdWZyM09jMmF6ZXZFL01VazIzVE1RVDlKSHVsdTl6Q0RXaWRPdk5RK2JQ?=
 =?utf-8?B?U1NCZzR6WjhTd2V5YXVBRWM5aDhUT3V6ZHNTNUU4VitibGdkeGxmVEFxUGVE?=
 =?utf-8?B?TTJNb2NYQmt2aHlHcXF3QW1JWnE3elFVcjFUVUp5bCtYTGY2TDA5dklQTU00?=
 =?utf-8?B?VG52YWJwVU1YT21ZWlNTVmUyZzdnTjRPaG9xSHhici8rSEZlL3F3NXlLZjc2?=
 =?utf-8?B?eWh2V2ZETGRJZzZhb2VzMFM2WDhZV3dBUU50dGoyUDBVeFJOZ25PNDVEb3g1?=
 =?utf-8?B?VVpvaUt5Z1JiMXQyVy8xL280TDdPSVdKSHR6VkdOWWVaQ1hPSlU3Qnd4dVd2?=
 =?utf-8?B?M1d4Y3YzZldCMkxoRCs0YTZmRlB3MjhQZkF5SnNCa24wemlIaHBlYnd6UGJK?=
 =?utf-8?B?aWlaM2hHY3dtbnViS2QxMXVzZmF1TnhtQ0lhU0t3d0tzRzZpMmNCL04rV1ZM?=
 =?utf-8?B?bkYvc0VzelF0eFBaQ0I5TUh4WkFwT05uaUtld1lFMnI4WTZjVXQzNEI3aWlZ?=
 =?utf-8?B?TUdwL3VHdnBiNm5IN0hLWklxUXFMMnppcndiWHFvUmtYdUl4UUp1NmYwUXNW?=
 =?utf-8?B?NEszbG9VOGNOMEVUai9jak5rd0RwZElxcGE5MkNPcW1rQ0d2cktxR001NHBU?=
 =?utf-8?B?WUFtYTZJUWhQSExwQXc3bHo2V3kyYUUwZVI2V3IyUkMrb21lVjVPaC9SNWtj?=
 =?utf-8?B?NUlmV0RvWEtueHQwNEtTdCtuaDhWMVBXb0NwQldlK3AzSlRvU0FhbndyMFVq?=
 =?utf-8?B?b1V0RGhKbnlRMEZ4MnpDakVTNlpnNGc0cElhcWoxREcxZTlpTjhFZkozSHNC?=
 =?utf-8?B?cWVMK0laYUNPelpoTVVKUEdPMDlEYnhEeUxXMS9TZHZ0ZWc4d2VnNE1ZT3Jq?=
 =?utf-8?B?NWlJeGI2MEpKbHVObmZsUjVWaGVGUkFUbDJiQlhOTU1iS3pvdTFTRGM1d0p6?=
 =?utf-8?B?LytOa3ZnTE1aSExzaW5uMVArMXRvNnBHZkpVMGVuQ2t5SHFMOU5VWS9zVlgr?=
 =?utf-8?B?TVdxOVB4SkpFclk3VUovWW8yR0k5cHNlQ1VsNTFVNk45dUpGTGUvM0NMQVBr?=
 =?utf-8?B?TEVWQy9CSDhZZFY5eno1VTBjaXVYMnA0bDJ0Q3ZFdG9pWFBJbEtodmhtNGlx?=
 =?utf-8?B?N0Z2ZDRjaGtyUFFLRjV1NzlOWXVHcFBuUFRWOTlnRWJGcXAvVVd1ZEVxcjMv?=
 =?utf-8?Q?gU9XR2B/H+VErDBf/JHnd3cCw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30e5bd56-86b8-49b6-5f9e-08ddba8a5d36
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 23:35:59.2344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mzr1UIc8JIVMg5BnUeGNx43gfQvnTrtbRhXHPDW7T1Ia+jJJV2gmXNQI2UPM+PMayEOk/02z3sEAY6WM6w6aJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7459

migrate_device code paths go through the collect, setup
and finalize phases of migration. Support for MIGRATE_PFN_COMPOUND
was added earlier in the series to mark THP pages as
MIGRATE_PFN_COMPOUND.

The entries in src and dst arrays passed to these functions still
remain at a PAGE_SIZE granularity. When a compound page is passed,
the first entry has the PFN along with MIGRATE_PFN_COMPOUND
and other flags set (MIGRATE_PFN_MIGRATE, MIGRATE_PFN_VALID), the
remaining entries (HPAGE_PMD_NR - 1) are filled with 0's. This
representation allows for the compound page to be split into smaller
page sizes.

migrate_vma_collect_hole(), migrate_vma_collect_pmd() are now THP
page aware. Two new helper functions migrate_vma_collect_huge_pmd()
and migrate_vma_insert_huge_pmd_page() have been added.

migrate_vma_collect_huge_pmd() can collect THP pages, but if for
some reason this fails, there is fallback support to split the folio
and migrate it.

migrate_vma_insert_huge_pmd_page() closely follows the logic of
migrate_vma_insert_page()

Support for splitting pages as needed for migration will follow in
later patches in this series.

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

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 mm/migrate_device.c | 437 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 376 insertions(+), 61 deletions(-)

diff --git a/mm/migrate_device.c b/mm/migrate_device.c
index e05e14d6eacd..41d0bd787969 100644
--- a/mm/migrate_device.c
+++ b/mm/migrate_device.c
@@ -14,6 +14,7 @@
 #include <linux/pagewalk.h>
 #include <linux/rmap.h>
 #include <linux/swapops.h>
+#include <asm/pgalloc.h>
 #include <asm/tlbflush.h>
 #include "internal.h"
 
@@ -44,6 +45,23 @@ static int migrate_vma_collect_hole(unsigned long start,
 	if (!vma_is_anonymous(walk->vma))
 		return migrate_vma_collect_skip(start, end, walk);
 
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE |
+						MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages] = 0;
+		migrate->npages++;
+		migrate->cpages++;
+
+		/*
+		 * Collect the remaining entries as holes, in case we
+		 * need to split later
+		 */
+		return migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+	}
+
 	for (addr = start; addr < end; addr += PAGE_SIZE) {
 		migrate->src[migrate->npages] = MIGRATE_PFN_MIGRATE;
 		migrate->dst[migrate->npages] = 0;
@@ -54,57 +72,148 @@ static int migrate_vma_collect_hole(unsigned long start,
 	return 0;
 }
 
-static int migrate_vma_collect_pmd(pmd_t *pmdp,
-				   unsigned long start,
-				   unsigned long end,
-				   struct mm_walk *walk)
+/**
+ * migrate_vma_collect_huge_pmd - collect THP pages without splitting the
+ * folio for device private pages.
+ * @pmdp: pointer to pmd entry
+ * @start: start address of the range for migration
+ * @end: end address of the range for migration
+ * @walk: mm_walk callback structure
+ *
+ * Collect the huge pmd entry at @pmdp for migration and set the
+ * MIGRATE_PFN_COMPOUND flag in the migrate src entry to indicate that
+ * migration will occur at HPAGE_PMD granularity
+ */
+static int migrate_vma_collect_huge_pmd(pmd_t *pmdp, unsigned long start,
+					unsigned long end, struct mm_walk *walk,
+					struct folio *fault_folio)
 {
+	struct mm_struct *mm = walk->mm;
+	struct folio *folio;
 	struct migrate_vma *migrate = walk->private;
-	struct folio *fault_folio = migrate->fault_page ?
-		page_folio(migrate->fault_page) : NULL;
-	struct vm_area_struct *vma = walk->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long addr = start, unmapped = 0;
 	spinlock_t *ptl;
-	pte_t *ptep;
+	swp_entry_t entry;
+	int ret;
+	unsigned long write = 0;
 
-again:
-	if (pmd_none(*pmdp))
+	ptl = pmd_lock(mm, pmdp);
+	if (pmd_none(*pmdp)) {
+		spin_unlock(ptl);
 		return migrate_vma_collect_hole(start, end, -1, walk);
+	}
 
 	if (pmd_trans_huge(*pmdp)) {
-		struct folio *folio;
-
-		ptl = pmd_lock(mm, pmdp);
-		if (unlikely(!pmd_trans_huge(*pmdp))) {
+		if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM)) {
 			spin_unlock(ptl);
-			goto again;
+			return migrate_vma_collect_skip(start, end, walk);
 		}
 
 		folio = pmd_folio(*pmdp);
 		if (is_huge_zero_folio(folio)) {
 			spin_unlock(ptl);
-			split_huge_pmd(vma, pmdp, addr);
-		} else {
-			int ret;
+			return migrate_vma_collect_hole(start, end, -1, walk);
+		}
+		if (pmd_write(*pmdp))
+			write = MIGRATE_PFN_WRITE;
+	} else if (!pmd_present(*pmdp)) {
+		entry = pmd_to_swp_entry(*pmdp);
+		folio = pfn_swap_entry_folio(entry);
+
+		if (!is_device_private_entry(entry) ||
+			!(migrate->flags & MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
+			(folio->pgmap->owner != migrate->pgmap_owner)) {
+			spin_unlock(ptl);
+			return migrate_vma_collect_skip(start, end, walk);
+		}
 
-			folio_get(folio);
+		if (is_migration_entry(entry)) {
+			migration_entry_wait_on_locked(entry, ptl);
 			spin_unlock(ptl);
-			/* FIXME: we don't expect THP for fault_folio */
-			if (WARN_ON_ONCE(fault_folio == folio))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			if (unlikely(!folio_trylock(folio)))
-				return migrate_vma_collect_skip(start, end,
-								walk);
-			ret = split_folio(folio);
-			if (fault_folio != folio)
-				folio_unlock(folio);
-			folio_put(folio);
-			if (ret)
-				return migrate_vma_collect_skip(start, end,
-								walk);
+			return -EAGAIN;
 		}
+
+		if (is_writable_device_private_entry(entry))
+			write = MIGRATE_PFN_WRITE;
+	} else {
+		spin_unlock(ptl);
+		return -EAGAIN;
+	}
+
+	folio_get(folio);
+	if (folio != fault_folio && unlikely(!folio_trylock(folio))) {
+		spin_unlock(ptl);
+		folio_put(folio);
+		return migrate_vma_collect_skip(start, end, walk);
+	}
+
+	if (thp_migration_supported() &&
+		(migrate->flags & MIGRATE_VMA_SELECT_COMPOUND) &&
+		(IS_ALIGNED(start, HPAGE_PMD_SIZE) &&
+		 IS_ALIGNED(end, HPAGE_PMD_SIZE))) {
+
+		struct page_vma_mapped_walk pvmw = {
+			.ptl = ptl,
+			.address = start,
+			.pmd = pmdp,
+			.vma = walk->vma,
+		};
+
+		unsigned long pfn = page_to_pfn(folio_page(folio, 0));
+
+		migrate->src[migrate->npages] = migrate_pfn(pfn) | write
+						| MIGRATE_PFN_MIGRATE
+						| MIGRATE_PFN_COMPOUND;
+		migrate->dst[migrate->npages++] = 0;
+		migrate->cpages++;
+		ret = set_pmd_migration_entry(&pvmw, folio_page(folio, 0));
+		if (ret) {
+			migrate->npages--;
+			migrate->cpages--;
+			migrate->src[migrate->npages] = 0;
+			migrate->dst[migrate->npages] = 0;
+			goto fallback;
+		}
+		migrate_vma_collect_skip(start + PAGE_SIZE, end, walk);
+		spin_unlock(ptl);
+		return 0;
+	}
+
+fallback:
+	spin_unlock(ptl);
+	ret = split_folio(folio);
+	if (fault_folio != folio)
+		folio_unlock(folio);
+	folio_put(folio);
+	if (ret)
+		return migrate_vma_collect_skip(start, end, walk);
+	if (pmd_none(pmdp_get_lockless(pmdp)))
+		return migrate_vma_collect_hole(start, end, -1, walk);
+
+	return -ENOENT;
+}
+
+static int migrate_vma_collect_pmd(pmd_t *pmdp,
+				   unsigned long start,
+				   unsigned long end,
+				   struct mm_walk *walk)
+{
+	struct migrate_vma *migrate = walk->private;
+	struct vm_area_struct *vma = walk->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long addr = start, unmapped = 0;
+	spinlock_t *ptl;
+	struct folio *fault_folio = migrate->fault_page ?
+		page_folio(migrate->fault_page) : NULL;
+	pte_t *ptep;
+
+again:
+	if (pmd_trans_huge(*pmdp) || !pmd_present(*pmdp)) {
+		int ret = migrate_vma_collect_huge_pmd(pmdp, start, end, walk, fault_folio);
+
+		if (ret == -EAGAIN)
+			goto again;
+		if (ret == 0)
+			return 0;
 	}
 
 	ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
@@ -175,8 +284,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
 			mpfn |= pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
 		}
 
-		/* FIXME support THP */
-		if (!page || !page->mapping || PageTransCompound(page)) {
+		if (!page || !page->mapping) {
 			mpfn = 0;
 			goto next;
 		}
@@ -347,14 +455,6 @@ static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
 	 */
 	int extra = 1 + (page == fault_page);
 
-	/*
-	 * FIXME support THP (transparent huge page), it is bit more complex to
-	 * check them than regular pages, because they can be mapped with a pmd
-	 * or with a pte (split pte mapping).
-	 */
-	if (folio_test_large(folio))
-		return false;
-
 	/* Page from ZONE_DEVICE have one extra reference */
 	if (folio_is_zone_device(folio))
 		extra++;
@@ -385,17 +485,24 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 	lru_add_drain();
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct folio *folio;
+		unsigned int nr = 1;
 
 		if (!page) {
 			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
 				unmapped++;
-			continue;
+			goto next;
 		}
 
 		folio =	page_folio(page);
+		nr = folio_nr_pages(folio);
+
+		if (nr > 1)
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+
+
 		/* ZONE_DEVICE folios are not on LRU */
 		if (!folio_is_zone_device(folio)) {
 			if (!folio_test_lru(folio) && allow_drain) {
@@ -407,7 +514,7 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 			if (!folio_isolate_lru(folio)) {
 				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 				restore++;
-				continue;
+				goto next;
 			}
 
 			/* Drop the reference we took in collect */
@@ -426,10 +533,12 @@ static unsigned long migrate_device_unmap(unsigned long *src_pfns,
 
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 			restore++;
-			continue;
+			goto next;
 		}
 
 		unmapped++;
+next:
+		i += nr;
 	}
 
 	for (i = 0; i < npages && restore; i++) {
@@ -575,6 +684,146 @@ int migrate_vma_setup(struct migrate_vma *args)
 }
 EXPORT_SYMBOL(migrate_vma_setup);
 
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+/**
+ * migrate_vma_insert_huge_pmd_page: Insert a huge folio into @migrate->vma->vm_mm
+ * at @addr. folio is already allocated as a part of the migration process with
+ * large page.
+ *
+ * @folio needs to be initialized and setup after it's allocated. The code bits
+ * here follow closely the code in __do_huge_pmd_anonymous_page(). This API does
+ * not support THP zero pages.
+ *
+ * @migrate: migrate_vma arguments
+ * @addr: address where the folio will be inserted
+ * @folio: folio to be inserted at @addr
+ * @src: src pfn which is being migrated
+ * @pmdp: pointer to the pmd
+ */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	struct vm_area_struct *vma = migrate->vma;
+	gfp_t gfp = vma_thp_gfp_mask(vma);
+	struct folio *folio = page_folio(page);
+	int ret;
+	spinlock_t *ptl;
+	pgtable_t pgtable;
+	pmd_t entry;
+	bool flush = false;
+	unsigned long i;
+
+	VM_WARN_ON_FOLIO(!folio, folio);
+	VM_WARN_ON_ONCE(!pmd_none(*pmdp) && !is_huge_zero_pmd(*pmdp));
+
+	if (!thp_vma_suitable_order(vma, addr, HPAGE_PMD_ORDER))
+		return -EINVAL;
+
+	ret = anon_vma_prepare(vma);
+	if (ret)
+		return ret;
+
+	folio_set_order(folio, HPAGE_PMD_ORDER);
+	folio_set_large_rmappable(folio);
+
+	if (mem_cgroup_charge(folio, migrate->vma->vm_mm, gfp)) {
+		count_vm_event(THP_FAULT_FALLBACK);
+		count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_FALLBACK_CHARGE);
+		ret = -ENOMEM;
+		goto abort;
+	}
+
+	__folio_mark_uptodate(folio);
+
+	pgtable = pte_alloc_one(vma->vm_mm);
+	if (unlikely(!pgtable))
+		goto abort;
+
+	if (folio_is_device_private(folio)) {
+		swp_entry_t swp_entry;
+
+		if (vma->vm_flags & VM_WRITE)
+			swp_entry = make_writable_device_private_entry(
+						page_to_pfn(page));
+		else
+			swp_entry = make_readable_device_private_entry(
+						page_to_pfn(page));
+		entry = swp_entry_to_pmd(swp_entry);
+	} else {
+		if (folio_is_zone_device(folio) &&
+		    !folio_is_device_coherent(folio)) {
+			goto abort;
+		}
+		entry = folio_mk_pmd(folio, vma->vm_page_prot);
+		if (vma->vm_flags & VM_WRITE)
+			entry = pmd_mkwrite(pmd_mkdirty(entry), vma);
+	}
+
+	ptl = pmd_lock(vma->vm_mm, pmdp);
+	ret = check_stable_address_space(vma->vm_mm);
+	if (ret)
+		goto abort;
+
+	/*
+	 * Check for userfaultfd but do not deliver the fault. Instead,
+	 * just back off.
+	 */
+	if (userfaultfd_missing(vma))
+		goto unlock_abort;
+
+	if (!pmd_none(*pmdp)) {
+		if (!is_huge_zero_pmd(*pmdp))
+			goto unlock_abort;
+		flush = true;
+	} else if (!pmd_none(*pmdp))
+		goto unlock_abort;
+
+	add_mm_counter(vma->vm_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+	folio_add_new_anon_rmap(folio, vma, addr, RMAP_EXCLUSIVE);
+	if (!folio_is_zone_device(folio))
+		folio_add_lru_vma(folio, vma);
+	folio_get(folio);
+
+	if (flush) {
+		pte_free(vma->vm_mm, pgtable);
+		flush_cache_page(vma, addr, addr + HPAGE_PMD_SIZE);
+		pmdp_invalidate(vma, addr, pmdp);
+	} else {
+		pgtable_trans_huge_deposit(vma->vm_mm, pmdp, pgtable);
+		mm_inc_nr_ptes(vma->vm_mm);
+	}
+	set_pmd_at(vma->vm_mm, addr, pmdp, entry);
+	update_mmu_cache_pmd(vma, addr, pmdp);
+
+	spin_unlock(ptl);
+
+	count_vm_event(THP_FAULT_ALLOC);
+	count_mthp_stat(HPAGE_PMD_ORDER, MTHP_STAT_ANON_FAULT_ALLOC);
+	count_memcg_event_mm(vma->vm_mm, THP_FAULT_ALLOC);
+
+	return 0;
+
+unlock_abort:
+	spin_unlock(ptl);
+abort:
+	for (i = 0; i < HPAGE_PMD_NR; i++)
+		src[i] &= ~MIGRATE_PFN_MIGRATE;
+	return 0;
+}
+#else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
+static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
+					 unsigned long addr,
+					 struct page *page,
+					 unsigned long *src,
+					 pmd_t *pmdp)
+{
+	return 0;
+}
+#endif
+
 /*
  * This code closely matches the code in:
  *   __handle_mm_fault()
@@ -585,9 +834,10 @@ EXPORT_SYMBOL(migrate_vma_setup);
  */
 static void migrate_vma_insert_page(struct migrate_vma *migrate,
 				    unsigned long addr,
-				    struct page *page,
+				    unsigned long *dst,
 				    unsigned long *src)
 {
+	struct page *page = migrate_pfn_to_page(*dst);
 	struct folio *folio = page_folio(page);
 	struct vm_area_struct *vma = migrate->vma;
 	struct mm_struct *mm = vma->vm_mm;
@@ -615,8 +865,25 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
 	pmdp = pmd_alloc(mm, pudp, addr);
 	if (!pmdp)
 		goto abort;
-	if (pmd_trans_huge(*pmdp))
-		goto abort;
+
+	if (thp_migration_supported() && (*dst & MIGRATE_PFN_COMPOUND)) {
+		int ret = migrate_vma_insert_huge_pmd_page(migrate, addr, page,
+								src, pmdp);
+		if (ret)
+			goto abort;
+		return;
+	}
+
+	if (!pmd_none(*pmdp)) {
+		if (pmd_trans_huge(*pmdp)) {
+			if (!is_huge_zero_pmd(*pmdp))
+				goto abort;
+			folio_get(pmd_folio(*pmdp));
+			split_huge_pmd(vma, pmdp, addr);
+		} else if (pmd_leaf(*pmdp))
+			goto abort;
+	}
+
 	if (pte_alloc(mm, pmdp))
 		goto abort;
 	if (unlikely(anon_vma_prepare(vma)))
@@ -707,23 +974,24 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 	unsigned long i;
 	bool notified = false;
 
-	for (i = 0; i < npages; i++) {
+	for (i = 0; i < npages; ) {
 		struct page *newpage = migrate_pfn_to_page(dst_pfns[i]);
 		struct page *page = migrate_pfn_to_page(src_pfns[i]);
 		struct address_space *mapping;
 		struct folio *newfolio, *folio;
 		int r, extra_cnt = 0;
+		unsigned long nr = 1;
 
 		if (!newpage) {
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		if (!page) {
 			unsigned long addr;
 
 			if (!(src_pfns[i] & MIGRATE_PFN_MIGRATE))
-				continue;
+				goto next;
 
 			/*
 			 * The only time there is no vma is when called from
@@ -741,15 +1009,47 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 					migrate->pgmap_owner);
 				mmu_notifier_invalidate_range_start(&range);
 			}
-			migrate_vma_insert_page(migrate, addr, newpage,
+
+			if ((src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
+				nr = HPAGE_PMD_NR;
+				src_pfns[i] &= ~MIGRATE_PFN_COMPOUND;
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+				goto next;
+			}
+
+			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
 						&src_pfns[i]);
-			continue;
+			goto next;
 		}
 
 		newfolio = page_folio(newpage);
 		folio = page_folio(page);
 		mapping = folio_mapping(folio);
 
+		/*
+		 * If THP migration is enabled, check if both src and dst
+		 * can migrate large pages
+		 */
+		if (thp_migration_supported()) {
+			if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(src_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(dst_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+
+				if (!migrate) {
+					src_pfns[i] &= ~(MIGRATE_PFN_MIGRATE |
+							 MIGRATE_PFN_COMPOUND);
+					goto next;
+				}
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
+				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
+				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
+				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
+			}
+		}
+
+
 		if (folio_is_device_private(newfolio) ||
 		    folio_is_device_coherent(newfolio)) {
 			if (mapping) {
@@ -762,7 +1062,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 				if (!folio_test_anon(folio) ||
 				    !folio_free_swap(folio)) {
 					src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-					continue;
+					goto next;
 				}
 			}
 		} else if (folio_is_zone_device(newfolio)) {
@@ -770,7 +1070,7 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			 * Other types of ZONE_DEVICE page are not supported.
 			 */
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
-			continue;
+			goto next;
 		}
 
 		BUG_ON(folio_test_writeback(folio));
@@ -782,6 +1082,8 @@ static void __migrate_device_pages(unsigned long *src_pfns,
 			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
 		else
 			folio_migrate_flags(newfolio, folio);
+next:
+		i += nr;
 	}
 
 	if (notified)
@@ -943,10 +1245,23 @@ static unsigned long migrate_device_pfn_lock(unsigned long pfn)
 int migrate_device_range(unsigned long *src_pfns, unsigned long start,
 			unsigned long npages)
 {
-	unsigned long i, pfn;
+	unsigned long i, j, pfn;
+
+	for (pfn = start, i = 0; i < npages; pfn++, i++) {
+		struct page *page = pfn_to_page(pfn);
+		struct folio *folio = page_folio(page);
+		unsigned int nr = 1;
 
-	for (pfn = start, i = 0; i < npages; pfn++, i++)
 		src_pfns[i] = migrate_device_pfn_lock(pfn);
+		nr = folio_nr_pages(folio);
+		if (nr > 1) {
+			src_pfns[i] |= MIGRATE_PFN_COMPOUND;
+			for (j = 1; j < nr; j++)
+				src_pfns[i+j] = 0;
+			i += j - 1;
+			pfn += j - 1;
+		}
+	}
 
 	migrate_device_unmap(src_pfns, npages, NULL);
 
-- 
2.49.0

