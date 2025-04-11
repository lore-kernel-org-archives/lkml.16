Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78644236451;
	Fri, 11 Apr 2025 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405371; cv=fail; b=W+FbkYqdoBv8jJH2eTZaHQ9/7yUSBNiemgyVqLydi19tU/8M7zCZ2NVWEmPO/6zrE+ppXl3G6vS2A0IjOO9ZHO5rH522kPASBZRUKosDOAKpTY0nEPsgW6GOr53A2s+fYNoGjXyzmrbGDoKSTHkA3lC0uutfcM+s2vgHzdR65gg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405371; c=relaxed/simple;
	bh=UhDMnFjTDbhh0Xc1pFADVB4//ymsOTRTjSt7phWZTLc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OMkopKvEdt+omKrLH7VHkUWaz45/iDTfCnPXjYnHcO3GHJPWrTr8zzsZL+jW5fRj8C8CmKrm3yoljPO0lsfxO/dmnNCO+7/05IKPKLX6XHN0BtuhMvDzWM97cSYlsRXvLGCtkZfQtyWq5HfwjoO+HyDCWeGQTNHcGoJOxvGUIv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OtYLk9sN; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtYLk9sN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405369; x=1775941369;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UhDMnFjTDbhh0Xc1pFADVB4//ymsOTRTjSt7phWZTLc=;
  b=OtYLk9sNae/o6hpXfVLqyNjbRgsp7egZqceKR3hhAdYY4c5I7XGqI/aC
   HUFoPMidELe4/q/hz6VuOBoKh+AElezwRj2hh78pINyPxG4ncupQ5T9uS
   13d+RSVqdVKDlTgd6XVXNkxnJyjK6pecrHLb1uQvnXbUxs9sPW+fJUIeC
   COYxozPd4dp0k/x9U6qfCq8fd2S4XfUbPXiZZwpSyUNekG7rtlabfDyLY
   XmbX8THt70XIn7qcaVUc9FdSFjwZspllzlTUucDbdWckRzjvjGbIHNE/u
   NDJQIG7fr47G1S/b6RCG0ZsufEhi+EexvSCRzcfmv3iqZojAWOqLMwEKR
   A==;
X-CSE-ConnectionGUID: gWEf61a1SaqWnnPAxOrLmQ==
X-CSE-MsgGUID: D3ryFtR3QouDeiJjGXRYUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="46056950"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="46056950"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:02:48 -0700
X-CSE-ConnectionGUID: rpWOBq3lRKihtJ74byGJaQ==
X-CSE-MsgGUID: tITUVugdRMS0iZy1ZQoimQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="166484617"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:02:49 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:02:47 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:02:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:02:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HwQCCc3a7Hl4rSDB/fNscOiP/lb+Q/zrOX46Qmr6eBt1JvuYUKpmR/GIdoKQEY2djzM0xzc04TUrt8pRvfknZ1F8JwzLANAouX+7hJCshGFynWq11QmGYroZfAJ224sNvS/AtYnNBp6REjmCwv3UXrmw0m9UwoCebVxDWHgS4egq6Fz1+OPUQFG+/epgH1mQK3EBfdDvk2aO2IlHHd/rAL8W6sPy7fqf/VJze5Ncey+zEm4YnzaM58J7Pf1Zocok5U2Z+CuA0xM3MdEz0rf46082MkUwSrjLktmrVZlKcpXJQWUd7g/gxwr3aWN30Bj2JY/nlA8ALtqCph434MpRaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MLwio5APm54+Fpc9E6LzYRNOjH6rPPNw4vb/CUVPxA=;
 b=MR34h+5nswL3dUqzZU1QfLT4dIJQqHY2n18o9S1CqbflY7SlJVA1sSRE9iElPHUhsCn5oVN7eoAabt4gu9LZf/16Wo70ySuISDa5jnoEebIUR4qjg9M5HuxoiEXGWtffBa3jnsoir3I6TT3JOUnq8W0EDyl035GgO782XXqlb+DASBRD+5WQ0BkbmNDeK0tXsyDJ+D96sRgQKVNI5g00WlxKQXef0vhTcGy6OEGn+QLeOObP8fD0mX9ffwdYHRysAhBzPKkYT+T6/4T43fy6CHDTWiDzONASsTdzd+2BtAEOIN8Evj2UqwvdHgPUhQeQfAVdlZNZF7YurNeN11X7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by MW4PR11MB8266.namprd11.prod.outlook.com (2603:10b6:303:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.28; Fri, 11 Apr
 2025 21:02:43 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:02:43 +0000
Message-ID: <ef0fc176-ce2e-4ad5-b752-f1d018ae985e@intel.com>
Date: Fri, 11 Apr 2025 14:02:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:303:b4::16) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|MW4PR11MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 126b5de8-46b4-475e-75f9-08dd793c33cf
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWJrVlhSYUVodGFWbXdiTlBCcVJOTzhmbytNUDJ2L2cxdm9ZR1htZkwvSkVL?=
 =?utf-8?B?ZXpDYnptTEFLeWNMOUkwY0l3OUpLeUNVR0NuOEhMUWVvUEJYL1hETGRlajlu?=
 =?utf-8?B?NFJQc2xFcGJHUlhpZGQ1dFFsR21EQ2N4dHBMc3JsY09GeWZPdjU5S3FMUlhP?=
 =?utf-8?B?bzNUSjd1NlRRcVpXWGFONFluZ1JSUkRRbEtyQU9hV1VuQkxHNkJpcnpCaVpI?=
 =?utf-8?B?QVNpR0tMQ1hNWWcyaENRbjFiekJxUkFwUmxjampSS05hcTB0Z1F4OTR0Y2Z3?=
 =?utf-8?B?NmkwUjNDc29ibEtqSmlvamNZa05FOGh2MkcxWGl0Sk14UStCV2Vwdmw2RVhY?=
 =?utf-8?B?aVZnOTdsZHNUQUljMGM0dnhkaVgxTE1ZS2N1WVJkMngwaWtsWUNXSkxmTnNR?=
 =?utf-8?B?ZGMwTWZiS2FLSXh5bFRlMnVkUUtFT002M3lKbUF4a041NUhHaWV4RVhzaVR3?=
 =?utf-8?B?dHRGZXdVb3FCZTVTOTZKWExqQnArcjJuMm81SWhWUjlVS0hqOWlDNEVLZWw4?=
 =?utf-8?B?YjAzREhZamU1Z05XUDBQcm0zQnBsNU4vWXh4eGc4b1psK1NPM0JaRDZIRWJK?=
 =?utf-8?B?QTNQcVlISGR6ZUZ1aHp5eXprU095ZDlPdnFJZ29jUWRqeWd1WUNnZG1Rbmtj?=
 =?utf-8?B?SUlRT08xcDlLSy9NYmwvaUdkSjhmSmRJMW9acEY5Z0FwNUJtQjNQY0E0cG5m?=
 =?utf-8?B?cGR5NWkrNDZMVy9tNXVBdXlzM3BkMWpFam0vRFdtK3JPREpycWxmbjFNWlZl?=
 =?utf-8?B?N3NncWpsTXBkWXptZ0htaENzNTV6elVZVE1BWFRTa1p3OWwzWFFHcU0wbzM5?=
 =?utf-8?B?Vm1lMG5wVVFuSnBvZjh4Q21GVjVWMEU5MVdrZkVpT2diYk05b2JIWXVvcEVB?=
 =?utf-8?B?aFUweGNTaFkyTkZVczgvUFJlcVg4RmxSdk9tMWtmVlBrL1VRcnJNdTFrZndI?=
 =?utf-8?B?aXRvT00xSExQRHFlS2htTjBENEl3V1Y3Y3hubXBDK2xVRWhqTml4djd5cVVZ?=
 =?utf-8?B?ZkJlSHhtWkM4YUhCMnR3aUg1dVNrc0plQmEzbVp0cCtERFBWSTcreXFxVW5o?=
 =?utf-8?B?cHIxN3N4d3RRd29BOUxiYjUwem53R21mbStqWEVjY1RzSUhpcm5QdS9IN25U?=
 =?utf-8?B?SzRKa2lzR0Z0SHpNWGtEdUMzQkgzdWZQK21NbVF1RjZXZGt6R2dGbGc1MDVl?=
 =?utf-8?B?QTVvSyszTHU2RmZjU1VUZTVQRThoRjJ4aSs1ZzEreHd1VEVKdXlQVGVYdy9p?=
 =?utf-8?B?VFZvWG1qUTIxdlMrUjk1U0k5ZndlMlVuQ04rVy9vZzJsUTE5eHRZd3VyRlJE?=
 =?utf-8?B?UGRXZVZxeU56QXpnSGNha3FKRlloWHFIVXJkRi9Pay82cE0wbndGQ0lIb2dG?=
 =?utf-8?B?OFJDdUkvZGRWcHh4V240V0lVdGNGZGlidWdwQkpEQ21ucklpZGZ0N2xVWmR1?=
 =?utf-8?B?MEpLUDd1YnNQT3Q5c3FqWU81LzZtSyttQnd1NnZ6Q0V1dHdRejFTc1Rxai9W?=
 =?utf-8?B?cjVHWXIrbjI1QnkyN3VPcW1PTjVFeGNNY1pueXZacHJsc0QxbS81TkxWY0p6?=
 =?utf-8?B?ZlpNVi9MZ0NIQUUxMzc5cmpTMjR3bUdNNVlwSmFpMlUyL1d6S1VhOXhkTGlj?=
 =?utf-8?B?N0R2RmpQMTQ0MGVXNWxXNzY1RlRjTm9EYm50cE4raU1FZXhCNGcwS2F3dXIx?=
 =?utf-8?B?U28yQnc3RTFucm9OYlJzN0VaSyt0dmhhRnJkNWM3RTVOYlZzSVdMQjFxU2s0?=
 =?utf-8?B?WHZJUGVMdkdJaXBmVCtWMEFwSmszd3BJOS83WUI3bkxPMUZxbGcrU2p0a21P?=
 =?utf-8?B?NGFCK3lKUUw3aDg5SUhERFhxVFQvZnpKdG5UME5KT1VGamdFaUpza25TakFH?=
 =?utf-8?B?WlVQSUxQelVxaERXS3F4Wnd1ZmpIeEExak9GcTg1R293NXZhbXBRdm00Vktj?=
 =?utf-8?Q?7J6uv553Zgg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFRmTjJJTUdEL3MyQnBYRHNRSEVVK29wcHpndkl5SS81RkhxVjdPRTY0QklD?=
 =?utf-8?B?Nkloak41OFBEdDk3Sm5vS3FLYlY5MVhCOUFNekUzWHB3cGJyN2pLa0ZNRUta?=
 =?utf-8?B?RVNISm5NdHg1d0FuL2lWSW5HNXlWSHo1aERVdnlCWXJ2alByb2tPZndZRTEw?=
 =?utf-8?B?dGttcW9Mb3cxc2E4MkJ1aVFrT2lzZUk1V3ZqMGE0dUNOVzNQVkpEQTQwaExD?=
 =?utf-8?B?bXlNZFZNNDc4QnhLb21QUCs3alA4eDBpUjdPMkVxYmxEa0JMdlgzVm95Nnd6?=
 =?utf-8?B?MUVKcnVHMlFSUWFka0l4am9GUGl2U0JzOGQyQkdrOTBnaWkrVXQrRVQ3RHVI?=
 =?utf-8?B?OU1hM29tT1RYeDlFOEdWM2c3aW5PZzg0SzNwbXBZakM4TFNBMXRpSmdXdVNx?=
 =?utf-8?B?c2l3S2kySDVlWG1JNkViTFphZUc3WHI4a0RCb0wzeE5LUS9vYlpCU0dzb29w?=
 =?utf-8?B?dmtoVDJPTEplRkd3d3BJRjgwQURZaTA0aWJKWk9RTUJiNVR6SDdkWnFFa2Z2?=
 =?utf-8?B?S0pFTmZSV0F1UER4R1VGT2g1azk3b0syUW9sSnU0TGNsV2N3QVNzQmRTWkp3?=
 =?utf-8?B?aU1zMERpeFVBTXJpV3dYTTRVTG5qOWorcDBrODNNUDAwbmpVbTh1bTRSN29G?=
 =?utf-8?B?MlV0ODRicVVrM2x3L0ZqMlBiNmh4VGxBc0QxRDZlWVpyL2V1aE53MUtQbnN0?=
 =?utf-8?B?YklBdWhUYVMwZmc3WHZBMHptYTJ3dU1YQmlxMGFVSVFvVWhJYk5wS0pyWjRO?=
 =?utf-8?B?TncxSVJrVlVNeEZQVEgrTnhIM0xtMTgydmVJWjhVeWtWSVJVR21ISXozVUFG?=
 =?utf-8?B?RVJxS3UvWXJWeEU4N3NiWWl0S01ncTFvbjBDNmFiZy9YTXBLaThsOTNSU2l6?=
 =?utf-8?B?WU42R0VVRllGeFBMRm12VWo2RTN1eFdFeWdmNzhrRHBEcmRGWVNqN2N2M3Nh?=
 =?utf-8?B?ai9VcFBYaVV1VDEvUEZrM2NESDVkaktieExDZVNOd3pUOWxyWGI3OG5NUTFC?=
 =?utf-8?B?Z3QvNllkVitEbVBvdmk3RDFkNEJFZlkyQ0ozbERpYWdsK3FZQ1YrTTRocTdO?=
 =?utf-8?B?MVhPckpobFdYQjdiVXZlU3NvQlFITCsyTUE3ZlBEYTd4NFdSRGpCTjdGeGJY?=
 =?utf-8?B?MUVJaFR2RUEyaUVaTlU4WlJmZFZLeWg5K0xGRGJzTTQrWWhYSjdBMzluTGF1?=
 =?utf-8?B?MERzWE5hdlJZeDBpQ1RQaVFjZUdMT2d5L3JhY1RDNVpWVWVuNDQ4Zm9TUU1m?=
 =?utf-8?B?S3Jhem5GMkF3NlJvZGRMTjRvOFJGZlZFZVN2R3VMa3k0Wlp5K2kzN3crK0Jk?=
 =?utf-8?B?ZE43Q01sWFpOc2Rjd3htYXFRdUZkZVBWdXQvdk5NMU5pZkRMbXFLOTZWYk8z?=
 =?utf-8?B?c1JVdFAwaXA4dGhKN2FVUzhveENxelBQYnk1RjF0ME1tLy9RV0c3UDhYY0dV?=
 =?utf-8?B?ZGV4Yko2VUc1TE1jV01BeVRLS1dKK2NnSXNWbHZGTTIyckxxSmt5NUZiYWE2?=
 =?utf-8?B?TzF2VHB1MXNZZXFyemxyaDhiL2Jlemh6bVpNcUh6WGtPQldJV0p1eHJRdnFS?=
 =?utf-8?B?RTBHL0s3Y2pRN3FxL3MvTFd6ajZ3L3d0MjhSOC9QNUVuR3djWkdhTGZ6Y0N4?=
 =?utf-8?B?TEtsOEI0dlorWlFiOW5QaWk0SElJSExWdEhrNnYxYThCSE1IMk9Ma2x1Wndp?=
 =?utf-8?B?L20wQWFzZHRrbEhudm1PQXJKN2d2VjNEcFBVY3lSdFpZWWQzYTc2dGVubk5U?=
 =?utf-8?B?a2Z2SG9ZK2RGY3Z5cENWaXhQLzZBbFpzRldocTdKWG9IZVl1cWk2YndTTmVt?=
 =?utf-8?B?TE9LRUlvbFlXa3ExVE1DTGN0NlNjcDZrcG9PWkNIZDA2akVaZzVqL2JaclVy?=
 =?utf-8?B?RUJNUHNrLysxOE81aUx2UXppWjVTblhNcWV2VjZKRGhJdEljWFdKbmJSMElv?=
 =?utf-8?B?ekVjQzFuYjU3R0VsQzhlYlY2ZzNTUm5qSkRhQ1hXRWE0S2VpY2wrNnlQODZk?=
 =?utf-8?B?aExJRDNKSzRLNHFLWFpaRUxDN2lWWE1kM29Qc0NPNUVHc2hVMmZEb3BVbHRG?=
 =?utf-8?B?Sldnc2tiSUQwOElQVy9ISjZ5SzZUa0daY3dYSkxtaERZdTBka2cxL29sSjN1?=
 =?utf-8?B?UW9maDlFZTNNVW9HUkIyOHgwVmNtVEpEMXFUQk03SnBUTVV6YWJIUEtTdlU5?=
 =?utf-8?B?b1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126b5de8-46b4-475e-75f9-08dd793c33cf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:02:43.1850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAvAd20JWwAwLB/mKFnmYf/2iwxYnbMhe8THGjSfVqlAqXnarU8vYGfd01Y/8kplPmxvt6g2R/F5WLRx0R4qK15AnwinMjBZIhgk66U4nPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8266
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it
> is assigned. The assigned RMID will be tracked by the hardware until the
> user unassigns it manually.
> 
> Implement an architecture-specific handler to assign and unassign the
> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
> specifying the counter ID, bandwidth source (RMID), and event
> configuration.
> 
> The feature details are documented in the APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
>     Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
>     Monitoring (ABMC).
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  arch/x86/kernel/cpu/resctrl/monitor.c | 39 +++++++++++++++++++++++++++
>  include/linux/resctrl.h               | 15 +++++++++++
>  2 files changed, 54 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 8a88ac29d57d..77f8662dc50b 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1430,3 +1430,42 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>  
>  	return 0;
>  }
> +
> +static void resctrl_abmc_config_one_amd(void *info)
> +{
> +	union l3_qos_abmc_cfg *abmc_cfg = info;
> +
> +	wrmsrl(MSR_IA32_L3_QOS_ABMC_CFG, abmc_cfg->full);
> +}
> +
> +/*
> + * Send an IPI to the domain to assign the counter to RMID, event pair.
> + */
> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			     u32 cntr_id, u32 evt_cfg, bool assign)
> +{
> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> +	union l3_qos_abmc_cfg abmc_cfg = { 0 };
> +	struct arch_mbm_state *am;
> +
> +	abmc_cfg.split.cfg_en = 1;
> +	abmc_cfg.split.cntr_en = assign ? 1 : 0;
> +	abmc_cfg.split.cntr_id = cntr_id;
> +	abmc_cfg.split.bw_src = rmid;
> +	abmc_cfg.split.bw_type = evt_cfg;
> +
> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
> +
> +	/*
> +	 * Reset the architectural state so that reading of hardware
> +	 * counter is not considered as an overflow in next update.

Please add something like: "The hardware counter is reset (because cfg_en == 1)
so there is no need to record initial non-zero counts."

> +	 */
> +	if (assign) {
> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
> +		if (am)
> +			memset(am, 0, sizeof(*am));
> +	}
> +
> +	return 0;
> +}
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index 294b15de664e..60270606f1b8 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h

Please keep the declaration internal to the arch code. It can be moved when
other architecture needs it.

> @@ -394,6 +394,21 @@ void resctrl_arch_mon_event_config_set(void *config_info);
>  u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>  				      enum resctrl_event_id eventid);
>  
> +/**
> + * resctrl_arch_config_cntr() - Configure the counter on the domain
> + * @r:			resource that the counter should be read from.
> + * @d:			domain that the counter should be read from.
> + * @evtid:		event type to assign
> + * @rmid:		rmid of the counter to read.
> + * @closid:		closid that matches the rmid.
> + * @cntr_id:		Counter ID to configure
> + * @evt_cfg:		event configuration

"event configuration" is simply an expansion of member name and does not help to
understand what the value represents.

> + * @assign:		assign or unassign

Please rework the kernel doc: consistent sentence structure (starts with upper case,
ends with period), use proper capitalization for acronyms (rmid -> RMID, etc.),
make descriptions informative.

> + */
> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +                             enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +                             u32 cntr_id, u32 evt_cfg, bool assign);
> +
>  /* For use by arch code to remap resctrl's smaller CDP CLOSID range */
>  static inline u32 resctrl_get_config_index(u32 closid,
>  					   enum resctrl_conf_type type)

This patch does not pass checkpatch.pl.

Reinette
