Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBC3242912;
	Thu,  3 Apr 2025 08:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743668853; cv=none; b=ZnNBDZBG2wtYqMnRYHGwutdOjF1KmcoF+NFEEoaYpp4ySpm4Qm0J2y97DK4dBVprUu25dTjlc+dtaQefpKBeOFX+/wVSDQHKBw6Z6y1m6Z2RVrNPgXWCnhmohZRS05SXBJ5vlqYwvafCTuZSmHNUTQuIeGxXp0i9z8le+e59HHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743668853; c=relaxed/simple;
	bh=Vz6GIr/E+HyhRa8juz1lK0WAiGpsW4bhQw0NC7FM1Tw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BmaHcVHRGWLPwWp6es0i8HFX9uhi4YhVP7E2c12Y9xMnu/eEi/Z+MTpQpUp00k38rn1Q3hrriHIwCwLLa35CciBTFLsQu5KXwUuxa4iGhe5RSeLZ7VjxjY30lsG1L436e5FzbAwS3wtInfAXqBsb/YwBsqNqLG4sV0XORUIE8BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso665130241.1;
        Thu, 03 Apr 2025 01:27:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743668849; x=1744273649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NDQ3RN8JV95PVAHRBeuOQcK7voG1aybW51cXyB4UMTg=;
        b=DFrL0rz8Sl3/dQXhJmBTNOg0vM9DSqBB4gHLWEr7lqSAZSqouG3CCd+iN1hYqhrte7
         e2vpCQb4zVd19XqOVX3ryTeKC/d2oBbQZaWNTeNdmUF0nIcU1Bgb7U0IPNVsJMQlh4Hy
         tocadMpvb5sgQ0RQXZEAOwtRYQ5q+Czv6SUrvv+PDVAhoIx/cFfLLrXxeNNAncHVZuQ3
         Out7dDthRKgIqpZjGacc6zBU1QjVSmxRtLk1f40y4DR9JXQBhjshmTI69oVFyY4HWjiL
         MgpzkYg9AAxJjl4R7I5XgRvw83zA2P4Kbsy1Eld9yZHDJJ3uiVQrhcu3sL+AX7CTknnS
         OPtA==
X-Forwarded-Encrypted: i=1; AJvYcCU0EvRk0A2f8iODevCVaVn7bDga6diMDWC7cYIinYSdTmptoYxRWLqmuwMy/EnXJtBtXpLkz+uRypPYhbeNyQ==@vger.kernel.org, AJvYcCUHP9EESZni3lxprPyFXhWPJhvj4ofJNR7Yz/4JPL3BQOBZgyTYTCw7d4eFefJFO5fRQvAx/ZgWBrCPrQ59@vger.kernel.org
X-Gm-Message-State: AOJu0YyyUVn3UZ7NMo+MFVoymGXm/8vB2NP+ITZdc03ssQSYMaIehNas
	5SxK/gWprX/Rn2zRa+ZXQMRz6xc8Csf9FXZhU7bxwKPtuJOeqbVHbySpojhp
X-Gm-Gg: ASbGncshO3LeRtPHJ9BqO5D69cv7RZ8we90CRoocAH+zQz0/Wqq14pBzY3IlrR301vg
	T5tJoxUqcOmta0NHOMr53G3MRTGGA64Fck5MtFysvE9Js97pO16oRdfSB6HhWkehVO0oD2k35pn
	Ax4ksCJSwhz+wL1Jasv4/CRUT2hMCJKkfni2BR5VHImnCw2waq2Alkz/iuSSh2z44DaAqaAnIMz
	QX7h9wAGhz9IoKgYZDKu8NX7Ef+O5UBGcf4cIilSpekqsqSWh7SgdH+0CAlj0rCxU7SKm8crGSH
	19S+LWLDYvhuefgYmC/TLMIAOnMzkqzDWvnJtYWiji+fPVv3oeATdofgx4hmMw/h9cbyNZ/gwWP
	Q/IxinTI=
