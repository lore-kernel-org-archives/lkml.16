Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8631DF985
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 02:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747189425; cv=fail; b=ArJ0FtUEFh04gQMfVtADfWWAjPcP5k0gHaqj/HyAOaIzd+gYvSSmfSCDfUEc3EajXYBiEwk/5qSVELvP0+sBE/+p/Fxfw0C4hNNm1WNUoPewA87vZTRda8WuegfgjzJpV54zgFLwYNUvcGtjqwT2hedrHacd6JMUNI2LTxT6hi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747189425; c=relaxed/simple;
	bh=aErxP1R60Y5/4dOLEZmZZ291bQOViWwFC57L2WqOUhc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Xi2dCH2qm0Rs7ABsYrgDZzzghfO0AqZtZUBcNkDYtd5Vv3lQBq0hpIMUpR1UMPhTqRissBpBiHTD+sUAXKTui8i5PsieezV0vW+U7sqspUUo4EYO36KPfL52i646/sulCN0r55hX2L/tHVA7+q4yECZpcfcGd0p6Vk3QC5Zoi9I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSl9Imgf; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSl9Imgf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747189424; x=1778725424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aErxP1R60Y5/4dOLEZmZZ291bQOViWwFC57L2WqOUhc=;
  b=jSl9ImgfkkuguWK5yB5Jf7ZaCwL69hfQv1S7U4PPAX60+/Rv50Ji7iD7
   wUkItNUmiXN9uLRHdQ6QdtTpxie9TuhMBbYJNe32nmNPQfJ/F+IXfNeCN
   ELSEp9AvweJx08FRgzMUxsGpLbqRflAkdas61jM9y2h/DVDl1EfFug9HG
   7pcG/2Jvr9HtEZNk/RTKKuoitH6pCoGvoWmSnv6uwDTj1eppdLE4TS4Z0
   3VEeeljlqUL61Y/h15g3F4adrv5EwJGf6xtPA8K7eOInI9sLcMthkKi7F
   rNQwPddHpByju/kiLLG6X0L8Qk7ObD//JdPhW8i518/vopov+g01Xu/h5
   w==;
