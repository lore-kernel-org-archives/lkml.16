Received: from CY4PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11010071.outbound.protection.outlook.com [40.93.198.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EAEB293B46;
	Fri, 11 Apr 2025 08:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358963; cv=fail; b=XR7+6Yz1Vg4LxwOJsKR0XF7sLjRfcbotq8/Zb3eRhFlhSdmNu2fHc2is8c1nTPtVtgLcJKuVeNXzadmxXoxWr6a+9jGuV8rAXfqqgkJkYRHgcrm0Y19DKX/qksYCZWRyZy5ViqUWVMMH82B7KJe+BtE/6Su9EKo/ySFZNns9Guc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358963; c=relaxed/simple;
	bh=15bLSZfBcDTnkOv/cT5WuOMas6Z3ySqYLODcwlLzDuc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Yq3x9Nmp43Djo+vQzZEgQFI4jMikgOX3Qgn5rghPefd+tCoqJCRhdc0eORvfYSGbE1lAmdc1ocanZYVdYaTUm+hRGMJnJ6dqpYu6t7jRB1e6aGt4FG1+hXgCeK6nNr39HlHbcVSuo2QO0EnkyJWMASpj94NE2kyalvFleNVqog4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=RXeGzFfg; arc=fail smtp.client-ip=40.93.198.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="RXeGzFfg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oK9fZTELS03ruN1+33SD58ytxNTFWyDpgmFCz0tKaBmJs/d5FjKdw+LU/3PdruaWOj9PL2TGq0ybuxJNtofRunN97WLNphBgpMU0RVa805Ql6iFVrZ0/25ke/9ZEWQAGjrr+7zFXYFTe1juRtKHXfu5N9Y9j8m8uDRtZm26wNjRlwKaexcrUxaq5Wz7xzR/RuVQzj54VJyDDh5WhKHbcgaNVTb+HvhvBLCkWjtM85pU2Hr5WVn3grzQxNbU/8oDMP4Tb6fiLzWsWTke+A8jBZcZvw/iVxiVODnKNf1RX0Z0uSaM3IhoZmp7Kq5uCJnzDKlv/U9Tujx7ibFlACt/WlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eAbxaSboH43W6drahySyZx9kwZs9jJ4QRwqToZCNLUI=;
 b=bIsEqgu3m+PtU3uSnWcusrfAIx85Kilr2nE8LPLOoj9MH2WeQQ2G2JDFnYi6SQ7nJJKGDF8589Rul/ZHfCC3n9kg1BfZrLNLSohfgbF1/XLnnx4gPdEIShcRtBhIrNdx5+5h8CVezoVUcIrDUoGHE9wmP7ExaVh9lR8+6Oy73MR/sx1YYBioYALMy4zPh8QMxZOhofeKTMPj/ZklyCbmoDz50jt40iuVU46epRNiLWRqkHJw6IHg9i54UMFwkDaQsqJkO9v/o/V6Ri4vL94NUO/CONnKtsJG2KyaFriIi1RJ9MRvns9fwVXk0DqRcU13rC7e1TQOXBhjkpYvW+yldQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=einfochips.com; dmarc=pass action=none
 header.from=einfochips.com; dkim=pass header.d=einfochips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=einfochips.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eAbxaSboH43W6drahySyZx9kwZs9jJ4QRwqToZCNLUI=;
 b=RXeGzFfgU5ePfO4OZXmNePa8BtvzvFjZ2pLyiZ2VwCq3DSpnSJShb7UUPS/63tsDyEskCZPp7StMd2fvIWidRHTsvXN88cGD/JnUFT9xHJFfdEnsmp43ofHzd5hwNRX3e93ojyV50Z3Am/vqsNTdo4AEfxsXyir2AjGsdOzvjkg=
Received: from SA3PR04MB8931.namprd04.prod.outlook.com (2603:10b6:806:381::22)
 by CH5PR04MB9549.namprd04.prod.outlook.com (2603:10b6:610:210::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Fri, 11 Apr
 2025 08:09:19 +0000
Received: from SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d]) by SA3PR04MB8931.namprd04.prod.outlook.com
 ([fe80::f323:b482:8b18:af1d%5]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 08:09:18 +0000
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: Anup Patel <anup@brainfault.org>, Yu Chien Peter Lin
	<peterlin@andestech.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Kanak Shilledar
	<kanakshilledar@gmail.com>, Samuel Holland <samuel.holland@sifive.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Pritesh Patel
	<pritesh.patel@einfochips.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Darshan Prajapati
	<darshan.prajapati@einfochips.com>, Charlie Jenkins <charlie@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, Aradhya Bhatia <a-bhatia1@ti.com>,
	Yangyu Chen <cyy@cyyself.name>, "rafal@milecki.pl" <rafal@milecki.pl>, Conor
 Dooley <conor@kernel.org>, Min Lin <linmin@eswincomputing.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 03/10] dt-bindings: vendor-prefixes: add eswin
