Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18DCE1AF4D5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745391747; cv=none; b=C8NRjUHDrT0VXEV1TAoKGbNPgQrGz3jWeKNmZpQd/Bvu2DlDWF1islAD5wfSzZyYM9YmBnpKgGYFN7GM/YDaeNEsCar1Do+jegyTlvgJHEOEG28fbri79IIBVvA/zvG/J8qh++4oq1gJOLPJTPF16cEC0+QonoYQoW82EbZh+5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745391747; c=relaxed/simple;
	bh=gbkMNfwgfYdmOKAVYlr5A18p5tXwK5iqmUnvdxbkPn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AAmYYsqdzYbPiLDQ0l7JfKH75nQAuhlBjzq1RzD3j+YGkgBG3h4YFfDDdoYGVD23zXyx1VWcXB6SSkfQQj3uHtvk8qHkC8LXwGrc5AWoxy40Q+1pgoSITbR9KBiN4JfBTUO4qgT6Q01tBPuOj+mG/ueiANBXJe/kTiRmrYRbXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86feb84877aso2181363241.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745391744; x=1745996544;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oLLT648Qo0bBu3L/szjjcPVs5CsDim4LfUXjSbqVkUo=;
        b=P5WD3f5qkOO9dPYCQf4b87FU8Fzq63oG/2rHVEH6gi7/v0juvI/SKeqB7rsNbgkjU3
         mCM8jMU5HmgQbWJIPRAuhLzAAE8Q0KMriA36fqIKVGfKKg/g8XsiM5nHnsKTLZeV0xPk
         bTFrJ6G1N9tDoNCVqYHMSmsv30SHk9CJNNQx5b2Cf7KWIHrjPEtJp0fIT7VW1yppZrYL
         UMT7xxSUTmUSB1fN1mhAuw8AIijPgoCpm3fTOuhP0X2t9q3laeZTxtbh4ZEYqN44ira3
         dkt3bVAVdoQCptuh5yIjUHJCJdFFzxrXC0r7DCNI7uuyRQgs2+sp3iMmVGzdNFRgm6Cr
         xRkA==
X-Forwarded-Encrypted: i=1; AJvYcCWKPibRj3SqsQL3mNhoRqH2pBSFUaeSgFW5E0FHNxg1yir0ED4R/Gbmpm1WFvbtJv9tXFhUVMW/7k4+Syg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC9Bz8BM2Yxb824osqKDgOPw2LgSuOmxtpCeOkxzxK6249aame
	pP9r8aAdV7tWPSAyr+BPix8jH5zZl/zZy0ok5KZ7sKc+LsG4KPqregm+3vFI
X-Gm-Gg: ASbGnct/LNJr75IJ4k6SWv+OVrzg/QreTmgtk5nHxdo0OXejj9Fwq41Y+vVeHrVCc6g
	cRy2pELR4c8kJAIaGxdYPRShkwb4XU7tGsQFAcFZVdSgTasBp7UwoS9BddM0l9g2Rel6SmWszFa
	YosCC3D+A3L+pnUdnpFaslzSsHngIyIFJGyoML6Ws+4Z+66CBPmM6lEKWxML8yoABWhckXmIBsW
	s0Bg3CFHqvITExz+5O4n5puIXNknyZ0GhGcXrE/kkW0EfgsV8crN6TlCi+Y4ILE8MBRT4pGnziH
	I5Cc/pptTTXrmcX+wt6wr0tqiTq2XRmvZhJugUr2DA2+A7WKlOWRFcXDttpVZoYLM0xEVYLYPmn
	S/4paG2lPSHTgAg==
X-Google-Smtp-Source: AGHT+IFkILUsBm2GyibPNm4vB292lZNkKvagSFN7FDisBItAtD1QvlWtCV3/ltNscTsJ46YSO83qKw==
X-Received: by 2002:a05:6102:22cc:b0:4c1:8e95:24f3 with SMTP id ada2fe7eead31-4cb80207f8amr11107152137.24.1745391743973;
        Wed, 23 Apr 2025 00:02:23 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4cb7dde4507sm2437392137.17.2025.04.23.00.02.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 00:02:22 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86715793b1fso2151038241.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXa1NfAA1QRFf/37xGpo16FV7EDzw1aUPZdbwcO54pNEyiIEBtfPB3SoryXsQVZ2LTW6ywg4Mj1707JwL0=@vger.kernel.org
