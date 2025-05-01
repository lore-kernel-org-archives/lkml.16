Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013052.outbound.protection.outlook.com [40.107.159.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887D31D5CFE;
	Thu,  1 May 2025 07:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746082889; cv=fail; b=DkSxs6cok71hTXvFpIrcyMWLUOig02U/IShggfBg7TDK5L3PUOZuWLbHYogWhDX89/kGB8fYceVlgETcYSanyq0ixZ7wvMJwiDxyB/v2xBPlpF3zov9CWJSuvYZ42mmZp+31GUdkt+WfES2eVxKW028DbVgT1ewYdECq7GC3DD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746082889; c=relaxed/simple;
	bh=Z1f4QXWbEqD/czbzvKZpPlK56z77w3+e0vhDoC/t0XA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MdgMW3NaHRl6/sV8qrX9xXWdMM03mltNqf9TUiMulLlYcbrAlMHgmSqTxvnCPDCp4UI0KDBw/INN86GTMwDETKYdeffD3my808pgxlQghOkgF7odesMfVtGD1M01ARodh00WjCXYOIQvG3cwargh2RRE9bCyUuDl65YKK4Ooqw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=J065EsS5; arc=fail smtp.client-ip=40.107.159.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="J065EsS5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bl1857Y1fXkPipcI4rZODsYM9i+n3/MLXu83qBXRJfZNEItKTDvH65Xu6yMwFj9vFFYsXOw4GDm0lSWJ/W4OY+P9Hh7qysKyHqqPMYTR2BTmwNno62nWxOIl62GJ2vitHPymGd4FRQD9R/6lxM3iZojrDkic4yatfkJ5PUtftl+S60hgap53G0Uu8AG6HifLXRY6Y3clkDfpezO9F0nUR332zZ3Ftl8bRFSh5mskkYVT86DD0Pdw+y/Eha3fPixweKaYwlH+R1lV+blLHrKR6yNE7jRIdt5Ps6j7cqfvdd5ESBv0gkjOWhVw1FwcaYbro5rvResIPG7+KbZ8Z3zxeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HD0bjDZudLjLh9XR3iIC9M2RrNF16VDTvMEZ2MwcN8Y=;
 b=cZ3nNkkCyIhdugKNN5xRjnBG1cWS2vgvXHV8Epxdw/K4vWrDcs6Vemrg+47h8SH18AJj1bt52AdMhBRF0bvh6lOD20keYMu0eWWYIAsUs7fA5hIlVwUlyIm1hEBxmnT3rc2hzGZKrJlSKN58Udb2J3Btd1kwwcRLKi5OjHDBQI/Rg5LvC9ixuEIuWVAIE6Rb0MhC85ASVO4B1G7P5f40YlZjZnzER1XpmD7e0TKx6Hn5kskQd42Bl+hcvxdalcDz0cUEBvKtylh/V5XcBjQE1g5BOJvr1Xs2ha20cxbl7rX0H1XFl3BOGwQw/aolLVKRvJJg4ULRsOt4C9zf10JAPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HD0bjDZudLjLh9XR3iIC9M2RrNF16VDTvMEZ2MwcN8Y=;
 b=J065EsS5Pqb3QbaQKyPcuWMF3ZAgBvQenH8QPTtH4IVslHa60Dj5fYyCNOREq04bsaz/OF91QAfYy8Vu2QJj0lfrS/5lcwqkL8/lGs08NWW2Q0k621lJrPiOaMKLqD99R48TXmmWFRRFAL397LdTBcePjU/SdZ0C10jLSOUHH03BHOVnX4GeeRglIEOuljcQASM1+A1jVDLKImPqQwd8JMrJXEa5OX2LPIpuUSqXAsc/h2A5nPio6sOjuSeDsNZY9P1Twqv/i/QXWbxvYcxIfw3QkSSacXQDxh4w+FhVxWexXaS2C1vUWDugCgeLnh7npYRsGJALs3KzbqV00QnpGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by GVXPR04MB10921.eurprd04.prod.outlook.com (2603:10a6:150:227::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.20; Thu, 1 May
 2025 07:01:23 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.019; Thu, 1 May 2025
 07:01:23 +0000
Date: Thu, 1 May 2025 10:01:20 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 0/6] mfd: simple-mfd-i2c: add QIXIS CPLD support
Message-ID: <kjpv6qum4myjipq4opqsynnyycjxjdw3nl4eksp2gtoiryvvq5@2fs7joeenkde>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <174607289976.949416.5265834490992116431.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174607289976.949416.5265834490992116431.robh@kernel.org>
X-ClientProxiedBy: AM0PR06CA0101.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::42) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|GVXPR04MB10921:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ae38bc-cae8-43d3-9898-08dd887dfb78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GmwxDOGZiYYww+MPYwbAnAxtVtKVmwGfB/9IrZaQ6OfbUMKbMj7LBILteaf0?=
 =?us-ascii?Q?PL1rXLgt3MpzcXiSF4lk4qq6LCAKaFjI+uzggMqeYu5eV0EOnE29kCD8b2E1?=
 =?us-ascii?Q?TSmjVu63u7ZAmLmnpZ+FuKonyHCj3FppfJmb8GmmKas4PBkUwqlBhrenVumX?=
 =?us-ascii?Q?AK8S0IzJrQsIAP+7uvCPWcD2JYlMdqvHPjx0twPrEGftMV4ZegBkwocLnHHQ?=
 =?us-ascii?Q?kggNbrdvbtqqVl89sp6QqiTwIJUiNz/OSuwqz/C4DdrqPGCsyzwO/Y3JUMB7?=
 =?us-ascii?Q?2Oe+dk8BvmKNkxkjzDN5g9Vxdb07CSxoBNd9k90HHaluGBo4dgoT7FoGSael?=
 =?us-ascii?Q?3tdlHr3pPadHUxdpcS2+6fcfUBr1z1g3n8Vulh25+zcmslJWP7h8NywDTFTQ?=
 =?us-ascii?Q?bBTvgeb9nRtpcgNkqgnFIyG6eF6KH/3rELfI+Ol8E9Ee5eKdhr6/79yoFJFh?=
 =?us-ascii?Q?e+S8024Oeb0P2h65VbBGjKRpFVQ2HMrsU1LOS14h3ixgvaONWvJ0Wd1vHump?=
 =?us-ascii?Q?ujIqZtgveD+1TwNNZderbGTns4BGsZoG/P6Bh7Syg2KpLcX2Y2ihbNfuGEVo?=
 =?us-ascii?Q?QzCc1TESgXiIOr706KNeAxaCKjkk4GcqOBoYo5RCflWufLuJU2Q7779YyJA+?=
 =?us-ascii?Q?QbbgyaodwZVDqfTXrB+Qz91Ps27tVvk+IEZDc5OKC/b43u5Z3BTiLJNMR46E?=
 =?us-ascii?Q?f/0GcSHFKR+FIewo2YuST+Fc2aAVMpRYlJ1G62Ya4tkDwcwG3jqSwGg6es2x?=
 =?us-ascii?Q?eX+6EbRP3NcutOIg9J6vG0aRoa9iMEjhltMB5FLx1PlnKdv9DArmDduR985X?=
 =?us-ascii?Q?4XHQo958Zfb0nKEQm53E2KChxAYtaZvn4u6nZpx2eQSDo4OizaC+Ga9lT5Vd?=
 =?us-ascii?Q?AHpqILKYIT87OJrQkLmSbJ033ca1894ELDaZRL1TWx4tm8xevOXNYwkv6Xfi?=
 =?us-ascii?Q?ruAOJCOSDJ1m8KyanSVui91kdGLxJJVtZdn9+7tuBSzHsVZwr4MCM3lQukZe?=
 =?us-ascii?Q?jLLX+z1xZvj1gXqhO0hwc4GuylpXFf632cSBGmF60HbQOkFCZEpwUmujE3P5?=
 =?us-ascii?Q?sZoONJ9Aagpt1pOGHcSRkEer6XGfV5v+/53dW/kuufrhI7P1CHIJtuDQmzjp?=
 =?us-ascii?Q?Oj0EVOTGUl+ECswH1gBUSq4p2xwvB6KaFYzauAv+c1wiYD4jpSm+sHOJp3Ti?=
 =?us-ascii?Q?UbFPrIx3b43jhFwumnO3L4YZwFbvrtaWmSPhmgX2l6K/UM29ZpPWFfTI9HIs?=
 =?us-ascii?Q?bOO9l8ZtfN4gurBj8S5YbgjTysAJgA1S6OYVnubZjxN7cjbU34dEaUEkl8Vp?=
 =?us-ascii?Q?WYqTsEPc0cXxZLv78F5jVlFY9m0vJSRG3EFpslTMU2CQG7p1Ff5O3Go2iR9f?=
 =?us-ascii?Q?x2IDPTKfysHpEJDlwwJMudVyzW3Rnc6ZqVZXuDqA576RMJwNyDlwIhntcOg8?=
 =?us-ascii?Q?FM3NQ+d8nxI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bq4+2wFJgqfYORCnu/WbL5cN6zLKnTBjOwhkr/5ERF/WVJE0fo2dZF7tch7F?=
 =?us-ascii?Q?o6ZnzCkXBOkOOGa9VN0Gtdli/d0Lw5kktNywm5T35NS/pPH62LIVCsnk5JBh?=
 =?us-ascii?Q?fL72HGtbsFPwaZpTB2trvThOHgiIZr1W4lbVRXyFhrtTTTjFiiy/oAglEc1w?=
 =?us-ascii?Q?iqAljQ9LzLVxrcWBcQidwys8sXpzLTdj7brEcwElU9UDI2C3TSYM3QIwxAoD?=
 =?us-ascii?Q?qaP6uY1fNchINhPoHm0URrfWnKX+OyGSM4297xB8/alsWZNxy64kLW1KvuPo?=
 =?us-ascii?Q?eDZhzx/i1ansW+fHV8Eo/VmmT/c8l4K3Wf1r05ds3EGlQE6nllA7WXeICBQi?=
 =?us-ascii?Q?U5hBk2kaAJo+rwo1GNozZ7dSrPCVHo24tTpHeCIyYu8WKlaO14tLTN1GXzAS?=
 =?us-ascii?Q?hVmc9DkvExsYdx0LFfu1t/5uC0ZH+Uk5qtMDvgEmG1HwwUZ760GzDnvNoUGO?=
 =?us-ascii?Q?mNdHoRGQ2lJ8xEhLEe0e2f/+pBHX3ldOQmXNlqajz2CRJOavuhdiWY7wx2S8?=
 =?us-ascii?Q?fZGGhGLfe6zE1BQgDdQzGQHPpq/lDRvY3sGHoe0iAgCkAia08J3dKj7H6pX2?=
 =?us-ascii?Q?PeyptZiLS3uLZ5iFEfGScVr2MWzGcoysc0edrscHUjlFAoqMeRrecTWyFCI/?=
 =?us-ascii?Q?L328dqGW7tTnE6UdPDUb1ZLz6TcvPzKHyUcceywcYon9CcR+NIJcgGiir1Ph?=
 =?us-ascii?Q?LltaOEKqSoCRRZqmbHK5t7/C043laKnMJCSXftJNeC5m7aQl63Ju/sRzHgXj?=
 =?us-ascii?Q?YLYL+ESbCIAlTfafZBI5sK7d1VGkPMi1CtvkNt3lpjR5HPjlimw/MTHrIsan?=
 =?us-ascii?Q?dpprLggjgmF1ASzNRUjFI6UEzLMX1tJuyvW2aj2tAwqVuTqRUGLTktLtkeUV?=
 =?us-ascii?Q?i9SuzxPSdXJCjrjSQhLr162tm6RU9J9/PcBc63Nxp2DtG3G8mfvf29w7bR8y?=
 =?us-ascii?Q?UL+CdzpgpxYEiSiOWT10017g2PNt/oWWLF0nHtefEp/uyUEZ7L6rdT26wesP?=
 =?us-ascii?Q?Vggd4qyl83r5GKDD3iohyZLclGmD5PffXqw6Tz5tWKR46ePj9m7+jk5S2j8I?=
 =?us-ascii?Q?IxEWoAZKnpNRwfRfzf+yPas1kqYsXtIb0y+apvAmQMSf9OS5ppY+WRescNCb?=
 =?us-ascii?Q?rsvoYrJ74qydVT7T/RutA7WEECmng83h9Mk2twctc3+Z5Qed9WwoHN53UhdK?=
 =?us-ascii?Q?3HyOcza+EgIvMeS+yvmsaCyKE+6YQNQCafyLCnhD4YnpWs45ZLkjARByfIQF?=
 =?us-ascii?Q?kuej9zS4WAZP0ZDrX4RIo0MALdLBRX8s9pYQz0NerT4Lce4wJCwfjyxWbdPb?=
 =?us-ascii?Q?QINaSEGiwm02oLQlqNpG13kflEGziVPAiBU8uvsO5WX8IQgtOdIhU6Bzl6EK?=
 =?us-ascii?Q?wR2ZxegK3qoSEp/LhBjFEHZd64NNVhIVTwXbTO9guDlbK+vPSEVRu7VeHZzo?=
 =?us-ascii?Q?PqPtdls5LmonM5CqTwhyqJNf3spOeMgrWJPRPaUSjofUy1+aIsgfaUMkG7Wq?=
 =?us-ascii?Q?3Bxiqb83j9tYqsvUn885RvIQIcBkxOS61QvVdUsAXazdOG6TmQVxyabRxlbU?=
 =?us-ascii?Q?NVkWuzALqkD9j35nyFryjIffh785LNYlsy6Dqhev?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ae38bc-cae8-43d3-9898-08dd887dfb78
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 07:01:23.2313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OoQkR3RLUasOD0ksi8E7ErFWvGSuS6LDc7BdWhkJaYnoDP7bEyZrDVOgio5gUtt9GU0xUhlLSzKP/15lY5GIUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10921

