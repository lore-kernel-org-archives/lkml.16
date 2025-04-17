Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C363263F42
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744914095; cv=fail; b=HXPDy3+RrixNRnJZmcOjrTtyRNLqjTVaLthPi0Htlvs/Df2e3vonPfYN7XBuF9yv0BFxY9WfaO2W4lX0lnzvhfzxEXted2gyG0d3xgka+BEDY4mtUeRCbjkfVRPaouajx4Q1JAg+w2pm+tJY9lw88/ebTPV7yQiLzobWcVBjwpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744914095; c=relaxed/simple;
	bh=uegL8l9Cd6hB3N1MRizpfgA8b7V+sSvRjhKahuN9KIU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jFMIwo24HA34sfwFyHMsXdSCZdLan1afSpmh1hVM6axmQuTqpQ9FjnOxM8VWU8/jJiVCyQesrdLhsUVBos1H8z4XiBT3ecvmpM3BiQ6g0qWlOPNLdJTZRXMxjCLsVKNxhiVjTGeBdJZlfEmeNyj+b+T6PZtGr4q3SQfk2go+KWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9OROK58; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9OROK58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744914093; x=1776450093;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uegL8l9Cd6hB3N1MRizpfgA8b7V+sSvRjhKahuN9KIU=;
  b=P9OROK58l3pgn6rtJqThlM4wTaga2UVYz6SzEhNxAa8ivV/AStM6+fC0
   eqzsI5WMxxLF78RZMc02llKVDDtUSanSopa5uNzJOmeldxzUBhZ1dbNQX
   yznMF9Jap66QTeHQNzNlBnES2lE5/M2/bm0kkCTsjnMN5RyGx64rnOiOZ
   FnUY9PUUYj0xWjKGk6COii64fZo4GeLLHJZ1fKH4BqIZJSk7bkP/SfbDK
   BcPnEQ5xmSQThXVzeamqRO660ov6tt6stcCy8hZilExAnLKyEcSRRnFj1
   BF4sfhNQSwgJu9lDWXf+dsBchMC2e2aLwskn2azAJ3sHKcNIdiyTiYFLH
   w==;
X-CSE-ConnectionGUID: /HSBJY1+TU+NjkoyOBbpFA==
X-CSE-MsgGUID: XeMJjVTdR5yvy2UYKGOXHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="46447357"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="46447357"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:21:32 -0700
X-CSE-ConnectionGUID: wdkz4N5jRtWMpPyDBc6/zA==
X-CSE-MsgGUID: e53xHSzMRHKkTE7EqULa2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="131202273"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 11:21:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 17 Apr 2025 11:21:30 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 17 Apr 2025 11:21:30 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 17 Apr 2025 11:21:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIhDq7PMyYNTp2lsYYrcb+stb6izX34NUyU4C+ZklLDASYPPW6hY36m4QDIvpNPYT+r/wFO/KIggLI5Uwm879aqNdxJWKCyVTTcw4h1WJQ4pjbXplMFMesmrfQ0z8Tz64942Ylxs5L1dp/vl6oo9hc/mZRTD+fKnO4458TK6ydy4qHkLux8UtHKAXOsUJdpqm08VKwoDqD27+rwPoxAWloKJrQTXnCPmDG8im2JKlO2sZN5pDKzsprl0qHXXTFhQ0uJ3r2hwflTTPwvcydqY2scYSF/PUgnmRkHMZmZPHXGrLNFh/6BAI3hqQ9yMP90vdXp4JCqu+PZK4U3VyUbaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uegL8l9Cd6hB3N1MRizpfgA8b7V+sSvRjhKahuN9KIU=;
 b=XLxLDojS/GCMLdWhz16CYJpf3OpkSgCouxjwyzeLrWJQGzUmft9+IsvWxsY7R3Jpy2KcSJjsVZ4oZu8pc3lHjFx+y299yHSHILGmCkhhS/DprnJ1zJW1drnYOnpXQXgbz1CjzFpDfUB+U4HhQqOVoVkSurzGGkNwDtpFsovfoumWnhpm8BZKZOCtlVkOOOPRA4zwryWG7DMIzYvZ2b7G6PirCPrxOhTaWu12AszKa+Ttc4tqb3YqcHhQMp52toJD2DTfeu+k+GmLwVtcxPkLnXzXRsNwrKWa1dI5cDJHldKcrlzAdfEnVK//51RDh86OPBg9rqwwefwHVd3rF3mrWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Thu, 17 Apr
 2025 18:21:13 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8655.022; Thu, 17 Apr 2025
 18:21:13 +0000
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
Thread-Index: AQHbryPIQc8IA+YWOkSunFUCTSHsmLOoJAYAgAAIsQA=
Date: Thu, 17 Apr 2025 18:21:13 +0000
Message-ID: <ea0b0b1a842ad1fc209438c776f68ffb4ac17b9f.camel@intel.com>
References: <20250416230259.97989-1-kai.huang@intel.com>
	 <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
