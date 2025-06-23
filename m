Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A38248869
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750682146; cv=none; b=ER3Vm939wzhgdulcigkq0xC+PNS5z4QOfLw5mdkEgrmA2qX0feArL0E/N7lhER4hOyFobUJGQO3c7aFQfNojJTYXT5KWyWg2xXMQypA4x0JN/I7KTwDxgGjICvzwvYdWWKNya4kLcdztr4IQplRwWsPbwfDwvShxDDmbBM/OtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750682146; c=relaxed/simple;
	bh=/lBuAUZ14QRJ06R4lWguq0BNnee6uvtTYgiN12pGz2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gqBq1ytrx2TJxLOfQoeddgMvnz+ipcBKkui3KFAUTtRfehoDlaEdYUURlOVN1jfhFvCRqKRw7Ia2R6Oia8gyjJ6O++Ue3gRbKRjFrH2gz2YC0Ijt9R2SDBm2OzJkz1U1pdVu0aZIGkwtJkhN5gwjt1nqMRxHASpFoVdfMx+zzv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=r7QXQo0U; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="r7QXQo0U"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236192f8770so28306575ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750682143; x=1751286943; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2J6CJVh9SDJQfR/08bZkzuItlJ/LKWv0StLwptfBoc=;
        b=r7QXQo0UHQb03C+1ENvwAm1zRI9dffYzXHOZNSKbkC9f7lA0U5JAIaLfzrsDc1Y1YM
         HW6saxChfCxq9vvmM9fuIybM+3dy0Ff5BQiZdUCGlcNk5L240XWVTm5+85WGbSojFpke
         BjD8w4nUxQMFw2ucUGch/WiwNUQgZnhzw1KaMzryyZibvgJtikz93kt34m61aKElKXaY
         OqxEG7wr3KXbQJ86E2pg3+agAUa6PxFoTOTCPPwstGgYK6RP9NLZcblLtdmY6dnLgW8a
         H+x6EVidGzLzx3oQNLySkRnlTXOi6NxVnavUnG72ZmsIjSO7MN8Zl9CzH+n3tZzzG+wy
         NvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682143; x=1751286943;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2J6CJVh9SDJQfR/08bZkzuItlJ/LKWv0StLwptfBoc=;
        b=dwIKf4BujdIzZSkhQJA8qotMub0ezRIbQutCdydBovukW822n/2/fl21zjvoK2kTfp
         QCjhkjhKUN3Rfpswpc9uyNqeDkl9z7c+IJuOaScHUprFSDdM0X1wpwZxpF2sIJ2L4ttE
         uDqqklydpmt2Q1wQpUKoDYGVrZg2PyhaLucDfwbpeA9SrpDAG7iVcEdtaxbFOxwUWkVw
         5yCIe1NdulCOSTSqVWTnPleHFGGXdb9krP1YZWJhEV8WqWMN/o2/LKqZxHRPYcV5exbQ
         ySIaGsXUxJ5jkS+ZnaAyZPva5AmLuWPNSMrgElWu1ivAjitPqWh1Q6/VAYxWRxJi6EPw
         ++3g==
X-Forwarded-Encrypted: i=1; AJvYcCXa06Br/CejYIbPLKq+RXEQoObD36d64m6qu2b8+A6txAxJ9X06Txc18H4oH5wufhKtWnuu9jn0LRyLEag=@vger.kernel.org
X-Gm-Message-State: AOJu0YynjiqskCvkqXTrSbP9hnvUtuqJmndOBN1E/jVUoriHlOTux7nz
	q57fek0m5gF2EW8GdZzcEZFogeCZ7/cZJWFISYjffSoHUnR9zEvr17h2ROdUFkuzkZM=
X-Gm-Gg: ASbGnctv10KaoXByl+z3p3bV0FTeX+Qe6/b3KP4uaTJOHB1dRY+P+to23piSUE39OZD
	XtxFJvPlpAsLIova0wjeOeVU3VLhvpY1650nV2wRKewglHVjkgf+eqTN+BNN1vbjoEAgW6Vlrpr
	xUi/sxCu45VyhjU4stCi7sLc0z2lcIW3MVopea44GhsiFe8LuFfQwloPMRsa6oHVMdsTQp0ihS/
	to6c0OzMuioKfQ53LqlQKX3o0NgvL99525CQR2YhNBjBu2BKmK3LL6hWVzVVyyFCH/uIunz2Osr
	kwkj/NO/YtfFdhOynFwVyXzPjVhnQzowooeX9X5rfKU0rtJDhsW455IWBj7vjnsIM+VoYpPId6c
	LjmSQFrDrPTfYj5bc0qBQ6jDQT9c9oSw=
