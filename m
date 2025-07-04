Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013028.outbound.protection.outlook.com [40.107.159.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FCA29A310;
	Fri,  4 Jul 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625848; cv=fail; b=RO76VimeK4VzDHkrFgb4WWHXmOUQS3QAjWtBtlCHBQmZmya+CZbptzhS1kDp9MrrNoa/lc66svq6t67kfE1t7vRLbw69JWLDl6lrPgkV1nomRBthLuQSfj3Dry8Q0dlqn+2mZn2wNVoSf3igwWnryLsc/SA62dbsvEOJHrrbAvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625848; c=relaxed/simple;
	bh=tkHqHszBhrTDvwRdDISN8NFsOjzqNhTNgptpvV+Pmqk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=j8LmZ6/l2dQxeFmcqxNvZoPMWDv8QEHrDe9Rx1chfV5noOZ/ueMKhmHY5fF089expjds1E8W/cuq9C56XJZD4fmkhVK4WpzQMtunjzYLacYpDu18roZ3JVAVjbh8ZMcSpwKA/ouG3vRVQQ0KO7YTf9+T/V4IBYOBZi8z0BU0fLM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CtA8WW6x; arc=fail smtp.client-ip=40.107.159.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CtA8WW6x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUZ020z3KECvnC0W1rRE85ddxOUGNZ+PJFdsDRPrEjOwLlt5VQPWP+aiMePaxcHRtPhCeEQ5NWqgjMfdNnotgAS5mEYYzn9X+A9RIhyUvguU9JVDNaGx+rBKqS3Cazugf2tB/yz+Qiba83iTiUxiwe7FSI3t1M6r7A6IsfQVMTZJESn7KRN+09YtZM8Zm4QYmbep2q6dw2xd2uHAFKk2EHhDlCJiUM53PZgDTiX0Z5hjUGLWxPMzXz83tX5rIhyDlcH1v0XsFNkElAnHMiaoF1G2JZbEdYJJEB/ij8Zf07OHsiInx6u918ufCmGTUqchmWNC3AQ0t5TAsp0XB537/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7OlJzA6kemK+GQvR6aot25uPfVemXKmbPo2mZj9AyJ0=;
 b=ytluWHakPrrjVOkogtRmHWbJ8/di45rnJHG5bShQnWsyXObhd3c0mJQJP7M+iLos8CyC4dS13gGN8dc8E56MFntocp4i/O10LvZRyJd8GuqVoomBGLO3cbDO7L+EZEHZjEpoRr4oU+lYFtXnW0YnIRa7cLExAPnASTJVtVzw9/Z0aqSNwEEF3VwUH6Zd1kvLtO+pLEIqLLpR9vh+6OC+bFGfgs41zVa0qew6QlFvtB31cEo/CWOvYq4aTrcukw2+OoS2UkEXkuSbuovTZ/flgoJnmhqAMUfd3Y+9ZQyxtrmQl6q3OOJHh6Lzds0J59h2vUO8nLqr/SIsc9IYEj+1mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7OlJzA6kemK+GQvR6aot25uPfVemXKmbPo2mZj9AyJ0=;
 b=CtA8WW6xT4P0aA1Gr2ktI0CWwRwA5xgZmzXi0ntvnS7bbhcx6mq1MEHq18cABFEmaeEIfo7OnO8uEQMx0lka29lelzikhQPxxQAheXz5cEAiyVsN/RY6rgYhJpM6WBKT5X0yAt8Ihbh+T3pJ4RHPK3Dpkq5TU7uu3vr3Gjd8HZ7r7cs4jMEyF8jigiQLw/zXe72x3Pm/U2SkZ93ayW0JhyZadXcstu/0H48XTynF1QU6hfofcP10oPc4EsTc4DNsCdZApNz8HV1APd3hcajpzVsy1JS8w193D/rRGY+xSbS/91lIo4FSN2/7DgCylXsJVzQDRrgRfjp/dJWm8MDDbg==
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by PA1PR04MB11011.eurprd04.prod.outlook.com (2603:10a6:102:480::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 4 Jul
 2025 10:44:03 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%3]) with mapi id 15.20.8901.021; Fri, 4 Jul 2025
 10:44:03 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Sudeep Holla <sudeep.holla@arm.com>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>
CC: Cristian Marussi <cristian.marussi@arm.com>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Thread-Topic: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and system info
Thread-Index: AQHb5ymTrepTkdbPv0e00FB+E3GAobQe/AGAgALSTwD///Q+gIAAD/ZA
Date: Fri, 4 Jul 2025 10:44:03 +0000
Message-ID:
 <DB9PR04MB84614638CAEFE08EFFFF94B68842A@DB9PR04MB8461.eurprd04.prod.outlook.com>
