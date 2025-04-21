Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493A2571D9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 05:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214525; cv=fail; b=Z5cM9X58MBjEprBmtMm/KepYVRAe1dTS67MTOMvOMWc/Um+1i7MUIn2r4ozgyjNuBO7RsvrExwVrMzn0Gcy2koi31BiQ0Ae1TQg7v0qWU2pyCMEIgO/4djqmfnzPYUZyrXSk5+su//nLorr5xoUzWhyiphZrvDuYbcedd9dFckk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214525; c=relaxed/simple;
	bh=BSiYoFz2wr6XDlmcadEpo0aPVtTqzl6lAOR1JR3cqaw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=RxYMXpsb7tE/pZTf2Iexw4Kex9RWvwk8XEdT9BExCVQsHwilwLY7zaFbVt6nSFX7EPACFKLMQmn+iylXfilkMqjgHBu4nSmXKXMH9bd3pzVr+Zuyqko4rrmZkJITUGepkOf6uysQpC6Co3tDKMkuqK+mC7QsFvbAsTJaAS6GUcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eoqKWDMj; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eoqKWDMj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745214522; x=1776750522;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=BSiYoFz2wr6XDlmcadEpo0aPVtTqzl6lAOR1JR3cqaw=;
  b=eoqKWDMjdIoS09dMubbU5GgUxjN8i4MWV1BGyHwhqbG/6k41pLU34CBX
   uDL7xSjkhPbOBnGOK4oz7ryLD3yp99jVNdj3E69swy2n6NtKN8gKu/dmz
   6leYrzB3PLBmnjLlZVBmNC0tai8BS/4d5E6gjqapHN2YVdvKQvAh5TSDN
   LT3d/aMBJxBh6O6GnFcBdeNg9zAzV8+qjEbT4MiCOq/c875PjXOE8hZNX
   oRJIuh8B0Skatyz8RTTG87MZm5hfY37aDqFV4pHpCgzesQXRheLAR87Ta
   SpUbdrL7zqgiwoM1Mumv1XuABl2Nb2KAeEAkVD1kD4GcGSeskhC22QOOd
   g==;
X-CSE-ConnectionGUID: 9Uty2p6ES1ONhZSWMmmYbg==
X-CSE-MsgGUID: F0GklGcZTcuMAestJEEFyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46843281"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46843281"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:48:42 -0700
X-CSE-ConnectionGUID: 5Jhj5Y/sSZm18f4fufBRWw==
X-CSE-MsgGUID: 3VUY0ws6TPiCRuSUiqQdWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="168832514"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2025 22:48:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 20 Apr 2025 22:48:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 20 Apr 2025 22:48:40 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 20 Apr 2025 22:48:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sV0oZWlFGRcNuDKXNUhUd8q5XLWC2kgPk+gtL/0KHossZocLsyb1BggDCbSjkvEGfjYH1izfXzfmOkplpHgXPs42HQGwBJpnl6EuXgh6z9kob+llimjeJPyd9u1iIsa5VV3kbSanEM/PDYaR116IBQHfXh8FyZ4y4FtmpBi2VQIVZG2tHdNfQGEZtUgT8u6QxDmC45Cv8XxPSgPk3Exi2RgTotxn7GZyIRp3MkZS1VBsXPr5YBsl4tdssX1av9IQ49+gzL5X90pJti3eUwcl3aQ+FZLgT/EGX6ecy0tntbIVXC+IF3DCKz/NjrWqelWDHeYBjq3KaPak9N6RuO20hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=beoHlVPc4kt+X7jDjsF64zbBrZLGFRLpp5jMdPys//A=;
 b=Y82DAIEqHx2Op6WiVcrxSiR0MMktEzrkcRzKISeytbmFC9bK/LQjg3NIqXqyqvaICC3GvoyisT5FnHH5WmAYaeOTr30rWOHHtQb99HA4ie1OuQwqVFEFXInoKaP17k89CFrEv/ptpMkjyDtxMWAYrPdeLJg28yXuseiaASULI0Tshu7kL//h54DdwkSUyn2n50P5KXPHOAwmklhWIPp/rKLuO3YbDaUxhx/OAjQf6VJ4V5fC1uo/+Y2sZ0eQyvIc3EHLhKuniOcz0EqDaX3ESQF4zHrItG0o0RdT98zQq6KZ0L3JBytXQGFGnQHHUmnN+9Mq3D+KxrT6oxlVdq9bLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8774.namprd11.prod.outlook.com (2603:10b6:610:1cd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Mon, 21 Apr
 2025 05:48:37 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%4]) with mapi id 15.20.8655.031; Mon, 21 Apr 2025
 05:48:37 +0000
