Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19300211C
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 18:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746124833; cv=fail; b=WOA3/+ykNNlZhfTa3Vi07KO3k6KopsCwTuCL8vbDCEV4twiXkQ2jGKtvH6APrgq+eTD4E6fctzQvVAFsl3nBSKGEEH4k2U7ddf8t0G45tdPP2FcDJIZ1iAqjLIW4HsjGwS8o0h5iJtYtsYpHRmgKW9fZQrYqgNEikMtiYEWH08Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746124833; c=relaxed/simple;
	bh=UBbs8K+XqGmbJj6r1YbBK4ih0nlBtU14bF/p3sWknis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U4wKR2EzZgWt3Gh2AGM8MPIadaQLhM3Pr+HwzAdf7qe9IFuR2EXvOhBK4//8A3y+g6YYMC5vtw9rZi2yQdoXpJO34JnjKksWx0+c+U1Cm2kNe8+O/A75y3MUDl88YSNVkshvEVBM8WgfpP7Zp8A8J75Siep9PI5YFg1a8C4KloI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MxdONLSi; arc=fail smtp.client-ip=40.107.243.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MxdONLSi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wJUEj71B9FcR28wwlXyfYF6ZPHZRgZENcGSWt82BqrG3qIRmdFvRSiDQWesPoNKn5wIx/3CRuTgjzVuVi1nPtotlKk7BgR8TDywebO1TNsCNhlCJGwTe+bpC5Ujwt8xvRNaBBKmi2R4ZCnSRBLf9ZMyIGUlASArkRAwH09bXDK1jksJHOIAjBp7lWHFqzajce+29+uL4roAfbZVtdb14jz2UaTRz/dxx9Dq8hAp2zqlgRwGyPpSD7cQUpcD/U/DBanN9tpuj4Qo23Amm5teBLkDscwn2n4YKTw9IagNgLp+vuJ1IKept9jWYScNAH7H+qDoeb0Wm/wtmQXATKveAqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dH0HSsEDwYUxuVzlYTIkL8n5RA0iiz/4oZhT8wu3V2k=;
 b=A7qCgtWv1Bh+JhbOyxVE1W/2n5NUhWtCsi7YK4nASLyOKx4jiLdbfLDyEgEHlQJeCNnI2uJkHPh0kIQ6q0ow0pO2/MNj3CNIhUA3wbE/boIajYbL6ZE+r8/5568e0M19JBU6AoAt3GieydOxuIcGv6wGPnHfVp5wDpR5hYjp1Wzwj/Xr5iS52WSOS87PbwN/Uj+UeWH/yukY4KEyZKJCiTw71BjYDzVqc6XsWlCaebJC7f2OTFszO6aGt/LQNcjHdT/MirLJ4bvtp/VRwMIVwzx8h37dlohwXbiA1BKMcsA01g2wcjOkPj7d4bw8TPnyktsR0rIQ6Hoiesdq9UiPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dH0HSsEDwYUxuVzlYTIkL8n5RA0iiz/4oZhT8wu3V2k=;
 b=MxdONLSikZXgIYe07wxGitDGOfGWCYx/94tphqnrY8vRKFnRbiFJzR4kprpja5F6oM0xvaUo1aJ/RLezQi8HjBZvgMHKf+XielSMTE1/AkG8+Q2BT+B/1TyzYf+g3jAQuE54JRmbNw9Y83cj2UrA9qCQvuX6PaZWeIxXdjJ7CsF0zYceAa0fuxJtP4M2V1s9Oaveulacz/DyHrsy4z9pqOChCxfKQnW/c8Me4QzY+ZTSiTbcquE38EsiqgRz6RmtYLTwjRmdPBrgcC5K+lC2e6YC/6rOSHVVsHl/vLSMgLQC28LfqJZ4U5VnyjNfADnIfLQdiqTbO9db7rnP0l57Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4187.namprd12.prod.outlook.com (2603:10b6:5:212::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.23; Thu, 1 May 2025 18:40:28 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8678.028; Thu, 1 May 2025
 18:40:28 +0000
From: Zi Yan <ziy@nvidia.com>
To: Kalesh Singh <kaleshsingh@google.com>
Cc: Juan Yescas <jyescas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, tjmercier@google.com, isaacmanjarres@google.com,
 surenb@google.com, Vlastimil Babka <vbabka@suse.cz>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH] mm: Add ARCH_FORCE_PAGE_BLOCK_ORDER to select page block
 order
