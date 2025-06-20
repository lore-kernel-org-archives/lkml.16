Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63842E612B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438662; cv=fail; b=BTQS1/MRFAwSx2pcQdJrwmU1XPPriRwgPuW6fAWWn1dHu5DI3abiwi3Frqoe8GSuMQMDbPI6sJR3wCBpTt9e7JyPNz+BRL5UPmusmPPYYmQFgSUpngUGH2sj/C/dI3TwsU/nSeuaa7HYjifi+ZeR/jIujCH3B2Se3WiHyBuuBiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438662; c=relaxed/simple;
	bh=Oz9KdZwjMqaYEPt3GNTmPohbqFiXIXy3lJH5o4JJflQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UAL2sL6EHPz6sSK+pFFkCfKVSB86Qrqm6/kDPkknsuElIXgBJ0xb2avtjEHX35wg9k7wjqeCzN2X3KyfxVZOxPVN3bqmvtM8hGR3z3/OHPbYOW0WN/tdsUJNza9/Egzj9YsvhXOO+XFKzp/WKEdfy4qGR+vocrPiJIuotpyBr70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxiosnAc; arc=fail smtp.client-ip=40.107.243.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxiosnAc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+TiGU/1qxMrSTGgWe4BGV+sMVYRMKK15jD+LMgi5oBQ03VRsWR+eR2Qp7qk/6ejxBx0ifpUPx3JiNADPYGiMp0FNMKG1lUK3rIvcAJMSnGPCeg2wtGWnm4U7IA3D9m5Gzqoz/T0ss+hFbukBvfYo+U7mC+SYn9by0JOvQze6m4Uy1yUauvK6JpmCQHkcf25mPk7lznya53TI83a23HG/Fvj29iuUt4ayuOIy/nnASLILXbbpdYj9K33cadwT3Sua5bbcwq3x14Id9JDpZ0Y6pQWD+jBxI8YPJ6J3Sc5pCseYAbJEa0fFGkoM0wwHLn9U/r1aKhmKZqPdlG1hLJMsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdwCaSCfLw0pbZFW73sWpJpU7N9AvrtCmySHbUQPWgs=;
 b=lcyjRf80n3IqvotJ0OYq1/t2grjrV8Oc9hCsWkjo9Gm36+3Pt9KSAo+mJXyz+egMFAX4nici5pcgTWsso4B1hAycfq+v5fmdsHsyRAbxKlwjUcdLHRZsRNDWRMZqoBp3CZjUU/QexChEmcm2ODl/LmpAJ5P4Q6ynF/H+2WqMmcx2h6KuS0VJN3CuDc1WoP/QaugzN5+lY1vORamzsktULBAkFUqQarCwlXxsBf6AtjO0cWkCK1AFBc7lgC5+1eyAxNx066Od32yQ4rhaO3aKcG8sQ6YVwWpdVCAZYJq8MloGLYzoihY4zfuOuqsEaPrgdrd+CSLcPuJB2batqybE+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdwCaSCfLw0pbZFW73sWpJpU7N9AvrtCmySHbUQPWgs=;
 b=MxiosnAcTNSAZlow9nGr8AZvJbT4cW0MOSkGKXxtWvN1olHrobI8vI1qwpeZn5hsNK02FHAHvI+exTwgvCCkfUm4Py6TQiwklk4iPHA2XV8KqveHYvNgG4qEKebuDk9D+kU5juAKfclZHiHRSZVBLyBvx5yv6oL206QTx5nVlhvexPbkzW5/lMDHAr7L5J2pQ41gPKwNKX2Hu37OnsZUTVbZEVSj6Wc4Eo7bf/SCg1ohXcX430RuW3VJlVQ1tHYySC83Al3NGFeJI/Pj0lzkXKJH7voUKbAqPbBCotXr2M5BF1TWJA0AB3WgmWpqB1CsmU41uhZsghAGFKCscnLGug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 MW6PR12MB8736.namprd12.prod.outlook.com (2603:10b6:303:244::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.20; Fri, 20 Jun 2025 16:57:37 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Fri, 20 Jun 2025
 16:57:36 +0000
From: Zi Yan <ziy@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Jann Horn <jannh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Lance Yang <ioworker0@gmail.com>,
 SeongJae Park <sj@kernel.org>, Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v2 1/5] mm/madvise: remove the visitor pattern and thread
 anon_vma state
