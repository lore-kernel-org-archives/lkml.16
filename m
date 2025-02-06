Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A773CDF60
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 02:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738810254; cv=fail; b=G0JBCMidDmHn8T4/2Af+r2kvB2gCzn5BseftMD8lrFSJBjttyX1jy+TWu2YF6fmHYvJBgunX9nmMssv6RizpVVE79LB02NEsmJa1u5TFG8HZsJpohWIkMWd9qtauAZtrh/CirrCIzPJKBPgrWTJtHakOOvHgqKyCMm8wiO+zBPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738810254; c=relaxed/simple;
	bh=5X7WFT6R4JXHGJBgke7s9NuSX5hpmrdA5WqhdOfBDa0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=NrnR/ebTgNrDeXc0fsUwlCiGTSHJLLhP2vfxaVPHvF8xHIceme51Ks8crqDVQhc111RPclomS1T1qY7X6ltgGL5xOGJN0uERRl1FhvlEFDhF+i9DhwzXsSEb9tJBE2KIY4XjYefoxJQF8NSs2PicNb8Hbu5gPLH1pyfFZHV5k5U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XzBzYr2J; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XzBzYr2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738810251; x=1770346251;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5X7WFT6R4JXHGJBgke7s9NuSX5hpmrdA5WqhdOfBDa0=;
  b=XzBzYr2JH2Ltcdu4y73VDC7N+FqKFDLsY+bQSh0kQ4ZLn/VQXGDBitCr
   nVNvc/+KzWLiCQlaEX5Prvz+/sxfpi8yrFg1Tmjz21nwaa8R9Y4oHY7Z9
   wUjy2cwbiMXm65Bay/E3aum5YPS936zBxgRGS0gAOZ2hVmx8PIPwPjb5y
   6vtsAOJtqK1DBBA40VAy57K2iGeSUCVYXHjS2nk4LuboFdGpqYI/0rSEX
   bhyu3VoHXI13AeyGx7kUoMwvKHasjqm3CsC+u22ue3NqKosQkgDfMzQJS
   pxuXfXx3+Dnr0id/qT0/qadyy4vvZ2mtJmvmHW/kPgL555gXZqYOTR+Wv
   A==;
X-CSE-ConnectionGUID: p0cnrpSvTzyfoeXRWhhS3g==
X-CSE-MsgGUID: RznQCmSUS9+hM+RcbzbQUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39670553"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="39670553"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 18:50:50 -0800
X-CSE-ConnectionGUID: CntbBoYMTIS0XSF6m66D/A==
X-CSE-MsgGUID: DgYvAyazQiGH6QjuKyQaww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134318026"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Feb 2025 18:50:50 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 18:50:48 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 18:50:48 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 18:50:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sUx2DZyaOQAbL7DRZFTYc9OVlW0Si9zy3/o4SRXIQUBSUX1PONB4uBWw0RihcLsxoO+evV+A3xYD0zSATAr0FhbTqscgzIyiXH7Y4XP4SscmiKvv6r+a04+ZCNhAb5DV+KyF4Ec3M5OyXpzClNNnePc6sWbut7v3cewTTY4POleMLhzA8dCzXZelHHw3Z+Q59DXTe6gNaFCLiPmqjNUjBIN+SGK5ItWCDoNayMjS64uI/71vQjmqKRqocI8Ol3ogCXwqa4I7P+j1AKc1P3Mcf7x45eH46rPiwMyQJACq1y3qZ1Fewami71paUwrMIkm8BNcoB/29h97gfe+sXIM4ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8yb8mxqYJCV5EJAoCIeI+bbjLJZCQesFjHgBQ9lWE9g=;
 b=NpGeDItO6poS5+mRax6Nz60M/t4yA0g/lyZLIIYuwM+yTQAXralwbPZ28AjhnncM+g8euTIn6CWYZz624+fCvUWrl36AoaNDK5nAfElvYfMO33wdvGbhvvvG/xplMPVdlSNPbN5sjA9Y2p34G4DYl0qCdTiuRyVmNYsap2sJYI00U9khZwbjQyLtPqbdqWeHaqiIj3Jqs8UeUuWRTj+/s5Uf5BpDjQau4sdX5DCtnKjw9yeIjhdG8hAJPzppcr0D1BmlyNswG+4z7oiBVljQUJAZxt+gJGrfas9Lbyl6yUTHV4a4XS8CEL8HNeQvMeMXnQfL8KgVvS4j3HgaBRhysg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Thu, 6 Feb
 2025 02:50:18 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8398.025; Thu, 6 Feb 2025
 02:50:17 +0000
