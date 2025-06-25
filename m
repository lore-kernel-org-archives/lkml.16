Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59082857F1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750847157; cv=fail; b=OHfV3qjSB6QuaETgvL/+lSWMVETPYF5atwmolF+DXsynBo7jHnJcazx5K1BxGAGfPSuIIGi2VR+D6KTOMBe/CDozid2rCBT68lDBzEYd6FZoELzHBN0fUe8ig1UoRDDKHbyvYDqYeu4/FJX+80ihcssG+WNc8OgRddU3e1qY7eM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750847157; c=relaxed/simple;
	bh=GHCiK7eTaeyJwKc+9uhoPPXBSPa8pe4JfnB4Tk81TlU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C+8cjIJZyDISsjpxq/ONTEQ8IQt/FyiLQJqpQVr31s/yW5G14QApeDD4FECa0ULc4Yc3KVvg0+fo2MEOQW3Fc9raoocX3mAkjiSsTPiNrhLpByo9Q3eenYPLaCoISU9pQ0g7npd3PUtRPAdx8Cf5n5UOVW5QMfbZDBBH0QkR7jc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXIB8sFU; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXIB8sFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750847155; x=1782383155;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=GHCiK7eTaeyJwKc+9uhoPPXBSPa8pe4JfnB4Tk81TlU=;
  b=bXIB8sFUs7AUVGa7v7eskVcj2QKAMD2tLH+cqVPi45mDuPOxzmEfpIJB
   l3uUv/xLDzzOnc8KnM2fbQsSv8D6ffDkSGOpAP9pDrYzRcGiOKfL6Fk2h
   f/DLRB8LWQ34hkjrGWdPwcIo8V1WCQmu1t2uxrZkODHFYj8VDMYJJWsBp
   gduXC7NF6qaZyf372GCke9igu8WoN7Yre+C8LDYSruZqzcMVEe4PU/NB0
   fkixm3gFvZNwXQYDTdld5Ov/DF3fwYNvVMbDeuuFDmqC3+Q94NBPBTzdv
   5sjcBTJelXnGh1hut44/cxTRG3s5a2QCEuorzcPG2I0KYSLpt1orpbQxn
   A==;
X-CSE-ConnectionGUID: N7GbifkVSLmpGzrx6NOEPQ==
X-CSE-MsgGUID: N9titdd/T5+XJ5IHib3ntA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="63711817"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="63711817"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:25:55 -0700
X-CSE-ConnectionGUID: KaCkFRhRRQCb5jr94rJ6kQ==
X-CSE-MsgGUID: /PzEiXo2T9u9Boo4t8wmDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="157948515"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 03:25:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:25:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 03:25:54 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 03:25:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BDe/1RqwDqXoxZgnwyC5y6VUOuXK048IxjDmsIDxtOah505Lu1orqZ9pEe1FV6PVd2UcgcKBxgL9uB/3e9JFDTNYHefbbmfINL/CFvNjmHkcds4vzCozCsS6eGesrYwB4nTB343UgzNh8ibeAxs2zVVwU640h+D8Fe6Oe/TB9MHYIRFTEn6BXUPWHz1cGjXy5BeUz5RA7I4ZQIKtTJVO7fisXz8/hS6sjoUpfrAik9SZkgfnt1nQxqvUcn1vc0SfmBn+8IeO3gd6cC+PiknlNw1leGlz91nrqbLZHW2xAYQxx8/2tO6I0RjL8qUSkffSWmwq/aC0Tn7EnxnXKamIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GHCiK7eTaeyJwKc+9uhoPPXBSPa8pe4JfnB4Tk81TlU=;
 b=Ygsfj6PwKWuXNahXJKSJIGIxEZ96yT3N4TFwYXt4TO+sjcQibmPxRhK7Geh9+J2XTcF9JwMCLMhqh6niZUJzWdXGYTvLPfiqxGWU2KCoMZfbwNT3yB48E7fQ3SFGOlcC/g/yv1jU1UzSoAZ1/tdWY0OqqZVADOqLxuN2cHvaWLQh9C305516R4HeIL7t6/dJGK5vq0ygWklIY++06LX/YzhzuZCQdIeKWAC3kKmUEgRQDZiP2BKmiIS/Wg3PtUoOUDiW7XA9QecAkZhEMOisln+/yhPAyHw+py1IMdU5bIm8YqdnPCVXJRePGPPE2CNATe3V1xlhHTSP9i+htGJ9xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by CO1PR11MB4818.namprd11.prod.outlook.com (2603:10b6:303:93::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 10:25:38 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::6826:6928:9e6:d778%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 10:25:38 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Hans de Goede <hansg@kernel.org>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Stanislaw Gruszka
	<stanislaw.gruszka@linux.intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 10/10] mei: bus: Check for still connected devices in
 mei_cl_bus_dev_release()
