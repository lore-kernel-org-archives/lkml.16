Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E232367D9;
	Tue, 22 Apr 2025 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309679; cv=none; b=G3pLo+gZmWqTovU7vxl0O5prnyPsotwGqAr94PArG7ScKye+yzS6jOpKIWDS2x32Vr7xKwfBv/z7jxiIdD/YIj/uK+hUimUZOATZq/zKkUbWw5Q+/evgnHnK/5oAzaGTeqD63EHgcygDfSEJa3108pb9RC5GQtZ5If/IFgaMBg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309679; c=relaxed/simple;
	bh=583NgnkZC2ZT7AwTWERouOxzfLOJBfqNK35QOwK3mdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/mHjXjAoiTsHj19/O/ZgsL4+J2mXoqhIoKRNzkZ4mOwi2JaqCAVBvsBfX837SfZWeqSfmKuGaJyAM2Vjmow3EOAu8DWGwGWQt1HYOZrXegl34pIGSj8T/D5QmNbUzLI8zi/49z8XqpjAjZkfJp8lY+srVEFKUHVkItHXTvY8Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7302a769534so938026a34.1;
        Tue, 22 Apr 2025 01:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745309676; x=1745914476;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8c8ma1h4TTKBEevU7DpgPt28PGW8UxGjza0Ib9e0KQ=;
        b=ZzjvGHF5MbYq9CZXi9+tDaimNNmRrDh8ks7oRO7D/K5PYAviQXLf0VMqppXuyuyP2o
         A/lDxLydO2TBimRxiTR2a51ij56wKc23d/8lybpdULphXvZNt4GIEFLsbJxiq4pvZCyp
         4thZH0RgxzZxiY403TVWjO/8VB1dbMRr9RDRjj7K2asto2OUBU0w+q/N586y+SxENsy0
         iLfh+7x1zzOyArQfxHx5f+r8nmw3Yp4ymgF5QzI0i+IapEkvdHo4QEYnT1nTVL42yqCN
         yngN4iDqKzB1QbOc2eP53Wl3f5ZkdSdpMY79wsLc3F5AGErkzdk8cu3X3u+Hc3f4wbpS
         MXcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnbWwsuwUheZmKccDlxp1JxjSkI1TjobsAJ8hotX+YVCrbEpdRirUjuLQOvyR8trAKZLmMszU9s4dloPil@vger.kernel.org, AJvYcCWKa5OJRISAQ0nUU24gtm2OHuXaUGdjqERXOELQ5mJRsSE8lCevIAovFdt63hI0kYq1P0D78nrHWe8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrFiZGoSYlhwY8MuFJEuGVLXGUTPW/nCBIkDprMgzROg6yHYMC
	ARjDiwoVUF0HYojmCkw5m9Nav4Pv6sspMCt48xbzgGfq4+jzh2j3vwKEaFFt
X-Gm-Gg: ASbGncsLG+xUSsri2LhPJgCYgwmm9LdUH0NukcEo3MOy+fi6Ps9L6BUrL/dJqiVX2nS
	OuwSSp9E2DLtTME/MSVZUR6SufR3LNRH72SY23tYpIjhqZC11pgn9HwodoF3li+YgzS0iTlv0/I
	svrS465/ejZ6bd5wIWnF95AzCfB7T6XhreZwO6pRfHEWuCn1+NrkmSCluSIDyMi8h7fWYc9rLsq
	wScQ2aW+OvVgLsVEhfUi8XPysTcFlBEgH+Bm3CVDkGDRhXbozxGAEOMiQQpk4QqZzD4oBEFlKyq
	9Zb6Uj379nBTpXoF5kfVDdQH9DfmHMZpseLqP8GyEiZN1oi0aU4mrski/ZH9zVmBsJW21Z3819d
	IOCI=
