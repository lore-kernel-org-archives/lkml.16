Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D17D182D2
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745221; cv=fail; b=f1GygCoITgSVQ30SqMGohQxLZSym9RyC6MhRu95wAUFFLpvTXv4GjtcrDu+sTa+OdJepSpSjdVZZbG43Sw+5V1V3mlwpsLlWg2B31Q/SOLkH350598cx2BFz758ziENCXcNblId+c7Y6tASUmzFpBE3cyeBmOZQaSJq3mo6winQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745221; c=relaxed/simple;
	bh=AJbEvBJBFjx6zN1WYG/ZbwCisyNn9FIRXnILgpVcd14=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=N5KFMMUtY5TDC+bQm9WJlMk5kUYCQaPb0pFU2p6/9KIX2KekyE6AI+34f9EZu+j1rQnBwPoOrktnWD2pqZoFeH68tOk5yejlTTwPVJK1twQHYWp+mbttK6Cz7RejO8EfjmTLK/H+3Ms4ry4eTsvtnpLzkYPpysDJkxmNsMX2lsU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qk0m5jco; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qk0m5jco"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750745220; x=1782281220;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AJbEvBJBFjx6zN1WYG/ZbwCisyNn9FIRXnILgpVcd14=;
  b=Qk0m5jcoNZ8rUMUtFRgYjlXI6d4TR/4lTrBb0EoJ37CRh9iXT4iDzEwm
   ElhJQ/xqXj+oAVp2HFVwKC+NLeFNNeMJYe8FML8OjrA6jPDRt5qtidJej
   qk7gO4T6By3SPPMO48TLjpBm8J2emgRFsHJBBUCav5UreWwbrElsok2+s
   W3//t4VptXXEova0ao+aomTYADh7uu/5jGS2eG1HHMtNklcilOZSycsLw
   5J8+McZAKfoqwtwi/ruXcrDu9PFWHEc4C6M3tDzPgjXon3Vitv7YQ60dQ
   XcVqTo0v/L+L+IsP2yq1ZDypuVxvdF+qqJdSnxvp9HpK25AgcG/6K5HLZ
   g==;
X-CSE-ConnectionGUID: Ez8UVLMdS5K8o7iWUwVgPw==
X-CSE-MsgGUID: 6H89qeXWTQeYaUoVsOYqmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="56647178"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="56647178"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:06:59 -0700
X-CSE-ConnectionGUID: +jHpS+6cQNm+ElhovcANXQ==
X-CSE-MsgGUID: Oi/zJ/W4SEWFGd7NpXX4xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="155832262"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:06:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 23:06:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 23:06:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.47)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 23:06:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ekb9hORWt+LR9qVw7ExYf6p216qC2x1Pw6r7cHbAKshUm3FbOwTEt5k8npFL+9k2yns8rh4QMeOKCZk8WPZa4Pyy1uRuZ4dyBdXbZSiwSHAMdmYa/bp3I/FFlG/XiCftSrqymQlLxSkZ3euzmQAMIXSHOwL/j0EwxtTr+osCg6t8LKiSyQuuLAYzPqa79j/M0ICMFWulWMKIQyDiUGVLUptwfMcIA/B4ZShYzc6S09bfbI4UBVx3DAEzhzMO5Wj9iEhnmrrC5POKBbb3+QbrDHnxxHrO0ZZacYGsP9dkfKSalrZmEkPngDABu6V9m14eqIBRnlpyzCRz17p+AfCVZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AJbEvBJBFjx6zN1WYG/ZbwCisyNn9FIRXnILgpVcd14=;
 b=Uywful/+JbCoSP6EmI5r9y+9yom27TUrKb4K68VNeelcHxe2gcZjjg2PuE9j0A6v5XRo5eE9GudZM4QdQNf19LINhKAY7QNkwyEdYItlO4ugBEXPK/eJ9H7Vm4RfpvZuPvL3EjkLo0QJjcZiMCL7FNstT9nRcWcM3QurKxaQTCz5uIwfhcMLxHc3YTK3gKNYI1di+rlja+lcXfWy6bBW2H26rku7uHvMssX+V0omJvNZN2jsHYN4GHoimNWc7QlWi2l5/rK/0V/c+EV8rNjkgfv4DMHBDGqmLD1IVh9DxYk3LsKSgVfX97iZcFrH3qavnw20YDd9jGkgDXha+3vBZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 by SN7PR11MB7995.namprd11.prod.outlook.com (2603:10b6:806:2e2::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.30; Tue, 24 Jun
 2025 06:06:38 +0000
Received: from IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d]) by IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:06:38 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 01/10] mei: vsc: Drop unused vsc_tp_request_irq() and
 vsc_tp_free_irq()
