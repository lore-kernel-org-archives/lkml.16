Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C862581
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 00:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750552811; cv=fail; b=mR05nmv5tJdmwNWjEj0Iao0647K/mioK3Dz8PbTmzxWg81bLpOSAG/q4qg/GLddlcrHKSDKALxi5cqLcWpsWtlUIQrq9j6gGp169bvqZG0J1Mzfk2FbhxVeUfMOgAsHt/POUF2RHL5fisBQWFbmQc6qxKp6FqzHFGVlSU03Tywg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750552811; c=relaxed/simple;
	bh=C1AbsDMieFCVMbRVc4gcJ+XgQT+cp9LWxuImkSwV8JI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=jirFkwWblRvEIuJ1kx7sQu4EzYK1vrSyNiiGKQ2THhioNa5esRHgQWPxQcZpSq4ZtkhBIBvL4r+a0ceX3afJu7d3LDsTuwpRlD3I8K9Yg73/6smjDVwZOo7th+TCmcx1iXfdfhDnxmFJ2UexyuhzU9ryXrhgNidsaE5z0gjHbgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gbi6rhLO; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gbi6rhLO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750552809; x=1782088809;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=C1AbsDMieFCVMbRVc4gcJ+XgQT+cp9LWxuImkSwV8JI=;
  b=Gbi6rhLOwf2LWqNt2UeTZPNPvx03VB72JJziHAMJBuERF4Vg3dY6U6uj
   CdfDr0vgAI8D5q3jefbmRGPAXVLKVuoXjYhOOX1LA/YVvF1xzcvJAo32Q
   BV5EhBYCWrJul1iERqFc7WBWITRwx8ObGsuayC9zToQ+QrdjWJI0mPAlk
   ciHyboqTyz6Kw9pUdVKqpjB7UJWr2RQnP0sUrq9osv9bvY5qsr4+JrP1z
   FwUM65MmQOTbKoeEOmUzzx0rFGdeFZrmfvSBpob9KZn9vuhCNdmEfYiSh
   wVXDfERzfveEuZ+vTbPB2jfv/ECHd9kPT802qVBu3DNV40vMqOC86b6Go
   g==;
