Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00B264A7E
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914431; cv=fail; b=h0m91iImKQnC5OZH/Ot1MhCzNHWGkAu5Mw7xbFChdodWvRm1XxaJA1fDg81/fSgbUaEtGe7xustM57DcahnrITlQUxEoUXqxiHI2jHS73DUOoAhcmOeYHeKUSTwIIvDv8pBmnxzUttONbmIKlNe0QMilbnA7nbLGwZ5M3t7MkzE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914431; c=relaxed/simple;
	bh=47AcrXI0jCocSRofQXehIjDH++R/IihFc/B/Y62UepM=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IbkWsvFqaJx4SmKx2Q+ba75RQYEv98mWbW10eBnhCwMB+XwB+f2oJ9xjA4Oa9SYojBHcV/YmBTNN8asUvluBgXDjrfRZ8WHOOAc+G0LK5hwAfKOATtiz0OZuMHgbF94MngLGkqwcIx65FVbr2jrGxxr+08F0ywIPGofzE1/yvzw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NCPjx+wx; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NCPjx+wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744914429; x=1776450429;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=47AcrXI0jCocSRofQXehIjDH++R/IihFc/B/Y62UepM=;
  b=NCPjx+wxITj+vyTHaGbzDlir6xEY0b6r+SXEcLPUHiAq470wN/v0a+SA
   PhWhED8UUOvkEQaSMUSgbjQy2U9NZBDlS3GYf2BpurtTy53AImVYWZYZL
   vUBFKzkOswmW81mx1nsFzlU2+2FvVb1VMY8/JFtLb3km1oG9KP1/X7ay0
   h0Z7X3PRSSsUIKr/6UskvSR8rPZz7X5ZCxB7uky2bkTSXYs+rkoyMC37L
   NsA2QrENwxfd3eqf5hX1jcCrJ0ugifG7ZpvzV/4xvPdEZCQgpFv4anPGV
   egzo0XsCMpHUdMO7lRpqd+o3dWh/2hAKm/QMQdMr7yQy6mvlBdTKjLwj8
   Q==;
X-CSE-ConnectionGUID: fT1hZYZ2Q3aTTzmXRJvHcA==
X-CSE-MsgGUID: QZ9zRMapQCuDlzXRX/oD0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="45657357"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="45657357"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:27:08 -0700
X-CSE-ConnectionGUID: BsSt/6pBTaGh8QBeX/3FJA==
X-CSE-MsgGUID: rvRJOfy6R1upymxloE2wlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130883341"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:27:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 11:27:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 11:27:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 11:27:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JkXcq5w4oqVo9AdUoq6gOplBomLHa4rZDVqQpvPIxprVlEZclRB+y17uiohRl8bIqgHPZc2nZul7vdjDRY4MGymthYBZGs/UNXILUKJvNv6I7zvdV4/XDnD+at8FmzU0o+hcPgxcZaoJjPcq/+wfe/po4drS4KNHgVWqxkmuGcy37HR+33VAICPRQxDbRXoiTnl7VPAm8FUrlwwDOLqqhq9u51bU4V2vTkBL5lf/yfqq2VPOP8tIrD/RVaq3T3FBnBp3WBomwVIGCl16jjtUpZWeioGgyfgjkTG2qgMtbPDrGTWG61wxsNmtwKF33MyDWxn/8ljAeJ5W7EAWrHEt7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cK5jGEAlbNbBAw7dNJ+8yierROMuhaQA6vCg0Gffhs=;
 b=bOUW52go2bw41lBftBbquxYY/FaC27KwezgcbqvLRNOThHBOKTJ3hJinopVLPXRi/E/P/kxcmrvQrxEimT736SAhXYs4aZ1HXSjNvelAE+EBUWu2czEOY6jMJd1c5Hj5hdWa64DPTk+JpFbIrBaXUoKTDgyBN92/6+6/m5Pis0LJylO7f6ACB48m1djjZIHKe34W5dzCqqj7+K7+j2yfpopjNNpnA4genMVEMdJVcTgAsC6fMVCeBAx7RFAftW9hpyNTB6WI02zJDNEK05BGOX9OS2ZgYKJGIEoc+17g8odSnvCUIoIO/QbTLNqIHVjpqZq0cBKv4qZO85oOU/iQ4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by SJ2PR11MB7618.namprd11.prod.outlook.com (2603:10b6:a03:4cc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Thu, 17 Apr
 2025 18:27:05 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 18:27:05 +0000
Date: Thu, 17 Apr 2025 11:27:02 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Naveen N Rao <naveen@kernel.org>, Dan Williams <dan.j.williams@intel.com>
CC: <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] x86/devmem: Remove duplicate range_is_allowed()
 definition
