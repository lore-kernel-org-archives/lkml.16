Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEADC1D88D0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 07:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745999413; cv=fail; b=pD0tom5UqyypH1EVMXSpm1lb2ledIkjAICVzcqa5wCjMtMOMGo2O35h/uTzPybAJd/1T1YTK9blulItgHk8urJxFSLAdmEeOihhgGFHq+WY4rW1LLvdZirdd7R0uRJH92k4HVZKd7NI7x9ZHTTLMUFS48gLaT+tHeYAR75tcyn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745999413; c=relaxed/simple;
	bh=KtmGInRDGBTWKjszV5Rj2vM8FOjT5Il8yZFMrGLl1KE=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dAdbFBBLT93mtp7q1IjgTGUJGqfIKVJvFlLR5fR6vP66sAlHlrJC9Ikxu2Pn1mFbDNrLqAjc6kso0X/iZpaOOzTTdqu/zrC1y5Pej9Wyza3+eCTHX/YHF+BdKMguMu9v+kku6pN0vteSYstbjEWSAtUvbLNgjxFNBTFgxzmp3Lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+QM9kG/; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+QM9kG/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745999412; x=1777535412;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=KtmGInRDGBTWKjszV5Rj2vM8FOjT5Il8yZFMrGLl1KE=;
  b=G+QM9kG/IoqpQY7siUP69Y1HQ4DIg8CrRddXy1hSh68Oc2bChZWIoTMu
   rbHDrkCBUggEbzvDv4LGiexRl49Cx4vCdC2niTlF/PaUjiLYMYgWTD9wY
   yXbYwxwYOPU4foF3owYoh/MPF8Ld9aRWsPN5HuUH055YUx5tTcsbxn3hC
   m25DkR1jY1iVQlJBAAgIrFdMEQjJtEqfEJq7zPyczzimNhe+6DNM1jI6o
   M5YMvS3e9W4D0cw9UVJClYEK8/bdPsiA2BUiOLRPMJ1FMNlPHM5nNpKjv
   z8mwdUoxxrs1Yy1QOCuPj7MTewSGsn/P2YEhO+9gMuvl/7lMRZZtZH9Y9
   g==;
X-CSE-ConnectionGUID: uq4YmtgFQBiDeBVMccxfMQ==
X-CSE-MsgGUID: MouaR71dSzmBDsVgyHO0Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47785671"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47785671"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:50:11 -0700
X-CSE-ConnectionGUID: zaog7/l7RGOxKlZKMMZOyw==
X-CSE-MsgGUID: B9QNIuwlSwqT7LymmnPjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133974744"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 00:50:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 00:50:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 00:50:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 00:50:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ox5e81k+5pbV4XVYYTO0qZLf9BHvgwiCucjHWBlhWA/c0ZLT/zQz4nt04i3I70kCxcagP2qJltTyTf+8f3ph6RPfsxPqsNabrYrpRvn2ButI+d38NSx3Sb+xBnIF/M8YbxhRN7SyXyt2TtrhZmeJ9l0o4IuyV/ilBAqPmYC1MehGiewa36soBIfw7/bP8n7KCXIo+5KniUOya+M21OZfMUmxCL7MUuXVtH1Yk3eRR3KGJbwR8T1s5a5KiJQVDoy72UTn6YgHgH16LFaL7BsxPLBMw1Edk85IqVp05p3S6kBUOmqFRLwx9zj8pnXFQLCW3D5A+mgl8cTxAvJixmeX3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKuhdTH+9ZxYEz/pNfwq/yvf3fVUfi/b+6ZXLmlpHD8=;
 b=R/8XiwrNBSV/fYcWfHRJzJEHADpGY4JS6JIcWraKvtpp2dC/rSyU+L6Guphv/9m6+q/41+OZoQZOgliLnuCKPX3GL1aFTm6aDEha/HWBsIL99gUbL9oEq219/r9huhK58WmPsrZvWE2oXy5zDgSOZCyl4YgBhP3OqHDxotWL7O/STKxUOLLi+qEW8BRbdgWU70fo183+0Y+7k+x63cKEuvJvX5hBbVFhR7zsoWd5qm7ZijunjZR622jNC5+khmE6/rdAGc14fMnBP5OEm20/4M+3qZwaGcZwv7dz+mPPeIqbvN9SrJfO8rn4aw5ROtJIQcJTUkGqSdk7fLYI0rjYVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.29; Wed, 30 Apr 2025 07:50:03 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 07:50:02 +0000
