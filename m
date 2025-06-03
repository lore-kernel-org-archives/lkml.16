Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0F2233D7C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748958519; cv=fail; b=ReC63ezbU4Uv7IOhhj5/MpZB5HDe0jM0Pg6Kqb9dqIJ200SVKBuGlKHYJsNIOef3kBJl0VctbJ5O6oFW1jsz4f1fwtkEvHtnwaI939VQEj3ut+77CUMRdZfF/RTfvNpLg+1kPxPeJAl83YAZhj68MRupXadg7lbKDnQFa2IIzAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748958519; c=relaxed/simple;
	bh=ROCQWbgT/L5DCeK3nxNEsTFMie+lbUbpaJ/CUVlzbTs=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=YeQBzxHEVlw7jspuMIvdPKYx2Cax5Ses6gGj3iWt0Hn4nlkXaeEt3So0z55TAkj3n1z1ECf313Gb6F3z2biygux+Yh/hDJgJwHPDPwr+yMEdeR7kzGgC92pzuJhy/6Jz1EGTFrRC43765V+X+Vv2Ex85PHknggel5QvZumiSOxw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxoOO91h; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxoOO91h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748958514; x=1780494514;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=ROCQWbgT/L5DCeK3nxNEsTFMie+lbUbpaJ/CUVlzbTs=;
  b=AxoOO91hm8L1q2GEYu4mTp2MXAavlTrc+XAZxPz4cR9mY7E1OSwzt7e7
   hA6idGu05uqb9c2YKtEyUhIp5aRqRG2Ef7HK11yGOG5JUcycBJy1TP/sb
   9ZccaC3pCmOqLf7oMY+G2a9fE2KRQ7v/uEt+F1QoiTnoO7Tihx3CkXLzx
   V9g7+QFQBCw/3j1+1HmEh+FN+XDWKLT7yizM7BItTm8I3ahAToXVcfORx
   adB7DIdh2yW+TCRNNYZLxklijBx98i2ZwACIdcT0oQDLtrOTrh98UD9e4
   gh36ct+NxMu0LAmcJPmNaM7u39moVqPCFPNSpam4lWMALJ7uKVo/RwQ39
   g==;
X-CSE-ConnectionGUID: xTrCYdENTFCrEypNCaqg5g==
X-CSE-MsgGUID: zz2O6dTLSNiPFRzg+MfT5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="54792066"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="54792066"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 06:48:31 -0700
X-CSE-ConnectionGUID: 2JthBVRfQWmxvb9pQNQqoA==
X-CSE-MsgGUID: aFKWZQ7eR4mmeM+pbZj9hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; 
   d="scan'208";a="168053090"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 06:48:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 06:48:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 06:48:30 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 06:48:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQDSNq/DDULp3aTMjOqJP0vyEDBA/RR/D9+VFRAGDOyN7zIPWhaEOg9JG/Q4LVh57BHddbHHRsYvJBVs6bPPP4abLFLA038XPzHPPuuzoHcu2RhLb36+pQTSxJ9oOUUrXC4klo0Zqvql57CbsJObWjGjjCzr/TKn7vxeh1ouoUbHyVc3b9ccBCNrrD9Un0u7s310OhqtNs686uCObjOWYxHNnrwo47Nj3Xg6dxWt0y74DXinSdkvgDD5brikFMF5bQM5XEQNUIFZK7K8IFXdV+MtZR/m+mi7cN4K0EIs+noUy3wkfihHHD7SvXnRUd6pW9A/YUSnOdYe6oOo+PF7tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BCMIdyS25GcqL2Tull53+smbLEC9mDwiWffTEyb5+Pc=;
 b=Pj0Zc1yxptzplAeeLjYgpuIDqSOwLViyBl9Mdol44GeNwwEVRBUI9piCwYRCuawOwGzlYnN66KjdD0EQVHDVI86NRpD4Ep31iqqQoNaQTGyPg00Gl//jbxe4D+PKSbZD4D/ZCGb63S5cJK2L7uNWLLGw9Y7u0DC+TPg0TvD3D9yMhPif4NFIWOYWABbTr9e76QVbqHAyDvGvSe+842Sm3mWp1xBlHNmQDYb5KEb8c/qAfU/IAlpsqCWilJkUh1XJFqKiAHwvbewrrqhK28O/d3/j8tWtLfmBoPxrCV2+31/mtEZVxz6Exiqny1MQBi5SloiaKdGYit0wnlpxofCcNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS0PR11MB6471.namprd11.prod.outlook.com (2603:10b6:8:c1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:48:27 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 13:48:26 +0000
Date: Tue, 3 Jun 2025 21:48:19 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Chris Mason <clm@meta.com>,
	<linux-kernel@vger.kernel.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <oliver.sang@intel.com>
Subject: [peterz-queue:sched/core] [sched/deadline]  7bca60ce65:
 will-it-scale.per_process_ops 63.0% regression
Message-ID: <202506032142.4f7b26c9-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CYXP220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::8) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS0PR11MB6471:EE_
X-MS-Office365-Filtering-Correlation-Id: b23fabca-50f6-4e1b-ed19-08dda2a55099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iDOKP72W+qZypADtr8LPhLwSmTOusxqsktcI9hcmdyErvRGm2OluBAD29e?=
 =?iso-8859-1?Q?FhNxNHvJEJX1sM6o4A6WzCEvnkEzMH+Z++qtU75eItqm6tbvvr+myk3Dgk?=
 =?iso-8859-1?Q?x8CIOQdpkSF/YlEtME/Httfa5Sk6NIyaCjS+7YJkaPDClvE91ms/LBwUWQ?=
 =?iso-8859-1?Q?0ECAEp991i/CNJoMNivphkpLogvgwZr6aNL7bm9g8WSz9cbIdd2eYYCimv?=
 =?iso-8859-1?Q?bkmSaL7+ci0MryoY8PTvC6recmI6nTQpOcOsWGB7hdwAh0fjKvSukNWQxC?=
 =?iso-8859-1?Q?JPXhgnSRIhPe2qI5l+RhQ/iBv7ZsofpOHmrAgkbNdM5eU/Tf3A5SpCAHyK?=
 =?iso-8859-1?Q?3dsthW8Gm+pIkQu+Ukslfrtw7037tZWCQ+9O3+oqIVDflN/nKinxZP7wQq?=
 =?iso-8859-1?Q?04wbTHvh1iJWAatj1hSA3CnOQe72Y2L2p7E1xvX486q43Oq8o8n9smfD0/?=
 =?iso-8859-1?Q?Gi0fIsXubHeMVXC7K4LRsCJSdadE097kJ3y0YjN6veKO5QmBuoekQO+D9z?=
 =?iso-8859-1?Q?l/4VWuPL9ri2tq7jcuz5IHIr2lQiwhR3nXn2I7poxNyYYYN99uWZkB6S0Z?=
 =?iso-8859-1?Q?7755buB6QP1bnOot2d18pIYPsXWj4Fyhwyvhkuwj2PN5bpLzUh+5Q0up18?=
 =?iso-8859-1?Q?Lbf7per0woR7WrfMZdlWTTCGBFxExFZMlKCZnlbI0CSHkJwtoUcTP3YZi+?=
 =?iso-8859-1?Q?XZjWAOh+PSK48Sns+/mXViZqeXoJuhOcNkf50vADF4gVuaKWK9KjRMrsl4?=
 =?iso-8859-1?Q?JfIHBsyYVSF4RkY8eJsUVGPCAemuiiIQuaS7TJaMp09MhSORGdYxRsxquh?=
 =?iso-8859-1?Q?U7ntpt/iLGQ8bcfBwQBN8qlYenNK1qSBXNma47jL2xlKa0PKXBewJV2Ih/?=
 =?iso-8859-1?Q?CVDUffjrX0PvKtIhkroBO50s/YECM5YY3SU/+swKleYpNdJPZPEc4EjNQh?=
 =?iso-8859-1?Q?elSwKI2Gi+EWgywduxnIOZFJilXfru5+MEYiIl8UvWgYXzcQT/h+pGAQak?=
 =?iso-8859-1?Q?niLLKk3HrjcIpPwo4yvPNFTXCRkOU1OFApyWkPPBxv4nlYctx3Gf7S+Ruv?=
 =?iso-8859-1?Q?ZRoyYCSHqSoP4OwpoNNx2pnQcMWcvV7J/hHqSoBovxPGCRCmN9z3sicFwt?=
 =?iso-8859-1?Q?9j28bE5nyaKMDcyovTU2dh3+xFb6oc2Ep35J5sCp1fniw+fQbru+23qAyb?=
 =?iso-8859-1?Q?i2qqwHQvErkP6/rldKbuPU0GXb+I1J9AhMIUvEVjlpP/fX+VUZMjppb+Jw?=
 =?iso-8859-1?Q?0/ZkTYFSMQnq0I3KWt/3ZzQcZDJJxMHLZYxuZ6WCyq79JaIBovZlR+Azpl?=
 =?iso-8859-1?Q?G28NgaqrwZeLdNoKSny6QUQaLZdGt0r5wC+V+sU5Hx58RMvtSURj8sNxYd?=
 =?iso-8859-1?Q?VsbkmhbXfY2Ov1qu0Q+qdCRf6G0cjHOPE6S+k4++tTwbIX5dk/3e7v12nT?=
 =?iso-8859-1?Q?Ja08LL3GH8W+zSoh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?15aeepJ2cMoK8vK1sPh05Wmlbl5YoMWjOEmBDCh6PYSWIt4j8SRlwRx9+k?=
 =?iso-8859-1?Q?XaUwsSX1dmDTCxAq5m6Cj45DSxvFOeko73xsFpgTysPh4r9mTclxY4Byl5?=
 =?iso-8859-1?Q?iD5KD4e9iCJxRvyod6O1nNvUaGZz9G0WvEOcWTuBOUJeTLhzPRBGWvzZPY?=
 =?iso-8859-1?Q?90OCctWzF3DcimvjjN41Y5+I/r7lv5nrQMLIfjSPAGH/nJV1ulkJCt0cTk?=
 =?iso-8859-1?Q?FQljP17lJEdygla1gUDE0t8L/3swLEJLQaPFWj+y/oah1Mxm/0b7iu+xP6?=
 =?iso-8859-1?Q?1diKqwTW2TrFQd6cVFmbG1ncoCs9UpprGsOAQNvRBjugb/Xg1+vQ+CjCoB?=
 =?iso-8859-1?Q?1opq2d3DoL6CdOYQJq1OdHMt1U0QxGnbazE6pa8DY69+KyfqA2PqREAml8?=
 =?iso-8859-1?Q?8ZgzxEi0mD1T2JTJjILyAG4/MCvQfn8ajrmrZC5AKET+Xw3Ua9sB4tlQj3?=
 =?iso-8859-1?Q?EdX9iOngKVXjMFtPX61ArEnqvHSVr+2Vw0RDRG8cUHC4V854/PH/gdS0G3?=
 =?iso-8859-1?Q?FmTC8tt5T/kh5w8BEbDTULVEgZW73Y3AKPhAE8HcarE0m54lvAHhP4JnBg?=
 =?iso-8859-1?Q?v5M9gsk+orjlMh+mH/zdRBlpdT7PRVTs8OECWl2g+OO3t/AOAMwZhLd1Y8?=
 =?iso-8859-1?Q?TjbSCz92TeovHfNiUdPgYP/M568NVwRrHznab39NgXtLHBLH459FuqEDln?=
 =?iso-8859-1?Q?HloJE29dmzolEclGZJ7TrdBaVczIKmuR3++JgDyFy6EOm3GBZZquVEeBW4?=
 =?iso-8859-1?Q?8m4whj2ZDHMQTmHzNPTYkNTCjS/ALydM64OVhvsS7tELQLrhxBXH5YjUPc?=
 =?iso-8859-1?Q?4NzIkQELMxyWf0Zaz6oS1sP0QuTlaHk4fwTHgneiqOPb+uHNLFmuxnDda/?=
 =?iso-8859-1?Q?ZXlAPUmbNZuqsXsmmwknvpmi+JcCSZ3s8pYFMfTldTpw5XyyBflHluhbJy?=
 =?iso-8859-1?Q?5/r12UIicBGzlZKwgLw+aPUSKE6WCs5IBmZgnYDqLc+RWLalTlpThNagFo?=
 =?iso-8859-1?Q?/qayen/JsmJBp7Xb/60KBn5Q7FdMnWNnSpxTN0bZYJs+hdQtWxM+bTCD8B?=
 =?iso-8859-1?Q?nx+6nRHLM/OWhmifhag5Xj2reo125uS4nS/yz9bmb+AJrpar3DiBP24GX1?=
 =?iso-8859-1?Q?C+R3OmHOh4d4D18U0QKGiG/0RZusjzvP/Wyw8vN5ghEww0k/q6ThtOD3Ja?=
 =?iso-8859-1?Q?NixDs1n2gz/Tmq+RL6Fa2Si8X8FUHE7FwfvFq9s9XV7G9t+NJvFS2A8e3h?=
 =?iso-8859-1?Q?acF0Hf0d1jV+H10t05Cpp+cvX0ELGqhR8GUbu3JLtxQwkiKyB1VFro7ELe?=
 =?iso-8859-1?Q?qb/YItaBYv/1zh9Dsjak6r4N2QCdjHFH7v/S2k1dAmLLrFcYqivDgNlWAg?=
 =?iso-8859-1?Q?33+SR1rGNjc3t6QL9lan/b9CoI/DiVfnkGRTjJguGeo3G2yCOtpn+RQ5Mg?=
 =?iso-8859-1?Q?OhkrxZoHCDSA8M8kAQS6Mexv+Frk7L/HjsTGc5iIFt6O/EFAt8++L9WX2T?=
 =?iso-8859-1?Q?HFmqfxBpo7dyibDUkMUb+xLilWt1nuTyy8CwCtYlSyLCBqUvtvQKVRe21O?=
 =?iso-8859-1?Q?NUgUrCIE2AWmIcotkj20lP77LXjfWrmQzyQIaUNG9cCe12mfBDtnhQRojC?=
 =?iso-8859-1?Q?7oa6kHF8nwp1O54BW0IB8AldsZhH3xwRHusSQ9zT1mMcLaCJLvpEji/g?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b23fabca-50f6-4e1b-ed19-08dda2a55099
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 13:48:26.8580
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCWss2sBsuxEQhie6hUlELwGlPUmbI80xKf197sCiZnhh3txxlSIL5M5kKUPaSOkRiMyvgjix7ipvKSKWKYICQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6471
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 63.0% regression of will-it-scale.per_process_ops on:


commit: 7bca60ce656978b01caafc4e2285272ae9631953 ("sched/deadline: Less agressive dl_server handling")
https://git.kernel.org/cgit/linux/kernel/git/peterz/queue.git sched/core

testcase: will-it-scale
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 256 threads 2 sockets Intel(R) Xeon(R) 6767P  CPU @ 2.4GHz (Granite Rapids) with 256G memory
parameters:

	nr_task: 100%
	mode: process
	test: pwrite2
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.min-nanosleep.ops_per_sec 8.0% improvement                             |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=min-nanosleep                                                                          |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.rawudp.packets_32_bytes_received_per_sec 45.9% improvement             |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=rawudp                                                                                 |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.membarrier.ops_per_sec 18.2% improvement                               |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=membarrier                                                                             |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.timer.ops_per_sec 265.1% improvement                                   |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=timer                                                                                  |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202506032142.4f7b26c9-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250603/202506032142.4f7b26c9-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/process/100%/debian-12-x86_64-20240206.cgz/lkp-gnr-2sp3/pwrite2/will-it-scale

commit: 
  032e1003ad ("sched: Make clangd usable")
  7bca60ce65 ("sched/deadline: Less agressive dl_server handling")

032e1003ad358e4c 7bca60ce656978b01caafc4e228 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     62171           +33.9%      83247 ±  4%  uptime.idle
 2.143e+09          +986.3%  2.328e+10 ± 16%  cpuidle..time
   5220618 ± 13%    +300.1%   20887937 ± 10%  cpuidle..usage
   9915050 ± 10%     -17.6%    8167082 ±  6%  meminfo.DirectMap2M
   1378641           -15.6%    1164078 ±  4%  meminfo.Shmem
     22480 ±  5%     -17.7%      18493 ±  2%  perf-c2c.DRAM.remote
     14405 ±  7%     -19.3%      11619        perf-c2c.HITM.remote
     32559 ±  5%     -14.0%      28016 ±  2%  perf-c2c.HITM.total
    522414           -63.0%     193394 ± 13%  will-it-scale.256.processes
      2.23 ±  2%   +1197.8%      28.98 ± 16%  will-it-scale.256.processes_idle
      2040           -63.0%     754.83 ± 13%  will-it-scale.per_process_ops
    522414           -63.0%     193394 ± 13%  will-it-scale.workload
      2.73 ±  2%     +26.6       29.35 ± 16%  mpstat.cpu.all.idle%
      0.48            +0.7        1.13 ±  6%  mpstat.cpu.all.irq%
      0.01 ±  5%      +0.1        0.09 ± 19%  mpstat.cpu.all.soft%
     96.71           -27.4       69.35 ±  6%  mpstat.cpu.all.sys%
     99.21           -26.1%      73.30 ±  8%  mpstat.max_utilization_pct
      3.15 ±  4%    +843.3%      29.74 ± 16%  vmstat.cpu.id
     96.77           -27.5%      70.18 ±  6%  vmstat.cpu.sy
    226.34           -20.5%     179.86 ±  6%  vmstat.procs.r
     44868 ± 12%    +164.0%     118461 ± 14%  vmstat.system.cs
    338462            -9.1%     307666 ±  6%  vmstat.system.in
    554522            -9.6%     501067 ±  2%  proc-vmstat.nr_inactive_anon
   1227403            -4.4%    1173704        proc-vmstat.nr_mapped
    127426            -1.3%     125816        proc-vmstat.nr_slab_reclaimable
    344630           -15.6%     290933 ±  4%  proc-vmstat.nr_writeback_temp
    554522            -9.6%     501067 ±  2%  proc-vmstat.nr_zone_active_anon
     10697 ± 27%    +133.3%      24951 ± 15%  proc-vmstat.numa_hint_faults
   1539573            -5.9%    1449401        proc-vmstat.numa_interleave
   1914686            -3.5%    1847747        proc-vmstat.pgalloc_dma32
 4.307e+10           -25.7%    3.2e+10 ±  5%  perf-stat.i.branch-instructions
      0.02            +0.0        0.03 ±  5%  perf-stat.i.branch-miss-rate%
     37.57 ±  2%      -4.4       33.13 ±  2%  perf-stat.i.cache-miss-rate%
  24711200 ±  2%     -24.3%   18713324 ±  8%  perf-stat.i.cache-misses
  69291497 ±  5%     -16.8%   57684629 ±  8%  perf-stat.i.cache-references
     45155 ± 12%    +165.4%     119829 ± 14%  perf-stat.i.context-switches
      4.16            -2.8%       4.04        perf-stat.i.cpi
 8.973e+11           -27.7%  6.483e+11 ±  6%  perf-stat.i.cpu-cycles
 2.153e+11           -25.7%  1.599e+11 ±  5%  perf-stat.i.instructions
      0.24            +2.9%       0.25        perf-stat.i.ipc
      0.01            +0.0        0.02 ±  7%  perf-stat.overall.branch-miss-rate%
     35.74 ±  4%      -3.9       31.80 ±  3%  perf-stat.overall.cache-miss-rate%
      4.17            -2.7%       4.05        perf-stat.overall.cpi
      0.24            +2.8%       0.25        perf-stat.overall.ipc
 1.242e+08          +103.6%  2.529e+08 ± 11%  perf-stat.overall.path-length
 4.292e+10           -25.7%  3.191e+10 ±  5%  perf-stat.ps.branch-instructions
  24658370 ±  2%     -24.0%   18732132 ±  8%  perf-stat.ps.cache-misses
  69159431 ±  5%     -14.7%   59026367 ±  9%  perf-stat.ps.cache-references
     44956 ± 12%    +164.5%     118893 ± 14%  perf-stat.ps.context-switches
 8.943e+11           -27.7%  6.466e+11 ±  6%  perf-stat.ps.cpu-cycles
 2.146e+11           -25.7%  1.594e+11 ±  5%  perf-stat.ps.instructions
 6.488e+13           -25.6%  4.825e+13 ±  5%  perf-stat.total.instructions
  36962481           -46.0%   19945596 ± 15%  sched_debug.cfs_rq:/.avg_vruntime.avg
  37099616           -24.3%   28080467 ±  8%  sched_debug.cfs_rq:/.avg_vruntime.max
  32455889 ±  4%     -87.4%    4074413 ± 13%  sched_debug.cfs_rq:/.avg_vruntime.min
    320613 ± 30%   +3264.0%   10785304 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.77 ±  2%     -22.7%       0.60 ±  7%  sched_debug.cfs_rq:/.h_nr_queued.avg
      1.81 ±  6%     -38.5%       1.11 ± 16%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.25 ± 14%     +57.4%       0.40 ±  8%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.77 ±  2%     -22.7%       0.60 ±  7%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      1.81 ±  6%     -43.1%       1.03 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.25 ± 14%     +57.6%       0.40 ±  8%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
      1.67 ± 14%     -80.0%       0.33 ± 40%  sched_debug.cfs_rq:/.load_avg.min
  36962481           -46.0%   19945596 ± 15%  sched_debug.cfs_rq:/.min_vruntime.avg
  37099616           -24.3%   28080467 ±  8%  sched_debug.cfs_rq:/.min_vruntime.max
  32455889 ±  4%     -87.4%    4074413 ± 13%  sched_debug.cfs_rq:/.min_vruntime.min
    320613 ± 30%   +3264.0%   10785304 ±  5%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.77 ±  2%     -22.3%       0.60 ±  7%  sched_debug.cfs_rq:/.nr_queued.avg
      0.24 ± 13%     +67.1%       0.40 ±  8%  sched_debug.cfs_rq:/.nr_queued.stddev
    781.09           -25.1%     584.71 ±  8%  sched_debug.cfs_rq:/.runnable_avg.avg
      1446 ±  9%     -28.5%       1033 ±  6%  sched_debug.cfs_rq:/.runnable_avg.max
    419.36 ± 12%     -83.6%      68.78 ± 39%  sched_debug.cfs_rq:/.runnable_avg.min
    100.55 ±  4%    +238.4%     340.26 ±  7%  sched_debug.cfs_rq:/.runnable_avg.stddev
    779.02           -25.0%     584.31 ±  9%  sched_debug.cfs_rq:/.util_avg.avg
      1232 ±  7%     -18.4%       1005 ±  2%  sched_debug.cfs_rq:/.util_avg.max
    382.89 ± 18%     -83.2%      64.39 ± 40%  sched_debug.cfs_rq:/.util_avg.min
     94.04 ±  4%    +261.5%     339.97 ±  7%  sched_debug.cfs_rq:/.util_avg.stddev
    736.25 ±  2%     -25.7%     547.37 ±  9%  sched_debug.cfs_rq:/.util_est.avg
      1379 ± 13%     -28.6%     984.69 ±  2%  sched_debug.cfs_rq:/.util_est.max
    224.52 ± 14%     +73.9%     390.37 ±  7%  sched_debug.cfs_rq:/.util_est.stddev
    711444 ±  6%     +28.6%     914604        sched_debug.cpu.avg_idle.avg
    325251 ±  3%     -30.9%     224817 ±  7%  sched_debug.cpu.avg_idle.stddev
    483.08          +228.2%       1585 ± 30%  sched_debug.cpu.clock_task.stddev
      4766 ±  2%     -22.4%       3697 ±  7%  sched_debug.cpu.curr->pid.avg
      8228 ±  8%     +18.1%       9717        sched_debug.cpu.curr->pid.max
      1453 ± 13%     +69.5%       2464 ±  8%  sched_debug.cpu.curr->pid.stddev
      0.00 ±  6%     +17.8%       0.00 ±  9%  sched_debug.cpu.next_balance.stddev
      0.77 ±  2%     -23.1%       0.59 ±  7%  sched_debug.cpu.nr_running.avg
      1.78 ±  8%     -37.5%       1.11 ± 16%  sched_debug.cpu.nr_running.max
      0.25 ± 13%     +57.6%       0.40 ±  8%  sched_debug.cpu.nr_running.stddev
     27430 ± 11%    +154.7%      69851 ± 14%  sched_debug.cpu.nr_switches.avg
     12269 ±  6%     -87.3%       1561 ± 10%  sched_debug.cpu.nr_switches.min
     17965 ± 43%    +441.4%      97256 ± 24%  sched_debug.cpu.nr_switches.stddev
      0.07 ± 30%    +248.0%       0.25 ± 19%  sched_debug.cpu.nr_uninterruptible.avg
      0.02 ±104%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.09 ±  8%     +28.4%       0.11 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.07 ±169%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 22%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.00 ± 19%    +288.9%       0.01 ± 27%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      0.07 ± 51%     -97.7%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      0.03 ± 85%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.19 ± 17%     -96.5%       0.01 ± 10%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.02 ±139%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.09 ± 33%     -99.1%       0.01 ± 26%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.04 ± 43%     -82.8%       0.01 ± 12%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.02 ± 74%     -84.6%       0.00 ± 11%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.10 ± 42%     -90.3%       0.01 ± 10%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.02 ± 75%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.01 ± 48%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.03 ±168%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ± 17%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.66 ±  5%     -90.0%       0.07 ± 68%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      0.21 ± 30%     -95.7%       0.01 ± 49%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.02 ± 18%     -76.4%       0.01 ± 13%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.07 ± 61%     -90.4%       0.01 ± 15%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
      0.01 ± 16%  +24449.4%       3.31 ±220%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.01 ±139%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.36 ±203%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.02 ± 26%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.01 ± 35%    +216.3%       0.02 ± 97%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      3.59 ±  7%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.52 ±100%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      2.48 ± 19%     -99.6%       0.01 ± 20%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.13 ±201%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      2.41 ± 44%     -99.4%       0.02 ± 29%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3.35 ± 23%     -99.1%       0.03 ± 31%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      2.82 ± 26%     -58.6%       1.17 ± 39%  perf-sched.sch_delay.max.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      2.37 ± 33%     -98.3%       0.04 ± 46%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.05 ± 84%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.15 ± 84%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.44 ±194%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.02 ± 42%    -100.0%       0.00        perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.13 ± 61%     -94.3%       0.01 ±135%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      3.64 ±  5%     -76.5%       0.86 ± 43%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      3.32 ± 18%     -94.3%       0.19 ±194%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      2.84 ± 12%     -98.5%       0.04 ± 15%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      2.37 ± 48%     -98.9%       0.03 ± 48%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      1.58 ± 61%     -99.0%       0.02 ±  7%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     14.39 ±  8%     -41.5%       8.42 ±  9%  perf-sched.total_wait_and_delay.average.ms
    110674 ±  7%    +111.8%     234429 ±  8%  perf-sched.total_wait_and_delay.count.ms
      4196 ±  4%     -17.8%       3448 ± 12%  perf-sched.total_wait_and_delay.max.ms
     14.36 ±  8%     -41.5%       8.40 ±  9%  perf-sched.total_wait_time.average.ms
      4196 ±  4%     -17.8%       3448 ± 12%  perf-sched.total_wait_time.max.ms
    103.13 ± 33%     +97.9%     204.04 ±  2%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     40.08 ± 58%     -51.0%      19.63 ±  2%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.36 ± 15%    +403.1%       1.83 ± 14%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.shmem_file_write_iter
    655.89 ±  2%     -10.9%     584.12 ±  5%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    403.33 ± 64%     -99.3%       2.83 ± 89%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    439.00 ± 38%     -55.0%     197.67 ±  2%  perf-sched.wait_and_delay.count.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    871.17 ± 39%     +63.0%       1419 ±  2%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    102542 ±  7%    +121.9%     227581 ±  9%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.shmem_file_write_iter
    653.50 ±  2%     -72.0%     183.17 ±141%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1944           +13.7%       2211 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    439.50 ±  4%     -35.6%     283.00 ± 12%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1.19 ±145%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.01 ± 65%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 22%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      2.52 ± 28%    +115.7%       5.45 ± 12%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
      4.99 ±132%    +713.8%      40.64 ± 70%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.perf_poll.do_poll.constprop
     83.35 ±223%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
    103.08 ± 33%     +97.9%     204.03 ±  2%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     40.06 ± 58%     -51.0%      19.63 ±  2%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.10 ±128%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.05 ± 85%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.04 ±125%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ± 48%    -100.0%       0.00        perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      1.55 ± 39%    +184.1%       4.40 ± 27%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.34 ± 16%    +431.0%       1.82 ± 15%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.shmem_file_write_iter
      0.93 ± 17%     -30.3%       0.65 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      7.37 ±  2%     +13.2%       8.34 ±  4%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    655.87 ±  2%     -11.4%     580.80 ±  4%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     80.44 ±140%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_mpol_noprof.shmem_alloc_folio
      0.02 ± 58%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.02 ± 26%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    174.94 ±211%     -95.6%       7.61 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.shmem_get_folio_gfp.shmem_write_begin.generic_perform_write.shmem_file_write_iter
    166.80 ±223%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.28 ±133%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      0.82 ± 97%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.70 ±120%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.05 ±110%    -100.0%       0.00        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
    334.66 ±141%     -99.9%       0.21 ±220%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
      9.25 ±103%     -71.0%       2.68 ±  9%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     98.80            -1.8       97.02        perf-profile.calltrace.cycles-pp.osq_lock.rwsem_down_write_slowpath.down_write.shmem_file_write_iter.vfs_write
     99.20            -1.0       98.24        perf-profile.calltrace.cycles-pp.rwsem_down_write_slowpath.down_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64
     99.22            -0.9       98.29        perf-profile.calltrace.cycles-pp.down_write.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64
     99.59            -0.6       99.02        perf-profile.calltrace.cycles-pp.shmem_file_write_iter.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe
     99.60            -0.6       99.03        perf-profile.calltrace.cycles-pp.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     99.60            -0.6       99.03        perf-profile.calltrace.cycles-pp.vfs_write.__x64_sys_pwrite64.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     99.65            -0.5       99.12        perf-profile.calltrace.cycles-pp.__libc_pwrite
     99.64            -0.5       99.12        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_pwrite
     99.64            -0.5       99.12        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_pwrite
      0.51            +0.9        1.43 ±  6%  perf-profile.calltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_down_write_slowpath.down_write.shmem_file_write_iter
      0.00            +1.2        1.15 ±  6%  perf-profile.calltrace.cycles-pp.update_process_times.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt
      0.00            +1.2        1.20 ±  6%  perf-profile.calltrace.cycles-pp.tick_nohz_handler.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
      0.00            +1.2        1.21 ±  6%  perf-profile.calltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
      0.00            +1.4        1.38 ±  6%  perf-profile.calltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock
      0.00            +1.4        1.38 ±  6%  perf-profile.calltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_down_write_slowpath
      0.00            +1.4        1.41 ±  6%  perf-profile.calltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.osq_lock.rwsem_down_write_slowpath.down_write
     98.82            -1.8       97.04        perf-profile.children.cycles-pp.osq_lock
     99.20            -1.0       98.24        perf-profile.children.cycles-pp.rwsem_down_write_slowpath
     99.23            -0.9       98.29        perf-profile.children.cycles-pp.down_write
     99.60            -0.6       99.03        perf-profile.children.cycles-pp.__x64_sys_pwrite64
     99.66            -0.5       99.12        perf-profile.children.cycles-pp.__libc_pwrite
     99.70            -0.5       99.20        perf-profile.children.cycles-pp.shmem_file_write_iter
     99.71            -0.5       99.22        perf-profile.children.cycles-pp.vfs_write
     99.78            -0.4       99.33        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     99.77            -0.4       99.33        perf-profile.children.cycles-pp.do_syscall_64
      0.02 ±141%      +0.0        0.06 ±  9%  perf-profile.children.cycles-pp.shmem_get_folio_gfp
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.06 ±  8%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.wake_q_add
      0.05            +0.1        0.12 ± 18%  perf-profile.children.cycles-pp.shmem_write_end
      0.00            +0.1        0.06 ± 17%  perf-profile.children.cycles-pp.sched_ttwu_pending
      0.20 ±  4%      +0.1        0.27 ± 10%  perf-profile.children.cycles-pp.copy_page_from_iter_atomic
      0.10 ± 13%      +0.1        0.17 ± 19%  perf-profile.children.cycles-pp.perf_mmap__read_head
      0.00            +0.1        0.07 ± 18%  perf-profile.children.cycles-pp.idle_cpu
      0.06 ±  6%      +0.1        0.13 ±  6%  perf-profile.children.cycles-pp.clockevents_program_event
      0.09 ± 12%      +0.1        0.17 ± 18%  perf-profile.children.cycles-pp.ring_buffer_read_head
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp.raw_spin_rq_lock_nested
      0.00            +0.1        0.08 ±  8%  perf-profile.children.cycles-pp._raw_spin_lock
      0.00            +0.1        0.08 ± 13%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      0.00            +0.1        0.09 ± 12%  perf-profile.children.cycles-pp.kick_ilb
      0.06            +0.1        0.15 ±  3%  perf-profile.children.cycles-pp.get_jiffies_update
      0.06            +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.tmigr_requires_handle_remote
      0.00            +0.1        0.10 ± 19%  perf-profile.children.cycles-pp.folio_unlock
      0.05            +0.1        0.15 ±  5%  perf-profile.children.cycles-pp.ktime_get
      0.00            +0.1        0.10 ±  7%  perf-profile.children.cycles-pp.update_curr
      0.00            +0.1        0.11 ± 26%  perf-profile.children.cycles-pp._nohz_idle_balance
      0.23 ±  3%      +0.1        0.36 ±  7%  perf-profile.children.cycles-pp.rwsem_spin_on_owner
      0.00            +0.1        0.12 ±  4%  perf-profile.children.cycles-pp.update_load_avg
      0.00            +0.1        0.13 ± 14%  perf-profile.children.cycles-pp.try_to_wake_up
      0.12 ±  6%      +0.1        0.25 ± 10%  perf-profile.children.cycles-pp.update_cfs_group
      0.00            +0.1        0.13 ± 22%  perf-profile.children.cycles-pp.handle_softirqs
      0.00            +0.1        0.14 ± 22%  perf-profile.children.cycles-pp.__irq_exit_rcu
      0.00            +0.1        0.14 ± 14%  perf-profile.children.cycles-pp.wake_up_q
      0.34 ±  5%      +0.2        0.49 ±  6%  perf-profile.children.cycles-pp.generic_perform_write
      0.03 ±100%      +0.2        0.20 ± 14%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.00            +0.2        0.21 ± 15%  perf-profile.children.cycles-pp.sysvec_call_function_single
      0.00            +0.2        0.21 ± 31%  perf-profile.children.cycles-pp.update_sg_lb_stats
      0.00            +0.2        0.22 ± 30%  perf-profile.children.cycles-pp.sched_balance_find_src_group
      0.00            +0.2        0.22 ± 30%  perf-profile.children.cycles-pp.update_sd_lb_stats
      0.00            +0.2        0.23 ± 31%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.00            +0.2        0.24 ± 15%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      0.00            +0.2        0.24 ± 32%  perf-profile.children.cycles-pp.sched_balance_rq
      0.00            +0.2        0.24 ± 28%  perf-profile.children.cycles-pp.pick_next_task_fair
      0.00            +0.3        0.26 ± 27%  perf-profile.children.cycles-pp.__pick_next_task
      0.08 ± 11%      +0.3        0.34 ± 10%  perf-profile.children.cycles-pp.rwsem_wake
      0.19 ±  4%      +0.3        0.45 ±  7%  perf-profile.children.cycles-pp.task_tick_fair
      0.11 ±  8%      +0.3        0.40 ± 11%  perf-profile.children.cycles-pp.up_write
      0.00            +0.3        0.30 ± 20%  perf-profile.children.cycles-pp.schedule_preempt_disabled
      0.00            +0.3        0.30 ± 15%  perf-profile.children.cycles-pp.nohz_balancer_kick
      0.00            +0.3        0.31 ± 20%  perf-profile.children.cycles-pp.schedule
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.acpi_idle_enter
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.acpi_safe_halt
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.pv_native_safe_halt
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.cpuidle_enter
      0.00            +0.3        0.32 ± 14%  perf-profile.children.cycles-pp.cpuidle_enter_state
      0.24 ±  3%      +0.3        0.57 ±  7%  perf-profile.children.cycles-pp.sched_tick
      0.01 ±223%      +0.3        0.35 ± 16%  perf-profile.children.cycles-pp.__schedule
      0.00            +0.4        0.35 ± 15%  perf-profile.children.cycles-pp.cpuidle_idle_call
      0.00            +0.4        0.36 ± 18%  perf-profile.children.cycles-pp.start_secondary
      0.00            +0.4        0.37 ± 24%  perf-profile.children.cycles-pp._raw_spin_lock_irq
      0.00            +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.common_startup_64
      0.00            +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.cpu_startup_entry
      0.00            +0.4        0.41 ± 14%  perf-profile.children.cycles-pp.do_idle
      0.00            +0.4        0.45 ± 24%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.36 ±  2%      +0.8        1.20 ±  6%  perf-profile.children.cycles-pp.update_process_times
      0.38            +0.9        1.26 ±  6%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.38            +0.9        1.27 ±  6%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.48            +1.0        1.46 ±  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.48            +1.0        1.46 ±  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.50            +1.0        1.51 ±  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.52            +1.0        1.55 ±  5%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
     98.32            -2.7       95.61        perf-profile.self.cycles-pp.osq_lock
      0.02 ± 99%      +0.0        0.07 ± 10%  perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.06 ±  7%      +0.1        0.12 ± 21%  perf-profile.self.cycles-pp.rwsem_down_write_slowpath
      0.00            +0.1        0.05 ±  8%  perf-profile.self.cycles-pp.up_write
      0.00            +0.1        0.06 ±  9%  perf-profile.self.cycles-pp.wake_q_add
      0.20 ±  4%      +0.1        0.26 ± 10%  perf-profile.self.cycles-pp.copy_page_from_iter_atomic
      0.00            +0.1        0.06 ± 17%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.1        0.07 ± 10%  perf-profile.self.cycles-pp.update_load_avg
      0.00            +0.1        0.07 ± 18%  perf-profile.self.cycles-pp.idle_cpu
      0.09 ± 12%      +0.1        0.16 ± 18%  perf-profile.self.cycles-pp.ring_buffer_read_head
      0.06            +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.get_jiffies_update
      0.05            +0.1        0.15 ±  7%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.1        0.10 ± 19%  perf-profile.self.cycles-pp.folio_unlock
      0.23 ±  3%      +0.1        0.35 ±  6%  perf-profile.self.cycles-pp.rwsem_spin_on_owner
      0.12 ±  6%      +0.1        0.25 ± 10%  perf-profile.self.cycles-pp.update_cfs_group
      0.00            +0.2        0.16 ± 31%  perf-profile.self.cycles-pp.update_sg_lb_stats
      0.00            +0.2        0.25 ± 13%  perf-profile.self.cycles-pp.nohz_balancer_kick
      0.00            +0.4        0.45 ± 24%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath


***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp2/min-nanosleep/stress-ng/60s

commit: 
  032e1003ad ("sched: Make clangd usable")
  7bca60ce65 ("sched/deadline: Less agressive dl_server handling")

032e1003ad358e4c 7bca60ce656978b01caafc4e228 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     51713 ± 91%    +171.0%     140151 ± 27%  numa-numastat.node1.other_node
     51713 ± 91%    +171.0%     140151 ± 27%  numa-vmstat.node1.numa_local
      7.78 ±  7%      -6.8        0.96 ±  2%  mpstat.cpu.all.irq%
      0.52 ±  4%      -0.2        0.33 ±  3%  mpstat.cpu.all.sys%
     11.42 ± 19%     -60.5%       4.51 ±  4%  mpstat.max_utilization_pct
    206334            +8.0%     222876        stress-ng.min-nanosleep.ops
      3437            +8.0%       3713        stress-ng.min-nanosleep.ops_per_sec
  72619226            +8.0%   78450215        stress-ng.time.voluntary_context_switches
     91.34            +7.6%      98.24        vmstat.cpu.id
   2300297            +8.0%    2485443        vmstat.system.cs
   1296371            +5.1%    1362893        vmstat.system.in
   1165012            +4.4%    1216559        proc-vmstat.nr_inactive_anon
   1878335            +2.8%    1930467        proc-vmstat.nr_mapped
   3264015            +1.6%    3315154        proc-vmstat.nr_unaccepted
    990621            +5.3%    1042760        proc-vmstat.nr_writeback_temp
   1165012            +4.4%    1216559        proc-vmstat.nr_zone_active_anon
   1911876            +3.8%    1984414        proc-vmstat.numa_interleave
   2154719            +3.6%    2232864        proc-vmstat.pgalloc_dma32
    903.88 ± 11%     -30.3%     629.56 ± 14%  sched_debug.cfs_rq:/.avg_vruntime.min
      6336 ± 29%     -59.2%       2583 ±  8%  sched_debug.cfs_rq:/.left_deadline.max
    555.30 ± 26%     -52.9%     261.73 ± 14%  sched_debug.cfs_rq:/.left_deadline.stddev
      6284 ± 30%     -59.0%       2579 ±  8%  sched_debug.cfs_rq:/.left_vruntime.max
    551.08 ± 26%     -52.6%     261.08 ± 14%  sched_debug.cfs_rq:/.left_vruntime.stddev
    187380 ±  5%     +35.3%     253537 ±  5%  sched_debug.cfs_rq:/.load.max
    903.88 ± 11%     -30.3%     629.56 ± 14%  sched_debug.cfs_rq:/.min_vruntime.min
      6284 ± 30%     -59.0%       2579 ±  8%  sched_debug.cfs_rq:/.right_vruntime.max
    551.08 ± 26%     -52.6%     261.08 ± 14%  sched_debug.cfs_rq:/.right_vruntime.stddev
     12.39 ±  4%     +26.9%      15.72 ±  7%  sched_debug.cpu.clock.stddev
    192.90 ± 18%     -29.5%     136.07 ±  8%  sched_debug.cpu.curr->pid.avg
    891.74 ±  8%     -16.2%     746.94 ±  3%  sched_debug.cpu.curr->pid.stddev
    438984           +34.6%     590692 ±  2%  sched_debug.cpu.nr_switches.max
    180298 ± 11%     -85.3%      26562 ± 99%  sched_debug.cpu.nr_switches.min
     34604 ±  7%    +291.7%     135541 ± 12%  sched_debug.cpu.nr_switches.stddev
      0.01 ±  7%     +30.1%       0.02 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01 ± 11%     +43.2%       0.01 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.01 ± 11%     +30.0%       0.01 ±  8%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.02 ±  4%     +16.5%       0.03 ±  6%  perf-sched.sch_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.01           -70.0%       0.00        perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.01 ±  3%     +23.1%       0.01 ±  3%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.19 ± 50%     +92.7%       0.38 ± 12%  perf-sched.sch_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      3.21 ± 73%     -64.9%       1.13 ± 27%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.07 ± 87%     -73.1%       0.02 ± 27%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.05 ± 31%     -64.7%       0.02 ± 11%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.09 ± 35%     -76.9%       0.02 ± 11%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01           -70.0%       0.00        perf-sched.total_sch_delay.average.ms
      0.07 ±223%    +563.7%       0.47 ±  7%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.67 ±  3%     +16.3%       0.78 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.28 ±223%    +575.7%       1.86 ± 13%  perf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.39 ±  3%     +17.1%       0.45 ±  7%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.66 ±  3%     +16.4%       0.77 ±  7%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.56 ±  2%     -23.9%       0.43 ±  3%  perf-stat.i.MPKI
 5.319e+09           -26.4%  3.914e+09        perf-stat.i.branch-instructions
      0.91            -0.0        0.87        perf-stat.i.branch-miss-rate%
  45430893           -29.7%   31944159        perf-stat.i.branch-misses
      6.57 ±  2%     +13.0       19.54 ±  5%  perf-stat.i.cache-miss-rate%
  15264617 ±  2%     -33.7%   10123277 ±  3%  perf-stat.i.cache-misses
 2.363e+08 ±  5%     -81.5%   43729498 ±  5%  perf-stat.i.cache-references
   2384996            +8.0%    2575726        perf-stat.i.context-switches
      3.93 ±  5%     -62.2%       1.49        perf-stat.i.cpi
 9.365e+10 ±  5%     -70.8%  2.737e+10        perf-stat.i.cpu-cycles
      8978 ± 11%    +187.1%      25778 ± 15%  perf-stat.i.cpu-migrations
      7934 ±  9%     -36.7%       5019 ±  4%  perf-stat.i.cycles-between-cache-misses
  2.57e+10           -23.8%  1.958e+10        perf-stat.i.instructions
      0.29 ±  4%    +140.6%       0.69        perf-stat.i.ipc
     12.42            +8.0%      13.42        perf-stat.i.metric.K/sec
      0.59 ±  2%     -12.9%       0.52 ±  3%  perf-stat.overall.MPKI
      0.85            -0.0        0.82        perf-stat.overall.branch-miss-rate%
      6.47 ±  2%     +16.8       23.23 ±  6%  perf-stat.overall.cache-miss-rate%
      3.64 ±  5%     -61.6%       1.40        perf-stat.overall.cpi
      6142 ±  7%     -56.0%       2703 ±  2%  perf-stat.overall.cycles-between-cache-misses
      0.28 ±  5%    +160.0%       0.72        perf-stat.overall.ipc
 5.234e+09           -26.4%  3.853e+09        perf-stat.ps.branch-instructions
  44685648           -29.7%   31428779        perf-stat.ps.branch-misses
  15022399 ±  2%     -33.6%    9973785 ±  3%  perf-stat.ps.cache-misses
 2.325e+08 ±  5%     -81.5%   43045648 ±  5%  perf-stat.ps.cache-references
   2346125            +8.0%    2533751        perf-stat.ps.context-switches
 9.212e+10 ±  5%     -70.8%  2.693e+10        perf-stat.ps.cpu-cycles
      8832 ± 11%    +187.1%      25360 ± 15%  perf-stat.ps.cpu-migrations
 2.529e+10           -23.8%  1.927e+10        perf-stat.ps.instructions
 1.554e+12           -23.8%  1.184e+12        perf-stat.total.instructions



