Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841F929A5
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 02:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743991492; cv=none; b=uv4FAhennhzRH1WIZM73FMGkFFiXk9rj8gvXSli7Bl3Zb6KoBubY/17feSC1zefEf59DA6RI4RetMrUIWR2rgtABKALYpCQJR/6+icqmNF4hMZ7lUyo1LMrqoRWZOesrcBfP7jaI8GVS+PKeS8Z3EV1X5uhdnwVJzGirKkcDdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743991492; c=relaxed/simple;
	bh=mimCYtAd9WvQzycHABcNfubQzeXg+kwLLDiM1O+YBTc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ERfXLJRq1RdFb0LVKcYumiPmj1IwwiIvtpCvk5IdKKpIHsVYUou634fIMtrwoWS4AevYhEtNHbrMe42Lyh9VtQ3ysZGXIc700GjCmy2oNKtRUjTIpRfHIq7UBnXkgAj1sgBvFmtOc9B22W7rmlvi4do6L6Qhq65FbZJYg/r0KlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LYlDqEwY; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LYlDqEwY"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so611177966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743991488; x=1744596288; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UMR3wGO3cA4h55QkdlZJ6crIPO30KB5PQtD5jo9D3nI=;
        b=LYlDqEwYVEiZ+hNzpJyDOGKd19BUShqO90+xZLywWFYSHWnE0XDnvUgc6hY65zcx0R
         VddgMUE7vtn4I4KH0Eqfd2WbnJfsA5RHT6HFhExoCBBhBGMn/5vT2VAugfUKyVX9Eia0
         8CDZL0iQtjJfd8WuE67AGNrv6GuEuozm52lPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743991488; x=1744596288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UMR3wGO3cA4h55QkdlZJ6crIPO30KB5PQtD5jo9D3nI=;
        b=g55/7C+VZAsBfh8iGtV2I3U1pIZn8ud7gIRzm4Af9yjPZNjYlFhCnFCcw9SNMBctit
         8lYuPxVs4JDh1vI9tu2fX0wk5LcpL78IterUxG0Q0VgwC37/PkRRVqSGqChVxQ6b+Q5A
         P2W+1PqLF/Qkq6PQHg7sdOOP+rgmdpfDg5wPcrIs1dFs9Xm8sMAop/mfV41RVwsVv4rn
         yvGaiyDwrNmBAZWKdwBbbFv/hL9TF+ibsNXire09QkLimJrsWhv6uq82GWpEJWqD8DEd
         Kvs7a0ntrbNQ6QBsf+qOuMWrJTll53knt5xOyKF/wZxz1/Q51vE6XWld97zBjcE/RJL0
         k0Cg==
X-Gm-Message-State: AOJu0YyN6L+keDIs4xNVyVjjV6lz86DElhMfuDw8ADerVB4lo09Vg9VA
	ztt4jYpberYSeuF3xrkEWdoiQ28TYEbghe3U6U7tFJfkWHvk5sVc8IusV6J/2SMTcvBEpgJ/Uvi
	SmKY=
X-Gm-Gg: ASbGnctzf4URjdEnwKpd1eL4j5D0gJvfx5nk9wFQn+268X/E9wTC/xNPt0tEjjmzWhl
	SX5gK08OIP9sEvdPPxJVF16FGVmgMae9Ra9xEIWnubOu6H2xy+Y7i8oULPXUVs19Jmn1seUJ41j
	GZh3Q//6Dec5BmQPegVuIZCpRptCsrvoV04ktVs6WGDstW6jKwfls4G+3yg1tVndhK19fRynDcJ
	dpo0mhOn4BrdhfWjr3rZ+qTB6TPlNfOKgjkjjvvKtN8KquqcdvRAx7cjue7rqMOVYb2R813XSb9
	22VtrDVDz0rSNCc7OjJyCArl7NNEqqi9j3e1L7CMlZspXsFHic/+4vmh9hjAi9F+ndeS/1i5t2B
	U9XWYzxlKGi3Y+yOUPn8=
X-Google-Smtp-Source: AGHT+IG0kjVbrtVm3SNySBQrGsMJANLvmAX6JXAVSbsquVZcduOT7j6F5ZGZlrDtO5udb8bJfLo00A==
X-Received: by 2002:a17:907:7ea1:b0:ac7:b363:862c with SMTP id a640c23a62f3a-ac7d6d7f0a5mr928201366b.34.1743991488577;
        Sun, 06 Apr 2025 19:04:48 -0700 (PDT)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9c805sm649732966b.49.2025.04.06.19.04.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Apr 2025 19:04:47 -0700 (PDT)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso727876166b.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 19:04:47 -0700 (PDT)
X-Received: by 2002:a17:906:5a4b:b0:ac7:e492:40d with SMTP id
 a640c23a62f3a-ac7e49209ddmr630266766b.32.1743991486755; Sun, 06 Apr 2025
 19:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202504061053.F27227CA@keescook> <CAHk-=whVfxi4KRu-H=tsgSdoGdDz1bvu0_miJT0BTgAf4igpdg@mail.gmail.com>
 <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
In-Reply-To: <FFE5FB0B-CC92-4A25-8014-E7548AD1C469@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 6 Apr 2025 19:04:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
X-Gm-Features: ATxdqUG0zi6VUQ6XNxajiUcRKokskUWX64e3iNaxMYYbf79gLozTPgdzSr5nLlU
Message-ID: <CAHk-=wijG2dSOOFr8CCYygwxZQxdTUj73rfB8=tyZP-3G-8-og@mail.gmail.com>
Subject: Re: [GIT PULL] string fixes for v6.15-rc1
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Collingbourne <pcc@google.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Apr 2025 at 18:33, Kees Cook <kees@kernel.org> wrote:
>
> I should have said "libcall optimizations". It's not just blindly constructing calls.

But it's *WRONG*.

It's stupid. It's not an optimization, it makes things worse.

> This is the same kind of thing that has been heavily discussed before for bcmp() and stpcpy()

And it makes a bit more sense at least for stpcpy(), because the
implementation there is basically "strlen+memcpy". Both of which we
want the compiler to work on - even if we're not interested in it ever
using stpcpy().

IOF, for stpcpy, there's at least a *reason* for the compiler to do it.

For something like wcslen() the answer is "DON'T DO THIS". Because
there is absolutely zero upside to trying to recognize this pattern,
and there is real downside.

See?

Don't work around the compiler doing stupid things. Fix the compiler
options to tell the compiler to "Don'tDoThatThen(tm)".

            Linus
