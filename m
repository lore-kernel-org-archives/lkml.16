Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F6321E0A2
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747865311; cv=fail; b=OKc+eUMsrIrGbyKTLQa1H8srKG6dqWXDFntoBtrZTX3IiTiXwV4xIvYvUZxSoGwF1DlaijmkSZhseFjQMdrsoxAtt9UTKFOo1k7VcBNyz3wOpolSRj2xWGnJ0TN/ZzwAuUgTiY5pc1UVfVfSeERCJ6nvEy5Bu7C2yzZTZCQxllc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747865311; c=relaxed/simple;
	bh=hkQ2/qOEEhd3pGwtJ9VXJ2IunBpLWWiOp3NnuDsS3+k=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nZCCckpCu/Qhwxq5QY+1L4cyJClJOkIgU0kEungkhtr/SMb1EgDqKkuPldij37OGg5hGxXxdY+JNr24sIAzk1bFGnrVbAGk6vxzgFNuPK5oCOg9Z8Y6PY10RTcK1rNyLr3OgpvCzfD/z7Ei5liGZRhJwLAJeyprRUALO8vBhmj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PrQ0Ea6a; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PrQ0Ea6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747865310; x=1779401310;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=hkQ2/qOEEhd3pGwtJ9VXJ2IunBpLWWiOp3NnuDsS3+k=;
  b=PrQ0Ea6aV3CIyNT5ar/m+ZOaMlmgSEG1EzGXtnqIiT9xx1vg3QGq7XWq
   Og93B1AUey7aBWf0NNc/NS/DM49USje2f94FJlIorfgmcLZnBXTziafcy
   JrZI5trnpH04CWcdCRaRcywIQo04y1ZFUBxfvYmwSmebEMwUMsVcswnnc
   gbMz+477H6gxGGDAM63XEj6J4J+5FIoLCdY4abJ7y8AO5oyKhV1QonDzD
   jwxAbA/c+ERbeyqntXYU93zZf3L1W+SZF2kUgt1V5EmZpq3mUr25AItud
   7orLNbqIjC0+o92tQ2jC6MacJyoNrdbLQr/86lbdf8sEgimQ8Qj0JtAeo
   A==;
X-CSE-ConnectionGUID: M2UUMDNXRjK7iUqRnqeN4Q==
X-CSE-MsgGUID: 4KMHSLdxTPGz+p73bXEQLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="75263602"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="75263602"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:08:29 -0700
X-CSE-ConnectionGUID: niku4CFXS0q5lo0RXe0N5Q==
X-CSE-MsgGUID: nbb2Q6CLTguraYdgGspFxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="145528158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 15:08:28 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 15:08:28 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 15:08:28 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 15:08:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gu5qQ9uN7q6AAyBjKn6xh4SNDY1yJ1IQIjMYTPGCS1szZXcCFAhSOAT1Yky/Z7e9F9XH4JE4kyziUzXlDWV5oI71Ggsxrf+K3C2T2lbv6jw6lsIChihclKA6c6P5OqUKugzMdFIQcH5uMRmDZ63slRzVUS/2CDfc09nBES27qI7PTIeiYotQict1J1OPrJm3H+mxfiDkfhug9UopynYrygZvSZN8hqG6W00+DIJ30DVd/Yf+TtSDGXD4lQ8BjJjsOj3G8HzVQqbEA4+Et3D3t9XqPj/ZMHb9FJfyaJQbVY6LzsKOLlguqA399/O8WdTfvwsQS8ffzpT/F5MOm5dQHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4kVFOFajgdx9hNSc9KNwi0mo+xM9IvZZQITPHhaiig=;
 b=acjqnNxzGFuMK1M71sId1JNVNvUVnV0NS6i/4Z+cT0Cc91ci3Pmr3+iFaNeeuTk1hHwYR0RqxbG1yr9LW7JEUhtMvNQUHlxMppvhQPoI5fOeSgFbEtn7+9Ru8dQ99nG6joZdRR+AOCAXc/Tx0zHEzK+yLs0uE/rwMcrRFEZVEa7648FwJ8SLGrmV7GSby2HH2Z+tbbqIAszAYHdjn3NmR131eI+x/Rp2ak7Pf4yzp0TU7N5N7NS8FS2GRubUL7f9rDM3fmJGI4LUkZieOKbNA9NdThkYBsm3rMb50OmOIcilMhj7gbJR/590cJqedUlTq6unwSGgmwD6TY2JOEogGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA4PR11MB9232.namprd11.prod.outlook.com (2603:10b6:208:56e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Wed, 21 May
 2025 22:08:24 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 22:08:24 +0000
Date: Wed, 21 May 2025 15:08:22 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Dan Williams <dan.j.williams@intel.com>
CC: Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Nikolay Borisov <nik.borisov@suse.com>,
	<linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 2/3] x86/devmem: remove phys_mem_access_prot_allowed()
