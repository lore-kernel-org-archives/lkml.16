Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29130184
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865173; cv=fail; b=J0pnW05XHHS7wtDwNbqlpXuFVxdS+qg9cNQ8w5JvuZ3FdZ+UBgPrbPs4yGYvHzyb/1O26lTBSuBpcU46XUtGxGteGSpKkSIsRE50wr3uRnjtIjZRw9OqPkIf0kbWbDH9MfbK3lEKykL6hiipIKwkInc1ITfwVoVHGlvcg8ZfnfU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865173; c=relaxed/simple;
	bh=wpgs/Vnuv9weITmn5HkDncQqx4h4RL7U7jdL3F7msUg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=k554eJm625jZDg4J7PafSXnP7KOpL7NyhSmr8cLnnWpCLLJOevFyq/t/g0WaekjUk0Jt1SLVuWylEkp5Sf8tTpHU6DTlJHAzrSrVhHfwgyWapAS62SA2/3gGywQ97w7EF3SHLAjb37Mz8rs3vdUGvf8OGgooYPec8UZjA6fR4PU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFZZsZXJ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFZZsZXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747865172; x=1779401172;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=wpgs/Vnuv9weITmn5HkDncQqx4h4RL7U7jdL3F7msUg=;
  b=gFZZsZXJw8Iq7vN/O1Ql18cNVZolJV0glyzDpS3aFITMJ/TlzuhzAXwW
   wKxGCPo6KB7nc6NiV155KauZ2PaWBNsCTZzQc63DfOAMuE5Gvhfj7ffHt
   VckNreaoY6TSbObjXE0lJmZuXc5p17RQMtMCd4Gi0ljRcFGRAQrrEsqab
   hnlZ4TsPadCBUE2WeAi7WrlRDQ8Llj/HTsLr2E7xICFqsa/nhNws0lwTw
   UDjG2diOQEa3voV3Z9eX6X1PblkS/X+6G7ke5vNTreMFOUESbVrenDsx6
   v4aQ4eWkBlJ+dREorV1j/fKY9LvKwZvRTDii00ugskiWBZVvk2FM0pjji
   A==;
X-CSE-ConnectionGUID: Z0kAYhXFRA6FXLEGjGcbeQ==
X-CSE-MsgGUID: TMRuWa7DQH6Z4UWqp3kRzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60503879"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="60503879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:06:11 -0700
X-CSE-ConnectionGUID: lIJtgBYLRM2vjOl+qVtQ4g==
X-CSE-MsgGUID: L1FnozYzTCi6wAbhdNVNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140799003"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:06:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 15:06:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 15:06:00 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 15:05:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dolU+Ryi6C8O6PfBmUoz3hBaP8l6BDvlYnrcC6/vznVyofRRkHRxxF9z1Sa8HlZrfy1+ZZtySOpRJffNFCyRffIewlz0tjjv6xDvwC7t9oWF36FkDw2b7t5GL5wjpLCApIaQT8nx+Jk78UilMdfrJXtBXT/GKa9Gb4b0nxoM36UvOtJLp6XkLT+NidICTR+9QuCHSmXAlkz7+aWr56TwE5SwSrq8dFeDpNKmW2ZAMd+3jaMGPCMEPHO/noB5C3WZXd6f/SPf6zowMGcr1Fwgp7I00YdaSYrCK76XUSaTkgZTxI/7dof/NM5YU6XB84SFykoFzZikD5YYN9gk5f3GoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ySQhy9y8QbFeK1J3nzDrzwqnFkQAsmDBJC5JGS+JEo=;
 b=o2Rzlmh3c2lu0HHEQv9uK5aLbowwykLL+fgcXF3L9KXwhSjVbttIYtBA3XISjklsU+n3Rv+Q8h2+mxjvu1GDD65RCl0LG8HMhE3RZU3mvbNZO9dbzCLwAlp2molx7xdoOSNcKp8m15yrCIXTf9nUnl8HRj+m5XN/fYE8IRyGOC2sTplBGD93hO/fm06IW4n68vXC0Q6Cux8VWkyBXIZAbqNB1Wn6+DgNho8LRzDhv4kF9TiP6E4uC2teMFnnjCUzSR0aZ8tPiP9AzD+D9kK690lAQGRGVN+a4yh54B0yMlfOIKnDyebS0e0szQrBw/9JWlq/5YabvPGLkJpPd0YL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by CY8PR11MB7780.namprd11.prod.outlook.com (2603:10b6:930:78::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 21 May
 2025 22:05:56 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 22:05:55 +0000
Date: Wed, 21 May 2025 15:05:53 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] x86/devmem: move range_is_allowed() to
 drivers/char/mem.c
