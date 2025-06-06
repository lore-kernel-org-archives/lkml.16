Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518461E98F3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749234463; cv=none; b=TxU6KseAGrBE7P3Xqg+Br0xyHjdAkWBuhLMbaphfbpqGLwLA56wb6Pr2yCVkoVdTuFLC6fnEmXjbt+cwAwFwSngbzm0IlmeKw0cW4Q+t8cGIVp1SgPh7rBA2Kt1jpRJyTUb2a3Mbkhfmystu8gI02WwDpZXVh84Af+4rHJASWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749234463; c=relaxed/simple;
	bh=7Mrtp/ujC7IUUY/xhLK4hRCZlis7yEUVD6oZar6upKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rIkUV6MgDVHfIZfS1b1rmEiQYew+TaZjH9XAiMzho/VQChhUXsOQJfH7bPawjsNELkT3m/YbLRVoykaW1ugWCjPuKPtOiQWmn9em8R6Y9chRlSsTDbQomT7W6SRk3kG1JE9P+t60q/SSCIxBTpsbr+IrD9G8YjPK3btNCSIAv+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VzZQZc97; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VzZQZc97"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3ddd1a3e659so19615ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749234460; x=1749839260; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UH9iNsg9TJrDDcNjF332Ex2YPRc93vYZGAZZ8zWp6+s=;
        b=VzZQZc97ww68pRZPgS3ffiVLRmzPQ1dSmpIwly+jEjkOYqbaOCgo3nDWMbRn2YY4iL
         AW8gP3N9sgD6Pe18zejBoxiRGheAfeM2o6R0Ss+unL9aCd594+ylgyfgviLE3azJ349p
         N0tLhFDvpARnUyxxoBZlhAA3u7RMXIxq8kiqEcAlhXtaQ/UOK0MjAJ94Ni+szO5NJ+UH
         9yYt17NuCyUM3ksiV/RHv7QN2VsRCMbBVLPmGtOzS18ttq4LbPuLHCZjjbt4C1ih40KO
         egmepWKQ/MoQM+QCkyzDXBXYyGt6K74wdFGZ1bmuC7s5WMrJ2oXO46nvdbK7li1cyCMs
         sm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749234460; x=1749839260;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UH9iNsg9TJrDDcNjF332Ex2YPRc93vYZGAZZ8zWp6+s=;
        b=s5Q67nQsLzJqR8JfmfQSX4rPcpGZUXKp493CcEoTlYxQAhwEdtQSKsba6m5X2Dt24E
         lARUrs6fc5GRgY/49OERpOB/YVAGRI1O9A1aBjXqm+EgteMjNq/LqbRIhm4b/qyeRY3a
         WFB8Te3Moj7g1YOiPgOalv+gxd+6JADOnqgATpvbbJiCl1OeL4jMLGWXd/ghQgUsgBeD
         boiUVjulDvzGReqqPCyMRNpSy12mv7XgBoAilszszzhJ78lq9BmHdvH3NCzlWQ57zjyK
         jF+U4tKv4MCPuAeh8cU0RNkdMKQ9WP3A00rY+Bxu+J7YDjrcTGRIa83Xx2eXkvl7GIcz
         tWvg==
X-Forwarded-Encrypted: i=1; AJvYcCW7I2LRYSGTyK0v6seJ4tGVNyh3UYs7K6cMPBZl5jzWO1Nqi/zxYwfa1EP0NPvw/aK8Iqb2P21kim2V/Hs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqHv1kzL3OXcemFjUg2q4vl4gaQwWXHxPQ417cyK2UamOsahbo
	jHprB4yzcL7qhvy/tkCNGkHaKHbub/fV75/lHWOL4OlVJPEi769uQgiTiRdo7Rk7Qx6p+v6okmw
	Fit2JC6wBSpNpW0z3Qo+39yw9VoLHaXCAqkIlSgMR
