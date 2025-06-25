Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAC82DD61D;
	Wed, 25 Jun 2025 23:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750894053; cv=fail; b=ejA//Kxo6eciy9TXHuyr8XAj+hzwJC+K2Ldm+U8BMHg25/v8rz4da/WBD4BfiB/AptJDi5xc4xKK9vc3/mZKJ8wtSW2BsXz1o2w9fXibZcMjdTK+S9KLIuIYmw3kYBowTbd31mqaLh8T65i9NGi+1BZxbGviuooybqVGgn/JUFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750894053; c=relaxed/simple;
	bh=P6x1fqACzvHtXoTz/PAu0k1MzhsFM7A8Vv2mCfdAf5w=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lT725ya/1eWG+ODjg9CeukuDdN6Y7rU0QUQXFz/jBn2uE7rjJX3o7IyaZ8ysVKpuxhJG2uD6zR1hShdCk3DTamtKjFVJZK5zxk8pfrn92hgkm4SunEcdwzn9Tm6ymNFmyMQ3e1IRlscCk0qqQW6+t3zcdmlc077lB7b5c7mKEAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lsJDVd6A; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lsJDVd6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750894050; x=1782430050;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=P6x1fqACzvHtXoTz/PAu0k1MzhsFM7A8Vv2mCfdAf5w=;
  b=lsJDVd6ABrqloKNHth62HhRbqNl+sidJ7WEOe3ZrUHTTpHLaVVNixV2j
   VoZIfoRF7v48GlxJEOcxcwQu80qYekSk03dmpi0rWFZ5DEBDMvRjAbgGx
   PUfjINXvqRQTsbtLL6nzcqVI+h7KAf5mBWrCl0F3MZkiPKjM25gIpNC6U
   mIpvqk23UGNLYAH37dHvVInC2mo7AcKPQL4caSwbWfCi3yh27ALzcX3rc
   qA12bua2syfNUSS9ck2FzrE+6jJ4r6+rwzBuztB/I2YXBfpak0vMzNQKX
   ewa7a2hZ2cZX3buDLl1sjgJWcos9AjE4Q8zdfNCISyR6a5Fy0iuuxJBzu
   g==;
X-CSE-ConnectionGUID: JvSN/DM+TSmTjA5hB9vGiA==
X-CSE-MsgGUID: gF+3kmKYTFeh1inUpcR0dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53249137"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53249137"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:27:28 -0700
X-CSE-ConnectionGUID: D1sz8hz2R3+1FR4Gv1Vhqg==
X-CSE-MsgGUID: S0kaQlHaTpuMtU4gq/k1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="151875275"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:27:28 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:27:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:27:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.71)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:27:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tewyKbwUEDj5Hx+1bvCwOECGtEme4JDuTles63kFF+rfWZJdglCIo8cAZjB9sJrziGLVoQx0U4eUOK0fUODFol/aQyegrYkyrdIeJ45OCNU42ohSFe85Kj3KDrRU/Ok5V+7HDtR6EKRG0oy272MaUxOWhwQOErEUk/8faYovvcIjINLTk/Erytwleo9JmP6fHqVFjDD4Mya2jztaf3L8/kc2BS6BOsHTCkEbF2MFSlxNaC6c/cuvVXXpu6LIktHiT37RTujPQEuq0WBozaUQmWITUuN1EOZ4bv6WbgXFnlrpK+lRTzuHuWzz6wEyrECJEmYG9D6leStjP4qnZWRtfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S994FPaWfwp6o7ITujvfgBpPOru6v3Viq0Q/yYXMOew=;
 b=WjwCkgcH3XzYhwJ3LOcW4iZE3TIcQqNgUkw6YCwklkWXiexrfzv3FfVd6RxZ+mNlYdjuoYlzoeK6wLTy05fVnKjpHuRjTbn+UA273dlDARXJ/OqPgJCggeK6TPAqpMBZp49CAklxWTRMqf2UAt5eahmL72cVn7aBpJXVvXamty1ovme7x2gKCxMkvB8QM61d3lzgC4z+8yKBeYseuN51Ql5UUGzLUVOtQHYLAptx0D8oG+WlBvyzPMCBhMPv4tid2g8YByyVegcqXdOsXCBgmqdKuCYlfiPt3sFumnX1oBxn+ndR3YOaeu39e1U2aeXy1+DrgSOdr/iH+MZwjvrLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:27:11 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:27:11 +0000
