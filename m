Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBCD17B506;
	Thu, 22 May 2025 21:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947803; cv=fail; b=Hj6eOhxNZ3H3lOdQdildK9LEILUVrUIQF+3VmQdfLTGC1XBbeGG/G/3EK1wLNdxD6zi9O/6M2x/BDExw5bPgDSs/6xCfl6uMkPDtyWLpUgnkW+pw4OKjfCTtnXxVEHF8pkI5dg1gs2jEYKtg/JjMcZBVvyR1Dt2Mh3SdENum1OY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947803; c=relaxed/simple;
	bh=kSiPw1k7se4v1AabZ0092+ZIUFwwi9lJBxhLEUon6FQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C53WVuDUpxTUj0J21ljatGndcpur/scnpRlVe4A+84rMZCcrGPkpJ09uSdpcJrqdGO8AM3FmbMVKdQLLW1XGwpXxji/jvsj754OKjFR/vDz/O85NVuFaLI8vHXzGSMWaRTjKNADBrmmdJhdd1t6+FwG6eRsEsHs4Z8cpJNXUt6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8CUSzQb; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8CUSzQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747947801; x=1779483801;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kSiPw1k7se4v1AabZ0092+ZIUFwwi9lJBxhLEUon6FQ=;
  b=b8CUSzQboggqFFrZ6HMzlcU7B5ysVOkB4JTPWczpIYu/CKgNrE1EYTiU
   3jDR8Q1snQ4DQnBkIQ10C4dd9bm97KWc3wOBLNkAqj4hr+GRZ9uXgAiQ+
   hk+ckaee7xrxe90lioi/bCZLRTCE9gpIaPi6GEEQUm+wyQtAEgZJDdwho
   4c//Bxz2BnupPLjfizwml+ew4PAJx23MjRNEpjuT3XFOqnM2dHZFGWX9l
   E8fP/nX31QPfEMDP12G7MW05tJCD+VVdz2rqSRQvC+BhAbPLsCqprPsIF
   GUKifz9g62Ici0GaFfQsCDU1RWLLcvZbI3gjE5sG6KNIyVUvzL/LxHeKT
   Q==;
X-CSE-ConnectionGUID: 0g8CRCsQT7ypeRvObMtZmg==
X-CSE-MsgGUID: 4dl0L1lETEGtK3KOS36ZzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="49914305"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="49914305"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:03:20 -0700
X-CSE-ConnectionGUID: MnSHvR4xQQG7HyYk1z7LMw==
X-CSE-MsgGUID: 4QUiv4IbTq6774jSvGX2xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140652125"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:03:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 14:03:19 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 14:03:19 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.54) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 14:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZB4Mi6YoVrTd46R3GGgs1G1VpIRbN7n53Q6/R2Gi4eoUaXNDMCPZZ8BykQaBf07Pk2NC0b1qiC3jC/Stspr9g8HLX8B8y8XLwhZF+VGKqlSmAontWZm6Pk6WieZwOviwh7RFvuvLqryDtA7HkoiHiXPfUlCbKZgLbj9Iu9dOqPwz/+VgUPBZaqfy12ELA9bbQq3jIZNhvCL6WmGZAFQZZnfUmr8e2HhQ7U3v6e1iKGTHcPvY2F9/lU3j3YJFpHj5VCwNtMjljWiTbRmjt6T7zPBxmEZ+f2hhSteLBdFY/7yQOF19WiaGcvMxYsbg4Q/vyAcTAZJr6hBl/ryb4JkvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0iUFi6FKNOUvn2oQ8vWf1P4UDMXVLN3gYguVY3gULWQ=;
 b=suLVj7QNdgiRnuLdryTSUakhbtqEjt16mgRNoUWOb8334AypMJLarR6BQR3efbCwu8JELDxBPm+aPyOAhYzEheHocbY8HDo8EUHaaiFPI7lcbG7SsiO2d4txqjM19+jdgrQznNMVEzZ2Hs4+x/Ou1cpaS3L38nGYi3lSVcoLkbgcnHOE2nLiy6KQFhMpzBzdL3YTccWV7m+KeOVskoCGuZ+EFX2qje/Sv3axX7tNegOa6EqheVlZZkVNF4l2l2OxNHF6VPyeHV3tNiqkih8mV8/V2Rbig2H6bD61sZMGYUH45jFIsEr9tw23rZPJ/jM5m1JulrWdO3KDjPaE64T38g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 21:02:43 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 21:02:43 +0000
