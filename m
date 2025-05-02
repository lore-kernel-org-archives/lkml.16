Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73967376;
	Fri,  2 May 2025 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746220856; cv=fail; b=iJZAJx0RDL2Un7naeMxXLCLQTexzcH2ntU40SxoWKN5WtsERfS2eglHrTV/nFax+SIZ5VTfijIMxuA0YfjCNWoFIZDtUuIrDkXsb8DKD9mxADUyXrRLMCMnE+pKMn3iNW5vkO7tnsofL1Dc17Gi/L4X7Ina+5MT97G6p9zsLH04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746220856; c=relaxed/simple;
	bh=rs7LIZ0OC/1hJwQUTelOW7p//sEjf61WX9pSVfs91i0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MUaaETvf7PA+14MbeTk38/5OXZrSfSUDdHaAl/bZv0IAmwxKMdWEeGJsMF7xd6HM1+7Zz9d0iparJEFnvnP7KfFNX4PxSwC3TDLQaJuEhLFmDqxz1HB+gbOalszKyPK4rmFN1lnqKWx318IBDvfoA0yaCpdKagTt4Cz3O8imyrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVNODE+a; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVNODE+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746220854; x=1777756854;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rs7LIZ0OC/1hJwQUTelOW7p//sEjf61WX9pSVfs91i0=;
  b=FVNODE+a0DcDuUQM3usImXlNzN20FBBqy9D3SEUsy7nDt8eH4PXqFSiu
   nu49H2Y07G1CXMBjtdC7xa1x81YpV6UpP2LKGAXQrC7ZY7+onZZRghb4E
   YP9u+rFGSjcg3Bm91QwfMkx8trfyhTkNoCzyQKr6hCA9sLe8N46tdYVWJ
   klAu+RC3jpTRs/6Mxoz9FkBKI3Ny/QnzgeeteW05oNm6QGOABD7wumS3f
   iCSe5EFLTyHjumMjMTf58Z8zxHIsz0I23JTWXTxv38VR62NIrAQK/pFto
   IH01iQOfq7fMQJBYHFvLPVDFUFw4vNE8Tr1ru9ZX745wNXdUW+wZpxbnx
   w==;
X-CSE-ConnectionGUID: j+Rb1paAQG2DKIUdlBg0jg==
X-CSE-MsgGUID: vKnjOn91QzG4X+M4GUj0LA==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="73302310"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="73302310"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:20:53 -0700
X-CSE-ConnectionGUID: rAP2nIMARliNKidmUCcp7w==
X-CSE-MsgGUID: tbL5ueYgSXSt8JqFSz1fEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="135251238"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 14:20:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 14:20:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 14:20:50 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 14:20:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GYk+QIoesYGEzfdnvIwmCiGdtJZBtAkVYP2ereqU835q60dYs4LlFkC+gp06fubCSxNMmx1Z7+C5AuzkOzG14MsngSQbazmnqB2ke5AEKU2D//DTPcON2poPVSXygHS0jnCVyc49jvlzaGxmZkamTMpW0wprcKWVxCSpLh5kmQrX7z6oFrC9D6Ns29j/G7HmWtAwuCrroSF7Ps6VXWApbMgD34dk6QRVKxaP9kRS11WF8jLzZ5w1CXn3UntpFj6s18KkuOU8zQpzx1p0xEbo1K2wxa2JimqveDhYQir2IsVyESoYNX9rHukq8ytEeF8cmVcGAeGWGbi5YhOuInBUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICYbOrH9EevY566Dr/lPsT2u+GThT+4tQvjy0CumnD4=;
 b=yem4LF7V4TWSwGnSmysFjkhCnuVFvloXt3+sTVYHl/snu+bmPadJmr2DBIdZdufYMwrZRo6BCZ6fLGHR3F1kis8P676nkrgmCXJWu4t/uexWS1QzES7ghdXBmwu+Jcycj9xxQ1jTPLQNmfGFs6XlW/X7t0F4mNBVQv/U1MZtkYNaYjeOC6E6b1OtfW7cFnZkQiFZhLNlPn5jXsOLu4XSfmE4GTD+xRY24iFDq+XrzqLmXCLvmH3xgwxYyKFK/W6v5dBdWdf+QenBkWJpPEJMYHQzIgkELV0NJcNxJOiGvckaXg1h1a1bQd2eR4lrljDg4yWOfB3F2Ya7neQUWw+MPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 21:20:48 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Fri, 2 May 2025
 21:20:47 +0000
