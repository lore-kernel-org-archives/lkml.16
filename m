Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F30263F4B
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745593243; cv=none; b=SAmVJtz5VMAAfc0wJpo7XdiQMv+UnA+6FIStVSosqOCdEUTebOjsze5MyPN0q905ORg12w4BJFE3hQoACBQd82UbDgqgXUkc4+pf1NI3hQsNuWRciYn40mLIt+Qq2i4oIaUkt3eGVds5mz5v+J0JVbrfRDd69P5aJ4tR19lsaEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745593243; c=relaxed/simple;
	bh=uxDBH+20OeRJluPE3VADYF6JFroNBRh9iAYHl6+LXU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msUAS2e1PVd1ng6/8GCQFXPiOJfN4/DV37AdBiRWmzfoDJvTmaTAs9N+r/nlV1Wr16J2VWlpZ3inOViRDiM8v3mKSybQj3vPC58kWVZfXYQYIoKyjPzX0GBZTggus1odV8t3LaZFPxTlbv0pMA5qhQzUsiHsvkO6P7XDa0qe2bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IMG4GgC9; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IMG4GgC9"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a08dso21971171fa.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745593239; x=1746198039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXTK96kbD7de3pGGb+sXJSFNJydbvcy15WDTiYkGeaw=;
        b=IMG4GgC9L15Cb6+/EWxyIEz2a5FNuvTN0F932sRs5cprHZQfmD+4LMIoGGWm2ZzsQj
         HfdQRuqud4ai7NJyg4Jy9ijHOFVimZSRH4+VphMTMzPVBi84V+gSaou78uR51q/f8zWb
         +EV2BBs7V91mJaEFeWwFSSaAuyQVVOjsJkqwrg+84eR4uoqb2vC/ZtZZ2FaC5z+D8gWO
         LypptxbVfdPKCJXAf0cX1eATk9Vq8+sTPEv/wlm+ljI2fdpYd8wa5KRfmOXA6IgQTQ5j
         OxMqzKGPSLuNvmg3vgUuGJYmw6SG5RMUu0NR2CNCGMIP1QfAViX8itprhgVPpQQNOOyj
         FSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745593239; x=1746198039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXTK96kbD7de3pGGb+sXJSFNJydbvcy15WDTiYkGeaw=;
        b=c2s3AYJDSEJVDW6hirFgFAR3c+MMxEewuKYJeQFDVRC7WxWSPnFXAMG7BOOM/NA5MM
         pTGaoDCgMbSTAtW2OIdFJ3kr+mh3RSZ+y/Xj3IQlR2s31+LYH6IIQyvRss6/rVkviY4W
         KhR8xKQofnPVcpQRRFPeZbY8DvFtPAFNCM0AyIdtU+FF0sH1ntvi0W9gEzBawF27gLqm
         HeQOJdjvxLP7JJGReu7MxBcNalYZ7JWOvINaIBtRYq8lNd52L4eCfpJrROhJGnvpqw28
         9vGlHiMNr5sxnQUKWwneg4LBgexG52dZs9KwijuWYdnVY8Sw1SjIES9Su5+gh1HxxI4T
         2viw==
X-Forwarded-Encrypted: i=1; AJvYcCUDYHY4kvsEWSELstYmYeX1WV8h8oi4guAF1J3GxOQ2zfMHuI6CFL+IfM1UUwu3LcUTcqjhwNGm41lrqww=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0odDNn4vKH+aFQebDKcJDa/gsDka2Rb2aNHVSgE0rVj1dskJj
	nZK/KK7c91dVDYSy5gWcdJHZ7e4UkRHR7Gz3Dr2z/i/MxzcUJat6ZvAd74U2o812JPC6qkgE/aG
	Q5l3Y9jNWcymDJWkIKhMh+94DKQ==
X-Gm-Gg: ASbGncsVzXVmC6IA9LXGG7pldUHd5gPMIP8gidcwYRk8vGZI3yGBufCUp3VKP6yHqYp
	tl9PZ3AzsS9Ym+yuO2NnGFDNLrN1BRCUU7Pubz0KqvAntoQzb40pTjiUs1PL3UrXHvkK9+l3a+5
	bA9Pae3gricdRBI2qhEtMnwc3q23j1/JLKwQDDdEYpVOp67Q8=
X-Google-Smtp-Source: AGHT+IEi0LYyQmhmFK06NP5kvYsQT0h5/QiJbUK/rIXcZ/50iKlQuvmIiO+gQ3IVv2Xja9qC38fQd6tVgGaiHP673Zs=
X-Received: by 2002:a2e:bc83:0:b0:30d:e104:9ad1 with SMTP id
 38308e7fff4ca-319088ad0fcmr9401871fa.38.1745593238892; Fri, 25 Apr 2025
 08:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425084216.3913608-1-mingo@kernel.org> <20250425084216.3913608-16-mingo@kernel.org>
 <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
In-Reply-To: <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
From: Brian Gerst <brgerst@gmail.com>
Date: Fri, 25 Apr 2025 11:00:26 -0400
X-Gm-Features: ATxdqUE4OetGFfkvoeLJ63u7rs_KcBVuvnpTKeBbxgn4WmlaNKLlGSsWFag6k5k
Message-ID: <CAMzpN2jNPxAF75iuNwNjz7PqYygYgLeCM77rQV2ZCj=o6-qJDQ@mail.gmail.com>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org, 
	"Ahmed S . Darwish" <darwi@linutronix.de>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin" <hpa@zytor.com>, 
	John Ogness <john.ogness@linutronix.de>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 10:30=E2=80=AFAM Uros Bizjak <ubizjak@gmail.com> wr=
ote:
>
>
>
> On 25. 04. 25 10:42, Ingo Molnar wrote:
>
> > -#endif
> > +#define arch_cmpxchg64                       __cmpxchg64
> > +#define arch_cmpxchg64_local         __cmpxchg64_local
> > +#define arch_try_cmpxchg64           __try_cmpxchg64
> > +#define arch_try_cmpxchg64_local     __try_cmpxchg64_local
> >
> >   #define system_has_cmpxchg64()              boot_cpu_has(X86_FEATURE_=
CX8)
>
> #define system_has_cmpxchg64()          1

Or just outright removed, since x86 was the only arch that defined it.


Brian Gerst
