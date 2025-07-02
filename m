Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224C12F50A2;
	Wed,  2 Jul 2025 17:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751476942; cv=fail; b=PritZNgUI6jMrmJTONnyeoI650PeVsHPs7mviVJNlZxgHYgvmN1WPpzHzvFm0uoLpCmhEg8p3+EnwVlZbYjhkoiscPgFSZYc8cbWh8yL6LEpnLQW/t8Yzg2Rt9lLUfT12SjhBO8HSdSQsJy8bDxzbYzYFbQJH8UmD4/vpZ7QBfA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751476942; c=relaxed/simple;
	bh=0c1p1W/x7ia+o6LCVOdLGVy6uNaVc0vnsesBOsWVd4Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QGsRU26pxb9klUi6vM2gmoAPqHakr5CBBLKnCfgM1WDvbCUN3bg838/ZU7BV9sGq9HZS5im6yg0i9fLP1sbtx89LGNPmLxJHOTW39z7JMl5n7PKYcjZbn/qXozDM2KTypzoeH1PYSCyQszHVuzmOgijAD0L5/L/Jya0L3b3I8Ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4cqK3dw; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4cqK3dw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751476941; x=1783012941;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=0c1p1W/x7ia+o6LCVOdLGVy6uNaVc0vnsesBOsWVd4Y=;
  b=l4cqK3dwH7nf+4FPCHQ2lF80c3tVHG9/V/f0k53mzaEAV/nC32oZ/yy8
   Y0JGKwpQpAakLFbeJ4HFCauJVyGlPceC2YU5v6oGvitQKSLdO+Y2jpc0x
   xhCg4ePMzYz+7vT9jhP+Jz2qsjlaeAThRHRkcNkDD4Ssw89TQlTnJRzZt
   1erO0wProQODwpoW0ZXL6tlhhV/P3XK+jinFHga9PMtym13GpkR/c6mFK
   QFpADwGVPFee92fiiQLJJpNgca/l3wXync91ooyYvEMVBFLoGjeq0KeXY
   Y0lVa57mf0Cu00BKi4FVvhARhZnNiL+cuQxnMnu9UhpBOVFKxz4t7AUIp
   A==;
X-CSE-ConnectionGUID: CsryvwXPQKO3KC+Ce8r3uw==
X-CSE-MsgGUID: xyy+4VcZTQi4B5+uCWBlCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="56409511"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="56409511"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 10:22:20 -0700
X-CSE-ConnectionGUID: Eu+FKoggRTqTMCkc2+4F1w==
X-CSE-MsgGUID: vln7ZvJBRZauSN0IymOORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="159828027"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 10:22:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 10:22:19 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 10:22:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 10:22:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2PpTs6Mn+ijtCXqDHn7rQVgpmI5JbmTT0UnJz+QbeYklxVEcijtcQpm1FLliTmH5K4rYWJW/hecAI/vxxKGsAXyGrDlEBUKPywiODMUfyXUXdnHBhvSdFmbrSGMAqCjNkF6MIrxzTsT0KFS+QDyOL2DVC2n8DoXfZCYz3JdN9PICYg3fvwryBbKsBDKo27V6uHihGO/MN23s6VOEzTJhFbUa4qYKG4tY9rFTt3GCh+5kjTyql3kAwIWm1Qr3P7iGahnmUItFY9s1d7Soy/ncsyshPby4tgVMt2mF0ppCiPS7DJ84AK9GN1cVvebjEY4El0qwMMUNUs1EQpvyelshA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es/46ducV5RKRGGBV4m3sRozHv0udi4qxglXOiGIXs4=;
 b=aJ467OmDPWEXR82/qwNKTm2132X23PWvyact7X7X0jxDS1DLW1ok3IjcQ3KkzJlHzLfCRh5/SI/Vz54B/3raV3779xpL5E7GUrsZDcWbsHqgfuu28MrlwOp651nAMW7eV+X7uHPpwXiS+1odWClIAFCCanvB3TLZrGPMvwhHlVSp0g/nkDwxF1ryEe1uPstA7oNgqpqNJQXWfQBNlOwAXLOZ4RLAS2A8Rq7qKjPB1xvCkmD1XMflZY23q49JEMoKh5MCrPr8UwZxOXFWNj8YETDdrkAdRaDthj8JDVLo7VQPzTDtLYG0rJsdD15xxYsHXQESjUgwgOoOhpH0XsElaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 17:22:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 17:22:01 +0000
