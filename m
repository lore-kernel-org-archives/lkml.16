Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D626C1DE3D6
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052749; cv=none; b=nB8RPPpljLKEcFwlHZkJ4MgujOmSf8UZUvskYmVkmxpvTyhh4svCgDe0raia1ddH2I2m1kr+92gr1cGW8xIoIHtMNXgpiDoU9QH1mr6o4x6bZtQU9PrIWeh1l+7nVX6vNpf1hqI/3qrfLRqAzg1ugEXSi6hmlj9Ex2PnV0NW0X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052749; c=relaxed/simple;
	bh=Olqlsi/dn7CGyfD/R62RM1zOogi1s3ET6AQNrdK5oHI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Um474vdAiFMSL+BGTCViaic4Aglx4L6SeZc20c1DtCd5f3qOszi5riSGeSBsq8M8JIQh4BP7ZpGly7z2tLop1chaExa08tRX9c4JFRYTUSZJZX+PMhBKXV3Jv14+0JPAorBxAgxNDdvLxscAUQkv01n3072wRDLS0yhBAz4OZr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=irIMxvfO; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="irIMxvfO"
Message-ID: <c962b740-4cbc-4d1f-9dda-02820dc54daa@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1746052733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZZpX1P9cVxiJcNSp3L/SE/Da+WLS+g2KXg93KHLKag=;
	b=irIMxvfObr5yBe6lg1g8+747zkOc/Zq+9dq9Jl2fjZbHgIvJ/T8WBl8aEcqnLxQLk7BPgE
	LTsxgq6hGZFgucMKtoncqpA4J5Bj7oljj0klpBRE4N/I5MhCVXW9dAcq6AAWAREhvGpi8v
	fp1wd4rUeaEuvl0FAWucYRtS+K0tdQk=
Date: Wed, 30 Apr 2025 23:38:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 1/5] amd-xgbe: reorganize the code of XPCS
 access
To: Raju Rangoju <Raju.Rangoju@amd.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shyam-sundar.S-k@amd.com
References: <20250428150235.2938110-1-Raju.Rangoju@amd.com>
 <20250428150235.2938110-2-Raju.Rangoju@amd.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250428150235.2938110-2-Raju.Rangoju@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 28/04/2025 16:02, Raju Rangoju wrote:
> The xgbe_{read/write}_mmd_regs_v* functions have common code which can
> be moved to helper functions. Add new helper functions to calculate the
> mmd_address for v1/v2 of xpcs access.
> 
> Signed-off-by: Raju Rangoju <Raju.Rangoju@amd.com>
> ---
> Changes since v1:
> - add the xgbe_ prefix to new functions
> 
>   drivers/net/ethernet/amd/xgbe/xgbe-dev.c | 63 ++++++++++--------------
>   1 file changed, 27 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> index b51a3666dddb..765f20b24722 100644
> --- a/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> +++ b/drivers/net/ethernet/amd/xgbe/xgbe-dev.c
> @@ -1041,18 +1041,17 @@ static int xgbe_set_gpio(struct xgbe_prv_data *pdata, unsigned int gpio)
>   	return 0;
>   }
>   
> -static int xgbe_read_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
> -				 int mmd_reg)
> +static unsigned int xgbe_get_mmd_address(struct xgbe_prv_data *pdata, int mmd_reg)
>   {
> -	unsigned long flags;
> -	unsigned int mmd_address, index, offset;
> -	int mmd_data;
> -
> -	if (mmd_reg & XGBE_ADDR_C45)
> -		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
> -	else
> -		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
> +	return (mmd_reg & XGBE_ADDR_C45) ?
> +		mmd_reg & ~XGBE_ADDR_C45 :
> +		(pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
> +}
>   
> +static void xgbe_get_pcs_index_and_offset(struct xgbe_prv_data *pdata,
> +					  unsigned int mmd_address,
> +					  unsigned int *index, unsigned int *offset)
> +{
>   	/* The PCS registers are accessed using mmio. The underlying
>   	 * management interface uses indirect addressing to access the MMD
>   	 * register sets. This requires accessing of the PCS register in two
> @@ -1063,8 +1062,20 @@ static int xgbe_read_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
>   	 * offset 1 bit and reading 16 bits of data.
>   	 */
>   	mmd_address <<= 1;
> -	index = mmd_address & ~pdata->xpcs_window_mask;
> -	offset = pdata->xpcs_window + (mmd_address & pdata->xpcs_window_mask);
> +	*index = mmd_address & ~pdata->xpcs_window_mask;
> +	*offset = pdata->xpcs_window + (mmd_address & pdata->xpcs_window_mask);
> +}
> +
> +static int xgbe_read_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
> +				 int mmd_reg)
> +{
> +	unsigned long flags;
> +	unsigned int mmd_address, index, offset;
> +	int mmd_data;

Please, follow reverse Xmass tree ordering

> +
> +	mmd_address = xgbe_get_mmd_address(pdata, mmd_reg);
> +
> +	xgbe_get_pcs_index_and_offset(pdata, mmd_address, &index, &offset);
>   
>   	spin_lock_irqsave(&pdata->xpcs_lock, flags);
>   	XPCS32_IOWRITE(pdata, pdata->xpcs_window_sel_reg, index);
> @@ -1080,23 +1091,9 @@ static void xgbe_write_mmd_regs_v2(struct xgbe_prv_data *pdata, int prtad,
>   	unsigned long flags;
>   	unsigned int mmd_address, index, offset;
>   
> -	if (mmd_reg & XGBE_ADDR_C45)
> -		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
> -	else
> -		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
> +	mmd_address = xgbe_get_mmd_address(pdata, mmd_reg);
>   
> -	/* The PCS registers are accessed using mmio. The underlying
> -	 * management interface uses indirect addressing to access the MMD
> -	 * register sets. This requires accessing of the PCS register in two
> -	 * phases, an address phase and a data phase.
> -	 *
> -	 * The mmio interface is based on 16-bit offsets and values. All
> -	 * register offsets must therefore be adjusted by left shifting the
> -	 * offset 1 bit and writing 16 bits of data.
> -	 */
> -	mmd_address <<= 1;
> -	index = mmd_address & ~pdata->xpcs_window_mask;
> -	offset = pdata->xpcs_window + (mmd_address & pdata->xpcs_window_mask);
> +	xgbe_get_pcs_index_and_offset(pdata, mmd_address, &index, &offset);
>   
>   	spin_lock_irqsave(&pdata->xpcs_lock, flags);
>   	XPCS32_IOWRITE(pdata, pdata->xpcs_window_sel_reg, index);
> @@ -1111,10 +1108,7 @@ static int xgbe_read_mmd_regs_v1(struct xgbe_prv_data *pdata, int prtad,
>   	unsigned int mmd_address;
>   	int mmd_data;
>   
> -	if (mmd_reg & XGBE_ADDR_C45)
> -		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
> -	else
> -		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
> +	mmd_address = xgbe_get_mmd_address(pdata, mmd_reg);
>   
>   	/* The PCS registers are accessed using mmio. The underlying APB3
>   	 * management interface uses indirect addressing to access the MMD
> @@ -1139,10 +1133,7 @@ static void xgbe_write_mmd_regs_v1(struct xgbe_prv_data *pdata, int prtad,
>   	unsigned int mmd_address;
>   	unsigned long flags;
>   
> -	if (mmd_reg & XGBE_ADDR_C45)
> -		mmd_address = mmd_reg & ~XGBE_ADDR_C45;
> -	else
> -		mmd_address = (pdata->mdio_mmd << 16) | (mmd_reg & 0xffff);
> +	mmd_address = xgbe_get_mmd_address(pdata, mmd_reg);
>   
>   	/* The PCS registers are accessed using mmio. The underlying APB3
>   	 * management interface uses indirect addressing to access the MMD

