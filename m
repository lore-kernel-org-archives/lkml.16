Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEE1FDA
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223159; cv=fail; b=KW/SQv5augVMe4t70J+FyP4ZiJmW3wHZxFO+aygpZLtC3ggEyB1/OrhRPxA+5ln6lVEnL38nx7u7NuCNlMwh6ED7cQgkSkIbbqJud/oHkGCLrQ6E0+7dCP7tBBEnYCpzjJ55sd51kOvK76EhfmTsS0/eHxLlr3ZdbMiTJai78Mg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223159; c=relaxed/simple;
	bh=vBDeUJWtmJnBARInySV9+JcxlCeJ1Rxbm8N0T1lbF/E=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=sVpT5B8KgWGwHTYl44mnFbRviaRkxUaHLXVuzafkWRde4DFuC9HL7gKwVmgGLLEn2ghtccYkrbA3XOHj4qeCBw4yxEdtbSgruDe+J5tV+Vak8L0Z0h+muPyMtqPFS2Kg6btUBNEAo5rblZhxoQ277Wbml4eUS8y12fqi78je4d0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nT0Zntzc; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nT0Zntzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745223158; x=1776759158;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBDeUJWtmJnBARInySV9+JcxlCeJ1Rxbm8N0T1lbF/E=;
  b=nT0ZntzcpH7o+ifX76/QMNrkOkSDKxZgKxL0GOgPNKDsthLgf0eT1U9M
   SUvuAk+nT9ef80O05PEgZWMHVMfzPNTL3BTdz9gMlePHmMdLCjjZDM6/u
   249VkR/w4MUcTBpwG2ia8AWqwK/YeDEVlgHjRFAklbvEssbtMNTpuLTcv
   OrJw3uHJsR5FwVNpno2kHHqMJ/XaqfZejxCA8+K+rvKFaZCJgeaE1zSuS
   9PEQp65cxzBjdTHYvYD0b3/iDGeYL1nBzbRUI2cviSHe9nNFznYM4hvWe
   bOY2Qoa21GUB7D+dPS93v7rsMGixNCQzvKdcIUc4Mxohjged7uut+8QqH
   A==;
X-CSE-ConnectionGUID: I8SXgIZCTIWujX0i5jmx9A==
X-CSE-MsgGUID: 0kLjEGOFTHujZxzGS0Be3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="49416220"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="49416220"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:12:29 -0700
X-CSE-ConnectionGUID: 6myHPuF8Sx660hKdv5hVxQ==
X-CSE-MsgGUID: vSUEs/LtTt66PjHVO3Z4Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="154829216"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 01:12:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 21 Apr 2025 01:12:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 21 Apr 2025 01:12:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 21 Apr 2025 01:12:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPF8LHpQiHQ8zOLZfmMExr9cKALyZyLJoe1NohY7NozhnMF/seosfYAuVAzX28+LCDpK0y6csB0L1cTFAnuHAaCWBLSa9leM/4KY82S2v26hm7gIzXvUarsH2JOomFLk47/I4Z9/A0ZQw0qRcGpVhT7kmMFaO73Ls4j2AMLC0mQTp95D3yTSThW0pHyPQwALUerApS/f1X34BgrrCtrdVUS7MWxvroJb1Cxd17hXO46b16xM8R8TYZTyFz2qfIkzbs67kGJXfkvrQdfe4ysfOmN6UHxj95iu9B9XUqGzTQVBUVlNUJJd/tZON/x6BNwV6z0v/VulMxnuefDBp6htSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YgbHBl0SbsNdGNX/wmuzCevYGYJfd4YNeDuzSDwd6t0=;
 b=vL6M6nxCT3gcA2qJWvMu9b/lTP5e16DkgjvYHds/iBlTatBzluWYsnV2Ih0cDC8m+C26TXisYA1j6g53/0i2GfkkfTosw6J7J2oi5toNHivpVf6QDK4pUZi5x9HcZUH5ly91ET0IYJIgGV9lQHr2UA4PVy9lUwtwdBZBX7rKGYAB2k6xY0Fw3DMRIQyt/YIllqeojWSEHZoFnR8a9HKGCQDxnH2M5K0yHLeBrtQIFZZHnzDTm1hAq1xX4lkdqJmTurluOcFuRM/kWdqnfvwWdHZOcoV0pAsswTizpHhJ3E4VS49mmlq2epqLSZ7am4mfLm2jLYvMff0IvE0bwrQE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 08:12:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:12:21 +0000
Date: Mon, 21 Apr 2025 16:12:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Linus Torvalds
	<torvalds@linux-foundation.org>, <oliver.sang@intel.com>
