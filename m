Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D246621FF3D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444885; cv=fail; b=JbH0ED+Jr3zOS147JVW6ompakjRVRuOjlWowgsOZMHy+U7ncNqO0QYkgolGTiqVyP4THTwqjPOf14E66buUS0aPXGzU4YUz1vrMSxiDmaSd5xZoXV7tTvPJjlua4U3sxeeiNkK0PyQzZKNoRgv77UZT7tYdHpO10mNj5182d8b0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444885; c=relaxed/simple;
	bh=pTS9Us28vyC/PsW+6er46/t1DjMv7jUIaZ4CqkNwXCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sTfoMkW05vi6gEKqSCzxV6vQmz/f8j6PoviI9hfpCcrBOBIbHfQKRmet+R+8YhdYAIVyC7ElpdcWMqZYVvipSVCdqInVl4tVgJLNE2CvzBjIzIu95DHn1W9W/2nPIAo9oAIpcuVfIHZtx0kryg7Sx3ej2eP/GPko53uqjviTVv8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j52DONGD; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j52DONGD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiSt5QgAuhhSYYfih2M4nLoMLzfWMO3qHkE7Uk4F2birFlMh3NaH4zhDRLBJXupOsqvAr5+uN1zogzSN559o/BcQs1Q3qB8ytcG34Bg2/fs5/s+IIEiJgFZFy+OGb7b6hMKK3mfvLwjKQ+p7uFjbMeuYA7Wnu2HQo+MOzEHoj9I+MwOTcNs7moMOzUp7zjjvtXaic28yGXhuMCENxoUJ1K+FPekTD6uv2m6HgHzprN/UdzOEFYzl3Lb5ycjF3SrQkoFwr52/hUCtjnxFzu1KN7wWfZY9RzboCv9LQWDLP4sMGUXVJmFlDariCIoSbhalVm3XySl3+ixsrczrN7rP5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2dcCkza+VPOHDhhzCsSg9+k5zWLmIG/b2TdW8hBgaUQ=;
 b=xGiK7wJSL6PTmz4017PX4Oze4+hvYs+HVF6EieCNbwZhHOrp16P/kBxz6Taf2oVu7PXUi8AncGzkUmi0WooYAsT/ZEJM3vG/OFDEhZzHN7raBSl29lVofiW5wRAZ/S4E8ipxwKGL86OGvM4BS2UhwW6X+1fqKkhI1vN8XmSRcqOib4MYHv6gwy43bagYkKgQ1znxFLxMEWLQ+YPPzwq4yR9pyWuRUhN0cVLgQQnZL58Z9TzVxn+gkbm0bCB+3dG8QpU0u9tSDZ1Ow484oT7ts2FH8y6SokzEBpSsL9SnCGZYk4+8X+uJemjDHEHxAvLT0Eb/7PrDynwzdMsENtwo1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dcCkza+VPOHDhhzCsSg9+k5zWLmIG/b2TdW8hBgaUQ=;
 b=j52DONGDB7BXFshf6HzAvB+rHW/DncCGGK7MWA7GGL72LrcMwCkbwF6aStT84fqM17qrCshdwv+vrhPpe14vRHhVvL2RUVF0SWRq8tUNipxtYbMndf8y0gOZGY26Oa3GThtmlgUseAD+tiTaPVfWbUx9boHovEFfed7ZLOuY1ZFs7nxykDrQTDPtxmYPhKWIzc9DqqUpAQNbjy0Oy+M4srng2NJhsDctde3MgGbLnPgVVtpv4LtvIRjAEc3crgU0k6DAuMXsRB1kmhiK4p3jXNPaEl/cThpWKSlFPsdoYxL1gP98RMzhrfu5mBf1ZJg6UOnBppL+hluBYetH+oeRMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB9136.eurprd04.prod.outlook.com (2603:10a6:150:27::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Fri, 20 Jun
 2025 18:41:18 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Fri, 20 Jun 2025
 18:41:18 +0000
Date: Fri, 20 Jun 2025 14:41:12 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] i3c: master: Add inline i3c_master_readsl and
 i3c_master_writesl