Date: Wed, 30 Apr 2025 15:49:54 +0800
From: Philip Li <philip.li@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>, Mark Brown
	<broonie@kernel.org>
Subject: Re: sound/soc/qcom/sdw.c:93: warning: cannot understand function
 prototype: 'ret = sdw_enable_stream(sruntime); '
Message-ID: <aBHWImb+uElWcLk2@rli9-mobl>
References: <202504262154.sBmNTrcB-lkp@intel.com>
 <84fd01d9-d320-4296-9c42-0fb5238a8505@kernel.org>
 <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdWWM=ftk3AYTQJFVcSUnYmqsYRLvK9un5OvR9poevBTgA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|DS0PR11MB6399:EE_
X-MS-Office365-Filtering-Correlation-Id: 842ee7c7-43c1-4214-918c-08dd87bb9d6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?inrQKT2wwMjtxHk6HuwWUx1oQtNFJRFQIiRwa9gw8oaazgeJ7Oo9cP5yRLjs?=
 =?us-ascii?Q?8sci2e232Kg5e4tKocnC60OVB8zAx2Xk5W9SMVk9HwktLi2ouchW2L9uYsrW?=
 =?us-ascii?Q?ZdGTHToYTMNCFM/Zk+MsTj0Ksn711v8EtjlxRsb/FDgOt2nmjYNaXPC5w+CF?=
 =?us-ascii?Q?kdndTfSBE7YN/HPclQEjuH8Arix9n41SePnjaWcGyX0sc+uampN2w7q3alJN?=
 =?us-ascii?Q?bOaTP5jjC8hhP4QWld7jYTf/PKDZf5Zc8wbPPLr7xPef+kd4U6ecgc1cXOj3?=
 =?us-ascii?Q?IlTT5/udn3uIXZDS4dYGl2+xTGUzGO6QscCSbcvbuWhhP9vUUeal6CBySyBu?=
 =?us-ascii?Q?Ug9iyfwnh0ypncgOUCPXbG9A8lAHTzIhUWvUNaYVcGU7nennRaOJd1kO430i?=
 =?us-ascii?Q?lkNqxu4n4Gezb79S4stRBIDbxgrbZTt7wbU+Patm3d81sOAXLw37g3eiUz6E?=
 =?us-ascii?Q?KgBWxXtPqbMx5d32Wh4cNfi1t8vset8PBizN+0pb8sbXV46wJdJZkGEwwxBf?=
 =?us-ascii?Q?Xn0UPK/rD2uaV09/69jNR+Ugu3vXAF5+zTTOYkFvW/2XGo6orO5CIEwhj9Ww?=
 =?us-ascii?Q?ry2bU+5kRrSG51V+NlwPFUAiR9uLYkWdxFEBS5M0U3ihRlFZkJ1M/R3PelY2?=
 =?us-ascii?Q?rrwG4NflcNQEvvKPet8KBU1+8wfJgNx1z1F02Qb+UHGDptsDqVRH01t3PwfC?=
 =?us-ascii?Q?glMUkN+8cx0BPly1+/gG7xC9YoXgu5DchxHnHbeZeSYQr3TeexHJV0sItXvB?=
 =?us-ascii?Q?i9OBiGHaSQGUgK5TmyRpqDMpsTswyvrKq3vbOwwEaWWhMump4ng5BfkAovZa?=
 =?us-ascii?Q?CplAJPMHtSgwvGdXdv0S5uUWZvOKkZ+6Cxp+KyHTFTSjQA00y7dbIvJP+0+n?=
 =?us-ascii?Q?XVQcGgdLHO3fxOs/Q+Y1jqmHX+jNjTy4s5SqzMGn8B3PcenwoVBfFby3M0j9?=
 =?us-ascii?Q?Zm6DMny90JUSsFipoRxLnhVh3WIjPH5WQnT6YCkrTORnu7Genw+Fy0bw8lyO?=
 =?us-ascii?Q?t/C946WA9RTJPdCACfAEZIYJ6edwBckBGPpTjAKszhOU6TVwtp8oOp+bHbSC?=
 =?us-ascii?Q?ZEhtn+Tv3T5ov4nQ3AO45zp7ulw5dTsnrok+UYrwbGfCp3mAZlZaP4Rcy+58?=
 =?us-ascii?Q?NDEWO06jnFaPOrkyXJpDZdkGbrjHImdZHLPZ+/NyLj3D9RSDLlgZgTCUP63c?=
 =?us-ascii?Q?jr0RbAXYYDGi98SarHloOivNvDjiOmSll4lc2q3ccLy4oawarN6K6nLAKtSd?=
 =?us-ascii?Q?UEoQzy94FTGuaIO2kxJpmWcI2an72Y6h6jTBrFD6xZA4Of1pp+jfey8g9dWY?=
 =?us-ascii?Q?6R+/Sj1amMdCUL3R6tzZeWCMtulX9IGCqIODq86bXIqBdGLC0ihL8iH/FMSz?=
 =?us-ascii?Q?NdSjsdYx8+PQx9oyRB7YJ5dVhi4f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sJAb6E0XvM3X7CV2qDuERJNbp24R0SL86986e+zkMGI5mFkTYlUN4pqbQORf?=
 =?us-ascii?Q?4Ccm1VAuWkGPfs5Ir9BZzMaDLOvpMd1z68LxkSK6XO7iFiDvaNhAmj1foesp?=
 =?us-ascii?Q?uGHYAF3N00XXjqTTjoBLoCO1yuz0cdh8izYai1s/LGrdwv8wY/MByTUhwtft?=
 =?us-ascii?Q?PDLUTH60NXsAISjv8yVAsKF/TOH3pKKhdj3hsS3bKIKTghl0Q1MqTr1TO3sp?=
 =?us-ascii?Q?0ayTalYTySEJgUNJDL02jEbFqI3qjxr9EdtjZ57eitAJxw1WWG4JSIb4dzce?=
 =?us-ascii?Q?Et9VWrzdfvVVDyCBkUM7vBtzyPTsvVspJHf/ZERSge7DepglgJG7FZLOv+6d?=
 =?us-ascii?Q?T4ve+BVnrz+tWIOuVBIRWQSIgO7be1vfUoRWJ3cge/mvrCOy2sZEAyOL3MHu?=
 =?us-ascii?Q?F+/qBKC52cRP+pac9morX2ouW+jNGavbPHQlGvhj/++j1bawv84SQexx4isc?=
 =?us-ascii?Q?/HtAaY3Z8FOtDct+E5e/0pB/jpOspTVGD4nXCXmHcudL4SA69+RfjBM4qnvw?=
 =?us-ascii?Q?Xowjr5OQhCPkNpAGsbvlX1gcJmLcS8mAtWURiV3cjo28Wk/zhZgXe9SwPyQN?=
 =?us-ascii?Q?my0pp8iszmEnuJmeHDt9QVKOrky8FhlBcCdVLQTKg9mVzwBOG38HrVYhQmaE?=
 =?us-ascii?Q?cWMQv9emG2+e82THANMGd5CfKFwpIel4/FAIzA7VVl9Gm9zWW61aFERltHsz?=
 =?us-ascii?Q?/sYjWbJ3KPpQUj4RAMXMmqfQfiyc3AIssd6/uiAAgugs215hswKZJoRDsGR2?=
 =?us-ascii?Q?ScbT3/uBU45JBknWE5nBhkC4P/EBjNsL9ai7WrhUb0GZhbOxEwLsa4LBMU3B?=
 =?us-ascii?Q?L7KIMUE5fNFzfoY8hauQRC4/rK1PEtA8saMwSXB3NAtW1z4QB7ld6WsMuDua?=
 =?us-ascii?Q?xwreY+0HsjJzHdTCgLrJvNw3mrJ2AVoZvOfqNJBeLr0+eplmHzoZjIwmjXEZ?=
 =?us-ascii?Q?01Pf+bXGSGC8gbsga3pytMV8rletjqdEA9R0dZ5iL5aDgvvXZFmKruhVcdVn?=
 =?us-ascii?Q?dTL8BMcucjZVZpO0hTAcovw7ZWls35Rg7t+n0ml14L/itwbqlm2pwsEGLzkJ?=
 =?us-ascii?Q?6OfpFdgkDhUgG8nGH0jPPBnQpdwzBBgyIh4G1sZfTC+l9Ymt7ZXNSb+glg+g?=
 =?us-ascii?Q?e02ASrivSgS0w/hleeADzc7CyFVEG3yqucj94EkP9pI3IPNRlOzqVyLSFMxP?=
 =?us-ascii?Q?0iq664YiIikwc6UwnfoYbK3Dbs7SJqzeGfXxlW+DZoDTqkW4ezr1kEYfCwHP?=
 =?us-ascii?Q?HS/jkvH3XJYSxwWvasKDXEwb5VN9nTTnHHYxLf0q65Fhj76wEUDjqRZUnh8t?=
 =?us-ascii?Q?8Qg6dNqZgHyXbFOUumxrzZFGGIEMBe+kOSJvq8U9Tk2br+vw2JDyGoXn21MT?=
 =?us-ascii?Q?5iEnhe4bvHTXlEhZjlpDrsmapgA1IdZi7wHuxn0oEV43RNQ+Seku5ux2ww2V?=
 =?us-ascii?Q?ekDWXieIfG0ji+4K6G7dzjeWT8/itvHPahhj2ZGqHl7V/B/OvE82uf0+N0+x?=
 =?us-ascii?Q?lc64Ru6zxAWAzIFo6JnoCkSv0PLmOo7rEILaZXC8cTZLCgCwFQRYsRZalbOO?=
 =?us-ascii?Q?k2IsRBxPCflAKU6fCbbtcyGytNtvguO4oH/ZwA+y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 842ee7c7-43c1-4214-918c-08dd87bb9d6f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 07:50:02.9316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HEbAuEivhI/IaSuon5zKYdErMZl/VM01GIWkqAHhfT6GhdAJDHYF29Fr1aBrayKDWuQLwa4Z9iVIs2hlKL+cYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6399
