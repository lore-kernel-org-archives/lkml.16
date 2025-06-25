Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFBB1DE4DC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838400; cv=fail; b=PxSGalWHVrC9kT9682rYmExGm12P7PteIXOUZS5j4p+zoaQ03r0fCDYjT88GxFnMQQwGvU65BUpk0i3UDHHLjvNr7Kcg/ynpZn6bpvZA81e6TOBAQx5aFEkpZZ8l+iZEethk+7EgK2o04v/EoN64v0V3gaNPOXgL85EpIs7W+6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838400; c=relaxed/simple;
	bh=KEjvtXYisCVluU0mVhejP/itXdw+Gf5fpVJKOFyh+4g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FP2tbyAsjxsiZ3PEzPdu6qi0O4sWMISMaqbQ511EFR9mUtp736BUMrqjTkeRhmjoSoM8MOCNKsUx6GvUmG/3QTFdicg6F5KyEG51oXuZSTt138VFDUVUEyJezT2dpCeYqo8ZeDkR1vFqOfRX87uRMyr8vO4owZlV9XdICIjnBzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g1Dhdbm7; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g1Dhdbm7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750838399; x=1782374399;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KEjvtXYisCVluU0mVhejP/itXdw+Gf5fpVJKOFyh+4g=;
  b=g1Dhdbm7+KS5tMMdlnDlBnI5eimohcqKfe3Bp1SvWLU4cS4ketOq78Bu
   w6fs62BTwBti7RpR7ySVK946nMlehzerlN5nvTtlCGRENL6tPpbtdTiIo
   N9n/HcMpLfkDHaiF/jbtc1xrIEo0jroeUmWozL6LL9nKQr5Sy7jl1YbKp
   l9zNJ/WrfM19xSNZp2ZzzegHYYikWwNgJl+Is7sKMGMVJUAJgHDt+FPUx
   x74jdHGncficAwh6DMPmczuCJ/SaMrDhjGXfnVwxKzeVLJDMeGCuafy+c
   T1c1MdVUjLquuqF6FYJBHRDc2GRL/wqlm4WcY4oK7z0dOdV8TEUifIrAj
   A==;
X-CSE-ConnectionGUID: pUUhOySaQAq6PD/mZwLr5A==
X-CSE-MsgGUID: qt6QpWAbT8em+1MjVC3Q0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56882388"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56882388"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 00:59:57 -0700
X-CSE-ConnectionGUID: OAOM29uKTPmc5id6tyfEPA==
X-CSE-MsgGUID: tFUCq+y0R/iRC1bm9OVztg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="151754745"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 00:59:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 00:59:56 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 00:59:56 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.73)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 00:59:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oizgxFKEk3taGOei2oC7QIy6CFn9222SYBFoeqdrw3ZXbInNEGKqyfrvZaiLZ837dHdEJkOZcbbC2SDSPOVJUhHxBy4Ufuiahxcrinb9tqX26zcROnvatyypvQagaNAxDVWMNmvj5O3hPA57i1bQgULOTL6R+1tgn550QWmLyfOVUFAXn0dC3/hoxfXcttHFbPGxzVwCS6kVC6V5eF92P216wgh/Nzu9wzatnfLLdrb6xZtYsc8JMTTcCrDav9s3BO8kozSJVfBwLeapB0Rt7BELcx9jiG4wHdLF+HB9ihOecK56cjnhrJAG7I4Ii7mW2L8erKfy4i88g8DO9/QL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KEjvtXYisCVluU0mVhejP/itXdw+Gf5fpVJKOFyh+4g=;
 b=BiPaqy6fkorVzJj79bkXojeIuptDlhRamIF9i/IMe4q3SGQOVqtxE7fhGACRXyG+B4XeR6lQa/jQRTVjwvsyX1JDPt1VvkX7j0l+eZLCV7VWLF2bnKyt47VaBkF38E3GwCl9VQZN1kUe0TZ64KHgL4UKXlHPtFX4fUmKyJ93iZUGDQ+L51eCkBelSzvhkkG/wT/jk8bz+QhEqBMc0uDKvtRhi6LzBNAtjs3Wd0vf+sJK5mv9nYFQY8Wq9NptPxA2Fo7sZx6rIrAH+ePPAuBPg2Szpv5qE9depkyAd0rTFknC3Z42Zjpi6/AzJB/r73zJ1izNgxnTYULTNE0Bd53ivQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY8PR11MB7314.namprd11.prod.outlook.com (2603:10b6:930:9d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Wed, 25 Jun
 2025 07:59:53 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 07:59:52 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 03/10] mei: vsc: Don't call vsc_tp_reset() a second time
 on shutdown
