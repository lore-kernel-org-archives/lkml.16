Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D57D1F4C97
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746560532; cv=none; b=Qblv8DsF+lWOc0Xw8f4yy3oi9g49NvlC1unLXJwoXat7GwkLf0uHTueZ5nFgsIJQZ56BqEIYLMjaXdeIFpK+83ZOFAXIiUKgrRkC1zcxz64Hlof0tc3I+a+/vNZUf4cmbFrLsWKh/vTrYzSh4/iPfo1KNIS0B32wc16ElrPT1Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746560532; c=relaxed/simple;
	bh=02PInjaIXsSef5MIF/tczU+50TaQgtYbWkuUiCpYGNo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWJxJl0oTWno5DFzkI408FgJA9xjioNGl2Atg7VBUhzDC44MURW2KbIJcUAbg1Kd3DEtfC6S5fDYyMRgwqmKZttP/YGZgpjgVJRTz1pKeYkbuSbA0rdS3Jy/wW3vHFBsPZUXRI3XWcLuJqMFQ9RGQ/ikG0NTiC7w+GES//o3fKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=KmJEygHU; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="KmJEygHU"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so1082501566b.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746560528; x=1747165328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FLtCWwc40S7Us9tqvM35Kf0gO4qPnymYjFJDwT8BJmw=;
        b=KmJEygHUmWE1mA6oOjiD7Oc91NOUV7TwxXqevYilWdlGh9CltCX22/kKSMwH0idODA
         Hbuu8xeqsvH6hUw9qdbhbDgOUBg6hii8Ner/BR1KaQxJVN22FQYPvQHJsGsZU6h47Qgi
         4nY1e/WpBue9ahA2UEEsdUbcJHA2hL18uPUQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746560528; x=1747165328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FLtCWwc40S7Us9tqvM35Kf0gO4qPnymYjFJDwT8BJmw=;
        b=brVL033gc1VTdJ4r7rBhK3+K+EA0y9/yIbGoofK30dVTaTJJlP4GoEzgLLuPc+GWop
         BtkszVG14rz+/L0+w0cVG8JF80Dlsen0ty8d1QMy7gQOiuFurETgjmF4BKUN7voKH6SG
         KQ0UB0Jut9a2Eh/XYzQHTYM1dv2ZE1qT/eNJcEcgaHFqTABKgRtbMYq4CQGpoDxS9VF2
         cYwWOGU9JX9vhcNtlAktBdt5FZGjCuDkDzpSC7C/5hOqgus4mG6g5IhN1pzAt7/c/cXK
         S8OUhLtY772NGP9kAmXi3OGyATaURgGfoUGciYKrzNKj0Of0QsnJeLLo8kPcECwlklBa
         IUkw==
X-Forwarded-Encrypted: i=1; AJvYcCUTNYv1gnCyibMzuJENrXhdrCOuj46Brg435FN2Mh0F4Ns73k/x8uZbMOEt42DZ/wfVTZFmHpgZ7nkTzVs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGlhmOtLj3d+lJbTCnuW+1+6jVEoxPExJJYm5Ma49NyIxn7r1S
	cBJiCDuo37cwS09GuloaiD18tGEkviUa1DtOCdGwtpw/BNyIGnmvXox3DPzDpezY7s8B+DQracQ
	HWu8=
X-Gm-Gg: ASbGncuTBedrT1qh5cW87BAQIijbohzdbIhjriX01h4drps3JdgTt8jLEiMjCW9meOB
	fr0lo75t2Wcxk8tw3tcnu07usTwEchZNUa3JoaFw4HBGqsseXtaWxEzcWDx4yLhpc31S/Q7H9xo
	YfqTtSzxDqMqgYKab6zM1f0ZYxW57mmZjgfGfEWd/0HmdJQk3LMmecCOtrbBu7Cvp16/FLCV1Mg
	opwW8NHw7Zd3Fj+DGHQtaGSkGlJDr4IvDkUDg+3FubvQ7IFEAzxjxKFKOV2WXoDLGtU4dEmWT7P
	CYOMm77Z+5zuYUK85hZWZ+e7c8KYt93aUiP8fs9TB+NEDM36eSAWhMfplpOUIUuF3HIZYekQlYY
	OGFMzzl2umTspYvw=