Thread-Topic: [PATCH v3 03/10] dt-bindings: vendor-prefixes: add eswin
Thread-Index: AQHbqrkGJfwKBoayPkqibQBseIrSMQ==
Date: Fri, 11 Apr 2025 08:09:18 +0000
Message-ID:
 <SA3PR04MB8931CE58B77461178FA2662883B62@SA3PR04MB8931.namprd04.prod.outlook.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-4-pinkesh.vaghela@einfochips.com>
 <174430638306.431792.13578234809737502743.robh@kernel.org>
In-Reply-To: <174430638306.431792.13578234809737502743.robh@kernel.org>
Accept-Language: en-US, en-GB
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ActionId=ad4383c1-4cc5-4fb7-b128-1a4a858532b4;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_ContentBits=0;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Enabled=true;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Method=Standard;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Name=879e395e-e3b5-421f-8616-70a10f9451af;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SetDate=2025-04-11T08:04:48Z;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_SiteId=0beb0c35-9cbb-4feb-99e5-589e415c7944;MSIP_Label_879e395e-e3b5-421f-8616-70a10f9451af_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=einfochips.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR04MB8931:EE_|CH5PR04MB9549:EE_
x-ms-office365-filtering-correlation-id: 4a97ba34-06c3-42f4-d644-08dd78d028c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?XUasaOJ9rjNtGX7QteXRHkOF/jCZMkfDqiC7420RczTakLzSNUwUb8WMu8cd?=
 =?us-ascii?Q?sfCuhfvCsJUxV5S/Cwm414i4YSdSUUYR8Be0whBYodoW1g8x8LqaDfDSuhK0?=
 =?us-ascii?Q?JbImhI4+YKGvjo00T460mFABbK8ZVnqd/4DUGxEHf6DZNLzZnhO+VfBgTAke?=
 =?us-ascii?Q?mV4713cd57QuJCxgBcHZUBCzlzA5k715P4S1Msu6f/I5Zs1f0wPfAsEC4J2A?=
 =?us-ascii?Q?7zXaMM62vmkp2eFlXwSb4Exx+12wLVdQjbIe8G9wWS+/Kcy6XEKCgbiCq8AG?=
 =?us-ascii?Q?ggWr1DPyP/MTy0HGGWEyEVF6Khi8Ycd66f8Zud4QDfyqGT1OLtAp6HvP6DQ2?=
 =?us-ascii?Q?bZOy0GxuCa5VUvGxWbQRLlr2sS7VFaByIctZiKB23cyAmI6lUfpiQQV+J7qa?=
 =?us-ascii?Q?BRMACYI10XuBTQ/tt358LetXJ1+gnTS67MI1egHCUR0IePwSpjVmszHQ14Rg?=
 =?us-ascii?Q?VVfeOUscLkBnhlzk5ZeDZq7th/WZ06dJwyVpT0bIjtiX7UVsbDHZfwYJC/8a?=
 =?us-ascii?Q?7HVpmQKzvdTNNDFmRsjcvhVhOos0amxNsqUj1ztTfM27FPbmKrWEsZg8v6iF?=
 =?us-ascii?Q?hhQDCkUHRMDf+s0iHB7j5ueoPRU/Bic6fb3j8IZtvLGemGnBoOv3gjm36u+Z?=
 =?us-ascii?Q?gdRt3JmJ8y4pBBBCF5uP5tuaNdCq5OWVFsWktO9KBfbgEbkzu14E9+yO3ovI?=
 =?us-ascii?Q?P2nKbXF9qKnGJrqozi188Xb252TQ871eCu0yXnWfLliX6eQG6JsrFbpcHJIh?=
 =?us-ascii?Q?ColccoCTJ6ZXtYTB8TossMlfbVLS8dAqXgCGvqI1UXoOXamQYMdb7XKhvQE6?=
 =?us-ascii?Q?zOnU0nVuCIGxbWp3Um+oIqBVDwckBmMlLO9GphCZaRYFirNw7BbEtptThBy9?=
 =?us-ascii?Q?w9JZ4g1nwds64RQA7GbVTIL2mXuytvKYhaeQeVF4NUhxRU6v1i9nymas5o++?=
 =?us-ascii?Q?EjPGoaNUKfjG23B+luwzv9mhMGWSChia/oH8V87O+PeiNLnmBXvCnJm6ot2t?=
 =?us-ascii?Q?Tgq3ahXzn7qfRLKPs8DNYIuFy8s7k2YoXQR+RwU7ineFkybL/c95rR5tAFfN?=
 =?us-ascii?Q?EB8ywQWvYxZZ634YzPtLpBwFMYytfU5C9xdPQuSNCSz1qB5oWi3FB/WPu3Cu?=
 =?us-ascii?Q?+Lg9L8Z5z72x6DJ7Mc8so1v0431qVDNJ5/926BGaMTad9Tg79I2GqsI6aCC7?=
 =?us-ascii?Q?V8GKvYmhlQTnebBunVKY+8UcMASiymroNXfLshvz2Uehle4jEar/4+3IMeum?=
 =?us-ascii?Q?7ZAkw2yn6GvT4WjSY5KGSIg343jUyR/YgMJ9vyVZJI4ehP6VcXd1dq2Z+le1?=
 =?us-ascii?Q?Ct+xynNdMqMWdm7aRK3g9aj5MDU8bnmBMai6C/yDfoRQhZEWve9iW02er4+3?=
 =?us-ascii?Q?0QyrQ5Ul7tQNBh0Q9G8rGao9OjjdDUNU5QnNfoTyezAfosIEBNts+F+ThUNz?=
 =?us-ascii?Q?wRneX/VPeKAqsyUp8/JxBybHrwo4WXu4z66OjD+qM+CqRFs/hDosMg=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA3PR04MB8931.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?oXxtKbIriXW6uLqFVSAid2CxJVNmifGd2qiG5N54x4hbDBvZqu8Fsp3IH5f9?=
 =?us-ascii?Q?mCxaZAbL38V+7gVC2yErnWYtMsOP9STGBsSyGiFMxlN4e1Pat4kvvBw5N1rU?=
 =?us-ascii?Q?o2m2Lie3wpm0pdofPfR0I2yk+tAuXrvZ/5/+FbYnkgwpnjNletORkwiXCUQk?=
 =?us-ascii?Q?+aNKv8jZ0ufy+zQIAyeF/XVKakILW+lm69lXAdSQRyqAGe9aXQ2v9zBYwKaP?=
 =?us-ascii?Q?LoeqmHck2xFPzh5xXOsi5WbU2sVix0bB8/c2qCCW97agsV3Qp1U9t3PbZDVu?=
 =?us-ascii?Q?HYlzAvVcn8I1MetxRMDCJn5+fSBzbf16Hq1tWc5ktU+p1lLVWjSbaPqom1GA?=
 =?us-ascii?Q?FfuJvrO2Si4r793qUjO+JyO4XzzCrL2/9JWh7roShi8mj3dl1yHBN84nMhgx?=
 =?us-ascii?Q?f3PYl+ptOkkBKWs/C7eACrkh7kOOs+c+CGGamXCD2weK97uYDLoQ6JrINsaz?=
 =?us-ascii?Q?/8kid4rGCHkDAkBFRMkjDehwsqW4TZaMI1cOEM2bHhd3A+ebxzdzkWi/g49C?=
 =?us-ascii?Q?XtYUyoGIqB+8ZZpGBW4wu7y3I9vsl0byodm0MyxgJm29sKQx6ukaX/aAFqTl?=
 =?us-ascii?Q?Si1sXHFPELPf9hXZfMH8/YhHWKOY2PjrjYkBUK+fkYYN4CTuh9cfo4rOayt2?=
 =?us-ascii?Q?FLzwbxWYalCeIB0C8/sHZtQq/wnkAJ9tBB7o/LZai2z61WMVEo1jJyqCu7Ko?=
 =?us-ascii?Q?FsYTb9r1Vt80WMg/Q0uRX+3FwGc/xryyP4npgw6w8mkhp2vQYQRCUh4Zblxl?=
 =?us-ascii?Q?0yclrYrv+3GLE9U5ywhfRSG78PZ7WJWiVWXQTuHCmCNWi1A5HDmGVmUY9XeJ?=
 =?us-ascii?Q?tdJxfPgtpMJa+QmGTmJszHaz82cJmnOj05Peudc0DtIuHHr2Zuk13KqSHa6Y?=
 =?us-ascii?Q?ER5085E5UWvYn79ko0hG0RIpqInkFj6s+nV6+1BgtemHmKcl0hQVJVFdmzW+?=
 =?us-ascii?Q?TdhTzH4ecVHxXoFUaRdpq+ep3Su4Af6k/tJbaNuM3nssUj767J1/UUHOJbEF?=
 =?us-ascii?Q?vRGXOHx4A6CCZKfIX5jwyhN1G1biDxHyMwb8vPP7xBx+unDEsJ36r+1NtiRs?=
 =?us-ascii?Q?MKWlZsPt5Bkt/f6LGTQpl7qfPvx2gY+6fGh5ZDsu9aFYC3Cld4w6qpfUsxyV?=
 =?us-ascii?Q?NB/0zVnvmzcJfrkvy9ctk9hTzTUPAnLXxFfsBNz6EK4fzsH3YM4ODlsfR7Mm?=
 =?us-ascii?Q?nRKb4at2bdyCW8dDpCkSy5kiXpdX3DyCaIj1ee5x5TtNcGGbvF2X/4FV2kRC?=
 =?us-ascii?Q?oxs4CTlSY6wBTnGTYOvrFAxOdDdPvsMipQxqogm3DXy1ai1ifPR3PtAP1LBa?=
 =?us-ascii?Q?dKgfH3EGLQ+ojG0Dlr/hkUW3vryp29u+cy/n3wYlOLQFngO7rcbdqZh6Zyv9?=
 =?us-ascii?Q?Q4pbd+YJKu0bhaPyTmWYOnxQwOQ1WHYLXko9agAHSVu4CWbJDSTjZ5yyAOeW?=
 =?us-ascii?Q?Ht9DGmfgFtX3127gAXWgJaD5ngnUtm7zFjyexDErKzv15QVGajhdWOaY0wjX?=
 =?us-ascii?Q?D9p2k9LKtE4/CQ+yvWXjNTIaOFoBJ3FUcqqH21hiPoTXUhoA1y5RgChXMoL5?=
 =?us-ascii?Q?9+8atso97ZiQH87xLhLX3ZUzVC+3GUj3GSXxDiPQD0eTCrmICOFt+2TN8wzp?=
 =?us-ascii?Q?gw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a97ba34-06c3-42f4-d644-08dd78d028c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2025 08:09:18.8852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0beb0c35-9cbb-4feb-99e5-589e415c7944
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uoIYa0quM+AUZxE7E1MBYRYW+05FZxH5QJbXUphJ9AFL8NRkXoBhsnEbGdfEq55nODOdJSfqU0O1GANKEjxxeQ7ZpzDFxbgHEQamSxiKfRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR04MB9549


