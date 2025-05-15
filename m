Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2047.outbound.protection.outlook.com [40.107.93.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6740038DD8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 21:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343767; cv=fail; b=cjWMVXh1K3G3aZgEmCxdRQQwo3kWH9Q9N2GC4S5TJHW+3hm60bmg1AAp5qGNFqmtM/+0/gTsZ0mXOFG6cc7uXMgi0aOkrW8/SEmS34F9fxH9TFpmVuUls/VMFEUtfZEKR6JZPDnWyYPAYyDP395/x1AZVgkzpDiqnkE0Hcbv8bQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343767; c=relaxed/simple;
	bh=zMENmJ0HrshmJ84feq3e+huGcJAp1a8BiS1lh7U2g3k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=gu1Fxz1PfEJgFgBnze71cutMLWh394vVeVRaY7lUjUljDtjEKm3vZaXDD+9grbKawHWpyl373bU6dff9jr4wKtdj2JphNCFtITjID2DW481Ck8ScOtmXJlWBBGtudhU4yOM8prCIvM702aOIXj7pMIaE4psHuB62awSphaIj/Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Zt817pp4; arc=fail smtp.client-ip=40.107.93.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Zt817pp4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooJzxy0x4/8l/3Rr1Hgr/mgUNulvBWCdjnM2tqluZVU9S/s1WxP6ZEen4yYGlpaNkxtCuqeWffs2CxvC4eYb+Q7S6hy7/l4r9RIkq5hmKBVGnbLwV8HdmE8RQTL+rxR/4hyduZClIVTjBUvvbcaaQ4u9Pmpk9Qlvl+TGVPgwP/qsQqwkaI+uOZWhn15jOVY6DsVoHE/cOgMDQvSPJkaotU/Xm64d2mOhiGtV5vusy4fetLTjzgVBVNGzBOuai2diUToPu9QskPi9NxQIAhUqf/KTUrC8Vo0cC2Hn5OBwXpX8s2LAssL3jhEPklazWNmDdXI5+CPUAu/CRIjwM85dPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wN4WdUiQEbviIiUvzwIa/M5nSd5jXoNACNPJDyWisv8=;
 b=fbHT6/MQxc5qANZSivzBic0zQxINmCETuZ2hPwd//EaJ1MiVrh/QcKZJ7gymNf00sVqCUTnL7qbn9rGowMVbHNwiUeZmnFIPlX4VpVXGBkprEzuyshA/84UHJijdFfy/nlZJQ3875lOswi4JTRQuGSMF36x/zP1YdZREWO91t6Ww0Cx8rfkwkRBNbpXiVO4qOcpOvoqCwZankDdke3fHIB8AU5oVy71CaKDBBrYz9qGDwFJH3G81+TX6Zu9KyBWiupaPcLU+zmy8qkc5bOPSlMNSfr/EfynQc36+81ivNAvY8TpZEj8JIAP2pxqzCOESyXPCmnjO/0T+iK/oIPOjBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wN4WdUiQEbviIiUvzwIa/M5nSd5jXoNACNPJDyWisv8=;
 b=Zt817pp4n7An7+LS7lvsxqigTDxJVdfHjKEWF8FWrOyteILFnpUP1TWpcF3AkRGmL5O4vFt/WxfZ3GKpLIb6bM+8ARcpjCFK2x2GGGk/jz81iFD5zauNtDLzzTcl0o4nc2cVzowvGXMhryFRGq2Gy5h4rBjX4O/Cxu4omelK4Ps=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by PH0PR12MB7470.namprd12.prod.outlook.com (2603:10b6:510:1e9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 21:16:00 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%3]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 21:15:59 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] x86/bugs: Restructure ITS mitigation
Thread-Topic: [PATCH] x86/bugs: Restructure ITS mitigation
Thread-Index: AQHbxd3+DF9rB1p9Bkyl6Afc/NsLxrPUMKzg
Date: Thu, 15 May 2025 21:15:59 +0000
Message-ID:
 <LV3PR12MB92655C23DF46F1F3B88139009490A@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250515134756.93274-1-david.kaplan@amd.com>
 <20250515211159.njyxgxuxmyhqx46m@desk>
