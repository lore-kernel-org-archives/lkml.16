Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A472C3246
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960236; cv=fail; b=Oek3yPnb9ZpyabPZa5f0oLXME3A1mr8T9It+VC35iLTdB3vJO0oweaUZirlkpOE/rZfUcS3tOAJSH2x7meVwxqvHXAKjiQvqBxshD7QJ2N+PGUlBnf5vuE+FDFdTLqwjgdTVjCnR1hVmQPNOnSAKtOsgRYBgwGFNNmP7Bsic4qw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960236; c=relaxed/simple;
	bh=KTrKyUB7IEkfuaQt6zmoF2xUiP7yi4mLyNkkeYwqolo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=N05m8wOEqeQ6yzyH2sLbUPQAbg/aACPCfc2BdhAtbNum55c3HxSgj9TIIrPIduR865dEXU+xZfcf3ddXbbuVlK1fnuISPKy7lXo+TNI7EHZHaqgmJTkLQ2mZZdppdL9LsQdOVXUycL2OdU37nwtcWFvm8b1AEv/cGmJO3VIuROo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NlA7Jm4E; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NlA7Jm4E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748960234; x=1780496234;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=KTrKyUB7IEkfuaQt6zmoF2xUiP7yi4mLyNkkeYwqolo=;
  b=NlA7Jm4EGqegyHw6h6DBpuoBSoQKY1SD/ggo0YBYR6pgLkGrJ5qrfCe3
   OhF5aS5R6mPjEplaEKAKFVRQHfUHmgmN3oIY8+kMH1K8dBukEs+2JvINH
   gdOPFrDA9dxbw/SI+TXX6/Q0LldTDngGwVWUjqbD86LUpM19NS9WKkiiL
   ul0m+EgG5cMwjNYbOGG57LeOxHRXyg+/UylSg4EUm/K8xYcvO8I2Otyzz
   b6AlPcuvvuooXU8MlOmbSWgztnsVy7y/MCKt7bar4+Z56wEFCu/WaWlKe
   ZkvRkaEN9RcBSF6F3t69pjSSd8j9JZcetpsU2Kjl8UyPajXaRV83V0PHJ
   Q==;
