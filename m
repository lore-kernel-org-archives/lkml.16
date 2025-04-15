Received: from mail-m3274.qiye.163.com (mail-m3274.qiye.163.com [220.197.32.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B1D14B945
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708883; cv=none; b=iVKRPHNAaqzT+xjiiPKpdPQepXDi2u+mEBgBa8ggskZm66LebyMxh/cw2xX9A5jz+Ai8NKQCbEoqO4QTntC6QU82TJHvwxmqqP5iYrGnLYp4Ipr9TrpZ8E0PXzkS8JJs9y1HvdpSeOAicKphTm8JGHPHCWtZmYdha6E1kDtLfmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708883; c=relaxed/simple;
	bh=xaYS/ny1ssrKGT83SQ6r2ZY5Mse7fdt3O8+TCun9qJI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOrLx8HecwiAdz0ZEom5HbXQifCRIYSK7S+Y/oN4MK3BMT8a9ujvGcZQkUOcnJRoT26Bcg1ltr0rk5s+9z1ayapePq2XVay/RRjirTSPhQ/olHv9G3aL7nIBCRbbUOuwCwx2Dc25LgNAEUWL8OW/eLq3nDj27fkCRryWjDBto34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=aN7IwJwS; arc=none smtp.client-ip=220.197.32.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="aN7IwJwS"
Received: from [192.168.60.65] (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11f0ba4a1;
	Tue, 15 Apr 2025 17:21:09 +0800 (GMT+08:00)
Message-ID: <9e2b5033-b09b-4264-a9d6-f5354292be64@rock-chips.com>
Date: Tue, 15 Apr 2025 17:21:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] nvmem: rockchip-otp: Add support for rk3568-otp
To: Jonas Karlman <jonas@kwiboo.se>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 Finley Xiao <finley.xiao@rock-chips.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20250227110804.2342976-1-kever.yang@rock-chips.com>
 <20250227110804.2342976-2-kever.yang@rock-chips.com>
 <8c697031-9978-40cd-a1e0-f40552db9107@kwiboo.se>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <8c697031-9978-40cd-a1e0-f40552db9107@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQktMVk4aTE1CTBkaGkhMTlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9638c09dc003afkunm11f0ba4a1
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6ODI6Lhw4TzJLLBgXOEoPTwML
	MU4aChBVSlVKTE9PTEtDQ0xKS01JVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUJNSEo3Bg++
DKIM-Signature:a=rsa-sha256;
	b=aN7IwJwSJ62qLkfuHxNsKpcehfAkHojBLvWL5iItJ9OXLJDA54xozFm6USSxFPM4ZGtRh/gXUksV0Ui2Qk42PvRGqpA8W6ST8kqqWW2bTIh1Lq0o92dg2MC5JphlVAFpkuMM0n1UHvJVbmhN7dZRNhfWGZSvgPJSzmSnstY78mc=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dIHeTD8Kwvo6z8MEqZL3742x9P8G+OUFPUsU1G6dCK8=;
	h=date:mime-version:subject:message-id:from;

Hi Jonas,

On 2025/3/17 05:52, Jonas Karlman wrote:
> Hi Kever,
>
> On 2025-02-27 12:08, Kever Yang wrote:
>> From: Finley Xiao <finley.xiao@rock-chips.com>
>>
>> This adds the necessary data for handling efuse on the rk3568.
>>
>> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>
>> Changes in v2: None
>>
>>   drivers/nvmem/rockchip-otp.c | 82 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 82 insertions(+)
>>
>> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
>> index ebc3f0b24166..a04bce89ecc8 100644
>> --- a/drivers/nvmem/rockchip-otp.c
>> +++ b/drivers/nvmem/rockchip-otp.c
>> @@ -27,6 +27,7 @@
>>   #define OTPC_USER_CTRL			0x0100
>>   #define OTPC_USER_ADDR			0x0104
>>   #define OTPC_USER_ENABLE		0x0108
>> +#define OTPC_USER_QP			0x0120
>>   #define OTPC_USER_Q			0x0124
>>   #define OTPC_INT_STATUS			0x0304
>>   #define OTPC_SBPI_CMD0_OFFSET		0x1000
>> @@ -53,6 +54,8 @@
>>   #define SBPI_ENABLE_MASK		GENMASK(16, 16)
>>   
>>   #define OTPC_TIMEOUT			10000
>> +#define OTPC_TIMEOUT_PROG		100000
> This is not used anywhere in this patch, please drop it.
>
>> +#define RK3568_NBYTES			2
>>   
>>   /* RK3588 Register */
>>   #define RK3588_OTPC_AUTO_CTRL		0x04
>> @@ -184,6 +187,70 @@ static int px30_otp_read(void *context, unsigned int offset,
>>   	return ret;
>>   }
>>   
>> +static int rk3568_otp_read(void *context, unsigned int offset, void *val,
>> +			   size_t bytes)
>> +{
>> +	struct rockchip_otp *otp = context;
>> +	unsigned int addr_start, addr_end, addr_offset, addr_len;
>> +	unsigned int otp_qp;
>> +	u32 out_value;
>> +	u8 *buf;
>> +	int ret = 0, i = 0;
>> +
>> +	addr_start = rounddown(offset, RK3568_NBYTES) / RK3568_NBYTES;
>> +	addr_end = roundup(offset + bytes, RK3568_NBYTES) / RK3568_NBYTES;
>> +	addr_offset = offset % RK3568_NBYTES;
>> +	addr_len = addr_end - addr_start;
>> +
>> +	buf = kzalloc(array3_size(addr_len, RK3568_NBYTES, sizeof(*buf)),
>> +		      GFP_KERNEL);
>> +	if (!buf)
>> +		return -ENOMEM;
>> +
>> +	ret = rockchip_otp_reset(otp);
>> +	if (ret) {
>> +		dev_err(otp->dev, "failed to reset otp phy\n");
>> +		return ret;
> This is leaking the kzalloc memory above.
>
>> +	}
>> +
>> +	ret = rockchip_otp_ecc_enable(otp, true);
>> +	if (ret < 0) {
>> +		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
>> +		return ret;
> Same here.
>
>> +	}
>> +
>> +	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
>> +	udelay(5);
>> +	while (addr_len--) {
>> +		writel(addr_start++ | OTPC_USER_ADDR_MASK,
>> +		       otp->base + OTPC_USER_ADDR);
>> +		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
>> +		       otp->base + OTPC_USER_ENABLE);
>> +		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS, OTPC_USER_DONE);
>> +		if (ret < 0) {
>> +			dev_err(otp->dev, "timeout during read setup\n");
>> +			goto read_end;
>> +		}
>> +		otp_qp = readl(otp->base + OTPC_USER_QP);
>> +		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
>> +			ret = -EIO;
>> +			dev_err(otp->dev, "ecc check error during read setup\n");
>> +			goto read_end;
>> +		}
>> +		out_value = readl(otp->base + OTPC_USER_Q);
>> +		memcpy(&buf[i], &out_value, RK3568_NBYTES);
>> +		i += RK3568_NBYTES;
>> +	}
>> +
>> +	memcpy(val, buf + addr_offset, bytes);
>> +
>> +read_end:
>> +	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
>> +	kfree(buf);
>> +
>> +	return ret;
>> +}
> This can be simplified if this is rebased on top of "nvmem: rockchip-otp:
> Handle internal word_size in main reg_read op" [1].
>
> [1] https://lore.kernel.org/r/20250316191900.1858944-1-jonas@kwiboo.se
This look good to me, I will do it.
>
> Something like following could be squashed in with this:
>
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index ea48d51bc2ff..0991a4047bec 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -54,8 +54,6 @@
>   #define SBPI_ENABLE_MASK		GENMASK(16, 16)
>   
>   #define OTPC_TIMEOUT			10000
> -#define OTPC_TIMEOUT_PROG		100000
> -#define RK3568_NBYTES			2
>   
>   /* RK3588 Register */
>   #define RK3588_OTPC_AUTO_CTRL		0x04
> @@ -188,24 +186,12 @@ static int px30_otp_read(void *context, unsigned int offset,
>   }
>   
>   static int rk3568_otp_read(void *context, unsigned int offset, void *val,
> -			   size_t bytes)
> +			   size_t count)
>   {
>   	struct rockchip_otp *otp = context;
> -	unsigned int addr_start, addr_end, addr_offset, addr_len;
> -	unsigned int otp_qp;
> -	u32 out_value;
> -	u8 *buf;
> -	int ret = 0, i = 0;
> -
> -	addr_start = rounddown(offset, RK3568_NBYTES) / RK3568_NBYTES;
> -	addr_end = roundup(offset + bytes, RK3568_NBYTES) / RK3568_NBYTES;
> -	addr_offset = offset % RK3568_NBYTES;
> -	addr_len = addr_end - addr_start;
> -
> -	buf = kzalloc(array3_size(addr_len, RK3568_NBYTES, sizeof(*buf)),
> -		      GFP_KERNEL);
> -	if (!buf)
> -		return -ENOMEM;
> +	u16 *buf = val;
> +	u32 otp_qp;
> +	int ret;
>   
>   	ret = rockchip_otp_reset(otp);
>   	if (ret) {
> @@ -214,39 +200,39 @@ static int rk3568_otp_read(void *context, unsigned int offset, void *val,
>   	}
>   
>   	ret = rockchip_otp_ecc_enable(otp, true);
> -	if (ret < 0) {
> +	if (ret) {
>   		dev_err(otp->dev, "rockchip_otp_ecc_enable err\n");
>   		return ret;
>   	}
>   
>   	writel(OTPC_USE_USER | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
>   	udelay(5);
> -	while (addr_len--) {
> -		writel(addr_start++ | OTPC_USER_ADDR_MASK,
> +
> +	while (count--) {
> +		writel(offset++ | OTPC_USER_ADDR_MASK,
>   		       otp->base + OTPC_USER_ADDR);
>   		writel(OTPC_USER_FSM_ENABLE | OTPC_USER_FSM_ENABLE_MASK,
>   		       otp->base + OTPC_USER_ENABLE);
> -		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS, OTPC_USER_DONE);
> -		if (ret < 0) {
> +
> +		ret = rockchip_otp_wait_status(otp, OTPC_INT_STATUS,
> +					       OTPC_USER_DONE);
> +		if (ret) {
>   			dev_err(otp->dev, "timeout during read setup\n");
>   			goto read_end;
>   		}
> +
>   		otp_qp = readl(otp->base + OTPC_USER_QP);
>   		if (((otp_qp & 0xc0) == 0xc0) || (otp_qp & 0x20)) {
>   			ret = -EIO;
>   			dev_err(otp->dev, "ecc check error during read setup\n");
>   			goto read_end;
>   		}
> -		out_value = readl(otp->base + OTPC_USER_Q);
> -		memcpy(&buf[i], &out_value, RK3568_NBYTES);
> -		i += RK3568_NBYTES;
> -	}
>   
> -	memcpy(val, buf + addr_offset, bytes);
> +		*buf++ = readl(otp->base + OTPC_USER_Q);
> +	}
>   
>   read_end:
>   	writel(0x0 | OTPC_USE_USER_MASK, otp->base + OTPC_USER_CTRL);
> -	kfree(buf);
>   
>   	return ret;
>   }
>
>> +
>>   static int rk3588_otp_read(void *context, unsigned int offset,
>>   			   void *val, size_t bytes)
>>   {
>> @@ -274,6 +341,17 @@ static const struct rockchip_data px30_data = {
>>   	.reg_read = px30_otp_read,
>>   };
>>   
>> +static const char * const rk3568_otp_clocks[] = {
>> +	"usr", "sbpi", "apb_pclk", "phy",
> Why do we change from using the "otp"-name for the main clock?
>
> I suggest we keep the main clock named "otp" instead of "usr" for
> consistency.

The name is from the hardware design, it follows the hardware naming by 
default.

To be honest the driver does not care the clock/reset naming and the 
sequence at all,

and the clock/reset name and number are keep changing due to the 
controller IP

may come from different vendor or process change.

I can rename the "usr" to "otp" to make it looks better, and also 
reorder it so like it

look like rk3588.


Thanks,
- Kever
>> +};
>> +
>> +static const struct rockchip_data rk3568_data = {
>> +	.size = 0x80,
> If this is rebased on top of [1] you should also add:
>
> 	.word_size = sizeof(u16),
>
> Above suggested changes can also be found in a FIXUP commit at my
> linux-rockchip tree of pending RK3528 patches [2].
>
> [2] https://github.com/Kwiboo/linux-rockchip/commits/next-20250314-rk3528/
>
> Regards,
> Jonas
>
>> +	.clks = rk3568_otp_clocks,
>> +	.num_clks = ARRAY_SIZE(rk3568_otp_clocks),
>> +	.reg_read = rk3568_otp_read,
>> +};
>> +
>>   static const char * const rk3588_otp_clocks[] = {
>>   	"otp", "apb_pclk", "phy", "arb",
>>   };
>> @@ -294,6 +372,10 @@ static const struct of_device_id rockchip_otp_match[] = {
>>   		.compatible = "rockchip,rk3308-otp",
>>   		.data = &px30_data,
>>   	},
>> +	{
>> +		.compatible = "rockchip,rk3568-otp",
>> +		.data = &rk3568_data,
>> +	},
>>   	{
>>   		.compatible = "rockchip,rk3588-otp",
>>   		.data = &rk3588_data,
>