Message-ID: <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
Date: Fri, 2 May 2025 14:20:45 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
References: <cover.1745275431.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1745275431.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e4850c-3ddb-41d0-dc7a-08dd89bf34cc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWlCWFQxYUluQVdBai9iSTlXUkZUYUdSZUVYMkxPSmtqaXBoS3h5ZWxEc3V4?=
 =?utf-8?B?bHMxQytHemZwYW9YZ2tNYnVuNTh1RlhxV2ZwbjZCYjUyNytieXY3NWJmbnVa?=
 =?utf-8?B?M3VWRThDb2IvSnVES0hxSlNUVGQ0Y2N6Wi81dG81WDRCSzE0VlpKeTFSVzla?=
 =?utf-8?B?Uyt6NmIvK280UHFoWVpVeDRleW1TY2srVUVXOUYxakVoZUd2dGhMaEQyejIx?=
 =?utf-8?B?aE14Ym5Yd2piZ1NPVHJIWENwazI0cGdTRTRHa3ZBaWo1Z0p5NGtGNUVoRHFs?=
 =?utf-8?B?QkxUYWFiVEVQR1kvMzhYTUJUVmpjaXhpY3B0NWpmZlhqYW03blRqNDFEcFR0?=
 =?utf-8?B?T0lMMmtvclpHS0dNcFA2MStaMmx6ZnJBTm5sdFpNSzRsS1ZXWXMvTU1WSXpB?=
 =?utf-8?B?RVNUaWZVN2EzTTRYOFIraUE3aWM1WmhjWS9INU1WMXlpY0xnZ3laRjVDL2xh?=
 =?utf-8?B?WlhsOEJlMnR5NGdXYk1ocGdIQ2lNbEloY0lhVmpLQzR3YmphS0xJTyswQ3Vv?=
 =?utf-8?B?eHBjdnQzeU56RDZnYjVOVzVJMVBsYjhVdlZMQkxlNUZ6VDhWOXozUkk2ZFdw?=
 =?utf-8?B?N2NpeTZtQTU1RVRyb0VGUWFydCtBSTRvSVFoSHZQZmFCVjhFeG5SRWFJWFdp?=
 =?utf-8?B?Rk1HdHV3d3dkd2JLZnNOdkYwSzlWMnpmbVRLT2s5YlVrRUhFZStleW4xaW9I?=
 =?utf-8?B?THhEM2RUVHR2WFBydDZlcm9UV1ZjV0FiY3BERG1HRlM2eUdFcjFiZTJVS0k5?=
 =?utf-8?B?Rmc5dmFjcDU1azhJMDR6TEJDYzhxM2gyeDJjaW5XSDdPV1p5Yi9vK2ZFUUd2?=
 =?utf-8?B?aDV5dGIvZ29vWnpGQ1I4MXJqQ3E5UGpzaXhmQkhpQVZEcnR1ZWcrU0c2YVZB?=
 =?utf-8?B?V0tTa2FodFRIL016R0hyT0YxbjZMNzQwajViV2FnaUxCS3lwYkRyK1FNYVZZ?=
 =?utf-8?B?bmtOMitEemg4VTFid3NqRThMK3JjYXhUV1N1cXg3cVIyb0tCUVZUakREV0ZB?=
 =?utf-8?B?WEFLdVR1bUhEVG1XUUxJSmx1Y3RhVTNYQlZKSnR4YzFzYTNOazM0RmVvWjNh?=
 =?utf-8?B?WUgrcnN3NnM3andLVjNHSjdkRGlFR21UOGVBZ0lNWXNNaGNQcmZOYnRyZHo5?=
 =?utf-8?B?L0grclB4ZUtESDhYNFJCSTFMbEtVeWdKcFliS3cyUTlRanE3WVZjUWp0Rm9v?=
 =?utf-8?B?U3ZXNGFJVXkwditvR3VWQXJtTmt2YXhvQk4wSEJxTUduSjNsUkt0Y052Q3Az?=
 =?utf-8?B?cnlFYzhSUzE1UFpxdWVvS2pYZkZRRlRyZUp1L2xVOW11elc2V0pwbmp3dmpa?=
 =?utf-8?B?bm03NGdBVktDOERWQ25FQ1lSSk02Y2Ivc0tURHNmR0lEWERxSXBEUDI5SHBu?=
 =?utf-8?B?MWtSRGIxZEh4RGYxWnJxbll0d0wrc0dXQjFESXBmTUVvUUNvdVBnSy9PZ0Vk?=
 =?utf-8?B?bGtSQWs5MjIxaGRUbjJ2T1VGaFRpZjNkTVl6RWQzcWdCbXhjVDhsQjM5aWRa?=
 =?utf-8?B?T1JaYXZJRCsyU1lZT0x3Tmg5SGVzNDl4YWxJNjd3S2tsVHROZjJBa1JKN1Vy?=
 =?utf-8?B?QkpiRHRiRU9xbjAzaGNoYlJJL2Rza3VNTWJlZGtTZUNwZTlPYmtkMnJ3QndM?=
 =?utf-8?B?K2RnSGt1bGlYRENhSXhUOWVGeFNrUEFhbWk0cytxL25QNWwzbmpRVEVYWjAz?=
 =?utf-8?B?c2ZRajNsdFFKak5kQTdWU0cyNWpNdDF1NjE0Y1hMVEtFNlR1SXhvc3RTUU95?=
 =?utf-8?B?TTNIRnkxR3hsVFBTNTZrK0Urblpub09EMUJzbHBpb2UxSUllNmpic0JjT3V1?=
 =?utf-8?B?VWVTWE1WNnhTa2E1M05vY0Q4Mk0vU3pXRXU2cHQ0cXZKbzJDL25Kb2ZyVlhL?=
 =?utf-8?B?Q0g0WGs4OHc1ZENtUUZLdHhOMlNoUWFSMi9FMkdMQldEdXlsa3ltSzRZcWNX?=
 =?utf-8?Q?dFDLID1HcGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0ZYQUJYMEZzZk96VXBzSGZXTVF4VjNjTHpiaG1IeGJDcjJQNFdlWkVLTVJT?=
 =?utf-8?B?NXo2OURYZXlCVjFYaW1QWUk2NjRIaVZMcWM5OWJibE9ZbHk1SEltaUd6NXht?=
 =?utf-8?B?bGg3WUNVOStkLzl6aTE5Nktta0dkWlpab0IvYjNXMGdUdjBRdXN5YU12L1FZ?=
 =?utf-8?B?U1lYOUlZY2ZKcmg5K0x6YXYzU3RhK1kyeVlldE8zaFc1c1pBUDVkUnlXNHNr?=
 =?utf-8?B?bzVlUW5iRnllV0o4TGRXTWZHbXEzQlA5S1VUWWtCUjlMTXRWRCtOeEI3VS9T?=
 =?utf-8?B?d2szU21XVDhSK2w0dzZxMnpUbU9Rai9pVEZSeDg5eWh2eG8wM3BxdlFBV29T?=
 =?utf-8?B?WHBxekxLa05lNjZma0tWWVFpY09VSTdsVEVKMjNHRE1LTlRIQmVqREZmQ1hO?=
 =?utf-8?B?Si94L1JkZDE0c0xoY3phc0lIeFRialp3Z1JTeS9aRkdBV3J3Y2dJVzR5WUVZ?=
 =?utf-8?B?dU1SMlpYdWl0bXhGKzFyWlZUWUlrb3h6d1R6WHZGRHJpYmtzNGt1ZDIxaktj?=
 =?utf-8?B?cnpIbHpha0drcHpMRlI5TXYxYlFqTXZwcnlURzdaMG1OVHA1Qy90L05mNXo4?=
 =?utf-8?B?SGFPNXMrMHFidHUzajlYallraE5ibmVuUmRZOHI2TjgzOGE4cHJqejZPd2Vz?=
 =?utf-8?B?dlluajlta2FFQmJTcmpINFlhdEIrc2tyaFg0S2NzMlU0OUcxQXMzU1E0d1dU?=
 =?utf-8?B?VUt1VWl0UjRuaXk1eGd0UnZneVk3VXJZZ2lXV256S3RMSFFBWHhuZkZsdGJV?=
 =?utf-8?B?Rzh2aG1aUDRscCtGSUJXUzRIa3NoN1dHYXZvRjR0Y0FUeW5kc1MxMWdWaE9P?=
 =?utf-8?B?dUtRTi9wTGNBeGcyWDdsbXNCNlpzTjVrRERlVWFLSHdZVDFOTkYzMmsyazF0?=
 =?utf-8?B?dkYyMWZTbS9keklyZGp5dmI4bUxlbUdGNCtDUDh1NDNKanBwRWVqVHhyazFy?=
 =?utf-8?B?eG5Gclh5bk1ZRjdGbzlBUlM5Q0RuNXdneGZjMG1memtiZFRsQ3VTT1h6VzYy?=
 =?utf-8?B?Rm5yYWhlQjBMOGE5YUhqSThCMmJYV2VuMzRJM1gwRlo2OUpaREtGeFVodzN2?=
 =?utf-8?B?ZzVyQnRkUEYvTTQ2WmJ5RGZKeWsxbG1PY1AzOGlCQmx3MUF4a2hhU284ajgy?=
 =?utf-8?B?VlIzZ01VYmkra0RxVXM5bHlvZWhqZitZaStscE1vNUhsc0NjWEdYZVVTV3J2?=
 =?utf-8?B?dnNIUjNwRWVpYVp2bmdHTmZCNE1zU3A3cVhKZDVUVnFKZ0RmRndVYkc3MU5H?=
 =?utf-8?B?ZHBQQTFXdHRERVBwL3NJNUliRUIwOUNOcXNsVnhuTG95dXpYMkY1bjQ4SzUv?=
 =?utf-8?B?RG5CMXZpL2Vwait3aEhrU3NqZW1WVTBjYkdBMjlHZTRVWFFuSFZJV1NTK2l4?=
 =?utf-8?B?c0NoM213UEdUTkxuYTlIRE5VWTFneXZsb0xKS3hOVG1FMzlFb01rTUxLL3JC?=
 =?utf-8?B?K1lycEZpVjNQckZHOG9EQzc2Y1F2blBteGpnSC81NmtqT2hvQkZnZE9oSXdy?=
 =?utf-8?B?akVpQUh1STdETG4vR0NuT3AzVVRhRG9jOUhUYmwzR0dvMWo4WVY3elBqRUtD?=
 =?utf-8?B?blV1Y3JHTWF1QWRKZ3ZiMnVQb1poZGllYVVONk5ReG5tWHovUGl6RjdXWmNa?=
 =?utf-8?B?dGtNV1VORENTa2FHYzVJRFFvUCt5eEQxQThUaXBGYjlZTFkwdG9pMHdFOWNi?=
 =?utf-8?B?ZG1SdEp6RmVjTDlQQXFOR0pZdmZFTXV6MGc4ZU1qQU02WnpsTTJiZzlaOFho?=
 =?utf-8?B?M3hndFZpOElSYk44c1BkNmhCNFVvRTFvRTFSZGVEa0JMbzFPcnJhVEhNS1pi?=
 =?utf-8?B?SENMc1k2aGZZYXhlMWkwTWFPR1RxeDlSc2twYW4zZWdjMjBNaVVrRjdieGd1?=
 =?utf-8?B?cStXR2VvZlNVTTUrYVdVejVrdGlZeXBaaWFJMWUwRkpsY2FRbXVsTmZ2TFRq?=
 =?utf-8?B?UWxKN1lnVlZNTVZCY3pBSUloaG1zK1Z2RE41NGtuTmF0bFYveXJjREc3OUkv?=
 =?utf-8?B?ZkRmM3g5c1czTXMyWk5BcjFpMzMyN1hyZGhCYWs3dElLdFg4OHdFc25tT2E5?=
 =?utf-8?B?OGM4V21DTldXYWR1UTZTKytybE9Kd0llTlBERm91SGx2Y241V29xMHhhZ2lr?=
 =?utf-8?B?MUtlMkprTnI1a0prQUlGV2QwVVdqcEhFd3JLeWxGQ0FRS1RkRHg1UVhjbUly?=
 =?utf-8?B?cnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e4850c-3ddb-41d0-dc7a-08dd89bf34cc
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 21:20:47.5668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xtj7FnnI6ZvA9rKV3c4Be7GK/qwhlP0R8Zc4aFK93hoOzJw+nILsvMctSfgwQ1K9kAlz3l64gN2Xx7Hfu3dlLiZD8nrSyU5Ke6wb08ZZHHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8182
X-OriginatorOrg: intel.com

