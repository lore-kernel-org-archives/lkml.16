Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449ABA27;
	Mon, 21 Apr 2025 17:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745258168; cv=fail; b=qxciiaN4EmIOqkgQpnqHD+303Vae0RbhZeQhuvoCtbk73Sd++R9EDv6PRoULzKFeHnXzf9amtDkeZk6qrwD5n5klPefoEyqVMQZm44oU6lVg/6HW5Ogs4D1dKdR8TSCuvEGrOyEW7NyUPemtxUUZIfv4EP0FYNsj6R02BINwW/o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745258168; c=relaxed/simple;
	bh=xrZ7FmbWwd0OIC4n3seZ1nF0+DKeVJIVV5agL7UauDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZWtteuXICyKQv07vapwZbAfp1K+AKYnbO7wR+xa3Xfx1w8X7I1zEDYu/D0WjSwZtrYkGxWLreP5PUaC6pZdB6IkeMiahunFBISiTp/e9VyQSnSxYcJXdKO08+qUFPUis5tATDWvnIxXnsKWMzn7nuVVL9OYL+8x3nNw9J0oCEnw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lmDrXL9E; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lmDrXL9E"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjQSeM+hlAFnsCgJTlekSC44rF0nA9rwUBBaw+CPyCHHDEfvz0fzPycU3PNABCTYyIC4R9XnEkos4mZb63Jf0+yqWPMuPj3Ok2xiEV+RKPnNxzNu1fOzwJcMxFQ2+OdYrP5RNZQfgp4cie09MrXSNNQ8AQ+WLBGfDKHdnp3gj2LeB6FuzwV19WmBLvr4bQWNgEjz75yIRPz9ozkKl7tyCTuvtnGv2oZYc7tTru3iyQGiFGZ1Fb9PJfl5fMziUYfFYdZ98r9qKc6pAmior065C0Z8NY4Uq4agRohc+Bp5/ygYiz/0CtK6MIL0Yr6uNUdEBlTN3xkbhDfMyJjzsvajSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqjIMB0UvYtSFrDqD9XNhbmMfkuBG1abYwSb6pkEejA=;
 b=SDAhIjs7QjsAy8sFldVlZ9DPF6EGEBMHXc40RMiaGQWlg8YU9YFV+DvX1ZuC//B9vAX5dWZfvWpTNtDCPC7nmVn0roqk1l0EItU6wRsWvJ81+NWeAjZBlpTZI/+Q2f1D6KzUP7jHw+m0MP9o6hfRmVM7YZr1c9aYwBoi+XEB1Wsdv10bdbdZUoo8x/JUSNKXYC2swNtLHgusbi1Vr7nvQyFYmSDGDPxp2eQ3J0a7E3c3wMO+ux0gDbO74hSvZ7Btj2KwA7OS3c5xoutYDd0nCdkLc7LaczGcB+6U+4dKQPq5F4f+GfE16owlekQNiNTaXWUOQzdBJpT42s73iwvrig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqjIMB0UvYtSFrDqD9XNhbmMfkuBG1abYwSb6pkEejA=;
 b=lmDrXL9EXhEOsOTzC5Mf8+FItn5jKfccJtr+WGOqgnoPsLosqi/WouPdDvnFuJFwvL3GSl5iJvOBR42ucI0pEdOHEjFow9ESjYHhmJlzZmN1PFKHEOsEc3bBtW1ZjLfuIo3hifITm+YAb38ZtLG+I/jWAKzF47DJYrAVVRV/nC/PZP9PgWJkMtvFHDqxFa/7wBUjp1kudOoR3gGrGj3Y47NhDvQdxmkhnd61UFYomAGgY5vojVDZQLyJXfkAmXeLmEbXb+B/V5CSy7tshkrVqYsDTdS1KRVwHtSTbtlLQaoyIJseAzaK1lYYQJg54ZmHWJGqdNq/TeVzVV6xz5YGew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8817.eurprd04.prod.outlook.com (2603:10a6:20b:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Mon, 21 Apr
 2025 17:56:03 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 17:56:02 +0000
Date: Mon, 21 Apr 2025 13:55:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, conor.culhane@silvaco.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 1/3] dt-bindings: i3c: silvaco,i3c-master: add i.MX94
 and i.MX95 I3C
