Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F357C1CB9F0
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185666; cv=none; b=ABRvcA1ohU3odbUJGJAMUMovbarxjsXJ6F9u+2B704oOlGLm+0mOT6hfzPq/kkIUEABVzUm/3skYNGLhf1rCsE/vPerJixyYKgYzqJTFIWaB7BaOFifCMgyTjnC8w+WyEN1b9fq61XiUldFm7Q+Bkcv4JvFPRnoHBl0qhiHWeRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185666; c=relaxed/simple;
	bh=ENGZSMU0/gdzylV1hSHht7s2U/D2bK4tIYzRYtsw0fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LNR/BtyFUwuuOnEIPeRRxAlVUxbHdaxu9lb/F5Q1roDksWNPY9vp1F+oKbIvHeCAM2/Iu2WqYzAp4meO/OTy4gwIfcW7DfYjuP+PGnpI5v0P2ht4cOIN8b0ca2EwzbMb0jtjeNlXsP1HZLWrllcZ5ThXBcBNa4speA5QkzaT3+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=oyhnvzay; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="oyhnvzay"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso2896605e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739185662; x=1739790462; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcHB73ffT5s0AE0xa0QGrDN1xMNzDUaF8xFJ8U3Bt3g=;
        b=oyhnvzay+dE9Rlks8/vYnmC9tPHJUoVOI5ya60xXRz0pgLmpJPe/NKptVrPNieIAZT
         Zo7Oiynzls7Wp5u3Zkq0lWnZ5iU2btaGRpssoVCLv7ZgCHXC1TfNnwzNynHBhvrhme94
         ah2tHsbpCSJOYDqQGIREiZoYLhXrwf+gVQgPBnK3rThlfgmYwqAjBq8OBGf1pghi3EmX
         jPeXh6IFu6Ri/AOxbVWOtR4JNyZ5qD1AHAqE80W7hYCTP1ZQNxKxX0u78bdfJ/XbOwcb
         NR5+JyxNYOs9TtBI/SNocZVUmHJYzHFJ3u2G7EmsdYybQJIXooprE6gTd4cGxd/TZV3D
         J/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185662; x=1739790462;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcHB73ffT5s0AE0xa0QGrDN1xMNzDUaF8xFJ8U3Bt3g=;
        b=s2B3zz5rFLeilzP96q8EW3RHcgRrEaJDusizQersktDK6N05c5qL/sUaDYa9RplW1C
         qwdyJMVVIsP1v0Uz0TlZ6jGbb9izvpawMFCWL2eZ1YyKQHT7y+rV9e9kA8Hc48rw6HT2
         pOl6I7aRw/eN6go8SwJGY8yHQ1ydvfrISHJ9PuV6Qkx9Blos9ckOB1ydeZDQbHvrr1zI
         sApBAmjS/sVBJfMR5JHbKm+gkHYovCpFpcp1TAmJUmmmIszdfmDXPSup4HqrG/s9R4g9
         Bgc9yzcqzDrF7el9dkTuMIaFBgH5bS5Us+n937GinEiImyIhWw1YjF2/dEyz7RJA+JvC
         nO/w==
X-Forwarded-Encrypted: i=1; AJvYcCUmuHH67eIRmKLF+Crv8fzph40M2Urg2ZtRLomUR6wQJRHV9fTeB2pjNwDu2mXjjz8DM0arOA82rIt+wt4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKKp+Idl418VaqxbSia1PzNpgpBkXRmN2jGdFvbIEG45kXHZ8P
	Oz38EBWUlF04na4fXzE2rUtcx6mdpyizNbG5KQxGOcVVuWn5sUdocsmSwpnvojkNrxP2ArBNI9/
	d5kA=
X-Gm-Gg: ASbGncvSBb14LmzJVaq0fRdXr6QqfuBhY7Gtiw49+jthVVYPvwNtF2I8yEn3WSR6uz7
	FrEKAKf5P5N7ubM6MY6gv/IAkh51f120DOtw+K52qyvVWwzad+9qAOWYnugJX5Sty6rBpJ8oyw4
	hxA6TDYf0mY6lijleOXyG9qxOt7BD0qqsdZoo35g36a4Uw5nB0bCrZSjLf61VCksX9rcmUEYfC2
	xxm58lKWuS2m/ZHP7dUG3IOI7vI0cd3mHBeUUpLbc1keJWQY7DllWxL/QGkTsuJZDOTpoU8DM8i
	8k+NtlEOFFJkO5J7hMF2LpFDjncELQgw5xxyapiZk9EvOU1tymjnbQbW7Yvv
X-Google-Smtp-Source: AGHT+IFC+YE4NfL8WdwV1YYtkpdynkF0lQfZMpH3kydIXjZHR6BEayTNuzPgvcEU43pEpA5bptugNQ==
X-Received: by 2002:a05:600c:3503:b0:434:f817:4492 with SMTP id 5b1f17b1804b1-439249cddf9mr123818595e9.31.1739185662164;
        Mon, 10 Feb 2025 03:07:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d96530fsm174550235e9.19.2025.02.10.03.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:07:41 -0800 (PST)
Message-ID: <c6f98a70-b1c7-4955-bf5d-546e4563cf1c@rivosinc.com>
Date: Mon, 10 Feb 2025 12:07:40 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: Prepare for unaligned access type table
 lookups
To: Anup Patel <anup@brainfault.org>, Charlie Jenkins <charlie@rivosinc.com>
Cc: Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 jesse@rivosinc.com, Anup Patel <apatel@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <20250207161939.46139-18-ajones@ventanamicro.com> <Z6ax7B45OsGerjfA@ghost>
 <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <CAAhSdy2tjOE5aajzydFs8A_drHdBSbWrYTX3CX4e7B6Rm107Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/02/2025 11:16, Anup Patel wrote:
> On Sat, Feb 8, 2025 at 6:53 AM Charlie Jenkins <charlie@rivosinc.com> wrote:
>>
>> On Fri, Feb 07, 2025 at 05:19:47PM +0100, Andrew Jones wrote:
>>> Probing unaligned accesses on boot is time consuming. Provide a
>>> function which will be used to look up the access type in a table
>>> by id registers. Vendors which provide table entries can then skip
>>> the probing.
>>
>> The access checker in my experience is only time consuming on slow
>> hardware. Hardware that supports fast unaligned accesses isn't really
>> impacted by this? Avoiding a list of hardware that has slow/fast
>> unaligned accesses in the kernel was the main reason for dynamically
>> checking. We did introduce the config option to compile the kernel with
>> assumed slow/fast accesses, which of course has the downside of
>> recompiling the kernel and I assume that you already considered that.
> 
> The kconfig option does not align with the vision of running the same
> kernel image across platforms.

I'd would be advocating to remove compile time options as well and use
another way to skip the probe (see below).

> 
>>
>> Instead of having a table in the kernel, something that would be more
>> platform agnostic would be to have an extension that signals this
>> information. That seems like it would accomplish the same goal and
>> leverage the existing infrastructure in the kernel, albeit with the need
>> to make a new extension.
>>
> 
> IMO, expecting an ISA extension to be defined for all possible
> microarchitectural choices is not going to scale so it is better
> to have infrastructure in kernel itself to infer microarchitectural
> choices based on RISC-V implementation ID.

Since adding an extension seems quite unlikely, and that a device-tree
property is likely DT centric and not applicable to ACPI as well, was a
command line argument considered ?

Thanks,

Clément

> 
> Regards,
> Anup
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

