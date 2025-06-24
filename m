Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CBC2517AA;
	Tue, 24 Jun 2025 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800683; cv=fail; b=BzWwDhXKczqb5v1LXLGQQsKPUW6FQohhYNzQrWJNHXV84QiUaUIE8FMPRgE0pv2X+vk1gTPj+p1IRRPr5p/BElxR3PaWeAubypp/p4K283XyuIOKtnN9D4o2rlcwhYaW2ha8J8ghdyMOrzXJWhXeWIYrP3UdyWJeIb9P/4E/aAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800683; c=relaxed/simple;
	bh=dZ7Tbvb+yi+aUZIpcF8YXibGGcidvJDibPyNLX134V4=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HCz/jKTOMFDB+JugKRqwoxbZ1B5lMaXRqRLw1ocIRfOPabjuiHTjvnBYNjUp+FhsiuLjfG9GRtXcmFVNxx6Zra8NVhZmXNZ6yOxjI3vJpMVgSWhrMQjjG/vp4c8FoNKExUPlnomzHrzHg1vJi5Nt9ERxPos6wwoXOa5oCR9lpg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FF99OnYu; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FF99OnYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800681; x=1782336681;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dZ7Tbvb+yi+aUZIpcF8YXibGGcidvJDibPyNLX134V4=;
  b=FF99OnYukuzgS1ed6kG3AZ9N0EGD6/2PdoMrU0NU+RP2JwlUCzBIBiau
   jMtUe2PUDVt776y4DFlnaTURAWfJ/VLkOAK1SH9aPkLjAsosqLNKDihqg
   l5aL1jd05lDuFK+2kDXD3nS3hX4Exn5HPBZRdmu9s5L5ZdON3wAf9XQ8v
   /Aff9pzEkBqrcSW7VlEbX8+GohrrL9U6X62i9zTuM0IQ8nELW/gOY3ME5
   ILYqXZcbeXybLkrTKkSSOdbGDpbB3VzwyxKN+iiqQ5eUaBvj2P9ECNClo
   upv/eziMcnkcphZitrvbOzbZ2RCdwi3S5qChJ+H3hrABbwS5Kz784BWjt
   Q==;
X-CSE-ConnectionGUID: +WF2xrtBQWayfXeRYa1JBg==
X-CSE-MsgGUID: /N0W1tMySYKSDgcSH/tCKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63658730"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63658730"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:31:20 -0700
X-CSE-ConnectionGUID: eSZerEYuSQuqUai+dBetOQ==
X-CSE-MsgGUID: orXMmGjcQ52NFKpI+AMOOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152321570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:31:20 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:31:19 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:31:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.84)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:31:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=natBDUEwUbgX4SiRM9ltZFuDgfaWcYbe1pYDVVdCtXgqTGeehYlFZd9IZwFsFkne8gMLHxmNlbNab1KZSdluwjl+1i2kCppvrBQaKdmncaM774G0nDpzdwQCyhJR7Bk+QBiguJq+AKYRJoqGCQFU3EuOJVlQX5uFkQxZctDPb0XOdBYOETyqwR0mPXlfQF8YwPQI1jx9YfbpulFRhybx7ojQq2gOUbLyEbpHrOYJsyOzYp5zTygQF2Dk9HNgzjTMZnhhphLSLfKDk/q6p+pxs/jhkjKTV/Fi7fKgeetIjGChjiZzsKZJiKzdLS1WAshNaDN7pMBEmHEEOFVVQVRgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saWY5EEtju5m778dQqNM10tmTmAJMHcZMTCXRgPvub8=;
 b=ZibGlP49s9CM+lwCfcHVgbYHoM8cOQHLeQhSaQJNxLJ8WtXS4pFPIS3XNE8HBWeZbje+94McZ1LJSNVyWGIHbpchyONgjIk8r3uVU9JQyxez1+mdtoTA7BZra4pLIW2T2FqCIWa4/TNOwtQpJmrMbutSm8jU0s606dafZPpOk+W85C3VtSuoh3g+bizrH8waUSKD6u2bGqzGTfG3F8ydMfXIbBy+bZaudtKWQCzyVvtZC4cb1lKmZv+k94yVPFQ1Aplhz+mf2h2Bh9reV4t2s09EXA4R80Txr1v7wU8SgIV7pkbm5ZBCuFibOXPecBRgfBjvqK9ozGXg9HBF023z7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 21:31:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:31:16 +0000
