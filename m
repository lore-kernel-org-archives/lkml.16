Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2059.outbound.protection.outlook.com [40.107.105.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443D621C9E1;
	Thu,  6 Feb 2025 16:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738858740; cv=fail; b=r5hwZcwljx+s2J+YPBsPGsbAhfvildSsE/Zq2egOPosrMIBzbFsak4Ntu/Vta/IXYT0x7gAKuBhKMhuAZWsoRKx6KLVbDu6qLh6fYtxYqxaw1raZd2IWsvCPmq6UGfEAJ4+w2902+FbUPm5Y+kE9tSUCy1FgvsZDxGrl1yCKyE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738858740; c=relaxed/simple;
	bh=FqIDHvwYT80UuSkBAlx/DOl6u+MuuM6K3nTKGMKCCr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ErbAJyUHR+tNKjGbBRSi9+EFLtP39LSj+1MXzLMt6ztl7rNrkmDjjg1Cm6YTfu+FjgqeFbaNqMkcBq54AD0Fl1QX+zo6iTnT5A0NYs3vu3iCV2qI9InW7kTedlEowZj9O8QvRqb6lQJXitCWPuCsUOk3ALY2Tu59C1sltTfb5og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ddLxF+TD; arc=fail smtp.client-ip=40.107.105.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ddLxF+TD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IV1vl+YL4X55RJ1ePMiFuULomn9bQYAzoHEXgkATJW6w8Bla0tnSPskXZrSn1tgI37XBgAZIb8itV/eKSgJiziS9hzA6W9r8qkqksWGIJ5Sq3FwjqWMuxpCVqJFInckOea7bzDVbkOX/1V0rFoUR7inrZOqBJBS9TmNadcN9KqMPCz7eC4w5V3UOXd+xZcJCPBX11gqkolCkoWV+b9u3AHiYRjFO8LvcNqyJ/3PFz/fOF3PcVmsjSsFJUcTs1x/HnhuB6e5n3WuME1bJgdWmJkDFkOMVPewxYV2els5ydR1PMvA+gZMrZh/tbpYvEwLQZalkk9kl7+wkdFwxQjcwKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JYD+Ax2Ug27s8NU9GMnLLVoRUzz9AlvaV5Xk6UZn+c=;
 b=OI0dyWcitHWv/5nG/W/cire65b2ISVOUQtAXdqFvoW5kFb0ivzcMm/okZ30Ec8GuoKVCfY0jL65fgSelNrtvjDYLdYQoLE9cRC3k7BmWRyDlV1HZCFBLFCgKMuOtmN4mx+Kn2XUNcZSvspeofC0z9ODRj4JJ1LzI3raoZrvRnSTaEe44XGcGcRlbrsulYLO55M9V460TRafDzfX7JJSnXEygoj8cy2Jad0AqR9sX9vKH5FG322GI6aPC6HfBZfyZon4yKGZWnkSCgYA0yvF1itASEWQF5AGbOo+zbH76obzaHqB3OF8Lndix8VaTk9+sdpd+zFHO8ciPRL4NASZuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JYD+Ax2Ug27s8NU9GMnLLVoRUzz9AlvaV5Xk6UZn+c=;
 b=ddLxF+TDrOUCQfhkfvQpvnOJMVum3F9n4Yyx5CND0RNm0ktoD2lLfQbSdTVHYLisSZDnZX6/QZI4eoVsWJKrwCOQtsXmTocaTUxu5PRALKXzVAGcETdHZyCkuvHTzAHQdOwBVJQLRg3pa18jYCnpGDqfclMT2qCJJm8M6Wl8n28abKONP4+t8ZQzn29UO9FAAG7iSqT4gkcEuNMkQDgKBHxm8rSD6rJb9pTKLU3A1npYHjS3HvT42TlIL2rtsdTa22touEkz2hVqv9Rh6Bp8AzEgwgGhABO8HFlZMvdS8F8HcqBMGXTFHvtB4CRwJWlMUtfejzTP+06Icr6Dv1Lykw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DB9PR04MB9752.eurprd04.prod.outlook.com (2603:10a6:10:4c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Thu, 6 Feb
 2025 16:18:49 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%7]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 16:18:49 +0000
Date: Thu, 6 Feb 2025 11:18:41 -0500
From: Frank Li <Frank.li@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 5/8] ASoC: SOF: imx8: drop unneeded/unused
 macros/header includes
