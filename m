Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6C419DF9A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 17:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744910180; cv=fail; b=Sbpy/bGBnyYZ2YZTk4cgVe2zW0qqhxvVBCssDDqzfFIASyAwVo2Nu30HF1pWNl9IYDYhyUOuwSH4CxS4Z2MRh33C3B2oo/jOhYEF+3A+Bo8BTdNedIrWBunZ0g3VLgb/kaYKags7yPPk5A5ZGdrFvS1UipJQ6iSYWI7XW6cK+Js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744910180; c=relaxed/simple;
	bh=dg5OUkF2TVO8AtUX/gNzMCsMbGoDkqf8If4ahLweT7U=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=iMLyCih+bOHvtOa1EkmdiDIUzvNvtla+VW9kJh/QbuqD0YNhLbnydWNP+dCr4kArV2tv1IphJD4PS2t+JJepuGy9hayQ+LknHf2oYZ1oLGEwPHf+j4MmMb45jFtJzyw7s3gOxhSTmukXbh69lzE0OWWdMeR6Xw7g3r8IftkkcDM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5OrRFSS; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5OrRFSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744910178; x=1776446178;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=dg5OUkF2TVO8AtUX/gNzMCsMbGoDkqf8If4ahLweT7U=;
  b=l5OrRFSSZnMsGE/HGbdd5EacYwfPSByVG5hZCKeGtUSpihVbN86Ov8vz
   Vkq1rWeGWOmJd8N+JaSRZJVr0T1aU/LjX6bTZAKrNvDtmI+IIeC3QQW8g
   tsYdW24ftI0Ooj8/A/nkcia8OIZMsVA/wgQp8lRBZyEP2WScaHvBg+dIt
   3usOZm9IgkOvMaMPb0a7XMKjCStesel/CmXqcgt3yOaZzXRQXD47jZGTt
   Tk08m81ZMIJ47adkWKGmzVnBJSJUCa4I6g3EmIdjTjvzEyxbiawWllDrt
   06SVnx9l6eSiHwcOmMKrXCra4Tx28oSFZdDcLAvQ7lhVyYcBtbwyaHu87
   w==;
