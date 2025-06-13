Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A24B1A3155;
	Fri, 13 Jun 2025 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749826163; cv=fail; b=tBjQ5NtMYGtDhT06v1irRodVGTDrPLd7Z0cVtJelf8uLT1zoefA4bqH2obx34LNl9Qg7S61y/MU2njnlM/d6qwo3B+XHycJ5A6kWDxybN9aXHHdKdLx3MWglyrpKKtT0XQYr4imhzgvZHvYYACyb9JjnszxXoq6hqkxH0M7nNYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749826163; c=relaxed/simple;
	bh=7K64iz+W4jI2AumKvtoFKdIc7VqNYCIM/ZjqDgbBHpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r+mHkDHalxeCepBMhsxe3Rwfve8gabYKjCNAThWTCw2D+ALYfhUK5f0ByX/0Ujr04/+mr9RhqqaVrRp67oHhKuh7gCA0W6Rt8j5nTUOKtx8oGn20sWNBXDlWylmkAgrDFqZw4Th8BvWYkppxBlC1R66I7wPHVDe8F8dxeqz76aY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dU2x2kWx; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dU2x2kWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FeQZRA0FVzir2fuhGdQUVzCxu1ckAE7UrHabGVQAXLpO+q/+1EIIRbOVD9LLbO91GYQg+7pOp+yPVYMr5ASPsqSLAgVXUsze4fogc/NMTYTU+D/AxirGjrHr+93G3bRU3xIspxH0P9khY+VkkBSL3o/Q3VdSHV1kEYrMERnDzlNmhwkx3yKK7Xbvqly28PQLRbtvO81g8KRbGRBc5OCiiLIX+BS8kr2T2u1uqFR6kgvy5E+5QxXeAbk7noT5Z60gnJAIh4WPGvHkJEtGjGUJSx+1FoGwdjQqY6i7+1G/9m/u0ER0yq1fvSfI84DlSdSHQ9uNQHXnMVJ5G7I0x4bqEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bn9xWgyIRYDWQr4kECFxVIEo2q9JOeC68tfqB4WbmxY=;
 b=uLq4hpl42/xfGLZjhb0Sh+5qRnB1WRU98/wiPUnp5NQWA4ygRxCfgRis4eg0PHFMlQDYWX7op8m13e0chT3FTCjkznbRDrAIYDprZhZyhjTVeaL2YJWunUZ+g9kiw63WWg2zmIl3ErisjnIG3tEqzZ7guCBcGE9H9Lz1uq/u6RWeGDqymXFxM4foRAyHzly0Le204/AT1mZWjRDXMug5iSk1XgodbKrqi6F3UArd93Mduouw1TaFg767FW3ca2vk7LkeAVxKA/lc3cqcVj7nA+k5vFf2qn81G547Fge85zyBjIQVYSuqPsth3OSBmOB4hBQcJffi1BRvPIx9lPBsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9xWgyIRYDWQr4kECFxVIEo2q9JOeC68tfqB4WbmxY=;
 b=dU2x2kWxw8mG2zC1hjAcnV8jafjrdR/UGkX9NE0ZhLIDmJVEkD//zUuHOzbaa7WEmgGjcaLZrxs/E3CTdqiGR05SMtn4LlT1zQM5lynNfL8S6CXelL1ovDrsYwEgDmrS2ikKZco5hdpY0C68impCxqVAciyCgPYqM6MjmOHXViGH/OJDqg0LphCbhpbFBdMz8zqgWh268mYUXTQk30vuuBZk6M1tdwEMLvRzMhrnEuHuSDssFufDycrcFOGT6exohIQxCw/DgdVcmXYQVoF4Q/GQyp0KmBf/J7vjPdQmaE0OhqSbZRpiV/qQhlobWY3ozL8MCL+8vtOAnDjuK6lNqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB4PR04MB11277.eurprd04.prod.outlook.com (2603:10a6:10:5e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.24; Fri, 13 Jun
 2025 14:49:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.018; Fri, 13 Jun 2025
 14:49:18 +0000