Message-ID: <2313a148-2946-4d33-9062-852dc56e16dc@intel.com>
Date: Wed, 25 Jun 2025 16:27:08 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 28/32] fs/resctrl: Introduce mbm_L3_assignments to
 list assignments in a group
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
 <ee123e224ae4b7869378316df0da4ff00a19d093.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ee123e224ae4b7869378316df0da4ff00a19d093.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0356.namprd03.prod.outlook.com
 (2603:10b6:303:dc::31) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: 85133f13-940a-451f-00c1-08ddb43fcf5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHljbkJWSU4xc0laRU54aDY2dVpaWjR3Y0k0M0trUDB3VUdEUERMTFNsOG9p?=
 =?utf-8?B?TnpGdW9pbWdCbzlpa0RDZWdvTEFuamhadWgzN0hFbW1QL0lxNm10U0xXdTdt?=
 =?utf-8?B?T2pPNXpxVVhYcXB6YjlQYzJQN3pna1ViUTJ0MmFiOG5DaXNZYTl2a3IrdnlU?=
 =?utf-8?B?YmxzNFpHWXp1dUlFN3NaczBudUJQTzJBYUcxb2RKN3oxdXJaWXRteXkva1R2?=
 =?utf-8?B?YVVQcmRTVXlKU20zNTErdWxwbDF5RWJOVTIyNGFqN0FMUmtzOUp4N0hYRnQ2?=
 =?utf-8?B?QTFmVCs4aURndjFMOThNclhvUC9MTEQ4d2l6VHV6c01ic3Rub3N1UUNVRmQ3?=
 =?utf-8?B?L2U5Mnlpdk5sM0xxVmlwWWZZckZ3ZjFGY2dqN2hudnJDeVNQeHJRT244RGFm?=
 =?utf-8?B?UTZyby9wc1R4cEJTYjVHZjdyVmpVWUJDMVJDeWVwcXpiRXVPZDZKUXh4cVV6?=
 =?utf-8?B?YnpvZEdhc053L29VT3NzZk1QV2o1RWxET0kvTVlNTE5LMklQWUs1YldiYkV1?=
 =?utf-8?B?aDlTdGtUeVNSaEZPQmhNYWZDUkNBSk5Xd2lCWVhNZmRRcW5WZVFQNGowMkxM?=
 =?utf-8?B?QVRaaFJ5bEs5YXhBWmVLVTdJQjR0KzBYakY4bUhCeGlmYkt2TGk3Rk5zRklM?=
 =?utf-8?B?bnVrVDZTcFAvb2U2WDBiUUtIWG9kSHJPZEtMclBsaWgxRjR1RXNJVE1McVAw?=
 =?utf-8?B?c1ZGbjVweGRGTmtjTTFTa3ZIYWFyK2xIbG9oZXZacFFleGFBTzRKTllEUm1H?=
 =?utf-8?B?c1RYSnZ4aS92ZTBKZ2FsMFU1eXcyNEpRQkt0M2xjVjJ3c2ZkVUlRVlJsRXRn?=
 =?utf-8?B?SG5rN08ySHdTRElhT1NtN3AzU3RLR3hYdytFc0xrMWhZKzJMNVJrSEpROGJW?=
 =?utf-8?B?YVhpNGl5MmpiWGdkUU5xSGFDTVdzb045MDB2OURrV3BXSXpIQ2RPVTZ2WW5U?=
 =?utf-8?B?eWJUek1KR2dDeHM0K21DOWsyMWpHUG14VXVCUzRlQ1VHbDM2ZUtqeDgxc0RC?=
 =?utf-8?B?MWNqZVNoTlYyVmQzWStac1RYZ3c3QWhtdVliM2lHQWNSOWpNL2FlVTRra3pn?=
 =?utf-8?B?V09qcDZIYXIvbjNpVHhvYkN1Zlo4akhJdUIwZHk3T2ZXbGJDZEpkSFk4dlNJ?=
 =?utf-8?B?eC9pNUt2Y0x0WEVSKzlnbitMQXR6bk1ueTl1SFBjSG5rb091ai9CSEtvVDVt?=
 =?utf-8?B?a0g1d21neUc4ZWg1TW56SEw3WFlpZzVzajdJalNNQ1ZGek1iekxsSjdIWkc1?=
 =?utf-8?B?ZVVXZkRISzNKUnB2TzM1YmwyWXAvZnp2c05KcjFVaGQrNVVnaDdXR2MvczRE?=
 =?utf-8?B?Nnh5TTR6M2hKZGE1a2hwOWdIYUVNSTNVcW9JWFdJZjNac09HWnFsMUZoRVhm?=
 =?utf-8?B?Q0hQQklCdE12eG4wWEdoZ1JBczV4RXA4QTRycjR5ODdnMVdLbHBCcVRoajd2?=
 =?utf-8?B?dkx2RnlKQlRyMHRmOFF4NmpMQU1sN1dDVWpnejBQZnlGbWVkb0IveVpidjRI?=
 =?utf-8?B?TjJMc2psbktVNFZuWU5rU0NwV1NhSXkxcVJDMmNiKzMwZ0tTVlFxTjhGcUJi?=
 =?utf-8?B?TkE0b01IWVoyUnh6cVNGdGVIZDFUVkF3Q3ZVSEl6dXZlWmNpMU1jbXBVeEF5?=
 =?utf-8?B?WW9BSytlNUxmYjBRMnRPRS9GVVlmNXJjbGxhbitFUnpvTkJ6WGd2VmtkVGFs?=
 =?utf-8?B?NU1tQlZXWFJLcFIzaytiWGRxN0xSOXluWnZIRG02TlFQVURkOUdWV3JIMk0v?=
 =?utf-8?B?c281WTVRQ3dWYXVDZ003cHoraDg3UmpzTTdOU0MrWTdDNGNUdDJMMVZNMGRl?=
 =?utf-8?Q?MNJJKFUNQUCiJgCmMnOHJtBQL1BqgU4tyZyH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXBpaElDb2M1YjZ0YVZXd0h2WnpQZ245dEo2ZTZtck1BZU1vTm10KzV2QzMw?=
 =?utf-8?B?Q1JrWGNwQjRSSFd0THpsMUdVbGYzWUNOTyt2OTRRWVJSZDZ3QzZOOGVKZmRN?=
 =?utf-8?B?Y0FIeWhYNkhYYVRDVjVYU3BvZ3FhaU5TUW5lam9PaEh5RGtZczFQZTJFYkF6?=
 =?utf-8?B?ais5ZXQvOWFUUXdRWTJ4aEhIVWVaeEJreDBTckkrMjVBdElzaGV6K256TlRJ?=
 =?utf-8?B?UUYxWTU2SmowRjNmTkU0eTZycVk5MFRTOEtTM2R5RHFZM2d2Vk53TEpJVElP?=
 =?utf-8?B?QUVqUDNmRFhuU1oramNNVVlLcUUvMG81Z1RGODdERUpaSTRJcmN5OVRhU1BU?=
 =?utf-8?B?QWJONkJIZm9WdEtBRi9FL2htTHNkQUIrZ3I3eTJsMzNQZzB3SHdpbXk0dmdy?=
 =?utf-8?B?Vk9USWZrTmNETGFRMHpLZGlMd2lKRDJ3RUxuRkhCMjlremVsUnNCSk9HMmFG?=
 =?utf-8?B?UGZ5RUdoOFNzVXJoeXIrWmh3MG9MUDZva1p6SGQvNFpuQVFVUExLdGR2ajFZ?=
 =?utf-8?B?UDBJOGozMDFyTS9IYjdtczB2NWxpWEI3b295SWttOXQ5RFdNaENCRVVWc3lC?=
 =?utf-8?B?dTZzWDhrZjhTYm1MOGpBZGNGZlRJM0ZNQ0RTN2VwcCtBOGVOcFRyTVFoMk5W?=
 =?utf-8?B?dkhLbnZESDB4TWR5ODZOaW9OZkNJZ3ZjN2szR1NjV3Vxdkdnd2tZRGNnOTZh?=
 =?utf-8?B?YzJRQzk3a2VpQ2NJRHcxZDJPcDNHczhYb0tISUtZWm9RaVk4M3NxbUx4V3dO?=
 =?utf-8?B?V2pvV2E1eHRGcWdPR2FJanRmaDYzUElINFN5SVFoUGFlRHg0dGREY1NkRkh0?=
 =?utf-8?B?MUxPLzFqRGZNZjRDMi9MdVJGWjlGZit0ZHZZRkljYWFaZElYeUxpU2NoSk1o?=
 =?utf-8?B?MkdrQlp1TzJ0MkJUNjBLR2k0TFMvM3grSkZKcDFZazFFK0pGbjIwZFJDY1B3?=
 =?utf-8?B?UXBVWVVCMkZ2dlpjdExHTC8rSk9yRmhaTFVsQXpLQ3pMTkp6R2ZBbmhWako3?=
 =?utf-8?B?aVpKK0MrQWxtcllHbGhxYXBIUzdlY0pTdHBpa1k5Z3hURHFKaitrQVlkN1Vs?=
 =?utf-8?B?cHJKcUVsRWxTZHRUV2F1bDlleHlJQmlyenVCckNVdU5QN0xWMFZZbTJmQWtD?=
 =?utf-8?B?VndKazVEdnRwVEJJaXdINlU4Wm9xTGJOd2dKZ3NDOVVBY3VCVXFRY0hXTDlr?=
 =?utf-8?B?ZW1ESVVnK1IxT0U4azl1dE56VG9nRXF0TkJIeG9KNmVWN0JibWJVeW9jN25k?=
 =?utf-8?B?WnV3OTk3cjNGUjE0cE5DOUhsQjFIRWE4Q2p6K2NvazR0azhGZFhIejgvVEVQ?=
 =?utf-8?B?cHNrNHFWc2xnWXhZRTh1RzZycHhLakhYYStXSmZWS1E1YmprbG0xc3I5NEZk?=
 =?utf-8?B?Y2VVREQrSUhuOHdFSjZ4K09ZMm1aU0t1VTRTVjltajg4OVZ6eGZOMGtyZStB?=
 =?utf-8?B?d3BlTTkxdERXQXVMV3BhL2d6Y1JwcFZUbUR0d2cwYzlLY0VuRHpiMkk2enpF?=
 =?utf-8?B?VkZ6Y1pWdEdGeEthaENsM1dpVENiNGY5MVJZYTlkdGxLKzNJRG5ab3VLQjFj?=
 =?utf-8?B?amN6TnhxelI1Q3daSzhvbTZVYXZBR3pHbDBCa3B3NmhoRVpTZW1ZS3RUR210?=
 =?utf-8?B?QXV5WG1NcWYvVWR1Ui9YVmtqQ2RDZkVLQVhUYXR3TzQxamp1REltZXNSQkFi?=
 =?utf-8?B?ZUw1TEZUc1UxeHpibWJ6Z0pGWHVlT0VsMjNzOEhTejJJTE5Zb3RzeXB1UEdR?=
 =?utf-8?B?RzEyOFFZNU5aQ2N1S3Q1Y05BRk43Q2QxK3JIQUhKS29YS0RWbi9BOHZ4NE16?=
 =?utf-8?B?Z0FYN0RZSXk3YVJ3Ym15N3k5dTJXUDdHSXBRSk8yV213NDdhUTM3MFdHMTNx?=
 =?utf-8?B?U1BPTjlmU0grdjIxQkFZbzZUTEVSWDhGUEVDTVM5ZnhLRE5jeU5wYUdUZmtj?=
 =?utf-8?B?Yko4TDRRRWpUWmhIREQ5cVJ1YlAzd0VmN0w4YVc3Nkk0VCs4aVgzclJsbWIy?=
 =?utf-8?B?RVpWUGw2Zk9SbGErVnk3dy9iMHZXVzhKQnZJUi84UjYzc3o1L050alBaYk9r?=
 =?utf-8?B?VkM4QWFZaFhZZzZqTmxXeFNuSnZmanc5eSttckNWWWtjdnFPeHExQnB3TWtV?=
 =?utf-8?B?TVpaZ2JZMU1LcXIrbmc0QzArQkdicjFqTmhBM1lyM1RmVlhvbEJwU285NFdE?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85133f13-940a-451f-00c1-08ddb43fcf5d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:27:11.2366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 09gaX1RSckO1k31e7NJl5EaqUqK9GtopYS5kfr9VVujoUfu1q4+XWrr5jxF9AZouZqFVFmVs/Js478EZOJrntAfvAm9rnFZFd2t/9vRxCF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> Introduce the interface to display the assignment states for resctrl group