Hi Rob,

On Thu, Apr 10, 2025 at 11:03 PM, Rob Herring wrote:
> On Thu, 10 Apr 2025 20:55:12 +0530, Pinkesh Vaghela wrote:
> > From: Pritesh Patel <pritesh.patel@einfochips.com>
> >
> > Add new vendor string to dt bindings.
> > This new vendor string is used by
> > - ESWIN EIC770X SoC
> > - HiFive Premier P550 board which uses EIC7700 SoC.
> >
> > Link:
> >
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.
> >
> eswin.com%2Fen%2F&data=3D05%7C02%7Cpinkesh.vaghela%40einfochips.com
> %7C87
> >
> cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4feb99e5589e415c794
> 4%7C1%
> >
> 7C0%7C638799032006858529%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRyd
> >
> WUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3
> D%3
> >
> D%7C0%7C%7C%7C&sdata=3DlkMx%2BsV%2BmsaAdojVnWDZAvQnY1rR%2ByS
> 4VB%2FK7JxCS
> > Iw%3D&reserved=3D0
> > Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> > Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> > Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-
> ci/linux/Documentation/devicetree/bindings/interrupt-
> controller/econet,en751221-intc.example.dtb: interrupt-controller@1fb4000=
0
> (econet,en751221-intc): 'econet,shadow-interrupts' does not match any of
> the regexes: '^#.*', '^(at25|bm|devbus|dmacap|dsa|exynos|fsi[ab]|gpio-
> fan|gpio-key|gpio|gpmc|hdmi|i2c-gpio),.*',
> '^(keypad|m25p|max8952|max8997|max8998|mpmc),.*', '^(pciclass|pinctrl-
> single|#pinctrl-single|PowerPC),.*', '^(pl022|pxa-mmc|rcar_sound|rotary-
> encoder|s5m8767|sdhci),.*', '^(simple-audio-card|st-plgpio|st-spics|ts),.=
*',
> '^100ask,.*', '^70mai,.*', '^8dev,.*', '^GEFanuc,.*', '^IBM,.*', '^ORCL,.=
*',
> '^SUNW,.*', '^[a-zA-Z0-9#_][a-zA-Z0-9+\\-._@]{0,63}$', '^[a-zA-Z0-9+\\-
> ._]*@[0-9a-zA-Z,]*$', '^abb,.*', '^abilis,.*', '^abracon,.*', '^abt,.*', =
'^acbel,.*',
> '^acelink,.*', '^acer,.*', '^acme,.*', '^actions,.*', '^active-semi,.*', =
'^ad,.*',
> '^adafruit,.*', '^adapteva,.*', '^adaptrum,.*', '^adh,.*', '^adi,.*', '^a=
dieng,.*',
> '^admatec,.*', '^advantech,.*', '^a  eroflexgaisler,.*', '^aesop,.*', '^a=
iroha,.*',
> '^al,.*', '^alcatel,.*', '^aldec,.*', '^alfa-network,.*', '^allegro,.*',
> '^allegromicro,.*', '^alliedvision,.*', '^allo,.*', '^allwinner,.*', '^al=
phascale,.*',
> '^alps,.*', '^alt,.*', '^altr,.*', '^amarula,.*', '^amazon,.*', '^amcc,.*=
', '^amd,.*',
> '^amediatech,.*', '^amlogic,.*', '^ampere,.*', '^amphenol,.*', '^ampire,.=
*',
> '^ams,.*', '^amstaos,.*', '^analogix,.*', '^anbernic,.*', '^andestech,.*'=
,
> '^anvo,.*', '^aosong,.*', '^apm,.*', '^apple,.*', '^aptina,.*', '^arasan,=
.*',
> '^archermind,.*', '^arcom,.*', '^arctic,.*', '^arcx,.*', '^ariaboard,.*',=
 '^aries,.*',
