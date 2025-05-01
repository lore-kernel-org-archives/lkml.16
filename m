Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22E421B199
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 19:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746127535; cv=fail; b=qYZQfMb2DmB5xfgGUsdmAQqpDVI4pPBTnMIXFf62cee7dHdocXMV5Ul1hth/WdwjQzglDvi0Av2KRXKkjsHzUIrvmOsJW69ksBun40uAUHt2wUWp/aozvmBMDQ+yFwTN0fCVuKSQeGKa/BZOM8bfSnNXsLRGCzEFAZm8ZIao1ho=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746127535; c=relaxed/simple;
	bh=mru9DZuDqRttZCiaOc2mhakrbpTmiAuEzxqLY1CTRxk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fLAq7U/Rgz6WWOobonYTRwuV6nctgP5SMO94urDhaEMa767DZKuKu/e4+3lN6tgIgz89FWaZYMCz6bv23VwTtvhsm4wi5DoUe69l8N7G8HF4/oWDzwipl9lPkcix4F+spuf8uthrLUh40xb10JRalKWZV+1DF1SYMsl2JIKCN/8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljeN6ccC; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljeN6ccC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746127534; x=1777663534;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=mru9DZuDqRttZCiaOc2mhakrbpTmiAuEzxqLY1CTRxk=;
  b=ljeN6ccC66q4taoqRPQjU2E+QAdMuwy6B3MCtTtCrFmJWk7kaKa53fdn
   CzkaKEPbINpds1AlXFwmAPU/XEvWTqPXUXKO3LQUceg4guFNJttIUWec0
   8j7C4kX/ITgxCTTKrbP1sC50ldMYJ8FGOAeUM857GSuQY2lNOWJU7x4aY
   ebZPchxjkrHp+8x7ouiNdcrru/wg0a4174oF81QINH/1Y/YeCeuVH43nT
   gAzaAu/1MOmVctHfq3+bfX/e8lYZeQmwIlnKX2OiUqTe6EMBe5yfaDMRm
   TbVy5Bm/uOb6a2/jX35qFtywLeKo3cCD3k4U9IMgZHDTqIGbDiQ0cJSVd
   A==;
X-CSE-ConnectionGUID: KO/oray3RF6bMaI+tLIn6w==
X-CSE-MsgGUID: /0zv8VC5RfSsLkVVu/25TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="59197860"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="59197860"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:25:33 -0700
X-CSE-ConnectionGUID: 1RV/FXAjRaaYf7Fob8MJtg==
X-CSE-MsgGUID: 3+EgCnluTdCUJPfRJ3doTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134959425"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 12:25:33 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 1 May 2025 12:25:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 1 May 2025 12:25:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 1 May 2025 12:25:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrp8G6kNZm8UDfphBp58DRNgTPoW2fF3yw0Y5VGk4sHY6zrYgBYXFn+0Lc0QmDiAhm2HQJlFU0Ipt//jFx3gvEMu0Ze6BPIuAUQWw9g+fYOIdAXzqjkoweiiFWLRL1QPxFYYgVRg0KhJPcSZitGPIje0mhQx0cO3Oz1w5o5sTyllscY3/4HVGf38giVh99xUrfwwHf8UdL7yzXaP5w3cc8JWbzfEiRvZuiD/R3C9wKk1ubAXjt7xNcfrWk7yGKLQlkIHs29evpm1fpJVtmVOUc0NdM9bYhdnNU7BM+22jRZMsj8+CFyjSuwKbe8L5mF049iSk1yRCRiP1v9cnTQZEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sTbJMBCuakL+Zu3181bKwxQPRVSQ6HLf9Vcil4FXvk=;
 b=BvY0kZOD4ULWShgc5fkZ7IrRFntuknh4fYU573MgR2FY1d8WqGihHH7VkyObwZC1I8RFN3b/daE8cfWV9rFoW6/GVW1UecVnIIVX+WhfxSQOA8kYZfHpEsINfaeVo6EDD/5bfALE6VHjp3s4Nu2jZSVfT7sbxOLXBzYq+RmQRTl6wMKGQdCilcNbwpeA3Xwr0zMg29pQAu65LMmNeWnY8nDWZJvKRWIcidTT/XQW1WSgtmptzzIzRmj7co9hPZn21O6tdyPng1x9fZiFIMjxbcu0HpojjGO23+fsD97nO7sgPg0AS8zbeRUnWSEwkmJqRuUc9TA/5S0rWreKsBf/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8107.namprd11.prod.outlook.com (2603:10b6:510:256::6)
 by DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Thu, 1 May
 2025 19:25:27 +0000