Message-ID: <ff41df42-6267-4684-a2e5-ab8b90ce5bb0@intel.com>
Date: Tue, 24 Jun 2025 14:31:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 06/32] x86/cpufeatures: Add support for Assignable
 Bandwidth Monitoring Counters (ABMC)
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
 <c3a7f07ae0e8d1495b778013afb09d078ee4618d.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c3a7f07ae0e8d1495b778013afb09d078ee4618d.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0056.namprd16.prod.outlook.com
 (2603:10b6:907:1::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: c987faf2-232f-4432-ff82-08ddb3667359
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OVlMKzNBMU1oRGRlNHQvNjN0c1NqUVR4TmlScndkL21oTGpCSVBpVXM0emtS?=
 =?utf-8?B?YllhdkZPZjZUMzVCaXp5ZHBTazZiVnpoMzVWSERIdzFCYzliZzFLL2NJZy9P?=
 =?utf-8?B?bGFlOWVGOElNNXkrVWFqTDNFbzg4THdXTmRub2g4Wmphc1pjVmxiWXI3TGVD?=
 =?utf-8?B?NmZxdHdCZE9IbGhIaC8zUFZ0T3FQZ2k4WElxaEw3OWxQeitjR3d1cElCWnBE?=
 =?utf-8?B?SU1rV2hwTldiMXF0VENWajFkM20zSGgwOWdmU3k2eldsL0VCamdXeThxT09N?=
 =?utf-8?B?RktQTUVGbzFrL1phSzEyTlJFcWxqeERLQnh3UzVBVE05YWdUOWxsenQ0aGs4?=
 =?utf-8?B?QnFhZklZcnRxR1lSYnJLNnA4eldQdVRSMndud2Qrd2pPd2NiZXM4a3RaSXRa?=
 =?utf-8?B?QXltNnQ0WjZMQ09zZnlIZjZDRzVBb1lkaFVybGFqSDJ6MTZrYnBpU1drSmUx?=
 =?utf-8?B?OWk4WEtXeFYyU2RxeXZZNzdEQmYxS2hjZ2VxODR6NTg0Ly9zQ21HZWJhL1ZB?=
 =?utf-8?B?cmM5dDlEVHEwcEtGblF6cDllcVNWUHNXbnFFS1ZOOEdtTjV1b2FXZzFEZWZr?=
 =?utf-8?B?OEFEUFdnNktCZjZNVG85NUZha0QzT1BsVERCeHJxZHR6MlBjNlhVNUR0bERr?=
 =?utf-8?B?YVd6dy9qbEtSa0dxRWpLWHE1aWV1TmFPK252N0hKUG9HeWtsc1UwdGV0d3BY?=
 =?utf-8?B?N1pDQ2xUYVdoZFJodUZWSlBORTNoT1Vpb2VkTkl0NjdEQzNXRGxyNGtzc0Jz?=
 =?utf-8?B?a0IwZitGNXlrUDBEay9JTDQvVGlSV0pkWVpvYXhjUnprdzNOMnMwQjVzcGMx?=
 =?utf-8?B?WFJYNVlTS0MydnlOamhqVmtDR3RBVlNxek83NGJnb0tsVzc3cEttZi9EWU5F?=
 =?utf-8?B?dHJzYmRFZFlXNkFhWnFkQkdYUmdnK0I5Q0x2ZXlZd0tHOWl6R3c1Qk1lSGc5?=
 =?utf-8?B?WDNyZWlvcThyZjNZNXVvNmJWWHAwTnJnQXlrYnlWWUhoOEtIcTFzUGt3WHU0?=
 =?utf-8?B?ZEVLSC9EUlZMSUNFc1JlNmlFZHNrRzMzVkwvaGVqcnpJYVVtL1NYeldOZXI3?=
 =?utf-8?B?SEkrWFhBWWZvSFRtZjNHSFJ6WU0zajI5WHlnUlJsNERTblZxcXZKN2pkQkRE?=
 =?utf-8?B?ek5JZDlWN3FrQU5ycGkxZUR3OTR1dzFWVUdhY3U2WElPeWo3WE95ZXhXdy9W?=
 =?utf-8?B?S0Rvdk5vRUtzVDFXaWdUNVpuUTRzZjRUVFROdFFjVmtPM0xhV2V3N1pTWi9u?=
 =?utf-8?B?and3R2NZQW1sd2JFYUY2blVhcllzWjhnVmpvMkFWVFVjTEtUeU9mRm1VZXBW?=
 =?utf-8?B?TGF4VnNYV1o0S2xid1JIUkpPaEhRTGRPbGx0ZG1UMEE2QmovMEc0REpSOXM4?=
 =?utf-8?B?U2dtam05R0ZoMm9mTXh6bW1CaVhxczdKd3NKaHFVMzNGOFVqQmtweFczTTQw?=
 =?utf-8?B?c2xMMnptMTc1QUtIcFJWY08wenZ6RHNQTy96SUt2T0Q2eEVucXN0c2dLZ0VV?=
 =?utf-8?B?WGg3OFBxcWdoUEltK2FpY3A1dXorU1U3Yk9KbStiaFRYaS9OTVlOVzVRdHBq?=
 =?utf-8?B?NnpveGJnRS9ldDBSWTdiY2V0cTVjN1pKU2FLYzExdHp3ZisvZ3VZbHlvZW1U?=
 =?utf-8?B?eURiZDcrdEdTSFc4RVhyMlEvTGtMeTMvblBjTTBhNEFVNi94L0E1QmxvSmla?=
 =?utf-8?B?WERvNnFMMlJPcXlKSmczYm91N1BySis4NEhjcEZzSmh2N2lWbXoxSkNPMW8r?=
 =?utf-8?B?TkhieW1KQys5b3lFbk9wb25jelZQRHNRdktLcmx5Tng0aGtYa2dMdHlKVXNu?=
 =?utf-8?B?YWFnY2J3Y0Nib3ZyZ0w5ZnNKZmhoVllrbEdyZUhEa2NyMncraWN5MitwSHFz?=
 =?utf-8?B?a0tTQjJoNUdGTHcvMklKcjl1am02VlJxTnFyVjJPOUs4Zk91dVZOZXU3NWFw?=
 =?utf-8?Q?tZZ0mkcj4EE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNMd3hEU3BLc2dGVkM1clhPY3NFd0pic25reFlpUjdreEV2M0RrcFZOcjRZ?=
 =?utf-8?B?d0ErV0dyNndIYzhmZjkrc3pwS1lrQmxSM0ZVSkI1TVM5c2pNUzhuYWV3cFpC?=
 =?utf-8?B?MGtTUFk2S1N2SVVnSi9vbGgzajFoZDY3emFaZ2Z2dE1mUEtCYTltQWpxeGpr?=
 =?utf-8?B?QUg3WnBJWjdEUms4MVVKaFd6RVd4dlpraUNPSVhmYXltcmxJTERyVVJ0S2JQ?=
 =?utf-8?B?ODdmNVZCY21SOERPemo3c3k2M20xYlFSaDFTT05vSHFpTlYxK0dRbFBzR3g2?=
 =?utf-8?B?NUEwZkU3MVJmckZZYS9ZcXI2d2tLMnU0RGVTOWtDZGlOV0ZnOEduWTBtNW5S?=
 =?utf-8?B?dzJac3JwQW83eDFZQTJybUk4M0F1QWtUTTZlck8yMWNRYmdCbjRwazJNL3Np?=
 =?utf-8?B?ZVcrN24zNiticm9pR2pWc21EemZPRFVmMW8wYjZQVEVPaVRzQ3BJYlphQVJC?=
 =?utf-8?B?NjdNUDdNOW1VbUJRbjM2dDFwVm9ybzFQS2pXZ2I4VkFxM3VjbHBGd3VNckRj?=
 =?utf-8?B?b3M0UjVIMC9ucTFPZ3Q2bzV2ZDRoOEgydnNNd1JiVTJoRFZFMU5xTTFxK25H?=
 =?utf-8?B?TTVRRTVhMHg1czVmc2xES0piQnVWY2tXajMvRko4YjR5NXhTd2tIYS9RdWRH?=
 =?utf-8?B?Z090bGIxT3Zxd21YZm1PWjdCcWlnbE1lQkN1VW1MdFI3dGE2R1hucnFFdmY1?=
 =?utf-8?B?eFhYQ3FGOEM0RFlVT1YzRHZMOERnMm1iOGJMTTc0eDY4K1UyTkxERy9mM0xk?=
 =?utf-8?B?K2ZhMTZ3QmZOVzNHOE4vRzgxeTdsaFBKbThCS1E5blRvN0J3MCtWRk1iZ3Mx?=
 =?utf-8?B?R0cveFNEeEhIOEJDMUlvS1J5SG91dXE4NUM0ZERBaHpWVFQ5WHBlak5JYml5?=
 =?utf-8?B?U1h3bFh5RzFPdEE2TTd2d3hXdXZyTldXcDBjMzd5WWxTaVJXRGxEdGlWZzdL?=
 =?utf-8?B?TkdTbkJwWVpTT3BYWUdQRXNNWldOOW5TaTdPY0p2ZS9lTDZjYVpUNjBTSEh0?=
 =?utf-8?B?K2xwTmN4T2VxY0JkNHQzZTR0SHV1T29ZWGNsVlVkNk03Skl6MzBtTUxDZ1kz?=
 =?utf-8?B?cnFrYXRUUDlKRXArZC9KMmE0T0VIUGtHWGJrNE83WWNoZ2VqQlVwTFh2b3Fu?=
 =?utf-8?B?WlVkWGtpS2h3bVlmTzNwUDdRS1MxbHpyVStJVkV1cHhMQmt0M3ZPOFQxeE0z?=
 =?utf-8?B?ZVdIZ2pCYXlXMFM0R2RNRTU4M2xGL1pqM0gxMlVqM3ZpbGw5WE5LbkhwbVg1?=
 =?utf-8?B?bmVid2c0dUxjaEVsYitBZ0s1MGlpSUdhWGJVd3VPS0x0WFJDcE90djBhYWlr?=
 =?utf-8?B?UmszYm5GN2VmMkN3dHpTa2ZRUEg2blBCZGMzcUdrb0t2dkowT2pFdkJxdzVE?=
 =?utf-8?B?MmtLNWJqL0pXaGpKS1BhL2pFcDlBNzYzOVJ3SXUvcy9LSUU3WW5oUWh0OWZw?=
 =?utf-8?B?eDF0ZGFuS2VMZDMrY055allXNlFtWFlSaTNTWDZ3azRNaGE0R2tmQTRQUFlC?=
 =?utf-8?B?K2pmckhCVXZ5U1VXQUR1S2RTZWNoK3dUVGdGZ2ZYVnRYbFhQMDFaSWZlT0RI?=
 =?utf-8?B?dXNUZTNoTkxRbEZKb3RhQWxPZDFmeCthS3VoM0dWcVdoMEVkeUVxdVBzTW5Q?=
 =?utf-8?B?WmhaOGpSVUVDZ214ZGxHQnRFYlVsaEJ0TzZVcXM1M3k2cnlFRlZUbU1renFS?=
 =?utf-8?B?Zmoxc1dlMVNjQ0dKTUh2akg4SmtHNitxOTZPK0FTaUw0TS9WYXVHMm5taVBQ?=
 =?utf-8?B?bXpNQnZ2by9EMHZ3N2xXdkQyQVBzck1zYm1nMmdaQWl6RU45b09nMTlPNFNu?=
 =?utf-8?B?MFU1UUp5YkpKMzR4VE9oZXhHdDgwbStlREtWbGFZamNuMmtlQ3kzUkhZV0R1?=
 =?utf-8?B?UksyeTU3MFdQVUVoZjFZT0ppZzY3ZzFWUFQzRjY2RUI4SHpwMWRINStPTWxl?=
 =?utf-8?B?eUtIRzBZT0xNd3BMcFF1RmFvZ3hnaHF1NjZZaGI4S01udzg5Nk8xUWVCaEJn?=
 =?utf-8?B?RGlkYzdjU0JHVEpzTVRHS0svZkIwQk1NbzBBTmZ1eGVRNTlFb3dTK2NFUnJn?=
 =?utf-8?B?TVkvbnA5b2hSTGR6WXVYSmxza3BFOHhmZVZmQVVyWnQwM1d5eW9jdVFMQ1hx?=
 =?utf-8?B?VXJUalB2UXFGV3FJaWJjb29QdzhHWm9RUVBRcTBkVjdJZGtPQ3IxenNST3dG?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c987faf2-232f-4432-ff82-08ddb3667359
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:31:16.2320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI9Bi2yEVqWAyTJ2nbsmDSgFri8NDk+Ssu1KD+3KBuqPWVcVZTCpQjtDF5kE7MR98AYUCjL4NoRG5iah1T2RRFhevP7nKAgI9JX8IL1+7gE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> Users can create as many monitor groups as RMIDs supported by the hardware.
> However, bandwidth monitoring feature on AMD system only guarantees that
> RMIDs currently assigned to a processor will be tracked by hardware. The
> counters of any other RMIDs which are no longer being tracked will be reset
> to zero. The MBM event counters return "Unavailable" for the RMIDs that are
> not tracked by hardware. So, there can be only limited number of groups
> that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups are
> being tracked for certain point of time. Users do not have the option to
> monitor a group or set of groups for certain period of time without
> worrying about RMID being reset in between.
> 
> The ABMC feature allows users to assign a hardware counter ID to an RMID,
> event pair and monitor bandwidth usage as long as it is assigned. The
> hardware continues to track the assigned counter until it is explicitly
> unassigned by the user. There is no need to worry about counters being
> reset during this period. Additionally, the user can specify a particular
> type of memory transactions for the counter to track.

Looks like grammar updates from cover letter did not make it into this
copied text. For example,
"being tracked for certain point of time" -> "being tracked during a particular time"
"for certain period of time" -> "for a certain period of time"
"specify a particular type of memory transactions" -> "specify the type of
memory transactions (e.g., reads, writes)"

> 
> Without ABMC enabled, monitoring will work in current mode without
> assignment option.
> 
> The Linux resctrl subsystem provides an interface that allows monitoring of
> up to two memory bandwidth events per group, selected from a combination of
> available total and local events. When ABMC is enabled, two events will be
> assigned to each group by default, in line with the current interface
> design. Users will also have the option to configure which types of memory
> transactions are counted by these events.
> 
> Due to the limited number of available counters (32), users may quickly
> exhaust the available counters. If the system runs out of assignable ABMC
> counters, the kernel will report an error. In such cases, users will need
> to unassign one or more active counters to free up counters for new
> assignments. resctrl will provide options to assign or unassign events
> through the group-specific interface file.
> 
> The feature is detected via CPUID_Fn80000020_EBX_x00 bit 5.
> Bits Description
> 5    ABMC (Assignable Bandwidth Monitoring Counters)
> 
> The feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>

Reinette