> '^arm,.*', '^armadeus,.*', '^armsom,.*', '^arrow,.*', '^artesyn,.*', '^as=
ahi-
> kasei,.*', '^asc,.*', '^asix,.*', '^aspeed,.*', '^asrock,.*', '^asteralab=
s,.*',
> '^asus,.*', '^atheros,.*', '^atlas,.*', '^atmel,.*', '^auo,.*', '^auvidea=
,.*',
> '^avago,.*', '^avia,.*', '^avic,.*', '^avnet,.*', '^awinic,.*', '^axentia=
,.*', '^axis,.*',
> '^azoteq,.*', '^azw,.*', '^baikal,.*', '^bananapi,.*', '^be  acon,.*', '^=
beagle,.*',
> '^belling,.*', '^bhf,.*', '^bigtreetech,.*', '^bitmain,.*', '^blaize,.*',=
 '^blutek,.*',
> '^boe,.*', '^bosch,.*', '^boundary,.*', '^brcm,.*', '^broadmobi,.*', '^bs=
h,.*',
> '^bticino,.*', '^buffalo,.*', '^bur,.*', '^bytedance,.*', '^calamp,.*', '=
^calao,.*',
> '^calaosystems,.*', '^calxeda,.*', '^cameo,.*', '^canaan,.*', '^caninos,.=
*',
> '^capella,.*', '^cascoda,.*', '^catalyst,.*', '^cavium,.*', '^cct,.*', '^=
cdns,.*',
> '^cdtech,.*', '^cellwise,.*', '^ceva,.*', '^chargebyte,.*', '^checkpoint,=
.*',
> '^chefree,.*', '^chipidea,.*', '^chipone,.*', '^chipspark,.*', '^chongzho=
u,.*',
> '^chrontel,.*', '^chrp,.*', '^chunghwa,.*', '^chuwi,.*', '^ciaa,.*', '^ci=
rrus,.*',
> '^cisco,.*', '^clockwork,.*', '^cloos,.*', '^cloudengines,.*', '^cnm,.*',=
 '^cnxt,.*',
