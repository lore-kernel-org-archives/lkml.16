Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F7511185
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 17:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746119243; cv=fail; b=lnVtILZQVyDpejcCwnQdpRo7/Uddv3ea5Vpy5/8n30IWIPUgkjIgFUbx+1oywAxJ7HNzq3JqXWCAi5IJDiurlPCnAtOmGYnuXhte76bVjirprWyLvDLawlZpFScpOkediZl/S0/ucU8TCp1kCzgO+f6Up/8xTGEcwbFXPvaC33w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746119243; c=relaxed/simple;
	bh=w69jDuS9icgPMccyXibrS/DzkLe6f5mUn8+V/jvjzxQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oJEl22XDftlJWh53uZbYq84Hq7BkN04Wjwr1UPnpS89ZmLHxg+ilZvzzhhsyzaHS7AaYj5ygK0/65ffWyON+C3Xr69wT6pF0TLMImNLhfa3dLQbPU6xd+5KIMxwMJD7EjGSgGVOGzzAnGjUIH/jb7XKIjTrQimSNasMXLrQNxjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcMbPhOz; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcMbPhOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746119242; x=1777655242;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=w69jDuS9icgPMccyXibrS/DzkLe6f5mUn8+V/jvjzxQ=;
  b=UcMbPhOzGSeiHMfbB8R1TEtqRKR+AlgHoCmo9FM5C5vu+AFYpdS9lSAo
   W8YiNIAuG26dCVh8vt+Fcv4NiPF83Mgg1qwu+jbqefXu5PTohwimWdFYd
   yMGHKavcCNC3AjNWKez73m/v4aAeGQp3raof5THQEwdMUFVeTNpdAb6c0
   5Q5d9nihZWvE7nShDpBVsE1H+cCL2nJiuVhkoiSC4iSyKJwkZrVTXPZpU
   JD205yPECe7LrtK6BaktrIHA04MR/A5YQFJxwFj8cVsiFO6M/BhGqKGvH
   uu45E2iVB1bFwtLPmkZSE2k19hEm8Fnr0YVN4u1eHsN82NRnx4jjd94gb
   w==;
X-CSE-ConnectionGUID: doePEe20Ra+sTt2JGn9JIg==
X-CSE-MsgGUID: /NYgMM0uS+e/LQfXMBZ2Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47938819"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="47938819"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:07:22 -0700
X-CSE-ConnectionGUID: Aq8BabdIRIaydSjfCbbRNA==
X-CSE-MsgGUID: /ubBj959SgW7z/zhokJRrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="139238203"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 10:07:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 10:07:19 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 10:07:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 10:07:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P9IqCZEuyR3dnspVqRJfD5eY7+knqB7+lSeovmcH3m24SRRpQ+scfUSyWk3NkhXyoUngt46KSfLTeSf99qL11jGtBJchoYGcrN8ycxIR0VkIL24cTRfQ0TDqAHVN60SIgl0j+QwVc1Z2T0Et4jiriDO3Op/rJf3fVzmiXXKtULbzN7EBuPuLQtGL9kmDF2t/HqnXionijVx+lW3ltrUaVTliylcr1CimB3zU2pPv3LlplLPhrmdTkDADz1KSwpwWBH4H41nY1NYQgoA3Mt1UkgHClCpApSb2wzyL5E3gBuSmiRTucJi0OuvaHmWikd8PgpbBibzQ+WLHGlz8K6fniQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYRzRZZJgeOkjuJfSXef/1MZHJv9cJSHrFM2MFyHOM0=;
 b=LDTpYc3OcMyUzDuRm26Sx9k5SXruLMxcwvfqa55dckVn9N7vgq1fSH0GgGuE+VK44hiltln9Wzi8vOOrJOlYUbpup1H/JoEr6dpxJ4PPnxIvqwl+P9tDTUjWuJmJhSWINOct9Ud/U8rvdLTrMAUugWWMDqHQAc+3n6EitPgzUSTzvdn3rlYZfQVsv2mwxNg6iMTjtOVYywKXC0kq9F+RisvpzuXCzncEDQOsdxpu6GVLDyZjc9ZcSmct5Ez97Snkl80vIRz+rkjFUOoynsCmcfLc3Ty3pU0HKRwgREV162BTIR9NMA4H8tlq2rC1aXhjhr5rn9x4AQ0OeA/Kor/K9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH3PPF7A88A980A.namprd11.prod.outlook.com (2603:10b6:518:1::d32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 1 May
 2025 17:07:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Thu, 1 May 2025
 17:07:16 +0000
Message-ID: <16b943a2-3a5b-49cf-ad5b-03d81f412463@intel.com>
Date: Thu, 1 May 2025 10:07:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/27] x86/resctrl: Add 'resctrl' to the title of the
 resctrl documentation
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
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Reinette Chatre
	<reinette.chartre@intel.com>
