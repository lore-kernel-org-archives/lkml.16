Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FAC79D0;
	Wed, 25 Jun 2025 03:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750822374; cv=fail; b=TOKxUCSgMpdtX7H9aszVDAjy/3Lkle2rhfc9Rw/KTwzgl3zOQKHrmwKUM247ep56NA1Eod1a9umWPfcdyW7KKo+ineZe1w7olmgcKFB2OCnh/Zq1NcReLjagNFqzG/hdM/mq+zuDqTUA5g+wkzLNr8fy1VCXA2fs/PDf9RJxAyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750822374; c=relaxed/simple;
	bh=rk0Rm6GvJG1TuUkAQx0bVCFDUxHNzI7LW+lTDmdE2FU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Go33+MSSTrc9O/hsLhrwMQdl600ynRNFEOnuW1HG/7m4Wnkj+ZZ7ucxMWwQ/cIXSqY35jPo8vsm8CwN+Immvw7oYNS+BhL3B2SaVPXg8/KESy/u5hUihz+DzdBfDmvF+aQxwtu/eoSgsfVM+xNOKFthvVkJgPKx1A35ly7OEEbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D4DHGnIQ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D4DHGnIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750822373; x=1782358373;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rk0Rm6GvJG1TuUkAQx0bVCFDUxHNzI7LW+lTDmdE2FU=;
  b=D4DHGnIQ013366GQBwCkOShd1YKpFTq/QwvsoknHGw5HpWBn1bBSoacY
   kVffUBRhea00UqkT71uvokPueTExP0fiJbOY6A/0ZkqQEaDMYJQOQSuRP
   EcYGuP8TZ30r2Koe+FZC0iYRaeqtqyhHC4IoaUNdSI+pdvgJ+hxIOXT+J
   7eBAM/H/oppqka5BtZMCAS3f7L9rjJh92+MbbnIaa1bx9no6NJFAPWyxQ
   CmvBy/62iY7Xg2SfLtzWJ9g/BTRsSDt/HkzMlkhNf/2De3X6lafRZKWea
   xwGPJT2VIWZyDqftgsEVNMEgLIiCR+B0TKiUpCTy33lRb8vwMME1AQjD5
   A==;
X-CSE-ConnectionGUID: H0uLBldZR4qxev9CYA7vSQ==
X-CSE-MsgGUID: iChV86qmTMii4Rh6novuow==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52948450"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52948450"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:32:52 -0700
X-CSE-ConnectionGUID: S6JnhU0zTam/HSX43Y4dCg==
X-CSE-MsgGUID: vpTNHpzcRQyDw/xK4lLDXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="157591549"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 20:32:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:32:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 20:32:49 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.73) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 20:32:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JToPd0Wz+fyhjlitwOCiQgZRyHh7ODMWy+knE+2s4itgP1QgWEp3BVYLRFuU7Ew4vL55ydXc2qgMV/hrBt/902oYCnLKSezhoZ4y/AwxpX8tMn91mfA/ZoS96TcPsdwKNc+COW/PI66yBG9kfJBifN4TOz3/D5ACmoF0jNHXJZ2KCHZ8f9sWc20OdVQZC+Jf3M4CBV+TvqlC5wSJ2NMVc8tP86sndD+ulgv9BZmDizxjuiMO365J8FkVToMO6aTxyfWm1oPBh8IqcvktDsw5y3f0KuNOqXLqpmn1e5rAdO3v3t2bdOY8aRxzrh5rJnuVd4q1uFyEwsm2j03l3Kzdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UPQiG0ZPzax3UqEZVsgjl0mw02np5k1rHy4c7C9AVs=;
 b=iZ6aiI/f3dKJ55SXGKOzRTtktLkl+LWW7xjvIhWfrbBlePznZc3XhWqBC2/ITJcJvifzjdZM17tptxMppb4lkZZ/sm0wzy1CbmhUKy5MCP0/X6RDaJDixm9cQN+pFpYR6iUxJ77YmTs80cfi0Mw5eVt4LFI1sE3T5YCzDtU4qRy4ygqXX5e9jhbUw9fEbNyd2BUDhC2lM0/xx5w/zQw/7nfl07CNsbbn+Cm4oW6KtrwdyKkaGo4d8W6ODk863O2EAMCEutcWOJ6rI43KyE0hmxHzbS1s5FDSQuL8tWpwfzmhDRxRE6+jRABqOFitSXUFbzVhWKYXTvin221NU4hW4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 03:32:45 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 03:32:45 +0000
