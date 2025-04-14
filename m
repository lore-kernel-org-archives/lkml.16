Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BA31AF0AE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744658421; cv=fail; b=EDXKlOBNgaYbe4nJJKdQ8Wlno9c1e/amIB2p1m4wlk1WQUnqT03HkgbvguBHzNncgBp+lno6H0KEJVthVNQfFak+ZosIoii5L9pIa1eicD58EMh/uyamU9FNfniaTQftjqMRbUhcw+BHieYZe3Ahx3TAflY8rUc1uYpQV36QrSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744658421; c=relaxed/simple;
	bh=VpDCYZnuRRqF30AKC/MACu28sSv8BZDzMawimj3HM5A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Cfyxyg8NE+FFeBew+FmFshFr4spbKPVcgztg5OLsCHD/p1jV9gISP5sp71DNMAvsRBJhkzPBygSoWyTczmJz5rK4zjbw97fsyJyo4KpRWFLPTfoTE6Z0o+Uf3AEYrtF8xqIdNjTc24UDk/DDBEIac+jYahfZ5SN5fWzUt9bQhBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=lh3S26ad; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="lh3S26ad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEnalDwennd34tbCjj7nA2X2/QHIZhp8N8ZupiRI8CRqQc+TGQhowuzLxwVeecg54uDtwlJSR/kmvF1hfPl6bXANCgntrGfBGchPG9JmSWlnCuyUOXk6hp4iuORhjlbZTidl78sKe8XTMynxOk2hoHVPqwrzLnppfAU5W+cooauZObWL0mHoJOKI+jJquDsc5fBiqlKbkh8K0NwUlq2qxUyt11bk3ywxXMJYFpyBmjONMrvws3eH03QURjBDOTZj/uFxZPlIEIYjtft6QVIR/O0iOppSi4EB+ambuWhMG3yzmQEC3lwJBvFlQAZb3lpuo7hBEops4RFb3fYfy1zHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xV1QCHhagyZd8dCPvj7qp54c6G6XyfrR7mV/AN6sb7s=;
 b=y6R8wHZ5EsPAOA98R4fePqSjA4YcZCCpm5fZ6Q7IqYD32huJfmakn3z6Ai55ZMeXIp5VMDtmT+NXApEKhohdAHQRKMds+0RuLT6LcfTSOXnaRLQU4FnU61+xbtJEvrawZtNvW4L9oKo8ovOWmRSONdPrwvl/LJ2Y/j/sXCZrQpA2Dc+eoHImaaYblhcqz7pasxwE1RSE1bnRc1gE6Kwj6oM8edChPI5u4Rcsgq/TtgYHAvWUKcYfoirJmeq+uCqL7vukKx1HkdovG0EbSf6ABDppQMJOg3PpXMIn4PZJcEivY5ZquwtY3FVp7ArRDKsZKls6PFFvWWmiYG2AzjTeTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xV1QCHhagyZd8dCPvj7qp54c6G6XyfrR7mV/AN6sb7s=;
 b=lh3S26adLl5XLe029mr65Jg8z3Gj9VpwBQgiCL8aJ04cHwBAfyglVenLKNSK4njrFUkZF+Nfuk/vfpZjJavSr1FF+Dnt8QIY9zMR3xET/wEHK6KVUfYPLC0la6qARGFprwikl6JrdpN7DhTvP5x+Hskb+fcchubehPZJYnBgCP8=
