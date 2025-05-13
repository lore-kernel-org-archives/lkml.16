Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2DE126BF7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165616; cv=none; b=Zt20mPcwqno66h4uYet3XKqLzxjWaV24smLQEW/6HB1wNhMagjoerJj8F6lNHx7e2GfQFq6iAbtWiuW7h0m1mwZJ31SfHsHRIFRSgRKQbwc54AHsWtefYCwt6PBlpbSisfc7+OHbLx9MkE5v7bNGcijvUzzBFIYIgBqdhPFzobA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165616; c=relaxed/simple;
	bh=6To62uGcZQK9appizY45ArRLRBgOVTSRVl6vAQqFx8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ghTqOLkhhHQ6nFwvEgRVQtUein5etbVL3+jGqJSpZPQ85Ir1JWtTlgJL5jGRKFQKdTHuutzgCl9rbunnMah/ba5reSQqOs1+Qiumlkk7XAjYxmn32u5uygDrQMY8w7yZ+o5nVsXkT027VgRuSLcdnIoXxrwP6QlZAYWqB8tu/Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Ky9lgirV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Ky9lgirV"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso12244095a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1747165610; x=1747770410; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=osowZHiCh4FTRJAovq7d86Sc/0+MJzT7LiUAm+X/OlY=;
        b=Ky9lgirV1t+1n+9FU9ZfHrA0F7NqBa1dIpWEyrviyMQHdLOGQkgMTI2IclqupBL1V2
         rQMsN98/EDWg6iKUHluJhqCDHGXBgmidaFlxRdwOEAhaUs/1H20TdCPRbQFidhmkRuDU
         lDIGhGos/czETelr5nDricmGh/CFAy4MGeubc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747165610; x=1747770410;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=osowZHiCh4FTRJAovq7d86Sc/0+MJzT7LiUAm+X/OlY=;
        b=OuzqhVNI4dUfmTIeLNzg+klFwJUTtBxLu3j9SyIvdn32GonkfVusOAcz1D0OBDxSCq
         U+5e03hm8fE+mcfuN4L2kiVgURGlQdVnKR9WBo67e4Q8nI7ryWzyMlpDy8cImGqAdfX7
         gWpWxa4m2M15lPvddpLURRPPbRo0hw0U1g/Ra5cVjRCLmSMUTyqlmj6hUZ9CDKx83mAh
         FoWllJXowmQpvpf6eXbGpGUUDwju7AAjGWyzoCpnZMae4NqEsSQbNV55ZprmPz2o12h4
         uH53kQ92dhJlB6t0PyLq+1LEkGW0kLLd1M+9QBOaxS3mww5nwZ8DkiBQRW8MX2sIHney
         WNHw==
X-Forwarded-Encrypted: i=1; AJvYcCUNp9FYLmL0VUnlPERdvFUS+scJvAUvTWrgS2k9IQjZFwSa+jX31z76R2VLOeoOOSqi0SjhGupUEQO8abU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0RNP/Be08KP7MELJdzwbwAKV89NbeU6PrdnAIq47lQVKMQbC1
	TH+WZYwLwpZozo2G+qTuhNR0i1PZ+zoVuvqY7oVcyemfQrQj0WxTA1xM8eigNFJp2+dugCHGxho
	p7kY=
X-Gm-Gg: ASbGnctoq9Znbl5AcCl1RsTa/e7uBiMpBChUG5+rJoD7R+4IGF/2Qz4CSqYb+W0l0+a
	oIxgUVWtOC8cz0M/4hCzSUlNEnoD3iykdCbbhCz2na6f6f2YkqBieI3yzpXPwL+oo7xxwSpWeTD
	gAc3QGj2CKCZX4kj/28vuttSEId8jBZe8N9nSnu0npSEucyq/5FgfutGTtPc4b+5z4F6WPcQ9z0
	Yx5byeCSeP7x41yddbt2nDTD0AyhnwU7zp9a7/vbvLo9F4dlli7h8ilGJMZ3ydWXT7dSLregPJn
	MyRnplYFeIFAjxTZI8v6NfplCdvVlJB0M/y0cRytBg9RLoLM0MKlb3jqEoCRC/u/PeZGr+emEhm
	tW97w7KTUTQ+thQgo/BjnWkFgQfsVDT27sP8y
