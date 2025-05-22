Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7692030A;
	Thu, 22 May 2025 20:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747946681; cv=fail; b=D00vFi6pq4Twf9R6s/O4izykkBbjmz9gNQE2ze48Lr6VhhDX1NmHxPaxmMBaqzgHC6L+0h1pUbXpRzBjHZZybKSHLOfgaP7LQNiCxRBTVUAdHXBz6o7NplQsgLzsgAuf6lFW6QiazqfBQTWUPxW6qxhCMHpik+d21BkCDKwDVxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747946681; c=relaxed/simple;
	bh=LuynkmjnglFZJGbEcB8VHeNnKsa4qbHHYu8oSzjms5Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=XNGy2bdqg9OFLpHNQrJ99uTegALMQjNOspzWArgMnA88LDG1+XZd/IiEIbbOMzSylfjEXOhRRVw5pNmzWfZkNsn5cTUJ6KpM8gYEChW/Dw1G7AI5ABZ2x6d7lRkUCzgyal7dOznepLeUNesbO3uPMmM5c/n9B+ltGqJBvyRMEhQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gX5QNvq2; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gX5QNvq2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747946679; x=1779482679;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LuynkmjnglFZJGbEcB8VHeNnKsa4qbHHYu8oSzjms5Y=;
  b=gX5QNvq2nEAd2GSFcQWPSGeD8S+THfNcNZ8tMMvg8MTLXffAJYpAYbU5
   MG8QS+ErxrfvQrl4+CzcVkVs4TqRaIe115L/jF4OTU6F2NIxrfGP2Grb6
   1d4OlK7M1V2dvveOwu8uyo0iNAWylBa/0PQuL7riZGxZ8RVcumjiuKLAR
   bjSuA9QcIX08ol7mphdeVctDTwveYSjSzGmamF+IegwOeGL0RXcsGipiG
   /TQuXxm6Pz4a7HcdDjdKp0DoFTtZ6pQyukdNFUHGhHvOGL6zBe/KNIYge
   vI5dFxmCGqAMSvcM1Fsv7zhsEddaebvG4gSN82vzC3j+G5BNdrRKNqYSH
   Q==;