Message-ID: <682e4ed6ec16_1626e1004e@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250520152030.1499670-1-arnd@kernel.org>
 <20250520152030.1499670-2-arnd@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250520152030.1499670-2-arnd@kernel.org>
X-ClientProxiedBy: BYAPR21CA0001.namprd21.prod.outlook.com
 (2603:10b6:a03:114::11) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA4PR11MB9232:EE_
X-MS-Office365-Filtering-Correlation-Id: 01152c40-cce5-4931-ce0d-08dd98b40153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7KdRDDNgFICsegmYVyOhOZqWoVGf82g9OIIivkuTRp6LgeF59ym8lOth0ZOX?=
 =?us-ascii?Q?JAmD0oNslcm2IC3iPPNI5qsQjeHcRuElFqRN25lCxbPRozEDnZFEmk+BgRJn?=
 =?us-ascii?Q?dWrZ7f8I+Jr7Yxfi0e4PSGKTtsRZ1ew9Nbm822YVsCKeXUEMAswHub6Q1nhn?=
 =?us-ascii?Q?bU4dtWvXrDoJFafcYLTuRJnexNjl/Op4Uk5aiN4TdsFlK66oL5kPTP1F+LA1?=
 =?us-ascii?Q?Q0WyJ+nkJVgTG1Ls7E4Odoik78aEwAXLImFOaBS1i3zlZemjbHMVjdHclqVe?=
 =?us-ascii?Q?F3Gpo6ompTOoRSU/9NnkIA0EO7VhObd2FTXnieDB1iX6aHaTZZZsynoOlSzS?=
 =?us-ascii?Q?AwM0xrnIPaaA17jdiZDOzwVLlq++vmO/ssIJ1LqMey9m2UqzFk1WbYqAPV9f?=
 =?us-ascii?Q?crsz376IIlfnmxKyGGTeb8D6dtG0LAONkU9Pyhq7EkeTlZORWl6ch1Eygjai?=
 =?us-ascii?Q?YKv5mawzDUz/YFgcK4LWvWXfdKahbh5X5h8menfwI46fj5Urd/z/Ty0OTOIh?=
 =?us-ascii?Q?TYFl40tR/F+cy/XOp0WATmA2QI4tvLrIFOo6u5LdJZFlG/6qcIy2Wzi0bwjD?=
 =?us-ascii?Q?bTyFj4KcRsrLB4kREIt0OG6+iRq8JrqpFmVpmSWeWBkcio2GMFBfNP/pmvoy?=
 =?us-ascii?Q?2lr1Z6xRfpy6ps7zS/oem1VDb/k7VXC+IpfbAFbyY0oehHXOIr3Blt4ElbLN?=
 =?us-ascii?Q?xYucdL96JsWylHjF9W4feVyegw1+E0IhY7SWf37Z+75pr10E78DykAa+E4JN?=
 =?us-ascii?Q?DZItaUC4Fyq6dbb+7S3IMg0wwnvj+ONEAHhq8Lk5PfpDqZDuIl8d2ByRl2NE?=
 =?us-ascii?Q?APlslitZVGoRv0adndP5cy9jqk/fHVs7YeG+JifRGGmSgxgC4w6AYjS3VVts?=
 =?us-ascii?Q?ow0TaoOdUR8jDcYxx2cCDk7TORpRjWAPDLOoGBxRgbwxtWoQhnuSkUJQ6n1T?=
 =?us-ascii?Q?8HDCq0j5mLXPogvvpnOKLHgAJDOuWaGEZ6iK+h1Lzxy1YVs9B+gyEdTAOmaJ?=
 =?us-ascii?Q?0oQLsLSLWKaCohC7Q0pCX4xsnL/lmxlrS7c7Y7hcY8Oe0QaiU0noq3RjTCqc?=
 =?us-ascii?Q?VwM0oIU4xd5s6VnxFIdmSObynQsLp//rXcuacWaW4j9JffdiHJSv+qc9hjhg?=
 =?us-ascii?Q?PZzqe3nfElTOQAr3OlSiWUE4M37mbsHSbaKomTPH+CjPTUQNjUGrO7zHMs/I?=
 =?us-ascii?Q?QST+Va91zssXUOh21ylWwtYaZGlUpPXzOY//iIX1LXHtw81lDHNgy8P30eAu?=
 =?us-ascii?Q?Xp9W1AOb9nw+9wZvxtXq/RPFd8onMM/F4DGKEoch/0kJjHw9KIvW1vNZDIJj?=
 =?us-ascii?Q?cGCkuRFfrnfl0yr4d1w7b1Yj/WbQd0zc+W8j6ZmhSh3tFAlu3cQOhuEVdDyY?=
 =?us-ascii?Q?MGsaDTKIQqZpskz1XG9Iozsa/TE3Cj7Qp5RE9CylshOIRmd/v3E1w4kDQGtd?=
 =?us-ascii?Q?IjNVvG6TJH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4hcqk1HUeeyQfDPcVLBRBk33GqH6fFZWfk25jOd3kzXwh2/6kT6pif+r7Hh?=
 =?us-ascii?Q?kKBnMyhwS+zTUAHI7euBBoUwKMyAhGHsBnBe/ozqbcwD6hgyaO6mKtYo+YgT?=
 =?us-ascii?Q?pe4dD+iXafnELmEWCvYo3wg/GBCe6y0ywKMX++fsWCFFa5iJv3vVFkwqGETz?=
 =?us-ascii?Q?u0bKxWeGM4f6NHHWfed2rKIdeYLlbkQiLR4Daj1yNfzvjyYq+ZxLNuzAnAu1?=
 =?us-ascii?Q?EVhZjNgYGNiOIn4end6Od15572i1meiRDl99VKw1Avnw6v9/jp4b7vYxtWR4?=
 =?us-ascii?Q?lCuj3uRNey5nR5km9sA3Saa50ciJ+VYQGRohkN7MxPrfVUCT2FT+pn8Ft8Mt?=
 =?us-ascii?Q?zw2QM1qBWPK7Lv6URjRe+wcCuz9YXmmavprlFcSRicPdwlwH3QD9PIw4VS/w?=
 =?us-ascii?Q?QcyUCccg8fIwZbcNCyW/v++nvMNSlviQoS2oPZWOHKT+dkgHDR7EMDYoHf/Q?=
 =?us-ascii?Q?448T8nXAEL5fCJEHhtHhhGnQOTZ2PFebGuiDuKyoCgrbD7OT9+23SkrVJxX8?=
 =?us-ascii?Q?UM1nNM73jBcSF/S6suxUyCuJdQcLS3v+q2HZipUOsuvv0TelVem40OQLCKGm?=
 =?us-ascii?Q?wp2SNmNQwF+cHdrzQmes9Z4Ol4FT+j26bkyhLcfHvLU6V5sABpKXHB+cNuoc?=
 =?us-ascii?Q?vun2xyjCAp95XTuzP/iXnUmj2wp9EDmcbLXwGlpCiVgix1SHqOpLLs7nzo7i?=
 =?us-ascii?Q?FkTCSi4IWuR88eP91OqqqZGlU+hdKuwvFKJyrBok05uRU8Ufj1k1sxPG8yuD?=
 =?us-ascii?Q?dBInK8o+kbxsKgOqMiY95OiBFjGarYQUdVIGzgnfFnt18SHEynU3ch5lQrZK?=
 =?us-ascii?Q?gupdF1xQeFhXYB36ycRaRh4dJXIipCKNasaTvRkVyrSqxGHyY4B2YhGQI1m1?=
 =?us-ascii?Q?qAWZsgbmi5fMmxSFrp235ACy3nPxkX1SbWx8X3vOPRjAWUnSXHN1B5Lws6YS?=
 =?us-ascii?Q?Qj2cYu8uex/cDe43hcTGt4Jf2p3IRE6+T/sVmrluSyB5E+a9qd6Hp7/6Gx5p?=
 =?us-ascii?Q?kAb81UonKb+RlPxAMCvgZAUOiGPzzzi8DgYPcuyy5ar2CTl+DyJfSmbS7f4K?=
 =?us-ascii?Q?CFAKPCc0nVmYlar6WuAmgPerhzM/xLKBrVlTATpV8CGEkztoZC3lyUEwd4Om?=
 =?us-ascii?Q?cho5aEC7jAB2wznzM+shLUs9rb4Vl25teiuZRxftAPvFmV4kmepIJqz8sUWc?=
 =?us-ascii?Q?BqeIflrbMD7RY9MrNOOGrlGAxWdCS4nN7ie4q4Vrjnc1ibS/SwObyZNODfJC?=
 =?us-ascii?Q?PwzrMNNCz7c8MPxHO26nnXNv1GRTwgiRIBznuugTWQMwDVS6Jg42SfZmf6ry?=
 =?us-ascii?Q?z/GZGWXwWs7ej9umTS5dKBa0t8QC8UUiaHv1PxnjZ+KhSnd+5k19FqYgPdH7?=
 =?us-ascii?Q?lj5NgsnlsUB1zRPiih78o3PIFQht67HjfilIuQSZ2SKIbadXRo0XcGLp5dp3?=
 =?us-ascii?Q?L6s865mA987yDFTWjL8TGafhqf1IROpbeZRG/ZtAsatTMKt/fJL/xQvobaB+?=
 =?us-ascii?Q?Eouslg5PorbGnZYtAQurJaUvtiWtrSJKv4L7w06+vjyOsX59g23vauBWkNYe?=
 =?us-ascii?Q?ChAlWDOB/mJZo09hesjvwMRByd8BK8qJ+t8n9qfTTOGdfIRaCmvQjnxmyEUz?=
 =?us-ascii?Q?Cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01152c40-cce5-4931-ce0d-08dd98b40153
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 22:08:24.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSLh1/lPC9/2al/mFWy1rCBNbZHGWPjSARCaiqhNe6sV0jWXPG385V3pS6wWy181s4OhZXdHbRn6TXLMmSpdUT4ZLWPdiawgzLwGA8/61K0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9232
X-OriginatorOrg: intel.com

Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> phys_mem_access_prot_allowed() was originally a workaround for
> certain 32-bit CPUs, but after commit 1886297ce0c8 ("x86/mm/pat:
> Fix BUG_ON() in mmap_mem() on QEMU/i386"), it no longer does anything
> special as the only remaining bit now is the same logic that follows in
> phys_mem_access_prot(), mapping everything as normal memory except when
> either O_DSYNC is set or the address is highmem.
> 
> Just remove the thing entirely.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/x86/mm/pat/memtype.c | 15 ---------------
>  drivers/char/mem.c        | 10 ----------
>  include/linux/pgtable.h   |  2 --
>  3 files changed, 27 deletions(-)

Agree, I came to the same conclusion in the commit message of
1b3f2bd04d90, but then failed to circle back and remove the thing. So,

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
