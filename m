Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF38F1552FA
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751798645; cv=none; b=Ac5hY+RmqhRpTPA9dU1NsC5E5TA7k1doEqo8KK7uE0geGOzVjSsPe9y+ZjXS9Ovu1lAvvW2+Y9oUcl9lHWyfxeLtbf0BpCxuoI5oaiVNwPvYUVf1DC9MsL6iO3qO4oZYDOq33L23DPYYHTdHBDm3zZ5iQhDUnd0PSDptn7g0WY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751798645; c=relaxed/simple;
	bh=ljVTvv3ylF1q9GeYuLzJbrJ2pdJMNqnHTJ3mlwUP0Qw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nYjy/cHURFzXa4D8+kK4zBvul9llz2qrWwgiwYSQCfaa4/VHfyvXC5H1iIEAQuuimebamQaRjDGqUbMwN1jD3yARfwpO8hurevZI8/povlssWtYEuDDcsL3j+97tOVhI/KofohQnj6XVWb4dIuxtNxXWYDPSRiEKtUOjWg544kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f4c8e9cdcso414069241.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751798642; x=1752403442;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fryjNABzJeXYbuU+fJLRsiqin0eN86NG1i+dXCSHWg=;
        b=Pe6MHHaWXC4JRsR9AvoYzKsuTR1G/nEG/l4Q7RuCCUF+JdIB4f8GR9hzAAnXq3MImJ
         Z/5LxEOuGKMi9O5OdrYI/AtvdEYuGNys/5EL6a9zH4qnj0GaEaWQ+emBH9is2g9e+2Pp
         +/dg9ZdRANCILkTS5Oq4l1s10vwD3L8R6J4nH8XmB2x2t5iDBbJ/E+lLDQWShZYdaLEY
         cmkRWZHyJmUFpCxo1djzTxYvY4DD/PvowBEzssq0SS+GO0jYNW20Rdc6ABqBJ1NX50wC
         FPr1yGSvwdjeDVXM0tvPDj5eQLCkI6SArLkDKK9MMfqGZ4ukmajXZZVqDTGUEhSf8MZW
         gm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLsNai05eifQH9HT2gD2UVM4NMVZA7BYeiTZ0Dgwzll1XCUyH5AWLlHrdnYkamvgO3t8Aw330ez2mYdVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNT9mRaPqYefOR1OKnsAev53+E8F2dslj6oyYogoTaZBlWK+7K
	timCN73cGpTeqofXbn3yNERhiY4BGKBHmpZHrAxU+lJ8tT6terl4vhjlIx4+zdet
X-Gm-Gg: ASbGnctW1rrm04K1NDFHTssphFCmOEIReLrI6lTcGuZTa9U4bipw4yS9O7KnRh2CwOX
	hV1Th2sPOuOo/gPiTQwP1bQe2cRiOiKRhpvCp6H+grWwW2dZmB5tB+F36L/5DbaPxFMBORRGtL4
	rYQVfCM5IMK2VUDqcvmh/EdvPPAEdKytNK0VigaDciUI+FdPoWs2Kl998mdi1X5rOE9IfYnTIQo
	+9TNZW8Ya8p0aV6UZaJ7osEJm6jghRQJ+T244RX+OjUSto6kl2/ihLHKzHHyIOFjqJOrva01ybE
	OQVuA0hmSdNR0EpvR6wVkAU3yM7RNpTqu7tY5Hjq/b4JQ99kQpG1USDZqFWDRaAETPeiRvjtwi9
	KY5QhKgFX6XXHpZlEORKqTcGW
X-Google-Smtp-Source: AGHT+IEpA9Un46ZIUYO1ZggBKK2vsqzoE7p+efdr3cUXo1n8N7RABcjfJ7MHfqHExARMSaJao+shww==
X-Received: by 2002:a05:6102:38cb:b0:4e5:a67d:92a6 with SMTP id ada2fe7eead31-4f305b22470mr2139960137.14.1751798642267;
        Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4f2ea73b424sm771971137.27.2025.07.06.03.44.02
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87f0ac304f0so407372241.3
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrhqIsHAPqLW0yJCJsGw6u2nv8/185Q8II3R4WAyiMa+0e8lIABANfMg2sSdP4lemjd+JML4FG7gUpJeA=@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:4ec:c50c:399f with SMTP id
 ada2fe7eead31-4f305a6fa78mr2353704137.11.1751798641763; Sun, 06 Jul 2025
 03:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416114240.2929832-1-daniel@0x0f.com> <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
In-Reply-To: <CAMuHMdV6efvaJuqVjnayyCs2KAbJmi52n0afLS=jh=nKN0y9Ng@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 6 Jul 2025 12:43:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVEO+o0Py3ioC6ohbJooQdMhD9AXTHD1j1y+C_1TqSAAg@mail.gmail.com>
X-Gm-Features: Ac12FXwVVv9iMUPL5V7yTBrj-e-SiCiCS33sv508W7QTGDAo-a5WgiT62Pf5vvw
Message-ID: <CAMuHMdVEO+o0Py3ioC6ohbJooQdMhD9AXTHD1j1y+C_1TqSAAg@mail.gmail.com>
Subject: Re: [PATCH] m68k: Enable dead code elimination
To: Daniel Palmer <daniel@0x0f.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 6 Jul 2025 at 11:14, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Wed, 16 Apr 2025 at 13:42, Daniel Palmer <daniel@0x0f.com> wrote:
> > Allow the experimental dead code elimination config to be enabled.
> >
> > For my 68000 nommu config this frees up a few hundred K of memory
> > so seems worth while.
> >
> > Boot and build tested on nommu and mmu enabled configs.
> >
> > Before:
> > Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> > 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
> >
> > After
> > Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> > 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
>
> Thanks for your patch!
>
> Note that enabling this requires enabling CONFIG_EXPERT first, which is
> currently enabled in the Coldfire defconfigs, but not in the Classic
> defconfigs.  For atari_defconfig, I see a size reduction of ca. 150 KiB
> (gcc 13.3.0).

Let's share the actual figures I had saved before:

    $ bloat-o-meter vmlinux-v6.16-rc2+EXPERT{,+LD_DEAD_CODE_DATA_ELIMINATION}
    add/remove: 0/2125 grow/shrink: 10275/32 up/down: 52254/-205419 (-153165)
    [...]
    Total: Before=5277826, After=5124661, chg -2.90%

    dmesg:
    -Memory: 265412K/276480K available (4345K kernel code, 486K
rwdata, 1240K rodata, 164K init, 143K bss, 10440K reserved, 0K
cma-reserved)
    +Memory: 265616K/276480K available (4205K kernel code, 484K
rwdata, 1180K rodata, 160K init, 143K bss, 10236K reserved, 0K
cma-reserved)

    gcc version 13.3.0 (Ubuntu 13.3.0-6ubuntu2~24.04)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
