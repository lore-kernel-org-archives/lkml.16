Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA262980C2
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751015942; cv=none; b=EyyRjxUncGVRnICU9JuP/09M7P9GXH2jcjCuJXZSBpyp/ItL/GD48NkLMd5WgqtEN9E5U59PSTuX9+iEv6MsJZxwq2yj1F7sZ6jaBsGlayDgX+PFWwJF+DAKkvVyrijAQzPBCp8rTDvGCqrpuhdsCYckHrrgwSb1oai+69dVgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751015942; c=relaxed/simple;
	bh=mDVqezLTK7SnfKOIRoR7S2CJEl0Dq7Ebyf8bb98uQNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IBJMBBuZYpBco3Md6eGgGjWcEnEq0xNBprZ9UeXuyElldpHQjLGqXtwuu34muSeRoPP73AVR6mprQw+Hd5DTDOoSCSqn2qXSMXRtPh0QZioEFxqOyFxU7tGaC9usRDHL3YVKq6r9IDlKgp6mJPMwje1RYC6U0dhjD22CPT27slk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtZ0Ox1w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtZ0Ox1w"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-451d6ade159so14300915e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751015939; x=1751620739; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xIxztczHXc41fel9IglxhmyI0/h9ABG9HIR/l5dGVtg=;
        b=FtZ0Ox1wCgXiJeMyaCkZD3LMTSayJuq73dJu7cJZF19UBF/4aXNwajj7bH3h+hxcBy
         zcAyGhz2sV/pgkr5dynxDx8+FcIC43NplvboII5Gm49g3s3Mpysgc/UrxW/uWMATuHDe
         P/g2PvlxW9a4N5mNZzxryAG8T0ZziKW3veicRwAnYAnKjuo/UqSe7xoqYr7gFUAmK6KL
         I2lW/T+dJ+ZziIH8aLx0kbx2gifRqKqAudMYQgqUYiH+8YQIWJcCnvYdjpa9tusYoBqJ
         99MEmmxqQebKLULDULWeIhA90ExyNwCJKCX/oTkUKNU8RfT4zstC3+o0FeaIlnhHzdEE
         7QAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751015939; x=1751620739;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIxztczHXc41fel9IglxhmyI0/h9ABG9HIR/l5dGVtg=;
        b=IsWF92PTof0Q5izCJvClCeuUha0NGH9NjwiCxG8FztRdjP59snawEOYvSXt76ZRA9z
         G22yqw4cU+HsJRKF25WN377LJ5xQKNctv0tvF4nKPJLBrx/IHjdFMU/uW/JkYSnpj7In
         bpPUvmg1TINWWzAdkrQfrjNG/AkjPPnqG+BcIxL7qhuonUwlDxLoheuoAnF6rGlqJTdQ
         n2/sNxCK6aW+OaIQ9oq39EJuQi2AGkXt70XAlwfK1N7Z+CFxZTvg3euglwSK0MBeN+On
         6RVZb1ksyXh65MDH6ULTMZ0GLoV5ViX5WVB+NRb7NnM+VUT7CsXrKLy5kQsq5iXNd7ZY
         92ew==
X-Forwarded-Encrypted: i=1; AJvYcCXzVNIFwgq5faOeXRBvtOQOD9fQGZFW9c2lxR+ASuPZOSQu03IDwILqq56ZsqwBbM0N2b2FGWDz5pBsdVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw+L3LQgP3F8qzktvFE3MtBP49bXpa2i4Eb2qy76cNTU+6mCcf
	1u/Z+tnjo8HZhg9G/CCdkmv68VTlFjXuM66THCnN7ZoryaNP9LXAigQKz8iWU+I6VMLislELOYf
	a0Uqc
