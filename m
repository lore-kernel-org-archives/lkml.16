Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A59A2CCC9
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 04:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749704171; cv=fail; b=r9V+DV79wb1DXADYnUirq9JVYqP+/7qdfh84hK3WJTIeGRObcXDHPSKj6j6+wqC+d4+6QcYGlx5VUquikUT4ETp6ycv+ZD0hiGgfspZwoylinyMFi/6j9D3HyrJ6dNQtpfDhfu7Uw51OG2ifeMeIQfOC0/SZfV22783/p812pd0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749704171; c=relaxed/simple;
	bh=tQYnID4UegyXkJVj6EEgTXHLtWmyB24zULWeIIchNps=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oZae6Z/6+Jee7QyQdYSpSNgsAo3IfXush0Dx2Y9MdJfAmbu6qrrwi9a4q0Q3MaLVAlX6tewiH7mxmjzLeJyDZg+COcgyvEEyr5lE/3zf5MrRMrLXluaWSL5h4Bwkd3XreVj0KzG2JfsytH06Nq786sbi7G/ZkA7KUBGoKiZWnFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaMRmTQF; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaMRmTQF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749704169; x=1781240169;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=tQYnID4UegyXkJVj6EEgTXHLtWmyB24zULWeIIchNps=;
  b=PaMRmTQFfo3687srw1k/QuXqFkrJ8XUQFzaQa3F7HY7mlBq53EnAfJ8E
   xJtMt9maxqXbYfq54lHaz5Dvte120X1lTyC/r3wg53OCCTJUUwuEeD3h0
   8YMcLs1uoBGufdUhEgRyDepXHbEB2x58KZ7wMN7+LDLRbpNtygc1UvVU/
   GBVDpIyVQxl64SbdZDsm4yzcFev/M5a+q19Cynt6X8Wi1ue/IHHfic7yP
   AIt4NppbJ4kNsJF77cYjEXl4heZ4vK6ro23AGp+KCQxt3cZLYwNaRTVnZ
   z97e84nqxqiSt0gud7cF1qMwg3zrlILNQLIqb/SibCvfaLOK/Kjm5MpQ2
   g==;
