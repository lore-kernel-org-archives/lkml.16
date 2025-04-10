Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489A28FFCC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 19:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744312851; cv=fail; b=TfqbFX7vzFrOe1vffiSUFsgUErZbcsY/FQVcb9RmJsBiJf+FQkfCkDjaJPs/JCLle4g0dnB/zmgC++d0aviIQU/Nb5VcKZBBoRRRZlXQVf4J6blfje1Te1k0KbsF/fw6Vj7Jjl/crKw9eG2s5Iib+pB5JXD/CDQAkxbNZoAQIOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744312851; c=relaxed/simple;
	bh=JKbTpyIvwgqnJurDLbcVUKnJQEE8jHxroOkDPHQYEDM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=axZzGP8qAniklQDb/vlQ/Lb82OesXyzbUEBzUmQJ0dfrmgWBF+MDYQSjVqTWrIuqUVgs/OiPvuzFZ0EwNeMsTLHVckScYxvNyCGW0L6/HDWn9r+fXBFVCvtlqgevdl10DK5k299/qFHz3F0+63Pw54NUz+zSHUvrIYmjnXF6kFI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V/0vcd2l; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/0vcd2l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744312850; x=1775848850;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=JKbTpyIvwgqnJurDLbcVUKnJQEE8jHxroOkDPHQYEDM=;
  b=V/0vcd2lRbqOiozEtuSF84frfOiSidH34LggbDRZ8n3GNWmcKaJqRYz+
   IfYx/Ry1udNIAFA1lP4KQ0nFZ1lfWmlbjro6uNKDkQySs1eYf/G3KNcq/
   +DOO++rQqZJNev7V3pneBytLyCtvU4MLXAlpTZNf6MnFFRKDGZ/bA6yBL
   kBlWrv+KOn7htui9Br/UBe/0UgNlYJ+L67FwkUDu/LCvMW5BMX/mlqaEg
   /E2x2LOqlDTfthCrMysT7Hn8E6Ucgl40GVxVz6FdCd03JwjAHaaVd3TvL
   OS1uVU5qGqAWHYaNRVmZlU28VOeg+MZlKtL287oXfeBDYNwijSgJeaeSl
   A==;
X-CSE-ConnectionGUID: AnqxF5xiQVqHI+pc79dwxg==
X-CSE-MsgGUID: p5B4hXSKRiW2VJg/GCcUfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="56033753"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="56033753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:20:50 -0700
X-CSE-ConnectionGUID: Jd6H7e63RZqKjiGNdTuC4g==
X-CSE-MsgGUID: nNnz55DOQdaXXws8DAOGog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="133856487"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 12:20:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 12:20:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 12:20:49 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 12:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1/6yRnNm+yr8VYFUv0IDIyjtycejS/KaoVLzL9RAv+TcUXqaazykaDi6K/lyYuMwLpRsqtzyWsIVKtzcUaMwgDoDfQI21/Rvwt3MXzeXchfAdxgQYrVM5UgxX1wmQmkSy1Yztu8K2LHwKr0E6JI5lH6HN+T3DCQpnSxvg/TkchF1aZnuPOaHVXC0n9adfyq7m+GMRsvPgm1qeRlo2oR0rhrZocxFFmYS7jGO4fZtb+oTuvSzGvGP6QVLVWEbEngyPNyX9NGEzHzMYFpgaEiBX9nYu+O8DuxL96m2QOLUDJxmtHo3A8kme20XtH4MURwhSDI9lEx/NGS4c9jtu8Sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tz9hF6BBiZnGWCUtthAGHBD1wBffvNEP5p+I5aJwlvs=;
 b=im7KI67i5pEzLv+huuaPa5+Ub4Drcg518Lj6MIjoaphpfNwDc1IwBCrxytRO9r6BOEzwZD+lVVfGhZUAtjrFcjO8uM8Akv37nvj5FYjonU5adqSbdqvhxAP/RqvKh3gP3xv/8KVDW0/etPA0NSnbqWtz7DA0daRe/UI8+A9wNV+Bx4yCCeaNcEY98U1zSQ+V6F4/FLH02Aq5/tBc+VdI91Q54181AprOdqBp4uuMcLeNENyetGhqv7oT8dmdvB2wB2Ir/MHe8FwhSX+mRZsENgUa42M/MPuQqw4YidlPQTSJ2O7VfOZAMUt+Esz4EMC4ttcSTTn9GdOXFL5SmjPG+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 19:20:30 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 19:20:30 +0000
