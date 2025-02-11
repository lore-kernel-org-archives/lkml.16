Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65295253F1E
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294243; cv=fail; b=c5Ca4A4xZaDxE8uIbCN4vC0KFvCsHw+GJ6kJ1At7FpGG7Vm1OTVcTLaugrEOf8Kkl7rxHTxp+6lJjXlYgs8okYZscJerQOCZNmyV2EVCdtPJd6P588wC4MwVVMHsMfRm2nS3c5Gfb65f0o1vryirMuj5co+59Jhsikm7T93nJDk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294243; c=relaxed/simple;
	bh=Td5kXoFlrJLylQeq5aJFHrCea/w8+WfmnvQw5j8yTOc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pz11sPjtaPGjux4fYpLVKKim5aZZX/yZKBNH/QRhKxJ80bjuhl+Zt3I9nlmVNJbXf7Xq3G/3GGusILuvD9H4PyMoQgwPTMVx1nAZHGWXcsxxY5KpKM7GYRUd+vBmqBzwjO5Z9EDjA8UQjYUc9GGlA6yZPCR6GfWKwuUeOG4jVAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ds0DnDzn; arc=fail smtp.client-ip=40.107.237.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ds0DnDzn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UyvVt/L/Q0Z6Y8VwMnFAE6VNy56NQGn03hy5NmlfJSQtJ+R+3d7fg0Fco1Zw3wajFc2L1QmGgIDIz8DRgJ8iuXQRQTfVRG1AdyJ11dgp7kK4um3RaI/rkpXhLOk91nZzM5HODS9g5K+j2xujSPG3FgmRH/4HJpcCHxuFfqIQOlpwBhnIdpUy390iZIbkt1Ak8aZfxfke1GC/mPnLkskDd3BDh/i11wiLwJmINJMlVLEVfTj3OpLPJY1TPgr8JK5OMrQ9V3gAqOXTtvC7Eu13XoFroTH1ZfcnIJxFAmCQErFqE2ciNZexY2LBNNiqCl/DhrHfigUzipIdz1HV4AWdUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zVXtDdFl5UyQ1NVzcEjTLBBYuLxeyk6DoY6rsPEnT+Y=;
 b=lV6FvZ4oDk4uSbg6tyojNloexkmT7xcHUvWkHS+kreNe3E/h7WcM6Kx5eb4JM6TTCSTIejAd8CX4OiH5VIUBwPLx+IZA7U5iPevJf+fqExFSAprtQto2w73/6Jfkk5GcwSj2HkSP/5YoLRNupNnMalxKbdkDruyfJQqkiX6AOFs3aEodfk0uaTb/uugcflxxqnAcc4OVN1MwMk1tup++xtRDXE+Av6/xk+SIShncpVRZMGMo/kXeSUc972ERez4VWhO4/n+UK1bTuW+hAVzXz1hBV5OTQJyLdy7q+bxCglMiU9BbbxbtkBV3pGmUBTKGZPHQGhBx5/JIvg7MUemTaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zVXtDdFl5UyQ1NVzcEjTLBBYuLxeyk6DoY6rsPEnT+Y=;
 b=ds0DnDznhPXUu0SFAXaqUwXFiZZNejeugQyRzhPT7APkcX5VOgZSU8GuWMKuOgbdtG/9mV2+1YuqHfVOsqlvzGixrf1/JvmPzyyNxjx9zkdzUPBOUoBxjs0eP9XP045vyx/06MotbBsyGi5KNz7/O7IoU2Q8qeLr0fZoF6uSaQI=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by SA1PR12MB8722.namprd12.prod.outlook.com (2603:10b6:806:373::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Tue, 11 Feb
 2025 17:17:15 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%4]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 17:17:15 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Thread-Topic: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
Thread-Index: AQHbfA4my9zuLka1r0eSeaCd5k3O1bNCVeMQ
Date: Tue, 11 Feb 2025 17:17:15 +0000
Message-ID:
 <LV3PR12MB9265E7765694B3755E924F8494FD2@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250108202515.385902-1-david.kaplan@amd.com>
 <20250108202515.385902-6-david.kaplan@amd.com>
 <20250210225016.cosuartrzzuaftqf@jpoimboe>