Subject: [linus:master] [x86/cpu]  f388f60ca9:
 BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
Message-ID: <202504211553.3ba9400-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU0P306CA0077.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:2b::6) To SJ2PR11MB8587.namprd11.prod.outlook.com
 (2603:10b6:a03:568::21)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: ac75d968-4824-451a-1806-08dd80ac3c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hQdFNJHoyizdrkddosfvPzInY53ClkH+yps2WMVtLGKRVm+6c/YJqr6BSbz3?=
 =?us-ascii?Q?jm00Tj+g5BbdSh0ebHJKljLVjIZXraQM0thKeqDjX/7E7EV3QWNpW3/6q7Op?=
 =?us-ascii?Q?t3MCkgbIi6O3QYa0nS4FxIMZjmSn29H9KnvOh2DiACGKq/wJ2E76bsmxgHl7?=
 =?us-ascii?Q?uTJBnS2wMx6A5fUcLyNciKihD3xFW6qX6bJrrDxv86AM80FNNiO8feFLT4N2?=
 =?us-ascii?Q?xKegXLrOvSCtoLTstrzGHWZdqqwNcFvixtVoqKHbK14F0RJlgDe3SU9VQyBq?=
 =?us-ascii?Q?+jg+TuCyjk4M3i+3IeA0udbkI3DrXQ7cTmXiQ63K8dkLtBs87nJzGlEwLZBx?=
 =?us-ascii?Q?hYcgRT54igh0TVaU61mOOfL06PYSaOD1vEBlUeobyXgsOE4TtHoEhutBrquL?=
 =?us-ascii?Q?OJUXDRxtA//nCfbZBRTbt9dxNzsCj+1mbgit12xo5P6DE0Eb5v8Z2wzZBlwd?=
 =?us-ascii?Q?891uYJb4EA7GFCMZlVLlXhhYkR4vEZMPu35knWJYMjE2rYCJ8W68rJymznCg?=
 =?us-ascii?Q?9/yJttV2wiBm63njC3pbHlvc97k2mtBczErYrAa86YLyScORGrTL7UjqpMOz?=
 =?us-ascii?Q?A+Z9K24iCGONLe7TjvCWvP8LYyffiO0+CjVNmoiNUnpCbgGa9E4Y7uleLmcb?=
 =?us-ascii?Q?J0UEnf8itcZI64JaC6DU1b8Ra7LJVFhNAKIlamKBPiywq4M7bc0059TPLDCv?=
 =?us-ascii?Q?HQ8+zxAvfMEkx98NuUrPuqonRbnOWoteySTKRgXfG7LK9OAO3VLtFkZBmYbS?=
 =?us-ascii?Q?UMT7DYwO4bYYoILZm2NrhwwlXGYEG9rdNutfIcMLkCAtNyW63xtOEzeh3T9f?=
 =?us-ascii?Q?rju0CZ1nLJuknmHkKq/wBejsMZLujRW9EtnsX+zLZyD8IqQhrUvjgfAFQ2Fr?=
 =?us-ascii?Q?kdeQ5sl6pU51XR3xPrcpqxWFrNWM6XIMTsfejUU38jeMFfuKd96lwIvTHCQy?=
 =?us-ascii?Q?WnZvd1lR5+WVHFeHUiXrrkSdaKQSkUsvuWoFHg9QBpQ51P/0Pn7GTlYRS3w5?=
 =?us-ascii?Q?4sh6rhu1NiLv07zf98Q7AVZgzkS35ZhTm20qzUgMxiPX1zJVHWKbBwZIqxDQ?=
 =?us-ascii?Q?is39dCZ8epxSe1jXRlofXSsmnqt46FeBc7R+zcSvZXClHWuZNaLBY9QZEE7n?=
 =?us-ascii?Q?rFuZ3G2JgapY7YCb9lXLPsM/Y6yk9p+b6v+rJS4cC98SaNKxqwwy8umE4s7/?=
 =?us-ascii?Q?pg5WwT5TLvQLPM7lkFCoyx6X6qIFuxhrO9SPz/w49TubBrlvXCOpUn1hGkjD?=
 =?us-ascii?Q?8mweu518yf2r3FFABc3uSkwFbpcFrpX4dEy3rc/MBwM+o32LLD9A9yG9wjHT?=
 =?us-ascii?Q?lM973Dmf7c3JWSchNewkLtroKopCRzo+ogoQW/JqSkZC4Ol82K54M1/iXEAL?=
 =?us-ascii?Q?zabRRRbGLwOgjQjarosew9Mgbwbu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PKLpfpuyVARU/NJfNBUvWq472I5pyKMergyvUv0j7Geu0UDaUz5eMIMLpwNI?=
 =?us-ascii?Q?hl26Dxas7GODp13O7dQLt9lHJKHGb5v+Yl6qAq2vPJWvJ5I0+3JXfMGxmTkW?=
 =?us-ascii?Q?lxOf06bicxHQOZynFfJ78vEa4psxq3dKXCk62FCUnFLNdfGYv2sMPukZ4eGF?=
 =?us-ascii?Q?ao87VBEOCvhk4phrhQN/nMEpyzAv7dwUu9ah93UL9ELhLJ9EOIYGZPql0x4S?=
 =?us-ascii?Q?SEeSVvizeEItqydYKZxVsP+i5hfzkl1i4KfBORbJmWiwboS0FF4ExmcBKQUa?=
 =?us-ascii?Q?QJSYQLwwJUdoS6eXa+2NJAkAhXgbzdlVBNc69bwWDmnbUfToWd60WAPiq2k5?=
 =?us-ascii?Q?1K/KhpJQOfGhJfZQ3/VJyCuxF2MTpn+DSCVdwKW4IhTfmtyqalVsMlHlGvky?=
 =?us-ascii?Q?PEn1xY0SPiH8+fqJJljDJQRrqdozQgKbTYxL75WEJsin/tO9PsytUUc9UPAC?=
 =?us-ascii?Q?wwr3MvwtIvadkNJ5IYo4QJtnXc2SKhFoXDT/sge/sIM3C4VUjZES/p2hQMgZ?=
 =?us-ascii?Q?TgO0JwL85SobKFr7cJKmJ2nqUMbG8LtJeoTITH6SB3v6MyJtCKnFFb1aOb3Y?=
 =?us-ascii?Q?/xN3JB56xw+QCyCd+pMFuMypKHqDJ6yFnIA2Ll8L5Ni82qm3CkHZ1YbnBY7T?=
 =?us-ascii?Q?gx7ocq6mraeF5Qa+/7VGEYrQtM7R3CcB7odBL6YnWvBxAe55gn60pMqRrPZb?=
 =?us-ascii?Q?f3hrGB31RA8WSrZ/OiLjLYsy/r+8ew1Y6VJss+Qw0RYYoXy/Olyj6CPyB/Wt?=
 =?us-ascii?Q?OUVl/yBpyTJeExRzhiObsiAilVM+8SMa9R0L5H6IdDIR7MN8OdvTfBvyWTh+?=
 =?us-ascii?Q?qGNFr6tyT+F93US+XOK2+oxHFz/sB3gRkxboELXXnzp+aI/VucCDeLet+eai?=
 =?us-ascii?Q?8YLbxfhLaRfLvU5vtSd2Qo8oSCWMzeHYMI/ejbhnQuewaShScjYmv0BTKe6A?=
 =?us-ascii?Q?L0skk1tS9ITyGzVsI+Hy/l1Pzy09u8VVI3CvGSiK52rv9s4nzmaXwMt/SKRs?=
 =?us-ascii?Q?nBP7Hq4qd2xC4l3a2oYYqsxxCVYUV0B2QqXItrsR78jsURQp/BfHWP3Xcyw2?=
 =?us-ascii?Q?W+G81gI4vJQe14nQTYjvNlVpBI5KBd5asg3rtOMZSkbRgiWLacALdQFzKBw8?=
 =?us-ascii?Q?gDJBPiJ+Z6NeRuVqIV05kQYsFcTJjBjNU3tfpKSTFxwjUFW2+t9pbaByG3Bw?=
 =?us-ascii?Q?OIZ1zaG/HbzlEuwoygsaz4xD3Cy00/4aTa2jLAw1jhsFIj5vdlsnnkAofGHD?=
 =?us-ascii?Q?auZ9RVIL8Tg83XkPrXeodTQ5g28H6xZL1MhbjIbbYDMOzXAWAykj4dPFHbsR?=
 =?us-ascii?Q?ULauKPhyEgqu1bPYtfcmlI6xZ8hG2QMO7sNvrFXRBK2pIo3uQb7bZVOBPgWy?=
 =?us-ascii?Q?WA2BKwiBIen1PmlzUKugtesq7QEifLzPlWB6Ct1/UcEl2uQ+DsxA6nurdY1k?=
 =?us-ascii?Q?igslg5jZTRmesUislanD0P6elQvJ2GBu70QRIaoOFy3LK5tLQLL6z2wLAH9A?=
 =?us-ascii?Q?zSROpSNT/pqwDuoHB6o6ZgnksrEDeomJeh3gaJwRdrqZKQjTOPa9di1UM4lL?=
 =?us-ascii?Q?t2dye8UtvkeutItKzsgfI0jtpeANEBpEo5aGzCK63VOkH77KfsqRSZKx8C2Q?=
 =?us-ascii?Q?kw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac75d968-4824-451a-1806-08dd80ac3c53
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8587.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:12:21.2886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CY4SwTn6Bozp21iBQyDXcvsIegC6XxRDfdHGJvuGHbDNuE/e45HB8YiTA32duEitSjoy3047BTiUTsg+X98iaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-OriginatorOrg: intel.com



