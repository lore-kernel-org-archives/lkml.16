Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A6528EBE8;
	Thu, 22 May 2025 23:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747956784; cv=fail; b=fv8a5UgOUI7zqXTZM4xTQuTm8iZbfz1qrbJooX/FyAu5VX+33eW4mRaTDq44xnZS6xf/2bdW+jAgFfsJWfBaO25NCux449PZmiQea6PIYE2ih1rjW/5UfUvlZ4gRPPkFwiBRhm6P4qZYGPdS4gEvaE0JZ//BOoWZmLrUY/1Iyes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747956784; c=relaxed/simple;
	bh=d+cReLJbM3qFRC3WxP6PpJXle5h+294al1obinndeHg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hC5U8ewaop4QBDPGaF/d+U67HRWCCJBmNzgTsF2sUnWXnYmzcP1F6Y/klXcYbZW4Ftu1Fx5liuZidzXcudplo6rRSMASbztD8eVp70GTCK5wy0nb0zH3OQeJxfVJ0ahnTap5zOYIpFfcr+qqMPafta5AFiPKxD2K+kInChW6MdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wdyco9y0; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wdyco9y0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747956782; x=1779492782;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d+cReLJbM3qFRC3WxP6PpJXle5h+294al1obinndeHg=;
  b=Wdyco9y0DP96YTZvfbkMMJW7eeA7DqKiezK93IA8hQYEIcO6uwzNB3UZ
   Hv4h4u+VS+DIPkbSxDOW6tcA6yFlJpWgSFSs+sdns6putU7Yj/X7FHyRe
   POHJseaQ5SraxSuW6eyUSfD7IaGploebPQI44/F3N/K9lp4RrWOO+JB5a
   /qAG+XlCDz19Q+nBlj9gs6lryDyzSPUIEfEOhZzXWekASybXJwJgL1dwO
   o96jf8naTT0lyiwlRBFZjnGLg98B7dSZ4qoj6Wgi6esJOosKOWEPKiLGE
   IojLlzd63G93Cn84WcU69tkVs+6zbDmSHBJziNm6YJagl8aEKo2uBMsmt
   A==;
X-CSE-ConnectionGUID: gMRHS+g7SBuaUGmbU2EKmA==
X-CSE-MsgGUID: CrJtml3RTnOm56hIL6u+fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="61411074"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="61411074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:33:01 -0700
X-CSE-ConnectionGUID: 0+H2JbZXQG6YYMVD9Pp59A==
X-CSE-MsgGUID: f984VKdkREWDyXH/iMVJ+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140684128"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 16:32:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 16:32:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 16:32:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.74)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 16:31:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yoJkWuGr35yMB6T6IdGCSjFVGHAbSaTCC15Xx2iesOJBjjHQtF8v5YJBhR5xLK0CrRMu0XMjKI3hfaHLAFlXx3JnAhne4Ob2eCheTiNvnAO/lK2bvR41vJgYvlt1kYcgk7PGvLAfbUBn9PbeqKlre1zZAnpdChsHk1bofNl+h66ouhma1dSSq2K+N3L3sylctI7FNxj9GOS9AvvOkVx1jOh/QNNsMNLbRo5en/n3UZCI0Mo2XN9fgeUVQI/SWDuf2947pNGRa0BL22arR3Tolss1ytOOU4IDqadsxT5dI7LVOx/RUDmT0INdXPQ7g2Kr15lBVh52rF0Ll+jeE7Ej0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ifgm4/zjmNNDUK7xm6En/V1SIn+3T6IutZYV98p1LLA=;
 b=cejQpniEp2ooz+qugAOVuogBsziW2Yxxg9Zu76bkRK1UNnVyeaH5zQPNBd+8eyhjiiVdgGMSbN2rAlKcnqMxyZvQHb005880VnlHYBtL0jynuEMnPOMrh+F3W+OtLZuOyLSsdMCVnwy/RJNKOMMBcHjOvgnqKHHAbtOOgJejasxjwcjERBYc/3wE3cOHn5TR0UyQSRIz7pFpQZKLjSnwaDkJOOoQTQKPe5X0u7VcLG8bItpwhdgzqJNyiBsQJf5j/WiB+jknvzuoMa6D9mBBWcufI2b+hZxfvTLsOSDv4tuDTMCsUfjSuqJ0M4ENEVDpGqsANqF13S0Ydi5ZexvwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 23:31:17 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 23:31:17 +0000
