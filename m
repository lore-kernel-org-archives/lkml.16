Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8464C22F392
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748541325; cv=none; b=tzTYGMyQxvg4vEPgO+tOG44D+CLKPz/7dkIMgXErKaYFRn5SIwIgsMVcSXNlBJMTozDAi3gimc+lCJzX6ysijIxgWtr3AAxABdU7uI/OON7o44dnNzq8irXnzEEE3pruRezZUdCDl12jAA64IG43o3GZnfDujbj+C63yYvC4Jmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748541325; c=relaxed/simple;
	bh=yHk3P+xJ2C/cYyRu6/Zii1py+L1jPUfPh1UhfbkJMrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n+ZkVcaeSzvUkP2vxLbmjidvD76wgrmYVLgdol8WIqXvrQbDHhyrcq+YPzDyf9YaUmqjAx/NFmW2zVgC0f5ApUI/KYqADfvUHiOyU/hGrDzlxV4wCiRVr4K1BCO28yRV1BPYEb2BpPGnW0G52eKO6F2fk81efvNzer7G+CC36mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=civUt7mL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="civUt7mL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-311ef4fb549so1031920a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 10:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748541322; x=1749146122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4+SQRm6s+Iu+nsET3yyVUZurdygfX7CiRJxiNOW/rk4=;
        b=civUt7mLtIpTFrTiUk/9lfWxQUujupZwq7S+A0WBt6PR2BsoHv3H7IjAUQz6xoHNGK
         2KWQUMi62IEtLjhwyl2zaFmZRaEh0VXKsrfH84P1o0UMw4T4LhpspkrLaIjEH0JqCBC+
         gfgJX1Xt+6FykizGmtGxuYQzDCwf85lKFCQemdPBxr8Ls+GungYYpPvCMHIIJwfICTDj
         WxYm+B0f8F5NLh1jkUGz+3lb1RTP7L6uZn+BHxlxnMVbMDRLaTnJYmR8fAJ+AhdPplcP
         /w6X7/WQKUppNnfBgbf2o0cdP5N97qcXo/FW5OwuHnO9ghbYy28mrmVQOkA+W7P7wUAb
         F/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748541322; x=1749146122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4+SQRm6s+Iu+nsET3yyVUZurdygfX7CiRJxiNOW/rk4=;
        b=FSoqvPwNApMiQ3SHqx40pnOG2dWVMPSFr59DBclxYIL0UdX88yEVZxaMVGeOwpNsfN
         leRfrVmY5gxfk8sFdwqgRECTQsvteWPmyaUUYd5qPMTwd1ZuuVG9f0BIhq2+cFciucxJ
         JFJSAV7E/07nsBQLggMehfzDw+PtfpGl7o0dOiYU2aOLpSBkqjnujIZc0KO/9wmYdiO6
         l3Q4Kr/O2TIXugQgGmCxAnoOz1gDP4EvaPDOWfsGKuKDhB6QVy6/DrsAXHKj+JVyMAoU
         9srWr+lKxv91iNbz64VessZtKm6V5ifuj9PF3B6uFqtpr27o5eVKyDX8w4VnGkN4lSa9
         eteg==
X-Forwarded-Encrypted: i=1; AJvYcCW5WyperwbJFDKvtzE66Egy5C6eDfHZY2R50FwusvUMXoCsiY1IiXQ5RZJILlfofKdN98c1qw9Uxn9hpQI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiIQasQyudBxMlmFkUZbI3nHGkEAmbiH+aOzOct5eGBUqU+JSj
	XnlneNkryN7DVP8vwh+yoD3CbIFI6TBWFlEpuUWpzyob3wOPa0WNo364sHqpXzDUTWA=
X-Gm-Gg: ASbGncvSszXVDfbr4o7EslJornzc6xRKmSwkB812GKiHCqTuOEXalvjsDKlUpodkTWB
	tQiRh1kDxBdHlkOJtwZzzOUYxEC3m7bK3jfzPJsfZYYgtv/FS8stTtaelGcwASfrv5es6wg/1F2
	IR8vkSjo1mgWXjPhNX4QnCNMurjFtFRVrkMxjgNFeTCXPppACfQ88Zr0TPye1fJPz0JaYq9avnH
	Z7y/3SQOolf4xlCKxFI23FwsPbuh4s7xwAmTTk4Q/+yLJPGJVbtw6Skd69CB0cpxgeZeHcZWJ3e
	y0w6GQ0ARLYWeDWSCiUH+0/tnYgxitjKhjcIxiu9vIZ8i/O+8puG36xX/Imwug==
