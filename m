Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9E525F797;
	Tue, 10 Jun 2025 09:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549310; cv=fail; b=CAz8vY2CvMMdRF5Tfefuv1z07ekC5D+O1j9SmemSzVVbVakUTeMM3m5PMoYIFLT2GPiW0paxHsZ8eNM5yQFtZCvM6JZJPGR3TIsoqW7PWuTEqHNvZwdNdrnzH7aC7aqvuPCH73zghiV30RdmldIhcvPd8KxsH5N0MHDCxWLIlQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549310; c=relaxed/simple;
	bh=Y2nUnCN80ePWKwsl8A0QjKmmm3bsDu4ihUj4+tjSlyo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YRT0rxE8wrPnXF1kq5BcfgVhRApHWi8r8U6W1BFSXq4dCAaLk304dMmkSSleEIlEgnvaQZ31c1/shgvw8pdAQN+7NMqybVZcLzcKJyEkqZxgwlou+ptOmW3vfgTM/K1kMZEtWZCzoik+xOWpPRFnlVwQ7MqpwsLzsOJICv/1two=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com; spf=pass smtp.mailfrom=mobileye.com; dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b=LOC2D2hc; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mobileye.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mobileye.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mobileye.com header.i=@mobileye.com header.b="LOC2D2hc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vz5t0FWbgRffyx6ueej/DZ+d/iZR6p9PyALUheZXMDgzrwJnOHULov28/pSwt/2gdmOrdrZPyycY7yqf51CLs7YqQMGihQ1xd3JBpkjBUTkK94bG740hvZ2TyV1OxJgpRtAITQDGC1g78CWW4G1+IxdCH5TjNUcXoPGIAez4aC+HhjuFBwL/8ExmRskG1pZRS3pvT/dmbKKZwPon1Hgy4CZd8oCzLkYyAe6q86Br7qWJq4l2sf6+JFdkc38INn4sQThd0N6KdZQgbndfDrgE1qtS30bBHDGvddcx8WhdsfzMLmzMN+tsRCj1V7y03fIhAw86+en+sePq6PFC/0pZbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2nUnCN80ePWKwsl8A0QjKmmm3bsDu4ihUj4+tjSlyo=;
 b=XmkPAcolaazhlfsyZb49TFtk3ub5UDKAXi8WhM20wdKRlERWIPPb5M9zt/2wSpzKRq7idPTg20eLwm2Q93+aJJL4JlJrnc0UVlkOpEZXZsZgqNDA9QMKJ8tv/UGveufuoue3B6wbkEN42Sq9ZM7hySE3t2IB63ZCUmqxDHbcDci4XGjxviDvXzB1HpZqdMARWC9VFoOEOENkG7ENZ01PcPkB6SLSxtiwQ5Wx/o/QsXEDq67wXrLBfPq7qkz+wmiwDJSqPgNI/w/ox/mqbHxmcJ1DHiXGaRxYl+ha/KBPsuLfL5yOZcBKr4J5Bnc+k84R+lkk4tiCoGHSjqLyOZgv0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mobileye.com; dmarc=pass action=none header.from=mobileye.com;
 dkim=pass header.d=mobileye.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mobileye.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2nUnCN80ePWKwsl8A0QjKmmm3bsDu4ihUj4+tjSlyo=;
 b=LOC2D2hcEM5eOAZAWhPmiB8N361Li/jUpbgwDJGBRuYclg/FPDjXAunSA3rwzUJZ+bDj2P9NzM6uhATHOAfuv5TTnJvii1K5lqE/JmDPENXIu91VlyMEzMDQtntFGdFHWYFuvIsRRg43OOqD+q4gKSXsdRLVny2SY9Cyl7oJWGE=
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com (2603:10a6:20b:578::5)
 by PAVPR09MB6253.eurprd09.prod.outlook.com (2603:10a6:102:329::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Tue, 10 Jun
 2025 09:55:01 +0000
Received: from AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d]) by AS2PR09MB6296.eurprd09.prod.outlook.com
 ([fe80::2f35:bc64:a118:5e0d%6]) with mapi id 15.20.8792.039; Tue, 10 Jun 2025
 09:55:01 +0000
From: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
To: Conor Dooley <conor@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, Chen Wang
	<unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, Sunil V L
	<sunilvl@ventanamicro.com>, "Rafael J . Wysocki"
	<rafael.j.wysocki@intel.com>, Ryo Takakura <takakura@valinux.co.jp>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"sophgo@lists.linux.dev" <sophgo@lists.linux.dev>