X-Google-Smtp-Source: AGHT+IEutDeMFsiUq/RPKlbos/TDqsYkCrY36gEB42dpRmL11u3VZBZnbjwQkWFuD8x+1oVEb+lbuw==
X-Received: by 2002:a05:6102:3ece:b0:4c1:b2c2:61a with SMTP id ada2fe7eead31-4c839f13e9emr4881295137.25.1743668848733;
        Thu, 03 Apr 2025 01:27:28 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-8738b181d17sm157349241.4.2025.04.03.01.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 01:27:28 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-86b9b1def28so677460241.3;
        Thu, 03 Apr 2025 01:27:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSJ7ZODI1PebEOTtG/7ATumSi34g3yKnCQ8NGeX93TSF+bT8qgGgayxxnEL7FPmP8AfhIkQ2U5Y1TjQedt@vger.kernel.org, AJvYcCX/WX+bjuihU5hQHoFV2IUxZflT8QHjnBdipBvJdZ17UNrfWvGvsFkh8Clt2AUPmnJYxy1vsx3GfGLq8z3VhA==@vger.kernel.org
X-Received: by 2002:a05:6102:f8f:b0:4c1:9bdb:6188 with SMTP id
 ada2fe7eead31-4c839e38348mr4640098137.13.1743668847497; Thu, 03 Apr 2025
 01:27:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250316205014.2830071-2-francesco@valla.it> <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
In-Reply-To: <20250402195544.4897a774456eba75915cded7@linux-foundation.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Apr 2025 10:27:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXSLhypYULqfCm55MQxZCwLzxBBc7mnr6OBcPaHFwh2Lw@mail.gmail.com>
X-Gm-Features: ATxdqUFMgJ2ngjVa7g_RiKANOLqcud94QjdJ6r_f7S0meU1B7dnAX72IN_0JCPo
Message-ID: <CAMuHMdXSLhypYULqfCm55MQxZCwLzxBBc7mnr6OBcPaHFwh2Lw@mail.gmail.com>
Subject: Re: [PATCH] init/main.c: log initcall level when initcall_debug is used
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Francesco Valla <francesco@valla.it>, linux-kernel@vger.kernel.org, 
	linux-embedded@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Tim Bird <Tim.Bird@sony.com>
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 3 Apr 2025 at 04:56, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Sun, 16 Mar 2025 21:50:15 +0100 Francesco Valla <francesco@valla.it> wrote:
> > When initcall_debug is specified on the command line, the start and
> > return point for each initcall is printed. However, no information on
> > the initcall level is reported.
> >
> > Add to the initcall_debug infrastructure an additional print that
> > informs when a new initcall level is entered. This is particularly
> > useful when debugging dependency chains and/or working on boot time
> > reduction.
> >
> > ...
> >
> > --- a/init/main.c
> > +++ b/init/main.c
> > @@ -1214,6 +1214,12 @@ trace_initcall_finish_cb(void *data, initcall_t fn, int ret)
> >                fn, ret, (unsigned long long)ktime_us_delta(rettime, *calltime));
> >  }
> >
> > +static __init_or_module void
> > +trace_initcall_level_cb(void *data, const char *level)
> > +{
> > +     printk(KERN_DEBUG "entering initcall level: %s\n", level);
> > +}
>
> Please review and test this fixlet:
>
> --- a/init/main.c~init-mainc-log-initcall-level-when-initcall_debug-is-used-fix
> +++ a/init/main.c
> @@ -1217,7 +1217,7 @@ trace_initcall_finish_cb(void *data, ini
>  static __init_or_module void
>  trace_initcall_level_cb(void *data, const char *level)
>  {
> -       printk(KERN_DEBUG "entering initcall level: %s\n", level);
> +       pr_debug("entering initcall level: %s\n", level);
>  }
>
>  static ktime_t initcall_calltime;

I think the "printk(KERN_DEBUG ...)" construct is intentional.
The message should be logged when "initcall_debug" is passed on
the kernel command line, while pr_debug() is a no-op unless DEBUG is
defined inside the source file.

See also the two existing users in init/main.c near
https://elixir.bootlin.com/linux/v6.13.7/source/init/main.c#L1207.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
