Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E6D1DD543;
	Wed,  2 Jul 2025 14:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751465681; cv=fail; b=stPwcIP2PCnI1hkdfayqHzZQITN1uKc7ZseI1lG3pA/HyoKTmLzNburOPVKJIp7RpQSzvc/rgMHocRJ7CfiH5KrxmBRrgD01+iZlkqORFmrQEuwo2o3EU02N86JoUG2cirmcv5u+2sv3TjTTbO1yB7gTCt2M9ftYUmdfsWyE0Zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751465681; c=relaxed/simple;
	bh=H1kQdPcb04IPH25dKdaQF7NTURxFroV7N/BLWbovyWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZJMxIDo27B8HWRNZ4dSbh10gtRJIx0vRZ9+eOEvqekFYuHHtm/EjRTERrdBHIjBMBF91WJ42c7+mxCHpPA2GtLPTKra0e9KhWTL7krXaJ0MdZyew6MUSUeUpKi2bsfbwVGnbC3Lf/lNg7j+cXmQCTt7ec2ckdj9wmujNGS5yTOk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VqNTCkfn; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VqNTCkfn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ejfBeKjzkjFbCaFbB0OjqeEODvUo8jlgHF+1sv6+eVDIxWkkU2AVtshH89Go5XjYkbJBvBEIDpOj57BW5ylZUmQGMyj/yhdeo07mQCRf6L4j9EuTEyhpVaqaO4dLbIO08fab/SJUGs8ie27rTWBaYf1MhLbwK1mxkIGpem2b2BqCMErPr/ZK0W7PfPrZ4rgTHMhDHM1JZ4ezNxsU6kK6alCcrSpoe5BrLZvY/pQtBo69CEzXGbrG6hN06wpEQf/fAVVLEDi9r/aA6Z6PLw4nfwisjcRlMsC7GHtJhNpOXl9aCTNRRSJQ2VRoBl9A0reKEfh7TJIs5zXAtZGBG8+H7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31vb9h0crh+ir1Eb7gONkVWQ84b+yxq+Pxd+BSmg+2M=;
 b=slldxkq2IHcmy8BfOTNiuiFP7KyZQ3so7kQ4M+fU22LRzQ4DYYTkQXwjmVtHwvrYLNwx9vy08wpTU3um2FzDHvafCXVyXKkAlIwXiyI+WhZeUD4JE9fqv8a0upNtql9HdR+JEKMrOrV731ig89o06FyfvL+4qkELPRf/BO0XxNceQg6uir30bZQnTnTaPCZUvewQ+lL2Vas+Jlu9WUwKcNgn9PqlAh0oxn/30STd9odPK/CTZJdNA3kWUtcnaibSWm47xK9krZ24t3wXDU6jMvsNw28QRW6KOsPJYncmEsj/CG5+G5myR+XJGY2yEkhlnlO4QkffyYoaubCvPvzaRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31vb9h0crh+ir1Eb7gONkVWQ84b+yxq+Pxd+BSmg+2M=;
 b=VqNTCkfn/BwbEBamTx71niNV0Jj212wJHadkHASxrm8XY33tdtkpCscKscGdtrAhU1VLaoW9Ya7h7fjlPTOWpNuGjsV75DGwWtU5K+IRQ+ldGSuVo8qdPAdyFrXia7468Fap6xaJ7rMdpLh71dUJj1Kg0Ic+e1ygQIOq+9OEYEGfhCX5J1g9BBcEd/EFPqiJo+sLuAzDo8e/GPMc2/VODgpAiSDq9bTcEr63I7xasMYcL5GCD4i8GYSlQqPRmyXDXugWmQAPwltPFmFc2sobHcb1F6HM5k5nzrB106KmkorkpdepAvo8P4SqsP96KsCIiiSU+lOU4KoYTSQtHYm8Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB6987.eurprd04.prod.outlook.com (2603:10a6:10:118::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 14:14:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 14:14:34 +0000
Date: Wed, 2 Jul 2025 10:14:29 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
	Richard Weinberger <richard@nod.at>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	imx@lists.linux.dev,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-arm-kernel@lists.infradead.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-kernel@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: mtd: convert lpc32xx-slc.txt to yaml
 format
Message-ID: <aGU+vIDIA92SMH8B@lizhi-Precision-Tower-5810>
References: <20250701212455.3106629-1-Frank.Li@nxp.com>
 <175146290647.1131327.11939010351638573167.robh@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <175146290647.1131327.11939010351638573167.robh@kernel.org>
X-ClientProxiedBy: AM0PR04CA0086.eurprd04.prod.outlook.com
 (2603:10a6:208:be::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB6987:EE_
X-MS-Office365-Filtering-Correlation-Id: df1cb34d-33c9-4c9b-6463-08ddb972c563
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|1800799024|366016|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KMcO6REVnisOlJSdVFc5+D9ttS2GwuraGTjYkTqPRspuwMDSMkYOdYZG4oqY?=
 =?us-ascii?Q?ebRtiHu1uC7/KNiY4QLO0yX/DPVMnT1YYK4Gtf40U5y1y1Db8tSAQlWbTtxk?=
 =?us-ascii?Q?KGaLolwkG1VVXAQfibtttvIA1+xVg2XmADioiDQn3urhKO1sUarNRaUYsdTw?=
 =?us-ascii?Q?5wq2qE2w7rauI7FpJgEBqW3O661BvwRpXHSkdcLUK9cK+raTtZouca53vmSe?=
 =?us-ascii?Q?DPJi5UbPRvuzsrJ1FavkbKnVV5HhWq/W+IsK0MqldXw6YvW7hQDm5TBA7WQg?=
 =?us-ascii?Q?FRwjkb4FXkCdvuWI4tZiTs3QfBh2/NJKmWFM2A2Q15mTyAimy8Pmmj+nuerr?=
 =?us-ascii?Q?L512mdyk88Mgf3ZjLtgz1gHc9gcYZ1j85S1n/05eAHvPB18pqoiJCwjOmzzs?=
 =?us-ascii?Q?kOK55frcRcu11s/Afen01ZUFWAx+HSu98VF3Tx7ZO1q0/M9mt/KLj2JTrWYq?=
 =?us-ascii?Q?M5fhzQesS8BUJg5dqStOlWyiLUsuanZGZffyqbAku1dcwQg35gDplwxyjT3o?=
 =?us-ascii?Q?H6oJ3x1EWSxX2ZSIe62NLpFbh9mf0prue+9nqb0EtoTJyhyAM+ofkanhXpjk?=
 =?us-ascii?Q?IMHAMbJR+DFCVOxOCt0yTmQKb5JVq/h1gyk/XhFZBA89rTJaZ4smVHAE5sbg?=
 =?us-ascii?Q?1cIoK0ONW1NsoZHbcqGPDkpPJhx+qgayi62S2C+KFZtTkOng9Mc04ICe/l2r?=
 =?us-ascii?Q?KbReWXcg68g+DVzj08tL+u6kaZvAtj4kRAzQ0H77GXAyQ54sKaOHMu1F/WMm?=
 =?us-ascii?Q?l3W9wEGBJUn/afOkJR3Xl9FeWA01U+vu9wRCwMuR25ZMlLNtntNDHXkVHXyq?=
 =?us-ascii?Q?GmuFS/BKooO/qPepU4F0n521WVq/EwYwceho+BNZl9ctk4OikHgn4VVJflD+?=
 =?us-ascii?Q?166puQZ27nvxDG4kJcYgA+2MWXxKkRWyNS98jN2vRxi368uefxzTPfRMmsXY?=
 =?us-ascii?Q?dKhzW5I8KdDxvSApSV+9jKq3WK/sPqtOSMQepHFRckYeZkSZ62NfJsvs+CVi?=
 =?us-ascii?Q?acjxi+Hs4JqOMKUJ43GuK8Y33/iNXTRgVR6tUF7drh5Cs3OT/GOxlHw5lH1S?=
 =?us-ascii?Q?ZvPFxYsJO6+Muk5PUDBRAmE4Ue6ma6ca1xi1OXSpjgRp7iYl/gVN6Gp4YBJ2?=
 =?us-ascii?Q?SkEiqh6z6FiD8lMle6vjA8V+w0vxZ38N2eKfJqC7XvbTd/Kq5G6gCE9z1C9q?=
 =?us-ascii?Q?DUshxdbKcEB2Avg02ZIEr6qJICAnTq01ZYXHyReE2sYo+zj0Demx1+9HEWw8?=
 =?us-ascii?Q?y9YSgT6tKxp+Yc9imz02OcVJ3c0hDlPvqEuQrGLdj4DvZocXJd/cnyF7ALmj?=
 =?us-ascii?Q?DVKkOtfiZH1iH339uGZA0/rOudTINwFxtoUPRXf+XOvV6LkRKlZ/rF6fPlyg?=
 =?us-ascii?Q?8+EQ9/PJ1FBMSlyP6o35R++zeIBz+nqV/ySHw9Sy1lMQi4geefNNM5Ao5fG2?=
 =?us-ascii?Q?EOUjF2iXCl4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(1800799024)(366016)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IWVAcmqsnGlTkKPEW7QNlUdUZWIMMUDqVsUPJMyLsOa2Otsf4OnYR2O9lhuo?=
 =?us-ascii?Q?23ShjcjSe8iBDonX9lCzNzai0SWvIRBLA50+UA7b9yW3PE13onfPnV3ovn6z?=
 =?us-ascii?Q?RSfTcWYaMfjXC6xVa2r8MD3PqvuicMoyNqF2sKvQZ2fw6dJOwdXb8/Pksdza?=
 =?us-ascii?Q?XxkQmAzxXASIXRb4r/y3F4sMyIF/cDK2U9Z7xUiCUTTTJMsGJj5IeJHAC1RW?=
 =?us-ascii?Q?5KdPTyMtS0LVT2VeCXfv0GDYv0XjmGRaj3Jhh9lUu3trGyQ4cdHWSdxamZT3?=
 =?us-ascii?Q?QoE4ifbKA08OI8V/vkYDScyOy3YwrQn3d7DH1bheK5lFfw8FwdtBwZ+44zqB?=
 =?us-ascii?Q?PrXiK5A4PkmMuV+A1zXez8zeF5uEoPQada4ydSj4NPKQ6mySTXSPsYkoEMZ5?=
 =?us-ascii?Q?wV+ZX8FPzQ2hUaIseDFsbm43PDUZjvMihQ8GucfChSgvoNhuE+jMVOOgVoyV?=
 =?us-ascii?Q?hmTzbUztQWNe7wJ0EBYHVbeEaPR0JfhsIMFFFpoVdw5TntLWqIaFAWJPjSnB?=
 =?us-ascii?Q?xNswJVLRvDoPe2LeBCCLYjazdEaP9u17bB3qiI5nSZGEbAkg+acDbERgnqMo?=
 =?us-ascii?Q?UGRhd3lDbZ7aCBoca0Mwg0e/D6Slxq6VOBCJRlSjGpI28hXENg4ADywoNnwT?=
 =?us-ascii?Q?5EE0Y1AK5IlDDgnHcOsE2+byS1ZZzmsIPPldhpJcRLwaDglmvWcTbQWPFOXp?=
 =?us-ascii?Q?1OCKZXZYvTQyDUC2ZDUvED01d94FyuHJBes5hCpPedrSYoKIGh8FPIC4t5vS?=
 =?us-ascii?Q?6Qm0ugvGnxI6fu0vjXOzno93BlKhlGpgJLhZIgCcCGPG2xbuG6Lu1WifH415?=
 =?us-ascii?Q?8myG1Xqsh6txmipbhyTtiAwfZf05bb+n6osNhz+Gczr4QTfcxC333ANxV7aI?=
 =?us-ascii?Q?9lj6J8W40tHQAiDo8OZcjNtG44Hvr1JrsNH5tGB9NiieqmXGhUKIZHXYsIdU?=
 =?us-ascii?Q?d/UtP+6KMicJECh86EA2LuzgrDDCjzkaQTD+LaoMRSa96lC4qWKX7P72H6bq?=
 =?us-ascii?Q?Rd2Lxrnu5NbQbYRhXk9f7SNnWZNMM6uy3Bir54EqP9d084fRXAygLiHy+9KD?=
 =?us-ascii?Q?NuOHhAVuQMEESu35edzK1jENmaGFrBLYB/0Tl2h2/TdIbcr7SmnubEWQ/qy+?=
 =?us-ascii?Q?iV5U0HW+bwHsAVvakFqRwSUxl9QSkJ8D5BG/yMh4pmWksYt+GQvXKHvCZKBf?=
 =?us-ascii?Q?u//dHJG/FDfVlsypx2qskajvUEEOwpa7yMOcbuaFr5OFo3z48vAIv7/y1xzo?=
 =?us-ascii?Q?TXp2xI/BlGAXIuDNHGzl9xPhaVDrhHGuOixh3pHnWsdtdGpmfGlQvkaKLHZe?=
 =?us-ascii?Q?x+X/D2TVCRMKSMTH3UJBmo80EjjatWGqFnRkt+SUskp4MZppshfm1uanhIxD?=
 =?us-ascii?Q?V4y3uBzoSTyX0Uby3VB1n0NXk1v54S3n0bL+KnLVr45IuoPeIZffGjaHQq+6?=
 =?us-ascii?Q?X4R6cmevlXMvYWA1Q4r2IulGU2t2g1SXefr9agEgCCOU8sPMgWRt9RzGHfz7?=
 =?us-ascii?Q?qkc/TnIEV2siD1w9IqucPzOkpoUvBIErXeql/nFah7SGFZG+PPQoI+oswFUA?=
 =?us-ascii?Q?PlWPbFSTW2FXnJes3QFfar76k0SREx6VsCBGizaM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1cb34d-33c9-4c9b-6463-08ddb972c563
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 14:14:34.8141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /isngxaS+9rjZKMXGJ02ySBE/SNBkUGIYIYAqIA9h65I8PFlV4/AG7FlRoecHH76nQFA0BchmLcixo9dGcbXRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6987

On Wed, Jul 02, 2025 at 08:28:28AM -0500, Rob Herring (Arm) wrote:
>
> On Tue, 01 Jul 2025 17:24:54 -0400, Frank Li wrote:
> > Convert lpc32xx-slc.txt to yaml format.
> > - add clocks and partitions to match existed dts.
> > - allow nand-on-flash-bbt.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > change in v2
> > - fix miss 's' at partition.yaml
> > - remove ref nand-controller.yaml because existed dts have not nand child
> > nodes.
> > ---
> >  .../devicetree/bindings/mtd/lpc32xx-slc.txt   | 52 ----------
> >  .../bindings/mtd/nxp,lpc3220-slc.yaml         | 96 +++++++++++++++++++
> >  2 files changed, 96 insertions(+), 52 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/mtd/lpc32xx-slc.txt
> >  create mode 100644 Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#address-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/nxp,lpc3220-slc.example.dtb: nand-controller@20020000 (nxp,lpc3220-slc): '#size-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#

Rob:
 	I remove ref to nand-controller.yaml at nxp,lpc3220-slc.yaml. does
it match by node name?

Frank

>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701212455.3106629-1-Frank.Li@nxp.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
