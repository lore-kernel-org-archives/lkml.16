Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78792135C5
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750744915; cv=fail; b=ZEpGTTkFYPYeJHSdacPZX7jXnB9kmZQXntfaV5kL1ewJEfgwij2Q1E3OIR32dHgq1VlnjCW77SDBSjK+D8SvB1hFDzJbWJGDasb8Z7cFt1waxuAVCKtFQTgxhFsJ7RziwQ8tUMsNPEcLfjTz4t4BxgaGDRKsfJYOzKxlc43xsv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750744915; c=relaxed/simple;
	bh=Y6OT3pAGX1PpVi/R1FysEashdRRaqgRuQixI8I8/bOY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=U51pIV/TpNPuc43i/G1bUY/MMzqKIvo7FjN8JY2PxG0NqiaUJHQx6Kz2nDfh8AnF0QpuN1QcbPQyF0IdV2pbqrjc6RLN3aegQuJSy9bQxdaoeGx7O0Xkdez9XpARmpXmRUq3wguHV8iFAFRIHvSWMqO4cs/uhn3IETqqvZ9t9zo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5JY3n0O; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5JY3n0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750744913; x=1782280913;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Y6OT3pAGX1PpVi/R1FysEashdRRaqgRuQixI8I8/bOY=;
  b=M5JY3n0O7cuGvY6vCfkkYxyau+sEJPJZ8Q3dcjKJP5tp/GOayiEwqE9g
   vO6KZ71E6bc2syCNfYkTxxADhszLUpEmLDdwl2xfxY88lIwINcQ78dZnC
   45CsxCOlmAMNQxg2wNDVs70GjEbXFcbWqeO2+HkXRtzJgf7+fOl8b1Ckn
   lnc/3NxKO4+WrtHeBg2h1R1CcS9QqSt80LmrXBsK0O84KfQaGxVVypYyS
   8R6RBdLJRTyg/4semsLCUbbAbHiKI2uNvN6mh2gjBN/d61RfR1kml9GOS
   ZnMoaovl5Lr0R2SFOA3aBcnPyv+9GHenpBabLXlwhp4NIbEFm7p9GLFIw
   w==;