X-CSE-ConnectionGUID: 4Dge+5AlSr6mEP3bsSiihA==
X-CSE-MsgGUID: 5doRqVmyReiUSF492WU/MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62479858"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="62479858"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 21:56:09 -0700
X-CSE-ConnectionGUID: heAC1iY1Sji6jGDpSIokxQ==
X-CSE-MsgGUID: 8pzGQOxCT0SzDg8+7aatEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147309085"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 21:56:08 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 21:56:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 21:56:08 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 21:56:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ri7TG1nHrBCRVWvyKu2g6Hf5lAya6PYAQUcZ3Guty3B30dy32kHoGmb2sba3He+GQ+rXI5W8fYihtN5bkJEd7JqtwrsxCnRckdCA+2DrBhVrOPNs8gz5c2tf5sL2YTmz/T04Agjmw06Qn0ce3JdT1PiL+ai4XxyIR789HZCsOBAYKK9eJNZdAPxz6mS4aDPs6PcfLeTIjGxeoiWGpE2Tr1Vhj4sehr2X24zAn6afybZ14ILIdjgAh+kID5D9/uG6J12P86cT8nUpyyjf9lqARrjGXDYAyHc5Hd6XbsHee2o/RO8YJWlXffbdDxFq3Ct2O7AWNdjuoUZ78HRJpPefrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pyESwskGw26uLfdztcZlxkzDnqyLmLBwBb+vqFnQd5A=;
 b=pM91ebvTyp1XHw+mdyuD/BVE038ZV21mXKlDja8pRXmWpEP7cMwiEWRQPWzsnoOnos9mPMU839OEj2ra1qsfgkP5CLibzR+1o5sj0QbiTL5gMpRZGH4p1lXwAt42h3ysQTygvfQ1yH0ws8eBdA/LEJ9R0/6I3xLixi4nD0JiZsUgYjHecd/hsgOJs5Nn3+IPhByG008PzoRmH/OukWOyEm+g3WG42lj3peTD/JaJGIfEqIs9v+s3UGQ2CnDqd0BHqugerF5276fuirb5xt5wO6Z9I/KBTot7BGZR6IVBDPoFOuSZKJq4hcADreIwTvWQyystnCGO1cctY+3nwEAYkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB6975.namprd11.prod.outlook.com (2603:10b6:510:224::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 04:55:51 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 04:55:51 +0000
Date: Thu, 12 Jun 2025 12:55:42 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Waiman Long <longman@redhat.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Andrew Morton
	<akpm@linux-foundation.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>, Waiman Long <longman@redhat.com>,
	<oliver.sang@intel.com>
Subject: Re: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer
 debug objects
Message-ID: <202506121115.b69b8c2-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250606031539.1004644-4-longman@redhat.com>
X-ClientProxiedBy: SI2PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:194::6) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: e1900af3-3b53-49fb-c4d5-08dda96d67e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T4EDlzA5esRvpeHQU//z2FWtYVwtC9pbmuyPiA0EfGpAtRL0CwlAQI6u3ICk?=
 =?us-ascii?Q?9aSRAxUu9rx7qjSCg1H4t6c7HG3L5wH5/W7VOgN3aLn2A84ZiG0Kh50Yazoe?=
 =?us-ascii?Q?SENJHNnoCIvld0v0J4dxYi4ncA6B2TJxGMQmWNNIlEgKw9IYV8mFrr2CWE0L?=
 =?us-ascii?Q?dY9rADbTNwYW1B4W3dn/wEFyskMt+SJYDMphIJWeXUjyumZlhmGOG3zMpn3r?=
 =?us-ascii?Q?CIv0C7Y2yp5Xi021xs3ncgg9p65dZ9hLq9+6eA09K9AJvbar8yxqiDuL6lwA?=
 =?us-ascii?Q?jyPOdpnD1WAhi2FCQW52Xx9g/7MQPJ3e3pncIXZfgP7LI5EOHPpB/n0c/eLg?=
 =?us-ascii?Q?u0xQVCqyBVXEhoWmKebowT7yaS53eEvjYnxkL4Ze1zJ9AV7uf+PFBxGDvZbR?=
 =?us-ascii?Q?47YjeODbtN/tVczkpYteUMDBZni2+37fH40jjBUh/Iys0MCVPGf5zuaU+ecA?=
 =?us-ascii?Q?waiwrg/IxJcv4f2v8gJcCoNS4P10KieSRjrnlEVQZnhKnHyR16ysc/qeekjr?=
 =?us-ascii?Q?k834Cx01vCsF5BLlvf+Bmy6s5+KhKM25dBfSFdsd1hIsDvlW59PoaEC52FPV?=
 =?us-ascii?Q?W27+FlDk/x+BJUAQYGFDVCfWeGkLWRl1zVK6v+MewQ6DISI2YphnET4ta+/m?=
 =?us-ascii?Q?2woxF1oSBHOOdYlA53gMnboBdgqAq8Cwn80/un484sHyqJhmiafrNWqfVfpl?=
 =?us-ascii?Q?p+5CsSQmr7z5dXbGYHygtANIzCmpi5Wo71cZXzYCtKA8+zVbyO4nVNyypE/J?=
 =?us-ascii?Q?Ze7uJAOExPXGzmu6gUTP6WCkrEwoFgeufKCrHIqG+XnMfYAtqWEp+7IRqD7n?=
 =?us-ascii?Q?S9BLCbiYNrqOCBiiLZ4LykRjG/3QX0hrSLOjEkIutlTbbdDSGiNIHRkPcgbQ?=
 =?us-ascii?Q?gS3LPNKhGDSmAdoXo+/bn0H/nnsozSM3CpYG5Q5DBCJ7mt6W2Y3+ulWEj9XE?=
 =?us-ascii?Q?1WBHKPV4ekr3ojeaDhFozlE09HSTzmZ7a4buIP0BPsbGuNKibX6cbluD0wul?=
 =?us-ascii?Q?2Hn5+QwK5QjdjeFuokS1zkOaQzjOg0T6OS4zvda1S22QLvHFGM4wHje4uxdP?=
 =?us-ascii?Q?15A+de/2UqEzhSphqwFKIrt28nrzCHwXcYgKX34K+ob6E+jU3ka8joNfdyQg?=
 =?us-ascii?Q?GiUjUuqbmze9kuB9fpJyVogUHNNk4toYVoQtpHMQTTiyThQVUjYRX8c3IKxk?=
 =?us-ascii?Q?Qmh0ZtwjylXI6SZar4HLvw5x8BQmrO8xLqGy5LrHnkB5P1MWv/J8TqNG5i0O?=
 =?us-ascii?Q?pBpMzZ1AG6iWSpgU8ND4wV0AatOVWlKfT45a40VhLvVGhIChk6EkedXkqMx/?=
 =?us-ascii?Q?kgMpzpRIH16vEKUpZWONSNyogN//3JsZdX0OBCDD3oXXPwIKZS78kYk3ZDGL?=
 =?us-ascii?Q?3BgQAbthVe7IIA1PdA8JHv0i530d?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5ieqd29rzuHHPpY+YeLFCJbJIDhK6ZS1tULg7dcy8mBS9x+qRDBPDUTrz8yt?=
 =?us-ascii?Q?mrV9W7CRhj9M7RrvJpRNpj6zIYu5n8uhw4bgsyfxQWMlfi7onvYksxczFXvL?=
 =?us-ascii?Q?mVwDI4htKsam8JANQJFN5AjULIp5EUMd8Cr/2beYGMhCde4o4ad9DOTjVOlT?=
 =?us-ascii?Q?qeWtkYMWI+0GGiEoGaLDgHGC66YQDEgaG0cuLdt5meBXRTdL81P2/mtDG/3z?=
 =?us-ascii?Q?lqr5ZTaTV3/h4puWqElBgQOiqWf6ttP6+GwSvX947RNcr7TPdSsSb9kgIbkI?=
 =?us-ascii?Q?Pxf7dz/bzq8BKirYffh07IPGIUc6P8MbpN7eWq7nKnQJHaZFO+P9og4kpdm4?=
 =?us-ascii?Q?q++8QA2hMaGsuXSPJH0RaSq5tbZgAARiX4bPpx4sls+21XXXUZuND9qicoaE?=
 =?us-ascii?Q?Z1ejvqBgIW9cJMliYtbLcV6/s3ZslMXSAm0fAw9V7bJPs/5TqjasGfkm7vJ6?=
 =?us-ascii?Q?ATiDdqey891un0jovDA3kiAQY/Z/BgIYMwz3oQ0ICywR4HlJlKffkTOglEWW?=
 =?us-ascii?Q?pXgT9E7boNlYuy5DebgTK05KWPYGs0Zyco9CHE9xRcn4NBHLi6k8KqqoV1R9?=
 =?us-ascii?Q?X4FsGgm2U1IBUCYQL3C0xIp6x+X+k2rpbyr4jeZKMpRtM9bTE2HGUk5d/fVu?=
 =?us-ascii?Q?UP9PXQGYQNr0LBTzxB2eTQ/Mb37WMOq2q6jeWVf1YcNsguGF4qRPl7sT2i1p?=
 =?us-ascii?Q?X+m9DaOjQLB+I1CBGxStoj5c1hD9ydkyuXFtZek6GIM92PCCXVLCCoLv1Mpt?=
 =?us-ascii?Q?7vULmdS0YROFCRw9hukNI1YddGY5CVfT8XmJNJHLc4q3Gp7BmZqBpfDz1gSk?=
 =?us-ascii?Q?zqDIhyqg2zKPox89YAVVOoqoV+32Hxi9RB3+WPx8ocHJ9Vrsf5dvCskg87lH?=
 =?us-ascii?Q?y16WJ8GgBKNOIJ8ljE7GpHryOscd5zQCugCWHSbwkMJvfcJQxzAjHsb6df8J?=
 =?us-ascii?Q?sCVnsHfP+SCxxb7INBaCJTGgYVYU+w4CoeUFKLp8oq0mVQVB9su7IavDOSW/?=
 =?us-ascii?Q?jgajVRBEiPPPVCeQK9m1kiEq2VpvhcA0hEFQMkVnw0D2VIia+VFQ7ddo3ctK?=
 =?us-ascii?Q?EBOhziXvEmFsCWyqml3OvaKZh2u5TMQY8X2LDLT3KD8qYZsg3k/SB9LTJvqB?=
 =?us-ascii?Q?0StqPpy2O1nStA80XMox/nWwBKNgR8C3isC3Ghi/ULbt2nN7PopTgLPKno/Y?=
 =?us-ascii?Q?acOpVu2BmdfDcOtdW+pDJBqKRkwnVcrabM4thtZabOvIniXeAlzs6DnZzoSK?=
 =?us-ascii?Q?1oWh9sTbUJYWIjS+ErQfum8+OlgWT3cBBeTmAx9x43ltKY7C1TsABKEu36SM?=
 =?us-ascii?Q?OzzQ0gqLQ2nn8/NJtJTBWpchhBscZeWK4hh6iXy2agOMAgKm43bPRTdp0IgW?=
 =?us-ascii?Q?wHdFNlEdkUnQpcssbC4ozTA3DirWJIjAyru0wm3FyrkHvHReHkpVa2ByaMXX?=
 =?us-ascii?Q?CDlauWqz2IVdbXODYtc5o52gl0EBn1xH56MAyXQXRazFHZ7Q5nluObW67We9?=
 =?us-ascii?Q?dHVsslX0G1H52Yl1UWHzZbm7rvskERHNj46KRN8hR424/FsMsmvzprq666/k?=
 =?us-ascii?Q?GjmJnG3vM/i5l67d8gsZfXUul2LcJL+SBJq3Y3Lb5P0gYStllvvX1OV71P8f?=
 =?us-ascii?Q?yQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e1900af3-3b53-49fb-c4d5-08dda96d67e1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 04:55:51.7199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/uxa6hNE8VvnSwF6CuLm6NPG+hGexwHCGzOtylLcM4a4tDtJCWvn59F+90MGwLKEW6Bp+Jg87G3rPh3dQHaCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6975
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:possible_circular_locking_dependency_detected" on:

