Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011027.outbound.protection.outlook.com [52.101.62.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889471A3177;
	Mon, 19 May 2025 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661558; cv=fail; b=O82FHUMXY7VDx2HiCqXh/R0XoAgC663YsPFgfeuVYh3U2aUiuHs+TDsX4qJDvUs+ifH0fApUzuoRKQb1TzyfYie7DbG9luKwBj2KA8kPZk6R9H9D4DNDdZo2SxChw+owzpR3GsDqBm8P+Q740Sv4VTnbOD/lxhU51D2Hf6W0vu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661558; c=relaxed/simple;
	bh=l6ugkh1I6a0fD22Smjulg0/EgsQPHN0JpBT6jxuoAw0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=QJ3qWg7YE4bAGISzjbPrgGrkwdn+Ac3idHUz7wp/solKITkQKOC0IxGk6aQS8VOiWh50wLSGoEXpvkHx6rJk44uhpQ1HhKk1eDPurbS30l9YknfBp20O8dpyvhNuXz1QqP9hduxx5X/DDYJZwutYuCPAZEr7x/6trGuIRJE0ha0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=fjJQcEu7; arc=fail smtp.client-ip=52.101.62.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="fjJQcEu7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcEJRCnKtRpB/O0+fR7b78yzk3DGvZsdfVrzuhIoFdv17AfZDdJNHbWyoVtM8+SiyFZ3rJ3zrjx4sjdh3ZTFfNpmKqu1gsohaTwjeVSUP4bLvwHQr8Y2Ox43ng5eEpMnHu/daCYmc0fHofdbvjIS5MpYAnBsSYE5uHoGcFaQ4iW/Z/k9j+XRCytJZza/hHWVdbmmLq46UZUzdOLS1kGNQFehNWHy7SqX+10RWCH+tmKpI6Ag3BFdYBX8i5dzyNnJF0kMUEnTEFohze9iAf+qo0xDLKVThOK0xK0vswIK1ADT2pLwXEHJW9qMjXlpWPanr8DF8NXSVhiGD7fQqc+pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pH9rp8uQDF8FuZx4uKQLz/lN8ac54E6uRyj3a6U6qzA=;
 b=rXkxxvuRJlfDUp1XUaMV6dP675DY1XBheJEvuCNPJO/sRMb0M+4+L2qJ44Zv/XNur09JdWszAhddGCnKT0bspQN8gJYshSmtrHMp8EiOWA7LJG4jYDaOn03c9m4jGawuTjcCbyI7b9vNP1yZBep80G5qrZ6g+22qLCZ2j81mvi4RuUC8q0OWBLILWdtIHTKyb978PGal87YfRCmxJjon8/opqVJsbQXA4lQS30hki4rrnavcvfTQcoBfemjb1GkxZkqkgCiJGX32UdtIcoCWg/Vg8FcgjpObqKK98YGEW/U/GgdfOTd5ehyHvL6qc84F4irDnKTuR+mDr9brFOpkJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pH9rp8uQDF8FuZx4uKQLz/lN8ac54E6uRyj3a6U6qzA=;
 b=fjJQcEu7bpytJ/8URioFY45KZr7YVpn7y6ntDffE2Y3HMSvoZ2VIN2uB2YknRvzcdhV3ZrUensbtTg0DzBHS3O5ePSspWT0QiKoKySqznTcn4MKSHvVLGBuHAVT2nddKg3PLNAuvobzp2+hATuf1xGWF4wu+h2yTyl2Gal++MGU=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by SA2PR04MB7705.namprd04.prod.outlook.com (2603:10b6:806:137::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Mon, 19 May
 2025 13:32:33 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 13:32:33 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Jisheng Zhang <jszhang@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Paul
 Walmsley <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Min Lin
	<linmin@eswincomputing.com>, Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Yu Chien Peter Lin
	<peterlin@andestech.com>, Charlie Jenkins <charlie@rivosinc.com>, Kanak
 Shilledar <kanakshilledar@gmail.com>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Aradhya Bhatia
	<a-bhatia1@ti.com>, "rafal@milecki.pl" <rafal@milecki.pl>, Anup Patel
	<anup@brainfault.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [External] Re: [PATCH v3 00/10] Basic device tree support for
 ESWIN EIC7700 RISC-V SoC
Thread-Topic: [External] Re: [PATCH v3 00/10] Basic device tree support for
 ESWIN EIC7700 RISC-V SoC
Thread-Index: AQHbqizJPEHzeCiWtEiadjJsSqcuNbO2G78AgCQSwuA=
Date: Mon, 19 May 2025 13:32:33 +0000
Message-ID:
 <SA3PR04MB8931011F9B1C3B54ED3ED463839CA@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <aAzugucziBi4Nr-y@xhacker>
In-Reply-To: <aAzugucziBi4Nr-y@xhacker>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=0dbc405e-138a-45a5-bc83-9d4d4dc4bb54;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-05-19T13:25:02Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|SA2PR04MB7705:EE_
x-ms-office365-filtering-correlation-id: 8984f909-cfef-4a8d-5e92-08dd96d99c61
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?PKaqUiiO2FnHLOnqN+4NTlcH+3/fYOCw6E9y0D2vXiZoParOm8wQhIfAn+pe?=
 =?us-ascii?Q?+MbLNqDjyDolN+zG/IWTAqwlVBbFs/CYkqY3tkjfxAUhzz4382xwTCDp2oQs?=
 =?us-ascii?Q?rEoFEuKGudvJ+WWcHTQqiZ7nNejnLdJaw+lyuVmSUS6ANdJ2MdBo28T08aIQ?=
 =?us-ascii?Q?aVG5CbiKuungsvJ72Nm+QuPJlrKW9QcGU6oMN3YTzdWWsPJmBWFuwC/BXs2T?=
 =?us-ascii?Q?eu5QPWilXBc/C9H2kWln+RWEYog1BzIyMFUNGZtVSePGjPSUlMZxR3sJTgxA?=
 =?us-ascii?Q?3fTkTmnzt8fhItKBYdkgnejTBfCprWV5VD+E3ltGwncm0186ZcdsoeVqONav?=
 =?us-ascii?Q?LSZTQlyxxk6LDJbz0jQXw/CpJeRJvKGpJcN23oaaU+8TViVJxhYhkQW+z99x?=
 =?us-ascii?Q?qeExGU4HQI2gf20uk2axggvAPcnzKpGworYNCRyVLDQUXCOlA99My2qJcG0R?=
 =?us-ascii?Q?9oJ2A9Mf/sJwJzUl7mRGAHQYplHPJg5qzdP/NLRZd/vm9QtSTBh+3zGlQSJV?=
 =?us-ascii?Q?qwj1C5qJzk5ITQL66ryMi/j4aq/JvyKqldYdFUEnw9kMF4IdF+PYYA292b3X?=
 =?us-ascii?Q?PJYG5saKD16xpCq4FuAJMk6gLySYJKJXiO5fhZg3Z79WOG2DAxuVXMW+Qb8J?=
 =?us-ascii?Q?MrwI9C3rY5TOVcyVvT0T6mk/I9RWvH/MNC2qg+ZfBFVHhAgh0K/jLDBW47T7?=
 =?us-ascii?Q?PMBMIWHhE38uLsKOOGL2Ww6NMmhs3uPhExJDHJ6Mc3Tg/GBCxlh0Uams6Dh+?=
 =?us-ascii?Q?Em6iGbY1wllTf6UBlnVdhebc1r/I1FMhulys0TxoMQWJtFN1slTOy1NVdOPe?=
 =?us-ascii?Q?uLi/lvZrt4hdLK24alsm9+RJyWrw8OY/Pg5mkqHHnWEskKNmYIQ5Zr/Rg/YF?=
 =?us-ascii?Q?t2OjFgjut+qxdAHNJI3axotfV1/CjMl9YtsOUpdyniUkCNmfriXLuo9ASP5R?=
 =?us-ascii?Q?E3O1hCq7WF5t2l1qcL0Ub/gOwbmy/UDTGRQg9b8JF1irB7LgBuda275pvGma?=
 =?us-ascii?Q?2l+ZyQn44sVgpNc7ZlklqKrb4VAmOsrjiycIIJyL2uLjo1wDbPlJ8cgSxq1V?=
 =?us-ascii?Q?3VpGt9QGsKOEf/rUchdKlng3m7vyVFfbqreJO72onIbyOmG9Mi+SGvtzRwuz?=
 =?us-ascii?Q?KibMM+R6+fKMH6rAweZV6rJeAkxhZeGq2/RbsJS/GSwewEFJCH4y4U4uc8Ij?=
 =?us-ascii?Q?43ywDFZdcFRMEYSiPld9CA5bhhWwyDc6Y0eTHL7cpsvl6uzo3nAYj/CIXwKC?=
 =?us-ascii?Q?Cq5k7F48wVV7vRxXSoO6Ougy6zQFXGSZ5qsqRESCXJsAobye8e7x9y70Mpvw?=
 =?us-ascii?Q?xeUxCQTQQTW2xy5tFxEnj0xLpjgvQB/3TeS6WQ+LQpl6ZjtpkGXloyXIqK3K?=
 =?us-ascii?Q?sbqfAZg2jsGXesEHhBSTH5tNalZg6H+a6gq/LgfruCXxEi7CyotBQo4PChdU?=
 =?us-ascii?Q?nEoUQ7ArUnA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?hK9fOCt+6T5+SQlTzj4LFvk8RL62owyso9o+nu1N7mIzNoAmDDzGdOlrXNu4?=
 =?us-ascii?Q?Fwcp5juEqZQJrATyXuvA3CY3mgWlAxPmu9hh8EyhLRJyrYLLfFLM2JT2jJ+p?=
 =?us-ascii?Q?iU1DR8fOnIXlN3vcJ/QYSla0F3AH/UCOlrlOxXw/mPgCQ+xD7hMKHjp9LX+g?=
 =?us-ascii?Q?5yxm13p0DnUNLdLuhtSFu9MRMIgkTeJg8wDetNWmZw7UqJdrtTzjYsXbnKFS?=
 =?us-ascii?Q?AteEOvJYgbWok/ka4HHfdE6PCPZj2TukA0c7CNM9v+K5cy2CK+sBkmo8Nr/k?=
 =?us-ascii?Q?sohwadPXWTkzD0xMrDdMfHhuQATX3tq9HHUyS0LEokZ2j5Fnfa0B9jw8OuLy?=
 =?us-ascii?Q?+mIU12sf8h4YGdbcweLE51NbwLH76NXJf4cAkABtft6Rr0x/QZ4mTAFRUcSV?=
 =?us-ascii?Q?AsqHfzJ9Q466Ymka+5ME5Jc2+WYt/LYK0siVBJtg9MwnyGg/UewnwT7B7lR3?=
 =?us-ascii?Q?BcdFIt8a09hzUXmx1y8xUWYRo9DI4nhMDRxYrbIPI3ZkVRITrEJfI4IG8tJU?=
 =?us-ascii?Q?9RM80jtmhM7iuAw4N/xZVz+YYDGpqICBAU7CcWJvidBuezZJI6tRCahdkwwS?=
 =?us-ascii?Q?6hmnIol2Beg/+PELsan5zFNUxIH3NQY6cmp4DiKeaI1kJ8yTBCpgC20xf1mS?=
 =?us-ascii?Q?evGgFYvvWuHPhggAfb+Ef1q9jhif1GAt1Vu/l7zTen1SNMqp/ku4T8KWFGvV?=
 =?us-ascii?Q?w06bzKC5ptNYngJ2WQvCUNqO0w67ZzkayOTJdIsS4FQvE0IRIq4uKo/9mnUh?=
 =?us-ascii?Q?E4kpw6kf0U+i0tyotmrqtn6bnkDsDXvnhtMdoCuHuJFLOfDgxe5Xsef1uh17?=
 =?us-ascii?Q?2KrQXfwdiwJB1Z0FWmtB4WZ6ozLYgEVClOFjGo31me9R1owC8Yjd/64oV5tz?=
 =?us-ascii?Q?5846vHiaEa8YnZB/I9gb2Qs1iH/Y2WUQWBEOUmqYdwkPgVYfebQqLVox+4ii?=
 =?us-ascii?Q?OXl8FY/urPd0/HzccdW4x6jZkqm/rPsyJ6x2vlRHYwHxXEx31pOA6vCVbjmW?=
 =?us-ascii?Q?cDIBcjigwsC3Zm+VvIlLT/+scffhVcSHSdup8HxE78QEzFr2Mwke4ClWH1tF?=
 =?us-ascii?Q?guam9XmVlbPuILNl7cKy9Ngya0Rz1J1IkvLQJta/GsJTT5G2xcDu1IvCVAzB?=
 =?us-ascii?Q?HGlQ4HS9Wwzd6ZdJduqI+3rQEceqQIPPY5y0f/ju9/OCLDWH5+wRJmZwe1+x?=
 =?us-ascii?Q?BOhdbBSS19bJ4eMAdxZ/fasnHp1CVOVAOn7HdHtUOHy5lycN+CygWaDX3sGK?=
 =?us-ascii?Q?aLdrr4ad410FGz5fXD8SvHri/NcuuEJwa/k0AJSVT+riQxyvQhBdjMBkmA6a?=
 =?us-ascii?Q?/GZ0mi3j7pJlSr0Kda26Vk8BGXI/5DnxKJDed0i123gVq79EC2DVEmc/XWsd?=
 =?us-ascii?Q?uYavZB31P5B4oG8f9MIHavDYHynwR4hJjCJgoliHeI8S6IfKR65OcBaLwaZo?=
 =?us-ascii?Q?Fuhrz/rOkHowkIoct2RKCy2Q9urjFEA+haAbCRI3jex61UnAuOYF9jEqrgD+?=
 =?us-ascii?Q?8sAwJVtMgxEHOaM5wCiIQypAvO4SakbzyMTU0WYJi6TN9e/r+wA0pWcTQFEP?=
 =?us-ascii?Q?wfrJ6GMNcqt683QQUEO6X2ERRgKVxMZSJqe/+TlwVzeuBZgW9DA45vUCdpr+?=
 =?us-ascii?Q?eg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: einfochips.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR04MB8931.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8984f909-cfef-4a8d-5e92-08dd96d99c61
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 13:32:33.1896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8pa3uBWo2jzeUSr3tiRx1ZO5MgxXWMEV2559l5TvhUL0T/9GZ6nA7HNvmcsdqrZv1D/Tn+iODYt7B6NLMYf84UtSP75s0G3zFNaFbJUykZI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7705

Hi Jisheng,

On Sat, Apr 26, 2025 at 08:03 PM, Jisheng Zhang wrote:
> On Thu, Apr 10, 2025 at 08:55:09PM +0530, Pinkesh Vaghela wrote:
> > Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
> > P550 CPU cluster and the first development board that uses it, the
> > SiFive HiFive Premier P550.
> >
> > This patch series adds initial device tree and also adds ESWIN
> > architecture support.
>=20
> Per past experience, new SoC needs at least pinctrl and clk tree ready.

Patches for pinctrl [1] and clk [2] are already posted.

[1] https://lore.kernel.org/lkml/20250515054524.390-1-luyulin@eswincomputin=
g.com/
[2] https://lore.kernel.org/lkml/20250514002233.187-1-dongxuyang@eswincompu=
ting.com/

Regards,
Pinkesh

> >
> > Boot-tested using intiramfs with Linux 6.15.0-rc1 on HiFive Premier
> > P550 board using U-Boot 2024.01 and OpenSBI 1.4.
> >
> > Changes in v3:
> > - Rebased the patches to kernel 6.15.0-rc1
> > - Added "Reviewed-by" tag of "Rob Herring" for Patch 4
> > - Updated MAINTAINERS file
> >   - Add GIT tree URL
> > - Updated DTSI file
> >   - Added "dma-noncoherent" property to soc node
> >   - Updated GPIO node labels in DTSI file
> > - Link to v2:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Flkml%2F20250320105449.2094192-1-
> pinkesh.vaghela%40einfoc
> >
> hips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%40einfochips.com%7Caf77
> b3ac
> >
> 71d1493ae0ed08dd84d189fd%7C0beb0c359cbb4feb99e5589e415c7944%7C1
> %7C0%7C
> >
> 638812757761987583%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlY
> >
> iOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%
> 7C0%
> >
> 7C%7C%7C&sdata=3DzD3XwzY2lc41amPRgFO%2Bz60qj68MC1Wf2Krr9G%2FEQ
> wM%3D&rese
> > rved=3D0
> >
> > Changes in v2:
> > - Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
> > - Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
> > - Updated MAINTAINERS file
> >   - Add the path for the eswin binding file
> > - Updated sifive,ccache0.yaml
> >   - Add restrictions for "cache-size" property based on the
> >     compatible string
> > - Link to v1:
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor=
e
> > .kernel.org%2Flkml%2F20250311073432.4068512-1-
> pinkesh.vaghela%40einfoc
> >
> hips.com%2F&data=3D05%7C02%7Cpinkesh.vaghela%40einfochips.com%7Caf77
> b3ac
> >
> 71d1493ae0ed08dd84d189fd%7C0beb0c359cbb4feb99e5589e415c7944%7C1
> %7C0%7C
> >
> 638812757762011608%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOn
> RydWUsIlY
> >
> iOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%
> 7C0%
> >
> 7C%7C%7C&sdata=3DMIU%2Fh9VO2VYnJ5VwixXO0zU1%2Fr4AsWif1wwX31VeS
> gw%3D&rese
> > rved=3D0
> >
> > Darshan Prajapati (3):
> >   dt-bindings: riscv: Add SiFive P550 CPU compatible
> >   dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
> >   dt-bindings: timer: Add ESWIN EIC7700 CLINT
> >
> > Min Lin (2):
> >   riscv: dts: add initial support for EIC7700 SoC
> >   riscv: dts: eswin: add HiFive Premier P550 board device tree
> >
> > Pinkesh Vaghela (2):
> >   riscv: Add Kconfig option for ESWIN platforms
> >   cache: sifive_ccache: Add ESWIN EIC7700 support
> >
> > Pritesh Patel (3):
> >   dt-bindings: vendor-prefixes: add eswin
> >   dt-bindings: riscv: Add SiFive HiFive Premier P550 board
> >   dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
> >     compatibility
> >
> >  .../bindings/cache/sifive,ccache0.yaml        |  44 ++-
> >  .../sifive,plic-1.0.0.yaml                    |   1 +
> >  .../devicetree/bindings/riscv/cpus.yaml       |   1 +
> >  .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
> >  .../bindings/timer/sifive,clint.yaml          |   1 +
> >  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
> >  MAINTAINERS                                   |   9 +
> >  arch/riscv/Kconfig.socs                       |   6 +
> >  arch/riscv/boot/dts/Makefile                  |   1 +
> >  arch/riscv/boot/dts/eswin/Makefile            |   2 +
> >  .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
> >  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
> >  drivers/cache/sifive_ccache.c                 |   2 +
> >  13 files changed, 469 insertions(+), 3 deletions(-)  create mode
> > 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
> >  create mode 100644 arch/riscv/boot/dts/eswin/Makefile
> >  create mode 100644
> > arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> >  create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi
> >
> > --
> > 2.25.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > https://nam04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist=
s
> > .infradead.org%2Fmailman%2Flistinfo%2Flinux-
> riscv&data=3D05%7C02%7Cpinke
> >
> sh.vaghela%40einfochips.com%7Caf77b3ac71d1493ae0ed08dd84d189fd%7C
> 0beb0
> >
> c359cbb4feb99e5589e415c7944%7C1%7C0%7C638812757762025060%7CUnk
> nown%7CT
> >
> WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXa
> W4zMiI
> >
> sIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DMzOvL50ZSC
> DUcJd3Y
> > 2Cnv7L3WjqX9UxIVW7JJ%2FQ%2BWd4%3D&reserved=3D0
