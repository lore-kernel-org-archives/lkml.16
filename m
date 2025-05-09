Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7CB22356BC
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 16:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746808189; cv=fail; b=TX8cbI5p3ykkRRLRMoaoEJOjPNUQ5R4nkIPdWbseF4LCuYZb5zpC8L5GqDDzArPtJYmo6PVJMeR1VXEIlRdXcpzo0f7xhnLpYszKxhSxtDo4/27xDt34wRAFgOEpzXkoKyo7zIpM0qz+lDt4xdD6M4CEvUkxT6z5NpSQC8UGWRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746808189; c=relaxed/simple;
	bh=uFufWwwFndUyFZMpkRW9H07MqcDg3EzVQfQONhSsj7Q=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=He4BqKeyn+uCZxF/acbFj2VuDXgo/H7R8WDn530TiK4ISHlVfV4SCfid11zk1+FPk5emZkw18bACiBedH3l0k9zkeS5ptxFjJcgp+hUHDrcACsqHyxueDh/foT97mVN9bkT35eKLnpJcJtN09wtsRviOZMKOoxuRPjhITZeImeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2TJFXy4; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2TJFXy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746808188; x=1778344188;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uFufWwwFndUyFZMpkRW9H07MqcDg3EzVQfQONhSsj7Q=;
  b=N2TJFXy4Hi0AoapjAdOabB/UZ2fqjfuRuvwpvBjVQznWNcU+jvwToLb9
   iaEql/0jggjoDyHme7v+IH7bo+RfTrrpyEvmDL1mIyOjMYOwAGEZnKj+v
   10aiZyzmtg/b+0fO+a83uX3Y4EgpwM/ekwE+d9N/Z2cXCHI2z3fXzm9IZ
   jp9/BzXYb60LMiJbpfE9m6MnD5EoucT+9kXZBhdNunP2l6ZytTTPAIKmY
   eUGdfdSxXG3+aOIPg+e+W4aqQkyeq0Q+UkqVbTBB1emaJJlsq4TseDaKC
   omkJmiXQTLZIpqR7UlO52R5eCaJXo/ODWvt9ehYQn6AuWn+044J27VdKb
   g==;
X-CSE-ConnectionGUID: e7F+0JEbShm35CARKMK8Lw==
X-CSE-MsgGUID: ZQlkzT4JT4WPaTQOJfLTlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48340686"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="48340686"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:29:47 -0700
X-CSE-ConnectionGUID: IugjEql4RmegpiK8o3vi3A==
X-CSE-MsgGUID: kZL4DwDBS7aCYpZ2umDilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; 
   d="scan'208";a="140727951"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 09:29:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 09:29:45 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 09:29:45 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 09:29:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tuKiRobDc6rGfx1y2DjR6RPMOalDDqOrh5Z6YoPOTDWDVGxyg1wv2DjmjgN1u9N+6iInmn+NtEQExl/C8hf7PJV9J8yEzCEQEWwc34FkqwsoE5Gnsts3SUeBUpbt6p8+XFsBB6+a8yOo2S1yO4/HuZJEf8rvUh+MAk6id9R+cjCh2xFOAbLgTbmUml8LGIxL+YLwry/NfD+EyblfCyUp8HZcEWAhXHOlBAncW2QzAckmiTxv+K4S3F3CojSWf5JIbCNjHMQ1BEmXPzz0VBXTYrA+oGbQXDZJzxyf+YDeMk3c8BxFC7ZQVDa2cvmHG1S5S/Yx0FJ7gT8nTFwSgLcdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKye5+3sYjk3uHLej8sDJgyp9ThTZYe+j8dzg/4BB5Q=;
 b=YVfTvYCC43vFv4nRJ6cCJaVKWgyDO+2kNBl2CHgATdzMvMrBljnOamiWrl6VBf/6JHYlivrZjWDMOmy7SL37Tg3KufdoUNlZRci1wTfFuBOBaJ5UGvQcuxTjsPVmylfzXDxVZ1N0pLKD+TedBUQmFSqDzztGbEE7Pb63qZAbqCuO/X33I6K8Uzd4+cqQ8ha3Sxpymn+wtSC1H7suH6GZVrZUEBPb94GciJUL/jWz5AhNM27sVZjJXgTSDIt4QJrrLSynSpxGtDTruYGUK1XmXupUXPNo/UQ57u5+wGc5LUhZg7ibBSVQfwNrrGUf+3JUicZHiqcZOJKrcji2V1f9jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by SA1PR11MB8350.namprd11.prod.outlook.com (2603:10b6:806:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:29:01 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8722.021; Fri, 9 May 2025
 16:29:01 +0000
Message-ID: <abdd65a7-1f8e-4c3f-8e08-94787a054430@intel.com>
Date: Fri, 9 May 2025 09:28:59 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/30] x86/resctrl: Check all domains are offline in
 resctrl_exit()