In-Reply-To: <20250210225016.cosuartrzzuaftqf@jpoimboe>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=283becc8-efb5-4482-8907-228d3512bc97;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-02-11T17:04:23Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|SA1PR12MB8722:EE_
x-ms-office365-filtering-correlation-id: 4fd8d362-9b8f-43b4-4b7d-08dd4abfee3e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?noUzJHxqTc0eRzr9+S2DIGLwPRUrbqXLThNAqZ8nB7xxJSTOrBIGkJvZ5gqT?=
 =?us-ascii?Q?CRPkcnx5RmrikqJJU+bCtjVxWk5GnFuBHZt7fatgWSBzf0IunxFzjK2bKQWy?=
 =?us-ascii?Q?jVkh80y/p7WkFmm9rIAUpnnjNnIhMwekN7W71f2ddHZtPMiuRUqhfe9lDjEs?=
 =?us-ascii?Q?Yw8GEBEXmBwoh7dxhqm0fewhlXYfRKciXq/pUQ7TwLTeH8lZyU0moG94E4+L?=
 =?us-ascii?Q?oUh5Zo5g/vVulC5x4Kx2YjU/LcQ43qr9D8dGjetOiLyYKD/odusC3PeeMSze?=
 =?us-ascii?Q?/U2jAKT+O1B3VkJOfJO3g5k5ddUeezSglY8lW8E2D6pA5P5JepE3xMeV1Xly?=
 =?us-ascii?Q?See9HxT4gZW/pLgpAYGxc95eCZFNl5Z7gvNuLEQtbfcOfGPwgfLEY2Mg5jH3?=
 =?us-ascii?Q?1UldTp4wY76jDji1ozMDjHWgWlKSZ8Nd5MJquqchYaPyJpFAok/bZS4DQOXR?=
 =?us-ascii?Q?u+uiQPCUAFK36E9Tzo/Fgk3Y5dyx+Iwzo5veZHyJbHQ0I+FvugTiVybe16ZP?=
 =?us-ascii?Q?O0LO8dwmFX2Odxq6wyEEvl+Lsr6CqxvFPuUyDzb8I9UoPz5W6R4VUv5dGJkP?=
 =?us-ascii?Q?mU9vjjrhOUrebGmN+RE/vUC3FLhQspxzLdHTi/50mvN/F4WaUpXoGqzkwSQb?=
 =?us-ascii?Q?Yj/8knAe3w+vlCVh6e0RzBEwFxphFGVWs3KT//gy8kwdMEOOJlBmu2CEDhGX?=
 =?us-ascii?Q?dy2p6H3gviQWpG4ffBBcULHga+DJAm+MYndplo27VBcq28dPl0D6to7ZLqoP?=
 =?us-ascii?Q?5s+/LjhpOvRBcEMuQDaT7Mp2KLrxt9kVuqqfNIL5k/tIi6M2Boj4Qw4rK1RN?=
 =?us-ascii?Q?v/6CCDzAFLluumCvggicFoX5v5G19TOgbuXDbmLob0dCy0pEEeiuwTaWJyzL?=
 =?us-ascii?Q?yIJCEv8d5Vkx08/xOZBihgZdumKPFx212x950utJ4fbC8yb7jLAP5W3UNdfF?=
 =?us-ascii?Q?Ii+gzKveVrO7tg1FNQtZ+RcVc/1h6vmpz5F2PDOgMkUvVZuWJM1vcC7IG/7J?=
 =?us-ascii?Q?oZqIssZhrHqozxEBSFFi1zf0IWNr9QS2oo/8UBrDxZ5n0pCZCMwT6nfGVhTT?=
 =?us-ascii?Q?QUUZ3vheAIxJHEEGXWKwHuDJO43sDJmbCM3kmSC/RMyjZbFQKSOKAQKv+Xg0?=
 =?us-ascii?Q?fnv1gwLBiyVi9r9k5A4PpR8ihEnyVLvYeaCJIDVnebez41lhQGHgZ+EePfJO?=
 =?us-ascii?Q?SXu59bKz8HR91cQSrg5hNp6bsuqMVvxDrh0mA1svzkuDYGg6PM98cblGBUSt?=
 =?us-ascii?Q?DjrfjRvLV7nyYZAL/7oPnQY4z5p+ANH6bIopS9V6TRxvZeQJKZkvLUQChCBQ?=
 =?us-ascii?Q?MNosHU1MAt8UnOMikZJAoZnA9S3+8NCOOeoGalamvySayPRovo9b+sal9rhN?=
 =?us-ascii?Q?hJKekYB7dZOjUrtTziYrtUrEs82bF0i52pyZsWoSJeHaUf5Jn7fiLqJ+UlEj?=
 =?us-ascii?Q?LMFBHHJEESSWEjaSnLnOehlSo6CSCGkU?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hOZYVHYM7CEUa+DAKtXeiOJ4vRw5g/LL0seZWwTC7Vj+EV25s09uPJmBao4t?=
 =?us-ascii?Q?ejed4wLm+sYNAHVnfNX2dlKQ6WmWaZGM03xDt2LqVGYWPHPhRr7y8LzOjjvU?=
 =?us-ascii?Q?5K9hGtRy9KLPXu/PiDy94KFAWPSON3PlHIH/WL6kqIddSRS5vQK6F1qnt5hk?=
 =?us-ascii?Q?hjr6R0Oa1TZUMgKDYusgBEkKJlPigo1ZnKRumrpRLIumA1QW1N7a/GM5dGvA?=
 =?us-ascii?Q?7q1xDKrBNBYs6v+xm4ys7V/VdUIuY/ubu5KX/B94RAxEZ9cCo/Ji0tRccNhW?=
 =?us-ascii?Q?0BM2BJDVriGUQrtSsBVBjjTZoeZ4C9Szzp38lTfCLdWqORil9tZmTs/XUAD4?=
 =?us-ascii?Q?MxS4FqSlVYIn+d+xNrf3Jz2WzMSVcZVwlrfXWYg2NqIUCfkRKNuo6DltEEzC?=
 =?us-ascii?Q?ynRj4rw+52GmSGfqJXXVrlFcAnk24n9EkjokTehhEjzemavR9aYNFWMvjSRw?=
 =?us-ascii?Q?GH8rdii/zOjjUIFAjpJvjQqD3tQzeQujOjMuf0V1SktaSy7C3ecO/aeW+Zo+?=
 =?us-ascii?Q?6cPWBUkIxLMTJyWHbROsf40necnNCc3ppxUM/296eQPd1Vp202pOhnj+tqjt?=
 =?us-ascii?Q?ImlP38mxFiFSWxYgpWSlgGsGmURFwuU/kgDcgu2SI73jpeYa4AYlTStVAwX1?=
 =?us-ascii?Q?Kl3pluTelOuaCYLNUQyyHK4a78KLMZHgVHmfo3EdNrBvP6fhETRDGby9R95n?=
 =?us-ascii?Q?tixqXt9LrkRJz+Nf5udHqdifboaMP5VLaWo/rKHwOCP9lBAjPjcsUxAk55cp?=
 =?us-ascii?Q?XWqpk1GlcinGTp0MmCaU0io8MSSMtKH3iDMDFcpBPtTKn0abcou8/wQfKav1?=
 =?us-ascii?Q?kMxq2W4C5YDyRy5JQZRYoY5BitD2uUH/NPTC5O+lztY1ra6ANYlmzJ1zspZP?=
 =?us-ascii?Q?35/iVpWhvLtT/OlNdPbbLaNJ5SbsRMjWYDd6qoGnWbV+V10Xya+jD37DJHmo?=
 =?us-ascii?Q?nw+GMu9lAyjuI4q+IIw6k4NJtv3kC56FcXyOOTR031r1tePEnByChV9tL83r?=
 =?us-ascii?Q?T98p8S54kEcKldpC/xtsI2x5v+fDkARYrZxfdNdZJExMCf2JyFuFPKhLcfx2?=
 =?us-ascii?Q?QcLqZyoZv4mCxo62+hWd9xFFdCCtdey1M1ucw3iaxbionJEbCDbaWrQWBcxD?=
 =?us-ascii?Q?el0R0fIMTkj1VwLUMefBgqrUiGG/MZFNvDpSsQOnrJCwe84c1gxc/os4+04+?=
 =?us-ascii?Q?l23G/l27U7xqVuo0kGsmm3tpNeMfx3TMBQWB1DRxnhAKsp0mo7nidLNQUD2j?=
 =?us-ascii?Q?54g1WvkRFgaEnKvtDmYiD6nxUhZ0pCdi8u5BUrtNPfSKOgdc2d2Jfwyaf6jn?=
 =?us-ascii?Q?TYmkmr2LLf1QeNc7TX6N/SnENy3WpkKzy61B5sDu/e4i9qZagC5mcC1OcPOG?=
 =?us-ascii?Q?QWyu6Y2GX+p1VynmjM1SUNfg4ttAVH/SydCHx0W5hW+igEg7Oyz5wMhXSp0p?=
 =?us-ascii?Q?n1MUKBGqJ86wy6v7eyrknl5rsX5FG2gNIKmSLr27U2Xj23tSrFoCWe1aakjI?=
 =?us-ascii?Q?3pCsxWrGPzZM1wlFdgY5isGy0+z3Mh6vRh2ZQoGoEw5NfX9f0ekd7r/jO1Ww?=
 =?us-ascii?Q?tigmd9yE+l+J7si86rA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd8d362-9b8f-43b4-4b7d-08dd4abfee3e
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 17:17:15.2518
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZGSuNUpYlkthH5l3nDi61OQDimL0jgc33dW+x5zwA65ahsRCLEtxvFE7TlYjl1qk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8722

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Sent: Monday, February 10, 2025 4:50 PM
> To: Kaplan, David <David.Kaplan@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;=
 Peter
