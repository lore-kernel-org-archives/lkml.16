Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C857220F2C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747363192; cv=fail; b=avQkcC5X1eTqeupoHAL9VEwLVQrIoSWPt21JoYvEBXQ3Jj9pS2FLbIrNgmGu5VPW/R1skOBqpfvojt/j97ZEDFvT0khn2U5bmyDwfZRR0292CaTgnS0kfbHgtMTGGVmVcunxKVgP7ZxpHRgTlppNXTj40FCMfDLOL5Bf11FEAGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747363192; c=relaxed/simple;
	bh=MbXEY3WgGZ3h+FMUUtKWwuICNxuuBKL5L9kxzoIQFQE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=uqAnhRCParEd3QSInDNdllk8iT0ALFGMlTF7oe2r7atua4EfB/SEADhQPHVXw0xD2mBaGfRyG10Rqer+feyqmgdTfdt9pf+ggGUVSHXE2QAbj1qaBcothXhu3PCPLpVFs+5md+fm6OZNstEqp+Fbcx9Q4LtMmhUvDABjdEC2GHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUaW4vHZ; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUaW4vHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747363190; x=1778899190;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=MbXEY3WgGZ3h+FMUUtKWwuICNxuuBKL5L9kxzoIQFQE=;
  b=JUaW4vHZWSaE0Vtcyr0PkwgF542j/VB/GH7xyI4aBLMi2O7WQY4pmcSv
   Dl/8Dt6BsxIzz2G0gq7p+1UDljRPKlW/Ww/8oVlgUSuphi70ZQ3wO59KD
   D45zxvvFkzFVDZ3ys5wILHGvzqpDKL7lQCfimat0yLgK/MgjMDStLBUVq
   q1uNC2o0gaUqWl8f/9KY4vcqvWSLUwM6DVK3TD0zB/SgU7UXuKObh2LWO
   zihWA26yR+rGSGRi+sj62mAHjdjUnSs9RvwEgX4nOot64NJ5a9/ugzotq
   3VQSsMoG5vQtgnB/9HG7bm11z7r5lMtlRV7ljOBF/IwxTZ7hPchNrCkF7
   w==;
