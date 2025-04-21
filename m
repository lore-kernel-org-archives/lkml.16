Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5996A1E9B38
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745273676; cv=none; b=Oc2SieHNwhaRee1Mu7PuNFZHnS3/Za9PXEUdRtJ3pznISgTWARcc3p0uXZv2A5fPoyTIHSOG3d9rbt/WrC8sYLEBT9XuGDIwji5GkwMA1rTKKoYPf9wL+QOYwDfdT+hvuf54sYRyfvsFzFjvo1h53CeXMfv7rXajyVCgFl1AhzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745273676; c=relaxed/simple;
	bh=I+fS8BWsJxzLZuIHDFpn3nda+BABRxTodRnpVgbVDgA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBDI6u2PdydRhCLl6yW2atPE60M2j4+A0JGtK/IVtRedzXwSFHTZHmOx5do/y4L9ULDrHJkdLlmOrQNKgl74V4h7v7bpyDgV+/48LMt7aGDhW0l4/FI6NTuz6sPBE4L1gJZn3AO6P2oPJq9b759mEoTsVUizlmjvYEELyfH39mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WohYOHqD; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WohYOHqD"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5259331b31eso1956655e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745273673; x=1745878473; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ze/KZBLQ8SAn7srsJbazi617+XiMAQ4PSnAV1iGpND0=;
        b=WohYOHqDaRKiDli7YKPetaN8Ed7NkO/eGapjwYzeYH8GzTmyo7LX+bIyHBmFFRAvJ2
         zsNoFm0704W82vnvalNLaeAxP0V5ZrO84kIuG4Ac+9LABuoAPEbCZigmykJy2g3IlX8a
         JUQeiYVM/thLtgvy7sS3k+4AYSs7LKmnzcR0nF4rrYOOF6tMmDELu90b5qBV3DzaY92i
         rxzoAja0778rdx4mZ6acGNLSAicZ8Cu9Xmtk752gBW5hejtn96cP5dI4ql/lFkP+G89G
         yFL8Ev/MlCjLMwfykxs0Z12iQVM6k5TQmNr/R4shC7+lyJbmt/5XUlUn/+C/PNupZvO6
         99Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745273673; x=1745878473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ze/KZBLQ8SAn7srsJbazi617+XiMAQ4PSnAV1iGpND0=;
        b=PxavTXQLDZMUZFaXHtY8tnFj9427Msx9HwdJ4hw2gkqyAgU6eM16umP7eWV6BK3O1w
         gavTe3fqCHJVQR3J38zfAgocNjPZBFUNKnVKvUHUV7Lb7um6k+5CdCS+gTCrGisJ+1/2
         Fr5drk1VTztbFRJiifhr+mwWCZA6qMBSL3WbeB5PX2dYl+3FSFob1aauANZbTdVNv7sJ
         R5pYZkyWljP8PuAPyKG253tBRaOeH02WalLqeuZe+3h5dM0VC002brKynTbdTw+KxLaG
         t31DAdZZl4v2pPPpJ0HkcRQjonUKI1RlvRfPhjdYupgktB8irZ9uJWjorQ7Cb6yViAiS
         RH2g==
X-Forwarded-Encrypted: i=1; AJvYcCWh6g8xuots4XF8xphMgPTB98q+JPIaeXzh/yQfx+P7LvOGQBgu8/nvwJltzQUkmXsuYT7UrZ50c/w9jnU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjPgMW5/p2GzdRDmCFxLTX/XXGsouql9nI3Pczn9WQydJlrvH8
	78jp9uRfGN8cxzgqhvO+QaoYwmDpNPQb8WS42e6GuOMQfM+E8MsULiIc01No7z6cVY9eCd0J5rT
	R5Gyb78PknvKYc6doZNHEkbWXQnFlhRh+jYo5
X-Gm-Gg: ASbGncvltEhUDkEWb7yyopx8oPdiNJ2veG+GXT/jjPnbKSGpYqwk6gKT7Ge5D7Fd7E+
	6Igh8z/32h+E8g29596maHqyx0PNGxrfyngUYtXEKyh5Ov7QHe0v7bUO/Dp74afqNKCJd2v5ixc
	rFpfCXCBbegm9GH369tGFNuA==
X-Google-Smtp-Source: AGHT+IFxHYOugr6C48wO68yTTOBk7oPHItPFJzeV9k+AVGrZNWzX1hubYeJVAkRQHrqSFyznWM7DLyj2iw3cza70BSU=
X-Received: by 2002:ac5:c252:0:b0:529:2644:5eec with SMTP id
 71dfb90a1353d-5292644603fmr7360353e0c.8.1745273672851; Mon, 21 Apr 2025
 15:14:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250412010940.1686376-1-dylanbhatch@google.com> <20250412010940.1686376-2-dylanbhatch@google.com>
