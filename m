Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EF513D8B2;
	Thu, 22 May 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931603; cv=fail; b=YMKL4cZk6BMDcjjOV+Y6hrfqMh3OmDnfwmlSoiRnUDxRglFFNJzhaU6nHb6OcPVOWoN0Du0cwueisoR4HK7Xjmc+bH6YapdzXR/+aOEcpGSwNy62qZLA/0faHToPQpN2OGvBnBBPtuIHQlk2cJoRK+0Uv8/99bgPTFctdslSx0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931603; c=relaxed/simple;
	bh=1RifCe7u3cylRKyt7agBRmdfXEnV6Wi4wjD/hjmq9HI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WFXsP//tH0R3sSDcMGqvJGKGehvEtiPHi2KdHChE5n/LuzDTjB6LR5ygS833gjeFInicZPF7me4AOkc2RLmWdgYSkNxtahxmVMfsMdKo4jOkN6f73/qZgmxRy/d1EoQlHv2u1Tkj7M3T3RDfItEUehg6H8TK8YdiFCAtUsMgYs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fFSliCFG; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fFSliCFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747931602; x=1779467602;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1RifCe7u3cylRKyt7agBRmdfXEnV6Wi4wjD/hjmq9HI=;
  b=fFSliCFGTYxCJincvC77V8SFEJMKUWstgvD5lSJVs7PNeYBfLyiPSP4U
   DrZ4Vv8xGfOHswVlVIhhmMtb61q2HX16TfmjhrN218xF88PNu917pACYO
   HPrgZ0t8tRdWEKn7bO8tCMmoVcr61ehJHGI/hbM58qfGMIWArB4nCzS4Q
   ntZR2fei1PXQ1ldelMzF99bWtVrYm3SLWcnTNwOS5AseTAIG0TAblTUWP
   QYmyTmDwREAXeYjBVsnn/g9F9YOeNbIzvorXvC0awFNWlDUcnX7+t1Gap
   J8wK2IpGeum925CnD3i3Vw5obdDaqTQpWzfUs2ws60vbrXdskGtnZ3SJk
   w==;
X-CSE-ConnectionGUID: nSSCiPk0ST6plhxXuWOjBQ==
X-CSE-MsgGUID: /fww5kWqRhKml1lJ6TLUFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49220739"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49220739"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:05 -0700
X-CSE-ConnectionGUID: C5HMXXSHQWuUKdUJw/34DA==
X-CSE-MsgGUID: BTTt+G1rSlGtxQF84EewKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145389149"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 09:33:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 09:33:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 09:33:04 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 09:33:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W9K6GolrFw2fTPN8QafN9MuKTnsafy/IuJh4DVcLoggcpQXvwFeBN1xIm71sXaLzGEbirfq0YlevKH1IMbbNgnGsYdRqEkek3mqQYNY3O7IEI6KuEn/neDAHvcEUb5shFDfjpJqHshrwkM7fL0OauIGi4VWai82pxl+HlEmmTRzSXfPtxo6QfRspPcXefpc2C2BX9MyCruWZ8T0a45VLAxlZVkhUjuJXkTCVCCZFghrQIjmemd51nV8g5OYCzCsqutk0BG5TJiYUIDkmDZLVSZ4+mHLGYk3dhk6GiKd4PLTwjNm4/Z/uG1eKUSgrrzgDd4MpU+Q8JS/ZcLx79mfN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KimeS7iQ40Nd5jWBaUy0NTNbScdDTBz6Z3TtIDGsVsU=;
 b=secxM5PqLcUZzH3DBb4HRGjcUxUJFQm0tZqqR9BdBDhOmUn+8FsGxnp55ZN2zkvGN0pHbshJBbipRsF+oJmyYIgAcCARBKFZSnWsQIKqxShglts109wKU5hhoLjCSkHixzbMyMOuGjpBeUrDDsbPJVo8GkpZf6n/+U5/a3QMaZ55ei8f2AVD+iLickN53AfQ9jc9V6WCtP7aRVfHmrsVhqyUiK4hrHZIdRv92pr+MNmJZ6VM/pGfNQpmG9QSQiQ6AAqHm0OmnncpXAqMVkrfIUiY3vb2+ibXdGq1yoMsb5Dr4Q0JaGgWgtMu/5bTAXzgjTUw83kdsFwZZlNV0dcMsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.33; Thu, 22 May
 2025 16:32:46 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 16:32:46 +0000
