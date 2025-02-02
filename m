Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A9F1798F
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738481669; cv=fail; b=UaYOaEKTaJ3IM2Expg85AHrAIhoAsWvoWjVeh9Y9ZTREjQMO3z6wZQWwPipok5rq7ucPZs7MNXaSeoyygvP2Qqz0Pap7EtXLFnrH5qEk8pqeY8weAwH4TO98NY79rVl0aWB1IZAAnQ6LZlHb2srz/eRg496PY4ldvQ3WU/ziv3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738481669; c=relaxed/simple;
	bh=r4LYVqfbBd5rt4ZOpUINmPtu2+LobJo0NydubuJhvRw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e63xCT715/wLVkuMB6wLVPJ3fH5uatzV6xpTJsmCl1KBABAFbN+urOx39BtLKNeVzp+meZr60Iu7gRp5rFgbMFlLaptvzqMsCrqbv1hcIoOnT6Icl0t0VOHRL2V/CKOXVmqxHZ60Ayq6n2RotwCx+56DwMeQJoIJDdvkSjDea48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XyXe8U4s; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XyXe8U4s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738481667; x=1770017667;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=r4LYVqfbBd5rt4ZOpUINmPtu2+LobJo0NydubuJhvRw=;
  b=XyXe8U4sxioOBCBJx7CwEBtxp6WOLBhyWXqByDetUNuPW7XW2laMPiA8
   X/knTotPdBDrpWnFPHCuULf+C/5sJSMLzht61fUpKIvQGK0Zg8DD8X3z1
   qzE7b/KFr6DCV/mnhcNwjljLYfIOnTw+oMTO4W4oS8qmnPLo8AEUBs6Rw
   V78tq53eo/Ud3R4r/rNGIKvgAALuPljauHix4wIvAB8J9QjeEfY2aO6IL
   8YGbInK9bcU4n3HaNuXNnsRb7qSMd6mYLUlyOan+HNqOXkJYVYpwZy8go
   DjThlQZcpOBJSdn0n9UC3jPQFEjccj80M60ysBYMMpUAWele16EbRNgzB
   w==;
X-CSE-ConnectionGUID: RQfij4yHTz6Fyyjmvv0Hng==
X-CSE-MsgGUID: Rj71lxbVQUaepTfz6AKG1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11333"; a="49989945"
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="49989945"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2025 23:34:27 -0800
X-CSE-ConnectionGUID: ZoCuzx6VQbexhVhLVpR+AQ==
X-CSE-MsgGUID: Sq/3Ah9pRs29lPpQvxqhWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115142226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 01 Feb 2025 23:34:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 1 Feb 2025 23:34:25 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 1 Feb 2025 23:34:25 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 1 Feb 2025 23:34:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4bhxwCk+6Vm+lqMVp8nkREiW8JsHU48i9Czg525nrM18Jb1Cx8QlDCl9jp+3WHpKmUFAWuQcVZ4s7TcU9CH860Fz3bPw11eTihyTSmzMkWOym80LQhXEj0r6aVDvI8KSpFuvXAhascaVIRDLtII6QMScpmybV3+Xzi8RPjkMbTbqeJ+yglhf9gn7394XiVL4cN7vYGAXmCdRLOLk7ImFGlbdiQUtzvQCVuw0yVqkf69k3hxqmP5OCqXF9EX8TPibFoz0ffyrgnpajB3SOoGMr5GcEG+ymNmGuflnJtQnEDGj4sN5fggUNLFBNLUmLK2j7GTECfZKRxFGqaBr1szsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4LYVqfbBd5rt4ZOpUINmPtu2+LobJo0NydubuJhvRw=;
 b=WQcBTOm79sZ6Wu2Y8SMMkuwj9WmFa+gYACprdwqHGt+Wd9hGGxaGtiC7xObh9P7gIRUozJ0qXlUwcJb3nxKRjxqArZi6/haefgX2H10WNyvY/141ipkX/YZOYWMxQFSfaIIXGoPqlbkNCbiwphGI7vlI8vtNmxIexlTZzMXtGQ1blbkbUQsbJ0Lkd0dvpwkpCqx9VhrdzKQD/NYvgOwOM9KZHoVW4uNSIR5BsfIqjktubIYB3gvmwWSesepi52SpFErkFBAl/vrmzo8WCGO7/MXG/eu1vDzzH/J+dSLZZkzHqcO9lnYnmvVPuqPgOM1ogOPTVINnk+Xa+YQSsakosw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH7PR11MB6332.namprd11.prod.outlook.com (2603:10b6:510:1fc::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Sun, 2 Feb
 2025 07:33:51 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%3]) with mapi id 15.20.8398.018; Sun, 2 Feb 2025
 07:33:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Arnd Bergmann <arnd@arndb.de>, "linux@treblig.org" <linux@treblig.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] mei: Remove unused functions
