Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35AB19995D
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 00:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738886408; cv=none; b=R2RHPXDUTx3UWUYUXQWdXTyIN81U6w3Uq521WMRj29VCBm8s0+rHnS7y8rYo9SgIjBn4QdnqmN3yrIr2I6EpzcZoFbVLnB4QUXVo9nCqaU8yNrI2/ot8l/kVVFrkDex2KhXJn+PC5FslNJQw8vYLb+pjXYaPchahuFDlRcDUfXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738886408; c=relaxed/simple;
	bh=chUCDcEzEInCWiQXbeEg0w+EOP4qjigrh2i2js7DTAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fVEfWc4U+Rywx64aX9wl8+EwdFrTl4cHtXsIsM9dC84jPFcACBFN/cPzarhDHtSum2AmjM98V+Y1UwDMcpNaNpoUFrWyeH8yfn7lybXoRpK+BaSpkEeUmIChcD2eR7m4FyyhVCcaDM361ocBFHf9erW41DWoWTdD0Cex5kULvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XTNwQWVB; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XTNwQWVB"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467abce2ef9so96631cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 16:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738886405; x=1739491205; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3s2OEGfvS1PfxV3TnGZWGqOwe5jfP7CRQxSK+W5cvuM=;
        b=XTNwQWVBYUTafna7IK7vDgJ7sgqIUgmnv8UgChjfzV07d4Gj4O5K91hfcV5UbutmwA
         RS2AB7Gwn1se/0t6Lu+gtkMMOBXyS5oBqDWrV784h1Gi/rOb1RhS9KatQ3erhQANV5/6
         rk/aQPJKENB0l/Nonsgt4drDYzgoDdqhNxVaeMbL0XIUVTkHkPkKdu3Gfhs7JSle1HzS
         xZG4Koom9UOt6M7EVtghyuxZY4+HlYe6uqd6hKdzO3/OdJA4ic2gXsjtIIrWz4tefjC8
         zqaztqAWcsIAvU2kVBXh6vuGkSS8j3P9UZ6xlBZEufZ2Xbf3qwvfKJN1JryhtGjLy4LE
         zA6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738886405; x=1739491205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3s2OEGfvS1PfxV3TnGZWGqOwe5jfP7CRQxSK+W5cvuM=;
        b=tbC7BMORdVoBV0yg8nXmtT84vy0zPePrO1YSU/UEZFvppzdu7giGwu1c0i2A1hGUrI
         YQ468n4/ygRT2JZRw11+g3vHl5zfPoHms1tKU7UzG7u1aPP5cw3x+r3Moz8RkkVZi8mt
         me+0mQHPjaS4wY75TnTUF56apGqRpZwHu0PkEI2dNApqd6969TzZDHDh2YuxB+p3x/4z
         45YSvaUJdfVNDNjyWD8KZbROvC3R3y0WUqWBUpNmJi3e2X4Zyk2I+OQrz1BpMWC4D4A1
         WRRzgikbPjigjVds2vb5Kd/f6gJMPyHrIQ4kc3boGcYE8CQ1nqSbMQl1z8BI8/cZIo6r
         B/cQ==
X-Forwarded-Encrypted: i=1; AJvYcCViFuVNcmyW4pdvu9NPt4fGyP9bRgJwsqA9+RzrWQFRrJfllfdBtR73IOuNObLCsPTSoKzeXdJcpGPEr64=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoQHNFqiPjUudSyllLo5jUTQgTUcw0PVA/RYmkx71jtL5nplJ+
	2KMg2oiNJ5YDeJEOvOcDe51PWWuqZHVm265o5V8Lt1pqo72cJLA0fOl1t6S/dFQAwyC6WLSrf6i
	pO3QhyeQQaGW+ANQgc1nY2nCeSSpozk0r7g6F
X-Gm-Gg: ASbGnctq1KeoS5jGA4kanZIRRzQuSLwANm3JuGCAzz2KE98bD/2QYtmtRvsspwjrb52
	hD5e69Ko2XuOzBf6KyOxD2WMTER7cfzDoRYcA2Z2R5mRLICHwFou+c1dcllCamNPImgrRAh9Q1l
	SvmbocVX25o4z4wknUzYsfRHkyqQ==
X-Google-Smtp-Source: AGHT+IHsY1ag2sOIK3JK02gum2DZEW5zecE4KoEUXFFjDCnoCQZYFjF6l1ExbdpVfmOOkIc1JXq8L8KU1rbrQRi3s3o=
X-Received: by 2002:a05:622a:1b8e:b0:466:861a:f633 with SMTP id
 d75a77b69052e-47169c018f0mr532361cf.5.1738886405231; Thu, 06 Feb 2025
 16:00:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206213532.it.087-kees@kernel.org> <20250206214014.3567372-3-kees@kernel.org>
