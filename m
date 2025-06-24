Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029B2512F1;
	Tue, 24 Jun 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800340; cv=fail; b=YSF6C2pFKWyFAZMntPdPZ+H80tZpqPH/Ex5qZ79k375wU86moBr7eXTNCTbz7D9gU+hs8Okusg7nBujr4THQBBXEgHfgMx2mI5YPvM48AYGZ9CxK/kONQFzhH/yOIAxMAdswak+YJc7C9mU+pXj0/C3pTvoymj1GmbNlcnOUthU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800340; c=relaxed/simple;
	bh=CiOAQgCg0Fq0Bcad8AKqUvwnC8HCQy9sGWKpzycl99Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=p2QuvrnMz4M+qv3lXMctf0r9kiT51M/gR9N/ZNRl4/k1p1B/fKIuBYUCn8hP0kuSd4wmsf89fdkQlpDU8F+sSTQKGlTYNPaGCW7fOnFENY2LWuPM6yRbR0SIXbbxObD+78ci0l496B36cwhjJkUFtG9Z32br/cyetpldTOVq80I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HWLXClUM; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HWLXClUM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800338; x=1782336338;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=CiOAQgCg0Fq0Bcad8AKqUvwnC8HCQy9sGWKpzycl99Q=;
  b=HWLXClUMG8uEpsFsGuqutQuUhzsr1nHXaV919mO9lOWxpu2C3M+isanV
   xFFY2mNowJG+Fjm4xO+9D+MI7Vb5jQrYqsIauf0hFboOkF6G/CnHmIfdo
   2o9YjczbMPO82UfcJecusaV3ur7SDrG+s0jaA3NmqfVnYxT0vZez1HY4z
   lPxPDOealIi7jhNM5umZd2DuVlu1rb+0sDLEGCcxCc1hQgo5w/JRjXjDm
   R4zz0+V4JCwF7l2E+iVIJvKxp3rRhqCDCquTiJ3TP4a7CJcnUQvQ1UGbc
   f8w9X6AHvC8+flqg6y5gfqS0XGznYFjOlU/NlGLObXRdN60gXttY/Mjd/
   g==;