Received: from LV3PR12MB9265.namprd12.prod.outlook.com (2603:10b6:408:215::14)
 by DS7PR12MB6238.namprd12.prod.outlook.com (2603:10b6:8:96::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 19:20:17 +0000
Received: from LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427]) by LV3PR12MB9265.namprd12.prod.outlook.com
 ([fe80::cf78:fbc:4475:b427%6]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 19:20:17 +0000
From: "Kaplan, David" <David.Kaplan@amd.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	Peter Zijlstra <peterz@infradead.org>, Pawan Gupta
	<pawan.kumar.gupta@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Dave
 Hansen <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "H .
 Peter Anvin" <hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Brendan Jackman <jackmanb@google.com>, Derek
 Manwaring <derekmn@amazon.com>
Subject: RE: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitigation
Thread-Topic: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user
 mitigation
Thread-Index: AQHbqjVD44GkGReAIkKZskuMNLm5L7Ojjlcw
Date: Mon, 14 Apr 2025 19:20:17 +0000
Message-ID:
 <LV3PR12MB9265290D1539EE8FAECD1F9294B32@LV3PR12MB9265.namprd12.prod.outlook.com>
References: <20250310164023.779191-1-david.kaplan@amd.com>
 <20250310164023.779191-12-david.kaplan@amd.com>
 <o3ceiexzywuw4udvxf3fcxyjqlff4kpvepjr2jii67oghkyai2@6dok6fljt2vs>
In-Reply-To: <o3ceiexzywuw4udvxf3fcxyjqlff4kpvepjr2jii67oghkyai2@6dok6fljt2vs>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=1148a4c2-3a3a-4844-9508-f04d8f9e6235;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-14T19:14:01Z;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9265:EE_|DS7PR12MB6238:EE_
x-ms-office365-filtering-correlation-id: 93987788-450d-4c9c-9abe-08dd7b896418
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?pMmEvafKoAJA1ps4sCTAGBNpOB0U7AlidJQ3UHCyMMGfrbgFeZD6fDKMSEiB?=
 =?us-ascii?Q?KJ1Loj3q9joC5uldk41n8DGckwYGPaZZUd3x4kvcTOVoY279FB/qcYX7Q6U/?=
 =?us-ascii?Q?MbSGZoYnxfChl8fjhdA5e9jCITa0ltfYaLf0LufEWNfRfPT7TbDNEkmBMbCM?=
 =?us-ascii?Q?9orndQ2daMXXgyEDRLbOYJJP2q1HpAG9n7cbSX50gNALJY6/fAjTMT0iKfG7?=
 =?us-ascii?Q?1Ni3UN5AylaYaD19SM+NmulA6tFW1hf5nXLq6wU91sACkn9BYdjCLSA5zhOr?=
 =?us-ascii?Q?XK9sSLkyNzZDL7y2WKJAFjs8RcZJPqnZmrbQrhR0uDaUt9elXZEXBUrBEX4o?=
 =?us-ascii?Q?v8F6V1PSRpFvW9mvEFnqhrcvbvpA238a3IOkji3TXwuvAGhtAwsXMNcHaf9w?=
 =?us-ascii?Q?VtItIAEIgvfwh7ZCBG5DFZ27paTB3LRe8V9DPrAeBbjwHfcjmiCfWIC8RQ+Q?=
 =?us-ascii?Q?oaKzDdkJEBw8U6gQTDZQaGPtrsh409QOCwoZy8FzPfG0TSDGHeiHQMDuyk7P?=
 =?us-ascii?Q?BOmO1T4l426IDRVTorqQu3arZNsU7vSViIoiVvDcag56pVBP1kgV120hwajB?=
 =?us-ascii?Q?50uhkeK+wDjOUEwjrBQNHqFVpDwTJkPpeixMqyqm0EH5PBXoLhB0M9syDRQE?=
 =?us-ascii?Q?oXTCdfuthKrKIZwSl3MlRf9y4x128+S77FD346ugMIz3LP9GW6GZAOQ/UMKT?=
 =?us-ascii?Q?N2ffXxlbjj0YZ+nt8mLk8/nmKKR30M1YA1siTVPP4qpiDdlZN7vSG7TCUGbH?=
 =?us-ascii?Q?h5FZzG4zIsbn5GG8MgY4ID5Q6uaZk1Yf1gOYspaJgv+agXXtbOcsYyok4mDW?=
 =?us-ascii?Q?Iaq5HhGyLR8+aRur5RcZ1Hz0yPArqTxgORxKmRlWrjM0C/x8nfqpa++a0aR+?=
 =?us-ascii?Q?IIxNJCHQPcL0JeT66IdZnPRP1ggoKN91pJ9MZYKzlE5mlmCjZ4HzcpoLb0HD?=
 =?us-ascii?Q?ummQNKjmDS9+1uUfMllzPxNpekihkZor73y5xundW7DcaJkvuSaScCR7FJdj?=
 =?us-ascii?Q?T7M9IhSqO5MXavNGxsT+9mzs8LebvkquqieOf97HlU8UN+wmfkoSjViPATHQ?=
 =?us-ascii?Q?9k7rtoIB+AV0njtN27TwpVDZ8FRx6l6UqXqTpVHmAp4te4d/JmeYcjcLse4T?=
 =?us-ascii?Q?Wu0lhb3bd05Nn+eGfD2olxfmu3as0xGfaufQyJHg5B8ik3Emj7mqRj4U0T0e?=
 =?us-ascii?Q?GPV/0cj8ARTajQGlTTDo1VZawdGlUefUry1MJQ648PI//NqSbw4kBRdd/7dP?=
 =?us-ascii?Q?zmJH6xVIUBn93Rdtro970yB3EC5KNe6f2ut9SHqsbh6EteWRV3ipMCKQp/0c?=
 =?us-ascii?Q?N1Ihpss5jV5enD9nPLSGHiYtrWQMCKrslMKulPQB95B/RDwlOg9wU14HeGJW?=
 =?us-ascii?Q?wA7gWTGnOL/qHe2xrL29w6i2XKOFEuIrEP14gJ+lHSscWNsy2Vwz5lUpCfP4?=
 =?us-ascii?Q?NLdOlObbfOq3qzaUd7duex9c5GgKPA3lRQDQJI7wINqOWvUuLXVdng=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9265.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?MpdEjc+rtpr3gOz/RnT8L1L2Sn055VI93dV/EgGSon8mKOl7Bje9Ej0cS8Q8?=
 =?us-ascii?Q?r0gQofJjZW1WVEgwsMx4fRBUx4X3SzEP8xF4yQhunhmp286IGCAA+/BdegCx?=
 =?us-ascii?Q?vyYFLaf8GBqj1xC/pJ5Nrsgkb6W4mubVcF+CQumU2C16yWP1GkFGoFmT8AGF?=
 =?us-ascii?Q?PWWXb1GluyzYkelxzPflDPP7D6kQTFFTLQj9VRivhOQTFgEOe948nx1PvmCs?=
 =?us-ascii?Q?1ZYCIqz11WuUmVTXrB/07zE6K/+kUyMrVJSb4cmpQ4lDlYyCczgQXnkrbndr?=
 =?us-ascii?Q?smnCeRD9h8eLc+6nsy+0OyT39iT3q/V9h6ALq3SoBvWB4XVLriqyjUaHo5ND?=
 =?us-ascii?Q?P4X1SqRC3enKUId5CGCpIMwLuE18zP9JTr9HPxXwNAUz4MkhqyaH2ajV6iDa?=
 =?us-ascii?Q?NnQUAnCDo9VqOszo9PBUCupCEpPCDq0QKqMMbzTYNqNa1/CjDfZlFaYYMNoM?=
 =?us-ascii?Q?2ELjyeGPMninyvqkXBd84QWAa/gaB3wQJjw9xKdXCXK2VfMSU3fMQcOvYRFh?=
 =?us-ascii?Q?NF86qh0ZsMFY2JHNef4dTr+uNAODhvLYAp3ndQe3uW0+fxgIs61hKUtrUIg7?=
 =?us-ascii?Q?38IgTxXuzAJMXqF2HPnl5/FmjQD0Zi4hCaK+2oijX45Vy9lRNz+vsxlPFc0R?=
 =?us-ascii?Q?Xx1BK6214Udtr7RoUtbp3sSKU5Qn86/ulVn8Rl+SjeM0jZ3YKLspRD8O3y9I?=
 =?us-ascii?Q?hU1XZTafqhWBZfTrSNjxU/OP1f5GY4TtQvfqPLL4DlvsNPrqfe1LW5raQFzk?=
 =?us-ascii?Q?nZ/DW+fyKnEV9c1iUiub1StwenxtvZ8BnE1w+GUnsY518x7Sr0rhZkXf1Pfi?=
 =?us-ascii?Q?cSKCtDYyx7TMJMqHFckV04XgrcjcbDS7aSOsi93FsW6H2tuyXETBZhejElQS?=
 =?us-ascii?Q?Gi20NwTrRePnWd3qZV9Xmoc+THqMO636m017+IF0oaN/H0ZIR8MCjdrlnYng?=
 =?us-ascii?Q?rnx3OpVs96JbQv3FUlJM7JBYGyBvzkgwanyQYZbU6rr/CkCzkM6C0xY63LSD?=
 =?us-ascii?Q?+B9Uhe/4awJ2mydfLDvRyD+3n8mHWLI7FTGYZYENFAzn1KQSikQQ7w4rodFi?=
 =?us-ascii?Q?o0Hh+g3P2k8uzjbqbq5cgw6Jn+9H5f+wd69UdtQc72sYPJq+/nWyeOkZhumK?=
 =?us-ascii?Q?KUAe7UMSu64/qjEgQeEwBRefczunCw51QhlYuLA3hwazhh/rUOmaiTRYIx8R?=
 =?us-ascii?Q?lK6wRRpO+Y6E2pkHb2+PuegHbSUT2ACzdz7xfAkCOA2Eq+vSdr5KKE57fty4?=
 =?us-ascii?Q?ZHKk+DS0w0E8bXwy2AKg7qjIkOj/kWgQ74zA1DY4DSmusgy0Q0o5djgCH8al?=
 =?us-ascii?Q?EJdhNYzstGKSh2C2+d9dwQPzJTCTK0XgFvGthhBfKtYbVQQ9uMDESoGDLyBt?=
 =?us-ascii?Q?C0gLej7450SOlmvKrdEYLB2/PRsW2e1l4aul2MhlmK3dHPiVBPT+87TMxYSi?=
 =?us-ascii?Q?FVx9zcdgOCYL5GL9Zz4B8P0wB65+7tEYY3UcPZiOOdjLVvt0VnWjYvjWqkez?=
 =?us-ascii?Q?5ldNwP4wsxdihBj0KlgQoid5gsos79x9bSbadCwD3w8xSxU4UDbu9YzngKpx?=
 =?us-ascii?Q?h/wbVqckFp+h73BOO+0=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 93987788-450d-4c9c-9abe-08dd7b896418
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2025 19:20:17.6502
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uejC+mTh8EH08behdWpGQR1ZtafYhn3yAfq02A4ZlwUERPtQNV9WZaN7uvYBi0ZA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6238

[AMD Official Use Only - AMD Internal Distribution Only]

> -----Original Message-----
> From: Josh Poimboeuf <jpoimboe@kernel.org>
> Sent: Thursday, April 10, 2025 11:26 AM
> To: Kaplan, David <David.Kaplan@amd.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>; Borislav Petkov <bp@alien8.de>;
> Peter Zijlstra <peterz@infradead.org>; Pawan Gupta
> <pawan.kumar.gupta@linux.intel.com>; Ingo Molnar <mingo@redhat.com>; Dave
> Hansen <dave.hansen@linux.intel.com>; x86@kernel.org; H . Peter Anvin
> <hpa@zytor.com>; linux-kernel@vger.kernel.org; Brendan Jackman
> <jackmanb@google.com>; Derek Manwaring <derekmn@amazon.com>
> Subject: Re: [PATCH v4 11/36] x86/bugs: Restructure spectre_v2_user mitig=
ation
>
> Caution: This message originated from an External Source. Use proper caut=
ion
> when opening attachments, clicking links, or responding.
>
>
> On Mon, Mar 10, 2025 at 11:39:58AM -0500, David Kaplan wrote:
> >  static inline bool spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation
> > mode) @@ -1446,10 +1436,10 @@ static inline bool
> spectre_v2_in_ibrs_mode(enum spectre_v2_mitigation mode)
> >       return spectre_v2_in_eibrs_mode(mode) || mode =3D=3D
> > SPECTRE_V2_IBRS;  }
> >
> > +
>
> Extra newline here.

