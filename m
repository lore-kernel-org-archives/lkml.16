Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EB91E570D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748974451; cv=fail; b=RaPAdPiVrCJ5bOntSqx88CnOTWrqnC+4MNyD3RRR7GpxvKctTbhiNlDlxXGRa9Lf8ZXQRfvmstdmOTA1w0FIfMsdyRtXfqCg7Y4iGxc05bia9Y7g09iDa99IUnGkBwsMe1ZNmYLOVSNRCLnoR8akjItKKTstk8vjs3li87rHtfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748974451; c=relaxed/simple;
	bh=p3JKl1BuYTiWM+UD6oc4GgxhWDUXcbzyxMFNwGtHHW0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VWttfz5j/8y5OzVcxOd68LmBDl5e/fyfYEfgT/ve9r8mHFPZ3tToPQ9WOtkqYiKdsTyXlG9LjyAR0LjLUB86XOIC8VPRZJTdZe6mhXhkTY7KUS5UzU0/PqFBLCwRE7N+9YX67h+CPNAa5j3qvalqGlhEngZFuduMICETMPTuwAY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DmXP7ngC; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DmXP7ngC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748974450; x=1780510450;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=p3JKl1BuYTiWM+UD6oc4GgxhWDUXcbzyxMFNwGtHHW0=;
  b=DmXP7ngCl+3mX43ZasvB+9n6iS62pxsDcCEF3v0fDBS6AjnL9ruPaJWF
   1nCmFKoa0q+anvU6tm0Ezs0z7HUU6dHs2bngFSPjJfOMNz055H5MlrRTH
   n0JJK8C+WdXSI2wtJPsd5KMy3XZRkdqruBy9BPcS7icNYFEWRtJKFRFtQ
   T003GFW1jzpbno8L16qio4g7vCoefhjIz3kg5lMmjagN6vaHlVpGOiRA9
   bQglx6cQ/u6BBZX71xAJANU4lVUCVH/nabHQfOF3wPkBA9RNZXKjwtziM
   SYNx6niI8MmQZDdvlk+GIiCPwy0sOsOS4SMY5wpqmU7PHe5DpzMStr0Sb
   A==;
X-CSE-ConnectionGUID: y9ljz4oNQHmEfozCGAJvLA==
X-CSE-MsgGUID: hbbgIPH1RRm7Wbskb3awXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="62421484"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="62421484"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 11:14:08 -0700
X-CSE-ConnectionGUID: SsjVB46oQgem/UdccJgR3A==
X-CSE-MsgGUID: WTh7ueDyScGbqtQVOEMQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="144813909"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 11:14:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 11:14:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 11:14:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.78)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 11:14:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOH2QEeOiIFfRSMOFISo9HcVuHLurGee2ai/WBGpTDVKvlU1ySwCK8Dt+2nyNoYkQHTYxBacaX6b0se+nBsYIBXc9cBGS0wLm2kp3l6suanyVLCmo+nJqK5WVDLxt4mX3xUf/JFnthQGLXYU8bHDjX910rMOXFQMZJr+KfepiJv0RWYbbf3lL8CTlRZML8i8f8xycrczl1yvq5gVhaBU28SLCKmpb9nsxlf/2xVN4mtGFBIJG3mjD9OQscpnBD15zSXQu5h3zYe3MhsUVl7Mg+dB9UhkSDx2KI/gPeQOg+wxFkTTR4oSK/AxX+rJOomheHksc3V8IryHsp5a656jqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FjsPODQk4WKAsNGuEXxiEHdnNjaoEzd+jALcCI0xj+o=;
 b=YEEq9Cn4OGsTCDZWvybSdnxXXk0NnFeaUNAJH7cGJgXC76g+FUbsU4enwOTT52m6sEe0CQIgCXfDQDyegeBnpF1FA3PFT9X3HIB5vREZvHGPGusSNc8STb9njCzWlf/Y8qU0QBf9ps7qiOGLEoF2MXVb5jZ35aJV6CibbITHavwY8unsjJ6tfYKu4QQa56PSp2dNCNi0lSp+RNUFeGKRe3NMqfrl2diHi+FVqSPC/ykzPIvS8ecn7xUU1TmAS3pBiApGyoEviDIIliMtducoxvof+oOla+IHlxiJ1UvFT88T7X0sxys+vvwFyompxhNzSF24ooXjAdDgkhamnWTEfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by IA1PR11MB7365.namprd11.prod.outlook.com (2603:10b6:208:423::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Tue, 3 Jun
 2025 18:14:02 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%5]) with mapi id 15.20.8769.031; Tue, 3 Jun 2025
 18:14:02 +0000