Thread-Topic: [PATCH 03/10] mei: vsc: Don't call vsc_tp_reset() a second time
 on shutdown
Thread-Index: AQHb5Bv5t7qDgtvi+kutbtjUIf9bH7QTha9Q
Date: Wed, 25 Jun 2025 07:59:52 +0000
Message-ID: <CY5PR11MB63667FFDD378306D42A852BBED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-4-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-4-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY8PR11MB7314:EE_
x-ms-office365-filtering-correlation-id: f1fa2592-b79c-46d9-4af2-08ddb3be4461
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WjB4endEbG9yaEZIS0c4UTErSjhwSXExdjJOVFo5MmJGWkl5dXpBKzBTei84?=
 =?utf-8?B?L1hNdnNLVmJ1UzRYMmJBc1JiSXliM1VwK1lTK0UxcGMrZEozRklNMURzeGY3?=
 =?utf-8?B?M1J3L0ltQ0tsZ1FWQllYUzJYNjBzbUFLSndta05lZDVXcmhtcmw1MGp3YmFO?=
 =?utf-8?B?b1dHOUx6WGFIWGh1WHVFVDArY1pwaU5XbDArTjdVUitIV01mTEExN28rL0xB?=
 =?utf-8?B?QWkvcVZ4R0hjT0hiTUtRbXVqNi9iZGZKd1F4aE1rc0dyNUxaYXVXS29qWjdU?=
 =?utf-8?B?Y0xvT1NteTEyVkpmSCt0M0tSRElMOFJVWHJhOUo4LzFNVWVvcTB5MjdlY2ha?=
 =?utf-8?B?MyswZ0I5Mlg4THVtZHQzbDY2WjB6OWRWNmNZS0g0MGowR0Z6ZWNzK3dlS2RP?=
 =?utf-8?B?VnJhYXVmVW5laFMrYlZUT3QwR09jbk5GejIwMmxrejdaVVVLSXNwWWlZN0NX?=
 =?utf-8?B?bWJpbHpoUnRvV0RPQmptY3ZiZ0RCbGdhRmR5cmpZRkhIQmErUnh1ZDk0ekRy?=
 =?utf-8?B?Qll2a2E0d0x4blBNcXNlcU1mZXY4NndFaTA3RWMrUHhhbEI3YzloaFd0djBm?=
 =?utf-8?B?Q01ld2VJUllhZ21pWVBNZHZyVXVxZXRRS2hVbjVJdmlqa2JzOC95OThkYkFk?=
 =?utf-8?B?M1phdkoxK2tXdm43M1lqR0FtNGMwRFU2UHE2WnA2SGo2NStGWElxUWo2bHg5?=
 =?utf-8?B?bWI1emRqYzllK1ZZQVYrcURHbFZHT0ViRjdNcG1GeFFvSXlMNlZlRTVPQ3FX?=
 =?utf-8?B?Z05CSTZOSEgwM24wUjJoZVNCZ2pqU0EwSVpkYVBRZ0p6RkY0QmI2VHBnQWEx?=
 =?utf-8?B?YldNUWtSLzJqOElQbjc1UGdaSnV5TEhkblZaak1zc2tPeFI1UElNTkZnZFlt?=
 =?utf-8?B?Sm5BeHRHMHF3U3greDdMSUlBaTdxMk5IcUdPUElPN0xVL1IxQnQ2Q3ozeUNu?=
 =?utf-8?B?OEw4b1FPZTVSV2V2ZnlBWi9DMnJOQ2hWcmV1cm4vUnpLb3FVeGRGSEFtU3pU?=
 =?utf-8?B?MlhRbEp4M0E5MDFYUStLVmJxQmJHRDVqdVJMdzB0K0hlMm5BQ3JBVzBvM3Jl?=
 =?utf-8?B?dkpFbzhvaHcvVVVLZGIwcUprbHFpbUVYRHBxMXRpZ1dzQ2pjQUZYWGFSdUgv?=
 =?utf-8?B?M3VyOFBLQVhzY3F5bmhCTStxQVR3SnhIUmNFZHJ2ajRJRTRqclBGZ3IvRVBJ?=
 =?utf-8?B?aHNjamZacnZnc1R6KzkwL1hZMDdXUVdiMzNETTZIeC9vb0YvamVlVzd0SHkw?=
 =?utf-8?B?aTc2VzF5U2RIRXBtaTZpcElXcnlyNTlUUHZmSnRJbjhrUHh3RnNaU2xhTVNl?=
 =?utf-8?B?TkhNejhRNDMzNUxkWHovM09EcWFHSlE3RWdWR3ZXaWJpWExYTXFXWlNQMXl6?=
 =?utf-8?B?NHdvb2xGSVFCdUU0SUE4NFR4QmtrTFVTYUQ3SVl5Y09YaGFFdmJ0dkxqNytE?=
 =?utf-8?B?MTYrU2RNTVRoY1FtY1NOK0hrN1FYVkdDZGtzU0I3QjNQNWxyU2M0cHFaVHpj?=
 =?utf-8?B?QVF2VFNCdzlLejRTeUZ1ZHN4Q09QcDVpYU1OWHcxNkZNcW5ITlJ1bnZFUWlz?=
 =?utf-8?B?d293dnY5S292OTNFZUhoSWt5d0hxVWk4OFN1ZXE4Y2VxSGdsaHZIQ29KL3lN?=
 =?utf-8?B?M1o1TmlmcXIxaTNEZm4xbkJkeFRPTy96bkFOTFk0M2xNN2prQ2QxUHRFOWFs?=
 =?utf-8?B?cE5SWFRPbFBoMzVWeUxZSytvdjI3bEJmSEVlTjhLdVNjMVJVYjh2OFQrRVJE?=
 =?utf-8?B?c1hWV2E0cStnSmdHMzRPcFphTXlRVFVQNFRrRXIrS3g5YmMrOXNtYml2YlJM?=
 =?utf-8?B?a1UrZlltQndKV2RNejViUGZ1WXlTSkZpckljcklSM1N5SXZKZlI5Y0JVS2Fn?=
 =?utf-8?B?NnFqUzVrNUJvVittOUNCSGNPTXZqNldJcThvWnlDd3h5UDRoWUxFTU5RUFZJ?=
 =?utf-8?B?eVlPUzZESmNoOGViNENERTJFdi9ZQ2hic3NoUjk3cHZ3Qmora096UFJRRFls?=
 =?utf-8?B?MWZ0aEx2Ti9nPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?KzFqK0FkSng0YXVMN2Z2SjF6UVhsQm5NR1ZzRC8rSXhxSk4yZGZvck96NmV4?=
 =?utf-8?B?T282VjlFU2wwOWdUdmFIR082NUpDcEZRQmRHejgyQjYvOThXbENQdU9JeW9L?=
 =?utf-8?B?b01RcGVNamdYMGVJc2d0L1BvTTVVcnczVG1Xa1poYm8zZVBXR2F1ejhFV1pY?=
 =?utf-8?B?akRUSEpVeWZLeWpGRjQ4Tzd0cHNnNlV1aW5uWmNWcmRIUEE5YlBvS3FESGVX?=
 =?utf-8?B?QnV5bHdjcHVMVGFLVmVWNkpKVG9VbzhoaFhkQUxrMkI4TFdFMDdvU2NNelMy?=
 =?utf-8?B?WTQ4dGhLRUxOTU56anZyRTVQYkZqUFpiaVFwc2docTF6N1ZLRzk1T1g2aUd3?=
 =?utf-8?B?RHEvTFJCUXRRTzNzR1pUc2VVdTAwMzYyMW9hKzRKZGQzWW53WUs2cVJsTjBP?=
 =?utf-8?B?MTVPNnFVL2xzazdIZFVINXJuM2xNM1dCemtVRm5RaWJ1MFowbEdqUzgwazFO?=
 =?utf-8?B?SSs2NXdGMlVCcDRWYmZwY2ZpT09WamNVZFpRRTBhVTIyWlU0V0QvQi82VzNk?=
 =?utf-8?B?TW5kQ1lWYmtLOFZhVkF3VFRlSG5ySW1OWUE5Tmc0ekFsN29XSlNlcDkxY1Rs?=
 =?utf-8?B?eEhtNU1DQ3VqUVdOV012UFBqcmN6QkVHajdzR2h3TXBqaURoU0hmVHltb3ZK?=
 =?utf-8?B?MHZwVndPV2FpZytBbldQKzdVZ0VSM2VteEM4cHhmRHpscTR5TlFBSU5jYlVO?=
 =?utf-8?B?TjhPYVowSWZ0cXZtNzJ5Yzl5Y3VmbnJPRUFIOW9LRnE5TDgydmFjZFRUN2NP?=
 =?utf-8?B?NHExa3MrUHFaL0JBY3pjeklKdmhaamRocHJaTUtPWi9RQVdUaGlQb3ZnUjJ5?=
 =?utf-8?B?Q3czRFM4TjVydWM5Y3BwRjJjZE9FeHdDbkFUeG45QlRMTWZEZnRtUzdFMU9q?=
 =?utf-8?B?VnlUZkFBNitYNlVXK2VES0RyL2tmUG1tc3RBcEVOaHZIVTVrdmlRSFY0YnF0?=
 =?utf-8?B?azRsL051MG54eDdPY0pFUkpzbFV0dzRRRlgwRk9paUkvQzR4VnRxWVlFeHdZ?=
 =?utf-8?B?L0FBS1F0cDhzR2pyM2tvL1pmaUphK2o4MWZ1U2RKUDRobTRZVzhudUh1YVA2?=
 =?utf-8?B?c3c4a2t0UWVUTmo3RVl1ZkdVeXN4TE5kaUwyaWwyZ1I3OW9xelc2ZjJHRGlF?=
 =?utf-8?B?RWpqYWNPOFdKTkEvVU5iMStxWmNENW15cEhEc0F3cGQ5MDV0a0w2N3hGNkZM?=
 =?utf-8?B?elBVbStiYitxVjVBTUwrN0o4NVlIZm1XMGRsREwyOHJCU2c4QnlPMTQ0dHJH?=
 =?utf-8?B?TGpiNFNDNTNYK3o4amxFMzZ4bFNYaFBsRElFMzhyLzJ6M3FtVnJtYmJXUVNj?=
 =?utf-8?B?ZHloTVlsaTRETnhsRVkzN3RFSWV5WHF5VHVVZHBnLzROTmxIWTN2RWlldzJp?=
 =?utf-8?B?UXJPVHdNQjg0eURnZ0cybGxGbEtKbHpTMTQybEVmVVloUno3L0t4SUVoRFEx?=
 =?utf-8?B?cE91TTU5UE5zNGlsQjgwdU1YN2VOUW9LWGFrMmNTYjE4YWVEeDR2OENUdEpr?=
 =?utf-8?B?SVVvVmQ4K2ZRdksxRTZoVFVoR0JjWjJXNzh6WFdhN3dmSFZ5YUxkUVpPcE5V?=
 =?utf-8?B?Ymk5WUU0VGowMlBwREhVWkVvVW5iQ3BaaWxiR0oxU0o2dkt4MXNpVE5xV01q?=
 =?utf-8?B?REhVRUg5Y0tMdXJlTFpCVVVDMHNEV3dhbHI0NWoxSFYwbjNwMFYvL3ZyUEdX?=
 =?utf-8?B?OXRzQ3RUeEIrSVdoVzY3NFEzUlJLbmNsTzlpSGtkbDVITk1iUGFYYzJEY3p0?=
 =?utf-8?B?cFliUCtxZ3BSa3YyMVdyK1NteDVwMW02VGRqeHNVVnZVYWxoRUcyMWExWXNI?=
 =?utf-8?B?WGN1a09sSndGWXhTVTViS3VDdjQ4TTN3U1V4aVRsdi9CU0hqUGw0dFBhUXdh?=
 =?utf-8?B?REU5SFc5UGQ3eWxlQXU2SlkydlpBbU4xenNia0t0OGdKd0FuUUxSYkcwVWJX?=
 =?utf-8?B?c2wxRkd2Q05BaGhTcStaRVdMSG5zUUVhTDdGanhGdmVZUWhVeXhyelRlUjlC?=
 =?utf-8?B?Nzhhd1k3MGYrZmFTSHhlODRDTkVGN3A2TFdGRW5TY1Jnd1JkUmdOQ1dLMmgy?=
 =?utf-8?B?L2FENWVWeEFGZ1c1TGZtTk1xOWU0MktXOW1SZTZmRWJqd29KYng4S3JQYThS?=
 =?utf-8?Q?XPr1GjMqwoVy5l6EZRh6QBC/X?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fa2592-b79c-46d9-4af2-08ddb3be4461
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 07:59:52.8620
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kCqjr10bifPQ8pLKE4k4wP8h84IrAimpHKVAjdJb5oBxJfIr3KHOFmSvH8jNo7oJwDcJ/dZ412W+KrRV/FuekeNMIxacqIwkpDRZTKYij4s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7314
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDMvMTBdIG1laTogdnNjOiBEb24ndCBjYWxsIHZzY190cF9yZXNl
dCgpIGEgc2Vjb25kIHRpbWUgb24NCj4gc2h1dGRvd24NCj4gDQo+IE5vdyB0aGF0IG1laV92c2Nf
aHdfcmVzZXQoKSBubyBsb25nZXIgcmUtaW5pdHMgdGhlIFZTQyB3aGVuIGNhbGxlZCBmcm9tDQo+
IG1laV9zdG9wKCksIHZzY190cF9zaHV0ZG93bigpIHVucmVnaXN0ZXJpbmcgdGhlIHBsYXRmb3Jt
LWRldmljZSwgd2hpY2gNCj4gcnVucyBtZWlfc3RvcCgpIGlzIHN1ZmZpY2llbnQgdG8gcHV0IHRo
ZSBWU0MgaW4gYSBjbGVhbiBzdGF0ZS4NCj4gDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgVXN5
c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEhh
bnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9taXNjL21l
aS92c2MtdHAuYyB8IDIgLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMgYi9kcml2ZXJzL21pc2Mv
bWVpL3ZzYy10cC5jDQo+IGluZGV4IDk5YTU1NDUxZTFmYy4uNGEyNjJlMjExN2U0IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9t
ZWkvdnNjLXRwLmMNCj4gQEAgLTU0Nyw4ICs1NDcsNiBAQCBzdGF0aWMgdm9pZCB2c2NfdHBfc2h1
dGRvd24oc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gDQo+ICAJbXV0ZXhfZGVzdHJveSgmdHAt
Pm11dGV4KTsNCj4gDQo+IC0JdnNjX3RwX3Jlc2V0KHRwKTsNCj4gLQ0KPiAgCWZyZWVfaXJxKHNw
aS0+aXJxLCB0cCk7DQo+ICB9DQo+IA0KPiAtLQ0KPiAyLjQ5LjANCg0K
