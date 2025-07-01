Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05C641946AA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751384945; cv=none; b=HpkNgeaRb4PxtVwcGLyTLvU+BPbIYszHJl6Yph6g3pCGPUyLkjjZtVxaeW9Df0qU2JngANBasDSIz04Vu0Q8v4qpLACLlz022KjGtv11zNIDxdP0ArFHK6TsJWYzBOxwrEyCk629zseaBRrm+ANjV/XHEvReEZh4JDZYepLJ7dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751384945; c=relaxed/simple;
	bh=yfxBUhmxm461rC9xXB26tOVK7O/g0vIMPXA+7y8WubM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=npzckHg9mgrnmPHlr5nJceRO5E8jqxi/r/5lIva/j/rxiSOIa5TZFB5PVMCihjAuSK1o68X6okRbznMcYeq3yokFBOSLh1W4TyTqNWezF+0XihFZUFzEuSI+FU1YQ3eIIxYngkkGMse/6etFJj9TcqwU1dTyTvC1nCv8a1hgsZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9475B1595;
	Tue,  1 Jul 2025 08:48:46 -0700 (PDT)
Received: from [10.1.30.206] (e137867.arm.com [10.1.30.206])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C85D3F66E;
	Tue,  1 Jul 2025 08:48:59 -0700 (PDT)
Message-ID: <599c677a-ace0-41fe-b264-51de0fa7badf@arm.com>
Date: Tue, 1 Jul 2025 16:48:52 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mtd: rawnand: atmel: ECC error after update to kernel 6.6
To: Zixun LI <admin@hifiphile.com>
References: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 SoC support' <linux-arm-kernel@lists.infradead.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
Organization: Arm Ltd.
In-Reply-To: <CA+GyqebQnWQ3fj4Lrb4-hvzRpphuqw+jh4B9En1j2NDTNFumvQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I'm not really involved in this part of the kernel or drivers,
but I took some time to look into it. Hopefully I'm not completely
missing something !

On 30/06/2025 15:38, Zixun LI wrote:
> Hi,
>
> After updating our SAM9G25 device from kernel 3.16 to 6.6, we have
> encountered UBIFS failures with ECC errors
>
> [...]
>
> After some diagnostics, I used devmem2 to compare SMC and PMECC
> registers between the two kernels. All values match except for the
> PMECC_CLK register, which is 2 in kernel 3.16 [1] and 0 in kernel 6.6
> [2]. It appears the clock setting is missing since the kernel 4.14
> refactor.
>
> According to the SAM9G25 datasheet this field must be programmed with 2.
>
> Manually setting PMECC_CLK to 2 (devmem2 0xffffe010 w 2) resolves the
> nandtest issue.
>
> Is the clock setting moved to elsewhere after the refactor ?

As far as I can tell, the setting of the *PMECC_CLK* was lost in
f88fc122cc34 (mtd: nand: Cleanup/rework the atmel_nand driver),
which was merged for 4.12.

The register offset and values are  part of the defines it introduces
but are unused, so they might have been forgotten.
I couldn't find another place where this was done, and I think it would
make sense for it to be done here still.

The tricky part is that now the driver handles other PMECCs that do not have
this register at all in their datasheets :
  - SAMA5D2 series[3], page 713, 36.20 Register summary :
      0x80 (0x10 offset) is marked reserved,
  - SAMA5D4 series[4], page 512, Table 30-20 :
      0x080 (0x10 offset) is marked reserved,

So I think it's best not to add this write back for all cases.

I also checked, as some other SoCs' PMECCs are marked compatible with
the one used in your SAM9G25 (`atmel,at91sam9g45-pmecc`) :
  - SAM9x60 series[5], page 256, 21.6 Register Summary :
      0x10 offset has PMECC_CLK present, recommends setting to 2 at 133MHz,
  - SAM9x7 series[6], page 263, 21.6 Register Summary :
      0x10 offset has PMECC_CLK present, reccomends setting to 2 at 133MHz.

So it should be safe to write 2 to this register for all those matching
this /compatible/ string.

The datasheet itself is not clear as to what to do for other MCK frequencies,
though as 133MHz is the highest supported frequency and it worked before,
hopefully it just means a cycle or two of useless delay at worse,
but at least it keeps it simple.

I've written a small patch below that I think should fix the issue, but again
I don't know if that's upstreamable as-is.

> Best regards,
> Zixun LI
>
> [1] https://github.com/torvalds/linux/blob/19583ca584d6f574384e17fe7613dfaeadcdc4a6/drivers/mtd/nand/atmel_nand.c#L1058
> [2] https://github.com/torvalds/linux/blob/ffc253263a1375a65fa6c9f62a893e9767fbebfa/drivers/mtd/nand/raw/atmel/pmecc.c#L772
>
Hopefully that can help !
Best regards,
Ada


[3]: https://ww1.microchip.com/downloads/en/DeviceDoc/SAMA5D2-Series-Data-Sheet-DS60001476C.pdf
[4]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA5D4-Series-Data-Sheet-DS60001525.pdf
[5]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X60-Data-Sheet-DS60001579.pdf
[6]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf

------------------------ >8 ------------------------

diff --git a/drivers/mtd/nand/raw/atmel/pmecc.c b/drivers/mtd/nand/raw/atmel/pmecc.c
index 3c7dee1be21d..cd96b44f3f30 100644
--- a/drivers/mtd/nand/raw/atmel/pmecc.c
+++ b/drivers/mtd/nand/raw/atmel/pmecc.c
@@ -143,6 +143,7 @@ struct atmel_pmecc_caps {
  	int nstrengths;
  	int el_offset;
  	bool correct_erased_chunks;
+	bool need_clk_config;
  };
  
  struct atmel_pmecc {
@@ -787,6 +788,9 @@ int atmel_pmecc_enable(struct atmel_pmecc_user *user, int op)
  	writel(PMECC_CTRL_ENABLE, pmecc->regs.base + ATMEL_PMECC_CTRL);
  	writel(PMECC_CTRL_DATA, pmecc->regs.base + ATMEL_PMECC_CTRL);
  
+	if (pmecc->caps->need_clk_config)
+		writel(PMECC_CLK_133MHZ, pmecc->regs.base + ATMEL_PMECC_CLK);
+
  	return 0;
  }
  EXPORT_SYMBOL_GPL(atmel_pmecc_enable);
@@ -896,6 +900,7 @@ static struct atmel_pmecc_caps at91sam9g45_caps = {
  	.strengths = atmel_pmecc_strengths,
  	.nstrengths = 5,
  	.el_offset = 0x8c,
+	.need_clk_config = true,
  };
  
  static struct atmel_pmecc_caps sama5d4_caps = {

