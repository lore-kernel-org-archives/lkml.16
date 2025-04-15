Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6538D17A2F8;
	Tue, 15 Apr 2025 16:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744735189; cv=fail; b=QxjatcxJTqXjDcHz4Cu9MiV6oMbRblsBm5fvyRdzdHQYFA9VXz7+NG657J4m7Sw9eXplF0XVx3zmP/wKmBSBJLVbVFNGNf/TXz8MdifhAVm5OPMkkrYxBdEK/a7wQa5r3MKzFwXZLFkZ0BgHj4Lmo74m5iaE6tbGta3ESi26Kxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744735189; c=relaxed/simple;
	bh=3EhcEONC4dOowRf38yn875WCGUqGJvBYU1k1+hyX/As=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sqV7xj6qMHLytjO5yl4kChxjWt5egG/Y+cFjwVheaSmTAOg0j4iVk1qj+8x6VVPU2ilDO3b8MPdaAKRbLfk2DZZ/r5fVjqhmECElGcpdeYciH+rHg7vNrmtRzJhb/ZfMXXbP3ZpBauaPwYuOqPt4mU/46yAjbyH0Nq+8fCtRX90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5LYHP4Z; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5LYHP4Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744735188; x=1776271188;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3EhcEONC4dOowRf38yn875WCGUqGJvBYU1k1+hyX/As=;
  b=U5LYHP4ZXafVfq4jV7HIcL1uDt1Hx9OMeLw2xG7nA6IRoSHetTNJBhzH
   dPaB4nPIdg0tAxqBgC0jTSa1Oxw8hPMLRjeI5p+3LB0bFsJ8GU2Dmb7kq
   SShPWc8xtxw1lo9J441F3Tm7o7XW8n8PVREKkuoMfDCej8YmSk5uUziQp
   YgGD78hudpzWafpszatxmBe8dmrMYUvUL1kmyB0mTzhtEdd5+qsIxF0AU
   I8fbcmrht6PvMrfnLsaCnKAl9rPGSQ3w+C36SSJmQ4m5vlnLmbG5d3QTD
   1FlwtqHjdAwAuwBiaZe9f+DdMf35UEai1h0mKm0ObcE0RQ//4lRY3MHq3
   w==;
