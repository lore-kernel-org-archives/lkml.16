Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2084.outbound.protection.outlook.com [40.107.247.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2C7186E20;
	Thu, 27 Mar 2025 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743088901; cv=fail; b=qVlP3ZfQ9eiVhh0eejjzspod9Unw2xCjNlJIBY3ATaJrFfx1CeVrYHwUfTqXYL5Ms26rL7pURsmCfExXQWjGvM+Ue8R+YjP1DrkHIFG9O/XCA2oyGceCbgJXGipDBoycP4MC6mitvAa/y36MeYB/kNbsUqOlzEoIH+W0xgbcOqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743088901; c=relaxed/simple;
	bh=L3aAl5qafFui9Uh+9GuVzFlcxvg+2BEHL8+RFdmYtAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OFtBS7320Ov/GWkqhcrH3K5x6Ce0fA5krEmqyg3Rd7j9zioeVu83AD06qivI82jK7IXLS8+ZK6XsgrvRSiMErw8kIm0S5p32ivj9pp6kJzFay6RBwITVmAZcSE87UcDF2lm3tBYT/lMBB9XjvkFb7ydoU3ovoIMgIzIeHDl7CTg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cTee4ugP reason="signature verification failed"; arc=fail smtp.client-ip=40.107.247.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cTee4ugP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zVQcgGzkfHTcsAgVXuA+Al+fJ0/l/Wu7HKCDE3FlgVqfdM9Y4Rfi11AIVfhqHX8IA6H76vPAOXZYxRqSjOLxSc2G8BNYV1tI4WAdtuyOYfbPiC+CXMcAuyhPeOpsEdAuFGHMXbgeEtR30gwJ4cJNdT2eKXvoIbSIEqscERDaNqyTtPVfF6S648idPkRvuwmGrOjfNWBAYLy3ZcoxMraEZ/oVVwEvpZ/eKaYUk6lB/HbMCagQNOkD31/AEQankEX5ZrZjPpD6OEVBh/sn/3Apb1gE2XuVmkXgFz1qCUKGrRgEdAe0PpkzXvhdyKyXqBxcyDD1hU3pfMM0r5qr5noHWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9hLclD9DLP6KWsSe5bMaW+OXEPHj1lWFPbKX8/K76Dk=;
 b=IaFtGtneuWKIlLs1Za1BNyp3l9R2eG84KlvHyUxwk6MWdMqj30XYhK09b0sPMudbsppxXpfsaR+qQvh+GioDSBc0WAwSMwKcd1pMT1ZCGyEkxq9SD16ARyGoQHRD80XjZj+I84yhBz4uvMze6oTZq452aUgLjUdH6YAVHkvyTa2C7vveCP9GmsVS5g+EM5muUAk47nNNLAFNxToys95lMQnn1oDzOPCtj7xQfiplkLtFplcz7BTjvh6BJJy678u/7wzIl88HC6L4uuJ4vsnx/LffPxenN23lEbP3VSWLY7eAD18VisHWMWxcpudTcQBThEfFToFY/+lXmz+Y7vWM6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hLclD9DLP6KWsSe5bMaW+OXEPHj1lWFPbKX8/K76Dk=;
 b=cTee4ugP+hcxd8aYZZ6WjmhihGyRzF9Y8GHi3XInmAvApYrSJsrI+togxfQvVXn0PIlofMHZ4dTUx77r3oO9BLw1LxXaB+Qolb5+QDRsAh/1F6jRdxiwsYCi/3+CYvvOsG8dGDJgengpcyiNDoYg4SmOCmUki9/FzrTmbuzxRVnaRQUMXeNPR3dGomiD3O9mmQdWnPNxgJo5YZqd8g6c03OPwhIECFTqRivf5OtSwLP8uGe/7Q6lXob1WfJ/osP1eox47l+LBrgnfK1pbzfBjAgssENTHCWsWo1UCIyiN26bsIAY63Iqa4Dru1sokjP4GuXA5LayU5VqAi07F2CxVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9896.eurprd04.prod.outlook.com (2603:10a6:20b:67d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 15:21:37 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%3]) with mapi id 15.20.8534.040; Thu, 27 Mar 2025
 15:21:36 +0000