From: "Xu, Even" <even.xu@intel.com>
To: David Laight <david.laight.linux@gmail.com>
CC: lkp <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Jiri Kosina <jikos@kernel.org>, "Sun,
 Xinpeng" <xinpeng.sun@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>
Subject: RE: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Thread-Topic: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Thread-Index: AQHbclaGAK4opE2b9UeNi8wuYQCRp7MuU6qAgAm5uxCAAT+lAIAAUGyA
Date: Thu, 6 Feb 2025 02:50:17 +0000
Message-ID: <IA1PR11MB6098B4AFF412D34D2F62C535F4F62@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
	<20250129222141.478c03df@pumpkin>
	<IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
 <20250205215650.1a93dc58@pumpkin>
In-Reply-To: <20250205215650.1a93dc58@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SN7PR11MB7467:EE_
x-ms-office365-filtering-correlation-id: 4a93ff00-d7e1-4db0-1ed6-08dd4658fd3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZsBrmaga1+xsG48oXEo5cukmlok67t8d6nXCO3gCyq+XAdUEmkNONtTERhzE?=
 =?us-ascii?Q?JwkUon6YfLidNNQxVnypuJXHwEaAzd51TG8Dw8S9I43HMJLZIq48M139V0Y+?=
 =?us-ascii?Q?J0PsLwe+NnKpFlfzinA+vfDFnO94FU8xrDoTU0VsKdbkTC1e3TC4as2a7zSo?=
 =?us-ascii?Q?FwxAvd8aww92cBI4/+TAFbaUfkzNSVA+gp84jSNDPtUh8lJvk2FQ86Pl0CIi?=
 =?us-ascii?Q?dWHTHuqeMRR9k9pxlhe79ao5XrALi4fqd3KQOR+V6fBuhbKYAaQ2oJjzC7Hd?=
 =?us-ascii?Q?b1PoU108bkFThi+PD76R+MhVW1Q70dF+89Leaqi7TKVNiAR+L5mfB9eeqZJk?=
 =?us-ascii?Q?LR8QIJ1yj615xjXjQrjLZatmAtnJ86QJ2gg22Zaba6GK9edLE048JaS+khnl?=
 =?us-ascii?Q?V1dSJiR+FNFTzjWIV3cFKBuCTY3l8ZrLP7buH5ScApxAdXLcRf6K29F5bVeb?=
 =?us-ascii?Q?sUOnUH84rfMDs6/vzsWW0XOPQ8CrIfTQS0mRe8Z1HtbzJ+3KsFm2LaC7ONOM?=
 =?us-ascii?Q?+fR3+bqzVhLhFq24GAeU+F7YfdECqHT00rrc5AWjwOjlmi66a+BHGY100pQH?=
 =?us-ascii?Q?Dmb5852lbI0YhefV/c8ScORPhiRGdkwF8h5DcSRt7ft/9PEh9dWDLil385Yc?=
 =?us-ascii?Q?ZpA3N3kb+lvZ0bg7Gj6ICg6hPvX5VWGoezD8kECH1jCNIY9CBi1BIWZdW3Hf?=
 =?us-ascii?Q?VDp/jX/s/bI7bUW52BjGEX3YL3AQR1XaQSx+OdNJ3YS8rmHCLn/3gzm0kQX0?=
 =?us-ascii?Q?iI8Qer3pZkh9iBopuO0PJP5IPvXECdpnz3eHRWOSsTHiUrbbiQIoh/M2zVuZ?=
 =?us-ascii?Q?lh67eZxL4JLzqeFMpt6Ut7WpWiIb7q4EEpWqvAtxozAFkF+uITglR23wXNQ1?=
 =?us-ascii?Q?kWpb8s7PTR3seiymw3adW7n30QUFvp12a4aarNGIqMbAubbhnC54wxm2L/mo?=
 =?us-ascii?Q?n2d0G3AO2UDyLspHG85sCYwqO3JlPpbNWpyyTVvwd42iJz/vAB63l94bnzhh?=
 =?us-ascii?Q?aCwwmfNpuGiV8pkK3c9J/CIAWaQnHx9ha4i5Hdt7KULvVEWSySQNFy/LM10I?=
 =?us-ascii?Q?WE6+wXST4gLDVJlP6VlPbJzGHeWTqFDnDE9VR9sfBF3IWtdWZnZWHzll7/N3?=
 =?us-ascii?Q?wx29djmx83kSBPDVeVUJ3/zN76WnWKe6X0P1IKI/tCOolWNQZGgwml7KHHde?=
 =?us-ascii?Q?lwjTD5hLVGMLWKjl5VDBgb6r3J9f6dUffw/fW/aMk/psX7JGDaPw4nWFw2Q9?=
 =?us-ascii?Q?0kVqKIuCm7eY9LMe3sAn9gZlC9gX0sTtx11Bjx7weT1lJEQD7TN1mrJSMMKH?=
 =?us-ascii?Q?ftInBqwaMwv2onMsqtj8fMrgRPQhvCDmQdORdJS0wr4ftaP7WQgaP46/rJR7?=
 =?us-ascii?Q?5yaorPh9EWASZELtMB81T0MiXNlDquYhCxRwTe0EPTAtsW6lJw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hx2miebzgIv3tz0Dg+3eHBQpc11EiOCh8CSsfaVeNALcxqojKecgUPmowdvK?=
 =?us-ascii?Q?0/RZ0PMpGZcOToy+gg2o9kJpZQreQB5XdAOoCslSdbEUirCJtXa1gEo05GAV?=
 =?us-ascii?Q?cGZK3zKtQbjAl8jEFvvWMaY6JSn/VJM7geV2ckVZXRs6GST8DSXbyVBv828S?=
 =?us-ascii?Q?G+y3PDUQoACDLdWVFHty8blkLF+7xQBS5Wt34YNuJBp2ZvSTmbbIU8GenabJ?=
 =?us-ascii?Q?vOrtPDSYXRv36H3VXQkuMh44DPvIOWu1JRgxiE0PE0CAID3JzG4JYb8xl55Y?=
 =?us-ascii?Q?5Ga4M58s4JlWoroBGpP5eGfwnneuV/yFge8ymU70lUrdR81eU1JyNePFaG6K?=
 =?us-ascii?Q?ZL6wRaUhfQriBSdmgGlkh+ZimAs9GiMT6/8MCDGU7jPsN/mIyytBSxri3yra?=
 =?us-ascii?Q?/r6OO2YCZNNcdms23GbCbdFSQyy6PYbNxWjs894iCNZepbfhZTj5jYDxOlpr?=
 =?us-ascii?Q?El/AYZC8Dk9cfWLDhHyjxQDfeHAAFd9GxEGjtfq5SEQONGqeiP/z/3wf5ysd?=
 =?us-ascii?Q?gU8yHao7qe83ktxDyVW1kOO8ncWVcBySQKNDOGm54VOzIeLtaZoXT8NOhXny?=
 =?us-ascii?Q?7ATjlaeNP6IwhnY2pMqJ8TFddyyavys97ZUeimRcMypBESmFqaVYfgHNNohq?=
 =?us-ascii?Q?d7Uv/ARGiRA30BAR3TJcZlkS4qMD95XqbGuRY/sejmLYDuD9fDuJ7my0rI8p?=
 =?us-ascii?Q?9lzgFlf0p/3JfgOI6TZy+yAcoaBLDAURxBKmigV5bIeRRxCrBg+fq8YxAJPQ?=
 =?us-ascii?Q?OneY9HNCq0M2zjO4SD75PRatgoFuIMlP1EOxiZmFswMOO087GaO7oy5kepxr?=
 =?us-ascii?Q?ku69Ob7+fJAB+nmtvDyyNSwpb8vQrdnZvu9UT13yx8yQrFDnDmNS/MRmFXMP?=
 =?us-ascii?Q?SDWRuehsKsfT4quTkULVSDlI46k5vLEbtJ6JRMqKCJWxO+veGrXDa/FKo+Pv?=
 =?us-ascii?Q?HH5V+TuO99jdPkj0JZkk9/uEMBGs2WZsHyEH9jOr+EM3lfvFpEOzT9E3PlLu?=
 =?us-ascii?Q?auy5fJfKY2coxVOALMjfz60+7AwNfnxrlnIAJVbhmMgN0RJxwwJe5TIPXURy?=
 =?us-ascii?Q?Ne4URJLrbfbxaZ0pzZ1u01sKC/nHVvjGQPYYsdKy/OFyi00NO2ejvHy59syS?=
 =?us-ascii?Q?ISpHCxt8NyNucTiEyBehRf2E5g68kKV9MxBuOcO1nDWtN3EENc+Mb81xc9gM?=
 =?us-ascii?Q?eZ5ayUQA/QhpDpsM79TSVQcvfxAsLOap8+2u0AQ0o6v1C613jpCmzYDXmNAJ?=
 =?us-ascii?Q?Gf5cXEULYNogClL7cB594KKXCtKdNdakgkxp99AvwN4vfocoGVZQmWVWihqB?=
 =?us-ascii?Q?TstoxoFrahC0blOFHaTY7zaWVdERax/BBwWvNUMV7AiSmbPEIuwnpPkD2cK7?=
 =?us-ascii?Q?KIP2F3l+wiYa+Vab9BpQ9ZZoqshcGnU3ZV2FlLvyt5VgbIayop98/Dzg+J7W?=
 =?us-ascii?Q?5r7yC02/FjVLBpXmTFZwDqgiicRFVbb1/QsKRgCKstwRTCQKw1hrQD8sLnfH?=
 =?us-ascii?Q?boRUU6b/mdIxStzt7sQVnyk2VIExEzJtcAOvUXqvRiLxc0T1g6d8u2fM8IEE?=
 =?us-ascii?Q?B9wovrWrkIXl+X4lN5I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6098.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a93ff00-d7e1-4db0-1ed6-08dd4658fd3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 02:50:17.5642
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tzmLgXiUhWh7ctLbIfrZLOs86letETmpejgthL8pk8x0zloCmdZe5X43V7PBrLxQh/NXbXpXrjzgQkGzHMKodQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: David Laight <david.laight.linux@gmail.com>
> Sent: Thursday, February 6, 2025 5:57 AM
> To: Xu, Even <even.xu@intel.com>
> Cc: lkp <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> <xinpeng.sun@intel.com>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> lenovo@squebb.ca>
> Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: =
sparse:
> sparse: dubious: !x | !y
>=20
> On Wed, 5 Feb 2025 02:56:05 +0000
> "Xu, Even" <even.xu@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: David Laight <david.laight.linux@gmail.com>
> > > Sent: Thursday, January 30, 2025 6:22 AM
> > > To: lkp <lkp@intel.com>
> > > Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev;
> > > linux- kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun,
> > > Xinpeng <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> > > lenovo@squebb.ca>
> > > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:=
38:
> sparse:
> > > sparse: dubious: !x | !y
> > >
> > > On Wed, 29 Jan 2025 22:02:59 +0800
> > > kernel test robot <lkp@intel.com> wrote:
> > >
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> master
> > > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid=
:
> > > intel-thc: Add THC DMA interfaces
> > > > date:   3 weeks ago
> > > > config: x86_64-allyesconfig
> > > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFD
> > > > q4ov
> > > > r-lkp@intel.com/config)
> > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a
> > > > W=3D1
> > > > build):
> > > > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFD
> > > > q4ov
> > > > r-lkp@intel.com/reproduce)
> > > >
> > > > If you fix the issue in a separate patch/commit (i.e. not just a
> > > > new version of the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes:
> > > > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@
> > > > | inte
> > > > | l.com/
> > > >
> > > > sparse warnings: (new ones prefixed by >>)
> > > > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: spar=
se:
> > > > >> sparse: dubious: !x | !y
> > > >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in
> > > > included file
> > > (through include/linux/mmzone.h, include/linux/gfp.h,
> include/linux/mm.h, ...):
> > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > self-comparison always
> > > evaluates to false
> > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > self-comparison always evaluates to false
> > > >
> > > > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > > ...
> > > >    297		for (i =3D 0; i < config->prd_tbl_num; i++) {
> > > >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])
> > > >    299				continue;
> > > ...
> > >
> > > If zeros are unlikely the bit-wise 'or' is pretty likely to generate
> > > better code than a logical 'or'.
> > >
> > > 	David
> >
> > Good suggestion!
> > So the code can be optimized to:
> > 	for (i =3D 0; i < config->prd_tbl_num; i++) {
> > 	         if (config->sgls[i] && config->sgls_nent[i]) {
> >                                     ......
> >                        }
>=20
> That just adds a level of indentation to the source.
> It'll generate much the same code as !x || !y.
> Both will generate two conditional branches.
>=20
> It almost certainly makes in immeasurable difference here, but !x | !y ca=
n be
> generated using (on x86) the 'sete' instruction to get a 0/1 from the x =
=3D=3D 0
> compare (that sets the flags), and then doing an 'or' and a single jump.

You are right.
I do a simple testing:

83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
0f 94 c2                sete   %dl
83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
0f 94 c0                sete   %al
09 d0                   or     %edx,%eax
84 c0                   test   %al,%al
74 0f                   je     1186 <main+0x3d>

Compare to:

83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
74 06                   je     116f <main+0x26>
83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
75 0f                   jne    117e <main+0x35>

So you suggest I'd better keep the original (!x | !y) code, if just for unl=
ikely Zero comparing?

Thanks!

Best Regards,
Even Xu

>=20
> 	David
>=20
> > 	}
> >
> > Will create a patch for this.
> >
> > Best Regards,
> > Even Xu
> >
> >

