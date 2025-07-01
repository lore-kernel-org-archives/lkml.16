Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05olkn2022.outbound.protection.outlook.com [40.92.91.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953E81E515
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.91.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359197; cv=fail; b=o6MZ7PfsLMovnJAZU+AEMmZ7/XHqXjLQIvTMiE3uTud6SjQfsOj+hePjjmPoeXmL0Z9BunaO7pFRhwRwAU63ByToFq2jklCkIY/ftV7lLcaaIkoFN/d2m4hHONS1N9yxspkXQbjjqiMZyjBqoBZmQAkVIljwaXJj4nlDcxhO/5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359197; c=relaxed/simple;
	bh=2tzH8V2fmUzokZhRwpX8B5pKGthRWnoTOE5fmM2t8RY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UfflWXmJoCUs0YRAdLvnXPX2t+DgixAi5ujv5XoUubZcXmUCuUPM1IsNdT9N1PDB/WRWUoevwvWLS3lJTBkwZe2tYWsmO4655Tmj2egthJqndxX7YoYzCvOi1FjfOseAS1PDUGVMrgIxA/wzMKIGGNITnRQ7tBeoKsyiz1vuTXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=DikrBw/K; arc=fail smtp.client-ip=40.92.91.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="DikrBw/K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUrUwhartYrVOZFix0qRHuDhAXfn88PVNsyXu25jPbDyPjWsmo1cFSjTkmlPkYxFUM9Tz9XcnSXosnYi12t9+Nnz+UTAFX+XSGmteEgvGDKO8pO7SfBg6KiiNjPEUeXFaOw5odG3EMaK2dX8Kv9bC8j3X9YsXjMXfQj2dJp0KNfF9XiIo0wKZ++k+KOeAsNYvBasMZ7jQERs0X6HtD3CuIJ0EzO4n65cZfZyur+BgofU6tCzsbvvtQy423+1Oaa0j2EgBSHRSpVCXpxxmas87rfjb8tD35yv2Puq+KtSitJ9puhcj32c+ney3bgzo1p4pg2MJlha/Orism46wH+HxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tzH8V2fmUzokZhRwpX8B5pKGthRWnoTOE5fmM2t8RY=;
 b=JL5SML28EvpgE311Sa0VdtytdGBDnAeMbP6mthOrcuooTd1/rq94JTxtv1H8H4vu7gZsw03H3nMcysmusfnRaYwQLAUTe1zrj+EpYr4XLiS6urjGZGnwCvs7wrpcUY9Krg9aNycArM9mbTfbVLpbq2/dYtRovnMhdd0z5ytm1kUiHTbMjYgekwAY1wY5Gm5dn9XLFrRU06iynUBckmL9JSagR1BucOwOMVlhlFJLZPknyLGk5dH7wB4cHcYMJiTPYKpP9jobZ8WPYipOx0zfMc8cYo32Lx78C0ZhpxazcAkzE20uk2ZtR0KKj/kEgN4cWo3FQvi/x6NzbUHEtBqUow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tzH8V2fmUzokZhRwpX8B5pKGthRWnoTOE5fmM2t8RY=;
 b=DikrBw/KeuCJXAnWDg0vLQ7UxZASJQYYKWNfxVAZkB7pDwOBrxCR6h+rF6rJONX66DfYUKwvoJ8vQXtrR1OV36A6aZeaSHz+Efphd6AaxjExdNo6vj16NmEnl0DDLriKEZ4hnsCQ2NvS+dDfMsbBtGoRYaA+I1wpGxJQiNX8VlMs6jtMOHOlTwcKbMb/3iUDabEbDdVxJ4LYSuxJAShypQA+m6Ddi0Q6LpXPxqyTG+DhoFJaWo3S5kObLgLq5qSVCrVb6YoEqH7Dlg+BfSj7W4cU54v7Z2JeNT7aveabNV1MtttETTQ77OYV6NaHTe1Gl/aWmpNIv6hbQDVtmXpnhw==
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:323::12)
 by PR3P192MB0617.EURP192.PROD.OUTLOOK.COM (2603:10a6:102:41::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.18; Tue, 1 Jul
 2025 08:39:53 +0000
Received: from PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e]) by PAVP192MB2135.EURP192.PROD.OUTLOOK.COM
 ([fe80::f259:e7f9:de38:cd6e%7]) with mapi id 15.20.8901.018; Tue, 1 Jul 2025
 08:39:53 +0000
From: =?iso-8859-1?Q?Ywe_C=E6rlyn?= <ywec4rlyn@outlook.com>
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Minimal Scheduler vs Breakpoints (was low jitter, fair pay
 philosophy)
Thread-Topic: Minimal Scheduler vs Breakpoints (was low jitter, fair pay
 philosophy)