Message-ID: <fa78c5e6-582c-43fd-a0c0-5b6a4439b0e2@intel.com>
Date: Thu, 22 May 2025 09:32:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: Peter Newman <peternewman@google.com>, "Luck, Tony" <tony.luck@intel.com>
CC: "Moger, Babu" <bmoger@amd.com>, "babu.moger@amd.com" <babu.moger@amd.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"james.morse@arm.com" <james.morse@arm.com>, "dave.martin@arm.com"
	<dave.martin@arm.com>, "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
	"x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"paulmck@kernel.org" <paulmck@kernel.org>, "akpm@linux-foundation.org"
	<akpm@linux-foundation.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "ardb@kernel.org"
	<ardb@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
	"jpoimboe@kernel.org" <jpoimboe@kernel.org>, "alexandre.chartre@oracle.com"
	<alexandre.chartre@oracle.com>, "pawan.kumar.gupta@linux.intel.com"
	<pawan.kumar.gupta@linux.intel.com>, "thomas.lendacky@amd.com"
	<thomas.lendacky@amd.com>, "perry.yuan@amd.com" <perry.yuan@amd.com>,
	"seanjc@google.com" <seanjc@google.com>, "Huang, Kai" <kai.huang@intel.com>,
	"Li, Xiaoyao" <xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "Li, Xin3" <xin3.li@intel.com>,
	"ebiggers@google.com" <ebiggers@google.com>, "xin@zytor.com" <xin@zytor.com>,
	"Mehta, Sohil" <sohil.mehta@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"Xiaojian.Du@amd.com" <Xiaojian.Du@amd.com>, "gautham.shenoy@amd.com"
	<gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <aC5lL_qY00vd8qp4@agluck-desk3>
 <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com>
 <SJ1PR11MB6083B627895846B8663B4805FC99A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <CALPaoCjh_NXQLtNBqei=7a6Jsr17fEnPO+kqMaNq4xNu2UPDJA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:a03:254::21) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: cf6450a1-9ca0-46f3-4d99-08dd994e4865
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzh3d2JPdmdGQk9nOHVtMXdOMXRsWXcydWpJL2x2LzFhbDI4eXEweS9qRzE0?=
 =?utf-8?B?dVc1eHlrdStGNG9WUDJFZG4xNVFlVmJKK3JDM25DQW5JcFJWaDh0bEtPOUhN?=
 =?utf-8?B?SGJNWEpJbmxyUWZEOFNXOVVrQU5zZzNTdXRPbXl4QWlwczJ4NkdrK1ltOG1z?=
 =?utf-8?B?SGVLa3BGTW5icFJsUWNqQW1yOEh3R1RSeWQzWG9ReXNDamhLemRvd1FzQlRR?=
 =?utf-8?B?Z0dZa2VPK2diMUZPM1EyUG5LbXl5aE9SSjl1a01VZ25tRVVPVFBFaHc5eUts?=
 =?utf-8?B?M3pvMy9XLzUxNXNmblV4UlJjZDBCdzdpTkdGaks0QVYwRHJYRWJEL1dMaW1W?=
 =?utf-8?B?dUVLNVFlazJ6U2liSVVzajZ4WnBGdFNEZWVleHJ4WWZtTlhNclhBRUo2M0xv?=
 =?utf-8?B?b0p0VktSa2JZQ0JpNFhKK3RGbUpZejN0TzR1NEFsUjhhSEx5VUtvclNGbUdL?=
 =?utf-8?B?Q2lKTG9Oenp1elI3VHNod0VQTy9FOUJaYURydnk4cEdsMjg2a3dRdGc3SU9i?=
 =?utf-8?B?RDN4TGxGWWRHcGtpWW9DRExscTB1VEZoenRURTViUjhlOThBWUplU1NZYjd0?=
 =?utf-8?B?cEFYbzRPL2oxcEdXMjJLK0tlcjZnZ2I1Sy9ESFlBNFluSmpCdjRxYjN0Rk5v?=
 =?utf-8?B?REgvMHdmVjdHT3AwTUtJMWhINjFYbHVtNzNhanhja1FyWWQxVEZCWmVBVURN?=
 =?utf-8?B?ZkVRNGM0bFpSWm5qUGlBYkJTUDhyZUh0R2NvTDl0QkQyVkJQbkV2VEJXNHFz?=
 =?utf-8?B?aVZJbHhmbDJmOUhJNnJCclNIVklxZmJCOXAzbVp4UWM5TVJaZG1pOGQ4L0Zz?=
 =?utf-8?B?OG05N0NMK2lRVWltNUxRb0lRcHFoVXdXeXo2YWZrNWdUbmZlSU1uODBPUDJu?=
 =?utf-8?B?VkRqRXdBUDZ4dEV6WE1ScC80VlBpZjlRcVJzOUxlSGVleXZMY1ZjaUtRMVNx?=
 =?utf-8?B?YkxsdjhFL3RMTm4xY2RRVUpHS0F1ZUt0TW55U1dOODBiNkptVHlQSWRBbXBj?=
 =?utf-8?B?UUZ0MWQ0Z3J0blFWWkJBVEdFeTNrbDgrNHMwd21va3krdW9idzI4c25OVFlC?=
 =?utf-8?B?UDVPdjNQa2hHdjJZb2NCc0VuUkN0eXlvQ2REeVJoelBUVFMvOHNVMGRJTXdG?=
 =?utf-8?B?QkxVTWprekNsY05zZ0J4TlFwYVpBaWlzTS9nb3oxUHoyVmZ6bGg2bEQ1L0NB?=
 =?utf-8?B?QmhEeTJsNXdNUkUzTUZFYi9Xb3hUZVkvRjNrU0ozb0FzSndjMVVJZHM1bDJX?=
 =?utf-8?B?anBtN1VDckNnV3czNjBZRkF3SE9lTVpqb2tVMTRkeDgwOVBkc2p5b3VEUzF5?=
 =?utf-8?B?dzdkSXlqdC9rQU1YNGN4b3JuWkhscmcxR3FUekR3dUFXVitvOWdGcFZseU5t?=
 =?utf-8?B?alhNenQyUnN3VDZHcHYvUlhpeG45dUlMQXdiYjllU1pFT0tvd1hWU2IwbkJF?=
 =?utf-8?B?cFJMeXdHZ2lSMk4vcldYMXVJNGNrdHpNMTRZOVkzZ2RONFpLRC8rTW1VV01W?=
 =?utf-8?B?cWpLNEs3VWxHdjMyaHhSdm90S1ZDaTBMS0FCMGRVVU5UenQ4YmlaNkFRUGdJ?=
 =?utf-8?B?V25ISHAxY3VxNmg3djBmQUJIN0NYZEpoeVhDSDk4emdPMjVtKyt0bmVtbWRW?=
 =?utf-8?B?MHlPNHN6R0w3TWJ6L1NXaXNLb3NGbHhtZHlSYmNFTERJZCtqelYranZ6OFJx?=
 =?utf-8?B?andtUDJpS3o0cTZRblhIeFA5UVdkMVNtSUVVVlJMNmNZZXppdC9SZzlEUTF0?=
 =?utf-8?B?aWJXL3ZGK2xMdHpOeG9HY1NnNFhoWGZxTjBxZ1Q5SCt4QnpMbHhvQy9zK2lv?=
 =?utf-8?B?Si9OaXY1OFBGMms4MklHb0IrZGE2WmZkZXYrWVBBVU9YU1ViUnliSWt5SHRC?=
 =?utf-8?Q?497prlXkDr/Xc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFFTR0t4Y3MycGdGa0lOaDdXb0o3VlZ0eHhZMUV1K2p3REJvSnJqYThWd3JW?=
 =?utf-8?B?aTlkTkx5STBsbE1hZHhGeWNYalFUWEZyVXQrWVpaakZscVhvUlpid2tjMEI4?=
 =?utf-8?B?M1ZBdzFxaGRlL0MxNVQ0Tkc3aS9jMXBTTkx3TXhYNWwrVXo5NnlQQy8wVHY2?=
 =?utf-8?B?RkV6YVBzQkZIUTJ1eWtYa3Z4bTZjWDhXeW1zMGRGdktyT2NMd1JCRG9TNDhj?=
 =?utf-8?B?T1lLUjJxelBrZktLUFdOSWVWWE9MbXpsYkJ2WmZHZ0tabzh6TDBwUkdpbm1K?=
 =?utf-8?B?WjdXc1BiY1RwTytDYTU5eHZzMUxFZS9CMm44d1kwZGczSlZRTWJKb3VNTE1S?=
 =?utf-8?B?bS9ITjV5QVIzWHByL2xEYTFReG5ZQ2Z1dDNEUjdmM3MwWWk5WkJqQ0xScTVS?=
 =?utf-8?B?S2VJTTh6RGsrM0JxalFyZUtRTEh6dCtKa2g3Ymo0UUpURGFMTUtzT3NTRlp5?=
 =?utf-8?B?ckpBRWM5eVAxV25JMDdDYUxYaHc3bXRyT3BINkhKYTc1QTlLcG5MNEl2V0k1?=
 =?utf-8?B?UjdrUUFobElWdGRzanRIc2tNYThtbEtYSVpFanVKbXFNWE4xTWhIV1pFUW5W?=
 =?utf-8?B?eWJLNG12RTVKT0tsM0FPN2RUZ0xNd1BoejNZU3VrZG5HbERrWXp0VVZkMEJC?=
 =?utf-8?B?SGttbDNTYUZLeEpIaURxMEFsdXJPN2VETEY1VHdHZzhHUkJUenJyN0lHT1Jq?=
 =?utf-8?B?RU03eUtPaElaUFZIVnVENHhLdkQ3WDZMQms5UlhMaGltRTJMS3lPSkNjTjly?=
 =?utf-8?B?cnVKQjhqRFhJU2pmK2VJZGU1Y3NvOVRBOTRsb3M2WDBqTHQ1VVpvcmhpNjd0?=
 =?utf-8?B?UHpiamY1M0ZKQm9IY1FGTThnUDJXRWsyMXFRcmc4TEZCeFhaaEdXRE5odGhJ?=
 =?utf-8?B?Zjh2K2J6UGoyVW12amlyRXBwNkFBblFRUVlQOVRSaWtEODVzbEZoaDh2SG9r?=
 =?utf-8?B?M1ZuQzRuQ1RWeGNLZ1dRR01obkxlNjJJeXZSU1gySGNDU0Flc3ZCM0JCN0N5?=
 =?utf-8?B?Tm0zdi8zNnA0R0tZdFNBZUpTbFlpdWxVMllnaVhnMS83dkhtcS8vZU83MzJZ?=
 =?utf-8?B?LzlMdmlPMU5mYUhZSEdIU2xqR2htc3VsdkFtUVNlQWNTOTlzcGpZdUg2bVJl?=
 =?utf-8?B?Y2NnUkd6dFpYQU85K0VQRHB3bWNXNmpzMXU2S2IwRkRJNTJaNHB2WXhXZ1Fq?=
 =?utf-8?B?YWRGaXNxZWd5cnpFMFhWakRRNE9VS2I1djBaRERzZjB0MDZqOGw4OTVTS2p3?=
 =?utf-8?B?dzVxTjFiVStqUlF2RVFqRkplYnFZckhKZFpNMEZGYVZ4TE51c09XaXMzSG9u?=
 =?utf-8?B?K3R5ZVpybjc2YUN3QnFCZ2pkMk9JTHdsZGIxY2FaZldqMm5wYjc1SUdiS0Jz?=
 =?utf-8?B?RzhZRDY0STZxbnp0MDB6NHQzVTA1TkNNYmZIdHZHMzEza3BUZTdlSWtBMkJi?=
 =?utf-8?B?VU5SY1BZS1NCbXd4M0g4cldUWVRxMjl2cjVGOGRndUlwNVJvWTkzd3FZVkhE?=
 =?utf-8?B?OVhVa0o3QWhWc0VsTm5jaXJEbUd3cENHLzZ5dSs3RmpVd0VVRzV5UGFJaG1z?=
 =?utf-8?B?bUdMT2ZzMkROSW82cnhpZ1BGdUNacUNHZjNPdjBwN0o1SUFYVklMd3pPdzFn?=
 =?utf-8?B?WU8zY0toaVhPM21MTk8vWUU4RmhlTGdFa1crY3MvbER1c0U0L2hsbytKeVpu?=
 =?utf-8?B?a3lWcXBlSTlpVU1rbmpOTHljdTl2bkNKWThDY0M0VzFoeXlSbHpoRjVHTFha?=
 =?utf-8?B?SkQrZzFlQ1F1Z3d5NXpzSVZCOWQwVHVDWC9NMlF2cFJvaEdPWTVLUmhKZDFU?=
 =?utf-8?B?bVRvbERIdklOTFFtYXBFbUljbXloQzVlK0wxbGNrcWhGL2QvcHliQlZqdzls?=
 =?utf-8?B?Y1p4S0tVT3JEbUdUSkQ4SzBjQ2NSMFdUUnJOcUxyNHZONEpnRjYzM2llREln?=
 =?utf-8?B?VHFpSnBrT0RSQ0FFZk9XREhKSWdPLzl1N3NKQkVVdHJrUFJFdzIvTmR5YTM4?=
 =?utf-8?B?a2I0MDFJcFBMTzVrbURkN0RTR2R6d1RScXAyRFFFYU9HM1ZGT0cxTlp1ZUlz?=
 =?utf-8?B?V1VIRlBZK1dEKy9oaGtlUU13aUtaUEg0SVJZaXkvVUNtbE1RQm1oTi9iUk1s?=
 =?utf-8?B?bTVSaVVUYm8wakFyNm5aNmdsMklBZ0Z0cS9YNWphazBqV1AzdXNhMFhJUU1Q?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf6450a1-9ca0-46f3-4d99-08dd994e4865
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 16:32:45.9781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aJRo0UYce4tvyQxoEvHjF/gmTqLWPhnZEe9tqwOQfQbyPiwxjEEWmSsZAPOAw720g4BhiYWg6w+KE7da0+8RdRChe8rSNh0lnjlncdMjVOM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
X-OriginatorOrg: intel.com

