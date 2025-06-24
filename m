Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C5AE25BEED;
	Tue, 24 Jun 2025 22:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805240; cv=fail; b=rLN3qptUn0QLX16pjSgL32mmTQrXD65rV64AMktUoYTwW2JrvTslJD/O4o8th7XbeES71lIH5cPIgYDdXVOSD7hSCPjibxzeDTWgRjwxsaM14aQQt1W5cDVR1YTPVuez3JeAjmlH6ZmpHNAV4F0vE4PD4c1xfVaoi5FibdAfPcA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805240; c=relaxed/simple;
	bh=Bve+qdjcRFQPiGrH1fHR+Zi4UhR8nE6G4zRAB0A26gk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HsSkNE8YtfVlPF5o5tbA2N1VqZJIR3G7lu7flt5iehXYcwWK5S3Sy5K/92HWgWuf2A6AD82+yq/UwsRVQfdVxP92Q3Jg8qjsIbonWh+RKXT7bgbyumf0gOXkJi5aXG/jwmxzTmmo+RxedbKdlQ3HLdvFPKwq3eOBZzUU2ousgt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AA+S8sGb; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AA+S8sGb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750805238; x=1782341238;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Bve+qdjcRFQPiGrH1fHR+Zi4UhR8nE6G4zRAB0A26gk=;
  b=AA+S8sGbCeRKhB0uSyJZ3lfEzkUNVLc5xAQB61S4Z5B1Fe9oyS3e3F8n
   PRd5ECq4egydsLDOCjlLw/Nl67DcQ/gpEj/5oJuP+46kzlKdOucTTpsCF
   nm1jfSsBOzZqNIFBFMGRd4fzfwzn1Y1qb+h2BKNejjHw/nq8pDS+8nIWk
   z/PQDaqBxW3vN/m1FZEzGxzxeKIQd11JCfqLGmhe+iegJaufZUNay0j81
   +6wP3XQr1pOS7v/VqRrb3kpkY3Lxf61a5m4loONX1HWRfUK7weAzLkCqR
   3GTwi/EStMKDm1/Y46GHIPslUSIw7elKNQ1qx9HPTAky/FXkh5/6uma5k
   A==;
X-CSE-ConnectionGUID: 6OB0vF0HRsei8fZHbhWYiA==
X-CSE-MsgGUID: A8Zivj0PRfOhEwMjFIya0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63664178"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63664178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 15:47:17 -0700
X-CSE-ConnectionGUID: nmxWr6xQQzes2GqOs2VZ6g==
X-CSE-MsgGUID: N51Z1UYAQT+q8EJH2RQdZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="175674416"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 15:47:16 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:47:15 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 15:47:15 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.46) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:47:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rx+viFj6iFtofAvGiPxdT8eEpRIVhdSkmVnbjNG7PnbB9A5HMN4NkdMqWVVPcuidS1j1uDlKk5k/6//Zba9oqJguF+88pvbNNp+6wckzJdWbU+E0nVoRvVhAj5rqpyECQGNCXYiyIZXGenj9lwHsVjhcn+n6sWmuw/MDJHvs1YCBoW2CiuvUXCb9VWpV51g+4LMD7aZLFw5uswDYZBsLqHu0i0hY3P7NnLgB8yangMvbM8RxokgVNV2BAGxRz3URi/cRNQ27JBCgAPzuI6zmGVc3+jZPDAjkELSSAMSBi+RNRQiyF+WA7GhtrGuu9xJu3VxQZ89Pr0+cNYHXnakpXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppWdk4KmyRczpz5fwv/H8sJ2fzKrKM6wOBFY6aTzQ20=;
 b=O/HDA7KTas2NY6gsTiPV/0yYOqRpALG8OsKJAtLs8qZADw6AKkQApIKkkKQnfX6QCe7180o8EABd3QmNGLge4DQiE5ov7IZnc0HpRMjUcgrx838r7w7/jAGINlENd0ynI07UGRkJFU3rjzm/I2gCW58tby8ltUgHdtyJecmaKVvlzEn6OOAgaKq7d4/44YYs5Tk2GV9lbZxZpz6ry/FC8Ta4yxlBEbQIuY7b5eFf/cBVl5XGYw49iFz6ikW+hxUgkXSRLUcbC/4ElVjyHkQApLxN6YOrhxI/w+7vpApz/7m+a5id9s2frdlTxl+756Wgq586K57J7fXm5tTP8FS/PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Tue, 24 Jun
 2025 22:47:12 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 22:47:12 +0000
