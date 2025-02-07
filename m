Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2351AB6C8
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908739; cv=fail; b=VLxu2412Tx5FlcObQJtWKCeNxyN4PGEULzBpapZWGrmUyUbsMZuoNGlQpCS9lWTNh6fiDzsfy/8j5fTTSGFGP5LwgoH5wHkk64Rfv++gdFWrdkA4Rmj26RxxT3ZzKpDNmgR+2veaPMp1KWRQmTRpNxvh1QMkblSGxegx1oA2boQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908739; c=relaxed/simple;
	bh=IVtzCthWAXaaCHL/LldHf1k6NadfoW5cnfoNHkMxbik=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JCsoAxvG6YChStmY/R6PxIC4adZWtz+wvkroZof9yaoFi5jGOxYhKo7TiGe4C+f+fyK0mnhf3I9yms9r+nSNfpyB4K+kDUhqCY4uo5LPxTZWPwITp92UuVgVCQthHRzXtkBselleIEwiDOCzZmxmjjBk/zWOTgGd/XIOyXxDrn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3ta8na6; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3ta8na6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738908738; x=1770444738;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IVtzCthWAXaaCHL/LldHf1k6NadfoW5cnfoNHkMxbik=;
  b=G3ta8na6FZ3xInyaFYQn6Pm2iNZds0RJsQneWgjhOSzMdWidThJP+8br
   AVhtE06Mf3mGjPFratyN5N4UH1YSfpyyeZJ4hz45I6T9IQ2YTiO5D/GqK
   mrJPnr06AzasbrGuwRrr6GkwuR4nFeUS9esKvVCPcJ363soT3S0WevX3F
   p9KKOlFDqyddqLWwENI5NLIKGCl3RShcsflYGBC5AXrsPbVYepcGdCwPI
   ArcacrYX7Kff322O5GYnifqRBgcNRXP0+4wwEpsdUs1MjKKKnnE1A7Hxd
   jgzhR0VhKxjTvtx4QAf17Bchl0rxFLSEkmnsyWoRPlN+VzG3/9EelxZpc
   A==;
X-CSE-ConnectionGUID: gCApuH/tQ52aI43MeXgqYQ==
X-CSE-MsgGUID: 1qCBwU4sStyGrPLf6vNyJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39414986"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39414986"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 22:12:17 -0800
X-CSE-ConnectionGUID: wIxeZXX0SjG+oTuos1Pndg==
X-CSE-MsgGUID: YBDMyP16QwmnziadHCPApg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111287611"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Feb 2025 22:12:16 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Feb 2025 22:12:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 6 Feb 2025 22:12:16 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Feb 2025 22:12:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iheS7YO/DEWG0K07W74MWWzgRg0Y8+JDy7ELmS5tuD0U2mI3ee3M1EwWMOSzjl9gEV3fP6NRZY6z94RXixeSRmZM44o6sMaC/pCAENz2J0pZvYNqZKb0F/8OUIhPXs8hiQpY1jEn5QjA8CpqZ5XsQft4M6VftXuAkhwXPcyH9sDToL6FGBvehtSS/tcxPBMI8BAaj80ECG/1UUFceqzYO6S3k7nSn/0dn/l8SgNM4mFqjsnGaHUvFFinlGFw0dmMnhXQfgVWSjvsghTZJTSUEfFy9Lek9I/IsF8ptbiGRjnBxdAUQVp4Jo7AFlcY+Dlk5+prqK9BQ/36GtHJMaQbwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c45L9PycYpae85Le9jkZhrCWWS4rN6LfOkB7LB2EEAE=;
 b=W1fRgZeg1dgjeMxLxuCMRPgspK/+R+SCS5mKzxDharW0NF7qN0exL735V+kK8wx3qbDjC5w6YF6thZYwYFivbkqj9IBXU6/VEBIVXUqv0wtk+JhgOIU/LO2Cf+0SW0XdqFtoqMWBcCKC+xMZJJC3aZmit1qCynrPJgXkqG6nYfVQiFp/E8cwdlSgGDQyQFtpuqR3nLauFocLvaZIOm0MIsvZxIerlCgKufqP7lNtcy7rriBjUUhLBRGwz4EFym9ruwYBwNekhL96oqk29zEjT1RlHbsYOax8HjOdeW6NoN8FAM2Gv9DiuAZhJoxf+nT9aUij95MEdOXUWdI3b8z78A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 by SN7PR11MB7638.namprd11.prod.outlook.com (2603:10b6:806:34b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Fri, 7 Feb
 2025 06:11:59 +0000
Received: from IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55]) by IA1PR11MB6098.namprd11.prod.outlook.com
 ([fe80::cbbd:ed55:576c:fd55%3]) with mapi id 15.20.8422.010; Fri, 7 Feb 2025
 06:11:59 +0000
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
Thread-Index: AQHbclaGAK4opE2b9UeNi8wuYQCRp7MuU6qAgAm5uxCAAT+lAIAAUGyAgABqLICAAV/RAA==
Date: Fri, 7 Feb 2025 06:11:58 +0000
Message-ID: <IA1PR11MB6098730609C110664EED7904F4F12@IA1PR11MB6098.namprd11.prod.outlook.com>
References: <202501292144.eFDq4ovr-lkp@intel.com>
	<20250129222141.478c03df@pumpkin>
	<IA1PR11MB6098ECA558A36C0EAA1F21FCF4F72@IA1PR11MB6098.namprd11.prod.outlook.com>
	<20250205215650.1a93dc58@pumpkin>
	<IA1PR11MB6098B4AFF412D34D2F62C535F4F62@IA1PR11MB6098.namprd11.prod.outlook.com>
 <20250206090441.56c61c27@pumpkin>
