Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1950D264602
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 20:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739219836; cv=none; b=gPQ2KDTWpPBXzVyjeixDB9DGo66Iwc12snXn/eSb3tjX7yvYq7HNR866F9Gp6MSCpOXMaawYkf+2o7HD/3YSbJfiLjXEY5kqXgETYEYttsluh5JOrn1Ktp22Wb6lGVx0lPYtc1SFRiDoknzdZOMPw7bG5v6EqdUFmJAUOr2b/tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739219836; c=relaxed/simple;
	bh=EAObRawXOOGvefLFyL7RIy+Z9TJ8lkUMWO/dX2vb42w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BYqvUUL44qnZaq/QzOBCanXZ8EANec/mTKnPnI+f8GmuzC+en9TMUwHec+IjN3zsEy3APC7ZodZQUMNzzxtSZfZZanyzi/QrgWlN9bmmdgn9dtD38L7oRIXIEBV/M8k8rBjkCGCKz4DOQ80EBWe45YhGp2TYSS6PnSDwBRSjilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=cgLnntZb; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="cgLnntZb"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4393f6a2c1bso10036755e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 12:37:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739219832; x=1739824632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zF8JNEp1p5HATEVRpzQkJmS0WE0xGZZUGSUWwC6nfqY=;
        b=cgLnntZbDYW0h/j9a2G/LtDwm+khY3g88j8DRNY9Hd50lG414MaUHT+MbHbPYjmSIq
         HevLqC1Igg51bgU+cqbnBpU2/ybOOc/2UcnrMszxlIwM/DwGnudhVFTxWWUvML5g24e0
         pS8Tqc2K4kjvyKqI1Q8Q4dw0GuwCYA/ELOlZRhQX3ghv4Ye9MM2XGAIVNo1bwpx5HZka
         E7LZB3pg42oPLj36sWzjKNPoPDIKGF0SBmjs8jUj8nYRWz86Em/l8GlLPExdCBff5111
         eIGFPzIFvhaAF8BDsAYA0ZpjSWXuqteK39BmSJL+0IP4/4n9/1kEjvK5j1+cARhVLEWd
         VCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219832; x=1739824632;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zF8JNEp1p5HATEVRpzQkJmS0WE0xGZZUGSUWwC6nfqY=;
        b=OarwFWTEFQV8D/5Vk2zGR2O4BiI+Bxt1YFHI5ETRTbeYRmBpdkNrLnjvywr69pg9LC
         I5/Tlhe5X9ZQfffk0dOE0D5LTXuHln3TyuYTjHKCaGDVUWyIEZ67E+ArViDeTXFBck69
         kU67CGoALtAHor/1jxA2WmZd0PGBpt+U/3SOpUQdtaqjMfIHpTw+n67/VJXBEa6YL5Gi
         TQifIXVm5Nwm7kgIQZF3euXvKqgCHeUJ+d4xkvXCV0Q6Hw02ORKA7Neu6100ltOOfnbI
         vyC+ieE4GWeHzNDhXMWs6jQEeFGqIvyiz8mjP6fPAasHK9qMyB4YoROjMU99a5qlYPet
         2gZw==
X-Forwarded-Encrypted: i=1; AJvYcCWw4C6Yctx7LBU/xmYl763ATECnXaDNiz631v1nhPrO+NocCNk2lTGgs+MOyc4mFH6Ez6+vDxOuq9QfAhM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQYAqcb62BFGOyVpBGZOQMjXxqCUUF3p8pya0vRZMVy5Pcg1vv
	IbWhFPqz2gnhtQlm5cCt8qj9jDIUywawNTKXm4o6V4Ndxu+sjdFpJb6kLDRBufY=
X-Gm-Gg: ASbGncvoJ8SH16jxElcxlquds8cgXVtU9B+EuxSMYntskZMmvdtyAWSqSouT/Nwbmdd
	PQkocDYe27fpibL+z5BHX6FPEXbg0uA6HT30qY1qrHjoLv+vae6ZmwOQWWQVyqYTPG+Cu2HHaCq
	yT6vk0YFun2pQNE0ZlIyLMY+MAZUi6kl6R6wH/2gYZdUBXlf6zUG3KkNamNAZKWiu1SghucasF2
	Tnr2oEXAnzzXuyW2FuMQg4IvFe6RqznZ/4d03KcRBO8o5Px2NSTQWvgs4LsZx2sLXQOjU0fYnyd
	+A3pIxH+GwTFvamDBQg1SguFKbFkqGN2XA6xLQLTOI1wvmt+6gaI6azEETG9
