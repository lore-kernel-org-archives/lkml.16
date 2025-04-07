Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6275225A630
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 19:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744052404; cv=fail; b=mGiqAI2plUH2wqdgzWG3Yd5mlX0AUQkQVfxF9I2SBN8gYFD7bTiKjknmMK/iR5C0h724I1L7MZSB5GH+He5Z5YZVvKLLZt5WQknsn42pdQX1/rAOdo7Y7p54tmEUGaNBEJcMMXrrrvdoRV6vot86T6Du6aTSITWlfEzE8jmFaMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744052404; c=relaxed/simple;
	bh=pRnQb3yY4bzjvzOv0z8NnCpl37ICtYVWtqxN0sArugw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=lX6OwKBxSmRL58jX1uCBZPD+UYOPNPs42rJKbqBpOWv14CA2mmsYSInFqD0xu/bHA6bPgvJQjCEvqBD9xQ16n2wl1lAfe5u6O3cpqGtMw+2dh0rh9IQYiF870sFK/4RW1fnEtI9Dg64+LCwZPaodYGedTjF0lbHyZRJWnmxiNQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BueGpltK; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BueGpltK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744052402; x=1775588402;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=pRnQb3yY4bzjvzOv0z8NnCpl37ICtYVWtqxN0sArugw=;
  b=BueGpltK+bM8eO3hKliSynQOX8o6qiIXTNfK7If/smAT+Agtt0r96IS8
   0vNpFiqnMpX2Ny3bvzqJmvYXlFzk/af15loW1SGM39bUCHMXDtC86mWAT
   eMkk9LNOi1pa0UyVWdFLr9FvXzmF9t5a468NmISMOSwPbx5MSUXQz8cuK
   UOo66UPxWjI2hc/PxT9tbxdsRXn9CX0eEW/YZRXSmH81wLEaVTry8AZuT
   IP0wQF1UlGxt4KS1iZeevoiUfD6Tpwqb7P5BnLc4zHcIt1RHpUikHRdiy
   SBIfpC6r1mKFdC/VN1/l0jVlRoNQLc3HQmAXiV0ZM0VLaciyqP3rb9j0s
   w==;
X-CSE-ConnectionGUID: ZQ67njpGRGiRciWDNDsbSQ==
X-CSE-MsgGUID: 4AvTwKCHSWyADFxP8eJ2fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45591371"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45591371"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 12:00:02 -0700
X-CSE-ConnectionGUID: wvdSLTeTRWGWmlvpRoyZJw==
X-CSE-MsgGUID: gOB0f5pESV6M2lybRjENOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="159033927"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 12:00:02 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 7 Apr 2025 12:00:01 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 7 Apr 2025 12:00:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 7 Apr 2025 12:00:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s7Y1VBYLoCgGlElc6gdNaUlDF6PCiH/MgmMfAKnM4oMoBlvNUbc1etF1nuzMSfWJBY2l61TN6WsrosUz3b5II8W5NF6GVUj6bB87uURiskm7PwCaq/cYQEXy9P/5SlScteEm97HCyBEe7qaZnS3qTXrhJgRrp6SMNOYWspkmkzrsbwuWybZKqpFXZVnz2JcY00/tOs85vCwfLbpFyF4JIKPpsh7TtlAsAyJKbH9ZFBIVGhry3QmxcAxr3U3r07p4AjCyTLxbgznvSHvcl1t6hZZjLNE/jZzouirgOJ4X6fuhJUhC4jBsYSnnXNthsKwLqrCR1Aqy/uFDV2X2fmjUSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKKIqoVHolOPuAn4PVk0np992jm78mtssT7rg7VnQ2Q=;
 b=O/dCPYtoapnknqePTjQ0AmcOZyH1Tuwg3TsXHtpn64E0e55AycFY6jy3s7xPZgBr43iR6/9HycF5MPPh26M+Y7xRa3LjDNlgW7K1WRip6PelRZQjVSRSGcV+9Dp1hTEmrCzgwhdxRLT6Wq7rdFEDSVVo2GTpEwHA+9K9FjmPymg6oF33jQCMdzyRn6uXT2SYr0J81YDLT2pUh2A/UvTYB31GvQdeOv2S+UCdjp9JqT8I8nIftOFGkwWMMA98L2/mH8Y/3398fuIh+hAfoRsgQteDDIGJ1mXrLWABqnHyVYqfyVGxqhl/nImWhjtP/E0xkHEBDPtFjUW2WgaOv7XtVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Mon, 7 Apr
 2025 18:59:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.8606.029; Mon, 7 Apr 2025
 18:59:18 +0000
