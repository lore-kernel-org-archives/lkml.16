Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9312137932
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 21:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747691842; cv=fail; b=X64bya0ga8fs3uZ5Hpr+cRUhL+NB7MaJb/RD/MiT0zhkhY7oyvAhZrpOQbKRraRKzOY6eHewwETmkr9+mDKIOp2hPyWkQeCZnRZ6B1lBsEmewJdq1kstKDJAZKoPqumsnjCzbmHIFyUC8sMPJjcMgYDYKhqvolJLJKkSdRxtPic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747691842; c=relaxed/simple;
	bh=6OqkbJu30oA6mfQZ1HmpwfoL7MrNJ3HchyqFjcT0Bvs=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=jdE+D1DkUbLcIgVMTvoOliuqBH3JloB08ueYTzOlNB+phU2PdvNWznWFUZMM8H3BR7O5JGWNUN+75GP6AYF9wddPMHUyHTb1d16YXFUrkzSqNa8KWywfbeCmVsjejjJ/Cs+0UiwVpHdqx9pLIjMaxemRA4jsl8kEakbnQDC8mhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVC34JSC; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVC34JSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747691841; x=1779227841;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=6OqkbJu30oA6mfQZ1HmpwfoL7MrNJ3HchyqFjcT0Bvs=;
  b=WVC34JSCy2PJXD1j8fGVUB1p/sPx+9u8GA5lBWfrPws5lslsx4W0qgcl
   +ZLWZs/kvjgGsIXEa2FjQzj+pCsDuMwokwvHX9l8kFaYPDvYqPduFOJkV
   tjuQN61u2ca4KoY8zNUHL+x4rnHEuQxMmmHjNG6giqbMCm4JngFupNG1U
   9lAxvDmhFw7uE38/AHtNSWsLz6Ckx+CVYWTCXl0q5Bt6jWmL/ho69VIot
   lVC/8ilI2dVZmTBSPYfFAhnfX1kd7gHUmS65Trr8zh3zilckpmmEBEbwB
   iILC9clEQc7Ampy7o/+XF1uxUBFqQsqfDRt26zMSUP2v+u7o8MUoiEtxh
   g==;
