Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6478548EE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 11:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746011472; cv=fail; b=h0UBqSAS3GVCjD/OdC7YNZZ70ErVK1lgHsE4vNToqc3O/A1AdDOCaC97ou9FgnCcQKUwzYCf+URd7w19E6pXxa6+6xFbJI34bYoqG8oHucMRBX5vpXMAtA1iIq33gIXZpHHNA9jeBANiXWDJW7CfAJghefoglnEAKqfGUYaxxqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746011472; c=relaxed/simple;
	bh=NffBYVdhr9257INqRBI6AxMBJHUhyzQsqrCr3Gv18Ig=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MiliueH15lEXhAN3zUEuEWDkv+RxFQ7zCxeVq20QOCZ49xSnuRDz8DFZEbZ1VHbNSIvFaBH1ekab7P4IOf2W2pFF+COQd7Nf2Zu0i3az4diA6z/cJnBerZtzVovCQdWXwd7V40GchaDfevMNxLFeCW6F/zgL/rXROaWBMkn7s3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDRflj++; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDRflj++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746011471; x=1777547471;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=NffBYVdhr9257INqRBI6AxMBJHUhyzQsqrCr3Gv18Ig=;
  b=FDRflj++qmiuJdULgd6k+DWqoqk6EQ5yrEd1n/71djEWDPEXhjPbebtC
   s2t4El4zi9dD5Q5iUYZTHs0/mBlS1VvXtozSbyLXIL60oEtJrmdcjERV0
   ZGABR2UveCvqrii9WxbCKTAi4wLewdAAmyVJ31W6LNaU7YbNM4XCoXbGu
   HxX9WmW1LuN7OIDw1O4mWSTbimuxfpUfV4SK+IcZAXXiwYfNBBA8rau09
   YVOczinCHkaPZHa1POE61tQUZyGFYMNnzdliuKrN2ji/Qj80uIWIsG0g+
   iicQJQh2usrZjU/ALaPnCbBQhlfJHNTLHAK61sn6C7AYoLL6IITPGqoJz
   Q==;
X-CSE-ConnectionGUID: uXj7rUb9R62CNwuYFfPqjA==
X-CSE-MsgGUID: Az2eY127Tjys6cQPV4LKNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47680110"
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="47680110"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:11:10 -0700
X-CSE-ConnectionGUID: lTHp44uwTem1uFnMLrqFyQ==
X-CSE-MsgGUID: fteIvljlSYu/KN0Kwvu3tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,251,1739865600"; 
   d="scan'208";a="133985564"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 04:11:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 30 Apr 2025 04:11:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 30 Apr 2025 04:11:09 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 30 Apr 2025 04:11:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CFnbI1CqXQ6G6Gwq/sZnI3KvI2SJguZ/BZspshDHeAFFEfg8gSDb9rHH0ipxXI6J17SbchK3eayOUXAdhEkR+8NKs0qL1ZwS82eqlkjJ/jCh7iT0jrbIKDKXtNydcPvsbN7aK/roTumqSEfGq54YfUQZ3xLTnaIG7jkDgDmB4e4U2rM/h40fXTB5U7yG84FID2yntkFt4YODY8hzn40tpVDs7LSyVZcuFdosaJTZSx7pi+sgbMnH1AL0qvP1LZV3oCn301dlMtpRXDk22cKUSCZCo1zUZeuO7IbW69Z4mvqd2pXYkuPhsxvA0thivNYuzjQ6vMi7oImxzqTAqyhEBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhAFb3AUOzcHyReZTjsCIbg95h342nzadtvgKZwBvZo=;
 b=sYQohXIEOChoMPYI3KCNMcwVlnVkc+5RUf9yDJDQXpTIEchvznDZCF2bvob3FZ0rjuofd2xC4ngSPS9oe2hBGday0pxEh6bzInfuDhZ1Ob7vtrJSjK7yuYrFpYE6EPxFLEU1x5N4JHaI3ZpxFjovolLwtl6hLjPA5enBjB1gkK+NfZZ5+3zIv/9TfmKHxJ/wkkFT31KsWHVydS8o2IYQsu6VvBMxnC17rCSD4ecBhwfnKzzsUuSfUwur587KSf6F8Tt1Sbtk4E1d27kTajR75KVLuQG++O5zGQX0GiFA55TgtZIR10CgsIr+/KcPCVGDo+kW7q5JZcb6aOSr2ka1MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.34; Wed, 30 Apr 2025 11:10:33 +0000
