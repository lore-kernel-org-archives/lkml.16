Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C033213635E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 07:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748848792; cv=none; b=ABEoLzmb9Kh52v9AxyucL2oNkN/OycKGBA4FEEeG45FRC5SPekEaLn/JGeAQJUatiFIy2N3w0i3Kk+VvRNnl30+pouU68n6EoI/HL7s6JwGNNZBXULZ2FA4Pm2oUPkTpHCnPxs6fdp9AdSmh0cI8uL0oSnr2y41K1R5hx+KZRys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748848792; c=relaxed/simple;
	bh=quF/Z6NggC2hW19MLTDd4Q5qZ0avXja//qyBlA2hjgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JofFMWMCSlrplQOS7098dntfqZJsPzqVxWMFZkoq1fp1XBAIb3CGx4iHY5nw9WzXV4IPi2KUdxwTU6Rnnsiq2eN/jaoEbyqGfCsEwRGfUAz0cH32APo/zLP5GR8UqLv4U6SAT9PzHQjp1BheslF4Rpb69Gjd6N6W/jQ9bUwEul4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=vrU8IuPS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="vrU8IuPS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so28580765e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748848788; x=1749453588; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOxHpRhHAkShbULd5W1bUWm0AU1brFulo4kSIXRYEzo=;
        b=vrU8IuPSvgq9r0TqgnUR5r7RUfSQ4jMtTlUphIZk6C0vTm3E9XUU+NT3iLmEWXg4bt
         WP1fODtqx7ko5xyvTYLbP4gk0Meu0osCSMuZdFeojMJUw9BQpLYBT3597DS+uodU3JQr
         YIXeBEIV9G9zC7VyLMuNKowWrQuJbcVsqctEugrUHOq+fOSdRJv9F9TjvOH/bp1KUFCr
         ahQ6Y9xpFA3Jp6xZUFmUqJMqKd2d8lM3Sm9UxZ17doBaTrA5/3UIxNyxyEKm4YUIAGh3
         87A4bIccIof6Ih3FRmjbiAuUKVusYtl2AbPePnJUequcJb6gLMLme8OSslfmBwTMFeMQ
         bAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748848788; x=1749453588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOxHpRhHAkShbULd5W1bUWm0AU1brFulo4kSIXRYEzo=;
        b=IQfZ5YlVVaJalAmDE5ZLMWl//pNWfjMvyvvaZcO6alarZ2kvqUZh05OTj7RHZ0FKEN
         hOdLaEvdaNRoHJVQEN/CVCd3lIsolGzLw8kPxjSLX3wiCJU/9gHJWDh6yhfYHQi0rHl5
         2FLnKEhIDpSh34juGs0gvKlZNhsrjqCbU+Xxz/aOECOIoPIXed7DQsIUlLfoaIP0IqfC
         Wqt4Cowzm0EaiWF+vCVH2ms6GtdjAy3wAhjWSOL9aZZn96cb5djdXtn8zuLDuYLX4ZHv
         6HHhrNpAqTGKJs0ixTGAQsCbEkNXUCVhtMERsUKOvFtVeg1yHX+DMAlFExHakyKMzZmn
         2JFw==
X-Forwarded-Encrypted: i=1; AJvYcCV0JsXVMC+sDsu0n/4H5DvBlEOXQpqYDA+1UlsAE8ss3MU9CZSoItFhlA5I4yv1Xnj/pyETdmhQWs2W00Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFPEOzsMpuzbC9Ds+bRmRof+Pa18MpJx316AFDkddHuGae6ixy
	ToKUfxW4VPzobnNTucxpTSJcqoEcv+2xs7gPM3VV56oLe/KMCu+ghQIl4I9cb5dLyTo=
X-Gm-Gg: ASbGncs8CPPVAmSMuSrJJqxF1XZUl6pcpojyoODOGKm7qbFykJ1S3NnjgFl2RvpXO76
	AqHGGw/XkUQu16bIHp+WM35NlXkcPVWb77NxjFBEQl8gDA0Bs2MH0Ro8+nQrCAJb4U0XejinECI
	umN6R+lRktVT0Ll2mcQP2sElCTtDcgDZu7YrvU8hIR0RCktZSHe9SqXh0rEfwHeFpJ+ehqSl31N
	slXnU75Tg7A2YEDJyOXvE6GUPfyzUKwA1NoGc7EbuyNTUFBiCKEzegz0vIoeXNhsWfxGnWnLgUA
	GbeXJ/QP/vuk5JG41pLmSetWnQpayASttPmrYjlI5ND0FtWb9sMno3ZFaJvzYuPpCBUq4r3bMbq
	O5kdeonEfsFrWdTax/09Lti+tubPE6TA=
X-Google-Smtp-Source: AGHT+IHCNj7REvqqY8roqc3kPzLUtcFHNSZjWN6JJo9xurc0o9AVBRs0XMw1qKlgapNbrolzs4DH+w==
X-Received: by 2002:a5d:588a:0:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a4fe178e45mr5008440f8f.14.1748848787851;
        Mon, 02 Jun 2025 00:19:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb7dafsm109293255e9.25.2025.06.02.00.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 00:19:46 -0700 (PDT)
Message-ID: <01a5ab11-ed87-4d30-a162-987db34e6483@rivosinc.com>
Date: Mon, 2 Jun 2025 09:19:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling
 in put/get_user()
To: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
 <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31/05/2025 15:32, Alexandre Ghiti wrote:
> On 5/30/25 22:56, Clément Léger wrote:
>> While debugging a few problems with the misaligned access kselftest,
>> Alexandre discovered some crash with the current code. Indeed, some
>> misaligned access was done by the kernel using put_user(). This
>> was resulting in trap and a kernel crash since. The path was the
>> following:
>> user -> kernel -> access to user memory -> misaligned trap -> trap ->
>> kernel -> misaligned handling -> memcpy -> crash due to failed page fault
>> while in interrupt disabled section.
>>
>> Last discussion about kernel misaligned handling and interrupt reenabling
>> were actually not to reenable interrupt when handling misaligned access
>> being done by kernel. The best solution being not to do any misaligned
>> accesses to userspace memory, we considered a few options:
>>
>> - Remove any call to put/get_user() potientally doing misaligned
>>    accesses
>> - Do not do any misaligned accesses in put/get_user() itself
>>
>> The second solution was the one chosen as there are too many callsite to
>> put/get_user() that could potentially do misaligned accesses. We tried
>> two approaches for that, either split access in two aligned accesses
>> (and do RMW for put_user()) or call copy_from/to_user() which does not
>> do any misaligned accesses. The later one was the simpler to implement
>> (although the performances are probably lower than split aligned
>> accesses but still way better than doing misaligned access emulation)
>> and allows to support what we wanted.
>>
>> These commits are based on top of Alex dev/alex/get_user_misaligned_v1
>> branch.
>>
>> Clément Léger (2):
>>    riscv: process: use unsigned int instead of unsigned long for
>>      put_user()
>>    riscv: uaccess: do not do misaligned accesses in get/put_user()
>>
>>   arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>>   arch/riscv/kernel/process.c      |  2 +-
>>   2 files changed, 23 insertions(+), 7 deletions(-)
> 
> 
> We also need to prevent unsafe routines to trigger misaligned accesses,
> I have a patch for this here https://github.com/linux-riscv/linux/
> commit/7c172121aeb235dedeb6f5e06740527530edd6af
> 
> Clément, can you add this one to the series please?

Yep sure.

> 
> I have just  triggered a CI with those fixes on top of my sbi 3.0 branch.
> 
> Thanks,
> 
> Alex
> 
> 

