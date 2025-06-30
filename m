Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A630B78F4A;
	Mon, 30 Jun 2025 21:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320720; cv=fail; b=Kb53GvT3c5tB3s0mDZw4Y30X3SbWtOddrUIjoMtsy+iz/pMOUZtzOtdXL1l9eCSbxSFM7p2P50ZW/KuDv4gXMwMRiExRxW+EWC2IIxrZxRbOxq/nSs/qKddm/CQ6FLSQSfFfF/iReaO3ufHreeUCHmsCxLizm9tCMdLFcSFsnVI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320720; c=relaxed/simple;
	bh=ryG6O+hywxBHLhwOlUOGXqP7WwqJfAxg/kIPwhB+7CI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UOpnfGPDf1CELdKUCXXwsYqLIzh6PMZqKwER6pi7mmvP01Nqcdqy641LawoIYOjUiLzHp+m62aB217u/g4uXlLFSiYdKUxvk9a3ZLLPrRbatH/3KVINp4JKiEJJCKGO7ccsfMeFpWzFH5wQpsxh4JPNBq4L9q7/q9UpJCV9aYKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PLKNJke+; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PLKNJke+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751320719; x=1782856719;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ryG6O+hywxBHLhwOlUOGXqP7WwqJfAxg/kIPwhB+7CI=;
  b=PLKNJke+OZGO0PeTzKGrgQFzxIzWJaLz6O5FwOAVM1RAQgP+584GwLfC
   pwlvQhu/58Q6OAhWLe2Pf/pRfapOL19Z50nJCpSmQ73EmnlxF9NWwweB9
   2caEx/+M5IGR4q66xv7HnC73daclfGFhkiR5mjlCbi3R0wr9bjxYWAnBp
   Fa0VyuLv8LRxpl1i8fwFiGlOmHjqgFGbDOoRef92SSts/rl0WKspPu5Uy
   hF5ArhBp+u2whIp4wEXKHgw0RLBqWoM/c8NoUYJH8uPWAJJ68Vx8jyi5U
   YfgMRJb+dtSXC+mhUs6h4GC4CuLaGFGmcnZNoH6OdOLOGnP1poJnoTxii
   Q==;
