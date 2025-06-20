Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9733293B46;
	Fri, 20 Jun 2025 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750430844; cv=fail; b=HZyZghuLCLx0Wc7LdKKlNKC6XjC4YypDhWQhYUiqMMKe2x3OzkoMREbMdxv9M5ofh1B0Q55ZBvb26ZQz2PwX69HSwU928S6GbNUdNGWixbQjZIJny9qWx10TRu20vYSlcrkF5GjTK0wdqT+EaKkfsZjeY5tK0hSCVBfrZ+Ugsfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750430844; c=relaxed/simple;
	bh=yKfo71+7UP8pXoQv2omFeTjDQSvUXCal90oZyHy9Heo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=dL/bS23jL24UccFGvSMoib3wxsOHHmXJuQuD3l2pmrT1i82l+oN2s1rtNa9X8+WMvMf3FUl3V8mcRn4XnS7rt55qzWLiBvTdkUjZKwA24eU6y3PFmc44KqQhIPYD3ia3c/IbqGMXfsI5LlHpqoCQ7FjQhZu7IYq49FZr76qEEIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EqcV8jHJ; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EqcV8jHJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5SNZNxWoBC+1pnF2IPHknOnECk4cgm1f5cf/wnqE3zMdAlmtu8g2K4K8qKmGJvchFfgabafgCL05eiCscDiN5YALwdcwJBHMX5mlcCA8jWZhCnKVniWVBBaIedlVJ0QHJ5Kzcn6AyPP0a/hRvlJ4ODgNc2bJQV4eRHnWprmFz/+j4Q7YZkbVNu04UayJQ8KeLG17JW3dBaCD4Hx3TBbA6Suq/bIcoSUukbDISe+WFmJWx89VV21nnkq9BEbMkpwkoaDvxyAE/p1EHx+UIikhjqyZ88aTyF0P1e19OlniPOlDi+rJbj4U9ngVltb95b0uwBzdP+N9RIcbsXeqYtjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GPI9uAoVI0L8l1ROhpfehFmweHqGdEtIuuoI3CU4qoE=;
 b=Ko6TVGsjo6W/a3KwLjyKv8t+AUkCuFOUvz8IJz9g/Yu3iOGR4KRpdm9U4m422Ta4wl/EHbJ7DJCI45qQbZdtvzAns/LVNHDKhStl3KCThiqrIoBxWeg4yfyojJK9GkHviJnEpFAY6oMmwxiIiA5cQFblc60cr5tXojvfIMvkuCvn0cPyTxZD8JXFtv+U/jICw6lqpcwhrFhKGpHwLJPEYlRoGOR0NFy8Mm9r+Q7faW6bP9s+dHqqgbtTtnUlFu+jey4d9uXHFr/aF56hcPmjX9pWELNK00HusHjFTQ95hX0uJeejLHB73Istly787KndLF88i7DCYV0Umg8BrZkoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GPI9uAoVI0L8l1ROhpfehFmweHqGdEtIuuoI3CU4qoE=;
 b=EqcV8jHJCoTPDkHiaCUVbBDr9SfXodkfW7YG+1jJLhI8lC9uyH9l/RbK5I1Ka3EbZEhQyxvDZwfv27+a+F3/wYL1hyOA184OkdJ4cg54c4QfQ4BB7KaXBfhsYBUxp2TFazMEbaM6Be9tyC2+N8gjVVtw4r5waqPj/6Zl415vSbez+SE0s1ZA6mB3np1b0SZf5sbOLdC+XyG593J6aIBQI4REtgMFrhTB90AszS9Za1dF4wCUhqE0JwKOo2w3JGQo+U5qAq/kad2fWVyYBdW4npXqGFlXUxYkFTXnmm9yZExtZU8kYOhfcVDDN2gKkdn3X1J30+CnbEEuuhYwJ5WtTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV2PR04MB11304.eurprd04.prod.outlook.com (2603:10a6:150:2a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 14:47:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 14:47:18 +0000
Date: Fri, 20 Jun 2025 10:47:09 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, lee@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] dt-bindings: mfd: fsl,imx8qxp-csr: Remove binding
 documentation
