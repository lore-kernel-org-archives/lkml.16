Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F2A214209
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749253889; cv=none; b=Ml/4zqZJ7VStXnHGpZxK1utrJPe07DdQGfrCBQmIeMjpRiNB94QmLGS8qa4iDHZjH4ALmOtGpz8Svg83vO53q2Y3HBpM5E6uryissEq3fY0Xidg5haGBgxNFiB/tWep72H1ZdGLaqkk2l9PRQwBMf0oSa/HMbh1tVYnDjDSWyW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749253889; c=relaxed/simple;
	bh=siicW9U0m5/Z3Vack/Gsm10p7NL0Ap3tRq8a7D/ouwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3a0bYbbD5CwK30LCNyAX9/6tMdOqlxm+glOPhfkeeBwWQw2TPVZ7dul5AmetWJreHonbw7zARL5NenW8ikqjOH15CzHd8pvvPRF41+OimUfsHh4KWMaWw5fp1U97XuIseG/RjnmqNq13KHij6qw8IrfMB+pkeffiqsmbPWgn8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=rlmoatxG; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="rlmoatxG"
Message-ID: <53abb1fc-6236-4266-a6e7-25023e27e160@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749253883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/HbOR3EULs8XvSveJScVmCrHyMz65f+FWPAjqqZByU=;
	b=rlmoatxG+JMkL4LudZ4tc7daT4pNnwe5v8xYZa+Qyn4DVhMnaMRP3sWlgVDx+YIsuRQrOe
	7coND2Tv40rO/vqnsmgO8kY3u+6+M+0QmNwqwyHv1nB8cdTZCjEkvzsiqjKWFSruTO56IS
	dNRlqi/gQQR0b2pruhclZtRxs/ctqyA=
Date: Fri, 6 Jun 2025 16:51:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 01/23] riscv: Add new error codes defined by SBI v3.0
To: Anup Patel <apatel@ventanamicro.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Len Brown <lenb@kernel.org>,
 Sunil V L <sunilvl@ventanamicro.com>, Rahul Pathak
 <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Samuel Holland <samuel.holland@sifive.com>, Anup Patel
 <anup@brainfault.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
 <20250525084710.1665648-2-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250525084710.1665648-2-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 5/25/25 1:46 AM, Anup Patel wrote:
> The SBI v3.0 defines new error codes so add these new error codes
> to the asm/sbi.h for use by newer SBI extensions.

This patch can be dropped as it is part of the FWFT series with minor 
modifications in error mappings.

https://lore.kernel.org/linux-riscv/20250523101932.1594077-4-cleger@rivosinc.com/


> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/sbi.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 3d250824178b..4dd6aafb8468 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -419,6 +419,11 @@ enum sbi_ext_nacl_feature {
>   #define SBI_ERR_ALREADY_STARTED -7
>   #define SBI_ERR_ALREADY_STOPPED -8
>   #define SBI_ERR_NO_SHMEM	-9
> +#define SBI_ERR_INVALID_STATE	-10
> +#define SBI_ERR_BAD_RANGE	-11
> +#define SBI_ERR_TIMEOUT		-12
> +#define SBI_ERR_IO		-13
> +#define SBI_ERR_DENIED_LOCKED	-14
>   
>   extern unsigned long sbi_spec_version;
>   struct sbiret {
> @@ -503,11 +508,18 @@ static inline int sbi_err_map_linux_errno(int err)
>   	case SBI_SUCCESS:
>   		return 0;
>   	case SBI_ERR_DENIED:
> +	case SBI_ERR_DENIED_LOCKED:
>   		return -EPERM;
>   	case SBI_ERR_INVALID_PARAM:
> +	case SBI_ERR_INVALID_STATE:
> +	case SBI_ERR_BAD_RANGE:
>   		return -EINVAL;
>   	case SBI_ERR_INVALID_ADDRESS:
>   		return -EFAULT;
> +	case SBI_ERR_TIMEOUT:
> +		return -ETIMEDOUT;
> +	case SBI_ERR_IO:
> +		return -EIO;
>   	case SBI_ERR_NOT_SUPPORTED:
>   	case SBI_ERR_FAILURE:
>   	default:
