Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D0B2367B8
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807487; cv=fail; b=fGi4+4PckmXLHEvdB6dlqUHvM+6ya/a9uP0KqhJaMMwd1g51JQzPAwX0lz1LFGiAyG7IEvh+IUS1TBwZ7mmM3D+EMNBDZqB/avRxQwH/WVvtszWqd+8Ql08NQ9YK9E0vcTq6PdgznvTqFMPpbxNyvssmdOlXTSdBTCDH4s9jnqo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807487; c=relaxed/simple;
	bh=whwgMuT/IHIHsCA09JKfCaRYljqU8304OxMD7CssIM8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UdjxnO1kL8Lr2M7/DhBcAg/r8MgPGcPrFUIlCCnu+str1WCrdYz26FJ0SZqGUJhPqHPnmLcn0fOucz7SjiPB6pM5iMCafwfR4gkgOc4dXCoH4iypxSrsErETwmxZiy3FDeQf4c1V+H/FpXRot8w7ehJRr2DDMyhYZ2x+8LmkW9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B48EHO/b; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B48EHO/b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746807485; x=1778343485;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=whwgMuT/IHIHsCA09JKfCaRYljqU8304OxMD7CssIM8=;
  b=B48EHO/bK3tolI9plOLdnfIjohSXyYv3Brk2CZPtzs8cfbJBBWLSRWs7
   8w4OYBo5QxhpIT5qa1RwZGwWyIRmNhLGruoU/lHsZwSsb3TlszgN/Rshn
   /BqLVbh6ouONlnCYW9Fe6HaClKfCY6UazVl2wbdtXLaIBycry+77UbzTN
   RoaS3FofoCl9L5g+b3AIie4plwTLoH/rgW+aGuSbU86QrSS+6ToLB6c2e
   yE105hGXAe1z8yEJu+Hn+4Jb4NgBnQQeDHqEwtMG2PwhIuOkyjs/2VPA+
   gY9JGgcWUgU4TTZ3pCXCqMpzHHSRmhoIkhPMqrgX+4kOQ8fK0GKCD4qxc
   g==;
