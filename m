Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885725C6E9;
	Thu, 22 May 2025 21:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747950766; cv=fail; b=BaF7OpMGVOcv+FdMq9nfew0UfqOehPFcUq8swf3nwsYU1ORpPOUw8vNpLaVNJs0tLmPW/dLqkbF4Es5NKqL4mPjiFcDM99gdschtv8F8xIHtrnc34/o4Ocz7dbg/dcFKtWGQeJgXwrOKZN0jU1W+9/0QWEFgZhDNLuZ2ldpEDss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747950766; c=relaxed/simple;
	bh=1hInP+MdP+g7vv+BWTsaKKbAkkhvcRfN9Y7GjpnuElI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EUZGoeHc8csArS0V5z+BL80cPsVJ/b7xff0toXn1eyvJjPlPyDJ1/pYc4DVBiRKAd6d9JfU/U5DjXFLO3e5AtW7/qkZUMY+HIID7KjlPzwyaBdgTt1G5Fi9wxVaxZi4Uy+lnDZkvPkVUpJn3J6jyhz0bZ9aBgP1ckp0xZSQCSn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOfdm+GR; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOfdm+GR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747950764; x=1779486764;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=1hInP+MdP+g7vv+BWTsaKKbAkkhvcRfN9Y7GjpnuElI=;
  b=VOfdm+GRVutJvb/lveMrftWgJxxhupVg4Ld6NI3E3Yguqn2zyUaegBE8
   HNKI/+tieFeIsRoE8pe/46ZFwt3zFfMV32OFEmUeIEpwruG7DIsmb2XLJ
   PQ68r8ObKtKBTnf0r44/ZxTXBzYeeGWcaxq0UTqBvt9M0xVA38qRlsPBf
   pSmyagggu6QhMtaoEudGZ5Nr28vp4Ikb0mthFJ7twzsK+f/rZw5eQwpDX
   J8B+7A9LMUEsKh6iaHMpXosDZjZHAZ28h6Xi5I2CFEK1mbX6ONhmoZN0Z
   al62ehGZvH3zuVkjUiBvTQKQnV59UK6ISEypW4MXbh1dFC2iOrkj/qtRR
   g==;
X-CSE-ConnectionGUID: Ful6Bkf+QNO61RLmIvD7SA==
X-CSE-MsgGUID: KDyCI98VS4eaWto91l/kCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="60247599"
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="60247599"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:52:41 -0700
X-CSE-ConnectionGUID: qfsM5UdzTZ+nsHN9LjLUzA==
X-CSE-MsgGUID: rUBNaMUMQXGZj421gKDnLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,307,1739865600"; 
   d="scan'208";a="140846274"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 14:52:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 22 May 2025 14:52:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 22 May 2025 14:52:33 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.43)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 22 May 2025 14:52:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqxsZuVuz7wxJNgBPtgDutA3dhcwGL1FpMROd1axmfFvRPshGBSQnj8ymahCJeWf8LTEshF6EHU+11ftMcCIJZnMhleb6vgdnhTWbLqjov2LY3eVRtVC3lRJHARxvrY+bkPPTZRD2XfQcolmIrpU4Ue+14MMDdVx2+sPcbfLn7D1cBAuRBiKUBqIbnLDDKlr4S6jhuSCggU/UvQ4k2ZRyVqIDScDNepp1rqdreNo1u9db3B88jxqtbfWB4wZOU5P12jN05SAaRN3/LtVLUS85IjP2spyQfzURYJy4fXUawVejsFnuHGSvNzkUOC9xt+WioiDCouJdUknVcpnZR6sHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FmXIsywNIYb1DK5HavXNJPWBVcSccFvG29gu6PJ9pE0=;
 b=mJY7FlPQX4JkE140yvb3/iqWHF3ZkOKvAjt4BicxAVJ0uPojTdmqS9gJJ/y8bqJu5iqMvjDVMzCsPk4qyhihDWMK1w6n2BnuNMTZVJGuGjSBsp6FPQN8nplqFnduedgmM/EtagC22vqqYEmzaSRdqeFGTSZEouv2karszab5bDpgPkU+SVInB7vp2Vd8qur6gQX2Ue6GT6l8cXT98AV7r1PhMl6KIGK2X6CusGzKhkcJfgxq8FeFz1I/ZCZbRNsPVxodMCn09BV1H+Mx2CJWyXpeXE0O1YI+v1GWZ9FVLEXyf9oar3qFUzd55L6uSgrpCZGhCaxHJIl8bi7bqbJO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 21:51:37 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 21:51:29 +0000
