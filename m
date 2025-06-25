Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39DB1DF25D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838618; cv=fail; b=tsdymQjd0UgHBqDTzIeaAovCjbpRU3/vpvY3i9WSS/KlBiesefgsRZQNSz4JyFJIu9K6WJH1GCXrSV6LTCFY4Z4M7rH6j1yXnjpXqWdc5yq2HgDfw0PacGgn2dALlmurXWLzIhQUfg2xvH7yCmfliLbx2fm6uDU+pFiVwy1+L/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838618; c=relaxed/simple;
	bh=aycw/Vfc+lW9Pe4E+AaqzrRbPy1OIt9nRipgIEZhFyM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vnb/U58I6Oi/V2XEg4kdLVxcSBiSbp30yMsg/JfPg5LDBnTlrlIjU2ExGRlHmAfcaMhjSfeNWZ+SrNGJxg6Nm/tx6eQgFYZSDyZ1H5DnmiZ3UNho6f4kWeCdlGl4uedLxZoeicqu3g3W2lvoWJzA5fJEgGinIPaQnAZ8oLcMWKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE/OsGbC; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE/OsGbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750838617; x=1782374617;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aycw/Vfc+lW9Pe4E+AaqzrRbPy1OIt9nRipgIEZhFyM=;
  b=BE/OsGbCRQ6jucKmAX6KE1jzTb4jFfBicJZMslRZZz8ijZjJBp2Of7xB
   dLrs9FPSINRS+OBMYoqfTZJSJnomTaFGHmKQSJ/jY1DyyuIsg5WJyuAWo
   sc/d/mEOkwJs0DVsQqOkqFEvBkLe4uKQXh2yODZ6BlbzWxb2Wo8j/Vl6w
   x3NFw2PVzD2d1azFGhUF5nqu+n7B2VrlRSz1JeUC0JSRA0yZraoacund7
   N6fUBkWuxCmFNHTE2LfpMBenRW/zTaRb6hFSQF/CVVV6znjTLuEktd7L+
   d9r3SpCgB0w86kYLJYpEdnoUaFMcuj0DgS8BoqeRviGsAWklrCV4YlrFU
   g==;
X-CSE-ConnectionGUID: ovd57QbQTbimg6tRpdIxwA==
X-CSE-MsgGUID: xcnPanM9Qniitho5Cj0g5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="52326726"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="52326726"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:03:36 -0700
X-CSE-ConnectionGUID: 7V2VIk6NT7Wdl5gRm0DFAQ==
X-CSE-MsgGUID: MtwapLB5QcisSGF7807o4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="152842848"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 01:03:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 01:03:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 01:03:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.48)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 01:03:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lPboi0PUThXITsfPGyR/Hv69R9VC/78H5PBJn8KtF0oYe5iFaLBXXIJ2ifyJZDKSJJK7ADlI+GHgrcjZ+6RVmY2NJoETPONvTGwy3Wq/235pyxZI8VO5P0AOipOnx0cTyW3/vlrpo/YktN/0ZybNSBpq2Fm6QwsW8kkdjYo9vlkQB5z7RUILfuCZ/t7Fi8VRDoB03Ykqe1Lz72DHH2or24uUWhEKT+de3+7I+hjiH96O3g2S40o3gJ4TtEXi+ILJkWPUZEWfJJDLYGoaG9IJjciiQoovOkcj/q8AdzB4qELbWFgyagrubLysU3pae6POpLjZ8TEJ4rM2NT22+sa6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aycw/Vfc+lW9Pe4E+AaqzrRbPy1OIt9nRipgIEZhFyM=;
 b=qLfWXJ7z+tyLiC0Gm1RBtVomYk09owU5igPvCXqGbN8uRcvzxyKmy3iq02uEFSGYmfyc3RFWgpDXr+obuxPxTn5hrC6tgoFKHy0MkinIBTqw3/Ofk0hOqcBTsM8ExL+kPDsxnQTRUW54fZUwKzn3ZUt5BAQymklYl7d548OSch2h8VYd9mryK9KXJjHoNOCiY2qctUEAijDS/QWq+9MbvnLnTlLn4oPN6d1JwNq+WoNYfUZNdJlNZ9lJPesBI891VabyIjOO2VKp1tfs35VzwGhZNkRMHkhtI5D8sYKfUfngwBoOFbgaP2nOcY95SPA5H9Tc1lR0Pkehw88PYXGbuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CY5PR11MB6487.namprd11.prod.outlook.com (2603:10b6:930:31::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 08:03:32 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 08:03:31 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 05/10] mei: vsc: Destroy mutex after freeing the IRQ
