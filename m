Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011006.outbound.protection.outlook.com [40.107.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAFE275872
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750693412; cv=fail; b=CGYEfS+jtbtW5iWvl0fYQP5NiY7HqCueYzynoZ9BZh6TfrR56wfCPUS7e7jFQIg+58l2yhQyWoV6R2PGCThigTGD/h7Ut9AnfrxbOKCn05xPVHaQMVaS5UrqOIubrC32vVMyMEYnEKW6vUdo9/Tj7HlxGjqbHWp4Yy68hr7iTKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750693412; c=relaxed/simple;
	bh=zGNmTMVkEBZyU1fe4FiHNAD1QlKR2M+PnT2pp4yeetM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nSYBYfQlrStOm8xi5HaYZeBMiGJEs9XyjmUs8PhdP4dbGW5VaDksxisu8kmILRO1Md/T7P22G/VCGtlycGp9+9TKKSfkt0jjYb5LHpV60WCsEuXGs3mgmTq0PEkestHKHZq89mxqvkBL37KYybmLf1vg9ycJdJpkDpaFzuNiQkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WN+9D7ap; arc=fail smtp.client-ip=40.107.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WN+9D7ap"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aB5uOZELW+vZHfZcmh/phxb+2Par2qOUOzsYmqCst+TJIY3aOqYolnfTyXhAA0w+kjkePhMqWGiCMrUMMDoZvfX3usJdrBT0x6PJii86jtSxb6FO81yfLeFaTvx5LlFjyOx8u4evCWFL46y8iQZISFVlL4dSZbrkAgRaDgWeyy4J8gsmte8vxTtkcb7WuVGV7/6Hrdg7GqGgoEfau980H7D9N0ye3Pq53SAgs9DPw5boU83fZX+wJatd3cKv4LbY3482EpMv3FGug6cFdf7FEWvkLthJ1aTAd5SvxrvB5pG8MHVO1RGUOYiiSYHRLND1eDk60389yFENjOM2hIgBJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDi3gy8ov0ryNTq5oeNTHrtxjckQpI1i95nrdWU2Nv0=;
 b=PtZbXnqfexCFBn24IboqQZIvSRGuEv3DL6wrXO1KI1659AzZbjBfwTkuyoQithBSpJ90Htgouzl/BH4HYJ7DWmT86eCBwBeIfaz1d1Mp/wW4J+j5pr/6YMe+cBzqodgaQszBxbLBf2mAjVnZBXdCkkeyzubleL8dlhK+1D6ht/ZvD+yFoxJfPFOgrqwdWTatj+SN0jACD4h8NA+CaR3VON8gW4iVU0El4XgyrUFsazLKs/f+0ZIFF+37eZsMDcoYWnrem+PG+yNti234SrGIzlZIyXYAGISyJyFRlUtoJV6zy4+w+UaSw9B2LKV8hMF1/GQY4BrDYxwH/roQEe8l9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDi3gy8ov0ryNTq5oeNTHrtxjckQpI1i95nrdWU2Nv0=;
 b=WN+9D7aprEsV26/yH/549wwMQyStGT+4KLQlksR2wWIE4K2iaUfGpmiv64MZ6wkZBN7Q3ac3TeLxFlE8zI2agKeJMvhW401EscwR6g4EI4DA0ss0L4xXxC50pkK4vzZIykODU+S2T6ShzYSwmq7V8L26pvya/HeTyTP83OKQMuX721P4d2Ek6ViqijP8qCtPgodqEZOS5hm1qKK6aCe/ueO/0u2yG/Mu9X8206jE4WrggOtcZRwNS9SSyQYKA/BcWxB+fDL5wDye53O6gyet9NM6H8GjUu7aCzqm3UGIT5usunHhGB4hOFfrZoYN3ygcSUCld35eOtZI9lK2xjdfbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM0PR04MB6820.eurprd04.prod.outlook.com (2603:10a6:208:188::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 15:43:26 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%7]) with mapi id 15.20.8835.027; Mon, 23 Jun 2025
 15:43:26 +0000
Date: Mon, 23 Jun 2025 11:43:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] i3c: master: Add inline i3c_readl_fifo() and
 i3c_writel_fifo()
