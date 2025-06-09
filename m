Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F70825392E
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465394; cv=none; b=I4g0wS6TS0sYrzYOSbe+O6QTCbOxdcugQikmqcYHwLAM86SG79jUhUFDI6P90w7umD33sakxX9G8vOmG1kiwB8/SbDn34nlllnhrse3am/pEwAKLcCzd+giemzs3diBgq+SG7BdXfbNdvVjURd5j9UTYJZgBQGbTYgRF0stPZCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465394; c=relaxed/simple;
	bh=pdmxugmhakuArB92BuyMupAJAEVurSaI9XZc0MfxAuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rrkil1rV00FNCNtn89XLh4Fkh+9I6w7JaJFYVMrcyJTpY7TC6k9nB6I26rMlNdNMbUxz/K95ODp0M8uV9JlTzuoBeuO656FuhQFtRhnvQhKKcORybwYy+YwDWHqRvCz53ugg/UlcNeVzIV1wCSj9mtiUD2+IXaBkIEIf6imleYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech; spf=pass smtp.mailfrom=neon.tech; dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b=stIN5OWO; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=neon.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neon.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=neon.tech header.i=@neon.tech header.b="stIN5OWO"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad93ff9f714so746675066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neon.tech; s=google; t=1749465391; x=1750070191; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpaFRUPan5/TpiEHmRBhmrQ93XppgJeF5Z1cXdjt+MA=;
        b=stIN5OWOEd2pbME+4WjaVJg9DfLU3l8j1D0bU3DYbbjdNcF2QsAaQTj9aT6Iqrmkvg
         /gKBeT6mrTItrX8sV8gyZCkna2FLA8kgEDUkxQLiIJkeQi8XOJTnSZA0a/of2iG0lwcN
         Jcyt9BM2kHNEswTygBAaAHfuQKt7uxEP5AJo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749465391; x=1750070191;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpaFRUPan5/TpiEHmRBhmrQ93XppgJeF5Z1cXdjt+MA=;
        b=gxDWYN6Uf7vNRlhPOT4rrhtB1taEOwY4J8wcODE/Qhi/eTiQcg/AcCE4RRX3vgdQW5
         QGfGJxytZbQUmY1e1NM0tOefXNzYvtkrCn9GUzA8oLMC1bhRqbjgUUIK3LHvD0y/yg3o
         OvSToubNv8WkqBz2ApdFSyW/bO3Tjwrd/1OiEPJMwmKGm8OJig7fyUPiROWAd51XdBEZ
         Lory0yv7Jgn8DjJI6DOW9RfTaSGalekDZVBqvMd05muEVtANSaCo01ausolhJTWXQk02
         9+fsjK5J+XRXMA9+TANpOVMSqbzB/wweE+ao4Fows9a15ar2yhHtHepQY6/W0mLLQMMF
         P5mA==
X-Gm-Message-State: AOJu0YxRamRPxgMy0URaqRpqTMVDO2/VIGuNfbpjFoqLvgRV8rCgjGCH
	M1L5ZNv9kBDJx5skHaK4+Aq+MDzizCMsV98GtCvdIYmBlK7Lmgqknigv9hVVUyzEWb0=
X-Gm-Gg: ASbGncuab7ePqtM0Y13Cvs/q0dBoMklUndlsJQ+C3hjINcXRdlGE+qD9PtinqGT1ntY
	X533b2l01I4WpqDbNlDJbYjEtJ7czrZ2Daq6n26X3Qii28JOjNuj7GHtjN1gmETqeB0O6tPvMnS
	UJWejVMjKIjilNJiEXAVbTQy7qLv20U9cqo/gumfb40ZLOyPU44yBF1vLR5OgLhzB8hn8oyZPl5
	cAfmNiQJGp8ZugkuUEos+xvFCiaVVe8P+ufOs82KcnGm55Jqq7+WIym6WEL9Bhm+BzJFJ5MU9QM
	GE8TXTt3sUW/GcHEMIYyuHnywRHCCthUY1lRWa0zktM9r+23YAPXhcMa0VqYahwYd62QFRGZMgK
	a
X-Google-Smtp-Source: AGHT+IFXxtx2CSlXJ3Top/v168+U7HayyPAa5xv6S3DVOLuAfynTta6qZG5cPMeCleB7WFl6HYOs4g==
X-Received: by 2002:a17:906:f58c:b0:ad4:d00f:b4ca with SMTP id a640c23a62f3a-ade1ab3259dmr1092384366b.50.1749465390746;
        Mon, 09 Jun 2025 03:36:30 -0700 (PDT)
Received: from [192.168.86.142] ([84.65.228.220])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade465b243csm321502666b.88.2025.06.09.03.36.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 03:36:30 -0700 (PDT)
Message-ID: <decb3327-f47e-4ef2-8fd1-027acc6038d0@neon.tech>
Date: Mon, 9 Jun 2025 11:36:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/mm: Handle alloc failure in phys_*_init()
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
 Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
References: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech>
 <aEE6_S2a-1tk1dtI@gmail.com>
Content-Language: en-US
From: Em Sharnoff <sharnoff@neon.tech>
In-Reply-To: <aEE6_S2a-1tk1dtI@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-06-05 07:36, Ingo Molnar wrote:
 
> I agree that it makes total sense to fix all this (especially since you 
> are actively triggering it), but have you tried also changing it away 
> from GFP_ATOMIC? There's no real reason why it should be GFP_ATOMIC 
> AFAICS, other than some historic inertia that nobody bothered to fix.

Fair enough, yeah. We hadn't tried that, no

> Finally, could you make this a 2-patch fix series: first one to fix the 
> error return path to not crash, and the second one to change it away 
> from GFP_ATOMIC?

Sounds good -- thanks for the feedback!

Sent a new patch set with those changes. For posterity, v2 is here:
https://lore.kernel.org/all/0ce5e150-19e0-457f-bec3-ee031c0be7e7@neon.tech/

Thanks,
Em