Message-ID: <Z6Tg4eUowjXD2l+4@lizhi-Precision-Tower-5810>
References: <20250205203022.2754-1-laurentiumihalcea111@gmail.com>
 <20250205203022.2754-6-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205203022.2754-6-laurentiumihalcea111@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0283.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::18) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DB9PR04MB9752:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cfe2513-e4bf-46cb-d1ce-08dd46c9f02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V3vTJkTT3y6RJqIqQfuLlgfVv5obO59vlSpEQLMPMobxbX98aLKjEx5arN0B?=
 =?us-ascii?Q?dcmj5sz5XPVNvDrDyJjGxztFU7hOr5PlfGc+kEZD/25RZ0NhTfVcqLSul/QZ?=
 =?us-ascii?Q?49W6WaD2rOzIIfBg1mX1kbqGOI/5DhwsW+dnLu3T/wuCJobzdivFQScpCFrA?=
 =?us-ascii?Q?iK4XAwgL+Yu16LTEY2HeNK1y4DKwUYtq7UwO/LcJRaLgGPcsx1VrsI/FaORQ?=
 =?us-ascii?Q?xccAJYiqqHGJHLWOvhH20/r/C5BS5ec7Zk8/zG9D50v2PYPxDeTffSpxXxUV?=
 =?us-ascii?Q?QL6CHFICxG65gyHVEPW8PTQcxP/20+gr4YEwiNtH1ONsoloG+qMveqrJ/+D7?=
 =?us-ascii?Q?8KOGMKi2pZRv8GsYf515TNeyDqm06qvqSKXxbN5a+vRgHqDjrecmqWqboQgV?=
 =?us-ascii?Q?KUJGIlwwLjgILzBZQpzgSRnypGVdFBLxcSazTSSmwggxSGOtd92/Dnj8pTYj?=
 =?us-ascii?Q?JxI8QrDs8DAYD1dw0kIsVBm6aY9TIDOiTz5Hnubi7phKV2jRmFU2ctOuJz9e?=
 =?us-ascii?Q?1dsWW9ucDWSrmf6AiassgchvMyaycsOY3BBeql9T2X0KcbaVoJwhErk/5PRF?=
 =?us-ascii?Q?5HeNRMWw5ag//FjuzRbmTJKx4JNWzt3h7/W6pG5bIZP4qN4asLPPt103Kyri?=
 =?us-ascii?Q?LGJQ3dP6YUrBNQdMX1SX4TCxfZ6CzJqJ2VyoAS8dgzH1aZFgOGehaOlzmQgb?=
 =?us-ascii?Q?ay9qjyV1prGwv6Ts1ZwxpLcbLsHIwW9761MZIeK9YZ9Xc8S88wM2LeM9nkyA?=
 =?us-ascii?Q?wZ+jXP+B8Z2cZRrJHlP01s/RpFoe51Bhaq3CEtJ7BFvuJQem7lykLWaPvRcd?=
 =?us-ascii?Q?fD/vsDmadoVz+Sq5MlMAWhRl9uDSAZl1kLtBS5mh+gLjtGBw8qgYFYEmQbAj?=
 =?us-ascii?Q?jXvNAq0iBr8wOTMSs60YguVD6PJAge7KbdlApMLT/JJ6TN/B+UdgS6WTOHfB?=
 =?us-ascii?Q?7f/R34nSnGC3uQjQlx4s/jydr7XjQZeBMyjjSEGINrkW4lWfWMkxEOTmr8HC?=
 =?us-ascii?Q?OXdPs7sKjwEExpVjgAz7ekcUifA44u4XRHs/9QQ7pB94ac0FgqANoWOnbECf?=
 =?us-ascii?Q?mztMWK7FiAuK6IELoGDWV1vbmRYKd4u7RLeQtkXS7czJeTeLl/EhjVX+fes9?=
 =?us-ascii?Q?TTPDJW6VkBEVVLGrnnicY7HX37CinzKNNQ4DI8nvQ3b6CpXkXFd/GFMOZ86G?=
 =?us-ascii?Q?WfQ/pVrxol4rPXJfP+KdFJdgUWU4T8NnOFqIcTgzhWgqvnFG3N3BX9hV4xjs?=
 =?us-ascii?Q?3iPa7l54LwuEYmeySkOITk016q5dfN/5st9VTEal+8l7GoDmhpfszKCaxVoI?=
 =?us-ascii?Q?QfWXDxn0FrPNYLMdGvOEigU7X3LBbpkaSTMZqkpLaHqJKs6jN/LKR4x22ECv?=
 =?us-ascii?Q?VChxiYWRDYRmOCXQO4LzwqZUhiYlsaLl3j5m+h9M1/K4q9AKZ8V/oc930Alv?=
 =?us-ascii?Q?G0/C4V7Zl5K/dUlAs+zYXhWe7BCqFTT/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Jo52aNVScjpbQx1CfatF6jTeySQnEudy2paeu0R8L3S7bkDgInQYM82W4tQv?=
 =?us-ascii?Q?w10xxwkqJ/0JgDgNHCg6BRErZG7reh33ebkTnxHrBSSxwIw0B5Ul0Pww+/2G?=
 =?us-ascii?Q?XBDpiAaXGhRJCZ9R4br/qPwhePIn9rRMnJ65CrlEdirGYWFLPERArCDhHGSv?=
 =?us-ascii?Q?BnjsDqWWPQqQVFQCW0+0ae8BtciGOSclNJmvTq59IXMzuR+6VRiEEwadyons?=
 =?us-ascii?Q?P9yRkTr6LP78Js6lHOJdvY3ePdHxC++GK7KG9+xD17pTj9xRijUWpkryIi36?=
 =?us-ascii?Q?0DFSI3L9BkoVkv0mCbm0YVA8zNpiYzDWDoD2lD+p0UsokJ3QI1lNO1f0bF4n?=
 =?us-ascii?Q?SsjZTgnIvF6yuEx10QOvvjqkt/dcVJONKCbDgNXNrTICeyY98V85WBgFtXIJ?=
 =?us-ascii?Q?A+kpLm1gPejTiTfi63lSKMwVCqGfzwfpyR/E62DoAxx53hf2WlwgulNRO5cJ?=
 =?us-ascii?Q?KwHVtEXHgzrTVlc5HOoWQLT3GkIRn3YhI5GkGxiHBc36EAgNEARecZAQAHDR?=
 =?us-ascii?Q?fzakxZJzgeEihvmbhnJ49p4Oh5/hyILU2LKMoGUTzU8VygfGyCXS8nttG4to?=
 =?us-ascii?Q?ccaBiGKaZzkIlVe4zBIuvw7b+yYobdmsf16PbrPiotEtTkZ8J8otTnUJj6oK?=
 =?us-ascii?Q?/44pOwgpAHGBmMDKRX1J08dijuEeW1Y19w8nw18+4N7qY/uAuJ9fIMfAkS44?=
 =?us-ascii?Q?SsCM5tIChvvlZsGKoXL2AOmNOiGoHQdXLxG+uBP+ojmd1E1Lw/t6XQI6k7tL?=
 =?us-ascii?Q?8UGO+Y47t7FVNnCiy7TqaXeobs96AN2IvMbz6wsqM21BRo58f4uJZkHkbPEE?=
 =?us-ascii?Q?BLn8S4Doiv61r4+levrbptCFLVwrOGAf+WflWK5ba40oQFA2pIQowHGo3j71?=
 =?us-ascii?Q?jKzlpT31zs1iBoLk40/RLY1T6a0+IJNaak/NNocjKUBihf2pAijpJ8BN2RDC?=
 =?us-ascii?Q?qm6XHbqeFcqPIN1Km2V0oE/K/IzXrVho+OB7ACI8a2116iaBDz9QtV+ziNMj?=
 =?us-ascii?Q?gP4xTzQq1DeJJbk1/M06cYaSxjgl51iZtQuEoaWZr10KJSiiJYzimWnOLFu2?=
 =?us-ascii?Q?oyHOZx7xdiwPQwt/k1EIuBA/fM08lUHq7W4hNfN2UrcZykOfNUZHe0VAfJsV?=
 =?us-ascii?Q?fTs0JV1FeYKNJhjqeRLGkN2RAm8Xdv881mSjTqIM06HLw+l9r8soLZ8UHpho?=
 =?us-ascii?Q?+cQ4of46N6OWGw0jflBIv+iTcyrBCRLC6KfuuFlAopmc/rkqYB9vCLyKDDwc?=
 =?us-ascii?Q?kXrcDq9WRcVuRtZAuy707H4+LVecRCyJJm1XZQqjj+pD8xFdO/iLpxZ6fe/1?=
 =?us-ascii?Q?2LJJ2pY4hP/w7bO8F0258EhnmzMlGlt78O9XnVv/e8hB9YTlt7i3J/cLkz4f?=
 =?us-ascii?Q?2iafPTbBEDl0SpNKdoFa53eam0tqPh39F8KAyn+3z5IwbNH1Sb92L2sI8twL?=
 =?us-ascii?Q?vngh75CQXfTPvOZE+rVFG0eXfWHc7l0PXH/BCiuyhTIndJtIAFndK9u/NqpJ?=
 =?us-ascii?Q?K2iPQWYkLb6ZmWP6duuu9xnvfOpAgCWemjlpw1xpDb/UWs+PYRnvgcQkUTeF?=
 =?us-ascii?Q?K4uNYa1DT1MtzSEtlvLKkNl4vsPbLDUSJeh86OOG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cfe2513-e4bf-46cb-d1ce-08dd46c9f02b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 16:18:49.1982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdjMZ+VG6gw3T4K/BxDD1FidIE7IJhHc6X4CwdJDWq/uWkznc9BTKl9K8LPP1+/djd2reqCPMevIXaqcLsXzlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9752

