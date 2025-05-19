Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2045.outbound.protection.outlook.com [40.107.104.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699D1E9B35;
	Mon, 19 May 2025 19:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681787; cv=fail; b=ZyhMFeWzmX4MGAClyAdl5eTlGo2l3dbPmz2CtS+cLksiAMb0XS1sxvqC4fTT4d46qWbd/7V9Ib1bN2GZTZM48zSD/6eIpdTj4WxAAEMVSgtlrlYkm0sc5db6y5a+F0Dfbzqrkla8xkxgPx5YfRZBcLTpWo6vQ7Ylbv8jo4sahtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681787; c=relaxed/simple;
	bh=vmte6MVg+X79yffRNQjB02rnsJcNDIdlZl1GhE5FAWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fM4y3mlkLBAUlnO8lsYD8ZaBWA+NfWF9W0+2+jIBW9NwKz4BxQX1L0Lw1mZQj/EG5AP7lEIzgtq54AkcoKKGgNBHKqg6fKTa3MuyVfQ9VQBtWabJWQd7NaWEkq2s/0IP+6NbZuexU94UsI1VjuMzmwAvY0KQhV2Ne5h6sXu2O7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C4fOP7p5; arc=fail smtp.client-ip=40.107.104.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C4fOP7p5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+iA8sZBQPwIvX2BlwGuGfQvLb0AhbTERUAP5Tyi2mwt1oprPJN7EAF/yHL2oN4UFqO+Wv3AxYXjNpF5PIE2+aS/PIYELya0srZcUnyy5ZICtkDGxb886YQvqazuijdN7CuVxtUfHwItM5B83kfMuD1OfXL2myp/mqoybavLL8sFHkN0EMgokqAB6lb4X26Pidg+oxav3a2nnyfeunt5uCSqJ5YI/030SEnt/6RdA5kwSFZmwoQAOqMk2UedQhtpvC6SoX3plGGEGHvYflZM7/6wfUIZNsylXvCvD/dAyzo9wMa8pWgd9WqSOVDHMgsENjf7jiU9e3p136xPe6qhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wF6U/hlnO91iw2YFp5ZYCGmTClfW1f6umCU3T0xDUbc=;
 b=KMbtldjvX7pcdCNgzIdzZbhssDy9bQ4MlA8UyPRmsNjC+G1jT4MIBZ4HoJfBV+veio2z7AvCrgND8XxeehiqZctinSm8S6TQAoNDw/uoGF50vjiqUa5heFKWybIOfj80mm4A8mnhvCDun4tzYJg4VBVlb31g6miNrSoLtfn0Z0DLa6WnOFamNNt15TxENtU+YxP5Dj0GIJkqCzwh0pPctwCCln6SiBszn345+Ob1Q7noqc4/oHCPtdDrTlN93J3d0On8yu/y+1PeBNX6ChO7H8khsC3QufhIhU7QQYayz4v+Jt4xMJVCvRt4LlaA+HAVrsQpkUFvsofdl89dsTlWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wF6U/hlnO91iw2YFp5ZYCGmTClfW1f6umCU3T0xDUbc=;
 b=C4fOP7p5oXybcjQYwEJee0IITjG3gsBE3OaJPRpnP/T5j8lw96UEG6Ig0FpOzwLXcp2Aco/SzchHiktgseSCWiXdAF+n9aTMJ8b9udQzSt+YL87twP5muMMHRg45IeHyF0pbQ0M7q4j1xXDywOCSatVU25Kl2Nsl/OwEmBt3MDUYPs/n1djFt0XXLFEUq2cbKhFp9nn6Z69CiEvyaXvr8OUonHKgyc3gORiWfJmmf2LyhoEpQpSRPkBYlGl1/Rmot0vhUPkWxZ74EaPu/v4drlSrr7EcOmCOZs+dADMlMJ9o/qfoDR19z+WawE3WfhedWSURPbnUU3tOFSnQFgIR7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Mon, 19 May
 2025 19:09:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 19:09:41 +0000
Date: Mon, 19 May 2025 15:09:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, carlos.song@nxp.com
Subject: Re: [PATCH 6/6] arm64: dts: imx943-evk: Add PDM microphone sound
 card support
Message-ID: <aCuB7RHb+cy96Ynh@lizhi-Precision-Tower-5810>
References: <20250515051900.2353627-1-shengjiu.wang@nxp.com>
 <20250515051900.2353627-7-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515051900.2353627-7-shengjiu.wang@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0058.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::33) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: 89bee2d9-dbc8-4dae-af68-08dd9708b540
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?efB7w1hFX3ej4OtH/disjl2r77gHofIpJ+ChkHREWbBNXKoEaWIQtc4qJQuY?=
 =?us-ascii?Q?r0zpOyEcjglrdIZFIAwRexeNYG4c/8KDOfAZBzrE/zgEVEiv7PeemaG+0Ji/?=
 =?us-ascii?Q?XjfpLyjuQ5JA8mCXBP3rdlsVakm4VPjJvx/qlrQakU8GNa3DB/ag5z+aoWfl?=
 =?us-ascii?Q?d3PAae6qhrVOVmQnYs3RjdDUQFTF+d5KCPa6GRTauaYBRXGuXvQ+SmIzFAfp?=
 =?us-ascii?Q?DSl39CkY+4WO0I6VilWfQYTwacOnRwbs0ZNXTjhfGzPZM5uJySoJJ3RXlpkV?=
 =?us-ascii?Q?qP0XfXDMtPP5bQeodrB2exBo01kJwD7B+satzsHO0eyQE0vhTabL8wrNDwVM?=
 =?us-ascii?Q?ChnyFjyP45EpxvsM0TtSMSaO5BbSZH8nzHK2Gs3ISBbr+cGy+DQGZrLlPc95?=
 =?us-ascii?Q?Ns/kUv42wTQT6bjOeQyiVlqf9/7pkFI+xVsx1lfXxQ06koChW3/MAtbJvsz2?=
 =?us-ascii?Q?E6HW/ZIforwVrbwKdAgm/Jy//iXAC2oHnpHsvSJ5Q6piY6HL6RNxTj3k6mFx?=
 =?us-ascii?Q?7W1SCamu4Gfrgrsmgbc7J7loTw4hFSd0ILD60cRwUaU1dBIziMY2S504ogaD?=
 =?us-ascii?Q?XQWBf8btPvwVoxxGOeEdEr9nBY7bTD0GxSbf+wSiNZqkyUGd2omf8sVD4tMv?=
 =?us-ascii?Q?alJfuD3ywY+Z3fS2HqN3m7xCbYld1J3Mxd3R7N2z+9gyEnCSqCC3JyS8brD3?=
 =?us-ascii?Q?c2LY2UES+Ran1bWCtbWT1VDKnCriTsZ3jD81wJvNhMC2V1arS/2LwJUOdYIm?=
 =?us-ascii?Q?FiH9ARhaHp1nCBRtmqINV9wJiSKM5kqZW5rrg0BlRRBC3aakcYbQpnOdTsRk?=
 =?us-ascii?Q?UMm1uqOalyaS8rh72fjDzBqd74o77rkda4P7p6hfg07+zCe52B8PNihC0cQ4?=
 =?us-ascii?Q?Tw2qsQdlU2odxZvY3RgAJZGYp8iVr6coV4Xa6ECPNnI1SfEqo86x6Vw2EhOk?=
 =?us-ascii?Q?z2/xHPETAXQYoNI9ncX4iw6ALoGbERK8Qo0QJeCLdjXn5UFsYHd3u6HJLFpv?=
 =?us-ascii?Q?VAvynTT1yfrOn5GL3WoQIRrsyuRrFysVhIiYIVPe8b+bo9G6KLe5i6IyqSby?=
 =?us-ascii?Q?527UcKig+wcs6A1SBQjpvJfWhEFE/m22F5AHfMbjOLqdWHjIA/7spv5ufvmJ?=
 =?us-ascii?Q?xeLXQIiO0J3KQQyiIkZfI2Z2C9XW5zWDMRTHJCNZ/+PyGYNO+gqKW5BZnNAa?=
 =?us-ascii?Q?/6nql3fa/KAhm6WN/lvkv+0rzt9lVbG6q0fr4oDlnuP2GNg/G0afOoenyMxv?=
 =?us-ascii?Q?RVyPn/EdZSOWGIlZbv9Vbzf3CInY1kzzzERMqB+G5+3MBbUI8D1O1+tnoYUU?=
 =?us-ascii?Q?dVE/Q8H8nNl4Ztisx/CDsDnI5/GgHCyRap08zF4goHMwQKk1VSKZ1Iyd/ETA?=
 =?us-ascii?Q?4FsOp/y0ESnIzEjJiFuRJ7UWh0etSU0x2g1XyW3shxKk6YiFwxYihBw6GIJx?=
 =?us-ascii?Q?nASatW+dlHFnsx0BxZco89JvZshh0WPri4VJUI7Ir8S3Hm5/8CxOgA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pj3UqVWao4LUjRdubcDL6XjdZHzAvPgafmlde4HVNuIuodxg/ZdB2de2XUMS?=
 =?us-ascii?Q?3gtfVbXu2IREGGBWWr7DUMhlG1A2c5lUmaoFcEHShsr1Ob3M/NpCEYdPx8Wo?=
 =?us-ascii?Q?v5Y0J3NViv0rRBehOEYlAWpCzCIZi0CzN92Pq8mEuAyo2LbdbfLD1wmod9KA?=
 =?us-ascii?Q?IygUuxD1GQyl5nw92BKszaPvfmlP2Vt7CpCcw1a8rqJkqXOLYoXVpo0jzSlP?=
 =?us-ascii?Q?lgaoR8PFfF4XBcblCoX7mIGyKk/aFfHiNhvl1WzyH6FRQt1QCRkomj6uSIHu?=
 =?us-ascii?Q?1FZ4lkR2SmT+XcnBXd9vnULu/qbNNZijdNOpj5twzwTmSbu2jxV7HEA3KB2Z?=
 =?us-ascii?Q?ihQyYJMZAk7L/A7YR7+d6QS76Cqtn+3AcplEzHj+xFygHYuWvzFzVdOhgXv7?=
 =?us-ascii?Q?awqR03+p/h8tSjyiWfNseT0UIhy6ak3JT6ZStk9McXSSj8q9j5O0QyGL+9XT?=
 =?us-ascii?Q?sQRKRt4REO8lxOv7wyPTKT3drvMXyeCstbIWvcLybAE5gulfoGnuZDedzkUx?=
 =?us-ascii?Q?GJQ5dpFBrItsieUCOMSQiu1tEa98JVvlRQA1uvbef0p+cBFHitTomy0Y86rR?=
 =?us-ascii?Q?OBHtCnRbyJsTkptASsEHNL5vA+QZcOsDrRZy7UFDe5cHVk4Pc/gBDymyok0T?=
 =?us-ascii?Q?9YJYCR351WtTzjdTTr3fNdJhZFvXnhQTWiFX7IseWyN8ebWY1eUhfUBrZ7HM?=
 =?us-ascii?Q?8Hj+XighmR8mBug2kXHvpGmZAZkgcwtIhsB6uzX/r2AZSgSoaKlF6+inXZtQ?=
 =?us-ascii?Q?gD0j0B5Zw1/622iPZRPzxYafk/x5pU47v2ZOqfKPLd8bTDukar6xbKu0XGIn?=
 =?us-ascii?Q?P+nYmR99AwYhyNeeiTpgInqzoR+DQRYfPKPcL0JILzTZNIWS6IvuGuapZaFY?=
 =?us-ascii?Q?MrqB+Pb2/0s6kxrKSw4whU9SKzJZ/9SrdpRZhry03BSyNbny0ipKCnN21JOe?=
 =?us-ascii?Q?WlRwN1lapdcUNziTLpvvvwwXpsd2gWcE5mqlBDLzwAZ8dAdaQ8X+6+8cAHDF?=
 =?us-ascii?Q?jRn+PT5H9kpyb8Guvq1UrQX22bF7/ZgncRZAZgykQkv+4/NgA42GlcwXrd4C?=
 =?us-ascii?Q?UdR4A+VvSDc2aKniQ1ZlJQpB5WNILJmwUY6pcd4U6CX1zfStnZkJvAOX6OBo?=
 =?us-ascii?Q?N/2cMYhaAQHLdtpAq4dixr6lxeuPvW3PiI/2mmVOamRjJr4n7CQevn+kRUnP?=
 =?us-ascii?Q?ywGbT+2et3mFtN/xMtCflvhDu/4W8AiI3CZQkhEfMnlwh7WGOe5r0D8jbWys?=
 =?us-ascii?Q?cdziOdkB6SMPYJWBakeqPZhvhW6CPeENkxzQGEwskt9copzJGDYu7hA/0LIK?=
 =?us-ascii?Q?NCy5g3BrxV/faPcDx9U++1sFmdgPjz5FyhiUVfbuNujan9erWymyOYd9gvDO?=
 =?us-ascii?Q?+dhO6x7x2pqM71SnaJPXhvgfA4hslEaK8ZkiY8tJZw+eJBpKjI/buvTXe9Nj?=
 =?us-ascii?Q?StijwsqMOTpsPXYuCPzM2p27aQPwVclXxWBBjrHD1Dr8XCV9/64roX0JvRQf?=
 =?us-ascii?Q?cHUZ7LGKBn2QiZMM/MSLenxKCGYGwNs7UOCLKOEUyiQtD8NgyxcmjRqzTc7Z?=
 =?us-ascii?Q?6BypTgyxVys1V6JhVsnhVkQPSr9KVMsfx1uMLcRE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89bee2d9-dbc8-4dae-af68-08dd9708b540
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 19:09:41.4465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfTm9C1IF24ScKlPKwP7C+4qchK9c5WgqNqRosNt7Cin29z+VyNfzNUd0ctZFKSE2MWUFifjGPYy2NjfOsj+Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107