In-Reply-To: <20250206090441.56c61c27@pumpkin>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6098:EE_|SN7PR11MB7638:EE_
x-ms-office365-filtering-correlation-id: 5e43c7dd-9ff2-4f05-7c55-08dd473e54a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ZeGjneCpVoSSXf9OZwoNuMhmBTgL++gXU4mHQQ4cocw+Y3ryficZBGQqcrVX?=
 =?us-ascii?Q?oy2HorpVLSyZpJM8P10nhBLbdHPTnpZzW3A3Gk8RYgGmOSfG1jIifvKCeDJ0?=
 =?us-ascii?Q?kQtuUbcnWbJCcr0oY3MAkvfMetGrO1/bboW7Mbgdqk7m/3Yx5dG6uhPA0VhF?=
 =?us-ascii?Q?5+i44Q7Jfu5XBphuM+9MLIOPlmtvyVA5pQtXoVJmzZCkITpzqqVacWlwibQm?=
 =?us-ascii?Q?HXcSN8h9TAvQvJ5rXZTD77gvWSH6cYQ6HGAEOs392OwndV/GY8SEE9qK93tc?=
 =?us-ascii?Q?2hjVIlGh5d820+eTON9n/rh6Z/JMoK+vpN8Yx3iwk+TGNXVvJf6fFQc8Xyrg?=
 =?us-ascii?Q?m8EEzWIyncgvqgU9y1+2SCS62ehmlVmXpIAHdrLMmUg2o3CjBRqe1DRfNwJH?=
 =?us-ascii?Q?CpG7DsEf81avPElkeJaS6yKkGDtUffVSu8VINhVBqB8KKAkiNd16jQ1Akzmq?=
 =?us-ascii?Q?rSTUwRmd3LpQ2vJs0MHZV7Z59YLxxuz2fALOBP2zXZjNCP9swmAVAONwwhAS?=
 =?us-ascii?Q?TVA/ekgfswkcCqXtitkYKcKO2q9X188ok4KUn/JhuBym83yFJwPBmyHPPjVj?=
 =?us-ascii?Q?+0d1N3a2a2T3mj7X6jsilyDaHVPBVZj0imttzMYKit0zrIeWHJdkxClfEnU4?=
 =?us-ascii?Q?709T8+nnWfR1yRwiH0Q3Iu045NQ+vogy/reFpGmjYsRzNZECG+0F1c2FxKj4?=
 =?us-ascii?Q?UpE14+P7/NgDQD5Oa/1tCeWHJwQ0EMsyaYklYMjCWhM5+NiZtLtzlr5lRY+3?=
 =?us-ascii?Q?+KGVlSlXLflUEEeF+Hg8UAvh40D3s9Pl8UQOU0j4t3usRyI36HMny5JXlVU+?=
 =?us-ascii?Q?7GZARZQKpDDM2Q4N6e90n/TfptNoegXlYkrQ6rurc/q30RMdJmTx1ltZWd8U?=
 =?us-ascii?Q?j0gnGlJ1oiTChbDjDAlN2we/d5MeK05E4grTwVYGNw7jR5H/5odKhn9C8o2S?=
 =?us-ascii?Q?Yn8aVbydwHHEcfA3umF+63zeNSE2SsUl6pO5k/HgMwUC1hJu6W4D4l82ozz2?=
 =?us-ascii?Q?4o+z0wrm/0hU1etbT4aO/20Y/bqqfooCoRezchp3ZEENORZXRONAgrlWVBfu?=
 =?us-ascii?Q?jrvAL2hUyRNVsIOTUSpur7+ol8d/wYmaC0DFLPX7Awl+2WPG5W+HrZ92vjeX?=
 =?us-ascii?Q?pJRoIOs7GVJY+zl4hu3GLSexqRKePfFvUEupejoMmUHOecMZzogXpXgN/tUO?=
 =?us-ascii?Q?YlNCvMZCeI1jyaZ/RhaCdfmT6fco7uFvyxHZFd5qudqbsg4ddSGzbo/VV7I1?=
 =?us-ascii?Q?qmCbjz98Q/i1eeZ1uDGnfS5SCnvRNMnukclKvWlOTs5oxNy4FJH8ZGROgVno?=
 =?us-ascii?Q?jP4s5AouRLUmCphHtB3a+UaI9mrjpcWxQiqXgMgZERYcSmTt831TJnVHUp6x?=
 =?us-ascii?Q?dcorHHvSM+N28I3MinaQAXeoRJwJBXOMMOuth18QzYr51KdVgw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6098.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MtH2wfPfeumkWx3tNNQCqQ4o8QKN5024peT2UJkNUlfaRdDEbArWOMGnu/pe?=
 =?us-ascii?Q?kI7aKujXzErgzJBN6MM7smH+an5h6kzCmdwqOSKCBecDjVCGU1OpvN0QOk0j?=
 =?us-ascii?Q?RHVGtKlTdBsVSzT5O4sTZfJIOWbmbtwhG8Qxm8KFnonZXAR13p5yC5eYa99q?=
 =?us-ascii?Q?Us9rdN34OA7Xuy1exV/3W3Z0aK9+SiuxFL4lhir85E229qR4PgM36CEiSIvp?=
 =?us-ascii?Q?gvt8BO/ePi9Z1zFFISO9X9umg46LDmCM+BrE5Eou8lw4FaBhYnoh8YmN+c8q?=
 =?us-ascii?Q?4v1YCpGf1ZdVXwMHMSlJ8FaGDQMfTcbQVINTT14Wy+CToStT5rJNy2FhHUV9?=
 =?us-ascii?Q?5eU/BAf5xWuCLct93tYcHXW/V1cWn4MK5gWRChRzJOWV+jQaYY/txTauSeD8?=
 =?us-ascii?Q?6fPfnTfjnpZhpJciXivHAo9oqWLK4ebUCElrdYqNBAOYpLUGvNJJNUGA2nAh?=
 =?us-ascii?Q?magkeQlZZBK9e99x/8lr+Pr/8BDw6q0u+kIorVR3tgT7naAoR9b32K3iIwye?=
 =?us-ascii?Q?jBlXkhcefRBjAKcZ8N49ndYzoVJoVQTq3bWUsugi1TDfidBOuk0KHbgbq3Pq?=
 =?us-ascii?Q?PIh1bPqPEh+NzlCUHjBpB4nua0FARIpN1ONDJDPmrmQqpPsfLFex+Qi2W5VK?=
 =?us-ascii?Q?xP0LpNPm0xtH2/f1rmbZA835yhI6VNW6WhLQxIZdQsdN0R7tlQQ2kTkVQ+CN?=
 =?us-ascii?Q?tpGU1wtUMWZ1k/Ys1veTMPbTrWbhxSSR85I2pkAZk7OU7pjAh4Bqovl26UY3?=
 =?us-ascii?Q?7pOT2Kprkqp9toJ8x6p1rkptn3HZthR2lwdCZVwNzMQuGMIoOrLxSP1dHVvu?=
 =?us-ascii?Q?yNsEXQzJJAAe12nEPAMs5NqAhQRN8v4cgcu5AR5jq7O+u6KTiMSJx2PgAXwn?=
 =?us-ascii?Q?Ke1Dw2fRbGek4LF+AWAxKV8DfpmUje9gGEYA+gdLmQmlwV04qgIB1r8QIG/5?=
 =?us-ascii?Q?xjm825vAcs1KMF662JHO8V59RanfgyWE1I1LxE9is1SOucZPnUMgf+U/jZ4H?=
 =?us-ascii?Q?3b9OZhCzy9psX/DFoVIcZIdT4i7C23BxIGR7zOE5MWvOwQaY3WJnQXSFOK94?=
 =?us-ascii?Q?Bue32mB7MUGt2ys8lTW5xLtog22LoxF0LWTLwEx7hRmYfa7RkWZOFgqq0VEz?=
 =?us-ascii?Q?uRPDkMRZMtILMg2/cd0KQoJSAYpE6t72uLTW3Wlqkeac9639uE9IrI4DRboU?=
 =?us-ascii?Q?YyAPxZszoDoSHIa3c6k6jGV5D2DLdBNJ2p4sP2PiMIIM4zLO+vHJ7BFhTICl?=
 =?us-ascii?Q?Mv/f2qtM0wwAvIavrJgT7Kj8GkViDiEt3iBUB7GPQMnmrCvg00XXYPKDfXhm?=
 =?us-ascii?Q?u2iIrDnMNnNpytJcvdkDIC91KhVawx+0/btSIY9GYELdj5VHanD6ipVpg4F5?=
 =?us-ascii?Q?fVftYYLbwLM18DC8E56tdEVXYmi8q0OfgQSohZp5WxAqhBXiSTzjb2mG7h2d?=
 =?us-ascii?Q?fqKyFiAUd3/rSXHaGUftKSMmSEmeaholwCMConRtv4O5kPfGXSvoKTaKGiL2?=
 =?us-ascii?Q?sbKLoYbO1LTBc8Y5YrWR22lV52cmKpKHNTrysEBtwKug89Ca0YteHCK88crU?=
 =?us-ascii?Q?wZ5MJvw5lqlfPBnzIXs=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e43c7dd-9ff2-4f05-7c55-08dd473e54a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Feb 2025 06:11:58.9551
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pzZfbYvfYVHooUqYqU/trKkp12osmcdICnhKgTbMPckrgdFHtzhvaQVy0D1LqpN+KpxiJ1mAPF9HElQe87jhZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7638
X-OriginatorOrg: intel.com