X-Google-Smtp-Source: AGHT+IFV8jAcvx1flTG4cR/ScSvSW95TfTrmdt64XR5mOve2Yct/qClBXDsC/k0pk05axoeEZAKxBw==
X-Received: by 2002:a17:907:3f17:b0:ad2:499d:dfdb with SMTP id a640c23a62f3a-ad4f723b6e7mr87154766b.26.1747165610596;
        Tue, 13 May 2025 12:46:50 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc3f5ffsm7668937a12.30.2025.05.13.12.46.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 12:46:47 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5fbf0324faaso12243965a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:46:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWNMVh/K0l62MvRLVXq15co5qf2nQxGkZ5ElfQpZkgWg5ct63slDYO9t7dS+twiPD/QAByXfxnqOHHO7jI=@vger.kernel.org
X-Received: by 2002:a05:6402:51d0:b0:5e5:bdfe:6bfb with SMTP id
 4fb4d7f45d1cf-5ff988b09cbmr377585a12.16.1747165607045; Tue, 13 May 2025
 12:46:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <681bce2193f38_1229d6294c7@dwillia2-xfh.jf.intel.com.notmuch>
 <20250508110043.GG4439@noisy.programming.kicks-ass.net> <681d8ce06c869_1229d6294e@dwillia2-xfh.jf.intel.com.notmuch>
 <20250509104028.GL4439@noisy.programming.kicks-ass.net> <681ea7d5ea04b_2a2bb100cf@dwillia2-mobl4.notmuch>
 <20250512105026.GP4439@noisy.programming.kicks-ass.net> <20250512182559.GB25891@noisy.programming.kicks-ass.net>
 <20250512185817.GA1808@noisy.programming.kicks-ass.net> <CAHk-=whxPoFnZ4cLKh4X3m4qVcaak__G8+0iG-aOGO7YkS3LdA@mail.gmail.com>
 <20250513070918.GB25763@noisy.programming.kicks-ass.net> <20250513085001.GC25891@noisy.programming.kicks-ass.net>
In-Reply-To: <20250513085001.GC25891@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 13 May 2025 12:46:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjBiAqaWnXG_44ajMCqU3nNQOC1RQ6SUmKYC03Y1G=r1g@mail.gmail.com>
X-Gm-Features: AX0GCFslz14saMekTGJPQNGTU2UmwQF8S0KGif2G5A5hwICwjStllVCXsNnUObA
Message-ID: <CAHk-=wjBiAqaWnXG_44ajMCqU3nNQOC1RQ6SUmKYC03Y1G=r1g@mail.gmail.com>
Subject: Re: [PATCH 1/7] cleanup: Introduce DEFINE_ACQUIRE() a CLASS() for
 conditional locking
To: Peter Zijlstra <peterz@infradead.org>
Cc: dan.j.williams@intel.com, linux-cxl@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Lechner <dlechner@baylibre.com>, 
	Ingo Molnar <mingo@kernel.org>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 May 2025 at 01:50, Peter Zijlstra <peterz@infradead.org> wrote:
>
> +#define __GUARD_IS_ERR(_ptr) \
> +       ({ unsigned long _var = (__force unsigned long)(_ptr); \
> +          bool _s; \
> +          asm_inline volatile ("cmp %[val], %[var]" \
> +                               : "=@ccns" (_s) \
> +                               : [val] "i" (-MAX_ERRNO), \
> +                                 [var] "r" (_var)); \
> +          unlikely(_s); })

I think that this might be acceptable if it was some actual common operation.

But for just the conditional guard test, I think it's cute, but I
don't think it's really worth it.

Put another way: if we actually used this for IS_ERR_OR_NULL(), it
might be a worthwhile thing to look at. We have lots of those - some
of them in important core places.

Right now IS_ERR_OR_NULL() generates pretty disgusting code, with
clang doing things like this:

        testq   %rdi, %rdi
        sete    %al
        cmpq    $-4095, %rdi                    # imm = 0xF001
        setae   %cl
        orb     %al, %cl
        je      .LBB3_1

in order to avoid two jumps, while gcc generates that

        testq   %rdi, %rdi
        je      .L189
        cmpq    $-4096, %rdi
        ja      .L189

pattern.

               Linus
