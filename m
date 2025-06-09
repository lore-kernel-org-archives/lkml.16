Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B9219A288;
	Mon,  9 Jun 2025 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749458121; cv=fail; b=Xom8uoWLrNrb5OhDo08/FvHf1g4a8Mal9blbgDeokRMe4YpxDUXbju3PF4B5ry3ZlY5tH51q3VWqlAMf88sV8uuG59rP9OucuvoNp0MsSHU49S5PNAKEc/WZqDOZG/cFBfN9yjcXw/XmFoamdj1otfRMXEIQ7pwnLiw1eKKTYNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749458121; c=relaxed/simple;
	bh=JldvpaA7pqQidKlo5RwQA/Qsd4GnASZ0ykJXE7gXRjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YBJF79B0RSH8iyUbF3vBCgCD8ZBFEubgP/MGRCSk5f14LNmBtrMuYSdoBV2JmmCgq9FzIT+gE12TIQy3oKr8gWO9ppHFQlx2PqFNBYojApyW64lzDykGlF2W2YZb6BDZ0nKyUTAZoiz3yDmjAmCtpIkSUQQxyhgWXZ6qS0Yu850=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ea1S910Z; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ea1S910Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eMX6spDi2NAt4Q9+hu6S7cDe30LlQNBMHCMaNK2Q36QiooLv953PQwLiBejMIBUwQ3Jdc/0MUE0AGK+4JV9a8RjNQbMmhruwmCY6P4TMat/MjZC5yHrsq2nilaug7uWlKKaFGl3xoDPE63LPylW4GdRphzjWjrLgkJQDKwFX07I0kdaMPUMHJMuzU6pkhYape/KT9eGKmq7HaJSjkqztcPylxzlNpbBTj7zSOx/fyKsLFRBzygntED0xfZEdtR5lyz4uxpjrr50DRUCAysUr3j9ngBu1MYTQdWSFWMqNE2pwnz7x3UK48EngvUFMWT9g3uwuVXEk/plxHyBJrCxDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGfvFy0D9IfXPJK/4QyeA3R4uPNen6cy3IzyX7iaMqg=;
 b=iQ7n+z97uaKNgVdzUJ4Qb0zA9BPnCjCK79VoPzfodLEeAUXZuIYHKFlu1aI0xs5uNfe+nllAHlKVtGFH8ur7+8wKoRuv1kyHzcbZGtXM2Nu5gD39VJcCQkVb3Bn5a3U3LCU39PHW1zIAjnTlgmOxmannNTEfYlsJOI3Zg/d8DVrhzd/NE0p4UwcSooYbjl7jzH4GAKyfIY0APJ9qyfrrt3WjZyD+KFgVn2yeUNgDsTmiGloBBLdqt6wvMJVtKYbAbAGjROAqYyZ6VMciWWTEmrxJQL3Z8FIsjsildAOM1mXIuJwr7rZAjEzzF+tVMl6xvZtV4U1warU2Q8xd5hkqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGfvFy0D9IfXPJK/4QyeA3R4uPNen6cy3IzyX7iaMqg=;
 b=ea1S910ZUKP0zOGRLCz9NUzPqVUIzITHxgUWC2q3dbKbnipGvn0JNDCUR11CwZaeLz3KRqPNIfK5U2n0FeUkaS12ThpWfYSGKwiT/Q9g8yOBnBkt1K+Cy/y4yqRjdedy+UexloxsqYglhTT+Gc8JX5V42qy+QYLbJUWmeeNSkFKI3ceupTyesp4JhWwev6GIWOmqjdIuM0wtbmc/Y/1+gBXpzQ82jcalPERpD1pv27jbR2DU2bmsSLgVrSjw9rMrCO4H4SD57TwLK/0DC1cqo+pLmgDnZGc8EgkJwhYm5fviOdK/8LfjAyiZUqf7qAI3XVx5D/rJW/GlBA/OAnuV0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB7140.eurprd04.prod.outlook.com (2603:10a6:208:192::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.27; Mon, 9 Jun
 2025 08:35:16 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 08:35:16 +0000
Date: Mon, 9 Jun 2025 17:45:18 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@denx.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Rob Herring <robh@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Tim Harvey <tharvey@gateworks.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 00/10] Support Engicam MicroGEA boards
Message-ID: <20250609094518.GE13113@nxa18884-linux>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SG2PR02CA0096.apcprd02.prod.outlook.com
 (2603:1096:4:90::36) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB7140:EE_