Message-ID: <dd195d60-3e40-42be-88e5-7f3bbbba63ce@intel.com>
Date: Thu, 22 May 2025 14:51:26 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 11/27] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <e7e8f489ef148a4dcd5837d71c83efad47b5b7c3.1747349530.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0154.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::9) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH7PR11MB6403:EE_
X-MS-Office365-Filtering-Correlation-Id: 179c591e-051a-420f-3cfa-08dd997aceb7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkEvcllFRVBFQnVsaTRBckZlSHkwamxRZXhjajVJTkNWbmpKMllkcTlSOHdi?=
 =?utf-8?B?V2RzeTFyZDlqUFVNN0VsczNpd0ZvZGQycDFBaEhleHB5eGN2SmNFWjNxdFR1?=
 =?utf-8?B?cnNIbmE2NGhNODlBUjZ0YmIvMm16d2I2dmxKVDlHLysrREUxaGFJdnI2REtJ?=
 =?utf-8?B?T0gwaGpoTXExSGZCZ2Nad2dBVlRWejFWUks5WlZFM3VGVmNFaGNCWnVwZ3dy?=
 =?utf-8?B?U3JWMFkzMW5WWkttU2R0NU5zbkdjWEdUMzlUMEpEOW5hZnRnSm1Kemo5SEh5?=
 =?utf-8?B?dVpxTkhBRzVxaDFWZzhFcjA3ak1tb0U3RTBoOUprTk1qa0V5Z3ZLMzVyUWRO?=
 =?utf-8?B?T1V2WUZoM3U2b2YxYWJObmluK2tYYWkzcGw2eXZuTWM3WFRXV1RHNWdzdjBk?=
 =?utf-8?B?SktkMUdEWVN5S0RuNlBqMGxncWE3d3RMWllTQmdpWi9HMVA5cFI3aHd5ZWZ0?=
 =?utf-8?B?c2ZZVXFnWjlWZjBpSUVYd2QyR0V2VThuaWN2OWVQSlVmV3lsVWkrcC9qT0FH?=
 =?utf-8?B?eWg0NjBCMy9mUE9JVE9YNE8wbnM3WE5NOEtGSEhuMkRDclJWczlCMis5QStQ?=
 =?utf-8?B?UjNvbmtxMnR2NWE2WHducWk5UVN4NlFGTjcrc0lKYVZKQmJGTGRhdGsvbDNK?=
 =?utf-8?B?OTcxeEtudUpnTEYySEgxOFlhdEZzcTdoa0lLekttRTRxaUhhWEVNUWtPVXVV?=
 =?utf-8?B?T2dBbUQxUXJVRDhKNDJ1RGJtTHZQZE9BRmk3UFJjeXV4Rmg2K0NGVU1aait3?=
 =?utf-8?B?NE91TVloRE1qQkVNZStvbUVJMEVHU3lUUUZsY094Y0lSbjNZK1dHTjNXWHp2?=
 =?utf-8?B?Qng4U1RhTllyRjB1SjhmS1ZpUkcwaDltTURTZFI3bk91YlpTL3VFNGJZRHdL?=
 =?utf-8?B?MG5xaWtVVzBTbzRCZVh3Qk1ISDBNU3BVN01SaXpjcExwUnhOeHZXb0ZRT3Ro?=
 =?utf-8?B?YjNpSTNIYzFDYlNEUFpnK091aFBXb0ZQTER1MmpQZ2hvRk9ScC9pL1IwdWFy?=
 =?utf-8?B?SnVoWHcyc1VUYzB2Q2Q0VERjV2FaSUJpMlE5T3o2M093STNGeG5CbktMK0ZH?=
 =?utf-8?B?VjR5Zno4RVpsUlhja1dzZVYzLzFZaU5jZkx4ZklMZ3R5eGRzRFhGOVladzhp?=
 =?utf-8?B?NlE5T2psMmZXdzJGQU9HbFExZDFUOStpVlkwelZGaUtTUGFSWGRvMlpLSk5z?=
 =?utf-8?B?MnJSS2Y3RnBSUDkzZGJ0WTY0VDlLNlh3bHdUQVhrWW45dVNsVXRjRGQ1emdm?=
 =?utf-8?B?Ni93KzdEZExqZHlJQkNINEpGUE5IUXE5WEFtakVCL3FweEtwaGxmNVBGNjNy?=
 =?utf-8?B?WUZSTit6NGdpRko3b0h5T0FLZERSQzFqbFYzbEpETUFOWTJCQW5TU1lxblpE?=
 =?utf-8?B?L2x0ckM0NEExS201ZCtpVlJKRFFHSXRxVGxKL3dRWDBQQ01KR0h0K3M2QW1p?=
 =?utf-8?B?NWU3U1J1cXNITHBuSWRjTisrTVVDOXhWQm56anRqSWpZWTY3MWhGQUpXUkdE?=
 =?utf-8?B?Z1dZV3JCRkVOWE1Mdlp1NVlKUVJrdDRMUU5VYUdOVlZFenluZERLRnhTWHpS?=
 =?utf-8?B?SGp2bzBJSFJiU05yZ0RYVVRITllmWUVyNVJUUFY0aFFtOFNwRzk1dHFicVd3?=
 =?utf-8?B?dFBQZ2R3OE80T0Q2WEpJdFRRU0RUYmtWdmh0KzF3bUUwcVQwV2VybkxkTnpF?=
 =?utf-8?B?cVBDaURpYXExOEYxNndvc2tjZXgwNzA4NzZNNEpGOEJXSlo0TktObHc5TkZR?=
 =?utf-8?B?NjAvbUlxY1o4QllNQ3lYNXBJbWVlRXc4NTlhV2E0SlFwVHJtVndFT1NGT3R4?=
 =?utf-8?B?aGVpKy9teGg5QnBSOEJDMUsyNklreVorVGhzbS9jaHJJODZ2dm5hTVNhUGlY?=
 =?utf-8?Q?kIvE0e27g+Q51?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WExQTk1FdEd3N0psaWR2SWd2L0lrYkE0VXJvQjJCU2tZSk0zYy9MT01hTHlQ?=
 =?utf-8?B?dEMxaVJZME55d2hJb2JLUUZBRWxwU0xYZGlJakNva21kMlNUTEx2RHpJdk5q?=
 =?utf-8?B?bnZiYTdtZnh2YnJuZGNvdWQrNVQ2bTRtSitKaTRkTUNxQTZkeFczWDNqNFJn?=
 =?utf-8?B?K2t2b1BkWHdkL2p1YmZGZWNYbmkzZTZmRjFHOElRQ3RRcHpBYS8vcjRDZVk0?=
 =?utf-8?B?ZFlFNGl6VEQramRqM0tBNDhQUjdnUWxWdUY5NG5IeWY3Zks1ZzBRUUJWeVRu?=
 =?utf-8?B?Yzc3d2VGVHZ3eWo0ZzIzTS8wazNqNk5iSlNqNDkwWE9TUFhsZVgxZzhlaXZH?=
 =?utf-8?B?eGNIQkVEUkR5dkRtbVFmMUZJaXhPQVFTcmlSKzREQk82ZWs0eGk5UHdXV3gv?=
 =?utf-8?B?bEl6MjkzYmhMeEpNcGdya2d3MmpFS1JyMHM4S3lYaEVneEdRZzl1U0dvVmlj?=
 =?utf-8?B?bU9lb1N2S2pzTEYvTVRsVEN2bG5OcXRPVUVlNmdWNy9OUHNGSlUrTkpmOHFO?=
 =?utf-8?B?NHMvU09XN2JHQ2ZrTXNhbWR5L000UXNUZ3YzbWRiSy81NWcyczFWS0lkT3N6?=
 =?utf-8?B?THNuVnBPR1BoZmY2TlRhMG9lblpIMmUrSkpINGc1STVCc2VCZFBKbXZtZFRF?=
 =?utf-8?B?R2ZMN2JxWlJVcVdsajlxSFF3aXpOc3NqUSttS1VMejI3QVVVS3luNnhrRVYz?=
 =?utf-8?B?MmlKMnJ6bzB0MU1tNnk3bHN2OEgydUlOdGh1NTRldzNFNlc1aU5JVlQrQ0FP?=
 =?utf-8?B?c1FEZXZ0Zml3U3pUQUQrd3hoaUh2eEJUQWVrNXZrV2ZuamJmS2w4c1ZXZzBt?=
 =?utf-8?B?ODBrR1JGREpDdWJ3MWVpTGFlQTRsaHB3MlFLRDcvWWxlbjNwQ2FUS1ZlaG91?=
 =?utf-8?B?VEpCUEZDWGJUZkFlY2dDTVg1RFJ0Q1Q5QnU3WGx0cXF0OElkOWlUdVQ2Z1Za?=
 =?utf-8?B?SFVCc0doaFI3OEJlNjlpZDRzNEFkVExQblhFOUllMENJNXdYY2NPNnFBZ1oy?=
 =?utf-8?B?TzIrcXhqV3F0bndRRUszeFExbVBvQStsQzhpU3hOWlJzVHArdmluRWF1Mk0w?=
 =?utf-8?B?eXRrOERuYlU5bHlwL1pXOUJqajRLSmQ0SnhoWU56bHQvTmViK1dDQUl5VWRj?=
 =?utf-8?B?dHRxRFJhQkNUZkFiMVZyS3Jodng4dUVMcFhwN0JkL1VMTVBDOXRNTzRPVHoy?=
 =?utf-8?B?M1pOSlppSkp1WFNwaVAxM2RlTjQzUU5xdlRuZDNmWlltRXl4OG9NRzF3b0Yr?=
 =?utf-8?B?WS9mNm5KdWlJeEttRGx4ZEx1YWxWK1ZsRUc2ayt0Z0xsSGVmdUFDZjRBQVpO?=
 =?utf-8?B?L2V5TjYwZFBmT0U4Z0RGTUN6dHVZNWFlRTZHbE9JVHJqRTdYMm1JSHFHVUtk?=
 =?utf-8?B?YzJOcERxUUE1M0tYdk12WklCZkNqcGlkMGppVkRPbFc1dGU4TnhDdGN0Z3hX?=
 =?utf-8?B?VHNhbnNWazZhNDJrUEVUbEp1M3VTQW9hZEVwT0FiYkdNTmcwZHBTNGNwYUVw?=
 =?utf-8?B?Sll2TzZ3MDB4Nno1L0tZVElSZmdKWXJzZ2cvQ3JWbFZtK1pkQWRSYnM2a3pz?=
 =?utf-8?B?alh3MkhPeDNYa2NGa0RER3BOV3lEcW5EenNIMGVmVmhlYjBZWjNadHdnbkZQ?=
 =?utf-8?B?em0rSDlOVyszS3o4SEdWQjVhdUg4Q1RZK2NETXRndU1PeWdsSkErV2lFMTky?=
 =?utf-8?B?ZzIwMHYvQ2YrOG5RNENCaW1FSWR3eERYd2dOSnFXSkRRWXJrVXkxT1JMaHFO?=
 =?utf-8?B?L3R4M1ZMbW1lV1JCcW1mZ3h2bW9ndnVyRzlUeHRsWHZZUm1Za1NqbmhLeGNW?=
 =?utf-8?B?TG92Ui8rMUtiTHp1czhaRWVSVzl3QlBpb3ZRczZ5SzRpdlgrOXQxbGQxYnFx?=
 =?utf-8?B?bjV0cHJ5SDhLQTM1cVdEMXNhNVVTSExvSDZmUkVhVFdXcnhlanI4YVZoOHI0?=
 =?utf-8?B?M3RWaUp3cWlZUFJ6cDFFUHoveG1uT0tNSnNYek9VNExTa3dPYzRZRkxyMzN6?=
 =?utf-8?B?eTUrbTJuNTNPMzdRSWY5cE54dmtPdlBhTVJrdVpSYWxjOGlPYUdGRktPZXMx?=
 =?utf-8?B?WS9aS3E3RGdGa1BaQXRXTnhyR0xVK1MvdlR3YWRoNUdPSXdXRGdTYzFzaHpk?=
 =?utf-8?B?RmJrMG1LWExoNmNMeHRvUGM2UG9SU1dOS2lweml5MG5MOXE4WjJNMHNEdUNv?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 179c591e-051a-420f-3cfa-08dd997aceb7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:51:29.1752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WereNMjDjc0miS5XSRE08SK15jbx/0LZklz94RmnlzfR/qhtS8lgm5rQDbYokbW4RknJr6Ao8REbUXlalZOqMseTnpYQkoepGWc+9Jg+cLk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-OriginatorOrg: intel.com