***************************************************************************************************
lkp-srf-2sp3: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp3/rawudp/stress-ng/60s

commit: 
  032e1003ad ("sched: Make clangd usable")
  7bca60ce65 ("sched/deadline: Less agressive dl_server handling")

032e1003ad358e4c 7bca60ce656978b01caafc4e228 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 4.053e+08 ±  8%     +72.3%  6.985e+08 ±  4%  cpuidle..time
    252110 ± 14%    +346.5%    1125793 ± 11%  cpuidle..usage
      2.86 ±  7%      +2.1        4.94 ±  5%  mpstat.cpu.all.idle%
      0.42            +0.1        0.53 ±  2%  mpstat.cpu.all.usr%
    384.45           -12.9%     335.02        vmstat.procs.r
     31579 ± 10%    +161.6%      82622 ±  9%  vmstat.system.cs
    454840            +3.5%     470902        vmstat.system.in
   8193567 ±  7%     -37.3%    5137179 ±  6%  numa-numastat.node0.local_node
   8333499 ±  7%     -37.5%    5207944 ±  6%  numa-numastat.node0.numa_hit
   9576611 ±  2%     -48.1%    4974997 ±  6%  numa-numastat.node1.local_node
   9634622 ±  2%     -47.1%    5100815 ±  7%  numa-numastat.node1.numa_hit
   1328402           +17.4%    1559668 ±  2%  meminfo.Active
   1328402           +17.4%    1559668 ±  2%  meminfo.Active(anon)
    415239 ±  3%     +16.7%     484410 ±  6%  meminfo.Mapped
   2919547 ±  3%     -23.4%    2236770 ±  3%  meminfo.SUnreclaim
    610696 ±  3%     +38.5%     846062 ±  4%  meminfo.Shmem
   3132101 ±  2%     -22.0%    2443796 ±  3%  meminfo.Slab
   2494509           +46.3%    3650414        stress-ng.rawudp.ops
     41563           +46.3%      60826        stress-ng.rawudp.ops_per_sec
    215.09           +45.9%     313.72        stress-ng.rawudp.packets_32_bytes_received_per_sec
    871151 ±  6%     +47.8%    1287573 ±  5%  stress-ng.time.involuntary_context_switches
      5443 ±  3%      +7.4%       5848        stress-ng.time.percent_of_cpu_this_job_got
      3259 ±  3%      +7.2%       3493        stress-ng.time.system_time
     24.68           +40.0%      34.56        stress-ng.time.user_time
    751066 ± 17%    +184.8%    2139221 ± 11%  stress-ng.time.voluntary_context_switches
    103510 ±  4%     +18.6%     122788 ±  5%  proc-vmstat.nr_anon_pages
    332513           +17.4%     390211 ±  2%  proc-vmstat.nr_inactive_anon
   1040924            +5.6%    1099375        proc-vmstat.nr_mapped
    721178 ±  2%     -20.5%     573139 ±  3%  proc-vmstat.nr_slab_reclaimable
  10829041 ±  3%     -33.7%    7181747 ±  2%  proc-vmstat.nr_unaccepted
     52896            -1.5%      52098        proc-vmstat.nr_unevictable
    153210 ±  3%     +38.1%     211658 ±  4%  proc-vmstat.nr_writeback_temp
    332513           +17.4%     390211 ±  2%  proc-vmstat.nr_zone_active_anon
  17772587 ±  4%     -43.1%   10106636 ±  3%  proc-vmstat.numa_interleave
  73014310 ±  4%     -44.5%   40530405 ±  3%  proc-vmstat.pgalloc_dma32
  72586921 ±  4%     -45.4%   39615004 ±  3%  proc-vmstat.pgskip_device
   2270969 ±  6%     -18.3%    1855414 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
    162743 ± 22%     +38.0%     224614 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
   2270969 ±  6%     -18.3%    1855421 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
    162752 ± 22%     +38.0%     224615 ±  7%  sched_debug.cfs_rq:/.min_vruntime.stddev
      1299 ±  4%     -14.8%       1107 ±  6%  sched_debug.cfs_rq:/.runnable_avg.avg
      1092 ± 12%     -17.7%     899.04 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
      1370 ±  6%     +21.9%       1671 ± 10%  sched_debug.cfs_rq:/.util_avg.max
    204.56 ±  8%     +33.1%     272.19 ± 12%  sched_debug.cfs_rq:/.util_avg.stddev
    765.31 ±  3%     +80.8%       1383 ±  2%  sched_debug.cpu.clock_task.stddev
      6433 ±  8%    +126.2%      14552 ±  9%  sched_debug.cpu.nr_switches.avg
      4046 ± 11%    +128.8%       9257 ±  8%  sched_debug.cpu.nr_switches.min
      0.00 ± 44%   +3130.0%       0.14 ± 17%  sched_debug.cpu.nr_uninterruptible.avg
     11.24 ± 27%     +76.6%      19.85 ± 22%  sched_debug.cpu.nr_uninterruptible.stddev
    227050 ± 51%    +234.8%     760066 ± 40%  numa-meminfo.node0.Active
    227050 ± 51%    +234.8%     760066 ± 40%  numa-meminfo.node0.Active(anon)
   1349743 ±119%    +142.7%    3276163 ± 40%  numa-meminfo.node0.FilePages
     39511 ± 97%    +664.4%     302031 ± 33%  numa-meminfo.node0.Mapped
   3998073 ± 42%     +50.4%    6015073 ± 20%  numa-meminfo.node0.MemUsed
     11816 ± 14%    +132.4%      27462 ± 25%  numa-meminfo.node0.PageTables
   1392016 ±  2%     -15.0%    1182833 ±  4%  numa-meminfo.node0.SUnreclaim
     64403 ± 46%    +497.6%     384896 ± 36%  numa-meminfo.node0.Shmem
   1486559 ±  4%     -12.2%    1305586 ±  3%  numa-meminfo.node0.Slab
     20595 ±  4%     -14.0%      17717 ±  8%  numa-meminfo.node1.KernelStack
   5849357 ± 28%     -39.9%    3518264 ± 35%  numa-meminfo.node1.MemUsed
     31576 ±  6%     -52.6%      14979 ± 47%  numa-meminfo.node1.PageTables
   1435745           -22.6%    1111726 ±  2%  numa-meminfo.node1.SUnreclaim
   1551910 ±  2%     -22.8%    1197513 ±  3%  numa-meminfo.node1.Slab
      9918 ± 99%    +656.9%      75075 ± 34%  numa-vmstat.node0.nr_anon_pages
     56806 ± 51%    +234.2%     189858 ± 40%  numa-vmstat.node0.nr_inactive_anon
      2948 ± 14%    +132.1%       6841 ± 25%  numa-vmstat.node0.nr_kernel_stack
    337527 ±119%    +142.6%     818901 ± 40%  numa-vmstat.node0.nr_mapped
    360490 ±  4%     -17.1%     298949 ±  4%  numa-vmstat.node0.nr_slab_reclaimable
   5016234 ± 10%     -20.8%    3973477 ±  8%  numa-vmstat.node0.nr_unaccepted
     16192 ± 46%    +493.4%      96084 ± 36%  numa-vmstat.node0.nr_writeback_temp
     56806 ± 51%    +234.2%     189858 ± 40%  numa-vmstat.node0.nr_zone_active_anon
   8193068 ±  7%     -37.3%    5138236 ±  6%  numa-vmstat.node0.numa_interleave
     20586 ±  4%     -13.9%      17725 ±  8%  numa-vmstat.node1.nr_foll_pin_released
      7871 ±  6%     -52.3%       3752 ± 48%  numa-vmstat.node1.nr_kernel_stack
    374773 ±  3%     -25.1%     280890 ±  4%  numa-vmstat.node1.nr_slab_reclaimable
   5818856 ±  8%     -44.5%    3228232 ± 13%  numa-vmstat.node1.nr_unaccepted
   9575821 ±  2%     -48.1%    4973900 ±  6%  numa-vmstat.node1.numa_interleave
      5.63           -12.7%       4.92        perf-stat.i.MPKI
 1.919e+10            -5.6%  1.812e+10        perf-stat.i.branch-instructions
      0.62            -0.0        0.60        perf-stat.i.branch-miss-rate%
 1.161e+08            -7.6%  1.073e+08        perf-stat.i.branch-misses
     40.35            -0.6       39.71        perf-stat.i.cache-miss-rate%
 5.201e+08           -18.2%  4.253e+08        perf-stat.i.cache-misses
 1.286e+09           -16.8%   1.07e+09        perf-stat.i.cache-references
     32886 ±  9%    +162.1%      86182 ±  9%  perf-stat.i.context-switches
      6.63            +3.4%       6.85        perf-stat.i.cpi
 6.117e+11            -3.1%  5.928e+11        perf-stat.i.cpu-cycles
      6685 ± 12%     +84.8%      12353 ±  9%  perf-stat.i.cpu-migrations
      1177           +18.4%       1394        perf-stat.i.cycles-between-cache-misses
 9.179e+10            -6.1%  8.623e+10        perf-stat.i.instructions
      0.15            -3.5%       0.15        perf-stat.i.ipc
      5.67           -12.9%       4.94        perf-stat.overall.MPKI
      0.60            -0.0        0.59        perf-stat.overall.branch-miss-rate%
     40.46            -0.7       39.79        perf-stat.overall.cache-miss-rate%
      6.67            +3.1%       6.88        perf-stat.overall.cpi
      1176           +18.4%       1393        perf-stat.overall.cycles-between-cache-misses
      0.15            -3.0%       0.15        perf-stat.overall.ipc
  1.85e+10            -4.9%   1.76e+10        perf-stat.ps.branch-instructions
 1.114e+08            -6.8%  1.038e+08        perf-stat.ps.branch-misses
  5.02e+08           -17.6%  4.137e+08        perf-stat.ps.cache-misses
 1.241e+09           -16.2%  1.039e+09        perf-stat.ps.cache-references
     30883 ± 10%    +167.1%      82500 ± 10%  perf-stat.ps.context-switches
 5.905e+11            -2.4%  5.761e+11        perf-stat.ps.cpu-cycles
      6173 ± 14%     +87.6%      11579 ± 10%  perf-stat.ps.cpu-migrations
 8.851e+10            -5.4%  8.375e+10        perf-stat.ps.instructions
 5.395e+12            -5.3%  5.111e+12        perf-stat.total.instructions
      5.60 ± 67%     -57.9%       2.36 ± 38%  perf-sched.sch_delay.avg.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
     10.76 ± 40%     -68.5%       3.39 ± 15%  perf-sched.sch_delay.avg.ms.__cond_resched.__mutex_lock.constprop.0.ip_ra_control
      8.89 ± 10%     -54.3%       4.07 ±  5%  perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     10.27 ±  7%     -73.1%       2.77 ± 12%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
      7.75 ± 34%     -69.3%       2.38 ± 59%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.sock_alloc_inode.alloc_inode.sock_alloc
      7.36 ± 12%     -38.8%       4.50 ± 14%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
      5.29 ± 42%     -47.0%       2.80 ± 26%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.alloc_file_pseudo.sock_alloc_file
      6.19 ± 16%     -53.2%       2.90 ± 45%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.security_inode_alloc.inode_init_always_gfp.alloc_inode
      6.07 ± 28%     -61.4%       2.34 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.sk_prot_alloc.sk_alloc.inet_create
      8.97 ± 14%     -71.1%       2.59 ± 17%  perf-sched.sch_delay.avg.ms.__cond_resched.lock_sock_nested.raw_destroy.sk_common_release.inet_release
      0.86 ± 15%     +25.0%       1.08 ± 13%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.92 ± 32%     -60.9%       1.92 ± 48%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.10 ± 56%   +1195.4%       1.28 ±112%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     25.42 ± 76%     -82.0%       4.57 ±142%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.03 ±170%   +3613.4%       1.24 ±193%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     17.92 ±  7%     -68.9%       5.58 ± 27%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     16.30 ± 41%     -76.5%       3.83 ± 43%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      9.61 ± 16%     -78.2%       2.09 ± 11%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.ip_ra_control
      4.46 ± 13%     -83.6%       0.73 ± 16%  perf-sched.sch_delay.avg.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
      0.67 ± 12%     -56.4%       0.29 ± 46%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     13.88 ±  7%     -58.1%       5.82 ±  9%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     66.14 ± 27%     -57.2%      28.29 ± 57%  perf-sched.sch_delay.max.ms.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
    217.80 ± 20%     -48.9%     111.31 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
     54.66 ± 37%     -48.5%      28.14 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_empty_file.alloc_file_pseudo.sock_alloc_file
     23.20 ± 42%     +73.8%      40.32 ± 23%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     36.10 ± 62%   +1009.7%     400.61 ±115%  perf-sched.sch_delay.max.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     25.42 ± 76%     -81.9%       4.60 ±141%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.06 ±191%   +2498.0%       1.53 ±150%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
    638.81 ± 23%     -39.7%     384.97 ± 23%  perf-sched.sch_delay.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
      8.50 ± 10%     -76.9%       1.96 ± 16%  perf-sched.total_sch_delay.average.ms
     35.01 ±  9%     -71.0%      10.14 ± 11%  perf-sched.total_wait_and_delay.average.ms
    142342 ± 10%    +220.0%     455497 ±  9%  perf-sched.total_wait_and_delay.count.ms
      3405 ± 14%     -36.7%       2156 ±  8%  perf-sched.total_wait_and_delay.max.ms
     26.51 ±  9%     -69.1%       8.18 ± 10%  perf-sched.total_wait_time.average.ms
      3405 ± 14%     -41.4%       1996 ± 15%  perf-sched.total_wait_time.max.ms
     17.80 ± 10%     -36.8%      11.24 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
    435.74 ± 73%     -93.6%      27.69 ± 28%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     20.60 ±  7%     -92.9%       1.46 ±223%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
     60.91 ±  8%     -35.7%      39.14 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     44.07 ± 24%     +92.4%      84.81 ± 41%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    481.12 ±  7%     +21.5%     584.73 ±  4%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      5.54 ±223%    +476.8%      31.97 ± 10%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    249.16 ± 23%     -44.8%     137.52 ± 14%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      9.50 ± 12%     -82.9%       1.63 ± 15%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
      5.87 ± 10%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    157.39 ±  7%     -63.8%      57.02 ±  8%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     28.10 ±  7%     -51.3%      13.68 ±  8%  perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      3937 ± 13%     -39.0%       2400 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     11.83 ± 83%    +484.5%      69.17 ± 46%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      2951 ± 11%     -92.5%     222.00 ±223%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
    794.33 ± 11%    +144.0%       1938 ± 14%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.50 ±223%   +2246.7%      58.67 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
    959.17 ± 18%     -45.3%     524.33 ± 37%  perf-sched.wait_and_delay.count.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     58.67 ±  5%     -21.0%      46.33 ±  6%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
     54.00 ± 24%     +73.1%      93.50 ± 12%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     57079 ± 17%    +442.4%     309621 ± 11%  perf-sched.wait_and_delay.count.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
      1010 ±  7%    -100.0%       0.00        perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      9873 ±  9%    +188.3%      28469 ±  7%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     61865 ±  5%     +66.2%     102833 ±  6%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    435.61 ± 20%     -85.0%      65.18 ±223%  perf-sched.wait_and_delay.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
     34.85 ±223%   +1078.1%     410.53 ± 65%  perf-sched.wait_and_delay.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1208 ± 17%     -36.0%     774.17 ± 23%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
    212.55 ±158%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      1841 ±  9%     -16.0%       1547 ±  9%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     26.10 ± 61%     -58.6%      10.80 ± 23%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
    418.96 ± 75%     -94.6%      22.51 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     10.33 ±  7%     -40.1%       6.18 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
      6.19 ± 16%     -43.3%       3.51 ± 26%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.security_inode_alloc.inode_init_always_gfp.alloc_inode
     10.11 ± 25%    +333.1%      43.78 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.lock_sock_nested.raw_destroy.sk_common_release.inet_release
     60.05 ±  8%     -36.6%      38.06 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.18 ± 91%    +184.3%      14.71 ± 42%  perf-sched.wait_time.avg.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     43.97 ± 24%     +90.0%      83.54 ± 41%  perf-sched.wait_time.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
    479.10 ±  7%     +20.8%     578.54 ±  4%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      4.37 ± 27%     -53.2%       2.04 ± 33%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     18.92 ±  6%     -67.6%       6.13 ± 23%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.93 ± 62%    +557.9%      12.73 ± 53%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    244.40 ± 23%     -46.0%     131.93 ± 13%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      9.76 ± 16%     -47.6%       5.12 ±  7%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.ip_ra_control
      5.04 ± 12%     -82.3%       0.89 ± 15%  perf-sched.wait_time.avg.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
    156.71 ±  7%     -63.8%      56.73 ±  8%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     14.22 ±  7%     -44.7%       7.86 ±  7%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    242.75 ± 20%     +63.8%     397.69 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc_pseudo.alloc_file_pseudo
    110.27 ± 45%    +123.6%     246.56 ± 25%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb
     66.55 ± 38%    +245.7%     230.06 ± 57%  perf-sched.wait_time.max.ms.__cond_resched.kmem_cache_alloc_noprof.sk_prot_alloc.sk_alloc.inet_create
     15.52 ±  9%   +1583.8%     261.33 ±105%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
     38.52 ± 84%    +855.3%     367.94 ± 80%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.34 ± 82%    +681.2%     268.28 ± 50%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    131.26 ± 64%    +195.2%     387.45 ±  7%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.ip_ra_control
    645.30 ± 24%     -39.5%     390.56 ± 23%  perf-sched.wait_time.max.ms.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_datagram.skb_recv_datagram
      1841 ±  9%     -16.0%       1547 ±  9%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm



***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp2/membarrier/stress-ng/60s

commit: 
  032e1003ad ("sched: Make clangd usable")
  7bca60ce65 ("sched/deadline: Less agressive dl_server handling")

032e1003ad358e4c 7bca60ce656978b01caafc4e228 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 2.649e+09          +104.8%  5.425e+09 ±  6%  cpuidle..time
   3815319          +104.4%    7797511 ±  5%  cpuidle..usage
    387254            +4.6%     405223 ±  4%  proc-vmstat.nr_inactive_anon
   1005623            +1.8%    1023290        proc-vmstat.nr_mapped
    117909           +15.0%     135583 ± 12%  proc-vmstat.nr_writeback_temp
    387254            +4.6%     405223 ±  4%  proc-vmstat.nr_zone_active_anon
     24.15           +90.6%      46.04 ±  6%  vmstat.cpu.id
    165.74 ±  2%     -35.8%     106.42 ±  8%  vmstat.procs.r
     52841           +71.6%      90667 ±  3%  vmstat.system.cs
   3030991           -26.8%    2219763 ±  3%  vmstat.system.in
     22.70           +22.1       44.83 ±  6%  mpstat.cpu.all.idle%
      1.80            -0.4        1.38 ±  2%  mpstat.cpu.all.irq%
     75.22           -21.7       53.48 ±  5%  mpstat.cpu.all.sys%
      8.33 ± 34%    +424.0%      43.67 ± 21%  mpstat.max_utilization.seconds
     82.47           -28.8%      58.72 ±  4%  mpstat.max_utilization_pct
    183.75           +18.2%     217.18 ±  3%  stress-ng.membarrier.membarrier_calls_per_sec
    106067           +18.1%     125306 ±  3%  stress-ng.membarrier.ops
      1765           +18.2%       2086 ±  3%  stress-ng.membarrier.ops_per_sec
    507928           -80.1%     100928 ± 31%  stress-ng.time.involuntary_context_switches
     14890           -30.0%      10421 ±  5%  stress-ng.time.percent_of_cpu_this_job_got
      8973           -30.0%       6279 ±  5%  stress-ng.time.system_time
   1595572           +80.9%    2886509 ±  2%  stress-ng.time.voluntary_context_switches
      0.16 ±  2%     +21.3%       0.20 ±  3%  perf-stat.i.MPKI
 1.799e+10           -28.9%  1.279e+10 ±  5%  perf-stat.i.branch-instructions
      0.15 ±  2%      +0.1        0.21 ±  5%  perf-stat.i.branch-miss-rate%
     15.43            -2.1       13.31 ±  3%  perf-stat.i.cache-miss-rate%
  11411999           -13.4%    9882107 ±  3%  perf-stat.i.cache-misses
     54258           +72.7%      93707 ±  3%  perf-stat.i.context-switches
  4.84e+11           -29.5%  3.412e+11 ±  5%  perf-stat.i.cpu-cycles
     17914            +8.6%      19454        perf-stat.i.cpu-migrations
     45484           -17.5%      37527 ±  3%  perf-stat.i.cycles-between-cache-misses
 8.952e+10           -29.1%  6.343e+10 ±  5%  perf-stat.i.instructions
      0.19            +2.4%       0.19        perf-stat.i.ipc
      0.13           +22.3%       0.16 ±  3%  perf-stat.overall.MPKI
      0.12            +0.1        0.18 ±  6%  perf-stat.overall.branch-miss-rate%
     15.19            -2.2       12.98 ±  4%  perf-stat.overall.cache-miss-rate%
     42490           -18.5%      34619 ±  4%  perf-stat.overall.cycles-between-cache-misses
 1.769e+10           -28.9%  1.258e+10 ±  5%  perf-stat.ps.branch-instructions
  11203175           -13.4%    9698099 ±  2%  perf-stat.ps.cache-misses
     53359           +72.7%      92170 ±  3%  perf-stat.ps.context-switches
  4.76e+11           -29.5%  3.358e+11 ±  5%  perf-stat.ps.cpu-cycles
     17618            +8.6%      19130        perf-stat.ps.cpu-migrations
 8.804e+10           -29.1%  6.242e+10 ±  5%  perf-stat.ps.instructions
 5.366e+12           -28.7%  3.827e+12 ±  5%  perf-stat.total.instructions
   4027699           -53.5%    1873472 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.avg
   4311516           -40.2%    2577501 ±  5%  sched_debug.cfs_rq:/.avg_vruntime.max
   3909898           -77.1%     894939 ± 10%  sched_debug.cfs_rq:/.avg_vruntime.min
     59088 ±  5%   +1096.6%     707027 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.47 ±  6%     -40.9%       0.28 ± 24%  sched_debug.cfs_rq:/.h_nr_queued.avg
      2.42 ± 14%     -37.9%       1.50 ± 19%  sched_debug.cfs_rq:/.h_nr_queued.max
      0.44 ±  8%     -15.9%       0.37 ±  6%  sched_debug.cfs_rq:/.h_nr_queued.stddev
      0.47 ±  6%     -40.8%       0.28 ± 24%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      2.42 ± 14%     -37.9%       1.50 ± 19%  sched_debug.cfs_rq:/.h_nr_runnable.max
      0.44 ±  8%     -15.8%       0.37 ±  6%  sched_debug.cfs_rq:/.h_nr_runnable.stddev
   4027699           -53.5%    1873472 ± 10%  sched_debug.cfs_rq:/.min_vruntime.avg
   4311516           -40.2%    2577501 ±  5%  sched_debug.cfs_rq:/.min_vruntime.max
   3909898           -77.1%     894939 ± 10%  sched_debug.cfs_rq:/.min_vruntime.min
     59088 ±  5%   +1096.6%     707027 ±  3%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.41 ±  5%     -33.0%       0.27 ± 23%  sched_debug.cfs_rq:/.nr_queued.avg
    574.68 ±  3%     -36.2%     366.88 ±  7%  sched_debug.cfs_rq:/.runnable_avg.avg
      1582 ±  8%     -34.4%       1037 ±  3%  sched_debug.cfs_rq:/.runnable_avg.max
    230.83 ±  8%     -55.2%     103.42 ± 30%  sched_debug.cfs_rq:/.runnable_avg.min
    257.39 ±  4%     -23.1%     197.85 ±  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
    490.01 ±  2%     -26.0%     362.55 ±  7%  sched_debug.cfs_rq:/.util_avg.avg
      1342 ±  5%     -24.9%       1008 ±  3%  sched_debug.cfs_rq:/.util_avg.max
    180.83 ± 10%     -43.5%     102.25 ± 29%  sched_debug.cfs_rq:/.util_avg.min
    152.13 ±  8%     -62.1%      57.69 ± 29%  sched_debug.cfs_rq:/.util_est.avg
    954.33 ± 17%     -37.1%     599.83 ±  8%  sched_debug.cfs_rq:/.util_est.max
    144.41 ± 11%     -28.8%     102.89 ± 13%  sched_debug.cfs_rq:/.util_est.stddev
      2119 ±  5%     -34.0%       1398 ± 25%  sched_debug.cpu.curr->pid.avg
      0.00 ±  5%     -13.2%       0.00 ± 11%  sched_debug.cpu.next_balance.stddev
      0.47 ±  6%     -41.1%       0.28 ± 25%  sched_debug.cpu.nr_running.avg
      2.42 ± 14%     -37.9%       1.50 ± 19%  sched_debug.cpu.nr_running.max
      0.44 ±  8%     -16.8%       0.37 ±  6%  sched_debug.cpu.nr_running.stddev
      9997           +62.1%      16208 ±  2%  sched_debug.cpu.nr_switches.avg
      8163 ±  2%     -38.0%       5063 ±  2%  sched_debug.cpu.nr_switches.min
      5189 ±  4%    +190.8%      15089 ±  4%  sched_debug.cpu.nr_switches.stddev
    238.83 ± 19%    +563.5%       1584 ± 34%  sched_debug.cpu.nr_uninterruptible.max
   -143.67          +542.7%    -923.33        sched_debug.cpu.nr_uninterruptible.min
     57.69 ±  3%   +1206.4%     753.61 ± 24%  sched_debug.cpu.nr_uninterruptible.stddev
      2.25 ± 50%     -99.9%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_cpumask_var_node.membarrier_private_expedited.__do_sys_membarrier
      0.00 ±143%   +7057.1%       0.17 ±197%  perf-sched.sch_delay.avg.ms.__cond_resched.__mutex_lock.constprop.0.membarrier_global_expedited
      0.12 ± 11%     -18.8%       0.10 ±  8%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.54 ± 33%     -94.6%       0.03 ± 39%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      1.90 ± 26%     -99.6%       0.01 ± 50%  perf-sched.sch_delay.avg.ms.__cond_resched.cpus_read_lock.membarrier_global_expedited.__do_sys_membarrier.do_syscall_64
      0.01 ± 86%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 41%    -100.0%       0.00        perf-sched.sch_delay.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
      0.56 ± 70%     -95.9%       0.02 ± 31%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      1.49 ± 29%     -99.8%       0.00 ±107%  perf-sched.sch_delay.avg.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.29 ± 91%     -97.6%       0.01 ± 23%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.03 ± 41%     -75.1%       0.01 ± 38%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      0.24 ± 92%     -97.6%       0.01 ± 19%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      0.05 ± 52%     -76.7%       0.01 ± 22%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.23 ±117%     -95.0%       0.01 ± 26%  perf-sched.sch_delay.avg.ms.io_schedule.migration_entry_wait_on_locked.__handle_mm_fault.handle_mm_fault
      1.41 ± 55%     -99.5%       0.01 ± 91%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.05 ±114%     -86.1%       0.01 ± 14%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.22 ± 60%     -90.6%       0.02 ± 69%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      1.48           -88.4%       0.17 ± 29%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
      1.35           -98.1%       0.03 ± 16%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_private_expedited
      0.56 ±  2%     -95.4%       0.03 ± 17%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      0.23 ± 21%     -97.4%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      1.19 ±  4%     -97.7%       0.03 ± 23%  perf-sched.sch_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2.51 ± 44%     -99.9%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_cpumask_var_node.membarrier_private_expedited.__do_sys_membarrier
      0.00 ±143%  +2.1e+05%       4.82 ±219%  perf-sched.sch_delay.max.ms.__cond_resched.__mutex_lock.constprop.0.membarrier_global_expedited
      5.38 ± 13%     -82.7%       0.93 ± 32%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
      4.51 ± 27%     -99.8%       0.01 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.cpus_read_lock.membarrier_global_expedited.__do_sys_membarrier.do_syscall_64
      0.02 ±119%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.exec_mmap.begin_new_exec.load_elf_binary
      0.01 ± 38%    -100.0%       0.00        perf-sched.sch_delay.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     11.24 ±118%     -91.5%       0.96 ± 26%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
      0.58 ± 88%     -98.0%       0.01 ± 22%  perf-sched.sch_delay.max.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      4.25 ± 20%     -99.9%       0.00 ±110%  perf-sched.sch_delay.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.23 ±106%     -99.1%       0.01 ± 28%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.94 ± 81%     -99.0%       0.01 ± 13%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
      2.33 ± 50%     -92.6%       0.17 ±175%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.34 ± 52%     -99.7%       0.01 ± 91%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.96 ± 19%     -99.3%       0.03 ± 62%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     16.95 ± 75%     -97.6%       0.41 ±104%  perf-sched.sch_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.94           -93.3%       0.06 ± 24%  perf-sched.total_sch_delay.average.ms
     35.08           -24.6%      26.43 ±  2%  perf-sched.total_wait_and_delay.average.ms
    172758           +33.5%     230694        perf-sched.total_wait_and_delay.count.ms
      4826           -11.0%       4295 ±  4%  perf-sched.total_wait_and_delay.max.ms
     34.14           -22.7%      26.37 ±  2%  perf-sched.total_wait_time.average.ms
      4826           -11.0%       4295 ±  4%  perf-sched.total_wait_time.max.ms
    521.72 ± 10%     -66.9%     172.46 ± 10%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     17.81           +36.8%      24.35        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
     18.37           -16.7%      15.29 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_private_expedited
     31.46           -40.7%      18.67 ±  2%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
    528.64 ±  2%     -15.5%     446.58 ±  2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     33.01          -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     24.50 ±  3%    +249.7%      85.67 ±  7%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     46991           +19.1%      55945 ±  6%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
     31298          +128.6%      71533 ±  3%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_private_expedited
      1858           +17.7%       2187 ±  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    906.33 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
    157.84 ±223%    +519.2%     977.33        perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    173.28 ± 14%     -62.8%      64.47 ± 40%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
    173.41 ± 14%     -63.6%      63.19 ± 35%  perf-sched.wait_and_delay.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_private_expedited
    172.89 ± 13%     -63.1%      63.75 ± 41%  perf-sched.wait_and_delay.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
     15.67 ± 47%     -67.8%       5.05        perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    863.19 ± 35%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     31.51 ±  6%     -93.7%       1.98 ±223%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.alloc_cpumask_var_node.membarrier_private_expedited.__do_sys_membarrier
      7.30 ±145%    +263.7%      26.54 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.__mutex_lock.constprop.0.membarrier_global_expedited
     31.79 ±  5%     -26.7%      23.29 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
     29.60 ±  2%     -52.7%      13.99 ± 50%  perf-sched.wait_time.avg.ms.__cond_resched.cpus_read_lock.membarrier_global_expedited.__do_sys_membarrier.do_syscall_64
      0.01 ± 41%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     31.61 ±  4%     -32.3%      21.42 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.migrate_task_to.task_numa_migrate.isra
     28.18 ± 16%     -40.3%      16.83 ± 30%  perf-sched.wait_time.avg.ms.io_schedule.migration_entry_wait_on_locked.__handle_mm_fault.handle_mm_fault
    521.50 ± 10%     -66.9%     172.44 ± 10%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
     16.33           +48.1%      24.18        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
     30.90           -39.7%      18.64 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      0.84 ±  4%     -28.9%       0.60 ±  2%  perf-sched.wait_time.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
    528.63 ±  2%     -15.5%     446.57 ±  2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     31.82           -36.4%      20.24 ± 10%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     32.50 ±  5%     -93.9%       1.98 ±223%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.alloc_cpumask_var_node.membarrier_private_expedited.__do_sys_membarrier
      7.30 ±145%    +367.3%      34.11 ±  8%  perf-sched.wait_time.max.ms.__cond_resched.__mutex_lock.constprop.0.membarrier_global_expedited
    131.53 ± 30%     -65.6%      45.28 ± 52%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.stop_two_cpus.migrate_swap.task_numa_migrate
     35.67 ±  3%     -56.0%      15.69 ± 61%  perf-sched.wait_time.max.ms.__cond_resched.cpus_read_lock.membarrier_global_expedited.__do_sys_membarrier.do_syscall_64
      0.01 ± 38%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.dput.__fput.__x64_sys_close.do_syscall_64
     58.67 ± 80%     -78.9%      12.40 ±106%  perf-sched.wait_time.max.ms.__cond_resched.task_work_run.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
    337.05 ±140%     -99.7%       1.17 ±  3%  perf-sched.wait_time.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     35.86 ± 11%     -57.8%      15.12 ± 84%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    166.02 ± 16%     -62.3%      62.52 ± 42%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_global_expedited
    168.85 ± 15%     -66.0%      57.38 ± 44%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.membarrier_private_expedited
    166.11 ± 15%     -63.4%      60.73 ± 44%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.__wait_rcu_gp
      4.66 ± 12%     -50.4%       2.31 ±  4%  perf-sched.wait_time.max.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
     13.65 ± 49%     -63.2%       5.02        perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    861.59 ± 36%     -95.7%      37.30 ± 19%  perf-sched.wait_time.max.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]