Message-ID: <680147f6b6411_130fd294c2@dwillia2-mobl3.amr.corp.intel.com.notmuch>
References: <174433453526.924142.15494575917593543330.stgit@dwillia2-xfh.jf.intel.com>
 <174433454327.924142.13014632539194148381.stgit@dwillia2-xfh.jf.intel.com>
 <s6fek3k3zsgf74yuppzckhcnud67pgfitz66n6uwkky7gvjcpc@rp4pxvie2dpb>
 <6800205d86e73_71fe294e4@dwillia2-xfh.jf.intel.com.notmuch>
 <ucdjz2mytjsndtkoroadd7r7grsi4hwpqd47v752zwo6rn5bg7@a7pq6ah4tdai>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ucdjz2mytjsndtkoroadd7r7grsi4hwpqd47v752zwo6rn5bg7@a7pq6ah4tdai>
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|SJ2PR11MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7cec7a-f247-4268-baac-08dd7ddd745d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wLzgHnJu2dXtXerMN80+QOjUzJGUilAAKCUEuIivzcGCRoBoD6c8x1OfYhTs?=
 =?us-ascii?Q?HPqZqcr2IyvI0NYX44DxGQEAUu7GqFOQ7ji1SYiplEZZKazneO+7HaJkqAqG?=
 =?us-ascii?Q?6+lJ3YJk5HcFRinwXsxS86KDWnC7Dc07p1u6pJe8yNFKRREYk/PrKMtmSNoZ?=
 =?us-ascii?Q?UfnzbKxemmJATxU/iPZ0nxcSY5iTuvc/OC2+puROKNReR/702ZfFBCf8FGu5?=
 =?us-ascii?Q?padJoii6bKXLWDUuXq5/BA0yMu0FiDxABiVWeMYC6lS/eZX3TO1z+woFMxAJ?=
 =?us-ascii?Q?kED2Urn1DxWqbO+MdAg7iMpZAhll01ePss9ZO+E4ghh3h6J5VfeGc1bIxBFx?=
 =?us-ascii?Q?kIyJdqupo5iv4b3vvkWXh/zSAAOMdHVDkHQFP0YTUGVyN9E1wQHhYg2YtVDc?=
 =?us-ascii?Q?Q6kWZVbI775Q3VB3E0OIXk34iLOxPX75Xx4FGUoQl3mSKhXjOIpUm1SCH/33?=
 =?us-ascii?Q?In/qz54Vc1nlbaJiTQT16sjo5HoTRbcpD4+SRZT8PtGwUIxPo77/Th83JAxo?=
 =?us-ascii?Q?2ia646cVHD8PYAJM+BuekTP3xvyVEFsYmrN63JD4SRwxWPoay3ypEsyhVg86?=
 =?us-ascii?Q?jbDiT9mkAqyM1xO2+friduVtaRgjYB2eayv9kRXnvxS5FICKPEM+asqrZhP4?=
 =?us-ascii?Q?yPqaOz+kLi9va453ysBzfDo/MwV42UN1+gUfsHM6zRnr1RqkC0ELT0Hfbae0?=
 =?us-ascii?Q?06ROgA53V7WdYRjfYtMp6N/7fzxcYF9WkxnQhMG+jN47Z0swp05cSaSqabA/?=
 =?us-ascii?Q?QqEL+FcXRnTF/ueFHR7aRDhDgLVEJ3INNkXgSnkvrOfVw+Z1CV4hXjStQcB9?=
 =?us-ascii?Q?LAtzZIrD1tb4aZSU+XxsSjMD5CtJpGRVP+2UfTFMY0nmuuCfDn+GWWytLLa/?=
 =?us-ascii?Q?jJTkwnpRZO0R1ku6pjjeoUtuFfQSqdid1XvXiNNFaqXGeYt7Z0Z45yDGJugY?=
 =?us-ascii?Q?VObP7G5ejQ8SPeFljUu0OSbPOKlIz1HJMGz1ck9B8laqWz7LHImwbih4c1xP?=
 =?us-ascii?Q?kvKwjB2px8nyJB1SEFUizS0gZ5rFFZ9E9oRt9UQP7CKQINHTrPLaLD8193bI?=
 =?us-ascii?Q?HfrOdj9Fi+ueyt6eEqqj7wvy3URlhx/2qCtnlq/o8oWpo5H9sxw85fHBgQHn?=
 =?us-ascii?Q?jn5nMd5MpwK/2Y2IyAmZ7CVRzt9egvD/+b1eFKgkK+ZwDbRkBiqGHTuZfgaT?=
 =?us-ascii?Q?QS58lNFKVTRkkCNS8qplTUmXo3mgyGyoNV5juwgI+2UuFeIvVU85yIWME+0c?=
 =?us-ascii?Q?d4h513ZPbT1bmsPzHZRGc09zub8f2DkOp0FZfdpn/U6cfplVd7yl6WCYIfrb?=
 =?us-ascii?Q?IoKN1+Jmwb/IiYBAUZZn86WrwOrtwgjK2jT2DFYy+88I1ZeUJ70bzTKzqH1j?=
 =?us-ascii?Q?wT6PdQiljm3M/JCdMrmKKOdboNUEMF9WqrFqc+wj+i7vsR61/osSEVv5PYnH?=
 =?us-ascii?Q?aWb2+hxjoQQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LlE3USfWbclrpsVYSRm/vwHM6i6vG9V6E0XedGEEdeiwfNMJ5NXoJ8InDwwc?=
 =?us-ascii?Q?eoSqsWlUpU9W4LAOCRIBsyT5BaYwld5UBNSerz0TycoKo9hcFKfiM80siwR0?=
 =?us-ascii?Q?sKr8slbwaohHHjyjsS913wu0A+GOeIv3tLotAQzCKvjmeiGPkfKYiNUJU9v0?=
 =?us-ascii?Q?AkYDFpsF5F9Pkx0tqXXnxRIJcybx5UVlkaRFTIuU+sVdL1atAYqdmrQbMsm3?=
 =?us-ascii?Q?3R9Y/h0QwYnnFXoVhOlOXT8suCdEdLZaItXRC4KvNPwTim8yV7cKbJT2aCCK?=
 =?us-ascii?Q?Jp/Hminl8Hd/qG0/ezQqMhe/fj3HUd8XZ5BFIpeAGJ6Jl1sWUFnPOFZaDND5?=
 =?us-ascii?Q?dI5cOdtpcnz/58rtrpsKbvWuqi1TW0FE+FCHDu45Mq58JvyZVi44h7OuMhEV?=
 =?us-ascii?Q?v4IkCJlhgYE7C4pP9FCMHlB3j5GSjU3xBeMnawRdVe7DvHHcd2D00P0yKnW3?=
 =?us-ascii?Q?Cw/ubbPUWasNcSvrmkC95oCUfbf3vKcni3wKACJIxkqy5AyNY6HdOlv8k7GF?=
 =?us-ascii?Q?F0ES/namg/5m1hPNT1RZIaBPeRAZzX1Pq7Fqp14c+vqM/8nIDAxsJ2xt0aMm?=
 =?us-ascii?Q?Wh9TrKnHAVNio4OAcGi41BpOCKhjH3bs0DF9N9TAJkf0LRcedJJodBZaQdzL?=
 =?us-ascii?Q?ZrWOayH6RI7SeGBGngZS5GMLLw1EPc1Ph6IgWbkX/QQfS3lVnR2Bee8QTTO3?=
 =?us-ascii?Q?qWmuePwDMO7LOQQ0JsH+mGRLdGZF+6F8QHmKWdcE5LzW7dCnDsL5CQZ/vvMm?=
 =?us-ascii?Q?Dk3fYoFzhWp7WoesLDuWkUzzAUdDGKBoXAgulWMXllgWBwffYwclKwRHUNyN?=
 =?us-ascii?Q?AasZS+AiEJYw/G4IUsNsx0oJ/X8X9UB3upi4XttKUAaYrDWByFg0+LSOY2KI?=
 =?us-ascii?Q?9bYDwGJiAEaXZr2yBzRu3Jqh6cglQ5ASXiq3OvWuppzxYPU4EEuwS1gttLPr?=
 =?us-ascii?Q?nJuvZg70FTKmrhEAEzlRrkHOEiVK6GT7Gn7jSmoOXij8+us3+WEonFO4g7fn?=
 =?us-ascii?Q?8S9N5pHOH+uixjZaieexjCs+kNfLVW3R6GNOoZTh58uh7BpAWtxmEKzbmK7+?=
 =?us-ascii?Q?w7JET42xVpD4CUDvBNNl7rSzBsZSeCw3yfoxS6KwzBKyChYg8uxjPoe4rshC?=
 =?us-ascii?Q?5SYflG+Zh/CktqAeUhWMma+uBoN5xafELymvrCG0WkCt+zGXdM5zZyGW87HN?=
 =?us-ascii?Q?My2ndERwdwjJA7/sF+1B2uMtJT/qdef/Fj6TgLCw0T86DKgGpkxvsIhDoLoe?=
 =?us-ascii?Q?Ti6/eo1XRN7JQVciwSSryPZSu8fLChdX7Bv7uGkztfRAUdwAIUrpIbtJ//CO?=
 =?us-ascii?Q?QHN4fDb3+NtZWQudjp+g1TXMXsbM7hS2tEv6Mvb0WSVmAuxRXhg2uHrMuUGp?=
 =?us-ascii?Q?tKNRQH2aKlRXl2a1fUJJu1j5PnmX3M/6WDNHulbfdX89Ek6UKU4t15C2J3tl?=
 =?us-ascii?Q?efNEJ/UNGWvM0YQdSEFz8p6zSZlLw2GmAOX1NNoZ/lLNcMsWN7sRlH2TJdMp?=
 =?us-ascii?Q?TLFhIw5DWy3ycHD5CdoQb7GtG1/jTkMUnPxXDKo08nCrpFxVvUSnsoLtd2Zs?=
 =?us-ascii?Q?ZnLJ7HMw67Rz82/eAs2fxKPmk3QxJYC+v+0Lgmmjtz683DjGcn6FfT9QvKkg?=
 =?us-ascii?Q?2A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7cec7a-f247-4268-baac-08dd7ddd745d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 18:27:05.2073
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0I/3/Iyn82mj+wSQIswTeCHqXpQT5CQXQ4/n21JHnM9c6pfsLsaWVKZIPT5asfdl2L9gCFvGQY5S5G2G2qBb3Kh9SnFBt98NT1Ex1K7oTak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7618
X-OriginatorOrg: intel.com

Naveen N Rao wrote:
[..]
> > The pat_enabled check was originally added as a *bypass* of additional
> > logic in phys_mem_access_prot_allowed() [1] to validate that /dev/mem was
> > establishing compatible mappings of "System-RAM" via /dev/mem. This
> > patch maintains that expectation that phys_mem_access_prot_allowed()
> > returns immediately when there is no potential cache conflict.
> 
> Thanks for the background, that makes sense.
> 
> Do we also no longer need the devmem_is_allowed() checks in pat.c if PAT 
> is enabled and !CONFIG_STRICT_DEVMEM?

The only one that is left is the one in phys_mem_access_prot_allowed()
and that one properly compiles away to nothing in the
!CONFIG_STRICT_DEVMEM case.