Hello,


by this commit, we notice big config diff [1]

then in this rcutorture tests, parent runs quite clean, f388f60ca9 shows
various random issues.

=========================================================================================
tbox_group/testcase/rootfs/kconfig/compiler/runtime/test/torture_type:
  vm-snb/rcutorture/debian-11.1-i386-20220923.cgz/i386-randconfig-r071-20250410/gcc-12/300s/default/tasks-tracing

fc2d5cbe541032e7 f388f60ca9041a95c9b3f157d31
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
           :500         30%         149:500   last_state.booting
           :500          7%          35:500   dmesg.BUG:kernel_hang_in_boot_stage
           :500          9%          45:500   dmesg.BUG:soft_lockup-CPU##stuck_for#s![swapper:#]
           :500         10%          51:500   dmesg.BUG:workqueue_lockup-pool
           :500          0%           1:500   dmesg.EIP:__timer_delete_sync
           :500          1%           5:500   dmesg.EIP:_raw_spin_unlock_irq
           :500          0%           2:500   dmesg.EIP:_raw_spin_unlock_irqrestore
           :500          0%           1:500   dmesg.EIP:console_emit_next_record
           :500          0%           1:500   dmesg.EIP:handle_softirqs
           :500          1%           3:500   dmesg.EIP:lock_acquire
           :500          0%           2:500   dmesg.EIP:lock_release
           :500          0%           1:500   dmesg.EIP:queue_delayed_work_on
           :500          9%          45:500   dmesg.EIP:timekeeping_notify
           :500          3%          14:500   dmesg.INFO:rcu_preempt_detected_stalls_on_CPUs/tasks
           :500          6%          32:500   dmesg.INFO:task_blocked_for_more_than#seconds
           :500          1%           3:500   dmesg.IP-Config:Auto-configuration_of_network_failed
           :500          9%          45:500   dmesg.Kernel_panic-not_syncing:softlockup:hung_tasks
           :500         29%         146:500   dmesg.boot_failures

