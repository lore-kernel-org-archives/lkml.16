Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9D72FA65C;
	Wed, 25 Jun 2025 23:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893841; cv=fail; b=c6MgGsJkaije1se8/octwvG1EwgY4sQpLPY2ORwtUS5VlpnSt1MxqJUlk0sdIX39M3Jb6+zcZ0dO9nvvczVd97L+6Hf77QAGbiklArImMMsD3Va1XuhbJoPXf0BU6C+5jVAC5dCqEKgzCy6b1HdQylKZwXNNgno5uHqfn36KDG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893841; c=relaxed/simple;
	bh=AIsn5ZSQ4n0fYykdstKQSC7lZeP9z6rGmnQ2gVWnvkE=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ll7uFAdfwHj61rtxymlFUpcCYV7J6jWjD0ueh+Vr0enSxnzy1qyNvpBPcFwBVOAZOv4yUhBW8xJxkIblF3vDmLbtNWcIC5yPOu3lNmsGb9OzosdTIWXVF3OViMtgdW5EWBcIqDR6kKceX5VAi/+ST8u493F9eWZXzURH897alOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M21Q1CDc; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M21Q1CDc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750893840; x=1782429840;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AIsn5ZSQ4n0fYykdstKQSC7lZeP9z6rGmnQ2gVWnvkE=;
  b=M21Q1CDcRxuD3llkslPVk8o5n7JPr/K8mIOymAM1foatKcCvJrp58SSD
   wk9XSYRz5KFPwCgG4nhy4RJnWXSRqUiAZqz9bEH9ESMUTsTJLQXh0Ui3f
   wbQKaxqeWXkw8X2HTRrqsz9yiC+5HweCEbFAOBKaHGqVleWUA86d6wyNs
   l6XgWQ9RWMeKsHxbvh9T0YvEEZjQtOcDCW/7a9+0bXTqmVmxxayDiQJIa
   yKYfnuLHaMTPUQFoH2OCVCmbhRx3/1BZ/dM6OMYICD+m3dZlxk5qN1BqZ
   YtMBN+/iI0EWneruQvJ8IYZEpfdwIxjKLh6W7WkdyRr7HX4NJEsqx1Pk0
   A==;
X-CSE-ConnectionGUID: TfqVSBuOSO6mXYg0ijFNrA==
X-CSE-MsgGUID: tDYucP2NSZmuWm7/m9dqaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="55805954"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="55805954"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:23:59 -0700
X-CSE-ConnectionGUID: g/gU4KZ+SfG7MksUTGJv+Q==
X-CSE-MsgGUID: GJ6l4gNBRFOT/WYHcwGuTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="157850148"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:23:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:23:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:23:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:23:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OE/aqnc/fvzugdP2j6kbwDtq/Ca0ouFzOn4PiycJ4eK0fyRY+37xFBnNGipo6ac8zxOckHcMp/d8u09nDpiLcxq95WD0Bp7KNquHskIJfWOzyPN/GLt+NedKqx3XeBEy1ztKkBxSXtxtTtGwOqBoyRcvWtCUmCBM3x1+EGBUNSuGOED+jcA2e8YiPRbztVi3zf9bGgtpYahR73touJw9r4WZW+WWQqFekYElm5YU6ZO+0VmOZrezETTqILOZon/enHmijOq4TF/z6kNfQtVjjNUwjuPvbj2gjBR5CTWD+aHfuUQiAiazK5zpCeh9+DuVwW36fDkhgBNZmLX//hcRSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNByRwYUNBjYYpaaRK5RHBJqzxXhkRbrX16VVu5+ghI=;
 b=qs5Y68UY2ehCCWnTneHfw/n3IskofLOqKOi9rcOjIuqZucU7a17wzrj9XxXS/Vb/xlxXyGEGZ81mDKQ2pHOhaBr53W0Ks//E1ZsW3ZKmdUXvYqEBw8ZBqYT9JBTktq6yN8WM8EYNYXwqXJ/0djfdY//xCmwytcMIQaHuJkr8RtIfZUY2OVpAQQLEba2oMPZHc/Gw+BWQkSS17Wh6ieYwJbbfgbWV+Na0jGkF55NpxsorEpxGsXGXsl/Nbl7BRO8orTJ4X9rravlP37gyOxkdvl+RfpjKpvpAlhIAeFMagxR32AUebepGkPguDq9eGm42DpfQeW6c+rKsX5RzpENplg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM6PR11MB4529.namprd11.prod.outlook.com (2603:10b6:5:2ae::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 23:23:54 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Wed, 25 Jun 2025
 23:23:54 +0000
