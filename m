Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D47C22B59D
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747816980; cv=fail; b=Lc0zDOJtOMqd+7lFMErSs0wGvlxCfYfUCS5+lz2ZmzFe0r/T+nfB3aDSxu8HAFBsui89ZxbGZultXdfUYlxEeN8/l0hk/UxUo3WiKC9Yu7NRN9rSZ6H+5bAyBhUr8UM0gxFj2ZPWMuueBLWTLsZdroYRW8t6JbRhsWmW4BLs1NU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747816980; c=relaxed/simple;
	bh=XXCcIIQ4MUKjhUWbW9HmVQzY3uwApZRCQLIJWdDuRd4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Pje37sGMQJ9cgNb+18FhrfUZ8HGQkIwn25MMVh/Chyc+X5Jjj0j4rA3VvfIT2+yF634V0A4yJnZfFuLzDwJq60r1EYIVFoj0wh+qwDsDX3t7xljbQHoU5t3P4qy2uvLodr6Sh+X6XHRE4Wg8dJzdR3WSsy/yH6TMmTDmdbgdsj0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goiL2H52; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goiL2H52"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747816979; x=1779352979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XXCcIIQ4MUKjhUWbW9HmVQzY3uwApZRCQLIJWdDuRd4=;
  b=goiL2H52dD87QRFJ/LcVwE/mbe7o31Za8LCGivYMyBvnZmeiV1QNsEfK
   V+B85NkltL85aqrmQq+9YzCOIzLkXSr13tGk9J1Ia5HzB/A4wu6FsDETc
   3eFi2R8bji29/TLvX7Mz+1OuTw+9LbHIkRWUameS4lzRRVzGB4gvAMVZr
   KUIHLhu2AqHz2gb72eCG81iWSAYeQtn4zYPVVhPikRoYhUHiKlPubXir8
   4LYpR9nQTNWUuR8gMhT1PPM956NJOg1XUGCAs141sIMN0mV89wy0Wrh/y
   QdW+i+IHgDdQS8A+YPU6YZeCUnwBU4WRmdnBpPp2TiXhQyc07ZN6onE/+
   w==;