X-CSE-ConnectionGUID: unYtTblVQTWoKTZ1pyb4wg==
X-CSE-MsgGUID: 3J3Rysr/TIeCYybEJZgZ8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54808582"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="54808582"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:16:56 -0700
X-CSE-ConnectionGUID: sb1500sBQvecslF98O0sRw==
X-CSE-MsgGUID: EnaSobWXTC+XjHVnrtJPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="149645358"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 07:16:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 07:16:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 07:16:55 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.89)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 07:16:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lkc8CvTN6LreH0miCYttz+2DOcvdHaZiz3yVoaoFARVT9UcR2uoP3+K1EH7l58+/DVhDR6+gtTd9sn6a17czA6XkKw6kDwGptsKD8wi6qLZCXA3FiNsVIhV2Js+Fje9KwcvAAD/u0S28eB8ZbRv1ey2GdKJ0c1FMHxTGhip3ImEI4mmatqCAT1q8ax6/l2j4kM8O1+jnuH6tIMWJDovFliZc3iuc+TzWgLEJE2f2hTeSOID1gQeV/vPZAUFjZALbBeeq/yLAMlcDdDehY8JFokdIeG/14rpbuIJC5Yc2LvSbb31/9zsXaal1P8U1Ndg6+1dxCmk+70m0755QfYS5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bFhGeUVkZsfatDuAPlXfEgRrCgVBgihJ8zf16c4aVLc=;
 b=zCePO9/+Thf4lwu7ukghrzpFxZZLJIJ3u553ZcaXOtzAca6HWGq1HYNCCWLuWtl4V++4dhyu6GGkNTIjgJbeWSyqmhoeI9Xr8P3QcNIg2I1/Q9IYcwE5C0Pfe59U9vwBKzCLiIurTZuyCMY1UvjsuBWISaSAL+AcDY5cTIiksyFdaEuy7LnSKwh+qJKQmVUzcVsbByxDIAnesSvwKBEtu/hyc1nBqyo/VzB7IAVaZYpwzwwanM2t/Nz4jIniuIjJMgdIwP51gRr/vNZ+YMDYkYSYpmkUyiL8D1TG0y+glk3F7l5EjZGjCOe4T3sikCHqRDwA5C6dBOfJDV3YGdC2wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by SN7PR11MB7996.namprd11.prod.outlook.com (2603:10b6:806:2e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Tue, 3 Jun
 2025 14:16:52 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 14:16:52 +0000
Date: Tue, 3 Jun 2025 22:16:40 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, <oliver.sang@intel.com>
Subject: [linus:master] [futex]  cec199c5e3:  will-it-scale.per_process_ops
 4.7% regression
Message-ID: <202506032136.fb9b9db5-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CP6P284CA0095.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:103:1a8::12) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|SN7PR11MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 106762d6-1c07-4152-bae6-08dda2a94959
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WsYcAEh36YudUFuSiPRJQk8kq6p7hBJtLuYVFpI7TU5fwKUiVNce0xRQsu?=
 =?iso-8859-1?Q?oL8fp1vqMwUApKfknlCUoDAsZUODYfPD+VMxbSXjOOQi9ax5wCTmEmkVkw?=
 =?iso-8859-1?Q?Al/dAOXEBaBOXSxyTV1EdssqceXZ3A/oipbWSiJTiRoahw/U4qfQuP8tQY?=
 =?iso-8859-1?Q?YiXZuNt5vbacjdt9gknUPJHJMsKzxB2ZK0kU1m734c582IX578WYTA5H9m?=
 =?iso-8859-1?Q?QtBEChi9ARcWr6MnGOmgHYM1E7RpTs80Vavfnyvt/vKzXAG2Oo6DHyYuT1?=
 =?iso-8859-1?Q?6C1L3WYqRvwgEAdyN6+MTEMSotlbtf9UgMsrWOnYeZlIdgDi1+2lP3E4Qb?=
 =?iso-8859-1?Q?aZSVvMKujQlUqIhMjiFShYswzmQVWepmNRz0VBRhMG0U2z7qUEXtfIJwes?=
 =?iso-8859-1?Q?MRZlc/SjQfPUTV75NbvulKDGGegGUPlQ4plEKKfBcy6/QDFHIlSBKWnpY9?=
 =?iso-8859-1?Q?fyreT+/5TP6RV9TJxezD4L3Wy02hL/PaFdgt9dztA9ulnEgdZikH6DqnOt?=
 =?iso-8859-1?Q?t+d7b5vojV/WM4F8N7w78P2e61HLRG7yfEOnJWzB8iwXQZt5a2p23Bg9d8?=
 =?iso-8859-1?Q?KijG+v0oznuoQ7snwvEoSaH9geiCu4uadSR53RPxuXUd91LN/S2ZKTGWnh?=
 =?iso-8859-1?Q?h0nJOEEOI3Jvwdq+92/zukZVrl5ku4oi1z3F/ZPQqsYYgqdGpJqh+YDy8G?=
 =?iso-8859-1?Q?HveeRB2emTYXxUZnreDZa/Btv8gBD841lwuYvqucFBopHUgEwgqm6kLxu+?=
 =?iso-8859-1?Q?PFiccBFTPwi7XWUODibfsEOGR2PemVBVbjPucv/NuPS6VLJxcBZGS3Kzva?=
 =?iso-8859-1?Q?zSr/2YCtsdK5AafVJy/y+b85YDUrGx8IwpZXSemxqCgFSOCQ9dHF+4o874?=
 =?iso-8859-1?Q?mlS1kVAn0SPqwYKDt4Y6s34tV03OnaBBkO86+qFmEo0VV0bDh+UyMRDYpp?=
 =?iso-8859-1?Q?2H+OfXRuoM3MFh2vE6S28YSe4YyxyeYcWOXjP/ShI5ugUri6wQ0MXA3T4I?=
 =?iso-8859-1?Q?MhpfqnjBogwuRYSMr9m0sjUiqWGQH7dY/l3Ft2TCnJk8XR20AXOFYyBvZP?=
 =?iso-8859-1?Q?eT6Q0CWwv94VbleQ86BNAGzVsjrgr+ZrMRFECfixbJudGOZpnsvmwMAIdQ?=
 =?iso-8859-1?Q?hS7IQzovLLG0WmyJQ7B3OJc1a9IqCeLVXIH/eeRfmAWsF+io+1suFoz+kx?=
 =?iso-8859-1?Q?bc2CuqyFs31PTxX2n+SedlT1x9rNFvQ5jMhHM6FQtku2f98xz7ufdroOl/?=
 =?iso-8859-1?Q?pD6kgs55INEkV+OVQ9Xo74JxIe6wyWW5erBU0YOwDW79GOf9XntUquMpNk?=
 =?iso-8859-1?Q?T02Tf48NMa28czLdplbAe2gcFiOFoa83QRg0Rbxw8BxvRMekLVOqJ9Cyxs?=
 =?iso-8859-1?Q?HPl07gjaCrZXc3y4OVTuX8sNpf3T9i+efWpgRCwbs0wdJR7kSNwmUAsMmr?=
 =?iso-8859-1?Q?qhRw+FGFSxYicxoj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?mu8lbP3EG4yEaxDokgAs4eSE60u+JBVO3zZYK0EX4ngpguIznL2+/KW/jE?=
 =?iso-8859-1?Q?mDGcDJHWIPk1TvsO+1lLdXL+0lU2ppMPjcxgL3CglSfyMPV1g+/rWooEGD?=
 =?iso-8859-1?Q?fOpNbseAMyy0U3r06cm27y2av5N88ZpELt4vKDolOATAI1qf7Io5ib7YKP?=
 =?iso-8859-1?Q?ZJXtp/zIFeg73tpSvaKvMBk8aEzztQ2SE2wg7zv5wSZadqOzXQ1rPURUeq?=
 =?iso-8859-1?Q?JjwJrIyNQFbehjHqO22zBQVl2e578UDb5tVRCvG6VO18U2XcCPE8tzZTFO?=
 =?iso-8859-1?Q?PRs8FkHgm7hEHx1PbR7SxMLZpLOl8r/VJmadVNl9vHRMI42KFIhUhcxT5d?=
 =?iso-8859-1?Q?2NffslFUIjMsenf1yJfEtAgVsSJETJQ47zcZadajXbtyKHotiean4C//cE?=
 =?iso-8859-1?Q?g5qieAZdgFWc4p0F9Ectq9xCpgz2Rvywe26ZhgkOz20g50R+FqOCN6ylPC?=
 =?iso-8859-1?Q?SWohK84edpv2JR8A0c+yNe5CwNIxVME/FcyLLkX4Va78jvcrB4Z458+5zn?=
 =?iso-8859-1?Q?Mg0JB/mu0gWr59KA0R4pvMpwhi9348rJKgEQD0VAuGnGKcHbolx6c8A/Wo?=
 =?iso-8859-1?Q?Kw61+GBiRCRw2r57/QFUGo3zDwVPSbFVdAqyJPYrc9aAvyBRIocOJJ3jbq?=
 =?iso-8859-1?Q?dA7WSkp28TIt8MeEROEfCy0PqTbFYl7CHrPDdCKgJQrrtwmCgMKfH8SQ6W?=
 =?iso-8859-1?Q?DnGUaVVwO/Rer0jMCyZ32tW4p2EqVQfyJuF5Yj/aPfMoeLt3XRIAkIieNZ?=
 =?iso-8859-1?Q?hzIevXcAeNLEP7wK9zWSNulpUnRPk9SPzQXiwoUQbPBE1jm9XgyVdY0O03?=
 =?iso-8859-1?Q?kuqXMikXYWVYvkOlEDEGenNJuFVp+Qw4bm140kNQpwcBYty+2X7UFgnsVr?=
 =?iso-8859-1?Q?y1qkPdrwHippjdBjJKdVrjuJEhu1xH9BCjR2LgKrfOJo2XD0FwHR/W24Fg?=
 =?iso-8859-1?Q?nR0pWblzDxcQ73AzLh9kM/UWBnVEZz0PG5qBzk/LgFK4GNXI2Z86ufLlZF?=
 =?iso-8859-1?Q?sKH2h5GwwFiBt2XT31HdRXQv5+ldwpy/2BDHVFzZioBYVHxjXOf2pwlnJQ?=
 =?iso-8859-1?Q?+97ubafNOSXQRYOsd7rt5i+jM8yQwWKl7wgvNp9CTZ1rcXgILQnk82JYZE?=
 =?iso-8859-1?Q?YbjYqPF1FiEiruSZnLd4q/WpsEsY0BVoNYYxyx59va4NR5etZjQ5j8iEYh?=
 =?iso-8859-1?Q?qEvLKtSdji4Rnxi1VKz3M2O0+yvdx0k9+y06/WzygSq5bGzA3AgyIXYoaN?=
 =?iso-8859-1?Q?1+OGXVacxkwNfNkft/pJGvvjtYOTr+b9MNNUiDv52akNbg6p6KtzVOSux7?=
 =?iso-8859-1?Q?+6DT7sYteb2oU+PxpSbUMIQicnXCwkNEedNf0vSRd48exR0UYrEsbnvlDg?=
 =?iso-8859-1?Q?LgiHTTlUV+/ihu7pbIxHoq3CeJJmDZ+yG4IglLk1sp/H6p/+VRjfL38UPb?=
 =?iso-8859-1?Q?WQTYvqqf7YEskEBYTd/gpq1NYqOG/Dlh+vDBYU9rogusHiyf8XcFx+nOkm?=
 =?iso-8859-1?Q?h90laWghxQy8FOuxz/OnejnNzaIs0MoX0JdA9Kv2jSn+5zWY/asdx7Fuk2?=
 =?iso-8859-1?Q?lYMW6lIsWrHDenwTlgMDXfqnZJvuVW5c5Mu3lLPS2F4Ah6Ad+7g4S/kq7z?=
 =?iso-8859-1?Q?4i7gQW2zRzxCdamac0+YyQvsJVcuOYZYHVDGp70+DPZL0cIhr6bDWZDg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 106762d6-1c07-4152-bae6-08dda2a94959
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:16:52.5704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AJSME1Y60O+SJG5yrYX4c4+amKOm3M/cHfAX5q4PBmN1/viqL/0W13JvMorwx68dopUdotf1VNd726KrfO4Tjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7996
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 4.7% regression of will-it-scale.per_process_ops on:


commit: cec199c5e39bde7191a08087cc3d002ccfab31ff ("futex: Implement FUTEX2_NUMA")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[still regression on linus/master      0f70f5b08a47a3bc1a252e5f451a137cde7c98ce]
[still regression on linux-next/master 3a83b350b5be4b4f6bd895eecf9a92080200ee5d]

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 8G memory
parameters:

	nr_task: 100%
	mode: process
	test: futex3
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops  3.4% regression                    |
| test machine     | 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                    |
|                  | mode=thread                                                                     |
|                  | nr_task=100%                                                                    |
|                  | test=futex2                                                                     |
+------------------+---------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_process_ops  4.6% regression                   |
| test machine     | 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory  |
| test parameters  | cpufreq_governor=performance                                                    |
|                  | mode=process                                                                    |
|                  | nr_task=100%                                                                    |
|                  | test=futex4                                                                     |
+------------------+---------------------------------------------------------------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops  3.2% regression                    |
| test machine     | 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                    |
|                  | mode=thread                                                                     |
|                  | nr_task=100%                                                                    |
|                  | test=futex1                                                                     |
+------------------+---------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506032136.fb9b9db5-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250603/202506032136.fb9b9db5-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-hsw-d01/futex3/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    661671 ± 12%     -34.6%     432677 ± 43%  sched_debug.cpu.avg_idle.min
      0.03 ± 17%     -29.5%       0.02 ± 16%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    433.76 ± 12%     +47.9%     641.70 ± 18%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    433.58 ± 12%     +47.9%     641.30 ± 18%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
  12631979            -4.7%   12040371        will-it-scale.8.processes
   1578997            -4.7%    1505046        will-it-scale.per_process_ops
  12631979            -4.7%   12040371        will-it-scale.workload
 1.151e+09            +2.2%  1.177e+09        perf-stat.i.branch-instructions
      4.16            -2.7%       4.05        perf-stat.i.cpi
 7.188e+09            +2.7%  7.379e+09        perf-stat.i.instructions
      0.25            +2.6%       0.25        perf-stat.i.ipc
      0.78            -0.0        0.77        perf-stat.overall.branch-miss-rate%
      4.10            -2.6%       3.99        perf-stat.overall.cpi
      0.24            +2.7%       0.25        perf-stat.overall.ipc
    171339            +7.6%     184338        perf-stat.overall.path-length
 1.148e+09            +2.2%  1.173e+09        perf-stat.ps.branch-instructions
 7.164e+09            +2.7%  7.355e+09        perf-stat.ps.instructions
 2.164e+12            +2.5%   2.22e+12        perf-stat.total.instructions
     11.89 ±  7%      -3.3        8.57 ±  3%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     34.29            -3.3       30.97        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
     13.49            -0.6       12.90        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     14.07            -0.5       13.59        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      2.24            -0.1        2.14        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.35 ± 70%      +0.2        0.57        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.33 ±  4%      +1.6        2.90        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
      6.39 ±  4%      +2.7        9.09        perf-profile.calltrace.cycles-pp.futex_hash.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     13.20 ±  2%      +3.5       16.68        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.12 ±  2%      +4.1       18.24        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     15.54 ±  2%      +4.5       20.00        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     20.06            +7.0       27.09        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      0.00            +7.5        7.46        perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wake.do_futex.__x64_sys_futex
     21.50            +7.7       29.17        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     37.35            -3.4       33.90        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      8.68 ±  7%      -2.2        6.46 ±  3%  perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
     14.75            -1.6       13.12        perf-profile.children.cycles-pp.entry_SYSCALL_64
     14.34            -0.5       13.87        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.53 ±  4%      -0.1        0.47 ±  3%  perf-profile.children.cycles-pp.futex_hash_put
      0.58            +0.1        0.65 ±  2%  perf-profile.children.cycles-pp.x64_sys_call
      1.35 ±  4%      +1.6        2.94        perf-profile.children.cycles-pp.get_futex_key
      6.40 ±  4%      +2.7        9.14        perf-profile.children.cycles-pp.futex_hash
     13.50 ±  2%      +3.5       17.00        perf-profile.children.cycles-pp.futex_wake
     14.28 ±  2%      +4.1       18.38        perf-profile.children.cycles-pp.do_futex
     15.61 ±  2%      +4.5       20.12        perf-profile.children.cycles-pp.__x64_sys_futex
     20.33            +7.0       27.36        perf-profile.children.cycles-pp.do_syscall_64
      0.00            +7.5        7.46        perf-profile.children.cycles-pp.__futex_hash
     21.75            +7.7       29.41        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      6.26 ±  4%      -4.7        1.54        perf-profile.self.cycles-pp.futex_hash
     37.08            -3.4       33.63        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
     12.73            -1.6       11.17        perf-profile.self.cycles-pp.entry_SYSCALL_64
      5.40 ±  7%      -1.1        4.30 ±  3%  perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      7.82            -1.1        6.76        perf-profile.self.cycles-pp.syscall
      5.31 ±  3%      -0.7        4.59        perf-profile.self.cycles-pp.futex_wake
     14.34            -0.5       13.86        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.89            -0.1        1.80        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.51 ±  4%      -0.1        0.46 ±  3%  perf-profile.self.cycles-pp.futex_hash_put
      0.49            +0.1        0.58        perf-profile.self.cycles-pp.x64_sys_call
      1.30 ±  2%      +0.4        1.75 ±  2%  perf-profile.self.cycles-pp.__x64_sys_futex
      0.85 ±  2%      +0.6        1.40 ±  2%  perf-profile.self.cycles-pp.do_futex
      1.47 ±  2%      +0.6        2.11 ±  2%  perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.29 ±  3%      +1.6        2.88        perf-profile.self.cycles-pp.get_futex_key
      1.74            +2.6        4.31 ±  2%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +7.4        7.40        perf-profile.self.cycles-pp.__futex_hash


