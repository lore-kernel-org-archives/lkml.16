Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DE624E4C1;
	Thu, 22 May 2025 20:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947422; cv=fail; b=YxyS+lgCIjwlPv5sxPGmmJaT1J5NeQrNPbw3d/kVV/j67/hX1OnR+dB2FEGIZiXeCIaZ5UT/6iDe0/kCa+bme/+Bu1QVYd53tiBcOSJ86F7AaHhKy/5bRsOamxlZAyg2NJewTSO8evtVYLicz8T87dR07ek2a0UjLCOZPIAFx84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947422; c=relaxed/simple;
	bh=rqoXWl8C8QR5LkK4+d82cTk1mqVk2SQq7f+A5/01mwY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HJdLYHJRynLFeY3/yhLZJtDvGnyl2WZWYo9kjVcYQVCmDmfDP74gdgV/nQdxq17jKx5JL317sSSVIbDcJpETQsSKN2cQbVAKxoX6gHbpsOH/KF+C672pScE2O6F0NkrBvzH0NgidzPulZjUKe2tXqi8k/6KBgFJSLhmxT4jYr5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CV3yWf9y; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CV3yWf9y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947421; x=1779483421;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rqoXWl8C8QR5LkK4+d82cTk1mqVk2SQq7f+A5/01mwY=;
  b=CV3yWf9yk5PrhNskPPZrZdAtUl6Z7XjZqsNi35OrAJANb3XAeqXysr8l
   iS2fmcoxnDQPuCCPBrTTKZnvsWb28FKzF0BmzfWg9LDhR5yFK7dKjdZD7
   4cQJsY5QaONo4jVeEEwoHMtxO13wqqLAL460rxgngWVGvty+tBSYPEE19
   ++EHzLSjv1YR/by+jT73IiOui2yZG3OeGiIWepR5Kc3QYdn0S7G2X1vdD
   nSdRywGTsW9OFL4LBZ32uOM3rd5G2vwThLt6cltnp1KRYIxPd3VYoBIKV
   NUU0ajfOnHjmupFr1Wu6LjAQE5Sz07byon6YFSmyXBgMtTM9aFIXcI0uU
   Q==;
X-CSE-ConnectionGUID: wb45Q0qkSTyU7wvg5YTHwQ==
X-CSE-MsgGUID: UJXX9/+OQ++l+apZ38Y/MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49247097"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49247097"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:56:59 -0700
X-CSE-ConnectionGUID: YA2Yc0okQE2tTFUHXb+nYg==
X-CSE-MsgGUID: UAmUSptsR+ujSjJU55RXgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="171753261"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:56:58 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:56:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:56:58 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.60)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:56:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdCLZHCvmCRQEp3HYnItx7sFcYJmJWvMX5FrNo/C5V2J1Azc66Od4UAdOchNTH/zrglVpOWB5mkGu7e3j4uJdP56YhIartqTcWU2nxBNjMFNVThdEVHNfI5HZCOFyUBwwFsmfQLMQWAfCs9wG6xieWifZYetiYGmnmUZRdL5af0S28+12LjewvBhkhg6TEkGn3b/jl8rbQmWqXqJvbpa6AjWm3rw7x2FUTiPLSi6RPMOdMz1OmWK5EEnHvQ3R7isVoHv3CV2oPSUQdOY0+HiJ5sTdUNOdg28hP7y/6Uhgkgdi6ZmJ4BNJdDQ+6ps0fDgDERuingdqmPfFzJqN1s4tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnfSSk6l2ep0BeD6VsN7o7cWEHBuRnrlAL5oren04WU=;
 b=jnmwBRuvR8ejJ8CNTHzpB3vgqcrxBVG/d5EhrJMXcOmtXtBHPK1nagkS0KgNUEuj5En7b6JVaNqwPRwHc9z8jMD7uRMPFGpMJdjGF18wfQXg7us+5Qrl0EtmEY/kAl0vwie+XS3iMaXgU1Aq3Zs+QQknUM9U1ErwcgEqUadj/ILLT+wi67oX3RxvaDVMbJguORdltEF9Lr2fjFA+L1aSWo9Mut73hdx/2YS72yxH12NHehjIWpFUZ+H/MrvDRV/KE/MFA9nS4G4Fjm7dYCi1IiZmKx79gpulJzvaiY4q9JLjlaBDNHuZzJqpUnDPRWP2EKPqO+j6aY5XHs9bPnVPLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5938.namprd11.prod.outlook.com (2603:10b6:a03:42d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 20:56:10 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:56:10 +0000
Message-ID: <eb4f459c-cdf6-4ca7-b6dc-7e2d0828505c@intel.com>
Date: Thu, 22 May 2025 13:56:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 05/27] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <e7d0c61696b8f1fcfe9e520b4b41fdd3a624878c.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e7d0c61696b8f1fcfe9e520b4b41fdd3a624878c.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR04CA0028.namprd04.prod.outlook.com
 (2603:10b6:610:52::38) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5938:EE_
