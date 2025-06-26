Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29E81E521D;
	Thu, 26 Jun 2025 18:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750960950; cv=fail; b=UuDXkC6K3LjzpBqI4ji5IIQtD8YNx8nrzzeoBWUBmSm4q8Z2fqZdzfZ0rv4Q1lBJn6qA1YEHWhEYxlHzDH2R/wWij4cuU/RI43P2rZLmoCBD+JHh4ZaIC7q8jc+iR3s8Z0hBzYFcsYg1stlrHH5+tiyYVXVQR7rKY/ghCKJu0MM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750960950; c=relaxed/simple;
	bh=tTtbaB54cROnfk3x/HCEu8FU5qiHicQnOKPGKCcY3Hs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uhbdn7nji/Ea+2cgQpJ21Hs51/m6Al86V5Xf7RKFAl6xb1XOJwXODgt3YhjYB7KuWHC9ZAXDkkO01k87p8FUI+63O1pgYltKW50v/Lj84nk1aOvclKWCnnFs/yYZVTH0a+P5XDa+wGq5GzLBeIhaRmYRie0UY0xz/0Xs0Fh+afY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cL15sdNb; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cL15sdNb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750960949; x=1782496949;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tTtbaB54cROnfk3x/HCEu8FU5qiHicQnOKPGKCcY3Hs=;
  b=cL15sdNbsYwuYKl4WS+z3pRlGo6pnXnUxZU/1WGmK4OZsyoOc0EFBI7q
   Xx3JcNav2Ogp2DEMzWDjQQr1X2PkZA9D9EoGnedMosh4gSJORwAbV/VXS
   1VwpI+aiQURYXGvvXpgohqCnLY4UL84Me1fSUjeNJHu9OcpAXnRTFaPAd
   OvBUksh6ehiJGKk468naI1ybEGmteNZoPa/O2L01dUGPH0W43ZOnReYAu
   C0KN1iaqF9eFF4ygyOhc0Vu9OE7Iq8nfW5Xhs9NFskCiFyDwhLcuIOFfB
   Cm180k1e9hiRkeJiFJ8/x567yID3kxNF1x1MeXfTf7YEvIH9k4KX//qro
   Q==;
