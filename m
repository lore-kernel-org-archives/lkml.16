Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8459207E13
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 02:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738724170; cv=fail; b=gyJtSEbfoCu6gJ3p4j4Gcvo1d9KZD9KtNX1FcGB1hMULdhRea5J+Fb81J19RVyvHwWSIaPken0q2uyhX3q2Hwmx+0mCWxhxz8pDcfutLcn1qBQINznGP1ehrQDl642UHV8eVyMtju31AlYEI/MZW02k/WXlE07lPLHbGtwflFHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738724170; c=relaxed/simple;
	bh=JQBx53Any9IHOSx/5fbgrBLhe8RiHszmD0yJkqgeij4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=B1QwmO552j1bYcYCCtHOwzEK4h5/f9z3cjM2UCmypSeeATefYiy4J6uORwRcn9kkE3N77u9SYD22f3Wf+cyqIVoEVB434an4OqwyIlnPJTGLs3triRYaDDUM5d1RTWC+zLF84lvJYPONaK3MTCZ9wvqrrn7OMrbcLx2HoblP3GE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kOnLxMTI; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kOnLxMTI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738724169; x=1770260169;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=JQBx53Any9IHOSx/5fbgrBLhe8RiHszmD0yJkqgeij4=;
  b=kOnLxMTI3wi3oA/nFOn4jQkD6LXRIB3nj7ed81bSrpKR3X7jSlNGKaOQ
   6ZZJjqMKxBJQVTXej3z2dJBA5lzyzgHhYXYvusofiinJDaHr8gMkYc87d
   0IPLO553wINb8bThQhPYfAaug38tAFgKSyLjnHwwuMhc8aSPwXkiEcjpE
   HnAXze9CYIyxFiCQ2Cm8Exl5pHityvjt5TT+ld0mGpXPRjQI8vB8LP/nb
   WP9LEMD38+SHWk+oIQGNwPQiOhrx8kjTK9xGTbtJq+GSBqmZJiwdmFQbq
   8wcTfl+cXVm17f1XremQdAGwgrbAA4yoXXQfxOOnPnYOW6BaGBFtdiEG/
   A==;
