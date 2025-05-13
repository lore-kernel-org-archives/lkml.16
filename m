Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785401DE3CB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155146; cv=fail; b=Pcd3e9vA6QaaO2oF8+zKvfGUcZhXX10xYDjIp9yONzFm8w9ySWC24p3GOCod1ckjRpfRf/VEhOrkfI6nW2/okIift/Gwq3fWI/jBZOib3PoXkFcOoymEuDxt0puKQVAEDtbUkN85j4sx+LxrpuBPG+DkGc0zDyEA65hIecO8rGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155146; c=relaxed/simple;
	bh=tsj0jHaOpwCLk9ixwQNhurMKH8xnTKk5sQhbUj2aoAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HF6WHuMWTxT0a4v9X1E4dIsF2WDi2mAiXtohTMEWyhqyo/m0daGw4nyPgOxwzMnJ+jRSSgfeNenr1sHXmUoXFpP3iPh9r2Pyp34CzIpm4xJsDHBzcWAfOdoIUrSnLh0KitYNCHCoYXOQVxlzJmYrF2ZphvjNuIlu1gcmgTBN8Fg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QvR2xZXV; arc=fail smtp.client-ip=40.107.236.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QvR2xZXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6yi2vTR2SuJHBbJJb8hgSz4L3uIwqepyO6vIv9BaPZr/eN6VwAAmJoFnBVTryfeXAuXXm4JiJ/iYfpg0yAqV++iPSOiRjLXxiL+611mENm9OSlWaM6LdZDZwy9l6GWy4DhrRyvjPJr8eYRcjZiMcxBI2CYbgeYe0yS9V299AKaQ0J425y2n1Eb/UDTZqGudAvdLOPjR/oePkKk2qg+np7YMrYGhL9E4UaEtKm66YPP1bSZ1nmt/1srYoAFroZVobEibPECk/SHWGs4QKOM3fy9Z+iBT+VHCXzc4iqtfWMnKM/Xerq+/Hd8LvvJ+CMRTuM4aWpmpDE3MSlgkAQyHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZMYw6Ca+gTqS++mngyl/RwkMAjWZnBqc9w4VGo/p1xQ=;
 b=oThzwxAAun3PKItvTJ1byTaVhsk0PN1fQzN4Qo89NssdI7Gafc4Nnsc4Ht9o82uHp2XuxSFCnv9pKIUWCb6SfgAjZP8TGEaqO+1ewb8FzGGZ6Yvh8B80m2QVxMonb5di3//DGmkEoDksNN7jnBDrz/vgbn9xp3xOx8qYho30vPk6l98/X/TMhSFn+Ki1qf0Xm4ge6URBFJWBOOcKLIHonNz3/4QW0U5KMNSKyynojeyn+3otAfDvRoIX8aRhgRM51BE890FbcvFNUmOOjntTY6ruaf7FZCs+y/0OdnEOX7sCFSiZZpLcSn4v3TYduUUL5SBBES8crngLOX8vsjd0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZMYw6Ca+gTqS++mngyl/RwkMAjWZnBqc9w4VGo/p1xQ=;
 b=QvR2xZXVoPfhHUWNyT0fGYu4amYbbnyv3p1PJV2iUHSNR1ZptMt0tsNqoNQ+nD7zySNvr+xpebxrhn20rGafr9z2nCWIQg70TMGb3wdydu/gl4ijUC8Rxz81+HgOI8ycZTfd0reLGqK+R7ufIo1hhk3RuGN+uaPPGC55eDQDBI6CeVmnAwypEsaJJaazRnF23LbFZurq8cm75C9G1C2iSX053J5g9WeTZJuvUGtprNebLaHWlgVMIHkiMcA397Ic7E6yMln1gZp5xi4MOQ/qNYpLN8mkwj3bofct2Sx6lqo9PedVYSjFx8ZAP+D9II5HXljUXrWuB5Gi9eEOTR0PXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB9068.namprd12.prod.outlook.com (2603:10b6:510:1f4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.29; Tue, 13 May 2025 16:52:20 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 16:52:20 +0000
From: Zi Yan <ziy@nvidia.com>
To: Juan Yescas <jyescas@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 kernel test robot <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
 <oe-kbuild-all@lists.linux.dev>,
 Linux Memory Management List <linux-mm@kvack.org>, <tjmercier@google.com>,
 <isaacmanjarres@google.com>, <surenb@google.com>, <kaleshsingh@google.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select page block
 order
Date: Tue, 13 May 2025 12:52:16 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <9A5BA016-179F-4BFF-AB1E-61F39CA0C1C2@nvidia.com>
In-Reply-To: <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
References: <20250510010338.3978696-1-jyescas@google.com>
 <202505110035.wtOWnL8o-lkp@intel.com>
 <A3E9017A-7282-4BF9-AC60-E2C74EB68980@nvidia.com>
 <CAJDx_rj2QpiQkLoJM0x-WOD5nJQVLDbsFNm4-xZ9SfAq_f1SBw@mail.gmail.com>
 <2513BE19-5527-45A4-8BE8-A447B53654C0@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BLAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:208:32b::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 2409d6cc-4b95-4555-d65b-08dd923e86cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Y2wwRUtHa3N6N0k3UUJQdkFJWVNSUC94M1FBNlVGV1J1UWw1QjMrNHV0ckN0?=
 =?utf-8?B?K21QQW0wUXZTZUJCNDcxekNUMUI1aU9wZHRGeG5DcGt0U05DZXk5YUZOSmxn?=
 =?utf-8?B?WXFBU1pTZ1JCKzdyN1pJQjAzWW1uNFBmRlEzZDNXbGdsS2NMY2hjeVZUQm1a?=
 =?utf-8?B?dGNnaS8yNjRoeXFOTlcxMHdQZElZR1ZKNGIzaDJ6alg2RnZGREM1OStBR3Ex?=
 =?utf-8?B?TUgzL1J0dEUvOW13dDBENDdEczhDSXpDUWdtWmJreG5GYVlKYlIva3VpaStl?=
 =?utf-8?B?cEJDVXVPQ2l6ZVlGeFVLdE5lUW96YmN3UDBVaFhRWWY5MW5kdE1yaE40eTBZ?=
 =?utf-8?B?bEhKV1N0dUNSRmY2K0VCRWlIcnplWUx3eTJyVEpzUk9oa1hYRC82ZG90aXpO?=
 =?utf-8?B?UzhGMFo1a2hSeVp3eko0M3hVR3ZmbUozRzQxb0F0elAzRFVtaDFVa1RoTGVB?=
 =?utf-8?B?SlpzQzVXQmM0VWdxY0QraStJTkRVdWcxZEEvZzlZN2Vhdk16UzdOZEtGZHh1?=
 =?utf-8?B?dUwzME5URFZ6VGZ4OGdoRlMxRkJpc29UUGRKUjdoTzRWS1YvdUVsNmVGRjdk?=
 =?utf-8?B?MnMySFZFMW5HaEE1THpzQTkxeFMyYmp1NExobXdEVXRpNkdybGxvdFIxanhn?=
 =?utf-8?B?UWRPbWNqMkJkWW5mS1lZMFZRaFBSR25XYkY3aWxRa0Rjd05ORG5rcHFsNXU0?=
 =?utf-8?B?QkUxcHBhdTg1RE9kcEFpQlhLZG0rNjBwcWR5bGpvQnBpNFUxc0plS0Y1OU5E?=
 =?utf-8?B?eU5WUzFsQTdoanNrNVJKcTk2SDMrWG1nYnIvb1dBMXpPa3lkZ2MxM2dUVGZX?=
 =?utf-8?B?aDl4R0pSaWV5WnlwdFFzTkhMYXRQNHFZZHR0OUNvQXdCRjQ1bVpEb2NhcFBS?=
 =?utf-8?B?cmRLK0lhUnVGbnREenYyeU9NTzR1cWRQNmQ3ZTh5Wm5QbjR3N25ZRlVaU0VV?=
 =?utf-8?B?OUx2MmxVT05uMmxVdGVWNjB4Q3VaYUdCU2JUSm12NnRpVnozSWQ1RmFlbXhp?=
 =?utf-8?B?RERVdkQ3SGIzSS9jTUxhQTYxNXRiS1F0NVlTNWJqYWZCSkQ1ZU1TbFlrUy93?=
 =?utf-8?B?cVFOTFR6S3JvVkZibG9hN3BIQjdNSUo2akZJY0V3K01qZ09ESUl1aXdoYjMr?=
 =?utf-8?B?NTAwWlBDT1kzY0xqR2EwNk14M2h5VEc2QzhFbFlqNGxSa0JnMzVpZkpLUFdV?=
 =?utf-8?B?eE1rRXBWOGJhRldqdVZ0WEJCSk5zdU8rNVFRQS9WZnNJMW8yNzRnK3hReWls?=
 =?utf-8?B?dnoreGx6S1l5STlva1MzTGl3Q1JFZjZCemJUM0pORzNCTHlHOWJWcHo2OFBP?=
 =?utf-8?B?SVRtS2hOUklIdVRZNEVSaE5rdGF5b28vV3dEQitDWGhaN1BYWHBET2lVUyt5?=
 =?utf-8?B?SDV1YlJFZmZyTGFtbldvUUhibTlxVXdCeG5zWDNFamxtb0hDTS9OR251ZFBa?=
 =?utf-8?B?UU9ML2VCVlJIVVp6b3dqR2JQQXVqSStZbWtWcWwrT0pycmVjaVhjNkp5d0Qw?=
 =?utf-8?B?SlZHNTZ6Y1NLUTEzNVJheU9XVWE5bm95TkJJQzd5ZXJOeWE5anhaS1JraVBH?=
 =?utf-8?B?MjJVWlJneUFyREtJdUlZdWVEbVdyYUxMWVRVYnBjblE0QVhzb1lOOHRFUDBl?=
 =?utf-8?B?Sk54UzVmNC9DbW96SWZLZVR4bEc4dW55aUNOM0w3aGxndStjRjVWbWFXcjRj?=
 =?utf-8?B?QWE4VDZmM3QrUkVscFJZR0xXL0RndDVxb1IwRm40L1E5Z29kQ0pCOGZkNGVO?=
 =?utf-8?B?NDlQNGpxYVcxYlRQTmVMekFvL05vNzRCNE4veSsvYURZR1NBNENaUjg4d0RJ?=
 =?utf-8?B?NTdoTk53R24xL1pOaks0TXhyWFFUQnZwckg0d0JvT1VHVnNjZjBQSEdqQ0Ex?=
 =?utf-8?B?cHk3aVkxeDhxNzVzS0h2VWdMVjVWbnhXdU1ZWGt1OWMwM3pMUzlJL1hQM05L?=
 =?utf-8?Q?uYsB1kdsLiU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2VRV3Y0Rk40Mm93NXdRV2NOemRBd014b2xrWTdaOGk5VFh2SGtGSzF0ZlRZ?=
 =?utf-8?B?NjVOZkticlNYMGo0SHVta0toc21KRENiaFlUendBb0lpa3d6eDQ4eGpJbDIr?=
 =?utf-8?B?WUFEZGpnYTVaZys0cWJMemMvM3VBQkpwTUY4R0VwcU8zbW9qMWtzZzhxS0NZ?=
 =?utf-8?B?UkpVUHNNbThUQ01saWhPVFlFcTJ3UHJYN3AwQjJNR0lkb2pUSkR6Zk1iUU1w?=
 =?utf-8?B?b1BKQzlyUVcvRHgzOEZXVkFnSHhaQXhVRldvVWtGNGhuUmQwazVlRmZYZDVW?=
 =?utf-8?B?MjgxQUI0UXhrTHhCdUJrSUhVUS83UXg4WVdrMU9tM1dlODJZOGZnZkd2RjZa?=
 =?utf-8?B?MUtJVnFmMkJhYzh0ZittZGpvSnBZVzh0SjlYaGpEL3BOV1JoOG1YcnFaU3Jh?=
 =?utf-8?B?NHo1Nm9zd1lsYlp2YVgzT1JYZlZHQXh6bTdOUG5kZ3VSWUw5KzJETGRlWUxT?=
 =?utf-8?B?RWhRT1lmaGhXQkFmV2QrTERNN0VSaURyc052cXQ5a0RtRGJzb1NicEIrVzJL?=
 =?utf-8?B?V09kNzAvTG9kZFVOcVpNOVh5bUlFSGROemwzeGhPak5XbXoyeDVQYlJJYnZH?=
 =?utf-8?B?Rnl6YmJtak9ocWFaWlFyR1lvTVhCRGY1bGcxYjZlYldleXBJM04yOGorTjFN?=
 =?utf-8?B?S2s0NUNIRnRtTWk3QXlGM1ZqQm9OSW8yYVhCTEZPclJ3N3JLS1Y4dHJsMGhR?=
 =?utf-8?B?S05COU9jMkZoLzh1bWQyNmxuclFGaVVRQWRBOG5TaUx0TWMwNEliMkYyWWIx?=
 =?utf-8?B?VlZ0YmMzRC9mREdpQTlSN0J4aXIvYURFUGZvM1JDSGcyUnQ4VE5yYVlGYjJH?=
 =?utf-8?B?elJNWjYyK0p6NFo2NENoVHd1b1JLL2hFYk1aVXF6cFF1c2RSbnViNFdwa3NN?=
 =?utf-8?B?SGJreEppWW1FTlBPMG13RjJpbzVwNms2cDF4WkkzaFVNY1FrenhHWVBFYkF1?=
 =?utf-8?B?YW80Q0M3UEUwd21QUGJiWDEwUmdjZkFmRGdXZS9hVEpGL2NlUW5jREZrSEcz?=
 =?utf-8?B?WnpSR0dEVVpOR2dNVUpISGxDa09YZDljM1FWUnlRa2o0Ymc5aG1yNDhpd1Jv?=
 =?utf-8?B?YnBjakVzRXE4Tm1MenBpOTNsL3BFNDRCbThoNS8wandWdjdSZFR5aVExN29F?=
 =?utf-8?B?YlVWNjVYWS9HRC8wOU5nWXZ3KzZZK1hSbEtKK01TY09TL0g5MGlTZ3o0TmZ4?=
 =?utf-8?B?TkcvbUZjZFBXUHVyendLdUdtOVFRK2JhNExDV29zaVgvZTlOblNaRmdMT3dl?=
 =?utf-8?B?R0Y2c2hSYkVSMHNDR3dhWS9LSUx3c3h4Z1VLTlJsbjM0cU51SDVGbTdsTXNr?=
 =?utf-8?B?LzNkMXU1Y2NoSHhxUnl0Zmw2a3AvUTkxUURJM3ozd05CT2hTNGlkQmZ2R1lN?=
 =?utf-8?B?SExESTJvUEt3MjBuckVodXROZnBFZU55cHZsZHVrMFBjaTZHUitLcUgzQjVn?=
 =?utf-8?B?bXZkdlh1b1loSHQyQUtTbWRJY3RWV3d2eUowZ2lrcXFWZWV4RmJnNk9EOEJT?=
 =?utf-8?B?UEV5K3dqYmNtSDJMN0hBQlR1NmtPSU5wTWNCYWJDYVZPWEgvcC92MnF6WE1u?=
 =?utf-8?B?LzhOekpZM0MrdDFQSmJUeHpiOVZHcmZIVWY0M0ZLVjliSXdvTk50YldZZk5r?=
 =?utf-8?B?TVV5UEprZUw2TnZXSjVpK2VMQVEydlgrclZnamFuVWxWU1RheERaY3BQUlBl?=
 =?utf-8?B?L3VlRVgyVy82bGxNTUdtR2ZvaVZPQkR6L3UrbXVWa3JpcVpMRmlwaDI5YWJl?=
 =?utf-8?B?dEJWTEtJTHVEMnRJcmp1NTNGL2J0U0NzVUxLNWN6VUlLZUkzZ2R6VDB1cHpx?=
 =?utf-8?B?V011Vk1OQkV3djNONGZTenQ1bmhsR2RXakVGajFXYitpTTZrZUhBYnpHejBU?=
 =?utf-8?B?Uk9YOEpacFg5UnBvbmxZbnRzZGRYaDdWZlU3NHE0dFA1Nzd0VDRmYkF4K1hj?=
 =?utf-8?B?VjJGZ3RjaS9YUi9QUkxzYkRuZTkwSWpUNXFFdWxNUUZhUXhhcnk3Tnd6ZlRI?=
 =?utf-8?B?QXdlNzdyY0pmKzZ5NHd0bEtNOG1zSmNOSS9jQ2RZN1FnV2xGSHpobzJndFBK?=
 =?utf-8?B?WmVmc0EvWlo0RDAxUk82dDFSTWluR0RORzF6L3pEa3dCaHFxRk0wKzBtT0N2?=
 =?utf-8?Q?sSTVAumoqurKpleS1a4H1+xHx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2409d6cc-4b95-4555-d65b-08dd923e86cd
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 16:52:20.4953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcaLCv0xc7g0NZKDzAg90Ta2OpKvM+ldQkAN3dbFOjRHjUPhujg851EBxVx4eURj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9068

On 13 May 2025, at 12:47, Zi Yan wrote:

> On 13 May 2025, at 12:41, Juan Yescas wrote:
>
>> On Tue, May 13, 2025 at 8:08=E2=80=AFAM Zi Yan <ziy@nvidia.com> wrote:
>>>
>>> On 10 May 2025, at 13:16, kernel test robot wrote:
>>>
>>>> Hi Juan,
>>>>
>>>> kernel test robot noticed the following build errors:
>>>>
>>>> [auto build test ERROR on linus/master]
>>>> [also build test ERROR on v6.15-rc5]
>>>> [cannot apply to akpm-mm/mm-everything next-20250509]
>>>> [If your patch is applied to the wrong git tree, kindly drop us a note=
.
>>>> And when submitting patch, we suggest to use '--base' as documented in
>>>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>>>
>>>> url:    https://github.com/intel-lab-lkp/linux/commits/Juan-Yescas/mm-=
Add-CONFIG_PAGE_BLOCK_ORDER-to-select-page-block-order/20250510-090501
>>>> base:   linus/master
>>>> patch link:    https://lore.kernel.org/r/20250510010338.3978696-1-jyes=
cas%40google.com
>>>> patch subject: [PATCH v4] mm: Add CONFIG_PAGE_BLOCK_ORDER to select pa=
ge block order
>>>> config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/=
20250511/202505110035.wtOWnL8o-lkp@intel.com/config)
>>>> compiler: powerpc64-linux-gcc (GCC) 14.2.0
>>>> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/ar=
chive/20250511/202505110035.wtOWnL8o-lkp@intel.com/reproduce)
>>>>
>>>> If you fix the issue in a separate patch/commit (i.e. not just a new v=
ersion of
>>>> the same patch/commit), kindly add following tags
>>>> | Reported-by: kernel test robot <lkp@intel.com>
>>>> | Closes: https://lore.kernel.org/oe-kbuild-all/202505110035.wtOWnL8o-=
lkp@intel.com/
>>>>
>>>> All errors (new ones prefixed by >>):
>>>>
>>>>    In file included from include/linux/gfp.h:7,
>>>>                     from include/linux/xarray.h:16,
>>>>                     from include/linux/list_lru.h:14,
>>>>                     from include/linux/fs.h:14,
>>>>                     from include/linux/compat.h:17,
>>>>                     from arch/powerpc/kernel/asm-offsets.c:12:
>>>>>> include/linux/mmzone.h:53:2: error: #error MAX_PAGE_ORDER must be >=
=3D PAGE_BLOCK_ORDER
>>>>       53 | #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>>>>          |  ^~~~~
>>>>    make[3]: *** [scripts/Makefile.build:98: arch/powerpc/kernel/asm-of=
fsets.s] Error 1
>>>
>>> In this config, CONFIG_ARCH_FORCE_MAX_ORDER is set to 8, lower than
>>> the default PAGE_BLOCK_ORDER value, 10. I wonder if the error should
>>> be changed to ignore CONFIG_PAGE_BLOCK_ORDER when MAX_PAGE_ORDER is
>>> set by CONFIG_ARCH_FORCE_MAX_ORDER and give a warning instead.
>>
>> In ARMv8, MAX_PAGE_ORDER is set up by CONFIG_ARCH_FORCE_MAX_ORDER
>> and CONFIG_PAGE_BLOCK_ORDER is also set up, so we need to take into acco=
unt
>> CONFIG_PAGE_BLOCK_ORDER. For other architectures, the default will be:
>> CONFIG_ARCH_FORCE_MAX_ORDER =3D CONFIG_PAGE_BLOCK_ORDER.
>
> It seems that the Kconfig =E2=80=9Crange 1 ARCH_FORCE_MAX_ORDER if ARCH_F=
ORCE_MAX_ORDER=E2=80=9D
> is not working. The above powerpc-allmodconfig has CONFIG_ARCH_FORCE_MAX_=
ORDER
> set to 8 and CONFIG_PAGE_BLOCK_ORDER is set to 10, leading to the compila=
tion
> error.