Received: from PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f]) by PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f%7]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 11:10:32 +0000
From: "Miao, Jun" <jun.miao@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, "Li, Zhiquan1"
	<zhiquan1.li@intel.com>
CC: "Hansen, Dave" <dave.hansen@intel.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "Du, Fan"
	<fan.du@intel.com>, "Miao, Jun" <jun.miao@intel.com>
Subject: RE: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Thread-Topic: [V2 PATCH] x86/tdx: add VIRT_CPUID2 virtualization if REDUCE_VE
 was not successful
Thread-Index: AQHbuND6vjibOZxG+ka1jAh+mtIp+LO6umSAgAC/WYCAAHqcgIAAGIxw
Date: Wed, 30 Apr 2025 11:10:32 +0000
Message-ID: <PH7PR11MB8455BCD71320C0C081C29AEB9A832@PH7PR11MB8455.namprd11.prod.outlook.com>
References: <20250429143114.1724280-1-jun.miao@intel.com>
 <20250429143114.1724280-2-jun.miao@intel.com>
 <b138cb84-3a34-40b3-a23d-6ff3708dae6b@intel.com>
 <a0676c7b-9e6d-4af4-87d5-f822ab247730@intel.com>
 <sdczrx3z55vbf4jxbedjpccpdmz7h7ukhhiwrwblpozwyrqssv@ljszzrxvgoxr>