> '^colorfly,.*', '^compulab,.*', '^comvetia,.*', '^congatec,.*', '^coolpi,=
.*',
> '^coreriver,.*', '^corpro,.*', '^cortina,.*', '^cosmic,.*', '^crane,.*', =
'^creative,.*',
> '^crystalfontz,.*', '^csky,.*', '^csot,.*', '^csq,.*', '^ctera,.*'
>  , '^ctu,.*', '^cubietech,.*', '^cudy,.*', '^cui,.*', '^cypress,.*', '^cy=
x,.*', '^cznic,.*',
> '^dallas,.*', '^dataimage,.*', '^davicom,.*', '^deepcomputing,.*', '^dell=
,.*',
> '^delta,.*', '^densitron,.*', '^denx,.*', '^devantech,.*', '^dfi,.*', '^d=
frobot,.*',
> '^dh,.*', '^difrnce,.*', '^digi,.*', '^digilent,.*', '^dimonoff,.*', '^di=
odes,.*',
> '^dioo,.*', '^dlc,.*', '^dlg,.*', '^dlink,.*', '^dmo,.*', '^domintech,.*'=
,
> '^dongwoon,.*', '^dptechnics,.*', '^dragino,.*', '^dream,.*', '^ds,.*',
> '^dserve,.*', '^dynaimage,.*', '^ea,.*', '^ebang,.*', '^ebbg,.*', '^ebs-s=
ystart,.*',
> '^ebv,.*', '^eckelmann,.*', '^edgeble,.*', '^edimax,.*', '^edt,.*', '^ees=
,.*',
> '^eeti,.*', '^einfochips,.*', '^eink,.*', '^elan,.*', '^element14,.*', '^=
elgin,.*',
> '^elida,.*', '^elimo,.*', '^elpida,.*', '^embedfire,.*', '^embest,.*', '^=
emcraft,.*',
> '^emlid,.*', '^emmicro,.*', '^empire-electronix,.*', '^emtrion,.*', '^enc=
lustra,.*',
> '^endless,.*', '^ene,.*', '^energymicro,.*', '^engicam,.*', '^engleder,.*=
',
> '^epcos,.*', '^e  pfl,.*', '^epson,.*', '^esp,.*', '^est,.*', '^eswin,.*'=
, '^ettus,.*',
> '^eukrea,.*', '^everest,.*', '^everspin,.*', '^evervision,.*', '^exar,.*'=
, '^excito,.*',
> '^exegin,.*', '^ezchip,.*', '^facebook,.*', '^fairchild,.*', '^fairphone,=
.*',
> '^faraday,.*', '^fascontek,.*', '^fastrax,.*', '^fcs,.*', '^feixin,.*', '=
^feiyang,.*',
> '^fii,.*', '^firefly,.*', '^focaltech,.*', '^forlinx,.*', '^freebox,.*', =
'^freecom,.*',
> '^frida,.*', '^friendlyarm,.*', '^fsl,.*', '^fujitsu,.*', '^fxtec,.*', '^=
galaxycore,.*',
> '^gameforce,.*', '^gardena,.*', '^gateway,.*', '^gateworks,.*', '^gcw,.*'=
, '^ge,.*',
> '^geekbuying,.*', '^gef,.*', '^gehc,.*', '^gemei,.*', '^gemtek,.*', '^gen=
esys,.*',
> '^genexis,.*', '^geniatech,.*', '^giantec,.*', '^giantplus,.*', '^glinet,=
.*',
> '^globalscale,.*', '^globaltop,.*', '^gmt,.*', '^gocontroll,.*', '^goldel=
ico,.*',
> '^goodix,.*', '^google,.*', '^goramo,.*', '^gplus,.*', '^grinn,.*', '^grm=
n,.*',
> '^gumstix,.*', '^gw,.*', '^hannstar,.*', '^haochuangyi,.*', '^haoyu,.*',
> '^hardkernel,.*  ', '^hechuang,.*', '^hideep,.*', '^himax,.*', '^hirschma=
nn,.*',
> '^hisi,.*', '^hisilicon,.*', '^hit,.*', '^hitex,.*', '^holt,.*', '^holtek=
,.*',
> '^honestar,.*', '^honeywell,.*', '^hoperf,.*', '^hoperun,.*', '^hp,.*', '=
^hpe,.*',
> '^hsg,.*', '^htc,.*', '^huawei,.*', '^hugsun,.*', '^hwacom,.*', '^hxt,.*'=
,
> '^hycon,.*', '^hydis,.*', '^hynitron,.*', '^hynix,.*', '^hyundai,.*', '^i=
2se,.*',
> '^ibm,.*', '^icplus,.*', '^idt,.*', '^iei,.*', '^ifi,.*', '^ilitek,.*', '=
^imagis,.*', '^img,.*',
> '^imi,.*', '^inanbo,.*', '^incircuit,.*', '^indiedroid,.*', '^inet-tek,.*=
',
> '^infineon,.*', '^inforce,.*', '^ingenic,.*', '^ingrasys,.*', '^injoinic,=
.*',
> '^innocomm,.*', '^innolux,.*', '^inside-secure,.*', '^insignal,.*', '^ins=
pur,.*',
> '^intel,.*', '^intercontrol,.*', '^invensense,.*', '^inventec,.*', '^inve=
rsepath,.*',
> '^iom,.*', '^irondevice,.*', '^isee,.*', '^isil,.*', '^issi,.*', '^ite,.*=
', '^itead,.*',
> '^itian,.*', '^ivo,.*', '^iwave,.*', '^jadard,.*', '^jasonic,.*', '^jdi,.=
*', '^jedec,.*',
> '^jenson,.*', '^  jesurun,.*', '^jethome,.*', '^jianda,.*', '^jide,.*', '=
^joz,.*',
> '^kam,.*', '^karo,.*', '^keithkoep,.*', '^keymile,.*', '^khadas,.*',
> '^kiebackpeter,.*', '^kinetic,.*', '^kingdisplay,.*', '^kingnovel,.*', '^=
kionix,.*',
> '^kobo,.*', '^kobol,.*', '^koe,.*', '^kontron,.*', '^kosagi,.*', '^kvg,.*=
', '^kyo,.*',
> '^lacie,.*', '^laird,.*', '^lamobo,.*', '^lantiq,.*', '^lattice,.*', '^lc=
kfb,.*',
> '^lctech,.*', '^leadtek,.*', '^leez,.*', '^lego,.*', '^lemaker,.*', '^len=
ovo,.*',
> '^lg,.*', '^lgphilips,.*', '^libretech,.*', '^licheepi,.*', '^linaro,.*',=
 '^lincolntech,.*',
