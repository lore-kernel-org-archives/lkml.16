Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D723BCE7;
	Tue, 24 Jun 2025 22:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750804664; cv=fail; b=T3Nxw/0S/Ldj5lKhI71n29marQlYqntVhmfFUl525ZBvQOnUsNRihNLvIvIEALfczkPKzTlSWyvzxhTfFpf2ojAstl1T/uPfz6hu04+f4bbkgUjelPdUIFkU+i35zWdvBUHhSJsKNJxpP2JJuGbOvXKWAs8+gQ4fU4DmjjLLEC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750804664; c=relaxed/simple;
	bh=9fu3j49HmvB7GUjQizoUO/KwhKcLsImlyR6k8ybF2Hk=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EPMFX4mnlV+lNIpBvxtOTf9l6n6SM2rmW26Q1xKDd4xkeSM7qrg7u4CZvh4uX3xjFMyiUm98tPKgCziGtVjffQgCG34A7lbwFwupX01Fw2i1LXneGEJPmEA9mkAATfIUCpTdJHxk6hBtN86sOrC+tMVUL6VXAGuOgvyO2N/95S4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FKv3EIxW; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FKv3EIxW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750804663; x=1782340663;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9fu3j49HmvB7GUjQizoUO/KwhKcLsImlyR6k8ybF2Hk=;
  b=FKv3EIxWrsOwmlLOZlvvF3+FT4Fa/4QQsCtWxrL6sXLhHKaEZ4bGOuJo
   41DpTnXsx/z3p2uAIMRVUi4hiTnWE9JSXexdXhzDByiRoaUMO+PxOqPOb
   KTbMTnsKc9Ew8k/TuIaTPVHTn8jTTVb5/n8VQBPAsphU5ZLPDMNMGJPHy
   R3exAv6CnGAFwq4ZA4YQ4KSDmOSaRe/Hzt7uR8djMmMffRaIPbXAc2BxJ
   W7rQ+z0Sz8YKQ0kf7oHsFu55qB1EHPc7oURQiWXR59TqnWDnTV1EHR1FH
   aAiCYne9D+zod/G+Sn3Z6xMIuDRZIAUsL03SRNAXTSitETW81Mu+RiAkL
   w==;
X-CSE-ConnectionGUID: MB1bpBpfRha23InKDkKjoQ==
X-CSE-MsgGUID: hKMvKvGpTxaK9XpL+vpYrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63322184"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="63322184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 15:37:42 -0700
X-CSE-ConnectionGUID: WHiCX7WkRHuaLzSDZQ5SlA==
X-CSE-MsgGUID: h5/Z0TO4S92mLAkSpwNOlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152539070"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 15:37:41 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:37:41 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 15:37:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.48) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 15:37:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oEAwk3Y3qp5Q3H46TYfHml0EqCjmJTGnndpBq6i1koPphyl2EHmSTwm3oZEnEc8PhFl+iAbUljgWSo5ymnYLqigG6G9CpTXGtPWJQYakdsF8qKfSWXnILfSHb6XWCIN2Gmv579M+te96sCAbNzQzcN5RMVjOLcUsEmkTL6K1zFB/dQ1UYiBADXER1qjxbVFf4R+iWuxuiTWsjS+kOAM9mV4CB9Yka/vTF0bW9XGkQsJq52Hs6usRqWugD+2d/3G7TXVUEtNvBOAhaSA6YimYGo7aSwou3EaNLEjCPvC94xTQl9GdzVS3MITx8uK7zmaFrlyyCoQvi3JEKCX+3o/YNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csm3h8xc1L91x2sFsqofsjiA+xdLAvDN3IAdCc495FA=;
 b=HbXk9cggxCb2WFmKIQcw2iBNTazEfS/kEmOhDWBTzBKa+y/t+YFyIlBh5GCGLL0higa5F/rmZru5F6LlUl12bFIF2EFOoMGzZioS/CKuC0Uh44EznbU839A3KnVNbzu7JoP6czuvSSZrkep6pqVLybLDNpmAIVS1n01RLU6bCNLpoevomzz8IMLgHwltu4cFRTLPn79MiI5x1LME2tN/vAWE1lRdwXYNFMG32yAs0AyuNap9SSH0QJMJRHTMBiIgOHXHtUgV3S9HP7Wke3KS7wj5TMVhQOCt+M/uzfVJNF4VrBQMAkJIRYgVZyAwXwTpqbG1quBVI8WX1yA6GQFBCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB6968.namprd11.prod.outlook.com (2603:10b6:806:2be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 22:37:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 22:37:37 +0000
Message-ID: <c123ca9d-a34f-4b7d-b5d9-15742674600d@intel.com>
Date: Tue, 24 Jun 2025 15:37:33 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 10/32] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
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
 <b755ee48c3c70fdd2015b51a331bb0456a107569.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <b755ee48c3c70fdd2015b51a331bb0456a107569.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::13) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB6968:EE_