In-Reply-To: <20250206214014.3567372-3-kees@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 6 Feb 2025 15:59:53 -0800
X-Gm-Features: AWEUYZl-0BsWMPB7YR915iCrl5G_SmVkXfJHEMoYyMVyZZI3P_9T9W0LUcexzms
Message-ID: <CAJuCfpEDdtC-NmYu1-RNC8R=Spuc1iQoqy44O8ML92fztF=1bw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] string.h: Use ARRAY_SIZE() for memtostr*()/strtomem*()
To: Kees Cook <kees@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Kent Overstreet <kent.overstreet@linux.dev>, nathan@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, linux-hardening@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Philipp Reisner <philipp.reisner@linbit.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:40=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
> The destination argument of memtostr*() and strtomem*() must be a
> fixed-size char array at compile time, so there is no need to use
> __builtin_object_size() (which is useful for when an argument is
> either a pointer or unknown). Instead use ARRAY_SIZE(), which has the
> benefit of working around a bug in Clang (fixed[1] in 15+) that got
> __builtin_object_size() wrong sometimes.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501310832.kiAeOt2z-lkp@i=
ntel.com/
> Suggested-by: Kent Overstreet <kent.overstreet@linux.dev>
> Link: https://github.com/llvm/llvm-project/commit/d8e0a6d5e9dd2311641f9a8=
a5d2bf90829951ddc [1]
> Signed-off-by: Kees Cook <kees@kernel.org>

Tested-by: Suren Baghdasaryan <surenb@google.com>

Thanks Kees!
CC'ing Andrew Morton since mm-unstable contains my workaround patch
[1] for the issue fixed by this patchset. I'm not sure which tree will
be taking these fixes but once they are in we should drop [1]. Or
maybe we just drop it now from mm-unstable? Seems like only testbot
was the only one who complained...

[1] 0e91345e75b2 ("alloc_tag: work around clang-14 build issue with
__builtin_object_size()")

> ---
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: nathan@kernel.org
> Cc: Andy Shevchenko <andy@kernel.org>
> Cc: linux-hardening@vger.kernel.org
> ---
>  include/linux/string.h | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/string.h b/include/linux/string.h
> index 493ac4862c77..fc5ae145bd78 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -411,7 +411,8 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * must be discoverable by the compiler.
>   */
>  #define strtomem_pad(dest, src, pad)   do {                            \
> -       const size_t _dest_len =3D __builtin_object_size(dest, 1);       =
 \
> +       const size_t _dest_len =3D __must_be_byte_array(dest) +          =
 \
> +                                ARRAY_SIZE(dest);                      \
>         const size_t _src_len =3D __builtin_object_size(src, 1);         =
 \
>                                                                         \
>         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
> @@ -434,7 +435,8 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * must be discoverable by the compiler.
>   */
>  #define strtomem(dest, src)    do {                                    \
> -       const size_t _dest_len =3D __builtin_object_size(dest, 1);       =
 \
> +       const size_t _dest_len =3D __must_be_byte_array(dest) +          =
 \
> +                                ARRAY_SIZE(dest);                      \
>         const size_t _src_len =3D __builtin_object_size(src, 1);         =
 \
>                                                                         \
>         BUILD_BUG_ON(!__builtin_constant_p(_dest_len) ||                \
> @@ -453,7 +455,8 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * Note that sizes of @dest and @src must be known at compile-time.
>   */
>  #define memtostr(dest, src)    do {                                    \
> -       const size_t _dest_len =3D __builtin_object_size(dest, 1);       =
 \
> +       const size_t _dest_len =3D __must_be_byte_array(dest) +          =
 \
> +                                ARRAY_SIZE(dest);                      \
>         const size_t _src_len =3D __builtin_object_size(src, 1);         =
 \
>         const size_t _src_chars =3D strnlen(src, _src_len);              =
 \
>         const size_t _copy_len =3D min(_dest_len - 1, _src_chars);       =
 \
> @@ -478,7 +481,8 @@ void memcpy_and_pad(void *dest, size_t dest_len, cons=
t void *src, size_t count,
>   * Note that sizes of @dest and @src must be known at compile-time.
>   */
>  #define memtostr_pad(dest, src)                do {                     =
       \
> -       const size_t _dest_len =3D __builtin_object_size(dest, 1);       =
 \
> +       const size_t _dest_len =3D __must_be_byte_array(dest) +          =
 \
> +                                ARRAY_SIZE(dest);                      \
>         const size_t _src_len =3D __builtin_object_size(src, 1);         =
 \
>         const size_t _src_chars =3D strnlen(src, _src_len);              =
 \
>         const size_t _copy_len =3D min(_dest_len - 1, _src_chars);       =
 \
> --
> 2.34.1
>
