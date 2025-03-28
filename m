Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2053.outbound.protection.outlook.com [40.107.21.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFA335C0;
	Fri, 28 Mar 2025 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743176078; cv=fail; b=HffNs3z+oFmOMV15tHETQtaA25tIOAB45pViUUhYvVWdbw0O7uqZzHfMhbBD7YYVJj92EwEzyh04tkfqnRspDCXJ72aQ4GOKa2A82TTa8hS4i80HsOuKYMiIJfM64OaHzdkRyPI+tyq6fkltOFvdWRS7JFpXalbehlBbtjFCAHo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743176078; c=relaxed/simple;
	bh=aJO5V/VrpAKeLCMyCHKZ10rbFbUSlXOGLMIP1gYenRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EZAK2TLKy2h0RtP7oetLibeHC0xoLbaT0CmWAJGz2q0Pz4UFg0CC2G+nuDMTaMafeFOx7MTKbWq/w2zSI9chqiDygqi8I/FAIcDp+ugwk7lMRMM/FEy5fXyULK9homm0FH48FT0lNJjWxQctz5XF/W63HEygT/kGdmPyyWt7Uzo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=fail (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dCE6BjzK reason="signature verification failed"; arc=fail smtp.client-ip=40.107.21.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dCE6BjzK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMcdpvXZT8JplFYiFe9KJU3u+T+387+slVXhDIqhgM/RtCKLOpfI+hNP0pPqa9MgSiXcPZmceR4T5aw30aGV2kWGRMGuIwizEMhJi1lMqQw8r7vfj40MZ6pfyYAKLLPwo4ZhkTCEpfEO9WR3i1KWmmYMCD8O+Uxp/ORc1L8rRIuV4hrCrOy+mECK159r1jU9xqSP840cc0FvngomgY1uDGplJZJj6/lJi+hQC0COeq3BSGRHG6qXpShdT84S+q7ftesMHuZ+INoLBMR8oxhAYOlmzAE48kg7UvFlzBm4fiGhpJYFT9OFtGw2F6rrHrPkdkDb56IIEo6IK0YWiENOpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2gjKXp1t6wq0e40dJORvsZwDvsky+/XuakgHvlbryY=;
 b=lDHBRVuRloHTm9AuyKwYK8T7dug3pKDYqKadkgATEFyfkit0r6hDdvW5k6gMT5XSqwcJ8B7/XdwyaZBmkT2gRHw4KWFxWSXnU3j5DL58RntzczUGuOYVS6bEzs6YWcxEpSeIPY1fum5ZFpTbbZvOP7Ktz7QBFnQHh1pNIxIDEhiNidmSlpl/mb0lLdQO6p/MfDbalqes0vaz4+CnogxH106j+fJP/RJRn9o85pfrdLLubuvM0A6dS9VYirnJRlmATBlDL4kSJDXhflA9lditU5sqBYOIyUDddVrJEQSVvEwB/APSbCb4C/HnHEdNJ9c39TVfMSW8EiyeqgSKHjQJ2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2gjKXp1t6wq0e40dJORvsZwDvsky+/XuakgHvlbryY=;
 b=dCE6BjzKvli+/c1bc8byXadQAgQivF3ubjG6eejBi/CLC8P/4xoQYt4ELh52tiVmPy7ObDoolR22sZr6k1PwlyNppaYL94T5VxG/Xi+DAF4u5vt4sd57EHPjBkOISWOOJTw0MpyI5/AprjRPuA7wjCu2xkEV0YjO26eUpAJDwCfU1Csg9kg3G5hP9ixAc/NPpSFlP3XZOmjIKvuPBzNk9MrSOmQGYvMDg+aYx09KsPxnNAyhE0UcpNrSUCogyzdIiNXxIxC2F33EsqOd63VGQ+FAfiD7m69ZSekY5ExDfW0mE9dvbaO6CuBIphfqdtiT5vPNilrI76xIKkjbl9Mpvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM8PR04MB7844.eurprd04.prod.outlook.com (2603:10a6:20b:236::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 15:34:32 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 15:34:32 +0000
Date: Fri, 28 Mar 2025 11:34:25 -0400
From: Frank Li <Frank.li@nxp.com>
To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 7/8] arm64: dts: freescale: Add the BOE av101hdt-a10
 variant of the Moduline Displayy
Message-ID: <Z+bBgbBjjSbeNWq5@lizhi-Precision-Tower-5810>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
 <20250327-initial_display-v3-7-4e89ea1676ab@gocontroll.com>
 <Z+V9UCSN1L6lIVat@lizhi-Precision-Tower-5810>
 <PA4PR04MB76307362F79F848A8B7AE905C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PA4PR04MB76307362F79F848A8B7AE905C5A02@PA4PR04MB7630.eurprd04.prod.outlook.com>
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM8PR04MB7844:EE_
X-MS-Office365-Filtering-Correlation-Id: 39d18ded-58c8-4c19-cded-08dd6e0e0949
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?GJuvpC2otfGgK80E6b7E8Ux3RyWWgYThCxc+gjTSirwRfs0mkApZvzsdXg?=
 =?iso-8859-1?Q?0mCV7TsgTxyEhueanjUxZE8SwHiaAdk/8rMGb+0IqLXh1YkepdHrPTGtJV?=
 =?iso-8859-1?Q?g3XjtdcEwtxJPbtuIo1o+PwliLZXBBgfx7Yfv2pToJzZ36WEYSpu8PMAL1?=
 =?iso-8859-1?Q?PnhMIkp14IZGNTQ7fK7upGnE4J5pbULN4sVGOf6pUv1Yj5FeJ3hRBdsqc6?=
 =?iso-8859-1?Q?lvhtQNOjk9NUHV8WGyihDKkJybVZf9mQsbwMdVO181u6EWEZ9xuj3zraVf?=
 =?iso-8859-1?Q?0we0f34pf4IJvYuwQ31be8mXs4/0aFTM4ViNGJtvbrY9PNLELKiqskdgBb?=
 =?iso-8859-1?Q?YsEQbwbT4xDh+OFoCDZVsBo8SF4erwCj9fXumLRoIi9j+JpRmf0wWDMfHR?=
 =?iso-8859-1?Q?hPMR+6RMwD19bEEr3WJi24gQl/k9DrgWnGt0/56m+D/UNeUaX/xynoPpBG?=
 =?iso-8859-1?Q?Il95nebOQZK/DEofRf3uruQh3A1u9eh60s/N4LPPlL0aL3IJw/UQEC6XWz?=
 =?iso-8859-1?Q?tj4ZCWlm3412QT6Rvv4YLvdRWCLer8NuBXI4aZqML4usF59c5AZyYKyJva?=
 =?iso-8859-1?Q?iX8wybSOipmMFBrnnT8O06F1mx/vkvgxMfWYWF7cQV/KO6xyPlE9LNJINZ?=
 =?iso-8859-1?Q?JLHVeR1CIQBVlmyy2/NbLBDit/P3ze39YDi4Fj895v1uIgTypfAc4tU35a?=
 =?iso-8859-1?Q?Nw0P0W37znXCEoVGxcJNo10hwFwnYg6wAAyIUliI+oBXXdRXXw1aUy/qoZ?=
 =?iso-8859-1?Q?+GJY65yAgXwVbQHjB4vHQB4N1zMqVJ4qgpTLMQgTD3mmVhT8NYc5fwLkNg?=
 =?iso-8859-1?Q?/Fe90k8jp7QxHSfNyMW4YrQypCaPnu055FvYNKWRbqc83OMck8Hc+DV2n4?=
 =?iso-8859-1?Q?Jw/AWGaJMG0n1zw7LEM8/6VQ3NLHqE9TnufG7Uh1HPDPYHBL1hzrlFlcUQ?=
 =?iso-8859-1?Q?DARFO0JYo5t/kuveqkrfptAlLPJUtURgqCibA4ed6PsWkFUwz1FxgNwJ8a?=
 =?iso-8859-1?Q?UTuAwXv6AdJukgcfVdTYbvtMPamGMsYnixq56BptFl3fsC2Xf4BsIwmCy3?=
 =?iso-8859-1?Q?WTrhjGUDN+h/agsXNROdSnZVPb7ohP2t8irEsS5R9i9CYZSIMXd72kXW2W?=
 =?iso-8859-1?Q?AgnNEYL1KTvYEJrLBVji3BZGVBkZfZxhbb9LnzPISKjusx2VBB9xqVtnC4?=
 =?iso-8859-1?Q?1UbI1B1WVyIrDqM9zeVFTNzvm3ApdMrRIBth2VPWUBu6NWPRq3S5KQC6OS?=
 =?iso-8859-1?Q?zIsLnIjf12V4yBlD3V+GMqS7nZktyxRDE9dId5z9CRt0mXPmGlHsKOO9zt?=
 =?iso-8859-1?Q?ASS+1nyNv6AmkBkxnnOSzjz4MQVQhbKGH80ZOoXLYcUpVMeT4xW73kVUtK?=
 =?iso-8859-1?Q?zWAXdseXRpk4D5ZJpbm08Ja0T+CpB9rCY8AlspE4T1fCzX850iWeBc1kl7?=
 =?iso-8859-1?Q?pBEJ39Foj4nKXf+1URRzw4iowSGmsZOhrwxgpw9lXYQIS4W3ciPnV1UDHs?=
 =?iso-8859-1?Q?lVKlZvO6Gnl3NGYBYr31Q0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?L2H0zCmma1DOfZ46EKgUcLz77thPiyWsGOWyWAKcpPdisSFPruGoLVCage?=
 =?iso-8859-1?Q?36cOW14TEFlpU80w0MmJrSZMWbvFCd7KYMTECm/FvRt4YnvnyPGaaYtmG5?=
 =?iso-8859-1?Q?+d98D9sH8GCSQyZ4JX7/E2+IDoW4NdQA93Quf1khUmsLSVGhwDnNWMv6qf?=
 =?iso-8859-1?Q?2nSQajQsOe7UHW2iEVemN6YzbqCYwDTDiCt/wqit2pUPQTKNMizjUaOXpv?=
 =?iso-8859-1?Q?ePrn1wQpjZ7z1vhiwkKzm0Esh0ZRXJ5CtdZUz980srJu+SLJ3FlptOoGLH?=
 =?iso-8859-1?Q?I6ob4SEgyicN+U68PrwhhhxZ0zdQm1FW1eUTcXHi5Px4AV6LuVTwVUfJa3?=
 =?iso-8859-1?Q?DYjXTMTLmIYmRcyUWUhtUtryN2n+Eu5dd8X8e13wkculP/xgMB1J8gunYG?=
 =?iso-8859-1?Q?t17A5dD8BcWOyhqmWa+ndhmKKbpJyT3Npq4Ff2bqovF7C8LLny/q4H/UVT?=
 =?iso-8859-1?Q?wcxEjf49OHH39Wy+j/rCf50K8pAFihsytDGf9aUJQ0364b5mWSUZK+vv3F?=
 =?iso-8859-1?Q?jUxhcnnmrm5hBrJPrrBMjwS+Xyy+UpxXDw2VgkcYE33iQhhI5ASPOStE6X?=
 =?iso-8859-1?Q?DMxz1wVX152mfwQ76reU5HcWCN+SyMayYnuMnMarsirDIKWUtBAouGHrXD?=
 =?iso-8859-1?Q?YBBTigpzsnBj9eWhDU788KklKprjNfRnZRNNkU1A43Zv3PXk7Q/6oX95UI?=
 =?iso-8859-1?Q?EpVZYnZHL299KupKi2k+c4gezexZqMrf1TadQBoqpg0MIPCu0iri2HXsUm?=
 =?iso-8859-1?Q?vJ04EoYym0YVWdlmlYFLwiKqeYQuWzPuxwB397q9gUnyHjl7smeqBxK/HG?=
 =?iso-8859-1?Q?C42buOK6EtrROCfCmsnyCGYsvIEVDlPa7b3HZJ1koevuW8V/7Urxxwi2sD?=
 =?iso-8859-1?Q?yf0r+5m9RlrGtvCjRnSExQMxwUJylbCS9NoY7k4pbPWVkoOmJ+WZXwo0XA?=
 =?iso-8859-1?Q?JDhD8qHny0GYC/sU9EDyB4X5Du+K2MIayaAv2pf5NohmERjjE2ISL8WCwe?=
 =?iso-8859-1?Q?kbyQmGQUhyf50onoMH5j717CBPsTveAfKo1ALgU3zg3sun7anKPUB+oaTv?=
 =?iso-8859-1?Q?CobotnPDhK5Xwt5slhbOrnwn6yMPpAQnTz8101uNm4ygYqWPYHvBojR/bd?=
 =?iso-8859-1?Q?ZoKWlZrM5UfG/WiIGKHtfhd8z9cWHLCRHmCEE6dRvFVGyE+BmbuZzVCiiV?=
 =?iso-8859-1?Q?Xr/VICbCmTYICBdIuEVl/DfvOlzHJni9kAnJSnGNZbV/Ow3RPcYNur1FVL?=
 =?iso-8859-1?Q?IEEEf66wx981wir/+9gxQgQwkp5Ws7KcNFh8mJg4dDH8d3wafEUZ3ul9ws?=
 =?iso-8859-1?Q?bJUicZg+Lgu1jcS6CVdLQA6loqK3Wk0tP/07UtE63vYsP+dm/BnKpJ1eW6?=
 =?iso-8859-1?Q?D3F2suQBQqq0qcOWaUj9cDLNTJ4hKKCdEFcu1z+y1MnVA7ltpUYsbHP40B?=
 =?iso-8859-1?Q?ylpZeAgcqDGB8ubzNvx+UA/SO7dr7GfEqHOsMILLg0+noFOmdYMdK+l7kX?=
 =?iso-8859-1?Q?rDTHoDXd3QopQTyyWJTjejVx95zTU/6z/u1rETjIq+W3Xim6EsXU3RszMk?=
 =?iso-8859-1?Q?8fipIQNbBvAttVOjX32sYEQdEPafKWjqIbVOoQ5G2grZJwBPpSHPA3LJDB?=
 =?iso-8859-1?Q?z1E0JL2FNcPo1PZABUxo5cKtN5uVFo9zcu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d18ded-58c8-4c19-cded-08dd6e0e0949
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 15:34:32.4506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0/413flI5PKBWjEnpHa1r0zyONMl5RZ63luMby8dP/Tt+yby9wcEAcdx7XY6DyBatrfw28XrtnjnVaMoaLBv0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7844

On Fri, Mar 28, 2025 at 07:37:34AM +0000, Maud Spierings | GOcontroll wrote:
> Sent: Thursday, March 27, 2025 5:31 PM
> To: Maud Spierings | GOcontroll <maudspierings@gocontroll.com>
>  
> > On Thu, Mar 27, 2025 at 04:52:42PM +0100, Maud Spierings via B4 Relay wrote:
> >> From: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> Add the BOE av101hdt-a10 variant of the Moduline Display, this variant
> >> comes with a 10.1 1280x720 display with a touchscreen (not working in
> >> mainline).
> >>
> >> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> >>
> >> ---
> >> Currently the backlight driver is not available, this will be upstreamed
> >> in a future patch series. It is a Maxim max25014atg.
> >>
> >> The touchscreen has a Cypress CYAT81658-64AS48 controller which as far as
> >> I know is not supported upstream, the driver we currently use for this is
> >> a mess and I doubt we will be able to get it in an upstreamable state.
> >> ---
> >>  ...tx8p-ml81-moduline-display-106-av101hdt-a10.dts | 100 +++++++++++++++++++++
> >>  1 file changed, 100 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts
> >> new file mode 100644
> >> index 0000000000000000000000000000000000000000..1917e22001a1815a6540f00cf039ff352801cda8
> >> --- /dev/null
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dts
> >
> > why not use dt overlay to handle difference dsplay module.
> >
> > Frank
>
> This may just be me not being very familiar with overlays, how they work
> and when to use them. I guess the advantage is saving some spaces in not
> having the base board dtsi copied in two dtbs on the target right?
>
> I am still quite new to all of this, so any info on when to use what is
> greatly appreciated.

Overlay help change NxM problem to N + M.

for example, if you have one "compatible = "boe,av101hdt-a10";" overlay file
BOE.dtso

there are N' type boards, such as iMX8MP-tx8p, iMX8MP-tx9p, ...

You only apply overlay BOE.dtso to iMX8MP-tx8p.dtb.
		       BOE.dtso to iMX8MP-tx9p
		       ....

So needn't create NxM dtb files.

There are many dtso file under freescale, which you can ref

Frank

>
> >> @@ -0,0 +1,100 @@
> >> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >> +/*
> >> + * Copyright 2025 GOcontroll B.V.
> >> + * Author: Maud Spierings <maudspierings@gocontroll.com>
> >> + */
> >> +
> >> +/dts-v1/;
> >> +
> >> +#include "imx8mp-tx8p-ml81-moduline-display-106.dtsi"
> >> +
> >> +/ {
> >> +     model = "GOcontroll Moduline Display with BOE av101hdt-a10 display";
> >> +
> >> +     panel {
> >> +             compatible = "boe,av101hdt-a10";
> >> +             pinctrl-names = "default";
> >> +             pinctrl-0 = <&pinctrl_panel>;
> >> +             enable-gpios = <&gpio1 7 GPIO_ACTIVE_HIGH>;
> >> +             reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
> >> +             power-supply = <&reg_3v3_per>;
> >> +
> >> +             port {
> >> +                     panel_lvds_in: endpoint {
> >> +                             remote-endpoint = <&ldb_lvds_ch0>;
> >> +                     };
> >> +             };
> >> +     };
> >> +
> >> +     reg_vbus: regulator-vbus {
> >> +             compatible = "regulator-fixed";
> >> +             regulator-name = "usb-c-vbus";
> >> +             regulator-min-microvolt = <5000000>;
> >> +             regulator-max-microvolt = <5000000>;
> >> +             power-supply = <&reg_6v4>;
> >> +             regulator-always-on;
> >> +     };
> >> +};
> >> +
> >> +&lcdif2 {
> >> +     status = "okay";
> >> +};
> >> +
> >> +&usb3_1 {
> >> +     status = "okay";
> >> +};
> >> +
> >> +&usb3_phy1 {
> >> +     status = "okay";
> >> +};
> >> +
> >> +&usb_dwc3_1 {
> >> +     dr_mode = "host";
> >> +
> >> +     port {
> >> +             usb1_hs_ep: endpoint {
> >> +                     remote-endpoint = <&high_speed_ep>;
> >> +             };
> >> +     };
> >> +
> >> +     connector {
> >> +             compatible = "usb-c-connector";
> >> +             pd-disable;
> >> +             data-role = "host";
> >> +             vbus-supply = <&reg_vbus>;
> >> +
> >> +             port {
> >> +                     high_speed_ep: endpoint {
> >> +                             remote-endpoint = <&usb1_hs_ep>;
> >> +                     };
> >> +             };
> >> +     };
> >> +};
> >> +
> >> +&lvds_bridge {
> >> +     assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> >> +     <&clk IMX8MP_VIDEO_PLL1>;
> >
> > fix indentation.
>
> Just put it on one line as it fits within the 80 columns
>
> >> +     assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> >> +     /* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> >> +     assigned-clock-rates = <0>, <1054620000>;
> >> +     status = "okay";
> >> +
> >> +     ports {
> >> +             port@1 {
> >> +                     ldb_lvds_ch0: endpoint {
> >> +                             remote-endpoint = <&panel_lvds_in>;
> >> +                     };
> >> +             };
> >> +     };
> >> +};
> >> +
> >> +&iomuxc {
> >> +     pinctrl_panel: panelgrp {
> >> +             fsl,pins = <
> >> +                     MX8MP_IOMUXC_GPIO1_IO07__GPIO1_IO07 /* COM pin 157 */
> >> +                     MX8MP_DSE_X1
> >> +                     MX8MP_IOMUXC_GPIO1_IO09__GPIO1_IO09 /* COM pin 159 */
> >> +                     MX8MP_DSE_X1
> >> +             >;
> >> +     };
> >> +};
> >>
> >> --
> >> 2.49.0
> >>
> >>
>
> Kind Regards,
> Maud