Thread-Topic: [PATCH 01/10] mei: vsc: Drop unused vsc_tp_request_irq() and
 vsc_tp_free_irq()
Thread-Index: AQHb5Bv5nhTztWVIuUGM8T/zAcqC2LQR0yng
Date: Tue, 24 Jun 2025 06:06:38 +0000
Message-ID: <IA1PR11MB6370FA5EEB2D062349C9BC9AED78A@IA1PR11MB6370.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-2-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-2-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_|SN7PR11MB7995:EE_
x-ms-office365-filtering-correlation-id: b770d58e-3ce9-4a9a-272a-08ddb2e54808
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cUNnT0lHN0Q5aTZrd2ROU05NTnpVN241NjM5WkVIaU5zam93Tm1QTXBNbCtn?=
 =?utf-8?B?NzlVbzZrUEtvbTVtZTdVeGZ2ZkszNnVIbFpCNjJMVCtaRHFpRDEyOUpnUzV5?=
 =?utf-8?B?SVlnY0pLSmhNRCtYY21TUWVERml2REFVa0lvS25NRGtENWRUalVLR1R2eUVG?=
 =?utf-8?B?VEhTNktMRVI0Q0hDQ3hRSzRtSUpRaHhMZi9TdURCUmcyNTFWeXl4Sk1ML1pr?=
 =?utf-8?B?M1BSaUpEM25OUk5sUU8xUmlWVWphazFSY25QZmJjdWpyaHVpTEkxVXRsL2Y0?=
 =?utf-8?B?NmoxalRPNGNKT0svRWZjTmNzeUpkV2FTWC9Tc0xHVjROUjBQcXpFZ1BPMDdR?=
 =?utf-8?B?aHFxV2g1REVPbHlKOWJadEU4dVR1UkJGUjd0RWFyL0NWbitFWDE0K0NxaWh3?=
 =?utf-8?B?STJsMWVaeDFleldtY3VCcFRVQXlKcU9VWjJQd0VzS2JKNjZrazNUa0V4TllB?=
 =?utf-8?B?SjV5MytwOVJWcTIzUFlweUl1eng5ZTZ0ZW5KZGNLWENKMmdIZ21RQTJyR3d3?=
 =?utf-8?B?QjY4OE9xbm45L3V6by8zaDRHd1FCdXNDb0JnY1RKMHNpWHY3L0I0TFFtb3dk?=
 =?utf-8?B?Q0lYSnVqSnphVFAyem8rbllDQTM2TllwRG5FQU1Ob200cDFkQUVuVThXYmVz?=
 =?utf-8?B?cVNNVG5PMkFrSDVDbHd1WkhnRHorM1FTTnpPbnNGNXdXQW5SQnFWSDFzVXJm?=
 =?utf-8?B?VjhwcFlLTCtNOStqcWpnR1VGV3pGQnRENHFzQlp5NEE0ZFNWTFJwb2lPaGY0?=
 =?utf-8?B?UXhabzYzR1hCeWVZN3FxTUF0aVhEUmY4TkZHMHFxRExlY0NibzIycnUzVXVC?=
 =?utf-8?B?bGVOUmwwcUFPOW4zb1YzOXY2cm9NeERpeXdpVU5oNENkVUduMElVdEh3cWds?=
 =?utf-8?B?anplN3U3MzRma0xaRFJTdkFWMVFxR0hENEtpdWFFay84SXZMcVZZSE5wQzRm?=
 =?utf-8?B?MWJYbVRpR2gvUmw3WUFTZ3FIcG03VjlBWWtsVUtXVFdvTUJldlptR3l6QXFV?=
 =?utf-8?B?ZG9FVm1rUE9VcExyaG9wbjdiVFdHNmp4RE5MTXluZnpsS0ROU1BvZXVhVnJH?=
 =?utf-8?B?ZURjeGZ6MExyWklEdm1EbmVJb096SEpEb3hycGZqVUEzN3Zwems3QW9tNDNS?=
 =?utf-8?B?Zy9mZkJ1RVFrWmJWWGJHKzBsR0JxQUdjSUFXMDJkc25mNklWQWc5Vm00dnB1?=
 =?utf-8?B?Y3J5L0x6Y0JKclRrY3laMExzbS9nY1VXWUtvOHRwcFlXMTlZYmVqTHVhaGRw?=
 =?utf-8?B?OURSRGxBcitJY1MwRG92Y3VIc0NHVkN2dVZmTktKWE9HbUJiSzVZT1VPOUZl?=
 =?utf-8?B?cW0zeG9kRWpSSHRaTXlmajN4RXdkd2ExYWpMOVFqdXJpZGxlSEtvZndTTlFa?=
 =?utf-8?B?ZHp1alJqVnBucllPTForMnBKNUVDN3JuRmZRNlhjMFRGWk4rZlhsNUMxakdv?=
 =?utf-8?B?Und6NXZXVzhOb1J1MWdIUHo1WE1MU0xac2JNd2s5aEVNMFVQdG95T0s2M05D?=
 =?utf-8?B?UVVtRW5NYjg0SGloUDk1N2lOZjdjOXh0V01OeWloRGFaL3REZ09zLytxOU5Z?=
 =?utf-8?B?Ukc3b0xQcStpWnp4RCtmUHNDU2h4dFVMeW9qb1QyL09QY1NUOG85VmQ2b1d0?=
 =?utf-8?B?d3pXOFlkYUtEdjlaMUd1YkhKc2NMUUo5N25aZ05WQ0dOb2xnbGlDdUN1TVhy?=
 =?utf-8?B?ak03VC9EUStkVDM0VnpIaEozT0p3ME5PWlRFMTRyU2FOTUdCSW1pTTlmUUF6?=
 =?utf-8?B?RGxtWWxsQUFReTh5ZVNoRWh6eHNLTWs0R2xvOHNwaE1tUXdoQ2x2MEpuU0wx?=
 =?utf-8?B?RkE3UFF3aXJWcytvLzhneWNQU0J0am5NcVIrUFNxc2RjT1daWVdDTFZ1Q243?=
 =?utf-8?B?TTV0c0NqcWkrR3d3RlRidzJld2tua1RBNXpBWmlTWVk4QjZ4MkFRYlpmelU2?=
 =?utf-8?B?OTBJWFhzSDYxSERMQlBEWWI4MW42M1MybVEwenYraThxVVpuelVvWDNvSExy?=
 =?utf-8?Q?3C64QS+9xZ3oamuVaXyPWyv7o+IR8Y=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ODVKSlFOZVh3WGdiUCsxcjMycGlBRllsTWlBdWt5RlR2Q2tzWEZTdnZhc1NN?=
 =?utf-8?B?MG9mU0R6Z1htM01Pam9lRHAzbzNvSHBCWHNETDcyZ20rSnFWZk9DelhNRXVW?=
 =?utf-8?B?ZUlDT25xbHA0eTdjVm1aV3VQb21ZVGt1UC9BbGEzOHR1LzdIQnZCNmNLbmZt?=
 =?utf-8?B?dGNWTEdqSzdEQ3pLSE1QWVpOTVpTd0RoT0ZzYmFxcHM5dU9LVk12RnpIbk50?=
 =?utf-8?B?dHVSV3pLY01ubFVpc1pnYnV4dmVBSFJTWkVDSWp0ZkRadlY5eDVvSU85VjFx?=
 =?utf-8?B?SjdvNEhZbzdZa0dMSmpmY0lWbkJZc0JlckdocUlIUE5ueHNmaTBrbVNoZmM3?=
 =?utf-8?B?Vkx5NWFSSnlQbVBUMW9xTmFkMjRuU2ZXRzJRY3hETCtYTS9TSC9jMkdLb1hK?=
 =?utf-8?B?dlBSWTc2ODc5L3hmTER2MjRpYytZdnpQbFdPMHdETkVsR0xlMUJ4aG01YUU1?=
 =?utf-8?B?OU02OUtIQ0gwdU1qVEs4bEh0WkVXSTAzbENxeDVjcXN1c3BzdkFyZHJyUWVR?=
 =?utf-8?B?VXZGQlZoWWNqcEhXNTM1Q3pKa2k4QkpnRTUyd1M2NEtRbXZDNUtmUWEyWlZI?=
 =?utf-8?B?QUZvN2JkZEZqQ29XS2xWNUpqdnFlODNIemNVZVBIeFZZMUUwZDI4d3l4ZHMw?=
 =?utf-8?B?dW1MbUZiRFdqWGU1Z2V6NzhiMFNrMHVaSzhDWi9rL1BaaCs3NkFycFNqRHVu?=
 =?utf-8?B?RW9xVi9BMmFYNkwxdEJKdUVMWnMxZnkrZm03QWdqelNVaTVUZHcyRTFMWW9n?=
 =?utf-8?B?QmlKVHBmQWt3cUsyVm1tQmZWME5QMGFleTh2SFpKMzFHamdjZm1iR2dwZ3Jz?=
 =?utf-8?B?eW9CMGEwR0prMXA1UjJpem14SGRJcHYrb0JJei9RNmxvbEQvOXNqY1k4aW14?=
 =?utf-8?B?YWRzVm9XTk1vR3FMY2wrTEFvRGVPTmYrR0FhS09UaWQvR0U2c0hYcTdaanVI?=
 =?utf-8?B?Qk5TME9sN0lZczVXYitjM29XTnN5VGNSaWJyMkRjQUFZdUNzYTVtWHlIN0xH?=
 =?utf-8?B?bEk5Tks5VHVzNkdBb3NoL1dsbWdBOFowUDgrUFAwWlN2S3dzNHNieTBtQ0Jr?=
 =?utf-8?B?WEp2NkwxWFY3dTc0WGxEbzZPTEdzWVBmZzNDbllZODFDM3MvRXR1Z2NZVUJS?=
 =?utf-8?B?dDRkZGdnZHJ3TW5HazhhS2NjdWRta1k0L1hHL3l3ZkJMR0J6K1BGd1JhSmFk?=
 =?utf-8?B?YjlzdXRFYy9Od0dVT292cWtLckxZaXB6VERJN3cxeXpTd21tYzkwOVlmRUQ0?=
 =?utf-8?B?M3BpekdZN21Vem9td09xV0swdUlsYW1MVTVGdUxwUjBWOEpGSHJRSTNNcWgw?=
 =?utf-8?B?Q2tJY0RuQllsM0VLVHdrMXFpOTUwNFBWNFJ0NDdURElhZDljYXZ5QjNvTEZO?=
 =?utf-8?B?SUFWNVYwb1M5YTJOck1wa0RLeis3YTM4SkNlZTFaTzlDcVUza0V1M3hOaU8z?=
 =?utf-8?B?V0E0eG4yUDlONU9NVllBdU83K0Yxd2ZNSmtwWm1tcEFiZng0VE5leEp3ejdx?=
 =?utf-8?B?cTFpT2k1MzdBU25SRFljZmR0NC8zVFRBNitDY2UrQjNkL2Z1MjNOcDFqZUs2?=
 =?utf-8?B?M0FZeTVCWndXK0szeFV0a2RFMko1T0pNK2M2M2xTYU44SFRRb2Y5NmpnR3ZC?=
 =?utf-8?B?bGZYSEVadGsvcllFdDhJNVBiYnpVVy9STGxiTkpyVkJHY1RnT2VBSTA5M3du?=
 =?utf-8?B?NHNkRkliT01lL3NJeEtzcWhtQVRDbm1rMWhSeSt5SGIxQWJvYTFnc0Y3MUp3?=
 =?utf-8?B?bkJVVHlmbkx2djloTHI3VXM5eVQ1cDRqYnVVbjVzaGszb3FVaGFURmkzdkxr?=
 =?utf-8?B?aVM4WGpQR1NpUXFoU1pFd1hxUkJjQWdzWFBLMUdXcm50Q3Z2WmZGRUFQbGtS?=
 =?utf-8?B?SmlMWEdkSFhKbGgxTGZnaWF2NE5HVFVxVFZwUUNaMmVtbENhbkJzbjNGZE12?=
 =?utf-8?B?eUMyWXNUOW03eTRkaVdHMGpRYm1qOEtQanc1bFZzOGd3R1dIVFFZKytDd0wv?=
 =?utf-8?B?RGUzNUdEWUpuVFNlUXhJYWtYWDFINVhzdmFsaVJLbkFJNFl6K3dnaXU5WUt6?=
 =?utf-8?B?V3RIUDB6YlFEK0JkUGVJYVdaMHpSZ2VBcmpKdFlGWXBqWHI4RGhnNGtEM0Fl?=
 =?utf-8?Q?pUkkZrWLO4NiAi7oikF/dGe4i?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b770d58e-3ce9-4a9a-272a-08ddb2e54808
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 06:06:38.2053
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UASFDngKjkq+EudqpTuZQMfjb4wi8rXNi9bvfcpr4wRI9E+bI3oMnTQm18kWbrxFQhV3bgam9xLU2pT1Fl8biP6eSxX1UnLqR7wJ8y7QO/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7995
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDEvMTBdIG1laTogdnNjOiBEcm9wIHVudXNlZCB2c2NfdHBfcmVx
dWVzdF9pcnEoKSBhbmQNCj4gdnNjX3RwX2ZyZWVfaXJxKCkNCj4gDQo+IERyb3AgdGhlIHVudXNl
ZCB2c2NfdHBfcmVxdWVzdF9pcnEoKSBhbmQgdnNjX3RwX2ZyZWVfaXJxKCkgZnVuY3Rpb25zLg0K
PiANCg0KVGhpcyBpcyBwcm9wb3NlZCBpbg0KaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjUvNi8x
Ny8yNSAiW1BBVENIXSBtZWk6IHZzYzogUmVtb3ZlIHVudXNlZCBpcnEgZnVuY3Rpb25zIg0KDQpC
dXQgSSBoYXZlbid0IHNlZW4gdGhhdCBHcmVnIHB1bGxlZCBwYXRjaCBpbiAtbmV4dC4NCg0KLSAt
IA0KVGhhbmtzLA0KU2FzaGENCg0KDQo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhh
bnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9taXNjL21laS92c2MtdHAuYyB8IDMx
IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gIGRyaXZlcnMvbWlzYy9tZWkvdnNj
LXRwLmggfCAgMyAtLS0NCj4gIDIgZmlsZXMgY2hhbmdlZCwgMzQgZGVsZXRpb25zKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS92c2MtdHAuYyBiL2RyaXZlcnMvbWlzYy9t
ZWkvdnNjLXRwLmMNCj4gaW5kZXggMjY3ZDBkZTVmYWRlLi45OWE1NTQ1MWUxZmMgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gKysrIGIvZHJpdmVycy9taXNjL21l
aS92c2MtdHAuYw0KPiBAQCAtNDA2LDM3ICs0MDYsNiBAQCBpbnQgdnNjX3RwX3JlZ2lzdGVyX2V2
ZW50X2NiKHN0cnVjdCB2c2NfdHAgKnRwLA0KPiB2c2NfdHBfZXZlbnRfY2JfdCBldmVudF9jYiwN
Cj4gIH0NCj4gIEVYUE9SVF9TWU1CT0xfTlNfR1BMKHZzY190cF9yZWdpc3Rlcl9ldmVudF9jYiwg
IlZTQ19UUCIpOw0KPiANCj4gLS8qKg0KPiAtICogdnNjX3RwX3JlcXVlc3RfaXJxIC0gcmVxdWVz
dCBpcnEgZm9yIHZzY190cCBkZXZpY2UNCj4gLSAqIEB0cDogdnNjX3RwIGRldmljZSBoYW5kbGUN
Cj4gLSAqLw0KPiAtaW50IHZzY190cF9yZXF1ZXN0X2lycShzdHJ1Y3QgdnNjX3RwICp0cCkNCj4g
LXsNCj4gLQlzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpID0gdHAtPnNwaTsNCj4gLQlzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmc3BpLT5kZXY7DQo+IC0JaW50IHJldDsNCj4gLQ0KPiAtCWlycV9zZXRfc3Rh
dHVzX2ZsYWdzKHNwaS0+aXJxLCBJUlFfRElTQUJMRV9VTkxBWlkpOw0KPiAtCXJldCA9IHJlcXVl
c3RfdGhyZWFkZWRfaXJxKHNwaS0+aXJxLCB2c2NfdHBfaXNyLCB2c2NfdHBfdGhyZWFkX2lzciwN
Cj4gLQkJCQkgICBJUlFGX1RSSUdHRVJfRkFMTElORyB8IElSUUZfT05FU0hPVCwNCj4gLQkJCQkg
ICBkZXZfbmFtZShkZXYpLCB0cCk7DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4g
LQ0KPiAtCXJldHVybiAwOw0KPiAtfQ0KPiAtRVhQT1JUX1NZTUJPTF9OU19HUEwodnNjX3RwX3Jl
cXVlc3RfaXJxLCAiVlNDX1RQIik7DQo+IC0NCj4gLS8qKg0KPiAtICogdnNjX3RwX2ZyZWVfaXJx
IC0gZnJlZSBpcnEgZm9yIHZzY190cCBkZXZpY2UNCj4gLSAqIEB0cDogdnNjX3RwIGRldmljZSBo
YW5kbGUNCj4gLSAqLw0KPiAtdm9pZCB2c2NfdHBfZnJlZV9pcnEoc3RydWN0IHZzY190cCAqdHAp
DQo+IC17DQo+IC0JZnJlZV9pcnEodHAtPnNwaS0+aXJxLCB0cCk7DQo+IC19DQo+IC1FWFBPUlRf
U1lNQk9MX05TX0dQTCh2c2NfdHBfZnJlZV9pcnEsICJWU0NfVFAiKTsNCj4gLQ0KPiAgLyoqDQo+
ICAgKiB2c2NfdHBfaW50cl9zeW5jaHJvbml6ZSAtIHN5bmNocm9uaXplIHZzY190cCBpbnRlcnJ1
cHQNCj4gICAqIEB0cDogdnNjX3RwIGRldmljZSBoYW5kbGUNCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWlzYy9tZWkvdnNjLXRwLmggYi9kcml2ZXJzL21pc2MvbWVpL3ZzYy10cC5oDQo+IGluZGV4
IDE0Y2ExOTVjYmRkYy4uZjk1MTNkZGMzZTQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2Mv
bWVpL3ZzYy10cC5oDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmgNCj4gQEAgLTM3
LDkgKzM3LDYgQEAgaW50IHZzY190cF94ZmVyKHN0cnVjdCB2c2NfdHAgKnRwLCB1OCBjbWQsIGNv
bnN0IHZvaWQNCj4gKm9idWYsIHNpemVfdCBvbGVuLA0KPiAgaW50IHZzY190cF9yZWdpc3Rlcl9l
dmVudF9jYihzdHJ1Y3QgdnNjX3RwICp0cCwgdnNjX3RwX2V2ZW50X2NiX3QgZXZlbnRfY2IsDQo+
ICAJCQkgICAgIHZvaWQgKmNvbnRleHQpOw0KPiANCj4gLWludCB2c2NfdHBfcmVxdWVzdF9pcnEo
c3RydWN0IHZzY190cCAqdHApOw0KPiAtdm9pZCB2c2NfdHBfZnJlZV9pcnEoc3RydWN0IHZzY190
cCAqdHApOw0KPiAtDQo+ICB2b2lkIHZzY190cF9pbnRyX2VuYWJsZShzdHJ1Y3QgdnNjX3RwICp0
cCk7DQo+ICB2b2lkIHZzY190cF9pbnRyX2Rpc2FibGUoc3RydWN0IHZzY190cCAqdHApOw0KPiAg
dm9pZCB2c2NfdHBfaW50cl9zeW5jaHJvbml6ZShzdHJ1Y3QgdnNjX3RwICp0cCk7DQo+IC0tDQo+
IDIuNDkuMA0KDQo=