Message-ID: <aFl2F+AEa6S1iA/h@lizhi-Precision-Tower-5810>
References: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
 <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250622-i3c-writesl-readsl-v2-1-2afd34ec6306@analog.com>
X-ClientProxiedBy: BYAPR07CA0086.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::27) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM0PR04MB6820:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c11df20-334b-45ca-bd6e-08ddb26cb190
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+pvrORJJqMHqdD9NqNgRQAOg7VSUY6YkrF+7gT4dw1FIEiL7CUEf3OgnBo8d?=
 =?us-ascii?Q?Zae91EXKdzFvbiKs5+BJZQPjhG3Jdm18DYGoR5vDIwoVcHZjJGzfcpVpilaf?=
 =?us-ascii?Q?9HsMcyOJWMV816oZJ4hrlGNJL6gsIuq6XXpPfrdWUdf1D4v1vbGZQUOb6PtL?=
 =?us-ascii?Q?/6oeo5531qZXthzrq0pO1PyVKhEpTxXMcMRtvoi9JEmaXb+3AU3PuOBgI4Iy?=
 =?us-ascii?Q?KM38V9FLz7L27oz4DHLH0+fxRV1+89YdQi4XxNC0evVbSbiQNj45E+BQ2BOE?=
 =?us-ascii?Q?TYNMadDy+Z1VbJTUkB6bzl6AsuNSX8RL/DppY9fzY6jj0grqHmGqjJj+Cjj0?=
 =?us-ascii?Q?QYI7qMlQ98eqrxP7EqqIH/ptRoR8QM93WYQa+JjGe5c63AdxN1abIT0uKnvv?=
 =?us-ascii?Q?Kk+CaDWS4efPz1BSCbBcFI/rimNjthMA4HulvY/j8Iry+pVKE718dTI7WHQt?=
 =?us-ascii?Q?zAJmXVTdkrurCcvVLEve3YwSPkIVpY5d+EgyaCqmBU+b2dhj++4R2OdEOgW+?=
 =?us-ascii?Q?WtllVENTrsnXGYqcymKNQjuI0qdrodj1/CtcXeXxG5BDSwjIof8jlVoYyH4v?=
 =?us-ascii?Q?RLGJ6YytvEOqgJJJw0ZW1uDNNswkn0FR0zdnF7WJqujiyrY7pwVXVxSRjkbh?=
 =?us-ascii?Q?JeSqfjm+DZDRuBrR5p8WpE+3GIK0jBBRcjApI6tv1Z573pSpzk6+60iOruYm?=
 =?us-ascii?Q?ePy0K5cBuZ1oBDoIsESKsrzuESs7jbC/s2yfTwA+0az9u94UUHS+Nvr1yF5c?=
 =?us-ascii?Q?1v9EQiHf/pYuVsafiaqj3xzW9JBAguRDUi/bDont6VgVimUgIE5PJUYYyUub?=
 =?us-ascii?Q?0ulz2HoA+qTysyehQx0RMDLFnqkNDHvtnjQoDObgzTYOZI1tgGLCTQl9T7kG?=
 =?us-ascii?Q?AQEp166+Fxp/fJn2Rh/fy0DKnzxoksnSKhz0d3A5P7YnC5cNQ9p0xcfQS0tX?=
 =?us-ascii?Q?y8E01/0I8zDCaDXKfFT6dCQ/cznz1tcZ9ZMvpWDIqWnXjot0xbpzycCmHWvL?=
 =?us-ascii?Q?sJiEj7VHLvom0k4TtLLDCAqfw7sfkhYFlmpLaS0ylqbBY7GriNhxCoGqPwT+?=
 =?us-ascii?Q?h7zXy1Zd3139kCYvTtvYFBSIY4zBqe0GsGqlPvvMh8+6dbEySN01K9beHR/U?=
 =?us-ascii?Q?PejP+LwYtNy0BWgRR3/aCb5WxxuE68UWF89PcwlTvgWVuO665LmBcxK8ZzFd?=
 =?us-ascii?Q?gqz4gpU995AUWq3RWDW8MrKV6+q2nfWBT8Zv9g5qDmHNBCduwj5VZHlP9emV?=
 =?us-ascii?Q?pvc5qZerLN80J8L22ZO4NIMUavxbRD0uaEoeDR65hFU3dFz3TCJPWFqO7B2l?=
 =?us-ascii?Q?mBzLQ6q9EcCZn/MxgRTjGLvQqfWDmjCxFQUUS0/7DSOM95okfO/SVYvXWVD5?=
 =?us-ascii?Q?2PBqbDCYxNXw+OuzH5eQA8XGi/W9ANqEzQkvTfBcwdlgLfcfF1KH98ZxS7bD?=
 =?us-ascii?Q?Mku4g3QNPANNNeVExoRx4QqXxf5TuQkH1aDIPKGQ8xIL0WeMRV5WvQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eIo/siPc6TDC3iapzIwIADvTduoWMIjy8O0SNZoO2w5O0XdTybTqkLpPhhRf?=
 =?us-ascii?Q?6kO+RPF7XPN0klBwjNNmP9qKF69J4CudEtri5hMwAsuMVm9+U/LrtaS+zSps?=
 =?us-ascii?Q?ZpeBHlu1YeY82n8w+nys3U6mcCynn+yXziQZjGJJkYsYn2A/2F9AKwqCedU/?=
 =?us-ascii?Q?zhfYQRfuYo/nyRxtHOrWgRSvKtfTuz2qrXnSUNY0KGBPY+tcaYPtQSJ9Evti?=
 =?us-ascii?Q?/F8IMuWplA7uhE1zThzi/UM75phv60pBH3ArFDUJWXe41sx/ggwkzkzbjDJ4?=
 =?us-ascii?Q?x15n4zTOayR9J2GsCYwmS4ocL7910wcV4GQcX2eqItJn+wnIYsvsLDowho1U?=
 =?us-ascii?Q?wOGsw4S14JD+ISPgZ+8GNGdqtk8DjL6Q3dZNTMnzQCac7rKc2EwJNlzVAD6O?=
 =?us-ascii?Q?4WqOcaJuX5ZdVRwUn51Vxm3XBp6UOJ0g0SXs8MSlH1CDlID43GffXnOHy8i8?=
 =?us-ascii?Q?+RTkr0ibYSys0HdCZqxEwWk5b3r87S2PHYG8NB+pjjd2yP+SxSjTLi8vJpQ7?=
 =?us-ascii?Q?3rdM69ni389CUKrK3y2dquaFPZCZtkV5u6O8oUttoevQZxeo0mi8/whoKVEI?=
 =?us-ascii?Q?kWwqJPIuJSPcq2hKx0zZQXuje1d6OQspsPy0QwAO3I96gG1+Z9eMNUSkMkRp?=
 =?us-ascii?Q?noV7MqbHbILN7iXQjRcFoyVRtPGcJ18CW8Vdy4kBxaRZH8gShXp3TYqw4RiL?=
 =?us-ascii?Q?zEoyG7qdM9dqznZXytRVYtfPPEBMMb6fNGtLc4emQnpbJ6GXQkPNISp/IBGI?=
 =?us-ascii?Q?L+fMDZOSzsC8LDJzfFpisqxvxENxWpdpKIPmxIF5ociahC2Q3991Te+DG7Qb?=
 =?us-ascii?Q?Jnvf4KhtONKvCnpVmULVkjNLhhJG71sr2qrJzTSI57/zPO79ty8il8EDQxYD?=
 =?us-ascii?Q?lMR5AKycI05aN3Nsw+OV1HnHSuKV4lLYY9OacHIXUx0nk5uwCikkYo/8OVpF?=
 =?us-ascii?Q?NSMGTWh+qieaHpiZ6/jE5sPZeBF9TYqveZU+u1jL75R/NkQtzB14+ILP+jtH?=
 =?us-ascii?Q?PB+iyvfcoY/G2rbu2t+mz8fde5A/FE+e3KqRMUV9w6Ptxidm+7NqH/KITWvB?=
 =?us-ascii?Q?frFVi+dd4FUky1ddzGXWQUKkrOpS4RwfXSz6ZMpkMvsyTbBMhWkMowjxph+b?=
 =?us-ascii?Q?8uPgyev0/z9HzNT0AFGPi+/pBHjJiHYc0pgkY1K4q4jbY5aQweOUHeJHz4/N?=
 =?us-ascii?Q?YJaOXj4+PYjJG1dbjVPqatNWwmRQH/G3aT6ZTL5JM4n4VrX7Y8QRGx3fFrpV?=
 =?us-ascii?Q?bTdDNolMefqUan7CBsUfiZraLEzdhO17/8URA+eI+F+RwIHfqcNKoSzEqfEp?=
 =?us-ascii?Q?i2ZV0I5j7xyVzwXGLN6JrTquvj3YWW9MRgKYUPU7dm/vq5ctUI401lOqWzQq?=
 =?us-ascii?Q?NJrMVNH5xi0nEcJIgrqz/z4c7ZN2G1qK4aR7m+P1MhZqnRQ5/e46fOKTdpda?=
 =?us-ascii?Q?H+S83RyOCcs8kohHZr6GV2d158rEiyZeJ/WeTrdW04gq0rjUOCa0aXfkGPVE?=
 =?us-ascii?Q?QYp7zgNIisEWhlCdVh/F4qRcDNORQ7dZ/Bqrj7lqsEvb6bCcyNv1OjmtNGRb?=
 =?us-ascii?Q?cfeRAirE3206Mc3T6zE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c11df20-334b-45ca-bd6e-08ddb26cb190
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 15:43:26.3043
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GeD6S5NeE7A25tW/M/RwF0d1u+OVnk9RZXSogQ6UFKYqq6m1M78JHxj7UorQuitvSDRdxfUPRMC+X8equgMOUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6820