Message-ID: <00daaafe-3ead-497e-b441-ce1da8f4adc4@intel.com>
Date: Thu, 22 May 2025 16:31:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 17/27] x86/resctrl: Add the support for reading ABMC
 counters
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <af9e4c8e97f33299b49d1e3fb2025cc4f26f02f7.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <af9e4c8e97f33299b49d1e3fb2025cc4f26f02f7.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a07354-7bdc-4ad1-ccd0-08dd9988bfe9
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGYxTExFbWlWSkNxK1R6K3d5aHBDTndYbmEzQytvNmdzSUs5QjdnY2VIa3hP?=
 =?utf-8?B?RzV6Um5SMFc3TWVDVC9WcVQ0RnVPZC92eHFxL3B4ZUZJMnpyMkZvVGExNllD?=
 =?utf-8?B?VXBaQlJDcEYvUXgwMmhuTXVCVkYwMFFyUEh4QnREL2NZSWhmeFhPc05xdzlJ?=
 =?utf-8?B?VTdJL1VGV3k1UVBWdXJrc1ZZZmI4NTE3ZmpBQmZhRnBhbmpHYlJuYWRmZzgr?=
 =?utf-8?B?TjI4WHNGUERZS3dpMFg0dGJyZjNGdmNscnZFODZtczMxa3A1MDVoTStVNXAw?=
 =?utf-8?B?aEthTEgxMXduVjF0WXRxaGVlU0lQQ2R1eng3K2hrZEVaT3Jsa0EwUWJDUU5w?=
 =?utf-8?B?MHVQbWYycmhiekFuTDg5RGVPOEo1TGdUWXFPWEFtSzVzeUU4TkNSdDdUQ1V2?=
 =?utf-8?B?YkxaVXBDY2JWZEIvVzVybzJDNzN2Q1JDdnVHMEE1SGJTL2VNZmNMdGlpVjJW?=
 =?utf-8?B?OTZNOVJZekdXdUFlRGRmL2hGSG43YW9HbXFrekZhZTZ4NDNyeHJCMkNja203?=
 =?utf-8?B?WVJyZjNoVWVsc0hrUmNqRGxIeUk2S3Q0K1NhZmlodFJaUC9JU3l0bmRXVDVK?=
 =?utf-8?B?TkZpUm5LSnF6anJPRFQrYU5GN2xWV3VxOE5RazR1QndLdzlrV0V2OWVaOTVS?=
 =?utf-8?B?dmR3ZHFzUGZrRWlhSHdPbGw5VG5iemJqNitYUUR6UUZ3eEl2MnpUQTlyYVNp?=
 =?utf-8?B?SGErSGprUGs4Y3pKRmNFK0U1SEdWR3FkMGVMemgvODlLd1cyb1Z5ZUJtK1c0?=
 =?utf-8?B?VWNiOWYyR2hXSk5KamgrRU0xUmxKOWorT2hkRDQ1SzE1QkxlY0Z3N3g2aEl4?=
 =?utf-8?B?cllhSXlrTUE5WURHMUdBTVFnczBkZ3N1M1RPeE9SeTNBUWMxSVdSa002clBZ?=
 =?utf-8?B?R1ViaVUyWTE4RFFiNUk1RXJIaWkxY21KR3BuZG5ZRkpGMThVY3hZSEM0c2xp?=
 =?utf-8?B?cSttM2NCb3QxZ1VUYWU2em5iRXhrSEpJYVdXczAvc0g5NTRzTCtJeXF4TnIw?=
 =?utf-8?B?bU5wM2ZNTUZUNWdtUVlqL0M5RTlVOUtBYkpkWmdOUXAwOU5BV1IzdnRVWmdi?=
 =?utf-8?B?VFdQYmdjNm9QWDl2NUZ3d21JSkV5c0VpOWZiZFRlNGllcUlYbTlwR1FmNDBl?=
 =?utf-8?B?SzlVaDVwcW8xbk1UdXpKejV3OTRBN2RtTWhaV1l3a2w2THFXeklUTllFR0Vh?=
 =?utf-8?B?NTJiNnJveTBIM0M2aHBGYTA5c0lVTWl3eExKcmdWLzZZVlF6dkwzdk1OaDFE?=
 =?utf-8?B?d1puV2Z6R3B0RGt0RmMwRFd4RGViQnNlSUI5dlVTVERUZFIyRDcvVWY5eEl4?=
 =?utf-8?B?L0ltYWZIVWtPZzJ4UnU4ZE1mbjZUUXlLenRtYlh6YVhSRWNDeVFXYXVqOUp1?=
 =?utf-8?B?S2I5bmtWT0E4WnlCc0pjNEVpTk1ETTJ0SThuU1BBTHZpZHBLRUFkYUFkMVpn?=
 =?utf-8?B?NnZqSFF0aVZBdG1CVlJib09Fbm5WVUxuTXlOb3NNNlV4dGxOc1Y0bVlTY3lr?=
 =?utf-8?B?ZFRJRXdPaS9NQkJ1N3N5SHJGVUk2UzlERVZqSEVxQ2VZd2Z1Vk4wWmg2MVZz?=
 =?utf-8?B?QVRDMkR6NlhJM2JoSWRMWjByNklxZGg2R0ltUmFGZHFHRHVKRWdiQWNEQ0pk?=
 =?utf-8?B?NCtiNmtOK3A0YnlmZ2JJdkh1Yi82ZU5uRnNKakVDc0NJWkVtb1N0MzEwYTFi?=
 =?utf-8?B?VDdnRXpDSVhWZmZTbkR1NVNJNWVrSEdDK3NSc2dRdDFyV1Baa01yM2QyWnYr?=
 =?utf-8?B?REFaT3RNeXlxOXA2TEV0NWkyWTRNM25mblV5VHVmRnVvbW5OTThBQWJ3aWJH?=
 =?utf-8?B?NWpEQ0xUU0JGTDlkY1Z6S2Q0TlozeXN4QmdoMU5XR1l0WEJYemtaL0RycTYr?=
 =?utf-8?B?UUFNSzlsSUFZWHdBOHhqNlZEY3FZUVYvQ2VBcDJCK2VKQW9OT0tXMlRXc0Ju?=
 =?utf-8?Q?UhUwsyMSAwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFV5SFJhRFMvbVZwTlJ6WmFSaG1WcGVRZUY1VUpTKzdtdDhWbDdLdXFndXV2?=
 =?utf-8?B?d0NsbkJXR0d0ZGJock9uV1g2Q0tmVU44Sy9FdERGS3ZTWU1CMEMrTmtRZmQy?=
 =?utf-8?B?d3QrSkVHRlVhVE1UZ3N1M1JwUTFma3J4YzBSM1lGcHZycGVpeGxPa0tVT25m?=
 =?utf-8?B?elFZTEMvM1hlc2lHTENnUCthN1o4S2FESHE5R2lyd2pYT0FkUVN4eTdmSGZz?=
 =?utf-8?B?cVAxZUxTTjg0VDNDKy95V2dDME1yYjJ4VTk3SG01b2hEYVpWYmxiREdJZGFX?=
 =?utf-8?B?eVZiS3lra0NwT1laTVE1WTRRcndRM1BIL2swL3EzMHpjcGdrWm00K1BRL0Fs?=
 =?utf-8?B?MUdKb08rSnh0OFV1bzNNT2pMNEtDRUwzWTRIc3UvY3ZIcW45N3V3Lzg3OHI5?=
 =?utf-8?B?emxDSUk4S08wSUJSYStXSFlBUGpJbHNPZ1Bva1dCdk1UcGRRdGdFMnZNZFdK?=
 =?utf-8?B?TElWZGZPUll2MGJ5bkt2MjdRb0dqNlBqT0NDRmphRkxVc3JrK2JYcnFZSU5X?=
 =?utf-8?B?Z0ZZaiszaWlUZGJQNSt5NGtxMUJxcDlUQm5lbGQrL09PQlgxTVRESjlwMVdH?=
 =?utf-8?B?bVdVL0RQdWlEbyt2cjlsYXFHcmkwaVBlUnNlcllBamhlaFE1bTdJYVI1OHE2?=
 =?utf-8?B?TlVUMUY1VFBYOEdIcWRBaC94eVdKbk9YZGRjVlVBNUJzQmxyeXRxUTJpS0Fr?=
 =?utf-8?B?N1dHaDhxYzdKZDhKNkJGNzNySUlObEREbE14S2tRM3p4QXRlYXpVL0JJcXFP?=
 =?utf-8?B?SkgwTkZ1QytYREFHaG9tM2NaeGt4VGUvUzBWWnM3alErK3QraDJlMnZqZlR3?=
 =?utf-8?B?YTRlVmJQMGo4MFh3KzR5UUd4T2RrUWhYR2Fud0x2cldBNVJGajRuYzhxNllx?=
 =?utf-8?B?VEgvSDJQbUFWZXN5Nmxjc2F1WUlnb2dmcGZZampqNW9NUmRSWnE1UExIRktM?=
 =?utf-8?B?cVcyK1JkSFNobnlIWFVOZktraEp4cEU2czhKWFlaMVFjUlltZTljWTEzc29P?=
 =?utf-8?B?WjVvaEJMSlZGNDFBd3NHcWIwMkRzcVZnN0tvZTdOSXNLK0hwS3M4ZW9RWGZW?=
 =?utf-8?B?b202c1FMUS82QVNFRkFlcWlXRExEU3kzS1QwOHcxaHN3V2tWWVJ1QkNUQVFT?=
 =?utf-8?B?UnJ4MnFzRUVIRFhwY21FZVZCaWlJa3dueWpybTAwcExCTEFQOXplekNTMEJW?=
 =?utf-8?B?OGhYV1pDemY5dnVlVWxoV1BiaGs5VU9vNjhlQnBIVjduOWx0L1ZxemcwMkkw?=
 =?utf-8?B?dE9zMWNqMDZCalJnRkJ5VENlb2NxMnBXNVVhTytPckNIamhDbGQ1d1dhM3F0?=
 =?utf-8?B?RFJTSEFNMmljaFg1ci9EelpzeC9ORzkwQ2Z5NUM4VVRQRzBXT1BxOGZzZUg5?=
 =?utf-8?B?SjdqV3NLRDY0WFFrWk1hVXpGaUI5dDhuWmhXVXZ3WkpJR2tXL0xZR0I1ZXA3?=
 =?utf-8?B?OEpMVUxKRGZJd0poK3NLR1hqSG1vRWlRWWNCQ1ljcjBYbk51M1R0SkRVZm1x?=
 =?utf-8?B?ci9zeEd1K1hYYVB1SFVycVNrdldBWjBUbSt2a3R4Rm1sWWNYNmxoVUJXTG5L?=
 =?utf-8?B?eFo3dzNmcUI3cjVsQ0t1NDFqQ1dlSjVzUEhpRzVhN2ZGaEZoZmJnR014eXJy?=
 =?utf-8?B?OVRzbVpxNlN6VnR4WWN1NDR4cU55cmJMN0lrZDhzeTUwZnlpK3F6NHRjV2tS?=
 =?utf-8?B?RU5zUi9pNHRzZU8rcFFPUnZ4Ym9sU3dQb09IclMrRUV3R2krYzVVQ2NPWjhV?=
 =?utf-8?B?bWMvNzFNTm9XM2p0V01qMmp3WmJHOEw2V05HOWkzc2ZUNmRKREtqUjNIQXZH?=
 =?utf-8?B?NkFaZDQzMXAxekwwUSthWk9hVUwzOVI4RWlVbXFHL2dWSFc4cGVFci9BT0Rq?=
 =?utf-8?B?UStWTHZVN21BbS9SSUx1WFlnMDB5S3VtQ0VnMlZJYU5raE1zdTQxZzF3MWFs?=
 =?utf-8?B?MnlISGhaeTgvUUluajFtNVMxdmJsNnNKWEpLSHB0WE1kaWZpdEZRSHZjYncw?=
 =?utf-8?B?N1dWc0N3Uks4bURoRnJTRWVQSDZGdWZRejJWbTUyTzlSR3ZzdDRPcTRnYjI5?=
 =?utf-8?B?QThnQ0ZHcEpNM2ZTeEVreU8rRGVzazZCeEFEdC9ZeUMwYTBYV2p1WVpxREYy?=
 =?utf-8?B?KzE1aEpNd0FrRTNmVVEzWlFwSU81a1FKeTdnMVd0c3pKZGZmdUV0RkFFU3VH?=
 =?utf-8?B?L0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a07354-7bdc-4ad1-ccd0-08dd9988bfe9
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 23:31:17.4871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XR+hDM+bUuCCg2pKP1wo7/or0lWe7RP0wV1k+SXGdbp9dNud4S2V7xkm6yr9z5N6nR6iVLHgEY41UkjF6K2ypD91ic4/BXb6/ujduYA2aD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> Software can read the assignable counters using the QM_EVTSEL and QM_CTR
> register pair.

