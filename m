Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B34E32F4A;
	Wed, 16 Apr 2025 19:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744830148; cv=fail; b=eHdofQAQLXW59BNODVF3AgPFZf2Io++RGUGatr0O5JZDdJ9eKBFl1YzCK7o2feiCaywOe6B5Wp3o0RIJTO/6doDsktSp4nftvIB1A/lPubaycRndKpQei7PvXeKTDry+4UOPo1Y4jOHz3PBFM7U4t4rrePW4Pq0wS9a+s6CsSHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744830148; c=relaxed/simple;
	bh=NScHzFYJobMLEhPDzSCmsSz6DW3dfQIY0YaSKt5OzPI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=srGMiRZ8VtZ0hoQzED0JgQW5+AkmvD7IwVYwRg+8SGTQ+loZ4A+K3bHYXlNd0xoSrey+RbAHiRo6pInKoNk+7gt8OKVWN09NhIa1k87SHYK7Ld+CQiknyQzY/jOz7tTPZsnRtrfyAZmidbrl5O0KweIRq3oKURRk5iI22nx/qIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ko1kgHFo; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ko1kgHFo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744830147; x=1776366147;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NScHzFYJobMLEhPDzSCmsSz6DW3dfQIY0YaSKt5OzPI=;
  b=ko1kgHFoHn18ffgV+8yvk4l3Y9hjVoaPYDI8ifKlF/RFIJPLcuqVPXKS
   TqyxeJtdjxImGRqdYguHErgwVYKNBy045lQmbr16nrANS9ci9nWLHzNFr
   Dlxzm39DCuezS3/gM9FTc6K2lugtD7oi0e4spV+cwz/g/l9xoP0iLaaxP
   eKq6qD1qIDCI/YkxWd9vGdvNIEYmjUuPGpBj56zoulxeema+DFzGAVnIG
   vQnr7U7x6oW8pSm49Vp5TpmV+oqBaVa3ha08hkoUARaDbxGHgLHkelP8K
   khYvWc6m1xX86VjANGCJpPNOGFKrh4sVti6fdhxdJW6heaw7UP3kA7Xa/
   g==;
