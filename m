Received: from HK3PR03CU002.outbound.protection.outlook.com (mail-eastasiaazon11011055.outbound.protection.outlook.com [52.101.129.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F2101EE;
	Tue, 13 May 2025 08:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.129.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126459; cv=fail; b=jyJ7FImGdoC2s1DFd30zEXp/NCAwtD5rMAaAxK2imgjdj5y4C7cAXoNfltg4fynGFzpduph/zejB1qW69/wbNfaYO8Uwq68rAeRc58t+i1ZF0eqb5n6cg+swPHcnrADuPZmyf8rcvEJN6S3WjYmGs67BOvNpY87i8Nn481sXXw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126459; c=relaxed/simple;
	bh=pIkJBsBXKmkD8IXWuS22f73VbwpmLmZJHx9CtJbs0Jk=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pAJr9yUo1kOWj/Lsm8MwszkRbOuUa73RZT2g0M+TRYlQf0aqlHaccCwP64IBrV9tGAYFLujC81E4oAsAo8L/O0r4ugIwquOInrqXDewpf/IivsgjuGeuRdxN2D94mL33JmZfJMmYMe13bOYIQAOlwC6oGScfyp6gXUpOjNdklQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=oaArwH06; arc=fail smtp.client-ip=52.101.129.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="oaArwH06"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bsl7EXtsAHQLwH7kDCCfarCmeTr9OZ8fAA8S7qSwKEcZOBLFG9XLMADTI0R4wnLRoKka1TxHdb6llmW6y9fXPbr2Gf0Jh0I08vMkDtbdG1zMGH9MrGCX60/h/0lvNn5chQ71xmRTlLE8my5pI6jHCtmPP3G8uhFFR3wfyk+hO2Nip2JtiZWlUYAJZADcjEOT39fx71ebwe8m2lJE+NgKoJ25U1YCgxTCEArOb+Ui1iodhI+2K7OeHxmBFcnxaUQ3q632s1TBfkscKmxYz4ipBwNCH6UmggSt+JkR4+hwx4wjS7DFiWT7u6ouJrIl+Z8PA1LBbyPgP95EO4AG6iF7xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pIkJBsBXKmkD8IXWuS22f73VbwpmLmZJHx9CtJbs0Jk=;
 b=gwlN+djsh5662OGaQuq3SZPQzEZPex1tsB+3S02/9sCyGgp63mX/S4nvVcUFtJrozLrMu+SLDV3UVPYiAwycf7e73QOzombCbepiFxnN0D/0BzvfkDzxEoXjHbcTWeJXBLX0QZSdn4d+Qq9+gTzXL59voc7mM2kzlVRAUGcb+pMpFlRJVS4bVDrUqIgWFA8OEDyY39oRisWuWNyOWUVLcapWxlnPb3gjhomotqHLV9O4RzGOT2AUXNfSEgqglCCXztjy5o4NbXsdS+e3FYJ2MVl6X+aKc7JFYCUSmqFvPDFpUdkq2AC31A6/mG7PW3eUykL+xyFyumV+JwsRilTspw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pIkJBsBXKmkD8IXWuS22f73VbwpmLmZJHx9CtJbs0Jk=;
 b=oaArwH06cDHX2dCLYof4yUGf8gIwIa1f0We0qi/w9j+rqSj67mUQIbA6ALKzU+2LtWq1DqEguaH0cnfElCSSWpcZlx29qYH/OttVsL6khflMWT2OjVkP6DfiWQ4m4w7prBhh4cFE7es7Oa2PJJsD4NBqvj7/bkcvuv3rd9dSHpwdh44/Ug/O2lOuTVo1LRWIbbdF3u4MihaWMWW8xPEkOXs3Pe+xJ5KHMagPxEh4Mli/CFgonqQfzr/BgAsZBHOjeOcK0fM6sa0rdcEVlhX8dpnHoHSrnuSJ6dLBJ/9ZT6cJ2xZAhx8UpGG2+d/Y/wSZMuxBrtvhjwy5B6SrwdAx3Q==
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com (2603:1096:990:a1::6)
 by PUZPR06MB6065.apcprd06.prod.outlook.com (2603:1096:301:110::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Tue, 13 May
 2025 08:54:14 +0000
Received: from JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe]) by JH0PR06MB7294.apcprd06.prod.outlook.com
 ([fe80::6bd3:c327:c5c2:bbbe%6]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:54:13 +0000
From: "Chen, Jay" <jay.chen@siemens.com>
To: "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Shao, Tzi
 Yang" <tziyang.shao@siemens.com>
Subject: Recall: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Thread-Topic: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address
 Device
Thread-Index: AQHbw+SZ08R+QfrLvEmvDYKJHJlZqw==
X-CallingTelephoneNumber: IPM.Note
X-VoiceMessageDuration: 1
X-FaxNumberOfPages: 0
Date: Tue, 13 May 2025 08:54:13 +0000
Message-ID:
 <JH0PR06MB7294D3D16563E250BD6616908396A@JH0PR06MB7294.apcprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-traffictypediagnostic:
 JH0PR06MB7294:EE_|PUZPR06MB6065:EE_LegacyOutlookRecall
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b54628e8-ef27-4ec6-c9ea-08dd91fbbc5c
x-ms-exchange-recallreportgenerated: true
x-ms-exchange-recallreportcfmgenerated: true
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?iWpO84KluJHyu65/Z5d1sPRIkmcil/c0gSE4OEb0eKCsIvDFlFCXKfQ9KB9G?=
 =?us-ascii?Q?K7OjA7D9HllYZQ19i9XdhMb1cM6KxSK3gPzAA7xhAbYZABfi9XFGbln8MJlU?=
 =?us-ascii?Q?enjQV6XdArz2mXrP4NkFdmCuOfEPWOp2i3AYie5p46yCK0QHIPLYmvyh72Nx?=
 =?us-ascii?Q?QCea+7Sa8WdakHWGZ8T21DPO7nMHEAlz/2T3kWb5Rb+TyMzEt789kDx+YBMZ?=
 =?us-ascii?Q?VI6un4dohdYYn+1+Xj79H2IqNZ1eBjID62AAgFfmOGUStun9bbjwAgZuvl8d?=
 =?us-ascii?Q?B+iLkITWxaO3e+ZUMrztUJ1Pem0RKV29JhKaOnOsvvBaNDTw9bVaziVFnbFO?=
 =?us-ascii?Q?hlNz0NFhI8q6Eqic1YHaAV2tVW25DXZhap4CpqMO3UlFxdPpciIIK9vb6Qfs?=
 =?us-ascii?Q?B79gEk8+gaENyX5Dlz8neHliRFzLXbm/ctVwFr/ImA8tCy1j2b616OPVnNsM?=
 =?us-ascii?Q?MkALWu/6NJsCzPowuzEKO5BrhnGNayq/MlBz9pieS+25OGzKWlK6wh04t461?=
 =?us-ascii?Q?1s/YVa5mRk0tIwK0uxtNk0cGRdlaxitKeUbFLdpfwhrzU9OPsBPOy24odlPU?=
 =?us-ascii?Q?ObwXcI9j9zzpPIFMipJg7Y+eO8HIezehwWINy94ArjhReHpGNtplCE4EzHkJ?=
 =?us-ascii?Q?dA0oZrXeYJ4vwUVAL06e1Ca8jjBaAr7DvOfUQ/x5V2YzEOkhh5Elv5NZ0MjQ?=
 =?us-ascii?Q?VGgjRJSOnz6ukwnhOq3ghzQdoAR5B+eZ61iAh0fj4PPC1pn/h6ji4NLnJrID?=
 =?us-ascii?Q?iphBWuDtrmzpGWvcrIZm4fa1JaQhm3sYnqrXI5MkUrbE6YHNkbtgN9zQ2afO?=
 =?us-ascii?Q?EZ88zmHf3D3Setv1NIHSGw1xVzMpiTxMR+aREguFANVVYje27kMNCeHwR7Lt?=
 =?us-ascii?Q?+6mHVVbhQyF71iZ27yi/esoEJ9wxHAXI/cccRh+Cm53kg32ldexSpfV6Wz1A?=
 =?us-ascii?Q?F8+GInjIyPmwJXlHPYflL7HzwgS7TfaC+tL9DME9GLLeyCjTaNP1PZcnnf/n?=
 =?us-ascii?Q?zn1VXG/xdc6Om1s6rSsWNtLtqGftdQnvEP80jhicAa+Js5dcHbx9bY0sA3/w?=
 =?us-ascii?Q?4c/vdEOGHkVc01cuQVbs1psqx4gYdKYy+H8wq1L4UdMBmP2StK/5wcHFkhUm?=
 =?us-ascii?Q?S9m9U7xjKPRdSkXVGMDmdw7Hc3Mb1JN4VV/dfCIiBTD03HL6ri8knEpjyAeJ?=
 =?us-ascii?Q?2D+pvpHDcqIvTgeJrg+loFe9uitr0FuWViyWgAfSqEU5mXXAXjGh5dAyFRGZ?=
 =?us-ascii?Q?sGomv8SpuhOCG0fQJrTvphETYT3U9PsRjDUm0GC/ifUIAYYcgch7JUV/Tw4/?=
 =?us-ascii?Q?5h0y6j4qxK+7h4vy2VylYec71X1Ezb8IeZ+9RRA8Gnjt13IGlvpYKPGkc9SL?=
 =?us-ascii?Q?X28g1op6N/kV/dVwGrbXxfnHWTGuOUslLpRWspIcCBxbIvP1l0Qg1eIk1A8R?=
 =?us-ascii?Q?sDP2jMnqQ4n8Pbx7RCA0CfRESZ5WalKhqFyEqNmXvhTJfWgyhbxICoZ7pY/W?=
 =?us-ascii?Q?lPA4658I90abvUU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:JH0PR06MB7294.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?IWsDNaYh9MA/gi5ubDHMyTsfRJOfaaTZlR6CrmUHuC5kIojmy9QSPgzFZiTp?=
 =?us-ascii?Q?QeFrO8va/LLN9J6V8h5iTdTDbv+ar3DtGYyTSJK2n4vPLleOdDecV5dcJ81x?=
 =?us-ascii?Q?BsS2M9ftI3J0jEB6LRkUSeRvLwddk+bZ+laqjAeJj2OSBErNloVL+h/VfhQn?=
 =?us-ascii?Q?GTtT6rYfrPYrVyj0ZR/C47h1hAovBgackTOegd+0/Ieg3PM+npgeD/FaqZH0?=
 =?us-ascii?Q?X8Um2K5TVC+tDBqMdhMs/VKZ/uNBdsR2SDvvS7dd9qfsndkBBORgEzK2tyoV?=
 =?us-ascii?Q?nn3+bzQVigMOJGY9VOUGerF5qtz6KKtrsAOXmOTHSjM569t4/96w6kfIc7Ma?=
 =?us-ascii?Q?Cg77xMht5WtolplTZ1oE++SZoVGutQ8VUUcewxSWFrrnXVVqeP+zbtArfWah?=
 =?us-ascii?Q?sxyEuT1/DdBkYCa2pZHJL13saCWclfmE+4zN+xsqnoNCEwo8oXN6aCRZ9dwt?=
 =?us-ascii?Q?YxJvegiJ4LSTh3q3qmUQj8+1Rg0IP3t80ESK9C5yL3E81aaN8QjH5xlYIYo5?=
 =?us-ascii?Q?RdYNb5zbEWuLhteyaV1ILqUZCbojot4HBW0g979SbRJskcTblJ0OyKBMd/nw?=
 =?us-ascii?Q?93RDb/TlgY0hbWSl9JN/roJunFosC49eyY3EhzOwAiyX6uy2+Cx0mUegQxZ2?=
 =?us-ascii?Q?VuGrPLaaAvWm1kr34LDrwV4rz8WCyK57tbb611lv70Em/x8aiPgB8hX2m5LF?=
 =?us-ascii?Q?pXTQ7TQSZStxA6wn9jXVPlF9s61STrmFBnAultAyRi+E3nTowWRa5oqTfo6T?=
 =?us-ascii?Q?4qUPPXWC2XMSmJMvXgCAc65oV7hScTKQE2Vr032T4g93B5h/B1/XItgKm/N8?=
 =?us-ascii?Q?Wn35dPx7QaDsFMXPMIMVhREc6mnJyBPcGi54lR8f3rR0gneRiRI7yMP3na7+?=
 =?us-ascii?Q?mw3EgHUrh0MvLj/lFDYkNOLNPotfezBSmsTocBbd6it+wI64lqqOKPIuFpqj?=
 =?us-ascii?Q?ZM9+y+UUlqe10iRDWZJ+0Cvm1hMte9d2y/f6utPjgwSy26SuIv3zFvdJ08vG?=
 =?us-ascii?Q?9W0wDAkZTx037C/Xj966yfImNapiEhw2fYMXkTCBsdayGvwoNAoef7scxxnG?=
 =?us-ascii?Q?kRBEvFqWDAqN1KMvV5NDfvgHsDUwSCtGT9m2P2wcDNcgOGLjdkAOXrh5qx7T?=
 =?us-ascii?Q?TWs1u3eAq0GY2bVl/5j9XC769qtjmO71EEji6pHtCrwY68wjDeTqEWDuOwpL?=
 =?us-ascii?Q?UjHJmm0Az1usWwbHrgyuRWHysvnplZDkUWgWHbn8TGzHRruBaGSrjmP9cUSF?=
 =?us-ascii?Q?r5zF4DzjnslJLI3dExCgc23vrP/la+oc2AvWeb6gnhyZSxsSG2jY65FYVBZo?=
 =?us-ascii?Q?wfrPuxhm99IF2PwgxO/qBFWM/GW+qpu/cbdsg+DeaUZiu9XZSN2YssnCGjqT?=
 =?us-ascii?Q?8zj8HUIylvxNeaDaMFdFi2SNbyiAoQCozJoTI9/j6mUcm/0NI0oog3AgxARx?=
 =?us-ascii?Q?PmcWWwuKnp+b4BUG2XIc17pvhK/Xjnr2RdDRxUyY7rKRrthNvZpgGM7idapa?=
 =?us-ascii?Q?S0Po06bTf3QJrLWTVqIwHETC+AWnJFdzxOFE1evRzfN4zYF4f98Nnf7wk74N?=
 =?us-ascii?Q?WZU5MwLNvx2IXVZ5NQh8jivckHvCll0sBDsE+uKO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: JH0PR06MB7294.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b54628e8-ef27-4ec6-c9ea-08dd91fbbc5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2025 08:54:13.9391
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7xj9rbRVB6GIg2/OiU4IVUsDxsbbovhTZ5CwRul62Cp5ObHq9QgDq8bVWXeN+1pYrVXJXU89LJwQCmLK4llDOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6065

Chen, Jay (DI SW EDA DVT RD IN AVE US3) would like to recall the message, "=
[PATCH] usb: xhci: Set avg_trb_len =3D 8 for EP0 during Address Device".=
