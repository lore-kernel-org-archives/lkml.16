Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012019.outbound.protection.outlook.com [52.101.66.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B43A1FC8;
	Tue, 24 Jun 2025 01:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750728198; cv=fail; b=gBU+Z4NnW3R1i//QVRRgjDI7/8Q0kobMXy+h3LSPbZqIWHRvlfWzuaQ6Klk/3p4Msv2j2ysehMuE2Fu22zD37AQPM/Xl1tCEDf1KejuTdym0fxLDEUlqgNFucnjKcLkXPSHw0HYmoBPSsQLnfDpoMnbIKSruWniYexHy4nL0Oyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750728198; c=relaxed/simple;
	bh=Z9u23QLs/B8AICMDFDt4LVDBNXtfpYa3bDh8/47wQeA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cbepokQHnHEhF4CI4iLZa1iy2TL6Ip11qJCtcmBkz0k05enzTLWcOizZ3QhxeVSoBY5+4yKLHNjjTZxjDFzMwWoYFGe6y+TP8O5q37boB6CmraPpqmsACcSeVNk/8tmopIkVIu4hQSo6jnmvophJpyudwP/YAI5oj+uwmiBIz8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mE57LeV0; arc=fail smtp.client-ip=52.101.66.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mE57LeV0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NrUwf/6kkVG3hS52UiI3BhwzFA4dZWAgoqFRxgjW9luIuf0mF+qDhOD9VF9X6ok3vnUyLGQGC95SZ9+G2W32V4VHEHSfC+6N5sihDEYBu5DA5J5fpKgvjs61jIVLnTvYGCFbmjkCqju64Ocwh43ixqbGE34HKnnh4DH2OPvlU+8ReeyvLR5hAQ5p1wB35glHDe+JiuPoycAzX4l1XkZe8O/XRmY56UdnoDC9KqaGzi/b1LJ+7oKIe/kabnzmtDXURsCNAE8jJ6BdymaqvQjRM6yZwzdspu8xw4rX2Dtz3ZzK9ZgvZR4f0vj+km56wh045OhRCPYUUf1DYQAlefVKYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9u23QLs/B8AICMDFDt4LVDBNXtfpYa3bDh8/47wQeA=;
 b=F4Wc3rTGbouz5LBCsP6vrp6iG5ZymIWCLVngE97Av0fhttNcIAVvDOU5rD/Sk0Oa8IE7oEyrCJn8Q5gzrBbmk071WIs1c5+4V5O/gt73NImW+Kbd4iTNeUhMt6eWKgHzEU38sx6xhBXMEqpjZzSkFDgFZXWpEWBGj6Rd2+BwLPiSRjschSWZoYDZtBFOF/AiZ+sOAHExiy8n0oErE/tNrLjYC1uujmUP7OWiEJoRv9yCT+ylHTzpgupDXbd8clSPHXhNaRp9T2dwZVM/S6ZBuVTN/sgxcnc6TpgldTAZHHckOGIVV0YmSBc5oXKfvxnUhvxg6qUCTxzi7QE4exGCqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z9u23QLs/B8AICMDFDt4LVDBNXtfpYa3bDh8/47wQeA=;
 b=mE57LeV00LDwK5H01V3uxrxMjecae9pfz4B7enIoj+S/vSakLFCXjNKJdK/aU5vZu8ZvWlzXcV+suI5WjWPwTUyeTChSa7D10bBAi+5rd0CfT6ySOCEDhSKu8sx5IkRmBvMXUZSED0Cnx2AS4BsuUNH6yyo+F2Lqmk8vfe0IlTIVXCZbHVHBZfqZwcmlaGj7NHIOx9nozLpDTiYCKlv9iciZ4vonqkO5Xp5amg+9hrqroO67zLmPfRgb+vtgMxdit/TCR1p7VAoHOV3ZlmF2ZlWdK5cRYybIa+3k5eMRJ2OYGypyrJ5O/YQtYX5tEe6xrfLvIXhNg0iscezCmlF62A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7879.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 01:23:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8857.026; Tue, 24 Jun 2025
 01:23:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Dhruva Gole <d-gole@ti.com>, Cristian Marussi <cristian.marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ranjani Vaidyanathan
	<ranjani.vaidyanathan@nxp.com>, Chuck Cannon <chuck.cannon@nxp.com>
Subject: RE: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Thread-Topic: [PATCH 2/2] firmware: arm_scmi: power_control: Set
 SCMI_SYSPOWER_IDLE in pm resume
Thread-Index: AQHb4ZTdrhHtd/TLakG0cS5bcsjkmbQQua8AgAAZvYCAACDfAIAAlPPQ
Date: Tue, 24 Jun 2025 01:23:10 +0000
Message-ID:
 <PAXPR04MB8459E323E3C77A96272BC1728878A@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250620-scmi-pm-v1-0-c2f02cae5122@nxp.com>
 <20250620-scmi-pm-v1-2-c2f02cae5122@nxp.com>
 <20250623125750.kzwndmcf5yo3siao@lcpd911>
 <20250623142957.GA10415@nxa18884-linux>
 <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
In-Reply-To: <20250623-organic-foamy-tamarin-fefa30@sudeepholla>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7879:EE_
x-ms-office365-filtering-correlation-id: a5e3fe49-d5f3-43a4-fe0f-08ddb2bdaeac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?7ppJnOKLbNU45E2Vn3YSSL+CVIn1uzCmDdfVk8wdeHqiWargiCVDT+WqdrrX?=
 =?us-ascii?Q?SYB8odLpP1P5aaISm+FjJs5O97LGcZj1sAoKZa+f6hDx8u8EDPKr/2nLvdWI?=
 =?us-ascii?Q?GkAnUvfcdWl1L7rgSJ+HiB705T5VcO3O09k3ip50dylLiNDAdTderlB0PtP9?=
 =?us-ascii?Q?ejZCTEnkAYTG1uDNAvNa6LFikw+Pw1ca1gokECo/FPn7emQ7qSkIyqTeqtmU?=
 =?us-ascii?Q?bHK4HfxvHcfqGCReaFkthw1u3hZDvbM8CtvlnIW7ranrwMtY/9GO4wupqLkz?=
 =?us-ascii?Q?7hclILTziBQP+8xS/E07ro9SXfQ9jcCsw4joLKPuUZxyw2IhnZ4aCkWDZmgo?=
 =?us-ascii?Q?KxBbbl1JS2KBBhA1q/sVST7IltXh6Qo1JUTksHwhI08PBqEVtLqJN4L6kKtK?=
 =?us-ascii?Q?rYT1VmA8i8u6aAphfnGxVgR8mZRUgeb+Dww4eYqCtI1fuSPaW2Oy3cKj75oz?=
 =?us-ascii?Q?6pRIEGTQFCIEVZU3xXTvB3F+0FEEe4luGI56+GUtblrHN74lPIZW1pQRQV/3?=
 =?us-ascii?Q?l3WQrgMbBqS9B73ptgj7n7YJ6SFE+xH+9TQUWULtaOErm0mjOIKPWN54XIs0?=
 =?us-ascii?Q?SCx4EIyLv5BcG/50QgzcQMz2EwvTczRnEoj3I5dKfoxLU3I4S4S1gQwGH44L?=
 =?us-ascii?Q?8PpI1YVz5Hp1rYf7IAtqKLH8lKg8SNexKQKl2h3nz9UH06HZSFWigPT4/ATD?=
 =?us-ascii?Q?BF/kTJEt7iyeXtn28aCdByWdJyQKu1wzThnGJCzAriikYew4cMbSJWNXdpYc?=
 =?us-ascii?Q?ZmIdALK3nPm8YS7zM6EIOO4dFYAfcOUClWblss+ofYymCksknT2WqlZlLCwU?=
 =?us-ascii?Q?3Vb+z3SRwzw64axD8OCERhFr50KP9qcgc7SkbWZgZyNYZS/x7p2SM/094iTB?=
 =?us-ascii?Q?KMa0xj2hSwsX8bTpIciRSosfBSK8O48oye0FSfu2PQinnFUJkGuHN4oc2THD?=
 =?us-ascii?Q?Nfssbgu34+j2lJYMapX0ER8OdtxljGlOF20bekwD2Vt5mGYx+YhNb78bBWk9?=
 =?us-ascii?Q?F5yu15V7tIygY8RaTUC+5FetuLHf0XMcKsBKQRMzoXXJmu4nd4rWRq/+rke5?=
 =?us-ascii?Q?K5yjD4E4jJhpm30C6kcI3jE5cDcqJ1jMbaBIFos4raC5TG1ZljNl5f6Gt5gb?=
 =?us-ascii?Q?fLiW2zwsQSlFbXtjeQqthth5B87w2Uaj0e21N3ibejwCr+QpYNFfIm/rKxFm?=
 =?us-ascii?Q?a0RrbomdHjuWHuSW0tCQUh9hq1NmbMN4APXuLBqMaNudNKwFCukF1dMCKLgB?=
 =?us-ascii?Q?JiM0xmk0Jceed+TMvmh+zttgcDZQUM0WCxNffYjWWTOlcvboHaX8FZC52vCN?=
 =?us-ascii?Q?L1x5U4wihxIMFfGopppKROaaAA8AMP+3XiMZypH9g5bJA6SV1te5JFeBMCxa?=
 =?us-ascii?Q?c7QXTwC+MG46BBGtab4LrdL6btM5kIicSVC+Y8As7okcPNElZy5xSrzkKQEY?=
 =?us-ascii?Q?lbzivyHW8YAaX2n6BAzPkcitpE1rhsvboTZ7787GKykhZcg/Y8AyL4gxwlyP?=
 =?us-ascii?Q?jGiYW7MlOp5A120=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9x+9pckBm1WjXpN/xQrs8A+8al26qL7lec+nE/Dd9z8ESQUx4SVfnVhzsDcO?=
 =?us-ascii?Q?eErQeoS+Hc1yT2ygqrYl//e6aLhKQHSxEfgriOEv+CUomRG03CXl+fBGsBni?=
 =?us-ascii?Q?fPFqSk22cBUHFbb56112oC9yDlRy6Wt9zZJnwCWIGAlsaO+hLyXY3IZwKYw6?=
 =?us-ascii?Q?ZHwpeBUy5eheEGapq0XZFCX9C0lfkOYPnQJ7Zy/N3QRl0dXWdG0q0hGhZann?=
 =?us-ascii?Q?bPUvsqPL0sCmqiJ0WPJP844bZuSMW2xPZWN9ktX7jr+7eNJRdJ+AUIQbiFyA?=
 =?us-ascii?Q?nYauesSEX6cmqovy1LG1phaeUGE07fmQS9nY9VmOHFx+ZHH4E02tyqe2+9ZW?=
 =?us-ascii?Q?1UpHjOIat+xr4PyzFwpbVXux1vCWOd6++EgmbBPzc1o1aJkS7PlwODJmjYd6?=
 =?us-ascii?Q?w+kYvRRHIGBWjG7V7FMeHEF33HBVQNMKDQDThu419ZicURVtET69RGIFFhyA?=
 =?us-ascii?Q?a2CZ/TOPcoN+v3LytSAmEeB91rgiACo9DH3EJkn3d5EHo7ZuJUkrS61l96va?=
 =?us-ascii?Q?IQFHbPfFYqESfc1wmOO4sU5JIQMsVhRz0NGRPARNiqb30z8y4PIKkOntFg+F?=
 =?us-ascii?Q?Aii62DrpvDZ1uUFKpfKhPOu+NKcYKFcrYrXWBnt+QftQ492peaaB8q2BvjMC?=
 =?us-ascii?Q?Zk14CSN90GvNbFjA0bG7+s+2ZCFRFxfm6gwkkouUwYmkWCDMtWWUG2jvP1sS?=
 =?us-ascii?Q?zypXxtQVSKglEYOFsves3GJvqNpwgVPe6pJztxfWJ29AVts3e8pf9VnKMTsV?=
 =?us-ascii?Q?4yQxvr1bW1FYauxFkvlJI1QM0oaUKR7/BYDZwT8Klz3uWwa5oe5GsJeSD84C?=
 =?us-ascii?Q?Jx3N2EwU29Zl98xNDCQ8DI71L4DS/KtQwqszBwnuTB9p57wizKO4Y3qXqja0?=
 =?us-ascii?Q?yooUtJuT0CQMSqW+k43JyP3F1uqoRHS1vmmaOs7VGQZv43LIdtYo5xjGj9Cf?=
 =?us-ascii?Q?85heyAiWMkEBw8i2qJY5AykQd5gud8MXQwUB0EU+uojZPExAkc3ko4CV+Wmn?=
 =?us-ascii?Q?TCe7EBVG9dRpJIG17oGDa5d7f9YNg/hVIVSbrdoM2XSUm/ANsNKhWycnlrGl?=
 =?us-ascii?Q?R7wV28iOU1xqSep4Z/4lds4QbHwGihn6XibJWUV7ZxgMgJ5wFm7JukHxjgOj?=
 =?us-ascii?Q?BDfcBrguP33zqiN5fXfcl5K4hAGJ2PIllaN3hkoVzCanEoeDnGA+gNBoLwGL?=
 =?us-ascii?Q?XTyiitAnPy665b60ymyhzc7vawEr/4KTLgXb5pvAYE6hYKKclHXYGpV7vE14?=
 =?us-ascii?Q?aBe9GMiu7rf6+x6W3DWQ8Xobi9hXAwzcy1/zJZEMF9n01ctV0SOhuarsjinR?=
 =?us-ascii?Q?Gu9DMf7DaKYfZgieNWrH4hiQdwPZ2B831b949ATdSZ498QJqqqYvvVBxQqN3?=
 =?us-ascii?Q?KOtdQZ0/Y5QPjZ2Pg4guUtK9f2UsroqmBuyXFa6KocUK2MsUnqoYSdWaL1+C?=
 =?us-ascii?Q?HJrXqwcDTaaNzc6LQYhBqvCl4KSx/uh/ZWDo5pqNvd52BjEkCk1N4orULv//?=
 =?us-ascii?Q?nZkYYL/CvsIf8kcOVslyXtr6WBIqUP+AWcEhBbQDe9csAN0NT+KcJP3BSlnw?=
 =?us-ascii?Q?C8tdtxbBNUCDtQIhte8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: a5e3fe49-d5f3-43a4-fe0f-08ddb2bdaeac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 01:23:10.5324
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yv24kY+u8JACC8lE2h3wjB3gxTPZpbV7yaT0pEifRwBVzOPHdo9e6HYgPbBOi4MMVogBKIpD2eeWhx0y1eE6sA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7879

Hi Sudeep,

> Subject: Re: [PATCH 2/2] firmware: arm_scmi: power_control: Set
> SCMI_SYSPOWER_IDLE in pm resume
>=20
> On Mon, Jun 23, 2025 at 10:29:57PM +0800, Peng Fan wrote:
> >
> > One more example is
> > Linux suspended, other agent send reboot linux message, Linux
> should
> > wakeup and reboot itself.
> >
> > Same to suspend
> > Linux suspended, other agent send suspend Linux message, Linux
> wakeup
> > and suspend again.
> >
>=20
> These are very valid requirements and if this is not supported or not
> working as expected, it is a BUG in the current implementation.
>=20
> As lots of details were discussed in private unfortunately, I suggest you
> to repost the patch with all the additional information discussed there
> for the benefits of all the people following this list or this thread in
> particular. It is unfair to not provide full context on the list.

I will collect the private discussion and post v2 later.

>=20
> Just to summarise my understanding here at very high level, the issue
> exists as the second notification by an agent to the Linux to suspend
> the system wakes up the system from suspend state. Since the
> interrupts are enabled before the thaw_processes() (which eventually
> continues the execution of scmi_suspend_work_func() to set the state
> to SCMI_SYSPOWER_IDLE, the scmi_userspace_notifier() is executed
> much before and ends up ignoring the request as the state is still not
> set to SCMI_SYSPOWER_IDLE. There is a race which your patch is
> addressing.

Thanks for writing this down, It is very correct and clear.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
