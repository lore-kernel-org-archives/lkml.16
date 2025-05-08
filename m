Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C2D1BEF7D
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697777; cv=fail; b=kYEgdw6PdKxhUbN2pIo+iqE4OYMVdefBLkqmXO3HOeSE97bZmM5z15SXXMMJaKNmULA0oLlrj9GBDl4gyiebLKjeo/f7jLJfXEhqzCRMcvGMybvEALUG9Ab6828aoD7OxkuYn+7eA8cn0ipClasEIAI6L24INMXGUdwU1XsAMgA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697777; c=relaxed/simple;
	bh=gMcb3g+dvIT2dhymXcRpbwy/vpiNCn+FRnYtlnebXTM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=IgucNoovriM+R/9vXo+DSOIu+vs2IjLzY6EIiOSmttThQ5Ddx4UbJvlMQ0jC2x0c+xUcnNxY9+QTNjdVQWenvV+AEA2bn49etxNsPZ11W1Rx/w0JJxsGet3/GbE9nzpQwxBiJqU/hxBCRCyycKLVwe0o1S9PBVBr++eUwJC4eLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFJhPINu; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFJhPINu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746697775; x=1778233775;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gMcb3g+dvIT2dhymXcRpbwy/vpiNCn+FRnYtlnebXTM=;
  b=nFJhPINuI9AGtnmS+AUsQPHGjdGZVnLmiQhSoEDnGSTKFnARo77Y7ZmP
   dE+JyYWWTZcj5V4U1Y96rGC/BhCKOI44jYpwNCCpdAXgJ37lSDWy7i2lk
   5DkF2UsiMYJ5YJJxrKmUXJE8tW+3b1JrfKgrqju9vuolFFFElJntYT1nE
   a/Oxauo//oj/I8lzjiw+syaoCDZ4gbjVOGSheSXESZ+voUhWJxJiWm3xM
   M7OxDgfUKkZJeSIfv+JWqVVzuH0eO22IuEhOzGnbXIzkcLV1PWmYUa4O1
   p9PSpU/hxTaHfDE9sVtdic0MeVygmwPyjOrz8EFyWmfO1Pzj1X+SQJIFT
   g==;
X-CSE-ConnectionGUID: fy4RBPphRA29iwUF3m/QnA==
X-CSE-MsgGUID: YnM1ycj3Tva4TBAHaXBpcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="51130967"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="51130967"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 02:49:34 -0700
X-CSE-ConnectionGUID: SsqXl/klT8KH0wpI6bZGTQ==
X-CSE-MsgGUID: JtbDA6HcR5qGnFo4aqn4DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="137178061"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 02:49:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 8 May 2025 02:49:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 8 May 2025 02:49:33 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 8 May 2025 02:49:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIl/GjTEoQCCfPuJIN3UnJ9LYziKyxKaOK0zTA2W6v5+rSJLOa72t+ZlHBV1nvySrNgkhRwJE061zNQwEcZmD+AOt4vBbw2/wKuPxepwIhgnbXDIeVfPd+zrzs6ijZ/kR7xYS4k7neqgbBm7CJF610USFQG7YuxH0eAKamXz9bpYbQLyTPzAt/u6xGtOtmri2ngeq6WVil3GfqmmF2JOVPeNIC3oZj+WYZkkSks4P+24WjWa9d/M69Q7XVHhylPTe0n/V4BfjHIZzlTvikCqzd0gCHRXZsWvjjA86SUcCRAlTMOGO+Ys/iVJrEkNVYmdAJvMQxZ2HK9QZlMr+irFyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUyeWq0ZBGUfHAAqKFZQlXwz819exs8LwbQMbBLDnfU=;
 b=p6UcfqglRlTdzcaSL2yi0GilGuMc1M7ZiSuu4FhkLf4UL3W2n87ANSDWuDg1/uBXutjBLkXN8OfQi5h23XmAutbrp4izuT5/sa3DWlXsIEScUGwIaqrM5Z+lNDCncHQFF668ifjXvvAYx1ysKjKlQhCx3PSgnK1Ex1B+tl89xAbnq7ltx9E+k8666SgrOlNuPQ/ikiCOnM02N7KKbuxupiGjIBh/3mAtwFcQEHVh79oKN5vJZaJMOIQ5hAfljf/UvOkNt7q5Egle1rqnJvtxLDeMUMbAdy1xJ9nns8Z+Hyqkt2R04IFBsK6dTcYraiSyuuLVpFB7xI8RH1WhEL8e5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB8455.namprd11.prod.outlook.com (2603:10b6:510:30d::11)
 by SA1PR11MB7014.namprd11.prod.outlook.com (2603:10b6:806:2b9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Thu, 8 May
 2025 09:49:17 +0000
Received: from PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f]) by PH7PR11MB8455.namprd11.prod.outlook.com
 ([fe80::e4c5:6a15:8e35:634f%7]) with mapi id 15.20.8722.020; Thu, 8 May 2025
 09:49:17 +0000