Message-ID: <aAaGqO0rYVivle09@lizhi-Precision-Tower-5810>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
 <20250421111513.2651797-2-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421111513.2651797-2-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8817:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a6fffeb-6260-4222-d591-08dd80fdc7e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jgns/PKWLU+A+dSr2AUCfiIQmwul3cQueYIC90E4ezJB81/mltJtLFxPAVON?=
 =?us-ascii?Q?3DrAzKTzU8ljEPyr2NzDrZBRufxPAeocXyaWX4wMN7vC024ib4Q/Zqkbqxiy?=
 =?us-ascii?Q?ST8TyuBk13MmI52iIx6sCUnWNo5AZYlPHB2zBqNX8QGqDJdZok09IMNU4FSo?=
 =?us-ascii?Q?Het1ScdzbnrVtQqZfQFdRyiJeHWT8H4XffgfOsBdhvGBWt7Z76rZdBERQU01?=
 =?us-ascii?Q?wyOLFst5Yf9+CKAYTifvik4H93RJNpFArAo8QujZbqWT0d2zo0o5g5Q79ZCP?=
 =?us-ascii?Q?PZsvAIu/lJ6pl0aNNL7w8s2WZ0CeeiNWViT7TYCeF2WbsuyHOpTdP3CQGRF7?=
 =?us-ascii?Q?QWY+Wz1oEF/0NqD3QRNCF8VHODII/JqwK9dOd3jf3F0ef5NuGmbNQtjCsbk2?=
 =?us-ascii?Q?HEF1r2ouMqs2C69mvmTRNftTc+5R46LC3VyI8l6wjYI5ObZ9/jNkwYyReQk4?=
 =?us-ascii?Q?PjjOOm3eFnUVeHz2jjVb5joY+BGmUXDGVDdLY6cdiuftSj3L2LrdRCFwwOCo?=
 =?us-ascii?Q?lqXJkD/DMiiY3Kl2Dl8Fl2J+ARAkdDCo8xnIrSgsanobbKsryoSr8oCCF6Od?=
 =?us-ascii?Q?Csl891Tdrp8mGYW56lg0DGCUusckXjmnq3DviZ2mqtcC8/B7YxTb3cDFBX2b?=
 =?us-ascii?Q?ABMvaiS6V4vPyHWwsXJX/3kHXuWl8kAzOj0Y2QFQgh3QB1EuNyZw1insSiOq?=
 =?us-ascii?Q?NGQR+eqrhxwMZLA0kKQR/O71t91Ma1k9lZEmwYGoqkh0IJDHd06aqE6CBHZg?=
 =?us-ascii?Q?Sz9KSXgQW7WheOpvowSsPp0fIFAAeIb0dex99J+udDXY4LU2E//f/0twnquN?=
 =?us-ascii?Q?L255qaoMHMmkqqyjTRH7OOkbaf36qvZJCeE4d6z0UsRWlrXFHsMPG4iAmtx0?=
 =?us-ascii?Q?XADVTmgsp7XZ2Souj4lPvE5sSbIrnYzZOv7kk/eTGLBLZGEiJnbnj2u9M9xb?=
 =?us-ascii?Q?ArkOFgv6HPVmlPqhCijBRqm81BKXSKVhD6CxWSsZE0FSlFpWalQASbV7zs/U?=
 =?us-ascii?Q?Sm2ul7rmtXhymX7RWsT4AvO5nbPBGQuAtv+agMy/mjLWQS4QucQ5tRQdWwfO?=
 =?us-ascii?Q?g+JEJwZd+cPEgFMhx586c/6M7LR5fKRYJa7RThVMRsklFX82adU74eSFGzwv?=
 =?us-ascii?Q?8iTseHIfCz53NuAVCjeOmRerf08IAGOEZEE/NdGccl3YOjZQMZun7Tir8rFL?=
 =?us-ascii?Q?OaUOawhaG5tqh5vajBpCZ6909jov+4OseyFsqdWn6xvKA61cOvcuDNIjQSJl?=
 =?us-ascii?Q?N4r8QwVsJ+PQOVa5Xw+PaMzVis++FO0wbyLerR03qik5U7EzESRKoytixetl?=
 =?us-ascii?Q?2UBbGI4e/asxbr91uHAhdY+wnsv7T+UVDslqHumrowOHmzeGcEeb8molFAif?=
 =?us-ascii?Q?YdlavYtmpxeXYwfCthLvHOucD4OXyVbvHsJyXVdJPbLChHBnBU7PsosoANVm?=
 =?us-ascii?Q?hTePs76p3VCWJXEpjefCaP0/OlP7TBNf+H6OafFjZF235RwbjGUm/A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2qnDAOuy48BYU63ltyP4hIblveBfMkQz0BA4gYLKBgvJnRnuXx0kjH3V6dNo?=
 =?us-ascii?Q?vIXd7BYWzDkgXvr9xIr+osYA+Adq81faWPK1TaW5fnCIsgaEYDOKKi0YHNuK?=
 =?us-ascii?Q?TDruFcI6xOLwJGhisiiiIbiNIz1Y2EEqwKW+zULq6X2CYFBxUn53jNYtU5qL?=
 =?us-ascii?Q?VIx0u6PLtK+DvW9y3MXrICTX2Yoj2DnC62nRJJ10N4bwm/rBTgukBnloI6hP?=
 =?us-ascii?Q?QaWvmiARbN9P4+QEjkNZYEs7g1oQVmYATL7bUBbnAZPfH3VlkD7Z2FFZ8/qm?=
 =?us-ascii?Q?+zJ1u/WQO2poXj3IAluSedK+ptnm+yy8HawiRbBC9hn4I3bE8BOPFgNxkg1Q?=
 =?us-ascii?Q?bG496Mrr3ONyiis7H73V1wZUpcKy3YPou55IVxIznFZ7HNa59HPT/eOMRDxf?=
 =?us-ascii?Q?JaQ9vYYOo1Y6d4h941qIiWSgQFgVuX8j9GXtvK8R3XCOI5Hana6bYwkZytt9?=
 =?us-ascii?Q?1rIQE5U80CZ8Uyu2aZL307MSk/MrQsADletR6zUtK58U6pTFAix2USb72s16?=
 =?us-ascii?Q?AwTgWiuJBzVSuMM2t44aorevFV0Y6rt+0uPqa93lhU/7BF5Q5DoDOKNzbLFc?=
 =?us-ascii?Q?rUf7Lw51csDsy3tPhssyiTvXHjorpXovWNMo4pgpn8KLqcX/BsD9fSSvw7ja?=
 =?us-ascii?Q?VremKKh95BJic7vP/c9inxjHXSNsWQh5rPZC1F2/5h+OaxY1tymgj8LpGSLI?=
 =?us-ascii?Q?0Vygdqs6g318U8zDNCZPeUO4HEk8Pi1U4eCa1fNQkiGtI6IbHqRMBvzBfiDK?=
 =?us-ascii?Q?Dh0NpfnBP+0TGHZFrXVblAeX7OZEGetnSrTupxHwCUTn0wOAa2Eceod1I6EE?=
 =?us-ascii?Q?siS20ulKSUdLj43qxzm0TkUTRLrtTdzyjOAk6bhz7B24JZmx3Oqtwhxs/WnP?=
 =?us-ascii?Q?WjdkKImHtw1QJwY+HXFxRwUgO1COLKxmyHMFHZODZYmorFFKwlhXZzmdahGM?=
 =?us-ascii?Q?33aCYCz7DBG3bArtpf3CxfL4+uRP+Y4GHE5Xu6mEbg2iAjUlq88PW7WqPOg3?=
 =?us-ascii?Q?RC9oOdCcQIoVeP82Pp/TxIz/wQOXbMgjFJKB9Fr9Q+6+JVN+E/v4RLHfapag?=
 =?us-ascii?Q?Q+0lYb3kLmDvF58VC/r+qMXHO1ZLdujGFyPQUIxVJFqVCgP3Ux1vx8OWXaGh?=
 =?us-ascii?Q?2zg199MlokLdCugozHWMxzeYOv/ycGY+i8XnFePI90axoTUOKNOMRizFAiJG?=
 =?us-ascii?Q?Uy6Zn8V59ACU9CI24a+sLVbDMIAuXDbmf36vgWPV35JWkNKNmvO+rU35bUeD?=
 =?us-ascii?Q?Tdk2pAmVCXnLViLQfFe1TLQVvwyP2AUEayfULo93jkO5AozIzOWrm5EgcUE/?=
 =?us-ascii?Q?Qo+sPelMWIZvX1UAi+WEtwu1EMMC0SC5pLn+2P5pTi516UJ9u8wLTkHU1VGf?=
 =?us-ascii?Q?zw1yw/q83P9vu5xsLbW7CBKeqlO20qUgwFq7BRTwZLxzOr2DbwzoV6tludvE?=
 =?us-ascii?Q?GBpIStTBkAJL663uxWL5Gur2i47pIjYNie14IUkBbsX1nx2fTcf5og4xjIF5?=
 =?us-ascii?Q?2CEIz2PbzuubRGuLsKGSFwgBZ80Wb5bu8KMPQj8JOiOiyt5Sb9ggxidI1iGm?=
 =?us-ascii?Q?6UTic8NJqGFlKQNYeBo84NhHEO2FILvavRhfd3Gv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a6fffeb-6260-4222-d591-08dd80fdc7e1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 17:56:02.7549
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGHD65cCOCZuMjWroj/8UBObsUSHePDioV1se6gnTra3hv2rFwao+4qctEvga6VFAnl0TS+C4wGdDGttVqWhEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8817

