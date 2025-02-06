Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289420C473;
	Thu,  6 Feb 2025 11:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738840954; cv=fail; b=ByMGa1tEcIkdyAbd0zILZft9pjvu66WoGuViTrH7Bbw6sNJEB7ID9k9TZpQXRwBieCBhgwJkIfoCOKlhk+Uht6DnL9iCZIxq5X0i3FVlHmVIv/hCnhtyrsMFHc0nQXxb6NEZtyVdgKvWXRCH80pWVWX0iL7K55ELLwlJy0MBEE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738840954; c=relaxed/simple;
	bh=m9SR6yRR3NLLkbHIoAvaK4itgo8ZuT8DiMWB/8ZY8eY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LriqKR/K7SSMv0PW8TASBOdEqZAwNet/uuld9tjthp4Qhy6pam0jiqruZf2BDHH4pas0yXSLYO2n3lvAzojZ0koOf+v8ilvG9Z3Fz8vpNf5GOZjaFjRTryA4lhiTTNnNIAYFaNH3uYGj6S0voD6AcS/p4rj4ed6f9QFMVslAZ+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3w/nlPo; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3w/nlPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738840952; x=1770376952;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=m9SR6yRR3NLLkbHIoAvaK4itgo8ZuT8DiMWB/8ZY8eY=;
  b=W3w/nlPo4y0hCbWlL9KoRneEu33Xi0J54p4yRcQmQtihDxgc6Poe+Z/w
   ONOHwbW3AHYSxxFwXIGc9FvqwKxxmc7ixfP6OlFWWQ4jNdTUaDlV5OF3I
   D1yYx9vNN7I0jotIPL74qftqJKmjOLU2vftaxT5sldT5x4fD39aoiPHqn
   b0rnP/JCMKZXPe6oy2J1UIaYwSMIGa+r8gM6L0CcdHe8vQRx3Mskje0F+
   b0Q6AY8ndMpJ7KFp8uCYiSPIuQEOjsCzSJ8dPVJ2jZ6LELhTUuaO+a/+J
   +5dsd7AZ+LUdjiiOhSV5vOj7IAMY+LnrpYohHpVLazIk8tXgop6sSNVue
   Q==;
X-CSE-ConnectionGUID: zFiisyZCSPaoVtne4WL/nQ==
X-CSE-MsgGUID: LYjh//SPTbaTew/jmBYX1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38667188"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="38667188"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 03:22:31 -0800
X-CSE-ConnectionGUID: SolZJUvvQQWydUKGqDcIqA==
X-CSE-MsgGUID: OUBcbleRTyOfS1d/5aicnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="116145284"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 03:22:30 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 03:22:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 03:22:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 03:22:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3AehGjgIMxDPOjtiGJgwHZ5zZX1lnQBXAVAmR+vCpaNKlg4tnLVToUgxWHWsFnwpSiVgCC+i3YBkp3lm8l3+jK6Fgt4PdB0uIQG+JR6KUgK2frBS9Tu5iwZuGYt8dWP7U8V09O7SZlVPxIxcfxTjGUQURhoY1BXMy+nC6xOXfBVfopokmhAbOy8E21Tl3A7zAF6B20+YdwbitNWRbzM+6pICGrnPz0//UQtUrWGHQFulv52pW3w02naUa/9dfjsXQeypYNgaqHlf40/7n5qrTMbKbUXxQ4VKDGFYriajhPNIiO4tO+oJvtzRLnQGHLTv4q9Oedzzcb+zm7uIXUSXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Cue5jkvY3CwovMMKCz4vyRH4JSKbQUWZjGsZCFARrM=;
 b=HHG6QEVCjWi/eSiGSFDgX74+1sXvjcDD0VYm61nO2gIfB0feR5sAU690BvrtiDWLJvaps0DpmTUgIUTP7XgReXUHnfg7y/4q75Sj6ULL1hAJifcKnCZ6DPVjOpw7N+8vsSVDUyzzYKEQA4nRsNdidQz42GbC5YjnUiBeU5sNdVmDIeLb3nwnBM9FbwMNiAvaReP8fRMu1bSRyJHQmDz29OHdWSOIxr9o9BjEDzRVcFwlEr0gEjwuyutfAcpDqjz2LzHQGKmlYVNjETFPknJyWTwD1ERcCoMF3eXg/raC4gQxCjcixZ+X50MvdEPiHcRNk2a21W5qeZbML8NaxFtucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6239.namprd11.prod.outlook.com (2603:10b6:8:a7::20) by
 PH8PR11MB6684.namprd11.prod.outlook.com (2603:10b6:510:1c7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Thu, 6 Feb 2025 11:22:19 +0000
Received: from DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5]) by DM4PR11MB6239.namprd11.prod.outlook.com
 ([fe80::244e:154d:1b0b:5eb5%4]) with mapi id 15.20.8398.021; Thu, 6 Feb 2025
 11:22:19 +0000