X-CSE-ConnectionGUID: MNoqVxLBQSCOAjM7UxcmeQ==
X-CSE-MsgGUID: 39TIg/XFRVOyJkjf0fKfwg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66615994"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="66615994"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:23:43 -0700
X-CSE-ConnectionGUID: 3i/wKhtqQ9as105XZMbsiQ==
X-CSE-MsgGUID: N9noMUbNQzuaG8IgW8xC5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="175014656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 19:23:43 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 13 May 2025 19:23:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 13 May 2025 19:23:42 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 13 May 2025 19:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kbKW7q58hhYXg7RjG+LQfEQzaS6ZlQ0hNIcmfXepQWY+8q1kbYTN/SuVSGPEHL1Zk73uxi+TtfCKuKT+24ghELE0Fjci4gpvw+PnGkuTXVBUrZKj/j4mzzMYApWYL7J84+odUCmY6lO+7UBT09huyijCxKhxYK0mNDUqQGY36d4QXA3D/BFLErHH7CZ8p4KqVKyX1DSDHQ9fX0299ZbIUPu/+1b8azjEXckw+l8j5gJW2noyNMG5y2F5H0K65u2D6CopFCCS2AL4r16SGkbWm+4MHyfuHcjNhvEKi3VmpC8Ke6LV+bDMiR22uVEo9mVryCifXQjSGF2buOWudTpqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1GE8L4e3OAMtZ0zGrqFytlcRKrjsrXvYN8+HsAo61Ic=;
 b=ConjwzkGmODDAS9G8AvD9QKkamIDKwpoB/aTQW4uOjSroiTg+lmbzx/vpY1JEF/7KfDPwipUSOnLQ9K+wTTp3S0QxJXRh+sBIKw4cpUdzwxKOR4KVFYu65MdsobnASpd2XtMEi9AqQdVnGVBBgFuRlwHtiQgZAc/123i/vDVbw+V1nQbML7HoXQkZoRc6DLv8l0T/iHGgsbZA0DYqqrbcvj9zhzZd+a3DcXu9OyekW2o6jWSITOKF6ugMGgPuAWOIIJIZhC0iuqp0B8eZLbG2XeyTa2IzmrOMDN6msobdPbe1bD2OO6OCO4bhdKUL8JCwD56eJ/7ufydJtjtLyiYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB7651.namprd11.prod.outlook.com (2603:10b6:8:149::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Wed, 14 May
 2025 02:23:35 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Wed, 14 May 2025
 02:23:35 +0000
Date: Wed, 14 May 2025 10:23:26 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Joel Fernandes
	<joelagnelf@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>,
	<linux-kernel@vger.kernel.org>, <oliver.sang@intel.com>
Subject: [paulmckrcu:dev.2025.05.05a] [rcutorture]  54d0803f63:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]
Message-ID: <202505131651.af6e81d7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0060.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::17) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB7651:EE_
X-MS-Office365-Filtering-Correlation-Id: cd983476-1114-49cd-aa44-08dd928e544b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?twwIFuiX3qwJLxalNsukGm3iV0qTN8TMdteVbbbEt6ty1GiL03UqlBtIxIer?=
 =?us-ascii?Q?aweVizuUFI5Bc/eXj6cM4FD6v6+j7d335W2g/EIktkB8Pz6ZR6yAhpcRbsW7?=
 =?us-ascii?Q?iP/frT0JPi7G5kiy7yJ4Akl12z/ksxA2vWse9RdNa4RirywaZGem+EL8hfbM?=
 =?us-ascii?Q?oYAfFN0L6Ie+Qy82Jpwsb8hORuUEazhVpnyd5oF3TxVvvjsUlCC8HGW5zZMM?=
 =?us-ascii?Q?2Z3cOXRwBRUCx4F1PBI19c/ZmzqBYQerLY/XOflSYERz47+j2Bgte7IYoKla?=
 =?us-ascii?Q?Qy56B/dPj3hbIIehtISTRnWyEGwGjwJN/AzREOQodfzrKLyMsraZI91Y3GHg?=
 =?us-ascii?Q?pnyB6tG1n2KArDzbAAGsdO0RBoJiY4oBUshnw/+LVZneN5Ine+Jw8B99RxGd?=
 =?us-ascii?Q?HpZLNM4hvgqw3O6lKYIEVOZdA6CVDkQS/32ITUCazSWhcfcRAe6Ror6C86q+?=
 =?us-ascii?Q?aNBewjYM4TEucaBJiTzMCeNeB2Enw8aBtQdCHAfsMLMh9LsjO8IjExKtfPSe?=
 =?us-ascii?Q?UY65LySKtlIfxM97I10uj3QD7GcGX7ptTSY3S1QsmWbANgt1gvtmML4KkNwH?=
 =?us-ascii?Q?5k4+n/1CLpVzX7d1fxPI3DGnlmOKU2nJXTCo8aDATmFSk52gtChcVXdnU0rL?=
 =?us-ascii?Q?HXvfDMI/hVf6l348F1iZuzetX4WY/TSeTfmUx80oPb+Y49ras468cEeYBgEC?=
 =?us-ascii?Q?G0nkENv3BommjklZ3bYOsKXOyGZXrXE8H2xsLp/PK+GYVgbeaVlwgChP68Qc?=
 =?us-ascii?Q?pEp3VmvMGJ33dy738LdeIzrfj1j8f7MHL1oS7IEZpzisKYv7iM7ogHSwK4e9?=
 =?us-ascii?Q?9rSUAdA0caSr127bIicZhBZISjqKSNsLKCHlPg1E9VfpXkHl2Cq7/qwu8Ezf?=
 =?us-ascii?Q?iK/QCnt9TvhqzMHOdb+Nlg6r3Rrp6ctrSY2LAJXxeu+QxK7oETQpT23Gspdd?=
 =?us-ascii?Q?a/KBvZtsxNQCK4VJwBEKNUVQuxpgULPBT4cgBX3vjNBPMFH9nkTCnoMRoDkO?=
 =?us-ascii?Q?Ew4Sr7RRQ0KB9VczCU51DHHzb30yaBb9HaqzxL98/y0hymA2cuin5plkCYaO?=
 =?us-ascii?Q?HnkAzfurgC3glMlA2WPqHxS1lSxFZnB8UENaqwR4b1Rj5KklG3BGsTKDuVkP?=
 =?us-ascii?Q?i4yii95q2SFRp3MSq4Hr7D/OtEIE2N3gDNDts/VpV7X/E8QH5xfwlNELaMKZ?=
 =?us-ascii?Q?JTLZeQ3VsT17JIxY4UBwk2/WT7RqJkZjYrWgeL63y75GXTzB6CTk2NxZDUQT?=
 =?us-ascii?Q?B8QKLDJpn79mY2T1qDqgrJB9pdZ06/Y4aP3knBDezaicyJ0kdkqUWe/yjfCe?=
 =?us-ascii?Q?cye20CWnp7qXh/8l+FZRwbCtdLz65bO06tQYSc/XTZSFWCKSdRSjWpvxRrrG?=
 =?us-ascii?Q?ZnGkTDm3R4HAaSEjAaffLIvgasD/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tHsJ9Hd69fEql0n1SAzNhSDZ3+NLf/zy5QaGMV7Amh1Ek0yWsSudRTmTh4r3?=
 =?us-ascii?Q?bRgTAKGK1LAl4IXufwkcSK8lC9aij48Q2C8hGZ7SlDtLHCrgQMLsICl9dVu7?=
 =?us-ascii?Q?WNgHRYno+v6IhcfLHPRovRZN90lWcM2jWxkHUDCt5aIoP1uP7h95fwREtInm?=
 =?us-ascii?Q?mEXEgpWU2Uz3bMk1+4j3LBvO5DNieZydZQ8kTTmay85xALw6hxZzL2Dgi9zw?=
 =?us-ascii?Q?BMWaVyELxRFfuDyp58D8Ap3nO7HIQUtsNRws/l2pX+gB84jBD1T6zxxAaKVU?=
 =?us-ascii?Q?saSEr1yPLUpzT3dccehc2itU0aOyf2NU5XCmtUDXqX2ia3F3uzyTISDeafZU?=
 =?us-ascii?Q?iPcH0Wl/+Y1oTCpy4ZqlQmbLhlIaCIjiRH+G1k6xmrnSothoDAHq7QEyE4Pb?=
 =?us-ascii?Q?QlyPLM0XTZSPQCbjIa5OwWQiUEQdzS1Z0jK+8dTHKyzZoX/+c2i4qg9uIL1L?=
 =?us-ascii?Q?eeJyW+6Cjt+bYm3oEStkFCDHuxNk/+FcXH4IJTrNIoDNXxM5dibXkL/MscSc?=
 =?us-ascii?Q?rkte97GJduwu17vmSQBDdH8LMXQ1OoOD4ZTEszvDAD0wKsgHhiQy5PZ96DIY?=
 =?us-ascii?Q?479s4X9wAfycyAHZ+nR3TosRhDqdW1s2T9YhkMtWEkdHpLaphSJfkS26S827?=
 =?us-ascii?Q?8EabrznxT26fBlhW9YIK+y6OgTsNwXzEIHt3LChv5EXixiy0GuVGJfvBD6mZ?=
 =?us-ascii?Q?3io9lvJSwTFQuylbZPSrckg+cAza2RLHY4A6pzr7mng5ZNDLIho84SPTIhmc?=
 =?us-ascii?Q?4ntFJRxhdmm6dy/i2QUjDMO3nHKAw1x+fnvZ2sPFz8alx0M1JSPxNYc5gOho?=
 =?us-ascii?Q?CfPV6Z+RScBQ2nXsyISHz/Vzx6p67xdXMDwUee9Mt3prHX3lD5vzUEAaOP4T?=
 =?us-ascii?Q?rJxQAlkJoky51sTSYwaR7ll7FT0s/CqQ/4QsY5ShMJfQPj29ejwxEocyCy+0?=
 =?us-ascii?Q?/u7m8cU+GpKfMxxLzC9lb+FTGhRpoCtkVHXgSXxGmVHZnWwgEqFELoVu3MCA?=
 =?us-ascii?Q?CzTwhjn9MuFUyWjF4F6kyN06a3YrH7ti6YcaPnPLsclcj1dwUgzYLEE3/WZz?=
 =?us-ascii?Q?dPKevZtwL12dUv7BKmlTu+jXFvZvyrk1cAm74OO0TbBOHJAdyTmINpjZcZYk?=
 =?us-ascii?Q?5W55HBmCvx3oxxZtp/Rh5WQnCESfl7wVeccgUmbvuhsLndNpKPcpZlAmELep?=
 =?us-ascii?Q?pQgbHWg1VnKZUotMAwJMveaUNCFyBCDzQmGz2V7zxqDt8YhynN6s3rY7lfMF?=
 =?us-ascii?Q?SG/ydltR55cvn1YdPS6RZo5pyUERs7oFyakKeBt0GUQPbZeH89lOqIP1hLm4?=
 =?us-ascii?Q?CIUIl4ygIzNWZfBzkCn+fif1zwQMBOTj+yTsZdLJ4EEd9F0y49IVlPqrWHWj?=
 =?us-ascii?Q?paBRVRPTZMOorr+qkpRcrVcXdvJ/OhxvlsWiNtPgQWwTGNEGi8H5amvJQE1C?=
 =?us-ascii?Q?K4uXbt/lp1g/tBJNU3D2suc+V7Yd4gEa8AfAimHmw4PiPhlV5zoVmZ3bM3Wp?=
 =?us-ascii?Q?6myNeBsftFnGoaT/NzHWnc9vs28zf3aoJVIAWuVuW1eb6yOH98LWyn9FbDQb?=
 =?us-ascii?Q?L34C72nFIb+gAjhqK+XJae44KHYFyjqdg/aJV5F04qo68INuSiyUgLtJHBNm?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cd983476-1114-49cd-aa44-08dd928e544b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2025 02:23:35.5376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rEBih2K1Z+4i5w5Cu3FMN35WpCVBksdCv+qv9u48EFxGmrAwy42oLh1qaYBGQcZkDGHEkvzvgjLOOgpQZVTUdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7651