***************************************************************************************************
lkp-srf-2sp1: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp1/futex2/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     41.17 ±  8%     -21.1%      32.50 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     22531 ±  3%     +13.6%      25603 ± 18%  proc-vmstat.numa_pages_migrated
     95467 ± 22%     +48.6%     141903 ± 19%  proc-vmstat.numa_pte_updates
     22531 ±  3%     +13.6%      25603 ± 18%  proc-vmstat.pgmigrate_success
 9.212e+08            -3.4%  8.901e+08        will-it-scale.256.threads
   3598280            -3.4%    3477060        will-it-scale.per_thread_ops
 9.212e+08            -3.4%  8.901e+08        will-it-scale.workload
   7870684 ± 34%    +203.6%   23897639 ± 30%  perf-stat.i.branch-misses
     41.81 ± 55%     -20.4       21.40 ± 90%  perf-stat.i.cache-miss-rate%
      0.00 ± 34%      +0.0        0.01 ± 30%  perf-stat.overall.branch-miss-rate%
     33.72 ± 44%     -15.4       18.36 ± 69%  perf-stat.overall.cache-miss-rate%
    364549            +3.4%     376857        perf-stat.overall.path-length
   7813564 ± 34%    +204.1%   23764749 ± 30%  perf-stat.ps.branch-misses
     21.56            -2.4       19.17        perf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wait_setup.__futex_wait.futex_wait
     20.55            -2.3       18.23        perf-profile.calltrace.cycles-pp.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wait_setup.__futex_wait
     18.89            -1.6       17.27        perf-profile.calltrace.cycles-pp.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wait_setup
     16.79            -1.2       15.55        perf-profile.calltrace.cycles-pp.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key
     23.20            -0.8       22.41        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     12.14            -0.6       11.58        perf-profile.calltrace.cycles-pp.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast
      2.72 ±  2%      -0.2        2.56        perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      4.52            -0.1        4.37        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.91 ±  2%      -0.1        2.76 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      3.20            -0.1        3.10        perf-profile.calltrace.cycles-pp.try_get_folio.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      0.88            -0.1        0.78        perf-profile.calltrace.cycles-pp.___pte_offset_map.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      2.98            -0.1        2.88        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      2.58            -0.1        2.50        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
      1.80            -0.1        1.74        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     26.00            +0.4       26.36        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
     65.92            +1.1       67.00        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     64.16            +1.1       65.30        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     57.75            +1.4       59.10        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     56.92            +1.4       58.29        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     56.20            +1.4       57.60        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     54.70            +1.5       56.16        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     46.65            +1.6       48.28        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      1.72 ±  7%      +1.8        3.55 ±  3%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.00            +3.0        3.01        perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wait_setup.__futex_wait.futex_wait
     21.79            -2.6       19.24        perf-profile.children.cycles-pp.get_user_pages_fast
     20.62            -2.3       18.30        perf-profile.children.cycles-pp.gup_fast_fallback
     18.96            -1.6       17.34        perf-profile.children.cycles-pp.gup_fast
     16.82            -1.2       15.58        perf-profile.children.cycles-pp.gup_fast_pgd_range
     12.21            -0.5       11.66        perf-profile.children.cycles-pp.gup_fast_pte_range
     15.66            -0.5       15.13        perf-profile.children.cycles-pp.entry_SYSCALL_64
     12.01            -0.4       11.62        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.76 ±  2%      -0.2        2.60        perf-profile.children.cycles-pp.futex_q_unlock
      4.59            -0.2        4.43        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      2.95 ±  2%      -0.1        2.80 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock
      0.59            -0.1        0.47        perf-profile.children.cycles-pp.is_valid_gup_args
      0.91            -0.1        0.80        perf-profile.children.cycles-pp.___pte_offset_map
      3.24            -0.1        3.13        perf-profile.children.cycles-pp.try_get_folio
      2.62            -0.1        2.53        perf-profile.children.cycles-pp.futex_q_lock
      2.03            -0.1        1.96        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.41            -0.0        0.39        perf-profile.children.cycles-pp.try_grab_folio_fast
      0.50            -0.0        0.49        perf-profile.children.cycles-pp.testcase
      0.49            -0.0        0.47        perf-profile.children.cycles-pp.x64_sys_call
      0.49            -0.0        0.47        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.15            -0.0        0.14        perf-profile.children.cycles-pp.futex_setup_timer
      0.09            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.__sysvec_thermal
      0.09            +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.intel_thermal_interrupt
     26.06            +0.4       26.43        perf-profile.children.cycles-pp.get_futex_key
     66.09            +1.1       67.16        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     64.36            +1.1       65.48        perf-profile.children.cycles-pp.do_syscall_64
     57.75            +1.4       59.10        perf-profile.children.cycles-pp.__x64_sys_futex
     56.92            +1.4       58.29        perf-profile.children.cycles-pp.do_futex
     56.22            +1.4       57.62        perf-profile.children.cycles-pp.futex_wait
     55.22            +1.4       56.67        perf-profile.children.cycles-pp.__futex_wait
     46.26            +1.7       48.00        perf-profile.children.cycles-pp.futex_wait_setup
      1.75 ±  7%      +1.8        3.57 ±  3%  perf-profile.children.cycles-pp.futex_hash
      0.00            +3.0        3.04        perf-profile.children.cycles-pp.__futex_hash
      1.71 ±  7%      -1.2        0.50 ± 23%  perf-profile.self.cycles-pp.futex_hash
      4.58            -0.7        3.88 ±  2%  perf-profile.self.cycles-pp.gup_fast_pgd_range
      1.49            -0.5        0.98 ±  2%  perf-profile.self.cycles-pp.gup_fast_fallback
     11.97            -0.4       11.59        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.07            -0.4        1.69        perf-profile.self.cycles-pp.gup_fast
     11.78            -0.3       11.46        perf-profile.self.cycles-pp.syscall
      9.43            -0.3        9.12        perf-profile.self.cycles-pp.__futex_wait
      0.76            -0.3        0.47        perf-profile.self.cycles-pp.get_user_pages_fast
      7.34            -0.3        7.08        perf-profile.self.cycles-pp.gup_fast_pte_range
      7.64            -0.3        7.38        perf-profile.self.cycles-pp.entry_SYSCALL_64
      2.72 ±  2%      -0.2        2.56        perf-profile.self.cycles-pp.futex_q_unlock
      0.58            -0.1        0.44        perf-profile.self.cycles-pp.is_valid_gup_args
      4.20            -0.1        4.06        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.88            -0.1        0.76        perf-profile.self.cycles-pp.___pte_offset_map
      3.23            -0.1        3.11        perf-profile.self.cycles-pp.try_get_folio
      2.61            -0.1        2.52        perf-profile.self.cycles-pp.futex_q_lock
      1.53            -0.1        1.48        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.54            -0.1        1.49        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.39            -0.0        1.35        perf-profile.self.cycles-pp.do_syscall_64
      0.41            -0.0        0.37        perf-profile.self.cycles-pp.try_grab_folio_fast
      0.86            -0.0        0.83        perf-profile.self.cycles-pp.futex_wait
      0.83            -0.0        0.80        perf-profile.self.cycles-pp.__x64_sys_futex
      0.70            -0.0        0.67        perf-profile.self.cycles-pp.do_futex
      0.45            -0.0        0.44        perf-profile.self.cycles-pp.x64_sys_call
      0.47            -0.0        0.45        perf-profile.self.cycles-pp.testcase
      0.45            -0.0        0.44        perf-profile.self.cycles-pp.syscall_return_via_sysret
      4.24            +2.9        7.17        perf-profile.self.cycles-pp.get_futex_key
      0.00            +3.0        3.03        perf-profile.self.cycles-pp.__futex_hash



