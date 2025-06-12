Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776621C84DE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749697890; cv=fail; b=JMgC86psMAq3FGkEMS+IM0WzEsApkFLT9OX7LrZmbpb3sqJE+EhehyStTWAiOStrlzKjEcpgRBf43FojFYELInslV8UZGrajE7Ib/X6n5SWLAdXvvAUmpmeFZGri0T81qqxZD9nGIRj2E03aXeUzAasR863jTzrOh/VwNphoJ7Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749697890; c=relaxed/simple;
	bh=KixtOMieu+8SoY5RZ7ErUuv3MjB/qlOQdNHl8JKxg4s=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gzJ4fbCEs/zoaNAynS8SgxrYJcirVUMXebQH3HlwL42cHARHx9eF+Ehkc3Cj/mdj2/THw6qRr7jZinsBa+cjX1kQIIgfyz0mG0QjbynC4wBCQUVod/C5pW3MVHLt7FH+2HtefrI+cHmNXOey73ym6EurKuR9vFERFGwySMoD+t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kcq9npv8; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kcq9npv8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749697889; x=1781233889;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KixtOMieu+8SoY5RZ7ErUuv3MjB/qlOQdNHl8JKxg4s=;
  b=Kcq9npv8G23tVrEQey2DHIi2TNOc62t6pd6t7KrfCvIS3XIsCqe2nsKq
   S2X4ivYujBgffhimMSyb3ZQEk7v/I5+RFRHv08O28u6MwDxypvxMSUN/3
   ff301i5hYpf121o9rpsKFX1md3OB1cje09rH1XzyBqk2vnVtsNuyGly7N
   Tcl2uxjdmnzM+UjAxGdKYo8gdzJIFlGaXSANHO0b/SbaYZtEv19ZQyE4I
   k2nGCNwm6GqJe62vXMIZs8Bd/MHkVaKNcY9GkVJGbww1o4jP2sHwltRYP
   t4xXeMHO9SxZpnY/aOeZU/s7el49SWWNPA5bbpnc85wxgOTOWdGaXvQBp
   Q==;