On Mon, Apr 21, 2025 at 07:15:11PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> Add compatible string "nxp,imx94-i3c" and "nxp,imx95-i3c" for the i.MX94
> chip and i.MX95 chip. Backward is compatible with "silvaco,i3c-master-v1".
>
> Also i.MX94 and i.MX95 I3C only need two clocks and Legacy I3C needs
> three clocks. So add restrictions for clock and clock-names properties
> for different Socs.
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> Change for V2:
> - Fix bot found errors running 'make dt_binding_check'

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  .../bindings/i3c/silvaco,i3c-master.yaml      | 45 ++++++++++++++++---
>  1 file changed, 39 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> index 4fbdcdac0aee..fd64741abc0c 100644
> --- a/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> +++ b/Documentation/devicetree/bindings/i3c/silvaco,i3c-master.yaml
> @@ -9,14 +9,17 @@ title: Silvaco I3C master
>  maintainers:
>    - Conor Culhane <conor.culhane@silvaco.com>
>
> -allOf:
> -  - $ref: i3c.yaml#
> -
>  properties:
>    compatible:
> -    enum:
> -      - nuvoton,npcm845-i3c
> -      - silvaco,i3c-master-v1
> +    oneOf:
> +      - enum:
> +          - nuvoton,npcm845-i3c
> +          - silvaco,i3c-master-v1
> +      - items:
> +          - enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +          - const: silvaco,i3c-master-v1
>
>    reg:
>      maxItems: 1
> @@ -25,12 +28,14 @@ properties:
>      maxItems: 1
>
>    clocks:
> +    minItems: 2
>      items:
>        - description: system clock
>        - description: bus clock
>        - description: other (slower) events clock
>
>    clock-names:
> +    minItems: 2
>      items:
>        - const: pclk
>        - const: fast_clk
> @@ -46,6 +51,34 @@ required:
>    - clock-names
>    - clocks
>
> +allOf:
> +  - $ref: i3c.yaml#
> +  # Legacy Socs need three clocks
> +  - if:
> +      properties:
> +        compatible:
> +          const: silvaco,i3c-master-v1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +        clock-names:
> +          minItems: 3
> +  # imx94 and imx95 Soc need two clocks
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,imx94-i3c
> +              - nxp,imx95-i3c
> +    then:
> +      properties:
> +        clocks:
> +          maxItems: 2
> +        clock-names:
> +          maxItems: 2
> +
>  unevaluatedProperties: false
>
>  examples:
> --
> 2.34.1
>
