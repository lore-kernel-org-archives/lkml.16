Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CF18C00;
	Tue, 24 Jun 2025 21:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800649; cv=fail; b=Z+GKsKdMY7fJe0xi76h/kBNdggthOcsWCuSO7km7rl5EOCCyELhdxlch38XZ9cE8jDSwUxKJ4I3465OA/CH6kS334A6pQLNIdB1hvseZnVclNbDp8Ncx21noldUni2cUvVnnoLAr/qDDPJhPn6jBEDpT5DSxmkMtBa3G62DlSBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800649; c=relaxed/simple;
	bh=5dq58xtMuNbLetlPLGg6Yo0W7sVjZ83vHWKR12Na0OU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UHtGYkkAAZHsqp/oouon31TpU6gHeCv+8sPPU/5rNpmWU0ibTQNpE5F2IjwSGnBfECqoaJZZ8biMEz2/owJyBNwJGrqmKu3mhQ3P4gCF5sTUX/m57tJeYkovKJVMWv5jdpbBqRtKTKstlCxN0M3RlJipQaJS52F1g/VsHeD/FQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTEU/D1+; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTEU/D1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800648; x=1782336648;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5dq58xtMuNbLetlPLGg6Yo0W7sVjZ83vHWKR12Na0OU=;
  b=LTEU/D1+x54S5E67tA296CQsi4aSJf/4sfL9WvSDmrLKcArhhQlQlr0x
   WsbLEVgY2NlIIpdMWMfUYDTwZhWY1Ym2hkx00yxHZzbVvj+WAaqPe7UfJ
   qTn/Oa3yYG+ydTt4jqNRjdzo3zFSp+Fz8mUMEr+e3REdSxaIp7d9c8YNc
   8GadmR7KayRFctFjnPfgLtYoD7flvLH7vgCWt+6uebC4uFfwU457WIWvb
   D2GgkqUSkE2DDFoH8x27k+2QBUdbS/eDBEbwFcYcGnaV/Yvo1XAcBZjPU
   1HP4SGI4Gdw60kfk/V6HzKX8ju9pDwOHGmJfNhkrco+IvstKzF8pPAUPB
   Q==;
X-CSE-ConnectionGUID: RCiQIDpIQ5ugD1ucleTBTw==
X-CSE-MsgGUID: kMm2KifxTyWkcuqg9ncx+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53193114"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53193114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:30:47 -0700
X-CSE-ConnectionGUID: nd3Mpi6VQF+HW7lOcZupdw==
X-CSE-MsgGUID: yAz7ATT9RQCwrQk3MWT1SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157524044"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:30:46 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:30:45 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:30:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.77) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:30:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RnYJS9086BJMzTZfrbWE2Sco4welT3rFDVrnlCIuAoM6sbt72OA1HhFUfrhbjZVMxMjjPraOFQQyluYX14rvqgkcutv/w4xHU1lQ5S8bHdNOWywi1ysn7i+UJhukKvyRp9Uw+ltyuilJNsHshqJ3DM3lMm1wrX4hg0Xp/XVzO91L4Qj8RAvWPbTBjKUwqreiA2znfYyix4oxU6BAHI3lqIYCUfVTlB4Ogtb4Zrb/HB+EjEjcdn06e29FdQpr3GsWycJFGv5zb0eXvNJT3okq+ldmcNxNke0xVmotBJmC3Vawn0rqA6PItTV50CSktGoCw0EsZb+i0huPTiinsf/E0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odK6Y6Q5eBrp1KSM+XxDtYd+uKPar5I5YFf1g0+8T6g=;
 b=fHL/Yn0nslH4kbQEXaGPA9bTY0IDyUZ8Y8W0N4P67UH+zdcOmnxbWH63ymmZIuZMoGf6flDDvVI+5yKVxnfwUQMVI45XyPBUxLLLR4tz0li7bFpw7NQWWvsY4uTMI6yaqn1TNqjN9dh9o8f83cPzaHFdw+UfnWT67s1Bx0dNBboS987LXtC7tTYFrDBNkbMyaJ64+jGwZyAbwodfBDcg3HEuI3AbRr+lUF+0LoOCCFg3Samjvypbq7s2xt5GVGxpBrtTRh3i3c3NKy8pl35jfcEjzVNY6yVAhuZrffg040FlVTl6ERqMEHbOR4BbhVPXuF/i8CNWvSyEZB392PWDRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 21:30:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:30:39 +0000