Thread-Topic: [PATCH] mei: Remove unused functions
Thread-Index: AQHbcrYc0jai/Q8H30K6RMe+J8ZVj7MweL0AgAMq4AA=
Date: Sun, 2 Feb 2025 07:33:50 +0000
Message-ID: <CY5PR11MB636609523817706B105E4749EDEA2@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250130012654.255119-1-linux@treblig.org>
 <8c9f6d8f-cf4f-476c-aeda-25a68ea36b0b@app.fastmail.com>
In-Reply-To: <8c9f6d8f-cf4f-476c-aeda-25a68ea36b0b@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH7PR11MB6332:EE_
x-ms-office365-filtering-correlation-id: 30f6edcb-f51a-4eb2-9a98-08dd435bf044
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?NXFBc2Q3REQ2OWlrbWJqRjFTNFlrdjdnaVZYZjl3K2NGQzNHbmlHczZ1Ui9G?=
 =?utf-8?B?UHlsVFUvOGJrN0FTWEdVVVNKamRaU00zc0pOdTdsUzhnd0VUeFRnMGFqWk9x?=
 =?utf-8?B?RGovSldFSWlsbTZ3MXE0QWkzN0daaG40SUZQZFdjZXBlK1czeVAwZ3pJMkRP?=
 =?utf-8?B?MzBSUlNwakU0UWVoUjJmRHI1SUdrUG9lcVQ3TEwxVVZ3UWdkNnBxZ2wzQ2hL?=
 =?utf-8?B?c1ZoSUdKSzl2OU45T0ZQMzBuQW1xS2VFUWdmaXl3SFRXemIwTWVzSk9Qb1Ay?=
 =?utf-8?B?NVJrT2ErbXVnNEwxbUZ6Q1JtL3JKTDZrUkZkVXh1NU9IQk9ZbjIwS0VBZHJj?=
 =?utf-8?B?M25tR0hwbFRMRTVJdWthNU1zVEhYRzdwcmxFT0RySUtnR053SGRZcHJ1R0Fv?=
 =?utf-8?B?WlQ0VjhPTm1JRHF3RnVmS1FZLzZyd2o2Zis3TnMwaVBzWXJPUXBadFpkRkp0?=
 =?utf-8?B?VjA2czQwdXJhdXZtKzlFeTFQaGVCcURsdFJUWnJDNkVQQXZzOEdqdEErVWt2?=
 =?utf-8?B?cXFTWWkrTm9HWkxNT2ViemJaRXdNUHkvVGxlNkhkWUh4NWZtQWpmS1FFMlNJ?=
 =?utf-8?B?dVZNenBUUVhCdFlSSHVmajN5czJESkU5SWgxRjdyeHZkYkRDM0pWRjcvZFJo?=
 =?utf-8?B?TkQrbzJPeTRJaW8ycXRZLy94NGR1R1U4QUFmQkJlSks2bi9JYksxc1RsZVN1?=
 =?utf-8?B?L2FnUkQyaitiOWFNZ3JydkNyUTVlcHJmNHM0YkpNVWQxblZyTXNIMTJUU3B3?=
 =?utf-8?B?cGx3eDgvM2I0ZWxPZ0dKMzV3KytHeUh2T3VkRldJVGVtNnBObDVTNW9NWTYw?=
 =?utf-8?B?ZjZXREFUUUI5SUxvNmhtSUdlOWtta1N6Ni9vSVgwa1RTNm1yMU5XM1lxR1NJ?=
 =?utf-8?B?elpFZkZvL1F5bTRHRkQ3YzZrTHJtcmlVamdjRHNpM3JyeTNlNks1N3RjMmll?=
 =?utf-8?B?OW9OcU45UUQ5emJLbE9DelJvMlF6NjJXQndCazFqaUppOU1zZzZ0Vk5FajBM?=
 =?utf-8?B?eldSZWZLNE5Bd0k5S2RjTVZnWTdRUHBuRHJaYmt1ZWNUVzI1VjhCTzZKM3VI?=
 =?utf-8?B?UURCbU1Hd3JaVWNLVFBFYWhEa1lZR3QzZ292SDNBSnBwTzcyRTBrMmVuRDJn?=
 =?utf-8?B?cXZMMmlZMWpYOCs1dFZxRFdZOUlPMEtLSkovd084SnVVT0gvc3J3Ky83T3B4?=
 =?utf-8?B?aHJwUXIzSkVUd3BpaFVkMklZdWxjYUFDeEFGNFJRbk1Vc1dkck5SNUI5NVlS?=
 =?utf-8?B?bjNrZGt1MG1STzRXblg1MmswUEZ4WUJ2RFBYbTVNK0plSWI4cmZkcFBpV2ZJ?=
 =?utf-8?B?c3N4ajNsQXBRSzVXelExR3dsUFZ6K2NZTElCb0ovNHpiZEx5dUxOMHMxZzNZ?=
 =?utf-8?B?bVBFU1lDSklEMWZSZU9RTitCRDNUNHJMZkZZTkg5WGRpYlBBejB3VUtBSm5V?=
 =?utf-8?B?T25TZVNjNXlTVSttOTJpbW9wZnpGQU5WeU9ZRWNHRGhKZklrRTJ6VUxCN1hV?=
 =?utf-8?B?U3FtckduWXdpNDNKNFY4dHdnV3BEWTV1S1Izb1plejY5QkFSeVVNc0Rucits?=
 =?utf-8?B?MlA0cVFTdFdhN2pUMTlVbVJ1UU1iZTJNLzdMZ0xFa3ZJVXRRa0Z2VFNEaUdp?=
 =?utf-8?B?WndRaXlQeGNGRzY3YTNLbVcxeW5zekpSTEJ0UWxKVGVpaGZ6VlQvem0rVkg4?=
 =?utf-8?B?R2hQTHllUXFlaFJZbTh0YnpOZlM2MUQ2SFpRTkU2QXlFY1V1MDVHYW8zL1lF?=
 =?utf-8?B?Rnh4NmNxYXQ3azg4OVFBdnd1a3hPSTB3dVZLc0FHK0ZyRnB6UGZCMjBJM2M4?=
 =?utf-8?B?QTF6VUNCL0t4MXQxVkZrN082MzhZWWRPWjlJeW1oVklKVWk1UE11Y2dUYTkw?=
 =?utf-8?B?TWx6LzV5Um45eXUxRVJ4UXdnNGVSNlVySUp2ZlFOWmthektWNkpnRTNLbzFH?=
 =?utf-8?Q?qfHkHFjKMnSv5fEBIM7S5Wlr2LFT3wHE?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aXNxeW5pSmpvNGFsM096ME9oamlwcjJUOHh4WTBUUnpoVE9uTzl5Zi9rM3Iv?=
 =?utf-8?B?bEx4Y3JhMkt3b0szcUZDVmdVL0FYR2NLRVVwMjBHV2psQXNRR3VrMG1EbU8r?=
 =?utf-8?B?UnVQaXU0RG13ZmdZbk0zaVpGTWp0dEltR3R6TEZlSXR1K0NZQXFyZUoxRnFE?=
 =?utf-8?B?UXpvdGtrdE5tdlArQ0RKZUJmV3BlZ1AySXpUaEVlMlF2OHRiVzVJaDkyMmF6?=
 =?utf-8?B?MnhTU2FmU2tZSHVzQjJad01KWFVxTmxLZXlwVk4ydDlrUWNmb3NQR0RZeDVs?=
 =?utf-8?B?QzRRbkVnNzVCNTRmTTNpZ3lnUlVYaFN2SVB5L2NDZmd0cWJWU1dRdUlHNU84?=
 =?utf-8?B?c1RUck9JWkhlYTA5M2t2VzMxNE9JSDJUVnZIcEZtOGNUNVJzZzIwd0E3WGtl?=
 =?utf-8?B?M2x2SXlHNnV2MXdUZUMwZkZrZDkxYkFDT3hKU00yWVJVRGx3NXduSXYxM1dS?=
 =?utf-8?B?eExtT0lVWWpVNEQySTgrOVdJN2RhazQrenpKMUc3NEMzMGRrUFVkTFhJTTJU?=
 =?utf-8?B?WXpRclBhS0dWV2FuK2t2R2QzeGMwZU1GN3RXazRzamh1QkQrT3dnekFvcksr?=
 =?utf-8?B?NVc2T0VqUG92a00wWjNuU3Y1UUNBSHhEaytQcUZ4YldNcTIxeEN2Q1k0d0J0?=
 =?utf-8?B?cFdnQnFVNkNIN005Y2RrS0ZxVGJvaGtyVERGWDQ0R0t5YVpremNHUy9CVEh0?=
 =?utf-8?B?NlhyZDJmcS9Jc1d0a1h6ZlRZdWRKbmRkb3Vib0QzeitQei9PYVR2NUZNQkli?=
 =?utf-8?B?UUQwZ0s3Y05meFFRZ1NOWjBiZzgxZFRvaXRpOU9GTnR5elhDRVhGSlFKN0JE?=
 =?utf-8?B?THFiQzJydExnSVRQalRLdVZUUEUxVnI2V1NTVW80MzVZVndpbHNSNWVUMnRo?=
 =?utf-8?B?UXUrSER0QTRGdFF2K1dNS2VEOTBRUWZDSE5wcGQ3Rit2ekxQK01pYjhMYWVN?=
 =?utf-8?B?SWlBeFlzdU5XWVR0YmVSWU5xaDFqVm95S24xMTVBcXZReEE2UysvMWNOa2JW?=
 =?utf-8?B?d0QzUU5ITXBzSnEvSVI4UlJnbW10TG5TU1pNMFlpeXFlcmloL2NWVm9GV3B1?=
 =?utf-8?B?R2xXZEo2RXVPWUtYTWYyeEg1V3dzdi9tRFE0L21JRmpFMVppTzlGeEdmZ1NV?=
 =?utf-8?B?VVlQV2x5SmFIR1lpbEhodHMvclhlakY1Q2o0UVl5dlJZQWVheEVvRVFFSkVs?=
 =?utf-8?B?OUhMbHM1U3lKb0RHVndvaXhpNkw4WE9ZUDN4SWJ5bkVscUpRVmZndVMzelBL?=
 =?utf-8?B?N3pNb1EvRDBJSVhuU20wclZmZ3NYbTc2dllhMjlwUk9oNWkvaDVBNWdTWWNY?=
 =?utf-8?B?TUFWcG1QN3haS0xuZWd4UlRmcU9lbWRBdXdaZ3F2Q0lpdm0rUmk5UytMcHVw?=
 =?utf-8?B?d0Y5djFZUHZOa3R6bFFSeWd0a3FDTDkzOGJzOU1YUHQ4aFZUL3lvRG4xcnlR?=
 =?utf-8?B?ZGVvQnVlcHZldjJEME5PT3pEditMa3dpc1RJUStBSHdqNjgreWJyQm4zL0Fi?=
 =?utf-8?B?KzE4ZklER1JBd3JnOENuS1N5MUUzMVpsWWhubi84WmRVZW1jUld0V0xlbFZH?=
 =?utf-8?B?ME4vRVlFRWllMFlXQys0ekVaaWtlcGZzcHZwRFh3Qjg1azRKRzI4eU9uemJp?=
 =?utf-8?B?OTJZTFVVUDdvM1hXZFRWaXBKelVZdUYxM01maTVBRmpDa2FwUlFIbDNCL2pR?=
 =?utf-8?B?VVErdnVjYVFvd1cxZHlmZ2cveTI1a3ErK3JyRHpvWXNhYnZVRVFvRjJhUlNw?=
 =?utf-8?B?bCtSTGNNc3lNaUcwTk12b0NGRVh2WkN6Q1JROXVSZkNuaEdFRFF5d0JSSGp2?=
 =?utf-8?B?UEk3bG9QOS9VMVU4VDNvb2p1UlJTQ3hLMWkydzZiSVA5a3NDKzNUMDhRUGNM?=
 =?utf-8?B?OFFKQjJCMGIvck1tekVwY0FUMFhuQkpXVElJYmliL005MFpyNDFTR0JYMVh5?=
 =?utf-8?B?dWZyaSt6UW9sbmx2cG9UeFBiaHo4bzZVaEhVZWFFMjVUaWRiUnQ0ZmFWMmdw?=
 =?utf-8?B?VTNFeE4yaW5VaUQ2V0xlQ2FSM1U4c2pEYXFsWWRydzJmRFVRVEVXY0Fycyty?=
 =?utf-8?B?VkRCREdDVlZIeFAzNEtkNnlBeEFyK2I5TE5pdmdyMStlRFpldUpjZU5ZNGZ3?=
 =?utf-8?B?VTI1QzJZaERWckRuVjVkRXRuejNGemd6dGVaWUYxVkVOejR2SFhTRG1mZUJy?=
 =?utf-8?B?SGc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f6edcb-f51a-4eb2-9a98-08dd435bf044
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2025 07:33:50.8232
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TY+8IcljI6JPZqQZT9XRD0Ape2EqiwdLC1vI6b2ck+AMSwn8WHJXe+LQjQsct9t1N6hJf/AaTuMggQBDUuRXBvFL1bLxJIT/+ZXrbzVsOQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6332
X-OriginatorOrg: intel.com

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQXJuZCBCZXJnbWFubiA8
YXJuZEBhcm5kYi5kZT4NCj4gU2VudDogRnJpZGF5LCBKYW51YXJ5IDMxLCAyMDI1IDk6MTAgQU0N
Cj4gVG86IGxpbnV4QHRyZWJsaWcub3JnOyBVc3lza2luLCBBbGV4YW5kZXIgPGFsZXhhbmRlci51
c3lza2luQGludGVsLmNvbT47DQo+IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91
bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbUEFUQ0hdIG1laTogUmVtb3ZlIHVudXNlZCBmdW5jdGlvbnMNCj4gDQo+IE9uIFRo
dSwgSmFuIDMwLCAyMDI1LCBhdCAwMjoyNiwgbGludXhAdHJlYmxpZy5vcmcgd3JvdGU6DQo+ID4g
RnJvbTogIkRyLiBEYXZpZCBBbGFuIEdpbGJlcnQiIDxsaW51eEB0cmVibGlnLm9yZz4NCj4gDQo+
IEl0IGxvb2tzIGxpa2UgZ2l0LXNlbmQtZW1haWwgZmFpbGVkIHRvIGZpbmQgeW91ciBjbGVhcnRl
eHQNCj4gbmFtZSBpbiBnaXRjb25maWcuDQo+IA0KPiA+IFRoZSBmb2xsb3dpbmcgZnVuY3Rpb25z
IGhhdmUgYmVlbiBpbiB0aGUgbWVpIGNvZGUgZm9yDQo+ID4gYSBsb25nIHRpbWUgYnV0IGhhdmUg
bmV2ZXIgYmVlbiB1c2VkLg0KPiA+DQo+ID4gbWVpX3R4ZV9zZXR1cF9zYXR0MigpIHdhcyBhZGRl
ZCBpbiAyMDE0IGJ5DQo+ID4gY29tbWl0IDMyZTJiNTlmY2EyYyAoIm1laTogdHhlOiBhZGQgaHct
dHhlLmMiKQ0KPiA+DQo+ID4gbWVpX21lX2NsX3JtX2J5X3V1aWRfaWQoKSB3YXMgYWRkZWQgaW4g
MjAxNSBieQ0KPiA+IGNvbW1pdCA3OTU2M2RiOWRkZDMgKCJtZWk6IGFkZCByZWZlcmVuY2UgY291
bnRpbmcgZm9yIG1lIGNsaWVudHMiKQ0KPiA+DQo+ID4gbWVpX2NsZGV2X3V1aWQoKSB3YXMgYWRk
ZWQgaW4gMjAxNSBieQ0KPiA+IGNvbW1pdCBiYWVhY2QwMzc2OTcgKCJtZWk6IGJ1czogZXhwb3J0
IHV1aWQgYW5kIHByb3RvY29sIHZlcnNpb24gdG8NCj4gbWVpX2NsDQo+ID4gYnVzIGRyaXZlcnMi
KQ0KPiA+DQo+ID4gbWVpX2NsZGV2X3JlY3Zfbm9uYmxvY2soKSB3YXMgYWRkZWQgaW4gMjAxNiBi
eQ0KPiA+IGNvbW1pdCAwNzY4MDJkMDA2MTUgKCJtZWk6IGJ1czogZW5hYmxlIG5vbi1ibG9ja2lu
ZyBSWCIpDQo+ID4gaXQgaXMgdGhlIG9ubHkgdXNlciBvZiBtZWlfY2xkZXZfcmVjdl9ub25ibG9j
a192dGFnKCkuDQo+ID4NCj4gPiBSZW1vdmUgdGhlbS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6
IERyLiBEYXZpZCBBbGFuIEdpbGJlcnQgPGxpbnV4QHRyZWJsaWcub3JnPg0KPiANCj4gTWFrZXMg
c2Vuc2UgdG8gbWUuIElJUkMgdGhlcmUgYXJlIHBhcnQgb2YgbWVpIHRoYXQgYXJlIG9ubHkNCj4g
dXNlZCBieSBvdXQgb2YgdHJlZSBjb2RlLCBidXQgdGhpcyBpcyBub3JtYWxseSBkaXNjb3VyYWdl
ZCwNCj4gc28gbm8gb2JqZWN0aW9ucyBmcm9tIG1lIG9uIHRoYXQuDQo+IA0KPiBBY2tlZC1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4NCj4gDQo+ICAgICAgIEFybmQNCg0KTGV0IG91
dCBvZiB0cmVlIGNvZGUgYnJpbmcgdGhlbSwgaWYgbmVlZGVkLg0KDQpSZXZpZXdlZC1ieTogIEFs
ZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQoNCg0KLSAtIA0K
VGhhbmtzLA0KU2FzaGENCg0KDQo=