X-CSE-ConnectionGUID: FUAumj/zRFmXdsUoXhT+HQ==
X-CSE-MsgGUID: hmNHXft2QhmnfOgj+AwoHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52844001"
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="52844001"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:01:52 -0700
X-CSE-ConnectionGUID: IXvChDKfRDiGQIll4iZMaw==
X-CSE-MsgGUID: AOMRuRxlRH2xze7uA4/G8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,260,1744095600"; 
   d="scan'208";a="151958090"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 23:01:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 23:01:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 23:01:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.65)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 23:01:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rX/WB1fiqA9t1cUCPBDpbf3Kxe6r/RCB33/U7bIGcb3HC4fDfsC++obFSARp3CgkPEWKBg0N62/a6twgnO9yR543oEwMPZSF1Dx5htcYmqUTynBUzQWNq1/pgXe7J9lmcRlZZLMZnfKg/alkOdSxuqSVzObM82MaBAsRa0mWpgAJjoC0L/nrWlzOb055MGRjrwWkn8fcOTw3ffbFU6qqNW6xKQNpiT9OaPhIEJXwnlcvxYGnW43a9XoA0ePbFjWNZKEkwk8YK8deBMi2ZRr7V/uFGxI1J7madZUMNBkQP/euXTsO3DUFdosGijYp64rXGyX96Y3dwVQEKW38zDkDtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6OT3pAGX1PpVi/R1FysEashdRRaqgRuQixI8I8/bOY=;
 b=QdnWLPLS8UkYn1H/QFgX5sWf1c6TM2CE4RLQ1PYe7+ksXE5NHvBI6BmlpLSDQTkLcXqUWYx5fRMRb/WQNbme065Em9QczGNeDZo/qSuMSDFuyusC8OyKk+7QkkVDfd/pl4L5kOYUqEy2C3Ijz7e40Fx1AvhEsujkMNI3Nm3OumLT/RJq7xx0oXhRaMJjIddpJH8m43yZKkzy4mdf8KjrvVtpbV/xoQr0VYDeM11RfAB6kld7W8zpY7p2GXEpzu2RsiJVT/X+lVku7V6tG9OtIUu4kkIUSAhDP00anj0/p+UpeT1MC/y/OQ+fsZmpvn++gGP1o5XLrdx3jnet2/WtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6370.namprd11.prod.outlook.com (2603:10b6:208:3ae::8)
 by PH8PR11MB6706.namprd11.prod.outlook.com (2603:10b6:510:1c5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 06:01:48 +0000
Received: from IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d]) by IA1PR11MB6370.namprd11.prod.outlook.com
 ([fe80::401f:1d9b:38a6:444d%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 06:01:48 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>
CC: "arnd@arndb.de" <arnd@arndb.de>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "linux-kernel-mentees@lists.linux.dev"
	<linux-kernel-mentees@lists.linux.dev>
Subject: RE: [PATCH] mei: bus: replace sprintf/scnprintf with sysfs_emit in
 show functions
Thread-Topic: [PATCH] mei: bus: replace sprintf/scnprintf with sysfs_emit in
 show functions
Thread-Index: AQHb4g7TuPmDLuLCPE+Dt+4oczBF0rQR1lww
Date: Tue, 24 Jun 2025 06:01:47 +0000
Message-ID: <IA1PR11MB63701B0E9642888CBAA7B876ED78A@IA1PR11MB6370.namprd11.prod.outlook.com>
References: <20250620181144.10750-1-moonhee.lee.ca@gmail.com>
In-Reply-To: <20250620181144.10750-1-moonhee.lee.ca@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6370:EE_|PH8PR11MB6706:EE_
x-ms-office365-filtering-correlation-id: fc8547ff-5041-4386-c4ec-08ddb2e49b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TUVRcExuSlVUa3dPZGp6WWtuNnpCcTBJdlpIQmxrQVhjZC9KQ1AvVlpJemVl?=
 =?utf-8?B?K0R3SGpZbTAzKzF5MkUwMkZBaE10MGQwNjZCR2VEQnI0Y1czamdTSW9Pakp5?=
 =?utf-8?B?THhBTHg5UTEvYWNsNUNMY1F0RzMyQ1dtNlNUcHFvUi9VcU9icy90ellmQ2tr?=
 =?utf-8?B?ODRock5Zekx1b2YrUEtkdGRZdmY0RjcyZkROYUE2djljbklzcXdoV2Vsc295?=
 =?utf-8?B?cXNIRG9pN0JMZDhUWkZQTVBTMVBRWis1Y2pHUElyV1pUVnc0ek4wdjBHQVZF?=
 =?utf-8?B?Wklib21wSkU4QWRYekt3dGpRREF2UyttdkJVZ2JYV09XS3V2OUZUZGJJQWhD?=
 =?utf-8?B?YUIxN2duUWs3REh1YjQ2clFjRnFvajRMcFZGeDFja1VJbDRjWktiM204NVhF?=
 =?utf-8?B?NkN4QjcvK2FScklHK0pwU203SUJNUlBuc1Z2MDBBUnFmbmJYYXVVUXBZNCts?=
 =?utf-8?B?MTdLTHpoTi9VOVNuK29aamM2d3laZWpDdml5aG1rYlgwTjdDS3NNdi9KeGt3?=
 =?utf-8?B?bzc0Vm9CMEpzc0NzaHR6VENMazBuZ0VLek1peFl0Mno4cjRWLzJWMzE1VEFw?=
 =?utf-8?B?bjQ0UHV1WGpVU0xldGs0S2VzK2htWVlSOFR6NUJZNUFwZUtFc3hWVCttbkQv?=
 =?utf-8?B?QnQrS29QMkhtSjRGNjNPd3pGUXVSNmhZeFh3ank5cDlUenVmaVlZd1YvYkZq?=
 =?utf-8?B?aDFndC9GVmZIa3UwcXZOckphclVyTWV5WWxTR0Y3QzdLMFJOR0czUmJ3YzlG?=
 =?utf-8?B?Q3ExNk1vemhkTWUvT0NLMi9QWHFEN2lvU1RIMlgrT3ZCMW9iTExFQUFSdHhH?=
 =?utf-8?B?eTQyaHQ5NjNCNmlFTTBjTStCTC9jWmwreEZOOHY1empIMGdiVlBMVmpCcnUw?=
 =?utf-8?B?ZG1jQjAyTzVrYVFlaDVBdUt0bTJxamNDOXRzWjVISUpaYnZzV09NQmZYNXds?=
 =?utf-8?B?ek1HbjUzUVphVEcxbVUrNHhnN0lhQnJ6UGJ2UDJmUGYrUUlLdzREQVVYWFVW?=
 =?utf-8?B?aldFQzN0YzBFaHdEZ1VyRE9iMG9ncGU4aVVnb0Q1NGpFenV6aEVLL2U5M3Ns?=
 =?utf-8?B?UVN6NGZYNUtROVJhTXptNHJrUnJ5SDRzLzB6OWtxSlArZGx3aUlKNGlSUFND?=
 =?utf-8?B?UGtGaU5MZ3VhOTNjdlRxTWs4b09YdGI4cGdOa3E2c3BxbXhMYmhzL1R3NVE3?=
 =?utf-8?B?c29hd09mdldSOVlTRTM1Sm5lVVBUZG44RlVMeTY0Mzd4MUR1dEcyeFZFZ1RQ?=
 =?utf-8?B?aVRpR3BqWVNHcXJDTjY5MDlGb1ZLRzZCUkc1dVlKdUwraHJLamZMcHpkRWN4?=
 =?utf-8?B?NDBJbmxkR3VjU0tDSDFBdVNEWW5xeTFDMTM2aEpsU0M3d1d2cmg3Um9TK2Z1?=
 =?utf-8?B?eFNUbkh1dDMrallMbmx2VERwcTJsYnAvU3daM3FORnB5ejNPeGZUaGtDc0JJ?=
 =?utf-8?B?TEIrR0J4VzFjY2xjU1JQL2R4V2hnK25xNVRieVdVbzBocUt0NDdpUFZ5Q2NU?=
 =?utf-8?B?ZFREVC83Wm5WN0VjaUlWcThuWW9GdTRYMWFOdnhwRHBWbFNRdnZ2THd1c1pC?=
 =?utf-8?B?MGd1aFhKbk53L3ROSTNydk9sVCszR2tLYUZCeGVQbU1hK3g3Y0wxUFA4bkxk?=
 =?utf-8?B?aHQ0RXRXUSsrSVhxYUVmVDhsREY2eHY1SFliMWlzQi9KdExaYjFyZ3Q3c1J2?=
 =?utf-8?B?NzdUMnhGYXBpcm50UXI2eG1Nazg2RFZtN3p4aVpCN0gwcU1BUTNqZDIyYkc0?=
 =?utf-8?B?NXdDSmlRcDBjMERlVzdLY1dweHRnVVhuWUZNZ29oYUpZR0N2V2dEUHRrMlRC?=
 =?utf-8?B?ci9admRFZ2F5M0V0aVBsL0dKdlNXbG5ObWUwUnVkNGVPTEZKcy9jR2lZa1Vo?=
 =?utf-8?B?aXlvNE02S0cwUGpUR0h3SzgwNXltVVRKNk55L2JLQXpEdHV5Y0g5VlBPZ0RS?=
 =?utf-8?B?RTdXUjZFSHd1Z1lhRC9PRzRzL2FuQUV5dDFWWmk1TVJ5THk2L0J3MHFlNWxp?=
 =?utf-8?B?dDRWVDEvdWJnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M0pPOFAzQTFPSGV5aks5OUhiVWZUeUpTdkd3MzkxUVEwTjN0NXFLZjN1cnpX?=
 =?utf-8?B?L3c4WXRvcmo1NERaMTVOcVJVRVBIdzNuU1E0MEFveTZDZWswMHdqMlRFRGsz?=
 =?utf-8?B?dnVCK3pGZ2k5czhSd3VkYmFseGJRdllLMGlLREFwZkNuOHYrSWF4Tm1LdXJa?=
 =?utf-8?B?d0FzTi93YlRLZEd2MFArMGFIWWN1UmNnZTBuNUlNQUVnejRhTTdISjdVU1Vt?=
 =?utf-8?B?MS9MU2N1elZncTliSm1WWENxZzFId0tETWZIUm5IRVdWeVdpKzVRcGNGZTN6?=
 =?utf-8?B?UkF0Wk12MWorcVIwNnlJQmFSdEZ5VWpaeUZHMWtrbHBCY1k5NFZsMFVxWnI2?=
 =?utf-8?B?YStBbk84MDJia3p6ZkRLUE9BM3BEaUN0M0llVnNHOG5RcVVsNkZkNTBUclAy?=
 =?utf-8?B?UWJENzMySVFVQnE5clYyL0NCUExQNFVka2t4WmZCTU83N0ZrZEFIaFdRR0R1?=
 =?utf-8?B?UFZsZDZqak9IcHBZcDUrbnVwM1ArVzVtK3cyU01Ud1YvR3h5dVRuQnRjM3BK?=
 =?utf-8?B?R1hlek1QYnVNRzFGbUJUbUowMzVDU1dIYVlFK3hHdnptdGIxRDZHRktlK3hR?=
 =?utf-8?B?VWJ1aDcvQzV4alRJZUoxTjJuM05IKzdpY3EwOXpUWGo5VGJEaGMvbm1LSUIr?=
 =?utf-8?B?QWVXV0lRbGU4UkYxTmZkMFhXRUtNR0xwaFJVUUNFeDNjaTRMUGRBOWhrMXd3?=
 =?utf-8?B?cUoxY3l4OHNMdXRnVzRleG82a2x2NjBLUzVVanN0SlN1K1JROGtNeTNDbi9r?=
 =?utf-8?B?YWpjYjRBYmJSbXNkN2QxRzJ4Uy9DUnl6OFBoQXVHdXR5R3lFU3RSMjErV3RH?=
 =?utf-8?B?bGUzTWY0L2tlSURoK3BQVDloWkhBS1QxeUtsK2pBSXp1VjJDVmZ4MXYyZklX?=
 =?utf-8?B?Z2d6SUlvTG9ralB6MjB4dFVqb0dJNG9SdDRGYzFHRFo2SU8zU1dHSUVLR2hQ?=
 =?utf-8?B?N2s4eEJBVUJpY2I1WGFqSkJoVmgvZk1NVXVRNXVGd1lzQ0ZSOFJnUGx4OU1K?=
 =?utf-8?B?aWRYTTNtS29rMU9tMGpqMitGUlp6Zys0OXdZTDZza2JWUnczZSt2a3VkbUNB?=
 =?utf-8?B?eUprMXVTMFhkay90UFR3VXpJNElWWWFpOUpDUzNiUFZLWk9SQVViZjV2NWRU?=
 =?utf-8?B?amNsVE93ZjkrYnkrNll0V2NtY25tTXJaSkN0YTdUVk0wcHRsNWVYL25MOUxS?=
 =?utf-8?B?VWhjT21vT2wwZnllNmgzL3NhR0JucTYrY01KRysxQXRrZUJTSXpheU03YmJj?=
 =?utf-8?B?TGJRNGZEclJleVhVcWV2NkVVQW9EWm1TK05vbGhURUl1em90cGxHSzlhUzhV?=
 =?utf-8?B?UC93SzZ6Y3I0YkFJQlZPamZkSWdyWXVYS2dvRGNzaVR6QUxPcnhsMjk2QldB?=
 =?utf-8?B?VVpybGhrVHZrMlZQMVo3bUVqdlZZanJtT1kyMktlZGlKelpGaGgxaXJtNVQ2?=
 =?utf-8?B?QjVQTmpzQTRnd3VyT1hBWGZTQlN1d2NzaEZBMDlCNjIwSnN0aDUvZER0VERZ?=
 =?utf-8?B?Sk1qWHBvcHR4SVlMSVV5MDBOU3YzUnlXTjFhOXRVeEJFOVhSMXN4cGppdEZK?=
 =?utf-8?B?cUZzYTA1cmttWG1oUzYxdFlLeXNhSzViUVlCT0ZSZk1TK1BCOGdsakFGQ25Q?=
 =?utf-8?B?OHV6V3dZQ2x1REZCWGdObVREVnhiRXk0N3dMMXZVNXhyZkhTbDR5WjBqaHZR?=
 =?utf-8?B?TzBBelo5OFBMdUJUMk9Rd0V0SHdkUnJDRGFDRk1kaUh3WmlmZTM5TTE1ZUtB?=
 =?utf-8?B?endqNkJsRlRoTFFJaml2dkhSeTVNb245NFJTcVViU2FzMzVvT1QrdG81NVh5?=
 =?utf-8?B?Q05MMlVMTjVMT3hybDlOS3JOeFdoL0ZuNW9ueXhrbGxURmNvRHI1Yi8yRGZk?=
 =?utf-8?B?TWdCdzR0dGxQanRNVHQ3bzFiQXZEK3NkazQ1OTVCYmFmLzNEdGtOeUVGMytw?=
 =?utf-8?B?dFRJWXBCM1RSUGxqSGR1Q3k1T1NnTHFDNXI2Y3BDQ2ZTR0wzWXQwWjV6T1dO?=
 =?utf-8?B?d0JWamFjRXlPOFBaa2JNajFuV3dZUlQzTkh4NVM0K3JqdGRwNGZ1OFZpVFl3?=
 =?utf-8?B?aEF0MmNuc2hCbDI4QmhhTDY1cGZtcjBhaUZsOWtRNThDU0NIQU1idHBiSVNS?=
 =?utf-8?Q?FTJ/xlEBvqAjtaSMVptMwlZb7?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc8547ff-5041-4386-c4ec-08ddb2e49b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 06:01:48.0149
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H8BnlorEQdNQAXeD31/tJD7kDsrrGMT3aMisiQDyAKe3Es/dRubd9F5htY3RS6ap5GZwfVdvnHmZoAgR5Z17YHYUqEH093nrnllc7TIBYTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6706
X-OriginatorOrg: intel.com

PiBTdWJqZWN0OiBbUEFUQ0hdIG1laTogYnVzOiByZXBsYWNlIHNwcmludGYvc2NucHJpbnRmIHdp
dGggc3lzZnNfZW1pdCBpbiBzaG93DQo+IGZ1bmN0aW9ucw0KPiANCj4gVXBkYXRlIGFsbCBkZXZp
Y2UgYXR0cmlidXRlIHNob3cgY2FsbGJhY2tzIGluIHRoZSBNRUkgYnVzIGRyaXZlciB0byB1c2UN
Cj4gc3lzZnNfZW1pdCgpLCBhcyByZWNvbW1lbmRlZCBieSBEb2N1bWVudGF0aW9uL2ZpbGVzeXN0
ZW1zL3N5c2ZzLnJzdC4NCj4gDQo+IFRoaXMgaW1wcm92ZXMgY29uc2lzdGVuY3kgYW5kIGFsaWdu
cyB3aXRoIGN1cnJlbnQgc3lzZnMgZ3VpZGVsaW5lcywNCj4gZXZlbiB0aG91Z2ggdGhlIGV4aXN0
aW5nIHVzZSBvZiBzcHJpbnRmL3NjbnByaW50ZiBpcyBmdW5jdGlvbmFsbHkgc2FmZS4NCj4NCg0K
QWNrZWQtYnk6ICBBbGV4YW5kZXIgVXN5c2tpbiA8YWxleGFuZGVyLnVzeXNraW5AaW50ZWwuY29t
Pg0KDQo+IFNpZ25lZC1vZmYtYnk6IE1vb24gSGVlIExlZSA8bW9vbmhlZS5sZWUuY2FAZ21haWwu
Y29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvbWlzYy9tZWkvYnVzLmMgfCAxNyArKysrKysrKy0tLS0t
LS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21pc2MvbWVpL2J1cy5jIGIvZHJpdmVycy9taXNj
L21laS9idXMuYw0KPiBpbmRleCA2NzE3NmNhZjU0MTYuLmJjMTI0YTE1MDA2ZSAxMDA2NDQNCj4g
LS0tIGEvZHJpdmVycy9taXNjL21laS9idXMuYw0KPiArKysgYi9kcml2ZXJzL21pc2MvbWVpL2J1
cy5jDQo+IEBAIC0xMTU2LDcgKzExNTYsNyBAQCBzdGF0aWMgc3NpemVfdCBuYW1lX3Nob3coc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gZGV2aWNlX2F0dHJpYnV0ZSAqYSwNCj4gIHsNCj4g
IAlzdHJ1Y3QgbWVpX2NsX2RldmljZSAqY2xkZXYgPSB0b19tZWlfY2xfZGV2aWNlKGRldik7DQo+
IA0KPiAtCXJldHVybiBzY25wcmludGYoYnVmLCBQQUdFX1NJWkUsICIlcyIsIGNsZGV2LT5uYW1l
KTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlcyIsIGNsZGV2LT5uYW1lKTsNCj4gIH0N
Cj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhuYW1lKTsNCj4gDQo+IEBAIC0xMTY2LDcgKzExNjYs
NyBAQCBzdGF0aWMgc3NpemVfdCB1dWlkX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QN
Cj4gZGV2aWNlX2F0dHJpYnV0ZSAqYSwNCj4gIAlzdHJ1Y3QgbWVpX2NsX2RldmljZSAqY2xkZXYg
PSB0b19tZWlfY2xfZGV2aWNlKGRldik7DQo+ICAJY29uc3QgdXVpZF9sZSAqdXVpZCA9IG1laV9t
ZV9jbF91dWlkKGNsZGV2LT5tZV9jbCk7DQo+IA0KPiAtCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVw
VWwiLCB1dWlkKTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlcFVsIiwgdXVpZCk7DQo+
ICB9DQo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8odXVpZCk7DQo+IA0KPiBAQCAtMTE3Niw3ICsx
MTc2LDcgQEAgc3RhdGljIHNzaXplX3QgdmVyc2lvbl9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwN
Cj4gc3RydWN0IGRldmljZV9hdHRyaWJ1dGUgKmEsDQo+ICAJc3RydWN0IG1laV9jbF9kZXZpY2Ug
KmNsZGV2ID0gdG9fbWVpX2NsX2RldmljZShkZXYpOw0KPiAgCXU4IHZlcnNpb24gPSBtZWlfbWVf
Y2xfdmVyKGNsZGV2LT5tZV9jbCk7DQo+IA0KPiAtCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiUwMlgi
LCB2ZXJzaW9uKTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlMDJYIiwgdmVyc2lvbik7
DQo+ICB9DQo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8odmVyc2lvbik7DQo+IA0KPiBAQCAtMTE4
Nyw4ICsxMTg3LDcgQEAgc3RhdGljIHNzaXplX3QgbW9kYWxpYXNfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+IHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphLA0KPiAgCWNvbnN0IHV1aWRfbGUg
KnV1aWQgPSBtZWlfbWVfY2xfdXVpZChjbGRldi0+bWVfY2wpOw0KPiAgCXU4IHZlcnNpb24gPSBt
ZWlfbWVfY2xfdmVyKGNsZGV2LT5tZV9jbCk7DQo+IA0KPiAtCXJldHVybiBzY25wcmludGYoYnVm
LCBQQUdFX1NJWkUsICJtZWk6JXM6JXBVbDolMDJYOiIsDQo+IC0JCQkgY2xkZXYtPm5hbWUsIHV1
aWQsIHZlcnNpb24pOw0KPiArCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIm1laTolczolcFVsOiUw
Mlg6IiwgY2xkZXYtPm5hbWUsIHV1aWQsDQo+IHZlcnNpb24pOw0KPiAgfQ0KPiAgc3RhdGljIERF
VklDRV9BVFRSX1JPKG1vZGFsaWFzKTsNCj4gDQo+IEBAIC0xMTk4LDcgKzExOTcsNyBAQCBzdGF0
aWMgc3NpemVfdCBtYXhfY29ubl9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gc3RydWN0IGRl
dmljZV9hdHRyaWJ1dGUgKmEsDQo+ICAJc3RydWN0IG1laV9jbF9kZXZpY2UgKmNsZGV2ID0gdG9f
bWVpX2NsX2RldmljZShkZXYpOw0KPiAgCXU4IG1heGNvbm4gPSBtZWlfbWVfY2xfbWF4X2Nvbm4o
Y2xkZXYtPm1lX2NsKTsNCj4gDQo+IC0JcmV0dXJuIHNwcmludGYoYnVmLCAiJWQiLCBtYXhjb25u
KTsNCj4gKwlyZXR1cm4gc3lzZnNfZW1pdChidWYsICIlZCIsIG1heGNvbm4pOw0KPiAgfQ0KPiAg
c3RhdGljIERFVklDRV9BVFRSX1JPKG1heF9jb25uKTsNCj4gDQo+IEBAIC0xMjA4LDcgKzEyMDcs
NyBAQCBzdGF0aWMgc3NpemVfdCBmaXhlZF9zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0
DQo+IGRldmljZV9hdHRyaWJ1dGUgKmEsDQo+ICAJc3RydWN0IG1laV9jbF9kZXZpY2UgKmNsZGV2
ID0gdG9fbWVpX2NsX2RldmljZShkZXYpOw0KPiAgCXU4IGZpeGVkID0gbWVpX21lX2NsX2ZpeGVk
KGNsZGV2LT5tZV9jbCk7DQo+IA0KPiAtCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiVkIiwgZml4ZWQp
Ow0KPiArCXJldHVybiBzeXNmc19lbWl0KGJ1ZiwgIiVkIiwgZml4ZWQpOw0KPiAgfQ0KPiAgc3Rh
dGljIERFVklDRV9BVFRSX1JPKGZpeGVkKTsNCj4gDQo+IEBAIC0xMjE4LDcgKzEyMTcsNyBAQCBz
dGF0aWMgc3NpemVfdCB2dGFnX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QNCj4gZGV2
aWNlX2F0dHJpYnV0ZSAqYSwNCj4gIAlzdHJ1Y3QgbWVpX2NsX2RldmljZSAqY2xkZXYgPSB0b19t
ZWlfY2xfZGV2aWNlKGRldik7DQo+ICAJYm9vbCB2dCA9IG1laV9tZV9jbF92dChjbGRldi0+bWVf
Y2wpOw0KPiANCj4gLQlyZXR1cm4gc3ByaW50ZihidWYsICIlZCIsIHZ0KTsNCj4gKwlyZXR1cm4g
c3lzZnNfZW1pdChidWYsICIlZCIsIHZ0KTsNCj4gIH0NCj4gIHN0YXRpYyBERVZJQ0VfQVRUUl9S
Tyh2dGFnKTsNCj4gDQo+IEBAIC0xMjI4LDcgKzEyMjcsNyBAQCBzdGF0aWMgc3NpemVfdCBtYXhf
bGVuX3Nob3coc3RydWN0IGRldmljZSAqZGV2LA0KPiBzdHJ1Y3QgZGV2aWNlX2F0dHJpYnV0ZSAq
YSwNCj4gIAlzdHJ1Y3QgbWVpX2NsX2RldmljZSAqY2xkZXYgPSB0b19tZWlfY2xfZGV2aWNlKGRl
dik7DQo+ICAJdTMyIG1heGxlbiA9IG1laV9tZV9jbF9tYXhfbGVuKGNsZGV2LT5tZV9jbCk7DQo+
IA0KPiAtCXJldHVybiBzcHJpbnRmKGJ1ZiwgIiV1IiwgbWF4bGVuKTsNCj4gKwlyZXR1cm4gc3lz
ZnNfZW1pdChidWYsICIldSIsIG1heGxlbik7DQo+ICB9DQo+ICBzdGF0aWMgREVWSUNFX0FUVFJf
Uk8obWF4X2xlbik7DQo+IA0KPiAtLQ0KPiAyLjQzLjANCg0K
