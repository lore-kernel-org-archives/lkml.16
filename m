Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9748386340;
	Wed, 25 Jun 2025 04:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750824894; cv=fail; b=e9lUlgmUZNja2ujLG6evzq0zwh5r93YldEBiLYtJZqo3yx9j0cOPF3j9Wy5kFEYRovTGlbjHdm0ViEDwZ8AuxRxgcAC7fHFGDg2GpaaAdT/H3e8pI2lAxWTOsE/eRfgQddelP5PShpdpUxa/SQGmcO/DSMpQKyWxMqA3+wRSpO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750824894; c=relaxed/simple;
	bh=X/u5UYhqUH5hCUe65M9qN0tz8bR3I5al98WDU5csW6o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XbeZ79TUWsQaRKUz7nFYRP/edIqJFQG18HPBqqLkh+DwENqbzDOpYUqBpZaIN7jdOfzK8Vc51d30rcv0imGOmQU8Blq+bFmKWydVY1xAk+yINPD6NRDvABv8V/pMevpfo/89gt5BzWgTBArUGaIG7PJ1MYLTS1KvErgaqkIwrWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLT2jpCk; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLT2jpCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750824892; x=1782360892;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X/u5UYhqUH5hCUe65M9qN0tz8bR3I5al98WDU5csW6o=;
  b=XLT2jpCk1ZigLITbAg+TvvbRvmMk4mOb8WoGFuAVxkx5sSrKe2DPjsOv
   qiIqOGmiy5Ws6ke7Ir+tz1F2LcQ4XBu/yRFBa8xWBY84S9S5lPHPc4Q5P
   SY5tYEivQWA7OoYjNoGc7UebbWJVmLUgK3CyW7AqrzTcyXBCAuFJG+fIa
   5oufmT71Db9D2x6HF5E3WAMY/sq13LeRPpEa4Zsx8mL+C2Aq3T8cXbt2A
   av72HZW3MTxbTx4HLRCL1ZRu4vR//qnCa6w/qMrx2G3YKvMk0VzNGdLLg
   G3nNGoTMJFrS2ZgcDUIBQxKRdYEDSJ7XTsMJrXHwMej0v1TZp2AxSuuGk
   w==;
