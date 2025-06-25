Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01341AF0BB;
	Wed, 25 Jun 2025 17:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750874115; cv=fail; b=RxTZrmruMeJJbK3a1e8s+BBgjPjecbwb6KDP/U+kqIILYSC+pCcWrUssG00fknHJYxVBqpMzISUrTqz7AUg6LK6eYH/1KsLNcpZ042VNzrCZD0GxSWMbqcjIFvDmowflowcq7CQ4UiEjVT7v/EjG5KdN/RmhUqLC7MpE4BSnYoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750874115; c=relaxed/simple;
	bh=i2vHwqOwPnufhQJJj+v9pRJc6Z/fUJvhXoPvTT2csCo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VXl05iizMf/aJpIlDL/FMVJQ5x8yFCRSoMmBjs+oqMhH5V6o9lo4pw2vShqoEFzNN5V7YDb1moxdnXFq5gnSOJHNBdgfJM3txbvEfwEwB/gFIZkfHIKYC0effri2f3KYgrbEsNs3nPfdF2k6NnaXkV6LYDG2ck6h+ddzqdcclp0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lKf/aC6T; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lKf/aC6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750874113; x=1782410113;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=i2vHwqOwPnufhQJJj+v9pRJc6Z/fUJvhXoPvTT2csCo=;
  b=lKf/aC6TWTy+Ran7FMSNA3zdFMuwFlVWBaddNs92EZykaaxybcBUb5tR
   PWHW/qPHA4cRhZ6zZlZ6KZJgmvzhNzk9pws5PogmwCMppTIIAuvt6fCyt
   d9jLzN4LG87DDbvIhnwT71iy7D0cE/pwmjHL1GUczZ681kP6t8U8dBcub
   vU9H1Gu5B8JRJLaOe1liabZUepvlIPembTyTXS4JUcxMyZOQEj8wOA8Qr
   nnPbxfOKu9ER5T7kmh4H3CqWvghGWOcuSxQhR/Cdhtv59OH3pEZvScWT5
   KptGYC/EgeOjBCTlO2+I7iE+LomD6PE/y/1QD6BMxdb7gqbqIzbL3+fZM
   Q==;