X-CSE-ConnectionGUID: dkk5zpHISbK4yqzuHYGMyA==
X-CSE-MsgGUID: CibteMIQTb+OseswsF4lNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71831838"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71831838"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:39:50 -0700
X-CSE-ConnectionGUID: +BCKINbTQ0CzAEZXU0qi3g==
X-CSE-MsgGUID: cGdqNKMNSCW3uBpLwEM7hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139437680"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 19:39:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 19:39:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 19:39:49 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 19:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PcqNDiORp/LNNZAJFZfu9qZg9gZm6Cb2wLzWo8sJg7gazQHJhKFA5Q2avWew9AaoCMmojThXUA0dQn2w4xgCzVemm2eZmzDl4XO9MgMuSYOeJXoAfRVxALFS3cq3wa85MvyD1V2Xt3LmdYfzQy/XDLRKVes9DO+pzOnKe0aYBBmganVLaXgPCp8YGmkwNGoY/uoZKxomJZahX0tc0fCL0z0L7RG/LS6Ndz2ThLLR4+BwbH3KxQCtS3jmkNHGBFyZYsk5xblzIu8qT4oWC4LQOmvEyvY4oooQeF3yyLAZ25d2BzplsEdWib8FY2yL+NIipxUJZ6fz/4jLoEFd6ZSOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lm/FoylRqL9soRFUJCDIzv9aYelJon1ATCxu1hM0F9w=;
 b=fQ1bOt5dBvD75Cc9YmIVwynGfEYfK3rka6vheLblFJs+7amQN+ZTOrEMjSAm3OtNis2z9MWMy5nEI8/LUcJPpXhKkZY8KYnm8t8Op0MJBVIUCtYKSldAkei4gye1BKNZhRNHASutscdnODLySV7947eaBVkc/1bcT1WNvPz0jDCemFYWLPRRw2w/qm44E28sD7nyTrHxbBExN/R+3MkjmRZEhUZ7EDr9k0ChwlvPfiLT2AA08HJ0jjKhk0vj3s+Syq75DZqSU2s8fsElI7M1++iAC9T/osdGILs9CXiHo3cTqO/zqrhLFiWfgnGssgcrY/Cdtj1cA2bA+GpEj7XRMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DM4PR11MB5248.namprd11.prod.outlook.com (2603:10b6:5:38b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:39:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 02:39:41 +0000
Date: Fri, 16 May 2025 10:39:32 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Charlie Jenkins <charlie@rivosinc.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, <oliver.sang@intel.com>
Subject: [tip:core/entry] [entry]  e43b8bb56e:
 stress-ng.personality.ops_per_sec 3.2% improvement
Message-ID: <202505160902.c72854e8-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0105.apcprd02.prod.outlook.com
 (2603:1096:4:92::21) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DM4PR11MB5248:EE_
X-MS-Office365-Filtering-Correlation-Id: 748368bc-d41b-444f-319c-08dd9422e8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R2kyYtPw39Cv6lN5ZX9IRLCYR/SAbj7AwwtS6pqlGh82fcIBIhDYnaX2Ig?=
 =?iso-8859-1?Q?+Q65MKqdPzd4ccXGtjaeRiGVKs7cdaAbFOIgswPCCmG9ayCckiopuG5VKW?=
 =?iso-8859-1?Q?SF9IFoeTeiWW+C70X9GA5YAQRG4DLQXaPqIUHTu4C2MtUAuQtkk9gisfJK?=
 =?iso-8859-1?Q?uUrKCuivD4Fd9jkqQR9T/RvoIu1p1f3XMvoO69ZJ1AQ+c7SUrOex7hlLIw?=
 =?iso-8859-1?Q?1TNN1hjSqD13lpiqNuRKdubPOvaU5Jo/l1wHY/aJUs0FJAubQ7uGZPZu86?=
 =?iso-8859-1?Q?KTBOaIeHJRXoMtET06kRmjb9A/SkEwFKDo/g9AyLOr21I5oLbgwbjvV9wg?=
 =?iso-8859-1?Q?JWUB+qF8VDCUgsdFtxPKfw0rv6QeNiXTkL0FGYgol/TIJKdYFrRklyfici?=
 =?iso-8859-1?Q?/C2JkO6Ddcl42eX7sebdocy93l8xns5aBa9mxVcS/78ApOECMYodMDoXt4?=
 =?iso-8859-1?Q?KIGKzWs9uKk04/4G45fktHut6iXk/VUS9+NIySL5YqWQ/2RRxw4SJbkYp5?=
 =?iso-8859-1?Q?DsCtnH7qExPvd/irVV6n0c6EXwFiaSHS3g0WpYQoGjErXsgTvg2MjUdJ2W?=
 =?iso-8859-1?Q?XWexj3Quykk7Qzad7FoaoJekExKHzZ821ql6nlL2YHx69bAPNAux5S60i7?=
 =?iso-8859-1?Q?voK3b03PUV1M9nCVc07UTUTYpAF4FKhc07PPVaqJNgqyIT6aLosuX/b21m?=
 =?iso-8859-1?Q?9Sacm8CFN90yQf/Z5OHAUIMUzNTDCiP6O/DvHX2HnaCTQPPSPqbHwok++t?=
 =?iso-8859-1?Q?Ka8FglR1SVVw85iZbEGKaJTLQJb9W2cLnCvSXBGLvmXABwFYzqdkK9nMvU?=
 =?iso-8859-1?Q?jSFIjzN3tFUAjYoG0cL/PMbUqHmPEKrHjrlJsAvrMyVUbU3KS3oSDhtEvK?=
 =?iso-8859-1?Q?BTeWB0nrzP8BPnvyymjN6+B/YNKSalEXfNeIx1e7xK7l+PJXQyxcdKDai3?=
 =?iso-8859-1?Q?IH9BWgVwmKnabIZwSotNbGAmY3ZJY6oLk9ySi0+OdGGaiHTCoQiPly/K9I?=
 =?iso-8859-1?Q?xKeR/GVnqgNDcV2Nn/MjrmrgJL1InoKwZBcP3eaOY8hwInnYnE66L9P1c1?=
 =?iso-8859-1?Q?ym4ccW+PSm8JBg1itUmL1eXZCYqzwrPGnvfstpX0TFDa9S339QfKRf+Z0/?=
 =?iso-8859-1?Q?6XSEJuCsGulJJ7ao6jDHiXtKXtGqD3j4fH7A13m8CBOXNmhBvvwkYfLLjj?=
 =?iso-8859-1?Q?OCX362rHST6Rr7sgEVLpV8lzxznLovhu8miDv3UyY3ZwY5npIlPjPt1ERv?=
 =?iso-8859-1?Q?xwlsHrd/KQ9dvZqiyDPZVYDnrZ9ryRyxIy+d9FBMJoFuYi0cmLGblUcjLS?=
 =?iso-8859-1?Q?sBGNBktY4SD8cBPoNwxJsZ66PrTn0x3MTPqOcm0vm42VLTMWzDJc6Bqfdr?=
 =?iso-8859-1?Q?rS9FcTR7J/JhKtMu8rBM4sR9zFBFzqCwNf1dAnGgKRUBtUeNUABOJpiljI?=
 =?iso-8859-1?Q?5nBMkKCwjPE6RmRr?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8zi/xJjZIzJ7iKOiDwcDoV6of9yVbT/7PRJRGutV+ES5E7yIZyqiWJ0PCn?=
 =?iso-8859-1?Q?eR2SR2odVuI6AMexOucvJEo5UYZIr+Tv6Tmy7D8ybAzuAe36vLRsJNNiGr?=
 =?iso-8859-1?Q?DBhuAvJiZVb4gjCump+E1wrWjFxnt63N8KbqHafPLnJo1g6eTdCDNzTYZe?=
 =?iso-8859-1?Q?IKcKw3ODhjqoISHwi4q4OZgfeX61y6WnAdKAsMf/vAmRRy39k4RBjI9hmR?=
 =?iso-8859-1?Q?aPfrxogGOgnp9hsGFL7qbG1CtisCrxWlntsKvTlo8dgggfIKMNrJvXuMS8?=
 =?iso-8859-1?Q?0TqTVueFP2el9ze0Y0zVCD1tmJBZMSsYb+wOUwGEokXycg8gtDSE6QYVNU?=
 =?iso-8859-1?Q?RiZLcPr6cOlaXe81h2oamyhwfpuHoPNtKUDA6FlouYDKYeqPaUbI9+Ao6v?=
 =?iso-8859-1?Q?Jq6zztis/3epNYuUx8BulvhM04PyXzrZazLPHDKA01wuDp0awrbuOka1jj?=
 =?iso-8859-1?Q?9fYyzNwsfRTGa+wUFapVhzdgwQEP42X7S81+k2OhQ/Otcu8k/4JCUUJto1?=
 =?iso-8859-1?Q?K9fcJctHZBCD2mVfYuylKxBtDSRNI+E2RcO074yfwy8500Fz+ZBxNZvhUk?=
 =?iso-8859-1?Q?cke7oIOE9AK3Jwhi4lL2nQB/gE4tyRII+MIwaAxMOFy+/+Iv70ZZcOP5Ng?=
 =?iso-8859-1?Q?dwRahWAlLGGP6HmTII7rlaVTLdmtgNAArUgVdwSppCkFFex7Fyz33cHhJo?=
 =?iso-8859-1?Q?w17a9EHyS47KmzL7M4mcWS7m3nJ8WiJ0uZVpIqyUd7bsM1bJhApALjR8dD?=
 =?iso-8859-1?Q?SuevcUsvTtzAWQTHLt/HQYT+lI/GlrmFq7SFGXEiv+32jQPkKzUXvrDPlv?=
 =?iso-8859-1?Q?Ew5GYHA+7ePq+RvCD7K9eY8D/ypWcMuL/+AlOLmZFTaH9o6IYfBQmUy+kO?=
 =?iso-8859-1?Q?ZdoK0W7e5ERxy7cEOmE2a12x8cARWILj59NvjIBRBbn78qHxBcCBNf4cDW?=
 =?iso-8859-1?Q?B3x+63SowndEAghHhSCEx4Irwl5ncb4kbRPWJ7Yf2d+EymmpNlvRr5KGyT?=
 =?iso-8859-1?Q?7uEguelWB0ZI4MnOyXIhL2A45d+5Pv2SQCKNOUqefWELEgdwm4PE58HkeJ?=
 =?iso-8859-1?Q?RWoTKvUWVZYiffH4wjzgexMkneSyJz7LRL7GX4qDyBHDcX9KHukXWal2B7?=
 =?iso-8859-1?Q?UKG3kOhl73rN57b7C2UGXoDNX28KPPVlbvIAx/9P0tzkNoas8A4Vu8doWz?=
 =?iso-8859-1?Q?f5Vd08nsWrE/pwRmyFXGB0VPhK7rB+KIIxN7yJIjI/f1H8Nw2jj3aQZWJB?=
 =?iso-8859-1?Q?as+WT0schE/l8/ln1oyPGf0HCRJePuxdjlmQIiE5uf1GNeXh1fjjE2qy/P?=
 =?iso-8859-1?Q?96tB4v8DCrviXEmdB77yehww7QnG08JfiUUOBgu3TlYWKpZIGAOcbLbsW6?=
 =?iso-8859-1?Q?mLoC2FUCZ1XPQYlhTSDzyfRPiMT8m3oiDDbU+noQA3zNve7J8/JCxBdldQ?=
 =?iso-8859-1?Q?MtwWUMC3fsJuRY0f1BQOlnkmHKEXe4tedkoxe0Pnpv2hFvdyD6K+YBv/Jp?=
 =?iso-8859-1?Q?cICvbtz5PcQytF03UZq9WDw07hkvDD1gjxJmuBBfK2uhLJWyJYIkMkKKfj?=
 =?iso-8859-1?Q?N+LkNPNFxrU9fCrWS8YI6pqWw0mTlSZO+ktd4Li+1Ssv+G7V3l5wex+Gfq?=
 =?iso-8859-1?Q?HuSVpKsCP/bGar2YuRm8hbGPIw+xKzoNs4xz9+7df5q+XoLhuxw5ugGw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 748368bc-d41b-444f-319c-08dd9422e8d1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:39:41.3463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FXAsCbsA5uYxCZ84YEOlYaHyDQpPg+eYyYc77s9wkIxEpsKZpOsoasdr05HnY423/LWndHiR0lMj3Bbm5XdE0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5248
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 3.2% improvement of stress-ng.personality.ops_per_sec on:


commit: e43b8bb56e537bfc8d9076793091e7679020fc9c ("entry: Inline syscall_exit_to_user_mode()")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git core/entry


testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: personality
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.context.swapcontext_calls_per_sec 2.1% improvement        |
| test machine     | 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory |
| test parameters  | cpufreq_governor=performance                                                   |
|                  | nr_threads=100%                                                                |
|                  | test=context                                                                   |
|                  | testtime=60s                                                                   |
+------------------+--------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250516/202505160902.c72854e8-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-icl-2sp7/personality/stress-ng/60s

commit: 
  7ace1602ab ("LoongArch: entry: Migrate ret_from_fork() to C")
  e43b8bb56e ("entry: Inline syscall_exit_to_user_mode()")

7ace1602abf21da5 e43b8bb56e537bfc8d907679309 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      6.44 ±100%      -6.4        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.personality
      6.84 ±100%      -6.8        0.00        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      5.76 ±100%      -5.8        0.00        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
 3.346e+08            +3.2%  3.455e+08        stress-ng.personality.ops
   5577357            +3.2%    5758223        stress-ng.personality.ops_per_sec
      1278            +1.5%       1297        stress-ng.time.user_time
      1.31            +3.5%       1.36        perf-stat.i.cpi
  1.48e+11            -3.1%  1.435e+11        perf-stat.i.instructions
      0.76            -3.4%       0.74        perf-stat.i.ipc
      1.31            +3.5%       1.36        perf-stat.overall.cpi
      0.76            -3.4%       0.74        perf-stat.overall.ipc
 1.456e+11            -3.1%  1.411e+11        perf-stat.ps.instructions
 8.985e+12            -3.6%  8.659e+12        perf-stat.total.instructions
      0.97 ±111%     -99.9%       0.00 ±141%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      1.55 ±  4%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.30 ±103%     -99.9%       0.00 ±141%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
      5.64 ± 25%    -100.0%       0.00        perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.42 ± 37%     +49.9%       3.62 ±  4%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
    698.88 ± 15%     -40.0%     419.17 ± 20%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      3.61 ± 12%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3781 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    504.70 ± 98%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    698.87 ± 15%     -40.0%     419.16 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.06 ± 23%    -100.0%       0.00        perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    502.38 ± 98%    -100.0%       0.00        perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]


