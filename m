Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F2928A1F2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515370; cv=fail; b=tDfYI304fmS3MgfFSMyETkcB1fs29iRlV/c6QZmTvGhQEYFRYBq5KiC3PWbtxKW+0e9Lhh53329wBMw4PdlcVJvRkZKCANONqRxjv7GLsMPUhL3tnzi9HD1RaWihKEj0D9dVpRqMXgFsNInj3U6qaGfDS/E6qEyC6GVU8v0oqBo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515370; c=relaxed/simple;
	bh=PRf/2uoEkkdSmN9o+WXbPykM/t0ZjaiC8D6HhpbzXRI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PIw6u3WjdYaWCZhZHWF3XzQvyLvinrj1T+fnwhGahYyIB5ELy7kEQA+AUZ8aGp3Hj/vuFdfRYs10aSRQsZfRzsOZRXC0iTkJydxxdYX2H4zRmActQaNUi+hKttsUjMquMAB7mik+a3n8/O2PyGEYxJ/OElND9s0U1u/khHX4vSQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0+N0Q2U; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0+N0Q2U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745515369; x=1777051369;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PRf/2uoEkkdSmN9o+WXbPykM/t0ZjaiC8D6HhpbzXRI=;
  b=X0+N0Q2UdY5Uc5MUosMj86NUBIu4zBROPVvY3i3KYEZOFEghoyMvQXfT
   YSsrxk5b46SXT3COxcF6rrs7OKUlbC70lH1wb85YTqf8FPTPZ7EPqE889
   5q5EnqjP53nVI8+hwUHP0WTD1qms6mEMc1126qFDJSnMoBFYrtinxYMOE
   82xb21gJFamq1ATPRoClj8BhObjKyhQ9bCCO+LiWpcoRmIzoHLri3my6T
   O/jx6UBGGQwy26WLOdngQlOWGTS688EO9CvTKFSmzoS46+jBECIWnUByL
   bfYnBSktOwI3tTJlCOtmukmFvoz8ANxDxOa12GV1s3LjUN1labSGESkwt
   Q==;
X-CSE-ConnectionGUID: 4sgzPZ+kR6aIo/dGlLg7cQ==
X-CSE-MsgGUID: vr+g7viHS2+Vn1ZzjSnlZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="47039125"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="47039125"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:22:48 -0700
X-CSE-ConnectionGUID: OqCmMy20QuiY6XHwuApKPQ==
X-CSE-MsgGUID: 1XJduf0FT2iI1QZvgDWNQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="163640554"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 10:22:48 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 10:22:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 10:22:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 10:22:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JoVz7xFG3dwS2T2qlzh4Q9by7gC3CfwoqXxJ0WWG8KylBlT8TGRfmVn66uxflxCDBm2y0UwlHiA4wXZBv+hqh5Vo0VPaf8xSpCVpqPqU1pqONKk7I9IfzbfWC5YRzHCF9hZ6/og58wj4cIhw6HXNhJ6fPfZsGsS4EKqdn39TbnsVDywlOmtToN7aMr/VHfTESjsKYESMePB0For5uOQriKIvFbwL9W008yASZoV6JhYNnWtt0mgACEzldHbWtKsXWNt3BQPmbjvU8satWRt1Vf2StxrfAYu9EOFOI/SDLInW2Hx4RwfX7oW2r48V610YY06BFj6GDBE9OP4P57GVUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GVEd+DFKcUfq0uX50tCCDqzh5dZjSQ95ggqIayPG3X4=;
 b=iS0/fg6ixqzT2PM01aA1EwCXA1T4WQlcW54Lk0R2ULfd0DGpUhGvrpQKMnq+Zjr5itUeuUFtmijKzcQx+kVtNIx4w3Y5hsky+/ZMmxQwe+kJwCegErJiY5rNo+3+nyZ3BpFuxlx76oBrvXGyFc88OR+4IpOo3+XaG7jgNUKwtSTL01eiclW5+5YqPzXjbwmSf8Do8IItIsW6tXuXAyBPN6r+yd23rYgbvXJ6pZ6z309Vp8T278YKekRVKOcqIZe7BYMuF5wkq06Zf6MPrlkGYSdUlp5cc9sm9Yx/qVAEfyjO3FhpfMKIFcPDex7AImqteblIenGe3ahhzaz4xSg/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB4859.namprd11.prod.outlook.com (2603:10b6:806:f8::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Thu, 24 Apr
 2025 17:22:12 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.038; Thu, 24 Apr 2025
 17:22:12 +0000
Message-ID: <79f554f2-43de-4ce3-833b-5c03863703c2@intel.com>
Date: Thu, 24 Apr 2025 10:22:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 21/21] x86,fs/resctrl: Move resctrl.rst to live under
 Documentation/filesystems
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-22-james.morse@arm.com>
 <48c4dc43-a963-4d6d-8d66-021e96ce3c58@intel.com>
 <6d459f1a-82d4-482a-80bd-9198c7ea09ae@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <6d459f1a-82d4-482a-80bd-9198c7ea09ae@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0244.namprd03.prod.outlook.com
 (2603:10b6:303:b4::9) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB4859:EE_