Message-ID: <aFWrSHg2M1lq8kGt@lizhi-Precision-Tower-5810>
References: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
 <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250620-i3c-writesl-readsl-v1-1-e0aa1c014dff@analog.com>
X-ClientProxiedBy: BYAPR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:40::39) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB9136:EE_
X-MS-Office365-Filtering-Correlation-Id: c7c63b70-5d62-49e1-e5b1-08ddb02a0b78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eqnQDQKYQcNPtfmUgnbjwRHUv5W6U4ue0qOGr6TKAHP6CuaNL+vHjK1LH4c6?=
 =?us-ascii?Q?n/Fs934CutTO7BRPENK57J5yIcKyG4yCLvOza7vD8aC3LKX98yVC2TyQ9Zkj?=
 =?us-ascii?Q?uT4aTVq7aCmPHC2A5re7fFyYm4nDK+QUo4eDNqM5RFsS8hGUeWTwTgShM+Hg?=
 =?us-ascii?Q?nUAJeP0I9YsExCPrNKS/iKER3psmhEtbHG4+GOVMkss4LyPdzitPZNZcGsib?=
 =?us-ascii?Q?/AKxdjbfuSIR4aOrRLE331ElyyXOzo566PrgKcGajjcTQmxJRIzXdJf/42xS?=
 =?us-ascii?Q?fhUyDMVswryUs3hEmCwL/T5xUlwq85rzMuNQCdT+DR3Cw9w57BCoQHpNnB02?=
 =?us-ascii?Q?whVG/63SE4LFeT/kdiypNHiJ/Vtp09bEz545SgLr3Bck+IHkpsGed8i0QezC?=
 =?us-ascii?Q?YV38J8h3O3RaasTLjiuyLlB4UmPPTSb44PT2MtEQwG3mwJNXAvxtCQEtqo4H?=
 =?us-ascii?Q?c3J6qm/KCMbbgTopbLGSqyZXNS7yQ+yPCNjUxCbmuo6f4GwL788e4VF8LGap?=
 =?us-ascii?Q?j4Tz+EYg8vXyiKMjmlWvM3/rVznvPNLdVahlhshxdfRTLFlNxcvBxWC4xINO?=
 =?us-ascii?Q?jXGnwcWtlWPXil14Uprct/II9C6kzA7i5JnqqZLiVa2UdMZ/7hFH9zQqlCZW?=
 =?us-ascii?Q?LGGP0K5MT9GbCKT7ow2O4zBbvuUaAAZcmlurOHO/mQhIozN2UGUkN2FzDZ0E?=
 =?us-ascii?Q?tPq2asbjaxBju0z5DL85CWLDJtTqeRtoyJKRhWIfzeBMG2g91tVKuLHpSLNF?=
 =?us-ascii?Q?eZ5u3UUSZ6iLZC8GeQKUH+RxQ9TFmcRKt8Kd+r4XcewMRl3PmOCPDGgksCdH?=
 =?us-ascii?Q?Z1k92i7NKDzh794CLaxMlOi6p4amQ5RZ18vHYgUz8pomF3ciOwy4ulLobEhg?=
 =?us-ascii?Q?pSNpsBtRs8qj48T/8re1c3VkIhnr5FzO8QojDWaCSFIf/fkt55v1MgANu7kq?=
 =?us-ascii?Q?IJhVa28DWRlvWQhfUJJch1CWZwBkyiOYcJXzLamzoJD61vTijc5f45gS1usy?=
 =?us-ascii?Q?tLxcHNZ9ABdxvAnx9kYBdBtgZSrWYkQo8ViPPW4/MtfsnfE2zaT4tuUbdK5X?=
 =?us-ascii?Q?5j4UOiGRHMyH3ELBf6jriFkzn8JfZj2xH3rfmwiWGsJo0VFm5zUK565mjskh?=
 =?us-ascii?Q?rpBLtVtXgGCeBOMmgiTr9EtdHsMQoucA7OCphIXLfGfQVpGNd9h3wifMufgF?=
 =?us-ascii?Q?tqHzRxce9TQwaw7gn9zQHogpi3di+Sv1HufxIHz3tdrjYRJBNPy8lwfATcJg?=
 =?us-ascii?Q?NiQaECh8y9cwiywBY807UEVzU+LZVEaF+xTmH53NldmVkPp4EODPJ9uo+FFE?=
 =?us-ascii?Q?9eY3J9LYyN46P1FjkabiXckhw8+e6x8WfwBg4zjhYi+7OH8YAe+0DnF4TUxK?=
 =?us-ascii?Q?7jRRzfX3RGnFAE2OdccvsiEJqWK2MAFref0a1V70pZpM6zITfOlxU74JdFOI?=
 =?us-ascii?Q?NffyBW3V0LnSgSSs+MXRXx1g87eoBPQTAd6QA8Ot4V/skgNMaD2MUw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dj10hFjOR2fqMw7cPN20/O7GmJtjfS0iEl/BSO4V1cjZoV51+qV1OfKYsJru?=
 =?us-ascii?Q?N/hjTmw/R89YH/ddGasWMv81qhEampCBjH3b/RyS60IcVgtl2/CHH7weoq5K?=
 =?us-ascii?Q?II8JPNHUXxDpsLvZv+/nJf6DYyIZU+TQQE7Ih9P3ArCxfBh6M+thIXMRq8Gk?=
 =?us-ascii?Q?FS3YoVU9iEaLEvbJmtouUbyJVumpVnklmNnX4u+FQSL+/biBD/zxDw1Jc1HY?=
 =?us-ascii?Q?0FMgfTPv1gPwTCH+PgB75A9jvKRSQF8L/2hh5ZEDx9VpLx3KxYCODZghUolm?=
 =?us-ascii?Q?Mf15t2O5Y00E4EbKrmy6PLRPwLu+9yyecVJu4LPKlIKTBK5p6a6E8gpAQjHQ?=
 =?us-ascii?Q?u4FueGuQShJJVFMroqEf8oVg42qx4Eg6Z+Eeh1sL5NJSqlc/6j4f4NLM8hBB?=
 =?us-ascii?Q?bP+QdA7p+hoCXfBlyZiYCukFTef0pIxwihvu0AyJnp9e9xURMHpDwmyEI5pg?=
 =?us-ascii?Q?7I/orqf8vUlul1CAZmNMOQNqkhai5YFnxIPxGJmPpNFlXk7Ax4Z/9AkhAgci?=
 =?us-ascii?Q?zP3IaMyTXXgAY82F7+Fw325OhCiT91aeSnjoFP5z5Ljeu0tg4hwulYKJdsVN?=
 =?us-ascii?Q?eRtPCi28Qk8dT4AgSCcjWd4foEo0f9vhUjXT8qJA/0IPKn9MDC1rQtkhfbQo?=
 =?us-ascii?Q?LSNM90U46Aau1CV1IYaY6/Ejyhw8pKlCFl0OkeZmCmQIkQfXHfj/ACo6bmhI?=
 =?us-ascii?Q?32bNJu4LhWTggZp4QuUof8GP2LJHF9DcS2cV6ExTMauRHlRm0ZynPziB9QNB?=
 =?us-ascii?Q?aARgYjKvEaQ5TzkTnQ4iNLqSnIdWEXo1O111teo1Z03lJWWyu4M0IiG7lSMO?=
 =?us-ascii?Q?440JI3mIFtIHPVYzoVrGhHS0jzQLPh0hIbZxGkAKUqdkuqUKw9PS5sJnjhs3?=
 =?us-ascii?Q?GW4O/i24MQpg8RNwnx5PUu+2Fx2U7DnyzKAdHF7WfeGx1BC4WgvYmQZtqVAF?=
 =?us-ascii?Q?5qypbqHGGUBeA6r14S9hivfd6ytJS/Khg+LvNUnfYbVYZxlTHJNZovlNS4Fv?=
 =?us-ascii?Q?CvyzPrS3lg30fZ7T+1AaTyzfWu/UQmtICtK3KmrSJjtSlKDRQRccIqVBWY7M?=
 =?us-ascii?Q?tB9+/EKMqAoufcXIrS/YW7wkrLsjIhXh1QklcUNeJzYlXGSmEEVw4ejjZLYG?=
 =?us-ascii?Q?cKl1sNR9/gyqI54z3u3yXi3+aqNJOnDRCAzmLL8r62a4aEqLOePD1qRML8fH?=
 =?us-ascii?Q?ZYA/WvKx6vysX5s5ztdFP9iqH31bgse+yMlFSlBS/uep/cHIfbK96X1Am1P5?=
 =?us-ascii?Q?yAQ7G93IG0MhwyYqnARqbbB7oyJ8gwrq52VgUWKBLOdMhPlXSoGikWWHjcpY?=
 =?us-ascii?Q?WR0RHnNNHdz3s2cm+NGeUnu7dMC/GzniEqIkFA59wwLWVK3klgR9Oi8u63tm?=
 =?us-ascii?Q?/7vpbDuW9KyLjE/0aUrqGPceB0Ouu+F4GcmfDy40950e8G/1gQZIHNmfQ2dd?=
 =?us-ascii?Q?r1DsShGK8PqvNHWWbvuc1E5BKrIWdYsrGQa7Kg+oY5nU7x+CjNAz4mrUB0zz?=
 =?us-ascii?Q?L1MaqaAOenkt0f3Grw1P8W03RWlzKImXCiuRDmrWUmcjE1NOeO0/o+LwbGDD?=
 =?us-ascii?Q?lY2N6uhn5SBTfDd5fpc=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7c63b70-5d62-49e1-e5b1-08ddb02a0b78
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 18:41:18.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCtmtnofYkAo8Dl0ax+sLbdoox7q+e66z8yVvhjuv/wZFQoZ3N6MjBDIIiJCXvgPC3Wa9GqfbZ3di212MlQF7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9136