Date: Thu, 27 Mar 2025 11:21:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] TQMLS102xA: New display overlays and small fixes
Message-ID: <Z+Vs+pHZs2fMP/p3@lizhi-Precision-Tower-5810>
References: <20250327144118.504260-1-alexander.stein@ew.tq-group.com>
 <Z+VmonrbclCB3zVh@lizhi-Precision-Tower-5810>
 <2223114.irdbgypaU6@steina-w>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2223114.irdbgypaU6@steina-w>
X-ClientProxiedBy: PH7PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:510:339::10) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9896:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d704a6c-e97b-4d01-4bae-08dd6d431098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?UEp0+xj12DruOYIOQ0zVb+rxWGP7Sn+fDmcLqfqcne2NvAGIRn4arFxvFw?=
 =?iso-8859-1?Q?JXqUasUKhAoGut4LxISIGmyiVANRmDxmNwHOy11V9vyIKANCdiOow4Ij8N?=
 =?iso-8859-1?Q?4tGl8Eyu0xY9xu3rWnaiOZ73Wi1AFkrcKXDmNy6LPG+u3vwdjDmMeRwlzt?=
 =?iso-8859-1?Q?03vTjMLW5i3K/CQw31TZGXWMg5lPd3pmBLMpZ/e3BeMJcQmDgbb1bfqxOj?=
 =?iso-8859-1?Q?RxoiHTCCHOFHWuAy8JTwPZJoselWyJYqnVjIdyc+tjWny1wZkBcIqyvUj0?=
 =?iso-8859-1?Q?fLefsnvBcJMpVsuluShEjDbPnXPDuCp6bZd4+W2r62diTqf18HBWJwtB0l?=
 =?iso-8859-1?Q?dHki9JBWYwwN0bqIf7CNMAwfUtdgV5nKZwbL8owc4wLQ2pSvVNKDNJMd0U?=
 =?iso-8859-1?Q?XkfMWrrrLtB+D6Lm1I945kbQKp9zOXNJRRf4WbGENumK4LpHrJBrYtZuGi?=
 =?iso-8859-1?Q?ipbx2ptYos3Y9YEtnRm539YU7Y1Mf9RQyTFmBawll+KxSl93nvt8HDQ4lA?=
 =?iso-8859-1?Q?R5VGtDVMi3Txr+beH+Mi4+BWAlqJ355Ce5U2j6bZtIW4zSKYFpcmi9vemZ?=
 =?iso-8859-1?Q?8YRM8OnasFZ/y20t5I/6915J6Ouy7+AdwZjHJxY3N6tcOKh6mFS/J/Mn+E?=
 =?iso-8859-1?Q?UFy7VCB+gEyzl/7tt1Y1+syW6RUlz5NNnljFR8QQNCF/csr3PajQW/pyPS?=
 =?iso-8859-1?Q?3IrceNYsQN1xD+/7k8qDwWVg++cf6TMpsrFOgRadY+bmii/DHr6q6zFzLK?=
 =?iso-8859-1?Q?5G/0F+0VFK4rNKRs0zUNKrpz2bH3TRxOaxLE6IeiuHv01PD35/7oaI+5B7?=
 =?iso-8859-1?Q?zeP6G/phKqpGnHGalsQCyrGfngNf67iEa7E9epF1GA/sjkSZ3x0pVXwB6g?=
 =?iso-8859-1?Q?flTufl0ODX0VwLSD07LYgWWoka2zIwW/iExWTxjuTgZgG5KJ4RyeZx4ocI?=
 =?iso-8859-1?Q?2xzaooBuGXvuXYlwwJfRaf0XK3ZYd7dBc9SkAEJ12UEdSRZulPkMToKtyj?=
 =?iso-8859-1?Q?G6Uc1ynbE9lb6gPyb8zQuNrQ/F/GSgzocA1BcQlPuUISqSn738NLs6R/a7?=
 =?iso-8859-1?Q?GUz4EhfLU7rlFYoYD34GjxgrCqnqhMEIcrnyzI7mIDlrVGq/UVwZ8WXU6M?=
 =?iso-8859-1?Q?4iEs1qX+tTxsVHcg1/b6G6JQwQ6ZNnY8XGyM1gL2rNULVYUUzepilU0MNh?=
 =?iso-8859-1?Q?kCMCMfEqcRKI30o9XljbcJthIDnvwM8ElG7SHI6v1ras7eTEZ013jjsipc?=
 =?iso-8859-1?Q?IL385g6oZUNfQ3LyzJXVlDbVTiZe/1x8TWhXh/Bff9zK2GDcMrUp2m3nLY?=
 =?iso-8859-1?Q?XaQLM3vDFI0tSItdfmFuBEOzlLqQinwoog5JG38p+VXuGGgyMjb8CMeOdS?=
 =?iso-8859-1?Q?tCNnG9R/6xbnP4j6561XqcGkCtN7n3YCOFmxaHJgrk6vATtWG03Il4FE/5?=
 =?iso-8859-1?Q?gurSkwjFs56j4ZvH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?weoQb5xdoNtQ0dIVjacl19MKHflYbT4tyYpJYXHqqFEyO2uYkT+D3fmePM?=
 =?iso-8859-1?Q?GaclUuYCumNGhwsyoioHlICDbz0I0BQ44hNQgQRb151zNCIf98hiJ6wYv4?=
 =?iso-8859-1?Q?YwQuCjWtASTDEucYs8p6FoTc5/FeUMKkRi+V4MeQd4UFsLuhI/aDI4uPY/?=
 =?iso-8859-1?Q?TQzi0q3oJUmy9fAo6UlATf9/6gCCPMGNr34kwGLwr5SExoRfHj5678pZX6?=
 =?iso-8859-1?Q?7FBYy7BoUzzsZUNywGtttO4MUS1AaDubLvIoeZWbYxM81hYGnGYdLKX4RS?=
 =?iso-8859-1?Q?3JEdtJ50jdFDjDS3Es/Y+2MS/9U5eQpGqOQ2Yx44grfN3mO+TNbteRHduc?=
 =?iso-8859-1?Q?y3vVd/R4gEHoWy8pXsGUUBzZllLiRQ58p7VoSs9kBQujOA6pfylaArLWSi?=
 =?iso-8859-1?Q?IXYP3H6FAj6vs41ARJaQMfsGuWPak23+S3xz0N/fALRpZBIKzk3ktNKMTV?=
 =?iso-8859-1?Q?CX8j1SxSTupnkaM5E53AjvlpQxOORY/tKdINnYTXkykZ6Vk0XM758LL8Dw?=
 =?iso-8859-1?Q?B+hgw2YSdvj7ciGzLvG6NuBfxSHxknkoGYpXazVlw6PjeTayZWTvS/m9pl?=
 =?iso-8859-1?Q?0+CnWLIxDWITowJ9BPGuCfK+n/4RHwHGrLdvTfPiTeMHVJZoTxfl9VIzZ/?=
 =?iso-8859-1?Q?BfFNEtuJ536bI8EHoaDEtQQCnt2/40RMLPwpkUwRFpqA39rrelphYAsM5t?=
 =?iso-8859-1?Q?9HeJh5OEZ3A4a3L+z8P600rE/sBeCOfsElcFF6lKq4GoKhODLEn86Mvl4E?=
 =?iso-8859-1?Q?t90QyfAUWrgXTVl93YEPutePRvkViWbayBnkv6yVDSDY30Mc/wfH38O+LD?=
 =?iso-8859-1?Q?3PlMsSZGbOpk2T3d70wkDsK9AwE+mvLUorolf1n/PCRmwUks0SB7QNEU53?=
 =?iso-8859-1?Q?5ZMGyW7e6YaVpwUEq4hGK3f1g/Wgjn8Fq8K7Cyyed5o8Y/dwaeM0q3uQPL?=
 =?iso-8859-1?Q?lXENH7cGXxZH8d2FvW+DRKglDhtQRbkhuAhrKpe8JpqAbYNbQly0HUoQoj?=
 =?iso-8859-1?Q?i8VHqLiIxI84DuTyE7Kiu42V9hAaHJwp6N/Ud3/5/+dHwxUBfQ+2M0VAoS?=
 =?iso-8859-1?Q?epI9DKzVwY7tCmg7tQYQuqZK600jUFJCvPpp5mEZnb7HgfVkHzjZAX235F?=
 =?iso-8859-1?Q?UYuMygHKKabH1cQBwcmGM2HO1iqIyZfBpBAW/CGw3lS16t8BkU1ErUp8z1?=
 =?iso-8859-1?Q?2Ic7jWOa8PfdUsc4JZVh7kOETajj1AEhI20EfIjXmNTx8GuoT2MPoYEkFz?=
 =?iso-8859-1?Q?duxlG0iETJlWxMbHc47SCz9YbaXMgXf5EbNTtVHo1RNh8pjM89YeFZjNF9?=
 =?iso-8859-1?Q?tJehQIhXRL/eKTcfhU6Vo0n7H6EJM0dKzUtO+VdQXjt7orF1LKNIIPjFAZ?=
 =?iso-8859-1?Q?8yy14QXFWHDpmn1o8LwpKEUcSqTtieZkbZH6sF7JDhpejrHBHZjHLzDxBX?=
 =?iso-8859-1?Q?xSYOOnF+SEJilNJAOvwm5o1uf0lQMKge8zMgVj9Zr+bg3ZQ7PnHgePjSlD?=
 =?iso-8859-1?Q?R4ZIRzi5bI2yRxYne1C+C5iP1L/kgIrfVdZ2M0vT0sYKfMdSG4gx0Hzds6?=
 =?iso-8859-1?Q?fI8x9JvlMKgmZ+94M2f2VS4EUD/bwT6LWgSA5Rvukq+HDqlwvqa5nhYiaF?=
 =?iso-8859-1?Q?v63GD6xYVIcC5Go1iBOHUWGrjIvR0zZyWI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d704a6c-e97b-4d01-4bae-08dd6d431098
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 15:21:36.7163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsHuufpAyCGpQJaSu6loDQ/MgC6tqCUM0e4AzR0rZ7B0fdFwp6aQf44daRsieLZSj9CAOlJhJs+k7UJL8LzSXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9896

