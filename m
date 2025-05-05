Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D594183CCA;
	Mon,  5 May 2025 21:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479604; cv=fail; b=BbOGee8HRiVooeUu4xbQt3PAQ1LZB7fEwYwzpU9gKncgb1F+oEz5o5RF6QkaLLovSNq5CxSRuor9S3dPoBfPygQnVlRl7pKm4iiMngtoL3xLDidC03kue90f/qyVlF5B6Xvwsis88YxJlWaY42jwRct33Oms7fQ1rgMcww4BFOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479604; c=relaxed/simple;
	bh=zf/a1p1isyelLAlkrxo5l25yXY8xJgcUVeQns6AFBuk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hTkse/D6wvEV3sIXAQig88BMe9nmz0oR3AIH/0+KFaYTH76TWm/7Rtg09cTdPiUdUwXkhBA6Qv1++8N0pC8l2MC+OETBD0m/5nZwqmfrdewyIE3D2CFB6kAFLZS/qBDPTZJrH7YO5nD1tk9F89cWcmFM34MSwa0kleTQbcnBbR8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLeEVBHl; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLeEVBHl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746479603; x=1778015603;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=zf/a1p1isyelLAlkrxo5l25yXY8xJgcUVeQns6AFBuk=;
  b=NLeEVBHl26aPsT77jhqubSxZGCpLgGyMJX+2a//ASqJCq0daA/+dTQGh
   yYkC17qbgVwhFqT7QNhsn66y/2/i/Z0x0eBq5fzfRzMW/d/T5cJyvUbYF
   fEYNlKCHEXLyNYgpfnfpX/7AuUkVdc510uqrTdGGnTzd4eDes/jIMKQ95
   0c4mI9tv3hcfZpIfa2aMks1YU3/rQNm0HLXpGK5BNk/D/FzIfkV4SZjiM
   b/8J8h7YPhGQxIvgomvs9PuV0c4IRUGYXDDu1YSqTdUM42T7SyydTHHsw
   5b+JS1b7zD/3vTkBC66b8IERriWdE7W9UjROTEQRHcZvVhxqswPJ133KA
   Q==;