Subject: Re: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic
 Risc-v aclint-sswi
Thread-Topic: [PATCH v1 3/7] dt-bindings: interrupt-controller: add generic
 Risc-v aclint-sswi
Thread-Index: AQHb2UUgPBlpzaiNEESB4XRSVug1gbP6/NsAgAEaVD4=
Date: Tue, 10 Jun 2025 09:55:00 +0000
Message-ID:
 <AS2PR09MB6296534EB4110B806DE700A6946AA@AS2PR09MB6296.eurprd09.prod.outlook.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250609134749.1453835-4-vladimir.kondratiev@mobileye.com>
 <20250609-rejoice-disclose-b677f617f2de@spud>
In-Reply-To: <20250609-rejoice-disclose-b677f617f2de@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mobileye.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR09MB6296:EE_|PAVPR09MB6253:EE_
x-ms-office365-filtering-correlation-id: 6e31e384-1402-4471-7e3d-08dda804ddbe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iq15GXqDY/LwGgWiCUqpovL4iw45ih3AJWssRiFWUFJ3xOpIuCg+rQu7qu?=
 =?iso-8859-1?Q?qCzjpdHzSe60bef1SpqD3qjaaAPtGpuPu602207hw9Y/WD/W2Fe2b1+I24?=
 =?iso-8859-1?Q?AS3njGnLrT5ck2x7ix9zVN4xCiLjDTgW1oHCxR3I5VI7rfQehNfUPrgpNH?=
 =?iso-8859-1?Q?fEEC0/qRwXXeo/ClXIK0Y918okODvIkeuamXBMrZs2EsoqKyYeB27tLFMe?=
 =?iso-8859-1?Q?MAJWUgDQpX8RuKBKGdTp80WegdzYV5i8X4IlApMdRQ28Mdx1aqGaHmd6Fr?=
 =?iso-8859-1?Q?M4mERS5QztNpZ3ixj1bd67WCIniDQglM8sUBIvVkGkquJeSf170g44/uWb?=
 =?iso-8859-1?Q?/5KwoqvC83FUmskqXu+pKiuyDjlCeE9nv9qhbXAVkmODCJTChqVUZbZc/T?=
 =?iso-8859-1?Q?P1elEdJRP6JeCTO9StA5sTxRiIeADOQbiuFKUF7RRbTQr+hGXAw5h48YZb?=
 =?iso-8859-1?Q?jFUtHIGOMPH9VQuF8YDUvdFz7amHoLS4bAE3nPrUvOeijdZXVcs9T0yMKF?=
 =?iso-8859-1?Q?5Tn25+Q0cL7cyrksR06lBYrjWzW5bLzOjnz5PecGfOvyXQUuDeW6OCi1uk?=
 =?iso-8859-1?Q?Vx9aNc+DlCi0ZAs4B6YPIDnjp8ehQZq1vGpD2zHLqNBBvi67sBPr5+xqJh?=
 =?iso-8859-1?Q?42EmUevVCOAirvT+DCDRuZ4QbVX1z/mS42zoqthY9kReMsQbS0D99qX+Fy?=
 =?iso-8859-1?Q?LsxcOS1dTzv8OKq43Jx9xbVLxTWTs6f0Rk7EseDUVCE5b0emmVi9Zui+ie?=
 =?iso-8859-1?Q?el1Wks+FBD8a4ZBgNQQtDvBFPK0veOhZrGSttIZ7C7cN8Mwayp9XzcYOYM?=
 =?iso-8859-1?Q?xAhOqbtyIIJDic1UU2Qgw9ZaK0dGQmd1QZgOxB9hDDH9FNSdnWEWpwQCpD?=
 =?iso-8859-1?Q?+wNIluo9BKlPhdauWwisAhZKQ+g1dOmAN++vt3kpbAL2J6EIoGqDFLoVZD?=
 =?iso-8859-1?Q?HMNPA3ZDouUdq1Mc0xp6EhhrikvabESKk1eTWq2pHQk2yHPP761bp6dwVa?=
 =?iso-8859-1?Q?n5XwLUBm0RFHc11cjNRVDpE3BoihyYhGYzirbSISAVe9JgTYJ55WKH1bHr?=
 =?iso-8859-1?Q?AcnoCGxSn8w/12JxXhxN+bWMk+vht/2fxSFX04QPolZseYO6QgbUxdrR0P?=
 =?iso-8859-1?Q?uDwcSvCjHqwf+C79L0ksjLleDLP/ME2lUU4Ao0WRUIsCGYBfIUzxps5cyU?=
 =?iso-8859-1?Q?HLIylIqLNW7BlGxJgm8WJ4fD1qw+ubji20fA/ofht7U4Ml9wy10IGcAf8M?=
 =?iso-8859-1?Q?XC/Dcbwbzf0tV+c9V7hJ6JYlfoWfW5zTjSWhH+DeKzwrzcXYNoubb9jmKd?=
 =?iso-8859-1?Q?EbgHKyD+epA9t6lWGHttVbWnQTSJLN+FBtVk6nDUFtrwpEgJKVvtab5GI2?=
 =?iso-8859-1?Q?DkzSdFRZSxe7fKufmuUiqMaGy6oLvLnvKZIIs4pSun2UsFR8SR5zANBJ8N?=
 =?iso-8859-1?Q?26qX+CEz3Z6JeJsTukfNn20p/+6IKCFz08RkqNehYLi4OkuBIj+e1F1UEY?=
 =?iso-8859-1?Q?68ywJyNZ4nL1yep7jYUJxlNELxsCL4ijvCFLtn8AtY3ByJv00UE9p1ULh/?=
 =?iso-8859-1?Q?D4XB45k=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR09MB6296.eurprd09.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?v2jI0NCK9Cl35LYWeTdPkwIoSewl4WnVLYCiqMVCAzj9skwHYqRXGbBCTW?=
 =?iso-8859-1?Q?E+sQw4rofkAPQbLCwgWPQELTYPecpQ6xqBuLMj8l5r7O/+MBUTgBZuGWFo?=
 =?iso-8859-1?Q?JFxr7HGJxWAPfpxMiKsh6/kZtjYBYZNj+d5D6BUmJST+VC7XE5wqToqv/t?=
 =?iso-8859-1?Q?t03LzGJ5kp3jq5+VSirplCaSojemW/hLaetBkbxyotxp9dukr56p1LUHsq?=
 =?iso-8859-1?Q?L93bF4JHusuz3i+hXJ+c8kuHbuaQSrFtt+J5fQ9Q1ttclLfWtuEJHOrlD2?=
 =?iso-8859-1?Q?0JWsw8L+ddxnyj3mmvmLuualjdJpsA80AwIVg8ryTqtJ1nqOkkMxFGZQa3?=
 =?iso-8859-1?Q?L9PdpeDmNk13QeXUbgHTl5xN1If9XmMWQER4S06/fm6CUCR6+s2t8Sm1n/?=
 =?iso-8859-1?Q?sQUVMEvRQ8loM6nGPpJfFEHeIYy+CEE3hsGZ9D+VQCN6ojTjk/JqzI8ODF?=
 =?iso-8859-1?Q?J6/qexi/kvndh6jynqMvsOcPCU+g7/3oIo2ix4Ow6IF+LYA/5ZWpHTyg57?=
 =?iso-8859-1?Q?lRky4mSJKxfVLtdrBaYp+clwI+bb1vQWiaMRLq+5mpDYNDSj6eO2o3Ug8u?=
 =?iso-8859-1?Q?5gKrbnpMXsAopz/Rgdi5gJTGD/KprUppqfiXqPdFl6i5EXSVrakZHtTQUA?=
 =?iso-8859-1?Q?zvp5x7u/Op1vg/G5qxaiWu5tox/8Jg4zfY3L5BW/F9PUTS2QB+oF5LFAuL?=
 =?iso-8859-1?Q?noibWAGqlJq2FgNjqYF4UfR/RJUbvnY1CNYn8zA1T2UTKDD8/l7/1taNxC?=
 =?iso-8859-1?Q?pnsbLTRVsf2Nbr+f4VIOFkg7qMjv5/MvE8VOYxje9VjckLJodUbXFnuFnf?=
 =?iso-8859-1?Q?otCFijl46Nr2sz+rWQRFyxWJbzElhu4ez4hNbrWFVylwlVZjdOz3Ij1qzB?=
 =?iso-8859-1?Q?0amaFziTh3w5elT1Hr7BnzZnJr310WkOh5I5zdS3iQBR47OvPB450ivfHk?=
 =?iso-8859-1?Q?JQIAZXNM0iFdDNnpCgCFjrfOP/tyWhGh+SNjf8JoxUXj133b5RL8etB26U?=
 =?iso-8859-1?Q?kbZUf5uCZ7cz06oAUfEfphch0YFsxY5uwPlxQnNfdkagXytmxWM59Q8Rch?=
 =?iso-8859-1?Q?owewnLJBiGszcKLosva2s/slnJLYsqjaEkfPgzBqmyE7utW9hLFE3ywXJm?=
 =?iso-8859-1?Q?HE+srQ5X9PwE+BL5adRwz/BVPxkaqAhQY7JjTNqbwe28DKSK6O+jNCPv2G?=
 =?iso-8859-1?Q?LD9EMjkMrkE43VY2+MIOrs44WuFTCO3rxX/Ie6jUcQ5cpGOLbt+MDlyIAv?=
 =?iso-8859-1?Q?wKywig/Bbkzx2RTWoJ4oME7pPHdqhafVpqpq8DGrJcV2WDL+2fJA1ImAhb?=
 =?iso-8859-1?Q?IbG9rvg6yLh5/2CVhFO9UjU0t4/WaMPrcHnaxenh29dlFmywT4dsLHpZen?=
 =?iso-8859-1?Q?tQFWhuE85ci6bkhl99SQy+fKaV+lViEMCIMAPDlJ2gxeo3kKEFYiScqyRh?=
 =?iso-8859-1?Q?BORRwfWHf/g7oWjQz9bmS8NhmKyXUKNoX3ie/edQl5u17IN7iVGWLN8FyU?=
 =?iso-8859-1?Q?tgCsdm9qWnC9cgT+q7ZJV6lqz+bZmuRgbs0TbNtsVkYgLqEAQjdz9UIpTa?=
 =?iso-8859-1?Q?P71EAhHnMclXiFDoyWeHJiy6nbFprXrlhmlxuvfMvzftAj7EsdIl/hpp3V?=
 =?iso-8859-1?Q?5iSlBogQZt3Po7670BvVJCavcf2SQyPVNy?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e31e384-1402-4471-7e3d-08dda804ddbe
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2025 09:55:00.9832
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4f85ba13-6953-46a6-9c5b-7599fd80e9aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sc8lSYKSJnL9yI5DSahtCBOck7bBm5lboL4U0Rmiq4U5GZ5y4mUZPmabQiH2Que0zkOEAR63Cw0wl/p5vKf5Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR09MB6253

