Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B7917FAC2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 15:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745507867; cv=fail; b=BcStUOuaeVBMK6y5vBFxpHo4Ei1phsCkquzBOmwFrf7slssCqzjzEDX0/dyssGEz2m2TZw1mEBcWs8ALfAH/16YwHcgRgea+ou3YUEOgoe54qV0ir+i+3n04j2DUJcH3vgfkyoqj1vTZ2bk1t6OtSlFdGfL48xlrPh7l5viSPuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745507867; c=relaxed/simple;
	bh=N1ju7emzRPvMNCYf3Tta6yDjUJ16svnyfZu1vIpjc6w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ufyxKPgNQFbUCvg6zcDQvM2rs+ILVfIr06H0PCFrO+E3VVtP5l80XHfrKc6L3ePDaBTPfSJzK7Sg2Mr47+9JDJzK/w3WaOy/+CmN9SARfVQmXMFhadLmYRxSP6yuexXT/p6NgLn5Hmv8sTRvwK0szJUklWDE65bNE/eT5nfV/ZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EaPehZGR; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EaPehZGR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745507866; x=1777043866;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N1ju7emzRPvMNCYf3Tta6yDjUJ16svnyfZu1vIpjc6w=;
  b=EaPehZGR+ngXxFRHRXz2tWfiKkG2N3OLv5EbXkJu1DuvukCFzVxMFsHX
   g1wYTvfHSgioG2Zk/7Z5WMNVZik0Srdv9B+2WyGD2hQL6Iai0ZM4YEdLh
   rMbfYl65okkmm4druDIAd5+/r8I6sZBoOnXOHB7qDGOV0MTZkX7NvAU3s
   pAXUBxxcRhN2dwxJSut4egTkjNhSt0gliaTw3T6It2xb1Q954loF0kuEz
   +SZxukrcVqFVXL+gKkU/CESyX3WnuhzEYJyvEhFw2bAziEnD2FZrQGohR
   Ra0QCOnVlI7yfbgtRI630NS2JVHVl5UkAvTxr6+80yg4+TOXUUwiY/YCC
   A==;
X-CSE-ConnectionGUID: a1mmzF/VRfC2L0L3XE2qCA==
X-CSE-MsgGUID: z5B04aznSC2NUmKqo/WU+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57789009"
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="57789009"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 08:17:45 -0700
X-CSE-ConnectionGUID: 3VRXfJp2Q22q1/tUvNP1BQ==
X-CSE-MsgGUID: bl3KmWewQGGj/npBukhwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,236,1739865600"; 
   d="scan'208";a="133565667"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 08:17:43 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 24 Apr 2025 08:17:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 24 Apr 2025 08:17:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 24 Apr 2025 08:17:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wMGitw1avYqrhhDl9pO9Hy7T+Ctx46c7IFg+jwY471WWW4ydSJ+3kx3Wcz/EU9PbJNcZ+TZrodIiicmHKI8SaS9dEGf0F7BVLDeC1TClRDcQDgK1FHrELRe2cinTPn/RI51jwAJ45MNvlc222hf/ciNvNJ/0Pa4+wTu8h5wAmHaL9ij41+/LATsCBjfdJwA+yqnpvzRCMt/yIqvd/+sVLelrcR+07cpDY8wbAna1m4dTQPlz4rx16LTlbQlKZUXDlMbeBmaJM1iVqc4qbuI76zyqN8sScPSAvlqX/nbTchWLnEv8yXSGe/D4wyye8b1asfyRwHDNz9KSEvdqKPQyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqlYm+lnS4DU79/ie2bZAVRJkw/mdNg9ceRpO4UK37w=;
 b=m/aFm8fNbEXWIJmxOSPL2To7wEHCXq1Lnxtrrd6DabI/AcFjWweEhpxa2oaWGbPDBX8hLhd7dGtMLYMYgpyuztz+IyyNtQ3h6FxmjQ/Vgj4WQ/mY6X/uuhX9CjzN94vLJexmq4rXw+OJFdBXrr9g+LZTgkpSs/5re9g5WBOKUhikzSj0j9VBFSk/I41+mPspEc/5dmo0vtMUgP6XmJS3thXAiKW5aiJyR3Ioajlut0kskshTDG5qmeuap0280/NSP/kSBLjfH4j7a9br/mqP/XOnpseYQQgH1bjUw5GTvKYRs/MoEdmW5otc0bgulO7bb2vdkCYuaFYWJsVCaqDAYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SN7PR11MB7468.namprd11.prod.outlook.com (2603:10b6:806:329::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.32; Thu, 24 Apr
 2025 15:17:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8655.024; Thu, 24 Apr 2025
 15:17:37 +0000
Message-ID: <c229ce2a-0890-43e0-a382-d78e975d7582@intel.com>
Date: Thu, 24 Apr 2025 08:17:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/21] x86/resctrl: Remove the limit on the number of
 CLOSID
