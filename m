Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5C6258CE4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747637939; cv=fail; b=sTedtkbPzKIFMYuamhV6RIBa1/5vIccWFaG4OtX8AklY0pxfPC09PHJmuwDFHqZblshSwXIS8OWS69JzOqD60SGbgKjKQZoKLndO+BLhYUjqSzYchkMU+9tcLANzVmN//yfVWlDyfipVkvey9lNVggf0iMrdOf+Wop/Ecpv3KJI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747637939; c=relaxed/simple;
	bh=GxGwJN+IqvaoYeh7T5+m8ZZuklCIHXs3Se3iWAI7HyQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=s1cmhYFGHxwr9rdUI7pfTPxVTWc3+o6+hYacij1DP65O9hzHkTjuciLE5VI7ieJfWhDzJnQQmoJ8f2GJy4L2fO8cM1YscHQ6wKnU6ob2cUtusd92afHbD8vX5jMM1Q67kZcdagVmJAPkk9VkxN9JodwQJXUbaQbVUt1gFiqaRXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J//fpjpn; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J//fpjpn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747637936; x=1779173936;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=GxGwJN+IqvaoYeh7T5+m8ZZuklCIHXs3Se3iWAI7HyQ=;
  b=J//fpjpnq9/QCj0CiQKekuY+i43+yGRKRnHQEAxSUMx4xhjgPKMw5fnn
   7x+gzldc80wo5AEcu1i8295P6oQ6taa8R2dhtusMLmgn8jpi4zmk4PJgc
   n0pPsCTcxWM4fVsdn9O8SnHGr7vsvhCLvTzSWPhPmaJ9FJmdbP2wPqXtL
   bO6+ET6pNVJjCzSsoVRrf4Lw0zxpGBBfocVsrxMyQt+DWrj7eUFwN5AWk
   qu8q+l+3DLw1wAIg+hZmJSBJ9NaNwfS7Q0fpJQ7i2AGrvGCJfLskOnEQL
   rPKNap95z7thteZNe9Y3i8L1klbESonDMwy8t1nJcRQcJRrAydm/2mPiN
   g==;
X-CSE-ConnectionGUID: VgvZS4RGRFOJ7qLhTJGDVw==
X-CSE-MsgGUID: ZJ7x3KyFQSGMM+Pg7MJZpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="49400186"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="49400186"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:58:56 -0700
X-CSE-ConnectionGUID: GBb3jcFoTYaQNkvFGkazTg==
X-CSE-MsgGUID: 6FjvrUnVSOigZAcThd6Dgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="143283008"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 23:58:55 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 23:58:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 23:58:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 23:58:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBrp73x4k2LQvSL1jkCxjUJG8jCUyeYNmSeLdPvOc6jskGk2ane12NBhXZobfJdK9R0yI6csllBh3VxisUGKG1luOP4AmefpJU0k8dQUbCsT1EwTNfXDu2xYZQSoA+88d3sbcB6e7yokK/V7SefTDy4jALzTT371c+aip1BHsYdbboQk+yA482oqKDT6phFLHDms++yWEhfNbM8p9iSDvgPjbmet7G47HsvPKGO8ETNeErYxfa3fvf0nLsNoxZKXCkSqt3bTCPw8E3VVigXY19A4Mhfb3Pb4tt15Q/oKX7DzxbZROE/By/S4a3h+IiHpsCLBjxbOTjBoqwlhnJxUMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+dD/S+fnII+JT+yoq5pYveoq4/lkVoQN8oss3GIfew=;
 b=FRimqCnLmBBsEtv3P5MQrHL4JYIhsdfdRK+wblJZ5FfFYOLItc9X95cq2IZGSrWI4iOnWzVLWXocBBdBZ/0BMYt0mc4HEElXesA6PLYFApMjE8pfWJCiS+JR05NdrIapcwvgqJ0KugQKKGi6zqyo2BMOaOUv32J4kv9B0oF991cu8egsPimNEqGjcVSRRKbJXpCg0iG2eEWcaXZePazUn8PwEYpUFPpugRImkaD7IbjMO5R6bgL75noySOic3mhq8yZq/HITijfGaVqaTSpN+6OvQYRJXpePV5y51Bhe0y6+qeUE2BIZJ34tTQzAs447o6KnKLrhajnwGQSNFxy5tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 06:58:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 06:58:24 +0000
Date: Mon, 19 May 2025 14:58:14 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, <linux-kernel@vger.kernel.org>,
	<x86@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	<oliver.sang@intel.com>
Subject: [tip:locking/futex] [futex]  7c4f75a21f:
 phoronix-test-suite.speedb.SequentialFill.op_s 11.7% regression