Message-ID: <d0123331-49e0-4948-991d-ea908785bff7@intel.com>
Date: Wed, 25 Jun 2025 16:23:51 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 24/32] fs/resctrl: Add event configuration directory
 under info/L3_MON/
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
 <612428100e6f4529294c3fead6850aaac303d82a.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <612428100e6f4529294c3fead6850aaac303d82a.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW2PR16CA0047.namprd16.prod.outlook.com
 (2603:10b6:907:1::24) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM6PR11MB4529:EE_
X-MS-Office365-Filtering-Correlation-Id: ed980d48-bbce-4aca-bebc-08ddb43f59e8
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NW0wNUt4elVpYW15U2hQeTMyN0tTQkxoTmUzYTBPWE5FNk9RdjhzTHJpeEhK?=
 =?utf-8?B?a3o0TzNSMmJDclVkYkhqTlpUdCtHNjBpdm13VnlDWlpnRElaVFRxOFpMV1pw?=
 =?utf-8?B?Rk80NE9Ra0syN25MOVdkZHE1Y0E4TzM2cGhERTJoUHBBLzNnazljSXhITE5C?=
 =?utf-8?B?cTg3NXRGbXIwK21BL21TYkJnaTVhR1RmTGxTYS9DcEJYUmpBdnVxSWZIRTJ3?=
 =?utf-8?B?SHdJSEtoc2pKOXhGY2hOTGpjNzROdnM4K1E2WTduaTlVeWwwMkthQnFZSy9L?=
 =?utf-8?B?WlBhUkgrNlZKc1UyWTFpU1MzbzROWDgwMEVOSFFrenA5aW81YU4zRVVuZTVN?=
 =?utf-8?B?QUVYeDV6VDZiV1hjQm5vUDNnSEEycEdYSDB3Kzh6SHB4blNHRUF2YzY2RFFT?=
 =?utf-8?B?Z253Z3Y4VTZ5Y0JtR1pDQjRuQzhSRDJ1Q0x4emgvVytxbXZmcjExUVhqU3k2?=
 =?utf-8?B?TmpVQkNOYjl4anhYOHRQd0dNYmtTNjVYL0VHRDR0WHlQSFFZbEJNeHBLVVFo?=
 =?utf-8?B?RS9kQzVicVJKd3JJV3NVelYzK2s5VUJIZjlJZGNxVURObWlsMXVCQjFDYlJ4?=
 =?utf-8?B?L05weHVNZ2p4THhBb3FuUVhQaWEvQUlLZWhwdTZZMzFzNFNDemdkQnA5WGJB?=
 =?utf-8?B?ZDJTQzRCSkFMajJ2WGkxeUJCVkhZOHJ5WjNRQndQSnpDSjY5amp1QXl1VCtF?=
 =?utf-8?B?K2hkWnpaVVJraHhIbXlKRDQveVFxcnpJaDFJeU44REZVOCtkRVF6UVBsc0h4?=
 =?utf-8?B?ZTNsdWxnSnRhRlQxY2ZLUkZZaVhWSGt0S0orYnArUkI3eC8rVUpnOHBqM2Vw?=
 =?utf-8?B?UXo0T2VvV0QzS2NBVTM5a3ZZb3JQeEIxckVDV1R1bExUVTcwRnJObWRURHNJ?=
 =?utf-8?B?RmkyM2dvUCtDS0M3VFdnSGtUQnI4OG56SjFyVzdHdXMwUlNwK2Njd2RBekN3?=
 =?utf-8?B?eXNNaURxNitnMnFjc2IyRWwrbW53azJ6T2FZODFPZk9uMEZOOE5JREpRZE9N?=
 =?utf-8?B?VndJR0N1YUN2NjNadTJnT0I3ZDFNd2U2R2JmWVgyTHBVclhTWGozVTlVbmNl?=
 =?utf-8?B?ekRJMTJvZDAycWZPcFVoUlBsbG5BS2N6TFdnN0R6NGdXLzNRV0NFaXZzaytM?=
 =?utf-8?B?VVh6UldTUDF4MFdRbEJQQWt4L21oaTFtUkZ6aU1LWmlReFQrMDVrb0dlMVg4?=
 =?utf-8?B?RHVFdE5Fc3VDVHoxTlRjakcxbDYyR0crdEpRQi80S2hoWm1EajN6emREVENa?=
 =?utf-8?B?cGx6NFhaYmUrWFFSWVlEU1FWVDU1ekkweXk5WWIvdVkzTWJaTVh1VFZTeW1k?=
 =?utf-8?B?NjZqdmRoaUpoNXYvS0RmcFFXV3FxRTZiNkdGUU9sRjBSNmd5enpzU0Y3UXAz?=
 =?utf-8?B?am9uZkVwaVFrNk5teVJyNnZUeEVPTWpzNHd5WkFwK2tBY2gzalBIVHlDNmNC?=
 =?utf-8?B?bWtNb0dMMnJvTXR2dG81ZnNuSWswSnRJS3Z6SG5pZjdnL2d3ZUVWRjNQUDQ1?=
 =?utf-8?B?bkFFaXI2Q3dtcEltUENLNnhPOGZpWDBhNHlTU2FUZGdsYXVIZ1NBajNGSDhw?=
 =?utf-8?B?emdWazBtSk5QQnhCZjcxYmlIODhycWpLdno4a0s0UXo3Zng0a1NPMEpQUWFq?=
 =?utf-8?B?N0ZBM0lvczR1aE0vd1B2M2dmZzNSaElNVEZTZFFOQU1maCthWnBYMlpvYnZ2?=
 =?utf-8?B?cjN2KzZpSWlVcEIzUlZ0R1RLR2o3SnNUaXljZ0JtS0NMalBLMi9CVThqNkhk?=
 =?utf-8?B?UjlXQnRYOVNjMWkyU01VaDJseDloRVdyRDFmanVKWWJKdllrcHJYd3ZGYmJT?=
 =?utf-8?B?dS9iRUUxbVErb3A5aDhZeStwUytweWR6dDZvUjJDZVQ2Z2psV3dsd3lCeGJK?=
 =?utf-8?B?bXozNnpYQlozQmhTR3VITDhqb0FoNEJraHorQ0gxMHVvdUw0YVlnc1VGT1dT?=
 =?utf-8?Q?AYS8jpmh+/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUJCRENNYWZqbFgrZU5XU0tDamxRb1FaOHk4Vkk1UWRmYU55SWE4c0VQWnFa?=
 =?utf-8?B?KzM3MHg5SXo5M2R0ZVE1YXZCZ0tOQ0hDZExUdWVjRXQwYTBRL2h4VytnZ05x?=
 =?utf-8?B?eXIwc0pqaVk3UnoxQ1pNYXd2b25DamM2aURlM1NkbXJwMG1EcUpQb3E4bHg0?=
 =?utf-8?B?YW16MkxKSFQrWGFhTzk2ZDJZMlZDQ1ZpdEFpOFdDVUw0aU1rREJVUjU3b205?=
 =?utf-8?B?UDBLaTZMR0g1QWtQL1l1bTZiMGYvRy8wbzNMeHdUVko1c1lTbXB5Z2ZBa0xh?=
 =?utf-8?B?QlJGbnBscldrRUZhcWJXUjc2YnYvZUNKSkxSdHcwZktNRG9vMHMxNnM3b0ty?=
 =?utf-8?B?NFBRbjVQcXJQYU5TemNIc3hEVmMvenNoZ3VjMjhBa2NzREwzSFQrdVlrZWJv?=
 =?utf-8?B?L2JGdlQxQXFiTk9nbEttRysyaWg3MGNGU2traTllWDdWTzVZSHdaMTE5ZHFM?=
 =?utf-8?B?SUF2RWxVWlNHY3FKRFNGUENTUEsxREZZaVR2cXdic2JKa0RyWHFNTnhkVlAv?=
 =?utf-8?B?YmszbTdseW45S09qeENzU2ZGT1dacXJnVVNwa0xTQjFKekhIS1laejBHRU1Q?=
 =?utf-8?B?VDg2QnFhakhCcmF3eE5VWFVpdEhUcWlmZHJ1UC8rakQzcnJnZ0JPWGsyNzQ2?=
 =?utf-8?B?RzBCVDl2eXMvdGRzMUZIc0hjTjUrV05TOHovRnZ4dVgwbWYzODF5ZTdBcGdw?=
 =?utf-8?B?ODB1bUhCWmRubk9KcUR5SjZMSzdFbnFlbHdsSnh1cW5GTzBZOEcwdnhwSzRF?=
 =?utf-8?B?cHFXSjM0UWUzSC9vVlI3ZHFzN2M1cGZOZHNKbVgycjJQMUp1U1FMOXlHNFVh?=
 =?utf-8?B?c2o3OTFSK2NucjRMWFZ0aHlMZyt4Vk45MjhmNEgvNm5rOVVldmNZdmxjUVJB?=
 =?utf-8?B?aVpwNlVBb2UydWNuZTdKa05hV2dzbTdxdHpVakx3VmdOQ2N0QXRQYmtkcy9n?=
 =?utf-8?B?QmMxc010Mnd3RXVKSFpJQmtSdHE1RGpmKzh3ZHJLdWRFenp3ZlBONk5oRWlR?=
 =?utf-8?B?bzZQcnRSVlZWRDlqSVZhU3E0US9BRVlTUkZabG83aVczemRodG9JdnhITW0z?=
 =?utf-8?B?bkVhOFZzbmlkQThmRzU4SnROV0MzUmlNKzZCT3BSL21HUklBWkhUSStiQUZr?=
 =?utf-8?B?QTQ2MUZjbkNmQXZmcmt0cFVQbXBSUG1CUlhJK0JiTnFMa05XZkYyVmlsb1dp?=
 =?utf-8?B?M1hEMjhxYzBXQ0dXa0pjOE1LS3kzOXhlM3JKaUt0RTdNc3lqbldxMWxieUUy?=
 =?utf-8?B?dTZCMktXUWp2SmxMcmJlcER0RUwvNWtBaDl6OUtDVktDMTZpY3JkUEJod2RL?=
 =?utf-8?B?MkRqeDBYdUo1V0Ryc3FPa3hrbGpHRDJEbVRScEZKVTRkcEg3elk4REJ0ODY5?=
 =?utf-8?B?VGdSc09GSnFsWHpXVEFKTHRUbzVveFBqRUNUUnpTQjBISWd3eWRBbkNCQmNG?=
 =?utf-8?B?NkZwd0FFUjRvNW42dG5JaHA3WEczUllXb0o0M3BGaXZsQ1JrSnJjVHlEUWs0?=
 =?utf-8?B?cC9JaEhFcy95VWhKaHpVUVV5VGtvUnVoaVJDc2FZRVlLWUhreFZWazF5NGdK?=
 =?utf-8?B?Y2dxdmhsSEtZT2w1LzFaSnhLak0xazBBRzVWOThBWjhPRFRRNEJRakdQWmMw?=
 =?utf-8?B?aEwyTEhnTlZtbUhCbE5RRlZvRTJVbXlOTWh2bzdVV0VwdDRINlZzYWphTzR0?=
 =?utf-8?B?clpaa2lWOE15bDhpQWNBVTVSM2tST1RxZFVKZzR5cHA1L2krNUN0ZnF5MDBw?=
 =?utf-8?B?WWZ4Uys3bFJ0blJRTmVQNStHbGVvczBTUXBpU1FrOEl0NW9WcHZJQ2JlRDZV?=
 =?utf-8?B?dXZKelVXY1JISTFINHVESXgwK1BDLzdpejg5a1RTOFZPa2h2djE0enFGYnpa?=
 =?utf-8?B?aTRIcUFaRUF0aTdNa0VVeDF5NTV2emh4Z0hrcW1sL2VCcGRnanMxZVZ6ekg0?=
 =?utf-8?B?Vkl6NjkvbEtrQUNZcGtXVDFod1d1eFc2YVVwYmdtbFQyWnNWWUp4SFl1MDQ0?=
 =?utf-8?B?dGN5N2tkMXpHaFJLRHZsZm1BYWRRMFZHTDhlalA3c3NncjhMNTNQWmRqWjRE?=
 =?utf-8?B?Znpjem9qYzBiMWxyek4xNy9QaFp6RjJ2UWlmNVZIQU9wYWVZQWIrMjlGR2E2?=
 =?utf-8?B?bmFGSXVFcVJzZDVvVzA2REUwa1NWY2hoSXptYzFrRDdyZStjamJENUhjaGIw?=
 =?utf-8?B?RWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed980d48-bbce-4aca-bebc-08ddb43f59e8
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 23:23:54.2021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHOqoBQ1z4sH1QzpLA8cXp7A9uGf64BcES9Hm8A+WwH53442jP9VXb4Wje9iCNwtz/oAN34mO+FhKvHCn36QKaUHRnrlkKvIZAC8jlDUTug=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4529
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:05 PM, Babu Moger wrote:
> When assignable counters are supported the
> /sys/fs/resctrl/info/L3_MON/event_configs directory contains a
> sub-directory for each MBM event that can be assigned to a counter.
> The MBM event sub-directory contains a file named "event_filter" that
> is used to view and modify which memory transactions the MBM event is
> configured with.
> 
> Create the /sys/fs/resctrl/info/L3_MON/event_configs directory on resctrl
> mount and pre-populate it with directories for the two existing MBM events:
> mbm_total_bytes and mbm_local_bytes. Create the "event_filter" file within
> each MBM event directory with the needed *show() that displays the memory
> transactions with which the MBM event is configured.
> 
> Example:
> $ mount -t resctrl resctrl /sys/fs/resctrl
> $ cd /sys/fs/resctrl/
> $ cat info/L3_MON/event_configs/mbm_total_bytes/event_filter
>   local_reads, remote_reads, local_non_temporal_writes,
>   remote_non_temporal_writes, local_reads_slow_memory,
>   remote_reads_slow_memory, dirty_victim_writes_all
> 
> $ cat info/L3_MON/event_configs/mbm_local_bytes/event_filter
>   local_reads, local_non_temporal_writes, local_reads_slow_memory

