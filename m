Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9BE328AF4
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751641242; cv=fail; b=VHp8fTmHHY1tbqQ3fT2gyoIejDnPCdcnK2JPlYcg4yfi3LvP3j3pVaCBvWwYGmJWWE2vixzViTkc+2mu5ZtwVWKyc/mpmO2ohqIC4CUhwBqNF8O2hWrGBuLCa8BhpfLcWesRXEnADAsbbTUxsiDdjZeyhqehypakHEAAibueHZw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751641242; c=relaxed/simple;
	bh=SWQpS6n4JsJxFrDEtBJl3P5ox84wFfnylXbE7yd9Y6w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=mQMDypSitOXwyRs2gG78sYipAFP+5f4PTo93A2mqyEe55nRptKtHlMiQdeJUq1WlRg7D6xhg0HSLZKbMkwffOrweYIKA47VfcvBOYNzumH4JhNAehktdEQNuMuvna5SSOczrUOzzMrvacXBtMoKqtaTdbc8QFEZ1lrdXwSQ1kPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kC2EZs0A; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kC2EZs0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751641241; x=1783177241;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SWQpS6n4JsJxFrDEtBJl3P5ox84wFfnylXbE7yd9Y6w=;
  b=kC2EZs0AXdoHaPlrp2CsUXQ6magk4ioG/Km9wrr9BksbuWg9+OjxA0/c
   GTaW3dvLh6GIaadhuE4lBqXeB3JPPJbRqMkyxLWoDHbRIld6xshCl4dbG
   kGrOSpgc+DrCETuiHzJsMOB2dWgtxP0vm6zsxOEY7kyNYXhCyC1GEHp9z
   ABqD0WiZix3LWlK8rqFrjD+eqqEts0cZhF6JWNz2BFUXHh9l6XyQ6Whb/
   VPSyyeu8bvAliSCOzAYuuUrYElxQuxJbWFQe4IyifuCuUPR+1IGqfC9yo
   iVCEfrJ8Ec8FctoG7Q6tScnfq+EnqgFJksXfkCCygJMq+F2T3aymimE+d
   w==;
X-CSE-ConnectionGUID: ak+ENEfhRAe9yuDs1Ul2qA==
X-CSE-MsgGUID: 9d5SiibyTme3Bu0e2HKuEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="64224636"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="64224636"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:00:40 -0700
X-CSE-ConnectionGUID: BFp/uw8WS5GuHvOKJOXMZg==
X-CSE-MsgGUID: 83VP568uTS2mnsGYrWK2qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="155236970"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 08:00:39 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 08:00:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 4 Jul 2025 08:00:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 4 Jul 2025 08:00:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dKAiwwVjkF8jz0nmkwcUEge2OSqIe17HzAKjlx3a3dbXNnBCCH54DkKNqs72Kra9/mx6VU3IVEmxemxjymDC3epF7C+45YDULk0L4otu/UXzXiFXEmxuYfaqCtPgbh8NAra+UfeuLd2nfCwpNlqYAmeTaJY1CvU/dcOVlQG0A82MFoL2jR5TTgbN1PYv8FL6ykKAvZzWsotSKVOFhafDdgdQhxdw5KTYIDlcp2j6Fe8gcfWxVgTvKLjyCuHlc52btGtcakuuTEtKiifpXCPjuw1DO70rJfQK/0pGZBh8gb+SmhC9P0YqC7mvWxWC70zDWQUPIcOu4nUJRuHLD5xZkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/3v+vFgGg9QMKdEybRyGewWzlnF5driXplYPGOX0s18=;
 b=sIY7Rec4OOguV7XWOAqVce3rUpEyydjlLnHaGt0VPhjJAR6w3cnL5Zu5Z8o94lNFAa6P9gsZHHVd/AQL0fCwFNTx13o49o8vC97elipThw0SrpflHe0o8KaBE3oS0LrqWE0EgJIky5jT+2PlQkzMqhlmR5jZfjSMvDP+eg+VK3+IjPNCaqO6kEP/h6IcE9iU2/9pXjo4LcVMlAZvfjuf1ACIxISWS5k24qRito4sxbBxEEEXuBhiNw6RS4Kc+QIG64CxTQI4+tgE5Bcl/IIWzvBue+1HIrgD7g+9J5Ktg1n/SGIMmNZGY2ejmWuow2XRUcQIAKly1NOh62vfY6e40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19) by
 MN0PR11MB5988.namprd11.prod.outlook.com (2603:10b6:208:373::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.20; Fri, 4 Jul 2025 15:00:22 +0000
Received: from DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce]) by DM4PR11MB6020.namprd11.prod.outlook.com
 ([fe80::4af6:d44e:b6b0:fdce%6]) with mapi id 15.20.8857.026; Fri, 4 Jul 2025
 15:00:22 +0000
