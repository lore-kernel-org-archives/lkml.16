Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D8322EE5
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874037; cv=none; b=VVgovlIbzmZ0IrSvhmwkmOWzT/AB8BYQ9bIIbOp2CJYioYABMhe9E4FT0orK5QIk5mgncFRnv3iwZB5y3RAeWd47Me9unBc1SDdqQTdppL92dzhnjfzeMv2SsIKsXRT0pT/CU7yh7y2moO0mB73voQLO5Lc3yWhYQfVPUeK0O3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874037; c=relaxed/simple;
	bh=larYg1hBb0zYQ8ddvysFpCJTzGqt5ZYJc6A0nvv8XdU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HGX4pZCZWl94aRDpS2CDWiNMNHSLMk1tlq498wRxBoY3BVWljYoTMCvKoypkGPOEHoVVBwPoJBKp7bDK5QZEKiapdUSieg71Bl56ET6sMbY3gB4Pv2dTSPNVynq/q0m5mpzRhV3h3JjjzjvjJvEqdQAalCdaE+kr+OuXrEtDcDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VZJCeOow; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VZJCeOow"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2963dc379so496017866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 10:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1743874033; x=1744478833; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HrTb9VZlD1+MV9PcZsbh15i/1bQFvjnrnpOg0qSiP9c=;
        b=VZJCeOowZZjIkO3AuzKrxY7GKb86+6sctLOb54m4nIsXXVfW+ZTmQE1cFVPDmLqner
         7BGIt/8IetETYdanP0DBe1Vf1cu4VpMsDZ9Ca5Dt5LzmQ9SqTbzkEMJvAUBdIYIMgdO2
         QEaDfjx0uFVvIhafPGVlTYdrLcpOuiJqYy2WM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874033; x=1744478833;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HrTb9VZlD1+MV9PcZsbh15i/1bQFvjnrnpOg0qSiP9c=;
        b=p+nTiR9AsHFVExATP0lhypAyVEAki2bhzimA2aw68HQDfYdf8nBr48FrSKCua2bBB6
         SmggzCCiDfFKdDx5l/W6zcbcATzcLlgiNizOh9yzHobbexRtM6+2WGzpeIECFV4mU2mA
         laqHYFgAWhfl6Am2avStBysEa8AqY3Ds2LJdYAVoe/3BKipyUfbfPmjSl+EH33BgwlKf
         c6dcgIxtGaXbZLYQEn2+n5nFPoS7gmNPlXe4KCYbZmu9QSlyT62ZxCP25kbelo3MDqXl
         pz1wJt7uPAIc87LG3FNsvb+lRwZSXIAFBtEItpC64915hYQ80/dhfFtcbqA8kV/KwoQ9
         E5CA==
X-Forwarded-Encrypted: i=1; AJvYcCXwgyxNe7perrm2EZ3OS1EccDllb4Oyk9TDyEtBvqBE5tBfB+DnqXKUGevSRWwcojvN0QbisKNEu/7yJT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxouGRmP19/VXqNUQ3DPz2pNHZcNx/L8qcJjepDRVjSvWjLCeo4
	d6Dxlnllgx1a1SeZGvi489arnl8NYZUInPh3bubdqDj9ktop8TEdv2cLwAkyWEf861LtW1SbpRA
	AGMk=
X-Gm-Gg: ASbGncvnhyESKMZT/d0B0Y9tHc1YJ2F180TN1NuXFxhuqjeTG1/TEBLQuwOT2DPou19
	67qyta8TW0t22OJ12Zk//z3LqR5Z7Cv12vOo96mL/3oDhTjHXwha30x3CdOS3lpkhoI88CIOX0+
	y59yFrug4gA3HUqfmvYh9UWve3lZY9jsvT03WrF5o3m3E3rSkC1ke1ZCrn0r17WHm7moRitb2dH
	9pKNg1LgMFmksuyU3O5lAOCigUMvAmES0TfXtGG47UGqeP2iBGY7ASRuqQMuf10TVlDEURsCA8i
	iqHI72++pYqg9ENcYWahAuufciqDNxpTkD6YS328WzfNDvUk8ebljUZZTAe0bCeNabtURCIEun7
	J1/U3Ag+eHBo1GyZN1xg=
