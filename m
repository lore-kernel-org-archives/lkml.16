Received: from NAM04-MW2-obe.outbound.protection.outlook.com (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E080253F2B
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.101.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748498108; cv=fail; b=jacsiw1XZKSz/38OV+jmf1NZHL0jtK2zDNmQak9jaAMlEz1pr3YpG/8QPTxIGWUdSSOFeN4nffFACERKeCVO/11iqyBmbqJD3dqjUiBloolsLDGccrsxU0ehSn1jvRqgNmp37zn21uTRnx3TfMBQAXSp+rdHb/Yzkw99pAmLVhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748498108; c=relaxed/simple;
	bh=HpN1HtMQ/dZZlkL7pkTRxG+AaurOYcqchZuzq6yPOAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PPLwfRODDNKFigE+HjJdFfQQgR2MRbWNX+bfyfZvae2wGu2Z524J3mbCqxb4mS9RUcH4GSavvL5SX01XDoVZhvc1YE1cfKyD6szALeDUJOkjrcAG+cP/hk+L17VZ+CS1Fj1hlyKg/vDWqCqwZpaq3NV80D9Bu5wFLuHef612hmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tlJSe2q+; arc=fail smtp.client-ip=40.107.101.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tlJSe2q+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxlGyGY6U/SqO2A3FC5FAFtuwJfHRkNTGVIZRp4rjruJ1ANjU9RN2hmUlnES7dkJ1tD+Z+Kqq9dX/jOj0WTn2tW9qV1VT32z8fUGmeTaG8V22lGnkDx8S+NurgtFBh5QOPG6c97R3gIG/fHFSZeMSUqY5JJ+zKyPZziMNWMtk/NAcLw8Kq3oXR/avtp+2gVYyZhinfETPnqosk0punP+3dhDfnKYs6WIPmvyB7SZIbphwW8PtgAQnca5CABnWQh8vRYtxEyUaXdB15actdI9/PnZQcTkVtBQfmlMfR5ot4BAL1DSdNBMElrmouOE4gZhPU+MMRhuidiRucIUGIf/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reZgzkMew9Z2mOzYyqPsCKuHLP7j3BdbyL7emxhhiP8=;
 b=pqdBZrdCCD20+yeu8JAJh+GyVPFw0FuflWxQ0Q09cF8WGy8zgRG3OQdU5d+VNz9/D6fQ10dJn5lDjEGQAvrf7svcgEYh1AEujEI9VP4t3LpVS7z91OEVGeLeZIqX9Ij4NLU6niq0hPbrpS14asHNdUSlu7bgmKP/5tl8c4nfdnmtEQojDXZCW0JZR/3QpSpGAgPo/J4Sb7+yMurF9M49HYGvQOKHAzyDWc7rn9ZUMWn9N3kRqLN/91FXmZ6nzOWe7vCVaW8mwn7ePnIf8WdELM3TFtW9byHFwF+Wvr/jTO4gBNtr5JQgY8Z6hZ/fUtRJqzBCAQb3IJDMnJ8/ktdEDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reZgzkMew9Z2mOzYyqPsCKuHLP7j3BdbyL7emxhhiP8=;
 b=tlJSe2q+hFOYcyBTYmp88JEG0wMWJj0vjpatRCmKUWq7vGKFbrR5FZU3aRJVohh8QjcxyNzD8njggLiDUEHdSabbwNbQo41d8qFmrNrVHqoYQUcwIBDEfv/gt0NKe3w/ARNJWBlRMMMyyuvnWB1xXYjjDX1bPZPFqmVl5h5HZpL113HQdL9bU3fe8YU9r73LUipyD/by4v9ePguC1W8IgQQvRjv6v5EqEx4ovoYK9TyYC943SJuyYBcmvE4oPUMcyz7A39l8Uy+Q2B15cRmkcSL3jaOuCy0yg70gW1IuHY3crHPG52USm7Q+wp4x8kbpBnli6XbmclhP/AUqecRE+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9)
 by SA5PPF6407DD448.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8ce) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 29 May
 2025 05:55:03 +0000