Please let these examples match what the patch does wrt spacing.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

...

> ---
>  Documentation/filesystems/resctrl.rst | 32 +++++++++++
>  fs/resctrl/internal.h                 |  2 +
>  fs/resctrl/monitor.c                  |  1 +
>  fs/resctrl/rdtgroup.c                 | 78 +++++++++++++++++++++++++++
>  4 files changed, 113 insertions(+)
> 
> diff --git a/Documentation/filesystems/resctrl.rst b/Documentation/filesystems/resctrl.rst
> index 18de335e1ff8..b1db1a53db2a 100644
> --- a/Documentation/filesystems/resctrl.rst
> +++ b/Documentation/filesystems/resctrl.rst
> @@ -310,6 +310,38 @@ with the following files:
>  	  # cat /sys/fs/resctrl/info/L3_MON/available_mbm_cntrs
>  	  0=30;1=30
>  
> +"event_configs":
> +	Directory that exists when "mbm_event" mode is supported. Contains

""mbm_event" mode" -> ""mbm_event" counter assignment mode"

> +	sub-directory for each MBM event that can be assigned to a counter.
> +
> +	Two MBM events are supported by default: mbm_local_bytes and mbm_total_bytes.
> +	Each MBM event's sub-directory contains a file named "event_filter" that is
> +	used to view and modify which memory transactions the MBM event is configured
> +	with.
> +
> +	List of memory transaction types supported:
> +
> +	==========================  ========================================================
> +	Name			    Description
> +	==========================  ========================================================
> +	dirty_victim_writes_all     Dirty Victims from the QOS domain to all types of memory
> +	remote_reads_slow_memory    Reads to slow memory in the non-local NUMA domain
> +	local_reads_slow_memory     Reads to slow memory in the local NUMA domain
> +	remote_non_temporal_writes  Non-temporal writes to non-local NUMA domain
> +	local_non_temporal_writes   Non-temporal writes to local NUMA domain
> +	remote_reads                Reads to memory in the non-local NUMA domain
> +	local_reads                 Reads to memory in the local NUMA domain
> +	==========================  ========================================================
> +
> +	For example::
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_total_bytes/event_filter
> +	  local_reads, remote_reads, local_non_temporal_writes, remote_non_temporal_writes,
> +	  local_reads_slow_memory, remote_reads_slow_memory, dirty_victim_writes_all
> +
> +	  # cat /sys/fs/resctrl/info/L3_MON/event_configs/mbm_local_bytes/event_filter
> +	  local_reads, local_non_temporal_writes, local_reads_slow_memory
> +

