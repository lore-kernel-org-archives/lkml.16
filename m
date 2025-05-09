Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2070.outbound.protection.outlook.com [40.107.244.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E05C821D3F3
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 15:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746802894; cv=fail; b=dEMkd3QTFeKpUIeqeXv+cSWmXB9rnJ5wuzUGa02hVIhV5TJMPhWD5Ysk74p0yvnHfFiAzYf0cT8bwin0YmH9g0X6TDft/VtYXkXT7e+c1B3+MNBpvwjqlPtG4Y4PFfnkdEikAIOl7ya8p5zzDp7vOCX1f/v1Ub5ZMrirZWzc/sU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746802894; c=relaxed/simple;
	bh=mSVMUHBO2qJ5lGQR8c+pKmesEg90kNuBK7fgNP55waI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r8Zeo7yn5GOnKrBoFIZVFFTZ+D6Tesq40RNUSW3gurJmmQj7ADaz56Na3Zak3V3OSa1lGft5w7YR8hUm2arcr0caa3DztDiPpfZB+4vKoLNUvHj1+zZ6oezlZwGBZKIDHmuvloxwWyy8EXMvG461NUAgPzKirhlBJyxX+XD+FcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QVZAF3HQ; arc=fail smtp.client-ip=40.107.244.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QVZAF3HQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jz9Bc8xKFStz37RS+GBEp/avxEU0Shd3JTJhS07F09XlDnUJCUcqMADEXM4txtkgMcdc2fyPVmr+Omgxr+WobAPwcT/T6dbJ9bzrBNmtjGjBYHkLLqIehgqqz+i1g2e/chlvmMpuOJNEQ1mK/m0cOcLJQlnaZ9LerB9Yay7UM0ROIPnOKZhZ3ThJP3I4sjXr8XzwBrJolbeMph0icCBTFRk3fbh86VPCPELmKsWFeBzopNBKsray0//Srv8Hb9Av9x3LeINFz68XlipHOqs4s+aT3AlX9UmQ4ZZeCN5YqN3fx/gNj5nm+J6YGG3Yix3J+CgQ+T/xU/9SfFLeF8Nyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5DWgT0/HsHLS/Ke+Cenr0B9dZXbYt1mgVO0/4I9pV4=;
 b=QYwXZYy9Qq+l1b8YzmOd1tydunaI0B32xvUgbvJoVtNBFvYZxDKAepJGcJ7+WTfC5VgFZ5O4HhRjCAS5b3dv8H+xZT27bOsgyGtyLuK0kKETOxZdMfiiNyAp+cQsy56O4wf4Io4gHLsH+//Ru8ulZLpLGHR+t0fQbsT651e54ciFE+WedFt/ofPbTpmWXTXAfZKTTlZuKLZ187lqj3l3sDkenFTtCPtUYsvIpGhwjyfVoSnEIS/50B9jLNro7Q/ZdjF6mG6zucjEk3mItTfci2mHrSbI/r5av//1Oo6nJjvQtB23yPxeHv39fSqpOIKv9qpZxLhWRlff33iE6/xj6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5DWgT0/HsHLS/Ke+Cenr0B9dZXbYt1mgVO0/4I9pV4=;
 b=QVZAF3HQ0hasW8JZ+us61mxI+bzGcnQKvGxzfuzlsghn/KKJS7PiwHuiTb5t4kKT4CbxKWA0kM1p7cK8VtRLBJA2aZqtOV7gPDuq7eiuszeDFgfZlwIuhoI9CWzonpkKRSaLWPGjrWU0T9ZX7chNeRSKHhvYtxyF42OJoZ4eyvh2DqX48wdq7NerJrv+lAMyvkUOkr7majDnYGe35TQPFBByv3ufm6thaCJi+LPUouGOmtFTQXvZdzANDhBJmcpWCV6rgrszu14VQf/PQUsYCl/sdGpGaShNW4M6ZNUawmJDuunAZNJYROHXKuuHbXmu2P1BnZeNgFLZeXx3XeMa1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 SA1PR12MB7102.namprd12.prod.outlook.com (2603:10b6:806:29f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 15:01:29 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 15:01:29 +0000
From: Zi Yan <ziy@nvidia.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@redhat.com,
 hannes@cmpxchg.org, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: convert do_set_pmd() to take a folio
Date: Fri, 09 May 2025 11:01:24 -0400
X-Mailer: MailMate (2.0r6255)
Message-ID: <BED8382C-D28E-4A23-BB60-D26A36DC531B@nvidia.com>
In-Reply-To: <87097d3d5ef1d46959d09cfc7e192c4551b87771.1746795452.git.baolin.wang@linux.alibaba.com>
References: <bc3d4638747e8141133676069336d868c2b2d360.1746795452.git.baolin.wang@linux.alibaba.com>
 <87097d3d5ef1d46959d09cfc7e192c4551b87771.1746795452.git.baolin.wang@linux.alibaba.com>
Content-Type: text/plain
X-ClientProxiedBy: LV3P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::19) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|SA1PR12MB7102:EE_
X-MS-Office365-Filtering-Correlation-Id: 1990efa6-94a9-4500-1fe5-08dd8f0a60a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EYdGtXqqDqoumlrorQFq0SBfK+KlT82A34/GwRT29oeOdXcNHwj61ZQsy4cn?=
 =?us-ascii?Q?5Ckzme4O3hCFZsGk5kToKMohTnSb95s9AWzHDjK1n91g6EisrIm/DzL/I+Mf?=
 =?us-ascii?Q?CVkwGUImOzYxnOAZQ/jRx5UYOFnSpMOaev6OgUjm90p3E+KNjEvH5DjjJyE2?=
 =?us-ascii?Q?3ya9or9ktH3aXxTsi+CVhVOsc9AmnjG7kTRDvhHu57rYC1p8z6SDXE4nC9xs?=
 =?us-ascii?Q?iInGjpG+qoBPiUNmuXt0YEjuLJeXNpcLa+8bGHcICPKPFkkLEe2iqpaAMzMv?=
 =?us-ascii?Q?WK3V9C657hBUzpmW7vFlDpjD/9gEEhoNu2n54BlJlQPu19PRwu5alexFlAbx?=
 =?us-ascii?Q?johXW2QKP2Vlyi8xUw8s2OcnaZBH111WLrzsZJWqgA/AewQ91NNn6eTYkRZS?=
 =?us-ascii?Q?nazpSxXV2EVnfJUh41KyIiKwG2LRm+0ZnXb+uPUPhunLCr779FtnPLfdtcNh?=
 =?us-ascii?Q?+xQVuESqWeWNgwfqKNJkS+FJgu4qWUoQ+Z1lf6uo0geJwLFkRbMVMvBz5Z7A?=
 =?us-ascii?Q?WPbr6lgqGyRAExYkkIJ3sBuGKjg/Xmwf30/7g4MIBt2/eFLLPjesBcV4brRq?=
 =?us-ascii?Q?vzUJ2X895vrHUEHdvye7HauKAExz7QsgH3/jpICfUJh5KhF10pt13mEQoyUa?=
 =?us-ascii?Q?GDOusf3zp8Cpk7+BXKBbdvFyUzv+9HJsYR/kM7pCtkJD/SqhiZ0xcqzfcsHF?=
 =?us-ascii?Q?4biP4QU1gFXse7SdS0cJWzwx799bACD4Ukp+4hjxDHWspJYvZeToNTu0RPMV?=
 =?us-ascii?Q?ClfQQrSSclPILpO3anOlYym3prOd2LlICjlqOGcODvme4RM7ebJNt6gXwj/u?=
 =?us-ascii?Q?23GH3982Mv78Ff+Q1oR5ADQhDHe2HZJ5u4fqVt9dwP+PnL6vRuPjvFMyWW+u?=
 =?us-ascii?Q?OFycuhn+i97IQ401iB4wCz+HojsGRBHEtB4d/FJN2DERV+DTagaRLtuhejBs?=
 =?us-ascii?Q?bn2XWKBPnzBnXuZuq9S2OZIl0TxmST8FDNHuU/zWq0X4HdYNf8p/GtXQiZiD?=
 =?us-ascii?Q?d4PXiplaaAbcbA0ZjnU7hjdARQBl+75KJu/EDsQPYQ5qvYW06nC+TiW4TyBl?=
 =?us-ascii?Q?zudCE7VUjz+n60Acsjz+0W6Gd/E8L+PlBcyPuljah2/lZYZhZu1Nsow6k+fm?=
 =?us-ascii?Q?BN1DM9BHlfJoIh1QJYwDNHktq6s6DmUnBnudnEuxQreFF573e1WoNpX169KP?=
 =?us-ascii?Q?pg0sIEr2GDIVuAIHVauPu4pMyCDmWu4Mnw1HpOOfyHGcCLLgIzQFDBgx/0m5?=
 =?us-ascii?Q?GEkyrD6zb1BRZBgsC5Inl6bJFKl0+v3SZIly9gtzLKSxHtD8xiUY+amCh0q9?=
 =?us-ascii?Q?I2viddJPRgaj8vou1yzE+G8UK6/tNJOWYuTPQMCHEwN5LnoSPYaiHwk3Hb53?=
 =?us-ascii?Q?SHCFLTJcTqgwNRCvrnyCuJXQ43MjXWOMx35wNFjq/KrOUU9hI/BDD0g+svWj?=
 =?us-ascii?Q?472xhBmHVFI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR12MB9473.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nWzlTgMdbUpPkL+PaAQf3+dGK7yNUZ5OvoT78WAIiIE25K6GywNzEnILp6hn?=
 =?us-ascii?Q?OtYoB0aUmc68s5wLByNU2uqqkvncfvzkChLEmwcyvpOD5BRMUp2X3vRPBn10?=
 =?us-ascii?Q?/kSf53XQtAtymPuw/s4D7aXssRw3zDH/MNNgP7853At+FMhmdrhn0lr0Wusa?=
 =?us-ascii?Q?/AmsmPz4dPFBvwgfSbMUu04ZAfxLKga8l9rsiQtassT5H1QZP5avUQ1ITX+W?=
 =?us-ascii?Q?+WErxh4u8wUMT4hePrvqJ1ckQMPyPazlWSxrZAEW16pKCVCNvMlr5pWlhG7p?=
 =?us-ascii?Q?vwSSGK+E5zMGfgNKhwczpkGL5BTXTSrpiYsd9yUutspnhBAayybqvQ0F+jEA?=
 =?us-ascii?Q?vgxcnv+Jo04uRtJad9CfuIQE81qV1TqT2jq7RK6gFUk+ajY+cs9JhdQgALVy?=
 =?us-ascii?Q?tqkUkVX0ojVKhNcth+i3ewHy5iT7N+Ib40TnAbKr6Ncv1qvljYQMEDnAws09?=
 =?us-ascii?Q?dgRok1GnPd7gJssoL++X+e3U51WoN/vv85DAZ8dNMxMwKND9L3NXY1Tl745M?=
 =?us-ascii?Q?y0612kr+vtEodgJ0GGJe4yDNY1mm3MS2p5QXYZC9ZyMux4nGaQGrUwTyxO6N?=
 =?us-ascii?Q?jSb+Q3WtnprQUzIJDtZLiiKWHCa1lsWdIpebHb/tKcY+gFsnKzH7d3CQXAxi?=
 =?us-ascii?Q?7+hbb+BL0ZjKpjw3EQ9ciTEv15WSpA2NJsp02W6NeWxWWUTLfyePVn6rlso1?=
 =?us-ascii?Q?e1100R5tr2mh2JTCbrWcmVR8Z7zybu3FQFSJhIo2kSIzgn++JPxdnd+IBuqm?=
 =?us-ascii?Q?/XBW41v6jqPXSc+ULnBqkv4tmxYr3LzpqAhs3K/PqPkrw0WPIuTvEWhJz8gx?=
 =?us-ascii?Q?K28Ye0OZ+0JNA0fISNPpPa3ilKo6jdgzhH66vOioddMxVm3a9//AH92fXiZM?=
 =?us-ascii?Q?1fXHBPZosuGVW4o06CmjLu8kpKBMpPXDDK6UFdQGyzT3BR1fojx2pBZLSKCh?=
 =?us-ascii?Q?RuNrMLBaUQChnqKZObbZdWL48qTjW3siapAUrZbGAd0IvTOzCuQp5m2hgO5D?=
 =?us-ascii?Q?0mmMlN1VNUdcpvOGB8BScwgUEZowQteG9xiand3YqVY2eBvsV6Y7vtWPym4e?=
 =?us-ascii?Q?Flq+2+WecDvAp8ZNjf1O+L4b4E5wkbzYJIhgVTx3qWbh0ggOG3lPs25TQZRs?=
 =?us-ascii?Q?blWBrQ5GbrmJbTedaCZOCa9P3mxjIttjD1g9t2Fit7ShUYMoaefpZH/P/00p?=
 =?us-ascii?Q?2L1gb4en+ad+LFotdstw79Amg3qLIcg455tLZ/31HhtWKsmdcC/m95T3uTUX?=
 =?us-ascii?Q?yZAGYdnxuzZLBGcV8oYDfoudZdOj+JpoHMvQl+WFgAU5sWkpELelKjwk5lID?=
 =?us-ascii?Q?h9aebRLznpzwGaQpX8DTx1zbpWzDgmyS1JmTauQE1PrcJ9T1KhAuvK4HnHkJ?=
 =?us-ascii?Q?3kDKhg59WAjbEzgDFJ4L6lZGdVQgsWYYNnjHZPU9jpYw/eX870O7so59sDek?=
 =?us-ascii?Q?gB9xr3Ueg+MOOITY5Ie16TZAHRmVt/PIxAjFh4O4L6LmwoOKebQ5Ee9Dm3gX?=
 =?us-ascii?Q?+LrnyMgv55lqZHpLjwf4K50GdjJkmN53gooPhJGj2g9uvzJiQBnt/KXSGVHe?=
 =?us-ascii?Q?ilBgYrYYt4BlZyWsTFTp1iBd2mvuYJIPZgNjMJ5U?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1990efa6-94a9-4500-1fe5-08dd8f0a60a8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 15:01:29.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ECOpeQDAsDn0PGi/TLOGtbebUkY67yyovtJv0rfpk6ptndFGqMZxpDQIvBlHPY/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7102

On 9 May 2025, at 9:01, Baolin Wang wrote:

> In do_set_pmd(), we always use the folio->page to build PMD mappings for
> the entire folio. Since all callers of do_set_pmd() already hold a stable
> folio, converting do_set_pmd() to take a folio is safe and more straightforward.
>
> In addition, to ensure the extensibility of do_set_pmd() for supporting
> larger folios beyond PMD size, we keep the 'page' parameter to specify
> which page within the folio should be mapped.
>
> No functional changes expected.
>
> Signed-off-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> Changes from v1:
>  - Keep the 'page' parameter of the do_set_pmd().
>
> Note: I did mm selftests and built kernel on tmpfs/xfs filesystems, and
> did not find any regression.
> ---
>  include/linux/mm.h |  2 +-
>  mm/filemap.c       |  2 +-
>  mm/khugepaged.c    |  2 +-
>  mm/memory.c        | 11 +++++------
>  4 files changed, 8 insertions(+), 9 deletions(-)
>
LGTM. Reviewed-by: Zi Yan <ziy@nvidia.com>

--
Best Regards,
Yan, Zi