From: Reinette Chatre <reinette.chatre@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
CC: James Morse <james.morse@arm.com>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, H Peter Anvin
	<hpa@zytor.com>, Babu Moger <Babu.Moger@amd.com>,
	<shameerali.kolothum.thodi@huawei.com>, D Scott Phillips OS
	<scott@os.amperecomputing.com>, <carl@os.amperecomputing.com>,
	<lcherian@marvell.com>, <bobo.shaobowang@huawei.com>,
	<tan.shaopeng@fujitsu.com>, <baolin.wang@linux.alibaba.com>, Jamie Iles
	<quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
	<peternewman@google.com>, <dfustini@baylibre.com>, <amitsinght@marvell.com>,
	David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
	"Dave Martin" <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>, Shanker
 Donthineni <sdonthineni@nvidia.com>, <fenghuay@nvidia.com>, Shaopeng Tan
	<tan.shaopeng@jp.fujitsu.com>
References: <20250508171858.9197-1-james.morse@arm.com>
 <20250508171858.9197-8-james.morse@arm.com>
 <dafc0ab3-aaf7-4055-bf56-ffd5414f8895@intel.com> <aB3lS8K7I0wEkGw_@arm.com>
 <524a79fa-5066-44fb-b9ad-7182dd28fb39@intel.com>
