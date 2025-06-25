Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847552F1FFA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 23:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750895805; cv=fail; b=ERGCqo3gAKsZOz/B1qKDUcBqniEbQTR0OipxitSgj6YtdQ21dk469N4CMQ7UrY5oe/t8NUmT5pQFBT+EuSBi9DyfjPmjYS3P9Edl0p7jfhS8FT8GSfezoJL5cS9fBKvi5SxkAO2M9s/cIScAH4tgb695Kca9TLdmxgAWQFVfS7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750895805; c=relaxed/simple;
	bh=Alc4oaYUg3qob6ypim0iWhi0UJ+oOqxweLeQTOQcFl8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JzlaHuOn7mbScYbPoHB7uz9etmhrfaC6ioeCNTW60n+3G4tVaBluMGqScoZWO/1n9fg+c5jzCzE4cpVdS/2EbTQV/KLNqfoyxe+jZ/MtGRgowox+SuBh95SVqU8mlwUjHIz3v/rxPPcSfyo2HOTgX+wIsv9/20Nop+wCUSUJ/Os=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5h2y5NM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5h2y5NM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750895804; x=1782431804;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=Alc4oaYUg3qob6ypim0iWhi0UJ+oOqxweLeQTOQcFl8=;
  b=E5h2y5NMtCe6pJYZ32UXwKqJxqHSibWY8l81nkhgI8Uy449ClsfTWV5X
   zql3t3zAQUBsy/P0FAz0nk9zcFgqtrYCdSWkxrBg2FZILKUuhz+f5EDqQ
   ckqd3RM6Y0w/46DSVCQc4FdrLXjv2rjRs1dYuFEVh2cyzW20ZzyVmN3gR
   99Wv7soRHx//B5x4ZXdsqOiBASXnTkW4qUW8QtuaAPFHEeOSKdzitWoyz
   v6T7IchQefhioHvd6n5DnW/4864UCBGnBrVIe7E1W754t0HYZpq3IYQ2N
   E6XXWbI1HYkDYsGrdkNWxnbSqP2cV3bDSCLVmTBDOKc47zdhwaK3VGh3f
   A==;
X-CSE-ConnectionGUID: p4FWmzBMRHe8P4mpbMROIA==
X-CSE-MsgGUID: x557e360Ttq+CvbBca8s/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="63872457"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="63872457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:56:43 -0700
X-CSE-ConnectionGUID: mH4JLKSaS2+Cdvqf2tWNIw==
X-CSE-MsgGUID: JBeEPzpaSy60DEv189anVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="156750316"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 16:56:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:56:42 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 16:56:42 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.81)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 16:56:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REHEf433BsH6FEtk+Sij7s4aQtIeLRU9fraXgwYo+1GtRIs9w37Rk1hYljLWfKb2mxy63+zGYygCDqE0mLZmgxsZtizezeq3hUsf7jgcg7HBlH5RTzJjD9HoqoXTUEez6heQ52N5MM+l4l23sDSn51+S7Pysn5qwdRH50uZsni6zehYAlxQPPeQf7SSEebr2IDVv8kasCvJ2l2SBIl9GejPFmzhOB0i8rebM07nGjJ26j6HaUTGN/B/8onLrwew2oU3MxiHWHRdshwdTwKDBiaElpw9gjc4lRHn0+DVYUmacNZJ9E5eSdiowR1coVPq0x9no4DYe4WZi2phZtec1FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Alc4oaYUg3qob6ypim0iWhi0UJ+oOqxweLeQTOQcFl8=;
 b=X0UnsJeWgMH6npBhwket8VDR5llp9UH/HKUyswKbF0CFkRBD1awUNRDuwtduCs2tZvXzv2wPPj1HjeNHmV283ncV/YjF85DQJVh1fq71j13oNPStJKTwqhGFQevt4l5l0UJ9Ov3YWJnUGvQtJWKoqnJMTTM1858OlhLHUwi5ksvwfA1W4KosxZXyu09gU0dtDQzMwGfMBCnnQXBCgGiOfq0YC+5GxaFeK05IF2ls/guxWB1GIzZCYin8QMc4kx2DoSyj9UVxd3k5wkOBmBOpBeFUUu9G24H4++yFx10SYTI8rgvcmG+DWehgQH9+zROf53B0AlKFllDrBuvBcLhp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Wed, 25 Jun
 2025 23:56:26 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%4]) with mapi id 15.20.8857.025; Wed, 25 Jun 2025
 23:56:26 +0000
