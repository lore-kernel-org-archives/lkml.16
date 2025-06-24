Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013010.outbound.protection.outlook.com [40.107.159.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C95231A55
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791902; cv=fail; b=PA+ILH9SE9ITp41bkYxFUaUAiOvKAv5A6spqoIzPowituiyRPhxI1BQotJQzAiAWIApG7GY5wdXsMp4qUAavlQCuBRkB38mgza2TFoj/0mwtyagQQUZ1FFavUjmzi+Cl/ORLz6RkWHOVKzhob19JXygTS6zoGyh4mBTs9wSaEDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791902; c=relaxed/simple;
	bh=NpIEL8FYfG0nSvVPprZ9lYQPE8+KfxvtYnsthxx7To4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JjufRBMqk2+jrzJkwaTcOLLRaQZ7iz/ozO+VQmfjSym6vLSRh/qo5B5CimHbv0nVJl3md3aFMXiFnQeNZRetNfwebewXLCYc6Ix2nZi2WoFbAAuYfaE30wIc/Nw7/fYHRb7Tvpx2dhgNxIgSAAIdYqoFuFVzv0owUHQA7Mu5U2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YX3wyyRU; arc=fail smtp.client-ip=40.107.159.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YX3wyyRU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtqNZg8OanYPKi+LXSSn/Kn+7qlXLsz7AyaLyLt4ThFry2yigpMPZT81kzNyv7nEcgF3/LR3Uv9aLj7qlmDYRdNsnalr2Ex2pVf173kAUqpJs1WxaleP9rdbsvKG7iqZCdVV9TK4gsLHbJOADUjhzI9LZmv9/oKE6SSwiiLAe0hHvYBf5vTvIsXTxQI8wAxbvB8OcyBNuPbvS8wh+SKSCXM78KGdqCxtUgnkeAdw3d4SHLqWlIKW8n6jPf4/RBFTna+f2he502mpzlbscSMLq01cZh4gLx965UfGdQRreZGicL5USe7lCchp5B/QF0KhN0lwP2eWROVwY/f0mCYWkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0QW/TUTOrc+YRWEhJXg3ViRR96TSzx1FIsyac4liK0=;
 b=QvprB0Ug59eplZcjdCY77jgkjqbKyMtW+mNJB1cChLdxj9pZ9CfzznYCTtsjz41fxtJeoeF5EYB71LJU7F5xqhWHrxNkGXkHVU8Pm5mndQNp9g2y7VXoeX5Yx2nqmZQrxvqi1dPGlbaz9EJNbSyEFxud5Q8lpwCM83xJ7ImUKwFHeP0WsWthUTH+OulEDbDZaeVhnNRPhsNnlPgrdpNXlABOTIFFMSZSLLenN75pz2biWWh/loX2SUVIpRCs7T/mOLh9uSPDco01CUD6hd8ZR9bYV78xZJBkFb2hbVr7OeVKVM99//Agga05lkusuLVlA7kATjL2m8HV2nJYoAw2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0QW/TUTOrc+YRWEhJXg3ViRR96TSzx1FIsyac4liK0=;
 b=YX3wyyRU14oVjAVVyhCQTELYiEsxPzdqdPAMaj47M4PMSdQJyU9PBx3U3fL3bOFqxrXPX0euqqL1dvteQ7IoG72RpMwl7LYu78FgRzuXXLHuHf0dO6fjb8jUNgToT06momoq5mAwlvy9rnM8MbOmDt2qXXyJxs1S8nMfTWWLcOmOG1lIJSTYAAfgT4eTvlfdE4zaZ28lx902EhzL42+R9hnmT42fy/u0Nii45pbIZe5CVqYPFEImx86weViSDIBcBmoLqvbkG5lYe8HKFaCiBsUCdj8KO7E27f78NVp8fys4BMaK8pdqo+qnHMorSw92bWnqK6XRh7O8u2TI8sMv6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VI1PR04MB9761.eurprd04.prod.outlook.com (2603:10a6:800:1df::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Tue, 24 Jun
 2025 19:04:57 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8880.015; Tue, 24 Jun 2025
 19:04:57 +0000
Date: Tue, 24 Jun 2025 15:04:53 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Initialize ret in i3c_i2c_notifier_call()
Message-ID: <aFr21Yj5AgKSadxg@lizhi-Precision-Tower-5810>
References: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622-i3c-master-ret-uninitialized-v1-1-aabb5625c932@analog.com>
X-ClientProxiedBy: AS4PR10CA0023.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d8::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VI1PR04MB9761:EE_
X-MS-Office365-Filtering-Correlation-Id: d622530b-9bb5-4c87-4941-08ddb35202ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NYKiD+l9ZUWX4F0L3dpXVnBT+GEZZKLTH9jBWN+kl++pgCHVQilxTXx+4alw?=
 =?us-ascii?Q?DiJ7mGVgBBx/MNFKVEzCmPsCiNGFwa3klQFEj0Gd6rUD2fuoHbxdO/cG9UMN?=
 =?us-ascii?Q?jH4+kOInZC5DYBNsrMqqakPuGIUj1UQPvhfVCLP2pD/jMx/JKb23X6Tp3ExH?=
 =?us-ascii?Q?8i/lUiFDChnSlPQLQarbr1YzVPuDCukW3pzMFX8jelDAsRBLLRGHgcKh36py?=
 =?us-ascii?Q?pyUlGCIQvXJD6H/g/IDTyMTX+xSlTiyz35qZrHrXoIect2GOKc17yVzsMFmQ?=
 =?us-ascii?Q?+URcaGEJ2cLep9iXqV6eZZESz1edb0YAy1O5MfbjHBSxJSX4nO0785Zl2J4h?=
 =?us-ascii?Q?ro3LthUqFuGbMhM2c31AvmfA22WmlJ+S3LhnP6nRVMZpXKCv4+lHDenUwCs3?=
 =?us-ascii?Q?O6W9bc6Bt6cEKg7wmTvD059v/ssJLvucq21YaTXNWoyAost0C7tCWme2uO4+?=
 =?us-ascii?Q?1nxlQbARY+R4dzllNpwZM8Gjat+7JXX3ffqRMc1SaBYkVsCFleDSDfvi2xK0?=
 =?us-ascii?Q?cvfBxBE1+X96qtUqcDyALn32zu/gjoJNwngcc1qBbwWj2Za1ZTMVqVYuKtjF?=
 =?us-ascii?Q?Ha1md7xkeRP9VkqSjuGeXE63/MaGSSzWqm9zjSttO9IJLw7tBb+5rm5d5t4A?=
 =?us-ascii?Q?C3w3USH2Pkz6XokgdJM9eGmtzrmJPAqyx9i9mZcuQdt9QPGSjn+F6CYDRTtD?=
 =?us-ascii?Q?h9gpHKB263uvbkhKH/ILDfexfCemBm/Zvch1vE0pJFWNWR91Rg4i7aeF4SMm?=
 =?us-ascii?Q?jqdDSOjm0zDOe05//lRiwYdkfcQxZKkIPN+nA5y5US4WdkF/YMGzIUk7n+/y?=
 =?us-ascii?Q?tSAp9/zL4UH58q+JBlkvYJ/+HrQuz6D6DHPztur2wI5IHK6y0XV2bCyJk8h1?=
 =?us-ascii?Q?EOdCI7Sbrk0dDkL7X+ObS1ibk33e7LIEBih9sG0YnrK5WVaq+zbeKkBFaGpu?=
 =?us-ascii?Q?LNcQVpNhl5rv/HxQS5gQ866CCA2UoZ1VnZA3xSo25sRTNfA4DmLEFRg2UdWL?=
 =?us-ascii?Q?ebJoT4GOMPcp7I/HDoZMBbmcV+7/HF1ORAYhmXoyDce8He5/hVnfjh/amBrW?=
 =?us-ascii?Q?3v4UvfDwUzfOVWIV6qCy2bNCxWyqyvi15FliZhnGCdAonBW0GcYl4x0tYQW+?=
 =?us-ascii?Q?vcQYLVKLlyu5WgoIhNeiQorYcLUng+/Z7TC1M9GBJMijf5KorzM/w1dHmCpI?=
 =?us-ascii?Q?XMwTnnuKhGOWgIjoLZu1uhCKmA7vdWDx9acNmbrqmwLGrxRjTAtCnAblayeX?=
 =?us-ascii?Q?bcCH+vpFIm8d4T1XFIXlDg9BqPkx6gLar2er6M+POy4avwCxmkSl7wGgvg6W?=
 =?us-ascii?Q?PATw6izwmqRorgT9P2MCFeS66boNtSK/ndzmxFcRMoORdb93icEZSlF2194V?=
 =?us-ascii?Q?KY6IdYfKaWVSwvxUNU1VWL7R9xE88Uhj5fgH2V0h9Jl/tDNfWRc0pWg4aJKN?=
 =?us-ascii?Q?GKyyV/6lR0D7Q7xFtXksdK1YGyNhSfybWq4UqfrnymdLoyAIzuAUKLVwaGTO?=
 =?us-ascii?Q?wxoWmb/mrnJcKEE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L3WJven8Lj4+ZdrSady6GKA7VY2d2f0NEdp1/yEEp6/Vkc89hYWq2fvkrkhv?=
 =?us-ascii?Q?rXUcLkos96e05EdjkRhZv1YS6tVlld2K0SfOnWFbSwDAcBztYDrhdVNRTLOc?=
 =?us-ascii?Q?W4x2g2ttqJZ7Gom3BgxVwD01EOCoctxfobH70IeBVspHfPso6XWshr5ycNiL?=
 =?us-ascii?Q?tKcZXsOl5/JHQLV6LBGFTf2MSmzPtm+iZ1xaEwHcfi4LkXke/VheWq3QGlB/?=
 =?us-ascii?Q?r6bqwzTYU/dsOUxTR5nNWk974DpyHEEG5piZU68T1Aj6MwvflosIGvfBV/nq?=
 =?us-ascii?Q?fB62SFiQtmFuVeCHKxy0dRmnoIXk5QmVKuP4ELVjKxueijkykr7nXTPLh1B8?=
 =?us-ascii?Q?Xb3s2ZKlePfIOwyiMRiENYCHP8uJuXdsSGxTeja8v2xlWVgkHakFRmwAI/3V?=
 =?us-ascii?Q?evcooWM77obhTYftvpbzSGSfwewAq5q7FEWl2cytWkQO/GkeDcGiGqbPot8T?=
 =?us-ascii?Q?Do7K3kPFuK+v3qrU0iGB9uAw8HpzEIjQufuMJ1PwI6ljF6unEl51FYhKtCQt?=
 =?us-ascii?Q?fmAPqSp8w21IxUvxaCJMHvlqbYhbiI52gXjG87I0zPWeY1nKlwr59egSSyhh?=
 =?us-ascii?Q?ZIF/a/Bga4hnrZm4+TdloSh6L+Ff9VAC+Vuu2mnm1vmOc4nH0Ia4hAfInHuD?=
 =?us-ascii?Q?9zohGwx4EnWKMB1fRlI2GFMHlytN160hDDaa267icmlLTf8vuhmsVXJTwtlT?=
 =?us-ascii?Q?ibxXi/6H01F79gRfsHGedWHphj8ehRr9dz2NjW5bXOnCD/B1cNyyBu02v6vR?=
 =?us-ascii?Q?hrh+9WDt2SllyRNv6/vj1rv2tUdTsQ0QlqAGSRAQsu8MhE5/zs6hw7/u1Oja?=
 =?us-ascii?Q?j7KMVLV0ggzfXmFPzTbprpHRDohvKjNZvvkhVNbc7VJvQo9geu6IUHeOgthN?=
 =?us-ascii?Q?4z4EQAcLqh3VoYxkmU5s7bRzAJu8Eh2qW6mckobO6WPp6LR0kWXj0nn+0Oqb?=
 =?us-ascii?Q?H+U9X0xMPEWpje1ZM6DG7UPHdD1cc9YJ8jFfo0RX2U+zf96AOCf5dIQm4T/y?=
 =?us-ascii?Q?xLdywEMwQ9I2LUQ5M9MqOaCnePEF7cWlwn3RaGn0kBS9I01sFqMjw+I3phrQ?=
 =?us-ascii?Q?4k3brtm0NVd85u96c09xhCNBDMA2W3jvVRusnwKJG1aKgQBDqNR/N/zZEPA8?=
 =?us-ascii?Q?Jc4Pvtr+d40dQ6pOssNZnFYvv52NvcL9j3J4MJq131dhsT7Pd4xIwGKHam73?=
 =?us-ascii?Q?hKXFWV9kuG7rnlWCHg5Yd6mZq4fbbxXnGv+UnJEP7SvivUjuoTT5mkByAdAO?=
 =?us-ascii?Q?yH4erhvADrDrK+yJbgKIr31CEiEOLur9l2B21+1srOvS1pQE6NSUXF96T/py?=
 =?us-ascii?Q?73AVajIkjtnKmf1t14PdejD1eWV1VKcWMRshzkHw7yMmnldPh+0fF/c07aPN?=
 =?us-ascii?Q?9WsYTOQer8ljGaVIodlazQ/b0JRlwuGiIHIbB+wDdu7rBV8OwRiEQd3+jHqm?=
 =?us-ascii?Q?8Bo+oEHiPvGc0f89hO8AmTpVuGjK5APzv0oBQQNsFmS+q6mSSrDVDOUbf/kM?=
 =?us-ascii?Q?pPztayN+JonjYCFQQu+lBIBuLjLAtd5jvOQEwuZ88v5k4S3d19b0y0i/bBLe?=
 =?us-ascii?Q?wzPRUTjdKtI1kl8JiHJuOnuVuyiZJtv94VAwExTW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d622530b-9bb5-4c87-4941-08ddb35202ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 19:04:57.3488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AR7EPURe6MqIG1NpNcd9AH3TvO45feaTepbjL4Q4UOoatYZXel0udvV+JrP5uFnFyU78GaD/o7vxe4p4E+Hlzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9761

On Sun, Jun 22, 2025 at 12:11:07PM +0200, Jorge Marques wrote:
> Set ret to -EINVAL if i3c_i2c_notifier_call() receives an invalid
> action, resolving uninitialized warning.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
> If a invalid action was passed to i3c_i2c_notifier_call(), uninitialized
> would be returned. Add a default option in the switch case to set it as
> -EINVAL; I didn't set at the variable definition for readability
> purpose. The warning was caught by smatch.
> ---
>  drivers/i3c/master.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index fd81871609d95bc082bd401681e7e132ea74f8a7..68b8ea9174b984a6c89b389c4b3a9669239def70 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2467,6 +2467,8 @@ static int i3c_i2c_notifier_call(struct notifier_block *nb, unsigned long action
>  	case BUS_NOTIFY_DEL_DEVICE:
>  		ret = i3c_master_i2c_detach(adap, client);
>  		break;
> +	default:
> +		ret = -EINVAL;
>  	}
>  	i3c_bus_maintenance_unlock(&master->bus);
>
>
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250622-i3c-master-ret-uninitialized-16265d8a8719
>
> Best regards,
> --
> Jorge Marques <jorge.marques@analog.com>
>
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
