Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B715A2144D5
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120906; cv=fail; b=vApx5Mq6m/mJTNitVEE413x23+5ii8LXRxlJFnsgxcg5sVu0i0u0P2o+nHdwt4nMr9WJOplKr3sFovcFIqB0zEhQF3IfpBIWp0sRG/hLa2SfkF8DRyp692DtQ6eTL+v1+7UyKz7ceF+ZyqMcLSiyycY1yuwm8+UpPrmsdLXi9ws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120906; c=relaxed/simple;
	bh=RPA8zfyKfE1NYND2yAqrWb6x3WuBNTi8wkFCbIIjOCE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sm0ANPeF5n/4dxK7fOWwzBqnlZaFjMlP7GbBvqSdzTwLNEDozbtWScDOc+l+HMX7CN+nkwOTawn+0Yb9L4D8Isw2f9SzhayeA8kKmzPf/67dJ5FnYoP61bm0H8KQx/bhRgZzwZoDRtBh4aaLCXjV7HnqcGOqwWGjDmw0OUooheQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khkw44ez; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khkw44ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746120905; x=1777656905;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RPA8zfyKfE1NYND2yAqrWb6x3WuBNTi8wkFCbIIjOCE=;
  b=khkw44ezB9sOwtILfA/Ql0Osq3rjXFiWTlGNl9ohblKQmD7lhFU/48nd
   Y95/qOD0NE4HlpN0TcPHCWCasWLo7lS/1Qkifw9tLPUbWb/WTlbhJUl7Y
   bGrGPJgq2jeziZrBZWUM8V86ECKGjbNLSU6YkfGC14m/tNFrIjJngsf9k
   AxgEcN43RebBUKA7KF/Bdtq1VgKtLyAgWey5sEyumi1g7rD03xdF3A9un
   6QX0l8rg/wOUyZGV/sAmH+VeavyLMdwSAQ9XxS86YIyUN/3ScjOtJE/jA
   MDxMBtDNdZkbwe/I5DTWuhW1piQ3CsaGGpvaHIdqSVn4wq6PdWXQ1Rkap
   w==;
