Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6BD70810
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 10:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751367406; cv=fail; b=Vt4QZtoGKN797HISgfhQZoxSxG2C+FEk/qITIOHhxL5IJgJFIkQEEZIANnQJw1EETTjR4Tiz27kpCXjadRK45UkRpkQAZVWSvzhqJ7jpMxQyFUo0ser/X71dTm8PhhktP6fahpe0ySxFTwYZqJRG2oAHyqXF0yOZDFM2Z6zXJTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751367406; c=relaxed/simple;
	bh=q18P5l4tO5pqLIGjCR76It1r/1dD8AywMQdOX/6irrQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=I4Q7jg7/awLcz7nX8egfkiTaxJv9CWzXXmVd678Nh37b9mzMXK4Q57YcLHKo7j3NkfYt6r5fcd8xOIsLBtzoI3tnpiZCbWO8BKwkIzffpZiCoIAF2Bk6lNVknvIqDpogLmOspXn6NprKydltp5DlPzDg5fWWV2w/a1qLYH1/G/w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cfRCY3QJ; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cfRCY3QJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751367404; x=1782903404;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=q18P5l4tO5pqLIGjCR76It1r/1dD8AywMQdOX/6irrQ=;
  b=cfRCY3QJHhcJ8a1gQShSBp0c0/Ke2ULUsqYdMD8Osz1h3DVB/n8leS9p
   e2MJ0ekD2AOfeFJc+lySrT+tXJbabh/UIJ8aOx6CLZ9m77nF+xzYfrahQ
   EorSfbjAY8mxpReglxBBukXgorAJzC7pZeArVRBjtbQGaOchh8o525kjO
   sBg8oQFbJB00ep0nIyBOgoNIQqBycaOI0g9f7SKoSOx4ICEpZstvgB5yg
   TQn7SvAHZeTf+bCBmVvF7XZ9iCs3nWNavaw//jY6ie1W1X42eOAGDxex8
   LaRTjLbHkMa7LuOcvkW9mZMVNScRIP094iZq4BdnBBo4pJl7qD2YVS3aP
   g==;
X-CSE-ConnectionGUID: KCo5heEaSAu0zCWq1xW5Ew==
X-CSE-MsgGUID: z7eXYxzsTLCn+wL4FDnJig==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="53750233"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="53750233"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:56:43 -0700
X-CSE-ConnectionGUID: vrm1QP0WQTWfxnBKA7ZaRw==
X-CSE-MsgGUID: IudklsRLSWmXDnenQ0/DMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="184783512"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 03:56:40 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:56:38 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 1 Jul 2025 03:56:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.84) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 1 Jul 2025 03:56:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cPhf41Xhey16pDyjqBvDopwBzb0eZ+9RHX0KdFwlf/G6gtcAfDImcbvtmAiKrlWyfRYJHvb0VZJQJU7gxkqE5zCw6j9K23yKMeZj0q+pmQbj6IKshf+r1UqjkPGvytlR640tCn83gHGKSt/VuQCIRJtAew7vmkuw189avkmmpeoZyv+BaHcumXffMx34LOjNefOlefklDjZpi+yn+mr0YzenSWbtRSakrPsn55fXVKQj1U8Qd/jzbk7Tikw1CP8JccxPI1vLMi1K0IThmbs+6MyhPcIQTTzDvickA4MC6v4odiRPsBxDye/ubuO9w330KWpi1jANGynYTrjsK9bTig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q18P5l4tO5pqLIGjCR76It1r/1dD8AywMQdOX/6irrQ=;
 b=gqaYjTgxSuMr8m9mQEwfv7MKjKsHHXHOVnlSMHFE7wDgRlUuC+W0GZq/bjgjY+ZJ3SEnlRRrttk/HyZZMDXeR1yraTDvaK8eiIGPhYkQxHls21MWYMj6rSPFsJy0gn3MQUcVsuG8BiKaAR2MwoEajE9mj1+PzDy1dDNPRN+9glhznIIVnlJ9XzvhxVO+Jh1Q17hxq4S+emUPfh8kFe7uv9TZumGdOJnn8QhW4cGEV8ZyAXhWuG1tv8e1UeywxjHiR/g0DT7/ojTkyQRhUGeROuP/loo1JIJ0jYI0UboNAaSMR+ULduL6Zfy9RhyaUD4wc/j37dEvmu989u5IhxY0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by SJ5PPF92ECB6678.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::846) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.35; Tue, 1 Jul
 2025 10:55:50 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 10:55:50 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: "Abliyev, Reuven" <reuven.abliyev@intel.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [char-misc-next v2 5/5] mei: create dedicated device object
