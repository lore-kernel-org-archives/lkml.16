Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09713A86C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 11:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748345569; cv=fail; b=bZ1wI0cy2JsGajKREvI6QxpJubnqG4eSkQEL/aVBSFegitkTpR3iQYVvPQlttpbWcc7UVWIL0plmPgocrhAoOYWJhCEQtquPWkuIsxbzf3Xwtldyr+lhQ8AOc8ZkWLK+S7WaDDxoIj63Z6pmJcwVfBLFVc0yfblM3jky4YuPVF4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748345569; c=relaxed/simple;
	bh=rlaTX8CJm5PhrzxuIu4zcgoEQLQc/P3hqNp1NB3Udyk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=C76kAZm4IaWgjezeC5r30sS389OGjngefUDrrBSGXgYTGGw4pex2gcojY5ovyTbo+AsCiXfXOM0EGpVyZdljWRoZaFMlWx5jJhOELCdSUYo2acNubb7lvsJoBAnpTHO2RMURl2BQ/aqI69KRLZloZCqX1o9S+9YNYynElgJZ9sg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZhXljFZ+; arc=fail smtp.client-ip=52.101.228.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZhXljFZ+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XDOonV0iDjXkc6x/P/xHAbvey49SCuwcWJPV84Iccl5KLv+tvaGSCbOWeuVK9bWa4JjrjIlrqcHF/73aU0uHSYJf9SBitCzcBecYy8USw/Gtqy/JVjdQ7NbErZNlnSwU6yf3nPswl7IP2yGSsKvGQvgkFxMsAczSlqHptxUevFA+/cqfmXxjK5lxBkcbGoSFuMheLykdEacQFvvdvxFuHx68L98LxyNtmI2EFZFi0KXzVYzj8YaLJnq7UqvHn5EtAEpn2bLCGMzDt0h3ARdseqEMUfkRoxTrkknfbZFNNxveT3BA1s52Biw7DB8j2Z1fy4VpNn7GkrD5dphRkJPv1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3KvZy0iET5BRUqkvfZ1q4Uh4/ell8Ouxclks8jj3T4=;
 b=jzBH3Gns+fobI9Lfl+6DEPuUvHHxfTb+s2A4J+lpiBsKC+dpDOt9ZYHUXCsgeBmCRMYnBHtk2CAyBTGqBE370LDMHBgRDQePX4mYRzEFMdnFkidpTjP7rjP+vkRdACyP6d6E5wZenfsNldVzoYSEPX3AcMk3OImxGxfbEFyn9jAlAkWwBW+T8GSCIv7NWg+pAqc+OTIlrnoJukhPJnLQQzlbcf/esnl2I+DClo4cTN4W1iLRry+wG3ac2sbMMkWPLglR34k5rojDY/R0vcYVmB90N2F95lPDQc2NrP78VtrEstHa0fekuo9abu0jqBD5/Szouh4VSfj2La+3Bs0Jwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3KvZy0iET5BRUqkvfZ1q4Uh4/ell8Ouxclks8jj3T4=;
 b=ZhXljFZ+cjKo/ZQL0+OvnoEO1WAi5MI44zX1HU7Vt620mJGn7LfEOuV4yp7xO4FGrGm6hAML3C2X7UhORBDFkotgPSPCZewrjPkbc8zdQRikBSzZCpFWO89Kiyso1jC2f/6XxsYaMZjqq1L+MdZ0XtPQE53PB56O9qgwwTf9teY=
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com (2603:1096:405:20d::9)
 by TY4PR01MB15022.jpnprd01.prod.outlook.com (2603:1096:405:260::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.24; Tue, 27 May
 2025 11:32:43 +0000
Received: from TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a]) by TY4PR01MB14282.jpnprd01.prod.outlook.com
 ([fe80::37ea:efd9:8ca0:706a%6]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 11:32:36 +0000
From: Michael Dege <michael.dege@renesas.com>
To: kernel test robot <lkp@intel.com>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>
CC: "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	=?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add new step
 added to latest datasheet
Thread-Topic: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add new step
 added to latest datasheet
Thread-Index: AQHbztQVk5q7dbckrUqXtFJwrg/R57PmOT0AgAAewKA=
Date: Tue, 27 May 2025 11:32:36 +0000
Message-ID:
 <TY4PR01MB14282C38CF2E371F52DB8EF088264A@TY4PR01MB14282.jpnprd01.prod.outlook.com>
References: <20250527-renesas-serdes-update-v2-2-ef17c71cd94c@renesas.com>
 <202505271711.WM48TTTI-lkp@intel.com>
In-Reply-To: <202505271711.WM48TTTI-lkp@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY4PR01MB14282:EE_|TY4PR01MB15022:EE_
x-ms-office365-filtering-correlation-id: 3f638709-c16c-4180-30ee-08dd9d122e0e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700018|13003099007;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HmB7zbGZjFZP3VvBRVe8QCHZVJL6r3uezE49Em61M6HYS7Fq0vQKlhSg67?=
 =?iso-8859-1?Q?J1xVmPYvyWrPWiuAuh8cqLRxYtSaGikgh61wnTTkwYyI7CRqoE7lI4iK4M?=
 =?iso-8859-1?Q?GP8Yzlf2bhhMmkZPIdG65z9oFGhX8wgTjPEflqi3oNFf/s0kcEzJTYkFkm?=
 =?iso-8859-1?Q?xltWkA17wLzW2Eehg6isHX/oCD3yEME4o9RAef1X7wq6/Pa76PdqT7XocU?=
 =?iso-8859-1?Q?Qh6i9CNhemWHKsh7YTuD/BDP6+s5FF9n7QQkMNiUmMOreyveNtV5SIQqnU?=
 =?iso-8859-1?Q?h7KlrVJaOVxVzBTRYlBXawB5M40f4kdg2zfpSfXhZ2tY9SkWk7zjn2XthW?=
 =?iso-8859-1?Q?+USH4EILnnU3351McPtNqRV718WN+JuqEkevDai3IX54ntCZCQnbmT2gfz?=
 =?iso-8859-1?Q?0+9OsSZthZ7mmb8Z8NcMm7yETaZ0SzRiYOyG/RJwM9VbT/Wv3fuTFbEy5D?=
 =?iso-8859-1?Q?E5ou6jDyn94hFJudrR7kmsQQeBuZ/SGE2ZA4YXbjrWmQYV5yO7/7x8WGD/?=
 =?iso-8859-1?Q?z4+Y4LB6VaGQZMd1fq6WGSOODjZiTL68E599WHkB3hFS5NNt6kayPIP7w6?=
 =?iso-8859-1?Q?ggu/ufBZyUMtaOlXzPnbaQ8kIFWwy1Kit5gHOexRgHylYaIKOF6VaCmaXe?=
 =?iso-8859-1?Q?SUxHJX6wRD9diWsXBr4aKgUwvnfIKhUKWCi9Mtc/IQfff+sGn78UQIaK6w?=
 =?iso-8859-1?Q?3X97759JvW/wtrZVe8J8MoFUsqOACHGa6/mqhLo1CReTzKqVfDZyBshRKb?=
 =?iso-8859-1?Q?4g+thxMxkGtJg2otVqUJFEvbgK5Qg4EG4hItNIgMycbOA/tJa3GSD3k/ID?=
 =?iso-8859-1?Q?jUZcrsaUKaOcgkk9TUeLPQ7vmCAa4jTEDBvZvwWd4PuBqdSmgUkUeTb8Yi?=
 =?iso-8859-1?Q?BNZ6FiOXH7B9qHhRZcs0//1jDr0piOxnSk2bHv7yKtWYJVISotpsQsebnU?=
 =?iso-8859-1?Q?Y4S6SX7MgB+naATgf2lAjfPbzAiGL7Pwh0/ZnjnEjMvukdAzLVItI0wVpc?=
 =?iso-8859-1?Q?iZJjWm2hejXyep38Kcyd1Xz6J7sRo/DUZ2elO9z6oVZ5Vdh+ZYes1q9n/w?=
 =?iso-8859-1?Q?xh3k/M6Qmee+X9C4IP25VyjMPaztXwju6yRytcnk8tWqzvKpMJIgaLtnpo?=
 =?iso-8859-1?Q?PuUYdsB9aqlLQskgTEKy6T9xkeprdDOaCsxJKEF5wiuD3BBJcBVN/5BvU6?=
 =?iso-8859-1?Q?1alTJbTxuSnDG8OwUpc1xCLIoLqarVnTry4XJDF88bzinirWNQpdgvGefJ?=
 =?iso-8859-1?Q?PvtmWJRw9xdbZ0U0nFDE1ZuzyJXFBeJimksKUbcMOKkbdS3zr9IOfWMjEa?=
 =?iso-8859-1?Q?WVnmZNYcba3tPoc19rjDk44EcrN28MwzZRZWVNqMbbN5UKL16sOY9Kx1Oo?=
 =?iso-8859-1?Q?p/MECbJmXLtryXd8kflucG0tFEY3raGEXxRMRjdTOxc+vrkGlbN1NRvePI?=
 =?iso-8859-1?Q?tQqeIhkDWR7qfBmtXEgp5nmb0nUVFLvDg/vhO3xXOCylnpoK7eJbQgJ0Fu?=
 =?iso-8859-1?Q?DQLmvaiLl8nvFuQSvmWZz8?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY4PR01MB14282.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?LkRRx9tT+/vYptiOP0jzqZdpKWHaajnzd8k+vDoUZoy7FwV89Ed9IPet4i?=
 =?iso-8859-1?Q?ABzDX8/NIIdqgXP0Y/LlgcYJgqWB2WgD/h/KKCrCRrIri/mfK4z2tYPdOD?=
 =?iso-8859-1?Q?+Tfe0XFKUT7tLW5rYHZrq0OiettVjBGlaj870aiIohN7MhGfFZAlWzwz7N?=
 =?iso-8859-1?Q?kTPlvG2DcVibcbcKhlVzE945nxcbkGj5XRuL3TF4TXSa/in/PRbZTyjMd9?=
 =?iso-8859-1?Q?wk4NmLbpgvTTo66iTFsLiMpp9PEJVSho0+6HEEIKFsEkra0dKaqNjDNjaq?=
 =?iso-8859-1?Q?LtTOxf4lTW5KW1kUA7/uBywycf4QfFLIuRJ3RBfWmmopmKpvIZGnUnalHB?=
 =?iso-8859-1?Q?YyZ54+Mkb9hhlNEbnk8NYQo6rA89iL/pms+2jMhhSZocDw+jPo9NJ8HHXr?=
 =?iso-8859-1?Q?yqh0eKgnu7HPqMk5Siv0xvN8EqbEV/rd/zprmvQOkGeXWNyl0Vwc30uIDr?=
 =?iso-8859-1?Q?cfxv5aTFU7GZ4UTr0UImgJG9qRT21fnsRC6bGF9OuCdm701VcDM2mzcXoP?=
 =?iso-8859-1?Q?H68NrCoVqLKmwgi5vnu4+x6yUCYQFnQpOAayh8vsEhT+E9xvvwy8fMhqMK?=
 =?iso-8859-1?Q?3eBaXV9DjQzJ/gQV9GJjW3uB/DDeax3IYCsmCeqirZvVpcwfY7fKn7SM8I?=
 =?iso-8859-1?Q?kMCAkyw2DZLIuSWkcXdbKqBL1YCnYc8GFnHAL+yIhmS3ltwns7WKgwOYs1?=
 =?iso-8859-1?Q?h1BD3hs+nmQFX4Uy2Q+jbdho6vZTiWHTsZjup+JPlRoS4pSzt8gThyDIMH?=
 =?iso-8859-1?Q?JefBUWm4jgwEqU1Na6O1WmRQVEmzKsZ9eIDaFPJ0QLUXgHXgywh3+WhZgv?=
 =?iso-8859-1?Q?cvq6R2IiWvD/eWP0NRCPd6wa1mi95k8s+HVe5b/8VEn/dHufq3kI4mJ1nf?=
 =?iso-8859-1?Q?NcHaBBBtR56wqKCBZFiG7qDm/hQYBcs+2Cc1GwOFFyR00oc2IfETNzZmGt?=
 =?iso-8859-1?Q?ZV8KDgGg7HbJe8wKHfa1XHAqRiRLmRILTbMHUrxUnioa8J0WBR9ByxrqSG?=
 =?iso-8859-1?Q?IrLbi7NYdQo0OXXGvAGEBH0B+AU2YXwV7XFvolk3Rxs90WswldAZSKkqqy?=
 =?iso-8859-1?Q?bLX8/WBGUt89sEvaEIsMU53XxBVr8iO6Kz6Vkqv330Pyn11ZhmGKaERDq1?=
 =?iso-8859-1?Q?FEtp5vI4z6F7uCzpKUFEkfHX62CJikEygqK7718L0LMYE8I7JHxK8V6jlL?=
 =?iso-8859-1?Q?sf0LT6CFdiRN7qkr6gOprl8fJ0OCNEdMlE4TG0I9aEqtU7w+hrWUlGiZmd?=
 =?iso-8859-1?Q?X/c5CLbfJo08VNjRCY2f+ahNYljhfKhlMnQPIGJoHG5c/NhZTlnlwEtUWX?=
 =?iso-8859-1?Q?a0UPlNrlgBCXQZmZiEzGtTxSgOgKBQ1e36oQYWow/793xhXr19qbh4elB8?=
 =?iso-8859-1?Q?8v4fo+jWi4ex3Qn0wjudBidpdR3RyJ69M6/tgp8t2yiXsGi6oELv4B1FTI?=
 =?iso-8859-1?Q?zX8RxMOAZt9cNLVnpdqWmExENHm3JVlhXU+1dvHnm8/+xraNd+fasfm2P1?=
 =?iso-8859-1?Q?NYWfocol2Jr009XY9krzrKMwbrjZmOt+fiK9fyhz7FyjHVz+fboXBpz2/Y?=
 =?iso-8859-1?Q?+nIKChrjGQZM7xPlDrsyBZVD91k5Yg2JdvVDvtnvwUA0ZkEfbA+ukCUQJY?=
 =?iso-8859-1?Q?MT5wSMzb9x7+9PPc/fOmhC4YSqMM0Y207E?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY4PR01MB14282.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f638709-c16c-4180-30ee-08dd9d122e0e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 May 2025 11:32:36.3714
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QtqnIwAg0jUBeMhotsGlBhV3y8QLBAAAAV+B1ROERDHeOSHZU266+n6Qm0JKM6xxU8UAFiyeKhlmSVC8mv75DVdAObuPEzKv3E+K/OvItKQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15022

Hello,

> -----Original Message-----
> From: kernel test robot <lkp@intel.com>
> Sent: Tuesday, May 27, 2025 11:41 AM
> To: Michael Dege <michael.dege@renesas.com>; Vinod Koul <vkoul@kernel.org=
>; Kishon Vijay Abraham I
> <kishon@kernel.org>; Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: oe-kbuild-all@lists.linux.dev; Michael Dege <michael.dege@renesas.com=
>; Uwe Kleine-K=F6nig
> <u.kleine-koenig@baylibre.com>; linux-phy@lists.infradead.org; linux-kern=
el@vger.kernel.org
> Subject: Re: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add new =
step added to latest
> datasheet
>
> Hi Michael,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on a5806cd506af5a7c19bcd596e4708b5c464bfd21]
>
> url:    https://github.com/intel-lab-
> lkp%2Flinux%2Fcommits%2FMichael-Dege%2Fphy-renesas-r8a779f0-ether-serdes-=
add-USXGMII-mode%2F20250527-
> 150048&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C8302e9fad5af4162a89e=
08dd9d02baac%7C53d82571da1947e4
> 9cb4625a166a4a2a%7C0%7C0%7C638839357252567523%7CUnknown%7CTWFpbGZsb3d8eyJ=
FbXB0eU1hcGkiOnRydWUsIlYiOiIw
> LjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C=
&sdata=3D%2FImajCm4YD6H2309lF5m
> zmCObCS6%2FpCZMotTI57bteo%3D&reserved=3D0
> base:   a5806cd506af5a7c19bcd596e4708b5c464bfd21
> patch link:
> https://lore.kernel.org/r/20250527-
> renesas-serdes-update-v2-2-
> ef17c71cd94c%2540renesas.com&data=3D05%7C02%7Cmichael.dege%40renesas.com%=
7C8302e9fad5af4162a89e08dd9d02b
> aac%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638839357252584964%7CUnk=
nown%7CTWFpbGZsb3d8eyJFbXB0eU
> 1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjo=
yfQ%3D%3D%7C0%7C%7C%7C&sdata=3D
> JzM8KY23Z1AzRSwou%2BkMTRWBkvC6hOaDEDENTTH6GEQ%3D&reserved=3D0
> patch subject: [PATCH v2 2/2] phy: renesas: r8a779f0-ether-serdes: add ne=
w step added to latest
> datasheet
> config: arc-randconfig-001-20250527
> (https://download.01.org/0day-
> ci%2Farchive%2F20250527%2F202505271711.WM48TTTI-
> lkp%40intel.com%2Fconfig&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C83=
02e9fad5af4162a89e08dd9d02baac%
> 7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638839357252595528%7CUnknown=
%7CTWFpbGZsb3d8eyJFbXB0eU1hcG
> kiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%=
3D%3D%7C0%7C%7C%7C&sdata=3D8JtB
> v%2BFmcJng5BiSSjnOhSodkQ2dtBH8kQnVQdXBhmo%3D&reserved=3D0)
> compiler: arc-linux-gcc (GCC) 10.5.0
> reproduce (this is a W=3D1 build):
> (https://download.01.org/0day-
> ci%2Farchive%2F20250527%2F202505271711.WM48TTTI-
> lkp%40intel.com%2Freproduce&data=3D05%7C02%7Cmichael.dege%40renesas.com%7=
C8302e9fad5af4162a89e08dd9d02ba
> ac%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C638839357252606183%7CUnkn=
own%7CTWFpbGZsb3d8eyJFbXB0eU1
> hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoy=
fQ%3D%3D%7C0%7C%7C%7C&sdata=3Db
> tqrLQmBkVgPbAQ64H1ls6R9%2BQn0WTfNWUVrTApuDjY%3D&reserved=3D0)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of the same
> patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes:
> | https://lore/
> | .kernel.org%2Foe-kbuild-all%2F202505271711.WM48TTTI-lkp%40intel.com%2F
> | &data=3D05%7C02%7Cmichael.dege%40renesas.com%7C8302e9fad5af4162a89e08dd=
9
> | d02baac%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C63883935725261673
> | 0%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs
> | IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dj=
a
> | r%2FB6U8ENcw71CzP2jduv2gEQrSkOUj%2Fnhf6jcPv5A%3D&reserved=3D0
>
> All errors (new ones prefixed by >>):