From: "Miao, Jun" <jun.miao@intel.com>
To: "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com"
	<mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>
CC: "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "Du, Fan" <fan.du@intel.com>, "Miao, Jun"
	<jun.miao@intel.com>
Subject: RE: [PATCH] swiotlb: add a SWIOTLB_ANY flag to lift restricted low
 memory for encryption
Thread-Topic: [PATCH] swiotlb: add a SWIOTLB_ANY flag to lift restricted low
 memory for encryption
Thread-Index: AQHbuOTWdrEKnGPxJE6Q3zSq9JGok7PIiZGA
Date: Thu, 8 May 2025 09:49:17 +0000
Message-ID: <PH7PR11MB8455D6D3B5D3ECAEB73F9F1A9A8BA@PH7PR11MB8455.namprd11.prod.outlook.com>
References: <20250429165330.2644155-1-jun.miao@intel.com>
In-Reply-To: <20250429165330.2644155-1-jun.miao@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB8455:EE_|SA1PR11MB7014:EE_
x-ms-office365-filtering-correlation-id: 7d90e796-39cd-41e1-81de-08dd8e159923
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?yhn/xtifp/osRKZ0AKkueEgHdiZu2pzwCOwfd/dS2Ar3OGyCIuSPTsbsUe+l?=
 =?us-ascii?Q?VFNtLsPnK5XxB9TciybLDFy6YvzaHctil+zjneZ9uUCzgRT62ndkzHlG3bYT?=
 =?us-ascii?Q?i7wP5sBKbXaJW25SAfKljOjuDGhfGjfPdDwzE2Hu9mwDNnKkD8fbjv5fXCWt?=
 =?us-ascii?Q?B+bdIuBxNeJguCuUaTzcciTarg3cjE52l61Yo59wXG8kazZR5Qbmrp2bDRjV?=
 =?us-ascii?Q?DU2OickMgC79DCb98TmyCsB9+j1VuXAKmmv56z234VVv5ctAYrA+bfh0AoPt?=
 =?us-ascii?Q?wGsKiU+wJ3Favml+l2Vlm27VdKGw6atHOpzsp5E2czD7EncAKSHliHdtxP0E?=
 =?us-ascii?Q?zmqVDgte+GzgpLgtJX6E4Slb5/oaPwC/evomNAoZEiDLE3ZSNvG+9gqh8slA?=
 =?us-ascii?Q?ZWe9P4lqIh1IQ/0pABEcj7eZB+CCUh1u46FLJHMhVrwwXHECzmh+eFXKEYlz?=
 =?us-ascii?Q?jRtICRNlEzJIbrNOeLiajRHyf9hUbGloztgNjNsSuvxBmWXuHnl64rrXNHsm?=
 =?us-ascii?Q?0XrbMBpEwdeevtCYya4BuHC4pNXCO6fDtFDH5bHVuC30AU5oXcJDv37lrfm/?=
 =?us-ascii?Q?WObghjA/TtqTBnl7LgIJ0lPS6jIjwBCSlFajW+RujzVXmuL3A93O/vPRYlV4?=
 =?us-ascii?Q?/L4ZIK1py+q0zM80EylGO9mKTwgpD7G9D1J9EkbgWZeJ/zIxXQGnmqFyittX?=
 =?us-ascii?Q?LZtJcUgLre7wzb7bQqPVg3uwFVOI7q1jKPZibDhF1yMOGoOx0L9zoQ4SGR1K?=
 =?us-ascii?Q?6fUUoSsyZJjaindTCXton4cvb2zCDvGTf/H6NTe8zI44Knx1dgQfp7sEJYdS?=
 =?us-ascii?Q?iv+RMEvg02VgIQgodOowl9d60E4aTj2alQtHazLmKEEXXUFT5gc+QmKXF0am?=
 =?us-ascii?Q?ATKGmq0WbSThbpk1JtpsKMjXOi95XXzwdqZeYt4DhHEK9dqqEtI8cwoa2Kdc?=
 =?us-ascii?Q?RPPkqZwlJ6zLT6xfik9J8oKOnR77aZNVG6Dnh+cRZNydt2UwqTCu4JS+sFLb?=
 =?us-ascii?Q?7AZH9Tf8dzuDV9xTa/wJp5MgSHwkmSGhJ7OKlXTKY9V2kCKweESHKnB0H6HH?=
 =?us-ascii?Q?2VXmylyGVZHM5NGGqOigHxTP1BRlnGhTRHB8US4ON6cHtsL9mYPwgNKRCjDg?=
 =?us-ascii?Q?dUdihJx1g3Y2ma8sduMqaFcpbSRJGnYo1XL300dLu9CDs8j/LRHHRmK0tZkq?=
 =?us-ascii?Q?5f9SqFsx/aPNMXLGgQyIeRvlRyRUXzTce/o9aHJGM8mtD1HHGfS73nFmz/yc?=
 =?us-ascii?Q?NnhVBeB6ILkoEWH13PdJCTTx0kvqACTtgp6dnBqBHuo8xsLuTcQN/Tve9+cV?=
 =?us-ascii?Q?psZWxXTEbI3iqUcrHE0kSNSMqtdRJOhKkv23x1OYaVBQ+jmkSjC4BHPkiRcF?=
 =?us-ascii?Q?gSTbma2lYSDEbIii3rug/RHKkK09QoIBYU0CZ9Nb+Ske+EAR4HxN3fCOM5IR?=
 =?us-ascii?Q?JBn0NJ5JrRoO+4XtTpR6aO/51yV7gxkPWL70Gil1AYEDEGlGrgfQnJqlyZfi?=
 =?us-ascii?Q?EEf68uojbH+QqQ4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB8455.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ueh8GEabdZNLiYwWzxZRkmje1fl0fEY6p4RQj5lTsFP4hNaF57LomZ+h5Qsu?=
 =?us-ascii?Q?oZsADt++kENG88v2ZacADs/SJs61AEcX4FpZNXS1sKSihWPlOkn8qQko5L4g?=
 =?us-ascii?Q?9WUDnRgYKlZ50B+sa9NIWBdAQI5jITuTD1vLV2XphRetd52zrhripDwC1ZSs?=
 =?us-ascii?Q?8pHQDk3ZImdli8zszDv/i5K+ss+ZlW+lR9c2w68UVp3Th3++UfDTHRNFwKmD?=
 =?us-ascii?Q?8Wrc/4sTi2X7UNN8e2TOpicSQ2+ijSd3+HfOfpdqV5BYlkKgf47fvxDBQ1sN?=
 =?us-ascii?Q?oG30pOL9oR16KMfThJquaMrD9PQwp4GF7/2cteUHpQz/l9maqhWd+mAnBawp?=
 =?us-ascii?Q?n7qL/czofBq9lcyMmNtqR6ccXS83lgSZS9RU8cSOm1r/X9ERBfODONMmtTby?=
 =?us-ascii?Q?JhYXU6Sw2yfdrCWBy49LO5q9lykEIDyHkcRB3ajHR8Yh+cnF7dVwqI+faSIX?=
 =?us-ascii?Q?oRG13PxBcj3zSBy6aV+xXWQI3uMLyjnZeke4Xt05w1zlekuIlJbayl8xtZ7F?=
 =?us-ascii?Q?EYXAN9D+gZWuGQM+AZyO9fj0WnTe3BsVAzpf8U1pQBU8TTtWh6bT+gLRcR2r?=
 =?us-ascii?Q?Ac4e6U5eQiul2ZGiYN/Qn6TAQNKMz4jLyAPEZyD37mU3F90eemo0jeylHvss?=
 =?us-ascii?Q?VtJIb+5VGMTUIZXMt+gsNALDDDs+Xthd8g1fLA1Ol3jec+HHn4eiT36MqgC1?=
 =?us-ascii?Q?K5LHZYXX+xAcPyNhODXp3Q3TJFen0Y0iTAyy5cpjyPn8XZNxuqGZCjAbGxWL?=
 =?us-ascii?Q?hB9IMEWj7/fcN7K27LkfSlbBP94wL6R4cBOaInXRkFuxZJ63Y4XcoOvRuLwl?=
 =?us-ascii?Q?cPIk79iiPkg4Ada875AlcbhXNvpPyLwAXFz2RanTvAz53a3PtS0OuutqaXH/?=
 =?us-ascii?Q?tlTrSOVuecc2AACI9bhFHkxqr1Vlhsn6LX9x2ymGVQRNcHMMU7CDRinvHsoM?=
 =?us-ascii?Q?Q2DvJhc3pTxMHoXrIuEaFUjFQG81m7WAe+wtvKlhw6c8MxQFaZCiEE85No/S?=
 =?us-ascii?Q?MQ5K5q1US9eV1eGetDTePSuzHZy3I8aGb8PNsaK1sFJlq7fwn84MHG0kcKQo?=
 =?us-ascii?Q?EdcsoRn8UlvMvkM7qF8S++Uea1VKGB6Fdv7z/WIcd3GrhneMRJTbJGzzz7LN?=
 =?us-ascii?Q?I1j+ZiAbZ5qlQaAIbxB3vrdvhXZSssWZaDe8AIufyEfsHp/2XxkhnNQf4iel?=
 =?us-ascii?Q?rjTu6IEUMMp4uubl7usw4vP/LR7kIm9aXgQt58XYJACDTqV+mYCbzavxTO9G?=
 =?us-ascii?Q?Y9ko/euNzcyOMca1m1gLL/r3AxjQ0H68UugE36DWeuhwEP7SVUryiaCYdtdx?=
 =?us-ascii?Q?xg7qdY3NL+0oG6/mLooWRy38NngIQUe12Ro9EWr4weZy/WSt7Te2weQx6mol?=
 =?us-ascii?Q?epHiNLh9WjLCkPe0RmM5bKv9+vdPvDZUUAe/s9247zSkZYEbsknA1Cvb+f7J?=
 =?us-ascii?Q?KGnb0D65JcZtR+a6RZbYAv1wNPHrSXYZWqrTPK+96xjTTkVKG5J6s45WzGf+?=
 =?us-ascii?Q?ZN3LHu/4P+ZYImk22+5iPJZ2a8vu03aynhzRsujFnk6cUBZmQtoVL7g+jhbC?=
 =?us-ascii?Q?CyAP7mvUXjJFpa0iBklhpm7L9XGoQoN9m8kU7221?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d90e796-39cd-41e1-81de-08dd8e159923
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2025 09:49:17.0769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OfBkKN1wAlQQwaPvlAnRuOLmpVRzIlhF5vHq/ds3DV4jGhZTnMqG+FAHsWHakv3+NdTaQZHrc5gGi3piBzBaTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7014
X-OriginatorOrg: intel.com