Message-ID: <202505191432.b25b9c1f-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR01CA0190.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA4PR11MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 22b20487-c133-4e8a-c154-08dd96a28c53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?PNhZyklvom7gy8QrTStDyfLrhcatGSvYFdeBZNdb5aZpAFBkDPlmPkjBBG?=
 =?iso-8859-1?Q?i27ynHCcniG2fY6E7yo4LW+yVDZ8YQwKBSiVDp0vAjJnhQMUaMX8SkgbUf?=
 =?iso-8859-1?Q?DFuSYAYbyX/Rkj/J5edZhu2lyUe+V9XJo2BHh2IsCTa4ggrmly6N0PIObN?=
 =?iso-8859-1?Q?R4aC+tCY1+I8BYHMJNlhxawm4ps+nBhUN8DuOseizTwOIxbPAHCjZlZxiL?=
 =?iso-8859-1?Q?rInLH+IFjqv2B4VNwFkZUN3DGbzB7zviyI2EtZPYLdG9QITBV0XoWeOBRv?=
 =?iso-8859-1?Q?+9XKVLQl6UOCb4M+AOl835AxNkab3wB7dO4dGDltaJ5xeZYrNuqc7hyXH5?=
 =?iso-8859-1?Q?fqQhGG9OuxJw62PkYXffsvL3kNjKWQrZjh+Ggbhwqzj+PIH98VFdBbdBk0?=
 =?iso-8859-1?Q?wlC1hVDh9bnI/7ZHDmvpJUgs6iKO8W2nwez4a30OD5zF91mlFstH24PJxh?=
 =?iso-8859-1?Q?GQF7Fy0//48WR1J7Z7XknqJA4W8W6oGYzA9GgQbgYYAITDIYYbRWV++GJw?=
 =?iso-8859-1?Q?mU+IGtMnDTnBNVnJEQJgzAT+63v8wYu4iWIARaC950KZs/eAgVY7i+nHvl?=
 =?iso-8859-1?Q?GLqOkk4us5lolQJq02DFfdfaFikHx811zxRyDCW+sleQf8PO2bNTwCL1mQ?=
 =?iso-8859-1?Q?3wGwX1mqax7dHAHgTU5E6mfzqHVqKkJgkpYAEKb2izCf/nlMuQfnrdxteo?=
 =?iso-8859-1?Q?URXJnotg5OPwMUMy/HHdD8Zmmz1aLLLYpaGSvKiFPfqkwJ5wcZcursDKYq?=
 =?iso-8859-1?Q?BBXyq/sjP1cILyKvkVCH7VW1AGJ2JCH9VQu3473+s1CAu8tcMuxMW2AyYV?=
 =?iso-8859-1?Q?Yvku96nJGiE+bKYj3pjgdHrrlVuuHOJrkXKQI46wIvoSI/Sk5nMjUkvXcE?=
 =?iso-8859-1?Q?n9ubw6NQG6haAuC/s03NZIzOVZQNlaRgOsYRjwQ87L+eAP4+hM1rq7JRx5?=
 =?iso-8859-1?Q?EQgzlGaz4RJo1Nwu2+T6CPMWwpCC9MZmodSnfPickS9DVew5kXL3ANgzRc?=
 =?iso-8859-1?Q?bKqAVgry4M4EGk+NQJ1CrlhFZL38qR907ZAYHO9NzEOSeWF9yqBvg2b4C9?=
 =?iso-8859-1?Q?PZHaWUa273u3Ew8uTta/uMFuFAh0eh87mD90Pyp4nOKTkhfMcGXUolld78?=
 =?iso-8859-1?Q?F/nQGX5q0D1aIkR6yH+Mvo5E1Mj7mqRgiFXOs6H3h1y+lHaCiW6gELHrMi?=
 =?iso-8859-1?Q?YyXImTEobmIixkJv9fbdG9pykBGq/Dm3C0T1nLjtxszH2XHv5SJZ8S5RaD?=
 =?iso-8859-1?Q?EiRdYqBsvo7+WfJt/wRiZQp2UuCzJR7xVsKPZiAnqNRXZ5DCs3/xsQLhiS?=
 =?iso-8859-1?Q?DIBpX8yKWNj+HMgztyzz05dxpWO4pLEJ0wsOBdRJwN7HzgklOE8D8B3wA5?=
 =?iso-8859-1?Q?Rjj9Bxd51GXgl9MDqXxApwAHEpCxmV51UVAxNDZmxCayDZO1V6G1gWFFwm?=
 =?iso-8859-1?Q?goauuie6EDOTgGLN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dKJKAnvR50GAGRcMnZdxJEdYZbSkCtyaXRUl2inzvCIFRzP5yTLnHBK/NT?=
 =?iso-8859-1?Q?0XZnZkrF8mV94YSRfcZn/WmDdH7CCxUQWjnJDEcxX+gAHldAyLCkEGoYMS?=
 =?iso-8859-1?Q?lqzWHHtyEGBAdGYBdJ+WD2Ai+P4FIlXIr/pdNcwoJo8ubIsqIM58uCktDo?=
 =?iso-8859-1?Q?tKwdIzGZUK2lwfoa6mjuMeORM2Y4PZsUjJKb74+REqQ0j6tMEO5H/4M+bx?=
 =?iso-8859-1?Q?G5W3bq0W5lBSKJqBheem8p+RsLS4HxgrGsbyKExw+aXRRqmRzbdu2Snhpx?=
 =?iso-8859-1?Q?JKgUamsuHONmdw83qyT6ta66U6gLbU4ocjVvJhTaUm/xdV6uw3yp2eUCG8?=
 =?iso-8859-1?Q?PVpYBkKssAPIB0DzOewXP7GmLdZcpe+LjWjR1ndgI0UNn2SIMjzLznMZQa?=
 =?iso-8859-1?Q?DrMDl2h5RjQv7FIu4DPCAttf61tMx68EKPAcRZBzL3R0dQERKKgmT8ijis?=
 =?iso-8859-1?Q?nxW6z+X6bQE315m2jZVeyAUH4/R8tJ6IBefa93ggkQD/ZjVpbywO+BXXu7?=
 =?iso-8859-1?Q?HcA7yIgPQYN9FU/X9FPDzD+OpgPX0XnekKdQPGQ9larDFQq6nzeDD1smgj?=
 =?iso-8859-1?Q?EAbrWuz9eQj7hQpb3LaTov6hjog0jTj/TOisVmi5VVOagLTt8vu0CjNW+a?=
 =?iso-8859-1?Q?Mhn/ps2wEBYCyZngQQI5p5qYRjeKPgm+HRBBFEKK0VaOOy+ZHKk23uCmoD?=
 =?iso-8859-1?Q?pU2I65LleyxT4kVDbQ9AVNIE4S0OXurmH1w8FJv7zTnVoOUH6MCWeNeL4z?=
 =?iso-8859-1?Q?hsB1JPH8LR54W509IBbmXDX0gvikT6mKNq7OfL4OTC3ucl02T8pM3ri4ax?=
 =?iso-8859-1?Q?e1n30ljjf6ZN1exF5ALCSDF5Doko5ocWDf7iUIhyA8YrLK0FST0ik3dWvj?=
 =?iso-8859-1?Q?+UMnEp58mBeOeqzWGg/PSCwVI7ruK2QjczBQoqlMg3lrEs9qoEXezYTKju?=
 =?iso-8859-1?Q?k18uUqHIYs9w8wgx+pBK2Ll1TVfgTd/hqysXRuF6AAAc4yw0mAGmbWau0S?=
 =?iso-8859-1?Q?iHDDsBOi8WnHHKuqb5PELGe7+Zlpgx9x3wbU+Y1z3G74t2aAVU1oYX8+UJ?=
 =?iso-8859-1?Q?VWIU6cT5LNa0SU9bGs9qdqsFTfbXde5okxfAK3C7iDchtEK8bWq8jFgYVl?=
 =?iso-8859-1?Q?uTlwoqvlJNjNCnQSmfaw6dKS6766NH4cQBLZ5gI3NAI0oa5yUPhRS2VwWg?=
 =?iso-8859-1?Q?Z4Kye4RmeHoB5teJg5JpJRGWKBTSYTohw54cIFt0uoT9ibx0AlXk2NC/0/?=
 =?iso-8859-1?Q?z0gnUOcyh1eGhks/DkKgETZoFVxwI3ko8QdQFLHecZqehVw6pWQm3pdQ11?=
 =?iso-8859-1?Q?m7+x60YCaRxZ5cbdWW69pVHTy0E5wJnQft/+6e0cGrI6MdBp5UwRBHxPcg?=
 =?iso-8859-1?Q?MRzvcRSoDlGl4AqVLSbvv9inCaMVXnC/Xv7nUw7GCT6Ii52uKCjQi+Cs8Q?=
 =?iso-8859-1?Q?bCeHo68pTU79R3H8VmKiLVAOS73g4aqnAdM/tTHbWzTOp81W/kEwLRTbmN?=
 =?iso-8859-1?Q?DCmdiECAl5hoO3sNULaoq2oDdvhvuMAltimkEvrVtbDkPD42ERwLSwcLAh?=
 =?iso-8859-1?Q?uqgLAzpnfa2Asv1v5uMo9QyH2lrqZ0muVg+5DGIZtow3euKgCX1Ft+cQxK?=
 =?iso-8859-1?Q?HEvfX9M9S5HwFWU52Vsn8y7gqX3aKqf/HuwIeI1hbvOhD9w7BrkxRx3A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b20487-c133-4e8a-c154-08dd96a28c53
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 06:58:24.3207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UpgkI9OD2ZbuNPE2kd46Bl7tVnSUCG/EpkNeXSNDsvG33UwVQ+UdVFUpbZlGRbLoqjSv4oJthY2cP1d1DZIYcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
X-OriginatorOrg: intel.com



