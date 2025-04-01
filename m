Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58A120409F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743520858; cv=fail; b=Re+lxX8fzpCjU/n1TBjPqUnLURQRx2dcWJ/g4uMMnHd7VHy5eghAsqBZkCmonKwNKreqW+phtPPItvXWg8fQukUK8k3p91wrRwKSY+Qoo/uxDtAKSyhjM66L6elWm5tJn3oPjGoje4y68d52RcsVFWC4I2v8IQfsMkRQj7b8HeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743520858; c=relaxed/simple;
	bh=pt96zmg4esQ8UpX+CyyKGmctEUOR1AemhCx70mm4JLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tSWi6QP3fRbxFwSd8eXMH64pzRavwjRcXA4R7t1Dyyxv+XVL4EFWAGE1irwYqtUfSCmyjC8+cKR29taD8hN3fMeplgmSCbP18TWIep1I2JFSDWsUZPdfcO7NeZe0SwHJZnE1jx4+2ekRzSL8mo2/tKHHNsMdhA4HRIbDEOiyPxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Z4uVUOJD; arc=fail smtp.client-ip=40.107.236.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z4uVUOJD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UL/XhvjJVQq5VDs/bELx49RwMprXkU9pJxv1Zho7PXVyKT8/jh63E/44Ny2uiNDEW2WfGEbvQnkQ7j8xP2MBrKTYNgBN99IfMS6ni6mJLmCpEw5sEzD4n4UM9cFaokcF9A1Wzw1Ty9x/DTXkCwoxNj0iOE4MCuywJx1Em02owbm/6i83eJ3yu+U+CM5pCs1XGux3/sIaf1G1IagyGXczQ2L/2B3Xm9YgT74v1tSVM7RFFlLt8vjlHawvD1jQH3XHgMbGpBGQg/8IRSwpIrD0hV5KnI7BGi1r5z3nE8HRPcbRnx8vfhaHMORHmG3Q9ED0IfD7eqQPKt+LId05uo/nyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KElerOmi8WiJZv65C37H4I1ElBD3rcO9s634zNPhELI=;
 b=vIxiHmGdoB0zWINxEdLgY4Y/SUf4za9apZ7ufmFu01gf88xpxYPECgJ4xXDSCY/oJE63Rud1YJ4gMcpSXSSJMN+aq5NB95JuMEeo3XDkbfoBobeKpdqeAaKQ7vzmuuKQJEdzc4+2W92X7j1AuSMetSrOgD7ypchVQeAanEOeCaTtun4QycuMqPcoDmfUSY+llgKKpMY0m2mrro8gnMdk76GzFpXkMP2XLeIVkghLzbo4qksHySv+IoX573WYJCKWBptpBvwJCDvN/TO2Dyc4ltppG5aOgBjONx0/bBelzHQYJi0z0ZWCbusaBys9xq4h4LVPtVUZyFys6zZIq6eyAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KElerOmi8WiJZv65C37H4I1ElBD3rcO9s634zNPhELI=;
 b=Z4uVUOJD01UYSNCwgJC6ZD4w1mizF9o1o3+5/smVEA8ZziSUQF5x1zFgI4/9k7Iqgdoa9QW6na2RO49Mapoh4IU8W8MtZdumVItbo1HAfby3KN3+LnzOCkXRtAQ1CTZ7MHn8+PJpMX7uu3pFbpAx9f+3XvHuEa9qIZ57Qb76fSx71n/gzuEYrXArRMjbtITX7jeZc9runbxsCsecokWKO7AAtePXzbxqzUoGyF0BdDbAcM91p405WAnWS3WYrQyoxV33oXJZjoH7xE+kfWlItMdUjFu2fYwAhrbX7eKnWhE6cTrQiyJ5bG3h7t9XB7WXqGQ06MWy6PHTHyeBPLqp7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 BL3PR12MB6450.namprd12.prod.outlook.com (2603:10b6:208:3b9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 15:20:52 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%4]) with mapi id 15.20.8534.043; Tue, 1 Apr 2025
 15:20:52 +0000
From: Zi Yan <ziy@nvidia.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 akpm@linux-foundation.org, muchun.song@linux.dev,
 Miaohe Lin <linmiaohe@huawei.com>, Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH] mm/compaction: Fix bug in hugetlb handling pathway