Ack

>
> >       case SPECTRE_V2_USER_CMD_SECCOMP:
> > -     case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
> >               if (IS_ENABLED(CONFIG_SECCOMP))
> > -                     mode =3D SPECTRE_V2_USER_SECCOMP;
> > +                     spectre_v2_user_ibpb =3D SPECTRE_V2_USER_SECCOMP;
> >               else
> > -                     mode =3D SPECTRE_V2_USER_PRCTL;
> > +                     spectre_v2_user_ibpb =3D SPECTRE_V2_USER_PRCTL;
> > +             spectre_v2_user_stibp =3D spectre_v2_user_ibpb;
> > +             break;
> > +     case SPECTRE_V2_USER_CMD_SECCOMP_IBPB:
> > +             spectre_v2_user_ibpb =3D SPECTRE_V2_USER_STRICT;
> > +             spectre_v2_user_stibp =3D SPECTRE_V2_USER_PRCTL;
> >               break;
> >       }
>
> For SPECTRE_V2_USER_CMD_SECCOMP_IBPB, shouldn't
> spectre_v2_user_stibp be SPECTRE_V2_USER_SECCOMP if
> CONFIG_SECCOMP?

Yes, you're right.

>
> Also I think spectre_v2_user_ibpb needs to be cleared here if
> X86_FEATURE_IBPB isn't set.  And similar for spectre_v2_user_stibp and
> X86_FEATURE_STIBP.

