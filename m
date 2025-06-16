Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4479B26D4CA
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750062525; cv=fail; b=IKGT76//vtNKpkxPUqt2HbQ7M9KI0VPEmNlU2ugXg9XcTyf0v+uO/NrTTWqm1MjcDKmnmiHYC6WvlHDj9mUGz0qfqKB/LhzI5JiHDIKgc7qtMQWzfrQoDX6P5ycIO6q/Qgu8TY56OUgpWz+6iudtizHKv5PGE/kdrgJI4HN3OQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750062525; c=relaxed/simple;
	bh=XzDK4mcTp1ZwFhQzWoehcY6xY3NP5FjnY9Idd77nM3A=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bLhNNGPVYbmszb78k21Fbs5E9xVe7aOwKU7+3LEKNpgmsHF9DlLsX4NZUIYidt+f2m5XJjFtcyxrAFtheRlmaANHHcR8Vdu6XZIo/D90oHtYwDuHBPpLwLqiRnu6syQA8jFTfjKGe1iRENuKGJkPeXqpjZ1jRXEWkeRa+VsCizo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZRsySWoK; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZRsySWoK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750062522; x=1781598522;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=XzDK4mcTp1ZwFhQzWoehcY6xY3NP5FjnY9Idd77nM3A=;
  b=ZRsySWoKjWbMamKInuzivp2bQxLT9I3ikrSXOzdLgQJ8TBV+absFKqqQ
   fYtM984iKBCFp4kdcz4yaeJBpZzE8Tj3NWLh5mLATRuo20O0/0nFBKTGm
   RDTpoh0k9GTrMupp0NQ2dNnkmnFFTm7SBEheVd4oN8n1CpwJEy7pZ7e3F
   pUUQF9gb6783z3XZxBDJYUYuyJ6KgHiB559unpLVEgx4iD8bK8488eKyv
   vGKRRglWQ87ad77figPSnmpLQxAutsX3RP99IyyN5fM8alcAWSB4eglL0
   c49RAgq5JXdEcVGK/oKFhIKXq5AsqsL3UfgNLSsWxKOVpDQopHiXMwZ+H
   Q==;
