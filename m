Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2075.outbound.protection.outlook.com [40.107.102.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ABF267701
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750689601; cv=fail; b=WRFZWo7MsSraL83GYHzXXzBKMLDjOJxFj8TO1/bCPwvrIxvgHn6bTfeyLi2NPW0IMInUHko/+7qV8DSIGUW4eJIFgqP8iD/PmdrCA5NA69SHX9LfG5GZxGQQG6PyxikEwjrp1uXPTGGmGjqtrzcFQPtkumQil8tQmRj7rNT2hvI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750689601; c=relaxed/simple;
	bh=wWZ38SvwVndSiJokxLTymtLobx/3ED32RUn18GKncac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1ThYRlrdJ4I4sP11Zim75ZS9T4d6D3EbsF5tt5rJ6H09dMWhSd9laZ11KjFEfcn8KyBvD/NBO4symgXY6fc3KiHx88yjoAYdk+IafAZsvc/Ztpdiw5YXqfFMhgHx4vPufTVYtFreJoTUquylpwZxRiT8S5nTAnBkdlXuahOuTo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XBIIwKBE; arc=fail smtp.client-ip=40.107.102.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XBIIwKBE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYOg8/jzWjlt2oKCcvpE3yiwZgXHJctA2+WMxR+Mn0XnUlAoE1Np1bB+wEYUqP+h47KykVSTg2C1CUYBW3o1JgdimeirIozWZCqp3br43bYM2B0H++NxvvDHC+A3DBifMiO+Rx+61XcV0oAvyrb+XyE5bfO41RPmKvKeB7XX4B8rsT31A2hZCuOHprLHW8hncM/X3z8I1zxKz0FqqYNRSD9VePVpjwZr5sNu8UNqwxH6rGQZ/ueY1HpAqKKnJ8CKNDvk61EZvPI8LqaKjD0ly92Ja3D4E1hF8L02TNTD8PSXt6cMqdmPdStZ1tpcO/dioV0+6u2euu9qg0QIm2d97Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qACd2E2k2yxXU/5qYLsoN6ENxvc9EIwJ2s+VTObtkOQ=;
 b=AF1weBwe1EL03xqy5VDchdfW95wZsY4T1/O0TGm+J4EFOfiR4zyy2L9hA/Oiff/y6+74/7I7SOUKCLKzPRMSrCRDfbU8CzAGF5nr3U9hrDFfc2zJUyuzQG309TcFeA3zaj2Mxu7rnLV9Au4zX1Ue0vv0QxeN7SlBJ8pkov6asv7+Wz54ODMYW4b0+RVQ3g+vsnoGRa85/cIIRIr9L0JRzjhKFYvYvUoJ1+EtG6DNqqv/DDiE06CWP1jWl3VakyaXfhLk4K6LO45nJa2ER2wOVqjLhOeWUJGm8NcPbNW4xbhqWBeS5O1JZ40QRZr32FO1cxD6luTjbte8LW8ESHADCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qACd2E2k2yxXU/5qYLsoN6ENxvc9EIwJ2s+VTObtkOQ=;
 b=XBIIwKBEHtialVeJ/bnOYWm5rC6yXtq9z2M2Ly2rnl4C31Pj8+2l4UEASXQ/XPadwpYQ78YNvMRlS6tE2kWfC87iIZkB107kOXioqphM5AeSgaOwwz3lpBoW+lQCTckSt8oW/nvfsBpZb7mN2c087byA9LGkCbij+TRM3AutHfsw+zqMyxK63VzpQ5YtgaTX2oWSetTmlM4bmjy34JhOdKoZekk0XxZOnFMip0m+LUGOnV6+bwL1TzwEZrDSaDP/Q7tsXQ11Iq/RxZLJwfmxLAFA8W+2o6XWVXLBIPPONUyH5dlqmDy6qyfMvTqxGZBSuFPaTzcyj97ZZVexyo1/0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8857.25; Mon, 23 Jun 2025 14:39:56 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8835.037; Mon, 23 Jun 2025
 14:39:56 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, hughd@google.com, david@redhat.com,
 lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
Date: Mon, 23 Jun 2025 10:39:54 -0400
X-Mailer: MailMate (2.0r6265)
Message-ID: <C4C4DA74-EA98-4712-A2C8-E8075B6375D3@nvidia.com>
In-Reply-To: <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0394.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6a962b-63b6-4371-7c47-08ddb263d2c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STFmeUZwM2lTemdnMUtOSzVkajJaVDl3ektLOWJsMUE0WHNDWmcyYUo4bkFI?=
 =?utf-8?B?MHQ2YWFodHhTdVZtTElJd0llc1FkNkhtenFGTVFjeUVDZkVqYTdoclhTWEVr?=
 =?utf-8?B?SFR1U2FPQzVhRjNNcHdvMGRtWlhUYXpxSUN1RDJVaW5jMVhRZi84TXNjWnMr?=
 =?utf-8?B?VGJralFXRHptQ3pidFIrWmNhcVd2S3ZUMXFLbCtKR2ZSaVlsYm5oT3haZnJC?=
 =?utf-8?B?bkNXZ0xHR3FtL09tOGRjUmFwa1R4MkhBdVF2YVIrZUs0WllGUmp4T2Q3SkFq?=
 =?utf-8?B?bmN1R1VUdThZd3FQcFZEZTUvZ0hIWkNkdjdrR1ByWDgwVWpzZ0hWK2JUdFdj?=
 =?utf-8?B?ZEFKdGFBUXN5TEU5TkRnR3hIUnUrN25OVXVHUnFUVkNVYlhubGMycVI5VU5o?=
 =?utf-8?B?RDgxb0RKRHVGakczMmhhZldQa0s0bjlsMHdWb3NXQm5lL1RBOVhjc3VZWkVo?=
 =?utf-8?B?aDFvQi9jaThFenpzd2NhMkJQSUhpTloybTRzTWFVVEJvTTJVRlFkL1dHb3Ba?=
 =?utf-8?B?VlY3OVdWaTNXKzNzU0hFYUFEaVVEY2dod1RlWEhYOXkzS3prWmtxVmpZUjlq?=
 =?utf-8?B?ekpGOWZTMXlHUkorY0haamJmUVE3ODg4MTdTeHFHeU9QQnhlZGZCTmtMYkhy?=
 =?utf-8?B?TlR3d2padVhZK09TRHIxdklYR1ZzaEtiT09zMWx1RXVXcG44M3pZT2xWQmY4?=
 =?utf-8?B?UXNVcTd5UFlUSUlkOENXNjFsdWt5SmVHczQ4UVlTb3JDNWZLdlBkWVNlUitZ?=
 =?utf-8?B?cEhpMGt4b1pSTUpFQWxhamVnaldJamFTV1VpektqV3Bod1cwLzFaUXFFU29U?=
 =?utf-8?B?RmVpeUF5WlpVOXBxdlBDTXJNZDJ4Y21henI0ZzRTT1pkSTVtK0w3dGJKN216?=
 =?utf-8?B?bDdubCtwMkhkYXdPNXNlQldYMEtTWnlmbGZVOXFGcitOVXdITjFPTXUrWUNh?=
 =?utf-8?B?cmhQVUljNmhnZEt1djJDYndVbTE5ay85Y2tmalNncjNBemR1ZHlKL1hCU2pZ?=
 =?utf-8?B?TnZYNCtSWmFMdm1hMHB3WDREY21tVkIrOXh3Ukg2emVPckU5ck9UNERMN1pz?=
 =?utf-8?B?TE41UVFhVmUyN3Iwa01OK3ZUdUU2ZXpGa1o0aURoWVorTzZqbmo4d0gwVGlq?=
 =?utf-8?B?dzRvVDZ4c04rd2JLSURVVHprdmlvSEowZ2IxbTNBTEQyb3h1bGhNL2dCS1d6?=
 =?utf-8?B?UkJCMzBTNWhpd2FWYW1tK0RyQlRPRlpQTGZhVjZjUW5EaUM1eVdTd1VqVFJP?=
 =?utf-8?B?ZkE4RkRVVG5TY1hWaXRrS2wrK1o4VXJITmZSc2xTN3ZEcVVhK0RWenl0dVl0?=
 =?utf-8?B?bXVZdFZjWk9OdGtIVnE2YzFIZHFQQ0I4OEhzZm45Ujc1bzdzUzVBalByRTdG?=
 =?utf-8?B?aHp1ZjdlOElSd2hJSFVCNlNXNjgySnBSNHM2Z1J5bUpYczZUcGE0MVo2blJX?=
 =?utf-8?B?Y1kwZlRUMlBpbzk1SUI2dmxFMGQ0QTQ5RlVpY3hYS1l6ZlYvQStkN3RTWFJm?=
 =?utf-8?B?cXpPLzJzVVlKcXkwQUVBNERzWmE2ZDl3UHFJaVB2VFdMN0ErSi9ES3NVUDN5?=
 =?utf-8?B?L0tsOThPQUdrcEtwMGFBY01rUWNJUXFLR2xEaDR6endka1FGZWdPUTUzUVlJ?=
 =?utf-8?B?ditNZW8wWVBwK0xQQ0xoWCtXWG55NnJyVUZ3ZEE5OWxGcEk4emZXRFJKajBx?=
 =?utf-8?B?YUhrb1krcVE2VXQ0YW1MbHN5c3c4azhnbHdQTktnNUEvbU02NEo0eFlmTHNR?=
 =?utf-8?B?elkwWkFoL3Nnc1IrQlBvUGZDQW5nRlBSRFJiV3h2RG82YVdNa3JnbStKYy95?=
 =?utf-8?B?dVdZVlVPUGZXRzVyanZ3TmpZQ1pML0NvNS96ZXpMNEN2UGYwbVlyZHpYeUNM?=
 =?utf-8?B?SzExUTltclR1Z3NYT2VMUGpXcXVSVHBQaG9veE9rdkZPNnJhb2dUbUVYVDZn?=
 =?utf-8?Q?0jnHDEaT2ig=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzYyS1pFanhOYnFrT0U1L2o2QTdZaGFIUHdvUEF3Nm4vRFJtS0FENjM4TE1I?=
 =?utf-8?B?SWpMcmowbzVPTjJOWDNwU2lWNDIvajdVaWFybnlwM3NuQkZwV2dXVXdwVTNC?=
 =?utf-8?B?ZGRuV1ZjaGdDN2FBaEl2SUFPRmgwQkp2L1FrOHlid3NxV2xYODl1Zyt5MjJk?=
 =?utf-8?B?VjhtTG9CRXN4NVR2OE90YWNGTG1yZjVIaGR0eTFEeWhiSEQ1N0o1R0tKUVdu?=
 =?utf-8?B?OWZEZWNxMEtqOXFjRjF0SmVvYmRzc3d1UGFHTStVQXRLOU9ibWkvRW0wMDgy?=
 =?utf-8?B?SElVeXNDblNKVkc0S0paNzhHOWIyaW5vSXZ3OXBWVjYwNUl1WnhMaWR1Z3dn?=
 =?utf-8?B?dWY1aDlub0tNdUgyVFU4TVIvUHJaZnFkNFZKVzdhRGFyUWhLNTNFRmlqMGdi?=
 =?utf-8?B?VDZQT1EzSzhCdjlUV2tONU9CdWFWMXlDcXExVEJUZ1JmQm1pN0ZuZ2Frdmg2?=
 =?utf-8?B?WUxYMkJRWDltWFltR21oSXhPaFRqcXBjUGJkK1krN3QvRy81VWFhSXQxb3A1?=
 =?utf-8?B?L0xXL0dkOGZiTlZockU0MC9xL29MYVFYNU55ckhtVzhKem0zbzdjY3RIWlZh?=
 =?utf-8?B?TTFPcjFVUm5UaktBMElQbWdOU1BqVUVuUHNiZ0hwU1ZCZStrRC9BUlhZemFi?=
 =?utf-8?B?bFJyUEVWQUlpUzlyMUNsRU5oTzFleDU2d0hETWRnbTBYVkZyUUhiT0ozUEpa?=
 =?utf-8?B?V0lwM3JhYXhYOTh2cDMwWHhPZ25OdkVNWklyVGl6R0lsSVZrQlpnWWRzMzU4?=
 =?utf-8?B?ZWVWcmdQZjBUT3QzUGllbElsUWQzeStXTEVEclJLMEJrK1dCNVdzM3Q4Zkx1?=
 =?utf-8?B?OHpiZE5LRGJjcVd2TlNJTmczb1VqWnZyWk81ZVgxbkFmellmTnJBTTkwZjly?=
 =?utf-8?B?dGZLTStUOGtNblF5RmdGeHo1d0N5VitJWVI4WG5YNU93Y0F6R0wrbEZDVFND?=
 =?utf-8?B?dFN0ZmVqMHdWdGFzd0dBRXArTVU5MGt0QWhqVmVuWmR2eTgzSmVGNUZnL3Fn?=
 =?utf-8?B?M0FQbGdyNy9ad3Fua0cycU5McDVWTlZSakVVTDFLVEUxTzI5cU5mdVAzYmlr?=
 =?utf-8?B?dUdCRkcvSmJRV1huWldsaEZqQmxPaVAvV3VCYXZlZUNMbjVhUVF5SlFKZ0FX?=
 =?utf-8?B?eXlUZVd0UkdFUGRHem5icURndjgwWlU0MzFFd3A3V09QNU1JNExuK3Biemla?=
 =?utf-8?B?dXBKMk54TTVhNGlVMDQzWCtURDRxelcrd1Z0b0pzaDB5Y3plWStadEp2WVRS?=
 =?utf-8?B?aDlmdXlTdloza1Rtamo4TmE3Unp6MmF3Q0VOeGExbCtOSzFiOEM4dkpsNGFz?=
 =?utf-8?B?c3RUdUdLYXp3MXRXU3JpeEd0MS9mZHN5MGYvUjFNUTk2YjdLdXA4aDM5cUh3?=
 =?utf-8?B?SGFFWTh4bUZ6R1hqVEc2YnphSFVTWGtTOHN3N0FUdGt6YlZrbUxnQ1BrKytj?=
 =?utf-8?B?akk5ZUljU2h3NUZkVCtuK0NOM1FvZzVJRjZUUnRqbStKOG5EdnJ1QzZJcktm?=
 =?utf-8?B?emxDclVZb2hBR1NMdVJrMm5Ma3M3YkFac1VLb1VlUHN2ZUUwZVBPTEx6Wk1y?=
 =?utf-8?B?SVJ0SFk3QUZJM25BWEswcHdkck92b3lUZ0FNeWR4MWRPeFFjeEFDbWFvLzl3?=
 =?utf-8?B?Mkk1SmcvZ2laZk1CNkZzd2ZaWHg1YVRwWjZHem5BOUJOdFBjdnZpMVRUakh0?=
 =?utf-8?B?WE5ISVBMclE3WXJ4L1dwS1ZIWkxMSncxZVV4OWY4dkJkK1VQMUNEbmZNMUZQ?=
 =?utf-8?B?SlhrYUMxYkNDNXBJSVZybWUra1hMYU40MDdqTy90V1dzZ25KMVhRVnlYbmti?=
 =?utf-8?B?bmgzZWx1QytVbUpzRm1ZR05aRHdQNlM1d01oTSt1ZkdidVNVc2JmeUhvYUpK?=
 =?utf-8?B?NXJXdUF2RjM1bSs0a041cnVKNFVzQ2JPcWRiMUZBWUNZdFBXTlcvYUhoYmdo?=
 =?utf-8?B?bWE3eDRYK0g3RFQ2ZlF2V0FFbTVuakVhYXM5ZnkzRzZRVC9sZHc5a3dNQVNt?=
 =?utf-8?B?cW1RcE9mdTFFb2NlREJxK0lxRHNlVkZwdUE4L1p0Q1FVek83Rm1UaUNCMUdH?=
 =?utf-8?B?S2Myc2dJdHZIaklyWlc1bXNmL25NeURERXMvcFZhUWNkZWE3YWE5RlRQcXN6?=
 =?utf-8?Q?XJHlzibm/j9Vmfq+ZsAPGmXTe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6a962b-63b6-4371-7c47-08ddb263d2c7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 14:39:56.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cOmaaTKr0NMyiy2M5xHprhM+s0wGhAK6t92Df91x/MpvR555R+546E4QkTCsdIxK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172

On 23 Jun 2025, at 4:28, Baolin Wang wrote:

> When invoking thp_vma_allowable_orders(), the TVA_ENFORCE_SYSFS flag is not
> specified, we will ignore the THP sysfs settings. Whilst it makes sense for the
> callers who do not specify this flag, it creates a odd and surprising situation
> where a sysadmin specifying 'never' for all THP sizes still observing THP pages
> being allocated and used on the system.
>
> The motivating case for this is MADV_COLLAPSE. The MADV_COLLAPSE will ignore
> the system-wide Anon THP sysfs settings, which means that even though we have
> disabled the Anon THP configuration, MADV_COLLAPSE will still attempt to collapse
> into a Anon THP. This violates the rule we have agreed upon: never means never.
>
> Currently, besides MADV_COLLAPSE not setting TVA_ENFORCE_SYSFS, there is only
> one other instance where TVA_ENFORCE_SYSFS is not set, which is in the
> collapse_pte_mapped_thp() function, but I believe this is reasonable from its
> comments:
>
> "
> /*
>  * If we are here, we've succeeded in replacing all the native pages
>  * in the page cache with a single hugepage. If a mm were to fault-in
>  * this memory (mapped by a suitably aligned VMA), we'd get the hugepage
>  * and map it by a PMD, regardless of sysfs THP settings. As such, let's
>  * analogously elide sysfs THP settings here.
>  */
> if (!thp_vma_allowable_order(vma, vma->vm_flags, 0, PMD_ORDER))
> "
>
> Another rule for madvise, referring to David's suggestion: “allowing for
> collapsing in a VM without VM_HUGEPAGE in the "madvise" mode would be fine".
>
> To address this issue, the current strategy should be:
>
> If no hugepage modes are enabled for the desired orders, nor can we enable them
> by inheriting from a 'global' enabled setting - then it must be the case that
> all desired orders either specify or inherit 'NEVER' - and we must abort.
>
> Meanwhile, we should fix the khugepaged selftest for MADV_COLLAPSE by enabling
> THP.
>
> Suggested-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
>  include/linux/huge_mm.h                 | 51 ++++++++++++++++++-------
>  tools/testing/selftests/mm/khugepaged.c |  6 +--
>  2 files changed, 39 insertions(+), 18 deletions(-)
>
The code looks much cleaner. Thanks.

Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