Date: Thu, 10 Apr 2025 12:20:26 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, Kees Cook <kees@kernel.org>
CC: Dan Williams <dan.j.williams@intel.com>, Dave Hansen
	<dave.hansen@intel.com>, Tom Lendacky <thomas.lendacky@amd.com>, Naveen N Rao
	<naveen@kernel.org>, <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Kevin Loughlin
	<kevinloughlin@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67f819faa4e0b_71fe294e1@dwillia2-xfh.jf.intel.com.notmuch>
References: <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
 <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
 <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
 <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
 <202504100931.DEC3D3B79@keescook>
 <e67bbcf2-02f4-4ce1-8ad0-b1f1381c65fb@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e67bbcf2-02f4-4ce1-8ad0-b1f1381c65fb@suse.com>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: bcb335ba-55b5-4575-1fee-08dd7864c1f8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fJSilIWWwNyeugnuPktY7jfBCcLm1yNxKe0KKIRAQzLzjVmMQT9pVU6Dauav?=
 =?us-ascii?Q?LNg9VvkO69HcEhBqzYcJb3BB5NyBjF9bT0Z/1gBg43zMatU9fP/n0y2twpFC?=
 =?us-ascii?Q?Trz1tgZp0BP1pPEkVicquuR6iMT+h/uvLIJl6EG8huqViMiz7HpyM4h2uTsr?=
 =?us-ascii?Q?7F0CJzL73wVUCv06j5ujIuEQ3pW7HgHG8Lhbv9cC4Jx89fSwjaFr2wYi5mn9?=
 =?us-ascii?Q?FXhm36wU1X0ysO6Z/9lXolnYjVYuIl4lEWMpE16Db/hn3BLa0WXDy6tBk8f6?=
 =?us-ascii?Q?8txh1MYmsPG2w1M91RiM93++NSNiV1Gg3JZMdQ+pVT0P0hfC8FsrR252Ihlm?=
 =?us-ascii?Q?FOOf8YXNi1sOdMOJT5MwWnKjTDcSuo2KNz7ImkNSo2TIr+hAGSc9XpmPZV++?=
 =?us-ascii?Q?zb+3OnV38kaiCey0BODduDkEdcnEhMdKXbdnXKciH1owHF8i08NbTDAWikdU?=
 =?us-ascii?Q?jw4VxlQURFTblIEm+rS8WAzAqXncgnMsnNd6wKcT2qkGgkhxdfw7ZyPn87wA?=
 =?us-ascii?Q?vZ8FE140TReRG9MgHFn21bw8lxStB4X07XWk/FG+OYGIp62zfjXW9gVSIgC1?=
 =?us-ascii?Q?TO6pT0tBWSmFuHzZhKCh4jnW5B1G3dRh1VjtvqJbl0o9rvfkTMc00NYR+RLO?=
 =?us-ascii?Q?MvFCEIv+q8Lswm7r5PpX6QCK9OqQGdyypGoreMX+bZKO96M1/4f1ZfSyDsY5?=
 =?us-ascii?Q?6M5XGYsF4aspmg6wwdA4A35K9vFa+oxJS23tRbtdEgW3T5RdeLn3+YZugst8?=
 =?us-ascii?Q?W6Xaoi0Fqjt1bBj1NQjoVbvk1zbljbwgQU65I+3Jzr3liovvKFlIRLCEW2gO?=
 =?us-ascii?Q?v8X6NP3vFPgHfLKOuethfpKBoghogwYSPryGnezNZZUHft79czkA3tbYzAu4?=
 =?us-ascii?Q?6OsomjOEFUMX35qZ6V2FTWDffYNW4LFlUN3EQoIOCi5+Gq5XVX9sKkV3WqH9?=
 =?us-ascii?Q?BNhqSFDsTos6/5lYX4Y09fZsqMoRVqnupg+p2H8Ol0lWzheqgZrkZhYjjH1Y?=
 =?us-ascii?Q?Y4GXOEXTU8Vs0jNTHcPrRT1BKRYtOSRK48MJb/FVwkilZ8mGf69q8tCSw47j?=
 =?us-ascii?Q?vbtxOg6ntQoo3f/63UiN0b7mTWt8l36scsLacBrEUqBP/vnUyNq3o2dLqalc?=
 =?us-ascii?Q?UlpfW9ZXeZbkGneNgK/NFYS7CVXreBuhx2sn1YBGXR7np4nlNklqeeEmsirs?=
 =?us-ascii?Q?zkH1cvNZxvMUpeBkAyhhj+rkoJAOGB+0NODcyjvfUvqU+O1RPmOUxqn/wCgf?=
 =?us-ascii?Q?zFYznJQbtLC0vueOXWrlyiNimcMa9IBtxFlQoxXdNdW93FbztdHo0DKPSTjf?=
 =?us-ascii?Q?A3qJ2ol5Cq4S+CRUZrU5Q9Dez752TAY77cfG00kpn7JL7W5sr1n4n9X/T5vn?=
 =?us-ascii?Q?/8NsVUyyHL8M1Q7CofXwGmms+cd+G+1qe981narJZC72WOA0dqbC2Ejn497g?=
 =?us-ascii?Q?cLTe149oVSQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AgT6WXj57snXNHmmfJU0i9j2Rd2xdIDCiBDmCbqhz2vHmaBaZCSQtq2v/1rk?=
 =?us-ascii?Q?jw/j0K1QB8yebqCvDmgCqRFUkaSAlSuOznyewp2KAZV2UGh0H+BfdVLjajZv?=
 =?us-ascii?Q?1gtaKyluC7au8+iA8cSciCdJCm9zvStL1LYvumQpj7B/gV2bC0+5kxDbxuHM?=
 =?us-ascii?Q?GeJYicKe/VrXXbOz8dG5mJMxhgrdfphKutKYSrmWGxxDC5VdkCYdbvK9c0cK?=
 =?us-ascii?Q?oMUv09Ng1BcEJl4ZIqGNMyvPe3IhlMpRlKXacyIZj0GPF4rXVetT0Td45gzE?=
 =?us-ascii?Q?tRB6Jkm8dR6i/e+rVECr0qnNCLz8zzaC4ZTEN4gi0zvuL1eV+/7+11ia+E3N?=
 =?us-ascii?Q?7bBGUroGOMwsmhtHsDn6rFpgCuhaz65/3pRgTjOpEm7N0KHtSLRa6QKVXcyZ?=
 =?us-ascii?Q?+ccG4tma0bfAk0t5aYn42IY4uXvPsE0ibWXvVwC5QrlOzy1GUhc9GLjjC9Ls?=
 =?us-ascii?Q?+bEM/zsT/Z++v6O6mOn1Qmta8SbQzvQ7zIVOLayBvvFVBtdHRRvHqHP/qRQ2?=
 =?us-ascii?Q?jgHO4p2ZxTpcAGjSzgbAadlEHoBw4yvpwCj5+rxk+BcA2BiGDfvmbWBw2GUe?=
 =?us-ascii?Q?KWjmS8g3J2f0byV95xQY5tSPEdpg94lhXG+naiDEH1Lil/o6laTfe/6PSP/z?=
 =?us-ascii?Q?PbHFAkQJ5m1R1PLheGFfWGwBSCPmxS+2gO33AwndsCIf6IUs9QEgo2bNO9qO?=
 =?us-ascii?Q?HBQMVlfV2z7Y8pa6QFRK4JaZZ8gpmV8Xyjso9a2YNzua8iiyamc+hniY0O5G?=
 =?us-ascii?Q?54n+DUetKUf+VVW50WEYZwetOmFamfWCbcaUmDrVYaSDDQbo6aMwbvur5Abb?=
 =?us-ascii?Q?RdEgKpxjOEn7BmuIoY3PDDsaRIntgq5BShFNjBrAxQNxPQt/WYiN0jz9u5ON?=
 =?us-ascii?Q?YfRMtfL+T7ZfeKnpTl/T39318P/T0MI6uRQ/m+z5MEM+ubRtIr/BJTS48/M/?=
 =?us-ascii?Q?VIH05Nntm1DrTGx+1qXwlpkm5geTeicqAiNIH0sCfsAllU0SGHlyU+GbOIzf?=
 =?us-ascii?Q?sWDlKpsPlc1DgCZqSA65Ao53PVYjfXW2G/fNDEMU0TH2ts5/Pf3S9tjolks4?=
 =?us-ascii?Q?CLVgRKR3iBsmvD5DnUjIyWhxDi6sQhOS0qVuNE8psEmIKDvCj3H/YdUA+cDQ?=
 =?us-ascii?Q?YKPdu+ldbiz2hYXRIInvduPMQHtRlG+zh34UrcoQfH403RdPempCxR35BqXa?=
 =?us-ascii?Q?prwVdeV4VPPHKQAkV0YsR8iXrtgHVGfAWcgPetRSNqeO7anidfGhPBgumWB0?=
 =?us-ascii?Q?c2ZFSTLSl5qjiqDFrvN0zeUDypcxHHCDL5Toc138zpGJWgAij6sLwS6+NUgM?=
 =?us-ascii?Q?jxFgbiNDURK74yx8aiigN84JDqNGelPYzsZjHkWWKUmL+UDatKzwtwIonsXV?=
 =?us-ascii?Q?H7EZwxbRMAbnDKApebctih4hOPkZGo/NLMqlNRlbe7XWjvNHoXpNe5ZHZyeF?=
 =?us-ascii?Q?bNuKk3K6KIRWteQQpfFH64ONcXNX6LBO7Y8U66gessRJ0dUOZSN5s9jptZ7I?=
 =?us-ascii?Q?f/VksyZtS8P130B9+HZIH0DXvMRv4heMmFqwpNFbO7kazzgF0iisKtl7JDvf?=
 =?us-ascii?Q?WcVrMBKjKsAgrLpXfFtj0ezpu9ajtvZoXj9Zz3JmONrMoEo+Y6P5jjL1ts3w?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcb335ba-55b5-4575-1fee-08dd7864c1f8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 19:20:30.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X8n29rHxSsNBEDm4g4sGi6487CO8rnTBSsP6D1Pt2gt/NLPuxza5ZHSjiv9JGHVxgHlWufoHQHiJI1SMNB60dSHeLfCU+XoiZG+GdKwU3jc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

