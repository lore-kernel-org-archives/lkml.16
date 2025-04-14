Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6A227FD54
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744647703; cv=fail; b=Tm/TLIK8s6L3LvHK8bv0s+QGReSRGXiQuy0HvMxl8Kq82Qd9ojrHmZsJJWe4sAb9y516C8mQX/oraB54MWR4GuXfVRP6F54+l1/4xXUSjaU1C8gkbRefTX/2Hknz/e7mYpZrCSl9zL4bSovKoE8ItuW9DW4XCR2znhhTtm/55RM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744647703; c=relaxed/simple;
	bh=5LI3qadc3HHbRPHbFI1IApS+JiA7gCs8kD/ykmxsYeU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l3nyTq3g14DEWSgZBTvDusFD6QPu+MgmHrW13zIOUHQiIpSBEInjZoEl14PcJoQIsaoUMOY8OvAnuV9h1uKpjxAk1pvHpEDpDOO9Ocw0UyZF49317N9DfrQyHbgkYMu77BOjN9xzvTjF32QKEJwZSh8dKAvIG0sWaUh4D+eV8M8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEbAllpr; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEbAllpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744647702; x=1776183702;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=5LI3qadc3HHbRPHbFI1IApS+JiA7gCs8kD/ykmxsYeU=;
  b=JEbAllprSw59ZWzM3l/rznSWZItSOj8NINTSX4vECg/BjBgP6MJbyFTl
   27y6IFvaz3CslAMt03I1N1thanwKfZlUCMsgNiZxgkVExJceScriMqi7K
   lJNlWQPUBiO48NFcka+uxxi7+jeLbtfFrit4wC5Gfcpk5X5uXNuWQx3ic
   dmzw6SwGShtjhMDZH5z+WhFcGr/6/QpHo0sT+QUrzM7nxmLXNy362hsDp
   Vr6kmymWFaoENI1ZjVicwEiJq4tj2Z8wuR1CwtjDQsujDBf14nxmUW+t6
   1ECDY1/UqkM7aSxYFzJuS3OCVNhPjxJLOVsYiCQlcq3lNr1esNimioS+A
   A==;
X-CSE-ConnectionGUID: rRxHf3oiRhufUEolGxYc/A==
X-CSE-MsgGUID: aJl8mLopQE6Hyu9RIz8vKQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="71516742"
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="71516742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:21:41 -0700
X-CSE-ConnectionGUID: xBskonQxSGiyIOZv679zYg==
X-CSE-MsgGUID: Khiu0QEgTpeAra1jEPpMwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,212,1739865600"; 
   d="scan'208";a="160826471"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 09:21:42 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 14 Apr 2025 09:21:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 14 Apr 2025 09:21:40 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 14 Apr 2025 09:21:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IQuHE0+Hx2MqyBOqL7tFIlDeHNzG5zGl7wuUq6Oy79Tv58Q8Nbf68JBOIGGvpv00oB+Glvl9+Q2nOpkSL3rE6tIClA3bJVlD+/AJhfXRnABF82lVkPhT+6/1os74up1qRhbvAvWK/UipGbl8kreSKD419JApsEtAugc+M9W90oKfPC3PhdUZGM9qrRpOJThcMKLqUaZs7/tVgi36cfgz/KY6/XPwXqHBQ/wV1LI1MwclcWEY7DWXNf84THf2jzIm5bONqVFvkdUSN35v0Z9Nu3o0DYosZHuuADhiDrlpt8wUlBUis5zW1RgpsIxLQnlUMFKwnOnKYY6Z4A3n3Sfsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xvkA52wDYox5zkZVdigJPGhRqrLgyuueFBUhJunlKbw=;
 b=FWQmTqWfBl5yPmUfLJIUFLDZqovkYCrj14Z49NHe4piZ+5FDxqCSIzi7ajX3TfI/WjWSMB42q7jxnnTopCQy0CEx72RiTH93zlSuk5QmdTjphDFktq/ZoeH7300tZ0XVB8GeDlRlAD3e7HEwlHIQrKbOE1GT1ZESlVcUA5dhqxsCmJlIWrdHKCOAWZErie46jMM8bDsSMcMyENmqiJmxGxu70yOzziRfvx74lREzQTbp8cRM75XHbqatl9SOco6wUs6uM8PmwyPXpK3V/PjXyvCEeXPYbWEhOLN6K0GUYOvY2dCG0GBEkg2VVw8At3BwZY/pJn1vy++NfLOSKcJgrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6077.namprd11.prod.outlook.com (2603:10b6:8:87::16) by
 CY8PR11MB7395.namprd11.prod.outlook.com (2603:10b6:930:86::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8632.35; Mon, 14 Apr 2025 16:21:37 +0000
Received: from DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec]) by DS7PR11MB6077.namprd11.prod.outlook.com
 ([fe80::509c:f906:cc6:2bec%6]) with mapi id 15.20.8632.030; Mon, 14 Apr 2025
 16:21:37 +0000
