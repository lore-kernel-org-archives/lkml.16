Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911631A5B8C
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751593713; cv=fail; b=Bq7lltVQEINxCI670e2o/rHGvK8M4eHMv9zXux1sXnw0HnV1LK/MUnQAa1mnm2yqgaajTNou73MO29FFhe6zy7JCq4hkfiqSo2aqW+7zyRhRGQmEnNk1k01oEP+HzbUblkZBuOFe3lcVS46XlpIvuEoJwyK5e8vK43KylkUrDgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751593713; c=relaxed/simple;
	bh=14FuZvS8UJ4wf53n5Tb4FMmKKWsGxl/+MM0JlJ+YbWc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EqF1DGJBfjILuB+Oj96aoCyqZU+WIn5XcIdW/1bsqgAkkcRFx/RIoBZ6mkSp5g8R0pEZqSMvyOxA2kCCRyCUgQ9knh8/SrhL3LnxdiwUX4NYT75NXfqAOv28JDUSgDCok+mGrTtwy+cf2xcW/WAw0TU8cXx4xBFKGRtvB6HgMKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKn+beNq; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKn+beNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751593710; x=1783129710;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=14FuZvS8UJ4wf53n5Tb4FMmKKWsGxl/+MM0JlJ+YbWc=;
  b=eKn+beNq4lHGqSneG/52hsf4bbhcm4/29mEj91tZd6UrAd9rjAoceOz6
   yVqoWf9HQlmw0XUbtf7adfwTTO2DLzkseor0r3lqXgUa+tGRJmUw2jZYl
   ZdQc+gjS18TSnXNs28/lxx0TbcPZedtnmwqt69AZS62GPIXgNg+wWhv8n
   9dwlS1vYgQErGBkcAVjWUgh4EyAXg1SlDZZlBhgtsbvTCdlmDR++F7b7V
   LqTDDvzZxkPbQmGo9GraYS7dK1JumjA3NraGiCQiHmARLsmeEJDETrvgy
   P0VLudIWJuRI0F9LE1KG7VwQn7iV6CHmXfQhUAarUt+xX9ROyT7KWk+a/
   w==;
X-CSE-ConnectionGUID: 0reYCBXWRKi9pcG6yimr0g==
X-CSE-MsgGUID: 8l1dHGQ0SX2x4+dL1bduzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="56551824"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="56551824"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 18:48:30 -0700
X-CSE-ConnectionGUID: FsptDL6vQcyDqYCvDvFRuw==
X-CSE-MsgGUID: wS5MzOJ8S9Sx6YT4EJTo3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="160210406"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 18:48:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 18:48:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 18:48:29 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.77)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 18:48:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKWoewonavrOeVN2zaph6DUwG5d8sSNBYM2sX1qxNu9xKKsBVMrIEz2hVehC3WzLFX9cT+uqyDtb2ldB7DlJHkEvgi29EfmIeifJKilsfbwKq4FvUhBq59ilK0aWERZZM2vEzIQ0lovQdDHTga5q0W8kKLqRSCWwxCHwsQWLqcX8N7+ebPwwh3TDbyx8IxlhIR+woFp1XQIzIcAWHrXXDPNao4ytjDaYNbV86vVICT8uM3YW3GYkv/KJzXeTMJ6Hkii+HfJ/njj/wFhdaLgjzP1OBVcshSX5lMuXuk+w9lPuqrp6dhmgbBJKo/sLDJyZ3t77+tjU8fiML/0WbBJgfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dm6nTYiVd4rT5GVspql+TdY/70lQRUF58miRTf2Frvg=;
 b=O0u9oBFxr9ngmxlq6pFPE+ouK5f5kuxekZlcAcUfSPbVWgk0/QiabbcH4DTn6hixoa7bWOxKJJoDInSPN8Am6V8pr88KI2qQoepnYL+Om9Ugfv95KRsECKYxvkyCMqzJt185hQ3GEXULft5GlevzoLL8XWQGQo/k3dzH3JEaRBLNdqb6il29zmBSIs/C0R/jnCj5pKxx0Z4E3ASDMRJDUaPEqaob9RxlbmG1PuePWElHddJlI4rxp8FuIhgQLqCiGJUhvzm1AFPVF/g71XeTq2mhHbhv3BB9AWQaLy3Jtkf1WRuR8hqQW4eFEhCOlPt8LbOGQ+pmI8Z70PZPgH91MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DM4PR11MB7349.namprd11.prod.outlook.com (2603:10b6:8:106::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 01:48:26 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 01:48:26 +0000
Date: Fri, 4 Jul 2025 09:48:17 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Hector Martin <marcan@marcan.st>, <llvm@lists.linux.dev>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: ld.lld: error: Function Import: link error: linking module flags
 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at
 1794328), and 'i32 1' from vmlinux.a(target_core_transport.o at 1969228)