> '^lineartechnology,.*', '^linksprite,.*', '^linksys,.*', '^linutronix,.*'=
, '^linux,.*',
> '^linx,.*', '^liteon,.*', '^litex,.*', '^lltc,.*', '^logicpd,.*', '^logic=
techno,.*',
> '^longcheer,.*', '^lontium,.*', '^loongmasses,.*', '^loongson,.*', '^lsi,=
.*',
> '^lunzn,.*', '^luxul,.*', '^lwn,.*', '^lxa,.*', '^m5stack,.*', '^macnica,=
.*',
> '^mantix,.*', '^mapleboard,.*', '^marantec,.*', '^marvell,.*', '^maxbotix=
,.*',
> '^maxim,.*', '^maxlinear,.
>  *', '^mbvl,.*', '^mcube,.*', '^meas,.*', '^mecer,.*', '^mediatek,.*',
> '^megachips,.*', '^mele,.*', '^melexis,.*', '^melfas,.*', '^mellanox,.*',
> '^memsensing,.*', '^memsic,.*', '^menlo,.*', '^mentor,.*', '^meraki,.*',
> '^merrii,.*', '^methode,.*', '^micrel,.*', '^microchip,.*', '^microcrysta=
l,.*',
> '^micron,.*', '^microsoft,.*', '^microsys,.*', '^microtips,.*', '^mikroe,=
.*',
> '^mikrotik,.*', '^milkv,.*', '^miniand,.*', '^minix,.*', '^mips,.*', '^mi=
ramems,.*',
> '^mitsubishi,.*', '^mitsumi,.*', '^mixel,.*', '^miyoo,.*', '^mntre,.*',
> '^mobileye,.*', '^modtronix,.*', '^moortec,.*', '^mosaixtech,.*',
> '^motorcomm,.*', '^motorola,.*', '^moxa,.*', '^mpl,.*', '^mps,.*',
> '^mqmaker,.*', '^mrvl,.*', '^mscc,.*', '^msi,.*', '^mstar,.*', '^mti,.*',=
 '^multi-