we don't have enough knowledge to dig deep these issues. so just make this
report to consult with you if these issues are related with config diff.
and if so, is this config diff reasonable by this commit?

below our normal report just FYI.


kernel test robot noticed "BUG:soft_lockup-CPU##stuck_for#s![swapper:#]" on:

commit: f388f60ca9041a95c9b3f157d316ed7c8f297e44 ("x86/cpu: Drop configuration options for early 64-bit CPUs")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      e618ee89561b6b0fdc69f79e6fd0c33375d3e6b4]
[test failed on linux-next/master 01c6df60d5d4ae00cd5c1648818744838bba7763]

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: tasks-tracing



config: i386-randconfig-r071-20250410
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202504211553.3ba9400-lkp@intel.com


[  721.016745][    C0] watchdog: BUG: soft lockup - CPU#0 stuck for 626s! [swapper:1]
[  721.016779][    C0] CPU#0 Utilization every 96s during lockup:
[  721.016779][    C0] 	#1:  39% system,	  0% softirq,	  0% hardirq,	  0% idle
[  721.016779][    C0] 	#2:  42% system,	  0% softirq,	  0% hardirq,	  0% idle
[  721.016779][    C0] 	#3:  47% system,	  0% softirq,	  0% hardirq,	  0% idle
[  721.016779][    C0] 	#4:  34% system,	  0% softirq,	  0% hardirq,	  0% idle
[  721.016779][    C0] 	#5:  32% system,	  0% softirq,	  0% hardirq,	  0% idle
[  721.016779][    C0] Modules linked in:
[  721.016779][    C0] irq event stamp: 159506
[ 721.016779][ C0] hardirqs last enabled at (159505): timekeeping_notify (arch/x86/include/asm/irqflags.h:42 arch/x86/include/asm/irqflags.h:97 arch/x86/include/asm/irqflags.h:155 include/linux/stop_machine.h:154 include/linux/stop_machine.h:161 kernel/time/timekeeping.c:1521) 
[ 721.016779][ C0] hardirqs last disabled at (159506): sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] softirqs last enabled at (159174): handle_softirqs (kernel/softirq.c:408 kernel/softirq.c:589) 
[ 721.016779][ C0] softirqs last disabled at (159159): __do_softirq (kernel/softirq.c:596) 
[  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Not tainted 6.14.0-rc3-00037-gf388f60ca904 #1
[  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 721.016779][ C0] EIP: timekeeping_notify (kernel/time/timekeeping.c:1522) 
[ 721.016779][ C0] Code: 5f e9 ff ff 8d 45 e8 e8 57 d4 ff ff 85 ff 74 16 8b 57 5c 85 d2 74 04 89 f8 ff d2 8b 87 88 00 00 00 e8 d5 3e ff ff 85 f6 75 9b <e8> 7f b9 00 00 31 c0 39 1d a4 70 14 84 0f 95 c0 f7 d8 8b 55 f0 2b
All code
========
   0:	5f                   	pop    %rdi
   1:	e9 ff ff 8d 45       	jmp    0x458e0005
   6:	e8 e8 57 d4 ff       	call   0xffffffffffd457f3
   b:	ff 85 ff 74 16 8b    	incl   -0x74e98b01(%rbp)
  11:	57                   	push   %rdi
  12:	5c                   	pop    %rsp
  13:	85 d2                	test   %edx,%edx
  15:	74 04                	je     0x1b
  17:	89 f8                	mov    %edi,%eax
  19:	ff d2                	call   *%rdx
  1b:	8b 87 88 00 00 00    	mov    0x88(%rdi),%eax
  21:	e8 d5 3e ff ff       	call   0xffffffffffff3efb
  26:	85 f6                	test   %esi,%esi
  28:	75 9b                	jne    0xffffffffffffffc5
  2a:*	e8 7f b9 00 00       	call   0xb9ae		<-- trapping instruction
  2f:	31 c0                	xor    %eax,%eax
  31:	39 1d a4 70 14 84    	cmp    %ebx,-0x7beb8f5c(%rip)        # 0xffffffff841470db
  37:	0f 95 c0             	setne  %al
  3a:	f7 d8                	neg    %eax
  3c:	8b 55 f0             	mov    -0x10(%rbp),%edx
  3f:	2b                   	.byte 0x2b

Code starting with the faulting instruction
===========================================
   0:	e8 7f b9 00 00       	call   0xb984
   5:	31 c0                	xor    %eax,%eax
   7:	39 1d a4 70 14 84    	cmp    %ebx,-0x7beb8f5c(%rip)        # 0xffffffff841470b1
   d:	0f 95 c0             	setne  %al
  10:	f7 d8                	neg    %eax
  12:	8b 55 f0             	mov    -0x10(%rbp),%edx
  15:	2b                   	.byte 0x2b
[  721.016779][    C0] EAX: 00026f11 EBX: 8316b7e0 ECX: 00000006 EDX: 7e26f13f
[  721.016779][    C0] ESI: 00000200 EDI: 835e7220 EBP: 86d15ed8 ESP: 86d15ec0
[  721.016779][    C0] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAGS: 00000206
[  721.016779][    C0] CR0: 80050033 CR2: ffdaa000 CR3: 03a16000 CR4: 000406d0
[  721.016779][    C0] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
[  721.016779][    C0] DR6: fffe0ff0 DR7: 00000400
[  721.016779][    C0] Call Trace:
[ 721.016779][ C0] ? show_regs (arch/x86/kernel/dumpstack.c:478) 
[ 721.016779][ C0] ? watchdog_timer_fn (kernel/watchdog.c:767) 
[ 721.016779][ C0] ? schedule_work (drivers/usb/core/hub.c:919) 
[ 721.016779][ C0] ? __hrtimer_run_queues+0x12f/0x1cf 
[ 721.016779][ C0] ? hrtimer_run_queues (kernel/time/hrtimer.c:2023) 
[ 721.016779][ C0] ? update_process_times (kernel/time/timer.c:2458 kernel/time/timer.c:2514) 
[ 721.016779][ C0] ? tick_periodic (kernel/time/tick-common.c:103) 
[ 721.016779][ C0] ? tick_handle_periodic (kernel/time/tick-common.c:144) 
[ 721.016779][ C0] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] ? __sysvec_apic_timer_interrupt (arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/kernel/apic/apic.c:1056) 
[ 721.016779][ C0] ? sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] ? handle_exception (arch/x86/entry/entry_32.S:1055) 
[ 721.016779][ C0] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] ? timekeeping_notify (kernel/time/timekeeping.c:1522) 
[ 721.016779][ C0] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] ? timekeeping_notify (kernel/time/timekeeping.c:1522) 
[ 721.016779][ C0] __clocksource_select (kernel/time/clocksource.c:1077 (discriminator 1)) 
[ 721.016779][ C0] ? boot_override_clock (kernel/time/clocksource.c:1109) 
[ 721.016779][ C0] clocksource_select (kernel/time/clocksource.c:1094) 
[ 721.016779][ C0] clocksource_done_booting (kernel/time/clocksource.c:1118) 
[ 721.016779][ C0] do_one_initcall (init/main.c:1257) 
[ 721.016779][ C0] ? rdinit_setup (init/main.c:1305) 
[ 721.016779][ C0] do_initcalls (init/main.c:1318 init/main.c:1335) 
[ 721.016779][ C0] ? rest_init (init/main.c:1449) 
[ 721.016779][ C0] kernel_init_freeable (init/main.c:1572) 
[ 721.016779][ C0] kernel_init (init/main.c:1459) 
[ 721.016779][ C0] ret_from_fork (arch/x86/kernel/process.c:154) 
[ 721.016779][ C0] ? rest_init (init/main.c:1449) 
[ 721.016779][ C0] ret_from_fork_asm (arch/x86/entry/entry_32.S:737) 
[ 721.016779][ C0] entry_INT80_32 (arch/x86/entry/entry_32.S:945) 
[  721.016779][    C0] Kernel panic - not syncing: softlockup: hung tasks
[  721.016779][    C0] CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G             L     6.14.0-rc3-00037-gf388f60ca904 #1
[  721.016779][    C0] Tainted: [L]=SOFTLOCKUP
[  721.016779][    C0] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[  721.016779][    C0] Call Trace:
[ 721.016779][ C0] dump_stack_lvl (lib/dump_stack.c:124) 
[ 721.016779][ C0] dump_stack (lib/dump_stack.c:130) 
[ 721.016779][ C0] panic (kernel/panic.c:258 kernel/panic.c:375) 
[ 721.016779][ C0] watchdog_timer_fn (kernel/watchdog.c:740) 
[ 721.016779][ C0] ? schedule_work (drivers/usb/core/hub.c:919) 
[ 721.016779][ C0] __hrtimer_run_queues+0x12f/0x1cf 
[ 721.016779][ C0] hrtimer_run_queues (kernel/time/hrtimer.c:2023) 
[ 721.016779][ C0] update_process_times (kernel/time/timer.c:2458 kernel/time/timer.c:2514) 
[ 721.016779][ C0] tick_periodic (kernel/time/tick-common.c:103) 
[ 721.016779][ C0] tick_handle_periodic (kernel/time/tick-common.c:144) 
[ 721.016779][ C0] ? vmware_sched_clock (arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] __sysvec_apic_timer_interrupt (arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/include/asm/trace/irq_vectors.h:41 arch/x86/kernel/apic/apic.c:1056) 
[ 721.016779][ C0] sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1049 arch/x86/kernel/apic/apic.c:1049) 
[ 721.016779][ C0] handle_exception (arch/x86/entry/entry_32.S:1055) 
[ 721.016779][ C0] EIP: timekeeping_notify (kernel/time/timekeeping.c:1522) 
[ 721.016779][ C0] Code: 5f e9 ff ff 8d 45 e8 e8 57 d4 ff ff 85 ff 74 16 8b 57 5c 85 d2 74 04 89 f8 ff d2 8b 87 88 00 00 00 e8 d5 3e ff ff 85 f6 75 9b <e8> 7f b9 00 00 31 c0 39 1d a4 70 14 84 0f 95 c0 f7 d8 8b 55 f0 2b
All code
========
   0:	5f                   	pop    %rdi
   1:	e9 ff ff 8d 45       	jmp    0x458e0005
   6:	e8 e8 57 d4 ff       	call   0xffffffffffd457f3
   b:	ff 85 ff 74 16 8b    	incl   -0x74e98b01(%rbp)
  11:	57                   	push   %rdi
  12:	5c                   	pop    %rsp
  13:	85 d2                	test   %edx,%edx
  15:	74 04                	je     0x1b
  17:	89 f8                	mov    %edi,%eax
  19:	ff d2                	call   *%rdx
  1b:	8b 87 88 00 00 00    	mov    0x88(%rdi),%eax
  21:	e8 d5 3e ff ff       	call   0xffffffffffff3efb
  26:	85 f6                	test   %esi,%esi
  28:	75 9b                	jne    0xffffffffffffffc5
  2a:*	e8 7f b9 00 00       	call   0xb9ae		<-- trapping instruction
  2f:	31 c0                	xor    %eax,%eax
  31:	39 1d a4 70 14 84    	cmp    %ebx,-0x7beb8f5c(%rip)        # 0xffffffff841470db
  37:	0f 95 c0             	setne  %al
  3a:	f7 d8                	neg    %eax
  3c:	8b 55 f0             	mov    -0x10(%rbp),%edx
  3f:	2b                   	.byte 0x2b