Hi Babu,

On 5/15/25 3:51 PM, Babu Moger wrote:
> The ABMC feature provides an option to the user to assign a hardware
> counter to an RMID, event pair and monitor the bandwidth as long as it
> is assigned. The assigned RMID will be tracked by the hardware until the
> user unassigns it manually.

(please review this often repeated snippet to match new design)

> 
> Implement an architecture-specific handler to assign and unassign the
> counter. Configure counters by writing to the L3_QOS_ABMC_CFG MSR,
> specifying the counter ID, bandwidth source (RMID), and event
> configuration.
> 

...

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index ff4b2abfa044..e31084f7babd 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -448,3 +448,40 @@ inline bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r)
>  {
>  	return resctrl_to_arch_res(r)->mbm_cntr_assign_enabled;
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
> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			      u32 cntr_id, u32 evt_cfg, bool assign)
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

Is evt_cfg really needed to be programmed when unassigning a counter? Looking ahead at 
patch #14 resctrl_free_config_cntr() needs to go through extra list walk to get this data
but why would hardware need an accurate event configuration to *unassign* a counter?

It seems unnecessary to provide both the event ID *and* the configuration. 
resctrl_arch_config_cntr() could drop the "evt_cfg" parameter and instead there
can be a new resctrl utility that architecture can use to query the event's configuration.
Similar to resctrl_is_mon_event_enabled() introduced in 
https://lore.kernel.org/lkml/20250521225049.132551-3-tony.luck@intel.com/ that exposes an
event property.