Content-Language: en-US
In-Reply-To: <524a79fa-5066-44fb-b9ad-7182dd28fb39@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::20) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|SA1PR11MB8350:EE_
X-MS-Office365-Filtering-Correlation-Id: 390c865d-91d7-41e4-d3dd-08dd8f169b25
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDhnU0hYUWtORTZ0Nys1QkRVWEZWSTdranJCYUFBNDlIRnA0UVpqaVNtRERa?=
 =?utf-8?B?WkJBU0lVdThaZXhMT2JsQ3ZQWVlpdExYdUhxTzJSV0o1TmxPcE5rc21XUTBn?=
 =?utf-8?B?bHZielBvbnZ5WnNJT3RUTnJFZmhrT2xyS0poTU1jcXpkd25oTlBySDZhTHBn?=
 =?utf-8?B?ZTdodGh5ZGljeVVxTEU5UmNaNUY3WWlNSzdmZXExMCtHckVadnl6VjVvSGlF?=
 =?utf-8?B?OWdWN0h3ZnhROTV4UzlFbzkxRDlaZWxreUJjR0h2b1JSSmY1VENZM3VsSUNZ?=
 =?utf-8?B?cVVXeEl3b1c4QloyS0F2ZjRvUkxZSGpBVlhqUGhlbGxjN242eWZleFh3K3ky?=
 =?utf-8?B?cGRHcE41NjcwSml5YU1qVk5LYndjcXFCUE5oUzRVSTVHSWc5a3RzSDltckV0?=
 =?utf-8?B?YTB5bzBzZ3FCQTZjVWJyclU4MUk0YkttaHRqYlo4UmJOV1Y4K21BU29LZDZU?=
 =?utf-8?B?Z2Y5M1NGOFN5U05OK3hQRXlZQjJZeWs5RmIwT3JYYWtSdGcxVkRSeDNHMXFI?=
 =?utf-8?B?UGpaMU5yMzZCV0tFbEhTK0dFeG1oUHRFZjZBUzdMYWZjM0w0bm5aRjUvajRq?=
 =?utf-8?B?NXJ4dmp1UjdWM3pDenpTeklha08vbkNqL1RLaDJkVkxUQWx6SHFNRW8zWTN1?=
 =?utf-8?B?U2pJcUtGZnNPamFVbVNSdlJDWmhyNUJUVFJsK1pSdmIvV2pNaGcwUThJQ0pJ?=
 =?utf-8?B?ODlpN2dYQktubGxXRXkyMld0a1RtOUpCY2xQaDJDbmJ5OFBxS3NyWkhDeXVo?=
 =?utf-8?B?R2VTT2FQcVg4ZSsvazVEWFBNYkRwa0ZOTVVUa3F0Mnh3NFhaTGJsNS9XcHdD?=
 =?utf-8?B?OU9NdEFNZlVicnZ5SFRPb24rL2lJa05FK1pna1BpUEw3RE4rWUtuR05GZzlY?=
 =?utf-8?B?ZkhiVVpLQVVyVHlvQXplTll2MENIcm1hcUhVV1NtSkRRSUswOFZmYUdRV0o5?=
 =?utf-8?B?SW9lSFJ1cGthcWpwdFo5dENTQ0JOeVErc1ZiUlBhVmF0NmtBcWdmQkxGbjE1?=
 =?utf-8?B?RXpYbHkzUFZQYS9tcGcrSG5DZnNwdzkzbFZrc2k2MHJOMCtoZkx5ekpkRnl1?=
 =?utf-8?B?VENqUWU0eHRzQ0g3bEphb1VWTEE0TDNkWC9kNytMTHJvSzBIUGhCdWdYSlgv?=
 =?utf-8?B?MWhMcytpK2Jjc3VpczJwNlVUSnlDYlF5M21VK0hUNG1sN0FLNTNKWEtPcmFI?=
 =?utf-8?B?ckVrMEROWWYvODdWYXd5SnJFUWs0MzA0aGs3Yk1RUHVzcWdGSmpjT2hTaVdu?=
 =?utf-8?B?WVhWSFlicm1laU5hN3VxaTNQOFdWTjFNeWtINk5zdlE0UFVjcTlmbjJIR1l3?=
 =?utf-8?B?MVlETWNQaFM4Ty9nbXBlSUdCZHIvVzJmZGU2eGd0TC8zbkdUeG4vYS9HK3FN?=
 =?utf-8?B?Z3hNNVE2UUtsWWFlaENOZkZ3QXZKLzd4bUgxaEZlb09wdmp3bVZZeFZBeTNO?=
 =?utf-8?B?amRXV3NGVFlKR1F6MW4zcnhGMGgyVG1WMzlmQUVXM0dLVjhFanJDMWJGeE1T?=
 =?utf-8?B?N0VYcXVWS1BnVHdJcFphYWozOS94TDdkSkdNMVBhM29OWlgwakFFaUZpSU5K?=
 =?utf-8?B?UkRQY0hpRytzY3I5UjdpOTJRZWx1NlNWZXRJbUorQncwSHV4VHJpOVJNNEYr?=
 =?utf-8?B?dzQ5M0xXeHdld2xpdGh4Q0d2cHh3L1dMR213NFlKZGN0RTRrR0lzTU5ib3Uw?=
 =?utf-8?B?ZDBYZElsb1NuS012YXAraXdNNGJ0ZlpOT3VMTzFjcE9vRUcrU0RlSFpDT2Vr?=
 =?utf-8?B?VjBhMlUzczVyU2UrbEdLVEFScFNvazltN2ZtS0lsRDc3RzV1OWZJK1pKbTNw?=
 =?utf-8?B?WnVtekZ1NmEzZmV1aTl5b0FMSFBweStDdWV4Nk1pQTNBSGFkZFpWTi9KK3k0?=
 =?utf-8?B?aUxrNkdrcGk1dHVLOStCd2xCcXg2bXAzSVkzelFwMExYbXM5a0daRFU2aTlQ?=
 =?utf-8?Q?qa5aNqjROQI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2ZHSUc1cEhTTzBoUkdQaVY1Vjd6cUw2dkhXL0ZhVmJZb2ZYQTFITEpETC80?=
 =?utf-8?B?VUd2M2xhK0ZCYThtZnFXL2p2eUNobENVbUVBUk1RZG91QzZIT0NqT3dEQ0N2?=
 =?utf-8?B?eVRLSDRiRnNGZndoOU9ZMTZzdjlOYitWZDJ5TWN5L2hYcEYweWkyTWlsZEZj?=
 =?utf-8?B?QnRLc0c3QlRTSWttbkpoQjM0Q0Z6OFN6bkovMUtnNFMyUEFLUFJ2RDhYNXBi?=
 =?utf-8?B?Y1BVQmRSVmdIVFkzN0x5akdiaEtvN202RmVxTmpNL3VNY1VxT0sxck1OOEVW?=
 =?utf-8?B?cE1oSkFiYkFoL2VwRlJnSWV0Zi9rYkM1TVpBajR0WUFoSXhGVzJqeTZLRlZ5?=
 =?utf-8?B?a0VFYm1mdzZKSlRWbVRtUVBhT1grL0dZMGhJMGU4aDFsS05wSTloU0lsRnA3?=
 =?utf-8?B?V2xEUmRQNUwrSHI4T2NqTSt1cnR1VzhpR3dHdWFLcUtYVHJZSVVaSkhodGtR?=
 =?utf-8?B?WmNxQXpFVERWWVFLZWNncXZnYTVXTHIwaE1oeVVFSlkzMm9kZ1M2NWxvZTZo?=
 =?utf-8?B?dm5QTExTTnlaNlBEalRPQ2E1MDlpQ2FVdlVyb2NMeURSTHN4WDJIdC9MQzB0?=
 =?utf-8?B?TWExOFBpOW5BSm1aK1UxVHBxQ0dFLzNUdFJFOWxKVEY2S0FoVGtacUtpMG9J?=
 =?utf-8?B?VU1mVWZUUFlDTTI3VEdjRlMwVVdKaCtidlNWSHdkNVlycm5jNWdvUC9QLzBi?=
 =?utf-8?B?S2NGdmMwTHZpTHBXN1F6RmUrbmNPa01KTXpDRVJubXZnWVpvcjNXS0pHb0pF?=
 =?utf-8?B?d3lha1dnVHRNb2NVeHQ2dW5PNWtrVDdZeFJ6V09sQldLUEdnaUNoNEhHb3RJ?=
 =?utf-8?B?Z0dKWm50UTB3Nko5RGt1T29XZ1N0L2pFRXJYYmJQSWg3aU5lTlhaQU1PZFk1?=
 =?utf-8?B?UlhRS0k4N3dVeWZBVTZhZzF2cGdKT3lSQjBwOWYzSlp0bXByVHFUaGMyTzZP?=
 =?utf-8?B?ZzFxZmwyWERKWmJUSkhjL0VTV09DNmhER2JlRjN2eHdXR1NTb2x2RVJpTFlN?=
 =?utf-8?B?ZjN5ZXRJTkw4S2NuZy9oR0JIakxXYVhYbWxXWCt0WjFHdXhaTStRaXpDZnQ1?=
 =?utf-8?B?cEZ4aVg1Qiswb1JWVGRQbFB1bHNiVGdyaHk3SGlIM1pGOWRvcG5STTR1QURw?=
 =?utf-8?B?eHowa2VQRkRzTWJYbHk2czI2TGIrMHNUaW1ib2lFdHBzNzlFaFFITm1XR0Qx?=
 =?utf-8?B?VjUraEFoTG9SdjcxTmIyNjhXTENTQXVTR1hXdndwS3R6a2FXQk1IN3VSSERx?=
 =?utf-8?B?MVRUSEpLUUhwc0hjanNPQUQzRU5NTmhUZ2ZsUTV1RUlkK1dyV2Q2TUhhOG9v?=
 =?utf-8?B?bm85VWM3UWFOUzEyVXhtMWpiZTkzSFo2VWhTQ0RoMk8zbVJTc0JvcEJOK2JT?=
 =?utf-8?B?eUJWVTlqZ2JYczl3OUppSk95dmh0VXN0K0RrR3czM0o4b2FCM1Y1VDFBdGVh?=
 =?utf-8?B?dEtCbmtKbGZWWjJvS00yWmgzWFZ6cTM2K0Y0YXVzbllsUXg5VkkrR2JBb3Vv?=
 =?utf-8?B?bnlRWmQwM3ZINHppYnhBcTc3S1dFcGIyRWJsaGpvMjNRN3JsZldlNzBValk3?=
 =?utf-8?B?Ymxpc2F0Yi85TGJla0RqZFY3anpDMEtJMkZFemNxQk93cXdxSVRaMEw1SEVM?=
 =?utf-8?B?akdSaXJ2L3BsbTFVR045MDNqLzl2M3Q1WkdSM09FV2dGbnhoYnRVTzl6N1o3?=
 =?utf-8?B?MVpSY0x4YVRYQ3JGdzlJUGRjak5RdWkxdlFOamYzZ0xUbUxxU0FmUEpjZ3pm?=
 =?utf-8?B?V1lBY1BpaEl5VCtiMzlGYzVTNmVBelBrcm5LT1E2UXJMaGUyN1I1T0diM3FV?=
 =?utf-8?B?Y3ZJYlU2YThHNU9paXJESTM2TkRqQ0E1aG80ck5pNGJHcnZPOVcxdVZEeDF5?=
 =?utf-8?B?ck5JaXFnSmdNa3ptZEN6ZzZ1clVoSHM3SDN4clpYYW5DaG5scHNXbm43anJ2?=
 =?utf-8?B?LzZwVzJ1VmNsQ3J6Mmp3Y2h3YUIwUHdSV3kzMklMMDRIc3lTVFljS0czWHY5?=
 =?utf-8?B?UkZDYi9CcGpieDRRdWZXYytzMjVmUVpQWjBSQ2oySTVPUEU4T2ZaN3hqVERL?=
 =?utf-8?B?U3EyUHY2Qzk2TDBjYk5mYWV1cTcra1JOWWRZaGpHZzlMZWw0YmF5cXRGYjc1?=
 =?utf-8?B?TktqbUR1d3NYNVVwdmpDUnpUVW85RE1NOWpKVTlYS0p5a2tlNDNHeC9xZW1U?=
 =?utf-8?B?MUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 390c865d-91d7-41e4-d3dd-08dd8f169b25
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:29:01.2909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ypVs00zDgv7p3vdPzS6fHeBAyMJGlmsKUjHgzUcY4LZUqyRRdn6uRw4GvkKT1zcjhOqRXBZR0VyUKMUuw5PJIM67NAf/DAfqSXmu7FpTaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8350
X-OriginatorOrg: intel.com

