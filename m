Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C094926B768;
	Tue, 24 Jun 2025 23:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750807913; cv=fail; b=Uco1COTXngScpOQD8F8yHjiJm0Z5nj3LAZcBxPmQPOdEW8o/oLE+WareNclgr17hk4kNXD5f13p5eH7NfrALY46hJFx5vTah9Q2dl5hRCuLdp6GAdiDXRbyxehuSX4GDqQ8CKKu2GKwplf1SuPhUGC6MKTGkgght6I26kc+SR7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750807913; c=relaxed/simple;
	bh=+ulsCr6IG/BACyXZC0niSBRo/ZocVRyGdonwmiRqIN8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RhyRsZvxJWAWF0t1CULc7drkL2peZWYpbXpmqAc6vlwZLZP9lQcGJimSStUQY+MX0ZHCBBkfbMEoTtH3eDTNnSCjsXqiDAvDGYRvHgxEbNp2dvs9Yr+ME8i1dblpsEOLBa47RvowAkgu6BI1CITFHC3uAAGyLREMrRS0hP+WDHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J0FMUguE; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J0FMUguE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750807912; x=1782343912;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=+ulsCr6IG/BACyXZC0niSBRo/ZocVRyGdonwmiRqIN8=;
  b=J0FMUguEnqpk41KFya2abWiqlCdQehEInXvS7mWnTlJyhy8kUKC2OQXW
   lkEDxoSi3/wfxV57yu4wmA1kJDv2U9GhZNOhmHE4PE27YUy286CtKS1zM
   02R2MlGXym7W+WDqVCLsCi9OAtZeawzn+XOJV/H2Q1qW91UGDzQYVPMSH
   YPweEEm6ZYMZ27wjawyptDkJSy4bPQcQ5dHh61x7uZLE9KJvNoycR8uyv
   eDbvlnihXGIbOh1V104IfdqsuZLgGk9zz/HLJsgpz9u14ohWcpKXPzRE0
   yF5VY7s2DLz5hQJL9V/r1PXR1+rnyLWy/D1uFqFUDgePcObW6G1RA5LeQ
   Q==;
X-CSE-ConnectionGUID: +QtRNCxmQ3yzyDmBrA2Q9Q==
X-CSE-MsgGUID: fQT5CwumQF6bPDXGsCIkOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52786788"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="52786788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:31:51 -0700
X-CSE-ConnectionGUID: psS3e4fPTkWrfvQzevnO4g==
X-CSE-MsgGUID: UYivCd9oQIOdyYuNomxe7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="182935991"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 16:31:50 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:31:49 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 24 Jun 2025 16:31:49 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.80)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 24 Jun 2025 16:31:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZwonAZm7og3LkQ+0NBIj4yohr6FkghQnbhOEP5LVonTxZuuKpSmqqo1qw/ATJB1NzJ36PwPfFIbup8RIGa9zNjKAQHCgy4nWyNpJcsPp+HhNPBMgdlad1agmHDfCHHSMne1G0Km1qSlCpGJ1Y4MDAh+7dKyQrBsehdL7BKp22lm3m3HjpdcANBSE951TgsFgxVfreoetCp+D5Vwnx5rHu4QsoalP1am1ANrv7rrxINZtxFr9Wp+ZPa695A6ciAFE7x4S62KkiBLojO1GYc0klDtUISnz1Hck/H17psjQ23pmtbxprJA/xX8on/VQUHIz2XVGS9QRWckr1zC+ziWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cVZ5+BXeQYhyIoobx6ZPbZ2gQNmPBKZUkeI0zf3WTG8=;
 b=cLjDuzCuJldZngh2ugjVPdLyVLLAQqMOd+CdFuEQoyKhGkPtSO9bbPSQ6L/UYPfZsPZJPgRBXhzOY6cpx6OoKaaFMyKNaS07WWikC418iaKrFPajRNUtXDnhtQkJdKBYtFjeOwxR5YtZa8CTv0Wym1mBEDxTndYl9UhGRdADUd/Nl0xTH932uRu3q0DwxrBjMpzRRwzLuXZ5An9gHOA/Q8vFQ9STyigUzn5vUrbd5JuKJ1YsNWctfZAmYKzu1b85uO4V8nSUrVJRoIP55u/t9c5CCsNzOkqslLNyqUAZ9Zfhhg8YPcfKrXuLkaUb04LlBJc7iuq0bY6kEyefaBg9GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by LV2PR11MB6000.namprd11.prod.outlook.com (2603:10b6:408:17c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Tue, 24 Jun
 2025 23:31:40 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%6]) with mapi id 15.20.8792.034; Tue, 24 Jun 2025
 23:31:40 +0000