X-CSE-ConnectionGUID: 9yXLvW83SMCKqiX3/4okFw==
X-CSE-MsgGUID: M/ibvHI5QQChT7qj8b8Pmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="40390249"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="40390249"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 17:40:08 -0700
X-CSE-ConnectionGUID: 2DLtyYHrTJSQlVoMpbHfMw==
X-CSE-MsgGUID: av/Wr140TyebMW8Upk0eew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; 
   d="scan'208";a="150656338"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2025 17:40:09 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 21 Jun 2025 17:40:07 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 21 Jun 2025 17:40:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.75)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 21 Jun 2025 17:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oWBE6YF5g7jTN4gYFTFj6MeSzLXd62TI2uh7QnxnAeyXhZ47KpUBs1xUhoFEcR5I5ltjSCyHS0vlpMMEBgYuthIZ2gjft6l/xljihcFlHvwPjtlatcpNyxeL3Vglx4SRTn6Yz7yuX5Bx/XQ+2wVvBgObHmfqwRMpS5PINRKqdJ1PbaL26RzaizI5REpM+n/J2zDVsSTc7ONMrLUXgyxuyxHtt9NVb9G4NdHCzaYcVlpUq7kS2NpDNeB2aH3BVcPsZB+pG+tNwNQDzoxo7Y6phdV3Ffh6th43Kx/V/YHzaoPERxbrCsH3O04tsSpXj/BSluYzSu+sLBqW9MPx9pP1ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WgMu7nLO+aqPpHl2+VYjXD17+Ul9JZyjXeDiIjpdBo=;
 b=Q12v9k9eE20mVoYyDZyha1pgxpbZErfA3Dt/xQnQOTDvnZUa+s2mXdQBrFJlG/rVmC4u4B1U1UDWLdWDLZpYdq2luX7rZZ1XjvYEgl9uE35yu84qKKQ5Pm/LPRn/v8bZJ4lzdmsqnTyrgN7Hfm7nuQWvkVcWc0izgmEH75sMQuw+MTFjQMaOgA/OLeTrN/ftY33LxI7zJa00VNlZVZVbW617NVsBNRbMzt5eBvRrd+AP8m5PvqlC+uApuUK/gk1zVljv5HnpWHi61Le+AEqfGK/LLuj8pk7PBGGqqXWGKAar/x9jBcOrjFshwCIs+/xu596EmDEyqsxiteFb512jFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 LV3PR11MB8693.namprd11.prod.outlook.com (2603:10b6:408:215::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.21; Sun, 22 Jun
 2025 00:39:51 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.019; Sun, 22 Jun 2025
 00:39:51 +0000
Message-ID: <c9328e19-3b18-4ea3-a692-9cb02534e5c9@intel.com>
Date: Sun, 22 Jun 2025 08:39:38 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 00/20] Cache aware scheduling
To: Madadi Vineeth Reddy <vineethr@linux.ibm.com>, Tim Chen
	<tim.c.chen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Hillf Danton <hdanton@sina.com>, Len Brown
	<len.brown@intel.com>, <linux-kernel@vger.kernel.org>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <8c98fff7-fef3-494a-98a3-4b6d4cc2e6d1@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <8c98fff7-fef3-494a-98a3-4b6d4cc2e6d1@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0186.apcprd06.prod.outlook.com (2603:1096:4:1::18)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|LV3PR11MB8693:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe65016-69e5-4da6-6e50-08ddb1254c47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clpEam1mbnB0QjZIRTB5YVpMRUlTVktQdUdFSWpLSWxJSHBNWWwycUIzMnlo?=
 =?utf-8?B?N095RGt2bzM3K0Q2dTVlbXhLb3FpZEcvU0tsaFNBeCtwNEFPemdhb0xOa0dF?=
 =?utf-8?B?SW1lVk1OUDd1Sjlpb3B1UHdnWmNjbmR2ZHBhcjR3bTRMY24zWGlzb3E3U2Jo?=
 =?utf-8?B?NGRIbUtGNjM1cjdFRmFGV2pMaFpWY3hWczk4YUpXWWJRYmlhb2puQ0tsR1Fi?=
 =?utf-8?B?MGRhdHgrRUFsS3pqY0tzOENZeHlldEVBNGM2bk5XSzQ3dUIvV0ZwZEVvUDRv?=
 =?utf-8?B?NHl5dytkVzMyOTB2a3FRRUVpV1NBRURyb3FPK0NOWE92Vzd5akxwc3pVa1VG?=
 =?utf-8?B?cmp4dTBEcW9OOUxxVWdGalFCSWFqNml2c0NkMGM1Qll2QWQ2WHNaWFpYYk83?=
 =?utf-8?B?YnZGcy8rRTMyaVZWOGJGckRlS0d6OFJaL3RkTHRxSC92NFkvVlBFWVVDWm9C?=
 =?utf-8?B?b2U3TFhGOTFXekVCbDYzYXM1ZHk1WlEycXZab3dLNE5BdFpXM3JsWFV2cGQx?=
 =?utf-8?B?UVV5UytnaU8zU1p6LzdvVW5Eb1pTSGY1bWFkR1ZiL0dTYUY2RCt6K3RHOC9r?=
 =?utf-8?B?aFlHUDhIcXAzMXZlaFJmM1lUcFRiQ1BTV3ZjWWFZVWtseEtmYkVmMlZ4QjRB?=
 =?utf-8?B?aUsxYTN4SFdzUERmbFNYcG5sZFE0eUxPYVN2c3M3VlhUUDBIREVldEk4Zkcx?=
 =?utf-8?B?L1RyR1JUalBUSFQyb0VDLzd2SVRnbk5hN013TUY4M1pMV3ZZWHdwYk5zUWVq?=
 =?utf-8?B?bXZkN0lPUzBNcXBoVW40M1ZxWkNsckc3d0IvWllYTEkyMVZ0LzFtcW1qdHFJ?=
 =?utf-8?B?Wm5SL25yVUV3VVY1OWFiSzRGMDc2Rmo3V3pWdHlVbHlyRG5xQkozeHJDUkxT?=
 =?utf-8?B?dmR5TmFQckJtbGQrK2NUVnkyZER3MmJPQ0QxUGVjM21QUjdhd3pBZzRBWG15?=
 =?utf-8?B?bk9vYmtnT2l1RVFkZUJOeWRIQXdiNlhPREJNdElISXV3NG9iOFJucWNDa3Iw?=
 =?utf-8?B?cXJNUWM4ZlJsVUU4VmYrYWVMQWxtbzJieVBSWkhMNjlnU2NwQU43Y3JyNW5Y?=
 =?utf-8?B?czU5c3NpTzBlU1BIckZGV3RyaytYZ0N3NGk1U2JBMWFhNkZiT0J5azF4UUtX?=
 =?utf-8?B?UDJDSTZHUWI5VmFmTTZzNVNvL3p3VTQyNUY4RFRlaE81RHZYa0Z2SHlReHJm?=
 =?utf-8?B?RG9rb1dGaWVrcnBCU0lIYnk3ZE5WdGNrVnAzdjNjRDlWVHNCYy9sejZ6MXZP?=
 =?utf-8?B?WHVUb1V3Y3p2RGhXNkQwQmdkTHNiOExvNkp4dlpFQkJaSnFCOExDUnpMVzA1?=
 =?utf-8?B?Y0dIMUhxbnFDdnVoR1IyYjBseDM2VGUwYVRUTU8yNjNRT2x4RUdPaDJ1ek1I?=
 =?utf-8?B?QWNMaXNWdy9EeXFBWHNJWDdXMjNmMkNzKzRSVEdqNVg2MC9DdmNqM0JTOEF4?=
 =?utf-8?B?Wmt3SXhoT3VyWUErNnQ1cGtlQVByNTArbkdQRHdEUlZwUzFWTmo1SnV0aFBF?=
 =?utf-8?B?YW83dm1hQWF6bCtwbFlINUl0YWFERkFzZUgwaTh6THlVVUdoMzhNL3EvZjcr?=
 =?utf-8?B?VmRqNHFPaEJHQmpUMUtrZ2xSN0syOFlhY1dDQU13U3JrR0t0UW12UThZK1Nm?=
 =?utf-8?B?NGJGTmsxUDA3RlJLRmhyRnZxZVpFM0dhN2pDbVlmTTBoQlNnNXVnNkNRMUV6?=
 =?utf-8?B?OG9MVWIvMmV5YkwrR0hkSm5jdktndjlpNW9kUGF1bmZIS0N4NG9FWlJTbFBk?=
 =?utf-8?B?UldBUUo1ZWpxVjVKNzJZY1U3ZTRwbzdKVzdKMkpTMHJBaEJQTHFpNnh5bkdG?=
 =?utf-8?B?NnVtdEtBNjhucDNERGpBUkttWGduU1ZSdURUb08yUzkzOGg0TGJyc2srSnZY?=
 =?utf-8?B?RXBTMnNkUTVkalkvWEp6MkcxLzA3eTVXaEhuWFN0Z040K3VzUDZSZ0FNTUNn?=
 =?utf-8?Q?A1kwTfezQ8s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEl2KzVMTGNHRlRqdkVyUEg3VkNzbm1iVi92QktjVndJL0F4RjJ6WndGd3BE?=
 =?utf-8?B?NTFvaDdZajd2bkRJRldWTWl3cUVOOW40QzAwMU1zSkNBR0NtU1RkUlR5QTRL?=
 =?utf-8?B?amJUaHZxdTlMREJDQVhiZ0hMMWpQTmVEQ2lsRkU5d2lkbFFCU2t1eThkeU9T?=
 =?utf-8?B?SEx6SWxYcHFBS0dOMnErMTJ0dkF0eFp6Y1Mvc1YrRmV1WjgyOEMyQktpZ1ZL?=
 =?utf-8?B?OG1obDYvQVg4Q2gvdEQyVE5YcTFDcUROU1VmZ0diYVZ3d3ZtQmcxSEdUcGFn?=
 =?utf-8?B?b0VhcUtCdGNHaEtodEk2S2hiZmhILzIwelRtVFU4ODVJZFBxMnhjZ1NKd1Bv?=
 =?utf-8?B?NXdZQ1hERlR2RGd5Z3YvSTZZTGVLOHowVjVodEorblJzbTJyTFdzOXJLRnpy?=
 =?utf-8?B?VXAydjcwZFgwRnUwYWh0cjA2MU53Zjh4aFJqSEJIK3JCMmdOSlAwTitpT3BH?=
 =?utf-8?B?VXBNT2Z1VVExL2RhQXk3WFNzKzJTN2cwR1JHeEg2T3lyOVg5SDJXTTJPKzNC?=
 =?utf-8?B?OHlhaVF4U3hxOUJRbDlIWlNUWFBIN0JiRjRCVEliL21ZaEg1eHVYMHVhZEtm?=
 =?utf-8?B?WWtSbzA5dFpJR3hQSVcyek1HRm0vTnM3K1pHTDJlc3hhQ0hhNnJncTFobXd3?=
 =?utf-8?B?bG5yUU5nK3hyZkN5QXpIMnduUURXRlZ0anpqQTZ1ME5NaFlnTW8yNTVpNHNl?=
 =?utf-8?B?cFQ2dWRSYmJVeitxWjIyb3F1Y1QxRm8vbzhmRGJNeTJXdWRsZUkyT3Q0OXMy?=
 =?utf-8?B?L0ZJRVA5eWJ2RHVsMUhLSUdKQ0R5aE5SODRTNDdyREVyOStLb0NmNmhDZ1FX?=
 =?utf-8?B?REliZnBGSDZsWnNQQTRSMlBFSGVCbHJOc0c2TzcrenczaFdpNFd0RUtucnZm?=
 =?utf-8?B?SFJIUHZ5d1dHeExNS0RqcktDN29mOFFXQ3ZoTlN4T0hnVjhCOEZES0xkWjBF?=
 =?utf-8?B?clIyODIyQ1NTTk9veGVyWW1zekNVSDZJeDVuVWxJY0Vzc210VWFZUDNzL0ZT?=
 =?utf-8?B?OEZQNDlLblUyZFB2S2w1Vy94Y1NWSHgrSTdMRy8xUGgwSTlEMGFjbHRVbS9j?=
 =?utf-8?B?MWhxcFhCblNXR1dJSy9hS3RCZ2tvVTQ5OUVQbzYzZ0E2UjY4cFIwOHlrTE5y?=
 =?utf-8?B?MmxxVnJlbHhiK1R2Mm1GWEkrWExsYzROUHR0alo1UitlK3NiVkY0WnZaNXhY?=
 =?utf-8?B?WS92eE1LRDNpUEtESXFvV0VMc1J4UE5wSnR4T2xHdnoxaDZ4dE9DeEloWUxL?=
 =?utf-8?B?TE9NMXQ2MFAyTlRmQXRqVmc3c3RTNFQvdmhNQ0hzTlFjWnpWeVNyZ21vUzlS?=
 =?utf-8?B?VXVqOEEvZVhNbWNnNFZ0UG5UMjhQcTVMOXhweXBSME84czlzb2NQeHlMU1Rz?=
 =?utf-8?B?OVdHYVI1aDJsc3BSVFAxZmpsOVpBS0hxeURUaWN1N1JpOWE2U29nMjFFOURi?=
 =?utf-8?B?WlBVUjBZMHJFN2lLdHZQRlYwMFgwWDNlaFVFYXF3SjQ3ZUl2bktVOXlDazJa?=
 =?utf-8?B?L3ZJNnViL0RvL01NTHVES3JTaXc0NDd2a1ZCOEtjbXF5amdlR0RyOEJTOXla?=
 =?utf-8?B?SC95cGo1WVV4RVBldlkxYkxYbkF0N2xzUnMzWFJWRGdxbXJWN0dZRXRVVit1?=
 =?utf-8?B?Rk5ieWdRMll1MXUvbWZsSHR2VVVFVHM3TXFaSGNTMUNqNVpkTHkxczFpTFhn?=
 =?utf-8?B?cVFGTG1RdWIzS3dQYXJxbzgvYWVaNjFOeXQzVXFQdlNKYUUxNFluVXZGekdL?=
 =?utf-8?B?N1hSOU1zMjRLNHIvMlc0N1lBVDJzVXZBS25od0NURTA3UVlXT3pnWmJzdmRV?=
 =?utf-8?B?aUU5RTdVOUNvbjR0TlE4Vll2V3VEUVRMM292VlM3SEdCV2lWajU4bzU1YXU2?=
 =?utf-8?B?c0tiamxKNjV6cjQzSHB5ZXVUMlBqemxHQm1oejhmb3hyN2xCQnpocWE5ZmdT?=
 =?utf-8?B?NWNsOVhxZ0NwZzNIUk1PRXZqSVZpZUhLd2pzY2pCS3l3eUJVVU0rV2FEZytu?=
 =?utf-8?B?c280WmxMWjlER3hHT1BZdG16NVpYOEFmeC9Ld2NOMFdZdExDcVV0Y3lGR01l?=
 =?utf-8?B?dWVjeERQa2Jyd21XWVJHRUZ3eGc5aHBUNCt3NkUxaWY4cHlZLzQ0NTlORlIv?=
 =?utf-8?Q?3kyhlMQz1hsKGg6bqrOfO/ZdL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe65016-69e5-4da6-6e50-08ddb1254c47
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2025 00:39:51.2191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22FlYJZ9N+WrXQnuM+wve3XhytIo2E+8rdNPHtusJpO7VXbG2XDx06dt3tNe99PHWgxLVtCI9h8T7Sxzpy4XAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8693
X-OriginatorOrg: intel.com

