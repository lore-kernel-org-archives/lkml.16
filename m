Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2088.outbound.protection.outlook.com [40.107.249.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB65214213;
	Tue,  1 Apr 2025 21:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743542513; cv=fail; b=XO09xdyTcUCkkjCxeTgGzxnHVeJJ6pJZ8wO9HSlZ180vQm+QX/D2lotuj6XiBdSBEpQDsfEGMfXcOddWQV2PaXKVmGlO9uqx+Vd6XEkE1VJIXzclUFhkRZAXNTtztOEZKYtz3g/a9Q+q36149Ak+U1ZfGkPpqiTLavWGoQtELPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743542513; c=relaxed/simple;
	bh=jWqLHv5RlIruM/XaMtNJQXi462FToSLsNPDF9AHHt7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nuJouZL6GMizVkvpDgp8YR6ebdUZQtCok2u+Z2r8FFnKVqKIj3deIQUh8DeyKPStVKd07XHnZCqyRaXRslfTVRD2f/oV9vf1W9jABUemgO8HbhPEdifp+MPtr3ZToBCFicZBTgipqPLgkHlGZukFsBcZtsqR+CjZeQNfzI69DdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SwcPlE1i; arc=fail smtp.client-ip=40.107.249.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SwcPlE1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggA7TVTCQcWMTRyJFJUqTAD78UZ5RM1msq3mo9259eFLXYiB3bk5m48PCss864BvFyMI2rlJwRbu6xzVK9wLG5C9VHP0Nr3YnioB1/MEn3/fvI4loH/q3IBk904rpsiIhM5k/yN2H1mKPTiyc3vrM23eWhs7rpb0WyrCp9BC596R3vC3xfoWUWXNBJVd9lLdbIrM8cFNjf3LwUxdeyeCtz0ij6DAw3P2xmYaY8tvQ7eDRHCmCluF33qjRcQKKCsEoUUf+30E+xLLDbRiJelkFsSYUxFcJFw4PqtzLrPxTJK9/FqLrsjT/ZFqFcAfcwegFJK/VvUqCVVnyNNCHxs7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e5NQbJXz3EPmXq74ZSXs6KLlmdX2Fyyt+2j5kD4Q5Ps=;
 b=xzBySZ2w8cMFxNuYzbAHWFFvw2G0Wy6Tmv6zxhl8lRCSa6gIwTw6sKg1ZDvlbVAzsDzdpAExRUio1WR7fwPzBGCXIBQRyzQqvkuSAZNd7LNb9KWVcIcovaKepZqKz3/AeQN4OP77YJ/NZs1NhsRaIqD4gZxzxbFul9OYRI1qOtoGdizBSpvXxygNZl7XwNH4ozj/oAE4nNYKrvt/NZhrECDg3Cpdkzeml0MzU7OeFyxjC+VIvT09J9GRIldAaqvFgDWgzi9UMp+qn8Vs7TuLfzDlsynX0rqzpvxuo203FllIsIOP3Hla/SDsp5PlQTDGLWFBJ1g48oZ2oT/a5triVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e5NQbJXz3EPmXq74ZSXs6KLlmdX2Fyyt+2j5kD4Q5Ps=;
 b=SwcPlE1inO5vl323yh+8cnYdH52Ru4kng6DqwEj6DI1XkFVdNQOdMcSpY0E+3OFoBJ7meE3xTjcoZwtwbFzLQZfoZLs0GAAWhoOmN/yHnveMr8Ug6zLK4E3ane0PBsD4zx86JENy0G57l+XGE/9Ow7wkhSD76cfWT/ds5n/mUjSxdRs4C78tatWg9xNn5qvremV05V0oV8Z08daWVbNGSoLHgj2DoFgmE4ILinWacnIZdoCY55cVML+7YW+YKPksWJ/EayeuiXmLYRG6NCpZpDOlnAXXacH+pO/A8kz01NPvbDd+7OrL4TENsfOf6nkaLfKH86L/4Cnn7Fu9zUFlBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9908.eurprd04.prod.outlook.com (2603:10a6:800:1d0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 21:21:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 21:21:48 +0000
Date: Tue, 1 Apr 2025 17:21:39 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/6] arm64: dts: imx8mp: convert 'aips5' to 'aipstz5'
Message-ID: <Z+xY4wZ8ZFSOJhGS@lizhi-Precision-Tower-5810>
References: <20250401154404.45932-1-laurentiumihalcea111@gmail.com>
 <20250401154404.45932-5-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401154404.45932-5-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: BYAPR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:40::32) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9908:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f4ba47b-8ff9-4f6e-c363-08dd71633603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?m48fXFrhE4n++daby1qV2QF8ClZr5tXeB/MQ6VGERBDDLrohD+0tmbplhEDF?=
 =?us-ascii?Q?mk4f1FuIAzEIQkE5EZfvQOO/Ox9rZEQ6SA+9tRaWYei2RWgvBIKJWQLIEU13?=
 =?us-ascii?Q?K4EE2ZEdWCCEWE0iMPzrBR5vNW7Xk1IuzjtrZWK7ZFI5tlU1ei/NtpRdOINL?=
 =?us-ascii?Q?4rhWD6LDTOcWR+FEZnX2+44otLaQPNwyorNdbyWuebI412V4ClALWk2K6Gy5?=
 =?us-ascii?Q?J0xbGZC6+KjBnbNLZt1aJL77oV9RxCtiInm4qeO/HI0ynAegYRQHgOGtUBzG?=
 =?us-ascii?Q?AJbuxjStRRwTdAXYNCmya1aR1r7KbYWopieN1+UL+7NEoeWZRdU9Xn9hIGl3?=
 =?us-ascii?Q?KUjUB0LlVk3SkxihZSCSDyhJJURJjf+1r6lO00h2MIu/7JDqCG6V0Q55smFU?=
 =?us-ascii?Q?8fyRGMHH8bYqRBuyRnRztBjpJmyK/KsTs2PIoGUHBh4+WBPWKucdQcZGHV+A?=
 =?us-ascii?Q?46rcDnCmOfz8zA+Rf1iYUINI/KeOQQmNVqc65Mjk+0KSNf9sqLqeB6xIgffW?=
 =?us-ascii?Q?QbxqA1Iz3HzXj2BJb2o0heuUXWQ8S/mjYJaisWZB4BiJGEXKgynvoSCTgN6B?=
 =?us-ascii?Q?MGuEPbBltdCjHyq6JsIfxbnIAVK+LEPu4gsHuQP5NXwNU+JJHskc8Bl+Zy66?=
 =?us-ascii?Q?F3MAVP/cKWBbf02NbCdSJ20VaQseyQbIXp6nZinHMwHUReFKHuP+4FiSkYgW?=
 =?us-ascii?Q?wvQy8/mcn0QFydX1OmHl2rysTChwX4mf5nFqZMbS4CVPT4RhiuuKx6qnDq4A?=
 =?us-ascii?Q?oDYgcQ4NrenN9K9roBXP42D2DGTzuIc5ygT8maWKGouTDXa/AXSj8EPC5tpA?=
 =?us-ascii?Q?us1e5qLibXjX6/6zCATGU7wyV6CtnpjFipOFhTN74W68rx5SMVuM/h3vtqL+?=
 =?us-ascii?Q?7Z3dpc92gTYgybvFxIVck4MWCoMjqq73fmUCn2rFYamWP6STlN9MVwcx3L7S?=
 =?us-ascii?Q?nryIhwtoQX1s8wt75RBcH33XcqOoWDwmtgoMSilk0oxBITs3QLSgnihZsSwP?=
 =?us-ascii?Q?KluPGtNdAyxOCzS3FYpu2OF8oXr+qzpPamnkMbjKNj7xHAoZR4s8dD/EMXmd?=
 =?us-ascii?Q?HCrF5rryFmVcIiJvEiqEY84oulntu8DaTsZfps/GhocC7vBzTL4t0TKwMAMh?=
 =?us-ascii?Q?2lJFv36S0hYyr10K2qRyB7cKBxzSUQsfSVjp93GmzYFtdAfNXmYO3YM2WDEV?=
 =?us-ascii?Q?2OfZbkOUx6yM3MAm8BNdLdWMbZ8Ci7SOhYLLQtjFpnr2Fruz2Of2NtU5feHQ?=
 =?us-ascii?Q?2CBKMeFh757sndrPRwOL4/RWpz4LtJ+DInRJ+A5LQfJLcENzipngHMLy7nfR?=
 =?us-ascii?Q?sRpE3PR+PYOWfdapMSt9n9uCjcCYfMHxHg1ocVscX9BVCNnuJhYbwUkZAmlK?=
 =?us-ascii?Q?1T8bWVcZ+oG/p6kcvArYKr8xe4jqaGe7TXv92JEzmNkTWlY8ZCZY8OxrPiSd?=
 =?us-ascii?Q?uGtVl93yLVEPIi5SxChh14tIyRJwbEhC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?a3GIe5LsEDnraucwQAvgqQaPvKy4/eS6Csq1gB1t4jKzmLD98hlpuZB06RZX?=
 =?us-ascii?Q?rwkKKEBGwLnPZApSzNU2M2Hc3pa+jlObxIQZynB77MWWOQH6eiy+rsOCcuDG?=
 =?us-ascii?Q?+OC7cE6Ok65RBFwDu57y7+gV7OAp6x+IzXBUm4zy+2GCmEytNkfSZdnGgXLs?=
 =?us-ascii?Q?GBhm7zWUybxgdw+320I+SBg5O2ch9CPqMHbASgq9MBbLTscasD4yldHL4qyv?=
 =?us-ascii?Q?EcDDpUBPSxgkLra8H2RC7tPhY+kbrt4txu/D+1DlrpNVHgbIQwGBkbHbIUd0?=
 =?us-ascii?Q?j1/6XP57ZaJu6xt4riyd5lKtMCS/iAJVgWD+iDHt3+D0ChCWoIUzsiU8P1Lo?=
 =?us-ascii?Q?oAGoZ32vSnSRmVAEc/bY1SKtC0Ns9kPUQE+nmP8qp6ZjYytX38Eg8Qw6uzO5?=
 =?us-ascii?Q?C8F2Gjnqn4M3rVnU5k9RQJ09dMjTOgShyaGeVqxn4gR+x7+1s9cDGgUi6rGn?=
 =?us-ascii?Q?WteF6nkNLAqSX1/jnggZZ4rRblTV5C5G8J/eJ4o+kZSc3BYAAX8ld83wrUib?=
 =?us-ascii?Q?NoFGX9/fRHPXiGCf3z0OzBtZXUKmgbDWv2WdC6o0t9OADdjbJU5PcRWehbCQ?=
 =?us-ascii?Q?i7oYeejFN3+8b0sUQT9LPePc3Ol4YoWtkK3Ju7ejH2eG9Filq7YsLex8/sRe?=
 =?us-ascii?Q?9xOU8nUnrz2ldcYutQfYnEiUlX16njH2iVhlkfbbSdYXw04PfFx1RIG03Ov2?=
 =?us-ascii?Q?VXBk8ucPK8JPRC25QTgQYpZInhlo+hxBNjbPjVo+x4Xj/HjyD2R/n2cCiLoK?=
 =?us-ascii?Q?cehRzWIjcqNEC39RHZltBFAIysFNaeal33FIPy6yqRTmf28vsNzOosTxlZLW?=
 =?us-ascii?Q?jjT1/fL69cvz7k/guegOA85m8bFxN8ICIUA8bY3nm5FRZ1GuvLbgXN13ZzIV?=
 =?us-ascii?Q?GoOGUU8u2dITdR8Q5JYT+hWHxPBOdGJbBwOxzy4OW9J5s9ZcerZ+6ShGH+0F?=
 =?us-ascii?Q?q3mVzJKN5fZLul/eyvNVfxhEdbZ7mgiIf7OS0jfqs63PWxwwT9o4rvGYQaxs?=
 =?us-ascii?Q?lrorRAJHoQeSLnG4/xIpYM1xsuitJd9PZOma/zaM2vzPfltSPx8lKQIO4jtc?=
 =?us-ascii?Q?ghDuaRRjV8hK3oAfLc9dxKdnZ/LkiTQzuoAn9YEoUR/KdFPLp/TF1iCODmdn?=
 =?us-ascii?Q?NXOw88byXMlShw7mARSuv21IFNA2aT51dnF1rDJJOLmcudJFmmW04uloUH4a?=
 =?us-ascii?Q?y9VvzaDuf2faLNzrsenmGqC83ECXbPkT/aWfujPY18SswvpF0ObHjhU8KODd?=
 =?us-ascii?Q?WDciAryf5ZWtN0pRmo3Rf6mLdbz8gUTs75yA2WvFF6XRDyjLOvXMOnGVbcx9?=
 =?us-ascii?Q?XlHUke6d8T4/iw1bE7B+0gcO8SjeLn5PfrrceuiUEFsPkDCFuRDSosQre02e?=
 =?us-ascii?Q?615ZKvPnFs8SgXY/TIoLKulq8AZBEz/sw6+uSFQ80WqqG2VhnvEXktsD366M?=
 =?us-ascii?Q?jxcInIGwh/LrIZho6fQyJ4JD1a15YkikwSzOiafs5zGuc4OgVTddmMoH6KYB?=
 =?us-ascii?Q?7gmeNadhvQYGkITg6s0wY9sQ+wAkWMtA4kto4ikFfbAp4LkLf51I9YuGe248?=
 =?us-ascii?Q?lYMJ+8AkogIiVOGFmdg=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f4ba47b-8ff9-4f6e-c363-08dd71633603
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:21:47.9347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: raC2XHH4YTXHZfNC/QJUguFg740BEN6b2BIPHY56AqPfzl/39LW/FZPw8v6ySmwI4P9IwA5z/FDpIJxSYqpr0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9908