Hi Catalin,

On 5/9/25 9:17 AM, Reinette Chatre wrote:
> Hi Catalin,
> 
> On 5/9/25 4:21 AM, Catalin Marinas wrote:
>> Hi Reinette,
>>
>> Thanks for the reviews.
>>
>> On Thu, May 08, 2025 at 10:51:23AM -0700, Reinette Chatre wrote:
>>> On 5/8/25 10:18 AM, James Morse wrote:
>>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> index 88197afbbb8a..f617ac97758b 100644
>>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>>> @@ -4420,8 +4420,32 @@ int __init resctrl_init(void)
>>>>  	return ret;
>>>>  }
>>>>  
>>>> +static bool __exit resctrl_online_domains_exist(void)
>>>> +{
>>>> +	struct rdt_resource *r;
>>>> +
>>>> +	for_each_rdt_resource(r) {
>>>> +		if (!list_empty(&r->ctrl_domains) || !list_empty(&r->mon_domains))
>>>> +			return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>>
>>> This looks the same as before. Did you notice my comment in [1] about this list_empty() usage?
>>
>> James may have missed that comment (and he's off today). Copying your
>> comment here:
>>
>>> A list needs to be initialized for list_empty() to behave as intended. A list within
>>> an uninitialized or "kzalloc()'ed" struct will not be considered empty.
>>> resctrl_arch_get_resource() as used by for_each_rdt_resource() already establishes
>>> that if an architecture does not support a particular resource then it can (should?)
>>> return a "dummy/not-capable" resource. I do not think resctrl should require
>>> anything additionally like initializing the lists of a dummy/not-capable resource
>>> to support things like this loop.
>>
>> I agree the description of the resctrl_arch_get_resource() semantics
>> doesn't specifically mention that the list_heads should be initialised
>> in dummy resources. IIUC, x86 should be safe for now since the
>> rdt_resources_all[] array elements have the ctrl_domains and mon_domains
>> list_heads initialised.
> 
> Not all x86 resources support both control and monitoring. For these resources x86
> only initializes the arrays it uses. For example, the L2 resource only supports control
> and thus only the ctrl_domains list is initialized. When the above loop runs on a resource
> like this it will return "true" because it believes there are monitoring domains
> online.
> 
> Your conclusion that x86 is safe for now may (reason for use of "may" follows) still
> be valid since resctrl_online_domains_exist() is only called by x86 from its
> resctrl_arch_exit() that is within the "exit.text" section. Here is where I am not
> entirely certain of the impact (hence the earlier use of "may") since from what I can
> tell the linker does not actually discard "exit.text" on x86 because it defines
> RUNTIME_DISCARD_EXIT.

If you are not familiar with the details then I should add for completeness that resctrl
is not currently capable of being compiled as a module.

Reinette