Received: from CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6]) by CY8PR12MB7705.namprd12.prod.outlook.com
 ([fe80::4b06:5351:3db4:95f6%5]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 05:55:03 +0000
Date: Thu, 29 May 2025 15:54:58 +1000
From: Alistair Popple <apopple@nvidia.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, 
	Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
Message-ID: <xuk53vslmg2lserkjew6rudlgrjipmoiybsu5swhoxcdbiaken@pnv3dsuhfoef>
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: SYCPR01CA0040.ausprd01.prod.outlook.com
 (2603:10c6:10:e::28) To CY8PR12MB7705.namprd12.prod.outlook.com
 (2603:10b6:930:84::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR12MB7705:EE_|SA5PPF6407DD448:EE_
X-MS-Office365-Filtering-Correlation-Id: c8371947-8f75-493b-d628-08dd9e755aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3wDEZoQvlhx8bRfXSgrlEUWl8qKZHkLKLeSKc1ZP8M3wwpUFNLWXUE6/76if?=
 =?us-ascii?Q?/rlUM3or9Rh/vC0GSUJpQKh4lE3OtoFtFptAFxJOaDXpsWvdGYMIWnPsrR6F?=
 =?us-ascii?Q?AW4Q2mz+DR9SLzTP4spFun1TTQR97N23/X/oONOH7flvgtTNq2K7kBxpdBY1?=
 =?us-ascii?Q?WHN3TEKj9BpnGAZlyi3TXYFI+Edf3dIaVQcVCDZJ+dFaADeixpI0Cpp/otb0?=
 =?us-ascii?Q?oYXmkSHPX+/UwEGga5G/0zy0NlaYvJe4IE0ZRV7eJQrCmgFV1E7ksdAi3USr?=
 =?us-ascii?Q?UoBh18c1T6x1CwFnsctKglu6hvZ81OyGJS+VAw5N3Id9vS0XT+rdlubIvmQ4?=
 =?us-ascii?Q?tW3evVarQhTOPx8wcbXoic/7uGNcsoTf3jYUCwSUdsYeXYjjxCRGmMGuNUza?=
 =?us-ascii?Q?N5RHMHYBvzAZDsBlvxYUFEsFc3+U7431g0GVznDiWtnJnnQApaoM5ULvtOIb?=
 =?us-ascii?Q?spe8ir35MVn47KtUyRMFUiagO9K7nc1IitVdLkI2yLOArAOji6GMuZj9Qerh?=
 =?us-ascii?Q?/ZC1j05tYpztVOmA8IohHrOaJf0vY3bBOwvdozAeUIxGGI+a2Jw6qitfUahv?=
 =?us-ascii?Q?Vezo+OtxpiGiqnUg3fQLWKiS5DQ3GLzMlnf5rb/nhi+pGAQ8QSlxjrxdj67q?=
 =?us-ascii?Q?l3dxKDrkPWN7yElJ0lvP45kRM15uoxZa6Ug0iP1cvhRG9hzwQw3Ehh+69KSp?=
 =?us-ascii?Q?YRW8im9QLkrzewV6+H0D/kFDLLBBDBy4BcoPjXR4fV80qxYUJjwZRgJpeyZn?=
 =?us-ascii?Q?Rur0Hid3v+ymLjDHy/dcW8shYje90h6fhZm6mRjI2pK+1+okBSSjoDm8dFAi?=
 =?us-ascii?Q?yiYbgNXZJMh/9g6ZRkuoZFKhK1MC4TwwX4J4yKuYt/lS/SrSPetXtKnjIk9i?=
 =?us-ascii?Q?krL+gValc0tUw+m/dE/b1EXe892NbtdXyRa0ldyz1aJtUvack7FTfR63XsmS?=
 =?us-ascii?Q?a1cpvBNz1w83blY4Ga8GN1ZP5in72TU2a5dLRJHHsPSX55bcuLtdZNPdfXUS?=
 =?us-ascii?Q?MZ122ayZ5L7Ron5G5bWfCz5hN02WWqTvfhQgbQjkkcGP8oy6b/slt8zeGC5Z?=
 =?us-ascii?Q?jHd9vEQiSQcrNRvXCm/O+O1UsZ/N69i9imtiUKWimuIIe8SHjRme8Phx7WHN?=
 =?us-ascii?Q?6kpraHsu/uqqMcWqOIADYQ8D0A/y47dPgELf2sWsq3VBXQuka2jZTVafiLee?=
 =?us-ascii?Q?ncmK1TMrIZ4y2b948jh3whp1Bw2raPHRRiq6aGtocTNyJWNIbCL0txbdHup7?=
 =?us-ascii?Q?H44Kkcz3pZcT8Rd40sLjEWoVDfleE1Cyp5c9ZsdCXdHLHHWQoYMKK+33LvUx?=
 =?us-ascii?Q?r081Gz+ntrlgm40pmW3ka4eUNJ+hQ0Uhh+YRa4lsiH6lstq4bWzbjHEPmiIQ?=
 =?us-ascii?Q?x1sbAGnPfhlJGlNVlaVEPx+2rBRTxCam5AWut57Gk2Ly0TffwRILJpsGhMgV?=
 =?us-ascii?Q?IIKGWNQY2VE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7705.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gp0kNXuHPiarzC2ep/aiMndOLO6g01gQCOcX7XauFZ2ISEgaypU+n4sMoN7h?=
 =?us-ascii?Q?6KelggYMQZqaDcSmLNCys0lA/dXRX63lmf1EInP39bw1M0PNamSicFSAdNkn?=
 =?us-ascii?Q?0mL1Uy7TbE6LrLmxNv1YeUbt6wR+zWk8Plfg/MT6L2/0qCFaqy50EM3G5ZTc?=
 =?us-ascii?Q?/czktS5MAybp6SO4/pCfpCcTGKNt0GZSy4V98aEPk5BAt01IdwphrjCnEEtq?=
 =?us-ascii?Q?KdyIptdAjBG+zJsHmjpODGIuY86nVyAwQWrbUMtF1b9Ev63BiGm8djhjEnM9?=
 =?us-ascii?Q?DZA82iSY4TPL6iWCkUHteVdIRADURs4VZF/qIPS6ISa7RUxW4pYDbnODO27C?=
 =?us-ascii?Q?Sp00B0vS2jRbOmD/q73OoXpCDKYmd5AYDv5LTv3K8FFxvucPHvzLkJx4RBuC?=
 =?us-ascii?Q?/A7mh+2x0TSUgN7yDog/C7P6V7yBne+vHfAf8mA6HagAlpCPy3oklfWwmhJg?=
 =?us-ascii?Q?FmooHI5CT9ip1t0FU3L/iVHjVPaY0J3apgC8goRn74mceK+DOLNgzLLdDWJa?=
 =?us-ascii?Q?69+fZFMVdvDd19hBBPfjfMu2sltW0XjrZbPQ5aXzotvwL9Y77SsqSBU0E71e?=
 =?us-ascii?Q?9IPcGt03Wv9d6g/dz/nth+rEk+uwz6U6MhgkFyZuLM0p3O2P5sgcurP0PKFi?=
 =?us-ascii?Q?pKTvZ1i186M0rUmiLCRuQjeWgzB9+tRKZP1PU1YiMa4Npp4djqx9EqcwnYV2?=
 =?us-ascii?Q?HRR8/SEO3Zi87Y7dVLBLTrB/4SY4hH822DmKy1VssJ+rjiep806TetleuoZs?=
 =?us-ascii?Q?3sKCoydiaWWEg4sQH33vfSHXyOSidO367iHVYEwbvzr6p7q8vIG2wlkMYyhl?=
 =?us-ascii?Q?JrWVmKeTQoifq7lMR1+7QqoJ/UzYYXkWd7u2ZgjvMk1rplxngeMPQRqHC8pa?=
 =?us-ascii?Q?V2NY2Nv5m8VChcPyyfAiWkLvuOGzANvYF1BXsu/nJQiUfI8ocOFK4NsNRQVG?=
 =?us-ascii?Q?IEqofySkCG3qgoRYCkmU8okDlbDsz0fmpsvZ8DO/CAQKGvS8y5fyg53P5rP1?=
 =?us-ascii?Q?yE12qNYWFr61hiDMBZ3V8UfsRLNo4hv5AjivN3H7mTk3OHRH/1u67ZsVtnJC?=
 =?us-ascii?Q?gtomACUKnX5egsuncTrh5zZlygkmlFdMywnS8KU4RdTWNjTMCrQkX5wis78o?=
 =?us-ascii?Q?FIGaDX1Z8Ao7PxNIuV3GZGZortZV/g+dzj74g7eqZyoBOiVQulm90KqGDMWG?=
 =?us-ascii?Q?7x2kTb24XWmY45/NnftBUmgDk1QZ7UctBccytkq89daISgnrsGvIMdT6+iep?=
 =?us-ascii?Q?ugQQnpCYsVZqZSy98hYlyO/hkR1mY5FXPPvhG/HP7QYCKGO4GTMLHbnHKlDj?=
 =?us-ascii?Q?DM3j3fmQx22BzDXkr6lXWqrheBk1yHYDvQmRAyv7eRfFm1fEVpbWnKKpRHBs?=
 =?us-ascii?Q?hKimrppU8W+uzxxL0buZeIQE1uM2Z9WCT2clGyGkIC7Bb/mqjGA831YqyvU0?=
 =?us-ascii?Q?9/Dw3zTAwthTh+S2V+cZBbZcASJWZyQJPgUaLYvRC6rS6nIv1Xpm0U2uCXFi?=
 =?us-ascii?Q?XztXLb4gVlCSBhMomfVnOC75uGm53stAsYCDFOFTjf8Z3ex1PtZUM5HfeuWo?=
 =?us-ascii?Q?b01U62y0AhNkhXmzEG4QiU+roisNFz4WTWSitWcW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8371947-8f75-493b-d628-08dd9e755aff
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 05:55:03.3104
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zn9uVyLU2SQAXx3sFRHTiRefbV5SrLtcPXlL7RbxEkfVZ3G8Zq5t0XvEyp4PgdiKu3jRLtZfqRfI9Zci67Lb7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF6407DD448

On Tue, May 13, 2025 at 05:00:07PM +0100, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for memory policy and
> migration and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>  MAINTAINERS | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..29d73593038c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>  F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	Zi Yan <ziy@nvidia.com>
> +R:	Alistair Popple <apopple@nvidia.com>

I'm particularly familiar with mm/migrate.c and mm/migrate_device.c so:

Acked-by: Alistair Popple <apopple@nvidia.com>

> +R:	Matthew Brost <matthew.brost@intel.com>
> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
> +R:	Rakie Kim <rakie.kim@sk.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	include/linux/mempolicy.h
> +F:	include/linux/migrate.h
> +F:	mm/mempolicy.c
> +F:	mm/migrate.c
> +F:	mm/migrate_device.c
>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>  M:	Andrew Morton <akpm@linux-foundation.org>
>  M:	Mike Rapoport <rppt@kernel.org>
> --
> 2.49.0