X-CSE-ConnectionGUID: 4LLKvPbnTYWXSZPhWCwffg==
X-CSE-MsgGUID: d+ohbRBWSg+Dn3zjQ9aWUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="61000130"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="61000130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 14:57:21 -0700
X-CSE-ConnectionGUID: c/qyrR2ESAKxUGdsf9aXhg==
X-CSE-MsgGUID: zvwcxKTZSw++EFgynO2UBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="144487508"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 14:57:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 19 May 2025 14:57:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 19 May 2025 14:57:19 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 19 May 2025 14:57:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q6BujPtKDh0Ru49RG50IEwR07rCPKErL82NX9R+rfBcnPgqrmi3MaFvJe2I/3qn1HP/afMKrl9e+Y8EY0nv3rUsItcwWh1HENsbt1HU36CvM05iCPeovNbkBG6KKl9N2lg+LhpzXdaHY2x3kw5MJFgghG0q+i4NJw6NXG//z4f/eYimaqwPRGpa/NRklG3IjqwLdvIYh2ioyr+r7k1wp8cNC3jxttOyAN5SzIF5nNEimjp2a7Z/LaN/7Zgmny/nam64mMVh/d60TPWKws0DKY2R/zUDecuwue3Y7qs4zVtPB7JI+yRiDaO5Uo2MfI7nvs7NVJVC2hjv+GT3Zb0OB5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6OqkbJu30oA6mfQZ1HmpwfoL7MrNJ3HchyqFjcT0Bvs=;
 b=pN/gHP/uDTIu2gZ+UBRLuAaf7sj4gjnqDv16OgKPBevlWZOngtOIu1Ljmlmm8gDlxy8D+MihmUDfp5TRdGL9Y+z/LPA0Sba48MgdRiVJiuT4qEDVzCve+lUgNMGBcXKwOM4zJxJiJIIibV3Q5eMvNUjHjnsju++0/+W89dcwPH8qNU921TH0HnO+2cSSTd4TyAAvHC9C1s2MXKkPPs/U+ZCBP8r7th+QtvgGA6auQfhkX+cboXGM08pUccUknuelAehAiQQYPwdq40w9aw8dk+UuWFBgnEbgb+vzYlVO6+A6cRX+I3b77q4gdDDKgfXDCbJoSMWbfk3LGeNWeQi2Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6818.namprd11.prod.outlook.com (2603:10b6:930:62::19)
 by MW4PR11MB6885.namprd11.prod.outlook.com (2603:10b6:303:21b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 19 May
 2025 21:56:35 +0000
Received: from CY8PR11MB6818.namprd11.prod.outlook.com
 ([fe80::48a1:723f:54ed:a6d6]) by CY8PR11MB6818.namprd11.prod.outlook.com
 ([fe80::48a1:723f:54ed:a6d6%6]) with mapi id 15.20.8722.031; Mon, 19 May 2025
 21:56:34 +0000
From: "Keshavamurthy, Anil S" <anil.s.keshavamurthy@intel.com>
To: "Shankar, Ravi V" <ravi.v.shankar@intel.com>
CC: "Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>
Subject: Recall: Interdomain support for CWF 
Thread-Topic: Interdomain support for CWF 
Thread-Index: AQHbyQjjHFxmvPOi2E6Y5MjDp6TtNg==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Mon, 19 May 2025 21:56:34 +0000
Message-ID: <CY8PR11MB6818BFEE55CBDC762AADAF02DA9CA@CY8PR11MB6818.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-traffictypediagnostic: CY8PR11MB6818:EE_|MW4PR11MB6885:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5688e315-200a-4954-6bd7-08dd97200593
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?+gQxem5L3ZyMzlYJpCCrmw+RX1gJoItdxJ+2FUCJ5z3G8Sf/8Ehuy+EBGbd+?=
 =?us-ascii?Q?rRm9SmsWHir6+3mgICSQ/QO3Q6iLFk30e87p0Y6D2XxBCvjMkRb++UcfMgk6?=
 =?us-ascii?Q?9yl2qe1X2K9MG85C2/MFxfbePi0YAjdicSsDp5GUAuKgbO/pnmYVCGKtsEdO?=
 =?us-ascii?Q?fERbYADsUPAafNDSJMkXM7QlE9PLPs/FLvIcqGlEzvdxt+izXysC42NBtIQ5?=
 =?us-ascii?Q?X2eHPYEpDcU0XMyiHWF6RbscChaOqlCTq7hbCKjNkl4WdPhWJ09pozL+yt+S?=
 =?us-ascii?Q?IcDqvSRfKRLSGBcLajeNWeyG+ON0LZG7Moc38rSgpwmRmGxpq/J2E/uJPu6q?=
 =?us-ascii?Q?8Ydmx0TPUlAYACunyDmz/wAo+jlOtbybvP5LELjHL/7x1iPl7Cvu191zv0Sv?=
 =?us-ascii?Q?Nc7kG4gZBI9bBGNZbHYv/ikraSsuNYoB3B8eXA/jds/ASHSDv5/QQ7GepHLQ?=
 =?us-ascii?Q?6F7tEHPADbDAb+ASPqmkWSm0QaX29Mu6a/wWtn0duvFtMTZDEbjnCIj2YHKQ?=
 =?us-ascii?Q?BsrYLxCl5vHjIl2tYtauq3FdfZKfFOQ4+Ln7G6aA85Zx0vHiLDF66u2avaP5?=
 =?us-ascii?Q?/Tm+jNcciKRUXKmFlUvpuBdvi+ESAB8Cer9rIfOQN9S8Ku6qTDx2qc63byKz?=
 =?us-ascii?Q?QpGZdmQDAoBOTMOM7HQ4Rd1PVwIlqip21QIsTw28YFswoQHoDV7gejmIaKi+?=
 =?us-ascii?Q?d1AHvPs6uKhOPfsCZbF6sf7one6rZ8xY1O7Zum+J5fM1gke6tg3iucsn0ixC?=
 =?us-ascii?Q?xOkWjF4h9C4wqB6B09X+3Mdd/2pTcsiGabIBYAaZu16fjhC689NJN1AgDFGI?=
 =?us-ascii?Q?XDPlXM52fa3yy8ndVLsODBzPOFqlAO26TjtG0rzBSo7vpC9Jb0ub5/L1Xvo2?=
 =?us-ascii?Q?kSzaPjCsLEHQioH6YKxOJFmhfzqFGQzT/AuOjHuGfatGlDZlWZxVhqQPBCWD?=
 =?us-ascii?Q?T2LGW4eHMJ9ZLFRgOiGZ+uPjiYa0b5Kp+wtf+N2M1nVl/NkzQ6zkqJ6THrZX?=
 =?us-ascii?Q?DDfBKUcECabSpScw7wgzNlEfCHkPSJBP3QjKnfJgWSip4El7qtbSw5e0Mjy4?=
 =?us-ascii?Q?LPpFxRHWwaf3PGXjdjlDYbUiznQprzAZ6fAJ//haGHxIaD03QK1j2ePZXJU/?=
 =?us-ascii?Q?gEc//kPPMpC9uDAxU7vmhI/EZzmK9ETRIPdKz7wU+y14/CmP5Y72bU9yiLeP?=
 =?us-ascii?Q?UkzGzCJkCNgy5Jod0oo5n7ARqLOIHtNLDPclqhJRiPbBVx9smVVue25DzGgR?=
 =?us-ascii?Q?FMMu0mw28N3+LhT5i5CJsl2zbnb0y5lpUxd3j1x4meMqrOrrol8ro56rYJNx?=
 =?us-ascii?Q?Gh1ZOP6xp/j4cY/BzaTljpG5dZDlGGl2XlJOgTsDHTepvYhfmxrqi2EGsiPQ?=
 =?us-ascii?Q?BaqQoeuXnHSXxokU2AeIPqSmrMx0zn91mVhDD/THlv70HSQBvy3sN3iz6Y6p?=
 =?us-ascii?Q?KrheXpTO58IkS8EtCnKiCwrj9Aq2/IEg4/udrr1oI9pp+jnMzF/L1eDX4rX+?=
 =?us-ascii?Q?CvIzseQDG+Q8Xfo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB6818.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KPFxQghHIk6i85jm4jLj/uYOdcffUFTHtC5CWOhdS5PukJWBXnAM15OftLWK?=
 =?us-ascii?Q?zCjpRcBXbvZUZAPC0pynjsHZtBSNy4rQlaP2eCsziG+4IBZpdD2ggICC5VS0?=
 =?us-ascii?Q?ud42W/Yqw/yxriGZjx9k3ADtcO3IvRfkLSWt5gUvsSfZrpXMhGXnggX3EqRL?=
 =?us-ascii?Q?+yOZ/wPajamjjyLVmV+H1icHRtyTu4KAIkISWYcjxOHj9oY+8TfT9EMvas2A?=
 =?us-ascii?Q?WbtcP5GElT3FmDTN4IY+2dt3Ac5j1fINf7dgu4RjAWvDwz1xTrd+Jrn5gbbb?=
 =?us-ascii?Q?jEl8zM+5eHgmlsT7Ju1sNAdffXuPGTjk9VdflPtLiPrM33siYNmNaeBW8LGc?=
 =?us-ascii?Q?lHqWR0n1k86Z4sJm7HsX2ksw3vBXIQldtp6rcSFRak1uTGhosRK2AVEvh0Nq?=
 =?us-ascii?Q?7RuHNC+Mc30UzDZKa9O5nzVzkr5WJhdqGSMGgxiDy72hSkTiw9bDEu03UBQ9?=
 =?us-ascii?Q?Sgbkg6XB1PVyF24ZG2cPT6FA85KQvwUJnbIPoeEjrVvpKFvfs1pHP70dF6vD?=
 =?us-ascii?Q?S9rR10SolKIkx+mkmoaJiH0Qp02Cjj5HHXwLJh11DQLrdp9SfYjsW06XEWmk?=
 =?us-ascii?Q?8/mgvjvggaqrTdni8N5g7Z9lDbUgHMmR9ott7rd4IYSgt27qYu9pOy/wk5IS?=
 =?us-ascii?Q?igqxeScRkY2wRb8w4dqlopPrJXK81pXqF4aHNAt32gscAJhU1dpWaJQjR0RR?=
 =?us-ascii?Q?8/asSFfhtKb3wDX9SqiQnLzpiUSUbPiRgYW+79r5P+znAZbCA6AvopWG/3xi?=
 =?us-ascii?Q?GCJn2ytrzPP/OYQHbZTJJ+Po2nBgkFUrFQMKGdX+JyYWREL4MGSwWR5cJH+d?=
 =?us-ascii?Q?Q3nibTGOUP9rXdx+06qd6Vgsiy33sl/aCAdfCkdRRWyHalsK/TMgVX3IyMjp?=
 =?us-ascii?Q?DwD0hCFfY8jw7W8goRP8XMhjrmJ9dgKM7UaG1sfpH24DZKCUmb6yw8q/fUbn?=
 =?us-ascii?Q?QUvUVXKSMeBVPIidT26mY5U75G782fYdVj42tr95lhgnZ/G7bApp9VMiqH1v?=
 =?us-ascii?Q?8jzW8LZz+CPxBgHXV81YsvF9m5JAEs9oHuuLhhL73IwxJ70pi/R5jLusP3O1?=
 =?us-ascii?Q?sabiuzLBKUXxLfhAtfMk/1Gx4wtYYxAJ60PTmfiH5gQNCIuThnwRPaJj+eu5?=
 =?us-ascii?Q?T/V9HiYSsOMGNN2T+f7aO+Dq80kPgfabxPBWpzxKAry/anhsbgTtTpINCk6B?=
 =?us-ascii?Q?pLIFkThZvyLzvBRn+IhJS6d78jN9fJhkf5dKNN5v3+k8apBsmw4504OtTZ4M?=
 =?us-ascii?Q?4ZQffo/30WYx1+056hILdJegBEbnkMy0A8EttSwhlzdcnpiQE1dcMq7p7xhT?=
 =?us-ascii?Q?SpyV/N0sYiO+2U6FDjWNlkxrHqE0XyCWY8GfRCCh1oghbdXCZsm2zkrLJTfx?=
 =?us-ascii?Q?9ogQd/eV04m9+tia/JOYea+caDoVqSEas/HPZ2wJPGVg45iHA2P1vdrPtdqL?=
 =?us-ascii?Q?StzUOvRD4yyz/H48uXyNbeCsfAJRRkZxgg1Xo2BtybIvTDp36LyWGHREp83U?=
 =?us-ascii?Q?MqpQoPz9CuJ3FFMazuCn4C0Xv5TyAA+db8bMo6tuNIWBK26UZjr2ZUjlKogl?=
 =?us-ascii?Q?xZTztl6/Lexbqq4EHKXNZG1awgH88w8vVJO/VghRotAM36SHuQxIM8MgoKYc?=
 =?us-ascii?Q?RA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6818.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5688e315-200a-4954-6bd7-08dd97200593
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 21:56:34.4668
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZpkfkuADPWvLMYD09qN4rt/EZCWa0fiZmarYEyNDZ7aoHyeAtyYNAJBW20uvovtDUgXDmhIQfLrAtvm2WJ1xWss1fpGbi/KCUYqpY72piQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6885
X-OriginatorOrg: intel.com

Keshavamurthy, Anil S would like to recall the message, "Interdomain suppor=
t for CWF ".=
