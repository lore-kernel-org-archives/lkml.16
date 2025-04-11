Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A41F03EF;
	Fri, 11 Apr 2025 21:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405774; cv=fail; b=mU1vj/eEduQ1KMJ1bjvIhG8zV63cmq7kmw4cP2p1kFdtVU43mvfymmk4WcHhoTbIk/QkMHgVoivuCZLxWhaTxfs6kFnF+NqxAYiBdbiAfCeijr6EGePDjnF4FRzMLWfq4Tq/bzp9oBOmVd9vEjlZGFyslpVXzOtrMdsFljcCaxE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405774; c=relaxed/simple;
	bh=sAsKLks0S8cn7rGIdp07xBEqNPjQDn4zDKQ19/eRA2M=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WG3M+Y5fa01S9wIvOPlbPt1+m92tXpvuQwFLqNfsF0GBu+HId0VgDLmvZeuIVuHe+cMhudroZlwpbUJLMtTVi/tHoa1nSSt+Yf1nckAxuxEcGihu8jIFssZ1sMy3n508yXV+CAaWKgiXVThv8wta0DeK/0J0VVuA+iyHuhbto+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hgj5QfgD; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hgj5QfgD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744405773; x=1775941773;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sAsKLks0S8cn7rGIdp07xBEqNPjQDn4zDKQ19/eRA2M=;
  b=Hgj5QfgDBEhS5Pn6L9Q6grIHX42h2b4Q8RVj7lOlHTYWPcSP6WHSIGLM
   t0DaJ4XmDorYcRa03RtZn94r2w0HKfxqnDLpfUjX4vBrBNKSax9pVyi1n
   rljWsBOjwWOTRd8SpWCx6GMjWh0tqtoUofWOko2xjYxvFZrYz4SaQ3/gK
   Dzphh8tR2ZxmRHcSGpru/Zzqqyl9CJDaUOprR9VM/6RLpmQ4mRivXHKQz
   ONApgM2mna5ZFeU0T+8RNuogRIc6tuYSqdmppYmsAEnKMkhLDkRJpxndh
   k/qyVs+3yZopTRiqNjD0V8gkxgoRqXF0p27T661keOqiX33umRl4miNMX
   w==;
X-CSE-ConnectionGUID: gtosSyG2SYKK27q+LsmSnw==
X-CSE-MsgGUID: D7g37St9SOqMfcD81gFdRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11401"; a="33581988"
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="33581988"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:09:32 -0700
X-CSE-ConnectionGUID: WfXFQObVTKe8C9wpqcNbSQ==
X-CSE-MsgGUID: 5ZlFfN10QQyoZQdOjQlqZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,206,1739865600"; 
   d="scan'208";a="133395550"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2025 14:09:32 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 11 Apr 2025 14:09:31 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 11 Apr 2025 14:09:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 11 Apr 2025 14:09:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t6s5QkVmi6WEViAtCcht4R91fbCVKIbVnLSwKPTEgQHCnFqqazlhr/l3QgOMiPvCxv1ZPGyZDAo6HxzK9B0zYJYoE/ALKScFJzHo9wliYP6hlb3b+b6fWG8FDeEjlJ9d5by3C4UioYFoVyKmlPUmq4+9iiulrRZMyKkPohEKmal7RUYKPB0vRNqd+Ox2KaQWpD13ZR2v1s/nZLTUK+m9cPKm2VMJKrY/b/3y5lxbbGY9l4Uw1VNizNWWE9orGum9Y8VWit4hNm8podVvYeqvgi+nhAl7dZ/gjvRZ0mYJ8gfMPml4G3SqNTEoHe4T1LTVuB9+LtLzqhBx8yxWOaqw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yiubfOfIfJZTplUdo8UoGhdccqveRmNn713UAib1gi8=;
 b=X07o3F2f81OW5/WXGAIO0EgrnuYa2vzVpRHCLQllEU/6O3FGIfPzKWE41ov6Ms4OWrucM6TwfTYjZe97NUK8LBArvQZNQzltZ0e6Cos3thx5QOOQSBrpTGCBMm/bLL0o1IxeTXASv7I87CCrdXvZqhLg1XgUeQ48bj7T2sP6L0GRBFQ0SnbPjnRzxLlBBTJnYshJRQfoVtj0Rv3ItElgVTmPoKfJHy02EAWQ4kxoS0NRmNPhcuN02wzJzCq1O0oMU4xEkjmq3ZSu1a91wEnepjWgRa2zN4ZNQ5pZew/+QydmFyT4C11wzM40b6mYFBBl+FHbGRCHljZOIGpfOmt8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by SA1PR11MB6686.namprd11.prod.outlook.com (2603:10b6:806:259::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.27; Fri, 11 Apr
 2025 21:08:58 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%6]) with mapi id 15.20.8632.025; Fri, 11 Apr 2025
 21:08:58 +0000
