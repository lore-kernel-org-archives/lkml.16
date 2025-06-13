Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4C279DD6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 23:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749856136; cv=none; b=WxkFjKod4nhnVkQUiosYo5QPrzPG6AYL5JF4k4zZpjsKZu6P21CM+JDsCVvIMBt3vFHy8LJLEk56Nja/T3SBGRu0V/fMOMIWUnPO09gm9Mh+ouBnr6UcQCejmm2csW6fRNIqPdzE5o20q58oQwQK72O40z8jVvX0xdty/Vrxnt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749856136; c=relaxed/simple;
	bh=r27H9F1hEUtupyvfgSfrvSGbuCAXF2LgasX0jrzicYc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oev5uVVKNSnRGXKCaSk0bxU7iOSAjAZKW+5KQqjKugjgwCMOrb+T+W2vgD6TNv+wPQsr/t4mdVybP4q8I8/JwZd4PjzxO87FH/y5wDtK0XT9BXjYyAOIfM5/N4j+wP+Rmib5coAze9A75/brcQCEbg1NCZ8F8Cp9CdqE+eFSfRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aQ1pcHAc; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aQ1pcHAc"
Message-ID: <d81310a9-13e8-47b4-8ad7-0f831b5aa9e8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749856132;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hJbziJaWkSfc7eJvEsy2hlaI0p2HI21DTada3PKoxUM=;
	b=aQ1pcHAcIgb+M7oyofZrcUYV81nmfElqYYBX1DAhtW9V54Yr88+Yhs7YcUiry1UklyWuqQ
	+taC5FOziFa5Nx4TfwAw/I3w2tfc4PTs/ZSHAv1Z99DqUH/W1Pr+uCbTjuMl9okwVnfz8V
	AP9OFxZRVrSK850RcsZtk0peexbIXTE=
Date: Fri, 13 Jun 2025 16:08:32 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 15/23] ACPI: scan: Update honor list for RPMI System
 MSI
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
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-16-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250611062238.636753-16-apatel@ventanamicro.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 6/10/25 11:22 PM, Anup Patel wrote:
> From: Sunil V L <sunilvl@ventanamicro.com>
>
> The RPMI System MSI interrupt controller (just like PLIC and APLIC)
> needs to probed prior to devices like GED which use interrupts provided
> by it. Also, it has dependency on the SBI MPXY mailbox device.
>
> Add HIDs of RPMI System MSI and SBI MPXY mailbox devices to the honor
> list so that those dependencies are handled.
>
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   drivers/acpi/scan.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index fb1fe9f3b1a3..54181b03b345 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -858,6 +858,8 @@ static const char * const acpi_honor_dep_ids[] = {
>   	"INTC10CF", /* IVSC (MTL) driver must be loaded to allow i2c access to camera sensors */
>   	"RSCV0001", /* RISC-V PLIC */
>   	"RSCV0002", /* RISC-V APLIC */
> +	"RSCV0005", /* RISC-V SBI MPXY MBOX */
> +	"RSCV0006", /* RISC-V RPMI SYSMSI */
>   	"PNP0C0F",  /* PCI Link Device */
>   	NULL
>   };
Reviewed-by: Atish Patra <atishp@rivosinc.com>
