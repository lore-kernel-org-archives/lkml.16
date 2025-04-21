Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EDA24C92;
	Mon, 21 Apr 2025 18:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745258421; cv=fail; b=JdKubHWDRP9Nd0DlqgsmmOocly332Tl6bWgSAO87Z5kZhr/GUYA9dfq9nL6GTmfKGbYtRFNg6JK3gFIyUR+TfoYhvwBngE725vTAKo3mPDdhNGhP2K5FKqYQusNoxFvb8RQrjSdJdiWi+7rzYIQr5vPrFbSKomjeZTxHXA921zI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745258421; c=relaxed/simple;
	bh=7PnNPGDaiix6qALFEl8nl9MmDlOBoYLcP73I9Gqka4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oSrv5EIDludwwkCmDzPJ2TB41r72g5l0qL9NcEAY541FIWwywbWLbwq9lIx48pBobqqgf5zq6mN13zoDUg0gBUd3RtnyDn7gotNAS3kk3CGFYDCyhk1lHs1s9nu1Cvm4wz0nYrFDR2LkNyxSKI7rQzn9/6yBZnTxOVuajY68cN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AhzCZpPK; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AhzCZpPK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mTVFGw/LCkTIzagk2bGcSFVAazGbL+PsbzqZ/M4ZoMQXAhXkyBtlsby+H85wnq9kQDpXxvUbqLrN4oZwNVNVy+az/bC3gO8F0SL38BzPwGhVEIPKN+rX1ex7MmouWCQJXL7uuXaICUXChKAPkO+2M1mw+aWNeJbGPuHs3O+FSxHyLpYs4i3EgmoOLnPN3do/oqGztCtKUE3Cv9fbLh3bU/1ObZotk84e8heBfpvCWUWTz0HgW53Zrq2q0TllVdc7m3KU37WMQ/WPS4jdRFMrOAUkEb1gvx5QaSgyNc7mYC4NRMi1vrXxXkNC+RvHpUx3IQH3UFgjkpfM3U/bQWmUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzaDC3DAtch+3FDOUgxQmk/AZUTU7JRap29ozDP3waA=;
 b=WTlTJaIg8Tl3ncak0lSmpwXhIvm6Cyd5WD4ztxRWnx5KniDKPAmIeoy87C7duSbO+VrHxkUcb5ctBGYrfh6x//BlKcXNt5F828JU0JHFbmPav1goQo+bw5RTOBHkvqed4ByIDL+xiaXD8RBq4sFU4SUyDrDtsgwNq3DPUlsoebDTJTXJ77kbd2I4sEMszcLEUQoUdMQSvymacrK9NdKG54ZNJRFh/2cenfCAi/Op7oIRjrsw1x+CvC2K1HZPVl/TeUEIeLlu1jp83X26GoypU6bI0ipm28A3GquIylUcN5M2GgYx205Mw6K/TdM3NlHod6o1+oon7YWZgxqf0yzFfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzaDC3DAtch+3FDOUgxQmk/AZUTU7JRap29ozDP3waA=;
 b=AhzCZpPK+h9eDnknjcuXNiaGlfIozdAcA6dmGTq5nLb5OE7wi4bh61OqCBNHsgTcIC6+ox85f3/9scQxAAATp+CMFm5xRXnUqhy9n6nE3yqFhYN6i5tVwizn6YpohgD8Hki8k3NDPMs7FKdyBRd4qTTSTM+Li0/38Nxtl4TiY9ka+lvo/oI9uIVYkpRWtGZR2mZ4l3NRNuNUIBvJo2zCjnPyD6GnKu7lPSxb//Hkioi88lBryGdcR2UjtXV8XyXLrPVtVo2il+OmoN9lnhJpP10pykpO4Jza454hRi1qiRkf/VLKAuxRNmBOZpGjLRs7BojRlvfAQQu3SoXaK7aYyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS5PR04MB9856.eurprd04.prod.outlook.com (2603:10a6:20b:678::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Mon, 21 Apr
 2025 18:00:15 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8655.025; Mon, 21 Apr 2025
 18:00:15 +0000
