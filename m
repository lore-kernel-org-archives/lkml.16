Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CAD1537C6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867850; cv=none; b=qFORlJ83jlWfE6A7WX4rMUpG3QwqxYJPwI4MYJq/PIN3c+uXYCnSln9F40YU02CFPBCyVC/N5axlrSa76YP9QWLoUUgU6y1iwnz1MxJOh5IXq7FTujm/rsM35sT6SczBljuL4e933/+Y7ENsuzQQ4CdnJUKCxSMY46Ild2F8s38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867850; c=relaxed/simple;
	bh=YKDeW11AafSvP1S5bLtUU51PrNmu8k4AtC4aRRuU9aY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YKj38MnE2zFxFM2foP73UQetGhJrTJ0mwXbTAKns65cU0INOG077bE4kRZJYZkXGteO953Zo8va6lPsCjyBOO6gCG6QH5N0kkuWsvcPB5oOqtGg6o4yHqpxikSukcZc3N07lLfnZIQXrLIoDEAwkEwghSfXOdqh28Wu4Fjd6Ul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GqmMFWJe; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GqmMFWJe"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so351461f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748867847; x=1749472647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9yVw6Fc7CS6YcqGAaLjq3r7AkWte6A3trEa+uiPIbmA=;
        b=GqmMFWJeuKTnKSm0MdpivAe0Ih/tVYJVVvkUn1JEgFdfP/VocFY2/rsHQHmqhem0uA
         EHdhmDTpRaNgo4wsVdJIxcuGSCmbq0fdWt+8BwbEfKasWKf5pvGskIdS93nyqdYhkNTv
         SgUhZMyHj3ea1AAtJPtRuMzKqbRXNRIksjOq/z0posFZUcStzpz2MbPSeCVqtZjcchcA
         Hb4KiO+jQZnlN43BGz0DRXgEibb1pAI5/sNkC1ukxDpNUUfEo46c1fwvEYAZwHoRXD8R
         NNlR6mzUUJlEublHnXufJEWSiU5lTIHBvibkEzNoEIv/jFaXmZeP3nwNV6/CKnat8YFa
         mYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748867847; x=1749472647;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yVw6Fc7CS6YcqGAaLjq3r7AkWte6A3trEa+uiPIbmA=;
        b=VkKB3DUG9OQwgUMgIBjrbY95YU4tQH1G9nBOBlHALZ5swv3HksFK6Iq5s3S80LDHPh
         bkyFv6yJDxYfOri4ax5t5Abuqzx0oOhR7tgbkaMGUaDe99F3Yfh/7MwHugR3bNTDCMoG
         tJndMs+539IW1QPQ11dc1Ww08bEW9BoqOOPxm7JqWRnAdcsEYVHo7MvedXV4UAQUJweH
         JnvWGys2ncWNcWrXkN6lKTs35VXu2GLtnUgYB0+SHK1vp0/cQPs/Sy9ZLf3P9eNSC910
         4HILLFCFaUicWXb50xGWt4yv8B9sYYUNpxVOF5AFD44g+n458Tb1xb3iCT5KKO3UqYEj
         RlYw==
X-Forwarded-Encrypted: i=1; AJvYcCVIJcnclGrviEdq71wYuatWIkVoGCaNSL+IgjQH+G277bydRChMMAEgBYyR5ttPSMJYwXAW5gASjzf4fzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvtkrUVsM2t0kLBwaLP175utMi8Xy/Xgq/rElxQ+pGgv5YT+ae
	jUxeLTQduu1SysAuZA4J4R1tkVfMrwDYhBW3RosglYfEBHMmuKEClHbPwtA5mE5il8PMS6i7VCm
	XbMBB
X-Gm-Gg: ASbGncucllwH4hA3JnhR3VYXQXUGXO2UPTnkQvhZ5SmoAvk+UuA16E8YLYuTrh4yQ4n
	yhaoT/1B7hhjdjzWXm3sxPHHb5OK8vWjpSZIMQti/IYQBJPNzh1OtvKMHpiWbUawQao5RFcwKzi
	2lR1d8su2CMWzX856LmM2HjeIdNu4OgGdXqKEUdvzusq9RAyA6xWfZVqsYKdQGr7FpfxLPbFkjR
	puoEYGsZOw5SsKJdg6hveDf4m0QO0MChV1fcb804/X0UqZwAN2iPPHB+mKwrs1+rRWR5EjJ8RKL
	DSaVLKcqs+4MdFqhV0HvyEGmBiiPuPFQJfhxAkdIjeMQ+d1yZApaldv9
X-Google-Smtp-Source: AGHT+IGKZSaPNp1H1mkb24jR8DlLHDZ5hTvjRfceqNO28U0fg5tpUTq2P39z9z8g/eq2AXuuVMPlzw==
X-Received: by 2002:a05:6000:144f:b0:3a3:65b5:51d7 with SMTP id ffacd0b85a97d-3a4f7a72d8bmr10334197f8f.26.1748867846661;
        Mon, 02 Jun 2025 05:37:26 -0700 (PDT)
