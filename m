Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013062.outbound.protection.outlook.com [40.107.162.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D175D28DF18;
	Tue, 15 Apr 2025 16:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744736089; cv=fail; b=OuLgxWDqyflM6l5rQhyVaJnMXoYWWZeVrgQ+qVnMS1JOEYNUYEd8tLls+A9aWCPVq4N9a3rphlEaNYZzIryB6OIqe6gnD/SMdcQ9Q86IJQQI/yhbHKpn8ncRELA3sGFtuhllJ7BfBmfdCSJxEHsRcfyh2wSL+h+khD4gtPXW8ZI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744736089; c=relaxed/simple;
	bh=WOP57602KKxLQBWnTFp2jgm9oeSJkKtt+YmBOFIDFuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J7xzXYG315BBW5O2U67Gc4z2+D0M6NCvit33aIIJacpEdbh6NegwM58aih6MM/NM+ouVf88tNg3I4griumGR12+6yhIbgHXm9la/7o5AO6rQ0xoiDA5DiFejs5Ahdfl1VbuZa4SFJSMbvQg0C7uVfDN9pvw+ye4Y1DbahnwFzeo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iHm+9iv3 reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iHm+9iv3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vgeEubHJnfrMjF7/TDYq6viEuMRjcRBfda3tQfsO8zrNhBXBRGSMZTtVUtuUrHmbvGjdEcy+LHKCkDEEFA7++S9Q3d8+/nUsqIMuVK2wxvFqWlfcj/LdCgVhZkAcuf5QmvltCl2Jzq22D+g9Fcp9chjp6AVs2dkeWP22gIb+ILtx3XvjmsiAOoGrvoJdQRciRYtUigm3GgKE8lVtkHjeG20Dy8kjsZm/DKf4lIRkysgpeTtlLzMy2RjZH0WD7uDsRiFtcAFogkzwD8hU3nz9swA12as/t6aIf1m/Fh7rk6n713bM7jTz5CAHY5QXo7T/wdOLy31mvRwucSBwxMCppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Ad6gxmM63KONPdChR97YLTHrSQ0qhB6x/kQc2cocfs=;
 b=dy2twA0ZmMW4WVGc1M8D71Ec5imYzK60K/kwZzotk6WeR8RHlXum5NpBDPybPf8Buwj6HYEAmsH8U6Zv2UVBks8GGKDmJEGryzyJbZ47jJsZntSBAhLzJWDU1EdPJfQwoPumswkbjztG8ch1aqq5bACYemCzu4+NxPtT0mtXEUgkQfJPabAQWKHBYhPxyuyu3STXzDNPOfSGvkBrVl5YatB9yhqsly7fYvtms/JzU3trvV2FDSv4k2RzwyoSvibkkkfHOPwAwQKjY8Dqq4Tjm/+9J+Dx8fr7FAFnApAfuiISvyjISu+CwRNzCtQ8YiRAXyAEjG6fC8lArO4NPq8VBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Ad6gxmM63KONPdChR97YLTHrSQ0qhB6x/kQc2cocfs=;
 b=iHm+9iv3nsPAEXo/pb5yEN8D+cuxcxgaFYG5dLq8o2Q+rHRNt7MfhL6hFPXapAoreZbfjSgOFf9H1Al7NBbZdYkBBmqci2wIxyaMzw7rSQ2Nsty63RI4Shb8Ew7ksB1kvrxNbGwRq6FjFgfIMELWiiQBCRdfBRjEZZD9053a8DvHyqWKbWk67Joz9gVFNBqSpa5garNj/xmb76Eqg9HJhfOeqN9fAwQdoVXBswyL1As5vovIbx3JJJTQF9bmVR0bcOczx0i3+KEhYHNVX/584iZ/A6CULlk4haieoH8Vemal3SR2eUYo+gwndWfiDsZI+C7dkxnrbGw+3Mn36n3IIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Tue, 15 Apr
 2025 16:54:36 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8632.030; Tue, 15 Apr 2025
 16:54:36 +0000
Date: Tue, 15 Apr 2025 12:54:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "robh@kernel.org" <robh@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>,
	Teresa Remmet <T.Remmet@phytec.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Benjamin Hahn <B.Hahn@phytec.de>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	Yashwanth Varakala <Y.Varakala@phytec.de>,
	Jan Remmet <J.Remmet@phytec.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"upstream@lists.phytec.de" <upstream@lists.phytec.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"festevam@gmail.com" <festevam@gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: add imx8mp-libra-rdk-fpsc board
Message-ID: <Z/6PRM4qt+ggcVB6@lizhi-Precision-Tower-5810>
References: <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-0-c0d2eff683ac@phytec.de>
 <20250403-wip-y-moog-phytec-de-imx8mp-phycore-fpsc-v2-2-c0d2eff683ac@phytec.de>
 <Z+7Z+GyBzwz1Bhye@lizhi-Precision-Tower-5810>
 <3a0752368992cf2d170f5e2b036336d34691459b.camel@phytec.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0752368992cf2d170f5e2b036336d34691459b.camel@phytec.de>
X-ClientProxiedBy: BYAPR02CA0029.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::42) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|PA4PR04MB9640:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c55a49e-d994-425d-7313-08dd7c3e344d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?iso-8859-1?Q?VIeODctoW540Bbw0p4vJL2JaKp9kFW9wpVdjl8HYSgIwoyNZTkLaxSP5YJ?=
 =?iso-8859-1?Q?/hSo7S4DZlwtMvbehhg1/0U9PMdiYitozxIKDCv3v59kSTAW8iyRg6F6df?=
 =?iso-8859-1?Q?L0Qwe4dPPTAEkOL/s/ry9JqwWZTTMXW/rKGUgbIoyO+bB2AcgM9HU1X5E0?=
 =?iso-8859-1?Q?ruCiGATnRba6Cr2jzhzdWT8LWolrFAXMzCwlfTPwbAYKz5z900DPyO5K+1?=
 =?iso-8859-1?Q?MHqq+gicWSGw3R3ixX/8ddmgAQl7DU0Z6cLFkdN8Tlnwk5og+qDob9uevw?=
 =?iso-8859-1?Q?/AX72NyR+FwCLyfzho5tnbx4ax+iLCe/M/kh0iOY/mUg6AtVGWB+WlBt5n?=
 =?iso-8859-1?Q?EGkNLwV5uusJmrQkVgRX2L+DZLeNliyjOqilSc16QyaOCcy3A6Fpuw/7tY?=
 =?iso-8859-1?Q?0U2tMxk4I5a0TGJtXzvu5PccpEooDkMG0BBGXabVw4JV1xoO1CWiyhdite?=
 =?iso-8859-1?Q?HzQZX3wlCumpQf5Y02VbntxdN90znQS0HD2GoVFHPoNRkPRUlLNh8uPQeK?=
 =?iso-8859-1?Q?ZNues6OHo4UvMbesOja9QgEv5Q4rYun47OV03OXgW9w3C0Qdctc5/srkxA?=
 =?iso-8859-1?Q?Y4Q1iL+qv8vQOvFSVfZAcdfL9EYhCnfyhoKdpH88TzTdCZcK5ifxj3uINu?=
 =?iso-8859-1?Q?nftYXW603PltHWIGHXfDVWJtaIuv2xtLCeDUwy13IC9qt1wH7gCFcLYiMA?=
 =?iso-8859-1?Q?3qEb4gR5VcDqyi0L8M5Pkej6JPvOwa/w7lIQCFicU7bwoSmG1mf4mQgzbz?=
 =?iso-8859-1?Q?oB9KVkz5gpVoogdyH5UBJ0PhwZAzoQjLBXD93iGxhk+sn/pTxAo62Rl6cK?=
 =?iso-8859-1?Q?7M4xYSXIv4y+5N5jZEvf5L51EWpc/fd8wDJe2KxUHEclj006VY/oMpRXyY?=
 =?iso-8859-1?Q?gxOJUnG9+fxhseN6hd0g/C+NsiJ11fz0VG5n1QI4G3zOC+jSDlaVAvoWrE?=
 =?iso-8859-1?Q?zmGVLrId9S8nvkkVyYNOgDngxWdtNpJD6fdHxVxmlEOYrFVTTMeamp0CPY?=
 =?iso-8859-1?Q?cv1R32+TtSvEqkzGMez4R/CB8S8XK5y+OjokOn0Ai4xoB4eqdm6RMxPrQx?=
 =?iso-8859-1?Q?vuthOp1RgsWlWUNYNw8sdpsYF8UDhqlsV6C6PCv+/E/IBDDP1DmkaloQrT?=
 =?iso-8859-1?Q?tAMxVauEmpco9mrrzWDspHhOFzpc1L33mLZWCQpYH2tlZP02tRL0cCsQ3J?=
 =?iso-8859-1?Q?CGxPuaVtFTt9nTX6h6qtXaXFlGmLcy3pvs1vcONJVEuvJWllRsXM+52bTL?=
 =?iso-8859-1?Q?FJBbN1iG4Tb6MisQBQZIlgOdHsr1zP3QCMStiO2dECnVbyvVI1l4zodj/b?=
 =?iso-8859-1?Q?TnON5pj/A63UPyufQhjN7m63DOB9KT4PIXjmJsAT7r685Whu/q8uWtzlks?=
 =?iso-8859-1?Q?5iSj7hCpzHn8PhEIyWTdQT8N1WChJa0SRM1t13gcJNYBG5P4/hOPezWa7k?=
 =?iso-8859-1?Q?+X6WzuDdsg+jjS921+ZC3UgnVi6p/77nTBAMyPSimce6mRJnWi3bGanzTq?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?iso-8859-1?Q?PbFlrOSNosmyRKQ+saAGI0rrTjP4yfPLlppea1BRNv1NXDZSLY1vMbBlBd?=
 =?iso-8859-1?Q?l2rUPxKVrtCpUKZtRQbIzhVk0I+ia9eKeGanJqD864Tw40g/InZVs5un62?=
 =?iso-8859-1?Q?C7sdkebM8UTMWssD8j1YeOIwm/i7vFwg03aKRvx4ghrjeIdpf58w0ckLBg?=
 =?iso-8859-1?Q?bA8qb4L5esfT1OqJwe17HC8xHbT5SU/qEQhLQKvkIqrwPDbPO5Plb90XEh?=
 =?iso-8859-1?Q?XxF8KTvinsWkw15qy3o3dsRr0RxUu7/0+gWFGiKasAEjEDccXJazBJFPjb?=
 =?iso-8859-1?Q?Z6JkwLgtJ2Ozsz6HXIw/ITpwWMt0D4f/SD//fsYFNFE1hoVwwI01GdRKxg?=
 =?iso-8859-1?Q?Z2GUWPrHGAEaljlvThcAFTcibpVklbOX4IxrAkMqfQl0OxKvIJD4tAej/Z?=
 =?iso-8859-1?Q?BwZt8eyTaJrRQygdhawqOO8oBmFyRjKNfwhkxqLGTMjTJRJwxsaEksZmuI?=
 =?iso-8859-1?Q?0bpl6nVLgh//dPCRwPpfxOyeULpVoLd8vgKrpl8xQgk7jdaQtxQp0IIamb?=
 =?iso-8859-1?Q?mf86ioweggISifa/2z+i7mthAhMdvyIINNe4v5bhUwX2CFidx4JumhpGkk?=
 =?iso-8859-1?Q?KmungjSPDXT/Up5KXMYOkMVX/NIFVT4v8ApGle16BpQe4+lApDQ1dnOHzo?=
 =?iso-8859-1?Q?n/y7hXcLgu1ibbQWiKsRN2AAP+5yu0lbo5p38rwuXSK58j7ED9NSFpVCkw?=
 =?iso-8859-1?Q?UYYdFHZT0urqk6E51PDMienVwDaWhKWu870shbs7zMz8WAMeGPN+uXyPPK?=
 =?iso-8859-1?Q?0hBazvtGo56vAo7RM6k5hS4b4In2l8BiwtvCAcd8tuCsEKX23nEPkJBiw6?=
 =?iso-8859-1?Q?4JxxYmTLqk+4gLzqR8SptB5ScdZPiyToDD1s2hhSAoQ6B6jfDEq3GROBIS?=
 =?iso-8859-1?Q?xdVTrqseBhOimDjz4o+vlEvHNLPRyD479B0JB9hRLXIcrPrSXRWcXSgonV?=
 =?iso-8859-1?Q?/y10mo5oBovNUFKU2JsAKUnXvB4Q6GQ6MU/z0Mb0P6WzD4K22xqLIQN4OF?=
 =?iso-8859-1?Q?kswpLu4bCDm/66egGRh12gPsoyV3EBQTHgu6cQRBv1aKx2cNfvReSEbrkj?=
 =?iso-8859-1?Q?u9cdLEZjKUzSLF1k0eJ/sksTIC/WLp0uqLaWh2FIe+wLa0W1BBPZz+NRot?=
 =?iso-8859-1?Q?AEhnGhnWKaNXBxRwqBaLvT6V28SCZfhXB2duAk2soeYe175OgcX01EZpjG?=
 =?iso-8859-1?Q?e9fIGRW3/JYlHcxOc0E6q9zKgZZCVJkYPhH1U3WCfdr2Rizjlymf/EY4Jv?=
 =?iso-8859-1?Q?RQQ4x/qWh80czfEPZg+LC8s1sBrPaj0MiFN6gKYAbDrZFZqbddOgr6s2Rp?=
 =?iso-8859-1?Q?DZrRltyU705h8ffgv91kw3KUfgHRcE3TRcWQsvvwzz6GvQQDZHxQprrEFz?=
 =?iso-8859-1?Q?w92p7/573UUsQ99pT5H5xPhrOSzHjSAjXShEuEE7URs1xHMIP12boUrXdz?=
 =?iso-8859-1?Q?xfUQUQbc87Qow08lzivWlVWd6wXsbidSyIMgJfMnDuS8RwRmC6iO4cab8C?=
 =?iso-8859-1?Q?ovX//3sQVs9Ci8Ma77EhTTBy+8j9kgK7OhtjRNkrh11HFVsx2zq1Gv1K0J?=
 =?iso-8859-1?Q?H1RjjdxA69LPUT2/mWoI3b8IfE7kTY72O9zL68OcR4wCbdlRjOQj5IaWDT?=
 =?iso-8859-1?Q?hDklAOArzf1xEgPPSjlUW4BmAT4a5CUkcu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c55a49e-d994-425d-7313-08dd7c3e344d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 16:54:36.7616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ixLQnqSwvQfxDtCZ4Bboy5zZ8yGIZzxJU8PJRP6e+BWgaHdz//whOs89Anqcd41NhFcOy19GRAMd8QxT0IkZaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9640

