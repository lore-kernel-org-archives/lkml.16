Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDEA7189F39;
	Thu,  6 Feb 2025 18:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865010; cv=fail; b=Qqpiwh8BtF21oOnoypxuj0nf+AfLcTpKIA0ufv7w60v4FU9zDVYGsbLGy4P4bOb2Int9RjY0fUG9drPXrOUNi+pVkWIXysFvtPvKQIugupZban0lmurNCYSlH9KntTclGRyj8LU6mkzxpRJ8ipgUESX2d+CdBKKIWlByRGo7euM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865010; c=relaxed/simple;
	bh=rXr++r+SDbdtH7SC5Fyn3IAp6K2i13GywaUGK1JujTQ=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nx2cbskbxzVJljy7eXpAAquN+8eOBnD9/N3r69cuetrdQxmbAzHv4IL4J3Lx9ajCf0lXgs4GkkIDJ+QzkTEBF+UcCA95+kA4AgIawkZZetKMa+UcK4wuyTR7clPQQ575zsrmiWNuwBYBuEYHS8aO0MB1vWg5uM6em+eLAw7oWDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAkp6Mfu; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAkp6Mfu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738865009; x=1770401009;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rXr++r+SDbdtH7SC5Fyn3IAp6K2i13GywaUGK1JujTQ=;
  b=EAkp6MfuO3iSDgoOy69a/aK6gEA28BURNQQEqduyoIT0R4B+54retKVz
   ZOku5+7CvsL8Kg0wLq88LDANcti9K7dN8c/MMMiHDbOQVCqt9cIWmjo2U
   /4qmJmspXwMtbCZtyqT5spDDrKjam7nl/T5bczhBEPlnD3vXdp58cCPxU
   5ECzM9YlOtcBPrD3fmAlMEssZ5p9nJ1wQoOeslM2ocjFxaEe5KWPpUCYm
   fRJvrMcnsZNPLtD0CoYTkropKEg8vT7PBuuRSXvtVqkE1JnjDnPSBEwpz
   b4oWPF2s5sfyKbGu11g0TqqMnI7PpM+glM/8hzRuTTCr0g589OvTYek5Z
   A==;
X-CSE-ConnectionGUID: eTx0xHn2R72oXmIScHPvtw==
X-CSE-MsgGUID: IqE4x8L5Q9WYV7MzLATFvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27090069"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; 
   d="scan'208";a="27090069"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 10:03:28 -0800
X-CSE-ConnectionGUID: exez9iV/T3ugMGdV32i3Bw==
X-CSE-MsgGUID: HAkuUBmWSUClajMAhEd8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116476781"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 10:03:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 10:03:26 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 10:03:26 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 10:03:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BtovKyT9RUGcp3dV1NPWr/2CZ3ox8QDLpOj1weVaiDVZfqb5K1KKlWAuPSLkPlBsLbsQ+QGLIUSTnaP9XL+sIv5mcbpU3CUiBZRv+6MFm2SkRufNA60cnx8wxaAdeoHuYZnAz99/pg+eQDjtKbDASbH1nL5MMa0gCV5/nZmz50kH5j6KgrxgHb7MzLKOzHPrKqv2vY7FigFa5E9yKZPBwru6vBRb/GvgtBoo3wjoppVpy2/HRg3oVhCl508GWFE39we5Ks8+HCbanX1OIZguSKl9kBgABYgMvcBsfr7PIONx6ZaK28iOUnSW1TbGYb8BNNch6Kb7dDfxuoyiWBdGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wlH+V/scFnWUHvynDgDtRfZUSq9googyOb/RP2DQ8VI=;
 b=RH0v6Az3rZLpxna4SGj1psqfRRJM6yUsrGwJkZnN1dh4HbWEYE0qbVu/W4x529nOZkiusC3IW+tKHTRIijG3psD8bEoDc73aQq9TodUDbODQmNkNWmoNmogBQRdKpQdTyT60axcEJVQTB2cEQ22T0xbjwGEjDXCYWOZkkcdqnaSmMhSzEZhYXxmpbyQhWbCTFcFFrvfbKTzzgj2+rXxMyLpgBgaw3CWFDpWZ+ntLcoHver36men8FzsNyFqWf9NHnwN0MxhZWIgsyu/aEiEKhmoppIukpRsMRnFSGaFDTKxYrXK0s6SROt0av2qlTHZzdhfYiPOi6Gjibbyb7DZGJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by CH3PR11MB8702.namprd11.prod.outlook.com (2603:10b6:610:1cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 18:03:19 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 18:03:19 +0000
Message-ID: <8d04f824-d1cc-461c-9c57-0f26c6aa96e0@intel.com>
Date: Thu, 6 Feb 2025 10:03:16 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 17/23] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tglx@linutronix.de>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<tony.luck@intel.com>, <peternewman@google.com>
CC: <x86@kernel.org>, <hpa@zytor.com>, <paulmck@kernel.org>,
	<akpm@linux-foundation.org>, <thuth@redhat.com>, <rostedt@goodmis.org>,
	<xiongwei.song@windriver.com>, <pawan.kumar.gupta@linux.intel.com>,
	<daniel.sneddon@linux.intel.com>, <jpoimboe@kernel.org>,
	<perry.yuan@amd.com>, <sandipan.das@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1737577229.git.babu.moger@amd.com>
 <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <2119b76ef8be21b1d8b2deedfab23e8e33ba724c.1737577229.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:303:6b::33) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|CH3PR11MB8702:EE_