"Introduce the mbm_L3_assignments resctrl file associated with
CTRL_MON an MON resource groups to display the counter assignment
states of the resource group when "mbm_event" counter assignment
mode is enabled."

> when "mbm_event" mdoe is enabled.

"mdoe" -> "counter assignment mode"

> 
> The list is displayed in the following format:
> <Event>:<Domain id>=<Assignment state>

Similar to previous note, please add syntax for multiple domains to avoid
it appearing that each domain is on one line.

> 
> Event: A valid MBM event listed in
>        /sys/fs/resctrl/info/L3_MON/event_configs directory.
> 
> Domain ID: A valid domain ID.
> 
> The assignment state can be one of the following:
> 
> _ : No counter assigned.
> 
> e : Counter assigned exclusively.
> 
> Example:
> To list the assignment states for the default group
> $ cd /sys/fs/resctrl
> $ cat /sys/fs/resctrl/mbm_L3_assignments
> mbm_total_bytes:0=e;1=e
> mbm_local_bytes:0=e;1=e
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v14: Added missed rdtgroup_kn_lock_live on failure case.
>      Updated the user doc resctrl.rst to clarify counter assignments.
>      Updated the changelog.
> 
> v13: Changelog update.
>      Few changes in mbm_L3_assignments_show() after moving the event config to evt_list.
>      Resolved conflicts caused by the recent FS/ARCH code restructure.
>      The rdtgroup.c/monitor.c files have been split between the FS and ARCH directories.
> 
> v12: New patch:
>      Assignment interface moved inside the group based the discussion
>      https://lore.kernel.org/lkml/CALPaoCiii0vXOF06mfV=kVLBzhfNo0SFqt4kQGwGSGVUqvr2Dg@mail.gmail.com/#t
> ---
>  Documentation/filesystems/resctrl.rst | 28 ++++++++++++++
>  fs/resctrl/monitor.c                  |  1 +
>  fs/resctrl/rdtgroup.c                 | 54 +++++++++++++++++++++++++++
>  3 files changed, 83 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index f94c7c387416..a232a0b1356c 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -516,6 +516,34 @@ When the "mba_MBps" mount option is used all CTRL_MON groups will also contain:
>  	/sys/fs/resctrl/info/L3_MON/mon_features changes the input
>  	event.
>  
> +"mbm_L3_assignments":
> +	Exists when "mbm_event" mode is supported and lists the counter

