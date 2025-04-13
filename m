Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9952367C1
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744510670; cv=none; b=jaBx0qkCW99u8S6RyvDGjDdLAxr0e4viL0WA06pUVHOXPWHmXGiPr23fs4oQVJwZrfNWko8uM0hGkukTaBbYNceSBShhEnljJ2lNjgLNHC6sKX95I0KcxwL7PwwrkERl8XrYf+UaVbnGhOnSXvh3UHgOUTf0sJJzYvBGZQkmClQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744510670; c=relaxed/simple;
	bh=XBacDJ8TTx0bZb+ts4bWGx7WTQu7kXS2R4oRAovaA4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jQEI57sDQ30x+K2ClgSaMOA3ZrUOzrH0sCSGjNmZnaw867KbNZWsBqy+PfrEH+cYHaib8XtoKtNbunvWixhlIMtHUYy6/blG4fuJ3ZXeTEjGN/9Dvz3gznpyOJqsceiYA1CDFfWwrAFq0wYGXc3q1mbem0u2w462UKTbewLDdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnLhYLI6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnLhYLI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B7E9C4CEE3
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 02:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744510669;
	bh=XBacDJ8TTx0bZb+ts4bWGx7WTQu7kXS2R4oRAovaA4s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=OnLhYLI6/XOb7ZgH3TYe8LHSuxc0ow7eKuhRW2kkK6dMlxag5Sny9GHhZO+wa3Flu
	 L3B5uWaauGmfJ+MyXAYYhgsEZKsxDL2k9EQISk6ftOOKxqyK0X9viwVlvSxhP0oeuh
	 a8osSABTuCZIwYwMYh+yhvs8rw/jRbQDZwiE6iUrCpg6C57qm/Gmg/eHn9eUVP7LXv
	 GD1wUXcIvJvr3NoVUE6IBO8w5YOrnQWst2S3RQpY3gmK+1dq8ri4Yycr+EyYicMNn5
	 rSa//tDVsYRJ/BBz1OC5JxaHVBGTQJaT/aWY7s+QHB9opMP0CF+ghoW8UTcMKvMc23
	 uEahZKeDE3vrQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac25d2b2354so512049366b.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 19:17:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtJ9RgsEMDKYoo6JWGibdVNinWz2cvRl+gJepXw8CSj2S/6qMzJ0UMXYivZvSz/Np4nH4kZTaEdwfEHro=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeuMvU7woSFll5fBvlL9NR88XueHH5CiZ44K9KZByP81+CHVrc
	4RY84MJO2e1BEwD5aGD/s1BqJOkqlYJ3Mj8luSqWatDzNOiFuBq3AHWeUjKwTRI/M+QLstBJN1l
	kiSThKpyaNjHDRf8XVHQoOoTEmY0=
X-Google-Smtp-Source: AGHT+IFeruouREPtB4pZKqUd6dutMB/oK79JNUlrnPgSUbPi6ZalYJedegLnNmx3x0kSak6pVo+QaF7+AYY1imE5vXg=
X-Received: by 2002:a17:906:719:b0:aca:d6f0:af0c with SMTP id
 a640c23a62f3a-acad6f0af2bmr479281166b.59.1744510668060; Sat, 12 Apr 2025
 19:17:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408092907.22856-1-yangtiezhu@loongson.cn>
 <20250408161239.1023788-1-guanwentao@uniontech.com> <3019eada-7496-ca11-b645-f5efd7d215f4@loongson.cn>
In-Reply-To: <3019eada-7496-ca11-b645-f5efd7d215f4@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 13 Apr 2025 10:17:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H56zc70Rj+ymFYGYXt9rnEpEPcdse2QFxYiiVpDA14UZA@mail.gmail.com>
X-Gm-Features: ATxdqUEQS-csrxBhK5ag-lP5Gq_xogoIx_CkgNQwD8EP1HlD_FAUgrX5tHyLbus
Message-ID: <CAAhV-H56zc70Rj+ymFYGYXt9rnEpEPcdse2QFxYiiVpDA14UZA@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Handle fp, lsx, lasx and lbt assembly symbols
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Wentao Guan <guanwentao@uniontech.com>, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Tiezhu,

On Fri, Apr 11, 2025 at 10:47=E2=80=AFAM Tiezhu Yang <yangtiezhu@loongson.c=
n> wrote:
>
> On 04/09/2025 12:12 AM, Wentao Guan wrote:
> > Hello Yang,
> >
> > I don`t know why change it defination remove "asmlinkage",
> > why not explain it in commit message?
>
> $ grep -rnw "define asmlinkage" .
> ./arch/x86/include/asm/linkage.h:20:#define asmlinkage CPP_ASMLINKAGE
> __attribute__((regparm(0)))
> ./include/linux/linkage.h:22:#define asmlinkage CPP_ASMLINKAGE
>
> include/linux/linkage.h
>
> #ifdef __cplusplus
> #define CPP_ASMLINKAGE extern "C"
> #else
> #define CPP_ASMLINKAGE
> #endif
>
> #ifndef asmlinkage
> #define asmlinkage CPP_ASMLINKAGE
> #endif
>
> So for LoongArch, asmlinkage means extern "C" or NULL, there is no
> need to use asmlinkage for these prototypes because they are not put
> in uapi headers, that is to say, they will be called and built only
> by C compiler rather than C++ compiler, so asmlinkage is actually
> NULL in this case.
>
> Furthermore, there are no asmlinkage for the other exist prototypes
> such as _save_fp, _restore_fp in arch/loongarch/include/asm/fpu.h,
> so in my opinion, just keep them consistent.
>
> But according to Documentation/process/coding-style.rst, it seems
> asmlinkage should be used.
>
> "Large, non-trivial assembly functions should go in .S files, with
> corresponding
> C prototypes defined in C header files.  The C prototypes for assembly
> functions should use ``asmlinkage``."
>
> There are two ways:
> (1) no need to use asmlinkage for these new added prototypes for
>      assembly functions in asm/fpu.h and asm/lbt.h to keep consistent.
>
> (2) use asmlinkage for these new added prototypes for assembly functions
>      in asm/fpu.h and asm/lbt.h according to Documentation, and then add
>      asmlinkage for the other exist prototypes if necessary.
I think this way is better, especially you have CCed stable, it should
really fix something.

Huacai

>
> That's up to the arch maintainer Huacai.
>
> Thanks,
> Tiezhu
>