Date: Fri, 20 Jun 2025 12:57:34 -0400
X-Mailer: MailMate (2.0r6263)
Message-ID: <7BE769D4-5601-43DB-983A-7FB8AF0FBE1B@nvidia.com>
In-Reply-To: <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
References: <cover.1750433500.git.lorenzo.stoakes@oracle.com>
 <c5094bfccb41ecd19d4e9bcaa1c4a11e00158bba.1750433500.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0217.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::12) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|MW6PR12MB8736:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ca3085a-f810-4379-15ac-08ddb01b8ee9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gEMwV5cfXeSzSfvCbnNwVDnFzYGTjS3ITDZ/Tw3q8srXX9ymA3hQDjN2aqKJ?=
 =?us-ascii?Q?cD0qSwEDSATpMtJlBcPdbC7s82qHm0wOP12Vj/kmaF9+7/YvPRct0V+8N6sf?=
 =?us-ascii?Q?g7F0JZOS+A/LvHcTV2gwYmpQvcvMiJnWOa1feCpP9iiJMUQcb0fsZ+VwhoCM?=
 =?us-ascii?Q?NxLH2otmOqeghWN2KtHGUDVBpD5zq3toAgnIBgxGDOOL5KFYeL7sHool4AvY?=
 =?us-ascii?Q?BG3R1/9GGldqcTtF3mR0CFLXxuewTh9DJD6s56oA04ZMYeHq5xZV8so5WqJq?=
 =?us-ascii?Q?gACZRZmMIVMwoFwnkswM5iQ5lFxdeoUoNrwZPgDO3bACm23RfSHPPlb0Y5Y9?=
 =?us-ascii?Q?bIZrVSnxXOhcGcrPOiOWfxi+erMe11F4SPJ5Ey0CS4Z5SK7TZ2b4dsEtUI7P?=
 =?us-ascii?Q?DEkna7VfTRAWcyn5n2z9ZsLGHWRbXPEdDCT7FIDi4sKakztj2me9sqtaPg+V?=
 =?us-ascii?Q?9neYdAPs623fhHGozFlzK7pGbYAywcz6iAJ9K4NZlqupLs/9CRxKSnYw2WMe?=
 =?us-ascii?Q?VtbKqYME5Xw0reTNm3FCxuWoidgLEqITXI/yazwETvjQayJcAKOxACDX0np0?=
 =?us-ascii?Q?DOe0XCU394BEZ5nmK3mPoOItQwl5/F+h+eyeQT11myRgqQzRNaa3SbvoqUsI?=
 =?us-ascii?Q?ajdm8o2yOFMDoGoIgGLQtKyW4/m3fQCp4Nt7JoIraNNJ1pFF9GsyDUTqHnJz?=
 =?us-ascii?Q?VKax956U5etJUR30L5Hk71VdckPGh1ZoYCHpUPsL35d5yE7iJeiI1MlJ5l04?=
 =?us-ascii?Q?zaTnHTiq4r6K3yq0cYsMzIhm2TKgiPkZguU3XnFsYRRHYMykTA8K1Y/l+OoT?=
 =?us-ascii?Q?T3vpuaIJyvpgfCOkZRwiXGqDwBC9/KeqwP2m3TQeJryUfuqGyQyvv+7E7JGF?=
 =?us-ascii?Q?pk0z5uI0HeotdufsA3ZwhY4xRWg3wPVyC6V2rK6sUmEnQkyNMN3JR/Xzy1f5?=
 =?us-ascii?Q?IK3fBBBMBpZcNvKL0y6J6owwTXTn7HR6W7z7GY+gWGe9cVc2PnuhGSXzBDoD?=
 =?us-ascii?Q?MfnK9s0f+f4snHmFKFWS9AWxLYGqNDJgN8zUgWgHm3kSZyZjoLjuevRsYmZF?=
 =?us-ascii?Q?QuKJZ0DF/n3Q5W1ncLsipwk9VQdB70VEWcWsGAGw29wu+wAfhFZSypCwHm6j?=
 =?us-ascii?Q?W0BO5mnthzxhhJV8prPhetBH2v5ZJY4LruUhP4hqgSQw3ItXZinm16m4GBzh?=
 =?us-ascii?Q?brKtP69KWtNShQ16SCqGFl0KctFeVCw3kPz9/LtF5g5NfHlET2kc3p7AcRaB?=
 =?us-ascii?Q?A/AGGic2K7nP009+IBXebnhpRND/6/2AQxYmBPsOT1FmhysjKcQeHd2Oc+G3?=
 =?us-ascii?Q?fVsUFRsYIVSjlZoGdctBSeJgx1idme4LebRi0w4d820m4rgtTk9p7k+q9lZu?=
 =?us-ascii?Q?+kaZpqU9t5UKP9UJcTmjd1m87Cb5OElRH/C48ljX6mV3Ap0ukx6YN07HCNp8?=
 =?us-ascii?Q?38CY5FzDgYA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J9GcnATY6skcxoQ2v0Djy9nR8JlOAVmYg+GQE+QqBLPnKU1HnBcokM8XWrd8?=
 =?us-ascii?Q?XzKo5M+BneqlPrSqQG0l2cKTFUTpDKkhEmfzVRM3trCuqVAh0mkmpI6VCqKT?=
 =?us-ascii?Q?vF+xOKpJUG98WIYST72AcdDTVamX9Wa7eF4YM/9HzmqkWTyV1cDgi0SIwugF?=
 =?us-ascii?Q?ti4KILvSag4eJ61NHSRWzUR0k5L9MMfhVQr85IzSC/Nc3fL7OaiEY3viVkJY?=
 =?us-ascii?Q?lKRcirmEabCeusERtUs/X0aw1+vDgA1ihEYVqPtNqyQT/aGy7UhQdvqUZFdP?=
 =?us-ascii?Q?DLC+tao4Slb6Dtg4YlDIE8Nfvk4BkMXZ0fJTdOBblExwWITofyuW7R5VX9HN?=
 =?us-ascii?Q?fk9WocKNo6G75JglT6Qt2nN3XD9wFmKK2hyjo0eGrABa6SxB/eKWQLeskvXe?=
 =?us-ascii?Q?iNpxHQxcvQscDGQmVd6ApAxmk2j958D1xnFDMwG/Olp7RVcAIrQDIIKjQHcJ?=
 =?us-ascii?Q?A7c7PDo0QBnBIf/HsmrF4P7PGtCfJpuvLuuJ319rF0zJ4Slid67VMVX57yKq?=
 =?us-ascii?Q?JVXDG63e4xD+smNs88XWcrAItQZfgYRS3kP1qLckxYL5fMnUjB6PxZcJhlFU?=
 =?us-ascii?Q?6Wv/TwjWKWBXhLG0unesyVSCKZ0MB9zg5CnCoImUWsmMwykpq4ETfpqTql4o?=
 =?us-ascii?Q?6mayJB/db+Erj0K/hhVy4ixPbNykez84jCWIv/517O6rWS2RuI6g0NwIjygD?=
 =?us-ascii?Q?82JedJrtc3wNqDlPHE16M9RWricKQNmq/XhLEWjHDpspEM8bEklVNc/E+kIH?=
 =?us-ascii?Q?4iFwgbLg2fWeo3N4/gZE4HMy4qyQ9ounPBpn/1ZkJfZiUApCxoww1zF0AE7M?=
 =?us-ascii?Q?AgoMlt8YKjgoEE+I7sC+MgfZt3pBvZ2N9Fs9RD0cepoKN8MMB3WOqNLVlL39?=
 =?us-ascii?Q?qnsZdZ9LcMm5yifxEmmNlaaxvhmeSExj6BbIxey4BXa2dM1PTm9q28M04WSa?=
 =?us-ascii?Q?wPgdULJAjTnNpdro64VlnyT70CNweHvC/mw1naZXugTQnOUittAL/ERWGe7l?=
 =?us-ascii?Q?IHKXAxnlMaIl9MfWz6wcMRpLfOulkPnxrax97wIBeasrLeQtIPgPYOt7boQ0?=
 =?us-ascii?Q?+7hgPcmChMJ4RBVnurzB6I6lwr90TIUwrBwWWJr8cJ3pDuEDsHGtktrDuUq0?=
 =?us-ascii?Q?gdnjLbiasxnYN4kGSUIprBDrT+ohtb70dkc7ZQOe14MsQ2VgC+tH7DbZVmlF?=
 =?us-ascii?Q?TUSKLn81iKWlsKCuYRVTUB7+oO8duXzuwUaDH75oB1TPVTj9ehNu83PBW74J?=
 =?us-ascii?Q?c9WdWAGmowTB3DXAF/bdHMxuhs/mTbY4Eeyp5Kn1JhLYY6ViHuHdX4T37LCy?=
 =?us-ascii?Q?IBr3ZK9hize41sMCoourrppfFuSPY6AUeWE1JCgkL3f6gkggIFJBX0AQft9q?=
 =?us-ascii?Q?AF6ZlkyFeKMzCadQSyS3w0NB+w6O+UJ0BeRi+BNnpt0AlAx50yMsu8lfnpRT?=
 =?us-ascii?Q?VXdMbERr5VVgjKXsthr85xAP3HXBTjD2EqKKvSBbdA3gk3r5Nm8TphWyPNIw?=
 =?us-ascii?Q?UZ4aPoMj2Xc7rwFUNqyxG5wgCUbno/3UNErMmBakoNgsurhMduPYv2GDTW+O?=
 =?us-ascii?Q?5YifD3YJ6K7AUBM4kDzwkfyobJAam1/KKq6mJEUj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ca3085a-f810-4379-15ac-08ddb01b8ee9
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 16:57:36.7990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gj2tBuJxmhu5A+bzjtqxkNk0XSiVYoZ/k6cgB1rfz5Ftb7CyJv/NLXwlHQZHOaOX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8736