Message-ID: <e1abcbde-252c-41cd-a018-c8222cb0661a@intel.com>
Date: Fri, 4 Jul 2025 23:00:02 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC patch v3 10/20] sched: Calculate the number of tasks that
 have LLC preference on a runqueue
To: Shrikanth Hegde <sshegde@linux.ibm.com>, Tim Chen
	<tim.c.chen@linux.intel.com>
CC: Juri Lelli <juri.lelli@redhat.com>, Dietmar Eggemann
	<dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall
	<bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider
	<vschneid@redhat.com>, Tim Chen <tim.c.chen@intel.com>, Vincent Guittot
	<vincent.guittot@linaro.org>, Libo Chen <libo.chen@oracle.com>, Abel Wu
	<wuyun.abel@bytedance.com>, Madadi Vineeth Reddy <vineethr@linux.ibm.com>,
	Hillf Danton <hdanton@sina.com>, Len Brown <len.brown@intel.com>,
	<linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, "Ingo
 Molnar" <mingo@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>,
	"Gautham R . Shenoy" <gautham.shenoy@amd.com>
References: <cover.1750268218.git.tim.c.chen@linux.intel.com>
 <0664be8a3e805ed93eb930131951b1a84cebed66.1750268218.git.tim.c.chen@linux.intel.com>
 <b5e454a8-6533-446b-9546-37fc63e9089e@linux.ibm.com>
Content-Language: en-US
From: "Chen, Yu C" <yu.c.chen@intel.com>
In-Reply-To: <b5e454a8-6533-446b-9546-37fc63e9089e@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34)
 To DM4PR11MB6020.namprd11.prod.outlook.com (2603:10b6:8:61::19)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB6020:EE_|MN0PR11MB5988:EE_
