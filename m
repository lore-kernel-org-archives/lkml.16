Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010027.outbound.protection.outlook.com [52.101.229.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4597482
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 07:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743233059; cv=fail; b=nO6AMjW6aHhG+D6tPrBxFWQK8UNnDGORdz7TNGB1lhF1CdmqWWUUjrBr5+xxZWwCQHDoALWZ8Bg7oaiuFBiBBA0c89OutnHpRidfaWYfhnnNkyWwrd65XWtS9BQkjQ+AtInyOEwj01DknssEzhuXwcYfkeBR3Rp20mSHIizh0KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743233059; c=relaxed/simple;
	bh=awndgTdd0AdHgYTUCrFbFirZU/v0eb0vuHJWVHVPXGY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ET4j/J/EK96DKspcrGaGA7yA3l+dPm6EnuKTDjzcr2iEJrc68QDxVGUdC6q642R1X0po9obIEEpQHPctJVnYREHNUqIVNhNokUREfHV/Rdepo33i09enrjE4o7SsRbnMh932SmwoSORLhZIomXQrYoCx8+kWRodsDqLBBZViBA0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ThDVdFy3; arc=fail smtp.client-ip=52.101.229.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ThDVdFy3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VZa3XvMCam/mLf6PoSfrDb/CpKDMTnzRfwVIfC7UI3mX2bCRtZrZTdlOc42qzesT9I9WZnmRjXBZpjxqFzUZg8mt+Poj46nNkTs7AH2+owyu1ce7lhyUCT9naTwWnSz+nLlVrTLr+M6skVpZ2qStxgQ7fY//I2whx9jINGTyZj1xmdENhsv0hbdh0r1N3qlCeyA/TV2ltN+tmjN1HEAeFfg9bqreVAeJiGtJf3GNsRSvoZNjec6P3f6B5L3W8J/9xT5a8WX8vMOt3R4G9WoWv5H+Gx+vbVagSV40InncCfIZ15L2SNt5RND7ExlthB3/2MBxtc4nZsR7S93nNr0zTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awndgTdd0AdHgYTUCrFbFirZU/v0eb0vuHJWVHVPXGY=;
 b=yZ4QULGl1EpPXBezTnqNh5U+pWiugUIhq+kWCZ/P2DJYOgRv7lMIM0e+mI39PiV9V8L7Kye8EjNn5gCy8T5KjGxoenAbM3JIsjr86Wm+ef0N9flRtiEuvo8zUbEXQmL8w5gQnd1AC7NQvje+WydIeMO+e5oXkCHwsXX7WbR2Zb6xGCSPU0k3G4gKCojalcLD0Cdt0q9w7KX1eOyZ/GPeIUi4I+rKFnljlNKF2XnNJnFycqBa3KWJAqM3YOZ9zxb4CYixADoG9ZfPS+NkbXTyiXGBnyxSUQ5JK5Pkug8RWVDVwWGcRrEiLXg0lk0ru5yTQ6SWR/7I9GMKSkR09+2PmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awndgTdd0AdHgYTUCrFbFirZU/v0eb0vuHJWVHVPXGY=;
 b=ThDVdFy3I/8UmJT42xfW+5Ix5/pGRjv63UAc/nFJ2JFf07c3fV5bWMOTjlvrAnm7t6LP5gM/RJurn62GjJyvbaYkcWzK6ykoLDXlnVGnYQwW6lRJvK6x2RFkjQo6XHjSldH6ehdFndItR2/aEEDoUvyim2xtCsyFviKgibY4eDQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14411.jpnprd01.prod.outlook.com (2603:1096:604:3a0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 07:24:12 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.043; Sat, 29 Mar 2025
 07:24:12 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: kernel test robot <lkp@intel.com>, "oe-kbuild-all@lists.linux.dev"
	<oe-kbuild-all@lists.linux.dev>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: RE: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Topic: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Index: AQHboCqIh2PpJ3xvmE+hCIj3H/jjabOJpxvwgAAN0QCAAABNYA==
Date: Sat, 29 Mar 2025 07:24:12 +0000
Message-ID:
 <TY3PR01MB11346D7FE2EC7FA3631C48A0C86A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <202503290554.zASQT70Q-lkp@intel.com>
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <Z-eeiMFsQQNMt2nn@shikoro>
In-Reply-To: <Z-eeiMFsQQNMt2nn@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14411:EE_
x-ms-office365-filtering-correlation-id: 40d50ddf-9424-4a00-6fee-08dd6e92b415
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?HGiWcqDslUW7PTE0aGQNlYBSuYB9onHeaZcTyFuP8MOJ+nYiVOPp4fToWXmx?=
 =?us-ascii?Q?S+3V8Z0VeDco/Mryw84D01cKmWwSqtMzVb+T4nMYwMzLVispkXui8qukXJUB?=
 =?us-ascii?Q?uHoqpx2Wcwn+loGwElWla4P4RMdfcrKVXSwSXSsM5PncPHILqFf6qzmAaiCo?=
 =?us-ascii?Q?IhG89ceYxawsMCOxmGQRPzHwWP9YOVBwVU5XOYrtacPkFfLaiZI6QrETmgBX?=
 =?us-ascii?Q?rA71YYEcO74fibGa+Q5POlRbJJmgm4hnKVq54dbhzszv53wx3sC5SACEKhNN?=
 =?us-ascii?Q?cvLHfHwr6YzdWESPUWxbDW0HEodhmm8RQvsvkG8FhOn8Tgpm9qqiN2ao3ZXD?=
 =?us-ascii?Q?tid2CWQ0g+pcvdOKK7T/1UzwXzJ312JwngeFSanjaFge8O/Z899pvlRgFiDC?=
 =?us-ascii?Q?TtgASa5VL+yrzbUrgM6nnayTJ3cNAZkEzcSrS39XwbTJ+vS4JfJ/0GIgPnbS?=
 =?us-ascii?Q?njvo06lVRAhny0S/vJ4Bnz6HwnZcGEG7mhseDcbOaMXAyJ9E4ljDRmdIEosB?=
 =?us-ascii?Q?2FQGgi1Cy+uzqwOGFWfOZMK/vmS86gtVL3QC44zwavMp2+jFz946bA2lXuaZ?=
 =?us-ascii?Q?YOgaiU5Xmyv9srrovuSyVUwFts/jUrhM7O8s5YT4Tkpu24ftufA5N8z5YTb9?=
 =?us-ascii?Q?ZqBt1eUNut55BiXQopgLagmmDVB/UbIcuiOGY4kGzZcGNQS0065YCe0Lgyvd?=
 =?us-ascii?Q?45CBw8Rb72cTnGOz6NTdrelJzIUCUSA+tdoAuJFb5sUpF5i53RCrQxjy4SuM?=
 =?us-ascii?Q?7dr5KdqktOC87d5ewmdF4P6PltbrY5P+Tu7JWo766S5mqqNT3i2PDW6iH3Rc?=
 =?us-ascii?Q?zlVGFaY3HNQrWgmHG7R+ut42gLfCcL58yWix1cqiX6OT6/Tmlm41ntJXCj2z?=
 =?us-ascii?Q?biB7crDpYB3r+LlK9A3qtVIqhG75gm3gQ3Ni1CSHIU60282tZBXNrnT5Yuyh?=
 =?us-ascii?Q?ijOL/0tDd+Zu/b7eVjKcXP68GxDx+nLkTY1AI4RM9Zg3zTkntgFwc/wxhK4H?=
 =?us-ascii?Q?UHLa9er4x3F1Ci8WFm8aOTDWL+FjFGfZ0foY2uf2TA10d0gB4XmTg84mXSb3?=
 =?us-ascii?Q?7TH9APr+MzZd3PekrUYZlylfDwVCLuBqMH3VjNcRDZ62AVBRM4QUiKSPVDqA?=
 =?us-ascii?Q?VQWHSt/pF9VoKNFhGtSpkJBTaLpFIYHh1TcXsEBuR0C7o/61ADoTX2g4aUB4?=
 =?us-ascii?Q?CBgjpJplctwmsbsEG0do5iLzYjh5B93eEXhr9NjS/L3picAEj+HamT2LAsnW?=
 =?us-ascii?Q?xInjLsE0zsnEXf7uPbFBZSVc/z07APNG4B85+T/FG+qvmupegruW2QKFsxdW?=
 =?us-ascii?Q?+HmNvAXZ+IW2pNFQS8dsuTmadEhpArjXj9CTj+/3kl9fq2TFe4gCjM/1I98B?=
 =?us-ascii?Q?bJDpzjHtTfUqgUuL7J35vYT0k9gPq4Czy0HcvVMMndfr6xK6RtWuXfEgXsVe?=
 =?us-ascii?Q?ir9T7H84tAH/JMQ7Iqu8iBsbm/JbSCCW?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oKkkRiE4aDRxgJZdlgkBKqA/EjTdmyK8HHeKVeEDooJi+DBUsezqp1ImDnWd?=
 =?us-ascii?Q?h9H0q2IKy/PywnrwIsneUFjVwx6bXmwWQ8CFcxIDnp95atztPojwZRA7kFgI?=
 =?us-ascii?Q?7DTT8+gdI6gvac+g49LfjYbucTfAQMlGDcRHSKaTacYRvJLSEl6WnBg0hYDE?=
 =?us-ascii?Q?5BOYOP0Fr/5h28u53Ayi5W4/2TBZznwqPvot9D+WQRVS7GOTJEsNDU6OFONX?=
 =?us-ascii?Q?9VJjeUu7Rg/3KDKaIZqalNvpaMU7HRTDVR04pskr8QUlcAZweHaExHFR0Id7?=
 =?us-ascii?Q?/eflrBNAGgwevhaUX1rgBJSAo/ukrCxAhCiOKagoP+UtBAnOdzZnTPjoB0nI?=
 =?us-ascii?Q?qSo6nVrFu9puOUzb8upT3Qwog8a8nSgCwDggs07PMk7EjENtDPZqldJxa1Xj?=
 =?us-ascii?Q?580ndrqX+TLIqqebSTSZ0VJaznOSyk9ewFT3kiEaWOjC5sZ4lp9BTW+WIEy9?=
 =?us-ascii?Q?Bqsjg11fNKigMCdrcPLdX6nm0Isq8c8vLisFe5vLMie2HPAB7f3F80NkMBPv?=
 =?us-ascii?Q?rT3rCNM5Hz60D0tHMHLWhTyYXhJqWybf6R+znGa+328XzOS9j/EWxXVzyMHC?=
 =?us-ascii?Q?6Jno1IjZe4NuWM4Ti4Ua8BGuakhvbjt3e1cX+vp9ZXwJp/lC7IrDi6fwYqR3?=
 =?us-ascii?Q?14R25othEmK3UdG2wZ1DExXxvf1VMFJnM5UtSffrQj1eGHGLGGwNKpse8L3o?=
 =?us-ascii?Q?BrIKoEPUwDHfguoJwuPeCKyCcxor5aJC1lVEO/EZM0HZnXZArlD9deWBUPIq?=
 =?us-ascii?Q?nG5jb9rpDGHcE/jOOaBgM08cCSIWRjfK5vwt441W4KH66vpyXYej2+gbJZjH?=
 =?us-ascii?Q?x3CQ9bE9mmCyEuVGBiLDKRK3UA/LfI59r4sQCrIb7DJyfKxqa+NqWBBkFhR2?=
 =?us-ascii?Q?pI+KhQ0FV1Tp7oR9FHoPB3KWgWBI0IgIQfIKgdwnVGeXWfqTTkw4MOJsR6W+?=
 =?us-ascii?Q?9lYRjSf+6yy4+O/ick89uXkRtEFFuy/w1FBWJRGlRcTNtjGwT/vvrECjC0et?=
 =?us-ascii?Q?wdoCErs+SidmNU7jgjo4L045/JBoD6+LUejb0ZkHbv+bMCYhQISUipwRK6k4?=
 =?us-ascii?Q?6kv6fAdpO7hHEyjeyVRdU99Zp9Ua9L/evPuBbh4VzNhDCgNpKqE3neF2sKK4?=
 =?us-ascii?Q?JQHO1nzFLknNDqbOrG4YdjJvQ2akK36kYjqVWPW9fMPn/29opFP7aQsNf5Z2?=
 =?us-ascii?Q?r59if7gofAbLPIWQMXGSvlfKlodl8pEI6OyUIL5dK1TXPSi8U6qqmh2HxuLH?=
 =?us-ascii?Q?Nis9DcG96gHaqGyMa7qC6QpS5gLW6HW2SqEmqDgPIA3VRIYxm4fhs4BpEq7m?=
 =?us-ascii?Q?5gCuiY7v4qXdRdX6TNqNvrYjYoXvpJ8ZHEXyYVXinbrU2/zCGAB6HhK9Y/Rx?=
 =?us-ascii?Q?5aX9fl9u2wmnDmv2Kdf1Af8P8E3TW0Zw4CSeW2bkHVmgbtbJdXIHL5uXcoyK?=
 =?us-ascii?Q?k9IPmAw9v5Plpo3B1R5+Bat4DZ4wnYv2/HGoO5CLbmCrF03/B9WNTDwCzbdS?=
 =?us-ascii?Q?BeJlHlgA9MtM6/KE8oi2pxxpMMcfwzaW+HjfhGbZcu8IULAOk4FzFQhZ3UcL?=
 =?us-ascii?Q?EfTap/uhOZj6z1gtpMEhPvUcNfdm+Obr0imfL4bkgXt8xGL1OiJUNKtNdSpG?=
 =?us-ascii?Q?iQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40d50ddf-9424-4a00-6fee-08dd6e92b415
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2025 07:24:12.1997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 932CdaMTXQVOOuaUfok+DVPtb2p+n1BEehoOZjv77gqOByHia2egGqW8lWUvaGzTHC4rHt/xVC26Q6oYPowJQiqcAHN075Qoo2ufkZr+g3g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14411

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa-dev@sang-engineering.com>
> Sent: 29 March 2025 07:17
> Subject: Re: drivers/mmc/host/renesas_sdhi_core.c:951: undefined referenc=
e to `rdev_get_drvdata'
>=20
>=20
> > CONFIG_REGULATOR is not enabled in arm-randconfig-r111-20250328 that
> > is leading to this build issue.
> >
> > I will send a fix by "select REGULATOR" in config MMC_SDHI
>=20
> What about using MMC_SDHI_INTERNAL_DMAC? So we leave out at least older S=
DHI instances. Ideally, we
> would say "select ... if <family>" but this will easily be missed in upda=
tes. Maybe the above is a
> fair compromise.
> Those systems will likely have regulators enabled anyhow.

The changes were done in SDHI core (renesas_sdhi_core.c).

Like this, if a random config in that architecture has CONFIG_REGULATOR und=
efined
will lead to the same error.

Cheers,
Biju