On 20 Jun 2025, at 11:33, Lorenzo Stoakes wrote:

> Now we have the madvise_behavior helper struct we no longer need to mess
> around with void* pointers in order to propagate anon_vma_name, and this
> means we can get rid of the confusing and inconsistent visitor pattern
> implementation in madvise_vma_anon_name().
>
> This means we now have a single state object that threads through most of
> madvise()'s logic and a single code path which executes the majority of
> madvise() behaviour (we maintain separate logic for failure injection and
> memory population for the time being).
>
> We are able to remove the visitor pattern by handling the anon_vma_name
> setting logic via an internal madvise flag - __MADV_SET_ANON_VMA_NAME. This
> uses a negative value so it isn't reasonable that we will ever add this as
> a UAPI flag.
>
> Additionally, the madvise_behavior_valid() check ensures that
> user-specified behaviours are strictly only those we permit which, of
> course, this flag will be excluded from.
>
> We are able to propagate the anon_vma_name object through use of the
> madvise_behavior helper struct.
>
> Doing this results in a can_modify_vma_madv() check for anonymous VMA name
> changes, however this will cause no issues as this operation is not
> prohibited.
>
> We can also then reuse more code and drop the redundant
> madvise_vma_anon_name() function altogether.
>
> Additionally separate out behaviours that update VMAs from those that do
> not.
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  mm/madvise.c | 166 +++++++++++++++++++++++++--------------------------
>  1 file changed, 83 insertions(+), 83 deletions(-)
>

LGTM. Thanks. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