X-CSE-ConnectionGUID: X2A6GYX2Tc6tCDtJiTCSfg==
X-CSE-MsgGUID: DktyuNntSSufAybl/HfM7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="48250502"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="48250502"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 14:13:22 -0700
X-CSE-ConnectionGUID: LhRch/C6TU+2GOc6pBycPw==
X-CSE-MsgGUID: L/fHXMsqQKCJ4tbJ/TwR2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="135889325"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 14:13:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 14:13:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 14:13:20 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 14:13:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5N1E7teEkde/CXuoZL9kMUi2gMEtqpLuGiz3B5aqMGkkY3AaGHa1qU+CLSFXwJPyAxFmXfgGUv+5AXUtNEkDcZunuAPJENRwg8BKySLH/6MkXG2fHWJLQfcWA/Y8IOUR/2H0q7rnFPAYkCFZ5BABuYB2QY3Qj3IEu60t5nVViz/8A4IR7j9eAtEgU/JZCkC/fnAjdS+Y47InFfAAn7Y2fK3gUkr0yx3dc5n+WrCM1N9Rpxv12v5KXE2WEcJZDE/B4yfHiekD0Q/0ltB+B9MdyIYRF3WnJC9q2mjUqqO7bTifbwfE1RdZNhvhlgto7dAtyHhofrB7ETCyImS80r4rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OdTr8bZXBU2Y1ofH3KumvKT7nPB3efdh5UYEA94MCPg=;
 b=rDo8G4sNKOwMCBKHR5P1H+Ncc7yMB6sTQxTrrOdEDvukWqfh9dJ+gQ71cW9RmtuEGTi+3+J2ZKFcXnUyi/C9Do+DG1mzb6Dm2adyDtnAOIWPMC39gCTZ7WgTtkLQ79svGiQ5NPduT38q5bNVNFr7AFjMK3fahkZd77z+V4RFT7TQB/RQfUrf1erGNSI+50kD/Uom6OWrwti4o4I5j/B+c/z/C56wY5drTpOjqmTpLO5lZsySDXflBDCP5dkX3QMm/JGiq8so0JSP31QIP1k3KnZLvgHsEQyovD5IF/A8G7gC7RGeFHoC1I3mibiXUI9fyikD723REbqohV/o0gp62A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6759.namprd11.prod.outlook.com (2603:10b6:806:25e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Mon, 5 May
 2025 21:13:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 21:13:15 +0000
Message-ID: <c79d7c1c-e7a0-43bd-821a-947c910cd04d@intel.com>
Date: Mon, 5 May 2025 14:13:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
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
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
 <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
 <b6521b41-d94a-4e69-af69-ed7657569f7c@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b6521b41-d94a-4e69-af69-ed7657569f7c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0032.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::45) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc9fe97-b450-47fa-4ea0-08dd8c19a6cd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UkdLWC9MM0c4N3FsOEFlbGtqQ3JTZkhLaFRuZ1pCTjdubi9Hd21BWVU2UUcr?=
 =?utf-8?B?TGJMNkE1S1ZFL0J5ajdxbWFBT1d5dnRuS3I2QkczWlFqZkRRbklmT1Zabm9h?=
 =?utf-8?B?S3NFdmFDRzIxZkM3QzJIcXExYWxuY1lIZFR3Um9LYVZDSHNTRjhHUU14TlF3?=
 =?utf-8?B?ZkdKUU1QT01ZemNZYy95K2RNZThEZjRDMEdnR0RNUDB4cHpCR25CUDB0d2VQ?=
 =?utf-8?B?UUgralMzS3YvUktPblprZUVLTDh5eTBKajdUZk1RNzk0WVFVZ1paVGxKQ08y?=
 =?utf-8?B?MlU0MU5xMm5PcTV0TXJZS0FTMVZneVhSMVhJakRDdHAwdFFpVHVpcmlQS1pj?=
 =?utf-8?B?VFYrTVlYYmtnU04vYnlQSFU1RldTSk9MSzEyM2EwbVRIdVJqdUcrcmpNbm1U?=
 =?utf-8?B?L1cvZ0xaa3grQThKb2RVWEt0N3d5QVRMZmVBQm9VMmRSSWpzcDJzeWdxdlhv?=
 =?utf-8?B?cGt2SjdtY3ZDaEFzSGtmeW10MndVd1F4MkJlbHQ1Q3E3NFBnejRYZWNhc3JD?=
 =?utf-8?B?RncrOHVzQ3lKNmxwM0IvMzljZW9BNFhNUnBpZzVmbEdzRElheHpRdFFBbVIy?=
 =?utf-8?B?WU5zRTFPMkdoNGpNQkNnb3FnaTk0MTVKbXBOKzF6WlplaERZWUlPNm1nazlO?=
 =?utf-8?B?ZWVOamFMdmVKcTg5dlBJN2M1UHp5V1crUUoxaXRBOCtHR3IzdkJZR1lWUkxw?=
 =?utf-8?B?SzZ1QmhzRUIyakR3TEdVNURKbVhESFdkSHBDZzUrWGRoZVdCYzZNTHBwTjh4?=
 =?utf-8?B?MndneVI1WkxHTWFuQUdjUTh0cVZuR20ybU13RkhyVXJqbVVPTXl1V3V3VzQ0?=
 =?utf-8?B?SGZBNThXZWhEajFyM3l1NkhJdXFYMzFUTXFESXJQeFU5eW1uQlg1cFhCWUc2?=
 =?utf-8?B?ZUJmZ2xKZ282SEJsb2hMREMxenhzSE8vVjJlblgrSmdwdE14dzJEc21jNlFS?=
 =?utf-8?B?SDBaWFJ0Q2lGUmIvdE4waVFwcjZPNUUrSUtBME81UnBjWnZhMkF0TzVGWlZM?=
 =?utf-8?B?Y3JXcGJxSXJzY0dxZ2VwRGRyaVB6MkxRZStrUW01djI3dVZ2Q0ZsTkE0czNM?=
 =?utf-8?B?T2YxMkNDVmdmMUd6OFY1eDVwWVV4c1hrL3ltVEFCMDQ5cHhnYis4TFFYOVdL?=
 =?utf-8?B?LzBNaFgxQkxBSHI5d1BtRDJXYlc1QUVCK0Fza0l2bTFGSnVjYXYzdXNZaW5L?=
 =?utf-8?B?TnJjNDlnNmNtbnhyY0xoczRpRkZCUmJ2L1dyZUtObXZGSEtBcS8rOElMeU5Z?=
 =?utf-8?B?M09UWnV3LzhRa3d1VnZWblVnZ25iYm9QWEhQc01MMlVQWkJRL2dSUDBmTUxQ?=
 =?utf-8?B?Z1pDa1BianBsSWN3T2ErcW5aZjVwNUc4aWRSSXloeXdMV1BXemVsODBCR2pH?=
 =?utf-8?B?bllFQXVpV2dMRjNQOUxoV0xpRnZLMjlmajVCOGxlelRhWldKZGpxeVNxY3hB?=
 =?utf-8?B?Rk1WazdheVNhT2xjUnJyMlFZMTd1RmJpVEg1MFViazNLTW9CSHdBRjM3NDFr?=
 =?utf-8?B?WnhFeDRvbWk4UmE2dlZ0eE1qeEJBRWVyZUFtQTQxckFwejNuQlFLM1dnNzJ4?=
 =?utf-8?B?NzNrN1hWYXlRYVZpaEN6LzkxOE01Vnp1bFpXU083YXhiT3FqTjg1WEN5d1lF?=
 =?utf-8?B?OHBhNCt0R2RLZVI4ajBQazlYYThOK0RFbUhMUy9CVzBOMWJ0V1ZJaFhLLzNI?=
 =?utf-8?B?WjY1bTZvR2FHeVhUNlBqL3lQaE0xdnZlSi9FdEJTOVVaQ1Jnc3JMSGR5eElH?=
 =?utf-8?B?czlIQ2FSNStVOHJacG5nTVJCZ3V3clFOTllMVy9ONkljRExKZE5FN3dzNjlZ?=
 =?utf-8?B?OHh2NmNyUmpPam9oWVV2Q1NpeW0zZHlRbFBQeldKRklKWThrS053ZURtM1VE?=
 =?utf-8?B?RDFUcitWcDViRXBUa1pGVnFJSWI3V1RSRFZLN2MwWjlEdUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bG1jWDFyaUZaa1ZoK1RsRk9BS0ljd3JpNXNEUlNWTnN3b1grTjJHRzNNTnFE?=
 =?utf-8?B?ZXFwWFVNS0NKNXJFQ290eFIvdHljSS9XbzY1ejBlSk9OMmdLVmRTdElGcHRv?=
 =?utf-8?B?SElST0YwYXRIeE5oRGxiN25lV3hRSHZmR2FCYVczR2VJc2NjYk1CU1hISkFS?=
 =?utf-8?B?R2Z3TnFhS21kKzFKWWNMUGgxeEdLakE4cE4rV1VxNmlEZjRFRm5oK01hMEty?=
 =?utf-8?B?YWJqV09rdXVieWw5WkNxQ0hhdllqaCtIcnZqZXJ6T1ArdzFsWmFSb0QxdU5F?=
 =?utf-8?B?dkpad1lCdmxGTmhBeFIyMXh4RDVIKzNWZ3V3K3VrTHBrZzR0Wkl3NjJqeTJs?=
 =?utf-8?B?a0huVWdsN1p3cW1tNnA2RTdvZzVqZ2hrbnVyOWRVMytnRkV3eDJqN0E1S25I?=
 =?utf-8?B?bjlSdVgrSjZRUDgzdzlrRTRqYW1ldkgwZmNlYm5iNHZHYTYzK1FkS01wcDFl?=
 =?utf-8?B?WmNVVGl0RW1GdC8yQVNXVzZqb244WVk0S3ZjRnpKRG9hT3FHa2x1YnJPL05L?=
 =?utf-8?B?UTZQalZidmZZK2tBRDZvS3p4eWtMaTh0UHpZRFFSZ080RXhKYmtvbE1SaVFD?=
 =?utf-8?B?ejJtbTFUWUlHUWxURzlOOTc0STArY05VdDFpNnNPNWQyeXM2empVZ09saUFp?=
 =?utf-8?B?ODg3VHU1OWZzM1dCVFBOWGl2UzhsczdnQWQyTWNuSWZqQ0xUSXFJT2FPWWIr?=
 =?utf-8?B?UXhBYTBpM0owMHBIYU1aMXJUWXpkMnhIOTRvMVdKSW9qMkR0TVBKSWxKbllz?=
 =?utf-8?B?RnBhWkNETFd2YVo0V2xJdGRKdUw2NGNZTmZxZlpUTGVWSTk1VG5MVnlQcytK?=
 =?utf-8?B?V1RSYlh0V2ErbXQ1TVRzb01vbXNmWDdYNk1FZ0l0azVkMnJXRWJsMmxmaUVn?=
 =?utf-8?B?cjhRZHg1UDhTQUtFd0dsMXdyUitQZ3cyV2VIakg3NEx2LzhkWVpmN0hNMXVH?=
 =?utf-8?B?SkJwVVV2dzlRbGFoQjVCNjFQZFJQbm0vaXpKVjMvSDVMRVJWL3Jla1F6T1dM?=
 =?utf-8?B?ZzB6VS9yRGQ3MlBVbDhkMmdab3M5U0UvODU4bUNRdzNndksvSTVzQTRTblhz?=
 =?utf-8?B?R0ZRdE9tMUpvV29CclA2RHVwOElEdnNqTnhUN2x6WkZvMnNqL0JuMWhlQWhE?=
 =?utf-8?B?UFZZNVhabS9pOTRNM2pXdWhqQ21JczdmcFgvVkVuZmdtM1EwOVFZeVdtWUtI?=
 =?utf-8?B?NzJaSzJoaUZ0T2VvT081MEhpaGJGSlljeHdiek9tWUdLajNKeUlRQnBCakRQ?=
 =?utf-8?B?N0REV3FjcFNhbWtkL1o5MitsaTFXVlhrOHJMUG45a0Vab1ZhL091K3NyZW9H?=
 =?utf-8?B?TVFOYi9IQXZOZEl5RCtYeGtObWJPU0JQVDhhSkhJYjlBWGQySVVTSjlJdDcz?=
 =?utf-8?B?a2p1QzJQY1VuZ1RCcEFmV3JlcSs1ZFA2dWRyL2laUFBvemcvUkgxRnVIMWFJ?=
 =?utf-8?B?OXV5c1dMbVE0c3lOd09BK0kySlgzSkg1NEVObWNxckg4N3UzS04vS3RaYjRk?=
 =?utf-8?B?dUxOMVJreDlMWTFiTVUwODQ4OEw3YkJETEhMdDk5TklOL0FPMS9QakVrcFBC?=
 =?utf-8?B?K1hjTCs0d2pEcTdybk14Z2M4Y2J3cDVCSWYrZ3RvRVhRdU4vQjJZc2Q1YmIr?=
 =?utf-8?B?aS9ka09XVWEzYndhd1Y3bnhRTHlObXo3NFN6Qkx1WE5BL1B4NEh0RHRsOUF1?=
 =?utf-8?B?MExaSFBSbWMzb3hZY1Z5T0hjSmRlT25uWDEvMEc5QkNGSm1PTElDMEFXZW5W?=
 =?utf-8?B?OERiamhCNkVTN1d3NDMzUzJaTUV3MGg4MWhjbGFlaUNmby9aR2dWdnFIWHBP?=
 =?utf-8?B?b2FHNmVBYkRIWEQraUJHS2UvZjdkQ0FHbDExaVBTMXI2K1BkVjRGK2RGb2J6?=
 =?utf-8?B?MFd2eUJqQjNnNkg1ZG1BZ1BmMnZrR1pJaTBqUTBQRDI0cVlCL1RzVXJ2dlls?=
 =?utf-8?B?RnlKcXQ0cWd6MTRXZ1VOUUhweDBna1JoS09Za2ZGeDFIWExxZjZuUTZ0OVRJ?=
 =?utf-8?B?NkZUcFVyRmFCS1FiL0xRTHdkc2hoTEV6ZGhJVFppREdUa1R0VnBqM214eW5B?=
 =?utf-8?B?bUhlODRaNDJuM1BFSFVGcHExcXlOTnZTbkRYRHdhdTBWZlorU0FES01DY2FX?=
 =?utf-8?B?cWMzUlE1UFpRRTdxK1NSTUJURWw1Zi9FQ1J2Q2VBQnhITU1XNjY1OExkblJS?=
 =?utf-8?B?M1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc9fe97-b450-47fa-4ea0-08dd8c19a6cd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 21:13:15.8474
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GkIPWFazM4NLNEDhq854NcS7D2G0UzJ7CKe0HL83NBVSBufNezzGpUXA01JZhcl05rYvmxzQX0cnQdlnp1d85mftg5/drcEZlBdugpObIPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6759
X-OriginatorOrg: intel.com