X-CSE-ConnectionGUID: YJ8QbR+ITzewBXst9xetYA==
X-CSE-MsgGUID: 08+RQiQ+TU+pBZvgTNGTNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51424191"
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="51424191"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 01:28:42 -0700
X-CSE-ConnectionGUID: fiw4A3+kStql4HzNi9GrFA==
X-CSE-MsgGUID: GoEdv6IrTmSm0dEHb+DTmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,240,1744095600"; 
   d="scan'208";a="148242575"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 01:28:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:28:40 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 01:28:40 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.83)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 01:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jZoeFyb8OOBrVJ6dzaQOHWhuafPJr/w7XfR+pDkQYLb7WKh2Wi1V3ODkuhrzNFbRAuZXrz6FTbBoiJdJCPQjsxj3DVRJ6AA2Z0ljCBq61BqwYxMS2kvNkWG/4cG7zCK0O618QteaF458qt54jYByselVEQIQpLJcE+jwZpY8LNwVXe4FRfFgsLcBKt/ytJ31Fw/yblci6q5s7ZwnyQaVKNO2ijMcT3a8rbvZ3fRj3mQ4yUYLvBGafqvF0l6FQgXPwvBNSWpa8IazGbDQIpQ2ROQs7N0CVIlFwprlhZM01H85yEUOfLeL+VBo2Mlm4gUWbIoqXk/xIBO0Jjn95gpPxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvHtB/mXDfWIXVmXM0W/wI6ODPWgf8/j3U/zYmBrHNE=;
 b=H6oZIxsQvPZsX60ePnYKYzAaejiISPK2HltdZyMbNiAqEbIFDHp4qVBIEy7MF3pqAMVz5Ks32078vjagUSDwzUQPdo+PqDcymBTxIafcVT0L37q0IGw/PYKYOoGr1tCO86D00LvPtiOdePXxcvEWoxcz4BahD1+xf7vJZckIcgDPEdR4EmQyXE3x3YZfNSMo8RRw4RLfFEMkhH3Z6BnDm3QoJTLnuRwBePdJTQPh6jcQaAQ45xTa1maMS3oH82ALN+GQa0+TpecgyYyiAi9fp8op+NRR6UKTghbNauqVNAaDxhqH5rwrUGE5VHu52OThAdypJigW9/lo/sqdSCoBbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8747.namprd11.prod.outlook.com (2603:10b6:408:206::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 16 Jun
 2025 08:28:23 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Mon, 16 Jun 2025
 08:28:23 +0000
Date: Mon, 16 Jun 2025 16:28:12 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Pan Deng <pan.deng@intel.com>
CC: <oe-lkp@lists.linux.dev>, <lkp@intel.com>, Tianyou Li
	<tianyou.li@intel.com>, Tim Chen <tim.c.chen@linux.intel.com>,
	<linux-kernel@vger.kernel.org>, <aubrey.li@linux.intel.com>,
	<yu.c.chen@intel.com>, <peterz@infradead.org>, <mingo@kernel.org>,
	<pan.deng@intel.com>, <oliver.sang@intel.com>
Subject: Re: [PATCH] sched/rt: optimize cpupri_vec layout
Message-ID: <202506161643.ab40fa8e-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250612031148.455046-1-pan.deng@intel.com>
X-ClientProxiedBy: SI2P153CA0026.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8747:EE_
X-MS-Office365-Filtering-Correlation-Id: 1439c1b5-04f7-422a-7483-08ddacafc1d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?sRrdvawVVtgdNq/DmOKPVKMaC8PsOhsyjA/fnG0ywWQV0LGmQk0P1JRHNr?=
 =?iso-8859-1?Q?uwaZmgvjpfimLF4Te+XlV0uOK30jFgtLp17z0vz+yXKxBl7RAMINNWD8XN?=
 =?iso-8859-1?Q?Gm/e4lP3dbVt9biifj001/M1arOk+BDEs6TMm0DkXuMzJK5rZgfiM62pjF?=
 =?iso-8859-1?Q?1FH7tjiNqAOc70nbh4ExrDQuWOPD1Jkzwv+gLrF+7sDrWIeXzhKLrJFXu7?=
 =?iso-8859-1?Q?2yAeJ/FmKWheXZfnklKSRUfay4g0gzJ4PAYPWqshXyVzDqeQQtLcVnGl20?=
 =?iso-8859-1?Q?sC3NcdA6dLzsRT+z20mkswe+GLkt3zWlJCIOhhUPhClD5szKX5doDJxqTD?=
 =?iso-8859-1?Q?tND6FFhxH5rBP4dR6y9S+IbJq0wcezcfkPMM63/rgBNJxPl+G0dmrWJM/2?=
 =?iso-8859-1?Q?2VuwwOnWfCzJMwbhb0QA+497zmLTh2dHHTBCpC2AWjtz9FYiWgnQ7UmsPD?=
 =?iso-8859-1?Q?drTLALIosmsc5Q7EyNymPs2OAQLX63H0wTxFuwvb+CRW6XgFamzpiOX9Jk?=
 =?iso-8859-1?Q?/awbInRRED+v0RWkIFhifEEGpAvI4y7eZklSxSAACKJuGvLH2qcRXwjnxp?=
 =?iso-8859-1?Q?y+crQCYVKgVDMTI6CSk3pwNmBtlPe4lWfbezEnELT3V3E4b1OaKkpyPt0h?=
 =?iso-8859-1?Q?0IMpaL5Fmh7b4zzCCQuMCC3d7T7wFYiELM85PCfKmZTJPhs2RkA7JTWDD9?=
 =?iso-8859-1?Q?K8Ab8OBaQOwhGIFeNgSRQChomqRvxiny5rLGUtUuVRdBVyi6OY8FpdsjV/?=
 =?iso-8859-1?Q?6/JqePC90q7WpLI4iEEwIekLUcwvnpMCLxyKoU6Y4KkVEP342cNkiVUIPq?=
 =?iso-8859-1?Q?wFcBvkeZLhrBYh6N4+CYiCJyFEa9FBdWJLwWUiHN5y7k8uJYT3DXiS8OE+?=
 =?iso-8859-1?Q?5Orh2gKazFltlhZCxtTtWrMSgLkOkWsc6Uft20SSNZgyf/DtRKyGEs9hM0?=
 =?iso-8859-1?Q?Jtv/L7SSaHrpRKFRGo2T2r/TS1HLSXKtVi0kPI97ZZ2g7CibrRG5sY1Wyv?=
 =?iso-8859-1?Q?5PfXXZ4HLDdVfDossTIqbVA5YSW+TV+dKjJYu11twCtEQXY81zARS7MLMo?=
 =?iso-8859-1?Q?BJ5L/B2MSWqODlaXirRTcJktaK9EN0TDvt2bd15u5CBXTKnedT73mp/iVe?=
 =?iso-8859-1?Q?vEwptwSsFKqW6v2W4fbrPELesiYqB7mgMcpMOvPaY43BhrWdznCXi58KN4?=
 =?iso-8859-1?Q?0Dm9nKV2fOez9/pYdbGrY1KeGpsfXriXMdTnqy+YhMDJRvoiTPJ0FrmAuY?=
 =?iso-8859-1?Q?Am70K/DSG5FUgXeG76ZxEwi/dpvNWnOgVmC+OE/s49tSIc9ZsCJW2ukvnq?=
 =?iso-8859-1?Q?oVkpdwDgOzcwkGOT3dyd+fpkOIhuWAZCn+nW4lQShbab7uCUDprgi1PLJ9?=
 =?iso-8859-1?Q?sS6ZOY1d8dUPtGlX0BSa2zBV+ph8xSVN5BHCCXQIJgNF4FEWJeVApjoaS4?=
 =?iso-8859-1?Q?L16vDIrrpEFPDyu3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VTF9pA5eI1rpvCfIWDbTXkxJDq+WxxnWI/sz2hYRu111eDSyrXZRcX6T6K?=
 =?iso-8859-1?Q?fxiGJxdlsrcVg7+1ARitCbcglSmvZ7zVOeDDg5iDKac/Ii/J8GEmgdD5+u?=
 =?iso-8859-1?Q?352clVtK0qKr61+iznpxnKQqhfc7KtZ0CycOhlTN4usUBNFPvfXhqAL/xs?=
 =?iso-8859-1?Q?Ead7vVPgHCqoht3ZPhlfgK4Sqmgbktn/ARkTItZytSAVOd2GdcLzoaFN+0?=
 =?iso-8859-1?Q?5kOqpZHwFMknANOVGW9u3guFZRxI4g6EpS//sV1EMKOvTtLOhc+JIY5zBr?=
 =?iso-8859-1?Q?m/3EQuUORJNXrW25PuxqoFrxs8ttje9m6SIr8iJ+Bbkj6toxvLtAv9sB5a?=
 =?iso-8859-1?Q?kfpE8c/lIhwH4TC7D5O9l7QRZiXqB4u+xubf0Vb7hvIxUc1W7iV8HkBfUc?=
 =?iso-8859-1?Q?+tpo4891wfpnTpOUo7H1+bPsagsWPBeRc4vqJ7St3SA/La75RKMxqsjeLQ?=
 =?iso-8859-1?Q?MlgI7lK9OM0gSR+lSm+qP3GmjUgwR9iyKnIwN4wH/03EP7rbHvqVBSkIfV?=
 =?iso-8859-1?Q?izXvzcC+9O3Q0DzRTwqCLooWRx4l4Y7WE5eUVZOUUVe9jEoLyY9LqsIVRK?=
 =?iso-8859-1?Q?pKi0WKB+un/6rUwev6EwgqSOXoRk+wlCu8MTAs0+0OevgPlJetNOS8iyru?=
 =?iso-8859-1?Q?P27cfNCkkEi6e6rnNn7TTx+t4dVpxhwyL7aRYdTWuEhuayc90WiOMYXXic?=
 =?iso-8859-1?Q?O9H13meiD5LZl98k4U9vRzwZRjZdVXTRf5jPpKqFWV4fvJxUdPkcpezHfE?=
 =?iso-8859-1?Q?eNe0X3bCZbinLTreo6MyYiBze6mwtv4APathbQ2kqsOMAPeXvItbeeo5SD?=
 =?iso-8859-1?Q?CA1ModLMYVIw/WYVmZVWBudnmZqkr3KRxTvpQzCTmnEiw5yqmF79I3q0C7?=
 =?iso-8859-1?Q?lGGV/AohBVzehChryM7GTG0NWSGrbqsYFZxF+blnnLeXlcIQSq0fF/x2p+?=
 =?iso-8859-1?Q?q4jThLvJl5vzQWKEgJIElSS1nR3RsGfsl93kETlC1tLaP0AzLuu3V4rRAB?=
 =?iso-8859-1?Q?AcQ5J7n/FHlEedeJz1f+yJl2zqkfntaOYRyHCWu1dxf4sWNzRxYBnw/cmH?=
 =?iso-8859-1?Q?aa7zpg51LvFkDGOdeWQt39ssN+dZpa6WrtXg/2st3WP0aN+VAweRyJfi3t?=
 =?iso-8859-1?Q?hNfl1/+oHsUq1E9FSuQALS3sKw33j/KzofBaBcRi2WjWLaWH3P19lBqHxv?=
 =?iso-8859-1?Q?lsUzfDZQD83RvT/V12vyLsFpud5zcV9G7l4ueWNgx182D0+6G5XUY9bhXv?=
 =?iso-8859-1?Q?Hix7zy+drMdma0DZNhvOCtESY2pf5fWz7M7mjq/bJ5pchC4axR2UUvcRw6?=
 =?iso-8859-1?Q?ey0kUhqc8AJS4UtRVBcf8ILmWZoCjrZuhqZe+6Q2H8YFw7dQ68xxxC7Jp3?=
 =?iso-8859-1?Q?QIZUqLZKrRU4YzxJlmR914yttId0aRABhFn5+f2XuLG+EZqVEU3L73P47/?=
 =?iso-8859-1?Q?Fnzdy9Bab6lCuAmJjJqWOyKUHj9xzmN/alt/AxdSl7fHK0YMu7RleVqCkc?=
 =?iso-8859-1?Q?FpzppygFw0SW2sdkp/SaLdtv7ZlrykoybXS6OBvlre1P4qqdODaYPjBSfE?=
 =?iso-8859-1?Q?ceyjOriIlkNcvTo0fS4TGmNoQ+68VG4eAoE/H8ubINfEQFdqJgx8IJj1r+?=
 =?iso-8859-1?Q?Q8CYInB7gURH3OguaDluEcb4YwaFgh/k8fj09fgoqlO3f3Mvn+APmUZQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1439c1b5-04f7-422a-7483-08ddacafc1d5
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 08:28:23.0978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OqixKX5hcKSCePopXLCeRA5bLvRT7dUGOY916KuAXmgL4m5gI9aGe1HIGun1lCX5iGR7At/HbsueKUTBJvpl7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8747
X-OriginatorOrg: intel.com


Hello,

kernel test robot noticed a 67.7% improvement of stress-ng.mutex.ops_per_sec on:


commit: cd316a87572309a79102940e1856ee877740156e ("[PATCH] sched/rt: optimize cpupri_vec layout")
url: https://github.com/intel-lab-lkp/linux/commits/Pan-Deng/sched-rt-optimize-cpupri_vec-layout/20250612-110857
base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git b01f2d9597250e9c4011cb78d8d46287deaa6a69
patch link: https://lore.kernel.org/all/20250612031148.455046-1-pan.deng@intel.com/
patch subject: [PATCH] sched/rt: optimize cpupri_vec layout

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 2 sockets Intel(R) Xeon(R) 6740E  CPU @ 2.4GHz (Sierra Forest) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: mutex
	cpufreq_governor: performance



Details are as below:
-------------------------------------------------------------------------------------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250616/202506161643.ab40fa8e-lkp@intel.com

=========================================================================================
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcase/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp-srf-2sp2/mutex/stress-ng/60s

commit: 
  b01f2d9597 ("sched/eevdf: Correct the comment in place_entity")
  cd316a8757 ("sched/rt: optimize cpupri_vec layout")

b01f2d9597250e9c cd316a87572309a79102940e185 
---------------- --------------------------- 
         %stddev     %change         %stddev
             \          |                \  
  22409567           +52.5%   34179472 ±  3%  cpuidle..usage
     21410 ± 30%     +26.2%      27010 ± 16%  numa-vmstat.node0.nr_slab_reclaimable
      0.07 ±  2%      +0.0        0.09 ±  2%  mpstat.cpu.all.soft%
      1.06            +0.6        1.63 ±  3%  mpstat.cpu.all.usr%
     85656 ± 30%     +26.1%     108025 ± 16%  numa-meminfo.node0.KReclaimable
     85656 ± 30%     +26.1%     108025 ± 16%  numa-meminfo.node0.SReclaimable
   2398650           +60.1%    3839452 ±  2%  vmstat.system.cs
   1650319           +44.1%    2378651        vmstat.system.in
      1821 ±  7%     +28.5%       2340 ± 14%  perf-c2c.DRAM.local
     17138 ± 14%     +86.2%      31915 ± 17%  perf-c2c.DRAM.remote
     91166 ± 16%    +134.9%     214147 ± 19%  perf-c2c.HITM.local
     13399 ± 13%    +104.1%      27347 ± 16%  perf-c2c.HITM.remote
    104565 ± 15%    +131.0%     241494 ± 19%  perf-c2c.HITM.total
    125201 ±  2%     -39.4%      75820 ±  2%  stress-ng.mutex.nanosecs_per_mutex
  85791341           +67.7%  1.438e+08        stress-ng.mutex.ops
   1429837           +67.7%    2397156        stress-ng.mutex.ops_per_sec
  68606706           +63.5%  1.122e+08 ±  2%  stress-ng.time.involuntary_context_switches
      9345            -1.3%       9226        stress-ng.time.system_time
     99.39           +61.2%     160.24        stress-ng.time.user_time
  56563097           +57.6%   89151856 ±  2%  stress-ng.time.voluntary_context_switches
 7.208e+09 ±  2%     +42.9%   1.03e+10        perf-stat.i.branch-instructions
  52257508           +47.5%   77078460 ±  2%  perf-stat.i.branch-misses
  37265287 ±  2%     +34.4%   50098262 ±  3%  perf-stat.i.cache-misses
 2.416e+08           +42.7%  3.449e+08 ±  2%  perf-stat.i.cache-references
   2500366           +60.9%    4022250 ±  2%  perf-stat.i.context-switches
     20.66           -29.7%      14.53        perf-stat.i.cpi
    490637           +60.9%     789567 ±  2%  perf-stat.i.cpu-migrations
     15477 ±  4%     -25.1%      11585 ±  3%  perf-stat.i.cycles-between-cache-misses
 3.356e+10 ±  2%     +44.2%  4.838e+10        perf-stat.i.instructions
      0.06 ±  9%     +36.2%       0.08        perf-stat.i.ipc
     15.58           +60.8%      25.06 ±  2%  perf-stat.i.metric.K/sec
     17.01 ±  2%     -29.9%      11.93        perf-stat.overall.cpi
     15347 ±  3%     -24.8%      11539 ±  3%  perf-stat.overall.cycles-between-cache-misses
      0.06 ±  2%     +42.5%       0.08        perf-stat.overall.ipc
 7.096e+09 ±  2%     +42.6%  1.012e+10        perf-stat.ps.branch-instructions
  51310401           +47.6%   75731432 ±  2%  perf-stat.ps.branch-misses
  36634137 ±  2%     +34.4%   49233432 ±  3%  perf-stat.ps.cache-misses
 2.378e+08           +42.6%  3.392e+08 ±  2%  perf-stat.ps.cache-references
   2462472           +60.7%    3956471 ±  2%  perf-stat.ps.context-switches
    483238           +60.7%     776702 ±  2%  perf-stat.ps.cpu-migrations
 3.304e+10 ±  2%     +43.9%  4.756e+10        perf-stat.ps.instructions
 2.059e+12 ±  2%     +43.2%  2.949e+12        perf-stat.total.instructions
      0.61 ± 54%     -66.1%       0.21 ± 34%  perf-sched.sch_delay.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      0.57 ± 63%     -79.0%       0.12 ±137%  perf-sched.sch_delay.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
     20.28 ±215%     -98.8%       0.25 ± 40%  perf-sched.sch_delay.avg.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      5.85 ±133%     -96.7%       0.19 ± 48%  perf-sched.sch_delay.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      0.62 ± 41%     -65.0%       0.22 ± 31%  perf-sched.sch_delay.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.42 ± 34%     -52.4%       0.20 ± 30%  perf-sched.sch_delay.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.46 ± 42%     -54.1%       0.21 ± 45%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      0.50 ± 72%     -49.6%       0.25 ± 20%  perf-sched.sch_delay.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.47 ± 34%     -62.9%       0.18 ± 29%  perf-sched.sch_delay.avg.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.23 ± 56%     -85.7%       0.03 ±154%  perf-sched.sch_delay.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
    248.83 ± 26%     -60.2%      99.05 ± 73%  perf-sched.sch_delay.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      9.67 ±167%     -97.1%       0.28 ± 21%  perf-sched.sch_delay.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
     83.18 ± 21%     -68.9%      25.88 ± 26%  perf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      4.32 ± 91%     -84.6%       0.67 ± 24%  perf-sched.sch_delay.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      0.90 ± 74%     -75.6%       0.22 ±139%  perf-sched.sch_delay.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      1.40 ± 48%     -74.1%       0.36 ± 85%  perf-sched.sch_delay.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
    358.00 ±219%     -99.8%       0.86 ± 51%  perf-sched.sch_delay.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      1.18 ± 47%     -65.3%       0.41 ± 52%  perf-sched.sch_delay.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      1.20 ± 53%     -70.4%       0.35 ± 58%  perf-sched.sch_delay.max.ms.__cond_resched.down_read.walk_component.link_path_walk.path_openat
      1.30 ± 34%     -68.0%       0.42 ± 73%  perf-sched.sch_delay.max.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      1.03 ± 40%     -55.5%       0.46 ± 21%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
      0.30 ± 65%     -88.9%       0.03 ±154%  perf-sched.sch_delay.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
    281.41 ± 38%    +143.8%     686.20 ± 35%  perf-sched.sch_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.72 ± 81%     -70.7%       0.21 ± 83%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
    888.12 ±173%     -99.4%       5.74 ± 97%  perf-sched.sch_delay.max.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      2.66 ±  7%     -15.2%       2.25 ±  5%  perf-sched.total_wait_and_delay.average.ms
      1.68 ±  7%     -18.0%       1.38 ±  6%  perf-sched.total_wait_time.average.ms
      1092 ±  6%     -21.5%     857.36 ± 12%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1160 ± 11%     -37.2%     728.54 ± 28%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    342.17 ±  8%     -16.0%     287.50        perf-sched.wait_and_delay.count.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr.__sched_setaffinity
      7.50 ± 27%     -60.0%       3.00 ± 76%  perf-sched.wait_and_delay.count.__cond_resched.rcu_gp_cleanup.rcu_gp_kthread.kthread.ret_from_fork
      3012 ±  9%     +30.1%       3919 ±  9%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown].[unknown]
      2811 ±  5%     +32.8%       3732 ±  7%  perf-sched.wait_and_delay.count.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown].[unknown]
    116.17 ± 21%     -37.9%      72.17 ± 26%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
    699.17 ±  3%     -24.6%     527.50 ±  5%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
    249.00 ±  2%     -38.5%     153.17 ±  8%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
    562.82 ± 38%    +174.7%       1546 ± 51%  perf-sched.wait_and_delay.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
      0.95 ± 97%     -78.2%       0.21 ± 34%  perf-sched.wait_time.avg.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      0.57 ± 63%     -79.0%       0.12 ±137%  perf-sched.wait_time.avg.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      5.85 ±133%     -96.7%       0.19 ± 48%  perf-sched.wait_time.avg.ms.__cond_resched.change_pud_range.isra.0.change_protection_range
      0.62 ± 41%     -65.0%       0.22 ± 31%  perf-sched.wait_time.avg.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      0.42 ± 34%     -52.4%       0.20 ± 30%  perf-sched.wait_time.avg.ms.__cond_resched.down_write.unlink_anon_vmas.free_pgtables.exit_mmap
      0.35 ± 20%     -45.7%       0.19 ± 49%  perf-sched.wait_time.avg.ms.__cond_resched.dput.step_into.link_path_walk.path_openat
      0.46 ± 42%     -54.1%       0.21 ± 45%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.mas_alloc_nodes.mas_preallocate.__mmap_new_vma
      0.50 ± 72%     -49.6%       0.25 ± 20%  perf-sched.wait_time.avg.ms.__cond_resched.kmem_cache_alloc_noprof.vm_area_alloc.__mmap_new_vma.__mmap_region
      0.47 ± 34%     -62.9%       0.18 ± 29%  perf-sched.wait_time.avg.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      0.23 ± 56%     -85.7%       0.03 ±154%  perf-sched.wait_time.avg.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
      9.74 ±165%     -96.2%       0.37 ± 48%  perf-sched.wait_time.avg.ms.irqentry_exit_to_user_mode.asm_exc_page_fault.[unknown].[unknown]
      1411 ± 33%     -65.5%     487.33 ±141%  perf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      1009 ±  7%     -17.6%     831.48 ± 12%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      1150 ± 12%     -37.7%     717.38 ± 28%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     10.09 ±138%     -93.4%       0.67 ± 24%  perf-sched.wait_time.max.ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.vma_alloc_folio_noprof.alloc_anon_folio
      0.90 ± 74%     -75.6%       0.22 ±139%  perf-sched.wait_time.max.ms.__cond_resched.__do_fault.do_read_fault.do_pte_missing.__handle_mm_fault
      1.40 ± 48%     -74.1%       0.36 ± 85%  perf-sched.wait_time.max.ms.__cond_resched.__kmalloc_cache_noprof.vmstat_start.seq_read_iter.proc_reg_read_iter
    715.15 ±160%     -99.7%       2.21 ±133%  perf-sched.wait_time.max.ms.__cond_resched.__wait_for_common.wait_for_completion_state.kernel_clone.__x64_sys_vfork
      1.18 ± 47%     -65.3%       0.41 ± 52%  perf-sched.wait_time.max.ms.__cond_resched.copy_pte_range.copy_p4d_range.copy_page_range.dup_mmap
      1.20 ± 53%     -70.4%       0.35 ± 58%  perf-sched.wait_time.max.ms.__cond_resched.down_read.walk_component.link_path_walk.path_openat
      1.30 ± 34%     -68.0%       0.42 ± 73%  perf-sched.wait_time.max.ms.__cond_resched.mmput.m_stop.seq_read_iter.seq_read
      1.03 ± 40%     -55.5%       0.46 ± 21%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.__percpu_counter_init_many.mm_init
      0.30 ± 65%     -88.9%       0.03 ±154%  perf-sched.wait_time.max.ms.__cond_resched.mutex_lock_killable.pcpu_alloc_noprof.mm_init.dup_mm
    281.41 ± 38%    +205.6%     859.89 ± 67%  perf-sched.wait_time.max.ms.__cond_resched.shmem_inode_acct_blocks.shmem_alloc_and_add_folio.shmem_get_folio_gfp.shmem_write_begin
    167.37 ±222%     -99.9%       0.21 ± 83%  perf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.common_nsleep.__x64_sys_clock_nanosleep
     31.88            -1.9       30.02        perf-profile.calltrace.cycles-pp.__schedule.schedule.futex_do_wait.__futex_wait.futex_wait
     31.90            -1.9       30.05        perf-profile.calltrace.cycles-pp.schedule.futex_do_wait.__futex_wait.futex_wait.do_futex
     31.96            -1.8       30.14        perf-profile.calltrace.cycles-pp.futex_do_wait.__futex_wait.futex_wait.do_futex.__x64_sys_futex
     32.28            -1.7       30.62        perf-profile.calltrace.cycles-pp.__futex_wait.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
      9.30 ±  3%      -1.6        7.66 ±  5%  perf-profile.calltrace.cycles-pp.pull_rt_task.balance_callbacks.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
     32.29            -1.6       30.65        perf-profile.calltrace.cycles-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     26.81            -1.6       25.25        perf-profile.calltrace.cycles-pp.find_lock_lowest_rq.push_rt_task.push_rt_tasks.finish_task_switch.__schedule
     10.51 ±  3%      -1.5        9.00 ±  5%  perf-profile.calltrace.cycles-pp.balance_callbacks.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
     13.57            -1.5       12.11 ±  4%  perf-profile.calltrace.cycles-pp.cpupri_find_fitness.find_lowest_rq.find_lock_lowest_rq.push_rt_task.push_rt_tasks
     13.55            -1.5       12.09 ±  4%  perf-profile.calltrace.cycles-pp.__cpupri_find.cpupri_find_fitness.find_lowest_rq.find_lock_lowest_rq.push_rt_task
     13.61            -1.4       12.17 ±  4%  perf-profile.calltrace.cycles-pp.find_lowest_rq.find_lock_lowest_rq.push_rt_task.push_rt_tasks.finish_task_switch
      5.90 ±  3%      -1.2        4.68 ±  4%  perf-profile.calltrace.cycles-pp.pull_rt_task.balance_rt.__pick_next_task.__schedule.schedule
      5.92 ±  3%      -1.2        4.70 ±  4%  perf-profile.calltrace.cycles-pp.balance_rt.__pick_next_task.__schedule.schedule.futex_do_wait
     32.27            -1.2       31.09        perf-profile.calltrace.cycles-pp.push_rt_task.push_rt_tasks.finish_task_switch.__schedule.schedule
     38.40            -0.9       37.47        perf-profile.calltrace.cycles-pp.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64
     38.47            -0.9       37.57        perf-profile.calltrace.cycles-pp._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.36            -0.9       18.47        perf-profile.calltrace.cycles-pp.push_rt_tasks.finish_task_switch.__schedule.schedule.futex_do_wait
     40.08            -0.9       39.21        perf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     40.10            -0.9       39.23        perf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
     19.82            -0.8       18.98        perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.futex_do_wait.__futex_wait
      7.86 ±  2%      -0.8        7.05 ±  4%  perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule.futex_do_wait.__futex_wait
     38.68            -0.8       37.89        perf-profile.calltrace.cycles-pp.do_sched_setscheduler.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     38.68            -0.8       37.89        perf-profile.calltrace.cycles-pp.__x64_sys_sched_setscheduler.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     42.56            -0.8       41.79        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     42.57            -0.8       41.81        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_setscheduler
     11.76            -0.8       11.01 ±  2%  perf-profile.calltrace.cycles-pp.cpupri_set.enqueue_task_rt.enqueue_task.__sched_setscheduler._sched_setscheduler
     41.14            -0.7       40.41        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
     41.14            -0.7       40.42        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
     42.78            -0.6       42.15        perf-profile.calltrace.cycles-pp.__sched_setscheduler
     12.24            -0.5       11.75 ±  2%  perf-profile.calltrace.cycles-pp.cpupri_set.dequeue_rt_stack.dequeue_task_rt.__sched_setscheduler._sched_setscheduler
      3.53 ±  2%      -0.5        3.04 ±  3%  perf-profile.calltrace.cycles-pp.cpupri_set.dequeue_rt_stack.dequeue_task_rt.try_to_block_task.__schedule
      3.56 ±  2%      -0.5        3.08 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_rt_stack.dequeue_task_rt.try_to_block_task.__schedule.schedule
     12.30            -0.5       11.83 ±  2%  perf-profile.calltrace.cycles-pp.dequeue_rt_stack.dequeue_task_rt.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      3.62 ±  2%      -0.4        3.23 ±  3%  perf-profile.calltrace.cycles-pp.try_to_block_task.__schedule.schedule.futex_do_wait.__futex_wait
      2.19 ±  3%      -0.4        1.80 ±  3%  perf-profile.calltrace.cycles-pp.cpupri_set.enqueue_task_rt.enqueue_task.activate_task.push_rt_task
      3.62 ±  2%      -0.4        3.23 ±  3%  perf-profile.calltrace.cycles-pp.dequeue_task_rt.try_to_block_task.__schedule.schedule.futex_do_wait
      2.27 ±  3%      -0.2        2.04 ±  2%  perf-profile.calltrace.cycles-pp.enqueue_task_rt.enqueue_task.activate_task.push_rt_task.push_rt_tasks
      4.20            -0.2        4.01        perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.exit_to_user_mode_loop.do_syscall_64
      3.90            -0.2        3.72        perf-profile.calltrace.cycles-pp.push_rt_tasks.finish_task_switch.__schedule.schedule.exit_to_user_mode_loop
      0.96            +0.0        1.00        perf-profile.calltrace.cycles-pp.__pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      0.96 ±  2%      +0.1        1.05 ±  4%  perf-profile.calltrace.cycles-pp.enqueue_pushable_task.enqueue_task.activate_task.push_rt_task.push_rt_tasks
      1.32            +0.1        1.43 ±  3%  perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
      1.56 ±  3%      +0.1        1.67 ±  3%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.__sched_setscheduler
      1.19 ±  2%      +0.1        1.31 ±  3%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.finish_task_switch
      1.56 ±  3%      +0.1        1.68 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.__sched_setscheduler._sched_setscheduler
      1.57 ±  3%      +0.1        1.69 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.20 ±  2%      +0.1        1.32 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.finish_task_switch.__schedule
      1.00            +0.1        1.13 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.balance_callbacks.__sched_setscheduler
      1.20 ±  2%      +0.1        1.33 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.finish_task_switch.__schedule.schedule_idle
      1.59 ±  3%      +0.1        1.72 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      0.93 ±  4%      +0.1        1.06 ±  4%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler
      1.03            +0.1        1.16 ±  3%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.balance_callbacks.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.02            +0.1        1.15 ±  2%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.balance_callbacks.__sched_setscheduler._sched_setscheduler
      1.22 ±  2%      +0.1        1.34 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.finish_task_switch.__schedule.schedule_idle.do_idle
      0.96 ±  4%      +0.1        1.10 ±  4%  perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler._sched_setscheduler
      0.96 ±  4%      +0.1        1.10 ±  4%  perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.task_rq_lock.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler
      1.65 ±  2%      +0.1        1.80 ±  3%  perf-profile.calltrace.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt
      1.66 ±  2%      +0.1        1.80 ±  3%  perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt
      1.68 ±  2%      +0.2        1.84 ±  3%  perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry
      1.81 ±  2%      +0.2        1.98 ±  3%  perf-profile.calltrace.cycles-pp.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
      1.11 ±  4%      +0.2        1.28 ±  4%  perf-profile.calltrace.cycles-pp.task_rq_lock.__sched_setscheduler._sched_setscheduler.do_sched_setscheduler.__x64_sys_sched_setscheduler
      1.75 ±  2%      +0.2        1.92 ±  3%  perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.pv_native_safe_halt.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter
      1.92 ±  2%      +0.2        2.12 ±  3%  perf-profile.calltrace.cycles-pp.acpi_safe_halt.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter
      1.92 ±  2%      +0.2        2.13 ±  3%  perf-profile.calltrace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
      1.92 ±  2%      +0.2        2.13 ±  3%  perf-profile.calltrace.cycles-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
      1.96 ±  2%      +0.2        2.17 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary
     10.09            +0.2       10.31        perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__sched_yield
      1.95 ±  2%      +0.2        2.17 ±  3%  perf-profile.calltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry
     10.10            +0.2       10.32        perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__sched_yield
      2.02 ±  2%      +0.2        2.26 ±  2%  perf-profile.calltrace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      1.44            +0.3        1.69        perf-profile.calltrace.cycles-pp._raw_spin_lock.raw_spin_rq_lock_nested.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single
      1.44            +0.3        1.69        perf-profile.calltrace.cycles-pp.raw_spin_rq_lock_nested.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single
      1.43            +0.3        1.68 ±  2%  perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.raw_spin_rq_lock_nested.sched_ttwu_pending.__flush_smp_call_function_queue
      0.86            +0.3        1.12 ±  4%  perf-profile.calltrace.cycles-pp.dequeue_task_rt.push_rt_task.push_rt_tasks.finish_task_switch.__schedule
      4.26            +0.3        4.58 ±  2%  perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_call_function_single
      2.68            +0.3        3.01 ±  2%  perf-profile.calltrace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
      2.69            +0.3        3.02 ±  2%  perf-profile.calltrace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.common_startup_64
     10.28            +0.4       10.63        perf-profile.calltrace.cycles-pp.__sched_yield
      4.90            +0.6        5.53        perf-profile.calltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.common_startup_64
      4.90            +0.6        5.53        perf-profile.calltrace.cycles-pp.start_secondary.common_startup_64
      4.90            +0.6        5.53        perf-profile.calltrace.cycles-pp.cpu_startup_entry.start_secondary.common_startup_64
      4.94            +0.6        5.57        perf-profile.calltrace.cycles-pp.common_startup_64
      0.00            +0.7        0.72 ±  8%  perf-profile.calltrace.cycles-pp.balance_fair.__pick_next_task.__schedule.schedule.futex_do_wait
      0.00            +0.7        0.72 ±  8%  perf-profile.calltrace.cycles-pp.sched_balance_newidle.balance_fair.__pick_next_task.__schedule.schedule
      7.78 ±  3%      +0.8        8.55 ±  3%  perf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
      0.75 ±  8%      +5.8        6.56 ±  6%  perf-profile.calltrace.cycles-pp._find_first_and_bit.__cpupri_find.cpupri_find_fitness.find_lowest_rq.find_lock_lowest_rq
     15.21 ±  3%      -2.9       12.34 ±  5%  perf-profile.children.cycles-pp.pull_rt_task
     32.03            -2.8       29.24 ±  2%  perf-profile.children.cycles-pp.cpupri_set
     46.02            -1.9       44.16        perf-profile.children.cycles-pp.schedule
     31.96            -1.8       30.14        perf-profile.children.cycles-pp.futex_do_wait
     32.28            -1.7       30.63        perf-profile.children.cycles-pp.__futex_wait
     32.29            -1.6       30.65        perf-profile.children.cycles-pp.futex_wait
     28.29            -1.6       26.73        perf-profile.children.cycles-pp.find_lock_lowest_rq
     48.72            -1.5       47.18        perf-profile.children.cycles-pp.__schedule
     81.25            -1.5       79.73        perf-profile.children.cycles-pp.__sched_setscheduler
     15.35            -1.5       13.84 ±  4%  perf-profile.children.cycles-pp.cpupri_find_fitness
     15.33            -1.5       13.82 ±  5%  perf-profile.children.cycles-pp.__cpupri_find
     10.53 ±  3%      -1.5        9.02 ±  5%  perf-profile.children.cycles-pp.balance_callbacks
     15.39            -1.5       13.90 ±  4%  perf-profile.children.cycles-pp.find_lowest_rq
     93.88            -1.3       92.61        perf-profile.children.cycles-pp.do_syscall_64
     93.90            -1.2       92.65        perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
      5.94 ±  3%      -1.2        4.72 ±  4%  perf-profile.children.cycles-pp.balance_rt
     32.36            -1.2       31.21        perf-profile.children.cycles-pp.push_rt_tasks
     34.19            -1.1       33.09        perf-profile.children.cycles-pp.push_rt_task
     34.74            -1.0       33.76        perf-profile.children.cycles-pp.finish_task_switch
     15.91            -0.9       14.98 ±  2%  perf-profile.children.cycles-pp.dequeue_rt_stack
     38.47            -0.9       37.57        perf-profile.children.cycles-pp._sched_setscheduler
     40.08            -0.9       39.21        perf-profile.children.cycles-pp.do_futex
     40.10            -0.9       39.23        perf-profile.children.cycles-pp.__x64_sys_futex
     38.68            -0.8       37.89        perf-profile.children.cycles-pp.__x64_sys_sched_setscheduler
     38.68            -0.8       37.89        perf-profile.children.cycles-pp.do_sched_setscheduler
      9.06 ±  2%      -0.7        8.40 ±  3%  perf-profile.children.cycles-pp.__pick_next_task
      3.62 ±  2%      -0.4        3.23 ±  3%  perf-profile.children.cycles-pp.try_to_block_task
      0.22 ±  2%      -0.1        0.16 ±  5%  perf-profile.children.cycles-pp.sched_tick
      0.26 ±  2%      -0.1        0.20 ±  3%  perf-profile.children.cycles-pp.tick_nohz_handler
      0.26            -0.1        0.20 ±  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.44 ±  2%      -0.1        0.38 ±  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.25 ±  2%      -0.1        0.19 ±  2%  perf-profile.children.cycles-pp.update_process_times
      0.30 ±  2%      -0.1        0.24 ±  3%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.42 ±  2%      -0.1        0.36 ±  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.29            -0.1        0.23 ±  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.20 ±  4%      -0.0        0.16 ± 12%  perf-profile.children.cycles-pp.sched_balance_update_blocked_averages
      0.36            -0.0        0.32        perf-profile.children.cycles-pp.irq_work_single
      0.09 ±  6%      -0.0        0.06 ± 13%  perf-profile.children.cycles-pp.sched_balance_rq
      0.04 ± 45%      +0.0        0.06 ±  7%  perf-profile.children.cycles-pp.menu_select
      0.06 ±  6%      +0.0        0.08 ± 10%  perf-profile.children.cycles-pp.plist_add
      0.06 ±  8%      +0.0        0.08 ±  5%  perf-profile.children.cycles-pp.native_irq_return_iret
      0.13 ±  3%      +0.0        0.16 ±  4%  perf-profile.children.cycles-pp.irqentry_exit_to_user_mode
      0.05            +0.0        0.08        perf-profile.children.cycles-pp.pick_task_rt
      0.04 ± 44%      +0.0        0.07 ±  9%  perf-profile.children.cycles-pp.do_perf_trace_sched_stat_runtime
      0.06 ±  8%      +0.0        0.09 ±  4%  perf-profile.children.cycles-pp._copy_from_user
      0.06 ±  7%      +0.0        0.10 ±  4%  perf-profile.children.cycles-pp.find_task_by_vpid
      0.04 ± 44%      +0.0        0.07 ±  6%  perf-profile.children.cycles-pp.sched_mm_cid_migrate_to
      0.10 ±  8%      +0.0        0.13 ±  6%  perf-profile.children.cycles-pp.prepare_task_switch
      0.07 ± 11%      +0.0        0.10 ±  8%  perf-profile.children.cycles-pp.llist_reverse_order
      0.06 ±  9%      +0.0        0.10 ± 10%  perf-profile.children.cycles-pp.pthread_mutex_lock
      0.08            +0.0        0.12 ±  5%  perf-profile.children.cycles-pp.sched_clock
      0.05 ±  7%      +0.0        0.09        perf-profile.children.cycles-pp.__get_user_8
      0.06 ±  6%      +0.0        0.10 ±  3%  perf-profile.children.cycles-pp.rseq_get_rseq_cs
      0.07            +0.0        0.11 ±  4%  perf-profile.children.cycles-pp.__resched_curr
      0.09 ±  4%      +0.0        0.13 ±  5%  perf-profile.children.cycles-pp.sched_clock_cpu
      0.08 ±  6%      +0.0        0.12 ±  4%  perf-profile.children.cycles-pp.futex_unqueue
      0.10 ±  9%      +0.0        0.14 ±  6%  perf-profile.children.cycles-pp.native_sched_clock
      0.08 ±  8%      +0.0        0.13        perf-profile.children.cycles-pp.find_get_task
      0.09 ±  4%      +0.0        0.14        perf-profile.children.cycles-pp.wakeup_preempt
      0.00            +0.1        0.05        perf-profile.children.cycles-pp.raw_spin_rq_trylock
      0.10 ±  6%      +0.1        0.15 ±  4%  perf-profile.children.cycles-pp.futex_wake_mark
      0.09 ±  5%      +0.1        0.14 ±  3%  perf-profile.children.cycles-pp.rseq_ip_fixup
      0.09 ±  4%      +0.1        0.14 ±  4%  perf-profile.children.cycles-pp.pthread_setschedparam
      0.10 ±  7%      +0.1        0.16 ±  6%  perf-profile.children.cycles-pp.do_perf_trace_sched_wakeup_template
      0.00            +0.1        0.06 ±  9%  perf-profile.children.cycles-pp.___perf_sw_event
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.__x2apic_send_IPI_dest
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.native_apic_msr_eoi
      0.11 ±  6%      +0.1        0.17 ±  6%  perf-profile.children.cycles-pp.ttwu_queue_wakelist
      0.09 ±  4%      +0.1        0.15 ±  2%  perf-profile.children.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.11 ±  4%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.stress_mutex_exercise
      0.00            +0.1        0.06        perf-profile.children.cycles-pp.sysvec_reschedule_ipi
      0.13 ±  5%      +0.1        0.19 ±  4%  perf-profile.children.cycles-pp.update_rq_clock
      0.00            +0.1        0.06 ±  6%  perf-profile.children.cycles-pp.rseq_update_cpu_node_id
      0.13 ±  5%      +0.1        0.20 ±  3%  perf-profile.children.cycles-pp.update_rq_clock_task
      0.00            +0.1        0.06 ±  7%  perf-profile.children.cycles-pp.__smp_call_single_queue
      0.10 ±  4%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.entry_SYSCALL_64
      0.00            +0.1        0.07 ±  7%  perf-profile.children.cycles-pp.__radix_tree_lookup
      0.16 ±  7%      +0.1        0.22 ±  7%  perf-profile.children.cycles-pp.update_curr_common
      0.00            +0.1        0.07 ±  5%  perf-profile.children.cycles-pp.__wrgsbase_inactive
      0.10 ±  5%      +0.1        0.17 ±  2%  perf-profile.children.cycles-pp.rt_mutex_adjust_pi
      0.13 ±  3%      +0.1        0.20        perf-profile.children.cycles-pp.switch_mm_irqs_off
      0.14 ±  4%      +0.1        0.22 ±  3%  perf-profile.children.cycles-pp.__rseq_handle_notify_resume
      0.17 ±  5%      +0.1        0.26 ±  5%  perf-profile.children.cycles-pp.__futex_hash
      0.24 ±  3%      +0.1        0.34 ±  2%  perf-profile.children.cycles-pp._raw_spin_lock_irqsave
      0.17 ±  3%      +0.1        0.27 ±  3%  perf-profile.children.cycles-pp.os_xsave
      0.15 ±  4%      +0.1        0.25 ±  3%  perf-profile.children.cycles-pp.__switch_to
      0.24 ±  2%      +0.1        0.34 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_reschedule_ipi
      0.18 ±  2%      +0.1        0.29        perf-profile.children.cycles-pp.set_load_weight
      0.22 ±  4%      +0.1        0.34 ±  5%  perf-profile.children.cycles-pp.futex_wait_setup
      0.23 ±  2%      +0.2        0.38 ±  2%  perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
      1.12 ±  4%      +0.2        1.29 ±  4%  perf-profile.children.cycles-pp.task_rq_lock
      0.28            +0.2        0.46 ±  2%  perf-profile.children.cycles-pp.switch_fpu_return
      0.36 ±  5%      +0.2        0.55 ±  4%  perf-profile.children.cycles-pp.futex_hash
      1.93 ±  2%      +0.2        2.14 ±  3%  perf-profile.children.cycles-pp.acpi_idle_do_entry
      1.93 ±  2%      +0.2        2.14 ±  3%  perf-profile.children.cycles-pp.acpi_safe_halt
      1.93 ±  2%      +0.2        2.14 ±  3%  perf-profile.children.cycles-pp.pv_native_safe_halt
      1.93 ±  2%      +0.2        2.14 ±  3%  perf-profile.children.cycles-pp.acpi_idle_enter
      1.97 ±  2%      +0.2        2.18 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter_state
      1.97 ±  2%      +0.2        2.19 ±  3%  perf-profile.children.cycles-pp.cpuidle_enter
      2.04 ±  2%      +0.2        2.28 ±  3%  perf-profile.children.cycles-pp.cpuidle_idle_call
      3.62            +0.3        3.88 ±  3%  perf-profile.children.cycles-pp.enqueue_pushable_task
      0.40 ±  4%      +0.3        0.72 ±  8%  perf-profile.children.cycles-pp.balance_fair
      0.40 ±  4%      +0.3        0.72 ±  8%  perf-profile.children.cycles-pp.sched_balance_newidle
      2.71            +0.3        3.05 ±  2%  perf-profile.children.cycles-pp.schedule_idle
      5.99            +0.3        6.33        perf-profile.children.cycles-pp.ttwu_do_activate
     10.30            +0.4       10.67        perf-profile.children.cycles-pp.__sched_yield
      5.26 ±  2%      +0.5        5.71 ±  3%  perf-profile.children.cycles-pp.sched_ttwu_pending
      5.71 ±  2%      +0.5        6.18 ±  3%  perf-profile.children.cycles-pp.__sysvec_call_function_single
      5.82 ±  2%      +0.5        6.30 ±  3%  perf-profile.children.cycles-pp.__flush_smp_call_function_queue
      5.76 ±  2%      +0.5        6.25 ±  3%  perf-profile.children.cycles-pp.sysvec_call_function_single
      5.91 ±  2%      +0.6        6.48 ±  3%  perf-profile.children.cycles-pp.asm_sysvec_call_function_single
      4.93            +0.6        5.56        perf-profile.children.cycles-pp.do_idle
      4.90            +0.6        5.53        perf-profile.children.cycles-pp.start_secondary
      4.94            +0.6        5.57        perf-profile.children.cycles-pp.common_startup_64
      4.94            +0.6        5.57        perf-profile.children.cycles-pp.cpu_startup_entry
      7.78 ±  3%      +0.8        8.55 ±  3%  perf-profile.children.cycles-pp.futex_wake
      1.45 ±  8%      +6.0        7.48 ±  6%  perf-profile.children.cycles-pp._find_first_and_bit
     12.44            -7.7        4.74 ±  7%  perf-profile.self.cycles-pp.__cpupri_find
     14.90 ±  3%      -2.9       12.04 ±  5%  perf-profile.self.cycles-pp.pull_rt_task
     32.02            -2.8       29.23 ±  2%  perf-profile.self.cycles-pp.cpupri_set
      0.08            -0.0        0.06 ±  7%  perf-profile.self.cycles-pp.irq_work_single
      0.06            +0.0        0.08        perf-profile.self.cycles-pp.prepare_task_switch
      0.06 ±  8%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.update_rq_clock
      0.06 ±  9%      +0.0        0.08 ±  6%  perf-profile.self.cycles-pp.plist_add
      0.07 ±  5%      +0.0        0.09 ±  5%  perf-profile.self.cycles-pp.do_sched_setscheduler
      0.06 ±  6%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.futex_do_wait
      0.05            +0.0        0.08 ±  4%  perf-profile.self.cycles-pp.pick_task_rt
      0.06 ±  8%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.native_irq_return_iret
      0.05            +0.0        0.08        perf-profile.self.cycles-pp._copy_from_user
      0.06 ±  6%      +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.__pick_next_task
      0.06 ± 11%      +0.0        0.09 ±  6%  perf-profile.self.cycles-pp.sched_ttwu_pending
      0.05 ±  7%      +0.0        0.08 ±  5%  perf-profile.self.cycles-pp.push_rt_task
      0.06 ±  7%      +0.0        0.10 ±  6%  perf-profile.self.cycles-pp.do_perf_trace_sched_wakeup_template
      0.13 ±  6%      +0.0        0.16 ±  5%  perf-profile.self.cycles-pp.__flush_smp_call_function_queue
      0.07 ± 11%      +0.0        0.10 ±  8%  perf-profile.self.cycles-pp.llist_reverse_order
      0.05 ±  7%      +0.0        0.09 ±  4%  perf-profile.self.cycles-pp.__get_user_8
      0.08 ±  6%      +0.0        0.11 ±  3%  perf-profile.self.cycles-pp.finish_task_switch
      0.03 ± 70%      +0.0        0.07 ±  5%  perf-profile.self.cycles-pp.sched_mm_cid_migrate_to
      0.06 ±  6%      +0.0        0.10        perf-profile.self.cycles-pp.pthread_setschedparam
      0.07 ±  6%      +0.0        0.11 ±  4%  perf-profile.self.cycles-pp.futex_unqueue
      0.06 ±  7%      +0.0        0.10 ±  4%  perf-profile.self.cycles-pp.entry_SYSCALL_64
      0.11            +0.0        0.15 ±  3%  perf-profile.self.cycles-pp.pv_native_safe_halt
      0.03 ± 70%      +0.0        0.07 ±  6%  perf-profile.self.cycles-pp.ttwu_queue_wakelist
      0.07            +0.0        0.11 ±  6%  perf-profile.self.cycles-pp.__resched_curr
      0.09 ±  7%      +0.0        0.13 ±  2%  perf-profile.self.cycles-pp.futex_wake_mark
      0.10 ±  9%      +0.0        0.14 ±  7%  perf-profile.self.cycles-pp.native_sched_clock
      0.09 ±  5%      +0.0        0.13 ±  3%  perf-profile.self.cycles-pp.stress_mutex_exercise
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.__sched_yield
      0.00            +0.1        0.05        perf-profile.self.cycles-pp.update_curr_common
      0.00            +0.1        0.05 ±  7%  perf-profile.self.cycles-pp.exit_to_user_mode_loop
      0.10 ±  8%      +0.1        0.15 ±  5%  perf-profile.self.cycles-pp.futex_wake
      0.10 ±  4%      +0.1        0.16 ±  7%  perf-profile.self.cycles-pp.select_task_rq_rt
      0.10 ±  3%      +0.1        0.16 ±  3%  perf-profile.self.cycles-pp.update_rq_clock_task
      0.02 ±141%      +0.1        0.07 ±  9%  perf-profile.self.cycles-pp.pthread_mutex_lock
      0.02 ±141%      +0.1        0.07 ±  6%  perf-profile.self.cycles-pp.switch_fpu_return
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.__x2apic_send_IPI_dest
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.native_apic_msr_eoi
      0.09 ±  4%      +0.1        0.15 ±  2%  perf-profile.self.cycles-pp.entry_SYSRETQ_unsafe_stack
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__radix_tree_lookup
      0.00            +0.1        0.06        perf-profile.self.cycles-pp.__wrgsbase_inactive
      0.09 ±  4%      +0.1        0.15 ±  3%  perf-profile.self.cycles-pp.do_syscall_64
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.rseq_update_cpu_node_id
      0.00            +0.1        0.06 ±  6%  perf-profile.self.cycles-pp.select_task_rq
      0.19 ±  3%      +0.1        0.26        perf-profile.self.cycles-pp.find_lock_lowest_rq
      0.13 ±  5%      +0.1        0.20 ±  4%  perf-profile.self.cycles-pp.__sched_setscheduler
      0.11 ±  3%      +0.1        0.18 ±  4%  perf-profile.self.cycles-pp.switch_mm_irqs_off
      0.44            +0.1        0.51 ±  2%  perf-profile.self.cycles-pp._raw_spin_lock
      0.17 ±  6%      +0.1        0.26 ±  4%  perf-profile.self.cycles-pp.__futex_hash
      0.14 ±  3%      +0.1        0.24        perf-profile.self.cycles-pp._raw_spin_lock_irqsave
      0.14 ±  4%      +0.1        0.24 ±  4%  perf-profile.self.cycles-pp.__switch_to
      0.18 ±  3%      +0.1        0.28 ±  4%  perf-profile.self.cycles-pp.futex_hash
      0.16 ±  3%      +0.1        0.26 ±  2%  perf-profile.self.cycles-pp.os_xsave
      0.17 ±  2%      +0.1        0.28 ±  2%  perf-profile.self.cycles-pp.set_load_weight
      0.23 ±  3%      +0.1        0.36 ±  2%  perf-profile.self.cycles-pp.__schedule
      0.23            +0.2        0.38 ±  3%  perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
      3.54 ±  2%      +0.2        3.78 ±  3%  perf-profile.self.cycles-pp.enqueue_pushable_task
      0.14 ±  3%      +0.4        0.52 ±  9%  perf-profile.self.cycles-pp.sched_balance_newidle
      1.45 ±  2%      +0.6        2.03 ±  4%  perf-profile.self.cycles-pp.dequeue_task_rt
      0.72 ±  5%      +2.1        2.80 ± 11%  perf-profile.self.cycles-pp.enqueue_task_rt
      1.45 ±  8%      +6.0        7.47 ±  6%  perf-profile.self.cycles-pp._find_first_and_bit




Disclaimer:
Results have been estimated based on internal Intel analysis and are provided
for informational purposes only. Any difference in system hardware or software
design or configuration may affect actual performance.


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