X-MS-Office365-Filtering-Correlation-Id: b1530780-a2dc-4b59-de62-08dd46d889b4
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkQySnRyREwxZlg5cVhCU1BmeDNSUjNCRDEwOWxqajdPMW1aWHJ0MmNtcmp5?=
 =?utf-8?B?OVlnL294Y0R3bXNmZGorTE5oK2ZBY1ZLUkNtbzZNS1FHY0F3ajNic05jWCtK?=
 =?utf-8?B?T1BoTkUxOTd3dndhUXRibE5JTE5QNm15NTk4UW9udW05WTRwYTZ3cUxURzJp?=
 =?utf-8?B?Smh4SEo4MWRPYlVXQlNoVXlMNmFaWkFSOVZYZ0taQkVrTjQ4Qkp5K2IveXNJ?=
 =?utf-8?B?encwNXB1WnV6OEw5azJjZzJ1Z2hzRnFyOG9kUHlWam9Ec2FiZlQ4VFFLVVJa?=
 =?utf-8?B?eE81NlZZd29RQXZFeTVycm4rMTYwQS82VURYSEY2bUFaR0x4WDhuSkZkS1ov?=
 =?utf-8?B?QklwZWl4MnZ5d3ltS2d3S2IrR1NUUHJ3VFZFYUtNcEFzTHVsZ0NsQXVVUmlZ?=
 =?utf-8?B?djRMcWhncFI3WUFxb1RuQXJuSStwUktCN2J4ZFJJZU5tcWpSVVpSNVFiWlhP?=
 =?utf-8?B?QjdFRm9idzRhYTZpeDdKRG85Z1RZTkQ0MVkwdEY3MHNHS2xqL2VjUGViKzdo?=
 =?utf-8?B?cDM1Q2cvUG11Y3lGSGxNN0NJN01TTzFEK045ZG9uQlpTR3ptWXFhaUQ0dkt1?=
 =?utf-8?B?ZlkwU1ppbjJnOERGKzJSTWpHL01NMEVMMmVjSVhMNEFaZUlibHdKbWFYWU1U?=
 =?utf-8?B?ejh4c3dNcUE1NytscjhHM0RBTDFEUkVEQTJFV3U4QmlaZml5TXpTUVNVNDlq?=
 =?utf-8?B?WlFvL0RSem5UbmNSTUJGcXRsbWFDZXpOSXRQSVBYd3JrYUtPbFhMejVXaUlH?=
 =?utf-8?B?NndubHVhV2xkdkNsN21MUnRLK1BmVlgveitTR2s0L1dtY1VlalZKV09Ia01I?=
 =?utf-8?B?NWxGT0dkZDRBZ2o5M1V5cytJdjd1cWJyTFdta0ptWkZ3R0ZhN29SVXRpVmJ2?=
 =?utf-8?B?Z2JiRWpKSnlDSkQwbEk2RlVpVTNHTTBsaTVINDJIRVBpdFVrZ05ibC9ITzgr?=
 =?utf-8?B?aFpjQ1pHVUVuWm13TVBleC8rQ0FqOE1tUFhMdk9OZldaUFM2bnFHYmNsV0w5?=
 =?utf-8?B?b2xHTWZuSE15QkRCSjFGdkhtcTA5dHdUdUhNc2Zla2pzOWJWZWpEa2tKM3NO?=
 =?utf-8?B?TldGaGVkQXpiT05iTzUwRnUxbm96cncrMkx4L3BSWitwYXZvOFBlUk1GNDZm?=
 =?utf-8?B?TzQwa2cvNGNHVjJjWU1iSTcwM3VNZmNKcmVmOFZlbVhKMTI1TEJUbGNFKzNx?=
 =?utf-8?B?ZWZ4YzVzWE9nYTkzbyt5aUNrbTg4U1ZoVE1aREYrUFNsUUt0THl5Tm5RQ09P?=
 =?utf-8?B?eUlDd3NoWjRPVnpzeXBhWTF3NlNCYUJ4SXlaVXVjTGora0dmT0ViVCtrOVpD?=
 =?utf-8?B?b2ZaeGYvQVFyVGhvYTNjaDJuVERuT3E1SVk3UVVOSlJ6MXBiby81bFdWSXNO?=
 =?utf-8?B?azlOSFlqMmc4ZzJvWitwT2d1dm0wVlNrZmY1VDNSSGJUb21ybFRhS3dFMTVH?=
 =?utf-8?B?MitnbWdIdTU0UDF2RHd2dENXSHhJNkpqY1YzUE8rbng4aW5VMCtTZUJ2Qy8v?=
 =?utf-8?B?QnZ6UmFPT0dnWkVPRFR0RGU3Wk9oSVZDTGhLeVJiK2pGd3JkMWdweWppeVRI?=
 =?utf-8?B?N2xwOGo4dzJyRzNGMngzY1lWeDNQRWZzWi9md0xkbXZqcUduR0dWaVR1OE84?=
 =?utf-8?B?TG1lOWxQNlp5OHNNNFlnNGJSUS9oTzJzbFY5cSswRnQydDl6T2FhRWtVUm1i?=
 =?utf-8?B?VzhVeS9obkJwcXdJbEVwYXdMc0hoY2wzZWhGV1Z5N1VSemtKaHZ1d05sbTFB?=
 =?utf-8?B?RGR6U2t0aWtsdzd5RW81VC8wNEQ1MWVEdzRvN1NsbjQwU1N2S2Z0cjFHbWE5?=
 =?utf-8?B?MHczTlpyVVBEL3pHUzlVVHFKSHRldSswM0dYVnlWWUtTbS9uRE5NNDJnVDUw?=
 =?utf-8?Q?3cznF5cImnpJl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVNiUTVzQ0sxUk5vdlhtbytaN056UjRjWXZHV2RZNFQ2aXNuejJTTFVEVG1Y?=
 =?utf-8?B?S00rZFo4cUZMMTB5a0NNbVZoRUxjcXRONVVhdUlWRmY3djFvcjJTdkkvV1di?=
 =?utf-8?B?dEZSNzJQQ09tbzFHZnRIaXdKclhnRHJDM05NWHl5dDVTVHdEeTZPak9xU2tt?=
 =?utf-8?B?V01WYzB2YUpqMG13bmJrZmhCOGlJdTRGRVpFWjM5eFEzVXpndExxekJmZjM3?=
 =?utf-8?B?UC82eTdLU2tjYTBwV3g4NldqYkp5T0s5UkdQd3NtUGNQRnBMWW5MTnRaKzZ5?=
 =?utf-8?B?K0ZLWmt2VTJUQ1dObUlwdXppeW05TmV1TlBpNGJjeDFZZ1dtaVdVZWt6MkFn?=
 =?utf-8?B?djdKYWRZZUpVODEwQVZOS1BaTlU4MTJPb2RCSkd1Sjg5dk0yYTBaYThmY3lq?=
 =?utf-8?B?Sy9IcGp4bEZGMUNINzZHZmpyZVFlWVVHSTROMWltZ2QvWjlqdnp5amFFSHAr?=
 =?utf-8?B?V2N0M0ZycWlOZGtVcUt1ZFAybXVXNEs3U3hVRjEwQTRkWkc5YzBCQXRrU3U1?=
 =?utf-8?B?bGdGcGd0dGd2UXlxSkJhVzNDWi8xMHNaYjNBR05KaFBUd0tHR1JJTzgyamo3?=
 =?utf-8?B?VXlJUTkrZUF1WlJINGlNK2pSckd2UGNZNFVEdlJaZkltcDZmTkRCNTdaT1Fv?=
 =?utf-8?B?SFN4MkVPN0VhYTZreCtTQURWSG1KRFZvbjJxYmVuYWRlalNyZzg5SjFUOHFU?=
 =?utf-8?B?V3BzUUdhNHRkT1lEWTBqU3RHOG82ZmN3YUhWRzIvV1B4bEN5RmdiY3llSDZ1?=
 =?utf-8?B?RUJXcDk5aytZb004aHlEQUdLSm0rVGVxZHMweGRJakV2T1ZPeldWek9xSlZr?=
 =?utf-8?B?UlF1WCtaamVVR3BsSHBDMml5bUJxcjZiYkZUekNYdU42SUp0MDJGbVBRc0Y3?=
 =?utf-8?B?QzVBd0ZCVHVybVVjc2ttLzkrV2IwRVFFRnU5WEZtR3FIMDhyd3ZVaWN3ZWpV?=
 =?utf-8?B?QlZZRkdBRGpWeXowdjJydkF3c0pLMXg0UVdIRm9XVUY5NWtYMlJGZEVhUCtx?=
 =?utf-8?B?U3hMMy9peEM0a0J3RDZOQlFyK2crMFhPVUFFRkdmaE05ZUk3aDdSamtwcjVz?=
 =?utf-8?B?MWNtTHRIeW1QR1pRZUdYbjVsYlZTem9oL0pzdWd2UWQ4elpMKytXRGI1eCtE?=
 =?utf-8?B?Vk1DeG1xUnNrVTZYTkVvclVwY29yY05lVjhMamRXa2U4amMrTlh2aDFqZld2?=
 =?utf-8?B?RjNvdHFFVzZmdHBENGpYZCtTNWNxTFJ2d0VmRWNKTzdORk91K1FoRkhkOWtm?=
 =?utf-8?B?emNMRUNRVzlLWlIyNE9ZdFNmeGlVYk5lK2VKOFMvNHoxMUN4dTdGaXZMZ2V3?=
 =?utf-8?B?QW81aWhJekphNmx1UG9ENzRLQmNjK1hMc0lENzNFY2VEOG1wODZreTFwakMy?=
 =?utf-8?B?NWpoRTZPNHFuakdwT29pSjBBUEdYSUFDTHl2NjZrOURnWkVsQjhJMWg5V1ov?=
 =?utf-8?B?TXN4NjRjUjB0ZWxhSzl2THIvZGN0UFlaVE5TZlBTT0FmN242UVlZZHA1cThV?=
 =?utf-8?B?V2dzUjMyb1JKTUU2Z2YzeStzVGJ6eWRIZWhSUVVZdW5ValU2TEZmbEJaUG5V?=
 =?utf-8?B?WXd5VVpGa3JKclN4ODJRak5pZ1FZbVpoWWI0aW13Y1lDMDZ5MGt6V1pPYmJq?=
 =?utf-8?B?c2l5VGFndnF4dUlKL2w5a3FPTTYvNTVZVzFNaUhYc25EMXUwcy9yNVdGeHJB?=
 =?utf-8?B?QkowZ1UwdXJFU2F0aVpTc2poZEc5NktTM0hGZWZna0k0MmF5MnRzaG5xbWtY?=
 =?utf-8?B?aVExaWJxSDV2aXF3V0hCWE5GUEc1ZURqUXVDUVBHZTZZaUdJNWV1UFJ5S1N3?=
 =?utf-8?B?U2lEaEluQzJkMURnWnY4R24wUGZ3NStDLzNwVStHelZXZVllNGNZVjZXeHI4?=
 =?utf-8?B?M05Ya2dTRDYrUzRJbDlDOVhsYWVhOFM5bEZUUEF3SFBNRUZYV1VQc0ErWUpu?=
 =?utf-8?B?U0FTOGJtVzhCZ24zaUV4dTNualdkeVNrYW54cTV6bmpZUDFtdFJiQTBrZmYw?=
 =?utf-8?B?RmQzN3BDc3FBbm51Q1h1bTBZdUpWcEtJbkM0M3J0Tk1BNWI2dHdDU0pFYnBu?=
 =?utf-8?B?OEEwZ1ZSVElJUXVBeFBWNXNCM3NHZW5oUnREMlBJaUJTa0JhdG1SU0c3b3ZL?=
 =?utf-8?B?bHBBY2hzd2xCWTdhek9QaEIwWDV2RnJ1bm1va01GalZRQXZ4L0JQek1jMEZk?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1530780-a2dc-4b59-de62-08dd46d889b4
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 18:03:19.6115
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54yxAFScNwocrpfKNoJDCmXYZVOUNQn5q5AxpCg8fzMwl37VeXVbfy3KFGVq8WEwVXoOrGm2by5jsa6LSmynfKmysnYMZoVgAGvrv3pN8Rk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8702
X-OriginatorOrg: intel.com