Date: Thu, 6 Feb 2025 12:22:07 +0100
From: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <luto@kernel.org>, <xin@zytor.com>, <kirill.shutemov@linux.intel.com>,
	<tj@kernel.org>, <andreyknvl@gmail.com>, <brgerst@gmail.com>, Ard Biesheuvel
	<ardb@kernel.org>, <dave.hansen@linux.intel.com>, <jgross@suse.com>, "Will
 Deacon" <will@kernel.org>, <akpm@linux-foundation.org>, Arnd Bergmann
	<arnd@arndb.de>, <corbet@lwn.net>, <dvyukov@google.com>,
	<richard.weiyang@gmail.com>, <ytcoode@gmail.com>, <tglx@linutronix.de>,
	<hpa@zytor.com>, <seanjc@google.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<justinstitt@google.com>, <jason.andryuk@amd.com>, <glider@google.com>,
	<ubizjak@gmail.com>, <jannh@google.com>, <bhe@redhat.com>,
	<vincenzo.frascino@arm.com>, <rafael.j.wysocki@intel.com>,
	<ndesaulniers@google.com>, <mingo@redhat.com>, Catalin Marinas
	<catalin.marinas@arm.com>, <junichi.nomura@nec.com>, <nathan@kernel.org>,
	<ryabinin.a.a@gmail.com>, <dennis@kernel.org>, <bp@alien8.de>,
	<kevinloughlin@google.com>, <morbo@google.com>, <dan.j.williams@intel.com>,
	<julian.stecklina@cyberus-technology.de>, <peterz@infradead.org>,
	<cl@linux.com>, <kees@kernel.org>, <kasan-dev@googlegroups.com>,
	<x86@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <llvm@lists.linux.dev>, <linux-doc@vger.kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH 04/15] kasan: arm64: x86: risc-v: Make special tags arch
 specific
Message-ID: <izvvhhl65eywme5wok5impx477wgi2r2pgp7vtl74gh4v5puky@bdb76rwhiweh>
References: <cdb119dcade0cea25745c920aba8434c27e4c93b.1738686764.git.maciej.wieczor-retman@intel.com>
 <mhng-33ede5ce-7625-431b-a48f-fd6abf7f78ba@palmer-ri-x1c9>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <mhng-33ede5ce-7625-431b-a48f-fd6abf7f78ba@palmer-ri-x1c9>