On Thu, Mar 27, 2025 at 04:14:53PM +0100, Alexander Stein wrote:
> Hi Frank,
>
> thanks for the review.
>
> Am Donnerstag, 27. März 2025, 15:54:26 CET schrieb Frank Li:
> > On Thu, Mar 27, 2025 at 03:41:06PM +0100, Alexander Stein wrote:
> > > Hi,
> > >
> > > this series adds several display overlays for HDMI, LVDS and RGB displays.
> > > Additionally it fixes the license header and updates the sound card model
> > > name similar to i.MX based platforms by TQ.
> >
> > Next time please cc imx@lists.linux.dev for layerscape platform change.
>
> I only followed the entries from get_maintainer.pl. Would you mind adding
> arch/arm/boot/dts/nxp/ls to MAINTAINERS?

I think all under arch/arm/boot/dts/nxp/ should include imx@lists.linux.dev

Now imx team maintain layerscape platform also.

Frank

>
> Thanks and best regards,
> Alexander
>
> > Frank
> > >
> > > Best regards,
> > > Alexander
> > >
> > > Alexander Stein (7):
> > >   ARM: dts: ls1021a-tqmals1021a: Fix license
> > >   ARM: dts: ls1021a-tqmals1021a: Add vcc-supply for spi-nor
> > >   ARM: dts: ls1021a-tqmals1021a: Add HDMI overlay
> > >   ARM: dts: ls1021a-tqmals1021a: Add LVDS overlay for Tianma TM070JVGH33
> > >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech FC21 RGB display
> > >   ARM: dts: ls1021a-tqmals1021a: Add overlay for CDTech DC44 RGB display
> > >   ARM: dts: ls1021a-tqmals1021a: change sound card model name
> > >
> > >  arch/arm/boot/dts/nxp/ls/Makefile             |  9 +++
> > >  .../ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso | 32 +++++++++++
> > >  ...tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso | 47 ++++++++++++++++
> > >  ...-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso | 55 ++++++++++++++++++
> > >  ...-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso | 56 +++++++++++++++++++
> > >  .../nxp/ls/ls1021a-tqmls1021a-mbls1021a.dts   |  5 +-
> > >  .../boot/dts/nxp/ls/ls1021a-tqmls1021a.dtsi   |  3 +-
> > >  7 files changed, 204 insertions(+), 3 deletions(-)
> > >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-hdmi.dtso
> > >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-lvds-tm070jvhg33.dtso
> > >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-dc44.dtso
> > >  create mode 100644 arch/arm/boot/dts/nxp/ls/ls1021a-tqmls1021a-mbls1021a-rgb-cdtech-fc21.dtso
> > >
> > > --
> > > 2.43.0
> > >
> >
>
>
> --
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> http://www.tq-group.com/
>
>
