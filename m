Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E891F874F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743427685; cv=fail; b=J6uUAuPJGpInKVH7K8w2LEIzIvB2y4rG0M1+1rXrpD8UywI5ulKgzNHIuuVU9KpZR72+w3BGCLJ75r3bl67eM0A6DaWC1clDwH8PIdEGmXSxulrTPvhUIdoTC5gAqy1QPVFQkWHtwKgaV3kit/aNzlvSQe5El+KEG+FV87lxTJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743427685; c=relaxed/simple;
	bh=xFwWDY63D4oW3+FNHUpMMyvLcCSSHus5dXmqLi3pC5s=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qOH//suN4bhWGe9Q0MAcJNcC81MWi5CttVnn5TpzLyOLvFvvhzKvceE5l6lEECh7gOY0toRxwqxaZBNcaCpRNFxGGbX+JKpL/SGgIJuMhfc3wQ62xD99b28VmAeO4wZNaJSrfdNFP1Ewg/PyhyhzXcU+ZQXgFNz1qZuCxZGM6Nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mRyJNeIp; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mRyJNeIp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743427684; x=1774963684;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xFwWDY63D4oW3+FNHUpMMyvLcCSSHus5dXmqLi3pC5s=;
  b=mRyJNeIprvtZ+lXU18URFCoYdDE7LnNFjaTiqZWJVFa1RvWnZy+NGVAE
   azLHN2FUYKSwa1uieJpY/3B1G0Du3KRZijJkEY+No9gDQig3xZzBQWWO0
   +W42P3WFqqrbiN9i9sveYI6mZI2NME0Y1h943RmgFTOXN8SAIh9MWBx36
   a+u3idvtjkzlHgS9scYnOcSIMAf2sJokjVfxRva4DIYrbO1w8+9IfhEbL
   cgsPasUU3t71S0kgkidV5uTNVtHLbudYjQpu6RVCVXXnZ2xy2Il8aLWGL
   1BuPdxK9+q5YyvM+fst9wG68XRy9LkAUqISSVbrO2kK8iLaBQcn9zaVEy
   A==;
