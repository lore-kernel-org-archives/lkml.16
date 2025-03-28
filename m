Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF6819992C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 16:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743179996; cv=none; b=kVrbEpe74aS7lgNF+PVhExeyWwTx6uAY7kZW2LK9SUQe0OMVKUcf1o2fN5aWD5augF3t/2JCNKr6m7Ru2eeDg9BvTHKepq7l6syMu8jeCiRjxyOvtKc8KEQmp34mr3KZuowdos380IcG5IypTuhOp8+wEJhmjBVudxdQM4LoGWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743179996; c=relaxed/simple;
	bh=ZacKuhiyChdsT91YTCJru7KavN6apd7FNn7UGaUQz5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2poqaEMC7AY2+4GVn42cRNiQ6G35FB0vrvi0Vx0cljG7jl3dViXRlXKuMlpuvHoys1Wa+402G0pYNZCIyIqMoe98nZpLQE3JcEx9+72PHw1B2aMeWOLHqDGQ705L0E1go+8YsbkDsFBwrFcWW6XA96g6CZavS1cJ6lq7rrfJPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A8RtfbLf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A8RtfbLf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240aad70f2so4145ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743179993; x=1743784793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wcE6ARy1rUfxvRGohneaNEBtA+LaOXSM2dLoJGL3SHA=;
        b=A8RtfbLfRKDd81WucWtOgHlJs+HbedbQXcX7hiFmL7wzxoPK+Sgqxk687zFCo4+O4t
         7quOEMHQJ7JbzssikyjeTSsMl3rdPwvuh8gqOnhC9AdN7HiYKqk05LWm9ttM/nuHBvnr
         pPLk1KwLrN7AZFucopJWG/ZEtgCEl3ulHciLwD8wfSv6XnRjiOxjtFRIpbvelK66pToA
         VfkVrx3uPDjS9vd4C+eoFmMGKyQ7PYxxi/x+2oQPu+gMcEpu0kPiKRZNBOUm9M7KusGn
         6QJgwatOtbYAjKs+3eeW6KtbKmxnGqiy7/6HhvP0Wsi/+73YXlaUhRZZsS2ZHGUzWciR
         mncA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743179993; x=1743784793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wcE6ARy1rUfxvRGohneaNEBtA+LaOXSM2dLoJGL3SHA=;
        b=jfbsKXEgH2o7BWCO0Haix5F1YOlpGqKm7uQsuW/ZAcvAdCRgkBLkFJAXGCu6x/N0tf
         7HQJpyZE39UlkLUMxRvBK/mMviePYYW0mD6+Uykku8Z5co1sPbaftrV3adL5IqvVqAY2
         YW/GMDGvtAUBq+UzhbgJBqSLHkQ3wBCGPXuDKHmhut+9sBYHOzfR9QNL7fR8UXxSauGt
         ljRHdCWM7GPeBW1l6R4dFPsNBgEq46Izm+P5VUzH2vWygisA3MH4v4qum02/Y13WYLsD
         sNuHA0MI7U4yoAXvDETMep06APIpNOZy7wH/4P+PiYn3jWFx7whODwZRJ1JBQFobq9v3
         JHDw==
X-Forwarded-Encrypted: i=1; AJvYcCUKBsGOQg4gxZIZFUoOsEjf1/SuWfTFvookcWevuFoYr1Fiszppnrzqz6mujIzwxojYCwr3002pMhk2zA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXYP0R+1Uvt8Xb6Nz7vHYUTyQJN9suINvQ3lPhe3fCdsa0z+Ok
	SL9lYsO8+ygOED9XDnN8SK82cCKDNXM73XKraslpgLl/ly4wZwbJaJyIgiTlFBXZBoxG1w4GiqH
	fhx2hmYXoptxPVpjOwEIDEFtvnquUeS1dUm47
X-Gm-Gg: ASbGnct1JBwkunHrDZ9azgLTwDAzFVj67qGfD0c2si6U7PT97YumKkybbetV41QS2PG
	/+Li0kb/jEWaJhV/lyhVqRKijPwgWl42IQbbecw+8epjXviPPq94zXlgBGTGEHkRXDkHhOjkQUF
	n6TM3H0fwxF9cbjebWpUoUu9Fe6dE=