Message-ID: <aFV0bTTVPn6kYb5L@lizhi-Precision-Tower-5810>
References: <20250620022537.3072877-1-victor.liu@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620022537.3072877-1-victor.liu@nxp.com>
X-ClientProxiedBy: BY5PR17CA0025.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::38) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV2PR04MB11304:EE_
X-MS-Office365-Filtering-Correlation-Id: e543a3e0-cb50-4442-0ef2-08ddb0095ac7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0CefrRuXRiX6qzSjcEoDtbebKNJEP30+rfG32F8FUOW7KgvIYxDCA9iVs/rb?=
 =?us-ascii?Q?9PMzd6OyLei/QbLFGvedT/FWPx/zpSaIVBxawoVjvZPxmfLpOpoycD5Kfqow?=
 =?us-ascii?Q?jV6jLNjfSgwuLtE8UCRgqHXhxHRsJVZGZzNeh+l+c++fnH3DFc1lTFmVjOEv?=
 =?us-ascii?Q?b5+UFbqHytJLX1dCGqVkOQDV9LysOvdo+h1B+9Q3i6rHnlsi3hQeFL5n8Bei?=
 =?us-ascii?Q?tqi1MI5/hOsfGrPhx3zEVUMKq8AOjLYQ2X+iRGGwYOWGqTm4A3CDoDj97u9i?=
 =?us-ascii?Q?udI4Co2EgDEsutpyaGlmiUBuAaQqnNW63O5Ll9Nd0rvIwgDXKQIWHgYuLjR7?=
 =?us-ascii?Q?K7hIVejyoy8baLSpGTdjtUiiHwVyMOZTYFrKfrNodobDk+SGGDoeoKQ865RD?=
 =?us-ascii?Q?RQr+/EOLS8vVJfzglsOLX99FyZMG7afeMfALyS7ezQtAcqqhEJ7znisafchX?=
 =?us-ascii?Q?BZRxJaUAlJKJTx4QdBiM92OvnI9L8/jFLFtoScN8zhEcaNMzn4sUlNWu/0Hd?=
 =?us-ascii?Q?oLBrOqxFTSWWvAHPcNQ81qp1mXme9gnFRgPPjI7K2xk1EydD6dOpqlrDlyX+?=
 =?us-ascii?Q?IgoPtdIIFMhQzvhqSg68f1udtDN89uk2v2jFP/a5XtACfPpcPiWSbR6HqxDc?=
 =?us-ascii?Q?wE6jJ9mWmnM/72N6UsBlxKmDgUHF8Z64or+XpuI7kKew5pQ2r9FsmDK50WU1?=
 =?us-ascii?Q?nunxXWiz3SQk6/NzdZrINhbMa6dS9RRqokxbKYcOtPyjFo6zkH2+tL4kYcB2?=
 =?us-ascii?Q?QEmI4qn54y/YfEITqEwFWs5imPtgjq0DmNls7dgjO06NgoIZKfD+U7CGaF0o?=
 =?us-ascii?Q?+IAoSnBs1SRrVwYxFBFFp2dd5I6+fowlUPe7hzWKTvov77LYTTW1wSCv4Ulb?=
 =?us-ascii?Q?z1Pjuu/IphUyKGUwDCmCng0riXi3jrtrUWIAoD3xQVNai2FiiKVovqrS4ABV?=
 =?us-ascii?Q?/ef9t93Pwbx+xY6Bjjg2ti3KppfsXP14873QlXhpsJM2ZXqEGjAxaqh5666V?=
 =?us-ascii?Q?gSC2lnTsQnjzcUez5cnQA9mQltT9fo8GaSoJw5dT8mc1fWencd8ilfWDZTRs?=
 =?us-ascii?Q?13dtxKr6kqkp0hcPgin0hPZwlnGblXnnipeKGc4PZjb4Ehj8pX1B+CHwC6AI?=
 =?us-ascii?Q?EymLfpXKF0/4OPQmNWirscSRkZC5F07PT+r+n8N1hgRTstKEE7RhC/ixYRIH?=
 =?us-ascii?Q?GA2H4SBCJyuSI7YfMSxteMpqNlcWcp2bGGl+XFCYfUH1EMB2VmeJLPmT64Qn?=
 =?us-ascii?Q?7xXMau4CD18y+XqoEG/tjB8tYgN8Y3e1sxozq6FakLo9uu1j9buIfuCKA2Ny?=
 =?us-ascii?Q?wX9yylf7idh6+gwx2rV4BFzdTLw9RqvJVq1M+DjFgo+zW9M4BWTuEL7JKq41?=
 =?us-ascii?Q?5KA0HwIFMau2dIlcBmXn6ZIS9I8ziaxmafKeJNLtxJXvgLBbe/12TnW4RLje?=
 =?us-ascii?Q?c2rpCOzg3nw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A/nFab6R18GT4rjLma2b8952NRbASIyo91QMRNdLgnRizvCi2M7SCWwq5vWZ?=
 =?us-ascii?Q?wVYZEQvgfRTA+j629kADViHuXuZMzebFunNuoLkbxhiJoHiw2QeEy1xVHP73?=
 =?us-ascii?Q?Opwqn1KE2IlI40cCGtQWLSCyeFlCfCG6iEIyGjTdkzD1hGWHu5yiMXBpF+h+?=
 =?us-ascii?Q?8useQ8uyFAkGcO3suWycER+DaNhTCrO28Dl8K6F9cuROTaVrXfSbe7Sb9zHd?=
 =?us-ascii?Q?oERS2QYwZFj6PlNoeiJYPbYkLGzXzWWQRBRUPiffgYlz1P/PItH67z2hVMg3?=
 =?us-ascii?Q?e3mN74Ulrk25FgafOJLgHdoF/Gek4O4fvUs9mHSNUNIPsfhnMcd1mzdKrkjh?=
 =?us-ascii?Q?Ql7X1dn2GlsU18b95MIb99GjSW3PwDR4aw6WlKLMuPXi+dIxsahn6pcPCL4P?=
 =?us-ascii?Q?lx7Opva3dkEoM8PrREdC3JL59EtbI7ow8vhEioaAEtr2GWoEYqVDnYAHczjR?=
 =?us-ascii?Q?bqLbvVAXc6jFUx3DReqqPSK5r65ULJ96J2HzrPn6TjgczdisgZsVgplxm8fn?=
 =?us-ascii?Q?c7n03L8pa8t9R3B2TgzRWYzLLV/rjH9jqrlYlWPUbvpkRbVOTlI28TjiRFTA?=
 =?us-ascii?Q?vQPgvbBvfZ2xKlKCCnrSLGuVzlFXij6hnP3cStVWchEwKapr+eplXUufdctA?=
 =?us-ascii?Q?jg1YUgu/4+J35aUM+JhbPhzlg+YIt334clz7iWqARHhSWd+AGABYSBv6s4rI?=
 =?us-ascii?Q?Ae1vqDYLXX84vZXeb+1/85Br7tKSNWEAlf2R+sl2ri4Dbqk7BC0CC8qk4aCI?=
 =?us-ascii?Q?MIzcO50s1m2T/2/tn2KeTy8mSonFfzW+pnQU0qsA5zt9UASKcXu/V7oaFDjX?=
 =?us-ascii?Q?DyBcSebaElSlNthxLdvu76z+CNZeXziFWj8/xQDKGICHQaxPBZKhWZvejJqs?=
 =?us-ascii?Q?7gHoCrN723aAf5ahJcQmDjBRV7FOJ3KUQjMWaMap0E03gE6gxqWomdm7yZv3?=
 =?us-ascii?Q?47wISUcSCcmU5UJR+HVJ6V+NDaQHPNV7HvagEZXkVJ1xP/Jqmi3sxodavAyk?=
 =?us-ascii?Q?FyglNkw5LuE7YFsrkjqakLbWXynZkiSQVVqa2zRHm4FuxH4rkR9QT5QcDy1C?=
 =?us-ascii?Q?asXHqiCPI7ZVcGTxV6ayXSDA7IkEU9HlP0tLTYDcF35Ou9tjSAAcZfuCNNdr?=
 =?us-ascii?Q?uLxPq5tOlIwA4z2rnBR6Jcn1DHr1O6VnxHSpoW1fPZ/Md0uZoZv9h4mtAVYX?=
 =?us-ascii?Q?JRixkz1n08W9oL69hSYas6sgyBQRSDvXz8THzQ/8ZoWXY0YbkUbsx4VDfdiD?=
 =?us-ascii?Q?eyHnaiWN9KhuUY+zBBL/Xo0d6NOpVHXx0mrHLrDqQU9aM1b7KyhN2cR5xhI/?=
 =?us-ascii?Q?8B+Gxx4SMi1rm8r5pct6d8veJYRQRvQ3GJU+807hNNtMBKzdy7jP1wWnCsre?=
 =?us-ascii?Q?5AaCog3ywMBs55tplJx+iXnc7n8l8sQgmt/3G/AzTMqUuBLAUfpSh9noe69T?=
 =?us-ascii?Q?C6X+KjIp5rmvYjCi53LFNjBk1+Jg/GSWcAvdyamSn6JTK1Tvxmhom1Ko/3x3?=
 =?us-ascii?Q?LBzuyhUJoVuZHjEbuoV9KvkIC9oIcgO9rHff7tMRWL8GEuq3Pkbjmo17ygSS?=
 =?us-ascii?Q?+Y5ak57o4TWssiJTs11Fk5HE/q5Xyk1jw4XBEPdf?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e543a3e0-cb50-4442-0ef2-08ddb0095ac7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 14:47:18.2855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVuY9DkCWsUoiSBSrPyhX8a+2aH5E17wh+4oVDfvVWAYV/lpRnRHhhUCGXBhf4Fy2UiNoM6K/5P4Ypygp20UKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11304