Hi maintainers and Big shot,
I would like to further explain my original intention:
The purpose is to solve the problem found by customers when inserting 8 NVM=
e disks - There will be a swiotlb buffer full warning.=20
When CONFIG_SWIOTLB_DYNAMIC is turned on, it is impossible to allocate more=
 than 2G swiotlb buffer to meet the actual high throughput usage requiremen=
ts.=20

Warm regards
Jun Miao
>
>TDX guest wants to allocate a swiotlb buffer that is not restricted to low=
 memory
>for the trusted hypervisor scheme. So that allow to pick a location everyw=
here for
>hypervisors with guest memory encryption in
>swiotlb_memblock_alloc() interface by adding a new flag.
>
>Signed-off-by: Jun Miao <jun.miao@intel.com>
>---
> arch/x86/kernel/pci-dma.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c index
>6267363e0189..73b9320c4a7d 100644
>--- a/arch/x86/kernel/pci-dma.c
>+++ b/arch/x86/kernel/pci-dma.c
>@@ -61,7 +61,7 @@ static void __init pci_swiotlb_detect(void)
> 	 */
> 	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
> 		x86_swiotlb_enable =3D true;
>-		x86_swiotlb_flags |=3D SWIOTLB_FORCE;
>+		x86_swiotlb_flags |=3D SWIOTLB_ANY | SWIOTLB_FORCE;
> 	}
> }
> #else
>--
>2.43.0