Message-ID: <b761e6ec-a874-4d06-8437-a3a717a91abb@intel.com>
Date: Tue, 24 Jun 2025 14:30:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 05/32] x86,fs/resctrl: Prepare for more monitor events
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rostedt@goodmis.org>, <paulmck@kernel.org>, <thuth@redhat.com>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>, <seanjc@google.com>,
	<thomas.lendacky@amd.com>, <pawan.kumar.gupta@linux.intel.com>,
	<manali.shukla@amd.com>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<peterz@infradead.org>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<mario.limonciello@amd.com>, <xin3.li@intel.com>, <gautham.shenoy@amd.com>,
	<xin@zytor.com>, <chang.seok.bae@intel.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1749848714.git.babu.moger@amd.com>
 <d68c3abf7cd91381a0d8f75f562da149ddf44011.1749848714.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d68c3abf7cd91381a0d8f75f562da149ddf44011.1749848714.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::23) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: d4294ac9-5773-476d-a76c-08ddb3665d99
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2tlbG5uTjBGbGg3YVhWUTdIM3RQMTk3RG9Gb0tkOHBkUUJobGp5RWVmcm1u?=
 =?utf-8?B?UGl2QitLOUs2SFM4QnJHTzRnckdpS3J0VGRITzB4K2RqYW4rVk5MZHVCVldD?=
 =?utf-8?B?a2pIdkxHT05lQmVtS1F6UFM2ZkFkK0k2SWR6cnEzeXhGM3Jnd01KM3BVc3V6?=
 =?utf-8?B?bGp5bXpXVEdQT0l3bHhvMUd3dUV3a2pxQ0FzemZRMGRYekpDcmlLbXpsRUly?=
 =?utf-8?B?UXd2VHFQamVvRlZuRUtxeWRhWkhqUElNbU01WXczeE9kWDgzM1cwVkdWczN2?=
 =?utf-8?B?M0FNVldBSTQ0S0sxNWpDSmpXRDBsOG0vd2tXY3Q4dXJvSWNzbnVyK2diTis2?=
 =?utf-8?B?bWhvZysrNDYwdFQvWG1tTUxvVFJqL3NmR2pDOVVSclV3dGFvWUhPNno0c0hx?=
 =?utf-8?B?ODJONGxrMEd2Vis3REY0ZklxRGZnL1Vjcy85bHduUlpaT1IwVThvQXpBdGRa?=
 =?utf-8?B?WWcyV2xGdFB5QlZkb0dQemlCMDZweVk5NkkzdFAybmhpdTJMVTFNM3NLMkR0?=
 =?utf-8?B?QUFvdllvbzFJcS9lMlE1QktwN2tRbW8zSWpKR1VPZnRIT0g1U2MwaS83S0JJ?=
 =?utf-8?B?Sk1Qck9XNUdNT0syOUZGbzk2aGcrQ1o4UTgrUHh1THk2SUtaWEJRSElkSGRZ?=
 =?utf-8?B?dnBKVzBXdk1lbEpFL3B0TzVyckxpaTBZZWQ3eDhZZmdQTzVSSVhKSzhCWGFR?=
 =?utf-8?B?emEzM3FtdVBvbVd6TStBNEdMa0tkZjV0aFZ4SFBsWC91aTZrUlRVQUU4YWhK?=
 =?utf-8?B?L3JLNGZieTl3Zi9GRVV1WjVnaGNmNzY3c1FUVVRvT2pQNGJHUkVYSVowQXdE?=
 =?utf-8?B?WTM5a0RUNFdGQnJEckNYQy9wQ2x5KzI5WElLSU9sWkFJZGtGYldJalZDZXJ6?=
 =?utf-8?B?Sm04R3NwelRTUHFzZmxRcEFzUW9ZQjRkYVQ0aGkwM1dZM0FJdWJ1OTEwWUg2?=
 =?utf-8?B?MDJ3LzJHWlpDWGFIOVVsZ29ZLzhtTHBLeUd1VUJIRm9YampUVXRjT1NvRGND?=
 =?utf-8?B?OU5oazhPTkVaa1o1RlNUZ1FpdnFvTDhoMmVKbEFUWE1oM0d2UDVnb2RjYncz?=
 =?utf-8?B?UjZCdjFVZSs3YXRrU05WamgwZjRYNkJwTkVEUTN0UHNydW5FNjBWVEVYYlBk?=
 =?utf-8?B?SWV6UXRNU3JSOS9wYms4U0lCUXZsTXRHNmpaNWFNeE5VYmpIcmZDZG1lNmg1?=
 =?utf-8?B?QW1MK3RaOTBSR1ZvR09lRGx6UGtZTTBPYk1Vb28wRkkweHlYbFljOTA5b3k4?=
 =?utf-8?B?R1U1a3RNbktzbzNyWHpzUEhaVDV5Q2JIUmdoMmNCUGlqMmVPcTczRC9nd1I3?=
 =?utf-8?B?OHMyeEpJVG05OWJUeVZha2U3VDBDZE9jdkhPVmV2REQ0ZXRCcVI4SzRBRm82?=
 =?utf-8?B?LzNYZVZFY3hacUk2R1FwUmtUdjNtTk5qYmNSOGN5blNySmVRL3U2UjM4d3lI?=
 =?utf-8?B?dGthZ2RBTHh1Y3p3RmJCZXRjalRxU1lqSjZRdXRGeEJuNllvN2g4WnlWdmVQ?=
 =?utf-8?B?UG95ZnpoU2w0VWVZcndaNDgwR2dRaDBhMkduVm1aUCtKSUF5Mm9ldWVOdjQ2?=
 =?utf-8?B?TXRYSWlJRnhOTlJhUWJwOXhTZGVBb1k3cFBDN1hGdHJsc1kwNkdZOHpLTTBV?=
 =?utf-8?B?ay9CUkxLZnJxQVYxK1NuVHd5UG9iS3ZYaDc2RUJVYytqVFhWSEMwekJVaE03?=
 =?utf-8?B?UFRHME4xd2cwcSsxUC9aeEZTSUNRWmQ4cE1LOXVKMW1vdU5vTVlLc25aMDVB?=
 =?utf-8?B?V3lYM0lvcDl1V0k2dk8rMHpSTmNsbVU3Q0JRZUxTY05DYzlGODZ4Z2Qyd08w?=
 =?utf-8?B?OCtaelRoUnJ5UHFZQXVvRzZsYzRrZ0ZPUDNBRHBGb2tvcm5GTWhVUXZqdEFj?=
 =?utf-8?B?MjlaV0JIWlE0ZTVOdTdYTmR2U3BYWjdaTUd0NjdWallRbG1vRWtOanA3YTh3?=
 =?utf-8?Q?sBjElcWRsi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFdORlljQTc5clRCMVUrd0RnZlVySHA2dXZmZmtISFRQbWZFdDB4d0dKU3JR?=
 =?utf-8?B?dUNOVEFMQUZyVWdlYW0yc2l4dStGcnI3ZUVjQ29FUVVtZDBNZ1JMMDA4eVA2?=
 =?utf-8?B?Sm1JZC9mWjJKUDRMM0JBUms2QXNITUZqdUFLWEoyRmx5K05IRUg0QWZtSmFo?=
 =?utf-8?B?emszc2Z4MHRKQk5qbllJSzI5RUN6bWxXTHVOZTRRVCt5citFWi9ubVROZ0U0?=
 =?utf-8?B?dzBESm80QUtuNE1kMExxYlQyc2tnM24wRDd5UU9lbVp5YXMydDlGbVYyRnNp?=
 =?utf-8?B?eFUyNlRSZFdUVmFUbDJpa2hwRGZDYmRFbFhXdC9DekJzZm9SeEs3SnJVUW1Q?=
 =?utf-8?B?MTdESjlMVURPWS8zcDVmeHMzU2l6UU8xa1I2M1BtMUllYTF5bFFqQWJkTFEv?=
 =?utf-8?B?TDIzRVRudzR6ZjNBR1JYdTdjTHJiYTlyVnE4aHRXN0RXeTJ0NS8yUHZ0WFhI?=
 =?utf-8?B?TXMxeGhHcjNxTVpQYTduMnBSK2M0bzVTZXBFTXJpZ3Q2TG5ETG9QdTlwOVNW?=
 =?utf-8?B?dGd6VndrbW9pKzZVdkR1eVpGc0FIMUNEM3I1UHpvckUrL2duTFU3Qmg0MkV5?=
 =?utf-8?B?QWZDM1R4NzZNMStPaEpNRzIyVmswSWl6MUUzYlFKYTFNZkxsYkJPMktCUDBB?=
 =?utf-8?B?UUdnc1hwTi9UMWVzcmdXRE1kUzhUZ3d2QVZINGF0enpRUmlJMktyc0pYSUdM?=
 =?utf-8?B?UXY1WE9qVG5vUHp6OFAxRXA1VWtXM0V6Mkc1OGJBNmZRamV4TjJKTENGRGpW?=
 =?utf-8?B?bXh5clFFUDJPYVdod1UxVXppSXEyeTdMdm00MmJHbmhUTUYwdE8rT2JQdjVp?=
 =?utf-8?B?NklNMkphK2NpdUt0YjBxZmFkRVpnSlJVY2hVb1BPT21URWlHQzRsUVlKRjcy?=
 =?utf-8?B?Z2NMU1BLOGhMSGlLZ3JINTE3S1Q1NG1xY0dRVWtaaHhWWlZsUWVrMUpFSTdo?=
 =?utf-8?B?Q09tWWkzOXJvY0FBSzZ2NUxjd3ByRHY1eVU4Z0hBWk14U1ZkSytQVDlqekpm?=
 =?utf-8?B?RHd5MXFyc01aQUxQUjhiSmVJV09nVDNLd0J2TS9vWE9QVHcwTTNTdTFVK3FN?=
 =?utf-8?B?Ty9sNkJOU1h6Q1hSckpHTFhOcFdNVy96eUlRNWVEVlpoVWJHajI2OFVtWHFs?=
 =?utf-8?B?MzZKQUoxdkg0S3JZQkdsTXR6ZXhjWGdDdjkrY3ZGU1JoTXlVaTNKcEF0cDI4?=
 =?utf-8?B?NDVhTzdtNE1jN2JQdEtTbGNtV1hLUEk1ZWYxNlB6TDhTeWF4SUZ2aDhaQXB5?=
 =?utf-8?B?VEdSUnJ2MnpyeU9oNFlOK20zVzZIRmVqei93MzVSS3JrWmNqMnF3YlJoQXNS?=
 =?utf-8?B?UEc4bWJGWHZjeVNnckZTU1o2QlF2UkpjQ29kUk1oOTd0SFgvZmlIT2d6Zysz?=
 =?utf-8?B?cm1PZlk2SEZjTFBjQitlWFBHdWpmdUttSDJoUHZMbWRjQkRNZnFyTFFuQUU0?=
 =?utf-8?B?SGpsZG1zNTFYMXpxNGpkRklXZWVueGVwSFdoRUZvUWNxeFQxZzErcnJMWkUr?=
 =?utf-8?B?YklEM1MxQTFja2c4ZXRQR0RNK04yMlhrSS9UK1VpM2d0THV6UzJUc0Uza1p0?=
 =?utf-8?B?elZIQmIwdWVyc0pPcEo2Z2NEQ2pIK1NxeHlRSytPWmVBMWdQTWdQNlBMS050?=
 =?utf-8?B?bjVqV2dEQmp6K2czbGhtR1lUSjVwQUJYQW9MWStydkREdHkzaVorSWJIbUkw?=
 =?utf-8?B?MlhhVm8vcDRKcnBhY0lmUVhwbmJjZS9ZU3hxQnF4a1IrSkdrT3RYNDErQ3o2?=
 =?utf-8?B?dHMzZUdoRFNKd3UrZ241VFJ5WGNGMUpqejVWQlBSSi9ubXc3V2JZdDJDT2dP?=
 =?utf-8?B?L2V1MlJqSUFWeE9JMENhcFpQbUlmWjFFZVNGSW5uMUcxWVE1bmo5M095SVc5?=
 =?utf-8?B?OS91alM5cE9lUlVoczlzeHh4cTZCbHZ5b0QyMlNHZEQ5K24yOTV5Rzl0a3N1?=
 =?utf-8?B?Z2dUQ3F3eG5CZ2crdVkrWi8vTXA5VDhpcS9ZSVN1VjVGYXkzSmI0U3NGRlNX?=
 =?utf-8?B?bUFqcjhaUjNQMHVhbXRVT1pvVElocmx1UllPUWR1SEJsb016bGFLQkxFM2h1?=
 =?utf-8?B?Tk5kb0ZPTzZ1bVlZZU4ya2VGQVVVQVlTdkpVMHJ4RDRQRjRPV09Ld0gxTDUy?=
 =?utf-8?B?UkptRi9iYXdCK3VoOUJPRnpQdjdLcUV4OXAzbVQ4aEhIL0swOHhucGFVd1Y3?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d4294ac9-5773-476d-a76c-08ddb3665d99
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:30:39.6717
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTImKj9aRJ1+WPzWdblpFpIeIVzNgG/xDPTSK+dnh+bYsFvZAVJH2DZFcLxkh2koNTmcEd14zxBBBs9D+kFjOO3rGYsOES1GpKEQr/XhcTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
X-OriginatorOrg: intel.com

