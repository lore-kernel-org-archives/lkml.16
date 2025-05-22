Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1821195;
	Thu, 22 May 2025 00:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747872632; cv=fail; b=kwhwINWoNz+mhmhv4QNYD+Iq+/yaNcwBcw1y0EQABAzKTKTxN6P7J+AnB79Op8oU4O9PviPV52DYxjEtgL+TIpMqNJnxDxoUkzv2h4f4ECffd8y460c47wjztcN+HABsv1ffA412bC3yW13X4zkcVaegIuze/ymTf83zMeYWkqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747872632; c=relaxed/simple;
	bh=PiX4j6jac8iYnxpglB+YgcszbIh0pqg2qfy0h9POjSQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bBm4cKf0B9q+O1KrymhmHCjXukvkNVWbkcP0VIwQc5CIbnt27Jv8TwLNzNfBiHo6pqyZUkrtMC3tcAv4Sewc0Ym4BBFWEa0tt5JrTJpKgpYQjW4OMaTP5RVTV7pJI7bZozjieXueJNZ36e0YEG5ZAudZvPChb31BeaYFwe0dCdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVpCWSjC; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVpCWSjC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747872631; x=1779408631;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PiX4j6jac8iYnxpglB+YgcszbIh0pqg2qfy0h9POjSQ=;
  b=XVpCWSjCOJbYhOT0lMG+Tl9a8o+iQCCjU1Mi9Z++GCtOIdRQWX8hL0Z0
   w15iWWOux/CVTi74c9a3+dDI2uHBdCJoz3fCqwRPX2eFhHXTMYFQwpfuu
   8wAd58bfq12m6WaKP1DnufFMt0U/qligxSqa2eGWLpAa1c3rqNBRWhcPc
   TsndW/D6gAFiUX1T6+2NYssfxlKzarvZi4ZSJ8m3WTpANcIg7WU9xoK5l
   duYnyeWalaC74KG9T5E1f/WTdesjL5jrrZafops5ppM3IKvrE23K6r2Y5
   RWyycjL7aWpPKVLzozGzBbktseVDxe3NpAvQoUwKfQYxIsyA6sAFGcly1
   g==;
X-CSE-ConnectionGUID: o9p7bfl6T8O0Vi6PYXmnMw==
X-CSE-MsgGUID: 63o9qmjrSIuGlpgy4nj4lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53545746"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="53545746"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:10:30 -0700
X-CSE-ConnectionGUID: Kz/Ot4I6Ts2wieV1PbYCnQ==
X-CSE-MsgGUID: pxoCdTL+T/O/Yq3cEWY4QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="140168930"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:10:29 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 21 May 2025 17:10:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 21 May 2025 17:10:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 21 May 2025 17:10:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nufzHu2tPu8Yrqsi0Tbl7yOxjnDp7mQvYOraMM0fqSkjRfRuIKaJVNZ71J5J+ico5MIS5YIaBcCBJdn44UK8Mv7TY1TLfMRsjJI3oKYgDDlCreGKotGhxCAgr4zcoiZvl+Kg3he43zYdkk0pxygXqDN4f5k8MoH/D9Mvlgk6d8WJUCU0CaohJ/8FAIxGVzSQ880sy8WEr9it7qhV+0O/v2bpjgQ7dcmJSjNSLXBUPvnOzb3JAfs5oKpPFpmOs/funIYVUHb69Y5fGG1F3qZ4/KQOvxhZxTQ4ttFGy7R+EjeuZNVw8sJcavkRxCLiZAZbjHqBZw0MmGQturcaQ72XFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S7o0d14L1G0qWV2lNulfDM/ytFjqyKYctrvUh0JiLvQ=;
 b=uJUJmWw4hpWm5scXe/Io+0nnMbGZFgNLRmw3ibWxQ+GvLu0fR89biDVJqEJnKG9JmnZJreIuw9BRLyxRByBUSa0wm8uygEJRifrVUI92IM7asR2+jAt6RT+krp3c8LzDjCuHwi986+cV81ytObtUzgL42p5qkSj+Jz2lQxeyHS0XYuy+Wfp8PY6PRS5Z51puDm1Vh7agIiPEYm61177Q8/7TYyUnHX/6BDEGDLSTWe5EEEJu4cbzHgr5qd8zT5s95V3Ej0g03RbD2tVSNThj7tjL4JtdO3UJ2dAGb0Eh+kzpugzUZ3Rs5uATnD4+YyR2ebBhUcyXIxJT1uNY2s4f5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SJ0PR11MB5940.namprd11.prod.outlook.com (2603:10b6:a03:42f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Thu, 22 May
 2025 00:10:22 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 00:10:22 +0000
Message-ID: <a131e8ed-88b2-4fed-983b-5deea955a9a5@intel.com>
Date: Wed, 21 May 2025 17:10:19 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 00/27] x86/resctrl : Support AMD Assignable Bandwidth
 Monitoring Counters (ABMC)
