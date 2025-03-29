Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011008.outbound.protection.outlook.com [40.107.74.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3EAE555
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 06:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743230505; cv=fail; b=Oq7Unaah8Cn8WpouSyVjKeDhgjEsO86FKOH9DfdnKvbpStJvjcwd64qz+nZuJ3mzsWmwiMjfgDuPtUU3OFtxgJKUrHYQdXIfORiiaNJhlJdEVY6ODpGw5GAe64JbqgUcS/rMZh3Tk/1UMz/p4M4Gwxs13nEse51kDGQHiAN8OGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743230505; c=relaxed/simple;
	bh=703LwFNLjwBlmsyY1fNufNVYEC7l5JtcHkIp/rAlr2E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kkM5U7/sS7j/+viFnQlpLVvf2wk9megmOPx3Jhfe4j7WZB1QGp+bwV55ZKqh9n4hvajz6F2jfffJUWJT2Ee50T7UPFV6eTs1ZtUGInBaYxWAZ694yKz7X7tAbr0uKQiDZt9olJZOrO6WX4lhK2NIkdjZ0N9jpLP5LymfUZof86A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=bG5FkRFv; arc=fail smtp.client-ip=40.107.74.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="bG5FkRFv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XUXx+XVMkpAWkQ80B8Xc918kalBfKJkpZW7ArrM2imuacLtBYnOu7qHGpoSzV1wquplqKDV5EXs5moXeHgUJRVZu27YOVxZKVWmXyTIZN5CyAXAb52QQ+PcSDjnDROPHeVvHE6hgY1JD2+J1DjRP2kIAk1Ye8lwjxXqh/vI1S/YrOW7poipSNsdy4NhIX3j1HK5JBUkc0cIYrAbzTxn43fnrB2zds0dV8IzGHSb5o24XIozVrZb/X9Ot20DNs9KDOwW244K2XhapJ9Tk0CMpIwM68eNN2qbvT7cnKVhITSObNOV6B/sDloqq65hK+6wigqtyEAmKXCFAte+nrTDBIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVlcxJ4W0YU/DuJSaFNcIDo4QeQ6zLPrY+40jdxUblE=;
 b=GDVSfCa48rbDFFtEwCvI94Y9L433N5REoDRhMpa/tPtmNv0wkch5fR5AOcvKmXQQ0JN/fQlrG96AhyNzLv1ekj2NkaRlOJoQUAigjHAluwwYzqZ3Wp3iI+sD012Xyc8YpHgdcSHA3pnykAd2DHH5YxQ/N71bVs9iT10w1P/tEfRG4LcGxfAiiKt++eHS5+LQGUeH7g2S3fYFo0k8HJ2x4bfWlgGsLz9EzXZ4OBUkz1693SfSVvexxFuGdJX1vibCSEGhX1q/l0nYZ4DTUtGTvw+hWxOP0waWz6sLTzxuHAw4Fm9jiFPGeYddE10PX7w4UtyoDWoKVgI4Y0Nigaa0Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVlcxJ4W0YU/DuJSaFNcIDo4QeQ6zLPrY+40jdxUblE=;
 b=bG5FkRFv3/+/3hKVM/2m9N2DhWNHhuu2EtI8Di37ZzNViEhyMDJc8JFH1yEniU+VPzNJBnsrDBeBN1ZT0QqNALV/00GOvfSK4Og9SYsYoTdjucNeBMts2jZxfK+s+9bv5Tl8ylHBP7mB/TJN5REijziAdIsU7gag4STrmVCoo7w=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB13676.jpnprd01.prod.outlook.com (2603:1096:604:37d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.27; Sat, 29 Mar
 2025 06:41:39 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8534.043; Sat, 29 Mar 2025
 06:41:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: kernel test robot <lkp@intel.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson
	<ulf.hansson@linaro.org>, Wolfram Sang <wsa-dev@sang-engineering.com>
Subject: RE: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Topic: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to
 `rdev_get_drvdata'
Thread-Index: AQHboCqIh2PpJ3xvmE+hCIj3H/jjabOJpxvw
Date: Sat, 29 Mar 2025 06:41:38 +0000
Message-ID:
 <TY3PR01MB11346FEE53574DBF768BA9B8686A32@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <202503290554.zASQT70Q-lkp@intel.com>
In-Reply-To: <202503290554.zASQT70Q-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB13676:EE_
x-ms-office365-filtering-correlation-id: 52badbca-965f-4132-4a46-08dd6e8cc201
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700018|7053199007;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NRl7GL2STPKSHXXi60hiZyr+P/+hJrVlceqJ/wgrT6Jsim1mIrd1D3yzY/6l?=
 =?us-ascii?Q?fezITItOxcJtz+HN+3DEBLdKLIQF1iqZGWgeiWWxPgrsstHsZIsrDKcs8IdJ?=
 =?us-ascii?Q?sAH+7YVPrueVHuj2oKIJRntHegbz8iQXmlTrcCgJX1iV/eGJSQAcg5h9Z1aa?=
 =?us-ascii?Q?Puv6Th21MqTW3MBiFkf4myt8SDsTkBTFNdPtQyz6kvzuBG+xJajp7xRbOvkB?=
 =?us-ascii?Q?zKatWoGj4KAocVhQKXbfsmH6HlJA1sbEXjget1TkGOuyXilWKaztYQwX3lJm?=
 =?us-ascii?Q?oJvvpYx22jDBiK3aryrj54CBiji009kNVqJHvHp8WtZwGH54V6qkftymzcnm?=
 =?us-ascii?Q?J5Xk/nGRvVShL0bzzP/tPMnjHmEEUW72U4TAOdVAnjXHPQ11iY0L9K53KZsC?=
 =?us-ascii?Q?Sr9s1XXLLbFyQCI8zaGww7FrT+3A2lAIE8X3yrizcYaUuYUQaac43++XI9vM?=
 =?us-ascii?Q?L0Dc4ojEjTR8hfbklj4+cAfnZlCmFirqDP4EGjHyg3gUNvR0TAdEN9QJUoy/?=
 =?us-ascii?Q?7+1e+LpSmfykb3VeNZQ9RJY3lBKjdAGEqzesG6YKTM/GI7xGYCQx3p1DNVBT?=
 =?us-ascii?Q?0cxuMy1ZTRMnCy8y4SjvElxoOkZVQdzZRXL/gmMplccJlmrChLm9OltWar5V?=
 =?us-ascii?Q?Fcrnh/iKfraAtL5t5HUQRpG8TjZhJrPqbf1pYLEAdPEYXY02t1yrmK7AVZU3?=
 =?us-ascii?Q?hFKrwTPqoxPWprfBfaMv8p45HiCSgE9BHRzgUTSmLTT/qxG9Sfmb7Er1s37x?=
 =?us-ascii?Q?xHfr6roxI/godblhI1UvFoKn/l6b+ZB5s2oB7fK81ma3AxPPC0IItIoLr+SQ?=
 =?us-ascii?Q?ercs5tHlyR+hH9cPTejjWbUKMe0ixMoTUtSGLu4EUCIDJ3m2n4cI5k3L1HB8?=
 =?us-ascii?Q?dM6ZaIokLoh5h6uk0Zb3KD+V97xDbl4UTfGtsoapDDzNrCXVwFZEOWZYUG8t?=
 =?us-ascii?Q?0xrPLGFpt6pKZduOlfiSvSwFBeJHqhSHpQQYRtGUDpFQe7oQb3VsJaDQTozK?=
 =?us-ascii?Q?MyjndPS1fsJwcpy0Uq6lyLvEt85+fIVaADUqpneXRWmcWN2+g4MZfkKpOJDs?=
 =?us-ascii?Q?2pEWOcoN1E0HTdKdxDJsuoDKIqHnqx9FRS6gnR4mqoQ/q1NZGyG5x79BBLbh?=
 =?us-ascii?Q?Uh0l/CxLA8qEtYNp9iuuU9aSLVEHRkUUUtd7gmYyBymi7IilGsIQvxgcEj7B?=
 =?us-ascii?Q?D9rGqBIuqh2fpaSr5WzR4m4x6xfuM4oCWHtKvTjz1sxEuWeWXG3XJ0wKhsvE?=
 =?us-ascii?Q?Ql603gRTm78Avlo0xTDPtLcioeLGzHm74fBfgASxs64+jzZXhDb8FosmyYFJ?=
 =?us-ascii?Q?MLKt6nyqBxJ9Cn7sn4TdfUwmGUY0+JT7gcycEbKiDga7sVsPfnK0zjg+1y7e?=
 =?us-ascii?Q?KD1Djssxv2TMv1H6zF2Hvdzn60SS3wM6xYYhMfJ7JymHT/ZJaQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xNiwjkVmIGw20Rq74GcwROihlLobvee+YpiyHpMSmfmm9mXKBylXY07sTpSN?=
 =?us-ascii?Q?NuNbEcBuUedrnfZBVtW3N6xFjHVjn6xqjERunDgXEuGr0p+1Ni0f9vIORfax?=
 =?us-ascii?Q?pkgd2Pj3sXZ7o7a6guFtoU8XqyXYHC9P6+CNP5IFfJZZ3KNj2MUvQPvxMYp1?=
 =?us-ascii?Q?Sv4/+aBJDMZSrZxlYAobkW7FE8n9LPMuI2QCe8eeWR/jqGj7d8t2jYKx1FCX?=
 =?us-ascii?Q?W0P2h+P03pAku9Hqsv7sew6OxcUk9jJecTao2uRQyVDNZRlQ5TGkGhW81Z/E?=
 =?us-ascii?Q?axU8n6TnG65fogLBeZCrt7y8xOyCnrjjMrWSsPZ33r2by3QPszhAegZ74iGa?=
 =?us-ascii?Q?gTHi9Z07hDXmcYTa/Scmrpl6iiMRbCywYS85U8ldiezS+ClW8erB77CkPTyK?=
 =?us-ascii?Q?HvO0aAK0NHk+w6TU9KmB/asDqedvOBTXiS1i34thbnMD9HZraxbUp/Tvpn8b?=
 =?us-ascii?Q?dvzXCSHPwTGc41ijrXR7MRjwY/BpgD1ViTo3BOGxcUTysRYjnmFAfJgXN6Si?=
 =?us-ascii?Q?j+1yBGvYXtUad/M0/jXU4ij+VtUKO1oY9985nImCfsthdZP5XJs1ak4DPxn7?=
 =?us-ascii?Q?EKDYClxpcldOYkIhjhqHx2AYXyNfRL1XQ+W8lUfNKxlraOFdUfVYQCxciklu?=
 =?us-ascii?Q?hv+zWT8SGc07BQlk9jt3pEEEWFtMgZHJVq6RSzD5T5LcLQwGiTsc+/gcV1ts?=
 =?us-ascii?Q?cFXzWMKC3mxhmiZZ52S+6foEJP2O9Y6L71fq06yVuOtbh2HbDPlLQq6VOfxr?=
 =?us-ascii?Q?YJ8K+9qJbxWDtUYn+CjrY2kVzS7c8nCP6nw/l6m+DNI8mCB0EwjxM72Dp8jU?=
 =?us-ascii?Q?6l0pLgfZ087hkyVHlVYHWZJBq0caQ9TqXEnxOCXsAoCPLbvH+w42MqnH6yto?=
 =?us-ascii?Q?vxmFaphc7WUH7xYb8IZyFPzPxwy1LgkFrj8L6Ap7N2Cg8EvlRYLanQeolDGH?=
 =?us-ascii?Q?WY2HDGieA5qZBD4YCPnSpi1KMynqmxZthXcsWESPLIlYUZKwSp6+fSPL3H2f?=
 =?us-ascii?Q?44WROOq24b9+rtc2lUttL+baWg3hMsSgR3TkLK5hCNlQwegCv82XW7jD6N5F?=
 =?us-ascii?Q?l1wDZFJgJCCMIi0wZuU3a6nAgFwieZmud185Q4dRn5NPnry4Pd0o99pYZH6v?=
 =?us-ascii?Q?FbgzrhgrL1IueSDzIMpxo9Z7ZYI2f1HHmORDwEbKk+/UJJe8KIw8eF3VoxcO?=
 =?us-ascii?Q?jBZpilkfWh4O83RTfOAtDNoDlJwEdjjhGBeDT6OFhUGNeS/5I7NVuxUnfPJ5?=
 =?us-ascii?Q?yi58fuZ+ouC1tMrR5PT2jrkB00XSVxwTkzRKf8S+tK3C1BOEqX0fFZmlObnM?=
 =?us-ascii?Q?Ymg0YJ9M/OZe8enFSp+J7KJ0SbKUyzr1g1aqbWEGzLJS/01HXsLPHnnUXORn?=
 =?us-ascii?Q?1Uz567UxxFuRvsLtpRS4uuYkFmMYk5c3TDQ9vGqgX9/fnivp30NHBqZ1LJx4?=
 =?us-ascii?Q?iZOfjQdMKxkkUygojzYvVfQg0swfG1ZVWLIUghd3k0NlJG63HD3DF3CULHIF?=
 =?us-ascii?Q?GamKCJkkBKHBOWCdnhv0xdWCPaH84gsDJXYG4mQp/qUa9cYd1fV9yVz3etq5?=
 =?us-ascii?Q?+AWi7RubWXGwfMk7L3SIVNpYifuJnBRXYqp+3oYxy5dugIfTGCgUJnijVOXx?=
 =?us-ascii?Q?lg=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 52badbca-965f-4132-4a46-08dd6e8cc201
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2025 06:41:38.5790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PaEXXGrpsmKjorkc9k7F3qO+sRdFC6Q48jG544q2g8X7hBgr472+kxKlqHmMcA5M577N34iaqOlszBDgQNossvbDMMmYaxYqmrnRPX4LkcQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13676

Hi all,


> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: 28 March 2025 21:44
> Subject: drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to=
 `rdev_get_drvdata'
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   acb4f33713b9f6cadb6143f211714c343465411c
> commit: fae80a99dc0320be854aa789cbe7ed0e1e574c61 mmc: renesas_sdhi: Add s=
upport for RZ/G3E SoC
> date:   2 weeks ago
> config: arm-randconfig-r111-20250328 (https://download.01.org/0day-
> ci/archive/20250329/202503290554.zASQT70Q-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> reproduce: (https://download.01.org/0day-ci/archive/20250329/202503290554=
.zASQT70Q-
> lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore.kernel.org/oe-kbuild-all/202503290554.zASQT70Q-lkp@intel.
> | com/
>=20
> All errors (new ones prefixed by >>):
>=20
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n
> `renesas_sdhi_regulator_is_enabled':
> >> drivers/mmc/host/renesas_sdhi_core.c:951: undefined reference to `rdev=
_get_drvdata'
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n
> `renesas_sdhi_regulator_get_voltage':
>    drivers/mmc/host/renesas_sdhi_core.c:961: undefined reference to `rdev=
_get_drvdata'
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n
> `renesas_sdhi_regulator_disable':
>    drivers/mmc/host/renesas_sdhi_core.c:927: undefined reference to `rdev=
_get_drvdata'
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n
> `renesas_sdhi_regulator_enable':
>    drivers/mmc/host/renesas_sdhi_core.c:939: undefined reference to `rdev=
_get_drvdata'
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n
> `renesas_sdhi_regulator_set_voltage':
>    drivers/mmc/host/renesas_sdhi_core.c:973: undefined reference to `rdev=
_get_drvdata'
>    arm-linux-gnueabi-ld: drivers/mmc/host/renesas_sdhi_core.o: in functio=
n `renesas_sdhi_probe':
> >> drivers/mmc/host/renesas_sdhi_core.c:1177: undefined reference to `dev=
m_regulator_register'

CONFIG_REGULATOR is not enabled in arm-randconfig-r111-20250328 that is lea=
ding
to this build issue.

I will send a fix by "select REGULATOR" in config MMC_SDHI

Cheers,
Biju

>=20
>=20
> vim +951 drivers/mmc/host/renesas_sdhi_core.c
>=20
>    948
>    949	static int renesas_sdhi_regulator_is_enabled(struct regulator_dev =
*rdev)
>    950	{
>  > 951		struct tmio_mmc_host *host =3D rdev_get_drvdata(rdev);
>    952		u32 sd_status;
>    953
>    954		sd_status =3D sd_ctrl_read32(host, CTL_SD_STATUS);
>    955
>    956		return (sd_status & SD_STATUS_PWEN) ? 1 : 0;
>    957	}
>    958
>    959	static int renesas_sdhi_regulator_get_voltage(struct regulator_dev=
 *rdev)
>    960	{
>  > 961		struct tmio_mmc_host *host =3D rdev_get_drvdata(rdev);
>    962		u32 sd_status;
>    963
>    964		sd_status =3D sd_ctrl_read32(host, CTL_SD_STATUS);
>    965
>    966		return (sd_status & SD_STATUS_IOVS) ? 1800000 : 3300000;
>    967	}
>    968
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