Message-ID: <4bf73e0d-3533-43af-9622-94d70425d22c@intel.com>
Date: Fri, 11 Apr 2025 14:08:54 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 16/26] x86/resctrl: Report 'Unassigned' for MBM events
 in mbm_cntr_assign mode
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
 <5aca5635ae7e41bd4e1f13b81c3e279ed542743e.1743725907.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <5aca5635ae7e41bd4e1f13b81c3e279ed542743e.1743725907.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0001.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::6) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|SA1PR11MB6686:EE_
X-MS-Office365-Filtering-Correlation-Id: bd75fa17-dcbd-42e2-b0a4-08dd793d13a1
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWNZUzBab3JRVFo5c094OU91azE3SmdiY3V5c1Z2UGlNRDRkdmszNmVrQjBX?=
 =?utf-8?B?MVV6eWJ0RzBsU0RvTU85eE13Y3hmeUlMOHJXem9yVW54REdLb1FUNm1vd29w?=
 =?utf-8?B?QThRMmg5cUVHeUJzbmZ6UlV1SnZrYmx2UThRV3RsaUZCSm03VjVpUENqZ2xz?=
 =?utf-8?B?YkxRREh2Z3FlTE9jNTFPOXZwTXg1OWhicit4bUlHY0N6c1F3dXhPNXRRQ3ps?=
 =?utf-8?B?MzVMNnc5Y21NZ2FjRGpMSHlIVWZLR0FJeUxmM2JjSkd2S3FMU1VVazh2NnlV?=
 =?utf-8?B?Qm55M0gzU3lTS2ZZUVNGMjFYMXllT3ZRRTBFSDdla2M2bU55RVBZSFRKTE03?=
 =?utf-8?B?Y09GdG51dlFTdVhoZDlGZUFKK3dDVExxVGRWR2drVGpVQkNBcXVQN09SSFhm?=
 =?utf-8?B?NnFPYTZEN1l5b3dZUG1Da3NuTEJ2QnM2bFdzSm5za3BCVGxlNnUrWmJEUFdS?=
 =?utf-8?B?WlRlY2pMUFlPZ3dPcWtRMDR0RHovMEV2NkQyancvS1dkNlV4L0dGYXJVazBE?=
 =?utf-8?B?bE1NcVM2MlFaaUwxa3RNTU42S1JkdmVWV1pOTllNamVLZHdISHV5NVNMdjFk?=
 =?utf-8?B?dElQZWZOamdybVRFU0x5K2lRYnU2S3c3OUFjd1Fhc3B6K0p5Ym5KeDJTOHVt?=
 =?utf-8?B?ZTJ3WnpmSGdYbVA1Vk1lWU1Ib3d6RWJEMDFEQXhYOFhWVlVqZ3psRVRmZEZv?=
 =?utf-8?B?SGhGZ0lxcThQMit5cUxlMEZXMVdRTURtQ2sxVWw1bVpDSXdhVkV4c3R3cTQ4?=
 =?utf-8?B?eXJQR1hpQXhJZDdPc1F2TGdscm8wSXQ1amFtSUVIeW9ScmtkRlJWQ1p3Q3E3?=
 =?utf-8?B?eVFneVJ0eVpBSzJsc0ZLK216bldKbUVkM1MrKzNEQnNpcTRxTkk3WVpFdWxr?=
 =?utf-8?B?RnByYjJubzh0Ni9LWmIwcjVnakFRUUZGb295azhQVWVHdThaOElHTkM1U21n?=
 =?utf-8?B?VG82QTJhOVFBNEdaOTlBdWhQdS9jQkZsbVp4OStLeVdoWDBnSm5qZElkNXB0?=
 =?utf-8?B?L25vNG85MlR2WEdFNTQzeUQzK2R1TUFiSC9vVEVjTWtzRW13Y21YK1BLeFVB?=
 =?utf-8?B?SWtnSUNvVHFqeS9iR3BheFRMeDV1WVdGbVk0ZGFFdVNMVHkzeFAxT1M5NzZa?=
 =?utf-8?B?NzJ0dGVoRVcvVEJCOCtXek1hd3YzWUtxMlUzNW56TjRzQzFOZkNWeUpFbWZs?=
 =?utf-8?B?bkpGc0pWdGRmS21YcEtvell4MkRnblFpYy8wY0FRMWVOd2hLV0RLdXlvcm1i?=
 =?utf-8?B?V3Z3Z2gxZDlxdWVXckdaaUh1c3FqcHNTWUU1dVJRMnBjZFBaWGdOcHh6MVZi?=
 =?utf-8?B?ek9IYXFPSWxkUVNhVUVWOFp0Mmt3L3E3Sm5ISlNwd2c3SHhxQ25OYmpOVlZF?=
 =?utf-8?B?YW5wS2t4aGZIbmFvcXYvOU9yemI5dFFCWThjUm1oMUFEZW9RNlhKVjkyU3Nr?=
 =?utf-8?B?RGg3TDZCdjhuaE9TYVFGSzVUVWRyZnhkOXk5eDZqOFdDQnhQeklIdjJpekxG?=
 =?utf-8?B?VVRIMnFscjFHUTJJa3IzMG5vZmxYa3BqNUNXYnM3S05ucFJSdEtuSW1sUEJY?=
 =?utf-8?B?Y1NpcmFVd0dTUmlIblpVTjVEZDNjb3l1bm5POWswT0xtcnRUbm5NY2tBOXJT?=
 =?utf-8?B?OFF4b2Z1YjduNlorTDY3MUJwVXdUdXE1YUMvSDE5aHRrdmIyblppenJ1SVg1?=
 =?utf-8?B?a1JGM2tIb3pGclpCbU1wOFlaRHlCaUJmaVpJbnl1S2FBL3J0am95SHVCMUNW?=
 =?utf-8?B?M3BJZC9INHo5SUhkSjB0Q2dpZ05PQ1BIR2JRamxKTEZKVXNSN3lQN0ErT2hU?=
 =?utf-8?B?bmRtQVhwWHpsNkZNNzNVNGZpMEJMZC85bklGOERLVjJaSkFPWFF4bms2WVJB?=
 =?utf-8?B?dkdVWUpuL0lneFQ0WUhCS08xb3JtbG5ZUFRwKzFDRXQ2U3BPZzI1SzhFRXBB?=
 =?utf-8?Q?+D+/dOfGRO4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RGlWMGNpd3JsY1poeHE1bHkveFVDdlJRSTBtR29tSnFqcWhiM3Y2S2NCeWVT?=
 =?utf-8?B?azc1THRxcmp4ak10QVBJSzExRi95djhiWTM1T2JkK3p4NjV6WHhuRzVNc0Ni?=
 =?utf-8?B?a2s4RXpMekk2MWFwNXI5aWVTZGg4ZEZBUEhrV2RpeEdFbzY4VUs1djErcGtB?=
 =?utf-8?B?Y25WQU5oajlkVDBwZzd4eE5FL3FuK2l4WG13bnBvM3pTb2RtUVI0OXllNFB4?=
 =?utf-8?B?UlljRFU0NCt0K0VsOFpYNFFxZWRWTStzVUpHb3o1Rm5QVkRoY0lwNFpicTl1?=
 =?utf-8?B?Y3J3RHF2bzQ1Ui85MGJySllyU0ttc1VEMUd4YWEzTmYwbWtPSURDcjhvcklJ?=
 =?utf-8?B?U0Eva0hIdGVWdFhqQUhuYVpFTUxGMFV4anovb0NUcFBranZpZDZsWTUxZm9a?=
 =?utf-8?B?bzEzS1ZDZlpMVGpNcDV4Qkx4ZzBzbFFiYyt6K1VqVE92Yk9mSDd0dEQwbVcv?=
 =?utf-8?B?RkM3WkxNb0J6MnVmLzlHdGxXWkE3aW9vbC9VRmpSRURoTDk3WEpwMys5Vkd1?=
 =?utf-8?B?cDlabGU1dytSN1A4RHVpMU9tZDkxVVdGSTF4eUZnaDA4TGI4cjYycFErN1p5?=
 =?utf-8?B?cDRURFNBSTB4aVFKVU90Umk2dGJpQUNFZ0djSXRhTTFRVE5ncVdNZlBzb0U3?=
 =?utf-8?B?MHBWck9GOEFiQ2Z3THBFTG4wSW9tOFoyL0hmQ3VqMFBoVFRaa3d2aVY2eFdO?=
 =?utf-8?B?S3RVa0dVS085ODcvWVhKRFhQTkdHbzc4QmlTclZiWmJ4K1M0dmYzcXhYMHlN?=
 =?utf-8?B?UlA2ZEhRTUFDWHgza210MUFVTmtyaGJYYTNDeVNIdGNXL2FwYzBxZ1JpNTdk?=
 =?utf-8?B?c2hEL29KQzJBSU1iMTI5enl6cVN6Mm85RSs4cUR2Yjg5UTI2cXRZdHVHbzZF?=
 =?utf-8?B?RXVITmpHWmNSYzN0Qy9kcGJxZkdCSHpnSlJZY3IzenU3eXdScXV0dVYwRkhY?=
 =?utf-8?B?U1ZxV1FlbEFNSnhkais0clFwcUUwL2paUFhzd2pya3JSTURGK1JuNlF5VDRx?=
 =?utf-8?B?bmVtTmJZcWR5OE1HUHFoQ2d4bEdVY1hlSEtoclAwcFU4TXlWWHZEWXl6eTlp?=
 =?utf-8?B?c0NiS2tXTC9pNzl4c1NDK1FTRWhBZGhhOXMwRUJXWkxFNnRHeGhKWWp3dkta?=
 =?utf-8?B?eHArNlhJMktnSkNaV0dWTjEweEFGQzlyTW4zeXY4MTE3RHdobFFMcUt3QkNL?=
 =?utf-8?B?SjVBSWhDV0FDS25HeThraFIxd0tCbFBrRUNkVTZXRnhHZG5na0FqV1hYL3h4?=
 =?utf-8?B?VndDcGtQd1lhNExQN0oxVWt3YUJhRG9PdWM5NmQ0bUI5cjlNanpqTmxyK2w3?=
 =?utf-8?B?cHI3MmpOUWJBSkFyZ05aQ09Ba1FYS1JqMU90VThJUE15MlpYeC9HNzJ5MGlS?=
 =?utf-8?B?YmxzRTU4cDhRR1hsTjBlM05KaFl6VVlEUlk3clR5bWQ5ejBPcnJkN2lUUDNK?=
 =?utf-8?B?bW12cU1nelVBcGZzVy9iQmMrS3A1UXBwL3RMaVJ5c0RVQ0ZKNC94L3dkdjVv?=
 =?utf-8?B?SjUrWDIwc0p5WVhvYnRZWlJveXgrZ3FSVHVkdjFHWkJIMGc1cXlTdVRRa0tp?=
 =?utf-8?B?U01iaG13MmhtSTlYTzR3UytnbkgzTGYzZ3J1aVlGN2hJbmNqdDhVQWtkSnlT?=
 =?utf-8?B?UmpmeEFDdXBRK25qWERoNHdpcHZGeUY2Z2h2aHphMVBFSURCZVNCVUhCdGJo?=
 =?utf-8?B?WmJ0cGtrdVpOc2EwMFY0VWc5OW42S2Z1WUNXcXJXTWNxNXF1SGVCaGxRd01w?=
 =?utf-8?B?VjV6cmpBTm0zMndaQUVZSDYvUkdZckdXUTB4OGxzMTNtM0VKVTYxWjZLZDVD?=
 =?utf-8?B?U2F0c3dHWk1MZW9aUXdCS2NYRGZ5MVY5RjFjYWdQYm41bmVBM1BDbnFWZTBo?=
 =?utf-8?B?YnlvWmdnVkhmRGJieUlWOW1ydzV3UllBWWlrMVJsbUlMN3JQL1YyUkYyOXk5?=
 =?utf-8?B?SWN5anVYQVJXaTBzTjRlYTBUOU9UOEFldzY3SHNBZEdLdlI3aWZpMnJmbWVs?=
 =?utf-8?B?MGZ4b0IyN09HcFhFMU83a0J3cEhJVzVQTmx6Z2xicVFGWGpvTUl2WGJVUnN1?=
 =?utf-8?B?UVVtMWdXNG1NaTEvczVRYTkxSGk0cXRZcW14dzhYZ3kyNEhKMXRWeSt6cWY2?=
 =?utf-8?B?R1d5VDA5a3lrNXFsNmMzdnhqZHZqKzJ5elBnOFNhL1hxdS9aTGd2eWNzYjBV?=
 =?utf-8?B?SXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd75fa17-dcbd-42e2-b0a4-08dd793d13a1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 21:08:58.7059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVsf1JI00NVUlGAz9w2ygXNohk+0OpbNOhAACNfrA//UKF8O+055qjHn4BJRu4pCNfplSq3bJ5jq7p5Q4400XaRGz4f5q+JIe/CnwaZ/RJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6686