X-Google-Smtp-Source: AGHT+IHaGU6VaoGRPbS69xPUEIisUrjE8e2rebwY7/MdzFUPdPZSwjK8HTRRYYazeTXqgdlwgTI3ug==
X-Received: by 2002:a17:90b:3dce:b0:311:baa0:89ca with SMTP id 98e67ed59e1d1-31241e98d1bmr560226a91.34.1748541322634;
        Thu, 29 May 2025 10:55:22 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3123b3ad196sm299788a91.15.2025.05.29.10.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:55:22 -0700 (PDT)
Date: Thu, 29 May 2025 10:55:20 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Andy Chiu <andybnac@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Cyril Bur <cyrilbur@tenstorrent.com>,
	samuel.holland@sifive.com, ben.dooks@codethink.co.uk,
	palmer@dabbelt.com, linux-kernel@vger.kernel.org,
	jszhang@kernel.org, paul.walmsley@sifive.com, charlie@rivosinc.com,
	jrtc27@jrtc27.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: uaccess: Only restore the CSR_STATUS SUM bit
Message-ID: <aDifiKsdE-29w7-N@debug.ba.rivosinc.com>
References: <20250522160954.429333-1-cyrilbur@tenstorrent.com>
 <2c07d65e-0641-42a0-9eb4-9e42d9325ff2@ghiti.fr>
 <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFTtA3PATS2CT-jax7eTNS=ZqU55CwGr=TeGiNX16ztfp5v9_w@mail.gmail.com>

On Thu, May 29, 2025 at 12:17:24AM +0800, Andy Chiu wrote:
>On Tue, May 27, 2025 at 4:39 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>>
>> +cc linux-riscv, Andy, Deepak
>>
>> On 5/22/25 18:09, Cyril Bur wrote:
>> > During switch to csrs will OR the value of the register into the
>> > corresponding csr. In this case we're only interested in restoring the
>> > SUM bit not the entire register.
>> >
>> > Fixes: 788aa64c0 ("riscv: save the SR_SUM status over switches")
>> > Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>> > ---
>> > I've put the Fixes tag in but I assume this will get squashed into the
>> > patch. Either way I hope this works to fix the immediate issue.
>> >
>> >   arch/riscv/kernel/entry.S | 12 ++++++++----
>> >   1 file changed, 8 insertions(+), 4 deletions(-)
>> >
>> > diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
>> > index 00bd0de9faa2..6ed3bd80903d 100644
>> > --- a/arch/riscv/kernel/entry.S
>> > +++ b/arch/riscv/kernel/entry.S
>> > @@ -399,14 +399,18 @@ SYM_FUNC_START(__switch_to)
>> >       REG_S s11, TASK_THREAD_S11_RA(a3)
>> >
>> >       /* save the user space access flag */
>> > -     li    s0, SR_SUM
>> > -     csrr  s1, CSR_STATUS
>> > -     REG_S s1, TASK_THREAD_STATUS_RA(a3)
>> > +     csrr  s0, CSR_STATUS
>> > +     REG_S s0, TASK_THREAD_STATUS_RA(a3)
>> >
>> >       /* Save the kernel shadow call stack pointer */
>> >       scs_save_current
>> > -     /* Restore context from next->thread */
>> > +     /*
>> > +      * Restore context from next->thread. csrs will OR the bits from s0 and
>> > +      * only want to restore the SR_SUM bit
>> > +      */
>> >       REG_L s0,  TASK_THREAD_STATUS_RA(a4)
>> > +     li    s1,  SR_SUM
>> > +     and   s0,  s0, s1
>> >       csrs  CSR_STATUS, s0
>> >       REG_L ra,  TASK_THREAD_RA_RA(a4)
>> >       REG_L sp,  TASK_THREAD_SP_RA(a4)
>>
>> To conclude the discussion we had here
>> https://lore.kernel.org/linux-riscv/aDCtATl2N21fBsyT@debug.ba.rivosinc.com/#t,
>> in addition to Cyril's patch above, to me we only have to rename the
>> status field into sum and we're good to go. @Andy, @Deepak @Samuel Do
>> you agree?
>
>LGTM, thanks!
>
>Andy

Sounds good to me.

>
>>
>> As this is an important fix (along with 2 other fixes, one for thead
>> vector and vdso static values), I'd like to send another PR soon for
>> inclusion in 6.16-rc1, I did not want to delay the second PR any longer.
>>
>> Thanks for your feedbacks,
>>
>> Alex
>>
>>