Message-ID: <94825e50-1f8d-4612-bdab-33db756a19a8@intel.com>
Date: Tue, 24 Jun 2025 15:47:09 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 11/32] fs/resctrl: Introduce the interface to display
 monitoring modes
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
 <b1192216e05c5a5a0963b43698760106644b95eb.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b1192216e05c5a5a0963b43698760106644b95eb.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0095.namprd03.prod.outlook.com
 (2603:10b6:303:b7::10) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: e5dcf636-3014-4f70-6d9c-08ddb3710edd
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M1RQVWJ0aDhDVktsK1Z2b3lGYnQ0YlhnZHBtZStIK3JNRHB2aWhwcUFDeExC?=
 =?utf-8?B?MWczdTFhUmFvWnFaWVZlSlV2VHh1S09OV1ppSmpuZE9yMUpnMWFCaitNRWI4?=
 =?utf-8?B?YURDd2MyUEFjckZIdzlMSWdPK3pGNmxsWC9tc3I0a2w3YlliWmtJbTVHOUlh?=
 =?utf-8?B?MkJlT1VBczlFL3NRT1ptUVZpOTNwMzRhaXRGc25MWW50ckhaNlNwZXhCejZS?=
 =?utf-8?B?a1RMRGthQi9yVW5VRGdpdURDZW9nWTlNSFFRK0ovTEdEeHdkTEx4T0FLd3VH?=
 =?utf-8?B?TnNFUDJQNmljcmZUL2hvWTdrZDRKdGYwVzBrZ3pkQ1U3ZGgzNGJqb0UrOGt0?=
 =?utf-8?B?NDUycjZPWmtSWXZONXIraFhJcitZSk5xSDJ3Z2gwME0zUllVWmdreVBOdG9S?=
 =?utf-8?B?b0U2OG41UUVQaWJ0WmozWVJ4cWhGWlpvU0hDVHJ3d0JvMWVITCttV1prRFdp?=
 =?utf-8?B?bDR3b3JaWnVIWkVHVlNneWZ2YUVwTnJoSy8rdlVGcHRvenVtb1I5OVRRelNK?=
 =?utf-8?B?Qm4xc3BzYm9MT2pVVjdMTlFHRHBQTmsycjFqUVk4MzFRWXpVSGZOWTM3WU55?=
 =?utf-8?B?OU1tVDZOM1Z2OG9rQkJNM0lXTTdhT3I0aGpJOFRIVFRlcUppRFFXWG0wWmt1?=
 =?utf-8?B?b3V5ekZHVzliUWJmUE1CM1BpOE8zMDZlUlNORU44Qk9SbGVtYTlBWUpIRS85?=
 =?utf-8?B?bUhjbjVVUUpMWk51RmFuckxxTmhKSUZKeVBhbEUvamZZaUdzNFdJUzJJbVpE?=
 =?utf-8?B?RGZJMllLb2txcW5BN1lPVlEyUFpXVlJIZnBwNHIrRWZ0QUtWMWFJSkVvUVN3?=
 =?utf-8?B?T3greUVOZElWVm9vc0taQW9ML1h2Uk1ZSGpzY0gxeTZrZkN2NVdxWkxhNmJo?=
 =?utf-8?B?WVBKL1lla2N4a3Bjdlp4NGxpNmxYVEkxNnJtdk0yMjhnZzkyUVk5Yks1RlBk?=
 =?utf-8?B?VFBYK0ZLUVpid3puY2haSlhlcVpvZXZ5bFNROURvY1l4MENMUHFnMSsvTmhZ?=
 =?utf-8?B?YkMvOU5ReXFmOUdYMjZUQ3U5dEc0VDZHTDIxbTR2QmhocmFsdS9yNGZnQkFW?=
 =?utf-8?B?UHI4SlZWRkIvZThFOUh5cW54ZkZjcDFNMHlPc1M0UE1NNklFNFVnTVVKZ2Zx?=
 =?utf-8?B?SlRXVDdveXJMOURjOXM3bHZDN1NWdDFGOTFRTWhlQTNvVGNLdks0UTByYXM5?=
 =?utf-8?B?SHg5Mkw3WTVhNVYzYytXMjdjdmQvTWpEbzFmczRCUFg2Y1A5YzhvZmcxanBY?=
 =?utf-8?B?d3h3RndQUFlMRUxEazN1dmVVQkVFMmpkY09FZXZhQzI3eEl4QUNIWDdZZjFO?=
 =?utf-8?B?VFRyaUwrOXIwRUVyUUswdDNxL3dOa1JmWHRkME40cVJ1SnFQYmpaMnVmZ3Yy?=
 =?utf-8?B?ZEZvb01lNlYvTzhzUEo2Y2k5blRreXE0RG9OczVORkdxQTJwR1hEaklFamFL?=
 =?utf-8?B?cjZ4ZjZ0aVhIZSt4STUvNlo5OWwybjRidlpybWJWWDVrd1FmQmMwQ3FmRlg2?=
 =?utf-8?B?MTV5TWcrWWEveGFaa0xsTmhDQTBLRnhIcUlFUVZaV1loUWJJUE1XMHFmR0NX?=
 =?utf-8?B?eFY3ZXlVUjFiTmZ3NzdQUjhvQUtLdmt0Zmc4S2JsYW8zN2UxWlBSMDlEZ0pM?=
 =?utf-8?B?cHU2ektVS0tsalhwTTZzdXpMU0d6bWpiSzRkY0NUN21kZ2lwQkdnVWxsYjJE?=
 =?utf-8?B?MFFRanFPSmxWbWN6QUxNNmhicEh1WE5XK0tuSGNPa1Z2MWxKOU0xdjZkaGxL?=
 =?utf-8?B?MjFNY2hFaC9id3RVNnRkaDAyYWVOZkZmM2Y5aGZVcGVxRE9CWm9YOHp1dmJR?=
 =?utf-8?B?amZHVFdCZ0dBcW5XTytTUHQ3ZiswRGdnSU53dkdHZ2pPWklSZ3pxcDR1REc3?=
 =?utf-8?B?RlZIbUlxZVoySktkM1BtTm55WTVCS1BybGVhMW83bTR6OVNQamNkWFlZWG5V?=
 =?utf-8?Q?3Y4xFx10EXQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cG9zckVTMUlPTXhTMGpaMXlmNUlQUDU2UkJqL1VlSjVseVR2alkzN2tlWjg1?=
 =?utf-8?B?N09SY1Z1YTVoekNXbTJGOEo4Sm12ZDJ1Wm1scERSQ2tIZERPV0R2OGZUMjlo?=
 =?utf-8?B?L3JmbVdlTE1JemhSL3hseVZ1UjFrUU8va3VCNURxZjk4dmFDTlRpTHRIMk5V?=
 =?utf-8?B?aGttdm52Q1BJa2lFYW9UYi84cmN6WnhBenoxTDV6d0IyTHJqQWQ4eEl2cm1m?=
 =?utf-8?B?dGh1R1N6d0oxd2lQV3gyeTFKdEZ4WS9PMHhpZk1oM1JERUNleWhaWXIrK3hD?=
 =?utf-8?B?dzJkT1NHMVVNVHNDVFozNzlEa2ZkdW93MWxIWFZvUnkxQjYyUlJEczZBZTU0?=
 =?utf-8?B?QUF2Q1VtWTFJa3pZYVZWaUlSOVV2c3FUT2ljRmY3RmxDSWhURlBFRDdzZVZ4?=
 =?utf-8?B?d1cwQytDWlMvK09Mcjhyc1lGVVpaN1p3QUNyTlhkSGlJVjBYclhTYkN6SnQ0?=
 =?utf-8?B?VTRXdUE0V1BlZlh3YmMrKzJsTlFqL25PczRPR0VIT1ZYL1Z3dHJXOFdHRHFv?=
 =?utf-8?B?QktKTzh1RzdIaGE4Q05sNVFIVVppQ1BqazRSV0plN094NVVJVm9oU2dXVERW?=
 =?utf-8?B?WDRGbHE4aUFJVEF0VGwraFFZMnMxRVdCNzc0ZDYyUFljeHFxVTVaU2cwUGly?=
 =?utf-8?B?V3ZPL2xsQjRNdisvMkFWSGxVbGpoK3RITzhYaFlUQzZudXArMlNqNUwvSS9D?=
 =?utf-8?B?b3lhVEFTbVQ3dElPRGFoWGNmWW9PYkF3U09COGVKL3FUaGwzWC9kS3laeFZU?=
 =?utf-8?B?Y2NCbU54YUNmaXdjTFY5TnFMSG5Qd2ovcHUxMExqS05TSWRNWFBFeW91TFdm?=
 =?utf-8?B?S29MU1NZTW1qc2tjVG1ONGNhaTU2Z1VRdjlURFNsY2lmMFdRbzhZK1hVKzV1?=
 =?utf-8?B?UW5zdjJwbWN2ZHorSHM3d1NlNGZhcjZlT1hJcTJqVlJaTzFCOHdLeEpRaFpq?=
 =?utf-8?B?THZkalN6eWQxdkdoNUNLbkJYQlFNUVpSbTdnQTFPaGVUOUNxcGlrN0VaalIx?=
 =?utf-8?B?WjJBZlFrU0xGSEJRb090NUY2MUFwNHVuRlVPSmZiNm10VkEycVZKSm11Smwy?=
 =?utf-8?B?bzN0SjFTQW45eGw5a0RqbjdlaXpJOE5BUVl1QW13UVZBRGQxamFUcWNZVFZN?=
 =?utf-8?B?dklPQktsdWlKSGZoMG42b3FCWmNIUjJFYWR6L1dnNnVwN0h5amxaTUhnY01U?=
 =?utf-8?B?K0NUUEh1Z1NXbEJJa3RhVVJWdE1sQU42RlVmZlg5RG1Ba09UZWdueVVLQnBF?=
 =?utf-8?B?TDZLeUlaOWdmVDkwLzgrQWdkcU9hazRkZnVhV21TN3J0TzRQUzRnY1FXQXhB?=
 =?utf-8?B?M1Z5blZtWjdtSmZVc1VxaG1zY1NoaVhzLzZUUmlCNEsySmF1UFVRZS9JVnUz?=
 =?utf-8?B?UWNMT0RXcFJqMmg0UzNvTUJjcU45dDJmeFhlWlk3OVZKajdxcWdob0RzaHNH?=
 =?utf-8?B?YlV1UW5KMEYzTmRMTVZpVGpOSjRWOFc0QkhncHhxcUVHYTNUMXFTcklMNHlB?=
 =?utf-8?B?cHJDbzNBQUxlWVRjU2ZCYkZORmlNb2RxbFplcVdWNVRaYWJDVlFoQ2xpOGNB?=
 =?utf-8?B?YmkrUHZHd09EdGZza2NrM3NyS3VURjZzVXl2bldmNHRaRGc0SE83U0x5Z1Aw?=
 =?utf-8?B?azdGSTJRT1Vic3gzQ3I1TVZ1ZlhqcDdneUl4Sk42UGJZVHZkOFFpVnE2aHY2?=
 =?utf-8?B?SUF5UHdqdVlsRmNVbkd2YllJbkxxTGxlcnk5dUFyanc5VG5pWjV6eWF4VStw?=
 =?utf-8?B?SXJqRUlOdU1HYVZwckhrMm1FVXRjbnUxd2c2R1F1Y1poNi9YRm1RYVM0M1BI?=
 =?utf-8?B?UWczVEpGWGJTMjFNU2Nrd3pUYnIvL0g0blRscThPdWtSenE1T1dQNFJ5K0E3?=
 =?utf-8?B?b0xHREs3QmVjZGhLczVQZEJVZGRYT0Z4ZExDR0IrL3BFQmlLNC9HVU0vSWhX?=
 =?utf-8?B?dEoyWjVNQVlUUlhmZTFpT213R3lUUTRmODZ3MFFyWFp2ZXowbHgydjNSU0hV?=
 =?utf-8?B?OVNLSnkvakZzNU9YRmNKU2J0MllKMzZ6OSs3dzlLbHZ3Z1AxeVpTM01xdE1w?=
 =?utf-8?B?WEVxQUdUdmdXbFNrSzVQd28zUVVDK20zRDZRYXlhMHFlblNrT1VodHl4WE5J?=
 =?utf-8?B?Qm9YN0RYcmlCZG5OS1Z1NmN4UVVxeFVOa0MreFZZTVpFWlFtVHd3WnFxM25h?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5dcf636-3014-4f70-6d9c-08ddb3710edd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 22:47:11.9737
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LKhUqL1vDY9GbKQJUcMSWgW3e7S8yQNSiZoQScR6gmM2tiwbSfY5w5U6wKcneDAo6RDvbV6vBLEwJU85hG2LzzeAMSZnjooHZrvuVHXpaBE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> Introduce the resctrl file "mbm_assign_mode" to list the supported
> monitoring modes.