> inno,.*', '^mundoreader,.*', '^murata,.*', '^mxic,.*', '^mxicy,.*', '^myi=
r,.*',
> '^national,.*', '^neardi,.*', '^nec,.*', '^neofidelity,.*', '^neonode,.*'=
,
> '^netcube,.*', '^netgear,.*', '^netlogic,.*', '^netron-dy,.*', '^netronix=
,.*',
> '^netxeon,.*', '
>  ^neweast,.*', '^newhaven,.*', '^newvision,.*', '^nexbox,.*', '^nextthing=
,.*',
> '^ni,.*', '^nintendo,.*', '^nlt,.*', '^nokia,.*', '^nordic,.*', '^nothing=
,.*',
> '^novatek,.*', '^novtech,.*', '^numonyx,.*', '^nutsboard,.*', '^nuvoton,.=
*',
> '^nvd,.*', '^nvidia,.*', '^nxp,.*', '^oceanic,.*', '^ocs,.*', '^oct,.*', =
'^okaya,.*',
> '^oki,.*', '^olimex,.*', '^olpc,.*', '^oneplus,.*', '^onie,.*', '^onion,.=
*',
> '^onnn,.*', '^ontat,.*', '^opalkelly,.*', '^openailab,.*', '^opencores,.*=
',
> '^openembed,.*', '^openpandora,.*', '^openrisc,.*', '^openwrt,.*',
> '^option,.*', '^oranth,.*', '^orisetech,.*', '^ortustech,.*', '^osddispla=
ys,.*',
> '^osmc,.*', '^ouya,.*', '^overkiz,.*', '^ovti,.*', '^oxsemi,.*', '^ozzmak=
er,.*',
> '^panasonic,.*', '^parade,.*', '^parallax,.*', '^pda,.*', '^pericom,.*',
> '^pervasive,.*', '^phicomm,.*', '^phytec,.*', '^picochip,.*', '^pine64,.*=
',
> '^pineriver,.*', '^pixcir,.*', '^plantower,.*', '^plathome,.*', '^plda,.*=
', '^plx,.*',
> '^ply,.*', '^pni,.*', '^pocketbook,.*', '^polaroid,.*', '^p  olyhex,.*',
> '^portwell,.*', '^poslab,.*', '^pov,.*', '^powertip,.*', '^powervr,.*',
> '^powkiddy,.*', '^pri,.*', '^primeview,.*', '^primux,.*', '^probox2,.*', =
'^prt,.*',
> '^pulsedlight,.*', '^purism,.*', '^puya,.*', '^qca,.*', '^qcom,.*', '^qem=
u,.*',
> '^qi,.*', '^qiaodian,.*', '^qihua,.*', '^qishenglong,.*', '^qnap,.*', '^q=
uanta,.*',
> '^radxa,.*', '^raidsonic,.*', '^ralink,.*', '^ramtron,.*', '^raspberrypi,=
.*',
> '^raydium,.*', '^rda,.*', '^realtek,.*', '^relfor,.*', '^remarkable,.*', =
'^renesas,.*',
> '^rervision,.*', '^revotics,.*', '^rex,.*', '^richtek,.*', '^ricoh,.*', '=
^rikomagic,.*',
> '^riot,.*', '^riscv,.*', '^rockchip,.*', '^rocktech,.*', '^rohm,.*', '^ro=
nbo,.*',
> '^roofull,.*', '^roseapplepi,.*', '^rve,.*', '^saef,.*', '^samsung,.*', '=
^samtec,.*',
> '^sancloud,.*', '^sandisk,.*', '^satoz,.*', '^sbs,.*', '^schindler,.*',
> '^schneider,.*', '^sciosense,.*', '^seagate,.*', '^seeed,.*', '^seiroboti=
cs,.*',
> '^semtech,.*', '^senseair,.*', '^sensirion,.*', '^sensortek,.*', '^sercom=
m,.*',
> '^sff,.*'
>  , '^sgd,.*', '^sgmicro,.*', '^sgx,.*', '^sharp,.*', '^shift,.*', '^shima=
fuji,.*',
> '^shineworld,.*', '^shiratech,.*', '^si-en,.*', '^si-linux,.*', '^siemens=
,.*',
> '^sifive,.*', '^siflower,.*', '^sigma,.*', '^sii,.*', '^sil,.*', '^silabs=
,.*', '^silan,.*',
> '^silead,.*', '^silergy,.*', '^silex-insight,.*', '^siliconfile,.*', '^si=
liconmitus,.*',
> '^silvaco,.*', '^simtek,.*', '^sinlinx,.*', '^sinovoip,.*', '^sinowealth,=
.*',
> '^sipeed,.*', '^sirf,.*', '^sis,.*', '^sitronix,.*', '^skov,.*', '^skywor=
ks,.*',
> '^smartlabs,.*', '^smartrg,.*', '^smi,.*', '^smsc,.*', '^snps,.*', '^soch=
ip,.*',
> '^socionext,.*', '^solidrun,.*', '^solomon,.*', '^sony,.*', '^sophgo,.*',
> '^sourceparts,.*', '^spacemit,.*', '^spansion,.*', '^sparkfun,.*', '^spin=
alhdl,.*',
> '^sprd,.*', '^square,.*', '^ssi,.*', '^sst,.*', '^sstar,.*', '^st,.*', '^=
st-ericsson,.*',
> '^starfive,.*', '^starry,.*', '^startek,.*', '^starterkit,.*', '^ste,.*',=
 '^stericsson,.*',