Message-ID: <887bad33-7f4a-4b6d-95a7-fdfe0451f42b@intel.com>
Date: Tue, 24 Jun 2025 16:31:37 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 13/32] fs/resctrl: Introduce mbm_cntr_cfg to track
 assignable counters per domain
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
 <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <1a3ed4abaaebbcf2399068ef5004760e8722d9e0.1749848715.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0276.namprd04.prod.outlook.com
 (2603:10b6:303:89::11) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|LV2PR11MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 36b634d4-98b0-47df-19fb-08ddb3774546
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alJRdktlcXpKbGdqUndjT1psNXR2TzVONVZsVFM5bXpYTFpLWXRmaDBHRUdx?=
 =?utf-8?B?QnNzcmJ6VTVQbGRzOEE2alRnU2xjZGNSRjloRUJXbTc5UFh3d2x1VDB5QWhI?=
 =?utf-8?B?czhnNWNGd0ZkQjVZMDFVMFFkRXppdjBjaWhTd0FOV2VGeS9uYUttZnQ2Y0lY?=
 =?utf-8?B?aWZXdGN6YmxOSWVZSU9JRVc4VCszYUh4S01CRm91L1g3ZU5BbkxMNzFJR1FR?=
 =?utf-8?B?ZkhEb3FjUmcvOGN2ak1UaVBueW5ldnBQUzFTeWRUa1gxUWtsZ1ZpdWsvOXdX?=
 =?utf-8?B?KzJ3b3RoT1FyU0xOQlF1c2NPdmQzU2haQTYyMGRNV0t0T2JSY3gweFdVbTBy?=
 =?utf-8?B?ellsMkFoQmhsZFZESEltcXh3b1RVTlk0WlpOaWNNWXZEM0J4ZE45U0VpYy80?=
 =?utf-8?B?cDdIVE04c0t4dzhndnlIQkJoTi9TZmZBVnpYSmh5SGlJNXZJNW9Xa3ErNy9w?=
 =?utf-8?B?Y1JUdDQra1hPQXNkclVNZS9STXZLWmVuQnNqVkpNOS82ZzV3endXaHY0SnZ2?=
 =?utf-8?B?R2tRNVYvc2lYcnREZ0dUK1BFNTNMUmhtMVpLaFZYLzJLcmVwcFNwZWlCMVQ0?=
 =?utf-8?B?anAralc2ZzE0MzNQZTNWNnRUVlk2ZzMyWnNOK3BCb0Y2VHVocitjbGdDU3Q3?=
 =?utf-8?B?ZXBYZHNvMVAwdDF5UXl3aUJKNkcreFZ2UUVpKzJFaU9SOU5DS1g3N1lueU5T?=
 =?utf-8?B?SGdZTDZYVWcrZkF2RFpSd0FKWWNkWVg2bUpSWndiZE1TSE9XRFVqRGRXdGFm?=
 =?utf-8?B?SjBBcTBCNE5SNTYwdHRuWXFCK2tCcGl0YkpTUHhQbmcvQ3gvMjVidVpDUXIr?=
 =?utf-8?B?ekJqUlRDM01id3VVdWtsT0dKeHBHL29VTDdDRXZBOFlWc0E0NTZadzA2VVgw?=
 =?utf-8?B?SmdsV3Zybmd0cmNtTzdXSmZ6UlJTRHNHb3B6WURidU9zbEJKaFVLNFBGcTBy?=
 =?utf-8?B?RlFhQ1FVOUpqTHF4aUM5aVVBWFdPbHYvcDMrTUE0OUtZL2ZlaVZsbFZvV2lM?=
 =?utf-8?B?TXBQeGNQSU8xTUk2Y3k0VDVrd1o2RVlUU252YzQwdFcra1B2dm55MWY5eHpE?=
 =?utf-8?B?RzVyVTk1ZmpncURSeHFsbFhiaFVnNXFxc01PRXNadDAyY2pGZWN0c2kwYjlv?=
 =?utf-8?B?SUgzSlNQZ1NlTGFPdnRvN29XNk1BMU56MjhQOTFrdUtGdjJyRHg4TjJERTc3?=
 =?utf-8?B?OTlBRmErNFYyeE9vQW9oNkwwQ0k5cmRUcElseWJwOFlUbEdlZWJvQ1ZZTzBC?=
 =?utf-8?B?TnRDY0dpeVR2dHFkd3YwN0dmT2s5Ni9xNVhIWHpnL0c2L0F0bS9CelZqeXhw?=
 =?utf-8?B?UEpaeXc0ZSt3MndjSmdrcVYyMTBFOUREekJ6dFd5eVl2TS81d3NCdmZBaHZ6?=
 =?utf-8?B?UnVCclRtRG9QZGkvRG9RMEU4eVJwWFlLanhsT0ppQUk5Zk03NGZOSGJEU3p2?=
 =?utf-8?B?YzR1WXBiSmJBTHVRY29TVWlZa2I0NFFEUGx6dXBGV20ydmJETDMvQ0l2eUdt?=
 =?utf-8?B?eng3azYzWXdxZlhyQWg2UitXWTRQbFBDbjRPOWZnVGhiL0tZR256Z2t1cEpr?=
 =?utf-8?B?SnBiT0JTdWcvWmg4YjhuS1RuUHlGWUVnV3lpbWVIQlZUeFVOTkNDT3NnQ2JS?=
 =?utf-8?B?WG5BTFJQaStLRVBlNCtGTzloL2dhbE9mRTZFcHZxQUx1RklwZHE5RFBRaUtL?=
 =?utf-8?B?M2E2VWJqM1lUQ21IMTR0ZThzcG9rRERSbS9ocW9jbkJLU1ppeGhET054eHZJ?=
 =?utf-8?B?Q1FqeDAyNHNzQkZ4ZHo0NlJXalpacE9vNHlHdG1VbVg3NDd5dVhkTUtNQWU1?=
 =?utf-8?B?WGtTSUdYVit6dERYcEFZU0dKVEVTcHdvZDcxTGVaMklURDZTOXNHZDhtZWQz?=
 =?utf-8?B?dVFVQzB2NFdERU5OVHkvN3ZWVjdWMXFGNmRwR1J3K0FCNkhMbU1Jd0RQMmVi?=
 =?utf-8?Q?EIqRDxNFjSA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWY2dGZab0Izem5iK0dhT0RlMVc4bGxzYSs1Z3VZdzlNUko4cTdvKzNGbklX?=
 =?utf-8?B?QWtMRTlSS0I1S2R4WVNyd1IyU2lETXppSGs0RFY1YmN5dHZlVFc3ajV3Tlc0?=
 =?utf-8?B?aUpwSUY0YjU4bm5MOWZaMFJYOU05M1hHU0JoNWJrT0wwK2d2SlBRVlgwV1Uy?=
 =?utf-8?B?Nlo3a29aZ3NXVGVWSk1PWGNjNHFjUTZsMktyb1lXcDhZNWVpK1J4M1FVcElr?=
 =?utf-8?B?WncrMXo5eHB3S0VDVGF0R0RocUhOUmZEWXFsMHR3bUQ3amdUQldZQUUvRUI5?=
 =?utf-8?B?R3hmZEpoWHIrTjhIbTUrdUVUZnd4UXU5NDhyZTEwR2NXciswY1BUM21xd2Fr?=
 =?utf-8?B?RldkTzVrOGt2QWJnSHpPR1pUR1Y0ekM1VEMyY1dZSEVXQ05zREVTei9HUmhF?=
 =?utf-8?B?WHU3U0huM3kwOUVYbldHZk5icUZGZ0thWVAySXFESFd5Si9wcG9WZVNhMW56?=
 =?utf-8?B?ZElhNVpBbWNyWHFFU3hxYzcvVDZkRXgzTGRLTFBQeElGNS9Lc1lSbmpaVStm?=
 =?utf-8?B?bEp3U3h6V3lwZzh5bTREdEJtc3dqNUdKSGFPcS9Ub3kxYmdLMVQ4V1AvWTJl?=
 =?utf-8?B?aHRjREtkeFJ0b01ScDVhK1lHZDNBeis4YWFud2s2SFVTS2lzbkMrQy9WMFc0?=
 =?utf-8?B?cU05eTNON25Zd0gxVlRwclFtZmxmZHZxYXRYQ3dueHUvU3B0VUxGaFYxQ1hL?=
 =?utf-8?B?UWJGcVBvcjdaYUdGTGN6QXl5QUI4VU5IRDIrZDB1MFhhK3hsTG5pT0VOQ0Fh?=
 =?utf-8?B?V3pTSnh4RE51eURSN1JvUFl4b0p5REtzS0M0QVdyNnNpWlgzd0lPZi8yMnNj?=
 =?utf-8?B?Y0VaYm82ak56Umh1S3MrdGI5cTlvK1B1cU1CN1IvYTI0bFJhbnBwVndkVEhk?=
 =?utf-8?B?OUY5UHdrZ2JQL0sxWFYrSFpiOFIrMGJLTUZKaDAzSUNWVlBFR2pGTndySG82?=
 =?utf-8?B?dEwwdWZudithR09neUEvaDJVL2p2VHdpZG1sUmRrMFdjNVlOTU9Xb3RyVEE3?=
 =?utf-8?B?bGViTGQwOWgyQWhLVzc4YmVjT3N4ZnFvSVYycFJWK3ZWVmhKNVVua0VTMWNH?=
 =?utf-8?B?TWt0ZjZ0bm1WK0RqL1JNdmJ2VXZDNDAxUW1sWjVOK3pNK1o1dXorZnFib25X?=
 =?utf-8?B?bGxBWGEvbHppQnJMQWVBWlU2QmNzMG5lU29QY3FLYkk0S3ovN291MFBYc2tv?=
 =?utf-8?B?WXVWWXZTNnRKaVh5c09PeGFBUEhGT0MwVFZXcXdLR0pSRWNqVkdaSnJkcEpa?=
 =?utf-8?B?dkx5NTFvajRiQ3A0UXlYNmJhUWx0SzNZa3ZhQytpaWZaUENla296ZzJEWVNB?=
 =?utf-8?B?ck1ZQVFvVitwNTg1ZHY1dFRCb2JmRVdMa24ybUt6aGl2VkhSY2xDdGFYUUZW?=
 =?utf-8?B?eFBKd3E1RlNaU3Y1REFQYTNYckU4YWo2aHhxOXNnL1VOTUJxbVg5WjcrVi9r?=
 =?utf-8?B?RzZEemdVbDBLMU01ZjF1eFRSRTc5QlE5YkJzb3BmUHJTRG93ZWFFczNONW1y?=
 =?utf-8?B?ZXhtc1Qwb3J3SVVrV3FYT1l1bEdrdW15NFhWUGx4Uksvb2lyd3F1OENZMmFC?=
 =?utf-8?B?UmoreG0zdUhMWE93RlR1d1piWWRJZnVydU1mRmlQcGlYVlVMNEYvSVJaTTRX?=
 =?utf-8?B?WjBpZFMrV2liMGpQYk9JaVk1RHp1Qlo2dVpBdmZ4TkNhaWljZGFyVFpXdXFV?=
 =?utf-8?B?djdLNEZGV1NRWDJNZ1c0MjFFNU9YMzV2cFZ2ejBaRHZJaHpxWDI3ZGtSOUwv?=
 =?utf-8?B?QVpvUnEvN21Yd2V2WjUvRXVEaXJFdFV0aVduY0pqZ2hSWmpBOHo1bTBMRG14?=
 =?utf-8?B?NXBaNy9TaTVaQjB2ZFBwYzR3VzF4cVQyN2M1UFlLSWdKZElqWjBmME5ZeE9a?=
 =?utf-8?B?NnN6Tm1ZM0VEZG1iaFdmQUpvR2lPeVhTUVROY1B4blFXUEJsMGJUWFMrVENs?=
 =?utf-8?B?QkcyQ2NxaHhmYURXcEhZdmgwYitONm5HQjNXNkF1YlZtK01zL09YMFE0ZDQz?=
 =?utf-8?B?Z3JNZlFneTRSNzBiRXJHQ1BnS01PdCtoU3M2NXBBcXR5d2tGRklrU3dpTS9W?=
 =?utf-8?B?VXhRTTlQMlM1TUtYRkRVQ01aKzU3OGVLUEJMa3I5bDFnL3U0QlpYTEFBclUy?=
 =?utf-8?B?cGpzT3NYYlA4VHN5azBIREwxSTBIZlRFSE9BZzZOaTNiclBZOUNnTFh6S1Z6?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36b634d4-98b0-47df-19fb-08ddb3774546
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 23:31:40.2360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQzBJTwE48vlrpHdFRKPYMue+YG4G8a2xyy6qO3maaJTO4njVIj8EFmPk6ayMoAM58L1yzHDMdxQ3TRowed7TPNkr2xpGY6Dhb4XV/08S+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6000
X-OriginatorOrg: intel.com