From: "Luck, Tony" <tony.luck@intel.com>
To: Ingo Molnar <mingo@kernel.org>, Christian Ludloff <ludloff@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Pi,
 Xiange" <xiange.pi@intel.com>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "H. Peter Anvin" <hpa@zytor.com>, John Ogness
	<john.ogness@linutronix.de>, "Ahmed S. Darwish" <darwi@linutronix.de>,
	"x86-cpuid@lists.linux.dev" <x86-cpuid@lists.linux.dev>, "x86@kernel.org"
	<x86@kernel.org>
Subject: RE: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
Thread-Topic: [PATCH -v2] x86/cpu: Add CPU model number for Bartlett Lake CPUs
 with Raptor Cove cores
Thread-Index: AQHbrVEqPlOOy/ZKf0S3/iKK4rOUp7OjVcJw
Date: Mon, 14 Apr 2025 16:21:37 +0000
Message-ID: <DS7PR11MB60779A14A91C73D04CC60494FCB32@DS7PR11MB6077.namprd11.prod.outlook.com>
References: <CAKSQd8Ug3Vk3A7eE6nB8UbhmOBBzVpfAqDYLf35Ym444MeQRdA@mail.gmail.com>
 <Z_0oWnbcjsekHXJd@gmail.com>
In-Reply-To: <Z_0oWnbcjsekHXJd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6077:EE_|CY8PR11MB7395:EE_
x-ms-office365-filtering-correlation-id: c83f0a4f-2741-4a81-3a38-08dd7b706e79
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?06gh8WuHrYzYx3JyyN6HuyoL+q8BBhxdY3P7STAEqFxTSnPww2V8E777w3Y9?=
 =?us-ascii?Q?grzzHtAYefIdUeCkJTZyRm6EHf6o76DiuA/bSLol8gdNM+veX1rHLH9Ww6YT?=
 =?us-ascii?Q?KWrA0TpE0dOL6cCSzQFnEOKnPTzEdkOxb1PvEQpKqm8HZnDPIvR60kl05XAT?=
 =?us-ascii?Q?7vjdl3VGhR+ij62Oph+4mXJGqsZKYDSH3URjp6bQBICz7Vnyif0g27a8uBOJ?=
 =?us-ascii?Q?LjGWwzdRPsDhBzRNnBk3EhOVUi1N1zOq59MpjOiBug8klYVu3qBJ8yv4Gg1S?=
 =?us-ascii?Q?FlObqeNr3kQsGHG9jel4cMEytgEheoicPZW21lDfY+Ipf7SR8QmEyskF3dv+?=
 =?us-ascii?Q?FLFxa5fM1LalnqJqKr/4YGDYFUlGbcjfFfaSmCOE/DaI6CZUYIdIdOFL84mx?=
 =?us-ascii?Q?zPZX10hhbHc3667UFkJvdFQRBW3TzHl38xtqyMRkj+kOrGKlMptC/zLJURSf?=
 =?us-ascii?Q?f5IADD7tjbriIgy5oCmlnu5IbJbILfCmIPJ+t2ZQ3SxkilxdB4P2FZPZiYfD?=
 =?us-ascii?Q?kxdfC2urC1n20q8e63MG9UTs/WOyn2YLVitVYrk3wsaR76DUSld5Vp0LMJ0Z?=
 =?us-ascii?Q?xhLmo3WMJoaXE6Skc0pC3QT777Z6Jd8bvtZTOSVvtIU6cUqZgUldfACwR+V/?=
 =?us-ascii?Q?4mNHhE4SnvoSCkCmD+kwm16qkdr7z8THMk6Vux9gzudL5ivWeWc9TRHIXzEm?=
 =?us-ascii?Q?IhrNFNtjQVAM9dktt87uX2auW8xA/N2tgsAqOo6Thuxo0CovcGCFhhknLmIP?=
 =?us-ascii?Q?We/DsSaGmCl3rp3VPSRe0VfewD8qRAWTzeGvWLNRAX8wZ+il5VwtO7WETnrk?=
 =?us-ascii?Q?Vr6Wxo96Nc87zo/pF/2aEt+ftDBhJMgyzRXBXfmqJ3EkRhlK8xTaOLrK4dRA?=
 =?us-ascii?Q?sRlgUwAhXXlLz8XS45R740waoE1n0YWl3AGbVMN5CpqI08rG/OY/QvXju8pU?=
 =?us-ascii?Q?RCJ7Bip27WqKsTl8pw99cLXFTHennKQak12yQABBOCLifjqvYR8ZLw5UBEyk?=
 =?us-ascii?Q?byvHcaPB5LFNsBqv3uZqZkgvtytihyRJ7AR76BfSYf5/uI7hl6j7Itn7BXMO?=
 =?us-ascii?Q?68SIHpaJieXBR6gWBESz9aQMSYnn0uI1xNn1Debglym/eJ3WGi8tcQKxGTOk?=
 =?us-ascii?Q?u5UhM8vuKoseonX+Gip2IMpJ+5C8jezg6NyjbzX6qoV5l2MdGyy/Z7BisBkn?=
 =?us-ascii?Q?lzH167Q0Qy73+Y4m4vM+o06t1qgPJ7VpmdvSj5Tu9NyJPyA0Nwp6qtIOE0VW?=
 =?us-ascii?Q?aulPrimGqCeY99To/GIlES5dQhq2i9VszYP3NVQ5l1Rkqn7LIShGfZe8F0nn?=
 =?us-ascii?Q?Z2uaOvAsXzdJzpixt1AGQjIw813uq6oaRnHB9VSXbC/wS5BDGOSXmYbWOAa4?=
 =?us-ascii?Q?KmpsJFK7nFE4CkQQmBO6h5o4sCxzR/jDXWujAQvPPFgY6QOxE3FNxWsP75AH?=
 =?us-ascii?Q?JVNe2YcIMgtDSzwmRgfxBS5Q4H3w6Nm09HWVvQ1rYUNvzwU41zwK0A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6077.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+BWY1lvet+0zHShNzzl/P6lMgRSb/LylomlRT+Bpqq7mBTi06bNb3tYiSsoh?=
 =?us-ascii?Q?9gAhPd6cxpSly4i++INJrB3IaNGGOp7fwiz+KdvxFiL5igDCPhzXcXjk+xbp?=
 =?us-ascii?Q?nEkBV96opYiUBLBr9JQqRohTWzcEYOojMe8pfoW/5Z8bf35qEyTjRTc5B25v?=
 =?us-ascii?Q?Uk0xOEPqMrRv9TUlp93YJffbzAB926fzy6jT1lpy5OxCC9eo5kQc0Zj8N+Gq?=
 =?us-ascii?Q?ZN3zypgUXQaBEAyvjFAkN5lJJrrtu5DYTxQzCQZaSWSVMlNVJChlPcqMe0KZ?=
 =?us-ascii?Q?WoWE/lZA20UXlsdKOq94ERfO975iaP+08G3mDZPtlZUnei16Fz1mH7QyqJxM?=
 =?us-ascii?Q?Ft/5aAtepazWuQHPYZ9co3giD1Dr/qEVe7MG3jq21PcdQ58T8Na1mCbfFRi+?=
 =?us-ascii?Q?Vly9eas0c+AfWAQSpVvSfv4TPce0WATGpJaHDuXNKiLfTo2TfucTtX03ikST?=
 =?us-ascii?Q?w8w2j1ZSQYRHrZsz2j10D5J6UqqFB7sc8clwWMyyyxQBLw9HplXTt4f+u0JM?=
 =?us-ascii?Q?AoiW0YxYRdcT2biksLHQElXmUAy3L5Lrk2O3RlyE2nv9AsN2AfpU32bynd8L?=
 =?us-ascii?Q?jq45FTcHHC8RCjrI5Ykio/J26pXwxFohFXFUBvAbDA1ZqCUpqSJXlXPCknSm?=
 =?us-ascii?Q?fFBbD9tpE/vfEU+crDogwCNWMIDRoPiCmf50orOJ7v3Y0RD3xnBgyfbuWvhV?=
 =?us-ascii?Q?/j55jBDC4R/5nTuyxO2MxqLib8/0hCcVmMffVbdh0yg44AjUdRn+PVfrq2+t?=
 =?us-ascii?Q?3WaqxCpJFQtg0kdz2pSqdhHVRVAetghNNrrSWKWX29gpYV/71SARXmV2Tb4l?=
 =?us-ascii?Q?ozJDiKkmxLNqVLQgzjHSdYtZoGCIMmt+XP3Y6fg69IXMAgGce5Ltr5p8iQTX?=
 =?us-ascii?Q?sb5UqqAieA48AV3GIwb27WUdl3KcwwY4vfeHIMpY/NtFKOSGnOkTt5NZ1r2Z?=
 =?us-ascii?Q?kD/0MT24D2x0670Fx2GZqXIhSkpBzVuKmFFBaoQLZwfBjGlwiS4B7BhdBFtQ?=
 =?us-ascii?Q?FaxdYHnq0AWbnQkOQJB5Et2LY64K4F5zp6fCzUpIKLRdlv2k4hTp/ZE55e4P?=
 =?us-ascii?Q?nQQF1I3Nf3jq7QqXYTiglVIMYJmbkb/6Yiv6gCj7lRg+CTATZ++rocwgE3AG?=
 =?us-ascii?Q?rQiGFduZHyBGDfY6cSof4kL9Y9BNaL8m7lv3CSP3J/s0vgqJ7Qw9xp5ajwuG?=
 =?us-ascii?Q?08gK90oJjO+2gfRz4M0Pm1EGOEGOBn04XHTKoko4OtKCj+F/Ko1xBXdQEam+?=
 =?us-ascii?Q?Hx05jq+2BgvTQlRrqdaLgOBvgQFCTlKo8TP+GTXLimihQKBwZKkY4d4K5jhN?=
 =?us-ascii?Q?GuFdyO5tbUTtfxHNq87mTWPIm3yvHam82cD/0wOHb03g0rbgojqEhEIuBhf4?=
 =?us-ascii?Q?rIvqEma6DYPJy8R9T7FQeXNGiCjTCU7M4+i0D194QsOWVae3g4CzGPbj+9sX?=
 =?us-ascii?Q?eENQD1AAXZ8J0zaG8FZZBvyxV2sTZrWTOHP41UGatzArXGyXh98NRBoEH1gA?=
 =?us-ascii?Q?X68vyENSlOQPvPwaO74EGrPvY6Gd4+WafTmyork8HUvyRbRKCAhJx2C4sCV0?=
 =?us-ascii?Q?wGMYIjIFcfkl1yk/zetR9uInGYbQZrfTSLdGHSql?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6077.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c83f0a4f-2741-4a81-3a38-08dd7b706e79
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 16:21:37.6338
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvWPktFanH6kf/rUHbQmJoKsephcvg7VCfmpFactj3nYDNUQUMxGzBkDTigpS5eL5AnC+AInCrZLhvQS7nhwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7395
X-OriginatorOrg: intel.com

> > Please fix this. It has the core and the product reversed. That is, it
> > should be INTEL_BARTLETTLAKE and /* Raptor Cove */ to match
> > the bulk of that file.
>
> I switched it around for this commit - see the updated patch below.
>
> > And yes, you also want to fix this for INTEL_PANTHERCOVE_X
> > and /* Diamond Rapids */ entry.
> >
> > The macros refer to products.
> > The comments refer to cores.
>
> Please send a patch if you have the time.
>
> > Consistency, please.
> > Sanity, please.
>
> Amen!

PeterZ has been very vocal that he wants the "sane" way to be making the "#=
define"
name be based on the core rather than the product.  That way multiple produ=
cts using
the same core show up together in switch statements for model specific feat=
ures like
power and performance counters.

This does mean we have a transition between legacy names that were using th=
e
SoC product codename and modern ones that use the core codename.

Can the X86 maintainers please get in a huddle and define a naming
policy. This discussion keeps happening.

-Tony