X-Google-Smtp-Source: AGHT+IETTkV/cGIS2O59Mcs+/mE1owA30OPhyKUkj7VBuXWdvRUbRDBdmL0g+tZHFqn9h+WIqqqBY/9gRriAXKqSLwk=
X-Received: by 2002:a17:902:d585:b0:217:8612:b690 with SMTP id
 d9443c01a7336-22920ad2436mr3317935ad.8.1743179993199; Fri, 28 Mar 2025
 09:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250328135221.10274-1-leo.yan@arm.com>
In-Reply-To: <20250328135221.10274-1-leo.yan@arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 28 Mar 2025 09:39:41 -0700
X-Gm-Features: AQ5f1JoJ2on2fM5C_xTgqBXgthup1ISLyfPcE0FmDBiCkXLSGsQ5w9qhH9dU0Qg
Message-ID: <CAP-5=fU5y_xKaWnh8tumyjTfJZdr2i+tPUaECyPs_vdhKdYWLg@mail.gmail.com>
Subject: Re: [PATCH] tools build: Use -fzero-init-padding-bits=all
To: Leo Yan <leo.yan@arm.com>
Cc: Nick Desaulniers <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2025 at 6:52=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> GCC-15 release claims [1]:
>
>   {0} initializer in C or C++ for unions no longer guarantees clearing
>   of the whole union (except for static storage duration initialization),
>   it just initializes the first union member to zero. If initialization
>   of the whole union including padding bits is desirable, use {} (valid
>   in C23 or C++) or use -fzero-init-padding-bits=3Dunions option to
>   restore old GCC behavior.
>
> As a result, this new behaviour might cause unexpected data when we
> initialize a union with using the '{ 0 }' initializer.
>
> Since commit dce4aab8441d ("kbuild: Use -fzero-init-padding-bits=3Dall"),
> the kernel has enabled -fzero-init-padding-bits=3Dall to zero padding bit=
s
> in unions and structures.  This commit applies the same option for tools
> building.
>
> The option is not supported neither by any version older than GCC 15 and
> is also not supported by LLVM, this patch adds the cc-option function to
> dynamically detect the compiler option.
>
> [1] https://gcc.gnu.org/gcc-15/changes.html
>
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>
> This patch was originally from [1]. After consideration, the top level
> of the tools directory is a better place to accommodate this option
> rather than perf folder.
>
> [1] https://lore.kernel.org/linux-perf-users/20250320105235.3498106-1-leo=
.yan@arm.com/
>
>  tools/scripts/Makefile.include | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/tools/scripts/Makefile.include b/tools/scripts/Makefile.incl=
ude
> index 0aa4005017c7..e912a10afd89 100644
> --- a/tools/scripts/Makefile.include
> +++ b/tools/scripts/Makefile.include
> @@ -40,6 +40,19 @@ EXTRA_WARNINGS +=3D -Wwrite-strings
>  EXTRA_WARNINGS +=3D -Wformat
>  EXTRA_WARNINGS +=3D -Wno-type-limits
>

It'd be nice to bring in the comment for try-run that's in
./scripts/Makefile.compiler:
```
# try-run
# Usage: option =3D $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
# Exit code chooses option. "$$TMP" serves as a temporary file and is
# automatically cleaned up.
```

> +try-run =3D $(shell set -e;              \
> +       if ($(1)) >/dev/null 2>&1;      \
> +       then echo "$(2)";               \
> +       else echo "$(3)";               \
> +       fi)
> +
> +__cc-option =3D $(call try-run,\
> +       $(1) -Werror $(2) -c -x c /dev/null -o /dev/null,$(2),)
> +cc-option =3D $(call __cc-option, $(CC),$(1))
> +

I see differences with the ./scripts/Makefile.compiler version of
these functions:
```
# __cc-option
# Usage: MY_CFLAGS +=3D $(call
__cc-option,$(CC),$(MY_CFLAGS),-march=3Dwinchip-c6,-march=3Di586)
__cc-option =3D $(call try-run,\
       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))

cc-option =3D $(call __cc-option, $(CC),\
       $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS),$(1),$(2))
```
I'm just wondering why as if we need to update these in the future
it'd be easier if the two were identical.

Thanks,
Ian

> +# Explicitly clear padding bits with the initializer '{ 0 }'
> +CFLAGS +=3D $(call cc-option,-fzero-init-padding-bits=3Dall)
> +
>  # Makefiles suck: This macro sets a default value of $(2) for the
>  # variable named by $(1), unless the variable has been set by
>  # environment or command line. This is necessary for CC and AR
> --
> 2.34.1
>