X-MS-Office365-Filtering-Correlation-Id: 469064d1-4b79-4504-8bce-08dd83548cee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L056bVJNWjUwSzdwZUcyaUNlMHRFdzhVelB6UUFqVzZMM0FycUcyYllHRGoz?=
 =?utf-8?B?QjAyM0c1SmltZUNEMGQ2N3pwK0s4am9RRVZPb1E3Y1Evbnl2Uy9Fbk5hQ0pu?=
 =?utf-8?B?SnQzbmR1UFhRMkVpK1lNL1RVNGkydWtDQmdkYjZhVUJvYm9KTnFFYjRXMzM3?=
 =?utf-8?B?eXpZMWxIM3FXTjRKZXE0bDYwZDRIaEJJeG54czM3WlgwQ1dYZWtPYUZ6Y3U0?=
 =?utf-8?B?amFrY1ZpNHcvWUEvSC95VDN0TGlyVWhVcXlMaHFrWnVveEdzMHpnWU1XM0Rw?=
 =?utf-8?B?eE9ENWw5M1RyQXRnMndJSHIyZ2dvTm1ZdjZFSlN4TDcvTTNZK2p0dExKdkhh?=
 =?utf-8?B?VmZWSjJQNmlCVUlvS3dMVmJyc0NLdCtLM2hWU21Qa1g2emw4V09NWGdmU1lY?=
 =?utf-8?B?dnNJNVptQXpQUHkrVGFENjVYazFjYjNySmFqRjRTSTc1TmVLcGNPQW1ubWI1?=
 =?utf-8?B?RlgwSURrTFk4MXNORkFnYllTVVVSMEV2dDIybEFuSTZLM2xjZDVyMHcrV1Fj?=
 =?utf-8?B?NFRnZU5kSEpPWnRxditOdmhwcnZ2d21kM01URlNBUzViNzlsRTNPbjdMVW9n?=
 =?utf-8?B?V0VHaHFrdUhiNysyRHI4alRVVUZTNnZZSjZ0QmV5cXRleXF1dlRIUTRxUDEy?=
 =?utf-8?B?dWdDZzMxTFJtLzc0TEdmMUhuSThUb3ZQcmZKczQ4T0RJMURxVi9TNGZud3Bs?=
 =?utf-8?B?T0F0RjkybUdlTzJTY0JITTE1N0ZuNEoxc0QxQzZ6dHFrd1dUMnI1NVZERXpS?=
 =?utf-8?B?MXNNNThKcXY1VzExRUUyOGxYWmhXalp2MjJ6VkhlaWhpVHFWb3NpcEVvelFM?=
 =?utf-8?B?MlRRYklLV2dFeU56clRCcG55bXRzcGNCYjZOQktvVHlFbjJXVGtaa2EyWmR0?=
 =?utf-8?B?cVcvNUtack5jNkhKeGZ2Z0xYZkExU3pyZ21SdFVnTXJudU42WVJTMnF0YnN2?=
 =?utf-8?B?TDdycWtjVDNyRDhnZnpuT1dGRkltckJxUWNqVkFLOXZPeEc3NEk1a2JycGxO?=
 =?utf-8?B?TUZ0QUZQNFJZNjUzU3R3MnpLTzF3ckx3L0dEUzlwVDUrWStMZlhkaXJQSUlW?=
 =?utf-8?B?c1Mxa0NMSENmaFEwb1JqZmR3b0U2QXBqVzY2dDdFVG1PUStvb3BWRGlwc2NE?=
 =?utf-8?B?d2J4L2R6QzJHRm0zT1hTTjR3MXpNeVRGRGRsaFBjN2E1emJKUExNYVU5WDZ1?=
 =?utf-8?B?SlIvWXBZN0VuSHA3OXh0NFYxQUpNSU1VeXRpL2k3V3c5SlYrYkVpVjZBMkxz?=
 =?utf-8?B?bjF2YjhZKy9XOXBxcWJtYnFuai8vOTZkbVp6dENIUkEvRlJKTVpyckUvRytR?=
 =?utf-8?B?dDk5cnBzbVlSODRlNm9HOUtBMVk0WEFGU1lkWnFlQTA0bkliUlFkZk90QWpu?=
 =?utf-8?B?UWxXWWN1dEFpWitPQjd2R3AwWHByVHIzdndBc24zU3I2K2RoL1BtUloxcHJE?=
 =?utf-8?B?T2FVaDBXSEVlamJEZDNDOExUZ3p4MWVLaXhSb0M5NTJBeGg5S1FnMnRjZUxK?=
 =?utf-8?B?bENLeDMvN0MrbTZzUDdqM3MvQ0RIcmJsL2RHSGtCN29tVGx3ZTY2V0QvZ2l3?=
 =?utf-8?B?b1BmTU9FYnc5cHlPZ1NBOU1ERk43UVB1Y0Z6TFBGQ0NqbnF2Zy9TL01lN2ZZ?=
 =?utf-8?B?YTBuWUlHOU5SeDBwdS9mNWErUktJT1F0bitPTFNIaGpNNHowU0RraTg2MUIy?=
 =?utf-8?B?VmVIU3Q0VUMxQlpXejFYcmZ3YTdGRkNZYVNPRFVWZmxPcDFxZWtMN0ErcC9I?=
 =?utf-8?B?Mlhnczg0Z0VqNUhZcDd3MzArVlBPM2lhVk15TVJVeC8zRFI3YUorOE9NWktz?=
 =?utf-8?B?aXBsUVZNY0hOdG84MWE4VGt0TWdJbFRDSEtWUVZNNURPSnZ4NHV6SUY4WmNn?=
 =?utf-8?B?MFFyQ2F4bktoM2JGOHlzZEdybXViVDlBS1pVM0NYRTZtTnlJN2JKRTdvNnZM?=
 =?utf-8?Q?P+hmXhHcEgo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEhzZGl5cm1RZ3VoMEEwRVJOOWhzQmk5RjdGY0p5M3Uxb29zTXFxdDRWZE1U?=
 =?utf-8?B?Nnh3NnltbkhsMENPM3cyakpyeWpNeXlnYktmSUN4Si81dXYrby9zMC80OUh3?=
 =?utf-8?B?RGdSalJPajZYNFpiQ3J3K2lNaUpDVFAxc1pDQ09jRXBNT0tJclBmV1F1UVVP?=
 =?utf-8?B?cDNwSUxBRjlvMVNhbzUxTnl1b1F1dGN6VVZPTXhzenpWd3JPb0luTzg2NnhN?=
 =?utf-8?B?SHVMaWJpemJWMWlpTlhKUXlCLzNGVEhpU0pKakVHb3BrUlRuQlptR0xyYWEy?=
 =?utf-8?B?NFl2T2dqRDByTmFKdWRyYm5qUStkbVU5UTlCQTFJVExJd0dWaXNJaVZHV2Vt?=
 =?utf-8?B?YnVPUXg0V2ZlWjQxcHIxamtSUnhrK1NZV1ppM2NHM1N2dG45cUtKT1FFRVNV?=
 =?utf-8?B?R3V2U2lEeEZXRDNrK2g1SWt6MVhDempsTktXVHAvMHZTSE1kaGU4QzQzNi9P?=
 =?utf-8?B?MFNOTmc2Y0syYkN0TWp1bWw5RXdRU2svcnBUTDVaeWZxVTdEUElzNEpuTVlG?=
 =?utf-8?B?SU04dHhHWFpneXNHdFpQZUo0ekVjamEzRnVadlJ1MUpFUXY2dXNYQ1JBNi9W?=
 =?utf-8?B?cVQ3T2xORDdRbjJCQVd3cGJqczl4Um1VeVkvVXRRMVE2cndxcmo5RXgwc1hF?=
 =?utf-8?B?MWIvNzBJQjdVWmZqUlZ2VXBDZ3NrZ1NiL2s1eENSMVdQVkVjMkNmNk5GR3VM?=
 =?utf-8?B?anZJTmlJbFVwYUs4Yy9BQmozOXVwR3JjNFU0dm4rRkVicnFRYUZ4Z3NRZnZm?=
 =?utf-8?B?N3hLOFNjT0x5eEIrTWR4SUxHWlkyZ2YremRFK0s5aTJMWmJ1S01WdXEvZk1q?=
 =?utf-8?B?RmNzWnUySGV4ZWEyS3hjOS9RSWNmMkxTZ1B0aE0rR3YyZEhFeE9RWm80MzdO?=
 =?utf-8?B?MldRcCtMRG1MNzFSbmJpUEpORm9Oa1F5QXZ6enM5allDQmcrR24wbEhXVzdt?=
 =?utf-8?B?alV0UWdPV3ByMnVBeTViV241bzM0WjhUdTlLeTNVdHA0SVN1MnVIdGVhVm5i?=
 =?utf-8?B?ZEpNUW1qdXNnRVpOS0FtZ3pxOFN4dlhuU3F6SURHbEd5VFhBL0VUTVRoZTNz?=
 =?utf-8?B?d1dWVkN5NHViajJ3K0RvOGdqNzUydmR0VUxDMjlKM3FCd25qdEhxOG9nNlFB?=
 =?utf-8?B?T2FhWXRSOU55Wi9oZjhkSTJkb2c0U3cwQ0lhUk1DTDFPMUdHekFraEwxS3V2?=
 =?utf-8?B?c2xaSHBkWDhqQmpMN0pibDQvWi9FeEJGbUYvWWc3N2V1eThLU0xpTmQvVmNM?=
 =?utf-8?B?ZUN1UlpqZEtIalVRajhuZ2tNaWxyek43bkVmaUNPM21OMi84cGsvdjhrZ3dt?=
 =?utf-8?B?OEdQQkZldnBrWjY5RXBBb1RTSVNqNmZzZU5sV1F1eU5waWxROXFNZDJsYXJ1?=
 =?utf-8?B?SEswZFBQMHFEVXFwL1dCNUJGWXlMeU5taFVENFZYc3M5anlSZDhFZWZZYkVj?=
 =?utf-8?B?Z08zSG51R2src3ZqV3VCZ1E5NWNnbXNPbWNPMW8vWFZBZVlSRGZjeVpoSFBy?=
 =?utf-8?B?eWxObEZVL3VpczArc1V2TFlxWllvaVpkeXE2VStkN0tRaDQxYjVMeldvL1ho?=
 =?utf-8?B?eUQ0UGV1V0ZYSmNydFRXQ2tFMTJSNGZobDdWY0hsQzJkVmNGS2I4SXBEdXc1?=
 =?utf-8?B?MlZuNzhUMkQrTlVGcjFZWVk1SmFiUEVjMDhQN0VITEZsdUREYVF6U04zOWRC?=
 =?utf-8?B?K2pkVEtzN3VTN3QwbTZEZ2J3cG9iK1JFc0YxMFIyTlNSaW95bUxSYmYvMk56?=
 =?utf-8?B?dFpqWDBKcmlCWnc0R200STBLSXMvU0NKeWgvYzZKMFpkdnlZTXBmSm9UT080?=
 =?utf-8?B?ZlBnNTl1M2EyQjVMclhnSDhPYXZKRzNoRG5GNkJSRWFrS3Q2bnR6R1BML3li?=
 =?utf-8?B?dnN1M3c4MWNabEI0MzdEWmZVdDQ3RDYyYU9WcUhRNmpENlViZStjQkZpOEFQ?=
 =?utf-8?B?SkNNZG9wZktveG9RVGdzVFpGRFVKTDNMN2lQQUtrdGFicVJ1T1h3c2lvRU1a?=
 =?utf-8?B?Z0xTeXkvKzI5d051UGs5a211YzFtazlSSzFXbWd1VUwzbytEWjdTOFV6OWVs?=
 =?utf-8?B?NlF3SWhJWURlNUMxbGI0QTdWWStYYklDMkpRY0dlUmtjeDJXQXljOWJOZ3E4?=
 =?utf-8?B?MzlLSHpUU2N6NjVCNTlSYnhFWGE1MU1JNGxYdXJ1UTF1L0tPQ3hVdGZuZUFP?=
 =?utf-8?B?T1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 469064d1-4b79-4504-8bce-08dd83548cee
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 17:22:12.2730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVrYPyLZ7cIbq+EAAtCXEaSOHfWgGAdU3rqVv8Dd0/6ikNJGv0v14x8H7D3Qi9acMpn+aDwt+scfli2dXFUp35vaMhtsmLi0sNcg7HmediE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4859
X-OriginatorOrg: intel.com

