Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2086.outbound.protection.outlook.com [40.107.21.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAE6204F93
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.86
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743519662; cv=fail; b=YK+kdLOytQmwAEPBMoPfj1FWKj6w/xuvqx3e1npk21nzCA957qebS8GFLaMrWd3wQsZ766prHUeLl7U9ZIszWH0CbIVotWypftEygU1DwHZj+3r7TgK0hq/UuBlOfIgrS30pE59Aykt2iAb4W0bEEnOCvkxBlUqAquc9yOLET5s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743519662; c=relaxed/simple;
	bh=wSIRJf4/1zeIdIyYt4HGSgSSjBynHW8T4A0YRU7NfG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ODlD0vsSDdpaHYCZ1pJEn3zE/62krnQqtTxa2YX/Mvi5ZmcaB2VwDV7nKEq2n4NhV/CO//ray9g8ih7yjRaXQiu5bhc93Hue3iGyJlBLa4oO5nGrnx4Sjn4dnXyrKga9X46U8MNhX2+Lw9NQGgMfADIdmMKNh1pYfMmaEAk9ldU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XuJPHoup; arc=fail smtp.client-ip=40.107.21.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XuJPHoup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWluM+y8PjvBOQD1zUN+9Uhyd9Ibm5eKBJPJqzfTlsHPm6ER0L5rJwyr/VOemXBHfcWicd4503foGtK2O9IxGX02t/u9MMa1WCQCajKDLfofmlwY9XjSMf/KiFAOWtxD370bCAyX/eCDF/qud/F1Cl90XVkq7qMPaRuofdh96oBSqHXb3HpH6u66J9hSWdO6B6pdg+u41ilGeu2TwWOW0qcHTWqYJp2mg8LOs1IZig7F785pWBjGrLommojkASOtuTsFDbZfT7gMaFws+Te1UG4Ic34XcXp7gveNGt58p0AyUZq0UczkpB1/T1UkaGA+2KjVk4+yzlcbkJtvmH+WLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=963435z4BYlwaLueYfT61mlbLiYLo5NMLJrbuBjCwpI=;
 b=YCDKPU1B77s6KmMrS91FrBQlWA9751iNJMdrKEF1sHB0p0gTrrCZEBTE+7JFZiX3rweDDjrVWgdkVVWtuFwgEBRjPpVRSDZqiwSkXYqB5MNss1OTXq9/kB0XBDjC2MdXUepv2mYn5y3sL18qg1Y7o8Tt5uJ3TtyNfCffFXAF09vHfNSyVYsKxouI7W8TR1oBkjHPGadPLVL5cXe+G2Ea32otnrWpOkp62/e7ywbpgHxwGan2gzfYSkTO83ZCPnbmo7rN88uxzwBIk3kI5Jp6uSJCBT5zV6U7GFzs35k34bcH1xj7FEDUKxF+4CUxQYxNB4KHRnPMo9KggdevV50KjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=963435z4BYlwaLueYfT61mlbLiYLo5NMLJrbuBjCwpI=;
 b=XuJPHoup2VKEGuA0wE/es0AlXAgza4aMYGxpOBGuaIMzn1EP2B/kshYxLxApte6kOOl3Ii4SCilS6WjuCIAm1d3VnH/zC1hGdU9QrvjW/H/Wc9RGi6hzMTwl6SbttWGxA2LWBelgBNlJermAYxsF5Rk1kih+GVoMvgvJvn7AKFXoAZ/YH5Vi6Nlfsf6q22vHZMAWG+9HEjIINr7mFsUKAWIUF4Nkw0TPJdX389qsa51OBpNTxJVm236gO+i1sqZxi2yYFsJrt725YpSgWNjxZILuzUGQaQkaDv7S3ZpI7vdd1c7SewCMDxL9jhs+rlK4wr7/gFRhLktIJJXMiEjxcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB8700.eurprd04.prod.outlook.com (2603:10a6:20b:43f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.52; Tue, 1 Apr
 2025 15:00:56 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8534.048; Tue, 1 Apr 2025
 15:00:56 +0000
Date: Tue, 1 Apr 2025 11:00:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stanley Chu <stanley.chuys@gmail.com>
Cc: miquel.raynal@bootlin.com, alexandre.belloni@bootlin.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	tomer.maimon@nuvoton.com, kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v1] i3c: master: svc: Update actual read length
Message-ID: <Z+v/ofP7cVHrBGPa@lizhi-Precision-Tower-5810>
References: <20250401063406.3728534-1-yschu@nuvoton.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401063406.3728534-1-yschu@nuvoton.com>
X-ClientProxiedBy: PH0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::31) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB8700:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f72b62e-74a1-475e-4600-08dd712e016e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T3ihyaf4Urznr+yfHIDCefVL+Izd4l/t3N230ApSLXyygv/GP/t/S8gu4THR?=
 =?us-ascii?Q?ZA//d87qezyj6bTqqF2j2nOyYNUx8LeQh/KVtBNrdcLdH25W2bo0PoLcSXvh?=
 =?us-ascii?Q?e+IHn6fn/Ad07yLGc+AU4S3FIYDT+tQDyRD0/IaeTgHr0OYI0OKbE3hRruu9?=
 =?us-ascii?Q?NgsmPpqf2zYEx6fgs8MFsFU4ZGUkkiKeplqLyCLvcIJ9aVisx56cB4afQBbe?=
 =?us-ascii?Q?IcW3MFx24hNhgXIGPvyW77os0ro/NZ0G1QSsu4OCIn6YzMz5X0IMyszU4yyr?=
 =?us-ascii?Q?BgA6IhSl0Q8QO3WqG05CYFc2YCgdHqV1VH96rjQ3vOLubFCc6+E3TdPLG3wC?=
 =?us-ascii?Q?j7gTOsh9nFapj5dMMv5aPdoe7eWswtopEWmUOYkLhnWTsttpok/vefNVca7E?=
 =?us-ascii?Q?v0TNuXmpK/S68vBd8fEsxqWugfH5C8s13f396pc23gbWtAFFfRql7SLweTcG?=
 =?us-ascii?Q?GDjO9etzRoaONLjkRBlaOltIfoah9Pg4m7k890sg125EWXkPvjfaI65G/QVE?=
 =?us-ascii?Q?ycKXB1P8dGAaxaeQRvVMjAwYFBgQ3ANChwsZ+dtGDpS9LHuNjhRqD2JqwFNn?=
 =?us-ascii?Q?LnXEySuyfjgLS9iSXMRLlZzHScR1pZffLk7YjGU+5ofxtXOy9QmThh0reY8S?=
 =?us-ascii?Q?Qns2p0BGR00pEeUa6DNvdpZu+tyw3aooWGEUW/x9oi5EOtd+3vIMAHKsPVKa?=
 =?us-ascii?Q?9NOyoPpi0TP5LXxjskysRhpW/gQ/dTOTKVga6h3fPUzHhz1XYdod5c2SQyJ8?=
 =?us-ascii?Q?cQin6CoQv+KSQnDfJhlsrv2+u9QPLhJnEganeZJW/EGpoADpceKYmB+uFvde?=
 =?us-ascii?Q?H7w1gWSg3DD/g1qbZNxIFTVBJI5h0CY9LLKR4Sy/kXzYfxZEowxnWD1O9Wq5?=
 =?us-ascii?Q?H7+ZuIyQ+noJZcZiOszSm4xr4mERlQXUjT6OF1QvK6Ka2RGPbsL+rupJ+i4P?=
 =?us-ascii?Q?SyROhRPBggii71ObvBuhbpJLqqjE/iycNgrXO/KSY1WgjHzyGQMo1L1qDDtZ?=
 =?us-ascii?Q?NnRrMpc8M/C+PVpL3T4q3WWMA+mb/1vZ+64pgUuPPMyi00TCU7QnloZw/3NE?=
 =?us-ascii?Q?Qw5SR7NWK3/SFpa4maBI+rpKFLB1780cTJBX5z4/rV5Ih6KxEMyaLhkcG4X2?=
 =?us-ascii?Q?MA7O/35rksCRcFYm3+9AyNFC+CdNZL87IxdPUI5kLoPGofPv8shAo97z2BfW?=
 =?us-ascii?Q?jt48e0jwPT6d62gm5TMqRBvsqNlszTbI9YE/+2cnakQaalHqUQFJzaAtWZBu?=
 =?us-ascii?Q?tMlWOMoH98dtu05HWTjs3GOl/qmVcazbSVBEgHL1Y884aWH08ThBcX7mHyE5?=
 =?us-ascii?Q?4+H6hsUetjGsL5c/6kmkZ9HRMZx6uQXdeF+rDvRWaZMtBCmCoLT1njDzTVS2?=
 =?us-ascii?Q?PSFy5siWAjjPycQBNORTmM9+6ox9vsZ/cZHTDw0L2HOYRnFlpsQ9ad9mqH8k?=
 =?us-ascii?Q?6bKb9JE0eUKTo/7f+1kpPjjUv/ypeKFR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RUtcBn8Id3hZKwQ6u3XWhXRITabYF9iuE9l2iDjNfxDk96akUV11ms6xImaW?=
 =?us-ascii?Q?z4cuH5KW40GaX+wfuXm8UVtMGrr3femwqX77Gg2pHjVmDUySiYgd7RithyZA?=
 =?us-ascii?Q?2/DKBrO+ewAvZ0cg7eOVLqdpBTQQHy0EyD/ja6CmWpL2rPvEQNaOU6XTXFwE?=
 =?us-ascii?Q?YbyXhCByUY23i54c8Gnky7v0AFMmkHjpk5rrWHCI9yQmDg+TJP5m+GiXxMjA?=
 =?us-ascii?Q?XcYB3kOOdIXKofRWwjeqdrYCH4sqxG0A+bJsRYUDacuK+UN0BySw+89v54Qb?=
 =?us-ascii?Q?Wx1/9HGmGoJuZwuG/YUDf9B3oFQ9xn3oaAj6YXwxI9Vo4RqnOnTYnk05vKTq?=
 =?us-ascii?Q?kv5E80Yna9Usc8Pt7j/EbCvLPWiTsFcPu/Ju5K4jgdns6nxwMFJpU/YjXqTH?=
 =?us-ascii?Q?vEDv/uT+I6ikxSSWnRajAaTB9dQ4Mj+ZuotdIMygurjesZOG/e4UBlEi2qeT?=
 =?us-ascii?Q?4fC9Fl4XnGo28i94s09rmGExwR+XDK9sX0jfef4DkrnSZuuFFMONnGzqmGrS?=
 =?us-ascii?Q?BupOVvePvMnPUyww9se36YrSmJOtY+FHfeC6u0D/mYXzqfe75PWFVFsOA2Ex?=
 =?us-ascii?Q?q8AJeOMqYiN3cXzmLS4DPinxpHaJ+l4mucVIqKXd7LjAgoWu8jxkVVFJL2uU?=
 =?us-ascii?Q?Z65fsQ3LHvbfP2TUuLbT4tgFOB1w59sWqiSYOXkUQJXD5aUtCHKl1x/p14eH?=
 =?us-ascii?Q?hBbO2H6B3XriHkL0aEiy0s606505djrG0sq2arLX3Wj7V8e7U3cMjshg1vYg?=
 =?us-ascii?Q?ykfV+fBHRJtv5EyTlPr0HFAADZT5hjiMkzbS/VjUNIQ3RO/mpiB71YSTZsi1?=
 =?us-ascii?Q?hrZo+RWH1m5eV2CcN0YFiU2oKch4iwF2FSC33GbdpDZtY05IzYFSsufX8mMR?=
 =?us-ascii?Q?7flEsFSUg8iyRR6EBsPBu2gzBPQvUtDcOrvbX17TmXvchkKHgaAw33bvFaVe?=
 =?us-ascii?Q?4Lz5oHl3jeZgqAmCfh10uIcUNn/unm19lPqlHNLhvpUwDPAREY/tiUX/mh4x?=
 =?us-ascii?Q?1pIC1UErSYf7x0AM1f12ZC9MSgKlMOyFS85egwPIOTC7rksjoqAw/x51FbZR?=
 =?us-ascii?Q?bGKClFLumw1meJisvD4Tj7rrwQS/ZKhYWAsESaafBR5lV8MDa627qvzbV3X3?=
 =?us-ascii?Q?9FPh6lW4M4dcXJe2x6jyG/KffXDaznTHrAIY/L7x5IuIcOF6Ordkkvd4rnUX?=
 =?us-ascii?Q?Hgawm/MuiEL7JmLNCbnmNhdRO6Yfpzy1sTuErVlubuF278ZYLB42yHQnEEz/?=
 =?us-ascii?Q?hHAg8wqZySRowl1npYGOnT/Tq6FPrv007eiv7wVn/qQWSNF1DA+Xg6asT5fu?=
 =?us-ascii?Q?Bjxp4dDh1+NtiRMduFO2AUJvRRN0cM7bXAd6XOeE2e0WLH1Z8O0X0DrH8NGn?=
 =?us-ascii?Q?jW3MIAmI7MQ47ujFyWke9dITCc6YD25OMl4kaYX9oZlL2Aw+awPCMls1hCiT?=
 =?us-ascii?Q?t4k+I2PwAIqL1IWzCrGq4zSZjdabqEYWxH0hhyr4V7kWr2cWLRudrppB1RQp?=
 =?us-ascii?Q?GtDyw2d5onCGfSj67RIN920MNghEUkfWFyOmX+fWhHB+P5Y9M0jl0h6PpEQT?=
 =?us-ascii?Q?MvejD/TmKu+oY0Tkd3CVjss3OBBpsKGask/z7i7H?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f72b62e-74a1-475e-4600-08dd712e016e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 15:00:56.7242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z8bzG41iEQf5BqJBtAobz+ckSEIeoge8rkeFcqMs8DWINUNXS0yBlUbtvmAVaaQgkqKlACn7JW1F6vyfymdQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8700