Hi Babu,

On 1/22/25 12:20 PM, Babu Moger wrote:
> Assign/unassign counters on resctrl group creation/deletion. Two counters
> are required per group, one for MBM total event and one for MBM local
> event.
> 
> There are a limited number of counters available for assignment. If these
> counters are exhausted, the kernel will display the error message: "Out of
> MBM assignable counters". However, it is not necessary to fail the
> creation of a group due to assignment failures. Users have the flexibility
> to modify the assignments at a later time.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
> index b6d188d0f9b7..118b39fbb01e 100644
> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
> @@ -1557,3 +1557,30 @@ int resctrl_unassign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d
>  
>  	return ret;
>  }
> +
> +void mbm_cntr_reset(struct rdt_resource *r)
> +{
> +	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
> +	struct rdt_mon_domain *dom;
> +
> +	/*
> +	 * Reset the domain counter configuration. Hardware counters
> +	 * will reset after switching the monitor mode. So, reset the
> +	 * architectural amd non-architectural state so that reading

"amd" -> "and"

> +	 * of hardware counter is not considered as an overflow in the
> +	 * next update.
> +	 */
> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
> +			memset(dom->cntr_cfg, 0,
> +			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
> +			if (is_mbm_total_enabled())
> +				memset(dom->mbm_total, 0,
> +				       sizeof(struct mbm_state) * idx_limit);
> +			if (is_mbm_local_enabled())
> +				memset(dom->mbm_local, 0,
> +				       sizeof(struct mbm_state) * idx_limit);
> +			resctrl_arch_reset_rmid_all(r, dom);
> +		}
> +	}
> +}