Hi James,

On 4/24/25 10:12 AM, James Morse wrote:
> Hi Reinette,
> 
> On 16/04/2025 03:31, Reinette Chatre wrote:
>> On 4/11/25 9:42 AM, James Morse wrote:
>>> The filesystem code has moved from arch/x86 to fs. Move the documentation
>>> too.
> 
>>> diff --git a/Documentation/filesystems/index.rst b/Documentation/filesystems/index.rst
>>> index a9cf8e950b15..32618512a965 100644
>>> --- a/Documentation/filesystems/index.rst
>>> +++ b/Documentation/filesystems/index.rst
>>> @@ -113,6 +113,7 @@ Documentation for filesystem implementations.
>>>     qnx6
>>>     ramfs-rootfs-initramfs
>>>     relay
>>> +   resctrl
>>>     romfs
>>>     smb/index
>>>     spufs/index
>>
>> I built the htmldocs with this change and the filesystem's index.html is quite big
>> making the resctrl parts not be obvious. The title of the documentation is used as
>> a heading so the resctrl documentation's heading is "User Interface for Resource
>> Control feature" that I think makes a text search hard to use since it may not be
>> obvious to users what to search for.
>>
>> What do you think of a snippet like below that will include "resctrl" as a term
>> in the title that should make the documentation easier to find?
> 
> Good point - that is the string people are going to use, and the file names might not be
> something they are looking at.
> 
> 
>> ---8<---
>> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
>> index 6768fc1fad16..c7949dd44f2f 100644
>> --- a/Documentation/filesystems/resctrl.rst
>> +++ b/Documentation/filesystems/resctrl.rst
>> @@ -1,9 +1,9 @@
>>  .. SPDX-License-Identifier: GPL-2.0
>>  .. include:: <isonum.txt>
>>  
>> -===========================================
>> -User Interface for Resource Control feature
>> -===========================================
>> +=====================================================
>> +User Interface for Resource Control feature (resctrl)
>> +=====================================================
>>  
>>  :Copyright: |copy| 2016 Intel Corporation
>>  :Authors: - Fenghua Yu <fenghua.yu@intel.com>
>> ---8<---
> 
> I'll add this as a patch before 17 as its a little more nuanced that fallout from moving code.

