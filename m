Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0ECC25CC6B;
	Tue, 20 May 2025 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747766715; cv=fail; b=gKeBB4WMi3fQ0e79SRCvHLeMiZ4nFyFbY+a435jTjKiX/qREt7BmaykBJCdPDP4yqUEIV45PWYvZ/eHzGtCCxcj1UCQrYzUjFUWlw9AKxrc3YxYiWe3KKnZfrdW3dViP3eUqczBYFy4HmvjmMgxExgoenF/40srBShsiPZ3Ena8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747766715; c=relaxed/simple;
	bh=SGurrB6KAcT54G0ni3Y0kMaCvXI4PEXGTSuxud2D864=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GqO6WejGdA+xMxyb/UF6QrJbBeX6np2z6LM1wk6fyq93WN6lS2gJ0CSEprpBUuvFqrdKYCyEIuED+RjVBxn8SlpTXsUPKTiRR984x2D+dY4ts3J0X14oHbvEAKnlgFUcIeMdCvFGuF4BJVyjA+3Zzr+koNpW1QZiaw3FUiYh7Cg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=iAjvWQ48; arc=fail smtp.client-ip=40.107.21.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="iAjvWQ48"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmwcWEAJbe9XQE+PJJ1UJZ7oMSSDApZxclsxTL+He4bhN9D27jfZfdBfzhINmwNldJL/rcLWPtKmAcLW74WTfFc0iFkXbqS1YAKyvex/TnuvzSi9jbYDfae7ZCeO8JDqsdx0dbcOVHGr02A2pSQM6i+woDi+X5lyWW2aWHxB0l0xRfu9EdrNxs104CF6n6sxFNc6/L/N+UzFLnniu1v1WqpM9ef5JMaICoJfeoKIaXM26fC2EkLYrZTESQszIG6F3X/xaV0FNvXMO6Y6/soR8hPyx9KhyLhCEgn29R/JWF3akKYhptRb2JF2gBsEa+8MPsZkna5sNWUiR5Rm0Cv1yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/Ba1r+wDsZuq78fuwoyh2xXSDHdlYBgfKHwJS6aX1s=;
 b=mnKGfPlR7/+8ADfyglQh2V21mwbkjAYeoFzR8dupY87ldPPfqWmsljA7JaFsBwTHy4fhWzpUF+9jTtEThKItNL7VINe32Efwk5iMHzif12W7BW7dFU4mUpP4xTsEVNrXSFrLBBJwqQ69uhaJPMUqm7aZiJzeBSw9eG4xbDdxP0MgZ6xm4nmGRV1UNTzIzGPdESjgOPRyJleu/ZpB5KM6T+sP2uo830EEiycA3FpORMzLCfIuVJZQGxY1syHmOVqOH1JnNYkU3ROK+kV9l9lxzejDvfWLky4FJ0cFpvWgXrs0P7+B6hdQoFrT7VmuRPUyHULwnf41UoAKqJXRglAnKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/Ba1r+wDsZuq78fuwoyh2xXSDHdlYBgfKHwJS6aX1s=;
 b=iAjvWQ48J90Whb7/wPnXJUehqa3RXEPPnaeff84YIhl9vtqwLxd72PSE+APjeoaQqlFrJ/mHLCMyTF+D+k3K7RDdmLBBrIiomDc9aGipPqJuGRDdsNb6OmSRE76P85SyqkrNfmVslKUbIllnjVB0RhoOAtO573asGWKSln2whgfioqCNPF3IvExEMKZ9HV9GIMG6/gjqya1gmrjo/kte7eoARvytuai8PUKVRk8TD1DGa+XC/PZ0Bl3j0nSE+7B/UxRAe41TaE7OHfCfLovoPShI1O74Y0kojiyPdKj4+mPUCtWNh5jAaDMeMMrIwFSYUdW9N7naIohUpREhG7M0Ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7548.eurprd04.prod.outlook.com (2603:10a6:10:20c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 20 May
 2025 18:45:06 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 18:45:06 +0000
Date: Tue, 20 May 2025 14:44:56 -0400
From: Frank Li <Frank.li@nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v17 5/7] firmware: drivers: imx: adds miscdev
Message-ID: <aCzNqBSXgDZCpFXP@lizhi-Precision-Tower-5810>
References: <20250426-imx-se-if-v17-0-0c85155a50d1@nxp.com>
 <20250426-imx-se-if-v17-5-0c85155a50d1@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426-imx-se-if-v17-5-0c85155a50d1@nxp.com>