In-Reply-To: <7bd03311-0c4c-41e6-b6dc-803b6455f170@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|PH0PR11MB5783:EE_
x-ms-office365-filtering-correlation-id: acee2bd3-2d3a-4e9e-fb52-08dd7ddca2c5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?U2Q2bEoyQUdmZldDKzVPOERoSVptTzhPeTNlWVNkUTc0UHNiU2dPTUFKd2cz?=
 =?utf-8?B?QTBsbjBBR0VMTUdBWDlGOWNjWWVxdnhMQ2NtYTAxV0lxcTNKZklmM2Q2UVha?=
 =?utf-8?B?WVpBK05acTIxUHE2aDBQZG9sOXg1eDUxQ3haWTY5OXA2emJqK3llWGRNZkZy?=
 =?utf-8?B?a0NKZml6MnlZaDMyOXVnNDIvK2xJSC9HMlVqa3F6bkFodm54WmM3Y09yZjFq?=
 =?utf-8?B?RkVXVkUwUnJYQnhkbGptbnlmSjRFS1ExcEtHb0MzSFR2dFF4QURFWUtXVHV0?=
 =?utf-8?B?aElKU01FZzgzZTdHYm9EU1huUHYwaDBNMkVGaTJqK1NxYUlycGVMcEtIL2xt?=
 =?utf-8?B?VllISWNjTFdhL1I3bWhZNk9aZ3ozNDhGaXUvald0VDM2ckFJTHdiYXQ3R1Nu?=
 =?utf-8?B?SVQzR1pEbnNmN2QyRnhKeFlVdzNrQkcxdmlHYmJxbXJ6RUU1NFV4NjhtR1cw?=
 =?utf-8?B?VGNyMGUwSHUrd1ViYUc2aytua0Z5d1NnT29IUGQxQU1QT3ExS1pJdWRSb3U0?=
 =?utf-8?B?andKUnVaUVZkVklYNWtsc0ZJMHhFQ2IrNmVsb0tSY280SGt3YlpHb1hJR1NY?=
 =?utf-8?B?QlJaWWhCNVlNSzFVMEFNTEdsdTZzZGRHcmQ2UysxQ3poMjgxRjhabU9FU3VK?=
 =?utf-8?B?T1lGL3hTdXFON0lkcjRCR2M5QUxBMVFrb3VxVnoxOWswb1BvODExVGl6N1pJ?=
 =?utf-8?B?dzNaSzdrV25RYUFwREVIWVVqSDV2U3pNUUJBRVUzNERQRUVuSnlVU3Vwam9j?=
 =?utf-8?B?S2EvYjdOaHhIM0JZaXI2YUxHeXhmb3BQcTZBZGZ5RnhicGZaUGRiakdLbzhJ?=
 =?utf-8?B?NUdIMEpqNER4dXNFZGQ1K2Fyc2trbnRzZ1c4RTJiUUJhY0tnZEIwekpDRmxG?=
 =?utf-8?B?SHFsSExmVkNzL2lXS3FpWWZYN09qUFFkNk5xRStrSWx6aEJzU1dUZlRDNnR1?=
 =?utf-8?B?T1JkeEdyUlkwdUxTSUozajh1SkJsMXh0cURRRFdOTUlML2FOL1dyemU3bkd1?=
 =?utf-8?B?SUY3WWpxRVhVZXRrL1NKUHpZVEZ2L2h0K0xyNzRRRUVsVm5sQmdqUENKMlgw?=
 =?utf-8?B?aFQwc3FnWnhmdmtQbzVzMFNWUWUwS0VNRjZzWHNGZDgrRGFjc1VPUjV2Mm0v?=
 =?utf-8?B?SXBMd2VnU3B1UjR4TDdyQ01WcllMZ2N1dzQ4ajBrUFo3aVNuRkRuYU5SZU5z?=
 =?utf-8?B?OUNrMHdtZU16aHpTak5zMGdYL21PN2lBL25hdWh1c1B0c0xaaFcvYnZWMURy?=
 =?utf-8?B?UUE3T1JzOUZ6V2gwRkNDTmNHT1RSUUhqNEQyd1BoTGJpV2Fwb29JYTFtWDJa?=
 =?utf-8?B?RzdGaThRL2lRUGp3QVpELzVVRWJYOEdYaFFsSkJBK08rL2JFak01L1E4RWc5?=
 =?utf-8?B?R3BCNWhNQkRTSHNvb0F4QXJtdGdDMFhnRzdyMW1WOGpOWkd1K3ZRYXNNcmVE?=
 =?utf-8?B?RHF5ZERwWWxRVVFhNndOZ2RvT0NrWE1uaTNmeWwxY3ZlRjZKdEgzaHdrdWRm?=
 =?utf-8?B?U2p2dlNBWmZqMnNVY1lzemh4V1JUUDdwOGs2MXMzK1FERHZMbUpURlU5Q1hm?=
 =?utf-8?B?cFlUektNZmhGWHc4SUYwSEZwNlpRa2xZY0FSb2V1VWxMSHk5VG9DV3h2NUx0?=
 =?utf-8?B?L3Q3RHNsT2w3Z2NVWi9UeDcrMmdkejdmek5Qc2NiKzg4azdnbWM1UGx6YUtw?=
 =?utf-8?B?SUVhZ1J2cWFBZWgyZDliOXk0ZzVRWXVNOVcvajgwenM4bDRtazRTSHhORzFx?=
 =?utf-8?B?SmdodENxU3NjVy9DZHRLbnp0QzRzQVpUQWR3cll4eVFWY1o5UUxIVFd5cTdF?=
 =?utf-8?B?RHF0dVB0N3AraVlEa3B0bGJtY2hNRlhMMkZyTnlVSkRveCtLMTN1Rk1SbVFP?=
 =?utf-8?B?MTRuK3NUcCthMWFSMEpJbnVsR2pJUVZVSFMyN1RkbnB4TFFzVFdpMjBwMi9F?=
 =?utf-8?B?YVNwbGdRcjhwTDZzM0dva0gxOTlhUjlwWXBjMnhpaFVtSlZUdVEzV1hVU2xt?=
 =?utf-8?Q?RCD9xkrS+oOC32FYC6TpYrB7Iu0JMU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Vk9rYlNTL1piakNiRXo1aXYzaXJhYVNxWVdZcVpyTG9ZUWREWjBsVjRva2dy?=
 =?utf-8?B?OUNCSitQSk9xejhYY3Z0dWVyZVhKS3p3TXNCMVJON1Q5YWx1aXZKa0dXcTha?=
 =?utf-8?B?RjAxVFR0dHFkK1hBM0lJR3RTdFNtS0RZVG00UVpZQWpHb0Q2QytXdUJ1dDRD?=
 =?utf-8?B?b241ckxNNEp0N0Ivb0h3RWU4TGdZdzc3bGkvSEtmL3JoRG9QKzBncTBGaFlJ?=
 =?utf-8?B?UTI5KzVsOFJmd1VEdXBqcFdPWjRxNCsvazZ6ZThWdkRXL0FEOHIvaENKbkVL?=
 =?utf-8?B?b1pOM2pFNEkyUTd4VGE4cUlndUtwaHdMSk9WTVJIaGdEUmhrYU5HREdnKzdl?=
 =?utf-8?B?UUg4aTdUZGF1aTZnSGw3YkNlOEtLNFAwVWx4T2ExcmVJQ1dwWkdGNTB5b3I0?=
 =?utf-8?B?THNndFR1bGVpamJ1OTBYSk1tRUZkcnUrTmFOZDFuOEJqbTBzZTVTaFFxZVhT?=
 =?utf-8?B?dmpuQUtwTkV5Wm5YL2VGeUw4dm9USEdPNld6Z1lST3E5bUJYbTlzekpMZm5y?=
 =?utf-8?B?d1dURW5naW9DaUd6K3ZQeUxobGRQbmtmN0ZlYUlKSHYydFYyVXJrYmdMTnQw?=
 =?utf-8?B?QU8zL2hGTzVsU01MNWFvN3BmZVRrc3ViNzFZNnR2Sm91eE4veU51cDk0SkQx?=
 =?utf-8?B?UEU0NFpVWW80ZE5hK3dDdDlNSHZWZFFHUDNiV0JncVJ1cHg1enFwWW8yZFFM?=
 =?utf-8?B?MzYyLzN3K1RpWWU2N3FEdGVrVmhWRXIvWCsrTmRmeHdCWEZsZW9heVRuYy91?=
 =?utf-8?B?ZnJtZWdEc1NGUkovbU9mblVrbDFhb0ZEY2xnL0NwMkZZZEZzVVl2dHJoeThw?=
 =?utf-8?B?WitMWENWQ1E1Z0dQdjN2bnB2T285TmoxY0ZSa2N5elN1M0tDYlMzc1lXMnB0?=
 =?utf-8?B?VmdZVXpiN1pWN1BuZ2w1K1BWSHdZYWVtYjFtbVdxVFhtRm4rTUNCOW1WdGg0?=
 =?utf-8?B?SlZONzZSanFpRDlyUy9vekhPRWY1RGg1Nm9BbkRRSWZmdkRLMTdHME5HZ2tj?=
 =?utf-8?B?NHNjRjdiLzZvK1lUM1pHK3pmRFJFUjc1NG5MbnNyK290NFZGU1Q1cTlwaXZ4?=
 =?utf-8?B?cnNmc0RVR3F1RHNKK3kzeUVqYzNlUndFWk1CVlpIdE00RXlEa2hNVVhmUC9R?=
 =?utf-8?B?N3NmTEtKdFlRejNlbUxsU294Qy9udE02M1dTUkZuTW9mTkNYamFOV2djYWdn?=
 =?utf-8?B?b0IwclIrUExjekdUZ3AyVFlldnZoS3NBTWJ2SE9yOGoyZk11a05hZ3Vqc3BW?=
 =?utf-8?B?b09zS0JhZFo5Q1BMdW8yZ0JHaHZpSkcvN040Q2lTZkpKZTRYMnBhNm4zdy9Z?=
 =?utf-8?B?aGlvd1VYcnJQSiszeDF6TDQyT2hKNXF3ckJIaGpEV1BJUERNQ201VXhsejZv?=
 =?utf-8?B?TXdlaThWTit1NFVBeHVyVmJCdTNEdnQxanVNOTV5NEhQZGhMajdtbVBWTlFK?=
 =?utf-8?B?dVU4R0lPdnFzb2JjR2I0MGRZYTA4VmNtVXBxK1AxWXM0NGlpanhRa1E2enJh?=
 =?utf-8?B?L0l2N2hZelZOWHA3YjBqSStNaWIwZHdPekNHbVpRTlp3K0doVFdhUVdKcTlr?=
 =?utf-8?B?ME1GQUF5akJ6S0VXNXppdmY2bXV5RGhsYjBqVjIrb2RqcTgyczRVZlpyNlgv?=
 =?utf-8?B?Vm9lOHFLSkYyTGQrd0U4NlBiV0NxQlN1dGtxSStVZ29OMTBwNFBKUmxNMGFO?=
 =?utf-8?B?UThYRkVuQ1NBazRuOWkrRzJ0ay8wb2krZWFzS2EvejRRMjlIeUJLRzdrazJB?=
 =?utf-8?B?MWtUWTE3YUx1ZVJCeGRwL2pYYTRaUEdTTHZIK3pBZDFxVmJwdW5MbkF4ZTF0?=
 =?utf-8?B?N09BaDlwR0RlcDhTK1VMSjNZZlhaODNwT1ljQVBtSEFkMzgycWp1WUlsUVFX?=
 =?utf-8?B?aUp3ai8rMVcyT2tHMVo3ZnZRRjJvQzhIcXVGUTU3VmlTdksrVjZRY2xJRXVk?=
 =?utf-8?B?cjJRc0dFUXVvV0thMitEMWw3TlA5dzUvY3VPSjFVcTBNUnkwc0NURnlFcC9M?=
 =?utf-8?B?YmtSZW04RzdWV3V1bWFycVhOeG1FMEZrcFlkNzIvL3ErRU9EMEluemp0Q2M5?=
 =?utf-8?B?N0hGZ1puSTAyQUhOQU1KWHgxdnZwK0kzTmhCYkxNR050eTZxVE80Z2QxQXRI?=
 =?utf-8?B?NTJFcTVGV1Jmd2Njd1VNbzRGd0pjdno5cTErWDlCQTBpb1Jqc2NZdXNpeGI1?=
 =?utf-8?B?Nmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C3E95D98EF088488357605C04694113@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acee2bd3-2d3a-4e9e-fb52-08dd7ddca2c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 18:21:13.3591
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OmUmIP8RsZSAYlHNTk8q9e2xwesKPMQKxzXZSxBJC0FR5jT434Jqm9Cn1dYewTxObJDsLHv/3xBTOfPVCKyvhN8POt6K4iZdhIsRLoKaIFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
X-OriginatorOrg: intel.com