X-CSE-ConnectionGUID: SlyqXBMdQ1C4MzyJOfa08g==
X-CSE-MsgGUID: MOXzexV7RkWfEuN/C29L0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="56575363"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="56575363"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 12:02:25 -0700
X-CSE-ConnectionGUID: BDBqnvVLRGax8P1auIGkbw==
X-CSE-MsgGUID: 4//0GnkBQAqqKq1ZKBWI7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; 
   d="scan'208";a="135554744"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 12:02:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:02:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:02:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPbmZS92Yr298oj4LZ+5bpAWi4PFgFNjZq3RgisAowYqrex9fACIHpWjYno7/YhZDu6o+Y0E3wm7L6QnOt7X/KnfUy2v8Wc1YHbZEPsrxgohIMdlvBXLNP71ZTU4pORdf0qDlaQql7ZNyilnXWH8gWPLRv5W1HZLWr5UGHXLDP5N0gaYuMWvhGwP17l0vrZwXcMC9+zzYr5sV13Qsc01fm0hwySlyNUodeUktslWc9SulixZmNGeHOrw0cW865ONpFjfpkWZaQupbU2SiuetosYYMhMsZHvO3bmamajwwNztGsK0AAcT25BcxgqfLN5hkKo6tNbHxBdmwk270rdYTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rNR2Agn8BsGXX8x7T6/TpHhs7BEJsiFDEEfXjmfL9t8=;
 b=sa7JgJ9jS6vW8qgfNG3GuKJJ3C6A9X4bOTPJmb9Mt5OA1SitSZtxev1RqPmuD1Vo6Fz/ZJylGgkDDoaJ9bpwrnkQclxSxgQxcu6s4Y6PNF/nUVlZpw1LSDXQxd5eU35LyQ/CwouJMCIaqokIZ41bvdmEQTfMcEyc94g6FFKa6m5R1LyiKeg5947Wo2TViBQUX2sAc42OyaYST7qJyX6mKFTc/vNVoZcG2SCCo4VKT/GazBf6B2hm4U+sE/hg3iVn0YeHWE28MTubMg64bPZZXUIttRqf3Bk+MLsQzFMWqGl6YFktZ+lkaLOknga0Hg2scYZT49+Zphd0zCmzyLyiqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB7794.namprd11.prod.outlook.com (2603:10b6:610:125::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Wed, 16 Apr
 2025 19:02:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Wed, 16 Apr 2025
 19:02:16 +0000
Message-ID: <da854bef-a69a-4d61-bae6-3e6aa51a8081@intel.com>
Date: Wed, 16 Apr 2025 12:02:12 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 14/26] x86/resctrl: Add the functionality to assign
 MBM events
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <22889d46484b2393d701ce83c82f253c1454216b.1743725907.git.babu.moger@amd.com>
 <59fbd325-04e8-459f-a724-ae0c4536b1a5@intel.com>
 <3d31259c-cac0-4b96-883c-6d2e8e427988@amd.com>
 <efa7aee8-d1f3-4d15-9a6e-09b19c296e47@intel.com>
 <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b8ad6ebd-405e-4ce9-99ed-1658c3b94f73@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0289.namprd04.prod.outlook.com
 (2603:10b6:303:89::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB7794:EE_
X-MS-Office365-Filtering-Correlation-Id: 21139037-0059-4085-af9e-08dd7d19343e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T1J6MUEwck5iaXp2VDRaa3FTVWFKay9LQ3dCSHRBYjBHeWdHUEV4MklUM0Nr?=
 =?utf-8?B?czltdDlKeTNXb21ycndkZ1ptcW9hWDREVldtREkxajk0L2dBRURBVGZEbnpW?=
 =?utf-8?B?eEFRT2VYV2JTNnBOZDUxM0lYZUZaV3dSTmRUeFppcVJ3ZzdCNExVck12VnVG?=
 =?utf-8?B?QXVlTnpvOWcxOHRZR0pQQnpzT05QWldySjZNQjdQYzJZSGQ0WVBidThxN3Vr?=
 =?utf-8?B?Z0hRUnphd05DUVV1Z0dPRjFlekh4V0lNbnFORzh4SE9tYmdhK3ltaysrYkRR?=
 =?utf-8?B?M3NqbGZ5bnFhcit4bkJXV25BTUJvdk5PcEdKZTBkUTJoRXRIYmFVZUpuWjVk?=
 =?utf-8?B?R0lsNUtTeU85OG10bmlSbFBGRXpXdnlRWk5EWU1jSExYZmFQR3cwTnFoUXU4?=
 =?utf-8?B?Zi8veUpDdXRzRzUyOG5OMkVRV3V1eldINnFYVC83SzFwTU9MTUQraFpQZkFQ?=
 =?utf-8?B?UWlTUzR4ay9yaWczTXF3QTNoMmNSM1FUZDlBNjR3Z1RGN1d2VVdmYnpOR20x?=
 =?utf-8?B?a0VsUktLRkRDRGJuYjFqZXZRbk1tQis0NEpxVlhWeGJscElFcWtiQ1V0VHNh?=
 =?utf-8?B?ZzhXR2dwamRYN0RKV2EycjAyWmJLTEg5ZXh0Q0FBQ0ZnK2lpNC9OSkE2TzJQ?=
 =?utf-8?B?TGJ3ZkRWd2drNjhEblZaL0lXVkt3Ni9Vd0tJdk9mcDdZRmg2Vy9PYXRpT1BX?=
 =?utf-8?B?b2RmUEg5M0U2aFNIaHdzRWFtNmwwRkF4UmpKM3owb3UvNGt1K3JTeTNyV1ha?=
 =?utf-8?B?Q1IwQjdLUnoydVd1dU02WEZlOFo0SXBBUG9CcmZ4UmdlcStZOEFSZE94SkJh?=
 =?utf-8?B?QkZKVzl0Y0xibzhjQWZNdlp2a1RQOVJKbzNhaGFhUXJ5TkF1Ym9WdlV4Zllm?=
 =?utf-8?B?TTdnWHdBL3ByZE9VM3pzclhrVWpVWW9UMWpOaDllTnhEcnhtbWNPc2lOVWRE?=
 =?utf-8?B?WitYS2hJNm1nMjBoN1VJV0FUQ05TNjB0b3hJVm5yRG9YMXBDRWdVbjRNbWh2?=
 =?utf-8?B?NTlhTzRuWS9mNUpHYk92UWI0M0RKQStaLzYyWTdJL2dNdUVzYXhUa2JqcDRs?=
 =?utf-8?B?bUxJcHJYMUpqWnUvd2hCbi84TW40SHREdGd4YlRxV1Z6UlFkdFZxdVVQT2di?=
 =?utf-8?B?eTZidllCa1FCT0xXdnZoejVrVlhWUVVNTmEyQXk2dU9EbC9MS3lRcjBDRGVL?=
 =?utf-8?B?Y3QvNXdSVm92RFA2ZDUzRjJKelZreCt2V2lXQzNRbHVFbEh1VHBnR3hEQmRo?=
 =?utf-8?B?RnowZFRrV2RKbHE5aVM2aldhV0hXeEF3WXQ2ODhCNHRhVkVsZTZ1T3RIM3lC?=
 =?utf-8?B?WEpDTWYrY2NDbVZPWVQ5VGhJb08raXNUZEhYNm1tQmhXRzBxVCtHYURlTGNj?=
 =?utf-8?B?bDAzWmg3NklMOTFZcFErWm1zZWNCWHdqSHIralV4QU1YWFNmUkNBYy84RWtT?=
 =?utf-8?B?ZDR5emx6aXhXS2QyOGltNXBlY2tRSys5ZlNJSExSbk1oUWlGVkF0WkdHb2Rn?=
 =?utf-8?B?Q0c5UjRHeS9pQllKWW9ZektmS2tUbXB6N21hZjhsUFphQUtaMjdpaEJ0djd5?=
 =?utf-8?B?SXVqczJPRlArWExjNVRTcmVvOEpwVEt0SEcyVUI4VGY5bmZZK29JMGJmd1BO?=
 =?utf-8?B?aGhmbzhBQnFhSjlWc0NyKzhWUE9VRy8yQllodk5kaSswb2VYejZUWnROeG5J?=
 =?utf-8?B?YWhQbHl5bTAzLzRDZXg0S05PUEl6ODNkRFFBR1pRKzVUV3dRZkdIVkcrYUpl?=
 =?utf-8?B?R0pFWVpjMEFGOXVIMEhHeW9wblByQjJqNXpBZHRib1pVL1FmSlFTVzdUN3Y4?=
 =?utf-8?B?N1pST2VLNW9sWkJLZ25OVUIzZ043SnB0WWpLdUxZRHlaeXQ4T2FhQjRpVFJu?=
 =?utf-8?B?UkowVVRoR2MrcTRqTEJmdWVMZ0JsakJvSmYveTIrclcwTUorV1J3NEtteWNS?=
 =?utf-8?Q?dn1B8RIIsqc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STRTNkpZWjloRnRNV2RuSDZBSnpUZm9keGlIYS9PVk9QbHByUkx6OStrbEZE?=
 =?utf-8?B?VTNrZ280djVDSTJLM0F0dWlCMit6N1kwVGFlNjNpRkFFZlZZdUdMc1o5a3JD?=
 =?utf-8?B?bVFzandYSWJmOEhwQlVFL2pyOWRkWFNCWk51c3Q0R0NFazVOZm9CY1hQeFZU?=
 =?utf-8?B?bW5SdVdyQTYwQnRNNmJwaE9ueVZEODhGS0hsb2RvNkFhV2hZdEJ6eUx6Ungy?=
 =?utf-8?B?NGdvVmxSUXdiQ3crZnRDZ0lJM3pSQjYrMFRMcXNwaUVDZG91bC9jQ1AvL1N0?=
 =?utf-8?B?dUhTa0ZpNEVSQkw3ZzdUZXE1SWpQTTN4V3hwWTVHdy9qbjJzN1lOajhCbU1w?=
 =?utf-8?B?QzA0eDVnSnRuQ0tDc0lUM3p5WlZIcm1hbVFwSVZtb1RHcVBMWnBjQWlmM2Nv?=
 =?utf-8?B?V2J4Mk5GdXRKMnBHbDBZcHp3V3llOVFvVzV4NEtmUTMvWmZxclhBd2lJUk1R?=
 =?utf-8?B?WUlaU1ZaMXByalVmK2F4MGhCVkk5ZnpWQ3ZiU0hKczFIREQ2OVp6QWF6YXIw?=
 =?utf-8?B?REJMQ2ZycXZ5U1RsaDlkWXNwK3l4RHRCU2kwRFllTFZnVFl4TUFCbHE4b0JN?=
 =?utf-8?B?V3NKcXVCQ1kweXZhTjdKTzFmT0hHd0FRcUl6dXR3UUowTUQrNW5iMEtZY211?=
 =?utf-8?B?MVd5ZmJhTHlXVGs0ODY0WW9GTnVVMyt0M3ZUYVVhVTk1STNGWnRlQ3hyVHVW?=
 =?utf-8?B?WThKU0dhbVU4SGxMcmtMN2xzaHBBRUdIUG5uL2V1T3NmVk5DQldsZUE2OFA3?=
 =?utf-8?B?K2Q2WVJmNDNwd2V5ZFN1Y0NIR0dpTGg3RVdITEFjbDFhekVrVTEzM1Ivc2tP?=
 =?utf-8?B?cXhPUkhKdWg3ZWpoV1lYZmNpWDdqTHVlWHpDV0JBVDJJeEUwdUdJRnJuQjhu?=
 =?utf-8?B?Z3dpL0dRRjNQcFozWjhTeitQV1NNSk4rWXlocG1SU1d4NmNCT1BTN2hxVzNv?=
 =?utf-8?B?NzgydWd5eFVjeHMrWnVPNmhPTXd1a05JZTBZcEVzWXpRdEwvWXlzeEZMNXZq?=
 =?utf-8?B?dCtsSldLdlNTRXFiU1VBeDhUNHducFhKZStLellkZm13dERKRDBwZFVxSEtK?=
 =?utf-8?B?UWw4Z01hY1VrT05YZStvZndmMWNkd0ZCeUx1NVBzdU1ybmxyd0RpUXNJL2FF?=
 =?utf-8?B?L3FodjJFYUhSZE9XRjQvMHpZSmk1RnB6WVZTUGdBMWMwT3V6N0NkTm41cXlU?=
 =?utf-8?B?VkFLN2VJUnUzdEVqbUljeHVRTHNZQllxVzVtU3N1Y2ZUR2hUTGJsMFBERXJx?=
 =?utf-8?B?UjU0blYvaHFQL2dEVWkxMEFYQ2lZbVVoUjB0K0UvTzNpaXAwL1JpbGJ0bjVD?=
 =?utf-8?B?QWROMHE4dTdIeUJWL1pWT2JPdkVyaTVZcDduanBId3ZHalI4TUowY2owY2JQ?=
 =?utf-8?B?UTBhVmRKZG5DWWxTSUZBSVlqTnkyRVgzOVlUU2xLTVpmTTRlSXJTOVFaU2Ev?=
 =?utf-8?B?YkxqbWxINktTemlKZjA5cUFTczVtdXBVV0toSmtCQ1p1KzU5aXJDNzAxM3NY?=
 =?utf-8?B?ZjdPbi9XTWJkWlJxRSt3SUtzRExCQ1lPNzcxVjhzdjFmOGYxQXpkM21mUzFx?=
 =?utf-8?B?a2pTakZBVzdEdEp5UldsNmlnYjVXVmM0eFZRYUdUSSszT2JmWXNSNks5dDE1?=
 =?utf-8?B?SDNVdnNSbWwzeStMK3Q1eVRPZUQwR2p1S202NG9BU1lmRUxrVktBcVFwMkxs?=
 =?utf-8?B?b2xESm9ZNGswdGZVWWE2WDVmU3VzRm44WlZ0RHMwNllaeWMxRlpsakNLSVAr?=
 =?utf-8?B?MGl3WUNNdkQrWUFBQmIzbUVQQnBsdFFoL3pURkgzalZGckRqQ2dRZW5nUGNv?=
 =?utf-8?B?OXB2bERjQ0k1MFpWVC9qaC9iRUdBS2hWSXVMQ0dNNEZIRlB1VXNPaEhuakFP?=
 =?utf-8?B?ejh0Rlp4b1poZTZCN2pPdS8rMDk4S2cyaWNGcHd5cktCUklrdk9hdnhtSUVY?=
 =?utf-8?B?UEVXRmd1czdUN2dkM2lYVUJ5VWRuSjhSZVlsSzE0M1BRdlhNTkFwRE1yQmtm?=
 =?utf-8?B?R2VtUFUrUXFDYUVFMzhZZmV6aTUvV0VjWTQreWEydEpiS1JxakkyaVlZa1RP?=
 =?utf-8?B?UzRMZ0RNZXJJbmxYUlY3aHYwaXdIQlRpQzJUK080RjV6Y3JReUR4dGVNdHJs?=
 =?utf-8?B?QmtUbE9KOVNBYTdFeDllQldxaTh4cVZXKzU1TTJHR2pGUC9yVGttbHpSRGZk?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21139037-0059-4085-af9e-08dd7d19343e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:02:16.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mra111mJS5g422yjPw+eS31Tj8TFSwzT5Yxfpfx/SBaXtmA3TWuemvl7sCsLuHqBVEnkfjBpFl6Nl75ASvZ2t1mXPECBuJhrK5N6OnGzXX0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7794
X-OriginatorOrg: intel.com

Hi Babu,

On 4/16/25 10:09 AM, Moger, Babu wrote:
> On 4/15/25 11:53, Reinette Chatre wrote:
>> On 4/15/25 7:20 AM, Moger, Babu wrote:
>>> On 4/11/25 16:04, Reinette Chatre wrote:
>>>> On 4/3/25 5:18 PM, Babu Moger wrote:
>>>>> The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
>>>>> can be assigned to an RMID, event pair and monitor the bandwidth as long
>>>>> as it is assigned.
>>>>
>>>> Above makes it sound as though multiple counters can be assigned to
>>>> an RMID, event pair.
>>>>
>>>
>>> Yes. Multiple counter-ids can be assigned to RMID, event pair.
>>
>> oh, are you referring to the assignments of different counters across multiple
>> domains?
> 
> May be I am confusing you here. This is what I meant.
> 
> Here is one example.
> 
> In a same group,

"same group" means single RMID, eg. RMID_A

>   Configure cntr_id 0, to count reads only (This maps to total event).

This will be one event, event0, so one counter assigned to RMID_A, event0 pair.

>   Configure cntr_id 1, to count write only (This maps to local event).

... event1, one counter assigned to RMID_A, event1 pair, ...

>   Configure cntr_id 2, to count dirty victims.

... event2, one counter assigned to RMID_A, event2 pair, ...

>   so on..
>   so on..
>   Configure cntr_id 31, to count remote read only.

... and event31, one counter assigned to RMID_A, event31 pair.

The example reflects that a *single* counter can be assigned to an RMID, event pair.

Considering above, perhaps changelog can start with something like:
	mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters that
        can be assigned to RMID, event pairs ....

> 
> We have 32 counter ids in a domain. Basically, we can configure all the
> counters in a domain to just one group if you want to.

Understood.


> 
> We cannot do that right now because our data structures cannot do that.
> We can only configure 2 events(local and total) right now.
> 
> My understanding it is same with MPAM also.

Reinette