***************************************************************************************************
lkp-gnr-2ap2: 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2ap2/futex4/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      0.72 ±  4%      +0.1        0.82 ±  6%  mpstat.cpu.all.irq%
   2699383           -13.4%    2337183 ±  6%  numa-meminfo.node1.Shmem
    123578 ±102%    +116.6%     267679 ± 25%  numa-numastat.node1.other_node
    123578 ±102%    +116.6%     267679 ± 25%  numa-vmstat.node1.numa_other
 2.323e+09            -4.6%  2.216e+09        will-it-scale.384.processes
   6049881            -4.6%    5771879        will-it-scale.per_process_ops
 2.323e+09            -4.6%  2.216e+09        will-it-scale.workload
      2.14 ± 53%     -69.0%       0.66 ±149%  perf-sched.sch_delay.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2.14 ± 53%     -69.0%       0.66 ±149%  perf-sched.sch_delay.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    351.13 ±130%    +836.1%       3286 ± 49%  perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.14 ± 53%     -68.9%       0.67 ±148%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
      2.14 ± 53%     -68.9%       0.67 ±148%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged_wait_work.khugepaged.kthread
    342.14 ±135%    +860.6%       3286 ± 49%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
 2.319e+11            +1.8%  2.361e+11        perf-stat.i.branch-instructions
      0.92 ±  4%      -4.3%       0.88        perf-stat.i.cpi
 1.473e+12            +2.2%  1.506e+12        perf-stat.i.instructions
      1.11            +2.2%       1.14        perf-stat.i.ipc
      0.89            -1.6%       0.88        perf-stat.overall.cpi
      1.12            +1.6%       1.14        perf-stat.overall.ipc
    193483            +6.3%     205704        perf-stat.overall.path-length
  2.31e+11            +1.8%  2.353e+11        perf-stat.ps.branch-instructions
 1.468e+12            +2.3%  1.501e+12        perf-stat.ps.instructions
 4.495e+14            +1.4%  4.559e+14        perf-stat.total.instructions
      3.43 ±  2%      -0.6        2.82 ±  2%  perf-profile.calltrace.cycles-pp.futex_q_unlock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     28.24            -0.6       27.62        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
      9.46            -0.5        8.95        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.36            -0.3        3.10        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      1.76            -0.1        1.68 ±  2%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      1.31            -0.1        1.23        perf-profile.calltrace.cycles-pp.testcase
      1.13            -0.1        1.06        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      2.09            -0.0        2.04        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.64            -0.0        1.61        perf-profile.calltrace.cycles-pp.futex_hash_put.futex_wait_setup.__futex_wait.futex_wait.do_futex
      0.72            -0.0        0.70        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      2.16            +0.5        2.63        perf-profile.calltrace.cycles-pp.get_futex_key.futex_wait_setup.__futex_wait.futex_wait.do_futex
      2.92            +0.8        3.74        perf-profile.calltrace.cycles-pp.futex_q_lock.futex_wait_setup.__futex_wait.futex_wait.do_futex
     68.21            +1.1       69.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     65.61            +1.1       66.75        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     49.34            +1.8       51.14        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     45.75            +2.0       47.78        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     43.36            +2.1       45.44        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.80 ±  2%      +2.1        5.94 ±  2%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wait_setup.__futex_wait.futex_wait.do_futex
     38.92            +2.3       41.20        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
     29.49            +2.6       32.08        perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      0.00            +4.5        4.50        perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wait_setup.__futex_wait.futex_wait
      3.59 ±  2%      -0.6        2.99        perf-profile.children.cycles-pp.futex_q_unlock
     10.00            -0.6        9.43        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
     16.65            -0.5       16.17        perf-profile.children.cycles-pp.entry_SYSCALL_64
      6.34            -0.3        6.08        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      2.41            -0.2        2.23        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      1.44            -0.1        1.33        perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
      1.98            -0.1        1.89        perf-profile.children.cycles-pp.syscall_return_via_sysret
      1.51            -0.1        1.43        perf-profile.children.cycles-pp.testcase
      1.41            -0.1        1.36        perf-profile.children.cycles-pp.futex_hash_put
      2.34            -0.1        2.28        perf-profile.children.cycles-pp.x64_sys_call
      0.79            -0.0        0.74        perf-profile.children.cycles-pp.futex_setup_timer
      0.10 ±  3%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.16 ±  3%      +0.0        0.17 ±  2%  perf-profile.children.cycles-pp.sched_tick
      0.14 ±  9%      +0.1        0.20 ± 16%  perf-profile.children.cycles-pp.ktime_get
      0.14 ± 11%      +0.1        0.20 ± 14%  perf-profile.children.cycles-pp.clockevents_program_event
      0.34 ±  9%      +0.1        0.42 ± 12%  perf-profile.children.cycles-pp.update_process_times
      0.42 ±  8%      +0.1        0.52 ± 12%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.42 ±  9%      +0.1        0.51 ± 13%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.70 ±  7%      +0.2        0.86 ± 10%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.74 ±  6%      +0.2        0.90 ± 10%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.68 ±  7%      +0.2        0.84 ± 10%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.68 ±  7%      +0.2        0.84 ± 10%  perf-profile.children.cycles-pp.hrtimer_interrupt
      2.34            +0.4        2.78        perf-profile.children.cycles-pp.get_futex_key
      3.07            +0.8        3.91        perf-profile.children.cycles-pp.futex_q_lock
     66.52            +1.1       67.64        perf-profile.children.cycles-pp.do_syscall_64
     68.64            +1.1       69.76        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     49.87            +1.8       51.64        perf-profile.children.cycles-pp.__x64_sys_futex
     46.54            +2.0       48.55        perf-profile.children.cycles-pp.do_futex
     43.64            +2.1       45.70        perf-profile.children.cycles-pp.futex_wait
     39.38            +2.3       41.65        perf-profile.children.cycles-pp.__futex_wait
      3.95 ±  2%      +2.4        6.32 ±  2%  perf-profile.children.cycles-pp.futex_hash
     31.16            +2.6       33.80        perf-profile.children.cycles-pp.futex_wait_setup
      0.00            +4.7        4.74        perf-profile.children.cycles-pp.__futex_hash
      3.76 ±  2%      -2.2        1.56 ±  9%  perf-profile.self.cycles-pp.futex_hash
      3.36 ±  2%      -0.6        2.80 ±  2%  perf-profile.self.cycles-pp.futex_q_unlock
      8.55            -0.5        8.08        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      8.11            -0.4        7.75        perf-profile.self.cycles-pp.__futex_wait
     15.92            -0.4       15.56        perf-profile.self.cycles-pp.syscall
     14.12            -0.3       13.79        perf-profile.self.cycles-pp.futex_wait_setup
      4.08            -0.3        3.80        perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.12            -0.2        5.88        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      3.32            -0.2        3.09        perf-profile.self.cycles-pp.__x64_sys_futex
      3.46            -0.2        3.29        perf-profile.self.cycles-pp.futex_wait
      4.49            -0.1        4.38        perf-profile.self.cycles-pp.do_syscall_64
      1.98            -0.1        1.89        perf-profile.self.cycles-pp.syscall_return_via_sysret
      1.42            -0.1        1.33        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.31            -0.1        1.23        perf-profile.self.cycles-pp.testcase
      1.14            -0.1        1.07        perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      3.15            -0.1        3.08        perf-profile.self.cycles-pp.do_futex
      2.07            -0.1        2.02        perf-profile.self.cycles-pp.x64_sys_call
      0.81            -0.0        0.76        perf-profile.self.cycles-pp.futex_hash_put
      0.53            -0.0        0.50        perf-profile.self.cycles-pp.futex_setup_timer
      0.10            +0.0        0.12 ±  4%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.14 ± 10%      +0.1        0.19 ± 16%  perf-profile.self.cycles-pp.ktime_get
      3.69            +0.1        3.74        perf-profile.self.cycles-pp._raw_spin_lock
      2.16            +0.4        2.60        perf-profile.self.cycles-pp.get_futex_key
      2.72            +0.7        3.42        perf-profile.self.cycles-pp.futex_q_lock
      0.00            +4.5        4.52        perf-profile.self.cycles-pp.__futex_hash



