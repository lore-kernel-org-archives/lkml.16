Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FBA21D58C;
	Thu, 19 Jun 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750326205; cv=fail; b=b93UbME7J+UwjoCVv/WWOGORIdstOqKcXv7/JJzoT2v//FiK8HO9Ngz/RuX7QLXirgcIV+GjMWT9aew0PXQGFlxGbEvQF0OxZQVWy1JTiN7YVRIdojYOKlGtzoulT7dz9XgSU70HRMWb/0EqC8kdceUbvvaBs21Jnf/GZDQ0ZEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750326205; c=relaxed/simple;
	bh=zerzNY75hwDATH/+412+OQmSu4xRC13Nn2HZF5aTeoQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JpKbk4TtFNX9M2CfQmhrLdI3FrpXVOv9/vew6zblyeB0HKbMdu8OK//VTg0ys+PrS/n7NQWqImYJGgK1UE7xQz/PYSluzwQBErWCFzF2Jbv2+74QD33WOkoztaTY7i/mD3WMeJ+71qnR8i7Q4MzV52ryGRxjdt3VuStnr8X1qQ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Dq6/o1Go; arc=fail smtp.client-ip=52.101.69.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Dq6/o1Go"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgEHnRZX/kGMmoZT/qw3PpIszZt4icW7PnATf+ck47h03UPU5R6QOrbjm6jgitPiMQWkx4hXrg5NLJQyjUY3lYbWSHhKUO/cYeCfjljuhNaOvKmibs6Hb39OgoocgS1kEgjGCjCD+Foew03PBmt+fWLxdctnhC7ywYGP7uR4mYbjGi2z2M7sPjT3s83TLTeFIxNc3Eaar3lN9gQm2f+vSkRkI/ybsq+C9lEPLstZCU9FmIrDlkdzOXLx1jbnrEU9cO7kESEPFW166Rm3xG+IckPJSkEcG7g03t0aolpNmV5tE8mY+ZxwFdN0jXfvS+AquQDyGcZdMAm45yA5hiWx4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zSEos6hufFSU6ZooObH+vqXcw9wfHsrPdff4l56jNYs=;
 b=t5hEkXgysJftck3hJ4AYtH9NyYdEDX4q6SAasAqn+SGnVj0TSJTcIDLh12w4Dd+ut829m3pIvZZGZ4W9ayzZNfPm0MNEfT+mSHYz5c9jmQ+9/EuG8mHZw5wtY7fY4Xbl3oZZ2oSvqk78Pjw8j2AtOckRLduWsDGAIriXcB9bNRfqzCZGNZyejpjPpEY5emjV4RNFaq1VxNULoBQjDZ0dhoOWbjK4w0vUalY38gVtuiIf7ZyjRDuyhZfzhp6iStgUhJ9zj9uzvrDEA9UMXLiqPDjV/r2iX/uluNTs/5C9qdMEmoB+ey4PIZ683B+TSn5gTEtMGDJKVlbrKJBOaKbm1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zSEos6hufFSU6ZooObH+vqXcw9wfHsrPdff4l56jNYs=;
 b=Dq6/o1GosxVuDLMGEztt/+sScR4ZAUn//yz4f64TV6Z2gTJu8z8Whr7pO65oFHPhvlS2j0BYqsqHRF0LpmTCrQGFUHOY2209U0TlKtrs+ahrnoDWNx/w4oDbVxGg5hVl+T4EgGUbCseYuPcLcfjC6cwE/kYgrGsu5Drvm/JHJt6G6R6HsG0mKdxevXgjrh56BOKdboZiHZ6seAbhn6/SyAwFUT3AKiQwyzNtsbiqYLEBLeKp1uy1A2ulV8pTR/UWMnhzRI+mnYA/GNGuk1iiBSqb9mj/YM8A5W0bClkz/V/LQWOYSasOhgV8PtTYRrvLfeK5EMKbgSgUtrKv4h7kbg==
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by PAXPR04MB9007.eurprd04.prod.outlook.com (2603:10a6:102:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 19 Jun
 2025 09:43:19 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::261e:eaf4:f429:5e1c%7]) with mapi id 15.20.8857.021; Thu, 19 Jun 2025
 09:43:19 +0000