X-Google-Smtp-Source: AGHT+IFhVMOOzfJS+ZMgN2t/2S1KtBErjLzrLACr83Lp9bfsIO8qJQHyS7OUG+hyXIaKHaCPahxILg==
X-Received: by 2002:a17:902:e88f:b0:231:c89f:4e94 with SMTP id d9443c01a7336-237db0d6afbmr183457395ad.21.1750682143178;
        Mon, 23 Jun 2025 05:35:43 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87182b2sm83217035ad.231.2025.06.23.05.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 05:35:42 -0700 (PDT)
Message-ID: <4f47fae6-f516-4b6f-931e-92ee7c406314@rivosinc.com>
Date: Mon, 23 Jun 2025 14:35:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] Re: [PATCH] RISC-V: KVM: Delegate illegal instruction
 fault
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 anup@brainfault.org, atish.patra@linux.dev, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <20250620091720.85633-1-luxu.kernel@bytedance.com>
 <DARCHDIZG7IP.2VTEVNMVX8R1E@ventanamicro.com>
 <1d9ad2a8-6ab5-4f5e-b514-4a902392e074@rivosinc.com>
 <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAPYmKFs7tmMg4VQX=5YFhSzDGxodiBxv+v1SoqwTHvE1Khsr_A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 23/06/2025 14:12, Xu Lu wrote:
> Hi Clément,
> 
> On Mon, Jun 23, 2025 at 4:05 PM Clément Léger <cleger@rivosinc.com> wrote:
>>
>>
>>
>> On 20/06/2025 14:04, Radim Krčmář wrote:
>>> 2025-06-20T17:17:20+08:00, Xu Lu <luxu.kernel@bytedance.com>:
>>>> Delegate illegal instruction fault to VS mode in default to avoid such
>>>> exceptions being trapped to HS and redirected back to VS.
>>>>
>>>> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
>>>> ---
>>>> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
>>>> @@ -48,6 +48,7 @@
>>>> +                                     BIT(EXC_INST_ILLEGAL)    | \
>>>
>>> You should also remove the dead code in kvm_riscv_vcpu_exit.
>>>
>>> And why not delegate the others as well?
>>> (EXC_LOAD_MISALIGNED, EXC_STORE_MISALIGNED, EXC_LOAD_ACCESS,
>>>  EXC_STORE_ACCESS, and EXC_INST_ACCESS.)
>>
>> Currently, OpenSBI does not delegate misaligned exception by default and
>> handles misaligned access by itself, this is (partially) why we added
>> the FWFT SBI extension to request such delegation. Since some supervisor
>> software expect that default, they do not have code to handle misaligned
>> accesses emulation. So they should not be delegated by default.
> 
> It doesn't matter whether these exceptions are delegated in medeleg.

Not sure to totally understand, but if the exceptions are not delegated
in medeleg, they won't be delegated to VS-mode even though hedeleg bit
is set right ? The spec says:

A synchronous trap that has been delegated to HS-mode (using medeleg)
is further delegated to VS-mode if V=1 before the trap and the
corresponding hedeleg bit is set.



> KVM in HS-mode does not handle illegal instruction or misaligned
> access and only redirects them back to VS-mode. Delegating such
> exceptions in hedeleg helps save CPU usage even when they are not
> delegated in medeleg: opensbi will check whether these exceptions are
> delegated to VS-mode and redirect them to VS-mode if possible. There
> seems to be no conflicts with SSE implementation. Please correct me if
> I missed anything.

AFAIU, this means that since medeleg bit for misaligned accesses were
not delegated up to the introduction of the FWFT extension, VS-mode
generated misaligned accesses were handled by OpenSBI right ? Now that
we are requesting openSBI to delegate misaligned accesses, HS-mode
handles it's own misaligned accesses through the trap handler. With that
configuration, if VS-mode generate a misaligned access, it will end up
being redirected to VS-mode and won't be handle by HS-mode.

To summarize, prior to FWFT, medeleg wasn't delegating misaligned
accesses to S-mode:

- VS-mode misaligned access -> trap to M-mode -> OpenSBI handle it ->
Back to VS-mode, misaligned access fixed up by OpenSBI

Now that Linux uses SBI FWFT to delegates misaligned accesses (without
hedeleg being set for misaligned delegation, but that doesn't really
matter, the outcome is the same):

- VS-mode misaligned access -> trap to HS-mode -> redirection to
VS-mode, needs to handle the misaligned access by itself


This means that previously, misaligned access were silently fixed up by
OpenSBI for VS-mode and now that FWFT is used for delegation, this isn't
true anymore. So, old kernel or sueprvisor software that  included code
to handle misaligned accesses will crash. Did I missed something ?

Note: this is not directly related to your series but my introduction of
FWFT !

Thanks,

Clément

> 
> Best Regards,
> Xu Lu
> 
>>
>> Thanks,
>>
>> Clément
>>
>>>
>>> Thanks.
>>>
>>> _______________________________________________
>>> linux-riscv mailing list
>>> linux-riscv@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>>

