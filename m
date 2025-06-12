Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2C1F582E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 06:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749710070; cv=fail; b=YfsJO6zqSzwEiEeCP2iABFi7Jw7rkbme7+laFAsrGw5jfOjckVAVYXsAR7rBL5O16VxgmeLUQBaUMVzBpcADaFhsT+BOoT2K19yG6DfYX4PfULhZ/v0qYC7JOC3hXRyHGVQexFVJpS1UnxSctVC4KY/RKzE0FQxMU05HEoVQSLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749710070; c=relaxed/simple;
	bh=/BzjeA0wII5gfZva/0TeY/eKmHEbuNzKQ+RwF4MnvIw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rr9vRlWqCm7cvFgcBJr84WU3HBCEkBok4RrqSWsfpCByu8+6qheJqgnMl0CN1uSyflUzVFe6RCm+DoR+jTRKS3fxGg4l5e/SUtln+ndy56tsavaGez7iqVrPuQlInG00BJt3oGgUcLFZ92YCh3IfULhBWoCNwqEBmzNRjB86OMI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PSOsXyJZ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PSOsXyJZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749710067; x=1781246067;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=/BzjeA0wII5gfZva/0TeY/eKmHEbuNzKQ+RwF4MnvIw=;
  b=PSOsXyJZvI0dUxWb7EGQ7nCIYa3mjXm7xHzysXoRjNcGgdPWCGFiW6ha
   RRuI8vyq3VgZgXOP3RXIHX35AyhAMcgKObMbwN0iKT02xVP59/b4Y7/ta
   k+qAFfUyX3xlUB5IaaKJOzLl1BOZBSGspYxSUQpsvbI7Fp/hCTPUfNB2y
   VSBqoYHxcnn+Aa3vu44gPOWaXkFKKkGKOHMgLwECspuTmvVYQuNoQjnR8
   t276aW20kqTmpHCXAp2RmQGmXbnxNxRIDmkCI8aeddc+LXUVkptEP+0Q1
   u0I/t96VYQ6lgjIFCfXrSZiKA1/Ffg+5SHOWZ7JqtmW2jYUJWZOC2t6E2
   Q==;