X-CSE-ConnectionGUID: NLoJlQsBToCXwpYrZ5HTsg==
X-CSE-MsgGUID: +e/SYIJhQxmxCLaFg4JLxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="56090381"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="56090381"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 06:28:03 -0700
X-CSE-ConnectionGUID: gHRqd5mkRXys+cMsi0e0eA==
X-CSE-MsgGUID: VQIIVoaMTb+HlbkYvb/y1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; 
   d="scan'208";a="125840928"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 06:28:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 31 Mar 2025 06:28:02 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 31 Mar 2025 06:28:02 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 06:28:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EoPSwF/3UC1IbbW1ukEHiffzLaE628bGz6sS0Rr/W153Xu1hEOTf5VtHXQkmDvYpfThmrNKHfyIXUlyfRf4v11zVzVc/pf8un1NGFfZtUwiX4ula2PXdjSXLT4XPjpvJuVgtZxWF1/F4GMMyWJj2s71jHfH2n+DJiKg6Fglvh8wtqpZHFUEyj0LOG0yourl69kOMOMIpUNax1EzFBbMFMqTs4zM456GpO6t19oYA+Xn3iRuhd71s8KsZKFrbC7UqGqVkpsemjlgciiTP5HvT4t9bmX5MiALXaXzik5VkIWUak0TwVkgcJLLd9KRUR+Hoa9nkk6IBUpu4ta6TFINA3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5w2zacyUCRi5UO+YKejvZ2jurmmLZxZGFXRwK6ixTy8=;
 b=ZaS0rIb5JNmoasVhAyzuVUdqRhYrsg1T6xH7hHVBIHGBsbzQJ3ZC0qf8h+vLqmHQP5v6N+Eu+87Oa/kuxArYxWhXkQqw8L4m8GYld9aJmOJWDPKE/8wxggpefhsfP3CGPalE7z8j4Dkz6ukaBGcn5DlFq97QxhMLgek7nsZ8brlQ6dWxru+yhb2tKZCGtcibUbJNROdora0vGY35nRXzo1u4qm/i1V4Mz+Eol393sr3JMeLSa9wNetsXWkcC8x1FeKnJSTOkdYD0UGCz2K0wgp/oQ88gCWbZEdWOdSx5HriKvWL6t+ptg66EVfNcMcDMeY0zEfNDq5AgQtws8cN3Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY5PR11MB6282.namprd11.prod.outlook.com (2603:10b6:930:22::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 13:27:55 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 13:27:55 +0000
Date: Mon, 31 Mar 2025 21:27:45 +0800
From: Philip Li <philip.li@intel.com>
To: Borislav Petkov <bp@alien8.de>
CC: Ingo Molnar <mingo@kernel.org>, <lkp@intel.com>, Linus Torvalds
	<torvalds@linux-foundation.org>, <linux-kernel@vger.kernel.org>, "Peter
 Zijlstra" <a.p.zijlstra@chello.nl>, Josh Poimboeuf <jpoimboe@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [GIT PULL] objtool fixes and updates
Message-ID: <Z+qYUfWxlvnYoGMG@rli9-mobl>
References: <Z-cSQXJKMyBSfAAc@gmail.com>
 <20250329153242.GAZ-gSmu8qiXufR04k@fat_crate.local>
 <Z-qCrbNvP2cil6jJ@gmail.com>
 <Z+qLDGvkY+TXdCjK@rli9-mobl>
 <20250331123649.GCZ-qMYfyI9gZWwFRm@fat_crate.local>
 <Z+qOKZ2xNK+hUP6x@rli9-mobl>
 <20250331124917.GGZ-qPTTDyO7hsZkAT@fat_crate.local>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250331124917.GGZ-qPTTDyO7hsZkAT@fat_crate.local>
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY5PR11MB6282:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b18435d-9f21-4188-f424-08dd7057d820
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OB6AOw1aRAjNkxZhDQpjwUjoEKiCgmZHy6BOYAhuiPDrHE2jahUK3TT3s+Yg?=
 =?us-ascii?Q?wvFCyE/iV+UZMbWBzsu7RzQZcdk/rw5O4T1Xi0iU0jcyRXtFXra3y3emk+Og?=
 =?us-ascii?Q?OXMabxaBHrb5NPFn3l20zqdthOeTS2Y7JZqfuJH+ba0W9aSy5RaielA9w8rj?=
 =?us-ascii?Q?xN7MWFFDUoY7ZXwqRPX28HVmS9UP1OhOqMJd3ISQp3jB2hrnGPQdPHUUDQi7?=
 =?us-ascii?Q?zI3m0p3rHpIxIGdsbpC/iOFHv+ygLJlGBAAd/ICF5MBFfjG8S7N1T3tXJoUX?=
 =?us-ascii?Q?oQD/2nJxICfQLbzPE0/rvK0lJFyMkV2F2HSyI3+M2BY3qi4t/7AvJabgX5M9?=
 =?us-ascii?Q?Xlh6QNpedJLQvwNc6T7Cd8MWyD9JnPauXdW9RkHWHpALmKGcDgV0bhLf9TgQ?=
 =?us-ascii?Q?Jd6ZyZD9FhDKqUtFJShkRIVHk9bOsyRmtOJIO/j/2P3x0J5NJFhItlW3nJEU?=
 =?us-ascii?Q?ug9CoD56tggxnPx++inSYVgvqI6pd0QgoSM0WF12YtmuxAcnDfq8K17fh826?=
 =?us-ascii?Q?WfyL8bHB/Rr7ftmIr0IFtcDVpIsUUsjOXioq3oPBei3Blr+ov8CuyNI10WGr?=
 =?us-ascii?Q?W8GKdvJup/TfyJIqUTs2vaznDHBxvMuLs9HC4ONffoyeVgluzKnEnUMhrgCD?=
 =?us-ascii?Q?7jZD6jx7wbQ9pePl0Kfgrun9aOiNBVeUdVeYoTnFlwQckbwryV8G06excIMo?=
 =?us-ascii?Q?UbxgvtQ+6sjPiYlQ7RiyRfcf3AV9Ub26LMtv5MZBVYIpeeJspuoZ+Bw3pbPR?=
 =?us-ascii?Q?hCD4n6pCUl3wx8PM5N2+4YI6qFH40BuEX7pl96ihP348z9SVJAxnvLZEgn6z?=
 =?us-ascii?Q?WO75ia15wC/p3Uw2PmNQokUJLgHEhdVAnIBoc5DklNAuLuG1/BVpBD6UcaLl?=
 =?us-ascii?Q?+hTjrcbG5ktHeByYCsfZuT0QH+Yl14nBP4it4rVIptTNRbLFqsHJshK7bSGx?=
 =?us-ascii?Q?+QC74sHtxMmYjqT2Fvsb8IrdRbHxmYYB3nvWeYHDd0fyjdMo+kfVv7YNsWWr?=
 =?us-ascii?Q?/mCg3lanv+BmqKXhRZMLGVUOh3iCwAPLwbxIIOU0z6lU9Da0HmL5WH5FqWsg?=
 =?us-ascii?Q?5FjjfpxyP9aIcjBQOhke/6yehXJrVuhzuPhegu7Nmf6jZw1J74fAAKWDGd41?=
 =?us-ascii?Q?UdQGs6eERjw2WtQy6f4VmsItPk3YzQI5dMfL+pknYrcm+nUVlW/TliyhVTKs?=
 =?us-ascii?Q?79lIMcZ+vSpCg4mOWXxZSzlfwkSm/VD0OcsrJUjcWxSu1DkTnh4NO4RqX6hw?=
 =?us-ascii?Q?ZgzN1bRiavbkB5eVn1DxfZ1hSa7/u8HUWqLnGbIKXWECOZOdzKgjkP36Z4Tc?=
 =?us-ascii?Q?hPK+tBRMwaQBxXMlI4kGhaPQ2nkoY/EDH7yJtr8VmSX3LydBE3DrWzoyrjtH?=
 =?us-ascii?Q?qBKBApTcvWuUJxpjazPrZ4jYeMpN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5YVXIobn4BHNlcl2rZQ5MdpLTmPRldFG9mqU4IgFZfWEXuXtzqB6PB6zehnk?=
 =?us-ascii?Q?0RzdJrC1pPZdqaK5vPXT+Xl/NvoGtnoi6s8K9CPcmFeRMJ2Z6UOG4EUGp77z?=
 =?us-ascii?Q?5d41l0G8dYaa4vY3QEo//Ac4KYfKJln+lyOxqjXtjtSOYmodKJ/f89X06EwI?=
 =?us-ascii?Q?rNt3ig9DXRDpsdzk9GBtYk8S4/ga2vGKOojBsZtnNHLD6rZblntbELOrpTJs?=
 =?us-ascii?Q?qVcMhIujJ5M5FEfr9mkl39FcwylHkkxvQJMJuDYxCMOJj7LkcnveA/WPY5aq?=
 =?us-ascii?Q?MIvRXB4T3zb7G91u9VIsUXGnUqvR3U2RwibyQ02eopxecYmvtdoSudLk2q7E?=
 =?us-ascii?Q?Rt5lez5LJ6cKkCMGeYYTuFX9gbkPOWMgdAB8coTQeYTjmBdhsupXaG6FfSZ6?=
 =?us-ascii?Q?4GvmpgqsIPIPuQZoCS/45XXBAMt1XtAGQpNbGlDulQCVfJm9QeJbi1lJZ0a9?=
 =?us-ascii?Q?jOnJmjkaXn8YKfSaydX0OW1UbGH03xFO5WUrTHrDbwFpz5LWIRB5gf2a0WcY?=
 =?us-ascii?Q?OGY8plo20GCOVnF/eRnHKEzSgera32lfRw+vsKye94nuJW9qsnaIP+Jb3hCZ?=
 =?us-ascii?Q?unlxBbnBlP7rbx0qdM8WZxJ6rOjrzvTbn0gh8URIqCwtGKAoDLBi4MzOTW0b?=
 =?us-ascii?Q?4GoT0ZYK/uiVYBFTdTP922qyKBB6VrZfzU05a/YgfjwqV8GB65oere1dd2Ru?=
 =?us-ascii?Q?X5TAhUWK+RFd8jcLmxSQRJu0f0SphDjDnlpsQJz8QqbBugUPPOJhlo91sogy?=
 =?us-ascii?Q?pLdF+z/PrgXtZ1HPkmNV33UaLd4nGz5rVmH9gVZd8q//M77N28Mi/WyQrfak?=
 =?us-ascii?Q?78tvJXWdT/rgDlR4OKytxmUXu03USl8VzIohDzadQPyFpu/LWnMiR9kef0TB?=
 =?us-ascii?Q?sdJVtskPkT1/ijrMiIjbaTNu0WcXltg3XXdWuoxK/qZ9+r6N/sb0cZ8mLeLq?=
 =?us-ascii?Q?e2gBIEFsWCTc/ZD7pWH0vIolDuc/AiIkZMZiy4+Ohi23Lqh/dKyd1TZYNm2Y?=
 =?us-ascii?Q?6teyTaG1pm+GQipwOQOZPLuaOx89/3s01WAMkFOfTAY5M9DWG+lpCDjTAjbK?=
 =?us-ascii?Q?wQ7UENgFqM/ZwDm2hntE8+26qgHM+NPixTlwzZnSvlZw7NMbYkut4WwfXWq6?=
 =?us-ascii?Q?nHtHUEUMhc+wKV24D3muErzZ5E1x75qoRmz/3AffZ2TaQYYhZ83JNwaNEiSr?=
 =?us-ascii?Q?FjQs4Z76yOrE2NqJjeM0Jp9RQybL5gTVsgClQiSCOzxwFpV5iVEH7LQaTkPY?=
 =?us-ascii?Q?V/IvARTVRfh5NAPazZp0hLh2F2MmUXKx8gn0aNVSUGpj7+eJA/attYH/7xi4?=
 =?us-ascii?Q?eS5n+X4FW0X5ubffXidoKJGR5XKwtNme396JM5aBx3QQ7C5kPrySKpW1ccTR?=
 =?us-ascii?Q?logJ8v8oxeWWHco/R6NpqOMlzarCkVk04TNERCDrKjU8ysrb2MgJGKdw7aG7?=
 =?us-ascii?Q?7j4OF6BUN3378Fr3JCXntljWoy8S7BUDQOi42vNqI7EgQ0yGBu7y9S3QEzdL?=
 =?us-ascii?Q?w8iHQkH5yKIwl82efiRfKb+OpPJwg3ELIvamqv+yExQLoHgFWRHVgQyDDF9x?=
 =?us-ascii?Q?TbdP+P6zy7bX4l3brDJb8IWIm7i5R54UBJSLhVZT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b18435d-9f21-4188-f424-08dd7057d820
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 13:27:55.0587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psYJnrIkcQUoX9cMBaYo0PsVufenvSXYOrLo0RqGzTJGKUVXrp/ghktrsYhTBO8Aqx/AjT9lmW5uHKnymai0UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6282
X-OriginatorOrg: intel.com

On Mon, Mar 31, 2025 at 02:49:17PM +0200, Borislav Petkov wrote:
> On Mon, Mar 31, 2025 at 08:44:25PM +0800, Philip Li wrote:
> > I will also check this as it is designed to have link together with reported
> > error in the summary. It is another bug that the bot should be fixed.
> 
> Please.
> 
> > Apologize again, we will continue improving the bot to make it really useful.
> 
> Thanks, I appreciate the effort.
> 
> If you need guinea pigs to look at reports and give you feedback, holler!

Got it, thanks a lot!

> 
> :-)
> 
> Thx.
> 
> -- 
> Regards/Gruss,
>     Boris.
> 
> https://people.kernel.org/tglx/notes-about-netiquette