On 6/21/2025 3:25 AM, Madadi Vineeth Reddy wrote:
> Hi Tim,
> 
> On 18/06/25 23:57, Tim Chen wrote:
>> This is the third revision of the cache aware scheduling patches,
>> based on the original patch proposed by Peter[1].
>>   
>> The goal of the patch series is to aggregate tasks sharing data
>> to the same cache domain, thereby reducing cache bouncing and
>> cache misses, and improve data access efficiency. In the current
>> implementation, threads within the same process are considered
>> as entities that potentially share resources.
>>   
>> In previous versions, aggregation of tasks were done in the
>> wake up path, without making load balancing paths aware of
>> LLC (Last-Level-Cache) preference. This led to the following
>> problems:
>>
>> 1) Aggregation of tasks during wake up led to load imbalance
>>     between LLCs
>> 2) Load balancing tried to even out the load between LLCs
>> 3) Wake up tasks aggregation happened at a faster rate and
>>     load balancing moved tasks in opposite directions, leading
>>     to continuous and excessive task migrations and regressions
>>     in benchmarks like schbench.
>>
>> In this version, load balancing is made cache-aware. The main
>> idea of cache-aware load balancing consists of two parts:
>>
>> 1) Identify tasks that prefer to run on their hottest LLC and
>>     move them there.
>> 2) Prevent generic load balancing from moving a task out of
>>     its hottest LLC.
>>
>> By default, LLC task aggregation during wake-up is disabled.
>> Conversely, cache-aware load balancing is enabled by default.
>> For easier comparison, two scheduler features are introduced:
>> SCHED_CACHE_WAKE and SCHED_CACHE_LB, which control cache-aware
>> wake up and cache-aware load balancing, respectively. By default,
>> NO_SCHED_CACHE_WAKE and SCHED_CACHE_LB are set, so tasks aggregation
>> is only done on load balancing.
> 
> Tested this patch series on a Power11 system with 28 cores and 224 CPUs.
> LLC on this platform spans 4 threads.
> 
> schbench:
>                          baseline (sd%)        baseline+cacheaware (sd%)      %change
> Lat 50.0th-worker-1        6.33 (24.12%)           6.00 (28.87%)               5.21%
> Lat 90.0th-worker-1        7.67 ( 7.53%)           7.67 (32.83%)               0.00%
> Lat 99.0th-worker-1        8.67 ( 6.66%)           9.33 (37.63%)              -7.61%
> Lat 99.9th-worker-1       21.33 (63.99%)          12.33 (28.47%)              42.19%
> 
> Lat 50.0th-worker-2        4.33 (13.32%)           5.67 (10.19%)             -30.95%
> Lat 90.0th-worker-2        5.67 (20.38%)           7.67 ( 7.53%)             -35.27%
> Lat 99.0th-worker-2        7.33 ( 7.87%)           8.33 ( 6.93%)             -13.64%
> Lat 99.9th-worker-2       11.67 (24.74%)          10.33 (11.17%)              11.48%
> 
> Lat 50.0th-worker-4        5.00 ( 0.00%)           7.00 ( 0.00%)             -40.00%
> Lat 90.0th-worker-4        7.00 ( 0.00%)           9.67 ( 5.97%)             -38.14%
> Lat 99.0th-worker-4        8.00 ( 0.00%)          11.33 (13.48%)             -41.62%
> Lat 99.9th-worker-4       10.33 ( 5.59%)          14.00 ( 7.14%)             -35.53%
> 
> Lat 50.0th-worker-8        4.33 (13.32%)           5.67 (10.19%)             -30.95%
> Lat 90.0th-worker-8        6.33 (18.23%)           8.67 ( 6.66%)             -36.99%
> Lat 99.0th-worker-8        7.67 ( 7.53%)          10.33 ( 5.59%)             -34.69%
> Lat 99.9th-worker-8       10.00 (10.00%)          12.33 ( 4.68%)             -23.30%
> 
> Lat 50.0th-worker-16       4.00 ( 0.00%)           5.00 ( 0.00%)             -25.00%
> Lat 90.0th-worker-16       6.33 ( 9.12%)           7.67 ( 7.53%)             -21.21%
> Lat 99.0th-worker-16       8.00 ( 0.00%)          10.33 ( 5.59%)             -29.13%
> Lat 99.9th-worker-16      12.00 ( 8.33%)          13.33 ( 4.33%)             -11.08%
> 
> Lat 50.0th-worker-32       5.00 ( 0.00%)           5.33 (10.83%)              -6.60%
> Lat 90.0th-worker-32       7.00 ( 0.00%)           8.67 (17.63%)             -23.86%
> Lat 99.0th-worker-32      10.67 (14.32%)          12.67 ( 4.56%)             -18.75%
> Lat 99.9th-worker-32      14.67 ( 3.94%)          19.00 (13.93%)             -29.49%
> 
> Lat 50.0th-worker-64       5.33 (10.83%)           6.67 ( 8.66%)             -25.14%
> Lat 90.0th-worker-64      10.00 (17.32%)          14.33 ( 4.03%)             -43.30%
> Lat 99.0th-worker-64      14.00 ( 7.14%)          16.67 ( 3.46%)             -19.07%
> Lat 99.9th-worker-64      55.00 (56.69%)          47.00 (61.92%)              14.55%
> 
> Lat 50.0th-worker-128      8.00 ( 0.00%)           8.67 (13.32%)              -8.38%
> Lat 90.0th-worker-128     13.33 ( 4.33%)          14.33 ( 8.06%)              -7.50%
> Lat 99.0th-worker-128     16.00 ( 0.00%)          20.00 ( 8.66%)             -25.00%
> Lat 99.9th-worker-128   2258.33 (83.80%)        2974.67 (21.82%)             -31.72%
> 
> Lat 50.0th-worker-256     47.67 ( 2.42%)          45.33 ( 3.37%)               4.91%
> Lat 90.0th-worker-256   3470.67 ( 1.88%)        3558.67 ( 0.47%)              -2.54%
> Lat 99.0th-worker-256   9040.00 ( 2.76%)        9050.67 ( 0.41%)              -0.12%
> Lat 99.9th-worker-256  13824.00 (20.07%)       13104.00 ( 6.84%)               5.21%
> 
> The above data shows mostly regression both in the lesser and
> higher load cases.
> 
> 
> Hackbench pipe:
> 
> Pairs   Baseline Avg (s) (Std%)     Patched Avg (s) (Std%)      % Change
> 2       2.987 (1.19%)               2.414 (17.99%)              24.06%
> 4       7.702 (12.53%)              7.228 (18.37%)               6.16%
> 8       14.141 (1.32%)              13.109 (1.46%)               7.29%
> 15      27.571 (6.53%)              29.460 (8.71%)              -6.84%
> 30      65.118 (4.49%)              61.352 (4.00%)               5.78%
> 45      105.086 (9.75%)             97.970 (4.26%)               6.77%
> 60      149.221 (6.91%)             154.176 (4.17%)             -3.32%
> 75      199.278 (1.21%)             198.680 (1.37%)              0.30%
> 
> A lot of run to run variation is seen in hackbench runs. So hard to tell
> on the performance but looks better than schbench.

May I know if the cpu frequency was set at a fixed level and deep
cpu idle states were disabled(I assume on power system it is called
stop states?)

> 
> In Power 10 and Power 11, The LLC size is relatively smaller (4 CPUs)
> when compared to platforms like sapphire rapids and Milan. Didn't go
> through this series yet. Will go through and try to understand why
> schbench is not happy on Power systems.
> 
> Meanwhile, Wanted to know your thoughts on how does smaller LLC
> size get impacted with this patch?
> 

task aggregation on smaller LLC domain(both in terms of the
number of CPUs and the size of LLC) might bring cache contention
and hurt performance IMO. May I know what is the cache size on
your system:
lscpu | grep "L3 cache"

May I know if you tested it with:
echo NO_SCHED_CACHE > /sys/kernel/debug/sched/features
echo NO_SCHED_CACHE_WAKE > /sys/kernel/debug/sched/features
echo NO_SCHED_CACHE_LB > /sys/kernel/debug/sched/features

vs

echo SCHED_CACHE > /sys/kernel/debug/sched/features
echo NO_SCHED_CACHE_WAKE > /sys/kernel/debug/sched/features
echo SCHED_CACHE_LB > /sys/kernel/debug/sched/features

And could you help check if setting /sys/kernel/debug/sched/llc_aggr_cap
from 50 to some smaller values(25, etc) would help?