> Zijlstra <peterz@infradead.org>; Pawan Gupta
> <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>; Dave
> Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> <hpa@zytor.com>; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH v3 05/35] x86/bugs: Restructure taa mitigation
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Wed, Jan 08, 2025 at 02:24:45PM -0600, David Kaplan wrote:
> > @@ -400,48 +402,71 @@ static void __init taa_select_mitigation(void)
> >               return;
> >       }
> >
> > -     if (cpu_mitigations_off()) {
> > +     if (cpu_mitigations_off())
> >               taa_mitigation =3D TAA_MITIGATION_OFF;
> > -             return;
> > -     }
> >
> >       /*
> >        * TAA mitigation via VERW is turned off if both
> >        * tsx_async_abort=3Doff and mds=3Doff are specified.
> > +      *
> > +      * MDS mitigation will be checked in taa_update_mitigation().
> >        */
> > -     if (taa_mitigation =3D=3D TAA_MITIGATION_OFF &&
> > -         mds_mitigation =3D=3D MDS_MITIGATION_OFF)
> > +     if (taa_mitigation =3D=3D TAA_MITIGATION_OFF)
> >               return;
>
> This check seems rather pointless, the only thing after this is the
> TAA_MITIGATION_AUTO check.

True, and it can be removed.  But in patch 4 in the mds logic you did sugge=
st having an explicit return to make it clear that none of the later condit=
ions applied.  I'm not sure I feel strongly either way, but I'd like to be =
consistent.