Code starting with the faulting instruction
===========================================
   0:	e8 7f b9 00 00       	call   0xb984
   5:	31 c0                	xor    %eax,%eax
   7:	39 1d a4 70 14 84    	cmp    %ebx,-0x7beb8f5c(%rip)        # 0xffffffff841470b1
   d:	0f 95 c0             	setne  %al
  10:	f7 d8                	neg    %eax
  12:	8b 55 f0             	mov    -0x10(%rbp),%edx
  15:	2b                   	.byte 0x2b


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250421/202504211553.3ba9400-lkp@intel.com



[1]
--- /pkg/linux/i386-randconfig-r071-20250410/gcc-12/fc2d5cbe541032e74a66599ba843803cebbfed0e/.config    2025-04-15 15:41:11.316836213 +0800
+++ /pkg/linux/i386-randconfig-r071-20250410/gcc-12/f388f60ca9041a95c9b3f157d316ed7c8f297e44/.config    2025-04-15 15:41:17.009901645 +0800
@@ -321,7 +321,7 @@ CONFIG_ARCH_CPUIDLE_HALTPOLL=y
 # CONFIG_PVH is not set
 # CONFIG_PARAVIRT_TIME_ACCOUNTING is not set
 CONFIG_PARAVIRT_CLOCK=y
