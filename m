Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFFD28C5CE
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315641; cv=fail; b=Q3zVemZSpYMq+9+N+L9g7cZ5+kTW9y9dM6I946G01QdeshkNsa5nwHVxnBpZrtINLmSm3bcTIBCCLEYsPhAvTxENStcriuk8R9Okn1XbQrgn9iWN49pmvCBvR9ioscOa/rBFKq+RcL2hMfZ1uUGPk3KJd0AlUgGsnMkooUGLZJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315641; c=relaxed/simple;
	bh=ldrMjo3tS9O2E5lfdteg30YvV9wkCHBiJEL4A9V6V2I=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AxFKXTaoM/gv/uijrwIEO8cIKkG1QrvSk4451rQ8lI45ydKi/+oQb5J2bfodMZRUSgFqd5ELbClxB14/9ZS32zgudHBG8Qt2IzI6YlQCTX63JUHAvM1yfFUZGprr512EA9Tk953mV2/cSHRbCW/WeSJk/BZ+p6N2ac2CC112mDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qwz7y6Il; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qwz7y6Il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744315639; x=1775851639;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=ldrMjo3tS9O2E5lfdteg30YvV9wkCHBiJEL4A9V6V2I=;
  b=Qwz7y6IlXLT9w5Y4GR9gv68mi0edoE6WkH+v4+L1xhknYTwNFyDEd/Wv
   0l9wMK7aRS5dVFtMPDbiryueVfXZXW+mGXOCWscHp21MaaKi1/b4I9hPD
   Hu6U870tDLHN7hp2JkQE2v+oXTN8ygqOvY8qOAIqli7Q7cZqmYOfgZOh3
   +8fGwZ7lglul9YM3aTmeEqC1s3WCG7S5ph8KYnOKrNlPU4xD6MmtamBEO
   1GRuYutw6PqaTl3J+sEblgyZqrbAo1W62zcuGSNquwbjLECO6CcGmiGif
   cANEnNVfdozYrzLtJSVbnkUVwCBNuyWIZ0i3dLy16sQPJGCYTAtrBImlG
   Q==;
X-CSE-ConnectionGUID: NxoCZ9R7S8OLkiip4JVxug==
X-CSE-MsgGUID: B7A3rHQCSIaocwi7IIExRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="48565553"
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="48565553"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 13:07:19 -0700
X-CSE-ConnectionGUID: gMv3ZwBdR/aaQZ6Cwoy51w==
X-CSE-MsgGUID: RuhpI8CDRm6z2TzDlHZAPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,203,1739865600"; 
   d="scan'208";a="129341541"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2025 13:07:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 10 Apr 2025 13:07:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 10 Apr 2025 13:07:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 10 Apr 2025 13:07:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+SjYtGOAkm8atro3G25/FcmnYbxtClnZoUTR/2NyauH45ISbi9PHO5DHBQZY6aWnQ9acNNdflK3jmexdfNslg4j1aC0jmcdGFsWCsTxtiGwXciL/Fqg9rainvVcB1SL05DN4NJH2z/w5RY/69hEBigbxpE64kqRm3kBqIHuqTrraq1651xsdbukMluo2pC6utNge4qpNy81OQZuMmwKOS//t51MRrvrG0eFMW7fc6Yh4JX9vRg2IPEyfZNlHM7xTMGRXb8ijvWCH4LKqHvTCGueBbrsXKQpe65ewMfqg6Z3tG3jjihThGEeQxNu+vx/TE+lYHN01sMmy+VTUTWEOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=56wACCexkP/QMxz2QfhqKAcrBxrtxEoWvL/v2EZmV70=;
 b=RC8v7Q4nqxX9N+JVGnjuXVWRGXo4HsRrZIPEcbQ/8/1s2LI1QgN5CvB4AxwiRFIwNikJqSHb/uVE3+XhUre+H6Qldu+yukMtpEeufKn9pfuvLIP+Mk6rZvmQFbgWorMjnWVAgQGRfCgD466ZFuzNJbDEyJw4s1UKPB7TcUTa4rPZ3zGnOrkod5w1HlRYrQ77yqxBzvoxnPVtlciIsn1aYWd5j3PUS3X9C3WkTNFJPqsYNJ1hD7hfcon7sNX0G9js2oc1Nw5gXTAidp93IHFhjC4ZRnBRp0w19/Y7hh5wlzokCjlD1N80SJg3PB7kON7jfq9jCaBz3ubU2DugDma06A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by PH7PR11MB7049.namprd11.prod.outlook.com (2603:10b6:510:20c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Thu, 10 Apr
 2025 20:07:14 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%3]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 20:07:14 +0000