Nikolay Borisov wrote:
[..]
> >> Can't we simply treat return value of 2 for range_is_allowed the same way as
> >> if 0 was returned in mmap_mem and simply fail the call with -EPERM?
> > 
> > The historical concern was that EPERM would break old tools. I don't
> > have any current evidence either way, though.
> 
> Right, but we are only about to return 2 in a TVM context, so chances of 
> running old tools are slim to none. Also it's perfectly valid to have 
> mmap fail for a number of reasons, so old tools should be equipped with 
> handling it returning -EPERM, no ?

In practice that is yet another return code since the caller does not
know why the "2" is being returned and it is not clear how safe it is to
now start denying mmap in the !TVM case. So, perhaps something like this:

enum devmem_policy {
	DEVMEM_DENY,
	DEVMEM_ALLOW,
	DEVMEM_ZERO_RW, /* XXX: fix mmap_mem to install zeroes? */
	DEVMEM_ZERO_RW_DENY_MMAP,
};

The hope is that legacy tools are either fine with open() failures due
to the prevalance of lockdown, fine with read/write of zeroes to BIOS
data due to the prevalance of CONFIG_STRICT_DEVMEM, or otherwise would
not notice / break when mmap() starts failing for BIOS data in the TVM
case. The !TVM case continues with the current gap for mmap.

Or, rip the bandaid and do this to see who screams:

enum devmem_policy {
	DEVMEM_DENY,
	DEVMEM_ALLOW,
	DEVMEM_ZERO_RW_DENY_MMAP,
};