-# CONFIG_M486SX is not set
+CONFIG_M486SX=y
 # CONFIG_M486 is not set
 # CONFIG_M586 is not set
 # CONFIG_M586TSC is not set
@@ -333,7 +333,6 @@ CONFIG_PARAVIRT_CLOCK=y
 # CONFIG_MPENTIUM4 is not set
 # CONFIG_MK6 is not set
 # CONFIG_MK7 is not set
-CONFIG_MK8=y
 # CONFIG_MCRUSOE is not set
 # CONFIG_MEFFICEON is not set
 # CONFIG_MWINCHIPC6 is not set
@@ -344,26 +343,24 @@ CONFIG_MK8=y
 # CONFIG_MCYRIXIII is not set
 # CONFIG_MVIAC3_2 is not set
 # CONFIG_MVIAC7 is not set
-# CONFIG_MCORE2 is not set
 # CONFIG_MATOM is not set
 CONFIG_X86_GENERIC=y
 CONFIG_X86_INTERNODE_CACHE_SHIFT=6
 CONFIG_X86_L1_CACHE_SHIFT=6
+CONFIG_X86_F00F_BUG=y
+CONFIG_X86_INVD_BUG=y
+CONFIG_X86_ALIGNMENT_16=y
 CONFIG_X86_INTEL_USERCOPY=y