X-MS-Office365-Filtering-Correlation-Id: c50fdbee-b6f1-4766-3719-08ddbb0b7fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFFQOVp4WHBucHQzb1lTeVpsdXUxMngwd0diUDV4ODNjTjZWTWFaRWVqL0o1?=
 =?utf-8?B?NVRhS1VrVmtXcGR4NDZsNTJ6dWt6cWluZXdZSjU3SUhhUWk5ZVdCS3hTekI5?=
 =?utf-8?B?N2pwLzFDNFhHNWJhT1ZKTVIzcDZrckxBaVBwU2NERGVIUGpDUVdnY1VHSy9w?=
 =?utf-8?B?UzU1TGhCNmZoS25LYVcyMXFjRGtqTk16WHc2SWgvdnpKZy9VbGVsanp4Z1o5?=
 =?utf-8?B?SlpmRUxabGhQamNtTEx3VkFhMzlGMEpEWUZwWUR4a3NYb0p4M2d6L0EvZzZV?=
 =?utf-8?B?Vm1hY3dkdW1PTmhub0h0N08vWEVhNklFajlRdTlkQmJ1eHZUOUdxRExoOEVL?=
 =?utf-8?B?TnAvTFVCVnlHb0IxaWk3bkFoVm5JSTYxYVJMUVJKYjc1Mm1qcC9zL0owVzNL?=
 =?utf-8?B?SXphMFFIOEFHNWd4Z0RXeElueFVHS0VpZ2VMZHd1L01LajZjdXB2ZE5WSDhx?=
 =?utf-8?B?RGNrVTJGZGd5QVBkbGUxYjBoaTFySWlwQVFGTUlOL0J4clA4aWdYQ0NGWkR6?=
 =?utf-8?B?ZnZ1MGtaNjZWaXBuREZDV0gxM0pwcFhveUlZeUk3MklVRGNvRytxeWg3M0NZ?=
 =?utf-8?B?bkdzcXFYeWUvcnBOSWRzd1Bkc2hQVFBuUlBnN2lRWE8wNERtc01BaEtaOE5x?=
 =?utf-8?B?V0lqd2tJSVh5b2g0a1BrNExvdUM1M0dtenNQcHo5MUNTQUlCN05mQ1N2M1l1?=
 =?utf-8?B?MzR4Zm5odlpCN0UvZktQaURUajZHS2ozSGJRTEQxN1doR1M5N1dmR2FXY3Vx?=
 =?utf-8?B?M0dZZDFQMjdPTnBpM0lpUjA5c1NHeVE4c3lFOXU4ZFhBalZIeGlLbkg3RDdO?=
 =?utf-8?B?Y1poaHNaUnpWcUZMdlZMdzl3ZzJqZ1JqQW0xZVo4RmV3Z3VCQWlTcHRpSlRj?=
 =?utf-8?B?T3RBdUFQbnYrMXFJblpBc2djNU41dFl2bTAxVEIzdmE4djF3eTZWcEtLWjFS?=
 =?utf-8?B?eE9XNWU4bWVUd3V1cEJOVEtXMzUzSlNIcmZwVW40WkNIaUQvNy8wK0ZtRnZ6?=
 =?utf-8?B?TDNrZWZRN2xHaXFMSUFBanRvSDFleFhGWkVodlZJdHBtYks5Vk5DNXRkU1VC?=
 =?utf-8?B?czhIUzZiekRYS1lmd0NiZHp4cTBTR2l1dndGUUtCVHVWTmtFMnZRNEN5VEYw?=
 =?utf-8?B?emdaeE9MU1hwM09jeWN1TzhFbmlJSkE1UW1tNS9kYW8vYzgyZGJvN2VBU3BO?=
 =?utf-8?B?Q2RueG5qMThYby9aUnF4N3hDb2pzNzUyUEMrVWtPQW9KdGlBeGtoZ3c0dW9y?=
 =?utf-8?B?dHNVdlg1VkxUWVRJMG53bExsRllKeWZIY291My8xbzlwWkNVMGhnWXpRM25W?=
 =?utf-8?B?K1FrNElqVmZISnh1QXhBTWZBQTRaT1IzUlI5UTZLcWpXQTV5elhvbW9ZUm1J?=
 =?utf-8?B?QXAwYkRJMUJDQlNLR0JZOW5Ya0NaVTZnSDg3YUpqcTMrZHhOajJPMHZxcGNy?=
 =?utf-8?B?Sk5mSE1ySHBhTzFadndrb0FkSnZWN24rS3dUQnp4NlNrcDVKZWgrOEp6MVIy?=
 =?utf-8?B?bTVNTUdhTHJUOEc0dHZWRFhkQnFzcnlHTnVDT2t4NnVDVVYwMXVhQXdHSUs1?=
 =?utf-8?B?MmUvekpyeFNMK1hpeWtkM0poWSt3UUMxUmVjUzVTLzJ5SWdla28ySU1mdmJv?=
 =?utf-8?B?OWxEYVhudGlEQlNPekl3SllIYmg0R2JxQ3pIY3YyOUEyUXdoemVLb2diZlBX?=
 =?utf-8?B?L3NVdDBvaGpXcCtHRmFlWVA1K2lpZ2xxaXhidHg3SXVBKzZ4RGpBUTJZVVhw?=
 =?utf-8?B?R04wNFN2MVlsTUJuVHNnWTFJNXVtVzNzQUpuWGxjblByTTJUNWdoV2E2TjBv?=
 =?utf-8?B?YTJESXFIRUJ1cmVhRnh0ckNlQWpLaHFmMGJxSGxnbEtjVzlTbHpsVnByWWZU?=
 =?utf-8?B?S3ZVbnZPSWk4ZkNqZ1pkR1BwdUNwQkZpN0kwZEJpTkIrcFE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB6020.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTFvMkZuc1BqTlZZYkJScVpGNUREVDlvZmNERmF6S1kxSWkwcWl4RG5YRUdv?=
 =?utf-8?B?Qk8wUUhVOWdlblhIc0pqdDFvbmN4OVVsZ3FqRCtSZ0ZoODlxcm1sYjh4M1FY?=
 =?utf-8?B?V1hHZEw3VVg5WUpRdjFMNXk4QmVDaDFlbTRkWTFRQk1CUkVVMUY2dmdCanls?=
 =?utf-8?B?aXlxaS93L2ZyZEVia2g4TnYrNlc3ZHVlOHhwbkNFK1JVZXBxRk9saXF6emll?=
 =?utf-8?B?NGZQNXh2c0RRTXZCVGh1eHFoSCt3Y005YStSMWVDMFJjS0UxUGJ3c05KUmVQ?=
 =?utf-8?B?RFZrZzd3bm1mNXhDd2gwczM2bDhBNDJHUURGWGFkcEdGK1Zla0FjMkJmRjcv?=
 =?utf-8?B?NnpQMEdUcjU5Sk9YSXRUcHB1VENBTWtwM3hsbHVVUUQycHR0YVZ6MmQvRUZD?=
 =?utf-8?B?MThlTGtHOXA1T0RLdFNiR3ZsM2hzeVR4YjdBZldzWU5hVFlZT2xEMlNIU1ov?=
 =?utf-8?B?eGRoNDB5NWFQWm5lbHg0dlErZnpFWG04YkdrSnRKT01nUXJyK0loekUyK0Fq?=
 =?utf-8?B?dGZtMlYrUWxCRXplS21KK050aDBHNVRaYmljb0dNc0RHVzQzeUg5T01SUFZ0?=
 =?utf-8?B?NGhXYWJVQmxqSm91MzBCa3QyUnFpZ2RSMkREZjVPeEQ4T2JKbUQrVTcwYnFR?=
 =?utf-8?B?eTdUMy9sTHVhamxlb0tXU2UzSGJWYldQc0o1SFNKWS9iVUZEaVlvQ1pZYzlU?=
 =?utf-8?B?ci9GajNEQzNxazFjOHFoYWRFT2FIc3p1QUlKdG5VYWhUa1pnUktXM3IvN0Yz?=
 =?utf-8?B?WXhxSkdUL3U3RG9YczZYUm9lcVN4RVhTeFFhbmtuemZ3dHowZkNsdUhaQXFN?=
 =?utf-8?B?THRuNUN2aGtyMFlzMUpCTy80SUdtY1dLSlpQcFZIL09QeFdFZlFqWHkzem11?=
 =?utf-8?B?eFJQcG56SEpWMWdJNVA2dlp4TVduRzVGODNnTTRRZ2UvTWlxancvdkxLS0k2?=
 =?utf-8?B?ODVBaVFwM0ptWGIzWGJwa2VMSDhZUE5RZzBHWk1JRjVVanlwei9BM1VmUldl?=
 =?utf-8?B?R0xoREZQRVVRVnVwY0s4T0hhZEVNUm84Vy9lK1greG9OZ21vWmVwdzliNlhN?=
 =?utf-8?B?SVlmYi9USWFTZjVIYURucmRlWXpld2Y1dHBKQjVVWHpvQSs3eWZHTUZFUmRZ?=
 =?utf-8?B?Y0w3SjhjZldHdTNuT3ZqblNrU0d0YUpkZU5Eb3F4V3ZadUQrRUxyVk9nK1VK?=
 =?utf-8?B?UHYxQVRTY09nRktRN2Rha2lFSUwxWW0rUjVPWjVmSG9oTGhFMUhpdHJ2RnNU?=
 =?utf-8?B?WmkvTUdqTCtwMDN3bllzcWI3cU1pTTc3WEFISGJDNXNTZ2VJSkNlOXlXMklP?=
 =?utf-8?B?YUxMK3lrb1hJYlJSVmJqZ2h0NEZyNzhBbTBuNlkwMGRGWFNoWGZFU3gwTjNx?=
 =?utf-8?B?Y3lNTjYvOUxmYThreG5DN3l1RHZXNi9CcWRrYnEvQWhOdHNnQjMzQjBkcjgy?=
 =?utf-8?B?cXdxSURKb0FCMW9Fd3k5V3l0emYwK1JJYkg2Umc5UTFjZUowNjF4SVFOYzNy?=
 =?utf-8?B?ODdETnR0T0RielNvMDRxMmNCVk1qeTAzdXA1eGdoOGJYUDkvYVlkQTBYTGdi?=
 =?utf-8?B?Tlg4Ym94eVY0ZkhuellaZjhSYjlXN2JlZXpVeHphOHRKVE1QT2tHYStMeDVk?=
 =?utf-8?B?LzNLTXZ0TjhndnNaalFLa0FNMStxSjZEVHg0a0YxSkx1cVhVQnV4NFdRNDZF?=
 =?utf-8?B?MngybkswSll5MVY0cU1tMUVud3R4SE5EcWZzWSt1aTZ2dG1uRzJwSjE1VWcv?=
 =?utf-8?B?SHVKc0lId0NSWldZR3RybGx4WStMWkR2VW0rblpTYk5BdVpwTUMrRkpNRE1L?=
 =?utf-8?B?T2VMbThCM05MdlF3Rk8vbG1jYXRCVzZ4UGFpTmVFbm42aGVnVGJxQUNwa3Va?=
 =?utf-8?B?WUR4VldKd1BzK1EwL3l0VDJHeTR3MXBYNTdlVG4wRlBSVzhkaDRDWnN0REFQ?=
 =?utf-8?B?ZG10cElOWWpyaVA5aDVkUlBlQUU5SVFncjYvZi9GTFFwRUZHVGVqb3E5eGd0?=
 =?utf-8?B?TmRjVldnM3RMNWEydGtxTEhPMW8wTFNZOUU4OEUzUlpyQWRtRXlDT1kxQXEx?=
 =?utf-8?B?MUhIOFcxNUNKcnc4d2RBR01MRjA2NEtYRzRUa1BCaXNoRHh4ZGlka2sxVjJm?=
 =?utf-8?Q?Y2RyqkZ6m+sLkzygjWF6U45c3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c50fdbee-b6f1-4766-3719-08ddbb0b7fbf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 15:00:22.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0DR+6JO0MgPxtgIbr8dwxhC5Gmj4BVIWDSDj0afWVfqG7c4nVDxGDs6tQI4tAk5wY4oa90o9n8Uaqpsp/TY9rw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5988
