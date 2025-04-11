Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F181123A9AE;
	Fri, 11 Apr 2025 21:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405294; cv=fail; b=csLmnMau7Y2qpkk34c0V0alLP8ZrHu2cPU4Vgdcrk+SNmY2P0G8CywXEX1hP6KO5Eay6WHBnpX+6fg87OpU9BIITB0Y+Momc3wpg8URD3lIr68iZNPGG2d1ioR/qEGvQfbfYd76iRzuDhDrDP+mojarmsMEqZ21toNdvEEkk/dk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405294; c=relaxed/simple;
	bh=cYa9FHGHOVnhQ7pnfj50jjR+3tIw0qPHYSQO7QuNcYw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bvgBCJKxU8k1Eymn5axsmb1EQkqDmk6Y0ngAjV8xQW4AiLvuU6a5w3Rh/AscloutiOwcTuWqIbw9h9MPK3FEorN0adVO/FyP0m7bl/ZJwhMdbbwzkjwHKHabKqpA1DpxTTYYiHCOlJnkNv9ixKUdWquNnLbDS/JLcTJ3VSesS3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wz2SWbmV; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wz2SWbmV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405293; x=1775941293;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=cYa9FHGHOVnhQ7pnfj50jjR+3tIw0qPHYSQO7QuNcYw=;
  b=Wz2SWbmVGRVbSHLVznDoAyDPaUGA2PB7wQnN8bc2cXk6inNf03xoGWPW
   big8GA1rHjoLbifeothQGG3lNIUvqyTBfYcqvB68h3jcvjSIMlAnBXYDL
   +kMZnoCeWjmZNJbizDMvi2PH+DywPbsfSezQsetFgUz7cRON4DlT1Yr0I
   UVJ/qQbJVBw23Wx4nxxqSogp1YaFzFKJUOtM16LF9MGhP6jyp53sTeLeF
   7dtYvXPV67siAtbkXHGdcJuFDAUgRTfeECvBdjQ39y3QTq42piGkkhR0a
   pQkOJ25crmmtSKFD6OlmyAJSdhB1O+fa6X+m+r7vN8OGI9N/Mx+eQujWu
   Q==;
X-CSE-ConnectionGUID: Kt4uICtPQUSINxEen3QC2w==
X-CSE-MsgGUID: x40FzTqnRmiz96NVCP6JjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="49619622"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="49619622"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:01:32 -0700
X-CSE-ConnectionGUID: eGsBsp+NQKSBDAakNGOsvQ==
X-CSE-MsgGUID: XCK3mcLDQ+WVL7b0rXdflg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="134044590"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:01:30 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:01:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:01:29 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:01:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6/BxHRa2sqwYCU3xNu/pnvPgSY6iddvqURZFU/52CB37jIa5vb4hYjCzw1kH62uULPMnf3L52VkcxhTIA+H3rTTIokN84CfzhTv3MyGpo15oe7n8kHgcFmLwWg98nPHGEtUpXbAJfF2/zDuN/Qi8OeiU+WWmSxHnwnhUzHXryhsVS9XkJyyl283ERKc7oOosTNm2S1a3RMRIvYJJVFfdAVdJGWdhAUK2Pc1yUugD5jEQtXPIMh4zsZJRPEeKdNW9ZAfryjirSZpT7ORaVtyKWKdokj3wOQZ4QSHA2vS9I+YMRnm7n+iIJ/QeWYw2HbtSnXzhlkeYOEE4d5LT26sIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bflD/y0CbaAfqIkWo8+Seg61Oc+hOva+1UIAuRA5zXE=;
 b=bN2KYNtaQliJU5NXpoGVCUPcOcgaNa3sLsm8w+xt/eYjftolNLw/mKFF6FGpep2MazcNlxyHtZ8WFa+w03bhXdcV6rlc6vzDGNDaVyka05/jBdP82vBzFByUhr7Q1PSADJLPmStFC2OdBdqQ5Kjn2gDfqe9YUtY/7aeHJoZFiJ+kax7xfDDq2d1UDUCuuyPig4qYodLpw8cvALR60gAFc7KN4SHQjLP6RF5mwsYDmhQrdfupc7c1B9Yb1BdyeK3qGE4fjYIUW8kh5ivyCJT1EhfKg9HqGQRadgEf+c3r7+zB1M5ZzlaAC1YYENSBDUbx4Z8PTV19K0actSxIqXj64Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by PH7PR11MB8550.namprd11.prod.outlook.com (2603:10b6:510:30c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 21:01:07 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:01:07 +0000
Message-ID: <c149c6f9-cb72-4737-b4e3-34ee990fdc9f@intel.com>
Date: Fri, 11 Apr 2025 14:01:02 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 09/26] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <paulmck@kernel.org>, <akpm@linux-foundation.org>,
	<thuth@redhat.com>, <rostedt@goodmis.org>, <ardb@kernel.org>,
	<gregkh@linuxfoundation.org>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <alexandre.chartre@oracle.com>,
	<pawan.kumar.gupta@linux.intel.com>, <thomas.lendacky@amd.com>,
	<perry.yuan@amd.com>, <seanjc@google.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>, <xin3.li@intel.com>,
	<ebiggers@google.com>, <xin@zytor.com>, <sohil.mehta@intel.com>,
	<andrew.cooper3@citrix.com>, <mario.limonciello@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>