X-CSE-ConnectionGUID: rcxLGjDCSg6J4rEgeGTL7Q==
X-CSE-MsgGUID: KOZRyVaSTWGc0hAKPB8JVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="75391774"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="75391774"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:44:38 -0700
X-CSE-ConnectionGUID: rppDs8S/Sg+37k9BolHb5g==
X-CSE-MsgGUID: col2gBstQBWLUczhYEfOkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="145631153"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 13:44:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 13:44:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 13:44:37 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.86)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 13:44:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kSvOwT/JzHLUodXIWT9EE1FR+aso/Vg3OK3EsCy7hNd+wKLUGiSIhfToygVqFM9hb+/eERgWJJx9Hwm/NZAlUMds2T0gzRo4l6kXlx1wDAqucaca+WjLH0PlSxaH2Wfm2rd2GDzBVpOLxVyDcAnrAkS/LFEcJA3rWNRt/VQw5TJwR/KluehiWBsaBVCiVim78OMEg8bcUYqyl/GG7rlMe7vNDCN905JGYS6XDUfh3mhuql9IMIERJjK9nf9II74ckR2uVpgQtHdj6a8m4vzuVsdY6TlyduKCcNhqCojixzXIXt1FI6Q2BaJu5Vw3cI0HB821mxjy3/EtJPUJ7Ae/Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WfAc7DvG/P13G4nSuu3gxvqU/tar8uyMbu1EDE5Lq7c=;
 b=FF35Pg/H14rGy4nhgXw+6+bd0GIAPrt/+s43ta5Eklw0lL7B717H3ITzXH5umunGACZXWGZdp/wI1CWmcJpg2vbYLefMcCUNK5h5jZSSwzL6nBc0dXNGnHtHl3ZcJS26yLdolom8cM7nxh1Aw7BZFBl+8c2/rq66YYKXsXYGVeTyPJ6Gm64pkctuH/Lw4DipPOK89RacUYHsVRPoeT/ydNyuE8/L/dkA+GkpI3UqoqfuIDZTmCjmyCls9E+KmmKSpnv1XGjv3nklQ8vJM9JYPzKVRfEoZ8V4235Cqu0mgzoFCGP/gwsutmJgmhXOwxeXpGxppQDRLu66NKvELo7m8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MN2PR11MB4757.namprd11.prod.outlook.com (2603:10b6:208:26b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 20:44:33 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 20:44:33 +0000
Message-ID: <0b689e0e-7742-407e-a01e-99788eb5cbb9@intel.com>
Date: Thu, 22 May 2025 13:44:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
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
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <cover.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:217::12) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MN2PR11MB4757:EE_
X-MS-Office365-Filtering-Correlation-Id: 137116a1-50ba-45d8-6b35-08dd99717548
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmpCblZFZGM3S2oySzBrVlN6c3ByYlVWL1pZUVRoTDd3TUVIc2JyYXBJOWhM?=
 =?utf-8?B?RFNWTTlKNnJxWW1vS1ozOWwweEx5WmxESGhyUUx3NFkxYVBiZi9Ganp0dy83?=
 =?utf-8?B?OEZxTHMvbWJxUEJNN2docHJHNXJ2MytJeGFyMlRvQkFZT05ic0M5ZG5rL241?=
 =?utf-8?B?NlFFT2lodjBJbUs0Rm9HRXFBeC9iM3puejNEUzhtYkNoMjFETUxBUkoxRU9u?=
 =?utf-8?B?OVpnQU5NODhvYnBienoxVnVOUkZzYVFkNmcvTEpoTy9PMDZMZ3dqYkpKS2xq?=
 =?utf-8?B?Y042bHJmZ3lPVWxRQkFmbHQzM1hoU3J0eWVnbDM1bHJMeGl4L0tCNk9WZUc1?=
 =?utf-8?B?elBFTDh6WUhZVE11ekd3ZHlLcVFGa2lmazA2dE1ObGhxbVIyYkgzUDlMV2to?=
 =?utf-8?B?bHF3YnVUNHpFcmpJb2VETFBLUTR4YzJVQ0t0SEFhbWNza1RGaThVS1poOGY5?=
 =?utf-8?B?ZVRLWTluV1o1YjRIUUM2czZJdTBkelVmVDV0ZmNUd0RIZXljR1VxcGh5UTND?=
 =?utf-8?B?M0YyNU1GNXRvQjhJeS9UeGV3ZWI0SlcwYm90SjR6QVQzdlB6cE8zbHQ3VlBj?=
 =?utf-8?B?enFrS2lXOXE2OEkrd0xUNExaRS93dzh3UkUya012MEJ3Z3pKRTdnVEZ4YXky?=
 =?utf-8?B?MnhBOVNGNTFmK0lFeW4ySkVxc0k1ak5Bc1ZRYmVCQzZlRHdiZWw3NHBZRndp?=
 =?utf-8?B?SVNGdlBpdmtUQzhKK2lTeWVWVEc1eEt3cEdKSW5uMXZkTS96OTZ0VnBPSGJX?=
 =?utf-8?B?bERKdVNHZXdyeXhISExiMlgxVWtKRGJ2elRHVXBuR21HSVFwVjZScHhmNWVa?=
 =?utf-8?B?WjNpS0wzQVkzbzlhSkptWGdMalhNNmRtSExzMmtJS1MrcjdPbnBFRXpPRHEz?=
 =?utf-8?B?Zk5QQTdSSGM5RTY4ajFIRWM3YjJoWHdzbndPdHhnNTBRaFZ1NWgrQm4xUG15?=
 =?utf-8?B?bUFNcXNLcUt4OGJaMzBJUXcyRmgvNCtEL1A5QkxlV0JqMTNHZHVvT0syRG9J?=
 =?utf-8?B?VFRvNXRKNW1kbWtxU3d0eW5ZSHE4WlBzSVVLY3NZOTNLQjcveHcwQ0hpWTQ0?=
 =?utf-8?B?V3lLMzFtWWRwaFFVRmg2ZEUwZmRSYTJ0VUg4Vk9qb1FzL2UxN24xMG5EdGpC?=
 =?utf-8?B?UCt0aGpnWFV2OU4xalVMY1NqNDNSQXdTbm5kLzQreEtJVWFKOEs4aS9kckZx?=
 =?utf-8?B?elM0MVpHVTZXWFZzN0Z2N2NsckZPdkxqeHFzV3QyVGdOUk1LVWZWUFd6L2JD?=
 =?utf-8?B?bnoxWFJFMkhBWjRSRDY4cm1kUzBOWEZXb0pQNXoycmxUQUJmc3ljNlhNZ29s?=
 =?utf-8?B?ck1FK0VsS04vNVA1VlFHcHNhR1Q5MGRrcjFNUkIyYXlLV3V3S0M1N0QrT1dk?=
 =?utf-8?B?V2gybkRnSjFQN1VrcGRwSWUzUytnYkM1azcraU1QaS84KzJOemhmZnd0S0li?=
 =?utf-8?B?ZkkzQ2NkQmJ1Q00rYUVETWp0KzcwQkt1dEFOVkRpK012ZzM4V3NRRW81WnZX?=
 =?utf-8?B?VFdFSkVyRG90eVd1Nzh4OHlXQ2k1TWFyaThxNWxKRllrbWR5dVNUSTI0U3F1?=
 =?utf-8?B?YkFJbWFCMWlrRXFsSzhZZlJoOTRLZGEzVnRlYTE2VXJ5Zy9jR0xmNFJidHB2?=
 =?utf-8?B?Z1NGSTcyWndlMXpmLzZka1c2U1lIb3Z4TkhjajR3YUZLdHhCN0JGbGJSVzls?=
 =?utf-8?B?Wk5lY3kyUVB3eTB2VW9jUkI5RjhhV3JqOHNrMTFWZGkxK1ZXYUk5dWFKd2NI?=
 =?utf-8?B?T2xCY3hUN2duM0pWU0MwaWdNdXpvV1draFhWVWF0MHNHUGZPa3N6MWlZeTBq?=
 =?utf-8?B?WlB1VjBkV3VneE1EUzlwVDNOaWQ2THk5azVVc3dyZG94YWh1UDN5VXZDUkI4?=
 =?utf-8?Q?wUo0RD7aetTKw?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzhoUkxqOHNYS2JYWmVPTGFoZ3N1dzN5Skx0U3dVUHNNQUVnc09aajJJOVRS?=
 =?utf-8?B?T0wraStJdnJPUHBpRjh2OWxlbVRzN0Z1Y0dQVkxOb2c2cTllcDVtcVJtNWY3?=
 =?utf-8?B?Q1daMnNZdFhlY1N6S29LdmVXc1FPL3ZPS3YwN1dQbWxSMmpEMWlTMk9TTHZQ?=
 =?utf-8?B?a3R1UEJFTFc5SGE4N1VkRWY3VUNpTmFHQU5QaWM5VUt3VzZyc1dSd3Babk80?=
 =?utf-8?B?dUNFa1EvS0hOTEdORFJPWGVRWE5VaytteVhHNWpmN015M3pMa3Q2Qzd2cm9k?=
 =?utf-8?B?U1NGR0dTWGErWHptMTVHSXpWL1NTb2x2ekRkVXlYZnVjN25lNkFYWEpXU0pM?=
 =?utf-8?B?WmZvZmVQVEZSMk9EdXJXbUJvNmprLy9mR0k2TDF2MTNPb29veDhrMGFrcGVG?=
 =?utf-8?B?UXFtYzZzbjcrbG8wREJQTytGUHh3UVdMRWcwSzFRbkFJRGRaTnNucjBvaGkv?=
 =?utf-8?B?bExSQnJTSDhLSFNCWTk1ZXBzdWVSZ0xKVDFqTHVHc0NadTMwUnBxQjRFUXJL?=
 =?utf-8?B?WlhOMGpDaGZVa0xMSGpVQkxONWpma3hJNk1iWndTTEgvVTlkcUhJeDhpVXo0?=
 =?utf-8?B?dEFsY28xUWVpdWdrWnlzb2ZJN2RtYVRtdGgvRXJVL1gzR3I2dTI5RnRGVUJK?=
 =?utf-8?B?Y3FsNU9rOHM3N1ZkUXE1RXp2bHc0K0IrNm03T3cxVk9EYjJ0MU5OVDhWMHNr?=
 =?utf-8?B?dDhQcU1yVlZ6ZStiRFd4eXptRUE1dWZFZlhGd0ZzMng5S2VNcHFjS2I5UTM4?=
 =?utf-8?B?OC9lWmsycHZaaWd2dWdJNnlteXJrR0N0QWxoclBYbjFXTVhDbHIrZG0ySFRE?=
 =?utf-8?B?dVRKTktuZGkxWUJsbTU4d09xT0ovd0VVU0kwRE9BcXc3Vm9nTVpFYUM1eFhC?=
 =?utf-8?B?MDdmbVdlcCtXZVlrRUtPakh2TEtHRk9NSWFUUkY1QnlVZDhIaklPaHhMS1Zu?=
 =?utf-8?B?ek93S2wwUmc4K256RXhDd2hOSFIxRUJyMlRlZi9JN3BmVlZ2TkxpV2l6QjVO?=
 =?utf-8?B?VCtSdlk3OGpEWXdtUEZDTWppampoVER2YUxCcGJJZG96b203SFdVRDlWcnRJ?=
 =?utf-8?B?Mm5uajdMWHl5UCt6azVuVGQzVFhtL0t3TWtsbnZQaW5hOWlTR3FndzEyWFNy?=
 =?utf-8?B?dlh1REpPVmt0L3NjcmQvY3I2dXBPQ1Q2SzBXczh6UTZiaHhqUWlicE9wUml2?=
 =?utf-8?B?Y3oyeXM0dkF5NmRFa2Rrb0RRdG4xZXpTdlhjUzJORkIrTkk0Q3luWXhPWmJH?=
 =?utf-8?B?S2Nmb09CYVhwODlTSkxPa1A3c0x5RElsZFBsSk9PajZERU9xMU9wNlhsZFZV?=
 =?utf-8?B?aUU1UFFTakdmclUwUUE2WlA1U09jOUcwYTk0WDNDaHBHU21DWFVTS2Y2bXZm?=
 =?utf-8?B?bDJEVzdyTEdkejFqTXFnVk56WDBXZ0JDV3dZVllmNGZseHNpMWdDVzZNOGJv?=
 =?utf-8?B?U3R5cVB3aVhvMEg2ZUc2SElyMUxBOGV1NWpFR280MlhVQWVDRmlzTUY2K0Q4?=
 =?utf-8?B?c1U4V053RExYVStjZ2MvNjQ2UUI1TkQyVHJkclRjSWV0c2VGZzByQTh4STZM?=
 =?utf-8?B?ZTlkMjZFTTNWeWFvdTgxV3JWbnk1RUVsMVEyN2lhcHFxSG4yblpaMGo5YXRq?=
 =?utf-8?B?UzNnMENFWHVRUFpUdWovUUlveTc2aCtqc0RoUTM4WFJ1UVdTVVI2MUY1M3pE?=
 =?utf-8?B?U1NwQVdKVmQrT3VtdHRlajM4ZEgrd0JDbFVsY09YTWxsVUFhK1M0VXZJZGxI?=
 =?utf-8?B?QXlCeWZEQ1dET0prbVNhV2xNOXJsNGxtOVUvT0dBY0Y4ZTl4ZFZ1dTFiR2Q1?=
 =?utf-8?B?ejV5RGJUVkF5bHpVNXRBdTkzTzhiTFowaGpsUnEySjFZYVJEWWhUWXd0OXdH?=
 =?utf-8?B?bXRyNlNlR3lMWDNlS01vUVpTWnUzVlRSZWNWZzFFVVFVSnB1ZG5OVzhFN2JV?=
 =?utf-8?B?TnNUb2g5TjhCVUFUeldURDlwZDlZT0hlcGp4Q0RTRlEwU0VsWk1GZmd4YUp3?=
 =?utf-8?B?NFdwVW00K2tJcEpNV2JwUExMRG1FTEZZMXhhZXd4TkdXVkN0VjJkemdMcnZI?=
 =?utf-8?B?TWxKZzdxQUxlcllVK05oY2RzOVZqdjB6a0o2MTkxRFQ2ekU3cmh6SlBkbTNv?=
 =?utf-8?B?Y1dPc3VLYVFlenpaN0hDOEtKa0d6WDdqVGJYL25wMzFxYm9LRUpGcWxDWFcz?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 137116a1-50ba-45d8-6b35-08dd99717548
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 20:44:33.6174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXXvatDtIOhjV8DEhTaVCPnNGwBsFEMLGb7bE7vAeR+6UWQd81+lxzk6yul5ZhHzRrSTJrBQFxbTrpEbX0PD2Pu8opADNcCtj3JSv7hLv0w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4757
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> 
> This series adds the support for Assignable Bandwidth Monitoring Counters
> (ABMC). It is also called QoS RMID Pinning feature
> 
> Series is written such that it is easier to support other assignable
> features supported from different vendors.
> 
> The feature details are documented in the  APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC). The documentation is available at
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> The patches are based on top of commit
> 92a09c47464d0 (tag: v6.15-rc5, tip/irq/merge) Linux 6.15-rc5
> plus 
> https://lore.kernel.org/lkml/20250515165855.31452-1-james.morse@arm.com/
> 
> It is very clear these patches will go after James's resctrl FS/ARCH
> restructure. Hoping to avoid one review cycle due to the merge.
> 
> # Introduction
> 
> Users can create as many monitor groups as RMIDs supported by the hardware.
> However, bandwidth monitoring feature on AMD system only guarantees that