Date: Mon, 21 Apr 2025 13:48:27 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Ingo Molnar <mingo@kernel.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Amit Shah <amit.shah@amd.com>, "Nikolay
 Borisov" <nik.borisov@suse.com>, <oliver.sang@intel.com>
Subject: [linus:master] [x86/bugs]  27ce8299bc:  netperf.Throughput_tps 23.1%
 improvement
Message-ID: <202504211337.3c954295-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0011.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::23)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8774:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f99149-0404-44d2-c1d2-08dd80982944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?YPr+0GaCIZm9vL4jV/fElHGw6B/19G8gqInhqtlzSDD6lk0CxtV1BQfcJg?=
 =?iso-8859-1?Q?955DlsyR0nAm+qibfx+WkDUYd0T2vWSnvEYy4YSPSCxDkPg7oCJohcEJ+j?=
 =?iso-8859-1?Q?AHEqBPKVis6Enapb0ByPm9xjQ7ge9qWZJ1jdUyEoErJSB+r6z3Q9wAFyf0?=
 =?iso-8859-1?Q?hY398/4qAbyvWm6YHZYAQRKdz9W0CdarDZ0ePV0dXWtLhDpAyHSX83bBAH?=
 =?iso-8859-1?Q?fW6pvYnOWJi8vtQ1qiULLI5GzlcSgLy0BQi5rbSpmVHkkfbI3XBWgPZlkQ?=
 =?iso-8859-1?Q?XnSJ80cwQaHgaZ68S7TF5qOcwt6ir0GF1X9LIcptrLs7apKqBpO/lkIdQh?=
 =?iso-8859-1?Q?sp3nENJuP0+wv+NGLs5wIBU8jyWovg6AFVvGwgaYYLw1GUK0giZUPibVVU?=
 =?iso-8859-1?Q?1jze3ysM5MU1aO6YYhe7g8fsQ0YvPoBh7g5uMpUVAcGAE2G8VMFAFDPjz+?=
 =?iso-8859-1?Q?vm1sU48KkdKPoI6yr7oHPK6oVvEnI9OwSvGDVwqblxeYFSSj2IqfFoMwLI?=
 =?iso-8859-1?Q?FD3ZcHZ0ZnDy/teuHv8RiFmrbuIKIDfv5Wm6jBPcmA0vcqSyJrv2J50/zh?=
 =?iso-8859-1?Q?zzSpUW10YbK0+HmnE1Da9xn6OE4TyHqHQJor892DRJkUwknsBDH57Lg2+8?=
 =?iso-8859-1?Q?RrYwYdI+0v6Twabobh3TAcZjnLdjvPm5ephAnZ+6KSOeyZPGTjLLSOeB7L?=
 =?iso-8859-1?Q?0GDlxVXUJiU9BN9KbykomziCY0u+4BBm+pdF9bGUHUsxWh9QrtIRv79TVI?=
 =?iso-8859-1?Q?2HCuNAdwFiA3WQtdWU9p1C4vIEGSxPaKVlxSdTnXUcH8PUzMxyuyBfJvla?=
 =?iso-8859-1?Q?1J467rYQxauS2jzrTkCxWJp9TRFC58yO4gQwd4Ar8ye/9WbL8meloe8mT9?=
 =?iso-8859-1?Q?np2fCN92J5t9gJEZQ6k9ZzowcalmKEppYsTo1m5amqFnnTd+3o+4NV8vKt?=
 =?iso-8859-1?Q?87tD6fOGVqhk3RxXItFzMsI3c6nlGGx96CGG7fC1Zs629NuayKdgzMpc6W?=
 =?iso-8859-1?Q?ShcDDwkMilkx2KfXeWx2sV/32LTQfbz5XVqGAmxe0LAzF03bWb1QZv2ioY?=
 =?iso-8859-1?Q?CdUalEBcETaTkkjpwhpz+YXTO8h+tgLDMqnVFUSusq9rQ9TAdac9BErpGG?=
 =?iso-8859-1?Q?AvYRGq0Aw/9xroCP8IvLLkPkauNhOyFDZ6cdOZxmRfluGOq4uumzH2MK2o?=
 =?iso-8859-1?Q?lzHf9wul3JD0sPKiV7PM9plTVN9zlgznV//lPtwDPPXZJJWR5dwMRx8u1g?=
 =?iso-8859-1?Q?8BS25d/zrgf/kLiosdeOfdm6EFfIe5G8gLqupLar569HNZix8bq1JhZThR?=
 =?iso-8859-1?Q?7PRasCMnggmVnGSBPiN/ZmIZ2PfTw+EMQOWZ3XneDqC1iQlRBxoSM0M9jx?=
 =?iso-8859-1?Q?ZnbfpCRb6EL7KMcI0vp2r4Dj7UGMBv7+ek/kpr28dT7B2Fh7aAmWtutPKc?=
 =?iso-8859-1?Q?zUYB7EtHS/sw+DpJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?udd2Fxrq95BX+yfmUMofXQc7dKK69kxdufXnduNL2EW0BOL1utE7WIa5Sv?=
 =?iso-8859-1?Q?6wysqZo0jMOxRK17AWo4oHMIDAIIhYGdYGRsP6qcaGrqTCL7KoI2oeD/TT?=
 =?iso-8859-1?Q?htfPP6fe9AWkhCi1Xtu8+pj3m3M2tuwSPhAEq+1LHSMtZ9QmtE0puuKmT2?=
 =?iso-8859-1?Q?ALNyjma1WtFPMOU5Wkx865+4IU8j9f2xj5IGhrGpNFPgFVhkfued44Dtaz?=
 =?iso-8859-1?Q?FY1ppbDdm/wzarP2sYCS0KH7VF2cueaciyySej+Bdwyh5bfyybABQzLLv1?=
 =?iso-8859-1?Q?A46jr38k7PZUK4umTDszd7R3zMiO+xgkJRbPo9ZBWCkACzMvLmbDg4Zov0?=
 =?iso-8859-1?Q?H/feCgg9POnrG0nXv1HO4Ge7w5a2LYz//6wCFD1QDcCHENBIEsU/MfQXbo?=
 =?iso-8859-1?Q?ztEHQW2xElwdq8sZp+JR2OEQWpr944m9v0mhzZrOanmUcjXv/UgM1Q33xY?=
 =?iso-8859-1?Q?LOoB9jsvaBAveD/dN7d4GLLaSYlx/5PWR7ew4wghvMEnEIH8cJBSfOQ17k?=
 =?iso-8859-1?Q?g2jBrI3m4BGNQOlWKCvvVtnSJSvjOzlTUZXlxstUOSo5lYf1EqGZmtMMcX?=
 =?iso-8859-1?Q?BPDbY6rSS22vGS9lIe5HFG8Vlw/pNn46j63z0FywuiJG5ZzKEScG0ojzxn?=
 =?iso-8859-1?Q?yO5LgPpaITSrZsWU1eZGlYqramzLP3p56MX16rxgH31OadGf6CxEwgrNMm?=
 =?iso-8859-1?Q?yH0sgSDuekVm8kL6dSa7OtoT4f+hkYqB4kTIAYgqEZekNuJohqVfXr5LYG?=
 =?iso-8859-1?Q?sArjDC9Bj+VQKMBvpBxW7qid5OSLXSgXlFsSKmZF6An6vLpu4W/YrHpbux?=
 =?iso-8859-1?Q?C/rDax2fqw2Ab4xwVaEul3S6Nw9e/x9f291AMArv/zmkgYEOmOCZLzuqz8?=
 =?iso-8859-1?Q?CpZVT7jDAQL1Qz7RvGXGF4XswKUSmMAsf6h+L8Kjbh+9K8zBgEM3zcqb7e?=
 =?iso-8859-1?Q?ta2sSEjPCL8AyzCnHAZEiZ9kTte4IHPTkOfuQxs9zy3/E4cv6Hl0PAM7Kv?=
 =?iso-8859-1?Q?6bUKd6jjGYadLwAo7+o8hi44YuIZv/3caRTdfe1EteBM65asyRrHSilNcP?=
 =?iso-8859-1?Q?mSYP8uaqmZpXhfoiKJzp4RPvEK58JWv/KktaeYfiuAk2y0lyJm/5Lvz9iQ?=
 =?iso-8859-1?Q?AIAaRiUUvQ5BN6cwbezObqYWUo4/k/clhM7RuJnEDoN/PZGXyEZitdYijL?=
 =?iso-8859-1?Q?y0Pk/oRR0UVEkh8GtPSySqpCkSNegZq0SEPqjgNWAKcckHnog5QwGUOKqM?=
 =?iso-8859-1?Q?jsLpX2F7zScg4BeU9gdZvU4LLchK1U4YhoifD2QH0l8hD93aNWO+kDNsMS?=
 =?iso-8859-1?Q?L03NEH/FvjAljK+meZgbuV6EDNp0+SU7Xf/Qi9OsW0+i3w65CfIS5PlbAs?=
 =?iso-8859-1?Q?H69x+mBZiskjtoqz4UdB8WhxBIDYvwyeeZpTpTEQbRwvSpa6JF0ku5IyR+?=
 =?iso-8859-1?Q?dJkSgV5mCmTE7+HzDoAsF3j2RKv3KBd8zIM2Y+CHgINPNLp5yziWaW1wut?=
 =?iso-8859-1?Q?cnsWg87ZXGZHeVwWe893euH1er6V7vkisNKjJy/VHGK4Csrl4O6cL9Vha5?=
 =?iso-8859-1?Q?f1X5wqcAKavTq47mE6OQUC/TLL8JXfXaD0si1yK41EJ+nDcuuCkR1sDowa?=
 =?iso-8859-1?Q?5dI2hFqtPR52x4rNg5td8Qbrkbr58wP5mChOQzP5j01JAhfoZQsaHN+Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f99149-0404-44d2-c1d2-08dd80982944
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 05:48:37.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3vCOYcoq/RyTPiYA2ksZY+VokdOKY/F1lmcTwcLQFwply6pUiRmdhXgX+ajHbS9nxJcjzMZEVfYdjI3tBRSCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8774
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 23.1% improvement of netperf.Throughput_tps on:


commit: 27ce8299bc1ec6df8306073785ff82b30b3cc5ee ("x86/bugs: Don't fill RSB on context switch with eIBRS")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: netperf
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
parameters:

	ip: ipv4
	runtime: 300s
	nr_threads: 50%
	cluster: cs-localhost
	test: TCP_RR
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+--------------------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.sem.sem_wait_calls_per_sec 10.0% improvement                                      |
| test machine     | 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory            |
| test parameters  | cpufreq_governor=performance                                                                           |
|                  | nr_threads=100%                                                                                        |
|                  | test=sem                                                                                               |
|                  | testtime=60s                                                                                           |
+------------------+--------------------------------------------------------------------------------------------------------+
| testcase: change | netperf: netperf.Throughput_Mbps 21.7% improvement                                                     |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory |
| test parameters  | cluster=cs-localhost                                                                                   |
|                  | cpufreq_governor=performance                                                                           |
|                  | ip=ipv4                                                                                                |
|                  | nr_threads=50%                                                                                         |
|                  | runtime=300s                                                                                           |
|                  | send_size=10K                                                                                          |
|                  | test=SCTP_STREAM_MANY                                                                                  |
+------------------+--------------------------------------------------------------------------------------------------------+




Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250421/202504211337.3c954295-lkp@intel.com

