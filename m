Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1232814AA9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744764868; cv=none; b=b4IxPpaN0tPWs6tlrrxGPKGtkVUXaGHDCjjaSJ9lhFpdXpSp4t68r1YUCNACbumuii5BQUt/hzZ1Th3+FHKXVzDwXqDNFiPz8fEIcShcLJ7pEuoN+FqK1mqbvl5etvAwr2B31mVP+nnfRjuixqRbnFvLNgu9XD9Q9ETTgiMauug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744764868; c=relaxed/simple;
	bh=0DB9C/RmNnOPA8X5ZtAvYqG6oppLD/JPSRzIsHd4FS4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZCIwGURizozsNC9bTprhXi2TNi2VDaFJszaCjOlr/HNkNNvzHp71+Hk8JtnaW/4/0tbJHY9HpZq4xlnnFfV9dBtjGzZYlD4jV67o4om9u4hL7RHmQM56LgzJAvHEFp3vQ4O7mtaaU+VloNtRtUbEw5S5rpTW1Z7wiLhtxG4ml8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fYFpRy3x; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fYFpRy3x"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-86192b64d0bso266839339f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744764865; x=1745369665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fJGViJF+uWQRK77e5JjhDezjNBvHH06RYTYwmv8R2G0=;
        b=fYFpRy3xl3w/LKH9jrffamvKayW4+7L6O+XJeLFhl4BWpZFMyqsM/i0TmUjQS1WTt8
         IhHmkUsovQttWjHUAbYPCA3DAruZ9BfAar8YCsmhOf0mlpKgBaXYNIuZxuooM8jXpvU2
         M+JZWjxai4qV5MpaR/edZPbJGTlZIAq/R/h5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744764865; x=1745369665;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fJGViJF+uWQRK77e5JjhDezjNBvHH06RYTYwmv8R2G0=;
        b=Mfa5q2zUN9wT/NbgTVYPFyy2Q3mtf4cmuAqfG8FQ08r46gc6WVqIfA3CF409IzlvNq
         PTK64u0hpDcakj0WfdTa69nFlP0RNarJhygDmrkAptB9fzgiRI8ZHQhzNkIFxklyUDAy
         xZYqzSMsUBXjnnrqGbZcTpwXUuw8TRwjSgtTP1glFO0fkvBHsXn6+hnIBs3xfKN3+VP8
         AAqpNVczT942g9J+SFZ6cA21RkR60AjY0SRpXJCR/EVFEKRTtzOlBgxFLZcfVHP+Mgjn
         ydbhR+qQsMR4CPsSUVMPd4p+5xw7Bh691DtS9j/ybF/K4Ug0ObS+IA7fPGctrYywCuFn
         IIEw==
X-Forwarded-Encrypted: i=1; AJvYcCWVL2K7AJTUHJSaLIr22kWkx/9pg44dSKT8STazujeCBaBgjBVvglI0S70gpipx+Mn2ercJnAhoMIzPo/8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn5dv341OwclaQ92gNkMswrWp8g1jL/igyvXmTAc+pbtPJX72y
	pRq9JHa1JHQoGnW3NW3ExhE0wtcynQVnd/vgm+fFiO52XtgWCivg+w7xAYQapis=
X-Gm-Gg: ASbGncsPfkxSbxxhS2MSjEL9IEcSzPHeLME/FBKH4wANSduC2rIYHZORo6PxDJfhixh
	oHqK5cxnUfevKrxQECt9JjhbXelmoKjRYjzNsBQORmJsv8VfWx/3hzUjaSLXc/Erf1MqDtY+6bb
	JwOJ7IFWxGOX/rbhNOUYUuEqqxH76bhHgidYxJS8dzfZNnSs3FSc0zny4GC0BojiwoLbHM3MJb4
	iXD6WdJGk7mWXSXQJ2oJtRPnEgvhBoTV5MkYmVGE0zM03fjRPKbam0ju6hiYJnibe/kWiRb5jMu
	e6bmtEEkq5NMgO1kguz/XYl0Cv/zv0pjX6wNyqYorERLjcgixCAgjFZYhyd5Sg==