I will fix the issue and send around a new version of the patch set.

>
>    drivers/phy/renesas/r8a779f0-ether-serdes.c: In function 'r8a779f0_eth=
_serdes_read32':
> >> drivers/phy/renesas/r8a779f0-ether-serdes.c:54:25: error: 'RENESAS_ETH=
_SERDES_BANK_SELECT'
> undeclared (first use in this function); did you mean 'R8A779F0_ETH_SERDE=
S_BANK_SELECT'?
>       54 |  iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELECT);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                         R8A779F0_ETH_SERDES_BANK_SELECT
>    drivers/phy/renesas/r8a779f0-ether-serdes.c:54:25: note: each undeclar=
ed identifier is reported
> only once for each function it appears in
>
>
> vim +54 drivers/phy/renesas/r8a779f0-ether-serdes.c
>
>     51
>     52        static u32 r8a779f0_eth_serdes_read32(void __iomem *addr, u=
32 offs,  u32 bank)
>     53        {
>   > 54                iowrite32(bank, addr + RENESAS_ETH_SERDES_BANK_SELE=
CT);
>     55
>     56                return ioread32(addr + offs);
>     57        }
>     58
>

Thank you and best regards,

Michael
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-
> tests%2Fwiki&data=3D05%7C02%7Cmichael.dege%40renesas.com%7C8302e9fad5af41=
62a89e08dd9d02baac%7C53d82571da
> 1947e49cb4625a166a4a2a%7C0%7C0%7C638839357252626902%7CUnknown%7CTWFpbGZsb=
3d8eyJFbXB0eU1hcGkiOnRydWUsIl
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C=
%7C%7C&sdata=3Ds8LGQlWaPw4C3ihZ
> 9X6WiQaZWuxKLPlqd0sGv7T8uw8%3D&reserved=3D0
________________________________

Renesas Electronics Europe GmbH
Registered Office: Arcadiastrasse 10
DE-40472 Duesseldorf
Commercial Registry: Duesseldorf, HRB 3708
Managing Director: Carsten Jauch
VAT-No.: DE 14978647
Tax-ID-No: 105/5839/1793

Legal Disclaimer: This e-mail communication (and any attachment/s) is confi=
dential and contains proprietary information, some or all of which may be l=
egally privileged. It is intended solely for the use of the individual or e=
ntity to which it is addressed. Access to this email by anyone else is unau=
thorized. If you are not the intended recipient, any disclosure, copying, d=
istribution or any action taken or omitted to be taken in reliance on it, i=
s prohibited and may be unlawful.