Hi Babu,

On 5/5/25 12:54 PM, Moger, Babu wrote:
> On 5/5/25 11:22, Reinette Chatre wrote:
>> On 5/2/25 5:53 PM, Moger, Babu wrote:
>>> On 5/2/2025 4:20 PM, Reinette Chatre wrote:
>>>> On 4/21/25 3:43 PM, Babu Moger wrote:

...

>>>>
>>>> Then "bit_usage" will look like:
>>>>
>>>> # cat /sys/fs/resctrl/info/L3/bit_usage
>>>> 0=HHHHXXXXSSSS0000
>>>
>>> It is confusing here. To make it clear we may have to print all the CLOSes in each domain.
>>
>> Could you please elaborate how this is confusing?
> 
> # cat /sys/fs/resctrl/info/L3/bit_usage
> 0=HHHHXXXXSSSS0000
> 
> This may give the impression that the all CLOSes in all domains carries
> this property, but in reality, it applies only to one CLOS(15) within each
> domain.
> 
> Example below....
> 

...

> Here is the behaviour after these cahnges.
> 
> === Before io_alloc enabled==============================
> 
> #cd /sys/fs/resctrl/L3/
> # cat io_alloc
> disabled
> 
> # cat shareable_bits
> 0  (This is always 0 for AMD)
> 
> # cat bit_usage
> 0=SSSSSSSSSSSSSSSS;1=SSSSSSSSSSSSSSSS;2=SSSSSSSSSSSSSSSS;3=SSSSSSSSSSSSSSSS