X-Gm-Gg: ASbGnct5xvsL1Tq8lIoSKgZksoRnMxzUICgUJRQvkM1pGga/Fvv33DoSW8trisYkxdP
	ON4syU5QXJQm7qRR7b1Ol00whqgidbyj8WazT3a4vmxahZXaJULPSXd2ujPmWyNJF3IzR3+9Ukt
	snle9Ogpb9nMbHMK71wgdA5t67777csD9XiGoK/Fvu7eW0jJ5noluBDztJhaLemxAnCB3YMR0UN
	3ejG35vaSwrnyMOI4U48IrH3sKsN7/Kg47XXOyYznSyfaqCo6Qszj6+FAp+1Ws63q+za09Hi17f
	c0jA48AECh6ES9GVDOS/8Wy5PKjgWcEW0cp5qWFdtBhOKvr0ibNzsMkI2ZSxMOTHbhA=
X-Google-Smtp-Source: AGHT+IFKDATdTSicVyAsm5O95Gq04eWdeCdziB2/TLTqQhbYmQIh9aj9LxW0vtYh4OG++poViTaZpQ==
X-Received: by 2002:a05:600c:19cb:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-4538ee71251mr22039765e9.28.1751015938639;
        Fri, 27 Jun 2025 02:18:58 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45380d0f15esm67622605e9.1.2025.06.27.02.18.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 02:18:58 -0700 (PDT)
Message-ID: <f3552c8a-d8c2-4c0d-9286-20ad95c5937a@linaro.org>
Date: Fri, 27 Jun 2025 10:18:57 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: coresight: Finish removal of Coresight support in
 arch/arm/kernel
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>
References: <20250210112927.623872-1-james.clark@linaro.org>
 <15720521-7ee3-4945-a0bd-2b166682d4c9@arm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <15720521-7ee3-4945-a0bd-2b166682d4c9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/03/2025 10:48 am, Suzuki K Poulose wrote:
> On 10/02/2025 11:29, James Clark wrote:
>> Commit 184901a06a36 ("ARM: removing support for etb/etm in
>> "arch/arm/kernel/"") removed asm/hardware/coresight.h which is included
>> by this file. Therefore this is dead code so delete it.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Gentle ping. Or maybe you can take this in the Coresight tree Suzuki?

> 
>> ---
>>   arch/arm/include/asm/cti.h | 160 -------------------------------------
>>   1 file changed, 160 deletions(-)
>>   delete mode 100644 arch/arm/include/asm/cti.h
>>
>> diff --git a/arch/arm/include/asm/cti.h b/arch/arm/include/asm/cti.h
>> deleted file mode 100644
>> index f8500e5d6ea8..000000000000
>> --- a/arch/arm/include/asm/cti.h
>> +++ /dev/null
>> @@ -1,160 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0 */
>> -#ifndef __ASMARM_CTI_H
>> -#define __ASMARM_CTI_H
>> -
>> -#include    <asm/io.h>
>> -#include    <asm/hardware/coresight.h>
>> -
>> -/* The registers' definition is from section 3.2 of
>> - * Embedded Cross Trigger Revision: r0p0
>> - */
>> -#define        CTICONTROL        0x000
>> -#define        CTISTATUS        0x004
>> -#define        CTILOCK            0x008
>> -#define        CTIPROTECTION        0x00C
>> -#define        CTIINTACK        0x010
>> -#define        CTIAPPSET        0x014
>> -#define        CTIAPPCLEAR        0x018
>> -#define        CTIAPPPULSE        0x01c
>> -#define        CTIINEN            0x020
>> -#define        CTIOUTEN        0x0A0
>> -#define        CTITRIGINSTATUS        0x130
>> -#define        CTITRIGOUTSTATUS    0x134
>> -#define        CTICHINSTATUS        0x138
>> -#define        CTICHOUTSTATUS        0x13c
>> -#define        CTIPERIPHID0        0xFE0
>> -#define        CTIPERIPHID1        0xFE4
>> -#define        CTIPERIPHID2        0xFE8
>> -#define        CTIPERIPHID3        0xFEC
>> -#define        CTIPCELLID0        0xFF0
>> -#define        CTIPCELLID1        0xFF4
>> -#define        CTIPCELLID2        0xFF8
>> -#define        CTIPCELLID3        0xFFC
>> -
>> -/* The below are from section 3.6.4 of
>> - * CoreSight v1.0 Architecture Specification
>> - */
>> -#define        LOCKACCESS        0xFB0
>> -#define        LOCKSTATUS        0xFB4
>> -
>> -/**
>> - * struct cti - cross trigger interface struct
>> - * @base: mapped virtual address for the cti base
>> - * @irq: irq number for the cti
>> - * @trig_out_for_irq: triger out number which will cause
>> - *    the @irq happen
>> - *
>> - * cti struct used to operate cti registers.
>> - */
>> -struct cti {
>> -    void __iomem *base;
>> -    int irq;
>> -    int trig_out_for_irq;
>> -};
>> -
>> -/**
>> - * cti_init - initialize the cti instance
>> - * @cti: cti instance
>> - * @base: mapped virtual address for the cti base
>> - * @irq: irq number for the cti
>> - * @trig_out: triger out number which will cause
>> - *    the @irq happen
>> - *
>> - * called by machine code to pass the board dependent
>> - * @base, @irq and @trig_out to cti.
>> - */
>> -static inline void cti_init(struct cti *cti,
>> -    void __iomem *base, int irq, int trig_out)
>> -{
>> -    cti->base = base;
>> -    cti->irq  = irq;
>> -    cti->trig_out_for_irq = trig_out;
>> -}
>> -
>> -/**
>> - * cti_map_trigger - use the @chan to map @trig_in to @trig_out
>> - * @cti: cti instance
>> - * @trig_in: trigger in number
>> - * @trig_out: trigger out number
>> - * @channel: channel number
>> - *
>> - * This function maps one trigger in of @trig_in to one trigger
>> - * out of @trig_out using the channel @chan.
>> - */
>> -static inline void cti_map_trigger(struct cti *cti,
>> -    int trig_in, int trig_out, int chan)
>> -{
>> -    void __iomem *base = cti->base;
>> -    unsigned long val;
>> -
>> -    val = __raw_readl(base + CTIINEN + trig_in * 4);
>> -    val |= BIT(chan);
>> -    __raw_writel(val, base + CTIINEN + trig_in * 4);
>> -
>> -    val = __raw_readl(base + CTIOUTEN + trig_out * 4);
>> -    val |= BIT(chan);
>> -    __raw_writel(val, base + CTIOUTEN + trig_out * 4);
>> -}
>> -
>> -/**
>> - * cti_enable - enable the cti module
>> - * @cti: cti instance
>> - *
>> - * enable the cti module
>> - */
>> -static inline void cti_enable(struct cti *cti)
>> -{
>> -    __raw_writel(0x1, cti->base + CTICONTROL);
>> -}
>> -
>> -/**
>> - * cti_disable - disable the cti module
>> - * @cti: cti instance
>> - *
>> - * enable the cti module
>> - */
>> -static inline void cti_disable(struct cti *cti)
>> -{
>> -    __raw_writel(0, cti->base + CTICONTROL);
>> -}
>> -
>> -/**
>> - * cti_irq_ack - clear the cti irq
>> - * @cti: cti instance
>> - *
>> - * clear the cti irq
>> - */
>> -static inline void cti_irq_ack(struct cti *cti)
>> -{
>> -    void __iomem *base = cti->base;
>> -    unsigned long val;
>> -
>> -    val = __raw_readl(base + CTIINTACK);
>> -    val |= BIT(cti->trig_out_for_irq);
>> -    __raw_writel(val, base + CTIINTACK);
>> -}
>> -
>> -/**
>> - * cti_unlock - unlock cti module
>> - * @cti: cti instance
>> - *
>> - * unlock the cti module, or else any writes to the cti
>> - * module is not allowed.
>> - */
>> -static inline void cti_unlock(struct cti *cti)
>> -{
>> -    __raw_writel(CS_LAR_KEY, cti->base + LOCKACCESS);
>> -}
>> -
>> -/**
>> - * cti_lock - lock cti module
>> - * @cti: cti instance
>> - *
>> - * lock the cti module, so any writes to the cti
>> - * module will be not allowed.
>> - */
>> -static inline void cti_lock(struct cti *cti)
>> -{
>> -    __raw_writel(~CS_LAR_KEY, cti->base + LOCKACCESS);
>> -}
>> -#endif
> 