Message-ID: <5636898e-78dc-4eb1-b226-ced62372e09a@intel.com>
Date: Thu, 22 May 2025 14:02:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 08/27] x86/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters at domain
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
 <79efa13654a6f1a308622bd13e0d2bc21ffb4367.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <79efa13654a6f1a308622bd13e0d2bc21ffb4367.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0018.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::8) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: 45a87d79-1fa1-401e-b2e8-08dd9973fe98
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGJLcDFNMGlieU9QSWlvbE43OWRtQTFhZ3Vydm1xU2FtdHN4NzRCWlRXTnVi?=
 =?utf-8?B?QUZYVzVyblNKUDZ4NndXcElBTWFFUTRWNTg3dEZOclQwaXUzb01wdG9la0hO?=
 =?utf-8?B?VkkwVlI3ajlZVUJKMlhvVVBRTkZRNEdxRGhIc05EMWtDb2k1N080dllxZ0dz?=
 =?utf-8?B?ajZ5K2FmOHRvREs1V0JkYXpjVTJTWkIySStWZ1doamwyRWlpZTFIelZWYitY?=
 =?utf-8?B?Ylg0eHN6NnJqSU5wQjdhYWgxZXpva1M1QVVSR0lLVWRITmpUTWdVZ1Nkb085?=
 =?utf-8?B?NWd4dklQbk9uckpuZFF2M3dpbFJMZFhnNngzVW9LR3hYNG9WVlk5aGlPY1Nq?=
 =?utf-8?B?T2x5aFFtcnNOVWI4L0ZKd1c0TG9iYlNNVFdxYWZjc0U4bTJIWHROeEVpS1ZI?=
 =?utf-8?B?NlFqNVlHSGFuUzRXQmtPWWg1ajJBZHdORWh3c2hUQzViejlzZ1k5c21yWlE2?=
 =?utf-8?B?eU1Vd0JnRGpBQWt1eVdlMGpNTlBvN05DMEhSdTJBR2dxalAyd0hiYmtkKzFh?=
 =?utf-8?B?SUZtU1N4R29mMllicXJ6dFBDVkVwVndDVUJxR0RBRUVEMHlmQzA2M2xTeWN2?=
 =?utf-8?B?N3dlNlgxejdJV3plTExDN2ljZkg5bnNmTGhVWWFFaUdBdEZjVGtHaG1aTGhq?=
 =?utf-8?B?OGtHc1pTNlhNNUZsMUY4cTAvWDk0MFBxZDJkaEdKL1IwY081cmZOMWE2OXlu?=
 =?utf-8?B?MWNiUkFzd2lzdDU3RlZCTmJXQmxpdnJrVWMyNERNN3ZqSjNieXhtN09CNngz?=
 =?utf-8?B?c2Z2K0FTMUQwaHViWTZ3NHVSY0twcENSQk8waEhOSlA1bXM5RU83cXlGL1Rx?=
 =?utf-8?B?OVBVYW5pUHFaazdDV25NQi82UGtWVEpxNlYraWJWaTI3M1M0ZnpWMEIrYmlF?=
 =?utf-8?B?dFBPVWY5K2NXZkljRC9OUTF0c3FJRTl2OWFmbnQ5M2swODZWZ3JkeU1RN2Q1?=
 =?utf-8?B?QXo2Z2d5MFBzaW14VlBpYTRHdFc4T3AremVaaHdCaGFwSEoxdlFXYjZDVFM5?=
 =?utf-8?B?ZGQwMVFVcVpUbHVyZ2FueTRMYlNQNWpubkZCa1ltT1V6TzQ5MVpkWFRVUGtG?=
 =?utf-8?B?TU1jZStXSjZSY0FZcWx0d3pRVDhuWWxKU0Z2aTBlWCt5SEJkQ0h6cmE5Rjk4?=
 =?utf-8?B?anBibk5zK2svQWNzRVR3MWFTczNNNWRaRlBjb05uZS9rZkIvSWk2M0o3THdI?=
 =?utf-8?B?U3BIWisxckIyeXl6VEphN3ZsTlB1WlIrb29yMDc5dW9vclA4U016Mm1TQ1I4?=
 =?utf-8?B?aU9zZzVOVkk4ckt5cmRVbC81QkV0dzNxMVJIMS9teWNabzFMNVdoQTc0cVVF?=
 =?utf-8?B?S3FuaXVmYjhHMUEyY2Z0MkhLdmJzcThySnI5eUdXZW9aRmdkUncxYmxoTHR1?=
 =?utf-8?B?QnRGVjg5cVdGZkhGM2J0MDdwTWNEZFVLUVBITUx6dnRqRm1sZEhjNTM0RzBo?=
 =?utf-8?B?M0xHUEh4Q3VTYzlwRHBKWWxxK0FHSVJDS1NIZU1WeDlPSW0wU1JWQ3BFWEJO?=
 =?utf-8?B?VUxiekd5MTVMODkveng2SjJlT0pzQ1FNYW1UV0RTamFvdmY1anBZaW05SFBI?=
 =?utf-8?B?NEIxV2pDb0dORVRzR2dqa0xVRGNObE5iS2UzR3lCeGNnRjhReWRWM0ZsZ0pE?=
 =?utf-8?B?RXpVc2x0VzNKeVdGN2NHc2xvUWFiUnovS1NmdkZYT1d6cjl2bnZ0Z0g2ZmNv?=
 =?utf-8?B?dWErWmtoZVlrY3J4RkJ5cEtYTEtreHlJSEs5b2k2bWhNWjJ2RVpjMzZnS2Jq?=
 =?utf-8?B?WFFQWlRMMXJUdDRiclpjU1N2a3ZaajE1dUpyUXVzWmFZdy83OUd4RlN3c2NQ?=
 =?utf-8?Q?qmGzomLbSe17LIRQVvb1yF6eBF8s6IbHAm7zM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VytEMVkxaDJWMjVLMnVFN3o0ZWhMVll5NzY2aFowNk1SSkU1TW1OT3ZFMnNu?=
 =?utf-8?B?clFpU0hla3YrZU5BUWN2NjNPZjlwcVplbzRRbmVtRmRsYm9Vdk5Xa1dZa2Rz?=
 =?utf-8?B?Q0dqZUVEQkNkMXJOK21QeTBBRVQvMDY0NjBhTkNSVUdTUjZLaW1ZQ2laNm5C?=
 =?utf-8?B?bXQvdEQvdjJidHBteHBvRFY0MENCSElzZUhnbXJkMzBrbWRoVXlDR2t1MUMx?=
 =?utf-8?B?c2xBcUpUdXFmL3NYQTExWUxDWFlLMzVENW1JYWhoYkhuY2dvS2U1cm1DVkUx?=
 =?utf-8?B?UXRPTGpTeFo1MW1xZnBJUm80ejlyQU9XZlhqcWEyRndSYlJZUDdodHREcDhp?=
 =?utf-8?B?OFNaWmM4R2s4cjZOcHBjMjRRdllJYjBlbVZrK2E0cGdXTWVNQlMzSzVkN2or?=
 =?utf-8?B?QWhtdlc4bE1EOEwyQVZCOThOTmo4Vk1YeTA2SE1GcVVPME04WVhXTlBEeEdk?=
 =?utf-8?B?UE5BYm5FNkZQSGptSk5xR3pBZ0lqL3pwdmZ6UlBySC9jUXpCZ1hnOUtZYkti?=
 =?utf-8?B?KzAzVG5MUkFHMmVFbEdiMWJFNlNaSGgrTFcyNDUvbUNhZUp0bFpSSEtVYnJr?=
 =?utf-8?B?cVFiVmtOSVhsZXNhYktpSm1xbVlTUWpKVHpTL3RYNFhmbzFCU01UbG5EZGpr?=
 =?utf-8?B?WVppYXVvWFlUajJ2V0VFMTNLVkdyUGhnbmx1M3FESUVvL3BhTWV3OTVheGxw?=
 =?utf-8?B?ZnY2MkRhNi9xN0svRFc4cTdtWm9WRWI3Y09tOWh4cndVZFFwWlp0MjVPRFl3?=
 =?utf-8?B?dEhFRnFvUXROY1dnM25aTkdpVUN0R0czYTR1bkVXWVd2dm4vTnFiNTNYdFQx?=
 =?utf-8?B?akNDWVlnMC9BaFBVRUxVWTZSYTdLTkEwTTBvQjJ4cVFTNU9hcXQwdHM3UTM5?=
 =?utf-8?B?MElXQ2hjTGdYNWNmV3Q1ZEJUSjY3cEI5S0pDc3FOZGF5c1BqZFVhS21yemk2?=
 =?utf-8?B?UDJyY0kwRTUySjRpQnY5cFFoeTJsZDUwVWNUWlRLbWdHUWUvY29OcjNWMWx1?=
 =?utf-8?B?UGhXRkZYUUM0VC9vSEJaVDdZdXdrL1lOSmVJSEZpaWFLWjJoblBGeGtXdk9j?=
 =?utf-8?B?dlBZMGlGcndhVlhMVllnbEtmSGd4dytJLzhlK0htRDVmbjZhWVRXVjFvOG9p?=
 =?utf-8?B?UVVRUFNVaFRaL1BZUXUvRHFBdm9xWmczcStoMjlIN29xbFNCeW9CcnlTTCtL?=
 =?utf-8?B?RkRzRFZUSGoyS044SzZacE16eHZRanpZa29vVzZvb1JkQUNuL2JwbUE4ZGcy?=
 =?utf-8?B?bkdwUS95ZjVMUjRTUUttMThIVWlvTG1zSEptMTNyS3Q5NWVqb1hUbnM3c0Ja?=
 =?utf-8?B?WXRJTDhjUU40V0djampJakVUMk9Bc3MvOUJjbnFhcWk4N0VCaWF3YW1QVG1S?=
 =?utf-8?B?UGFTTVlmbzFMUTFoSHkwSTkwcDIwVXZZWU5VTTFYNGdtQ291U2xhNWJITVl6?=
 =?utf-8?B?N3ZBb2FMZGxXczU3TmRab25IYWRYVVFqUTErUFRJV1JkT3BERVdsM2dTYWZ5?=
 =?utf-8?B?QWc3Mlh3ckZwc1dBMThKbjBFTDRRRityaDRIMHI0UmFHY1FtNlhhT0NQRStO?=
 =?utf-8?B?MVJWazdnemo1ajJuSlplTVFXNEs0b1pseDd1VThjVTNFMXdLZDNLdGRPem5r?=
 =?utf-8?B?T1orekNXTnJJSlN3blRHMXd3WHpwK0tlazN5YlAvL1NMWUZHZ0ppV2Z2S2VQ?=
 =?utf-8?B?TzhLdUZsT05IcWw5Vmp6Si9BN3R1WVFmSFpTdTFaM0pHODRvZ0hkT3lDNEJm?=
 =?utf-8?B?eTlNb3VFVTZURzNMMm0ybGRENERNQStFNmZObUJLQ0s0OFBYazF2djErTHFy?=
 =?utf-8?B?RzFZeWZEdFNBYzlDZVJNTG9pTTd1ZTJaV3hSejBxNjlHbTc5RjRFKzV5NHJE?=
 =?utf-8?B?bHM4bXJ1ekFFbDRxM0d6R1c2b1VUTlcyNXczcmlPSHlwdGhuZEUydFhGeVpt?=
 =?utf-8?B?SFhSMVZHdzNIOEorUWw3Y1ZGQ2lzNjRPaUZ3Z0UxV3k2VktvS3d0VjIvMG1Z?=
 =?utf-8?B?MEpyc3BVTnRuTWtvcUZyR1IrRS9nMUpHMDlyMlNIdTEvYWl6QmNiVlFGeU9r?=
 =?utf-8?B?Ym5yK2x0RHJiWi9EUDR4d3ROUUtZdHF5eWVmYVlOUnFnencwcVBjSGxHbnZl?=
 =?utf-8?B?bVJXNDkwT3pHVGl3UTRBNUcxMmpjby90UWR2eVk5bVhjVEpuV081U0JRNWVX?=
 =?utf-8?B?V3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45a87d79-1fa1-401e-b2e8-08dd9973fe98
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:02:42.9739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcjV+dS2IUdAJPPcKLv4LYvh+D+J6iQ9w9pa6NGWbAJ6r6Mx/Xk33CdDEKQ9C0y3OuO7Tz6Yfh4Yd8g+45LFgkliWojrz3c7CCNMgj2I7Ho=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com