Date: Tue, 01 Apr 2025 11:20:48 -0400
X-Mailer: MailMate (2.0r6233)
Message-ID: <4B989B13-EB96-4EA3-B3E4-18763941ABF3@nvidia.com>
In-Reply-To: <20250401021025.637333-1-vishal.moola@gmail.com>
References: <20250401021025.637333-1-vishal.moola@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY5PR17CA0003.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::16) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|BL3PR12MB6450:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6b7027-4dbf-40ba-6975-08dd7130ca5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?amIxNjkwNk9JYmZnUmNZRWsvcTMyV2YxZUYzdFNxT3AyZWhIdjRmd0xlT0VZ?=
 =?utf-8?B?K09qdGEwaXpUUXBzb05hd0x0V0NwRXFWK2ZKMXVqclhxRW9qMVZCNWtKeGJt?=
 =?utf-8?B?ZUpLdlNUbzlhU1VUdXJWQVVVN1Q1SU9MSjBleTJsajM3WEs3anUvTXhxRjVs?=
 =?utf-8?B?NUhrL29DQ0pOcjRjU1lFbUlFQllzWW5nKzF0RHBQbHpoaE5OdXdyTlNzUkVU?=
 =?utf-8?B?ZEc5Wi9pMVpDTGtlVnBrOThPTktRK1V6YTVCdEU2a3hGWWhPNWkreFo3VXJn?=
 =?utf-8?B?bjJ4T1NMQ0ZBUUJFT2kveHlYc2EvME85MURzMkFEMGF5SndkSjNYd0s4VUN6?=
 =?utf-8?B?bnVBSm95M1cvUTdlSmFmOFZuWHJVUVptUWJROVBWNmlqV3h6c3REWGtQNHhH?=
 =?utf-8?B?cVFxSnBsUWdQVGUvdjVKZ1dTT0YvRXpyNHJIb3lOS2VjSUtMaVRuSU9reEVT?=
 =?utf-8?B?MjAzdVhVc3Y1dDlCUUdjRVk4Y2d1eDNGMFlrMkNhcXhKYTFSaTN2eHJUL0ZM?=
 =?utf-8?B?amdqanhqZjdYRlVxcFN5NHhUNWdWbStBOVd6Yk04M0xXOHRyRnhRNE41Rkt3?=
 =?utf-8?B?c3VCbG5TMWdvNG15b2E0STFqWDFhYXdKcTlWSFdRWHdQRWFneXQ0WDNLeDNu?=
 =?utf-8?B?QTYrTXZIeUluWDdpcTVYVHVDY0o4TmpBNFdNMy9paTZKUG14QmUyZnBRMTgw?=
 =?utf-8?B?eWdINElrT3V4Q1Q3cTJFMU9sR1RXRlhoV0xuYWZlY3huajNsbmR4VGJBL0Z2?=
 =?utf-8?B?azVYYUlWbHJQWlhHUGZPRmtScUpkWWRWRzVIMmhxc2RsNE1zaHdLV3IxT0lq?=
 =?utf-8?B?WElFWFJIeEhrRlFxeGR1ajlSUER4Y1Y0UFdoYWJ5N0ZxNStIZTRIRk4yMVdz?=
 =?utf-8?B?YWZTeVBkRUxYODg4N0g3dWdCT1laa1Q1ajhKY091WStqSFVmYy8zTXpicHFN?=
 =?utf-8?B?NGZ5dGV1aDdRaHVGc2gzNXFiV1hLdmF0T2c1d21qaUJYWUdsem5HM0dGaE16?=
 =?utf-8?B?Z3haSHJBbjk4cU0rLzk1ZEMwQjIyRkY0TnRIVEFwUmJkSjA0QUhVbU9mUVBW?=
 =?utf-8?B?czE3YjVwcUFxNjRXZ1NoaHpKTDlZUHorc0lCZWttYk9UaklYNDhkUkZ4cWtV?=
 =?utf-8?B?dm9GU0E3eTJFTHUwcERvSEViR3FEN1Z1NUpYYU1UQUVNVVZzUllZMDRScFcw?=
 =?utf-8?B?UUprRmRIM0grZHdubll5TEY3dW4yWjNaYmZ6WmZhcGFtbzF0aWFZMnNyUU8v?=
 =?utf-8?B?Mi8vZWJuaUFFajEzM3RBTC95OEhQUm82d3NxUmZaU0RSWVZQSlpGaTlVTXg5?=
 =?utf-8?B?eE8ya3ozVk4zNGp4UkNYUEtDS092eXFrY2pNVWtnKytYSGRERXVmSU5TVmR2?=
 =?utf-8?B?ODNVSGZtdUVZY29WS1FPbkxxWUFNZld4a0tnVFJpSVlNYnFMTmM0WmlIbmxN?=
 =?utf-8?B?NnRtZGpOVytiOFZhUGc0NmROc3FYbVV1V24rUW02cXdoNkxVYUNhWWswalVL?=
 =?utf-8?B?a2FVc1R1U0RCRTUxNFBkNGZrWFNyb1BHVUNMRUQxbk9CQldTTUsrWGlZZ2xQ?=
 =?utf-8?B?ZFZxUTU1d3BPVldlUlV3N01qRnZJamp0YWVwUmNQQjZVcHpkWTV2d0dZNGE1?=
 =?utf-8?B?Mjg3Y05TbjVVdzVybzh3ZGhrcEU1UzdKWWVoMzd2OWxPekpCNVdybGY0YktH?=
 =?utf-8?B?eUFsRVN4MElZQVk0cHJOMG9ZWDJpY0lUZ1ZKd1Vjd2dvUTZuM2lkOU5KZWp4?=
 =?utf-8?B?M2VDK2F0T0x2aGtmYytTeEJ2QnBKLzFHNlh4M1hsQ3lMc2xZZHFNVzFPcit5?=
 =?utf-8?B?akpjZXVmRVpaT212dXlhdXpSeWVtZ1d4VmxzdE5VZ3JxMHJWbklWV05OU2xz?=
 =?utf-8?Q?8ppnRAnVQJR5c?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VzNPd0tpKy9Ua01QaDZBdGN1aXdrZXl5c2RnYkk4TzFGOElrN1NHdkFXRkhz?=
 =?utf-8?B?eU50TnZzQVVEcytKWlNIdDAxSHNLYzduYkJFeUorbk5pNk50YktLamtJRm5S?=
 =?utf-8?B?OWFlNWhTOHJDQXB3ZFltREJJK0dzSlJ1b2ZpdWloODl5OE9UZk53S1pHcjJj?=
 =?utf-8?B?Y2dBSUtDUmhEYTlnQllSa0VhS1ZVNWNjdUt4SUNLUFVzak9JR3RlREF1OWY1?=
 =?utf-8?B?VHFMRGxSZjl6WVNQUjVETUhSRXd3VEdtSExoR2FkTmUwMjFnSGxqVlRtQjB5?=
 =?utf-8?B?WVhkSmtZUmpSaE9KTFRkRTJJMmxTYkFQdytMRlp3QkgzS1ROazFVZ0VleFpa?=
 =?utf-8?B?UUNvczlFN1RjcXFRMDc1SDFOcExGSk94S3Y2MEJ5WGhwSzEzaTJUTjMwdTJI?=
 =?utf-8?B?eFJsRmtDZGZXM0I0bkdwOGFHdjlCb1VjcldINVhVTmlMSXdMa1p3cVpiZnZl?=
 =?utf-8?B?VHJKMVdKZDRPMytvTEdLZlNaWVRPamRRL2w4QWtQMEJhTmRBbHFDeFJYOEtu?=
 =?utf-8?B?V1h1ZnEvVlQvRXFPSDZRS2t0VVJJaGVibXBodHU2Zk9wSjhFYnVsNUJXV2E0?=
 =?utf-8?B?akV2cTFCL0FqTkd6b2tyREFPL2g0djlkQ3RBL21yemFrejA2TStsdnV1OFlI?=
 =?utf-8?B?QXQyanNsNDlzU0cxRDBXY1RjUE1iQVFaMEkrWHlEZXZsTUlocUF3eWh5TFJy?=
 =?utf-8?B?T0VvUDc4ZzRRMGxFdEhhZlM3dXNOU0kvSHBkeGxMRGszT0JhTlp4N1dyS0hR?=
 =?utf-8?B?V1EwZlV4dFdLdENzakJtdGMrenYydzFOU3ozc3RpckIvbFV1OGczbzhQdGxD?=
 =?utf-8?B?SlRHQ3JJUmI4OHY5dmFRZ3lTaFM0bzNGUlNPZTRQUW9YKzBndWFKZ2hsck9p?=
 =?utf-8?B?UUowdng1YnY5dUNYMGhjdVNiNld4ZTVPTHVUMnpZdzRuMVFLd1gwQXNoSWVM?=
 =?utf-8?B?WUl0L0syN3VQVVBDd0hPZDk5eGphcFNNSFdmekxaZG1HYTBNWTVybGRnMzR6?=
 =?utf-8?B?NWI1YTlyc1YzWFQrT292dXFqdW80Y1draGE3NzUydnB2Yk00RE1pWVpjb1ZR?=
 =?utf-8?B?R0w3S0l6SUJZcXdMVHREYk54NjlsamN0QzNoTW5RTnBQQk5WdFJPRUFyWlVo?=
 =?utf-8?B?a0pjTytoNk9HN3MweklWRkdkYkZxQ3BFVmNyTUVPY2FOOWxib1J3ajVRL2hC?=
 =?utf-8?B?OHNHL20rNGc4U3d6MW5CRjY0eWRpVnowRk1UM0xXTTJVcjZxYUFzR1dnOFR4?=
 =?utf-8?B?QUc5emlJMXV4dkU4eGpCNVY0NTMyelNxcGxDSE5NZFdkbVZrWWJ5L3BwbDlT?=
 =?utf-8?B?U2FvOThVbjEvUE16S1djcityRWtZaDZUaHhJTk4wSzFjNmd6TUx4dXJCeVA1?=
 =?utf-8?B?VWdiM3V5ZFJpTktJY3NlZS93YTRlVU8wSkNETG0rMFBSSjczTkJDazlDUDl2?=
 =?utf-8?B?dG1YWVZBQkhGWkFiV2VCQUQrM1pWR1EvNmd0YmV2aEloREp6azc0K21iS25u?=
 =?utf-8?B?ZWZycDJub3E2d2JGdVdRbkVqZ3dud1ZNenBwQzh2SFdGckxBNzhmcFVJbFpy?=
 =?utf-8?B?UE51dkdtd0x0M0M4Wk9UTVZNbVU2MGFkL3pOdmlCQkt2ZjRSSE1vaE1Ya1R1?=
 =?utf-8?B?R2o0NkVVK1pzUVVybEQxTFcyNzA2T0VRZ0E1QkJ3MnNpQ2xpWXR0YlFsZDkw?=
 =?utf-8?B?U1ozczVMNGE0dEpLR04rV1V0TXY3bmcrNTV0UlcxM3lQazJsSnNoY3lOSlow?=
 =?utf-8?B?VmI0aEdWU2JuRi9hNWJNSlFxNFRnb1hDRm04NG9IdlZaeGk3Uk04WlRGVXlq?=
 =?utf-8?B?ZWVidmxHM0Y5OEIyK2s1VDd5allvalF6ZldPc24yeFlEL21ZNzRJWWxhQWV2?=
 =?utf-8?B?OHhLVDdLZS9NL3ZQRnI4NWJTVk5TZVdJek9KcDBjMUJ5RS82UGQvOXJXT25S?=
 =?utf-8?B?N1hmR2Z2QjJmdDVyZ0FkbXhSaUpjY0hzWmFTOGFyVzNWZGN0MkFTWHZvRFJ2?=
 =?utf-8?B?RkFZTDhCWkhsajNrb0szY212eU54dmY3YzBYaVRvekx1OThJN1FYT3M3UU1G?=
 =?utf-8?B?L1krd3ZUbXRjWHkzMTZNTnNxSDBvdzRtVUZsSysyQ1lLcm9qYXFzQ1FJZXox?=
 =?utf-8?Q?6yjQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6b7027-4dbf-40ba-6975-08dd7130ca5b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:20:52.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tny1j7bMNsgkMFbYb/Wu/RBWHPgRvtrTRojb/4yns5+5PeCZ3W2/MVoU7DBVf3Jc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6450