X-ClientProxiedBy: DU2P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::29) To DM4PR11MB6239.namprd11.prod.outlook.com
 (2603:10b6:8:a7::20)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6239:EE_|PH8PR11MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: 25678099-2bc9-4305-26ec-08dd46a08506
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zTvpfzu0UhJckLXlZ3NQj4gBIQxKjMKo7uKXrf7WkTMPGZdtrtJbV2eNwH?=
 =?iso-8859-1?Q?2bdHqQMltgAnFjPg/1bNb6eyfOrhI8l84mX0R9uPy598ny6y6/GzQaurJi?=
 =?iso-8859-1?Q?XUvetOxSnApJ0nm81B76DUn1UDndMktoo011JfL9XmpaB4iHgWoOYoZPct?=
 =?iso-8859-1?Q?4M4eATx5EWgS8b9HrMEfy77KU2LPN6mYEjTqBht61KZkczpNgS7WQSjwpC?=
 =?iso-8859-1?Q?VHkGM/JgI8H7yzT+hYCHAy8o4UxCpR/QQFlsBHELwzuTRgseWRZQGTPk+q?=
 =?iso-8859-1?Q?MrPeuZLbyEdwAJ0XxTTSpLo4Sq2ZyqaWkHibwTJ4t8QY28x4CBfOHx9XFd?=
 =?iso-8859-1?Q?gojBwYZKFioyPsqMO8lFr5txRw+tz1Zlw08uY2oSwi4cqhsduzsEUpmoNr?=
 =?iso-8859-1?Q?R+gVzumhMu520ov71dnUx1gC6AHtgS6XqocxVowdj43NjqccSKEzmvZ5m0?=
 =?iso-8859-1?Q?++E4YvoVtFehHS8esh/IPEAxDBbBe3NWsyhOrqQ7Tr+7C6Tauis2sUfjhI?=
 =?iso-8859-1?Q?QoFLklDaxQleHJZzXJgl5fPML7LcAJ7EnsMfIohIDSzhqpuWDZV2B4bb8Y?=
 =?iso-8859-1?Q?4KVE/ePGLRtCZcQm0o1A8/RfIuWETKfuNmLIMuyZUObcZZ4njhd2brzrwX?=
 =?iso-8859-1?Q?k1ztGsP6fHQbOXaUn5d2EWxrcu7bkAeyaYVZ5IlAXqySJ3w1mhxUCQYKrh?=
 =?iso-8859-1?Q?gsKF0dvK4LFry8n63lZcKdJBMWQ8nH3vXiqHRyBpT+Z1ityRluqB0hReqr?=
 =?iso-8859-1?Q?1m75wyTHChRrkcRx4xc/fXK5YMbiG2tbh20LUeI3w17wRi6oajELpHs3lC?=
 =?iso-8859-1?Q?2hfWqo0+MYBEm4Ubpv78MPpTWkIyPHGG732REsIN4IN6kCDhfMyKJ+uAqJ?=
 =?iso-8859-1?Q?mbIDBSPT5KjBi36RLK7rkAiiC0MYfsUjm9S115QElqR5TbvOgFogtohkZ6?=
 =?iso-8859-1?Q?F5fB7mg8Jti8aZ1KYQ1RJCr72OzUxMtKfPMxSWQCy625rIG+UKbX8t2Wob?=
 =?iso-8859-1?Q?43R69NxxyZRxNCP6ogDOATn91Yhy85/vg1Gii9ypJzGMloJbUfTcejfPj1?=
 =?iso-8859-1?Q?6mkUvUxi4j8sYArEcBZS+fFHsvF9wd5SpiS8rjt5y0jn3RuAO6kl93EkHO?=
 =?iso-8859-1?Q?7s7jdt3xukh6RT0t8xjt8jnFrPkEGYH3HuMjr37S7a/NnXrhS3RWQpAp7e?=
 =?iso-8859-1?Q?HXMsdYlm0QVbNvwMmq+p9ku82rmdFQjGvr6OcrgZHhBJdtlKq2c5HAF1UH?=
 =?iso-8859-1?Q?bcePdQtWagA7nHtnQS4PEfAJYEYpxDaVNBeTUkvtU7FW7lZzry/LD6fsHV?=
 =?iso-8859-1?Q?rC7x2Rmmrmctuohw1XiSKboNxPbP3QVziimUPWV/aw+3r7lqGbxm2c4Sw3?=
 =?iso-8859-1?Q?M6dYDjXwVq6LBXmD/s5BY3t0LaivxS8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6239.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0ypTVubXfEOPJKIGPM3YNkXp2d7TESQDbiGUtTo0Ha4CLPkjABVMfm6S3K?=
 =?iso-8859-1?Q?Ef4vRlJb2YShrCL5Nf8/2FTbaMhRzQBDObYL8yfDonuNJuYPDHQ5VaCQqk?=
 =?iso-8859-1?Q?UYx9KdOQS30nA1Fqxd/jGx8mKQ8KCPACVj5/F8+iaafRgH6O92ri5oMczt?=
 =?iso-8859-1?Q?EzPkkAZp0E6VwQJiTP7yShxNUXIgH8b2u6GaZXrUkWso4MnIAXXpsrupmi?=
 =?iso-8859-1?Q?RlxA7noygVsFphB9gRjA8U6WpJH4B3VNvt4ADjasjZayIhaTIGoBeyIPYR?=
 =?iso-8859-1?Q?gA5aZvovYmbgm65qDjS6CcifT6uvJDvTyw1tlJvRUmU/I0hA71vHabS3a/?=
 =?iso-8859-1?Q?UNy4Uocxl3kbEBzWXRKHVDvY5mKimOJtLJr5HgGVBMxRY1zm+o/fpGzzrg?=
 =?iso-8859-1?Q?zVIMOkntwdHSwSelpM8RgBm6oNThnrvESLxsrC1Pt/qD8lDEHgZsiZ0ntN?=
 =?iso-8859-1?Q?MscampN+b3w3jRGik03ixdE/wbvNpx+H7HUbgwMfurRlut/ejl+Fr1fzH/?=
 =?iso-8859-1?Q?DoXa9x9GZnUcyhoGZh0BqQPwrRCz/+Xyln3wrHfp7bmX/F6xQ5fJ0PunsN?=
 =?iso-8859-1?Q?oW7uO/OtBO30q0eYJJ1ezWiU7Mc7Vq8hJOuAcM7n6R1zniCXJ3LoqmKolA?=
 =?iso-8859-1?Q?OxgPz7/1eG2d41jz9vsQNbWlpTzoyKwez883W1O8QVg4I7xaQ1f4A1eLBr?=
 =?iso-8859-1?Q?PmAnuXLMcjR1l07nTS8eKo661sLyfRKOJDhIgUUIJG70WqmwsAlrEo2BOF?=
 =?iso-8859-1?Q?EeCRU8i+Sg9ZolKWZdPGXGP6QrjZZn2kfkROCR2/35ixbrhr5WO1Aod21d?=
 =?iso-8859-1?Q?RYwNZ4rBqNz5ARWPWXzqzs3HfZ+L3ke2Li2v5dl3D5g4jBr0+5Htyqyk9D?=
 =?iso-8859-1?Q?kVMwLg0gShfhWLbyhv4Ub+0dADAekNJDmBPlDryw9/WPiz9A6ZRqAT4Vlc?=
 =?iso-8859-1?Q?bTqrLvxNghmHFxnVmVzY1MftLP+uSn3v+9tOs06NlMUeeXL1aYWbhEnR/T?=
 =?iso-8859-1?Q?ImQOWjC+S6m+YZA8eIBnYpMdeZLEKgUqNKUG3VKVDOOHPer5AyE6v3+/os?=
 =?iso-8859-1?Q?5KnjCqX45BQJ/GYB7CfNE2Xkxv3QkgdVtsFQ7B2tQzOEVlb9DXRvWFYWro?=
 =?iso-8859-1?Q?zbaW75U8NX6aZ8POEoxaOlIqMIjqvbpTWvn2dWK8LYSDzUXcx4MWY0Kwaz?=
 =?iso-8859-1?Q?8kGkl/3g9vtnoQzrZVk5Wfm2X6ZD6Pxd14HMxqpMFyJ7C0VdH74waPfQOY?=
 =?iso-8859-1?Q?UhzgD81ySOzHoI3SHyf23d9Hny1Zm29Zh884JUCdiZg8lNMgtQjffbE0+L?=
 =?iso-8859-1?Q?z7/UYTv/Lj5sPoUijd4TbEWG3vsuV/aYxRjedH8q6wOQEY1+fBiX18v8Ot?=
 =?iso-8859-1?Q?h7uox4OK4wzBoPoplAj/cqkf4MELEyp3zOkkf/3WhIWqB6DLsROgb1luF/?=
 =?iso-8859-1?Q?xPhXtMCrxJpijBrgO4IS22OHhN/c0X6aCGQ7ZE/whfGst6MIKKvOfvA9J+?=
 =?iso-8859-1?Q?/jJKdh//dn0CBlKwe8p6WpLMk4pnQZZe5n/WUevJgrNpI/ZoKpkzKIYXrL?=
 =?iso-8859-1?Q?SwSDJlU3fQbtvpG+FJUTdwLGkfVgJsqEV7U8jrsvs7Jyf9w4d51WkW0HWo?=
 =?iso-8859-1?Q?Q2cUwqE9XXdHP7O+o7tpYnb3lPOzNLs+3O3nnbalQH7+AYPST3ZgqwqHFZ?=
 =?iso-8859-1?Q?hgSBL56SuUgTMSim2Vs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25678099-2bc9-4305-26ec-08dd46a08506
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6239.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 11:22:19.8403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vP+2R6Y7A8d5KlpZUNMVnt+V8a2E2WBM4l9dngfbDSrvO1fmQiBaEmlE5qe8CPhFgaAtZvcZWGUGFJcL3DhvxkrHdn6cygXXDL3dg48aLqI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6684
X-OriginatorOrg: intel.com

Hi!

On 2025-02-05 at 12:20:10 -0800, Palmer Dabbelt wrote:
>On Tue, 04 Feb 2025 09:33:45 PST (-0800), maciej.wieczor-retman@intel.com wrote:
...
>
>Acked-by: Palmer Dabbelt <palmer@rivosinc.com> # RISC-V
>
>Probably best to keep this along with the rest of the patches, but LMK if you
>want me to point something at the RISC-V tree.

Thanks for looking at the patches! As Andrey suggested since the risc-v KASAN
series doesn't get updated much I'll try not to base this series on the risc-v
one. I hope it's okay if I pick up the first patch/few patches that are not
risc-v related and try to upstream them along this series? They were really
helpful to my efforts here.

>_______________________________________________
>linux-riscv mailing list
>linux-riscv@lists.infradead.org
>http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
Kind regards
Maciej Wieczór-Retman