From: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
To: "Hansen, Dave" <dave.hansen@intel.com>, "Huang, Kai"
	<kai.huang@intel.com>, "bp@alien8.de" <bp@alien8.de>, "peterz@infradead.org"
	<peterz@infradead.org>, "hpa@zytor.com" <hpa@zytor.com>, "mingo@redhat.com"
	<mingo@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>,
	"kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>
CC: "pbonzini@redhat.com" <pbonzini@redhat.com>, "seanjc@google.com"
	<seanjc@google.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>
Subject: Re: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Topic: [PATCH] x86/virt/tdx: Further fix tdh_vp_enter() calls
 instrumentable code warning
Thread-Index: AQHb5PC9lU3WKkxH00+3HD/9HmyxhbQUj6OA
Date: Wed, 25 Jun 2025 23:56:26 +0000
Message-ID: <6d997522660f3ddf673d981cf2511674a94e99ae.camel@intel.com>
References: <20250624101351.8019-1-kai.huang@intel.com>
In-Reply-To: <20250624101351.8019-1-kai.huang@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB5963:EE_|CH3PR11MB8496:EE_
x-ms-office365-filtering-correlation-id: 97b30780-8a40-40ae-c3f6-08ddb443e58f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|921020|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cG5QbGZPNC9lcVBwak9vSEtneDAzZUtMdC9BZmQxaUcvNmg2VkZpaDBuVURL?=
 =?utf-8?B?ZGdxb085N1dscW9yRTEvRGQwbFFhcG1VVG4rZ0JCUjA3R2hTaDFuMFRVSUZD?=
 =?utf-8?B?SDRnZE1ITkQ0UEdNTGMzdHdLbUNBeEVWTWQwQ1gzSUpZZE9nRW9PYllQTW01?=
 =?utf-8?B?VTVUdTM5RG5qMFE3ajVrKzFqYmc3QkJmQVMwTmU1dTdFVW9iZnFJN3hZNVpq?=
 =?utf-8?B?dmhSRnoveHR2VkFSb1JvWEU5bVFmT2dyd05kMWVlZ2ZkK01hR3ZuMEpnd2lw?=
 =?utf-8?B?Y2FYN0VsWFExK01vd3ZXenlSODZqcmZvY3JIR1lwT3lKS3dYcm9lSVRsMHBB?=
 =?utf-8?B?MkNOQWV0V0cyditZMVV3Rzk3bWlpdThNUGlTUGpvVEQySG5kT29pWlhFenlG?=
 =?utf-8?B?RDlRSm9BTE9vZ2ZTSlFPdXF6QzJWa2ozeDFXd2FwWHFYSFJJWnEzWHdPT2Fp?=
 =?utf-8?B?WVZTUHREemROWkNVaSt3ejZBTk9OUmRpTnV5Sy80RDlpSUdMUzJPd0c4ejFp?=
 =?utf-8?B?dmlRR21jSFYvakNPSXNQdU41YVBZUVRsZFVLYW40c3ZveDVTWm13dU1DeEQ1?=
 =?utf-8?B?a2tydi9sTTF4ZENXazlkZnFkL2xVYnBwMkl3MFl2ajZEeGVacFkxRkNYYWR1?=
 =?utf-8?B?RkRXVmdrNktHNWwrclFYdGdCdXJvNDhsYlQvVWQ3ZkZNem40VXowM1FSS2NV?=
 =?utf-8?B?R1BENXY4M0d4WHR4MklXTXRVNDIyUzBBcmxacm05b1YzSkZiaXdoeTNGbUlB?=
 =?utf-8?B?N29FMWhHYVJmam9BVVdETk42R0tuSWJVRDVWdW0zN0tHcUJka2VqOFdvcjlL?=
 =?utf-8?B?WGZZYmhhaVJSMmVDK3kxQVJyOWFsK2lURWtZcytJT2hEaEJ4OXh3bE1oR08x?=
 =?utf-8?B?NHg0Mk8yTUhob3BjTzg1S3NoVmwrbnpGWnBORjlOQWkxa3RPTG9EcEl1Nitp?=
 =?utf-8?B?NVNqMklVM0Mxd0FKZk4zQWdhS3h4ZmNQeU9RSDE2aVcvR3JXcTJITUZPdXhR?=
 =?utf-8?B?c2RObGVIRXBYYVhlUndKd3UydEI5WkJaZDUwcnVadzI0YzQ5NmgzK0MwMkM1?=
 =?utf-8?B?RGl4NStiV3hPTk1uZ3NqUlZnWU9QRUZzT1lNcUlnMC9CaGZrandIN0dXNG5U?=
 =?utf-8?B?bnlBcnEwYUJnUitSOXR0T1VLSmxpZFFYbzZUeVQ3b0dVZm1DWmNBOFZDbzdh?=
 =?utf-8?B?VTE1aE9ZeS9uVmFIaFgyeXBYU2MwQWJ2cDQ5dklpUTdlUElIRnVKUmlTUTZi?=
 =?utf-8?B?Zm9nTHJmbmlrTW1lL3libEVIUkUwaWNnYTE0U3dZL3JReFFJd1JsK0QxQWp5?=
 =?utf-8?B?VWY4ZDR5REZkTlkvbUhsbUVjUzViMC9vS3hDUFJtUFJiZTExY1VhN0FMS3R3?=
 =?utf-8?B?Yjdwa1RlazdOMU1QZWdOTkRTWlJCTHF0bjdRRVZmVzhzejVkM3V4NlBNejEw?=
 =?utf-8?B?T2Qwd2NUZlBybVZxbldmRlE0SUxmT0lrYStzM0FoYUgvVGVrR2Q4R05TeFhl?=
 =?utf-8?B?YVo5dDIzb1dDeHNKRmVyNmFVdFUrSVVETG9nUTRkMzNrdDlHSGRPb3A1dkhL?=
 =?utf-8?B?ZUgxYkdKdXhmWVBnTjJrV3hkMGp0WGt3MFVHUGdiOHNFSDFmS1FXODNIYjBm?=
 =?utf-8?B?eEtMT1RPdkVyYXhYWEI2eEl5R0QydXp6YXBmaHIwUkZ0dGlhMktzUGxvL3NN?=
 =?utf-8?B?dUYvMSthaWI3V0VyN0pjRFR1Zjh4eDZhd0tldkhxZmJmYmppU1BJTkF0V1BR?=
 =?utf-8?B?TEFoL2xUQ1B3UFpoWVp0YVk2OFU4eTVwby90OVQ0NGhvOU9xdmVIZHZPeGU1?=
 =?utf-8?B?eVpVMUE4WGVhcWhIcGh4ekJucGl6TnVTWWM5eHpVVnhvT1c4S0VTZXVacTMw?=
 =?utf-8?B?ZkdUNXg4OEc0RFFsbDlrbm42YlJCSHEyQ2o0VGt5TlJKYUZLaFpYbjA0SmJT?=
 =?utf-8?B?TnFRNGNSOEROZjNrWEs4aERDenlxMDlqVnROajZsRlQySm9EWnBRck5UZTgv?=
 =?utf-8?Q?uhWoR7f8fIuDnqKnghBnBNzf4q1WT0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MC8rTWtDeUF6LzA2M2VvQUpGRDY1TUM0cm9TdGdYQ2EzQnZOcEl2eCtUREVF?=
 =?utf-8?B?RmtuSktlbGdKQkZMMjVINGt1bW10YXc1bGQydWg4R2dNdlRnM1BEL3FOTkJZ?=
 =?utf-8?B?YXEzcm1wd0lLRGw4Y1dXeHNjOXlOeCtPOXY4bWNINGxTakxYaEVKNkhTdmlj?=
 =?utf-8?B?SHVZMlg3T0Nka0R1M3IrWHE5b2lqaGxQaWxTcE9vc1FVZ2ZOdWdNaGx0TFc1?=
 =?utf-8?B?NWpXOFUrZFc1MVFpUUlIRWExbzFIZG9TVkwxV0FyRzlDcEk3YzRWb21BR01l?=
 =?utf-8?B?MGp3dDh1QXc4UmM2Wm03cEJQUTFVVlVQemE1anVOSi9iRnA2S2Zndzl5NE12?=
 =?utf-8?B?Skl5a05pY09Pb1VoUzNzSDdQY0UzU3NWaytvaEVnZDNlRDNkd2doL3U2eWFP?=
 =?utf-8?B?VmZ4RWs2bUFPTWZKWkloNkppbXp3M3NnOG8zS0JaZVdlTFZSQ2VQZC8zZ01Q?=
 =?utf-8?B?WG45bnVDL2lUSVNNQkNQU1U1Mml1MjdqMlNVZTEvTW9CZ2ZNbFFjeTBQRlB3?=
 =?utf-8?B?YlR3ZmRVNHFQRjVVbmp3MTIzajcwaWtLeEdvNmRjT3I0VkdpSTVhbi9WeDRL?=
 =?utf-8?B?K2tJNmdxdzQwazNqZU40Y2ZiS3J4L1paMWk4aGg3bE43Y2R6WDVUYmRTaTRL?=
 =?utf-8?B?ZnY1TmpyYkpVeEdtQ2ZYcEtQOWg5Qk81bmNPdldXK0JDcUxLaTRNSXlIemgv?=
 =?utf-8?B?emwwMUt1dmJUeEFTZXdleXIvak1uMnZOeW9qdTFMMklTSkZWVkNDbkM0VXZJ?=
 =?utf-8?B?QXdrbFVoa0xlUlY4MllEbUt0VXJ2bVV0Rm0vVWNoSC9sSDRXNzNJV0R6VlJB?=
 =?utf-8?B?aHFGMVVER2ZXaEc1ZjVUMERqOWwrL0wzb0xEM0tLT3VITEVFbVJLc0VTU3dU?=
 =?utf-8?B?ZnN1NnFqZjJvcEJuMHZOZGhKaXlVZVNkRGZqQ2VObU1aZFFOS0hSV1JHcmZP?=
 =?utf-8?B?SVZPeHZsbXdRM2JFYVBvZy91ZTFiai9wbFRKYlpTcWVmeFlhcnIvdk1wSEVT?=
 =?utf-8?B?S2s3MFV0M01TMXRmK0YxcXlmU2dxbWsxcXhqR1daYUN6TmY4YXNRdUZiNkps?=
 =?utf-8?B?N1B5a2lIK1MzZ3NoVm9neXRPbkptQm9qamp6TWhUVG5aK1R5ejBKeG1QUXJ3?=
 =?utf-8?B?ci8wVmprZEJ5UUZOaHdaYSswL3hYZUxlUlU4N2ZjR3cwWVpXMW4ySzN1d3Zx?=
 =?utf-8?B?eXhINzVZMGpHNGc3V3BMd0dWSEZoQkl6cjlZL2VhVjVNTmdHODJESGFxUHJY?=
 =?utf-8?B?MExsQzN2ZkV4UDVVcjhrQlpBdjhpS0lielVlMmJIRlZBWUpaVGo0cDhGR0ta?=
 =?utf-8?B?ckpKRStFdWJtWkhwWFYycW4reE5JaThFYUg3OW0zU01RUC9EVm5makpnbzZP?=
 =?utf-8?B?NklvVnc0NWNiZVU5SXVKa2Q1WW5nNUdQQTNLYllEVklLK0dvR2VoUjYyS1BH?=
 =?utf-8?B?UmlrYTFiTytqazZ1WEFWV1RrQXhhakpPTElDeDhIUStLcmM0NGZTTU9XdlZh?=
 =?utf-8?B?d3E0SGhOcnFYYTZRRnhJNDBsTVRhckNQQzNUSGZKQkxaNVVsN1F3WUtsWDBn?=
 =?utf-8?B?YjZvbjczK2NncURIK3l5QkxlWVJpTmREcnhUbVo0VlZPbnBicTBqY1gzdjBS?=
 =?utf-8?B?WWtPeGZIMHNkTnpMNDNxUFF6a2EyT0YyblMvSUlNSHhCWm9OMnRQUU9JZ0J1?=
 =?utf-8?B?Y1FUREpkTWF2WFFOWmd6QTNqMytyR1ZwcVJhU000bFg2YkUrWFdYRk5xMUth?=
 =?utf-8?B?cnFnMEx3UytBa2wyK3NpaDFkUUR4NTRWSDh1V2tlUFlRelJpczNQWTg0TWRL?=
 =?utf-8?B?dnFjSXI0eDUreGlHeUFqZy8yZUNOdStoOU1idzljeDhscWtlM2YvR25qTE5Q?=
 =?utf-8?B?UnVJeGF4alpUM3lNaFQ5WWIwYkc4MmsydS94cDI3T3NNWnl5L1dOcVRGdFNh?=
 =?utf-8?B?V1lTQlFUYnk1M2RPR1VWaVl3VTliQTg2dTFkbDQ0NWRKcDlzTW4wd1BFZFNm?=
 =?utf-8?B?MWZwaDBpVDBOMW00TGZGdjM4Mk03dXNlYVM4RUJJaWpld3RlWSthOVFkc2N0?=
 =?utf-8?B?VVlLNGNwRDI5SjZrRFZ5by9DUVdVanpRZnRvZEFhSGNDSTkzSGlGMVo0QUpW?=
 =?utf-8?B?UW1Tei90UzFUV0RYTmZaaUh6TWRCa0xWS2xxQnZIZUtlU2lPY3RhczdiamFV?=
 =?utf-8?B?U2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0A52957D6676474EBEC2FDFD167E2431@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97b30780-8a40-40ae-c3f6-08ddb443e58f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 23:56:26.3554
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Dl8PEOoufAUwvBmYf/2PjLp/JqSiNLlDwxj6CT5wvSdL9iBXlTY8vwjPQb5IIrhyBNt3hVmuCxhE5zUOsTtJTRC9ZHbmYF+ErJEr2SozWNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8496
X-OriginatorOrg: intel.com