You can get the same config by running =E2=80=9CARCH=3Dpowerpc make allmodc=
onfig=E2=80=9D.

>
>>
>> Is there any valid case where the MAX_PAGE_ORDER needs to be smaller tha=
n
>> the page block order?
>
> I am not aware of any.
>
>>
>> Thanks
>> Juan
>>>
>>>>    make[3]: Target 'prepare' not remade because of errors.
>>>>    make[2]: *** [Makefile:1275: prepare0] Error 2
>>>>    make[2]: Target 'prepare' not remade because of errors.
>>>>    make[1]: *** [Makefile:248: __sub-make] Error 2
>>>>    make[1]: Target 'prepare' not remade because of errors.
>>>>    make: *** [Makefile:248: __sub-make] Error 2
>>>>    make: Target 'prepare' not remade because of errors.
>>>>
>>>>
>>>> vim +53 include/linux/mmzone.h
>>>>
>>>>     46
>>>>     47        /*
>>>>     48         * The MAX_PAGE_ORDER, which defines the max order of pa=
ges to be allocated
>>>>     49         * by the buddy allocator, has to be larger or equal to =
the PAGE_BLOCK_ORDER,
>>>>     50         * which defines the order for the number of pages that =
can have a migrate type
>>>>     51         */
>>>>     52        #if (PAGE_BLOCK_ORDER > MAX_PAGE_ORDER)
>>>>   > 53        #error MAX_PAGE_ORDER must be >=3D PAGE_BLOCK_ORDER
>>>>     54        #endif
>>>>     55
>>>>
>>>> --
>>>> 0-DAY CI Kernel Test Service
>>>> https://github.com/intel/lkp-tests/wiki
>>>
>>>
>>> Best Regards,
>>> Yan, Zi
>
>
> Best Regards,
> Yan, Zi


Best Regards,
Yan, Zi