X-CSE-ConnectionGUID: AP4FtyxkSNSbWAr1IFnleA==
X-CSE-MsgGUID: NT1RAmRCT4WypoovfVVFRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="55685473"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="55685473"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:25:38 -0700
X-CSE-ConnectionGUID: 5aok/J1oQ0qZB9ytEDWTjg==
X-CSE-MsgGUID: annnS2cEQXWxHxBO6kCFnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="151774032"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:25:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:25:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:25:36 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.66) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:25:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mnxk3OCkc06xWmlm0GqHpk+4Ru8ncQ5lwxkvPuEwuo7h1JoPJ49NyMWx3MzGi1NHe9tTEcER5tAIgS1p56Jp3BHsnFL0K0eRbpWCS6gJoOpkT9TCutwy670tRPZH2mQijTbQuJpfmhNXMWkiAfNHfAcNWn7UEZTSPjseDm6cfEqySLapcV9IWAYyCaCusnKsd9Eo7C4psdRt5WE3c5hjFDy8HV3ZHkdo6qytMNHUaB6ck1iIcvwK6nrr3yYkgt97OZXo/DyJ5ls9P+PruhDnRnYbA6IBG8NIKmK3dglf1ulo3Z4sK7P795Fde2C5+kcgzSoyBjbfpb8xkTXxna9Rcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwU/CuNo2zJUVY9SKce1IPO4+9eIQ0lmQ4SMBx6FdGo=;
 b=M+WrWSZ5erqxtTYqk0GvTXoSWm+ljAlA3YbuecYVsg8vxRyYjWpZjXDg2veX4GcfMt2kGYm6Wo8VB+ZS++XJzW886ZHHj17GKPmFw9buUoZSNUHMdc12cjV628K1JDl3RUTPYyIskqkpZ5M9FeSvV3AgHGNWDv4OVc2cU0Pr5WEqUi2aF/vfMthFL3gcwFC7OOiO6Ex1x47vvYDcG49XEgLcPu82KWv/EeWoWJsrPwaaHRG8y8mW8QPn3g+WlXjjdTavQqbaVF1fzuIPS0/iX3TAJ0KE2m4JWmBqsbPlS9nXNPDjCEw8KTr/qZgSJq+3aHHu6od4DEO097jNtmOyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CY5PR11MB6320.namprd11.prod.outlook.com (2603:10b6:930:3c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 24 Jun
 2025 21:25:32 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:25:32 +0000
Message-ID: <e911e9c0-be02-4e9d-93e6-0c04ae717905@intel.com>
Date: Tue, 24 Jun 2025 14:25:29 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 00/32] fs,x86/resctrl: Support AMD Assignable
 Bandwidth Monitoring Counters (ABMC)
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1749848714.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0322.namprd03.prod.outlook.com
 (2603:10b6:303:dd::27) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CY5PR11MB6320:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7ef14c-6095-45ec-a604-08ddb365a687
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFVKeHBOUUlNTVhlZ3JyQ1hnRHErZ1R6Ui9EU0JXWHcyTEVucnJLY3lxUkdP?=
 =?utf-8?B?eGpJaVJ5eWpoWm91aVBTd2xINkUzVytQZm5hWU44WFdKOW9lNFBOVzNweFpn?=
 =?utf-8?B?UWdCTFB2ekhtVjVsdy9vU2dzelpsdmF6SkJPVmtLSXVscVBGUEJQM1ZLbU1S?=
 =?utf-8?B?VUVTbjE2UE1tei9Vam4rS3ZleUp2bFBWUUlLdTN3dHpBem1BNDd1d0VDejFn?=
 =?utf-8?B?WlhUV3FCVTQ1bklCY0Y3eFVwS0xManhCYThweGZPRVZ6eWd2azNmT25rMWg2?=
 =?utf-8?B?bzFNNk5NM2lNcWFlQVJzZDdzS243STQ1QWRPSFhPeWlFdmFsWGJmK0h3MVFC?=
 =?utf-8?B?NHNlN3RqMW5ZcU1vOXhYaWdLakp6K1lQUFdBbjBjZFVuQ1ZFelVpMmFzN29w?=
 =?utf-8?B?cjk1MGlETi8zUUZkakFXQjNvZEdicWNtT1hpU3ZnQllDbTVkMHp0czRkODNI?=
 =?utf-8?B?UklaMUZjUG1uellBTHI2QXVqN2lWOGVMd2k2Q1NNWTd4RlM1ZDYzdDZmTVFJ?=
 =?utf-8?B?aTdJT1RvQ3NBZ00xUlRFT2tZTGwyTmRLSjVUc25MMkkrdi9SZEphZ2YzWGNr?=
 =?utf-8?B?dWdhWEdsSFlONDdSR0ZxOGNHdGRlT3ZCY0gyTzBMZ1ROWFRNZ3Z4OXpiVENT?=
 =?utf-8?B?UUZUUU1iUENmcEdhWi9ySTM3V2t3ZmVZUUo3bkdNa0tuZWQ3UlRlSjhNSU56?=
 =?utf-8?B?cTQ4bnplQXRJdzh6d1NraXFZd1MybkRDZS9RdDJNY3RoenBEdWNhNERiM1lF?=
 =?utf-8?B?cFhjUnVlVitZVXNsbHkrNkhuY2x3MW5BT0tTYnlvNEpzcndvL0FYSU5qbHRo?=
 =?utf-8?B?RnRWcm9sL2UzLzFaa1ZnUWxlODg4V3hBY0J4ci9XWm0vMGU2bnZUMEVyVWF2?=
 =?utf-8?B?QkRuQ1JxNG13dlc0SjMxV0NwM0NUUWRLcEhJcjE0bWNCVjJ5WVQ5SytZd1BT?=
 =?utf-8?B?WmU0ckJrdXhSS2prd0lQd3Z3RXBCNnZqZm5yNEsyZTNvS095Y2tGaklmVFhQ?=
 =?utf-8?B?a0RkTHBhS2MvRU4yM0lxeWg4VG1JRmpFRHhTOHBPMnEySFd0NlJOYkxHdmdl?=
 =?utf-8?B?T1YxanBLVWhtaDZkTnB4RnNHVkxOeTN3aDlGVHZDSHQreitiK3IxQk41Zzc2?=
 =?utf-8?B?VDVmOWZYQTdjQ0duM1UzL1dZT1dPWFpYTDJtTTI5NHFMVWVkZTBodk5PRWRx?=
 =?utf-8?B?VlduRHJaa2p4N0ljcnN6UVg2dXkzdlpFVENmMWczTDJLWS8vMTdoNHA4YytP?=
 =?utf-8?B?NTRDNGtqalNqcFM3YThyZHpBSHcyRTFrS2pCTlgyOXJhOUg0V2xmOW1rcU05?=
 =?utf-8?B?Q3hlTnJaOU9UY3B6K1BFV0c3TUxaenZzNk9DTVdrR0M4RUpLV0VnVkg0WjdP?=
 =?utf-8?B?VzJaWHpLTkFBU0wzOURKa0E1cEttaDk0dVhJZWVyZzNOdWxVaGRiRWF3NlUy?=
 =?utf-8?B?QlB5MjJZem9GWVlrTFNuZGJGU3dSMGNlNXNRTU5rUEIvbFJWR2tEVTVsRC8r?=
 =?utf-8?B?QldNd0lUdmpBOENqa1hjTG95MFBKTFEybzdGeGZWOFhPY21QVjdidmJpOE0w?=
 =?utf-8?B?bHgxZWlBK2l2VjJtdUozaGRMYW8rTE9tS3RxbzJKWkdNT1A2QW00SXJKcEFn?=
 =?utf-8?B?cHZmK0RzbFkyVU1wMzN0aXNod2tTR1dzWDVVdFgrQ0NMaXhtUDJ4am12RjNy?=
 =?utf-8?B?Y1BuYVAwZFZOWERUVjBQb1RDQk9GQVhoK1BhL1YzZUF1SFlpTDNsaUtmMlZE?=
 =?utf-8?B?MklpVVpEUUIvc3RVRm4zYXB2VWlCR3lzS3VPZXB3Qy9ETndZZWpSaC9JMFVn?=
 =?utf-8?B?UWVwRkx5MUtOQlIyYVJvR2dNR0xPcWJLaUhRQWMxOHpFanczUHJhTm9HMzBW?=
 =?utf-8?Q?9NGVSdSC7CqyC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?REZoWXdMQmpxZDN4akh4ZEkrL1RZMndLVFZqcTZQVUZ1QllYeElJS3pBZU41?=
 =?utf-8?B?aEc5dmQzVTF3MnFldkR5VWNEekc0cWRqazZvcTdGQVBtVlI2T24rU0xiMlVN?=
 =?utf-8?B?bnVWVUpsN2ZSRUxQMUw4dGJuS0FZbWxsUW9yV3dmbGJzcUkxaEkwTFVHci9X?=
 =?utf-8?B?bUp1RkF3QzVCQ1VPWVNtb2xrU3d4RFZSbUI4anpRMVNGMXQvd2drMkhxZngx?=
 =?utf-8?B?d2JON01DMlpYWTFQOUx6T29JdklhbUhYT0FQd21XbExmbWp5T3NMcysyMXh0?=
 =?utf-8?B?akRZOGRSTFJHQlZISVpvRFUwLy9LNnpEVWk5alFuTmRzamVWdG1ZRHBhbTI2?=
 =?utf-8?B?QWZ6QUt3VzBPV0tXWVptdnpGdTVPblBEaWxBWnRIcTJZcnk3VVBkUVd4T1Nr?=
 =?utf-8?B?M2I3YnVsSWZIb1RNNUZ3TytWUkFOTHlsMUNYWmpYNGs3WHpyOWFSU0t6MGQr?=
 =?utf-8?B?VUxOSWswa0pWdUxkTDlnOWdOUTZoQlZscUVwZXZsNS9xUXg0NWlJeVJhSi8z?=
 =?utf-8?B?MS9xazdYQnRvbVNOWDNScUdOa0ZZVzVCd0RPVUYvamZOa2d0Y1lsa1g4QzZz?=
 =?utf-8?B?eDBNQ2djRlNLeWdUUHIvdEMvOEZZbkxHSSs3azNYMTNYaWwwVnJ1MHNVdDZS?=
 =?utf-8?B?dlZWVDh5Z1dhQlI0RmZlU3ovRWZHd2JIeVpDVHJoMVRxNnJkbFdFYUZsbnlZ?=
 =?utf-8?B?MTJSY1FuZ2NFd0NLYmdFNGpsbytxM0hMaktuODBqR3VkWlp0Ulk2Ujc4eWRJ?=
 =?utf-8?B?b1Nwdmd0QjJDRklQMXN2Qll5emVMcWF6MFUvK01nYTNKckxVVVhMTkwza1dC?=
 =?utf-8?B?dkxobldoMFo0TE9vVS82eC9saUkzNlVCMjJNWURycjZyWHp6L1JnV2lGcGF5?=
 =?utf-8?B?WFUwemE4Zk9yTDlESkthUTlLQU9MOE9JNVA5MHhKVjhDZE5ySDlVNWRhbWtZ?=
 =?utf-8?B?TzhnVkhlYWxGc0s5Um1DalZiSEZvVnVoTzQ0U0RIMzhEdFR5QmNBMysxdWR1?=
 =?utf-8?B?L3V6MVBDK3V6WWRCTktJamVKd2VCNzk2T0NDK3FPMUcyenNnUGFidktEVkxU?=
 =?utf-8?B?OGpOUFhRQkhadjZ0ZHlnY203Y2k4cGV2RmFGZDBMcDNEZ21mWHJ0S1ZrN3pZ?=
 =?utf-8?B?WnR1T3JDMXNTVDJhcEdsL3JlS2pVRnR3ZnhlempLRTZxUXl6Q2ZYc0xOazF3?=
 =?utf-8?B?RkMvUDR6R0VBN3VHaVpZR1hHN1pUYmJKSlIrT1BTOHhEaFdxWjFvVGoxOGUw?=
 =?utf-8?B?dGhGbUJxb2tGR1NkbEpLeHNSU0ROVWJDZDFhNkV2T2dPb2ZzR1NaRFcrbURm?=
 =?utf-8?B?Sy85Z21mdS8zYUlPS0xTNGlRQU9KZDVHZkZGOHhnVEg1YTFlcEpibWdSejc5?=
 =?utf-8?B?V2ZEdCs1R2tZemVoVUVmVmFhQ2R3eGNCL09ocDdHMXd2eVN1M1d2UmpjTXdM?=
 =?utf-8?B?RnVpdStpVjgwNjExbDREblRhTCtjMHV2bnJ3cU9QNGtvdGJ3ZnlWWXBxK3hi?=
 =?utf-8?B?NnI2b2REeEdhL2Z3dzJ2ckFYVlQ0WjJUTTRvQzdvc1VFN291OWprb0F5bkwr?=
 =?utf-8?B?UjB5ZTZkejRsN0tDd1NhVW9kb1E5Y3VPNkVNcUlCaTcwUCs3aGpDTVVZNDBo?=
 =?utf-8?B?bGRlYmVDR2VHaTByZDRFNHh0OHZOalZkZHNRbGVaRGg5NjE0NUtLYVVEUVJF?=
 =?utf-8?B?SE9KeE5iaUI3a3AxV1BnVWFVN0RqL21JR0I4VFEzUUZjSVVkRm8wOVI0WWRp?=
 =?utf-8?B?ck9zK2FmRmI2Qy9BcVNMTWNsYlVRVG5rQzBhV2VNNzBvZExMY3Z6bm5pTEtS?=
 =?utf-8?B?Q3g3ZEc2Z2ZDSzdGK25TS3JyM0VQb2VNbnlIS2duSnlMbDJZSDEreWVXYyt4?=
 =?utf-8?B?VjBNd0VVU3dTdWpyVk1vR0NlZ24rd09zV0ZxdkIxOVR6ZEhQNEI5WDQ4Q2pJ?=
 =?utf-8?B?b3lXQmNKZnVuOEVnVkh3YXRIYUN0WXlrbWo1eVVHUmxmc01heklHUE1pc01n?=
 =?utf-8?B?QzR5Y1lJMW9VQzRoVGVjUjNOY2hqcnY0dDY3MHIrU3hzeTJJRjZCaDJvdmp3?=
 =?utf-8?B?eEJUYk1JNVZTbDRFUGdaa0VpV2Q3M2tVTGdzelJMcWVraGVmUSt2V2dwMGhx?=
 =?utf-8?B?YzNVZW9NTWUyOXhFZVNvcUFqamtOVUVXbmE4T2JaSExKcis0RXg3dEFOMVUz?=
 =?utf-8?B?NFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7ef14c-6095-45ec-a604-08ddb365a687
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:25:32.5119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ehuA4ZkO31YE9Rf+UQuj4nRUMgfvJ2o4SorAJm0Rl6nfI3cgclvS7+M4/9fJWKttrgS76D6bWyv5kiE+zey2sJcDPwIH6P4dPLBYZsPVwCU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6320
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> 
> This series adds the support for Assignable Bandwidth Monitoring Counters
> (ABMC). It is also called QoS RMID Pinning feature
> 
> Series is written such that it is easier to support other assignable
> features supported from different vendors.
> 
> The feature details are documented in the  APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC). The documentation is available at
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> The patches are based on top of commit
> b75dc5e1399df (tip/master) Merge branch into tip/master: 'sched/core'
> 
> # Introduction
> 
> Users can create as many monitor groups as RMIDs supported by the hardware.
> However, the bandwidth monitoring feature on AMD systems only guarantees
> that RMIDs currently assigned to a processor will be tracked by hardware.
> The counters of any other RMIDs which are no longer being tracked will be
> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
> that are not tracked by hardware. So, there can be only limited number of
> groups that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups
> are being tracked during a particular time. Users do not have the option
> to monitor a group or set of groups for a certain period of time without
> worrying about counter being reset in between.