On Thu, May 15, 2025 at 01:19:00PM +0800, Shengjiu Wang wrote:
> Add PDM micphone sound card support, configure the pinmux.
>
> This sound card supports recording sound from PDM microphone and convert
> the PDM format data to PCM data.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 60 ++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 85cec644dd92..c8c3eff9df1a 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -29,6 +29,11 @@ chosen {
>  		stdout-path = &lpuart1;
>  	};
>
> +	dmic: dmic {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -83,6 +88,24 @@ btcpu: simple-audio-card,cpu {
>  		};
>  	};
>
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +
> +		pri-dai-link {
> +			format = "i2s";
> +			link-name = "micfil hifi";
> +
> +			codec {
> +				sound-dai = <&dmic>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};
> +		};
> +	};
> +
>  	sound-wm8962 {
>  		compatible = "fsl,imx-audio-wm8962";
>  		audio-codec = <&wm8962>;
> @@ -204,6 +227,12 @@ audio-pwren-hog {
>  					gpio-hog;
>  					output-high;
>  				};
> +
> +				mqs-mic-sel-hog {
> +					gpios = <11 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-low;
> +				};
>  			};
>  		};
>
> @@ -314,6 +343,13 @@ pcal6416_i2c6_u44: gpio@20 {
>  				#gpio-cells = <2>;
>  				gpio-controller;
>
> +				/* pdm selection */
> +				can-pdm-sel-hog {
> +					gpios = <12 GPIO_ACTIVE_HIGH>;
> +					gpio-hog;
> +					output-low;
> +				};
> +
>  				sai3-sel-hog {
>  					gpios = <11 GPIO_ACTIVE_HIGH>;
>  					gpio-hog;
> @@ -344,6 +380,22 @@ &lpuart1 {
>  	status = "okay";
>  };
>
> +&micfil {
> +	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX94_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX94_CLK_PDM>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX94_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <49152000>;
> +	pinctrl-0 = <&pinctrl_pdm>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &sai1 {
>  	assigned-clocks = <&scmi_clk IMX94_CLK_AUDIOPLL1_VCO>,
>  			  <&scmi_clk IMX94_CLK_AUDIOPLL2_VCO>,
> @@ -413,6 +465,14 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
>  		>;
>  	};
>
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
> +			IMX94_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM0	0x31e
> +			IMX94_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM1	0x31e
> +		>;
> +	};
> +
>  	pinctrl_sai1: sai1grp {
>  		fsl,pins = <
>  			IMX94_PAD_SAI1_TXFS__SAI1_TX_SYNC	0x31e
> --
> 2.34.1
>
