Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF238219E0;
	Tue, 24 Jun 2025 23:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750808500; cv=fail; b=RX/njscK8u/B+F8ERS5YL6p53AApLul76CWr2CimepfKTsMRdkHuEPaTvAMCxoEc6D1CUvAq6sQGbW9iEcTZ09sgtJrnmo4rbwFScmpnqMNdoEkS5+8YDlppTE/XpNi9Fk8j9g1XBghoBJoQnq4rVIApwpl1jKjCdvvueOKulC0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750808500; c=relaxed/simple;
	bh=HnXuVaFsqQGl4QT5ObtXbQfrHDu/zO0dOCQ/eFoo9+8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fVH93y4Taqzvs41EGX5I34Dc++ZO2TezOn9OLPykorRqQG9gmx86WYuc1be75mAYvFxvrB0wVtW4YJ/gHNF5lgP+WhKSoOOI6ZRYkiKhBsneIVA3rhb7x4Q3Vcl1wrtJhvaS3Br7ZotPGDrU15ehDELsC4/fcUds5dCwffTdqH8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VX0hq9F9; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VX0hq9F9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750808500; x=1782344500;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=HnXuVaFsqQGl4QT5ObtXbQfrHDu/zO0dOCQ/eFoo9+8=;
  b=VX0hq9F9GE9Fs1vqQoqUmzJlbcZOgG/tC+Dh9gY+BmtE2AKUNznE929L
   mpLm+NtdPs8DJ7qUDQP1rk/SM5BuoI+Y7kjSIXrpbUwggGPaz18ge4gL+
   F9/P2+vwzdKcAkz/Rm76/odWmyXfNedlRgDk0jLQooHcHFnGNpD7lnfno
   IxRJwGGWZFfi7ujqaC0o5O3BiB17a/sAIqlY6/pAg0I8i7B1e0WMtzuxu
   Cs9K0RFbjbZ/b3OUtaUyyFkfMizsAwkPHr/DUrihSbmKZl90xAfhZpXuj
   Hy0wmIm0Ts8XS1ZPjHnm+XmMeJYo8ZguTNPEtA9j1Yq4SLBMFEatwB6lv
   w==;
X-CSE-ConnectionGUID: kjN6vVLXTKGpoO9fUquJdw==
X-CSE-MsgGUID: 3AllzdoITX2mrdMpyUBkVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53034110"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="53034110"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:41:39 -0700
X-CSE-ConnectionGUID: nKHRCGuXRGaVvzumC8UbbQ==
X-CSE-MsgGUID: Fo3wOWLXSZCkFY0Du6HkcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="152548570"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:41:38 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:41:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 16:41:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.70)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:41:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9DMqmH8NRIW3aOiWn3TTfo+0EES//1GrehF5X93W0qp8gDRsXTHPlgbouJ4hxN4vNYBk411mtG5CEyf0JhGuNHxpclFHOKbGp3Kk7gA/PwVWJ5iTH2lKG+dAYXYXKid3gMI5dC55HujUOrjFkTfQDTJqAblBRsRyyeTmoIpAb9k98fxhTEZFN0EOgLmV3WjvRW6khvVfbCoTNXh6RJtfgd9zzmOJr6xhMqcYOF8rxLf1mrToKhltUvlfe/YO9uty3RhFJgaTstABCq7q6VX0Mo8B+Xb6RUCi4MoAGKrATZxpsxBcV80of00pO5tAochf4ONVKA2PdVlSQOAyJ3viA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UlzR1b6l9bZtlmLnbspWlHJCbee+7yiQHrFjGFcRRY=;
 b=G+hvlG/Nb4AN//1zMm01RdCP9gl0Ev8ZCNRXV4wxzaLalJQ4Iw1eZg+zRm4cifhPyZyB+QqMwtzlIVsb+6lUG3wdx6nEkgVilFe4yhUSFB905DPaZJsGufah+yw2AV4VU4+VdkN03XUn2HwG3oRYt4ykRckVuOJ3su+67pt3EG28GgWa+DA7tPmiufmRW1dVvsR1BtbIbX8ch68ayeOpEY7ps0oxONxfhf4L4TA/hD2mmoTpba5yw0F1mWjBYvlpxg+MT4HBecNmZUOZoqtL5I74bag6Yg3s56PTFQYvbxWyNcnaBd30BtW+f3VLsNvo7e4hXrseIIOmvyz0Y2fNGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DM3PPFB266726CF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Tue, 24 Jun
 2025 23:41:35 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 23:41:35 +0000
