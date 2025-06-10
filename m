Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012020.outbound.protection.outlook.com [52.101.71.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76DCB28DF18;
	Tue, 10 Jun 2025 11:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553772; cv=fail; b=jxjB1yAsb+BlDE0qTZfJ50SuDD5MnYcrL4BdrydfUa8hRby5a7PTXjmmdHFiO+bFW6vbcoQ5yWuOOiAzP0K3sdLB/UNNviJN/+J6fsuqlpBoxMtrgTc78VGlx/goxNwMKsBkaAphox1HgXBKW5Dt/Md+wsp+rekF9mEmOvTmQQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553772; c=relaxed/simple;
	bh=4yawzaqdjkjuObQT3MOVFLyAouWdFWIc5iRSWzsWenc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=HHKUm7I6+iYfFX/zqUNKMEPboRFwegJe95EHriy7QKUT887n6uzrzhVzZQpSYeL3ImKgMGc8iVImiB5Kxwz42TAcUoTkEkqC/6elBmGbQyLt43bicLYqMKZRXNOdetQvO9/F2XEVL/LLv9D3YsWnOopWhVM/hTl6eN7oiAptGCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=MWgLueDN; arc=fail smtp.client-ip=52.101.71.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="MWgLueDN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sjlkHsJcOrUiMCmt7fLIZD+pX1ns6i6SGT6KWiIgk50y8LBLRDaHe2uLMeSJa+lLzvXJAaXVMZdDOfmubJBoa/Y/owxUAV5qyc7Lk6rX6Z4tsZDukAz/7FXX1miPFcl5mxSU0g+Tl1QQEBNA06nRHgTj3o2MGEJ7X2v5DBOO3NHcsXm6QVMegeb9NymVOUg4qvHA17tTQV/6ALMD1e1GPjD+/7P0jKLPR5/+gWw3npDQmp5wu8RYp5FQ+C5jOre40QDv3qJl5VCJ51oywBLXaJTXVp+sAn5gKuzEFLxCJwceE/n1zEnSkQb4as0bpbufA4FOLBbkVioDaVoE/fLPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4yawzaqdjkjuObQT3MOVFLyAouWdFWIc5iRSWzsWenc=;
 b=eTEtbQrbRGD6dLmvEApqf1aszjwxF9gFH6pYUfogkGx93NoH0b41vqKmMdM0yegSyRJoOlj0Ejo2mNX7klwnfqTlHj+1x0hV3jTljDZMQsNL9nrGXCFRic6V2cIBwj9KpjNdEfJcD21pWPgXahuKIzTe8m8ZY0JSEsoY7Ua3FZ/hQDb63Mp82CAzkZb5aNYxN2b8ck0KQS8WCVoVyoJaeIwDUWvL+xblyZ5Njk4TwwkpB5T9Cx8dxm1YOmDf8k8UPoL/D9ShKinVcbnyI0BpAUmXOy2VSdjLnkew+hmJSuJXQQt1YxBafqAJUUQZVgJ41frBBH1lAvzqM/NwJdS2Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4yawzaqdjkjuObQT3MOVFLyAouWdFWIc5iRSWzsWenc=;
 b=MWgLueDNQkKB3UupMSQBA6hpYtSuRK4qB5nAJo/K/uAhA8yhsyeMxnLJ/N2jCYtV2WZ+A3LjvNqPpav8pFdD7RYssFWWdRiNyxJpNayaAMj0t8PhCfmr2WAYb4eK1GdxFyXqK7EeEGvoPO5C/N5PXdzUVDzCJteOQpswQ5MvZt4=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by GVXPR09MB7710.eurprd09.prod.outlook.com (2603:10a6:150:1e9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 11:09:26 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%6]) with mapi id 15.20.8792.039; Tue, 10 Jun 2025
 11:09:26 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Inochi Amaoto <inochiama@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
	<unicorn_wang@outlook.com>, Sunil V L <sunilvl@ventanamicro.com>, "Rafael J .
 Wysocki" <rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Topic: [PATCH v2 4/7] irqchip: MIPS P800 variant of aclint-sswi