>> Link: https://github.com/riscvarchive/riscv-aclint=A0[1]=0A=
>What is the ratification status of this spec?=0A=
=0A=
This spec is in a "draft" state, and perspective for its ratification is un=
clear.=0A=
So I understand I can't use "riscv," prefixes, I will convert it to adding=
=0A=
platform-specific variant of the SSWI, and submit v2.=0A=
=0A=
>s/Risc-V/RISC-V/g=0A=
=0A=
Yes sure=0A=
=0A=
>> +=A0=A0=A0 oneOf:=0A=
>> +=A0=A0=A0=A0=A0 - items:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - enum:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 - sophgo,sg2044-aclint-sswi=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: thead,c900-aclint-sswi=0A=
>> +=A0=A0=A0=A0=A0 - items:=0A=
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 - const: riscv,aclint-sswi=0A=
>You need a specific compatible for your implementation.=0A=
=0A=
Yes, doing this=0A=
=0A=
>Whether or not this compatible is viable depends on the answer to the=0A=
>ratification status and/or plan for the spec.=0A=
=0A=
Replacing "riscv," compatible with platform-specific one=0A=
=0A=
>> +=A0 interrupts-extended:=0A=
>> +=A0=A0=A0 minItems: 1=0A=
>> +=A0=A0=A0 maxItems: 4095=0A=
>> +=0A=
>> +=A0 riscv,hart-indexes:=0A=
>> +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint32-array=0A=
>> +=A0=A0=A0 minItems: 1=0A=
>> +=A0=A0=A0 maxItems: 16384=0A=
>maxItems is 4x what is allowed for interrupts-extended. Why?=0A=
=0A=
Fixing this. It was copied from the dt-bindings for the APLIC where=0A=
maxItems for "interrupts-extended" specified as 16384=0A=
=0A=
>Please constrain this property to only be permitted on !thead.=0A=
=0A=
Doing this=0A=
=0A=
>> +=A0=A0=A0=A0=A0 riscv,hart-indexes =3D <0 1 0x10 0x11>;=0A=
>Please be consistent. Hex or decimal, but not both.=0A=
=0A=
Sure=0A=
=0A=
Thanks, Vladimir=0A=