Received: from PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8]) by PH8PR11MB8107.namprd11.prod.outlook.com
 ([fe80::6b05:74cf:a304:ecd8%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 19:25:27 +0000
Date: Thu, 1 May 2025 12:25:22 -0700
From: Dan Williams <dan.j.williams@intel.com>
To: Cedric Xing <cedric.xing@intel.com>, Dan Williams
	<dan.j.williams@intel.com>, "Kirill A. Shutemov"
	<kirill.shutemov@linux.intel.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>
CC: <linux-kernel@vger.kernel.org>, <linux-coco@lists.linux.dev>, "Dionna
 Amalie Glaze" <dionnaglaze@google.com>, Guorui Yu
	<guorui.yu@linux.alibaba.com>, James Bottomley
	<James.Bottomley@hansenpartnership.com>, Dan Middleton
	<dan.middleton@linux.intel.com>, Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Cedric Xing <cedric.xing@intel.com>
Subject: Re: [PATCH v5 1/5] tsm-mr: Add TVM Measurement Register support
Message-ID: <6813caa28ddd1_1229d629412@dwillia2-xfh.jf.intel.com.notmuch>
References: <20250424-tdx-rtmr-v5-0-4fe28ddf85d4@intel.com>
 <20250424-tdx-rtmr-v5-1-4fe28ddf85d4@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250424-tdx-rtmr-v5-1-4fe28ddf85d4@intel.com>
X-ClientProxiedBy: MW3PR06CA0012.namprd06.prod.outlook.com
 (2603:10b6:303:2a::17) To PH8PR11MB8107.namprd11.prod.outlook.com
 (2603:10b6:510:256::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8107:EE_|DS0PR11MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4fd4bb-78ad-4e07-2994-08dd88e5ed75
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jOGnQTrRg33OyTe3d3LPQJ4QO5davbtea5GVuEWe9gMwuujNbVzoyAe050Wf?=
 =?us-ascii?Q?PsIpMZ2hsLwh7T5pPw0ObYWq6BynX+LptBfpkiv/cc8gZyRJBAxHcIoJu4QH?=
 =?us-ascii?Q?GM0aMApWmKYcqXo/ViP/BfU+25YU0I6Ovr/Sau3mgD1Yn5K7U2XWyXX6L56d?=
 =?us-ascii?Q?aTT1xJvT5Yoct3mrhUP0/0Yd27l0/BCKcViJySC0kLSn4T6g71teiZtE+Mbp?=
 =?us-ascii?Q?qdmWsaLHs5tjDVFw53gm8CnRPpC/SHvXvAFkpPtqXG2DMHqMBTSteasc9MZZ?=
 =?us-ascii?Q?6nT0hrAxUQW+BhueQJn4//6Hnv4DTYDjEymxf3at4he+FDCXACWPnlvFPRvk?=
 =?us-ascii?Q?ZdLE3cy4rMWjdz/G8iu1dKpQHZSiJp24Hin8WM7mxHm9mMLAOslo3ZUfGp5V?=
 =?us-ascii?Q?rC2Pb0urcOjJ64G3W+vImp9YIVPnnwnJr7z4Td1xjS4JRJmws0Hlq+3TGhCY?=
 =?us-ascii?Q?6ksyrvYN2Yynh0aZty2U0LWZe8e6c6wOzONoPAWq2GWWuTt0/Wg1ojfKD4Ip?=
 =?us-ascii?Q?/fCc9rSTgmRk3CGytOafWyMBBb9umyUKw8hrPPPOdip8F/MlqJnMW3kC8Xhj?=
 =?us-ascii?Q?uUh6XZLhyfBdasswdoJxdzn73gRCse0nunqLYJrJtUx5lTlUvhanr0Pwk/1u?=
 =?us-ascii?Q?YKz59zoE8pcasiwVZE2wEMs5xz0oYcKmUHZaHRoQ4ERDKH7LvzvWQ1YgMQH6?=
 =?us-ascii?Q?LIjpWu0PRtSdOulsL913TNeJoCRvjartYc2Iz41Axr1swVn5zP2d3nkUHcpK?=
 =?us-ascii?Q?oMlH1DiwGs1tIvZH2MO+Xs9ggKWsOX/4875c/esWfD1yv0ne79mUGBiR/NF0?=
 =?us-ascii?Q?kS+jgw+efkdrWZtq01YLz7mIPCWQUVNKLoSezt95n3IC2CnUhSX9cmC/sH5/?=
 =?us-ascii?Q?rmtYMsN7Yacbu3xEPt/+XuFlLpyV2b+b7EO+8fHiLbxM8gWO5nL7Cj+k8fNP?=
 =?us-ascii?Q?n5ZcgAUWj8Pr3wfIeQNN6tPFwCDIQOx2PkE68JocfvqraRpoYtUvy72O0rAO?=
 =?us-ascii?Q?1GSC4d5nuigS0dUkW6/2xn9bbDAc0HOKZPZkgy1F2A088Fllqa8gukA/e5cm?=
 =?us-ascii?Q?+B4deyxhe7/nxT5AH/qHME0kqO+aXcQei+mDW6PJq05U7cCPx8C9NcT1tpiv?=
 =?us-ascii?Q?4c3ERaax+ztOQd6F3SUS3djHvUB3ulVjFaMOO49cenDDxHrWFm/6gKxpbVi6?=
 =?us-ascii?Q?UmoqKUXPGpa1cPK+3maNBDfAjxvPfa8W/Qx0tZ/P1+Rd4A2GRl0A/kkoobe8?=
 =?us-ascii?Q?dH3h0YUMaMcBkoHPrR9FR6aREFNiPMBOk4wFb4W9DCa363wTQkYbQKFecPsX?=
 =?us-ascii?Q?N8mXjxhEBwzOsxyiXTlQ7RpioU/FklqRVjh8sAUH1IC6ljZjE5PS566XOs0m?=
 =?us-ascii?Q?v+MwJ7cD76BVYUDYKgJ0vktd3hOCv6cnpdlzmF5x9y5rnU4Q0GK6cCd/uSZR?=
 =?us-ascii?Q?NpMOI+wbf8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB8107.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FnOFo9ocfHxiOJ0Pn44TMS8p9vcxARdVFIogdhvJ9SHsKekEtztPifHYD/Fg?=
 =?us-ascii?Q?tFLUE5WYUhzTVNS0Re0X/AjZBLo9JeUAKwnARHJMdJUH+OBiOmKf4k+LN1Qz?=
 =?us-ascii?Q?2MSESs+kDcF1b29v7j4wu3ufyRFvAo8FfCbeRds75Z+hoy5dMN3btIS66fCq?=
 =?us-ascii?Q?wOb8jg+qEb0+aXudgb7dfaEeZFDksXPT3rSALdI3a/wyJfbz8RFyBCpEITMm?=
 =?us-ascii?Q?/ol4Al/JbPCTID2qdmCnJ2RD+nG2WzliY9Cdg+zsbCWHA+e5hKef8rBnYrFM?=
 =?us-ascii?Q?FUG+raTMAgl2MkU4xFBBGsL8cwplQtjb45D8Dcev8hc2ndxMafmUVXPGZBsS?=
 =?us-ascii?Q?Cz2st4Qet55fl3m5aWWe6HRt4n6RPEhmIA/MlAlTQcdOQqxKV8wGaUmViIzt?=
 =?us-ascii?Q?otYLUk82hmCWH/2JCConsxy7GE7DT2I9Q4ndbyvSdj0og3CAwMasRDb5/PEW?=
 =?us-ascii?Q?xL9kYHEiwm5Jl3yzAxiXhh+jayJB6oV5pFbDmxDxPXZPWfR/CEdU/dfKx9Jg?=
 =?us-ascii?Q?1r2UgR64CUL8eZx5xE7W87cvx4FRw1jYayPtkFZUUqBDLeodfSDXTItHhu8X?=
 =?us-ascii?Q?Y21xvY/w59BJDDeDWvb40jf3ggyZ1xmZqKFLKEWZmjqINlVzBO/q9/mUHuBj?=
 =?us-ascii?Q?IBBnQnaAO12GQJvvovfjpvhVMkHe136E0vf+gLBrJWGAmPHxDqtZFpZ4JDlQ?=
 =?us-ascii?Q?FYcXpysw2DpojFgdEevbOhpeirK1JmB9wKXknxMfNJFDXtXB4Sw7vc5NRodT?=
 =?us-ascii?Q?Ht7sx7MerXvjvFxGNnk9mzQu/loNQ21JpBYxtbdgJyejGj9oTRSvbQVUwQrh?=
 =?us-ascii?Q?fi5rgGwQg4l2MwrI6UneFqR2nCV6OTQ5Dio7XLAjivjwUGCcbdRetym3A9l5?=
 =?us-ascii?Q?7jyhoUXQqBMuO8DaU19p+irAtb9w90o3BAZePEeZFSd3/Ikv14eXy8f/14Md?=
 =?us-ascii?Q?ozq34q4cXSXo/J91exXPF8iEhsAr4KDuldOIKFsQIdbzvGP7dnTQkneSg8HU?=
 =?us-ascii?Q?DsBc7E3CfL78W5AKkoo5T6Q3I7+yyFrQRdAuoa7rwrOGXuP4h+HnuxgTX74E?=
 =?us-ascii?Q?eApj5/wpX2rodpH7EpsET3FLeTCv66T+2Gf+bGfXBRoo1yGoYC9RhyRaDdyl?=
 =?us-ascii?Q?VoNgX1GGraWVQacGvorj6Oxl+/jgZID41k+KAclSVzRTMLhJ5mdX2cHdceeE?=
 =?us-ascii?Q?+X5yTj3QE2oX15rT06hmo22sMPCUyU4Vi68HoK9NNdI25veZolNwc2ZINFn7?=
 =?us-ascii?Q?Ujc9mzeDnxpsk3tdISRsf2XDDhjH3rqOoktGBdgtNP+RQ9szfl9HriDabCx2?=
 =?us-ascii?Q?QGIpHVxfLK4xsSPapaCkDN10f8hBlW8l2/vqvXDcIRlSwZaQWybvGnbsjHd4?=
 =?us-ascii?Q?5ltUD+EdjXKTA+FiGHWvOJGSA44376flmwhOvF/K6cwWhBKU6IRb7tkaxnT6?=
 =?us-ascii?Q?ahnOEmSaDo5nNIMcGiHVGtL8B2uqaOKOQ/x8rgbRKd6L70EiyVYxoykbxPQ5?=
 =?us-ascii?Q?z+Kjb6Nfi/c3oT1ZBnCCtmZgGvbGUl83/BKwNHdPPO4MEDMmGeHAAq7vtpFD?=
 =?us-ascii?Q?4PMi4SAnaXGD3e8iYDeEMl9jgdwwa1O4tNKKoOPhwR87rKNz1ZaeZ+F9PFYy?=
 =?us-ascii?Q?vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4fd4bb-78ad-4e07-2994-08dd88e5ed75
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8107.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 19:25:27.1877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xWk2NKMwwly+Ick5xg4+K1U7B7qW2uB8i6GR/23DXSOfWHaY5GMfBnFeWNaV/M0LuXolJ4JLxPSTAV8TM+g7jpah2bzwcNT4nmwXBaMLhw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6541
X-OriginatorOrg: intel.com

Cedric Xing wrote:
> Introduce new TSM Measurement helper library (tsm-mr) for TVM guest drivers
> to expose MRs (Measurement Registers) as sysfs attributes, with Crypto
> Agility support.
> 
> Add the following new APIs (see include/linux/tsm-mr.h for details):
> 
> - tsm_mr_create_attribute_group(): Take on input a `struct
>   tsm_measurements` instance, which includes one `struct
>   tsm_measurement_register` per MR with properties like `TSM_MR_F_READABLE`
>   and `TSM_MR_F_WRITABLE`, to determine the supported operations and create
>   the sysfs attributes accordingly. On success, return a `struct
>   attribute_group` instance that will typically be included by the guest
>   driver into `miscdevice.groups` before calling misc_register().
> 
> - tsm_mr_free_attribute_group(): Free the memory allocated to the attrubute
>   group returned by tsm_mr_create_attribute_group().
> 
> tsm_mr_create_attribute_group() creates one attribute for each MR, with
> names following this pattern:
> 
>         MRNAME[:HASH]
> 
> - MRNAME - Placeholder for the MR name, as specified by
>   `tsm_measurement_register.mr_name`.
> - :HASH - Optional suffix indicating the hash algorithm associated with
>   this MR, as specified by `tsm_measurement_register.mr_hash`.
> 
> Support Crypto Agility by allowing multiple definitions of the same MR
> (i.e., with the same `mr_name`) with distinct HASH algorithms.
> 
> NOTE: Crypto Agility, introduced in TPM 2.0, allows new hash algorithms to
> be introduced without breaking compatibility with applications using older
> algorithms. CC architectures may face the same challenge in the future,
> needing new hashes for security while retaining compatibility with older
> hashes, hence the need for Crypto Agility.
> 
> Signed-off-by: Cedric Xing <cedric.xing@intel.com>

Looking good, some minor fixups below.

> ---
>  Documentation/driver-api/coco/index.rst            |  12 +
>  .../driver-api/coco/measurement-registers.rst      |  12 +
>  Documentation/driver-api/index.rst                 |   1 +
>  MAINTAINERS                                        |   4 +-
>  drivers/virt/coco/Kconfig                          |   5 +
>  drivers/virt/coco/Makefile                         |   1 +
>  drivers/virt/coco/tsm-mr.c                         | 247 +++++++++++++++++++++
>  include/linux/tsm-mr.h                             |  94 ++++++++
>  include/trace/events/tsm_mr.h                      |  80 +++++++
>  9 files changed, 454 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/driver-api/coco/index.rst b/Documentation/driver-api/coco/index.rst
> new file mode 100644
> index 000000000000..af9f08ca0cfd
> --- /dev/null
> +++ b/Documentation/driver-api/coco/index.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +======================
> +Confidential Computing
> +======================
> +
> +.. toctree::
> +   :maxdepth: 1
> +
> +   measurement-registers
> +
> +.. only::  subproject and html
> diff --git a/Documentation/driver-api/coco/measurement-registers.rst b/Documentation/driver-api/coco/measurement-registers.rst
> new file mode 100644
> index 000000000000..cef85945a9a7
> --- /dev/null
> +++ b/Documentation/driver-api/coco/measurement-registers.rst
> @@ -0,0 +1,12 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
> +
> +=====================
> +Measurement Registers
> +=====================
> +
> +.. kernel-doc:: include/linux/tsm-mr.h
> +   :internal:
> +
> +.. kernel-doc:: drivers/virt/coco/tsm-mr.c
> +   :export:
> diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
> index 16e2c4ec3c01..3e2a270bd828 100644
> --- a/Documentation/driver-api/index.rst
> +++ b/Documentation/driver-api/index.rst
> @@ -81,6 +81,7 @@ Subsystem-specific APIs
>     acpi/index
>     backlight/lp855x-driver.rst
>     clk
> +   coco/index
>     console
>     crypto/index
>     dmaengine/index
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..1d1426af3a68 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -24616,8 +24616,8 @@ M:	Dan Williams <dan.j.williams@intel.com>
>  L:	linux-coco@lists.linux.dev
>  S:	Maintained
>  F:	Documentation/ABI/testing/configfs-tsm
> -F:	drivers/virt/coco/tsm.c
> -F:	include/linux/tsm.h
> +F:	drivers/virt/coco/tsm*.c
> +F:	include/linux/tsm*.h

Should also add Documentation/driver-api/coco/ here.

>  
>  TRUSTED SERVICES TEE DRIVER
>  M:	Balint Dobszay <balint.dobszay@arm.com>
> diff --git a/drivers/virt/coco/Kconfig b/drivers/virt/coco/Kconfig
> index ff869d883d95..737106d5dcbc 100644
> --- a/drivers/virt/coco/Kconfig
> +++ b/drivers/virt/coco/Kconfig
> @@ -7,6 +7,11 @@ config TSM_REPORTS
>  	select CONFIGFS_FS
>  	tristate
>  
> +config TSM_MEASUREMENTS
> +	select CRYPTO_HASH_INFO
> +	select CRYPTO
> +	bool
> +
>  source "drivers/virt/coco/efi_secret/Kconfig"
>  
>  source "drivers/virt/coco/pkvm-guest/Kconfig"
> diff --git a/drivers/virt/coco/Makefile b/drivers/virt/coco/Makefile
> index c3d07cfc087e..eb6ec5c1d2e1 100644
> --- a/drivers/virt/coco/Makefile
> +++ b/drivers/virt/coco/Makefile
> @@ -3,6 +3,7 @@
>  # Confidential computing related collateral
>  #
>  obj-$(CONFIG_TSM_REPORTS)	+= tsm.o
> +obj-$(CONFIG_TSM_MEASUREMENTS)	+= tsm-mr.o
>  obj-$(CONFIG_EFI_SECRET)	+= efi_secret/
>  obj-$(CONFIG_ARM_PKVM_GUEST)	+= pkvm-guest/
>  obj-$(CONFIG_SEV_GUEST)		+= sev-guest/
> diff --git a/drivers/virt/coco/tsm-mr.c b/drivers/virt/coco/tsm-mr.c
> new file mode 100644
> index 000000000000..adc32328018e
> --- /dev/null
> +++ b/drivers/virt/coco/tsm-mr.c
> @@ -0,0 +1,247 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright(c) 2024-2025 Intel Corporation. All rights reserved. */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/sysfs.h>
> +
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/tsm_mr.h>
> +
> +/*
> + * struct tm_context - contains everything necessary to implement sysfs
> + * attributes for MRs.
> + * @rwsem: protects the MR cache from concurrent access.
> + * @agrp: contains all MR attributes created by tsm_mr_create_attribute_group().
> + * @tm: input to tsm_mr_create_attribute_group() containing MR definitions/ops.
> + * @in_sync: %true if MR cache is up-to-date.
> + * @mrs: array of &struct bin_attribute, one for each MR.
> + *
> + * This internal structure contains everything needed to implement
> + * tm_digest_read() and tm_digest_write().
> + *
> + * Given tm->refresh() is potentially expensive, tm_digest_read() caches MR
> + * values and calls tm->refresh() only when necessary. Only live MRs (i.e., with
> + * %TSM_MR_F_LIVE set) can trigger tm->refresh(), while others are assumed to
> + * retain their values from the last tm->write(). @in_sync tracks if there have
> + * been tm->write() calls since the last tm->refresh(). That is, tm->refresh()
> + * will be called only when a live MR is being read and the cache is stale
> + * (@in_sync is %false).
> + *
> + * tm_digest_write() sets @in_sync to %false and calls tm->write(), whose
> + * semantics is arch and MR specific. Most (if not all) writable MRs support the
> + * extension semantics (i.e., tm->write() extends the input buffer into the MR).
> + */
> +struct tm_context {
> +	struct rw_semaphore rwsem;
> +	struct attribute_group agrp;
> +	const struct tsm_measurements *tm;
> +	bool in_sync;
> +	struct bin_attribute mrs[];
> +};
> +
> +static ssize_t tm_digest_read(struct file *filp, struct kobject *kobj,
> +			      const struct bin_attribute *attr, char *buffer,
> +			      loff_t off, size_t count)
> +{
> +	struct tm_context *ctx;
> +	const struct tsm_measurement_register *mr;
> +	int rc;
> +
> +	ctx = attr->private;
> +	rc = down_read_interruptible(&ctx->rwsem);
> +	if (rc)
> +		return rc;
> +
> +	mr = &ctx->tm->mrs[attr - ctx->mrs];
> +
> +	/*
> +	 * @ctx->in_sync indicates if the MR cache is stale. It is a global
> +	 * instead of a per-MR flag for simplicity, as most (if not all) archs
> +	 * allow reading all MRs in oneshot.
> +	 *
> +	 * ctx->refresh() is necessary only for LIVE MRs, while others retain
> +	 * their values from their respective last ctx->write().
> +	 */
> +	if ((mr->mr_flags & TSM_MR_F_LIVE) && !ctx->in_sync) {
> +		up_read(&ctx->rwsem);
> +
> +		rc = down_write_killable(&ctx->rwsem);
> +		if (rc)
> +			return rc;
> +
> +		if (!ctx->in_sync) {
> +			rc = ctx->tm->refresh(ctx->tm, mr);
> +			ctx->in_sync = !rc;
> +			trace_tsm_mr_refresh(mr, rc);
> +		}
> +
> +		downgrade_write(&ctx->rwsem);
> +	}
> +
> +	memcpy(buffer, mr->mr_value + off, count);
> +	trace_tsm_mr_read(mr);
> +
> +	up_read(&ctx->rwsem);
> +	return rc ?: count;
> +}
> +
> +static ssize_t tm_digest_write(struct file *filp, struct kobject *kobj,
> +			       const struct bin_attribute *attr, char *buffer,
> +			       loff_t off, size_t count)
> +{
> +	struct tm_context *ctx;
> +	const struct tsm_measurement_register *mr;
> +	ssize_t rc;
> +
> +	/* partial writes are not supported */
> +	if (off != 0 || count != attr->size)
> +		return -EINVAL;
> +
> +	ctx = attr->private;
> +	mr = &ctx->tm->mrs[attr - ctx->mrs];
> +	trace_tsm_mr_write(mr, buffer);

I would have expected the trace to be emitted after the write succeeds,
otherwise this tracepoint is "may have written" vs "write".

> +
> +	rc = down_write_killable(&ctx->rwsem);
> +	if (rc)
> +		return rc;
> +
> +	rc = ctx->tm->write(ctx->tm, mr, buffer);
> +
> +	/* mark MR cache stale */
> +	if (!rc)
> +		ctx->in_sync = false;

...also, putting the trace here means the trace event is known to be
ordered by the rwsem.

[..]

Other than the above you can add:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
