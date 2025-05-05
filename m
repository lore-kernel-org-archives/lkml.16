Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95CF268682;
	Mon,  5 May 2025 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462163; cv=fail; b=Ij6uT6NsolMVP0pjBzWTyHVJWMcjbGGntmdpzzZIJN92R6auVSPkzdzmBc9CY8yiqQm7W6LceXC8eAA8Cw82AmNFo3Uqsc1rsWZGWwaWWLeeLSjg3I9B8/sVeKAmDogcpClvrJkCCOepiisqtpVwDaTbjLOfA3/mK9VcmxJLn2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462163; c=relaxed/simple;
	bh=ruwK2l1jaPPK0WNVyL42NLgr6rRhuyk7maVJnQNvcGo=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JTT+rxFZU12qVz3dBnA6JnXTkyM6+pKULNcYtA2IX9/gJXSW1iB/uEN31HSZwqJyrMBDNVSkbpjIZb4AAOFZhA7E5x6XDXjmOYQIfa0VIw2f8A/7RaYHvkZ6h4mXGskujKAEJ+AM72xKUpl8MkA2rP/tNFZLn6i39tykxN08jKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b0fBHjQl; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0fBHjQl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746462162; x=1777998162;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ruwK2l1jaPPK0WNVyL42NLgr6rRhuyk7maVJnQNvcGo=;
  b=b0fBHjQlfzdfeEGnCywbx6jrKoX1x7N2Qz6LqzgUEFfvzc19W14l90og
   mnDZ62Z5ckI1SJqCQFrKOYpPlJ+NcKRW01MUQQUhbQ2AhreT0MfrMdwv2
   fQkYdYA8WyHNqSZI2MzY9ZmipcegfTAYwbq8cvVWersEKwUZdzeqBzrHp
   qSeUrQYzZlbAqDozYJX1sTYKCYShCkY5zsY2zdP1WLAAHLCMvwbqLMkwP
   S4MOB3ed5b0yUglmgBrTOaTaSjpP7IAEZwdmUQcFcuH+G0mRzBwOMCTJS
   udaPwhfFq6oz+ZrHW2AmNucTSEkuuKfrhfjcB5p6LQAG5T5l4BnUGGOnW
   g==;
X-CSE-ConnectionGUID: +uOz+4H4TMmzoXOo8IygVg==
X-CSE-MsgGUID: /2u/zjqkQQy0bYEY6x50fA==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59430899"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="59430899"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:22:40 -0700
X-CSE-ConnectionGUID: PTDvz/VQQHCxCI4ybE/Smg==
X-CSE-MsgGUID: bxmC1mNPRRypQHRH8dN0Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="158512197"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 09:22:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 09:22:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 09:22:37 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 09:22:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSUX62bqewJx6fBixasUg/you6TSg5K2QHmwhXqsXrFp1yVJwOxImx0FN5j4JozpUiFEpdzMVx+3ZOBzv8gth3G+nTk52bqKnRcwQ0OkjblIFtejZEhpnetXfiehp8Ka5YRf6o+C+zSVctZ4EGRn6LxCo7kZchYd9l6Cexw5tQE7cLnbXQiPBveCJFDoKUjDERdq820TC35wpw4Qmd5BBHofsUi1kqOeegdwZqnVUloAytnxdriSGUBvue99xlyoo/UjZlSyuF3HQpuHhfNuueOKp2HhPkmCHw9A4qWAMnL3bYEweBLN2iEg8VoF/Pef+UjDzz8L+KsFADt2p2NdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/rEt8pQjJTZnE0t3VZfryqx6BVZWG+MBQk87LqWFy5s=;
 b=hhyVwO2Ebl3EdM7EGQ0djQYD14UwE50jHjSHWawRt7LJBGAIS4nfRAgXEmOzKemok2kVI8oGz9feQXNyf502O+r3xeZhRpK56hfyddrUHJTS+0NYw3cz+L8vbw1ejZtfYUBsOfyJOiPx9jSN4lAwhJNf55OS45ELWY4QXpg27KEEAPi6OKRN0djT8g7dJUG9jk2Q5tYfbOXJtbIOeR9PsmLlUY1IM8zZzo0kCbCRBJZGYXGSgeL7TBo1htOE/WPy9CiW2aNQDXm+uS2RYRjRyS52j1p7MJvxYZboYhQIcfiM9D87Ly+9dE4e8Lnrqvv9OwcplTDSNQcjZcO/32+rJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV8PR11MB8700.namprd11.prod.outlook.com (2603:10b6:408:201::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Mon, 5 May
 2025 16:22:26 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 16:22:23 +0000
Message-ID: <3ca0a5dc-ad9c-4767-9011-b79d986e1e8d@intel.com>
Date: Mon, 5 May 2025 09:22:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/8] Support L3 Smart Data Cache Injection Allocation
 Enforcement (SDCIAE)
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<tony.luck@intel.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <corbet@lwn.net>, <x86@kernel.org>, <hpa@zytor.com>,
	<akpm@linux-foundation.org>, <paulmck@kernel.org>, <rostedt@goodmis.org>,
	<thuth@redhat.com>, <ardb@kernel.org>, <gregkh@linuxfoundation.org>,
	<thomas.lendacky@amd.com>, <mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<seanjc@google.com>, <kai.huang@intel.com>, <xiaoyao.li@intel.com>,
	<kan.liang@linux.intel.com>, <riel@surriel.com>, <xin3.li@intel.com>,
	<xin@zytor.com>, <sohil.mehta@intel.com>, <ak@linux.intel.com>,
	<ebiggers@google.com>, <andrew.cooper3@citrix.com>, <gautham.shenoy@amd.com>,
	<Xiaojian.Du@amd.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <james.morse@arm.com>, <fenghuay@nvidia.com>,
	<peternewman@google.com>