Ack.

>
> > -     /* Initialize Indirect Branch Prediction Barrier */
> > -     if (boot_cpu_has(X86_FEATURE_IBPB)) {
> > -             static_branch_enable(&switch_vcpu_ibpb);
> > +     /*
> > +      * At this point, an STIBP mode other than "off" has been set.
> > +      * If STIBP support is not being forced, check if STIBP always-on
> > +      * is preferred.
> > +      */
> > +     if (spectre_v2_user_stibp !=3D SPECTRE_V2_USER_STRICT &&
> > +         boot_cpu_has(X86_FEATURE_AMD_STIBP_ALWAYS_ON))
> > +             spectre_v2_user_stibp =3D
> > + SPECTRE_V2_USER_STRICT_PREFERRED;
>
> Instead of checking for !SPECTRE_V2_USER_STRICT it would probably be
> better to check for SPECTRE_V2_USER_PRCTL or
> SPECTRE_V2_USER_SECCOMP directly.
>
> Then the returns added to the SPECTRE_V2_USER_CMD_AUTO case in
> "x86/bugs: Add attack vector controls for spectre_v2_user" can be convert=
ed to
> breaks, which simplifies the control flow and also allows the above-sugge=
sted
> X86_FEATURE_IBPB/X86_FEATURE_STIBP checks to keep working.
>

Got it, yeah will do that.

Thanks --David Kaplan