X-CSE-ConnectionGUID: OWKHaWJ1SPqQoom2XB8HCQ==
X-CSE-MsgGUID: WDNCwQGqT3GcUt120eDzwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53119994"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="53119994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 10:55:12 -0700
X-CSE-ConnectionGUID: iQnNQ2klQD+O5jZOPQlqvQ==
X-CSE-MsgGUID: FFevrlhFRiWrATDJQQzMVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="156307801"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 10:55:11 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 10:55:10 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 10:55:10 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.48)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 10:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9QrAwWPKLV3U76zBsC6fne3a99zmjpdjjbYqh5HD3qCY+uSZ7p6ZBY+mueCGtBOQ2yUH9xVp7lg4ZMzS1f1/hc/ROAcg/stLuEgNjFcjKQvXp6UgAlYxc7OuYVWDf1JcPo84TkOosbgeqQqLhRQJbrIHhTDw9QUULUILMUSdacoCuC4rsdQAS1VTmRbqlfhYlhpgqjqj2ZGseRBoyOhjwB6hj4hYtkcCyTZFwSCUgBXNmGMtr41461dThMmcGrXr6Z51crZ0r5wyS9xpLQqXfNHhCxJcFgfFeSzmF+iKBXwzi2fPZoMCfGElmd09cHvljsrmCNplrOL+FDP0r2U3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2vHwqOwPnufhQJJj+v9pRJc6Z/fUJvhXoPvTT2csCo=;
 b=hlQMyurCJQP2xWSm/3oBkeZjQwbW+yf1XJW4sgVCw9PU1qMBdbKsAkdJxi68PaBk7chd5QxMLoUpClPDw+2NyMitjxXVLtukAR2b/uQkV0I/Uya4UtSqU78exlZyRVRf93MQ0ezIzaQBSV73+NQeJ8MRHuh+C1D/FSREAZMtleq3DN2bE+tFqCPa/YRlNDBJYRbFAWrU+CQHsb+MmGF1LYnwwYd6QWpQA0c4UYD+GBFS7LZu0ZLYWMo1z68p+IcAxSsVGH6lZJzT9jGmK+z+A1Xc3HQC61q4uL8byH0Xy7YihblkOKP6OYpBvjckepJ3ARfgdil51yBoTJxpoX1C6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by MN0PR11MB6254.namprd11.prod.outlook.com (2603:10b6:208:3c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 17:55:07 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::acfd:b7e:b73b:9361%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 17:55:06 +0000
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
Thread-Index: AQHb3Kb7JExlpfuAXEiRZfn/4dIBhrQS5JwAgAE1rwCAACB1MA==
Date: Wed, 25 Jun 2025 17:55:06 +0000
Message-ID: <SJ1PR11MB60839D756E7D880DA0D2268BFC7BA@SJ1PR11MB6083.namprd11.prod.outlook.com>
References: <cover.1749848714.git.babu.moger@amd.com>
 <80689a762e59137f0d0297ee4ce0d31f070a3655.1749848714.git.babu.moger@amd.com>
 <e9eb906f-d463-4c1e-9e15-5ed795fe5366@intel.com>
 <09c1aa33-08f7-456e-9c15-323a29877302@amd.com>
In-Reply-To: <09c1aa33-08f7-456e-9c15-323a29877302@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6083:EE_|MN0PR11MB6254:EE_
x-ms-office365-filtering-correlation-id: 9ee9058e-1e5a-476d-d6de-08ddb4116b91
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dlRxVWFhL1gyNTYxb05ON3plUThvMTJiRGlqTmJIaG1hc3FsMXdCUTdsaEVM?=
 =?utf-8?B?TmhEYjN0a3hXMXk4a05Qd2hKZFY2ZEx3d1dWR0VxU2xza01xaWdiT2R1MVJX?=
 =?utf-8?B?L1dQMnFmdkxDY1VBbXZjRkhDODB3TUtiQS90ZFdMZE01Q2RCdUI0SnZ4YlVU?=
 =?utf-8?B?dGkxMXVGNC9GQ292WGNlWWNUQm1xOUtZKzcvSjRxK3lubHpDUjVhUDlrNVlG?=
 =?utf-8?B?dFJCL3kveDhPR2pYSG9nZndadkJqclIzMlA3RURqM3BMTzZVU0xWcmhxU0Ro?=
 =?utf-8?B?VG5ZcDlrWUVSNXZPUzNaWTl0N2FYTmZYa0Qxb1VCam1PbUcrSDduSlBnQU1C?=
 =?utf-8?B?MjRoMFZXZVVKbDhrSzJ5S09RdkpuSVp0a3hBT1pWWXMyWmFhT1Jmc0R3WXlM?=
 =?utf-8?B?T2w1OUhKbGlDYVFuSzJTcHhBV09HYTlKR1RBazlPWFZVb1ZXT0w2TlRaRmEv?=
 =?utf-8?B?K0lhRmJGcVBpOVA2SlU2WVhxUlJ1M0hDOWl5UmJROVp6L1VrNXJpbGQxNmNG?=
 =?utf-8?B?dVlhdmluUEkzb0VFOFNiUzh0c1pWQ2RjQXcrLzZCRnNaWmtlN2p2NjJ5TktX?=
 =?utf-8?B?VXlNRUFnbm1aWGpXVFBQbGtRdmhxSmxXWVI5Z3Z2MHQ1ZVE4U3JPUVhVTVNW?=
 =?utf-8?B?MkNDbnJZKy9xQ1pFb2NISkJNSWlCNjZnL01kOFJqbnNJUFVqT3NZMDM3L1BX?=
 =?utf-8?B?L3YzYTIxQ3RmWDNIVnNXd0ozWWlNbHhScTF4YXJOOW53OEhTMFRnWC83dGRo?=
 =?utf-8?B?cFZIcFlGOXpqOENROFhvOHVnK1h1LzBud1IzMjRxclJOWHVLQjZrak1laEpE?=
 =?utf-8?B?Q2ZuTitXSUF6K2dkUGpKUkxINGhLVll3a3Q2NWJqQ3BLdGpITWZVT0RIZGIv?=
 =?utf-8?B?QmZUYnRXVG8wcCtXQjI2SUpIY052YnRLYllId3VVQ1VObktFZW56RE1uQXZ1?=
 =?utf-8?B?QmV5SGpaTmUxV29DZjRNbDNlT0RJbDBQSXlWRDl5NUNxRlJYalRNUEtDc3d3?=
 =?utf-8?B?bzdZblA4MnlMTGR4L25pdjZ3WGd3SlhoZTB0aTBMcmlIUlpzNHdxUVc5L3RB?=
 =?utf-8?B?c25sUWxVQ0VONytyUHorMHJqYXdaa0ZpU2VjUmRhSVRvT3N3Q2U2bmlzME1M?=
 =?utf-8?B?YW5MRUZCckxCaGZBNW5MRFN2R2xFeENHUVlDa3VVNUJQUjNvUXhhRzJ4dDA5?=
 =?utf-8?B?eVhZb3dEdExZVlJGajd2UVlEeThpbHhPcFQzWTlTRTEzeWRieWMzN0dJcEZ0?=
 =?utf-8?B?WjArOE1ObVFyZzlrdmxKQ0RWcnFzU3hOK0FYRXNROEhCbmZYZlM1a2RWYVNx?=
 =?utf-8?B?cHhUeEExTWFmSjVQTUZtNFRvUkdxQnRGUGQzbXVzWkdmNlU2WTJHY1N0SmFP?=
 =?utf-8?B?SXYxMXlSVXNabFR3Y3Zvek9ZU3JSMjRhd1FaaTVobG9rZkpVZU1ra3pNOTho?=
 =?utf-8?B?RXpuOXhpK1l4RUlzdmlLT29nQmFudGdkQU9lUVQ5eDhVRXJMN2UzNUNsbkw0?=
 =?utf-8?B?dFFlMWJSY2p3YXhTRU56UXc3SlRzMGRndCtXT0w5aXZONElzUUM5NiswSXZE?=
 =?utf-8?B?OTBmZVcvUzAwbHpCd3pDNngvT3VqMWYvQ3dLcU8weEoxWmRHbHNmL0tzNG1t?=
 =?utf-8?B?ZUlxaW8yVElsUG50VGN3OUhCd0tLVVlIRnpSWWxZb3pJZlJBYmlGV01uNGth?=
 =?utf-8?B?aWNFU0FIcHAvcU1rUm5IQndDcm9QNjgyNHIvSjR3dkU5NjBFb1R6Q3ZHU0dr?=
 =?utf-8?B?czVvOWhVL3BSaW5KcFhjSWMwdTcvZEYvSXdhNTQ0WUxpeXFnMXRRQjJBa2J0?=
 =?utf-8?B?ZEhhaTlnZ3FvN3kyWjV6c2U3ZnZuc1JEdkFWNWkzWHM0Vmt3UElpK0ZFcjBF?=
 =?utf-8?B?SFJJek1mYXFMZnFQT2c0cEQ0c2ppTnJSQmtQaE9Oc1JmVnVIWnFSalRrRGIy?=
 =?utf-8?B?bEtZK2cyeU5IdVpMaEQwNmpiZUtYTS9PKzlVd3B0L090dXhmTUdmdXRqTnRK?=
 =?utf-8?B?cDhLaG93OUtza3VEYjB0WDNLbTJsR0Z5a3lGM0lVN2JBc04xOEJyS2NNWEJG?=
 =?utf-8?Q?P4o7U+?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZmQrNWdGNDJNWXYwMStJOG8yOVNUREJod1ZYWkowaG5xZTBnenlIN0U4QkRy?=
 =?utf-8?B?WXBKSDNReTYwQ1MxanlIYzlsTWNEcGJDektXUUJUVWRxS1QyZWo3YzFLS0R4?=
 =?utf-8?B?bHFDYzRHbzMvWm5qOXRWSHJBSGREV2FIZG9POXhPMkpHTkhzaEtZekVFRTkx?=
 =?utf-8?B?dDk2a0NyTFMzTjVFd1VWUTVSYk1Pa2M0VzZGRyt5WG9odmdJTVlubnpLcjhS?=
 =?utf-8?B?Z1M5VC9mbU15bEFFN0VOY2g5ZGl4V05HZXlFK0gyUkJqc1dwT1VHcnUyMisw?=
 =?utf-8?B?SXNyOWU1Wm9yN3VxRW9CNnFJODVQOEtpR0NPaEo1YTJwZ0xGWGxaUitzMnVJ?=
 =?utf-8?B?WCtZdnVkS1NNZUNQNGphbndnMFZWellHTE56bCtFRm0wL0l4R1hVQWh6RlVr?=
 =?utf-8?B?clJPNGx0Z2dONFYxUVl5aGZodGl2OHAvaXdNSVA0YXFnVlFCMU1IQmZiM2N4?=
 =?utf-8?B?Nnk0V29xd0V4TUNwcGpoSnlqZXhMckNoQkJCK0c1NXBvMWhsSUhOYTUrdjhr?=
 =?utf-8?B?VFRaT0FZOUlGODM0bFNKQ0xmWHQyWjV2SFdXaUNiSEFWbk9BTEdZWnFQQ3Fp?=
 =?utf-8?B?aGpxWFI5SFFVTlRYMEI5eHpOZHgvbVp1UWRFNXllMzZPRWw2cmdHRVZmWDlE?=
 =?utf-8?B?N2dndmFyWXVIS1pBMkJ2QjFDck53ZlJUS2RHQ0Q0Um9SdTdVcHUvbGYxQTM0?=
 =?utf-8?B?MjhVRFRqektvc0MzM2dIWkNrRmgrN0hwT3VSYzdqTjZpa1Q4V0crdjZjV3k2?=
 =?utf-8?B?WHBzK1ozMmE5cGFkZVRmTHMwNEl2d0tRZTludTZteGtuWDBPUVl3TWlWQVFl?=
 =?utf-8?B?Qm9EaHFrc2RIMGxFTmZpV3ZLbzY5YS9UMGpXd0NoTTdwbTRuVXpsSWx6aUdz?=
 =?utf-8?B?cDRoVzVEeEhPbE5Pa2FvdmRzYk5pZVh5SGgzVUgvSUd2YlA5NVNUVzZxTEg3?=
 =?utf-8?B?OVhyNEVOb3lYTkp4RitXdnBaV0xqUTVnanhBeFovekdMbTRzTXNDUXIvQ1BL?=
 =?utf-8?B?eU5TQ0tQd1JLaWNiUHhpelpQczBiMmtkdGVURGpwNFloWlQyY0RPQTRQWkFu?=
 =?utf-8?B?Lzl2a1BHd0trSVFibUloN3loaGVtc2lBdUJtRnlENGU2QWxqSFNONmQzbU9Q?=
 =?utf-8?B?RFkwclJvVmFJSndzelNvSWFpdzNNUHlEZWFMUlBqb0dxV0ZOV2hkWEhHd1U3?=
 =?utf-8?B?QkdqL2FleDJnQVJSNHdMZHNqNVRMU3dnTHUzdjl0TnRJSzh2MlFBejZKOGth?=
 =?utf-8?B?WFQyejh1UTZjNWlJRzZpUmU5YlBpSDUwNGpRMlRJNzBSK3hpODFMelA1SnlG?=
 =?utf-8?B?aVRyemwxcm53UGNSU2Z3MS9vMVBFbTExQjBFS2ppTnZWclprb1ptV1RVdm5q?=
 =?utf-8?B?eVFzZCsycWVHcGZPZjJRK2NQekFOdTZKWitpelNxeXRmbW5kY3NIajBaOWJt?=
 =?utf-8?B?L3Y3WmZRaGs0UlNuR3VKSEtmc3pNRy9XUkkwMStMVGVzTVR1ODNMbDJWNEc2?=
 =?utf-8?B?RVVpTEk5bEIxcERJQWZMM0t5WFV4ZXZ4VHZmcU1nRjBCdDh2UlNIZStIdUtL?=
 =?utf-8?B?eitDOFd0ZFVESzNFNVYydzBRQjhHU09naDhwRHBPM0dKSmRGTWVTNU4yTk1s?=
 =?utf-8?B?bjFuakl4cldMM2NKOHFObUFzbSt6OXRtTHZTdmZkVzRRL1l0NTJndFZRWFRQ?=
 =?utf-8?B?TUJlT1pSRlhsS0k5WEk0MUs3UGtBellmTDhsQlhiVjVHVFJJNUZ1ZVI0S0ts?=
 =?utf-8?B?THR4U2VNT1FTSkZjeS9LSVljQTJNVzFuS2pFUzdQY2ZEdmlCRUNBYll1RnNN?=
 =?utf-8?B?clFaa29kWVNueTE1eVNrOGRSTSt5c1JyQmNTcWRKd1VDc082aGxtSmZad0hB?=
 =?utf-8?B?RnAveU9OUE1saDFlQS9PVkhhZVBycUREZWhkaEpFdW5jaGk3NnhmZEthVk1E?=
 =?utf-8?B?TG1URXlVTUZhU3VPWmI3SkJwU1pmeUNNT3pzdXpkbyswbXFyazkwZGd4RUZP?=
 =?utf-8?B?cjZqTjR2L2ZEZUNxUXlnMjFFcE12R1Ztbm1EajlhQ2J3a3YwaGFFbVd2R2xm?=
 =?utf-8?B?cjhVelFPa05IV0l5L3B6dElPZjRjZGpZWGp2bUF5OGJYUlFldzU5Z05wcjI5?=
 =?utf-8?Q?rZlTfLE7UIcIxogbPK8OWHE8N?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee9058e-1e5a-476d-d6de-08ddb4116b91
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 17:55:06.8562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: utj/kjtUfIwVIdh8YzsvSWi/v88bHnnQDvNDiWp20mYSWjI4DcihVkBz7CqxLuutQP9dAxvZotCt7jSOdkKspQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6254
X-OriginatorOrg: intel.com

PiA+PiAgLyoqDQo+ID4+IC0gKiBzdHJ1Y3QgbW9uX2V2dCAtIEVudHJ5IGluIHRoZSBldmVudCBs
aXN0IG9mIGEgcmVzb3VyY2UNCj4gPj4gKyAqIHN0cnVjdCBtb25fZXZ0IC0gRGVzY3JpcHRpb24g
b2YgYSBtb25pdG9yIGV2ZW50DQo+ID4NCj4gPiBuaXQ6IEkgc3RpbGwgdGhpbmsgIlByb3BlcnRp
ZXMiIGlzIG1vcmUgYXBwcm9wcmlhdGUuDQo+DQo+IEkgd2lsbCBsZXQgVG9ueSB0YWtlIGNhcmUg
b2YgdGhpcy4NCj4gQWxzbywgdGhlcmUgaXMgYW5vdGhlciBjb21tZW50DQo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xrbWwvYjc2MWU2ZWMtYTg3NC00ZDA2LTg0MzctYTNhNzE3YTkxYWJiQGlu
dGVsLmNvbS8NCj4NCj4gSSBjYW4gcGljayB1cCBmcm9tIHlvdXIgImFlZ2wiIHRyZWUuIExldCBt
ZSBrbm93IG90aGVyd2lzZS4NCj4gSSBhbSBub3QgaW4gYSBodXJyeS4gSSB3aWxsIHBsYW4gdG8g
cG9zdCB0aGUgc2VyaWVzIG5leHQgd2Vlay4NCg0KSSdtIHdvcmtpbmcgb24gZml4aW5nIHRoZXNl
IGFkZGl0aW9uYWwgaXNzdWVzLiBJJ2xsIHBpbmcgeW91IHdoZW4gSQ0KcHVzaCB0byBteSBHSVQg
dHJlZS4NCg0KLVRvbnkNCg==