-CONFIG_X86_USE_PPRO_CHECKSUM=y
-CONFIG_X86_TSC=y
-CONFIG_X86_HAVE_PAE=y
-CONFIG_X86_CMPXCHG64=y
-CONFIG_X86_CMOV=y
-CONFIG_X86_MINIMUM_CPU_FAMILY=6
-CONFIG_X86_DEBUGCTLMSR=y
+CONFIG_X86_MINIMUM_CPU_FAMILY=4
 CONFIG_IA32_FEAT_CTL=y
 CONFIG_X86_VMX_FEATURE_NAMES=y
 CONFIG_CPU_SUP_INTEL=y
+CONFIG_CPU_SUP_CYRIX_32=y
 CONFIG_CPU_SUP_AMD=y
 CONFIG_CPU_SUP_HYGON=y
 CONFIG_CPU_SUP_CENTAUR=y
 CONFIG_CPU_SUP_TRANSMETA_32=y
+CONFIG_CPU_SUP_UMC_32=y
 CONFIG_CPU_SUP_ZHAOXIN=y
 CONFIG_CPU_SUP_VORTEX_32=y
 CONFIG_HPET_TIMER=y
@@ -410,7 +407,6 @@ CONFIG_X86_MSR=y
 # CONFIG_X86_CPUID is not set
 # CONFIG_NOHIGHMEM is not set
 CONFIG_HIGHMEM4G=y
-# CONFIG_HIGHMEM64G is not set
 # CONFIG_VMSPLIT_3G is not set
 # CONFIG_VMSPLIT_3G_OPT is not set
 CONFIG_VMSPLIT_2G=y