Message-ID: <77ce3646-2213-4987-a438-a69f6d7c6cfd@intel.com>
Date: Tue, 24 Jun 2025 20:32:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 18/32] fs/resctrl: Add the functionality to assign MBM
 events
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
 <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <eea2cfb5b6231b322ab2194abfcd1ce335e2bdf5.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::35) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a8274eb-b5d2-4c75-7ff5-08ddb398f331
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dDB4WG8yZDQvSDBZRXFVR2N1emdHNlFycDJTZUtiQks0cjBFZWZnV3A1dzRG?=
 =?utf-8?B?bDlMYlpEOFQzeTdkWEZ3dm9ZeFQ4TkFHMkZ1Vnd5NnZIQWlWcUNsWTBydXVx?=
 =?utf-8?B?THV2eWIvdkh6MFVqdnNITG5aZzNjeThISisydlpLMyt2b0dvY25LNyttNWZv?=
 =?utf-8?B?OGFESTN2dkhHREtod2pXNFZuM0VBdm9HclhqRVhCNCtHUFFkNUVVWWtBOWw2?=
 =?utf-8?B?RXJTMmhBVkNkeW0zdGVMMEVsRGwzdDhiQmg4THI4djNWNEJ2TjBlWVFmZGM1?=
 =?utf-8?B?ZkFKL2xXY21TV0NjTjhoMHZXbWRWYUFvNjZZMGx1bStiNFNob3FMRjhOV0Za?=
 =?utf-8?B?eElqVEJiTDRtaXdIRFRIalY0bXFNaHVHcXAzbE8yZmZmOThhMlVBSGUxNmt4?=
 =?utf-8?B?WG9vd3VZdWtkbTZsWVpRS1pMQ0l1V05MNXRITWJnZ1hLdmsxOEtwdjdVTTVi?=
 =?utf-8?B?RVFtcW9sN2RjMmREbVhOUkpBb2dBbVBzajRBV1h4dXlWblQ5UkYyem4yWWgr?=
 =?utf-8?B?UlY3dVhMMnpQL1AzVVV6bktqeWlJcS8zS1IrSWh4ZlErVndhUkZ2a29JaXVG?=
 =?utf-8?B?djNpWC9FOVBJbG82RnFtVEhDT1dMSDM5a010N3VESlNXNzlOYWZXdlZHdGZ5?=
 =?utf-8?B?MHlkK2FhRitaWUtOMFpNQktVMHo2eXpjUXVFbnV0ZmhCbXVhL2h6eVJXRjRx?=
 =?utf-8?B?Tyt4a2xub2hYOEJ2WVVzWHZ0RVczQnh0eWlXRDB1VDA0VEYvcS83cDlDY3U3?=
 =?utf-8?B?alRYeHJCUEpYUll2ckhMRnZvYjIyYzVUYWlBSWdjVERRNkFtWDR5R1hrdmp1?=
 =?utf-8?B?YUQvUDlOU1JZbHp4dVF0ZWR5QkUzSElyRnlkaWRndkVncUV4cFJCajQvRVVT?=
 =?utf-8?B?czhJYk5EaFFwLzJNSk12NkVGVjR2bm9GNEdGdUlmcXlMMGYxYXhCQkZ1UVl1?=
 =?utf-8?B?MDBMZVdGNSt6ZzdOK0xyYzZhRzlPQThFbC9mSW5ON3hWK3dLUW1SVWtQQUtC?=
 =?utf-8?B?L1NmTUl6b1QrNU1NL2UzdlJyT0Q2bTlsTy8yVEFnaDhnZnNVcVRDdXRJUSs4?=
 =?utf-8?B?OCs2TENFOXB4QmthKzVPYmJhV0EwY0JQRW1XUnlIUVlZejlNS01iRFc3aE5S?=
 =?utf-8?B?NG8rTmc2R3R0cXBQbmJSL1IyMlZPVUhBZWRBVndNT0hlSTlhQVBSaDRSU2VU?=
 =?utf-8?B?Z2VYOGQzbXdvYzZMQnpjUjVySHVYY3NUSTV6ZUkvNjRrUUQzelZCME5wSGwv?=
 =?utf-8?B?TzIvQU5ubm5aSHVVL1cxZ3lFWG15UG83WHd2RzUxM2RVWDlRcTBxQ1VsdWND?=
 =?utf-8?B?Y2g4M0NOQUlTVkI2Ujh0NWdCQjRweGEyNWV2NVEzdThtN294VFRoQkVCc1Vw?=
 =?utf-8?B?dmp4bVFMSVRiWnNNcTkra2dsUEYrdVdHOWd0dDQ5cGVGRk81emNCWW1FSHBW?=
 =?utf-8?B?WkdTRmVDNGhUR01JK1dwK1hFaFJGeUx3b1pmcG45RWdkdDJENGszS0NRR0lp?=
 =?utf-8?B?WmJKdHB0Q2l5SXFqZWlQMVhZckUySDgwV2tVZlZpZkNuM1lhNTJUWHNrSlJL?=
 =?utf-8?B?bjVKUXdHcDVnak1nbGpDbi9iTit6SjdJd2NBNXNUK3Z3eS9zaWVsbnI1NDhS?=
 =?utf-8?B?M2RsRVZDNFpIVHE2OHl5ZzhRR2RqajFXdm9zcFZoTTRGWHBoRTN4Z2RrOWZD?=
 =?utf-8?B?TkMzbzlWVThnWWxrMUNDRmpBM2hLZUFCNlVrVGtmNVg5eWhoelIyN3hYQkNF?=
 =?utf-8?B?RkYzZ0RCOWR1akt0YnFnSlB0YjVBdTRTRStpeDJla3pjbkQxU3JZenFCZG5k?=
 =?utf-8?B?MDY3YUl1cmlJZGFQU0VBNy9mR28xa3EvVGdoMjdpOXcwRStLRVdYeWtFSmgv?=
 =?utf-8?B?YlpyYXF2SktoWmZZN1ZoNFdvV1pwcllRRTBmSEFWUzN0YVdieVBiYXJRaDA3?=
 =?utf-8?Q?i2EAqxGpc+Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEtSQndpakhHYk5neGx2TlFFQUlWdUNqMWxIY2h3Y045RWdNd01oNlhIcWlz?=
 =?utf-8?B?S2lwUVVQL0ZCanplbDYzSnNIVll3cXdlN0dtMEtlc1BCNXFHWld4YUhCbzc5?=
 =?utf-8?B?VjByamwvZVFCTy83WElWbHpVUmpBWDkvMldSUC9ySld3WThIbTRNSjBMZFNs?=
 =?utf-8?B?UmJPUUlZd21NbVprL09ENVRxY1plZnZzU2RBQ25hd0hGY3FkblVZN29Rc0dJ?=
 =?utf-8?B?c0hLNTBQOW5CR2poTU1EKzNLUjVZNE84SGVsemZicFBiK25pMVFoZHJOWS9U?=
 =?utf-8?B?WGZVQjZxY3RKa2x5dVV2SnRhVWJpR2pWcTJMWjNoZXJUTEE2TkZVaW5lY1V2?=
 =?utf-8?B?NDBYUzJjWlVIdzh3c09qaHZGM0xJOUVjdEUvdG9yZGRRTDFCQXpLWVlWZnVl?=
 =?utf-8?B?WFVtUTJCeit3T3lvWStMa29uQmNpZFN6MTV4SmVDZXVKZXQ1b0ZXS2Z3cDdX?=
 =?utf-8?B?UFVYUjBvV0JJSVhlNk9xbFVhNHVhbXRod0pjWmxvSDVEanNYNFRTNFgycGw4?=
 =?utf-8?B?TmVYTmUxSW5RakNWQ2FkUW1xVEIxRWR3cVlFU0VqSVg1L3lCL1N6WGhTVHJO?=
 =?utf-8?B?aDM1RUcrYW1VWTZsTGpBTVBTQlFRWXRobEVPUm5qVUxIV0xNeEl4THdLUUtv?=
 =?utf-8?B?dWRBWmhad2JFUTlCZGZwb203dVV1UHQ5bll2NHk3TG1seHFydnh1UldNanN6?=
 =?utf-8?B?Wm84K3I0M0djYlEyWjB5ZzFVbVZGeThKa3h6YkRUUHdObWFrUHdXdzhHeE1W?=
 =?utf-8?B?UDFJWlh5eDQ3QmVkbVBKZmlMdGFYWkc1alZHNnR0VDhhM3R5MXhFY0l2Q2ZL?=
 =?utf-8?B?dUJmUis1eHhRNGRYOG9kdHBHaWhQWmd5K3JEd1NPVW1iOFF1R2pURTJCTUpi?=
 =?utf-8?B?bUZJY2FrSkVNMHhhVlJPYjhyMkdPQ0hVSE9GMHg0NXI5TGlkK3kvdDcxNXNu?=
 =?utf-8?B?UFVGNWMvQW5OZ3FDNkpsdnlxaEZ5aWZHOVZTNDNIL3JqQkF6djQ3cWVqNnZF?=
 =?utf-8?B?SGxHeGtaaTBPUldQN1Yvb3Vva0d1Y2xQS2cvdWx6ZkNnVXEwSk5wdlRvdm5w?=
 =?utf-8?B?cC9aUG0zaDU1Zzl3TFkxUzlOMU1XQzUzUFRsRnhxempnTGErd3VSWUJ1Y3Ns?=
 =?utf-8?B?aWRXYmNGbEJPWUtkOXNSNWw3eUh0MmZ3MGdteFF5UFFmS0dsYkFZd2xIQXBn?=
 =?utf-8?B?cW1rTDJ0RWZnRVB5SmJUandCUXQvTzV6ZTUxK0FMaHdra1pRMXhoTXpIVjJD?=
 =?utf-8?B?VnNkSmFSSlBmMGh5MjM4S21sckd6ZzlVRUljWUVzNUtEdmJEOXJLOWJ4QVlY?=
 =?utf-8?B?ejBWeklXOGJsb3lHbkNxem1WbzhoOTB1TVg3d0lyVFZpUGp1MytzVG41c05Y?=
 =?utf-8?B?TXdadXE1Z0ZnMTJBa1E4cXN2aDdJSXJGZnlPUFQ4STFKMDVORjkyMVpHV2xD?=
 =?utf-8?B?SDRvRDluUkkwNlZRblFiSENCV0RmQlpNWUdaem85NmExY3lSSEJRR092WDFQ?=
 =?utf-8?B?V1kvZDBqaHVZcDhXS29WMTlVdTl0Uk9JTlN4eFpwTWo0N0tRYk5RNDluQkEz?=
 =?utf-8?B?dEo2WHYrZEwzQ0ZWRGcrWUlSSHdoMkV3NEc3M2QySVkyV2szMG1FSUJNTG0y?=
 =?utf-8?B?V1dURTlnd1RaQkRLMEVKR0svQ2VsV3ZEaG5WSnZEeUQ0UTA2ejZRM2NtRHFP?=
 =?utf-8?B?RlZOZDNWTWV3d1N2dWQ4blhVSnJsRmtWR2xEemhVbTVuMVY1akVBbmtzMWJI?=
 =?utf-8?B?clo2NEhKUlRyRk4zWmRHdnhwR0dHWG45ZW9MR2Z4T0xPZWpWeUV4RlNLOUVv?=
 =?utf-8?B?RXNXRDJ3NzVwMDlXVTZkbmdmd1J2S1RrdFpDRWxJUGxseVE3TUR3VDlNMmo5?=
 =?utf-8?B?aDVLdzIwSkRhbmVKWVdodVJxMWhGRFRlTVhMcWxYaHlqNGhYdWFnUVNNL0lx?=
 =?utf-8?B?d2ZKTWY2VXBNcTVmY1Zla1ptclAyRVJteWRLV284SmZRdUlhTFRFQjBqdTAw?=
 =?utf-8?B?d2ZiNkJYUkpDTkV1NWNaZGdhU0JhY2MwdEkrdTdRZnZsRzBwYytOcXpjOXBV?=
 =?utf-8?B?REFsVTVSVGZicXBZYUlIbkhsYllGRHZxcEtmcms0U281TlJFcDJYZUdWTHBK?=
 =?utf-8?B?dDd0NlBtejEweHJKWEpTOEZ1VktvNS9RVU5JWFRNZUIxQ252K1pqaHZXK2oz?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a8274eb-b5d2-4c75-7ff5-08ddb398f331
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 03:32:45.4136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TK1C5kO9NEvAlx1Rg5dBpMsFYVSCqR8Zif08i2ySf9MGiXnx7IXLnD5T2dWuR++mdIxw6USavtKFjCMuWONztwwHiyZMoYVa353MkXUdtII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> When supported "mbm_event" mode offers "num_mbm_cntrs" number of counters

