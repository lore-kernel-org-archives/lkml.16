Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831B721CFE6;
	Wed,  5 Feb 2025 23:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799908; cv=fail; b=uSi7WSqiPD4qKM8Y7Jxj8dXRU7NwpjjsjOqdIhkigHhxNf5Yf2gV5pnKLmlIylf61qyEiej9ZBGSAP6Ed6aNDyT+j6PQZ9C1r29uX9ya50cJEgvhj+BEtz0EN4z3r2oiKuJDGMylBzZrCt3zqtyuThT0B4RNSORnBxI3KUkXvQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799908; c=relaxed/simple;
	bh=DloMNocfGXAS9FSOT61JkmlRA/w06+906MLMy1N3XbM=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VP11EizqiSnm/gqTkEWGABa/XsEzR0KkbL3JlDUNNi0q3kLaWYf3v/TmJ+1e2UX/AbCi37WlnF+phLogptLwcvgMso5IKqG27as8Rq5gw8PIa8WRtPS0BzEohd++t4D9bQLcyM2hMpE9AmL8IL5FmKfH9dZjObdyo/Pe1zmZ3Pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B6fw/mPi; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B6fw/mPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738799907; x=1770335907;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DloMNocfGXAS9FSOT61JkmlRA/w06+906MLMy1N3XbM=;
  b=B6fw/mPi12fkoybrNxD4OIzmuoBh8qoobl6QiDB0gXjFY0t7B7YMl4Zi
   o1/YAjgXgp9A4wfBIOO6FNdriLe79k8EaajUdwTZkJfxHUfjwrahIM9Il
   0Z26JMCY3xeab+50Vq6Z53JHblj9rbDRxstf4gEi/iYzuam5jlqN8hzou
   Z7RCMTIxN1eRNvnhdSHFE//iEhJg3GdQbxE42/6kZIfD0neEoMuRZQ1zQ
   B9qj/efXFqKaQH4qko69RodGw0YZIKl+R4+kGWtkKBpTchL9EwRatvlAo
   Q3iKfYg0vMfNnpTQXl+zgl4cL2Q5wI9RI18KbA7E7exAOzk81q2CQg38v
   A==;