To: "Luck, Tony" <tony.luck@intel.com>
CC: Peter Newman <peternewman@google.com>, "Moger, Babu" <bmoger@amd.com>,
	<babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<james.morse@arm.com>, <dave.martin@arm.com>, <fenghuay@nvidia.com>,
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
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>, <Xiaojian.Du@amd.com>, <gautham.shenoy@amd.com>
References: <cover.1747349530.git.babu.moger@amd.com>
 <CALPaoChSzzU5mzMZsdT6CeyEn0WD1qdT9fKCoNW_ty4tojtrkw@mail.gmail.com>
 <4dbcea13-382e-4af2-960d-0e66652cc2f5@amd.com>
 <8dd6e3a0-b2e1-48a7-8fa4-62e78b1407ae@intel.com>
 <6c77b065-a54e-4b9c-a4cf-8b81676f2ab2@amd.com>
 <f4178258-f7ad-4db2-9284-3f28e8ee8d00@intel.com>
 <92bcab75-72c6-46d4-97a2-119e7124c90c@amd.com>
 <11465976-f030-4c1b-88c6-3eebf0c8f13b@intel.com>
 <CALPaoCjTwySGX9i7uAtCWLKQpmELKP55xDLJhHmUve8ptsfFTw@mail.gmail.com>
 <7f10fa69-d1fe-4748-b10c-fa0c9b60bd66@intel.com>
 <aC5lL_qY00vd8qp4@agluck-desk3>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <aC5lL_qY00vd8qp4@agluck-desk3>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0139.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SJ0PR11MB5940:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d141406-a407-43c1-7108-08dd98c50b4f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUR0QXZoWWRQVVhnRE5vc3V5VGUyWVhoNzNBdzRTUmJqVVRnRFQ1RlB6aXZ0?=
 =?utf-8?B?cXhvL24vZllnOVJKZXdFN1hWcTNHVDl3Z2RDYXJlSnZtaStXN0p4M0RzZHJX?=
 =?utf-8?B?emZkVHl4S3VjZ0o0WUxWQTl2R2hYajJodkhxdVlJOHpxL09hOXNxbnc1bnVy?=
 =?utf-8?B?enc2T3ByOEhsR0tsVzkyQ0UxdTNINE94a1FnaDd3MWQrTUxMbjdINXNHUHNB?=
 =?utf-8?B?SWh5Skl5YVhVT3d4bkJxWTZEZGw3WjJoQllnSENlR0VFc0JkaEFWTHJRZVZD?=
 =?utf-8?B?OUxsdnZtMjBFWW5wT1ZmMnhWc1l2TEk3b2hBRnVTWUMzb1dYYnRUTVNkazRN?=
 =?utf-8?B?b1JWQUNLZW1lWC9EMEJkMTRtY3NBU3V4K0dGSVA4c01iVFdlZkRFaGZOTERl?=
 =?utf-8?B?S0xLL1htcFJCRlROakJGNjlSWFJ3amRmNFFNU254bGNGajVVcWtrOVNvUGRo?=
 =?utf-8?B?REVNQXRXVEQzUldKSTBSd3I4eW5CeVpNMzI2WEhRTVUrNk02NDdXbnowYVpH?=
 =?utf-8?B?aUNuNHpyaVBGYUZaRXNNUWc4dTgwcjExMGNtcENMcW1GNHVtbkZ0dWZPenpp?=
 =?utf-8?B?aWhGK2tQdVFPa2Z3NzN5cHovMFdKbzFCTjBrLytva3kwc1JSWDBFclR6LzEy?=
 =?utf-8?B?MmlNTDFZVGlUV2tEb1Y3Y2J5dEJIU2d3RUNQZHhHaHBSVVV0RW5wMnd1Mk5E?=
 =?utf-8?B?aHpDblFHU0J4blY0a0huL0s4MUEvZG1yZStEY0hhTDU3VWc1SGZITS9OOU5k?=
 =?utf-8?B?WjVnM0JSUzA5QUtJNzBIZG5PT1Y4emtCMnlyWkxLOFI4bjh0aXdsN1c4cmFi?=
 =?utf-8?B?ZDNoQXFGUDJPVEpHR3NsMXNpcTBHTERaWS9zQWNjWE84UmdnL3pWTlRWV0tV?=
 =?utf-8?B?TzR6WGRMWitJMmgwS25hUmc0NkpZeHlWY29OOWVkWXVwVm8yMzVHU1I4Z0U2?=
 =?utf-8?B?MC9tYzNKbnpVSWFzNXF2eGZYcExUMXZMbGh5aXpPb3ZGUnBQZW11VjRZUnc4?=
 =?utf-8?B?RllhZFJyVnVFWHBFd1J2Z2dXSWZyNzRNeVZnSTdoNzFDSUJkL0lRVHJUVkxJ?=
 =?utf-8?B?QzJhbVQ0UVIvaFZGNkphNHkwK0F2TEdaZEg3eUtubW1za1NDSE04NUltZkIx?=
 =?utf-8?B?V0RNZ1V5Kytzb0NMSnJTYXpkNlRGVVRwUTVMVmw4WGo3cW1sS1NxRHFBSXZR?=
 =?utf-8?B?ZzBXdlE2eXkyU3FTSDVwNTJ4ZHFnS2pPeXpTUGg5cWNuNlVvcWFiVEE2amM3?=
 =?utf-8?B?M1JWTk5HRTl3UlZNT1lEMDVlWWZ6cWpTemF1dGQvL1NVSm1EZGJLOXlsWkcr?=
 =?utf-8?B?MWVpQnhXYnhYbmx0RUhSVDk2UkJ6MW1rbEw0Zjk4bjd4dnhGN0h1YkpaSTdE?=
 =?utf-8?B?QjRoS05kdVJoajBHeGlOWDlheVhFRVByRVVYa2diV2VXcTdpYXhDUzZGMWtm?=
 =?utf-8?B?SHd3TTZKOUVFb3R6bUJhV3lnYXVTaG9BbWdTcXdwRzN1VXFVejFGWUlBdm9E?=
 =?utf-8?B?SW1FOEd6azVBeVVnZC9CT0Jvc082ZkV1cGUzMUlxbXN4NU5TeURsV1dVcFVk?=
 =?utf-8?B?a1VlV002czFhR2JPTDIxMlFwM1ZLQWJEQjBrWHdVZnlzc3ErR1FZdzQ1WTd4?=
 =?utf-8?B?cDM1UzM1YlpaUHJtZXFLVG9VaVBYVTBKb2h1TnN4SmpNSWRpQ0tnd00xc3hC?=
 =?utf-8?B?WHpIME9UZVdUbklTZ0RyYW5STmlSMkN2OFB2WDlRR3hLbHAzdlJMUGduM2xI?=
 =?utf-8?B?YUE2TFdITDlrOXA1bkN3eVQ3c0w0NEtSQno0QWVaWlNZRStkdmpzU2tFVmpk?=
 =?utf-8?B?MGxzKzRXc2lXRndYL0JhRTM5MlBlaHl5a3E5WEJScE9iVXdiTjlYL21yODFP?=
 =?utf-8?B?dFN4RHpsbGxTQUtqRGprenI3OVNtb2l5QkxpeGZXSDBuRUN2SmlHYVhZWkdE?=
 =?utf-8?Q?4jEArrATRnc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0VoSlV0Ri9ET2M3UU5pdFZOTmlwTEtGRDVpQ0JOa1BWTFBzRWI3NFpWZlhx?=
 =?utf-8?B?aUMvYThoT05LUllkcUMrWkNzSSt1SVFPV2c4YUhKUHpPU2JESWhRMlNTK0Zp?=
 =?utf-8?B?Ykg1RjdOSXF5YjZQZys2dXYzQVRUL2Nqelp3M2haSVJzY0pSR3ExcFdCWGZ4?=
 =?utf-8?B?MnlQaUR0NmhCRWQ4MCt4d1RETnRTc0VpQWYxS09PcXAweGhTVkY3cWdUeERM?=
 =?utf-8?B?Lzk2ODlXVkc2QXNRWGN2ckNoZ3BZZFZMRzQzaUJXM0N5Q3l2eVJCc3NVVEdr?=
 =?utf-8?B?VE9ZSGxOMGpYdStoLzV5NlNGRWw2VXJTMXNPeXdzbDB4dzdEc1FNYm90Nzdt?=
 =?utf-8?B?NXM0aks4WFdjNjdJY3ZkM01EZXhjQ1BjbEkrNkFFRHdxcGZ6cG1OQmcwMEpy?=
 =?utf-8?B?QTRmN29qU2NpZ2Q2VzB3SjN5WEpjNkhkS094cW5vOE5FM25yWWRvdHFsN21h?=
 =?utf-8?B?RUl0N1A5YnYydWh0L2pQZlY0dHZnYzlpWFlXU3Y1WFlKMzYrVDk3MFBTaWox?=
 =?utf-8?B?VHhlMVVJeDlZSEVPdy9lVURiSTd2ZHYwbkovMzh0Z1I3QmJ1Ymc0aGNhWWUw?=
 =?utf-8?B?OFRTaXBlc1hFLzR2eVZicnZhRzBiWC9IejZKTGVVdU15Q3lHU0h3ZHc4dDRw?=
 =?utf-8?B?Y3htUU40TzhKTTZoMm1QZmZmRmlzWkNEV2Z5eXZmNS9QUUtScmMrU1dYRGY5?=
 =?utf-8?B?WVkwTzRObmsxNEpkVEtOUW91aC9XL1o3L095bmJFVmhTTHI3Y2VMY1BjcWR4?=
 =?utf-8?B?aEhnOWY1dmpmc1VjTEEybmZMQWVOS0hYbWs3VHcrWnpodjdacjZDdER1M0tt?=
 =?utf-8?B?VjlMS2VVOGhyZUROTmxtVXQ1VGVPMUw2WkkrRG5UT20zZER1Njk2aGozbTNw?=
 =?utf-8?B?UXFNeDVxcHE1Tkh0cnhEZmFUNkM3bnFuT0QvMExIRVMrVldGWTh3ZUN1VTZH?=
 =?utf-8?B?YkNmaFlFa0Y2aGtxcmtsVTkvNFFBVmgwekhOclFHRHNDWW00OXJaSUZGd3dW?=
 =?utf-8?B?eU5aeXVIY3FWSi95OFBlQ1JORVdoUmg0UkxnQisybld6Q2VLWnF0MTdraU5j?=
 =?utf-8?B?SUdTVXhVRjg4RlpBWGNzKy9HblUxTld3dGNhSGNKOXNXWldKMVFlK0s0MFZq?=
 =?utf-8?B?YjRDQXY1SW5rTzYxSkZ4anFqRCtRdVhOeEhvTVRad3FqWDFJYjE3N3VzZ3R3?=
 =?utf-8?B?dDFvdjAyQ1ovMHl2Ti9JVWZ1Z0ZRTENPRVVodUU3VHJlUEVyODhUWnZrTVR1?=
 =?utf-8?B?enBVaEt3R0lUbGphdy81dWNWVjVLcTdzcGdYcnNEeTk2N1F4K1RsdDM4b3hZ?=
 =?utf-8?B?RzF0Qy81VXpWcWpPUTdCL1h0NDRnYy9BSHA2bk1lVFRiTy9NKzZMeEhSNHZw?=
 =?utf-8?B?N3NVS09naFhxRTQxeWxCRkFQaHZGUHA5T2lqbkNmbXBzMURFTlU2bWtwWThB?=
 =?utf-8?B?djd0ZE9xZnByUVVCMzR0THVQT245elJieW5UdUY4WmxEUWttTTBYOVVVYmJF?=
 =?utf-8?B?bFBGSXdGci9FZy8vdVk4ZGhETHpveUxqcm9NUy9YZ0l1OHkrME5wS24wUXJS?=
 =?utf-8?B?VjJ2R2F0V2VhbWVyTGw0VHlUK2MxZmZ5RVArL1FEV0NseXN3U0ZhczZmaTAy?=
 =?utf-8?B?NDBpb3oydFBVQk1BQ1VKaFVJUFFtTVkrRk9ZcFZiM1NsWTRCQU9laWxLUXp3?=
 =?utf-8?B?WndEMDZzMnI4bHlrNkpIcnI2RDhwTTV4QUIvVlpxTmpNbFRKc3FDN2RMallj?=
 =?utf-8?B?V0t2SC9IZEUybExIVXJ6OXNaVVlRb3dWMHMzTUdMa2FRQkhUTzIzL0YyT005?=
 =?utf-8?B?NDhFczVXZjNGKy82bVBRMVNwcGwwUThWN1JGamptc1B0b2tiNTdJWTNUaElK?=
 =?utf-8?B?cjVkVXFlbnAwZzM2bFN6d0ZHTzVURmJoWmVwNVpYMHYwcXJ1c1Y3c25nV29G?=
 =?utf-8?B?MGtlaU9weVlGdTB1b2UycHRGR3NaVHN4VDFaT25LcUxYYzhzVXBBdjdvOStB?=
 =?utf-8?B?SmtZakp6cUwzbDZ0MVF4UEE1Q0dlUm9ZazFEdEhkREYwYnRqeWU5c3FEck9l?=
 =?utf-8?B?Q2NTK2x0c1VETFFnbGxob1l0QitsUVBiVUtISHBhbnVEWUVZTW84T09RLzM1?=
 =?utf-8?B?NWtiNmlNWlJFV3B0NW1EdC8wVDJTKzB2VkJEL0hYeEZzM3g4VWF0NUJDOXcx?=
 =?utf-8?B?V2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d141406-a407-43c1-7108-08dd98c50b4f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 00:10:22.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yWnayIDjBY1f8I0/p526kx4uCyPh/AzJJdiU+wTPH4YbkFb942vRbBrB3rT2CxYrex+G6w5ytHyYUP2VGa4mRhVAI/SptKpoDx7R/HkUmtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5940