X-CSE-ConnectionGUID: sKsXUa25TReyG9FbMNmqmA==
X-CSE-MsgGUID: laHtOtO7RgWYRBlnPv1/Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="70650352"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="70650352"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:14:51 -0700
X-CSE-ConnectionGUID: 6f0z495URICbdfWdV4YpGA==
X-CSE-MsgGUID: Cr6+OWqkTPKnyOmP9e9IaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152800944"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 21:14:50 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:14:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 21:14:50 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.43) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 21:14:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDsJWpOJUiqOQfH1ESgIeYSXMqxxrcWOsqN52aFjCkfRNC4M5EPdhKDZBCkuxo3cRRTckYbeIxmxTNL6PawljIMU8iDu5rpoS9n1H+X0jhpnwuIte1/ffCxJhyn1Q4me1OeZPK4hJcT/j3R+rFdfWANAt+XupXwWLnBCT2mhyYpgrsi3K4P5dUsPr1yEnZ4S1NSo2iXck/4ei20jOdb9psywwXcD7wItYZ5ZHt+8GBfDJdGdBefoxcUQX0u2RTSQ917R0Mz1dLdv20D0nWVGYzE0XEFAvkBsYtlAKlXQvgL3HzSZdoW+1ArhuKEglum7pmXdFhMIzkKPovD4gIrqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IevhmZa+tpUfCsA4iVAYPl+1OZjWonIVdzrAkYQnIHM=;
 b=FSn9CySIYy4/lLwZTupyGRM+Mc0TCcNQdsH1gWtcm0YAQbo6vbI4r53fSyJEJnJ/b2T24FPiVUA62w771ZeHcBQt2MZVq8vZl1II6qLIucqnU3AbFmMTbyQv3cK/mUWHg7pISi0klodPIOS+T8/yyI8jt4zjX8P6xwo0KF7hy+vda0JvVFBnL2uyw5Ov5UWf7J0WzDrE60pUzVRsGXLv6OJWu1ULvyh1WtMNxiz1pQg6q1DmAgIhgT3qvXqfgyI22reet8DOL7Uw2plkRJa32WBqA4i+K9FVu+XTuBwR6e0YypsTyna6oK+xBHmLg46BHiuwXNMS9hXOUjcwgsMDOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA0PR11MB7910.namprd11.prod.outlook.com (2603:10b6:208:40d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 04:14:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 04:14:19 +0000
Message-ID: <b4b14670-9cb0-4f65-abd5-39db996e8da9@intel.com>
Date: Tue, 24 Jun 2025 21:14:15 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 20/32] fs/resctrl: Report 'Unassigned' for MBM events
 in mbm_event mode
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
 <794cd45701dd52f0a7c3ebda305ff980e761ba35.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <794cd45701dd52f0a7c3ebda305ff980e761ba35.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:303:8d::32) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA0PR11MB7910:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e5c8c-7f08-4d11-581b-08ddb39ec1cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N1VxdElGc3dWaEJKTGVWaVRVbEJkdFhaNjkwK0wyVmhBQUEwRFhiZUNxaHdi?=
 =?utf-8?B?V1BvcThsYjYvemE5cU13M3p0Z1g4NTBKU0tqZlUrWEVUZ0tKRWhYTld0bGFQ?=
 =?utf-8?B?Vnd4OEhxcEVoQlJNTnAvVzB5QUMvOVl1M2lxeUNzK2hxVy9kOUpMdFhSV0M3?=
 =?utf-8?B?bXhlcFYyQnUyWk1BbDR2cGphSjZkMmYyODVtclNWZldIU3piWkswZldxQ1RP?=
 =?utf-8?B?T3ZJUFEzS3lreW83YVJXMXVkbzB6Q0t4T28wRmJlTFdKTEJjNU9vR0duWjdr?=
 =?utf-8?B?QXVCQVpEMlh3OEtHcWxBdmRQMDA1T3AxeXVLdGl3dnlKbzhDYVFCeU83dUgv?=
 =?utf-8?B?bTFvNEdjMFUxV29pS1YyOTIxTlgvMjhnMi9OMEU5RFc4V2pvcCsvTjBEZ1gz?=
 =?utf-8?B?QlA2ZUZvMDMvQ3VvN2QzZzFmblFJNVhTTVJSSW9nOGpCRnh4b25QTm1lM05M?=
 =?utf-8?B?czF2a2RhMjczRm5vVWxTVnJ4OGE4NTB3elV3YjJDUHA0bXJrKzc5cjRXWE9V?=
 =?utf-8?B?Z0g0VDdyNHNiaE4vUStpajBENHF2Vk9pSlUzaUx0ZUZ2eVFmK01SK3c4YWFP?=
 =?utf-8?B?b1NvUFNXcVdndG9iRXFUYjlYVTJqUFFjeEhJMUlYNW5JVG8yb0I1ZSt6TW1j?=
 =?utf-8?B?OTNMdER6dUkwalh0QmZ1cjlWL3BtQkpITWwzYVZVMkRqVWNIcW5IMzU0Z0x4?=
 =?utf-8?B?ckJCZVpnR3VlVngvbHk2dUFKNElmMkNTcW1HSWliOWU5a0x3MkRFSUVjcnRF?=
 =?utf-8?B?ZUNFSEppcTVJQUR1WXBFWXdDMHNxdklqeXRxaDBQK1pUdkFqVnI1NW1DcmxS?=
 =?utf-8?B?N3pta3dYNHR0QUNXU1VMWG1JdGNjVnZTVjJVRXhFTGYvNlAySktTWE5KeVJ1?=
 =?utf-8?B?djVIRFNxVFR1azZoSVU3T0h1RjVubHF5d2E2QW85VXBQUVlNTG5XRmxKVlFZ?=
 =?utf-8?B?aVFPbFIxSUwvQVM2VVM3S3lKWk04Q1VxMEtSbFJjWTBqUkorTGU4aWFGNUQ2?=
 =?utf-8?B?WXhGYkNVWjdmaXVCRTFzaXFYOFdwYVlISDJmQTh1bkwrMThmU0VyMFZ0V2lZ?=
 =?utf-8?B?M2RLblBKdk1nYWlyaUZTNXB2cWdiR2taa1lxejlmWEFTR01BQW9XVzMyYkpo?=
 =?utf-8?B?b2pVUldnZWZuN0F1eHhabGZiVWgrN215Z1hyQzJnWC9zUElSWlFsN3ducGFn?=
 =?utf-8?B?aU5tcGo0RFl1WUIxaExPbU11SHBGbmtPNHJOUk1veVdBWDMzaGNDaVRjS2JG?=
 =?utf-8?B?TnJFd2ovSVdTVGtldzQ2THAyRW51VHk0NG9RSWx5WkV0cVNIdjZaS2VCRVhB?=
 =?utf-8?B?TFg3WVpNZll2bXNCODVmZkdYcWZtQWNlWG5pVGZXaldwM1YrRXZoVkQ2MUly?=
 =?utf-8?B?aFgvcHRvODZaa21TUXRDQjhwN2JtT3I2VlpMNWkxc1V1ZzU5QWZ5bjNtcXZK?=
 =?utf-8?B?clgvVjg3blEwUHc1ajVKUW9iYzZkdVBFR3dCOWVrTEROYWRidEEwZ2dBclJD?=
 =?utf-8?B?clRjRXZhZE9KQXl4aHJvYnNBNHh1VnZ6UVNpWmUyM1EyNVlSWkNJR1ZOd1Y0?=
 =?utf-8?B?KzNCNGVpdFk5RHBqMWgxelJPNTN2b1RzU0dTR0pyQ1orVVMzaDFCM0JNcW9k?=
 =?utf-8?B?MkhyOFhqSFBZWTUyakVmSVRXQmpaRVhzMEhaMnd3dS9DU0dEVzFxems3L0R0?=
 =?utf-8?B?blp6MFJuSWFHbW5FVWNoLzFwTElLODQ1SnppMUdJVkRvSDFlNHZDSlp0OVht?=
 =?utf-8?B?OU1LT0prVnhqRWtLbVlzSHNJMEhqQjRTdXhONE5obzRtbHN4R3ZqeEM2RXB6?=
 =?utf-8?B?dVc5M1dDNUFNeERiTlBxbnU0b0FLQ0ZUZ3p1c05UeVdXZ0tTem4xNDNVOEZs?=
 =?utf-8?B?a0VYRVpERzVsckMwazhGTHExT2Zwc2VnblppTjJvUUF4amc2NFc3ZFU3VFV1?=
 =?utf-8?Q?14Be/NaLC8k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3FrbVBZeG9jUTI2OXBFSGlNeEFteWY1ekJQU3lhWjlPL1hFUnRsYjBESW5E?=
 =?utf-8?B?ME0yeXhpOTdHZkdtRVpBWC9wTlQzM293N1BTVFhibVdXQjRBRnZ5ZWVCazZx?=
 =?utf-8?B?VTJPeWlPOXBxNGtLNzh1V1RGdUc2bEVLUlVqNVM3WVNPbDJhYnVYaSs3RHJH?=
 =?utf-8?B?MEtuY2lEY0YwUU1ZOEhraHcxM3lrNFlDakd4blhaSjhCRTBnMlhsbGdrQW9l?=
 =?utf-8?B?L3R6U3NiRWRLMTBzekxsU3VtRDRBOVk2U3I4UTlYWTB0NS9FTzRYNE1kZkVE?=
 =?utf-8?B?aFk4RUhBaFF5WjRGS0pDY1VVQzJ1a1lkc1hIUm1ySm1IYzVrd1RGc2hkYzJ3?=
 =?utf-8?B?SDNmbkVwWUpITEhjUXAxOG1kcjRndHIxUFFaRS8wV0pQaHFISmFZbjdjR1pD?=
 =?utf-8?B?ODE4NG9kWHc2RlhBcnhHVUd4bWhLc0IvVkJEcEhCa1FFOGxhR3hkVzI0UUpm?=
 =?utf-8?B?WGo5ajBMUytYVmZRKzBHek9TUXl6RVNNK21QVmVYSXJOTDJLNHVTYXBkLzdN?=
 =?utf-8?B?dUhWNVRCN0NFcnVCQ3djM3kzdzFPL0hMb1B4V0dMelZTRjJSVEtUbVBUMGJJ?=
 =?utf-8?B?Y3Z5UDExb3lUYTlVWFpCUEc3TXhsUllFK2xzZHBmUEFEMEZhbzRaUFBVM1dv?=
 =?utf-8?B?NEN2NzF0YWNaTDVkVnBDNmtNYWFRNmNsSjVBbnU3WkZvUEYzQ2VodEh6NkYz?=
 =?utf-8?B?SmRtbXhyeGR2L1VvY1dEZ29LUW9TQ0tsWjhxdWo4dG9tUngxNXZ0RVZPbjVK?=
 =?utf-8?B?RmxnZ0lCcFRvajNZNXZ1SjcxOURYblZpMFdnMXM5RHFCYTlCYis3SHBSL0pZ?=
 =?utf-8?B?RERpd0pXb29PbUY5RmlJYjRZeEk4NnNMdGJORG9JVEQxVFNUeUhhNEVLYUNi?=
 =?utf-8?B?ZnBSRWdlUkw0eHIrejNOeEdCNXBVYVdoQzNqUW5aRnY5MFptVDJaQ3MxMDly?=
 =?utf-8?B?ckVJd1JCVXAvTkJ3aVlyOCtQdjFNY3Fmd1hDWG50ak1rd0dhczF4a2JNeGk3?=
 =?utf-8?B?aGJ2Z3IzRytuWlRUTEV2RjFZclZ4S3VQZ2s3Y1A2akx2QlY4dFZ1RkdZMTMv?=
 =?utf-8?B?UEszYjV1dUNRekJQZ0tYOWlPYjRYQmQ4NVRHNDAwc3cyVGE0MktZR2VCc013?=
 =?utf-8?B?emp0OXFpaFFHZWQ0SFh3MkpVQnBlMXBqOUdHVHdDcThBd3RaVkRmMFNLRVlT?=
 =?utf-8?B?ZmcwZDFJZXp2b3p2bFVmOWZ3dEUrUEhhb0dCOHVydzRSc3J0YTFGaGNqNGVz?=
 =?utf-8?B?ZC94bmNIMXBKci9ySm9scWtFOXZ5bXBDRHprSXpCa010R09OQkJ6YllhcXZS?=
 =?utf-8?B?d2NOM3NYTTM5b1JuVDR2a0ZEcFAzN3NSc0YvN1dxUGlxZ0xXZWNyK0s4V2Ev?=
 =?utf-8?B?Y2phWkQ4clhVZlJPcm00MnB2SE9wMDBTVmtDdnZUVk5GbmllSmw3UDFQMjEw?=
 =?utf-8?B?YUcxY25NVlJwUTNPc2d2VWFzdXBPaWFIOWQ0TnNqbXZWU0I3UWZwUElteFlN?=
 =?utf-8?B?YWVzejBpcXdDdFFKUjc3TVExZVdaaUpvVDhuWjlqQjM1NDRMMmY1Z1M1cE5H?=
 =?utf-8?B?UjBFMDVxSEZ2dnJLYjA5TEZreENUWEVqb0lHQllmK21Vc1B2SlBiNTA3OWZZ?=
 =?utf-8?B?dmhjYTVrQWxzZnZPY1VIa3hGTmQ0VXRtVW5JUUdHcDJkeDJXTGRsZlhRZlJ5?=
 =?utf-8?B?dTZaRWhJME5pTDU0cTNqRWtsbVJPYzlMeHJiSXYzL2tGNGZyOTJWQkZac05C?=
 =?utf-8?B?d1orSWdlV3JkTGxid2pvd2VDd3I3elhmUjNkcS9UM1hsSXo3K1pGd2E5dFNu?=
 =?utf-8?B?bkhLaGgxeWNhQ3FiRk9PcGVVTlNOaWNJWmd0b3pqKzFXSkVsSHJTNE9KY2ly?=
 =?utf-8?B?N2NCeHhlOWZYLzZ5a3hxclZpMmM3Rmt3R1Vib2o0TUp5ck4yRlhZSjl6SnBI?=
 =?utf-8?B?WjRPV0NTMldOQVRNZHlTQTBnTHRma3JiTm8rYXlaZ005MHFObkJkZkV6MnlS?=
 =?utf-8?B?c2IyNkdSVjZkRmZJdGFSVmFkVndtWUs3ODAxNXJEL1VJYk9xbWhzT3V6RFBK?=
 =?utf-8?B?L3pEb0xNMkZQU0gwYnh4ZUpOV0F1aWthS0pMUTdPVEJVaFF5RDVJMFVyR2pi?=
 =?utf-8?B?R1FXTVV1SHVqZk5wOUJVaGtPc2V5SERudWlkc3B4RlpiS2V5WTVNUjd1Tk1E?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e5c8c-7f08-4d11-581b-08ddb39ec1cd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:14:19.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h/uCeepjG9mRI7OIH5EgI9QdPCdQz5fy9h8vob2BldhOCWFwFTant8qlaAOhxinenk5YTkbSWHOVfeqQ+nNby+hxd+1WciIEM7svyd2tx74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7910
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> When "mbm_event" mode is enabled, a hardware counter must be assigned to

