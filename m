Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010030.outbound.protection.outlook.com [52.101.69.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162315573F;
	Fri, 13 Jun 2025 14:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826235; cv=fail; b=WE5VMcJxGzDJwXwbP5z3QK1uCAMezHHeqqMp0LviwU+jLXQIf4MzwqazOpREVJv7NHL77MT8LmBjuQ1DpWrCP3QrgusRux6H13SKSl3ohXgaJbQXuuS6moRrEvycetc5pOLmO58AnaeWsXyxi6HEC311W51v0cmJv3XLwvcoY2E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826235; c=relaxed/simple;
	bh=h9pVwKX2CK7BgpfUhkD+6nCoxtLvwUnk8nCZMafkgnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=mbs37N3VqjcnE7ZeBlrizpZqGtmbxVw7bpwf8F3AbZ6sHK6OloPlMyxKFwVgDIxxim8A6d/owIwTUbu8MwFKnQM/FgQXSWsnYSHFKhSXU/zGYm5dGPJ/Roht4GvaI2RUIXGgRPvBgWvBXVHulFEe9W0HVTn/1pS92/GHXXilLMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JdUL1UAD; arc=fail smtp.client-ip=52.101.69.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JdUL1UAD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mBx5s2wTWLgjbJgtrvNITWeydlWVA3P8M7LF0IGD89hhsUtYJiK5lSon+oCc7oWZCfC4n5jeek11j/hW2vGVoGIfGHrknJYjEH0e1PgiChWDjg0/M+uAQRjFOxHMMuCm5MS2sHCLsdqQ/dsCtIWNnWaYdcasfCR7a8EWcE5CQ3SspZdNQe9aInhtEivgME+rUY3+uG8Sysyu0QFXYYl9j5FTI9tGfDYLXFstSWW/5a7saNWUmFiLcKlCjUfXkfnNcmNXQbxk6Jh9oSOHj5L19sj0+bathRb2rsq3zek2tiy4zdtcqaK96wZPvTgrQsg0UjFvJFwCv+ddWXV5vJOUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lo3QNGKKeQnkokeGiYqx2YnBBB7a/SmB5NCwYP0Tk0E=;
 b=SnFQ3IIqNFgsdV1pO4IamkBc7MAQxl6ySRBbV6mvJQgaGKG6VnyKCi8n8i2HVxPQU61K07xjFetPlEDYMicgMAnZvO2HXLdj4koc+FWZ/Gl1vSGTh0hfcFQ1EoadghSL/roh3/qAb/lwzk13YlDpmdKL8QpdDMcaWvo1z6j00BQVXX/x4B60hwgcgXVLlJt/fHP7tcdhmfxD+tB5pChG5A4/9Y6/OcaHt1wZFsqGF9kO3Dff5OALP2iR3a3hhS1PWh9YTbMaQ80r+6S3G+yGj7fka9QaCrY4tgvcOvRiPlzcsGTrufPXx2aCIfy1s0os/tAUouPonYeZIhA95HuRRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lo3QNGKKeQnkokeGiYqx2YnBBB7a/SmB5NCwYP0Tk0E=;
 b=JdUL1UADmeBbcEw2OsSAOsYGl+ePFDEp1orFvKuV6WQ8XjEB4UYg655xnnAGOCnCPP8eGrAcir1VIU3fKIChfAb5eShUG7imKZYltQET2CR3oCRZqLnqtMdWUOrJ+V1OUOuR0vfJDkx9l+EgkjhuGPc9ySOeTTKV1f0KwwmhevuJ1T6Kx+LK+XybqyA0Eyb8WZZxeE7IOQhJh8EzYUWi196QhkOT198gOovK65SDneZPGVrvqaH7v9gq+22/b77FUbRI4DI+rC/aZIdmWfsNADjprNJjL1rT2lA2840eS0//ZSQza34ys9/mFciTAp3NMDFNNzzqeWHYl1WO99o7FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB4PR04MB11277.eurprd04.prod.outlook.com (2603:10a6:10:5e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 14:50:29 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:50:29 +0000
Date: Fri, 13 Jun 2025 10:50:18 -0400
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 0/3 v2] usb: chipidea: Add support for s32g2 and s32g3
Message-ID: <aEw6ql4nhfBoer2F@lizhi-Precision-Tower-5810>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0081.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::26) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB4PR04MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: ab96429d-b79a-4af6-c578-08ddaa89a3fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V4S4MZCdxICqmf8XxKfS/uk8HBqwkuRk2LF7fu5Dg0YtIrV0skvdeg4xJL3E?=
 =?us-ascii?Q?ykbdbSvpNaLGmXnk9Qn0GQ9bZ2eiTYfiitB9miI5OZnm+YRw1Op6bNEUe8Vz?=
 =?us-ascii?Q?Wym6PLbhu5NTSi1j125DfjU2mhmJCFJ+zO4K8YGRIONcCHVtqjpHUPId+IXY?=
 =?us-ascii?Q?XeJVwIk3D7UXFry2NJINEaWaPN/TyHRmbdvmlzgEpik50baWwathhW3qv6Df?=
 =?us-ascii?Q?rzJZe3aeRhvtxKFZa0G7JXjjcU40lUV2yg5ST+Reix+IaPF01Ap+9SY/IzyG?=
 =?us-ascii?Q?KOOjCH7qpDay49dl9GxcJahUV+szTmWK0FKMA1kea/Syunj+xqoNtXeVE//y?=
 =?us-ascii?Q?g2F5lu6X+FMEcrjFq9PzjJJIXL/mhgoVFW2FKBJV1ELivh4kxRxi8scaBVKI?=
 =?us-ascii?Q?VND6V8K5U7mlKdX7BeNeOhMVdnnlCaFx3ys9AQQJYRtCkMCpzYd/ExTiknVR?=
 =?us-ascii?Q?P19FoAlZQ6kl4hPpwb5qBnRU8DHnm7s9JUjd88l83YFHbTJpSJEkiIVFryUV?=
 =?us-ascii?Q?lggaL73QyJvWiG8yxyAE8dRoUiV5EpO6Vmequ3A0rVVqpbV0OcnLgYNdpOtk?=
 =?us-ascii?Q?5XXf4nascO0VT4U+exztTq/a/i8zHrTSrVCdEEDTdVbKWuIMwDeAsdNF9Kyz?=
 =?us-ascii?Q?ue2+0UtUephUJpP+Ceyp/4UL0o2vUAhZTaw4q5Ls1ICQdOsNiIc2TN/30JXj?=
 =?us-ascii?Q?AEA1vGO7W4q80atohXqwS4NzeLJ28o/Bp9tlp5HArX+poepjZrhslw0hDtEq?=
 =?us-ascii?Q?ZIgsZ/i58ivR+CoDOvVNj1Qfv4eQg/1HDPk+egES6Tpl/x7zfdx7C5Jm5+B/?=
 =?us-ascii?Q?VVATI8MnaazVd4KASvgWk8vgNxejM6YcZv6Cdbg+vrjBUryIB/DRiGeQYHmq?=
 =?us-ascii?Q?FXDvKkN91e27q0C22ZuWeciFgezNx13mmHwNYPYa6EpRecH/kLhwv/Ok1bPi?=
 =?us-ascii?Q?aEbr5kSWNWB5B87QApHGWQzH/6tyUlen9nLPFzn2zb7q495CVAhNpHrlVJc8?=
 =?us-ascii?Q?cwC6q51mxQLIimCGrI1jdwqZ3lBpjrB0BEuay+lHwZD6pxshivxixSwihXUK?=
 =?us-ascii?Q?HifsUwvwMC0zO53HLuq74cIJfaSZi/IWq42HyjRlIVt0U5AB37UhYrFzUB+2?=
 =?us-ascii?Q?U/EsSNtJpg26M+H7VUD13lKM7sip32B/GDTjMDjaeWdnWA3fUngCXPukcWjD?=
 =?us-ascii?Q?8ikddPYbfOSGIV/vKJQZ2QgcAgMWQ7eZBE0+VWGDCwmUvF3G5dE8BVgKqwQR?=
 =?us-ascii?Q?1ysPEGT9698ONZnHVV/CiqCjuMXac4K7LQqKPIQyXofaw5HvV2L1JyoxSuim?=
 =?us-ascii?Q?uxGOSLQPDml+VLqVAdnfNSMCmWrACGyY0w7qJjcyXS+QILZXYbn+FQyxr3Oa?=
 =?us-ascii?Q?34gaCeGuK08PffoscsuE+h4maztubWCGGNQqmZHrWuS4GO5dXK8AoeL3jfgw?=
 =?us-ascii?Q?CYX100MkYXWfXGrzVCCCFUD4+wr18xUmcGsiUB5Hy7Qp1tMU8YwG1Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XjtJtqrBw7cSIkwZCtoa/r/3Zh4GpPobl2JRV0J8sHMAHXx4xLnDOfEqZgzn?=
 =?us-ascii?Q?fgd10LJhtggiyaMqQA9nmBg3WlwRgsLWwAvn9etTKbg8LtVopS9zCt+LQG9M?=
 =?us-ascii?Q?lebb9ykFW0z40QStv9iS9ChZl0rwkVrpndk4NaT+ZIDub3qCV26liOYSke4m?=
 =?us-ascii?Q?uStyfKUHel/zbupplUFMT/FbnrKrPfR4ZadCl9i1EnrshvcAt2oCQMoUaJfs?=
 =?us-ascii?Q?FeLTyYNCXRv1kTTCKxIOEemzCeKCc0HhQIpWCOtKEny//B/3oA1N+30+lvHe?=
 =?us-ascii?Q?LZRWjjML19XdrUDFHv56y1HbmglyXK6AIfK1w4NRCCBVUTSs/HToUofpC/nR?=
 =?us-ascii?Q?pppMqeZBsHxmZiHfs5N937JKoPhbFg6fRgx5pGKAPHRt+J3RKBtwXFjA0ubM?=
 =?us-ascii?Q?cuFoiFE7dxrF6tiEf4F0V5sumtGLTLtzv20yLrStWuty8/WIA+EyAqeEe2y6?=
 =?us-ascii?Q?DADCrrnFh3gMy/H9Vp3NicHzIzdNrrLVngI6ibKL0NSg7WGaeO7KLuSrWvY+?=
 =?us-ascii?Q?odKPhEZ4i3+z+LX3cjiKRnVHkUWpKhEe5kIw5pX2dzjcjhtxKD6c12wCbxtX?=
 =?us-ascii?Q?2VJjkr9OgC5Uzl+6RdI3wTmXgrVhKCCI+xKsxdiojp/pHbwSSnDCPSg9Do5T?=
 =?us-ascii?Q?wYArRDDQpX2imwf6FKNkp758oqZvz5Sa0703rdLp20wRPOZzO1yXzU0Yqw/Q?=
 =?us-ascii?Q?Z0zWWeq6I+iFRs2gcqHlIguhVQ8lb9FaA6bNdp1n4dDXD3J8krxqAQblwY7j?=
 =?us-ascii?Q?OwjRTR+Iu8ULjaw+gDdofXNno+xKLY4ELQaNqekeyRvUYbnns2qxpneqRQHh?=
 =?us-ascii?Q?qtrFAkeVFiV0Hb0vxW7dgwmOnMicQA/R7ZsPQNLAMfYyAfj2FMdgfeJrCKBQ?=
 =?us-ascii?Q?QT1gbHCVtTODZ3g95in10FHBETWyjRpaJLqr/fGtxN43rnh2jDw+ghwaD1W/?=
 =?us-ascii?Q?0GUBmjZj7R55mFDryJlA7vRXU5rv8L197orOYDwEl1ajFQuJ1ip2P5iydpTt?=
 =?us-ascii?Q?b7dugf78cXcKf90vNvnjCrdHJGY1sHSV5OdhmOUZ+cr3df07QleITaSs7+B5?=
 =?us-ascii?Q?Ff3ob638FwvsKXRk6gvDMfE5hNvfnuA+muSaIkds9jBLgVr0hPBT8UwnHH/4?=
 =?us-ascii?Q?n0yC7rG/Qj64HlEf6RaiwPyhBp4f3Oij/Kk9ze9vBhlluvCfl4l/JOK5Co0A?=
 =?us-ascii?Q?fok1buJEbzScMcHAAWfQA5axmj2mpR5IyN++N9wh47tPmFUA/SkfFQUYgdKH?=
 =?us-ascii?Q?K1GGkD0WFNDmdoJZUmhVrnFUs70kiYPGoKVpAXtgIsxG7ow4ru6ua4BgRDRz?=
 =?us-ascii?Q?VEbo4qRGuVXMVTAhnczXCuAnnysBeUr7dLWMtG78jJt0eeYocfDP0NLXg0uB?=
 =?us-ascii?Q?680bRxpmpwsLyd7U2QxsmlY9RtI5FgrfUgDys4SvvvQ7D44awxI7y+zDAcY/?=
 =?us-ascii?Q?3OXGJdoSG/X7OdCIdUV5akvvOX/CvnR1Z0KYHSyXX7QfkmmRvP4CCjRMWj44?=
 =?us-ascii?Q?lejDVNHcu5cX8HPl8ggwkvJ9+6Qeiyb/et0P9BPftYP5md9ijMJ/jh/cw0Q/?=
 =?us-ascii?Q?d171hbzfdTekkQ8eFhynjyiDhZc9FZnzRikoJ1m1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab96429d-b79a-4af6-c578-08ddaa89a3fd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:50:29.6899
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +JJ5bwiuqhkUeewzBogu3Iss7+D+86OMgQ4OxcO7dfBmhz0YmOCMSuWRT7kNz92aMr6iv52cXYl9lrzFBL+r7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11277