X-Google-Smtp-Source: AGHT+IFDdlwXntdrcm8kZDt59tMu6SDGkX3BzWmawy7lRxnoGpSdH9b8FOs1jdUGsjFSBHS6ONRHbg==
X-Received: by 2002:a17:907:2d86:b0:ac3:422b:a834 with SMTP id a640c23a62f3a-ac7d177488cmr630131466b.21.1743874032890;
        Sat, 05 Apr 2025 10:27:12 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c013f34dsm446552866b.87.2025.04.05.10.27.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:27:11 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5ed1ac116e3so5144713a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 10:27:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXaDN2cwOdKsiEbyQakz+TDoMB/b4CRRXdsbYq8W609IPKBc0xqY4SnrUhUioRj5POTJeyHh85VtTzx4eU=@vger.kernel.org
X-Received: by 2002:a17:907:7d8b:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ac7d1773abfmr684591066b.18.1743874030918; Sat, 05 Apr 2025
 10:27:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250404-vsprintf-convert-pragmas-to-__diag-v1-0-5d6c5c55b2bd@kernel.org>
 <20250405101126.7a2627a6@pumpkin>
In-Reply-To: <20250405101126.7a2627a6@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 5 Apr 2025 10:26:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
X-Gm-Features: ATxdqUFrvkeu1Sr201J8ENZ25xtQlPJ4DGYFMkNOtvxMM9DDu1oRsew6bWugCBQ
Message-ID: <CAHk-=whC15F9=fQqr-5moPA0SXFc-fAx_15=jzbYELg1TCWsqg@mail.gmail.com>
Subject: Re: [PATCH 0/2] vsprintf: Use __diag macros to disable '-Wsuggest-attribute=format'
To: David Laight <david.laight.linux@gmail.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Petr Mladek <pmladek@suse.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 5 Apr 2025 at 02:11, David Laight <david.laight.linux@gmail.com> wrote:
>
> Perhaps the compilers ought to support __attribute__((format(none)))
> to disable the warning.

D'oh, that's a good idea.

And gcc already supports it, even if we have to hack it up.

So let's remove this whole horrible garbage entirely, and replace it
with __printf(1,0) which should do exactly that.

The 1 is for the format string argument number, and we're just *lying*
about it. But there is not format string argument, and gcc just checks
for 'is it a char pointer).

The real format string argument is va_fmt->fmt, but there's no way to
tell gcc that.

And the 0 is is to tell gcc that there's nothing to verify.

Then, if you do that, gcc will say "oh, maybe you need to do the same
for the 'pointer()' function". That one has a real 'fmt' thing, but
again nothing to be checked, so we do the same '__printf(1,0)' there
too.

There it makes more sense, because argument 1 _is_ actually a format
string, so we're not lying about it.

IOW, something like this:

  --- a/lib/vsprintf.c
  +++ b/lib/vsprintf.c
  @@ -1700,9 +1700,10 @@ char *escaped_string(...
   }

  -#pragma GCC diagnostic push
  -#ifndef __clang__
  -#pragma GCC diagnostic ignored "-Wsuggest-attribute=format"
  -#endif
  -static char *va_format(char *buf, char *end, struct va_format *va_fmt,
  +/*
  + * The '__printf(1,0)' thing is a hack make gcc not ask us to use a
  + * a format attribute. 'buf' is *not* the format, 'va_fmt->fmt' is.
  + */
  +static __printf(1,0)
  +char *va_format(char *buf, char *end, struct va_format *va_fmt,
                       struct printf_spec spec)
   {
  @@ -1718,5 +1719,4 @@ static char *va_format(...
        return buf;
   }
  -#pragma GCC diagnostic pop

   static noinline_for_stack
  @@ -2429,5 +2429,5 @@ early_param(...
    * See rust/kernel/print.rs for details.
    */
  -static noinline_for_stack
  +static noinline_for_stack __printf(1,0)
   char *pointer(const char *fmt, char *buf, char *end, void *ptr,
              struct printf_spec spec)

Does that work for people who see this warning?

            Linus