Date: Thu, 10 Apr 2025 13:07:11 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Nikolay Borisov <nik.borisov@suse.com>, Dan Williams
	<dan.j.williams@intel.com>, Kees Cook <kees@kernel.org>
CC: Dave Hansen <dave.hansen@intel.com>, Tom Lendacky
	<thomas.lendacky@amd.com>, Naveen N Rao <naveen@kernel.org>,
	<linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<linux-coco@lists.linux.dev>, Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>,
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Kevin Loughlin
	<kevinloughlin@google.com>, Michal Hocko <mhocko@suse.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <67f824ef211cf_71fe294e@dwillia2-xfh.jf.intel.com.notmuch>
References: <1bc4c506-57ad-38aa-d56d-ed058f54708e@amd.com>
 <fd683daa-d953-48ca-8c5d-6f4688ad442c@intel.com>
 <67f5b75c37143_71fe2949b@dwillia2-xfh.jf.intel.com.notmuch>
 <202504091038.5D9B68A@keescook>
 <67f6bee647aa5_1302d294f5@dwillia2-xfh.jf.intel.com.notmuch>
 <e2933f6e-4bda-40ee-b69c-d7222082fcfd@suse.com>
 <202504100931.DEC3D3B79@keescook>
 <e67bbcf2-02f4-4ce1-8ad0-b1f1381c65fb@suse.com>
 <67f819faa4e0b_71fe294e1@dwillia2-xfh.jf.intel.com.notmuch>
 <e11e9b17-a9e0-4f3d-964f-c8b656403f65@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e11e9b17-a9e0-4f3d-964f-c8b656403f65@suse.com>
X-ClientProxiedBy: MW4PR03CA0137.namprd03.prod.outlook.com
 (2603:10b6:303:8c::22) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|PH7PR11MB7049:EE_