To: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, H Peter Anvin <hpa@zytor.com>, Babu Moger
	<Babu.Moger@amd.com>, <shameerali.kolothum.thodi@huawei.com>, "D Scott
 Phillips OS" <scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250411164229.23413-1-james.morse@arm.com>
 <20250411164229.23413-3-james.morse@arm.com>
 <aa3594fa-2fd6-432f-8ae4-b4e472639e37@arm.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aa3594fa-2fd6-432f-8ae4-b4e472639e37@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0006.namprd16.prod.outlook.com (2603:10b6:907::19)
 To SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SN7PR11MB7468:EE_
X-MS-Office365-Filtering-Correlation-Id: c6e2deb5-1452-4434-a72c-08dd83432538
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlZXU01uL0g0VFF5eTlpTTNtREVQYzIzUTBhWmdpek9YK3JaazVvUTlha3R2?=
 =?utf-8?B?VGtVRm44OFVMc21MVHpZNGlkVmNkSnhONEsyZnNBTW4xSGVFODdmNDBKYnhO?=
 =?utf-8?B?bzVlbkkxOGlvamhSaHBsZVQ5UnZOT3hWV2tHL0t2RzA1Ulp5TUxta3FRQmZK?=
 =?utf-8?B?RDFpUUFUYnlxU2pGdjA2OXI2Qk1LRzhqY09HS3dQMVhMbmlrWk9MN0tMbnFE?=
 =?utf-8?B?cFhsQ01hK3hJKy9ybDkzdDE3bC9VT0FQTWpuWStXTE1Jb3NXdm1aYmRtR2Uy?=
 =?utf-8?B?R2dyOCtrSkU2UkhpcmUycjd4QndLMTAwRG14Zm9BcDlDbVh5N3FzYkhaVXJZ?=
 =?utf-8?B?SXZOelBPdDFDSisvcEVHWVhVNUZ3dFVTcXZCbmNyUHVJV3kwTE5UYlkwcjU0?=
 =?utf-8?B?MElqR0xFWnlhblU4dGppbHNXNERmZFE2aWxySi92WE5mb05DK3NTN1dZSG1u?=
 =?utf-8?B?QnhuZ1JybWFrNG9idXN1V3ZSRjhKQmsxVGhQS0liVkVIUmZLUGp6VnFBUFhJ?=
 =?utf-8?B?YW41ZmNxRTYxUjJzeHhEa1ZTY21uRHBjYXRyV05KcG9iNzJ0UXNaOCtGc1JR?=
 =?utf-8?B?T0RrMm42Zzd2cEYvcjUvSHRLR0FLd0tyQXBHaW8wUm5CcUovZ2VCVXRPYk1W?=
 =?utf-8?B?amdhcUticlBpWDhFNVltTjY1YTZIbm8xVmMvcVhQdGd2U1EybG93UGpzS3Ja?=
 =?utf-8?B?UjNlTTFvenNzNXRtUUdycVRKT1RaeWgyMXZwT1UvaU5vMFZCTE5xRFZVREx5?=
 =?utf-8?B?cThLWm5LcjhVYXJ0ZG5hbHRzUUNiN1czUWE1S25jc2lBeVhtQmYrYU5rbEto?=
 =?utf-8?B?ZmJKSEFpK1BuOXowNG5HNzVOU09ySHl4Y1ZMMTF3QVJUeHZKK2FZUEMxYlZL?=
 =?utf-8?B?RE04QmozL1V2cXBMdW84eDRncVVFSDVtVWNwc3dmNVQ2WHdUcGs4ZFR1UDJx?=
 =?utf-8?B?MXczbXA0TEtxcFNXTzE4bVVEL3Bkc3lXN0pVbjhFVUhmOXdTM2Fta3U4cUZ1?=
 =?utf-8?B?VUVsTFFRKzVsQjNDYVVBWU5KV3RuUUFST1JXVVdEaTlFR1lkdUlmSkJtbFpL?=
 =?utf-8?B?Zkw2U2FRZHpnbno3eU45Z3Z3RkRFSlNPbnRXaWl3Z2Y5ck0zMTVDS0RrdHU2?=
 =?utf-8?B?QlFwcXVqcTRNTXN5anZIVzFGcUNGM2tLUkZxdmxicytMamJ5NmJ2S215c05n?=
 =?utf-8?B?bVN5TFlMcTNBWUNxcStiWk1vLy9JUVRIK2Q2YzgzN3FDcXQrakw3OWw4SFpm?=
 =?utf-8?B?NVc5WENLWFZNMlRVcWNqV3pkdWVNbncxQUwwcytWMGdYKzhFSUsxQkgzK1RY?=
 =?utf-8?B?NWRrVDBTWXhLWThRVGxkbkwxaTdOYkg3bS8rOEowbGRzVnB5d1RCb1F5ZWZ3?=
 =?utf-8?B?QkJ5K04vZC9OMW5rclBqaGN6YTdHMG5lNDhxbVUzMFNHdVZQSHJ2TngySitS?=
 =?utf-8?B?WURkNitkbXFVMDRLYjdJc2FLRUJaZkRFd1BzNkovTHhrWUxmOUhBM0V6RmxB?=
 =?utf-8?B?RVFTU01ES3VuTkZxaXZCMkZXS2FLTWNmZTdlczYwLzhFS2Q3bUlFS3hROCtr?=
 =?utf-8?B?bm9IME9Xb3c4d0xkamhJbFN2SlRpZVYyUU5FNlNBVXNuMHI2cnhMUmZtRGxi?=
 =?utf-8?B?cmxJMGdLc1h3bkpnNUJ3cEJ0eWdVRlJnbldOYUFzUWMvVFdNblVRV1FQMC9Y?=
 =?utf-8?B?SHZ4cXV0TmVyeGRVVnkyclpuNE5WOXRkeUx5UGJBOFNsZzJIVVNFbks5anl1?=
 =?utf-8?B?cjc4UmtxaUUzeGk3dmF1NzAzY0Qwb3JYQzlxckFoTFYwUXQzTDNrMUhFczhz?=
 =?utf-8?B?Q1h6aTRMWDQrb0J4cE1xWHUzTTgyK0NGSDNCVjFvRW84dWFnUGZUd1RTcU5V?=
 =?utf-8?B?TUF0ME9vYzFqdTJNTDV0TVJaSjlHR3YvbURySjBoWktUUDk4aXo2R1FDMDAw?=
 =?utf-8?Q?wUQWev9L4zo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWlJWnNLc2E0RnhZTzhZZUd6bjVaWDdJZjBta1d1MXE3NjF2akIrd0xPTGFR?=
 =?utf-8?B?dkNZbVlzaGdqTjhER1VHa2crTXFyekQxTTdFeWNGdWduQ2JLMVRML3Rqd3pl?=
 =?utf-8?B?RmlLSjFobjhBa1ZNc1BEYnZKWDNJeElaYlFtWEROWFY1WWhtbjNjclhzRDA4?=
 =?utf-8?B?cFZIREtJZVBCY0h2SzlocitzNFZ0dTU2dUU0YmJMTjdOQlhTMWN5ZjE1d0Fj?=
 =?utf-8?B?cVp6TWxja0k0a3dLRUptR0I2aUlXYktKeGFsSEZ6M1UrTDAwaThhMC9lUlh2?=
 =?utf-8?B?TlFkRlhqRmYzaGhTU0lhTjYxRnBWSTF0Zm5DUEl4RDUvelJTLzIyMitoMG85?=
 =?utf-8?B?UlQrbS9oNDhxckZYdkZzYkllVk1tV2JiMnNxaVByV3gwMXl4d2U1L3N4anFI?=
 =?utf-8?B?TUN5SUQwSTZpZHZ1ajEveUd2dVQ0QVBVNlVnNk5oem1xOWorTEdDTVFZWkJI?=
 =?utf-8?B?bGdzRGVBODkzSnN3ZFA2bit5WlVEcCt6cnFNZDhQSmRnWUFsT2p5ZDJtUEsx?=
 =?utf-8?B?TDhrK1ozNEhBb1lCOExiZzJMZUJ4c0JUMVljazJSR2ppcitHc1BwbEpibElR?=
 =?utf-8?B?N2tlM2dYUmVLNWNPMFFiM3pzRTNRWFJjMzdPRHlPWnE0SS9DUVpDd2xsRjNC?=
 =?utf-8?B?alV0cldwaThhWFNVYUU2N3JCaks5cE1pZ015YjMwN2pkRVdwczFpREVLQnFy?=
 =?utf-8?B?TTNvVTJNY01hUWgvSzR5U2hUQWl1S0hpcDYxNzBVNGdBZTJ5eVZ0ZVdlR0J5?=
 =?utf-8?B?SXRwVDFzVDdSVlkzeUFMWHMvbVN4UnVhRnJHdVBRWXE0UFIvY0d4cFpTWkll?=
 =?utf-8?B?aCtNejdKYjQzZ05aY0FzVmhSNDl5YVpzRUhoditDcTYybWRjNTV5UHNidE9t?=
 =?utf-8?B?cHc2d2x4cVBVK0dmNDJ1VnRHZ1RvMnpnS09JdGh3RUZsa1Q5TmRuclVHL1pt?=
 =?utf-8?B?OWY5Z0xkQkFjbWovc1NjWFNtdElSUHhqTlRNYWpwaTdjaThIUzVLQVVoUDVN?=
 =?utf-8?B?WlhMQmRzQ2x3V1BpVUlYbW4ycG9oTW1UUDZPVzNkWitQUmdkR2xEMTFZR3NI?=
 =?utf-8?B?N29WbVpTaG5pT0NtRnRJU09PNXpoY0swQ09tYzJSdTltTW1UR1RiOFg3NGE3?=
 =?utf-8?B?eGsxODAvZ2g4QkxzUSswL1dXaVdXZExFODJZZEVJME8wUytmRHdvNnIxOThT?=
 =?utf-8?B?d2VpeGpSUU5HeUpXck1iUDZJa3dnSGZWcC90MXY1YldxSFlPd3BxWXV4ZUN3?=
 =?utf-8?B?bWlrNDN0d3RSR0JPQVBoM1RJWUhmd3RSVHpJbG1rUnZ2WVNaS2dJblVGdHF4?=
 =?utf-8?B?WGVWdEJZYnNnd21FWnc2VUZTcFQySmVBa0FXTEdlUWxXZGZwZ0JXSm14R2p0?=
 =?utf-8?B?NExIQ0pUeDRlbUxDTUljbW53ejJYT1NpcnlLU0EvR3o2R3ZIdWtZNWlUVk5C?=
 =?utf-8?B?VUF5SWdRNTNxZlNNcVBIaEp1SDVOekdBN3VDdXQzTUVaWGV4cHcvSmFNR3pX?=
 =?utf-8?B?MEw4NTRpR2dKdXk2c0dIOVRERzBtbm0rQ0FKbzFGZGsvL05OUTNPSTBnWFpm?=
 =?utf-8?B?dUd2aDRJQm9sK0lZSzN5UVVDNnpOOGJsZTVvbkE5MFk2SDNlRFhOQkIyYXFN?=
 =?utf-8?B?K09YaC9KWVhHRzJJT2QwcGk5Yk5nKzdlT0x0WkFNN3M0bVZ6eHpremN2YzBx?=
 =?utf-8?B?S3VlMDlHQS9HSVA5a3Fhc2huU3JTaktVak9PajU5Wi9YTlJKOUZPWW1Ebk13?=
 =?utf-8?B?bi9WQ3JSclZOcEZ0S1JqNWhLQ2ZyUjJaVVBybmFhQ3F0YlBYSkZ4cXR5K1pq?=
 =?utf-8?B?L1MyYktFZEdLdXh6Y1V2dm9RRFJLeG1wUlJ6YzZVTDdDamJCL2xYQ2lCL1FD?=
 =?utf-8?B?VkJ3bFIxMEJYLy9JbWZGQld4MTM1VHNzWU5OaDlma3BkV0VTaXIzMk9sVWJ5?=
 =?utf-8?B?cHVTdFozTmpGNkVvYmZLL2pjUjM5Q1djUDJRR0paR0N2eDR6NmFwZlM5UEI4?=
 =?utf-8?B?WnhSNTYxcGVVT0tnbUhza0ZzMGxaMDUxa2pzNkszVXh4SVB0am5GS0VmM0U4?=
 =?utf-8?B?QXloR2dyUVBNaFhMMlFvcEZ2N1VXTjNiVUMwY1huM3JSdkhxUVZ4VGc4VWxF?=
 =?utf-8?B?S0RxRXhjMWdTbFI5Ylc5TVA4NHR0VDhHd0x0clFCeGUrb3MybnlucklndDRa?=
 =?utf-8?B?Ymc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c6e2deb5-1452-4434-a72c-08dd83432538
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 15:17:37.0416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3mNN92oxepF2BPQXqKnq4qcOtd3i60MeeaziEBKxskghox9fjxtArNTn35bbmX1bOp02iV8JACcIQqsSRCMm6dwgaO8DezVRfxW6+2o2sbo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7468
X-OriginatorOrg: intel.com

