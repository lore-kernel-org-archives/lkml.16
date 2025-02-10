Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060.outbound.protection.outlook.com [40.107.20.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FD22580D5;
	Mon, 10 Feb 2025 16:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204927; cv=fail; b=NvDVpwXO88Wn3UvCD98+hrlkCaEn1yJsZhKW3he8i3j8GDum+yrOpe37pLZ+MiTBtch45cLQZnDTBsD797YgB4IvDUNL9Az2RQC1QpnEKHshZX93BuMXmM2t+4aRxT5Cqe6SxQxF5h2t/pDkOjrE8Cz8nu8M7de2yIhev1hqkDo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204927; c=relaxed/simple;
	bh=ghoCWBFiKpvQVOECZ//ld47s5ijn/WUsp/DAw6mOWSQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MBF7S+CDZeEMG5AWaqSkpMHmVqGg7NXoSjaIAUQiIWRMDwsnhElNDnxg+xd9raU7k8EwJsDAG3VjKMTj3a6Y1C8lHlOPeI+hrl4yE/ov+UGKjnp4KsKyHJgbkjut7+MT+ONrOUFNHCN4+0UwYFTgglfkXfNjpBv6TZLhKPRPS2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xrBpPC99; arc=fail smtp.client-ip=40.107.20.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xrBpPC99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dc1MX4AJ/m+ER8TKDYcEVyhBvyxMskisD0ksUY+R/felMnF2nLDxAQOUHQMEgm2hA1idtH0Ju9vUJ9rBbumGth/Sc6jfEU1hLlBkP6wj5BTJhTwMyponIZG0j349enLzKl4/3ks0VRoEvt61pAV7csF2RXnd5+zCpB1bylkoKVM4yVHt2gty0FrYXwpuKTiwyUcciiOqdytjuBSW10hiMuajhoZBSxWrZLXctY11RdA14RSKQyueGr0fOy8tNDjJjM7d0cgMI88WZLH1TMRqd1elhHV2VwUElPUc/bXh02hbh0ebLZ3qjsF+HfjJCQh72IIWjqOavrOMBXQpIXV2bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ghoCWBFiKpvQVOECZ//ld47s5ijn/WUsp/DAw6mOWSQ=;
 b=Fcf1EHt27DnNWBw9JFCHLlJOaEJZ5TKHp988S2LS49JECHRIwhXEZTna8OBcU06aI1Lde6hKuLJW6mDIf/H5elZqWyWtHG5SWiCUn1a70SCrHfodFHzHYUp/Kl3yeZqaXpLRPJJZvyvBKSANYoRLLBzyHUY8joWgPIB14u0ddLn5ffJ7IP3/Rzg0YTCPK22zJNi+HNkGrvBQdnlIeM3klukZh7cHpweaTLzqZQntpO3OPIjBMgh17kulcVnCI1IwIXPkzTPy1rjuwa4dyZm6dCTbsjomU6AgGFutKWErX54oFQMt8bdzofAIpCMVgB3UGd2cqn5XVunjhvnekDVQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ghoCWBFiKpvQVOECZ//ld47s5ijn/WUsp/DAw6mOWSQ=;
 b=xrBpPC99BRPK+kF3jvDsEh9nG4DWpkEGJkpCdnlTstMG/cAndH8kHI1MihhxgHOtdRUrJP8bzI1py4hs2DiWvLPRinxhRJBx2F4rhOWl0jmA7U4bSVjSqiS/5HyHWkcpVaQ9PZEo0lRsTVZXajr+29K74bKHId5G/VxpAdXOXASBoawdvfehEJ+litj+NgeGX4vZnKw24FhO1RoYh90GRoCtFVKTl+IDuwSVs3JPah6R4ynyXTR4TN0thFlaWPyK/6H9rQdy1o5Y9ITR9lE28uioEoIZ77ieP1npJqeZXnYh5Bbu1JkcizCLu4H6oqtdy/SWcn/VCokF08rA4qUiFw==
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com (2603:10a6:10:5b3::14)
 by PAXPR04MB8877.eurprd04.prod.outlook.com (2603:10a6:102:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 10 Feb
 2025 16:28:42 +0000
Received: from DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db]) by DU7PR04MB11163.eurprd04.prod.outlook.com
 ([fe80::3a74:80e4:4144:62db%2]) with mapi id 15.20.8398.021; Mon, 10 Feb 2025
 16:28:42 +0000