Hi Babu,

On 6/13/25 2:04 PM, Babu Moger wrote:
> The "mbm_event" mode allows users to assign a hardware counter ID to an

"hardware counter ID" -> "hardware counter" (I'll stop pointing these out)

> RMID, event pair and monitor bandwidth usage as long as it is assigned.
> The hardware continues to track the assigned counter until it is
> explicitly unassigned by the user. Counters are assigned/unassigned at
> monitoring domain level.
> 
> Manage a monitoring domain's hardware counters using a per monitoring
> domain array of struct mbm_cntr_cfg that is indexed by the hardware
> counter ID. A hardware counter's configuration contains the MBM event
> ID and points to the monitoring group that it is assigned to, with a
> NULL pointer meaning that the hardware counter is available for assignment.
> 
> There is no direct way to determine which hardware counters are assigned
> to a particular monitoring group. Check every entry of every hardware
> counter configuration array in every monitoring domain to query which
> MBM events of a monitoring group is tracked by hardware. Such queries are
> acceptable because of a very small number of assignable counters (32
> to 64).
> 
> Suggested-by: Peter Newman <peternewman@google.com>
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
...

> ---
>  fs/resctrl/rdtgroup.c   |  8 ++++++++
>  include/linux/resctrl.h | 19 +++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index 967e4df62a19..90b52593ef29 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -4084,6 +4084,7 @@ static void rdtgroup_setup_default(void)
>  
>  static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>  {
> +	kfree(d->cntr_cfg);
>  	bitmap_free(d->rmid_busy_llc);
>  	for (int i = 0; i < QOS_NUM_L3_MBM_EVENTS; i++) {
>  		kfree(d->mbm_states[i]);
> @@ -4167,6 +4168,13 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>  			goto cleanup;
>  	}
>  
> +	if (resctrl_is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
> +		tsize = sizeof(*d->cntr_cfg);
> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
> +		if (!d->cntr_cfg)
> +			goto cleanup;
> +	}
> +

Please see my earlier comment https://lore.kernel.org/lkml/b761e6ec-a874-4d06-8437-a3a717a91abb@intel.com/
Before this addition the "cleanup" goto label can only be called when
(a) idx is guaranteed to be initialized and (b) d->mbm_states[idx] == NULL.
Using that goto label in snippet above cannot guarantee either.

>  	return 0;
>  cleanup:
>  	bitmap_free(d->rmid_busy_llc);
> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index f078ef24a8ad..468a4ebabc64 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -156,6 +156,22 @@ struct rdt_ctrl_domain {
>  	u32				*mbps_val;
>  };
>  
> +/**
> + * struct mbm_cntr_cfg - Assignable counter configuration.
> + * @evtid:		MBM event to which the counter is assigned. Only valid
> + *			if @rdtgroup is not NULL.
> + * @evt_cfg:		Event configuration created using the READS_TO_LOCAL_MEM,
> + *			READS_TO_REMOTE_MEM, etc. bits that represent the memory
> + *			transactions being counted.
> + * @rdtgrp:		resctrl group assigned to the counter. NULL if the
> + *			counter is free.
> + */
> +struct mbm_cntr_cfg {
> +	enum resctrl_event_id	evtid;
> +	u32			evt_cfg;

It is not clear to me why the event configuration needs to be duplicated
between mbm_cntr_cfg::evt_cfg and mon_evt::evt_cfg (done in patch #16).
I think there should be only one "source of truth" and mon_evt::evt_cfg
seems most appropriate since then it can be shared with BMEC.

It also seems unnecessary to make so many copies of the event configuration
if it can just be determined from the event ID.

Looking ahead at how this is used, for example in event_filter_write()
introduced in patch #25:
	ret = resctrl_process_configs(buf, &evt_cfg); 
	if (!ret && mevt->evt_cfg != evt_cfg) {
		mevt->evt_cfg = evt_cfg;
		resctrl_assign_cntr_allrdtgrp(r, mevt);
	}

After user provides new event configuration the mon_evt::evt_cfg is
updated. Since there is this initial check to determine if counters need
to be updated I think it is unnecessary to have a second copy of mbm_cntr_cfg::evt_cfg
that needs to be checked again. The functions called by resctrl_assign_cntr_allrdtgrp(r, mevt)
should just update the counters without any additional comparison.

For example, rdtgroup_assign_cntr() can be simplified to:
	rdtgroup_assign_cntr() {
		...
		list_for_each_entry(d, &r->mon_domains, hdr.list) {
			cntr_id = mbm_cntr_get(r, d, rdtgrp, mevt->evtid);
			if (cntr_id >= 0)
				resctrl_arch_config_cntr(r, d, mevt->evtid, rdtgrp->mon.rmid,
							 rdtgrp->closid, cntr_id, true);
		}
	}


Reinette
