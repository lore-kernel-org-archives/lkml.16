Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0623E32B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745942842; cv=none; b=rcGYiEtVBfrEP9g1kyZgFkcwIuUgI4FJqrg9ecdZoqTt0nEKBLwrXg6ADhLa7K6CftHwdnu6MF7HijiT+7AC65dZvXy7IQg++RNRYCumM85y/kZjuTizdFPX2XUL4ofHrCPAWiy7nfOFYeoeqhHxXOhBJvE+BHOIVkrcelO+zgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745942842; c=relaxed/simple;
	bh=vk4HFBAT1zt5VoaOBCMzQw4ANuNvKRlbDYMt1L784q4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y2qxn0pHsXryQrgSczZN45/wBmJJFBB04LIViY4ZR2MZwjQheF9zZJ/5Xcs+dSWMBBNymIIAzI5XuW0Emw2LqZ65Q5yCr5OR8Dy7GEmtlQ2tDCfDurBm1pMJmnFddaKak1NDmo1FYCDhAY9NLKIQ0++gxswHE33vyYNRZMicS/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lkdpWnGE; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lkdpWnGE"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3f9832f798aso4803872b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745942840; x=1746547640; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XIK7+9eNcooiOnLlmPgNOLYSoGDevBz5dwgdJkp4UHk=;
        b=lkdpWnGETSiT0boQ8qkoBjKjHNYc+JWX7Nt6l1JzZ92QD4pwyF+E+dR0Ld324pUsru
         3faGB+l/SD31QOxt32L3mJBIzedINCC6a56VjhLfoTfxz3YzL4Lb0R6Q6SJuRgi5K9HL
         F9XdzW35HaDlm8cZ57QeLiM3GtFdTFkDgPDLW/oEqHDEZTKBszRaJgZK8b18HhfVCb9w
         nXaNhHgLwYdtFL57mQXuzCw70s/gCsLE1KrQtq0MCj3YlU0mqhyg/VcYjeiwoiCkRiPL
         0ejvTLgslML1+/xLtZ5VJfxF1LPtod5GTXNvQ6FRNagGkF4Ygq05n1rFHEA2l62mIUJq
         /bxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745942840; x=1746547640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XIK7+9eNcooiOnLlmPgNOLYSoGDevBz5dwgdJkp4UHk=;
        b=nWvT7mwjvVzhi3rKlfRATA5DU0LmmKk0oO1t07qozNuZ3IWQS31ShhfCNoV+qfcFa/
         swTCsyQVU/SQjchDiuh8fGpFsQdF5iheuxIJhKLswl6jagN/U9dH5c2kZqL+NSxJixVM
         dfclmT6EbxGLIT9fM9bZzIgK+FSnnVVs2/9a+ca1Y6i25cU4Hq7S5I+EOu7YQ/JXE7vI
         Pz7gHsnqiE9y4zhrSOItBRJUrrFpL35eIn25nKT8F1+RW8s2ZPzZoD5QSx7aeF/dKVJu
         pOVpF7lBVqzgJdu4B6BV7HTgo/BPOtjIM+mU8q60J/kG3hLNxS+WaoVvdXjkTMQ8Vczt
         rzpg==
X-Forwarded-Encrypted: i=1; AJvYcCUpfeWzqxezPVz6cI6xYwXGxrCR3jYXEx4ALLBamOgUTLvYpwxAiWZ798aeSlmaQ1Hu9fk3vOaBFOVDPVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Q029vMxDIfaTf/3KbdQ1Us7R1/M5Z2G9phx3bAP5tUhpG76j
	5lJ8beAG3DOOeeDH8sS+0e0Mf4btHwqwIRYWNMgB/Hm9OJC9cZvmdVROsA==