On Tue, Apr 15, 2025 at 08:20:01AM +0000, Yannic Moog wrote:
> On Thu, 2025-04-03 at 14:56 -0400, Frank Li wrote:
> > On Thu, Apr 03, 2025 at 01:29:28PM +0200, Yannic Moog wrote:
> > > Add device tree for the Libra-i.MX 8M Plus FPSC board. The Libra is a
> > > pure development board and has hardware to support FPSC-24-A.0 set of
> > > features.
> >
> > what's 'FPSC-24-A.0'?
>
> FPSC is the version/name of a specific implementation of the FPSC standard.
>
> >
> > > The phyCORE-i.MX 8M Plus FPSC [1] SoM uses only a subset of
> > > the hardware features of the Libra board. The phyCORE-i.MX8MP FPSC
> > > itself is a System on Module based on the i.MX 8M Plus SoC utilizing the
> > > Future Proof Solder Core [2] standard.
> >
> > what's means "based on ... standard"? do you means implement/align ...
> > standard
>
> based on means that the base or heart of the SoM is the imx8mp SoC.
>
> > >
> > > To be able to easily map FPSC interface names to SoC interfaces, the
> > > FPSC interface names are added as inline comments. Example:
> > >
> > > &i2c5 { /* I2C4 */
> >
> > /* FPSC I2C4 */
> >
> > > 	pinctrl-0 = <&pinctrl_i2c5>;
> > > 	[...]
> > > };
> > >
> > > Here, I2C4 is the FPSC interface name. The i2c5 instance of the i.MX 8M Plus
> > > SoC is used to fulfill the i2c functionality and its signals are routed
> > > to the FPSC I2C4 signal pins:
> > >
> > > pinctrl_i2c5: i2c5grp {
> > > 	fsl,pins = <
> > > 		MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2	/* I2C4_SDA */
> > > 		MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2	/* I2C4_SCL */
> > > 	>;
> > > };
> >
> > this is Not necessary.
>
> What do you mean by that? Writing this in the commit description or naming the pins?

