Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEE31C5D55;
	Tue, 24 Jun 2025 21:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750800831; cv=fail; b=KGZp9weCQFVRmMqWOaNcuXqcfo1rpLO8y0cJIUVYhUM3O+R/1+K8thpPjlD45CYwyYGp8AOEXcenTDNsv5YmXEoP+93S7tR6nj4E6v7GmJKedw7vcnG3CfZ6eAZEhq7OARHaZc8p3MRr/3ofPLDlyuFgxRzeQ9pEzkDVNk97mZ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750800831; c=relaxed/simple;
	bh=5VlS9N4gXhKLsGcqqVQwKN07AG0DOd1BzvKtB+LUNSE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SMkeEV+tUg7vQrzePorMFVdeAyg9EFvrxsADqnSg17b89JcnZVoPxntrHX/J7CgqAMib8YIEnlkU0SLm71SExXpHhev5Ool7Ilq5uFwhvVP3asgacNF2aaz5tLPxhjOfRVrixxFsq/cUinQ2lKph1eQgZxQb/gI8s3MoxoKqVBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vye12Q8b; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vye12Q8b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750800830; x=1782336830;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5VlS9N4gXhKLsGcqqVQwKN07AG0DOd1BzvKtB+LUNSE=;
  b=Vye12Q8bekpDYYce3Q5mhKfa1s7WW3Nn7q8p3BswbmkYqQVJtRkbVYSK
   zb+uwAaaj75byGFAgstd0wZnsr+Q7+plxloh51DgTrG6U5s7VCoybUbSA
   ihlKUgnqEDfh7GDrN4yIKdeQaqGCt+g7lF0IowpIruHHYWNuSuzyuaQhv
   NsI5ZkMGQqnWIVn3AHXlWTzireelEX9G/CGl2Byaw2oykdKBvZP9Y2f1L
   7a6YOC8JPf6DausHqq4jVf0z8WyKF3fi6iBKbaKgzDXLvkfeL0fzad5Cp
   kYYXQWFOTv0aNWn5JMmXpmSeArWiEQp7nvk0FuwRTjf/I7qi7QlVyz1Oo
   Q==;