Please append with more context on how register pair is used to support the
changes in this patch.

> 
> QM_EVTSEL Register definition:
> =======================================================
> Bits	Mnemonic	Description
> =======================================================
> 63:44	--		Reserved
> 43:32   RMID		Resource Monitoring Identifier
> 31	ExtEvtID	Extended Event Identifier
> 30:8	--		Reserved
> 7:0	EvtID		Event Identifier
> =======================================================
> 
> The contents of a specific counter can be read by setting the following
> fields in QM_EVTSEL.ExtendedEvtID = 1, QM_EVTSEL.EvtID = L3CacheABMC (=1)
> and setting [RMID] to the desired counter ID. Reading QM_CTR will then
> return the contents of the specified counter. The E bit will be set if the
> counter configuration was invalid, or if an invalid counter ID was set
> in the QM_EVTSEL[RMID] field.

Please rewrite above in imperative tone.

> 
> Introduce __cntr_id_read_phys() to read the counter ID event data.
> 
> Link: https://www.amd.com/content/dam/amd/en/documents/processor-tech-docs/programmer-references/40332.pdf
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Split the patch into 2. First one to handle the passing of rdtgroup structure to few
>      functions( __mon_event_count and mbm_update(). Second one to handle ABMC counter reading.
>      Added new function __cntr_id_read_phys() to handle ABMC event reading.
>      Updated kernel doc for resctrl_arch_reset_rmid() and resctrl_arch_rmid_read().
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The monitor.c file has now been split between the FS and ARCH directories.
> 
> v12: New patch to support extended event mode when ABMC is enabled.
> ---
>  arch/x86/kernel/cpu/resctrl/internal.h |  6 +++
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 66 ++++++++++++++++++++++----
>  fs/resctrl/monitor.c                   | 14 ++++--
>  include/linux/resctrl.h                |  9 ++--
>  4 files changed, 80 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index db6b0c28ee6b..3b0cdb5520c7 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -40,6 +40,12 @@ struct arch_mbm_state {
>  /* Setting bit 0 in L3_QOS_EXT_CFG enables the ABMC feature. */
>  #define ABMC_ENABLE_BIT			0
>  
> +/*
> + * ABMC Qos Event Identifiers.

QoS?

> + */
> +#define ABMC_EXTENDED_EVT_ID		BIT(31)
> +#define ABMC_EVT_ID			1

Please use BIT(0) to be consistent.

> +
>  /**
>   * struct rdt_hw_ctrl_domain - Arch private attributes of a set of CPUs that share
>   *			       a resource for a control function
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index e31084f7babd..36a03dae6d8e 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -161,6 +161,41 @@ static int __rmid_read_phys(u32 prmid, enum resctrl_event_id eventid, u64 *val)
>  	return 0;
>  }
>  
> +static int __cntr_id_read_phys(u32 cntr_id, u64 *val)
> +{
> +	u64 msr_val;
> +
> +	/*
> +	 * QM_EVTSEL Register definition:
> +	 * =======================================================
> +	 * Bits    Mnemonic        Description
> +	 * =======================================================
> +	 * 63:44   --              Reserved
> +	 * 43:32   RMID            Resource Monitoring Identifier
> +	 * 31      ExtEvtID        Extended Event Identifier
> +	 * 30:8    --              Reserved
> +	 * 7:0     EvtID           Event Identifier
> +	 * =======================================================
> +	 * The contents of a specific counter can be read by setting the
> +	 * following fields in QM_EVTSEL.ExtendedEvtID(=1) and
> +	 * QM_EVTSEL.EvtID = L3CacheABMC (=1) and setting [RMID] to the
> +	 * desired counter ID. Reading QM_CTR will then return the
> +	 * contents of the specified counter. The E bit will be set if the
> +	 * counter configuration was invalid, or if an invalid counter ID
> +	 * was set in the QM_EVTSEL[RMID] field.
> +	 */
> +	wrmsr(MSR_IA32_QM_EVTSEL, ABMC_EXTENDED_EVT_ID | ABMC_EVT_ID, cntr_id);
> +	rdmsrl(MSR_IA32_QM_CTR, msr_val);
> +
> +	if (msr_val & RMID_VAL_ERROR)
> +		return -EIO;
> +	if (msr_val & RMID_VAL_UNAVAIL)
> +		return -EINVAL;
> +
> +	*val = msr_val;
> +	return 0;
> +}
> +
>  static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_dom,
>  						 u32 rmid,
>  						 enum resctrl_event_id eventid)
> @@ -180,7 +215,7 @@ static struct arch_mbm_state *get_arch_mbm_state(struct rdt_hw_mon_domain *hw_do
>  }
>  
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			     u32 unused, u32 rmid,
> +			     u32 unused, u32 rmid, int cntr_id,
>  			     enum resctrl_event_id eventid)
>  {
>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> @@ -192,9 +227,16 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>  	if (am) {
>  		memset(am, 0, sizeof(*am));
>  
> -		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> -		/* Record any initial, non-zero count value. */
> -		__rmid_read_phys(prmid, eventid, &am->prev_msr);
> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +		    resctrl_is_mbm_event(eventid)) {
> +			if (cntr_id < 0)

This would be a bug, no? how about WARN_ON_ONCE()?

> +				return;
> +			__cntr_id_read_phys(cntr_id, &am->prev_msr);
> +		} else {
> +			prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> +			/* Record any initial, non-zero count value. */
> +			__rmid_read_phys(prmid, eventid, &am->prev_msr);
> +		}
>  	}
>  }
>  
> @@ -224,8 +266,8 @@ static u64 mbm_overflow_count(u64 prev_msr, u64 cur_msr, unsigned int width)
>  }
>  
>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			   u32 unused, u32 rmid, enum resctrl_event_id eventid,
> -			   u64 *val, void *ignored)
> +			   u32 unused, u32 rmid, int cntr_id,
> +			   enum resctrl_event_id eventid, u64 *val, void *ignored)
>  {
>  	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>  	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
> @@ -237,8 +279,16 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
>  
>  	resctrl_arch_rmid_read_context_check();
>  
> -	prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> -	ret = __rmid_read_phys(prmid, eventid, &msr_val);
> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +	    resctrl_is_mbm_event(eventid)) {
> +		if (cntr_id < 0)

WARN_ON_ONCE()?

> +			return cntr_id;
> +		ret = __cntr_id_read_phys(cntr_id, &msr_val);
> +	} else {
> +		prmid = logical_rmid_to_physical_rmid(cpu, rmid);
> +		ret = __rmid_read_phys(prmid, eventid, &msr_val);
> +	}
> +
>  	if (ret)
>  		return ret;
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index a477be9cdb66..72f3dfb5b903 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -159,7 +159,11 @@ void __check_limbo(struct rdt_mon_domain *d, bool force_free)
>  			break;
>  
>  		entry = __rmid_entry(idx);
> -		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
> +		/*
> +		 * cntr_id is not relevant for QOS_L3_OCCUP_EVENT_ID.
> +		 * Pass dummy value -1.
> +		 */
> +		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid, -1,
>  					   QOS_L3_OCCUP_EVENT_ID, &val,
>  					   arch_mon_ctx)) {
>  			rmid_dirty = true;
> @@ -359,6 +363,7 @@ static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>  
>  static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  {
> +	int cntr_id = mbm_cntr_get(rr->r, rr->d, rdtgrp, rr->evtid);

So mbm_cntr_get() is called on *all* events (even non MBM) whether assignable counters
are supported or not. I assume it relies on num_mbm_cntrs to be zero on non-ABMC systems
but I think this needs to be explicit that mbm_cntr_get() returns -ENOENT in these cases.
Any developer attempting to modify mbm_cntr_get() needs to be aware of this usage.

This is quite subtle that resctrl_arch_reset_rmid() and resctrl_arch_rmid_read()
can be called with a negative counter ID. To help with code health this needs to
be highlighted (more later). 

>  	int cpu = smp_processor_id();
>  	u32 closid = rdtgrp->closid;
>  	u32 rmid = rdtgrp->mon.rmid;
> @@ -368,7 +373,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  	u64 tval = 0;
>  
>  	if (rr->first) {
> -		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, rr->evtid);
> +		resctrl_arch_reset_rmid(rr->r, rr->d, closid, rmid, cntr_id, rr->evtid);
>  		m = get_mbm_state(rr->d, closid, rmid, rr->evtid);
>  		if (m)
>  			memset(m, 0, sizeof(struct mbm_state));
> @@ -379,7 +384,7 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  		/* Reading a single domain, must be on a CPU in that domain. */
>  		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
>  			return -EINVAL;
> -		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid,
> +		rr->err = resctrl_arch_rmid_read(rr->r, rr->d, closid, rmid, cntr_id,
>  						 rr->evtid, &tval, rr->arch_mon_ctx);
>  		if (rr->err)
>  			return rr->err;
> @@ -404,7 +409,8 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
>  	list_for_each_entry(d, &rr->r->mon_domains, hdr.list) {
>  		if (d->ci->id != rr->ci->id)
>  			continue;
> -		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid,
> +		cntr_id = mbm_cntr_get(rr->r, d, rdtgrp, rr->evtid);
> +		err = resctrl_arch_rmid_read(rr->r, d, closid, rmid, cntr_id,
>  					     rr->evtid, &tval, rr->arch_mon_ctx);
>  		if (!err) {
>  			rr->val += tval;
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index f78b6064230c..cd24d1577e0a 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -473,6 +473,7 @@ void resctrl_offline_cpu(unsigned int cpu);
>   *			counter may match traffic of both @closid and @rmid, or @rmid
>   *			only.
>   * @rmid:		rmid of the counter to read.
> + * @cntr_id:		cntr_id to read MBM events with mbm_cntr_assign mode.

"Counter ID used to read MBM events in mbm_cntr_evt_assign mode. Only valid when
 mbm_cntr_evt_assign mode is enabled and @eventid is an MBM event. Can be negative
 when invalid." (Please feel free to improve)

>   * @eventid:		eventid to read, e.g. L3 occupancy.
>   * @val:		result of the counter read in bytes.
>   * @arch_mon_ctx:	An architecture specific value from
> @@ -490,8 +491,9 @@ void resctrl_offline_cpu(unsigned int cpu);
>   * 0 on success, or -EIO, -EINVAL etc on error.
>   */
>  int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
> -			   u64 *val, void *arch_mon_ctx);
> +			   u32 closid, u32 rmid, int cntr_id,
> +			   enum resctrl_event_id eventid, u64 *val,
> +			   void *arch_mon_ctx);
>  
>  /**
>   * resctrl_arch_rmid_read_context_check()  - warn about invalid contexts
> @@ -532,12 +534,13 @@ struct rdt_domain_hdr *resctrl_find_domain(struct list_head *h, int id,
>   * @closid:	closid that matches the rmid. Depending on the architecture, the
>   *		counter may match traffic of both @closid and @rmid, or @rmid only.
>   * @rmid:	The rmid whose counter values should be reset.
> + * @cntr_id:	The cntr_id to read MBM events with mbm_cntr_assign mode.

Same as above.

>   * @eventid:	The eventid whose counter values should be reset.
>   *
>   * This can be called from any CPU.
>   */
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
> -			     u32 closid, u32 rmid,
> +			     u32 closid, u32 rmid, int cntr_id,
>  			     enum resctrl_event_id eventid);
>  
>  /**

Reinette
