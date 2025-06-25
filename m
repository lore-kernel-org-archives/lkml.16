Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C4129B226
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845696; cv=fail; b=GP9ZqSB4c/BFRdz3ayArvQSouZW+LRRzXXcLcjICeUS9rJbgCs7rkWkFkmjdUiqfTi0EGuy5iEa0lO2PT4b+JvVJLwVw8umD05PJ51ecZtkbync7F7EG27+3i6P6sUgHWMJPQqhhjSZyBjaNvHbgOw14oQ7pvRskDUmojmYbAHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845696; c=relaxed/simple;
	bh=lB+6wwXYqZgPwyfoO+s5pvkJ9vmo8Xg08XykL+Zl9NI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PQdWFx1jM8rBazcN/WqBDpWEWsWlR+zVfRT0BBv6J0ThPFrvUo4oMr7rTP2cQ1v36i8JYGHeJACsrI9RPkIyQwGFFEwq/tS4xQ7Z9nK/8zVH5xvAdZW9qxFh6ztNJLlwWYjn9LlCWnBj9mcD+URCFtCzJ2RN7Y+CmvdCrTiI9lU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdW6X/8V; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdW6X/8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750845695; x=1782381695;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=lB+6wwXYqZgPwyfoO+s5pvkJ9vmo8Xg08XykL+Zl9NI=;
  b=QdW6X/8Vrif5otg/OknR9DHMh4c/qH1eGpLSEmRb9uGd3aZzEKQKBmJ8
   jLbZFShWEvGb3xK12g/U5xUWx4wuC6tcBN9uOB4hEEqvsn6E5fo/SweMK
   mzEveNK+v2mVh7TZ25G22J9xtvgcwK+kjMIB+ByYJ6N1C93UuHr+sZYuI
   Q/xfcJdZ7lYXn6usgt894K05DXqjgpG4xsiUxiOUGW5fgTTtU0OSRUGN+
   wwgnW1Cy9OVmNcW915tySGfNsurhQx9M0PDgM5ZLKa6ALA7IKrhaLmc0J
   43eMl9wDwJHauHPpT28rlrgv9xJggbpSsdy4xiOZOXUNYiJPYglknZOOS
   w==;
X-CSE-ConnectionGUID: rWhdhLVhSFCmMYqpcuZNTg==
X-CSE-MsgGUID: bYcGAvI0Q8KxS4nM6hVr9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="56788151"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="56788151"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:01:34 -0700
X-CSE-ConnectionGUID: 89WDVdISS/uosa6cvO2wMw==
X-CSE-MsgGUID: EkSIq8PVSd6s+2a6PiFcUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="183208436"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:01:34 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:01:33 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:01:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:01:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTIN6Q03CuczZXdvbjsgrO74tjx86BBkw1pf8EivY/K2A+QsbA4uL6z/sshKlgSOomEdRfpvyOhruvdOrLamJ8nk1X5mCvz+pxXvJwYx2BHK+JWdrAK6NTL/v3jUJbHmvMkELWISLJGtwzVpk4s5bIFmGf1uAGUHLqgftYsgai98CgZLkBIiXi7bqHdr/OnQGE4dXmM2ZORcRx0qstuCEEITkEr7juayuBYMmRG1SKE9E0cEPeMgP2e0zyA+pS9q80jv4ih13dxUTDtB7wKY5FwM6S9lVqXLjSqcJsknAsTNcBiQhOW3d7tn/T6eBKuL7KmMqja3lBbXlsgrajMp4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lB+6wwXYqZgPwyfoO+s5pvkJ9vmo8Xg08XykL+Zl9NI=;
 b=TxmHsHdkOkhrTxfuFYvyMONvp/kUh5pQePJaZOIeX4pGToCpzP6t8/RUeJt0goCnb1xJJ6EiNmMweVM4TQAiu7oNFFnRAFl9SZmAyOPd0aBjexYdm6/qwxKOQjV/mcydiGxw+V4erLSq3mXETZx63my6jdAGpx2QW1QyM+jv9ERnX5pKd4YSYIzWTcIeYJi+2JXeFh6ucFv8+HX9OaXf4dhWU9mFLi1EgTbVbNttBVyuwN7izoveLfJCVWpvqWfQnNUr4dCqaynjDUGJiKHb88H9f5XV/NRvOUzl8rx76itCuXHTEH0XYI5vfdn/GfuFuMfitOOh8aPyQHVgn5mqxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ2PR11MB8300.namprd11.prod.outlook.com (2603:10b6:a03:548::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 10:01:02 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 10:01:02 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 07/10] mei: vsc: Unset the event callback on remove and
 probe errors
