Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2054.outbound.protection.outlook.com [40.107.249.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EBBD27E;
	Mon, 12 May 2025 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050366; cv=fail; b=BHHgR6pzj3XxSVWhJSrt7zi01MkqmcVBRzOg/73TSbAUfTeVDn09JHcmhUwsGETnxcTzJ+3UU2lA5Dpe5aa3+ms/Kx6mVtvy8vOLyAo3Y4tcGa1r0tmlfilDDn18JgLFQZ/SPlmDPN1cQzieGcK6HySorOvuvNBEB44oE0j9RKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050366; c=relaxed/simple;
	bh=AsLSKIY+ul5S+Ne0AQePZwtSKZvCnXnzN7EsEdBbJAs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XAm5eLagGUvHoRfEpYMU1avoqJf9ExGtKcDKVB+uJFfDZzlHAikLE/3VlVlu79/iPI5X+nHGxFJpgac6lhboAnfTwY+R8pyi9bf0frIt1unjW28Frq77PITqvrHd7OMHfVesAEW1NXkGpp85RYZq3Vixkof7DKYe85CgtB9vfOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lBvM5waC; arc=fail smtp.client-ip=40.107.249.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lBvM5waC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FdXiM9hRzhIqT280FbaIvIQtgpxvuSIdNuFMwYqqgWVQ6z+RF8T8wjOPkoMPD+yXtaLl1DMit2Ts13y6YAIVmB0awl4lM8nj8pvmLpQ35ZkbS4mBOu4vJaULPInrtDIRBSDHuwf6Zkiktee0yGb5ukgo5zOiioaEJeTRJulERj9opjvsO/RM3AK/22yk6QgUJz+zCE0MAyT6zzB84dFkJrCMViT1UMUUGkpcIdWOeU63rKuEUlpjTYgcdLxtw4AhlRKeVyLmiih1z8CyWoORKrRwriNEJrec6zNYTASEnh+Wazq3AGtK1MbPYYYi+oOB/AGjCxiGsWlTkhe+lx83lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=90nPnDLqayZBKqbbrrVGrz1B4rHpGqOoqs+kKx7POh8=;
 b=eloPsVcaps2bsooC5nEv3O8L+NktQVBLlxY6Ruf1QmFQ2BS8PxStYi6V4LxwNCiM9HINAmqHbGqCGSLLk63ftxVZyccQ2v9k1bxRGrlMqsKx8d5vcDo6smTvkiwg9sCiCulZeN2h4wbgF9aDWP0Ncu2iqkizNHZIwFIPiZ9INjuwcnH0bN3MrudWSWivf2ceC9auxrnJh98CdNU9cFriHgiCQUpoB4K6IYWzehcZTLaytTlSYY18Pm3mtfXzrvgCO+6R8aD8XM5kPOzGh1oOeg9CQ95V8KlroH5Kejy6KlzDFnsihBEkIMhrBm9Lqptbj3iJtwTtfrw7BKNjr+WZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90nPnDLqayZBKqbbrrVGrz1B4rHpGqOoqs+kKx7POh8=;
 b=lBvM5waCd6imI8BFMmlcrgEpFnS5YbB6rUH463uXTLVDMJO5uK/5Y1f4bRRkxo6PmClg59DhXFJc2y6PPIjdhqR8C9tu3hISiIHc/p/hP+7hhXer26LfXV0rFz9UCCFi+aKLiYA+H1d+APx+p1qPcwxt0YzOCUMXONiVO+bk3I6PxdovFKNuB0YNaTtukGtu5EkevxBRw34q6kYRoxBh6lqeARoBvxr/uT+yhn9DwfKB8nsHEqo/gyvBCM44vMSA/2nOAHxxzyBDEvum42v7fm5y+iwxgAdf+9BZQ5r7N/x0KlsauaUts+MA+jwm0UImDnk42C0jyUGFdRsnUXP5HA==
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com (2603:10a6:150:110::18)
 by DUZPR04MB9982.eurprd04.prod.outlook.com (2603:10a6:10:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Mon, 12 May
 2025 11:45:59 +0000
Received: from GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8]) by GVXPR04MB9778.eurprd04.prod.outlook.com
 ([fe80::9b3c:ef2d:7475:5df8%5]) with mapi id 15.20.8699.019; Mon, 12 May 2025
 11:45:59 +0000