Thread-Index: AQHb2e9dx3+lqnXWh06WW4bwNfR8k7P8K5cAgAAIhUqAAAOxAIAAAJhe
Date: Tue, 10 Jun 2025 11:09:26 +0000
Message-ID:
 <AS2PR09MB62968E478451D6D4480A8FCE946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-5-vladimir.kondratiev@mobileye.com>
 <iewyo4h3yiqnyn6qrgmckwcaalovpv2udf46jwpor4s5ni5bvu@eg2ikgmswcbg>
 <AS2PR09MB6296822D5ADAEAECCC06F976946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
 <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
In-Reply-To: <r5sdm4vs5wayictlhx2zfui76ksrei7bq7wpd55eo5o6ommkhm@lsx2mqsldlu5>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|GVXPR09MB7710:EE_
x-ms-office365-filtering-correlation-id: cd030b48-61a4-457b-fdd5-08dda80f4327
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?RYZ8fOnRxUEmfUkBKVDdVIgJPEdAOQ2Pr3NrxxnQsk1wC1EBCdYYLxbgR2?=
 =?iso-8859-1?Q?H43r2WRV2ekE0tBLdrT8VhlcwBy9lVvfouvQXk2dPxM2QGQRKgQXTB67S6?=
 =?iso-8859-1?Q?Oww5oaqmjcpJomNOL/MiMydIHWdwke7/+8avXd2qgYnJuKbaROp3cBuXtQ?=
 =?iso-8859-1?Q?3/sXOwmDiNeYajw8LBn1FaD6u9Q6MDA1TD28c4JNaSjiU5x1naQkMiMy8m?=
 =?iso-8859-1?Q?0yVhLSWcydWVsbIPP1VdHHQEMhnxw3hGUsVSO3S3odLpS6r+/CHhdaVM2z?=
 =?iso-8859-1?Q?cs/S4yZKABHysra6xfFxeQ89Fy+uNLxY/MMzUh419PoLEqXY2fpzFQtg7l?=
 =?iso-8859-1?Q?WVKAXogCPpGrszlrWRhRlJYqvaQc/NS3xCn9tnehqmbLN6GIC//wAq7cI2?=
 =?iso-8859-1?Q?Jg5s+JGCgGt6tq+MaVTk7QLrAQO4NiyPk8xv15VAM3tLdAmc73PKT4fh2a?=
 =?iso-8859-1?Q?4peEqI9BGu6XEos49Ru57AI/GQ/5Mspjkx5Wo7owjI/y+wmMQgi0Ia208T?=
 =?iso-8859-1?Q?tCGiT4k7GMJtxlV1xKH+hmmzHOjYFQymrFE/fITrq2AHFk3LHqEHzebK+S?=
 =?iso-8859-1?Q?Bs1c6DkWaoV2YzQ8/yCccirZcIbqM2W8hV73rnEBRLfZX0B7dE1TV/wzMU?=
 =?iso-8859-1?Q?LNNfA1fMOnqV6KsptHWrE9eKcMRzZJ3F2v/xhRkN2Db/BalovXW92fpVqz?=
 =?iso-8859-1?Q?2yTAnCJoYa9oYDgES7cViSfyxUM7mCjdA1M43/fJw+FqY6W5fh9hwmEEi4?=
 =?iso-8859-1?Q?8M3naTsL8UWGJorEwpjvpDB7G+nMB1LFhADUqrRGiZmPaK7vCpDtlnaNQC?=
 =?iso-8859-1?Q?7xdHs0Mq51FCiwNwuW7NmCHE1DzrY0/fML6kpM4AGS1JqF4eonXIuSz7Bk?=
 =?iso-8859-1?Q?QQmQVpbuLvj/sb2NHkBrQBefnAX9i1HghbAEhlJ1O09jwGT3lGq1KTj/Uj?=
 =?iso-8859-1?Q?HvalSGULfsqPjOsjYg4u4POOBKoeFTYlmc6aMqlqbRcREJztBokH15HD+c?=
 =?iso-8859-1?Q?cuCBoh7IHJcYFMDgfFZZfM7XmYFbvSaQ6xwp77mCyB+FmjwuOsI5Jm42ba?=
 =?iso-8859-1?Q?gB1UvBgkO6tFSCzi2wUr7TL3ttlTbDDWV7sznZpmipvga6mbLqUORrUCy8?=
 =?iso-8859-1?Q?wukQC+FfJqQK3BHwo8a+7OPAO4IzSVxF3Z7WZBrV0tQrDExmyz7GLhQzSd?=
 =?iso-8859-1?Q?KWRdRuDRscfcqWDcT4RjpziFmwhX9fDVGcw5HKdoolBP+5KD4Zy86qTQ76?=
 =?iso-8859-1?Q?UHVuLMXkgRFrUKFXViqASYTinq0bDqBNFyMtwUAurX2uYIdGaQiprXTeOG?=
 =?iso-8859-1?Q?U+ThVwMsDpOL98h7+P914y1daBa5bWtYshvd4ChoTk+SEMu0w0flqakDXW?=
 =?iso-8859-1?Q?GRxhts+goBxKTnH0vY8VxmlOEEyfRs++siD8oMgEKG/mQqG3UO1tMpTNbQ?=
 =?iso-8859-1?Q?RwR98/2HeFGfEAZ5wrphcFjKVoVu+EVtw81wqYf5ubOn5Rkf5Nf8hR2ZLl?=
 =?iso-8859-1?Q?+7Co45H4rw6d0hZlU36O7scfCLo7MkMp2U8gxjK+HJZHkgtXj8krMopi3a?=
 =?iso-8859-1?Q?UxChIkA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?DsmL7BD/oGcw7+k7XVNftky2Tq5MZ2yR5QDwMkn7Xs0E1Yc2K+m0eyZ1Hi?=
 =?iso-8859-1?Q?zae8I90zBpo8VHKmESOW7s9odt1CTDVKeHLuOWITxQafpLbXCVBZBpe5Wc?=
 =?iso-8859-1?Q?LTPtxhKuT0dIcbND2zpox1iDAqeMDT4OpN5jqQvGSxUIiP/OeBMd4c9tDJ?=
 =?iso-8859-1?Q?Ax+k1PMkrmQH59YFNMfy7sG+k32gXxm+l2EtfAs9M+/lJrKDBjqY0lv+Vz?=
 =?iso-8859-1?Q?WUJbjc2g1707O8sPW/X2EpyXZiXC0IfAxrMvy5sNVwItDiucUEULxLZAeH?=
 =?iso-8859-1?Q?Fe7jXS7BniUqeBVRcmCWRe9Sy+m3cKviHKaAN1bg+5mNK9AKWtXNWpiltI?=
 =?iso-8859-1?Q?8mAXu0qeO1gMGNfjnQ1ATKyTslpuEad1sHpQEXdINVATFjv0AhlbYuFj/K?=
 =?iso-8859-1?Q?uYwWA+iz/U+Exbw6eaTkDfuQOIQZxECubwCTW+0jQKJCzF+hme963kyeL1?=
 =?iso-8859-1?Q?Tlf+EuvucqkkbKFiPT6S572NGx9p4ZW5e29lqQk6RNVCAuSpNgQslSJ2P/?=
 =?iso-8859-1?Q?0TZpKg6dpjID4BHAH0TaQtiZSrKGV6fcd5VBGk5EzajaanKOz1TkzLX/Vc?=
 =?iso-8859-1?Q?TuYjUb4je5ZGUUjH7/mUy0xGGFaL30THzl7fic42/63FR7iTvjlCgAEVJ7?=
 =?iso-8859-1?Q?SgGEj1woM9hshngpgFjSoqI65xvQIKpQ2W+nw8vS/zmsXpEOF62AEGPUUe?=
 =?iso-8859-1?Q?u7ZZUlLhMmlA90Jlj4YP8wX14j4u2zvK2iI5zaegJQQC5ffI7ZIBJnv/U0?=
 =?iso-8859-1?Q?0ao3MwriaxgeFlsGjExaOrwSnAjegu0N12ErkMIziHVjeButCEMC/7Hsga?=
 =?iso-8859-1?Q?jSqXrVCkHexoG9ytEMhbDBizcEc653VOIy6gNgOF500UxoCOhhCrqCUaxw?=
 =?iso-8859-1?Q?DLLcOasWtY1ynyHzkR1j0sY/bB3PaCYDJjICN9Anawnyy2fDsq8o7uXlS5?=
 =?iso-8859-1?Q?KmGVln7MM895WZcvq8RhHL1InSkEVOKl9c10zBpk88lfPVc41gOgH8pQD6?=
 =?iso-8859-1?Q?BaK9owynLM2E3+E1uiT0LuWSwohOk+GaqLGaR0l14vH4fgBOcrx+IfBWy1?=
 =?iso-8859-1?Q?vRXKr4cuZRDuCBgpWtkHFAJ6jPRFTxsnWCN5cydtVd1a4sQetiPLsFbtLd?=
 =?iso-8859-1?Q?qSrpc2vlyCIaT4LVgRbcUpXlWU56rOka3FSM0vs66Ib49ZZhD3mbPwzD92?=
 =?iso-8859-1?Q?9yuAAIqOp4gb+ntSherhrV3EHNOsWjn2Y8glfReNdtG+Iruwc6yjM/BKHZ?=
 =?iso-8859-1?Q?laq1vGfBNA851DRb2G066CZfsg73uvDJuaOI7Po7D7uVjIaMNVh6YY8qgz?=
 =?iso-8859-1?Q?k5H0EaMrU1iMW1kNuuWax1rgsT4J0SMemVt5gOL0Kee2xK5PZmOth5zPaS?=
 =?iso-8859-1?Q?MlEoL1Z8Qy1c7/ywNzfCXMI+UheQO8fE32FRP8Jm4fv/rib9fn8rvI9QA8?=
 =?iso-8859-1?Q?94VP0RyUqQahx82wB9PrjXEdWyzaaEnSBai0HigblFOGxpa2CGfytKHvBN?=
 =?iso-8859-1?Q?F7qJZ1hMoNsXYaIPlm1zkRypwBPp5DaIBXGjMAp3pmj5DjJnv7GVKaPJsV?=
 =?iso-8859-1?Q?i/tCwZgjegUXCbMf/qXj49mYjsO/0JEhU7Ux8FWWhe9vuV/CKQ/I1QsCbK?=
 =?iso-8859-1?Q?1VOHo6oiH9FLSCxduTctS50qzUF8iSlHE7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mobileye.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR09MB6296.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd030b48-61a4-457b-fdd5-08dda80f4327
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 11:09:26.0900
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NhpODvvzXs/rZfqyJ3Sb3Pf+ntJre/ir0cjgIqufdEt+N6PpPZQjzF8rcXrSMv1ClxWITbvM7IOWtD2CYksxhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR09MB7710

>I think all should be removed and it is OK to use old >THEAD_C900_ACLINT_S=
SWI=0A=
>as driver config. At least for now, I see no similar case about using defi=
ned.=0A=
>Maybe the subsystem maintainer can give some more meaningful advice.=0A=
=0A=
OK, I see. Then, in the Kconfig for THEAD_C900_ACLINT_SSWI say it=0A=
selects both THEAD and MIPS variants? I am a bit not comfortable=0A=
keeping THEAD specific option for non-THEAD stuff. Here it is indeed=0A=
good to see what subsystem maintainer will say. If I remove logic added to=
=0A=
the Kconfig, maybe I need to rename a single config option to just=0A=
ACLINT_SSWI and list supported variants in help text? If going this way, yo=
ur=0A=
input is important.=0A=
=0A=
Thanks, Vladimir=