Please let these examples match what the patch does wrt spacing.

>  "max_threshold_occupancy":
>  		Read/write file provides the largest value (in
>  		bytes) at which a previously used LLC_occupancy
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 84a136194d9a..ed0e3b695ad5 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -248,6 +248,8 @@ struct mbm_config_value {
>  
>  #define RFTYPE_DEBUG			BIT(10)
>  
> +#define RFTYPE_ASSIGN_CONFIG		BIT(11)
> +
>  #define RFTYPE_CTRL_INFO		(RFTYPE_INFO | RFTYPE_CTRL)
>  
>  #define RFTYPE_MON_INFO			(RFTYPE_INFO | RFTYPE_MON)
> diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
> index ef6ef58f180b..09a49029a800 100644
> --- a/fs/resctrl/monitor.c
> +++ b/fs/resctrl/monitor.c
> @@ -956,6 +956,7 @@ int resctrl_mon_resource_init(void)
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
>  		resctrl_file_fflags_init("available_mbm_cntrs",
>  					 RFTYPE_MON_INFO | RFTYPE_RES_CACHE);
> +		resctrl_file_fflags_init("event_filter", RFTYPE_ASSIGN_CONFIG);
>  	}
>  
>  	return 0;
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 5fb6a9939e23..e2fa5e10c2dd 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -1909,6 +1909,25 @@ static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
>  	return ret;
>  }
>  
> +static int event_filter_show(struct kernfs_open_file *of, struct seq_file *seq, void *v)
> +{
> +	struct mon_evt *mevt = rdt_kn_parent_priv(of->kn);
> +	bool sep = false;
> +	int i;
> +
> +	for (i = 0; i < NUM_MBM_EVT_VALUES; i++) {
> +		if (mevt->evt_cfg & mbm_config_values[i].val) {
> +			if (sep)
> +				seq_putc(seq, ',');
> +			seq_printf(seq, "%s", mbm_config_values[i].name);

Taking a closer look I think we need to be more careful about how the
code is organized. Ideally the monitoring related code and data should
be located in fs/resctrl/monitor.c. Having event_filter_show() here is
ok because of its use in res_common_files[]. Since it is monitoring related
I expected its code/data to be in fs/resctrl/monitor.c, thus that
mbm_config_values[] (mbm_transactions[]?) to be in fs/resctrl/monitor.c,
(just like mon_event_all[]).

> +			sep = true;
> +		}
> +	}
> +	seq_putc(seq, '\n');
> +
> +	return 0;
> +}
> +
>  /* rdtgroup information files for one cache resource. */
>  static struct rftype res_common_files[] = {
>  	{
> @@ -2033,6 +2052,12 @@ static struct rftype res_common_files[] = {
>  		.seq_show	= mbm_local_bytes_config_show,
>  		.write		= mbm_local_bytes_config_write,
>  	},
> +	{
> +		.name		= "event_filter",
> +		.mode		= 0444,
> +		.kf_ops		= &rdtgroup_kf_single_ops,
> +		.seq_show	= event_filter_show,
> +	},
>  	{
>  		.name		= "mbm_assign_mode",
>  		.mode		= 0444,
> @@ -2315,6 +2340,53 @@ static int rdtgroup_mkdir_info_resdir(void *priv, char *name,
>  	return ret;
>  }
>  
> +static int resctrl_mkdir_counter_configs(struct rdt_resource *r, char *name)

This can now be named resctrl_mkdir_event_configs()?

Also, I cannot see where the struct rdt_resource parameter is used. It should not
be removed though, as mentioned earlier it should be used to ensure
to check the mon_evt::rid values so that only events associated with resource
are considered.

> +{
> +	struct kernfs_node *l3_mon_kn, *kn_subdir, *kn_subdir2;
> +	struct mon_evt *mevt;
> +	int ret;
> +
> +	l3_mon_kn = kernfs_find_and_get(kn_info, name);
> +	if (!l3_mon_kn)
> +		return -ENOENT;

Needing to figure out this kn does not seem necessary. Can it not be
provided via parameter instead?

For example, resctrl_mkdir_counter_configs() (rather resctrl_mkdir_event_configs())
can be called from rdtgroup_mkdir_info_resdir(). I understand rdtgroup_mkdir_info_resdir()
is also called for  struct resctrl_schema parameter but I think the fflags can be used
to make the right decision. Something like:

	rdtgroup_mkdir_info_resdir() {
		struct rdt_resource *r;

		...
		if (fflags & RFTYPE_MON_INFO) {
			r = priv;
			if (r->mon.mbm_cntr_assignable) {
				ret = resctrl_mkdir_event_configs(kn_subdir, r);
				...
			}
		}
	}

What do you think?		    

> +
> +	kn_subdir = kernfs_create_dir(l3_mon_kn, "event_configs", l3_mon_kn->mode, NULL);
> +	if (IS_ERR(kn_subdir)) {
> +		kernfs_put(l3_mon_kn);
> +		return PTR_ERR(kn_subdir);
> +	}
> +
> +	ret = rdtgroup_kn_set_ugid(kn_subdir);
> +	if (ret) {
> +		kernfs_put(l3_mon_kn);
> +		return ret;
> +	}
> +
> +	for (mevt = &mon_event_all[0]; mevt < &mon_event_all[QOS_NUM_EVENTS]; mevt++) {

Here is a spot where the for_each_mon_event() should be used.

> +		if (!mevt->enabled || !resctrl_is_mbm_event(mevt->evtid))
> +			continue;
> +
> +		kn_subdir2 = kernfs_create_dir(kn_subdir, mevt->name, kn_subdir->mode, mevt);
> +		if (IS_ERR(kn_subdir2)) {
> +			ret = PTR_ERR(kn_subdir2);
> +			goto out_config;
> +		}
> +
> +		ret = rdtgroup_kn_set_ugid(kn_subdir2);
> +		if (ret)
> +			goto out_config;
> +
> +		ret = rdtgroup_add_files(kn_subdir2, RFTYPE_ASSIGN_CONFIG);
> +		if (!ret)
> +			kernfs_activate(kn_subdir);
> +	}
> +
> +out_config:
> +	kernfs_put(l3_mon_kn);
> +
> +	return ret;
> +}
> +
>  static unsigned long fflags_from_resource(struct rdt_resource *r)
>  {
>  	switch (r->rid) {
> @@ -2361,6 +2433,12 @@ static int rdtgroup_create_info_dir(struct kernfs_node *parent_kn)
>  		ret = rdtgroup_mkdir_info_resdir(r, name, fflags);
>  		if (ret)
>  			goto out_destroy;
> +
> +		if (r->mon.mbm_cntr_assignable) {
> +			ret = resctrl_mkdir_counter_configs(r, name);
> +			if (ret)
> +				goto out_destroy;
> +		}
>  	}
>  
>  	ret = rdtgroup_kn_set_ugid(kn_info);


Reinette