Hello,

kernel test robot noticed a 11.7% regression of phoronix-test-suite.speedb.SequentialFill.op_s on:


commit: 7c4f75a21f636486d2969d9b6680403ea8483539 ("futex: Allow automatic allocation of process wide futex hash")
https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git locking/futex

[test failed on linux-next/master 484803582c77061b470ac64a634f25f89715be3f]

testcase: phoronix-test-suite
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.60GHz (Ice Lake) with 128G memory
parameters:

	test: speedb-1.0.1
	option_a: Sequential Fill
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the following tests:

+------------------+---------------------------------------------------------------------------------------------+
| testcase: change | perf-bench-futex: perf-bench-futex.ops/s  94.6% regression                                  |
| test machine     | 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory |
| test parameters  | cpufreq_governor=performance                                                                |
|                  | nr_task=100%                                                                                |
|                  | runtime=300s                                                                                |
|                  | test=hash                                                                                   |
+------------------+---------------------------------------------------------------------------------------------+


If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505191432.b25b9c1f-lkp@intel.com


Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250519/202505191432.b25b9c1f-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/Sequential Fill/debian-12-x86_64-phoronix/lkp-icl-2sp5/speedb-1.0.1/phoronix-test-suite

commit: 
  80367ad01d ("futex: Add basic infrastructure for local task local hash")
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")