T24gVGh1LCAyMDI1LTA0LTE3IGF0IDEwOjUwIC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
T24gNC8xNi8yNSAxNjowMiwgS2FpIEh1YW5nIHdyb3RlOg0KPiA+IEZ1bGwgc3VwcG9ydCBmb3Ig
a2V4ZWMgb24gYSBURFggaG9zdCB3b3VsZCByZXF1aXJlIGNvbXBsZXggd29yay4NCj4gPiBUaGUg
Y2FjaGUgZmx1c2hpbmcgcmVxdWlyZWQgd291bGQgbmVlZCB0byBoYXBwZW4gd2hpbGUgc3RvcHBp
bmcNCj4gPiByZW1vdGUgQ1BVcywgd2hpY2ggd291bGQgcmVxdWlyZSBjaGFuZ2VzIHRvIGEgZnJh
Z2lsZSBhcmVhIG9mIHRoZQ0KPiA+IGtlcm5lbC4NCj4gDQo+IERvZXNuJ3Qga2V4ZWMgYWxyZWFk
eSBzdG9wIHJlbW90ZSBDUFVzPyBEb2Vzbid0IHRoaXMgYm9pbCBkb3duIHRvIGENCj4gV0JJTlZE
PyBIb3cgaXMgdGhhdCBjb21wbGV4Pw0KDQpXaGVuIFNNRSBhZGRlZCBhbiBTTUUtb25seSBXQklO
VkQgaW4gc3RvcF90aGlzX2NwdSgpIGl0IGNhdXNlZCBhIHNodXRkb3duIGhhbmcNCm9uIHNvbWUg
cGFydGljdWxhciBIVy4gSXQgdHVybnMgb3V0IHRoZXJlIHdhcyBhbiBleGlzdGluZyByYWNlIHRo
YXQgd2FzIG1hZGUNCndvcnNlIGJ5IHRoZSBzbG93ZXIgb3BlcmF0aW9uLiBJdCB3ZW50IHRocm91
Z2ggc29tZSBhdHRlbXB0cyB0byBmaXggaXQsIGFuZA0KZmluYWxseSB0Z2x4IHBhdGNoZWQgaXQg
dXAgd2l0aDoNCg0KICAxZjVlN2ViNzg2OGUgKCJ4ODYvc21wOiBNYWtlIHN0b3Bfb3RoZXJfY3B1
cygpIG1vcmUgcm9idXN0IikNCg0KQnV0IGluIHRoYXQgcGF0Y2ggaGUgc2FpZCB0aGUgZml4ICJj
YW5ub3QgcGx1ZyBhbGwgaG9sZXMgZWl0aGVyIi4gU28gd2hpbGUNCmxvb2tpbmcgYXQgZG9pbmcg
dGhlIFdCSU5WRCBmb3IgVERYIGtleGVjLCBJIHdhcyBhZHZvY2F0aW5nIGZvciBnaXZpbmcgdGhp
cyBhDQpoYXJkZXIgbG9vayBiZWZvcmUgYnVpbGRpbmcgb24gdG9wIG9mIGl0LiBUaGUgcGF0Y2hl
cyB0byBhZGQgVERYIGtleGVjIHN1cHBvcnQNCm1hZGUgdGhlIFdCSU5WRCBoYXBwZW4gb24gYWxs
IGJhcmUgbWV0YWwsIG5vdCBqdXN0IFREWCBIVy4gU28gd2hhdGV2ZXIgcmFjZXMNCmV4aXN0IHdv
dWxkIGJlIGV4cG9zZWQgdG8gYSBtdWNoIHdpZGVyIHZhcmlldHkgb2YgSFcgdGhhbiBTTUUgdGVz
dGVkIG91dC4NCg0KPiANCj4gPiBJdCB3b3VsZCBhbHNvIHJlcXVpcmUgcmVzZXR0aW5nIFREWCBw
cml2YXRlIHBhZ2VzLCB3aGljaCBpcyBub24tDQo+ID4gdHJpdmlhbCBzaW5jZSB0aGUgY29yZSBr
ZXJuZWwgZG9lcyBub3QgdHJhY2sgdGhlbS4NCj4gDQo+IFdoeT8gVGhlIG5leHQga2VybmVsIHdp
bGwganVzdCB1c2UgS2V5SUQtMCB3aGljaCB3aWxsIGJsYXN0IHRoZSBvbGQNCj4gcGFnZXMgYXdh
eSB3aXRoIG5vIHNpZGUgZWZmZWN0cy4uLiByaWdodD8NCg0KSSBiZWxpZXZlIHRoaXMgaXMgdGFs
a2luZyBhYm91dCBzdXBwb3J0IHRvIHdvcmsgYXJvdW5kIHRoZSAjTUMgZXJyYXRhLiBBbm90aGVy
DQp2ZXJzaW9uIG9mIGtleGVjIFREWCBzdXBwb3J0IHVzZWQgYSBLVk0gY2FsbGJhY2sgdG8gaGF2
ZSBpdCByZXNldCBhbGwgdGhlIFREWA0KZ3Vlc3QgbWVtb3J5IGl0IGtub3dzIGFib3V0Lg0KDQo+
IA0KPiA+IExhc3RseSwgaXQgd291bGQgaGF2ZSB0byByZWx5IG9uIGEgeWV0LXRvLWJlIGRvY3Vt
ZW50ZWQgYmVoYXZpb3INCj4gPiBhcm91bmQgdGhlIFRNRSBrZXkgKEtleUlEIDApLg0KPiANCj4g
SSdsbCBoYXBwaWx5IHdhaXQgZm9yIHRoZSBkb2N1bWVudGF0aW9uIGlmIHlvdSBpbnNpc3Qgb24g
aXQgKEkgZG9uJ3QpLg0KDQpPaywgdGhhbmtzLiBUaGlzIG9uZSBpcyBwcm9iYWJseSBtb3JlIG9m
IGEgYm9udXMgcmVhc29uIG9uIHRvcCBvZiB0aGUgYWJvdmUuDQo=