"bandwidth monitoring feature on AMD system" -> " the bandwidth monitoring
feature on AMD systems"? or "the bandwidth monitoring feature on an AMD system".
Not sure.

> RMIDs currently assigned to a processor will be tracked by hardware.
> The counters of any other RMIDs which are no longer being tracked will be
> reset to zero. The MBM event counters return "Unavailable" for the RMIDs
> that are not tracked by hardware. So, there can be only limited number of
> groups that can give guaranteed monitoring numbers. With ever changing
> configurations there is no way to definitely know which of these groups
> are being tracked for certain point of time. Users do not have the option

"for certain point of time" -> "during a particular/certain(?) time"?

> to monitor a group or set of groups for certain period of time without

"for certain period of time" -> "for a certain period of time"?

This series contains many duplicate snippets. When you update one, please
check that all the duplicates are updated also.


> worrying about counter being reset in between.
>     
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it is
> assigned.  The assigned RMID will be tracked by the hardware until the user
> unassigns it manually. There is no need to worry about counters being reset
> during this period. Additionally, the user can specify a bitmask identifying
> the specific bandwidth types from the given source to track with the counter.

Instead of tacking it on as an "additionally" I see this capability now as essential
to this new implementation. I tried to give this series a thorough review to help finalize
this work but I kept being turned around by all the descriptions and finally it dawned
that all the descriptions are at their code still based on the original "event ID"
based implementation with either a small append or as little change as possible to
adjust to the "extended event ID" based implementation. 

