Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138827470;
	Mon, 28 Apr 2025 13:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847224; cv=none; b=Nx2wrwjJc5zM5tbaFIVxxH+Y6fXGgJOl8/18F5m+cuFfrKqcVzu/kLD+u3D302ED52oB2O8v0CltExrKEK+30D2aUF7vtYe9iv7OzBGaqo0uyTnd65a9MxmISm3tnfnBKFw9+SnL58vnwl57ClLB0h0Z6FDY23MsLbNx/kSLyDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847224; c=relaxed/simple;
	bh=gpUxEEVy3sIsimESLtWHg+JgdxY1t3rGmbuJEiKpzNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=un+t87csMLn2+yzCsgeIT+6S5GmowdGlL+EiU4PVvKv3zcrbMZUZLYU9G+EQ06Aur81wCLxRJCOL/kN7rGU/StlJkrc0iSfo9SqsAuMHztn6XrFDLBf2rdlOf4lmRG7fnWDE1SK2TGlPHdPvQlFbPxlwXNxKyesKwibO/dcpdD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4775ce8a4b0so100953211cf.1;
        Mon, 28 Apr 2025 06:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847219; x=1746452019;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0BEsm26/ULBWvXKeKH9l2FyVqKv47K9xZOm0eiyll4M=;
        b=oG/twDsCjuTBTZIDyNWuqVTadZNA+aLretqnrVzohi9HiWoe+JeIJn/4mEK4LKGBa0
         SrFcSY08klMHfi16u7Uz2aotSI2+Q6NEtE1zCRCTJxj/lnS3N7K/e5AILUWmx3ayFV5b
         m81f+YHd6l+v4X3DvdGa7RMyAxYRmQ7r7a24J4H7NG3afU9368RAdT7NsWA2S2PTkkJM
         zRDggaCKJhBClzWRflo0dUafs1I97PEPMYUyxIhOmverVIe4K1Y1k2Sw4Hv13iAT4n+H
         AQwpIEA3xZuGE1JtnfSbYdHyZ7xnEOARg5JhIDNKsPyxQC6GemgyP0tbqKaz+JGAYXxJ
         uugw==
X-Forwarded-Encrypted: i=1; AJvYcCU8SevAJ48BYibhXkFU/8azqP6yV/n3MsL3Dy8+xxgYzInqZbbwAKvJQGVoDmDH4ccRf440etAfRH6DOaqU@vger.kernel.org, AJvYcCVbX4Fm2gh3DM9DbpnG9RDOSUiPi6hOrT6oyjdXSIpm0l1UV9MtrFHxgyG3Bo64DuYiYo37EinlFQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+biwShyRgmvXmg240+rQcoLgsC4u9gfxtZ8BSQ5js3HarB0tf
	Qa6eJC+pkkm5ctGqRdPC+OMn68jQk/qCjJEBQEw7QmREaf4+BnI3J0HMdg0O
X-Gm-Gg: ASbGnctgyCxFqJP6mIYGevaBPNgusTeHZupjs3b5kgO+CMR+vY7s54TmgXjNtv6axbE
	YXD58l/YsUCIlh2jZBf+SY7NTX0qOG7xWYczAlOwr9Sy+wuk0ZL1fEWrDZ+StfN3MoUKFzA7xBu
	LGKRTDMTzKirfwCcsvnNi3E37ySxn8gI8mSgR1dPMrW4EVBWn/WW6+eXlyqFIuZgZ10igVQbx2S
	IeSc8vp9skWI2DBB2JGhM+7DP2ukFz0GBrzzBSux75MdyISBPSv6fQInK/44fvIJ4laUjhD+U/P
	J9xEakgzMz1WjJMoOoBpsB3y7+e5mZ5cdBMyXYza9vG6SrltjM6TMKr1nFTugqMc0CjwLo8WScb
	0oHBGmTw=
X-Google-Smtp-Source: AGHT+IGNQolzTzwT/yZkX048Wv2PAFwWfmNgX0cLcEBeWxcL3ExopurkRC4lBo0TaPq5PFZ7k4PIvQ==
X-Received: by 2002:a05:622a:1a04:b0:476:7cc2:3f57 with SMTP id d75a77b69052e-48131227accmr139594871cf.10.1745847219609;
        Mon, 28 Apr 2025 06:33:39 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-480ae7b591csm45947111cf.57.2025.04.28.06.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:33:38 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c54b651310so789313585a.0;
        Mon, 28 Apr 2025 06:33:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUgSAiGhzfJpMxyMpQ62IAQWv+kU3bhGNFz+pQKYrWVOdkoX4vYLNqWpi+YpGl7867A9CvmlqoRX8w=@vger.kernel.org, AJvYcCVMnO/3Rcd3KkzDKbVlGPNAjhJVprJx5zSLnkxBt1rlutXIbs0QZddBwsg4r03U1vwfpT1qmDBVrNGqC88q@vger.kernel.org
X-Received: by 2002:a05:620a:1787:b0:7c3:cde7:a685 with SMTP id
 af79cd13be357-7c96686a84bmr1764084385a.13.1745847218260; Mon, 28 Apr 2025
 06:33:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428123132.578771-1-pmladek@suse.com>
In-Reply-To: <20250428123132.578771-1-pmladek@suse.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 15:33:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
X-Gm-Features: ATxdqUFmD3scy2HsHjle6vsPCd-N6jvnwhDUq0YXyuK0ax-ge1T-9jGSCM3VE7o
Message-ID: <CAMuHMdX07EUSL2q5=jD17NX0gRMuLcWNec6i_18_vdnk5iC0bg@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in
 reversed host ordering
To: Petr Mladek <pmladek@suse.com>
Cc: alyssa@rosenzweig.io, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, 
	Simona Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, 
	joe@perches.com, dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, 
	Kees Cook <kees@kernel.org>, tamird@gmail.com, Aditya Garg <gargaditya08@live.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 14:31, Petr Mladek <pmladek@suse.com> wrote:
> The generic FourCC format always prints the data using the big endian
> order. It is generic because it allows to read the data using a custom
> ordering.
>
> The current code uses "n" for reading data in the reverse host ordering.
> It makes the 4 variants [hnbl] consistent with the generic printing
> of IPv4 addresses.
>
> Unfortunately, it creates confusion on big endian systems. For example,
> it shows the data &(u32)0x67503030 as
>
>         %p4cn   00Pg (0x30305067)
>
> But people expect that the ordering stays the same. The network ordering
> is a big-endian ordering.
>
> The problem is that the semantic is not the same. The modifiers affect
> the output ordering of IPv4 addresses while they affect the reading order
> in case of FourCC code.
>
> Avoid the confusion by replacing the "n" modifier with "hR", aka
> reverse host ordering. It is inspired by the existing %p[mM]R printf
> format.
>
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
> Signed-off-by: Petr Mladek <pmladek@suse.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