Date: Mon, 7 Apr 2025 12:00:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Guenter Roeck <linux@roeck-us.net>, Miri Korenblit
	<miriam.rachel.korenblit@intel.com>, Johannes Berg <johannes.berg@intel.com>,
	Oak Zeng <oak.zeng@intel.com>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, the arch/x86 maintainers <x86@kernel.org>
Subject: Re: Linux 6.15-rc1
Message-ID: <Z/Qg0jQ/xCn67jOL@lstrano-desk.jf.intel.com>
References: <CAHk-=wgv_rS5dT8QY7Yh3V5UGup4BLHYToXNKWoH3C9+3YhY9w@mail.gmail.com>
 <75ec6d07-24f3-47b1-9632-ff53ef12c1ab@roeck-us.net>
 <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAHk-=whwuVsXiCV30yU-Jk-PDJBozdKRu=XDuocHtq5rbyaLxQ@mail.gmail.com>
X-ClientProxiedBy: MW4P220CA0029.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cf2c6d9-ee84-4fdb-80b5-08dd76064c91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vjGw84B3H3YRLwPk+3WkLEzND8dxO4WLRN8rIaC47n/Uw4lFuu6Ee8EBP52D?=
 =?us-ascii?Q?Hwpr2P93+5LSBdeoiSCAD4dSjrTrzzSN2NbQsFc2bdSXtldzvrUa9aveDoWE?=
 =?us-ascii?Q?6lDPOVM78/XYfJ5ZMVQojnYPJ5rPLe/tjnj7H+FASWTpchJYLvFuzplQAjb5?=
 =?us-ascii?Q?N1LQzM1BrwZcqXEZoQKzZrSPWIVUg50mGtwPASo7H9Flli+pLzGgda1Ascen?=
 =?us-ascii?Q?YzIuK8zi8q4FR3bsP6tolcjHUnWV+95LYFaT05N8H5s7HcLUJhg77ch2zPQm?=
 =?us-ascii?Q?qjpa59nXySmgTbb56wadiZpPwTOi1Wb0INsJsgAI6N63bVWbsRRw/+0rlryF?=
 =?us-ascii?Q?0E1yKv5TOwsVPzpkUahnM2dZlqcJirxusj0J9jBLhHeooV/wLtco5f91W0zG?=
 =?us-ascii?Q?mMrCRvSNNTE21VVsJlLwzQo/tpCkeBbrsRzFq+MMIkRXil4wLSBQsrYWLDSH?=
 =?us-ascii?Q?CvEOoM2+PAtZp8mkYyy8BnqD9bcDQioSVYUTQ3gZv5Gf2wFh3bnmKNuCb9hy?=
 =?us-ascii?Q?HwGX5TYiskNsYPKk2m8GrALgCfD28J5rG1i+0oxaQ/AVDG1C8B/vm9Z8yGkA?=
 =?us-ascii?Q?8lh1+q9oAaZcPxZ4kkxLmsHtkMuxWkG7BWvxACEuOvZ1VyvL34xAsZYShMop?=
 =?us-ascii?Q?GFv+suU7RVlsZrISIxRBYlvpBCIpuf9Ed3CHZxAR23GTgM2xLUwhx312FGNd?=
 =?us-ascii?Q?B1VqFelZyghxzIes6meRW0dzBPicd0gVgwCnwPmkK50lkzZOx687kqyLPtXQ?=
 =?us-ascii?Q?dToOlUoBXPt42BZsJMt8fTTUIajA4nv4ESPYweQvTo2VTkGfcHOGJEWSjg4a?=
 =?us-ascii?Q?P99VLqsUeKWAuvZ+Enj7XRUeXqeT54fIDt7/EeVjhd6Px8INPC+UJTC1H+Wi?=
 =?us-ascii?Q?m4c/Iw/kj/PUIkpBIYN+M7Jj7hn7P2j3l59T0kRx4cvRcWMp366hyai4xIyb?=
 =?us-ascii?Q?Mwd7N9Eo2IJplORTHr/OoL6QFimmFHHaVn974pes9g3W/5RLqBmusnUCMG2O?=
 =?us-ascii?Q?49WBMZFnWsKGeUpL5W75/tn+A5QPHB52EgquEt8Ad6kW36d8rQ47SL9XBJTn?=
 =?us-ascii?Q?Hag0x7+OXYPOBQbx8s9Kgc0GNlJE/e+CeKN47oWvVrQpwXFbT/GAVw03zeKe?=
 =?us-ascii?Q?bQ4yNl4vApNXA+/CAR/5uURbVMJ0SBAhEfWTIvsxCa2IDoUK7HvHLK/a3SQ0?=
 =?us-ascii?Q?gXT78DyU+M/JbcJ6fWgLL/++vFSm7rvUNZAMxi3pQXIKiupgkKq4FTGslKsZ?=
 =?us-ascii?Q?mjZBJQhpT38vFiIHoDcAAprzbz0rm1mQGZ2+lxWW38HH7BgE7WcJLk+CaxtO?=
 =?us-ascii?Q?Nwk8snrhnzwHj4oM48VixNmXV7Tr7vWD8O2g4Ihz+PlA4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB6522.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6F2tk/SnGG0vq7AGEVV/ff5Wes26MvJM/YNecL/LCBWaas7NlppAZNtKX5ST?=
 =?us-ascii?Q?QiDxXpWmvD9Gfrc6HNBqnNTu9baeZEYE0JRGrTCRI013j9av+w+lzvnuqn5i?=
 =?us-ascii?Q?hC6YXbrX7vZfMu0ENgpd3loW05yqFQgTT2GCrToK6webN8aRy9C4nzm7D09/?=
 =?us-ascii?Q?WkMHZ7Ok/0TYu4Q6upOVYVPUk+AXesjI2j6WqQk9h0fjeIUcHmeSaOHIcnbR?=
 =?us-ascii?Q?wg0tedSMUYU0TiTC5eAQ3ydbgkU5CELgneTgPd1yrFPbrRZfmSr95DtKuBzb?=
 =?us-ascii?Q?grfp8rZ8b/c66BUgZ1vED/awXa3UjNAeZYANV8bkFd19nojohhgBkhBFb71B?=
 =?us-ascii?Q?aLFvG25jVCroODXrpmzHmysh4dDvFVVU1s6mAknrp4vJg0qRs7bxeC9moku2?=
 =?us-ascii?Q?BVwSyARDGtytBucq74RLdeeoy8/2JlxJrSEmb2cyOY0W3dSWrEh/QjrpkknF?=
 =?us-ascii?Q?nVtfpbIizIxoNI8pzau89d3ECIqODLn1TdKZTABFK5ytAXhMfiv/oUCyhNWc?=
 =?us-ascii?Q?2Mg+aVx85V4a+XR+GnTEivCH9H/A3gIsSz8Z6KWVnU8Snzuh22L751QYJG5z?=
 =?us-ascii?Q?Qp8KfWzOpGOJMZzJygf/gNozt1QWdseO14q29NxxwfCtZvs+XwylzBHnK7ZW?=
 =?us-ascii?Q?OAzruPNk07kzIOEuVNMazUyQTEGTGre6tXh1lIva0MBbEDTe1N25E32TcuwY?=
 =?us-ascii?Q?7fmiwtoRjYqh8YMEjrcmRKYkUpVOWD+aWNBuH5V/JOziA4PiPCk+GVGyE5hQ?=
 =?us-ascii?Q?yXTzd8NNHeuCxGEp4/acd06wHS3zpFNBWh1lyjjHZgIRKO8XiOAM0646y1La?=
 =?us-ascii?Q?KTSlcxtaxcY4+L7nVEfSMmQC27LyS+1pUVSFtn9M7/2wuMqVGZYwAlUNhXKW?=
 =?us-ascii?Q?dHYb+Pj0vc4KgaYgrq+Iu/yuMC8Ik8RpaUTclq0WpKD2vZopAZ4U5TJD6dGL?=
 =?us-ascii?Q?X4TgLu9x6dkYvBFoWeYYjmUTFovnruE9pA1vb/spXfwpfHYE678RPrt5vRZf?=
 =?us-ascii?Q?KBXS3lSvd2ni3HFIzG+WsuNOdiIUYukwyrJxoDfCnJVfCmM/w921iULhqbsk?=
 =?us-ascii?Q?0x3NKKa47py/vHw25KFGWjCcvXEzBXG0u2v9JYXF+mWCD8lyaXPM/Xp7zE7D?=
 =?us-ascii?Q?NVflJQXWssRBbNKRMZ4+jYtlulhxjyrLtNOlkSpe35OEYNULlsTk9WAEOGNK?=
 =?us-ascii?Q?J3z0DWf9mTRtICObxCpwLVUPip/f6v/bPoQz8/f7Xg85UPIyC/MRMN1sZohy?=
 =?us-ascii?Q?+TMW2MxtzM1wJtM3Z3ZH36FpVXSuR/pmc8dPYFaM9nq/E0lhtGPsRIRKw6Tn?=
 =?us-ascii?Q?eWQWoVqn/LKovgSR2SVs7tBY/DaIVpSY3aOmEAF9jGcU6teo6GBxOqSS9mhd?=
 =?us-ascii?Q?3Q+VLlxY06a1cbAnK6m8Q0f56hBQs0nO0zwVACKKqIZI/Vi+OIl6VPiG9OqP?=
 =?us-ascii?Q?r2zhoTmf/hqAGZZXTpZqltPCkRjysKDOjRlY2UXE6lMmFoFesAbhUSs00qne?=
 =?us-ascii?Q?OTb1sYWHNfj4vp7zyia20n/CM+R8b9ySWR/n+FHPfDZ9D6oCBLWdrqUvkakz?=
 =?us-ascii?Q?sFYhYmtrk6mBngxTSpZCMOy0z1g5nrUke5GKsbgdQKqUvEoM5izhsZA23YYo?=
 =?us-ascii?Q?RA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cf2c6d9-ee84-4fdb-80b5-08dd76064c91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:59:18.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mj4ZIj3FQ61B4MvdCsA3xoEcBUIbw5RhizgAHyAtV668M5pRqQxKWI8559zMhtHdYU0pUvEwB7ARaaTd9R6jkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