"about counter" -> "about counters" ?

>     
> The ABMC feature allows users to assign a hardware counter ID to an RMID,
> event pair and monitor bandwidth usage as long as it is assigned. The
> hardware continues to track the assigned counter until it is explicitly
> unassigned by the user. Additionally, the user can specify the type of
> memory transactions (e.g., reads, writes) to be tracked by the counter
> for the assigned RMID.
> 
> Without ABMC enabled, monitoring will work in current 'default' mode without
> assignment option.
> 
> # History
> 
> Earlier implementation of ABMC had dependancy on BMEC (Bandwidth Monitoring
> Event Configuration). Peter had concerns with that implementation because
> it may be not be compatible with ARM's MPAM.
> 
> Here are the threads discussing the concerns and new interface to address the concerns.
> https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=ky4MZw@mail.gmail.com/
> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/
> 
> Here are the finalized requirements based on the discussion:
> 
> *   BMEC and ABMC are incompatible with each other. They need to be mutually exclusive.
> 
> *   Eliminate global assignment listing. The interface
>     /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.
> 
> *   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/counter_configs/.
>     The configuration file names should be free-form, allowing users to create them as needed.
> 
> *   Perform assignment listing at the group level by introducing mbm_L3_assignments
>     in each monitoring group level. The listing should provide the following details:
> 
>     Event Configuration: Specifies the event configuration applied. This will be crucial
>     when "mkdir" on event configuration is added in the future, leading to the creation
>     of mon_data/mon_l3_*/<event configuration>.
> 
>     Domains: Identifies the domains where the configuration is applied, supporting multi-domain setups.
> 
>     Assignment Type: Indicates whether the assignment is Exclusive (e or d), Shared (s), or Unassigned (_).
> 
>     Exclusive assignment: Assign the counter ID the RMID, event pair exclusively.
>     
>     Shared assignment: A shared assignment applies to both soft-ABMC and ABMC. A user can designate a
>                        "counter" (could be hardware counter or "active" RMID) as shared and that means
>                        the counter within that domain is shared between different monitor groups and actual
>                        assignment is scheduled by resctrl.  
> 
>     Unassigned: No longer assigned.
> 
> *   Provide option to enable or disable auto assignment when new group is created.
> 
> *   Keep the flexibilty to support future assign options like Soft-ABMC etc.
>     https://lore.kernel.org/lkml/7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com/
>     
> 
> This series tries to address all the requirements listed above.