References: <cover.1743725907.git.babu.moger@amd.com>
 <e27c71eddda5884e9dd3bbf28c53be8a5b78f62c.1743725907.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e27c71eddda5884e9dd3bbf28c53be8a5b78f62c.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0250.namprd03.prod.outlook.com
 (2603:10b6:303:b4::15) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|PH7PR11MB8550:EE_
X-MS-Office365-Filtering-Correlation-Id: 39336a4c-422a-4790-9862-08dd793bfab0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QW9mcFhOemhSSzhtRzBuZ3E0STJxL0QyZWNkdUNIRTNrVW9DT1loQzRjMVJS?=
 =?utf-8?B?aWo0QU0ybWIwWkE4NFNKWmhjOU45QWxVVHl0ZnJEN3Q5UkJpWXptelkvU0tN?=
 =?utf-8?B?Y2RNMVJCUTVuTHIzSjNnZ3FsamtKT0NPN3RTTmVPWkhVUnl2dTNwVnpydVZ0?=
 =?utf-8?B?ZFBCUVpsQ092YlJzUXBob0ZmWVpBUTRRMUg5VmdibktpNDRrYUF4R0dzOTRT?=
 =?utf-8?B?TVlheCsvb2F0K0tuSUpwa3ZNRm0yYmViQ0lVb1FIZ3pRVFdBQUJ1MVBqVWZC?=
 =?utf-8?B?TWxvMWRQTDh6dk9KMDhLcitMK1ZqK1N6UHcvekxxWjFtbHJMNnJSSllRN1hJ?=
 =?utf-8?B?K005V0ZGcW5FRnJIa090b2l3ZC85MUF3dkQ5Y0pHSGpqcmxYNkhsOVZiSDVD?=
 =?utf-8?B?Yk95ZW9zbVlzbnd4OUgvdDFXakhXMEFIS0s5OUlvRXc1dEhuSHB1K1NoRjRM?=
 =?utf-8?B?V0d6UXJubTdPUXU2MUpkdHdIYzdHeEZvakZ1d2ZjTUVZYTdMQm9nM3l2NlhN?=
 =?utf-8?B?TC9YMm11ODQvUWdSNmhLa25oeDJ4cDEyR0hJSW0vajk1Ujk3bElnTVVYUWFt?=
 =?utf-8?B?R3hpYjhaUDQwK1VSMUlkMm9zM2JJRXYrTE8zZHdGVUxjcTVDTFZzNnhLVXg3?=
 =?utf-8?B?ZkEvdE9tZTFrUDNmVE5YWThibWgvdU8wbHdXcWlKTCtLcWViUTFzSXBabE9U?=
 =?utf-8?B?SHo5V2t0NWJXMEJFRFQ4UUNiZEVPZ1cwL2hZVXZmcDgvd21pcmdvaFVOeWQz?=
 =?utf-8?B?NXcxYmFjdEJYWHVrN3JNalZHYkpBT3NUdjZpQ0JUZExBTU1GdXF1dWt6UjJa?=
 =?utf-8?B?bHpPZHZZVUZselB5RWt4WS9JNUVGa0tXUkFxOVVkcXFvV0p4TW5tdXFNVm5T?=
 =?utf-8?B?dTJqa0ZlUWIrNjRrZ2NtK1B4YU84aWVEOFh2OWROU0U5Z3lDZmRTdFQ0U2ps?=
 =?utf-8?B?TGlVMkN4Z2xaQ21tR3Q2Y3dRL3FIRXo4cTlNNnJ3RUhMaXhLbnMwQ2hIbnFS?=
 =?utf-8?B?Q0FwbXJqKy9IdHh1c1VjRkdxY1VwTVpvSHAxbXVKbHIyV0NFbGVlQ09NOUEr?=
 =?utf-8?B?VnBobk9idkFnQmxQcWpKNjVxMVRuSmp4WDVQVmNMSHBacjBpeXliU2U1TG5G?=
 =?utf-8?B?ZmxuT0N4MTc3b05RR0d4eFh4bW1ETjdQdnVwdFVMbkJtNTZWS1dzL29iN3pH?=
 =?utf-8?B?Um53YlUxdVdQZFVQTUZnbEJDUVRDUGlVY2VwQ3licWFYakVBbUNrQU50azF4?=
 =?utf-8?B?cW01MGVPUG1sd1AxWjJMQ2pOWUx1Y3I0QUJMTEhRUDJuUFVKVVFOSjFKdjYv?=
 =?utf-8?B?VFV5dVZ3cEd5UllDU1h3SXdkcHFPMS80bFBWT282eU1qOHNFNFpSVm1Ocytj?=
 =?utf-8?B?dkhRMTViaFRRcm9yMEFlYWhaemF5ZkNxYW1PSzNxYTBtYi9wMDU3MmhmcmR5?=
 =?utf-8?B?dlZzOW4rdmxXYU44cTh1KzNqRU9uOGo4OHh2L3I1WURPMFdva2I5eG91eSs5?=
 =?utf-8?B?cXpmRHc1VTRLWXJVWXZ1b3E1L0tYb3JFZGJpMlNlcXlSUXBGM3FUM1VmN0Zr?=
 =?utf-8?B?WnV4VHlYRDE0VVgwd2RzaFlNcGYybnZObzVnbHlERlN4Yno5RzJoYWs0Tmcr?=
 =?utf-8?B?UmZ4a0FnUkZiS09UU254aVdrS2c1cmZRamgwY0d5Mm1MMFNQWWlkNGZCUU5U?=
 =?utf-8?B?UVJoeVlXaGtoSVRyVEVFUXI2VnBaRE4zU2I5NTNMS3VrNHJ1b2ROS1dvRmxh?=
 =?utf-8?B?NStia3JKOGlDSWhWQnJWVktSdHcwY3kwM09VTkMveW9Zc0ZOU2x5OEZqM24y?=
 =?utf-8?B?OFNiR2N3dTkzdHB2ZFFLQlduU3krK1VwZXUySWxodnpjUFRBNlQ0b21qbWJp?=
 =?utf-8?B?Rm84UlRIK0NETGI4M05ackhnWUQvOFRpcjR1ei85ck5Pd0JQc2JXZUhkUmZv?=
 =?utf-8?Q?92Bh0SZZbak=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U3pna2pkdUJES0dad0VRK29pNjJQMWNtMFVmVWN3SGQ1a1BOMHl5ayt3dWww?=
 =?utf-8?B?OUFTK25uQkxmdTNQWmVIemU2KzNzU2hIeUV6YzY5eUcyUGZkM1I5dGgvVWpU?=
 =?utf-8?B?dm5DR1pQeTFVa1NMaEwzVzBkZjBhMXBaekV6NW1DNVE5MEdxbjFVTGh6VWRk?=
 =?utf-8?B?NmYwYWR0ZThtUTlTZFJ5N1BFaTVLZTJ1anBYbjIzWUpndkl5ajhBOWl5a3Vx?=
 =?utf-8?B?Tm12RG9CUzJvdi9BSnJPYnhFVTJ0R2dzbHRWVXJJc2xPVzAyZDVWTE4vU2dS?=
 =?utf-8?B?OFpaVEYzOTBtV21RbjMzZm4vM0N5czFrUW1JMC8ydWllYWYyYU5LNFBLMkQx?=
 =?utf-8?B?ZDZtUXNoUW15OGpwdVE4U29qUkUra3p3eGlyZkpWNGtMaWkwa2IvWDNDc0FZ?=
 =?utf-8?B?TlFRWmJraHRwY24zbjZ1a0xMRGl1NjV1RDhMRkorR3E0clJiV0ppZXlUN1d0?=
 =?utf-8?B?ZGdXMWpodUZXTUZPaFN2MUZQcThucmhtY01HaVQ1RW1KZmZQWUNJbUx4MnJP?=
 =?utf-8?B?M1k4UEkweUVnV2cvVVQ2YzlrK3grY1ljYkZBWE4xRFNrM0xlR1BYRmJXUkxK?=
 =?utf-8?B?TXA4Y0RpQllNUUUzbFFtWU1GMEdpeEgwTGd5MnczTnIzRGMwcGZSUVoxd2do?=
 =?utf-8?B?Q3FkTG9xYTBhcE1xcW9LSWFPcGNWelo2Q2NSWWNzQXZ1SytCc3hFZ0RHTXJZ?=
 =?utf-8?B?a3BBWWkwSWdHdXowYVdobDYvMEZnYXRWbVdNNGd2L1BWRmhSQTZONnBIdGlr?=
 =?utf-8?B?TEtpS1lTTitSVXFQdXFkS05nNzNCTmFhVnl0N240SkI2Q0lwN1BhYVQ3L1NC?=
 =?utf-8?B?enduRFVzVmxNcWxVOGdHVk40QlhNY3lBSmpCYzQzRUVPcG9LTTRUYWNxcjZz?=
 =?utf-8?B?M2pmNTc3bVdFM05vL1g3R3VMV1FYeHAzVUo4ekoyNlZLMU4vdG1rdE9Qbk1n?=
 =?utf-8?B?NXVETXFuU0FPR0YwSHR1WDNVWU1qSzhla0FSVHNCZ1Uvd0FmSUhIWjNudHR6?=
 =?utf-8?B?WWRabHd3RTVPUDV6d0hCbERPTkpFMXVkaDVJNGVTL1ErTlMvYi9TNUZQT1dN?=
 =?utf-8?B?UVNObTNxdVVoNldtRy9jeThvcnk2MXdaaXQvMUlmRU9Rc0hLMDJpeW11am8y?=
 =?utf-8?B?bEpUMC9uaHJkZUpqcHc5TWlTemFVV1lxVUErakNEMytrYmRNTSt3TEpNQ1pp?=
 =?utf-8?B?Qld0YXdjU1phVFFNSExKRlBSMzJVMkhlN05sNUlpVFlnYkNmUzVuMnVHSVBr?=
 =?utf-8?B?b0NGaWQwRkszT0ZocEVOK1NGVy9IdU5Wa3N3aTY4NUFUN1BwanlzZ1dsbk9j?=
 =?utf-8?B?TkcyanBUblo3OXc4SWhFaVVKMThuRTV3SDFTaCtQQXRIZkNDZlQzcDFjeThw?=
 =?utf-8?B?bVlpNFFxV2RmYVJWaUtHemoza09FZWdIT203czZmUHlmVDltaUFaUXNuY3JZ?=
 =?utf-8?B?dlJYbmpvTFd4MGxON3hvVU9UeUZKeHVqL3crK2o2UXQ0Wml4cGozWmxPQmRr?=
 =?utf-8?B?SkowNUUwUDN1VFpGSkRPK2xoWEQ4WE5YUjBzMzJwR0xnejZucnI3c2tybWNj?=
 =?utf-8?B?NzVCZ0hPMXlaVDBkQ3lYZDNNWVV0cVJwa3VBNGh4eGRHK2cveTlVWEpNQnRY?=
 =?utf-8?B?L1ZIN0ZmVHFiT3lWOEdXNVhYYWpiZFR2S3BWNVFEcWRWQ25aSjZTcnovVnAr?=
 =?utf-8?B?TFZmUXhjZUc5SUl3b2JUenZQMjhqMG4yUkxSaittbDN1bVlxOWR4WEZwZk5Y?=
 =?utf-8?B?QnlkN3BtUW05b3RQN3ZCNVhKOVNmeVE2aTBya1I3MllLRGhUSTlWcmw1VXFq?=
 =?utf-8?B?bDRFZHVTbCtQQVk2RDNzV0NBK0tlV3BqQXZqTWhZeFJ3OStTTzBmV1FQS2xT?=
 =?utf-8?B?Y0haSW9vYzRtblpHSUJXSDU5bWgrZlp2WlI5bXhTVzYydXhBZlZzaTM2aWhU?=
 =?utf-8?B?VHdQZkgrazRhM0ZNQmh0dWoyRlNwYlBXOWxnN2JEZG83elViSDZCTWdMcnh2?=
 =?utf-8?B?VG5vdmtxUEJ2amo2eWlMaDR4TnkrWkVpU3BIcnJRLzBMV2xiV2VBaENJZVB3?=
 =?utf-8?B?amtSd2JnclBiVC9zMEplMHVKbG4yRVduYURUbXdqcUpaZUNFa1REMXRPTEMy?=
 =?utf-8?B?N1FtenNLVVFaR0hTTFRlNmJmckVCeG5Sdk01R250VldXTjRiUndvREdORnBO?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39336a4c-422a-4790-9862-08dd793bfab0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:01:07.4646
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /BtZluWKCAjr9wfIFgjanv2rbvAmiJ39+aqpwTuH56x7HlP/XpE2ysG7pDBAds04FIOq6pZwuEkTPxlfINICWjx3i/6E8myW599L8hVYmyg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8550
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The mbm_cntr_assign mode provides an option to the user to assign a
> counter to an RMID, event pair and monitor the bandwidth as long as
> the counter is assigned. Number of assignments depend on number of
> monitoring counters available.
> 
> Provide the interface to display the number of monitoring counters