X-MS-Office365-Filtering-Correlation-Id: 8147d199-5975-4983-22a5-08ddb36fb896
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RG9BN21ZeTl1czdMdHdsblp2bFdOK3IveXJSUHZqWXZtcXRGdkV5NUc3VGI1?=
 =?utf-8?B?Sms5cExUQU9FV2ZqTnNXdGsxeFdKMnYrR25ZdUVmUTNYOUtzMVVWMk1EMWRt?=
 =?utf-8?B?Wm9jNUlTMkNGQk5XYXlPZUxOWG5ZajF5QVVVaStuek1nblpvWEw4OU5Tekx6?=
 =?utf-8?B?b3pQNDMxaVRSRHdjcTRwTGppaFEzbXZjcWdUbEhOZS9JQlpQT3JPUWplckZ0?=
 =?utf-8?B?WWdtTjVBRHZuV0dIMFkzV3ZTN0lUQUNRTFpHTHRFMGRraVZweVZHTEpoUEE5?=
 =?utf-8?B?R25jbHhxVHZyTFl5M2VOSllIM3c0Y2EwSVIwVjYwcGFRRGt5Z0Jic1R0a2hD?=
 =?utf-8?B?bTJOK0tTb21SNytnejhjWFZITk9IRG9OanpJSVlIZDNvd2tlRkFvSzhoTm96?=
 =?utf-8?B?MGpXRTRHS1FVeThnZG1NemV5UkRPdkR1TDdLbEN4TFV2Sjg2U1dMTWlHRXly?=
 =?utf-8?B?dXNOVWFNU3lkbjBUVVdwSk9UZERiMlhnTXVvTytkbUJYcHUyNkRPMUFNWnpw?=
 =?utf-8?B?aXBhTW8xa1Z1dmxjRmZkN2F1d01QOEpkd29GRDcwTWFvTmdKSFJDWVlGWW5q?=
 =?utf-8?B?czdyc0EwYUFQYmh3Y3RrZTdBV1dINnNkUG5Td2cyZkQ0aVozaXdJUS8wY2VZ?=
 =?utf-8?B?RzluV2xZaGFhWmpQVHM2Z1Q1ZUtscXhtZ0UvcERadklibFVzbUYyZDRLRzFO?=
 =?utf-8?B?T1lUbGp0Q1RoUUNZTXNwd3QrMTdmV2ZZL3BhcmV2NEZXVUF5K2ZYRkZPbVJ5?=
 =?utf-8?B?bGhOTFdHNzFNbkp1VTJ6dHg3RWRRZDVRQWdUUmVQRGM2VVNTL0pwQ2JzUjY3?=
 =?utf-8?B?STFpSXlwdDRVZm5ONXMrZDNBVkhzUTZDN3cwcTlCSlVJUHIwdUYxUnRqREhQ?=
 =?utf-8?B?SVpJSnpKcjUvWVpZcDN5djcwZElJTkE3YU5mR1FDWXlrK0c5S3dBVzhCdHUr?=
 =?utf-8?B?RzdwUGZiKyt1aDRVbXU5RU9OUENjK01jd1JJcXdhcWFXL285OUhmL1p3RlZW?=
 =?utf-8?B?OHc1eitiemtXSjAyajJDZ240OXdiM3pxajdYRjZ0TXlTRUxJcjRnMGlpQzBD?=
 =?utf-8?B?K2gzdWxzOVowVXZPcEpCNVpkN0oxZlh4RW1XSU9aaWNXWGJrS2lhMCtzbEQ4?=
 =?utf-8?B?RjlZeU5lRjNUNnBZTmIzYTB0VWZDcjMzdTMrand3dHNQRjc5M2k0YzJ0Z1Ra?=
 =?utf-8?B?WjNsU2dwbHFxNVc2b2IzM1pJRWFhVGFybFd2c0QyVjBibllKQ1FVM3pQckE0?=
 =?utf-8?B?WEtGalpqZ1QrNnVPN2k2dVBDTDY3M1JGYlpHc3Jmb01rTmdxcWVENjQycVpq?=
 =?utf-8?B?cW0xNkQ3SWVKQzFDTlFJUG9YQUdwYTZJb1UyTlI0eVY0TGhxVU9PejJYUGJY?=
 =?utf-8?B?UDQ3K1dSUzNiNXFzMk13ZW9NQlUrYWpJeTlPcXlFWlp5S3ZIYlJIMmNpMml6?=
 =?utf-8?B?VmM0dTZ0dmw5RHkxQWxUM2orWStycTlyUjFnM2J2ZW9KZDYrS2d3UVEvWm5x?=
 =?utf-8?B?RFVUWENhcFZsYitXRzFCMS9mckxwOGd5TEk2amRzUTNGOVREa2p4aitjNWl5?=
 =?utf-8?B?K0htOFlmQXJpRVROVTRFTEtvNUYyRzRuWldQRldIaTFvZVlYTWxTZVRQTDgx?=
 =?utf-8?B?Zk9Nb0QrcExRaGJRblZpVWsxa0F3OERQbUFodnUwbU9kc3plVEY2Zk95d2JX?=
 =?utf-8?B?SWFWL01yNk5HczVNa2VqTGljU0djZWJBbSsyQTYrRnlpT1ltZ05yRzRQNzNY?=
 =?utf-8?B?REFPMVM0cXlOb1ErY2NaN0NRQ1V3RTZuRnJwaGFsTEJSQjBPSXh6ZEZuZnNR?=
 =?utf-8?B?QXNkazR5RE9NTGlXd1dQVnI0NEg0ZmpkMXVNY0J6dk9adkFnWHRUWmVZZTNr?=
 =?utf-8?B?SDJ6NEV4ZncrcFZMcnJENW9DaGkrVk9vT1oxSU1heDR0NUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVgvdlNoZDFpaFVTY2VSRWNrNUpDL2x6Sm1QOU9PUWUxNXhRTVRNdXVTMVQx?=
 =?utf-8?B?UFpzUjhqZ3ZHa2hZOFdlYzBzalNEanNkcmtGRlY5Y0l1MUZ6ak4xS3FxVWZX?=
 =?utf-8?B?dWpvcDQ5dG84ZEQ3MjlDWTRKa3JyWmN1SFdTenBkNFV1SnlSZnlka0lTdnND?=
 =?utf-8?B?Ly9PeEc5a280RFFzS1pDSmszZ1VGKzZNSDFDdXZYTWQ2TUFuaktlN21HUzEv?=
 =?utf-8?B?SU1lSVR2REdzSm9UMzhNdlV1aEdSSWRGOWYxS25aZkdBUkEwSlYyZVNaSDND?=
 =?utf-8?B?dkFxY2pSUmNxL2RJOFRVVDlzeVJpVlZoTDhDaU5udW9PSnpTY1B4N24rY0ZW?=
 =?utf-8?B?TjRaRzFKTERqcWJENlBDZVhlTFdOZXVLczUrQ3RCRmhIMVNFQU4rL2tJMW5W?=
 =?utf-8?B?LzZFTFg1c1FRNWtnTUNmTzNVZzZNS012ZWVVbjd2R1NXVlgyaFMwSkJ2SnRu?=
 =?utf-8?B?TjZNeFhObTA2TmFLY3g0Z1hZZ0ZJcDNYTGtxQVNTdGpqSlp6YnF0UnZKRWNU?=
 =?utf-8?B?b1ZBeDY4UGhXOWdYTzJLYlZNamtUMnFLSWJYZDdzTlhCTjBQQUE1Ylg2TlNH?=
 =?utf-8?B?RzFrQ3ErWDkzU2cvUWNkeDlUYTJmaU45WlAySkNXWDJTdkxpT3Z5MUkrcXNw?=
 =?utf-8?B?WnQreEJSMXorSFF6RlRVWFR4a0dkQlN3WEVIOU9oOVE5RlFidVRXaE5kdEM4?=
 =?utf-8?B?bm5wbkorTmV4ZXFFUnA4cmZ6SmlSd2YyUTlQcW9Yamxndjk5cGdWY1pmdEpV?=
 =?utf-8?B?eXZJbENkOHNUaEhVUnp3dllORXVWNGNubmgyZUVKT2kyY1NxaG13SWJiYy83?=
 =?utf-8?B?d2tpQVJob1I3UGpCOEFCN2FhcUw2eXloT0ExVkMvU0Q1M0RUdkRkc09FVjhq?=
 =?utf-8?B?bmRQUHF1cW50K1hBakFVTllZbzhjWDJmVWlFT1dHLytLMzBjbEVPZEdPQm5K?=
 =?utf-8?B?ZVlxcTNob3lNdXhlNWtSVDJTelhmeG05YUJscE12dHIvYnROUGs2empXNVlK?=
 =?utf-8?B?NDRyak9pempzaGVXMlFiNURERDNLTVBZSHYyWG4ySHBMT2hxMHRVNXlhMFBN?=
 =?utf-8?B?ZkluaTZBQm12bDdOWXNrN081U0U2ak5ZQnBOZ1dEcmpWdFc5NzBrZFovR2kx?=
 =?utf-8?B?dVVYdDI3c0NQTHNPalJNSlB3MEhLeTJiWjQ1WDd5YmhyVEpKVFRKMERyanZ6?=
 =?utf-8?B?Uk53M241bXRodGltRFNLdEdGa0JqU0w4bjF4YjhmbkdnQW5HQUNDZlZFd2Fp?=
 =?utf-8?B?Wk5UUEdvQ3lvT21CcWh3YWdBOFN5ckYzWTF4QkdwYjQvSCsrNldsVG55SG1F?=
 =?utf-8?B?ZSt0czRzbXVKVVN3c3FscStQZHZkOTNMWTlRQmpQTU12WkVUdzRGMEFhR2tX?=
 =?utf-8?B?Sk1YMmNTODA2QUZTejFrNFNvV015WE91U3NYOE1pMUdtTU9maTRLMTkvb01B?=
 =?utf-8?B?eGs2NVpxcTN1aEZqTTZYaFcxQWlRQTJtNUk2TzB3QUxsQ21EaThXVFpDQktO?=
 =?utf-8?B?NDZiRzU4akd6NmFXTSsyOWRNMk9mTk1CWjFtOFI0a1ExbFA1VlhYSFQxU0h2?=
 =?utf-8?B?a2dweHQvWnVTV1RSZS85amgzTXlVZDlDL3EyMUI1bkZtaVJuWCtsTlFTZytN?=
 =?utf-8?B?dmt4Mm1nTEVlOWFLZWQ1RXF0T3dSaHRNblRHeDFqTEtjWkRwMVJyOGM4UkZk?=
 =?utf-8?B?aHN2Y3pnRE54elNmSHc4Q2FyY2d4b2JWYXJrVE5uMlVuVVdGLzlzRHRIM2FK?=
 =?utf-8?B?UDhpS0FpM21WVWEzMnlkUnF4aG56RDE3R0RoejZ0TmE2Nmp2L3Rvc0QxZzJZ?=
 =?utf-8?B?OWxzVms2WGFoQjdzRktEcUhiL2xEZ1pUdEpkbTNJYlBieDFyNHNGU1FoSnQv?=
 =?utf-8?B?L3A1UmxlaTJLUjJ4aGwrTTBxQmNVVllnVDZWbGlnQVQrLzlqSjczOEJXT0I2?=
 =?utf-8?B?Z0RKUGp4Z1VNT3U1MXo3SmhmUk9uZCsxQjl6R0lVTXlJSWxuZ0ZXYUNtc01z?=
 =?utf-8?B?RERwdkl4WW5kMzJ1TVhrSWNUY1R0RW1lcUswT2U3U2lvOWozdGlGR2lMcFpI?=
 =?utf-8?B?dVd3UlJvSS8yZ3IvalJaSHZRaHU0bjA3SUhMVkhHWnBqaUQ0eWZ2d083amFU?=
 =?utf-8?B?RnlKa2tEWkk0S1NNQVFVNDdCN2RLL3B5c0ZPZzVXVmFhdkRQSXgzdTNyKzhs?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8147d199-5975-4983-22a5-08ddb36fb896
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 22:37:37.7377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/twTXoRUb4H8R5zuOJhtq9qs6+8qGJ50u0Y8GAVIGE0HyV7w/IkpiH9ujg9jg54+jODSyGmL6LMVUz4fejP+U2iLo2DRv7p8YpZtHgx2cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6968
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> +/**
> + * resctrl_arch_mbm_cntr_assign_set() - Configure the MBM counter assignment mode.
> + * @r:		Pointer to the resource structure.
> + * @enable:	Set to true to enable, false to disable the assignment mode.
> + *
> + * Return:
> + * 0 on success, non-zero on failure.

 * 0 on success, <0 on failure.

(Just to be specific that it will be negative. Could also be "on error" to match
similar in same file, but resctrl is not consistent in this regard.)

> + */
> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
> +
>  /*
>   * Update the ctrl_val and apply this config right now.
>   * Must be called on one of the domain's CPUs.

Reinette
