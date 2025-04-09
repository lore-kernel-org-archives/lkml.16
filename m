Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012061.outbound.protection.outlook.com [52.101.71.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 255E243AA9;
	Wed,  9 Apr 2025 00:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744160228; cv=fail; b=M+WuvY5USUPDl4EMP01srqHPXUZahoZTx1yU54DwRcBU9GSqCl7GuoFR9D3y5/kf1WoVfY5uIBdvX/9RTw19A4D9szMdqOATgcfJEO25H/pET/WpFZNrov1LOKKerHa6A5alnMkIREXbzbkEMkrKmrohfA9t919NHpSVyJflQmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744160228; c=relaxed/simple;
	bh=blNDbUG1moFORFwYqI3imQJNz5KXNOzM6n8Dj/Zna94=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EvztP5NvfJ04E6gJcaFdwCnK9G9pCNvlvOwGInmjBuxL2uGxLi/hPl5GAnGTmMo35sRQ5HvHEPhRKtTnkAH0/P5AxYsRGm73ZLWbcseldoUuBQRk073fA3rusT9MnSp1SBFiXNLH/6l8Th+ZgCvVZX7eF5CBcj32Zu8etQneSAA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mzRqkPft; arc=fail smtp.client-ip=52.101.71.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mzRqkPft"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U83xEyCxYxtHYjCiFDDEGp3roEhi6THF4+VzwfUxjJjMsegiwHzjj1kOipKVnePSa1wwyVGftRs0dMIBKCnLhAIa6Fd3GOD2UKwTKfIs0/MuIyKCAUJLrtwJRwuzeY28Vw93TfEahzgKRYaxzhQxJrTq+Zen7UEYT5Yxf4e/F/TELl3yaRkqAbSj/nz46q+x1q2yxMjhX4WVhi4/DlVU745OzEDM+tHC2jSfz6Voxz21PR+VtsTihiKu/wn+vjUSbfUWOGYhhJQz4dmHqy67QLE4PCtLfBNd3dkVwnLldtFhDrji6LRdUJ/aO4EsDsED1yl2ON4Q90qLyQSKGVosWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZrsh4OU8VbJVfgBtpwOfEjqpR67k8UiD3K02VgNk8c=;
 b=ZURM/7LKyZiTwrQqK5KhtfAJGnRCUuOGIBBdx5kNVxR27ITsDgC97HbRax3iYb1kNH8VVfojDHSpqO9prczpiL6AdcQLixx0+aZP19fFKaN5MRqb7xc/em0TpwPSFiYcnGExwtt8Qz4/0GPKJHb5AHX8RFR7SQdiFLTY/j9icycjMjc2rmZd+PQrQFiRijC6sTetk94JoskHVw9BBs8yWt7QLV0+yTvlhdPkvRVGpMX/M6lkS4xEgXKYXAvntXM+gaOID3iGiQRz41fdJ1piAQqndsK1yqY/WosvaYp1nNPpWSZixw0EJF3NWACWjUTXswCQ0YpHqMRq54Q/zfEpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZrsh4OU8VbJVfgBtpwOfEjqpR67k8UiD3K02VgNk8c=;
 b=mzRqkPft/X5bgbUN9WaZ0Pxf6Cnn5i9hvAQfpgEFSUuJkGqSBcrKNSeNhc2v/jeZM+2UIyPVanDYe2aZPG1wBqe6Ec7E3RKeRFbQYD2rk1xfLmNexOfZKzSwjqAgFHQ6XFjzFCqL2X3YjPQbUO+rrKfiEJk8Ubm3+VuNkp3Pj64txafoidzVcrcJHCECZUuEuNqJ6edpRdUKzuORrJ6Iwi0tCKIWIA9FkDYOqHWThCJZAKk12BhXa7tl9FaeLHuM2Jyv/eBVKIYGMSIZ9q/KGLmEpFTI8z/lNktGrKupcG4mDgInD5TNUA5yvGDzX9bhuVjNmCaFZrXSPFYFvDovIw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB9114.eurprd04.prod.outlook.com (2603:10a6:10:2f5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Wed, 9 Apr
 2025 00:57:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 00:57:02 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@arm.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Philipp Zabel
	<p.zabel@pengutronix.de>
Subject: RE: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Thread-Topic: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Thread-Index: AQHbo7wAwTsOD2QN6UGYYFl060fUoLOQNTqAgABViICAAdEFgIAILpYg
Date: Wed, 9 Apr 2025 00:57:02 +0000
Message-ID:
 <PAXPR04MB8459F52ADF81AFDDFAC1A52788B42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla> <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
In-Reply-To: <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DU2PR04MB9114:EE_
x-ms-office365-filtering-correlation-id: 33356275-bfe3-413c-f8d2-08dd77017075
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?TWYwjH5jG1c8bGV0CwoFY4GVFw7nlUV4uyczT7Iyj3zSq/niPpL50Z8JopkV?=
 =?us-ascii?Q?5s6xytRUkx5Z1azWJM/J5h9fYV/pnopo2/kxcvVCFV1KrrFv31y1W7ogVLqN?=
 =?us-ascii?Q?Ent25ZPbWDigBllPZh/MJkeB8EiUQApSvj0OMsfS7i3EMIQjOIjLeXjttxsn?=
 =?us-ascii?Q?0rCPJufcYDOlanmQx8Oy01c1fmKqMwl0Z8MbZ17iyjNKjLCdBYViALmku0C4?=
 =?us-ascii?Q?RtO4i2ILzqFCZW4raKZq1iXvRiGIkx0O+YCva3Yp9BE4Y2mmvDH85fA4Gks0?=
 =?us-ascii?Q?GTGRYizK6mXHtnGoWeDWCX++macQDv+x+82thyDmGsxXIYdHXbARGIWyRzvn?=
 =?us-ascii?Q?Yz7As1+ltAWMp+2TNV8kIMBJlWlPuo6p+aC2ts+c/9aN3YDi+nv1/koDFWop?=
 =?us-ascii?Q?SgYRq1BcrwLRiYNt0DaX7BTQVj+p8ppncwM2cYo9vz0WXP5WbnOd5OOwhx8n?=
 =?us-ascii?Q?SMerv1fnIoxi/xuRvGRWN1yewL3D7aQm9VMMtsL+tqXtSlEHFEtuwvGjQrHb?=
 =?us-ascii?Q?Q/a7YhetvUlLSuRer3xBlE1/OqLE97FnSCK5q0fmIwbfykLkDSMjOLEvqDmQ?=
 =?us-ascii?Q?ymi2xzfzFyL1Ym6p0IMGCdNqdhGPcwZFASmX+GlNZYzb+dCd6SkvZsskB6Sb?=
 =?us-ascii?Q?KWHdSESYMS4Po3VPZJLAaQrfzf+mF4gOeO1kQVuqi6ERFXsSQ41KLhfzKrrK?=
 =?us-ascii?Q?+1TC/T9CR1y9iyPBQQCc2rzlqwAF2HdVYSsO3e9d0frdPBRAK783r0l4nja/?=
 =?us-ascii?Q?3Xq4zHzkjelxRWnua/VBVIeE3OnNhybWvOeWdN/6XANkjzApH9nDE3tBON3q?=
 =?us-ascii?Q?cqU4miv+Gm7tlaq7hn/M0NGSOs3Eo9ufHpEwoSw12Uf1E9C5gNDdbnGJyN0o?=
 =?us-ascii?Q?LaTq0vMNzGytaLofQoQGKyzZvrlRqlmbBGD7uTd/nLKfc+x3EGrRkyToa5sI?=
 =?us-ascii?Q?TxlM3QEHtHroYrpM3uM6r2TRuLfv0P5508+J1vE1X2oMNDgnS6B2JR7kYdVs?=
 =?us-ascii?Q?rmzzHlI5If5tUNvbi9ga/w9pdui182evsuTp5DF1qxiK2wJF1xUSi10ki+p0?=
 =?us-ascii?Q?LEONLDtLtiN4h5WerZG6FTqycYxGnInLtGo6f501QBn2xx9BxdH6n8eKByJ2?=
 =?us-ascii?Q?eo+us5eZtNfzdTzIAlhonYcF8LxYYZITm8EGY4mrxAB/NkArWjVsAaXyc1rY?=
 =?us-ascii?Q?spGcmueLH57HL1jhE0Ljysv236uth6MFJtJK7QqV+r+ntQQkQJn6ItMEUYBt?=
 =?us-ascii?Q?2g9Cvc36dDLW4vkRKU0Cggk3xqqKv4VhRm9JYQQ0lBrxW/w7WQhO+wsAiG0n?=
 =?us-ascii?Q?6oLl3nwBDjnGmzjjOi7VQ6q9v+sRHnmuEi9MfX/W4WGzpXVAHLGHVdYlQOxn?=
 =?us-ascii?Q?h6mAR2Wah5tVy5eqBkrm39DLGIVtZ9rOc/cBsIIYS7z1hRXJKwoB6BQ3PeWB?=
 =?us-ascii?Q?4nu261JmzPqeRDZ1joSkBDg4tgMbXBEYHdeoFatTnNLa0bcE/NLFmw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GIlT1Pse8P75DUP9nxaX1O9rK63XUKv8NXHHm/3LrnhX7feTSFVAH84Ls8YT?=
 =?us-ascii?Q?I85TuGE0vJ8CgfVqfQwDXnduYzEkNzoLpZLGpvkknUcTPx60k1Oe8X4GDglZ?=
 =?us-ascii?Q?aYqgFN3RHVuqFX+184XRJhbFMXYupEPB2++rtKtPIeaC/K+fEd4H+hLaU71p?=
 =?us-ascii?Q?nbtz2QRtSXksbUVi417VvHNXmKmaUaO4im93zUAjyTD5gPr93F8MBXl/WjMc?=
 =?us-ascii?Q?bdtuLw8yjdzNierptoUBm2ixCXeG2U8WR3CG11dNpU+qFcdiuVeLhWiEmNu2?=
 =?us-ascii?Q?dbFJFwRKOAAV46gwfI2/RIo4ah+93Gz6EVdR13idv/GisC9kkd1qsOUbNYNZ?=
 =?us-ascii?Q?krK0OpXBQSCgAj/q3QWRwD3qWHqI591qEYp88nquTO/+3Dr1SPsySIbjsMxS?=
 =?us-ascii?Q?TmpWubYcwxgaf1hxMQ8UAy1qt0EoAUznyAje2MYP0EcUH2Tgwk5gh+39vkbR?=
 =?us-ascii?Q?8wcOoxKoLQHBhkwE/JFGt9jSBmxCHaZQxAEjUqwX5ZUKjK087smaCnF6WQv5?=
 =?us-ascii?Q?/MSN87T9oYQ6+IcW8xzVHStqci5Zb5gM4BHS9uqC8dA00yBY2Gj2XYF9Z9ug?=
 =?us-ascii?Q?SNSvZffx2Rdwep/5mt/T4Mo+HqtJCWjJ6fo8STb4Mr2AFsLECUhoapKc6IQF?=
 =?us-ascii?Q?DlBUIdXNtU1i6goz1PJXpHcEEKx7nCmiNP1iXoWkeU7VqkY0LyMz5NWDGwOW?=
 =?us-ascii?Q?Pw1KdOrn5cVxn1sRFnq1ikjUyxYlRmIY0LTg66kYIttSB9OxKzgHcK8zYJbI?=
 =?us-ascii?Q?+AcMqs9+yNg/XWwVJa/ozAPcjjVaAYKwM6ZXkGKhbjtMmHQzmvv0hB2E/RiJ?=
 =?us-ascii?Q?vJc6OCTbgjkx2udfy0jB065kBOdjJCeOLLM46Ef/KAhqqZtvhgeVj/oeoybN?=
 =?us-ascii?Q?9owZZSXlKhivhSYepgTRJZr8BrW64B2FJvsSturA14wt2Cj7T2HBurhAknA/?=
 =?us-ascii?Q?YSY9Jp7Wbxt5cMQJy7Jx3My981jPLuZZyk5nU5DQQ4lBdh6GdwPS+C1KRv3A?=
 =?us-ascii?Q?GzCNYZ9/Zjj9G9/FlCd0VPA/S1IZVGM/nOeHDgEE0hpquq31TNgYAWdJJM1i?=
 =?us-ascii?Q?3tz/MY4CRw+z1ao3uTu2nZGKCL4GQcG3TbOt/HOUqRoZ6fi+vR88l/iOsRiJ?=
 =?us-ascii?Q?Ncf+TIEDImk/DnexIvYjARHnhAydmahNTbsQKTX1pdnUjy8i3/oTcxxC10/z?=
 =?us-ascii?Q?5tQsu1qj0FMnOgVCZZRVuIJXvXgEbCTQTvZ+IUxXq+9fgrnFLvwDUrUm+VYW?=
 =?us-ascii?Q?hCNlGHM+SksYNJ2zoLbQxGaDmhbNbPqaAwa+knhbb3nQQVNvr+gBHeVeq/uY?=
 =?us-ascii?Q?/m3/BletJTRqSJiJS8MGtZGKNY5rUUAlWeeD1hjeHrx9myoKIGWJ2U86+e6T?=
 =?us-ascii?Q?0VtwZQnIhmKxu1sFD8liyJWD+pv1ULdHBwqMSupd0w0cVrd6UPtwa9ger2ms?=
 =?us-ascii?Q?lCDnUt94OPt/VnXyOGwlWDkCME+R18L29djm8nfuxclyG7PwIzgVPKwYMlib?=
 =?us-ascii?Q?Nx8ABkp95kiNOAo4qAXobNq3L3cpMvXvzqgDDTCl6lrQS0J4L01UJ4y/Rku6?=
 =?us-ascii?Q?yBcP7ik24oiGfIlIW7E=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33356275-bfe3-413c-f8d2-08dd77017075
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2025 00:57:02.1636
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GCXAwWp0Mof1I7hXcfgyDBIEJOHU9FBqqszdSP1BaDGCkATriPWa7TeQv00m6Viyv69xEHom+VnAwntkZJxATw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9114

> Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
> do_xfer_with_response()
>=20
> [You don't often get email from dev.mbstr@gmail.com. Learn why this
> is important at https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Hi Sudeep, Cristian,
>=20
> Thanks for having a look on the patch.
>=20
> Cristian Marussi, Apr 02, 2025 at 19:05:
> > > Please post this patch along with the vendor specific protocols
> > > mentioned above and with the reasoning as why 2s is not sufficient.
> >
> > Ack on this, it would be good to understand why a huge 2 secs is not
> > enough...and also...
>=20
> I've been working on firmware update using SCMI vendor/platform-
> specific extension on FPGA prototype, so not posted it initially. I'm
> open to share the details if needed, but need some extra time for
> preparations. For now I'm posting a brief description of the extension.
> It has 2 commands:
>=20
> - Obtain firmware version number.
> - Update firmware. Firmware image is placed into shared physically
> contiguous
>   memory, Agent sends to platform micro controller (PuC) physical
> address and
>   size of the update image to start update procedure. After update is
> completed
>   (successfully or not) PuC sends delayed response.
>=20
>         Agent ----     start update         ---> Platform uC
>         Agent <--- update procedure started ---- Platform uC
>         ...
>         Agent <--- (async) update completed ---- Platform uC
>=20
> I've faced timeout problem with the async completion response. And
> update can't be done faster than 10s due to SPI flash write speed limit.
>=20
> Why not to use notifications?
>=20
> First of all, semantics. IIUC notifications can be sent by PuC in any tim=
e.
> This is not suitable for updates, because procedure is initiated by an
> agent, not by a platform.
>=20
> Secondly, code implementing  notification waiting duplicates delayed
> response code. I had implemented it as a proof-of-concept before I
> prepared this patch.
>=20
> > > Also instead of churning up existing users/usage, we can explore to
> > > had one with this timeout as alternative if you present and
> convince
> > > the validity of your use-case and the associated timing requirement.
> > >
> >
> > ...with the proposed patch (and any kind of alternative API proposed
> > by Sudeep) the delayed response timeout becomes a parameter of
> the
> > method
> > do_xfer_with_response() and so, as a consequence, this timoeut
> becomes
> > effectively configurable per-transaction, while usually a timeout is
> > commonly configurable per-channel,
>=20
> Totally agree, usually it is. And that's why I didn't change do_xfer() ca=
ll.
> Here is the thing I want to pay attention to.
>=20
> Let's focus on delayed responses. I think delayed response timeout
> should not be defined by transport but rather should be defined by
> _function_ PuC providing.
> And of course platform and transport could influence on the timeout
> value.
>=20
> > so valid as a whole for any protocol
> > on that channel across the whole platform, AND optionally
> describable
> > as different from the default standard value via DT props (like max-rx-
> timeout).
> >
> > Is this what we want ? (a per-transaction configurable timeout ?)
> >
> > If not, it could be an option to make instead this a per-channel
> > optional new DT described property so that you can configure
> globally
> > a different delayed timeout.
>=20
> Taking into account my previous comment, I don't think that having a
> per-channel timeout for delayed response would solve the problem in
> the right way. What about having a per-protocol timeout at least?
>=20
> > If yes, how this new parameter is meant to be
> used/configured/chosen ?
> > on a per-protocol/command basis, unrelated to the specific platform
> we run on ?
>=20
> As delayed timeout is IMO should be defined by PuC services (in other
> words by command), new parameter can be set directly in the driver. If
> we talking about per-protocol solution, using DT is also a good
> approach.

i.MX SCMI does not use delayed response as of now, so just ignore me
if I am wrong.

delayed response time may vary based on SCMI platform loading
or the time the command requires, this should be platform/transport
stuff. Define a max waiting time for delayed response saying
"arm,max-delayed-response-timeout-us"
for the transport, similar as "arm,max-rx-timeout-ms".
Then no need to be per protocol.

Regards,
Peng.
>=20
> > Thanks,
> > Cristian
>=20
> Sudeep, hope I also answered your comments from the last email as
> well.
>=20
> Thanks,
> Matthew