I looked back at the previous versions to better understand how this function
came about and I do not think it actually solves the problem it aims to solve.

rdtgroup_unassign_cntrs() can fail and when it does the counter is not free'd. That
leaves a monitoring domain's array with an entry that points to a resource group
that no longer exists (unless it is the default resource group) since
rdtgroup_unassign_cntrs() does not check the return and proceeds to remove the
resource group. mbm_cntr_reset() is called on umount of resctrl but
rdtgroup_unassign_cntrs() is called on every  group remove and those scenarios
are not handled.

To address this I believe that I need to go back on a previous request to have
resctrl_arch_config_cntr() return an error code. AMD does not need this and
it is difficult to predict what will work for MPAM. I originally wanted to be
flexible here but this appears to be impractical. With a new requirement that 
resctrl_arch_config_cntr() always succeeds the counter will in turn always
be free'd and not leave dangling pointers. I believe doing so eliminates
the need for mbm_cntr_reset() as used in this patch. My apologies for the
misdirection. We can re-evaluate these flows if MPAM needs anything different.

> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> index 2b86124c336b..f61f0cd032ef 100644
> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> @@ -2687,6 +2687,46 @@ static void schemata_list_destroy(void)
>  	}
>  }
>  
> +/*
> + * Called when a new group is created. If "mbm_cntr_assign" mode is enabled,
> + * counters are automatically assigned. Each group can accommodate two counters:
> + * one for the total event and one for the local event. Assignments may fail
> + * due to the limited number of counters. However, it is not necessary to fail
> + * the group creation and thus no failure is returned. Users have the option
> + * to modify the counter assignments after the group has been created.
> + */
> +static void rdtgroup_assign_cntrs(struct rdtgroup *rdtgrp)
> +{
> +	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
> +		return;
> +
> +	if (is_mbm_total_enabled())
> +		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
> +
> +	if (is_mbm_local_enabled())
> +		resctrl_assign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
> +}
> +
> +/*
> + * Called when a group is deleted. Counters are unassigned if it was in
> + * assigned state.
> + */
> +static void rdtgroup_unassign_cntrs(struct rdtgroup *rdtgrp)
> +{
> +	struct rdt_resource *r = &rdt_resources_all[RDT_RESOURCE_L3].r_resctrl;
> +
> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r))
> +		return;
> +