In-Reply-To: <20250515211159.njyxgxuxmyhqx46m@desk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=13144014-0015-4bd0-8827-dbe8586c8dc5;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-15T21:13:28Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|PH0PR12MB7470:EE_
x-ms-office365-filtering-correlation-id: 2264970f-a1db-416d-fdff-08dd93f5b092
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?mIcNP9DLTiVt4cibNGlpdomPv/Pp0bKL1biATVpEO2E4K8wb2dEHHmQR/yFl?=
 =?us-ascii?Q?J2UaIqYzEXafpJs5FmUZqpSJ7UzL1eyETFQRPHsEkVewloRcnklgMPJt4CNu?=
 =?us-ascii?Q?9aD2ra8guELWKmDaRukWzPPM8LnvOj59yPZ//zx/JS9o4JqvG/yhNnp5BT+D?=
 =?us-ascii?Q?iPwc4fMdQoNk4csLaSSz501GKYu7b4zK0zG2jXt1FESh+S9fku8MrIpW56AI?=
 =?us-ascii?Q?1xsd2+ArNkgMXUj4qTtj9izqsIp0pOxAoD9Yo9Xy/iUmBvc6fOTL7X3QaiC5?=
 =?us-ascii?Q?ZBwW7Nj+loIlvukN7XEkVQSOLdreNkw+PSAXr9NEZh5TyF3EfxNHMCJ4gnS8?=
 =?us-ascii?Q?89nnrVmADBSLDQ54cjPduhPIITknpKpKlEsCWwU4sIRVSCV+YAKCjkbvf3t2?=
 =?us-ascii?Q?H/O2CUIOlSNNLM6mu9x4t1/ULX5Sec5Xy+KMLwtFG3AI77SrDFAKmmBcqjgD?=
 =?us-ascii?Q?D0lmMJNOOB8316W0RDL+ne7CinRSWq5jqvo1tQlDZJ8ldMIfsLl+zBoFZmnM?=
 =?us-ascii?Q?T1vUZYgHXXsjf70GEDCpkAqrua/bqq1BcEbgplcqP+fyPqf8h0vv5PRCupXP?=
 =?us-ascii?Q?jeTkwjuW8aFbngiLgcKIVurpes3pd90y4wd001VntPuAw8rs6ORB/A4Fy4Se?=
 =?us-ascii?Q?C2rlU1SJIXT0WvXljYVL7WRt1aRYck7XH47HJ8lff2HApGWQx00aBHIQ+liU?=
 =?us-ascii?Q?tvL/pzxuQ53X9P4Ycai4TlXGR0cKvP6aRNUOaBQd52//tqXARDyvhIaAOuhN?=
 =?us-ascii?Q?m+i+mmKe6WYGz85Nle5ODUlrIoCHKXBx7y8LobgOziqx4L1L3iXj7mc/35Yg?=
 =?us-ascii?Q?nkbPKsEhCG/JYdIQVhRumqecJGZwpAX0dm+XVY/RQvA9ODlaldoSFNoDhADT?=
 =?us-ascii?Q?tGq9uZZBtnzx7EnUm4+Mj3U8hN5G26G+ZA2De0RdvRT0CrsEsmk/+FMjzcFS?=
 =?us-ascii?Q?e1bh4/utKwdSItWsLy7S+DGLwhPaMB0UDoGi/SbqmhOW/7MRLJG2HsmFWY/S?=
 =?us-ascii?Q?rz/Dx+akASJQ2OnyVDifCeGrwutK5tUNompiG+dOnoPJCLmGWEhhR2Rt/RDG?=
 =?us-ascii?Q?e43SlWFadGAPzNyP4ySXt/D+as1H4TfqMmVIu0nOaF6db8he0brbSwXsNANZ?=
 =?us-ascii?Q?Wn1tpw6Pr8lBvTLjZoPbRicereggTAK5uTCI2p6lpDTvOeQl+62wdaeXGGF5?=
 =?us-ascii?Q?CcAPRRZshLvgQiCwmLYn2wky0Db/8Bl55beThqEkhVWN62IlKaAkQX9aiUaM?=
 =?us-ascii?Q?a6fNA8BspRPYFQLAZj1RlRcFlb/RYd3Xz1zNR8sJFs+Qv4hz67NvQ4/RznaB?=
 =?us-ascii?Q?sTQO3suc456R044WRXboJKmEApwAdt2KldaIwGFAWveHpDfdkBbiLoE2s7Iv?=
 =?us-ascii?Q?kz2E2gu6RU3h/MHbvZv+OF5FL66R5MERairX9mUcnN1mxaQrNZMw14VJlWvy?=
 =?us-ascii?Q?YMANk3ktcMIiPpM6g3X/YIU+KEhgcO65wyHnEfJ3PpsyxSb3o99caGzQLcNO?=
 =?us-ascii?Q?KAjtJhX0DkkVUkU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?DBkQOKmbzomOCzuWosjVVGf/5iR6bwPKi//+Oau72lF4OMLWt1KjD7dYtSs1?=
 =?us-ascii?Q?ymyUE+PFPJ91YJJ7rJ+v8Ihah2zdEhqW12Bg8RDcvLc6G4R+FT42+x740J0j?=
 =?us-ascii?Q?yLLNQV1U8RF/BPq6UJiahTNzvam7AvC6GN3CWsxaCqwQwSEG/03RW1ADj57W?=
 =?us-ascii?Q?sA+AtL7aKTA2XMMpK275rvg3npwPyGeDQTseniB6/ENnOcMW9BhScA/Aktn/?=
 =?us-ascii?Q?c/e4eozXLXBOjpWopqKdRt3oapAe7tLOcUkEVWqe1lnbjkQO5HpkMN4beCni?=
 =?us-ascii?Q?umKOtjEQRDvyR/i8z97T+R+Ult6hxtdqBkB03VjE86ui3HVB968R221aibnD?=
 =?us-ascii?Q?g2hTrWRxZNXP4qfuRCiB92XifAHCI/LrGrpDb4PI0e6gbrjbmYj0a4YCpjtK?=
 =?us-ascii?Q?iZow5EcX1s+rMG5N/r6ugnlFXqekMxt+o5MEDYn3UdcHdNPtJikNy9ywLpdz?=
 =?us-ascii?Q?SW13B5JCtn6vKeku3oZPx5FTfAQF0TTsTtFXiVdzgs5F1zbmsYWBAYKfE1Xn?=
 =?us-ascii?Q?YYfa3j8Fmw8b3fjZwdf+V4n+hdf1kTsLnCDF9U2su84HatZ6APnOfZMDj4vm?=
 =?us-ascii?Q?vfq1zsp7SfUp3nJfJ6GcivEEJMELWxjHR9+Wjtm0dBjGtEwiWA30Jp0kd26E?=
 =?us-ascii?Q?3cdo6mTy70c80PBdX0Q1GFiwQOZxUz+VQcdXN1Gs6srKB0q3piouNYHCO6QE?=
 =?us-ascii?Q?jQXE24jjbnmEZmgyqpkzDyNeRUEWnMa8ooiEmsl9oqD3+be2kq4DUrDE8oK0?=
 =?us-ascii?Q?Whd7vcxG7h//hen1LhRSmiSJIScW99UPhsnSrgF8Bj5Xtc9Phgq/PH1ll2p4?=
 =?us-ascii?Q?NBeGsil5A31iBBuBgJoHuandzi0gTPzVu0cPoyv8BEKwypsPTnoX+c4sYBdc?=
 =?us-ascii?Q?IGz79aivEOE21IO+9Dt9EVV4aVsSnzTDGXy+yvR8zSvKdKbtzfL5rb1iv0O0?=
 =?us-ascii?Q?ETB3fQ5+WOQwtEM0u80GqkklGRw6yspDDqUd+NtS19A23OjCLTcq1Ba/aZXs?=
 =?us-ascii?Q?VtDIu1WncawGq6RNq/xJqhQbj62AbdynUWT1HuY8E+L1YquZf7f6n9hjNs0x?=
 =?us-ascii?Q?OCTDXw4DK7yIPYu7wvm/8Qj+5HS3k0DV5kduw3SAPL66+WpUBEEBCqj9tBEv?=
 =?us-ascii?Q?yKLp39VqSSXS7zQdNseapFiL9nQv2Jeph2NK+TzdA1YJf48M1eq+Q/OByP6h?=
 =?us-ascii?Q?LafvxgOsE4uLziDA21SlW/vTF9gSqfkeMUbY9mMafHHqlflbbP1NRPSIFlWc?=
 =?us-ascii?Q?6sjKPs6yVQtY7DuMlyBUIpiY7e8llJ6VKEXE/d15J3PiR6l9nKPIwIsK4al+?=
 =?us-ascii?Q?AjdlNASVJfTc6dGJ8KBSEdpFDNHHDdeXN6gUf//KqirQSAr/frIV07f+ob7o?=
 =?us-ascii?Q?xHjyvpqCYOXzD/w/tl86N/2GV65qZMOTntlhXFj5f+AO9BK9dUCf8LbECZSl?=
 =?us-ascii?Q?PL97vROKg3V9zp4wA5cnnuBxyvPkmn0iEJkSeBpJHoKL7RqjG5+lgbWI6Vkk?=
 =?us-ascii?Q?AtUUca+JGiqVqUJnF8l4SimEdGZQr2k9K7TPUhmAnepJ4y1yuOA3+7pqHb28?=
 =?us-ascii?Q?KJzoQ+XKtqQUXhpvXYw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9265.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2264970f-a1db-416d-fdff-08dd93f5b092
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 21:15:59.4631
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dFx72V2qYIxOYeln+0D+bwVF3IA8TPTnHeu9BSnWBlSCkCgUflFfs4z2uJMtFpuS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7470

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
> Sent: Thursday, May 15, 2025 4:12 PM
> To: Kaplan, David <David.Kaplan@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;=
 Peter