References: <cover.1745275431.git.babu.moger@amd.com>
 <c00c00ea-a9ac-4c56-961c-dc5bf633476b@intel.com>
 <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <3e0e9b68-2ebe-40f8-a840-1ad7cd3f56e0@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0103.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::18) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV8PR11MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 73ccb6a2-058c-4928-9ff0-08dd8bf1042e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WEw2dFBJZkJaVWxpWThOMXhjdldQVFVvTlZUTWI1TndybDh3UktHb1N2NSts?=
 =?utf-8?B?VUZPcE03V0UyYXRxUUZCZnVJb3Nka2JlWTFaN3VSaEUzVFlzMnpYK1NBQWZy?=
 =?utf-8?B?M2wxbkVMRmVmZ0N6NlpOQ2dKdHg0b2JzVXVST0VMdVFIek9SdDdKS3VaelpL?=
 =?utf-8?B?Zk5kREtxTy9Kb25EY0xXMDhudjY2ekRGZkczT0RxK0RRNmRMMkFISlowOG5Q?=
 =?utf-8?B?VHdoUG03ekkwZURSLzRodndTaUFNa1VaNStxVUlwc2N2VjVycjNjTjQ0YXdK?=
 =?utf-8?B?Z1p3NUdIL0tNYmVBNkJEYTdTV1FKYlNGNitFS0VkYTZBd25tOGZsWUhMZ0Nx?=
 =?utf-8?B?RGxEb0tZMXZOcVFLbFlLazJzNURsbGV0VVcvbit3dlk3UUxoS3hDd0dRK3pz?=
 =?utf-8?B?cjRCRkw0WHJoVmRVeDZpaUlJWk0ydmxuRjBwVzNmRDJMYTVQYitrVjJBUkph?=
 =?utf-8?B?a3lYeDFNdkJEMEJrVTZGZDRicFVSWjJWa2ZpM2VRY2YyZCtZSVdtZldubGFl?=
 =?utf-8?B?eklVZDI2NldRT0x4Yll6L1pWTWxjVUFCa2QrT1hoVE83NW41aVg1ZkJJc1U5?=
 =?utf-8?B?MmVCNWs2Um9BNFNXU1E0OE5PRThwSUNzVlZubjM1SzRpYnlDQUFjdnhDYXJD?=
 =?utf-8?B?ZnVjaVZFanB0b1F0ZkdwcVlhTTJxNUEyNUE2VSs2dHlaMDhSVEJhSm5kYW5P?=
 =?utf-8?B?alR1TDJoKzBvaDYvL3lZOC8yRzhZZUpsdE82emlSMU13T1kvOG0vMEkvN1dY?=
 =?utf-8?B?MzNBY0ZpTHFnczBaaWhGWXh5ODZ1aEE3ZUVCV2x3azFRMklWaU44S1ZKZzBU?=
 =?utf-8?B?alJFRXIyVFlnSFpCMlhrRE9NcTV1MWthRHFNcUVIZG11Ykt1UlE2UFVnYkZO?=
 =?utf-8?B?SGlIMDRyK0FVa1hiYUpXWCs2b0ZFaTN5UzNlbmhjSjRSZEZJNitmdG9QMTUx?=
 =?utf-8?B?SUlDSnprZUlKdCttN0wrOE93QjhEVWdzNCt6bm15blBIa0FBUTBsd2ZUcWs2?=
 =?utf-8?B?YUVJV2RKWUZ3YmZqdDdJam9RV2t1Vkg1dE1qTk9zV2VKK290VG5ETmtaODMw?=
 =?utf-8?B?SklvTE5xQ0tuMm1EdEtCdjBaajNyMWhad1dzb0RTakNkTVRQZEI1VkwwbWlJ?=
 =?utf-8?B?MS91S0hMZVVITEp4d3F5Y0sveTlSdFk5R0ZSdXZKMDdlWnZJQTV0N2sra2M4?=
 =?utf-8?B?NFFSai9QNjUxdm1pZzRnWEQyMVFVTzlYNllzOFNXeUVQd2FVWTR6UWtWcGND?=
 =?utf-8?B?M1RKSDdvRkkvd3JST3hoQmIwZGRTMk90c2hvaWllWHEyUUpGbldlSm00RnlN?=
 =?utf-8?B?NWZScDBKMVpRZEJkQSs3aWNuMElFLzdDRDdsb1VsOFUzT2liaklybm5OSm45?=
 =?utf-8?B?dFI1cGtzY04vR2J4WlhoL2pDK2VUdmthdnZuODhCMW5PbGJYYTdybE42eGRU?=
 =?utf-8?B?aUltakhDYWtyN0dpWWo5ODM5M3pXV0tyTEZkZDh4QjF4allnY1JiV2I0aE1v?=
 =?utf-8?B?TG5GVEc0RmYvZUNWRmZhc1hIOXd1SStySEF6YVVIRXlGZGdVTU1YamlYT1VN?=
 =?utf-8?B?KzVTVE5aa1NwNjk3b2ZqTklUaDhaM1BNSXc4UjM5T1RSMkF0eXF5MHlIYlpE?=
 =?utf-8?B?dGU0N1JsOGZ2UkRrU213S21zNW5MQysvd3FvKzhuTy9CMGFMVHVoV0lIUHda?=
 =?utf-8?B?RjZTT1lTTnRJZmlOWW1WWEhET3F4NDFITm5WcThqM1lTMGtsdmZnUzdESFNo?=
 =?utf-8?B?Sno0dXVtQUNVdzVBaEVNem8ydXN6L1Z1UVgwUlN3QlpxQW1VaDZkL0dOQ2E5?=
 =?utf-8?B?NmNSWjEvaE5KdXY4SXlXWmRTb0NsbHhlUk81WWR0TXRNNWRXTjJTWjZKb3RL?=
 =?utf-8?B?ZFdpVXBYbXpiQmx0R2k4Z2FBREo1M2hSaGkveUQva2V6anFseW5GU0dFbzB6?=
 =?utf-8?Q?nevbAkFjZ9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHQ2MkdscHhiWVhyTXBSaTlWMHQ4c1FOSjc2dGxuVVBoZE85Rys3U3g5MWFr?=
 =?utf-8?B?VU9zRDJQa0c3QXUzYjRQTXg3ejhUR1JsbXorRGJvYW1Nc1hoMVJjZGdwbTky?=
 =?utf-8?B?bTh3anJ6T2tSNzNpaFB6a29IRW8rb3RIZkFLWnd3Z2NlTmdxQk43V1ZXMW13?=
 =?utf-8?B?MW0zT0VkeDJuS2JPc2EyUHJLakUvbXJGR2hLaEgyYTdITzhjT1B1T1FzTjFl?=
 =?utf-8?B?Mncxd00xWVlxZWJSSWZ5N0J1VGRaMEkvb3d5NXJmVDZXZUZsRllRY2czTnQ1?=
 =?utf-8?B?NTA5NkNVenI5YVJtaHpTc2JNR0VkVTE0VWlNc2xVMjBhTkVtS3lNRXhJUEpR?=
 =?utf-8?B?WG9mKzlJcDZONnduelVaNzFOUHlUNGg0bEEzM2pVL3A1SnFhcmduSDByMXVk?=
 =?utf-8?B?ODl3SE4rYnZhUjlXaDdHQnpKVElCSyttZVM3d0c0RmNDRktnSVd3MHRUM0xx?=
 =?utf-8?B?c0RLQkdQTUJPbGRaMHBTUUJQNzVMY0FZNkFXR2V0SWx1aGY5Sm5la3NBY0Nq?=
 =?utf-8?B?UG1jbW55Q3ZBa2J2SU91QmQ4RDV4czVrM3B0Tml2UlV6RXdkSE85MUY5S0Nz?=
 =?utf-8?B?WEFxTytobDhXUHM0N2RwVnY0K3FsdW90amxNT3lGUU5mb1ZLZ3ZvUFVsUjNk?=
 =?utf-8?B?RlJLUEdSa1dkYjNIdVhCdnRhTWthR3hBa3RBTlU1YjdnVWRrTm9iRWEyVmNV?=
 =?utf-8?B?UHZUY2ltcUlUMThLQ0J4K1dheGJ2SFlkbFpuZlBXSXVITWpQdnEzeU51eXR4?=
 =?utf-8?B?Vzgzd1lacm5EMS9lRjdDMXBSckFLZjRkUG9lU3VFRzFRckNxK0xJME5rcmFo?=
 =?utf-8?B?K0hhMHhNSG9WTnRhT0VDVUUyOG1ESFpmUitUTlNZeDFqeXd5V09NVnd1a0F4?=
 =?utf-8?B?Uk1GMkVrcVlpelA1UTVMSDgxaitvWkowUE1tT3QwRVdxT0picjg0dDZjOUYv?=
 =?utf-8?B?UTZJQjJJT3JCekJEVklEMkx0NDRiVk1XVTcyVnFOMG1ORzRzeExwM05MRGdS?=
 =?utf-8?B?aTZyd3hXeXlSTEJDL3VmdWoyK3F6U3pXVXZFSHh3clhGZkhLMFVSdHBFbDk2?=
 =?utf-8?B?TW85SGtBNEplTlYzcHZWeThGVHpsK3IrZk4zSUhVQ0dPN1VWdDNFZEUvSHlt?=
 =?utf-8?B?eW1BY2dzTzBmMFI4d2JrMXRWZUIxamVhaUNlL2ZvcGVjMyt4ZlB4ZFJRdnVT?=
 =?utf-8?B?L3BIbUFFZnpSQUk1V3VRS2h5TmFPcjE1Wnk4SzFBc2lYMXRGbDNlTVhMNVN3?=
 =?utf-8?B?SUcvVXI0akU0UjkvOEk0OUN4QjQxbzQ3cVAwNjFyT0tWclNjS2lxMUNqaXpq?=
 =?utf-8?B?UWl1cG8wRUxwWlNYR3dYZ0hheXhvdzdnQ2lwU25HcGd6ZjIreGUwNVVXV0J5?=
 =?utf-8?B?Tm9CYU1jbUJVZEZuQU5vM3FteFdrR0pMNjdnYjRIWUpCOTN5VHcwdmMweW5n?=
 =?utf-8?B?QzlTNk5NQ0pmRnhOT1lrK0pBeVlyelZqYzFOS1FUZ0JZWUZuQmE2dFdHbm9q?=
 =?utf-8?B?NVp0Y21BVnNNNWYzb2V6RmxjL2h4eXJwTnpSbVllVzVESmdrNXI1U0dzN3dp?=
 =?utf-8?B?RS95Ly91ZVgwR1VpQ0ZNb1FLbmRwbWJCT1JMQmFhSC8xR3lxUjh0bklaZ1lJ?=
 =?utf-8?B?ZWN0Sk1TRzBDM3B4dHJzRWlKWDhqY3F2Y0FUZndUc1IvaHpjTnlCWEV2RzlI?=
 =?utf-8?B?bWJnMFZiWEFicXpYQkpONFByRjN4QU0zdjBRVkRiS2Z6YjNNVmFOTFlraWU1?=
 =?utf-8?B?aFFFQmUxbUdoLzVNNXdpY2xlODEzNXV6VjBWSFA0S0Q0MGcyQUw1MVdkNnJL?=
 =?utf-8?B?WVI0Q0NTRDlGSk9QeTNxSjJGN0RaWEUvU1NBdllTakphdEpOQlpaODgyRkg0?=
 =?utf-8?B?Q2FjSVZMb0tIZjRGb0x2d0Y3dFdkWnlJVHo2dXBiQnVBTmttVnU1WEh1c0Fx?=
 =?utf-8?B?QzhxR3crcjZYeW4rUU1ET3VmNi91VENyaWhVLzk5TzFUY2xDVFV6VzBVa2U0?=
 =?utf-8?B?ZU9yVHBidzVlM0twamQ1dHJnT1h3M3NmRGM4MHFJMHV3UVhrVkdjN256ZGFK?=
 =?utf-8?B?YmVoU3hEdXZQTWszNUdhanZ5cE15K2UvSkEyZ29qREE5ekVSa1J5amhMQ2w1?=
 =?utf-8?B?aGRsM2tQcmNYN1pzdytLazNkSk5LWUJ4ZTJBOUFsLzRKalFGQ05aYkJLQkYz?=
 =?utf-8?B?d1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73ccb6a2-058c-4928-9ff0-08dd8bf1042e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 16:22:23.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFFsLq1bbcUv30t7TBnWU/CEIBZK8Z1ESHJUrf/gjqB6bHlX8c5121pcahtEra0A75oIL1xazCUMyp9+Z8Y9N5Vjmn+IghEUtOA/a2XiY+k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8700