Received: from [192.168.0.20] ([212.21.159.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7414fsm15077252f8f.55.2025.06.02.05.37.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 05:37:25 -0700 (PDT)
Message-ID: <451ac5ab-b5e6-4c01-89d8-4044d0cbc912@suse.com>
Date: Mon, 2 Jun 2025 15:37:24 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/32] x86/boot/e820: Standardize e820 table index
 variable names under 'idx'
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 David Woodhouse <dwmw@amazon.co.uk>
References: <20250515120549.2820541-1-mingo@kernel.org>
 <20250515120549.2820541-18-mingo@kernel.org>
From: Nikolay Borisov <nik.borisov@suse.com>
Content-Language: en-US
Autocrypt: addr=nik.borisov@suse.com; keydata=
 xsFNBGcrpvIBEAD5cAR5+qu30GnmPrK9veWX5RVzzbgtkk9C/EESHy9Yz0+HWgCVRoNyRQsZ
 7DW7vE1KhioDLXjDmeu8/0A8u5nFMqv6d1Gt1lb7XzSAYw7uSWXLPEjFBtz9+fBJJLgbYU7G
 OpTKy6gRr6GaItZze+r04PGWjeyVUuHZuncTO7B2huxcwIk9tFtRX21gVSOOC96HcxSVVA7X
 N/LLM2EOL7kg4/yDWEhAdLQDChswhmdpHkp5g6ytj9TM8bNlq9I41hl/3cBEeAkxtb/eS5YR
 88LBb/2FkcGnhxkGJPNB+4Siku7K8Mk2Y6elnkOctJcDvk29DajYbQnnW4nhfelZuLNupb1O
 M0912EvzOVI0dIVgR+xtosp66bYTOpX4Xb0fylED9kYGiuEAeoQZaDQ2eICDcHPiaLzh+6cc
 pkVTB0sXkWHUsPamtPum6/PgWLE9vGI5s+FaqBaqBYDKyvtJfLK4BdZng0Uc3ijycPs3bpbQ
 bOnK9LD8TYmYaeTenoNILQ7Ut54CCEXkP446skUMKrEo/HabvkykyWqWiIE/UlAYAx9+Ckho
 TT1d2QsmsAiYYWwjU8igXBecIbC0uRtF/cTfelNGrQwbICUT6kJjcOTpQDaVyIgRSlUMrlNZ
 XPVEQ6Zq3/aENA8ObhFxE5PLJPizJH6SC89BMKF3zg6SKx0qzQARAQABzSZOaWtvbGF5IEJv
 cmlzb3YgPG5pay5ib3Jpc292QHN1c2UuY29tPsLBkQQTAQoAOxYhBDuWB8EJLBUZCPjT3SRn
 XZEnyhfsBQJnK6byAhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJECRnXZEnyhfs
 XbIQAJxuUnelGdXbSbtovBNm+HF3LtT0XnZ0+DoR0DemUGuA1bZAlaOXGr5mvVbTgaoGUQIJ
 3Ejx3UBEG7ZSJcfJobB34w1qHEDO0pN9orGIFT9Bic3lqhawD2r85QMcWwjsZH5FhyRx7P2o
 DTuUClLMO95GuHYQngBF2rHHl8QMJPVKsR18w4IWAhALpEApxa3luyV7pAAqKllfCNt7tmed
 uKmclf/Sz6qoP75CvEtRbfAOqYgG1Uk9A62C51iAPe35neMre3WGLsdgyMj4/15jPYi+tOUX
 Tc7AAWgc95LXyPJo8069MOU73htZmgH4OYy+S7f+ArXD7h8lTLT1niff2bCPi6eiAQq6b5CJ
 Ka4/27IiZo8tm1XjLYmoBmaCovqx5y5Xt2koibIWG3ZGD2I+qRwZ0UohKRH6kKVHGcrmCv0J
 YO8yIprxgoYmA7gq21BpTqw3D4+8xujn/6LgndLKmGESM1FuY3ymXgj5983eqaxicKpT9iq8
 /a1j31tms4azR7+6Dt8H4SagfN6VbJ0luPzobrrNFxUgpjR4ZyQQ++G7oSRdwjfIh1wuCF6/
 mDUNcb6/kA0JS9otiC3omfht47yQnvod+MxFk1lTNUu3hePJUwg1vT1te3vO5oln8lkUo9BU
 knlYpQ7QA2rDEKs+YWqUstr4pDtHzwQ6mo0rqP+zzsFNBGcrpvIBEADGYTFkNVttZkt6e7yA
 LNkv3Q39zQCt8qe7qkPdlj3CqygVXfw+h7GlcT9fuc4kd7YxFys4/Wd9icj9ZatGMwffONmi
 LnUotIq2N7+xvc4Xu76wv+QJpiuGEfCDB+VdZOmOzUPlmMkcJc/EDSH4qGogIYRu72uweKEq
 VfBI43PZIGpGJ7TjS3THX5WVI2YNSmuwqxnQF/iVqDtD2N72ObkBwIf9GnrOgxEyJ/SQq2R0
 g7hd6IYk7SOKt1a8ZGCN6hXXKzmM6gHRC8fyWeTqJcK4BKSdX8PzEuYmAJjSfx4w6DoxdK5/
 9sVrNzaVgDHS0ThH/5kNkZ65KNR7K2nk45LT5Crjbg7w5/kKDY6/XiXDx7v/BOR/a+Ryo+lM
 MffN3XSnAex8cmIhNINl5Z8CAvDLUtItLcbDOv7hdXt6DSyb65CdyY8JwOt6CWno1tdjyDEG
 5ANwVPYY878IFkOJLRTJuUd5ltybaSWjKIwjYJfIXuoyzE7OL63856MC/Os8PcLfY7vYY2LB
 cvKH1qOcs+an86DWX17+dkcKD/YLrpzwvRMur5+kTgVfXcC0TAl39N4YtaCKM/3ugAaVS1Mw
 MrbyGnGqVMqlCpjnpYREzapSk8XxbO2kYRsZQd8J9ei98OSqgPf8xM7NCULd/xaZLJUydql1
 JdSREId2C15jut21aQARAQABwsF2BBgBCgAgFiEEO5YHwQksFRkI+NPdJGddkSfKF+wFAmcr
 pvICGwwACgkQJGddkSfKF+xuuxAA4F9iQc61wvAOAidktv4Rztn4QKy8TAyGN3M8zYf/A5Zx
 VcGgX4J4MhRUoPQNrzmVlrrtE2KILHxQZx5eQyPgixPXri42oG5ePEXZoLU5GFRYSPjjTYmP
 ypyTPN7uoWLfw4TxJqWCGRLsjnkwvyN3R4161Dty4Uhzqp1IkNhl3ifTDYEvbnmHaNvlvvna
 7+9jjEBDEFYDMuO/CA8UtoVQXjy5gtOhZZkEsptfwQYc+E9U99yxGofDul7xH41VdXGpIhUj
 4wjd3IbgaCiHxxj/M9eM99ybu5asvHyMo3EFPkyWxZsBlUN/riFXGspG4sT0cwOUhG2ZnExv
 XXhOGKs/y3VGhjZeCDWZ+0ZQHPCL3HUebLxW49wwLxvXU6sLNfYnTJxdqn58Aq4sBXW5Un0Q
 vfbd9VFV/bKFfvUscYk2UKPi9vgn1hY38IfmsnoS8b0uwDq75IBvup9pYFyNyPf5SutxhFfP
 JDjakbdjBoYDWVoaPbp5KAQ2VQRiR54lir/inyqGX+dwzPX/F4OHfB5RTiAFLJliCxniKFsM
 d8eHe88jWjm6/ilx4IlLl9/MdVUGjLpBi18X7ejLz3U2quYD8DBAGzCjy49wJ4Di4qQjblb2
 pTXoEyM2L6E604NbDu0VDvHg7EXh1WwmijEu28c/hEB6DwtzslLpBSsJV0s1/jE=
In-Reply-To: <20250515120549.2820541-18-mingo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/15/25 15:05, Ingo Molnar wrote:
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: Arnd Bergmann <arnd@kernel.org>
> Cc: David Woodhouse <dwmw@amazon.co.uk>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Kees Cook <keescook@chromium.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/x86/kernel/e820.c | 114 ++++++++++++++++++++++++-------------------------
>   1 file changed, 57 insertions(+), 57 deletions(-)
> 
> diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
> index 806d69ca09af..3ee266673fee 100644
> --- a/arch/x86/kernel/e820.c
> +++ b/arch/x86/kernel/e820.c
> @@ -75,10 +75,10 @@ EXPORT_SYMBOL(pci_mem_start);
>   static bool _e820__mapped_any(struct e820_table *table,
>   			      u64 start, u64 end, enum e820_type type)
>   {
> -	int i;
> +	int idx;
>   
> -	for (i = 0; i < table->nr_entries; i++) {
> -		struct e820_entry *entry = &table->entries[i];
> +	for (idx = 0; idx < table->nr_entries; idx++) {
> +		struct e820_entry *entry = &table->entries[idx];

nit: Since the kernel supports gnu11 since e8c07082a810f what's your 
take on defining the variables inside the for loop?

>   
>   		if (type && entry->type != type)
>   			continue;

<snip>