"When supported, "mbm_event" counter assignment mode offers ..."?

> that can be assigned to RMID, event pairs and monitor bandwidth usage as
> long as it is assigned.
> 
> Add the functionality to allocate and assign a counter ID to an RMID, event
> pair in the domain.
> 
> If all the counters are in use, kernel will log the error message "Unable
> to allocate counter in domain" in /sys/fs/resctrl/info/last_cmd_status
> when a new assignment is requested. Exit on the first failure when
> assigning counters across all the domains.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  fs/resctrl/internal.h |   3 +
>  fs/resctrl/monitor.c  | 134 ++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 137 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 71059c2cda16..0767a1c46f26 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -386,6 +386,9 @@ bool closid_allocated(unsigned int closid);
>  
>  int resctrl_find_cleanest_closid(void);
>  
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, struct mon_evt *mevt);
> +
>  #ifdef CONFIG_RESCTRL_FS_PSEUDO_LOCK
>  int rdtgroup_locksetup_enter(struct rdtgroup *rdtgrp);
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 3e1a8239b0d3..38800fe45931 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -950,3 +950,137 @@ void resctrl_mon_resource_exit(void)
>  
>  	dom_data_exit(r);
>  }
> +
> +/**
> + * resctrl_config_cntr() - Configure the counter ID for the event, RMID pair in
> + * the domain.
> + *
> + * Assign the counter if @assign is true else unassign the counter. Reset the
> + * associated non-architectural state.

A few reports came through about the kernel-doc issues but I did not see a
discussion finalize on how to resolve them. I do not think it is required for these
static functions to have full kernel-doc. Just having useful comments without
kernel-doc style is valuable. Some kernel-doc syntax can still be useful though, like
above when referring to the parameters. It is ok to keep doing so even if section
does not start with /**. 

Where I think kernel-doc is important is include/linux/resctrl.h.

> + */
> +static void resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +				u32 cntr_id, bool assign)