X-OriginatorOrg: intel.com

On Mon, Apr 07, 2025 at 08:55:01AM -0700, Linus Torvalds wrote:
> On Mon, 7 Apr 2025 at 08:14, Guenter Roeck <linux@roeck-us.net> wrote:
> >
> > Build failures:
> >
> > In file included from drivers/net/wireless/intel/iwlwifi/mld/tests/utils.c:18:
> > drivers/net/wireless/intel/iwlwifi/mld/tests/../iface.h:169:5: warning: "CONFIG_PM_SLEEP" is not defined, evaluates to 0 [-Wundef]
> >   169 | #if CONFIG_PM_SLEEP
> > [...]
> > Triggered by commit d1e879ec600f9 ("wifi: iwlwifi: add iwlmld sub-driver").
> > The code was not build tested with CONFIG_PM disabled.
> 
> Ok, should be trivial to fix, let's get the guilty parties involved..
> 
> > Building x86_64:allyesconfig ... failed
> > --------------
> > Error log:
> > x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE
> >
> > No idea what to do here. Increase KERNEL_IMAGE_SIZE ? Disable some options ?
> 
> Hmm. It's a fairly random #define, and I suspect we could just
> increase it for COMPILE_TEST.
> 
> allyesconfig is kind of useless, but it does occasionally find the
> "same name used in different modules" case and other random things,
> and disabling options seems overly complicated for this odd case.
> 
> Adding x86 people to see if there are preferences.
> 
> > Building xtensa:allmodconfig ... failed
> >
> > ERROR: modpost: "__divdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> > ERROR: modpost: "__udivdi3" [drivers/gpu/drm/xe/xe.ko] undefined!
> >
> > Commit 9c44fd5f6e8a ("drm/xe: Add migrate layer functions for SVM support")
> > didn't watch out for 64-bit divide operations.
> 
> Hmm. Why didn't that show up on x86-32? Or maybe it did and you're
> just quoting the xtensa case.
> 

We have x86-32 in our CI and this was not caught.

> Adding Oak and Matthew.
> 
> I assume it's the DIV_ROUND_UP(entries, 0x1ff) thing.
> 

This is the problem. It was fixed here [1].

[1] https://patchwork.freedesktop.org/series/146689/

The patch is showing up in drm-tip too but must have not been included
in the 6.15 PR:

c9092257506a drm/xe: avoid plain 64-bit division

> Considering that that pte_update_cmd_size() returns an explicitly
> 32-bit number with
> 
>         num_dword += entries * 2;
>         return num_dword;
> 

Yea this a little odd. Can clean up in follow up patch.

Matt

> it's kind of silly for 'entries' to be calculated in 64 bits. It does
> look like it should just use div_u64().
> 
> > Building xtensa:de212:kc705-nommu:nommu_kc705_defconfig ... failed
> > ------------
> > Error log:
> > kernel/trace/trace.o:(.init.literal+0x250): undefined reference to `get_vm_area'
> 
> I see that Steven already saw this one.
> 
>              Linus