Message-ID: <ff314427-1c03-4e26-be19-c5f5090f3d8a@intel.com>
Date: Wed, 2 Jul 2025 10:21:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 30/32] fs/resctrl: Hide the BMEC related files when
 mbm_event mode is enabled
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
 <4769751d1de7c4f66b1c7f3c5ea7eeeb49951363.1749848715.git.babu.moger@amd.com>
 <3c753f3c-e91b-4cfe-983d-efe8ff07b750@intel.com>
 <f85e467a-1d17-4f34-98e3-512679baad47@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f85e467a-1d17-4f34-98e3-512679baad47@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: b9242715-d2ed-463c-3fee-08ddb98cf4d3
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aXNjZ0xkMXJFQTNPcGRWTlFkdFhyUm45YlgzekFubkwvRXR2bWRHdXI3VjRu?=
 =?utf-8?B?MkJ5K0hvNUtGK1F5RjB6TllHTFk3RzZBNjZETU1ydW05ZHpaUXBBSUtMcUo4?=
 =?utf-8?B?dzRtMytDb2xUczdHL1dGbWRwRFJxMTNHcCtmdEFyTExIcE1QempvbE1ieVB1?=
 =?utf-8?B?Ym4wL2xBNEg1NnVjd3I4WlQxRnlZaW9jQVdtWVd4YnR4dzdMMTRma2pwZFpr?=
 =?utf-8?B?V01yWGhwMlZFcXZXdFJOR3Y3c1NBYjl3b1R5NHZXeFdHTU1iYlhvaXR1Lzg2?=
 =?utf-8?B?eHJIUkVldk9rRlpIb1JFSFdUWFE0YUVZcFh6U3dlbnQ5TnlCcXBZc2N1TUp3?=
 =?utf-8?B?aHovd3FYYUF2WWpOUm44blpXMVV5RGVLempmdFNRK3FtTkhKVXZRandWN3Ir?=
 =?utf-8?B?RmRHOGV2aU9GOSthMzZzWWxTZDN1MkVaRk0xUGpGbWtNRzhadmpPU2dPNTh3?=
 =?utf-8?B?RFVRRWhzVkRMSlNBRUZzUFdJOUQrSE1BOTFXTFVCZDBqNitxNklRTThYRVJE?=
 =?utf-8?B?ZVZUSHNCMEtvbGhoOTNLcnQyckRZbXBhdTYwaG02TW4yc2o3MDJZbGhvZ2VX?=
 =?utf-8?B?VDBEQk9CTkhOTVVuTnpMb2pWNlhxWWdCVGZMY0dTYnhaUXJvRytZMGJyMldi?=
 =?utf-8?B?aXFKMklKSVlmNUltcUZ1aVVTSkZOeXMxUmF5TFRDSnVMQUxJVEE1Sjk3ZDdo?=
 =?utf-8?B?eDBTNXpRUHUwNXYvWThGNGdPRGtMUjFmcmcyalFYRDFCUFZpRjZveUhJWSsz?=
 =?utf-8?B?TEJaVWxxOFMyenJ4SzYwRzIxbXlyb3lWZzRMTWJqbGpUSTYyZmJtUzdEanpO?=
 =?utf-8?B?dHZsTjNiblRZMmFHVEt5MDFkOWdNMVNzVEUyeXV1QzlSUzYxOGd4VzAwMjRT?=
 =?utf-8?B?dWFIUXIxWjAycGMwcmxMejJ5UjNNVnlYcXFSaU9mckJIREZONnhMa0E4eXcr?=
 =?utf-8?B?dW9FditqU2E0Mm5ZTk5HQmZ2ZzgrSFdxcDdDVllESTRQTythWmFYYmRIUWhn?=
 =?utf-8?B?NEVSZTZsbWgreCsrLzQyajByam9ubVFKNDkvdHl2a2VxSUdkeDVDK0xzckxU?=
 =?utf-8?B?N2xGQm8rc1UybDJwdk5Id0EvR1JkcjJjZ05MM29jQTF0dWRWTVI1Zjh3dDJK?=
 =?utf-8?B?UWdJVmlUOEw4eVp4Mm4xVzFIU0ZRbURPNW8rRk9VU2tEMjMrZXVOQjhKUDNJ?=
 =?utf-8?B?Y2JRRUIxZk9XQmVSSjN5RUFPOXB3TFhtNk42WDQ1NEo5c0lPNksrakV5WFhR?=
 =?utf-8?B?a3RsQUNqZUp5cHFNQ2Z1WUdBNXBDbzdqTUhjeFFYRVlvWnhXSTQwR09MSHNO?=
 =?utf-8?B?WUF0clkxVnA2K0NCODJWQ0VhL000a1lBRmx0VFA3Si80OUFEaVhONjFIelFi?=
 =?utf-8?B?Vzhkdkh5OWZUWFB4MXo1SVQrb3p5OCtaem5zeE9oNHk3d3VkWTJ3Y281NXNY?=
 =?utf-8?B?N3F1YmNrczdLdnRKZVZXTjVpaVNjMVVNTnNKSjl0aWF6QmdjdUxZN0RpemZW?=
 =?utf-8?B?NDF2VjBCcEtHWE1wSHVnWkJ2akpKN1MyeHQxWU9LL25xbzVSNWZhOU5KSjhl?=
 =?utf-8?B?QUR1aEwzdVJWQTR5Q21pbkJUVlhLY3dpRFczaUVpbEdqazF5U0dJVG1DK1VL?=
 =?utf-8?B?OFQxcThoUkNLblRSUWJWS1BRb3hiYVA2Z2twakI2cmVJSmxpbXpHQ0l6eU1M?=
 =?utf-8?B?V0NaODl5eXdPcVVIRk13eWN0VmJxRTczV3ZHaEtxMVgybzhUNkJteWhxL2Ry?=
 =?utf-8?B?b21OWWhMSm84T2IzZk90YnV2dGFOYk1tamlleENiM1pqUzlVK0dydG1Xc2VT?=
 =?utf-8?B?bXJtTTFQRWFFL2ZpU2YrcTdvNE9mT0RkU1AzaWxiWGFQY29GYnZDcStiYnVh?=
 =?utf-8?B?djdFNDB0UGZBaTIzcTRTNVhydGMxS1MwQlh4MGNscTdZSHNMMVNaSkkrKzh0?=
 =?utf-8?Q?8RJxgyOh9BE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U25vZ1VuOEhxdWtmUjA3cEVmWVhGdlVGS2o5blE4SjdSZXEyWkZIajlpOGhP?=
 =?utf-8?B?bVYreTdwcjlnMmlPRTVHSjd3ZENkSW1qbDdUY0k0TER2eGpBRUVyeDFWZ1VG?=
 =?utf-8?B?cmQyL3NOQzFRREN6anh6VFhpNEZlRlgzWldNcUVyUVNnMlhIbElMQ0tNamI2?=
 =?utf-8?B?bzZDTFVaQm5EYldVMjdSNnE0Z1h5djZrQU9RV3pYNUhPVFE0NWhQM1RFWmpR?=
 =?utf-8?B?d0Fac1Fqci9lYy9PSU1mS00xZUlMc1ptRkFIUnpqYnFwNkxDbDluSWNlRUky?=
 =?utf-8?B?bjFEaDhlcmd0S09TQXR5TVl4U0luM3Z0T0ZCa0dTTmhLV3pSNHR2dFFXME8v?=
 =?utf-8?B?MklmeUV1SUdtaFBoYStDTjlBdzI0MG5nbHZPQ1BCUnczdHBzeExHUWVrQ05y?=
 =?utf-8?B?dFVJUVN4ajcxeHk2NWRTRUUrM3RWR3BZVW9iMWJZTG02R0pXKzM2T3dCaFd4?=
 =?utf-8?B?M0l3NDZLWk0zVWJUNGYrc3RLQXpRM3JzLzZ5bkZ1blNNb2dqNVoyUzVtbFJx?=
 =?utf-8?B?b3h1dDVDbDc2d2FzeEtReFZpazAwZU9UYTFNei83QTlFQ1hKdWcyTThJaXR3?=
 =?utf-8?B?eXBpLzJaUGJVRVFYSHFUM2FhQThaQXVxQnNWdm5hWVRBb1BCKzN3V0FlZEli?=
 =?utf-8?B?SGdmYVlIbkZXN3U0QnlvU2RNSDV5dDVXOEIyeWVwL3hsVFEwZWNxbEdWQXRB?=
 =?utf-8?B?WlZ4QzZjbkJpYW4rMnhmdDdUb05nRFNmdlMyYUg3YjBPczZHY0tsVDB6TkNy?=
 =?utf-8?B?N2F2a0pua0hQOHhMdGJFSFN1UDZ0dXMxNktrRTk1a1BHK2JMY2pPalJBYVlX?=
 =?utf-8?B?ZzBIVXBjY2NEM1ExbUFSbjdKdThmalJnVFMvYlJyMWhrRUtJWElRTTNHMDVC?=
 =?utf-8?B?eVNaTkExbmY1ZEI1WmkyNUhGTHdnUWk4SC93S2xYV0E1Q2xLZ2RSOXpCSDcw?=
 =?utf-8?B?aVZWc3VDS28zOG8ralRPZis5MnZZY2RTdWwyRzlNVjZSc1RiYXppV05FR3ln?=
 =?utf-8?B?bk1ZSEJ2NHR5RWQ2MjVQTzNoUzdKOURKeXBSd1ZxZWVPK0NRTVRpYXNYN1Jq?=
 =?utf-8?B?S1pzOFpaUi9XNWg3bHNvbjlCYXI3Z25GclpFc3RIbjNWUkZJY29Md3NlYzI4?=
 =?utf-8?B?dFYwQlNsc04rTGR2Q2U4OGdSY3hYYXA2UWpUUmpueWJoTzh6UnlWeCtuaUY0?=
 =?utf-8?B?M0E3ZnFmdjV3KzZLWExaVFpMWjFwY0ZZY2ZVZEUyaHJVWWpMYlBmTW5Tejgw?=
 =?utf-8?B?OU9lSTlLc1B5Vm5nejI1WUJreThVUlIySFVpTjVSNGNNUFdrb29MOVdBM1dQ?=
 =?utf-8?B?T3U1ZUF5QUhCcGx4N2JkbERtRlFwZGZDQjNsaXZRa1djZ2thUWtkMnlOazhj?=
 =?utf-8?B?ZklBK0RYcHFDNTFPTUxFdUlOTTlTdXRldkY4bFpvaUo3dnlpZ0ZKOUdBemxw?=
 =?utf-8?B?aUh6ZVlyUGpzZk0weURkbDZYa1lNekkrK2lmMlhrNFV6SmFZMWY4WFVOSHJp?=
 =?utf-8?B?SFpxSEptTTBSOWM5SGlRcG00VTk1ZlgyUHRtMmt4RjBrNlpBZ01OMkNmWm9k?=
 =?utf-8?B?aEVIcXVzQXRQYkVTNHR0ZVFtR2pvTHdQdjJjYXMyU3IwbjJPM2ZqMHRjYk5p?=
 =?utf-8?B?ZTY2YjIvK0xSc0VON3FpOFEwRDVEV01zMVFLdnZKd0lFQzhLTE9xWU4zZDZ2?=
 =?utf-8?B?QnYrTCtpa0R1UENIMmFmcElsTlhUaTBJZjNmQUtXVUZtelJsbGN6VHZFSkZ0?=
 =?utf-8?B?NFZwWE5mVngvNTRHL3I2YnVKWC9lLzJ4ckNFVEZJZkY0SXdMNUlIS0hiZVFX?=
 =?utf-8?B?RUxqbWtTaWIyQkxvTFM5aVZ0TGo5MjdXV1IyU3h1STFRS3V2RDA5dkpwRjlN?=
 =?utf-8?B?MWx1UmhwQ3VqZExaZjI5RWZwTHFvandjRVZ1UmorcTF2clJBTUtOOE5WNzJ4?=
 =?utf-8?B?SUkyNk1tZ2E3bUVRaHRYYmp6bm5WYk1rT1A4Ni8vOTk1bDVWNUxBekZrT2xD?=
 =?utf-8?B?K21ibEpGY2podXZDbUJKZFo1QXdMVnV0V0ZtaUNnd0JQRk1UdEx1dk5kY2ZR?=
 =?utf-8?B?Qm05RUN3SzZqaFZlcHltSXJ4L1BtTkJtc1J1WlcxazlkdGY5b3FWZDBaVDBs?=
 =?utf-8?B?aCtnVlpDQlRuOEJkMGFuc2t1QjZvWDB1M1FYUmoyNmZ4ckZCZm9GZ2xzOTA5?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b9242715-d2ed-463c-3fee-08ddb98cf4d3
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 17:22:01.3958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoLULN2qxi2kYs2VJ26JzcdrhhwIASr4D5NZSiHRQ9+hIZnnmxxWHu3VfR0qiJtp6Nf+8Pk5bQSrTq5QHYz+CqzFOQSn9pCDe2Pf42ya1BM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
X-OriginatorOrg: intel.com

Hi Babu,

On 7/2/25 9:42 AM, Moger, Babu wrote:
> On 6/25/25 18:39, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 6/13/25 2:05 PM, Babu Moger wrote:
>>> BMEC (Bandwidth Monitoring Event Configuration) and mbm_event mode do not
>>> work simultaneously.
>>
>> Could you please elaborate why they do not work simultaneously?
> 
> Changed the changelog.
> 
> When mbm_event counter assignment mode is enabled, events are configured
> through the "event_filter" files under
> /sys/fs/resctrl/info/L3_MON/event_configs/.
> 
> The default monitoring mode and with BMEC (Bandwidth Monitoring Event
> Configuration) support, events are configured using the files
> mbm_total_bytes_config or mbm_local_bytes_config in
> /sys/fs/resctrl/info/L3_MON/.

A reasonable question here may be why not just keep using the existing
(BMEC supporting) event configuration files for event configuration? Why
are new event configuration files needed?

> 
> To avoid the confusion, hide BMEC-related files when mbm_event counter
> assignment mode is enabled and update the mon_features display accordingly.
> 

Reinette