Message-ID: <aGcy4bJzix+kDtx7@rli9-mobl>
References: <202507040514.0TP3wH3T-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202507040514.0TP3wH3T-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DM4PR11MB7349:EE_
X-MS-Office365-Filtering-Correlation-Id: 20a42023-11f2-4cb8-78a2-08ddba9cde5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4mDSfAHw46eEKy4QU32yFfRKB8MmHpJJZjRdpgZH2z6M1HDImQZuTEgwLR9h?=
 =?us-ascii?Q?AOJQsFaERb45mzCIoWFxmMQvAv14TSuaQI5OYQyNWEbRY/CFN8zDAPepBe/2?=
 =?us-ascii?Q?kOlFNUre6E/b0GmsdsMqG4poF/pWJFZfDtEhbQ48V0UaURsCVX/9+0bUWcim?=
 =?us-ascii?Q?sbiVMzVShhYgMDNCfE7kIxEb0o9KIBt0okY+oQr4ZaEStKRgzG6lUHnK9NiK?=
 =?us-ascii?Q?Gq8oBU2+0OBl6o8C37eZ8HMjqCaNZD+zJ7SDsJqQ42sjW9bHGbvQyWl4+FZL?=
 =?us-ascii?Q?melVtn5rlUpaMSkv1/nzgHHWuEDf3VOFFHdMZddWNkzsTQvD9AjTKzveerlC?=
 =?us-ascii?Q?6i5X7B5Xi3+Od8AV/vJEph9D7AvVKvMcfznY9JIszSPukOUqlJAUzslhnWKw?=
 =?us-ascii?Q?S90ak5Hyd/qBOYann/eahG4Y4TcDivV2Yw0/8N4vO1EgLzXmH0rMY3rH1uo2?=
 =?us-ascii?Q?KvH7ys0oqA1hSr/bd4gV4JU+ly2fF0i8Kh2pCl9DqJ/G/rnBEOFjm8921db6?=
 =?us-ascii?Q?T1NTfsziWmGkMP0IbuJXA9fJhwZQmZFmUPQWm5U4iwPmGdtXRCP0v/t6Rtq+?=
 =?us-ascii?Q?pLXU1MVdsgdrX+v201fSgh+UokgnVoKzSgAS7NcsrYxGM1chVfNQvYz9VNf2?=
 =?us-ascii?Q?PGW1s9/i8HoLF+O0r9su7y7UuIhsD6xcjc29yVrmn4AFqdMhMoeLrb82yRCK?=
 =?us-ascii?Q?bLJht6VVCvki8x/gVxCsvTGu+u9bIrn/5LDtYOVNf+IsLe2TrloBg8qotZI3?=
 =?us-ascii?Q?Wl2U9uCn9lNAtbLvukjJXf+uWD/67eBt+mPh9bb5eVam5PGeEE8DoRfFb+d1?=
 =?us-ascii?Q?SyhSwzhR2rwkUPB8N6NNcoldaq9XV327S/BY+w9ZXcd/lNtVMzJtUW6JC005?=
 =?us-ascii?Q?A9j8eFpc9gLyfE90M1J97SsDIUOLOGKL18bx0Ip1bm9FV2L+4zJjTqyaca/D?=
 =?us-ascii?Q?RkMXNSV+y78IDbyLLv9KuwQWnuiGIIJyiNED93Rk0QzxBYdfCqbhu7Nb7Ylb?=
 =?us-ascii?Q?vTlYYS3lWlc5z3+cG3W48Id+zC8mi4JQWjPbM0h5MGwkFGTil9Z1nm6W1FFj?=
 =?us-ascii?Q?Xgin4Ah4eLb7XCaje8L30UA1NI+C+XMee5n1ggzVQgKxkIlbd+scSs9LJ8K7?=
 =?us-ascii?Q?rpufyRDuFtqrO1PL+pKB6k/H1VNUQ+/Yep0D/u4f2Wk5E7O6AnIqqOFTiJm5?=
 =?us-ascii?Q?b1vk09K4qvb2ByAdWtcvgIkyBaav0fmOmENqC6Z0T2hgxQodINSTUZ0Ve0GD?=
 =?us-ascii?Q?ZvJIXzTqegktKDng148oO96IOX/ESIKOkl2kWqOaQBrJvSW8T+s4FCrbsgSo?=
 =?us-ascii?Q?qVp0pX1QAZvahkTxskJoKiypYnhtMl/h2kJmdH7WOW3iTwd33us9Bx3maJ+p?=
 =?us-ascii?Q?ZYZJqCI1cZamyx+cdElxEcV/sxoY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j6F8n397fmHi+KilQG+aYM1nd6gq7jCKeqMybhMAm75ePALEnLgaitBpFygf?=
 =?us-ascii?Q?HnZRJzBO+/QfXpgJMEPtKENA22K1Pj5HBU4wN8dMrOvDCx1ANfFZQ7niyKsI?=
 =?us-ascii?Q?p0+DPUvaafzF3HPcygMd4zH8I9muo2GKvZ6hV6TrH72Zaw58dFJIq93Rxlma?=
 =?us-ascii?Q?qzHMAG8smouPRttDnnDip0BsM2RMRRAHvB8ZR0mheB1y2+jh6+Dw4Llr3MPl?=
 =?us-ascii?Q?97F5zXmcSQcaflr/D4n/NGbzgSdQ+D7zae/Q8WB+myO/o8HuoHmPQyemAd+s?=
 =?us-ascii?Q?bbKAhhYC1OPTVtYP0o0Kh0YhxeJrpmIJotMsPELvZ/mYvQDDF/XVYQZQe0HY?=
 =?us-ascii?Q?UzXU1QsSFWCFe4SQNETBezRrJZ3F5SvUPiuZr5z/Mj5J1MW0Dlg9pDrOndOS?=
 =?us-ascii?Q?yAlFyZPRNG1qDo9V1fQerJpuKAHnLOAq4a9FR/5I8ov+vw+v4jY0Duq7mP34?=
 =?us-ascii?Q?xxgYZbpgP+7ricchNPyFhwIh6WYP4dItzlvtEpQeU2zGXeESTs6eT0jEfnrM?=
 =?us-ascii?Q?szsqM0zf5pKLGWAFPsMSbLQ/Kpvp/eJIGqDgEiUerjOuor/+05qfH0vbW5nh?=
 =?us-ascii?Q?efstJrrjEEsYZPpwaYyGujGP84EfGvkWw0ftMpQMcogQls0fCaH81lCVHNoR?=
 =?us-ascii?Q?GRnkZkSj01jzwdsrbeUnAPdS+DCv55EiAZYEASSOz5ZuzMumdS9jgqMBoMkn?=
 =?us-ascii?Q?jSQzmidZ1o3ZA1tLGrej9pPZ3AH5ptjWC8CMa4cwvT3JPcjw5Bgs3Ndy7gAa?=
 =?us-ascii?Q?MViMwPAgfrjRZg1x6aT9APbVZqWEN0YFSchB3nP29uDi0RvyJoLeQFF+zCfb?=
 =?us-ascii?Q?/ccvHBdySbJOOtET8hywe8gjQXfpUbCWJCXPTRZMsF32SEUrO4OVCL5oJGqG?=
 =?us-ascii?Q?3k1Jg/pBy4c/nWZwVXQHBHfTvh3Qy7KPBMuV6tGlEB+7NNDrRTaMmul/ZufB?=
 =?us-ascii?Q?BJUlaGXuhUUCq5FtEuVFF4TFIcI8zLXEX0LA2IkOE+qCoQYavxiiJ7B3wcSn?=
 =?us-ascii?Q?YU+nDcW3qlvaY4lzOjDiWpF3niZ1w5y4dIvHDAoWA7B7gSgVJWDhjNYaBHyw?=
 =?us-ascii?Q?N5fnuUFpyZA9wMu8bXPcfi9jTNK6AF89hbwnplN8rOyVI8KGjc4+eWomdiHE?=
 =?us-ascii?Q?2pBUYAhe2h/dAKPPjLmb35ZLT1gtlwkfvRFZcDJhqW+k5JiTPVkVgcOS4EXp?=
 =?us-ascii?Q?iibOrLZDmMNfQK00Fmgq1zfGLj9ZZ5kUpQ8Jvc0dG8HSpNBDeV52cTBOLQUF?=
 =?us-ascii?Q?rBH/IO18kzJxrvZtVCac4WMkOpbdP6QZDMAM0F+uwEP2rjw1AsRVBe8ZFEcr?=
 =?us-ascii?Q?2nRT9wpdXHOoXwt4+1NSNCjuY9RhV0cMV58cMX9J52A2MMCTtqcZ5EVRzk96?=
 =?us-ascii?Q?+BrzWEwgvGNMSTeFG6oMFlv9lmwmeaKbRSvfl2I9+hEKp574eDoDn/jFh/Jg?=
 =?us-ascii?Q?ceXqWrdRNfwQBGOrPucFZYN/GysEGMYgoBl3wH1TFztWAhDmXWlEX+ejaOJ4?=
 =?us-ascii?Q?wMbhJk+O1wUbPe6ICUVIliQV47yKehO/C2kOanM6jQCSe4gB6z7rg9caxd9v?=
 =?us-ascii?Q?9cjI+LFeW3/lj/iDdW5q7dSVG7gAkt7GbzrFTYXJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a42023-11f2-4cb8-78a2-08ddba9cde5b
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 01:48:26.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MWHo+SCR7gjg4liBaZnyHEauiyI3cRuSawyATBrIhPJ51r+fmhp0HAtGMTK5JSrmYALRgFkKnIvR7TdrqIr+/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7349
X-OriginatorOrg: intel.com

