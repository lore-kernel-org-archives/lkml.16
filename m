Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8802521CC4A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745000318; cv=fail; b=eoz/ULGcnCdjoNEzLMhJvNQpBOhl/JjuUyKV2MoE7JksT364Vph52ZRX6g2kzgQvcgK9Og6Uv2QlP1o5R8KU760dchkwAn06LnoEEhS5p0xgFJHKS/8cFPofQT6KWSuVk4rXieUB0i0NjgihpXZ4u2y+9ZRvCpFB5MnUTjyCmio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745000318; c=relaxed/simple;
	bh=QOpga8cXpxci/RlHaaTn7600wxIW649Oq/BotfERUtE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=L59uyzngv0l48Xmv0M1ycHKbOS20azgEi6pstLdXh2uhALKTOmkoh0Rfa7RXLCmh6tK4HYyw2MH7hN2e8bk4vWjI28dcqaVTdk7mf2ik/rdhCnz4FRGwcfgML0rbpUeb316Zc57y4lmd/HvfAZr+Zohzn5XFySXkSmHcOKUO2Ds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEoKihxJ; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEoKihxJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745000317; x=1776536317;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=QOpga8cXpxci/RlHaaTn7600wxIW649Oq/BotfERUtE=;
  b=EEoKihxJX76lkDV+jOtdhdAlGtDjM3bsgS2CV2TWIRXynvTk8sodXtMI
   u6ABOgfIzx/yGy6pNfxo0qM57vWQh+vKAGk3m5k/ps1zQO3ZYJVsudUis
   E/1fEez/gsFkGvS7UP0nuvZKfGY6bYRR0x3C7yHHJr6PT4EKPb8B2fq3G
   b748Lgw48urqlKzLMt0JL3425b4XbY3gvgXo9gKu7SrGhoyn+L9QNMM5e
   hSuk9BlxjQZwQITc/Ja1CdUXib3sCtrC6A9msRcy19wXzdfstPsQp64zg
   6pc5UnX6xUyaG+rKVfJdiwv7sz6Cqlt/9VAgc9yBh6n9RLdLyMEwr1vy4
   w==;
X-CSE-ConnectionGUID: ahQnkVElSLKS6a8+KZEHPA==
X-CSE-MsgGUID: EkGSESpkQwa0AZA5e+7UEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="57274371"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="57274371"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 11:18:36 -0700
X-CSE-ConnectionGUID: iFiTaR99Ryu7uJ33QPsfFw==
X-CSE-MsgGUID: EqoKLdFpQkGI7pCaHGdhAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; 
   d="scan'208";a="135275219"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2025 11:18:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 18 Apr 2025 11:18:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 18 Apr 2025 11:18:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 18 Apr 2025 11:18:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3vnvq8sRZ3qVk0cEaKBYMDcMp/q/NX3aL+ogX3IOyMIQDkQo9kwrU+UHCgy/ClbH3vu5MWWfzRNyLDIRcqb9hg15bE3VECFTAuhPDEb2jzCDySFvQiW9FxjLi3m7OMyZjQe3D7fIAyZpY+XtbimswFsr9fvPUUsPY0T96eozjqRmUPEyKylC9jc7tuLCRWOzHObq3B3FqZAhFBpBfPswg7Kvvp++iGb7qv5/FBAz50n/XNGXXrMPF5cCviGFMl5SYUXHc8xlcaOUm+jE33y7kHA25Xun/Iy1dyEqymPVPiZQlR09Hm5dRDS+9mgolcrk9e5c5prRM0vibUcJamVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOpga8cXpxci/RlHaaTn7600wxIW649Oq/BotfERUtE=;
 b=KticvqaXDuLvRyhX0mgjo/iMswTOIj5PDJf5GAg9hwwRv0kVaiLQp4Ia8OnFJfV3X5ugcHOX3os8+r59I3PZcI4Y/9BH3YAuRS0NgpmDxmiAsjaAnxKZ0qWYSDpctwe/lSXTvf6tou3N74KovZyKMZRPoYmunmowOd9HLDkmGm6UCIfIgzy0cS7zx4OxisqU9dlhhLxgUYlbSK8CSvfhAHw4MbZkxYtghyHjiLZdBG8BvOCD9jjvKkPXvvjM2DGOFGD9cyxsLepgtKEE2AtbFjmv2Go+26tyLnD/6cFu4Osa8sLG/XhhrYaZvoxlYW+NbnG2foNaIW2tB5cc6hJeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by MN2PR11MB4711.namprd11.prod.outlook.com (2603:10b6:208:24e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.31; Fri, 18 Apr
 2025 18:18:32 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8655.022; Fri, 18 Apr 2025
 18:18:32 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "luto@kernel.org" <luto@kernel.org>, "jgross@suse.com" <jgross@suse.com>,
	"x86@kernel.org" <x86@kernel.org>, "joro@8bytes.org" <joro@8bytes.org>,
	"peterz@infradead.org" <peterz@infradead.org>, "bp@alien8.de" <bp@alien8.de>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH 1/2] x86/mm: Kill a 32-bit #ifdef for shared PMD handling