Thread-Index: AQHb6mLyKBhLXjc2aUii26nMzo9G3Q==
Date: Tue, 1 Jul 2025 08:39:53 +0000
Message-ID:
 <PAVP192MB21355D55EC51FD990147B3A1E941A@PAVP192MB2135.EURP192.PROD.OUTLOOK.COM>
Accept-Language: nb-NO, en-US
Content-Language: nb-NO
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVP192MB2135:EE_|PR3P192MB0617:EE_
x-ms-office365-filtering-correlation-id: 3d6c8999-823f-4137-6cbd-08ddb87ad989
x-microsoft-antispam:
 BCL:0;ARA:14566002|15080799009|19110799006|8060799009|8062599006|461199028|15030799003|102099032|39105399003|51005399003|440099028|40105399003|3412199025|10035399007|26104999006;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?aexc99IZ/YiRHQ5dOmmu6J6PYxUD5hkDc5ZJUG3CfoKop2GxExCP8SxRkb?=
 =?iso-8859-1?Q?lEoRYtyQGrQ0Z4wax5sdaUFuCvonrrAQxmZOzKhaJ0iJ8HP2AJ/J6VPeiC?=
 =?iso-8859-1?Q?L2cMeOLz4Guz/1FrHoo4NTCh1dt5ZLyNwgqvLyS5EsuYWOw6RoSWP1JQTS?=
 =?iso-8859-1?Q?QvhY+O5DuBwk7L596W8rc9dr5taB96WxbQTY/R+J+lKMrlfRZbGbP5DJjC?=
 =?iso-8859-1?Q?Vk0FzmnYOYdgpo9px9K2Edp4wBbQcWL6uHuCCupjNtGbgnBVK4H9ltER0O?=
 =?iso-8859-1?Q?uOmegKLBGMdrGmTQR9uywEDRRsgHYP07En6XuACX438zpnThyWhTi18t6J?=
 =?iso-8859-1?Q?uP7UvQUBIlq9079zN2AeQZC5LKaw6yfTwt64TG+IEdzbHvo7gO6i5WEmFQ?=
 =?iso-8859-1?Q?yalOCpEd0eGiln2pidPAVmY4quRcX6/PiGwill2RSAdScfMWcLQ/oG6YfZ?=
 =?iso-8859-1?Q?jIXPqnfRngdI/oLerlVHvUM5OonaSMbGnC032ZLd+xOes18sUJkfHWEao+?=
 =?iso-8859-1?Q?5EB/U6GUcMt6aOdSq5ro1wuy+fL+Hj1cV4N3Ay6m/DB1/DBgIkD0DlwQSN?=
 =?iso-8859-1?Q?Q7aH2HWKt2WInoCYPsc1W9lMMc8GxYnhe5QsHj1tTymjhnJ53P0G/TJRnn?=
 =?iso-8859-1?Q?y/H4FD74Z3Nto7jx2UMkMHbyLmewggndc4ehxS3oKQTsbLHsne/hN/x8P1?=
 =?iso-8859-1?Q?ibnUf6g3s201qAqk+fKqXPhu4FTGCGEUII95q2nR3vvLEaG1xcH9uajKzi?=
 =?iso-8859-1?Q?EqacwjQbqcFvAAdPM8Lo8bhUyzBRVz6UARydInWNR0Qkm3jMp77hHFXFW3?=
 =?iso-8859-1?Q?+SKD2X0euGf4ZdDcZCJ8Tdc7DnrNlFNXoxFdpQ1QNKOnL97+lNZY83LEh1?=
 =?iso-8859-1?Q?86kDhsxh9+YOfDdVXA5kpnEDMhnmIR7M8ILsvQAGnVm5pDzsJ30Qz92lM5?=
 =?iso-8859-1?Q?uWyZ1XSw3iUOeUZrWSj4uUBPajtzLM2MsPKQIQr4K3lD4zcNqhe7CNLNNP?=
 =?iso-8859-1?Q?KMbTOKAUCq9JmhMCQLD/FxiFgvDGwARId/sqAgIzSf2SGMKfiiUNqv7f5L?=
 =?iso-8859-1?Q?WKgDBDqGTMcP04YKTyg2+vVIwQkzzd29mCr3HrP3rf5FIAj1VY+ZOZCnUP?=
 =?iso-8859-1?Q?rmXco9cx16MSsl78pW11MGcpxsAbwyqQAbmiirG7AZBCXS8ay+A1TQCv5v?=
 =?iso-8859-1?Q?WpHrOHXeXOtqkMOS1CMHBLnqh5f+U0muYoYDeT5/v0UjXqLtjk7ZxkoS+Z?=
 =?iso-8859-1?Q?Rx2dt95BNPNO337vrM1vA8dlFJCwfLJvIsPIEFUaLxB6/KtO8YJ+xTiEi/?=
 =?iso-8859-1?Q?N4k9?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Ue1Qg6FWdLgiLTeuMn7x0TgnEQlQBGMzMWG8mySzplsItKGbI2Fp5mnggm?=
 =?iso-8859-1?Q?pA4lj1OWW0wODDumOQQw8gjwyJHfe4pKc4D35xnOUfQ4mlxZj7kY7TZSkB?=
 =?iso-8859-1?Q?RL3IbQIhj/o0N1zL3WGkyq5+O3XHBc8z0sNzPBSD4aWIIM9adFAUcvxgxl?=
 =?iso-8859-1?Q?f0zEyv8wwFN4cib3ejmArIRBxYCBSvbK7JBDhEA+ZIngFo4iaRkvoJ83BS?=
 =?iso-8859-1?Q?T9uybEqj94WW+J6daDDKhMNCX31WBd5Uny8z7ZKLcUquubxMjmBl2P6uc1?=
 =?iso-8859-1?Q?XjaWwv7yG+ILVh6A9yVjXRv60+8ZB3GYMgK2KzsFIEcncg8f4n2sqbhXJO?=
 =?iso-8859-1?Q?B1MdEXEeLI/92hr8JTasAmaJr0Qmf9RVr6k1Uh2DWWCO6lPsImp57WoyTd?=
 =?iso-8859-1?Q?h5MWs9I4wLXDYRzYqy2WWRf/3qDlFvzsbhWykS1OtFKnMogokYV+Qmlsk+?=
 =?iso-8859-1?Q?Jiv5e2+w9FmF1YqOk3wOV+vlk5sVuB46bS1O84iRPbs61Q2HYCE7N2N2v+?=
 =?iso-8859-1?Q?Wkm2S9YYTiU2PGkQQwSMBQ3V/ZTMa39vb8VNOfq+cFztxvpGHGy3M+/+2N?=
 =?iso-8859-1?Q?a/nbZOoTitzXD7HiPjaiA9Wn7WLB2z/agwx5r9AZtV5WzZOUUbdZGPI1Lw?=
 =?iso-8859-1?Q?V10eXP7lWbivafgQHHSoLuiD6m5TjIyKaDLmpTAzP+miCoW96lIu07lOXK?=
 =?iso-8859-1?Q?FnxdWcPUrTvhSzuKcbm7TO3gHE6mwctSMDmGbdHK4+wXCbsh6v7VNOP7+m?=
 =?iso-8859-1?Q?Eg4oI42ZQZumAo42lNuz4a93bebDM5ioFwd8kif4mTvuVO3Dga11HxZ7yw?=
 =?iso-8859-1?Q?ayie0rhYahmHz151GdqWerE1EgjsnYJYrVr3if1Djs2WvQhm5hCjONUGgo?=
 =?iso-8859-1?Q?9hTG4ckIWVrxXGjirCtqOknw5dLAm925GqlcenhQEKQeYq2LMuWelVf14c?=
 =?iso-8859-1?Q?/7Xt28/47s+9FWOmEkYeFLrSFCCkHLjdSXwTRj6kcPLUNb4k6rsCjSdGca?=
 =?iso-8859-1?Q?yMmNgyErBhaJl6Zd1p1ECtdH1CFQfawzD91ZoNY661q2wP6YHEnWvh0cMd?=
 =?iso-8859-1?Q?iUnH5dm+/xjbxiUdUUmoh7TnGGGIsICsea0j/NeUcCPyv/0KyZwAhXJ+eM?=
 =?iso-8859-1?Q?lqQuac9FP5qGfNuIaIezikLOb67PATC/kAR0typNa7kzr9tdAl3gSopQb8?=
 =?iso-8859-1?Q?LEZ2gq5rsixwyosVwIbgjRI2sxnK6HgqnL5Ixj+8iTw4dBIKOqe1zbZfli?=
 =?iso-8859-1?Q?mKGBzjXd8YZi6rwkM/OMWN/WOJHJ3cFbXmlYjTjapF4ZdRzf5O915/k2YO?=
 =?iso-8859-1?Q?tGIF4sBrG0YmqKA7BUiWXZFMc8kpNxeQmNA+kpW0pNkveEI=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d6c8999-823f-4137-6cbd-08ddb87ad989
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 08:39:53.1342
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P192MB0617

I came to think of coding policies. Is it not better with a minimal schedul=
er, rather than breakpoints (/messy code)?=0A=
=0A=
Is heuristic really rational in a scheduler, should one not rather accept c=
orrect use of priority, for what slice of cpu there is?=0A=
=0A=
a 10 ms filter in sched.c is odd !=0A=
=0A=
Some of these symbols seem to indicate a failure. Is billion dollar red hat=
 industry a failure?=0A=
=0A=
A more fair pay compliant coding policy is the above, a minimal scheduler (=
rather than breakpoints).=0A=
=0A=
Ywe C=E6rlyn,=0A=
Bit Budi=0A=
https://bitology.eu/=