X-Google-Smtp-Source: AGHT+IEvQAyr1Pd9r90vUvMHKjHLZOY6rOJktS7bSdwdJwvpzN6O861WyOOqxV+2HCqsWJzsgBii8g==
X-Received: by 2002:a05:6830:2713:b0:72b:9506:8db1 with SMTP id 46e09a7af769-730061f15f1mr8821685a34.4.1745309676112;
        Tue, 22 Apr 2025 01:14:36 -0700 (PDT)
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com. [209.85.161.43])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300489de9esm1869598a34.63.2025.04.22.01.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:14:35 -0700 (PDT)
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-605fda00c30so1940027eaf.1;
        Tue, 22 Apr 2025 01:14:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnsj7URHDv+ba18nrG2OtS6C7Ynl+AAps+QmGffPzdLJpxYOy4VAEreq+CF2S1RzZZei9y9hzeT/o=@vger.kernel.org, AJvYcCXsD4TZkedWYQ9yNs12ihq/zZ932nsTzTrq4eFP/7tkpU6H9z7BpDduZ/0Slu3TdBQKWYEL7KXUmJc3RcCB@vger.kernel.org
X-Received: by 2002:a05:6102:5f09:b0:4bb:c24b:b644 with SMTP id
 ada2fe7eead31-4cb802080d4mr7323250137.20.1745309264946; Tue, 22 Apr 2025
 01:07:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 10:07:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
X-Gm-Features: ATxdqUEkl9rVCtzV1tSRbSe8H75mXfNa-MVqCJWBKpRzjTvK50pHzHN-MSLc5t4
Message-ID: <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>
Cc: alyssa@rosenzweig.io, Petr Mladek <pmladek@suse.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Sven Peter <sven@svenpeter.dev>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, 
	Maxime Ripard <mripard@kernel.org>, airlied@redhat.com, Simona Vetter <simona@ffwll.ch>, 
	Steven Rostedt <rostedt@goodmis.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, apw@canonical.com, joe@perches.com, 
	dwaipayanray1@gmail.com, lukas.bulwahn@gmail.com, Kees Cook <kees@kernel.org>, 
	tamird@gmail.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	Asahi Linux Mailing List <asahi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Aditya, Hector,

On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> %p4cc is designed for DRM/V4L2 FourCCs with their specific quirks, but
> it's useful to be able to print generic 4-character codes formatted as
> an integer. Extend it to add format specifiers for printing generic
> 32-bit FourCCs with various endian semantics:
>
> %p4ch   Host byte order
> %p4cn   Network byte order
> %p4cl   Little-endian
> %p4cb   Big-endian
>
> The endianness determines how bytes are interpreted as a u32, and the
> FourCC is then always printed MSByte-first (this is the opposite of
> V4L/DRM FourCCs). This covers most practical cases, e.g. %p4cn would
> allow printing LSByte-first FourCCs stored in host endian order
> (other than the hex form being in character order, not the integer
> value).
>
> Acked-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> Tested-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

Thanks for your patch, which is now commit 1938479b2720ebc0
("lib/vsprintf: Add support for generic FourCCs by extending %p4cc")
in drm-misc-next/

> --- a/Documentation/core-api/printk-formats.rst
> +++ b/Documentation/core-api/printk-formats.rst
> @@ -648,6 +648,38 @@ Examples::
>         %p4cc   Y10  little-endian (0x20303159)
>         %p4cc   NV12 big-endian (0xb231564e)
>
> +Generic FourCC code
> +-------------------
> +
> +::
> +       %p4c[hnlb]      gP00 (0x67503030)
> +
> +Print a generic FourCC code, as both ASCII characters and its numerical
> +value as hexadecimal.
> +
> +The generic FourCC code is always printed in the big-endian format,
> +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> +
> +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> +endianness is used to load the stored bytes. The data might be interpreted
> +using the host byte order, network byte order, little-endian, or big-endian.
> +
> +Passed by reference.
> +
> +Examples for a little-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)
> +       %p4cl   gP00 (0x67503030)
> +       %p4cb   00Pg (0x30305067)
> +
> +Examples for a big-endian machine, given &(u32)0x67503030::
> +
> +       %p4ch   gP00 (0x67503030)
> +       %p4cn   00Pg (0x30305067)

This doesn't look right to me, as network byte order is big endian?
Note that I didn't check the code.

> +       %p4cl   00Pg (0x30305067)
> +       %p4cb   gP00 (0x67503030)
> +
>  Rust
>  ----
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