Date: Mon, 21 Apr 2025 14:00:05 -0400
From: Frank Li <Frank.li@nxp.com>
To: carlos.song@nxp.com
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, conor.culhane@silvaco.com,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 3/3] arm64: dts: imx95: correct i3c node in imx95
Message-ID: <aAaHpQPTehQ0uqJm@lizhi-Precision-Tower-5810>
References: <20250421111513.2651797-1-carlos.song@nxp.com>
 <20250421111513.2651797-4-carlos.song@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421111513.2651797-4-carlos.song@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0262.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS5PR04MB9856:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0620ed-4386-47b1-e1d5-08dd80fe5e5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pC2IZBAXs6EhMi/2zRn4nWkguP+dsV0+ZOk0mjcQoGmY4pJmSXpZE92fgUZ+?=
 =?us-ascii?Q?py/btIk3j5h8+HTirJ+Q1mIrti7fiOJsOgpqdN6s2lT1oIH7aWdRXFO6fwwc?=
 =?us-ascii?Q?WI8BzZXLnoQQpt48i57DZD5ytgdLevenh6eqzzQKlKSbzUUdZcv3HI6ZVEwb?=
 =?us-ascii?Q?yMU89a0O2F8qT6+wOr1ms3gVzVWYzcwlepM08y3ZrpysTyXVoVG5tKpL1wf1?=
 =?us-ascii?Q?qw+CjYVVylNWW411XClKkpSFcyYu0wIQu98i1jEZ0B0W93Ce1QX4vd7cJIpH?=
 =?us-ascii?Q?pycSewsWGdG/3aPnRcBNs2oTX2riJB7vV95P8+ZlmLZL4wJHyClkmTG9tqhA?=
 =?us-ascii?Q?sDmqGXQHkYdhuaIQVvdVXRfdydbrJ6IHI1o18SQNXxchg8+pb/7lxMlU7RhD?=
 =?us-ascii?Q?ZPp9lXPiwoMbv4g9TxkhgKrmwgfL6tCCoaoXjjvmkbpKIUhrhax3A9UpbM2k?=
 =?us-ascii?Q?4g0/FBp16Gq1ac40i9ZQXPFtEPF7hc38ietWnJFDM7c2s0LJHgdTzMoyNRIU?=
 =?us-ascii?Q?OcUvR18Dmj+MZ8ptxYAqTvRUssvXngTGVQC1e4vo37tYDxyQ747hLu9D9hJM?=
 =?us-ascii?Q?FFm5oYhzEXdFtz3Wqn0FGBL6mkIxRLdv2kimY0ZKxLdPMRU4Gdk/9jlyu6Tq?=
 =?us-ascii?Q?L9nwrT61nZiz9Cf2uba/bB5Nv8Lw3qdVT/HI4Dua1NVR8mVlD7CG7MK1Z0mx?=
 =?us-ascii?Q?GHiQ+y+YA8U0UNg7Iaa7CSksQhBOtw6Etd+lbDMLICxbVUK1RzA/1XvfeL9T?=
 =?us-ascii?Q?P3+T8yoxTa684+yGz3yOCkKOHRLZuzq7U7AkSdl1kEu8rvU839xn4MG6OZdC?=
 =?us-ascii?Q?e+7rx3lyyspOcEgV+RhGK7+3xF8sKGFc7vS9nnXp/VSj7FOV8/Xgg7jNZfck?=
 =?us-ascii?Q?1XIQO1YyfJLPY0rb7YZcGAWSik9g+6mfXXYuH7blcsLECxXmZaajtuLTfcER?=
 =?us-ascii?Q?+MZk1IV3/XrGFJGj6FKAhuNq8A3q6MIcxqq4WazMzjUCLGNrVqjt+F0+dLgC?=
 =?us-ascii?Q?nU82Zglit7wKJ1mzNDc2MkXioxeojkk1go9+TqjsrwpH9vq252bnFx9uD4eR?=
 =?us-ascii?Q?rBzfiT6jBLExPn9phJssuaBaSKcCeUFqWjSqKEGfbKyt2i0VsjLtqfi2xFHX?=
 =?us-ascii?Q?kqXJgab581g9LSJ2X4T4ku4sbBsVcPvFpFAdLw3hWTCCVRVexVuPeFkSPfdm?=
 =?us-ascii?Q?LxAZcQbzB/BHTqohR0+R0gGtnZo/S7ry/UTcxSQo1u2giobaIGFeLXh7063H?=
 =?us-ascii?Q?yN+Ytj+bj+jOm74+3NQ+NXRUChBP7dJBaXq3quCkoJgDgfOpxXP8ZSaESvUG?=
 =?us-ascii?Q?Km9Bbk5FuAQKV26b4+VvCbDyEzB8ORRX7qWUmomg+1d/une2egUuuCrg7WdE?=
 =?us-ascii?Q?mpQn30vknJNRDn1ImKTOf0JvA3xG/bEAqSkmQwhcF6lXwHJnWj5H3M3xdaP2?=
 =?us-ascii?Q?kL/ATo3CfDnZp+UKXFEi0//0MlCCarInMjYa3F06bin+iZUWOCNupA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1n49IrktAw8hj8eP2fN6eJNXHdAWl75mg/PVKjgDZZNF2EZMA0aFN2wXO0uU?=
 =?us-ascii?Q?bomXzxgqYmG9QAjk6Y+uHKw1mRv0ho7QoyyVoSS2rKeIoaXbR5uihbCg/CtD?=
 =?us-ascii?Q?3icDhM10rw0Pv5g8dVSjiqrCwcwZPKoAeBTahLVTV6SU5iwZ4ZoZvbBDX3Oa?=
 =?us-ascii?Q?firX2fiLAyKdZ3AgDxuHFsTUG2mqQLEanOC3C4rMlnTTPC9ed43r7rI9VGwD?=
 =?us-ascii?Q?E1MnjwEPkfDB3AlQr94Um288e1LYMdWroLK1spDX6Rc0YOQpdaKubDDw2MFw?=
 =?us-ascii?Q?3Q9sUsF6vFg5FWBlv5EuDqycTHRauPFIwEi3A0rBz/TkNTcN9PjJSffLfAKv?=
 =?us-ascii?Q?0Oqqp8PO0/3hkO5zlm4tpWRPXmNSet+OCUhLZXU+LNJxSC7hMtJ9p+bv6RIn?=
 =?us-ascii?Q?RgVp8QiM/Jiyr14ZuRpNG0ZteiUtAM9fOIeSf29zOoM3l+yiFVLGWY9Oq1pD?=
 =?us-ascii?Q?RNuidoQ/RE3Qpc9SXDnMQwZ3J94H92l+whg+oS0k4EXhm3aOncCntqVW7yJR?=
 =?us-ascii?Q?UHlKYAaymjJmoW4fS5C38kFR0MYptmw7VgRzAStrU7Yt+v67I6z1ERcKFNPU?=
 =?us-ascii?Q?cZ/joPfAIh3cLjWcNyow8oRggq7WMufK6o1iQgTEdC9UjHFh+8Tl/yAZnkus?=
 =?us-ascii?Q?BhCpAPH5VKnyebbDdNj5L9d7eXuW6WBXit4tjuE7IkcBjhnYdZaAZW4fG2CS?=
 =?us-ascii?Q?Jf9Yuoyang9ExngIE1RUPzGMlyihXFTnqVXfBL3IDn+en6UAO0TdjWJ8xaer?=
 =?us-ascii?Q?AasREMoUQ1xwQxxZ7toF7f6lG3+AKvpJfwtbn81ndMAHcTgkUQPnNbLTQR6W?=
 =?us-ascii?Q?zDxUqAK5iAZPr+GP7uzuAsByA6PBqmfyTjgs9x0tHxD9qKibwuDmUHEmpfTp?=
 =?us-ascii?Q?5GZ8ev+VJBAA19pHaM3vSnBbDVoqqMjHDPflOpoEPGxpNF89VmWY1RirgWau?=
 =?us-ascii?Q?MYlKGIcPP5+s1WsfHJ/DBmx37gKd3TlnwgV80M0ndsk0QtsO/E6l8k/wTNqe?=
 =?us-ascii?Q?MdI9m/7DaJerFXXNX145gv36uPKj47T/AC5N7SzUmTj+Co97/w4jNhffyE57?=
 =?us-ascii?Q?FLQJHWkkxfyw7S0laPr4A1IGhwEnJ5vb2odwljLnsuOlcgjn/jXN/Bo1ULh+?=
 =?us-ascii?Q?2+SOAL/inqrN4/3NPkMoXxf8kXQy+cJsu+WpbTOb6RzJE3o44EHhFT1LsxjN?=
 =?us-ascii?Q?Nz/AAm0uhg/hs3aJnO338airFCz4dIedL30LK+HAxJjzjz5kVdVDovocdYGl?=
 =?us-ascii?Q?GRZWSX+DVyfTzgWiXVZ0WQHoa4hCEE9Wr5x5reulc5I5Oxyhrc1eztQlnemV?=
 =?us-ascii?Q?pBuH6fUEaqzCWceHGybg0ufW7OqCol3Q6wvOKiaNO+YYINAtCV64jUHQzPAu?=
 =?us-ascii?Q?QlAqfQy+fymeSLGl/qRhKeuaeOREaJdv5ZGyGvGXEfUOrMB3He4QoWMhu89O?=
 =?us-ascii?Q?+my2sYT7sVjsT5HZrVkTRJ/N4HMP4m/a5/cyXupmj1eGMjrSUd1Y1PZ0ZwcR?=
 =?us-ascii?Q?0JS8hQNSLCqN6TVc3JtR9XiG83Xz6AoNYPn1j94Qw7tvGzLjeWFk7ZdE+ruP?=
 =?us-ascii?Q?/qhuHSCTkpXeWGvNmUNcYvS8EquncLVGLd11F03b?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0620ed-4386-47b1-e1d5-08dd80fe5e5d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 18:00:15.0934
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z2rmJCtEln2m89sRXSxxCSXIYzDAXnieAEpPJZuQulr6pfiYrSbhn8K6A38/dcEoEy4Q0rB0M4Jj0m9hbV6XNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9856