In-Reply-To: <sdczrx3z55vbf4jxbedjpccpdmz7h7ukhhiwrwblpozwyrqssv@ljszzrxvgoxr>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8455:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: 8ab79bf9-f53b-4e28-3afa-08dd87d79ff4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?5H3KZWQzWcF4ZVWJDsoocuiTovH3/EL/1aH+tZpa9EKFpbbcjND4Ae2rIVzi?=
 =?us-ascii?Q?TNq8lM+nex1mBkEvwUED2WoFauS/xuGkr91NqIqMU37BCdZK1PLxyancdLcz?=
 =?us-ascii?Q?sYjXDx1joCnSAfqCaSg6st3NPyCKKYn7zk7kmdW8nexNS2WbfECi+bs2rvND?=
 =?us-ascii?Q?3MbZO0h81PPce5YcdxljhEVv+G59KgPk21JFFQOjIA9CL843rqWcu0nkAOJc?=
 =?us-ascii?Q?ufmGzXJNfag+9DceYuJFCCdiCPaKQsbm7/JtelEo5CBJkwpbrbIAvfb5J6sp?=
 =?us-ascii?Q?FMkpN81kLHgSLPdw9FajAWq+sEDPlxeB0RgqSer6f6E6LF+AJlAcAOK0Tkco?=
 =?us-ascii?Q?K7Zcsb4Xa7qm3DN/4IDFdEs+dlsIXYPuoZOYqvKK7uQkBagvdaTfAxpd52c1?=
 =?us-ascii?Q?M8s2Fztxa5vc+vmPXgVSkDpnCt0YiR7+zT27NcUDi0P3W6mvRbh/ktuqpV/+?=
 =?us-ascii?Q?q7aOGYcEUbutH+2YCqhR6ivxVIrzYZa3Xzv21j3LnSpeZaLyiJ1HM91FInlL?=
 =?us-ascii?Q?zX2xP8ovFoyOlxMEwj5umbjNnR8ktOuUvm2hswyWz3qMnz63yjVQTj3jaZyD?=
 =?us-ascii?Q?y8z7fki2zPzEDyGfX+EDw15r/CCh6ESjTgvrtZMsrjySEEBT0R58mpo1Wlgz?=
 =?us-ascii?Q?Qrruqk0OGCN4OWmuvQmAxzAlRCVdbY2G/KfnCgKNfvvfLsorqnV6TN9HlDX7?=
 =?us-ascii?Q?xJwMEsadj635tX5YcAiFYE1Iuzc884QOQWjV7QiUuvF2tKDZuaZZwBs4xa5/?=
 =?us-ascii?Q?aRJLo4SCuRrQQNthlKs8PDpOX1KtfYaXjEmp/ZRJA5B8CwMnaZGpI1B0BKbn?=
 =?us-ascii?Q?4jk2BWfmXF69v55tUcqav8jeIKFucrfHpakW0Ofqj/7EXEIDZeERWO2xP12r?=
 =?us-ascii?Q?PWPVCAGbiG39O/IqtJ28f/JUrAPpo+RISV+PEsy+5mQZWlFQqS5dBijCa97P?=
 =?us-ascii?Q?IqzFM5/3+f9HxiEoPV3QlrEbrbnl1Fu2me2E9XC4MqGlG8iO82IxLcUTBkVv?=
 =?us-ascii?Q?40Eq6xYJCnCOwfxCz3ObgAbjkJaFI0LYfG+PGKB1tY038KG5RRr4HL6DnGAy?=
 =?us-ascii?Q?P1qcdM/qKqWNoJExC612YHntqYZ9IziK0gLhJICOffeoXmfWC+3jcwJUTPtg?=
 =?us-ascii?Q?KQrmxQ/CEY1ol8mtgMucPvcrdPgARPCSeTbLLAQ+TrAG1/r88zvqnkvwKdr4?=
 =?us-ascii?Q?egHAndV74hxsm96oc37F4wCJH4d4tth9ioO1/2w1/49Gfubg76ttAC+kpWNo?=
 =?us-ascii?Q?qQPdBuSiLxpibc4kNMOK55wNHTJK32Ir7C8O+6zX9s1ts09qQw38j+KVEdbn?=
 =?us-ascii?Q?PQLeX9AG71BQehYxXgJpwkpRhaqEvcFUTj8X5gaR4dBT+jRbniL2n1dV97bJ?=
 =?us-ascii?Q?9hf5yYzNgs3oK0H7T1JxPOLHtOV6fFwTaPADbyf9hl2XmUe0239S3rovNtgJ?=
 =?us-ascii?Q?cyoU/4PqAn3TZtjflkp8hp5UCEV8+Z+UUiEirtOC+rH6OyudXYo3dxXnDa1O?=
 =?us-ascii?Q?bDpSRyh5HxbNApA=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3INpD1/ke9WD9Nav8SwjazYWASsz8ET4Qpl1klunIEyCBVkJ8bWQy27Ixgwd?=
 =?us-ascii?Q?O3+wVtLQCShxpPDroPvzMy0xEkUet79HHjx/H+zKjL36AUOplbcWRsxIjEzC?=
 =?us-ascii?Q?rC6H3A+/FykqGDEdbkxKJPW8bKKQfXRMElpMjfg/JxWEWBcsN1P+Q2oUNypB?=
 =?us-ascii?Q?uqU46WCUykS+K2GdR38ogdcIbaGUvYo73yk0o5KIrws2Y3hkrt/yn6YwllEC?=
 =?us-ascii?Q?b+9jjUDmDhBfgNwGLqVLjAw16HVRGrA71HvgC9QtEZDyeArjlhQcxmnM2o7T?=
 =?us-ascii?Q?3NQSL85Sbls4cIuGXq5b8wRmV9e8Xxe6bGi4uOYjM/psdiWCgrdG1B8DesZ6?=
 =?us-ascii?Q?bLhjetayoW1U32S0b/mfAbcVIfJ5cz6EjzY52QxnASWRuTgQ+hoah0VUMKOA?=
 =?us-ascii?Q?WaJXmDe3qExsSHHxB0ae3lsLJ5X/q7oWfPtQM5ykiXka81bskEmLK9tNDdYw?=
 =?us-ascii?Q?zrPv7qvPQLyqcbWCDtxDClisAKgckGWiJDVFk1jCGrZdnsQIopYxh/Z1DISO?=
 =?us-ascii?Q?5vVpnb3EuX7+RSxsIfNx9Pddb7n1mXLRfod5baYKGWVwONuQ6xtGBQg0IIrk?=
 =?us-ascii?Q?i+EjIiQUtFLj+KmiJIrVQgXifNTZcrKMMCe7zUA5wxqVQySeZtzm6GrDA3sT?=
 =?us-ascii?Q?/ThSZnfLWDSDNzpc4yDmDqNKWvI6L5ZNxHSx+J+Q7HbV1Hzx9qPV7Gm/kdOZ?=
 =?us-ascii?Q?66kSlZgcvEyx0/t8nV/XW7px3klOimcUcD9FamihFuJL1Sm/esJ0VdvTq+Do?=
 =?us-ascii?Q?GN+Chsh7fKY1+kQz+ztaFxVGDqYbrDfTz285mHxFqmGZ+UFpT5VxrhOID0Qg?=
 =?us-ascii?Q?ifSNsWjR4lrP3R6u+huz/v9Efg9FHpRJytxUdV6LpxVLrpOuKOi+AbHqCENJ?=
 =?us-ascii?Q?Hc1IdizG+NRWx5ldvv0wSzrmjkfCFz0DQxiwKq12IIQIyVm+nd3+YaE32I7+?=
 =?us-ascii?Q?D7K39rgVnkT8E8erN6C5KcIVYLbNLjwparmFGPQK6E0ynXECV21VEMHgSZFp?=
 =?us-ascii?Q?nQVg5Xkf/wpxx27ApRcZ/EJaQAuwgPRuNJv85SRxFMuGBp1Lw7L/aGC9a99b?=
 =?us-ascii?Q?AqH0iY2oAtQspFP5IjZz3vrcCwQ6QXhVncSwx88ChqG+yWrrlzAZ3Fv8af3v?=
 =?us-ascii?Q?+28UhUjdGpb5/U+WLzef3jMQWl3hL2uf9MWGAe6umhkOmzSYc8uYanLTlQjU?=
 =?us-ascii?Q?zogJHIzyiJzCuiS9dxgr6S/U/nJe0Fyluc0BHZew4fpxcQ2dxaXUSA1wRUNC?=
 =?us-ascii?Q?o++h7tuuTGtuqyYEQANRRFBo3dvfKN7BhN5uDy7qD9NxEIyeww1REEgRG4k5?=
 =?us-ascii?Q?oumRNoY0mk8yY8lvfH5NdhVHTOstFf/aOgir9bKDUn1ZZ9acdmQHjic3QDEL?=
 =?us-ascii?Q?yLMF50stEHUgOOU+1EVgcc3ZXutOgQn5fuDVCTnrwWjlCLjHlW73nQJJF8UF?=
 =?us-ascii?Q?1gmS1mW6BqBdXTHVchB9F11sJQXlxEkMRuLgvV6kv2LFvjHeqLO7uqQ7D/Nc?=
 =?us-ascii?Q?hxjgF6W4J8H5nGTJSf1vxgbOsIrvLyg6X/S7j3NzFE9DhOlIjkyno1GSd6T9?=
 =?us-ascii?Q?ujjuUFEHpTil06pprJhdMn14izgHP5kIAVEJfSbL?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8455.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ab79bf9-f53b-4e28-3afa-08dd87d79ff4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 11:10:32.7351
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R0i4tXEIH1JPoK4FRTYrE1N8+eowGjOk7gJzgWJOOs8/TlzKKNtCYD0akn6po0rMYtUVUsCfEOPrMbwIvtKIsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
X-OriginatorOrg: intel.com

