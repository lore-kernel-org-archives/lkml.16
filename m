Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12441E5020
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738247933; cv=none; b=LUQBQjqRGiabZGpoGM/KuZkahFBVR95aws0QnD2ao6Xgu+uA1taqK74vAkuTXULwX1686Md1N6gCbutGbaNy5cFovdOD8w0ONtV5eghiT/gQ7B8WgeQ7abWHQTyJctNP0vV/0KOC/Yd1rFXFVRBoSYjBrf4+4F86T4hCkCx7Zjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738247933; c=relaxed/simple;
	bh=ndA1DqYJeLDgwxI0sFTIswtI2TRbJRaDwStsY7tYaU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sSw4Mt5W9mGnIdsuVDYafcrJ5AT73Diz1uO+PNyNLW2G7mRB181mzUAEO5NPlzc7CXD3fxwhevxCn3XsrPmpPqTEC4fSksIBmQp+jp0JuNvLLcNr2XWVglUWmmsMCC/Lts/HY+SEv2/HH4ojX4oVMpSCla5EG48xIsxkgJSJSz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4afe2f6cecdso1206753137.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:38:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738247930; x=1738852730;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3koQwFtsYEj+sBiSRxwOt8Kdl4P9BIA497a/eImNeSg=;
        b=WJUiLaZvcfYJkFH6tASNYt3beoTvOwUg00Oxb/H93a1I+KWyS935eCwCuf8raFFYrV
         MynnxqQxiwQNLQj4ONK4PR3mpMAecKi54KcPvj0wwuSIAMKFWmzy45cL9cuEg2jZYOsk
         yMs5+UWiEar9feC5O8FfnBBoGWICVgghm8j1iuminT5ZqfJxc+mC8kcOppYeFjmBE1UT
         hBt9pYRAWTlEbvagBawWV/F24VP1sWLVkfxmaWABU/mKER1vQFAq6BNAgr9VVG0pY0Ao
         EnYDs2V3B50a6nJpgfY7Zl99+h6HUvCT+A6g12Xoe+FbxJ067hU5WdB7ocoJUxwUyeOz
         LxzA==
X-Forwarded-Encrypted: i=1; AJvYcCVDP/pADnCsVL0tudqEvzxlNgsat6+62ayaWyJhAGVO3cnBlJI7o3LnxZCHwjtqvpU+w6bTZfjyohwNGA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cjMNsrK34bR9r/+rh1D5ogx3y2IR8J95GOO1Y8mFpJjszh8A
	eI/e9tQwzPV02JJ+lX43Dq2Y12Evnw4m/Zhm4Fk1gLT8cMan26Y7tB2CgomaOCw=
X-Gm-Gg: ASbGncu8XVAEmlbiUqnai+3aWLM6Kiw4aszKq8/o1gNivgPpJzUeYFBa10dQuUMTapu
	RpLj8aVZ3Yx7MLfcKCU4OydAWwGX+QOA+sx4wLmia8AbNPigRqGa/fJpaKmmsnsOC2Qx9EzO+gb
	ulwOnVXSQMqJ9T76v2jNX6jdXLzc04NTC1Nl9zGarWFblQhA55A8s0TW4EWlXr0taY4K8fQkS1j
	8AH8o5FdUuO5kiYS7NlnkPpLAU4pq4axD8+K9F+34dB1RGAsvyGKZp+Cx/Ljcbl8jFiCuHOOpbQ
	t6Bd1Al7rmDgR5OfCKThne6/PZ15EtkM3sVHNrNiaMUD4QFWGPPjnQ==
X-Google-Smtp-Source: AGHT+IG+WuGCV/lErhNwqXVhg9cjRGjFyFEoErX+CzIT6PdJsH0DYWBL7PAH/hpDEmDTEK4cgdLcUQ==
X-Received: by 2002:a05:6102:1609:b0:4b2:9e5d:baf with SMTP id ada2fe7eead31-4b9b7225816mr2603044137.11.1738247929811;
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b9baccd5cbsm250364137.19.2025.01.30.06.38.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:38:49 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4b9486a15a0so974667137.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 06:38:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS5O6SkAr2a/qwB1dAUkB+NT7Sc9y30/Z/vq0wS3q0UrU5JHmc/lSl9x8trlq+ERWvimoaD7vggRjGyQI=@vger.kernel.org
X-Received: by 2002:a67:f318:0:b0:4af:d48d:5142 with SMTP id
 ada2fe7eead31-4b9b70f3a0bmr2755704137.3.1738247929070; Thu, 30 Jan 2025
 06:38:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241205-xarray-kunit-port-v1-1-ee44bc7aa201@gmail.com>
 <07cf896e-adf8-414f-a629-a808fc26014a@oracle.com> <qdq4k6323orqifgzo7pbg5vakezr3gptfdehghxsyfrhc4kwvb@d4fxbwcl4gjm>
 <CAJ-ks9=U4PZv4NgyH8B7SbHkecGLy+M=G639hSTv-hnPySqk6w@mail.gmail.com>
 <xf3445vgszstqfwycf5wc5owhnifxb3mny5xjjaihghqgnozmd@3h7hnifir4vu>
 <CAMuHMdVcuhzO57Qn-kcUJDM=HmkSwuheyNJPF1tx+gxRKnKZXA@mail.gmail.com>
 <mp6lnt3stfnfd74rwaza5xffh2ya5gylqnxotgrnqaqo3eh2zl@5g257jeiugfn>
 <CAMuHMdWDRLi8AE0PgfAnXundbS0hyTyovUH7yScrY7GtmYYPOQ@mail.gmail.com> <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
In-Reply-To: <9636ed9d-3bfb-4dda-98dc-f945c9d53698@lucifer.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jan 2025 15:38:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
X-Gm-Features: AWEUYZmOwEzWB0gEceqhOwmudbYpt2s9uwC-1Re-pPG58BUZxS-FmbWZ_JWw55Q
Message-ID: <CAMuHMdUFbhzi8J3rmyvVn7HmrxbeyoOwu97w8cnuKJxksa8iaw@mail.gmail.com>
Subject: Re: [PATCH] xarray: port tests to kunit
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>, 
	akpm@linux-foundation.org, christophe.leroy@csgroup.eu, 
	justinstitt@google.com, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev, maddy@linux.ibm.com, morbo@google.com, 
	mpe@ellerman.id.au, nathan@kernel.org, naveen@kernel.org, 
	ndesaulniers@google.com, npiggin@gmail.com, 
	Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Thu, 30 Jan 2025 at 15:09, Lorenzo Stoakes
<lorenzo.stoakes@oracle.com> wrote:
> Having written a ton of test code, I've unfortunately encountered a lot of
> this sort of push-back and it's HUGELY off-putting. Writing test code
> should be ENCOURAGED not litigated against.

I am not discouraging nor pushing back on any testing code (on the
contrary, I test every single new kunit test that appears upstream).
My apologies if I gave the impression.

> The truth is far too little kernel code is tested to any degree, and this
> is part of why.
>
> On kunit collaboration, I attended an in-person talk at LPC on kunit
> userland testing where it was broadly agreed that at this point in time,
> the xarray/radix tree tests weren't really suited to the framework.
>
> Therefore I think the healthy means of pushing forward with integration is
> in sensible discussion and if patches, RFC patches in collaboration with
> authors.

Good.

> The unhealthy approach is to needle one of the biggest contributors to core
> test code in the kernel on a thread because you don't seem to want to cd to
> a directory and run make.

My initial issue was that I could not find out where that is documented.

    $ make help
    ...
    Userspace tools targets:
      use "make tools/help"
      or  "cd tools; make help"

    $ make tools/help
    Possible targets:
    ...
    You can do:
      ...
      $ make tools/all

      builds all tools.

But that command does not build tools/testing/radix-tree, so I was
completely lost.

> Why is this relevant to me? I am the author of the VMA test suite, on which
> I spent countless hours + relied heavily on Liam's work to do so, and
> equally there you have to cd to a directory and run make.

Thanks for your work!  One suggestion for improvement: tools/testing/vma
does not seem to be built by "make tools/all" either.

> But at the same time in both cases, testability of key internal components
> is ENORMOUSLY improved and allows for REALLY exciting possibilities in test
> coverage, really isolating functions for unit testing, enormously fast
> iteration speed, etc. etc.
>
> I ask you to weigh up the desire to enumerate your misgivings about the
> testing approach used here vs. all of the above.

I repeat: I am not against these tests.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