It looks to me as though there are a couple of changes in the telemetry work
that would benefit this work. https://lore.kernel.org/lkml/20250521225049.132551-2-tony.luck@intel.com/
switches the monitor events to be maintained in an array indexed by event ID, eliminating the
need for searching the evt_list that this work does in a couple of places. Also note the handy
new for_each_mbm_event() helper (https://lore.kernel.org/lkml/20250521225049.132551-5-tony.luck@intel.com/).


> +
> +	smp_call_function_any(&d->hdr.cpu_mask, resctrl_abmc_config_one_amd, &abmc_cfg, 1);
> +
> +	/*
> +	 * The hardware counter is reset (because cfg_en == 1) so there is no
> +	 * need to record initial non-zero counts.
> +	 */
> +	if (assign) {
> +		am = get_arch_mbm_state(hw_dom, rmid, evtid);
> +		if (am)
> +			memset(am, 0, sizeof(*am));
> +	}
> +}
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index d77981d1fcb9..59a4fe60ab46 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -559,6 +559,23 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>   */
>  void resctrl_arch_reset_all_ctrls(struct rdt_resource *r);
>  
> +/**
> + * resctrl_arch_config_cntr() - Configure the counter id to RMID, event
> + *				pair on the domain.

The sentence seem strange, should "Configure the counter" perhaps be
"Assign the counter"? Or if the naming requires "configure" ...
"Configure the counter with its new RMID and event details."? Please feel
free to improve.

> + * @r:			Resource structure.
> + * @d:			Domain that the counter id to be configured.

I am unable to parse description of @d.

> + * @evtid:		Event type to configure.
> + * @rmid:		RMID to configure.
> + * @closid:		CLOSID to configure.
> + * @cntr_id:		Counter ID to configure.

All four parameters descriptions end with "to configure" ... but it is actually only
the counter that is configured while the rest is the data that the counter is configured with, no?

> + * @evt_cfg:		MBM event configuration value representing reads,
> + *			writes etc.

Needs definition about what the contents of @evt_cfg means. This is the API ...it
cannot be vague like "reads, write, etc." but should be specific about which bit means
what.

> + * @assign:		Assign or unassign.

"True to assign the counter, false to unassign the counter."


Needs some context here about what architecture can expect on how this function will
be called. For example, "Can be called from any CPU."

> + */
> +void resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
> +			      enum resctrl_event_id evtid, u32 rmid, u32 closid,
> +			      u32 cntr_id, u32 evt_cfg, bool assign);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