On Fri, Jun 20, 2025 at 06:54:59PM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  include/linux/i3c/master.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>
> diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
> index c67922ece617d6320c0c7e4838c2e7edda8c19f5..11401f2acb42e4d3a60df33b7c794d8a0360cdc2 100644
> --- a/include/linux/i3c/master.h
> +++ b/include/linux/i3c/master.h

suggest move to drivers/i3c/internals.h becaue only master drivers use it.

> @@ -674,6 +674,42 @@ i3c_master_get_bus(struct i3c_master_controller *master)
>  	return &master->bus;
>  }
>
> +/**
> + * i3c_master_writesl- Write bytes to long memory region from byte array
> + * @addr: Register to write to
> + * @bytes: Pointer to the data bytes to write
> + * @nbytes: Number of bytes to write
> + */
> +static inline void i3c_master_writesl(void __iomem *addr, const u8 *bytes,
> +				      int nbytes)

const void *bytes

> +{
> +writesl(addr, bytes, nbytes / 4);

fix indention

Frank

> +	if (nbytes & 3) {
> +		u32 tmp = 0;
> +
> +		memcpy(&tmp, bytes + (nbytes & ~3), nbytes & 3);
> +		writel(tmp, addr);
> +	}
> +}
> +
> +/**
> + * i3c_master_readsl - Read bytes from long memory region to byte array
> + * @addr: Register to read from
> + * @bytes: Pointer to the buffer to store read bytes
> + * @nbytes: Number of bytes to read
> + */
> +static inline void i3c_master_readsl(const void __iomem *addr, u8 *bytes,
> +				     int nbytes)
> +{
> +readsl(addr, bytes, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		tmp = readl(addr);
> +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}
> +
>  struct i3c_generic_ibi_pool;
>
>  struct i3c_generic_ibi_pool *
>
> --
> 2.49.0
>
>
