Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BC13E47B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743462096; cv=fail; b=p6PaPYtw5VcfY8q03z/z6AZ+dz+rngMs2Nqia9AkRkpeBK8DUAJshIOuUZhocHpjA6fVjlvEJlFiIxXGzLFlQ0jtcIFtuB6UrTUCppHiGxVeY8Skthu2cKfm34quYYxzxWOqzkA8Kubjd4LoLBH+EIQ6azL5lOPpl2TxpqdgNes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743462096; c=relaxed/simple;
	bh=sp0tgXg23+jmvHbPnG4U5oy17lt125B0foS+UJY2y28=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bpAZ4Sn8f2LrAvoEdwLGyTOnXeyJ6vd7MIatYratHt3FZDKd8k23oGNsMbyOfsBsO6yN8ufQ8dpLwY6qqAloagYhA54s7RazPWbr7RV7e0g60uSMq38wSM6GFljO433us95Ci1oUDaE8XPfK7pYPa1D420bOx4EItYt13ZfL9gA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JhzH8h47; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JhzH8h47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743462095; x=1774998095;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sp0tgXg23+jmvHbPnG4U5oy17lt125B0foS+UJY2y28=;
  b=JhzH8h47XRE6nP901TGdr35oHKkDyPzC4Xj1V8PQI3/JQSQYjPXkAm2e
   iapn6zd3NXJt4KEWRRHzgeJXahTSAMGsPaGNHRx8h4Q57X3hlQdjlj449
   0tSXC17G9XZQO/xbDkxPkC7qsPaK20Wz0UqQ96SwQabJJk30k9bnobPq1
   MnZ0yy0Do9mkPPSHxyw/TdgSPy1OUjPIP/GuVHLVoH+tSjwBX5SDWkrRI
   hno0Vc+T+TCsEf5ovXfZkW5nBsky8h5voRA7DomV8H+5pem2dUVioMOA/
   88AhO+SwJ/qmhzBfogQislVZX6Re79ERWgCjevHF59vpwWm90a7sgY6eG
   w==;
X-CSE-ConnectionGUID: 3SR2ZdhWRHGOe+kyBPdShw==
X-CSE-MsgGUID: hkphA2qdTymxQsTmOWCWCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="32368296"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="32368296"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:01:34 -0700
X-CSE-ConnectionGUID: B72NVTSYSk6afx7Crtl37Q==
X-CSE-MsgGUID: nShKX5FDT5CbMfun9Y2fHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="163445545"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 16:01:34 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Mon, 31 Mar 2025 16:01:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 31 Mar 2025 16:01:33 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 31 Mar 2025 16:01:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T/DwMhru32W2AX3Nh9zjWlZF+OtcoxniOlAM9biUtNHwJQykNvzmBDTzRtUGpnp7EH8h/HgE865FVeY85L1nKzghqM1lhitT5oDCnGBvJAcXwujgp4oWkyFG9nhB0Cwdd5kG8CaUoXNJEEcCqdvtmgPrVyKjAZnhFhMGm3hoZAYs07EjpLlBsbrjGkQNumEUbWhzL0GgPVmkIXcR/pMRb3sQ2qMKHq7OM/hp38uI6ESxRnlb1k+3Qax8zni4ubGzoYDeyzoaMpJiNjQkenGOlfKj50IONcdmEIatRVNFyS61TUR0K89NVTFVAAARRsu0sSeSKqLNcwaCD6CdUEt66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pvax5vncJBWGIC0l2xdMIgOyW8J/qgFTUkpyg8+XtuU=;
 b=ZF72k+RUGfWMd87iR8sohixMTJtwwcssg7fB8ZPx+mnp8cSBbrem3uDfGihyicQ0HHK2ixruO0lBkxX+WyDB+Bz3zhaTeELYqwu3FTr4ZUS/WivLYeG+tAH/ouqLlUJrO5K+FQsDM5keGZE77HK0wIg+kvu0Wufp6Pi1Fi6jnilOvmEAZGojekw2R+nbXzWClc39Zbgu/HEURW/+5jZHH7FaTnCQNlpTMQPn6lZXOvzWt8yGuxp3nnvFqd+zGG5118dJmwqWBjfG1NtsS6GM/SxTGMbV9oJDf5zoPT8DEA/2eeWJIA5y8VJxrYZdN1WpmJCk6Afx0Vc4RS1FgDIp2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3320.namprd11.prod.outlook.com (2603:10b6:a03:18::25)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 23:01:03 +0000
Received: from BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b]) by BYAPR11MB3320.namprd11.prod.outlook.com
 ([fe80::e8c4:59e3:f1d5:af3b%6]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 23:01:03 +0000
Message-ID: <65011648-422f-456d-82ca-0421d151290c@intel.com>
Date: Mon, 31 Mar 2025 16:01:01 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] x86/nmi: Simplify unknown NMI panic handling
Content-Language: en-US
To: "Huang, Kai" <kai.huang@intel.com>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "kirill.shutemov@linux.intel.com"
	<kirill.shutemov@linux.intel.com>, "rppt@kernel.org" <rppt@kernel.org>,
	"bigeasy@linutronix.de" <bigeasy@linutronix.de>, "jpoimboe@kernel.org"
	<jpoimboe@kernel.org>, "pmladek@suse.com" <pmladek@suse.com>, "xin@zytor.com"
	<xin@zytor.com>, "Luck, Tony" <tony.luck@intel.com>, "tglx@linutronix.de"
	<tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "x86@kernel.org"
	<x86@kernel.org>
References: <20250327234629.3953536-1-sohil.mehta@intel.com>
 <20250327234629.3953536-2-sohil.mehta@intel.com>
 <192fb9f452909e722cf353cfc1bbea322e2f2cd5.camel@intel.com>
