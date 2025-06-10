Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE34685
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749539854; cv=fail; b=IDJRqliIO+wGvfB9LZsvVvcodLcZyDb7hX5WIinw0q7oGdj6g2xKm/CRUsLsZiFT8Hvrj7CYTfCXE+L2lSTy7X9jxIL1eq9Bwto+Ge6ySxyehIB/bs0p2/z2ITu1H8Aqcv4T9ABFsdHZsv3aYdBzr8JmtPckosXM1Ev9Wmvul1U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749539854; c=relaxed/simple;
	bh=c3QAPVX366HBUfuAt/Ifs1uVQs1zOuCombw9rt1Dxr8=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kGZjZTGUNzsB1ZOEa1+YBgFIIkevYO8lR+8ipf2ee3/kRz2VcNuJjEblT4ZjeHhZDyA3UXU1rt4ER5QGeGOzklzmdT9qRtHrusffNTvMlVKH01gPBVBSoJU5ot1L+ICk4aze6Y534En8JSXVh6UQEAK5tqWsAGJ6YiEwpKGLlCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccm1f+L9; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccm1f+L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749539853; x=1781075853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c3QAPVX366HBUfuAt/Ifs1uVQs1zOuCombw9rt1Dxr8=;
  b=ccm1f+L9/2HFaGKXCAangz1nlK7B3YaDSQW+X8KMNVUB3JVuDJFlcu4r
   eOapL0PluU8VEodRpfnPD3/Qe16VWiJ+Le9KOBX83WHdPiE5Tcaxr/j21
   e+St/H5giuPFbH2R9qUzl8JuBcySJ9XSMz/htyTl/sM0cOTsNWr8R1/UK
   DSjZqGoQ9mK/fR9HNxUCn20K5Wi2iDDiriRkHgYZqgKNs55yfEZejjfp1
   d8ocJ9i+SzA38XsvlqpJqifFA0BjVRFF8Adz98voXLfARRPx2/h0c3xXw
   v8P7ZjLL/1C1KzUsQNU7EoLl9iVbPiFZWmir4I9G8ll0Jz/IZXYXpkKwQ
   Q==;
X-CSE-ConnectionGUID: zl/LTghDRYKrmWBnT/+3Ww==
X-CSE-MsgGUID: BamWTucMSRG4ZNZerRTfFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50861551"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="50861551"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:17:32 -0700
X-CSE-ConnectionGUID: Pvlumst8RqSHibiTPylRRA==
X-CSE-MsgGUID: ExLrHD/PQ8iJP4cDW7wvdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="177686510"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 00:17:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 10 Jun 2025 00:17:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 10 Jun 2025 00:17:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.73) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 10 Jun 2025 00:17:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkbE+yEqWD3/ZxHeYbyqMEgitut/U1RY2GRzJE7s4nKD9fBfNV7U4FCUdb33iwrvQOk5tSwy9OplffjHnjvKZFFXnxsPP6oRpq64ubSauwms7etP3JzAHa3i8VKBh8ftstRi5PDyLUwMWI5AAENqJb3IAOEcEBqa3dkr7pqjpSVE+bi9mQySSxk3BBUJScY+Wzzu3XMXY8onQ85yX4yc2jpRdSviklc6FsD00osMkxez5+D4lGNx5WkWbSl/ok1F4y8nibhwMOiLdv6TDOC9iSdto4uNCnVmGZlwIKxC87+yQiHIyPEz/FYu9XThvBQTvlN7MejSkIUL/whgmKL8qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BctjiOzflPkKGfyJl9E4r2AvdDC8B62LApOL5KikzNE=;
 b=mShYLM7tftBhA04j2na/4mDFb6NVOtuvQRIQ+JUAPAa0DGkwWPk06GGE5GMkNMf0WGd3yPcJjpGc59CRzy1PxJiSgEFWrfYoH6daX4vwPihLtx6Q60DDHjJXIbDZ1CrcdVeguM4xc6W6QtPkd7jmfyl/8gz5VQKGGgICYoXpdgBMeWQ5lhJux7ShvvPAu89CPQ9pV2TSQaziVuSxZtjli1EBB4luBCMO/fHx5deORzbzumgZWyqGDy4lb0ffGFFHHfhSGjdYhNtNQuQGu+fjC1NDJ7TsVFu1RcnqI2GyTeIW3Ug9AxElZPiZvRA+HyrWWdInCsZouxV0BMiS51u/Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8547.namprd11.prod.outlook.com (2603:10b6:610:1bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Tue, 10 Jun
 2025 07:17:01 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 10 Jun 2025
 07:17:00 +0000
Date: Tue, 10 Jun 2025 15:16:52 +0800
From: kernel test robot <oliver.sang@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	kernel test robot <oliver.sang@intel.com>
Subject: [paulmck-rcu:dev.2025.06.04a] [rcutorture]  9605367000:
 WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]