***************************************************************************************************
lkp-spr-2sp4: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 512G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-2sp4/timer/stress-ng/60s

commit: 
  032e1003ad ("sched: Make clangd usable")
  7bca60ce65 ("sched/deadline: Less agressive dl_server handling")

032e1003ad358e4c 7bca60ce656978b01caafc4e228 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  9.65e+08 ± 20%     -44.3%  5.377e+08 ±  6%  cpuidle..time
    471918 ± 13%     -36.6%     299078 ±  3%  cpuidle..usage
      1393 ± 27%    +162.5%       3658 ±  2%  perf-c2c.DRAM.local
      3285 ± 19%     -46.2%       1768 ± 12%  perf-c2c.DRAM.remote
     49987 ±  7%     -93.9%       3069 ±  5%  perf-c2c.HITM.local
     51112 ±  7%     -92.2%       3983 ±  6%  perf-c2c.HITM.total
     11.12 ± 17%     -39.8%       6.70 ±  9%  vmstat.cpu.id
     63.78 ±  9%    +176.1%     176.06        vmstat.procs.r
  14250660 ±  4%    +279.8%   54130066        vmstat.system.cs
  18058657 ±  6%    +255.1%   64127870        vmstat.system.in
      8.33 ± 23%      -4.4        3.96 ±  6%  mpstat.cpu.all.idle%
     72.47 ±  5%     -47.7       24.80        mpstat.cpu.all.irq%
      0.13 ±  7%      +0.9        1.02        mpstat.cpu.all.soft%
     15.77 ±  9%     +45.9       61.71        mpstat.cpu.all.sys%
      3.30 ±  8%      +5.2        8.50        mpstat.cpu.all.usr%
  30202899 ± 27%     -74.5%    7713523 ± 15%  stress-ng.time.involuntary_context_switches
      3451 ±  9%    +271.5%      12821        stress-ng.time.percent_of_cpu_this_job_got
      1808 ±  9%    +279.4%       6860        stress-ng.time.system_time
    269.18 ± 10%    +218.9%     858.49        stress-ng.time.user_time
 4.734e+08 ±  5%    +266.2%  1.734e+09        stress-ng.time.voluntary_context_switches
 5.573e+08 ±  6%    +265.1%  2.035e+09        stress-ng.timer.ops
   9288895 ±  6%    +265.1%   33915351        stress-ng.timer.ops_per_sec
  11366431 ±  2%     -33.7%    7539947 ±  2%  meminfo.Active
  11366431 ±  2%     -33.7%    7539947 ±  2%  meminfo.Active(anon)
  13966810 ±  2%     -26.7%   10238040 ±  3%  meminfo.Cached
  13228581 ±  2%     -28.5%    9461059 ±  3%  meminfo.Committed_AS
    978798 ±  3%     -24.2%     742213 ±  2%  meminfo.Mapped
  18188884           -21.1%   14349727        meminfo.Memused
  10415785 ±  3%     -35.8%    6687008 ±  4%  meminfo.Shmem
  18314446           -21.1%   14457915        meminfo.max_used_kB
    245720 ±  3%     -24.3%     186050 ±  2%  proc-vmstat.nr_anon_pages
   2843787 ±  2%     -33.9%    1880585 ±  2%  proc-vmstat.nr_inactive_anon
   3493822 ±  2%     -26.9%    2554863 ±  3%  proc-vmstat.nr_mapped
   4993412           -19.1%    4037784        proc-vmstat.nr_unaccepted
     44879            -4.6%      42832        proc-vmstat.nr_unevictable
   2606064 ±  3%     -36.0%    1667105 ±  5%  proc-vmstat.nr_writeback_temp
   2843787 ±  2%     -33.9%    1880585 ±  2%  proc-vmstat.nr_zone_active_anon
   4624388 ±  4%     -29.8%    3246513 ±  4%  proc-vmstat.numa_interleave
   4995767 ±  3%     -28.6%    3567888 ±  3%  proc-vmstat.pgalloc_dma32
     22.69 ±100%     -22.7        0.00        perf-profile.calltrace.cycles-pp.dl_server_start.enqueue_task_fair.enqueue_task.ttwu_do_activate.try_to_wake_up
     22.68 ±100%     -22.7        0.00        perf-profile.calltrace.cycles-pp.enqueue_dl_entity.dl_server_start.enqueue_task_fair.enqueue_task.ttwu_do_activate
     22.59 ±100%     -22.6        0.00        perf-profile.calltrace.cycles-pp.start_dl_timer.enqueue_dl_entity.dl_server_start.enqueue_task_fair.enqueue_task
     22.54 ±100%     -22.5        0.00        perf-profile.calltrace.cycles-pp.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity.dl_server_start.enqueue_task_fair
     14.58 ±100%     -14.6        0.00        perf-profile.calltrace.cycles-pp.dl_server_stop.dequeue_entities.dequeue_task_fair.try_to_block_task.__schedule
     14.38 ±100%     -14.4        0.00        perf-profile.calltrace.cycles-pp.hrtimer_try_to_cancel.dl_server_stop.dequeue_entities.dequeue_task_fair.try_to_block_task
     14.24 ±100%     -14.2        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.hrtimer_try_to_cancel.dl_server_stop.dequeue_entities.dequeue_task_fair
     14.19 ±100%     -14.2        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.hrtimer_try_to_cancel.dl_server_stop.dequeue_entities
     13.74 ±100%     -13.7        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity.dl_server_start
     13.69 ±100%     -13.7        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity
      8.62 ±100%      -8.6        0.00        perf-profile.calltrace.cycles-pp.switch_hrtimer_base.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity.dl_server_start
      8.52 ±100%      -8.5        0.00        perf-profile.calltrace.cycles-pp._raw_spin_lock.switch_hrtimer_base.hrtimer_start_range_ns.start_dl_timer.enqueue_dl_entity
      8.48 ±100%      -8.5        0.00        perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.switch_hrtimer_base.hrtimer_start_range_ns.start_dl_timer
     36.86 ±100%     -36.9        0.00        perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
     22.70 ±100%     -22.7        0.00        perf-profile.children.cycles-pp.dl_server_start
     22.70 ±100%     -22.7        0.00        perf-profile.children.cycles-pp.enqueue_dl_entity
     22.61 ±100%     -22.6        0.00        perf-profile.children.cycles-pp.start_dl_timer
     14.58 ±100%     -14.6        0.00        perf-profile.children.cycles-pp.dl_server_stop
     36.86 ±100%     -36.9        0.00        perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      0.20 ± 10%     -75.3%       0.05 ±  4%  perf-stat.i.MPKI
 3.739e+10 ±  3%    +160.6%  9.743e+10        perf-stat.i.branch-instructions
      0.32 ±  2%      -0.1        0.17 ±  2%  perf-stat.i.branch-miss-rate%
 1.134e+08 ±  5%     +36.0%  1.541e+08        perf-stat.i.branch-misses
     13.85 ±  4%      +8.4       22.21 ±  3%  perf-stat.i.cache-miss-rate%
  35907287 ± 12%     -44.3%   20014868 ±  4%  perf-stat.i.cache-misses
 2.356e+08 ± 11%     -66.9%   78055859 ±  5%  perf-stat.i.cache-references
  14772924 ±  4%    +282.4%   56485490        perf-stat.i.context-switches
      3.40 ±  5%     -62.9%       1.26        perf-stat.i.cpi
 6.126e+11            +3.6%  6.344e+11        perf-stat.i.cpu-cycles
     45650 ± 30%     -59.9%      18293 ± 15%  perf-stat.i.cpu-migrations
     25747 ± 26%    +116.1%      55648 ±  6%  perf-stat.i.cycles-between-cache-misses
 1.844e+11 ±  3%    +175.4%  5.079e+11        perf-stat.i.instructions
      0.30 ±  5%    +163.7%       0.80        perf-stat.i.ipc
     65.89 ±  4%    +282.7%     252.13        perf-stat.i.metric.K/sec
      0.19 ±  9%     -79.9%       0.04 ±  3%  perf-stat.overall.MPKI
      0.30            -0.1        0.16        perf-stat.overall.branch-miss-rate%
     15.16 ±  2%     +10.3       25.49 ±  3%  perf-stat.overall.cache-miss-rate%
      3.34 ±  5%     -62.5%       1.25        perf-stat.overall.cpi
     17517 ± 14%     +83.8%      32206 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.30 ±  5%    +166.0%       0.80        perf-stat.overall.ipc
 3.665e+10 ±  3%    +160.9%  9.561e+10        perf-stat.ps.branch-instructions
 1.104e+08 ±  4%     +35.6%  1.497e+08        perf-stat.ps.branch-misses
  35038923 ± 12%     -44.6%   19408879 ±  3%  perf-stat.ps.cache-misses
 2.307e+08 ± 10%     -66.9%   76282209 ±  5%  perf-stat.ps.cache-references
  14499051 ±  4%    +284.5%   55749126        perf-stat.ps.context-switches
 6.024e+11            +3.7%  6.244e+11        perf-stat.ps.cpu-cycles
     44625 ± 30%     -59.3%      18160 ± 16%  perf-stat.ps.cpu-migrations
 1.808e+11 ±  3%    +175.9%  4.987e+11        perf-stat.ps.instructions
 1.109e+13 ±  3%    +176.5%  3.065e+13        perf-stat.total.instructions
    468618 ± 13%    +555.4%    3071214 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.avg
   1760225 ±  9%    +135.1%    4137583 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.max
    126460 ± 13%   +2212.5%    2924391 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.min
    165925 ±  8%     -34.9%     108063 ±  7%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.43 ±  5%     -20.4%       0.35 ±  3%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.43 ±  6%     -22.1%       0.33 ±  5%  sched_debug.cfs_rq:/.h_nr_runnable.avg
   1028326 ± 38%    +209.6%    3183766 ±  4%  sched_debug.cfs_rq:/.left_deadline.max
    221871 ± 14%    +259.8%     798312 ± 18%  sched_debug.cfs_rq:/.left_deadline.stddev
   1028182 ± 38%    +209.6%    3183503 ±  4%  sched_debug.cfs_rq:/.left_vruntime.max
    221805 ± 14%    +259.9%     798242 ± 18%  sched_debug.cfs_rq:/.left_vruntime.stddev
      6383 ± 23%     -60.2%       2539 ±  5%  sched_debug.cfs_rq:/.load.avg
    196131 ±195%     -90.4%      18756 ±  8%  sched_debug.cfs_rq:/.load.max
    468618 ± 13%    +555.4%    3071214 ±  4%  sched_debug.cfs_rq:/.min_vruntime.avg
   1760225 ±  9%    +135.1%    4137583 ±  4%  sched_debug.cfs_rq:/.min_vruntime.max
    126460 ± 13%   +2212.5%    2924391 ±  4%  sched_debug.cfs_rq:/.min_vruntime.min
    165925 ±  8%     -34.9%     108063 ±  7%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.43 ±  5%     -28.3%       0.31 ±  6%  sched_debug.cfs_rq:/.nr_queued.avg
      0.28 ±  9%     +27.0%       0.36 ±  3%  sched_debug.cfs_rq:/.nr_queued.stddev
   1028182 ± 38%    +209.6%    3183503 ±  4%  sched_debug.cfs_rq:/.right_vruntime.max
    221805 ± 14%    +259.9%     798242 ± 18%  sched_debug.cfs_rq:/.right_vruntime.stddev
    255.53 ±  6%     +70.3%     435.29 ±  2%  sched_debug.cfs_rq:/.runnable_avg.avg
    196.91 ±  6%    +118.7%     430.59 ±  3%  sched_debug.cfs_rq:/.util_avg.avg
    372.78 ±  4%     -15.0%     316.74 ±  4%  sched_debug.cfs_rq:/.util_est.avg
     17.52 ±  4%     +33.7%      23.42 ±  7%  sched_debug.cpu.clock.stddev
     69446 ±  5%     +10.8%      76960 ±  2%  sched_debug.cpu.clock_task.avg
     55201 ±  5%     +13.2%      62494 ±  3%  sched_debug.cpu.clock_task.min
      1380 ±  3%     -23.0%       1063 ±  2%  sched_debug.cpu.clock_task.stddev
      1764 ± 11%     +49.9%       2646        sched_debug.cpu.curr->pid.avg
      0.00 ± 18%    +171.9%       0.00 ± 90%  sched_debug.cpu.next_balance.stddev
      0.11 ± 22%    +293.6%       0.44        sched_debug.cpu.nr_running.avg
   1969374 ±  4%    +284.2%    7566629        sched_debug.cpu.nr_switches.avg
   3819538 ± 13%    +122.0%    8477830        sched_debug.cpu.nr_switches.max
      8064 ± 21%  +38772.5%    3134971 ± 21%  sched_debug.cpu.nr_switches.min
    317241 ± 15%     +68.5%     534501 ±  6%  sched_debug.cpu.nr_switches.stddev





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