=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-9.4/50%/debian-12-x86_64-20240206.cgz/300s/igk-spr-2sp3/TCP_RR/netperf

commit: 
  18bae0dfec ("x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline")
  27ce8299bc ("x86/bugs: Don't fill RSB on context switch with eIBRS")

18bae0dfec15b24e 27ce8299bc1ec6df8306073785f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 3.017e+09           +23.0%  3.712e+09        cpuidle..usage
      2.10            -0.3        1.78 ±  3%  mpstat.cpu.all.usr%
     59598 ± 76%     +94.3%     115800 ± 48%  numa-numastat.node0.other_node
     59598 ± 76%     +94.3%     115800 ± 48%  numa-vmstat.node0.numa_other
  19701282           +23.3%   24284882        vmstat.system.cs
     18.71 ± 71%    +340.8%      82.47 ± 55%  perf-sched.sch_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.__sys_sendto
      1008 ± 12%     -32.2%     683.24 ± 19%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
     12.40 ± 23%     -62.4%       4.67 ±101%  perf-sched.wait_and_delay.count.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     63.40 ± 18%     -33.0%      42.50 ± 21%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_node_noprof.__alloc_skb.tcp_stream_alloc_skb.tcp_sendmsg_locked
     70.40 ± 13%     -30.4%      49.00 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.lock_sock_nested.tcp_sendmsg.__sys_sendto.__x64_sys_sendto
    152.80 ± 15%     -35.0%      99.33 ± 19%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
     69.16 ± 47%    +167.8%     185.23 ± 40%  perf-sched.wait_and_delay.max.ms.__cond_resched.__release_sock.release_sock.tcp_sendmsg.__sys_sendto
   5018731           +23.1%    6177264        netperf.ThroughputBoth_total_tps
     52278           +23.1%      64346        netperf.ThroughputBoth_tps
   5018731           +23.1%    6177264        netperf.Throughput_total_tps
     52278           +23.1%      64346        netperf.Throughput_tps
    424880 ±  4%     +56.5%     665128 ±  7%  netperf.time.involuntary_context_switches
      2787            +4.7%       2916        netperf.time.percent_of_cpu_this_job_got
      7940            +5.9%       8407        netperf.time.system_time
    453.82           -17.1%     376.38        netperf.time.user_time
 1.504e+09           +23.1%  1.852e+09        netperf.time.voluntary_context_switches
 1.506e+09           +23.1%  1.853e+09        netperf.workload
   3837554 ±  3%     +14.4%    4388386 ±  6%  sched_debug.cfs_rq:/.avg_vruntime.max
      0.43 ±  2%      +7.4%       0.46 ±  3%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.43 ±  2%      +7.2%       0.46 ±  3%  sched_debug.cfs_rq:/.h_nr_runnable.avg
    318469 ±  8%     +21.0%     385456 ±  5%  sched_debug.cfs_rq:/.left_deadline.avg
   3424819           +11.4%    3813991 ±  2%  sched_debug.cfs_rq:/.left_deadline.max
    947183 ±  3%     +14.5%    1084809 ±  2%  sched_debug.cfs_rq:/.left_deadline.stddev
    318450 ±  8%     +21.0%     385434 ±  5%  sched_debug.cfs_rq:/.left_vruntime.avg
   3424623           +11.4%    3813781 ±  2%  sched_debug.cfs_rq:/.left_vruntime.max
    947126 ±  3%     +14.5%    1084745 ±  2%  sched_debug.cfs_rq:/.left_vruntime.stddev
   3837554 ±  3%     +14.4%    4388386 ±  6%  sched_debug.cfs_rq:/.min_vruntime.max
      0.42 ±  2%      +7.0%       0.45 ±  3%  sched_debug.cfs_rq:/.nr_queued.avg
    318450 ±  8%     +21.0%     385434 ±  5%  sched_debug.cfs_rq:/.right_vruntime.avg
   3424623           +11.4%    3813781 ±  2%  sched_debug.cfs_rq:/.right_vruntime.max
    947126 ±  3%     +14.5%    1084745 ±  2%  sched_debug.cfs_rq:/.right_vruntime.stddev
    131.48 ±  2%     +15.7%     152.16 ±  2%  sched_debug.cfs_rq:/.util_est.avg
    145.54            +9.8%     159.78 ±  2%  sched_debug.cfs_rq:/.util_est.stddev
      4847 ± 11%     -25.5%       3613 ±  9%  sched_debug.cpu.avg_idle.min
  15457316           +22.7%   18969638        sched_debug.cpu.nr_switches.avg
  16517179           +24.8%   20609615        sched_debug.cpu.nr_switches.max
  13827971 ±  3%     +15.0%   15900842 ±  5%  sched_debug.cpu.nr_switches.min
    362618 ±  7%     +75.8%     637634 ± 10%  sched_debug.cpu.nr_switches.stddev
 4.113e+10           +19.5%  4.916e+10        perf-stat.i.branch-instructions
      0.58            -0.3        0.27 ±  2%  perf-stat.i.branch-miss-rate%
   2.3e+08           -45.7%  1.248e+08 ±  2%  perf-stat.i.branch-misses
 1.565e+09           +15.1%    1.8e+09        perf-stat.i.cache-references
  19900050           +23.2%   24525361        perf-stat.i.context-switches
      1.56           -12.6%       1.36        perf-stat.i.cpi
 3.248e+11            +6.4%  3.454e+11        perf-stat.i.cpu-cycles
    115466 ±  3%     -11.7%     101909 ±  6%  perf-stat.i.cpu-migrations
 2.098e+11           +21.3%  2.545e+11        perf-stat.i.instructions
      0.65           +14.1%       0.74        perf-stat.i.ipc
    103.90           +23.1%     127.90        perf-stat.i.metric.K/sec
      0.56            -0.3        0.25 ±  2%  perf-stat.overall.branch-miss-rate%
      1.55           -12.3%       1.36        perf-stat.overall.cpi
      0.65           +14.1%       0.74        perf-stat.overall.ipc
     42083            -1.7%      41384        perf-stat.overall.path-length
   4.1e+10           +19.5%    4.9e+10        perf-stat.ps.branch-instructions
 2.292e+08           -45.7%  1.244e+08 ±  2%  perf-stat.ps.branch-misses
 1.559e+09           +15.1%  1.794e+09        perf-stat.ps.cache-references
  19830610           +23.3%   24442385        perf-stat.ps.context-switches
 3.237e+11            +6.4%  3.443e+11        perf-stat.ps.cpu-cycles
    115199 ±  3%     -11.7%     101743 ±  6%  perf-stat.ps.cpu-migrations
 2.091e+11           +21.4%  2.537e+11        perf-stat.ps.instructions
 6.336e+13           +21.0%  7.669e+13        perf-stat.total.instructions