"When the "mbm_event" counter assignment mode is enabled ..."

> read the event.
> 
> Report 'Unassigned' in case the user attempts to read the event without
> assigning a hardware counter.
> 
> Export mbm_cntr_get() to allow usage from other functions within

"Export" can be a loaded term in the Linux kernel. Perhaps:
"Export mbm_cntr_get() ... " -> "Declare mbm_cntr_get() in fs/resctrl/internal.h ..."

> fs/resctrl.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst |  8 ++++++++
>  fs/resctrl/ctrlmondata.c              | 19 ++++++++++++++++++-
>  fs/resctrl/internal.h                 |  2 ++
>  fs/resctrl/monitor.c                  |  4 ++--
>  4 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 8a2050098091..18de335e1ff8 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -434,6 +434,14 @@ When monitoring is enabled all MON groups will also contain:
>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>  	where "YY" is the node number.
>  
> +	The "mbm_event" mode offers "num_mbm_cntrs" number of counters and

"The "mbm_event" mode" -> "The "mbm_event" counter assignment mode"?

> +	allows users to assign counter IDs to mon_hw_id, event pairs enabling

"users to assign counter IDs" -> "users to assign counters"

> +	bandwidth monitoring for as long as the counter remains assigned. The
> +	hardware will continue tracking the assigned mon_hw_id until the user