Thread-Topic: [char-misc-next v2 5/5] mei: create dedicated device object
Thread-Index: AQHb6aIGI+ssdjl1Wk6hFhoS3U3BJLQb9VOAgAEa2GA=
Date: Tue, 1 Jul 2025 10:55:50 +0000
Message-ID: <CY5PR11MB6366B5C574859BEE3A04FB97ED41A@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250630091942.2116676-1-alexander.usyskin@intel.com>
 <20250630091942.2116676-6-alexander.usyskin@intel.com>
 <2025063045-bronchial-veggie-8288@gregkh>
In-Reply-To: <2025063045-bronchial-veggie-8288@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|SJ5PPF92ECB6678:EE_
x-ms-office365-filtering-correlation-id: 3457ccc4-b46a-41ea-36b2-08ddb88dd78a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bTFsZ2RSNUJSNFFzeHBIZFNXYjNZdkpEeEh2a0FaSmNvdFgvaDJLcVlvSWt1?=
 =?utf-8?B?UkZ6dnBhZUpHVUh0em5BMTBoZWxHQ1JWZzFCeVQrVzVzWUZidlV3SVFZUEpN?=
 =?utf-8?B?L0twallMbVBJUDd4S0o3U3NmY0dJYnZsdjVpSTJuRGJvdmRHbnpxN2swNlQ4?=
 =?utf-8?B?dGxNei8vdkRBbkV0ZDlqVlNrZ3AzSHRzY1lwRTZuNEZVMEJMUGdkQUJRVG0z?=
 =?utf-8?B?aFkrWTl4N3dpTXozZjhvR2ZFUVcrc3lyNXFGWkU1NXQ4Vmg2bFpwcmdVVHpo?=
 =?utf-8?B?aWxjWTRrc2RPamU5ZnlwbmZ3blJOQmdtb2p3bDdxNlpvcjl5NjhwM3N0ckhX?=
 =?utf-8?B?VTdOdlY0VUdqTEhnUUNHWkVTY1RNZWYzUUd2aGpKTTU4UVQ1TTRjMUdnMnZx?=
 =?utf-8?B?SXF2aFMrYXY3blc1czJ6VmNhaHJOQ3FhZkdSTjI3eXgydHFBQUc0RWNkNXV3?=
 =?utf-8?B?VStHbVltdnJ3WTdmdndoUXVTblRGYlZHcU9lSkNIeWl0aUFWOHdyeFJnU1FV?=
 =?utf-8?B?Rlozc2VCanJLYmwwRUNweVFZM2gzd0cwY3ZKemsvYjZKdGJtTGFkNDhLWmpK?=
 =?utf-8?B?R2xwQ3lHWUVLeitibHNaOHNkTVRaV1dMQit5SzVSZ09TV1lLNUlpdXlUMU8y?=
 =?utf-8?B?VXhreWtGRG5KeEtTZVRObklCTVBpbGd5d3FpYkxtaWhEeFFvbDU2WW1WcGpp?=
 =?utf-8?B?VFZCTG9aUGpLOVZONC9PZUxHcFBISlp1eTYzN0JTWUJJSHJmKzJQNGtIL1JZ?=
 =?utf-8?B?aU9Kc3VzTTBLT2JHNXZBc3R3U2Y5TlNSa280ZUhTMkZFWlo0VTArTjZPK2I1?=
 =?utf-8?B?UVdSbWVaSTdLdW51d3JPLzBBaDkyek9XM0t5OENzT05IM2NyakdhWHF1aE00?=
 =?utf-8?B?SnJuejdQV1dPNUVkc3RReEphN3JEODNHcDllRHBPaEd6THNBWVJydnRtU1gv?=
 =?utf-8?B?ckRGQWtJK09iY3gxOFBaWStIUFhKK3RXcnNWd1hrMmpIbVh6b2FWL2RKcUZq?=
 =?utf-8?B?cnFZOXFQek9oK0FmWHlhS0lJOHZMbFlCUVNJbmdDTU1PNkY0VGJwRytRQnRM?=
 =?utf-8?B?YitXT2JHdjhLbG04MDVoYWxDOWNnQ0RsWU9OVEZMK2VhenBWQkg5WFFiMXFW?=
 =?utf-8?B?dzI2c2V3YUxGWEZTZmF0L3hzZ3owcE04akc0N1BMUGx3cS9GVWFNd0RwU2V1?=
 =?utf-8?B?czFSSCswSTJKQmV4RFB5MEJPd0Rqc2FwcCtLQWJ4OXhEeStvM2l1enVXRWwx?=
 =?utf-8?B?bmhtV1NNdm0wZUs2OU05OHAyS01mcndhQ0VYb2JQUTdpaCtKbmpUTFFqZ3BO?=
 =?utf-8?B?cnBQeE5lREMweDhEazVsS0V5ckQ2dWIxalFMSUhxbW9XenFQNWdIVGQwazcy?=
 =?utf-8?B?N3FQdW4wYWp5cWFBN0tJRmEyYXB2WjVocUt4cXVKVVBNSnpBWjBtVnhIbUNz?=
 =?utf-8?B?ajRUSjRqa005S0xzRytQUEUvWmN0dGRCeGU1THEvdmFKN3NjWjVvMUFYNDVF?=
 =?utf-8?B?Qmd3Nk1uNW1LUXJiWUY3QlVaQ1BsL3VTbm15Tm9BTGM4djBCNER2dDh3Uklo?=
 =?utf-8?B?d2MzYnRoRGpHSHJuME5mNG8yQUlkSFR6WllxSVRxdGpQdWRxYUxwQWFHd2ln?=
 =?utf-8?B?VW02em02aG9kZ1gwdHdBWWd4MTFaVGNaTUhYeGZUR3VHY0ViY0pZTUYyR2hB?=
 =?utf-8?B?NnRWakVpbGFvV3dDL25VeXVFY3M4TUN2UzVNVzRnNDI5N3FMcEdUemZzNEdo?=
 =?utf-8?B?MTVScTRsclZHWStrenJXYWFQSjJkLzJ1bGpoUFZLS0k1WlMxYWJSR242UmNt?=
 =?utf-8?B?aE1peGlZVjB1Q2VrZ0pCUXpwK0pBZkEzcW9JYlkvYmI4VHVrNjFLeTVpbnc5?=
 =?utf-8?B?NTBzclowU1hGUXp5YkFNZXdWdjEvN0FnL3JXdmJpMTVnQTBEN29SS2xZcCt1?=
 =?utf-8?B?LzZlb3M0WTdLVTAyeExLajFtL29rQm5ic0RrUUw5MVB6cUMwdWpubEgvR05C?=
 =?utf-8?Q?EVJ4GB32NmlKcoj6D43rcJ9AwcD6Kc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NTdjcWZxZDRwcFRkWjNYaHZ3TDl6bU1lT3R4UXBGZlhSRmJ5SFZ2Q2x3WkZ0?=
 =?utf-8?B?NWpVZ001eVJudVg0TjMra29FRk1iTmNNWFVTUCt6ZGp4WTRJak5TNVlkZkhi?=
 =?utf-8?B?WHBUQUNub3ZMMGJ6bTVzU2ROVHZ0NDJobmw2U2NOL3VLVmRLM1JwT0RTb1dL?=
 =?utf-8?B?dDR0bmMzZG5SM2NnODZLT3JLZnR3Zzlwb1ozVU9Hd090aXhzYU1QTlVIUjFK?=
 =?utf-8?B?VVZYWEVLVkRBZmVWb29rcWFJcm1va2VPQWVLODRjQWZkZGlCNmg2ME9OQis2?=
 =?utf-8?B?Zm13ZlFmajV2VG1KZFRXSnpUd3FMMUwvQXBpaGhaZlVYNzVDYlJxVE5Dc3VP?=
 =?utf-8?B?QnRFaWVkeVM3UEtld1hURWJnMlpFR1FOMFpUZGpUT2JPZG42aWtYbXgvN0ND?=
 =?utf-8?B?TzJ6cnhWUUdZeHhiRnJPQVRrSDFhNGxxcjRiOUcrU1RBTjJ5Wkl6eXBOenNj?=
 =?utf-8?B?MXJOc2syc0dORllMUXZHRmlhWERSZHdzMGQ0YTRHSW5Geis2dGpqOHk4Q0RL?=
 =?utf-8?B?bXpEV2g5NXhqUm9rOURqTDJJSDk5T2ZOdnowTWtiNHdzNzVDdlZqTnNnYjgy?=
 =?utf-8?B?bkExODVRdGpUVUpsSTVOeEFZTzA1RmVkamVVUnNINFBKVGFNbktRYXVpamFo?=
 =?utf-8?B?ZUU4MUo2clNjNlBtTlZYSjZYNlo0SlEvOXZSWlVaUU5wRVlPc3IrTVloS0R3?=
 =?utf-8?B?anVSdkpPS2JkQ1d5MmJmQStRcGMyR0NpTFVwanE1cG1PcFZNZUx6QXE1MVdR?=
 =?utf-8?B?Q1ZGYjVqcmI5Zzk4QnNPMEZpVkV0Q2p5ZHZsZmpiMGNjT0ZZZ0tBOWdtS01q?=
 =?utf-8?B?ZXhqWDlkSElCdC9YTlZkOVJJQnVIdGhKc0pxdER2SnR2NXZ0YkpCZFJjK2RI?=
 =?utf-8?B?T0daWUhiWEY5a0J2a1AzU2lWaGVKQjJwZjBSZm1ldVkvemo4QTFINVZYRFBF?=
 =?utf-8?B?NS85TVdHQmw0dGNaNVJqUmJId3ozRVczeUxxemIxc3RsN0NkYnU0TWNuMEhw?=
 =?utf-8?B?QjBXZFRvYlBUYVh1M3JpOUx5ODRuWVJyMm00M1hHWE5kRkNYZDRKN2tZU0Yv?=
 =?utf-8?B?SW56NGhrZitzRHZZdlpyKzlwcngwWlBpQnZ4d3RYS2NmRnRWeWFzbHg1N29E?=
 =?utf-8?B?c0gwNktBMVYrQVU1VGxVZnVpbGtIeml6RDRydUZSVS8vNGdOZFFpWU82dlVM?=
 =?utf-8?B?WjdpMnFXSm14Z3UwSzFZSTgrYk1WUmt6MitZM2FmZ1lJMkxFRXduMXFDc0Vv?=
 =?utf-8?B?Q0lMZC9KWk9sS1J6OVpJQ2NtSTNtSnc2TXFkajZYUU01UjcreWRxNTNsNml4?=
 =?utf-8?B?dTR6dFFnbExZbzBUaXVKeFZQcWl4MlhiTlFCM01TNnNzeHNFQURQQjFUQ0hw?=
 =?utf-8?B?NEpKbENpT1UrdVRzdjA1YVN3bG4xaEpSRHJsOE5SNVVybXBzeVEzdHRDaG41?=
 =?utf-8?B?QW5EaXBML1F3RGsxV1AyekFqdVJmM3lTZERGYXhEeWM2RmtEakd4UnNDUzhZ?=
 =?utf-8?B?YmpiK1hrUkVDMmVzdWQ5MmM3UWJwNXJzZjFkRTVhUWozTXdDbnR6SjBHdjF5?=
 =?utf-8?B?dVVRVWtibTJ5Uytmb09KWnpGZzE2eTVnQnlvUHRJaVk3bnFOby9RUmVqdU1P?=
 =?utf-8?B?SEFoYnZvbzgzOW10bWRmU0tnQ1dQQTFoMGtBRHZwSzBKSEI3ODF1UWdSMHJh?=
 =?utf-8?B?VXZIQTR3Tjd6WEQxcjVWYUpYV1pSUlErckVUMUo5d3FBUHBScGU4b1YwQ29K?=
 =?utf-8?B?dEhkMVhUTUNqOWFpaGJnNzFKbWwvRU9Mc2thVFUzQWJLN1hndkNMUUtCdjZM?=
 =?utf-8?B?UjNBQWd0Wis4d0QzUzhkaWtUZ0hMb2VPQmF3cjkwamp4aTRhLzZRdlllakxm?=
 =?utf-8?B?b3N4QXQ2dDYzRUU2RG14YTlIMGp5ci9OeCtFS3F4Q2VGM1N3VDlET3RrNDVU?=
 =?utf-8?B?VmlIb2VUdElNRm40ODlvMXNOR3RMNFhvS0lYTEt0VG1NRHRIUE92Z2FNYWQ3?=
 =?utf-8?B?MVI5Y1d3ZEsyN2tZemZsck4xKzIrbjF5eWhMM21mSUNCdFZXd0hPaU01VXNr?=
 =?utf-8?B?MGRwUGdUUGE5ZURDdThpclhjcWliVjNpNlBqMytpNkYrS2VkbEJLK3JlTXhJ?=
 =?utf-8?B?RHlHVUp4NGV3Y2xqSHlUU2FFNmN6TlNKOGliTFNwVldEOHNKQ2lhQ1VtbjhQ?=
 =?utf-8?B?MlE9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3457ccc4-b46a-41ea-36b2-08ddb88dd78a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 10:55:50.2494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q2zbspRcWtKcANbbWheTh8A10YaOFjDkjfzWXzjhaGOE2mVd+Erk6RP+KrU+9DGWiuYMJpaaTaeztSVIyIiNuKErIZPB47o357QqxLSys34=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF92ECB6678
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBSZTogW2NoYXItbWlzYy1uZXh0IHYyIDUvNV0gbWVpOiBjcmVhdGUgZGVkaWNh
dGVkIGRldmljZSBvYmplY3QNCj4gDQo+IE9uIE1vbiwgSnVuIDMwLCAyMDI1IGF0IDEyOjE5OjQy
UE0gKzAzMDAsIEFsZXhhbmRlciBVc3lza2luIHdyb3RlOg0KPiA+IG1laV9kZXZpY2UgbGlmZXRp
bWUgaXMgbWFuYWdlZCBieSBkZXZtIHByb2NlZHVyZSBvZiBwYXJlbnQgZGV2aWNlLg0KPiANCj4g
SWNrLCB3aGF0IGNvdWxkIGdvIHdyb25nLi4uDQo+IA0KPiBIaW50LCBkZXZtIGlzIG5vdCBhIGdv
b2QgdGhpbmcgdG8gZXZlciB1c2UgZm9yIG90aGVyIHJlZmVyZW5jZSBjb3VudGVkDQo+IHN0cnVj
dHVyZXMgdGhhdCBjYW4gYmUgaW5jcmVtZW50ZWQvZGVjcmVtZW50ZWQgaW5kZXBlbmRlbnRseS4g
IFRoaXMgaXMNCj4gcHJvYmFibHkgbmV2ZXIgZ29pbmcgdG8gd29yay4NCj4gDQo+ID4gQnV0IHN1
Y2ggbWVtb3J5IGlzIGZyZWVkIG9uIGRldmljZV9kZWwuDQo+ID4gTWVpX2RldmljZSBvYmplY3Qg
aXMgdXNlZCBieSBjbGllbnQgb2JqZWN0IHRoYXQgbWF5IGJlIGFsaXZlIGFmdGVyDQo+ID4gcGFy
ZW50IGRldmljZSBpcyByZW1vdmVkLg0KPiA+IEl0IG1heSBsZWFkIHRvIHVzZS1hZnRlci1mcmVl
IGlmIGRpc2NyZXRlIGdyYXBoaWNzIGRyaXZlcg0KPiA+IHVubG9hZHMgbWVpX2dzYyBhdXhpbGlh
cnkgZGV2aWNlIHdoaWxlIHVzZXItc3BhY2UgaG9sZHMNCj4gPiBvcGVuIGhhbmRsZSB0byBtZWkg
Y2hhcmFjdGVyIGRldmljZS4NCj4gDQo+IEFoLCBhcmUgeW91IHRyeWluZyB0byBleHBsYWluIHdo
YXQgaGFwcGVucyB0b2RheT8gIFRoaXMgaXNuJ3Qgb2J2aW91cy4NCj4gDQpXaWxsIHJlcGhyYXNl
Lg0KDQo+ID4gQWRkIGRlZGljYXRlZCBkZXZpY2Ugb2JqZWN0IHRvIGNvbnRyb2wgZHJpdmVyDQo+
ID4gcHJpdmF0ZSBkYXRhIGxpZmV0aW1lLg0KPiANCj4gQnV0IHdoZXJlIGlzIHRoYXQgZGV2aWNl
IGluIHN5c2ZzIG5vdz8NCj4gDQo+ID4gUmVuYW1lIGV4aXNpbmcgcGFyZW50IGRldmljZSBwb2lu
dGVyIGZyb20NCj4gPiBkZXYgdG8gcGFyZW50IHRvIGF2b2lkIG1pc3VzZS4NCj4gDQo+IFdoeSBu
b3QgZG8gdGhpcyByZW5hbWUgZmlyc3Q/DQo+DQpPaywgd2lsbCBzcGxpdCB0byBzZXBhcmF0ZSBw
YXRjaC4NCiANCj4gPiBMZWF2ZSBwb3dlciBtYW5hZ2VtZW50IG9uIHBhcmVudCBkZXZpY2UgYXMN
Cj4gPiB1c2VyLXNwYWNlIGlzIGV4cGVjdGluZyBpdCB0aGVyZS4NCj4gDQo+IFdoeT8gIFRoYXQg
ZmVlbHMgdG90YWxseSB3cm9uZy4NCj4gDQo+IEhvdyBkb2VzIHN5c2ZzIGxvb2sgYmVmb3JlL2Fm
dGVyIHRoaXMgY2hhbmdlPyAgSXMgdGhlIGJ1cyBzdGlsbA0KPiBhZGRyZXNzZWQgcHJvcGVybHk/
DQo+IA0KDQpUaGUgc3lzZnMgaXMgbGlrZTogcGNpIGRldmljZSAoMDAwMDowMDoxNi4wIHVzdWFs
bHkpICAtPiBtZWkwDQpBbmQgaXQgaXMgdW5jaGFuZ2VkIHdpdGggdGhlIHBhdGNoLg0KTmV3IGRl
dmljZSBpcyBhdCBwY2kgZGV2aWNlICgwMDAwOjAwOjE2LjApICAtPiBtZWlkLjAwMDA6MDA6MTYu
MA0KDQpUaGlzIGlzIGZyb20gcGxhdGZvcm0gd2l0aCBwYXRjaGVzOg0KdXNlckBQbGF0Zm9ybTp+
JCBscyAtbCAvc3lzL2J1cy9wY2kvZGV2aWNlcy8wMDAwXDo4MFw6MTYuMC8NCi4uLg0KZHJ3eHIt
eHIteCAzIHJvb3Qgcm9vdCAgICAwIEp1biAyMyAxNDo0MiAwMDAwOjgwOjE2LjAtMDViNzlhNmYt
NDYyOC00ZDdmLTg5OWQtYTkxNTE0Y2IzMmFiDQouLi4NCmRyd3hyLXhyLXggMyByb290IHJvb3Qg
ICAgMCBKdW4gMjMgMTQ6NDIgMDAwMDo4MDoxNi4wLWVmYTJhYWE2LTBiYjYtNDE5NC1hYmEyLTlm
NTlhNjc1ZWViYQ0KLi4uDQpkcnd4ci14ci14IDMgcm9vdCByb290ICAgIDAgSnVuIDIzIDE0OjQy
IG1laQ0KZHJ3eHIteHIteCAzIHJvb3Qgcm9vdCAgICAwIEp1bCAgMSAxMzozNCBtZWlkLjAwMDA6
ODA6MTYuMA0KLi4uDQoNClRoZSBydW50aW1lIHBvd2VyIG1hbmFnZW1lbnQgaXMgb24gUENJIGRl
dmljZS4NCldlIG92ZXJyaWRlIHVzdWFsIFBDSSBydW50aW1lIHBtIGFzIENTTUUgaGFzIGl0cyBv
d24gcG93ZXINCm1hbmFnZW1lbnQgbWVjaGFuaXNtLg0KDQpJJ20gbG9va2luZyBpZiB3ZSBjYW4g
dXNlIG1laSBjbGFzcyBkZXZpY2UgY3JlYXRlZCB3aXRoDQpkZXZpY2VfY3JlYXRlX3dpdGhfZ3Jv
dXBzLCBidXQgaXQgaXMgY3JlYXRlZCB0b28gbGF0ZSBpbiB0aGUgZmxvdyB0byBiZSB1c2VmdWxs
Lg0KDQotIC0gDQpUaGFua3MsDQpTYXNoYQ0KDQoNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEFs
ZXhhbmRlciBVc3lza2luIDxhbGV4YW5kZXIudXN5c2tpbkBpbnRlbC5jb20+DQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvbWlzYy9tZWkvYnVzLWZpeHVwLmMgICAgfCAgIDYgKy0NCj4gPiAgZHJpdmVy
cy9taXNjL21laS9idXMuYyAgICAgICAgICB8ICAyNCArKysrLS0tDQo+ID4gIGRyaXZlcnMvbWlz
Yy9tZWkvY2xpZW50LmMgICAgICAgfCAgODIgKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiA+ICBk
cml2ZXJzL21pc2MvbWVpL2NsaWVudC5oICAgICAgIHwgICA2ICstDQo+ID4gIGRyaXZlcnMvbWlz
Yy9tZWkvZG1hLXJpbmcuYyAgICAgfCAgIDggKy0tDQo+ID4gIGRyaXZlcnMvbWlzYy9tZWkvZ3Nj
LW1lLmMgICAgICAgfCAgMTMgKystLQ0KPiA+ICBkcml2ZXJzL21pc2MvbWVpL2hibS5jICAgICAg
ICAgIHwgMTIxICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIGRyaXZlcnMv
bWlzYy9tZWkvaHctbWUuYyAgICAgICAgfCAxMDEgKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0N
Cj4gPiAgZHJpdmVycy9taXNjL21laS9ody10eGUuYyAgICAgICB8ICA2MiArKysrKysrKy0tLS0t
LS0tDQo+ID4gIGRyaXZlcnMvbWlzYy9tZWkvaW5pdC5jICAgICAgICAgfCAgODUgKysrKysrKysr
KysrKysrLS0tLS0tLQ0KPiA+ICBkcml2ZXJzL21pc2MvbWVpL2ludGVycnVwdC5jICAgIHwgIDQ1
ICsrKysrKy0tLS0tLQ0KPiA+ICBkcml2ZXJzL21pc2MvbWVpL21haW4uYyAgICAgICAgIHwgICA5
ICsrLQ0KPiA+ICBkcml2ZXJzL21pc2MvbWVpL21laV9kZXYuaCAgICAgIHwgIDExICstLQ0KPiA+
ICBkcml2ZXJzL21pc2MvbWVpL3BjaS1tZS5jICAgICAgIHwgIDEyICsrLS0NCj4gPiAgZHJpdmVy
cy9taXNjL21laS9wY2ktdHhlLmMgICAgICB8ICAxMCArKy0NCj4gPiAgZHJpdmVycy9taXNjL21l
aS9wbGF0Zm9ybS12c2MuYyB8ICAxOCArKy0tLQ0KPiA+ICAxNiBmaWxlcyBjaGFuZ2VkLCAzMzEg
aW5zZXJ0aW9ucygrKSwgMjgyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWlzYy9tZWkvYnVzLWZpeHVwLmMgYi9kcml2ZXJzL21pc2MvbWVpL2J1cy1maXh1cC5j
DQo+ID4gaW5kZXggOTBkYmEyMGIyZGU3Li5lNmExZDM1MzQ2NjMgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9taXNjL21laS9idXMtZml4dXAuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWlzYy9tZWkv
YnVzLWZpeHVwLmMNCj4gPiBAQCAtMzg2LDcgKzM4Niw3IEBAIHN0YXRpYyBpbnQgbWVpX25mY19p
Zl92ZXJzaW9uKHN0cnVjdCBtZWlfY2wgKmNsLA0KPiA+ICAJcmV0ID0gX19tZWlfY2xfc2VuZChj
bCwgKHU4ICopJmNtZCwgc2l6ZW9mKGNtZCksIDAsDQo+ID4gIAkJCSAgICBNRUlfQ0xfSU9fVFhf
QkxPQ0tJTkcpOw0KPiA+ICAJaWYgKHJldCA8IDApIHsNCj4gPiAtCQlkZXZfZXJyKGJ1cy0+ZGV2
LCAiQ291bGQgbm90IHNlbmQgSUYgdmVyc2lvbiBjbWQgcmV0ID0NCj4gJWRcbiIsIHJldCk7DQo+
ID4gKwkJZGV2X2VycigmYnVzLT5kZXYsICJDb3VsZCBub3Qgc2VuZCBJRiB2ZXJzaW9uIGNtZCBy
ZXQgPQ0KPiAlZFxuIiwgcmV0KTsNCj4gPiAgCQlyZXR1cm4gcmV0Ow0KPiA+ICAJfQ0KPiA+DQo+
ID4gQEAgLTQwMSwxNCArNDAxLDE0IEBAIHN0YXRpYyBpbnQgbWVpX25mY19pZl92ZXJzaW9uKHN0
cnVjdCBtZWlfY2wgKmNsLA0KPiA+ICAJYnl0ZXNfcmVjdiA9IF9fbWVpX2NsX3JlY3YoY2wsICh1
OCAqKXJlcGx5LCBpZl92ZXJzaW9uX2xlbmd0aCwgJnZ0YWcsDQo+ID4gIAkJCQkgICAwLCAwKTsN
Cj4gPiAgCWlmIChieXRlc19yZWN2IDwgMCB8fCAoc2l6ZV90KWJ5dGVzX3JlY3YgPCBpZl92ZXJz
aW9uX2xlbmd0aCkgew0KPiA+IC0JCWRldl9lcnIoYnVzLT5kZXYsICJDb3VsZCBub3QgcmVhZCBJ
RiB2ZXJzaW9uIHJldCA9ICVkXG4iLA0KPiBieXRlc19yZWN2KTsNCj4gPiArCQlkZXZfZXJyKCZi
dXMtPmRldiwgIkNvdWxkIG5vdCByZWFkIElGIHZlcnNpb24gcmV0ID0gJWRcbiIsDQo+IGJ5dGVz
X3JlY3YpOw0KPiA+ICAJCXJldCA9IC1FSU87DQo+ID4gIAkJZ290byBlcnI7DQo+ID4gIAl9DQo+
ID4NCj4gPiAgCW1lbWNweSh2ZXIsIHJlcGx5LT5kYXRhLCBzaXplb2YoKnZlcikpOw0KPiA+DQo+
ID4gLQlkZXZfaW5mbyhidXMtPmRldiwgIk5GQyBNRUkgVkVSU0lPTjogSVZOIDB4JXggVmVuZG9y
IElEIDB4JXgNCj4gVHlwZSAweCV4XG4iLA0KPiA+ICsJZGV2X2luZm8oJmJ1cy0+ZGV2LCAiTkZD
IE1FSSBWRVJTSU9OOiBJVk4gMHgleCBWZW5kb3IgSUQgMHgleA0KPiBUeXBlIDB4JXhcbiIsDQo+
ID4gIAkJIHZlci0+ZndfaXZuLCB2ZXItPnZlbmRvcl9pZCwgdmVyLT5yYWRpb190eXBlKTsNCj4g
DQo+IFdoZW4gZHJpdmVycyBhcmUgd29ya2luZywgdGhleSBzaG91bGQgYmUgcXVpZXQgOikNCj4g
DQo+IHRoYW5rcywNCj4gDQo+IGdyZWcgay1oDQo=