X-Gm-Gg: ASbGncusq/oHhr06v81UHhwmZgrfJIl3iTXxHn2T6Nb5kom3BKJwu2dfckMEWyFFJRq
	d/UuGN6u8rM3f+NpYSyIvEZbE18pIPc0uICvVmbpShgW1g5q22ecCxR8K4uSMODcRdBv6QQEmw5
	z6UTg0+fkHqJ884Ey6NO3XD0CarcAUlBff5lBfn1sAf7O3
X-Google-Smtp-Source: AGHT+IEJXe0nz5dAwhgVL5WD4u2+k2DG6pcgtJF8RoF6Fyj1dX4bmbkKisdB8JLUuxOTTt9TvaiXB+XWXumzd7r17lQ=
X-Received: by 2002:a05:6e02:398c:b0:3dc:670e:ad5f with SMTP id
 e9e14a558f8ab-3ddd74d763dmr339265ab.14.1749234460177; Fri, 06 Jun 2025
 11:27:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521225307.743726-1-yuzhuo@google.com> <20250521225307.743726-3-yuzhuo@google.com>
 <aC9lXhPFcs5fkHWH@x1> <CADQikVDs3msXqZ6tyoXR0WeN4D_9snxWyk2kXeDw5iAs+BHFuw@mail.gmail.com>
In-Reply-To: <CADQikVDs3msXqZ6tyoXR0WeN4D_9snxWyk2kXeDw5iAs+BHFuw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 6 Jun 2025 11:27:28 -0700
X-Gm-Features: AX0GCFsJf9BoOQBJo9u8SiBY-wGn-QaijMbtUCmBq-anRCNCzEGR20_B5-Gw7iw
Message-ID: <CAP-5=fV11L=5cBaYcd0ftVyk8=Tm4+NWCoTG+MBnAwjEogS5iA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] perf tools: Add sha1 utils
To: Yuzhuo Jing <yuzhuo@google.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Eric Biggers <ebiggers@google.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Liang Kan <kan.liang@linux.intel.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, James Clark <james.clark@linaro.org>, 
	Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 11:17=E2=80=AFAM Yuzhuo Jing <yuzhuo@google.com> wro=
te:
>
> Hi Arnaldo,
>
> Thanks for testing the patches!
>
> > In file included from util/sha1_generic.c:18:
> > util/sha1_base.h: In function =E2=80=98sha1_base_do_finalize=E2=80=99:
> > util/sha1_base.h:77:21: error: comparison of integer expressions of dif=
ferent signedness: =E2=80=98unsigned int=E2=80=99 and =E2=80=98int=E2=80=99=
 [-Werror=3Dsign-compare]