Hi Babu,

On 4/21/25 3:43 PM, Babu Moger wrote:
> # Linux Implementation
> 
> Feature adds following interface files when the resctrl "io_alloc" feature is
> supported on L3 resource:
> 
> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
> 				  feature by writing to the interface.
> 
> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
> 				       for I/O devices when io_alloc feature is enabled.
> 				       Configure the CBM by writing to the interface.
> 
> # Examples:
> 
> a. Check if io_alloc feature is available
> 	#mount -t resctrl resctrl /sys/fs/resctrl/
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> b. Enable the io_alloc feature. 
> 
> 	# echo 1 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	enabled
> 
> c. Check the CBM values for the io_alloc feature.
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	L3:0=ffff;1=ffff
> 
> d. Change the CBM value for the domain 1:
> 	# echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
> 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
> 	L3:0=ffff;1=00ff
> 
> d. Disable io_alloc feature and exit.
> 
> 	# echo 0 > /sys/fs/resctrl/info/L3/io_alloc 
> 	# cat /sys/fs/resctrl/info/L3/io_alloc
> 	disabled
> 
> 	#umount /sys/fs/resctrl/
>

From what I can tell the interface when CDP is enabled will look
as follows:

 	# mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
 	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
 	disabled 
 	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
 	not supported
 