commit: 89fd87e046372ce70f8146357324cacd365369fe ("[PATCH v2 3/3] timers: Disable memory pre-allocation of timer debug objects")
url: https://github.com/intel-lab-lkp/linux/commits/Waiman-Long/debugobjects-Add-ODEBUG_FLAG_NO_ALLOC-to-disable-memory-allocation/20250606-111718
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git 6c58d2791d6046727d87db50a5e46644f195dcf9
patch link: https://lore.kernel.org/all/20250606031539.1004644-4-longman@redhat.com/
patch subject: [PATCH v2 3/3] timers: Disable memory pre-allocation of timer debug objects

in testcase: boot

config: x86_64-randconfig-003-20250608
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


we observe the issue does not always happen, 21 times out of 100 runs as below.
the parent keeps clean.


fc7e5b596de17969 89fd87e046372ce70f814635732
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :100         21%          21:100   dmesg.WARNING:possible_circular_locking_dependency_detected
           :100         21%          21:100   dmesg.WARNING:possible_circular_locking_dependency_detected_systemd_is_trying_to_acquire_lock:at:__pm_runtime_resume_but_task_is_already_holding_lock:at:uart_write



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506121115.b69b8c2-lkp@intel.com


[   92.544844][    T1] WARNING: possible circular locking dependency detected
[   92.545407][    T1] 6.15.0-rc1-00010-g89fd87e04637 #1 Tainted: G                T
[   92.546120][    T1] ------------------------------------------------------
[   92.546721][    T1] systemd/1 is trying to acquire lock:
[ 92.547161][ T1] ffff888118c93968 (&dev->power.lock){-...}-{3:3}, at: __pm_runtime_resume (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/power/runtime.c:1180) 
[   92.548064][    T1]
[   92.548064][    T1] but task is already holding lock:
[ 92.548680][ T1] ffffffff8806faf8 (&port_lock_key){....}-{3:3}, at: uart_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:638 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:672 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:716 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_core.c:626) 
[   92.549493][    T1]
[   92.549493][    T1] which lock already depends on the new lock.
[   92.549493][    T1]
[   92.550293][    T1]
[   92.550293][    T1] the existing dependency chain (in reverse order) is:
[   92.551049][    T1]
[   92.551049][    T1] -> #4 (&port_lock_key){....}-{3:3}:
[ 92.551674][ T1] __lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5235) 
[ 92.552145][ T1] lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5868) 
[ 92.552621][ T1] _raw_spin_lock_irqsave (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/spinlock_api_smp.h:111 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/spinlock.c:162) 
[ 92.553094][ T1] serial8250_console_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:638 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:672 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:716 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_port.c:3415) 
[ 92.553560][ T1] univ8250_console_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_core.c:396) 
[ 92.554015][ T1] console_emit_next_record (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3055 (discriminator 3) kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3139 (discriminator 3)) 
[ 92.554517][ T1] console_flush_all (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3227) 
[ 92.555013][ T1] console_unlock (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3286 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3325) 
[ 92.555431][ T1] vprintk_emit (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2450) 
[ 92.555844][ T1] vprintk_default (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2465) 
[ 92.556277][ T1] vprintk (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk_safe.c:82) 
[ 92.556641][ T1] _printk (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2475) 
[ 92.557085][ T1] register_console (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:4126) 
[ 92.557584][ T1] univ8250_console_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_core.c:514) 
[ 92.558034][ T1] console_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:4323) 
[ 92.558479][ T1] start_kernel (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1035 (discriminator 3)) 
[ 92.558928][ T1] x86_64_start_reservations (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/head64.c:501) 
[ 92.559398][ T1] x86_64_start_kernel (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/head64.c:443 (discriminator 17)) 
[ 92.559835][ T1] common_startup_64 (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/head_64.S:419) 
[   92.560249][    T1]
[   92.560249][    T1] -> #3 (console_owner){....}-{0:0}:
[ 92.560869][ T1] __lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5235) 
[ 92.561272][ T1] lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5868) 
[ 92.561827][ T1] console_lock_spinning_enable (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:1924) 
[ 92.562373][ T1] console_emit_next_record (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3050 (discriminator 3) kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3137 (discriminator 3)) 
[ 92.562932][ T1] console_flush_all (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3227) 
[ 92.563398][ T1] console_unlock (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3286 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:3325) 
[ 92.563806][ T1] vprintk_emit (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2450) 
[ 92.564198][ T1] vprintk_default (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2465) 
[ 92.564592][ T1] vprintk (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk_safe.c:82) 
[ 92.564990][ T1] _printk (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/printk/printk.c:2475) 
[ 92.565340][ T1] lookup_object_or_alloc (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:700) 
[ 92.565838][ T1] __debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:750) 
[ 92.566274][ T1] debug_object_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:785) 
[ 92.566777][ T1] init_timer_key (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/include/asm/jump_label.h:36 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/trace/events/timer.h:33 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/time/timer.c:838 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/time/timer.c:881) 
[ 92.567230][ T1] o2net_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/tcp.c:2128 (discriminator 3)) 
[ 92.567629][ T1] init_o2nm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/ocfs2/cluster/nodemanager.c:832) 
[ 92.568023][ T1] do_one_initcall (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1257) 
[ 92.568441][ T1] do_initcalls (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1318 kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1335) 
[ 92.568835][ T1] kernel_init_freeable (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1569) 
[ 92.569283][ T1] kernel_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1459) 
[ 92.569690][ T1] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/process.c:159) 
[ 92.570193][ T1] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/entry/entry_64.S:255) 
[   92.570619][    T1]
[   92.570619][    T1] -> #2 (&obj_hash[i].lock){-.-.}-{2:2}:
[ 92.571302][ T1] __lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5235) 
[ 92.571722][ T1] lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5868) 
[ 92.572151][ T1] _raw_spin_lock_irqsave (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/spinlock_api_smp.h:111 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/spinlock.c:162) 
[ 92.572704][ T1] debug_object_assert_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/lib/debugobjects.c:1014) 
[ 92.573200][ T1] __mod_timer (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/time/timer.c:1033) 
[ 92.573613][ T1] mod_timer (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/time/timer.c:1196) 
[ 92.573983][ T1] worker_enter_idle (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:1053) 
[ 92.574452][ T1] create_worker (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:2833) 
[ 92.574850][ T1] worker_thread (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:3063 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:3115 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:3375) 
[ 92.575278][ T1] kthread (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/kthread.c:464) 
[ 92.575652][ T1] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/process.c:159) 
[ 92.576118][ T1] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/entry/entry_64.S:255) 
[   92.576589][    T1]
[   92.576589][    T1] -> #1 (&pool->lock){-.-.}-{2:2}:
[ 92.577245][ T1] __lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5235) 
[ 92.577686][ T1] lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5868) 
[ 92.578132][ T1] _raw_spin_lock (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/spinlock_api_smp.h:134 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/spinlock.c:154) 
[ 92.578524][ T1] __queue_work (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:2311) 
[ 92.578929][ T1] queue_work_on (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/workqueue.c:2393) 
[ 92.579474][ T1] rpm_suspend (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/workqueue.h:662 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/power/runtime.c:673) 
[ 92.579939][ T1] rpm_idle (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/power/runtime.c:547 (discriminator 1)) 
[ 92.580379][ T1] __pm_runtime_idle (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/spinlock.h:406 (discriminator 5) kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/power/runtime.c:1113 (discriminator 5)) 
[ 92.580896][ T1] __device_attach (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/device.h:937 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:1051) 
[ 92.581512][ T1] device_initial_probe (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:1079) 
[ 92.581983][ T1] bus_probe_device (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/bus.c:537) 
[ 92.582481][ T1] device_add (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/core.c:3673) 
[ 92.582934][ T1] serial_base_port_add (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_base_bus.c:179) 
[ 92.583403][ T1] serial_core_register_port (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_core.c:3342 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_core.c:3381) 
[ 92.583950][ T1] serial_ctrl_register_port (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_ctrl.c:41) 
[ 92.584518][ T1] uart_add_one_port (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_port.c:143) 
[ 92.585031][ T1] serial8250_register_8250_port (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_core.c:822) 
[ 92.585578][ T1] serial_pnp_probe (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_pnp.c:480) 
[ 92.586119][ T1] pnp_device_probe (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/pnp/driver.c:111) 
[ 92.586574][ T1] really_probe (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:579 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:658) 
[ 92.586973][ T1] __driver_probe_device (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:800) 
[ 92.587468][ T1] driver_probe_device (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:830) 
[ 92.587949][ T1] __driver_attach (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:1217) 
[ 92.588438][ T1] bus_for_each_dev (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/bus.c:370) 
[ 92.588872][ T1] driver_attach (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/dd.c:1234) 
[ 92.589342][ T1] bus_add_driver (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/bus.c:678) 
[ 92.589759][ T1] driver_register (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/driver.c:249) 
[ 92.590215][ T1] pnp_register_driver (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/pnp/driver.c:280) 
[ 92.590609][ T1] serial8250_pnp_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_pnp.c:530) 
[ 92.591096][ T1] serial8250_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/8250/8250_platform.c:315) 
[ 92.591488][ T1] do_one_initcall (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1257) 
[ 92.591939][ T1] do_initcalls (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1318 kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1335) 
[ 92.592334][ T1] kernel_init_freeable (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1569) 
[ 92.592879][ T1] kernel_init (kbuild/obj/consumer/x86_64-randconfig-003-20250608/init/main.c:1459) 
[ 92.593289][ T1] ret_from_fork (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/kernel/process.c:159) 
[ 92.593701][ T1] ret_from_fork_asm (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/entry/entry_64.S:255) 
[   92.594139][    T1]
[   92.594139][    T1] -> #0 (&dev->power.lock){-...}-{3:3}:
[ 92.594791][ T1] check_prev_add (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:3167) 
[ 92.595300][ T1] validate_chain (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:3286 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:3909) 
[ 92.595732][ T1] __lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5235) 
[ 92.596198][ T1] lock_acquire (kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:472 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/lockdep.c:5868) 
[ 92.596626][ T1] _raw_spin_lock_irqsave (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/spinlock_api_smp.h:111 kbuild/obj/consumer/x86_64-randconfig-003-20250608/kernel/locking/spinlock.c:162) 
[ 92.597149][ T1] __pm_runtime_resume (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/base/power/runtime.c:1180) 
[ 92.597624][ T1] __uart_start (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/pm_runtime.h:414 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_core.c:148) 
[ 92.598037][ T1] uart_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:638 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:682 kbuild/obj/consumer/x86_64-randconfig-003-20250608/include/linux/serial_core.h:785 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/serial/serial_core.c:636) 
[ 92.598483][ T1] process_output_block (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/n_tty.c:561) 
[ 92.598979][ T1] n_tty_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/n_tty.c:2377) 
[ 92.599384][ T1] iterate_tty_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/tty_io.c:1015) 
[ 92.599892][ T1] file_tty_write+0x13f/0x240 
[ 92.600397][ T1] redirected_tty_write (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/tty_io.c:1111 kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/tty_io.c:1134) 
[ 92.600918][ T1] do_iter_readv_writev (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:825) 
[ 92.601380][ T1] vfs_writev (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:1055) 
[ 92.601825][ T1] do_writev (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:1101) 
[ 92.602226][ T1] __ia32_sys_writev (kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:1169 kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:1166 kbuild/obj/consumer/x86_64-randconfig-003-20250608/fs/read_write.c:1166) 
[ 92.602662][ T1] ia32_sys_call (kbuild/obj/consumer/x86_64-randconfig-003-20250608/./arch/x86/include/generated/asm/syscalls_32.h:147) 
[ 92.603141][ T1] do_int80_emulation (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/entry/syscall_32.c:83 kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/entry/syscall_32.c:172) 
[ 92.603655][ T1] asm_int80_emulation (kbuild/obj/consumer/x86_64-randconfig-003-20250608/arch/x86/include/asm/idtentry.h:626) 
[   92.604247][    T1]
[   92.604247][    T1] other info that might help us debug this:
[   92.604247][    T1]
[   92.605052][    T1] Chain exists of:
[   92.605052][    T1]   &dev->power.lock --> console_owner --> &port_lock_key
[   92.605052][    T1]
[   92.606202][    T1]  Possible unsafe locking scenario:
[   92.606202][    T1]
[   92.606763][    T1]        CPU0                    CPU1
[   92.607130][    T1]        ----                    ----
[   92.607543][    T1]   lock(&port_lock_key);
[   92.607947][    T1]                                lock(console_owner);
[   92.608624][    T1]                                lock(&port_lock_key);
[   92.609191][    T1]   lock(&dev->power.lock);
[   92.609615][    T1]
[   92.609615][    T1]  *** DEADLOCK ***
[   92.609615][    T1]
[   92.610237][    T1] 5 locks held by systemd/1:
[ 92.610655][ T1] #0: ffff8881193a3bb8 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read (kbuild/obj/consumer/x86_64-randconfig-003-20250608/drivers/tty/tty_ldsem.c:340) 


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250612/202506121115.b69b8c2-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

