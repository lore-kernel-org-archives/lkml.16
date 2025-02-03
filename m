Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2098.outbound.protection.outlook.com [40.107.20.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C558209F4B;
	Mon,  3 Feb 2025 15:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597926; cv=fail; b=hDEmNOZdLjCDBJtXY2US3/NI6r4kpkYDj6VJTnfdTmSvp0Yzkg48dmTV3Gi/ed20RO6qpQnFVHpZZUC10NiqBQ17wRCwqc2SD5nsppNkrqpKU32xNewLERosxhaPDzlSIiM2JPfkH7185rKF4rllq7YGSDow9ZtRZBmis6mOdzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597926; c=relaxed/simple;
	bh=aYgJV0oERjHl8dHY4AVWcqYmhEC3HWMWKolYqsspVG4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nutMExHbu6x9BCTyZXXYk0iBRfiXMF9Zvuh0g17H/mrbvpq/leGGaldkuQDnVKu+W/LuLDWPsg2lTBB4CcSbIjguJlgoiiFqm9cHrgPeda4tZSuqd2Gpv1qSehbhJdwjPZyyKe/uttFuQaZYESae5IheisyJZ5aDqxfYoBI/1Js=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=on2.de; spf=pass smtp.mailfrom=on2.de; dkim=pass (1024-bit key) header.d=enviteon.onmicrosoft.com header.i=@enviteon.onmicrosoft.com header.b=gJykDwRh; arc=fail smtp.client-ip=40.107.20.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=on2.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=on2.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=enviteon.onmicrosoft.com header.i=@enviteon.onmicrosoft.com header.b="gJykDwRh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLVLl+XI69qTj1hT4jIng+sotgxE041nN0vTEUybBu3UZXotlpie8e8E1i5gNdkoru06mzozlB9UUCsMuWaq9l82qTQZep0Xqle3cjrlXUOTd09yuEg1CmhYZe+Xb9VINkp+QqPQHszeLagEEq+wWLfLnFjNQfNO0v87A0zVcl6wXm6u22V0qJq+HK23nGvyqfQOm7otU1cP7lffKs3pOzDIZpoOfQNIOeFTkeqjLQdxU++PaL2u5QUzcrHQhGYBT/sh/LkqXPDonKHOC2oWbE2pX5wd3Kh1OU2CTQbqI5dUXC/qkLg3nD8PDEsbrNTvgb85GdZfihjfgGXBFDwaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9h19BMQMy0HrHp8f1tzqurqZd8pEs3EYycwOViNurZ4=;
 b=APiEBavwlbrE+vwV0cHAtC6h8bm/lqTSz1ZdzuuMuw83JNaCVsHzfj2xAZCJcIGeJ4yJUjZA++CEfHlNYDVEV/BRE9Ge5YfiWOVpPaB2Xwv2SAoDMy10olW2cKphcBzCFfasda/xKSy9OpQZQ3Eb6on2ZWoop3aoC6n25OYTROmMv+ROs/TRnJ35RIcy6BDDX89He1TuuADY1pD7KdPprVnVzW9ZW8TjG9TMaWNvfPZodBWZGjZkdxoodWkaR8arziZtWSkQSXEzhDz3CiDClMB4cxVx4dA8bkChKp3qHC+82Gv5KI/t+WGidAYFDiYGSsN9Ahu9mtTxR0dAyYb/mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=on2.de; dmarc=pass action=none header.from=on2.de; dkim=pass
 header.d=on2.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=enviteon.onmicrosoft.com; s=selector2-enviteon-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9h19BMQMy0HrHp8f1tzqurqZd8pEs3EYycwOViNurZ4=;
 b=gJykDwRhEsgdzhRiRgDDi2E8JHoJRWyGxznPd3g0DQ0LLQoEenSbTfkaZ8ahaJ9ZW8bTbLO6dk9sMYkGrZ+WbYcJynMfgmbAg8dK07Lo1OWEnRZxF8Ep1F8N/pUvsx1FgF/qnYX+V7/xIygNKaT+8G/ChAzKJ6PJlfDXBqq2nSM=
Received: from AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:592::14)
 by VI0PR10MB8521.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Mon, 3 Feb
 2025 15:51:53 +0000
Received: from AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5cb8:ea20:b80c:7130]) by AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::5cb8:ea20:b80c:7130%6]) with mapi id 15.20.8422.008; Mon, 3 Feb 2025
 15:51:52 +0000
From: Ulv Michel <ulv@on2.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Johan Hovold <johan@kernel.org>, "linux-usb@vger.kernel.org"
	<linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: AW: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW support
