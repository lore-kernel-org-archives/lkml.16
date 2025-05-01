Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EC421B9E7
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746136605; cv=fail; b=VZVWZ6lWrU9XutYl1ZBifrRlSV0m1P6jg/4Kd7lMN4L4fLg/q3k3HbnTpon0+dp0yGkquEOmKSJu4adbHwMlxs993zJvZ0KU5/2G98XF+mjudDgod82LJnxWIC4/b2WpZQFBrf0QxJRW8/AZG1+MOHDPBQgdeXCXBXnUNoHO2ck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746136605; c=relaxed/simple;
	bh=DXNe8wrORjTTNip5y/98c5kFXVe4+dPz0yBbgBspiEc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bKuhvPRol8+LmqwnKP/koYex3izy7anFmnyE/KalT2ccdhA/vbphBknPW5aoo8h7OWlt+hJjn6+2O/jVbdXzcNDRH1ATro3/Hl8ryke9hSxuTi6MGiSHTHJPGq+LJfmHTXtdEkIqVUDuDalVpDpWKWrpn5Bf7/jKk7u15MDnEN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yw6O1I8k; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yw6O1I8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746136602; x=1777672602;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=DXNe8wrORjTTNip5y/98c5kFXVe4+dPz0yBbgBspiEc=;
  b=Yw6O1I8k6cGKOBvH4dPo85mJ4EW2OQA/SxC0Ush8sJZqgUfoViqPQnfs
   ZoDwg9Psm7SEyv2mtQ5/KGV+7pktjL5IvC71t0ed2Ymcj50HTkXVYe+uw
   Or1dn/NKe3fxvk/USLtgR+zv+m+RiOW3ruYat0Xj5NhyvV8sCunX8WYeZ
   RQCo/8qnt2m5vbProY2Dj2emp6HIIhwz6TZQJq8Qw6F3H71CsQdbK15NW
   Ni8WJaErEFQAMPojX9PrCjYrcYUfQ0n/dy+1Y6OujlZkaXKwtQNSSvHsp
   JcCJSCvawyRgAomu9/k1Tj7C7Q6OZcQ/jVTTzRBbxipr2pb8IjrXUAAvS
   g==;
X-CSE-ConnectionGUID: /txLl6PSSDymawxkfpAQyg==
X-CSE-MsgGUID: kpS54zfrSvyc0YDKI2jvWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58447759"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58447759"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:56:42 -0700
X-CSE-ConnectionGUID: F3kjQsWgTjeiawXVAXDD1w==
X-CSE-MsgGUID: sokks3R2Qn2n9j0JGxp69Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="171732447"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 14:56:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 14:56:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 14:56:40 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 14:56:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhfqGMU0aA6GUoBLM339VlLN+B6U5awR8Hn1nb+fHWXvfLH3TZGFTG74DJ+cOgT6TM/x7L5K8vqs8vdCn9EPuoGfiDzHptEPSPYW9duUOY+jUbMu//ayqoaNtxNkiVv7sS+kgpOXLOni4QLDfNw8XqL/n1QQn0MiutJR3qlWymsEMPc7OMj9R8t+Zqney74Ab4ZIeGvp1bxErcCWL+RuwYwOGBNJ72rCzEMoP/4UmEPa3S4B2J8yYf7rc+3zXFvnGdsPtblcZFfSXeZvPZWYgdljvAV/OakPrMry9UjzdQjjBmWrMl/9ipe6t4p2EscGSSZzxqugF8WTn6Xm3hUlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=viP0Scn4AGqmlTm2T8LOFKvJLsfVUxImhyM1l3HOJKs=;
 b=H62IvdJz9Z6uBOZBMTLACLo2mYiYBOT+fVhTaahUNayR5hvlOhQ2s5EO9NCiiV0s/oDyE2lozzXBeqNTM0AiZpLQTjRPjJD8naOZ/D7lXGEo8VVrNS2ENkvdulscapCUVjd+rE6j5O798PlCXcQ2x/XKHqasg5/3mOrUpOUBotSYU4RVAXtdkpPSHhOQ98hupqGoQRVW61vvbBgSgLOXRiUE4XvDy3HQ7LKfKHDH5uqmVGV0PppYTNQwb2A1gEG0NxDW/qe6pSEPXp1hRC2HVpMipSlyYoFiYGRLP+rEJslapIOKcpK7pcce7HqDVCNraYg6w5MUAgYeq18aB+Q6ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DM3PR11MB8733.namprd11.prod.outlook.com (2603:10b6:0:40::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Thu, 1 May 2025 21:56:36 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 21:56:36 +0000
Date: Thu, 1 May 2025 14:56:32 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH v5 5/5] virt: tdx-guest: Expose TDX MRs as sysfs
 attributes