References: <20250627-sm-misc-api-v1-v1-0-2b99481fe825@nxp.com>
 <20250627-sm-misc-api-v1-v1-7-2b99481fe825@nxp.com>
 <20250702-berserk-paper-uakari-74a8bd@sudeepholla>
 <20250704102802.GF4525@nxa18884-linux> <aGei1YOnwjqqznrW@bogus>
In-Reply-To: <aGei1YOnwjqqznrW@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB8461:EE_|PA1PR04MB11011:EE_
x-ms-office365-filtering-correlation-id: 050f243f-d85c-4726-840d-08ddbae7b146
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?K4Evct3bdsEBNRg/RiG8yHewxFlpAGcr5oR2zr7gHaidaZij+iZRZ4v/nyvU?=
 =?us-ascii?Q?crnfLEYqnGzmOR5p0JzUZTvtniqikEpargzuSe34je3BYRcMa3GQhUK/HH4h?=
 =?us-ascii?Q?9ZlwIXuIWcmnWI9mx+p/08uhw2JpDFg2HtTZt0OtzJHlneQ/Ckibm3xhBPaY?=
 =?us-ascii?Q?d6k5QkbnVABrTrD18y6FRiNOe7jxlrNV15i7rZqg8psoz/Gh/WE/yUrsqk6e?=
 =?us-ascii?Q?IlwO+/wOUaAoCUiYJIcqKt2JJ04SghHJTDzm3actWi6DRoDkx0c0wJqcfp4o?=
 =?us-ascii?Q?Env07lvZ1tdMT7F1UnoY7uL6RA8z2ItBcDAbJ2S5fVHshl96DEY+JJ+NL4xs?=
 =?us-ascii?Q?kA7DWBiLn5g59QL0R3bKkDVN4KtvBa4kDo8FshyEu4HDH0spH7NgBg5PMtbI?=
 =?us-ascii?Q?ftVUWiDw/li5QeqLyL9NNtZ+chF+R/otJxyHGZ/4xOK/CN4VTg6hVHppJiPd?=
 =?us-ascii?Q?BJqXnjN/+g7rumADPI+sGsQg1nC/TZlkslLa/Bs4qnSGBwflZmg0/LgFuueR?=
 =?us-ascii?Q?Y/kGPXb2MvgOZ0MKCbeacAldaYRi3AqzDodOViGgtD2d3nyGEv4eQFQGWcsj?=
 =?us-ascii?Q?senFpi0E79M9v3dbD+NtbTbc/5x/xcCNW4G+FNogkBVIT/hQVuc/2HFe02fu?=
 =?us-ascii?Q?3Le20/wGGk0lBWq0zyb3IFX5SUu4XpRo6am7cL+tO3sYnETmY06JkKcvO/mg?=
 =?us-ascii?Q?BQEBKVol0ImriMAr7dLmdmIEuOHrv+KawIR04NQWa9obETwsc04fLjqydZJM?=
 =?us-ascii?Q?pESQM77QopooRrs7SEziKvAwF870bM7f+CKGcQAx2W/BuwOdVGeEQKzXTeJP?=
 =?us-ascii?Q?DI3tB4F/RV9JBAjIExGgRoDS1KKA/XAi1bS+vEc2Sz2w3obsDF0vi2frUW7z?=
 =?us-ascii?Q?sgPPyYKDNrTp6uH4G3JZg2LQ+pd3gaYuw3smi+osCPrDE6ObHccwuy6owOug?=
 =?us-ascii?Q?AM2oYBxJGW4/cKYrS59NydnLQ6d/nZlU2HZL/rxhZoRWp3xSrlbZYP1VMxM7?=
 =?us-ascii?Q?gR1A48eERO7NSvNi9+ZIsbljJvUlfh/8Xj6wEw18dfpbMLLrothIid5FEcPe?=
 =?us-ascii?Q?RyTFey90RDwXNMWrKwLYk9V1boxGMcx1Uiw1Le1q1gizvTty0m9O47cj7j1/?=
 =?us-ascii?Q?KyufMJAHL2zR3mZGlpb4nQZIskrF7glY4yJxmXV7yP+LEmCexjl4IuZrEKDB?=
 =?us-ascii?Q?t57TEct5vlo82RZgX7gqnCbMze9FL39dIK8N358gT4rs4ztQJVOvyut7mFao?=
 =?us-ascii?Q?oM2rAO1aPwh+Nph1k7Noh96VThG5VaNIWbz0TYzs6yny0SdV37mRe13NawfE?=
 =?us-ascii?Q?j2Y4xL1MtYLOVzucMf/nHu8HbNPs5Uxl2K8NY20N73oqpXJx0E97LARGdBo5?=
 =?us-ascii?Q?EeKP7c31n5OevFCWlRoujnzr2hx1B2Dc2S+S+uRQCmgTaojKDvwX7Tg/hBLo?=
 =?us-ascii?Q?WsBPnENuHPO1VKEeNSm80EzcPKpQShy90gKFDpahU79RLBarNv1x7tiRl4PY?=
 =?us-ascii?Q?w5FN8RUQUl4oVgE=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?3K86CpejWKeW1j1Lc1HBx4dfUaxmY6rWFM0zqqsni8vuiiPyomfY250NkDO2?=
 =?us-ascii?Q?kPUYhS76iPyDPD61oXsGOz+MdgbF3K/+J2XI7JoL5pp56ucJFN0uKQ3fG4pO?=
 =?us-ascii?Q?Krm0nzBFYpplhSbg0OqllrJef2v+WQISBwTrY+5k6ilJhDBgrmmTVOn89JzB?=
 =?us-ascii?Q?BFM7PKw0NapnZL2n/W1IvyIw4hyXF1E50W3F+rQJSWqjOgzYwpmYhtvNgCyg?=
 =?us-ascii?Q?N13ErB612Y5FqRoNfetaw0eeenEST2AZCWceQhS3X4n+9EhhXkznEwp3e1XL?=
 =?us-ascii?Q?GlD1lm/eghhoD84uiIp+F5Q5ByOZrmKgWiDD3w/4BYwIZf4Y5yBsFGbS0QBN?=
 =?us-ascii?Q?FrbYLO8oZeAkFDo8AJq1IJeqEG7xoLdZmlAng+/r0YZs7beksvWvvPHj9H+n?=
 =?us-ascii?Q?xa+cehq1YSefLetEaZRoCpzCSjzjixNyIZPZ7EjGymJPDuwZQlm6RDIEJ5UZ?=
 =?us-ascii?Q?48A2BXDM7rxrA7Xw5G3ikBf8AxGXjd6wrtiDnjFF0Aal0bDaAGYiWdrNky/U?=
 =?us-ascii?Q?vzzMzY0ae/TVFykNF5yc1IdigLZjtf0hHEtCFekxtVGgrvVsPG1conwPJZ5R?=
 =?us-ascii?Q?lYwC+ovxvvIUCmO42ymL5KRVuOoFvTWV9QTFO0vsQd4gUbzR1OMJ6cbdIGxx?=
 =?us-ascii?Q?qOLf/HqH75SaxMzV8GboluKdH4+vskBi4L273diBumgSZVZxWtyrcLZs68Sc?=
 =?us-ascii?Q?ngQGN4hQ48ARoMrLIuulntgMuWCqoj8k75cW5aFdOi10i6RkSF6BqAWzlRI/?=
 =?us-ascii?Q?5zppk5uYtDVEx6LIWoSNi1nquA9Vur4lBh5QDO8J7OoMhcjcAtGzUE/PjLmo?=
 =?us-ascii?Q?bze9VfqOcHB+efAeWPmTG5xfKTWFdP46GgKtI+yLHojxfpsthO7HJbeH1zz6?=
 =?us-ascii?Q?pW2Woa1+KxkueSb9VC4PrPmwwcB4jcOHZ3tA4nJtW4ygTGAKUwc3+HAqKIL1?=
 =?us-ascii?Q?NeaSDpHe8HUTvvWCyDtk5u5Lq4nlQD5ge7dNMiNTDgGwrpI91h46NRmoXOY/?=
 =?us-ascii?Q?0l8pj0u+Bj54R8bwFJ3v3IVbAZg+n8jGNOuqtYg1/bOkm9zmF7/wGedJg7Fi?=
 =?us-ascii?Q?90oXTkjEgN36i9Dk6RKI1LJ2ZjIMCf6xI+Pg6p7hS0eX4lugzjAnEE38VdRO?=
 =?us-ascii?Q?pYKrjsQKBP7Syk5iyU5Vbi797umWjYmtjRD2zfjb0QP/DANYBh4A3YiSzYNj?=
 =?us-ascii?Q?r1arrb70j5DEWXHViz/XYRRGlKdI1vl2Q/4gyBkpop494ffHEV576RrV831R?=
 =?us-ascii?Q?OEPD/G8lG+xXAFXTDHOilk1oBFlkBPO0ay7+/nD8T7dUDNO9JDc9ds2zPVJ/?=
 =?us-ascii?Q?FewkFE1kscYgjgcFMVO6NIBnc+aqtOTBDFaLtfcNrIkLqddxacUURlrMrAdH?=
 =?us-ascii?Q?qYk2OS/4gL9tc5XJ+U9ex8dnmtj1GGyhapWgtLLbcKm7Jh7nJGsyzlEuYZMk?=
 =?us-ascii?Q?/zYgxb3OtOw5+IFYpmvY/tieNWb1JqJbjVlzt1LmP8Wi6tKJb6IIRP96cKOZ?=
 =?us-ascii?Q?J9cI8vZHMF65+hGrl1jlf5llIKfh+es7SpYJyZcwE+MN7rUzX0Wi6q7LGRh1?=
 =?us-ascii?Q?T9z90IPt/oGkffgMabs=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050f243f-d85c-4726-840d-08ddbae7b146
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jul 2025 10:44:03.0757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OVPlKwv8Yo/J+zJIcMP1qKJIHffIGXQ78WCzy/yPEvKPAOG94T4j+fWf8XXa2RzVgTVKtZY3KrfeyyhyaluoNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11011

