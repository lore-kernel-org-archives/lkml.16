Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012030.outbound.protection.outlook.com [52.101.66.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459D283FE1
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750445323; cv=fail; b=LyteiFuRBnzpLYLEA0Xby4Kg1ZSXDRudBUyPPfPlEJz3pvBD+2GPxdtF5FtHurH04J5/UGqnTuXDR9D3fIhmjpZExjar0MH2TT/dIAyiU6c+3ejlVsyClt0zGQm11ndW6Ae4LoMYjZ1vNGQB38Im24f+MMGG7OQy5hGtTNLBQrg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750445323; c=relaxed/simple;
	bh=h89jOoSKvooiYXkvtlnsxEQ9yt7Q83gUFnPlnlFhvPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=K0Kysb1ArPdKxpWhlHZLUnicLgAwyKIytxyia02py24mnoKfDkxExRvWIoLkWlAn9FgpiRRqbKBhwU/7Y0JdBVn0zg8eHBZ6MDDZeji3neSDABCCk1lB89YyetOiJ3MC8thK0hWWE77ZxaaKLAI+odoqgSiCqMn3CsCSRr9O+iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=frrYWBeD; arc=fail smtp.client-ip=52.101.66.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="frrYWBeD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUlv2ynaaayShgbkbAl8IDBqyaFrjaBFXNgmG1fkLgGvgarmMERL4n3YKS4RvCb2iUlFIT3OMAcxyajft/RxM3rgPVoZ0NIGQTofDC3VYkKlBXNrmC14MuJT7jevGTpJnj7FaFQ9AW4V6t9T3puWRxlj1tus8ot2aLmJYGPqEO3CD1ZmxsbFHAoXLcgvv9Gmk3bb2bfiBFnvaPv6j1tGTHltoks3jfIPsPVzggPkeqjgAh8qrVFHGaS4EWvAR8DX6LVnqk6jFmlvhhsi0xMEP5akvDp8DBrEUG6I/U8tBXUKjCeTZgyGt1mnjLNbhV7E/DLb9lqyFR8hOuvvVvlVHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nyALEltE/E3c1nJDnunpw68QmOxgfR0AQatRge/2w8=;
 b=ib0FFDrGoa9fmrAUJgb0YMYQZvMKA4zTX4ndo32bE8xsoiUo3ufweFBkSBHLfIol19iZv4sHnYLkL8Ym5Zev8a3iF0eShaQiGf+g0i8aPcIc53WQ+RSLDJZ8gciZEF3biVCElQVgw/HFQ0zzPZ0bFEHzsFho+8VgzmtizxGiLBEtJ4bVb1S4Tx/S3EOIZGZj1eD+g1S4GBpg2M7FI/F9RPinO9s4ViEZkFjAiPfMCRVrSrEJoXEuIEqL/mnURNtsOaMmOP9K4n7K9bNLIRrPRdd6oYTqnj1Z7tymXQB+0OAK0KBdzPmoDmN+gP6xIxz+RutrL7J+nkPm6CRq/VAPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nyALEltE/E3c1nJDnunpw68QmOxgfR0AQatRge/2w8=;
 b=frrYWBeDSDiJakC2OIcC+TEUoACW6EHxWGPl17uifB+NseBNANy5DkNzpoWbpxv5o3yYNrs248mIDlNBPWDq7z7N2qJoEsXtZW3idoPteaWgMRvGHFEDkSm8ODD558sr3ZnWnT0K6G84xmM6XTqiQ8J3XsWroZk24nSU8SlsZ4YZ6xssAT1cM6/b1DId5XQGFVkYpmu9I37sftCA3YbOx3sreVwojB1jnKSRE4JeiunB8VJMCMWCkctbE3ilvnd+D2Q0qOd43TiZL298Eb2X9q7fx7DV/rVXkgmFvBKK15NVi1Xn/s+tw1IZ7StxRqrWdFNxMi6idjFrK2ku4tAPJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7524.eurprd04.prod.outlook.com (2603:10a6:20b:286::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Fri, 20 Jun
 2025 18:48:39 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 18:48:39 +0000
Date: Fri, 20 Jun 2025 14:48:32 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] i3c: master: dw: Use i3c_master_writesl and
 i3c_master_readsl
Message-ID: <aFWtAEKKHzfpt43M@lizhi-Precision-Tower-5810>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-3-e0aa1c014dff@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-i3c-writesl-readsl-v1-3-e0aa1c014dff@analog.com>
X-ClientProxiedBy: BYAPR01CA0047.prod.exchangelabs.com (2603:10b6:a03:94::24)
 To PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ab7d522-8e07-470f-3b01-08ddb02b1207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7NjjZR6hGj2y9ezmTKwmQJ1I2e+aSB8hqV7Nq5vzQ8Nyq8dvi+rqiM0XDXBg?=
 =?us-ascii?Q?aiMkrVeEZXfxWu1iT6ekNTPKw8jobqEyYtRqj/92CmDR1w88w0wfqV7lAnr8?=
 =?us-ascii?Q?pNvPNegqEd9ggoUQvmVHeRuhInJhZ0exLv2wymkHrNxnzq0Un2mTtKnSs871?=
 =?us-ascii?Q?so3yQoPPTNf8pSGHZCjqXl+F8HZAxZd+V6Bo2PvIymBlsNHFeCFF78DrNEaR?=
 =?us-ascii?Q?6Aa4FAOY4QjFa3wvqWEztbSrVT4SfJ2wYnt0kqIRv4N1HmH+Veb8+2IQlltd?=
 =?us-ascii?Q?K2KjCqCsL3JtxMuIE+B6XMUpn4Alukdqr23JTGKEWxaq3vZBkLsj0BAbjuGV?=
 =?us-ascii?Q?Rx43TP+cOtU+guYnwnTfOAV5ce0cV+nXVjMYKCWRDsB4fqYSM/JjhdPLbXhP?=
 =?us-ascii?Q?FcbrGAiloOU8AHsjUg11otS1RGLQktSQBTmnMobdRCFs/+8iIsTsxFsQbwWN?=
 =?us-ascii?Q?E5CMaCIOJHiMW0MZcy2j1SIOoWVfkLHQ0/Y7qoep3yRhswu8sfxU8f/5Np1D?=
 =?us-ascii?Q?FvLjC4HjwdRq1JEBe9B3tYywNflUCSJZNHi+tHMpSUcJ2Jl7ZpKG8DxF4sVW?=
 =?us-ascii?Q?dWLN5xxzq2puNwVF5kckjZVsD6aJ0/9sAy4TPQISyaeCVhqnBAsLyUuddTmG?=
 =?us-ascii?Q?Bblp0uy21Qo8cZVKHE/yGWVgAS0rolECqBhy2Vxmdbdi01DmZmONek1/wnbU?=
 =?us-ascii?Q?vRSTRH9DG+rz/onarwe6+CGP8mYWH8rXyhHihCHvX5EAob/0N06KJ0CRoj8c?=
 =?us-ascii?Q?hmpBpxBd6xJ8zIPIZd+VeuGuzcsjS9MrpNIlDl5wxjb6SEhf2ywdB3PvFKy8?=
 =?us-ascii?Q?TF+qsrW7GgvSYS3Inh81ycZQcNkZIKPnA7G7Kaj6BVsoia0oK/V4yjmf6vbd?=
 =?us-ascii?Q?TBARrRCkW7+qOP7DooUJ/5JSW/Ue0ULr6oCPmwpQCxwYKyEXYzfIWN+9KWAi?=
 =?us-ascii?Q?QRDDdA6Abna3xk6T6CkGpFWHSQiPm0o6au6OTkh9FBlHHlNOlcHylTJ0UOTB?=
 =?us-ascii?Q?9LZpLUVzfHhlux/bJ82Wfk/u2Cw7r7nJikqbocXzlhzzJXTjV9qxYSJCPHAP?=
 =?us-ascii?Q?fqFxsfSMK7s2TJIeygcL5ua7B7JZdOKxYX0HaGsyQ2IEy2HRLUYs6pSJpU+F?=
 =?us-ascii?Q?06MKSUxs8J/svcuP7jJqzFnHVgMcC9Ra5xN0o9LUrfRMx7VngEyA/8zbBtuT?=
 =?us-ascii?Q?i3E2x5PIk3Y0+qECmIdAXW/8D0kiXwAbXicpze8+BzQke1XVUluf4xqn75Px?=
 =?us-ascii?Q?UNKPNrCeulSUUvWUK05+wnbLGXptpBU5ttcU/QF0BGN4JXYIRTdDhZnGqHuG?=
 =?us-ascii?Q?/zzNRxkFRkfgmGYIM+fwfmxL8oeRzTy0LbRdbJ/mJUbdMVqn6tbXd4307h0r?=
 =?us-ascii?Q?bopZDiQTMB49NxZeBHvs1OxSUMQJvhFgvgS94w8w4zRNdMdDP9GsbqQMpsgB?=
 =?us-ascii?Q?dWSMHuxzlCrGRwKx3gWeMzzmJEZp3psBc/bCNwdSretJqdeXsbrmHA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+8XvaYu7y+cOBSa1uchdW1V1kWhPAMnj0t59WuuWu088EpYP8K4cO6la6EYl?=
 =?us-ascii?Q?cwumEqT/EnBl3ytyEfSuMEhBHVijiEQjNqIG9fqC1EriKeXoCU6fmFVOlU6B?=
 =?us-ascii?Q?i4yqhQDZKu7HnJGwU91gFqI1/vlR1evUqwgsbFUsW029K5DPA4upVo17C1tb?=
 =?us-ascii?Q?CW7+N9kVvx159gqWQsBr0UCERU2P6c+PUBOlRP2X3Yqa6RY3nTPhgGEY9qLr?=
 =?us-ascii?Q?oxVvvS11MIvoTcjFkfTu+b8sSkOFLPVMCnNm126+zS0V+2sN1WXmo/hQOKtQ?=
 =?us-ascii?Q?hxqPkMVaplBx2T4bW/d2VUHIg+AfIxDtCrTmMQGzzNxMPY1T0e2HOTrNfgvu?=
 =?us-ascii?Q?N10u1ofsSRQ5PEnh4d90CW4B7r6aZiqUxLdibzLsGlNQuth6O9M47y5RL0SP?=
 =?us-ascii?Q?A/CSRkiMTlsXnd30lgZDdNjt1pkCg7FjBdJI6AL8xJuJtBCfpxwUF4N7C3ek?=
 =?us-ascii?Q?ByLQ2L6NXuGujTSasvqnzVATmjsF81YQFehI5SJCMf51J2g8bk4W0+a9Bqyw?=
 =?us-ascii?Q?oFtj/2YSZb0PK3ciXqCD9RSAxqUhDDu5zQBSvJsZqtoEBADWy7i/o01PDPoA?=
 =?us-ascii?Q?LCrJmntzpwj0PduE5Pu59IWr5NEKCNIBWmWq8fZAlSaTAbhkokip6mi/UL/7?=
 =?us-ascii?Q?YtJlOKs5gEmR6rCQ6fcQ8bqaCewuA/2iQ4nXyx2Tgd2z/4259QeU5Um4cobs?=
 =?us-ascii?Q?z0j8R8EVsfQWUGr77jV5nGvjK6LSmo5qEVurOHxnj61hYsMrJaUHqV/JEj3a?=
 =?us-ascii?Q?xe7vVuVzvBJEB3qkrwXnge8+B7YE+l7e3vhxo8KWWSGDPmDTlsRwCjRcw83t?=
 =?us-ascii?Q?8dhg5gXErIR0FYYqQWbD9DbbWzkzMLNKHC6v39jDNWFtnf5tdh2lheOQM9/6?=
 =?us-ascii?Q?5ERcwkdPaI/1BX1ImKGIOK2qqZToDTmys5L6OzNaFlneqxFUq5+0iJLZCcy7?=
 =?us-ascii?Q?2qXoUPCVlyR0Z3+TM90sPdHzIxE99nzghYTcsuc7HP0ALnif2/LdMqH4zO7a?=
 =?us-ascii?Q?Wh+12DI3mQ7v7xX2oW13is8sGSXhDPiOgJXo75IuMmhswOU9dGrM3ZGWZy1v?=
 =?us-ascii?Q?ZOMsoFqfSJ6APMWE/gjQqXG2GxBHBbzcBmD60G6P5IKMNNmUiws6Vo+uX9sa?=
 =?us-ascii?Q?2//2pS7kp2r2ZjQE51xcpOJgK40ys+ELW24IoAqSKKI0Z/DiD5HiFaOvF30U?=
 =?us-ascii?Q?y1jH+CQ3dDFKz1yOO9+5AbZMiQQ5qUg2vnQguR/+0aDZKQxK+kGfzLARXazO?=
 =?us-ascii?Q?ieg8WzWTVE5VY/m+jps239qf1BxpG51lP0lwBTeJbmGGo1VAnfZvu8GuT+g7?=
 =?us-ascii?Q?R0hGTPXk7OinVRi4vnPcptgxufWa56Fv7CZe2dqHbBa1zhxuWWbXcY0+l9K2?=
 =?us-ascii?Q?SmT373DCuHDc43oXeDa6KXn5C/Pf+EkoKKLHbazn0o+0bPaQc4jfJsM8COYj?=
 =?us-ascii?Q?qBfmB58M22T1nyegWt80F4KbhdOMXH425RSR7tDBvOZfPq9l53B/121o4z3u?=
 =?us-ascii?Q?j/AsAb2yXSgCfJxOtXbhlzLQKhlm1kx7INkt6cgxGAT2J0eFnIZFGwEqRa5m?=
 =?us-ascii?Q?TywfOaoR7EX0Y/AN8js=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab7d522-8e07-470f-3b01-08ddb02b1207
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:48:39.1244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nOBhvtElMgz9JwmkO0lLDOfPhgz72nYpKAZrQjFoTUTfMHWxKmcPFkOll8nZm1yoMtEqN6QYx496eGjLWi6dhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7524

On Fri, Jun 20, 2025 at 06:55:01PM +0200, Jorge Marques wrote:
> Use the inline write/read methods common to controllers that have a
> bus width of 32-bits.

please update commit message and subject according to previous patch's
comments.

Frank
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/master/dw-i3c-master.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index 611c22b72c1572ddf717c8ad473e44a3b8fcceaf..eb1346409829dc64cdd1d738e9870993d38bbb0f 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -336,37 +336,19 @@ static int dw_i3c_master_get_free_pos(struct dw_i3c_master *master)
>  static void dw_i3c_master_wr_tx_fifo(struct dw_i3c_master *master,
>  				     const u8 *bytes, int nbytes)
>  {
> -	writesl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp = 0;
> -
> -		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> -		writesl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
> -	}
> -}
> -
> -static void dw_i3c_master_read_fifo(struct dw_i3c_master *master,
> -				    int reg,  u8 *bytes, int nbytes)
> -{
> -	readsl(master->regs + reg, bytes, nbytes / 4);
> -	if (nbytes & 3) {
> -		u32 tmp;
> -
> -		readsl(master->regs + reg, &tmp, 1);
> -		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> -	}
> +	i3c_master_writesl(master->regs + RX_TX_DATA_PORT, bytes, nbytes);
>  }
>
>  static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>  				       u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, RX_TX_DATA_PORT, bytes, nbytes);
> +	i3c_master_readsl(master + RX_TX_DATA_PORT, bytes, nbytes);
>  }
>
>  static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
>  					u8 *bytes, int nbytes)
>  {
> -	return dw_i3c_master_read_fifo(master, IBI_QUEUE_STATUS, bytes, nbytes);
> +	i3c_master_readsl(master + IBI_QUEUE_STATUS, bytes, nbytes);
>  }
>
>  static struct dw_i3c_xfer *
>
> --
> 2.49.0
>
>