Thread-Topic: [PATCH 1/2] x86/mm: Kill a 32-bit #ifdef for shared PMD handling
Thread-Index: AQHbsHpx1Cj8qlAk9E6LeEPswtNoQbOpu5+A
Date: Fri, 18 Apr 2025 18:18:32 +0000
Message-ID: <3a14471baa1fe0803a27922fe9bd929a0062f780.camel@intel.com>
References: <20250418155612.8F276BC7@davehans-spike.ostc.intel.com>
	 <20250418155614.8F925958@davehans-spike.ostc.intel.com>
In-Reply-To: <20250418155614.8F925958@davehans-spike.ostc.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|MN2PR11MB4711:EE_
x-ms-office365-filtering-correlation-id: 3b637c82-8edb-4e51-c0b8-08dd7ea56d45
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QWxUYmhTU2hmMlBvNXlDcyt5aTNhN2k5Z2puWlExNkNua0Z5K0JQZFVHTEZi?=
 =?utf-8?B?Yk1JazlqRmd5VzdaVFVQMnBSdUxsN3B2TzFXWG5oYm5sU213MTYyTjNtOEZp?=
 =?utf-8?B?SWQwUjlOZEd2UFNkS2hIOW1DY0RHNGF0MklJeU9MWGRzK2I5MnY2eWdiUW1h?=
 =?utf-8?B?YUt1UjBoTWlrcnpIMVJNUkZXL21TZDA3TmE5VmUvRkFLOThuL3NuRmRYMWRz?=
 =?utf-8?B?ZFZqY0t1VnJnSXdZVGwxanBCcGZoWEk0M2pGbkpUaFJxOWJMVk1BZTFEZUli?=
 =?utf-8?B?dXp5MGhGQ0VCTjV0d09pQVppTlAyS3AxYXBibGdXNlNoR0ljc0h2MmZsL05D?=
 =?utf-8?B?UVNJbDRXSzMyemFFRlcyc0h0U2hTYjdWQkxzQTNkL3NUcVNUT2ZMdUtpcXFC?=
 =?utf-8?B?VXBVNmxSOTNDSWsvRm5Ib0U3YXVqUjZmemtaM0I5Zy9nS3VMSFhKUGFLY2g2?=
 =?utf-8?B?dUh2QzU3MURpa1dQU2lEL0t2WmNWLzJlb1BJdVNCTjFVUnpBWGNoVHhnZjJy?=
 =?utf-8?B?UUJiUjJTWWRmazlkTzZ5RmxJS21lbUdLeHV2RDFMMXNZMWcreGprS1QzazZ4?=
 =?utf-8?B?QTE2S1d1U2o0RksvMVduSUdqL0dvcVpaNE96a3FJZ2FzSlFPRisyQ25GUnY4?=
 =?utf-8?B?Q2dBWGRNMVRMWFIzMjJhY2tnd3RRUDJRZ1NWV0dBYjF0cGNSTVovUWJ0T3d3?=
 =?utf-8?B?b1hkZDJLMDJSaUFMY0JnSDFBL3VTQnlRY05jZHpHQ2JOU0tFWW80L2RRNjV5?=
 =?utf-8?B?OXdUS204VlEvWHd6dHFFNWQxQ1dNNzNxamlhcHhxNExocXVMcEVHcXVLK01K?=
 =?utf-8?B?TDlyRkZtNEdXMjRQUkpQSTlzQ3hhOVBibFZEV1pvWU5MLzVoazVjdG1nRFRL?=
 =?utf-8?B?Y2pIOVU4Z3Z1NVhjR2w5dGc5N2dCajlYRG42UkhFZ0tvak1nY1FvOXRJN2o2?=
 =?utf-8?B?WGRMQ2oybk9BV2hid0VXTktDajlIczhNbFczekhEMTlUbGx4b0VIQkswSkRS?=
 =?utf-8?B?N2dQOVVpVzBick5MUm1BK1hZaG8zYVhmR010SFFOcVdtV0FBZkhIRktiTDlu?=
 =?utf-8?B?Q0FJSllITGFkdVJabkRPTENRa3oyQVVtZDMyN21zSVRjSzJwdzhsTWdDanZK?=
 =?utf-8?B?UlVXNTBWTzdiSzhHTFVNdFlyaXpGZW4wMktDK2hRa3RzODREckRnV1hLUFln?=
 =?utf-8?B?SlAvajBSMUovelIvc2Mxa0tMUExKTEdXL3VOOHBUaU9uYnRXL1FNUWJCZ3lq?=
 =?utf-8?B?em4zUnRtdm5kR2J4Y1ZVemJBWkVPVks5eW82dlN3TnpzMHJ6NzNaS1RsOEg0?=
 =?utf-8?B?bTB2VXM5RWxSZlpEUEZldXlGamtVYkdMY2c4eStESEpNbzNHbDZNUUpDdEsw?=
 =?utf-8?B?TXE5b3BjMzVHc3dwTzcxRkVZNVBoL2dxRGpVeGZYSzgxNG52Qi93Wi9haHlW?=
 =?utf-8?B?NkUwNEtrR3hzaStLNFJOVDVxMWJTZUxLK0ZaWEhrbk5Mb2MrSENwWDZuZHY2?=
 =?utf-8?B?cEZzVFdTT0JsbVllbWtjM2gzaUdTaEluajNtcm13eXdXOVhUNGIrd0x5Qmsr?=
 =?utf-8?B?SXNoN2NvdTNZVld0bi9jZHdheUM4YjBsOFRONkV6NnpjS0pPS2IrZ2toTDVK?=
 =?utf-8?B?Mm9oWk4wRWZxbUcwUmVDQWNCVUJUNWxJbjhYZWhjUHJBRHJkWUFxaVgwb1hl?=
 =?utf-8?B?OE5WeVlnS3lVRzZUREZGOHNqSVZiYTZVcUl4QWR6cktTamIvNU1vM2Z6WVg5?=
 =?utf-8?B?ZmhXSXRWeVRWd2dJNURBQW9GVWZmS3VNUjNuWSszbVB1bWtrTU5hRTNKYW1p?=
 =?utf-8?B?enVxRXNSdGJ0TkcxdGtsSmgzRlAxaXBMbmpsdlVkdENTUGVnUmJGZWNVaHFk?=
 =?utf-8?B?S2tXTzd0eVlxZXY3UmErc3A0V1E3TTFQaVNFeFYrQW15T1BvOGwzajV3b3JC?=
 =?utf-8?B?Y0JFbTV2Wkk2aTVQeXlIR3I3cGlGRytyRXJLemIzcW5ZS0N4a1drYUwzVnN0?=
 =?utf-8?Q?Nm/CzhHQK6cU2SCd+hhwuZHwJy31Gs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzZ1UkwzalJ3WmpGUE9aSHJJVXZJT1QyZ0pzaW1vKzRXaWIyTEQxdGYrSmRL?=
 =?utf-8?B?ZHZ2Y1ovbFZOMlh5ZGpLK1ltMm5GUzJ3d2UraGdsTGpnRkhTcDJtekpzeFZ3?=
 =?utf-8?B?Tm1wYWppM3pSUzlTL00vZ3NiWTB2SzZuT2VnN09BUzl3dmllRXZib1lVNVU2?=
 =?utf-8?B?L2tpVmt4bjlhbDFNd1M3RWptYiswYTlIaGFpNmJ4ekNON3BCSlBFRGIzOHJF?=
 =?utf-8?B?b2tYTnpRTzZ0emsva3k4Si9QQnpNUHUwNkZSN3RjdlJpdzc4Ni9pWlMyYlcy?=
 =?utf-8?B?UmwzYnBXcjhYcWZ5RjRWZWg4aUlQVFBncVVMVTB0RkFUQnNjN2NqeDgrdW0x?=
 =?utf-8?B?VmJJSjJMRUxaNGNHMXVLMWF0MjdhVEh2akIrS1NjeFpDUTRiRHlMZFYxdEdn?=
 =?utf-8?B?MHMwZUxTbXM0TEdLTVMzS0VLY29wM2xzQUhBQVBqZVdZQjlLRTMvY29IUGJo?=
 =?utf-8?B?M0RwUTZoSnZnOWo5RU4rMXBxaWhXZXFYaDdrSFREYjM4MVdGclNqbnJ5bFJZ?=
 =?utf-8?B?UXp0dkp4RXdCN2VFQmIybHc3bzFyVGJPWlZTTGZQUW1CWHAvM081YlVZbGhX?=
 =?utf-8?B?MU5aVUtDc2puSWdjSXVsenJIRHIyalpOSFF3TnM3Tk9jTmljYS9Wc0dHNS8y?=
 =?utf-8?B?ZFVyZkZPU29EdVlCK1U5Zi9rRmxOUHMzZ2lzRmQxWlV6WWcyOGUwZTFjanNo?=
 =?utf-8?B?dW5jbEFKQ0FtNjcwb1FuU2lINVhYL3g3Mkg5WFlOc3VlQmY0MDJTK0ludVcx?=
 =?utf-8?B?ZXpmcWtxMUxsWTJGeVZPL2lrNUUrTkZ2cXVmNCtTTytXdHF2NUZ6OHBZU3pj?=
 =?utf-8?B?K2ZFTU8wQUtNd3BiR2o4MHBncHY1UmxtbUZEeisyM0tMRlRlMm9XcVhhZTBH?=
 =?utf-8?B?R0pmWDVibkJ1NmVBNU80ZkloRUxJQmhuSGZlLzlpVjA0L3pLY1NXRXU3WFhs?=
 =?utf-8?B?cnNKZlN4VzcrOGVqWlY3UjBtSDRPdlFHZExXaG42dk0xOE1EWHlRVlhWT0k0?=
 =?utf-8?B?R0srMWlDOWhnTTJ3bjBpeGNTOG5FekJOM0x2RllWR1FsODh4YjVkbXZIeVNN?=
 =?utf-8?B?dS9mYnpLbkRCZGpESUYzNWN4Z2t1OWVkUXVFVUlidER3Yk5HNTZOZDEwbmtF?=
 =?utf-8?B?VHhUajhSQURVWkJxVkROT1V3VkQ3SDNsNlM2V1hFMnVpZUFPZ3U1c2RkT202?=
 =?utf-8?B?NW1jazgzaXVIS2hlY0k1eVB3b1ZqVlVPZUZoNkMrWVlJRDZQSWZveEVvUWhH?=
 =?utf-8?B?NDFLUEJJYTBsa0RlcENnUmdyM3lwbm1mVnR6eWpaaU0rbEs1QXpEMmJNTWNx?=
 =?utf-8?B?REltQUI2OTdmLzQzVUg1dE1LTzRTZ012N3RvVHJEMU04ampFWCtlSWdUZWZO?=
 =?utf-8?B?dVFRaHVTUVFrOFJPU29EZHI1Y242d2wxTkxtbmJiU01nVjNmR2h0QXA3R3Fa?=
 =?utf-8?B?U0hBY0pmSjBHWEx6VmZ3eFA3VzArbEJmODk1d2xEU0NMNXZVelFBK0NOdUhQ?=
 =?utf-8?B?TUtrTVhVdFVsUFN3b0JHamh1VE9oZytmZlFyUXZZL05aNlRrckRYc2xJVXFi?=
 =?utf-8?B?VCtSR1BqRUIzSHNSVzBpOWJGVGh0YXJpeVNhcjJkb0VxVGluTERUTUQ2d0dR?=
 =?utf-8?B?THl1Y0NQTjNSSHRvN2FKZ0c1ZEZjRXpSVVdXcXVIdmZaeEtRc214UmluYXRK?=
 =?utf-8?B?ZXMwbXBFZGVFSzd4QTlvRWZOUk5ZeVpYbWwyZDFOaTJ2bGVwNXRYL2RYSEtY?=
 =?utf-8?B?Vk8zLzBiVjMyNTQrTXM2TUtYbWlmVXUvY3NmOFI1Q2h0YzhiNmJHRlRrRWdZ?=
 =?utf-8?B?anFwSjFnSzE2ZFRMVkp3M2JXaHlQNDhUM1pyS2c5QXYzTFdvaUN4VHlmcFJ4?=
 =?utf-8?B?TS9rOXhlWDhtR0RvN1VVd3k5a2E5RmQwMzBXQ2djZ2ZucFcySkYzbnh0TlU0?=
 =?utf-8?B?VGE4bm5ka3BGRUdRU1VMOXU3aW1hdVg1L3Fya3FlSmR4UDNOUWk1WDFLc2tZ?=
 =?utf-8?B?WDA2a2hMMlhUNHJvV3B6bEFwMWdXZGozRDJvbXFpWDlKWFpjaTRBRk5lZC8v?=
 =?utf-8?B?bGRBL3B5eEkzN2NrTjczbDFCYXhSdmtHQ1p3OGM1TFFkcG1mT2lvRG4weTRE?=
 =?utf-8?B?a3JMaHpQbGVpdXB6Z09RTm5JTVI5bFk3dnkvbUF6L0I2eHRXeWRwSG5xWkV4?=
 =?utf-8?Q?2CIGouLld7h3P5SEEmBOuDE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <63993D4594754B4D83A21B280931F144@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b637c82-8edb-4e51-c0b8-08dd7ea56d45
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Apr 2025 18:18:32.4112
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V5t98m4v2RiqEju+QyrmcTtxcWdQNbjz81AVTkvdcrpH2/GcrooVYjwskbRaIyg7PjqvM6U0SHeMaVPXbQx1xblISuQreb3VXx1z9U5j5C0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4711
X-OriginatorOrg: intel.com