X-ClientProxiedBy: PH7P221CA0041.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7548:EE_
X-MS-Office365-Filtering-Correlation-Id: 86573f30-c2ef-482e-31da-08dd97ce7093
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h4IH1sLt9Ia1mfv+AUjZoIGSSPuBAi0C47SqWFKhAS+qWgMAw+qL0Vlvdmr7?=
 =?us-ascii?Q?k43BOF7wofRzk55jHWsZjSmMkpf2YF3r8uL5KpgOJMHOlkp4MqYC4SzG9P1/?=
 =?us-ascii?Q?fiCRzv2C1fflIpqd01kz0Lkoa3EAhzAd/a+i7OuZf5WQPvweFSik3RvHzv8M?=
 =?us-ascii?Q?hNjIcpUaxafCURghwrSpZ+ESqFoTHjmyUEfuvmMY35IyZyhDuVfSDe/7ZRzB?=
 =?us-ascii?Q?ZvGB3wcz741EboxlMk0WfbIG0YqpNYY/g7n7w22NpzQ8RB05jiL7bo/8o06G?=
 =?us-ascii?Q?ydt9nf+f8axMAhxWz1h1aRj4TKI5724nXSu4pjnkGbxdpdNxJaa1WcPnymWL?=
 =?us-ascii?Q?pfg9bloiBI6Z5n9p5eOciBR7PUb4+FJESb12EHSawzqpKpsUVsuomIZUEje0?=
 =?us-ascii?Q?c2ty7gpgsr608QtKa/H4P8hXiebTBtlOme1AnwcaZm3N3dInjp7UJMEh1ECb?=
 =?us-ascii?Q?XEFROm1D0cABoR47+Y9RCAXh+yH+zxoTgNzdpg8Spr+YIWs83IfKbq3Il89E?=
 =?us-ascii?Q?aZYlOf8zopjC5nPUinwqBanItcJnaPfYxqYf7qzmTaGg4pc5BNnLcMxIUqeG?=
 =?us-ascii?Q?tFeNpdFc7lVOJ83sfGESNxI/jxardxTKWQhqGvOKlLuhWaOTS3hLAQ7LK+xJ?=
 =?us-ascii?Q?lnTcVamfe2CEY/IUNGrHjmXiYc3mUtAm8YFGPIymlSCuo+z4swxZTjQZDZ4S?=
 =?us-ascii?Q?Qws5wix2lShC/SMpSujdcE4pP9nE793f84dGK4YEsqlflXz53aYXcvfWNCTS?=
 =?us-ascii?Q?F3yOLJ7YuX2jZnCXtQL0tNJLY+l302XyL1SSI43Xz22e8/Hq4vlhAG7OUmME?=
 =?us-ascii?Q?ILx+myM6DO6xBh//VXcrDNilZ4vqjbk3r8/UjDFlLXJzEA1MRbAsmAUZ57bV?=
 =?us-ascii?Q?dlppO4Cl7CD0QZ5hIwwLJ6UG2Mm6zD21R2jdoUWPvJKBJfJ9pFCpwEi1mdvf?=
 =?us-ascii?Q?3m3UEgDYCug48uSyT9G4etapfccIxPYgiogZoBjgRVIrlkp4d4CnMraEpNyS?=
 =?us-ascii?Q?E0rNjkTcIh//51fs6TrGJ3zFFqtKUqYxydZC4X/pief/VVZ/BcydbW1Voepo?=
 =?us-ascii?Q?qimJCBFim26l3njpm93mOeAEpFo033pWm1PiSrTEJN7SDM/o90b3ooedTRf9?=
 =?us-ascii?Q?Nmz4rAliYYzIGv5gvSJoU/24pjH9Lc02DCkQbDphoNE/C68o6NfCd3kJKojz?=
 =?us-ascii?Q?Uoe6oZdiZwnfmnRhDawmqhHeHvr4nMaO4vQ6pswe8IK1T5I0adXAkpVRvu8P?=
 =?us-ascii?Q?4VpMHZhKpU4XZqmye91qwn/5t5ijCbHNClUM9Z//80WH94JEt/yi8sNMMQpZ?=
 =?us-ascii?Q?VUmUoXdPvtxQBVaHYfnb/lWB7NfN9qsbjJqbKQmvUl2Z+lgoqpjJCvqsSa1J?=
 =?us-ascii?Q?lPZbSqWiNIXSUEdcwM598U0KFJK2OIR2H+UfMrZ7d5PMjt4VaPOMnYepi0L0?=
 =?us-ascii?Q?goOOvlNms44NGNYxnITz3rHtWck5eKdtT5+F27O8HMe2n7Er8AiwfLn+Jl/m?=
 =?us-ascii?Q?efkzijvJnes2IMc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8WAWwfh868Sd93VQ5WcET1P0fxmOvNmzi3ANwunefeQESsRu5tJkgQz6pvfV?=
 =?us-ascii?Q?UZzx3fxwN9p0Ch9rq74oPqRIxzFnrd/Zzf4lcKB1//UzJah9+Qk9oPo1ewKg?=
 =?us-ascii?Q?kq7t7goeg6BmanFwE4dnEYWfZPhyEVFc1I2z8G8fH2gam+UVEYxrKs7E6dIb?=
 =?us-ascii?Q?SRT0kchjsa+8vloT778kVGTDhlFd88YRDf2UWdZY0q6spCAYrwJ4CjzCozu3?=
 =?us-ascii?Q?b0FQyaN5jxexgHTzJoKfMAXzHdow6FT/TooL/maO0dBFn19/t0tz4F2KZjeJ?=
 =?us-ascii?Q?szUGijTsqag4t10P0B3n8B02WSu9NA5i/3elUJ0Uedyl7kAFCbEjo8FSPKBn?=
 =?us-ascii?Q?Ip1D3GHv6M7nW/XCq7GBpH6S/b3iMEsSu24vZwqoPT/7YgbCaL9gSLDIR6EY?=
 =?us-ascii?Q?DaBdyNG6CV2doJPLbYZjyE8gTGmPmiFJIFLYxSV7h2Clh3h+QpeJYhtVegtl?=
 =?us-ascii?Q?/Z8kGbrIyTyF3Qoyp0UcTBBK4K+Yvj4igEbSwQjQzg2ZnlOewGsdZtu3eNz5?=
 =?us-ascii?Q?18m2h76LSkGLDEKccY5O2JdNMfdGK8GBWuOxzC8bhuUMrrciFUTHxDL5ygDo?=
 =?us-ascii?Q?DoQdcPx7CueEpFZdXFQBcK+o1zbQOr0SDp1XCjFtX8KgKZEs7dc+bMgwkh8l?=
 =?us-ascii?Q?dfQT/HnqiIBOhiuwGuXSiK97ir7/3dfJS5HqPw6DEJr0wGQjw7x+cZQioRxD?=
 =?us-ascii?Q?aWxBoSKwAywUoW16Uh8it0MPBsWuw1oFYPBzlmWQu8aUELclukK868CptEGu?=
 =?us-ascii?Q?cXtiFlPjkNpNTCVwKgcgfCfeS2rLeCsRMSfX0ZEhZopt5ICo/unu7eMkiPdE?=
 =?us-ascii?Q?Z85XkuCs2OzEYCax2+eZ6eP/hJzqhQAYc5eEhe7QeDhsZks0t2rVyvFT4NXs?=
 =?us-ascii?Q?YjhiiYkXWJNWQ1TrFZZkem8or25IdZc3ZWw98iumZgy/qjOGez3RRguYLTrS?=
 =?us-ascii?Q?EcYhBfHwiEGbDiw/CDl2OOTyPjzQs6Th0iY2fkypLLK0EjeNMH1455ATisvk?=
 =?us-ascii?Q?oIndaLNgafl0A8/HK6H82Gx3045sGbhc0jN/2W263qmiHM7d6MgGtV9FSD0p?=
 =?us-ascii?Q?9lCVt4ehZ24E8Dp+O14/FuIB/VqV6KywaDpiB4g5tiG/+g03ueXpmqefpDuJ?=
 =?us-ascii?Q?XRCu1V90/JMAh6iMPDYb3lCFxni+HcPJL8JMppI9I5/ZytK6sqsiUEMA3lex?=
 =?us-ascii?Q?10nv3fwiUgWlvrKG/PSGhVzxSQCSzwp2y/ix+ODffeAra6P28yfOL3QgiZre?=
 =?us-ascii?Q?BxngiR/bnBslJXP5+to61niLCjZ1NiDIKyqpYsgazJ3VoVcYYftWFswGD82Q?=
 =?us-ascii?Q?+09/yRgWaIu+U45rn3TMZfJuVcqw8TuCcQs7yRDEh3RDi8ZcysBMVSZJ1R6O?=
 =?us-ascii?Q?Vlz3DrS347Ylkw+Es8NoQ77lXRcmGw4nSGVpEe19OeXsg9cyGEwEGR9rHgbH?=
 =?us-ascii?Q?+xxqbIIaO08+YSp2UV0wKZgK96CSdqLTWH4X7uk0ZTSkeTgxCF+yhd53aYWp?=
 =?us-ascii?Q?Wadt0mpiWV16xnscaZsDR3Pdw6u+9gJmt0mnfQ61wp3uLcEOwd47tkxPdLvM?=
 =?us-ascii?Q?IiC4yLPIh5vPSmtUcAQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86573f30-c2ef-482e-31da-08dd97ce7093
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 18:45:06.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jhALebQJoOMfkHQjigPdB/ZOLntH6IFsc6SLugfNsNJi/Dn01HhvdB0FNE1YkLW89ETYYoZ8umNSL1kdlMtGXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7548