"assigned mon_hw_id" -> "assigned counter"?

> +	manually unassigns it, ensuring that event data is not reset during this
> +	period. An MBM event returns 'Unassigned' when the event does not have
> +	a hardware counter assigned.
> +
>  "mon_hw_id":
>  	Available only with debug option. The identifier used by hardware
>  	for the monitor group. On x86 this is the RMID.
> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> index ad7ffc6acf13..8a182f506877 100644
> --- a/fs/resctrl/ctrlmondata.c
> +++ b/fs/resctrl/ctrlmondata.c
> @@ -648,15 +648,32 @@ int rdtgroup_mondata_show(struct seq_file *m, void *arg)
>  			goto out;
>  		}
>  		d = container_of(hdr, struct rdt_mon_domain, hdr);
> +
> +		/*
> +		 * Report 'Unassigned' if "mbm_event" mode is enabled and counter
> +		 * is unassigned.
> +		 */
> +		if (resctrl_arch_mbm_cntr_assign_enabled(r) &&
> +		    resctrl_is_mbm_event(evtid) &&
> +		    (mbm_cntr_get(r, d, rdtgrp, evtid) < 0)) {
> +			rr.err = -ENOENT;
> +			goto checkresult;
> +		}
> +

When looking at this snippet in combination with patch #22 that adds the support for
reading counters the flow does not look ideal. While above adds a check whether
this is dealing with counters, it only does so to check if a counter is *not* assigned.
I cannot see *any* other check by resctrl whether it is dealing with counters while
it lumps all information into parameters to resctrl_arch_reset_rmid() and
resctrl_arch_rmid_read(), needing to provide "dummy" parameters when not all information
is relevant, and leaving the arch to need to determine if it is
dealing with counters and then use provided parameters based on that information.

I think it will be simpler for resctrl to determine if a counter or RMID needs to be
read and then call appropriate arch API for each and provide only necessary information
to support that call.

I think this can be accomplished with following changes:
- drop above snippet from rdtgroup_mondata_show() (this will be done in mon_event_read())
- introduce new rmid_read::is_cntr that is a boolean that is true if it is a counter
  that should be read.
- mon_event_read() initializes rmid_read::is_cntr and returns with rmid_read::err
  set if a counter should be read but no counter is assigned (above snippet). The
  added benefit of doing this in mon_event_read() is that if a counter is not
  assigned on new monitor group create or domain add then the mon_add_all_files()->mon_event_read()
  will return immediately with this error instead of trying to read the unassigned
  counter.
- __mon_event_count() should *only* attempt to initialize the counter ID (call mbm_cntr_get)
  if rmid_read::is_cntr is true. 
- Introduce two new arch calls (naming TBD):
  resctrl_arch_cntr_read() and resctrl_arch_reset_cntr() that will respectively read
  and reset the counter.
- __mon_event_count() calls appropriate API based on rmid_read::is_cntr.

What do you think?

Reinette


