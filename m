Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2062.outbound.protection.outlook.com [40.107.249.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B54278745;
	Tue,  6 May 2025 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746539845; cv=fail; b=m+yvxXtfj5l9KqGkQFKcuaOdhodMTA32MGb408xgDb/NeF4+AkkRCticGm8J0Jm8efteWMSiPhmlLVrJJIseg9P+ohvR94WQ0PUb5bVfIpwa/pJbqkFpwOFuswyXtjWWL6MN25+3eDJprcV5qaIWFev92dAzhitYCC68d/RsCw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746539845; c=relaxed/simple;
	bh=X0RwumXIdmp8Uq/9g8OmbYxpzgFSqOlWv0ywLiVbb14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hQSgbjo89Zuiq4KFzs+54PVmCanszrYEMqpiYvgPe5lpP02bIffHyXgWtoUogk3ituOtUHEIOAdKVVzclh2q4ogpsOjhdTX2fdX4x3gEl3a0vQitjoqYAR4nDZpsXzm0pbCOnlDI3wspHAmNO/sS+LXfm2pvwdg8MZQT7mBZFdM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JERs2XDY; arc=fail smtp.client-ip=40.107.249.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JERs2XDY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oUbLCumfqtsEMbc4U5JNqUG420cESdmMpM8VwXNp8SbYPzzw5ppOuPDGbJpySSIFWnAXtguu4/2bEbfg999Ng4kx4ncYTluKH2zI38HPAZzah0U6nxZsNtElCYWPEfycXq3R5+OOy3btuyHEcqAy3s058MLQqGrNC55DGRxdrjSTHI8TMSy6bbFbXfhSpx6SRVjTuCLqrJp0x58ILvpBHoAKtNgLUBkIyKDGHOmzSwPT/3mmnxByKpAU5TUPK5tBzRC92VTLGiQVDHRqbuV0CQ1Y9RHKbdb2TY++XQoqMB0oguUiSQcDatbEprc4rsKZ/UEbIxpD4qHzqPFENwdOIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lNk2j4frlOkisyljr+eWfKizItgn2exK1xVIGTy+rxk=;
 b=ekYnay4IApqwLkZhYpgG+z1P4ct6PtUO++xdvtot9oBJVdx0Aj3f/f6QKqVNXD3WiFE0cKXfAdLqCbNgVrWXWyd6Aes29phodXYAWW7vyDkpAY1ocNz+DpfkkspJImVaZSwuDeemeILC+WcjLaAllF/9UvFGxsIPPN19uHYtstFmw70epYDcsdhlzNLkR2VZUXNPXeKNCMaXMsGBA4h7tF70VJepGOVCUMgcb3w17zsbaAPdrPRJo2Y78kK5dxvbMqW0dykOtt4UFTtQ/MsvgOzz5wYeLZ0W4qg/nAsNKHDuO0qHD0uTJmOiOjwUejltU7qj6erVDjVg9bA+7GrO2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lNk2j4frlOkisyljr+eWfKizItgn2exK1xVIGTy+rxk=;
 b=JERs2XDYXkpFMLxhwx65mHSeFVzB7Ve5UHJ3bAwPMjWf6xUMhT600sY3An0QacmD62OdvRQBZnyODkYUur/HXhciPcYN/Iw+LFnysLp8xAPM3H+SPB1MwP4gxtwV7vTSiYm27SYOKNetgMFy3jngkKVTwDLNGfAV8YuPLNHccMgs3q+syNb0CL+KWyrufy2W8Ev3QLCG0QrL/1T2d7cOjOGki+m+rzNMUzCn7qo/4dwHMWVVJZ/pbu0ykJdz1bGUTeAmJVO0MaofbYIElqEx07gjw69OGLHMDxnROuaJWPo3tXpS91Zq682BPiZCMlVNfH4P9n9AbxrMGeCwTz+7Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com (2603:10a6:20b:42f::6)
 by VI2PR04MB10860.eurprd04.prod.outlook.com (2603:10a6:800:27f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 13:57:20 +0000
Received: from AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e]) by AS8PR04MB8868.eurprd04.prod.outlook.com
 ([fe80::b317:9c26:147f:c06e%3]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 13:57:20 +0000
Date: Tue, 6 May 2025 16:57:17 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] dt-bindings: mfd: add bindings for QIXIS CPLD
Message-ID: <wna3loahthqbn5hnw2pbt3yznmzzv3zppi7f2nblvq3t22jdc2@7cse4r4p6q5z>
References: <20250430153634.2971736-1-ioana.ciornei@nxp.com>
 <20250430153634.2971736-2-ioana.ciornei@nxp.com>
 <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502-meticulous-bulky-wildebeest-c1a8b6@kuoka>
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To AS8PR04MB8868.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::6)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8868:EE_|VI2PR04MB10860:EE_
X-MS-Office365-Filtering-Correlation-Id: f966aac2-66e0-4900-5353-08dd8ca5eb1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?YaY9yavgdMJq/r3zs0JOBbdt+QBlt2VaN6xRuoiw6yiaSDCgEfIvLiT1Z90K?=
 =?us-ascii?Q?tNE2z26kSm2Y0dKZXx+uk2oa75OWzjn9SL2W3mlIgp7vEjSfH9xpJ196H+/b?=
 =?us-ascii?Q?qmcB0BFZHqyIwSOg5UP/8vJbFITRo5Zs8TDNqSPEt7SvUiIUYUU+C8jHBdkj?=
 =?us-ascii?Q?Y12vfU5orNycjb76auuVSqWjoPqA3l6uG3xFDkbVwHvDOLzf6HIBIplHX2Q0?=
 =?us-ascii?Q?sjjpz5XpfZFvUsJUytNuAtD2zaghkOym4x/6I4+XfRAyF994L12WBRTO/Eyh?=
 =?us-ascii?Q?dFnjJ+VX4zb03p29aHkS5Yx7WlzfN5pMOmpPfroN86jX3JHls5CcFBa8Dsxt?=
 =?us-ascii?Q?0NqVJd2QWfjNGpZg7eISgEk82xYNBdchPoTACfvPHLtrPZziL3WLdOPVwIEp?=
 =?us-ascii?Q?Uq+JSncV6kvbepEclbO9Vu3F5reu1X7yLk0aCWH3p5yhN2VdNViSel4rTPZv?=
 =?us-ascii?Q?804rSfsfLJG1IMUojQL1or1+X5iJJ1PDmG772+WH2KejkI/kkeD2rT0eqqym?=
 =?us-ascii?Q?Nx6Lx2wR2mRxKeuLozweQDWqmrPFVeH5baGEsyEUq1nNw1Y1a4tm7KbNifYB?=
 =?us-ascii?Q?LBgsbIFdgq0zhUvCM9DI92khmjPGAymY3ZjkE7e/ZiT4hqF6jR53cci8tdIk?=
 =?us-ascii?Q?bXRHENaw5k62UADz/wtwf5ImD/ifpdJJphmTcs7pxhKk5+fWXHSKxixSJq4h?=
 =?us-ascii?Q?VV557sIJJQhuWhylFTNTldOHBJ8rdF3YHgoTyx2nwyNdzyRIrCu6iWknOeyU?=
 =?us-ascii?Q?B3vAnpfVXcJ908oukIH3gHcrjio/89ZRfkpwxWn6GvJCU/LPQ1YTQFHLMaNy?=
 =?us-ascii?Q?A3Cfni+6XwKyoChdqx/HxqK9htlQHwqIwOUGJm5SkfxG7KvhnrrNJhX8wi0J?=
 =?us-ascii?Q?+9c8Z5olGY9R3uJOcnkCpOowJQDBIO5Z2SIv0tfqR/GcfFcOpEZsYbmiEI3T?=
 =?us-ascii?Q?pM6MbO56bjVx6hDNjzXsg/Qr3JyMK4Qs/tOPVtthWySgQ5CwHgh03gy82zZZ?=
 =?us-ascii?Q?DvT1/Yc8KNGcG1uzz8q1BM2aCzrUMnUlF4uFpIGePTfXXzNg/oLfYi8HdJdI?=
 =?us-ascii?Q?k97ITAQ8Uxzmpccn4eEA29PQmUuo1miKUKtiBJqne8BaNNGK62GKFXe1P6rL?=
 =?us-ascii?Q?GqcXIkdbZ4c3/vtdosVAIQFCAH6LSCR+ikI6fu/1k6dZfFmvA+fQyNP6hti9?=
 =?us-ascii?Q?gcS1Suk06VizCKsYka4Aznq7xPXcp8dT7PA80Jt2n5sbnapBlanMQsacVx2r?=
 =?us-ascii?Q?9MBvBeOuCEi1nagmMDGysZitOWbsTAXSgp9jGXbn+t/puyz6PZ+WFzY78ELR?=
 =?us-ascii?Q?IDCBZmRNnsK3Oor079qE3xNphGryHgrxPvR1pIIdb71HvnLzCSMhBjCotYtQ?=
 =?us-ascii?Q?JATGG2Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8868.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KLnwsEWBOZ/+QLbP4x2eIEWiNbxbDWScoeLrI6wzwhG8HhJ7bztsvK9BFSAA?=
 =?us-ascii?Q?dcOMCLSBH/oUcWUC2d51A5oQGHHWX5nzoT9vmAMLhAR7Dsvv9saL9ZH9pTew?=
 =?us-ascii?Q?PF/mycw0qZ0c5PB5hANJSPBNic1sBKkAqNi91e+Xr/6CJ/uQquZ1NnjpK+Mt?=
 =?us-ascii?Q?FZuJwpXXPK9tYtGCtGVZ6K4NqO3D7IzmtW+2hRAXcOCN2mS4Q6vUTbc8paWT?=
 =?us-ascii?Q?NCYsZot8r9gID2faCoKTxLEGrRVPv6WHKGMEs9TdlCknwT/KwHSRZfkgW7vK?=
 =?us-ascii?Q?L0oYIvwnX/niRdg/eaitF/0AC4sWub5e855fxdnhbkZoboDs+zIhxw7HX8kP?=
 =?us-ascii?Q?GXJkbzP3zg5GDJ7ZtrRL66EhBot9yNWQsFb0+HWn7Mu2zHABgyrMt2idmtjD?=
 =?us-ascii?Q?kxgoWD7EketSHwLekPC5twVbuCHBtgdf1tHMtUaCzzTjvCjNgFFCk6EdZykz?=
 =?us-ascii?Q?NjGnTEuS4+PntmyViUkMfFoYkHdy8KTspn2jKVCcevs+PSBY8fg+Roa1BYYr?=
 =?us-ascii?Q?f/tmmd/fRXjkPpKBV3wY8yF/heXUnUfzbOaD5IBCac8EROyQaXBYgeG1BpPR?=
 =?us-ascii?Q?heTBowXTyuvaB1fIv6mRsriZK/QlajFKusEyMTicrZGzUUW7AoK26hgf0xxt?=
 =?us-ascii?Q?IEO4bQE7RtbWAUz5JfCLbbFsQg9mpGrpDX5WtsktIA1dT8GaKmt2q77SD8pu?=
 =?us-ascii?Q?8W26N4GAzAruGGax43Fp7SAoBPMqRdAbE8MwjtcbXD0wTjB7AV8G3g5i8gpH?=
 =?us-ascii?Q?hEDazG3X2lQqpBn8aL82rwqC+fkvyDAxfhhaRc7VzDsrlfE/BQvsnjiZLenF?=
 =?us-ascii?Q?VwkbWH2+lDA9yjXCej90TxocJ0b9HtlHof706fZApleeW+O6T5GInbbG8mHM?=
 =?us-ascii?Q?6EbWoiSRrKyNuVNnzpG8F3Z3VeemzYqgENXH7q3R8r9An0XfSTgRGGf5BylS?=
 =?us-ascii?Q?uS4N0LsPBm19b7QEiuTfP+RH2L2h71aT6ZxU5E1tzlQaPoljAcsjn8JB7sFS?=
 =?us-ascii?Q?bKsi8C1oTVWEccOydzCG9GdnRqpI3jrLFnZRBo5WOafSAezEMpmqhK85T0rt?=
 =?us-ascii?Q?+RtUD1PzR/XrQ22bfq9iswhSQQc5+4wRiJVQIvw5uEWuhkqN/t/vFKtAbI2k?=
 =?us-ascii?Q?cs/De2ujz573NtR2tvT0+li4i6hEKuCYZ9V3//t55vF9za6+vA1/PBP9PXff?=
 =?us-ascii?Q?ZNlpkccc6L31tXRCLGYhY6DZhI5YOZzAUMOAFIhR4TiU4NUowqJUjTDq5Ycm?=
 =?us-ascii?Q?pnX+o9ihLXksg4R1fTzqSZtbnTDY9nwywZ2kkgktTlaKDoSj/XmP/TRchdEG?=
 =?us-ascii?Q?YWhWnlDQ2s2aR1HvPjo2VdCxdehT0OnqhHFARATDmSJroAIbQHhzEGz9NFn0?=
 =?us-ascii?Q?W0KvZPXeRGkJeSxtrk03ZwZBJCe93jJWZdb+nLfm/rgyms/wrT3PaRLI+nfK?=
 =?us-ascii?Q?34mEEKx9fJcW3B64VpNKaG55Gzd+PzIjX+SaM6rlCsSgq3AJtmiqproHXp+p?=
 =?us-ascii?Q?nnbQDKMCYaWKsrhdwuFWPvAwniNlZNEHpyzxrCzFHxjhOO94We3N5n5RW+qD?=
 =?us-ascii?Q?rvgkhG+/80OZYQGnWiIlPHzs/Hhx/j7nnVFXNkyb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f966aac2-66e0-4900-5353-08dd8ca5eb1f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8868.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 13:57:20.1167
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wffz+NNP7+jbm98zg5vcc9dwl8smiZefJqNYe899nhfkKeytOvn7Rm0nig6ZxniQfEuJjA/Gmk3u1O5j3hIguw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10860