On Tue, Apr 01, 2025 at 11:44:02AM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> AIPS5 is actually AIPSTZ5 as it offers some security-related
> configurations. Since these configurations need to be applied before
> accessing any of the peripherals on the bus, it's better to make AIPSTZ5
> be their parent instead of keeping AIPS5 and adding a child node for
> AIPSTZ5. Also, because of the security configurations, the address space
> of the bus has to be changed to that of the configuration registers.
>
> Finally, since AIPSTZ5 belongs to the AUDIOMIX power domain, add the
> missing 'power-domains' property. The domain needs to be powered on before
> attempting to configure the security-related registers.
>
> The DT node name is not changed to avoid potential issues with DTs in
> which this node is referenced.
>
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> index ce6793b2d57e..aa7940c65f2d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
> @@ -1399,12 +1399,14 @@ eqos: ethernet@30bf0000 {
>  			};
>  		};
>
> -		aips5: bus@30c00000 {
> -			compatible = "fsl,aips-bus", "simple-bus";
> -			reg = <0x30c00000 0x400000>;
> +		aips5: bus@30df0000 {
> +			compatible = "fsl,imx8mp-aipstz";
> +			reg = <0x30df0000 0x10000>;
> +			power-domains = <&pgc_audio>;
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> -			ranges;
> +			#access-controller-cells = <3>;
> +			ranges = <0x30c00000 0x30c00000 0x400000>;
>
>  			spba-bus@30c00000 {
>  				compatible = "fsl,spba-bus", "simple-bus";
> --
> 2.34.1
>