X-MS-Office365-Filtering-Correlation-Id: b233660b-5a71-4660-0c00-08dd786b4949
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VG5UamgrYXVqYVJSVWpsMjAzempUOEUweTRBTEFGKzhHTGd5RnpYbHhBM2dj?=
 =?utf-8?B?MEVNUUhob2EwRUp2eUZHWktwcmhtWGRPVmh5K1dtQ0N4OTVxaitDSWZESE51?=
 =?utf-8?B?OXRPOFBCS3A0WEcwT1M4T0krMDZnSWR0bXJXak9abnR4dlFSYVVTdDIzcU82?=
 =?utf-8?B?U2RFRmtyQXhBamNZcGlxSmoveHJXNWl3UlpGQ2pyMnFYejFYUUVnSS9iMFhE?=
 =?utf-8?B?dWdSdk5BdlllMXhNSjNGZ21LbzA4dW0yS0lZN0NINHJXUTFEV3B0RUV2Yk55?=
 =?utf-8?B?ZEozMnZ2bGJXY3dubW9iUjZ3N2dNMjA1bi9nQmxoeCtVellVZTZrYWFBQVFn?=
 =?utf-8?B?ZWRXUitzY0pMam5JN0gydFlLNTJjNHNkYXFEREhBZUZHUmFIeE4yWERuWW42?=
 =?utf-8?B?V1pCcU9JY1hRUWZUbEg1Yk9HMDBubCs1ZzdONU9acWFOaFY2N0F0bkxhMVVR?=
 =?utf-8?B?VkNzRmc0TzJJZlVLc0VhUG5XcFFxNVVXdFFhMlZuMzJGZEtEYkU5dE1hUHFK?=
 =?utf-8?B?NjdjejZYd0FybHo2Qjk4VGJBMGdaY2dEY3VCWTM0UUNuOFZJSlo5WkZESTQw?=
 =?utf-8?B?a3JsK2cxRVFzZGdtcFZYVUoxdE1rV0lGdkUwZUNHRTFaY21FR0ZzcW1KdWhK?=
 =?utf-8?B?RFlFRTlXbmF0TGc4SldWTmIwa0llMkhzV1RYSWNFS3lXU2hwcVVpSzd5WWcy?=
 =?utf-8?B?SEEwM1BXdm5sRVlyUnZ4Qkk3SjV2endRV3oxWFE5ZFN5OTd5dWRYd0t0ZURu?=
 =?utf-8?B?LzRBSER4NHQ4NldmelZRaFd5ekRJbWV1Z213cXJWeHBybGgwZkFlQStKQ1ZU?=
 =?utf-8?B?ZUFWb3ZLM0o0QjJVWnU5a0JoKzAyWCtxcDlEZENqSVFjcHM2bnBZVGg1U2NY?=
 =?utf-8?B?bjhmd0F5ajkvT2c5cGV5TkkzNFB3NkFkcEkrTXRFZC9NT3M0bW1HT2VWQWFQ?=
 =?utf-8?B?bUNtTFNHdkF3VlVETUJnODBzVTd2ZDNQOStvS0d2dVN1UXIxN1lSMDdXR0Nz?=
 =?utf-8?B?MG4wSXR6M3dGYnoxVU9jYjNyRjN5Y2thWEhNMlpFdXY0Q2xPYm9GNU1peSt0?=
 =?utf-8?B?ZFg5ZSsxTmF6SXZ1dDEyd001VE5Ha2VWazFBM25hdVR4RldZNnRaVjZvZEJm?=
 =?utf-8?B?a3J6aW80UVdOT1dTSllyM2VxM2YrclFSNE9NMERGd2hmQ0lDNURPWHJ3M2xI?=
 =?utf-8?B?TEpnUFE3TXpqNGhsMmtaU1Q5ZE5KL2F3RDNpcDN2a3lTV1dla0lKTGNGZUVG?=
 =?utf-8?B?REFnUThHd2JBL3BNR1ZMWEZET3JJMUoydTlCM0c1L09mMTRLblpscXVSTEQw?=
 =?utf-8?B?Q0tPUjlmckhtN0dDM3VYY3NiMXA0KzZxN0pUYkpkc1oyeXJicmFLb3lnOFBz?=
 =?utf-8?B?ZTZzVGc1RUZpTGovVUY1SHBsVlpSTDdieTBaWlFYMFU1eC9uaTlXRkQ3Mmt1?=
 =?utf-8?B?MWx6bWI3SWdsMG5jNXV2b3gxeDRWdk51RFRYTmViYkQ3Ym5MNzVXNm9LK2Zz?=
 =?utf-8?B?YThSaW9TczlRRjN0MTNnbVI3Z05ueHNWZVBaOE14SnpBZk96TGxIVUpIUVJw?=
 =?utf-8?B?bnYycUJiS0o3Z2hCWlphUGFhV213b0R2dm5RaHJNWnJSYWgzUGRhWFlWL1Zo?=
 =?utf-8?B?WGpEQm5WSHJKeUE3YnRMQWdyR0lPUkQ1UjJNcUU5eFJGanVYOEkwME4xbllp?=
 =?utf-8?B?UHU0ZisyT3lVbkZiQ2pSWnZWOUtaNWpxVUF1bW42LzZxOVJBUStMZFdkMWIv?=
 =?utf-8?B?bHR3YVhHK3dYZUJXTFI5aTlYalJucUxMM0FSaTBTYnJJMzhoektwdFpIRjVP?=
 =?utf-8?B?ZkJlaHlqQmtTamptaEhUNjFVcFl0eGhtOHc1L1puRkc3V1poSWJXdmFpSTZ2?=
 =?utf-8?B?RTJJdnlFT1NLeW5jbG5vN3ZhRHhIb3lrZi9IcmdiSkovaEFaZjlrMkljeDR2?=
 =?utf-8?Q?FCay28vlnlU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RG1qd0VpT1FRZ0lQNFRZTWhpNVN2T3laWExsblRWZXpwd1hkenNWRXJLRVlI?=
 =?utf-8?B?c29HeldzTS8yYkx2ZDJmUnd6VUNPZ0FaVFNUMFhyY2NxdlpPNW9rTVZ4VUFF?=
 =?utf-8?B?NlN0T3E1VnV5cUtpdHpyQmcwdk93VXZhdmtmcDdhYVNlVkhwQkszZG5ETFlx?=
 =?utf-8?B?cGkyVVJPTDQ2Q29nWmFDaTVKQUd4MUZHS2Q5RnNrcWs0OUNYMWx0cnpIUkMz?=
 =?utf-8?B?TWNrQXZFL1pUV2xINUNBUXRhUXF5aU9aMEhFRGVxL2hEajE5RGxhWnU5YVB0?=
 =?utf-8?B?eWNnTktXTHFqSEJZQ0x4V08zOHZPSGhIdWFZUVBIeHd0ekxhWk5hMkdXR0xh?=
 =?utf-8?B?WEQ0L2VXVkVTYW4wUzhIbkpobmpRMXE0VG9XS3dJOG5YWXlzYndwdEN5bWUx?=
 =?utf-8?B?WXFwUC9rdlEyQ2E5K3J3bnBlZXdIWTlHNTlHUTRVM09qaU1CaCtJK0o4ekho?=
 =?utf-8?B?UGZmS2VSSVJHeFRHTm9aZG1JcEVGWHkyNnQ0cWtkU2ZGNkVuSjF3cGJINy9a?=
 =?utf-8?B?bzF1K2VwTEdPMjJaR3BTT2ZkWUgraVozVzVsNmdnM29uY21jeXE3Y0tEZVFx?=
 =?utf-8?B?bUwvS3NwUmR4WFJCWCtzQ2NFNldwSWgzOVZYZ2hhOWdjNXBadytUbGFlc1h6?=
 =?utf-8?B?SlJWaE1hMHdNdEJkenhHVERmeXloMThETGp6bTdtVlIzRHZsc01qSWsvZW5U?=
 =?utf-8?B?RVRzdXZGL2wyMXNEcERoaG90L3BEaTUyU0ZOMGExNlo1NWNocytwcGdtZlhN?=
 =?utf-8?B?UkdveEhxOHBGZ25vNXZYcjhnQlJreVdvVEQxeHlmUFNwb2lQUFYrMEt3Z0N2?=
 =?utf-8?B?c2pBd3Q2RnVWcFROWjBXTHV1bEdCTjZRajB4ZnZmS245T0F2VHdBTmVBaUtQ?=
 =?utf-8?B?T3pvbDZIK0xETG56eENLUEZXZEhxUWpyNkY5eXFHY2srbk1UZjhuQ3dlRkpF?=
 =?utf-8?B?bXJ1cTJabVRTcjNkc09CV2hQZ1pSbmVYdVVsM3gvZjFBWEkyLzJYUmFadk1U?=
 =?utf-8?B?RU5oMk5LM3liVmdIL0Flc2d0bnlpNm8rRytOVGxrOEtBZXFFeFhMclJGd0hR?=
 =?utf-8?B?Y3hENURGQlZTclFOcURObkViYlNZM2hxeW4rVGt6K0trY3hVZWtMRTVhK3Q5?=
 =?utf-8?B?Y1ZLcksvSDViWVdCQVlMUk5mdDVFUkFmMzNIbTg5NEZQL3IyRURQTlM2U1V6?=
 =?utf-8?B?My8wY3IyT2tHOWdpY0lQQ0dTU3dXTDR3SXc4emlyeHlDYWxPekJWa0cwM2lm?=
 =?utf-8?B?M0owdytPdk5PVThpdE5KL2YyaVJlUCtCcGRTdjZFNnNWbkM2WnJueHErOUEz?=
 =?utf-8?B?UEV1dHBrMkFXTURUQ2JrYXJ5aVUvTmFEdjZ4OW9HTitrM1ZBYTFpZUxDMTQ3?=
 =?utf-8?B?c1JydkFrN3pUblh1QTFiRktJbVk3MlpzVUt3S1lkVkpGaGdBUTM4aWh4aWYx?=
 =?utf-8?B?TGlmTGJyRGNLR0x4QUJmeVY2eGtOM2dma1RMWkpLMUlReEdXNzVYemtFRFhy?=
 =?utf-8?B?Y1NObTlTT0ZpSXN6S1RWSjVUenJTSlhYRnNGNkZsN0t0NTZiV2FlMDRJVVZ0?=
 =?utf-8?B?TFJwWHkxTjNKR3phMjJpVXFualB0c1pZMGxkcnV5bkFIUFZjeHBsbjlaeHNX?=
 =?utf-8?B?NWVGdVExWW05ZUlHNVNRVWxZRVB2MGxGVDZ0Zk0rOUExekRDcWE2THN5NHhy?=
 =?utf-8?B?QzF6bWlCYVljSitRT3o0TGZlZ3M0ZHpaNXhXTVZVL1hHdTRTR2VvcWtSd2FP?=
 =?utf-8?B?NkFnRWF2bnh2M25NSFRBQ0hYVG5ZMzBJNVcvaUttZEE0bERPcnRRV2F0VFNz?=
 =?utf-8?B?VVBpaTdKK3pET3JXL2tuQ3FrMzNrOHZRNFRzd2tpOUI0aERlWUFVdHVLSC9B?=
 =?utf-8?B?cmlyQ2JNcXI3MGcvdHc0TWJQQitmSVJQN0NiZENpZllNS3hEWFc5ZW1tY3BV?=
 =?utf-8?B?V1V1WWl6Nk1XK2Raa2dMVHovaXZjcFJNTmRlbm4yL3REZzI5YVRLL05kcGJZ?=
 =?utf-8?B?M2VSUU5MTmRwc1ZEQklBYm1TQkNETTY4VHhROEdQSDgyOFhRTVY4bmw1dUdS?=
 =?utf-8?B?eGlQdVJIdEhRTncxa2VUVy9LL1NyUXA2bHRLalE4VENkUDRkR082cGZwMHVn?=
 =?utf-8?B?djJrTTR4QWk1Q1orclkyc1FseUpoZzU1cU53dnVXQWY3Si9DdnlMc2ZQczZY?=
 =?utf-8?B?T2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b233660b-5a71-4660-0c00-08dd786b4949
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 20:07:14.4951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WB7a31B+oQVOOYuG7kwuWFc59qP1NzFCTpLyGtgiwlWieeaTcMNzV1kojWvNM9qLWTgzOz8VbqoKABImynLbRdRPslkrK8pDkpPym6M5/7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7049
X-OriginatorOrg: intel.com