Please note that the "S" in above does not have anything to do with
"shareable_bits" at this point. The "S" indicates that all L3 instances
are currently used by software and that sharing is allowed.

"bit_usage" gives insight to user space how all L3 instances are used.

If at this point a new resource group is created and it has an "exclusive"
allocation then "bit_usage" will change to reflect that.  For example,
you can try this on the system you are testing on:

# echo 'L3:0=fff0;1=fff0;2=fff0;3=fff0' > /sys/fs/resctrl/schemata
# mkdir /sys/fs/resctrl/g1
# echo 'L3:0=f;1=f;2=f;3=f' > /sys/fs/resctrl/g1/schemata
# echo 'exclusive' > /sys/fs/resctrl/g1/mode

The above isolates a portion of all L3 instances for exclusive use by g1.
After above changes:
# cat /sys/fs/resctrl/info/L3/bit_usage
0=SSSSSSSSSSSSEEEE;1=SSSSSSSSSSSSEEEE;2=SSSSSSSSSSSSEEEE;3=SSSSSSSSSSSSEEEE

Note that there is no "closid" or resource group information but instead,
"bit_usage" shows to user space how each cache instance is being used
across all resource groups and hardware (IO) allocations.

> 
> ==== After io_alloc enabled=================================
> 
> # echo 1 > io_alloc
> 
> # cat io_alloc
> enabled
> 
> # cat io_alloc_cbm
> L3:0=ffff;1=ffff;2=ffff;3=ffff
> 
> #cat bit_usage
> 0=XXXXXXXXXXXXXXXX;1=XXXXXXXXXXXXXXXX;2=XXXXXXXXXXXXXXXX;3=XXXXXXXXXXXXXXXX

