Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05olkn2052.outbound.protection.outlook.com [40.92.90.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B838617BD3
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.90.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751314650; cv=fail; b=duqnfI1k0CFwFyS9aU2Lw5C07klahSRvZjXePBDE4TuzIedysGEUdj7R2C/+j/lHVcLNLG+OHeImT5Wv0c0/fKbJ9+1Dq8/59MSNwnYdH32YB+sxp9cUjYoMtLQ0KRNME9X8zTaaJrMnGV+XXhOMu+O2ipwjsa+SapY2BVqD+Sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751314650; c=relaxed/simple;
	bh=524ODG04fJUSylHsgca8ICG6/4olDS1ogoPuW5qp1hw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qyaTS0dEn3Ws7vgFf18tUcyYSlzWa5K2JCqxS1zZXDz6n+2/VHdA1ptCEWN3RWISoIgI1p9SPbsdVBGw8nKT/G8QrvbXqg/PzERiGRwYyLlsKrrT20VDSpbg3hAp/wYHI2B5D6SiJIREC5rRyJ0i40J+zaxNYTHYd31DKUzXbIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=izoh86FJ; arc=fail smtp.client-ip=40.92.90.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="izoh86FJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lMEIHcD1g5fhe/GgRGzQY3hmpP5+0KT3QAiYe1tOCQZNFiy4EHeBnNob417QYEsp3uAAIw4FypVF37dCKCLnu1dhxbqFVwOHsfXU+qP5aKhSQYgrhj1qmLXYym+3qqizFXznPZB0J6wBbjudZWsAAt6FXXvd5xOuDUfFgrbDnoWXtHmbdhhWqAWJVo9UDVgVt5KPxIeEUZ3HsIJy+7+TzlP0bw7LUcJtmQY3WG6oAqgPf3M7rOCDjUrfkVT3sTdz5j432hKmTqO/2XeDFt2CdDrI9ZAp3M/kn9cDszs9Q6EfB83Yx4mI55gk25kGagSKHc2Fg+OKwc0c+WOK3zZNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=524ODG04fJUSylHsgca8ICG6/4olDS1ogoPuW5qp1hw=;
 b=xNpMwj0ORZ5Zj9XCkHfsK6MczAI4nbdb1Wz+0CKWLQ5UN9G0wJ2fqyZQJ+LoqHJJI6adr77Ir9xcXDoJsqdcwPc3gWR/SoVBizhYGEbtLnf+CCR9qPuXAJMdL8zbJsVUtIxaIeifVqmwJwhu3zn/vBseHeayMT/hAIHqFpg9lmhJfgPHmQicO07biz4RslP5eJE4LR+Lc5M8dOoF2Vg7Em5/wf1N/xSELgMKmbFNiUMyBWUd1ixLUydiV2+0/jsI9b+4PZCMPm8RNJOR2RdIkxhJj59gprDVHxvFy3l9lx77VmpRas6BtPmsmJVbHRhNeHSNxeoCyRa5CyN62UrVnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=524ODG04fJUSylHsgca8ICG6/4olDS1ogoPuW5qp1hw=;
 b=izoh86FJp/TWcMtoKJlVmIy19N8GNgVVumg8yegkUQQxQiLmi1EuobgQEMkd/4MIJIl9sV6oE2XymqYbTfyvGxYjzU6yBjZp0y2jjspJ5bXdbXLlHYZL94+/3mi5c8PA5WqmVDz/xp4f31ecWwruP/owe9fn2/sHmogOdRgvUQ6eIPieROpbLYMTdB1bc0WK8LmEIStJi6ZoDtEIuafnafxp/ixD/86GcFkKlmvIZQzhkhuUAb3yN5nsV5vrV0OeR5k7DPjPPwA7RTyEaSCioBbgHJYtC2PTKRN9i1qJwnb/cC6NiBxyGn3J8djeDC4S6dmIGt2GZus/hz/EoLzaSQ==
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:323::12)
 by GV1P192MB2324.EURP192.PROD.OUTLOOK.COM (2603:10a6:150:1a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.17; Mon, 30 Jun
 2025 20:17:25 +0000
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e]) by PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e%7]) with mapi id 15.20.8901.018; Mon, 30 Jun 2025
 20:17:25 +0000