T24gRnJpLCAyMDI1LTA0LTE4IGF0IDA4OjU2IC0wNzAwLCBEYXZlIEhhbnNlbiB3cm90ZToNCj4g
Kw0KPiArCWlmIChJU19FTkFCTEVEKENPTkZJR19YODZfNjQpKQ0KPiArCQlyZXR1cm47DQoNCk5p
dCB0byB0aHJvdyBhd2F5IGlmIHlvdSBkb24ndCBsaWtlIGl0LCBidXQgdGhlIGJlbG93IGNvZGUg
dGhlIGNvbmRpdGlvbmFsIGlzDQphYm91dCBzcGVjaWFsIDMyIGJpdCByZXF1aXJlbWVudHMsIG5v
dCwgbm90IGJlaW5nIDY0IGJpdC4gU28gSSdkIGhhdmUgZG9uZToNCg0KCWlmICghSVNfRU5BQkxF
RChDT05GSUdfWDg2XzMyKSkNCgkJcmV0dXJuOw0KDQpQcm9iYWJseSBhbnlvbmUgcmVhZGluZyB0
aGlzIGlzIGdvaW5nIHRvIGtub3cgQ09ORklHX1g4Nl82NCBhbmQgQ09ORklHX1g4Nl8zMg0KYXJl
IGV4Y2x1c2l2ZSwgYW5kIHRoZXJlIGFyZSBvbmx5IHR3byBvcHRpb25zLiBCdXQgdG8gbWUgdGhl
IGNoZWNrIGlzIGEgdGlueSBiaXQNCmhhcmRlciB0byByZWFkIHRoaXMgd2F5LiBJbiBlaXRoZXIg
Y2FzZToNCg0KUmV2aWV3ZWQtYnk6IFJpY2sgRWRnZWNvbWJlIDxyaWNrLnAuZWRnZWNvbWJlQGlu
dGVsLmNvbT4NCg0KPiArDQo+ICsJLyoNCj4gKwkgKiAzMi1iaXQgbW1fc3RydWN0cyBkb24ndCBz
aGFyZSBrZXJuZWwgUE1EIHBhZ2VzLg0KPiArCSAqIFByb3BhZ2F0ZSB0aGUgY2hhbmdlIHRvIGVh
Y2ggcmVsZXZhbnQgUE1EIGVudHJ5Og0KPiArCSAqLw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnko
cGFnZSwgJnBnZF9saXN0LCBscnUpIHsNCj4gKwkJcGdkX3QgKnBnZDsNCj4gKwkJcDRkX3QgKnA0
ZDsNCj4gKwkJcHVkX3QgKnB1ZDsNCj4gKwkJcG1kX3QgKnBtZDsNCj4gKw0KPiArCQlwZ2QgPSAo
cGdkX3QgKilwYWdlX2FkZHJlc3MocGFnZSkgKyBwZ2RfaW5kZXgoYWRkcmVzcyk7DQo+ICsJCXA0
ZCA9IHA0ZF9vZmZzZXQocGdkLCBhZGRyZXNzKTsNCj4gKwkJcHVkID0gcHVkX29mZnNldChwNGQs
IGFkZHJlc3MpOw0KPiArCQlwbWQgPSBwbWRfb2Zmc2V0KHB1ZCwgYWRkcmVzcyk7DQo+ICsJCXNl
dF9wdGVfYXRvbWljKChwdGVfdCAqKXBtZCwgcHRlKTsNCj4gwqAJfQ0KDQo=