Date: Fri, 13 Jun 2025 10:49:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Ghennadi Procopciuc <dan.carpenter@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Xu Yang <xu.yang_2@nxp.com>,
	Peng Fan <peng.fan@nxp.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: usb: Add compatible strings for
 s32g2/s32g3
Message-ID: <aEw6ZTW/4iC3TXSO@lizhi-Precision-Tower-5810>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
 <cb3970d93f2df0d350f3f3de27d9f0cdb41d0d3b.1749747898.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cb3970d93f2df0d350f3f3de27d9f0cdb41d0d3b.1749747898.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: BYAPR07CA0081.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB4PR04MB11277:EE_
X-MS-Office365-Filtering-Correlation-Id: fb2427bf-5c6c-4891-c07e-08ddaa89797d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9xPL+7wUnNyRd2zkpS9Nb8kjYCk5JCIzHZYpXzhtzsQaq+TK5CXH+wj3hkcS?=
 =?us-ascii?Q?hv5FR9zpD81o/RgdcA+pbHuAZ/C8Ppwmhp9ZRWlWokYdPreUXXdV84ia9Jra?=
 =?us-ascii?Q?5lJKkCoW7P88zYAxZeztf0wAa37bWCyT0DJsLWJHleutaGHbZkaefFr033DE?=
 =?us-ascii?Q?V5fgLeU55BFjpWTpbX9IuAgdTFmxRFQqEcKQGZN799TTF1m5zCdzVCtCsJru?=
 =?us-ascii?Q?Mq+7TIKKdEbmgHJcpzfkwrpYyPJ1GQNOkKLx4MGWlXnVlMFw489+Wk5TPVb7?=
 =?us-ascii?Q?QvHR902WgYI4iFlGy548oTaIqlt+4zrBg65teP2rzamuC1Rz5ftVuSqcfoAE?=
 =?us-ascii?Q?iL85WOgPVKs4itjxGCaupHJBlmHx2+CyAHT8miKmbw9fU09cyn5iG0Znwiye?=
 =?us-ascii?Q?RWiJTzHQp6Whs+nNfD1I6zNY1uBFN/tht2NMDETqJXngTd46LplH1GvqQUbt?=
 =?us-ascii?Q?je4EEnED0P8AIaT8zhvzl17xQnxeDDwhgt+cGsS94MRdvJWCKlDaMjF+m0f+?=
 =?us-ascii?Q?uVci+Nz+6QzAVYJut1UJ4nsagK9C4YqvdAUgkI65gcQQ3UNOWFWUO56Cpwt5?=
 =?us-ascii?Q?37nSyuii70+xSMrcehYnMhUXm1FN6kSXQZc+MVfDQ00xXriw9BY+X52OBU9Z?=
 =?us-ascii?Q?YtnISrWINCR4+1EmesBxPfe/SuqEDuROsbTayGCa18N9ucteKak2Tsa9L4Nt?=
 =?us-ascii?Q?f5xLkICiwz7blCjec6BvVMIjwELr+6Xn6oupI3HWU1IOu2fZ4wYaFK+MUUBv?=
 =?us-ascii?Q?xLA1wq6Z6YRpxp729XaN8mzfWwLHk+fwbtgbJ4fJoMrtCe7AtEDNcEfuSEaN?=
 =?us-ascii?Q?HVjUuH0WheFD+rw8TPKRsAvKs18+btyMARD27WOFhhT0V/vzmEoyVIQmtJXo?=
 =?us-ascii?Q?bXbZBWoLlOzW2BfngOLSd6arxDfzNbQgxLKGeYKJw603XiVDN9ObPYfdNDlk?=
 =?us-ascii?Q?fo31xP75PcdMtlPJOzvTqLSrBiDoWoCKi7RTFPyYI2oOZqJmg63Y/cFHgzjQ?=
 =?us-ascii?Q?Z7hvJ/A+kHDX4uaCPi4mZLDOe9EaKbrlNKT5NB4ZgBQUSVDW2NOOMaUKQkqU?=
 =?us-ascii?Q?vuMsc1CIxMyYew+0uTULL18LztVoykf85LJ8Kzkn5ckuws39EVb/cmt2mj0+?=
 =?us-ascii?Q?sW0V5njyipdGfpQlGshv7VZh8xlvX4xsMLR+Q0B78Ddydof+ga3kIRhUMNyU?=
 =?us-ascii?Q?E/A1gp2LWx3P8R1cdSAWSxFiagd6ZrI9Sg/3pZzazBIHce3lg0BBWaKWm6dX?=
 =?us-ascii?Q?FqBY8fLJsuRxCxrLYgnw+Oqn2eTxcGI1kt0fmOr6vUqCJ6zT+W3/HQ5QvtrC?=
 =?us-ascii?Q?D95JVG5sUPZeWsJtFvgFtcASmNW26Gumni9FCjvt36/ZV4xZCDIKzpujUqea?=
 =?us-ascii?Q?uzxjIbCNk7dbA1W98KTwYuoVMhw7800DeEYU+wicugFTrJ7Bv7rOb5M1rJsE?=
 =?us-ascii?Q?Ux0N8l1pELJvrqxlPYijHa7Od1rL+IJXRz5KY/dYwuALg8HH9J0TAw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?347augQ0q0ITsRdFlY1prjbngxbyz1uv+pNem4nGNxOmF3bIh3/urztiqFqR?=
 =?us-ascii?Q?jOhXfZW4rlaPrMO+svSSsJTqV8lW0Qs2qhxKcLa1EikgOlVs5Hx6pOrmRcCe?=
 =?us-ascii?Q?zPDC4vooHC49ISwbaY1tX0Gob8u01oPe0D6TxlilzItDQfEI7SfmkzQ4oxgA?=
 =?us-ascii?Q?MJTTZjYGSbaebRxQvYfnzdjbJEboppWs63BXaBqBNlS+b8bftHp2fbfRLWip?=
 =?us-ascii?Q?0UemBJc3G0ChS/u7oQLHdwQWrKn+oJHKQ/+YLaLy2u9RUlUFNyqt0yyrH0y/?=
 =?us-ascii?Q?eWYyapkeRqilywXzn7ErrusHSEQJXgyChxKdHX8NN3ueAB64UWqF6Ovqf7ZZ?=
 =?us-ascii?Q?YWn5IUCZjncH+IowBelCIJqrn80ZcCXdR7DoYyT74QzHauMcc5Aea6x7/cR7?=
 =?us-ascii?Q?whifo9VyWODMQw/D+Yn8tLDXdDZlelPPtzjIJDRrYTkyCcn8YUaZuwsAphse?=
 =?us-ascii?Q?Ft8Kb1q0XRt6Lp6uYIRJdYOxkwV2S9UwRZBEVCYqIhhZ/DNx6G8wSiFkYWpD?=
 =?us-ascii?Q?E6osXOUn1aTvlZVIfV/TqY5s45+G2r2z+UKF6AqVSoww9Xsl/sAeSXJBxunz?=
 =?us-ascii?Q?WEogRWeK4UdWplGqEWnu7HwevrQg1QHaQ6v99Kqz3xgAjl/4AiqPSdLMKmDS?=
 =?us-ascii?Q?b1zNc9C3mTEvQu7eJ4f6lUKhXT2yDcDFbxf5cI9FihQ8tCKRj47I3pHmCx6b?=
 =?us-ascii?Q?fXL87OZnrJzBgIRt/1uffUbNj3/C7OmFZcyiVq2acs9gpIGF24h80ziea4Nj?=
 =?us-ascii?Q?5xZYTiy7eTmW9nPHG5jHLzuIrHZ0UjXpEhfHNBcfsgrZ0DSyoTgZbODe949C?=
 =?us-ascii?Q?c8+vby7gO6PQojvY1dRjme7stWacq0UW5YtVdvdmbrcet/rKi1n0CvExHFco?=
 =?us-ascii?Q?4QJhzlbLRoVY6w/L0JH6KZcJoltR35kqBtN39jijRRrkV+owGWirDBztiWDv?=
 =?us-ascii?Q?20bzmXMKAPBbyQ2c3htuHVgOxZ4ap1sicPVYXJJtxeYxRFbca46cR38iQP9q?=
 =?us-ascii?Q?8LB0TzyWpZzOFUWBDDAzCWMDHzmoXPN9d4LqLxA4L23kUSXU9XC3PFIN3eqF?=
 =?us-ascii?Q?OZiiiG20VVd0+FLp88uC7U5n9wCyNsxrrtDRT3UYhNSp1Tc/lcxYdAOEQa/2?=
 =?us-ascii?Q?ON1/ab2zpZ8O8n+J8NTD4Iy1ObjfTbwl4KFdj6v0owRVFVOJqG8PF93bLom3?=
 =?us-ascii?Q?XF5/T2o0nMOjj+kaNr6W3Q2XyBfHYLc9q+QT/+70rr8Q5W3jBozoluj8dCy9?=
 =?us-ascii?Q?2S6VJBCDoNHP1I5gfsa70eV1q5SrUMrK5Jp6x/w1ap1VLOw/CUmTVc22FaW8?=
 =?us-ascii?Q?uI0EnLhXlZZgeHcYkcvxK93plkqZUu7032XuA919bFRwoFYDrGbojbUETC5q?=
 =?us-ascii?Q?Wd7tTe93pMiTrkz680rJp6LOeHF1WjKX+Hpq9OGSluOM4vxZXdSVLjZqYqCh?=
 =?us-ascii?Q?Taf+4l+R678sHr/igCBSD0/dzciDpXVU19HJAzwwoFu+z2b0F8FxdqnasGxO?=
 =?us-ascii?Q?j9U7nknj6FtsVahR45U2auRXI0qoY7iF8WA6F/svF0w/YCiwf9b/SvkILkjb?=
 =?us-ascii?Q?O5y9Mrcf3Usgz/ht2JzK/l6byIQP3Cq2uuXGRkKn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb2427bf-5c6c-4891-c07e-08ddaa89797d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2025 14:49:18.3681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jeOCotNOFh/XHoo7oGoBGSKOHstzegeCW6KffxiM0hVkHKupd2Sgbg4HmRv6EvC6texw+ZR2SlOUibxg1TUO6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR04MB11277