On Mon, Apr 21, 2025 at 07:15:13PM +0800, carlos.song@nxp.com wrote:
> From: Carlos Song <carlos.song@nxp.com>
>
> I.MX95 I3C only need two clocks. Add "nxp,imx95-i3c" compatible string for
> all I3Cs. And correct I3C2 pclk in wakeup domain to IMX95_CLK_BUSWAKEUP.

correct pclk in wakeup domain to IMX95_CLK_BUSWAKEUP need sepeate patch
with fix tag and cc stable

Frank
>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> ---
> - No change for V2
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 9bb26b466a06..fe28c0c46eb6 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -681,15 +681,14 @@ tpm6: pwm@42510000 {
>  			};
>
>  			i3c2: i3c@42520000 {
> -				compatible = "silvaco,i3c-master-v1";
> +				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
>  				reg = <0x42520000 0x10000>;
>  				interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <3>;
>  				#size-cells = <0>;
> -				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
> -					 <&scmi_clk IMX95_CLK_I3C2>,
> +				clocks = <&scmi_clk IMX95_CLK_BUSWAKEUP>,
>  					 <&scmi_clk IMX95_CLK_I3C2SLOW>;
> -				clock-names = "pclk", "fast_clk", "slow_clk";
> +				clock-names = "pclk", "fast_clk";
>  				status = "disabled";
>  			};
>
> @@ -1266,15 +1265,14 @@ tpm2: pwm@44320000 {
>  			};
>
>  			i3c1: i3c@44330000 {
> -				compatible = "silvaco,i3c-master-v1";
> +				compatible = "nxp,imx95-i3c", "silvaco,i3c-master-v1";
>  				reg = <0x44330000 0x10000>;
>  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
>  				#address-cells = <3>;
>  				#size-cells = <0>;
>  				clocks = <&scmi_clk IMX95_CLK_BUSAON>,
> -					 <&scmi_clk IMX95_CLK_I3C1>,
>  					 <&scmi_clk IMX95_CLK_I3C1SLOW>;
> -				clock-names = "pclk", "fast_clk", "slow_clk";
> +				clock-names = "pclk", "fast_clk";
>  				status = "disabled";
>  			};
>
> --
> 2.34.1
>
