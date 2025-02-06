Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7E3236426;
	Thu,  6 Feb 2025 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738853791; cv=fail; b=EpxRWwQFDsFAjTqYVhfsoQJ8cIeqOBr2mtkX/KDG+L+eekKifQasvUnZY4fzdcwWMWKAD6Q1owDv1yO2YYJYZmbVYLBuxnZqDuPus7KdODndfN432KF8vifLH+dOU8+I9TzhflhrcKtrB89HR0WweSrqlkqLrV6VMoHbsSr6g+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738853791; c=relaxed/simple;
	bh=/q+D3ari6B8/glSMpcmZdHRYJ1vdanvUofM2MNM7QY4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Adew6qKS288+F96z8ZQ/RsNjPHO502au4PO2JMwYwXXwk48Js94+wf7r59/RKIEX7tFsRMjGmZieZY5Q5HWPrJY0VLusj0Gw6ABjHV82qOXuNCIaCdyuz4FxodHP9pCzBaPeniZhrkIJYTU67AxfeF06SJ7US/OGj296/z6jGFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUr6kDnA; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUr6kDnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738853790; x=1770389790;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=/q+D3ari6B8/glSMpcmZdHRYJ1vdanvUofM2MNM7QY4=;
  b=HUr6kDnAlcUsqpWs4Mds3HI7gRMatrFIUuI9FzCF/sozMtu1xVhu+POf
   dYsjyVNKE5KX5ysydfzywg8LYHsbvjtAa+FaN3T6a+htrXsrnsylp3cxg
   hO9deaK+3dSyaw432fMB6x1s7df0W4x2OsfeotvLQ5Ap/v9J/A6ltEtbu
   XvpdLX/Yu5oRaOs0PUn0f5Op3F6xKmomJfB8DwfWY8+EXlePuw2RqmSGW
   mguNHCfPef9e/R0AREJl6zFRuz27QVQ8bR+sWLSx/V+b4AtQ2peYbu1Mh
   i9CFinNclrQjwoJZjWhCOF4okIkepl3kD/hhq544heK42yt9dCGSTMZDw
   w==;
X-CSE-ConnectionGUID: dPsFLuSXRC6JzFFlcvxLIA==
X-CSE-MsgGUID: y/ekFn9SQNmWrmlsCjKqRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39484579"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="39484579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 06:56:29 -0800
X-CSE-ConnectionGUID: EZLxRTQqTU2dYLkavfw2tg==
X-CSE-MsgGUID: l8HU75U3QnGbh2dxeepn3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="148451520"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 06:56:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 06:56:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 06:56:27 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 06:56:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDjNGM7QDseZ4SM7F1L5uqfvHyknrgUcaICTQUzsKwEwfgUA965N+zNJeG/ntprzEsO8QGWJeMuG7QWriCL+cskvb6J0wJISO1llenUPZh4aoy/9xAgmkt5NSI0Cif5ReXMBFTfspW4qI6QCezayr9iO/VI7fUP7mDS+N3nSLr6bqJsZ3406YtS56aCg3GOwvYktKBgCEVD5jsFMBFt0am0lArFspzZGMA6+NO+GsKhwbXnOf6leh4Z809G6CIf9GmdZ+Yx0/LsFr+fjeaQvx6CfYqoQbrY2XJPY9yi7OqkZp45gFqdv4Kn6H+KH/LbdwLjFz/dz8OxKf3ApHygLgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oFy9kzSSuDAMgbxF4ev3hG9MnS730buw2PO7kmGfays=;
 b=L5ejg9+knghDr47P124vEWyv9QJFpQTCHSwfq7APMVDNH5YOvivyTeyYQn84XgpWZCaKytAOqNUB470pO+Vchwzn68v4pw1o8PLfNVpM3WK7LLRTeImpMWWMTqg9cn1oKgeGc83VZyDcIZMl+9oK+4TexxzUUuXOWXoXFtAME09l6Uh/N+sgv5Q42rTKW5/FcBb7Uocct+SPl3Lfjxhqulix8E45Mj6a4WagLe2XnTtbZ4f0urv5dGZvIr1Ku2xU4UmkyEB3HT1Kmr/LSpBbkeMkTCE85W47gQtXjThpsPkTfHFTUuBZXNIZsro+IR0NYCV9IO0fnT9Xz7jSJQLPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) by
 DS0PR11MB7879.namprd11.prod.outlook.com (2603:10b6:8:f7::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Thu, 6 Feb 2025 14:55:52 +0000
Received: from DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5]) by DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 14:55:52 +0000
Date: Thu, 6 Feb 2025 15:55:13 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Andrey Konovalov <andreyknvl@gmail.com>
CC: <luto@kernel.org>, <xin@zytor.com>, <kirill.shutemov@linux.intel.com>,
	<palmer@dabbelt.com>, <tj@kernel.org>, <brgerst@gmail.com>,
	<ardb@kernel.org>, <dave.hansen@linux.intel.com>, <jgross@suse.com>,
	<will@kernel.org>, <akpm@linux-foundation.org>, <arnd@arndb.de>,
	<corbet@lwn.net>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<ytcoode@gmail.com>, <tglx@linutronix.de>, <hpa@zytor.com>,
	<seanjc@google.com>, <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<justinstitt@google.com>, <jason.andryuk@amd.com>, <glider@google.com>,
	<ubizjak@gmail.com>, <jannh@google.com>, <bhe@redhat.com>,
	<vincenzo.frascino@arm.com>, <rafael.j.wysocki@intel.com>,
	<ndesaulniers@google.com>, <mingo@redhat.com>, <catalin.marinas@arm.com>,
	<junichi.nomura@nec.com>, <nathan@kernel.org>, <ryabinin.a.a@gmail.com>,
	<dennis@kernel.org>, <bp@alien8.de>, <kevinloughlin@google.com>,
	<morbo@google.com>, <dan.j.williams@intel.com>,
	<julian.stecklina@cyberus-technology.de>, <peterz@infradead.org>,
	<cl@linux.com>, <kees@kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 02/15] kasan: Tag checking with dense tag-based mode
