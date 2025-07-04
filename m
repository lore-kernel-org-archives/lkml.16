Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B5C156237
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 23:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751673406; cv=fail; b=ewy9IenuhE8BJOJDLH6YwYQOqx4Hve+gv2lyxU7OAzMPjxoHzuU8gyPK/aJhg5Z3vgFjVJgJOj6fx2+0CjP56+QxM43TJswzZm64KCCcKN/Atn4M9SsdVrMzXfKQEk/wOfnDK9k99lTXv0Y26s0q801/JZ6qFQErmfH1wBkpWDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751673406; c=relaxed/simple;
	bh=K2UbGedWaQMhzV9+ckh2XHBceAfBBV91tKexn8zzavY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hne90P8X1aVRYLI4yOnOdsu9ZxNp5sXUYYkhMpIhRxmc9gKdlKwzQqtdCHKJPoXrJ5YFc9XAvWzJM6V7IJ4z4pkbKXYoKNJOV7RJPmG/kQW+IevFJcl58p9E/5e7KjiaBUHDNR7VCWsLS6NhagoIFZ90UB3bStM0PNbwJBD70DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sULqH4Ff; arc=fail smtp.client-ip=40.107.94.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sULqH4Ff"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/6XVSt+njWbMjBfS0AOKr6DV/iv631xMiATbgHaQN0ePte6YO87RYwOWz02uItQtu7GvxBsNUQ2EOY5k0H3sUdymG1yAntx8BHHyHcP91XB2cC3uGYVPBsl4cw5mFfTKjEuyjLhn4K3T6TJeSsqIojc+zWvTlmg5hzo/cAm8JJa9TFaaom7CBL/oHQ7L/PDiZm0ZO9vZXp6g7P6Mc2urM1UPvVenGZW69HQPqyj7IBRkJJdpEFSb4j7L2wUr1S+uY4PLkQ6m7yu0byepHmV9fJ+OdYiQKKsWeaGWYEPDgOLBb8biNb3UJCHeYs9Y0vO17BRc5FfY1ka77eyCFUSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJBcTKpkEllR+Ee9GcjtvcSXVpion9kbTIA1yPpIC7E=;
 b=aI2ttjjlGAFa8C0CIV8CiX9qfvrtQ1+eBhCh4HaS3j290YqH4Xu+9vOWfsFs4asXEtPNXMfX2CtvR7gxSBT4SJ56ecqa3/qMFqZXZTuHx1wPhwSxmvNctw+7SmuhLgB/pCqm5frEcQTnGG+jJiLlfImzz44MO25N90CbYtFAyd8YmLxPiAJs0P7L/FLD7HKmrhLCdBx9T8dzs9ekBWmmpO2gPyb/X38fctsxM2VD8Tz88cvxugS1edf0oVYx4t2CrrdsqZ5mM1D9Rv5lJ+HeTLbm/ZhrH2oKUxB3RcgDdA2VKsl7xdwvR6nbSc06REJbs98AURM2PCBInqiJy1b5Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJBcTKpkEllR+Ee9GcjtvcSXVpion9kbTIA1yPpIC7E=;
 b=sULqH4FfcPKzVcuJm5V1mKeqsmruOzByH1CeqeTLfF4kL0tKWoNRe4bq+09ofwn7ZzA15uuC66QkzZnie+eL5b0ENq1kj1i1JxnAExOW7b57jcMtDywlAvCnaOQUVrtpz5UkVMj2HWCusb+uE6CSHAOF75eEHpDZhWFfYgsBmTE69i/iPzXrR8qW5FLmlAiebQCYqCoV9qZwTTXN0vYa6tEjchvq4pWQN636DYYhQ1Y7BgvtNWF59uTMhuR4LYaDf6R+T1wz+RBHWNLYYm1kh9bCyPDLEcbAm/s6UQU5V/sZA1KEUjs3lVROJMfw86AJQ32nzRav+Pi3zCNWnf19CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ5PPFDF5E260D0.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Fri, 4 Jul
 2025 23:56:42 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%4]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 23:56:42 +0000