***************************************************************************************************
lkp-spr-r02: 224 threads 2 sockets Intel(R) Xeon(R) Platinum 8480CTDX (Sapphire Rapids) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-spr-r02/sem/stress-ng/60s

commit: 
  18bae0dfec ("x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline")
  27ce8299bc ("x86/bugs: Don't fill RSB on context switch with eIBRS")

18bae0dfec15b24e 27ce8299bc1ec6df8306073785f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
      3242 ±197%    +548.0%      21014 ± 81%  numa-meminfo.node0.AnonHugePages
 1.729e+08           +10.3%  1.908e+08 ±  2%  vmstat.system.cs
      3.00 ± 50%    +122.1%       6.67 ± 37%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     25.78 ± 25%     +55.0%      39.95 ± 18%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      3.00 ± 50%    +122.1%       6.67 ± 37%  sched_debug.cfs_rq:/.removed.util_avg.avg
     25.78 ± 25%     +55.0%      39.95 ± 18%  sched_debug.cfs_rq:/.removed.util_avg.stddev
  26219071           +11.9%   29350573        sched_debug.cpu.nr_switches.max
      1.83 ±208%   +1375.8%      27.06 ± 57%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    106.79 ±219%    +711.3%     866.45 ± 39%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      3.68 ±212%   +1369.9%      54.11 ± 57%  perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    213.70 ±222%    +710.9%       1732 ± 39%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.90 ±208%   +1321.6%      27.05 ± 57%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    109.49 ±219%    +691.3%     866.45 ± 39%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
 1.296e+10 ±  2%      +8.7%  1.409e+10        stress-ng.sem.ops
  2.16e+08 ±  2%      +8.7%  2.348e+08        stress-ng.sem.ops_per_sec
    302558           +10.0%     332730        stress-ng.sem.sem_timedwait_calls_per_sec
    301686           +10.0%     331735        stress-ng.sem.sem_trywait_calls_per_sec
    302524           +10.0%     332698        stress-ng.sem.sem_wait_calls_per_sec
  1.09e+10           +10.3%  1.202e+10 ±  2%  stress-ng.time.involuntary_context_switches
      2765            +2.8%       2842        stress-ng.time.user_time
 1.399e+11            +2.0%  1.426e+11        perf-stat.i.branch-instructions
      1.04            -0.7        0.30        perf-stat.i.branch-miss-rate%
  1.42e+09           -71.5%   4.04e+08        perf-stat.i.branch-misses
     31.24 ± 11%      +3.4       34.63 ±  5%  perf-stat.i.cache-miss-rate%
 1.796e+08           +10.2%  1.979e+08 ±  2%  perf-stat.i.context-switches
      0.99            -5.9%       0.93        perf-stat.i.cpi
 6.499e+11            +6.1%  6.894e+11        perf-stat.i.instructions
      1.02            +6.1%       1.08        perf-stat.i.ipc
      1.01            -0.7        0.28        perf-stat.overall.branch-miss-rate%
      0.98            -5.7%       0.93        perf-stat.overall.cpi
      1.02            +6.0%       1.08        perf-stat.overall.ipc
 1.376e+11            +2.0%  1.403e+11        perf-stat.ps.branch-instructions
  1.39e+09           -71.5%  3.964e+08        perf-stat.ps.branch-misses
 1.757e+08           +10.3%  1.939e+08 ±  2%  perf-stat.ps.context-switches
 6.396e+11            +6.0%  6.783e+11        perf-stat.ps.instructions
 3.925e+13            +5.9%  4.156e+13        perf-stat.total.instructions