On Sun, Jun 22, 2025 at 11:18:58AM +0200, Jorge Marques wrote:
> The i3c abstraction excepts u8 buffers, but some controllers have a bus
                      ^ expects?

> width of 32-bits and don't support flagging valid bytes, so it is
> required to read/write long words and to use memcpy on the remainder of
> the number of bytes by 32-bits to not write/read outside the buffer
> bounds.

The I3C abstraction expects u8 buffers, but some controllers operate with
a 32-bit bus width FIFO and cannot flag valid bytes individually. To avoid
reading or writing outside the buffer bounds, use 32-bit accesses where
possible and apply memcpy for any remaining bytes.

Frank
>
> Signed-off-by: Jorge Marques <jorge.marques@analog.com>
> ---
>  drivers/i3c/internals.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>
> diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> index 433f6088b7cec8c77288ee24dbee8b18338aa1eb..88887b12122efafac81bcfdd093d943259e13a08 100644
> --- a/drivers/i3c/internals.h
> +++ b/drivers/i3c/internals.h
> @@ -22,4 +22,41 @@ int i3c_dev_enable_ibi_locked(struct i3c_dev_desc *dev);
>  int i3c_dev_request_ibi_locked(struct i3c_dev_desc *dev,
>  			       const struct i3c_ibi_setup *req);
>  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev);
> +
> +/**
> + * i3c_master_writesl- Write bytes to long memory region from byte array

i3c_writel_fifo - Write data buffer to 32bit FIFO

> + * @addr: Register to write to

FIFO address

> + * @bytes: Pointer to the data bytes to write

bytes and nbytes is too similar, can you rename bytes to buf?

Check read_fifo also.

Frank
> + * @nbytes: Number of bytes to write
> + */
> +static inline void i3c_writel_fifo(void __iomem *addr, const void *bytes,
> +				   int nbytes)
> +{
> +	writesl(addr, bytes, nbytes / 4);
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
> +static inline void i3c_readl_fifo(const void __iomem *addr, void *bytes,
> +				  int nbytes)
> +{
> +	readsl(addr, bytes, nbytes / 4);
> +	if (nbytes & 3) {
> +		u32 tmp;
> +
> +		tmp = readl(addr);
> +		memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
> +	}
> +}
> +
>  #endif /* I3C_INTERNAL_H */
>
> --
> 2.49.0
>
>