Thread-Topic: [PATCH 05/10] mei: vsc: Destroy mutex after freeing the IRQ
Thread-Index: AQHb5Bv7q3OqN8RiokWJBRbwmtG+NbQThvkw
Date: Wed, 25 Jun 2025 08:03:31 +0000
Message-ID: <CY5PR11MB6366ABBCC7A1CB3AB70098C9ED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-6-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-6-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CY5PR11MB6487:EE_
x-ms-office365-filtering-correlation-id: 69bd01c4-5f04-4487-2dfa-08ddb3bec66f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?a081TzhjU1VTRGpoQ25VY2txTU1mS25vcDJ3bStZWlkrZmtyOG1EbnRaWWJv?=
 =?utf-8?B?TS9LaGdVTzlmWnRlamVLWFpjSHErUkFGNXpTYnNmOVFUVno0TjAveEZNTGhX?=
 =?utf-8?B?NUZZUHo5M3U0cmMzeERrZW9sS0pQREcwdUU4MDFFM2swc3RZbjBNUXRYZzZI?=
 =?utf-8?B?ekJKQjc3VkZac0RzK3dLamdEY2FTVG00S2lsU1dBMzExOVVNSlF3bVJFdG9R?=
 =?utf-8?B?c3VjbTkzZTF2dEVCRlo1TzkwOXlLbWFwVWFOZG5JLytpWE81aFhPVU9NVWxI?=
 =?utf-8?B?OXlINVlsbEZqNXhBQ0lCdGpWSFZZb2c5YmtZTWZ0SExLSXB2NkZjZ1NCTTUw?=
 =?utf-8?B?NWtSYTJMZVM4TlhrY21ya3JpN1hOb2x0dEJQRTJ1anpGaHRXWUxkbUxLMmwx?=
 =?utf-8?B?RU5oMks1QmtMRW1HS2hKanhDY2c1MncrcXh2bDVlQkt0YW1ucjV5RDBPMDl1?=
 =?utf-8?B?OTZRZVVGNmltUU9IN09ldlllalJsMlNNVzNPME5PZ3lKamNENDFCUEV5aldk?=
 =?utf-8?B?M21TRDBGcER4WndxNTNEVERBMmFvSWJvcXkybFhBeTU4TllieFkyWnErS2JR?=
 =?utf-8?B?aTROYXhzZkt6bVhjeTdvUjNQTEYxSFI3NVRSeVM0b0R5Mlp3djNiRVp5RjdH?=
 =?utf-8?B?eGNSa08zdEcxME1iWkR5VG1qblF5bnJjY25YdGdkRE5WOXZ0eUVLY25YZjVF?=
 =?utf-8?B?Y0VBTG05MndXaUU1TDNzWVdTb0JjRmVNODM5UVUzMXRaWVFkVlVXcnNHZ0R3?=
 =?utf-8?B?RFE4Z2lvb2Z5TXZvOVhsZXlVRURyZW5EYXNLZU9zNk54SlIwRkF6bW5wZm90?=
 =?utf-8?B?QlhuN3pudy9tUjJGTTdpTm9qRndvUFBtNituTDJQemNVaFdYa1pKbmFpdDla?=
 =?utf-8?B?d0MyeERUa2VoSlVjT29BUWVSb3JhRG1ucElaTVBGTUJkNys4ajF6N0orNFBV?=
 =?utf-8?B?cWRLVGg1Uy94U3N5eVcvOWsrU3k3MS9ScExQcFE4K3JtY0JFcG1lMDl4NC9O?=
 =?utf-8?B?NWpCTDR3Vm5nYUEzb01yMjduN3pkcmkyZUljTGlhRm9CUGdyL3pVdWtmVEJJ?=
 =?utf-8?B?TG1mOVhoeHROenprbmhyVzhjSWZuU3ZQRkpFN2VpeXF2Y2ZVZTZ1bld3SHFQ?=
 =?utf-8?B?OTlxRS9sWjBWSm1Qa09oNjNpQlZlZy9WbTNYYXVVbjFLT3pNVHpLN3cweEF0?=
 =?utf-8?B?VFBKblNWTWpHR3h5TEROaE56NFQ5WklSUFQ5a3pJNkFoSWsvclQwLzEvQkcv?=
 =?utf-8?B?ZEYwU0JBUUlTREZCS1phWkh0dEJKNzVCYm4wZmlrR0dKMzM1cC8xOEppeG9i?=
 =?utf-8?B?NlZjWVhvamFvaEFHeTJkY0l0M28zY0pOWkcxanFucHB6OHNBWm5hRjRnWFN1?=
 =?utf-8?B?akdtc09FUGpKVGRNWjI2dEp1aTVFb2FVbkhvbVJqZHJRMWphSlVROHQ4UHdK?=
 =?utf-8?B?S3Mrc1k1UkxvblNzdFU5d3lGV3kvRzJrSXdDcHdJODRxUEkwb3BPc1MxYjBx?=
 =?utf-8?B?cEpkM0kvRFZaa2s2SnpTallCNGxCZzV1SFFDNUw3dXRhY0RrNDQ0Y2hydVpy?=
 =?utf-8?B?Nmt1SkQ5ekVhdnc2NDVhem1kUzkvY2NrRExRa2czRGdBam5KY25xM0xYWmFE?=
 =?utf-8?B?ajFKRzJGRWtueUVXSU5YclJQcGRWTFZiazIvcWRmeUVML2dNYk5hNzNVQVdv?=
 =?utf-8?B?RHlkd2o1ZDlkM1BNMFk2Ykh2SjBCRk1jd1p0YkVndjBsc1d6SlRXUWVqdUZG?=
 =?utf-8?B?MmkrSW5WSFIyNnN6eGFZNDFxOXZXNitpVHhuVE8yUzdoekloOVFxOU5mQjJ3?=
 =?utf-8?B?MnNhckpQNWU0VDR2NFJKN25oV0VNdXJZeDYzSXJ5U1h5dGVaKzExNTNVUjFP?=
 =?utf-8?B?U1FsL3VNOFFKZkpqM3dOZVdYZXBuaUEvSklOd2FKUDByZ1dBTkNXalZUbnZm?=
 =?utf-8?B?alhmSnRnallIbUczRUVFNjRwRXpiQWliQjJ5MXAyekljQ3d3UHFrTk5WK2FU?=
 =?utf-8?Q?lj+vwh4d02KZoAotMFuWc+y3E2MiOo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OXpnM2hjSjlDaENDVUphc1piWVl5eDhMMGNnUTRKN1orV3ZVcVVXcWJHT2Fy?=
 =?utf-8?B?STNzWGhEYlhqT0ZlSWhwRU9venJxc2dTaGJITFluT1lEN3hCdThhY3NINSsv?=
 =?utf-8?B?KzYxTlpsZ1JZbXdTdlZUWGlocWxXelAyVVkxQ1VBb3hDMGEybkF3TVZUNkhh?=
 =?utf-8?B?UFdTakNyeUorUFIwTDN4L3NDYStWSG5zVWwwTmFQVW1ncHd5WHc1ZVMzTHF4?=
 =?utf-8?B?M01VeFN4ZTVIbHJRSW1JYmxOSE9EY0Mwd2VVUjFjR3NIY2NESjVxa0NvNlFa?=
 =?utf-8?B?TkkrckhoVzV0QWp6SEROK2ZKN05FNSsvbWxLMDdWR0tlM1R5R1JIV2RydVJa?=
 =?utf-8?B?UDFpcWhCZHNzTnlaS2RTVDMvMzNSMDVBSXp5ZHpHZ3c3c01IaklLWnozN0lh?=
 =?utf-8?B?eFBVZVpzcFVQeEV6Q2pEcVNPYTFybVE1b2lDdEIyTTRyWUczcXVJM1M5T0E1?=
 =?utf-8?B?YUtSVjdsbGlhL1pTWURqb2VNb3JXb3ZWbmFjOFJOWHdVUXpaMW03Y1d6RVdE?=
 =?utf-8?B?d0Rrb0d2ZURHVlJzR0V1K1czR1pDbnNLeVk1dUtqcGw4V3lSNGxnSm9BVFZy?=
 =?utf-8?B?QzdzS3hYMXg4MjAwa1ptb25jL25VaU8xa0c4YkZpRkxoV1lyQUk0enNGbnFa?=
 =?utf-8?B?RHBOLzZkQVdVUG5FTExlWHplbklJOWM1QTZpaW51bmFIYTEwQ2l0cHZwamU2?=
 =?utf-8?B?QUZmZXJ3R05vb1lmUlluOWNrek1hUUhCNk5EWGdkMnRLWCtBTnJkOGRReXR1?=
 =?utf-8?B?b01SZ212UHp4VEk2eWd2QXpWUkU4K1R6RkpDS2hPangzVWdoVE1YYitYWWVQ?=
 =?utf-8?B?dTNSR3ZteXA1RlhiT1BNWkhqcmwranBOMmJXNy8rdHl6Q2R4TWxCV09EeHk0?=
 =?utf-8?B?eHEyZlptM2FkNzJQdWg1UnFGd0JJcWtTMnFya01MWWJLQmRDeUk4cW5ZdUxn?=
 =?utf-8?B?dDFZUElodnQrR1Q1RmMvVzRuRytvckVES2lKaTNrQmkzZkJ3UnBvdjhWM3V1?=
 =?utf-8?B?T1Z1Rm5mOTRndXJ5OXpqTERmakFyRnZrdkQ3d2huSm5yNHJReElVdkdrQk1w?=
 =?utf-8?B?S1BvN2cwNW5jdnlIMzJLdXQvY2NRQkNIYTF4Q29MWXRpQVg5eTBNcG5jaDJX?=
 =?utf-8?B?SVdCd3JYQ1Rhd1dMbm1KSXJlTTRRSnJrVFpBMkY3aWQ0ajJGa2tZZVcwWG16?=
 =?utf-8?B?dnQzK0hKMlFGVWhVS29xY052c2c1M2NmTVk5M3V2ajZBUWkrVHUwYmFNU0tJ?=
 =?utf-8?B?SXNwK0ZnTitxNFdCMncyeXc4WW54NEdGVmNpQ0tRUmlaVFFPMnJ1R0FPdnE1?=
 =?utf-8?B?ZWRZZForc09ld3B2Vzk0RTQ1K2VzSFVFdzJEakJlWU1CL095VFRaTWtEWmJ6?=
 =?utf-8?B?SG9EaXhyT3lZNWx2Z0toVjU2ZUtheUk4NGNwQmtmK0ZRTlRXTDZwNzBVbnd6?=
 =?utf-8?B?d1ZqTTFOcHFRYXZNYUszcTRuUVhDL2xTQWNQRFpwbndMZW1FdXAwQzhyTUov?=
 =?utf-8?B?Qnc1TDluWnRaN2NtdjR5WXFNbzFtMnd1TmNyZFhVVXhVQTZ3dnY2TG1wVnkr?=
 =?utf-8?B?Q1BZaFVnV1R4MHlUWVowZGlXV3lPNUJTNk1hZW1UWmRvR0Y3S1owYmk0MXpR?=
 =?utf-8?B?UlU1WGRNKzFMYkVzOTZRQlJVR09JSWZyeTQ3dmVxMUhQb29xaExSSHJuakdu?=
 =?utf-8?B?U0R2eDlMd2dPUmRueU80NUZ4U0FVSC9yd2xJRWMwalFkS2dURXBFM0lvaWxk?=
 =?utf-8?B?SmhHWW15ZHBORC9KcmlKdlZUN1pZVy80QXFFYkx1NUZ3UUJJaktaYmpoamZG?=
 =?utf-8?B?WEttK1k3d2pRenBET0ZZTFovbE5zWE9BaDhVSkJobm9CamVXemhnSUorOG9r?=
 =?utf-8?B?eVlQTFlIQ25qOCtGZDRNWGpJWVhhZi9wd0lrWDVMcktpYUVrK3NnUEhNYkFh?=
 =?utf-8?B?czdFaitSdE5BVWpZMjB6Qk83QnY5a1JoRE45K3RwbGlLa0JnaiszZ1BXRDRT?=
 =?utf-8?B?V2IxcUk1U0FZbU9TMGNlYURXMk1jZ3BPUHZKd3BwU1UvamYzc2dJQTViTmY2?=
 =?utf-8?B?TTR6Y2Rwc0lRVzRhSzBYdWJ5UE1JYit1Y2VEcStVUVgvSk8xVnFackNHMkpS?=
 =?utf-8?Q?AYfQTr+2htKyi/OKjJwIVmuCj?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 69bd01c4-5f04-4487-2dfa-08ddb3bec66f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 08:03:31.0665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u+jh0UUXR5+ILBLmo3JYPjEmG/cGC2EtwD8G+eHclEkmrKtw+Gmw7E5cY4lQtgnIAH/WpfR6zgIGVdNLOWUuE+0DApNSYQ8G7Wzu9BhMHIY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6487
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMDUvMTBdIG1laTogdnNjOiBEZXN0cm95IG11dGV4IGFmdGVyIGZy
ZWVpbmcgdGhlIElSUQ0KPiANCj4gVGhlIGV2ZW50X25vdGlmeSBjYWxsYmFjayB3aGljaCBydW5z
IGZyb20gdnNjX3RwX3RocmVhZF9pc3IgbWF5IGNhbGwNCj4gdnNjX3RwX3hmZXIoKSB3aGljaCBs
b2NrcyB0aGUgbXV0ZXguIFNvIHRoZSBJU1IgZGVwZW5kcyBvbiB0aGUgbXV0ZXguDQo+IA0KPiBN
b3ZlIHRoZSBtdXRleF9kZXN0cm95KCkgY2FsbCB0byBhZnRlciBmcmVlX2lycSgpIHRvIGVuc3Vy
ZSB0aGF0IHRoZSBJU1INCj4gaXMgbm90IHJ1bm5pbmcgd2hpbGUgdGhlIG11dGV4IGlzIGRlc3Ry
b3llZC4NCj4gDQoNClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVz
eXNraW5AaW50ZWwuY29tPg0KDQo+IEZpeGVzOiA1NjZmNWNhOTc2ODAgKCJtZWk6IEFkZCB0cmFu
c3BvcnQgZHJpdmVyIGZvciBJVlNDIGRldmljZSIpDQo+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUg
R29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9taXNjL21laS92c2Mt
dHAuYyB8IDggKysrKy0tLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS92c2MtdHAu
YyBiL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gaW5kZXggZjU0MzhhNjAwNDMwLi4wZmVl
YmZmYWJkYjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvbWlzYy9tZWkvdnNjLXRwLmMNCj4gKysr
IGIvZHJpdmVycy9taXNjL21laS92c2MtdHAuYw0KPiBAQCAtNTIxLDEwICs1MjEsMTAgQEAgc3Rh
dGljIGludCB2c2NfdHBfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkNCj4gIAlyZXR1cm4g
MDsNCj4gDQo+ICBlcnJfZGVzdHJveV9sb2NrOg0KPiAtCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRl
eCk7DQo+IC0NCj4gIAlmcmVlX2lycShzcGktPmlycSwgdHApOw0KPiANCj4gKwltdXRleF9kZXN0
cm95KCZ0cC0+bXV0ZXgpOw0KPiArDQo+ICAJcmV0dXJuIHJldDsNCj4gIH0NCj4gDQo+IEBAIC01
MzUsOSArNTM1LDkgQEAgc3RhdGljIHZvaWQgdnNjX3RwX3JlbW92ZShzdHJ1Y3Qgc3BpX2Rldmlj
ZSAqc3BpKQ0KPiANCj4gIAlwbGF0Zm9ybV9kZXZpY2VfdW5yZWdpc3Rlcih0cC0+cGRldik7DQo+
IA0KPiAtCW11dGV4X2Rlc3Ryb3koJnRwLT5tdXRleCk7DQo+IC0NCj4gIAlmcmVlX2lycShzcGkt
PmlycSwgdHApOw0KPiArDQo+ICsJbXV0ZXhfZGVzdHJveSgmdHAtPm11dGV4KTsNCj4gIH0NCj4g
DQo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGFjcGlfZGV2aWNlX2lkIHZzY190cF9hY3BpX2lkc1td
ID0gew0KPiAtLQ0KPiAyLjQ5LjANCg0K