Thread-Topic: [PATCH 07/10] mei: vsc: Unset the event callback on remove and
 probe errors
Thread-Index: AQHb5BwBQe+E71cuX0e6FdvRj9tOGrQTp8eQ
Date: Wed, 25 Jun 2025 10:01:02 +0000
Message-ID: <CY5PR11MB6366F0684A781A9F0EF1AA3EED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-8-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-8-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ2PR11MB8300:EE_
x-ms-office365-filtering-correlation-id: 5749dc26-0d6a-4f2c-8f35-08ddb3cf319e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?N3MyL0RIOFI2YXlYSE5aSGE2bXFiVnF1Qk1oUVZMQjh4cTFKb3krb0pQZjVS?=
 =?utf-8?B?RFdUaHk0R2JoOXEwL3pML2xXUU1sUGVTWis1M3RKLzdUR01tM0VTK0NxK1Zw?=
 =?utf-8?B?cGttcTI4ZXZCaDRLeTl1VUF2d2pYeVJVK2VadFREd2tsQlVkM1BsU2RGb2dG?=
 =?utf-8?B?RjV1MTBHcWpWakZ4UEdzUVRTY0tRRTNZYmdmUDM0NGI2bTZ5YS9ueWw0SEx0?=
 =?utf-8?B?dTA3c2wvcGI2bkdxekZuMFFkajVQT2c0c3RKcjNTWUdBYWcxVFQvaUwycDVx?=
 =?utf-8?B?azZCTnBIZXZXNjEvRllkUyt4YW91VjUyWEpHV2lzYk16eXZSOERLTjRORklh?=
 =?utf-8?B?ZTRaVW5oUzZMRWdTaldjNnM1T2NHWDB4TWZsQ3kzaGRQc3RLVCtyNkxBVVc5?=
 =?utf-8?B?cUhoN0x4SU1GalVVcFE4aVNlSEZqeW9qQlN3aUNVdDRXQ1lTRnp5b2xDS3RS?=
 =?utf-8?B?enBVa1I0aytTZ21WTkhnWDdISkhrQmExTXJabmRPSEFhbk5yY25CUVRQdUhG?=
 =?utf-8?B?NzZ2cmJsbFdFRVlCWjlSdGxqdzhvZ2pPMXowRjl0djlnQUhIK1BBQXFadStS?=
 =?utf-8?B?b2RrM25VenYveS9SbmtkdmhNbkFQYi8xOUszUjNDSVJvUmhJUUk3YXIwLzNL?=
 =?utf-8?B?TXZEblpZOW90RlZrcXNuY3E1dTA2OFpYSmZxT1krd1BKdFJjNE1pbkN1L1NT?=
 =?utf-8?B?NGs4aTNEajRORVBJcTFXUjBLQ0JndklIZEtnY2Nqb0FsTk5RODdGQ3plcWlM?=
 =?utf-8?B?Nll1K3J1WmpuMWVaT0pUUGp1ZVJPZkpKdyt6ZzlSSHMrZExaSUNsUjBwanhM?=
 =?utf-8?B?VG1tL0pJK1JYNzN5SE9OVTdtMktjekVDN0VLTDJBMFpxOFVkY3VJMEdFc01j?=
 =?utf-8?B?YjNYWGNjbkxpNStjZk43blBWUlVkZzV1dTUrNFFCM2RBNmVkTlQrUjV3V3dn?=
 =?utf-8?B?UEtObjd4bmZWeEc5bGFRSnJYeWV6T1ZDRVNvTnRVNHV3eVQ0NTVvbGp5UWJC?=
 =?utf-8?B?ajgwelUxV3FENFZMZzJlWnlSN2xRaUowbld6Y3VLSkc4UVJTRktHeDRldWRt?=
 =?utf-8?B?TVdFT01WYWxyY0pPdW9UbmFuSERYZ1BRVW9mU3lRb2J4UjdzTmRJaFZxa2xr?=
 =?utf-8?B?R21FUG94SWtxRDZMMXpOckFxUFZKTVZGMjc4TS96S2dpbzh1VlkrL2FqL3VR?=
 =?utf-8?B?YTYyd1pkQjFEQ0xOTnhGT1hycXpScEJTWGlNUERBNlJJMFcyM3A5NGNRZ1c0?=
 =?utf-8?B?VUxnN2pJR1ZaaTVhbCtFdXBPUXpBSGpqWkRmWG81cUNLbjFvdDd6WGxhRVFp?=
 =?utf-8?B?QW5qTkMrZWljbHN4Rms1QWhYL2Iyc3dpdEh6c2s2VTY0cllnWUVMaldSZzJ6?=
 =?utf-8?B?MnBPMis5d1FRTXhIa2gvaVJWUVExeUFJNUhvVzZHaG1UdURjQzdWblN1dEdK?=
 =?utf-8?B?Mitlek16UWs2SmwxWVBhOWZ6ckxYQVplWWVCRXpZU1IxSnRialgybmVyUFJn?=
 =?utf-8?B?LytySGZoc3p5SUN1Sy9PU2ZmWGRLa1ltV0J1ZG9LRVU2SkJlNHRTZGtqK1Vs?=
 =?utf-8?B?RFdOcSthOEdmQ256bmx3RjVTRndjeTdNeUZYN0lveUxuamhnVTczVVNwMDNw?=
 =?utf-8?B?L0ppaE4wdWt5QXpOVDJUZnBBUVJTbmxCRGRLZWIwVG4rRERWYUp2UmFFMCtZ?=
 =?utf-8?B?ckp5UnhMV0lEcW1iME1YdFp0OFBOTk5XOFdRYnNyZDNnSTJXbEhhNkphVi91?=
 =?utf-8?B?RWIveXRja3B0Z2FLbEQyYklSc2xDWUJXYS9qTE9pVmNwWHJUeEFpUnk3MEs0?=
 =?utf-8?B?b2YrdmZVNDFDSUlBMmhMUWh1cW5rcmF5L1FnYnI3R0IvTW9aK2FPeHhDU3BW?=
 =?utf-8?B?NUNHWlNrMmJ5L1dNaE55RmRPM2NGaXdocFA4Y1VrSVdrTUM3QU44ZmpIN0Fn?=
 =?utf-8?B?WDlQOHlKVGh0dlRiallCK2w5QWVkZFBhOTNxdHFGUXlwWmI3ZEpoMFpVYXRT?=
 =?utf-8?Q?9X+LYGx31q2H/Xe3QvjwGK9+2lCP4s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eTU1b3d1UW9uQTJuVFlBZE1VWm1uL1lqa1JuUlMwZ2R3WkM4ZlNrdkhVaEgz?=
 =?utf-8?B?UXpwUm04RCtyMTl4MEVSeVc1SjhKUlBNSVEyazF5NkRjR1VjY2Y4UmZlOGtZ?=
 =?utf-8?B?YkJYdEc2RGo2MmxWbGlVUzQydEJnOW5pTGQwU3ZwTFdUdXZBQUxTQ1JDUTZx?=
 =?utf-8?B?QkpScVVZNlFpQmJkY0NuVlhobndVTHRhM2VPT3l4NHEyRnd1YVVsb0ZWVlFa?=
 =?utf-8?B?c2dmOVArSWdxcEhoNVhTcWcwTVFCRlpPaVdIWXdyTWx2YzZ1enB3emFFRWlk?=
 =?utf-8?B?S3Ivb0lUQllFWDlmeXJ1WUZRYldmdDQ2OTFHNkl2a2RjdUNlUlpWQTFGaTRa?=
 =?utf-8?B?QmNWZmh0RjJDS25rRS8yZDl4SjZsdUhoY3BHb2pPeDl6bVlaUTNQQWVyWXc3?=
 =?utf-8?B?L2kydU9KMGVnWis0U1NsWWhqSytvcGYrK3JGSE9hNzJoYkEzWURLZUd2eGF0?=
 =?utf-8?B?MmFIV0pkMFlIN3ZGd1puUEhnSmg5QXZlTjdHS2FUVXFUYXE0VU5SNjlkQ2dm?=
 =?utf-8?B?OWRoMk5ydUNwaktLaUVmTHlWSmo4ZUUxWlJLVm9jWkVMRHllVk40THRxWlZu?=
 =?utf-8?B?MUhHVlNieCt2VDNEUjZvbUVqcnJqaU9BeEh0SXZrZFA2NlhnQUFuSXdVQ2Rv?=
 =?utf-8?B?RTFGVjZLczl2RjAzZ3FuYUp6dmYwUkkrMmFMWWlRWXE3TzhPbTJPQ2Z5QVd6?=
 =?utf-8?B?a0tZSjRxcDR5NDd2ZlFvR0p3UytkL29GbkVEWDBhTkllSndoWmNFVVpoR3I0?=
 =?utf-8?B?b1JDOS9YUTBpdVdUTDRPcGN0WkMzSEhqZERPd29IZDZJVHQwbEJyVTN6eTVr?=
 =?utf-8?B?dWppVzJON2VJQ2N6Zkx5Z1MrKzUzSHlqOWp6NVp0TzNKU1M3Z2RwYzlQWU1W?=
 =?utf-8?B?ZklYamhQeFpLcFJRYjd2blR1cnRvS1hmN3dzS0tJdllqOGJxZG50UlVMaFZm?=
 =?utf-8?B?NDBnaVZHUVREUU9xa0J5U1NYQkJCZVFKNy9RQzdqUi9KUzNnd0s1OWNoZjZM?=
 =?utf-8?B?RWtmTEtNanBER3lTUzhVTGVhWW96aHJkUzdZdmMxTXdYYm5nbEpvYzB0eUdK?=
 =?utf-8?B?YkdwYk4wQm80cG1CaDNiQlhGanRZdUVOU2ZuNGMzV2tJQW1nY3Mza3JET09n?=
 =?utf-8?B?a25JZ2FkbDByNTFIQ0JRcFNUK0xQdjhmekdZODdwbzgvcGtqVU9ZcmpkdEty?=
 =?utf-8?B?Z21sRnYzK3IyN0xoVkhRMXZwcHpRV3o1bHVJU0hpajVHcnVzT2tlWERZcFBO?=
 =?utf-8?B?bGtueGdBZG84YXNJcUNOTG16YzlKRDJCSmRzTUE5cnFjbzNzN0c4NWdSVmxw?=
 =?utf-8?B?ZGd4VHpVT0VsVlJvZUxwQmIxSDU3d1U3dkRrZXZaTFhBY3o4eEhQcGh3TGFI?=
 =?utf-8?B?RVFJOE4vQ0MzMzQyM2VmS3J1WEY2K0Jvb1pVby8ySUZUUkZwK3F0RnJlbHN0?=
 =?utf-8?B?VVJnUmFXWlRzKzE0c2NYNG1RVnhmL0hCWUc4aHN5Sm5mT2t5bVk0SlBBZmNJ?=
 =?utf-8?B?WkNML3ArUTRzV094T3RNdTRtR1Z4UFRkWDdFSW9HNmhqZTMvcTFNUHgwU1lQ?=
 =?utf-8?B?YU1DTkFRcEE0VDVha2dIc3JNSm9CNTRCMWt3aVFac3RYckhhTithek1Wamx4?=
 =?utf-8?B?SkpWZlBnbUlleGZtSENFVEFtYTdaaWJJVXpQeTl4Z2lPZ3QyQUd6SEswYk1p?=
 =?utf-8?B?cE9wRHhEMnhZeDRra2htUTI3c21BWFFBWlk3MnNLOHpoRFVRSlZyeGNETUxy?=
 =?utf-8?B?aHAwYUJJUklOK1VzU005Qm9XaGpNOGx4VXpUd016blhONk9tWTBnV0d4L3Qr?=
 =?utf-8?B?ZExLaWxYREZpUnRzMzNzdmhYR0NOOU91ejZqWXZiYm9hY3hiSDFjdWNkWFVL?=
 =?utf-8?B?T3dZSkd3ckE2L1l0dXdzZmpPUEd4ZlVwVEhGRU1qMGg2OTFXYk1LQ25vWDg2?=
 =?utf-8?B?eTVBVXJLa3IrRlB6VW1UL2ZhQTlIajBhTHRkQkpGdGpkSWhJSmFKUUI4c09Z?=
 =?utf-8?B?STA5ejdETnRyS0xnZURiQk9LWThZeWRxVmFOYkZCWFo4dHJOL0poK0F5VjZq?=
 =?utf-8?B?L09RREJIQzlkUGMvZWpDdThybWdPbDJDVXFJSWF1WW1qcVAxUmgwNit3NGJY?=
 =?utf-8?Q?FJh4HViJNEij7PSHF4fBoEuaj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5749dc26-0d6a-4f2c-8f35-08ddb3cf319e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:01:02.8503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zFVBaeOuJtKOVqcJwf6NIaG+Pvq/TNi1KRGwGgFVm8mW+02MRKIsnOqtQHxKXDHcfj6bXmQo+xkk/n3l/AGxzsNGgekzROvO2v2Dq2Drmrs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8300
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDcvMTBdIG1laTogdnNjOiBVbnNldCB0aGUgZXZlbnQgY2FsbGJh
Y2sgb24gcmVtb3ZlIGFuZA0KPiBwcm9iZSBlcnJvcnMNCj4gDQo+IE1ha2UgbWVpX3ZzY19yZW1v
dmUoKSBwcm9wZXJseSB1bnNldCB0aGUgY2FsbGJhY2sgdG8gYXZvaWQgYSBkZWFkIGNhbGxiYWNr
DQo+IHN0aWNraW5nIGFyb3VuZCBhZnRlciBwcm9iZSBlcnJvcnMgb3IgdW5iaW5kaW5nIG9mIHRo
ZSBwbGF0Zm9ybSBkcml2ZXIuDQo+IA0KDQpSZXZpZXdlZC1ieTogQWxleGFuZGVyIFVzeXNraW4g
PGFsZXhhbmRlci51c3lza2luQGludGVsLmNvbT4NCg0KPiBGaXhlczogMzg2YTc2NmM0MTY5ICgi
bWVpOiBBZGQgTUVJIGhhcmR3YXJlIHN1cHBvcnQgZm9yIElWU0MgZGV2aWNlIikNCj4gU2lnbmVk
LW9mZi1ieTogSGFucyBkZSBHb2VkZSA8aGFuc2dAa2VybmVsLm9yZz4NCj4gLS0tDQo+ICBkcml2
ZXJzL21pc2MvbWVpL3BsYXRmb3JtLXZzYy5jIHwgNSArKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9tZWkvcGxh
dGZvcm0tdnNjLmMgYi9kcml2ZXJzL21pc2MvbWVpL3BsYXRmb3JtLXZzYy5jDQo+IGluZGV4IDFh
Yzg1ZjAyNTFjNS4uYjJiNWEyMGFlM2ZhIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21pc2MvbWVp
L3BsYXRmb3JtLXZzYy5jDQo+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkvcGxhdGZvcm0tdnNjLmMN
Cj4gQEAgLTM4MCw2ICszODAsOCBAQCBzdGF0aWMgaW50IG1laV92c2NfcHJvYmUoc3RydWN0IHBs
YXRmb3JtX2RldmljZQ0KPiAqcGRldikNCj4gIGVycl9jYW5jZWw6DQo+ICAJbWVpX2NhbmNlbF93
b3JrKG1laV9kZXYpOw0KPiANCj4gKwl2c2NfdHBfcmVnaXN0ZXJfZXZlbnRfY2IodHAsIE5VTEws
IE5VTEwpOw0KPiArDQo+ICAJbWVpX2Rpc2FibGVfaW50ZXJydXB0cyhtZWlfZGV2KTsNCj4gDQo+
ICAJcmV0dXJuIHJldDsNCj4gQEAgLTM4OCwxMSArMzkwLDE0IEBAIHN0YXRpYyBpbnQgbWVpX3Zz
Y19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlDQo+ICpwZGV2KQ0KPiAgc3RhdGljIHZvaWQg
bWVpX3ZzY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIHsNCj4gIAlz
dHJ1Y3QgbWVpX2RldmljZSAqbWVpX2RldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0K
PiArCXN0cnVjdCBtZWlfdnNjX2h3ICpodyA9IG1laV9kZXZfdG9fdnNjX2h3KG1laV9kZXYpOw0K
PiANCj4gIAlwbV9ydW50aW1lX2Rpc2FibGUobWVpX2Rldi0+ZGV2KTsNCj4gDQo+ICAJbWVpX3N0
b3AobWVpX2Rldik7DQo+IA0KPiArCXZzY190cF9yZWdpc3Rlcl9ldmVudF9jYihody0+dHAsIE5V
TEwsIE5VTEwpOw0KPiArDQo+ICAJbWVpX2Rpc2FibGVfaW50ZXJydXB0cyhtZWlfZGV2KTsNCj4g
DQo+ICAJbWVpX2RlcmVnaXN0ZXIobWVpX2Rldik7DQo+IC0tDQo+IDIuNDkuMA0KDQo=