Please drop the "tries to". Also please do not say "address all requirements" when this
is not the case. This series does not address all the requirements listed
(no dynamic event configurations via mkdir and no shared assignment). Please be specific
about what this series addresses and what it leaves for "future", but highlight that
while this series does not implement all requirements it does create framework
to support their future implementation.

> 
> # Implementation details
> 
> Create a generic interface aimed to support user space assignment of scarce

drop "aimed"

> counters used for monitoring. First usage of interface is by ABMC with option
> to expand usage to "soft-ABMC" and MPAM counters in future.
> 
> Feature adds following interface files:
> 
> /sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
> monitoring features supported. The enclosed brackets indicate which
> feature is enabled.
> 
> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: The maximum number of monitoring counters
> (total of available and assigned counters) in each domain when the system supports
> mbm_assign_mode. 
> 
> /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: The number of monitoring counters
> available for assignment in each domain when mbm_event mode is enabled on the system.

Why is "num_mbm_cntrs" connected to mbm_assign_mode while "available_mbm_cntrs" is
connected to mbm_event mode? Perhaps both can be "mbm_event" mode to reduce confusion?

> 
> /sys/fs/resctrl/info/L3_MON/event_configs: Contains sub-directory for each MBM event
> 					   that can be assigned to a counter.
> 
> /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter: The type of
> 			memory transactions tracked by the event mbm_total_bytes.
> 
> /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter: The type of
> 			memory transactions tracked by the event mbm_local_bytes.
> 
> /sys/fs/resctrl/mbm_L3_assignments: Per monitor group interface to list or modify
> 				    counters assigned to the group.
> 
> # Examples
> 
> a. Check if MBM assign support is available
> 	#mount -t resctrl resctrl /sys/fs/resctrl/
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	[mbm_event]
> 	default
> 
> 	mbm_event feature is detected and it is enabled.
> 
> b. Check how many assignable counters are supported. 
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
> 	0=32;1=32
> 
> c. Check how many assignable counters are available for assignment in each domain.
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs 
> 	0=30;1=30
> 
> d. Check default event configuration.
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter 
> 	local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
>         local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter 
> 	local_reads,local_non_temporal_writes,local_reads_slow_memory
> 
> e. Series adds a new interface file "mbm_L3_assignments" in each monitoring group
>    to list and modify that group's monitoring states.
> 
> 	The list is displayed in the following format:
> 
>         <Event>:<Domain ID>=<Assignment type>