Hi Babu,

shortlog: "at domain" -> "per domain"?

On 5/15/25 3:51 PM, Babu Moger wrote:
> In mbm_cntr_assign mode hardware counters are assigned/unassigned to an
> MBM event of a monitor group. Hardware counters are assigned/unassigned
> at monitoring domain level.
> 
> Manage a monitoring domain's hardware counters using a per monitoring
> domain array of struct mbm_cntr_cfg that is indexed by the hardware
> counter ID. A hardware counter's configuration contains the MBM event
> ID and points to the monitoring group that it is assigned to, with a
> NULL pointer meaning that the hardware counter is available for assignment.
> 
> There is no direct way to determine which hardware counters are assigned
> to a particular monitoring group. Check every entry of every hardware
> counter configuration array in every monitoring domain to query which
> MBM events of a monitoring group is tracked by hardware. Such queries are
> acceptable because of a very small number of assignable counters (32
> to 64).
> 
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v13: Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The files monitor.c/rdtgroup.c have been split between FS and ARCH directories.
> 
> v12: Fixed the struct mbm_cntr_cfg code documentation.
>      Removed few strange charactors in changelog.
>      Added the counter range for better understanding.
>      Moved the struct mbm_cntr_cfg definition to resctrl/internal.h as
>      suggested by James.
> 
> v11: Refined the change log based on Reinette's feedback.
>      Fixed few style issues.
> 
> v10: Patch changed completely to handle the counters at domain level.
>      https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>      Removed Reviewed-by tag.
>      Did not see the need to add cntr_id in mbm_state structure. Not used in the code.
> 
> v9: Added Reviewed-by tag. No other changes.
> 
> v8: Minor commit message changes.
> 
> v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map
> 
> v6: New patch to add domain level assignment.
> ---
>  fs/resctrl/rdtgroup.c   | 11 +++++++++++
>  include/linux/resctrl.h | 16 ++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 51f8f8d3ccbc..e2005fc9acd9 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4085,6 +4085,7 @@ static void rdtgroup_setup_default(void)
>  
>  static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>  {
> +	kfree(d->cntr_cfg);
>  	bitmap_free(d->rmid_busy_llc);
>  	kfree(d->mbm_total);
>  	kfree(d->mbm_local);
> @@ -4171,6 +4172,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>  			return -ENOMEM;
>  		}
>  	}
> +	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		tsize = sizeof(*d->cntr_cfg);
> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
> +		if (!d->cntr_cfg) {
> +			bitmap_free(d->rmid_busy_llc);
> +			kfree(d->mbm_total);
> +			kfree(d->mbm_local);
> +			return -ENOMEM;
> +		}
> +	}
>  
>  	return 0;
>  }
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index bdb264875ef6..d77981d1fcb9 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -156,6 +156,20 @@ struct rdt_ctrl_domain {
>  	u32				*mbps_val;
>  };
>  
> +/**
> + * struct mbm_cntr_cfg - Assignable counter configuration
> + * @evtid:		MBM event to which the counter is assigned. Only valid
> + *			if @rdtgroup is not NULL.
> + * @evt_cfg:		Event configuration value.

@evt_cfg is not introduced in changelog nor defined here. Please add a snippet here
on what @evt_cfg's values represent. This is important since this is exposed
as resctrl fs API to architectures so all architectures need to use same values when
interacting with resctrl.

> + * @rdtgrp:		resctrl group assigned to the counter. NULL if the
> + *			counter is free.
> + */
> +struct mbm_cntr_cfg {
> +	enum resctrl_event_id   evtid;
> +	u32                     evt_cfg;
> +	struct rdtgroup         *rdtgrp;

Please align struct member names using TABs.

> +};
> +
>  /**
>   * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>   * @hdr:		common header for different domain types
> @@ -167,6 +181,7 @@ struct rdt_ctrl_domain {
>   * @cqm_limbo:		worker to periodically read CQM h/w counters
>   * @mbm_work_cpu:	worker CPU for MBM h/w counters
>   * @cqm_work_cpu:	worker CPU for CQM h/w counters
> + * @cntr_cfg:		assignable counters configuration

"array of assignable counters' configuration (indexed by counter ID)"

>   */
>  struct rdt_mon_domain {
>  	struct rdt_domain_hdr		hdr;
> @@ -178,6 +193,7 @@ struct rdt_mon_domain {
>  	struct delayed_work		cqm_limbo;
>  	int				mbm_work_cpu;
>  	int				cqm_work_cpu;
> +	struct mbm_cntr_cfg		*cntr_cfg;
>  };
>  
>  /**

Reinette