X-CSE-ConnectionGUID: f2eU9zEOQ+mARRoFnHVdKA==
X-CSE-MsgGUID: ti79T9ItRy+7XsCKlPIXsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64916169"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64916169"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:58:36 -0700
X-CSE-ConnectionGUID: 3++YVH0gR0uWL1jmRwTCgw==
X-CSE-MsgGUID: FKtKkJQHTpOx7OsGNL3ewA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="159087097"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 14:58:35 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 14:58:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 14:58:18 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.72) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 14:58:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y08IMBrrL5Xq20bRKh8u/115GZLpJxJ4eLdvbpEJZkoXsTjHm5vVSpZwjpBw83gi6TRk9NontRi4rvCPRIWRRMO7LFA7k6xiEpFtEPbBZnao0SBg/bnghJeg8b+oUKfhRVllTqAY6lWlPW4PVwONMDC2WTAoq+Wns4e8kWbNdRG23UO+8Lgi00Ut1ZcPL62xwly4DXtKuA0c0DrSpJLjpOAej6osmw89hMv4mVghSHmplxrWaj1pm0ix7W1+4cyDFAEQCls673ckmnBeAUWcH2CPUUin1CnbQ5bPMfpVQK2w/k02Y7z68wIyuAvW0dRzWsfEKYjTkI1SdMkmDafH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqrK7oh+/znpaVPtQq/2hjghneTJ4XCyIpmE6nSYtZU=;
 b=dY5SySq6YTkKuS+66d9ok4lU+pNpFyNpQGADEY8jLsHNS7iiV7jXnl3QqaRESdYRTg/htcL0nQKLhx5Rdcx3P0k/FArZj1IS4ADT3EsRzP7C31H3jygUZ5lBEWdJr/SHyU4Mzdlj8Osqxn1gPJ/6qjuJ+91w4mvevV8nYcDuE1P33MRLWscAdbCOs/7nU+N67nZ5DivdkdXJB3g9jio8Y8ID/tbrzv0Uv0boQ7x6uJjo7GYe2Xf6xt3yNwayXuisSWgaJNGXbZSccoRu8RSuZcssbTauJ6gCNzDc8Xzamu0gqOqoTeKXAd+2X4QBFCGdb8RDiR2S98f4VP30DtAlaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB8288.namprd11.prod.outlook.com (2603:10b6:510:1c8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Mon, 30 Jun
 2025 21:58:15 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Mon, 30 Jun 2025
 21:58:15 +0000
Message-ID: <689867b7-f3cc-4389-898c-53c4dc321447@intel.com>
Date: Mon, 30 Jun 2025 14:58:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 23/32] fs/resctrl: Add definitions for MBM event
 configuration
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
 <dbd02fa64c22ec933ba27e69ded8288d4d4ae9a1.1749848715.git.babu.moger@amd.com>
 <fd9c7ca0-1d16-49b8-b3f7-4f37cbd9060a@intel.com>
 <1ecc2e54-f62a-4937-be9d-5a275dae0634@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <1ecc2e54-f62a-4937-be9d-5a275dae0634@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0079.namprd03.prod.outlook.com
 (2603:10b6:303:b6::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: e04dc557-658d-4dcf-25d8-08ddb8213679
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MisvWm1WSXk3K0drODczRnFwRC8yanUvZEZSQkR2REZnMnpYY05kRXFpWkVF?=
 =?utf-8?B?RlBkdjdYSTloVEhMUG1XT2h5RzFmNmtoaGk3OEVCdXlSY3ZtUG90eHJpN1ZS?=
 =?utf-8?B?bENHSHMveWRoOGt0MGdBWDN4R1RmZkZWVlVPZ1ZWNTRkUEQ0eVhiQjA5QndT?=
 =?utf-8?B?M1Jvd1JvdFBYVkhub1AxS1gyZmtHeXZ3TUVVeEFVcVNzTU5INWdvaWY2RXlL?=
 =?utf-8?B?ajVPenRPVzl2c2dTV0VvcDNKOUVDWDc4cFdFSTI5cWFIS3lqRG5EOU5mMks4?=
 =?utf-8?B?VEJyN2RBMzZUZlk5VXFtenR0Tk1vSjVTeVZ4RTVZbGE4SGRMaU9ENlhRanJS?=
 =?utf-8?B?R2pDSW9TVk1MVmNxc2xGaGdyQWNNWHpkOHhZc3V5ZGd3V1ExaXNuL2ZUbEMr?=
 =?utf-8?B?KzFaazBGYnNZcUE4K25IbmIycVhMbUtiWGZaTzl6M0RxZWNya3hSUU1LcENO?=
 =?utf-8?B?MFErWENoOEhWY1lPdFpGczZ6c0R6ZnVraTJNVlpHeGdGbUcrMDZsR2srWnMz?=
 =?utf-8?B?RTdpcUI1NmpkemRrSnRxYnJob1M0M3hEYzVzaWkxa2RpSE5FTGdnRE80dG1p?=
 =?utf-8?B?V3IxNDdGQ3UyYTFmTU01RVpFaEZDQ2NBMjRUS0krc3hmUGJyai9peGcwb2p6?=
 =?utf-8?B?QSttSUp1L1p2TGN1d2E3b3BXRkdhWC9MT1VqQ2Erd0tVcFVrVmpkeW8zRG56?=
 =?utf-8?B?Nno1S2J6a2pOYUg3ajM2MmVESWdrQUxyOTBMWmtVMVVScXlPcWpkYWNuNXp4?=
 =?utf-8?B?NUpiaSs4UTJsMzBrQm1UakRodzVuNFZjdDQzcHFIc2FZKzF2QkJKbG5OeFRZ?=
 =?utf-8?B?T1k0MjhScFNJU0k4NFB1SSt4N29rcDRPZ0FoU2UxSzBWZVhxcTI5ekZsQ1ZG?=
 =?utf-8?B?N3JRUzg5V3BuUzluN2hZa3cwTER5M2tmR0FNck9JcmNpOVRPRXpZWE9QY0JQ?=
 =?utf-8?B?SURGcGEzVDI5enRadWZJQlNTa2haclJtUEI3QUJwWC9MT3Z6cm5uTTBDMy93?=
 =?utf-8?B?MTVkQU00ZDJpeGo4bVI2NVI1TXZMcmI0Um8vRWV2dks2Vm9CNkFhMTBhNm1B?=
 =?utf-8?B?OHBsU1JzR1hBK2FhTWp5eUtaQmEyV1BWOUxod1J1ZFRQYnZrTzFXWkZGRjRF?=
 =?utf-8?B?cUZtRVVHZkU4OVREZVZ2cEVaTXkycVpSVHpwMDRiZmRacURXK3RoT1A5c0pp?=
 =?utf-8?B?Si9qbm1HbmZlb01wdG1UeVZUazZjUHk0NTFkRG5LeVhzcTdpbUtmSlBzQUNU?=
 =?utf-8?B?RWE2bGEvdDBuWmVQR2xjazFQeUIxOVR1MEZiTkwrYU01TXlzNnpvR3hsTXU4?=
 =?utf-8?B?RGRwelBjVDlsL0JTTDVPU0FPU0JUMHRQeUJsUHZ1dDdvR1lOMjBnTjY0aXhC?=
 =?utf-8?B?NW9PbkZ3R0lEaWVWR0hoeko3MUo4Tmh4dDRlUFN1eDN4a2ZCaXNFcUsydStj?=
 =?utf-8?B?TkJUYW5QNGRHZ25OL3B4VmJnZHVCcytiMjhvVGJDdkIvNkZWT1J5eGVpejlt?=
 =?utf-8?B?ejUrVWNPdlNJcFZ0enpHQm5DNmZ6QmdoZDc5VEMvbTZFcjhaZEkwZ200aWZ1?=
 =?utf-8?B?SXliYnJrWU9VT1h0YWx6cFdoTUZnNTZUMU0rY3VORUUxRVNuM3dsNGxHeWhC?=
 =?utf-8?B?Z3NZS0JCelNMSzlWQWV1MktvelhkbmlMTnlvQVZ1dy9lWWdmUSt1c1NIWWc5?=
 =?utf-8?B?b1ZqOXJJU3k4K0FCYW12dHVBRlFLcnA5Qy82bXVyNVVzSW80UHBrQ2g2MzNs?=
 =?utf-8?B?LzJ6UXFKMmh2OU1tRVc3OTR2QmVYWXN3eEtZSENmSFk4VzB0Vlg1ODcxU3d3?=
 =?utf-8?B?WThGR3gwU3loUTNkN0ZnUE5UbndMRGR4eEtQVmdpZXZRUUozcThkL2owd1dy?=
 =?utf-8?B?ZVFwaTdicWw2SmhzVGs0MUQvMmcwT0RQWTBLR3N2OCt2V2QxYkhkMlF6UG1C?=
 =?utf-8?Q?UNjV9QQ3RoQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1BoWWVXVEM0NUVhZ2o0WnJBTGNoanJZQ0hlR1BvemowS2VQTUZVNmR2bzky?=
 =?utf-8?B?a0VFdHViV0RzU1ROOWRWVm81R3Rna0hXaXQ3TkpNNys1MFJSSExDQUV5Zk5y?=
 =?utf-8?B?WGNGeEh0b1RLcjlIZEh6R3ZRWEdtcEdoQkUvVXNtaktnd0ZzcnFXTGJYU0Zy?=
 =?utf-8?B?TmtMclRmbEx5M2VYZXFMaC95SlRnN1dNTFliRE9vaE9yMk9HdGVUekI0N0N1?=
 =?utf-8?B?YmpWbXBoWk5NQ1dZUUF1TGEyZThHYlVnWkxFZ1VzMDZUZWNtbXNxZ0V5M2E4?=
 =?utf-8?B?bUloQk9zcGJjanduSWI0ZlFGSVdneEs0Um1TalF4RGxBaDY4cG5iYVhPWW11?=
 =?utf-8?B?bGsrVGtHRGNuOVJ4ZlpTSDg1eVZFc3FDa2RlaUdhRmdZRzRDZW9zVGFhYlZL?=
 =?utf-8?B?aVp6Z3hUaFJ2ZkR4Z0FKUUlPNzdaKzhwNVk5dGg1d3dzNURSeHZjL3BWenhJ?=
 =?utf-8?B?WFBvNDZwWEFpbEtzOEFkRlJxUGpaSHZNRC9oRlVmR24zOTZKZEo0S3RKcUNm?=
 =?utf-8?B?MlR1YXJoWGdRZUtFMCtQeDVpVUI3OGIxOVIxSkZ6djYvanQyUmphNDZyWXYz?=
 =?utf-8?B?Wk5DSzZ3TitLckNKNU5CbVFTRlc3OURoeFJqb3JpdmlVMGgwSFNJWEN0dyt5?=
 =?utf-8?B?dmJ4NGhwNFI3a2tTRlJTaUYzMmhGUG5rOTVRNE9zSUpUSU9OVHhlTjd5YmI3?=
 =?utf-8?B?SGFZUnk2VEFFbDcrSTFMMGJySEVtZlJwL1k3NHl5STNnaXQ5dTdaYWtZTzRp?=
 =?utf-8?B?Ti9ySXM2bGxDMmZiZnNabjdOeGJxTDJNT1EwTmoycU5NRmVJcHZQSVdQZG5N?=
 =?utf-8?B?eTVrZXpBYXVXLy9aeEhtMjZkOEFtMW9mOUNUMm9Sazd3ZEQ5enRwVlJZQjhP?=
 =?utf-8?B?eGpJbUozdUJDZy8vblFqK3hNeDk2MFZyMlpITm5kZGhiZVl5OXZWMytTRWJw?=
 =?utf-8?B?WHprOU9XemJweUorSFA3N2IvZ3BsTFl0TG5vUm5CazhQa2ZMNm9YcDlGRzQ4?=
 =?utf-8?B?QlJGcmt2bXdWVkJiU3U4dHptSzJJb0tMSmlmR284SmYzYml5Q3d6NmxkSG1R?=
 =?utf-8?B?MUpESjZ6ZVQvaE5GbGdmMmtUNWFxSGZNdGt3dGIxUFRGN0dNaDZPaDlQMSti?=
 =?utf-8?B?ZDh5TjkrbHRqUy9YVEZjd0p0WFVTWGk5alUvRHZyZ1gvaFh1WERBelM5cXFw?=
 =?utf-8?B?anJYdlQvQWJZWVc0ZE5vRFVDR2NwVnlsN0hSL1Bla3dZcTBxR2VjSitrN1Mr?=
 =?utf-8?B?VXFYcEJFL2JJWWhJV3UzbG5MUUZNd1lEclIxeW5GbE55ckxiVlB5d3hzR2ww?=
 =?utf-8?B?VDJ6RG4vcWdnSWJuaG00c0IzemdPS2tsSVcxblNweDV4cTQvZUJLazhmY25Q?=
 =?utf-8?B?U2R4U1RrODA2RzFzSmhFb2ROQTBNMVJsSkJBSWxqTkhTalNzYkRWeFNOMkVG?=
 =?utf-8?B?R09RZEdTclo1dmpKY1dOY2x5LzNka3RQM1c4TytvVS9vdXY2bDdHdWIwSFJo?=
 =?utf-8?B?RVg3dXV3MXJUV3lLTmpJUVBtZHpHUS9VT3VuQVRFQUJ6WHJMbThndzhPNW44?=
 =?utf-8?B?c3JhcjVDcXZyNU1hMTNCanNKTjgvTkw1ZUQxdk5TYzM3cnlydUlRQ1VTSy94?=
 =?utf-8?B?NGNaTEZzZ21xcDlBSkRTNFEzNWptdkJmYzZlbkJYMUJNcmVJTkl5MndRZGVG?=
 =?utf-8?B?R3FmdkdlcmhBVk9OTXpNc0lTVkdtNGMwbmhLb2JkM2pXWmxKOWZ5aytmTnpr?=
 =?utf-8?B?bGw0ZzBVcUVQVnh6WDhkTVhDMmZsaWZnRklpM2t2V00vNmhlaVRCRHorZFNY?=
 =?utf-8?B?MzU1WG5UUlF6K01mcklUWG1Bd3RzeDZXaEhBZHRWTk51MDJzL1pXb2JVc1pJ?=
 =?utf-8?B?NnJnVmQwMTMxTitxZVpIUERxVkRLYkROWTcwQnM2ZmtnajZTVkFvQmF0UlBr?=
 =?utf-8?B?MVh1a0VudkpWdDJpUFN1b21OVXlpRnA1R0FXM3huZ2JFaGM5L2Z1YTY3Uk9E?=
 =?utf-8?B?SXFnb2xyUTlxRlFNbUgvQ1JKNjVVS1dWc0F6UXRNNVV0ODN0Unh1MkVDbnEr?=
 =?utf-8?B?cytLUVlWdzZXbzhjR3k3UVc4YmNFOW5aRlNnM1JuT2twQUtrSHBtdjVWNkU2?=
 =?utf-8?B?clA4K1BKYWRhSlcrS01oRkFyNHhQTjdhMlh4VzJ0ZUYyNzJvVDU4QkdCcE05?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e04dc557-658d-4dcf-25d8-08ddb8213679
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 21:58:14.6297
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLbnl9xK1G1wPjIogJUHz82vHxFZDnTfghyBCHpiefjJHJvFzxaK9eXCLzBWP2Vh4B+wA7YjWRGHz6PS0oI6ROAwDIPsq/khcG8aqeiZpYQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8288
X-OriginatorOrg: intel.com

Hi Babu,

On 6/30/25 10:20 AM, Moger, Babu wrote:
> On 6/24/25 23:32, Reinette Chatre wrote:
>> On 6/13/25 2:05 PM, Babu Moger wrote:
> 
> Changed the whole changelog.
> 
> fs/resctrl: Add definitions for MBM event configuration
> 
> The "mbm_event" counter assignment mode allows the user to assign a
> hardware counter to an RMID, event pair and monitor the bandwidth as long
> as it is assigned. The user can specify a particular type of memory
> transaction for the counter to track.

Since an event can be configured with multiple memory transactions I think the
last sentence can be something like:
	The user can specify the memory transaction(s) for the counter to
	track.

> 
> Add the definitions for supported memory transactions (e.g., read, write,
> etc.) the counter can be configured with.

Looks good. Thank you.

Reinette