Hi James,

On 4/24/25 2:12 AM, James Morse wrote:
> Hello!
> 
> On 11/04/2025 17:42, James Morse wrote:
>> From: Amit Singh Tomar <amitsinght@marvell.com>
>>
>> Resctrl allocates and finds free CLOSID values using the bits of a u32.
>> This restricts the number of control groups that can be created by
>> user-space.
>>
>> MPAM has an architectural limit of 2^16 CLOSID values, Intel x86 could
>> be extended beyond 32 values. There is at least one MPAM platform which
>> supports more than 32 CLOSID values.
>>
>> Replace the fixed size bitmap with calls to the bitmap API to allocate
>> an array of a sufficient size.
>>
>> ffs() returns '1' for bit 0, hence the existing code subtracts 1 from
>> the index to get the CLOSID value. find_first_bit() returns the bit
>> number which does not need adjusting.
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 776c8e347654..4e0308040c6e 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> 
>> @@ -152,20 +152,31 @@ int closids_supported(void)
>>  	return closid_free_map_len;
>>  }
>>  
>> -static void closid_init(void)
>> +static int closid_init(void)
>>  {
>>  	struct resctrl_schema *s;
>> -	u32 rdt_min_closid = 32;
>> +	u32 rdt_min_closid = ~0;
>>  
>>  	/* Compute rdt_min_closid across all resources */
>>  	list_for_each_entry(s, &resctrl_schema_all, list)
>>  		rdt_min_closid = min(rdt_min_closid, s->num_closid);
> 
> Platforms that don't have any controls - only monitors - will still call closid_init().
> Previously this initialised the fixed-sized bitmap, which was harmless as helpers like
> closid_alloc() are never called.
> 
> With this change, rdt_min_closid keeps its dummy initialisation value of ~0, meaning this:
> 
>> -	closid_free_map = BIT_MASK(rdt_min_closid) - 1;
>> +	closid_free_map = bitmap_alloc(rdt_min_closid, GFP_KERNEL);
> 
> Blows up with a greater than 'max order' error.
> 
> I've added a list_empty() check to the top of the function:
> |       /* Monitor only platforms still call closid_init() */
> |       if (list_empty(&resctrl_schema_all))
> |               return 0;
> 
> (list-empty as its clearer what goes wrong without the check).
> I reckon this is minor, so I'll keep the existing tags.
> 
> 
> I'm not aware of anyone building a monitor-only MPAM platform - I configured one by
> accident with one of the software models!
> 

Thank you very much for catching this.

Reinette