> Subject: Re: [PATCH 7/7] firmware: imx: sm-misc: Dump syslog and
> system info
>=20
> On Fri, Jul 04, 2025 at 06:28:02PM +0800, Peng Fan wrote:
> > On Wed, Jul 02, 2025 at 04:22:47PM +0100, Sudeep Holla wrote:
> > >On Fri, Jun 27, 2025 at 02:03:50PM +0800, Peng Fan wrote:
> > >> Add sysfs interface to read System Manager syslog and system
> info
> > >>
> > >> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > >> ---
> > >>  drivers/firmware/imx/sm-misc.c | 97
> > >> ++++++++++++++++++++++++++++++++++++++++++
> > >>  1 file changed, 97 insertions(+)
> > >>
> > >> diff --git a/drivers/firmware/imx/sm-misc.c
> > >> b/drivers/firmware/imx/sm-misc.c index
> > >>
> fc3ee12c2be878e0285183e3381c9514a63d5142..55485a3c4a5c6151
> 02a377f41
> > >> 025a6911d746770 100644
> > >> --- a/drivers/firmware/imx/sm-misc.c
> > >> +++ b/drivers/firmware/imx/sm-misc.c
> > >> @@ -44,6 +44,100 @@ static int
> scmi_imx_misc_ctrl_notifier(struct notifier_block *nb,
> > >>  	return 0;
> > >>  }
> > >>
> > >> +static ssize_t syslog_show(struct device *device, struct
> device_attribute *attr,
> > >> +			   char *buf)
> > >> +{
> > >> +	struct scmi_imx_misc_sys_sleep_rec *rec;
> > >> +	struct scmi_imx_misc_syslog *syslog;
> > >> +	int ret;
> > >> +	size_t len =3D 0;
> > >> +
> > >> +	if (!ph)
> > >> +		return 0;
> > >> +
> > >> +	syslog =3D kmalloc(sizeof(*syslog), GFP_KERNEL);
> > >> +	if (!syslog)
> > >> +		return -ENOMEM;
> > >> +
> > >> +	ret =3D imx_misc_ctrl_ops->misc_syslog(ph, sizeof(*syslog),
> syslog);
> > >> +	if (ret) {
> > >> +		kfree(syslog);
> > >> +		return ret;
> > >> +	}
> > >> +
> > >> +	rec =3D &syslog->syssleeprecord;
> > >> +
> > >> +	len +=3D sysfs_emit_at(buf, len, "Wake Vector =3D %u\n", rec-
> >wakesource);
> > >> +	len +=3D sysfs_emit_at(buf, len, "Sys sleep mode =3D %u\n", rec-
> >syssleepmode);
> > >> +	len +=3D sysfs_emit_at(buf, len, "Sys sleep flags =3D 0x%08x\n", r=
ec-
> >syssleepflags);
> > >> +	len +=3D sysfs_emit_at(buf, len, "MIX power status =3D 0x%08x\n",
> rec->mixpwrstat);
> > >> +	len +=3D sysfs_emit_at(buf, len, "MEM power status =3D 0x%08x\n",
> rec->mempwrstat);
> > >> +	len +=3D sysfs_emit_at(buf, len, "PLL power status =3D 0x%08x\n",
> rec->pllpwrstat);
> > >> +	len +=3D sysfs_emit_at(buf, len, "Sleep latency =3D %u\n", rec-
> >sleepentryusec);
> > >> +	len +=3D sysfs_emit_at(buf, len, "Wake latency =3D %u\n", rec-
> >sleepexitusec);
> > >> +	len +=3D sysfs_emit_at(buf, len, "Sleep count =3D %u\n",
> > >> +rec->sleepcnt);
> > >> +
> > >
> > >Why can't this be individual files and values ?
> >
> > The System manager firmware provides a command "syslog" to
> dump all
> > the information, I just follow same.
> >
> > With individual files, some values may not be consistent, because
> > system behaviour may change during reading two files.
> >
>=20
> You definitely need to convince Greg if you take this approach. I am
> sure he prefers single value sysfs files.

ok. Thanks for sharing me the info. I was not aware of this.
Let me follow single value for sysfs files in next version.

Thanks,
Peng.

>=20
> --
> Regards,
> Sudeep