X-CSE-ConnectionGUID: GuD9A8d0So2yhfUAxF8Y1w==
X-CSE-MsgGUID: JekS4IzGT7yOL6ochlMc1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64623535"
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="64623535"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:02:14 -0700
X-CSE-ConnectionGUID: Bw0JhJLOSrqTxac6Wf9nJA==
X-CSE-MsgGUID: 2yXnzziVT8OAqtrt3F/1CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,268,1744095600"; 
   d="scan'208";a="183621109"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 11:02:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 11:02:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 11:02:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.73)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 11:02:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=La4Ejt9s3s/v4y3Uqkqjc/WdS+Ej2MkFa1NHymyw+wCZ+hCXIjKO13jL2eF9w6i7ZXKgxbJkf+y68kEkUSQVIttAFVnHSV9zX3zHgm/z+R0VewplhmR+J6jLvAB/34Is2zdI9hqasmik0yeG2zMdTLu256aKJNSIvyckWqtAKr+w8ck51/HnYwqwgM4oUCeX1RKPjypnqpvMC5vERxs6iUoiEQtL/TLyZm5Gs3Uk+CmPO4ygLWU+4SGVK8e9ueKahOIcgOrdMruMWGefOoe3XjQeRpGCVLcMMXvg3TvTyXPfVaTbdIqpZWy3buPhKwVkMi9jNTsK8Ipsd18dNGUfSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wUxQyfCv62lgrn0HW63cd7vvgjQIL+VPxoGTdsjDxzg=;
 b=cCXZspHNs/ZvyG2QDvNpeAdG9m17gKIfhTPe+u/FnaIEzRXm0Q63QqtAv/ZgL8ESHHOCcuJ5ap31lprEVv/zlnJnwsRndQTnIAhs9UrSQqbWQyK1U4Vn7GN0jdgTjnynWPYcVZszeGKpLs+FElHi9eJiGoQ90M6jDIvxQdfLqWHvFMBWVqRTAQ0VNoUAOy5ZlkBc5rO3NsGeKXmtWinYzGXpGDwf46RqEnuvUejmK1ugEkqFO9je83/c7Jn8spXy/TEJOW+/SLl3kh3g8m0/Dcg9SXdnknkZucLgTuQBFZQM4JBkgFbGUWsNKGuLeD5dgz3OO7RH0CbU8ZG2ObsLDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB8272.namprd11.prod.outlook.com (2603:10b6:a03:47d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 18:02:08 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Thu, 26 Jun 2025
 18:02:08 +0000
Message-ID: <d12ea8e3-a7f0-4962-808c-cfed0bd72674@intel.com>
Date: Thu, 26 Jun 2025 11:02:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 17/32] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
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
 <72b62da44d72938a33b58fe3e853da2e41dfd67f.1749848715.git.babu.moger@amd.com>
 <41eebfa8-34d1-4ad1-89a7-62dc372ab051@intel.com>
 <fb205a5b-0689-4d53-a272-d196d337a9e5@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <fb205a5b-0689-4d53-a272-d196d337a9e5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0172.namprd04.prod.outlook.com
 (2603:10b6:303:85::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 138a04fd-791a-4e24-33f4-08ddb4db910a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVlKWlVHZ2xzRW03RXZRWVVRaWxWYk8ycXozZitZT3M5TWlBcG1RVHozckpu?=
 =?utf-8?B?TlZkZU5qZ1F4amtURmEwTTR0NW4xMjVQSUJsdG9ScjZ5bmc4TGtES2FYamNt?=
 =?utf-8?B?RTJVRDZIQ2JicG5JR3g5endQclcrNTRQV2FUSG9SbXBxM3loK2RoVWxCbytE?=
 =?utf-8?B?cS9jRXM3Z3p4bWVjK212QWsyTHR3NEdWckNHTTJ4NGNzcE01ekRSdFNvMVVi?=
 =?utf-8?B?Zi9XZWVON2kwUUdEbm1EVGVqYkZnelp5ZUJNZnk4dVRTOHNkQmpqTUhZZlpz?=
 =?utf-8?B?UFNqakNJaFNZejhySG5CVUE0WlpkRnFTWmQ4azNZcDZtN1dIQmRMVVl0dXhT?=
 =?utf-8?B?eG90b29DR0dKZTFFcFZSY005OXQwb0JIMHZSVEZjOFlzTmt3ekRDcmNJL09F?=
 =?utf-8?B?YzdOQVlJNy9hcmx6dGRwUFVxVVNLUGMvRjh0S2ZLei9hRjY0MzV5RlpjNkRw?=
 =?utf-8?B?cTk1YlRXaG93RDBDYVBHb3dZQmdOajRSTFBiWTRycnFrUjZER3QrV09mR2g3?=
 =?utf-8?B?WWo2M0FLem5aU2pldVFITU5rUjBDVXUwaHk3S3BMQUZobDVDWGxsV1dicVh4?=
 =?utf-8?B?cWNlV2RyTUxmend1c1lYVWtabDVZSG13bXFNT25sVXh2ZFZLV1FyTDkvd250?=
 =?utf-8?B?a3pBKzhmQ1lPdW1CaXRMbGVkY3BzLy9PYUlKZXpYTE1LckltOWZleGtyQkJU?=
 =?utf-8?B?dWZEZUhKNWtxMUw2QkE4dWVIanZmNlFXQW02OXN2MDRUVkVtSDVYOE9QZ2lT?=
 =?utf-8?B?N25SUUZtZHJ6eUpiYVpGWVdjRkJraGZGNFR6M09XdEFoSm1JSThoWWhhVzlH?=
 =?utf-8?B?QVMzNUozK01VZzFuRzdBU1RCMEkxcWNMdHgxVzMxTEhtMHJVUnp3ZUFnTVdI?=
 =?utf-8?B?MDdZQmVaQ1RDL1Y2WFRCbHExQlIwbWJ6NHMrZDlEdStHYTJheW9KWExZV1p3?=
 =?utf-8?B?QXNFbmg5Ry9EaEt1aG9TK0hpRTJ4N1cveFZyUnVtWEVGcHpYVVNQWWxCOVVJ?=
 =?utf-8?B?YU4vVWttajN1S09FQXBOZEdneXEzSGw2OWNXRWNhTjhTdzdsRFpVSWhUVHVt?=
 =?utf-8?B?K3cvYjlNZ2s3N0Y2SEhiT0JjQklscVNidFBrZ0xSNjNjVTI1SHVFL0JxTDFa?=
 =?utf-8?B?QXlueUY1bGdxeno0U3pBeG1NOEhGdEFSZzM3ekRQZ0xwUzNjL2RPejFacXFx?=
 =?utf-8?B?dkViTTJsM3gyYTE4d3RyK2xKcmdaNWpocTlnMDM2YitSVkljazdDMDZ3R1RH?=
 =?utf-8?B?RjR4OVVIUUc4N1Y4UW1mV1JoNHFNTE40TXA5SWNsbmszODNpakplbHRCUHkv?=
 =?utf-8?B?bFVPV2RkYTUvbXlJZng3Vk5kSHBoUXVZSlBXOEhVanpLaDNKTTJ1Q1JmaXZ0?=
 =?utf-8?B?M2t4OVV6ZG5NSW5tamxjbllKc1RKMUttb2RVcndGMERvbWV0dlBRYVc0TVdx?=
 =?utf-8?B?KzcrUlhCNENJam5JM0Fack1YVVpibU9FTU10dHM1eDF0bXZuaXBEVG9DT0NS?=
 =?utf-8?B?SXNreFlmR2YyM2krYUtvZW9UV1gwOUhxVk04Y3Q3NWF6aFVlT2FTLzB1UW5J?=
 =?utf-8?B?ZEhRU1ZJVWRvTkgxaFBMaU5MNEVyOTVxaTlWbmJWaE5hSENpdkdFeWZGa2Mv?=
 =?utf-8?B?b1RiYnhmUG51ZlEyZklaTisveVZOL05mZS9zbVV6TTRERXJRYVdzblFYUEdK?=
 =?utf-8?B?S3JkakQ0QWxwREh5Y0Y1SGpEREtSclpNSlBZYVB5eWV2UHlJQXpkTU81MVFh?=
 =?utf-8?B?dWpHK1pnY25PNGM3aG5XUHNyeXpwcm5OVWZzek5RbDJZSXFHR0tkUXFyVFQ3?=
 =?utf-8?B?aXRpL1Y5ZWUxbEFBTWlUaWxFYUxweWxjSkpiM2cwZGZVak5BN2VQVHc4TFp6?=
 =?utf-8?B?WXVTNzRqSUx2dFFiWDJjZnFJb3NLWnpjcmN5dm4vaEhCSjdMS0VudXdoSmxs?=
 =?utf-8?Q?laNSv/YvAEc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDN3VUpWOXRTaFJHSFBOaHhLL1VZeVByeGRlb2ZRS2oyNG1ZKzZ0THdaeS9i?=
 =?utf-8?B?U2pnWWZFbUdHZ0xkeUF5TlVLaFA1SUZULzZGamVnWDA0ZWVadGkyRnJESzk0?=
 =?utf-8?B?cDJrQ1NCbFN1QmNtRWptWnUrTlJXeG1laWczS2ExN1lPL25mUFIvZlZYMTdi?=
 =?utf-8?B?eDcxOEIvM0lhMTZWajI5b3lPWFFwZkc5Y1NUbG0veitzVjhia1FYMURpSUcx?=
 =?utf-8?B?eU82dVNUUXg2VzNFN01OejJHZjZISFVYTWNhenpwT0JhWmY1bVkxRnNlQ29v?=
 =?utf-8?B?aitrQUR3a05IL05veHo3czdMaTRQb01jeUljd3B3SzVjQUM1bTdIZ3J3YnAw?=
 =?utf-8?B?MncyRTRjOGYxOG4wN3pVeGgvaDUzc3J5TzRFUXdtR2xlSGt1cTd3dkVrSmFP?=
 =?utf-8?B?bXdwK3dsMHU0d1NPRnp2VkRKRC8vWVllMHVMaXhDa1pvczFwMGVWNVFOZXlT?=
 =?utf-8?B?WldmaGlKM2p1azhrOEFFcXYydTVmb2s2SEFtdFJpMHVma0F2ZWZaTFc0S3Bl?=
 =?utf-8?B?NnNobFVmd1ZWUUo5NUgrSG9DNGR6aWo5d3phYmloeVhhMnk1bXU0R0ZucG9E?=
 =?utf-8?B?S2Y5RWhCaTdDL1hteUxQR29XY0hldzlNQ2lhU3dpT24rU1NtRmt0V0t1MkFZ?=
 =?utf-8?B?NHhUaU5FdnVBS2I2Uy9PdEFYMHR5OHR0SlFwanZyZ1lwMGNrUGxqSHNnWklz?=
 =?utf-8?B?TlJmenhHVjRSaW92anRxeUEzRzRaamhVREo2TmlKRXI1YzFjRVROUUgyaFQ1?=
 =?utf-8?B?aDFMcWNrNktjRmhCa0hZdEZuQzJsY0dYUnRzUlgvRk5MV3psSUdBUDNTYlNs?=
 =?utf-8?B?bFk5Nkx4ekFibzZ5aVgyUGhhUFM5dG1wbUVNZkdGWitHMFZ1V0UxM1ErUHFZ?=
 =?utf-8?B?MzNvVHhVNXhLUlo1SDRwZ2tYMWlRc2tmeXdwa1NGQ1pneUh6RTlzZTJlNHF5?=
 =?utf-8?B?cUVBM0RsNENOSjg2Rk5GMGdyeGo2ZHZ4cXFRQVVYV0grVGFZdHdsRmt5KzR2?=
 =?utf-8?B?bmNabUlKRXpuRGlPbUt1MU41VlNSUmNHT1FkeTU1S3Nqd2ZLUFNSRXhjbXA1?=
 =?utf-8?B?T2dlekZCZERpVTlxM1BqM1dmejcvOG9MTDhxYk1jV09JRGpHWHIvUU5ZNDFT?=
 =?utf-8?B?Z1lkd1dLaGlFRFVlT3hsQzU2Vys2RDNxMmk0Z2pXMnl1SlA3cy9LOFJmMGNz?=
 =?utf-8?B?VFJTc2NTS3VlanVZK005cEQvd0FQSXFWc3RoV0QrekhxL3FuNnZJS1daeTdG?=
 =?utf-8?B?RlpIZzZ2K2ZteFB6aFZNdVF5RHNWd3dmSWNBdjBHcWttR0V3OElZV0UvUkVt?=
 =?utf-8?B?V3FyVFBTLzdySk9kOHlzMzdmNVlyME1pR3hDamxORlgxcE8vT3JEWG5UUXUz?=
 =?utf-8?B?OGdvTGVZSFNIeTZzQU1aay9VL2c0c2JJYllXRUJNN0QvVDA3Z25qb1hLSDdK?=
 =?utf-8?B?TkFJZUw3T1UxSk5hOEluQjFaampDQ3ZhTlpwQStCQ0pBa0hnN3VlK21VSjMx?=
 =?utf-8?B?K2dRQ0NLVDl5dlNoS20rTVNrZlRIWUpjZzFTOUlXbHV4bEJoSmlTMmRDUWR1?=
 =?utf-8?B?eU9CRzZZbk1ZeHBCWmh5dEdoRHBwRmlrdGxDRFZaRDcyR1ZFNVNyOEVxV1Nr?=
 =?utf-8?B?RThXa25ocVgvc3Zxa2hESjFHVnEwRmFkMXZNRmtueThpK0J3LzgybkV5QXFX?=
 =?utf-8?B?TWM1WUVjeU9GRHhGNFNyMUNocDg5VC9rU3pGR3BLZm5EMkhBYSt0U05RM3Av?=
 =?utf-8?B?VGtLeGpsSGRsQ0JabWY3QUNUV1NDS1VnNnZKOWtlQ3dQRDBKdG1BeUVlcVhY?=
 =?utf-8?B?cVFpai9ybElKWHNNZlpqb2lwaU5vb0NpM3BWQVhSNlpVOXhYUUZNeDdacWJV?=
 =?utf-8?B?RUxad3ZwaHg4eC9TS2hvbmxPcFNZc1AxRjY0NGRyWTk1aGVRVmVPL1AvSXZN?=
 =?utf-8?B?bWNyOG94eFVqK3g4KzFrL1ZDelJDQzhpYXdjTHhvOUNYOE1qZXNMUzZVcFlI?=
 =?utf-8?B?NHlnOEIyNFROUUJTcTEzcXpoUUU1QXRWbmszMWthOEpWS1BCcGVUWm9YdTBS?=
 =?utf-8?B?YzNwakFtZGFnYUtHYzVXaHJKdTdyaFBNcG5tUFduRzFwZHRjcWtQekxqbmJt?=
 =?utf-8?B?eno2WFR5SThQblNzWFhobkpuc2ZZakszU3hOMnZMbVAzNFd2TXpiL005V1l1?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 138a04fd-791a-4e24-33f4-08ddb4db910a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 18:02:08.2902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztfmrffojaHc1FjLuE5TCvT1MIMWxm+7w4t+i4bjMknfq2RQUieSHnlKkOhiufmpa83jFyfa5uh9QOP42WdfqSLgMFXnnhYmMhBw6HxLJcA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8272
X-OriginatorOrg: intel.com

Hi Babu,

On 6/26/25 10:41 AM, Moger, Babu wrote:
> On 6/24/25 22:03, Reinette Chatre wrote:
>> On 6/13/25 2:05 PM, Babu Moger wrote:

..

>>> ---
>>>  arch/x86/kernel/cpu/resctrl/monitor.c | 38 +++++++++++++++++++++++++++
>>>  include/linux/resctrl.h               | 19 ++++++++++++++
>>>  2 files changed, 57 insertions(+)
>>>
>>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>>> index 0ad9c731c13e..6b0ea4b17c7a 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>>> @@ -444,3 +444,41 @@ bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>>>  {
>>>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
>>>  }
>>> +
>>> +static void resctrl_abmc_config_one_amd(void *info)
>>> +{
>>> +	union l3_qos_abmc_cfg *abmc_cfg = info;
>>> +
>>> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
>>> +}
>>> +
>>> +/*
>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>> + */
>>> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>> +			      u32 cntr_id, bool assign)
>>> +{
>>> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
>>> +	struct arch_mbm_state *am;
>>> +
>>> +	abmc_cfg.split.cfg_en = 1;
>>> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
>>> +	abmc_cfg.split.cntr_id = cntr_id;
>>> +	abmc_cfg.split.bw_src = rmid;
>>> +	if (assign)
>>> +		abmc_cfg.split.bw_type = resctrl_get_mon_evt_cfg(evtid);
>>> +
>>> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
>>
>> An optimization to consider is to direct the IPI to a housekeeping CPU.
>> If one exist, a further optimization could be to queue it on that CPU
>> instead of IPI. Your call since I am not familiar with the use cases here.
>> Looks like all paths leading to this is triggered by a user space action
>> (mount, mkdir, or write to update event config). This would require exposing
>> the housekeeping CPU code to arch.
> 
> Do you mean something like this?
> 
> cpu = cpumask_any_housekeeping(&d->hdr.cpu_mask, RESCTRL_PICK_ANY_CPU);
> 
> smp_call_on_cpu(cpu, resctrl_abmc_config_one_amd, &abmc_cfg, false);

Please note the returned "cpu" may be nohz_full and if it is it would need
an IPI. Similar to mon_event_read().

> 
> 
> You want to do these changes now or later?  It requires few other changes
> to move around the code.

I'll leave this up to you. I think it would be ideal if cpumask_any_housekeeping()
can be hosted in include/linux/cpumask.h instead of moving it around within
resctrl.

> 
>>
>>> +
>>> +	/*
>>> +	 * The hardware counter is reset (because cfg_en == 1) so there is no
>>> +	 * need to record initial non-zero counts.
>>> +	 */
>>> +	if (assign) {
>>> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
>>> +		if (am)
>>> +			memset(am, 0, sizeof(*am));
>>> +	}
>>
>> I am not able to recognize how the struct rdt_resource parameter is used. What am I missing?
> 
> No. It is not used here. It is kept as other arch's can use it.  I think
> James commented about it earlier.

I see, thank you.

Reinette