The previous implementation still used (and copy&pasted many times) in these descriptions
as "assign a hardware counter to an RMID, event pair" can only be accurate for this new
implementation if an event is re-defined ... it is no longer the original constrained
"event IDs" but instead an MBM event has become a generic name that identifies the
configurable "bandwidth types" (but, see note about terminology later) to be monitored. 
This is never done.

I assume "the given source" is the assigned RMID? If so I think it will help to
understand if this is specific: "bandwidth types from the assigned RMID ..."

I find this series to use several terms for the same concept,
for example, "bandwidth types", "memory transactions", "types of L3 transactions",
"bandwidth sources", etc. This work will be easier to consume if it uses consistent
and specific terminology.

> Without ABMC enabled, monitoring will work in current 'default' mode without
> assignment option.
> 
> # History
> 
> Earlier implementation of ABMC had dependancy on BMEC (Bandwidth Monitoring
> Event Configuration). Peter had concerns with that implementation because
> it may be not be compatible with ARM's MPAM.
> 
> Here are the threads discussing the concerns and new interface to address the concerns.
> https://lore.kernel.org/lkml/CALPaoCg97cLVVAcacnarp+880xjsedEWGJPXhYpy4P7=ky4MZw@mail.gmail.com/
> https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/
> 
> Here are the finalized requirements based on the discussion:
> 
> *   Remove BMEC dependency on the ABMC feature.