X-CSE-ConnectionGUID: bT1RZ86gSf+qdnBBZOMPmw==
X-CSE-MsgGUID: fLl1ZDq/SG6/7DczTU2qNQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39383135"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39383135"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 18:56:09 -0800
X-CSE-ConnectionGUID: vV6LwFTwTjSxvlBAQ8mOJw==
X-CSE-MsgGUID: CFpSlLg6QmqN65t01pYStQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111219956"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Feb 2025 18:56:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 4 Feb 2025 18:56:07 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 4 Feb 2025 18:56:07 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 4 Feb 2025 18:56:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C7Lg1+YZASX0g7pi7fjcYah+Hujoz/XCxE91kcNwZo2VCX5HoGLoHEGOXnUPZxxKM5egqYfDwIUQfPfsIv4Bj63MLZr7gOXE50Jgu2BQgHLyTDMMTknFxllxzdz+t6Sq09ras7jrUAg3XVzQfh87310tI1gelAaTDWSo5oiEpJuf2iTV/Umbr/Hyk5+bLeNv5mubC6UxcvtBiGK658qWOIxcudiYRZfL+uPNreSEyqYnWNF//CR5GQ7ndrO7aRxGR0/Gfe21Psn6uF7MevA7LfYZv0xvaNXN5TtBQPQFlIpi4cxcWmowApWFH4VLBDdIU97nmON5iS+IIOj2YMSdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v1If731RjRXv/vpZVPgQv545jZxmf6n8YkfNl688d8I=;
 b=Tf0fnhQyjfuZosswU/LO6gO4M7dV/e3VPM3R50HEBzqGH4APrP30D0iU/bQzWXb3zyxqnggkoEEUDl7zjes/vyVd3YtgdjFDd5j5XpQKqiQhQqUmMczq1PU1VCDn2cu2FGmtfIv58d+iVhZHbqSTU38hbWNO+FzHYTzemnWoOIMVCmWYOtLwCBSnFd/0Trr2rs67j7WBsgFGbBOSd1maM9xYo09UsS14zgkJZDZCpx19b16K3sYiTa7Iv00T/ahfz7eanFePIZSg2GP8gQuiU3EqFO/Pd7hqIpFx2qAHTlfvYBdN73vDICwr1AR/x65gemcNLk/WnF1EamfTT6A0EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by DS0PR11MB7264.namprd11.prod.outlook.com (2603:10b6:8:13b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.10; Wed, 5 Feb
 2025 02:56:05 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 02:56:05 +0000
From: "Xu, Even" <even.xu@intel.com>
To: David Laight <david.laight.linux@gmail.com>, lkp <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jiri Kosina
	<jikos@kernel.org>, "Sun, Xinpeng" <xinpeng.sun@intel.com>, "Srinivas
 Pandruvada" <srinivas.pandruvada@linux.intel.com>, Mark Pearson
	<mpearson-lenovo@squebb.ca>
Subject: RE: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Thread-Topic: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38:
 sparse: sparse: dubious: !x | !y
Thread-Index: AQHbclaGAK4opE2b9UeNi8wuYQCRp7MuU6qAgAm5uxA=
Date: Wed, 5 Feb 2025 02:56:05 +0000
Message-ID: <IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
 <20250129222141.478c03df@pumpkin>
In-Reply-To: <20250129222141.478c03df@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|DS0PR11MB7264:EE_
x-ms-office365-filtering-correlation-id: cee6afe2-c851-4e3c-c321-08dd4590a22e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018|13003099007;
x-microsoft-antispam-message-info: =?us-ascii?Q?JOF7gPEasMwkOZ2sdPvkTphNAm2lmQnLtLBSQHOVrg0tbsJzRb8FPtHMvcnR?=
 =?us-ascii?Q?4U2y14MNiTVVI9GdQgQ+ivgALhb2uyAd9iPTOE4J/pLCaSmuPV22YI7qL+Yf?=
 =?us-ascii?Q?ELCem8JcsqVPJ85rLEJY2nkTIWsCBibZZCxVZeb7S0ivq7j7RQJTyAbKqDaU?=
 =?us-ascii?Q?0J1iSjOvvsn4lsFyqY/mXIN3xGmapTXAzfJXghGtXTD952yI1cunBxA8vmrO?=
 =?us-ascii?Q?2/Q2OPXagoAMWMn9z6KVIA1yp7sE66VvrS+1Hhs1TgNZx2leFh9w4pIYVWex?=
 =?us-ascii?Q?kE9lb1aGx5nbYdmmFp2ZxDvrB76XKNd/U1Zb/d5Wa48hbakiWj6WDmXmFM1g?=
 =?us-ascii?Q?C/Gjq5e/PYOR/ZXSe2C90/e6pbeZ+hrJMR0FppBZn4x8CmYptsM8LKbXGMhf?=
 =?us-ascii?Q?6lZ4OJtCkD7Rw3Ju0SELW/bTQiCdtx6xjwUwtboSYrGsbg6ENMZjrC+JebDW?=
 =?us-ascii?Q?KxoTPlF81+83BAqj3hIfjdSz3ZxqhVXSdrPVyFdQ/uwg+eai2QatoAkV/fKS?=
 =?us-ascii?Q?7XLr3OBP0shF6y6IIpKPy4VpBILQEIRVK7agZekayAzfCMZFKkFcQeuQtoII?=
 =?us-ascii?Q?PrZ3HgmHd3J3/CAkU3YMB0bzx/5j3oBwIls2yDEQfB7K/ivWsXVGaaB9L0nS?=
 =?us-ascii?Q?rHMVdEu74Rekj5Z/qVc8sXz+CqiGHG1w/g1ZG6VjohuIWg8EtTcmY/mP3sRj?=
 =?us-ascii?Q?GYki3Ro7I6+qctWINYpKzYJJlZNTHofWcgwzeGQcHMajbQxCfS/tuUH3m7kz?=
 =?us-ascii?Q?sh/E6tXlIl8HA+Ho6+dQH2yG+EI6xwyu3zrzupUZxpDQavImlSvYWBcqgE3h?=
 =?us-ascii?Q?z2LsJ2MCQgtUPlyK/uYlcy4phyYSRJIat4/R7kRStQWPS4CQsIHnDLx2SAng?=
 =?us-ascii?Q?ykSknX/6ALE/YNGBHZ4bsfo7AlCLQxmt9Ib/uhvtbabTytLkqpFdVR7XeCH/?=
 =?us-ascii?Q?o8ZD3lRZvjXEyO3c4rLlYi6SQciO3pPfddHRaJcn5sakDMfFHM9ba1R5o5x1?=
 =?us-ascii?Q?GsSCoI1XUzGJ6mfriVOJNdDHNr6iuqghZ4y7UIHFZUZshokQjd/ajCOE35N4?=
 =?us-ascii?Q?kCA/AE54I/e6hZl/hjRJ4cCKKROkjH5rhWZKFvMK9ldfSuOAgnlmXc0Px+w8?=
 =?us-ascii?Q?Sq8rRXYI0CEW2BeS0aExxxXi3G1XPIB9a07aSMyfUpAUbTOtl7hnMlaBYxoi?=
 =?us-ascii?Q?OCHAYkWC1tiwKMoSpEoCzs1mxf2tn2rPxamcOPvLj1vn248ad6F0WQAGER0n?=
 =?us-ascii?Q?TybIO7Ls5vRoZYtgyIPPdoDL0XCTdBqHbjiy4ohfHUWjsZo+N2kdkBgnba1Z?=
 =?us-ascii?Q?QradeXG7W3DXjxqjOa6y1PwbOPXXcRsYE+PxD7I937SHPGNWksqRuF7ETY3u?=
 =?us-ascii?Q?4tThCV6uE9G5WHl3B8bcCM6c14ugjbHNa4LktbV99461n95HbQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y2/T3sJ62gGN/y9hGZ0BMnni/nkQLHRGGEXldq9zZY7vsQKrzsvfzMc7deRL?=
 =?us-ascii?Q?Paqmu7rhGZQWgEriS1karKHn4qhyW9rdRDDYJcnI/76dCkhbMLdzYAQJTCPm?=
 =?us-ascii?Q?RL++QhwPkZBiKtNwGTUh3jGHld73EswyDJhnCuJdrTsSNLt4VKoeCSollLdr?=
 =?us-ascii?Q?OC643ubHU99+osEd4sULLeTnlnl4xr9EOwgDLkGrCpPqUBB1RIOIH/Jw1LZx?=
 =?us-ascii?Q?fgxbvU0DpiQQh6o8UpXbXVvwnLucgxymiXQgzbjICRSmyD2+p1NKsLhknRPw?=
 =?us-ascii?Q?1v0n341/vzg6doXtC0cuFE+M3nPbvZU06X83s6s48ELJRlK4TvNiAJhYPtIw?=
 =?us-ascii?Q?QSwsneoDXJ2L5r+oT81xE4rRs3Z0yAJhpoOLkXsyZ+7wmIpzp+V8BmN84tvC?=
 =?us-ascii?Q?XYqSRSnU2LVxDT85ekco6+NNeo3PDOSrPqkq/koXVCwgOKyEzjyMqvUCOBAJ?=
 =?us-ascii?Q?YcueoiJKwN0eX9onT1oKehOv1jYXpdY1/oZXeO1dII00FA/CLYuoAnFHwaMW?=
 =?us-ascii?Q?Iyw/v8J7jGJH+IInklfFk5zg2N6M6YzEwIakBy1Rg6SYio2/maYp4AgocsLp?=
 =?us-ascii?Q?quvU35xOXeK5LYN+OmmagKsxlBANC7CiDQdD1EAoJctnWIqBOWl1uNqsUeeW?=
 =?us-ascii?Q?eWL4qITZyU5u3i3HSISf1JwLRSWYmOpFGRwb/oAHUvsFWM+i7rbBttQLGcR3?=
 =?us-ascii?Q?m5A1aUY98OPHtWo0vEwp5shnwa8gn82kzdOoSFaF7QDP5V3yallFgJnncw2r?=
 =?us-ascii?Q?dH/nzqZ0yADKzrXQiLL8k/La+L9NZ0PVvlJ+lvqZWr0HjNGWRRTc4b3k5tIL?=
 =?us-ascii?Q?1udQOVl13rBmo6WmC9GH13V0LKo2On938HoEx1bJ/QOnMBfK51cc9SkaWD2q?=
 =?us-ascii?Q?QflbVuw2UU++j22kQXju4k+wNt+iX3Wg1XFsHvXXO2djJ5SxYr8We0l/1esX?=
 =?us-ascii?Q?5+m7161Lu+i8CFQsT7iQHHZi4Pq78ftwNGY88zziX58Hn3Dgm05uiJjgXQn0?=
 =?us-ascii?Q?FKvTRtHnr3e5xzc1abFtBRECK4Xa4U7VyQ2Q31HCUw0K6mrdKrxFaYrEEKDf?=
 =?us-ascii?Q?QAR3jwyo1JdqHWayi8jGEkdJKlzC6YqkqsP/Ln6ZO/KuwqN31w36i7tZRoYA?=
 =?us-ascii?Q?41ro7ZKAj1Bgr8DyVbv8OmGMNJESGnTONCcgbFCAK6FWB3u0JoYld0AHrOWM?=
 =?us-ascii?Q?bkPZ6JHw69/DhzJEC8qcRL1NEAtmMLmG59lDu+XtnhxfCycNvyTmUYL5mrcn?=
 =?us-ascii?Q?2Np0iRYef6NHlrKtLvoqBvMZzyLP/g+ZNXlRRI2htJSt463Vu47PKbhZlLK+?=
 =?us-ascii?Q?XPaXEyiGk75ZZj8VLLox2tCTbr/ioq23O5buoY4K9NnVK1KSN3zCVmwZbAe8?=
 =?us-ascii?Q?DRR1EHe27Z3fJf1APktAjhPg3nrWvbfgNUmBGS9am1U669boW0UVuKQcYP8B?=
 =?us-ascii?Q?eh5XZf0of0Hvub+VKLngU7aLqgThL1/iIMfJnLCfX1Uwx76IaCehv1qchDFR?=
 =?us-ascii?Q?Fyp7OM58H1GWMwq0U2lOR+omAqkaWLIKlbyUHUXV/ecNDFPiCxOkz6+30+pI?=
 =?us-ascii?Q?9a6hhZ4mi/SYaVW5dwc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cee6afe2-c851-4e3c-c321-08dd4590a22e
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Feb 2025 02:56:05.4846
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8dhpHyUaZ6Zhl6BjHNyuAPNbPQIT04k4wTBVEa3tkwy2XOmaoVS55EQ8G3lug2jeFMiHvS1ky1mL/6AtdDvG9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7264
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: David Laight <david.laight.linux@gmail.com>
> Sent: Thursday, January 30, 2025 6:22 AM
> To: lkp <lkp@intel.com>
> Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> <xinpeng.sun@intel.com>; Srinivas Pandruvada
> <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> lenovo@squebb.ca>
> Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: =
sparse:
> sparse: dubious: !x | !y
>=20
> On Wed, 29 Jan 2025 22:02:59 +0800
> kernel test robot <lkp@intel.com> wrote:
>=20
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git master
> > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc-hid:
> intel-thc: Add THC DMA interfaces
> > date:   3 weeks ago
> > config: x86_64-allyesconfig
> > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > r-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is a W=3D1
> > build):
> > (https://download.01.org/0day-ci/archive/20250129/202501292144.eFDq4ov
> > r-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new
> > version of the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-lkp@inte
> > | l.com/
> >
> > sparse warnings: (new ones prefixed by >>)
> > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: sparse:
> > >> sparse: dubious: !x | !y
> >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note: in includ=
ed file
> (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h,=
 ...):
> >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison a=
lways
> evaluates to false
> >    include/linux/page-flags.h:237:46: sparse: sparse: self-comparison
> > always evaluates to false
> >
> > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> ...
> >    297		for (i =3D 0; i < config->prd_tbl_num; i++) {
> >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])
> >    299				continue;
> ...
>=20
> If zeros are unlikely the bit-wise 'or' is pretty likely to generate bett=
er code than a
> logical 'or'.
>=20
> 	David

Good suggestion!
So the code can be optimized to:
	for (i =3D 0; i < config->prd_tbl_num; i++) {
	         if (config->sgls[i] && config->sgls_nent[i]) {
                                    ......
                       }
	}

Will create a patch for this.

Best Regards,
Even Xu