In-Reply-To: <20250412010940.1686376-2-dylanbhatch@google.com>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 21 Apr 2025 15:14:21 -0700
X-Gm-Features: ATxdqUFzGJwrYp9hInlANxzcemcPCph2eSPtOYX9msHSoocZGM8q3RrkHGLCnhk
Message-ID: <CADBMgpwh+9YxbGvyWwT3VjFLaAvdFFexHe-9yBmpOYsPsN-xrg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: patching: Rename aarch64_insn_copy to text_poke.
To: Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 11, 2025 at 6:10=E2=80=AFPM Dylan Hatch <dylanbhatch@google.com=
> wrote:
>
> Match the name and signature of the equivalent in the x86 text-poke API.
> Making the src pointer const also allows this function to be
> interchangeable with memcpy().
>
> Signed-off-by: Dylan Hatch <dylanbhatch@google.com>
> ---
>  arch/arm64/include/asm/text-patching.h |  2 +-
>  arch/arm64/kernel/patching.c           | 12 ++++++------
>  arch/arm64/net/bpf_jit_comp.c          |  2 +-
>  3 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/arm64/include/asm/text-patching.h b/arch/arm64/include/=
asm/text-patching.h
> index 587bdb91ab7a6..450d806d11109 100644
> --- a/arch/arm64/include/asm/text-patching.h
> +++ b/arch/arm64/include/asm/text-patching.h
> @@ -9,7 +9,7 @@ int aarch64_insn_write(void *addr, u32 insn);
>
>  int aarch64_insn_write_literal_u64(void *addr, u64 val);
>  void *aarch64_insn_set(void *dst, u32 insn, size_t len);
> -void *aarch64_insn_copy(void *dst, void *src, size_t len);
> +void *text_poke(void *dst, const void *src, size_t len);
>
>  int aarch64_insn_patch_text_nosync(void *addr, u32 insn);
>  int aarch64_insn_patch_text(void *addrs[], u32 insns[], int cnt);
> diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
> index 1041bc67a3eee..e07dc32620053 100644
> --- a/arch/arm64/kernel/patching.c
> +++ b/arch/arm64/kernel/patching.c
> @@ -102,9 +102,9 @@ noinstr int aarch64_insn_write_literal_u64(void *addr=
, u64 val)
>         return ret;
>  }
>
> -typedef void text_poke_f(void *dst, void *src, size_t patched, size_t le=
n);
> +typedef void text_poke_f(void *dst, const void *src, size_t patched, siz=
e_t len);
>
> -static void *__text_poke(text_poke_f func, void *addr, void *src, size_t=
 len)
> +static void *__text_poke(text_poke_f func, void *addr, const void *src, =
size_t len)
>  {
>         unsigned long flags;
>         size_t patched =3D 0;
> @@ -132,12 +132,12 @@ static void *__text_poke(text_poke_f func, void *ad=
dr, void *src, size_t len)
>         return addr;
>  }
>
> -static void text_poke_memcpy(void *dst, void *src, size_t patched, size_=
t len)
> +static void text_poke_memcpy(void *dst, const void *src, size_t patched,=
 size_t len)
>  {
>         copy_to_kernel_nofault(dst, src + patched, len);
>  }
>
> -static void text_poke_memset(void *dst, void *src, size_t patched, size_=
t len)
> +static void text_poke_memset(void *dst, const void *src, size_t patched,=
 size_t len)
>  {
>         u32 c =3D *(u32 *)src;
>
> @@ -145,14 +145,14 @@ static void text_poke_memset(void *dst, void *src, =
size_t patched, size_t len)
>  }
>
>  /**
> - * aarch64_insn_copy - Copy instructions into (an unused part of) RX mem=
ory
> + * text_poke - Copy instructions into (an unused part of) RX memory
>   * @dst: address to modify
>   * @src: source of the copy
>   * @len: length to copy
>   *
>   * Useful for JITs to dump new code blocks into unused regions of RX mem=
ory.
>   */
> -noinstr void *aarch64_insn_copy(void *dst, void *src, size_t len)
> +noinstr void *text_poke(void *dst, const void *src, size_t len)
>  {
>         /* A64 instructions must be word aligned */
>         if ((uintptr_t)dst & 0x3)
> diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.=
c
> index 70d7c89d3ac90..b5be90edff410 100644
> --- a/arch/arm64/net/bpf_jit_comp.c
> +++ b/arch/arm64/net/bpf_jit_comp.c
> @@ -2047,7 +2047,7 @@ bool bpf_jit_supports_kfunc_call(void)
>
>  void *bpf_arch_text_copy(void *dst, void *src, size_t len)
>  {
> -       if (!aarch64_insn_copy(dst, src, len))
> +       if (!text_poke(dst, src, len))
>                 return ERR_PTR(-EINVAL);
>         return dst;
>  }
> --
> 2.49.0.604.gff1f9ca942-goog
>

Friendly ping.