Thread-Topic: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW support
Thread-Index: AQHbbw0nI1DMCDpB7EaNLatjODWmBrM1vycAgAAG7SA=
Date: Mon, 3 Feb 2025 15:51:52 +0000
Message-ID:
 <AS2PR10MB75024C662CA4E5EE7DBF06A689F52@AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM>
References: <20250125094005.1132785-1-ulv@on2.de>
 <2025020308-anemic-sasquatch-efbe@gregkh>
In-Reply-To: <2025020308-anemic-sasquatch-efbe@gregkh>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=on2.de;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR10MB7502:EE_|VI0PR10MB8521:EE_
x-ms-office365-filtering-correlation-id: 01f9c804-633a-461b-3d72-08dd446aad6b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?9IzjGgE4U8grFxDW/2pD33mXQ2wK//3JZi+T4K9kqjS75jMz1VV6L8R2U5?=
 =?iso-8859-1?Q?bIGgay15xPfPu2l/T+y6Hjr5iB1YoBUjs8/lUju7t7L00z0J5/uztLP1BW?=
 =?iso-8859-1?Q?pD+97NqNOCmRIulFZd4e2diRoI+4GnwDLe6uvNGsPalJ+W/+wUYpDzfkR3?=
 =?iso-8859-1?Q?FHlBT2wfCkwkRmhkOupdE6EGk5BMO60/A4wVepjEtG2c0SHo9vYq7xJfN9?=
 =?iso-8859-1?Q?U9wLgPqShPqWaYMFDIMcf+vTp4XavHv0NMjIy3y0bhsHV2y6NOV5NSgwHM?=
 =?iso-8859-1?Q?U6JtNOTHxxmyfxZp9kqP5ev/mLEUQYOzX18juzQqg8na90mOB0VHpdznQe?=
 =?iso-8859-1?Q?76x33LyxP4R85dac62Ttgkce79iEXzk8z1jE6EhBp52ex7UUC19erbE6EJ?=
 =?iso-8859-1?Q?HDbui6EdQPVzwYvhh4QAMi08jdDlVkONRKekSlqJ69P26y8NN1Qe4VuBUc?=
 =?iso-8859-1?Q?dFSN4UfJPkSRL0MuMiv8wOjvV9XjL6abAvRi1K56SA7Esc9lN0b7kJwoJ9?=
 =?iso-8859-1?Q?UolqTCQvrKVQJGivb+2fawFg65XsFDWwVSd0wbg9EJ25xx9N0WruAXRYeQ?=
 =?iso-8859-1?Q?xML2LO2noA8PTAFhFb/p3ejT29N4Tc+SYt4jvKegxvarR15cujwXqX7Xnu?=
 =?iso-8859-1?Q?TBn/lrPMFC5Owumbss+oKv/gPo9c718ZcSo9kcZiuS0cj1PvtjU6pDfYcF?=
 =?iso-8859-1?Q?vBNScSExYZYuwW/23fq2aMzOtX5ADPMnZNsM7K1ECKHgsjEUIMNxXeSb2X?=
 =?iso-8859-1?Q?3SEXRO5UQ+SMF36TftsAo9OHLFxMvs21LaWEm1/HyInAJ+S5lmjmaWS7kD?=
 =?iso-8859-1?Q?SSWwip8MDq37sDC6AvF8GhFmjWYYbxPZn+DDc1WlmJiFJvuh0t+oHR7u2g?=
 =?iso-8859-1?Q?DGQ/vUkYNWr3k+zafF/dU0O09mFek6RandsH8iiHIlcwA5wnS9NsfXCP8e?=
 =?iso-8859-1?Q?NcLj3nE6pdHmXXuEmYnN/BtaSw+MfjUOktQohn9cIEjmSYn8HxFRN0aOP7?=
 =?iso-8859-1?Q?HeSjvQthO5i0oGps+L1D7AgvyFF1qKFwbGkXzGieOplsp/MMPLRXme72ZE?=
 =?iso-8859-1?Q?WOjaPNTII6pa9wnOTup9Q07E9NyxjL7fvh66CgFUjhDNxuq5HrujzOgE+B?=
 =?iso-8859-1?Q?Go14p/45tmCpWesQt/h/b9fObpmaKYAgIeTj1T44yK/Ta1lvafPYtEocrY?=
 =?iso-8859-1?Q?vTAqPlUXB0golWhDR0BZWw0dWJZIxYjCSsVGeUyB/9X2e0/F84GBbpZjaj?=
 =?iso-8859-1?Q?cXgz8qJehtvjbKNHYbh2B3rbHUhOTmb67G771Fy9d2D3ZOsfvGmmkjmGSA?=
 =?iso-8859-1?Q?5BVc7Krbo5+xWG96GcBK5rufkZgKveXdp5/u/Gs7ceLRPTRIA0rpqVeEa7?=
 =?iso-8859-1?Q?BR5tpO1IEXpAf0bWdgyzG5dWsS8Bv6uZZ5DIQ7SD9o2ynGAlSBWZxggIIt?=
 =?iso-8859-1?Q?jD05gL7/aVJGqEc1?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Jo38+Tef+UYEzk/Ec25FOO2IFWjCNVRB06isu7s3iUZdetpBOmazxFsSAn?=
 =?iso-8859-1?Q?5aJUcRm/Jt7gCscFcTnbekLIBmorIOokk4+hbIgsgpa4kO2rHWNcAFwWvj?=
 =?iso-8859-1?Q?+vsXSM8f4uk+9fZQpMjD1jh9na5qKjsd6rjpUWne3PXCtsmSAOK4sLiePr?=
 =?iso-8859-1?Q?OEY2LMnguwHvf39mmiCoyEnve3JfpnFOU/U1w4aDTAzTKC6Mdf7iW4lehc?=
 =?iso-8859-1?Q?mDfOaZ8RJFvkxQPh6pfoNL9u0PrSCs4c+L6Xsj7P2FHfNlCdXnCgJba87j?=
 =?iso-8859-1?Q?qr9sEc/cKA70nGz/4KPQPXRAfTmEz1yuDEsMdW+EgQEwD5gpwSpnwYkSII?=
 =?iso-8859-1?Q?ZGtMsjcvRXeM9VghBXBOJMAfYANWsewkWJ4o3ZKMfN1Prd0DeikSStMHq6?=
 =?iso-8859-1?Q?NkaGTpZy/+siRJMUyM77yPPx3rJRBB8As5znxa8BK7tIghxatrXMEKEkIC?=
 =?iso-8859-1?Q?2bEupKDUosvgIdvqvC1uAfjE2+zvhP8okDLVLQonFEO3EElutrQ/h2wgpg?=
 =?iso-8859-1?Q?u9r8rWu/RYpbAZg7nRhVK3fVIlCGbowtEQearZVDQjuLFQW1JcJCBRQdZl?=
 =?iso-8859-1?Q?/O8xgaP6XDuP4TVvLNhpB2fC0JMhOdvWjKOkMLC7yoNVG0mbPi4PSNEyo0?=
 =?iso-8859-1?Q?WXzLAWulgAAdnfD3aLaJnBuDXDWlS/NS2d5rMr1PMtY+XNwS5xYE+shKgM?=
 =?iso-8859-1?Q?kMc72Wu4KBlyMWcBXStauvQ95vJWc33vObHnDvu+LarFV13JuTtd2yGul4?=
 =?iso-8859-1?Q?NNJXOtL6eJI5x25igu2xRPjQo8M6FmIJJirB/UNP1suNZMJQS4YvzoOycL?=
 =?iso-8859-1?Q?r9hC9p11c6Rg2Iz7VAkLAxv0TmEZ6M+02VA2D3mx+dFbt+AuffwZRHyTmh?=
 =?iso-8859-1?Q?3ubBOf7Y6cuiupEl2RC/UxAVKcxelL9Oa7nOf6BdKO/cJK0LuQDGS4akXT?=
 =?iso-8859-1?Q?gH7w7DONgckHt/WMxqZrhzBgpfBZukTA4p4TjFa6M7xNwhtQXg8f7BmV4v?=
 =?iso-8859-1?Q?9qTXDYbJOgIghri1lppgzKPoH33ThH7CY0DLqNCayh75Dg27thGEjZs4MT?=
 =?iso-8859-1?Q?jExHVKCepJW8B1/bc4pZnZurlhGinAUreqGvuef/fjtsKUZdeIjy9pb13t?=
 =?iso-8859-1?Q?OC+IANakbXJLPkNXjcarnvL8Z9g7b/KQyAJmNvJFHGLoDdhciaVVNGhFYG?=
 =?iso-8859-1?Q?D/2t+77I9JtxvsQ2HSlQ6yqJXyL9jh92VDF4UXMlLx7n3aUltw8d1+bWGI?=
 =?iso-8859-1?Q?OEL5Xkd3RcTsJ7B/udkLO76OqMgokHzDv9zOF9NSjN5W3Ib1jzksi+A/sI?=
 =?iso-8859-1?Q?4zlpHXQQPQS19r4EWEKhRfcbQSYhVoV18I4GtDiuSagPRFfdmq527rOy6j?=
 =?iso-8859-1?Q?g05VEWW52fjgPpODk+2qA4RlJw+YMnsDiBpyBV/fAqOY/HzCWMZUhagnJ4?=
 =?iso-8859-1?Q?nlbCEhZSIlTRFNYPF9ojtmT8LTdSjdpEsz27jnJWUbdZmV1irDvMUPFwhv?=
 =?iso-8859-1?Q?vAf1gMBF7XxzaXtNqhtrDpTf7ZZET0zqFjVmFn3pWKI/YYdjSFh0UxKuzs?=
 =?iso-8859-1?Q?U8epsLfLKj8Sy6CsVkOSoD/H9pOcJQcxiMMsKs6DrwxaaDfMbyyQ8k1yXK?=
 =?iso-8859-1?Q?8VP4ukulZfHKU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: on2.de
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR10MB7502.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f9c804-633a-461b-3d72-08dd446aad6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 15:51:52.2715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9ed1a1d-8109-4b86-a3f1-493fe8342a3e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tGJb7kAICGHJPYyLrbECK9us6ACOIPWSwV+CASu74TR2If5U8/Kb3sQ5of406IX/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8521