> '^storlink,.*', '^storm,.*', '^storopack,.*', '^summit,.*', '^sunchip,.*'=
,
> '^sundance,.*', '^sunplus,.*', '^supermicro,.*', '^swir,.*', '^syna,.*',
> '^synology,.*', '^synopsys,.*', '^tbs,.*', '^tbs-biometrics,.*', '^tcg,.*=
', '^tcl,.*',
> '^tcs,.*', '^tdo,.*', '^team-source-display,.*', '^technexion,.*', '^tech=
nologic,.*',
> '^techstar,.*', '^techwell,.*', '^teejet,.*', '^teltonika,.*', '^tempo,.*=
',
> '^terasic,.*', '^tesla,.*', '^test,.*', '^tfc,.*', '^thead,.*', '^thine,.=
*', '^thingyjp,.*',
> '^thundercomm,.*', '^thwc,.*', '^ti,.*', '^tianma,.*', '^tlm,.*', '^tmt,.=
*',
> '^topeet,.*', '^topic,.*', '^topland,.*', '^toppoly,.*', '^topwise,.*', '=
^toradex,.*',
> '^toshiba,.*', '^toumaz,.*', '^tpk,.*', '^tplink,.*', '^tpo,.*', '^tq,.*'=
,
> '^transpeed,.*', '^traverse,.*', '^tronfy,.*', '^tronsmart,.*', '^truly,.=
*', '^tsd,.*',
> '^turing,.*', '^tyan,.*', '^tyhx,.*', '^u-blox,.*', '^u-boot,.*', '^ubnt,=
.*',
> '^ucrobotics,.*', '^udoo,.*', '^ufispace,.*', '^ugoos,.*', '^uni-t,.*', '=
^uniwest,.*',
> '^upisemi,.*', '^urt,.*', '^usi,.*', '^usr,.*', '^utoo,.*', '^v3,.*', '^v=
aisala,.*', '^vam
> rs,.*', '^variscite,.*', '^vdl,.*', '^vertexcom,.*', '^via,.*', '^vialab,=
.*', '^vicor,.*',
> '^videostrong,.*', '^virtio,.*', '^virtual,.*', '^vishay,.*', '^visionox,=
.*',
> '^vitesse,.*', '^vivante,.*', '^vivax,.*', '^vocore,.*', '^voipac,.*', '^=
voltafield,.*',
> '^vot,.*', '^vscom,.*', '^vxt,.*', '^wacom,.*', '^wanchanglong,.*', '^wan=
d,.*',
> '^waveshare,.*', '^wd,.*', '^we,.*', '^welltech,.*', '^wetek,.*', '^wexle=
r,.*',
> '^whwave,.*', '^wi2wi,.*', '^widora,.*', '^wiligear,.*', '^willsemi,.*',
> '^winbond,.*', '^wingtech,.*', '^winlink,.*', '^winstar,.*', '^wirelessta=
g,.*',
> '^wits,.*', '^wlf,.*', '^wm,.*', '^wobo,.*', '^wolfvision,.*', '^x-powers=
,.*',
> '^xen,.*', '^xes,.*', '^xiaomi,.*', '^xillybus,.*', '^xingbangda,.*', '^x=
inpeng,.*',
> '^xiphera,.*', '^xlnx,.*', '^xnano,.*', '^xunlong,.*', '^xylon,.*', '^yad=
ro,.*',
> '^yamaha,.*', '^yes-optoelectronics,.*', '^yic,.*', '^yiming,.*', '^ylm,.=
*',
> '^yna,.*', '^yones-toptech,.*', '^ys,.*', '^ysoft,.*', '^yuridenki,.*',
> '^yuzukihd,.*', '^zarlink,.*', '
>  ^zealz,.*', '^zeitec,.*', '^zidoo,.*', '^zii,.*', '^zinitix,.*', '^zkmag=
ic,.*', '^zte,.*',
> '^zyxel,.*', 'pinctrl-[0-9]+'
>         from schema $id:
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
t
> ree.org%2Fschemas%2Fvendor-
> prefixes.yaml%23&data=3D05%7C02%7Cpinkesh.vaghela%40einfochips.com%7C
> 87cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4feb99e5589e415c7
> 944%7C1%7C0%7C638799032006878189%7CUnknown%7CTWFpbGZsb3d8ey
> JFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiT
> WFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DpzMClfDGuAFiIexgRZJo
> 7JZpMuGIUzeHj2hXghDFiHA%3D&reserved=3D0
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch
> work.ozlabs.org%2Fproject%2Fdevicetree-
> bindings%2Fpatch%2F20250410152519.1358964-4-
> pinkesh.vaghela%40einfochips.com&data=3D05%7C02%7Cpinkesh.vaghela%40e
> infochips.com%7C87cd3ca4575c4f4e664908dd7855c0a2%7C0beb0c359cbb4f
> eb99e5589e415c7944%7C1%7C0%7C638799032006888279%7CUnknown%7C
> TWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJX
> aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DmC
> 1yzKGp4zGCCVmpokRiTcl3mEsm1mYLuylQM3t2Tng%3D&reserved=3D0
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
> your schema. However, it must be unset to test all examples with your
> schema.

Thanks for your time.
This warnings/errors is because of "econet" is not introduced as vendor in=
=20
vendor-prefixes.yaml. We also observe the same warnings/errors on latest rc=
1
without our patches.

Regards,
Pinkesh