Looks accurate to me. It shows that both hardware and software can
allocate into all portions of all caches.

> 
> ==== After changing io_alloc_cbm ============================
> 
> #echo "L3:0=ff00;1=ff00;2=ff00;3=ff00 > io_alloc_cbm
> 
> # cat io_alloc_cbm
> L3:0=ff00;1=ff00;2=ff00;3=ff00
> 
> #cat bit_usage
> 0=XXXXXXXXSSSSSSSS;1=XXXXXXXXSSSSSSSS;2=XXXXXXXXSSSSSSSS;3=XXXXXXXXSSSSSSSS

Looks accurate to me.

> =============================================================
> 
> My concern here is, this may imply that the property is present across all
> CLOSes in all the domains, while in fact, it only applies to a single
> CLOS(15) within each domain.

If a user wants a resource group specific view then the schemata should be used.
"bit_usage" presents the view from the cache instance perspective and reflects
how each L3 cache instance is being used at that moment in time. It helps
system administrator answer the question "how are the caches used at the moment"?
"bit_usage" does so by presenting a summary of all allocations across all resource
groups and any hardware allocations that may exist. This file helps user space
to understand how the cache is being used without needing to correlate the CBMs
of all resource groups and IO allocations. For example, "bit_usage" is to be used
by system administrator to ensure cache is used optimally (for example, there are
no unused portions). Also, a user may be investigating a performance issue in
a particular resource group and "bit_usage" will help with that to see if
the tasks in that resource group may be competing with IO.

Reinette