Thank you for considering this.

> 
> 
>>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/filesystems/resctrl.rst
>>> similarity index 100%
>>> rename from Documentation/arch/x86/resctrl.rst
>>> rename to Documentation/filesystems/resctrl.rst
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index c30c6fbd1f7a..f7a829898344 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -20281,7 +20281,7 @@ M:	Tony Luck <tony.luck@intel.com>
>>>  M:	Reinette Chatre <reinette.chatre@intel.com>
>>>  L:	linux-kernel@vger.kernel.org
>>>  S:	Supported
>>> -F:	Documentation/arch/x86/resctrl*
>>> +F:	Documentation/filesystems/resctrl.rst
>>>  F:	arch/x86/include/asm/resctrl.h
>>>  F:	arch/x86/kernel/cpu/resctrl/
>>>  F:	fs/resctrl/
> 
>> On the topic of MAINTAINERS file ... if this is ok with you I would like to suggest
>> that you add your name as reviewer to this area with the goal of you being CCed on
>> any patches that touch any of these files so that you could highlight if anything
>> impacts Arm.
> 
> Yes, that makes sense. I'd like to add Dave Martin too so that one of us is more likely to
> be available. I've asked him verbally ...

I'll support this. I find Dave's feedback to be insightful and would appreciate and
welcome more of it.

Reinette