T24gVHVlLCAyMDI1LTA2LTI0IGF0IDIyOjEzICsxMjAwLCBLYWkgSHVhbmcgd3JvdGU6DQo+IHRk
aF92cF9lbnRlcigpIG5lZWRzIHRvIGJlIG1hcmtlZCBub2luc3RyLCB3aGljaCBtZWFucyBpdCBj
YW4ndCBjYWxsIGFueQ0KPiBub24taW5saW5lZCBub2luc3RyIGZ1bmN0aW9ucy7CoCBDb21taXQg
ZTlmMTcwMzhkODE0ICgieDg2L3RkeDogbWFyaw0KPiB0ZGhfdnBfZW50ZXIoKSBhcyBfX2ZsYXR0
ZW4iKSB0cmllZCB0byBhZGRyZXNzIGEgYnVpbGQgd2FybmluZyBjYXVzZWQgYnkNCj4gdGR4X3Rk
dnByX3BhKCkgbm90IGdldHRpbmcgaW5saW5lZC7CoCBVbmZvcnR1bmF0ZWx5IHRoYXQgY29tbWl0
IGRpZG4ndA0KPiBmaXggdGhlIHdhcm5pbmcgY29tcGxldGVseSBkdWUgdG8gdGhlIGluY29uc2lz
dGVudCBiZWhhdmlvciBvZiB0aGUNCj4gX19mbGF0dGVuIGFubm90YXRpb24uDQo+IA0KPiBUaGVy
ZSBhcmUgdHdvIHByb2JsZW1zIHRoYXQgY2FuIGNvbWUgdXAgZGVwZW5kaW5nIG9uIHRoZSBjb21w
aWxlciBhbmQNCj4gY29uZmlnLsKgIE9uZSBpcyB0aGF0IHRkeF90ZHZwcl9wYSgpIGRvZXNuJ3Qg
Z2V0IGlubGluZWQsIHRoZSBvdGhlciBpcw0KPiB0aGF0IHBhZ2VfdG9fcGh5cygpIGRvZXNuJ3Qg
Z2V0IGlubGluZWQuDQo+IA0KPiBUaGUgX19mbGF0dGVuIGFubm90YXRpb24gbWFrZXMgdGhlIGNv
bXBpbGVyIGlubGluZSBhbGwgZnVuY3Rpb24gY2FsbHMNCj4gdGhhdCB0aGUgYW5ub3RhdGVkIGZ1
bmN0aW9uIG1ha2VzLCBhbmQgdGhlIGFmb3JlbWVudGlvbmVkIGNvbW1pdCBhc3N1bWVkDQo+IHRo
aXMgaXMgYWx3YXlzIGhvbm9yZWQsIHJlY3Vyc2l2ZWx5LsKgIEJ1dCBpdCB0dXJucyBvdXQgaXQn
cyBub3QgYWx3YXlzDQo+IHRydWU6DQo+IA0KPiDCoC0gR2NjIG1heSBpZ25vcmUgX19mbGF0dGVu
IHdoZW4gQ09ORklHX0NDX09QVElNSVpFX0ZPUl9TSVpFPXkuDQo+IMKgLSBDbGFuZyBkb2Vzbid0
IHN1cHBvcnQgcmVjdXJzaXZlIGlubGluaW5nIGZvciBfX2ZsYXR0ZW4sIHdoaWNoIGNhbg0KPiDC
oMKgIHRyaWdnZXIgYW5vdGhlciBzaW1pbGFyIHdhcm5pbmcgd2hlbiBwYWdlX3RvX3BoeXMoKSBj
YWxscyBwZm5fdmFsaWQoKQ0KPiDCoMKgIHdoZW4gQ09ORklHX0RFQlVHX1ZJUlRVQUw9eS4NCj4g
DQo+IFRoZXJlZm9yZSB1c2luZyBfX2ZsYXR0ZW4gaXMgbm90IHRoZSByaWdodCBmaXguDQo+IA0K
PiBUbyBmaXggdGhlIGZpcnN0IHByb2JsZW0sIHJlbW92ZSB0aGUgX19mbGF0dGVuIGZvciB0ZGhf
dnBfZW50ZXIoKSBhbmQNCj4gaW5zdGVhZCBhbm5vdGF0ZSB0ZHhfdGR2cHJfcGEoKSB3aXRoIF9f
YWx3YXlzX2lubGluZSB0byBtYWtlIHN1cmUgaXQgaXMNCj4gYWx3YXlzIGlubGluZWQuDQo+IA0K
PiBUbyBmaXggdGhlIHNlY29uZCBwcm9ibGVtLCBjaGFuZ2UgdGR4X3RkdnByX3BhKCkgdG8gdXNl
DQo+IFBGTl9QSFlTKHBhZ2VfdG9fcGZuKCkpIGluc3RlYWQgb2YgcGFnZV90b19waHlzKCkgc28g
dGhhdCB0aGVyZSB3aWxsIGJlDQo+IG5vIG1vcmUgZnVuY3Rpb24gY2FsbCBpbnNpZGUgdGR4X3Rk
dnByX3BhKClbKl0uDQoNClRvIGNoZWNrIG15IHVuZGVyc3RhbmRpbmcsIHBhZ2VfdG9fcGZuKCkg
b24gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIG9yDQpDT05GSUdfRkxBVE1FTSBoYXMgbm8gZnVu
Y3Rpb24gY2FsbHMsIGJ1dCBvbiBDT05GSUdfU1BBUlNFTUVNLCBpdCBkb2VzLiBXZSBhcmUNCmNv
dW50aW5nIG9uIHg4Nl82NCB0byBub3QgdXNlIENPTkZJR19TUEFSU0VNRU0/DQoNCj4gDQo+IFRo
ZSBURFZQUiBwYWdlIGlzIGFsd2F5cyBhbiBhY3R1YWwgcGFnZSBvdXQgb2YgcGFnZSBhbGxvY2F0
b3IsIHNvIHRoZQ0KPiBhZGRpdGlvbmFsIHdhcm5pbmcgYXJvdW5kIHBmbl92YWxpZCgpIGNoZWNr
IGluIHBhZ2VfdG9fcGh5cygpIGRvZXNuJ3QNCj4gaGVscCBhIGxvdCBhbnl3YXkuwqAgSXQncyBu
b3Qgd29ydGggY29tcGxpY2F0aW5nIHRoZSBjb2RlIGZvciBzdWNoDQo+IHdhcm5pbmcgd2hlbiBD
T05GSUdfREVCVUdfVklSVFVBTD15Lg0KPiANCj4gWypdIFNpbmNlIGNvbW1pdCBjYmE1ZDliM2U5
OWQgKCJ4ODYvbW0vNjQ6IE1ha2UgU1BBUlNFTUVNX1ZNRU1NQVAgdGhlDQo+IMKgwqDCoCBvbmx5
IG1lbW9yeSBtb2RlbCIpIHBhZ2VfdG9fcGZuKCkgaGFzIGJlZW4gYSBzaW1wbGUgbWFjcm8gd2l0
aG91dA0KPiDCoMKgwqAgYW55IGZ1bmN0aW9uIGNhbGwuDQo+IA0KPiBGaXhlczogZTlmMTcwMzhk
ODE0ICgieDg2L3RkeDogbWFyayB0ZGhfdnBfZW50ZXIoKSBhcyBfX2ZsYXR0ZW4iKQ0KPiBTaWdu
ZWQtb2ZmLWJ5OiBLYWkgSHVhbmcgPGthaS5odWFuZ0BpbnRlbC5jb20+DQoNCk90aGVyd2lzZSwg
TEdUTS4NCg==