Hi Peter,

On 5/22/25 1:47 AM, Peter Newman wrote:
> Hi Tony, Reinette,
> 
> On Thu, May 22, 2025 at 2:21 AM Luck, Tony <tony.luck@intel.com> wrote:
>>
>>>>>> There's also the mongroup-RMID overcommit use case I described
>>>>>> above[1]. On Intel we can safely assume that there are counters to
>>>>>> back all RMIDs, so num_mbm_cntrs would be calculated directly from
>>>>>> num_rmids.
>>>>>
>>>>> This is about the:
>>>>>    There's now more interest in Google for allowing explicit control of
>>>>>    where RMIDs are assigned on Intel platforms. Even though the number of
>>>>>    RMIDs implemented by hardware tends to be roughly the number of
>>>>>    containers they want to support, they often still need to create
>>>>>    containers when all RMIDs have already been allocated, which is not
>>>>>    currently allowed. Once the container has been created and starts
>>>>>    running, it's no longer possible to move its threads into a monitoring
>>>>>    group whenever RMIDs should become available again, so it's important
>>>>>    for resctrl to maintain an accurate task list for a container even
>>>>>    when RMIDs are not available.
>>>>>
>>>>> I see a monitor group as a collection of tasks that need to be monitored together.
>>>>> The "task list" is the group of tasks that share a monitoring ID that
>>>>> is required to be a valid ID since when any of the tasks are scheduled that ID is
>>>>> written to the hardware. I intentionally tried to not use RMID since I believe
>>>>> this is required for all archs.
>>>>> I thus do not understand how a task can start running when it does not have
>>>>> a valid monitoring ID. The idea of "deferred assignment" is not clear to me,
>>>>> there can never be "unmonitored tasks", no? I think I am missing something here.
> 
> You are correct. I did forget to mention something...
> 
>>>>
>>>> In the AMD/RMID implemenentation this might be achieved with something
>>>> extra in the task structure to denote whether a task is in a monitored
>>>> group or not. E.g. We add "task->rmid_valid" as well as "task->rmid".
>>>> Tasks in an unmonitored group retain their "task->rmid" (that's what
>>>> identifies them as a member of a group) but have task->rmid_valid set
>>>> to false.  Context switch code would be updated to load "0" into the
>>>> IA32_PQR_ASSOC.RMID field for tasks without a valid RMID. So they
>>>> would still be monitored, but activity would be bundled with all
>>>> tasks in the default resctrl group.
>>>>
>>>> Presumably something analogous could be done for ARM/MPAM.
>>>>
>>>
>>> I do not interpret this as an unmonitored task but instead a task that
>>> belongs to the default resource group. Specifically, any data accumulated by
>>> such a task is attributed to the default resource group. Having tasks
>>> in a separate group but their monitoring data accumulating in/contributed to
>>> the default resource group (that has its own set of tasks) sounds wrong to me.
>>> Such an implementation makes any monitoring data of default resource group
>>> invalid, and by extension impossible to use default resource group to manage
>>> an allocation for a group of monitor groups if user space needs insight
>>> in monitoring data across all these monitor groups. User space will need to
>>> interact with resctrl differently and individually query monitor groups instead
>>> of CTRL_MON group once.
>>
>> Maybe assign one of the limited supply of RMIDs for these "unmonitored"
>> tasks. Populate a resctrl group named "unmonitored" that lists all the
>> unmonitored tasks in a (read-only) "tasks" file. And supply all the counts
>> for these tasks in normal looking "mon_data" directory.
> 
> I needed to switch to an rdtgroup struct pointer rather than hardware
> IDs in the task structure to indicate group membership[1], otherwise
> it's not possible to determine which tasks are in a group when it
> doesn't have a unique HW ID value.