On Thu, Jun 12, 2025 at 09:50:51PM +0300, Ghennadi Procopciuc wrote:
> From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
>
> Add the compatible strings for the NXP s32g2 and s32g3.  These chips
> are mostly compatible.  The one difference is that the s32g2-usbmisc
> device has an errata ERR050474 which requires a special flag to be set
> for handling packages that aren't 4 byte aligned.
>
> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
> Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
> Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Changes since v1:
> 1: Alphabetize
> 2: Update the commit message a bit.
>
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 2 ++
>  Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml  | 2 ++
>  2 files changed, 4 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index cc5787a8cfa3..f6372b76ed5a 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -23,6 +23,8 @@ properties:
>            - nvidia,tegra30-udc
>            - nvidia,tegra114-udc
>            - nvidia,tegra124-udc
> +          - nxp,s32g2-usb
> +          - nxp,s32g3-usb

You plan support nxp,s32g3-usb fallback to nxp,s32g2-usb in dts, your dts
can't pass CHECK_DTB with this bindding.

Frank
>            - qcom,ci-hdrc
>        - items:
>            - enum:
> diff --git a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> index 019435540df0..ca677d1a8274 100644
> --- a/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> +++ b/Documentation/devicetree/bindings/usb/fsl,usbmisc.yaml
> @@ -21,6 +21,8 @@ properties:
>            - fsl,imx53-usbmisc
>            - fsl,imx6q-usbmisc
>            - fsl,vf610-usbmisc
> +          - nxp,s32g2-usbmisc
> +          - nxp,s32g3-usbmisc
>        - items:
>            - enum:
>                - fsl,imx6ul-usbmisc
> --
> 2.47.2
>