"the supported monitoring modes" -> "the supported counter assignment modes"?

> 
> The "mbm_event" mode allows users to assign a hardware counter ID to an

nit: users do not assign/pick the ID, this is done by resctrl. So perhaps
just "users to assign a hardware counter to ..."

> RMID, event pair and monitor bandwidth usage as long as it is assigned.
> The hardware continues to track the assigned counter until it is
> explicitly unassigned by the user. Each event within a resctrl group
> can be assigned independently in this mode.
> 
> On AMD systems "mbm_event" mode is backed by the ABMC (Assignable
> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
> 
> The "default" mode is the existing mode that works without the explicit
> counter assignment, instead relying on dynamic counter assignment by
> hardware that may result in hardware not dedicating a counter resulting
> in monitoring data reads returning "Unavailable".
> 
> Provide an interface to display the monitor modes on the system.
> 
> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> [mbm_event]
> default
> 
> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check to support Arm64.
> 
> On x86, CONFIG_RESCTRL_ASSIGN_FIXED is not defined. On Arm64, it will be
> defined when the "mbm_event" mode is supported.
> 
> Add IS_ENABLED(CONFIG_RESCTRL_ASSIGN_FIXED) check early to ensure the user
> interface remains compatible with upcoming Arm64 support. IS_ENABLED()
> safely evaluates to 0 when the configuration is not defined.
> 
> As a result, for MPAM, the display would be either:
> [default]
> or
> [mbm_event]
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 31 ++++++++++++++++++++++
>  fs/resctrl/rdtgroup.c                 | 37 +++++++++++++++++++++++++++
>  2 files changed, 68 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index c97fd77a107d..4e76e4ac5d3a 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -257,6 +257,37 @@ with the following files:
>  	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>  	    0=0x30;1=0x30;3=0x15;4=0x15
>  
> +"mbm_assign_mode":
> +	The supported monitoring modes. The enclosed brackets indicate which mode

"The supported monitoring modes." -> "The supported counter assignment modes."?

> +	is enabled.
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> +	  [mbm_event]
> +	  default
> +
> +	"mbm_event":
> +
> +	mbm_event mode allows users to assign a hardware counter ID to an RMID, event

"hardware counter ID" -> "hardware counter"

> +	pair and monitor the bandwidth usage as long as it is assigned. The hardware
> +	continues to track the assigned counter until it is explicitly unassigned by
> +	the user. Each event within a resctrl group can be assigned independently.
> +
> +	In this mode, a monitoring event can only accumulate data while it is backed
> +	by a hardware counter. Use "mbm_L3_assignments" found in each CTRL_MON and MON
> +	group to specify which of the events should have a counter assigned. The number
> +	of counters available is described in the "num_mbm_cntrs" file. Changing the
> +	mode may cause all counters on the resource to reset.
> +
> +	"default":
> +
> +	In default mode, resctrl assumes there is a hardware counter for each
> +	event within every CTRL_MON and MON group. On AMD platforms, it is
> +	recommended to use the mbm_event mode, if supported, to prevent reset of MBM
> +	events between reads resulting from hardware re-allocating counters. This can
> +	result in misleading values or display "Unavailable" if no counter is assigned
> +	to the event.
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy

Reinette