80367ad01d93ac78 7c4f75a21f636486d2969d9b668 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
 6.085e+10           +14.7%  6.979e+10        cpuidle..time
    832.35           +11.0%     923.95        uptime.boot
     75739           +11.9%      84762        uptime.idle
    745.32           -11.5%     659.62        vmstat.io.bi
   1256218            -5.3%    1190033        vmstat.system.cs
   1512066            -4.4%    1445260        proc-vmstat.nr_active_anon
   1758143            -3.9%    1688770        proc-vmstat.nr_file_pages
     48547            -5.9%      45679        proc-vmstat.nr_mapped
   1147755            -6.1%    1078202        proc-vmstat.nr_shmem
   1512066            -4.4%    1445260        proc-vmstat.nr_zone_active_anon
   1252996 ±  7%     +49.6%    1875006 ± 14%  proc-vmstat.numa_pte_updates
      0.56           +10.4%       0.62        perf-sched.total_wait_and_delay.average.ms
   3397230            -9.6%    3070064        perf-sched.total_wait_and_delay.count.ms
      0.56           +10.5%       0.62        perf-sched.total_wait_time.average.ms
      0.18           +10.9%       0.20        perf-sched.wait_and_delay.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
   3388022            -9.6%    3061182        perf-sched.wait_and_delay.count.futex_do_wait.__futex_wait.futex_wait.do_futex
      1238           +11.3%       1378        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.18           +11.2%       0.20        perf-sched.wait_time.avg.ms.futex_do_wait.__futex_wait.futex_wait.do_futex
      1238           +11.3%       1378        perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    554832           -11.7%     490186        phoronix-test-suite.speedb.SequentialFill.op_s
    713.28           +12.8%     804.49        phoronix-test-suite.time.elapsed_time
    713.28           +12.8%     804.49        phoronix-test-suite.time.elapsed_time.max
    258734 ±  3%     -14.9%     220243 ±  7%  phoronix-test-suite.time.involuntary_context_switches
      4069            -3.4%       3931        phoronix-test-suite.time.percent_of_cpu_this_job_got
     18615           +12.0%      20857        phoronix-test-suite.time.system_time
     10416            +3.5%      10776        phoronix-test-suite.time.user_time
 4.488e+08            +6.8%  4.792e+08        phoronix-test-suite.time.voluntary_context_switches
      0.36            +8.0%       0.39        perf-stat.i.MPKI
  27161568            -2.5%   26475937        perf-stat.i.branch-misses
     28.74            +1.8       30.50        perf-stat.i.cache-miss-rate%
  53609412            +7.0%   57337744        perf-stat.i.cache-misses
   1262748            -5.3%    1195372        perf-stat.i.context-switches
      0.98            -3.1%       0.95        perf-stat.i.cpi
  1.46e+11            -3.5%  1.408e+11        perf-stat.i.cpu-cycles
      2826            -9.6%       2556        perf-stat.i.cycles-between-cache-misses
      0.03            -0.0        0.03 ±  4%  perf-stat.i.dTLB-load-miss-rate%
   4282480 ±  2%      -7.6%    3958135        perf-stat.i.dTLB-load-misses
      0.01 ±  2%      -0.0        0.01 ±  4%  perf-stat.i.dTLB-store-miss-rate%
    636770 ±  4%     -24.1%     483093 ±  2%  perf-stat.i.dTLB-store-misses
      1.06            +3.2%       1.10        perf-stat.i.ipc
      0.28           -12.2%       0.24 ±  7%  perf-stat.i.major-faults
      1.14            -3.5%       1.10        perf-stat.i.metric.GHz
    257.79            +7.6%     277.26        perf-stat.i.metric.K/sec
      7866 ±  2%      -7.8%       7256        perf-stat.i.minor-faults
  16753987            +4.7%   17536138        perf-stat.i.node-load-misses
   6529414 ±  2%     +16.2%    7589233        perf-stat.i.node-store-misses
   4718305 ±  2%     +20.1%    5666449        perf-stat.i.node-stores
      7866 ±  2%      -7.8%       7256        perf-stat.i.page-faults
      0.34            +7.3%       0.37        perf-stat.overall.MPKI
      0.07            -0.0        0.07        perf-stat.overall.branch-miss-rate%
     28.91            +1.8       30.67        perf-stat.overall.cache-miss-rate%
      0.93            -3.1%       0.90        perf-stat.overall.cpi
      2722            -9.8%       2457        perf-stat.overall.cycles-between-cache-misses
      0.01            -0.0        0.01        perf-stat.overall.dTLB-load-miss-rate%
      0.00 ±  4%      -0.0        0.00 ±  2%  perf-stat.overall.dTLB-store-miss-rate%
      1.08            +3.3%       1.11        perf-stat.overall.ipc
  27129347            -2.5%   26448313        perf-stat.ps.branch-misses
  53525176            +7.0%   57254557        perf-stat.ps.cache-misses
   1260670            -5.3%    1193642        perf-stat.ps.context-switches
 1.457e+11            -3.5%  1.406e+11        perf-stat.ps.cpu-cycles
   4278010 ±  2%      -7.6%    3953474        perf-stat.ps.dTLB-load-misses
    635974 ±  4%     -24.1%     482580 ±  2%  perf-stat.ps.dTLB-store-misses
      0.28           -12.1%       0.25 ±  7%  perf-stat.ps.major-faults
      7861 ±  2%      -7.8%       7251        perf-stat.ps.minor-faults
  16727387            +4.7%   17510697        perf-stat.ps.node-load-misses
   6518975 ±  2%     +16.2%    7578033        perf-stat.ps.node-store-misses
   4711090 ±  2%     +20.1%    5658530        perf-stat.ps.node-stores
      7861 ±  2%      -7.8%       7251        perf-stat.ps.page-faults
 1.122e+14           +12.4%  1.261e+14        perf-stat.total.instructions
      2.18 ± 12%     -29.6%       1.54 ± 15%  sched_debug.cfs_rq:/.load_avg.min
     64.68 ± 20%     -41.6%      37.77 ± 16%  sched_debug.cfs_rq:/.runnable_avg.min
     64.69 ± 20%     -41.6%      37.76 ± 16%  sched_debug.cfs_rq:/.util_avg.min
   4792810            +9.9%    5265167        sched_debug.cfs_rq:/system.slice.avg_vruntime.min
      9.18 ±  9%     -11.1%       8.16 ±  3%  sched_debug.cfs_rq:/system.slice.load_avg.avg
      2.31 ± 16%     -25.1%       1.73 ± 19%  sched_debug.cfs_rq:/system.slice.load_avg.min
   4792810            +9.9%    5265167        sched_debug.cfs_rq:/system.slice.min_vruntime.min
     64.62 ± 20%     -41.6%      37.73 ± 15%  sched_debug.cfs_rq:/system.slice.runnable_avg.min
      1.43 ± 18%     -45.1%       0.79 ± 20%  sched_debug.cfs_rq:/system.slice.se->avg.load_avg.min
     64.58 ± 20%     -41.6%      37.70 ± 16%  sched_debug.cfs_rq:/system.slice.se->avg.runnable_avg.min
     64.61 ± 20%     -41.6%      37.70 ± 16%  sched_debug.cfs_rq:/system.slice.se->avg.util_avg.min
    445227           +13.5%     505275        sched_debug.cfs_rq:/system.slice.se->exec_start.avg
    445590           +13.5%     505640        sched_debug.cfs_rq:/system.slice.se->exec_start.max
    437889           +13.7%     497827        sched_debug.cfs_rq:/system.slice.se->exec_start.min
    103036           +14.2%     117717        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.avg
    113992 ±  3%     +11.4%     127019        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.max
    101120           +14.3%     115617        sched_debug.cfs_rq:/system.slice.se->sum_exec_runtime.min
      2.28 ± 12%     -23.2%       1.75 ± 16%  sched_debug.cfs_rq:/system.slice.tg_load_avg_contrib.min
     64.65 ± 20%     -41.6%      37.73 ± 16%  sched_debug.cfs_rq:/system.slice.util_avg.min
    445111           +13.5%     505165        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.avg
    445426           +13.5%     505520        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.max
    442897           +13.5%     502644        sched_debug.cfs_rq:/system.slice/containerd.service.se->exec_start.min
   4860094            +9.9%    5339463        sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.avg
   4805849           +10.0%    5287162        sched_debug.cfs_rq:/system.slice/containerd.service.se->vruntime.min
    102970           +14.2%     117638        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.avg
    113941 ±  3%     +11.3%     126851        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.max
    101055           +14.3%     115547        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.avg_vruntime.min
     69.43 ± 13%     -43.9%      38.94 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.load_avg.min
    102970           +14.2%     117638        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.avg
    113941 ±  3%     +11.3%     126851        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.max
    101055           +14.3%     115547        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.min_vruntime.min
     69.17 ± 14%     -44.2%      38.61 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.runnable_avg.min
      1.22 ± 19%     -49.4%       0.62 ± 17%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.load_avg.min
     67.61 ± 14%     -44.7%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.runnable_avg.min
     67.64 ± 14%     -44.7%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->avg.util_avg.min
    445226           +13.5%     505279        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.avg
    445589           +13.5%     505640        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.max
    437889           +13.7%     497980        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->exec_start.min
    102976           +14.2%     117644        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.avg
    113947 ±  3%     +11.3%     126858        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.max
    101061           +14.3%     115553        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->sum_exec_runtime.min
   4792828            +9.9%    5266259        sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.se->vruntime.min
     71.67 ± 20%     -47.8%      37.38 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.tg_load_avg_contrib.min
     69.17 ± 14%     -44.2%      38.60 ± 16%  sched_debug.cfs_rq:/system.slice/lkp-bootstrap.service.util_avg.min
      0.12 ± 33%     -42.9%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.load_avg.max
    445113           +13.5%     505199        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.avg
    445251           +13.5%     505317        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.max
    444977           +13.5%     505056        sched_debug.cfs_rq:/system.slice/redis-server.service.se->exec_start.min
   4855865            +9.8%    5333093        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.avg
   4871037            +9.8%    5349946        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.max
   4840982            +9.8%    5317191        sched_debug.cfs_rq:/system.slice/redis-server.service.se->vruntime.min
      0.14 ± 28%     -48.6%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.tg_load_avg.max
      0.12 ± 33%     -42.9%       0.07 ± 57%  sched_debug.cfs_rq:/system.slice/redis-server.service.tg_load_avg_contrib.max
    447837           +13.5%     508303        sched_debug.cpu.clock.avg
    447843           +13.5%     508310        sched_debug.cpu.clock.max
    447830           +13.5%     508297        sched_debug.cpu.clock.min
    445243           +13.5%     505290        sched_debug.cpu.clock_task.avg
    445599           +13.5%     505645        sched_debug.cpu.clock_task.max
    437708           +13.7%     497758        sched_debug.cpu.clock_task.min
      3266 ±  3%     +10.9%       3623 ±  5%  sched_debug.cpu.curr->pid.avg
     13788           +11.1%      15317        sched_debug.cpu.curr->pid.max
      4619           +14.6%       5292 ±  3%  sched_debug.cpu.curr->pid.stddev
   3215856           +12.5%    3616881        sched_debug.cpu.nr_switches.avg
   3332744           +11.7%    3724017        sched_debug.cpu.nr_switches.max
   3037135           +14.3%    3470789        sched_debug.cpu.nr_switches.min
      0.01 ± 10%     -18.9%       0.01 ± 19%  sched_debug.cpu.nr_uninterruptible.avg
    447830           +13.5%     508297        sched_debug.cpu_clk
    447123           +13.5%     507589        sched_debug.ktime
    448701           +13.5%     509200        sched_debug.sched_clk
     85.47            -4.0       81.46 ±  6%  perf-profile.calltrace.cycles-pp.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
     85.62            -4.0       81.62 ±  6%  perf-profile.calltrace.cycles-pp.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
     85.87            -4.0       81.88 ±  5%  perf-profile.calltrace.cycles-pp.rocksdb::Benchmark::ThreadBody
     85.85            -4.0       81.86 ±  5%  perf-profile.calltrace.cycles-pp.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
      2.27 ± 15%      -0.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.rocksdb::WriteThread::JoinBatchGroup.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite.rocksdb::Benchmark::ThreadBody
      2.27 ± 15%      -0.8        1.46 ±  8%  perf-profile.calltrace.cycles-pp.rocksdb::WriteThread::LinkOne.rocksdb::WriteThread::JoinBatchGroup.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite
      7.95            -0.7        7.23 ± 10%  perf-profile.calltrace.cycles-pp.clear_bhb_loop.__sched_yield.rocksdb::WriteThread::CompleteParallelMemTableWriter.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      3.48            -0.3        3.14 ± 10%  perf-profile.calltrace.cycles-pp.do_sched_yield.__x64_sys_sched_yield.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      0.63 ±  2%      -0.2        0.39 ± 70%  perf-profile.calltrace.cycles-pp.syscall_return_via_sysret.__sched_yield.rocksdb::WriteThread::CompleteParallelMemTableWriter.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      1.24            +0.7        1.98 ± 32%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      0.00            +0.7        0.74 ± 27%  perf-profile.calltrace.cycles-pp.futex_wait_setup.__futex_wait.futex_wait.do_futex.__x64_sys_futex
      1.25            +0.7        2.00 ± 31%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      1.29            +0.8        2.04 ± 31%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      1.30            +0.8        2.05 ± 31%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.pthread_cond_signal
      0.00            +0.8        0.76 ± 23%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl
      1.47            +0.8        2.26 ± 31%  perf-profile.calltrace.cycles-pp.pthread_cond_signal
      0.00            +0.8        0.80 ± 22%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write
      2.02            +0.8        2.83 ± 26%  perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      0.00            +0.8        0.80 ± 23%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState.rocksdb::DBImpl::WriteImpl.rocksdb::DBImpl::Write.rocksdb::Benchmark::DoWrite
      2.05            +0.8        2.87 ± 26%  perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.06            +0.8        2.88 ± 26%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      2.07            +0.8        2.92 ± 26%  perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.00            +1.0        0.95 ± 48%  perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.rocksdb::WriteThread::AwaitState
      2.33            +1.0        3.38 ± 26%  perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
      2.32            +1.0        3.37 ± 26%  perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.23            +1.7        2.92 ± 37%  perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     85.49            -4.0       81.48 ±  6%  perf-profile.children.cycles-pp.rocksdb::DBImpl::WriteImpl
     85.62            -4.0       81.63 ±  6%  perf-profile.children.cycles-pp.rocksdb::DBImpl::Write
     85.87            -4.0       81.88 ±  5%  perf-profile.children.cycles-pp.rocksdb::Benchmark::ThreadBody
     85.86            -4.0       81.87 ±  5%  perf-profile.children.cycles-pp.rocksdb::Benchmark::DoWrite
      2.34 ± 15%      -0.8        1.52 ±  8%  perf-profile.children.cycles-pp.rocksdb::WriteThread::LinkOne
      2.28 ± 15%      -0.8        1.46 ±  8%  perf-profile.children.cycles-pp.rocksdb::WriteThread::JoinBatchGroup
      8.24            -0.7        7.56 ±  9%  perf-profile.children.cycles-pp.clear_bhb_loop
      3.85            -0.4        3.47 ± 10%  perf-profile.children.cycles-pp.do_sched_yield
      0.80            -0.1        0.71 ±  9%  perf-profile.children.cycles-pp.raw_spin_rq_unlock
      0.26 ± 10%      -0.1        0.20 ± 15%  perf-profile.children.cycles-pp.sched_balance_newidle
      0.46 ±  2%      -0.1        0.40 ± 11%  perf-profile.children.cycles-pp.yield_task_fair
      0.31            -0.1        0.26 ±  3%  perf-profile.children.cycles-pp.pthread_cond_destroy
      0.16 ± 12%      -0.0        0.11 ± 20%  perf-profile.children.cycles-pp.pthread_rwlock_rdlock
      0.10 ±  6%      +0.0        0.14 ± 25%  perf-profile.children.cycles-pp.start_dl_timer
      0.06 ±  7%      +0.0        0.10 ± 25%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.10            +0.0        0.14 ± 27%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.03 ± 70%      +0.0        0.08 ± 28%  perf-profile.children.cycles-pp.switch_hrtimer_base
      0.20 ±  2%      +0.1        0.27 ± 28%  perf-profile.children.cycles-pp.enqueue_dl_entity
      0.00            +0.1        0.09 ± 29%  perf-profile.children.cycles-pp.switch_fpu_return
      0.00            +0.1        0.09 ± 34%  perf-profile.children.cycles-pp.wake_q_add_safe
      0.14 ±  7%      +0.1        0.24 ± 34%  perf-profile.children.cycles-pp.futex_q_lock
      0.00            +0.2        0.18 ± 28%  perf-profile.children.cycles-pp.plist_add
      0.00            +0.2        0.20 ± 28%  perf-profile.children.cycles-pp.__futex_queue
      0.00            +0.2        0.25 ± 31%  perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
      0.16 ±  2%      +0.3        0.51 ± 33%  perf-profile.children.cycles-pp.futex_wake_mark
      0.00            +0.4        0.40 ± 35%  perf-profile.children.cycles-pp.__futex_unqueue
      0.29            +0.5        0.75 ± 27%  perf-profile.children.cycles-pp.futex_wait_setup
      3.70            +0.5        4.22        perf-profile.children.cycles-pp._raw_spin_lock
      1.51            +0.8        2.31 ± 31%  perf-profile.children.cycles-pp.pthread_cond_signal
      2.04            +0.8        2.83 ± 26%  perf-profile.children.cycles-pp.__futex_wait
      2.05            +0.8        2.87 ± 26%  perf-profile.children.cycles-pp.futex_wait
      1.36            +1.7        3.06 ± 32%  perf-profile.children.cycles-pp.futex_wake
      3.44            +2.5        5.96 ± 29%  perf-profile.children.cycles-pp.do_futex
      3.47            +2.5        6.01 ± 29%  perf-profile.children.cycles-pp.__x64_sys_futex
      2.33 ± 15%      -0.8        1.51 ±  8%  perf-profile.self.cycles-pp.rocksdb::WriteThread::LinkOne
      8.14            -0.7        7.46 ±  9%  perf-profile.self.cycles-pp.clear_bhb_loop
      5.63            -0.3        5.31 ±  6%  perf-profile.self.cycles-pp.__schedule
      1.24            -0.2        1.08 ± 10%  perf-profile.self.cycles-pp.do_sched_yield
      0.54            -0.1        0.48 ± 10%  perf-profile.self.cycles-pp.raw_spin_rq_unlock
      0.30 ±  2%      -0.1        0.25 ±  5%  perf-profile.self.cycles-pp.pthread_cond_destroy
      0.16 ± 12%      -0.0        0.11 ± 20%  perf-profile.self.cycles-pp.pthread_rwlock_rdlock
      0.06            -0.0        0.03 ± 70%  perf-profile.self.cycles-pp.rocksdb::WriteThread::SetState
      0.08 ±  4%      +0.0        0.12 ± 35%  perf-profile.self.cycles-pp.set_next_entity
      0.00            +0.1        0.08 ± 29%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.1        0.09 ± 34%  perf-profile.self.cycles-pp.wake_q_add_safe
      0.14 ±  9%      +0.1        0.24 ± 34%  perf-profile.self.cycles-pp.futex_q_lock
      0.08 ±  8%      +0.1        0.20 ± 75%  perf-profile.self.cycles-pp.ktime_get
      0.00            +0.2        0.18 ± 29%  perf-profile.self.cycles-pp.plist_add
      0.00            +0.2        0.25 ± 31%  perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
      3.46            +0.3        3.78 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.00            +0.4        0.37 ± 36%  perf-profile.self.cycles-pp.__futex_unqueue
      0.32 ±  3%      +0.8        1.10 ± 34%  perf-profile.self.cycles-pp.futex_wake