On Fri, May 02, 2025 at 09:01:59AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Apr 30, 2025 at 06:36:29PM GMT, Ioana Ciornei wrote:
> > This adds device tree bindings for the board management controller -
> > QIXIS CPLD - found on some Layerscape based boards such as LX2160A-RDB,
> > LX2160AQDS, LS1028AQDS etc.
> > 
> > Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
> > ---
> >  .../bindings/mfd/fsl,qixis-i2c.yaml           | 65 +++++++++++++++++++
> >  1 file changed, 65 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> > new file mode 100644
> > index 000000000000..562878050916
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/fsl,qixis-i2c.yaml
> 
> Filename matching compatible.

How to choose one if there are multiple compatible strings?

> 
> > @@ -0,0 +1,65 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/fsl,qixis-i2c.yaml
> > +$schema: http://devicetree.org/meta-schemas/core.yaml
> > +
> > +title: NXP's QIXIS CPLD board management controller
> > +
> > +maintainers:
> > +  - Ioana Ciornei <ioana.ciornei@nxp.com>
> > +
> > +description: |
> > +  The board management controller found on some Layerscape boards contains
> > +  different IP blocks like GPIO controllers, interrupt controllers, reg-muxes
> > +  etc.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - fsl,lx2160a-qds-qixis-i2c
> > +      - fsl,lx2162a-qds-qixis-i2c
> > +      - fsl,ls1028a-qds-qixis-i2c
> 
> Keep alphabetical order.
> 
> What is actual device name? I2C? Is this an I2C controller or device?
> 
> > +
> > +  reg:
> > +    description:
> > +      I2C device address.
> 
> This says device, so i2c in compatible is wrong.
> 
> Anyway drop description, redundant.