X-OriginatorOrg: intel.com

On 7/4/2025 3:45 AM, Shrikanth Hegde wrote:
> 
> 
> On 6/18/25 23:57, Tim Chen wrote:
>> Track for each run queue, the number of tasks that have a LLC preference
>> and how many of those tasks are running in its preferred LLC.  This is
>> similar to nr_numa_running and nr_preferred_running for NUMA balance,
>> and will be used by the cache-aware load balancing in subsequent patches.
>>
>> Signed-off-by: Tim Chen <tim.c.chen@linux.intel.com>
>> ---
>>   kernel/sched/core.c  | 12 ++++++++++++
>>   kernel/sched/fair.c  | 42 +++++++++++++++++++++++++++++++++++++++++-
>>   kernel/sched/sched.h |  7 +++++++
>>   3 files changed, 60 insertions(+), 1 deletion(-)
>>
>> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
>> index d9c3e75f79d1..34056eb79ef2 100644
>> --- a/kernel/sched/core.c
>> +++ b/kernel/sched/core.c
>> @@ -498,6 +498,18 @@ void __trace_set_current_state(int state_value)
>>   }
>>   EXPORT_SYMBOL(__trace_set_current_state);
>> +#ifdef CONFIG_SMP
> 
> 
> CONFIG_SMP is true unconditionally now. Else may need to go.
> 

OK. I suppose it will take effect from 6.17? We can remove this control
after rebasing to that version.

thanks,
Chenyu