X-OriginatorOrg: intel.com

Hi Babu,

On 5/2/25 5:53 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> Thanks for quick turnaround.
> 
> On 5/2/2025 4:20 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/21/25 3:43 PM, Babu Moger wrote:
>>> # Linux Implementation
>>>
>>> Feature adds following interface files when the resctrl "io_alloc" feature is
>>> supported on L3 resource:
>>>
>>> /sys/fs/resctrl/info/L3/io_alloc: Report the feature status. Enable/disable the
>>>                   feature by writing to the interface.
>>>
>>> /sys/fs/resctrl/info/L3/io_alloc_cbm:  List the Capacity Bit Masks (CBMs) available
>>>                        for I/O devices when io_alloc feature is enabled.
>>>                        Configure the CBM by writing to the interface.
>>>
>>> # Examples:
>>>
>>> a. Check if io_alloc feature is available
>>>     #mount -t resctrl resctrl /sys/fs/resctrl/
>>>
>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>     disabled
>>>
>>> b. Enable the io_alloc feature.
>>>
>>>     # echo 1 > /sys/fs/resctrl/info/L3/io_alloc
>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>     enabled
>>>
>>> c. Check the CBM values for the io_alloc feature.
>>>
>>>     # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>     L3:0=ffff;1=ffff
>>>
>>> d. Change the CBM value for the domain 1:
>>>     # echo L3:1=FF > /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>
>>>     # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>>>     L3:0=ffff;1=00ff
>>>
>>> d. Disable io_alloc feature and exit.
>>>
>>>     # echo 0 > /sys/fs/resctrl/info/L3/io_alloc
>>>     # cat /sys/fs/resctrl/info/L3/io_alloc
>>>     disabled
>>>
>>>     #umount /sys/fs/resctrl/
>>>
>>
>>> From what I can tell the interface when CDP is enabled will look
>> as follows:
>>
>>       # mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>       disabled
>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>       not supported
>>   "io_alloc" can thus be enabled for L3CODE but not for L3DATA.
>> This is unexpected considering the feature is called
>> "L3 Smart *Data* Cache Injection Allocation Enforcement".
>>
>> I understand that the interface evolved into this because the
>> "code" allocation of CDP uses the CLOSID required by SDCIAE but I think
>> leaking implementation details like this to the user interface can
>> cause confusion.
>>
>> Since there is no distinction between code and data in these
>> IO allocations, what do you think of connecting the io_alloc and
>> io_alloc_cbm files within L3CODE and L3DATA so that the user can
>> read/write from either with a read showing the same data and
>> user able to write to either? For example,
>>
>>       # mount -o cdp -t resctrl resctrl /sys/fs/resctrl/
>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>       disabled
>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>       disabled
>>     # echo 1 > /sys/fs/resctrl/info/L3CODE/io_alloc
>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc
>>       enabled
>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc
>>       enabled
>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>       0=ffff;1=ffff
>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>>       0=ffff;1=ffff
>>       # echo 1=FF > /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>       # cat /sys/fs/resctrl/info/L3DATA/io_alloc_cbm
>>       0=ffff;1=00ff
>>       # cat /sys/fs/resctrl/info/L3CODE/io_alloc_cbm
>>       0=ffff;1=00ff
> 
> I agree. There is no right or wrong here. It can be done this way like you mentioned above. But I am not sure if will clear the confusion.
> 
> We have already added the text in user doc (also spec says the same).
> 
> "On AMD systems, the io_alloc feature is supported by the L3 Smart
> Data Cache Injection Allocation Enforcement (SDCIAE). The CLOSID for
> io_alloc is determined by the highest CLOSID supported by the resource.
> When CDP is enabled, io_alloc routes I/O traffic using the highest
> CLOSID allocated for the instruction cache (L3CODE).
> 
> Dont you think this text might clear the confusion? We can add examples also if that makes it even more clear.