Message-ID: <vc23342eu5igzyobkzro3izsrwfubxlh23kzvzxjdoc7hxr4ug@5aplefpwbhev>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8f790bb7e166c1ea2e5003318149eb1d7aba3596.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZf20PmUL5Ms7aoGq0CAdaXzcx0yrgSrmvgy89og_PwYMg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZf20PmUL5Ms7aoGq0CAdaXzcx0yrgSrmvgy89og_PwYMg@mail.gmail.com>
X-ClientProxiedBy: DUZPR01CA0143.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::8) To DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6239:EE_|DS0PR11MB7879:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6f8f41-2944-4bbd-faf3-08dd46be5a08
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkF0c2FGbFJ4cTNNNVdjMldEWTZORHIrMVNReUsrMWZvbGJqb2UrNG9kSk1K?=
 =?utf-8?B?VEFoUmxyUSsvZnpsMU1PdzBHY0N4WjRGRU5UYlpBVWpOYnpGYXlvdHk3YW5J?=
 =?utf-8?B?ak5BVVFPUTVpZ1VPRHNGWnpkcWg1cEx0dmx0SHluMlRCSENXUWxLbUViZXdl?=
 =?utf-8?B?YzdxOFZodXl6S0U3czhYRmNZcE4wd2xlWHZ4RTgwanhaUm0rQzNuWTJQOWdM?=
 =?utf-8?B?MUoxRGp0blhWaTYrOWkzRzFuNEJCbUJWOXdDcmtQYmJQM0k0N0xQRE8vWEkx?=
 =?utf-8?B?UFlndXZmSEt0STY5UzZOek9majNyemJIZ3JKNHVwTkNsS3U2cXFoQXR1aVJI?=
 =?utf-8?B?aFQxNHFOcXFldXJ4dFFPaXJyNTh2T3NXelRzdFVaK2MvdlZyekFQUnJtd1hW?=
 =?utf-8?B?LytqMnNBbkxtQ1JVTkp4UElRb21LbEsreEVJVEtJWWw3KzIzN1dXRFp5ZnlG?=
 =?utf-8?B?dnBxaGxsYkVjbHBuZ08rU1gvRU5Kek4rUzlxK3ZpcEUrWnNRQ1dPWWhWQjhQ?=
 =?utf-8?B?eDJDdkllQ3l5YnF6ZmdCT1RZeFh5OW5BSXlrTnYxY29nTFdxZ2g4N3VQOHVV?=
 =?utf-8?B?Nk5zcEZ5MmxZWVBYcWJ0Z0pxa2NGN1IvT1RPOVNHSmtuaDhrRzhRSUUrOU5o?=
 =?utf-8?B?RDg3YVF5YTI1ZXNmR0JMdVc1NDNHT244a1VCcUdjMGNReG80eW1QMmwxVk00?=
 =?utf-8?B?azVIakdyU05ycGpqSkxKclJ6bWwyOXdHYm4wNFhQS01JMm0xY1NtQTJhaStM?=
 =?utf-8?B?U0JGU2ViU2IyYWZsYmI5bDlVN290WVRscFRpSXJackVkQmhpSFpSSTQxZ3JS?=
 =?utf-8?B?elowd1ErZGlCaUdUalpRZk9jaFZRem91UlhaWlBNZWJuM0ptMXZvd3pGbjNi?=
 =?utf-8?B?Y2NvTE5PRXhYMTFLdGgwUEg1U3k1MEk4SEZ6c0k3UDdFTUNTb0pXWUpXTmEw?=
 =?utf-8?B?UUxHd0tnelVwQ21kdGRaUEtxZmNOWHZOcGc0UEJycWFoemZMaVRWRm1Uay9C?=
 =?utf-8?B?ellUdnd6VUlZUlRKRVppb1lkY1h2K3JmSjZXUEttMjJyNTgxcCtLRjJpdE1q?=
 =?utf-8?B?M2ZTeWRFNkl2Ky9VWVhQczFlTFZ0MDFvVmF5eFdLMEVKcjBZWUtNVUZmanpj?=
 =?utf-8?B?bkxGalNzZEdnWmRxRXlCYmRuTHN2eG9JeTF5RWRtS2xoeGhzZTVCREpIaXJV?=
 =?utf-8?B?NGNpWmI4a2xUQWtLaTNNcUpScjFUMGV2U1VqaW9jU2xGSTlQQTJaSFNBUC9Q?=
 =?utf-8?B?NHdwWDF4SjJxN2ZMR2haM2hiVnV6TTU5K01nYldHKzFuUWdFOVNEeHNPc3lp?=
 =?utf-8?B?MnptR3NLbjhKdUZCczQ0d2FBc3RGbGhjM0xDWk5ZM2JFbzRzRDFHbXlaSnBv?=
 =?utf-8?B?ZkVjK0Z3aFAvQWxxMVRLcEIzbnZzbThGK1lsYkhLSVE0RnRzVGx1THdHWFky?=
 =?utf-8?B?a3gxNFZaQ1hrN1VLOTh0WnhtU1JvZHo1UXkwNkt4SEJHT3ZuNWRVS2JjOTU5?=
 =?utf-8?B?ZWhMQTRYb1ZWWmw1am1qQWw0R1duZnFBVEVSNFI5VU9maXg1SXMrUnE3cm1a?=
 =?utf-8?B?Vk80d3k0MS93MXFmeCtZZWN4aCtPU1M1VS9TU0gwTUFQa2pUeWlMYUR1YzYw?=
 =?utf-8?B?a0U3TkQwaXJZL1VMSHNZWWVrdWl2a2RicFgxekxpTG5NTFhleUZPNzJVVDZQ?=
 =?utf-8?B?R1hBS0toZHJ6Q0tEWGczNmZMQUhraUNUaGtTVDh2d2pPS3JYQUM0ZEZVMFVE?=
 =?utf-8?B?Z0RvS2kxWVFIYUlkZCt0QzNwdDBBYUFUMDZFQlkwR1ZqS1R2bHZCbmVESStk?=
 =?utf-8?B?R2k5UkxKVXJtaURzT0o3WXE3Z1ZwazhERzc5aEN6YjQvcytnd21DOGdJcGlx?=
 =?utf-8?Q?qd2+fINmLtaT3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6239.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RiODZ1cUNMalErOVZVTVRFeVI0UXVlRXBaa05lTWw4b2tMRldOYVgxRU5W?=
 =?utf-8?B?UzZCbUhFQXNUZkgvVkdpTzRVamVpeWZXcnRWcVY5UmJDVXp3VjBIQ3cxVUp1?=
 =?utf-8?B?NUJ3TTc2UFBOVkpEbW85azlsSm1ZL09PUUZQVVRyV1ZZcm95WHFBUy9CNnNs?=
 =?utf-8?B?Z0Zpd0xzeDFGY2xrclRpR1RwVk93cUovZk1sMVdBeW5oSXdCTWtSaXgxYUlC?=
 =?utf-8?B?bkltdTh6YUo5b1JReUhpZmV1VmtGNUlGai9HU3h1WFFmNHh6RW8rZDBSSWZS?=
 =?utf-8?B?UU80YnRJcWFHUjV6MlpWMzc4NzJmMC9WV1ZEQzRWMVFCR29JOVBMQ2xhZkJN?=
 =?utf-8?B?cFlWUjk1M2JKMms1Ymd1dzIzODBoZW94VE90YlE0d0ppbCtYakc3dE5aL0JL?=
 =?utf-8?B?dXFyd0ZZWENDQitmSVZCdFFUM1JsZC9iejBwTThSU1l5WW5IbVpEV2k5dk82?=
 =?utf-8?B?WEtnMWJ5UU96ZXA5OWZGdjN0NDBiZEdEWGw4ck5zMlVqd3FpekJEY0ZvdHkv?=
 =?utf-8?B?VXl4VzZxSzdweFFOYWpqRFhNdnJFbFloelJkZWRBaHFMVEI5TUZ3Sjcza1Vj?=
 =?utf-8?B?ZVZQU0dsY3lvWTRkVVlkMXIwZ3hLMkxta25PM2tYTHlMV0NpTkcycytkUXBa?=
 =?utf-8?B?N3g5Lzkvc1NpU2FGNUZGU2RjWDFBLzdVT0tXK0tRRjA2ZHJSS2R6b2JWMTFm?=
 =?utf-8?B?R3FHYWYyKzVQUGxsZ0NhVnZYNUFwZnZ1K3kydTlvdFJneXk3ZkdidXg1b0VW?=
 =?utf-8?B?S1JIaWhxVFh2ak1SS2JaaXhnTlphK2RhRzVnZUQxMElPRDdsbnJ2cFM3VUgr?=
 =?utf-8?B?U041Z3JZNGxVOXRlREhOV1lOQjRGenp5WWNBSElsMjBaS2FIUktVaG02L3Fi?=
 =?utf-8?B?VzFOVUxTK1pRTWZiV0cvNTM4bzlleEczai8zNlV1U2FYTWZQdUtVdm4zd2I4?=
 =?utf-8?B?bHlxK0JxK25zMXRsaGZsYjZhUmN2c3R2OXI2d2RsT09PQmxubWZ6eTNSNEpD?=
 =?utf-8?B?V2lKWmFwVENld0tPS1NXRjBHMGRWSndDOTh5bkQzTGZRY3UreDBNRFJZR3E0?=
 =?utf-8?B?a25yRUQ2K0RBMWdCalZjOFpWazhyNEk1WllQQ0RPc3JOWDYyc3ZvYlFLcFRn?=
 =?utf-8?B?dmxiN2I4c1dLTWIzTm11dS96allOQkV0RFlTUjJnMDVkR21FT2hZa2xxTG9I?=
 =?utf-8?B?c3RqZnBxZEhtMTR6c1hjZXVKdG5GZ3ZuU0JGRnJFaDhQY3FZYnkyZW83MXg4?=
 =?utf-8?B?eVM5eHpEN2RtR1RZRW1ibG1pRjJuWEF2bG51dEtnK3dsSnM5WDQ4ZkJZL0ZE?=
 =?utf-8?B?Z1c1UktmWWRqZ3YydU5DQjVyVUVDOEc4MWswc3dNTk14M2l6b3NKUW9XNDk3?=
 =?utf-8?B?VnJRK3ptNE9EU0tYc2s2RFJnQU5uU1psdm1XUlllRmJDMVhpUWRaa3gxUzhX?=
 =?utf-8?B?NGpRL2pSV1R4M28vNENIT29BOWxmTXhyT0ppSlErczZjZ0NoSWlCdEFTcnJ2?=
 =?utf-8?B?ZzRqTjZZME1nVDhoUGZ5Zmk2TGp1RTdOTXB0UVhKZ05vT3V0TGpacFBsMVAv?=
 =?utf-8?B?U2hKQlE3di9aVTFGaitKcWlvUy9FSDdFM0ZHL0NyWUZva2ZtYWxjOWtpTG9S?=
 =?utf-8?B?cjZaczgvSkd4RnNVVmlid2RVdXNMbnN2T0ExVnI4cWUxb0tQSE5QRVEwR29Q?=
 =?utf-8?B?R2hncFZHY0JLNytFQVRKUFhSQmYzNVlhS1lZc3QvdE0xMUw3UlIzSjFKVXRx?=
 =?utf-8?B?cVFiczc1RktkVzNqUFNNaTNnV1lydFVKeWROSmdWbVA0WC9OV2dwR2twUmhx?=
 =?utf-8?B?VDA5ZlBpMThOTlhxM1FWRUFVbklZUnRzam8zV3FhTTBMNVhCaW1EN01zMDZX?=
 =?utf-8?B?T0xnRHZwRlc3REVDNnBiOWtUOE1YbEJvNVVZUnZmc1A3SHo2WVcxWmRaY204?=
 =?utf-8?B?d204ZTNuZkZITzhweWRKNzRjbGxYMG5HSVJGLzVEdHM1VHJmVituOHRTaTd4?=
 =?utf-8?B?YUg3b2xYY2tyQVZ3dkdXcnZtNU1WWURodmJWTVR0VTBUZEhCSVlXU2U3Vjkr?=
 =?utf-8?B?RFZNRlVFdHp0VnNXNnArV1gyTEV6MCtHMzJ2VFU0Y3ZNVWY5eGc1cDNDangx?=
 =?utf-8?B?cGJ4cE15ZllBSGJkenlSaXpKS2hTbmV6NldnbmYzRVdFU00vSnE1KzJpNHFW?=
 =?utf-8?Q?eIyPOpdywAr587FNJNU7jQU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6f8f41-2944-4bbd-faf3-08dd46be5a08
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 14:55:52.6905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xrM04ii2yLSRsf3xdQ7NOMQRjs/+T/HVmBXBDusIyUiaHXtwg046NQCbzv6LIyw4w8wDl5LfgRNnntLpa7FhQdgrYHnw99YKYxFU6OrH29E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7879
X-OriginatorOrg: intel.com