"io_alloc" can thus be enabled for L3CODE but not for L3DATA.
This is unexpected considering the feature is called
"L3 Smart *Data* Cache Injection Allocation Enforcement".

I understand that the interface evolved into this because the
"code" allocation of CDP uses the CLOSID required by SDCIAE but I think
leaking implementation details like this to the user interface can
cause confusion.

Since there is no distinction between code and data in these
IO allocations, what do you think of connecting the io_alloc and
io_alloc_cbm files within L3CODE and L3DATA so that the user can
read/write from either with a read showing the same data and 
user able to write to either? For example,

 	# mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
 	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
 	disabled
 	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
 	disabled
	# echo 1 > /sys/fs/resctrl/info/L3CODE/io_alloc
 	# cat /sys/fs/resctrl/info/L3CODE/io_alloc
 	enabled
 	# cat /sys/fs/resctrl/info/L3DATA/io_alloc
 	enabled
 	# cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm 
 	0=ffff;1=ffff
 	# cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm 
 	0=ffff;1=ffff
 	# echo 1=FF > /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
 	# cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm 
 	0=ffff;1=00ff
 	# cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm 
 	0=ffff;1=00ff
 
(Note in above I removed the resource name from io_alloc_cbm to match
what was discussed during previous version:
https://lore.kernel.org/lkml/251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com/ )

What do you think?

 
> ---
> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>     instead of 0 or 1..
> 
>     Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>     using closids_supported().
> 
>     Updated the documentation for "shareable_bits" and "bit_usage".
> 
>     NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>     handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>     really tell the user which CLOS is shared across both hardware and software.

"bit_usage" is not about CLOS but how the resource is used. Per the doc:

"bit_usage":                                                                    
		Annotated capacity bitmasks showing how all                     
		instances of the resource are used.

The key here is the CBM, not CLOS. For each bit in the *CBM* "bit_usage" shows
how that portion of the cache is used with the legend documented in 
Documentation/arch/x86/resctrl.rst. 

Consider a system with the following allocations:
# cat /sys/fs/resctrl/schemata
L3:0=0ff0
# cat /sys/fs/resctrl/info/L3/io_alloc_cbm 
0=ff00

Then "bit_usage" will look like:

# cat /sys/fs/resctrl/info/L3/bit_usage
0=HHHHXXXXSSSS0000

"bit_usage" shows how the cache is being used. It shows that the portion of cache represented
by first four bits of CBM is unused, portion of cache represented by bits 4 to 7 of CBM is
only used by software, portion of cache represented by bits 8 to 11 of CBM is shared between
software and hardware, portion of cache represented by bits 12 to 15 is only used by hardware.

>     This is something we need to discuss.

Looking at implementation in patch #5 the "io_alloc_cbm" bits of CBM are presented
as software bits, since "io_alloc_cbm" represents IO from devices it should be "hardware" bits
(hw_shareable), no?

Reinette