Even stronger, BMEC and ABMC are now "incompatible" in that resctrl will not let them be used
at the same time.

> 
> *   Eliminate global assignment listing. The interface
>     /sys/fs/resctrl/info/L3_MON/mbm_assign_control is no longer required.
> 
> *   Create the configuration directories at /sys/fs/resctrl/info/L3_MON/counter_configs/.
>     The configuration file names should be free-form, allowing users to create them as needed.
> 
> *   Perform assignment listing at the group level by introducing mbm_L3_assignments

"the group level" -> "the monitoring group level"

>     in each monitoring group. The listing should provide the following details:
> 
>     Event Configuration: Specifies the event configuration applied. This will be crucial
>     when "mkdir" on event configuration is added in the future, leading to the creation
>     of mon_data/mon_l3_*/<event configuration>.

hmmm ... sounds like it has become more natural to refer to it as "event configuration", which is
a good match for what the purpose is. This thus sounds like good motivation to change "counter_configs"
to "event_configs".

> 
>     Domains: Identifies the domains where the configuration is applied, supporting multi-domain setups.
> 
>     Assignment Type: Indicates whether the assignment is Exclusive (e or d), Shared (s), or Unassigned (_).

Could you please add definition of what "exclusive" and "shared" means?

> 
> *   Provide option to enable or disable auto assignment when new group is created.
> 
> This series tries to address all the requirements listed above.
> 
> # Implementation details
> 
> Create a generic interface aimed to support user space assignment of scarce
> counters used for monitoring. First usage of interface is by ABMC with option
> to expand usage to "soft-ABMC" and MPAM counters in future.
> 
> Feature adds following interface files:
> 
> /sys/fs/resctrl/info/L3_MON/mbm_assign_mode: Reports the list of assignable
> monitoring features supported. The enclosed brackets indicate which
> feature is enabled.
> 
> /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs: Reports the number of monitoring
> counters available for assignment.

