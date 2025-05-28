Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988B28B7ED;
	Wed, 28 May 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748445002; cv=fail; b=CEK8E7P3qcntijS6TNhAvu9dA2A3JfolkiLcaXb/YWcpVmFx8EBDmD4MnaoPpAwBN8E/asvLSX8ryD8M4t67knVfeHjVyg5tbNuA66un8LaBW3M4+TCDvMcyUgTXqZSFSNqHdotPiV4cbkm+61fUd2HM28Sxcb5CrAYNXITLX5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748445002; c=relaxed/simple;
	bh=wPvomujM8Ge0h8Vm42cl679UI5Rhl8TGtkSCTqOcqKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AourF6i5aGMfNGjg3o8GyL1JgWv/w3q+mJaQHgtwzRUpLWWg4w6mOBmn7D1xUOMcXFvX4HqoSOqJAIUNm0AOe7/xqJg1LT+KwJjNkp3xyBCSrbGL95EXw6a2P6YXzLtLhtA+I4qdL2XU2j4gHC5QHqKVG/2VXmOLsNB7iJvkI2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OaGk8XuH; arc=fail smtp.client-ip=52.101.72.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OaGk8XuH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjBYfJQeqUHWFCEFV1OxSn5+RG7xuTPJ5YHWWSMu1UAmWui3FycuXBMzly0GiegPwQ7NFp6p8mt+tvGdd5zuoC5cgJC8L4Abp69RH6DkwzIH2QdM9OwKH88b/qDqLB8DiNTPT9U6zax9y0VDcLnWqoIEdQKQBAasuuPZ9+uqTaH2jSYWX2WqANHo5YIn21Ge8XWlvMhyPiwI2geBjlOZV0wMxcZwq2zye4O8rsx1RkAA/4ha1xKAJe682wWXWKHyrBWcBLRoqLGXxurBhnkE8hqg9AsewEYBLatEzwsOe6cDTgzeQG6U2u01npY6WpVoamsqWG4iKfRXsuwljtrurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ps8PukVP0TSbT4CWFwXwDiyx++IXKP5NdORyr0t4W2w=;
 b=MxAyuusGVkk2LFEGsHmYqaNXc/GKV4bdEjH3yqnNzUandgc+kvSl3Q+wbPsOB2yzkjFumBEHuQDsF7Djz6+gBriK1XqV1aAJZ2b6+9EgE7lPu1r+TWNLdVWXb+8QzvHPbPdG7VGIlKo+fJBR+TBIwrYvhanxkwXhlg5l9mQ+RDg/3jlVEGWmyHjqPfS7hOE6ValAeTh9aBm4YwoOf7xt5Sd23RXdtvgaEey6wiXoDBnDnjGnF3dIX+Cb3u/ZFZwyQp8wWuC5GAc43wdX4dMTHiV1mEN+HOIGqlZU/uRBVZnEPvj5Uub8excK65LTPvirAlIoMu3z0RE5SEnfX1R9fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ps8PukVP0TSbT4CWFwXwDiyx++IXKP5NdORyr0t4W2w=;
 b=OaGk8XuHeOPJnnocjqM9IUVw9UKY9AwLI8V5uwWnIbJ3vIHbAzA6Nxb5h7dQOoEsYr119tPGdtcSaJxEO6hvQkXNZBAQ0KiBw3BsWSDZfhScrBvbabsFZqVNnbUfjuoXzQcqsdULdcDXLsFRxOqL9wjk3xfKKS7rYgRtJpjKkayDRWB5Fo1314s/pEIx2VszBsgvz2le20ShFT3Ey01d+SgXv8OGaq3BCpscAeGKciQf8BVAJoaEOr3JOmx5bZ9XvGvautoolNqIEb0odM5vd/V3ywVRod0BZNmh8Eb5L4z5VGQc/ZOOeBtTTiKkiwbQiGH4CxgINTA9JyD8+dIjYA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA3PR04MB11250.eurprd04.prod.outlook.com (2603:10a6:102:4aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 28 May
 2025 15:09:48 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Wed, 28 May 2025
 15:09:47 +0000
Date: Wed, 28 May 2025 11:09:38 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: imx95: add SMMU support for NETC
Message-ID: <aDcnMnAJO+YVQ6rJ@lizhi-Precision-Tower-5810>
References: <20250528083433.3861625-1-wei.fang@nxp.com>
 <20250528083433.3861625-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250528083433.3861625-4-wei.fang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA3PR04MB11250:EE_
X-MS-Office365-Filtering-Correlation-Id: 55ad0a3c-2b2d-4601-ed56-08dd9df9af43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TTZ96uP0o59kCv4XpnWJRxxEhSPjwHmYYqg3geVXXK6d+6RhwePmtmME1K/A?=
 =?us-ascii?Q?e+XIC3zb/9m8P/vI8EKUqU9iXicPwto7BUh3AwOL+Mfrt0bUe9YYOjVbRmRq?=
 =?us-ascii?Q?Rg4jvBJ6Gi19Gwuo6651s7umNCRfpHm6SthzkijNcVHd0sXNP8Ff8tueMHoK?=
 =?us-ascii?Q?rjtZQn0MaiRp2ci//GcIgjrsI4/iamMF+Dod5K/HEMFi53I/C3s0WfE9976p?=
 =?us-ascii?Q?dO7d6sg6DFZ+rAVm94g8K966X4Y74Qtf8i1rSra4njpGJllueGWRQKpKp7cv?=
 =?us-ascii?Q?DH2qIKf2CgUsDVGc71n5t5AnJldwQfGoj+2aVC3ul0hLU5eb0fPhDYLGHBfN?=
 =?us-ascii?Q?McvXOyfnIXEzotLmCHIlw8CHjZjGC9aC7NRFn2qKJYs8lT6RsjamzUexhbAf?=
 =?us-ascii?Q?DRIMSNm67AEENUe4MiRqpEvbHhwfm1zrnwyFOwfzF5VnJ5wFH0SSuxRf8K9T?=
 =?us-ascii?Q?D/cZv2LreD259+RWQsqcRxAQRbyOtFJMhTlDycilPlGdWmnAIbLYMDL6/ht+?=
 =?us-ascii?Q?kOfCve0+vP7emuFL2+/KWPlDMlMx/rgomqEscvZUcqHFycwy06upzybjxDUz?=
 =?us-ascii?Q?Mf+5kT480T7Hc0gYSGQbTcxFpjCeDnyp1tko/gB52LH7gUW1avU+MaAIhAJg?=
 =?us-ascii?Q?DKb8ba/HfXNUT6av6AIdI+p/zPWkma28oa8P5jBeeQAqRgeebkqu0+ut3UqW?=
 =?us-ascii?Q?fBlSpnVuQEmivpdT7/SN5DorWgBvSLp588O+1uiuyB+zCNmJE52hmRbXA2Xx?=
 =?us-ascii?Q?DYt8zgFRaYavNv1VcKC38pd+h5z1CW9pa8tvFbnC9o0BHNvsr0dVnU+hpHlV?=
 =?us-ascii?Q?QqIppW3ae5aDTzjS7HRe00s9OLPqpbW9x88qdzDPDGge87EICTODcwHL3b6O?=
 =?us-ascii?Q?Gj+FmqdFRuJOr9eEjJxTy2T+YwHUrcNYG3gbO0JFQt1o2kps3zI5l/zexrzl?=
 =?us-ascii?Q?IKIBGdPAr8Gkgi/c/ntq16fncdlP6D0oS2Jb9kQydIzTfuCky1Ab6VEVQyCU?=
 =?us-ascii?Q?oHAxEVUr5LJ+cY7uAeGehAsIC9UP4hV+ixlETcEuPVoaxCqFQMvbLjv9urri?=
 =?us-ascii?Q?JyLWjwLTfmgR5C9hvLtbSTrNH6LVRCKEOtKiU+tc2qmhOR9WA/xHwoLTPUTO?=
 =?us-ascii?Q?rFu/MlYNCAajzdx9QFrPyJ5v1IhtVrVkptQpgjNmEnwgEp7h8LfARlfrFvaY?=
 =?us-ascii?Q?8GlqznVCEk/16cZWlm/1uEPG5Y5VhhChRev2hWVEAQ2YS/Mxh/lpccBa2UKm?=
 =?us-ascii?Q?1h9xq0o0fzMSKr6exnc2lz1WloQ6oZlUW7tsVkAGAoSumNJy7Cp4BMMgNz4X?=
 =?us-ascii?Q?zApd1vz2VskV3F2DRAcbAgND46ldAMI7rNEG4XEIHYsRzBvzmXzNORJjlPRd?=
 =?us-ascii?Q?3tCvp1vxi0wY3gU7f0Kc09WQTH7+LGiT8mDIBntJ2kJvaoDpS/5uKNvJFGCX?=
 =?us-ascii?Q?QgUfDn+/fkRAgTWDDrydLwCIA9kHkUJILBTu/ctlf1VTAe0o8zmng6Hz1KpX?=
 =?us-ascii?Q?3Z6jRm5fyIqw0nU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LY7z6ZPMIx8mLmYKm63f0WhYYRqO4duwjdP2yEgnFVRBhrTYs7mp2CikB1Q4?=
 =?us-ascii?Q?B3obRXpaSVLoFJ8240srGWZdRLtL5RHPUsB5WehbtKeWWovzqKEKuhNYdY7M?=
 =?us-ascii?Q?jjtkvYnwbGSkvLJfdgLKyfO7VK4PpxaOAXpGvweAPVEcgUv6XrzVABG2DoXW?=
 =?us-ascii?Q?yf76dBdwd1iyZUVnoqr/oVfrlF/G2Sprsyja3G7Yab0SyqyxTnR3lf8/02EH?=
 =?us-ascii?Q?TdZEAugQNPNwW4nL3qsw7H2Whj9oz7Jprd0fdkVbAWcorEtvvybsxb/PgtH2?=
 =?us-ascii?Q?LUZQcgiMLQx37v/4bu8w0hq2yE9viS4r1qc6gJ/iOuiXt1XG0oAE+LEh3khh?=
 =?us-ascii?Q?mZNUrcUH0hablqCm91yj9ywoajOY7IyGEO+kt9NS6u8wq0fzPeS69zbUR1IW?=
 =?us-ascii?Q?swdrL60EoxJAga/ZRhl7z0Q4iRBew6DDnc4HE2kO7tFMNNQm8cJ0YtKXXu7T?=
 =?us-ascii?Q?W+ppsgjYrFhiXcEg1gpBRJN3bD1e9Uy+BAEPUM4WozbnT3L1oQQOlEo8cfoT?=
 =?us-ascii?Q?sK3FA8cGQBCh4hcNOOviek110ejFva1aP67aIdd30cjQ2eNyOwbTjxPzrDEg?=
 =?us-ascii?Q?uA55Wmhh0MjnKgRuK+6JNXTatMNFldaCYXuQmyQf4yg3eDGz2Je+WwviNger?=
 =?us-ascii?Q?iTDWnyZZeAa9lf38qRsnB6ZZJeefnHdSZv+e/BKQDPrjJ1rDEH4YJqK3ywgR?=
 =?us-ascii?Q?KvYH9CHWPN3zeSEjrgKAEOUwiOHFEyQCYiBI00BWIRo+KdEbjXxabLJLUaKh?=
 =?us-ascii?Q?ir+guqbZcv3AAI220MFghdy2LqbqhmA5BSqydyJCwnoHQLKHnFnPvTNWfGJb?=
 =?us-ascii?Q?zloA6yzRHjwTrt7w+g+RuSsWREeQwb8WE71tUea4CM+bPbT7jiwadTIufPrL?=
 =?us-ascii?Q?BhbXy2gXHQXqZfJtj0/xySTqg8ljAxfZwFd2SDIGRPNMUkiwiAqZ0Xf/FX5m?=
 =?us-ascii?Q?jlFWaufTH2mk2/sUvSM8yt933LgVIi/g5HswPbaCqYqMrhQHyA0LeboclsUx?=
 =?us-ascii?Q?70ggLU/UqqCZJKpCebc4WhxcrEhaNgHwSVBhVrqkoFble/BUgwo/8c3184qT?=
 =?us-ascii?Q?Hg8h2mADGE/Bpa/H1MCn3QosH2G+w3Da6ADvvVRQNOzX9NapOYZ9lsoP7NwW?=
 =?us-ascii?Q?MdA0vQQRHXNmbs32O4j2mQZCZDPd7jGOD4gSxCuMWRXQZofJVqr8CPPOglBn?=
 =?us-ascii?Q?hNRtYeone/qCh2q66GC6EHRbk+ZKRrqoX+FNH1DG4nQ3PE+Xyd22rzv0iz5T?=
 =?us-ascii?Q?g0i6QdpaCUfXqeSNqR0W5AYtVxplty6C+1H64DJzPVdhqpIZdaRRtb3WYS1y?=
 =?us-ascii?Q?ytlD2IBPLCJMhlBWWfI/lXcUWZPCJVki543HytjQp1ElOTFLzflgyORU0VVQ?=
 =?us-ascii?Q?4mHU06oZBWk/EDJ5LO1Bx87mMCBLJo/ZH7Z9bLjY2K5Zxo6Ghq16J4MVXBY1?=
 =?us-ascii?Q?lr3Ill3fshustMqVrkFUaOeyRDCHBOhG57Qs3Cu9yFQKlwT3d5XMexFmQt66?=
 =?us-ascii?Q?eRS+sMfHgxf/Lkxya7aw2Jh4kRPxLJprhNCxSYYAXwO68frwPamnzxj3FcDy?=
 =?us-ascii?Q?N8EmIWXhR40SEO+CRQ0hz4RyPikFfgTRvppN0QJh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ad0a3c-2b2d-4601-ed56-08dd9df9af43
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 15:09:47.3273
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zJwndR+c8BNlVl4oL+22gmBYEbAeJnHP/bi5eZx7tzj9FpjLXeOiKrHxrhpDaKVH17dN7s4xiesltmMBbHDJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11250

On Wed, May 28, 2025 at 04:34:33PM +0800, Wei Fang wrote:
> The i.MX95 NETC supports SMMU, so add SMMU support.
>
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 8 ++++++++
>  arch/arm64/boot/dts/freescale/imx95.dtsi          | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> index 9f4d0899a94d..e9a5fb36f5d0 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> @@ -494,6 +494,14 @@ &netc_bus0 {
>  		  <0x60 &its 0x66 0x1>, //ENETC1 VF1
>  		  <0x80 &its 0x64 0x1>, //ENETC2 PF
>  		  <0xc0 &its 0x67 0x1>;
> +	iommu-map = <0x0 &smmu 0x20 0x1>,
> +		    <0x10 &smmu 0x21 0x1>,
> +		    <0x20 &smmu 0x22 0x1>,
> +		    <0x40 &smmu 0x23 0x1>,
> +		    <0x50 &smmu 0x25 0x1>,
> +		    <0x60 &smmu 0x26 0x1>,
> +		    <0x80 &smmu 0x24 0x1>,
> +		    <0xc0 &smmu 0x27 0x1>;

Do you need iommu-map-mask to mask bus id in case difference probe order
with pcie node?

Frank Li


>  };
>
>  &netc_emdio {
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 632631a29112..32a91d7b51e5 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1861,6 +1861,14 @@ netc_bus0: pcie@4ca00000 {
>  					  <0x90 &its 0x65 0x1>, //ENETC2 VF0
>  					  <0xa0 &its 0x66 0x1>, //ENETC2 VF1
>  					  <0xc0 &its 0x67 0x1>; //NETC Timer
> +				iommu-map = <0x0 &smmu 0x20 0x1>,
> +					    <0x10 &smmu 0x21 0x1>,
> +					    <0x20 &smmu 0x22 0x1>,
> +					    <0x40 &smmu 0x23 0x1>,
> +					    <0x80 &smmu 0x24 0x1>,
> +					    <0x90 &smmu 0x25 0x1>,
> +					    <0xa0 &smmu 0x26 0x1>,
> +					    <0xc0 &smmu 0x27 0x1>;
>  					 /* ENETC0~2 and Timer BAR0 - non-prefetchable memory */
>  				ranges = <0x82000000 0x0 0x4cc00000  0x0 0x4cc00000  0x0 0xe0000
>  					 /* Timer BAR2 - prefetchable memory */
> --
> 2.34.1
>