@@ -418,7 +414,6 @@ CONFIG_VMSPLIT_2G=y
 # CONFIG_VMSPLIT_1G is not set
 CONFIG_PAGE_OFFSET=0x80000000
 CONFIG_HIGHMEM=y
-# CONFIG_X86_PAE is not set
 # CONFIG_X86_CPA_STATISTICS is not set
 CONFIG_ARCH_FLATMEM_ENABLE=y
 CONFIG_ARCH_SPARSEMEM_ENABLE=y
@@ -427,6 +422,7 @@ CONFIG_ILLEGAL_POINTER_VALUE=0
 # CONFIG_HIGHPTE is not set
 CONFIG_X86_CHECK_BIOS_CORRUPTION=y
 CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK=y
+# CONFIG_MATH_EMULATION is not set
 CONFIG_MTRR=y
 CONFIG_MTRR_SANITIZER=y
 CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=0
@@ -472,8 +468,8 @@ CONFIG_USE_X86_SEG_SUPPORT=y
 CONFIG_CC_HAS_SLS=y
 CONFIG_CC_HAS_RETURN_THUNK=y
 CONFIG_CC_HAS_ENTRY_PADDING=y
-CONFIG_FUNCTION_PADDING_CFI=0
-CONFIG_FUNCTION_PADDING_BYTES=4
+CONFIG_FUNCTION_PADDING_CFI=11
+CONFIG_FUNCTION_PADDING_BYTES=16
 CONFIG_CPU_MITIGATIONS=y
 # CONFIG_MITIGATION_RETPOLINE is not set
 # CONFIG_MITIGATION_GDS is not set
@@ -741,7 +737,8 @@ CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=y
 CONFIG_HAVE_GCC_PLUGINS=y
 # CONFIG_GCC_PLUGINS is not set
 CONFIG_FUNCTION_ALIGNMENT_4B=y
-CONFIG_FUNCTION_ALIGNMENT=4
+CONFIG_FUNCTION_ALIGNMENT_16B=y
+CONFIG_FUNCTION_ALIGNMENT=16
 # end of General architecture-dependent options

 CONFIG_RT_MUTEXES=y
@@ -1114,7 +1111,6 @@ CONFIG_NFC_SHDLC=y
 #
 # Near Field Communication (NFC) devices
 #
-# CONFIG_NFC_MEI_PHY is not set
 # CONFIG_NFC_SIM is not set
 # CONFIG_NFC_PORT100 is not set
 # CONFIG_NFC_PN544_I2C is not set
@@ -1607,9 +1603,7 @@ CONFIG_EEPROM_IDT_89HPESX=y
 # CONFIG_CB710_CORE is not set
 CONFIG_SENSORS_LIS3_I2C=y
 CONFIG_ALTERA_STAPL=y
-CONFIG_INTEL_MEI=y
-CONFIG_INTEL_MEI_ME=y
-# CONFIG_INTEL_MEI_TXE is not set
+# CONFIG_INTEL_MEI is not set
 # CONFIG_VMWARE_VMCI is not set
 CONFIG_ECHO=y
 # CONFIG_MISC_ALCOR_PCI is not set
@@ -3412,7 +3406,6 @@ CONFIG_TQMX86_WDT=y
 CONFIG_W83977F_WDT=y
 CONFIG_MACHZ_WDT=y
 CONFIG_SBC_EPX_C3_WATCHDOG=y
-# CONFIG_INTEL_MEI_WDT is not set
 CONFIG_NI903X_WDT=y
 # CONFIG_NIC7018_WDT is not set
 # CONFIG_MEN_A21_WDT is not set
@@ -5752,7 +5745,6 @@ CONFIG_GENERIC_NET_UTILS=y
 # CONFIG_PRIME_NUMBERS is not set
 CONFIG_RATIONAL=y
 CONFIG_GENERIC_IOMAP=y
-CONFIG_ARCH_USE_CMPXCHG_LOCKREF=y
 CONFIG_ARCH_HAS_FAST_MULTIPLIER=y
 CONFIG_ARCH_USE_SYM_ANNOTATIONS=y

@@ -6186,7 +6178,6 @@ CONFIG_SAMPLE_VFIO_MDEV_MDPY=y
 CONFIG_SAMPLE_VFIO_MDEV_MBOCHS=y
 CONFIG_SAMPLE_ANDROID_BINDERFS=y
 CONFIG_SAMPLE_VFS=y
-# CONFIG_SAMPLE_INTEL_MEI is not set
 # CONFIG_SAMPLE_TPS6594_PFSM is not set
 CONFIG_SAMPLE_WATCHDOG=y
 CONFIG_SAMPLE_WATCH_QUEUE=y



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

