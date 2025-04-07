Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2077.outbound.protection.outlook.com [40.107.223.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722AB20FA8F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744048089; cv=fail; b=XtKIK7fyFP8L8L1NHQeRkdX2DVRa+ifAkJDtWMuU1qxxEE/8kr0puTbLydjMHLt6r6tbfzYx05AIXbDkOR/nAV7hwV9c+JDbjFLferAwDyyB905mBUgsw01avJTIYvCt+D9dSKXcIjjXF4JzH17nEhKVqspOFbzCFesXDT/h7g0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744048089; c=relaxed/simple;
	bh=YRKNsVBDbLD1WTiiDsJywD4cCLwANwWmFeA1//3MuPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Q11UBD+xwGY3Ut6kg1DrKtf18gbAFz+zL0CvUVDoH1eGRXZV0bVDAzglqnZouxlH2gi7qfLzOL5vx3fU60cOoL37m4zkCcND35VkoDpz6wMOEDxYmdb5Iwta5C1skBRieOnLXjhSsnvililZVQVf2D22XAacHPYdLMplMwhefzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AQuwxqt1; arc=fail smtp.client-ip=40.107.223.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQuwxqt1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2rcYz7zSf6xC1z64ug3oYt89xJh+t++zx+IqIZiZJwi4sV7eQBydmsNUKbNBSpI8HqK1Sf33qDRlgzMu/n4VZuUNiG/XpgOezIOMePOCRrJl2RVO0dNdQPIro+X+Q5xv6XU/AySX/A7UuXqIQuNN9cBfJsl8ztS+1xqy6Ng13F/nk5GNw+8aIoAsMCy0XuYjIEcgS399XXlR9o9ErFa4tgODqzsoahgeS44lWt7WJ7IUk51JVmk9BPS+VRI664uzhe58EpQLZKCKQlMyl8FJV/89tlH8H8cp7A4CfkLuh8/ChhxCnhL8sQIvs4K5l6Xb4bGgVwyR0kEucOcLtN7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4btx0cOjTO6ahOjf634GE1dIdzI7d1iEJQMKZ83Yj3M=;
 b=QkK9nCYg3Ow1cThz5iUNiofZjqb6q607g3rKxiSppAaAikrGRTKNeUJzpe1nkcxKa8xDltiTVmkaAcSGLfpk6eXXHNslAtfJiW9mpgh1lvvy9/HxhAGTMvhb5kJGTK2YyR4R0VuG6rt2z1IDrjizfyE6Nlr9TvLBHUnSN23Ti3ag1U+kgskOClGLsKh4aGCK5KA+tv+1jCCQYQvkVKmpUbHHf9YNmLoW7/siyizrmvZ3dR01K5mAzx1dr9NgvcMLtp5BSlkOc8DewxPssYk43oZw5F/msI9oMo+t67HCJ8XnfMBA6YtOuGbb8brV99V7Jp5DZBpG38uF1FmLe7rnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4btx0cOjTO6ahOjf634GE1dIdzI7d1iEJQMKZ83Yj3M=;
 b=AQuwxqt1Q8fRVoUD5Bfk4d2O2Ztj+fpqP0PfKmS6y9LirdGDGHJuAaOaRPrCQ+lAiZeahugYRUA80UwATENJa6NvJ5bZyOkPGCTcuSDrzNh6dKBTRwDMMGFVden10HUYZtkOxjBNmv9bm4x9BNaqJVlkGurHge3uhhWV30LQVsOJV5K6Afa1g2C+tGNE4DLDtUbYYlQyNWyHVBBz7pmUysSpUdwm5xfZRy42gzo43fiWLiyvZ88bTt+tXDrMZly2/c6vpmlhLLPgmsTT/yDa9yBIQXLfpptcMHF4A5MmISBI5UQSoP9hols7Oi2eUuDIuPhBqre160PzWFTF0WsSdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DS0PR12MB8453.namprd12.prod.outlook.com (2603:10b6:8:157::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 17:48:06 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8606.028; Mon, 7 Apr 2025
 17:48:06 +0000
Date: Mon, 7 Apr 2025 14:48:05 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shannon Nelson <shannon.nelson@amd.com>
Cc: dave.jiang@intel.com, saeedm@nvidia.com, Jonathan.Cameron@huawei.com,
	leonro@nvidia.com, brett.creeley@amd.com, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH fwctl] pds_fwctl: fix type and endian complaints
Message-ID: <20250407174805.GD1722458@nvidia.com>
References: <20250402165630.24288-1-shannon.nelson@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402165630.24288-1-shannon.nelson@amd.com>
X-ClientProxiedBy: MN2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:208:1a0::15) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DS0PR12MB8453:EE_
X-MS-Office365-Filtering-Correlation-Id: e83d29a3-a78d-4087-b120-08dd75fc59e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3P21a5vL9nroo4g7NUyCnV0HXvovzpjuervPloiBOtXNpkuhiw81RkvEfQ5N?=
 =?us-ascii?Q?IoOj2DMnxg2f4W+fCypDyttKTzv8T9FzkS4d70HiCJSZdJAaRpMTW+i7HI8v?=
 =?us-ascii?Q?14ka6sYG3UlzosQ5v0NYuUQy9UVXxDejOHn7YOpiyX9doSS1ysdVGS0nFEmI?=
 =?us-ascii?Q?UsOSuWqLJRhS3CzJDc+pLotZpz30LOYxd3I7oFBRY8mK3Wqiva2CSXi5oFuB?=
 =?us-ascii?Q?7BgjC28VL/9SLmwR/Ww6b3QZYudh5Q5sYAg5wvLFXbdD6Z6WtwHwhNS+OEoM?=
 =?us-ascii?Q?sEGjDz7//qKEKTWPzExYYl/jfv/alLBGO8ZQRzf+k32PO1XqLfRUh5k0bo7J?=
 =?us-ascii?Q?KUGISrzdG/6H1YYr4U/VSnCI0ZARYODVvUR8flkfgcXBH16wT8WwcYbx81sV?=
 =?us-ascii?Q?Uj6FQADsEaOnp9HkrtnuoAZ8chVE/n8efM064bBtiE6BJBXh1SxQS+X2tnAQ?=
 =?us-ascii?Q?+HgRLPlusrm/VdnMmx4jFIxegDBjei0aLtW4AOAIZFes1qu7cWORJkcX+XNS?=
 =?us-ascii?Q?FCYPqYmIEGnl1aJT/hATBZ9BsEshNkE74YZ30PQrh6eoD/rbU4WjIqtbAntp?=
 =?us-ascii?Q?JCuFRazJc4kZPEUmfX9eOLg+jCS6KtuXQmWOIJU7Bc3Y3tQR7ROs79bgViQn?=
 =?us-ascii?Q?rLuqkw8TXYkQe+cgb71S2nZZjzdr3V64JH7MQeNG8nd/m7sZDjWw98sqBBOZ?=
 =?us-ascii?Q?xJO1LfmHsKDooP0YGF6Qu2tRcetjzrlXmRk4ahv8d90f0nTHNLwwoPYXpyvh?=
 =?us-ascii?Q?zxk35C2jV5vmREcUxz5W38qoEMPxRF9UIMiM4ggrRBptzNE5OD4uOmYf2e7r?=
 =?us-ascii?Q?gZ63c2oFlnBmtrlvhhG1iEQYK+hUgfohxdRqPSqRj0B2mEwfQemiJSb5zb5Z?=
 =?us-ascii?Q?+aallmL+VwqbgawYv7a7xTXets87uTAVbAorS7we4XluIhZY2ZdlzH60eGbk?=
 =?us-ascii?Q?iE8D6jfATYVYQM4HUwgKcpSserwPkELf3lyL/25WC2UsaDiFJ8Ag2JiZ5C9s?=
 =?us-ascii?Q?qaJki56WXPhB0XrF8RMNs2VZ+s9CbJcmW49NJ3DVf8lc6qUNer1BfDIFyEa1?=
 =?us-ascii?Q?5Ssqj9DviECgpV6GCeD3BV60hsskk+cSh3o89yJ/4kUU0zklUhX2H0zlpxia?=
 =?us-ascii?Q?GbIpBnCoW0v9aBYEIh75mI7AJAuoXeOL4U7rkTUFL0aGbqWUOx6nTX4UYKJk?=
 =?us-ascii?Q?4D+j78kJkrE3j7lv935CuHFS2rgtQBhGPs2owamfa8NRnjZGVA1dfVM95cJU?=
 =?us-ascii?Q?/dqlXx8vpXhl8kXVVQwLFk/qAoniJjyQmPdGIBGM6xDMoxaUyEMJvxqiGsxI?=
 =?us-ascii?Q?1A9SwLJLNaIjBhlFVjv+bWvm0FiBczo2qWrc+9nTGQVW7IVmoarT0l5NBG8N?=
 =?us-ascii?Q?xSEZ/eE2UTQH1hGxTK7/+6WkrZ1U?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6vjaAILrkCyVrRFXArP+fon1XabJSEIgjEjSKGGlIAI1oUWdgQWPkYg4OZVP?=
 =?us-ascii?Q?mqjbakOPXS7VDU0hIpgF1tNrElUWOQEb+rkgpx4KR2dZbFTuaP0dlctogOkg?=
 =?us-ascii?Q?BDMwhmAV4o/Yr8fMFjoM2RyK6W1QTloYCgtPcH8Ozt2eqgEQVtqUiWdEzF58?=
 =?us-ascii?Q?wMwirEjI1w7G7i0KfEYguANjHdirnR/Apjtr2+cKYM8EIQQTv1/jYitpAcl2?=
 =?us-ascii?Q?3pUWn11NnRkB28mMeh60QXCX0W2BUz1x0xTLbJgxjOknbKIbP3rRCxvUpW7H?=
 =?us-ascii?Q?LB6kO+gO0edws2DhakWiCMQfffp0OmgoZoWsejMCTL6H6TWFSsmAPlQakUED?=
 =?us-ascii?Q?Q6X/xej37kDrFfOKV0aCw4FYdgtiFuAk+Yh71ynAtwNzrtoAW0cK+G/sGWD8?=
 =?us-ascii?Q?VxIpNcTG6byzrjiHG0tgMtzLcYy+ryolxqvSzm41n0V5YAL09/JwfDXRtDXj?=
 =?us-ascii?Q?NsKGO07ELf6IpPQvDEjUt65/bmO/kTuV2Ifj1I5rPBZrQWf0I9s0FPV3kz+A?=
 =?us-ascii?Q?+jIeIopn5q4Vi6j0FoVShIvdaegjqimNdtMIjbwUzyXeu3D8tzGGgBI4dMds?=
 =?us-ascii?Q?YO8L0Qi0XvRjyF9JDlOBWmKiLOoRBCwHocRFakMj8MwA/zndLbl9UELwZhsa?=
 =?us-ascii?Q?YdOh8VdvG681don30XD+/79pKE0O5FPWasUWEM/qrk4kaSfm6DpNiC9CdNm1?=
 =?us-ascii?Q?3hTEFfWZkK+A2K1aSPBuGr5YEeTiFSDzI+9vDd5AewoCyRP8FmUY2YfIiTvY?=
 =?us-ascii?Q?kPoYxGjEUqKzAoQwndqO/AAF2yimgTY/mFI4artnL9ZiFKdyhXRQfeDZ+2pF?=
 =?us-ascii?Q?ImGP3PLDYSy+leuMLwYpvaxLgWvkvqfWZ7JBWPTBQtgHcg9XDgSyc6bFk0gn?=
 =?us-ascii?Q?LmEwAtzNLwcYrEEZZdBoaHjVsgXGytjmmIjeGaOfxsJAHaRKOMVOGi6cd3oc?=
 =?us-ascii?Q?EYXG2SqhpKPz0+b3/rsdoh3tICTSHIqSvWPU0P8EejP/FWOIu2/Zr5tixxks?=
 =?us-ascii?Q?f7seFodR8HBxpNHIlPm8xXLQzqFPG1njbAz9pwYgxXghGlMqu/mCmno2ec6k?=
 =?us-ascii?Q?S05AnxHyaeV1nFtprxvH+0y3Tdps2+RmI9n2n/F/zUM3Xs01Ak/fuFFh73ob?=
 =?us-ascii?Q?mSyADXcumLG0rREgjNXoiuQvR/DFQeBIbStqT1DIjXI9YTLvbM9aDoRa0XsT?=
 =?us-ascii?Q?OEzPahYWfTfcEGC7wdMVGeyucYDAdmL+HImU3t+jTSUn6PnLmD8oB/R9iPzN?=
 =?us-ascii?Q?MAbJOQHCYMs5qUToQ+evEFJ/qZnwV03COlhMHogfPddmLsxHMmqE8b80yYYm?=
 =?us-ascii?Q?XlCDUHogXZsqtAVdiiIrQnrxoLUMbCo7PlywB3Awc86td3auCPb0Lvwb+IxT?=
 =?us-ascii?Q?c1r7x63HgaX5Yj2uq4NgdUVuO+PnxOFCdGWoT2PuYV+xbDWKyBv6zy3gVaQn?=
 =?us-ascii?Q?PqfsyQF5mDEx4Hha7QMunij0Os9FjzjctQ2A7+3p02yamBsMDVXNbEmkW9xl?=
 =?us-ascii?Q?heYX936fXAIK0fA8eTxr+gKBomLbdD9sieJKHXpncAeLJ77Dz7/B7bPQUPYs?=
 =?us-ascii?Q?8c5WcfYYgIJ1Oe1/DxBG9zJuu7plzn7Gi3YpBhAl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83d29a3-a78d-4087-b120-08dd75fc59e6
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 17:48:06.0024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M+FgNht6MhUoPuvqZSJzGNJFNTueSPCq/NnSksoyw0ykrKtTy3C9WQoT8eqQX5Ko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8453

On Wed, Apr 02, 2025 at 09:56:30AM -0700, Shannon Nelson wrote:
> Fix a number of type and endian complaints from the sparse checker.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504020246.Dfbhxoo9-lkp@intel.com/
> Signed-off-by: Shannon Nelson <shannon.nelson@amd.com>
> ---
>  drivers/fwctl/pds/main.c | 33 ++++++++++++++++++++-------------
>  1 file changed, 20 insertions(+), 13 deletions(-)

Applied, thanks

Jason