X-Google-Smtp-Source: AGHT+IHJfw59UDW0Pv40EGj8vdDsw9qRpT5UK4Hkiv0qz0Z5meN66cQK6NCTxPqzl6q7J1c8vnBxQA==
X-Received: by 2002:a17:906:794a:b0:aca:a1cf:d5f8 with SMTP id a640c23a62f3a-ad1e8befd6cmr70447966b.11.1746560528106;
        Tue, 06 May 2025 12:42:08 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189146fc0sm764088266b.19.2025.05.06.12.42.06
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 12:42:07 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5fafcdac19aso4407058a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 12:42:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQz2fNwQ06cgtVFRrrgeJr9qxRQS4EGz/+YFucC47hKJN/rn4Ca+jICOxgSRutJB/tlqKZDMWuBbIqRBI=@vger.kernel.org
X-Received: by 2002:a05:6402:3712:b0:5fb:1eed:cddc with SMTP id
 4fb4d7f45d1cf-5fbe9e14d48mr392630a12.16.1746560526641; Tue, 06 May 2025
 12:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250506154532.1281909-5-ardb+git@google.com> <20250506154532.1281909-8-ardb+git@google.com>
 <CAHk-=whrcutH0LcMmaeJxxMeYpw2R5T80yoQAXbrRHNSTCB0Pw@mail.gmail.com>
 <CAMj1kXFSae=stazUv8doka-zLOnDdXXR4ASxHKe5f97ikg3V2A@mail.gmail.com>
 <CAHk-=whxP5Ywpv-U=2NPFhk929VHB9_kdp10+HFJQ4VxEGdX9A@mail.gmail.com>
 <CAMj1kXGwYXXpjPgDwjKMEZJkuGJ8ZuCpMpc7fTvo58PNtu-czA@mail.gmail.com>
 <CAHk-=wiz5oXq2f_87hHViN2TZQO9VHpaWb5fWWGJbUWQw1ChVw@mail.gmail.com>
 <CAMj1kXEtW2bAQK4hN-S5C=Po5dk1q14+GJjzEJsjfz9OeOMoCg@mail.gmail.com>
 <CAHk-=whRNPK7hTtPYh3SEe0WXEHR=aedc3bc-y_e08ujOxmgJg@mail.gmail.com>
 <CAHk-=wj9jR8HVOoEsAppFCGH0BcRCY6CrVNUFpeSswxD3Ho67Q@mail.gmail.com> <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com>
In-Reply-To: <CAMj1kXFNJEne4uDxjfq5=OiWJGA1Pu9O99mrJRky5CW4R3V32w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 6 May 2025 12:41:50 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh3np3kEJ-D4OZC2nHGuY7crkTw6kefGkUYaerSpUP3Gw@mail.gmail.com>
X-Gm-Features: ATxdqUGL8cpCtHcghXlxAoCws2vt3d7g0nqwOQJyGcZlqIbPpG7YBGAu-ou4GCk
Message-ID: <CAHk-=wh3np3kEJ-D4OZC2nHGuY7crkTw6kefGkUYaerSpUP3Gw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] x86/boot: Use alternatives based selector for
 5-level paging constants
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 12:15, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> First of all, that would mean calling into even more C code from the
> 1:1 mapping of memory,

Not a lot, actually.

When I did the runtime-const stuff, I refused to use the alternatives
code, because it was called much too late and was much too
complicated.

So I just did an early fixup by hand - in the place where the variable
was actually changed. Exactly so that you had *consistency*.

It's literally four lines of code that gets inlined.

See runtime_const_fixup().

And I just checked. Those four lines of code generate seven *instructions*:

  .LBB80_4:
        movq    $__start_runtime_ptr_dentry_hashtable, %rcx
  .LBB80_6:                               # =>This Inner Loop Header: Depth=1
        cmpq    $__stop_runtime_ptr_dentry_hashtable, %rcx
        jae     .LBB80_7
  # %bb.5:                                #   in Loop: Header=BB80_6 Depth=1
        movslq  (%rcx), %rdx
        movq    %rax, (%rcx,%rdx)
        addq    $4, %rcx
        jmp     .LBB80_6

that's literally what that

        runtime_const_init(ptr, dentry_hashtable);

generates in dcache_init_early() for me.

Seriously, this is *trivial*.

                Linus

             Linus