From: "Florin Leotescu (OSS)" <florin.leotescu@oss.nxp.com>
To: Guenter Roeck <linux@roeck-us.net>, "Florin Leotescu (OSS)"
	<florin.leotescu@oss.nxp.com>, Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Viorel Suman
	<viorel.suman@nxp.com>
Subject: RE: [EXT] Re: [PATCH 2/2] hwmon: emc2305: Add device tree support for
 polarity and pwm output
Thread-Topic: [EXT] Re: [PATCH 2/2] hwmon: emc2305: Add device tree support
 for polarity and pwm output
Thread-Index: AQHbe4zEWHzGGmAHn02CbSTZK/YJJrNAttwAgAABBRA=
Date: Mon, 10 Feb 2025 16:28:42 +0000
Message-ID:
 <DU7PR04MB1116331DC84A4AFB975D5293AFFF22@DU7PR04MB11163.eurprd04.prod.outlook.com>
References: <20250210073158.336522-1-florin.leotescu@oss.nxp.com>
 <20250210073158.336522-3-florin.leotescu@oss.nxp.com>
 <a7836a1d-4462-4f49-abd5-16aa22a19160@roeck-us.net>
In-Reply-To: <a7836a1d-4462-4f49-abd5-16aa22a19160@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU7PR04MB11163:EE_|PAXPR04MB8877:EE_
x-ms-office365-filtering-correlation-id: 4a30625a-cb0b-4348-9e63-08dd49effbb0
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?1y1A5InNgIHhAxv5T4SJvnjxd709JKiwe24LzZC1w25/DfljuVAQotx4dY+d?=
 =?us-ascii?Q?P0m3JVvWXnoOMOfrBenaDtn8yNlCxwTYwluxL52106DmuQM894mX4GNmtRU1?=
 =?us-ascii?Q?NjISFqmmPGA0ZFBDyIQ7AlljMUtVU80YRa0bNqmXDfZnQFMw/YnuMVSnDC8Z?=
 =?us-ascii?Q?UCndOKwqdgHkrA7hGCwiFW88s9u5Vy0NB9DutSfUUzRi4974+a6dXzb/oNZY?=
 =?us-ascii?Q?cinkWj6jn8aCrUUbevY8TkR+/TnshFAG37ThAFH7m48+Yp+6mzajZ7wL6UmA?=
 =?us-ascii?Q?YlWHcFWN4Juc2+eJ6k7Bp4dSKpieQslW/k2BMzs3N5pgUbN8nDLafJSJNoDp?=
 =?us-ascii?Q?K3wgMuhd2z0wt92gQ6iWdc3KkU/KMUXoC/XVqubnVYe+oUP8zbFIEs1o8DIu?=
 =?us-ascii?Q?AQ941jovS1zZFWRraqFVNTOP/2aw0VRKY2EwT2J/8pUJbX/xMN6zkop7WmeL?=
 =?us-ascii?Q?bkaWU8kxskpN/G1kE5wsAb4v4RblDueYUOOac7k+JlIQZSHNGu7MxiXgVZyx?=
 =?us-ascii?Q?ToDEkJ5Tvi2IKhicquk1jnzYSRdakKvHe85sC98R9IQesiJAJCIuQ/pKzTQV?=
 =?us-ascii?Q?EmI0E0RjEseiAxBbTaLP6oLu+Xo7e/aMUL/Z5ZrY+6kcyh2wetKAPigDfyY5?=
 =?us-ascii?Q?0+2NhgLOHjOmI9qWvi70PtiSBtC5vwQxYEB+MbqzybLj9N7BxA9iD1JVRRSm?=
 =?us-ascii?Q?/w/SKRJCI534XsXivVL+axh2DzkdN3oHh1BnDzzmLHLl+rqhhvJaUWaoSn6E?=
 =?us-ascii?Q?5kl7dPRdB+AFCdhERRthnwCzHRcycuQeiGDtWv6yEE9l4OdZJz/08mdlqaMK?=
 =?us-ascii?Q?LuS8uxE71ejllT3quVERcpM6EHNnLE6fgRH3Z9Kdu9nB+G1iGq1alnM+azop?=
 =?us-ascii?Q?1zSx72xuCv0xbwarPTQMJxg24/eP2DkyzHTTwRrtMR3cS50X0jUzSllifMCu?=
 =?us-ascii?Q?YAlGmBPaT6YerL87+ZQ3AOid3S/oJ/FQax1dBC8YfsRRp6ygKm6YdsAu3nWF?=
 =?us-ascii?Q?rJUuo75NEaTJteeZYz025CvHRhuHoVF79BLKfYRZ0FHkhF2/ags5hGiWOf2t?=
 =?us-ascii?Q?SbNHVN8Gt2vTRkUi9ktyQyB5MXmfXxdPhsU5eoLklr1OfYul1bVpyEEMRh2P?=
 =?us-ascii?Q?YmFLvUdLDAnZppGr/qzyGww9i5/wagbOIeV0YCmTWP1BJ1In27+iY0Sxkq6N?=
 =?us-ascii?Q?tqKy5sErkar0aZBNK9mItWYqTdD32QeWjtYzVFVIOKLKLIbgJ0yc6E9FAuGn?=
 =?us-ascii?Q?bQssBo2bb5hzSzGqWMOYVHLMoF1SOcjFvUeiFE1U//5Nlw6u5BiZhtkXRqo/?=
 =?us-ascii?Q?hrlYH2D0J/hiSrGijI5b1GCq01Vpnkj4N4r4QVE3m/9BlNSCvijXeLx02pZa?=
 =?us-ascii?Q?1ieBmfblg90CaaEYBNxGP8P3BqKpldrhnwvV+tzpBrNs/VfY8ETacuaTBuno?=
 =?us-ascii?Q?iBbQ3gqBXt5+RTliUmHdP1ACTJifwxaI?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PR04MB11163.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Cd4r1F+luNtAthTovRW2gBiYGOGm5iOpePFkfDfWhlUjmnu6HLCtfrPEBXbl?=
 =?us-ascii?Q?ytHcFduv3ZvvCM3+5DOOf4K4iLh6GA5AKJSGt8xv6kbfwR2E/WAKUK6lnvP5?=
 =?us-ascii?Q?e35ETg4MftCUcm+a44Zi1XDRF7ud+T9DYioA36yKvDGt6K08vpE8G1gatoaM?=
 =?us-ascii?Q?gqN93S2UxiVs6OrcEBpNlMClvrgd9A8SNtGxF31pugIChXmYRtDmfyMcH+5E?=
 =?us-ascii?Q?L4ChZrikoATk+K0P+1lNu2xP4RerweACBZ8AoW3g/Bd42HsQ1/YDMF6zkce/?=
 =?us-ascii?Q?pH/Blz44LJN8dFUtUVX1L1hEbrUYb761z8KJJlRdBAXSAU90ih6FPwBbW5qd?=
 =?us-ascii?Q?xYlGKtzIECaniC8nUZYVFeU7tNdZlE8TmEunX1TluqEN3+usc32x8tc/wbgb?=
 =?us-ascii?Q?lcdUkwyQG28W013EMxzGf8ACdILkQYwXymXqKUzfzomzctp81XZt5Nhz292z?=
 =?us-ascii?Q?I8YUjHvRjUUDVpxO/ImIEJn2rICbGWVOCWGq41PPLjjAojQ7+wntIcGHGaLU?=
 =?us-ascii?Q?3fI9Y+zcr9cznN6XPa+lY5X486Gl2xGJ0H1bmWhMMAxQfeUsFrK60MYiAacR?=
 =?us-ascii?Q?iN6q6w8aQevMBqFS40RcNh8HEgRCIGtcvhPfNPgXTrvZ9vsgHm5Tl7jLOvIi?=
 =?us-ascii?Q?368JU4+JHPdL79DMnXoUwoH6KdIutHVFHuaOQmKf/B41LHvhiRgebhvylsw/?=
 =?us-ascii?Q?6Ei3tchGnMQBdrPPGqKVoFXukka6rPC4dszUpIIUTVhj9hnaos3Kfu0oNoNT?=
 =?us-ascii?Q?QgMkj0JUbdW0V3DzNy5enBPeGxnNbP+rI6z8DnWgbxTt5gYOA0EPZwAVy1Ol?=
 =?us-ascii?Q?VIpIJc56RmMIES6kVMryJf8VYF8cIB3oEj4NRkTQoh3LXlU9llmvqlVTajtI?=
 =?us-ascii?Q?+PZaKC8XfRQ99ZF6v8T9yPaA1NJ0IYjBF0WDVe6fuj3Q7CPcQOiM9ITOZCnj?=
 =?us-ascii?Q?XFPX1ctgZA888okwPxNz9TTufDgULxA9iJHeoJZhCe8fPpvmezYZDB13io1J?=
 =?us-ascii?Q?/GGFTwAWj3T4PFWmyr6TItAprN6hiPXc9AfBEBgNQGfWd6rMAFSaB0rqKP6v?=
 =?us-ascii?Q?yoN/urR0a5qWi/BOt7whe2TEz73yX5S0/7rSQBKQHug6yqfYZ9AhdCU3tWI+?=
 =?us-ascii?Q?sWPCFzomUd1zfgOmU3rQomVWJrzFYfu0f1Yh6w2+1Qo4Wg++GDeYTj3dOnMu?=
 =?us-ascii?Q?1DB2cQoaZAt6HY3rW4bR16a9qoFbD8u4HcWTicc1pFvt4WDicSZ9XPxtOBUA?=
 =?us-ascii?Q?nd7MEc3nZFiFWrmhDGUvczEjUObN6TPh11Q64he/KCMvyujBDlaOYGKN4M8M?=
 =?us-ascii?Q?0e89Lzv+x65kwlNiQYvGCYBt0ai10E0zOALA8NgqVAggFOiz8OE+alMhPGyn?=
 =?us-ascii?Q?S5qYdJXHypuLEyn5q3HfLs630n07i0o+lIF3SNuQXiV6wVouClsIMXHXz+gc?=
 =?us-ascii?Q?FirRXFFnaKgCF25UlFE2eCsmXzp4mkLutnhatcRFX9LrEYmWQ0cmEJqY2Sco?=
 =?us-ascii?Q?nOODW3HfbG3LGq/BE4GjK8utFsPcO0KGHxR3kFuY92oR2AUpR+DQHBCx4NLH?=
 =?us-ascii?Q?TJPdu416ECJ/QO/qzrMtBqQvLXCvnjprZmwPkh30?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU7PR04MB11163.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a30625a-cb0b-4348-9e63-08dd49effbb0
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 16:28:42.4744
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jQIi5sSevySyh3Q2rCKhAeFZiZQkCC/QXTDy70NCDhOPUx0ac9I3+Zn2R3VwFONwGeXqf3TZlfr/YJgZKDQ8NQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8877

Hi Guenter,

Thanks for reviewing the patch and for your feedback. I will document devic=
e tree attributes in a separate patch as suggested.

Best regards,
Florin

-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Monday, February 10, 2025 6:15 PM
To: Florin Leotescu (OSS) <florin.leotescu@oss.nxp.com>; Jean Delvare <jdel=
vare@suse.com>; linux-hwmon@vger.kernel.org; linux-kernel@vger.kernel.org; =
Viorel Suman <viorel.suman@nxp.com>
Cc: Florin Leotescu <florin.leotescu@nxp.com>
Subject: [EXT] Re: [PATCH 2/2] hwmon: emc2305: Add device tree support for =
polarity and pwm output

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


On 2/9/25 23:31, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
>
> The patch enhances emc2305 driver by adding support for configuring=20
> pwm output and polarity via Device Tree properties.
>
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

You can not just add support for devictree attributes to a driver without d=
ocumenting it in a devicetree .yaml file and getting it approved by devicet=
ree maintainers.

Guenter