Hello Greg,

> We need a full name, sorry.
the full name is Ulv Michel.

> And where is patch 1/2 of this series?
Part 1 is this: https://lore.kernel.org/linux-usb/2025012501-pediatric-abid=
e-b802@gregkh/T/#t

> >  	  .driver_info =3D RSVD(1) | RSVD(4) },
> > +	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) }, =
  /* Wistron Neweb M18QW */

> You forgot a tab before the comment :(
:( I removed the tab because the checkpatch.pl complained the length of the=
 line being more than 100 columns...
What would be you suggestion? Resubmit? Or keep it?

Thanks,
Ulv


-----Urspr=FCngliche Nachricht-----
Von: Greg Kroah-Hartman <gregkh@linuxfoundation.org>=20
Gesendet: Montag, 3. Februar 2025 16:17
An: Ulv Michel <ulv@on2.de>
Cc: Johan Hovold <johan@kernel.org>; linux-usb@vger.kernel.org; linux-kerne=
l@vger.kernel.org
Betreff: Re: [PATCH 2/2] USB: serial: option: add Wistron NeWeb M18QW suppo=
rt

On Sat, Jan 25, 2025 at 10:40:05AM +0100, U Michel wrote:
> From: U M <ulv@on2.de>

We need a full name, sorry.

And where is patch 1/2 of this series?


>=20
> Update the USB serial option driver to support Wistron NeWeb M18QW.
>=20
> ID 1435:3185 WNC M18QW
>=20
> T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  2 Spd=3D480  =
MxCh=3D 0
> D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D64 #Cfgs=3D  1
> P:  Vendor=3D1435 ProdID=3D3185 Rev=3D 3.18
> S:  Manufacturer=3DAndroid
> S:  Product=3DAndroid
> S:  SerialNumber=3DWNC_ADB
> C:* #Ifs=3D 6 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA
> I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3D(none)
> E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 1 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3D42 Prot=3D01 Driver=
=3D(none)
> E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> E:  Ad=3D84(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> E:  Ad=3D83(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption
> E:  Ad=3D86(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms
> E:  Ad=3D85(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Dqmi_wwan
> E:  Ad=3D88(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms
> E:  Ad=3D87(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> I:* If#=3D 5 Alt=3D 0 #EPs=3D 2 Cls=3D08(stor.) Sub=3D06 Prot=3D50 Driver=
=3D(none)
> E:  Ad=3D89(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms
> E:  Ad=3D06(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D125us
>=20
> Tested successfully connecting via picocom and submitting at commands
>=20
> Signed-off-by: U M <ulv@on2.de>
> ---
>  drivers/usb/serial/option.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c=20
> index 1e2ae0c6c41c..b166f1607b0e 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -2285,6 +2285,7 @@ static const struct usb_device_id option_ids[] =3D =
{
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/*=
 D-Link DWM-156/A3 */
>  	{ USB_DEVICE_INTERFACE_CLASS(0x1435, 0xd191, 0xff),			/* Wistron Neweb =
D19Q1 */
>  	  .driver_info =3D RSVD(1) | RSVD(4) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(0x1435, 0x3185, 0xff, 0x00, 0x00) },   =
/* Wistron Neweb M18QW */

You forgot a tab before the comment :(

thanks,

greg k-h