Hi Babu/Tony,

On 6/13/25 2:04 PM, Babu Moger wrote:
> From: Tony Luck <tony.luck@intel.com>

...

> @@ -400,25 +400,27 @@ static int domain_setup_ctrlval(struct rdt_resource *r, struct rdt_ctrl_domain *
>   */
>  static int arch_domain_mbm_alloc(u32 num_rmid, struct rdt_hw_mon_domain *hw_dom)
>  {
> -	size_t tsize;
> -
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
> -		tsize = sizeof(*hw_dom->arch_mbm_total);
> -		hw_dom->arch_mbm_total = kcalloc(num_rmid, tsize, GFP_KERNEL);
> -		if (!hw_dom->arch_mbm_total)
> -			return -ENOMEM;
> -	}
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
> -		tsize = sizeof(*hw_dom->arch_mbm_local);
> -		hw_dom->arch_mbm_local = kcalloc(num_rmid, tsize, GFP_KERNEL);
> -		if (!hw_dom->arch_mbm_local) {
> -			kfree(hw_dom->arch_mbm_total);
> -			hw_dom->arch_mbm_total = NULL;
> -			return -ENOMEM;
> -		}
> +	size_t tsize = sizeof(*hw_dom->arch_mbm_states[0]);
> +	enum resctrl_event_id eventid;
> +	int idx;
> +
> +	for_each_mbm_event_id(eventid) {
> +		if (!resctrl_is_mon_event_enabled(eventid))
> +			continue;
> +		idx = MBM_STATE_IDX(eventid);
> +		hw_dom->arch_mbm_states[idx] = kcalloc(num_rmid, tsize, GFP_KERNEL);
> +		if (!hw_dom->arch_mbm_states[idx])
> +			goto cleanup;
>  	}
>  
>  	return 0;
> +cleanup:
> +	while (--idx >= 0) {

(please see note about this pattern below)

> +		kfree(hw_dom->arch_mbm_states[idx]);
> +		hw_dom->arch_mbm_states[idx] = NULL;
> +	}
> +
> +	return -ENOMEM;
>  }
>  
>  static int get_domain_id_from_scope(int cpu, enum resctrl_scope scope)
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index 5e3c41b36437..44ef0d94131e 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -54,15 +54,16 @@ struct rdt_hw_ctrl_domain {
>   * struct rdt_hw_mon_domain - Arch private attributes of a set of CPUs that share
>   *			      a resource for a monitor function
>   * @d_resctrl:	Properties exposed to the resctrl file system
> - * @arch_mbm_total:	arch private state for MBM total bandwidth
> - * @arch_mbm_local:	arch private state for MBM local bandwidth
> + * @arch_mbm_states:	arch private state for each MBM event

Duplicate @arch_mbm_states

> + * @arch_mbm_states:	Per-event pointer to the MBM event's saved state.
> + *			An MBM event's state is an array of struct arch_mbm_state
> + *			indexed by RMID on x86 or combined CLOSID, RMID on Arm.

The "or combined CLOSID, RMID on Arm" can be dropped from the x86 arch specific
docs.

>   *
>   * Members of this structure are accessed via helpers that provide abstraction.
>   */
>  struct rdt_hw_mon_domain {
>  	struct rdt_mon_domain		d_resctrl;
> -	struct arch_mbm_state		*arch_mbm_total;
> -	struct arch_mbm_state		*arch_mbm_local;
> +	struct arch_mbm_state		*arch_mbm_states[QOS_NUM_L3_MBM_EVENTS];
>  };
>  
>  static inline struct rdt_hw_ctrl_domain *resctrl_to_arch_ctrl_dom(struct rdt_ctrl_domain *r)
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 07f8ab097cbe..0add57b29a4d 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -161,18 +161,14 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
>  						 u32 rmid,
>  						 enum resctrl_event_id eventid)
>  {
> -	switch (eventid) {
> -	case QOS_L3_OCCUP_EVENT_ID:
> -		return NULL;
> -	case QOS_L3_MBM_TOTAL_EVENT_ID:
> -		return &hw_dom->arch_mbm_total[rmid];
> -	case QOS_L3_MBM_LOCAL_EVENT_ID:
> -		return &hw_dom->arch_mbm_local[rmid];
> -	default:
> -		/* Never expect to get here */
> -		WARN_ON_ONCE(1);
> +	struct arch_mbm_state *state;
> +
> +	if (!resctrl_is_mbm_event(eventid))
>  		return NULL;
> -	}
> +
> +	state = hw_dom->arch_mbm_states[MBM_STATE_IDX(eventid)];
> +
> +	return state ? &state[rmid] : NULL;
>  }
>  
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
> @@ -201,14 +197,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>  void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d)
>  {
>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> -
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> -		memset(hw_dom->arch_mbm_total, 0,
> -		       sizeof(*hw_dom->arch_mbm_total) * r->num_rmid);
> -
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID))
> -		memset(hw_dom->arch_mbm_local, 0,
> -		       sizeof(*hw_dom->arch_mbm_local) * r->num_rmid);
> +	enum resctrl_event_id eventid;
> +	int idx;
> +
> +	for_each_mbm_event_id(eventid) {
> +		if (!resctrl_is_mon_event_enabled(eventid))
> +			continue;
> +		idx = MBM_STATE_IDX(eventid);
> +		memset(hw_dom->arch_mbm_states[idx], 0,
> +		       sizeof(struct arch_mbm_state) * r->num_rmid);

sizeof(struct arch_mbm_state) -> sizeof(*hw_dom->arch_mbm_states[0])?

> +	}
>  }
>  
>  static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)