X-CSE-ConnectionGUID: rLr8cnMaQC+Q/h88hqCvJg==
X-CSE-MsgGUID: wOgG3FxNQum5IMYcbLraMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49920986"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49920986"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:42:58 -0700
X-CSE-ConnectionGUID: cR7/L6xpT9ezoSkAHDAnOQ==
X-CSE-MsgGUID: xkWm4SFzRKagqMDF+Qt5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143959096"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 01:42:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 01:42:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 01:42:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 01:42:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eB/aN8dNYTqLkCd3gZN6fYk82YG/ZgvH0S0kFEYv6hkfbwifMjq8zanqPHxmCsDT2eCJ3+L3JCikJ4wA+pZBGoZXU8B8Zytzuir5UstAfCACtTE6SNSCr5uISuCRC7TmRCVd2iGWSDtcBdHqhuNVRhnLABAHaQJQ17mf+JuFin9jEZ7vDFy6i2FSnf/FzS8cPQvbge7ocNLrQnUn0S4nOz4DfNiG/j3BczpddyqA3Zs1p9QIHRLVP6DjAGYCYB8ttuZxfUS/2WyBKF5nqnaOV3TIyhvE4vZVkgznySCyYDErXuB+jI9Amlj5DsNIRPsnRh/xqIcZ9Oh60q1drdooeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtwGkEulG8wn9F47x+f2pO/TFkI68mkgNywwOfJ7uCs=;
 b=y3MuZ1iXkj5Ml2H3y6s0GtCCUzEC+YQtESeAfjYb9rSWwMGVzwpg2Z943/u2W6CS/h2vJcvRhSwUBN7QebPoULP8gGdsWWx5Q003s0YpISOqp/tNlirxgqGKEewpefkL/eg+0IF/IF/xTIvYvu7DMUF12etvglnEzaZRkXR36ITT3xBt2R7WgaY1QPaZnrZGX70wXZkh8m6ARFFsEeHTsUQEnffJN2Ql5CdaJ3OE6wmUrTXQkCMRQWZwNCXojyahkNdduw9CEySmMfa05y9vDu8APq6+xwk1Pn1kU23DtN40HYjqEzmrHclP07cBQa3fzx80NEchZeBl1PhMDlzJTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB8016.namprd11.prod.outlook.com (2603:10b6:510:250::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Wed, 21 May
 2025 08:42:55 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 08:42:55 +0000
Date: Wed, 21 May 2025 16:42:46 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: [ardb:x86-startup-confine-v4] [x86/cpu]  287f9245fe:
 BUG:unable_to_handle_page_fault_for_address
Message-ID: <202505211627.1f9b653f-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::14) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 58cf177e-8dbb-49db-787e-08dd98437b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WU9u7XVP2YYaGKMz6b4fUnm/iPKH0Xp0zoujsa8g65XBza+xf7rpfVf6khFy?=
 =?us-ascii?Q?ftQzZL/eBW3Gy0wnmKBoZcnGJY8T7HHtHK6qwSqVSzPBxQaWPLX3i9VQC/+a?=
 =?us-ascii?Q?SymxYqANgWHxJOnq9DGQks56W+hYYpRJTjJVXnM1qzVC2LkocbcTnOQ8+hKB?=
 =?us-ascii?Q?cts4+svvW5FlXc5DRs2ncuNQwSIu6E02DWmHe9noH8wft487pT5wB9pBoxC4?=
 =?us-ascii?Q?xspLGK9jttvFTn+TsU2kPqGnhYgM7scy5e421fFKkYWDaakDb9L4xosLHizM?=
 =?us-ascii?Q?LVFAGj993M/PEF6+znBYqBmYxcXEGKmFVAE9KfpZEBVcdTulE+0t1/zhXGzu?=
 =?us-ascii?Q?YiOIn09hSBoQL5P38q2NrMfWUN94gjERt9j0pfKm3iHqOEdIY2pRy84tUZHj?=
 =?us-ascii?Q?qUSkwWZTAdF1B4su/Wl3hGURU+DEEy43DcblVtQ6xaGriiFfrAlyFRame7Vk?=
 =?us-ascii?Q?I6F30GJMscT8rg8nMwyRxah5qTvBwEeTO99Cu6QvZjhFanXpHI+H/yr2BBdt?=
 =?us-ascii?Q?QDiUjTI6f5pqCE29ErcCTTArYJGu5H5UJFI4yv0IxpaIwt+FmCaDWpCs+pKP?=
 =?us-ascii?Q?GRV25e+M2Ek7dn/de7p6zzBvUAJMtHoCYtU7EIb+awjLSr70U4Qn08BUWdeO?=
 =?us-ascii?Q?SncJy2HRTKNyDEidWP4EAu1PQxc84gPEPWATMyNybLwyVKjJP7F4qwh8ZakP?=
 =?us-ascii?Q?Kwt6Bsf13XHik3NLASWPM1qPt9sNVpzYg0YtysX0bWOKtHJJTgSVsmrqR/fr?=
 =?us-ascii?Q?X7hJ1Z0q2Pv+mFJc09IfGGwNB1vblSYGN3LKrowVrjd4EDf2w7F9d6ITBJmf?=
 =?us-ascii?Q?d1AF8avFARTRfrnpzEbojvrDQL+hO2PMJOS5rJ0hC5NOI++S2B+6CHCdr9PY?=
 =?us-ascii?Q?lYB3NOtAnlr3PKw6mpb+94sbgV5NQbG4a6RvtauwBb4Wg5LgJ38LsZ3IHAIA?=
 =?us-ascii?Q?JtnzbqrY9ElEWfz7xnMZHl6iboTUaNzXRNPsiIecwZYKqdPpNTPKWBdgDqE5?=
 =?us-ascii?Q?1vUv1XaqR1nORokFp317r8HNGvbA9AVKd+lu9cgTK0eVhwJ72KxZ0QtQjsiq?=
 =?us-ascii?Q?pEd3uwknR28IOKz73GMjIlgH6Vk59HL97GSTaeTPdjOh3G61z+Hrl0a/1mwK?=
 =?us-ascii?Q?0ekB2ks3vKNj9DqVS+MZun5UcDMvK1K9MzosKTYgcfsG+BiaeJnNSw/XDiQQ?=
 =?us-ascii?Q?AJ+tKvDBuf8TqEcNYrSmG7feOH6gpDhUsljR6KfPpzytjIB5jJYm18QHKIoO?=
 =?us-ascii?Q?JglUKF5koKWd6c1QscmuRYP6H2Hy0tgnA9gWRN/D+EylTaq+Cun1By/baRCm?=
 =?us-ascii?Q?h8561HhZthHZmooY7G6OJW3ufEdAC2nbDhJXR3nfzuUmSUHUNXIFZHO55ssf?=
 =?us-ascii?Q?NxvHvdiXXNpgVoP23kjzOlw/ypZ3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KFqk34y8Vx7L5KswFXGtYj+2E3obVugkrPId8BqgvMYrbUDRFY02C+qGzBsZ?=
 =?us-ascii?Q?kpaooEenwRGaVU2nX8jEHFJ95Cgk63Rg8pJPv+DQbmeCYezEdnlLQtoCrBan?=
 =?us-ascii?Q?Q6rvsRwaJWcGxwOj9ZHh2qiPjqWmvcXLI9rpNbD+cW13sjrZS7JbRaJI5d3o?=
 =?us-ascii?Q?1//0iYqf1gb2e84g6HRwW6/xkayPuu4ZctmXG6L73aZ7HlLjmqvuyebhIC3/?=
 =?us-ascii?Q?dHFIW3KhSFBTTjxqNkeOxoFPqi6P7QmXzFgrMOVyuFdYOgn0CTBRnj5rEF3y?=
 =?us-ascii?Q?xdZUzPh9vEOWscIl3rV8OoiviCy+R3O/liO1iIhUXDBc+oEBRJyYhh+HgY6K?=
 =?us-ascii?Q?NK97SpWA/oOIswxMtuYIf8NpAYbQkXHC5IiNOCl4E/4IR1LtIYcHodLXkhKs?=
 =?us-ascii?Q?3CrGUTiKX/vV4DcDm0KHrMmBHyogI62X7jkP1JTo+Cpl7uIW9TzE6BitCAMP?=
 =?us-ascii?Q?PMaPPGVTYGJ4AN6ZRMRVrGCbvlbEv4WWiWcisCVOvaZ8+cmHrCi8vl3DIjdE?=
 =?us-ascii?Q?gDtyZdxUja4brI3aEevD5HVaA1QI6HsFWLWUwSULhYaRKBrE9Ix16+r5c0ab?=
 =?us-ascii?Q?dv9rjK4oTexWBHxiNVZga+sc+8ikF6ZlixAJDpJFYhuKPJr75DjVK0QgV8Jg?=
 =?us-ascii?Q?IgJfBssx7ocb1MLwv9J52B56eg9LXFHKHw9glndGCiLiv0kUU74V9HW4oWDq?=
 =?us-ascii?Q?SzMe+7F9pce1GxWPsrAokhHoDapZ8zAL7yd63DKx38gXMMKbAPhDz2Z+LM5e?=
 =?us-ascii?Q?2owJDWjtZRBWYKSoR2AgrDtuuUCd8JfFU3G0HPOyYtFEfDoxc50W+pifd1Eh?=
 =?us-ascii?Q?pxdtARwxpuULvQZtD3Tza3UDR5HJK8lIf5Be4VyTl+Cb8bwHAQiqvy8e398j?=
 =?us-ascii?Q?WS6wdeK+0G4QKJfUkcvouWpNTxQDedMNqZu2F9UpE37EPFP0Ta+CXhf2x4Gt?=
 =?us-ascii?Q?3Pqynm9Oln+2DK+a0w6Y1TwAOgqKHBPJeG4BM4xHcAxd4pk5+88bJy3QpQAS?=
 =?us-ascii?Q?W17l1paB6IpIqBmYTjuKKYIqJ8AMz4xOyPrGBIn7eGXYIUP9Uy1uChMx+ho0?=
 =?us-ascii?Q?PksGX0pNmN8+tTR+Zm0VkJkGKUl+e0W7MR/PY2v/0EIlso68Gex+aHPsCcnv?=
 =?us-ascii?Q?Y4UdTxzyRo69JLtGuOv17E56kDKB6bWTeq+hqSTbVvNxdolRn/NNsNw3iVfI?=
 =?us-ascii?Q?PcViOKpk7trm0scfKu4QcQaK+vlhVinPcPgHlEDBzazs3keC4Gld7g2gdbqF?=
 =?us-ascii?Q?vX/erCvM8tqhBFOce1zhe01qzPUkbxk+A7gGJlg43JAuWGgfOV5Av6fhGWIe?=
 =?us-ascii?Q?A+39vSmd9mAlosZwtSure5UGZ6BdD4PYHOYhH7Vu+4nwAS2gQo1zqigQWKfX?=
 =?us-ascii?Q?fMk/6ZJHXSyN1xW36WOUYADaKgjaf+p3d5LTrzINpd/EbYr3uUFSFw8ouSZM?=
 =?us-ascii?Q?FCaUEALYxgTd18epzMnZCr83DIbdbPu4PHN9ujXY1RAsxOgHRpZ8/5jf3mRm?=
 =?us-ascii?Q?yOqhayr4FnOR2zmRTBzcPi06iWcLUQwgf5Kq+E5vyEWQ8cz/z6gVibLAaR6z?=
 =?us-ascii?Q?EtrZshLIY7ng/GXPtLUOCOeRdb5qPAEAEHo7Mt7m?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58cf177e-8dbb-49db-787e-08dd98437b1e
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 08:42:55.3579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a/LZsjIQkXXQOAVQ0+IAQpaRjCKFIZxXibLckaJPCVFtnNS2P/gToxl5JzQXE7LCyXZ4M/1GrJ0pLhDQlnmAbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8016
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" on:

commit: 287f9245fe1003a1cdb1462ad7a7da1f33622d91 ("x86/cpu: Move CPU capability override arrays from BSS to __ro_after_init")
https://git.kernel.org/cgit/linux/kernel/git/ardb/linux.git x86-startup-confine-v4

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: cpuhotplug
	torture_type: tasks-rude



config: x86_64-randconfig-001-20250518
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+---------------------------------------------+------------+------------+
|                                             | d38f99f00e | 287f9245fe |
+---------------------------------------------+------------+------------+
| boot_successes                              | 6          | 0          |
| boot_failures                               | 0          | 6          |
| BUG:unable_to_handle_page_fault_for_address | 0          | 6          |
| Oops                                        | 0          | 6          |
| RIP:clear_feature                           | 0          | 6          |
| Kernel_panic-not_syncing:Fatal_exception    | 0          | 6          |
+---------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505211627.1f9b653f-lkp@intel.com


[   86.680641][    T0] BUG: unable to handle page fault for address: ffffffff8393e998
[   86.682137][    T0] #PF: supervisor write access in kernel mode
[   86.683176][    T0] #PF: error_code(0x0003) - permissions violation
[   86.684292][    T0] PGD 3af1067 P4D 3af1067 PUD 3af2063 PMD 15eb4b163 PTE 800000000393e021
[   86.685847][    T0] Oops: Oops: 0003 [#1] SMP KASAN PTI
[   86.686846][    T0] CPU: 1 UID: 0 PID: 0 Comm: swapper/1 Not tainted 6.15.0-rc6-00373-g287f9245fe10 #1 PREEMPTLAZY
[   86.688595][    T0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 86.690483][ T0] RIP: 0010:clear_feature (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:60 kbuild/obj/consumer/x86_64-randconfig-001-20250518/include/asm-generic/bitops/instrumented-atomic.h:29 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:104 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:95) 
[ 86.691951][ T0] Code: 48 c1 fb 06 48 c1 e3 03 48 85 ff 75 28 48 c7 c7 60 17 b0 84 e8 3a 00 00 00 48 8d bb 98 e9 93 83 be 08 00 00 00 e8 1f 7e 5d 00 <f0> 4c 0f ab 25 d7 9d 6a 02 eb 19 48 8d 6f 30 be 08 00 00 00 48 8d
All code
========
   0:	48 c1 fb 06          	sar    $0x6,%rbx
   4:	48 c1 e3 03          	shl    $0x3,%rbx
   8:	48 85 ff             	test   %rdi,%rdi
   b:	75 28                	jne    0x35
   d:	48 c7 c7 60 17 b0 84 	mov    $0xffffffff84b01760,%rdi
  14:	e8 3a 00 00 00       	call   0x53
  19:	48 8d bb 98 e9 93 83 	lea    -0x7c6c1668(%rbx),%rdi
  20:	be 08 00 00 00       	mov    $0x8,%esi
  25:	e8 1f 7e 5d 00       	call   0x5d7e49
  2a:*	f0 4c 0f ab 25 d7 9d 	lock bts %r12,0x26a9dd7(%rip)        # 0x26a9e0a		<-- trapping instruction
  31:	6a 02 
  33:	eb 19                	jmp    0x4e
  35:	48 8d 6f 30          	lea    0x30(%rdi),%rbp
  39:	be 08 00 00 00       	mov    $0x8,%esi
  3e:	48                   	rex.W
  3f:	8d                   	.byte 0x8d

Code starting with the faulting instruction
===========================================
   0:	f0 4c 0f ab 25 d7 9d 	lock bts %r12,0x26a9dd7(%rip)        # 0x26a9de0
   7:	6a 02 
   9:	eb 19                	jmp    0x24
   b:	48 8d 6f 30          	lea    0x30(%rdi),%rbp
   f:	be 08 00 00 00       	mov    $0x8,%esi
  14:	48                   	rex.W
  15:	8d                   	.byte 0x8d
[   86.693646][    T0] RSP: 0000:ffffc9000013fc40 EFLAGS: 00010046
[   86.694204][    T0] RAX: fffffbfff0727d01 RBX: 0000000000000000 RCX: fffffbfff0727d34
[   86.694858][    T0] RDX: fffffbfff0727d34 RSI: 0000000000000008 RDI: ffffffff8393e998
[   86.695516][    T0] RBP: 1ffff92000027f8e R08: fffffbfff0727d34 R09: 0000000000000001
[   86.696174][    T0] R10: ffffffff81294bb8 R11: fffffbfff0727d33 R12: 000000000000001b
[   86.696611][    T0] R13: ffff8883af027188 R14: ffff8883af027120 R15: dffffc0000000000
[   86.697022][    T0] FS:  0000000000000000(0000) GS:ffff888429d78000(0000) knlGS:0000000000000000
[   86.697483][    T0] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   86.697825][    T0] CR2: ffffffff8393e998 CR3: 0000000003aee000 CR4: 00000000000406b0
[   86.698235][    T0] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   86.698645][    T0] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   86.699053][    T0] Call Trace:
[   86.699231][    T0]  <TASK>
[ 86.699390][ T0] do_clear_cpu_cap (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:128 (discriminator 1)) 
[ 86.699646][ T0] ? clear_feature (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:114) 
[ 86.699891][ T0] ? topology_get_logical_id (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:227 (discriminator 8) kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:239 (discriminator 8) kbuild/obj/consumer/x86_64-randconfig-001-20250518/include/asm-generic/bitops/instrumented-non-atomic.h:142 (discriminator 8) kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/topology.c:333 (discriminator 8)) 
[ 86.700177][ T0] ? topo_set_ids (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/topology_common.c:188) 
[ 86.700467][ T0] early_init_intel (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:206 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:238 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/intel.c:336) 
[ 86.700731][ T0] init_intel (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/intel.c:542) 
[ 86.700959][ T0] ? early_init_intel (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/intel.c:537) 
[ 86.701227][ T0] ? get_cpu_cap (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/common.c:1052) 
[ 86.701473][ T0] identify_cpu (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/common.c:1959) 
[ 86.701715][ T0] ? get_cpu_address_sizes (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/common.c:1905) 
[ 86.702011][ T0] ? __set_pages_p (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/mm/pat/set_memory.c:851) 
[ 86.702267][ T0] identify_secondary_cpu (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/common.c:2091) 
[ 86.702551][ T0] start_secondary (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/smpboot.c:199 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/smpboot.c:283) 
[ 86.702803][ T0] common_startup_64 (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/head_64.S:419) 
[   86.703068][    T0]  </TASK>
[   86.703233][    T0] Modules linked in: rcutorture torture polyval_clmulni polyval_generic processor ghash_clmulni_intel sha1_ssse3 ipmi_devintf ipmi_msghandler drm drm_panel_orientation_quirks dm_mod dax qemu_fw_cfg autofs4
[   86.704298][    T0] CR2: ffffffff8393e998
[   86.704523][    T0] ---[ end trace 0000000000000000 ]---
[ 86.704807][ T0] RIP: 0010:clear_feature (kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/include/asm/bitops.h:60 kbuild/obj/consumer/x86_64-randconfig-001-20250518/include/asm-generic/bitops/instrumented-atomic.h:29 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:104 kbuild/obj/consumer/x86_64-randconfig-001-20250518/arch/x86/kernel/cpu/cpuid-deps.c:95) 
[ 86.705083][ T0] Code: 48 c1 fb 06 48 c1 e3 03 48 85 ff 75 28 48 c7 c7 60 17 b0 84 e8 3a 00 00 00 48 8d bb 98 e9 93 83 be 08 00 00 00 e8 1f 7e 5d 00 <f0> 4c 0f ab 25 d7 9d 6a 02 eb 19 48 8d 6f 30 be 08 00 00 00 48 8d
All code
========
   0:	48 c1 fb 06          	sar    $0x6,%rbx
   4:	48 c1 e3 03          	shl    $0x3,%rbx
   8:	48 85 ff             	test   %rdi,%rdi
   b:	75 28                	jne    0x35
   d:	48 c7 c7 60 17 b0 84 	mov    $0xffffffff84b01760,%rdi
  14:	e8 3a 00 00 00       	call   0x53
  19:	48 8d bb 98 e9 93 83 	lea    -0x7c6c1668(%rbx),%rdi
  20:	be 08 00 00 00       	mov    $0x8,%esi
  25:	e8 1f 7e 5d 00       	call   0x5d7e49
  2a:*	f0 4c 0f ab 25 d7 9d 	lock bts %r12,0x26a9dd7(%rip)        # 0x26a9e0a		<-- trapping instruction
  31:	6a 02 
  33:	eb 19                	jmp    0x4e
  35:	48 8d 6f 30          	lea    0x30(%rdi),%rbp
  39:	be 08 00 00 00       	mov    $0x8,%esi
  3e:	48                   	rex.W
  3f:	8d                   	.byte 0x8d

Code starting with the faulting instruction
===========================================
   0:	f0 4c 0f ab 25 d7 9d 	lock bts %r12,0x26a9dd7(%rip)        # 0x26a9de0
   7:	6a 02 
   9:	eb 19                	jmp    0x24
   b:	48 8d 6f 30          	lea    0x30(%rdi),%rbp
   f:	be 08 00 00 00       	mov    $0x8,%esi
  14:	48                   	rex.W
  15:	8d                   	.byte 0x8d


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250521/202505211627.1f9b653f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