X-Google-Smtp-Source: AGHT+IEJZFlCvbId46lKW+AZhgUnAKa1SwE6bqkYSfGcKVOn13gxNvfjbBZj3gpbLfDQanR66+Ey4w==
X-Received: by 2002:a05:600c:5108:b0:434:f9ad:7222 with SMTP id 5b1f17b1804b1-4394cec56d7mr6348975e9.7.1739219832219;
        Mon, 10 Feb 2025 12:37:12 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc17e278bsm12255723f8f.48.2025.02.10.12.37.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 12:37:11 -0800 (PST)
Message-ID: <65f48829-56d2-47fc-8f61-074ff122d964@rivosinc.com>
Date: Mon, 10 Feb 2025 21:37:10 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Charlie Jenkins <charlie@rivosinc.com>, Anup Patel <anup@brainfault.org>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
 <Z6o1NCo5nLPwBsUT@ghost>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <Z6o1NCo5nLPwBsUT@ghost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/02/2025 18:19, Charlie Jenkins wrote:
> On Mon, Feb 10, 2025 at 03:46:46PM +0530, Anup Patel wrote:
>> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>>
>>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>>> Probing unaligned accesses on boot is time consuming. Provide a
>>>> function which will be used to look up the access type in a table
>>>> by id registers. Vendors which provide table entries can then skip
>>>> the probing.
>>>
>>> The access checker in my experience is only time consuming on slow
>>> hardware. Hardware that supports fast unaligned accesses isn't really
>>> impacted by this? Avoiding a list of hardware that has slow/fast
>>> unaligned accesses in the kernel was the main reason for dynamically
>>> checking. We did introduce the config option to compile the kernel with
>>> assumed slow/fast accesses, which of course has the downside of
>>> recompiling the kernel and I assume that you already considered that.
>>
>> The kconfig option does not align with the vision of running the same
>> kernel image across platforms.
> 
> I just don't think that vision is realistic.
> 
> I am a proponent for compile time defines because ri ght now we are
> catering the kernel to both microcontrollers and for high performance
> platforms. I am in favor of having a set of configur ations that are
> ideal for these microcontrollers and a different set for high
> performance platforms. This is where the RVI profile s would ideally
> come in, having different configs for different profiles that target low
> performance/high performance.
> 
> Compiler optimizations for extensions are not possib le to do by just
> having these different methods of selecting at runti me. By enabling
> extra extensions like the bitmanip extensions during compilation via a
> config flag we can optimize the entire kernel. It is not possible to
> push all optimizations off to runtime detection.

While this might be true for the bitmanip extension and other extensions
that the compiler can take advantage of, that isn't true for the
misaligned speed probing code. The only meaningful misaligned access
configuration option for kernel "speed" optimization is
RISCV_EFFICIENT_UNALIGNED_ACCESS (which is ironically not easily
selectable since it is under NON_PORTABLE).

Currently all the config options that have been added around misaligned
support "just" allows to get rid of the probing code at compile time and
set a predefined speed. That does not really improve the kernel
performance itself, just allows for a faster boot. That could as well be
supported using a command line option as suggested.

That being said, I agree that some additional configuration options
should be added to enable additional extension support at compile time,
enabling a faster kernel. Having a single image for all hardware is as
you said not realistic but profiles configuration as you proposed might
be the key for this support.

Clément

> 
>>
>>>
>>> Instead of having a table in the kernel, something that would be more
>>> platform agnostic would be to have an extension that signals this
>>> information. That seems like it would accomplish the same goal and
>>> leverage the existing infrastructure in the kernel, albeit with the need
>>> to make a new extension.
>>>
>>
>> IMO, expecting an ISA extension to be defined for all possible
>> microarchitectural choices is not going to scale so it is better
>> to have infrastructure in kernel itself to infer microarchitectural
>> choices based on RISC-V implementation ID.
> 
> How is keeping tables in the kernel for all microarchitectural details
> any more scalable than having extensions that do the same thing? I would
> argue that having it in the kernel is less scalable since it needs to be
> described for all implementation IDs, and all changes require going
> through the kernel review process. Dynamic probing avoids these issues.
> Having an extension has the one-time process of getting the extension
> into something like a profile, but then anybody could use it without
> needing a kernel patch.
> 
> - Charlie
> 
>>
>> Regards,
>> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