Thread-Topic: [PATCH 10/10] mei: bus: Check for still connected devices in
 mei_cl_bus_dev_release()
Thread-Index: AQHb5BwCQSoWFovqlECiuImyqZno9rQTrq2Q
Date: Wed, 25 Jun 2025 10:25:38 +0000
Message-ID: <CY5PR11MB6366452655D223572AAF11D2ED7BA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <20250623085052.12347-1-hansg@kernel.org>
 <20250623085052.12347-11-hansg@kernel.org>
In-Reply-To: <20250623085052.12347-11-hansg@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|CO1PR11MB4818:EE_
x-ms-office365-filtering-correlation-id: bd33f256-9908-4feb-b102-08ddb3d2a15e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?SUY1ZWxUWVo4am1UeTR6QXVLTjJTbGpzSUlTZGdNT0xDWG14T2JCM1czVjF3?=
 =?utf-8?B?QVNWVld1Q1ExZzJIclNzZ0dUYWVlOWdTQXlRdEZ2NE85QWdHNFl4SG93aEdq?=
 =?utf-8?B?MHR2eTg2N1FvcnhHZXVPWHI1cG1ESGQrMGpiWktodUJSbU5MVzRzenArV1Nw?=
 =?utf-8?B?bFZ4QmV4WGlaUDZWQUdqaDZMNmovWUtPd2J5N1craGNYYTNocnpzU2N5eFFW?=
 =?utf-8?B?WUhNWGdsbTJmMlFucUJmb1pvbGNCNHg5ckJ2YklDWWFDZklMcmxXSnFZQWVi?=
 =?utf-8?B?YW5iaEpPc0h0Z2pXa1pHd2wraTI0V3BiVFJnSzl1cDZVVFQ0SXFLaXlWT3BH?=
 =?utf-8?B?eGVKclZzeGp2NWxwRHE2L3MrZjJMb1NKTVRYOXZ1dEp3bm83bGJnL1dQWjdq?=
 =?utf-8?B?NXhSY2JLWk5POXEreCtxalJlNjZ2ZW5SN2RNNVNXMFhMM3k0a2x0OEY2akJQ?=
 =?utf-8?B?ZXNFSVUyMW1HUlFvb2NEaGN0cWJMN0tkM1hoeTdGS0hYam5YRDN0NVNSMGlC?=
 =?utf-8?B?OVpoNHEySE90ODRpRDRXQXhRWnh4U3RVYTRWSzVaWWc0bXdTRGtKdUx3ZTlQ?=
 =?utf-8?B?ci91MEZLcVc1UjhUeTFTSUxUWkxXV3lTOGdvKythcHJ5aXA0ZnprbGU4cnFh?=
 =?utf-8?B?eW5vdWZjNlFqTnJ1SlpyZTJEUDVtYS93UmlTckNMa3NMVUtaUUtNUmMxQVNu?=
 =?utf-8?B?d28xcXg1OFZHcFF2L3hpY3g5d0Q4NktHTXhvbnN0M2ZGQ0NWL0lHbVJkWGxE?=
 =?utf-8?B?K1B6bW1DV0V0NG9Vck03cWRVellUb0prU1VSTHE4TDZrdDdMZEtuMXNjcHV6?=
 =?utf-8?B?MElabzVSbllNQk0vSUYvNm5GRDl6ck5mQnY1R3NONitzV2dWWlVpLzc5U29M?=
 =?utf-8?B?bUpIeEswdVdQZHhNSFkzZUVMTzVlZVVtQTVUbnFFZXp5bGRZNG5uZnVhWjVx?=
 =?utf-8?B?YjJGR1JSazJOZ3Yxb2NjRzVKL0laRzdiOSsvWExvWjI1OFA1d1VnL2lnUWFk?=
 =?utf-8?B?ZExIR2xuU1NZVjBFamVjdGZJdDJRUDZKYWljYStXNU9qVDluTG1GcXlUVURj?=
 =?utf-8?B?a3l6L1RFWDJGTVRaWWRvb0x3NmQvcTVCNlorVElKZ2dKd2VVVUlSSlFiNGFp?=
 =?utf-8?B?cEtkancwVEFCOHN5RTRheU5MRE5BVU5OenZrZ0JmakUzdEk1b2RuQVBPQUlY?=
 =?utf-8?B?QlorVCtPU2lxRlBCQiszSTNxZU1kK0EvU2d2QjZtb0x2alJoRzJqKzRlZ1V1?=
 =?utf-8?B?UFF0WUFvdDJsNTF5UXV5a0VLc3F3M3ZGR1FDaXhUTFg3R3lZb09jeXlYSTdF?=
 =?utf-8?B?UzdxMCsrYlBWVytqeUI5aUtHTU81TktZeUczZDBtT2QrZDFPTEhZcXV6Y2tB?=
 =?utf-8?B?NUo1czBVVVpxM0ZCREwva3hnVEk1UXROUWdReCtyOEVTRWpOUWFmaFFrMktJ?=
 =?utf-8?B?cHRKR2lXdWlTZHdjeVh5N2dlSkxXUmI2Z2xmZFBmb2Z6QjVUbkZmY0srSzhN?=
 =?utf-8?B?RkN1dWR2MG40UGU0eUh6eVRpaEpKWW1WOTNCNkFHOVlOeGZITTJiQVBYRnRh?=
 =?utf-8?B?Ukx6U2tDd0E0ek5NRU56dW82c2kxaUZ4dGptZ2Y3QWRJZE9tK0hTazFVZVNj?=
 =?utf-8?B?eHUxM1RpTk1mZnZaNklZMWl6VTFZd3VNOWdoczlJdjkvOVBhTjAwUC9kMHJq?=
 =?utf-8?B?eDlmbVczTHBaM0o5dlE4QUEvTlBzSTdXWnRVbzVQY0o0c0FsU1NCdDIxcnF0?=
 =?utf-8?B?R1BnKzhPVXFjd2xGTWFUUnRHc1JCbjlHc2hteDdET3BacUVxbVdZZmxBRGhT?=
 =?utf-8?B?c0pObnVETCs3YmlBVUpRNlBLM25RZ1BYbk5VQ3o0amI0cjZxVlFQM28vLzlI?=
 =?utf-8?B?YzcyTUJ1UlY0T3JldUdUWk90WTZIb2ViMm9qM0VPYm9QTEhrTWhxZ1JXWndl?=
 =?utf-8?B?c0JCNnZBaFQyZVM3ZFhxcVRlNmYxaUk5bURXTCtBaEtDYlljQXIybDRUcHZz?=
 =?utf-8?Q?0/enOHKS7qUFhAWZycJvLYh9uAKYUc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6366.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eEE2NmNRMDRuTGUxSUlwZDVmeFBiYXdKNjlmTHBZRTdqVGw1Z2FqMG9Bemtv?=
 =?utf-8?B?SjhoTzBYTndKa083OGRMVzJpNHgxRGl5aWdseUd0QmtmbktJM3R4YmR5Q05Y?=
 =?utf-8?B?WTU3OFJnUWxjL2NTblliYy9lTS9EZy85VVpYeEhMa0ExOVVweGJrQXFlYmpl?=
 =?utf-8?B?bDdMTXNGZ1R4YXpmc1VTYXNOcWlBMzc2Yy9ZNXVFQlpEdVlWS0RiM2QzNkE3?=
 =?utf-8?B?TzBJaHlWZjQvMW4yUStTeFNjUFdldWNaVWNnV2cydDZ0VTR6MHZvQ1NnSkpQ?=
 =?utf-8?B?WE5CWUlnVy9FS09BekV5bzF4NWMrR1BNaE15L2FqcXFwaE1sRG5iYVhCVHVj?=
 =?utf-8?B?cHJaSTZjWHJvVms3VVkva3QwVTNqUXUwd01HdEk3MkVTNkxySjJqdkx6aXZH?=
 =?utf-8?B?Q1VzbmhkM0lyY3BxNUNsc01ud2lWVTBuZWxHR01FQTZhOGJac3VDRVdUR1VR?=
 =?utf-8?B?dTRqVXh1TkE2ajAvcHZ6b3YzSUhpQk9mejJsUWMwM0RMRG9ReXZnWW40ZUFo?=
 =?utf-8?B?YWxxdHJTUlZZSUg0SmkrN2c2QllzZU0zWTE0bmlCR0RDSHhHV3N4RXVJdWhv?=
 =?utf-8?B?NUI4SmJseG9OOTVPSTEzdmtDNy91Sjc2S2F2bW9HQmF0UHBZbEdhejV0VmdG?=
 =?utf-8?B?cWh4VklBSnA4ZTFWd1B3NmtFa2JUOWpGeTRVQVREOUhiMnBFRzJiaGlmTVpO?=
 =?utf-8?B?SDlVdU45WmxGaWJTUkprK0d4V1ZGV09WWVJ6eUxtSkJKdUhTUjhPdW9WeWR3?=
 =?utf-8?B?bDFJdHpHZ1IzTSt0RjQ3SDgrL3JnZDN3OHF4SkVSRUhpOHFlNWJ4RDNJNW1Z?=
 =?utf-8?B?ZVJhWE5PZ0hJVHNoYnIvZEJJaytCSlZkV3BhU0xZZlZFR2tqNm1JOUM3aHdn?=
 =?utf-8?B?dkJRMzN1OFYvclhGK3dsdmRLcG1hWU1uanh1Tzd5MzdBTW44TnBVVndxRGti?=
 =?utf-8?B?djQ2Z3U5cTgrODlwZnE1L2FmeGhWQ2dhQlV1T1FmL2x1UWt5V2FZbmx3Z1I0?=
 =?utf-8?B?ZlFNbHp6V2loWDFybWtQbG91OHlYMTRBMVNINlFmNDYvUVNBS0JmbWd3dzRJ?=
 =?utf-8?B?dXhaSnovc2MzWEp2RmloV1RlNlVydVBmZ3lwNUN3V0VTamNOb09Ec2ZhY1JF?=
 =?utf-8?B?UEkxRDh4elBBWGJ1WnNNOFBFbUFyaDc5ZFBTZVd4R3VJVzlZVTVWcVlsS291?=
 =?utf-8?B?c2hkU0JOYzVSRVhxZnlqR0tCR0g5aS9Jc0wvUnhGeHNiSGVGdW1ZYkVNb05U?=
 =?utf-8?B?VlFidllmR0dSamRQZFlmNWpFcUYwbnlGT2NJMmw1ZWljcU5sRStvb0RQclc1?=
 =?utf-8?B?SVVhVnZ0UVYvQnRqYzdNSWFhcjJlVkFuWXN3YXRNakxsOG5UdkxDekJmNDZj?=
 =?utf-8?B?d0xBTDhXWGxpVHB2eGN4c3kzSUx2bTd6VENRbkhoNXh0dGJTMGJkVy9sSkkx?=
 =?utf-8?B?L09xcUY3VnNDQXZic0wvK2NWR1UrOE5veHVUaFo2ZTRGbDNNMkxuWlo4UGwv?=
 =?utf-8?B?WE1GMm1jQUx4d2l6Qi9QQ2UrZ1BYY1lZangzYWdwa0FFcmxPQnUyay9UOHFG?=
 =?utf-8?B?SmljR2piUVlSTWVyTGpyU2hKd3ltcittaGNKcHhnMDNFSUFqM2c2ODVZSXJR?=
 =?utf-8?B?S0dQckxrcWUvVk9oT29TL0pOM3l0VFJ6dmRmekI0aVFzTGw4d2hDVURDN3ln?=
 =?utf-8?B?TGdUOWlQVnMxaDYvSzJ0eTRSc2w0ZzJSOENUUnBEdmRWbTYxcmhCVHdOZUpL?=
 =?utf-8?B?UktjaFZzcVBRUHpLcVJBcEsxQTZrZkUrNUE1aXc3SEZLS0lGNlhIcUF3b2Vr?=
 =?utf-8?B?a2xLaG16ZkE0eWxYb2hvdzVISkZhb0M2VTJsYWJQekR2L2FUQ2M4WVVCb1B1?=
 =?utf-8?B?L3o4ZW44THU3eTJzeE9xbXpOTEU0R1U3OXNrU2xmNGFqeG1ZUHNDRVBldEow?=
 =?utf-8?B?QWQ1NmY0YXYvRDF0anBFL1YzanpjOUlDRW5ETlFJUGNVaEJVQmV0ZUFqOFd1?=
 =?utf-8?B?VWFHRm05ejlsSjR4ZFhPZGVkS2hpMnQvdjdvWnM3b1lzUVR2Wmxlc25lYUJJ?=
 =?utf-8?B?czhMbHg1Mm4zTW9Tenh3akVKeUQ2NzBHdllrTkxLcnhLOHlEL3B2RHN5SFgy?=
 =?utf-8?Q?DuxX3E/TL6b16233qbs7dxBit?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: bd33f256-9908-4feb-b102-08ddb3d2a15e
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2025 10:25:38.8174
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2qjLr5zJ5nhtxOavI8e/wOLIx6oh+G4wMuswgJT8LA+s/Iy2Y39GOcjXTF+6B22aVkB+fKlyRfj5iOKAJv8MHt25MXxwV4Jqx2ELf5+vXgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4818
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0ggMTAvMTBdIG1laTogYnVzOiBDaGVjayBmb3Igc3RpbGwgY29ubmVj
dGVkIGRldmljZXMgaW4NCj4gbWVpX2NsX2J1c19kZXZfcmVsZWFzZSgpDQo+IA0KPiBtZWlfY2xf
YnVzX2Rldl9yZWxlYXNlKCkgYWxzbyBmcmVlcyB0aGUgbWVpLWNsaWVudCAoc3RydWN0IG1laV9j
bCkNCj4gYmVsb25naW5nIHRvIHRoZSBkZXZpY2UgYmVpbmcgcmVsZWFzZWQuDQo+IA0KPiBJZiB0
aGVyZSBhcmUgYnVncyBsaWtlIHRoZSBqdXN0IGZpeGVkIGJ1ZyBpbiB0aGUgQUNFL0NTSTIgbWVp
IGRyaXZlcnMsDQo+IHRoZSBtZWktY2xpZW50IGJlaW5nIGZyZWVkIG1pZ2h0IHN0aWxsIGJlIHBh
cnQgb2YgdGhlIG1laV9kZXZpY2Uncw0KPiBmaWxlX2xpc3QgYW5kIGl0ZXJhdGluZyBvdmVyIHRo
aXMgbGlzdCBhZnRlciB0aGUgZnJlZWluZyB3aWxsIHRoZW4gdHJpZ2dlcg0KPiBhIHVzZS1hZmVy
LWZyZWUgYnVnLg0KPiANCj4gQWRkIGEgY2hlY2sgdG8gbWVpX2NsX2J1c19kZXZfcmVsZWFzZSgp
IHRvIG1ha2Ugc3VyZSB0aGF0IHRoZSB0by1iZS1mcmVlZA0KPiBtZWktY2xpZW50IGlzIG5vdCBv
biB0aGUgbWVpX2RldmljZSdzIGZpbGVfbGlzdC4NCj4gDQoNClJldmlld2VkLWJ5OiBBbGV4YW5k
ZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29tPg0KDQo+IFNpZ25lZC1vZmYt
Ynk6IEhhbnMgZGUgR29lZGUgPGhhbnNnQGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiAgZHJpdmVycy9t
aXNjL21laS9idXMuYyB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21laS9idXMuYyBiL2RyaXZlcnMv
bWlzYy9tZWkvYnVzLmMNCj4gaW5kZXggNjcxNzZjYWY1NDE2Li4xOTU4YzA0M2FjMTQgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvbWlzYy9tZWkvYnVzLmMNCj4gKysrIGIvZHJpdmVycy9taXNjL21l
aS9idXMuYw0KPiBAQCAtMTMwMSwxMCArMTMwMSwxNiBAQCBzdGF0aWMgdm9pZCBtZWlfZGV2X2J1
c19wdXQoc3RydWN0IG1laV9kZXZpY2UNCj4gKmJ1cykNCj4gIHN0YXRpYyB2b2lkIG1laV9jbF9i
dXNfZGV2X3JlbGVhc2Uoc3RydWN0IGRldmljZSAqZGV2KQ0KPiAgew0KPiAgCXN0cnVjdCBtZWlf
Y2xfZGV2aWNlICpjbGRldiA9IHRvX21laV9jbF9kZXZpY2UoZGV2KTsNCj4gKwlzdHJ1Y3QgbWVp
X2RldmljZSAqbWRldiA9IGNsZGV2LT5jbC0+ZGV2Ow0KPiArCXN0cnVjdCBtZWlfY2wgKmNsOw0K
PiANCj4gIAltZWlfY2xfZmx1c2hfcXVldWVzKGNsZGV2LT5jbCwgTlVMTCk7DQo+ICAJbWVpX21l
X2NsX3B1dChjbGRldi0+bWVfY2wpOw0KPiAgCW1laV9kZXZfYnVzX3B1dChjbGRldi0+YnVzKTsN
Cj4gKw0KPiArCWxpc3RfZm9yX2VhY2hfZW50cnkoY2wsICZtZGV2LT5maWxlX2xpc3QsIGxpbmsp
DQo+ICsJCVdBUk5fT04oY2wgPT0gY2xkZXYtPmNsKTsNCj4gKw0KPiAgCWtmcmVlKGNsZGV2LT5j
bCk7DQo+ICAJa2ZyZWUoY2xkZXYpOw0KPiAgfQ0KPiAtLQ0KPiAyLjQ5LjANCg0K