Ok, will drop.

> 
> 
> > +    maxItems: 1
> > +
> > +  "#address-cells":
> > +    const: 1
> 
> Why?
> 
> > +
> > +  "#size-cells":
> > +    const: 0
> 
> Why? Drop cells.
> 

See below.

> > +
> > +  mux-controller:
> > +    $ref: /schemas/mux/reg-mux.yaml#
> > +
> > +required:
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +  - compatible
> > +  - reg
> 
> Keep same order as in properties

Ok.

> 
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        qixis@66 {
> 
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

In this case, an accepted node name is 'cpld'?

> 
> > +            compatible = "fsl,lx2160a-qds-qixis-i2c";
> > +            reg = <0x66>;
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> 
> So were do you use address/size cells?
> 

For example, fsl-ls1028a-qds.dts looks like this:

	fpga@66 {
		compatible = "fsl,ls1028a-qds-qixis-i2c";
		reg = <0x66>;
		#address-cells = <1>;
		#size-cells = <0>;

		mux: mux-controller@54 {
			compatible = "reg-mux";
			reg = <0x54>;
			#mux-control-cells = <1>;
			mux-reg-masks = <0x54 0xf0>; /* 0: reg 0x54, bits 7:4 */
		};
	};

Also, some boards have in their qixis CPLD gpio controllers and I am
planning to add them as the next step.

Ioana