> Zijlstra <peterz@infradead.org>; Josh Poimboeuf <jpoimboe@kernel.org>; In=
go
> Molnar <mingo@redhat.com>; Dave Hansen <dave.hansen@linux.intel.com>;
> x86@kernel.org; H. Peter Anvin <hpa@zytor.com>; linux-kernel@vger.kernel.=
org
> Subject: Re: [PATCH] x86/bugs: Restructure ITS mitigation
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Thu, May 15, 2025 at 08:47:56AM -0500, David Kaplan wrote:
> ...
> > +static void __init its_apply_mitigation(void) {
> > +     /* its=3Dstuff forces retbleed stuffing and is enabled there. */
> > +     if (its_mitigation !=3D ITS_MITIGATION_ALIGNED_THUNKS)
> > +             return;
> > +
> > +     if (!boot_cpu_has(X86_FEATURE_RETPOLINE))
> > +             setup_force_cpu_cap(X86_FEATURE_INDIRECT_THUNK_ITS);
> > +
> > +     setup_force_cpu_cap(X86_FEATURE_RETHUNK);
> > +     set_return_thunk(its_return_thunk);
> > +}
> > +
> >  #undef pr_fmt
> >  #define pr_fmt(fmt)     "Spectre V2 : " fmt
> >
> >
> > base-commit: 04bdd560124ec4d02d1d11ee3abc88d51954d7b8
>
> I am having trouble applying this patch to upstream and tip/master. I can=
't seem to
> find this base-commit in Linus's or tip tree. Please let me know what am =
I missing?

Hmm.  I was working off origin/master on tip.  This was the base commit in =
my git log from this morning:

commit 04bdd560124ec4d02d1d11ee3abc88d51954d7b8 (origin/master, origin/HEAD=
)
Merge: 61e94712bb24 e59236b5a09e
Author: Ingo Molnar <mingo@kernel.org>
Date:   Thu May 15 10:16:23 2025 +0200

Not sure if something happened to it since?  Or is there something else I c=
an provide to help?

--David Kaplan