On 31 Mar 2025, at 22:10, Vishal Moola (Oracle) wrote:

> The compaction code doesn't take references on pages until we're certain
> we should attempt to handle it.
>
> In the hugetlb case, isolate_or_dissolve_huge_page() may return -EBUSY
> without taking a reference to the folio associated with our pfn. If our
> folio's refcount drops to 0, compound_nr() becomes unpredictable, making
> low_pfn and nr_scanned unreliable.
> The user-visible effect is minimal - this should rarely happen (if ever).
>
> Fix this by storing the folio statistics earlier on the stack (just like
> the THP and Buddy cases).
>
> Also revert commit 66fe1cf7f581 ("mm: compaction: use helper compound_nr
> in isolate_migratepages_block")
> to make backporting easier.
>
> Fixes: 369fa227c219 ("mm: make alloc_contig_range handle free hugetlb pag=
es")
> Cc: Miaohe Lin <linmiaohe@huawei.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
> ---
>  mm/compaction.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

<snip>

> @@ -1011,8 +1011,8 @@ isolate_migratepages_block(struct compact_control *=
cc, unsigned long low_pfn,
>  				 /* Do not report -EBUSY down the chain */
>  				if (ret =3D=3D -EBUSY)
>  					ret =3D 0;
> -				low_pfn +=3D compound_nr(page) - 1;
> -				nr_scanned +=3D compound_nr(page) - 1;
> +				low_pfn +=3D (1UL << order) - 1;
> +				nr_scanned +=3D (1UL << order) - 1;
>  				goto isolate_fail;
>  			}
>

Right after this, there is =E2=80=9Clow_pfn +=3D folio_nr_pages(folio) - 1=
=E2=80=9D for
isolated hugetlb. I wonder if that can use order as well. Maybe not,
since the order is obtained without taking a reference, but folio_nr_pages(=
)
is called with a reference. They might be different.

Anyway, Reviewed-by: Zi Yan <ziy@nvidia.com>


Best Regards,
Yan, Zi