""mbm_event" mode" -> "mbm_event" counter assignment mode"

> +	assignment states for the group.

"for the group" -> "of the group"?

> +
> +	The assignment list is displayed in the following format:
> +
> +	<Event>:<Domain ID>=<Assignment state>

Same comment about syntax example.

> +
> +	Event: A valid MBM event in the
> +	       /sys/fs/resctrl/info/L3_MON/event_configs directory.
> +
> +	Domain ID: A valid domain ID.
> +
> +	Assignment states:
> +
> +	_ : No counter assigned.
> +
> +	e : Counter assigned exclusively.
> +
> +	Example:
> +	To display the counter assignment states for the default group.
> +	::
> +
> +	 # cd /sys/fs/resctrl
> +	 # cat /sys/fs/resctrl/mbm_L3_assignments
> +	   mbm_total_bytes:0=e;1=e
> +	   mbm_local_bytes:0=e;1=e
> +
>  Resource allocation rules
>  -------------------------
>  
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index 1ec2efd50273..618c94cd1ad8 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -959,6 +959,7 @@ int resctrl_mon_resource_init(void)
>  		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>  		resctrl_file_fflags_init("mbm_assign_on_mkdir", RFTYPE_MON_INFO |
>  					 RFTYPE_RES_CACHE);
> +		resctrl_file_fflags_init("mbm_L3_assignments", RFTYPE_MON_BASE);
>  	}
>  
>  	return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 128a9db339f3..18ec65801dbb 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -2081,6 +2081,54 @@ static ssize_t resctrl_mbm_assign_on_mkdir_write(struct kernfs_open_file *of,
>  	return ret ?: nbytes;
>  }
>  
> +static int mbm_L3_assignments_show(struct kernfs_open_file *of, struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
> +	struct rdt_mon_domain *d;
> +	struct rdtgroup *rdtgrp;
> +	struct mon_evt *mevt;
> +	int ret = 0;
> +	bool sep;
> +
> +	rdtgrp = rdtgroup_kn_lock_live(of->kn);
> +	if (!rdtgrp) {
> +		ret = -ENOENT;
> +		goto out_assign;

out_assign -> out_unlock

> +	}
> +
> +	rdt_last_cmd_clear();
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_event mode is not enabled\n");
> +		ret = -ENOENT;
> +		goto out_assign;
> +	}
> +
> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {
> +		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
> +			continue;

(use macro and mon_evt::rid)

> +
> +		sep = false;
> +		seq_printf(s, "%s:", mevt->name);
> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
> +			if (sep)
> +				seq_putc(s, ';');
> +
> +			if (mbm_cntr_get(r, d, rdtgrp, mevt->evtid) >= 0)
> +				seq_printf(s, "%d=e", d->hdr.id);
> +			else
> +				seq_printf(s, "%d=_", d->hdr.id);
> +
> +			sep = true;
> +		}
> +		seq_putc(s, '\n');
> +	}
> +
> +out_assign:
> +	rdtgroup_kn_unlock(of->kn);
> +
> +	return ret;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2219,6 +2267,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= event_filter_show,
>  		.write		= event_filter_write,
>  	},
> +	{
> +		.name		= "mbm_L3_assignments",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= mbm_L3_assignments_show,
> +	},
>  	{
>  		.name		= "mbm_assign_mode",
>  		.mode		= 0444,

Reinette
