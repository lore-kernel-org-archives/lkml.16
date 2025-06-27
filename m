Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11022110.outbound.protection.outlook.com [52.101.71.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB732E9742
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054005; cv=fail; b=qL57Rrm3TLMQ1xHfjST3/uWG+2cCqiJqLujrjJ6b9hI435jqjUSeofnKRK5PnOBKZL5KAAhk02qSmrVsX3BZ3zPMEwJGQ9VY8GQpOII0d0bzvj0o5VVGuvO2eLD3FBXuE5QDGdL/jMwXktQrFuoCstZM97IR6FNwHnlh9tyKxY4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054005; c=relaxed/simple;
	bh=Pgh1JVJp8H5r61HaTa91t1joEICL3Qe5qQjd0/0vvvk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=miUnutA7MTPBPAb2gFZZeY8tFTQHZHoE5OeFp6wgpRU3nKoFQg/6ED6S1T2Vw/lJGSWfx88iB6mf/lQGERz7oJhZYSms2AuD0kXiOHa7keSKT6GRzVojYc0iPAejZuxefRZyoJmDzLQ4u4TFn8tMZxD+5fKY5qBJLeygnWgagyw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo; spf=pass smtp.mailfrom=sesame.org.jo; dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b=pda9lSam; arc=fail smtp.client-ip=52.101.71.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sesame.org.jo
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sesame.org.jo header.i=@sesame.org.jo header.b="pda9lSam"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aHc/Dp1imp7uDZp0v8P8UCkZP6kF0Om2RikbEISLJJ/S6KC7dU+z5vzjChezmM8+ctQPYlpecYnKWZcFWP6EWl33H+GooznB4iSJnyGqUgJoDlGfKHNCBgnThGYFLs2m3RjRw/iIs2FU83KV++8/OFFeECVDiL68Af48L+f61h/64YvrilG/UN6IMg1i6RBtRx1E8Uiy2aSMIO4Osh7pJboYc+7QMmEedKog62183WxyVcunzB1ro2F+sy5rdGLv+x95LktqFPLnZqBk76YIEduc/LyUgQSvDp03Ynn7k3fqo8VmSJqPoXA8WjR7Yna/t71ze4n24BT2rOU/TmUVRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pgh1JVJp8H5r61HaTa91t1joEICL3Qe5qQjd0/0vvvk=;
 b=Bn3Ijvh2VhZpmyZk01IYNURoHcBng4ZbHnfKYVE/TTvOZMZmeKJ5VG8lbu7UXHvMyvX+A0aNbZI2KdZ/sFUmZJkJt6CbEQiiwhYd8jrwno/O5X+ajZSbRU39uHM216NZKxRyENoMcAC60TPP/aumP3qoY67G7RDPx/Lnfp8gyL4DpqhuSk0Je+eNT0hWq98D5s78r45nkHDqk2vesuVqaTbA0lpncO7xTGWfaQqrexl8A2OTKtNbrJLhOUQc7quOlZT3HE7qskl+qmsZ1Ioxnu94DBnxhES8GKUPsVeXXwpHAoWiXnbYXGetZPjI4bjVH7X1nhjZbKvT2N/LGbdZew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sesame.org.jo; dmarc=pass action=none
 header.from=sesame.org.jo; dkim=pass header.d=sesame.org.jo; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sesame.org.jo;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pgh1JVJp8H5r61HaTa91t1joEICL3Qe5qQjd0/0vvvk=;
 b=pda9lSam1wmT+NWqvteU4hy8nqL/quo6MsZVGZr2U98kw7WGGPG0cmmz+hEIAurhGGOKR/Y4Deq+xgNQluc3y2rWxWHwFVItNH+XhnL9NRtY2V3I3x/ZH/KpPDeugWZ2oOZ16zAusfXJXWwW48saTSQjuy5xnXlJsllsjejfQN0=
Received: from AM9PR08MB6114.eurprd08.prod.outlook.com (2603:10a6:20b:287::8)
 by PAXPR08MB6525.eurprd08.prod.outlook.com (2603:10a6:102:154::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Fri, 27 Jun
 2025 19:53:21 +0000
Received: from AM9PR08MB6114.eurprd08.prod.outlook.com
 ([fe80::e7d:2350:5c10:a839]) by AM9PR08MB6114.eurprd08.prod.outlook.com
 ([fe80::e7d:2350:5c10:a839%5]) with mapi id 15.20.8880.015; Fri, 27 Jun 2025
 19:53:21 +0000
From: Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>
To: Dan Carpenter <dan.carpenter@linaro.org>
CC: Dave Penkler <dpenkler@gmail.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Michael Rubin <matchstick@neverthere.org>, Arnd
 Bergmann <arnd@arndb.de>, =?iso-8859-1?Q?Paul_Retourn=E9?=
	<paul.retourne@orange.fr>, "open list:STAGING SUBSYSTEM"
	<linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Thread-Topic: [PATCH] drivers: staging: gpib: minor fixes for some C macros.
Thread-Index: AQHb55rGDTfUJjmm+kuQilM4V+hwMbQXZyiAgAABJkc=
Date: Fri, 27 Jun 2025 19:53:21 +0000
Message-ID:
 <AM9PR08MB61145157B28A55649F155F2AA145A@AM9PR08MB6114.eurprd08.prod.outlook.com>
References: <20250627193613.552193-1-abdalla.ahmad@sesame.org.jo>
 <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
In-Reply-To: <4edd380e-6314-4fa0-8051-ac55144e061d@suswa.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sesame.org.jo;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM9PR08MB6114:EE_|PAXPR08MB6525:EE_
x-ms-office365-filtering-correlation-id: 69012999-5dfd-4fa5-5a38-08ddb5b444e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|41320700013|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?qOb8yoYelk7A9Y6Qvy0BlNC27htkEpCllYzHwE+fl2VB+jA6Gf+XT+e6Se?=
 =?iso-8859-1?Q?OFThth6ZxeWXsBl2Ej1deEDcuX6vsLUagLASsBSoqKTHKbMzBnYqsTtJIs?=
 =?iso-8859-1?Q?r8ZtrvzVBCf0Gqo90+cUhaxdqvEwfWSP662C7LC86/ggdN1aB8i3cyN8hA?=
 =?iso-8859-1?Q?lYQS+4Q8QsSX9CGC539v75sNtkmqDyYmBsTlyaGMLRxT1ESOyRKwO3KzuQ?=
 =?iso-8859-1?Q?XM1aTGtf19JjMU97/gIbBUzh+DB3yEn51esvLuy3bQqZW6taz371v34HP5?=
 =?iso-8859-1?Q?vgOCY9+huaXQkN7IApCdEu2Otr4oPgwLOuqnApnLOWm0hTPagpJTOjdu6u?=
 =?iso-8859-1?Q?29uQ7TMgTLTS++r+v1VYLJZKbzxgQFzXOo2yOaSnif8h2l2Op4FjUiCxSB?=
 =?iso-8859-1?Q?JS+zjvz7B9O3HOlV+cOvVHkrn8+KaX2XZXCLcs+NsdBoSXVj+pPvijVoRi?=
 =?iso-8859-1?Q?8OxYgtOzc3kyBkAkR6KU/N3nIARySa6x4ElBhugXPR7GdZ76DgbhFG0mQ7?=
 =?iso-8859-1?Q?JwbBqEIEKCXmEbJoVmiqnC8MAEY+DC8vTkdcN1d869M4dyu4jFBDiww3ac?=
 =?iso-8859-1?Q?RvJuA4ap/9dbwp6QGFkury9aS6dEE9lEP1nYAluXiAOG5aeXGewHlI6awB?=
 =?iso-8859-1?Q?eYKlcBCQS9FSg49YnFJeO1o6pGXc16+JN72xuhOSj/MSjtLVJuyVlzWE5O?=
 =?iso-8859-1?Q?nx73em6M2JZR9Sns2tZ4pdVVI2kQ6Q3jkdWaUn6gIeUfJ6WV4UvYV6WwnY?=
 =?iso-8859-1?Q?Mc4eu7etDsYgufu103VI0odfw5DWh4conEhNsx7osGt10Zfakso9E35XAH?=
 =?iso-8859-1?Q?IihTUiQSu6KW5mr2wlR2Ev7zS83KcX5UIbuJXph3hNQ8zKZCh/kixrbxKj?=
 =?iso-8859-1?Q?X/OnvUatqhGR9Y52wVRCksKezOE1OXz9IImvIHlZDgDNoq7dkKtDhA4hQb?=
 =?iso-8859-1?Q?/KxNrrr3VKkD1EMAmlq6ByQhjt4gPGHo1T3uhlAaMXPNuV/sT+NzAA//4I?=
 =?iso-8859-1?Q?zMw8U3TU55r95FHTolnyjFUclfXgjCsP26oZHWNsKc5za8yRO3xUnfWnY3?=
 =?iso-8859-1?Q?txSoDfDvYxQbryLHdDN3GcmjNWHx/d4/2V6dDC+qKXGRscJZs2KjUq9C6E?=
 =?iso-8859-1?Q?ydIVZLo+kyrS589WAf8cxzxL9sYr2sBso+cXUg73akUFb8UN2+2fb0bPvK?=
 =?iso-8859-1?Q?OgS13+QlsatI+edo77yytGjOJsF/+WqdC0e8ukG4F4tyDRnUSgaiBNrfoB?=
 =?iso-8859-1?Q?UWeMlSuO6saIK/mklK7ZVQViMy0T4HMYBCykdtQp2CO85L8m4nX1h5PPyI?=
 =?iso-8859-1?Q?/GxSz8vXAvQd67ZnzrxCw5gQB5MG9mqQOIDUIN0Sz90GYboyMafHRmzv1g?=
 =?iso-8859-1?Q?alirNg4ULRhXgnal/1yEXema7H87pRubF58XOzVHOxIBinxwkbLA01XkDX?=
 =?iso-8859-1?Q?ATM62y9/TFbJViM1ogwfUNn4iMcxH26+OveBiP8zBeQBjY1YZ8hqv/uIJo?=
 =?iso-8859-1?Q?CMopyv3agc2s9YOIzI9/AOyhhzdgPjfL8TA1BPpWgtzw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6114.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(41320700013)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?rlLyZohinyoILyCg3Lawb94BT7OfS38sLi/QR/tfbM6GWaSC0BOTU4brXq?=
 =?iso-8859-1?Q?j4pqvYMjesB4+4SgVqkFhRpaBo8P6pfyEXy/iB1ZhHJp28MbaXvoDfgYl9?=
 =?iso-8859-1?Q?SSMidousdjYpV4vxwYPwJx5pvbBdKgNm2VNy5u1vUkwPbOJB/fp0JuGJrg?=
 =?iso-8859-1?Q?tXmqsbrN1yV4MrswrC4bZc5lYL5MhuBZk9/Gaz87hJl4TsuHr6Br4FlNQ0?=
 =?iso-8859-1?Q?zMLiDaGwX6rAEyRtp3BC/+LV9KxKS71ci/nNOzvoN2EDzmv9uHQtQycu6c?=
 =?iso-8859-1?Q?QSTLXcLQPS2W3KKtt7CqNSRuKstjagfWBsI5JuiAGPOMuA/aVKJqPY2BPN?=
 =?iso-8859-1?Q?ZzktyhHtl3bFRMUSVegS6X8/jk12nYn6DyhCKAkv+AqdZkP/h2KKFJ2bvw?=
 =?iso-8859-1?Q?00b1onBovginnnkbytbbhwzb7/QrfZV8yuSY7JiCDA6fEDDH/GWMKipHyo?=
 =?iso-8859-1?Q?BN4u9TktAUzVMJNc9HRj4Ze0EpVPj9HttoNvM1J0RVOzwJcolOrcMjJwj9?=
 =?iso-8859-1?Q?zbcGQkBswYCAnhqA2TR7p829MtdQEiwsBhKnNowtEhOqV77+ryIcsbkPKy?=
 =?iso-8859-1?Q?U1fz9rbrercsj+s3aGUPuFIlMYTj2gKjepet+6ui3JgZ5EXZY4ePBFPoXK?=
 =?iso-8859-1?Q?aG1RZB0a7MlpB+VfUy4qThwLb6m9AnKAjfQ8w9m9zPlbSanA6RshwcUWJ/?=
 =?iso-8859-1?Q?Cs+5TBahHarwX1WGB/TjrWuI7QYX2N+kHBmh6POkOTPSLJkS6S6jeF+06E?=
 =?iso-8859-1?Q?qle+2FqKrYr7E8wVaF+rfk+oKSxDCp3f1UVvOEP7FERznYu3FObLvfLFXx?=
 =?iso-8859-1?Q?VQI2cKUl2+30sCgKvLko7q+Vga7JR+vpBCpE+7wTy+6TUuwkRjxkluv8An?=
 =?iso-8859-1?Q?zElsvoePBkj2RdKZax4oyaSn4pX0BQGuoyZofkIxfPejIDQ9Sk8zHiBkmV?=
 =?iso-8859-1?Q?29c5eOsUPqOHINuBrknBQyiZbiMK1eAL/Et8Qlo08b7++jr7obZ6XE28Rx?=
 =?iso-8859-1?Q?Gd6IAd3SDLp/Hbx38INC+icrX6ziqJmNjcUR4qLkuwXZBpZcfzHvJD5Q5W?=
 =?iso-8859-1?Q?tuQrc58DjwKlCpTwsat02TWI1wA+o9gPUOGmby68wovrujz/p2OE+wl2rS?=
 =?iso-8859-1?Q?bboH/HyHD7tbiqOOoEHql6II5ZpWMm1Ai+ota2HvFrDnyYMRaDGw4XyHSb?=
 =?iso-8859-1?Q?giLelavcuuoqgv/zdz5YvdpIaCzcVFuqWH2hbbSFcwqsRvlpsf3IXZL4ZZ?=
 =?iso-8859-1?Q?ODnrjvYZf34eRQrCj8RRunXVa2y5nRLRuV7ehsk19DzhPikuFn0CalcTvA?=
 =?iso-8859-1?Q?XsH8BtKid5VGxUNwdyw9fwo689LM61K0hk0PR1oPf45Bmot4zrBA1TcePe?=
 =?iso-8859-1?Q?eYi9buBdhaDc97gTwp4tarRFKhxls01gg6iHrEPh+IM0vmA21nRjm1MYhq?=
 =?iso-8859-1?Q?cssE6OKc4i/J6FicmeRTQIkMXaAtAanslx37Lcr0Q5likHVcFfS9p1jwuu?=
 =?iso-8859-1?Q?f3/Q+2kZ/6rdXq+WG76rFZdr1kvoS6suQ02CugCT+P2Vx97ureuok4anLk?=
 =?iso-8859-1?Q?LQVl+9EYgLq9TnhhS8PDFz3yI/39l52gc1fIAemme2yjIUtR6TsoWOeY5s?=
 =?iso-8859-1?Q?bTo0Czd+VjpJr5bBRtcyFOfYPqptY4wZOI?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sesame.org.jo
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6114.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69012999-5dfd-4fa5-5a38-08ddb5b444e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 19:53:21.1117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0788906c-6e04-423a-b37e-862cc7808738
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lI+G27lQgHiz1lX0zz6N1y3ao9LA+QA0fH7jDklggzCFTnh0S13lPSP/CBdy8mg8JcBeu6JiOmWxjKP2oaqRNTVWVcuredPIdtMN+ww2zJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6525

Hi=0A=
=0A=
> This breaks the build.=0A=
Sorry but how is this breaking the build? Putting checkpatch.pl aside, intu=
itively it makes sense to wrap long macros in parenthesis to avoid compile =
time errors and runtime bugs...=0A=
=0A=
Best Regards,=0A=
Abdalla=0A=
=0A=
________________________________________=0A=
From:=A0Dan Carpenter <dan.carpenter@linaro.org>=0A=
Sent:=A0Friday, June 27, 2025 10:39 PM=0A=
To:=A0Abdalla Ahmad <Abdalla.Ahmad@sesame.org.jo>=0A=
Cc:=A0Dave Penkler <dpenkler@gmail.com>; Greg Kroah-Hartman <gregkh@linuxfo=
undation.org>; Michael Rubin <matchstick@neverthere.org>; Arnd Bergmann <ar=
nd@arndb.de>; Paul Retourn=E9 <paul.retourne@orange.fr>; open list:STAGING =
SUBSYSTEM <linux-staging@lists.linux.dev>; open list <linux-kernel@vger.ker=
nel.org>=0A=
Subject:=A0Re: [PATCH] drivers: staging: gpib: minor fixes for some C macro=
s.=0A=
=A0=0A=
On Fri, Jun 27, 2025 at 10:36:13PM +0300, Abdalla Al-Dalleh wrote:=0A=
> Ran checkpatch.pl on drivers/staging/gpib/, found the following:=0A=
>=A0 - gpio: gpib_bitbang.c: wrapped LINVAL macro w/ parenthesis.=0A=
>=A0 - hp_82341: hp_82341.c: Used comments instead of "#if 0"=0A=
>=A0 - tnt4882: tnt4882_gpib.c: Used comments instead of "#if 0"=0A=
>=0A=
> Signed-off-by: Abdalla Al-Dalleh <abdalla.ahmad@sesame.org.jo>=0A=
> ---=0A=
>=A0 drivers/staging/gpib/gpio/gpib_bitbang.c=A0=A0=A0 |=A0 4 ++--=0A=
>=A0 drivers/staging/gpib/hp_82341/hp_82341.c=A0=A0=A0 | 14 +++++++-------=
=0A=
>=A0 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 14 +++++++-------=0A=
>=A0 3 files changed, 16 insertions(+), 16 deletions(-)=0A=
>=0A=
> diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/g=
pib/gpio/gpib_bitbang.c=0A=
> index 625fef24a0bf..45cf4571c58d 100644=0A=
> --- a/drivers/staging/gpib/gpio/gpib_bitbang.c=0A=
> +++ b/drivers/staging/gpib/gpio/gpib_bitbang.c=0A=
> @@ -47,10 +47,10 @@=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 dev_=
dbg(board->gpib_dev, frm, ## __VA_ARGS__); } \=0A=
>=A0=A0=A0=A0=A0=A0=A0 while (0)=0A=
>=A0=0A=
> -#define LINVAL gpiod_get_value(DAV),=A0=A0=A0=A0=A0=A0=A0=A0 \=0A=
> +#define LINVAL (gpiod_get_value(DAV),=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 \=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpiod_get_value(NRFD),=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpiod_get_value(NDAC),=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 \=0A=
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpiod_get_value(SRQ)=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpiod_get_value(SRQ))=0A=
=0A=
This breaks the build.=0A=
=0A=
regards,=0A=
dan carpenter=0A=