X-CSE-ConnectionGUID: 7RiyrxN6RiWGgx0HRulZyA==
X-CSE-MsgGUID: wisbUniZR0+xUIWaLpIHhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62526890"
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="62526890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:34:26 -0700
X-CSE-ConnectionGUID: B0l7b5trS6WrcGe2mS+7Yw==
X-CSE-MsgGUID: yUo4MFP8Qb2ffIwrIGDPvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,230,1744095600"; 
   d="scan'208";a="147413880"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 23:34:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:34:25 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 23:34:25 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (40.107.101.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 23:34:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fQ/P+XBNaaX/IKnTKEBzx64N/0rkTZkCRtUwD8R7mbiyaRW4rTAWWzzlcCQEN96qfUxVvvyBbgG2EVBHczDaolHt8xwa1BEGLnX9EUW4H4no0BLZadvtQpxWaIInbrN+/wheGPwOWjpnQi67Rbi42dSiaf4UdwXF/f1l+I7d/iJXm7IXIhA/wPY8hwCcAwP6RNfcg5GhaxNJMnyf1qX0rCYWapBtrosxzHBNCHGKqRc78NQBilhlueJyw3Mb1vme9VTmlhMSDWdICqw8sfktHzSM/04hB31hunHj0ZnVruk6YzE+BoQcaQpafyzr6LHm6V6+TGnRMDcDT3XDaQwh3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kzkI7fsBZc7CP+jyowrt+pZmkeS+00gpdf5c4mUdiA4=;
 b=mclGZ/lsjVanTgIuB+ijaWaW2lEb+ZHbXRaUNN4BCkouEY2edakChSpiPLOROWJAnhbyk/1CR1YWcndeY48AnoPS/JI7UQjer08GvBkVWV3bxcAijZcvALCCyrRLXrFXiKf8qI4XsVdTEqdlVWp7piramq3ui/E/9z8Z0AYO4ZoTNp71nD1IFEWsUjwa8nBhQ2HJzBxDGgblT84yJBBbRLgYh9LgFXRpxzAjc0CvMvvOPW9k11YLdaRPfTCs07CZ05jobz1w0DuIcyd76td7qAZfG7mp351AoEaAyOj7VtzfEMNZBk5n8ZHtuBqpctJEuR9Na7+zJEbrODwR1Ulppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MW3PR11MB4572.namprd11.prod.outlook.com (2603:10b6:303:5e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Thu, 12 Jun
 2025 06:34:17 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Thu, 12 Jun 2025
 06:34:17 +0000
Date: Thu, 12 Jun 2025 14:34:07 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Nikhil Dhama <nikhil.dhama@amd.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, Huang Ying
	<ying.huang@linux.alibaba.com>, Raghavendra K T <raghavendra.kt@amd.com>,
	"Mel Gorman" <mgorman@techsingularity.net>, Bharata B Rao <bharata@amd.com>,
	<linux-mm@kvack.org>, <oliver.sang@intel.com>
Subject: [linus:master] [mm]  c544a952ba:  vm-scalability.throughput 33.3%
 improvement
Message-ID: <202506121415.eeceda1d-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MW3PR11MB4572:EE_
X-MS-Office365-Filtering-Correlation-Id: 6506f9f6-13a8-4f10-b68f-08dda97b2804
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Knld4723st92/AH+QMj7XMWzBrtIx5EbeG08RIaz1TVMhMZo8tGfGrwS0m?=
 =?iso-8859-1?Q?kzoKCRVGXJL3UFSqqob6sYJ8PS4+YHnlIgdvNe1nLWEUDa/164kg+9KoAl?=
 =?iso-8859-1?Q?saWobiZPHzu7/7Qe9cqRHJWLcy/HtvcMFTFuIJ9OLJ/fHOwhy63QXJFuYA?=
 =?iso-8859-1?Q?Sppq5hvuk8OgBxSXBqsb1hpcMrYHYPGYydriZ3abHvp+4DwEhTy1HhAApv?=
 =?iso-8859-1?Q?TFxdvIqi/VxapnfW3M5scLUpJIjjBtuTRwa68PF9x4Q+1ynzf5bOclaMPf?=
 =?iso-8859-1?Q?PVDlU8Xv9paJUXrT+VL21ArlR7vXM0IjtgdHjmsp6TE/BIZyxwpTHJvngj?=
 =?iso-8859-1?Q?t/N4oR5gwqM40eHfY7Dwz7bHySRRJf4cJLLd4pzauSL72rC6sITBpyIhrK?=
 =?iso-8859-1?Q?ZVHhjCLJwmnCXcZwmj3Fj2C08+BYhtvy1Z4JegSBdhKaPa9cYYqNxzWR7I?=
 =?iso-8859-1?Q?3QhFyKXga0+6yHpeepzfwcj0e982BfsPR/fI5d/Md06cdTMGF8v8L91nMU?=
 =?iso-8859-1?Q?tiuxl8MV/0C1kwDHpCESSig974h7VRRJIWt8BJFEgRWpxidyIk7DiBsQC7?=
 =?iso-8859-1?Q?GaVrFC336SucAtUgAArZc82MxnMP5GfYTudbs0LrYAKmvwb6pCuWon1K4K?=
 =?iso-8859-1?Q?LnZ04W8fIbxQYmkgK2xrslI2lnq0vUaB24jfUe6ex0FFibIauoXCrXUiZZ?=
 =?iso-8859-1?Q?WJdPM+IvGa9kiyAX13Lr0MYa53+/JpARN7ePMmGFGGs/avVRZ54f+HTCsw?=
 =?iso-8859-1?Q?HXMR34l8JH5sjjAvebMdIDDLHJ92aHyBSY3x0dKtN1zQNtR4YwJEg0CwN4?=
 =?iso-8859-1?Q?IwM7rKJgmYooIX4Eda6HUFTMRj88S2z8LU0QtRyrnSATzoGupJQ5iBxjOu?=
 =?iso-8859-1?Q?ASdZJ87fDcy1EU5r2a6SgPCWSX1FupmSnHrR/1UgMrrCxe5+WXearMQGas?=
 =?iso-8859-1?Q?6aS+u/47Mw4F3J1ZswUppdslnbaAmRZdQpuG0foZBKRWFW2Yn2C64miuHS?=
 =?iso-8859-1?Q?r8KU/vdsebogHnyFW6Iv+FCVjpZyJT+gbSk8mWI5OWL2jCb0ADKVp38JHM?=
 =?iso-8859-1?Q?LE6mzMN7b/uYd5pWCavIkh42FhyLWed+hyDe7p6CEWD/5IHXQGw3x3HhxV?=
 =?iso-8859-1?Q?oYawioTDrf7fJsIN9MevaOT9W7ZnIJV5utglh3eX/uCBST57oBRqySfcTz?=
 =?iso-8859-1?Q?1i1qswM+UkoV1cJwvgkMdVuSzWnxjYrZDWdJ3COTHrVNAKppyyrUDedojI?=
 =?iso-8859-1?Q?6tKkoochynRi9p8czJ8Hu+lZPYq7u7hrdexq7gHcKq8WLQ/qXF+QsTWVUa?=
 =?iso-8859-1?Q?61xXKpIGDfMaRlmbvTmadjneCEbve/CLIpVREGsFgNLiKfh3cSUiDAB5DA?=
 =?iso-8859-1?Q?zkfZgVh5IbqB/hVyFdS6Tx59kTzlRqY4FIHzJT0AifZHrHFfX50ghC7VLU?=
 =?iso-8859-1?Q?FoVHJ/kn1w1b4vpl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?EP1NayKVhGE+52smAu4VM4z5hjgWnSGXw1CnJBzUxeAKFIwKx6E8xRmx6j?=
 =?iso-8859-1?Q?lLckLgSzyJfOduAfrFG8DM0mwiQghYIOK1UsFxDNitbu3yWLlOr8Z66/hS?=
 =?iso-8859-1?Q?+I+y7D2nYi56stZ8vUpykh4cjMu6RgPgcWNgrSk7dIum7Ax5bQjVAXuswY?=
 =?iso-8859-1?Q?SfQ6beDv40x8pMhy4ZZERBLmCVxHqP8SkRJ7e8/55WYvmhD42Tk00keNJF?=
 =?iso-8859-1?Q?p88edmto4nWU9GDrGAwdtQlPM3Plnb926IZNmTdenTXMwTKvARHfvRyJrf?=
 =?iso-8859-1?Q?fwpJJpjoh5Ig5j73xuG41Oh7Ohad5HzvE14z7X+mQmsp/I1e2hskh6YSsz?=
 =?iso-8859-1?Q?k1leCfLXrfG0DovZxRPiMDLq+R5Tpn6RppP3jbvv9KWRdtUtH18D8utueY?=
 =?iso-8859-1?Q?tm+HerwkuijfrIGQZzMSyNX9TayZDfM8TXfk5Loql+3XwQ+xdbTciL5M7j?=
 =?iso-8859-1?Q?/kv2H53gMqQ2Rh7+kfM2ELsyd3O9heoyAz/QeaHmPnUM3Rc9v+9+cxZKLW?=
 =?iso-8859-1?Q?b58SO/rr1voK8mdcmvo+WZIUbwxDrgNNFo5H+M0gMkJyO4Fuk/PbBWhfc1?=
 =?iso-8859-1?Q?oc7Svh9Q8HuvzuNn4JO8uaaUehST5FYCoSaHBrRp9FvvChVOxYoS7Rmftr?=
 =?iso-8859-1?Q?sqDto+P707MMym3tpl0aYBtBAkSYuq3bu1DG8NDs6RL/WmAeGcna7Vdvbu?=
 =?iso-8859-1?Q?cno7Ind4KbiV1889VbSVnCLsOLgCJT5juDxCnhBC7lopUPGEBJVRgDOXNj?=
 =?iso-8859-1?Q?gW/+g9ACt/uIP5+MQOoFqHwU9ADva+FjN0eZaT/o34edX7HXz91L6WiIQi?=
 =?iso-8859-1?Q?nWfB2e199roWqjXHSPtzK1BZauQS8HthYEs3Bk/ynKjGCSKu0dk45Wiu0t?=
 =?iso-8859-1?Q?7b6P1Dr6U9E9rIC7w3QhomFU6bJZOvTqFj8Bezost/+l7bdVKF2VIyXObL?=
 =?iso-8859-1?Q?b15ozv16pPYX1sQvSXBR4UYDFTjQC/9wEm0VtcbW5OQ4U3wULMxfU2i/cr?=
 =?iso-8859-1?Q?gmjZWeKACRl/Ba9n2daG+HUzfMKbPQSq5FFRn/nk0tQwZsvbEiHGvbA+j2?=
 =?iso-8859-1?Q?Dr+qhd9hTm3+/r7g0xY65y5OFHe3ZV5CzIaIhmAOB7sbbYonQTGtoKP+Hd?=
 =?iso-8859-1?Q?eY3+85PiK0RZiNkuoVNshriAjz9cdomJBw69mRzNeViQaT40qfkSvUyJi6?=
 =?iso-8859-1?Q?tnWncxDh6OkP+H8ILbRdyhzjzEZM96SwVzJOkWNpZ2CQJjx/n8oVuda20W?=
 =?iso-8859-1?Q?42yaRmPSaSYuG9VqW/woWXl3hN8rdnvqrBUj3Kr62TLguoBKrNgAWN2Ig7?=
 =?iso-8859-1?Q?7Xs4/4WV1ZiZ0YJiMxtCL+D7+DDkmQRrL2abb5RKnVUs4MCjRdTstF7DTT?=
 =?iso-8859-1?Q?qtwz3N+TrD7C/PzehIAj47aCT8ZtF1nNP2yXkfNqmjBqK3lhhZqqgvBwES?=
 =?iso-8859-1?Q?3dRSTPjgY5uTVau4lNmgYswRphY1Z4NjwJ2uOPeXoKvfCIfcmabep2Y8OX?=
 =?iso-8859-1?Q?1dqSdlZbR6iehkh7AdioIeJO27l9ocEEcBttvNf0XuwyLdW71+qPgs6a+J?=
 =?iso-8859-1?Q?CrED0P9lcIv/k1N8N7DsqCvUa/SzDe+tBy58kyDp9GL3VJd+wmhJTJdxxJ?=
 =?iso-8859-1?Q?l6Rw7z3VQoePwZu9vihkONSRlkexQALKYkXWiwXgdFdY67iaEnGguolQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6506f9f6-13a8-4f10-b68f-08dda97b2804
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 06:34:17.8011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ic/Rmz/wjHEO5h6Ipwpxt48JeirzYRQVy+B4D7WRBBe2wOEAxD0W5rNECMAxeze/tQOpAnAnCYdDieiRQvleLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4572
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 33.3% improvement of vm-scalability.throughput on:


commit: c544a952ba61b1a025455098033c17e0573ab085 ("mm: pcp: increase pcp->free_count threshold to trigger free_high")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


testcase: vm-scalability
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	runtime: 300s
	test: lru-file-mmap-read
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | stress-ng: stress-ng.mlockmany.ops_per_sec 26.2% improvement                                |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_threads=100%                                                                             |
|                  | test=mlockmany                                                                              |
|                  | testtime=60s                                                                                |
+------------------+---------------------------------------------------------------------------------------------+



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250612/202506121415.eeceda1d-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz/300s/lkp-icl-2sp4/lru-file-mmap-read/vm-scalability

commit: 
  05275594a3 ("mm/hugetlb: convert use of struct page to folio in __unmap_hugepage_range()")
  c544a952ba ("mm: pcp: increase pcp->free_count threshold to trigger free_high")

05275594a311cd74 c544a952ba61b1a025455098033 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    291.37           -20.2%     232.63        uptime.boot
    673139 ±  2%     +30.4%     877441        vmstat.system.in
   5607805 ±  3%     +27.3%    7139111 ±  2%  meminfo.MemFree
    350271 ± 39%     -36.3%     223112        meminfo.Shmem
      8.18 ±  5%      +2.2       10.40 ±  5%  mpstat.cpu.all.idle%
      0.33 ±  2%      +0.1        0.43        mpstat.cpu.all.irq%
      0.05 ±  3%      +0.0        0.06 ±  4%  mpstat.cpu.all.soft%
      5.41 ±  2%      +2.1        7.47        mpstat.cpu.all.usr%
   2993468 ±  2%     +19.6%    3578911 ±  4%  numa-meminfo.node0.MemFree
   1180336 ±  5%     -16.9%     980637 ±  3%  numa-meminfo.node1.KReclaimable
   2736544 ±  4%     +28.2%    3508151 ±  4%  numa-meminfo.node1.MemFree
   1180336 ±  5%     -16.9%     980637 ±  3%  numa-meminfo.node1.SReclaimable
   1425319 ±  5%     -14.1%    1223664 ±  2%  numa-meminfo.node1.Slab
      8566 ± 12%     -99.9%       7.50 ± 52%  perf-c2c.DRAM.local
     27919 ± 16%     -99.9%      28.33 ± 18%  perf-c2c.DRAM.remote
     38381 ± 19%    -100.0%      14.00 ± 26%  perf-c2c.HITM.local
     15378 ± 22%     -99.9%      11.50 ± 38%  perf-c2c.HITM.remote
     53760 ± 20%    -100.0%      25.50 ±  9%  perf-c2c.HITM.total
    158863           +33.0%     211265        vm-scalability.median
    478.96 ±  8%     +78.5      557.47 ±  6%  vm-scalability.stddev%
  20675894           +33.3%   27566672        vm-scalability.throughput
    254.01           -23.2%     195.13        vm-scalability.time.elapsed_time
    254.01           -23.2%     195.13        vm-scalability.time.elapsed_time.max
    346310           -17.1%     286989 ±  3%  vm-scalability.time.involuntary_context_switches
     11514            -2.6%      11211        vm-scalability.time.percent_of_cpu_this_job_got
     27528 ±  2%     -27.2%      20046 ±  2%  vm-scalability.time.system_time
      1720            +6.5%       1832        vm-scalability.time.user_time
 1.008e+08 ±  2%     +26.1%   1.27e+08 ±  2%  numa-numastat.node0.local_node
  46106988 ±  5%     -62.0%   17529292 ±  5%  numa-numastat.node0.numa_foreign
 1.008e+08 ±  2%     +26.1%  1.271e+08 ±  2%  numa-numastat.node0.numa_hit
  45572734 ±  2%     -57.4%   19408837 ±  6%  numa-numastat.node0.numa_miss
  45632059 ±  2%     -57.3%   19482589 ±  6%  numa-numastat.node0.other_node
  99912841           +29.7%  1.296e+08        numa-numastat.node1.local_node
  45573431 ±  2%     -57.4%   19407379 ±  6%  numa-numastat.node1.numa_foreign
  99987609           +29.7%  1.297e+08        numa-numastat.node1.numa_hit
  46108268 ±  5%     -62.0%   17530506 ±  5%  numa-numastat.node1.numa_miss
  46183233 ±  5%     -61.9%   17589196 ±  5%  numa-numastat.node1.other_node
    746161 ±  3%     +23.7%     923311 ±  4%  numa-vmstat.node0.nr_free_pages
    246611 ±  7%     +34.7%     332213 ±  8%  numa-vmstat.node0.nr_free_pages_blocks
  46106988 ±  5%     -62.0%   17529292 ±  5%  numa-vmstat.node0.numa_foreign
 1.008e+08 ±  2%     +26.1%  1.271e+08 ±  2%  numa-vmstat.node0.numa_hit
 1.008e+08 ±  2%     +26.1%   1.27e+08 ±  2%  numa-vmstat.node0.numa_local
  45572734 ±  2%     -57.4%   19408837 ±  6%  numa-vmstat.node0.numa_miss
  45632059 ±  2%     -57.3%   19482589 ±  6%  numa-vmstat.node0.numa_other
   2771169 ± 18%     +34.1%    3714827 ±  7%  numa-vmstat.node0.workingset_nodereclaim
    681493 ±  5%     +32.8%     905074 ±  5%  numa-vmstat.node1.nr_free_pages
    229875 ±  8%     +38.6%     318503 ±  6%  numa-vmstat.node1.nr_free_pages_blocks
    295259 ±  5%     -17.1%     244788 ±  4%  numa-vmstat.node1.nr_slab_reclaimable
  45573431 ±  2%     -57.4%   19407379 ±  6%  numa-vmstat.node1.numa_foreign
  99986327           +29.7%  1.297e+08        numa-vmstat.node1.numa_hit
  99911558           +29.7%  1.296e+08        numa-vmstat.node1.numa_local
  46108268 ±  5%     -62.0%   17530506 ±  5%  numa-vmstat.node1.numa_miss
  46183233 ±  5%     -61.9%   17589196 ±  5%  numa-vmstat.node1.numa_other
    108672 ±  2%     -13.3%      94213 ±  3%  proc-vmstat.allocstall_normal
  29372721            -1.1%   29038205        proc-vmstat.nr_file_pages
   1427993 ±  4%     +25.4%    1790140 ±  5%  proc-vmstat.nr_free_pages
    477355 ±  7%     +33.2%     635908 ±  6%  proc-vmstat.nr_free_pages_blocks
    129026 ± 10%     -11.7%     113977        proc-vmstat.nr_inactive_anon
  17750861            -4.6%   16927157        proc-vmstat.nr_inactive_file
  27368452            -2.1%   26793509        proc-vmstat.nr_mapped
    963854            -2.3%     941655        proc-vmstat.nr_page_table_pages
     87744 ± 39%     -36.3%      55884        proc-vmstat.nr_shmem
    608293            -5.9%     572399        proc-vmstat.nr_slab_reclaimable
    129025 ± 10%     -11.7%     113976        proc-vmstat.nr_zone_inactive_anon
  17750842            -4.6%   16927149        proc-vmstat.nr_zone_inactive_file
  91680419 ±  3%     -59.7%   36936671        proc-vmstat.numa_foreign
 2.008e+08           +27.9%  2.568e+08        proc-vmstat.numa_hit
 2.007e+08           +27.9%  2.566e+08        proc-vmstat.numa_local
  91681002 ±  3%     -59.7%   36939344        proc-vmstat.numa_miss
  91815292 ±  3%     -59.6%   37071786        proc-vmstat.numa_other
  79315901 ±  2%      -3.1%   76822231        proc-vmstat.pgactivate
  14012408           +23.4%   17292830 ±  2%  proc-vmstat.pgrefill
     44063           -14.3%      37756 ±  2%  proc-vmstat.pgreuse
 1.324e+09            +1.0%  1.337e+09        proc-vmstat.pgscan_file
      8876 ± 16%     -31.3%       6096 ±  2%  proc-vmstat.pgscan_khugepaged
      3235 ±  9%     +20.6%       3902 ±  5%  proc-vmstat.pgskip_normal
      7535 ± 14%     -30.3%       5255        proc-vmstat.pgsteal_khugepaged
   5069557            +7.1%    5431758 ±  2%  proc-vmstat.workingset_nodereclaim
   3147720            -6.8%    2932833 ±  2%  proc-vmstat.workingset_nodes
  12473294           -23.4%    9554929 ± 19%  sched_debug.cfs_rq:/.avg_vruntime.avg
  12929974           -22.9%    9966685 ± 19%  sched_debug.cfs_rq:/.avg_vruntime.max
   1321627 ±  9%     -24.2%    1001340 ±  9%  sched_debug.cfs_rq:/.avg_vruntime.stddev
      0.80           -10.2%       0.72 ±  2%  sched_debug.cfs_rq:/.h_nr_queued.avg
      0.75           -33.3%       0.50 ± 27%  sched_debug.cfs_rq:/.h_nr_queued.min
      0.80           -10.2%       0.72 ±  2%  sched_debug.cfs_rq:/.h_nr_runnable.avg
      0.75           -33.3%       0.50 ± 27%  sched_debug.cfs_rq:/.h_nr_runnable.min
    883777 ± 13%     -16.5%     738263 ±  5%  sched_debug.cfs_rq:/.load.max
      6026           -34.1%       3973 ± 26%  sched_debug.cfs_rq:/.load.min
    109749 ± 10%     -11.7%      96913 ±  7%  sched_debug.cfs_rq:/.load.stddev
      5.25           -32.3%       3.56 ± 25%  sched_debug.cfs_rq:/.load_avg.min
  12473295           -23.4%    9554929 ± 19%  sched_debug.cfs_rq:/.min_vruntime.avg
  12929974           -22.9%    9966685 ± 19%  sched_debug.cfs_rq:/.min_vruntime.max
   1321627 ±  9%     -24.2%    1001340 ±  9%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.78           -10.7%       0.70 ±  2%  sched_debug.cfs_rq:/.nr_queued.avg
      0.75           -33.3%       0.50 ± 27%  sched_debug.cfs_rq:/.nr_queued.min
    737.92 ±  4%     -31.0%     509.33 ± 25%  sched_debug.cfs_rq:/.runnable_avg.min
    181.56 ±  5%     +26.7%     230.13 ± 11%  sched_debug.cfs_rq:/.runnable_avg.stddev
    114.88 ±  4%     +48.8%     170.94 ± 21%  sched_debug.cfs_rq:/.util_avg.stddev
    126529           -15.7%     106629 ± 13%  sched_debug.cpu.clock.avg
    126549           -15.7%     106646 ± 13%  sched_debug.cpu.clock.max
    126505           -15.7%     106609 ± 13%  sched_debug.cpu.clock.min
    126063           -15.8%     106155 ± 13%  sched_debug.cpu.clock_task.avg
    126305           -15.7%     106439 ± 13%  sched_debug.cpu.clock_task.max
    117995           -16.8%      98215 ± 14%  sched_debug.cpu.clock_task.min
      3723           -11.2%       3306 ±  2%  sched_debug.cpu.curr->pid.avg
    687.67 ±  8%     -38.0%     426.21 ± 31%  sched_debug.cpu.curr->pid.min
      0.80           -10.2%       0.72 ±  2%  sched_debug.cpu.nr_running.avg
      0.75           -33.3%       0.50 ± 27%  sched_debug.cpu.nr_running.min
    126505           -15.7%     106610 ± 13%  sched_debug.cpu_clk
    125796           -15.8%     105902 ± 13%  sched_debug.ktime
    127243           -15.6%     107347 ± 13%  sched_debug.sched_clk
      0.68 ± 43%     -99.3%       0.00 ±223%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      0.94 ±  8%     -66.2%       0.32 ± 58%  perf-sched.sch_delay.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.31 ±  9%     -53.9%       0.14 ± 54%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.31 ± 36%     -48.9%       0.16 ± 62%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      0.10 ± 31%     -45.6%       0.05 ± 19%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.11 ± 50%     -99.8%       0.00 ±223%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
     10.68 ± 65%     -63.2%       3.93 ± 10%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
     34.18 ± 27%     -71.8%       9.62 ± 16%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     46.21 ± 13%     -66.7%      15.36 ± 33%  perf-sched.sch_delay.max.ms.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
      3.19 ± 15%     -39.0%       1.95 ± 36%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     34.51 ± 17%     -62.9%      12.79 ± 40%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     38.32 ± 32%     -74.9%       9.62 ±  7%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.43 ±223%   +5152.1%      22.74 ± 45%  perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    795.17 ±  8%     -25.7%     591.17 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_pages_slowpath.constprop.0.__alloc_frozen_pages_noprof
    175.33 ± 14%    +110.1%     368.33 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_noprof.ifs_alloc.isra.0
    122.67 ± 10%    +138.5%     292.50 ± 15%  perf-sched.wait_and_delay.count.__cond_resched.__rmap_walk_file.try_to_unmap.shrink_folio_list.evict_folios
    650.50 ± 13%     -49.9%     326.17 ± 25%  perf-sched.wait_and_delay.count.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
      1662 ±  8%     +71.6%       2851 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.shrink_folio_list.evict_folios.try_to_shrink_lruvec.shrink_one
    326.00 ± 19%     +89.4%     617.50 ± 21%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
     68.35 ± 27%     -71.8%      19.25 ± 16%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
     34.43 ±223%   +3747.8%       1324 ± 46%  perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     69.01 ± 17%     -62.9%      25.58 ± 40%  perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.50 ± 54%    -100.0%       0.00        perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
      0.65 ± 21%     -90.2%       0.06 ± 92%  perf-sched.wait_time.avg.ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
    149.69 ± 81%     -99.3%       0.99 ±150%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
     98.67 ±140%     -99.2%       0.81 ±100%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      0.43 ±223%   +5152.1%      22.74 ± 45%  perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
      1.90 ± 62%    -100.0%       0.00        perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
     10.68 ± 65%     -63.2%       3.93 ± 10%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_noprof.page_cache_ra_unbounded
     34.18 ± 27%     -71.8%       9.62 ± 16%  perf-sched.wait_time.max.ms.__cond_resched.down_read.xfs_ilock_for_iomap.xfs_read_iomap_begin.iomap_iter
    668.56 ± 70%     -99.7%       2.21 ±180%  perf-sched.wait_time.max.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
    335.21 ±140%     -99.7%       1.03 ±100%  perf-sched.wait_time.max.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     34.43 ±223%   +3747.8%       1324 ± 46%  perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     34.51 ± 17%     -60.8%      13.51 ± 49%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      2.21 ±  3%     +14.9%       2.54 ±  2%  perf-stat.i.MPKI
 3.024e+10           +22.2%  3.697e+10        perf-stat.i.branch-instructions
      0.15            +0.0        0.16        perf-stat.i.branch-miss-rate%
  36100154 ±  2%     +28.9%   46542862        perf-stat.i.branch-misses
     33.69            +3.0       36.72        perf-stat.i.cache-miss-rate%
 2.112e+08           +40.8%  2.973e+08        perf-stat.i.cache-misses
 6.277e+08           +30.5%  8.192e+08        perf-stat.i.cache-references
      3.53           -21.0%       2.79        perf-stat.i.cpi
 3.885e+11            -2.2%  3.801e+11        perf-stat.i.cpu-cycles
    196.49            +4.8%     206.01        perf-stat.i.cpu-migrations
      1897           -33.8%       1257        perf-stat.i.cycles-between-cache-misses
 1.085e+11           +21.2%  1.315e+11        perf-stat.i.instructions
      0.33 ±  2%     +24.5%       0.41        perf-stat.i.ipc
     18.41 ± 21%     +47.9%      27.23 ±  7%  perf-stat.i.major-faults
      5.95           +30.1%       7.74        perf-stat.i.metric.K/sec
    382637           +29.8%     496815        perf-stat.i.minor-faults
    382656           +29.8%     496843        perf-stat.i.page-faults
      1.95           +16.2%       2.26        perf-stat.overall.MPKI
      0.12            +0.0        0.13        perf-stat.overall.branch-miss-rate%
     33.65            +2.7       36.31        perf-stat.overall.cache-miss-rate%
      3.58           -19.4%       2.89        perf-stat.overall.cpi
      1841           -30.6%       1278        perf-stat.overall.cycles-between-cache-misses
      0.28           +24.0%       0.35        perf-stat.overall.ipc
      5706            -7.0%       5307        perf-stat.overall.path-length
 3.013e+10           +22.1%  3.679e+10        perf-stat.ps.branch-instructions
  35910205 ±  2%     +29.0%   46329067        perf-stat.ps.branch-misses
 2.103e+08           +40.7%  2.959e+08        perf-stat.ps.cache-misses
  6.25e+08           +30.4%   8.15e+08        perf-stat.ps.cache-references
 3.872e+11            -2.4%  3.781e+11        perf-stat.ps.cpu-cycles
    195.47            +4.8%     204.89        perf-stat.ps.cpu-migrations
 1.081e+11           +21.1%  1.309e+11        perf-stat.ps.instructions
     18.42 ± 21%     +49.2%      27.49 ±  8%  perf-stat.ps.major-faults
    381143           +29.7%     494396        perf-stat.ps.minor-faults
    381162           +29.7%     494424        perf-stat.ps.page-faults
 2.757e+13            -7.0%  2.565e+13        perf-stat.total.instructions


***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp2/mlockmany/stress-ng/60s

commit: 
  05275594a3 ("mm/hugetlb: convert use of struct page to folio in __unmap_hugepage_range()")
  c544a952ba ("mm: pcp: increase pcp->free_count threshold to trigger free_high")

05275594a311cd74 c544a952ba61b1a025455098033 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
    183479 ±  4%     -14.2%     157507 ±  2%  cpuidle..usage
      2.62 ± 24%      +1.7        4.31 ± 26%  mpstat.cpu.all.idle%
      2.91 ±  4%      -2.0        0.87 ±  3%  mpstat.cpu.all.soft%
    219798 ±  2%     -10.3%     197133 ±  4%  numa-meminfo.node0.Mlocked
    217527 ±  3%     -12.4%     190464 ±  5%  numa-meminfo.node1.Mlocked
    412.05           +15.1%     474.32        vmstat.procs.r
     90984           +20.1%     109298        vmstat.system.cs
    452201            +4.6%     473111        vmstat.system.in
   1453896           -12.4%    1273314        meminfo.AnonPages
  10107135           +12.9%   11406807        meminfo.Memused
    447630           -14.9%     380950 ±  2%  meminfo.Mlocked
  10499561           +12.7%   11833700        meminfo.max_used_kB
 2.409e+08           +22.0%  2.938e+08        numa-numastat.node0.local_node
  2.41e+08           +22.0%  2.939e+08        numa-numastat.node0.numa_hit
 2.375e+08           +21.9%  2.895e+08        numa-numastat.node1.local_node
 2.376e+08           +21.9%  2.897e+08        numa-numastat.node1.numa_hit
     55425 ±  4%      -9.7%      50074        numa-vmstat.node0.nr_mlock
 2.408e+08           +21.9%  2.937e+08        numa-vmstat.node0.numa_hit
 2.407e+08           +21.9%  2.935e+08        numa-vmstat.node0.numa_local
 2.375e+08           +21.9%  2.895e+08        numa-vmstat.node1.numa_hit
 2.374e+08           +21.9%  2.894e+08        numa-vmstat.node1.numa_local
    105.92 ± 14%     -28.9%      75.35 ± 12%  sched_debug.cfs_rq:/.load_avg.avg
    609475 ±  4%     +21.5%     740406 ±  3%  sched_debug.cpu.curr->pid.avg
    725601           +26.0%     913936        sched_debug.cpu.curr->pid.max
    149.67 ±122%    +354.2%     679.83 ± 79%  sched_debug.cpu.curr->pid.min
    260666 ±  7%     +35.7%     353837 ±  5%  sched_debug.cpu.curr->pid.stddev
     16226 ±  2%     +19.2%      19337        sched_debug.cpu.nr_switches.avg
     11199 ±  2%     +20.3%      13471 ±  5%  sched_debug.cpu.nr_switches.min
   1468638           +26.1%    1852566        stress-ng.mlockmany.ops
     24469           +26.2%      30870        stress-ng.mlockmany.ops_per_sec
   2523625           +20.4%    3038711        stress-ng.time.involuntary_context_switches
      2017 ±  5%    +170.5%       5457 ± 31%  stress-ng.time.major_page_faults
 5.066e+08           +22.7%  6.214e+08        stress-ng.time.minor_page_faults
     17966            +3.6%      18609        stress-ng.time.percent_of_cpu_this_job_got
     10789            +3.6%      11180        stress-ng.time.system_time
     62.88 ±  7%     -11.9%      55.38 ±  2%  stress-ng.time.user_time
   2257684           +25.3%    2829176        stress-ng.time.voluntary_context_switches
    361795           -12.4%     316790 ±  2%  proc-vmstat.nr_anon_pages
    126934            -7.0%     118034        proc-vmstat.nr_mapped
    108871 ±  3%     -11.8%      95988 ±  4%  proc-vmstat.nr_mlock
    995769            -1.3%     982916        proc-vmstat.nr_unevictable
    995768            -1.3%     982917        proc-vmstat.nr_zone_unevictable
 4.786e+08           +21.9%  5.836e+08        proc-vmstat.numa_hit
 4.784e+08           +21.9%  5.833e+08        proc-vmstat.numa_local
  4.81e+08           +21.9%  5.862e+08        proc-vmstat.pgalloc_normal
  5.07e+08           +22.6%  6.219e+08        proc-vmstat.pgfault
 4.802e+08           +21.9%  5.854e+08        proc-vmstat.pgfree
 5.397e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_culled
 5.398e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_mlocked
 5.398e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_munlocked
 5.397e+08            +2.1%  5.509e+08        proc-vmstat.unevictable_pgs_rescued
      5.56           +12.8%       6.27        perf-stat.i.MPKI
 2.373e+10            +9.2%  2.591e+10        perf-stat.i.branch-instructions
      0.50            +0.1        0.56        perf-stat.i.branch-miss-rate%
 1.165e+08           +20.4%  1.403e+08        perf-stat.i.branch-misses
 6.635e+08           +24.7%  8.274e+08        perf-stat.i.cache-misses
 1.191e+09           +23.3%   1.47e+09        perf-stat.i.cache-references
     93801           +21.2%     113707        perf-stat.i.context-switches
      5.03            -9.7%       4.54        perf-stat.i.cpi
    905.91           -19.9%     725.22        perf-stat.i.cycles-between-cache-misses
 1.192e+11           +10.3%  1.315e+11        perf-stat.i.instructions
      0.20           +10.7%       0.22        perf-stat.i.ipc
     33.22 ±  5%    +168.8%      89.29 ± 31%  perf-stat.i.major-faults
     15.71 ±  3%     +28.8%      20.23 ±  2%  perf-stat.i.metric.K/sec
   1508049 ±  3%     +28.8%    1942280 ±  2%  perf-stat.i.minor-faults
   1508269 ±  3%     +28.8%    1942666 ±  2%  perf-stat.i.page-faults
      5.57           +13.1%       6.29        perf-stat.overall.MPKI
      0.49            +0.1        0.54        perf-stat.overall.branch-miss-rate%
     55.70            +0.6       56.31        perf-stat.overall.cache-miss-rate%
      5.06            -9.7%       4.57        perf-stat.overall.cpi
    908.46           -20.1%     725.73        perf-stat.overall.cycles-between-cache-misses
      0.20           +10.7%       0.22        perf-stat.overall.ipc
 2.328e+10            +8.9%  2.537e+10        perf-stat.ps.branch-instructions
 1.137e+08           +20.2%  1.367e+08        perf-stat.ps.branch-misses
  6.51e+08           +24.4%  8.101e+08        perf-stat.ps.cache-misses
 1.169e+09           +23.1%  1.439e+09        perf-stat.ps.cache-references
     91964           +21.0%     111300        perf-stat.ps.context-switches
  1.17e+11           +10.1%  1.287e+11        perf-stat.ps.instructions
     32.46 ±  5%    +168.6%      87.20 ± 31%  perf-stat.ps.major-faults
   1478457 ±  4%     +28.6%    1900887        perf-stat.ps.minor-faults
   1478673 ±  4%     +28.6%    1901264        perf-stat.ps.page-faults
 7.179e+12           +10.8%  7.956e+12        perf-stat.total.instructions
      2.21 ±  2%      -9.5%       2.00 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      2.56 ±  2%     -17.6%       2.11 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
      3.55           +11.0%       3.94 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      3.41 ±  2%     +13.1%       3.86 ±  3%  perf-sched.sch_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
      0.38 ±110%    +707.5%       3.03 ± 41%  perf-sched.sch_delay.avg.ms.__cond_resched.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
      0.28 ± 71%    +206.8%       0.86 ± 35%  perf-sched.sch_delay.avg.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      1.89 ±  4%      +9.4%       2.06 ±  6%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      0.09 ±222%   +2246.0%       2.07 ±123%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc.d_alloc_parallel
      0.05 ±  2%     +93.6%       0.10 ± 26%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.29 ±140%    +340.5%       1.26 ± 71%  perf-sched.sch_delay.avg.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3.22           +10.9%       3.58 ±  2%  perf-sched.sch_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      1.21 ± 48%    +100.9%       2.42 ± 26%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.__mutex_lock.constprop.0.pcpu_alloc_noprof
      2.18 ±  2%     -16.7%       1.82        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      3.75           -13.0%       3.26        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
      0.42 ± 90%     -93.5%       0.03 ±131%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.11 ±  4%     -12.9%       0.10 ±  8%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.82 ±  6%     -66.4%       0.28 ±  9%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.58 ±100%    +795.3%       5.17 ± 39%  perf-sched.sch_delay.max.ms.__cond_resched.alloc_vmap_area.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     10.02 ± 17%     +80.6%      18.08 ± 61%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      9.45 ± 21%     +45.5%      13.75 ± 13%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
      1.50 ± 87%    +187.7%       4.33 ± 31%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.part
      5.05 ± 28%     -57.1%       2.16 ± 63%  perf-sched.sch_delay.max.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.18 ±222%   +1309.8%       2.48 ± 95%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc.d_alloc_parallel
      0.21 ±215%    +504.6%       1.25 ±103%  perf-sched.sch_delay.max.ms.__cond_resched.kmem_cache_alloc_noprof.__ksm_enter.ksm_madvise.madvise_vma_behavior
      5.12 ± 42%     -67.3%       1.67 ± 57%  perf-sched.sch_delay.max.ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.48 ±142%    +206.8%       1.48 ± 60%  perf-sched.sch_delay.max.ms.__cond_resched.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
     27.20 ± 19%     -30.2%      18.99 ± 12%  perf-sched.sch_delay.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
      3.55 ±109%    +120.7%       7.84 ± 30%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.97 ± 18%     -95.2%       0.05 ±142%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
     10.45           -13.2%       9.07        perf-sched.total_wait_and_delay.average.ms
    485797 ±  4%     +16.6%     566668        perf-sched.total_wait_and_delay.count.ms
      8.84 ±  2%     -15.5%       7.47        perf-sched.total_wait_time.average.ms
     16.35 ± 16%     -23.4%      12.53 ±  8%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     19.73 ± 40%     -50.0%       9.86 ± 51%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pud_alloc
     15.33 ± 10%     -23.9%      11.66 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
     15.82 ±  3%     -23.7%      12.06 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
      4.02 ±  2%     -21.4%       3.16 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     17.93 ± 15%     -29.1%      12.71 ± 15%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     15.38 ± 15%     -20.6%      12.21 ±  9%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
      7.10           +10.0%       7.81 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
     16.59 ±  9%     -21.7%      12.98 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     16.47 ±  2%     -22.0%      12.85 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      6.47           -19.2%       5.22 ±  4%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     16.49 ±  4%     -20.0%      13.19 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     16.63 ±  3%     -20.6%      13.20 ±  5%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     16.15 ±  2%     -19.0%      13.08 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      1.25 ±223%    +505.0%       7.54 ±  2%  perf-sched.wait_and_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
     54.17 ± 33%     -44.9%      29.84 ± 22%  perf-sched.wait_and_delay.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
     20.67 ± 17%     -28.0%      14.89 ± 12%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     16.65 ±  2%     -22.4%      12.92        perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     16.29 ±  5%     -19.9%      13.04 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
     18.22 ± 40%     -42.7%      10.44 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
     21.12 ±  4%     -16.3%      17.68 ±  7%  perf-sched.wait_and_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     16.29 ±  2%     -23.0%      12.54 ±  6%  perf-sched.wait_and_delay.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
      6.15           +12.1%       6.89 ±  3%  perf-sched.wait_and_delay.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      4.46 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     11.02           -12.0%       9.70        perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     14.08 ±  3%     -24.8%      10.59 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
     13.86 ±  6%     -23.2%      10.64 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
      7.22           -13.5%       6.24        perf-sched.wait_and_delay.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
     64.86 ±  3%     -20.1%      51.82 ±  3%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.24           -10.9%       3.78        perf-sched.wait_and_delay.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     30.11 ±  2%     -20.9%      23.81 ±  3%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      2436 ±  5%     +14.6%       2791 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
     16403 ±  2%     +12.1%      18384 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     34.33 ± 13%     +49.0%      51.17 ± 13%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     58.00 ±  9%     +23.0%      71.33 ± 10%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
    231.50 ± 11%     -39.7%     139.50 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.__kmalloc_node_noprof.alloc_slab_obj_exts.allocate_slab.___slab_alloc
      4931 ±  3%     +35.7%       6690 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.__put_anon_vma.unlink_anon_vmas.free_pgtables.exit_mmap
      9614 ±  7%     +30.8%      12577 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.exit_mmap.__mmput
     25007 ±  4%     +25.4%      31363 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
    766.17 ±  3%     +29.9%     995.00 ±  2%  perf-sched.wait_and_delay.count.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
      2099 ±  3%     +22.9%       2579 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
     10958 ±  7%     -44.7%       6059 ± 12%  perf-sched.wait_and_delay.count.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
    909.33 ±  6%     +22.9%       1117 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
    480.17 ± 10%     +22.3%     587.17 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
      3390 ±  5%     +36.4%       4626 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.down_write.dup_mmap.dup_mm.constprop
    432.67 ±223%    +716.9%       3534 ±  4%  perf-sched.wait_and_delay.count.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      7573 ±  5%     +25.4%       9494 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     15.83 ± 54%     +78.9%      28.33 ± 18%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.dup_mm.constprop.0
      5.33 ±103%    +168.8%      14.33 ± 20%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.mas_dup_build.constprop.0
      1420 ±  7%     +29.4%       1839 ±  5%  perf-sched.wait_and_delay.count.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
    357.67 ±  4%     +45.3%     519.67 ±  7%  perf-sched.wait_and_delay.count.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
     19.17 ± 14%     +47.0%      28.17 ± 16%  perf-sched.wait_and_delay.count.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
      8887 ±  4%     -58.1%       3719 ± 11%  perf-sched.wait_and_delay.count.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    295.33 ±  9%     +35.3%     399.67 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     20982 ±  3%     +33.5%      28021 ±  3%  perf-sched.wait_and_delay.count.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
     52.00 ±  5%     +10.3%      57.33 ±  2%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      4024 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    127121 ±  4%     +20.5%     153203        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
     42940 ±  4%     +16.6%      50078        perf-sched.wait_and_delay.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      5577 ±  7%     +63.8%       9134 ±  3%  perf-sched.wait_and_delay.count.io_schedule.folio_wait_bit_common.filemap_fault.__do_fault
      4913 ±  4%     +12.4%       5521 ±  2%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
      4025 ±  5%     +34.9%       5429 ±  5%  perf-sched.wait_and_delay.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
     26101 ±  5%     +33.1%      34753 ±  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     33647 ±  4%     +20.3%      40470 ±  3%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    144.82 ± 42%     -56.5%      63.01 ± 55%  perf-sched.wait_and_delay.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     26.04 ±223%    +564.0%     172.91 ± 45%  perf-sched.wait_and_delay.max.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      1849 ±  7%     -14.0%       1589 ±  4%  perf-sched.wait_and_delay.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
    128.53 ± 62%     -72.3%      35.62 ± 38%  perf-sched.wait_and_delay.max.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
    343.72 ±  4%     -30.9%     237.64 ± 18%  perf-sched.wait_and_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    693.56 ± 65%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     14.21 ± 18%     -27.3%      10.33 ±  9%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.__pmd_alloc
     13.07 ± 11%     -27.0%       9.54 ± 15%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.alloc_pages_noprof.pte_alloc_one
      1.14 ±  2%     -13.7%       0.98 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
     13.81 ±  4%     -28.4%       9.89 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.wp_page_copy
      1.47 ±  3%     -28.0%       1.06 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.__get_user_pages.populate_vma_page_range.__mm_populate.do_mlock
     15.97 ± 16%     -32.3%      10.81 ± 17%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_cache_node_noprof.__get_vm_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     13.23 ± 16%     -24.5%       9.99 ± 11%  perf-sched.wait_time.avg.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     12.89 ± 39%     -50.9%       6.34 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.__kvmalloc_node_noprof.proc_sys_call_handler.vfs_read.ksys_read
      3.55            +9.1%       3.87 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_finish_mmu.vms_clear_ptes.part
      2.99 ±  2%     +18.9%       3.55 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.__tlb_batch_free_encoded_pages.tlb_flush_mmu.zap_pte_range.zap_pmd_range
     14.49 ± 10%     -25.0%      10.87 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.copy_page_range.dup_mmap.dup_mm.constprop
     14.41 ±  3%     -25.3%      10.76 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      4.40           -24.4%       3.33 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.down_read.__mm_populate.do_mlock.__x64_sys_mlock
     14.57 ±  4%     -23.5%      11.14 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_clone.anon_vma_fork.dup_mmap
     14.75 ±  4%     -24.5%      11.14 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.anon_vma_fork.dup_mmap.dup_mm
     14.14 ±  2%     -22.3%      10.99 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.dup_mmap.dup_mm.constprop
      1.72 ± 11%     -21.1%       1.35 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.vma_prepare.commit_merge.vma_merge_existing_range
      3.96 ± 22%     -60.6%       1.56 ± 63%  perf-sched.wait_time.avg.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
     52.12 ± 35%     -45.9%      28.21 ± 24%  perf-sched.wait_time.avg.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      1.96 ± 54%     -82.1%       0.35 ±118%  perf-sched.wait_time.avg.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
     17.60 ± 20%     -37.4%      11.02 ± 22%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.alloc_pid.copy_process.kernel_clone
     14.58 ±  2%     -25.7%      10.83 ±  2%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.anon_vma_fork.dup_mmap.dup_mm
     14.16 ±  6%     -23.0%      10.91 ±  4%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_dup.dup_mmap.dup_mm
      2.40 ±  2%     -16.1%       2.02        perf-sched.wait_time.avg.ms.__cond_resched.mlock_pte_range.walk_pmd_range.isra.0
      3.75 ±105%    +344.5%      16.65 ± 81%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock.ldt_dup_context.dup_mmap.dup_mm
     14.01 ±  8%     -19.3%      11.31 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
     17.31 ± 41%     -44.5%       9.61 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
     21.07 ±  4%     -16.5%      17.59 ±  7%  perf-sched.wait_time.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
     14.37 ±  3%     -27.4%      10.43 ±  6%  perf-sched.wait_time.avg.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
      2.58 ± 14%    +100.4%       5.17 ±  8%  perf-sched.wait_time.avg.ms.__cond_resched.wp_page_copy.__handle_mm_fault.handle_mm_fault.do_user_addr_fault
      2.92           +13.4%       3.32 ±  3%  perf-sched.wait_time.avg.ms.__cond_resched.zap_pte_range.zap_pmd_range.isra.0
      8.46           -17.6%       6.97        perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.28 ± 12%     -31.0%       0.88 ± 15%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown]
     11.90 ±  3%     -26.3%       8.77 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_clone
     11.98 ±  6%     -25.8%       8.89 ±  4%  perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.anon_vma_fork
      3.47 ±  4%     -14.0%       2.98        perf-sched.wait_time.avg.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_anon_vmas
     64.75 ±  3%     -20.1%      51.72 ±  3%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      2.01 ±  3%     -16.9%       1.67 ±  2%  perf-sched.wait_time.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
     29.29 ±  2%     -19.6%      23.54 ±  3%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    142.78 ± 42%     -59.9%      57.28 ± 65%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_node_noprof.__vmalloc_area_node.__vmalloc_node_range_noprof.__vmalloc_node_noprof
     10.02 ± 17%     +80.6%      18.08 ± 61%  perf-sched.wait_time.max.ms.__cond_resched.down_read.acct_collect.do_exit.do_group_exit
      9.45 ± 21%     +45.5%      13.75 ± 13%  perf-sched.wait_time.max.ms.__cond_resched.down_read.exit_mmap.__mmput.exit_mm
     10.12 ± 26%     -66.3%       3.41 ± 93%  perf-sched.wait_time.max.ms.__cond_resched.down_write_killable.__x64_sys_munlock.do_syscall_64.entry_SYSCALL_64_after_hwframe
    131.43 ± 50%     -65.9%      44.88 ± 43%  perf-sched.wait_time.max.ms.__cond_resched.dput.step_into.link_path_walk.part
      1849 ±  7%     -14.0%       1589 ±  4%  perf-sched.wait_time.max.ms.__cond_resched.generic_perform_write.shmem_file_write_iter.vfs_write.ksys_write
      4.11 ± 52%     -83.6%       0.68 ±121%  perf-sched.wait_time.max.ms.__cond_resched.khugepaged.kthread.ret_from_fork.ret_from_fork_asm
    127.30 ± 62%     -73.8%      33.40 ± 33%  perf-sched.wait_time.max.ms.__cond_resched.pidfs_exit.release_task.wait_task_zombie.__do_wait
    343.68 ±  4%     -30.9%     237.63 ± 18%  perf-sched.wait_time.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      5.26 ± 57%     +95.1%      10.26 ± 22%  perf-sched.wait_time.max.ms.__cond_resched.unmap_page_range.unmap_vmas.exit_mmap.__mmput
    222.76 ± 22%     -27.2%     162.26 ± 29%  perf-sched.wait_time.max.ms.__cond_resched.uprobe_start_dup_mmap.dup_mm.constprop.0
     27.20 ± 19%     -30.2%      18.99 ± 12%  perf-sched.wait_time.max.ms.__cond_resched.zap_pmd_range.isra.0.unmap_page_range
     11.95 ± 31%     -40.1%       7.16 ± 12%  perf-sched.wait_time.max.ms.io_schedule.folio_wait_bit_common.__do_fault.do_read_fault
     43.65 ± 73%     -67.6%      14.12 ± 18%  perf-sched.wait_time.max.ms.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.unlink_file_vma_batch_process





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