X-Received: by 2002:a05:6102:115b:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4cb8011c0aemr10746966137.13.1745391742137; Wed, 23 Apr 2025
 00:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250419115157.567249-1-cem@kernel.org> <81d49efc-1b81-48e1-b9ca-c3665d0cf73c@roeck-us.net>
 <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
In-Reply-To: <2bf6d797-d974-49bb-a234-a20378f5dda5@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Apr 2025 09:02:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU5F1nEpF9+jJSP0oap6GdP9mQSPp0c3zSmXeOPrCzA9A@mail.gmail.com>
X-Gm-Features: ATxdqUGRbZuOINkFuxvCUmORu2B9D7f0xtqPILeeZNQ196gJiQhds1EEJ0BoHQA
Message-ID: <CAMuHMdU5F1nEpF9+jJSP0oap6GdP9mQSPp0c3zSmXeOPrCzA9A@mail.gmail.com>
Subject: Re: [RFC PATCH] math.h: Account for 64-bit division on i386
To: Guenter Roeck <linux@roeck-us.net>
Cc: cem@kernel.org, linux-kernel@vger.kernel.org, Hans.Holmberg@wdc.com, 
	oe-kbuild-all@lists.linux.dev, hch@lst.de, lukas@wunner.de, 
	angelogioacchino.delregno@collabora.com, Jonathan.Cameron@huawei.com
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Apr 2025 at 19:42, Guenter Roeck <linux@roeck-us.net> wrote:
> On Sun, Apr 20, 2025 at 08:40:27AM -0700, Guenter Roeck wrote:
> > On Sat, Apr 19, 2025 at 01:51:46PM +0200, cem@kernel.org wrote:
> > > From: Carlos Maiolino <cem@kernel.org>
> > >
> > > Building linux on i386 might fail if a 64bit type is passed to
> >
> > i386 actually builds. Its compiler is probably able to convert
> > the offending mult_frac() without helpers since the divisor is
> > a constant. I see the problem with openrisc and parisc, with
> > gcc 13.3.0.
> >
> > > mult_fract(). To prevent the failure, use do_div() for the division
> > > calculation instead of hardcoding a / b.
> > >
> > > Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202504181233.F7D9Atra-lkp@intel.com/
> > > ---
> > >
> > > I'm sending it as a RFC because I didn't to extensive testing on this
> > > patch, also I'm not sure if mult_frac() was intended to work on 32-bit
> > > only types. If that's the case, perhaps, a new mult_frac64() might be a
> > > better idea?!
> > >
> > >  include/linux/math.h | 19 ++++++++++---------
> > >  1 file changed, 10 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/include/linux/math.h b/include/linux/math.h
> > > index 0198c92cbe3e..05ea853b75b4 100644
> > > --- a/include/linux/math.h
> > > +++ b/include/linux/math.h
> > > @@ -133,15 +133,16 @@ __STRUCT_FRACT(u32)
> > >  #undef __STRUCT_FRACT
> > >
> > >  /* Calculate "x * n / d" without unnecessary overflow or loss of precision. */
> > > -#define mult_frac(x, n, d) \
> > > -({                         \
> > > -   typeof(x) x_ = (x);     \
> > > -   typeof(n) n_ = (n);     \
> > > -   typeof(d) d_ = (d);     \
> > > -                           \
> > > -   typeof(x_) q = x_ / d_; \
> > > -   typeof(x_) r = x_ % d_; \
> > > -   q * n_ + r * n_ / d_;   \
> > > +#define mult_frac(x, n, d)         \
> > > +({                                 \
> > > +   typeof(x) x_ = (x);             \
> > > +   typeof(n) n_ = (n);             \
> > > +   typeof(d) d_ = (d);             \
> > > +                                   \
> > > +   typeof(x_) r = do_div(x_, d_);  \
> > > +   r *= n_;                        \
> > > +   do_div(r, d_);                  \
> > > +   x_ * n_ + r;                    \
> > >  })
> > >
> >
> > Unfortunately that doesn't work. I get build errors on parisc.
> >
>
> Turns out the first parameter of do_div needs to be u64, not s64,
> at least on parisc.

That is correct: the first parameter must be u64, the second must be u32:
https://elixir.bootlin.com/linux/v6.14.3/source/include/asm-generic/div64.h

As you must never use open-coded 64-bit divisions in the kernel,
simple helpers like mult_frac() can only be used for 32-bit values.
For anything involving 64-bit divisions, you must use the helpers from
<linux/math64.h>, e.g. mul_u64_u32_div().
https://elixir.bootlin.com/linux/v6.14.3/source/include/linux/math64.h#L257

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