***************************************************************************************************
igk-spr-2sp3: 192 threads 2 sockets Intel(R) Xeon(R) Platinum 8468V  CPU @ 2.4GHz (Sapphire Rapids) with 384G memory
=========================================================================================
cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/send_size/tbox_group/test/testcase:
  cs-localhost/gcc-12/performance/ipv4/x86_64-rhel-9.4/50%/debian-12-x86_64-20240206.cgz/300s/10K/igk-spr-2sp3/SCTP_STREAM_MANY/netperf

commit: 
  18bae0dfec ("x86/bugs: Don't fill RSB on VMEXIT with eIBRS+retpoline")
  27ce8299bc ("x86/bugs: Don't fill RSB on context switch with eIBRS")

18bae0dfec15b24e 27ce8299bc1ec6df8306073785f 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 1.383e+08 ±  3%     +24.4%  1.721e+08 ±  2%  cpuidle..usage
    154471 ±  4%     +30.1%     200987 ±  6%  meminfo.Shmem
    146073 ±  5%     +30.0%     189902 ±  8%  numa-meminfo.node1.Shmem
      5743 ±  4%     +20.0%       6889 ±  6%  perf-c2c.HITM.local
 3.143e+08 ±  7%     +28.4%  4.035e+08 ±  6%  numa-numastat.node1.local_node
 3.145e+08 ±  7%     +28.4%  4.037e+08 ±  6%  numa-numastat.node1.numa_hit
      0.03            +0.0        0.03        mpstat.cpu.all.irq%
      0.66 ±  3%      +0.1        0.80 ±  2%  mpstat.cpu.all.soft%
      3.31 ±  3%      +0.7        3.97 ±  2%  mpstat.cpu.all.sys%
     36537 ±  5%     +30.0%      47492 ±  7%  numa-vmstat.node1.nr_shmem
 3.145e+08 ±  7%     +28.4%  4.037e+08 ±  6%  numa-vmstat.node1.numa_hit
 3.143e+08 ±  7%     +28.4%  4.035e+08 ±  6%  numa-vmstat.node1.numa_local
      9.41 ±  4%     +10.3%      10.37 ±  6%  vmstat.procs.r
    890417 ±  3%     +24.6%    1109662 ±  2%  vmstat.system.cs
     24697 ±  3%     +12.3%      27728 ±  2%  vmstat.system.in
    227082            +5.2%     238914        proc-vmstat.nr_active_anon
    917466            +1.3%     929058        proc-vmstat.nr_file_pages
     38644 ±  4%     +30.0%      50238 ±  6%  proc-vmstat.nr_shmem
    227082            +5.2%     238914        proc-vmstat.nr_zone_active_anon
 6.489e+08 ±  3%     +21.7%  7.896e+08 ±  2%  proc-vmstat.numa_hit
 6.487e+08 ±  3%     +21.7%  7.892e+08 ±  2%  proc-vmstat.numa_local
 3.735e+09 ±  3%     +21.7%  4.547e+09 ±  2%  proc-vmstat.pgalloc_normal
 3.735e+09 ±  3%     +21.7%  4.547e+09 ±  2%  proc-vmstat.pgfree
     68149 ±  6%     +31.8%      89840 ±  3%  sched_debug.cfs_rq:/.avg_vruntime.avg
     28973 ± 16%     +42.0%      41141 ± 11%  sched_debug.cfs_rq:/.avg_vruntime.min
     19941 ±  8%     +22.6%      24454 ±  4%  sched_debug.cfs_rq:/.avg_vruntime.stddev
     68149 ±  6%     +31.8%      89840 ±  3%  sched_debug.cfs_rq:/.min_vruntime.avg
     28973 ± 16%     +42.0%      41141 ± 11%  sched_debug.cfs_rq:/.min_vruntime.min
     19941 ±  8%     +22.6%      24454 ±  4%  sched_debug.cfs_rq:/.min_vruntime.stddev
    697844 ±  3%     +24.1%     866113 ±  2%  sched_debug.cpu.nr_switches.avg
   1574988 ±  4%     +18.8%    1870629 ±  6%  sched_debug.cpu.nr_switches.max
    281842 ±  4%     +16.0%     327055 ±  6%  sched_debug.cpu.nr_switches.stddev
      1432 ±  3%     +21.7%       1742 ±  2%  netperf.ThroughputBoth_Mbps
    137495 ±  3%     +21.7%     167304 ±  2%  netperf.ThroughputBoth_total_Mbps
      1432 ±  3%     +21.7%       1742 ±  2%  netperf.Throughput_Mbps
    137495 ±  3%     +21.7%     167304 ±  2%  netperf.Throughput_total_Mbps
     27575 ±  2%     +22.0%      33655 ±  2%  netperf.time.involuntary_context_switches
    363.00 ±  3%     +21.7%     441.67 ±  2%  netperf.time.percent_of_cpu_this_job_got
      1072 ±  3%     +21.6%       1304 ±  2%  netperf.time.system_time
     23.66 ±  2%     +20.2%      28.44        netperf.time.user_time
    933935            -9.5%     844837        netperf.time.voluntary_context_switches
 5.035e+08 ±  3%     +21.7%  6.127e+08 ±  2%  netperf.workload
      0.04 ± 19%     +45.1%       0.05 ± 15%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_dentry_open.vfs_open
     20.08 ±  6%     -28.0%      14.45 ±  7%  perf-sched.total_wait_and_delay.average.ms
    130158 ±  6%     +39.6%     181663 ±  7%  perf-sched.total_wait_and_delay.count.ms
     20.06 ±  6%     -28.0%      14.43 ±  7%  perf-sched.total_wait_time.average.ms
    349.52 ± 19%     -32.0%     237.78 ±  7%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      4.13 ±  7%     -31.8%       2.82 ±  8%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
     46.67 ± 16%     +42.5%      66.50 ± 11%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
    112061 ±  7%     +46.7%     164429 ±  8%  perf-sched.wait_and_delay.count.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
    349.50 ± 19%     -32.0%     237.77 ±  7%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_poll
      4.12 ±  7%     -31.8%       2.81 ±  8%  perf-sched.wait_time.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg
 5.554e+09 ±  3%     +20.2%  6.679e+09 ±  2%  perf-stat.i.branch-instructions
      0.48            -0.1        0.37        perf-stat.i.branch-miss-rate%
  27633900 ±  2%      -9.7%   24960530        perf-stat.i.branch-misses
   7520666 ±  3%     +26.9%    9545462 ±  4%  perf-stat.i.cache-misses
 7.246e+08 ±  3%     +21.5%  8.805e+08 ±  2%  perf-stat.i.cache-references
    899481 ±  3%     +24.6%    1120839 ±  2%  perf-stat.i.context-switches
      1.18            -1.9%       1.16        perf-stat.i.cpi
 3.456e+10 ±  3%     +18.9%  4.111e+10        perf-stat.i.cpu-cycles
    376.24            +3.5%     389.52        perf-stat.i.cpu-migrations
      4676            -6.5%       4374 ±  4%  perf-stat.i.cycles-between-cache-misses
 2.928e+10 ±  3%     +21.0%  3.542e+10 ±  2%  perf-stat.i.instructions
      0.85            +1.9%       0.86        perf-stat.i.ipc
      4.68 ±  3%     +24.7%       5.84 ±  2%  perf-stat.i.metric.K/sec
      0.50            -0.1        0.37        perf-stat.overall.branch-miss-rate%
      1.18            -1.7%       1.16        perf-stat.overall.cpi
      4598            -6.1%       4315 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.85            +1.7%       0.86        perf-stat.overall.ipc
 5.536e+09 ±  3%     +20.2%  6.657e+09 ±  2%  perf-stat.ps.branch-instructions
  27543972 ±  2%      -9.7%   24877296        perf-stat.ps.branch-misses
   7492755 ±  3%     +26.9%    9510891 ±  4%  perf-stat.ps.cache-misses
 7.222e+08 ±  3%     +21.5%  8.776e+08 ±  2%  perf-stat.ps.cache-references
    896552 ±  3%     +24.6%    1117213 ±  2%  perf-stat.ps.context-switches
 3.445e+10 ±  3%     +18.9%  4.097e+10        perf-stat.ps.cpu-cycles
    374.91            +3.5%     388.20        perf-stat.ps.cpu-migrations
 2.918e+10 ±  3%     +21.0%   3.53e+10 ±  2%  perf-stat.ps.instructions
 8.832e+12 ±  3%     +21.0%  1.069e+13        perf-stat.total.instructions





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

