Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB5D42065
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748322; cv=none; b=p0PWFn2w+8vp+CkKMACu8dotTX9qDBT45LlfnayXBVrSJ974UQtvXS25FAR+DkypM5e+T53MO6UbO3IvsGy17zUmXGr6hj2LzaF0ovg4UvmmRRKL4QaVgbZekGYLbkUAbkjGGDUCVBlDqoDJkHNGwuR3l4HxARF+g8QVsFK4ASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748322; c=relaxed/simple;
	bh=5NFJWL8elR69ius4IY4VKebKUQrDucxI3Pdog9iOITg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyDEb6zWSP6qWKjc5DdiksB6NpEO5oWkvNfHYTU9MJ0KkBqgwsQRco1cUreO0GUVTB3VXA0em/jhyx14saracqwYSEJnYTTgV3g7BhDMXUQEODbAJm9J1tPq8zXZBnrMRKQExsPRRZpb8WUPj7JZa0KOL5AK7xq0jwhBFvrHIsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=k6liGdmd; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="k6liGdmd"
Message-ID: <14ead790-9ad2-4f57-b116-b994343a1dce@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750748314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IKI5/MOk7JGcErI274Eq5dNQsujTc+eRoCB9W5qx9Eo=;
	b=k6liGdmdrM43wz5Sw7cTud98t9UQFbcDP4CnMpzMyhH0i2Rx6EBnyHcVavqOHW4gUIJn6+
	0OWODkcLlMJGI/vosO/7PZpTpuTpyD8Z8nxAtz5lz9bvhC/ppwc1Hop4fdDzFrVxlikGiU
	G8HjbyN9r9zLcHy2vfowNEDpY2MFMUI=
Date: Mon, 23 Jun 2025 23:58:24 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v6 03/23] RISC-V: Add defines for the SBI message proxy
 extension
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
References: <20250618121358.503781-1-apatel@ventanamicro.com>
 <20250618121358.503781-4-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250618121358.503781-4-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/18/25 5:13 AM, Anup Patel wrote:
> Add defines for the new SBI message proxy extension which is part
> of the SBI v3.0 specification.
>
> Co-developed-by: Rahul Pathak <rpathak@ventanamicro.com>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/sbi.h | 63 ++++++++++++++++++++++++++++++++++++
>   include/linux/wordpart.h     |  8 +++++
>   2 files changed, 71 insertions(+)
>
> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> index 341e74238aa0..59a7285ff956 100644
> --- a/arch/riscv/include/asm/sbi.h
> +++ b/arch/riscv/include/asm/sbi.h
> @@ -10,6 +10,7 @@
>   #include <linux/types.h>
>   #include <linux/cpumask.h>
>   #include <linux/jump_label.h>
> +#include <linux/wordpart.h>
>   
>   #ifdef CONFIG_RISCV_SBI
>   enum sbi_ext_id {
> @@ -36,6 +37,7 @@ enum sbi_ext_id {
>   	SBI_EXT_STA = 0x535441,
>   	SBI_EXT_NACL = 0x4E41434C,
>   	SBI_EXT_FWFT = 0x46574654,
> +	SBI_EXT_MPXY = 0x4D505859,
>   
>   	/* Experimentals extensions must lie within this range */
>   	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
> @@ -430,6 +432,67 @@ enum sbi_fwft_feature_t {
>   
>   #define SBI_FWFT_SET_FLAG_LOCK			BIT(0)
>   
> +enum sbi_ext_mpxy_fid {
> +	SBI_EXT_MPXY_GET_SHMEM_SIZE,
> +	SBI_EXT_MPXY_SET_SHMEM,
> +	SBI_EXT_MPXY_GET_CHANNEL_IDS,
> +	SBI_EXT_MPXY_READ_ATTRS,
> +	SBI_EXT_MPXY_WRITE_ATTRS,
> +	SBI_EXT_MPXY_SEND_MSG_WITH_RESP,
> +	SBI_EXT_MPXY_SEND_MSG_WITHOUT_RESP,
> +	SBI_EXT_MPXY_GET_NOTIFICATION_EVENTS
> +};
> +
> +enum sbi_mpxy_attribute_id {
> +	/* Standard channel attributes managed by MPXY framework */
> +	SBI_MPXY_ATTR_MSG_PROT_ID		= 0x00000000,
> +	SBI_MPXY_ATTR_MSG_PROT_VER		= 0x00000001,
> +	SBI_MPXY_ATTR_MSG_MAX_LEN		= 0x00000002,
> +	SBI_MPXY_ATTR_MSG_SEND_TIMEOUT		= 0x00000003,
> +	SBI_MPXY_ATTR_MSG_COMPLETION_TIMEOUT	= 0x00000004,
> +	SBI_MPXY_ATTR_CHANNEL_CAPABILITY	= 0x00000005,
> +	SBI_MPXY_ATTR_SSE_EVENT_ID		= 0x00000006,
> +	SBI_MPXY_ATTR_MSI_CONTROL		= 0x00000007,
> +	SBI_MPXY_ATTR_MSI_ADDR_LO		= 0x00000008,
> +	SBI_MPXY_ATTR_MSI_ADDR_HI		= 0x00000009,
> +	SBI_MPXY_ATTR_MSI_DATA			= 0x0000000A,
> +	SBI_MPXY_ATTR_EVENTS_STATE_CONTROL	= 0x0000000B,
> +	SBI_MPXY_ATTR_STD_ATTR_MAX_IDX,
> +	/*
> +	 * Message protocol specific attributes, managed by
> +	 * the message protocol specification.
> +	 */
> +	SBI_MPXY_ATTR_MSGPROTO_ATTR_START	= 0x80000000,
> +	SBI_MPXY_ATTR_MSGPROTO_ATTR_END		= 0xffffffff
> +};
> +
> +/* Possible values of MSG_PROT_ID attribute */
> +enum sbi_mpxy_msgproto_id {
> +	SBI_MPXY_MSGPROTO_RPMI_ID = 0x0
> +};
> +
> +/* RPMI message protocol specific MPXY attributes */
> +enum sbi_mpxy_rpmi_attribute_id {
> +	SBI_MPXY_RPMI_ATTR_SERVICEGROUP_ID = SBI_MPXY_ATTR_MSGPROTO_ATTR_START,
> +	SBReviewed-by: Atish Patra <atishp@rivosinc.com>I_MPXY_RPMI_ATTR_SERVICEGROUP_VERSION,
> +	SBI_MPXY_RPMI_ATTR_IMPL_ID,
> +	SBI_MPXY_RPMI_ATTR_IMPL_VERSION,
> +	SBI_MPXY_RPMI_ATTR_MAX_ID
> +};
> +
> +/* Encoding of MSG_PROT_VER attribute */
> +#define SBI_MPXY_MSG_PROT_VER_MAJOR(__ver)	upper_16_bits(__ver)
> +#define SBI_MPXY_MSG_PROT_VER_MINOR(__ver)	lower_16_bits(__ver)
> +#define SBI_MPXY_MSG_PROT_MKVER(__maj, __min)	make_u32_from_two_u16(__maj, __min)
> +
> +/* Capabilities available through CHANNEL_CAPABILITY attribute */
> +#define SBI_MPXY_CHAN_CAP_MSI			BIT(0)
> +#define SBI_MPXY_CHAN_CAP_SSE			BIT(1)
> +#define SBI_MPXY_CHAN_CAP_EVENTS_STATE		BIT(2)
> +#define SBI_MPXY_CHAN_CAP_SEND_WITH_RESP	BIT(3)
> +#define SBI_MPXY_CHAN_CAP_SEND_WITHOUT_RESP	BIT(4)
> +#define SBI_MPXY_CHAN_CAP_GET_NOTIFICATIONS	BIT(5)
> +
>   /* SBI spec version fields */
>   #define SBI_SPEC_VERSION_DEFAULT	0x1
>   #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
> diff --git a/include/linux/wordpart.h b/include/linux/wordpart.h
> index 5a7b97bb7c95..ed8717730037 100644
> --- a/include/linux/wordpart.h
> +++ b/include/linux/wordpart.h
> @@ -31,6 +31,14 @@
>    */
>   #define lower_16_bits(n) ((u16)((n) & 0xffff))
>   
> +/**
> + * make_u32_from_two_u16 - return u32 number by combining
> + * two u16 numbers.
> + * @hi: upper 16 bit number
> + * @lo: lower 16 bit number
> + */
> +#define make_u32_from_two_u16(hi, lo)	(((u32)(hi) << 16) | (u32)(lo))
> +
>   /**
>    * REPEAT_BYTE - repeat the value @x multiple times as an unsigned long value
>    * @x: value to repeat
LGTM.
Reviewed-by: Atish Patra <atishp@rivosinc.com>