From: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Shashank Rebbapragada
	<shashank.rebbapragada@nxp.com>, Frank Li <frank.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4x
 i3c-hub device
Thread-Topic: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP
 P3H2x4x i3c-hub device
Thread-Index: AQHbv9W1RwXGJFV3KUGQHgcEBwZgX7PIP+uAgAakUnA=
Date: Mon, 12 May 2025 11:45:59 +0000
Message-ID:
 <GVXPR04MB9778CD46464F6BEE25D5D0529997A@GVXPR04MB9778.eurprd04.prod.outlook.com>
References: <20250508045711.2810207-1-aman.kumarpandey@nxp.com>
 <20250508045711.2810207-2-aman.kumarpandey@nxp.com>
 <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
In-Reply-To: <b46e3766-75b7-4635-a505-3039e4394f07@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GVXPR04MB9778:EE_|DUZPR04MB9982:EE_
x-ms-office365-filtering-correlation-id: 6dfc3d11-eaed-4232-bac1-08dd914a90a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?dq5bIDIduAeMxNbWCEahTFLfJwSGcnx+aHd690B2aQSzXkha2lmDbwPd3F9s?=
 =?us-ascii?Q?zdajCmPX6JKJdnIUzG8ZmuysqUMUlFKmS2s7+N+7BsduttNDJFAQSmwUBGeM?=
 =?us-ascii?Q?iNpF5Xw+CFOtrYCfFFsVwTFomtrYxgeldZUosC2ILFFh9MZTZMWoIzUxUpag?=
 =?us-ascii?Q?3cJ/GrxADXDxtZRiYj6+QNAuoJmUBGlsKM1idHkicSV8Qvohu+YKlkN4pPRV?=
 =?us-ascii?Q?tsSmNGskCkm+2LYdyePTP3GTU/ntHkUQRVc98p5dO10Wi9cUyNuUvD8yZhSa?=
 =?us-ascii?Q?Pe/GtyNpMeWJ6chvzi4d/W4TWAOza+1hSTuiyIOtnYA7Js+wA+XqGYs0ZvF4?=
 =?us-ascii?Q?95WrNZTVPEegBmusrV6nypzrsd4Wz7K3SX7quFTieyc4ruwnP/FzcOl9Xngm?=
 =?us-ascii?Q?KBGA5dMdlykHby0vdi401LKHriVQRQfgdlVIp6EAX1f1yfPiUAPD+K5+CFV+?=
 =?us-ascii?Q?7VGNs/5uyThj+6sgldHlatLgTuTxjAReDzJtyDOedwcrbEysaTeioGRZ9Qv8?=
 =?us-ascii?Q?y5WKZ7Xk18I3/WEyoErj3pf8qqpOhbemfgca6Nqm4hS+yZQjDTwpONklJE9D?=
 =?us-ascii?Q?C3Y9uu7Oc4pyTaSQQj6fFW7O+l1QvZLgwtjc4Ojkfoi+k3bIrI/p96pJqRyY?=
 =?us-ascii?Q?YTy/1Ym48dzd6lkgb45r6jitcx1+dq+EnpCFyW1bXz/pXY8SBayeEQuHBG91?=
 =?us-ascii?Q?XHoqHLs/QY37J5IV7FjFhlnWRdqgm+2qM8536Y7uJfC0Uqy5p+/+ij5fcY3d?=
 =?us-ascii?Q?qhxOFNpMVqQ2nN+hVHxfHS2ni5TvQWqyd54X+uIV5I36KgW5OlTkdGFRKQbY?=
 =?us-ascii?Q?l++45I88rVlcqXa9NzU7PuVo0Q+ZYcfj1NxDCPEItuKFmKVdd/BtJ2icaHVY?=
 =?us-ascii?Q?Cj5DIb60GStylbCqsAxBN09gSImssKwdhk02bAX905V9v5lkZwV8HStTe7Cq?=
 =?us-ascii?Q?pXApNHDN0yjy4XHOM6VgBNo3J1fbpjKJ9ZMAGMt3FFMS0Htb7jMy0WYUYOx3?=
 =?us-ascii?Q?WmAAyLTVamX7vuQe1a7MgeNtPDfSL8vUsTsm5/yPA5fwsV0LpKfXga9KXyVa?=
 =?us-ascii?Q?h90ockM3BXeKwBSsnxF9Fy/Dez5PbrVVTPqMYgB9lmsX1JBmUB+kh7yjCB1w?=
 =?us-ascii?Q?FYiKnlLuvqqI1qFygUj3Jj6N6BAlA4F4kIpCnA9kUj8QGOh/QC/O018PMOqK?=
 =?us-ascii?Q?RboImpMBIaXaAxYSJ/BRZcdQUGVGhO+KsKShvvJg+SOQO/q1AVbv9Bpxi2RE?=
 =?us-ascii?Q?f4GZHO3mwo+pjYbGSgkZTzVwWNaFXh+DhPrwJEb0Wx6wFiPSfaukohAM8hWu?=
 =?us-ascii?Q?9bsUGIDHBgJvEPFisNMEjYvxAQjNDSp6kWvhkCfVKjXHeZ1R6fL2DkhArXGa?=
 =?us-ascii?Q?JzJqKIdjVwIPCk+bM+YS6Yik8xAGGpemASBCDedeBEDC34bJton1QtkwM7wd?=
 =?us-ascii?Q?/F5LYMhpbiVitajcXUQ2x6/LvXBSkNdNWwfFefsKooIjJeKXFpOYdw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB9778.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jBrtHHhWg1smTpTGosiXo/NEaaFiqpJdy8nilmXcgdTSRwO1t81/HlKy6SOX?=
 =?us-ascii?Q?PQDnzY0/zr7MxECaOjdxjUMrbE6Ov/Z7zdpQ8itFbeBuJD14cMSpWNOvwfc4?=
 =?us-ascii?Q?cXhajglPzbh+VstXSr+5wW9LgxMNN47NFCZsgmjRQipUDsZzR5iUFDG+pz90?=
 =?us-ascii?Q?EKBKnzvIPw4Z3IAZVjNl1SU5Wlwq5/EV4hCtA3BK9KDzyaRJnycwpcGhFJr+?=
 =?us-ascii?Q?DKkv4n3yyAELyh+rzTUhSdwi+ho7K9CvTSefPUneibQkH25YgblJ1SfbmCLR?=
 =?us-ascii?Q?vGduKSVGIpz3WIl7rXofUz9g7lHAM+J1p/EckmqVeVBMXVErb2P5HeBRhRC4?=
 =?us-ascii?Q?U59bywA9YrC6UZ5kA6KWSmR9QNd2WfQElHzjvkf2EKmtgVP9YTczDLPDHBYz?=
 =?us-ascii?Q?y+rEFS6Y3+ZRfdd5CZFSqReNYRISFA9MtThdXXnsJkwpcgJyEilqka/s+FQW?=
 =?us-ascii?Q?anU5CD3APyKLTBV4icRcsy7xj5hpwHQxve52+6GSvOIykx2dEP4z4adEktoF?=
 =?us-ascii?Q?Kj76/N2XxDlQlsg26aT0NMFgmjnIrLr61//8gZ+6GpkuwueDrPOACSHJ8dTH?=
 =?us-ascii?Q?FA7GJ6P/GOO/yN2NUzUozSb2DYSJFfKTlIvB1r4UzayTcKXOSsCI2sjxfyyf?=
 =?us-ascii?Q?AasQR8Z4kVoKIQBAerIP8io2oQzBjHRjEukx4bc88HbjslfRx5yg+lMSaTb6?=
 =?us-ascii?Q?TNoBNN2dBYKvKz1Zuz3wPKb7UMh6ijkei3DT752ROWF4sAkkj6xumLwmoXbR?=
 =?us-ascii?Q?G4Rv9sd8HHeRtrzvV13sZ5irYKAoxNWaLVF4LalMWG3QufqJ2tql3N8cDfPT?=
 =?us-ascii?Q?d/NPIYbgKDzOX7AWim2XIvivpVTdR6a9wzu+hFu2V7IkP73QJdxid40uQYST?=
 =?us-ascii?Q?wSZ0KGxk38cmg5cLhUGeu/lW95vsOvEi+J86qS8FPk7/2muKgRaGb5Nh0Wz5?=
 =?us-ascii?Q?gikZ5GGFdT+mp6WBIbm/lQfdMsKvg8+LE17ZWEvxjIPYTjHqKlzMJQsNreN3?=
 =?us-ascii?Q?fTYFZ9TkxfF6n1lr9sOAkjZVm1yqo+OJIaU0ORwmvauB/QCiS/fDWQBA3Vr+?=
 =?us-ascii?Q?QmJL/+EcQnsxHCZ/VTQECvJgsSL5h2MlTu0qmu5PptbdtCdDnd0A1YT4QRu0?=
 =?us-ascii?Q?FpZLv+tEZ7JpbZvMNSu7Lc947ZBEqOfBDauA9IZxKxjTv6cMm8b0Bfi65rY2?=
 =?us-ascii?Q?u9uh9OpWlsZ1GaGyyppJattEoXJG6TVPbrAdq7SqWdTI5L7q/RRfZWawodMp?=
 =?us-ascii?Q?5B9oNxDytfSdQrM9m+/qIy8Ax3/y9+jsqemHCsUBFoAFafQ6OeJEEV6oGJTD?=
 =?us-ascii?Q?TW1p1+MOYnxvayDfJrT/rxyRFnq0xxY34e+X03fz7n2gijke0VndsSvqMUF6?=
 =?us-ascii?Q?wkiEGsPFMRISBpHsFp+sWPTAOsxE7X10USLDriakZU3Qh6Cud2ZaBPrP6R4P?=
 =?us-ascii?Q?pe6K83NZbkJ40jcHGi7ARkiJ7BMLpuMmBFeC2FEmXHEDfuTx5AcMOaboLsiM?=
 =?us-ascii?Q?7DtsuzpofSPyzgjFK8Wt+spocSvaPnDcSouuWIPpbKMM7y927exYiQ7K8eCy?=
 =?us-ascii?Q?jD0Gs6mKGsE7XolZNSpwTVCeAuDht/4xZyzjxXt5?=
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
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB9778.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dfc3d11-eaed-4232-bac1-08dd914a90a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 May 2025 11:45:59.6067
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tiL0v7Apg/buiFqOJiMB7nFXfEVit6IiT7qj2jlysm5TDNhJ9Glwektxaszi7/6RNyoP1viyzbyBR1ZWElFbbBPiLkDa/WtllC/7sUsazYw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9982