Please aim to use consistent and clear terms to help understand this work. It is
confusing that above uses "available" in description for num_mbm_cntrs and then below
there is a new interface "available_mbm_cntrs" that uses the "available" term in name
but not description.

> 
> /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs: Reports the number of monitoring
> counters free in each domain.
> 
> /sys/fs/resctrl/info/L3_MON/counter_configs : Directory to hold the counter configuration.

Everywhere else seems to refer to this as "event configurations". Please just stick to one,
"event configuration" seems most appropriate.

> 
> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter : Default configuration
> for MBM total events.

I think "default" should be dropped to make it clear that this is the actual configuration
that is always used, not a static "default" that may be used in "some" circumstances.

> 
> /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter : Default configuration
> for MBM local events.

Same wrt "default"

> 
> /sys/fs/resctrl/mbm_L3_assignments: Interface to list or modify assignment states on each group.

"Per monitor group interface to list or modify counters assigned to the group."? (Please improve.)

> 
> # Examples
> 
> a. Check if ABMC support is available

Please drop the "ABMC" from all the descriptions since this is intended to be a generic interface.

> 	#mount -t resctrl resctrl /sys/fs/resctrl/
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	[mbm_cntr_assign]
> 	default
> 

I believe the naming has been finalized in
https://lore.kernel.org/lkml/7628cec8-5914-4895-8289-027e7821777e@amd.com/.

> 	ABMC feature is detected and it is enabled.
> 
> b. Check how many ABMC counters are available. 

available -> supported? This will help distinguish it from the
next interface file named "available_mbm_cntrs".

> 
> 	# cat /sys/fs/resctrl/info/L3_MON/num_mbm_cntrs 
> 	32

Please update to reflect what implementation does.

> 
> c. Check how many ABMC counters are available in each domain.

"available" -> "available for assignment"

