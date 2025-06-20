Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5615F78F39;
	Fri, 20 Jun 2025 05:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750396875; cv=fail; b=O2dT6o03bye7EdDvSJL17wAWBZRjYqyhAZmJHJ4ebk/QfokE/9KjX9eCc83WmRrg9AfPbMOHraT6LwXLNZbhWq8zvums89jhnunREq53+HVD26RUaAhO25hq8XuEIr3rj/OjKf/o8NlgFDnAKd53CkqgmErUDkKmfDD60dNO4b8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750396875; c=relaxed/simple;
	bh=zZtWSydtln2v0j9PeHtPi8Mo0juYXiVxdKsLmHgxsiU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nZwt3iYQmdMeMhbY358lrfhaLQWvqQUI96yuEAoHJmC3cYxvX9azTym57R0qpaWQrRFKTN7XVzBF+Q7C25aDKry+s/funFSnlQSbBXDMV0Oo+BDWSmx3FIbMp+31LJEkycShKlnbcf8Y+ZTLo/dKp8FQsKlpbI1Q4sPnvf0n7eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aKW8Nn9f; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aKW8Nn9f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnNvWgxBXpoFaZwtvMSTeNqpKPvi2RCJsdBLEwSLE/bG6Qy58jVznjZgUCxeNf8jrBQeYGkpH8CPS6JOnLSlrYEXCsKzWYrDYN/Gel7x6dx8DX8PBI57fdVDjin2D/cRdwuln/fovklndf970gYyogFo2MvAPak+QnM2hcWSiYvmcrxXIuC6iDO0rjiCuJEusUrI0Ha2HeSxm+HKcjPNQehvZKjpH4d/NuK0G9tSt7PKJ5Y3Gx/4ulZNqV7DBMFLd2N413g02C8MLxm2aJb38LZh2dYks+r6qvm5wBXZcV7tLfc5jRFY6qxuxus3jpABd8zujeaNxbhFH8NUhn0gwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/SjYKd9ZlGQA0EOM/DHMr9IgicMH8Rpn9oiej3NkrTM=;
 b=BDIKDJzcZOTx12Livo7Xuv6JMYwr69AaHUMk4kDW5kFpSo2A7quZlBpPlIQlDSet2PHnRzIVobUjANydQl1abFFBYFSuGbehOwbCJj6SXy+G99IqZgKtG5L0G/3/fGWVSKsw8yOPoXQdumRaKpO3wlHW1F+kVuUARR67Ga1sbs+010NFbvfq6XJJeTOcgoGvPogpag57kUXJNaInqHqSfcWA7NM709xDfOSRWC9paBWjdOBABA8LtYal5c09g7Qet3UFiT9r3yALV3peKFsPSaNqbH+/Pp2sZD2z+Au5zpUqn3cWO8jWIrPjdwrL2Df3dHHfeEJmwQCSbeVCrVGckQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/SjYKd9ZlGQA0EOM/DHMr9IgicMH8Rpn9oiej3NkrTM=;
 b=aKW8Nn9flFTNuDf6SqA541SF4oTVmpuNcac6SGXE8WkFF4lGUveal2DFMApSZS/wLC7+qE1JtwE1h+Pj0Zr0VzkbzVZJclJmt82Lce1OUVx/B21CuFcTbg1xza+bxXY3a60pCInDuin7rIuVIck7fuuiNovVchmCLm6O6VA4Tn5Y9B3rMr9GCYx9+D4/s/Ar9+XumbIlozFBP5lIf53BUmKlc7i9V2PGi+oQceStB/73m2w8y2mPOWZXshWv4QcIT3oKMrs3RXuBDFB7PlfpJfr+9xzM0TFHUvFnyvLGI64N9RnN+2IesY6mst6I0HLnYg9XOboRaEp7mIPHbNTnyA==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10893.eurprd04.prod.outlook.com (2603:10a6:150:209::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 05:21:05 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.021; Fri, 20 Jun 2025
 05:21:05 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, "arm-scmi@vger.kernel.org"
	<arm-scmi@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ranjani Vaidyanathan
	<ranjani.vaidyanathan@nxp.com>, Chuck Cannon <chuck.cannon@nxp.com>
Subject: RE: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Thread-Topic: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
Thread-Index: AQHb4ZTcW6ZkLDTUOkKR15RzESiTkbQLazsAgAAXq0A=
Date: Fri, 20 Jun 2025 05:21:05 +0000
Message-ID:
 <PAXPR04MB845963C749F7B1D7D734EB19887CA@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-1-c2f02cae5122@nxp.com>
 <8a7e6e24-5ab2-434a-ba71-7b1b4f74e9f3@suswa.mountain>
In-Reply-To: <8a7e6e24-5ab2-434a-ba71-7b1b4f74e9f3@suswa.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|GV1PR04MB10893:EE_
x-ms-office365-filtering-correlation-id: 83ec0546-ad57-4bdc-95ca-08ddafba417f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?hHjTl126cGaW3hsrsyO/ly43s8HvwwNx3vFY6NOBln/kGJRiF9U8cKwiqkSW?=
 =?us-ascii?Q?SSSDokL2619Kry6vrAG7p7Xur5UUF4kVfh/w/p1BU9nshhWSOCIAygP9Ryp7?=
 =?us-ascii?Q?oB+LTpuq+hOHthkI4GgMciuobghFQD5wfG040EpDdehYVSKAWJa1Gz0EQW4u?=
 =?us-ascii?Q?KOgWDkjbntrkVYjw9wLN0KgbOgPgci9QAqY82PrinhlFOqQAStJ6RDc3rA+A?=
 =?us-ascii?Q?J8WK+TsOW9Tp3wtUT4YkFgf+nmBBiC55HlP2vGXhaym46Gfm7R88ZU+gV21z?=
 =?us-ascii?Q?SuTjgXhoRyXukOGe3U2i8qYG8dEYBjDGiu22czCG93gP/FYRRB6IixF3roaA?=
 =?us-ascii?Q?kmb4EERGq/51krsAzGTylBuiNxj2JJnZklKZNqNW4+ERy36dG2PCmwocRwhh?=
 =?us-ascii?Q?9zPM2sXyNvXUUoEpQamrOiQv0Mbts26K29Rqs04Zx8+PA//KigqN/mQ7rupt?=
 =?us-ascii?Q?sOXInDMpuQyvB6VlINUn9+JgkNBZ7vKNUYOz+ysdWi8ZnoyjSlnNPUyQ3yYB?=
 =?us-ascii?Q?pMqMtMLG6vRO+Zwh+vorICMNp9dWd1sMUZOYG2gW410+vvySE2f9I/jDgczo?=
 =?us-ascii?Q?lR+zZW93R2KZfv1v4Uc3NPhU5/m6xl3ReaSxhirpvUGuWj5Kb+Zc/BaryT+C?=
 =?us-ascii?Q?TX16BOfZc6B3G3i8BYB836Z2nE1m0MoV1n0WIEp895aYKQ4QdlJ++ISAswp8?=
 =?us-ascii?Q?iyKcc5sp9OPUE0EucMgXPZ/eDIicZdr11zVhKybSrjYxNok90q3+OEOxdEM5?=
 =?us-ascii?Q?3g1hXit5Ra584hTvYFg2N7y7iLIYhkHvuua3WLmMUim2mMbh1U9p2h8Mm5kn?=
 =?us-ascii?Q?osyNIYbIp19a8c7IY/5TDSNgFKJrKC5AekB38s1h+s/MoxmzUcZITeiMT2Gh?=
 =?us-ascii?Q?TSx+yE/qNs22/Ec9YZfifjGL3wMLtiV9Mjq2yrTG5uMV1xLzNK9/LTLdnWRt?=
 =?us-ascii?Q?nf0W3g0PNKVPsuRyWAkMNLc+KTf5VBsIhVGCZS2vY+8ojUnWgvGihfhSzeOJ?=
 =?us-ascii?Q?YjJ+UTqheuxko1v0JprBDxCF5gCRy6IjdvIxDu1Uo8wusQ/FHsM/vp8dzxVe?=
 =?us-ascii?Q?mthQ821gsyU9S9pOHAiMAVE+QbD3EU5o6MDWZSWfmZgJi9pGvxmGefWA4CD/?=
 =?us-ascii?Q?06CTkP1iusf/M75BYS4DGpxXv2D/CVwXwZt4g1TeF6CnrWCOp69yHaW4V1GJ?=
 =?us-ascii?Q?nGp5Dl+yjxJCzwOWNegM8KkIaSEjbEmVt1AQqEzcXxF7f574bOOtvhzXtaXq?=
 =?us-ascii?Q?+am94rhC4f2cJO/69R8Wx9T/8fqgi6Q/2sYw88go9K+De7HsWWc7GC9gLq/r?=
 =?us-ascii?Q?CqGT5tp+QSu7IwOsKgBRpnv3NvzEzehVA7O5n2Bel4IHZrpRHDiPMHhr6r6j?=
 =?us-ascii?Q?JnLJ9baJHLe6gjiZDBu28iaHjpqjjzzQ02IFawwADtX0tLF3MnKao8n3acm6?=
 =?us-ascii?Q?e8Wl4SochXYnJbD850v4mBOSswHpTz36HXNgoGQFPZDnCduotZxc0PmNxXhP?=
 =?us-ascii?Q?VRWFoSbTTPsRiu0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gLWHSsRWTVGNH9qtvF4JbAkQdqL3ViWDy+2E2A2iWVjdAFVp4fuApAVjH+dR?=
 =?us-ascii?Q?jzQ5YhpO8Di/SKLt5TjRISRn18j9ESdSNrqZ/zV0+Bd46tL+na3HHao/NU2N?=
 =?us-ascii?Q?15cA5isShY+3RVAQQgvKxB7JvuwfQWPvV+kgnlZ/+z5Dt/ct0EJwnYoJMWfi?=
 =?us-ascii?Q?i5w/ampSsp6b+oIEbVZK0cW+4viIsdteKcKsBttS4szhnG5+dYz3aDKRZgcd?=
 =?us-ascii?Q?CSdmZQV9tjxkz88phxw9JH33wRduCVKVTR9bcOksGgkecugf9i0nRUdeemcc?=
 =?us-ascii?Q?oJxuHdia1pnvHuBJ1CD6yAMvTElKGH+ApIAc/Q3e5mcdU3hR/o8Ao2PvfqWo?=
 =?us-ascii?Q?weosEnYtgxbSQHc3rssnlG1oGIL6stoBrYqIj1maJspgwilVqKAfsYJfTz9I?=
 =?us-ascii?Q?neGmCmQSFvJ+kOmOAjmuexwgaSF0eOFNos05gIyk9lp/y7G/QX9DzopZaOSS?=
 =?us-ascii?Q?qXavbIZSO0mhCvMCGw9wLJtfppK86Fu5WqCFHdY4PgRqFD7jQU5ITpeIoad7?=
 =?us-ascii?Q?9MZeFqsCoC6wcu0TkubTQg5kfVzPCY6QP+ygAEz9kH0m+TglZ54xBejJCMkW?=
 =?us-ascii?Q?s/HhCUv7Fh9faQwpbvIOKAYFQyx4yCmVDwGGeiCPhV8pE1d2Hc+RRGq9Bd6W?=
 =?us-ascii?Q?sLodqe/32eZe8aIJAoW6pNlwSvimVc8lcM5hRX4hAWwXTO9AE4YWimsJjeac?=
 =?us-ascii?Q?mhrN18h7I5/OBY1x9PD2vg4QlCSYrJ1RHYXs6As76n2ktBVXcHRdA8ZkeGSS?=
 =?us-ascii?Q?P9jq++8A69NJ5/eUU0BnSoqvpHne5jPKZhEjYs0/l/u73vPf9LrrNnYg9PgE?=
 =?us-ascii?Q?SOOnc5mG5/k81p4H/TBCrAjByqbM1CCjoY6t+HnlZdBd0l/JSu+tvW6jS5ld?=
 =?us-ascii?Q?btra6UMqGW7zYYPHi1Ss12No04n+M2Go/fvTI61w29y5sFYTUdsF5E3BnRks?=
 =?us-ascii?Q?WIrXWUDT8NGRFJljRq94w4KrN2I8gZGvnYG6d56r7aVthe0ws6WYl7/WQ5yw?=
 =?us-ascii?Q?JVGtnmn/1K2jhdTK7BcYi8sjaXmE2q/BN/W/y1GQFqEPZeYdn5RYKs61AL8R?=
 =?us-ascii?Q?cg2KYqH9jJeOG/kqZNcwxPIklo9NKXn6DRRG3zGWBbi9ocwgzCZbcY5/UKaD?=
 =?us-ascii?Q?L+lnjv+g0xgG9KESq5if7A0GWHj8Z5Kkouu17JX5vQXVFSmtdgGIDSWznbXv?=
 =?us-ascii?Q?Vc4BEzkphXqFzo/FGLCIrGwREeDYBcZz6dtUMWyeQfPR8ZAwEa26a6QKkvce?=
 =?us-ascii?Q?y9v+It+m+9/Xfxy9VZ9GNTqX4ajI+7dBP4dAgZq+dtVbvjxkEj8j8PnWdWNR?=
 =?us-ascii?Q?G0pyZ4DcG9Sv18RZvP5+UaCBqPzYoMF7t84pl9FCnFwpQ8aTYEv8Y/ucU1/d?=
 =?us-ascii?Q?HhhdHzC67ChwO0RovZZpDQ4q4QuLz17LmTd/F1oAC8ZGqQa0AfUubCBk97Xx?=
 =?us-ascii?Q?4Y/2gXUNNZhfwbloqfNI6DSucqv+PanraDShqPV8kkUaBFbmbbKLNQjbH0Zp?=
 =?us-ascii?Q?Ffd6x5Buk5Eo/nthpSH4CbebBLjcBfB7MBYM6W38XUTMRWMIIgVPfL/K4jAu?=
 =?us-ascii?Q?x678OK1r8I944PRtbng=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ec0546-ad57-4bdc-95ca-08ddafba417f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2025 05:21:05.3694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rV+2WoxoOOO5/Uc9SzCr8UZiV1MfuNdcFIkWpjV0FlJA27Y0DU4bC6FJ8cR6P8ABhJdSZ0Jrbai7yF0xNgEmDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10893

Hi Dan,

> Subject: Re: [PATCH 1/2] firmware: arm_scmi: bus: Add pm ops
>=20
> On Fri, Jun 20, 2025 at 11:37:13AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Take platform_pm_ops as reference. Add pm ops for scmi_bus_type,
> then
> > the scmi devices under scmi bus could have their own hooks for
> > suspend, resume function.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > ---
> >  drivers/firmware/arm_scmi/bus.c | 45
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/drivers/firmware/arm_scmi/bus.c
> > b/drivers/firmware/arm_scmi/bus.c index
> >
> 1adef03894751dae9bb752b8c7f86e5d01c5d4fd..2d1ef73cb6d39ac61
> 1afa5d0008c
> > 46515e297b93 100644
> > --- a/drivers/firmware/arm_scmi/bus.c
> > +++ b/drivers/firmware/arm_scmi/bus.c
> > @@ -323,6 +323,50 @@ static struct attribute
> > *scmi_device_attributes_attrs[] =3D {  };
> > ATTRIBUTE_GROUPS(scmi_device_attributes);
> >
> > +#ifdef CONFIG_SUSPEND
> > +static int scmi_pm_suspend(struct device *dev) {
> > +	const struct device_driver *drv =3D dev->driver;
> > +	int ret =3D 0;
> > +
> > +	if (!drv)
> > +		return 0;
> > +
> > +	if (drv->pm) {
> > +		if (drv->pm->suspend)
> > +			ret =3D drv->pm->suspend(dev);
> > +	}
> > +
> > +	return ret;
> > +}
>=20
> These could be done on one line:
>=20
> static int scmi_pm_suspend(struct device *dev) {
> 	const struct device_driver *drv =3D dev->driver;
>=20
> 	if (drv && drv->pm && drv->pm->suspend)
> 		return drv->pm->suspend(dev);

Sure. Fix in V2 after I collect more comments.

Thanks,
Peng.

>=20
> 	return 0;
> }
>=20
> regards,
> dan carpenter