X-CSE-ConnectionGUID: bPB+lUV4Ta2yGNXjwYWpjg==
X-CSE-MsgGUID: 9/fi9XPsSX6fuJgkbRkrAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61861994"
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="61861994"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 15:58:14 -0800
X-CSE-ConnectionGUID: a2ar1Ew0QDimLIkDVnboBw==
X-CSE-MsgGUID: eXYW+GQBRSGMI7SQvEFRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,262,1732608000"; 
   d="scan'208";a="141926054"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 15:58:14 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 15:58:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 15:58:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 15:58:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2L4yakWyBzMSRdY+ac350qWzMSfW5F2/YYCyEeWZWR4TOHxX2uA0VSGQ7NLRCzawtxL50oXzamJqMOg+XOpf/WMPV1mflBVewXIxqaU+3sBaIoalcqrib2k/sjhf9crOElsVt2681pSnhuAr6+DjXSSdmwV3gd6nnrIZOv+9Qssi9tQ5/IaGQlSYMxt9o/YVWsqCsdSjuCkOw3kIh8l4Dmv4E3BkbTGrc8Ygd3zG9E/GHehuVUr3rAn+/pyBz7dTscrjladSm3AHn496DsswgKMSBu/QS/yzy8yIhQcVhFLWWzc2kiaKrJ8r3ppaEKA3A/iKh0PdgY9jBFkZE1U6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WjIDKj+THTeQCTcKy05uEl0FtBu4/LcHFKi4fYF6gBA=;
 b=bdAFVqZR+/7Y3so97vsEpFg6gbLGm1RgHBr7xFVt8YT87q29ObYygwznJv1sYm9bRl5nj+OXmVjvCBf8hO+BrCL87VhSmvuJlv1wZ4cFLfo7cfFxZnWSjQAytiBZfVxmtUHDg5gEma5s0pWEgk+UdUgFd2PqLZYlp5M9/S+JJ9/rlbv0mKd5YXbed2dFs7db8Wyi9uN34qIhyi/oTD2qIlQzhiGJgn0xHG2GGK9SJNgtGZ3Qz5LR31dppDaJQiES0l4mJkdSOr60STg0+WUFoQKPWAT4AELxGIAS69SLxrSZaw8swqskuq+LIi21KpgUYfBzh1asypsF14R5hoZBAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB8448.namprd11.prod.outlook.com (2603:10b6:806:3a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.12; Wed, 5 Feb
 2025 23:58:07 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Wed, 5 Feb 2025
 23:58:07 +0000
Message-ID: <53e104c0-64ee-4191-bddf-3ddb56dca1d5@intel.com>
Date: Wed, 5 Feb 2025 15:58:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 10/23] x86/resctrl: Remove MSR reading of event
 configuration value
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <b4298186c0be8db76be4eb74e1d948fbe5c1de7d.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0009.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::14) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB8448:EE_
X-MS-Office365-Filtering-Correlation-Id: fb0fbf9e-bc04-4e87-022e-08dd4640efe6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXlvaGpnYjlxNWdDWkpGdXovbW1pK2NoUzdWZERYSVQ1Y3E1TlJkRWhzVnBy?=
 =?utf-8?B?bnQ5MzNnNzNXeHRLdTM4Z2hZYnNIeGFXOWJUMlpxSXZPY202Y2ZFNUZtaGJU?=
 =?utf-8?B?aHlxQVdHemhYNEtVaGhZVjZRcFJnWjBrNzBXVDU2dTlXMzB5QkFmSmt5NUlW?=
 =?utf-8?B?QUNVcmZxdGQvOEpIdzZyNkF6MXEwZ1g5dE8zR3pMSUg1VTAzTllZVTcyVWo2?=
 =?utf-8?B?VHQ4Z3NOOE1qb1I1U2RUcGZJMzFNc285OXNjb2wwUzkvUng1SG1UeVZJaFpl?=
 =?utf-8?B?MGd1WUxKTFRpOWJ2aFNSZUFnZTc5ZGpqTm9nU2NobHBUbDJJUEdkUWhiRHJI?=
 =?utf-8?B?MHIxRENSMlRCY1ZZYjNZVGJ5Syt0bmd3RFRYWkVQMStVQkFKVm1rSVRlK09O?=
 =?utf-8?B?eXJIeEpIbGxhTnc3Tldiam4yOWNoQ0pHNm1odXdNQm9CbStibnJCbEtOR1Bn?=
 =?utf-8?B?ZkNXcVZqUmNkWnBsM2ErVVlNaHQwS2tGVWczY3plSXh1NHNNRjhhdStiZHZZ?=
 =?utf-8?B?TWFZcDdudGowYUFza0R6QkxhK0NsZ3Y5dVhicjZ0c3JWbmtYdzBuNzdUanA1?=
 =?utf-8?B?aVR0em5qQjhxRGtRRWpQSTdWU3lDZitiN3JOZjFYNzFWUGRoTkVUdVh0YzJr?=
 =?utf-8?B?RE1ERGxaaitpRjg4dzJXUGNYMGJMaldJaTl4VU1kVmhyak15TE55RkNVZkhp?=
 =?utf-8?B?SWhuMDdoT0FIaHZDQWlHdzBTaW5UMElmenNVaG5qb3Njc2FKRDlLOFZvQzFq?=
 =?utf-8?B?M2lTQzVxSUJkRmV0b0R4ditRb1B3Y2taNWdqekVnT2c5cG5wazFOWTJScXp3?=
 =?utf-8?B?OEliNlk5cEJSVGp2OUVFdjJFNDM1TW1VNmc0QWJIYlJuNThMekx0cEcxT1da?=
 =?utf-8?B?bjJ6WWZ5NzBqcUhYQm1wTUJCanVUSitWSmJ0TUpiWUxkRTJZWkI2MGYzQ2hY?=
 =?utf-8?B?ZmJzaTZISEJLYXVoRWloRDN3K0l4OXZac0ZzOWRKV1Q1aDJ6RXlxWFpJUklH?=
 =?utf-8?B?NjFOaWEvWVFXdE5yU0xtV3VCNjJNcXpndFRjSEZHckpuVk1Id0pNb2ZtWW1C?=
 =?utf-8?B?bEM4VUhsNUlMekM2VUROSk1SaXJqaU5WYlc5dGtjNXNpTXdUMU9WajJBNWQv?=
 =?utf-8?B?TWV1S2Y5VCthTE1ld3Z3TW9iUEUyc0xiRDIwMEFsTkR0THYwUGdvQVB4czcw?=
 =?utf-8?B?S2xMSlhEUGxyQ29DbVBuMGZLV0hiUHBpdWx0NG9BY3BBa2gxOUJWUW5uUzZm?=
 =?utf-8?B?WXdDTERacndtKzVDSHZKTFdsSTJZRTRXUi9SbzR2V1NzeTVpQ3M4TXc5NTBv?=
 =?utf-8?B?TVc1emZqK2VTT2NMSmZ0NFc2RVRrVFJMczNOK3JvazIzWWJrODZHWTBpd0lZ?=
 =?utf-8?B?K2k2NDB4VUpEeWxqS08xVnhsV3ppb210bk5NUGpMbzY1aHJ1aEQ5RlE1R0NL?=
 =?utf-8?B?ZDhtbU9mY2NtK1hXQ0xiQ1BaQ2hJRXJRdVVLL09KOGFEenBTckVKZW50NTFT?=
 =?utf-8?B?NHVDZjgxTUpsWjhvaHZ0N3NIU1E5amtBU3dXMlk5M3Z4ZHVRWjZpdkF0d0d5?=
 =?utf-8?B?U0ROeVRCSTE4ODlzWVhqa2kzMU1ZQUI3dnl4blJSU3dvRVZmSWRwUHVsdmZU?=
 =?utf-8?B?MmROVnNUZkUxRUswS0hXSzYySUV6Zlk0MUxKTWJ4cHdPaGhNS2JLQnEwWXNY?=
 =?utf-8?B?L1Y2TUF0N3BoZjhGTi83anBYYVNYWUhGMlRlR25JWVRLd3dLbGt0YldTd1F0?=
 =?utf-8?B?ZXVGNXdCdmQ2ZjIvVUJHZmpPSllDT21yV25mckJ3UWdSdlBaVmt2VGc4Rk5R?=
 =?utf-8?B?dFZoWWNNbHgvbG9iT0hFNU13djdxRVFTbldGKy92OFdXd0lnZEh4TmMrbjEx?=
 =?utf-8?Q?kRwOJTZNBwPwp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNNRzROd0xuekIzMkl2MlFtZ05KYUh1WVZWcmF4cjVaY3lCbWdXSTViYzJ2?=
 =?utf-8?B?OVUzRE9vY3hlZGVjU1pmZFF6ekpLMEJSSWtZZm5YTlpKZCtlTVBQc1YraERk?=
 =?utf-8?B?R0U2NkoyTmFmcnhZMGNneE5DRUFPTnpJZkJsQ3pvbGo0aW1nVnp3NklmTGlT?=
 =?utf-8?B?TzJoS1FzT3VpdjF6NndHK2RCU1k4TDV3NjVmS2IzeHR4blhqRUZMSjZucXMv?=
 =?utf-8?B?OW5UdkhpUjZGRHJnSVZTRHg4cC85ZmNPNkF5bVQ4WFA4MUVLY0hWK3paS1Fn?=
 =?utf-8?B?dk5PZ2NrTVpJWjJaL0l5VmFPcGNjQXZDUVk5cVBXUmJWT3loZFdZWnc2N0c1?=
 =?utf-8?B?alFORXlhTjhoenJVaVVHRjFDRXBwckVBUkRSb20vdmNTUnU0YjhpbG44Qms2?=
 =?utf-8?B?TG1Za2dLNXpVOFZvdDNVSWNvS0R6ZzV4TUNlQXhURnp6ZGVEREZIRks4TDB1?=
 =?utf-8?B?Y3BMVVppSmk3WVM1MXQ2bmJ3SlM2MFdOV0h2T2ZFOGhGOVcwYzR3STk5Q3dB?=
 =?utf-8?B?YnYvUE9mc1lSOC9oMFZObVVCcE9XNG8xN1picVFZU1R1VDQzeDZ0ZFc5OHZv?=
 =?utf-8?B?MkVIVnhuTDZPeVRydHQwQWdZY2UybmxMbnV0bDVtbVJJSzR4OHF3WUFxaEJu?=
 =?utf-8?B?Z3p1V0pNdTNRLytXUk1JZGpYV212ZkIzTzhDZGZQU0tIdzFvT0UzWEx4TEJj?=
 =?utf-8?B?dTRubUM5QnIveTZyWXIzUWptdWJqeUtOMDlESWhidzR2QmdDUGx1N3VQL3pv?=
 =?utf-8?B?ajl2eWJrZ3JnMVFVZk44RFRlMU1lZlp4VGF5c1BOMDNBUmZpWW5VRkhQdVMw?=
 =?utf-8?B?VEtVcVh1L2lQQlUrblFacVVZMmJQZjU4K2VoTk5RV0xZUWVWdDlDcHhWTkxz?=
 =?utf-8?B?UU12Y1hiTnkwdkNtSExSYnhBRUwvVk5wUGVTelY1U0xJQVZrVS80OUIvTTZq?=
 =?utf-8?B?ZjEzOWZGR2Fua2dRTUgzSnpFVmlxa0J0dnBoUzR6dGdDNjdJaFZxc2xJUTdG?=
 =?utf-8?B?cmEvWnFOVzNUOEVLeDVhbzl6dTRidWhJNDVGTjhWWkxvRDlwUE9UNzg3VkY1?=
 =?utf-8?B?VTZ1TDFQcUliNm5DS2NLT1VvS1lEVmRJc1RITFFRVUtKSUE5VWE3WGdDNVlI?=
 =?utf-8?B?Y0Q0SmZXNUlqNmF1TTlsUkxneUhZenBDV0lReXJiR2FXVmtVSkhQWEE1Vkpw?=
 =?utf-8?B?WGxWUGxSYjZPM3ZwQ0l4TVovK24yNEpHNjhobTFWSHkwRlZVZVdJTkxJTGZZ?=
 =?utf-8?B?V1g1ZFJpeEV6SFBnTVZBRzlPSG9ncE5nczNDME5ad0VPTWlTVjMxTG82YUJ6?=
 =?utf-8?B?ZlUwcUZmdGk4OURKU29WR2kwVHhWZ2dWL1o0cVBtQmoyK2F4eFg5dDZtR1lP?=
 =?utf-8?B?NlR6YXVFNVlZS29nUW9LZmxKYTBGa0VFVERQWXIxRHRJaUZWajNMNENsTXBj?=
 =?utf-8?B?Z0d3ZGVCTnlJUjNwVkhwY3dWbVF4a0k2RFM5REd1M1NnNlc2QzY0N2xkZUd2?=
 =?utf-8?B?ZEZFLzkzMmVpODdtZjFEMk81dlhMNDRmMmtOamRQRWdGeEd2Y3h0V2NJRTRy?=
 =?utf-8?B?cCsrTHdTOWs2NkIydC8wOThMWjhCMEtLWGw1clNJVU1oY2NGc3p5U204OFJy?=
 =?utf-8?B?RFE2bnFHUndxY0tuVkl3bzVPTmN5MkxsczE1WjhOT0F6V1pHdFN4UzJjZzhU?=
 =?utf-8?B?bWZhWVVoN1FRK1Z2THQwajZxUllWYWNUUUcvQ1NXMFhJQ2NvMit5cHF3N3dP?=
 =?utf-8?B?ZTB2ZWNSQ21OQ3FmM3dhdTU4ODZMakpHMXBpa1hxUWJrcGNVV1dzMHNpZXB5?=
 =?utf-8?B?dVRwUFNWWUpEZTJZNTVkMHliN2l6WDAxU1NZSTdHeTlvLzB6NTVGZG14Tyt3?=
 =?utf-8?B?ZVFtZlNWTUQzVWplTjVsNnJrMUhPOHVSd0xEbEtKQjJjVUhRVXNJa0d4M2ZB?=
 =?utf-8?B?NXc5SU95UEtxdm04MjlZbjFjWWdCTktiNHJ3WEt6L1YyVzUvVk42d2V0RDNo?=
 =?utf-8?B?bW13a1J6US9wMUtkK1RYRDQ1Mm5JQlJCY1lGZk5aaUNIOG1XNnVDcllUNndO?=
 =?utf-8?B?MVlOeERjVXNhWXdMSDNSdG5jcFBBL3kwT0EwSkJEY2ZzeEY2N0xhWHNwM2RV?=
 =?utf-8?B?djBWMnhjWWN4NVpmbk1BaVFjMU9TYXFBK2VESC9FbGswcG04YytpcDY4THhY?=
 =?utf-8?B?L3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb0fbf9e-bc04-4e87-022e-08dd4640efe6
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 23:58:07.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rju8LKmCNarFQ/MFnkjAPyCSw6eSyC7UI5ObXlUecWaUsYCzHmoDiR4/sD44qbnoe5n4E+KI5R8mutz6sLOUdxoucqlAayE49yCcRuyswWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8448
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> The event configuration is domain specific and initialized during domain
> initialization. The values are stored in struct rdt_hw_mon_domain.
> 
> It is not required to read the configuration register every time user asks
> for it. Use the value stored in struct rdt_hw_mon_domain instead.
> 
> Introduce resctrl_arch_mon_event_config_get() and
> resctrl_arch_mon_event_config_set() to get/set architecture domain specific
> mbm_total_cfg/mbm_local_cfg values.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> ---
>  arch/x86/kernel/cpu/resctrl/internal.h | 15 +++++++
>  arch/x86/kernel/cpu/resctrl/monitor.c  | 46 +++++++++++++++++++
>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 61 +++++---------------------
>  3 files changed, 72 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index ab28b9340ee7..cfaea20145d0 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -605,6 +605,18 @@ union cpuid_0x10_x_edx {
>  	unsigned int full;
>  };
>  
> +/**
> + * struct mon_config_info - Monitoring event configuratiin details

Same typo as previous version. 

> + * @d:			Domain for the event
> + * @evtid:		Event type
> + * @mon_config:		Event configuration value
> + */
> +struct mon_config_info {
> +	struct rdt_mon_domain *d;
> +	enum resctrl_event_id evtid;
> +	u32 mon_config;
> +};
> +
>  void rdt_last_cmd_clear(void);
>  void rdt_last_cmd_puts(const char *s);
>  __printf(1, 2)
> @@ -674,4 +686,7 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>  bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>  void arch_mbm_evt_config_init(struct rdt_hw_mon_domain *hw_dom);
>  unsigned int mon_event_config_index_get(u32 evtid);
> +void resctrl_arch_mon_event_config_set(void *info);
> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
> +				      enum resctrl_event_id eventid);
>  #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index 8917c7261680..6fe9e610e9a0 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1324,3 +1324,49 @@ int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>  
>  	return 0;
>  }
> +
> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
> +				      enum resctrl_event_id eventid)
> +{
> +	struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
> +
> +	switch (eventid) {
> +	case QOS_L3_OCCUP_EVENT_ID:
> +		break;
> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
> +		return hw_dom->mbm_total_cfg;
> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
> +		return hw_dom->mbm_local_cfg;
> +	}
> +
> +	/* Never expect to get here */
> +	WARN_ON_ONCE(1);
> +
> +	return INVALID_CONFIG_VALUE;
> +}
> +
> +void resctrl_arch_mon_event_config_set(void *info)
> +{
> +	struct mon_config_info *mon_info = info;
> +	struct rdt_hw_mon_domain *hw_dom;
> +	unsigned int index;
> +
> +	index = mon_event_config_index_get(mon_info->evtid);
> +	if (index == INVALID_CONFIG_INDEX)
> +		return;
> +
> +	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
> +
> +	hw_dom = resctrl_to_arch_mon_dom(mon_info->d);
> +
> +	switch (mon_info->evtid) {
> +	case QOS_L3_MBM_TOTAL_EVENT_ID:
> +		hw_dom->mbm_total_cfg = mon_info->mon_config;
> +		break;
> +	case QOS_L3_MBM_LOCAL_EVENT_ID:
> +		hw_dom->mbm_local_cfg = mon_info->mon_config;
> +		break;
> +	default:
> +		break;
> +	}
> +}

This new arch API has sharp corners because of asymmetry of where resctrl
runs the arch function. I do not think it is required to change this since we
can only speculate about how this may be used in the future but I do think
it will be helpful to add comments that highlight:

resctrl_arch_mon_event_config_get() ->  May run on CPU that does not belong to domain.
resctrl_arch_mon_event_config_set() ->  Runs on CPU that belongs to domain.

... 

> @@ -1683,33 +1653,23 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>  	return 0;
>  }
>  
> -static void mon_event_config_write(void *info)
> -{
> -	struct mon_config_info *mon_info = info;
> -	unsigned int index;
> -
> -	index = mon_event_config_index_get(mon_info->evtid);
> -	if (index == INVALID_CONFIG_INDEX) {
> -		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
> -		return;
> -	}
> -	wrmsr(MSR_IA32_EVT_CFG_BASE + index, mon_info->mon_config, 0);
> -}
>  
>  static void mbm_config_write_domain(struct rdt_resource *r,
>  				    struct rdt_mon_domain *d, u32 evtid, u32 val)
>  {
>  	struct mon_config_info mon_info = {0};

As discussed in previous version it is unnecessary to explicitly initialize
the structure if it is fully initialized in the code. This avoids need for
future cleanups like commit 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")

Reinette
