Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D4C174EE4
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 22:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738362918; cv=none; b=pfQTLNQFue/iDQ/hDeJCqPIqbqdGWMOyyp88g1xRbwhLHLdP4n6St9iJq3ZXqHv2EmLQIcdwy15Gi9llMfW40bHvhXWS6jbTC6hKvFSXvKKMoNApNnHZYsh1xhKPaPKFDAy0/xZ0u9Xx2aEEBd16Cn3vSaxGr17P9k4LerBiq00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738362918; c=relaxed/simple;
	bh=IMoAkPvbEAQe4esDP86Cx28qAlhowjew6eeDJWJEgaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtBHTsbdj8HFJnfn6B1H0dBcguvdLdXM+4NARXWTnzb6JXJiWdDwwUZUJNedpIrXDAA3tuSYYnILyS2MIBiY5qEDMMoRnCbihrjO+koiQtTRa/uL+Wk6MjXKZXFDVENpm5iP/5oIloiewPCKTPHyymD5GpI2ZHVQH8bbBWQnqb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Un5hMr8u; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Un5hMr8u"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dd049b5428so18126096d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 14:35:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738362915; x=1738967715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xg5hSIu1VK+Db5UTOgfbyxVoKwXchZ+w1SroS+nui9s=;
        b=Un5hMr8uLNGxVVQiablDqYBVhUyhbzaaEmIFWkhjZGshvpdYag3pcdcS/+OXKYfRyW
         O/Oj8q6sNMmcK8bZwRD2Bc/+s4TU5AduXu++qwt8ussIhkODrQYksDVqUgz81iZUr1KG
         VxjHhqzcfv3JYUw4SrDtOS/xHmsVOnV/r4J0vdh1Oc/I4jCvcS+BSLe/D8bAp3fYL4BH
         Imssukd8GSYRgGhm13cqvKD+8qyXqVF36e4sRcyXwYP2BtqZwgccZfEd77P8FBk9InOW
         hvZfFDIv4ygMh1o63b0yosinUkGFSZen6wdZmkyiIa34yU4aOVXxqKno7DZmUBvdFrRm
         w4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738362915; x=1738967715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xg5hSIu1VK+Db5UTOgfbyxVoKwXchZ+w1SroS+nui9s=;
        b=bUA2HJeQTQhJHgAgcUiqLlDmqkCgwRVYY6nnUNHiqQ82aHkfzh+X88LBqtwSru79dU
         ZMscOjalKNMs1zTF5F55pxztHUt9PUpKajjXzRWtJWI6dSSrqpm369o2oCOnpC8kTt3M
         ikYqe0ydAYwbYqJbiakAyMNe8k4YeYiH/Db0nNLFL50GnpsPGtP5x8wtLau8dV8L3qrO
         /dUQx/fdF8U+KWD5QxDFVHBS5abOOD2buQRV26sTfw5xj7sAFJ7XkzXfZ43ok2cHbWwr
         gKSIagZXSl7iqIDjuz8IdznA1T7sn24kEgGLK+qNAUEulfgGkGxF2V7bYO0ELUEkR/C2
         1tiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrjdGtXRIJViHeL9COvceV63hxXnbyMcBFbjfiiXFPMu2SDQXtEHpHYWcI9lmH4IZOCojpqqRL+9s3N38=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoCzEyf7gpjXvwJPQaqMqunWGpY3euycAUP8EvexT7K9NEVoix
	rSRb1RGHxVJE0ZjDTFrOcYy1GX0vEc7pu4jvBJ37SIlwG6WC/b0lQnOz/WIRiv578Bt06EW/TJ0
	68f7WjTTgMOaL5JcL4jZI8jC9NksOeLfm3O4=
X-Gm-Gg: ASbGncsc87QamkvykskW6n0T2M8lmszyLMHO0rBgDGOCwiUxrHndVjUhVC8A3ZYt0fD
	MO89LbogwAwm/tmPysf68hEZ0F+qEzM7w8S8VJdDJos0h5X02lUziINF1zObzNRizoz794Tq0up
	MRU5+tERY9ryCzBfBvAT+2msyvrA==
X-Google-Smtp-Source: AGHT+IHOqG4XagnozDPprHhQLEo6pbNnHEjKffnxGEl6qqH3xH3TQUsuu4uUDXju+Yuu6OYvfIRPhABliHxVGfJJpRA=
X-Received: by 2002:ad4:5bc7:0:b0:6d8:7e03:c434 with SMTP id
 6a1803df08f44-6e243c364c8mr199453776d6.20.1738362915169; Fri, 31 Jan 2025
 14:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211222945.1325793-1-xur@google.com> <20241219155239.GB24724@willie-the-truck>
 <CAF1bQ=RGKgv42nBkQFB+GXS6603BQr-E1ZbSBc3J044MnsDr3A@mail.gmail.com>
In-Reply-To: <CAF1bQ=RGKgv42nBkQFB+GXS6603BQr-E1ZbSBc3J044MnsDr3A@mail.gmail.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 31 Jan 2025 14:35:03 -0800
X-Gm-Features: AWEUYZl-NY5innccEBN_GMHsgH8VgOy_J8jFM1-WLmykaOmQYXbUkLXmZDvYTj4
Message-ID: <CALJ9ZPMircbGVgKEKuOkM6MzCg9BFZR0n8MZDM=uWDVxk-wfEw@mail.gmail.com>
Subject: Re: [PATCH 1/2] AutoFDO: Remove the architecture specific config
To: Rong Xu <xur@google.com>
Cc: Will Deacon <will@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Han Shen <shenhan@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Alice Ryhl <aliceryhl@google.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rong,

Thanks for the patch! Sorry for the delay in testing it.
I will upload another patch to document steps for using ETM.

Tested-by: Yabin Cui <yabinc@google.com>

Thanks,
Yabin



On Thu, Dec 19, 2024 at 9:20=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> Thanks for the Acked-by.
>
> Regarding the ETM documentation change, I haven't forgotten it. I
> think it's best for Yabin to submit another patch (or revision of his
> previous patch), as he has done all the ETM side work.
>
> Best regards,
>
> -Rong
>
> On Thu, Dec 19, 2024 at 7:52=E2=80=AFAM Will Deacon <will@kernel.org> wro=
te:
> >
> > On Wed, Dec 11, 2024 at 02:29:42PM -0800, Rong Xu wrote:
> > > The CONFIG_AUTOFDO_CLANG option currently depends on
> > > ARCH_SUPPORTS_AUTOFDO_CLANG, but this dependency seems unnecessary.
> > >
> > > Remove ARCH_SUPPORTS_AUTOFDO_CLANG and allow users to control AutoFDO
> > > builds solely through CONFIG_AUTOFDO_CLANG. This simplifies the kconf=
ig
> > > and avoids potential confusion.
> > >
> > > Signed-off-by: Rong Xu <xur@google.com>
> > > Suggested-by: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/Kconfig     | 4 ----
> > >  arch/x86/Kconfig | 1 -
> > >  2 files changed, 5 deletions(-)
> >
> > Acked-by: Will Deacon <will@kernel.org>
> >
> > However, you've dropped the previous hunk you had to
> > Documentation/dev-tools/autofdo.rst which had some text about using ETM
> > to collect fdo data on arm64. It seems like that might still be useful
> > to have?
> >
> > Will