From: Sohil Mehta <sohil.mehta@intel.com>
In-Reply-To: <192fb9f452909e722cf353cfc1bbea322e2f2cd5.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0288.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::23) To BYAPR11MB3320.namprd11.prod.outlook.com
 (2603:10b6:a03:18::25)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3320:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: d7d913c6-da52-4fbc-e57a-08dd70a7e91d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWgrcjNMeEYveE80Y24wWFdnUEtMRlFpeU1nYmdNcFJwYTZkSlZHZDkva0lX?=
 =?utf-8?B?YnpMTzRFQzZVZjRad2w3Q1BobUpzUkhxWHRmbXNjVmE0ME1nYXdId05OVFNW?=
 =?utf-8?B?Rzd5WGthTm1FOGRuMmJKdGFBa1RzZnhGMkg2V1Fmd0ErRnQ2bDlCTHRWQTlj?=
 =?utf-8?B?NG1WS2w1clhOcHp4RFZYSEozKzhERFE2c2JSSkNOelhKUlRvMzRaYXRlRGZ5?=
 =?utf-8?B?WjlyUEsxSXZkcHA5SXZaT3lNVmRnSmhOZVhZdXdMWkhiRTlIL2V0T0gyOFVF?=
 =?utf-8?B?U3pYc2xmbVRvMklkZUZUMlZGcGVmT2dwdkFqRG5DOVFRNW1ERVVnYW9rRzMv?=
 =?utf-8?B?S2RQN2hrMzBjMVR0Q25ESU1YaElZamh2YkpkelVZQWo4YjY5VDlIR0liY0c1?=
 =?utf-8?B?MW16M1dLeVlrTjZPZUZLOFhyUWtqZWRzR1lkRHlHQzlTK3BackV0ZUlnTkxV?=
 =?utf-8?B?S2NnN0tOS2Y0WlpmZlNQM21ETUM4UWc1VzRqdXdrRkdxWXQ2cFlxbzZ0N2py?=
 =?utf-8?B?V2VDWnRsSWlvTk9LZnc2NTYvbW5Mcmd2YS9sUVIyYk1iSlFKcDRHN1N3TDZY?=
 =?utf-8?B?V2NsTzNTblM1blF5c3lkeThhaXN3UFpPazdSY09mN25wRVExbGx5dXdiOEsr?=
 =?utf-8?B?aldSZTRkVWt3cUNuWEZtRG1JdjlKYnpkTVY2RXZOVEpFSmNObzFLL3V1dE5u?=
 =?utf-8?B?dlBXVXkwU0lPZ1plRFJ2akpDeDhieE1mdEs0cnovcTNCMDBKMzBDMnVLVFAy?=
 =?utf-8?B?QS9zUmx4Ri9yeTdYVmJ3WDBTZDVaMnFLRFBRdGVOeW5SQzQ3elptK3lmS3RH?=
 =?utf-8?B?RStHR0QyYk5Jb3FxSjZKYTAzWUxESGdKNU5VSGxhVFBEdVQ1UG9EWU9yVHBJ?=
 =?utf-8?B?cExTczkrOUlLSkV6cGtaQkdoeGljOWVUVzZZdTlPMlBkUWk1S1l3L3UvRVVB?=
 =?utf-8?B?cjhQQ1BUL1E4cXRlamFoc2x5SXNHOU5JQjV2UElkSm1jdlVQd0I0NlFlMUtq?=
 =?utf-8?B?ZVRkcCtWV1ZDR29KK2RnMFJqaEhnelJ1N0NJSkhmK2VCOWRCNWRqMHV3NWJh?=
 =?utf-8?B?R3RzbWdveGJQb3g0S0RZbUxHMmpwSERzTEtybTg0alFhdVA4OVhqSHJBNkp4?=
 =?utf-8?B?d2VMaUt5QjR5ZEo0b1ZGVVZabk5oc09Ya0wwcWk1TTZIRGZpZ3VHRzVpcGVQ?=
 =?utf-8?B?ZUdaSUZOQ2RRQVRWUzhtWGhqMHhDT2laWm1JUTRlQ09yaUZqaU5VRjQwSE1a?=
 =?utf-8?B?ZmFqRFJoNDhlckNVWGtKMnhjTEI5cVpBU0p3eU1DejRKUmtJa2NKRDdnUm5w?=
 =?utf-8?B?enp4NThKVCtXOWJDTWw1U09hT1dWVDR2cUxDa3NvTTE3akpWUmRRakwzUXNr?=
 =?utf-8?B?dS9GQWNMdUlZWlpxek5WMUtWa1VUeVBUdUZMalk2Mklha1BNOFhPdXZ2aTB3?=
 =?utf-8?B?WkliV0p3aTNzWEpNeDluVFROc0hNajIwSWhmYXNjZThlRUZxWXhwcHRmZVhs?=
 =?utf-8?B?U1VHeVkyTnFsTk5OT2ZUMGg5Q0NmL0dtU3lOV1Q2SVhjblN0KzV5MGQzaFdj?=
 =?utf-8?B?SDZqaWk2Q2FiVFhzZ2ZXK0xYWmRMQVdUR1R5a3VKb2ZxQlNIMTI4M0hBS2tF?=
 =?utf-8?B?UmJRVmsyQ1JGV1RRTXhJQ1psRTEybUtQSC93Um1ySkFxODVCQ29qc0ZZOGpR?=
 =?utf-8?B?eThQc2FYakJzb0duY2xlNDRsY2E1STdvU1FwNVlOZzVvMzN3b2xtK0JvQzhI?=
 =?utf-8?B?b09UekhyRm5WUk5wREdhSnNqTWJDNzBJcFFpcTNvc1BqclNUWC8xbDVtRkhW?=
 =?utf-8?B?WUdkOG8yOGlQRHpTbzA2VHNWM2pIaXcrQkQwMVlEMVVTRzdEbVFoSDlkUm9X?=
 =?utf-8?Q?Bae0pMZyZDlbB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3320.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b21jMXdUald2VVdGa3NUdE5HNWtWUjR4NHFHQk5WZ05CYUdUd01wNUhOb2F4?=
 =?utf-8?B?QjFqU1ZnUVF1S2FUSTg5WWh0TGJzdnAzKyszTW1TS2JuV1VMVUk0SnE1VDlX?=
 =?utf-8?B?WUdLTlVxUlJiaHZ6WVBJanpuNjBxSm5WbDMvdVhoVEw4aGMvcjBvTGw4Wllx?=
 =?utf-8?B?Q0NzNXBVRGpoRE96N2ZZTE01SktvRS9LOTR4empwcEx0MzBlRlZabnplUW9a?=
 =?utf-8?B?elpzT0xEU3lJdXBpRlBZQlBVSi8zS2xGdFl3aWZhdmNOTFVvNWxjYW5PRFVP?=
 =?utf-8?B?OVU0N1JHSzlVVTJvS3Z0THE1Ykxia2pNazJEWDZ2NUZKOHhMTkJPcHhPeGIz?=
 =?utf-8?B?TUtGNnhnaG8vTi80N0xMY0ZtTFA4cDRWLzRxKzlWdUVkU3FRc2lrMjNnT3ow?=
 =?utf-8?B?cjZWUEVGWjJodDlrcVJxQ3NFQmNDK3R0UlpZQ2FtczRHYlRMSU1xeHFEVXpF?=
 =?utf-8?B?bG9CcG1DRGpxTk5QRkc2KzYvV3VOVzRPeXd0TE8yaWk3UWF4eFUrS1VJMnJs?=
 =?utf-8?B?MmFCN0YyVUQvWWdKZy83VjM4cW1vWnpWZmdWNU15UmhtV1c1S21naGQvZUtX?=
 =?utf-8?B?L2dIdHlFQjlaSDA2U2RxMVJkcDZsbXhldkJRN2t0UHB1ajBHMTVLdnhCSUpm?=
 =?utf-8?B?b0Z5bWR5ME5tZUtUS3V6eGhzUXVIbXkzZVl4dXpoWGYzMUFSVkxOa1F6TlRQ?=
 =?utf-8?B?RXU4TVdEYWJmVmgzeVhFVFZxdzRJc3FxdjR3Rko5UjQzdDM2SFI0NU1MN20x?=
 =?utf-8?B?TzJGRHA4T3dkSWp6VTc5VDMvK29XQlFJRHBFdmZjWlBPSGpjdDJCOXVmUGVj?=
 =?utf-8?B?aFdYTmNZYm1maHQrbmkzRE9FQjVYUnlKRW5Zbm9DK3ZPWVpTWkkrSlA5VkFG?=
 =?utf-8?B?c3dscnJ6eGVkL2ZGSjJvSldGMmFveXVna1NvQWZPdVdGbXN3Nmt5TFhUY2Ry?=
 =?utf-8?B?aHJKUjQ0dXkwUi9oaVd2aGhPOEp3MjI3dWF5VDhJSTV3ZGxwUnRsMEUrNU54?=
 =?utf-8?B?d1ZTdVAxcmMrRzhjU2ZIdkxHUmJrVCs4Z2FZeEIxb2dLMWxFVExoTjhYbndn?=
 =?utf-8?B?SkRRRktyam1lRTJiRjFMZnFBSC9PNTRrK1k1Zk96VE1VYXMrSlM2d1BrNGNX?=
 =?utf-8?B?OFp5Tys4djRSeGltR1M4Yld1YXdhK29md3JVTW8vYkplTGlaNHRVbk5KWmZh?=
 =?utf-8?B?b015bEh3RkwxWTVSSTFiblNwNVJhRDgzNXZyTGk1dStEWXMxbUxGRyt6M1Bq?=
 =?utf-8?B?bEVKLzVUUXJtUm04NHlnMmlBam5ObjV5MnRqUGY3Qk1VYnRuVityTzdWZDlH?=
 =?utf-8?B?M1gxcEdPYktORDlEd2NMbkZjN3JXeWM5Z1h2Mmx3Z3FJQVBOc0lLUFF2MCtK?=
 =?utf-8?B?bzhaR3VsS1I3VHY1UHpnd3pmb1BpNW9nZ2lSbE9kYWcxR1hTb2lKZU9YY2VR?=
 =?utf-8?B?cklJcjJlUGM2R296NTJ6MnhNUXlvRmQ5RlB2MTRWeFpRaEN0aDBEQlJ1bUZR?=
 =?utf-8?B?WFlIWkpJb2Zsa0h3NVdvMUFBbjNBVnJadDNEcS9CUHFyRFFkVjFseHVlRTRF?=
 =?utf-8?B?dTRCbkJadHc3allUekpJMEhkNHRkSlpBWFo3TlhWcHAzVWNHVGhDZTlCeVUy?=
 =?utf-8?B?MCs0VWhDRm0zTGlvdVBndmN5MzNrRWJPQ3ZhcEJnREFxdDFIdEQrUnhRZDhS?=
 =?utf-8?B?OUdPZEtoWjdaVUZLaUxxRDVsekdFMVNpcFg2VzFEdFE1TDA5bmRzZjQrYXRV?=
 =?utf-8?B?dzNCTGFyOS9PUTB2WENhRFdTcXZVRks3dStxNWxOcERGcmxpczR1ZUVFRGtI?=
 =?utf-8?B?bVVuVnk4QlRwN0ZoSXZZbTVRbjJ3bEphMEF4NE5OWkMyRW9vVjd0ZzhQMUx1?=
 =?utf-8?B?NC9aL2VCejZXbUJKMi80THFDeGFaM21tbXJEZGdqVmt4Z21hWDJtMkNPRWcw?=
 =?utf-8?B?K2tYS1RsSEY3bTBCQ2sxYXlVTTRKQTUxckZZTEJycnJJeUs4czRxS3p6Rkg1?=
 =?utf-8?B?WmpXU1daQ1g0MTBidVJWbkZkYzlhMXFtVytFU0lqd29yMkM2UjQzS0o2bkVO?=
 =?utf-8?B?SWJPdGluenBWMHV1QVRtcXFQakFtSUg3eWc1M2RVTjRpcGdodGU5eGlsVGJp?=
 =?utf-8?Q?7X7p0+l2mznv+uk6c3ayvFT0X?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7d913c6-da52-4fbc-e57a-08dd70a7e91d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3320.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 23:01:03.0875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdE5G3Fsf4HMZX8B9A1S8GZyOtrbTA2v7BIem8eQRwMXCRDE9K26HB+ruM3z1PmSEe4V5mgPVB3oJgNSnfBCuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
X-OriginatorOrg: intel.com

On 3/31/2025 3:52 PM, Huang, Kai wrote:

>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index c7164a8de983..c3e1ae7373e9 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -7,10 +7,11 @@
>>   */
>>  #include <linux/acpi.h>
>>  #include <linux/console.h>
>> -#include <linux/cpu.h>
>>  #include <linux/crash_dump.h>
>> +#include <linux/cpu.h>
> 
> This code change doesn't seem to be able to make the headers in "alphabetical
> order".
> 

Ah! Thanks for catching it.


>>  
>>  #include <asm/apic.h>
>> -#include <asm/efi.h>
> 
> Seems this header just got removed here but was never added back.
> 

<asm/efi.h> is included twice. Therefore, the diff only shows it being
removed.

>> -#include <asm/numa.h>
>>  #include <asm/bios_ebda.h>
>>  #include <asm/bugs.h>
>>  #include <asm/cacheinfo.h>

Thanks,
Sohil