On Wed, Apr 30, 2025 at 11:15:28PM -0500, Rob Herring (Arm) wrote:
> 
> On Wed, 30 Apr 2025 18:36:28 +0300, Ioana Ciornei wrote:
> > The MDIO mux on the LX2160AQDS, LX2162AQDS and LS1028AQDS boards never
> > worked in mainline. The DT files were submitted initially as-is, and
> > there is a downstream driver for the QIXIS CPLD device:
> > https://github.com/nxp-qoriq/linux/blob/lf-6.12.y/drivers/soc/fsl/qixis_ctrl.c
> > 
> > Since the HW works with the already existing
> > driver/mfd/similar-mfd-i2c.c driver, extend the list of compatible
> > strings to also cover these 3 new boards, instead of trying to upstream
> > a duplicate driver.
> > 
> > This patch set also adapts the DT nodes for each of the affected boards
> > so that we match on the new compatible strings.
> > 
> > The last patch describes the two on-board RGMII PHYs found on the
> > LX2160AQDS boards which make use of the MDIO bus found behind the CPLD
> > driven MDIO mux.
> > 
> > Ioana Ciornei (5):
> >   dt-bindings: mfd: add bindings for QIXIS CPLD
> >   mfd: simple-mfd-i2c: add compatible string for Layerscape QIXIS CPLD
> >   arm64: dts: lx2160a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
> >     driver
> >   arm64: dts: lx2162a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
> >     driver
> >   arm64: dts: lx2160a-qds: add the two on-board RGMII PHYs
> > 
> > Vladimir Oltean (1):
> >   arm64: dts: ls1028a-qds: make the QIXIS CPLD use the simple-mfd-i2c.c
> >     driver
> > 
> >  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
> >  .../boot/dts/freescale/fsl-ls1028a-qds.dts    |  9 +--
> >  .../boot/dts/freescale/fsl-lx2160a-qds.dts    | 28 +++++++-
> >  .../boot/dts/freescale/fsl-lx2162a-qds.dts    |  8 ++-
> >  drivers/mfd/simple-mfd-i2c.c                  |  3 +
> >  5 files changed, 103 insertions(+), 10 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> > 
> > --
> > 2.25.1
> > 
> > 
> > 
> 
> 
> My bot found new DTB warnings on the .dts files added or changed in this
> series.
> 
> Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
> are fixed by another series. Ultimately, it is up to the platform
> maintainer whether these warnings are acceptable or not. No need to reply
> unless the platform maintainer has comments.
> 
> If you already ran DT checks and didn't see these error(s), then
> make sure dt-schema is up to date:
> 
>   pip3 install dtschema --upgrade
> 
> 
> This patch series was applied (using b4) to base:
>  Base: attempting to guess base-commit...
>  Base: tags/next-20250429 (exact match)
> 
> If this is not the correct base, please add 'base-commit' tag
> (or use b4 which does this automatically)
> 
> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/' for 20250430153634.2971736-1-ioana.ciornei@nxp.com:
> 
> arch/arm64/boot/dts/freescale/fsl-lx2160a-qds.dtb: fpga@66 (fsl,lx2160a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
> arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb: fpga@66 (fsl,ls1028a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
> arch/arm64/boot/dts/freescale/fsl-lx2162a-qds.dtb: fpga@66 (fsl,lx2162a-qds-qixis-i2c): 'mux-controller@54' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml

Sorry for this, my bad. I only run dt_binding_check and didn't see any
errors because the example was not the correct one.

I will fix this in v2.

Ioana