On 2025-02-06 at 00:45:01 +0100, Andrey Konovalov wrote:
>On Tue, Feb 4, 2025 at 6:35 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
>>
>> In KASAN's tag-based mode (arm64) when a memory access occurs, the tag
>> stored in the top 8 bits of the pointer is compared with tags saved in
>> the region of the shadow memory that maps to memory the pointer points
>> to. If any of the tags in the shadow memory region do not match the one
>> stored in the pointer an error report is generated.
>>
>> With the introduction of the dense mode, tags won't necessarily occupy
>> whole bytes of shadow memory if the previously allocated memory wasn't
>> aligned to 32 bytes - which is the coverage of one shadow byte.
>>
>> Add an alternative implementation of kasan_check_range() that performs
>> special checks on first and last bytes of shadow memory ranges if the
>> originally allocated memory wasn't aligned to 32 bytes.
>>
>> Signed-off-by: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
>> ---
>>  include/linux/kasan.h     | 47 +++++++++++++++-------
>>  mm/kasan/Makefile         |  3 ++
>>  mm/kasan/dense.c          | 83 +++++++++++++++++++++++++++++++++++++++
>>  mm/kasan/kasan.h          |  2 +-
>>  mm/kasan/report.c         |  2 +-
>>  mm/kasan/report_sw_tags.c | 12 ++----
>>  mm/kasan/sw_tags.c        |  8 ++++
>>  7 files changed, 133 insertions(+), 24 deletions(-)
>>  create mode 100644 mm/kasan/dense.c
>>
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index ea0f5acd875b..5a3e9bec21c2 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -33,6 +33,20 @@ typedef unsigned int __bitwise kasan_vmalloc_flags_t;
>>
>>  #include <linux/pgtable.h>
>>
>> +#ifndef kasan_mem_to_shadow
>> +static inline void *kasan_mem_to_shadow(const void *addr)
>> +{
>> +       void *scaled;
>> +
>> +       if (IS_ENABLED(CONFIG_KASAN_GENERIC))
>> +               scaled = (void *)((unsigned long)addr >> KASAN_SHADOW_SCALE_SHIFT);
>> +       else
>> +               scaled = (void *)((long)addr >> KASAN_SHADOW_SCALE_SHIFT);
>> +
>> +       return KASAN_SHADOW_OFFSET + scaled;
>> +}
>> +#endif
>
>Any reason this is moved up here?

I think it was necessary for something I added, removed and then didn't notice
it's no longer needed. I'll move it back.

-- 
Kind regards
Maciej Wieczór-Retman
