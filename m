Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C2A1B87D9
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750765047; cv=none; b=ejRlv1T4UA76TdwiVZSjH91dzzIZmw0CXmX+l7LLAnejDWiQWkJGXvdFQYiS3ggbfghoDER26elBh4t/Id+IhCsRctEUons7lLbBrWIevWbC2SDIW4tx14Wkxsb9l8h1GDswU54HulGuoUK2H754LdZbqPs3Gfn81d5Ehqk48nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750765047; c=relaxed/simple;
	bh=xiCQ0j/wFlDxcAPPdnkKi8/i3QKVab07KRrRPwVR3jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VDJHlz/i9oPB85g1syNsgvddcDbovVpf3rCrhfiecNhku4szI3F0w0ZaeIzrPpkK4BiubwxV1kN74q+bx4BQRNSc/rddx2e4wb+hjla8qzDG0qjn5mclFOhd0Shlcyz15ZOjXEbOfn1n7dS+pL80rTYNcWktiCG5OJJvwFyDHEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=suMIhtOU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="suMIhtOU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso4234799b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750765045; x=1751369845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v1BS57X/WG0jVySO8QMdoFZrcIzR1oh7Qce1t6ebg7Q=;
        b=suMIhtOUNtcwUKFwObDJ5JE2iPQESdyDnhtvgvuRoxLEFijGxzRkRmUp7ge/4Ynw6e
         jfHYp7/odbLxxhyqn3TJltM2Xr1fqHu6yianNBmMpVfrXg5YES1nJ5UkL1dqjccIxBbE
         e8cS8AvhOILRWrypqDk3INsUl6sb6R0h7ORKuFdv7TfNP2A1NngVv/F0jhbi1/6js4HI
         UJLUusKFfAqshf3Zx30w4KaAikqZHMKiLwNjUdaMc19YnbrHqmiCAtB1/9zYcXyx3nIX
         SqYoXqPsum61OzxFz3e7x18QLaxGPt0VIfRGtgG0hTL5bxIkh1gPptkMF/yZ4nMt5arC
         4m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750765045; x=1751369845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v1BS57X/WG0jVySO8QMdoFZrcIzR1oh7Qce1t6ebg7Q=;
        b=FBCwlI613NwVRNVmORL5+pK0XUxP5R1V/IgNeL6FQ9fPkR425JFZ+ImaL1NNCmAsBc
         BMVZaesJSk6UAous8w05D3xxG6nksPfFEbb5ZKUCNHow/d9FGy7ipR7BqtGqF/WfCz3Q
         9Y2gZZXTwjznuiY9BtjEtnfh5Hd8XL/rarhxxZDxsFgIqHXFeq7t9YbN6bF8G3m7lcK4
         Vh+eTrolwm5E2AgmgBcDgWo0HtARf4njEEA/3vBysFIXnm4t0iBLpECOo3FfGME34a4S
         9WVKDb6iGMSS6eT8ymk0xRK7pEwCMRuDVnr0RqrWbYqXyTleCITinmeWScvR0wqDe4yM
         KNeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo+swOuwXUSUoPEqEb4g9G3H5cpKIJH+W5MfLTv/Uow8vjYcjgXluCIbgRgdUN70cSNlKkaKrYwtccQiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YztMP6onQS1h6ckK/o2MliBZKk1DG8JBa6/2HkfrgTVEnc9aMCo
	3rR9B2xrk7y5rbh3fXtYGmU5ImpS1vA3JtvRpJ3zGZ+88loghrYvH7y5qyinwNfXM1s=
X-Gm-Gg: ASbGncv+Pv14KnRRtivkDAmGAVPTgVGdiNS+Zp8LcuAmiD2xOUh4xOoIadFgPo1RG89
	/QmhxSNy/X50Pco3UYK/Ir5hOICDlXF6f7IGXi/hEqKh0SsleBgSX9LhbqrAVe/hCL0+GJpu5gA
	wAjgWU3+gajL8fL4GlL4Q0TZRcYm2/bBtcu2BZC0StIgFKRF74xBX9UH2v88kGp7x7e7MGrnAPr
	PxXRD24QjgGT53YsbfoIWW/JBcEuYU//QHr5lJOfjo3F5yaZBjXbvVomXT5WWXGZl3qqflvwF3t
	QVGubN45ACjCC57TSfAbJf3TWtOXMTBS9B6nc21mh8y1nwmZXnxp1655UXeRvjETp8xOz+WX7bp
	VoUORNMpZsCS0cWsQlUcWeWWgXbv/TiI=
X-Google-Smtp-Source: AGHT+IFNZ2hsCqwSWuixPSJ5R8AD8UK1jdLvj9vYQYk6LtP/Xb8JEeiD65LE64qqMpZvResIz21jAw==
X-Received: by 2002:a05:6a00:140f:b0:742:a111:ee6f with SMTP id d2e1a72fcca58-7490d6dc413mr17698045b3a.10.1750765044971;
        Tue, 24 Jun 2025 04:37:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8871954sm1651063b3a.149.2025.06.24.04.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 04:37:24 -0700 (PDT)
Message-ID: <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
Date: Tue, 24 Jun 2025 13:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 linux-rt-devel@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/06/2025 04:09, Maciej W. Rozycki wrote:
> On Mon, 23 Jun 2025, Palmer Dabbelt wrote:
> 
>> I'm kind of split on a Fixes tag here.  One could argue it's a regression, as
>> having interrupts disabled during exceptions is going to cause all sorts of
>> performance issues for users.  Seems a bit risk to just backport, though...
>>
>> That said, if nobody noticed then it's probably a good sign nobody is really
>> paying attention and we should just backport it before anyone notices...
> 
>  Oh, someone did notice and it's not only performance, cf. 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk/>.

I also had a series which was doing so for misaligned accesses handling,
but after discussion, it was not ok to do so.:

https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/

So this series should probably be modified to only reenable interrupts
when explicitly needed, ie page faults and for force_sig_fault().

Thanks,

Clément

> 
>   Maciej
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