Message-ID: <682e4e416f296_1626e1009c@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250520152030.1499670-1-arnd@kernel.org>
X-ClientProxiedBy: SJ0PR05CA0065.namprd05.prod.outlook.com
 (2603:10b6:a03:332::10) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|CY8PR11MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 06da2087-c09b-43d5-0e9a-08dd98b3a8d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w62PGFIJNMn787M3u2tfiL/f9WwPCBbt4HcEYoi7D0UH93rzNLmsqGe/MvrV?=
 =?us-ascii?Q?gruLt047Vw7I0bz1PRmNn/JwYLKrNdjvPUxsiOb89sP5RWF4DW0H0aYUqgVg?=
 =?us-ascii?Q?gkSG1KsoZWtdeDWK/lEX0On9geS7rPxOzBl7Ff0cl6RIctxwz5pzP858r861?=
 =?us-ascii?Q?17DEFFuJqoAGHloMN+xdyScn4rhWg0OUQ18JEWULsybU2hdniDHIx3/8308P?=
 =?us-ascii?Q?Ut/HXAPuVPCnUYZ47/0+Ytr6uKyMKIAbGp1R3UuYjPoULjc99h6C0C0yA77c?=
 =?us-ascii?Q?gMvPPyR3j9UIG7KQWD5E01jKZKpDG45Ip7FCBla6A2QP6nQn3tRvyYGzWFZe?=
 =?us-ascii?Q?cZtCdrsupxDXE0slME27ynd+PAOOFOdjulzL74nm1u9OgzaF9qmdDvhkfvo/?=
 =?us-ascii?Q?gsUwKF1cietmfB3a5tzNOoFOWtrBbH9bKVgt1Fgw5GijOM36nt60K+WvA+32?=
 =?us-ascii?Q?z3ax45cyfIW1fsPUmLj5cE35qfwxBt/bMPjvlh0Vx9vsVve9OtifmD7enrEi?=
 =?us-ascii?Q?3FRw1bTqWyd3qy/jfJ6dxs7GtZt4JhiYNFogFY2puWP/pO1+aGRyZ601eL/u?=
 =?us-ascii?Q?YJXG+ppIVtvB5E8NetuqC44m0qxWxJOZ6lm/UdP2V1CH2pG+Af0O9KbcWm0A?=
 =?us-ascii?Q?3l3UVJ/EbwVBwQp/NgigG/WznaRNBJ2mHTghprkFpRDVrm/CFHHUjRF1u4YE?=
 =?us-ascii?Q?01rHtM7/krjUtYoH7RJfI2c0ZUOXBriXRZ/4HHMAWbT2CcVABSpTRPXoWWfI?=
 =?us-ascii?Q?8NpggK596xVjQET4Ohav04s9oetFVz0Fv3FQU2DAqDUrnCMC/AoDDu6jlqe5?=
 =?us-ascii?Q?K13mdbnqI347uOzb/E5BiEW2n9oWAfk09/Sq4PuI+8DNHSMIAnjsycQs216b?=
 =?us-ascii?Q?FYNKbP7TjIs7sG7AK+ewpyihasm+7rwIJdsuTjztqp2cIkXqx0L3FsM5/nXb?=
 =?us-ascii?Q?QsE4qCrpBbw2Lpx9EkoN6TkgZxbAGc0AG22gVe9tijN6Gd7in0os2Y3iGN1n?=
 =?us-ascii?Q?enH3qkwgNL3yQVJJlVXgHw9P7iV8iV/vxhBDF2vzKEUGnNaEKX8N6jLGChg5?=
 =?us-ascii?Q?v3Tl/nRIiiIQd6iC66bu/Tm/VG14DnSkcd72Otbym78f+YQlh4ZKTlF65Eys?=
 =?us-ascii?Q?gr7mlYajI1HJREtA3pEXZCPCDktyXuwopUBqIpMZ//hd4mtawDJGd95HRm1L?=
 =?us-ascii?Q?AUC/EyrlDpFpYyV+7lfocfsCrdDimir7ysJvRyg8pJeWNiC5v34Ghbew13Fc?=
 =?us-ascii?Q?opQzfK+dtOwmuLtIpYiEGAcVrGZGjEGkiByzMzw16qrmu5R3D9WYdUTHsuzW?=
 =?us-ascii?Q?EXaE8dWrh6bl/p4DX2f3HS+Ltv6+6zJ7Jran8V3oUJgqVy+u4vqW2PFKiSbE?=
 =?us-ascii?Q?ZU2yC7WXY+KotKcLnpgzhJjd1h3jMncSimH7ffjqc5Ec1COzpw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Rm1nXviNOREaEggoaCPxHXTKSwObrzFN/UVlIr42ghtuGidDQApdqbacITVB?=
 =?us-ascii?Q?K/VOWuHoULAGPna2y353nhZFkzZ5yYOZdIaYvthRJzcAezMWE4QHEjR7yq4k?=
 =?us-ascii?Q?dvEqnE/n5iyws/2H3nVMY+iWxJ6FC8lZGkA9CPaEe8PJ0chinAOGZt4ydVKS?=
 =?us-ascii?Q?D3rwZTFFIFdAs8NILzmCnwMoUH2JvQ94QEte7SH3sHkG7bySoGlxe8qaqYpz?=
 =?us-ascii?Q?Xff9/h747jeEq0iOsSjMZaxy9QSc6/DiFWcGmY6pyc9V6fgFCiyp6ohTbBRT?=
 =?us-ascii?Q?kZfeOM1Whm/7uiCK6CwKgijOt7MwdQu0imUDsjslGmdkiH4xbTcW7prgwcSG?=
 =?us-ascii?Q?9OUpxzQD5RGm5s9E8p41ZFWS1bTncq46YFkKbuJ4xu9L8kmQBtbxtfzNoJQ9?=
 =?us-ascii?Q?10wp/kZbHfjJybTYvgW77CuFMG1VwvUh+msbbTV1B82GnTXMKNfxfuVHnk71?=
 =?us-ascii?Q?bbgzTDRXkHHn7ttu/xlEhJMMx13KR5xa8O1Mp9brv9Kiqy3oB/0ezaEXNuKI?=
 =?us-ascii?Q?AnT+92KxG3W1zb2OlaC3/7YHwgY54RBOktlZ1mAJfGcfAM43/XL0gXIlX+mx?=
 =?us-ascii?Q?HIeSN/6X8rxS2LfrSdIrZhvJjukWCkiJssXf2ybCnsTVwFEnOPe1I1DfC2ra?=
 =?us-ascii?Q?YXlIlfXVEZ95m5dgYpm/AdLGUNUtfnh+lLBbkbkMaL1iSyla1VrI+B8g76mg?=
 =?us-ascii?Q?lQQSBy+nIkWVaB7v0+SvPEwTUuX72RF3IkEPO2HHzB59qRxvEUX4jWRmNz3x?=
 =?us-ascii?Q?/4mRVNQgoSMlD/zk07M2DGlzDMXxCVosdSFhDZiID6AeSBG2GCIsyQnrYZky?=
 =?us-ascii?Q?uhG0UwcT+bXBEROAQdK9RO/s50tY9WYT++gI2myV/Gf1ECqVjq+VMdYywcGI?=
 =?us-ascii?Q?UCCibuDa7IsFCW9V8EFm7lFFCVBXipbTtGRK5rdm7eBEWC64AB3yYSAI1NEE?=
 =?us-ascii?Q?+zA9hLicbweV2d/BKNh1yhIiY3jVSg/3UZZ2EOjQd7z65gn2tgaRmDGP3v9Q?=
 =?us-ascii?Q?g4HyASYamdDiziuy5noMmmPgIdjepiSx9UxCrTt64GMjHTls1CZ0vQFyz7Xt?=
 =?us-ascii?Q?C/CazZ2dlANWVNZC1GplJ1BDzHBNbFr6SHW+NzrkaL5K4iRrtIBNUwiiGsN2?=
 =?us-ascii?Q?eVzhSP2fGckY0s1oy0IGY4iNxQ9+bsWUbLrMmL6Vho2gDwiJrL0+9aomhzuR?=
 =?us-ascii?Q?feJaQOhn7+Y5KqngqAnjGIZtLPKz739MGFUwGoOYOdfH1V7Byh0YYHYD8sia?=
 =?us-ascii?Q?qEfAwVGlgtvi/ajCOz45gUmarq8b94DBQzSrwTOdlk/rMHZVHCoWi36F1vKI?=
 =?us-ascii?Q?3V5yTJKtnMpjqHoiGZ4/HTP+ggS+/0uaSa9u8VtPr8Ab5ph7PV4xxxIcwO4e?=
 =?us-ascii?Q?B0e7p+PEgiJkj/GuIFi/HZpdf5E31HI0kvjcXBtkFPt+WCmeLSiDiPy3Xgtq?=
 =?us-ascii?Q?fLETnT5pm5gmJjtpdR76dkxCWe/kzgnZFWtqDY79EIHLqe3+zve6plfilTn+?=
 =?us-ascii?Q?k6ok2omd+slN8UqTTYfaMNBa8zbHQuTMD40G1CDTyBS73PzjTPmR/tBocSxX?=
 =?us-ascii?Q?rIKT7Kto/v19nhl1+X5y2uCBDyaUS2+MbZlnI12fYp7GM4UHdJ6pm5GsYjCe?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 06da2087-c09b-43d5-0e9a-08dd98b3a8d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 22:05:55.6847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEM6rP9xnOccSXVT96F3Z2u9llOBR6WWlc8O8zDZBC6HcmutZe0MJnXCqCL15/aUHZ9me/3gnyjdoEw9VDoDCoXcatntYepzdWrpYyUB2Hc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7780
X-OriginatorOrg: intel.com

Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The global inline function in include/linux/io.h causes problems
> because of the unfortunate naming that is too generic, and because
> it reintroduces a dependency on the PAGE_SIZE definition that should
> not exist in this header file.

Ah, good point.

> Something I had not seen during the earlier review is how the
> x86 phys_mem_access_prot_allowed() is called directly after the
> generic check for range_is_allowed(), so checking it again actually
> has no effect at all, and the definition can be made local to
> drivers/char/mem.c with no other caller.

Oh, true.

> 
> Fixes: 1b3f2bd04d90 ("x86/devmem: Remove duplicate range_is_allowed() definition")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/mm/pat/memtype.c |  3 ---
>  drivers/char/mem.c        | 18 ++++++++++++++++++
>  include/linux/io.h        | 21 ---------------------
>  3 files changed, 18 insertions(+), 24 deletions(-)

Looks good to me.

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