X-OriginatorOrg: intel.com

Hi Babu,

On 4/3/25 5:18 PM, Babu Moger wrote:
> In mbm_cntr_assign mode, the hardware counter should be assigned to read
> the MBM events.
> 
> Report 'Unassigned' in case the user attempts to read the events without

"the events" -> "the event"?

> assigning the counter.

"the counter" -> "a hardware counter"?

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  Documentation/arch/x86/resctrl.rst        | 10 ++++++++++
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 14 ++++++++++++++
>  arch/x86/kernel/cpu/resctrl/internal.h    |  3 +++
>  arch/x86/kernel/cpu/resctrl/monitor.c     |  4 ++--
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c    |  2 +-
>  5 files changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
> index 44128fbda4fe..71ed1cfed33a 100644
> --- a/Documentation/arch/x86/resctrl.rst
> +++ b/Documentation/arch/x86/resctrl.rst
> @@ -430,6 +430,16 @@ When monitoring is enabled all MON groups will also contain:
>  	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>  	where "YY" is the node number.
>  
> +	The mbm_cntr_assign mode offers "num_mbm_cntrs" number of counters
> +	and allows users to assign a counter to mon_hw_id, event pair enabling
> +	bandwidth monitoring for as long as the counter remains assigned.
> +	The hardware will continue tracking the assigned mon_hw_id until
> +	the user manually unassigns it, ensuring that counters are not reset
> +	during this period. System may run out of assignable counters when
> +	all the counters are already assigned. In that case, MBM event counters

Counters could be unassigned even if there are assignable counters available.

I think the "System may run ..." sentence should be dropped.
The "In that case ..." sentence could be simplified with something like:
"An MBM event returns 'Unassigned' when the event does not have a hardware
counter assigned."

> +	will return 'Unassigned' when the event is read. Users must manually
> +	assign a counter to read the events.
> +
>  "mon_hw_id":
>  	Available only with debug option. The identifier used by hardware
>  	for the monitor group. On x86 this is the RMID.

Reinette