From: Joy Zou <joy.zou@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "broonie@kernel.org"
	<broonie@kernel.org>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>, Aisheng
 Dong <aisheng.dong@nxp.com>, Ye Li <ye.li@nxp.com>, Frank Li
	<frank.li@nxp.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator
 yaml
Thread-Topic: Re: [PATCH v1 1/2] dt-bindings: regulator: add PF0900 regulator
 yaml
Thread-Index: AQHb4P6WWPWzsLvvLkuQFGvHth0szg==
Date: Thu, 19 Jun 2025 09:43:19 +0000
Message-ID:
 <AS4PR04MB93861C8091257381B2BABEEBE17DA@AS4PR04MB9386.eurprd04.prod.outlook.com>
References: <20250617102025.3455544-1-joy.zou@nxp.com>
 <20250617102025.3455544-2-joy.zou@nxp.com>
 <175016596600.1706958.16046350914927298265.robh@kernel.org>
In-Reply-To: <175016596600.1706958.16046350914927298265.robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9386:EE_|PAXPR04MB9007:EE_
x-ms-office365-filtering-correlation-id: 48554734-dc34-4e4a-8957-08ddaf15b977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Y8NRks6gdKWvQNG9vgR/MUp7XBMB8Ijqk9kx/1g36Zsgalg7MDWOMvPtKttQ?=
 =?us-ascii?Q?BziuCavF08toI9LIIKatXFMykRPEbu477LyAMTSEU2Dc5SBLNhWJn7i+pkZS?=
 =?us-ascii?Q?U8zBzmKgD7BEdsfLMddS6Khp8eXs6jnz6qUA16QJEDPtY8QRKKQN+CqCJUub?=
 =?us-ascii?Q?5pkIkfZi6i4mzkWKhwivnyt3MBOhrQUBkczQSMU4VwhvyyGLmo2cuj0+PRah?=
 =?us-ascii?Q?/sokWqnBiuw8U73Xmbkt+GTzLJSH1kq40x/z254gYuQjlugZp8YZSrMvn+A1?=
 =?us-ascii?Q?aSot+gMlNYK/hHfi//hhW6GQX6VlFF0lyql3jBWV6G+51K+IluBSfVTACR2t?=
 =?us-ascii?Q?FcQTDRZS6rqAIw8dpmbMneeKhNJIabLJEIhfL8zXQkhToYB1FXT2kBwu0Dwn?=
 =?us-ascii?Q?CVxPBTUJyzE8FEL9CBFePtsyALg74zyjL6z5wg5gy3nbvkPaUaACES7bx0Sc?=
 =?us-ascii?Q?XyMndBGNv+w0fPk4W3MQD5KzW9tvp2tKOR7HZuOGsEsTmLlWX2UAVU5siYCi?=
 =?us-ascii?Q?pEihfXTHBy+1GhwgQyfVFAMHG//m50ye5Xa1m0MOng1MXvb4ZYhfv4HU7QAy?=
 =?us-ascii?Q?UZuind4ukX7RwCv6YSmUyhb+pfFQskfxEkQ2fL1yF7c6Qar0Jr2h7XWqlRi8?=
 =?us-ascii?Q?GtNUA+GdBG7M0HuN6IeG9ZaqS/T7JwIHISHLaExf1FT2aPLkwERTPgqH9Y+y?=
 =?us-ascii?Q?WZMBJeugo5aTPNKXqabLUce4gzldCP4zaPA0WqjIB6VWaJbWeOd9VH0iZvIs?=
 =?us-ascii?Q?FhQtiZ9/ARYK8KlSZiuAdx7qrX14oGH13U9tG4y6nPCWjWF0CSCdKZDZd+Vi?=
 =?us-ascii?Q?Jy3rsnQcFEFEIwuxZJiz6ZA+DSj4FqFW4WGt9cUr45TguDG9Ii5C6pqVAH27?=
 =?us-ascii?Q?TkaASmeuk0azQaYx1euKETMs3fbUuT5/TCE8LrjtRf0ILKnCOsmiSVOq4+74?=
 =?us-ascii?Q?fN9mPv2wOOp7oa/1oyPOW1mOlbjWSdLJCduLIaIrlhL2avt/3mpcK1h3ngd8?=
 =?us-ascii?Q?BNsd+MnCHuVKPFdgB38+BD2XT+5OsD99NC9VmogKnHEWlW/ddH/MrgTaIj5c?=
 =?us-ascii?Q?YJz2LAvfy/vW+wLbq9S5baVGkFjxXaL8bErAaVXLyJ9s8sjRDuu6XBUjJ9cp?=
 =?us-ascii?Q?I6JD2gfrrY7HJQ4/k8i9vAC3beQXQKJdpu38XqcdT4q9dlWGuT7Vio4V7DrH?=
 =?us-ascii?Q?wd9yKbXkE2sYr0QNVWpSUH8juYSp1On6wF2vMfe865UUddOvWJqkMKIW2Lbz?=
 =?us-ascii?Q?GioXPUAt+/N4V8tt2g0Mjq3ff6d14529wNDBEjncTxAOr2drFzu0DoOdkGDF?=
 =?us-ascii?Q?370YaWu6TGt7potXeN+dC8fARG7MNr1UUIlifh/4SSHDDtPqpxjIorbzQXlQ?=
 =?us-ascii?Q?+QXPA1uMdvLjrkpsMENFL45Ayl0yD5+0ETZ6GFLzPQqxZZwjmgFfCZrrbsXX?=
 =?us-ascii?Q?1pVjivTDZeixnVeHgAGD34Qi4I/aD+W+dKKkKEtwNVC8OPI2CzR7Yg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?vQl/VDBsGPNTwXzXyBjLFbAYLxP3Lo5L+ZN1l2EWemob6htWDY4L2bKUuIan?=
 =?us-ascii?Q?W021XSStZtXyAl1IAiRcM+FPj/jRMOdeUEDHOiex+HQRdnEfqa5jpr8zB16x?=
 =?us-ascii?Q?9Dk4ykA7VozA3eduv9KN7TB0NRYLDMMbGK89Spfy0scZCCCV53am6zqAkSQI?=
 =?us-ascii?Q?FmCAEui10Vxhz41r9s6VX/hyGlvD1Xoz8XQ2v9t3Wx+r0boGqk4LmbZduVwH?=
 =?us-ascii?Q?Wxp+6VbYOxNxe0CayRIB90rxgqa7zi9coMGrzzICuXaGil99mjO2Vheh/V+w?=
 =?us-ascii?Q?sA/1yFfGuMGopYDMAL41ocHV6OKkjolgHz8r1WdExef5NxlKajGW+fbobglL?=
 =?us-ascii?Q?zk58y3Sr2yAWcttyCca/Lyw4dJmugBofJ+NEysobz+eLyPgFI3qOAEUcqVxK?=
 =?us-ascii?Q?KUZBGHIhcAXyaveU5V9g+9aYgNJMCyJp9/hi4mKKVh4/r1EFieR87kYxdKLx?=
 =?us-ascii?Q?+ryRYn9XuW96oZGw0lFMCPXKohPk+we6kzRkPgleWw/JiZ0vS2sGSyQamtWB?=
 =?us-ascii?Q?EK90p15SlU2haYD9WCeT26QgKKzbFxL5PCBnOQEjz6hHv7RemvolzeEgfFuw?=
 =?us-ascii?Q?2wspvSO+w/OKPDffNKxFNgaM+4eJUfNL9aYZKaQSTJBLLgssI05fijEerYW2?=
 =?us-ascii?Q?ftKcvyzGDJrUL0recAZ6XwZSeQUV1+kwwGzz4pVr6MVDWDFzJnpMn0zMyKC0?=
 =?us-ascii?Q?tUSQsx9WdRCsW0FKKz++cAo8U/cgy7CUFMYno1gCX8+gUKycfp28f7mrY8d5?=
 =?us-ascii?Q?6LZH82XwRnSU3lgvRjJ/vbJB7RbSY+Bp1/OF7KIj/Le3YrgvT7Fx0vUJCJCo?=
 =?us-ascii?Q?Uy5Yz/TqaXsNt/fOg2AYBSVVXBw7JDgxnSE3HOa7sPmo5VpLB+KuE5CQ7P+F?=
 =?us-ascii?Q?k7LfIFfVHQIJJSYgDLlLdPeibbCXJClqzp0b04CVNtTM0YVo639Kd5oEgyk+?=
 =?us-ascii?Q?jRz9iG58YpGGMQm4XeYYj4Q0o0xaBV7VWg83apkhYHsIY3DY/U0xJoR4aCWX?=
 =?us-ascii?Q?pHQRGzBfib6Wq3N+tUjDU9jxRpaC4eMbsyqE+BwgZTp8MybwGvxSihS4a6th?=
 =?us-ascii?Q?B20zte/7vtw8m8club7QV4II0mD0bxghp4kGJ6zYsO6M9MvoAmPKypjnYrmP?=
 =?us-ascii?Q?qzgbPV7jm45QdeupkAz8KUCtSCak0G5Sb5Ehu1CKWiSdrSdhRBj6IMyJLb5A?=
 =?us-ascii?Q?mvK2g+VTDyVN6oGM90ctxMyKqZhm4BjTUumQh1IGrFtEpOpPBBodrdMXjp6I?=
 =?us-ascii?Q?qLH8bl1HmMx16A7BU23JmS2A8YGwPRQ3Ez3SD85TQ72R08c+ohCKikcLajpx?=
 =?us-ascii?Q?WazClnrm4/24tws3uiyQTSm0K3FC5NQ+jiOQS+3TBeNwIL0/JKPXbqCqymZK?=
 =?us-ascii?Q?LQtGdLf0oXFgB3mbz47h3w1pU/eiuJ+2FHfFCtND0cSRzFWba42jcN+PjhpD?=
 =?us-ascii?Q?FNMYkH5zgmqGbZBDhuDwD8n4C8Gzb+zbfCsY5ijpYO6rdJIqYC1zXLkQyV2V?=
 =?us-ascii?Q?GlmLQEAoBtrGYejn5nvoSb54xqsU0RzeaYsLKfw175yLe+OrWIr4/kzpWvmz?=
 =?us-ascii?Q?/2a1HFAkJ0bCKU3tJHo=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48554734-dc34-4e4a-8957-08ddaf15b977
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 09:43:19.6752
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4S71GiWVc7XT9n9t2v9+8h61vVdJeprV4/jRFKm1/MgC6JDpYylMiyR3mMWY7az9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9007