From: =?iso-8859-1?Q?Ywe_C=E6rlyn?= <ywec4rlyn@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Mandrake, 2 - early approximate marketing name (was fair pay
 philosophy, low jitter)
Thread-Topic: Mandrake, 2 - early approximate marketing name (was fair pay
 philosophy, low jitter)
Thread-Index: AQHb6fszx/6sWtq8oUCY9OoT2JTS5g==
Date: Mon, 30 Jun 2025 20:17:25 +0000
Message-ID:
 <PAVP192MB213538393A005003F4F80B78E946A@PAVP192MB2135.EURP192.PROD.OUTLOOK.COM>
Accept-Language: nb-NO, en-US
Content-Language: nb-NO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVP192MB2135:EE_|GV1P192MB2324:EE_
x-ms-office365-filtering-correlation-id: 82259e90-7c43-402c-5fe1-08ddb8132123
x-ms-exchange-slblob-mailprops:
 Z68gl6A5j28/1zI175Q+5o8Rxi6Qru3oFi1QWS4diNkSVJ9X/MM6kivzqGOvxtX9QqnH3PjTzEVGuvOL9g5G43bMERer/io6PfJfIJJLPCD1HoIG+EVjig8Ur37RcnmwdM8DmUwgoBO9ScHgKLj+klBgc0K8AcauO7sQApMf9BUnoT5C3UKGSJLm4SV1oYgQzlh0SwOaVKI++cvZ6uaWsXuoRqq2ZpoEu/yrMPo0LObtHFuFuALiGDN6n4x4K7REAocGLMLdFHZTJumWejsjs8UnlrCizd/MJzfx21R9bAi1pODwWZJkQ36dHij6XwYgGBJsmIcZHOgZjw5BXrDug5DhhAg7q97bWUjDwWZOQcAt/0QYYcXtgo9hLL4djV7SN2DWi7mMIHDFto8/3hchj8dGKMKijuVtC4gCTKK6vMC4xRtVwfOHF20ELas9Y4PECvUwg5N7V/H8VaTVl2fd59oq9VMzUtaWAlWjcuuHgcKFFZWVVoZxvO1ock0dJbRyDl5rpRlJ/q9tEvBgzaL/Z5kRbJZ5nXVhEXFaAoUBGisguR6N9Sgh+gjDTvRR0G4D8L7YogZTx9UuDLlwPIU9hvDKbKxEmFF8l/kByDuGXvif7TUt+/C7BDfYxYkl7PwBvFpRzj7OSxLF2KnYvzd9dykb0lJ01GiAV5RIohFnMDQCHlRp/ASXkDFRuw9NmzaB5O+iCFA9XCb+xW609HTfMmMh6+FDtKUed4C9wohJWe0VxNkywCY9eZUMn9O7XFBaQVFpcqQ7quDsSihc5G9fz8SkA/dQKTjXzC6znIFQjXKRSbtCtx8Y0Inx4o5Pcxv0