On Wed, Feb 05, 2025 at 03:30:19PM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Drop some unneeded/unused macro definitions and header includes.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  sound/soc/sof/imx/imx8.c | 29 -----------------------------
>  1 file changed, 29 deletions(-)
>
> diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
> index 5d6524d695e2..5ce094943aa2 100644
> --- a/sound/soc/sof/imx/imx8.c
> +++ b/sound/soc/sof/imx/imx8.c
> @@ -6,41 +6,12 @@
>  //
>  // Hardware interface for audio DSP on i.MX8
>
> -#include <linux/firmware.h>
> -#include <linux/of_platform.h>
> -#include <linux/of_address.h>
> -#include <linux/of_irq.h>
> -#include <linux/pm_domain.h>
> -
> -#include <linux/module.h>
> -#include <sound/sof.h>
> -#include <sound/sof/xtensa.h>
> -#include <linux/firmware/imx/ipc.h>
> -#include <linux/firmware/imx/dsp.h>
> -
>  #include <linux/firmware/imx/svc/misc.h>
>  #include <dt-bindings/firmware/imx/rsrc.h>
> -#include "../ops.h"
> -#include "../sof-of-dev.h"
>  #include "imx-common.h"
>
> -/* DSP memories */
> -#define IRAM_OFFSET		0x10000
> -#define IRAM_SIZE		(2 * 1024)
> -#define DRAM0_OFFSET		0x0
> -#define DRAM0_SIZE		(32 * 1024)
> -#define DRAM1_OFFSET		0x8000
> -#define DRAM1_SIZE		(32 * 1024)
> -#define SYSRAM_OFFSET		0x18000
> -#define SYSRAM_SIZE		(256 * 1024)
> -#define SYSROM_OFFSET		0x58000
> -#define SYSROM_SIZE		(192 * 1024)
> -
>  #define RESET_VECTOR_VADDR	0x596f8000
>
> -#define MBOX_OFFSET	0x800000
> -#define MBOX_SIZE	0x1000
> -
>  static struct snd_soc_dai_driver imx8_dai[] = {
>  	IMX_SOF_DAI_DRV_ENTRY_BIDIR("esai0", 1, 8),
>  	IMX_SOF_DAI_DRV_ENTRY_BIDIR("sai1", 1, 32),
> --
> 2.34.1
>