thanks,
Chenyu

> Thanks,
> Madadi Vineeth Reddy
> 
> 
>>
>> With above default settings, task migrations occur less frequently
>> and no longer happen in the latency-sensitive wake-up path.
>>
> 
> [..snip..]
> 
>>
>> Chen Yu (3):
>>    sched: Several fixes for cache aware scheduling
>>    sched: Avoid task migration within its preferred LLC
>>    sched: Save the per LLC utilization for better cache aware scheduling
>>
>> K Prateek Nayak (1):
>>    sched: Avoid calculating the cpumask if the system is overloaded
>>
>> Peter Zijlstra (1):
>>    sched: Cache aware load-balancing
>>
>> Tim Chen (15):
>>    sched: Add hysteresis to switch a task's preferred LLC
>>    sched: Add helper function to decide whether to allow cache aware
>>      scheduling
>>    sched: Set up LLC indexing
>>    sched: Introduce task preferred LLC field
>>    sched: Calculate the number of tasks that have LLC preference on a
>>      runqueue
>>    sched: Introduce per runqueue task LLC preference counter
>>    sched: Calculate the total number of preferred LLC tasks during load
>>      balance
>>    sched: Tag the sched group as llc_balance if it has tasks prefer other
>>      LLC
>>    sched: Introduce update_llc_busiest() to deal with groups having
>>      preferred LLC tasks
>>    sched: Introduce a new migration_type to track the preferred LLC load
>>      balance
>>    sched: Consider LLC locality for active balance
>>    sched: Consider LLC preference when picking tasks from busiest queue
>>    sched: Do not migrate task if it is moving out of its preferred LLC
>>    sched: Introduce SCHED_CACHE_LB to control cache aware load balance
>>    sched: Introduce SCHED_CACHE_WAKE to control LLC aggregation on wake
>>      up
>>
>>   include/linux/mm_types.h       |  44 ++
>>   include/linux/sched.h          |   8 +
>>   include/linux/sched/topology.h |   3 +
>>   init/Kconfig                   |   4 +
>>   init/init_task.c               |   3 +
>>   kernel/fork.c                  |   5 +
>>   kernel/sched/core.c            |  25 +-
>>   kernel/sched/debug.c           |   4 +
>>   kernel/sched/fair.c            | 859 ++++++++++++++++++++++++++++++++-
>>   kernel/sched/features.h        |   3 +
>>   kernel/sched/sched.h           |  23 +
>>   kernel/sched/topology.c        |  29 ++
>>   12 files changed, 982 insertions(+), 28 deletions(-)
>>
> 
