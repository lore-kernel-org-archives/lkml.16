Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D151D5AB7;
	Fri,  7 Feb 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919346; cv=fail; b=QSxFLwDsMC4ywbs6sVIrv6loRfSSSArwDwUal98tA/JgyagM6Q7+f0ybO0Dr7V6Fn4buKbhXIiAjAeSR87rCkaBtNPUDAKRs3zuhBcMbNtn2ClYnYqdKq4WC+iyCjBMa6VLGtnYtrggiKyO9raVIXCaIXYxAAHts18RFY7McjzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919346; c=relaxed/simple;
	bh=EV7GTSX2a9+OMQL0AsNLeGSx7JejqFOTn9DQ1+C0Bgs=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=shiXb/K5U63vdsRkjofK53cGuD16aHhS4ghXKgAxG5Z0ywQDGwLTZsjDgPyf7XXu78OVzpxDTRpz8jHTN1dYxZns0DusVtyBDbjIP8GQhGuGc8TqhuD2Y/9Vd50x/6PrjlOqei9pBBVNJzqPJ5Hr0Y7MUTvnBcb3BxbUx6aPy/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KTLEQeX1; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KTLEQeX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738919344; x=1770455344;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=EV7GTSX2a9+OMQL0AsNLeGSx7JejqFOTn9DQ1+C0Bgs=;
  b=KTLEQeX1WFH5JzJpGtz/sXdnvwHjVdcyCcA1tJm1P8e12ZFmi85UNHkU
   2XmvqOJSZHLs1rccSlkDhojP0tl+hAIHDWCvNfWZfaZtooFq31pUbV+JB
   kermU5K2OK8qVVkylRqJsqxvBVSdi66RV3nzDgSlABCrMcllzH2HT5Ht8
   hyczKywY7KKiMXNIczytfKV+ZRjWRa07mUfZv7iWJwWrnK7c8drF8Cb1V
   DYFaCRU+0g00mbNQiQR7X2VRuN+uzE/YdBgWQ/MKpk2dLs7TRqrhB68KD
   e3TEAEmJsXomW6wU3EIefmcly2Wuje+zn3MPiqIGKcuopG/oB9evf+XKr
   A==;
X-CSE-ConnectionGUID: kxG5hyMfT8KLq3vrZQ11zg==
X-CSE-MsgGUID: KU7a2eaTTYKZbBlrLUl0Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50988481"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50988481"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:09:03 -0800
X-CSE-ConnectionGUID: OHN67XRDR8aBD4qQsQZ5xQ==
X-CSE-MsgGUID: yA54H6mASl6p32Q0wtKnmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="142353210"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Feb 2025 01:09:03 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 01:09:02 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 01:09:02 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 01:09:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wB9HMw0V8Id9RAy6aU++GS90Hefc/JvsYx32SfrrgRwh8Xz8QxjoCndBj6J7kfhf/H2dmNXdyNGtLbaXYgTujbSRniNmKT2BgRRDbxHMNSMQyz+9uldlwbNXa5Q5pF3hA5Jj3+XWeBeKlUa1CY0eOhkr66MdnNyLGGRfMy2F/mmLccK7pMlBkAYt3FE5HyjL+yu2s7AKiuGmr1UerzVHiX0oEcrKln5KD9kvSUK+laTaEI6kbJrtY1J8y5FOkRGqJIpmnq3CGBfAdvmyOq4rjjsXxaM7iUAu/pQz+vNpccm06hDeBDsFKN/gy5juIsoogtJF+kkCdsuiOp/Su9MSrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJSy9gzINKFA69OPpzB2FlUs6y0rieQ8UdBOik9lHBk=;
 b=W7u9oXD1wtdlopERuzEjShO1GUMIQH5RZ2QJcOMxlxwc1swcqy/AMwVKeAVajg/6YnYn5f4vbGwgkbBGZ8K/E/hLuWXOzPiISE2ROGnYTFTZFmA5I5a9usUp2c2W/AsJN6r63cI9hsFcFdmUH1ERzuOYSGXGurBZDV1y9q5Kkh8ataMnac4X9c5K/ZKZT+0UWIOl/iVSLfvaR2W1Kjdxju27jTgpmmYrVFiH4EE/+a/JWmNlQdZYsPYJQdHl7eRoUXgjbAW32eZHiUYpcbdWFm3WvlMik1COd/wybGt76ZbnXk+xwUEYBw0VQmv5YKcXlDnx0oBOyu6Wq8A6bzuoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6231.namprd11.prod.outlook.com (2603:10b6:208:3c4::15)
 by SA1PR11MB8596.namprd11.prod.outlook.com (2603:10b6:806:3b5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 09:08:28 +0000
Received: from MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4]) by MN0PR11MB6231.namprd11.prod.outlook.com
 ([fe80::a137:ffd0:97a3:1db4%4]) with mapi id 15.20.8422.012; Fri, 7 Feb 2025
 09:08:28 +0000