An interface can also be a function. To help make this work obvious
it can be specific:

	Create 'num_mbm_cntrs' resctrl file that displays the number of
	monitoring counters supported in each domain. 'num_mbm_cntrs'
	is only visible to user space when the system supports
	mbm_cntr_assign mode.

> supported in each domain. The resctrl file 'num_mbm_cntrs' is visible
> to user space when the system supports mbm_cntr_assign mode.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  Documentation/arch/x86/resctrl.rst     | 11 ++++++++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  |  3 +++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 30 ++++++++++++++++++++++++++
>  3 files changed, 44 insertions(+)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index bb96b44019fe..35d908befdfb 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -284,6 +284,17 @@ with the following files:
>  	misleading values or display "Unavailable" if no counter is assigned
>  	to the event.
>  
> +"num_mbm_cntrs":
> +	The maximum number of monitoring counters (total of available and assigned
> +	counters) in each domain when the system supports mbm_cntr_assign mode.
> +
> +	For example, on a system with maximum of 32 memory bandwidth monitoring
> +	counters in each of its L3 domains:
> +	::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs
> +	  0=32;1=32
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 6ed7e51d3fdb..028b49878ad0 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1234,6 +1234,9 @@ int __init resctrl_mon_resource_init(void)
>  	else if (resctrl_arch_is_mbm_total_enabled())
>  		mba_mbps_default_event = QOS_L3_MBM_TOTAL_EVENT_ID;
>  
> +	if (r->mon.mbm_cntr_assignable)
> +		resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);

Missing RFTYPE_RES_CACHE?

> +
>  	return 0;
>  }
>  
> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 626be6becca7..0c9d7a702b93 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -912,6 +912,30 @@ static int resctrl_mbm_assign_mode_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> +static int resctrl_num_mbm_cntrs_show(struct kernfs_open_file *of,
> +				      struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = of->kn->parent->priv;
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +		if (sep)
> +			seq_puts(s, ";");

seq_putc() can be used.

> +
> +		seq_printf(s, "%d=%d", dom->hdr.id, r->mon.num_mbm_cntrs);
> +		sep = true;
> +	}
> +	seq_puts(s, "\n");

seq_putc() can be used.

> +
> +	mutex_unlock(&rdtgroup_mutex);
> +	cpus_read_unlock();
> +	return 0;
> +}
> +
>  #ifdef CONFIG_PROC_CPU_RESCTRL
>  
>  /*
> @@ -1945,6 +1969,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= resctrl_mbm_assign_mode_show,
>  		.fflags		= RFTYPE_MON_INFO,
>  	},
> +	{
> +		.name		= "num_mbm_cntrs",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= resctrl_num_mbm_cntrs_show,
> +	},
>  	{
>  		.name		= "cpus",
>  		.mode		= 0644,

Reinette