If resctrl_arch_config_cntr() does not need a struct resource then resctrl_config_cntr()
may not either?

> +{
> +	struct mbm_state *m;
> +
> +	resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
> +
> +	m = get_mbm_state(d, closid, rmid, evtid);
> +	if (m)
> +		memset(m, 0, sizeof(struct mbm_state));

sizeof(*m).

> +}
> +
> +/**
> + * mbm_cntr_get() - Return the counter ID for the matching @evtid and @rdtgrp.
> + *
> + * Return:
> + * Valid counter ID on success, or -ENOENT on failure.
> + */
> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +

Since mbm_cntr_get() is called in regular flows, could you please also
add an explicit check to return -ENOENT if !r->mon.mbm_cntr_assignable?
Otherwise this is quite subtle with the assumption that
r->mon.num_mbm_cntrs is zero in this case.

> +	if (!resctrl_is_mbm_event(evtid))
> +		return -ENOENT;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
> +		    d->cntr_cfg[cntr_id].evtid == evtid)
> +			return cntr_id;
> +	}
> +
> +	return -ENOENT;
> +}
> +
> +/**
> + * mbm_cntr_alloc() - Initilialize and return a new counter ID in the domain @d.

"Initilialize" -> "Initialize"

> + *

mbm_cntr_alloc() will allocate a counter to a RMID/event pair even
if that pair already has a counter assigned. The doc should note that caveat
here with documentation that the caller is responsible for checking that
a counter is not already assigned.

> + * Return:
> + * Valid counter ID on success, or -ENOSPC on failure.
> + */
> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
> +{
> +	int cntr_id;
> +
> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
> +			d->cntr_cfg[cntr_id].evtid = evtid;
> +			return cntr_id;
> +		}
> +	}
> +
> +	return -ENOSPC;
> +}
> +
> +/**
> + * resctrl_alloc_config_cntr() - Allocate a counter ID and configure it for the
> + * event pointed to by @mevt and the resctrl group @rdtgrp within the domain @d.
> + *
> + * Return:
> + * 0 on success, or a non-zero value on failure.

"or a non-zero value on failure." -> "<0 on failure"

> + */
> +static int resctrl_alloc_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +				     struct rdtgroup *rdtgrp, struct mon_evt *mevt)
> +{
> +	int cntr_id;
> +
> +	/* No need to allocate a new counter if it is already assigned */
> +	cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
> +	if (cntr_id >= 0)
> +		goto cntr_configure;
> +
> +	cntr_id = mbm_cntr_alloc(r, d, rdtgrp, mevt->evtid);
> +	if (cntr_id <  0) {
> +		rdt_last_cmd_printf("Unable to allocate counter in domain %d\n",
> +				    d->hdr.id);
> +		return cntr_id;
> +	}
> +
> +cntr_configure:
> +	/*
> +	 * Skip reconfiguration if the event setup is current; otherwise,
> +	 * update and apply the new configuration to the domain.

When could "event setup" *not* be current? As mentioned in earlier patch
I do not see why mon_evt::evt_cfg as well as mbm_cntr_cfg::evt_cfg is
needed. There should be no need to keep these two "in sync" with
only mon_evt::evt_cfg as the source of configuration. I seem to be missing
something here, could you please detail this scenario?

> +	 */
> +	if (mevt->evt_cfg != d->cntr_cfg[cntr_id].evt_cfg) {
> +		d->cntr_cfg[cntr_id].evt_cfg = mevt->evt_cfg;
> +		resctrl_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
> +				    rdtgrp->closid, cntr_id, true);
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * resctrl_assign_cntr_event() - Assign a hardware counter for the event in
> + * @mevt to the resctrl group @rdtgrp. Assign counters to all domains if @d is
> + * NULL; otherwise, assign the counter to the specified domain @d.
> + *
> + * If all counters in a domain are already in use, resctrl_alloc_config_cntr()
> + * will fail. The assignment process will abort at the first failure encountered
> + * during domain traversal, which may result in the event being only partially
> + * assigned.
> + *
> + * Return:
> + * 0 on success, or a non-zero value on failure.

"or a non-zero value on failure" -> "<0 on failure"

> + */
> +int resctrl_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      struct rdtgroup *rdtgrp, struct mon_evt *mevt)
> +{
> +	int ret = 0;
> +
> +	if (!d) {
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
> +			if (ret)
> +				return ret;
> +		}
> +	} else {
> +		ret = resctrl_alloc_config_cntr(r, d, rdtgrp, mevt);
> +	}
> +
> +	return ret;
> +}

Reinette