Message-ID: <d0e29689-c2c0-4283-a688-f5de92b2df48@intel.com>
Date: Tue, 24 Jun 2025 16:41:31 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 14/32] fs/resctrl: Introduce interface to display
 number of free MBM counters
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
 <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <ad9a9feca7638f9be09e348e3647d010a1a5db61.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:303:16d::34) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DM3PPFB266726CF:EE_
X-MS-Office365-Filtering-Correlation-Id: d5eee1b4-a385-4669-2768-08ddb378a7b5
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXlITWVyV0dnRlpXYjVhVnRSVUs2bzByaVZvQnVOZndnZHFpckljQisvUHNX?=
 =?utf-8?B?MVZvQzlBQloxckJNc0tnSUR3MDZ4c1BLRkV1RW5DUyt6cXhsakphZGhWVE5O?=
 =?utf-8?B?OWlzTHl3NWZFdFZXc3MwWHpKYVVWNFMvSUgvM0M1UWgvWEVlbndVSjN4ZjVv?=
 =?utf-8?B?UHdnK1l6ZWRNUmJMclh5aXhjdDJoam8vcVNjWldDMzlycndOZGhUcHJSN3dq?=
 =?utf-8?B?RExXTDFLWTZ6ZHRxSGcwNGdDNk5OTlR2V1hTUWgwd3o5NC9Sa2hYVGwwNGY0?=
 =?utf-8?B?R1pPNSthOG5xc1o1NE9acGR5Rk94a3BOTGpMbXNrSk81MnU1VWRMUmJ2QVhm?=
 =?utf-8?B?UXVmU2REYVhnZTZTd0hraytKc1dSS202V1RQeVM3d2JEMC9BQjlvcHhmWU5a?=
 =?utf-8?B?clNoSkZoeHRxMG9JRXFVb3hacVNZcy9SWmtGVDhtSEpDS0tKQkw1ZU45UjNB?=
 =?utf-8?B?aW5LWTMrSERObzlWY2U5Z0YxTnN6VnZsMmd4OXdFK1pJc1pzRWR6SXpoMlov?=
 =?utf-8?B?YVQ1VXBPMzFFcTBnVzNKQVNGQ21XZ3YxRFpDK25ObmFUVGNkTklObkJ5S3Fw?=
 =?utf-8?B?c0I0T0tVeXF3VTZVUG9rR0V4SmxTTXdmS3Uwd0ZxRSt3YUJWaUNndHltWnhp?=
 =?utf-8?B?NlBPNmo2OTlpYkpSSWNKSXlrblpnNThsck1jcDU4NENsRHBLNUo5b05Gblpm?=
 =?utf-8?B?Mml4Z21oWnowYThGMEJkSlBiMlllZ2Q1b1E0Y3ZDVVVETFJ0Tm9uZlp1OTdH?=
 =?utf-8?B?a0ZnellnUmxPckhrbnVCazFSeCtyaTR1NDBNUGJ2OUxCcmllS0w2OXgxNENq?=
 =?utf-8?B?d0hrSkRVbk1qME53OWV1Z0xMdmdDVldnaEpGM3FTSTlRUWZ4SmIyME4vN3Jr?=
 =?utf-8?B?Vk1zUDZ1TzE4M2FPSG9PNW0wdjIyUlh4UUdjMFQ4TWFNNUYvc0UrbkJmMFdZ?=
 =?utf-8?B?d25EejF6MFdnU2dCRmRodWtsd3U1Wk9NaXk4MysrTFVMU2VmV3FBUFBFeUx4?=
 =?utf-8?B?ZmcvellHZFRvb2Q4S1dMMnlmZHQ3aVpFdWFpMER2NlYwVnNFcXN6WWJJejc3?=
 =?utf-8?B?U0JIemMrbmZXWjNEdXZ1cGJPTWlmaEZlVEtrTUNhTEhRR3loc0txSW5OQnRM?=
 =?utf-8?B?Q2tXZFc2bGJhQVg1WGpMa3hvV1JhODNEQTBOVEhPaWhjcms1ZWRjUVI3N05o?=
 =?utf-8?B?ejlJNXJXTi9janAxQ29QVjB4U20xWVFYOVVTeXh2VnRDSSt3a01vR2hHS0Yy?=
 =?utf-8?B?cS9JQXVyb2hjRmI4cTJBUUNTVGRiWWlLb0FCMzkydzlCQUFrc2wxQWpINzF2?=
 =?utf-8?B?NGdSZDBFckllOG1nOFFONWExSGtQYlpvQ0tyUEo4YXpERjdEaFVONHU3OG4v?=
 =?utf-8?B?aHByVnlCNmhIMStKUnNjRHNQaUhaUm81Y1g4L29QcUwwcFZBT0ROUjFKWEx6?=
 =?utf-8?B?T0syMFB0ZjJpYlhQbC93ZStPVWZoTTJNKzkwUmlXYjFQYkRDUkl5WHhRZ0Vr?=
 =?utf-8?B?N0ViK0N6cXlydnJsQ3k4ZEV0a1M2QWFuVHRYeUlCa3hobDdPd1RObEVXQisx?=
 =?utf-8?B?a0poSmszYjIwTlJnYWViazJhVHpmNWhNaUtCMm1xdkhXZlorZThBUzZOWmlt?=
 =?utf-8?B?UHlCeFlpN2tQL3RMQ05udm1yMzBSdWJUTjk5SXRyNWx1a3c4SytvR0lTM0lG?=
 =?utf-8?B?YzFZOVEvV016SGtadGdqZ2pzRmxsNW5CUjBjL0Myb0E3N21xQzVVV3YzT2lW?=
 =?utf-8?B?TDdLUERYLzBVTHNmTDR1N0svbjhCUHBDV1VPQVZSR0NqbGhWbFFsK2pJTERV?=
 =?utf-8?B?V0JMRTBxRVBQTzdOQlY2a1Z4WGhkOWEzRW1SQzJFQmlLc2NQMTdndEFVcEJa?=
 =?utf-8?B?Y3hqdmRUeHJ6ZFg1aW8zK3pYUjlJanBLaCs5U2hDRHF6Z1BsY0tuRUduM01h?=
 =?utf-8?Q?zIe8LE1eH7g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjRObnRLYjhtbUk4SVFvbWhrU1NUSHhCWm5MWkhYT2RjMitTVnhPcjdiMjc2?=
 =?utf-8?B?M3puM0c5cTgyeGQwaWlQc1laemRKQ3VZK3ZaTGJvekdjSEpaN3pSZHZVQmhS?=
 =?utf-8?B?UnppMm5DVzUwb2RrZ1NWbWZ1dUhKeDhZUVNraDUveURzbHVvKzlkK2l4TnlC?=
 =?utf-8?B?ZnE1Y2VlWWRZaEJSMUdLZWhpSVdUdFNQWHpUblBMRWNCMlNkRzU0bEdJYlQz?=
 =?utf-8?B?Y2lpckxqMjhxNldQUDd4cGhxUmdoK2swRnBkcnRhTFRuTnl1ZzNvdHUzU2Ir?=
 =?utf-8?B?RzVpaWNoYnRpNzlabXJJbUhMc05wSDFHMm4zRUh3WmJ6UDZPUUZUN2x1bkhs?=
 =?utf-8?B?YW4rS2JWYllHbDRBdjJvRVFra1RlVENFNnVBVTBTeFUweVRJYnRsNnZpWjJU?=
 =?utf-8?B?ZnJGWjJaNmovbUN6MEMwQVlRZVUxdzI0Uk01K1JXRVVYT29zUVFJSms1WXR2?=
 =?utf-8?B?d2J6M2pwbXROUHYyeHo5ZzBxcllmakN5RGM1TVVYSGoxYkFITGkwSXl2R0xQ?=
 =?utf-8?B?Nm1BNTBDTlhDaEljU2s3SDR6R3g3T2hEOXpEUTRDS0l4blREa0RjNHVDN3Na?=
 =?utf-8?B?NmRJZVNiN2FaK2hvd3VNTlhGL0lRRlFRbWVnY0NlS0RhY3Ftc3VDSDJwSDIz?=
 =?utf-8?B?ekx3ajdmeHAwVkhzK3VqZUtBMU1WUitBQ3JFWGVORXNxc1JISWlKbzdCR0l1?=
 =?utf-8?B?Vjh2YnJiWlVBTU9ONFdYemFWTTJmZnpnamVhNlVjcTdKTTduN3dyY1RMNWtQ?=
 =?utf-8?B?RWtGbDRFSlFPQUNIa2drRkZoWUFFeGd3cFNRY1BTaEw3L0lpenFxT2NJNm8r?=
 =?utf-8?B?VEx5aFYwNVl6bStxcysrNXFzQTFVTDcxWTRldmpVa084NURlQS84UjFOaDli?=
 =?utf-8?B?ZWgrQ2FvR24xMGN1ZVZzeDhqbXljdzA2blU5TllBUjV0c0lsQkxhcU1nVkNh?=
 =?utf-8?B?TUVxQnRKdExHWDdTWU8vT0hnUDFHNVlNNWNPZHBEcUlsV0FuR3NYQS9saWhW?=
 =?utf-8?B?N1lINHlEM2dKQjNXQ2ozRVRBM3dweEptZlBnK3Faem1mZVFHMUVhMGNGWE4v?=
 =?utf-8?B?cG84dEVFdjMxNkVHUndmc1FmR1FsblljUFJLaFIwNHdINVJVMTJJT0FvU3hC?=
 =?utf-8?B?RkNVckVQakdDUVRWRkIzejlRMTBLaW1qeDJ2RFJHcWN6VnI3WTErTVNMQ2o2?=
 =?utf-8?B?UWp5aTV0VlNtN3VMK2UwN2VPOXVtV3FLazRGeGZEcnFnejJXSmVWY0d2WXBB?=
 =?utf-8?B?QTdueGNUUWovWkRxeXM5YzdQdCtKanpCTFd1YWxSSmpWbW9XZ3paeWp4QUk3?=
 =?utf-8?B?K1VlZHhoamJyRk9rdHVjeFFKNnMwSVJpVGtocXc4VTVxM1h6cEVLRXJjMFE4?=
 =?utf-8?B?dEg4Y2YzNW0yWnkzV1NSQTd5MUVGR21JRXFRcFJ6clVyT0w5TDI3UXJvQXA3?=
 =?utf-8?B?Qk9sZ2o5ZTZURkgySmxnVWZadXhYamtHblFiTFJBY1dBZUxRR0lsMTJSVXpm?=
 =?utf-8?B?Z1lHTXpjRGljUXZrcjdGRzI1dmFLR2VHN0w3OFMxeFUwUU1LeURsMW9ZWjhY?=
 =?utf-8?B?NFN5S2Q1OGZkODBuK21FVTZKNFUwa2VaV1JMWU5iam1BdjM2UDh3dlo1KzZL?=
 =?utf-8?B?WktWcUhxWCt2dklsdkw3N2VORUxZUkdVanJ5SFY3VDlSNWF4ZzZFU3lZaFBY?=
 =?utf-8?B?MlVobktGK05sL2YrZk9OWHRLc3JNb21ZbGREaFo0bEE2MlZMdjRPOUxIempB?=
 =?utf-8?B?TDAxZzFXVEJYN1JUK3c2bDNWcW9nckVVRW9iYU5QUXV4TG5SQmRJYzhRZ1g3?=
 =?utf-8?B?M2FSdW9MQkRCWDgyZkw2WWhweXdmbGxTcUpJSWhvMS9qbDdMSGZRa1kvblZL?=
 =?utf-8?B?K1BZNXdxM2V6bHczUFJ6dXZOb3FXeXY5SmZ5NWpJb2xKd1hYQVNrQzhMNWF4?=
 =?utf-8?B?b3U1NXl2L1RURENvUlZDMVlZWUFydGlMc09MTldQYnIrSElidWFIZ1dsMFdr?=
 =?utf-8?B?ajAxcjVYeHA5RC8xd0xQV2lickZFV0NxRnRkQWlGd0xxdXgwd0t2Z0p6cnlr?=
 =?utf-8?B?Rk40Y1NManNLVDYzTTYxMzJFb0ZidzlhUzVyOG83Y05XSVVOQXJKR2dUei9v?=
 =?utf-8?B?Nmx5NnY4cTZIUHFxdXNGWFY5cDN5TFRReEJRZXJaclN2TlRqRGtxUkhnRkVL?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5eee1b4-a385-4669-2768-08ddb378a7b5
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 23:41:34.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVgIqPZ/5GziGrk4L7N5IeucpcRcZ95RBkd/MVZz3pro3LZBzD7OPIzYQ3U/Y42TrmxTLt3HoFRTVnNOVEDC8y5i5aE5TpMGnwuUob/Jxrg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFB266726CF
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> +static int resctrl_available_mbm_cntrs_show(struct kernfs_open_file *of,
> +					    struct seq_file *s, void *v)
> +{
> +	struct rdt_resource *r = rdt_kn_parent_priv(of->kn);
> +	struct rdt_mon_domain *dom;
> +	bool sep = false;
> +	u32 cntrs, i;
> +	int ret = 0;
> +
> +	cpus_read_lock();
> +	mutex_lock(&rdtgroup_mutex);
> +
> +	rdt_last_cmd_clear();
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");

Missed this in earlier response ... needs update to new terms.

Reinette