X-CSE-ConnectionGUID: MnWboi4GR2+3Pp083ydPKA==
X-CSE-MsgGUID: 8zV2DVkwQwaubRVHf0jZnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63659131"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63659131"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:33:49 -0700
X-CSE-ConnectionGUID: rpjII0glSrWp6R/KMP1Rug==
X-CSE-MsgGUID: 67CfCxcySqivLEF+Renl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152322225"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 14:33:49 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:33:47 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 14:33:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.47)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 14:33:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RiykHfnmwV0akr8A7gm5ydhCS/Bodfddxjwk0LAkE7LwDYcMLHU4wC/y+Rw3hLoBj7jFX10d8aaTwbpMHC1DLm8Ratd1B+riVNlc49adZbhk5iGYNP/iSNdP3bW2L6+zVRrT3GWHTf+LDBjrQGf+lvvz2afItdH9yWIdljTPjd06/FWWJGv8b103ItrFDfJnZdZ4vD6ypK0S6vDGkwFLRHVw006WeUYxjEkh/qA1Ia/PL4DQQ6SCXsgk6NRN7L+kLSqceZ3oigg+GVfA/lLio24c7CFLqRUJKGUbcjEpgbGkHRAJ2VVCpiR/G0GdDLOa1PzUS08X9F3okA9Nsxzy5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfbAb7VcWmBOkY0Jdo1MA0DqQSPYj0I3oxz03aB4ugA=;
 b=PoGFFCO8YPLeoPZkXj9fdh1V+grdbva68edD4usnp0S/tW9V1CcHteTdwPCF8XWtopxdAgCGUiYUSIMAXtLwmXlBBr7TQ2C4scHlmrsClFhio6Ps2iOL7gona044Txkm9fUElHyDShArUyIYviv1ExyO69q0W4k8za6FibLm76hSFBslwM+WfAgFbQiCnpZY39Ii+VPIAN3hvcGpMAHa8I0tXhHSfkEfx5VMLwI0Jd2wATzPRTyWuNT2qem99uD0+ZqIBvlm82UIV8UY+0h926gu5jxud0L9X3gzQAMQn+D1dm2zY/+EyriNtxpRjF82ohG9CSqEsbQySPzFdlW3DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7629.namprd11.prod.outlook.com (2603:10b6:8:146::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 21:33:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 21:33:44 +0000
Message-ID: <d4ecf9b2-0fc1-4431-be7f-ddb73b530e3a@intel.com>
Date: Tue, 24 Jun 2025 14:33:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 09/32] x86/resctrl: Detect Assignable Bandwidth
 Monitoring feature details
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
 <31b14155abb7a66aace3dabfa4cc481bfd9e6647.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <31b14155abb7a66aace3dabfa4cc481bfd9e6647.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0208.namprd04.prod.outlook.com
 (2603:10b6:303:86::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 5487e20a-e443-4d29-c96a-08ddb366cbd6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzVyMlYrcjc1VmxyRXlORWc2Tmt5RjJaMFlBQUdsY2crcmI4OVREWTlVTUhR?=
 =?utf-8?B?RUJzbnMrMmtoSGkyQ3Era1FBMko0QjNKeGs2UnRYYlp1V1lqR3o0TXRQNDVt?=
 =?utf-8?B?Qk03NHcwcXBDcHVmV3M5NWxUZkVLT1V6UWlaWThaMDhaSE9IM0F4Y1I1RHFn?=
 =?utf-8?B?NEdyVDdUNEUwWTNkSjBac2pZMmtiTGtZN0wxSmI3RTMwcGcxejgwY2hQS29m?=
 =?utf-8?B?MjhXenEwVE1tb1k3RFNFK0V2WEo1SzRSQlNScU5ITEFGOWJlT203cEVxQ012?=
 =?utf-8?B?NWpZRDQxblRxN0Z2VEN2RWd2TTJrNlUxUW4yRmJiL0EyTTBqREVKZ3ArNUhr?=
 =?utf-8?B?c1N4aUpnY2VWUHR1NE9TMmxUNjVQL3h2MHFKaEJVZW1iSXJjanZWQitON2wy?=
 =?utf-8?B?d2VHYVZYb0hNNitxVTA2YlFoR2FRbmFGRVhGblhGNGVNaFM0QUFad2VUY3NM?=
 =?utf-8?B?OGdEeVNacU5Wcm5TTE52cWl0T3hhdjljYmJwSmxtZ0E1aUsvOW9Fem41QW5a?=
 =?utf-8?B?SjFJVkRXR3ZnMDdjRlRmVWJXWHdhWUw2enF0aDIwZExhaVNyM1BrdHk0bHo3?=
 =?utf-8?B?T1RiU0ZzZ21iT1h5cXRJNHZHMDZ6TGVTaGNMYmxQeGQyK3J5c3M5ZGwwRjhh?=
 =?utf-8?B?cndBRDdzOFhnWWo1emV5eUl4WDNKRDBnQnl5S1ZubmVFYjUySG5Zd3Q2SmRI?=
 =?utf-8?B?bG5MZzJaZFZmaEJaWjJlL1h1ci9QZ3BsZ2NXWFRGbjNnRC9PR002K0xJa2NH?=
 =?utf-8?B?OVA5TzRldFlRdU1FdlZ2bXgzS1BQSUduSUM4a1pTSjJobjB6dFRJT3VYNm9W?=
 =?utf-8?B?ckp6c0RDbkdLZTJNNkdmUmpoSHF5dk5DdlVLMWhjME94aXBYYWdmM3JzOW9p?=
 =?utf-8?B?ZUd2ZnpIY1JrV0tsUkRZZWMwM1hWRWJsQUpaTFozNm5qTDBTdVpsY1d5MUhu?=
 =?utf-8?B?ZW1VZzZSbGZSem1FR2FqSEVSVm91VG9XSWFPUzVObmM1THR2SkM4TkptVDZr?=
 =?utf-8?B?MXpUaG8wNUk4cEV0Y3lZTVBVeVZUaEtVaEhERlpCOXR3YmlOOHpDVHhTL2dn?=
 =?utf-8?B?SSsxNTZoU211bkp1Q0FXNlI2U0NlQUxBRmUxd2dYamZEREs5RlR6ckhHTFJp?=
 =?utf-8?B?NzdFYXJjOVcrTkZ2SER6TVhZVkpKdnVaZnFTeSs2QXZWMExROXk1UUY5UFZ3?=
 =?utf-8?B?YmFXWFRDd0R4bkYyMkdmUGRML3lxcEwxbmlMUDhzUkhVR0x0Z0liKzNNVjhN?=
 =?utf-8?B?aXN3ZjZzYld6TXJlM0Zob0IwTWRiYVJJZzhEL3ozZjJwOGIwZzJFbU1neWdP?=
 =?utf-8?B?UkdLVTByOTNaWjJWWGU1TWxIcFg3TFBlUEhDUWVKNnFDay9hR0hvSXZxc3l1?=
 =?utf-8?B?OTk0UXA1TFh3SHlSZStDMyttYml0Q1hZcHFLc09BME41S0lITVp6UStNcG1q?=
 =?utf-8?B?cTJMTjV5YU9ZdFVXRENvREZSelQ1YmNZcDVEbHFjN3IrN1J5RlcvbzhpRmdE?=
 =?utf-8?B?dkFlMjFITXBoaGhNdzN4STJSK1RSSU5CcWpQQ1UyTTRBa3JjTVZvM1U1VHZN?=
 =?utf-8?B?ZWJCVnNTOTdGdk1WcngzSTVQRHQ5enl5QlZRL3BNc1JXYlIzbVV0WURWaTZC?=
 =?utf-8?B?OVlCK0szM0E3OHBQVWY3NEFoeGp2RXU0RlJWU3lKWGQ0d3hKL1B3S0YxTEJy?=
 =?utf-8?B?RG5XenRnb2gvZWdTbEoybC9mcHRxcythYm5aa3hYSHJxYm9yL3RzTkQ4Q0F1?=
 =?utf-8?B?MW1DWXJSaGFGNktPclVtdkY5RjZDVTdadXVMaHFwY2xaOGNQaWdQR3NuYUV4?=
 =?utf-8?B?K2FwZDZjREEvNWl2VmlaZ3doaW9LVWVaUkdMd0NyU3FoS1oyQTZLTHVjRUJn?=
 =?utf-8?B?c1NoK0RrbW56Q2NPdk4xYWNLQWpuUDQ4U2VyRGFrbGVxdWZsblhZWGNUeGpm?=
 =?utf-8?Q?0hP8e3plqvI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bkRsMng1MW14dG84NlRESElKSzVMRmgvSnQ2RUF4SCtwNEl6dFg0WnVPSmRJ?=
 =?utf-8?B?dUtDZ3djY0ZoNnhwMUR2QkxjT1ZPTXFiL1hDdUtmb0VWSlN0RkJ3dHcxWDl5?=
 =?utf-8?B?azRHVkZqRWVXdkRrVzh0ME03azJVOTVaUFpmMkxnUjZVNXBnUHd3eUhtZnZM?=
 =?utf-8?B?U0phRU5jQWd2SzkwMHVoUW5nR2JadjJzZ0M0WGlZaFVhcVZtbUdINmljbFpw?=
 =?utf-8?B?TGNSK3ZvZmN4dzN2clpRWlEvSzhJZXRtalRSZEd5S3ozUkJCSklnVUlicXl1?=
 =?utf-8?B?WmI1UW9qQk55U0NSVXpkcTBjZ0xFaVBrZ1dqaUM4SFpTY2dOQ3NxS1RPZDNJ?=
 =?utf-8?B?cFlxK1pjM2hpcG5sWVh3cGQ5NllaVjlyME00M1hvT1NKSEswb3lGT0RZSjB0?=
 =?utf-8?B?Yk9CVEdhRVMwYWZpWWFaSll5OXVWVUZNRThyYUZEenRGNkdna2g2VHRSM2w3?=
 =?utf-8?B?djRTVTB0VmMxWlNnQlliWFBOZmtjRXV0Z0NvN1F1aHdIM1JVRjhwRHRRZWRS?=
 =?utf-8?B?RDRUdnRSbXVMNFBGYU85QlNxVVlNZmV6RmZDUVBhOXRTS1F1YVdPZFo1M0xq?=
 =?utf-8?B?YlNwYytveVNUTmdvUjZ0aFFYZzRTZGpiUkdBcEtnY1dJRE5rYVpPZVUwVURK?=
 =?utf-8?B?UzlJdUhEeVJyMWpGbnVhZWJIQmQvc3FjVk9ZT0Y1dE9DNWMxcVV6ajNKcllN?=
 =?utf-8?B?SXNzK0hMQUkzdEVSUVRrejJ1b2JWR2pUc2l5UVJ0dDNtak1EVG1ETWs1Wmdi?=
 =?utf-8?B?dFI2dkJJL2R0Q0t1b0FrMmhZbzcyRklKaUVLaUM5bmxQcExEN0M5TmtGOUNk?=
 =?utf-8?B?WmFCVzc1alp6QW1JRzd2UE1xWkswNXJxTzlXRnd4cC85d1pBTVJYUkZQSkVs?=
 =?utf-8?B?K0pDMXdhK1grdnFKcVJUMDJWNFpaNHoyYjdVOU02OGZYUU5IM1hHcUdIN3I4?=
 =?utf-8?B?Rmhsdll0TkxwcG5LU0YvVkVpR2dCWlRCYjN2WG91dGczaE14ZkhtVEJ3ZDcy?=
 =?utf-8?B?T2NwS2JZMEZiVFNjRll1d2krckpIRjRLMTU1WVFLMlhTSmhyVjU2c0NJeHB5?=
 =?utf-8?B?WFkzMW5BOUNEeXZEZFljalhIT0xQMDE3TG9XNEl0cmRmeG1VS0l6R09uVnY2?=
 =?utf-8?B?azdwKzU1TWVmWnNob28vcjNTd3NLcVdRT0RrVVRNTVV4ZWpHOVpiTUVMaEI1?=
 =?utf-8?B?c25JNG5rWGZQeEk1NGpMWjJmcm0zNmIyQWZQQndHc0xzRlVrQjcvOVFsa2d6?=
 =?utf-8?B?aHlzZXo0RmRWamNCRFZubVd5dzZzTUJHSzVkZWRJRGhNMWZOWERRVDVaanl0?=
 =?utf-8?B?bU9qUkptczg5TzhOZVdJeGFXeFF2ekRWRGxYQWlVZVRSbDYvN29IR0FrRndq?=
 =?utf-8?B?Q2sxeW9lY3pFOVo3YWZpMlZmeFljUzRSajJXMTZEMVRhWjlEMzlxUnU2ZTV1?=
 =?utf-8?B?N2JoalZsMEJFeCtHZmFMUUxnT2dRbjVsMGlscmYrYUdubDZFYkJXSjVNZHQw?=
 =?utf-8?B?OFhWbzV0cUE2MmJrenVLRFQrMDF1YlNrYS9HS005L0RMeTJsMkJwUkFyZDBL?=
 =?utf-8?B?TjRyOXR0SFFhNW5XOXU3TGNpeTE5TDNoMU9ZSTdKZlFwUW0xZjFtOFBxdWhj?=
 =?utf-8?B?MXc4aGx5UGRsV29ucndnNmptMEhQNzhPbW1ucmdCdmg1ZFZ4Yy82eDRtT3Mr?=
 =?utf-8?B?dGFwckI1UEVPQVFIZ09Zd3pvelB2UzlYRndHamU2Rng1clhXYWxSVXdyNExs?=
 =?utf-8?B?S3lRM0tmcnA0ZzE5bXM4TnoxY3VQajZFei9aMTZZdlRhdWhFUkVSdUVpQ3No?=
 =?utf-8?B?UDNtTHNVT2cvNHJ2Y3hGUmNLcTQ1cW9Ea2tkU0Y5TGVNMVhFakpSQmZ5OG9S?=
 =?utf-8?B?aEpacTFVbFRsU0ZGaUlqY2paRElFRjZudmp4SDVyYmpCa2FDclpZaGIxRlJ5?=
 =?utf-8?B?Z0xkdTJRWVN3N3JwV1hxVE53dzk4OHZ6U1M0SU45YkdpdWJudGg1VS9MZG04?=
 =?utf-8?B?MlNRZ08rYUhlQ21HMUVBNnNjWjN4cXJObFV3MkFJUTRaYlIrcEh4U2NJWFMv?=
 =?utf-8?B?VTdPdDAxa1UraHVhT25lKzkzbHNEd25RUkZDdFBrMWlNdndSdTYrZUJMc3FO?=
 =?utf-8?B?MFlCeEVhVzQrRjdvSTlQdEg1TDVwUTAxVk5YSUNUT1lzYVhVdFd1NmxmYWpt?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5487e20a-e443-4d29-c96a-08ddb366cbd6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 21:33:44.5567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MbMdkIo/MueIuqxTJK/qn4WMecvlgIVna2C7ypBT1ana5JwSLE5us4n3QDEnG50Rz8SFbyqUdozZ3HCSiI+S4fACJmFaBd+8piGWPlLD9GI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7629
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> ABMC feature details are reported via CPUID Fn8000_0020_EBX_x5.
> Bits Description
> 15:0 MAX_ABMC Maximum Supported Assignable Bandwidth
>      Monitoring Counter ID + 1
> 
> The feature details are documented in APM listed below [1].
> [1] AMD64 Architecture Programmer's Manual Volume 2: System Programming
> Publication # 24593 Revision 3.41 section 19.3.3.3 Assignable Bandwidth
> Monitoring (ABMC).
> 
> Detect the feature and number of assignable counters supported. Also,
> enable QOS_L3_MBM_TOTAL_EVENT_ID and QOS_L3_MBM_LOCAL_EVENT_ID upon
> detecting the ABMC feature. The current expectation is to support
> these two events by default when ABMC is enabled.

"The current expectation ..." this need not be vague since this is what
this series does. Perhaps previous sentence can be:
"For backward compatibility, upon detecting the assignable counter feature,
enable the mbm_total_bytes and mbm_local_bytes events that users are
familiar with as part of original L3 MBM support." Although, when it comes to
this patch this may not be appropriate in that this is something that
resctrl fs should do, not the architecture. 


> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  arch/x86/kernel/cpu/resctrl/core.c    |  4 ++--
>  arch/x86/kernel/cpu/resctrl/monitor.c | 11 ++++++++---
>  include/linux/resctrl.h               |  4 ++++
>  3 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
> index 22a414802cbb..01b210febc7d 100644
> --- a/arch/x86/kernel/cpu/resctrl/core.c
> +++ b/arch/x86/kernel/cpu/resctrl/core.c
> @@ -873,11 +873,11 @@ static __init bool get_rdt_mon_resources(void)
>  		resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID);
>  		ret = true;
>  	}
> -	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL)) {
> +	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_TOTAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>  		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
>  		ret = true;
>  	}
> -	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL)) {
> +	if (rdt_cpu_has(X86_FEATURE_CQM_MBM_LOCAL) || rdt_cpu_has(X86_FEATURE_ABMC)) {
>  		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
>  		ret = true;

This backward compatibility needs to be managed by resctrl fs, no? What do you think of
instead doing:

int resctrl_mon_resource_init(void) {

	...
	if (r->mon.mbm_cntr_assignable) {
		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID);
		resctrl_enable_mon_event(QOS_L3_MBM_LOCAL_EVENT_ID);
	}
	...
}
		
There is another dependency that does not seem to be handled ... ABMC requires
properties enumerated in resctrl_cpu_detect(), but that enumeration is only
done if legacy monitoring features are supported, not ABMC. Does AMD support
enumeration CPUID.(EAX=0xF, ECX=1) if ABMC is supported but not the legacy MBM
total and local?


Reinette