...

>  void resctrl_offline_ctrl_domain(struct rdt_resource *r, struct rdt_ctrl_domain *d)
> @@ -4085,32 +4081,34 @@ void resctrl_offline_mon_domain(struct rdt_resource *r, struct rdt_mon_domain *d
>  static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain *d)
>  {
>  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> -	size_t tsize;
> +	size_t tsize = sizeof(*d->mbm_states[0]);
> +	enum resctrl_event_id eventid;
> +	int idx;
>  
>  	if (resctrl_is_mon_event_enabled(QOS_L3_OCCUP_EVENT_ID)) {
>  		d->rmid_busy_llc = bitmap_zalloc(idx_limit, GFP_KERNEL);
>  		if (!d->rmid_busy_llc)
>  			return -ENOMEM;
>  	}
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID)) {
> -		tsize = sizeof(*d->mbm_total);
> -		d->mbm_total = kcalloc(idx_limit, tsize, GFP_KERNEL);
> -		if (!d->mbm_total) {
> -			bitmap_free(d->rmid_busy_llc);
> -			return -ENOMEM;
> -		}
> -	}
> -	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_LOCAL_EVENT_ID)) {
> -		tsize = sizeof(*d->mbm_local);
> -		d->mbm_local = kcalloc(idx_limit, tsize, GFP_KERNEL);
> -		if (!d->mbm_local) {
> -			bitmap_free(d->rmid_busy_llc);
> -			kfree(d->mbm_total);
> -			return -ENOMEM;
> -		}
> +
> +	for_each_mbm_event_id(eventid) {
> +		if (!resctrl_is_mon_event_enabled(eventid))
> +			continue;
> +		idx = MBM_STATE_IDX(eventid);
> +		d->mbm_states[idx] = kcalloc(idx_limit, tsize, GFP_KERNEL);
> +		if (!d->mbm_states[idx])
> +			goto cleanup;
>  	}

Looks like this cleanup pattern is a landmine that this
series stepped on in patch #13. Any code added here that fails
and then run the "cleanup" code will either end up with a memory
leak or accessing an uninitialized variable. 
>  
>  	return 0;
> +cleanup:
> +	bitmap_free(d->rmid_busy_llc);
> +	while (--idx >= 0) {
> +		kfree(d->mbm_states[idx]);
> +		d->mbm_states[idx] = NULL;
> +	}

This pattern should be made safer by not relying on idx, or
ensure here that idx is initialized correctly.

> +
> +	return -ENOMEM;
>  }
>  

Reinette