Suggest adding multiple domains to example. Above creates impression that each domain
is listed on its own line (until example below clears that up).

> 
>         Event: A valid MBM event listed in the
>         /sys/fs/resctrl/info/L3_MON/event_configs directory.
> 
>         Domain ID: A valid domain ID.
> 
>         Assignment types:
> 
>         _ : No counter assigned.
> 
>         e : Counter assigned exclusively.
> 
> 	To list the default group states:
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> 	To unassign the counter associated with the mbm_total_bytes event on domain 0:
> 	# echo "mbm_total_bytes:0=_" > /sys/fs/resctrl/mbm_L3_assignments
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=_;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> 	To unassign the counter associated with the mbm_total_bytes event on all domains:
>     	# echo "mbm_total_bytes:*=_" > /sys/fs/resctrl/mbm_L3_assignments
> 	# cat /sys/fs/resctrl/mbm_L3_assignment
> 	mbm_total_bytes:0=_;1=_
> 	mbm_local_bytes:0=e;1=e
> 
> 	To assign a counter associated with the mbm_total_bytes event on all domains in exclusive mode:
>     	# echo "mbm_total_bytes:*=e" > /sys/fs/resctrl/mbm_L3_assignments
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> g. Read the events mbm_total_bytes and mbm_local_bytes of the default group.
>    There is no change in reading the events with the assignment.  If the event is unassigned
>    when reading, then the read will come back as "Unassigned".
> 	
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> 	779247936
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes 
> 	765207488
> 	
> h. Check the default event configurations.
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
> 	local_reads,remote_reads,local_non_temporal_writes,remote_non_temporal_writes,
> 	local_reads_slow_memory,remote_reads_slow_memory,dirty_victim_writes_all
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
> 	local_reads,local_non_temporal_writes,local_reads_slow_memory
> 
> i. Change the event configuration for mbm_local_bytes.
> 
> 	# echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
> 	/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> 	local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads

Note that examples are inconsistent wrt spacing in output of this file. This is expected
to match how the implementation in series does the spacing.

> 	
> 	This will update all (across all domains of all monitor groups) counter assignments 
>         associated with the mbm_local_bytes event.
> 
> j. Now read the local event again. The first read may come back with "Unavailable"
>    status. The subsequent read of mbm_local_bytes will display only the read events.

Above specifies "will display only the read events" while previous step added
"local_non_temporal_writes" to the memory transactions. What is meant with "only the read events"?

> 	
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> 	Unavailable
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes
> 	314101
> 
> k. Users have the option to go back to 'default' mbm_assign_mode if required.
>    This can be done using the following command. Note that switching the
>    mbm_assign_mode will reset all the MBM counters (and thus all MBM events) of all
>    the resctrl groups.
> 
> 	# echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	mbm_event
> 	[default]
> 	
> l. Unmount the resctrl
> 	 
> 	#umount /sys/fs/resctrl/
> ---

Reinette