On Fri, Jul 04, 2025 at 05:44:33AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   17bbde2e1716e2ee4b997d476b48ae85c5a47671
> commit: 1b3291f00013c86a9bb349d6158a9a7a4f0334fe MAINTAINERS: Remove myself
> date:   5 months ago
> config: riscv-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040514.0TP3wH3T-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f1a4bb62452d88a0edd9340b3ca7c9b11ad9193f)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040514.0TP3wH3T-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of

Kindly ignore this report, it is a wrong bisection to this commit, sorry for the false
positive.

Thanks

> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507040514.0TP3wH3T-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(alloc.o at 1845388)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(mad.o at 2031628)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(skbuff.o at 2043568)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(trace.o at 1806688)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(net-traces.o at 2045788)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(slub.o at 1815328)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(osd_client.o at 2079268)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(protocol.o at 2082568)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(volumes.o at 1849168)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(tcp.o at 2052088)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(super.o at 1848028)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(segment.o at 1853908)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(syscall.o at 1808908)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(e1000_main.o at 1980208)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(core.o at 1966588)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(filter.o at 2044648)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(core.o at 1811668)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(super.o at 1853548)
>    ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(smc_core.o at 2075128)
> >> ld.lld: error: Function Import: link error: linking module flags 'Code Model': IDs have conflicting values: 'i32 3' from vmlinux.a(init.o at 1794328), and 'i32 1' from vmlinux.a(target_core_transport.o at 1969228)
>    ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