***************************************************************************************************
lkp-srf-2sp2: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
=========================================================================================
compiler/cpufreq_governor/kconfig/nr_task/rootfs/runtime/tbox_group/test/testcase:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/300s/lkp-srf-2sp2/hash/perf-bench-futex

commit: 
  80367ad01d ("futex: Add basic infrastructure for local task local hash")
  7c4f75a21f ("futex: Allow automatic allocation of process wide futex hash")

80367ad01d93ac78 7c4f75a21f636486d2969d9b668 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
     79777 ±  9%     +29.6%     103404 ± 14%  sched_debug.cpu.avg_idle.stddev
     13.14           -92.4%       0.99        vmstat.cpu.us
     85.94           +12.6       98.54        mpstat.cpu.all.sys%
     13.40           -12.6        0.76        mpstat.cpu.all.usr%
    253330            +1.4%     256755        proc-vmstat.nr_active_anon
      2296            +2.2%       2346        proc-vmstat.nr_page_table_pages
     77274            +4.5%      80782        proc-vmstat.nr_shmem
    253330            +1.4%     256755        proc-vmstat.nr_zone_active_anon
   2667058           -94.6%     144593        perf-bench-futex.ops/s
      0.06 ± 13%      +0.2        0.21 ± 14%  perf-bench-futex.stddev%
    229015            -3.4%     221126        perf-bench-futex.time.involuntary_context_switches
     49696           +14.7%      57010        perf-bench-futex.time.system_time
      7728           -94.6%     416.35        perf-bench-futex.time.user_time
      0.74           +90.7%       1.40        perf-stat.i.MPKI
 5.333e+10           -82.2%   9.48e+09        perf-stat.i.branch-instructions
      0.02 ± 44%      +0.4        0.41        perf-stat.i.branch-miss-rate%
   9538223 ± 47%    +310.1%   39118125        perf-stat.i.branch-misses
     50.17           -14.2       35.98        perf-stat.i.cache-miss-rate%
 2.424e+08           -74.7%   61296533        perf-stat.i.cache-misses
 4.833e+08           -64.7%  1.706e+08        perf-stat.i.cache-references
      1.86          +653.3%      13.99        perf-stat.i.cpi
    249.82            -4.0%     239.71        perf-stat.i.cpu-migrations
      2522          +295.4%       9974        perf-stat.i.cycles-between-cache-misses
 3.295e+11           -86.7%  4.369e+10        perf-stat.i.instructions
      0.54           -86.7%       0.07        perf-stat.i.ipc
      0.74           +90.7%       1.40        perf-stat.overall.MPKI
      0.02 ± 47%      +0.4        0.41        perf-stat.overall.branch-miss-rate%
     50.15           -14.2       35.93        perf-stat.overall.cache-miss-rate%
      1.86          +654.2%      14.00        perf-stat.overall.cpi
      2522          +295.6%       9979        perf-stat.overall.cycles-between-cache-misses
      0.54           -86.7%       0.07        perf-stat.overall.ipc
 5.316e+10           -82.2%  9.448e+09        perf-stat.ps.branch-instructions
   9509524 ± 47%    +310.0%   38990460        perf-stat.ps.branch-misses
 2.416e+08           -74.7%   61091933        perf-stat.ps.cache-misses
 4.817e+08           -64.7%    1.7e+08        perf-stat.ps.cache-references
    249.00            -4.0%     238.92        perf-stat.ps.cpu-migrations
 3.284e+11           -86.7%  4.354e+10        perf-stat.ps.instructions
  9.88e+13           -86.7%   1.31e+13        perf-stat.total.instructions
      0.02           +52.8%       0.04 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      0.01           +80.0%       0.01 ±  9%  perf-sched.sch_delay.avg.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.02 ± 13%     +31.1%       0.03 ± 18%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 ±  7%    +122.5%       0.01 ± 47%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±142%    +566.7%       0.01 ± 39%  perf-sched.sch_delay.avg.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.00          +204.2%       0.01 ±  7%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      0.01 ± 22%    +147.9%       0.02 ± 25%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 ± 12%    +298.1%       0.04 ± 29%  perf-sched.sch_delay.max.ms.__cond_resched.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.36 ± 50%     -70.5%       0.11 ± 64%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      0.01 ±  5%    +145.6%       0.02 ± 64%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.00 ±142%    +566.7%       0.01 ± 39%  perf-sched.sch_delay.max.ms.schedule_timeout.__wait_for_common.__flush_work.__lru_add_drain_all
      0.02 ± 58%    +318.7%       0.07 ± 27%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    125.67 ±  2%     -11.1%     111.69 ±  2%  perf-sched.total_wait_and_delay.average.ms
    125.61 ±  2%     -11.1%     111.63 ±  2%  perf-sched.total_wait_time.average.ms
     37.18 ± 15%     +36.8%      50.87 ± 10%  perf-sched.wait_and_delay.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      0.24 ± 23%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.05 ± 26%    -100.0%       0.00        perf-sched.wait_and_delay.avg.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      7.31 ±  5%     -29.9%       5.12 ±  3%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    547.19           -12.1%     480.98        perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    771.00 ± 14%     -27.7%     557.50 ± 10%  perf-sched.wait_and_delay.count.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
    247.83 ±  4%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
    145.17 ± 31%    -100.0%       0.00        perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    632.33 ±  5%     +53.9%     973.00 ±  3%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3727           +11.5%       4155 ±  2%  perf-sched.wait_and_delay.count.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      8.43 ± 63%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown].[unknown]
      0.72 ± 50%    -100.0%       0.00        perf-sched.wait_and_delay.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
    530.84 ±  4%     -44.9%     292.50 ± 10%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     37.16 ± 14%     +36.8%      50.84 ± 10%  perf-sched.wait_time.avg.ms.anon_pipe_read.vfs_read.ksys_read.do_syscall_64
      3.12 ± 12%     -31.8%       2.13 ± 13%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      7.30 ±  5%     -30.0%       5.11 ±  3%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    547.19           -12.1%     480.97        perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      0.36 ± 50%     -70.5%       0.11 ± 64%  perf-sched.wait_time.max.ms.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      4.83 ±  7%     -37.9%       3.00 ± 37%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
    530.83 ±  4%     -44.9%     292.49 ± 10%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread





Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