Message-ID: <202506101435.e96fc5f7-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::7) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7efdc7-8671-4195-ef7a-08dda7eecb0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0PMXctPlfFhnQrwRQtgJ6lIfbCsbVdamQM8xfTSwiWASmqmMLNEStek0EvBt?=
 =?us-ascii?Q?aw/fQEF1L9ZD/Nh/f0Ygjl0NoSPvKlfruu6uk/rqZXHbZL0pbCmevUv+r1v/?=
 =?us-ascii?Q?d4mnSjEagdq9RRvyUJdJDxhmI8Xowwvv6xw6Now/G9dlFT+RvpW6i+XEvu9V?=
 =?us-ascii?Q?D3TY8jRDD71BsMqW3MJspHT0B2Yz0OmCtGjc7HvgaZ0XY4o540kpHmy8Dusp?=
 =?us-ascii?Q?VH3T0/pyqI9JBVBOBePtzQBbM69i4JjWAUTXZP4QIJTLFys2aMxw62+zMqqd?=
 =?us-ascii?Q?QcQn9DG5/aANcad8Mk5xFnHq+8lJLbvqUAUDqfJsXYQSD27wOjF+PhGOSKlV?=
 =?us-ascii?Q?p2IkS62R38X+vqcvIdL+SdiZxTpv2bwSjuOabkXxaFBpCnZjWblB117yc7Cg?=
 =?us-ascii?Q?xLxHxzvdrfhYKk0aazrerZHO5xTUBDIeCJaqgqqnS+GhRzDQfyTGJV44/q6w?=
 =?us-ascii?Q?3L9Aj4gmB5HBFEO6pP6/vNcyjxHKeLDT7tO7ZdlcnYUxBeEPv0ZPhvqlhnx9?=
 =?us-ascii?Q?ASKXS9wDDHlP3tzMlRVcTsA9IaJSFNOfhlU1texgNhct4rvIi4uwddt/5K7S?=
 =?us-ascii?Q?lTeDu9h7VXjWH3LXJDg7DEc56eJb7msyDjjvnouO1aNKzZMgkINRlAPXVgPg?=
 =?us-ascii?Q?gYXoEXt/DWH6JyRvvntlLqlPihWYeSdCpCDw5qzCHjQw3/p7NYWSJL7NRpOR?=
 =?us-ascii?Q?1fDEW2RCWXU4qWh7fLcow5vbbYV7tB8Kgg5AY1WVseUwus+GrxahIgWxxq9q?=
 =?us-ascii?Q?m+OcXz5Rx0NgmI1SxQPAn0H2jITwiCBdNMsIpD4o82KYX9XaQfgZfdiWp6/m?=
 =?us-ascii?Q?fWmTOvp/hDfnTiVaZI1cjxRdum2Ze4Y+tS3zuCRvxfj67NMTp9x8ETwActBs?=
 =?us-ascii?Q?fFRT44ZMmpiX/T1uUE7N63X6MKL2wZbOY/tu7upFCvE3Hn6ebfuHp7TOa1LG?=
 =?us-ascii?Q?xOb7C9jAsh++9gw6e5uzLf45nFMoY/gvunO6zZZ1wi10m54YWMbPu4xiR10F?=
 =?us-ascii?Q?ScYejbPH8afECwouCpqSPdt3hkYuP3x4uNZfcuB91Z4JOBCs/1kzarl/Ax/u?=
 =?us-ascii?Q?gs3Vj96pR/fzX6QPwBVvtTyQRcPDbZYjIRhc1gO22bgMA59vjW0CBGBoGlVM?=
 =?us-ascii?Q?Kf1/vr36cCu/vwCURLjnOjjv4TJ3lsyjcfb3JCX9u0ZydAmkLUFzxOIXVW9c?=
 =?us-ascii?Q?gi/xnKNFOAOc2tExZtqOIXRmzuM1ViGR5XXnCpn2fm1Ed/lgmobVRwNG//Vf?=
 =?us-ascii?Q?pQlrULM9AQohquRCxnV+vhCKudrVj/jFCNG2i5Oi3FhmvVOnbI5tTjecc+2u?=
 =?us-ascii?Q?NDaZDbrnj0MqIPuK0fr/8HHMJyWSEMm4CfoTS13R6DepC2KorPpAug7O7T3m?=
 =?us-ascii?Q?Dp/McNaP6vxu9E2PaKndnyq3Ir0Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3NwT51kp/iO2T7cTsuOkfW3Wa9CPqVD2CnouhZn/tMD9BgHPiFYr23VkIxb6?=
 =?us-ascii?Q?98OoQT9tp5js+K7twI8grsf38ngUwLz2iUrfbokzIkyfmu4AjGVVeqnOAYFZ?=
 =?us-ascii?Q?tai/4weWPn1QYzO+i3jN6eOhSFw0lLDs42d03891XFA3i1xx6PO54azOzXuG?=
 =?us-ascii?Q?0wWGsYXpsDPJN5qOkvgVGlRPO+a8d/6jHHwwH+56ZgWx85bzbBE/gmehY9LB?=
 =?us-ascii?Q?fZKuG9nTmBgfui9sc+Nkf2T0I5sto+G55H4RDEibi4iLIE+0/38exgY6bqoH?=
 =?us-ascii?Q?vNVe0arUn33Ux1eAZt1NeZqchauRnH4ZklPnTLTyk0OsOCTVF7k9EWAY3IQs?=
 =?us-ascii?Q?k3gOkeDYFrJiLqsvQHnbJnCvrRMHtdN9vVtZQ3h95ND4e6B6ZbiXqMVKGBMU?=
 =?us-ascii?Q?BR081A1ozja9GVUgiRaSuSv8mqIDKjtWRcQI7yMTH+oNOFo7r5M5nuEZ8GUH?=
 =?us-ascii?Q?6bBZUFzhMsHEozSpaGFy6paKTWDBhiTKAvjCvx+9ErDsfoO33vUvF71YG24m?=
 =?us-ascii?Q?HdR3YlhfYuua1bOfYRq13+SktxkZh3auP4/nvyPRCQKlPTwEfj4PW/x6NSwb?=
 =?us-ascii?Q?wOmHNWK81i1VGy+rcyzjYKWFCaLzOrAJG6iIHsPQETvRz36fhcFU7H583827?=
 =?us-ascii?Q?fLq1TCRJNrVmCt2hpeEZ1fGzjNG3OeZ0U/4G9Fc2Ap5ENXHkT+LOfLa1LgfN?=
 =?us-ascii?Q?5gjDIV8oWXkYqPNqpF7mtQWJLhmH3PMz0YQPCZbeI0oh58BVbk9RRR0mhYsU?=
 =?us-ascii?Q?gjXMAbKgNmIpXCuUf21czbupO438u8BlmnM5uXBZyp+KfKim+sJ5zojKS+5G?=
 =?us-ascii?Q?7dpkZpYjIyf7FjoPPposLaAXKodXda7uZZ60e00y9YJJgvWqpgaFGywxZMz5?=
 =?us-ascii?Q?SvLsFx8gSlb6oIektEcp3JO8K58qwYdSzEiE6kzk/2Gl+Rm+6scp2s6uflB7?=
 =?us-ascii?Q?SngCQ1PjcKXws7OV9g5YWRQ7kcfcFQbhBvvKdtQbww9UysB8oNN03Fgjqmej?=
 =?us-ascii?Q?HS40QbOp8PMY1RXgn36GnzizCIn8/rBj9kfirDy+qxFDJdxu1HdR5GVtktFG?=
 =?us-ascii?Q?nC5RBXQ4fh98X4ofonJ8Uk2nb1wQ2Cjp/pN9egndNG55KPMZiac/4yHv/WrS?=
 =?us-ascii?Q?sMDa4ddfgkVlQQhfkhWbsbBB4ORc3/yBeiDf0ONHQKeo59VX31Iy47zKNV0m?=
 =?us-ascii?Q?gQuvqBm/2XjWxzV1lYXWDb8gVC91M3ANFQCo8mKqJu2mmwkqeTLbV0wrwJK7?=
 =?us-ascii?Q?Q/Wcl7XxJrncpzqxDe9WNTrFW4mhZHSkS6VpvOTmjrZT1wOVdIlvfv5WkdJ7?=
 =?us-ascii?Q?Yn6yaoSPL65GUVNBBOKnCK0lGM3zqnumYCIMUhbVrFf2wjFwhSE3da+g3Ilk?=
 =?us-ascii?Q?8uixzNrCjJwRdFHQ2yPQvp4nF6nxFR+ZVvnKOawBGbOdK5e1eL0r0+nTJMDD?=
 =?us-ascii?Q?q6eI5hFbVgPvkSoJnB0ssoEcWq2fG8xoNvRlgraPvBVwhnMeu2Aj2UgaRHjb?=
 =?us-ascii?Q?8Blnz25IKKFkS2ZJoKhEyOnA0LVnz9xTyCmBSawJjxPdsM3MM11zK6bFhkgc?=
 =?us-ascii?Q?mqs8jY7ODEJ7mlt8rxp8TV/iOW2rrLDHSenR8naB8nC5MC0EyhWoic5U1YHX?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7efdc7-8671-4195-ef7a-08dda7eecb0c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 07:17:00.9185
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MMdwawo7qZBx6ikqSPmDw2/IFJmJ+smkZHDARMYnwbF0f040ajDuxRl469RDq4hzp5aQRFYFEd3Cxvh5sdd9/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8547
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed "WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture]" on:

commit: 96053670002f05c8aae39a668bddd54eb253dca7 ("rcutorture: Make Trivial RCU ignore onoff_interval and shuffle_interval")
https://git.kernel.org/cgit/linux/kernel/git/paulmck/linux-rcu.git dev.2025.06.04a

in testcase: rcutorture
version: 
with following parameters:

	runtime: 300s
	test: default
	torture_type: trivial



config: x86_64-randconfig-071-20250605
compiler: gcc-12
test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 16G

(please refer to attached dmesg/kmsg for entire log/backtrace)


+-------------------------------------------------------------------------------+------------+------------+
|                                                                               | 964687d8d4 | 9605367000 |
+-------------------------------------------------------------------------------+------------+------------+
| WARNING:at_kernel/rcu/rcutorture.c:#rcu_sync_torture_init_trivial[rcutorture] | 0          | 12         |
| RIP:rcu_sync_torture_init_trivial[rcutorture]                                 | 0          | 12         |
+-------------------------------------------------------------------------------+------------+------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506101435.e96fc5f7-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250610/202506101435.e96fc5f7-lkp@intel.com


[ 1078.501737][ T1445] torture module --- trivial:  disable_onoff_at_boot=0 ftrace_dump_at_shutdown=0 verbose_sleep_frequency=0 verbose_sleep_duration=1 random_shuffle=0
[ 1078.531216][ T1445] ------------[ cut here ]------------
[ 1078.542757][ T1445] rcu_sync_torture_init_trivial: Non-zero onoff_interval (0) or shuffle_interval (3) breaks trivial RCU, resetting to zero
[ 1078.543244][ T1445] WARNING: CPU: 0 PID: 1445 at kernel/rcu/rcutorture.c:990 rcu_sync_torture_init_trivial+0x42/0x5e [rcutorture]
[ 1078.589843][ T1445] Modules linked in: rcutorture(+) torture ipmi_devintf processor drm fuse drm_panel_orientation_quirks font stm_p_basic
[ 1078.614928][ T1445] CPU: 0 UID: 0 PID: 1445 Comm: modprobe Not tainted 6.15.0-rc1-00080-g96053670002f #1 PREEMPT(voluntary) 
[ 1078.636870][ T1445] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
[ 1078.656604][ T1445] RIP: 0010:rcu_sync_torture_init_trivial+0x42/0x5e [rcutorture]
[ 1078.672737][ T1445] Code: 00 89 d0 09 c8 74 33 80 3d 66 03 17 00 00 75 1c 48 c7 c6 c0 0a 3f c0 48 c7 c7 20 ba 3e c0 c6 05 4f 03 17 00 01 e8 f2 dc 83 e6 <0f> 0b 31 c0 89 05 29 3b 17 00 89 05 e3 29 16 00 5d 31 c0 31 d2 31
[ 1078.708709][ T1445] RSP: 0018:ffff8881bb48f6a0 EFLAGS: 00210246
[ 1078.720639][ T1445] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
[ 1078.736089][ T1445] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
[ 1078.751748][ T1445] RBP: ffff8881bb48f6a0 R08: 0000000000000000 R09: 0000000000000000
[ 1078.768592][ T1445] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc06382a0
[ 1078.784896][ T1445] R13: ffffffffc03f0f80 R14: ffff8881bb48f730 R15: dffffc0000000000
[ 1078.801843][ T1445] FS:  0000000000000000(0000) GS:0000000000000000(0063) knlGS:00000000f79f1700
[ 1078.820215][ T1445] CS:  0010 DS: 002b ES: 002b CR0: 0000000080050033
[ 1078.833348][ T1445] CR2: 00000000f7e7e51c CR3: 00000001bb406000 CR4: 00000000000006b0
[ 1078.850385][ T1445] Call Trace:
[ 1078.858560][ T1445]  <TASK>
[ 1078.865009][ T1445]  rcu_torture_init+0x2ee/0x1c88 [rcutorture]
[ 1078.878454][ T1445]  ? rcu_torture_fwd_prog_init+0x378/0x378 [rcutorture]
[ 1078.892547][ T1445]  ? rcu_torture_fwd_prog_init+0x378/0x378 [rcutorture]
[ 1078.907288][ T1445]  do_one_initcall+0xfc/0x316
[ 1078.915264][ T1445]  ? kasan_save_alloc_info+0x3b/0x51
[ 1078.925474][ T1445]  ? trace_initcall_level+0x8d/0x8d
[ 1078.936365][ T1445]  ? kasan_poison+0x57/0x63
[ 1078.945140][ T1445]  ? kasan_unpoison+0x45/0x54
[ 1078.954319][ T1445]  ? kasan_poison+0x57/0x63
[ 1078.963549][ T1445]  ? __asan_register_globals+0x5e/0x73
[ 1078.973664][ T1445]  do_init_module+0x228/0x584
[ 1078.983443][ T1445]  load_module+0xf35/0x1332
[ 1079.041071][ T1445]  ? layout_and_allocate+0x4ec/0x4ec
[ 1079.053668][ T1445]  ? __kasan_check_write+0x18/0x22
[ 1079.063917][ T1445]  ? kernel_read_file+0x55a/0x59e
[ 1079.074280][ T1445]  ? mode_strip_umask+0xa0/0xa0
[ 1079.084161][ T1445]  init_module_from_file+0xf6/0x13c
[ 1079.094886][ T1445]  ? init_module_from_file+0xf6/0x13c
[ 1079.106003][ T1445]  ? __ia32_sys_init_module+0x90/0x90
[ 1079.117160][ T1445]  ? idempotent_init_module+0x2cb/0x5cd
[ 1079.128590][ T1445]  ? lock_release+0xaa/0xdb
[ 1079.137666][ T1445]  idempotent_init_module+0x2e9/0x5cd
[ 1079.148390][ T1445]  ? init_module_from_file+0x13c/0x13c
[ 1079.159804][ T1445]  ? __fget_light+0x89/0xe6
[ 1079.170011][ T1445]  __do_sys_finit_module+0x77/0x9e
[ 1079.181158][ T1445]  __ia32_sys_finit_module+0x83/0x90
[ 1079.200369][ T1445]  ia32_sys_call+0x22ae/0x26a2
[ 1079.210966][ T1445]  __do_fast_syscall_32+0xb0/0xdb
[ 1079.221826][ T1445]  ? vm_mmap_pgoff+0x18b/0x1de
[ 1079.231317][ T1445]  ? randomize_page+0x62/0x62
[ 1079.240493][ T1445]  ? rcu_read_unlock+0x5f/0x69
[ 1079.250537][ T1445]  ? __kasan_check_write+0x18/0x22
[ 1079.260322][ T1445]  ? fput+0x43/0x6e
[ 1079.268784][ T1445]  ? __kasan_check_read+0x15/0x1f
[ 1079.278856][ T1445]  ? lockdep_hardirqs_on_prepare+0x109/0x12c
[ 1079.291496][ T1445]  ? syscall_exit_to_user_mode+0xe6/0xf5
[ 1079.303131][ T1445]  ? __do_fast_syscall_32+0xca/0xdb
[ 1079.314090][ T1445]  ? lockdep_hardirqs_on_prepare+0x109/0x12c
[ 1079.331846][ T1445]  ? irqentry_exit_to_user_mode+0xdc/0xeb
[ 1079.343611][ T1445]  do_fast_syscall_32+0x36/0x6e
[ 1079.354071][ T1445]  do_SYSENTER_32+0x23/0x27
[ 1079.363734][ T1445]  entry_SYSENTER_compat_after_hwframe+0x58/0x5f
[ 1079.376376][ T1445] RIP: 0023:0xf7f05579
[ 1079.385512][ T1445] Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00
[ 1079.421603][ T1445] RSP: 002b:00000000ffa4760c EFLAGS: 00200296 ORIG_RAX: 000000000000015e
[ 1079.439014][ T1445] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00000000584e6eb0
[ 1079.459721][ T1445] RDX: 0000000000000000 RSI: 00000000584e7220 RDI: 00000000584e6fa0
[ 1079.476023][ T1445] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
[ 1079.492738][ T1445] R10: 0000000000000000 R11: 0000000000200246 R12: 0000000000000000
[ 1079.508981][ T1445] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
[ 1079.525796][ T1445]  </TASK>
[ 1079.533122][ T1445] irq event stamp: 7135
[ 1079.542197][ T1445] hardirqs last  enabled at (7147): [<ffffffffa6dcb6a6>] __up_console_sem+0x54/0x5d
[ 1079.560760][ T1445] hardirqs last disabled at (7160): [<ffffffffa6dcb68b>] __up_console_sem+0x39/0x5d
[ 1079.580657][ T1445] softirqs last  enabled at (7088): [<ffffffffa6d210cd>] handle_softirqs+0x4a4/0x54c
[ 1079.603955][ T1445] softirqs last disabled at (7183): [<ffffffffa867059f>] __do_softirq+0xf/0x13
[ 1079.622009][ T1445] ---[ end trace 0000000000000000 ]---
[ 1079.633479][ T1445] trivial-torture:--- Start of test: nreaders=1 nfakewriters=4 stat_interval=60 verbose=1 test_no_idle_hz=1 shuffle_interval=0 stutter=5 irqreader=1 fqs_duration=0 fqs_holdoff=0 fqs_stutter=3 test_boost=1/0 test_boost_interval=7 test_boost_duration=4 test_boost_holdoff=0 shutdown_secs=0 stall_cpu=0 stall_cpu_holdoff=10 stall_cpu_irqsoff=0 stall_cpu_block=0 stall_cpu_repeat=0 n_barrier_cbs=0 onoff_interval=0 onoff_holdoff=0 read_exit_delay=13 read_exit_burst=16 reader_flavor=1 nocbs_nthreads=0 nocbs_toggle=1000 test_nmis=0 preempt_duration=0 preempt_interval=1000 n_up_down=32


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