The user interface is not intended to be a mirror of the hardware interface.
If it was, doing so is becoming increasingly difficult with multiple
architectures with different hardware intefaces needing to use the same
user interface for control. Remember, there are no "CLOSID" in MPAM and
I do not know details of what RISC-V brings.

We should aim to have something as generic as possible that makes sense
for user space. All the hardware interface details should be hidden as much
as possible from user interface. When we expose the hardware interface details
it becomes very difficult to support new use cases.

The only aspect of "closids" that has been exposed to user space thus far
is the "num_closids" and in user documentation a CLOSid has been linked to the
number of control groups. That is the only constraint we need to think about
here. I have repeatedly asked for IO alloc connection with CLOSIDs to not be exposed
to user space (yet user documentation and messages to user space keeps doing so
in this series). Support for IO alloc in this way is unique to AMD. We do not want
resctrl to be constrained like this if another architecture needs to support
some form of IO alloc and does so in a different way.

I understand that IO alloc backed by CLOSID is forming part of resctrl fs in this
implementation and that is ok for now. As long as we do not leak this to user space
it gives use flexibility to change resctrl fs when/if we learn different architecture
needs later.

>>   (Note in above I removed the resource name from io_alloc_cbm to match
>> what was discussed during previous version:
>> https://lore.kernel.org/lkml/251c8fe1-603f-4993-a822-afb35b49cdfa@amd.com/ )
>> What do you think?
> 
> Yes. I remember. "Kept the resource name while printing the CBM for io_alloc, so we dont have to change show_doms() just for this feature and it is consistant across all the schemata display.

It almost sounds like you do not want to implement something because the
code to support it does not exist?

> 
> I added the note in here.
> https://lore.kernel.org/lkml/784fbc61e02e9a834473c3476ee196ef6a44e338.1745275431.git.babu.moger@amd.com/

You mention "I dont have to change show_doms() just for this feature and it is
consistant across all the schemata display." 
I am indeed seeing a pattern where one goal is to add changes by changing minimum
amount of code. Please let this not be a goal but instead make it a goal to integrate
changes into resctrl appropriately, not just pasted on top.

When it comes to the schemata display then it makes sense to add the resource name since
the schemata file is within a resource group containing multiple resources and the schemata
file thus needs to identify resources. Compare this to, for example, the "bit_usage" file
that is unique to a resource and thus no need to identify the resource.

> 
> I will change it if you feel strongly about it. We will have to change show_doms() to handle this.

What is the problem with changing show_doms()?

> 
>>
>>  
>>> ---
>>> v4: The "io_alloc" interface will report "enabled/disabled/not supported"
>>>      instead of 0 or 1..
>>>
>>>      Updated resctrl_io_alloc_closid_get() to verify the max closid availability
>>>      using closids_supported().
>>>
>>>      Updated the documentation for "shareable_bits" and "bit_usage".
>>>
>>>      NOTE: io_alloc is about specific CLOS. rdt_bit_usage_show() is not designed
>>>      handle bit_usage for specific CLOS. Its about overall system. So, we cannot
>>>      really tell the user which CLOS is shared across both hardware and software.
>>
>> "bit_usage" is not about CLOS but how the resource is used. Per the doc:
>>
>> "bit_usage":
>>         Annotated capacity bitmasks showing how all
>>         instances of the resource are used.
>>
>> The key here is the CBM, not CLOS. For each bit in the *CBM* "bit_usage" shows
>> how that portion of the cache is used with the legend documented in
>> Documentation/arch/x86/resctrl.rst.
>>
>> Consider a system with the following allocations:
>> # cat /sys/fs/resctrl/schemata
>> L3:0=0ff0
> 
> This is CLOS 0.
> 
>> # cat /sys/fs/resctrl/info/L3/io_alloc_cbm
>> 0=ff00
> 
> This is CLOS 15.
> 
>>
>> Then "bit_usage" will look like:
>>
>> # cat /sys/fs/resctrl/info/L3/bit_usage
>> 0=HHHHXXXXSSSS0000
> 
> It is confusing here. To make it clear we may have to print all the CLOSes in each domain.

Could you please elaborate how this is confusing?

> 
> # cat /sys/fs/resctrl/info/L3/bit_usage
> DOM0=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000;
> DOM1=CLOS0:SSSSSSSSSSSSSSSS;... ;CLOS15=HHHHXXXXSSSS0000

Please no. Not just does this change existing user interface it also breaks the goal of
"bit_usage".

Please think of it from user perspective. If user wants to know, for example, "how is my
L3 cache allocated" then the "bit_usage" file provides that summary. 

>> "bit_usage" shows how the cache is being used. It shows that the portion of cache represented
>> by first four bits of CBM is unused, portion of cache represented by bits 4 to 7 of CBM is
>> only used by software, portion of cache represented by bits 8 to 11 of CBM is shared between
>> software and hardware, portion of cache represented by bits 12 to 15 is only used by hardware.
>>
>>>      This is something we need to discuss.
>>
>> Looking at implementation in patch #5 the "io_alloc_cbm" bits of CBM are presented
>> as software bits, since "io_alloc_cbm" represents IO from devices it should be "hardware" bits
>> (hw_shareable), no?
>>
> Yes. It is. But logic is bit different there.
> 
> It loops thru all the CLOSes on the domain. So, it will print again like this below.

This is what current code does, but the code can be changed, no? For example, rdt_bit_usage_show()
does not need to treat the IO allocation like all the other resource groups but instead handle it
separately. Below us some pseudo code that presents the idea, untested, not compiled.

	hw_shareable = r->cache.shareable_bits;

	for (i = 0; i < closids_supported(); i++) {
		if (!closid_allocated(i) || 
		    (resctrl_arch_get_io_alloc_enabled(r) && i == resctrl_io_alloc_closid_get(r, s)))
			continue;

		/*  Intitialize sw_shareable and exclusive */
	}

	if (resctrl_arch_get_io_alloc_enabled(r)) {
		 /*
		  * Sidenote: I do not think schemata parameter is needed for
		  * resctrl_io_alloc_closid_get()
		  */
		io_alloc_closid = resctrl_io_alloc_closid_get(r, s);
		if (resctrl_arch_get_cdp_enabled(r->rid))
			ctrl_val = resctrl_arch_get_config(r, dom, io_alloc_closid, CDP_CODE);
		else
			ctrl_val = resctrl_arch_get_config(r, dom, io_alloc_closid, CDP_NONE);
		hw_shareable |= ctrl_val;
	}

	for (i = r->cache.cbm_len - 1; i >= 0; i--) {
		/* Write annotated bitmask to user space */
	}
	
> 
> #cat bit_usage
> 0=HHHHXXXXSSSS0000
> 
> It tells the user that all the CLOSes in domain 0 has this sharing propery which is not correct.
> 
> To make it clear we really need to print every CLOS here. What do you think?

No. We cannot just change user space API like this. The way I see it the implementation can
support existing user space API. I am sure the above can be improved but it presents an idea
that we can use to start with.

Reinette