On Thu, Jun 12, 2025 at 09:50:42PM +0300, Dan Carpenter wrote:
> This patchset adds support for the s32g2 and s32g3 chips.
>
> The changes since v1:
> * Put the device tree lines in alphabetical order.
> * Add imx@lists.linux.dev to the CC list.
> * Use power_lost_check() instead of creating a new REINIT_DURING_RESUME
>   flag.
> * Change the Copyright date.
> * Leave the .compatible = "nxp,s32g3-usb" out of the ci_hdrc_imx.c
>   driver because people can just specify both in the devicetree
>   since they are compatible.

Suggest add dts patch also, make sure your dts file pass CHECK_DTBS

Frank

>
> Ghennadi Procopciuc (3):
>   dt-bindings: usb: Add compatible strings for s32g2/s32g3
>   usb: chipidea: s32g: Add usb support for s32g2
>   usb: chipidea: s32g: Add usb support for s32g3
>
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |  2 +
>  .../devicetree/bindings/usb/fsl,usbmisc.yaml  |  2 +
>  drivers/usb/chipidea/ci_hdrc_imx.c            |  6 ++
>  drivers/usb/chipidea/usbmisc_imx.c            | 89 +++++++++++++++++++
>  4 files changed, 99 insertions(+)
>
> --
> 2.47.2
>