Nikolay Borisov wrote:
> 
> 
> On 10.04.25 г. 22:20 ч., Dan Williams wrote:
> > Nikolay Borisov wrote:
> > [..]
> >>>> Can't we simply treat return value of 2 for range_is_allowed the same way as
> >>>> if 0 was returned in mmap_mem and simply fail the call with -EPERM?
> >>>
> >>> The historical concern was that EPERM would break old tools. I don't
> >>> have any current evidence either way, though.
> >>
> >> Right, but we are only about to return 2 in a TVM context, so chances of
> >> running old tools are slim to none. Also it's perfectly valid to have
> >> mmap fail for a number of reasons, so old tools should be equipped with
> >> handling it returning -EPERM, no ?
> > 
> > In practice that is yet another return code since the caller does not
> > know why the "2" is being returned and it is not clear how safe it is to
> > now start denying mmap in the !TVM case. So, perhaps something like this:
> > 
> 
> What I meant by "returning 2" is returning 2 from the call to 
> range_is_allowed in mmap_mem and handling this value inside mmap_mem, 
> not returning 2 to user space :)

Oh, no, I was not confused about that, just the conflict that "2" means
that mmap is ok currently.

> In essence something along the lines of:
> 
> 
> 
> diff --git a/drivers/char/mem.c b/drivers/char/mem.c
> index 169eed162a7f..8273066b6637 100644
> --- a/drivers/char/mem.c
> +++ b/drivers/char/mem.c
> @@ -359,7 +359,8 @@ static int mmap_mem(struct file *file, struct 
> vm_area_struct *vma)
>          if (!private_mapping_ok(vma))
>                  return -ENOSYS;
> 
> -       if (!range_is_allowed(vma->vm_pgoff, size))
> +       int ret = range_is_allowed(vma->vm_pgoff, size);
> +       if (!ret || ret == 2)
>                  return -EPERM;

Right, the issue is that this potentially breaks userspace that had
glommed onto the idea that it can always mmap BIOS data even if the R/W
path returns zeros.

It is arguably a bug that we allow that bypass, but it has been shipping
for a while. I think it is reasonable for TVMs to try to shut this down
completely, but the question is whether doing this instead:

   if (!ret || ret == 3)

...allows the TVM case to not disturb legacy expectations?

However, my vote is to special case 2 as EPERM as you have it here.
Because, if that works, it solves both the TVM need and silently closes
this weird hole hopefully before userspace actually starts depending on
it. We can always switch to 3 or do the work to map zeros if that proves
to be a regression.