X-OriginatorOrg: intel.com

On Wed, Apr 30, 2025 at 08:43:55AM +0200, Geert Uytterhoeven wrote:
> On Tue, 29 Apr 2025 at 10:18, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On 26/04/2025 15:32, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   02ddfb981de88a2c15621115dd7be2431252c568
> > > commit: db7e59e6a39a4d3d54ca8197c796557e6d480b0d ASoC: qcom: sc7280: Fix missing Soundwire runtime stream alloc
> > > date:   6 months ago
> > > config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/config)
> > > compiler: sh4-linux-gcc (GCC) 12.4.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262154.sBmNTrcB-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202504262154.sBmNTrcB-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >>> sound/soc/qcom/sdw.c:93: warning: cannot understand function prototype: 'ret = sdw_enable_stream(sruntime); '
> >
> > This looks like compiler issue. I check the config and SOUNDWIRE is
> > selected thus sdw_enable_stream() is reachable. I also cannot reproduce
> > it sh4-linux-gnu-gcc v14.2.
> 
> I also couldn't reproduce it, using the specified commit ID and
> the reproducer instructions, with gcc versions 12.3.0 (Ubuntu
> 12.3.0-17ubuntu1) and 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04).

Sorry for the false positive, it does appear during the bisection process and
results in this first bad commit, which could be related to kernel-doc. 

But fail to reproduce it now as well on gcc-12.4. We will follow up to further
check the bisection process and reproduce steps.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