>
>On Wed, Apr 30, 2025 at 10:15:05AM +0800, Zhiquan Li wrote:
>>
>> On 2025/4/29 22:50, Dave Hansen wrote:
>> > On 4/29/25 07:31, Jun Miao wrote:
>> >> REDUCE_VE can only be enabled if x2APIC_ID has been properly
>> >> configured with unique values for each VCPU.  Check if VMM has
>> >> provided an activated topology configuration first as it is the
>> >> prerequisite of REDUCE_VE and ENUM_TOPOLOGY, so move it to
>> >> reduce_unnecessary_ve().  The function
>> >> enable_cpu_topology_enumeration() was very little and can be
>> >> integrated into reduce_unnecessary_ve().
>> >
>> > Isn't this just working around VMM bugs? Shouldn't we just panic as
>> > quickly as possible so the VMM config gets fixed rather than adding kl=
udges?
>>
>>
>> Now failed to virtualize these two cases will cause TD VM regression
>> vs legacy VM.  Do you mean the panic will just for the #VE caused by
>> CPUID leaf 0x2? Or both (+ VMM not configure topology) will panic?
>>
>> Currently the most customer's complaints come from the CPUID leaf 0x2
>> not virtualization, and most of access come from user space.  Is it
>> appropriate for such behavior directly cause a guest kernel panic?
>
>The appropriate behavior would be to fix VMM to configure APIC IDs correct=
ly and
>use TDX module that supports REDUCE_VE.
>

Yes, I completely agree with your point to fix VMM APIC IDs.
The idea here is only to avoid this panic by using the guest component even=
 when the host is incomplete.
And thereby improving the robustness of the kernel code. Moreover, even if =
the VMM becomes complete later, the adjusted logic will continue to adapt s=
till. (^v^)=20

--- Jun Miao
>--
>  Kiryl Shutsemau / Kirill A. Shutemov