> -----Original Message-----
>=20
> On Tue, 17 Jun 2025 18:20:24 +0800, Joy Zou wrote:
> > Add device binding doc for PF0900 PMIC driver.
> >
> > Signed-off-by: Joy Zou <joy.zou@nxp.com>
> > ---
> >  .../regulator/nxp,pf0900-regulator.yaml       | 179
> ++++++++++++++++++
> >  1 file changed, 179 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/regulator/nxp,pf0900-regulator.yaml:3=
4
> :8: [warning] wrong indentation: expected 8 but found 7 (indentation)
Thanks for your reminder!
Have run "make dt_binding_check", but didn't found this warning. Found this=
 warning after run "pip3 install yamllint --upgrade".
Will fix this warning!
BR
Joy Zou
>=20
> dtschema/dtc warnings/errors:
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
w
> ork.ozlabs.org%2Fproject%2Fdevicetree-bindings%2Fpatch%2F202506171020
> 25.3455544-2-joy.zou%40nxp.com&data=3D05%7C02%7Cjoy.zou%40nxp.com%7
> C4abcb4752f194f64e6a308ddada0a876%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C0%7C638857627709537961%7CUnknown%7CTWFpbGZsb3d8
> eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoi
> TWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DM%2BlNJ8P2aboDq82
> htOEdzYII4fTha7wX901TorFchqo%3D&reserved=3D0
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.