On Tue, Apr 01, 2025 at 02:34:06PM +0800, Stanley Chu wrote:
> From: Stanley Chu <yschu@nuvoton.com>
>
> Some drivers, such as mctp-i3c.c, reuse the i3c_priv_xfer.len as

In include/linux/i3c/device.h define API as

/**
 * struct i3c_priv_xfer - I3C SDR private transfer
 ...
 * @len: transfer length in bytes of the transfer
 * @actual_len: actual length in bytes are transferred by the controller
 ...
 */
struct i3c_priv_xfer {
...
        u16 len;
        u16 actual_len;
...
};

You should fix mctp-i3c.c or need change API defination firstly.

Frank

> the actual read len. Therefore, the controller driver should also
> update the i3c_priv_xfer.len after the read transfer is completed.
>
> Signed-off-by: Stanley Chu <yschu@nuvoton.com>
> ---
>  drivers/i3c/master/svc-i3c-master.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index 85e16de208d3..dd520f5d4c9f 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1470,9 +1470,16 @@ static void svc_i3c_master_start_xfer_locked(struct svc_i3c_master *master)
>  					  cmd->len, &cmd->actual_len,
>  					  cmd->continued);
>  		/* cmd->xfer is NULL if I2C or CCC transfer */
> -		if (cmd->xfer)
> +		if (cmd->xfer) {
>  			cmd->xfer->actual_len = cmd->actual_len;
>
> +			/*
> +			 * Some i3c drivers reuse i3c_priv_xfer.len as
> +			 * the actual read length.
> +			 */
> +			cmd->xfer->len = cmd->actual_len;
> +		}
> +
>  		if (ret)
>  			break;
>  	}
> --
> 2.34.1
>