X-OriginatorOrg: intel.com


hi, Paul,

we noticed various issues for both 54d0803f63/parent in this test.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/runtime/test/torture_type:
  vm-snb/rcutorture/debian-11.1-i386-20220923.cgz/i386-randconfig-061-20250510/clang-20/300s/default/trivial

ec3f43f72b268d44 54d0803f632b402e519c7d97a6b
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :100         71%          71:98    rcutorture.trivial.fail   <--- (1)
           :100         71%          71:98    dmesg.EIP:rcu_torture_stats_print   <--- (2)
         94:100          0%          94:98    dmesg.EIP:synchronize_rcu_trivial
        100:100         -2%          98:98    dmesg.UBSAN:implicit-conversion_in_drivers/firewire/core-transaction.c
        100:100         -2%          98:98    dmesg.UBSAN:negation-overflow_in_lib/sort.c
        100:100         -2%          98:98    dmesg.UBSAN:negation-overflow_in_mm/memcontrol.c
           :100         71%          71:98    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]   <--- (3)
         94:100          0%          94:98    dmesg.WARNING:at_kernel/rcu/rcutorture.c:#synchronize_rcu_trivial[rcutorture]
        100:100         -2%          98:98    dmesg.boot_failures


but seems (1)(2)(3) are quite persistent on 54d0803f63 and clean on parent.


Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_torture_stats_print[rcutorture]" on:

commit: 54d0803f632b402e519c7d97a6b52d5ffb78ae78 ("rcutorture: Start rcu_torture_writer() after rcu_torture_reader()")
https://github.com/paulmckrcu/linux dev.2025.05.05a

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: trivial



config: i386-randconfig-061-20250510
compiler: clang-20
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505131651.af6e81d7-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250513/202505131651.af6e81d7-lkp@intel.com


[  232.971337][  T965] trivial-torture: rtc: ef358cc0 ver: 9677 tfle: 0 rta: 9677 rtaf: 0 rtf: 9668 rtmbe: 0 rtmbkf: 0/0 rtbe: 0 rtbke: 0 rtbf: 0 rtb: 0 nt: 3782 onoff: 0/0:0/0 -1,0:-1,0 0:0 (HZ=300) barrier: 0/0:0 read-exits: 64 nocb-toggles: 0:0 gpwraps: 0
[  232.974503][  T965] trivial-torture: !!! 
[  232.974595][  T965] ------------[ cut here ]------------
[  232.976982][  T965] WARNING: CPU: 0 PID: 965 at kernel/rcu/rcutorture.c:2730 rcu_torture_stats_print+0x8e4/0x8f0 [rcutorture]
[  232.980999][  T965] Modules linked in: rcutorture torture
[  232.982356][  T965] CPU: 0 UID: 0 PID: 965 Comm: rcu_torture_sta Tainted: G        W       T   6.15.0-rc1-00059-g54d0803f632b #1 PREEMPT(full)  5f9cb9cacb9aba8a18caee0ed4d4cf4452094bc2
[  232.990730][  T965] Tainted: [W]=WARN, [T]=RANDSTRUCT
[  232.992782][  T965] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  232.995869][  T965] EIP: rcu_torture_stats_print+0x8e4/0x8f0 [rcutorture]
[  232.997526][  T965] Code: ff ff 0f 0b 83 3d 88 8f 35 ef 00 0f 84 b0 fb ff ff 0f 0b 83 3d 8c 8f 35 ef 00 0f 84 ae fb ff ff 0f 0b 84 db 0f 84 ac fb ff ff <0f> 0b e9 a5 fb ff ff 00 00 00 00 00 55 89 e5 53 57 56 83 ec 14 e8
[  233.002674][  T965] EAX: 00000004 EBX: 00000001 ECX: 00000000 EDX: 00000000
[  233.004477][  T965] ESI: 00000000 EDI: 00000000 EBP: 47efbf58 ESP: 47efbedc
[  233.006060][  T965] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
[  233.007496][  T965] CR0: 80050033 CR2: 353667f8 CR3: 7c473000 CR4: 000406d0
[  233.009173][  T965] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  233.010612][  T965] DR6: fffe0ff0 DR7: 00000400
[  233.011678][  T965] Call Trace:
[  233.012511][  T965]  ? rcu_torture_stats+0x24/0x70 [rcutorture 7eef68a8ad9c4bc219a4bda0dc180602dd9a9416]
[  233.014416][  T965]  ? kthread+0x1af/0x200
[  233.016388][  T965]  ? rcu_nocb_toggle+0x1c0/0x1c0 [rcutorture 7eef68a8ad9c4bc219a4bda0dc180602dd9a9416]
[  233.018427][  T965]  ? schedule_tail+0x79/0xf0
[  233.019297][  T965]  ? kthread_blkcg+0x30/0x30
[  233.020404][  T965]  ? kthread_blkcg+0x30/0x30
[  233.021230][  T965]  ? ret_from_fork+0x2c/0x40
[  233.022315][  T965]  ? ret_from_fork_asm+0x12/0x20
[  233.023169][  T965]  ? entry_INT80_32+0x10d/0x10d
[  233.024178][  T965] irq event stamp: 495
[  233.024991][  T965] hardirqs last  enabled at (509): [<4f981d9b>] __console_unlock+0x5b/0x70
[  233.026606][  T965] hardirqs last disabled at (520): [<4f981d82>] __console_unlock+0x42/0x70
[  233.028125][  T965] softirqs last  enabled at (282): [<51ba356a>] __do_softirq+0xa/0xe
[  233.029924][  T965] softirqs last disabled at (267): [<51ba356a>] __do_softirq+0xa/0xe
[  233.031571][  T965] ---[ end trace 0000000000000000 ]---
[  233.033193][  T965] Reader Pipe:  23875253 3963 1 0 0 0 0 0 0 0 0
[  233.034030][  T965] trivial-torture: Reader Batch:  23879217 0 0 0 0 0 0 0 0 0 0
[  233.035198][  T965] trivial-torture: Free-Block Circulation:  9676 9676 9675 9674 9673 9672 9671 9670 9669 9668 0

...

[  472.316419][ T2339] trivial-torture:--- End of test: FAILURE: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=3 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 test_boost_holdoff=0 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 stall_cpu_repeat=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 reader_flavor=1 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0 preempt_duration=0 preempt_interval=1000 n_up_down=32


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