Message-ID: <5a01f170-ce04-4f2c-b692-56469ebeb72c@nvidia.com>
Date: Sat, 5 Jul 2025 09:56:36 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v1 resend 00/12] THP support for zone device page migration
To: Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Shuah Khan <shuah@kernel.org>, David Hildenbrand <david@redhat.com>,
 Barry Song <baohua@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Matthew Wilcox <willy@infradead.org>,
 Peter Xu <peterx@redhat.com>, Kefeng Wang <wangkefeng.wang@huawei.com>,
 Jane Chu <jane.chu@oracle.com>, Alistair Popple <apopple@nvidia.com>,
 Donet Tom <donettom@linux.ibm.com>
References: <20250703233511.2028395-1-balbirs@nvidia.com>
 <106174EE-0E89-49DC-AF9D-76BE74FD2C18@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <106174EE-0E89-49DC-AF9D-76BE74FD2C18@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ2PR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a03:505::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ5PPFDF5E260D0:EE_
X-MS-Office365-Filtering-Correlation-Id: c82ddac0-d442-4d64-20dc-08ddbb566c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STNNRnlxWHlCU3Yzbi9xU05kbHM1L3pBbU0vcDhXZkwvbklLbXQvalQwM3N1?=
 =?utf-8?B?QzcwWlR2dyt2KzROLzN3Vlh3RW14NzV0czQzTW1jUkNFQmVTb0VGTjFQa2tn?=
 =?utf-8?B?NktiODZCVTRwRStQMnYyejg2NWRmbThlVnhYdTRlT0kvTERsUktaOXNpM0J3?=
 =?utf-8?B?N0VPbTZCTkVQYy9kTWtwVG1KU0dhdy93Q2tPMjBPVUwrckxDVTJxT01GbmE4?=
 =?utf-8?B?RWhLeXJxZGExR28vRGJINWpOY1NvN3NYVjRFMDVVNkFQNjNXVFVQYXlWK2pB?=
 =?utf-8?B?bnBQTG9GRkRHWU1wOWQ2NFRISXZ0SHdlcWN6aHZDQUtrY1dpYjhWRFBjbExp?=
 =?utf-8?B?dmxLUXl3d2NubThXbkY2VnRiY1ZVL3NnM0tjTGMwcHRHeEtTNEVhaldES2pN?=
 =?utf-8?B?ZC8xdVNIb3Z1SkJHdmd6d2xnMTFIdmNndk9PbU55OEtOSUg5UEkxWXlnWUdt?=
 =?utf-8?B?Qmlha09hVTRFaVRFZ3lJUXYwQ2kvSjVOQ3RWQjFhdXhVbXc3aU9pVFNyT05D?=
 =?utf-8?B?a0VJcE9wSGxvVG50ZGlBSlpoWGIrenhRVFNES0hVRllhTHlxaGVLT2RGRGk0?=
 =?utf-8?B?c2hUSGxxVnVzdCtkenVXKzA3YitEQzhsUDFORXU3eCs1WVRGK2lrSFNndDhi?=
 =?utf-8?B?SG9KMUpmOWVTTktRaVV0T0xNYzJsRDZZanJyeGV1MzN6cVJjKytvQkExTEVJ?=
 =?utf-8?B?MFFqRWpiODNDNnNtbGxLMmNkdmlWNWZVejZRYUdJT3V3VjZRS3V3dWt6NUlw?=
 =?utf-8?B?ekQwQ0pQTUFlNDRTc3Jtb0lIYkhBSSs3cFBLVWNiZmc3VG4ySVVwSndVd0tm?=
 =?utf-8?B?SFkvL3QyWjBFZFM0Ri8wdlNCWkhhMWlrSEUzRFFNbWlJbFRsYlRRenFqdnR4?=
 =?utf-8?B?Q3hNUG5lVmI1Y21YZ3Z0WWMveUxRay9odGwyc0gzbUU0NUg3QWRsZ3cyOHVN?=
 =?utf-8?B?aVY1cjc4blMxQTNwWGJya2c4ODJpK3NaenlDTVVSMGVOeG9vN21pa3hlcW1n?=
 =?utf-8?B?NzRvNGljbDJBcGZDSE96bUtoVS9HUWQwN0FZNTBwd1pOQ3ZWVlgxRzlOTXJY?=
 =?utf-8?B?QnBoWVovS0NyN2x1VHVGNkxGTnU0Z01vUk9wdGZCKzNEV2FzMjQ0QXhDaGNH?=
 =?utf-8?B?Z3hkZ3cwcGdGWXV3dml2UjNTeFZtNVdvbWNLZ0dHaEhzaE81VmYzTFdNeDAr?=
 =?utf-8?B?YVBkTzl4VlRyK3NqRVlraVNvdkJpcXJWd09iVWVHUHVteHNHd0F5dFBXOXFs?=
 =?utf-8?B?dUdKeGF2blFyR1lMbmtGYjhOTWZaTFE4bFNvNVFjWmpZZDhONWxIM1VwVzEy?=
 =?utf-8?B?L1puQWJrSFpJL1RUVjV5RENyWGNrZWFaOVhVc3kyZU81Z3dnek82WjJzZjRk?=
 =?utf-8?B?U0lVaTJ4SVBYWDBFNVRNaFRVbkwybmxUczczZ09uekpaRVNoSlFBaDJFOURQ?=
 =?utf-8?B?YlQzQzhhR3VCM3dMdDJRQ2hIVFRiVEErSXRTTWZSVjV3djd4RHVQSnlVMWdy?=
 =?utf-8?B?dWRkbXdWWUZ4ZS9JVUdVWGlCcnNiVVhibUF6MW9LVWFwVHpwSUp6WllkOUpx?=
 =?utf-8?B?WlBJcWpHZGRyTEJ6NGthMmVpU2hIcEZGZnpQRVdrd2V2Y0JGQ2dublN2QTRv?=
 =?utf-8?B?KzBEenVnSjZTTFBlUmJOb2J1NGZ3S2hkYzJnaERULzVPU0oyWkhvY25jSi9X?=
 =?utf-8?B?UDh4UUVMYm1tWWpQbmVFVTd5b2Zwb0tSSnhuK2c1eExKQjlESmdiZ0xsWitF?=
 =?utf-8?B?a1lTdVVmV0xwb2hEYlJ5c1o4U1BEQ0Jmdmw0WUlUVFRIaVU0TURIcGxKZUYr?=
 =?utf-8?B?ZlI0Rm55cmRGZHc2QnZpa2djNFBIaWcvOW5NdmtVVG5wb2pIbEhUMnpYQXF4?=
 =?utf-8?B?bUJqa2NWNkJmVFJLRGRWckU1VDhKampuUnY2ZHN2Q2Fyb3hMcWNZaW9rbmc1?=
 =?utf-8?Q?6W8eoMg0rRM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR12MB7277.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0hndE1qeGxmQ3dBNW5LUWQ1QWZKQkVvMGkybUxqNElWVm5xaHlnQytpdEdm?=
 =?utf-8?B?aEdKZldyQm5rK1lSRE9FRFlwdjh6Ym5HYklLTEhVcFUxNDZiemo4QkhMUWFx?=
 =?utf-8?B?S0JIeldiLzJJQ0p5eDlseHVQVTN6YUMxUFhVQ1FyeTd0cFpvZk5uV0xDaG9V?=
 =?utf-8?B?OUFxVndzWTFOMU1oMEZQcDk5RitqZW96c0hHaG1JTytVY3QxTXJiOVY3a2du?=
 =?utf-8?B?QW56UE9hTHdYZFV1Rmg2V2xTWVQ1L0tWSkQ4dGVuWmN0VXpSYysyQnZDTTFj?=
 =?utf-8?B?U01Ob1ViNlkvaVNlWEwzVkYwV3hLc2VidGxLMS9Lang4eUNwajNVSGRHV0dZ?=
 =?utf-8?B?Q0o2aFd3Y1V6Ri9OTWNxdWZCeDIvZVM4QkxiQ2tDdE1aNk04WGZwZlVhb1NP?=
 =?utf-8?B?UTR2T3pMK2tWT09LcmV1R04zaDNNTm5DdE0wQ0ZxUWZxSkg3bDNkbE01S0RO?=
 =?utf-8?B?eTNFaldXQU8ya0JjcW1qcVAzMkl1YkliU0ZUTFo3S0NqcDNvNmV2bnpuWEkw?=
 =?utf-8?B?VnBLTW5jU0hVeWVrb3hNMno0bVJONTJpNTZVMThjVzBZWkFQSXpDZVRlVFFN?=
 =?utf-8?B?bWtiQlVuNUg2Yk5pVVA5TEFTbFdtUEVlMXU4YmtPNWpKNWVwTVdzUGpicFpq?=
 =?utf-8?B?TWY1MG5VNXFHbldUK1lWUSsyR29jakh6V0lock91UmF6TGtKME55MENVR1Fk?=
 =?utf-8?B?TGhRUHpiVjQweEN3Q2RGVjlQSDA1NHN0S1kxczJYbWJYWU9HN2hlVlFjWm1R?=
 =?utf-8?B?SVBZeG01ZERuNzhwd1FLaW9sZ1I2eGVad2swck9KSUVJSzREbCt6ZWNUZVVk?=
 =?utf-8?B?QitWdmJZU292VWo4S1hTZWtNb1A5Si9qSHQxWWJyVlFCRjFPUVJ3L0dMNXBk?=
 =?utf-8?B?dzhjQjUyajZaWksrbktSckhtTE1OeXk4WGpHS3MwNGZWSkt5b3E5UWRGQlp1?=
 =?utf-8?B?SVlibndxdlh3My9TWGxDenRSM2VLblEvNlprU09zbjN3U0dsaGdRV3ZTbjBy?=
 =?utf-8?B?aExuR20zMU96aUFPTXZyamU5a2k2MGpzNVNXdWc3Tm9sWXVpYXgyaExZQXNO?=
 =?utf-8?B?RmthRGljRWhaVVZMQnBmRW5SSDl3cEkzczZmZ01JUWp4MVp6YURjVmhSMTNq?=
 =?utf-8?B?M1ZmRHFOM0RmSTJSL1g2aElYN21QQjdaNmdKV3l3S1pxckhEcGFackIrdEph?=
 =?utf-8?B?VHEvRTZZQ3VneDhNQ0Y1dmN0Q2MvQkk2dHJ6YWpWSEtCeHBKa3cwSGlEYitM?=
 =?utf-8?B?TGZmRHVvSEhBYzFDaWNEL0doMXdhclNUNkdzRTMxcWh4aUhsbTdueitRSUE4?=
 =?utf-8?B?NDFvQ1J1OGxVQjdGbVJnQlNuQkZCajdrUzB4Tm91Y3dpSDZZbkcrYzdkbE5l?=
 =?utf-8?B?Zkdkd0tHemhLOUpZWDg1S3RzM2szZGM0Sk1NUktUNktVTkNENnJsdE0waGhK?=
 =?utf-8?B?NXZCOG54Z3didUtRTllRcWEwdWFvc3pUaVZVYmlPZFMwNGNUMldUM09yZlVq?=
 =?utf-8?B?a0hjeVZFWDhuRTlvczJoOVZkL3dYaTl5Wm5qd2hzVlVGemVyamhhWEYrVmdV?=
 =?utf-8?B?ZCtLeGNmSWJZMlp4TlZ5MURQZURyeHNVR3hoWC9qS0Y3TFJBendzWjBQRU5z?=
 =?utf-8?B?TC9PRnlRbXJ1M1pOK3dTYTN5TkhTL2FPVUhqMkdVbHNqSGZZZ2RGT3NwMVFG?=
 =?utf-8?B?VnpLN0VmODN5cHg2ZjNMMEpyMlhua2k2N3dkbWtHeVZIRGlEWnowU2JHTG1Q?=
 =?utf-8?B?ZmNER3RST0lKWEVKbGQ3dUQ4S3NFNmtVQnpNTzBsL09PNk82M0lqWVoyNWVK?=
 =?utf-8?B?MzFTNG5kVEJsNER0WGg3RUExWTRoUzlndCtoRkdhUGNRUEZDeGc5YzF6RXho?=
 =?utf-8?B?Q24rdlIwT3hBb3pxYmJJL0J0NC9QMWxwK0ljRHRTRGxXV3RLSHhRbU9XeEFV?=
 =?utf-8?B?d0FyY3NTQm9ORUN6WmJrcy90SUQ0Q3p0UGV1Z1BiRG4xN1IxZWwrSmJVVnZi?=
 =?utf-8?B?V1dicnFiRmZEdk4vRU1QUHRPSmJTRUtZT0d6c0YwMFNMcWg3eWFCZWhrN3l4?=
 =?utf-8?B?eHRNTThMemNXR0pUcjJ1cXkrUWIwYnQ4QU0xWCtxbmpGWHhGUjRhcnFoWXYv?=
 =?utf-8?Q?zqrqK4+NyfkugJGIosH0fnG5Y?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c82ddac0-d442-4d64-20dc-08ddbb566c8e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 23:56:42.1600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 663W1RDkFnvhA4UkdDeHKMklspCSbr4DmiRVtY/I8Po269kTxzjbN4q7zjpRGxJ/nL4Da93H+ClNSXY/SBmiDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFDF5E260D0

