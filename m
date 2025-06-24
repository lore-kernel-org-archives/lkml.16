Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396522BE7BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772915; cv=none; b=S0jwqj7USRGUePQ3Wue+mTSMrxfyiNMsb9ucieLgx15bASC7j47FQHl0ZFjUoN5iQuh5eXfg5RIHZLqOX0WqwXP7l+SAQqcq+EbQzzbs2UH+PjIxNOep4PNgMGi0tWUFl+9DkYw98LKah7n30jCCIoBlTYg9I3JBKU7zfRfYD3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772915; c=relaxed/simple;
	bh=E3V++5MfDVggiII4WpQCK+D0VM0vjMcbOBqOELEWJKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oVoamj2MeiNaJc8BnLP339JeQlJoT9/kJeXMZEPDX/Y4ndZ8QJ+PKyhNpCVlMzJUFp27FeeuEIoZzSyDDvSO7xk4deTyQNMx1fa+XFc1ROaFyXzLVhFIeULCEIdRwbuxkE9U9J+79fAD/oXeBZQRbA4TCqMM355oLKRdK5u8EBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=W3hE5vYd; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="W3hE5vYd"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-234b440afa7so5686055ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750772913; x=1751377713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H99QKyWxgJFviR9gCoeMBJLsUrcpUyL0OAKfLepv64s=;
        b=W3hE5vYdLE3hbXF2zm8+AHWeJ3K0e0S5x6Fi4GDAlG1h7GITDqzyhhpxp/DHffjlfk
         CdtQzCd6F3NL9pSQnlvyg6wCyaQ/EAuV7x37L2vpBgWilY+AX4hlC/aB9//xHnWB07Q9
         6vN67oAb6dZm+v2DveOxPlMps0/ZuGhqjFZDVRuwCjH03cXvFT8Cpdubc1gWGfAUoJML
         2o0Kuh88E6ESIrfbpZ21V22AdIdH0lzXbY/NAsnV42fkQtQ+8nSkv35ufJNRu9pKsMhY
         QdA+704me7H65hQFpwMAcfL/yOJ3OMYAdv0Jf8bcM+zM44J6ZLPCZcVgxnWAyESVxcK2
         eWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772913; x=1751377713;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H99QKyWxgJFviR9gCoeMBJLsUrcpUyL0OAKfLepv64s=;
        b=kOxDd/jHv9z27vEzAACInttG6bTr9Pac83Zc/4jeVQw1+7H6wrA91DY7sYylSynCVS
         fibbBlNVVjDCmLeq+EJ8ZHpZIoBvpDVoNoD3zYwRTLKO2VrjXzSmCNolmvyWtBvKQ4SA
         xmCOIia0owk6cadQrUHCbQog0w0x/x2QDo+PAlUKkBVSAcCbaWyBpQ1Rs7rST8kQeF4F
         GWry0YsdGoR5jL0/m9eqqYtfQsL5E1x+1/OeN1pxJvZriwvQculGQ232tXwDZ1Hx0CSA
         2VGBhyUP6c3uDr1CL9klZgxTVPt97uJqvCPw9nRMDq1tiAEcAvEmGm5zS0Pry0T2G88p
         qtyw==
X-Forwarded-Encrypted: i=1; AJvYcCUU3Tcnnij9eNylJmbFd7gsJ6ccCh32ZMZBbOMpMLXiLMgWPJ2F71VLEUIssIbclixwL2xH4Qjc5JyMOX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIu79wec5sW/sHAYbt/3qLdXNl5kBfABmZukRiipGo3qIhxXz1
	dEZ9Dx7KXI2mYw3NO3bOWVq1UlX8aAU8HZIYrs1s+ynrAhgBuvcUAz8vzF1BAdxc6Zg=
X-Gm-Gg: ASbGncvNfvviNAxX2Y18LW7FX2j4F35MyEpZCuSv1PO6SFi4gc7YaEOQ3R2Oz1Mdwcm
	CE50s1CWQPFlx3+YNgHXriN//n82N6PvbiXvr1Q+IsMwEY25fSHecXlwj4vtwgPcOf36ET9JCvq
	+pT1fZonctaXtt9p30zFGy0hafEBmkBxwsNMpTdTia7iMl/sdwjQ6/fXVE+6F+cuRlapzC2UCm7
	FAkx59xUSA/7LtQtkXFPlG7AYWH94O0s6T+S0+9kSFYl19T97F8Sos9r47bxveQMErf17c6HgEX
	aq17/53f1My9P8CnBrh9Xr3FAO2Echbse9KYs74EJUZN6aUxSTzKTX1nMj27r1W5qzp+57wiWGv
	bHM0bXJgG2pMUMOZM4wVpPt6CaCtjmfQ=
X-Google-Smtp-Source: AGHT+IH3VVcKlPmQAwhvEtRsqViiUOznLNr6sCLhqQcLQB4C7EhcexsF4UBAe4n2C1iZkbDQyg+oRw==
X-Received: by 2002:a17:903:4b30:b0:234:8c3d:2912 with SMTP id d9443c01a7336-237d96b6361mr256983115ad.11.1750772913474;
        Tue, 24 Jun 2025 06:48:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d87391e5sm106566055ad.244.2025.06.24.06.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:48:33 -0700 (PDT)
Message-ID: <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
Date: Tue, 24 Jun 2025 15:48:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
To: Nam Cao <namcao@linutronix.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 Alexandre Ghiti <alex@ghiti.fr>, bigeasy@linutronix.de,
 clrkwllms@kernel.org, rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250624131730.XqPd1HUR@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/06/2025 15:17, Nam Cao wrote:
> On Tue, Jun 24, 2025 at 01:37:13PM +0200, Clément Léger wrote:
>> On 24/06/2025 04:09, Maciej W. Rozycki wrote:
>>> On Mon, 23 Jun 2025, Palmer Dabbelt wrote:
>>>> I'm kind of split on a Fixes tag here.  One could argue it's a regression, as
>>>> having interrupts disabled during exceptions is going to cause all sorts of
>>>> performance issues for users.  Seems a bit risk to just backport, though...
>>>>
>>>> That said, if nobody noticed then it's probably a good sign nobody is really
>>>> paying attention and we should just backport it before anyone notices...
>>>
>>>  Oh, someone did notice and it's not only performance, cf. 
>>> <https://lore.kernel.org/r/alpine.DEB.2.21.2501070143250.18889@angie.orcam.me.uk/>.
>>
>> I also had a series which was doing so for misaligned accesses handling,
>> but after discussion, it was not ok to do so.:
>>
>> https://lore.kernel.org/linux-riscv/20250422094419.GC14170@noisy.programming.kicks-ass.net/
> 
> If I understand that right, exceptions from kernel should be treated as
> NMI, so that lockdep can tell us if exception handlers touch locks.
> 
> But (conditionally) enabling interrupts does not lose us that benefit. It
> is still considered NMI by lockdep.
> 
> Unless I miss something, the patch is fine as is.

Hi Nam,

Yeah indeed, providing that all traps handlers really are reentrant, I
think it's fine.

Thanks,

Clément

> 
> Best regards,
> Nam

