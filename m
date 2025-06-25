Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DBA1267F4C;
	Wed, 25 Jun 2025 20:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750882395; cv=fail; b=ClAmDP2ctZN1YpYJQ0ulDz+B7u/wgJXAARub5M/rOiXSKdUEH+CsNQfqhV5zuSIGM0tqL13XWjyUpS7jHDR4woDCJGXi3D/gQyHWUPkljcHHeW3KZmso1tbJGJQlUjzwebzl9qwpToj+k8fILwMxUdv6ysz1ofS8fFSd2cKhjcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750882395; c=relaxed/simple;
	bh=qSIssHa1a3keZ5YbpBT76oZOqXhmc7eIRvLVhcFfMnc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=qoxna4G4EH0jptQOLzLdBi7ZyIrsLsFT7+zmLYnPladVmEEfKQegw19vxlQT4m2PNLei8sYXzQ5FP14b/WCtPG+uZSvD5HYI3H9fbzl08rCEiuVe57udLqvBJJUUZluQSUtjMzVIsw23yhsX8ZerGLmXCIV4J2/saB9D9rmq0OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lbwLtcAy; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lbwLtcAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750882394; x=1782418394;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qSIssHa1a3keZ5YbpBT76oZOqXhmc7eIRvLVhcFfMnc=;
  b=lbwLtcAyW0OYTYaau+S9cySoEVIUg5+xnEwLfEnau5PjtejL22iSk5H/
   E8e6+0fj+ox0yOn0q7M9jcwAVLlM1QzWolgq56v37JkgGGMV805etH1kv
   vlolpHR+ko6bPKMqGaMMO+qAWy2/zIQpt5KNYS9IQP4N7tt31QPFHYp1F
   WAd9mKmZxmvDE9WRCYTsdFJUSTGY13dtxABbyCJk0A9GtpUbVnafv2U1j
   bRJLyOh5vgoG06zTQg4FiGyyOFHh/xZxKWvdeTWJlugpRKsekUjHtHQHb
   ij+r/jn+AImMaR452PN+KVuAaiwAZTFI93VUhzEQalwx2gMzp6qRELDc7
   Q==;