X-CSE-ConnectionGUID: sZSU6o/STzivXTfF8QAXSA==
X-CSE-MsgGUID: hdzAmh+4RMCarlRHkqSmZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59186361"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59186361"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:35:04 -0700
X-CSE-ConnectionGUID: T+dawWKFRF6zo7wpwB7lPg==
X-CSE-MsgGUID: ctrgpGRXRMKfey2cmAGvgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="165361666"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:35:04 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:35:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:35:03 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:35:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uJlbdtCBjQanSQ0je14CO9+3EIlWES4BQvUBtfDLVMTdJZMoVL2zKEFI+GVeOtS0PNmdd1JU5+rrFrQeqkibcI9EHkk/Gfz61VRIomOD0BLdkmnlSyVTPJ3r7/8mwRIjLae/aQNZJOnbdnJrqN9H86l48NBQQkxvjRFMwx7AtYm/cNuQwdvpCv7HrY02Yz2AJplL0Pk+TGa1dpcqhbHOgQdEAW4QsSZ8HAMLfD7NEpwAyTMEQ0DsearkkxTb2tiDgcNK+9+stS53E5TRGO0aWIDbG0FMkE5b8bNRF6UbnHBKSN6m187hf6RcV56WxZ/UnCt4Q8OLjrOyInZEog3NNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xnSL32+KD+PLEKQWzsAg045/NViUoh8YugIAe7Aa7Zw=;
 b=t0S71Bvj3NVViCCgI/KooCVrlp2BfLujneGM08p9641+OKdFXuIzFrSmsSVVlnbvPrpva9oaythjnyQzstXTBDeEa9H9RBStunvKhzkWjc0onZDS8S3oVnBJfwJQVwZGL4Wvy7NWDKbnTnoUc0mx1bstIArlyxAdOFp3yhRmMypJaPDay2LYJSQMMBJrE3OgdwfB6lUMN2JJMKIHfE4o4lnqPBcT5jK3kZgLRRjRABS1ZaHdWwy0oRt046nvlCCvQbKxfzUtPYWAb3akT7a4exO0Bl2HYA7DE+FQrIydXyDipyh0OnzIU4oYyYxu8okiHk/7k8HeHNtHjo8Zy0y34Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB6705.namprd11.prod.outlook.com (2603:10b6:510:1c4::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 17:34:56 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:34:55 +0000
Message-ID: <d1a7a6dd-2fe0-44bb-b945-2fa88b688b6d@intel.com>
Date: Thu, 1 May 2025 10:34:53 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 24/27] fs/resctrl: Remove unnecessary includes
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-25-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-25-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0363.namprd04.prod.outlook.com
 (2603:10b6:303:81::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB6705:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c50d112-7f8a-4361-47a9-08dd88d67ceb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFRsQlFMTjFHQ0o2TjdGT1NINGFwTzlzMTEycWQxMHZQbW9oOHFIWjlDS1RJ?=
 =?utf-8?B?N04xcWFEZ3lrQXVadE5lbXFoSTJxTzZpSFR3NGhKWmFXTHdWbTF0MC9Oc25U?=
 =?utf-8?B?Zk16MUVyRC80SVNFaVVrMXJ2Yml6RWMyU0lPc3pMTGxlR3VXa2RNZEhjUmE1?=
 =?utf-8?B?MDR3eG9RUEhxT0x1VzBlb1I0ZjlZN01OZythVkpJdzRGd1VRUzg1d3JsRFVx?=
 =?utf-8?B?d0tWRHIxK0NmdTc0bE1BUlpxalFzc2NWSDNtbWZvRTZrY2svZVVMc0J2aDFH?=
 =?utf-8?B?NEowNmIzbEFxbWc3SjNqeUFXLzNGWmxZVEh0eGdKTmllQTR2UDBYZS84WVdF?=
 =?utf-8?B?Ni9jZzVMMjloQ3ZpTGxtMk5yZVg3WS9zQkloS0VqYVI5TzZQVkxVc0ZURDBN?=
 =?utf-8?B?L1dVUEJCTlM3R244bGFYN1djQnVGTHJZdkFHTXlFQVJ5U0NRZkdyMFM5WDdu?=
 =?utf-8?B?N1VDWEdWWkZmc2RwWmI0Ykoxb2NoZVZxeVMyM2Mza2FucjUxc3NKczBVUnd5?=
 =?utf-8?B?dlppeGd4dmVaYlVEbndIVGdDbGU0TjhkL2VRYitOZmZ2Qy92T2p6R1ZJMmFH?=
 =?utf-8?B?QzNWajB4bys3SURIUVQwZFFPNFU2RTBaTTRqM1Q0RktiL2Myc1JQYXhiNno5?=
 =?utf-8?B?cGdBTnVEWUpZSjUveXVMN294SzN3MUFNa1ZENDc1UGZCdEdWd24xbUFodzdm?=
 =?utf-8?B?RGhRWENBVXlZSGdFMERlVVhtVFcwaXczaFB0YUdMSmhrbGM3RGEwS0hmMFhh?=
 =?utf-8?B?RVNxcEExcm5lNWlTN2E2cDZaRFdNMVFTQ2xCL1BtYWpiTUhnRVJ5NytubFRI?=
 =?utf-8?B?MWdXWEFzRXR0aEZTY0tYcGVEd2d1blBwV0V4SlBxRDdIN29TNFRJY1pxQUdv?=
 =?utf-8?B?TnpVY2l4WE10aVhseU1LN2lWOHFRRm9mMi9pclZ2S1ZQWFZ3dkJoenBjSm40?=
 =?utf-8?B?N3Q0V09TOWRFMnRzYXVLOGYrWWJSSFcxd1F4OUpCclFXcU5acEcxM2FLSFE3?=
 =?utf-8?B?QlpWZHZaM2VZdjJOWDBWcXZZTjMzNU0rWmwrOVU2c3V6cmtjT1p3R1VkY3ho?=
 =?utf-8?B?L1BIQVRNcjJwTzZEZXowWXQ3YUJoZllBbnhBeS9DTkw0NGYrbDBqalh3YzNX?=
 =?utf-8?B?N3RRVGNIQTRrend5SHNVVUpabC9XUGdweHozd0JHNnAxR2FiZTJ5VjVFeHJq?=
 =?utf-8?B?dXV1b2Uxa0RRN0VhN3NkYlllSGZ4dGdNMDk1Unhva1hmRVdrVDVEQWQxN2sr?=
 =?utf-8?B?KzVhUnBmNTZKQzhrSVN2WmFqMFFyNGprOG9VbDcyYnRudmdpblhaZkVqSzhH?=
 =?utf-8?B?TlBOdU1uRWhDU0NzWkhkc1FLMFVsSUlkblJsQmJsWXBlYTJRY3B3VkU2QWpO?=
 =?utf-8?B?SUQrRGZsL2RXWU90QmREMUROTmp2VjMrUFQ3YXEwSzZ4cGN5anQ3c2tacHBz?=
 =?utf-8?B?VGRSR0JKNFVsMWEvZ3VRbllLcUl0dDhMa3I2RE1FVEVGcys2Ni95dGNUZlor?=
 =?utf-8?B?NEVZSXNZaE11VHlnRzV5b21MckhhRG16Nm0wdjJSeTdmcUtNNFVHaUVBU1h3?=
 =?utf-8?B?RlNBUm1aUnlZWTRSVnA1UEFRYlB2UXFqRUJXYUhaWTJ1NEJEaW5vdit1T1kz?=
 =?utf-8?B?bVJoa1Z0Ri9yb05UUXZhTHIyNzFJNkdETk5STzFhSkRtUDF2Vk1rMjdtQ05w?=
 =?utf-8?B?c0kyeUgyUEdXR2tOa1FLbEhHR0l0T3VDZWhRakVEdkNrOCt4cUZXcDl3d2dn?=
 =?utf-8?B?cWFlNkQxM1BlSzlYMEhIQ05EL1hHdXpsVGp3QWt6OVplOTA4WHV5NXMwMHRF?=
 =?utf-8?B?azhFelBWcGlVVmF4eUhycnRBMEx3clpJL1ZsUlN3NFZSK2hkT0xIOWtLaGdJ?=
 =?utf-8?B?djc5NW9UOUdXZXNsb0p1K093bCs4TXZBUVJsR0lsbVhQMFVIRytZU3pvOXpJ?=
 =?utf-8?Q?F2cCxiD1ppE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dlFBQ3l0VnZSYm9mU3VISmY0QmZ6aWpCT2FCc3FIRk4rODZGSmQrek90aW1D?=
 =?utf-8?B?RzBEc3QxR25Pa0pRem85TjQ5QVpSYTJ5L0VUTGw2WFhQTXZJWlV6T2FIZUlm?=
 =?utf-8?B?eG8zNUF4OUI5Zk80NHFhWVR3KzdsOHhOQnk4RC9FZURYcjBVQXh2QjBpQ3pU?=
 =?utf-8?B?ZVlJTUczdmU4bnRONERDRnVIeUM3NkVwSlZOSWFQWVFUM2Y2VUR5cEFPalRx?=
 =?utf-8?B?YmVvOXhaSkpXeW1mczUxWFNkUDFwbTlYbFlzcEJTc0ZVSDdlcmRjVlNYM1g3?=
 =?utf-8?B?SXBtOFI1aXhpeG11bnlBKy9GSCtOcE1hWmVnQ3ZFS3BKRThCdFZVRFdZdzhE?=
 =?utf-8?B?SzVTSnEwOGhPam9WWkNnSlVhOTVXVlJhUTNsMmxoMnZ1RFk0WXQxZzljMzhV?=
 =?utf-8?B?cTVGV0pYamJnK0pXSWpVWFp4aFhoQ1pTTEVJTjZabm5NYWhwOEM4a0p6RGRG?=
 =?utf-8?B?TlJuSTE4NExwU3NqV0tIWEgxdGR0T1V5ZytpZGlyeFQ1ZUNodG9ncHpwd2Vx?=
 =?utf-8?B?dXRoRWU0Tldnek81cExFU3NrYlI0SUhhaEp1ekJuOHVYMjdvaW53bys0OGtJ?=
 =?utf-8?B?NGJub3c5VUtWUW1FQlljelFPU2p4YkNCSjdKM1JGZGc2SzRGbGlZbWhjVldN?=
 =?utf-8?B?VmNMeDFFaGlCeGlvakJGejRLeC9KVmwrb2h0U2V3am9PV0FuNVhtdDVMbk9y?=
 =?utf-8?B?Tm5ZRkZnV2F6NFI0STQ2VlAzYWZHUTI0MXk1dlZjMUw4Z0xYTUhYWTM3SkFE?=
 =?utf-8?B?SEE0NkMrUnNlVVA3dTQ0MVdzWWVtRG53TEVVZjdNOFZUUzRCenplLy8xVmQy?=
 =?utf-8?B?QnhNbXYzRXJoSjZiN3drSDR6a1p4czdKZDUrWjVSclFQS3RTY3BYcDRHbFlK?=
 =?utf-8?B?NklQY3NKMGg3S0tUczlqWUlwbTFuTTA5YWRNSytqS1pTNVJIL1V6T2c4R2Ru?=
 =?utf-8?B?bk45ajY5dnQ2U1VKOWZQVXVSVENkRTc1dDg4dGQyMHFBUG92UUE1NmkzMjZZ?=
 =?utf-8?B?bDR5bmNITXhsaGVNUTVYVFBxNlVINUVZSTRBdHRqU2FmN2lkUmZ0UjBoL21x?=
 =?utf-8?B?WlN4SEF2YTFSdjJkNmJna1VIL0NUMVEvdEpwK2FidHo1N0Vmaytvekw5Smcv?=
 =?utf-8?B?SFlTVyswbE14SUZ1OFNlM2RaNHIxNXg2K0N5Y2J4YmI2QzhyaDNsb0VtMFly?=
 =?utf-8?B?dkROWlFLQlZSSWwxRjQ3Mnpkb1pVSGNBT1N6NEduSTAvUGFFRUV6M2I2MFVl?=
 =?utf-8?B?MUVidlhDZ1lUL2Q5ckVnS01wQzUrSEEzU25FWEx5bG9DQkxScGxlNTVmdm1z?=
 =?utf-8?B?YkV0MDdSV0pDd2hJeVRVVVNGZi91UEF1aElTcUx3UXRHNm1BV2daZmZzdDhW?=
 =?utf-8?B?OFRnYUFGdXcxbEZOLzFRdEVPaXZvNzVQR1liRXd2cWlSNEZqTW1DVGlGZ1hW?=
 =?utf-8?B?SXhldjJZcHJZWEhjaStPeHVYUVBLK1hZZEw5MVBLdlBpVndYakJ6VjlGUWlr?=
 =?utf-8?B?MSsxL1lBQWxTS2h4emNaTHBod1hSa0FEZ2p1ZFF6cWVJeWdNM0w1bzZWU3Ix?=
 =?utf-8?B?eW1WU2J2Z3hWWUhzWnZoOHQwQ2JBM2cralErQkJIV1FFL3I0Q0VTSlJLOEpt?=
 =?utf-8?B?SGNUMnZWd3B3aTFXNGpoTUhHRDRTc05PWnlnUzlPUmt0NzFqRVdLeGxTR1BS?=
 =?utf-8?B?SUFGeitqVnNrQ20zdmZsbGxoK0xHQ3k0dDE1bnBUYkg0cXZjNXhmeVNmRUZK?=
 =?utf-8?B?UnRNNm5vQmY3UFR2L1pEUVZtMTZTYTdOYnp1KzhZaytPNGVDTExBVU4zTHZH?=
 =?utf-8?B?ZTV2NkR1d25DdVNJZUZWK2NJTi9zS0RrUHl4UHNMdEpYdWRPQlg2UnRCSks4?=
 =?utf-8?B?TDdqYnhLOVB3ZjlXV3psR3ExSEtobmloY3dpNUZULzdsZmp4UVFSZ1g5dXh0?=
 =?utf-8?B?Z1Y5NzRjUjRmMXZiMU1kb0xBV0VFcXUxM3E3ZVJkMVJ5WEdXaDNFZVY3VEtT?=
 =?utf-8?B?VGVpYytYWlBsL1FHUHdwNUwvM1lETGIyVjY0MXRNclpZb2ZxYWsyS3o1eXFR?=
 =?utf-8?B?N08yQ2h3c2dlOURrOE8yV2ZFKzZOTWVrL0tTNXBURWNya3UyQldEemUvaUtH?=
 =?utf-8?B?NHlYYU0wN3VzVGd2am9XM09sWk41VjZXZXR3WStNUEVia3dmWCtXRG13Zyt0?=
 =?utf-8?B?SVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c50d112-7f8a-4361-47a9-08dd88d67ceb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:34:55.8196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kAKf6UH6N4Kv6JKathRElwgBAYLPbre/KX1TnE6nPFa4PlMMOuR6XrYbnmVa14evdILCjL+eI4al9uq4m81Jh/a92c6C4ERBUPABgGbxX8U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6705
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:38 AM, James Morse wrote:
> When splitting and moving the resctrl code to live in fs/resctrl and
> arch/x86, some code was duplicated. This was done to keep the parser
> in the script that does the moving simple. This results in unnecessary
> includes in the arch and filesystem code.
> 
> Remove them.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> 
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette

