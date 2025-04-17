Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4090B2066E4
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 07:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744875352; cv=none; b=Cm0223PptXSEzIE25B++a+28vHBGRgBupH5jln54siEwobJoIVf2y0XaYWZhilSzPwNndtcSlChmWJAxwLT5CwNgumsO4tbbijSecLs1eom2vlHvTeWvNRxFUwHHsS2Fh+fOctk4mveRKfgT8ooyUhqEB8FzV2eBMdWooDk4tzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744875352; c=relaxed/simple;
	bh=PXVIBKPDfAfPA+fRKxmffOhBfO5jV+Oif8pFQhzM7+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mMR5SDj/wyCj5nk8N6k0gdCdcW4L3hcZYZjEEips3XYK6JqqE/kfnk6moqa79xb723LM+GYkEwg7iitni5jQyoYDqKjWpi7Fr48Hclxvi1/vd8u2ZeK7xMqMLJHrZxtdbMQ6uY6B91sdO1/E3RiIhjrYMy1Tk/0HD7FXMIPBzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-524125f6cadso468322e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875348; x=1745480148;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlhwLdMuc1vfzHiUTHhLvXWzDjUA9i2BfrRB+g9HjA0=;
        b=jJYfg6ctZci4UM6nMvo+QqICoNIE8xTod2kIwFOwjfBcRBRsYERVgkFZccq6+ZTdZz
         ++yQYr+bsZRcVavwhPO85NIqjJ0B8F2znF8nTCVZIzu+pqQc1RnWjBtOGq6xu7E/c7OZ
         c8ulTWvF7P+cWO35+eoKDXRA5FXvlwnAIuPIuWYIA082cqp6V65Y6WQ/9aJHB1aZuGgN
         Eeqlgl7tnkprjYaJBDGnpKGMmox2uHsg6DynqtrhBJ8xEHQIo6uiO7c8wxbdD3lgMlJx
         AeGY/UBijW7lel6NxHlxduI8CvdyOrBOom60ejdQX4aFQh89LLI3YVsbQPmWYBgF+XjI
         aqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXpbx2iEbLPOm2MhY7TG0hXocx4HRMUxEGvirLhhIY8cx+RNFd2katgeyTGtwiaszthLK+1c51P54aoGK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqWYZerr+2OzMyqZ4hZ9hAXBtXXR3amts2cb3w9N7mUvzh3BVN
	Av7+UxLk9EKqf+7Wa3rCVjreiL5Pv2onegjvmMXemkO52v91xMFwcxVdS5V9
X-Gm-Gg: ASbGncvVjk2Jjm2uIJ4nX5N31EofUVmIaScpHwvaQEXUU46uVnAS2fruFc0JEbY1KrU
	03RZGN2uhMxLXaKxepyTI2eZER1W0EV4owzAjs8tn4Fl3qir0+gaxb2TeoK6mR4b32wUCveubyP
	UGeVC4yYlmvUB6lLZ1zX827vT9eFzOK++IUbvnXTi6uzKuCvis6V4+89iJ9SJDPIkc7YrWcmKXP
	aRjx42c+TcptMM8ajiAGtJR+IbrOoLEc7rSPYoHkQ9FEFrUK4y/6x/AMX4zxwOwoKZ+VFTXamTI
	I+5yNiIkFXtYoOF9FWlaU5ekOOBXZPUDNRN2B2X3n8F0kzMbA6uNEPHhyIqbMla+eKPsXMx1YzR
	VAMNwMcjYboAgcw==
X-Google-Smtp-Source: AGHT+IH2oxe6krMRgcMliYdH9nUdHcSLqxKmTry/ZX806vTHQMEoK9AfjzGq0atKFT9BQJ1Jjb8Ayg==
X-Received: by 2002:a05:6122:459c:b0:520:4996:7cf2 with SMTP id 71dfb90a1353d-5290e1ec9d3mr3895230e0c.10.1744875348490;
        Thu, 17 Apr 2025 00:35:48 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abeb1427sm3482210e0c.47.2025.04.17.00.35.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 00:35:48 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-86d3ac0fec0so442784241.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 00:35:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcuCiK8ct9EenVC93RCCdc8AeE7nhbvWV/15k1812ykxpxoxCB5o761RkeLkhmQ+HacCMU9JjI/7+8Kcw=@vger.kernel.org
X-Received: by 2002:a05:6102:5616:b0:4c1:83c4:8562 with SMTP id
 ada2fe7eead31-4cb5920c8acmr2955742137.13.1744875348000; Thu, 17 Apr 2025
 00:35:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408164000.3215690-1-fvdl@google.com>
In-Reply-To: <20250408164000.3215690-1-fvdl@google.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 09:35:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqHmd+m-MHK5YQf6=q8x2sSA5AmK15M6_D7QwSc06_jQ@mail.gmail.com>
X-Gm-Features: ATxdqUFMS-Y0egsHu_C7T9_O_yPfXL89DbZv7eKbzblmZwQLKEdJhnZx9vS86b8
Message-ID: <CAMuHMdVqHmd+m-MHK5YQf6=q8x2sSA5AmK15M6_D7QwSc06_jQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/cma: report base address of single range correctly
To: Frank van der Linden <fvdl@google.com>
Cc: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Tue, 8 Apr 2025 at 18:40, Frank van der Linden <fvdl@google.com> wrote:
> The cma_declare_contiguous_nid code was refactored by
> commit c009da4258f9 ("mm, cma: support multiple contiguous
> ranges, if requested"), so that it could use an internal
> function to attempt a single range area first, and then
> try a multi-range one.
>
> However, that meant that the actual base address used for
> the !fixed case (base == 0) wasn't available one level up
> to be printed in the informational message, and it would
> always end up printing a base address of 0 in the boot
> message.
>
> Make the internal function take a phys_addr_t pointer to
> the base address, so that the value is available to the
> caller.
>
> Fixes: c009da4258f9 ("mm, cma: support multiple contiguous ranges, if requested")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-mm/CAMuHMdVWviQ7O9yBFE3f=ev0eVb1CnsQvR6SKtEROBbM6z7g3w@mail.gmail.com/

Thanks for your patch, which is now commit 60580e0bd587b1df ("mm/cma:
report base address of single range correctly") upstream.

> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

FTR, the email addres in this tag does not match the tag given in
https://lore.kernel.org/all/CAMuHMdUeGjbOx-aJTvwOVBWdUFmY7wU-p3mKaCbEzQ4PbJDqNg@mail.gmail.com

> Signed-off-by: Frank van der Linden <fvdl@google.com>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