X-CSE-ConnectionGUID: BDLzdPlUR0axKxvyghgFJw==
X-CSE-MsgGUID: 0wvtN20dQFmw+htffcKNGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46135994"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46135994"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:39:43 -0700
X-CSE-ConnectionGUID: +fo0WcMCQZe50WMfBmvCVA==
X-CSE-MsgGUID: 4ITLitC3Tm2a/Kwg+S6OYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="161200598"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 09:39:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 09:39:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 09:39:33 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 09:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETuGIoMCrIwk/C4BGgCUxo/sQfogPRcdGGtdHl5mlGKMJncVIx0Q5i37FKlKRrQnTtFw9sHq7e42PLXKSDzCAjKLJL+2+SLwpWQvrqu7OTrQ1eijpYUIBRQA1y/0W26wtkCcYJo4OffKjRTqZ/tJ13bi5YSVHIHHxh317yDEIbs67z5sJom5dieYXsywqIWn6AoCIFw4FlFJ+P1MuvF7xoD4m0RG8oU1S1/LRebQd2zJL3OrmtT9IdSeD9z2FN+gIFV1wYs4zxDU0zqMcxzwvs+7CTi482M1XLvYn41cDGICK7VWc2mfNPQnHYIXbh5bDnUz0UTnYT7VINP9xENc8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkR2CxMjjVpxjrY8KknRHxLPFKMGm+B0P7MPYM0f7HU=;
 b=v6Y38EDiLfad/QcGfm9OP5EgiZT7P2VmhTmUV+HO8y2JmTTDyJ3kdBdzgcnLdNTpJlUSPaairP7f8sgjYnKE9z89ciTBSPFzqUB2oVfzHkJvJrRjkocGmzaOiDk9EcxCIK+/J94U+w4CZVPGcKQYpC0iVF8BMpZBM4YrMAgV4MVYCETmwNP4knfEqtV4WJlQq7LkUCfbllTnYoyWgERls0YI7/sd3SUVTxGFGDLWrOrM754AJkQkPWc9f/j/WjHCZGt73j9z9YDGfkZF6fnGCr0ac02/kmXrUdCARjD7MrO6s7OAgjlqL3pPZfAtxkOncVB4uQpbH5w+TGHnE7NMRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by PH0PR11MB5047.namprd11.prod.outlook.com (2603:10b6:510:3c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 15 Apr
 2025 16:38:59 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:38:59 +0000
Message-ID: <456839d0-031c-448d-9f54-5e65a29ebf9d@intel.com>
Date: Tue, 15 Apr 2025 09:38:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 13/26] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
To: <babu.moger@amd.com>, <tony.luck@intel.com>, <peternewman@google.com>
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
 <187d14b81db5f9a2f19657dd3af07e8555d68261.1743725907.git.babu.moger@amd.com>
 <ef0fc176-ce2e-4ad5-b752-f1d018ae985e@intel.com>
 <a05b3226-b341-4003-a0d3-8e1594d95052@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a05b3226-b341-4003-a0d3-8e1594d95052@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0059.namprd03.prod.outlook.com
 (2603:10b6:303:8e::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|PH0PR11MB5047:EE_
X-MS-Office365-Filtering-Correlation-Id: 933a53dd-2759-4f53-5a86-08dd7c3c05f7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zm5HTTJ2elZYZUxsanpGMzd1V0FoNkZJVGJSVGdaa3pHMy9ydGFHZzVyRmZD?=
 =?utf-8?B?WjNadzAvSVI3RXNRZnBVMk1Pc1RMMVF3aVdvYStpN3lvRmNkektIMllzTG9K?=
 =?utf-8?B?SXFjY3BNczlsb1R6SWRWVDZzUmkzcFdzcWJ4cjhsbTQ4Zk41SUowRmVnek4x?=
 =?utf-8?B?SmpGUEN0Vk5pK1Q5ME56bk95elkyY29HQiszeENla2hhdU9YSmhUZVNvL2pH?=
 =?utf-8?B?c21hcFdBN2VxQk10U0JzbHNIczI0bFA2b3lsM2RBN0V5dVdtdVdlMU53VEdW?=
 =?utf-8?B?Si91N2hXeEVJYXJqaWtNN3pVd3NRRVRSQktMRFNXTlNMOWRFdDJ0eFhsdTd2?=
 =?utf-8?B?MjNNYXd0eURHdUxoTUJqWkdzNDdvZXVZTEJvVmhvYkxYVDhmR2p4OWhzRzJ0?=
 =?utf-8?B?YnM3TkVza1lUY0hGMmx5Q2pQeXYzbWU5blBwRk5Fd2VOSXlBOG9maHQwWWtH?=
 =?utf-8?B?ZHFQUkF1QmFpK0xMR2p3djljaHVMV0NiWG1BZkhscTJPdENVQTlYeDZac1RV?=
 =?utf-8?B?bm05NTk0T1pHdktRUzNBR2RCRW5Bd3NIZGJOaWdxekhwMWxxQzRPVUIyanFW?=
 =?utf-8?B?azk3b29GMkpwaDhjU2JqQ0pCSkdTMm1HT05JdFFsVVAwK2ZkQ0s0RCtSV0Vo?=
 =?utf-8?B?cXRqTTZDNVhleGhGOStlUXZ3MmhsVmFmZzA2NlZoL0dYS0lja2MvUHJPSXht?=
 =?utf-8?B?Q3NOQnk4M2F0WmhDRUlIWHRwbmhEQ25oQUNaY0R2NDc5dXJmajJrSzBiSkZv?=
 =?utf-8?B?VnZDWm55SkxvbVBNcStyZW5oMVdZMGpSTHh4czJBRUJLUm54RWR5VFBmdGlO?=
 =?utf-8?B?SktkTGl5RDVFd2lvY0hvdUxkRVpiMzA1OGVpeTdHQW5WNzAxS3R3Sm4wWG00?=
 =?utf-8?B?YlJ1bGJ4bCtHaDdPL1FhNmpBUjJKY2ZYZUEzZHoyUUxUQjJpSUFTYVR3YlVw?=
 =?utf-8?B?WUFjWlAyV1d4Z3lJbDAwdXNEd0NYL3h6RnAvYWtsK3pjQ2V0c2hJWlRWcThk?=
 =?utf-8?B?OVQrM2VNMnFLK2xMT0Q3MGpmT29mSnlkZDdDV3VyRGFpRmZWcXJmSmtNUzE5?=
 =?utf-8?B?S2RsQXMvL2F6V3FGdDl6RGtpUmcvQW9hYUFvc3VzaVY0NlRKU1RVajI1d0Nj?=
 =?utf-8?B?OGs1Mkx5bW5rYlQ4aDZHa05zdzFCWDhkYmN1Njdwcm5iNmFiazFreG5uV1Ro?=
 =?utf-8?B?NXJGZzNweCsvbytmWGVURWZ3N01ZSm1KOXNuWTBHLzE1Q2FDK05UK2VMdFZ1?=
 =?utf-8?B?akN3TmFZMUhvK2d4d3ZEWHJGWjhTSitOS3BPTEVkSXFra0dHTXAyTFN3NmNo?=
 =?utf-8?B?ZzBrSDkrWlM3R3F2Ui8rQWlrbW5sRWlOYnhDampxTEdBOWk4MC80anZqT1My?=
 =?utf-8?B?SVphalRDS1lPWHpSdTRtc1JPd1VObnZWRlpSWjNJMTFpYTBTUGpyUEJ2Z1ov?=
 =?utf-8?B?a0hockRUS1RxMitUVkVSMiswMUJqODNCaVZ0RjRESk9Hbm1KNkFwenZsdVJJ?=
 =?utf-8?B?ekh2YldUM3Vqc3gvRWNTb3ZZYVQyS21ObEpiUEZvVWFTTXZkMGhvU0lVTzVB?=
 =?utf-8?B?eFViR0JnbktpOHVvWWc0WUxVc1AvZ0dJdmVVUkxzQzdkcThwWVg4MkpVelVU?=
 =?utf-8?B?R2JrRkdXamhUeHo2OEgwVmwvWHd2dm1UeTVHTm5BWFdMSXJMSlVWYWhQWGZG?=
 =?utf-8?B?REw5T3Y3eURHWEJUd3B1YmI5VVBJWHVHWFdqYlFHWjVESUZwdjVXeHZMMi9s?=
 =?utf-8?B?SkcxQnRTWUF2MVZMcThXZ3o3TXlOM0pobGxHZWtoTUF1Q25BSWVndDE2TWZh?=
 =?utf-8?B?ak5pZk5CdDBDVzU4R09sRnBDa1FDV09rc2grWTRHSE9RV2JBVlJ1RkdhREVF?=
 =?utf-8?B?VzBzeVprUHFKTWxVWVhWRGxHTXlualhDZmUzeVNSUnNPZkJOVzFEclpnSmVo?=
 =?utf-8?Q?X7Low7QDGzM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmowWWQ4SmRpcmtEdVdJR1hCN0REcnlHVi82Nmo0SkcvT2ZxTnY4QnFNVER0?=
 =?utf-8?B?S1dRNkdFYTRzOUZwSGR6WnIvbWtzQ0dwMHNzMGpyejVmVEM1K1M0eFlTZWZF?=
 =?utf-8?B?YVVERm9aY2IzMm1FK1hQK2FMdEtncW5rdFJvYTJZeVdkMGRwOVMyR1RuOUMv?=
 =?utf-8?B?Z25nUkJiaUYxVmN1b1c3MHFhQk9GNENBeVh5U0wyeFlyVmNrcEdkRHlhYk0x?=
 =?utf-8?B?TTV3RDE2eGNpQngwQkVIQlVZb2xkYSttdk4rd2phRzQxWEx0Q1JnaDRWM0Zx?=
 =?utf-8?B?U1JTTFFkSTlpVmxZdElDM1JKS29EVmp5cktVd2I1allkZGRhbXlPY1JnNHV6?=
 =?utf-8?B?NDJOdW81T3hvdzlJMHFDTFpWSkdYM3Y1d3pBMGZlVHRLdHpBMXNiS21adHpI?=
 =?utf-8?B?QWU2bHpQS29RdU1PUnllTThnQi9BWk9sN0JUamVPaHFpeVNrbEZaOWpteGh2?=
 =?utf-8?B?Z1JsVkEvN1NZb0FzN1l4aFdOWkdJM0xyKzc3VE5jRDZ4WUR3NFBzS1pOcGZ5?=
 =?utf-8?B?dDdkVDlMOEx3TkFwcGMrYklvaGlVbGd2d3lLREpEVHo2Yit2V0d0dENWUFM4?=
 =?utf-8?B?VENRR0J1Q09WNGtLUVdnYitJMWZzVzVKSHk0Ni91Zm9WV3FWSjRKYXE1Wm9U?=
 =?utf-8?B?YndRb2NpdTV5d0Urb1BFWUV1TFVMNml6S0pQMmR6Y200OTFPRThBSWc1Q3c4?=
 =?utf-8?B?VEtyRUlZQ0lrcDNNMjBaOG9SUENITVhkRkRyUFJObUI0aFlTbm54ZGtmbXJa?=
 =?utf-8?B?cjFaNTJicWw2ekE0T1NZekFNWThzN3BEWW5Ud2Qza0E4YTIzNmRQVHcwYVc0?=
 =?utf-8?B?ZzFaRGNHbCtLVjRmNzFrK3h0VThheC94QUp6V2tnZzlDN2s5TkFOZWl4TzB0?=
 =?utf-8?B?YjlNcTgydUpxaUxMUkFUeGEwcDFaWVRidkovdERoSnBtQTVQKzBYNUZhQWNG?=
 =?utf-8?B?Y05sa2dobnJFS2dGUGI3NnZ3YUF3WHgrdm9zT3ZaWTMzNllTWGtNK3JWVkwr?=
 =?utf-8?B?M3YrQ01lemVJdXBHZjc5UTdya0lJakY1NVBrb0p6OWFOcE45V3JZb2VraGF3?=
 =?utf-8?B?MDV1eFhoQU5GMTNVRlNuR29iS1BWTGhmUm5JaWdMS05SWjhlaGVFTUhtajZC?=
 =?utf-8?B?UGl3ZXRrdDhLdkQweVFhOWlwQW5lWnZpNURjbDNuTE14WGdIL05PTEJacVhX?=
 =?utf-8?B?VEdTem9kNDllT3lDam1FSTFONVF4dndZeVlKVVJrc3lHRjRMYjh4MTl6YTZO?=
 =?utf-8?B?Z1BqK3FZS3JYbjNMMHd3WmxkRFJGTmdJaGFvTEpVeGhhcmZ5STZmSTZoSFB1?=
 =?utf-8?B?a0puai9URWh1cWhZc2N5ZHRGdzVJb0dNYkM1STIvclp5YlNtR2V3OFc4YzBi?=
 =?utf-8?B?ckhFQ0lTN2x2ejJMb0FGMmtBbWR1ZkZaeUlPTUovakJSVENHYkpHNGdxU0NV?=
 =?utf-8?B?SVBMTmlQQlRVeW1UK05yblA4OTlNUXliaGlCbkVUK3lncjlXTTU0QzBtbGRy?=
 =?utf-8?B?OUo3Z05LY09MV1h4Uzd6RFVwQkNqNnlqNFlvWkhOZjBzekRGbGhwbjhYV2lC?=
 =?utf-8?B?bHpuYjNKUUZtN0hLZE95NldHMytxVlRTY2x0MzFyTjZXNWFGSHZJOWVtUUpQ?=
 =?utf-8?B?MTdRc1gxMGhjRnVFNDJjd01hNHlyK2xNdGlxZzJpNzRqWmd0cEFKclNONTlH?=
 =?utf-8?B?Wmxsdis3MnRTUWpGTU9OVkFZR0RuL3dJTGl2UldkL1IrdlYwZ2hJc3haTStG?=
 =?utf-8?B?S21hZ2hrUWxSdUJzYURLeitJNGVMV0RzNGxQR1NySWlnQmpEdUlHSGJNUjZR?=
 =?utf-8?B?R1VpdlAyVnlxa25LeWlLNE10aHc2R1hrdVVrejBsV2Q2UDdUUnBiaWFXY0hh?=
 =?utf-8?B?UHVXc3YxV21DcmxEZjREUm9EaWMzdEczSndqMklackwvZURuVHBOdDc3SHJq?=
 =?utf-8?B?SW1XTFZBemltM3ZXcFVFaElTa2hwMFF6UlRTbnZwcDRWdDByQy9CVmFZK2Uv?=
 =?utf-8?B?OFJGWkpGNFBqM3FERThEQWpKQ28ydHBaMVZ5cnY5SFlvWWF1OEw0bVhxVXZu?=
 =?utf-8?B?SjE0K1orc0JYdDZSM1JxaDQ2N0NyUU5TVzlBQng4Z3I5R3B6SjZVZitla2Rz?=
 =?utf-8?B?c3AzbTNEcEswOG5jOUs1aHVrVVdVeDZGQmhTaGEvZDZ0RkZJaFRtY1IvTlNu?=
 =?utf-8?B?MXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 933a53dd-2759-4f53-5a86-08dd7c3c05f7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:38:59.7909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4GmrMi5c4cGbq1nKzsM5LQssnd0VVxfG0yyj5M1zPq6v6H+ZC9CJtCgLEpzSwAH3XdgK9u2PC9x56YdD0N3dkN5xMkkaxDQ9LTe04hV4e0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5047
X-OriginatorOrg: intel.com

Hi Babu,

On 4/14/25 1:51 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 4/11/25 16:02, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/3/25 5:18 PM, Babu Moger wrote:

>>> @@ -394,6 +394,21 @@ void resctrl_arch_mon_event_config_set(void *config_info);
>>>  u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>>>  				      enum resctrl_event_id eventid);
>>>  
>>> +/**
>>> + * resctrl_arch_config_cntr() - Configure the counter on the domain
>>> + * @r:			resource that the counter should be read from.
>>> + * @d:			domain that the counter should be read from.
>>> + * @evtid:		event type to assign
>>> + * @rmid:		rmid of the counter to read.
>>> + * @closid:		closid that matches the rmid.
>>> + * @cntr_id:		Counter ID to configure
>>> + * @evt_cfg:		event configuration
>>
>> "event configuration" is simply an expansion of member name and does not help to
>> understand what the value represents.
> 
> How about?
> 
> "MBM Event configuration value representing reads, writes etc.."

This is more helpful (note Event -> event). When data structures are decided it
will also be helpful to include reference of where this data is maintained and
how it is formatted.

Reinette