X-CSE-ConnectionGUID: mRqNTJL0QxORPJXrr/xxLw==
X-CSE-MsgGUID: Gm1YBlRpS3OGtK96P4m0PQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="74026004"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="74026004"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:18:04 -0700
X-CSE-ConnectionGUID: QdV52E7ERKGnI497E5x8sA==
X-CSE-MsgGUID: QPat/yOnRISJWFrbv2YFmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="137591105"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:18:05 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 09:18:03 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 09:18:03 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 09:18:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A2Qr22DMrgTuaObtuQw1syEi7YsOvWH1j+ym+KTY5/H/81Tv826pgrJeHBMUQ0SkqtYLWlR9s3zloP59oM4vdfaUZgw1L2+1HCNtRuMucn2euxYdWnTiU4nvqa3ibg4GeHZVaDFStM4eJCcktkDKLgr7Zyl9KQ2D0KsbqB7TxmrNw7FFWqAPMYkwfR1CvthDX2sz300lxIYL2jwbZ572FFLkU/lem/Y+KEJE4hIoelI8C+LIPzMq8tqQz6aBmeebFvofx0cyMnjaP4aVH3DJt1NxyHW93DUDaZPE5W3V37fGKz1X9orWL7yGo02zROojSKxoxeeXaz/we5nhLzabig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxtaCkVsnIQG3HJ+ZIa3rTVJH2RpYaUX24sGKz9iYw4=;
 b=ScLDRdmNP5yTgh6LW4vj4bi/S0ub9ADInXruANAWwa1cHiWapPbBg6rrwfujN6zc7eikQ+Zvd3R0M1Lo6879iMVHjwqLsGTo6BP0EXfyb8O/X3zb9etoOJm/t1OrEm3QgXFssgncqLbqUIx/V9zzUPMKJPhejsntKg/i/GUeOaPWucmbY3MU2z82fjUd0dsNOJo3/XuoC060l9AmXaRyIamLRB3FffztZ3FOL7BNFub+OOMTnFlPFHe38FplRtSpX+cuYlBB5LH4TH6/uPUCrpX/Z79Us844vEI890I+j2O9mJ2QU2emc3+cibgEARpZ6xXkRRACKQZwngiw8BOSIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB4808.namprd11.prod.outlook.com (2603:10b6:510:39::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:18:00 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 16:18:00 +0000
Message-ID: <524a79fa-5066-44fb-b9ad-7182dd28fb39@intel.com>
Date: Fri, 9 May 2025 09:17:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
To: Catalin Marinas <catalin.marinas@arm.com>
CC: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, H Peter Anvin
	<hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-8-james.morse@arm.com>
 <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com> <aB3lS8K7I0wEkGw_@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aB3lS8K7I0wEkGw_@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0378.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB4808:EE_
X-MS-Office365-Filtering-Correlation-Id: 50c6244c-67a5-4034-4220-08dd8f151161
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0FycDFZczZqeXltcTgrNGpFVEhFd3JLWFMxc3d1d3JsRFZXcnNRSGRPSUs4?=
 =?utf-8?B?WW0vZjVobEREd1did3RFWnJkQXc2R0k5akRZbTlUbVZQODlOYzR3SFgzNzB1?=
 =?utf-8?B?SllmaThBTFZMZ2pDTmgzbDQxY2xOSVFWQnRpa0RTejZtYmFPbmV0YndCeU1V?=
 =?utf-8?B?bUtsRWxob2pqQmM1eEJkUnVFRkxVeVJiZ0dodDVrUy9mb0FoVkJqcGl1blA1?=
 =?utf-8?B?eEM2QnhJc0UyRGhWSVBULzFaeUhPeElHejBUUmFXbndHK1UwUVJHYW8xRWRI?=
 =?utf-8?B?SloyZk01SXU5cmx3MHVRZmdqTEhIeDErRUQ0TFl6OUFQbi82T04wangrZVdY?=
 =?utf-8?B?QjlRaHRINmtaVEQ3cGNycTd2WW5CLzhPa0NtR2ZoV2NTd295T0IxLzJwWWF2?=
 =?utf-8?B?d2FqWGRsMU5uYXJXTWl3RFhwRllMZUNIaWFTZktFV1pxTU8vQUpmeG44WlBl?=
 =?utf-8?B?VzZKbGhjWGZ6QWF3aExxQlNMN1JpeXEwTjdnMit4d1dMc2tYVjZlMnZkTjc3?=
 =?utf-8?B?R1RvOHpOeWUySVlxbERoQWFBMVg5T1FvdmdZVlZHOVEvYWh4UjlaT3VpMDhV?=
 =?utf-8?B?TnhqK3JDd3NZYkx2QlV6aDlFS0F3NnYrOEZiRW9MQWtnVHJCWVVQeUd4RFVk?=
 =?utf-8?B?d0lqbmxrZlBUcFArSkowUCtoUjFIYkQ2UUN0Y0lvSng2bis3WERGTDVrVEVv?=
 =?utf-8?B?NmRGdnJPWHhEZHAwemFZYU5hZXdvdFllSnYxMU5DaU1JTU5RMjE4cmJaeGVE?=
 =?utf-8?B?eUN3RnV0dCtXNzZOYXZMMUVWODM2MkdkYmxuMDZvVnZTcURRTXZ3TCtKMFRr?=
 =?utf-8?B?OWtVdTg2Q0ZjdWtpYUtYcXN2cjRUL2NkaGxvTlFJQ1Mxc0hNTEpNUFFabWww?=
 =?utf-8?B?TUlVSVhGSzIyRi9MSEZKUzFBY1lQeEtjdXZtc083eXRJMXgxbTk5dnpsMitM?=
 =?utf-8?B?dGNzRStaZzdVbHM4dk1WN2xoR0E3bjVsdUEyTDVwMElXTUIyZnZLK205TkZv?=
 =?utf-8?B?d1cvcGg5RmpQaDVCL0dlM2htQXNmTUgzK05ZWUUzSVhDWWl3UFJmbS9oSitu?=
 =?utf-8?B?M1p3NGd1RTN5aW1XMGdyWHNhcnJJclNkNTE2NHBnMDRNSEI0MlR1Wkk3RmIz?=
 =?utf-8?B?V1I5bXFXZXlISVJNNGZUenZ6NFJkWlkwODI3RVRob1pFMkFsNHVlVUt0eEhT?=
 =?utf-8?B?aTlFeVJ1Q0xZMTZIQnpHRnE0RURjeWRZeWttQkVPNkkwc0xtOG5kaExJNTFL?=
 =?utf-8?B?ekRGM2p2TGFTY3pMRHJSbTVwMUZXQjJrczI2UjllUWx3WnNMeU5CSFVXR2xK?=
 =?utf-8?B?S2l3S0E3cjdYRi9tMGtya29hVmYwTVhuUWhSUXNtRFBxbU1PYVBSd282cXFz?=
 =?utf-8?B?a09XK214VTFaNTNNRllINWNTY0dEU0xrK1B4RC9vSDhsOURhY1didjBUdmpv?=
 =?utf-8?B?YVRQV2lLMkN3RlJrVEpDdXRkL2pyUURKQnA4L3NLZWwwaldHK09JaFNYekFa?=
 =?utf-8?B?alVOZjBSc1Y0eVVlQzdjUlJ4blF5cjhKZGd2OXp5a25MazNhcmFvT2xxbVc0?=
 =?utf-8?B?cEQ5VjFlblJNa3RvVzh2cmh1YU9jTkRiTkovU21PQlYzMFRTTmxUL3NMRU5I?=
 =?utf-8?B?bmt0Mk5jUnRuMWZKOXo2djljK0VxajhxaTduY08wTHRHYUNYM3dMMUQyWW5R?=
 =?utf-8?B?bENsS0QzY3VLS1g3Y0hLWWx2dEhjK2RPUkRSUzR5UzJyblI1a21kWWFYUllp?=
 =?utf-8?B?NFk2dEw5NFBtNUlqZTVVajVmaHdNRmF3bnRoTmN6UXB1YmNXaTBuTmlKRUdY?=
 =?utf-8?B?RklKcm5oaTl0SlVYYjFHckhHV1FaVmRmTk40aUkwdWlDcWw4MUQ2ZFQ5M29p?=
 =?utf-8?B?RU9NdHQ3WTIwcFdDa2ZRRnpWU01Hdlhxd1BJbG5ZY3J0WGlZbFlaakJoRVR4?=
 =?utf-8?Q?8wpf/DjP0Sk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cDhtM3Voa0tQZnVpcXNYQlZxZFpWM0JzZHpQVXM5ZUNRVHo3bk9DY2pWQTV2?=
 =?utf-8?B?SUtKQmc0Z3JuTlhZNzNua01COUwxY2hCN0xhMEwzSVM4NGcvblFsejZXY1Rn?=
 =?utf-8?B?N3JrZXhtUU0wR0x2bDBTRlovR2wvNGVySitqUDQ1Vk9RcEI3Vk5JSnlwV3JM?=
 =?utf-8?B?dXVmdTNZdHJtT1hCay9hQ1BVR0puWjVMczdlcGs1d1VFZ0YyQUtzVVBvUk1G?=
 =?utf-8?B?QzBvTXhLV2hUdXhJWktIaXcrZWl2ZGcxQ1lqMDBrL2k0bG82a1NraVVEcEV2?=
 =?utf-8?B?OTVNSkNmRDJBelZJLy8yK2N1NGJDMnRhQVR5VWREOEpVa2VSOWdOY3RSLys0?=
 =?utf-8?B?dlo2Mkx6UXFOVFdZZU1ZdWxDYUtLRFBtTGZsbEVoeTA2QlIzMzMzVDF0cE9M?=
 =?utf-8?B?cXFRWU9MUXNxSGNYUGNsWUcrTitiU2t4N01YUThKRy8zaTNvTURhQitIY1JG?=
 =?utf-8?B?ZWVyci9RdVlodU5wV2NNeFhFWWlLTENpaU15TDVvMnU3S3YzZGxIUkMrK2Fv?=
 =?utf-8?B?bDBLYWlPMXJUTXNhazRQSW1lZHFhWmpPRUlteFFjYTlzeldwM25PQkxMTi9F?=
 =?utf-8?B?bnJ1OGRZM0VWN3c0RXhmTnpIbWtXK1hla2UrZWp6Yis2WEpuRTVxVHNQTE1I?=
 =?utf-8?B?TnhhbFowMTMxWHVka1pTVm5GRnJvbDJYaDBLOHYxUTEvaVVlNC9IMmNGUVVz?=
 =?utf-8?B?ZnZPbk9JMCtsMXIvdGsvOUFKTnNGVFFqbk04c3Y2alhvZkRaL0JZTHRpNmw5?=
 =?utf-8?B?ckorYisrbVpzN01PdjB5Q3Eya2c4UjhERStHejkxYVpRd0h5dElzT2pwM2o0?=
 =?utf-8?B?STNudldTMStaVWNSbTZmMmVJNmwyOEtQSGlYUUY1Ny9JZHlpc3lva2I0aDJz?=
 =?utf-8?B?YVBqVTN4c2JHb1RDVHZuVVNXWUlDcWxNRHhjeXZsT2Fsd1E1MmVvNTZhVGFT?=
 =?utf-8?B?ZFM0Nmk4MW1JVUh5ZjVhcWZ3RE0zdUVLcXVoMkNSUlhFWU95TjdCU25TNWQw?=
 =?utf-8?B?TzhPUUlwMStkWlQ1Tm43TnhMcG1RTFhoUTJkV1VhWFlNU2FMdW9ZV2huTzcv?=
 =?utf-8?B?bHQvRmlVSCs2MTFvL0E2MHJZZ1ZZd09USFBjWXRxNmRzc252SmRxTmc3K1FB?=
 =?utf-8?B?ZXZaTjlZYlFrVklKanpjRE16VVBwV1U5d1FkQlJWSzYwTjF1Y2haMVdOYnM3?=
 =?utf-8?B?dSsrZkl5UXV5UGpOY1JPK1pMcklwOHBua3cwbURiNHdVQllTTjFJNWdZbGkz?=
 =?utf-8?B?TExoMXY3anFaNnlvSC95Qk1zRFMzZTFDck1lRk81N3FCbDJQdGdTOFpRcW1j?=
 =?utf-8?B?RDBzeFFEMXhKWVpWV0U0akUyNENNNDZGc2hac1E0cCtFMXIwMURpTWVSdGI3?=
 =?utf-8?B?WURvbHNkY2wrL0pWUUpsT0R1aWZ6ZTFsWGQzOXNtcktVL1NvVGZTOHhOd3Y4?=
 =?utf-8?B?VDFtMExWazZGWFd6V3FrUm1xWHZvOU5Ha3Ywd08yaDZFSlkweHJEUHFmNkIy?=
 =?utf-8?B?bzZleFkxMHI1UW1ySWYrekd2ZS92Z2ExSncrZ05QNElmZG0wRjVJbit6NFYr?=
 =?utf-8?B?ODBjTzQySWRJNzljVlJEcm5qQnZHaXk0NWlxUGY3SFhMb01tTlJodnRpQzNm?=
 =?utf-8?B?bHZ4UldZaFE2YjBFNkVUS1U0cFdWbUdhZXZSeGlPeElRQURqQUV1VmN0cWdp?=
 =?utf-8?B?a1R1R1lNWVZTaWViK0lyanZHMjc1alVNZnBmeW1jOUZFV0xESEk0OWJwaHVX?=
 =?utf-8?B?MVk2Y0d3SkNvVHkvY3lXWUFpTzErczJyV1lIZzdCMG5JVjk1bDBoQVVJemtC?=
 =?utf-8?B?QzM5UlU4c05HRWY4NmRvZTVtWHM1dXJiQ0FvUm9wM0ZsWllUSzE5K3lHTGNV?=
 =?utf-8?B?SFQyZy8vQTB5VnRROU1IMks2OGg5SWhMM0YyNXR2SXJqaUxWVUNWNGxmVExR?=
 =?utf-8?B?ZGQ3VHNFcWJiTzVwUmlXQlEyRGVSOFpFRHhRSzBkQklBcEIxOW1VVjludTQ0?=
 =?utf-8?B?UFhJQ0QrUy9PUjJsdmdPNWkyaWxnMVBJcHNzQVJSUVNhQ1VJRjFsa3ppNWh6?=
 =?utf-8?B?Q3NZeWhUcUNLTnlxRThYWWZRaFI5V0x0OHp3R0VwSlNlMXlLZ3dJV01JZmR4?=
 =?utf-8?B?SGpSZVVQUnUzK3FxeWpMY0hVdExDeTdESkdVYlFtYlFNWGlQdHNKbTdlT2d0?=
 =?utf-8?B?ZWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c6244c-67a5-4034-4220-08dd8f151161
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:18:00.6676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avCU6TP8Wx+H21JI0FpwtqRjcL9Hk6kc3evv6Lr+YrRLve/I/fNz/B9dXIE4n6gY5TZv9TvPf9oOjCIan1ms1do41BZkuXVj3kShd4QipqQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4808
X-OriginatorOrg: intel.com

Hi Catalin,

On 5/9/25 4:21 AM, Catalin Marinas wrote:
> Hi Reinette,
> 
> Thanks for the reviews.
> 
> On Thu, May 08, 2025 at 10:51:23AM -0700, Reinette Chatre wrote:
>> On 5/8/25 10:18 AM, James Morse wrote:
>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> index 88197afbbb8a..f617ac97758b 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
>>>  	return ret;
>>>  }
>>>  
>>> +static bool __exit resctrl_online_domains_exist(void)
>>> +{
>>> +	struct rdt_resource *r;
>>> +
>>> +	for_each_rdt_resource(r) {
>>> +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
>>> +			return true;
>>> +	}
>>> +
>>> +	return false;
>>> +}
>>
>> This looks the same as before. Did you notice my comment in [1] about this list_empty() usage?
> 
> James may have missed that comment (and he's off today). Copying your
> comment here:
> 
>> A list needs to be initialized for list_empty() to behave as intended. A list within
>> an uninitialized or "kzalloc()'ed" struct will not be considered empty.
>> resctrl_arch_get_resource() as used by for_each_rdt_resource() already establishes
>> that if an architecture does not support a particular resource then it can (should?)
>> return a "dummy/not-capable" resource. I do not think resctrl should require
>> anything additionally like initializing the lists of a dummy/not-capable resource
>> to support things like this loop.
> 
> I agree the description of the resctrl_arch_get_resource() semantics
> doesn't specifically mention that the list_heads should be initialised
> in dummy resources. IIUC, x86 should be safe for now since the
> rdt_resources_all[] array elements have the ctrl_domains and mon_domains
> list_heads initialised.

Not all x86 resources support both control and monitoring. For these resources x86
only initializes the arrays it uses. For example, the L2 resource only supports control
and thus only the ctrl_domains list is initialized. When the above loop runs on a resource
like this it will return "true" because it believes there are monitoring domains
online.

Your conclusion that x86 is safe for now may (reason for use of "may" follows) still
be valid since resctrl_online_domains_exist() is only called by x86 from its
resctrl_arch_exit() that is within the "exit.text" section. Here is where I am not
entirely certain of the impact (hence the earlier use of "may") since from what I can
tell the linker does not actually discard "exit.text" on x86 because it defines
RUNTIME_DISCARD_EXIT.

> 
>> Considering this, could this be made more specific? For example,
>>
>> 	for_each_alloc_capable_rdt_resource(r) {
>> 		if (!list_empty(&r->ctrl_domains))
>> 			return true;
>> 	}
>>
>> 	for_each_mon_capable_rdt_resource(r) {
>> 		if (!list_empty(&r->mon_domains))
>> 			return true;
>> 	}
> 
> If not-capable resources can be only partially initialised, your
> proposal makes (alternatively, keep a single loop but only check
> list_empty() if {mon,alloc}_capable; maybe the compiler is smart enough
> to squash the two loops).

Yes, this can be done with a single loop also.

> That said, if Boris plans to take this series, I don't think it's worth
> a respin (assuming my understanding is correct and there are no other
> issues with the series). The fix can be added subsequently on top before
> other architectures gain support for resctrl (well, most likely Mon/Tue
> when James is back).

I cannot speak to Boris's plans or requirements related to this work.

Reinette