Date: Thu, 01 May 2025 14:40:26 -0400
X-Mailer: MailMate (2.0r6249)
Message-ID: <8DAFA811-9D2D-4344-A2E1-032946FB70C8@nvidia.com>
In-Reply-To: <CAC_TJvf36Qr3r_LJ0Knf7WtozUZ_YVxLxF7bEAPC+87J-QEd6Q@mail.gmail.com>
References: <20250501052532.1903125-1-jyescas@google.com>
 <3230A277-7D1D-4329-B871-5E43967E6A00@nvidia.com>
 <CAJDx_rgodAQXVrLjZBBGCqBkT82Oem1ACj7dk=G3qKMnyu_AZw@mail.gmail.com>
 <CAC_TJvf36Qr3r_LJ0Knf7WtozUZ_YVxLxF7bEAPC+87J-QEd6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR22CA0017.namprd22.prod.outlook.com
 (2603:10b6:208:238::22) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4187:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab2e3ff-31ac-49cd-3517-08dd88dfa50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWFJNGhKVm9JYkl4VTBVNDFpK3U4aGNmb2JpVzFOWnY0QmEyTE4vTjQ4UDJU?=
 =?utf-8?B?dkZUZjlXZmxQRVhaazB6Y1Q5TWNrZEJDWk5rWG83RVlka1JubVE4SHllMHJo?=
 =?utf-8?B?bXFKVHdkYkNyVFVBRG9YUjQ2eG5ITXVNNU8rWGRtOGdxQ0VQZXp5RVVkOXM1?=
 =?utf-8?B?eXF2eENZOHpVbE8wWkNDKytnSENnZFNtbVdHdjR0UjNLalhCbmgxMjcyMENy?=
 =?utf-8?B?QTZkak1QNjVrRzJLc0l0T1Q5bVFWMmNCQzhvWkM3NkpTcDc1SGJRQ2RWQ3pL?=
 =?utf-8?B?bnJTYVgvT3VUcWxUOUtlRzExUDA0bGtTeDZ0Snl0WlVvVlJoNG1teGNYNklT?=
 =?utf-8?B?R0MrSnhsWDlKK2JnVXZmRWlWMU1EZDdlOXQrbmVQSUQrc2poUlY1dVZHa3pt?=
 =?utf-8?B?ZlVWd1dzbVk2TXl2S2h6L2JqV0FVRENvMmhYOGJ6d3RmM3pzUEhKemFGOGli?=
 =?utf-8?B?RVBrNTAxNGJPL2tKd2xNekxSRGdGZitoblZGaXBKTVgwVjM4T0h1TWlRNGFx?=
 =?utf-8?B?TExnQ0FlbGxLNk9DdW4wME9JN1ZTSUZrZkhtRUlJU25KUnIzbDRNTEtrS25X?=
 =?utf-8?B?dmxVU3VFaXp3VDUvYzNWVFZRRktUcEtYRXJFRXZWbHNETlhUWXAxMEZndWUz?=
 =?utf-8?B?LzRLUlZaT2tlNkNXNHlwRkMyMUtDRERLdmxVNE9rYXY0RjdJZ3lzQkIxdlNy?=
 =?utf-8?B?VEVZUVVkZkVidk94Vll2bFpzUjZKRkV6aldHRVBiaG1rY3NETDlML3Y1L0d0?=
 =?utf-8?B?RTNuNGcyVEx0RG5ZdTZHOVd6THRhdGpKeXNZcXcvaDNPQ1hJcllmbVVCWTFo?=
 =?utf-8?B?VEQ5NHF3NGJ1SXQ1UkhlaElwSmh6c2NyV0tQaStOZWRFaTFrd0w2bEIzcFFw?=
 =?utf-8?B?aHgrM2lmaVkwdGpnSUlHL1pkR2NmRURzUENCT1I2RVBXS2VQMGwzTG9hV25j?=
 =?utf-8?B?b3g5UUkzaHdkajllcURDOWgwVFkrWkhyS293QW16UkZXb3ZtTU56QU1YQWJB?=
 =?utf-8?B?b0FZYjY5VVdJaVduWjR2d2E1SWdlNmYzS0F4czBYK2g2U1hvSVh6UmZkeEUr?=
 =?utf-8?B?V2NER3VPdUJJaGFLL1lZYmJjNHBmenBmMkVPTEdtck8zRGVROE1Cbk5XVGRU?=
 =?utf-8?B?eCtNcklXRmNyN1Z3S3lmSjd0aHBnZ2lJSUNGbjJVOVBaZkhFNkgzSGh4SWx5?=
 =?utf-8?B?bG8zeUNzVlJhSkwwTWVDdzNETSsrRW1HUjNVdjc5VUdJRFBWWXArRVowSGVQ?=
 =?utf-8?B?aWNMWHFNZUwvcXNmdnA0VGhWeTAyWHVnbS9qTHNiR2hQN3pUUE5tOFZFWCtL?=
 =?utf-8?B?V09kYUh6MTdUdjdUUU5jYXBDVjdtajd4THB6azBBcVJ2cTZhVythU0hjU0x0?=
 =?utf-8?B?ODZFbHpURjBXOVE4ZDd6Z0plUlVzVGYyUDYvVGZ3cW1UUWhCWFZtUmFMZmxG?=
 =?utf-8?B?RCtUVXJBOU9naDJqWFJCaG1CVlUxWVJoOUZuV3VqckxQYytkbTNYdFNGSFd4?=
 =?utf-8?B?d1VyQkU3eklzdU5PR3RuZG0rclpPNlJteHVVUndVR0VGb2RvWTFQV1dMSkY0?=
 =?utf-8?B?VUp4U015ckxoQ0kxUU9Da2x2V0Y4MkVUekFCSC9TcVAxMlFIZzJvWGxtckdu?=
 =?utf-8?B?SEQ0RVdLbjU2czFNa2NoZUdzOEE0VzhkZ2puZHFtV3k5UHgrd1FyTDNxa1Q4?=
 =?utf-8?B?RlNqWTlyMTR5MXJLM212ODlqaW9HRUd6YmRqdGJUblE5aStDOXl5dkdDN1FE?=
 =?utf-8?B?YVo4Nkhobm43UjdHdDM4WUJjYXVwdEw3MHFjQ2NIeDFpaGo1TDZMTEdmMURW?=
 =?utf-8?B?eEtYTnc1aVhwR08rYmFFaW1Zc3dWNG1tcFJOYktLaytiSHkwbDFYdUpGby9a?=
 =?utf-8?B?UTVQd3RxY2hIUTJKV05yZ2dMQXQzOWtWai9MQzV6bnoxeU5WRnZYNVpYWUN1?=
 =?utf-8?Q?Il2MMcGmha4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TkhjN1p1aDJldmxrWWV4S1g5Smw5dXdqMnVlcXNWUXVOcEwrYjM2ai9rR3NL?=
 =?utf-8?B?N20zanpXcGdkM09lc3l6eEdGOWFnNUNuTUxGcVBQalBES0FqYzMzZ3dsbnFt?=
 =?utf-8?B?MEJ0ZkxuZ3BBby8wajYwaFZJK0VhTGhlUkl1ZkJXdU9QYUZYOXgxTmc1VUJk?=
 =?utf-8?B?Sm5NcUtNNzFmc1ZlR0d2aWpQZ1dHM1pTZEhpM1RUT2Y0ZlFyR245QXpJVDBD?=
 =?utf-8?B?UXk4OGhpSFN5anNNT01QUzdod3lXQmxVc2ZuRm9kbjZWbHpUc21MTEFmSFBx?=
 =?utf-8?B?YWY0VU92bTN5UDJzbklES1lFS2xQNmxmT29lZndWd2hZK0hnS08vQm5ZcE5F?=
 =?utf-8?B?djBCMGJzL3o5N3NxSytkNCs0dHVIa2ZNTTFzanI2aWdGUjB3aFVJSGx0V0xx?=
 =?utf-8?B?b2VMWU5VYXljY0d5QVgzNloxbmlYcUpjaC9GSlNhVHBPVnJFcVp3Q21CWisw?=
 =?utf-8?B?Q1prMEV4dE5Fdy9tc1g3Z3NKb2dRa2dIenA2eS85SFJNU2dyNllTdy9zWjFj?=
 =?utf-8?B?YkkwMGhMdVpicGNhUStlU1J1MTZ2VUs1L2xnS0NDbWhidlRsYzlLU2xMYXNE?=
 =?utf-8?B?b0JVTzRiYWhxTEltaDNReDBsbXpMOWR0Y1pocFVIUldJNlh5b1BhOG9KUE1O?=
 =?utf-8?B?NU84dVd5by85VHlteDBySVo3Ym5UU3JDdWJIVS8wN0JwRnFRa21CTDIydnND?=
 =?utf-8?B?Z3k5QkZWUVpDNFZWeWdrSTFzbGJqUGdjU1BVcjhiVEhsRWFtUFFzdFlHaTBX?=
 =?utf-8?B?eFVESmFrLytaMXczaWlxbXFlNWcwMHU1Vm9HanFpSVNoekM0MlZNazdEU0wx?=
 =?utf-8?B?YTZOc2xUMDhiL2hMRDZXSitsWlY5UVZCVFpGc296bDF4eUt6aGlSQXVrdjEy?=
 =?utf-8?B?Zms2ZlMwZEZFcmNvOGtuVmM0bCtzT0FNeWpvYW5UanErcjVrSHo3SDJvNVRv?=
 =?utf-8?B?NE5NZGNoNXNsYnQ5ZmV0UWFIekt5Q1g3MHpNTENxNWFzVnAzdm1JNEhyTERW?=
 =?utf-8?B?bGJaLzZvODM3eXVVeGpCbkVpTWVPblAwMkpWc1E0ZitFbnhFSEltWGhaTnNR?=
 =?utf-8?B?TFZSS2dFeG9ob0ZpYUpPalF6cXZwR0xRUDVjL2hOTGU3QXErTmh4Z1ZqZHJN?=
 =?utf-8?B?ZnE4dmhNc1pqQkd2ekdicU9hVHBDQ2tXNUNMbXZZN0pOSmNYUFVPY05tdkFS?=
 =?utf-8?B?Y1ltcCt0eHVjK05GYlhWTGlaRjQ4VjFVVnYyRDM0VW83L2xwcVE5dWFxTEhh?=
 =?utf-8?B?dnVmdm1DUWtDZE1UL2Mra1NWd09ITEkxYTdUSHJlWnVIRzNGWHVibVBzdGVx?=
 =?utf-8?B?czEzZEhOVHFSY0JLbHVqaDBtUkhDN2hZRi9yaWg3bVdBeW5mM0FPTnhEcjFU?=
 =?utf-8?B?Q3ZoeVJFWmxXUTlwTnZlb1ZFUkJ4Nm9aazFvdXpWMHphWGRBVkNwNEV1VVRk?=
 =?utf-8?B?Y3o1RWlmZ3huSUhPUHFjRG1iR2k4UkNwUkhWRlUybVVLVFZtNEF2cllEdWVK?=
 =?utf-8?B?QlJXb04xNVZXN3dqSmFTT2FyRlN0YkNsSURicndadG1PNVJNV0kxY1VmWExS?=
 =?utf-8?B?Q2w5Y2dXTXZtRkhCTFdsaTlSL2pSSEVvZUlzdmxweDB2UklXV09iMGVMd3ov?=
 =?utf-8?B?V1g4MmtycWJhRVRobzVmTnYzWGJ6T2o1MWdHOGhnR2NBaTJWTzhIc0FlKyt5?=
 =?utf-8?B?bVZETzBUWEYzallTK3ZFcW9ncGozUlRrUGxLd3dCdDVUZFJFYUx4cnI3ZVJs?=
 =?utf-8?B?YzVlMDBzeTBqbkwvbXY2aGVUK3FDVFRDTzN6L0JxTExIN3dac0dORHdpblFl?=
 =?utf-8?B?S1lKRk5oeDc5MURGcVg2WFFiSWVPU2Mxb3M2dlBQcU1UZGxpSGJWVDExQXE5?=
 =?utf-8?B?WlZqS0g0M2hFaTY5WjdqZ3d3azhCbVdXa05iWFNqSmE1TW83clBBeFhTQmF5?=
 =?utf-8?B?cG5MNnhEV2hUWXJseitHLzcyeHFWaFNnL3NJc29memdxbWhQcDNVdE1NNUxa?=
 =?utf-8?B?YXpZTEY5cXB3bHNmNFg0dXVQUjlQaTZHRFp1ZXRBcnNueWk1aUFkek9KbVpq?=
 =?utf-8?B?aVVWeGc0Q1Bab2FONFZMZEcwajEzV1Z5L0JzVkFON2E2M2F6Q0xOem1LL2dX?=
 =?utf-8?Q?MCJd28Wmb5UFf39nkaznGY12I?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab2e3ff-31ac-49cd-3517-08dd88dfa50d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 18:40:28.6133
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UqmmLgMSErjbagofVzO0Nn53ddcGNwClWPcAkonD7uRhDY1VGpWqVPXyoq89EPj/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4187