>
> >
> > -     if (boot_cpu_has(X86_FEATURE_MD_CLEAR))
> > +     /* Microcode will be checked in taa_update_mitigation(). */
> > +     if (taa_mitigation =3D=3D TAA_MITIGATION_AUTO)
> >               taa_mitigation =3D TAA_MITIGATION_VERW;
> > -     else
> > -             taa_mitigation =3D TAA_MITIGATION_UCODE_NEEDED;
>
> In the previous patch, MDS checks for ucode in both select and update, wh=
ich is
> overkill.  That should probably be done only in
> mds_update_mitigation() to be consistent with how TAA does it here?

I assume you're referring to the X86_FEATURE_MD_CLEAR check.  I'll fix this=
 in the mds patch to be similar, good idea.

>
> >
> > -     /*
> > -      * VERW doesn't clear the CPU buffers when MD_CLEAR=3D1 and
> MDS_NO=3D1.
> > -      * A microcode update fixes this behavior to clear CPU buffers. I=
t also
> > -      * adds support for MSR_IA32_TSX_CTRL which is enumerated by the
> > -      * ARCH_CAP_TSX_CTRL_MSR bit.
> > -      *
> > -      * On MDS_NO=3D1 CPUs if ARCH_CAP_TSX_CTRL_MSR is not set,
> microcode
> > -      * update is required.
> > -      */
> > -     if ( (x86_arch_cap_msr & ARCH_CAP_MDS_NO) &&
> > -         !(x86_arch_cap_msr & ARCH_CAP_TSX_CTRL_MSR))
> > -             taa_mitigation =3D TAA_MITIGATION_UCODE_NEEDED;
> > +}
>
> Extra whitespace here at the end of the function.

Ack

>
> > +static void __init taa_update_mitigation(void) {
> > +     if (!boot_cpu_has_bug(X86_BUG_TAA) || cpu_mitigations_off())
> > +             return;
> > +
> > +     if (verw_mitigation_enabled())
> > +             taa_mitigation =3D TAA_MITIGATION_VERW;
>
> This overwrites TAA_MITIGATION_TSX_DISABLED?
>
> I think reporting TSX disabled here is more accurate than reporting VERW,=
 since
> the VERW is only done to mitigate the other vulns.

Agreed, will fix.

>
> > +static void __init taa_apply_mitigation(void) {
> > +     if (taa_mitigation =3D=3D TAA_MITIGATION_VERW ||
> > +         taa_mitigation =3D=3D TAA_MITIGATION_UCODE_NEEDED) {
> > +             /*
> > +              * TSX is enabled, select alternate mitigation for TAA wh=
ich is
> > +              * the same as MDS. Enable MDS static branch to clear CPU=
 buffers.
> > +              *
> > +              * For guests that can't determine whether the correct mi=
crocode is
> > +              * present on host, enable the mitigation for UCODE_NEEDE=
D as well.
> > +              */
> > +             setup_force_cpu_cap(X86_FEATURE_CLEAR_CPU_BUF);
> > +
> > +             if (taa_nosmt || cpu_mitigations_auto_nosmt())
> > +                     cpu_smt_disable(false);
> > +     }
> >
> > -     if (taa_nosmt || cpu_mitigations_auto_nosmt())
> > -             cpu_smt_disable(false);
> >  }
>
> Another extra whitespace here at the end of the function.

Ack

Thanks --David Kaplan