> -----Original Message-----
> From: Krzysztof Kozlowski <krzk@kernel.org>
> Sent: Thursday, May 8, 2025 11:40 AM
> To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>; linux-
> kernel@vger.kernel.org; linux-i3c@lists.infradead.org;
> alexandre.belloni@bootlin.com; krzk+dt@kernel.org; robh@kernel.org;
> conor+dt@kernel.org; devicetree@vger.kernel.org
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Shashank Rebbapragada
> <shashank.rebbapragada@nxp.com>; Frank Li <frank.li@nxp.com>
> Subject: [EXT] Re: [PATCH v2 2/2] drivers: i3c: Add driver for NXP P3H2x4=
x i3c-
> hub device
>=20
> [Some people who received this message don't often get email from
> krzk@kernel.org. Learn why this is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Caution: This is an external email. Please take care when clicking links =
or
> opening attachments. When in doubt, report the message using the 'Report
> this email' button
>=20
>=20
> On 08/05/2025 06:57, Aman Kumar Pandey wrote:
> > +
> > +static void p3h2x4x_of_get_tp_dt_conf(struct device *dev,
> > +                                   const struct device_node *node) {
> > +     struct p3h2x4x *priv =3D dev_get_drvdata(dev);
> > +     struct device_node *dev_node;
> > +     u64 tp_port;
> > +
> > +     for_each_available_child_of_node(node, dev_node) {
> > +             if (!dev_node->name || of_node_cmp(dev_node->name,
> > + "target-port"))
>=20
>=20
> Same NAK as before. You ignored the comment and nothing improved.
>=20

Thanks for reviewing the patch.
As per your comment I have used proper function to get reg instead of sscan=
f. And our driver is not having direct interface with userspace.
What should I change here ?

> > +                     continue;
> > +
> > +             if (of_property_read_reg(dev_node, 0, &tp_port, NULL))
> > +                     continue;
> > +
> > +             if (tp_port < P3H2x4x_TP_MAX_COUNT) {
> > +                     priv->tp_bus[tp_port].dt_available =3D true;
> > +                     priv->tp_bus[tp_port].of_node =3D dev_node;
> > +                     priv->tp_bus[tp_port].tp_mask =3D BIT(tp_port);
> > +                     priv->tp_bus[tp_port].priv =3D priv;
> > +                     priv->tp_bus[tp_port].tp_port =3D tp_port;
> > +             }
> > +     }
> > +}
> > +
=20