On 7/5/25 02:16, Zi Yan wrote:
> On 3 Jul 2025, at 19:34, Balbir Singh wrote:
> 
>> This patch series adds support for THP migration of zone device pages.
>> To do so, the patches implement support for folio zone device pages
>> by adding support for setting up larger order pages.
>>
>> These patches build on the earlier posts by Ralph Campbell [1]
>>
>> Two new flags are added in vma_migration to select and mark compound pages.
>> migrate_vma_setup(), migrate_vma_pages() and migrate_vma_finalize()
>> support migration of these pages when MIGRATE_VMA_SELECT_COMPOUND
>> is passed in as arguments.
>>
>> The series also adds zone device awareness to (m)THP pages along
>> with fault handling of large zone device private pages. page vma walk
>> and the rmap code is also zone device aware. Support has also been
>> added for folios that might need to be split in the middle
>> of migration (when the src and dst do not agree on
>> MIGRATE_PFN_COMPOUND), that occurs when src side of the migration can
>> migrate large pages, but the destination has not been able to allocate
>> large pages. The code supported and used folio_split() when migrating
>> THP pages, this is used when MIGRATE_VMA_SELECT_COMPOUND is not passed
>> as an argument to migrate_vma_setup().
>>
>> The test infrastructure lib/test_hmm.c has been enhanced to support THP
>> migration. A new ioctl to emulate failure of large page allocations has
>> been added to test the folio split code path. hmm-tests.c has new test
>> cases for huge page migration and to test the folio split path. A new
>> throughput test has been added as well.
>>
>> The nouveau dmem code has been enhanced to use the new THP migration
>> capability.
>>
>> Feedback from the RFC [2]:
>>
>> It was advised that prep_compound_page() not be exposed just for the purposes
>> of testing (test driver lib/test_hmm.c). Work arounds of copy and split the
>> folios did not work due to lock order dependency in the callback for
>> split folio.
>>
>> mTHP support:
>>
>> The patches hard code, HPAGE_PMD_NR in a few places, but the code has
>> been kept generic to support various order sizes. With additional
>> refactoring of the code support of different order sizes should be
>> possible.
>>
>> The future plan is to post enhancements to support mTHP with a rough
>> design as follows:
>>
>> 1. Add the notion of allowable thp orders to the HMM based test driver
>> 2. For non PMD based THP paths in migrate_device.c, check to see if
>>    a suitable order is found and supported by the driver
>> 3. Iterate across orders to check the highest supported order for migration
>> 4. Migrate and finalize
>>
>> The mTHP patches can be built on top of this series, the key design elements
>> that need to be worked out are infrastructure and driver support for multiple
>> ordered pages and their migration.
> 
> To help me better review the patches, can you tell me if my mental model below
> for device private folios is correct or not?
> 
> 1. device private folios represent device memory, but the associated PFNs
> do not exist in the system. folio->pgmap contains the meta info about
> device memory.

Yes that is right

> 
> 2. when data is migrated from system memory to device private memory, a device
> private page table entry is established in place of the original entry.
> A device private page table entry is a swap entry with a device private type.
> And the swap entry points to a device private folio in which the data resides
> in the device private memory.
> 

Yes

> 3. when CPU tries to access an address with device private page table entry,
> a fault happens and data is migrated from device private memory to system
> memory. The device private folio pointed by the device private page table
> entry tells driver where to look for the data on the device.
> 
> 4. one of the reasons causing a large device private folio split is that
> when a large device private folio is migrated back to system memory and
> there is no free large folio in system memory. So that driver splits
> the large device private folio and only migrate a subpage instead.
> 

Both the points are correct, to add to point 4, it can so happen that during
migration of memory from system to device, we might need a split as well.
Effectively the destination is unable to allocate a large page for migration


Balbir