***************************************************************************************************
lkp-gnr-2ap2: 384 threads 2 sockets Intel(R) Xeon(R) 6972P (Granite Rapids) with 128G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2ap2/context/stress-ng/60s

commit: 
  7ace1602ab ("LoongArch: entry: Migrate ret_from_fork() to C")
  e43b8bb56e ("entry: Inline syscall_exit_to_user_mode()")

7ace1602abf21da5 e43b8bb56e537bfc8d907679309 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     49055 ±  2%      -4.1%      47032        proc-vmstat.pgreuse
     96.00 ± 19%     -42.5%      55.17 ± 37%  sched_debug.cpu.nr_uninterruptible.max
      4.04 ± 70%      -4.0        0.00        perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.swapcontext
      4.25 ± 70%      -4.2        0.00        perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.55 ± 70%      -3.6        0.00        perf-profile.self.cycles-pp.syscall_exit_to_user_mode
 1.047e+08            +2.1%  1.069e+08        stress-ng.context.ops
   1745421            +2.1%    1781401        stress-ng.context.ops_per_sec
   4541476            +2.1%    4636071        stress-ng.context.swapcontext_calls_per_sec
      9344            -1.6%       9196        stress-ng.time.system_time
     13524            +1.1%      13679        stress-ng.time.user_time
      0.06 ± 11%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     10.75 ± 79%    -100.0%       0.00        perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.91 ± 97%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3274 ±  2%    -100.0%       0.00        perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    512.24 ± 95%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.86 ±104%    -100.0%       0.00        perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    505.95 ± 97%    -100.0%       0.00        perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
 1.173e+11            -3.6%   1.13e+11        perf-stat.i.branch-instructions
      1.49            +0.1        1.57        perf-stat.i.branch-miss-rate%
 1.727e+09            +2.3%  1.767e+09        perf-stat.i.branch-misses
      2.10            +4.2%       2.19        perf-stat.i.cpi
 6.241e+11            -3.6%  6.019e+11        perf-stat.i.instructions
      0.48            -4.2%       0.46        perf-stat.i.ipc
      1.47            +0.1        1.56        perf-stat.overall.branch-miss-rate%
      2.11            +4.0%       2.19        perf-stat.overall.cpi
      0.47            -3.9%       0.46        perf-stat.overall.ipc
 1.154e+11            -3.6%  1.112e+11        perf-stat.ps.branch-instructions
 1.698e+09            +2.3%  1.738e+09        perf-stat.ps.branch-misses
 6.136e+11            -3.5%  5.919e+11        perf-stat.ps.instructions
 3.804e+13            -4.6%  3.628e+13        perf-stat.total.instructions





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