***************************************************************************************************
lkp-srf-2sp1: 256 threads 2 sockets GENUINE INTEL(R) XEON(R) (Sierra Forest) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/thread/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp1/futex1/will-it-scale

commit: 
  63e8595c06 ("futex: Allow to make the private hash immutable")
  cec199c5e3 ("futex: Implement FUTEX2_NUMA")

63e8595c060a1fef cec199c5e39bde7191a08087cc3 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.079e+09 ± 58%     -45.0%  5.934e+08 ±  3%  cpuidle..time
      1.38 ± 53%      -0.7        0.64 ±  6%  mpstat.cpu.all.idle%
   4521392 ± 27%     -41.0%    2666361 ± 55%  numa-meminfo.node0.MemUsed
   3133949 ± 39%     +59.9%    5010749 ± 29%  numa-meminfo.node1.MemUsed
 1.224e+09            -3.2%  1.185e+09        will-it-scale.256.threads
   4780060            -3.2%    4627197        will-it-scale.per_thread_ops
 1.224e+09            -3.2%  1.185e+09        will-it-scale.workload
      0.04 ± 24%     -29.3%       0.03 ± 37%  perf-stat.i.major-faults
      3964 ±  2%      -3.6%       3821        perf-stat.i.minor-faults
      3964 ±  2%      -3.6%       3821        perf-stat.i.page-faults
    322627            +3.7%     334580        perf-stat.overall.path-length
      0.04 ± 24%     -30.0%       0.03 ± 36%  perf-stat.ps.major-faults
      3934 ±  2%      -3.8%       3785        perf-stat.ps.minor-faults
      3934 ±  2%      -3.8%       3785        perf-stat.ps.page-faults
      0.07 ± 26%     -39.6%       0.04 ± 36%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.11 ± 16%     +38.2%       0.15 ± 25%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     66.89 ±  7%     -30.1%      46.79 ± 27%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     11.66 ± 90%    +124.7%      26.19 ± 27%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.22 ± 16%     +38.5%       0.30 ± 25%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    414.50 ±  7%     +59.5%     661.00 ± 40%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     66.83 ±  7%     -30.0%      46.75 ± 27%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     11.66 ± 90%    +124.7%      26.19 ± 27%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      0.11 ± 16%     +38.2%       0.15 ± 25%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
     28.45            -3.5       24.98        perf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wake.do_futex.__x64_sys_futex
     27.02            -3.3       23.74        perf-profile.calltrace.cycles-pp.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wake.do_futex
     24.86            -2.4       22.46        perf-profile.calltrace.cycles-pp.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key.futex_wake
     22.10            -1.9       20.22        perf-profile.calltrace.cycles-pp.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast.get_futex_key
     30.86            -1.0       29.84        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64.syscall
     15.86            -0.3       15.57        perf-profile.calltrace.cycles-pp.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback.get_user_pages_fast
      7.01            -0.2        6.79        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      3.97            -0.1        3.83        perf-profile.calltrace.cycles-pp.entry_SYSRETQ_unsafe_stack.syscall
      4.28            -0.1        4.14        perf-profile.calltrace.cycles-pp.try_get_folio.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      0.75            -0.1        0.62        perf-profile.calltrace.cycles-pp.is_valid_gup_args.get_user_pages_fast.get_futex_key.futex_wake.do_futex
      1.18            -0.1        1.08        perf-profile.calltrace.cycles-pp.___pte_offset_map.gup_fast_pte_range.gup_fast_pgd_range.gup_fast.gup_fast_fallback
      3.04            -0.1        2.95        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
      2.53            -0.0        2.50        perf-profile.calltrace.cycles-pp.testcase
      0.60            -0.0        0.58        perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      0.65            -0.0        0.63        perf-profile.calltrace.cycles-pp.x64_sys_call.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     55.34            +1.5       56.83        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     53.05            +1.6       54.61        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     43.57            +1.9       45.44        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     42.42            +1.9       44.33        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     41.62            +1.9       43.54        perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.05            +2.1        4.17 ±  8%  perf-profile.calltrace.cycles-pp.futex_hash.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
      0.00            +3.6        3.63 ±  9%  perf-profile.calltrace.cycles-pp.__futex_hash.futex_hash.futex_wake.do_futex.__x64_sys_futex
     28.77            -3.7       25.06        perf-profile.children.cycles-pp.get_user_pages_fast
     27.11            -3.3       23.82        perf-profile.children.cycles-pp.gup_fast_fallback
     24.95            -2.4       22.56        perf-profile.children.cycles-pp.gup_fast
     22.15            -1.9       20.25        perf-profile.children.cycles-pp.gup_fast_pgd_range
     20.83            -0.7       20.14        perf-profile.children.cycles-pp.entry_SYSCALL_64
     16.00            -0.6       15.44        perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
     15.99            -0.3       15.68        perf-profile.children.cycles-pp.gup_fast_pte_range
      7.06            -0.2        6.84        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.77            -0.2        0.62        perf-profile.children.cycles-pp.is_valid_gup_args
      4.33            -0.1        4.18        perf-profile.children.cycles-pp.try_get_folio
      1.20            -0.1        1.10        perf-profile.children.cycles-pp.___pte_offset_map
      2.70            -0.1        2.62        perf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      2.03            -0.0        2.00        perf-profile.children.cycles-pp.testcase
      0.65            -0.0        0.63        perf-profile.children.cycles-pp.x64_sys_call
      0.65            -0.0        0.63        perf-profile.children.cycles-pp.syscall_return_via_sysret
      0.10            +0.0        0.11        perf-profile.children.cycles-pp.sysvec_thermal
      0.09            +0.0        0.10        perf-profile.children.cycles-pp.intel_thermal_interrupt
      0.10 ±  4%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_thermal
     98.25            +0.0       98.30        perf-profile.children.cycles-pp.syscall
     55.48            +1.5       56.95        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     53.22            +1.5       54.76        perf-profile.children.cycles-pp.do_syscall_64
     43.57            +1.9       45.44        perf-profile.children.cycles-pp.__x64_sys_futex
     42.46            +1.9       44.36        perf-profile.children.cycles-pp.do_futex
     41.72            +1.9       43.64        perf-profile.children.cycles-pp.futex_wake
      2.09            +2.1        4.22 ±  8%  perf-profile.children.cycles-pp.futex_hash
      0.00            +3.7        3.67 ±  9%  perf-profile.children.cycles-pp.__futex_hash
      6.11            -1.6        4.52        perf-profile.self.cycles-pp.gup_fast_pgd_range
      2.04            -1.5        0.50 ±  5%  perf-profile.self.cycles-pp.futex_hash
      1.96            -0.7        1.29        perf-profile.self.cycles-pp.gup_fast_fallback
     15.96            -0.6       15.40        perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      1.10            -0.5        0.62        perf-profile.self.cycles-pp.get_user_pages_fast
      2.71            -0.5        2.24        perf-profile.self.cycles-pp.gup_fast
     14.25            -0.5       13.78        perf-profile.self.cycles-pp.syscall
     10.14            -0.3        9.81        perf-profile.self.cycles-pp.entry_SYSCALL_64
      6.69            -0.2        6.48        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
      4.85            -0.2        4.68        perf-profile.self.cycles-pp.futex_wake
      0.72            -0.1        0.58        perf-profile.self.cycles-pp.is_valid_gup_args
      4.31            -0.1        4.17        perf-profile.self.cycles-pp.try_get_folio
      1.98            -0.1        1.91        perf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.12            -0.1        1.05        perf-profile.self.cycles-pp.___pte_offset_map
      2.06            -0.1        1.99        perf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      1.75            -0.1        1.70        perf-profile.self.cycles-pp.do_syscall_64
      1.10            -0.0        1.07        perf-profile.self.cycles-pp.__x64_sys_futex
      0.78            -0.0        0.75        perf-profile.self.cycles-pp.do_futex
      0.65            -0.0        0.63        perf-profile.self.cycles-pp.syscall_return_via_sysret
      0.60            -0.0        0.58        perf-profile.self.cycles-pp.x64_sys_call
      0.19            -0.0        0.18        perf-profile.self.cycles-pp.futex_hash_put
      0.05            +0.0        0.06        perf-profile.self.cycles-pp.intel_thermal_interrupt
      0.00            +3.7        3.65 ±  9%  perf-profile.self.cycles-pp.__futex_hash
      5.84            +3.7        9.49        perf-profile.self.cycles-pp.get_futex_key





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