Whether the task struct contains a pointer (albeit accompanied with its
own complexities) does not address the issue that I am concerned about.

Looking at [1] I expect this new feature handles "unmonitored" groups by
placing them in the default monitoring group, following Tony's first [3]
suggestion.

When considering [1] by itself in the context of current resctrl all tasks
should be members of resource groups that have valid HW monitoring IDs allocated.
Using the default resource group in this way seems like addressing edge cases
where pointer is not yet valid (unclear what these scenarios may be) instead of
routing many tasks to the default group. I am not sure and I'll have to study
that change closer to reason accurately.

From what I understand the new proposal that builds on [1] involves creating
new monitor groups that are "unmonitored" for any length of time and when backed
by the implementation in [1] this would mean these groups will actually
still be monitored but the data attributed to the default resource group.

As I mentioned in response [4] to Tony this fundamentally changes the
behavior users can expect from the default resource group. In addition,
this breaks the first of the "Resource monitoring rules" from
Documentation/filesystems/resctrl.rst:

1) If a task is a member of a MON group, or non-default CTRL_MON group          
   then RDT events for the task will be reported in that group.  

How does this fit with the ABMC work? I continue to think that I am missing
parts of the discussion as it seems this new feature discussion mixed in
with ABMC work.

Reinette

> 
> Also this is required for shared assignment so that changing a group's
> IDs in a domain only requires updating running tasks rather than
> needing to search the entire task list, which would lead to the same
> problem we encountered in mongroup rename[2].
> 
> -Peter
> 
> [1] https://lore.kernel.org/lkml/20240325172707.73966-5-peternewman@google.com/
> [2] https://lore.kernel.org/lkml/CALPaoCh0SbG1+VbbgcxjubE7Cc2Pb6QqhG3NH6X=WwsNfqNjtA@mail.gmail.com/
[3] https://lore.kernel.org/lkml/aC5lL_qY00vd8qp4@agluck-desk3/
[4] https://lore.kernel.org/lkml/a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com/