Date: Tue, 3 Jun 2025 11:13:58 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, <linux-kernel@vger.kernel.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>, Dan Williams
	<dan.j.williams@intel.com>, Shiyang Ruan <ruansy.fnst@fujitsu.com>, "Darrick
 J. Wong" <djwong@kernel.org>, Ross Zwisler <zwisler@kernel.org>, "Alison
 Schofield" <alison.schofield@intel.com>
Subject: Re: [for-linus][PATCH 5/5] fsdax: Remove unused trace events for dax
 insert mapping
Message-ID: <683f3b668697f_1626e10057@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250603171149.582996770@goodmis.org>
 <20250603171229.109414670@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250603171229.109414670@goodmis.org>
X-ClientProxiedBy: BY3PR04CA0004.namprd04.prod.outlook.com
 (2603:10b6:a03:217::9) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|IA1PR11MB7365:EE_
X-MS-Office365-Filtering-Correlation-Id: baf5d2ff-de81-4670-c645-08dda2ca6b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jo6uMTZaJ4Wgp1PQTzGr5Ss3Xj6G2fnFDRNBDvt4YLEoo1GPaZGif12il5uX?=
 =?us-ascii?Q?TWr9xN5FGpJoz43LhPKHhdt+VjWS6UtP+pNVdYKHngiMO/BfCAEsC047C/Ze?=
 =?us-ascii?Q?d36knKPr3YMCCqFN1cVeXbU1TI8SE0VMAF98iXYMAnM0zYV9yNixPOvmSJba?=
 =?us-ascii?Q?D/umOBAWiczdoOnBmXBu4uWP6kDDFJ5HmNqBi2Y/0kPS+YoW3N0oEz7Jdp8F?=
 =?us-ascii?Q?GR0t5t0E+uc/3P6sf5i9MzYNPOdPHz2GYJq59r/khZRU3tMTk6yVnY2ShU0q?=
 =?us-ascii?Q?W+EHXayRqtVs9UEELnpQZBjekYdzL5fji55vX7hVY+KZ6pxgIRlLiZKs7HzH?=
 =?us-ascii?Q?l6akzv+Glv5Uq+ZBnqSR59AKLlN2EywymEZ8nthZMWNA4bSYN0XoiFKevfEY?=
 =?us-ascii?Q?tHspZ8StZj9snGQoJVDFyFTtb1CKtA7b3IgY/Ipipul/iz4c9XWiDPst5z93?=
 =?us-ascii?Q?bLbDqv/r/M/jVZzyAgbRnL9Fz2LSN2NzBEYNOzvglK2UAkf/QCHQGpPfVTIc?=
 =?us-ascii?Q?8D6rnxV6d8Dzi7dccC/Sb5WVo7WoTJkwQbvM60ChYMJEvDQXhUs57oQFcxCf?=
 =?us-ascii?Q?Gf6xWHYwRHIEgSLAYs8ED54vjVXBzmSeVYtIuHJPwtCj6SGoJm9HWZM30N0y?=
 =?us-ascii?Q?iFURkNxirnaOXQlhXgJduC+PfKfaKUWo6v6ozOXUDbrakZ6cqWWpPtaxuwD/?=
 =?us-ascii?Q?IRwXfDEU9ZBC0Nor7fSHWlOd9WIHytdj58kOp1XiWK+E/CD1Teh9uW0g15Bw?=
 =?us-ascii?Q?XYw4vI8+knp71gNfD1nBuBI6G+Ak8yd8EBVYBnk/f2WJvsMeNq0a+coWQ9j8?=
 =?us-ascii?Q?jMdwHGV3enYUzC5aub3Nk0424X/mDhhVaGLUOp7g/QRQIrEPyTUfzCX0S9p0?=
 =?us-ascii?Q?Fcky/gXrrH8Xh3z72vvcO6R7/2Xji1tUYNkyFZG0Cp15JDMwCHVIwKhE/naz?=
 =?us-ascii?Q?+sHdf1OGR3BO7IJdJ16hWmVDuhn5r0L0+r5RiggS2Ddph6z61Gyjhg+nes2Y?=
 =?us-ascii?Q?KuF1+iyLPq2SRSfcGAMi9OSfFQsInQjntIg5gEhSrIo3zow8XqpCxp7/m2r8?=
 =?us-ascii?Q?hN3IvbaX8lGMP0evvkOXtSudH5H05vC7zzO+Non78QPVHWDIs1hsZiCOPQbu?=
 =?us-ascii?Q?UQjDm6Tdyqh3OJfoQSQGUBMbUn5kENDEUK4XqXJoBrvZRNdgMF3sc5HFZukT?=
 =?us-ascii?Q?zegG8QxNabuOsBV+Jb9edirKbdQuZ748M0b92XFm7YGrutExNWC0Y0+fZMH0?=
 =?us-ascii?Q?e18QTEcGs2SAsZRABBt/cWfMga591vnQClxNPvvH3rYsyqiGoZ9hleAewGOH?=
 =?us-ascii?Q?Y3AAnaF4yAMx/3CaKzPR7wHsa3HsWbRk1wNTMirIF302JlpMb0ZiZpGqM8ga?=
 =?us-ascii?Q?HkeeEHkZ6R36l0KSLAmmia6zogO1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26/xydAv6RaZYZeWAiGhladtKQWE0qjrjtqAnCHzw+8uqXZFsbH9P6/MhW3f?=
 =?us-ascii?Q?AFdSh/s4fKeYe4Hw5n5vC0ERktGgJrmRLQUwx27/Rmc6RmoqFz7NkdbrLfSn?=
 =?us-ascii?Q?fP+o+ippijhHR56dM0iT7eAAwwQW9LeMesu367YGRXUGmdWoqYFLi5R76kzo?=
 =?us-ascii?Q?sKP14y01ObWZIKZ64A5Dm6dpxf5OlGicG9j/VbhX3/e1U5eSCbsTMBsG5ahk?=
 =?us-ascii?Q?0Qi+FHBmQO99vJHXDz+tXkn7100G9enLjAd1cm0F45wvrwJFdogs4MzxbcLp?=
 =?us-ascii?Q?RHEVVpqQiojFXbaKUDCExSGknCpEVJ+i1O2cCnED3lftPt4VlVmwSU9wdwA9?=
 =?us-ascii?Q?mpgutdR+65Tbj4Jv7CuQkf7Ba+5bR2UG+NFub3UajbphqGMs8VHcwNd8Vbj9?=
 =?us-ascii?Q?I+gpVfvO64tf/Yria8VpaQCozWhexHU8Y+fcyunBF3uJGBLLoS64R+eG5csQ?=
 =?us-ascii?Q?LCaDbcLdT3qPJhwndl1GuYWDxW85j0yPGdXifupSnL71D+s6jusdF6ko9Egz?=
 =?us-ascii?Q?MwXR7RxN/BgPxm1ENzIfleyWnGoIP0dVZs+1fX7vv5aOceodml3bKALMMltk?=
 =?us-ascii?Q?Lzum9fE6wFEKeLUr70EGECS59gyAwTyWDcgnf8zjygH44upIGKczYEb16chN?=
 =?us-ascii?Q?ieElIZF7k3t51T1mVVKYvcuDpESk1R+iPXXH3fmW47rdYAFtaFvjTfz9z8ao?=
 =?us-ascii?Q?D2A4F8ERHr6YYRS2JJl/1D5duPiS8pQvcSJZ1zBTZEtDrRMD8pjjPPdknLlo?=
 =?us-ascii?Q?MC0Bf1vfXrKxL3Z72uxXva0S87Wze/EvOSmT/k9S8sPZ7ziviQH6N9BiR1DX?=
 =?us-ascii?Q?QtYH2eTyEX08XEZWuoIrzB0IZgycdMRwv8QWOEx36BoZFU6wJPeVJ+UrUn7i?=
 =?us-ascii?Q?kLtY9m5yTA0tRHi/U9/NLxB9t3ZkuCWRUoqunjdPcJDdbf4I6Qcslu+juRzz?=
 =?us-ascii?Q?i0+K4UvyYKha0//fpSlC9srT0n6ehWHAnafbF9Orb1zQoyMM7fpW9GmIxGpj?=
 =?us-ascii?Q?+zggayNU8SvibpfNgb/WUe2Q3kwgOP4diOykzTw3Fk0G6hy30Rjyd5Bs4jHl?=
 =?us-ascii?Q?JKoki0xh+gc3eTapQTOqabnw6chRloytoZeKTo6vwQ3nhXQ0p7DaiOCPlYL2?=
 =?us-ascii?Q?C2QSdG4kn+C+jra9KZyi6pIrgFQCErgSWl73jowQFDi2ZQu6PE8GQ+FljfPF?=
 =?us-ascii?Q?TcqxcxMxaGckU9CzR9Mo3wa+Zy1EuG88B8xI20qIQocxjxRqHZU6Ui1PtMam?=
 =?us-ascii?Q?7BguoL9RS3fWV0Y5lLx1iylrUyMG4r8JMaBwkjXJjb/kjVQ+ZVahBsOVbatH?=
 =?us-ascii?Q?0yfnItKCXOj/zRh8akgrI2HGF+yVwTCKV1PJN1lXgBSn3v48uBBy5uFfORIz?=
 =?us-ascii?Q?lOjXN9xbSAFkl5CjasSc+LX1tNDfc3iLp8ekoRcWlnMmKGFewrRETa+KyuEM?=
 =?us-ascii?Q?q6GomY8tyBDKi5driuot+4NFmFg5bBiaUf1jarocbH0OZrDUlrqsLmNt8TJ2?=
 =?us-ascii?Q?fM9K1tvIRFNoAifMwP8m09auXWc+Xstz2J8wXF58d7Gek+Q3D4xD8BkdwTB+?=
 =?us-ascii?Q?la+nXY3HasABbClT4H8zKb7F/tO8Hi3hp/hUgyzfrALrNEs/DMPwIdeL6TJT?=
 =?us-ascii?Q?IA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: baf5d2ff-de81-4670-c645-08dda2ca6b22
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 18:14:02.3864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQWPhj9/H39J3qBz+4/K94vNMXy/ZbSDjPtc6qgQ9MWDIIhdiaKVbjqE6R0RuL60fOPHHfc7eojze1N9NkgvHCqHxlbAV+JLfmB3P0rP9zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7365
X-OriginatorOrg: intel.com

Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> When the dax_fault_actor() helper was factored out, it removed the calls
> to the dax_pmd_insert_mapping and dax_insert_mapping events but never
> removed the events themselves. As each event created takes up memory
> (roughly 5K each), this is a waste as it is never used.
> 
> Remove the unused dax_pmd_insert_mapping and dax_insert_mapping trace
> events.
> 
> Link: https://lore.kernel.org/all/20250529130138.544ffec4@gandalf.local.home/
> 
> Cc: Dan Williams <dan.j.williams@intel.com>

Acked-by: Dan Williams <dan.j.williams@intel.com>