X-CSE-ConnectionGUID: h+e2pGCvQFqHke6P7G0tKw==
X-CSE-MsgGUID: vluq0M1YRyy6tu5lxxP9wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="50171593"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="50171593"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:07:36 -0700
X-CSE-ConnectionGUID: 96VX1/wHQXSoEFQBMbx7OQ==
X-CSE-MsgGUID: mkFrIeizTGag8wZgANE9Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130812926"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 10:07:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 10:07:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 10:07:35 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 10:07:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GCK4/lMByGdjNTkd6wVJDWi7R0oP6Me2Nj/ePwyhC4adpvWpOXhlc/S6IXI6pHnqpDzN6F2ytfhiihmAU3O2+Qge5OeKd9KlCvMJd7tOEyP/zaNP5bwFiOAIHfqQlbmXYU0eTp1ABhAl8HVGm36abx+dhTEBYQiEC1BnibhZY9TGZu92hF5pGNXhMmYrAIu3QFCvUM+A+hlWW/ADTrHniwA+Ld+LQS5iC2YhdLPQujCTHhvb30SGzccJXAj8hIGnVcQXQvgzVeH8kOCEvG7eNtg3pD60SgboLtiGXSIwucFDOjMRvlhYSsO0Yf/g9kCbimF5WdpSbf8hxKWHtMojVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg5OUkF2TVO8AtUX/gNzMCsMbGoDkqf8If4ahLweT7U=;
 b=U3nYEy5Vo/KXFz/kvMaEg+3GaRXJVnXYjwUqKhXlEpzkpm4uxxGaAUh6CSSfX2INJhwdN82SvIj5R9AsuIUmMlBNnwjMexVK60cGX3OMkzUyJJzjmZz0keXRTiGD42sQKZCgiEA828yYa3ZDNLuPxBv/mqlUiFvgqQUQ+2AGv++jg0ZxRq2LOQO6/8zs8nl3uF7Q77DlAq/z6RRRXuuQLFIFCFM6uPbcqvMmS8Nz8lBp70RUkeiL9sA3tTP5aYVNYYNUEQ1QKfS7VGHuNKquMAlT9UzGnNXaQc/TrjH6OR4MWbOpehXkhZapD/Pk1MCBsjkmkaG6uzLaXHpWko7X/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SN7PR11MB7066.namprd11.prod.outlook.com (2603:10b6:806:299::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 17:07:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 17:07:32 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "Hansen, Dave"
	<dave.hansen@intel.com>, "Huang, Kai" <kai.huang@intel.com>, "bp@alien8.de"
	<bp@alien8.de>
CC: "ashish.kalra@amd.com" <ashish.kalra@amd.com>, "seanjc@google.com"
	<seanjc@google.com>, "x86@kernel.org" <x86@kernel.org>, "sagis@google.com"
	<sagis@google.com>, "hpa@zytor.com" <hpa@zytor.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "Williams, Dan J"
	<dan.j.williams@intel.com>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>, "Yamahata, Isaku"
	<isaku.yamahata@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "nik.borisov@suse.com" <nik.borisov@suse.com>
Subject: Re: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Topic: [PATCH] x86/virt/tdx: Make TDX and kexec mutually exclusive at
 runtime
Thread-Index: AQHbryPIQc8IA+YWOkSunFUCTSHsmLOoGCGA
Date: Thu, 17 Apr 2025 17:07:32 +0000
Message-ID: <974274f1d3db2ee470fcef14407b5c3e516fbcb8.camel@intel.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
In-Reply-To: <20250416230259.97989-1-kai.huang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|SN7PR11MB7066:EE_
x-ms-office365-filtering-correlation-id: e4d470dc-31f9-464e-a6ba-08dd7dd25790
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UFZVWnFVQ0Y1eUVpWGdudjgrdXcvdVBBL09VOC8zWGdGamlwd29WbnRMNTRl?=
 =?utf-8?B?QW1qOU92b3VPTWNNckVpUHdwTUZJditCbUxWK0JEZjNJSmFRcHF5akFLNkt1?=
 =?utf-8?B?NEJlRFI1UVJWekZFekUwcVN3R1dBVlFzMUVPOXVzNUdCdHdldmsxZFRFazEz?=
 =?utf-8?B?MFdkT29NM0hocnN4NHdYQ1N6VHpHMGVkem02dEZyUnoxZ04yUGoyQ3RVa2RN?=
 =?utf-8?B?b1dyOTRuRWVrRGFOR3BFanUxamdCQ1pGUkcxN2htQk1BQkZoaWRFdDFBZHg3?=
 =?utf-8?B?NHMvSkxxTXZ5clAyUzJSRzBWVVRyOWtyWFVLcEUzRUNHUGhNOEtsekFwaktR?=
 =?utf-8?B?ZjhidXpQZW9xazRHOE9id2JSMXJiQy9KSE9KdFBOYlp5ODd4ZW5abEFsbFYy?=
 =?utf-8?B?cTVSTGU2bC9EUi9XNXkvNjhBTjZCVUliMmFkTWs5M28wRVJWU09WRkFhRHdI?=
 =?utf-8?B?WnkycEhJMmNtRy8rRVF3M1BYNXdCTjB6S0owdnhJaTZGWVZBOFBLNWt6RGQ2?=
 =?utf-8?B?RnBEaFBOYktaUHZNMkxsRGhadlRTZDNoUFVtNEdhSWlOdmFSTHZFSHdLdG5i?=
 =?utf-8?B?WWk4akRVbzE3U3N6b0VQcVowdDFwOElNdWUzMU5NcDBxNnA4RW5UTDE5K3lr?=
 =?utf-8?B?bmhqMUcwc2tXVituZW5KdWt4enZyaEFYaTBmNU9lN1RiblE2V3hNWDN5aWsx?=
 =?utf-8?B?czhkd3lCUC82QlhHclo1L21rcng0eUpSSGowdE1va0hPczQyczhEQlZQOG5h?=
 =?utf-8?B?ME52SUxVVExKTm9ra3ZxbEpGY3d2Um41bnZhYmdBckVXSTRFRzBzZjRYb284?=
 =?utf-8?B?OXFONFpobVAwNTJCbGVQZ0ZNYTZzMmhBMkQzU3RXeVBJNmFQRUhMdW9Xampt?=
 =?utf-8?B?bTJGSXZabEZoQlBycitqU1Ewa1lidVZhUG5ydkFwTzV6MStHV3VncWwxTS9S?=
 =?utf-8?B?SE9taU1zSmUwRTluczVDVFIwMXpsdFVvRWpvRm8vSzduYTc3WVZGdDN5T2g3?=
 =?utf-8?B?K3FDeDV3VTYvK3I2V2FVRVBjTzlSVC9iRS8ra0lZOVlJZXJHUVlMWkVsL2pH?=
 =?utf-8?B?TExGZkFHUWJOYnlDd09OdDlHQWkwUytVREFBYXpaelhtNmQ0SHpOUlNoZEdz?=
 =?utf-8?B?cjc5cXpxZTNocy9rRlF3QU13Z3Z5NXdsYktIT0dBN0s2MHF6Y2pHQUYvNDFG?=
 =?utf-8?B?SGhyK3BWc3VYM3BuL3E0czErV2pmcElLWTRQTWNMa0NsUnArZFlPMVZnYS9p?=
 =?utf-8?B?eFJTQ0U3enRka2Q3VWxZV0c4NVhrc3Y1WlhMdDczYU8rQ0VuTmxRNG8vN2Rr?=
 =?utf-8?B?dVpGZkIvU3R6QzFWRDlMejBmR1p6VUhEQUUrVytIL0krc1ZsUythWUZkUTdM?=
 =?utf-8?B?N3owODhMWDdZb0dKYjJCVVhZNG13US9jclhqaFB1YTdudGRPbVNJWUkrOEVK?=
 =?utf-8?B?REs3SEhsUUNYYlVRQ291L0RnM3BhRktXNFh4dkZzT1dkcUhsci9OaTlIazZE?=
 =?utf-8?B?NC82NmE3bU9iYnc4aEtHWDE3S2xKd0x6Y1hYSDRyK0JSREo5UGY5NnBFWGY3?=
 =?utf-8?B?cVlTTkI1L2NqSVBjQTdKL0UyUVRIaDhPQ2VUWFduTFd3K2lObnkvL2FDWllG?=
 =?utf-8?B?T1o3MXRid0NyRDIrOEdJU1g5enFhempFdzMwQTc0RE9XcGdzRWJOdU0yTjNL?=
 =?utf-8?B?aUpldDc2cXdaYVFxSnd5azhuOWpCYVdjY055UXBYVTd5TTdrYWVVVWRNdGtk?=
 =?utf-8?B?RjcrVWJCQ2E0MzNTbzNZczJnM09SUHZVdTlxV0F5TXk0UXlITDR5emQzcldX?=
 =?utf-8?B?NjVDZTRjYkRMSittb1hEaitEeXJMSVUrYmN1bFdJVWZNMWNMdVI5eWh4TEhT?=
 =?utf-8?B?dFVtQi9yWU5pVlk2bUxGK0o0Q0RLQy9aZUZlWXp2aVh6SXdhZi80SFEzRVVu?=
 =?utf-8?B?Q1NsN1Jwem1Wc2J6S1NQS2NLWW9pYXZFTTJvQ2JoZTR6Ny82cnAxajhEajdW?=
 =?utf-8?B?TkFaL2tFUSt3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmVraWVBWXh3aEVndWFCSm1WdzBoVlEwclNJMC9vUEl1S1d2YXlCSU03MmI4?=
 =?utf-8?B?S2d0MXhrcEVBbnlhaEpWTEQrNjVtZWo0Sm5BdzlxY0xEN0s4SDloNmVhTHkx?=
 =?utf-8?B?ZTdWNnBLZm5UN0lKZHg0MDViQVh5Ni9HRUNZbEtGQUhuMTZoeXpIVmhoUDlL?=
 =?utf-8?B?VUptTzFFcGtIZi9hbjN3aDVpT0U3NDgvcDJCblMvQmpobVN0RUlncHFnS0J0?=
 =?utf-8?B?dWRWcXZ1MUM0b1YwNW9SZHBjeFljTEdzU28xdFFGNWgyempFUGtFMkpYYWtT?=
 =?utf-8?B?Z3loQmhsOWxOZVN4RWYxNmRpL1hheGwzQ2hQVWx2cU9QcWZ1bVpSdXlGUUk2?=
 =?utf-8?B?eSs4Z25rZGRrSS8waks0UHU0RGJteW5YUHVIRmxqSUtjY0NFdnZXVTVXUE5J?=
 =?utf-8?B?VlI0T3hBU05TY0d0TVdmTHVwUjVHZEJXeFlpUHZiQmZtMTZiT0phYnFudkxD?=
 =?utf-8?B?dzZDMjZ3MVB2TUtFYVFoUDRUeEEwZUp1eGxrTER0RFptcmFBSUxSUmpuYzk1?=
 =?utf-8?B?bTRlcHBkZEQyWllPZEFXZDc1YUg4UE5SRmtVdFVUckhnUkdWS1ZMSm54K1A4?=
 =?utf-8?B?Rm9mVmw2K3cxajdCaHdCNUtJbmRpU09OOUV0MkVWRXlxWThXaG5VWjJxTGli?=
 =?utf-8?B?SGUyeXNIT2tkVllPd3o3WHJ6SDBmZ3dZbG83cFVZK0ZtcnJicFJ5OElzazJr?=
 =?utf-8?B?SStTZjRXL1B3MFE3aHNsZENFNTJTemVzOE0xdVkxYWp4RVVmcWNtSHpSTHlQ?=
 =?utf-8?B?VkoxZ0VYcGJHeUVucTNwMWRwd25vdmg5c3pieGdLeTk1enFpZzg5OWMwRVgv?=
 =?utf-8?B?WWJNK09vNEVGTGIzVncvK3ZIdFU4WmRTZkhVbzhOYnR4Z0lOY0NjM2ZHZVZW?=
 =?utf-8?B?V29ySEhOSzEvRDJ0b25wZmZJbGhDRHphVHA2ZVFLUlVMMFhIRzRGNnU5VHYr?=
 =?utf-8?B?L29Jd1c5MUg2elMwcVRvWGorQW5lZ0JkZGxuZEYzaXBtcW42ZTRQZG55ajRy?=
 =?utf-8?B?NlRYb0YyRnYzYUVkQXlRZzBJem9oYytqKzduZTBJYVBpdkdvSHFwNXRVL2lF?=
 =?utf-8?B?N0k4UGhEWWpST2ZCano2RWhEbHJIZDRwZlRJMCtaeVRYN0x6cnhwSXZYWW9w?=
 =?utf-8?B?bjBHRDZLdWJtQkVEWHdSWEtlbmI5YXF5TlljZGR2b1BHNFdJS1VZS0VzVEtT?=
 =?utf-8?B?R3hydXdBZHhrQnZQWFFZUGUwSmlNZ2c4Rmo0am9qU3JwWU9MMEcyUUZlNTR4?=
 =?utf-8?B?VEZidWNhd0w1bzJVRitGMWtrek9hV2JWVWphcVBYaVVKOHNheE4ybUo4YWlv?=
 =?utf-8?B?dUMyVURmZUZpZHFKbDJFNk81dUI3SlRqR0ovUkhndzkveVkybCtmeHo5Z2Ja?=
 =?utf-8?B?NGtUbmZ1M1VMUVltaGU4ak9PRE5rd2tlNmtPRWxuc2VId2VYczArL0hYTUtX?=
 =?utf-8?B?MGxNUmNhMVRRMGFIaTVMWU04cTJYbGFseERxOFJCS1JJQUJmL2VtaVd2dE1h?=
 =?utf-8?B?QS9uS0kxWHVzeWIyaGNENjRzenY3TWsyVThPSXlKaXcrcHc4bVJnamdpRXMw?=
 =?utf-8?B?L21IMUJ3bnU2UkN2dk5jc1QveFZHTVZsWUtMUlBHRDFhYnVqRkhFajB5a3lH?=
 =?utf-8?B?OGFtWWRmU25Vc0JFSVc4cUFUT0pzUGxEaXgrVXJYUVQ2TGJCOVo3Rm1JRjMy?=
 =?utf-8?B?cVVoejgwOGVSM0tKWStDWng1YVpidkpMRnRmYmt5TWJacnRpdWZnS1ppc1hI?=
 =?utf-8?B?MXZucWRwZDEzaXlPTWNxK1ZFQzh0SVEwNDJGMFVDeDZQZFNxV3BNVGN0bzds?=
 =?utf-8?B?V1VVa1ZVeFQrTGtBZ04vK3o0di8ydmd3RFZoaDQzaTdYWndDak9HQW0xK0tX?=
 =?utf-8?B?Sm9SNVZWVE9iOUNmODZlWExxOE04TFZFY1pWSW1ST2E1blBUN3gvR0ZzbDZO?=
 =?utf-8?B?ckw4ZnlDUXRPSTFwMHZiSnhUOEdndlJjckxCREY3OGJHZTRGL3dpRWg5cnBN?=
 =?utf-8?B?YUlmTUFIM0xLUHVSelpVamE3a29wTmdWY0toOVlVcWp2OHQ2TEJIRzZseFo4?=
 =?utf-8?B?ODY5Y1ZqSTROZmF0YTZ3a0RxVHloMDlTVG1kU0t6MWJrbW9xKzduTFkydXZs?=
 =?utf-8?B?a0EvdmJPd3U0ZFg2aUN6QjhDTTFIaXlwSUZjK2haM0lKUTFLUXMyZkMrMUJT?=
 =?utf-8?B?eGc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3E8D862878A3DA458B832A948AA319A7@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d470dc-31f9-464e-a6ba-08dd7dd25790
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 17:07:32.1610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Y8t8VPTIhESpbnCfzu1bQqnqGA8H065f2bOHBAIm3EBTC5lwBY8uqYtkHcUbq2GtcNDZhdZ/+n9G5wDPm7/GpSdsFPtQ3J7nz/NvTff1No=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7066
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDExOjAyICsxMjAwLCBLYWkgSHVhbmcgd3JvdGU6DQo+IEN1
cnJlbnRseSwga2V4ZWMgZG9lc24ndCB3b3JrIHdlbGwgd2l0aCBURFggaG9zdCBzdXBwb3J0LCBh
bmQgb25seSBvbmUNCj4gb2YgdGhlbSBjYW4gYmUgZW5hYmxlZCBpbiBLY29uZmlnLg0KPiANCg0K
Tml0Og0KIm9ubHkgb25lIG9mIHRoZW0gY2FuIGJlIGVuYWJsZWQgaW4gS2NvbmZpZyBhdCBhIHRp
bWUuIiB3b3VsZCBiZSBhIGxpdHRsZQ0KY2xlYXJlci4NCg0KPiAgIEhvd2V2ZXIsIGRpc3RyaWJ1
dGlvbnMgdHlwaWNhbGx5DQo+IHByZWZlciB0byB1c2UgYSB1bmlmaWVkIEtjb25maWcgd2l0aCBh
bGwgZmVhdHVyZXMgZW5hYmxlZC4gIFRoZXJlZm9yZSwNCj4gaXQgd291bGQgYmUgdmVyeSB1c2Vm
dWwgaWYgYm90aCBURFggaG9zdCBhbmQga2V4ZWMgY291bGQgYmUgZW5hYmxlZCBpbg0KPiBLY29u
ZmlnIHNpbXVsdGFuZW91c2x5Lg0KPiANCj4gRnVsbCBzdXBwb3J0IGZvciBrZXhlYyBvbiBhIFRE
WCBob3N0IHdvdWxkIHJlcXVpcmUgY29tcGxleCB3b3JrLiAgVGhlDQo+IGNhY2hlIGZsdXNoaW5n
IHJlcXVpcmVkIHdvdWxkIG5lZWQgdG8gaGFwcGVuIHdoaWxlIHN0b3BwaW5nIHJlbW90ZSBDUFVz
LA0KPiB3aGljaCB3b3VsZCByZXF1aXJlIGNoYW5nZXMgdG8gYSBmcmFnaWxlIGFyZWEgb2YgdGhl
IGtlcm5lbC4gIEl0IHdvdWxkDQo+IGFsc28gcmVxdWlyZSByZXNldHRpbmcgVERYIHByaXZhdGUg
cGFnZXMsIHdoaWNoIGlzIG5vbi10cml2aWFsIHNpbmNlIHRoZQ0KPiBjb3JlIGtlcm5lbCBkb2Vz
IG5vdCB0cmFjayB0aGVtLiAgTGFzdGx5LCBpdCB3b3VsZCBoYXZlIHRvIHJlbHkgb24gYQ0KPiB5
ZXQtdG8tYmUgZG9jdW1lbnRlZCBiZWhhdmlvciBhcm91bmQgdGhlIFRNRSBrZXkgKEtleUlEIDAp
Lg0KPiANCj4gTGVhdmUgdGhlIGZ1bGwgc3VwcG9ydCBhbmQgdGhlIGRvY3VtZW50YXRpb24gY2xh
cmlmaWNhdGlvbiBmb3IgZnV0dXJlDQo+IHdvcmssIGJ1dCBzdGFydCB3aXRoIGEgc2ltcGxlIHNv
bHV0aW9uOiBjaGFuZ2UgdG8gbWFrZSB0aGVtIG11dHVhbGx5DQo+IGV4Y2x1c2l2ZSBhdCBydW50
aW1lIHNvIHRoYXQgdGhleSBjYW4gYmUgYm90aCBlbmFibGVkIGluIHRoZSBLY29uZmlnLg0KPiAN
Cj4gV2hpbGUgdGhlcmUgaXMgYSBsaXR0bGUgYml0IG9mIFREWCBzZXR1cCBhdCBib290LCB0aGUg
a2V4ZWMgc2Vuc2l0aXZlDQo+IHBhcnRzIG9mIHRoZSBpbml0aWFsaXphdGlvbiBhcmUgZW5hYmxl
ZCB3aGVuIEtWTSBpcyBsb2FkZWQgd2l0aCBhDQo+IHNwZWNpZmljIG5vbi1kZWZhdWx0IGtlcm5l
bCBwYXJhbWV0ZXIgKGt2bV9pbnRlbC50ZHg9WSkuICBVc2UgYSBzaW1wbGUNCj4gcG9saWN5IHRv
IGRlY2lkZSB3aGljaCB0byBydW46IHdoaWNoZXZlciBnZXRzIHJ1biBmaXJzdCBkaXNhYmxlcyB0
aGUNCj4gb3RoZXIuICBUaGlzIGVmZmVjdGl2ZWx5IG1ha2VzIGtleGVjIHJhY2Ugd2l0aCBURFgg
d2hlbiBLVk0gbW9kdWxlIGlzDQo+IGxvYWRlZC4NCj4gDQo+IEtleGVjIGhhcyB0d28gcGhhc2Vz
OiB0aGUga2VybmVsIGltYWdlIGxvYWRpbmcgcGhhc2UgYW5kIHRoZSBhY3R1YWwNCj4gZXhlY3V0
aW9uIHBoYXNlLiAgU3BlY2lmaWNhbGx5LCB0cnkgdG8gZGlzYWJsZSBURFggcGVybWFuZW50bHkg
ZHVyaW5nDQo+IHRoZSBrZXJuZWwgaW1hZ2UgbG9hZGluZyBwaGFzZSBieSBsZXZlcmFnaW5nIHRo
ZSB4ODYgdmVyc2lvbiBvZg0KPiBtYWNoaW5lX2tleGVjX3ByZXBhcmUoKS4gIElmIFREWCBoYXMg
YWxyZWFkeSBiZWVuIGVuYWJsZWQgKHRodXMgY2Fubm90DQo+IGJlIGRpc2FibGVkKSwgZmFpbCB0
aGUga2V4ZWMuDQo+IA0KPiBUaGUgbG9jayB0aGF0IHRoZSBURFggZGlzYWJsaW5nIG9wZXJhdGlv
biB0YWtlcyBpcyBub3QgaGVsZCBkdXJpbmcgdGhlDQo+IFREWCBwZXItQ1BVIGluaXRpYWxpemF0
aW9uLCB3aGljaCBoYXBwZW5zIGJlZm9yZSB0aGUgbWFpbiBURFgNCj4gaW5pdGlhbGl6YXRpb24u
ICBUaGUgY29uc2VxdWVuY2UgaXMgdGhhdCB3aGlsZSBrZXhlYyBjYW4ndCByYWNlIHdpdGgNCj4g
VERYIGluaXRpYWxpemF0aW9uIGluIGEgd2F5IHRoYXQgd291bGQgbGVhdmUgcHJpdmF0ZSBtZW1v
cnkgaW4gYSBzdGF0ZQ0KPiB0aGF0IGNvdWxkIGNvcnJ1cHQgdGhlIHNlY29uZCBrZXJuZWwsIGl0
IHdvbid0IGV4Y2x1ZGUgdGhlIGNhc2Ugb2YgdGhlDQo+IFREWCBtb2R1bGUgYmVpbmcgcGFydGlh
bGx5IGluaXRpYWxpemVkLiAgSW4gdGhpcyByYXJlIHNjZW5hcmlvLCBURFgNCj4gaW5pdGlhbGl6
YXRpb24gd291bGQgc2ltcGx5IGZhaWwgaW4gdGhlIHNlY29uZCBrZXJuZWwuICBLZWVwIHRoZSBz
aW1wbGUNCj4gc29sdXRpb24gc2ltcGxlLCBhbmQganVzdCBkb2N1bWVudCB0aGUgcmFjZS4NCj4g
DQo+IEFub3RoZXIgb3B0aW9uIGNvdWxkIGJlIHRvIGhhbmRsZSB0aGlzIHdoZW4gdGhlIGtlcm5l
bCBhY3R1YWxseSBkb2VzDQo+IGtleGVjLCBidXQgdGhpcyB3b3VsZCByZXF1aXJlIGFkZGluZyBh
biBhcmNoIGNhbGxvdXQgZm9yIHRoZSBvcGVyYXRpb24uDQo+IERvbid0IHB1cnN1ZSB0aGlzIG9w
dGlvbiB0byBhdm9pZCBjb21wbGljYXRpbmcgdGhlIGtleGVjIGNvZGUuDQo+IA0KPiBJZiBURFgg
Y2Fubm90IGJlIGRpc2FibGVkLCB0aGUgdXNlcnMgd2lsbCBnZXQgYW4gZXJyb3I6DQo+IA0KPiAg
IGtleGVjX2xvYWQgZmFpbGVkOiBPcGVyYXRpb24gbm90IHN1cHBvcnRlZA0KPiANCj4gVGhpcyBj
b3VsZCBiZSBjb25mdXNpbmcgdG8gdGhlIHVzZXJzLCB0aHVzIGFsc28gdGVsbCB0aGUgcmVhc29u
IGluIHRoZQ0KPiBkbWVzZzoNCj4gDQo+ICAgWy4uXSBrZXhlYzogRGlzYWJsZWQ6IFREWCBpcyBl
bmFibGVkDQo+IA0KPiBJZiBURFggY2FuIGJlIGRpc2FibGVkLCBhbHNvIHByaW50IGEgbWVzc2Fn
ZSB0byBsZXQgdXNlcnMga25vdzoNCj4gDQo+ICAgWy4uXSB2aXJ0L3RkeDogZXhwbGljaXRseSBk
aXNhYmxlZA0KPiANCj4gVGhlIHJlYXNvbiB3aHkgdGhpcyB3YXNuJ3QgZG9uZSBlYXJsaWVyIHdh
cyB0aGUgS2NvbmZpZyBvcHRpb24gd2FzIGp1c3QNCj4gYSBiaXQgc2ltcGxlciBhbmQgdGhlIFRE
WCBjb2RlIHdhcyBsYXJnZS4gIE1vdmluZyB0byBtdXR1YWwgZXhjbHVzaW9uIGF0DQo+IHJ1bnRp
bWUgaXMgYW4gaW5jcmVtZW50YWwgaW1wcm92ZW1lbnQgdGhhdCBiZXR0ZXIgbWVldHMgdGhlIG5l
ZWRzIG9mDQo+IGRpc3RyaWJ1dGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBLYWkgSHVhbmcg
PGthaS5odWFuZ0BpbnRlbC5jb20+DQoNCkkgdGhpbmsgdGhpcyBpcyBnb29kIHNvbHV0aW9uIHRv
IHN0YXJ0IHdpdGguIEl0IGhhcyB0byBiZSB0aGUgc2ltcGxlc3Qgd2UgY291bGQNCmRvLiBXZWxs
LCBleGNlcHQganVzdCB0d2Vha2luZyB0aGUgS2NvbmZpZyBhbmQgZG9jdW1lbnRpbmcgdGhlIHJh
Y2UsIGJ1dCB0aGlzDQpwcm90ZWN0aW9uIGxvb2tzIHNpbXBsZSBlbm91Z2ggdG8gYmUgd29ydGgg
dGhlIGNvc3QuIEl0IHdvdWxkIGJlIGdvb2QgdG8gZ2V0DQpkaXN0cm9zIG9uIENDIHRvIGNvbmZp
cm0gdGhhdCB0aGlzIGlzIGFjY2VwdGFibGUuDQoNClJldmlld2VkLWJ5OiBSaWNrIEVkZ2Vjb21i
ZSA8cmljay5wLmVkZ2Vjb21iZUBpbnRlbC5jb20+DQo=