x-microsoft-antispam:
 BCL:0;ARA:14566002|19110799006|8060799009|8062599006|15080799009|461199028|15030799003|102099032|440099028|3412199025|39105399003|51005399003|40105399003|10035399007|26104999006;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8PF/NrN1QsyNgkp/UCpOKxf74K2zF/FyVoCGNx3mQIbgwmyXs3S2FcJZSv?=
 =?iso-8859-1?Q?URimxa/NlhnVroDyJVOIbaMlY0jJmruH5KgNuuNduXKU9QXK+81DKwypbJ?=
 =?iso-8859-1?Q?NBDhJVC8q5vy3huyYIbjZCotqklmsOLno3kd0q04IXjChhoHBXeOPt+Mze?=
 =?iso-8859-1?Q?6Qw2HIMEQ9ZUFiqs8qWx9V2D/CzTB+snpqMY1b2C/5/sLl60My7Zl6nbRT?=
 =?iso-8859-1?Q?fxDdGt+6kGUpmD35DmzN4Q9FJYwVFjYt6iBw6SlGoNvsY12DAf2LvNR5Kr?=
 =?iso-8859-1?Q?TrkQMncP5K6txlL7lM6+/Dysh9IxQvkrf4Vnw1TZIBwbAZOvSw//6xvcDw?=
 =?iso-8859-1?Q?Slgvyb5LfW2ILih7hhDoqghas1Nn20W+DVWxLF5Y/NtZdHH64YB56X4YFC?=
 =?iso-8859-1?Q?5fRKxRWj+7JeFEVQZO39pftiN7BKUygpPQqygUTZFZ0jsLAMYt4cf3KVIg?=
 =?iso-8859-1?Q?glnwtDpQekqbWkUS9/QSRy25GXhM3W3TKAeotM0UF5r9HkHuAmhQMAhHSc?=
 =?iso-8859-1?Q?/A9RXWd2DzZmOxP9x56sQhDXkt+czYUgv2Jr6HQrfSCRFh53/7PiTeZgiM?=
 =?iso-8859-1?Q?mVoC2vupQkwwTwtTo68bqHD0UR7wfdsuF7TdGRuWX+5se58B5CP0H29SD0?=
 =?iso-8859-1?Q?ZpCwySUUpdLpLIEI4XmQORUy5+BAg1is0ATP9RYP6cnLr83cue57R303R5?=
 =?iso-8859-1?Q?e01Gx7pFlQUF2RObjkwnBDSTtCF07eb9gerQc+Dgbzp8eiHez5624Y73d2?=
 =?iso-8859-1?Q?UZAkkr3hP6R2AUO1JzUErqYitRhtKEryn8zO6P1PNdXRzjxMqLIc24mVqy?=
 =?iso-8859-1?Q?WP6jRWO/y50orWZwAhCl+O2RFxpMHyIFuuF3W6ZQK+glezfMLcwN+/B4yy?=
 =?iso-8859-1?Q?NFGOEj/o00wagzaiiH75rbSB8pr3VcyniKmFcEMPpz+oJug6OPL9yVtsXh?=
 =?iso-8859-1?Q?GNg6kKF0/FV+qVwilhCVY1xECcjELhqKXCZgWftzuLSUFr4tYbJ86hIgD+?=
 =?iso-8859-1?Q?J2XmD4KcHwMfLIvels5F5FXRXeLKTKtget3Cu2e855Zae1YqP5+B6/OEfN?=
 =?iso-8859-1?Q?cB4MybQV8ISnUvZuCz3CsDCbB/extmbMwMZ8xPlyx0H39ZTSu+3xJbtwjA?=
 =?iso-8859-1?Q?PkvNEppt6A/HpFSqjndytoPfzPe9JDfVOxFOfWFmftD00lPWT32WxyuQka?=
 =?iso-8859-1?Q?8XsAmKakpXIfIXIgvtrk6egHWWZxwMccvZiiFYni/i+m2k4SEa3hktUIR1?=
 =?iso-8859-1?Q?R+OtUcqhVM7oGCZjqbPdI5v/mMtpOMcaxCY1CpEbKKWAlxevgnxozKbyJv?=
 =?iso-8859-1?Q?j9Tf?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r2ryCJKifAqzzRhqpP6QxxTi6QxVScTvL8BEMigo0i1sCGFu7iY3RcNi/+?=
 =?iso-8859-1?Q?XhbFcG8ZMDerE8++kS2qnCmqaQP2ozVnFqdkr25UFb5UQSs1FTmcxjv8HK?=
 =?iso-8859-1?Q?Wwp8DuPNg9+KlBFxcaAX91mTFZB8n2blUyzc0a4QsbDes9IjThqIhPTJXh?=
 =?iso-8859-1?Q?72NkmD7DOuvZ6KD2Iy5XEiohNigKkTc1VTDMIPQRVqB+rt1czbsm128zoa?=
 =?iso-8859-1?Q?LCTBe6hxSmOHt09neZdOxE1TUshhZBvIJEMr5+NjL0uduQHrvAN/L0PUIH?=
 =?iso-8859-1?Q?297Fb5iYO+vqhzFRh7BXbi0yZIPyU91eEdpntpZsjl8E996rR0WkHUiBWK?=
 =?iso-8859-1?Q?aWARls9TXWs4zZTrrX79uHs/MGE1G/HkprEG5+LYjJOBmQEpeZRAA1Rgkg?=
 =?iso-8859-1?Q?K89fd202sLHgHkN1ryCXCxwZD6tD08v+H1P8pNm8AXPP919Vc2giS8k9B5?=
 =?iso-8859-1?Q?lUqi4Y6YLl0xLRrP88/cU9G/dldHqnlU/+V1fhTvVsg+ugptA35Vrbac0D?=
 =?iso-8859-1?Q?vMldWv2Fqt3piaVJuZ305lA8RJrzYTpAKtnaEOehaVTNYXo3m4ts6A2Nsm?=
 =?iso-8859-1?Q?f1j+DPmsz+ywzYew6s3g5C/7g8ik436Nx6f5zhg8LdZGgLqFlzPAUYUnX+?=
 =?iso-8859-1?Q?cOpTr4/8aAw4wNjBFmF4DyMtDVLg9Dg7AaTbJhN5oJ7fqlAqZlglfdcEsl?=
 =?iso-8859-1?Q?pqTwsqBGwPx/4rPrFQxRuYZe1wk9cESrGhX0eZMU4bq6uF0+2Fx3BwaPZQ?=
 =?iso-8859-1?Q?cPWtwkctAP0nexJUHUn+ruBe35EH4uSDm0BVIXRmjTZIZ15QPukDLRlQMC?=
 =?iso-8859-1?Q?X89+ChMDY5vN41qNhL4cZ0XcHHpUEgHcGz2XATOlp195ycXWAyyoKcIXR0?=
 =?iso-8859-1?Q?jE1XQPVysjZfZHv0Wb/FYPTkSiuV5yAUWxIwdKRAlHFlyZqJU1JIIADZJn?=
 =?iso-8859-1?Q?HynRKjY4tMKD0FUPRsFxeO0R36l36pZmDCqNg5xcV8HBOLJ7R65ktL8l2y?=
 =?iso-8859-1?Q?H7wjwxA3JltwDj29fPbHbEV4kN0ZhdQZB1oddQLt89obFshf1SxbyqpT/d?=
 =?iso-8859-1?Q?aEx09jQsqLQDss3uymAbiuafIp9VahT7bvPR1vpvXqgrFkiIBzIlOUBTJI?=
 =?iso-8859-1?Q?zgaHN0BaU7oBbiNjZHBgLVBZLpfZIFnxVunNUsNLLMa+j0j2shdY2oMLDY?=
 =?iso-8859-1?Q?Tde2CXfLw0uuWwSuPzb5ceh0yiNC++HhbRzQI/SR5Cvbiy4nTxJOdaZTaY?=
 =?iso-8859-1?Q?7GSK7tIywSStWpCQ1ytJNv3dnU6pKyfR6TH+Vhgf0M99+8AWeaOsPwFcPo?=
 =?iso-8859-1?Q?XFaHVYUE1cqAZKv4cQq7s7t8YoUq8/B/E0jAOvIetJgz7pU=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 82259e90-7c43-402c-5fe1-08ddb8132123
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2025 20:17:25.6241
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P192MB2324

Mandrake caught on in the late 90s. It seems to still be a defining happeni=
ng of open source.=0A=
=0A=
It seem to reflect my intent of finding out the right philosophy, and was t=
hought good enough for the time being.=0A=
=0A=
Mandrake of 2 really meaning Mugoth of Ta. And with Ta one can do 1:1 reali=
ty oriented concepts with associations=0A=
and Bitstream OS, is this. And Mugoth philosophy will be the background. ht=
tps://bitology.eu/=0A=
=0A=
This really is the only thing this project was about! I hope you understand=
.=0A=
=0A=
Light!,=0A=
Ywe C=E6rlyn.=0A=