On Sat, Apr 26, 2025 at 12:31:36AM +0530, Pankaj Gupta wrote:
> Adds the driver for communication interface to secure-enclave, for
> exchanging messages with NXP secure enclave HW IP(s) like EdgeLock Enclave
> from:
> - User-Space Applications via character driver.
>
> ABI documentation for the NXP secure-enclave driver.
>
> User-space library using this driver:
> - i.MX Secure Enclave library:
>   -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
> - i.MX Secure Middle-Ware:
>   -- URL: https://github.com/nxp-imx/imx-smw.git
>
> Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> changes from v16 to v17
> - wrap code text at 80 character wherever possible.
>
> Note: copied the change logs for v15 to v16, to cover letter.
> ---
>  Documentation/ABI/testing/se-cdev |  43 +++
>  drivers/firmware/imx/ele_common.c |  20 +-
>  drivers/firmware/imx/ele_common.h |   4 +
>  drivers/firmware/imx/se_ctrl.c    | 733 +++++++++++++++++++++++++++++++++++++-
>  drivers/firmware/imx/se_ctrl.h    |  33 ++
>  include/uapi/linux/se_ioctl.h     |  97 +++++
>  6 files changed, 918 insertions(+), 12 deletions(-)
>
> diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
> new file mode 100644
> index 000000000000..dad39ffd245a
> --- /dev/null
> +++ b/Documentation/ABI/testing/se-cdev
> @@ -0,0 +1,43 @@
> +What:		/dev/<se>_mu[0-9]+_ch[0-9]+
> +Date:		Mar 2025
> +KernelVersion:	6.8
> +Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
> +Description:
> +		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
> +		Enclave(ELE), SECO. The character device file descriptors
> +		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
> +		enclave shared library and the kernel driver.
> +
> +		The ioctl(2)-based ABI is defined and documented in
> +		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
> +		ioctl(s) are used primarily for:
> +			- shared memory management
> +			- allocation of I/O buffers
> +			- getting mu info
> +			- setting a dev-ctx as receiver to receive all the commands from FW
> +			- getting SoC info
> +			- send command and receive command response
> +
> +		The following file operations are supported:
> +
> +		open(2)
> +		  Currently the only useful flags are O_RDWR.
> +
> +		read(2)
> +		  Every read() from the opened character device context is waiting on
> +		  wait_event_interruptible, that gets set by the registered mailbox callback
> +		  function, indicating a message received from the firmware on message-
> +		  unit.
> +
> +		write(2)
> +		  Every write() to the opened character device context needs to acquire
> +		  mailbox_lock before sending message on to the message unit.
> +
> +		close(2)
> +		  Stops and frees up the I/O contexts that were associated
> +		  with the file descriptor.
> +
> +Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
> +		https://github.com/nxp-imx/imx-smw.git
> +		crypto/skcipher,
> +		drivers/nvmem/imx-ocotp-ele.c
> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> index f26fb4d55a9a..dc4607984f00 100644
> --- a/drivers/firmware/imx/ele_common.c
> +++ b/drivers/firmware/imx/ele_common.c
> @@ -42,15 +42,22 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
>  	return chksum;
>  }
>
> +void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 timeout_ms)
> +{
> +	priv->se_rcv_msg_timeout_ms = timeout_ms;
> +}
> +
>  int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
>  {
> -	unsigned long timeout;
> +	unsigned long timeout_ms;
>  	int ret;
>
>  	do {
> -		timeout = MAX_SCHEDULE_TIMEOUT;
> +		timeout_ms = MAX_SCHEDULE_TIMEOUT;
> +		if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
> +			timeout_ms = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
>
> -		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
> +		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout_ms);
>  		if (ret == -ERESTARTSYS) {
>  			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
>  				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
> @@ -59,6 +66,13 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
>  			ret = -EINTR;
>  			break;
>  		}
> +		if (ret == 0) {
> +			ret = -ETIMEDOUT;
> +			dev_err(dev_ctx->priv->dev,
> +				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
> +				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
> +			break;
> +		}
>  		ret = se_clbk_hdl->rx_msg_sz;
>  		break;
>  	} while (ret < 0);
> diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
> index 5bac14439d7d..3e88ea45ca5d 100644
> --- a/drivers/firmware/imx/ele_common.h
> +++ b/drivers/firmware/imx/ele_common.h
> @@ -12,6 +12,10 @@
>
>  #define IMX_ELE_FW_DIR                 "imx/ele/"
>
> +#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
> +#define SE_RCV_MSG_LONG_TIMEOUT		5000000
> +
> +void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
>  u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
>
>  int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> index 40544cbc70ca..7c65964720a6 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -23,6 +23,7 @@
>  #include <linux/slab.h>
>  #include <linux/string.h>
>  #include <linux/sys_soc.h>
> +#include <uapi/linux/se_ioctl.h>
>
>  #include "ele_base_msg.h"
>  #include "ele_common.h"
> @@ -32,12 +33,6 @@
>  #define MBOX_TX_NAME			"tx"
>  #define MBOX_RX_NAME			"rx"
>
> -#define SE_TYPE_STR_DBG			"dbg"
> -#define SE_TYPE_STR_HSM			"hsm"
> -
> -#define SE_TYPE_ID_DBG			0x1
> -#define SE_TYPE_ID_HSM			0x2
> -
>  struct se_fw_img_name {
>  	const u8 *prim_fw_nm_in_rfs;
>  	const u8 *seco_fw_nm_in_rfs;
> @@ -130,6 +125,13 @@ char *get_se_if_name(u8 se_if_id)
>  	return NULL;
>  }
>
> +static uint32_t get_se_soc_id(struct se_if_priv *priv)
> +{
> +	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
> +
> +	return se_info->soc_id;
> +}
> +
>  static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
>  {
>  	return &var_se_info.load_fw;
> @@ -203,8 +205,213 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
>  	return 0;
>  }
>
> +static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
> +{
> +	const struct firmware *fw = NULL;
> +	phys_addr_t se_fw_phyaddr;
> +	u8 *se_fw_buf;
> +	int ret;
> +
> +	if (!se_img_file_to_load) {
> +		dev_err(priv->dev, "FW image is not provided.");
> +		return -EINVAL;
> +	}
> +	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
> +	if (ret)
> +		return ret;
> +
> +	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
> +
> +	/* allocate buffer to store the SE FW */
> +	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_phyaddr, GFP_KERNEL);
> +	if (!se_fw_buf) {
> +		ret = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	memcpy(se_fw_buf, fw->data, fw->size);
> +	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
> +	if (ret < 0) {
> +		dev_err(priv->dev,
> +			"Error %pe: Authenticate & load SE firmware %s.",
> +			ERR_PTR(ret), se_img_file_to_load);
> +		ret = -EPERM;
> +	}
> +	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_phyaddr);
> +exit:
> +	release_firmware(fw);
> +
> +	return ret;
> +}
> +
> +static int se_load_firmware(struct se_if_priv *priv)
> +{
> +	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
> +	int ret = 0;
> +
> +	if (!load_fw->is_fw_tobe_loaded)
> +		return 0;
> +
> +	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
> +		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
> +		if (ret) {
> +			dev_err(priv->dev, "Failed to load boot firmware.");
> +			return -EPERM;
> +		}
> +	}
> +
> +	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
> +	if (ret) {
> +		dev_err(priv->dev, "Failed to load runtime firmware.");
> +		return -EPERM;
> +	}
> +
> +	load_fw->is_fw_tobe_loaded = false;
> +
> +	return ret;
> +}
> +
> +static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
> +	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
> +
> +	/*
> +	 * Allocate some memory for data exchanges with S40x.
> +	 * This will be used for data not requiring secure memory.
> +	 */
> +	se_shared_mem_mgmt->non_secure_mem.ptr =
> +			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
> +					   GFP_KERNEL);
> +	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
> +		return -ENOMEM;
> +
> +	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +
> +	return 0;
> +}
> +
> +static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	/* Free non-secure shared buffer. */
> +	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> +			  se_shared_mem_mgmt->non_secure_mem.ptr,
> +			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
> +
> +	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
> +	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
> +	se_shared_mem_mgmt->non_secure_mem.size = 0;
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +}
> +
> +/* Need to copy the output data to user-device context.
> + */
> +static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_buf_desc *b_desc, *temp;
> +	bool do_cpy = true;
> +
> +	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
> +		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
> +			dev_dbg(priv->dev, "Copying output data to user.");
> +			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
> +						   b_desc->shared_buf_ptr,
> +						   b_desc->size)) {
> +				dev_err(priv->dev, "Failure copying output data to user.");
> +				do_cpy = false;
> +			}
> +		}
> +
> +		if (b_desc->shared_buf_ptr)
> +			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
> +
> +		list_del(&b_desc->link);
> +		kfree(b_desc);
> +	}
> +
> +	return do_cpy ? 0 : -EFAULT;
> +}
> +
> +/*
> + * Clean the used Shared Memory space,
> + * whether its Input Data copied from user buffers, or
> + * Data received from FW.
> + */
> +static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
> +						&se_shared_mem_mgmt->pending_out};
> +	struct se_buf_desc *b_desc, *temp;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
> +		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
> +			if (b_desc->shared_buf_ptr)
> +				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
> +
> +			list_del(&b_desc->link);
> +			kfree(b_desc);
> +		}
> +	}
> +	se_shared_mem_mgmt->non_secure_mem.pos = 0;
> +}
> +
> +static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
> +				      struct se_ioctl_setup_iobuf *io,
> +				      struct se_if_device_ctx *dev_ctx)
> +{
> +	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
> +	struct se_buf_desc *b_desc;
> +
> +	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
> +	if (!b_desc)
> +		return -ENOMEM;
> +
> +	b_desc->shared_buf_ptr = shared_ptr_with_pos;
> +	b_desc->usr_buf_ptr = io->user_buf;
> +	b_desc->size = io->length;
> +
> +	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
> +		/*
> +		 * buffer is input:
> +		 * add an entry in the "pending input buffers" list so
> +		 * that copied data can be cleaned from shared memory
> +		 * later.
> +		 */
> +		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
> +	} else {
> +		/*
> +		 * buffer is output:
> +		 * add an entry in the "pending out buffers" list so data
> +		 * can be copied to user space when receiving Secure-Enclave
> +		 * response.
> +		 */
> +		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
> +	}
> +
> +	return 0;
> +}
> +
> +/* interface for managed res to unregister a character device */
> +static void if_misc_deregister(void *miscdevice)
> +{
> +	misc_deregister(miscdevice);
> +}
> +
>  static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
> -				    struct se_if_device_ctx **new_dev_ctx)
> +				    struct se_if_device_ctx **new_dev_ctx,
> +				    const struct file_operations *se_if_fops)
>  {
>  	struct se_if_device_ctx *dev_ctx;
>  	int ret = 0;
> @@ -220,12 +427,509 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
>  	if (!dev_ctx->devname)
>  		return -ENOMEM;
>
> +	mutex_init(&dev_ctx->fops_lock);
> +
> +	dev_ctx->priv = priv;
> +	*new_dev_ctx = dev_ctx;
> +
> +	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
> +	if (!dev_ctx->miscdev) {
> +		*new_dev_ctx = NULL;
> +		return -ENOMEM;
> +	}
> +
> +	dev_ctx->miscdev->name = dev_ctx->devname;
> +	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
> +	dev_ctx->miscdev->fops = se_if_fops;
> +	dev_ctx->miscdev->parent = priv->dev;
> +	ret = misc_register(dev_ctx->miscdev);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret, "Failed to register misc device.");
> +
> +	ret = devm_add_action_or_reset(priv->dev, if_misc_deregister, dev_ctx->miscdev);
> +	if (ret)
> +		return dev_err_probe(priv->dev, ret,
> +				     "Failed to add action to the misc-dev.");
> +	return ret;
> +}
> +
> +static int init_device_context(struct se_if_priv *priv, int ch_id,
> +			       struct se_if_device_ctx **new_dev_ctx)
> +{
> +	struct se_if_device_ctx *dev_ctx;
> +	int ret = 0;
> +
> +	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
> +
> +	if (!dev_ctx)
> +		return -ENOMEM;
> +
> +	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
> +				     get_se_if_name(priv->if_defs->se_if_type),
> +				     ch_id);
> +	if (!dev_ctx->devname) {
> +		kfree(dev_ctx);
> +		return -ENOMEM;
> +	}
> +
> +	mutex_init(&dev_ctx->fops_lock);
>  	dev_ctx->priv = priv;
>  	*new_dev_ctx = dev_ctx;
>
> +	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
> +	priv->active_devctx_count++;
> +
> +	ret = init_se_shared_mem(dev_ctx);
> +	if (ret < 0) {
> +		kfree(dev_ctx->devname);
> +		kfree(dev_ctx);
> +		*new_dev_ctx = NULL;
> +	}
> +
>  	return ret;
>  }
>
> +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> +					    u64 arg)
> +{
> +	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_api_msg *rx_msg __free(kfree) = NULL;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err = 0;
> +
> +	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
> +			   sizeof(cmd_snd_rcv_rsp_info))) {
> +		dev_err(priv->dev,
> +			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +		goto exit;
> +	}
> +
> +	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
> +		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
> +			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
> +		err = -ENOSPC;
> +		goto exit;
> +	}
> +
> +	rx_msg = kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
> +	if (!rx_msg) {
> +		err = -ENOMEM;
> +		goto exit;
> +	}
> +
> +	tx_msg = memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
> +			     cmd_snd_rcv_rsp_info.tx_buf_sz);
> +	if (IS_ERR(tx_msg)) {
> +		err = PTR_ERR(tx_msg);
> +		goto exit;
> +	}
> +
> +	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
> +		err = -EINVAL;
> +		goto exit;
> +	}
> +
> +	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
> +	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
> +		err = se_load_firmware(priv);
> +		if (err) {
> +			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
> +			err = -EPERM;
> +			goto exit;
> +		}
> +	}
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
> +
> +	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
> +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> +	if (err < 0)
> +		goto exit;
> +
> +	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
> +		"message received, start transmit to user");
> +
> +	/* We may need to copy the output data to user before
> +	 * delivering the completion message.
> +	 */
> +	err = se_dev_ctx_cpy_out_data(dev_ctx);
> +	if (err < 0)
> +		goto exit;
> +
> +	/* Copy data from the buffer */
> +	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
> +			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
> +
> +	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
> +			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
> +		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +exit:
> +
> +	/* shared memory is allocated before this IOCTL */
> +	se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
> +			 sizeof(cmd_snd_rcv_rsp_info))) {
> +		dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
> +				u64 arg)
> +{
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	struct se_ioctl_get_if_info if_info;
> +	struct se_if_node *if_node;
> +	int err = 0;
> +
> +	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
> +
> +	if_info.se_if_id = 0;
> +	if_info.interrupt_idx = 0;
> +	if_info.tz = 0;
> +	if_info.did = 0;
> +	if_info.cmd_tag = priv->if_defs->cmd_tag;
> +	if_info.rsp_tag = priv->if_defs->rsp_tag;
> +	if_info.success_tag = priv->if_defs->success_tag;
> +	if_info.base_api_ver = priv->if_defs->base_api_ver;
> +	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
> +
> +	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
> +		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
> +		if_info.did);
> +
> +	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
> +		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/*
> + * Copy a buffer of data to/from the user and return the address to use in
> + * messages
> + */
> +static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
> +					u64 arg)
> +{
> +	struct se_shared_mem *shared_mem = NULL;
> +	struct se_ioctl_setup_iobuf io = {0};
> +	int err = 0;
> +	u32 pos;
> +
> +	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
> +			dev_ctx->devname);
> +		return -EFAULT;
> +	}
> +
> +	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
> +		io.user_buf, io.length, io.flags);
> +
> +	if (io.length == 0 || !io.user_buf) {
> +		/*
> +		 * Accept NULL pointers since some buffers are optional
> +		 * in FW commands. In this case we should return 0 as
> +		 * pointer to be embedded into the message.
> +		 * Skip all data copy part of code below.
> +		 */
> +		io.ele_addr = 0;
> +		goto copy;
> +	}
> +
> +	/* No specific requirement for this buffer. */
> +	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
> +
> +	/* Check there is enough space in the shared memory. */
> +	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
> +		dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
> +		shared_mem->pos);
> +
> +	if (shared_mem->size < shared_mem->pos ||
> +	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
> +		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
> +			dev_ctx->devname);
> +		return -ENOMEM;
> +	}
> +
> +	/* Allocate space in shared memory. 8 bytes aligned. */
> +	pos = shared_mem->pos;
> +	shared_mem->pos += round_up(io.length, 8u);
> +	io.ele_addr = (u64)shared_mem->dma_addr + pos;
> +
> +	memset(shared_mem->ptr + pos, 0, io.length);
> +	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
> +	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
> +		/*
> +		 * buffer is input:
> +		 * copy data from user space to this allocated buffer.
> +		 */
> +		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
> +			dev_err(dev_ctx->priv->dev,
> +				"%s: Failed copy data to shared memory.",
> +				dev_ctx->devname);
> +			return -EFAULT;
> +		}
> +	}
> +
> +	err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
> +	if (err < 0)
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
> +			dev_ctx->devname);
> +
> +copy:
> +	/* Provide the EdgeLock Enclave address to user space only if success.*/
> +	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/* IOCTL to provide SoC information */
> +static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx, u64 arg)
> +{
> +	struct se_ioctl_get_soc_info soc_info;
> +	int err = -EINVAL;
> +
> +	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
> +	soc_info.soc_rev = var_se_info.soc_rev;
> +
> +	err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
> +	if (err) {
> +		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
> +			dev_ctx->devname);
> +		err = -EFAULT;
> +	}
> +
> +	return err;
> +}
> +
> +/*
> + * File operations for user-space
> + */
> +
> +/* Write a message to the MU. */
> +static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
> +				size_t size, loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err;
> +
> +	dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
> +		buf, size, ((ppos) ? *ppos : 0));
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
> +			return -EINVAL;
> +
> +		if (size < SE_MU_HDR_SZ) {
> +			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
> +				dev_ctx->devname, size, SE_MU_HDR_SZ);
> +			return -ENOSPC;
> +		}
> +
> +		tx_msg = memdup_user(buf, size);
> +		if (IS_ERR(tx_msg))
> +			return PTR_ERR(tx_msg);
> +
> +		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     tx_msg, size, false);
> +
> +		err = ele_msg_send(dev_ctx, tx_msg, size);
> +
> +		return err;
> +	}
> +}
> +
> +/*
> + * Read a message from the MU.
> + * Blocking until a message is available.
> + */
> +static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
> +			       loff_t *ppos)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	int err;
> +
> +	dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
> +		buf, size, ((ppos) ? *ppos : 0));
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +			err = -EINVAL;
> +			goto exit;
> +		}
> +
> +		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
> +		if (err < 0) {
> +			dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal."
> +				"Current active dev-ctx count = %d.",
> +				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
> +			goto exit;
> +		}
> +
> +		/* We may need to copy the output data to user before
> +		 * delivering the completion message.
> +		 */
> +		err = se_dev_ctx_cpy_out_data(dev_ctx);
> +		if (err < 0)
> +			goto exit;
> +
> +		/* Copy data from the buffer */
> +		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
> +				     priv->cmd_receiver_clbk_hdl.rx_msg,
> +				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
> +				     false);
> +
> +		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
> +				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
> +			dev_err(priv->dev, "%s: Failed to copy to user.",
> +				dev_ctx->devname);
> +			err = -EFAULT;
> +		} else {
> +			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
> +		}
> +exit:
> +		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
> +
> +		se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +
> +		return err;
> +	}
> +}
> +
> +/* Open a character device. */
> +static int se_if_fops_open(struct inode *nd, struct file *fp)
> +{
> +	struct miscdevice *miscdev = fp->private_data;
> +	struct se_if_device_ctx *misc_dev_ctx;
> +	struct se_if_device_ctx *dev_ctx;
> +	struct se_if_priv *priv;
> +	int err = 0;
> +
> +	priv = dev_get_drvdata(miscdev->parent);
> +	misc_dev_ctx = priv->priv_dev_ctx;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
> +		priv->dev_ctx_mono_count++;
> +		err = init_device_context(priv,
> +					  priv->dev_ctx_mono_count ?
> +					  priv->dev_ctx_mono_count
> +					  : priv->dev_ctx_mono_count++,
> +					  &dev_ctx);
> +		if (err)
> +			dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
> +		else
> +			fp->private_data = dev_ctx;
> +
> +		return err;
> +	}
> +}
> +
> +/* Close a character device. */
> +static int se_if_fops_close(struct inode *nd, struct file *fp)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		/* check if this device was registered as command receiver. */
> +		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
> +			priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
> +			kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
> +			priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
> +		}
> +
> +		se_dev_ctx_shared_mem_cleanup(dev_ctx);
> +		cleanup_se_shared_mem(dev_ctx);
> +
> +		priv->active_devctx_count--;
> +		list_del(&dev_ctx->link);
> +
> +		kfree(dev_ctx->devname);
> +		kfree(dev_ctx);
> +	}
> +
> +	return 0;
> +}
> +
> +/* IOCTL entry point of a character device */
> +static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +	struct se_if_device_ctx *dev_ctx = fp->private_data;
> +	struct se_if_priv *priv = dev_ctx->priv;
> +	long err;
> +
> +	/* Prevent race during change of device context */
> +	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
> +		switch (cmd) {
> +		case SE_IOCTL_ENABLE_CMD_RCV:
> +			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
> +				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> +					priv->cmd_receiver_clbk_hdl.rx_msg =
> +						kzalloc(MAX_NVM_MSG_LEN,
> +							GFP_KERNEL);
> +					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
> +						err = -ENOMEM;
> +						break;
> +					}
> +				}
> +				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
> +				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
> +				err = 0;
> +			} else {
> +				err = -EBUSY;
> +			}
> +			break;
> +		case SE_IOCTL_GET_MU_INFO:
> +			err = se_ioctl_get_mu_info(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_SETUP_IOBUF:
> +			err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_GET_SOC_INFO:
> +			err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
> +			break;
> +		case SE_IOCTL_CMD_SEND_RCV_RSP:
> +			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
> +			break;
> +		default:
> +			err = -EINVAL;
> +			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
> +				dev_ctx->devname, cmd);
> +		}
> +	}
> +
> +	return err;
> +}
> +
> +/* Char driver setup */
> +static const struct file_operations se_if_fops = {
> +	.open		= se_if_fops_open,
> +	.owner		= THIS_MODULE,
> +	.release	= se_if_fops_close,
> +	.unlocked_ioctl = se_ioctl,
> +	.read		= se_if_fops_read,
> +	.write		= se_if_fops_write,
> +};
> +
>  /* interface for managed res to free a mailbox channel */
>  static void if_mbox_free_channel(void *mbox_chan)
>  {
> @@ -246,7 +950,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
>  	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
>  	if (ret)
>  		return dev_err_probe(dev, -EPERM,
> -				     "Failed to add-action for removal of mbox: %s\n",
> +				     "Failed to add-action for removal of mbox: %s.",
>  				     name);
>  	*chan = t_chan;
>
> @@ -255,6 +959,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
>
>  static void se_if_probe_cleanup(void *plat_dev)
>  {
> +	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
>  	struct platform_device *pdev = plat_dev;
>  	struct se_fw_load_info *load_fw;
>  	struct device *dev = &pdev->dev;
> @@ -279,6 +984,13 @@ static void se_if_probe_cleanup(void *plat_dev)
>  		load_fw->imem.buf = NULL;
>  	}
>
> +	if (priv->dev_ctx_mono_count) {
> +		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
> +			list_del(&dev_ctx->link);
> +			priv->active_devctx_count--;
> +		}
> +	}
> +
>  	/*
>  	 * No need to check, if reserved memory is allocated
>  	 * before calling for its release. Or clearing the
> @@ -319,6 +1031,7 @@ static int se_if_probe(struct platform_device *pdev)
>  	priv->se_mb_cl.tx_block		= false;
>  	priv->se_mb_cl.knows_txdone	= true;
>  	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
>
>  	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
>  	if (ret)
> @@ -340,6 +1053,7 @@ static int se_if_probe(struct platform_device *pdev)
>  					     "Unable to get sram pool = %s.",
>  					     if_node->pool_name);
>  	}
> +	INIT_LIST_HEAD(&priv->dev_ctx_list);
>
>  	if (if_node->reserved_dma_ranges) {
>  		ret = of_reserved_mem_device_init(dev);
> @@ -348,7 +1062,7 @@ static int se_if_probe(struct platform_device *pdev)
>  					    "Failed to init reserved memory region.");
>  	}
>
> -	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
> +	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
>  	if (ret)
>  		return dev_err_probe(dev, ret,
>  				     "Failed[0x%x] to create device contexts.",
> @@ -389,6 +1103,7 @@ static int se_suspend(struct device *dev)
>  	struct se_fw_load_info *load_fw;
>  	int ret = 0;
>
> +	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
>  	load_fw = get_load_fw_instance(priv);
>
>  	if (load_fw->imem_mgmt)
> diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
> index b5e7705e2f26..5fcdcfe3e8e5 100644
> --- a/drivers/firmware/imx/se_ctrl.h
> +++ b/drivers/firmware/imx/se_ctrl.h
> @@ -14,6 +14,7 @@
>  #define SE_MSG_WORD_SZ			0x4
>
>  #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
> +#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
>  #define MAX_NVM_MSG_LEN			(256)
>  #define MESSAGING_VERSION_6		0x6
>  #define MESSAGING_VERSION_7		0x7
> @@ -37,10 +38,38 @@ struct se_imem_buf {
>  	u32 state;
>  };
>
> +struct se_buf_desc {
> +	u8 *shared_buf_ptr;
> +	void __user *usr_buf_ptr;
> +	u32 size;
> +	struct list_head link;
> +};
> +
> +struct se_shared_mem {
> +	dma_addr_t dma_addr;
> +	u32 size;
> +	u32 pos;
> +	u8 *ptr;
> +};
> +
> +struct se_shared_mem_mgmt_info {
> +	struct list_head pending_in;
> +	struct list_head pending_out;
> +
> +	struct se_shared_mem non_secure_mem;
> +};
> +
>  /* Private struct for each char device instance. */
>  struct se_if_device_ctx {
>  	struct se_if_priv *priv;
> +	struct miscdevice *miscdev;
>  	const char *devname;
> +
> +	/* process one file operation at a time. */
> +	struct mutex fops_lock;
> +
> +	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
> +	struct list_head link;
>  };
>
>  /* Header of the messages exchange with the EdgeLock Enclave */
> @@ -89,6 +118,10 @@ struct se_if_priv {
>  	const struct se_if_defines *if_defs;
>
>  	struct se_if_device_ctx *priv_dev_ctx;
> +	struct list_head dev_ctx_list;
> +	u32 active_devctx_count;
> +	u32 dev_ctx_mono_count;
> +	u32 se_rcv_msg_timeout_ms;
>  };
>
>  char *get_se_if_name(u8 se_if_id);
> diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
> new file mode 100644
> index 000000000000..0c948bdc8c26
> --- /dev/null
> +++ b/include/uapi/linux/se_ioctl.h
> @@ -0,0 +1,97 @@
> +/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#ifndef SE_IOCTL_H
> +#define SE_IOCTL_H
> +
> +#include <linux/types.h>
> +
> +#define SE_TYPE_STR_DBG			"dbg"
> +#define SE_TYPE_STR_HSM			"hsm"
> +#define SE_TYPE_ID_UNKWN		0x0
> +#define SE_TYPE_ID_DBG			0x1
> +#define SE_TYPE_ID_HSM			0x2
> +/* IOCTL definitions. */
> +
> +struct se_ioctl_setup_iobuf {
> +	void __user *user_buf;
> +	__u32 length;
> +	__u32 flags;
> +	__u64 ele_addr;
> +};
> +
> +struct se_ioctl_shared_mem_cfg {
> +	__u32 base_offset;
> +	__u32 size;
> +};
> +
> +struct se_ioctl_get_if_info {
> +	__u8 se_if_id;
> +	__u8 interrupt_idx;
> +	__u8 tz;
> +	__u8 did;
> +	__u8 cmd_tag;
> +	__u8 rsp_tag;
> +	__u8 success_tag;
> +	__u8 base_api_ver;
> +	__u8 fw_api_ver;
> +};
> +
> +struct se_ioctl_cmd_snd_rcv_rsp_info {
> +	__u32 __user *tx_buf;
> +	int tx_buf_sz;
> +	__u32 __user *rx_buf;
> +	int rx_buf_sz;
> +};
> +
> +struct se_ioctl_get_soc_info {
> +	__u16 soc_id;
> +	__u16 soc_rev;
> +};
> +
> +/* IO Buffer Flags */
> +#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
> +#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
> +#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
> +#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
> +#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
> +
> +/* IOCTLS */
> +#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
> +
> +/*
> + * ioctl to designated the current fd as logical-reciever.
> + * This is ioctl is send when the nvm-daemon, a slave to the
> + * firmware is started by the user.
> + */
> +#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
> +
> +/*
> + * ioctl to get the buffer allocated from the memory, which is shared
> + * between kernel and FW.
> + * Post allocation, the kernel tagged the allocated memory with:
> + *  Output
> + *  Input
> + *  Input-Output
> + *  Short address
> + *  Secure-memory
> + */
> +#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
> +
> +/*
> + * ioctl to get the mu information, that is used to exchange message
> + * with FW, from user-spaced.
> + */
> +#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
> +/*
> + * ioctl to get SoC Info from user-space.
> + */
> +#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
> +
> +/*
> + * ioctl to send command and receive response from user-space.
> + */
> +#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
> +#endif
>
> --
> 2.43.0
>