> 
> 	# cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs 
> 	0=30;1=30
> 
> d. Check default counter configuration.
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter 
> 	local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
>         local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
> 
> 	# cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter 
> 	local_reads, local_non_temporal_writes, local_reads_slow_memory

Does not look like this matches implementation wrt spacing?

> 
> e. Series adds a new interface file "mbm_L3_assignments" in each monitoring group
>    to list and modify any group's monitoring states.

"any group's" -> "that group's"

> 
> 	The list is displayed in the following format:
> 
>         <Event configuration>:<Domain id>=<Assignment type>
> 
>         Event configuration: A valid event configuration listed in the
>         /sys/fs/resctrl/info/L3_MON/counter_configs directory.
> 
>         Domain ID: A valid domain ID number.

"A valid domain ID number" -> "A valid domain ID"

> 
>         Assignment types:
> 
>         _ : No event configuration assigned
> 
>         e : Event configuration assigned in exclusive mode
> 
> 	To list the default group states:
> 	# cat /sys/fs/resctrl/mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> 	To unassign the configuration of mbm_total_bytes on domain 0:

This unassigns a counter, as opposed to a configuration, no? How about
"To unassign the counter associated with the mbm_total_bytes event"?

> 	#echo "mbm_total_bytes:0=_" > mbm_L3_assignments
> 	#cat mbm_L3_assignments

(May help to follow if the examples consistently uses full path.)

> 	mbm_total_bytes:0=_;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> 	To unassign the mbm_total_bytes configuration on all domains:

same wrt unassigning a counter

>     	$echo "mbm_total_bytes:*=_" > mbm_L3_assignments
> 	$cat mbm_L3_assignments

# prompt is usually used for administrator and $ for user without
administrator privileges. Switching between # and $ in these examples 
is confusing.

> 	mbm_total_bytes:0=_;1=_
> 	mbm_local_bytes:0=e;1=e
> 
> 	To assign the mbm_total_bytes configuration on all domains in exclusive mode:

same wrt unassigning a counter

>     	$echo "mbm_total_bytes:*=e" > mbm_L3_assignments
> 	$cat mbm_L3_assignments
> 	mbm_total_bytes:0=e;1=e
> 	mbm_local_bytes:0=e;1=e
> 
> g. Read the events mbm_total_bytes and mbm_local_bytes of the default group.
>    There is no change in reading the events with ABMC. If the event is unassigned
>    when reading, then the read will come back as "Unassigned".
> 	
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> 	779247936
> 	# cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_local_bytes 
> 	765207488
> 	
> h. Check the default event configurations.
> 
> 	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_total_bytes/event_filter
> 	local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
> 	local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
> 
> 	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> 	local_reads, local_non_temporal_writes, local_reads_slow_memory
> 
> i. Change the event configuration for mbm_local_bytes.
> 
> 	#echo "local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads" >
> 	/sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> 
> 	#cat /sys/fs/resctrl/info/L3_MON/counter_configs/mbm_local_bytes/event_filter
> 	local_reads, local_non_temporal_writes, local_reads_slow_memory, remote_reads
> 	
>         This will update the assignments where mbm_local_bytes are configured.

"This will update all (across all domains of all monitor groups) counter assignments 
associated with the mbm_local_bytes event." (Please improve).

> 	
> j. Now read the total event again. The first read may come back with "Unavailable"
>    status. The subsequent read of mbm_total_bytes will display only the read events.

Was this intended to be example of reading *local* bytes after modification in previous step?

> 	
> 	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> 	Unavailable
> 	#cat /sys/fs/resctrl/mon_data/mon_L3_00/mbm_total_bytes
> 	314101
> 
> k. Users will have the option to go back to 'default' mbm_assign_mode if required.

"Users will have the option" -> "Users have the option"

>    This can be done using the following command. Note that switching the
>    mbm_assign_mode will reset all the MBM counters of all resctrl groups.

"all the MBM counters " -> "all the MBM counters (and thus all MBM events)"? 

> 
> 	# echo "default" > /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	# cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
> 	mbm_cntr_assign
> 	[default]
> 	
> l. Unmount the resctrl
> 	 
> 	#umount /sys/fs/resctrl/
> ---

Reinette