X-Google-Smtp-Source: AGHT+IGyn1g4+5/Q5ZJ2gIxa8GRVRY+k0REBOWJY1vTxCnuKXgoVUlQNsfa3QeNOcGiovjoUCzceqg==
X-Received: by 2002:a05:6602:3f03:b0:85b:482b:8530 with SMTP id ca18e2360f4ac-861bfbf4c91mr191977539f.2.1744764865074;
        Tue, 15 Apr 2025 17:54:25 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8616522ddf4sm273115939f.5.2025.04.15.17.54.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:54:24 -0700 (PDT)
Message-ID: <a640e6f0-075d-4af7-a26f-293c1a9d4ceb@linuxfoundation.org>
Date: Tue, 15 Apr 2025 18:54:23 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: Borislav Petkov <bp@alien8.de>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
 "x86@kernel.org" <x86@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
 <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
 <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local>
 <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/15/25 16:29, Shuah Khan wrote:
> On 4/15/25 16:17, Borislav Petkov wrote:
>> On Tue, Apr 15, 2025 at 01:06:49PM -0600, Shuah Khan wrote:
>>> Does your arch/x86/realmode/rm/pasyms.h has reference to sev_es_trampoline_start?
>>>
>>> The one in my tree has it.
>>>
>>> arch/x86/realmode/rm/pasyms.h:pa_sev_es_trampoline_start = sev_es_trampoline_start
>>
>>
>> # ./tools/testing/kunit/kunit.py run --arch x86_64
>> ...
>>
>> [00:15:36] Elapsed time: 58.840s total, 2.096s configuring, 53.170s building, 3.487s running
>>
>> # cat arch/x86/realmode/rm/pasyms.h
>> cat: arch/x86/realmode/rm/pasyms.h: No such file or directory
>>
>> Could explain why I don't see the issue...
>>
> 
> I see arch/x86/realmode/rm/pasyms.h on my system. It is a generated
> file from arch/x86/realmode/rm Makefile
> 
> Here is the target information.
> 
> REALMODE_OBJS = $(addprefix $(obj)/,$(realmode-y))
> 
> sed-pasyms := -n -r -e 's/^([0-9a-fA-F]+) [ABCDGRSTVW] (.+)$$/pa_\2 = \2;/p'
> 
> quiet_cmd_pasyms = PASYMS  $@
>        cmd_pasyms = $(NM) $(real-prereqs) | sed $(sed-pasyms) | sort | uniq > $@
> 
> targets += pasyms.h
> $(obj)/pasyms.h: $(REALMODE_OBJS) FORCE
>          $(call if_changed,pasyms)
> 
> The key is how and why this file gets generated and why the reference
> 
> pa_sev_es_trampoline_start = sev_es_trampoline_start
> 
> is added unconditionally even when  CONFIG_AMD_MEM_ENCRYPT is not
> enabled. I think the logic should be fixed to take AMD_MEM_ENCRYPT
> enabled or disabled into account when this pasyms.h file is generated.
> 

Okay - I think the logic to extract symbols to include in pasyms.h
will have to take AMD_MEM_ENCRYPT enabled vs. disabled into account.

running git grep sev_es_trampoline_start in arch/x86/realmode/rm shows:

header.S:       .long   pa_sev_es_trampoline_start
trampoline_64.S:SYM_CODE_START(sev_es_trampoline_start)
trampoline_64.S:SYM_CODE_END(sev_es_trampoline_start)

All of the above are under ifdef AMD_MEM_ENCRYPT conditional.
Even if pasyms.h is generated sev_es_trampoline_start should not
be included in pasyms.h if AMD_MEM_ENCRYPT is disabled.

thanks,
-- Shuah