X-Gm-Gg: ASbGncs77+e+ich/k92JUKjdRZKhlhXL8j7aAJVgEUGhnImiUMz9fMpbqWohjZg/Z6V
	bxtzv2GvDhJIz72xcSrKOFLb0bAu6AcAmJ/W2ci5ttgK6jyi0r9GmN+IGMx2YJG04BcRlmEqLJR
	tqPbFu2NWpBmQWqTcyq0PoLWcnqj08r//0H/zDJn5QrfLi/0x3H1806jpkRNJDk+x53/fJbDen6
	Jj3MWTa8gbXdRBspONMhB+iZoKxUl122vlIi9mTNUvf6ghBjU8t9TFcIWy/tpU1Q1qbqbJO883D
	jngOMCrjnBdTb8N6mDitO3BUENxSdVH4g8NWurDsf4co9rYlQEpptt6BcvdN8+YW44oEQ94U8Qu
	k1YWdrRXRTJO25ZaqctdfO3Ax2eEU
X-Google-Smtp-Source: AGHT+IHcAV6dQDM6RTU2zO2HYaLm2KJ/7mWRme4niHjqcdFyojuIB3gkgu9vseuWXZzhJGIi3+DM9w==
X-Received: by 2002:a05:6808:6b96:b0:3f8:205a:98da with SMTP id 5614622812f47-402115647d4mr1914612b6e.11.1745942840428;
        Tue, 29 Apr 2025 09:07:20 -0700 (PDT)
Received: from ?IPV6:2603:8080:7400:36da:dff5:4180:2562:4c1e? ([2603:8080:7400:36da:dff5:4180:2562:4c1e])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-60686e96d4esm285936eaf.8.2025.04.29.09.07.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:07:20 -0700 (PDT)
Message-ID: <575bdc12-be65-42a9-9581-e2a31e6ce810@gmail.com>
Date: Tue, 29 Apr 2025 09:25:35 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/panic: Add x86_panic_handler as default
 post-panic behavior
To: Sean Christopherson <seanjc@google.com>, carlos.bilbao@kernel.org
Cc: tglx@linutronix.de, jan.glauber@gmail.com, bilbao@vt.edu,
 pmladek@suse.com, akpm@linux-foundation.org, jani.nikula@intel.com,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 takakura@valinux.co.jp, john.ogness@linutronix.de
References: <20250428215952.1332985-1-carlos.bilbao@kernel.org>
 <20250428215952.1332985-3-carlos.bilbao@kernel.org>
 <aBDox0dlo6S7KzSI@google.com>
Content-Language: en-US
From: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
In-Reply-To: <aBDox0dlo6S7KzSI@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

On 4/29/25 09:57, Sean Christopherson wrote:
> On Mon, Apr 28, 2025, carlos.bilbao@kernel.org wrote:
>> From: Carlos Bilbao <carlos.bilbao@kernel.org>
>>
>> Add function x86_panic_handler() as the default behavior for x86 for
>> post-panic stage via panic_set_handling(). Instead of busy-wait loop, it
>> will halt if there's no console to save CPU cycles.
>>
>> Signed-off-by: Carlos Bilbao (DigitalOcean) <carlos.bilbao@kernel.org>
>> ---
>>  arch/x86/kernel/setup.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
>> index 9d2a13b37833..3bfef55e9adb 100644
>> --- a/arch/x86/kernel/setup.c
>> +++ b/arch/x86/kernel/setup.c
>> @@ -16,6 +16,7 @@
>>  #include <linux/initrd.h>
>>  #include <linux/iscsi_ibft.h>
>>  #include <linux/memblock.h>
>> +#include <linux/panic.h>
>>  #include <linux/panic_notifier.h>
>>  #include <linux/pci.h>
>>  #include <linux/root_dev.h>
>> @@ -837,6 +838,15 @@ static void __init x86_report_nx(void)
>>  	}
>>  }
>>  
>> +
> Spurious newline.
>
>> +static void x86_panic_handler(void)
>> +{
>> +	if (console_trylock()) {
> A comment here would be very helpful.  Even with the changelog saying "if there's
> no console", as an unfamiliar reader of console code, I have zero idea why being
> able to lock the console is an effective test for no console.


Agree, will fix in v3.


>
>> +		console_unlock();
>> +		safe_halt();
>> +	}
>> +}


Thanks,

Carlos