References: <20250425173809.5529-1-james.morse@arm.com>
 <20250425173809.5529-11-james.morse@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20250425173809.5529-11-james.morse@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:303:b6::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH3PPF7A88A980A:EE_
X-MS-Office365-Filtering-Correlation-Id: a8120b40-0a4a-48c7-27ec-08dd88d29f94
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTk4cnN6MVVFM1pBblllTXpjcUZSekQydUYxVzVqclV0d0R4OEFuSjYrdXpm?=
 =?utf-8?B?WDd6VFg0bEVkY09ZSEk5N2o3eDN2alhjbHlHV3ZKSmIrbGVsVURycFhaS2ZO?=
 =?utf-8?B?aVFGVzNrQ0FVdy83Y1doNmdiNElSTlFIK0dyNXNJdkxPMXloRXl5RWd0QnJY?=
 =?utf-8?B?RUVubkkrbGJpWFkxZzMwUEVpWk9QeTZhQVdOeTZRZDBGWDNHQ0hqVFpMM2Zy?=
 =?utf-8?B?bXhhR1JCYS85bWZBREs2bzQ3OU5tS0JvSjhtUG04TTNrUUk2dWZlemF3WmIx?=
 =?utf-8?B?cFV0cDBacW5aa2Z2RFNBckdWTmlSZit2cGJnUzBIK2tiMzhHSEtGVWRCY0Jh?=
 =?utf-8?B?WmoyL2VLb2xWWHp2Y2RiRVRrSVZ4WTdBMjZrdnFVZ2pFb3d3UjBaaUdlOXVQ?=
 =?utf-8?B?cG5XUnZ6WEhmOFlaQjMzTmI2Q1pPWDdaRVllNWpZYWsvL05iV3UyWmtpRkI2?=
 =?utf-8?B?SWFlSXFuWnU5VldwK1B1RUlJNlZocjlHdGlDSllxTU9NdHBQWDIwdFIwbXlS?=
 =?utf-8?B?WGNISnd4N0lHQk5UZExUYnhweUNOOVJydFRuTk5VOHV5dFpGUFJoVlNHV28z?=
 =?utf-8?B?b1QybWhPT2RORW1NVmtUTXI2RnFDbjJTWEFkSk4yL2FFd1ZHblZwQ05XejBk?=
 =?utf-8?B?SzhkUmJPem1DZWpnTDh5TlRqNVRQU2tPVnU4NjJwakdNNnBpYVBMTEJEV1Fx?=
 =?utf-8?B?dDl2eitHU2ZWR0xCdzlpbGR3SU1iL2k5SzJ5RER2UjhpVHdOaWMvaVN3aDlz?=
 =?utf-8?B?RkxTdDlvMVhTREF0aEx4VjlIalp2VmFnMzBlWjVYakVCYlFKK2VIQldGLzcr?=
 =?utf-8?B?TVZycE9TbU5CeUNXL3I2VS9yeWxzdkFYWmFpSVNSTG1QQmxhUlNqaFhBb09P?=
 =?utf-8?B?YmhjMFNqZitOYk5UOHdldmVFVEhHYkZHUFJEL3BWdnlQVDIxdGdzMUF5bmFo?=
 =?utf-8?B?WGk3blBhaEoyL1FndHhoV1orc2k4QlFzVHlUbTlUQXo4Z2FldElzWm5yRHFJ?=
 =?utf-8?B?R0hlY3NOUTY4SnJFa1dNV3NrWkVxVDZLN1NRdjJnZ3hGMEdTYTZRdTJZSFZu?=
 =?utf-8?B?YmhRT1owK1p3ZVM5Uno4c0tDamozanFpNnNhQkxPODVrblhzOThyWm1GeStm?=
 =?utf-8?B?NXhCc2cyeHV0QlJMU1Q4RE5UWXowME1lZkowOGxtVkhqWjA2RE1yNVEwQmdK?=
 =?utf-8?B?RG9SbUllbHBhRHdPUXl6bDhMYlZYTDg3UEtsUUtZUW1iWG42TzViOUVSRkRr?=
 =?utf-8?B?Z3c5TitpQldFdlZMKzhHZjF5cG1PMkt5NENQNlBTNEVxTmMzaWlZdFgyWldk?=
 =?utf-8?B?SHpoV2NvYzQ0UUFrOUxyM2MzU2ZBQzZuWTdhSUpwcnV3ZTNFbHAzdTh6ei9X?=
 =?utf-8?B?eHQyTWtVSTVldnROYnh4eWZscDNZdXdzV1NvUEp2QWQ1WStTMDR3ckVSUDYw?=
 =?utf-8?B?QXpQQ3VXRExXc0FWNU9veWswdUQyR2FMM2d2dDNhMFlUc1M5VWVDTDJJQnFk?=
 =?utf-8?B?TGluM1ZJRGtGUUt0VTh4UmZpUFVrbCt1d09hd1hYemgvazNWTUZ4ZHVSYXo0?=
 =?utf-8?B?dDJLNG5YNFpaTzNOYVczZFJYekswdnRVNnRBZWJvRllOUnhPQ0JRUEYrSDVk?=
 =?utf-8?B?eTcxOCt0MzZlcUNQSXgrUnJNaTlsWEVtcGVCWS9NV3RPZ2RSL1NubjlxMVdO?=
 =?utf-8?B?M1UvTndxWVRjc3VLeEx5ZXQ2Qll5dDh6MFlNK3JuRk5vd1NHQnRUL3JQOEhk?=
 =?utf-8?B?akFYaVJ2SHFGU3hiRW1EOHlmZ1huNEZkTnFoT2R4RWtYQkZHRzBHYUpHbjlM?=
 =?utf-8?B?a1lyVldRdkRFMnZEKzVaNFp2SEZLbXhnMkxvVXpOcC9OZHR3MnJNY0g0NTgr?=
 =?utf-8?B?T2NPZWNJeUs5YlZZZ1NaTVlVcW9BckIyVGp6dlBGRTUvaVZVT0REdWowSkZq?=
 =?utf-8?Q?juUqKi8WwEw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0VVZFJ3K1BJYTVIUC9ZTHo4eEhSVkVZVGNBbjYxc3pPbm8vVDI0V0JwMkJy?=
 =?utf-8?B?YkxKc2V3dFFKbnFSSHI4aTVQZ2N5SWUxaG1PQ3k4OTlIWUFuV1F3bnlKbGV0?=
 =?utf-8?B?RmVKUVREamN5MWQwWU5YTkdGZDhZU1NveVdYbnh4dEZzc1VBZ2NYUUNTRjNG?=
 =?utf-8?B?Zi95aURCTzU2WmdGMytVU0RGQk1GaG5jREpuanUvTjV6UmsySHdrWUc5L003?=
 =?utf-8?B?TGNIdnVsUCtJTE1tU3liNzNKQjFQRklkNmFLbU9LOGlQWjFWSTlLWDIvSTFz?=
 =?utf-8?B?ZXNOUms4L3A4SUV6U3dnVWp0VGNCajE0WGt6Tk5CNzd4eldEOHkyVmtDTTBK?=
 =?utf-8?B?N1BrcjJGMVFLL2VIait2bGZ1dzh1cmx6Q3puejdpYTlDcHhFMlBlTmJOcWVG?=
 =?utf-8?B?SXJRZ29QY0JCbzBySERjTG93NnRYVG1lSEQ2Q05vbHEzMnd6amhZVnY5K0Yv?=
 =?utf-8?B?SnIxcFgzQW1QajA3aXZGWTNZUjdKcWw2QThLMUFISlJ5cmhCVVJHeWNYMER4?=
 =?utf-8?B?UThvZXNSN3dZQjZSV1dWKzkyUDErSEpGck03cHhJSWhCOGlsaHVsckc3b0Yy?=
 =?utf-8?B?bWhLemdQemszbyszYnp2L0hCNjJTcVVsVWZHTmova2R5amZ4Qy96V3dKYVJz?=
 =?utf-8?B?TW0yemJaYVB1eFJMWDhaV21aak5zRk1JZUJvaTVJaE5oL1AvQVJUazRFWjQr?=
 =?utf-8?B?TS95ZDJZbkpOS3Fabytoa01wTE9JcUpZUGE3dzl4YTJBZi9kQUdBTGR0bWs4?=
 =?utf-8?B?SWlKakxTbnVyeFpxYlM5WW95Z1VqR1FGKytrN1ZZVitxamFHaUp2QzBIR2Ur?=
 =?utf-8?B?UklISzdLMlNzNDMrU1pQcTV3Y0N1K2tnV0NsS2hLVlBiVmZuQmFWYUpYYnZZ?=
 =?utf-8?B?WVU2eW5ZUkZoZ0dCcmdGclN1NTVrMWo4NEhoSkhpSi82eUU2ZkhkN0JhSkJa?=
 =?utf-8?B?YXBVOVUvNUZYbFdWT2E1dy9QZU9kb2VvVUFxdnpYYkZMMkMzWjdQSWVkbktK?=
 =?utf-8?B?WGU4bVZPYllIalA1d3AzTUM4TTV6V05VL1RGQ0l6cXIrdXcyR09lUmJPd0Fh?=
 =?utf-8?B?a0gxR3M5aDBoMVgreEhVUm04bnVKNFdmR05qT3BNR1NLVHRkc3k2OVJQZU5R?=
 =?utf-8?B?am16aU16ckU5bjF3SUx5L09QcTQ5d2RsVkgvZi90TnJGdUFiRlFxYXJ1VDZ3?=
 =?utf-8?B?aE4wc2o5aVpTMjZCYTQzVVBzeGpkMndhc1BTNUk2SkxOcm5teUlicUtDeG9E?=
 =?utf-8?B?cy9ZZlEzd2E4VWp4THlZTXI1R2phc2F1Q2czd1BXSkVXcHhGSGRpdmdsUGRE?=
 =?utf-8?B?L3kwOHpjTnNHQ0hZZXFIK1dOK1FhOEJDTWkrRldyQTRTQnR5dDhDQmFUWmtD?=
 =?utf-8?B?MVBhTUxLdHh1dU5xdVA3VEppMmI3R1VPNFNVOWcreUNTTVZtQzlmdlpPMGg5?=
 =?utf-8?B?Zi9BemJQWjlXeUs0aUtySi9hditmeElxTEZlNHVpRWZCZmZYMldiaGJpbDkv?=
 =?utf-8?B?T1RZVXBiMy92REV5bWpkUDFDT1FZQkFwSlNidExubWJNY2FpSEd0cnBwa3VE?=
 =?utf-8?B?ZVZ1eWV1NEVqUE9MMXRPd0VyUnJ4cWJ0cmN6MHhXeTVCajNWczZOL0J2K2Ew?=
 =?utf-8?B?U0djUzdJdDVRMm4rYU94cHJDZUZ0Unk5UzZZYlphQUNwNjVaU0NmT0FLVTRI?=
 =?utf-8?B?V0hxcXNuRmFwMFhhU3dJc09kejhBTytoMFJQcW1uY3F2ZDJCeDk3K2J2OGQy?=
 =?utf-8?B?RkxFeUgyUG8rUXJ3Nlp0ektjUktMVU1TdVFnc1d5b0dxQ3BvQjZPeGJVSmJR?=
 =?utf-8?B?dDJkMFFmTFA2b1h4VXQ5c3lsNnkzTFhGcWdJVHdnbGF4OUVXaWpSbXlPV1NI?=
 =?utf-8?B?aTNqY2NOb1MxdEdqaFJ2Z3lLbnVSM1ZpbFN4TCs1UTlOTkcyczlkeVMwME5P?=
 =?utf-8?B?dmRNTG9qK1hLUkp5MlppUjdzNHNqZlBUQ1V2azVrSU43RDNyVWlBakhqUEEz?=
 =?utf-8?B?TFNQenJYMmVsK05jQys1LzNDRGhQUy9JOTdBZUtOUXpoajhUMkhLaGVBOVFE?=
 =?utf-8?B?VTBHcCtmZm5kdjRvQm51ZmJpSUp4WG5LNldjcy83aElEeWhuNzJLUWk3b09K?=
 =?utf-8?B?SXduQlhaM2w1UVMvRHJTYXVFR25TU2wzU1VPb3NZeFdxdkh2Q0xUR1NMbFdw?=
 =?utf-8?B?cVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a8120b40-0a4a-48c7-27ec-08dd88d29f94
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 17:07:16.0509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: enYaneMpUxl66dDbyMCwY8o0KPdbHUwT2eoXB/06EPWyQfbYtc5tvebNosFJL4Ex9qGSZFsHu9b+CMiH8OnpJDxxTZ8INtbpjxBMljpxZw8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF7A88A980A
X-OriginatorOrg: intel.com

Hi James,

On 4/25/25 10:37 AM, James Morse wrote:
> The resctrl documentation is titled "User Interface for Resource Control
> feature".
> 
> Once the documentation follows the code in a move to the filesystem, this
> appears in the list of filesystems, but doesn't contain the name of the
> filesystem, making it hard to find.
> 
> Add 'resctrl' to the title.
> 

Thank you.

> Suggeted-by: Reinette Chatre <reinette.chartre@intel.com>

Suggested-by: Reinette Chatre <reinette.chatre@intel.com

> Signed-off-by: James Morse <james.morse@arm.com>
> ---

With typos fixed.

| Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
