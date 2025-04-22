Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AB920D4F6;
	Tue, 22 Apr 2025 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317255; cv=none; b=ZlgwixM+Omu88mJeKhFs3BBIdb3mPWjZAtvVu6WQsSg9E6wduX0AjyRDGlQEDOx7ay6NvKtwm7vkM7C0HVKAUJYe3bn+yxqHz+5nbMu43n9RkVaZXP/9X38uHRHqJs14Jrin/4ylmOhOPSMIBmYuQk/fx7MirGZL/YtFEdqMOXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317255; c=relaxed/simple;
	bh=Wxe5WY7G3RUU93PW+mJYq20A1zO1eLTby/47ySQYMsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q+T/5g6fyhTvhugOl0zJKUpxAXte8ci2piWT55Tf1SN0Er2SBCJY7K5yfDdf734i+ZGv8amWTQhoz0UBOdsLiXpTYmINPMmY1vPFhU49V7sB2iKpenrC4e5sENGOlN2hcVtkvn/cPfTP/hS6rzjqsseODIZC4i9c/eIrifQYSks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-86fbb48fc7fso1745515241.2;
        Tue, 22 Apr 2025 03:20:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317251; x=1745922051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ohxPhiK6YcJP8Y4tA22q1xDQLWt1Qweo8WFh3HJlJLE=;
        b=J+ghO7vO5V5CkUqyj8VPcqBlEUTIW75zwOvy3g3MCXsDbKfRtvfkWItRa3TkZ9LvUu
         8yzo3uJzj06zm5uhmw8UnUuHzjchM/phk1lFI9ryfGy6sbSmG/pk8PpOFXyWH6ZZHbC8
         3gMHzeX6t/+UUB8cy6gsKDKxmK4QRH98pLKWqcjTPPA3ICZDaC7hrbTqb9oFpib4HWgs
         TmBqepzs/3oi5t2G3oLfnwlA38bQ2TXehINz7Az1senbJCTOA/JJPpcDQ8thnJY33dxp
         02O2jbYLD8um2GX2u6IgTmD/XmlF48lWdUb0nG0ksDQGY5CvBDQ7V0tFSQlyENkVoqe9
         ugWg==
X-Forwarded-Encrypted: i=1; AJvYcCUJWQMuoBhe1fbF97JpAtT9He8RFj6Kilrx1G9FXXbxtR9aG0+Qj8XEYmqTFApXXBGQy4Bk0h/lNshJi6he@vger.kernel.org, AJvYcCUmkH82vmf7j32veGhLboMJdbkj+wXTeCNvMhqs+Dun0dDlfookwxpcCGAksj/vSpTl6idyHMiU0og=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUq6hTLYvhM/yEjFGjLDtcFsiJRtPuELPRgAjAqpVFHNJqsgut
	dW6yeXbQPIYBKOa7Lw2kC7MMUi2dSgle6b+utCT3j619W2P6gkEmXbkwwg6O
X-Gm-Gg: ASbGnctjvaDgYJtR1LzGKUkcMAqMhYyNnnkB8EBG5x21n2qSEYQQmUD3CMFh9JPjMuW
	eafbMBFFOizO/jS1D9jm9XIcNw/54CKZpCBN15oXljlMtkLGA3gNK9/7auyydQWd/j2UTX1Yeoh
	Z1f928FWjmOTxy4oGLP7OLxuvsXz11Q4UrUE6+8v/RqIsavlYgyFYhxf0/o7GLEVfdJrC3QKgJ+
	4QWCuE8YXJQ6F5AmikamaqEj0tCmCq0AERJD92yJ6rtERGVEDkA8jOnuFuE9CMPsT3Bw2+hZFyT
	Ldx84XCImYgM3hSwJc20o8p2t++YdAsOT9CPyNBnvpa6lnVgAeDgVqfyIShjraJpW6IzQSjvvAA
	m8vo=
X-Google-Smtp-Source: AGHT+IHlXw1l6Qgqu3XW2wBdqScP6mljWsKvu4Y8mJ8KGPYUINVhYLR/NhIPlpmGfh5Nn2PsCOhr2g==
X-Received: by 2002:a05:6102:3114:b0:4c1:935a:2446 with SMTP id ada2fe7eead31-4cb801f6518mr9187411137.19.1745317251355;
        Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4cb7dd7be00sm2135680137.6.2025.04.22.03.20.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86f9c719d63so1604799241.1;
        Tue, 22 Apr 2025 03:20:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV418QWuqa3mNFJ7Bsa0JdenvfT6Q753E6EDIkFubLqSKy2ChESQBoRKdVdFm8i18NjlokAqbiFan4=@vger.kernel.org, AJvYcCVwHezfqsw0xAVY0AfAgroQAwhGm46cP01wF342vDzVVvDS5iPhJN/ZIgz2B6eYLIyhSB6ujnRzMca2D8qW@vger.kernel.org
X-Received: by 2002:a05:6102:1173:b0:4c4:f128:3abb with SMTP id
 ada2fe7eead31-4cb8026372bmr8785686137.25.1745317250910; Tue, 22 Apr 2025
 03:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB9597B01823415CB7FCD3BC27B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com> <aAdrkxhHaEpdl05d@smile.fi.intel.com>
In-Reply-To: <aAdrkxhHaEpdl05d@smile.fi.intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Apr 2025 12:20:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
X-Gm-Features: ATxdqUENa0qwyfrGVHcZ3QDmHbGb5nSiuKchVuCF7S-gHUHHmDPBWDnwpEhdUFQ
Message-ID: <CAMuHMdVu33wTjgAHUXdaLFvgnCqMzXGZkcc7i4iug0QP=-WkLA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Aditya Garg <gargaditya08@live.com>, Hector Martin <marcan@marcan.st>, alyssa@rosenzweig.io, 
	Petr Mladek <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>, 
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

Hi Andy,

On Tue, 22 Apr 2025 at 12:12, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Tue, Apr 22, 2025 at 10:07:33AM +0200, Geert Uytterhoeven wrote:
> > On Tue, 8 Apr 2025 at 08:48, Aditya Garg <gargaditya08@live.com> wrote:
>
> ...
>
> > > +Generic FourCC code
> > > +-------------------
> > > +
> > > +::
> > > +       %p4c[hnlb]      gP00 (0x67503030)
> > > +
> > > +Print a generic FourCC code, as both ASCII characters and its numerical
> > > +value as hexadecimal.
> > > +
> > > +The generic FourCC code is always printed in the big-endian format,
> > > +the most significant byte first. This is the opposite of V4L/DRM FourCCs.
> > > +
> > > +The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
> > > +endianness is used to load the stored bytes. The data might be interpreted
> > > +using the host byte order, network byte order, little-endian, or big-endian.
> > > +
> > > +Passed by reference.
> > > +
> > > +Examples for a little-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> > > +       %p4cl   gP00 (0x67503030)
> > > +       %p4cb   00Pg (0x30305067)
> > > +
> > > +Examples for a big-endian machine, given &(u32)0x67503030::
> > > +
> > > +       %p4ch   gP00 (0x67503030)
> > > +       %p4cn   00Pg (0x30305067)
> >
> > This doesn't look right to me, as network byte order is big endian?
> > Note that I didn't check the code.
>
> Yes, network is big endian and this seems right to me. What is the confusion?

On a big-endian machine, it should print 0x67503030, like the host
or explicit big-endian output.

> > > +       %p4cl   00Pg (0x30305067)
> > > +       %p4cb   gP00 (0x67503030)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