Date: Fri, 7 Feb 2025 10:08:17 +0100
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
Subject: Re: [PATCH 15/15] kasan: Add mititgation and debug modes
Message-ID: <mngxg6wmbfzw62yhlavo6qcx3wsdkdgz3qsxahfjbs2bngxicp@7pbj2i2a6nah>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <450a1fe078b0e07bf2e4f3098c9110c9959c6524.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZcG0nv1_ezc+yu3Wj_7iS0r_QfK9OcDnK-MRmJ=BF4iJg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+fCnZcG0nv1_ezc+yu3Wj_7iS0r_QfK9OcDnK-MRmJ=BF4iJg@mail.gmail.com>
X-ClientProxiedBy: DU2PR04CA0296.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::31) To MN0PR11MB6231.namprd11.prod.outlook.com
 (2603:10b6:208:3c4::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6231:EE_|SA1PR11MB8596:EE_
X-MS-Office365-Filtering-Correlation-Id: 4667784a-15e4-40c4-8a82-08dd4756fc3c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VHlKbHVwZ0IrSUZoSHZyWVpZaHQ1WVNCN1JGdDZQQ1BHUUxKSkdhZlJBRFRK?=
 =?utf-8?B?SWtNRzJUM3A2dW5mWGdJcEFQbjl0QzFEZmRiVCtCQ2JzbmwxdGUyK2V0bW5y?=
 =?utf-8?B?cTBUd1FjZURidXdwQlNNYllSK05jZmNUODlBa2xEbThaVjlJcmNxQ0pWa1B3?=
 =?utf-8?B?WVpGeUZRZlBPb0J4S0RGS2kzaDJMV21Qeit2b3hDeVVFWUtFNmhOY3hqSU5I?=
 =?utf-8?B?M21RYlBrc0REQk5pSDNMV3hiVHJaY1FDMlNURVJNK2FWUTkvbFE5cDhiSjBB?=
 =?utf-8?B?Q043bCtrQUgwOXo1ZTVaRi82V0VtY243UnJ1bDRoN05iZGIvaksvaHlXbmdi?=
 =?utf-8?B?V2ZtalV6MVU0VDVXSDh1c25BWjFQWXJ5Ukozc3A3SUlqOVBUcUpseVJibjAy?=
 =?utf-8?B?Tmx0T2pLTXZBL0Z6UUJIN1dmZWZCM1lkSllCOGtSUTFjbU0rTG5sYncybHlj?=
 =?utf-8?B?cElRRWtvUE16MHU2WTVBaERybXROcHN1MEtJMmtGTUdpbjVQUi9kcUxSbVlu?=
 =?utf-8?B?aWJmUHlVZFdaMGJuSzRaT1JhcCtNVGVDdmI2MzRUVzZjOG0vbHg1aENEMnhN?=
 =?utf-8?B?U05SRlZFbk85TW5GVGVhZmxOT3JMMXdPSWdta0RPeFBobHVYSHQ1MXNsM005?=
 =?utf-8?B?UzlFeUE0R0laQUlYcCs5MnlBT0NYcllGVEdtd3I1dDNPdVRMckxlTEl2U0cz?=
 =?utf-8?B?QzNYdG52aEJTdlBFS3NpWHBMdFpSbXJpTVZjaUcvK2hPMlI4UEprQ3lhNlll?=
 =?utf-8?B?ZHh6OTV3Z2FUWHRhb01pL3BLYTc2S3I4eGs0aVlEZ1pXdjZTRUlrQU5RUE1k?=
 =?utf-8?B?bG1QWStDeXZMdGRzdUQ3dm5RcVpscHBuZHlLckVmTHlMV21COUVYRSsrWjZK?=
 =?utf-8?B?UUNjLzlTYWZ0VGtiYjRYMndFanNSd3VzUE13cWdLL05hamtWRGYwMDJxYTEv?=
 =?utf-8?B?cHlicEZoaVlKSGV4YVZHUmM0cE1pTTNsV1pPb0g0OWJyRmhGdTF1bEo0OTdq?=
 =?utf-8?B?MWFsUW96SklsZ3FnRUlCWk1QOW01YUVOTWtwdU9MNkxHZmtYeHNsT1piRWds?=
 =?utf-8?B?R1BiUXcxaFdFWGlFMTBTKzBHR2FhNm9uU1hxL0tuY3BvRzk0eUR1aXJRejIx?=
 =?utf-8?B?bHUxNzhxdTI5bzBWVlZmNVJxSUI4OC9Na1F3ZGI3TU5tTENLYjYvbllWemsz?=
 =?utf-8?B?Q1paOXYyOGF1TjNic0RTNjBEdjVOay91VGRXRFhuc3Q4MmprNkxOUjZMRGpD?=
 =?utf-8?B?c2c2ZmJBVy94bGFnMkFWenFGTEt3N1VCMitoVUFrNlZaekduUmpIZmZwNVR6?=
 =?utf-8?B?aGxLLzMzWDF1MUJibTEwM0IwbjRkL1lrNDR1UWJtdVpBSlR0UmRLK1pQTGRm?=
 =?utf-8?B?YThCcVlMdmkyeldRSEZzVG9FUkpYelhIemVyQzJXL2NaUGZjQTE4QUU0WCtU?=
 =?utf-8?B?OHFqcWhLRmhCUW5ZY28wbVlDZTI1Y3pPck02djFzQnNNeXltS29jSDl1eWxC?=
 =?utf-8?B?dTFFVkI2K21IamdPUDNvdjJXRVd5ZUp3TnlxV3lnaVA3aWZzcGtTcnRPSGlV?=
 =?utf-8?B?YzU0WHR4ZnBBc0E5QlkvcUpJSm1pajRzbzQvV2lPSlNWNnFUYzNMMS9aN3cy?=
 =?utf-8?B?Tit0d1c1ME9lYlR1djJ5bWJzMkRUakRCekpxNGFCR0hHb3V1Ym1GOTljc2J0?=
 =?utf-8?B?NXN2b1pJdktiM0xJbkFpWjROeFc3OVM1N3Fjc2liYzFQSWkvdkFxSEdiZHYz?=
 =?utf-8?B?ekh5bWxONzk0U0NCSUdzUHo4ODhOMXpEL3pnZEUzakQwUGlqZmJJSWRmTTRK?=
 =?utf-8?B?VnhBVWJjWTIwMS83SzZ2Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB6231.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRnVm1HamJwSVlBN05UZ3YxcGljR0VkUWNBeW1sRW5PVXpCRW45cjllQ0Fq?=
 =?utf-8?B?bnlDbVBLdFVNMnZPSHpMQ0ltLzJncnNLY0dlaUNFU3hRdjhqeS90aHZJczFH?=
 =?utf-8?B?M2VQUkRjSU9NYVEwM1F2dFFROWw4MktKeFUxbnhNMjdxOWNqUkVqdXRaTE5h?=
 =?utf-8?B?cDhtdkNqSnpxNEpaUG1DVytESTlwV3NoWE0zU1RrTzNTZ1M3R09XcmVYWGRI?=
 =?utf-8?B?V053ZVVGSmVpU1A5Zlp4L3Z0NjMvaC9RcDhnNklqMVN0QVR6djlBdWJkc0F1?=
 =?utf-8?B?UmpwaUV4U1Jhem1USXVIVG1mTHphS3J6dUFCcGZjZWxaZGZMTGVIamRrWis0?=
 =?utf-8?B?dWIzWnBwNjEzNCtzSHE4NlZ0Q1NYdWhWV0NpdFRkSFltaEhMTytuUFQ2OHAv?=
 =?utf-8?B?R3lWc0taY29kVTRRRjZlS3E3R05qU05JOVZ3YlhXYTdmc2QwUjBxOWNrU0s0?=
 =?utf-8?B?VGxVaEhsbVJpNFNodXQ4ZnJVZStLM3gvb3pKNnBNZzBjMnczaTlZMW0zcURo?=
 =?utf-8?B?c2NySFZvdXljcFhyZGxzSWdrVnhHc3ZRU1NyRWVwRU1vOTFhQ05ZaGZRbnRj?=
 =?utf-8?B?cWJRNE03Yy91QVdVUVVwdmxqN25PeEp2MVFpandEVzdBZ2tCNnJoWHF2cVpz?=
 =?utf-8?B?bXErWXk2NENyUVQ3QUR2dnlkbXk0STJCZVJsS1JGWkw0a2Z2NUZDaEFzaCty?=
 =?utf-8?B?VGY1SFRBaEplbTRRWDZGQ1lhSXJhNFQyRGU3V0drY0QwTFozWE5DcUVjUFN6?=
 =?utf-8?B?cndveDc5RVdHTjgzUHNOQjJKTjFMSUFET3lxQXQ5VktpYXFDeWhzeS9IaUNT?=
 =?utf-8?B?MHFjVDV5TFIxNEFpN2tTbk5EekxOcnBRdmpoMCs4RW94WnVhVDljWlRFeGs3?=
 =?utf-8?B?cThLU1daTDZVNFFnV0MwaUNDSDNlUmY3OEVnNUxsZG1aUEdoMDY5MGFhQmpr?=
 =?utf-8?B?eXBUVVZPd0pzbTZjZk40Zk1oT3QzYzUwUFlNOEJzbUFjVFh2Y3ZlVXBST1Rm?=
 =?utf-8?B?QWRneTkwOFdpK2phNzh6SS85ZDdLVmlpRTdSRXBLZElpUFpjWXF0QktMQmxv?=
 =?utf-8?B?SU9JVXZpcmdIUHZmdmJ1NGpFQjF4TEh5QXVuV0d6TzBhRy9CY2kxKzFpL3NI?=
 =?utf-8?B?MUE5Mm53V05pZGpvb0tWOWZIZWV1MnJuSXV3VW5FYWRpYTVKZFpQN1Zwa3Vu?=
 =?utf-8?B?SEYvUVRRSTZxZSs2N0Q3YjhtNldvWDM4NVF6VHFEekNpVlJNYXFrMmhpeUNF?=
 =?utf-8?B?bXlKSG54QVI3d3FyM2VWZHN5dHdrbkE2d2VUYW5sa0QxQWZIRGZPMzBVVTNr?=
 =?utf-8?B?ZGFaaUFreXl1RlBheW1ZdGRYSmVHdVdBZ1RPMm1vMTNSUEwyK0JaQU9wYkVh?=
 =?utf-8?B?a2V3dUdSSGJ3YlluT1BOM1RKMitUbnFORUZGZEUvRmtpQjkwYzI5ZUQwN3dh?=
 =?utf-8?B?SFJiVkJIbmVweVJxVzBYVUFEZHRySnNOZWtPTFROUUsvaWF2aFJnSkt6c09G?=
 =?utf-8?B?N2ZyZ2F5YzNwbyt4OXBsaisvekh1bllBSWZmVEpMdzdISy9mNlVDL0pkUjlu?=
 =?utf-8?B?MFFnZ3dvQ3Yram0vV28wNGlmY2FPQVlmbjB1ek1lM3I4R1J6OExnbDJWcGI0?=
 =?utf-8?B?OHJBN2NSL3d0WTBuZUhIK0R1TExialZnR081OGdGa3VMcXRZenlOV01vSnpo?=
 =?utf-8?B?T2pqdXRlcWlVWFVDd3RzZTdFWTFsaHpkQXBQTnJaK0FXekN3MGlJSXpFRTJT?=
 =?utf-8?B?QnJ1UE9tNUViaVZHdWNWR3NJajJFeEJweFdCTkNhWFBKV2JHaEhMWnUyNEI0?=
 =?utf-8?B?dmtMeTIxVjFBS24vblltdEFVWkdPOXRlZmIwMW92aHFtbUF0amdOOEp6YSsv?=
 =?utf-8?B?a0xjQWxYcDQ4THVTNEphcG56aEZXQUxxZTViczZDRENBWmhEcXdoblRNM3V2?=
 =?utf-8?B?SEtlSmtmdUFrMXJyRERNN3NXM21LYlJJc0dTRHFjS3hSWmhodXFaSnEzYmJx?=
 =?utf-8?B?QmowNkFsOU1qblI2S242L1hCVjR6Ri9yQm5NU2haeHAvMFFnRXA3cFFyRWpR?=
 =?utf-8?B?VTIxU29CWTBManhsM01qaDhwczNyNi9ZLzN6K3NnUHRyaCtTSG1UU2hUMXFo?=
 =?utf-8?B?NVoxMklCY21Ldm80R0t0bXJ6YVVwd3MrV25od0p4emtTQXFJc0xSZDNpa1B6?=
 =?utf-8?Q?ZHhfCnYhGvW8qGpNjnwBG9w=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4667784a-15e4-40c4-8a82-08dd4756fc3c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6231.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 09:08:28.2163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ig3etpMTkqTnyAcz4fLPJy/YmrKVf9iuqj2rEYfkWagmmgVS/p/NONKy4UwDRoJHKkzDbxwcGT1QTimzaKefBlouZrYtvlB9v8eWQ+0sEXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8596
X-OriginatorOrg: intel.com

On 2025-02-06 at 00:46:21 +0100, Andrey Konovalov wrote:
>On Tue, Feb 4, 2025 at 6:37 PM Maciej Wieczor-Retman
><maciej.wieczor-retman@intel.com> wrote:
...
>> +choice
>> +       prompt "KASAN operation mode"
>> +       default KASAN_OPERATION_DEBUG
>> +       help
>> +         Choose between the mitigation or debug operation modes.
>> +
>> +         The first one disables stacktrace saving and enables panic on error.
>> +         Faster memory allocation but less information. The second one is the
>> +         default where KASAN operates with full functionality.
>
>This is something that I thought about before and I think we should
>_not_ add configuration options like these. The distinction between
>debug and mitigation modes is something that's specific to a
>particular user of the feature. Some might prefer to take the impact
>of having stack traces enabled in a production environment to allow
>debugging in-the-wild exploitation attempts. Also at some point in the
>future, we will hopefully have production-grade stack traces [1], and
>this would thus change the desired behavior of
>KASAN_OPERATION_MITIGATION.
>
>We already have the kasan.stacktrace command-line parameter for
>disabling stack trace collection. On top of that, if you prefer, we
>could add a configuration option that changes the default value of
>kasan_flag_stacktrace (but can still be overridden via the
>kasan.stacktrace command-line parameter). Note though that by default,
>stack traces should be turned on.
>
>[1] https://bugzilla.kernel.org/show_bug.cgi?id=211785
>

Okay, I see your point. I'll drop the patch for now and rethink if messing with
how stacktraces are enabled/disabled is worth it.

>
>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Kind regards
Maciej Wieczór-Retman