X-MS-Office365-Filtering-Correlation-Id: 286350f3-77ad-4c1e-829d-08dda7308f55
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?5VorisrbZtN2UV0PL9dysGCw9eUd6r390wI9GZUsU8ZNsnyrMyqEF4QtUVVO?=
 =?us-ascii?Q?hEfQwu2LxUTeKuiYnIvuHNGq7y86/i6nAsfX0ys9ua/j6TXQ4UX0UGSoK2U+?=
 =?us-ascii?Q?FRfCUHMHk1zrY907+cpnGIzmWB8cisCbdMmv8RmLhsLqTLZIzPxLfgy1lrSv?=
 =?us-ascii?Q?q2Ct2G8xkJV8foy5vD58hX4zZc+wh3rCzFZZ6orA+UqqooQSZQIt/rqypCe1?=
 =?us-ascii?Q?nsIzZimMcXfkR0mDPIDvZqzXnWyXWuRVIvwDVxUuqeU4YHfnk3KENQuvfFT5?=
 =?us-ascii?Q?km1Yu77p0JKzOmGmig91shg8knIuXFDFmCi9ezDs6K16ZdKNUcoD2XgkwX3/?=
 =?us-ascii?Q?2/KiYqvuwWGzMfjBEKpsGxB24WonZd060Ux5N1zhm9kq7SWhFDMawKOomJn7?=
 =?us-ascii?Q?XOwosMrmUsJVJkU10yYqqD0Q8uUQMJQrGYjCkkbk8ATlVvIWQMCkNbvMZTdO?=
 =?us-ascii?Q?EBFv72ccr6UAch3HAP1LAN3v+eUOBNXofjDHMsTI6LM4EhR/CR+xRTf0zpgJ?=
 =?us-ascii?Q?uFdUghKZZL3FRAPqpy6F/AA+Ec1RCnl/5e+Ovqnmj60FOnAM4wzXdrZXG6+3?=
 =?us-ascii?Q?7JVwsfZt/epmxkVrsb1YD871Nv3awfQlvdeDL8KKP3L9Xb67+GmUDxCCNJ4U?=
 =?us-ascii?Q?QPBuQgvsp0LQLDQzjjAGo8BSfm8IjMwQT7dhhsBEq2FlXdke3JsdGqAO26Hk?=
 =?us-ascii?Q?Jxsewo9si/V6guvjfgFV50XX4O2nHrRFxp3YxTAkyJtVYSlaqu/RazVHN7eV?=
 =?us-ascii?Q?1jUenEac3sA7tQVd9mFCQe+3Z++LFEnf6H5wAVJgri0hC7ZVMtVyzjxiyV51?=
 =?us-ascii?Q?37ie9+acKwXS2xjJQQdKTgOyNwPrCmUV/V3jKq2luidFQA4O3WLFgAxvwxTP?=
 =?us-ascii?Q?gZEjzaLekDHqs0OwmSgcoCbkfnA1ylFVXJEfFlh8cEJek1wlrrPeKqmP1Qys?=
 =?us-ascii?Q?Us98GtP9/Ic3IWTfU0vUzDLrhIPP7kEReLaRZC6Ew/0sWvqY6u3cJcALQJay?=
 =?us-ascii?Q?Gf5MGw4AxvmNpyc4ZKWjhkiSQypru1fULOxO5SZZQ+n3hmLwKYyGePWR1uSL?=
 =?us-ascii?Q?s0fKe/T5gubcRAg0Jtg0IivGNAnAiyBOAsk5iQG6AE755V6xMbeKtYZFijLq?=
 =?us-ascii?Q?UrzOjSQN0yTHV7STxSJ0aoZMU0OwXD0C823wmi3s1k05Wss4s9posHAh6HFZ?=
 =?us-ascii?Q?022EJLlZ2r/L72eJsizrNxMZqzoNAdvTVGe+QF51UkAFk5D6KaQYoykpZZbL?=
 =?us-ascii?Q?ETlZ7wuV5NUF1oEicVy1whNzwkJBRUpWS5TKgB6btf1f/rnmDIPQOw3zVH76?=
 =?us-ascii?Q?eeM7Y6XBva4fsVxmWBfURg5Mtz2+wAtUs+YlEUeJKlgoDm3/j5DtrFsnOqBC?=
 =?us-ascii?Q?8XfWQifRimxZ64Qey5RH+RT5nudGrxPJJtEsWYyI48FQ+o3fJwPDX3voxpMI?=
 =?us-ascii?Q?u3kcoKYhAkkOX7Suk9ICEAJissj9T/Hlez8o5+Aak9zl2nL3VaN1/g=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?11OCwhQr2IqcUtxZQDDu1czhXSVN3zgnuPC9nC7gXvM7Uh88YaIyOIWjBg2R?=
 =?us-ascii?Q?qNyzONpWvi0xJCT4bPxmGjr1PIzb3vy7p3cUixczJzSYYkKP2XwKGOW7gIzy?=
 =?us-ascii?Q?aiR9YUUDlICHVvfcQmECU232JWTT65wrlKi6E7/uEi+IM8pB8fLXkvQMEqDP?=
 =?us-ascii?Q?C/qcWyg5wJdscN7WjhGN0Xo+PiAnRAvRNPpxDP8Tr697QXwCuZ3IcpXLaxNv?=
 =?us-ascii?Q?XUq8+AEKDOlOGgBtrKsrTztqAxc9Do25mODYhlj2MHymZjARiudFUPqvUb2s?=
 =?us-ascii?Q?FLqa2VoX0o6pvJcAZkTYCM2oZyiZhrFreHiQR80LmW/DWpzhfmQDJ8oV1v4F?=
 =?us-ascii?Q?vHFRCqb143bIFuzHFbawXdb9JN2mtw1i+v0M3EEMJPUuGzMLpEhlOBKB/0eO?=
 =?us-ascii?Q?3P8LTdybgRB6pzH/VIqN23FU2QVcwckVapiaRXY4QodLCKda8ZW6atlu/wvu?=
 =?us-ascii?Q?3b+yC0TI3C2GC20NxPh2L3pdHso0Pm4LBnsOdZ8k9BjOneF02/an2yblp0tE?=
 =?us-ascii?Q?pc9yCKM0n0Jad3fbyOgOImY+HhAH6olIL4G+gef5LZAwjctQBs/G1F7z2l17?=
 =?us-ascii?Q?cf4gznwmyHekQy9N02FTtg4a+QYg2wEHKYtn5SUOHXjkqALSK8q0cFcznRcT?=
 =?us-ascii?Q?bUO5jiandifWzPxlMUretUTL2Ok3sz7HLK6Xu9I9qXBvVbnjOFs/g3Iwlkxb?=
 =?us-ascii?Q?mGv3ZZPnXZQ0Fb8lAxW+Cr5Ni3eBOPg6pHpb2c5iKh1ETubE+ocufLKiW/2d?=
 =?us-ascii?Q?3fCdPIUI/XXMf+G2RtseFSgPBbZyhtzWP+9ddlkhN7ldVsSPAA5tUCY7Zhk1?=
 =?us-ascii?Q?aEQJwu5PkJzBT2uktAB4lRslosdqBn3NQ6ceywuOIRCTpX+FFIvNlk5ZLRRx?=
 =?us-ascii?Q?/68S54yFftlNtZeQ6Iw+RpT+/zT3Qhn7etei7z1xJi4T0pifqvbPCLJFXCyl?=
 =?us-ascii?Q?IuUexzMMXV+IWOS/j/MxUxWYqEj/R3GXfJqecJWWAFIGXU4J+k3P2yrJ1q+J?=
 =?us-ascii?Q?u4uktKgn4w2nP5WNnPqVcKee1G5iq/vB83GtYEhf5zYAfX7xTerekRUSKfLn?=
 =?us-ascii?Q?sivyHQ+efX0Y3VU9cMF/nNQJnJqH6CrZ84mBK4yvd+k/zy5lEmy1bUdMreGY?=
 =?us-ascii?Q?sYys5H1Z81WAPKeqw5E3Ia+JZ+BaHonxQQ0oISYOIRjyr00CU+f4E5DQuzv1?=
 =?us-ascii?Q?phYDxNYu9UXpY7kNjh798DAbijYhe6Dx4z14VxmW6KfngezHm55BnmL6RUmo?=
 =?us-ascii?Q?+BCTXcO/pG4ifBmmj9LVZfIxRfr0l2NhIr2S0w3XngMLWbBIvOv8SpRuYL6d?=
 =?us-ascii?Q?Y3jsVkBVN4ChSCRuAZ8tviL0q85wRLo9/FEqzEBI74mirj2AWlbZCf8QmHb1?=
 =?us-ascii?Q?Mdqyt86+8wdzejWBBtpn2DOnAk/gvsOw4AIcgv+8XJls0u/2qirpg39MMnrm?=
 =?us-ascii?Q?ZF0xaNb1+b848xISVQ+Ju9ZQSs1YRJtaNQcLsPzeGV5haUQ8qqlYTxOS6JKW?=
 =?us-ascii?Q?NZqhQ75QtRV3LHGnngxpV3l/S3CvXK3V80Hdn3UA95ISLa/8pPOk9GqREKKw?=
 =?us-ascii?Q?FQFPHqIYaj8bV/Cx30rylI/Ngt6WMG+CmVXlNqn7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 286350f3-77ad-4c1e-829d-08dda7308f55
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 08:35:16.4482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aLgqwccZfumYb+PoUfDI2S6LFuRzKLqXsXavwPQUL1ir0eyMPKe7ARDBZQFOKIeFLQx2PmFvN5wzbrFU6EWv0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7140

On Sat, Jun 07, 2025 at 11:33:12AM +0200, Dario Binacchi wrote:
>The series adds support for Engicam MicroGEA boards:
>
>- BMM
>- RMM
>- GTW
>
>based on MicroGEA-MX6UL SoM.
>
>
>Dario Binacchi (10):
>  dt-bindings: arm: fsl: support Engicam MicroGEA BMM board
>  ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
>  ARM: dts: imx6ul: support Engicam MicroGEA BMM board
>  ARM: imx_v6_v7_defconfig: cleanup mxs_defconfig
>  ARM: imx_v6_v7_defconfig: select CONFIG_INPUT_PWM_BEEPER
>  dt-bindings: arm: fsl: support Engicam MicroGEA RMM board
>  ARM: dts: imx6ul: support Engicam MicroGEA RMM board
>  dt-bindings: arm: fsl: support Engicam MicroGEA GTW board
>  ARM: dts: imx6ul: support Engicam MicroGEA GTW board
>  ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
>

For the dts files, I replied with a few with my R-b, but I just realize that
need put iomuxc at end of the dts file, so please address those, then
you could keep my R-b.

Regards,
Peng