Message-ID: <6813ee10d6621_1d6a29436@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com>
 <20250424-tdx-rtmr-v5-5-4fe28ddf85d4@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250424-tdx-rtmr-v5-5-4fe28ddf85d4@intel.com>
X-ClientProxiedBy: MW4PR04CA0205.namprd04.prod.outlook.com
 (2603:10b6:303:86::30) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DM3PR11MB8733:EE_
X-MS-Office365-Filtering-Correlation-Id: fafb701e-7281-4844-4ed5-08dd88fb0b55
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ei9hdWg1STBDTFZVQ0YvTWMvVG8rbG1oRkNKT3ZYN1h1V3pHa0M2ZEIyeWRk?=
 =?utf-8?B?K1Bad21iWElMQ2xwUURwejlwcFE4d0x6bFlpZXlvYWd3MEhSRzlTN09hV1pF?=
 =?utf-8?B?Tmd0ZVhlRW8rYUFiZE5XVWhQcUJoaUNnUW5HRjM4eUNENTZxVlJJV0prS2sy?=
 =?utf-8?B?a3hpNmxHbFN2UG5waEo2YUFqRTg1VFp4VU5KYzR2Tm56b25uT0hrTVZWcGtj?=
 =?utf-8?B?L2lkR1QvMjRmajllYzNNTy82aE9WMHRYd3ZVQzhsZGpxclFneFRDT1JWOGZS?=
 =?utf-8?B?dlQwYkVPRm9FV3ltNFJCcUJ6Sm4xYWRQUXZoMDBiaGs2T3QwSGFpOEhzVUNk?=
 =?utf-8?B?bHF0RnNFMFRXWFZSSTlVU3JXQi94S2pvQ0hUTXIzMlJRYzJMNzV0SDA5N29J?=
 =?utf-8?B?cDM0OVRmRTd3MlMxaGZjNVFYdzdjTEtGVG5xbzVWRmpvOFVZK1l6TlVXa3N1?=
 =?utf-8?B?ckhsZnV5L1hoV3ZJZVpLc2pLZVFYY2NqVEhBTEhOZEwwdDkwVkpXZDQ4VDJt?=
 =?utf-8?B?T09HbVlZUjRWNjl5V0cvVWhXUUpsc3pSbXMyc3ZHck4zYmQ1aisrZWNCNFZk?=
 =?utf-8?B?eDMrWXhEZlgycWJ1UzJjbUJrbWlBRndpZEZWd1pJT2h3WmdkR1JUdTYyVllj?=
 =?utf-8?B?YzNueFgvTlNsdnUwN2hMbVVJRkVJUTJER3Zndk1lZVd2VVR4clJ0aHZmTnpk?=
 =?utf-8?B?MjdsTSttVTJva1BhcEk1QVdnWjdxMElmMlVQaUVJeVpVUGgybkM0QWlUa1Na?=
 =?utf-8?B?SVRVZXB2MVBWYTJHWCtuQmFxWTBFQ25aUDNzNVFHbkFyRmhLd0o2R3c4OEhC?=
 =?utf-8?B?VVdqeUlIWUZ6K3NSVm5sMlRVNzQrZGErUUpPcW9PczM4OEQ2MEtXcGlkWnVY?=
 =?utf-8?B?VU1nOU0yTy9HS2NBSEJYT3VCOWJ0VDB1RFZUa2FaQjMrVCtzMjlZbXhKbFI5?=
 =?utf-8?B?NnVaMElvV2EzczY3a0tZSG9KVFpzRTE5c3lMM2NLYURRTGZIenJ2dUJaUDBr?=
 =?utf-8?B?MFdlWHR4VHlpVkhJVitSOTU3OTdwU3ppOEwzSitHNnZJYndaVWh3UEZRZFQ4?=
 =?utf-8?B?cnFlUWl4dTZwR3YzNjhPOWY2VWRQUXFaT2d3STVjYU56NGhJUkdLVXc5eWJJ?=
 =?utf-8?B?cmV6RjZmLzFLZUJjMXFnTmNBbEVtR2REaWpxNmI4TzEvTHNQdUtlLzdabmFG?=
 =?utf-8?B?YWpkVUsvNEtLMXp3WVNoM2pOSTBBMU5LNFNxaThPdEI2dWpxc3BGTjRjelo3?=
 =?utf-8?B?SjgzM05May9valg5TWR2d2pqUGk2N01qcnczYWF3aTJXRGhwY0FBRTZVdmg3?=
 =?utf-8?B?aFRRc3NVejFWdzVaWFM0QmQ1QjQ0WEJreHU1QUNFSlFPeHRXdFVlM2JkYkpl?=
 =?utf-8?B?YURYb05TbjNqQ3VXaytlTUNBZWNTU09ZRElvcVQxTlFaMzMyd1VwdjhEdm5Y?=
 =?utf-8?B?SUFEOWQ4QzVWd2JkcTY3L3BycVAzMEs0aWl0M2V4SU1XZkY4c25DNXFiSXBE?=
 =?utf-8?B?ai8yMzArZlhqb2RDY3RYVlg4ZTJMK3RGVzhJVGU5cjNXYWgxTnhjZUVwUWZN?=
 =?utf-8?B?bHhhNkVvV3FyalRlWXNuRUtaRlpJb1ZjRU5FTGpwRFR3K28rYWJuZDBnZkMy?=
 =?utf-8?B?YXVWYnUremE4blBtdy9UNmNlM291WGVFRkpJYXVuMVI2MGxXcHV0bjlnbENX?=
 =?utf-8?B?S1h2cEc5ZzhJU2FqZ0pnUTk1NTl4MUlHUEVIQUR6QUZPdWtjbGtlNzEzYkpV?=
 =?utf-8?B?VzUwbCtTV3BqeUxTMFc4WktYRXZkZkxFd1RRem9HQnI5MXJwbkpSdWV4UDVj?=
 =?utf-8?B?a29FazFxNDVqSGtYOWdrbzhOUGgwRHoxQ0pDTWkyelRzTWFjYWdDV01BM1Jl?=
 =?utf-8?Q?h29Phkz/bHUVI?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OU9oZ1ZBcnl5Nm5OOU50QVhrUDRkR3l6Rmd3Vi9FbXIxVTNwOHF2UmZ5L1FF?=
 =?utf-8?B?V3hpV1EzaEU5NGwyZTJLV1djSU1HU3NSWUFPaGxzU29OaUhwUkZyeitpSzJX?=
 =?utf-8?B?bk4rVXJ5b25WanJwT1BQc1BWOHVQQjBKMGY0ZHpxTlduVTdNTmd3VDYxYWNs?=
 =?utf-8?B?QTByd3gzQVlXTzNEWkpQQmNaaEZxT2RYcVgxSFJzaW4rdU5qNmg0dEFFMkpn?=
 =?utf-8?B?czc2MW9FUXF0VVJyeVJMVUJ3Vm9UN0trQng4cDFvZm9DcE1La3M2cG1KcmdB?=
 =?utf-8?B?SzhpQWJreU4vaXpZSW9hT01KaU5YdFAzOGJBODlkNnpEd3YxTjhQYkRvaVhv?=
 =?utf-8?B?QnY0RVE1MGJJQ2J6NGlESjlTK1ZGb0crdVd0eXFFblJFWjZpUnpuQUdRVmcv?=
 =?utf-8?B?R2U2aHlwZ3oxQ1VzQWF3RjR3K0NWcUY0VVFDanZaM09WSEdKdnhwTzZSYWxm?=
 =?utf-8?B?ai9hbHlXV1V6eE9KVkhvMERBMEhmNVJCSU01bGw3MUg3NTY3RXVuV09UWld1?=
 =?utf-8?B?MXhGMXRYbmJKZ3ZXWHNaRTlBK1V3VFJHN0c2N0x1QWpYNlZmUE1HaWg0d1h1?=
 =?utf-8?B?aW5VeTJuQkVHa01oMnZaT1VWR3Zwb0lvQnZYTGFFUytkbUp6WWYvRkh6U1ox?=
 =?utf-8?B?d2tMNVU0K0J5TUNPL2xxQnNldkp0eFdURldGOW9pZmtyYnhhekt4L0d0UHFY?=
 =?utf-8?B?dUIzb3dpSXVDS29sUnBLK3JwVXhxSExIenlBeDAvOVFwbkRjbE1YeTR5bmlt?=
 =?utf-8?B?MGFiQ1hkeW5GQTdUYllzemdpaHovK1FKaEhzUkZHRG5tZS90eTNMUVpWcjRV?=
 =?utf-8?B?cUxLVURjQWRBblF2Zm50WWpjSDJyK25RYmdWZFRocDJjWjdoK1RwNmxoS2hG?=
 =?utf-8?B?bE9lSUNBZTEvMHRqa1dldHF6bHdDRXdNSFJ4SlAxdHkwazM2ZnE5bXlyK1dZ?=
 =?utf-8?B?OWFUL1FaNGZlVzgzdEhRcnlVL29jZnVNTDU2UGg1cS9LWk9NUFRxRmx0Nkxq?=
 =?utf-8?B?NTVzaTV1WnVHbmRESUVTVGsxQ3hjaUFDMmp4eDZ5YVNPM3d1bTExNmhnOHBy?=
 =?utf-8?B?VThMNDdBYXBqOEdSRnEwNGhEOHRnTE8zekxQZ1VFeUFvQk1Hd0RlVXJ2Zy9P?=
 =?utf-8?B?T2hWY3FlWElrUHROTHJRVFBKaE96ejc1OFhoeUdHa1ViRjN2eXUzRDBPdXp6?=
 =?utf-8?B?YUdqc0ZxaWdSenllbGUyOHVXOW12OXhRTE16SHdYVnFaemQrdHBkUzM4U2lh?=
 =?utf-8?B?TGJPSmIrOS90cVMxR2RpQjF1TzlVRWp4MDJMWTQ1MjcraTU2UXl2QWVNN1pv?=
 =?utf-8?B?a0s1endJVVZXMVdUekVYMEdlaVBxL0dpUFpwQ3Jab2Y1U3BDa3FRUlhhMW1M?=
 =?utf-8?B?QXNJWWJ1OVhBTHZiNzhxSlM0NUk0UmdFcytCSFdZa3RTVVZYZ2FCQ0dyakd5?=
 =?utf-8?B?UnZ5VzJyamc5U0pMc24rendJcFdaNnh2RzhwT25NVWtIZVBTWVJvbHM5MjF6?=
 =?utf-8?B?Y0F0VUNXbEcya0JwQ2ljalJoMURFc1NQcmJNVG5zR3ZwYWpPYm9IS05hQmhZ?=
 =?utf-8?B?N2tJYis4WTNET2QrdmxZNGd5Vno2ZHFGbjVTb2hTc01zR2ZBMStZYXRjRHRR?=
 =?utf-8?B?OUZZdTJKUjE0RjBxeXR3YmJOdWhkaC9TVWdGeEdxREZBMXhQZ0VZWDU3czR2?=
 =?utf-8?B?UFlLU29mYU11OUlQbm5IYklYRkZFd0I4QVprMHJqcFpxMjUxd2g5Z3AwU2dr?=
 =?utf-8?B?Q2Ezby81QWNDR3VzQWkydm9SRWdQakx1eERFUlZrTHN2UTJnL2xUbCtDUWxy?=
 =?utf-8?B?cWpsM3VYVG94SDBiVTZLK1NkY3JwandwbjMvcVJaVkxyZFBuREZheVFFQ1RP?=
 =?utf-8?B?UlAwK3M2eUtUUUM5RHJoZE0rZFJIWXpDUHFyOTM0aUJUekpuY2I0eTRReXdn?=
 =?utf-8?B?QWJrMlhmb2I1L1QxODFIN2hCSDJ4RjNUdWllNFRZK0JzMXhITGtBTWpLV1cv?=
 =?utf-8?B?allrWHp0RnprS1pSUTkwZFJ2KytNWGtmM3RhdmZ5UG9NMU9oK25ib3cxeERm?=
 =?utf-8?B?bVdndFNjUnF6NW9mdnB2dzJQekc5aFF1MjdRQ1d3eUU2MDJOd3dsQjRWcGZq?=
 =?utf-8?B?M2FGV0l4Qzd3aWRWaWFsbVZ2TXM5VkcvOGFXdkY2SFFWMEkwRVgxMlYxOTBj?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fafb701e-7281-4844-4ed5-08dd88fb0b55
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 21:56:36.6420
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PxZOxeWNIzWFMVYl9CjhxaQZnlV9GYs1+Jwq3VPFvc7I5+sY8ZfJNqo8maU1aYrF2SdAKXcYLTgr2oqpqnTjbX9EKdaiY5te+NnkPG32PM4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8733
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> Expose the most commonly used TDX MRs (Measurement Registers) as sysfs
> attributes. Use the ioctl() interface of /dev/tdx_guest to request a full
> TDREPORT for access to other TD measurements.
> 
> Directory structure of TDX MRs inside a TDVM is as follows:
> 
> /sys/class/misc/tdx_guest
> └── mr
>     ├── mrconfigid
>     ├── mrowner
>     ├── mrownerconfig
>     ├── mrtd:sha384
>     ├── rtmr0:sha384
>     ├── rtmr1:sha384
>     ├── rtmr2:sha384
>     └── rtmr3:sha384
> 
> Read the file/attribute to retrieve the current value of an MR. Write to
> the file/attribute (if writable) to extend the corresponding RTMR. Refer to
> Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest for more
> information.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>
> ---
>  .../testing/sysfs-devices-virtual-misc-tdx_guest   |  60 +++++
>  MAINTAINERS                                        |   1 +
>  drivers/virt/coco/tdx-guest/Kconfig                |   1 +
>  drivers/virt/coco/tdx-guest/tdx-guest.c            | 291 +++++++++++++--------
>  4 files changed, 250 insertions(+), 103 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
> new file mode 100644
> index 000000000000..fb7b27ae0b74
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
> @@ -0,0 +1,60 @@
> +What:		/sys/devices/virtual/misc/tdx_guest/mr/MRNAME[:HASH]