X-CSE-ConnectionGUID: Ouv8893CQ4KbSGu1Z7BCdw==
X-CSE-MsgGUID: ANLDotFSTTOpOD9MyGqEEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="52005796"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="52005796"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 20:11:28 -0700
X-CSE-ConnectionGUID: cHN9W8p4SBGZ3MpE1ItvRA==
X-CSE-MsgGUID: wEMYM0fBRSOM9OEtHLlmsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147226982"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 20:11:24 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 20:11:22 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 11 Jun 2025 20:11:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.74)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 11 Jun 2025 20:11:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSsC1dsNV/1urnOqrDutRZCseS1OIlZ6lMeEUzgm4pRAXeZrkYxZR9n5MEiGwBwjUtthcGQ/cUVkG4+khh1CW7FrhvZbQoLmmf7z2k3hWDHYs4e06ikGGidhgY5WMwqtJJMk6PNmuXLzAxzpje8UEiTTweegIFXTJhnieBQbow/gW3yVPIXBtFi8BIsg1v36SM1Pw59RWyHSn6xpB2uWDqI6oP3hpj5q4lZ0GPMdUYggKd949EYqFmtxWE14E0b0JVvRW/+R/Kz5OrVRKpd0U1RF5n60YTXvZpe9Dr7bTFEHrMzyA/IPBQATk52OANjLJFzPG3mQRCoW5gVhKEGO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+eBObW7DeP+KOMwpQzofJFM2pFAI9TlKjLBxyWcnzU=;
 b=uzAY867UbLjzjjoEK/eWedZ/i/hEovVrsosZ0oOuCqKmRrVR0TS5I2KgDsaehxQsZEOfdaBthXObwe50a4xXpHpi+rKNtEeZQb1pFyEvRBFKjR6Iixu5BXb7ThKjqwsRnWPYYgUe8TQzKH+fWTFQ7qvJvgMjWRt67mdsR9iHzLlSMN8/ewQK2v3Wr/ij+4ORRiE8JF6gDVB/3KbNXI+E2Mj2FKMPV3SVHmFJNpnrtfGN8Bb8khQ9GxIV1g5XA1g3GFILre7t8o2qvGY8Xen7e9hZQkODmVL/Vp0UdxiGZ5Ikymttj6VdqAV2HM4UBzhpAe7mw/95L7PDv90/mWWKrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB6003.namprd11.prod.outlook.com (2603:10b6:208:387::6)
 by PH7PR11MB6403.namprd11.prod.outlook.com (2603:10b6:510:1f9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Thu, 12 Jun
 2025 03:11:05 +0000
Received: from BL1PR11MB6003.namprd11.prod.outlook.com
 ([fe80::10f5:4f80:f2bd:1df5]) by BL1PR11MB6003.namprd11.prod.outlook.com
 ([fe80::10f5:4f80:f2bd:1df5%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 03:11:05 +0000
From: "Deng, Pan" <pan.deng@intel.com>
To: "Deng, Pan" <pan.deng@intel.com>, "peterz@infradead.org"
	<peterz@infradead.org>, "mingo@kernel.org" <mingo@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Li,
 Tianyou" <tianyou.li@intel.com>, "tim.c.chen@linux.intel.com"
	<tim.c.chen@linux.intel.com>
Subject: RE: [PATCH] sched/rt: optimize cpupri_vec layout
Thread-Topic: [PATCH] sched/rt: optimize cpupri_vec layout
Thread-Index: AQHb20c3FZpOcZqvxUKk+rM5v7gCfLP+2CDg
Date: Thu, 12 Jun 2025 03:11:04 +0000
Message-ID: <BL1PR11MB60032009A9BE7D802782A1139674A@BL1PR11MB6003.namprd11.prod.outlook.com>
References: <20250612031148.455046-1-pan.deng@intel.com>
In-Reply-To: <20250612031148.455046-1-pan.deng@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB6003:EE_|PH7PR11MB6403:EE_
x-ms-office365-filtering-correlation-id: e33ba843-6ed1-485a-3cc5-08dda95ec4cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?Kne9hwg56fNdWQTs5hi/5ABIZQmEZAC34aGCjteRIUBXp1zzQaJNBQU3v3Xv?=
 =?us-ascii?Q?p4FBpc3H+j1093pQIlMyHnFBeMoxiVcePyY3q+5mqcPUJfbmVHfS2JUaMfe9?=
 =?us-ascii?Q?AgbU4d/ldYWOiCX9cXY79vupUoJ0aUMLxpi2H/DEJ2Lyh25hCx6lXYpCvOPe?=
 =?us-ascii?Q?CjsHeqpzu+yyadPKdOJoqngQpsfa229t+ZO0pZ2gf4GBcBsL2ja1pfAOpAtd?=
 =?us-ascii?Q?8QlgrQz/wyp+KyDs6uKSOtFqQTQJofE6MXJi63+3OW8omDRgnz5eWQQHth0u?=
 =?us-ascii?Q?gbkUPaXf2m9eHF29wQ1Lr7DbybSDwSoVUzTdeRBYXFKoDrAR9XGdE6WPjzLf?=
 =?us-ascii?Q?uzlW0C5jn8GdE4NEnWKpYTwLTN6pglhOQbioUixo4L6qafq/Iydur5alfQB/?=
 =?us-ascii?Q?qSirgmI+hklrNGPvK1ZZdshu4YlRcZWKewe0aAd0jus6eBlyI0nwy9lJNyTD?=
 =?us-ascii?Q?kVwlP4uGYobdB6acCmLXxeO2hKeR5Lh7xvdWHrUSOqsfHwJHPLyYwl3SGA/v?=
 =?us-ascii?Q?QiQxgqJToq760vk6vtYBheaEa3mgdbSkpRkG3MywF4ZDEyZGrL+ezttg7+0b?=
 =?us-ascii?Q?yoqgEWtIZ4LK8GUPQ1NaQmEK6E3gdHhv3Aj2WzyoLbWRi4j/VRMWmE3pPzXY?=
 =?us-ascii?Q?2wyZvzI11TcO2EI8OGzG3zLPL/K+yvG//QIv6dQzqMdxyHxc0XBiZdbDfeD4?=
 =?us-ascii?Q?s859E+jx2ARK5I3DdxKaEVtnonNM6LxloepkpyMzqtHpYxckjxJ7R9J6Q48Q?=
 =?us-ascii?Q?hWNwodcZ5bSto5a5aGXUSSGJJrb4gk7kGYUujNKmfOlHU5g/BShNrpyIuEHk?=
 =?us-ascii?Q?fr2REApO5KNQXGIUKnYCr5OmfB27i5L59LwXBZJ3QfFSxAroo3S7lM2r1M2f?=
 =?us-ascii?Q?MfjgNJ/4Ge7oOCza5QnzckQ9T1rb5Ayar5YGIfoPgAltTeJsDB9vgNcWpDD7?=
 =?us-ascii?Q?8o/TRBAc4gB6pR0h1FNaShWX0AC7upxC+nRZsb8Zas9ze9lZaf7kLOVb53HA?=
 =?us-ascii?Q?COYeApdQE1XWNbGtIaWD89tfbJIMI2eflhvLiN0V1ZncFwxys7zvRiLBLxDN?=
 =?us-ascii?Q?8vWc+4hjLZDb3ZwjihCSg2ySea4cgfCTWsulHh51jVlk2xqRfixSXp/Nq7x9?=
 =?us-ascii?Q?kSvz9iEUh8ht7ZDWPI2ki1PLBm0U5vbde8M0gqR1cmWrvsLjyxxl+TGsKRER?=
 =?us-ascii?Q?/+ZnbXl2eL/vh6fdON4AlsQw+rBNKZHHAspdaUxGv8EWyFO4GT+G6nA012Ux?=
 =?us-ascii?Q?+FNeevNimnZ8WfHNWdafeVm43KjHXrsoz3Zq8lAncwwM7VSTwkGcZNzYJU7x?=
 =?us-ascii?Q?Aty6zu3MGGnIT2Pp3AfJKzFsyHrZUjyY/RXhL0fZMprXLXifPat7dCA5gIm7?=
 =?us-ascii?Q?Mgya/oYiwtxHyLN7vwWKwqRYA8QHX6a9GlmbDjTRGH+gPrI7awr80HP1Szch?=
 =?us-ascii?Q?PCSdcZ8cxDHfuM5OQEEGIZniadYHgm+3EPfAVSLjy4fUn4XphEHd3g=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR11MB6003.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8BFBcfLOIX20Nt5U0ivk4kf+9seVCYbCkUt5G0SBXf5W4Unuf9urP+mIJo7j?=
 =?us-ascii?Q?fxg+4kkGBOwe7EV27/iYYQTxTnefvw1PaTpZr45FqrMZIYrxFrolDsL8VfSH?=
 =?us-ascii?Q?jmfhjXTXkCVtITMGte9OcxPgWoLyjPW4O5XH8CHLX+dYyhHNRPatc8/z5fhn?=
 =?us-ascii?Q?KsxDYFaJiTLoP8mjulwvALjv/UBEL3qeyr2cducXQd6SZlFzmfM0mrOA4yz1?=
 =?us-ascii?Q?ZUURooBotGwIHHtj5XXQSQBDgu+3AIXaD/Gt2ygu1PO//TbL5TgnPCfz4lL9?=
 =?us-ascii?Q?xGPpl/kxezoBB5duDfXxCnxbWXH6t5XGNZ+NSU7UsuLevfn+/N1uPOTZJXIr?=
 =?us-ascii?Q?OLjX44oOFdbPDn6c2vVAqZtW45BN+RR5TXRa4aSf/8H08Qx1CT8sFyIN58cB?=
 =?us-ascii?Q?WS9r1F3LjXqLcGncrPEeP/IXxNKHmj7Bb1XVQr7yT6Op02MhUGRc0mbx7Wje?=
 =?us-ascii?Q?B6H2klDbtneVuwrSpLgjMco22YOG3Jy5yHZSRT5sAJ5vj4GjLHkT9nXUKUk2?=
 =?us-ascii?Q?dzx2xx7mg3cyi6PxjCIQdcJJ5gMXP84NH0HNZAwFZjixMi/T4JLdzcvjCq8j?=
 =?us-ascii?Q?SBDpsJTOrkjn0xZTLC7H3kd5xMDctSuQvE5GwjbVY/jqX+Go1g00Y6UQWP5o?=
 =?us-ascii?Q?rH9BloSPRuTw7rzO81Ll8MiyPpT2GwR4bEArEmqwVgrXfH9aIQ4YQK/8J76c?=
 =?us-ascii?Q?tAYe6m2MkS1ANg7klcboUZL8dZt444C1gCueUuR1oWqaOO5al8FM6GI2IJ/O?=
 =?us-ascii?Q?WUwGbXKNPzRHVjsgsmJ/zHw9wnvaSe7GrKbU7wjXUVojdQCGL0LylrnsKcUb?=
 =?us-ascii?Q?f0oovS3BGLTiKJMU22MvfqdVA6GR6TjltVFsG+yzpSq0cHSloYS5o2dxZS/0?=
 =?us-ascii?Q?cvHl12BupLqTmzqPHA4VKVOK8gVev/5M27l78P32oZXYMCTG3EwSfAY6lF1r?=
 =?us-ascii?Q?/Su2lEn4ZXU3Z6XGLkpNnF8bNY8jjcIojbfW3EjUuuSGgE+Zjyk6/ciKAxJZ?=
 =?us-ascii?Q?/wiAp2la27eCCPLqH4lPeEX++BPtwQBHEJK2WWW8YyeyW6sQHy+3wwyCwYVR?=
 =?us-ascii?Q?tSI9Fx2qUKs2z/7HEOiQhWEnp6i7XVZjWM7sUASu2PZAJZ/Y6QZrtVZaNjuK?=
 =?us-ascii?Q?yBl2jGbj6s2BLpiBc3KilqwooHdtLDxDMfdAJBfUQFMz0lQgSKUlT9E1BWFt?=
 =?us-ascii?Q?9YbNwKejiM/H/nSgaFS2AR9qn856sE4JU6kXL/ElgMm15jNHvkf5hslw1zll?=
 =?us-ascii?Q?idQql89b20rDAOAVHa8ILsZEf/ecIVELau1C4LgeoRAhJiHX+sWdK/UPcXNk?=
 =?us-ascii?Q?GPL9DDRbW2rItFQhqPEoep/0P9Vgk8GWBDzSmtEbyxWX/so4y6T3S0xG7rvn?=
 =?us-ascii?Q?4SsEyIe1hGOAvB6Con/sNzw3ipVKTO4V9gvkKRZIjb47ia14LUN4Lx0vIGAs?=
 =?us-ascii?Q?IVKXZWt6Tz8VbOAzXPthwgcFDjrMve0stnq6JzOjBy1S/nw1eauTXYEgEdSw?=
 =?us-ascii?Q?ql9ktFGO+LQ47ObHCJY364kQH2mr3UaqI1+PPKeyvCT48FWFjDaNhSqHL29V?=
 =?us-ascii?Q?udqCMFkKnau39iSnGGE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB6003.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e33ba843-6ed1-485a-3cc5-08dda95ec4cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 03:11:05.0021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cXiDY6kwW6TXWQZOM3n255bIxtPxKE5VSEkZTO4yHFj7NV5w9cnfNPz8IGL/ld1zAPIa4Zit3p29Lz8w5dJwUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6403
X-OriginatorOrg: intel.com

As an alternative, with a little bit complicated change, we can separate co=
unts
and masks into 2 vectors inlined in cpupri(counts[] and masks[]), and add t=
wo
paddings:
1. Between counts[0] and counts[1], since counts[0] is more frequently=20
updated than others along with a rt task enqueues an empty runq or=20
dequeues from a non-overloaded runq.
2. Between the two vectors, since counts[] is RW while masks[] is read
access when it stores pointers.   =20
The alternative approach introduces the complexity of 31+/21- LoC changes,
while it achieves the same performance as the simple, at the same time, str=
uct
cpupri size is reduced from 26 cache lines to 21 cache lines.
The alternative approach is also prepared, can be sent out if you have any =
interest.

Best Regards
Pan

> -----Original Message-----
> From: Pan Deng <pan.deng@intel.com>
> Sent: Thursday, June 12, 2025 11:12 AM
> To: peterz@infradead.org; mingo@kernel.org
> Cc: linux-kernel@vger.kernel.org; Li, Tianyou <tianyou.li@intel.com>;
> tim.c.chen@linux.intel.com; Deng, Pan <pan.deng@intel.com>
> Subject: [PATCH] sched/rt: optimize cpupri_vec layout
>=20
> When running a multi-instance ffmpeg transcoding workload which uses rt
> thread in a high core count system, cpupri_vec->count contends with the
> reading of mask in the same cache line in function cpupri_find_fitness an=
d
> cpupri_set.
> This change separates each count and mask into different cache lines by c=
ache
> aligned attribute to avoid the false sharing.
> Tested in a 2 sockets, 240 physical core 480 logical core machine, runnin=
g
> 60 ffmpeg transcoding instances. With the change, the kernel cycles% is
> reduced from ~20% to ~12%, the fps metric is improved ~11%.
> The side effect of this change is that struct cpupri size is increased fr=
om 26
> cache lines to 203 cache lines.
>=20
> Signed-off-by: Pan Deng <pan.deng@intel.com>
> Signed-off-by: Tianyou Li <tianyou.li@intel.com>
> Reviewed-by: Tim Chen <tim.c.chen@linux.intel.com>
> ---
>  kernel/sched/cpupri.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/kernel/sched/cpupri.h b/kernel/sched/cpupri.h index
> d6cba0020064..245b0fa626be 100644
> --- a/kernel/sched/cpupri.h
> +++ b/kernel/sched/cpupri.h
> @@ -9,7 +9,7 @@
>=20
>  struct cpupri_vec {
>  	atomic_t		count;
> -	cpumask_var_t		mask;
> +	cpumask_var_t		mask	____cacheline_aligned;
>  };
>=20
>  struct cpupri {
> --
> 2.43.5