X-OriginatorOrg: intel.com

Hi Tony,

On 5/21/25 4:43 PM, Luck, Tony wrote:
> On Wed, May 21, 2025 at 04:03:37PM -0700, Reinette Chatre wrote:
>> Hi Peter and Babu,
>>
>> On 5/21/25 2:18 AM, Peter Newman wrote:

..

>>> There's also the mongroup-RMID overcommit use case I described
>>> above[1]. On Intel we can safely assume that there are counters to
>>> back all RMIDs, so num_mbm_cntrs would be calculated directly from
>>> num_rmids.
>>
>> This is about the:
>> 	There's now more interest in Google for allowing explicit control of
>> 	where RMIDs are assigned on Intel platforms. Even though the number of
>> 	RMIDs implemented by hardware tends to be roughly the number of
>> 	containers they want to support, they often still need to create
>> 	containers when all RMIDs have already been allocated, which is not
>> 	currently allowed. Once the container has been created and starts
>> 	running, it's no longer possible to move its threads into a monitoring
>> 	group whenever RMIDs should become available again, so it's important
>> 	for resctrl to maintain an accurate task list for a container even
>> 	when RMIDs are not available.
>>
>> I see a monitor group as a collection of tasks that need to be monitored together.
>> The "task list" is the group of tasks that share a monitoring ID that
>> is required to be a valid ID since when any of the tasks are scheduled that ID is
>> written to the hardware. I intentionally tried to not use RMID since I believe
>> this is required for all archs.
>> I thus do not understand how a task can start running when it does not have
>> a valid monitoring ID. The idea of "deferred assignment" is not clear to me,
>> there can never be "unmonitored tasks", no? I think I am missing something here.
> 
> In the AMD/RMID implemenentation this might be achieved with something
> extra in the task structure to denote whether a task is in a monitored
> group or not. E.g. We add "task->rmid_valid" as well as "task->rmid".
> Tasks in an unmonitored group retain their "task->rmid" (that's what
> identifies them as a member of a group) but have task->rmid_valid set
> to false.  Context switch code would be updated to load "0" into the
> IA32_PQR_ASSOC.RMID field for tasks without a valid RMID. So they
> would still be monitored, but activity would be bundled with all
> tasks in the default resctrl group.
> 
> Presumably something analogous could be done for ARM/MPAM.
> 

I do not interpret this as an unmonitored task but instead a task that
belongs to the default resource group. Specifically, any data accumulated by
such a task is attributed to the default resource group. Having tasks
in a separate group but their monitoring data accumulating in/contributed to
the default resource group (that has its own set of tasks) sounds wrong to me. 
Such an implementation makes any monitoring data of default resource group
invalid, and by extension impossible to use default resource group to manage
an allocation for a group of monitor groups if user space needs insight
in monitoring data across all these monitor groups. User space will need to
interact with resctrl differently and individually query monitor groups instead
of CTRL_MON group once.

Reinette