X-MS-Office365-Filtering-Correlation-Id: 5af18cd4-687a-434d-ddb1-08dd9973147f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K05yblkvMFpZNHF2NHB5WG9kTXZGWElPeUorU1AxVEdOekZ2WXZzT0pjMlZL?=
 =?utf-8?B?T3FiSWhjY0V1MzlKbE5kS1dLQjg0WlVoNHQ0ZGhvRXJPOEZacmJjSDVSOSs5?=
 =?utf-8?B?MnIxYzhMVUlXdVRiQy9JcXBwUWVDZUxieUM0Rzg1M2RlT09IRXVFOFA4bUMy?=
 =?utf-8?B?ZWUvK2w1cG1Qd3NVK0IvQzRYdlpvY05tNXVKYktYSmF6ZGRWZmo3K0wrRkhJ?=
 =?utf-8?B?T2ppdTdUckNxbktvRUZRYTN1c2hQZ0dNNkhMT28yVlpXbGZYc1RkeW9icmFv?=
 =?utf-8?B?N1F0YlY5aXUzQmdvcWhRQXhSd1BsMnovNGhkY21Od1VoRDdHUVpub21jZGdt?=
 =?utf-8?B?M1Y1cDVwRHd6VkE1NHduZkNFdXV5YzI3dGhiU2o2c0dpSkF2ZFJXak1tbEJZ?=
 =?utf-8?B?bTZEVHNxYkx0ajRCSkszcTl3LzhBN2w5UUFhWVlzKzZxbVR4bjMrOFdyZnR6?=
 =?utf-8?B?dHVOSFVmQTJISXRkNlN6MTBOWVQwdTR1S25sR1c3N1VPY3YyUkNkMWRkdlJE?=
 =?utf-8?B?Q0pvNCtIWUxkRitFc1l5aVlhWHJ2VGd0d0ZJb05hTEExdlhqVDEwUWtNa3M4?=
 =?utf-8?B?MUdGWUhSc0xYWFNESW1RRFVYeExwdUd3OS9WbkNYUVp5UFRzYlFSSDQwOFYw?=
 =?utf-8?B?czc3d1NqaVpVVGZOTEhMdTB3Q1dtbW13TkpGMEg4SS9TYml1Z09qSnpsS2Fl?=
 =?utf-8?B?dm0vSy9MWENQbGU0S1JZVSt5WVIyQ2s2Z2hldUNZLzhnVWlZZVdYU3BoMTlM?=
 =?utf-8?B?UEM0NUhDdEFycGVYRUVvNmpsVzJzNHJSd3hhbGVuVmZDQ1RCSndKOXpuSEt6?=
 =?utf-8?B?ZFluSUNkY2tsZW9oeHh3VzVmVWtOVE13QVU5K09hVWIvdW9CdUhOVWw0WGk4?=
 =?utf-8?B?bkYvbTAwTUMzbnRSYXhPQnExeGdWNGFualF6QXU0UjdkQ2lpd3BxNVhzdDdI?=
 =?utf-8?B?eFEzalo0NjdyZmJIaENwNFhEd2NWSmVRRmw2YThETmJobERaUUZpeHYwOWNp?=
 =?utf-8?B?cHFQVEl5bGo4TVZHR3JUS1JQMnZXTzBhVE5jaVpsN0pTTmRuK0ROeHgvakk3?=
 =?utf-8?B?bHJINE8rT2o5bytUdkc0UEw4N3pKWEF4Qnh4QjFwNHRNa1RhdnZrZVBnY2Vv?=
 =?utf-8?B?U21zVUtGRUs2eGhRWWczOFUrTmM5MkZyWEFkUFpGYnQ2TU92MkgwMWlJdXNE?=
 =?utf-8?B?OFFzMmJCTEhFbVFmdUVBMkVVVVdoSjlLVFJ5RkZOcm11V3lVUlRSNmY3ZU5W?=
 =?utf-8?B?eDdDM1VGOFVaK1l3bW9wWVVtdFBPV0w3SThpQzFaL0ZIa2xMUjVNdzVXUGc2?=
 =?utf-8?B?VnJuaU5WUk5vYWFLWXhGZmVRZ1p5VXdBZXc0M0FEbWozekJscC9EOGUvTnZZ?=
 =?utf-8?B?K1NQcXdNdDB0V01wamlFSFhYOHhBTkpiaWwyZER6bFcxSlRiSSt4NFhWblcw?=
 =?utf-8?B?emNVRkVDWnVKNjBnLzhYK2RxS1hleEF3ZGNZNG9PZUZqazZWZjBSdXpHSDhs?=
 =?utf-8?B?dmVSZFl4WmdyYVRNenJPUGxvUnlvZnlVSUhuWGFrUnNRNWljUHFxL0ZaMEl0?=
 =?utf-8?B?L0VtcEcxWUFaanp5ak0vcnlDWXBCa0RZYXRFNzRBbE1QUDlhcW5uN0x5SVhB?=
 =?utf-8?B?cFJLYkpCOXlXT0FuVG1UVXZ4RWRsenlrR3VFM21kV3BxbU83UXdsQmZhcDlQ?=
 =?utf-8?B?TytCMU9ialg1ZlZycUhJUjdxSzVPV3liMlNPYytnSzBJUjFjZHJJRnk1dy9O?=
 =?utf-8?B?ZHhFVUdROGRMMGxYN1NaRXFyUmZjTjhXWUZCam5VVUpYdlZwMXVtdTFuQWpt?=
 =?utf-8?Q?+aVMjNgb2VXVEYJjFJuEanyGbeiLuyAjvED0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1M1QkpVNGd4N3JCazJSNnppYUZGaUVtb2UwUmc2NWtxcWNDYzliQlo0K21a?=
 =?utf-8?B?L0tzOEpnakg0ZU1raHZTU0d0VGRCTU44VkRVMTFqeEx0dGszWG1GNEtKT1R2?=
 =?utf-8?B?cXRwc05xZ0JYejd4NFF6NjJ3RC9BNDRldmY2OEJmMVBUc293SUpCc3ppVXNE?=
 =?utf-8?B?aDdDdTdLWXlZVi91S0tiWlBzQWJqdWdpS3d4UGwzOC9tem1lTXVEdjJHRFJW?=
 =?utf-8?B?Z1NCOVNKODV5QlhDbGdHSFAwVitRditqSTdxODNQRTl4UlFnOHZHeGE1dmo3?=
 =?utf-8?B?dVpMempPUDJRNDM2YW1ldG0xN1lvaUJFU3FqWkx1S0piL2RaVkorb0c5dWV2?=
 =?utf-8?B?YUNjSkovYkoyL2NJcjBaS29JT21rUTJkZFFuT2dEbkQ5Q2pkcm5TNnRjWTBk?=
 =?utf-8?B?REhlVkoyUEQ1MGZCOHgxZk5QWGhlMDhGdDBMT2NPQnAzeXc4R21wNEtFQnJG?=
 =?utf-8?B?N3BXRURzSXNqTFFEUzVCK3A0eXZray9QdjVRTElOdmRkVTZTOUFsVXBmTElQ?=
 =?utf-8?B?V0pQSTZaTnp1aVJrZURiYnpEVEZsNlZPMGhIWTltSCtxSTd0OG5lZ01ndzlu?=
 =?utf-8?B?SDlwYjdlOEwxUE5aZ2cyZlNuYUV3WHNTcHJEWlROWHc1Z0tYVmFndnBSR0tV?=
 =?utf-8?B?WDdRUkd4WmJYL0ZXMlFUMWxsaUt5YmlGdU9kN0tmbG1YdWlnNDAyMXFaNVZZ?=
 =?utf-8?B?U3dKNDV4RTVCVC84STBhbjBkWW1PREE0TU1Ua09qb09XTkxZQTZpWFpmalBK?=
 =?utf-8?B?TEk2UllteVorR2ZtenhZM09ScVZ4d3M0VUc1a3dzeFFCdXVaUGExRzZFWTJn?=
 =?utf-8?B?ZFpwdHY4M1R1SE5ad0sremxPcFk4L3dFSkw3SHU2MDNVN0VRK1Vrd0JUVzRm?=
 =?utf-8?B?M0JTejAxQTJyUEVFRHVmZ3RYQWFVdjRheEZpUGp3WGdkcTEyR1ZITnVLWXJi?=
 =?utf-8?B?Qkc5a2Q5SzRsYUNKK0hCNzlnbStFLzNLeEFHTzc3RlNST3Y0VjU1SXZyWEpE?=
 =?utf-8?B?bnVsSHVyeTZVQkZNQkIvWmY2WDNJazBJM0J6aUZOcXZXRnpDbnBzekNUcVBY?=
 =?utf-8?B?dFVYOWswbXI2SkhvL3V4OG4wYVFISldvaVNEV0hrS0lYRU1wVjVTckJKUzls?=
 =?utf-8?B?TjBhREJpUkRtUFJORUdiYjNvZ3dXMG1yT0I5MzV0cDhFRXd1SUZqa0hwRlZu?=
 =?utf-8?B?Z1haRHgwMVc0QmFITHFRUmNQaDV0b2F6Wkd3YS95L2UxVlhzTXlXZFNUMExF?=
 =?utf-8?B?UmFkdytZOUxISWJiTUg2c05kTUYxc0QzR05YM3MwaXdjL3czRkVhY09SamRU?=
 =?utf-8?B?QUdzclVLL0lHWldnaU1BMG9WbUVlR2VtNWpMTk8reGY5SXRIVjI5QXc1bzV5?=
 =?utf-8?B?a08xaUQ3Tm9lZTliZTMwbjZwVUxCaC9TeDg2S0x0M0srWCswY0FHNzNsS2xG?=
 =?utf-8?B?T0IydS9MWVJxMUFVc3U1NUVwZHQvRXBWRE5ha1NBamd1bW8vOEFuU2VZclNJ?=
 =?utf-8?B?STdkSzlJSWgvcUlweFU4KzZtK1JWelRoRndFaXdINWVSajdnOHFlMWU0NnE3?=
 =?utf-8?B?RllIK3c3TVRxRWc4MzZMblhIMnppRUY4akRwTFlTVVpDeU9LQU9CVW9nUnNz?=
 =?utf-8?B?SStkWDBXSkwrdDhkV0VoK3hLcFZHWDVqdW9Qd3hIWVEvV1M0SkJ2Yi9lazA2?=
 =?utf-8?B?SUJLaWlhN3RaeWlyTGVoV21IZWdzbUE5YzlrekxIQVM0ZW9Cd01RbzhoYkZu?=
 =?utf-8?B?cGVXbDU2YTlSMy9mUGZ0bHVQUFA4MkhjRzI4b3pDZ0NDR3M2eHlQY2pzT0t6?=
 =?utf-8?B?cmhGY3dkZlZIQUNGZytRN3FmZ0N6elI5eERGa2tiMGw1L05xRmo4UEdEU3dW?=
 =?utf-8?B?cGVOSUpwNnNhQXk5UFVENUxrVFQ0dmFXQ2FacGZ0N3U3djB6My90YVZPaUJX?=
 =?utf-8?B?WnV4TDNKZk8vbG42U0lOaEJEbmluR0QvU0ZrVFl5V1Z3bGhKbHVaV2daUldn?=
 =?utf-8?B?OEtQRE5qN2ltVCs3U1NrOTdXanhSYWFBTWpSTXpKTlk4WGdmZTJ6VmJZcEJJ?=
 =?utf-8?B?Z1R2eTVUVi9YZHNyRkVLT0FSaXc3YzlMNCtFQlBwWnk5Q0lXbms4ZzdwdGh2?=
 =?utf-8?B?bmVBdjBLOHM3LzZRUXQ3dEp0dE9NWUhFNVZETWNIa1VSN1VqVG5scWJ6T3NW?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af18cd4-687a-434d-ddb1-08dd9973147f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:56:10.2363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7sq7GhFrtRc0ZSB/q84MDo35hPOTWdpCbpPq9f3+RHco0I/yaz8TutO/vL6YDDRm/4bOFppFlksYVZJhl0zMh6SRS1pi+cGEovl0+QYF7M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5938
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> Add the functionality to enable/disable AMD ABMC feature.
> 
> AMD ABMC feature is enabled by setting enabled bit(0) in MSR
> L3_QOS_EXT_CFG. When the state of ABMC is changed, the MSR needs
> to be updated on all the logical processors in the QOS Domain.
> 
> Hardware counters will reset when ABMC state is changed.
> 
> The ABMC feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/include/asm/msr-index.h       |  1 +
>  arch/x86/kernel/cpu/resctrl/internal.h |  5 +++
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 43 ++++++++++++++++++++++++++
>  include/linux/resctrl.h                |  3 ++
>  4 files changed, 52 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index e6134ef2263d..3970e0b16e47 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1203,6 +1203,7 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
>  
>  /* AMD-V MSRs */
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 5e3c41b36437..fcc9d23686a1 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -37,6 +37,9 @@ struct arch_mbm_state {
>  	u64	prev_msr;
>  };
>  
> +/* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
> +#define ABMC_ENABLE_BIT			0
> +
>  /**
>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>   *			       a resource for a control function
> @@ -102,6 +105,7 @@ struct msr_param {
>   * @mon_scale:		cqm counter * mon_scale = occupancy in bytes
>   * @mbm_width:		Monitor width, to detect and correct for overflow.
>   * @cdp_enabled:	CDP state of this resource
> + * @mbm_cntr_assign_enabled:	ABMC feature is enabled
>   *
>   * Members of this structure are either private to the architecture
>   * e.g. mbm_width, or accessed via helpers that provide abstraction. e.g.
> @@ -115,6 +119,7 @@ struct rdt_hw_resource {
>  	unsigned int		mon_scale;
>  	unsigned int		mbm_width;
>  	bool			cdp_enabled;
> +	bool			mbm_cntr_assign_enabled;
>  };
>  
>  static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index fd2761d9f3f7..ff4b2abfa044 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -405,3 +405,46 @@ void __init intel_rdt_mbm_apply_quirk(void)
>  	mbm_cf_rmidthreshold = mbm_cf_table[cf_index].rmidthreshold;
>  	mbm_cf = mbm_cf_table[cf_index].cf;
>  }
> +
> +static void resctrl_abmc_set_one_amd(void *arg)
> +{
> +	bool *enable = arg;
> +
> +	if (*enable)
> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +	else
> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
> +}
> +
> +/*
> + * ABMC enable/disable requires update of L3_QOS_EXT_CFG MSR on all the CPUs
> + * associated with all monitor domains.
> + */
> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_mon_domain *d;
> +

It remains a challenge to consider these building blocks without insight into
how/when they will be used. To help out, please add guardrails to help with review.
For example, this could benefit from a:

	lockdep_assert_cpus_held();

> +	list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +		on_each_cpu_mask(&d->hdr.cpu_mask,
> +				 resctrl_abmc_set_one_amd, &enable, 1);
> +		resctrl_arch_reset_rmid_all(r, d);
> +	}
> +}
> +
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
> +{
> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> +
> +	if (r->mon.mbm_cntr_assignable &&
> +	    hw_res->mbm_cntr_assign_enabled != enable) {
> +		_resctrl_abmc_enable(r, enable);
> +		hw_res->mbm_cntr_assign_enabled = enable;
> +	}
> +
> +	return 0;
> +}
> +
> +inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)

This "inline" in the .c file is unexpected. Why is this needed?

> +{
> +	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
> +}
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 065fb6e38933..bdb264875ef6 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -428,6 +428,9 @@ static inline u32 resctrl_get_config_index(u32 closid,
>  bool resctrl_arch_get_cdp_enabled(enum resctrl_res_level l);
>  int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable);
>  
> +bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
> +
>  /*
>   * Update the ctrl_val and apply this config right now.
>   * Must be called on one of the domain's CPUs.

Reinette