I missed this on patch1, but I am still not a fan of this attribute
directory being called "mr". Please make it "measurement_registers" or
"measurements" to remove ambiguity.

> +Date:		April, 2025
> +KernelVersion:	v6.16
> +Contact:	linux-coco@lists.linux.dev
> +Description:
> +		Value of a TDX measurement register (MR). MRNAME and HASH above
> +		are placeholders. The optional suffix :HASH is used for MRs
> +		that have associated hash algorithms. See below for a complete
> +		list of TDX MRs exposed via sysfs. Refer to Intel TDX Module
> +		ABI Specification for the definition of TDREPORT and the full
> +		list of TDX measurements.
> +
> +		Intel TDX Module ABI Specification can be found at:
> +		https://www.intel.com/content/www/us/en/developer/tools/trust-domain-extensions/documentation.html#architecture

Documentation indeed looks better now. I had also been wanting this ABI
documentation to refer to a generic description of how
measurement-register sysfs files behave. I think you can achieve that
simply with a link back to the generated driver-api kdoc:

https://docs.kernel.org/driver-api/coco/measurement-registers.html

Of course, that link will start resolving once this is upstream.

[..]
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd5bbf78ec8b..3afbf6c310a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26284,6 +26284,7 @@ L:	x86@kernel.org
>  L:	linux-coco@lists.linux.dev
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/tdx
> +F:	Documentation/ABI/testing/sysfs-devices-virtual-misc-tdx_guest
>  F:	arch/x86/boot/compressed/tdx*
>  F:	arch/x86/coco/tdx/
>  F:	arch/x86/include/asm/shared/tdx.h
> diff --git a/drivers/virt/coco/tdx-guest/Kconfig b/drivers/virt/coco/tdx-guest/Kconfig
> index 22dd59e19431..dbbdc14383b1 100644
> --- a/drivers/virt/coco/tdx-guest/Kconfig
> +++ b/drivers/virt/coco/tdx-guest/Kconfig
> @@ -2,6 +2,7 @@ config TDX_GUEST_DRIVER
>  	tristate "TDX Guest driver"
>  	depends on INTEL_TDX_GUEST
>  	select TSM_REPORTS
> +	select TSM_MEASUREMENTS
>  	help
>  	  The driver provides userspace interface to communicate with
>  	  the TDX module to request the TDX guest details like attestation
> diff --git a/drivers/virt/coco/tdx-guest/tdx-guest.c b/drivers/virt/coco/tdx-guest/tdx-guest.c
> index 224e7dde9cde..e76810d89e0b 100644
> --- a/drivers/virt/coco/tdx-guest/tdx-guest.c
> +++ b/drivers/virt/coco/tdx-guest/tdx-guest.c
> @@ -5,6 +5,8 @@
>   * Copyright (C) 2022 Intel Corporation
>   */
>  
> +#define pr_fmt(fmt)			KBUILD_MODNAME ": " fmt
> +
>  #include <linux/kernel.h>
>  #include <linux/miscdevice.h>
>  #include <linux/mm.h>
> @@ -15,8 +17,9 @@
>  #include <linux/set_memory.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <linux/sockptr.h>
>  #include <linux/tsm.h>
> -#include <linux/sizes.h>
> +#include <linux/tsm-mr.h>
>  
>  #include <uapi/linux/tdx-guest.h>
>  
> @@ -66,39 +69,144 @@ static DEFINE_MUTEX(quote_lock);
>   */
>  static u32 getquote_timeout = 30;
>  
> -static long tdx_get_report0(struct tdx_report_req __user *req)
> +/* Buffers for TDREPORT and RTMR extension */
> +static u8 *tdx_report_buf, *tdx_extend_buf;
> +
> +/* Lock to serialize TDG.MR.REPORT & TDG.MR.RTMR.EXTEND requests */
> +static DEFINE_MUTEX(mr_lock);
> +
> +/* TDREPORT fields */
> +enum {
> +	TDREPORT_reportdata = 128,
> +	TDREPORT_tee_tcb_info = 256,
> +	TDREPORT_tdinfo = TDREPORT_tee_tcb_info + 256,
> +	TDREPORT_attributes = TDREPORT_tdinfo,
> +	TDREPORT_xfam = TDREPORT_attributes + sizeof(u64),
> +	TDREPORT_mrtd = TDREPORT_xfam + sizeof(u64),
> +	TDREPORT_mrconfigid = TDREPORT_mrtd + SHA384_DIGEST_SIZE,
> +	TDREPORT_mrowner = TDREPORT_mrconfigid + SHA384_DIGEST_SIZE,
> +	TDREPORT_mrownerconfig = TDREPORT_mrowner + SHA384_DIGEST_SIZE,
> +	TDREPORT_rtmr0 = TDREPORT_mrownerconfig + SHA384_DIGEST_SIZE,
> +	TDREPORT_rtmr1 = TDREPORT_rtmr0 + SHA384_DIGEST_SIZE,
> +	TDREPORT_rtmr2 = TDREPORT_rtmr1 + SHA384_DIGEST_SIZE,
> +	TDREPORT_rtmr3 = TDREPORT_rtmr2 + SHA384_DIGEST_SIZE,
> +	TDREPORT_servtd_hash = TDREPORT_rtmr3 + SHA384_DIGEST_SIZE,
> +};
> +
> +static inline int tdx_mr_report_locked(sockptr_t data, sockptr_t tdreport)
>  {
> -	u8 *reportdata, *tdreport;
> -	long ret;
> +	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {

Why a new @mr_lock when @quote_lock exists? Are they not protecting the
same things?

> +		u8 *p = tdx_report_buf + TDREPORT_reportdata;
> +		int ret;
>  
> -	reportdata = kmalloc(TDX_REPORTDATA_LEN, GFP_KERNEL);
> -	if (!reportdata)
> -		return -ENOMEM;
> +		if (!sockptr_is_null(data) &&
> +		    copy_from_sockptr(p, data, TDX_REPORTDATA_LEN))
> +			return -EFAULT;
>  
> -	tdreport = kzalloc(TDX_REPORT_LEN, GFP_KERNEL);
> -	if (!tdreport) {
> -		ret = -ENOMEM;
> -		goto out;
> +		ret = tdx_mcall_get_report0(p, tdx_report_buf);
> +		if (WARN(ret, "tdx_mcall_get_report0() failed: %d", ret))
> +			return ret;
> +
> +		if (!sockptr_is_null(tdreport) &&
> +		    copy_to_sockptr(tdreport, tdx_report_buf, TDX_REPORT_LEN))
> +			return -EFAULT;
>  	}
> +	return 0;
> +}
>  
> -	if (copy_from_user(reportdata, req->reportdata, TDX_REPORTDATA_LEN)) {
> -		ret = -EFAULT;
> -		goto out;
> +static inline int tdx_mr_extend_locked(ptrdiff_t mr_ind, const u8 *data)
> +{
> +	scoped_cond_guard(mutex_intr, return -EINTR, &mr_lock) {
> +		int ret;
> +
> +		memcpy(tdx_extend_buf, data, SHA384_DIGEST_SIZE);
> +
> +		ret = tdx_mcall_extend_rtmr(mr_ind, tdx_extend_buf);
> +		if (WARN(ret, "tdx_mcall_extend_rtmr(%ld) failed: %d", mr_ind, ret))
> +			return ret;
>  	}
> +	return 0;
> +}

Ok, the above hunk is an example that this patch is doing too much at
once and making the conversion unnecessarily difficult to follow.

There are 3 separate topics in this patch that deserve to be split into
3 patches:

1) Convert tdx_guest to cleanup helpers

   Now, I do not personally like the fact that conversion to
   scoped_cond_guard() causes a bunch of code to be re-indented, that is
   messy. One alternative to scoped_cond_guard() that I have been
   considering based on feedback Linus gave when that helper was
   introduced is instead do something like this:
   
   DEFINE_FREE(mutex_intr_release, struct mutex, if (_T) mutex_unlock(_T))
   static struct mutex *mutex_intr_acquire(struct mutex *lock)
   {
   	if (mutex_lock_interruptible(lock))
   		return lock;
   	return NULL;
   }
   
   ...then you can do:
   
   struct mutex *lock __free(mutex_intr_release) = mutex_intr_acquire(&mr_lock);
   
   Where that allows you to not need to re-indent the whole function.
   
   If the lock has limited scope within a function then just move that bit
   to a helper function rather than re-indent existing code.

2) Conversion to sockptr. Prepare the report retrieval code to
   alternatively store into kernel or user buffers.

3) RTMR support on top of that converted / cleaned-up base. This will be
   much easier to read withtout the re-indentation mess and other unrelated code
   movement. Just a clean feature addition patch.