X-CSE-ConnectionGUID: LuMtdp1fSxGLPdvBeslIdg==
X-CSE-MsgGUID: 6a0DToGvSfWs2UOEwQ+daw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52393172"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="52393172"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:13:13 -0700
X-CSE-ConnectionGUID: iskLNgSSSfCthAMA19FJjA==
X-CSE-MsgGUID: qp4e1bxGR/SDbgMCwhzTnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152438761"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:13:13 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:13:12 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 13:13:12 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.78)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 13:13:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nSA20/iuDcvmeink0WaR7SufUlBlvlEzUioDwwEPzq4JsXYphMGCnhJRaQYmp3gLmtLmMXfOue20/jSN9OG4lnSppXoHOyljBHubd2Fr0NXe5YdLHBvZPWwqkuxsRg2igvVTp+PSl7nDESWthhoiuhbpMbQgglZMKOYLORHAPaJXdkCLsAw6ic6A2Ak8H7NXmGkuR4UkB1IKMF/PKewVJhMVtvzxHV1hcVmGNINSNK2cot0QaXZZ/rcOsNS/kztPWiSvN8/BFMMS9A5PJ+3SkTHRUperHJK9sGooZULBMJoXSnhQSgNpM2uAiXo1e0NfYlg73qgokq8VzoOScairCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qSIssHa1a3keZ5YbpBT76oZOqXhmc7eIRvLVhcFfMnc=;
 b=nYcJjirPvJJ3mPUINS/bkKYQzbl/BeWKa/1Hw/ti3oYIJNbKDUdBeLIHnOiG3lqgAj6I1vpVXIwn0Q9BBV2pBF4rjfLO0po0eq3Qc61yONRXb4QdOdr+SUz09I/Mtbq/CCeS8GhNuk8qd3r9x0kOJmDXsZ96etS3Z0abdwPsLCHPN8KDG7drUkhbyZ3LFKbQ1uvO7IMqQn140VIrGBg8TgOfqD4TlT851lFWq3dV0E/IwBO0cmnCO/Io/fVEWvwW6Cw11MEV7fhMbw9I9VbUshxagrH6nyRs5RjXIgNOtTpDIpMKNvZntXtMnmyKMRZ2KXESxCvpNu9iMDgwIgNNoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by DM6PR11MB4594.namprd11.prod.outlook.com (2603:10b6:5:2a0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Wed, 25 Jun
 2025 20:12:40 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 20:12:39 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: "babu.moger@amd.com" <babu.moger@amd.com>, "Chatre, Reinette"
	<reinette.chatre@intel.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"rostedt@goodmis.org" <rostedt@goodmis.org>, "paulmck@kernel.org"
	<paulmck@kernel.org>, "thuth@redhat.com" <thuth@redhat.com>,
	"ardb@kernel.org" <ardb@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "seanjc@google.com" <seanjc@google.com>,
	"thomas.lendacky@amd.com" <thomas.lendacky@amd.com>,
	"pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
	"manali.shukla@amd.com" <manali.shukla@amd.com>, "perry.yuan@amd.com"
	<perry.yuan@amd.com>, "Huang, Kai" <kai.huang@intel.com>,
	"peterz@infradead.org" <peterz@infradead.org>, "Li, Xiaoyao"
	<xiaoyao.li@intel.com>, "kan.liang@linux.intel.com"
	<kan.liang@linux.intel.com>, "mario.limonciello@amd.com"
	<mario.limonciello@amd.com>, "Li, Xin3" <xin3.li@intel.com>,
	"gautham.shenoy@amd.com" <gautham.shenoy@amd.com>, "xin@zytor.com"
	<xin@zytor.com>, "Bae, Chang Seok" <chang.seok.bae@intel.com>,
	"fenghuay@nvidia.com" <fenghuay@nvidia.com>, "peternewman@google.com"
	<peternewman@google.com>, "Wieczor-Retman, Maciej"
	<maciej.wieczor-retman@intel.com>, "Eranian, Stephane" <eranian@google.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event
 descriptions
Thread-Topic: [PATCH v14 02/32] x86,fs/resctrl: Consolidate monitor event
 descriptions
Thread-Index: AQHb3Kb7JExlpfuAXEiRZfn/4dIBhrQS5JwAgAE1rwCAACB1MIAAI+TQ
Date: Wed, 25 Jun 2025 20:12:39 +0000
Message-ID: <SJ1PR11MB6083670E3A7FF6AE8881EBC2FC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1749848714.git.babu.moger@amd.com>
 <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
 <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
 <09c1aa33-08f7-456e-9c15-323a29877302@amd.com>
 <SJ1PR11MB60839D756E7D880DA0D2268BFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB60839D756E7D880DA0D2268BFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|DM6PR11MB4594:EE_
x-ms-office365-filtering-correlation-id: c9da068b-7297-41bc-d3f4-08ddb424a2b0
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info: =?utf-8?B?T1pwdjJrZnd5YXhwbTBFcUJnV0xSODBVMWNkYWVsSzZHNTN0V3YvcUxKM3M0?=
 =?utf-8?B?K0tXaEVwVlJQLzRYQzdVUFJTd1lESTNvQk1HYktiREFTSzZMZTUvTEdiV1h5?=
 =?utf-8?B?eGdyRTNITHYwMGVqcmdQRVpRTUtKUkdYOVA2akREMFRJZytSVmplcmtHejcw?=
 =?utf-8?B?LzhYQ1BmYTRyWDY2WEw1Yjh1T2xnZFp6em04OElyNkhnMjlaOGU1SloyQ0VR?=
 =?utf-8?B?RGJUalNWQnNCbkRMdnRhbVo4MTBIWWZiWGJuYlNEVmxFMHVMeUhVc3Blb1ZV?=
 =?utf-8?B?bFoyNWFQeHZSOHFVR0Z4Mm43NmFDYlJhUjhRMmcyNHhRSWswY3JvWTJXbHNH?=
 =?utf-8?B?Q2FDZGlDM2pyZUx1c3k3WmZSakpob3JqeTU4T0pYY25mZHdyUkZBWUlmOUNi?=
 =?utf-8?B?TTJNVllzMFZ4RTFFZVVZdVRudzdVN0pwcWNkTVZ2TnJxVDhIS0E1bnlwT2pY?=
 =?utf-8?B?NmNNVWN3NzJIWHl3ZGtmdEg2MU9qRDdjTUdvdmFhcHQ4Q2UvekExRHMyRjRO?=
 =?utf-8?B?WU9kMzZ5VWEweGt5MzdkdzJ0eWlMQlQ5K292SmxDWjZQdS9VTEs3QThPb2c4?=
 =?utf-8?B?dVI3VURyNWc3QlVtOTVxZTdJanZ1Ri85K3hUaGkvVVhsN2RWRTBpZkRwLzFy?=
 =?utf-8?B?M3ZNam42UXcxWmtteWltNitqQUFWc0tlU1FZaEdycjZsNERQbVNIcFpsVjRj?=
 =?utf-8?B?ZXp0ZkZoZWdsMTFaYWt1aEhHbG1YTWx2RXBqb3puMDFZWnFVVlFDZ0RPeWdh?=
 =?utf-8?B?enZ3Z1BRYXM0bXVFUit5YlZHOWkwQWRENnY2RVU2a01xZjVjaXBEMlc5R0Qw?=
 =?utf-8?B?ZnRXMUg1K3dROE5vSFhoL08xWnBna2d4ZXBhbVFqYmtjdmppU2tHdFV5eTlp?=
 =?utf-8?B?VW8xVmdCaWtrYTZqNGxHWXlTSHlSK3pidzdUZ3R6Mnd3djM4RktTdWt3ZFk0?=
 =?utf-8?B?eElXdExFSmZjU09zSTYvZExaZXpTbnFDUFFicjlTQ1VEYUhJSnFqaGh0YWRx?=
 =?utf-8?B?Q2V6NHBqaXlrYXVnRlhra2RsUk13aGs3RTRmK01Ia3hSK3NhZHFNT2xaQUpp?=
 =?utf-8?B?NjFpZ2xtaFR0TGlJb2lFR3R1ZVQ1c1FwUDUzdW9hUFN5Vlh2c291NDg2ZXE1?=
 =?utf-8?B?eFhEcFFYMklnNXQ0NjJ3cTlodlhlV3FFWk5mUFcvVW9ESldvN1RvTjU0UUNP?=
 =?utf-8?B?Wk5nWjZyQjczSFNBNzhzVU1DLzJqZDNkc2FMa0JYaXh2Y0hCVnZ1TUlxK3ZT?=
 =?utf-8?B?N0dpeXFZWlRaUXNmZno2NVpSRWRSNnhXWmFkNWJwbDlkUnhZLzZHMEczcmhh?=
 =?utf-8?B?S0dnMW1zT1VMVkJiM2NKZTJpWWg3UFhjNFhQNnBxb1pPM2VFY3BML3ZHWlJt?=
 =?utf-8?B?MzZobmNCOEQ3OVJhWnpub1luV1o3aEE4QWlpWWtRY2V0YldBYTVYcVd6TGZp?=
 =?utf-8?B?NWNvV29TdDJGdldVSkRKTzlHbkllN0k0VzIrT3pkb2x1NlpZMkF5bTJNN1FR?=
 =?utf-8?B?SUdIallKdEkrRHlCdDI4c1ZacHQzYllQVHpnbDlIUFRSOWVJcHpxdlZCWlNr?=
 =?utf-8?B?NFJ2a2lxSFlGbXlHUG1iRDBzNjhtbTh5OFo1VUFOZm5xYnFQU2JFQWoycXI4?=
 =?utf-8?B?eDQ1cmJ1MDcxR3FDZUlqMWlNYUxTOUJOVU8wM2xuRmV3TU5uV0Mzdm5Rd2di?=
 =?utf-8?B?amxXTitKRm1kS1dVdmszbHp5NUlDSDVqRVFjcjA2Y2JpdmNwWWdYTVQ5c1lj?=
 =?utf-8?B?WmoxeDFJTEFpQnczTzA2L0dkM2dPZ1BVSXdBWDhIY0xTZ0FOb1I1blczdk5W?=
 =?utf-8?B?QnJzbldJQXBINWRTeVZGdnIyRTZoenJGYldIdVV2M1BkOVJwZ3lZKy9aN1Zw?=
 =?utf-8?B?b3N5SHRIeWlXZ3RTd0xHTHgvcGJhMFU2c0dnbzh6VFJQZnNYWHZXUlI1K2Uz?=
 =?utf-8?B?amV0SE80VHg3L1dKalg4YnNoMTFQYXhpZXlDOVlhbjBmc1hFcWdUWUd0QmlC?=
 =?utf-8?Q?nPA8xMd393ra3x/txtSbUW4GVwMHlc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eWdMWm85MnAxSSswMzlMZGZIYTdBSVArMm1BaFFVRFBMKzBRNkg1eXc3ek9q?=
 =?utf-8?B?N0czVldYOHl6Y1dtelQzYXdzUy96bjJpS25OT21xdzZIdmowSnQvTVRjQmFh?=
 =?utf-8?B?OHd6UC9Sc3MwRml6cFdzR2dRRHEvL1p1S0lUeFhKWW94ekgxcktBUitsalVN?=
 =?utf-8?B?dGhGOFh2WkRtSVM4VFJ1dlUzU1ZhYUxkZWdXYUdocFh6NG1RSXRTZndUR2ZH?=
 =?utf-8?B?dkgxSStFc3o0UnE2VjFoSVdmcGppUmxDNFFGOStkc29IS0ZpbmI5NmRDYkJ0?=
 =?utf-8?B?RjVyNHJ5amQzZEFLY2J2Yi81UDAwdXpJSmZ3VTVFS0YrdHA0Tm5la0xsaW1q?=
 =?utf-8?B?MjVJM1RrYk43MTl2R2FxVVhZZkllZTV5cjYrT3Rla2IwWDhPSHVlQ3o0cVRo?=
 =?utf-8?B?VWY3VUNoMDk1YXU0cHA0UVNEbDVmdVZJTVhPeCt0YkhRMURWYXpZeC9RTi9C?=
 =?utf-8?B?b0ZIVFczOVNSdHVDN1lWR2Nxa1Q3STFycDBIaE1IWUZuaXAxYW9ZakRJbzJF?=
 =?utf-8?B?Z3pWRkppTXUvNDFqMUxQckM4SkM1NlhFOFN6NEJZMXF1Y2VBTTAxNmpLRUdN?=
 =?utf-8?B?d2ErbmdoRUlaYlpGY3hKbExUWktNelRZMVFucjZaR09nQlhnNkZTNDBDQ1Zl?=
 =?utf-8?B?MW1XNDNpeWxkRW1tTFBFTUUvcnhJNkFjQzhndi9tWnpyK1IxanFqSXpwUUVZ?=
 =?utf-8?B?eEx2TFhSVGZUcUhjNU9Xa2JzbG4rc2lxQW9JNWd0TzBJVlYvRWN4Snc2SUJy?=
 =?utf-8?B?NnhOaXEzeEZlOHdHc0lwdi9meXZUdDhSRmhlS1FLWStOd0cwZ3ExVlUzQTU1?=
 =?utf-8?B?ODhUYitaWDBEU1lSVXVSNHJEcDZQVm8yeUY5dTFDamxqUkFaWDRRdDBtMmNU?=
 =?utf-8?B?eGJGTVMwaHg4NGU1T2RUL1k3Qm0rOW45QUloSjE2OStEbHY3bEo0VUpaUTRl?=
 =?utf-8?B?RjF5elRsUkhkZU1DK0JSaysraU5BTDdmT2lOUnMrcXdyOEIwb3lXcG1WdzFv?=
 =?utf-8?B?STBTNC9nbnM4b1VQeHdlTGFRMEdmT08wZDg5RGZjQkhSa1NENTNHN2V5ODdD?=
 =?utf-8?B?QU9IdlArNU42VExaZzV2ZFRHcmZYU2pSbVV2S05idzRrWlNrclo1ZVRjNEpY?=
 =?utf-8?B?R2JxMkN1ekl6ZEJBQWNzUG9IcWUzN2IxaGJmYUx4OWdYTmpvMHRkNEwrS2JV?=
 =?utf-8?B?ZGV5Z1RRd24rUVZsRVZ0NDlTamRucko4QXlwdDZkbjhIVmVaNnFoYU9ibVB4?=
 =?utf-8?B?TmxXVnFKSWxSQVI5SEVjTW1yRlN0QmR6b1lwbERCYm5IUE1YTVBHUlRoS0RN?=
 =?utf-8?B?Vm5Pd3E3NGxDS2lNNEdJeTFaTUpOSTVLYnV5dFZ0RWFuVnNPdG0wOEV4Rnd5?=
 =?utf-8?B?WU01Y05JYk5OTWJjc2NIblIxa3lBOWZ2RUNOc3Yzb1gyZTBHdEljRlJPUm5G?=
 =?utf-8?B?d1VjNW0vTGpSNFdYVE5XeFdQeG9yUzNGM2hHdlRTUWtZZE50NWFBdEI4Ui8y?=
 =?utf-8?B?bS9aangyYjQrVDF6Ti83eUN0QWJXdU5LMTFsYVR4c25ZUVVkaDhaK3dWS0lV?=
 =?utf-8?B?L3Q4NVdJQmNWYkFXU3lRdExDR3d3eXNrbW1xOTZCT09uQTJwRjN6U1pORFdC?=
 =?utf-8?B?MFM4a0FYcGZYVWIrMW1ycnRjSUJ4RENId1NrTWhZNWoxcmphcms1RHl0eEMw?=
 =?utf-8?B?NEFwSjJRNmFuVjA4Qjl4SWtST0JZWkloU0d1MjNSREZDWjlQdGZTZFdIUG5m?=
 =?utf-8?B?RDZ3TFBNT0gyQU10Zm5BeCtjS1ZaZDhGaVBhL1dxKys4WURsVkhtaUkrNTdG?=
 =?utf-8?B?U2dqSDZKWElWbHVWNklNVjZJa3hnZ1cyd3kwUTF1d3RSYXNBVEVJRGp1ME9L?=
 =?utf-8?B?djJObk5JWjAvbSthWDdUUERILzdKdGN4cCtZcWEra0lkbWtXdFB2SWR6VGRm?=
 =?utf-8?B?WEExdnhPS3QrcmFKM0ZlR0M4V2QyeFR6V2w5N3c2UnBWa2Jjelp1MVdxcHNE?=
 =?utf-8?B?TzRLODBvOWkzVk83bXdTUUpZNTYzbW9ZOFF0NHkzS2owWWwxL09GRG1qT3JK?=
 =?utf-8?B?dzZuVmY0VzNxVGZGUzZlbU11cHJ0dVhYVExKeEsvUUVPOFE1U2dRV3B6Unc0?=
 =?utf-8?Q?hR9lFRrbio6viv1xiS4OjZJeh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9da068b-7297-41bc-d3f4-08ddb424a2b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 20:12:39.7153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBv0rGusov/Br7/ZTtUKQDoaJA6tJqys9GAQUbc+SEwTJo0sKJmkXaINL+ynoiafsHMg7sw1pDBXLdql/ALVBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4594
X-OriginatorOrg: intel.com

PiBJJ20gd29ya2luZyBvbiBmaXhpbmcgdGhlc2UgYWRkaXRpb25hbCBpc3N1ZXMuIEknbGwgcGlu
ZyB5b3Ugd2hlbiBJDQo+IHB1c2ggdG8gbXkgR0lUIHRyZWUuDQoNClB1c2hlZCB0byB0aGUgcmR0
LWFldC12NS41IGJyYW5jaCBvZiBnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvYWVnbC9saW51eC5naXQNCg0KWW91IG5lZWQgdGhlc2UgZm91ciBjb21taXRzOg0K
DQoyZmViNGU1NzE2ZjcgeDg2LGZzL3Jlc2N0cmw6IFByZXBhcmUgZm9yIG1vcmUgbW9uaXRvciBl
dmVudHMNCjNhODZmOTBhOWI4MSB4ODYvcmVzY3RybDogUmVtb3ZlICdyZHRfbW9uX2ZlYXR1cmVz
JyBnbG9iYWwgdmFyaWFibGUNCjNlNzIwYTlkM2I0NiB4ODYsZnMvcmVzY3RybDogUmVwbGFjZSBh
cmNoaXRlY3R1cmUgZXZlbnQgZW5hYmxlZCBjaGVja3MNCmVkMDZlZGFmYmE3OCB4ODYsZnMvcmVz
Y3RybDogQ29uc29saWRhdGUgbW9uaXRvciBldmVudCBkZXNjcmlwdGlvbnMNCg0KT25seSBmaXJz
dCBhbmQgbGFzdCBoYXZlIHN1YnN0YW50aXZlIGNoYW5nZXMuIE1pZGRsZSB0d28gbWlnaHQganVz
dCBoYXZlDQpjaGFuZ2VkIGxpbmUgbnVtYmVycyBiZWNhdXNlIG9mIHRoZSBmaXJzdC4NCg0KVG8g
Zml4IHRoZSAibGFuZG1pbmUgIiBjb2RlIHVzaW5nICJ3aGlsZSAoLS1pZHgpIiBJIGFkZGVkIGEg
bWFjcm8gdG8NCmRvIHRoZSBpdGVyYXRpb24gKG9yaWdpbmFsbHkgc3VnZ2VzdGVkIGJ5IEZlbmdo
dWEsIGJ1dCB0aGVyZSB3ZXJlDQpvbmx5IHR3byBwbGFjZXMgdG8gdXNlIGl0IHRoZW4sIHNvIGl0
IGRpZG4ndCBzZWVtIHdvcnRoIGl0LikNCg0KTm93IHRoZXJlIGFyZSA0IC4uLiBzbyBoZXJlJ3Mg
bXkgbWFjcm86DQoNCi8qIEl0ZXJhdGUgb3ZlciBtZW1vcnkgYmFuZHdpZHRoIGFycmF5cyBpbiBk
b21haW4gc3RydWN0dXJlcyAqLw0KI2RlZmluZSBmb3JfZWFjaF9tYm1faWR4KGlkeCkgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCiAgICAgICAgZm9yIChpZHggPSAwOyBpZHgg
PCBRT1NfTlVNX0wzX01CTV9FVkVOVFM7IGlkeCsrKQ0KDQpIb3BlZnVsbHkgZW5vdWdoIGRpZmZl
cmVudCBmcm9tOg0KDQovKiBJdGVyYXRlIG92ZXIgYWxsIG1lbW9yeSBiYW5kd2lkdGggZXZlbnRz
ICovDQojZGVmaW5lIGZvcl9lYWNoX21ibV9ldmVudF9pZChldmVudGlkKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgXA0KICAgICAgICBmb3IgKGV2ZW50aWQgPSBRT1NfTDNfTUJNX1RPVEFMX0VW
RU5UX0lEOyAgICAgICAgICAgICAgIFwNCiAgICAgICAgICAgICBldmVudGlkIDw9IFFPU19MM19N
Qk1fTE9DQUxfRVZFTlRfSUQ7IGV2ZW50aWQrKykNCg0KdG8gbm90IGNhdXNlIGNvbmZ1c2lvbi4N
Cg0KLVRvbnkNCg0KDQo=