Sorry, my means is that comments is not necessary.

&i2c5 {
  /* FPSC I2C4 */ already indicate the comments means.

>
> >
> > >
> > > The features are almost identical to the existing phyCORE-i.MX 8M Plus
> >
> > why call "existing", according to new dts file, it should be new for current
> > device direction. imx8mp-phycore-fpsc.dtsi
>
> Well there exists a product called phyCORE-i.MX 8M Plus which also is supported in the linux kernel.

Did it already upstream?

> That is why I say "existing".

Okay, can you add dts file name?

existing phyCORE-i.MX 8M Plus (dts: xxx).

Frank

>
> >
> > > SoM, but the pin muxing is different due to the FPSC standard as well as
> > > 1.8V IO voltage instead of 3.3V.
> > >
> > > [1] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-8m-plus-fpsc/
> > > [2] https://www.phytec.eu/en/produkte/system-on-modules/fpsc/
> >
> > Overall, I confused with these board's relationship.
> >
> > You mentions two boards:
> > Libra-i.MX 8M Plus FPSC board
> > phyCORE-i.MX 8M Plus FPSC SOM.
> >
> > what's relationship between two boards?
>
> There is only one board, which is the Libra FPSC board.
> This board has a BGA where any FPSC-24-A.0 compatible SoM may be soldered to.
> For SBCs where the phyCORE-i.MX 8M Plus FPSC SoM is mated with the Libra board, the name
> Libra-i.MX 8M Plus FPSC is used.
>
> Yannic
>
> >
> > Frank
> > >
> > > Signed-off-by: Yannic Moog <y.moog@phytec.de>
> > > ---
> > >  arch/arm64/boot/dts/freescale/Makefile             |   1 +
> > >  .../boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts   | 290 ++++++++
> > >  .../boot/dts/freescale/imx8mp-phycore-fpsc.dtsi    | 796 +++++++++++++++++++++
> > >  3 files changed, 1087 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> > > index b6d3fe26d621234ab84353165d20af9d2536f839..df792553be479afcb6fa50dcd25a7eb63b67bc44 100644
> > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > @@ -200,6 +200,7 @@ imx8mp-kontron-dl-dtbs += imx8mp-kontron-bl-osm-s.dtb imx8mp-kontron-dl.dtbo
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
> > >
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
> > > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-libra-rdk-fpsc.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
> > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
> > > b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..6f3a7b863dca1e0f2de174e0fbff80e953c58dc9
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dts
> > > @@ -0,0 +1,290 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > > +/*
> > > + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include <dt-bindings/leds/leds-pca9532.h>
> > > +#include <dt-bindings/phy/phy-imx8-pcie.h>
> > > +#include <dt-bindings/pwm/pwm.h>
> > > +#include "imx8mp-phycore-fpsc.dtsi"
> > > +
> > > +/ {
> > > +	compatible = "phytec,imx8mp-libra-rdk-fpsc",
> > > +		     "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
> > > +	model = "PHYTEC i.MX8MP Libra RDK FPSC";
> > > +
> > > +	backlight_lvds0: backlight0 {
> > > +		compatible = "pwm-backlight";
> > > +		pinctrl-0 = <&pinctrl_lvds0>;
> > > +		pinctrl-names = "default";
> > > +		power-supply = <&reg_vdd_12v0>;
> > > +		status = "disabled";
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path = &uart4;
> > > +	};
> > > +
> > > +	panel0_lvds: panel-lvds {
> > > +		/* compatible panel in overlay */
> > > +		backlight = <&backlight_lvds0>;
> > > +		power-supply = <&reg_vdd_3v3>;
> > > +		status = "disabled";
> > > +
> > > +		port {
> > > +			panel0_in: endpoint {
> > > +				remote-endpoint = <&ldb_lvds_ch0>;
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +	reg_can1_stby: regulator-can1-stby {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-max-microvolt = <1800000>;
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-name = "can1-stby";
> > > +		gpio = <&gpio_expander 10 GPIO_ACTIVE_LOW>;
> > > +	};
> > > +
> > > +	reg_can2_stby: regulator-can2-stby {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-max-microvolt = <1800000>;
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-name = "can2-stby";
> > > +		gpio = <&gpio_expander 9 GPIO_ACTIVE_LOW>;
> > > +	};
> > > +
> > > +	reg_vdd_12v0: regulator-vdd-12v0 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <12000000>;
> > > +		regulator-min-microvolt = <12000000>;
> > > +		regulator-name = "VDD_12V0";
> > > +	};
> > > +
> > > +	reg_vdd_1v8: regulator-vdd-1v8 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <1800000>;
> > > +		regulator-min-microvolt = <1800000>;
> > > +		regulator-name = "VDD_1V8";
> > > +	};
> > > +
> > > +	reg_vdd_3v3: regulator-vdd-3v3 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <3300000>;
> > > +		regulator-min-microvolt = <3300000>;
> > > +		regulator-name = "VDD_3V3";
> > > +	};
> > > +
> > > +	reg_vdd_5v0: regulator-vdd-5v0 {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-max-microvolt = <5000000>;
> > > +		regulator-min-microvolt = <5000000>;
> > > +		regulator-name = "VDD_5V0";
> > > +	};
> > > +};
> > > +
> > > +&eqos {
> > > +	phy-handle = <&ethphy1>;
> > > +	status = "okay";
> > > +
> > > +	mdio {
> > > +		compatible = "snps,dwmac-mdio";
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		ethphy1: ethernet-phy@1 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0x1>;
> > > +			enet-phy-lane-no-swap;
> > > +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > > +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
> > > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +/* CAN FD */
> > > +&flexcan1 {
> > > +	xceiver-supply = <&reg_can1_stby>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&flexcan2 {
> > > +	xceiver-supply = <&reg_can2_stby>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&flexspi {
> > > +	status = "okay";
> > > +
> > > +	spi_nor: flash@0 {
> > > +		compatible = "jedec,spi-nor";
> > > +		reg = <0>;
> > > +		spi-max-frequency = <80000000>;
> > > +		spi-rx-bus-width = <4>;
> > > +		spi-tx-bus-width = <1>;
> > > +		vcc-supply = <&reg_vdd_1v8>;
> > > +	};
> > > +};
> > > +
> > > +&gpio5 {
> > > +	gpio-line-names = "", "", "", "", "I2C5_SDA",
> > > +			  "GPIO1", "", "", "", "SPI1_CS",
> > > +			  "", "", "", "SPI2_CS", "I2C1_SCL",
> > > +			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
> > > +			  "", "GPIO2", "", "LVDS1_BL_EN", "SPI3_CS",
> > > +			  "", "GPIO3";
> > > +};
> > > +
> > > +&i2c2 {
> > > +	clock-frequency = <400000>;
> > > +	status = "okay";
> > > +
> > > +	eeprom@51 {
> > > +		compatible = "atmel,24c02";
> > > +		reg = <0x51>;
> > > +		pagesize = <16>;
> > > +		vcc-supply = <&reg_vdd_1v8>;
> > > +	};
> > > +};
> > > +
> > > +&i2c3 {
> > > +	clock-frequency = <400000>;
> > > +	status = "okay";
> > > +
> > > +	leds@62 {
> > > +		compatible = "nxp,pca9533";
> > > +		reg = <0x62>;
> > > +
> > > +		led-1 {
> > > +			type = <PCA9532_TYPE_LED>;
> > > +		};
> > > +
> > > +		led-2 {
> > > +			type = <PCA9532_TYPE_LED>;
> > > +		};
> > > +
> > > +		led-3 {
> > > +			type = <PCA9532_TYPE_LED>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&i2c5 {
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +	clock-frequency = <400000>;
> > > +	status = "okay";
> > > +
> > > +	gpio_expander: gpio@20 {
> > > +		compatible = "ti,tca6416";
> > > +		reg = <0x20>;
> > > +		interrupt-parent = <&gpio4>;
> > > +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> > > +		#gpio-cells = <2>;
> > > +		gpio-controller;
> > > +		gpio-line-names = "CSI1_CTRL1", "CSI1_CTRL2", "CSI1_CTRL3",
> > > +				  "CSI1_CTRL4", "CSI2_CTRL1", "CSI2_CTRL2",
> > > +				  "CSI2_CTRL3", "CSI2_CTRL4", "CLK_EN_AV",
> > > +				  "nCAN2_EN", "nCAN1_EN", "PCIE1_nWAKE",
> > > +				  "PCIE2_nWAKE", "PCIE2_nALERT_3V3",
> > > +				  "UART1_BT_RS_SEL", "UART1_RS232_485_SEL";
> > > +		vcc-supply = <&reg_vdd_1v8>;
> > > +
> > > +		uart1_bt_rs_sel: bt-rs-hog {
> > > +			gpios = <14 GPIO_ACTIVE_HIGH>;
> > > +			gpio-hog;
> > > +			line-name = "UART1_BT_RS_SEL";
> > > +			output-low;	/* default RS232/RS485 */
> > > +		};
> > > +
> > > +		uart1_rs232_485_sel: rs232-485-hog {
> > > +			gpios = <15 GPIO_ACTIVE_HIGH>;
> > > +			gpio-hog;
> > > +			line-name = "UART1_RS232_485_SEL";
> > > +			output-high;	/* default RS232 */
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&iomuxc {
> > > +	pinctrl_lvds0: lvds0grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_UART1_TXD__GPIO5_IO23	0x12
> > > +		>;
> > > +	};
> > > +	pinctrl_rtc: rtcgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_UART2_TXD__GPIO5_IO25	0x1C0
> > > +		>;
> > > +	};
> > > +};
> > > +
> > > +&lvds_bridge {
> > > +	ports {
> > > +		port@1 {
> > > +			ldb_lvds_ch0: endpoint {
> > > +				remote-endpoint = <&panel0_in>;
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +/* Mini PCIe */
> > > +&pcie {
> > > +	reset-gpio = <&gpio1 8 GPIO_ACTIVE_LOW>;
> > > +	vpcie-supply = <&reg_vdd_3v3>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&pcie_phy {
> > > +	clocks = <&hsio_blk_ctrl>;
> > > +	clock-names = "ref";
> > > +	fsl,clkreq-unsupported;
> > > +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> > > +	status = "okay";
> > > +};
> > > +
> > > +&reg_vdd_io {
> > > +	regulator-max-microvolt = <1800000>;
> > > +	regulator-min-microvolt = <1800000>;
> > > +};
> > > +
> > > +&rv3028 {
> > > +	interrupt-parent = <&gpio5>;
> > > +	interrupts = <25 IRQ_TYPE_LEVEL_LOW>;
> > > +	aux-voltage-chargeable = <1>;
> > > +	pinctrl-0 = <&pinctrl_rtc>;
> > > +	pinctrl-names = "default";
> > > +	trickle-resistor-ohms = <3000>;
> > > +	wakeup-source;
> > > +};
> > > +
> > > +&snvs_pwrkey {
> > > +	status = "okay";
> > > +};
> > > +
> > > +/* debug console */
> > > +&uart4 {
> > > +	status = "okay";
> > > +};
> > > +
> > > +/* SD-Card */
> > > +&usdhc2 {
> > > +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> > > +	assigned-clock-rates = <200000000>;
> > > +	bus-width = <4>;
> > > +	disable-wp;
> > > +	status = "okay";
> > > +};
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..5aadd22def4ba5fbaaafef0b279dee039052bce0
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phycore-fpsc.dtsi
> > > @@ -0,0 +1,796 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > > +/*
> > > + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> > > + */
> > > +
> > > +#include <dt-bindings/net/ti-dp83867.h>
> > > +#include "imx8mp.dtsi"
> > > +
> > > +/ {
> > > +	compatible = "phytec,imx8mp-phycore-fpsc", "fsl,imx8mp";
> > > +	model = "PHYTEC phyCORE-i.MX8MP FPSC";
> > > +
> > > +	aliases {
> > > +		rtc0 = &rv3028;
> > > +		rtc1 = &snvs_rtc;
> > > +	};
> > > +
> > > +	memory@40000000 {
> > > +		device_type = "memory";
> > > +		reg = <0x0 0x40000000 0x0 0x80000000>;
> > > +	};
> > > +
> > > +	reg_usdhc2_vmmc: regulator-usdhc2 {
> > > +		 compatible = "regulator-fixed";
> > > +		 off-on-delay-us = <12000>;
> > > +		 pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> > > +		 pinctrl-names = "default";
> > > +		 regulator-max-microvolt = <3300000>;
> > > +		 regulator-min-microvolt = <3300000>;
> > > +		 regulator-name = "VDDSW_SD2";
> > > +		 startup-delay-us = <100>;
> > > +		 gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> > > +		 enable-active-high;
> > > +	 };
> > > +
> > > +	reg_vdd_io: regulator-vdd-io {
> > > +		compatible = "regulator-fixed";
> > > +		regulator-always-on;
> > > +		regulator-boot-on;
> > > +		regulator-name = "VDD_IO";
> > > +	};
> > > +};
> > > +
> > > +&A53_0 {
> > > +	cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_1 {
> > > +	cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_2 {
> > > +	cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&A53_3 {
> > > +	cpu-supply = <&buck2>;
> > > +};
> > > +
> > > +&ecspi1 { /* SPI1 */
> > > +	pinctrl-0 = <&pinctrl_ecspi1>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&ecspi2 { /* SPI2 */
> > > +	pinctrl-0 = <&pinctrl_ecspi2>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&ecspi3 { /* SPI3 */
> > > +	pinctrl-0 = <&pinctrl_ecspi3>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&eqos { /* RGMII2 */
> > > +	phy-mode = "rgmii-id";
> > > +	pinctrl-0 = <&pinctrl_eqos>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&fec { /* GB_ETH1 */
> > > +	phy-handle = <&ethphy0>;
> > > +	phy-mode = "rgmii-id";
> > > +	pinctrl-0 = <&pinctrl_fec>;
> > > +	pinctrl-names = "default";
> > > +	fsl,magic-packet;
> > > +	status = "okay";
> > > +
> > > +	mdio {
> > > +		#address-cells = <1>;
> > > +		#size-cells = <0>;
> > > +
> > > +		ethphy0: ethernet-phy@0 {
> > > +			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			reg = <0>;
> > > +			interrupt-parent = <&gpio4>;
> > > +			interrupts = <19 IRQ_TYPE_LEVEL_LOW>;
> > > +			enet-phy-lane-no-swap;
> > > +			ti,clk-output-sel = <DP83867_CLK_O_SEL_OFF>;
> > > +			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> > > +			ti,min-output-impedance;
> > > +			ti,rx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
> > > +			ti,tx-internal-delay = <DP83867_RGMIIDCTL_1_50_NS>;
> > > +		};
> > > +	};
> > > +};
> > > +
> > > +&flexcan1 { /* CAN1 */
> > > +	pinctrl-0 = <&pinctrl_flexcan1>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&flexcan2 { /* CAN2 */
> > > +	pinctrl-0 = <&pinctrl_flexcan2>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&flexspi { /* QSPI */
> > > +	pinctrl-0 = <&pinctrl_flexspi>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&gpio1 {
> > > +	gpio-line-names = "", "", "", "", "",
> > > +			  "", "", "", "PCIE1_nPERST";
> > > +};
> > > +
> > > +&gpio2 {
> > > +	gpio-line-names = "", "", "", "", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "", "SD2_RESET_B";
> > > +};
> > > +
> > > +&gpio3 {
> > > +	gpio-line-names = "", "", "", "", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "", "I2C6_SCL",
> > > +			  "I2C6_SDA", "I2C5_SCL";
> > > +};
> > > +
> > > +&gpio4 { /* GPIO */
> > > +	gpio-line-names = "GPIO6", "RGMII2_nINT", "GPIO7", "GPIO4", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "", "",
> > > +			  "", "", "", "X_PMIC_IRQ_B", "",
> > > +			  "", "GPIO5", "", "", "RGMII2_EVENT_OUT",
> > > +			  "", "", "RGMII2_EVENT_IN";
> > > +	pinctrl-0 = <&pinctrl_gpio4>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&gpio5 { /* GPIO */
> > > +	gpio-line-names = "", "", "", "", "I2C5_SDA",
> > > +			  "GPIO1", "", "", "", "SPI1_CS",
> > > +			  "", "", "", "SPI2_CS", "I2C1_SCL",
> > > +			  "I2C1_SDA", "I2C2_SCL", "I2C2_SDA", "I2C3_SCL", "I2C3_SDA",
> > > +			  "", "GPIO2", "", "", "SPI3_CS",
> > > +			  "", "GPIO3";
> > > +	pinctrl-0 = <&pinctrl_gpio5>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&i2c1 { /* I2C1 */
> > > +	clock-frequency = <400000>;
> > > +	pinctrl-0 = <&pinctrl_i2c1>;
> > > +	pinctrl-1 = <&pinctrl_i2c1_gpio>;
> > > +	pinctrl-names = "default", "gpio";
> > > +	scl-gpios = <&gpio5 14 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio5 15 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	status = "okay";
> > > +
> > > +	pmic: pmic@25 {
> > > +		compatible = "nxp,pca9450c";
> > > +		reg = <0x25>;
> > > +		interrupt-parent = <&gpio4>;
> > > +		interrupts = <18 IRQ_TYPE_LEVEL_LOW>;
> > > +		pinctrl-0 = <&pinctrl_pmic>;
> > > +		pinctrl-names = "default";
> > > +
> > > +		regulators {
> > > +			buck1: BUCK1 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <950000>;
> > > +				regulator-min-microvolt = <850000>;
> > > +				regulator-name = "VDD_SOC (BUCK1)";
> > > +				regulator-ramp-delay = <3125>;
> > > +			};
> > > +
> > > +			buck2: BUCK2 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <1000000>;
> > > +				regulator-min-microvolt = <850000>;
> > > +				regulator-name = "VDD_ARM (BUCK2)";
> > > +				regulator-ramp-delay = <3125>;
> > > +				nxp,dvs-run-voltage = <950000>;
> > > +				nxp,dvs-standby-voltage = <850000>;
> > > +			};
> > > +
> > > +			buck4: BUCK4 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <3300000>;
> > > +				regulator-min-microvolt = <3300000>;
> > > +				regulator-name = "VDD_3V3 (BUCK4)";
> > > +			};
> > > +
> > > +			buck5: BUCK5 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <1800000>;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-name = "VDD_1V8 (BUCK5)";
> > > +			};
> > > +
> > > +			buck6: BUCK6 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <1155000>;
> > > +				regulator-min-microvolt = <1045000>;
> > > +				regulator-name = "NVCC_DRAM_1V1 (BUCK6)";
> > > +			};
> > > +
> > > +			ldo1: LDO1 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <1800000>;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-name = "NVCC_SNVS_1V8 (LDO1)";
> > > +			};
> > > +
> > > +			ldo3: LDO3 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <1800000>;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-name = "VDDA_1V8 (LDO3)";
> > > +			};
> > > +
> > > +			ldo5: LDO5 {
> > > +				regulator-always-on;
> > > +				regulator-boot-on;
> > > +				regulator-max-microvolt = <3300000>;
> > > +				regulator-min-microvolt = <1800000>;
> > > +				regulator-name = "NVCC_SD2 (LDO5)";
> > > +			};
> > > +		};
> > > +	};
> > > +
> > > +	/* User EEPROM */
> > > +	eeprom@50 {
> > > +		compatible = "atmel,24c32";
> > > +		reg = <0x50>;
> > > +		pagesize = <32>;
> > > +		vcc-supply = <&reg_vdd_io>;
> > > +	};
> > > +
> > > +	/* factory EEPROM */
> > > +	eeprom@51 {
> > > +		compatible = "atmel,24c32";
> > > +		reg = <0x51>;
> > > +		pagesize = <32>;
> > > +		read-only;
> > > +		vcc-supply = <&reg_vdd_io>;
> > > +	};
> > > +
> > > +	rv3028: rtc@52 {
> > > +		compatible = "microcrystal,rv3028";
> > > +		reg = <0x52>;
> > > +	};
> > > +};
> > > +
> > > +&i2c2 { /* I2C2 */
> > > +	pinctrl-0 = <&pinctrl_i2c2>;
> > > +	pinctrl-1 = <&pinctrl_i2c2_gpio>;
> > > +	pinctrl-names = "default", "gpio";
> > > +	scl-gpios = <&gpio5 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +};
> > > +
> > > +&i2c3 { /* I2C3 */
> > > +	pinctrl-0 = <&pinctrl_i2c3>;
> > > +	pinctrl-1 = <&pinctrl_i2c3_gpio>;
> > > +	pinctrl-names = "default", "gpio";
> > > +	scl-gpios = <&gpio5 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +};
> > > +
> > > +&i2c5 { /* I2C4 */
> > > +	pinctrl-0 = <&pinctrl_i2c5>;
> > > +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> > > +	pinctrl-names = "default", "gpio";
> > > +	scl-gpios = <&gpio3 21 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio5 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +};
> > > +
> > > +&i2c6 { /* I2C5 */
> > > +	pinctrl-0 = <&pinctrl_i2c6>;
> > > +	pinctrl-1 = <&pinctrl_i2c6_gpio>;
> > > +	pinctrl-names = "default", "gpio";
> > > +	scl-gpios = <&gpio3 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +	sda-gpios = <&gpio3 20 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > > +};
> > > +
> > > +&iomuxc {
> > > +	pinctrl_flexcan1: can1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI2_RXC__CAN1_TX		0x154	/* CAN1_TX */
> > > +			MX8MP_IOMUXC_SAI2_TXC__CAN1_RX		0x154	/* CAN1_RX */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_flexcan2: can2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI2_TXD0__CAN2_TX		0x154	/* CAN2_TX */
> > > +			MX8MP_IOMUXC_UART3_TXD__CAN2_RX		0x154	/* CAN2_RX */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_eqos: eqosgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI1_RXC__GPIO4_IO01				0x10
> > > 	/* RGMII2_nINT */
> > > +			MX8MP_IOMUXC_SAI2_MCLK__GPIO4_IO27				0x10
> > > 	/* RGMII2_EVENT_IN */
> > > +			MX8MP_IOMUXC_SAI2_TXFS__GPIO4_IO24				0x10
> > > 	/* RGMII2_EVENT_OUT */
> > > +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> > > 	/* RGMII2_MDIO */
> > > +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> > > 	/* RGMII2_MDC */
> > > +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x12
> > > 	/* RGMII2_TX_D3 */
> > > +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x12
> > > 	/* RGMII2_TX_D2 */
> > > +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x12
> > > 	/* RGMII2_TX_D1 */
> > > +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x12
> > > 	/* RGMII2_TX_D0 */
> > > +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL
> > > 	0x12	/* RGMII2_TX_CTL */
> > > +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x12
> > > 	/* RGMII2_TXC */
> > > +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> > > 	/* RGMII2_RX_D3 */
> > > +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> > > 	/* RGMII2_RX_D2 */
> > > +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> > > 	/* RGMII2_RX_D1 */
> > > +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> > > 	/* RGMII2_RX_D0 */
> > > +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL
> > > 	0x90	/* RGMII2_RX_CTL */
> > > +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> > > 	/* RGMII2_RXC */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_fec: fecgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
> > > +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
> > > +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
> > > +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
> > > +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
> > > +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
> > > +			MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19		0x140
> > > +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
> > > +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x12
> > > +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x12
> > > +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x14
> > > +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x14
> > > +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x14
> > > +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x14
> > > +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_flexspi: flexspigrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_NAND_CE0_B__FLEXSPI_A_SS0_B	0x82	/* QSPI_CE */
> > > +			MX8MP_IOMUXC_NAND_ALE__FLEXSPI_A_SCLK		0x1c2	/* QSPI_CLK */
> > > +			MX8MP_IOMUXC_NAND_DATA00__FLEXSPI_A_DATA00	0x82	/* QSPI_DATA_0
> > > */
> > > +			MX8MP_IOMUXC_NAND_DATA01__FLEXSPI_A_DATA01	0x82	/* QSPI_DATA_1
> > > */
> > > +			MX8MP_IOMUXC_NAND_DATA02__FLEXSPI_A_DATA02	0x82	/* QSPI_DATA_2
> > > */
> > > +			MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03	0x82	/* QSPI_DATA_3
> > > */
> > > +			MX8MP_IOMUXC_NAND_DQS__FLEXSPI_A_DQS		0x82	/* QSPI_DQS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_gpio4: gpio4grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI1_RXD1__GPIO4_IO03	0x40	/* GPIO4 */
> > > +			MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21	0x106	/* GPIO5 */
> > > +			MX8MP_IOMUXC_SAI1_RXFS__GPIO4_IO00	0x106	/* GPIO6 */
> > > +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02	0x106	/* GPIO7 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_gpio5: gpio5grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x106	/* GPIO1 */
> > > +			MX8MP_IOMUXC_I2C4_SDA__GPIO5_IO21	0x106	/* GPIO2 */
> > > +			MX8MP_IOMUXC_UART3_RXD__GPIO5_IO26	0x106	/* GPIO3 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_hdmi: hdmigrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x106	/*
> > > HDMI_CEC */
> > > +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x106	/* HDMI_SCL */
> > > +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x106	/* HDMI_SDA */
> > > +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x106	/*
> > > HDMI_HPD */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c1_gpio: i2c1gpiogrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C1_SDA__GPIO5_IO15	0x1e2
> > > +			MX8MP_IOMUXC_I2C1_SCL__GPIO5_IO14	0x1e2
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c1: i2c1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA		0x400001c2	/*
> > > I2C1_SDA_DNU */
> > > +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL		0x400001c2	/*
> > > I2C1_SCL_DNU */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c2_gpio: i2c2gpiogrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17	0x1e2
> > > +			MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16	0x1e2
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c2: i2c2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA		0x400001c2	/*
> > > I2C2_SDA */
> > > +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2	/*
> > > I2C2_SCL */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c3_gpio: i2c3gpiogrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C3_SDA__GPIO5_IO19	0x1e2
> > > +			MX8MP_IOMUXC_I2C3_SCL__GPIO5_IO18	0x1e2
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c3: i2c3grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA		0x400001c2	/*
> > > I2C3_SDA */
> > > +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL		0x400001c2	/*
> > > I2C3_SCL */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c5_gpio: i2c5gpiogrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SPDIF_RX__GPIO5_IO04	0x1e2
> > > +			MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x1e2
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c5: i2c5grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SPDIF_RX__I2C5_SDA		0x400001c2	/*
> > > I2C4_SDA */
> > > +			MX8MP_IOMUXC_SAI5_RXD0__I2C5_SCL	0x400001c2	/* I2C4_SCL */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c6_gpio: i2c6gpiogrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI5_RXC__GPIO3_IO20	0x1e2
> > > +			MX8MP_IOMUXC_SAI5_RXFS__GPIO3_IO19	0x1e2
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_i2c6: i2c6grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA		0x400001c2	/*
> > > I2C5_SDA */
> > > +			MX8MP_IOMUXC_SAI5_RXFS__I2C6_SCL	0x400001c2	/* I2C5_SCL */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pcie0: pcie0grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B	0x10	/* PCIE1_nCLKREQ */
> > > +			MX8MP_IOMUXC_GPIO1_IO08__GPIO1_IO08     0x40	/* PCIE1_nPERST */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pmic: pmicirqgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18	0x140
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pwm1: pwm1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO01__PWM1_OUT	0x106	/* PWM1 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pwm2: pwm2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO09__PWM2_OUT	0x106	/* PWM2 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pwm3: pwm3grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SPDIF_TX__PWM3_OUT		0x106	/* PWM3 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_pwm4: pwm4grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI3_MCLK__PWM4_OUT	0x106	/* PWM4 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19    0x40
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_sai5: sai5grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI5_MCLK__AUDIOMIX_SAI5_MCLK	0x106	/* SAI1_MCLK */
> > > +			MX8MP_IOMUXC_SAI3_RXFS__AUDIOMIX_SAI5_RX_SYNC	0x106	/* SAI1_RX_SYNC
> > > */
> > > +			MX8MP_IOMUXC_SAI3_RXC__AUDIOMIX_SAI5_RX_BCLK	0x106	/* SAI1_RX_BCLK
> > > */
> > > +			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI5_RX_DATA00	0x106	/* SAI1_RX_DATA
> > > */
> > > +			MX8MP_IOMUXC_SAI5_RXD1__AUDIOMIX_SAI5_TX_SYNC	0x106	/* SAI1_TX_SYNC
> > > */
> > > +			MX8MP_IOMUXC_SAI5_RXD2__AUDIOMIX_SAI5_TX_BCLK	0x106	/* SAI1_TX_BCLK
> > > */
> > > +			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI5_TX_DATA00	0x106	/*
> > > SAI1_TX_DATA */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_ecspi1: spi1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_ECSPI1_SCLK__ECSPI1_SCLK	0x82	/* SPI1_SCLK */
> > > +			MX8MP_IOMUXC_ECSPI1_MOSI__ECSPI1_MOSI	0x82	/* SPI1_MOSI */
> > > +			MX8MP_IOMUXC_ECSPI1_MISO__ECSPI1_MISO	0x82	/* SPI1_MISO */
> > > +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09	0x106	/* SPI1_CS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_ecspi2: spi2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK	0x82	/* SPI2_SCLK */
> > > +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI	0x82	/* SPI2_MOSI */
> > > +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO	0x82	/* SPI2_MISO */
> > > +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13	0x106     /* SPI2_CS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_ecspi3: spi3grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_UART1_RXD__ECSPI3_SCLK	0x82	/* SPI3_SCLK */
> > > +			MX8MP_IOMUXC_UART1_TXD__ECSPI3_MOSI	0x82	/* SPI3_MOSI */
> > > +			MX8MP_IOMUXC_UART2_RXD__ECSPI3_MISO	0x82	/* SPI3_MISO */
> > > +			MX8MP_IOMUXC_UART2_RXD__GPIO5_IO24	0x106     /* SPI3_CS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_uart2: uart2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SAI3_TXC__UART2_DTE_RX	0x140	/* UART2_RXD */
> > > +			MX8MP_IOMUXC_SAI3_TXFS__UART2_DTE_TX	0x140	/* UART2_TXD */
> > > +			MX8MP_IOMUXC_SD1_DATA5__UART2_DTE_RTS	0x140	/* UART2_RTS */
> > > +			MX8MP_IOMUXC_SD1_DATA4__UART2_DTE_CTS	0x140	/* UART2_CTS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_uart3: uart3grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SD1_DATA6__UART3_DTE_RX	0x140	/* UART1_RXD */
> > > +			MX8MP_IOMUXC_SD1_DATA7__UART3_DTE_TX	0x140	/* UART1_TXD */
> > > +			MX8MP_IOMUXC_SD1_STROBE__UART3_DTE_RTS	0x140	/* UART1_RTS */
> > > +			MX8MP_IOMUXC_SD1_RESET_B__UART3_DTE_CTS	0x140	/* UART1_CTS */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_uart4: uart4grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX	0x140	/* UART3_RXD */
> > > +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX	0x140	/* UART3_TXD */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usb0: usb0grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO12__USB1_OTG_PWR	0x106	/* USB1_PWR_EN */
> > > +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC	0x106	/* USB1_OC */
> > > +			MX8MP_IOMUXC_GPIO1_IO10__USB1_OTG_ID	0x106	/* USB1_ID */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usb1: usb1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO14__USB2_OTG_PWR	0x106	/* USB2_PWR_EN */
> > > +			MX8MP_IOMUXC_GPIO1_IO15__USB2_OTG_OC	0x106	/* USB2_OC */
> > > +			MX8MP_IOMUXC_GPIO1_IO11__USB2_OTG_ID	0x106	/* USB2_ID */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc1: usdhc1grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO07__USDHC1_WP	0x106	/* SDIO_WP */
> > > +			MX8MP_IOMUXC_GPIO1_IO06__USDHC1_CD_B	0x106	/* SDIO_CD */
> > > +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x106	/* SDIO_CLK */
> > > +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x106	/* SDIO_CLK */
> > > +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x106	/* SDIO_DATA0 */
> > > +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x106	/* SDIO_DATA1 */
> > > +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x106	/* SDIO_DATA2 */
> > > +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x106	/* SDIO_DATA3 */
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc2: usdhc2grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
> > > +			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
> > > +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190	/* SDCARD_CLK */
> > > +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0	/* SDCARD_CMD */
> > > +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0	/* SDCARD_DATA0 */
> > > +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0	/* SDCARD_DATA1 */
> > > +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0	/* SDCARD_DATA2 */
> > > +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0	/* SDCARD_DATA3 */
> > > +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
> > > +			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
> > > +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194	/* SDCARD_CLK */
> > > +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4	/* SDCARD_CMD */
> > > +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4	/* SDCARD_DATA0 */
> > > +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4	/* SDCARD_DATA1 */
> > > +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4	/* SDCARD_DATA2 */
> > > +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4	/* SDCARD_DATA3 */
> > > +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B	0x40	/* SDCARD_CD */
> > > +			MX8MP_IOMUXC_SD2_WP__USDHC2_WP		0x40	/* SDCARD_WP */
> > > +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196	/* SDCARD_CLK */
> > > +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6	/* SDCARD_CMD */
> > > +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6	/* SDCARD_DATA0 */
> > > +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6	/* SDCARD_DATA1 */
> > > +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6	/* SDCARD_DATA2 */
> > > +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6	/* SDCARD_DATA3 */
> > > +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc3: usdhc3grp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
> > > +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
> > > +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
> > > +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
> > > +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
> > > +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
> > > +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
> > > +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
> > > +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
> > > +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
> > > +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
> > > +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
> > > +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
> > > +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
> > > +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
> > > +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
> > > +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
> > > +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
> > > +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
> > > +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
> > > +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
> > > +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d2
> > > +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d2
> > > +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d2
> > > +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d2
> > > +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d2
> > > +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d2
> > > +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d2
> > > +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d2
> > > +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
> > > +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
> > > +		>;
> > > +	};
> > > +
> > > +	pinctrl_wdog: wdoggrp {
> > > +		fsl,pins = <
> > > +			MX8MP_IOMUXC_GPIO1_IO02__WDOG1_WDOG_B	0xe6
> > > +		>;
> > > +	};
> > > +};
> > > +
> > > +&pcie { /* PCIE1 */
> > > +	pinctrl-0 = <&pinctrl_pcie0>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&pwm1 { /* PWM1 */
> > > +	pinctrl-0 = <&pinctrl_pwm1>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&pwm2 { /* PWM2 */
> > > +	pinctrl-0 = <&pinctrl_pwm2>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&pwm3 { /* PWM3 */
> > > +	pinctrl-0 = <&pinctrl_pwm3>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&pwm4 { /* PWM4 */
> > > +	pinctrl-0 = <&pinctrl_pwm4>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&sai5 { /* SAI1 */
> > > +	pinctrl-0 = <&pinctrl_sai5>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&uart2 { /* UART2 */
> > > +	pinctrl-0 = <&pinctrl_uart2>;
> > > +	pinctrl-names = "default";
> > > +	fsl,dte-mode;
> > > +};
> > > +
> > > +&uart3 { /* UART1 */
> > > +	pinctrl-0 = <&pinctrl_uart3>;
> > > +	pinctrl-names = "default";
> > > +	fsl,dte-mode;
> > > +};
> > > +
> > > +&uart4 { /* UART3 */
> > > +	pinctrl-0 = <&pinctrl_uart4>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&usb3_0 { /* USB1 */
> > > +	pinctrl-0 = <&pinctrl_usb0>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&usb3_1 { /* USB2 */
> > > +	pinctrl-0 = <&pinctrl_usb1>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&usdhc1 { /* SDIO */
> > > +	pinctrl-0 = <&pinctrl_usdhc1>;
> > > +	pinctrl-names = "default";
> > > +};
> > > +
> > > +&usdhc2 { /* SDCARD */
> > > +	pinctrl-0 = <&pinctrl_usdhc2>;
> > > +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> > > +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> > > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +	sd-uhs-sdr104;
> > > +	vmmc-supply = <&reg_usdhc2_vmmc>;
> > > +	vqmmc-supply = <&ldo5>;
> > > +};
> > > +
> > > +/* eMMC */
> > > +&usdhc3 {
> > > +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3_ROOT>;
> > > +	assigned-clock-rates = <400000000>;
> > > +	bus-width = <8>;
> > > +	non-removable;
> > > +	pinctrl-0 = <&pinctrl_usdhc3>;
> > > +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> > > +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> > > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&wdog1 {
> > > +	pinctrl-0 = <&pinctrl_wdog>;
> > > +	pinctrl-names = "default";
> > > +	fsl,ext-reset-output;
> > > +	status = "okay";
> > > +};
> > >
> > > --
> > > 2.49.0
> > >