On Fri, Jun 20, 2025 at 10:25:37AM +0800, Liu Ying wrote:
> commit b0a5cde57cf1 ("dt-bindings: mfd: Explain lack of child dependency
> in simple-mfd") pointed out that it's a mistake for a child device of
> a simple MFD device to depend on the simple MFD device's clock resources.
> fsl,imx8qxp-csr.yaml happens to make that mistake.  To fix that, remove
> fsl,imx8qxp-csr.yaml and use "simple-pm-bus" and "syscon" as the CSR node's
> compatible strings in the examples of fsl,imx8qxp-pixel-link-msi-bus.yaml
> to replace the wrong compatible strings which include "simple-mfd" and
> "fsl,imx8qxp-mipi-lvds-csr".  Since fsl,imx8qxp-pixel-link-msi-bus.yaml
> as the last user of the CSR compatible strings no longer uses them, it's
> safe to remove the fsl,imx8qxp-csr.yaml binding documentation.
>
> Fixes: 9b2c55b5403f ("dt-bindings: mfd: Add i.MX8qm/qxp Control and Status Registers module binding")
> Fixes: c08645ea215c ("dt-bindings: bus: Add Freescale i.MX8qxp pixel link MSI bus binding")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> v2:
> * Mention it's safe to remove fsl,imx8qxp-csr.yaml in commit message. (Frank)
>
>  .../bus/fsl,imx8qxp-pixel-link-msi-bus.yaml   |   7 +-
>  .../bindings/mfd/fsl,imx8qxp-csr.yaml         | 192 ------------------
>  2 files changed, 5 insertions(+), 194 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
>
> diff --git a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> index 7e1ffc551046..4adbb7afa889 100644
> --- a/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> +++ b/Documentation/devicetree/bindings/bus/fsl,imx8qxp-pixel-link-msi-bus.yaml
> @@ -103,11 +103,14 @@ examples:
>          clock-names = "msi", "ahb";
>          power-domains = <&pd IMX_SC_R_DC_0>;
>
> -        syscon@56221000 {
> -            compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> +        bus@56221000 {
> +            compatible = "simple-pm-bus", "syscon";
>              reg = <0x56221000 0x1000>;
>              clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
>              clock-names = "ipg";
> +            #address-cells = <1>;
> +            #size-cells = <1>;
> +            ranges;
>
>              pxl2dpi {
>                  compatible = "fsl,imx8qxp-pxl2dpi";
> diff --git a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml b/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> deleted file mode 100644
> index 20067002cc4a..000000000000
> --- a/Documentation/devicetree/bindings/mfd/fsl,imx8qxp-csr.yaml
> +++ /dev/null
> @@ -1,192 +0,0 @@
> -# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -%YAML 1.2
> ----
> -$id: http://devicetree.org/schemas/mfd/fsl,imx8qxp-csr.yaml#
> -$schema: http://devicetree.org/meta-schemas/core.yaml#
> -
> -title: Freescale i.MX8qm/qxp Control and Status Registers Module
> -
> -maintainers:
> -  - Liu Ying <victor.liu@nxp.com>
> -
> -description: |
> -  As a system controller, the Freescale i.MX8qm/qxp Control and Status
> -  Registers(CSR) module represents a set of miscellaneous registers of a
> -  specific subsystem.  It may provide control and/or status report interfaces
> -  to a mix of standalone hardware devices within that subsystem.  One typical
> -  use-case is for some other nodes to acquire a reference to the syscon node
> -  by phandle, and the other typical use-case is that the operating system
> -  should consider all subnodes of the CSR module as separate child devices.
> -
> -properties:
> -  $nodename:
> -    pattern: "^syscon@[0-9a-f]+$"
> -
> -  compatible:
> -    items:
> -      - enum:
> -          - fsl,imx8qxp-mipi-lvds-csr
> -          - fsl,imx8qm-lvds-csr
> -      - const: syscon
> -      - const: simple-mfd
> -
> -  reg:
> -    maxItems: 1
> -
> -  clocks:
> -    maxItems: 1
> -
> -  clock-names:
> -    const: ipg
> -
> -patternProperties:
> -  "^(ldb|phy|pxl2dpi)$":
> -    type: object
> -    description: The possible child devices of the CSR module.
> -
> -required:
> -  - compatible
> -  - reg
> -  - clocks
> -  - clock-names
> -
> -allOf:
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: fsl,imx8qxp-mipi-lvds-csr
> -    then:
> -      required:
> -        - pxl2dpi
> -        - ldb
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            const: fsl,imx8qm-lvds-csr
> -    then:
> -      required:
> -        - phy
> -        - ldb
> -
> -additionalProperties: false
> -
> -examples:
> -  - |
> -    #include <dt-bindings/clock/imx8-lpcg.h>
> -    #include <dt-bindings/firmware/imx/rsrc.h>
> -    mipi_lvds_0_csr: syscon@56221000 {
> -        compatible = "fsl,imx8qxp-mipi-lvds-csr", "syscon", "simple-mfd";
> -        reg = <0x56221000 0x1000>;
> -        clocks = <&mipi_lvds_0_di_mipi_lvds_regs_lpcg IMX_LPCG_CLK_4>;
> -        clock-names = "ipg";
> -
> -        mipi_lvds_0_pxl2dpi: pxl2dpi {
> -            compatible = "fsl,imx8qxp-pxl2dpi";
> -            fsl,sc-resource = <IMX_SC_R_MIPI_0>;
> -            power-domains = <&pd IMX_SC_R_MIPI_0>;
> -
> -            ports {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -
> -                port@0 {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link0: endpoint@0 {
> -                        reg = <0>;
> -                        remote-endpoint = <&dc0_pixel_link0_mipi_lvds_0_pxl2dpi>;
> -                    };
> -
> -                    mipi_lvds_0_pxl2dpi_dc0_pixel_link1: endpoint@1 {
> -                        reg = <1>;
> -                        remote-endpoint = <&dc0_pixel_link1_mipi_lvds_0_pxl2dpi>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    reg = <1>;
> -
> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0: endpoint@0 {
> -                        reg = <0>;
> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi>;
> -                    };
> -
> -                    mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1: endpoint@1 {
> -                        reg = <1>;
> -                        remote-endpoint = <&mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi>;
> -                    };
> -                };
> -            };
> -        };
> -
> -        mipi_lvds_0_ldb: ldb {
> -            #address-cells = <1>;
> -            #size-cells = <0>;
> -            compatible = "fsl,imx8qxp-ldb";
> -            clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_MISC2>,
> -                     <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_BYPASS>;
> -            clock-names = "pixel", "bypass";
> -            power-domains = <&pd IMX_SC_R_LVDS_0>;
> -
> -            channel@0 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                reg = <0>;
> -                phys = <&mipi_lvds_0_phy>;
> -                phy-names = "lvds_phy";
> -
> -                port@0 {
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_ldb_ch0_mipi_lvds_0_pxl2dpi: endpoint {
> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch0>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    reg = <1>;
> -
> -                    /* ... */
> -                };
> -            };
> -
> -            channel@1 {
> -                #address-cells = <1>;
> -                #size-cells = <0>;
> -                reg = <1>;
> -                phys = <&mipi_lvds_0_phy>;
> -                phy-names = "lvds_phy";
> -
> -                port@0 {
> -                    reg = <0>;
> -
> -                    mipi_lvds_0_ldb_ch1_mipi_lvds_0_pxl2dpi: endpoint {
> -                        remote-endpoint = <&mipi_lvds_0_pxl2dpi_mipi_lvds_0_ldb_ch1>;
> -                    };
> -                };
> -
> -                port@1 {
> -                    reg = <1>;
> -
> -                    /* ... */
> -                };
> -            };
> -        };
> -    };
> -
> -    mipi_lvds_0_phy: phy@56228300 {
> -        compatible = "fsl,imx8qxp-mipi-dphy";
> -        reg = <0x56228300 0x100>;
> -        clocks = <&clk IMX_SC_R_LVDS_0 IMX_SC_PM_CLK_PHY>;
> -        clock-names = "phy_ref";
> -        #phy-cells = <0>;
> -        fsl,syscon = <&mipi_lvds_0_csr>;
> -        power-domains = <&pd IMX_SC_R_MIPI_0>;
> -    };
> --
> 2.34.1
>