> >    77 |         if (partial > bit_offset) {
> >       |                     ^
> > cc1: all warnings being treated as errors
>
> Oh, I didn't see that on my GCC 14.2.  A quick fix would work:
>
> --- /dev/fd/63  2025-06-04 09:54:42.344516115 -0700
> +++ tools/perf/util/sha1_base.h 2025-06-03 15:43:39.194036707 -0700
> @@ -71,7 +69,7 @@
>  static inline int sha1_base_do_finalize(struct sha1_state *sctx,
>                                         sha1_block_fn *block_fn)
>  {
> -       const int bit_offset =3D SHA1_BLOCK_SIZE - sizeof(__be64);
> +       const unsigned int bit_offset =3D SHA1_BLOCK_SIZE - sizeof(__be64=
);
>         __be64 *bits =3D (__be64 *)(sctx->buffer + bit_offset);
>         unsigned int partial =3D sctx->count % SHA1_BLOCK_SIZE;
>
>
> To test it, I added -Werror=3Dsign-compare to my local Makefile.config to
> force the error.
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index d19d1f132726..9909611be301 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -225,9 +225,9 @@ endif
>
>  # Treat warnings as errors unless directed not to
>  ifneq ($(WERROR),0)
> -  CORE_CFLAGS +=3D -Werror
> -  CXXFLAGS +=3D -Werror
> -  HOSTCFLAGS +=3D -Werror
> +  CORE_CFLAGS +=3D -Werror=3Dsign-compare -Werror
> +  CXXFLAGS +=3D -Werror=3Dsign-compare -Werror
> +  HOSTCFLAGS +=3D -Werror=3Dsign-compare -Werror
>  endif
>
>  ifndef DEBUG
>
>
> While testing with "make -C tools/perf -f tests/make make_debug", I saw
> similar compile errors in libjvmti.c:
>
> jvmti/libjvmti.c: In function =E2=80=98copy_class_filename=E2=80=99:
> jvmti/libjvmti.c:148:39: error: comparison of integer expressions of
> different signedness: =E2=80=98int=E2=80=99 and =E2=80=98long unsigned in=
t=E2=80=99
> [-Werror=3Dsign-compare]
>   148 |                         for (i =3D 0; i < (size_t)(p - class_sign=
); i++)
>       |                                       ^
> jvmti/libjvmti.c:155:31: error: comparison of integer expressions of
> different signedness: =E2=80=98int=E2=80=99 and =E2=80=98size_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99}
> [-Werror=3Dsign-compare]
>   155 |                 for (j =3D 0; i < (max_length - 1) && file_name
> && j < strlen(file_name); j++, i++)
>       |                               ^
> jvmti/libjvmti.c:155:68: error: comparison of integer expressions of
> different signedness: =E2=80=98int=E2=80=99 and =E2=80=98size_t=E2=80=99 =
{aka =E2=80=98long unsigned int=E2=80=99}
> [-Werror=3Dsign-compare]
>   155 |                 for (j =3D 0; i < (max_length - 1) && file_name
> && j < strlen(file_name); j++, i++)
>       |                                                                  =
  ^
>
> I've just sent a separate patch to the mailing list:
> https://lore.kernel.org/lkml/20250604173632.2362759-1-yuzhuo@google.com/T=
/

Thanks Yuzhuo! I guess this happened because jvmti.h is missing in the
test container. It seems to make sense to add -Wsign-compare to the
standard CFLAGS to lower the chance of breaking this container again.

> > Humm that part is the same as in the kernel...
> >
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ line=3D$(ctags -x --c-kinds=3D=
f include/crypto/sha1_base.h | awk '$1 =3D=3D "sha1_base_do_finalize" {prin=
t $3}')
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ sed -n $line,\$p include/crypt=
o/sha1_base.h | awk '{print} /\{/ {c++} /\}/ {c--; if (c=3D=3D0) exit}' > /=
tmp/original
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ line=3D$(ctags -x --c-kinds=3D=
f tools/perf/util/sha1_base.h | awk '$1 =3D=3D "sha1_base_do_finalize" {pri=
nt $3}')
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ sed -n $line,\$p include/crypt=
o/sha1_base.h | awk '{print} /\{/ {c++} /\}/ {c--; if (c=3D=3D0) exit}' > /=
tmp/copy
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$ diff -u /tmp/original /tmp/cop=
y
> > --- /tmp/original       2025-05-22 14:48:31.338406860 -0300
> > +++ /tmp/copy   2025-05-22 14:48:58.401603439 -0300
> > @@ -1,3 +1,7 @@
> > +
> > +       return 0;
> > +}
> > +
> >  static inline int sha1_base_do_finalize(struct shash_desc *desc,
> >                                         sha1_block_fn *block_fn)
> >  {
> > @@ -13,10 +17,3 @@
> >
> >                 block_fn(sctx, sctx->buffer, 1);
> >         }
> > -
> > -       memset(sctx->buffer + partial, 0x0, bit_offset - partial);
> > -       *bits =3D cpu_to_be64(sctx->count << 3);
> > -       block_fn(sctx, sctx->buffer, 1);
> > -
> > -       return 0;
> > -}
> > =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> There were some other fixes that I made only to the perf tree version,
> while maintaining verbatim for other parts.  Here's a script that
> retains and compares only the copied parts.
>
>   # Ignore everything after sha1_transform
>   diff -u -B -I "^#include " <(sed -n
> '/EXPORT_SYMBOL(sha1_transform)/q;p' lib/crypto/sha1.c)
> tools/perf/util/sha1.c
>   diff -u -B -I "^#include " -I "sha1_zero_message_hash" -I "^struct
> sha1_state;$" -I "^void sha1_init(__u32 \*buf);$" \
>       <(sed 's/shash_desc/sha1_state/g;' include/crypto/sha1.h)
> tools/perf/util/sha1.h
>   diff -u -B -I "^EXPORT_SYMBOL" -I "^#include " \
>       <(sed 's/shash_desc \*desc/sha1_state *sctx/g;
> /shash_desc_ctx(desc)/d' include/crypto/sha1_base.h)
> tools/perf/util/sha1_base.h
>   # Ignore everything after crypto_sha1_finup
>   diff -u -B -I "^EXPORT_SYMBOL" -I "^#include " \
>       <(sed -n -e '/const u8
> sha1_zero_message_hash/,/EXPORT_SYMBOL_GPL(sha1_zero_message_hash)/d'
> \
>                -e 's/shash_desc/sha1_state/g;
> /EXPORT_SYMBOL(crypto_sha1_finup)/q;p' crypto/sha1_generic.c) \
>       tools/perf/util/sha1_generic.c
>
> And the changes are as below (including the quick fix above), with one
> changing the sign and integer type and another fixing type mismatch from
> const u8 * to const char *.
>
> Should we send another patch to the kernel tree version to fix the sign
> error, or we add rules to allow perf tree only changes?

I believe there will need to be a set of patches for the kernel sha1
code (fixing -Wsign-compare, any other typing issues) and a set of
patches for perf with the check-headers.sh updated as your scripts
check above. The perf patches shouldn't assume kernel patches have
landed. The perf check-headers.sh produces a warning but doesn't stop
the perf build. When the kernel changes land we can update the perf
check-headers.sh expectations.

Thanks,
Ian

> --- /dev/fd/63  2025-06-04 09:54:42.344516115 -0700
> +++ tools/perf/util/sha1_base.h 2025-06-03 15:43:39.194036707 -0700
> @@ -71,7 +69,7 @@
>  static inline int sha1_base_do_finalize(struct sha1_state *sctx,
>                                         sha1_block_fn *block_fn)
>  {
> -       const int bit_offset =3D SHA1_BLOCK_SIZE - sizeof(__be64);
> +       const unsigned int bit_offset =3D SHA1_BLOCK_SIZE - sizeof(__be64=
);
>         __be64 *bits =3D (__be64 *)(sctx->buffer + bit_offset);
>         unsigned int partial =3D sctx->count % SHA1_BLOCK_SIZE;
>
> @@ -95,7 +93,7 @@
>         __be32 *digest =3D (__be32 *)out;
>         int i;
>
> -       for (i =3D 0; i < SHA1_DIGEST_SIZE / sizeof(__be32); i++)
> +       for (i =3D 0; i < SHA1_DIGEST_SIZE / (int)sizeof(__be32); i++)
>                 put_unaligned_be32(sctx->state[i], digest++);
>
>         memzero_explicit(sctx, sizeof(*sctx));
> --- /dev/fd/63  2025-06-04 09:54:42.344516115 -0700
> +++ tools/perf/util/sha1_generic.c      2025-05-16 10:52:59.219531034 -07=
00
> @@ -27,7 +23,7 @@
>         u32 temp[SHA1_WORKSPACE_WORDS];
>
>         while (blocks--) {
> -               sha1_transform(sst->state, src, temp);
> +               sha1_transform(sst->state, (const char *)src, temp);
>                 src +=3D SHA1_BLOCK_SIZE;
>         }
>         memzero_explicit(temp, sizeof(temp));
>
> Thanks!
>
> Best regards,
> Yuzhuo