> -----Original Message-----
> From: David Laight <david.laight.linux@gmail.com>
> Sent: Thursday, February 6, 2025 5:05 PM
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
> On Thu, 6 Feb 2025 02:50:17 +0000
> "Xu, Even" <even.xu@intel.com> wrote:
>=20
> > > -----Original Message-----
> > > From: David Laight <david.laight.linux@gmail.com>
> > > Sent: Thursday, February 6, 2025 5:57 AM
> > > To: Xu, Even <even.xu@intel.com>
> > > Cc: lkp <lkp@intel.com>; oe-kbuild-all@lists.linux.dev; linux-
> > > kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>; Sun, Xinpeng
> > > <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> > > lenovo@squebb.ca>
> > > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:=
38:
> sparse:
> > > sparse: dubious: !x | !y
> > >
> > > On Wed, 5 Feb 2025 02:56:05 +0000
> > > "Xu, Even" <even.xu@intel.com> wrote:
> > >
> > > > > -----Original Message-----
> > > > > From: David Laight <david.laight.linux@gmail.com>
> > > > > Sent: Thursday, January 30, 2025 6:22 AM
> > > > > To: lkp <lkp@intel.com>
> > > > > Cc: Xu, Even <even.xu@intel.com>; oe-kbuild-all@lists.linux.dev;
> > > > > linux- kernel@vger.kernel.org; Jiri Kosina <jikos@kernel.org>;
> > > > > Sun, Xinpeng <xinpeng.sun@intel.com>; Srinivas Pandruvada
> > > > > <srinivas.pandruvada@linux.intel.com>; Mark Pearson <mpearson-
> > > > > lenovo@squebb.ca>
> > > > > Subject: Re: drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:=
298:38:
> > > sparse:
> > > > > sparse: dubious: !x | !y
> > > > >
> > > > > On Wed, 29 Jan 2025 22:02:59 +0800 kernel test robot
> > > > > <lkp@intel.com> wrote:
> > > > >
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git
> > > master
> > > > > > head:   05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> > > > > > commit: a688404b2e20f00cce6d0a2b888ef4ca9154e144 HID: intel-thc=
-
> hid:
> > > > > intel-thc: Add THC DMA interfaces
> > > > > > date:   3 weeks ago
> > > > > > config: x86_64-allyesconfig
> > > > > > (https://download.01.org/0day-ci/archive/20250129/202501292144
> > > > > > .eFD
> > > > > > q4ov
> > > > > > r-lkp@intel.com/config)
> > > > > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0 reproduce (this is
> > > > > > a
> > > > > > W=3D1
> > > > > > build):
> > > > > > (https://download.01.org/0day-ci/archive/20250129/202501292144
> > > > > > .eFD
> > > > > > q4ov
> > > > > > r-lkp@intel.com/reproduce)
> > > > > >
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just
> > > > > > a new version of the same patch/commit), kindly add following
> > > > > > tags
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Closes:
> > > > > > | https://lore.kernel.org/oe-kbuild-all/202501292144.eFDq4ovr-
> > > > > > | lkp@
> > > > > > | inte
> > > > > > | l.com/
> > > > > >
> > > > > > sparse warnings: (new ones prefixed by >>)
> > > > > > >> drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c:298:38: =
sparse:
> > > > > > >> sparse: dubious: !x | !y
> > > > > >    drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c: note:
> > > > > > in included file
> > > > > (through include/linux/mmzone.h, include/linux/gfp.h,
> > > include/linux/mm.h, ...):
> > > > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > > > self-comparison always
> > > > > evaluates to false
> > > > > >    include/linux/page-flags.h:237:46: sparse: sparse:
> > > > > > self-comparison always evaluates to false
> > > > > >
> > > > > > vim +298 drivers/hid/intel-thc-hid/intel-thc/intel-thc-dma.c
> > > > > ...
> > > > > >    297		for (i =3D 0; i < config->prd_tbl_num; i++) {
> > > > > >  > 298			if (!config->sgls[i] | !config->sgls_nent[i])
> > > > > >    299				continue;
> > > > > ...
> > > > >
> > > > > If zeros are unlikely the bit-wise 'or' is pretty likely to
> > > > > generate better code than a logical 'or'.
> > > > >
> > > > > 	David
> > > >
> > > > Good suggestion!
> > > > So the code can be optimized to:
> > > > 	for (i =3D 0; i < config->prd_tbl_num; i++) {
> > > > 	         if (config->sgls[i] && config->sgls_nent[i]) {
> > > >                                     ......
> > > >                        }
> > >
> > > That just adds a level of indentation to the source.
> > > It'll generate much the same code as !x || !y.
> > > Both will generate two conditional branches.
> > >
> > > It almost certainly makes in immeasurable difference here, but !x |
> > > !y can be generated using (on x86) the 'sete' instruction to get a
> > > 0/1 from the x =3D=3D 0 compare (that sets the flags), and then doing=
 an 'or' and a
> single jump.
> >
> > You are right.
>=20
> I'm always right (except when I'm not)
>=20
> > I do a simple testing:
> >
> > 83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
> > 0f 94 c2                sete   %dl
> > 83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
> > 0f 94 c0                sete   %al
>=20
> On a modern cpu those two pairs will run in parallel.
>=20
> > 09 d0                   or     %edx,%eax
> > 84 c0                   test   %al,%al
>=20
> The compiler needn't to add the 'test' instruction, but doesn't really li=
ke the fact
> that the x86 'sete' is only available for 8-bit registers.
>=20
> > 74 0f                   je     1186 <main+0x3d>
> >
> > Compare to:
> >
> > 83 7d f8 00             cmpl   $0x0,-0x8(%rbp)
> > 74 06                   je     116f <main+0x26>
> > 83 7d fc 00             cmpl   $0x0,-0x4(%rbp)
> > 75 0f                   jne    117e <main+0x35>
> >
> > So you suggest I'd better keep the original (!x | !y) code, if just for=
 unlikely Zero
> comparing?
>=20
> Looking at the code I'd guess common case is that both values are non-zer=
o.
> So in the normal case both tests are needed.
>=20
> The branch predictor will (hopefully) get the tests right after the first=
 iteration,
> and I suspect the performance of this code isn't that critical.
>=20
> So while using | might be an optimisation (rather than a mistake) changin=
g it to ||
> probably doesn't matter.
>=20
> 	David
>=20

Understood.
Thanks for your suggestions and so many details!

Then I prefer to change back to "||" to make it more readable and avoid mis=
s understanding.

Thanks!

Best Regards,
Even

>=20
> >
> > Thanks!
> >
> > Best Regards,
> > Even Xu
> >
> > >
> > > 	David
> > >
> > > > 	}
> > > >
> > > > Will create a patch for this.
> > > >
> > > > Best Regards,
> > > > Even Xu
> > > >
> > > >
> >

