Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010069.outbound.protection.outlook.com [52.101.69.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606712E401;
	Fri, 30 May 2025 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621834; cv=fail; b=T5BDpEIHJGrvB45w+n1xeRLB4WNaq/4AVXi9gHbEygVcLJC7eGjw5V4jb1Eb7co2CNfqk82d8wpXxv6As3MmpRulkg2kESK3MiLTk8lqxqMl/VyslxTGRucVKsB/PzCcsAVYOePo3YdKQuXDXtWtrO2VazoCvivlLCITtIqHzos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621834; c=relaxed/simple;
	bh=7c33luyTXmaHH0yDMLTqhGuqj3ajIagtNzcajApV4ZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=I05L/QblQ51WYT3CpGCro9sG8axZJiHJFzSrseWyN7aqdOcZODjHvR6zJJ4pexEnv8Hd5gGyapqooPA8w+JpVEinu8pGZGlMi/BlNMSg8FpQYQfhBa+37KL8W+YwzydsnWqiFIlZk3ZDIcgNAByw/DsJsS7+sT3WUk5ew7sJvSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MaWZDn7s reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MaWZDn7s"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sSSzWpWYjk+cogYb/DpnO48uQ42LP4jBYs8lNDzOxAtgVcHNj3EqOqM+fl0SquMJuz7zLk2ECe+g01BZ3g9+fFMNglT8cIWTtc/ZjuoVoE1D9c0u3hEM7sB2YSooejf6mMFIsDtmJl8noOIULESKXWYGsXVZp32NEFqlUiIIN8/dsPs9/qJEkh/UdxQIoUEJ8Ga4z3kyk5gXR8sdgHlT11djDJuCPls5W1S6yzMneKQ28qvIdfjMprR0nHghTr38fX7Z7Dkq/HZSlr36kdQLeITMZxY6BLof+Uurg29XPLPIjtqIQStMxi4fttRrsplAlw5+ZPoCYIrs/DVVn9wixQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CqbmyRYxyWgUK2IAD19vsyvBgn6+VHVESKpdp6J/zaQ=;
 b=CPYLfXWpTQj9CCIVviV+HfqkFsMdqzSqkc7QDd7yKQjsnTaHrI3e5eQD9mmevNf2KKqMdbnDcMpnwHYOn3x1ad4nHxTT3vD7WR3fZOIWH+MoB/pBKXF6YEI+HpjrJn3ZTUg+lEuP5CY7y+C1N+Wh38TP3MEB7Tnnkk1MNp5Y02giN+GU0kpAAeQ+JfbDfYNh3veMcIpVLSu4LzpKw3YRLsq/GO7Q5jc3s+ubFcLciSmn8N+AQf0SfkGWEdnnPVbZ4rsNUfYYiBduQ2WA8dZts/WnnusDaYYF09+9PoOazw6LQ7Wx6jdh7ljYu25c7k25ReghjB+zmpXhQU16ydekLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CqbmyRYxyWgUK2IAD19vsyvBgn6+VHVESKpdp6J/zaQ=;
 b=MaWZDn7sxuvm144nh4y3/ID4BwJuSRnS6b3DILNxrTQ5kH5ehFPnSvtqEuummuCupYP3S6d3Ndb4O+pNkReLsgIgMwlOBRU++p6dzxxdIYCFZccsTP9MIIV6uWqfUMSgB4IWgH07wQM50YXaxj3Z61fmYwtGaILDlgjxDP3X6rgNEf9H5VCpq//q8b059mtPrRoIPQmXG+wuL71T+O/C2qDi/EkfqOH8506uAGlhfFJfCkEQ3euQLjExgR62dpEbgzJYwG+QobnLyt+pY7t8M633WHDLKi8f16i3u1Q8rEvtNedEYIiy967/Y/aUyygQJujiXKq0wJwJTVbQ+iehrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10992.eurprd04.prod.outlook.com (2603:10a6:150:207::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.31; Fri, 30 May
 2025 16:17:08 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 16:17:08 +0000
Date: Fri, 30 May 2025 12:17:00 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: Re: [PATCH 2/2] arm64: dts: ls1028a: Add mbls1028a and mbls1028a-ind
 devicetrees
Message-ID: <aDnZ/KjP/mMDhwF0@lizhi-Precision-Tower-5810>
References: <20250527060400.1005757-1-alexander.stein@ew.tq-group.com>
 <20250527060400.1005757-2-alexander.stein@ew.tq-group.com>
 <aDctWKIvBKwF29lP@lizhi-Precision-Tower-5810>
 <7298658.31r3eYUQgx@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7298658.31r3eYUQgx@steina-w>
X-ClientProxiedBy: SJ0PR05CA0049.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10992:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f184b43-955d-4a0e-7f35-08dd9f956cb7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|366016|376014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?Pp9Yck+zejt5Q7F6mABC1yEo3aK2ef+fCOvNpY/CHMH0qP4g9Kk+baXNJH?=
 =?iso-8859-1?Q?T+RDqWOaThLomwn1QckKhKdGZjhTy0l0qWCf4qkXTGrM9N7jVgN1nmtinr?=
 =?iso-8859-1?Q?Vpq3nSZz9xOiKTrOWTSCBUbmtBDGBK7QAfjiVx2pgxnDsVJ7kqUBI/6RO7?=
 =?iso-8859-1?Q?fAptEvrPOE12oaRCSxokhW7jMn9mmyDLCbL2LbtU7nasi0LZfmWICAEd9X?=
 =?iso-8859-1?Q?21+nVbqLDavTn/Rsb04mz9uqmitVBAlx6k38bPkoFJSdo4kDQLTeLqTt7K?=
 =?iso-8859-1?Q?2HG4MZfHs9+3lt5H2w019efSY0DqKjD4S73vgokD/0maU7Ihg7bMZiyL9I?=
 =?iso-8859-1?Q?UxsXPujoSWni9ED5Nx6DwWZkwLxvzHf9nS8V2liCEr3egryVry7QFCLstL?=
 =?iso-8859-1?Q?LC87LuGYxAm9vct4vlsjbN2ntsj/tGQG39EOwKWp5VdS64yKDH7jt1SKle?=
 =?iso-8859-1?Q?EUZHAAkjWyAjxHHF+w8+YQbokDQ/gttx4fvLyDsVfoX0AU1FeHC6+mxjdN?=
 =?iso-8859-1?Q?qwzcrxV7uqvkUOSdmi/R5xdZUxktfvJ51beumSi2fbzaVK4IhfW4Zynvw4?=
 =?iso-8859-1?Q?mso/z+Z+ST7t1j7yKvUMMuCHJD2B9F89J7aQxV4AyNhCLDYUMiE8XE8T7v?=
 =?iso-8859-1?Q?nBC/JvhW17Zy60I19giO0WUj37jd6rn57swrWG71eokFeqpUvMoTQrbuz+?=
 =?iso-8859-1?Q?luVkjKqX0Osrc1l9XmxrsmDq6wH1gyN3Nq1T/DjSlEUfP5qdOPAwZ+7dIa?=
 =?iso-8859-1?Q?3lxlrdthF4ouDGpr2/5nN14OSAyoETRERtQyUdNRWlaOv9RJmMlkRCmyej?=
 =?iso-8859-1?Q?8TbPX3QV0MgLnp+JEa/ElY/Fmkoj9Nd7KKUHLeK2Lz1I5loB5s/48bnvaY?=
 =?iso-8859-1?Q?1QJ27NQ+N/W0Kp7ZHDTC9wQp1mai1Gvxl1+TrXC6jNhxuuILQ9C7aDeQXX?=
 =?iso-8859-1?Q?FvWwH1aPtFxMke4WJ3ajMTFSMGFiWk+ER2FZjC1EZaq4vqk5v2v/4OVxGS?=
 =?iso-8859-1?Q?0TbAfSKzkyESx9DhuHoThGUtOqzG7qz3OPje4aSuWcVHptToD427ssKBso?=
 =?iso-8859-1?Q?vVapJ97+xVlTIDBSz7jWIzsenq7yw9+F/Yduq1Wt62N7xIKEqMRll5p1uo?=
 =?iso-8859-1?Q?0pBu1CF63lsM5MG3BnpoqXLcilFKEs1wKc+DXNoxfVsr33S4t+po5EoR9w?=
 =?iso-8859-1?Q?C/TsLrZYTnGHWYNulq3f2iJMkGgNr0apqmOvFIGV5Az5qZkOb3fvei+Ke4?=
 =?iso-8859-1?Q?DiiP1gAG19J1/gf60XEO+rWpGqPqT1cESsSittKoHVOy0fJF2cxB/znsJ8?=
 =?iso-8859-1?Q?DVyKc0nswbWwuqRw3pV/qD3zsNE4fXwNi7sPQFifEPCAFGLkCWvOVIrS3g?=
 =?iso-8859-1?Q?6+nVmS7H+OAOOWTwk/arG8Bso8jlErKeQHc+6v8nZ4WVeos9z9gRiAswKY?=
 =?iso-8859-1?Q?MBrkLyhWeRsxBc/GIc84pFZNH2QnYf/bCb2biSBNFXEbse78vyuC5lBdnS?=
 =?iso-8859-1?Q?c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?3PgUyvWtwt37KoOxLTBbGaBiGXlicDdNenwSFgNpPyAk9fmm29h/wIdNQd?=
 =?iso-8859-1?Q?zFfjikJ/QoZDowxxkVqk9x0n0e/8FknumvGBWCEZkI25D3lX688XZWFFkP?=
 =?iso-8859-1?Q?AxCFGW0QLtnSo+Tb96ER+t/V95/ULpNLJnMUZyVW0csg2B52BqpGaN5Nn4?=
 =?iso-8859-1?Q?RICeFgSnlDmXBbxegc4/xfjJ+gpO7nCfsvyaeNkCgT2/vRYc+gdOwiZFer?=
 =?iso-8859-1?Q?4EIPigixwRUUGFMoJIj/6nqE+PZla6mq9uW8fOOBoCsYQYVr0nqhQHCPmj?=
 =?iso-8859-1?Q?WeSM5MEynyRfzUHUe5C95ORstBuOFWylY05qzraKpADCWLCgZfckZZ3dBs?=
 =?iso-8859-1?Q?tAZFbxvwtKt56Kk7lEV95rohB4WHFCCw0s5aFFpXLbB03aY4VZIkoV9JVk?=
 =?iso-8859-1?Q?DS/XN8zBdh1L479tZK837m7A0iw/9bTcUszch2EcTRwA/uLqXG/vu+TVBw?=
 =?iso-8859-1?Q?TJWoebGc//jdUJuRN7fhIYyDzZWaKcFJELt+zLJnnkrMMBSt8kd1pY2vGp?=
 =?iso-8859-1?Q?ozq0tlqv78kYVdOd/i1wWZELxx2IMl/VIK6eHeGNWI2KSR3j40QsJ0Woni?=
 =?iso-8859-1?Q?GMwckAzFE+ktNT0Dm+rLXtbCE78iitTXwWBc/Ak9gl9DizqrsYqKkCmFs1?=
 =?iso-8859-1?Q?Q3SIh400IkT5EuwfK+22p8iVNFOPLXD83lmVUrLyxh9pCr+STqJ/eiQVYZ?=
 =?iso-8859-1?Q?EDtLX65Khpix+CMtAc+bmtU9gTfTaUZdhrixgfM+T8ZWH9vAVbYwfSUE1u?=
 =?iso-8859-1?Q?ehzBd50aMVbe/jFGa0FpB2jDNfqxAKl8GzrRjtJu72byYtSttgQRBYTvMD?=
 =?iso-8859-1?Q?KDzz31ang4nEdpiqCepoOo3vWoQGQvP9P3Jei9R6NNdXsnosaz/Nqd1qeq?=
 =?iso-8859-1?Q?N4eAktR+lFa7cHcRBCknRjEuoWSe7r91uiCOJrOgLGs0qzXvfMVMw6kmEC?=
 =?iso-8859-1?Q?ipFz1W8++ywT5obxt6pcvphar80RIljgWtW3xNm4kfnw1lI1AvZ+5d3zmP?=
 =?iso-8859-1?Q?SCS/gbewdPePDgP5CQcCi/O5l96ekozzKE+00l252idn0JzqUq8hKqW850?=
 =?iso-8859-1?Q?NyZeL2RRnq1fsalAWqxL1wIn9hPfd9DhR1X0+eQrd+y8sEBj0rSyRi6QtC?=
 =?iso-8859-1?Q?QiXmETW9nv8BcIOZmSWKmuHoftUjOlvkdp8+TKhN2yGMtD0ZrgNzAyCCvf?=
 =?iso-8859-1?Q?mla4anczR7IgVBvCGL6PZ4Vz5NWx+oUvJjCMHD/wsJpPiC8XMI+tIz/jcW?=
 =?iso-8859-1?Q?SzeZa7cG9GmvrP6PRUedZnKJiBUBbWcIYCFdUoqteLIxlLPYfrAyGIOIQZ?=
 =?iso-8859-1?Q?EW/3Gq4wjpW34eVs5meaPkqvrnAenh37CQH/rGdtMK4dmajI5nz26PJNse?=
 =?iso-8859-1?Q?cLrZAqVtuvUyXkyQWKnHHNSjxjq2tWJaYZlIguKCQr7h3BLfAjF+WOoTWP?=
 =?iso-8859-1?Q?3UE6skWzDX457sb/vHykKMNBq3oDPYT9coefjnBMRKAsmEhXHQqw/4COip?=
 =?iso-8859-1?Q?Q4wjIE6CW+W2qWARjYVduEXpcKB8mrj1y3Xq4SGLF4zeCDtEOkHrqnRtYa?=
 =?iso-8859-1?Q?ZzOFI/A7mmFCBB1MBgZcxVNuF8cV9P0oBlUqMU7P/Irz4OLkaQvZsdc1/x?=
 =?iso-8859-1?Q?PytwTBO16ELgkm3p7wbTXp9hMG9bjjvQQ+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f184b43-955d-4a0e-7f35-08dd9f956cb7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2025 16:17:08.2394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IK7KlHB5GTKGuu6NhDNFgXLv1XGc0jLpmPymN4CZfDcrOfJcP5QOi5uHVuNawkfvfvpEDCTuYmsNrm1VHpPviA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10992

On Fri, May 30, 2025 at 08:29:27AM +0200, Alexander Stein wrote:
> Hi Frank,
>
> Am Mittwoch, 28. Mai 2025, 17:35:52 CEST schrieb Frank Li:
> > On Tue, May 27, 2025 at 08:03:55AM +0200, Alexander Stein wrote:
> > > From: Gregor Herburger <gregor.herburger@tq-group.com>
> > >
> > > Add device trees for the MBLS1028A and the MBLS1028A-IND and the SoM
> > > TQMLS1028A.
> > >
> > > Signed-off-by: Gregor Herburger <gregor.herburger@tq-group.com>
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile        |   2 +
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a-ind.dts  |  68 ++++
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dts      | 118 +++++++
> > >  .../fsl-ls1028a-tqmls1028a-mbls1028a.dtsi     | 291 ++++++++++++++++++
> > >  .../dts/freescale/fsl-ls1028a-tqmls1028a.dtsi | 117 +++++++
> >
> > New dts file, suggest run https://github.com/lznuaa/dt-format to nice order
>
> Thanks for the suggestions. It does some improvements, but I also disagree
> with a lot of proposed changes:
> * Wrong indent of SPDX tag
> * model property should come first IMHO
> * {gpio,interrupt}-controller should come before #{gpio,interrupt}-cells

I checked code, it is specific rule to make -cells before -controller. It
should come from previous review comments.

Do you have document or mail list require -controller before --cells ?

Frank

> * gpio-hog property should come first in a hog node
> * sorting gpio-hog nodes by name instead of line number seems wrong
>
> There are some more bogus changes, so I'll skip this tool for now.
>
> Thanks & best regards
> Alexander
>
> > Frank
> > [...]
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