It looks to me as though there are a couple of places (rmdir_all_sub(), rdt_kill_sb(),
and rdtgroup_rmdir_ctrl()) where rdtgroup_unassign_cntrs() could be called on a system that
does not support monitoring and/or only supports cache allocation monitoring.

In these paths it is only the architecture's resctrl_arch_mbm_cntr_assign_enabled(r) that
gates the resctrl flow. I think rdtgroup_unassign_cntrs() and to match rdtgroup_assign_cntrs()
can do with at least a r->mon_capable check.

> +	if (is_mbm_total_enabled())
> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_TOTAL_EVENT_ID);
> +
> +	if (is_mbm_local_enabled())
> +		resctrl_unassign_cntr_event(r, NULL, rdtgrp, QOS_L3_MBM_LOCAL_EVENT_ID);
> +}
> +
>  static int rdt_get_tree(struct fs_context *fc)
>  {
>  	struct rdt_fs_context *ctx = rdt_fc2context(fc);
> @@ -2741,6 +2781,8 @@ static int rdt_get_tree(struct fs_context *fc)
>  		if (ret < 0)
>  			goto out_info;
>  
> +		rdtgroup_assign_cntrs(&rdtgroup_default);
> +
>  		ret = mkdir_mondata_all(rdtgroup_default.kn,
>  					&rdtgroup_default, &kn_mondata);
>  		if (ret < 0)
> @@ -2779,8 +2821,10 @@ static int rdt_get_tree(struct fs_context *fc)
>  	if (resctrl_arch_mon_capable())
>  		kernfs_remove(kn_mondata);
>  out_mongrp:
> -	if (resctrl_arch_mon_capable())
> +	if (resctrl_arch_mon_capable()) {
> +		rdtgroup_unassign_cntrs(&rdtgroup_default);
>  		kernfs_remove(kn_mongrp);
> +	}
>  out_info:
>  	kernfs_remove(kn_info);
>  out_schemata_free:
> @@ -2956,6 +3000,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>  
>  	head = &rdtgrp->mon.crdtgrp_list;
>  	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
> +		rdtgroup_unassign_cntrs(sentry);
>  		free_rmid(sentry->closid, sentry->mon.rmid);
>  		list_del(&sentry->mon.crdtgrp_list);
>  
> @@ -2996,6 +3041,8 @@ static void rmdir_all_sub(void)
>  		cpumask_or(&rdtgroup_default.cpu_mask,
>  			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>  
> +		rdtgroup_unassign_cntrs(rdtgrp);
> +
>  		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  
>  		kernfs_remove(rdtgrp->kn);
> @@ -3027,6 +3074,8 @@ static void rdt_kill_sb(struct super_block *sb)
>  	for_each_alloc_capable_rdt_resource(r)
>  		reset_all_ctrls(r);
>  	rmdir_all_sub();
> +	rdtgroup_unassign_cntrs(&rdtgroup_default);
> +	mbm_cntr_reset(&rdt_resources_all[RDT_RESOURCE_L3].r_resctrl);
>  	rdt_pseudo_lock_release();
>  	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>  	schemata_list_destroy();
> @@ -3490,9 +3539,12 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>  	}
>  	rdtgrp->mon.rmid = ret;
>  
> +	rdtgroup_assign_cntrs(rdtgrp);
> +
>  	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
>  	if (ret) {
>  		rdt_last_cmd_puts("kernfs subdir error\n");
> +		rdtgroup_unassign_cntrs(rdtgrp);
>  		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  		return ret;
>  	}
> @@ -3502,8 +3554,10 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>  
>  static void mkdir_rdt_prepare_rmid_free(struct rdtgroup *rgrp)
>  {
> -	if (resctrl_arch_mon_capable())
> +	if (resctrl_arch_mon_capable()) {
> +		rdtgroup_unassign_cntrs(rgrp);
>  		free_rmid(rgrp->closid, rgrp->mon.rmid);
> +	}
>  }
>  
>  static int mkdir_rdt_prepare(struct kernfs_node *parent_kn,
> @@ -3764,6 +3818,9 @@ static int rdtgroup_rmdir_mon(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	update_closid_rmid(tmpmask, NULL);
>  
>  	rdtgrp->flags = RDT_DELETED;
> +
> +	rdtgroup_unassign_cntrs(rdtgrp);
> +
>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  
>  	/*
> @@ -3810,6 +3867,8 @@ static int rdtgroup_rmdir_ctrl(struct rdtgroup *rdtgrp, cpumask_var_t tmpmask)
>  	cpumask_or(tmpmask, tmpmask, &rdtgrp->cpu_mask);
>  	update_closid_rmid(tmpmask, NULL);
>  
> +	rdtgroup_unassign_cntrs(rdtgrp);
> +
>  	free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>  	closid_free(rdtgrp->closid);
>  

Reinette