On 1 May 2025, at 14:21, Kalesh Singh wrote:

> On Thu, May 1, 2025 at 10:11 AM Juan Yescas <jyescas@google.com> wrote:
>>
>> On Thu, May 1, 2025 at 7:24 AM Zi Yan <ziy@nvidia.com> wrote:
>>>
>>> On 1 May 2025, at 1:25, Juan Yescas wrote:
>>>
>>>> Problem: On large page size configurations (16KiB, 64KiB), the CMA
>>>> alignment requirement (CMA_MIN_ALIGNMENT_BYTES) increases considerably,
>>>> and this causes the CMA reservations to be larger than necessary.
>>>> This means that system will have less available MIGRATE_UNMOVABLE and
>>>> MIGRATE_RECLAIMABLE page blocks since MIGRATE_CMA can't fallback to them.
>>>>
>>>> The CMA_MIN_ALIGNMENT_BYTES increases because it depends on
>>>> MAX_PAGE_ORDER which depends on ARCH_FORCE_MAX_ORDER. The value of
>>>> ARCH_FORCE_MAX_ORDER increases on 16k and 64k kernels.
>>>>
>>>> For example, the CMA alignment requirement when:
>>>>
>>>> - CONFIG_ARCH_FORCE_MAX_ORDER default value is used
>>>> - CONFIG_TRANSPARENT_HUGEPAGE is set:
>>>>
>>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order | CMA_MIN_ALIGNMENT_BYTES
>>>> -----------------------------------------------------------------------
>>>>    4KiB   |      10        |      10         |  4KiB * (2 ^ 10)  =  4MiB
>>>>   16Kib   |      11        |      11         | 16KiB * (2 ^ 11) =  32MiB
>>>>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>>>
>>>> There are some extreme cases for the CMA alignment requirement when:
>>>>
>>>> - CONFIG_ARCH_FORCE_MAX_ORDER maximum value is set
>>>> - CONFIG_TRANSPARENT_HUGEPAGE is NOT set:
>>>> - CONFIG_HUGETLB_PAGE is NOT set
>>>>
>>>> PAGE_SIZE | MAX_PAGE_ORDER | pageblock_order |  CMA_MIN_ALIGNMENT_BYTES
>>>> ------------------------------------------------------------------------
>>>>    4KiB   |      15        |      15         |  4KiB * (2 ^ 15) = 128MiB
>>>>   16Kib   |      13        |      13         | 16KiB * (2 ^ 13) = 128MiB
>>>>   64KiB   |      13        |      13         | 64KiB * (2 ^ 13) = 512MiB
>>>>
>>>> This affects the CMA reservations for the drivers. If a driver in a
>>>> 4KiB kernel needs 4MiB of CMA memory, in a 16KiB kernel, the minimal
>>>> reservation has to be 32MiB due to the alignment requirements:
>>>>
>>>> reserved-memory {
>>>>     ...
>>>>     cma_test_reserve: cma_test_reserve {
>>>>         compatible = "shared-dma-pool";
>>>>         size = <0x0 0x400000>; /* 4 MiB */
>>>>         ...
>>>>     };
>>>> };
>>>>
>>>> reserved-memory {
>>>>     ...
>>>>     cma_test_reserve: cma_test_reserve {
>>>>         compatible = "shared-dma-pool";
>>>>         size = <0x0 0x2000000>; /* 32 MiB */
>>>>         ...
>>>>     };
>>>> };
>>>>
>>>> Solution: Add a new config ARCH_FORCE_PAGE_BLOCK_ORDER that
>>>> allows to set the page block order. The maximum page block
>>>> order will be given by ARCH_FORCE_MAX_ORDER.
>>>
>>> Why not use a boot time parameter to change page block order?
>>
>> That is a good option. The main tradeoff is:
>>
>> - The bootloader would have to be updated on the devices to pass the right
>> pageblock_order value depending on the kernel page size. Currently,
>> We can boot 4k/16k kernels without any change in the bootloader.
>
> Once we change the page block order we likely need to update the CMA
> reservations in the device tree to match the new min alignment, which
> needs to be recompiled and flashed to the device. So there is likely
> not a significant process saving by making the page block order a boot
> parameter.

Got it. Thank you for the explanation.

--
Best Regards,
Yan, Zi
