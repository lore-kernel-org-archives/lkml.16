Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F7A224B1E;
	Fri, 23 May 2025 04:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747975403; cv=fail; b=lZErfDF9+FSmGUEbtlXoCtSOmO905N2jhFBuhAhXS4khgWkE/3ULQXY2oXZMsiDON5bKQQaeYIxMyglNDIxDPS6yoGt+ImJrJt1meEPjgUhEypEpnpITKIG/VYarwy0ZaOo0C7kf1rw7fMbj/XlwF8qhGuNCmAYnx7NLIkUy9Os=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747975403; c=relaxed/simple;
	bh=fqjEzpXV1zVAqnj5fS4POAqy+PEPq9Owq7b/7psL0ko=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HUKkCL6W3G9LfML3hbT3qcazugkPP+wP7AMGIYEXCTorRBZ//8v54KygjfIoLMQILthFe4G9HKKrTENz7EmhO4nQgBx1/oKOMnBmU7fMydIsQMQcxrEvwC4L/D0md7lDFx2XiYnnQCbZewdGFfa7tKwmXmJT/eDvoGx8XUc7dyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RQmQPG0O; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RQmQPG0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747975402; x=1779511402;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fqjEzpXV1zVAqnj5fS4POAqy+PEPq9Owq7b/7psL0ko=;
  b=RQmQPG0OHSyki180ruX1rAhTf9sffF/AIaUg7C53tjtrCC75yBgMrYMQ
   /4hNNPtmoJKlW+V5RuDHQwPPIJNL2tOKS30G2cec0pWC8sdkZLgZk2gyP
   /VHpDAoPRFvMMWNlnmokSjQ1MyK4JRtenvdjXZwIbmd/Za73zD9MrAN8t
   Dmv6YqwMXyrRk6TRp0igtMXnKrevn6D7cpqO3VnJ+XGPf4ZGnHD2qDjl2
   FoAZNmxQYy50rkTEqsutieMXOXfWwR0Fq07ul0AnCMowUFrx7k5lxBAV3
   cUG+VUYWEg1cx+s8YLYiAfqrRisEDXyP+Xr3/FKw5oVpyAqjg8YiAqaG0
   g==;
X-CSE-ConnectionGUID: Wltl2739QBKAevyK3M1N9w==
X-CSE-MsgGUID: 4+rr4l/+SJWxmsvbRo+Fpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49728035"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="49728035"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:43:21 -0700
X-CSE-ConnectionGUID: I7XuGBH7TNyH7ouiLF58HA==
X-CSE-MsgGUID: iqcoPielTqysSB4/vQhgjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="178088523"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 21:43:20 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 21:43:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 21:43:19 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.79)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 21:43:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJTAUeRzhLz3Ok17ouRg3HfBOTihURR34B2TRa/KD+Vm6oflRvX8p2kb4tv1Mym799IcSJUFhC2XaArm3y14gD5oFZsuLKmrpUL9vfFsXb3GnJoZiwgskdTNAjknHUVQlPj3zyjyxQrGv+AxgbUgkZrBlplCa/9AC/XIC6THvSLVr3vhP9c5mohh9bsXi/3lJwNNviLAzZiuoSauFUThyRWFwjKapP3o2VKFPfhqFdWdgj4eWMWZmHFssadXySGf8oFuD1r4Ye4eNoaXa2/zm/TMSd546c7YQ1pEw0b7PjnIU4UZyGgJmpArgNoASKQI0IIErk3GElm/h9TE4mQMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=POnMUssqAysdCJFuDk5y3Yok6hXDGv4P5ec4VAmccWE=;
 b=p9JQzXE0bQ9kTRBkVGMM1SeDJlJBowY0mYpioTfKtX7MvZfwsHH7Nd6VRdWoc3pg0TnJ99pfr4wEQ5IISsnF3JJh8UiBR0Loa1Rg5yGR1xnDhDxU8VfLCLFBkYL99BUZqhVPvCShLdBfbA5tm69VuQghP4mw/Kpv46On5/9A+3n7w2hO6ExRw+9j/duVhffmpoarQKWDNYN5i4Y78sdHtNfTRhq7rNbasXJmckCjFoHGdYQZRgHEFaMkC6PI1g8lOe4x1J4euw/JSA0abLK557g2HQ94IjJwkEa21+tdjYyu0ZTJ8+/bJrVvmdYD+3/ceijN5Ssrkz4la1547RiGsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV8PR11MB8582.namprd11.prod.outlook.com (2603:10b6:408:1f7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 04:43:16 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Fri, 23 May 2025
 04:43:16 +0000
Message-ID: <d3105a62-e5e3-4f38-884b-5130fde38d83@intel.com>
Date: Thu, 22 May 2025 21:43:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 19/27] x86/resctrl: Add event configuration directory
 under info/L3_MON/
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<alexandre.chartre@oracle.com>, <pawan.kumar.gupta@linux.intel.com>,
	<thomas.lendacky@amd.com>, <perry.yuan@amd.com>, <seanjc@google.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <kan.liang@linux.intel.com>,
	<xin3.li@intel.com>, <ebiggers@google.com>, <xin@zytor.com>,
	<sohil.mehta@intel.com>, <andrew.cooper3@citrix.com>,
	<mario.limonciello@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <peternewman@google.com>,
	<maciej.wieczor-retman@intel.com>, <eranian@google.com>,
	<Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <3e7ae289622f9ff019604f2e7b78de33924c2a65.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3e7ae289622f9ff019604f2e7b78de33924c2a65.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV8PR11MB8582:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bafa2eb-0c71-4ab1-8043-08dd99b4552e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZVlnVkdzM25MR25wclMyOEgzWkNKSWt4R2NXRFpWNUE2R2xWVkNUNm1PVHJa?=
 =?utf-8?B?QVd5M29rdUhHeGxOa2ZweGlKR0tnQ1p2bEt0amxFa2l4Y1hPaEVEaURKd1A3?=
 =?utf-8?B?dFVyZGUyM1ZsYi94aU1NNENwUTFJRjRYc1lEM25nOUNPd1QxNURUcTVjMkk0?=
 =?utf-8?B?KzZ5YXBBcFVaNmd3clBPdDNkNmRBTEQ4UTcvVGlZNlFnbTR4SWUyZ0psSlZR?=
 =?utf-8?B?R3R4VDdpajZXeWZhbzEweVJNMUIrSFhLVUN6akxFLzc0SWsySnloUnlOTHZO?=
 =?utf-8?B?cmlKSjF1MFgzRUlDTlExaW5zeTBxZXFkUWJzMnBCcGlwWEoxT2cyR292cEJq?=
 =?utf-8?B?b0VJTFl2N3lCVHdzQnJIbW5ONElZM1FLanRwZHZEN0hxUGFnZzJIcWdEQjVK?=
 =?utf-8?B?QTlRTHBPSlhYdDlsa0lOejk0UjRoNjlkbUxtak9EZWpBUE5YYkx4dWQ0cGJ4?=
 =?utf-8?B?TTAvd3ZlTkZCcWhCNmxUZmdKcDUyUHJQWkpYNzFOSFRLenJFR0dPQUN2Rzdk?=
 =?utf-8?B?Sks4UGVSTXpxelVzekI4bXVNN3hXc2NCNDYxYVpueDVaOVpndG84V2NjckJj?=
 =?utf-8?B?NWF6MnFJRGZpSlFoWWZBTGRVUFBrSkROZzdrN0t6ZGw4UVcwVGF3YXBvVkJG?=
 =?utf-8?B?dmc2T1NTMlRISEd2a1hoRDRGbDA2anFpMm54YVJrQmx2NDFqalRyRjFvOFhw?=
 =?utf-8?B?T2NlWnQ4UVladmJxVU5kRHNhMTRTNUl5OTFrVHArQTVMaFptb21vVGwwd2dW?=
 =?utf-8?B?T2Q0YSs1cDBPZERvN0dRakFtdHdmZ2ptU3o2akZJZkFoTjVFdE5kZlR3dlUx?=
 =?utf-8?B?MFErMkl3VWFwU1RQRzFEcHZUM1hIVGREM0hRNENDRmg5YlFsMjl0allhaExr?=
 =?utf-8?B?dG5WVDBibGFHRHpQTHRxMllKc0Q0TnI4elMrU0EyMHd2U0JwUk9KWnRpNTVK?=
 =?utf-8?B?ZDZPeVhwdWxxbytMZnppNUc0aThKWGFxc2J5ZjFVWDdRQlRsUUZHZkFhRFVD?=
 =?utf-8?B?MVEwdExVcUM4WVdEQVQxYUgzS3VmYmpYUW1QaWc0N3Fxb3BVY2ZkSmtmVEZt?=
 =?utf-8?B?ZFV2Z1FiemNHZWlYeExZSlliR0xWeXZBb3hlcnFDcFVHMzRzRjc1bGU4cjcy?=
 =?utf-8?B?dnFQSVY1cGd4U3c0cWpiWjR3Qm11VUpiMHhXaUtSY1RKSEVPOFAva3Zvb0Ri?=
 =?utf-8?B?cS9rQnpQNU9PblNidk1qSTl6S3NmdEpWcmZRb3NKSjJOelJYMnRZWWxxOTNF?=
 =?utf-8?B?aUFPK3FwRGRRejlLOCtqL3NVSURnMVc1N2F5NnFRYnVDZk5yT0diTklDUkkv?=
 =?utf-8?B?WWp4SjFhaUxwcXpEZFBnOUdESDkyb0R5eVZHNGE1cStLTDJDU0YvR2V0Szgv?=
 =?utf-8?B?YmdiREhJRmQ5NWVnNFlzWFNXcXdtVTVOSDdydGIxalRyejMwTm5YUWlmNGNL?=
 =?utf-8?B?KzkzTVFjN2VYbUMycU1Cdkp1dFlrU2xKNXhMV2hvZ1dLN0VPeFVHNzFHZUdi?=
 =?utf-8?B?M0MrN1E3QmgrZnhzcFh2dmlpWjNQcDExNUt5V1dkSVFUa2srSFNUak1CeElw?=
 =?utf-8?B?Rm5pdTdndFgzbkdaMWRBeWdoVzVtMlBSVE1BSFRZYWpoNG5uVDY1cTUyQXl3?=
 =?utf-8?B?dzVpU3BzcEVLT2V4dWs5L1dtKzRoZnZielBNQ3Z5T1Mra3UvS0lMWG5oRUxV?=
 =?utf-8?B?N3hHSmgzT2dUdTBCZ0JwRkpnaTlocEt3LzZXMjY5ZjFuVkRiMHEyYjJnSnRM?=
 =?utf-8?B?VGY0aFNCM1RqZmpYRDVrSHJqa1FzSVVWZHBkdUg2NklNQ1ZKa001dTAzNzhp?=
 =?utf-8?B?a3Z5NzUxVkFoeXh3ZjdtY255OXNGQ2hKOVBJa2dNbm5BZkhVNElkNDdvNjM1?=
 =?utf-8?B?TG9vWldiVU1JOCtWdHJ1ODFTNTU5WU1QaXNjSWE3bmpwbjhaZm5meEZwV0Y4?=
 =?utf-8?Q?oByba8OBvG8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmRIZi9rMlhBRUFRN0FBbmJYRDJ3VEFlYS94SFhPbUlDMktiQWc4c3dhV0JR?=
 =?utf-8?B?WmpDMXZFaDlaaURXbUF4SVV1eHdEb1liQmNBSzJ6TmhuaG4zVW9iN2pOL1hv?=
 =?utf-8?B?QjliOGs3ZVFKTmQzV1YwbVNNQkZXenpDcGpFMHhJUjJHVmM5aVFLeWZRWUdr?=
 =?utf-8?B?YnB2VWdvakxCVHA2UlY5Y2xSK0tpRmpjemhwL3JDbE1rMWtJZEZpc1plRXBJ?=
 =?utf-8?B?cnIxSHliZkdNRytzYmpCekZwcDYvRE1yNitwOFNMdEpsRG45TWxsSEc3bEds?=
 =?utf-8?B?bzdpZ2VqNnZtbkNuc2k3ejRWU0FvdUUwWGd5ZlphK1pBVWZ1emgwbGduOTEw?=
 =?utf-8?B?QXBIOHpnNTQ3blprdVJTZkFOaHlxMklJcGNDR002bktHS1pkSk1mRFF5MHZC?=
 =?utf-8?B?Yng4Z3lTSmgrVytLZmI4bW41eWZnRkRjOUFsNHRvTjl5RFZYSXJtZGhwQVI4?=
 =?utf-8?B?MDRXZy9NNE5oY3JZZW5nZVRMVmhTK0lxaXRrUE1tTSs2YzJoNnRnK2pVWUE5?=
 =?utf-8?B?Qk9DelovbEtlcXZJM3ZSaC9kTTBoWjBkREYxUENhNXZXejEySFlKcEhXYWQv?=
 =?utf-8?B?QjQzM0V4NDZaS01ZWGx4SnduOWtxTnpTMDZLaGFQOTNUTE9yeHhTUVBHZ2E3?=
 =?utf-8?B?NlM1M2JzNnlDL3VQREFtSjJqcXBYZ1RBQmJLR0FNVHVZR0VqSkppRjlFcDZO?=
 =?utf-8?B?TnhGL0F6YmlIcXI4MDdFQ0x3TWxLamRhMkpCUk5IM1ZINHN4azVuYU5jR0pV?=
 =?utf-8?B?ZWFkRFpjWllId0N1STlOZTVVSm9JaFFxbm5GTis0MHcyOEt1UE4rdkI0REZQ?=
 =?utf-8?B?di9WS25ybDEzNGpodjN6OWV5OFQwQU93MEdpSGFpaWhnVUNtK3d1bTliM1Ew?=
 =?utf-8?B?ck8xaSs1WFN2a1Uwa3BpUVpIT2t3WWFEYUovMVpqemdvditubzFnVEFaYWpx?=
 =?utf-8?B?aXZYQTltSkxmN1ppM2wweDZ1clQ4MTBRNWg0QVhpOFl5aGZDcFRBSzVoM1Bn?=
 =?utf-8?B?akw4U2FOS3hTUE9oWFJBTzNKTFV3bFE5VlEyR2g1bURaUzNRVGhlZkcwdCtK?=
 =?utf-8?B?ZkhlQzNhMXBXUjJNSWE3TG42dlM3MGx3K1F0bXlsMTBxUFZtOGdhbnEzK3I1?=
 =?utf-8?B?NDIzaEdRbXY2bTMxcU5lTGxvTi8xcWFUOXVSbjVxQnNNMHdzbENheEd6ZG1r?=
 =?utf-8?B?ZzBTallZOCtxaXRmbG04WXA3UlZ0NTNrNDRyaEtReFJ4aTAwelNXUHUvSS9U?=
 =?utf-8?B?eVd1akZtcTFhUk0zRmxiU1FwZTZJM3BkRmtINkN4NG5RN01yQUpRRjdFMmRB?=
 =?utf-8?B?RDVDYVlON0J1VTVkWHlQYldEL3hwTXJCeENvQ3JCb2ZKYW4vWXJVb2Q2dE12?=
 =?utf-8?B?RWdldXlSN2o0MnU0YUNNby9LTmxsMVUvTHF4bWM4dTI0VUFJMVNJWTFKYkk5?=
 =?utf-8?B?NjFwMEc0K21nRWVPdjJiWFZ2U2g4SDdPQURKc2VQV041eTFEbjNCNksxOHg0?=
 =?utf-8?B?WmhuanZFV09PTCtYS0ZUZkZ4MXNaa3hFMWpPUit6Sm9DQ2lIZ3B6NzdBRXl1?=
 =?utf-8?B?V3E1S0tPc25qV0pZdGhPSXh0UlptaVdhQTA2dmpEWFowRmNWRVh1bFhMLzZI?=
 =?utf-8?B?WWtjQmdORlJMQ3FiZStxdldVL3JLOGVkSGJKRUZkcFA1ZXFINGRPTFBHbHcr?=
 =?utf-8?B?bExqczRTQ3IycE9VeGQwK3h4Uml6MVF4RnNtdnRWMEI5Znp4MXMrSWNHV2FN?=
 =?utf-8?B?eW40SzlIYVc3WmdwUklEU3NHcmRqUHRUeWpTY2gxaXo0bW5rdnFHdnp0ajFh?=
 =?utf-8?B?VWlGWjJxT3pyZWIxWHRadlZ6Tk9ZbThEenAwb1VQYzZDZHZoUkQzRmFnemNm?=
 =?utf-8?B?WVNDWDJhdHl3M0hNQjROY1F2RjcvWVFjV2dxNGNoNm16Um4xZGd0RmVYUHlP?=
 =?utf-8?B?a010Q1lXMktwUzc3bUxVNWlFaTFTU05mN3Vpcmd0TlpVdm1vdWhSVXd5cEJn?=
 =?utf-8?B?azRtQ3hCRHFybDFTamF3WElyc3JzWkhvcldFa21kQWtGSkMvYS8ySWdZVEwz?=
 =?utf-8?B?QnRMUlN2OUpJSzNrajV1bjhNcTNtcm5xdDBUejFady9WVHk4a2lSUEVweGZB?=
 =?utf-8?B?ODNmYkZFTUZlTUZvczQ1bE1KQWl2WjQ4aytTQ3lmaWNqVkdyL0wrNzY0azNy?=
 =?utf-8?B?SEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bafa2eb-0c71-4ab1-8043-08dd99b4552e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 04:43:15.9882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99WiNUFQ9OKcCJMUR76ZurK9e/o+HXowmjczEtNj5MVusBsnpg+PakVUeMoe4izRnjHrrZTqrVulsIvUCefzrjoiCSYfAA7wxBZ1sQve+G4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8582
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:52 PM, Babu Moger wrote:
> Create the configuration directory and files for mbm_cntr_assign mode.
> These configurations will be used to assign MBM events in mbm_cntr_assign
> mode, with two default configurations created upon mounting.

This just jumps in with what the patch does. Requirements for proper changelog
should be familiar by now. The changelog *always* starts with a context.

Sample:

"When assignable counters are supported the
/sys/fs/resctrl/info/L3_MON/event_configs directory contains a sub-directory
for each MBM event that can be assigned to a counter. The MBM event
sub-directory contains a file named "event_filter" that is used to
view and modify which memory transactions the MBM event is configured with.

Create the /sys/fs/resctrl/info/L3_MON/event_configs directory on resctrl
mount and pre-populate it with directories for the two existing MBM events:
mbm_total_bytes and mbm_local_bytes. Create the "event_filter" file within
each MBM event directory with the needed *show() that displays the memory
transactions with which the MBM event is configured."

> 
> Example:
> $ cd /sys/fs/resctrl/
> $ cat info/L3_MON/counter_configs/mbm_total_bytes/event_filter
>   local_reads, remote_reads, local_non_temporal_writes,
>   remote_non_temporal_writes, local_reads_slow_memory,
>   remote_reads_slow_memory, dirty_victim_writes_all
> 
> $ cat info/L3_MON/counter_configs/mbm_local_bytes/event_filter
>   local_reads, local_non_temporal_writes, local_reads_slow_memory
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Updated user doc (resctrl.rst).
>      Changed the name of the function resctrl_mkdir_info_configs to
>      resctrl_mkdir_counter_configs().
>      Replaced seq_puts() with seq_putc() where applicable.
>      Removed RFTYPE_MON_CONFIG definition. Not required.
>      Changed the name of the flag RFTYPE_CONFIG to RFTYPE_ASSIGN_CONFIG.
>      Reinette suggested RFTYPE_MBM_EVENT_CONFIG but RFTYPE_ASSIGN_CONFIG
>      seemed shorter and pricise.
>      The configuration is created using evt_list.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The monitor.c/rdtgroup.c files have been split between the FS and ARCH directories.
> 
> v12: New patch to hold the MBM event configurations for mbm_cntr_assign mode.
> ---
>  Documentation/filesystems/resctrl.rst | 30 ++++++++++
>  fs/resctrl/internal.h                 |  2 +
>  fs/resctrl/monitor.c                  |  1 +
>  fs/resctrl/rdtgroup.c                 | 80 +++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 5cf2d742f04c..4eb9f007ba3d 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -306,6 +306,36 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>  	  0=30;1=30
>  
> +"counter_configs":
> +	When the "mbm_cntr_assign" mode is supported, a dedicated directory is created
> +	under the "L3_MON" directory to store configuration files.

? it does not contain files but directories for each event, no?

It will help if the text is specific. For example,
	"event_configs":
	Directory that exists when mbm_cntr_evt_assign is supported. Contains sub-directory
	for each MBM event that can be assigned to a counter. Each MBM event
	sub-directory ...

> +
> +	These files contain the list of configurable events. There are two default

So confusing ... terminology is all over the place. Which files are even talked about here?
"configurable events" ... are these the memory transactions or MBM events? 

> +	configurations: mbm_local_bytes and mbm_total_bytes.

"two default configurations"? These are not "configurations" but "events", no?

> +
> +	Following types of events are supported:

events -> memory transactions?

I am unable to parse the above.


> +
> +	==== ========================= ============================================================
> +	Bits Name   		         Description
> +	==== ========================= ============================================================
> +	6    dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
> +	5    remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
> +	4    local_reads_slow_memory     Reads to slow memory in the local NUMA domain
> +	3    remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
> +	2    local_non_temporal_writes   Non-temporal writes to local NUMA domain
> +	1    remote_reads                Reads to memory in the non-local NUMA domain
> +	0    local_reads                 Reads to memory in the local NUMA domain
> +	==== ========================= ==========================================================

Why does user need to know the bit position used to represent the memory transaction?

> +
> +	For example::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> +	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
> +	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> +	  local_reads, local_non_temporal_writes, local_reads_slow_memory
> +
>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 019d00bf5adf..446cc9cc61df 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -238,6 +238,8 @@ struct mbm_evt_value {
>  
>  #define RFTYPE_DEBUG			BIT(10)
>  
> +#define RFTYPE_ASSIGN_CONFIG		BIT(11)
> +
>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>  
>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 72f3dfb5b903..1f72249a5c93 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -932,6 +932,7 @@ int resctrl_mon_resource_init(void)
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>  		resctrl_file_fflags_init("available_mbm_cntrs",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
> +		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>  	}
>  
>  	return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index b109e91096b0..cf84e3a382ac 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1911,6 +1911,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
> +{
> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
> +	bool sep = false;
> +	int i;
> +
> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
> +		if (mevt->evt_cfg & mbm_evt_values[i].evt_val) {

Still no idea where mevt->evt_cfg comes from. Patch ordering issue?

> +			if (sep)
> +				seq_putc(seq, ',');
> +			seq_printf(seq, "%s", mbm_evt_values[i].evt_name);
> +			sep = true;
> +		}
> +	}
> +	seq_putc(seq, '\n');
> +
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2035,6 +2054,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= mbm_local_bytes_config_show,
>  		.write		= mbm_local_bytes_config_write,
>  	},
> +	{
> +		.name		= "event_filter",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= event_filter_show,
> +	},
>  	{
>  		.name		= "mbm_assign_mode",
>  		.mode		= 0444,
> @@ -2317,6 +2342,55 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>  	return ret;
>  }
>  
> +static int resctrl_mkdir_counter_configs(struct rdt_resource *r, char *name)
> +{
> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
> +	struct mon_evt *mevt;
> +	int ret;
> +
> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
> +	if (!l3_mon_kn)
> +		return -ENOENT;
> +
> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "counter_configs", l3_mon_kn->mode, NULL);
> +	if (IS_ERR(kn_subdir)) {
> +		kernfs_put(l3_mon_kn);
> +		return PTR_ERR(kn_subdir);
> +	}
> +
> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
> +	if (ret) {
> +		kernfs_put(l3_mon_kn);
> +		return ret;
> +	}
> +
> +	list_for_each_entry(mevt, &r->mon.evt_list, list) {
> +		if (mevt->mbm_mode == MBM_MODE_ASSIGN) {

I do not think this "mbm_mode" is needed, resctrl_mon::mbm_cntr_assignable is already used
earlier, so would for_each_mbm_event() from the telemetry work be useful here?

> +			kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name,
> +						       kn_subdir->mode, mevt);
> +			if (IS_ERR(kn_subdir2)) {
> +				ret = PTR_ERR(kn_subdir2);
> +				goto config_out;

"grep goto fs/resctrl/rdtgroup.c" for naming conventions.

> +			}
> +
> +			ret = rdtgroup_kn_set_ugid(kn_subdir2);
> +			if (ret)
> +				goto config_out;
> +
> +			ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
> +			if (!ret)
> +				kernfs_activate(kn_subdir);
> +		}
> +	}
> +
> +config_out:
> +	kernfs_put(l3_mon_kn);
> +	if (ret)
> +		kernfs_remove(kn_subdir);

This looks unnecessary since caller does kernfs_remove() on error return. Compare
with how rdtgroup_mkdir_info_resdir() handles errors.

> +
> +	return ret;
> +}
> +
>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>  {
>  	switch (r->rid) {
> @@ -2363,6 +2437,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>  		if (ret)
>  			goto out_destroy;
> +
> +		if (r->mon.mbm_cntr_assignable) {
> +			ret = resctrl_mkdir_counter_configs(r, name);
> +			if (ret)
> +				goto out_destroy;
> +		}
>  	}
>  
>  	ret = rdtgroup_kn_set_ugid(kn_info);

Reinette
