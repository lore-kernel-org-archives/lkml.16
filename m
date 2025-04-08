Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F250225486E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744146504; cv=none; b=bjoEdSlQExPkE5Hs7nLysoLsC5tUfowtSqYDK2O2iVi3lDN2D4orQcER6jb4MuWBQxSgbcFog/UEZERLOYH99nuNnqrMObFp6tDBzDGH8hECbr+PNxphow//UuQPpFWFezlgvUnn7WJfTomBKeX15v9CIaj5GWEl4vgawmDAwmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744146504; c=relaxed/simple;
	bh=kPUDG6NeUeE/nqmHqfdxUuwigYQHbxGKLoYqWps1Cx0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLsPlIAeDgHrBfLdZTUzT4YKzm4FTgSxLrh+rtkTakQenmqNWMuAd8nvKWY8KoUxMqsxvjZEk1i0b0l8BYCT1kLbnNm4UTAbEG+uuMpzWiigTy9rJIX0kQTbnW+D89hy3ptRqz3sBNFtrAV5CNzzh3Kn9hmKBEGYvOsKGWxlYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VMblmJKK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VMblmJKK"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4774611d40bso74691cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744146502; x=1744751302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnu3bvgHMxtoAUB0jZkySCT3ifjhzRfTKB6ZlP7NxGo=;
        b=VMblmJKKSlROL1WQm0StrWJ1zo6owVuE8V6D8IuCGZfEHVU9+R+ctklQY2WfGoK5Ue
         3k83cHxHMpGd35cfn0BT1nyVdFH7/lrAws8IasjPL9MX6BDTI2wdq6FQ154p3QvzErQY
         iok2Wx/JswjiY79YTYdDaiorI2CFEv30QVTxYDzLP9vTuiq94fw7BKDvuwLUdCnLL7N/
         ZYE6bfkuuCGmCKQmH4Haeeuc+LDNzVCbX8nvgARjRJyfhWd82lQkFtzZtBjPRfx6I1og
         Uub26dxCoLYKt5FfPMqmLj8qce4r54E9x06h6bAsWRNDovIIKVskVppUIr91EU4nZyQo
         JzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744146502; x=1744751302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnu3bvgHMxtoAUB0jZkySCT3ifjhzRfTKB6ZlP7NxGo=;
        b=MPh735ljQS4bEuchj0benskSOn9hS0X0Sew6Wd4dVZmUmDzjsYpuRjCp+5hguhbO1S
         VPEAQ6bgHzkXQ64Y7s3WLuhJF0WyHgRR1zVtwOWI4D5VaUV9RglAD7r+DD4xKR7HPgwB
         ROjksgF84g47jjUUMxuk5L8lO0hePFVptbAoVVa4M44P7kwDadt6iQyXU99STxMN6RLe
         7BJnVET05Xd1iwVaTCVupNXN9wi7UM2RlfHi7MreGEgqdwLxhS39TniLNcReZXx/7Yqt
         w1s3T+YbDQJTfD3WePi4xBNpMzJgWYBXjyexmrmlZK5Mvpr/fde1+ZxNmNgv0d1Jctu6
         48+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKuaWzU9Cpa2FouiNJIf3c8RVrMmMpFLzjr92WRgremhHDH1AkSo2JQsXsTJMqvXZmgROYGbyYP6EV+94=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDHmLlGzVYwM9JtS/XnkZy2e9RMSTOkWo4ZpCf995Q4oHdvyQR
	R98GZ2O3FGlz+4QEF9kI8vO1+kT3NTc5F1lPQa08hBfU1jugBpK8MdMOcJoGr3G0wVFNcCUmagU
	jRCVs3QJJNcZ4+hxA8BKHtbE1pZ9Af2658X2u
X-Gm-Gg: ASbGncvW2plNzddK+t/I3giHDwtD/E4R80SMpN+DPGEFdDhLQBhSudPc3gBPJh/zsiA
	7f+S0/0JeGU3bd2WPm34/xcZ+VaAVeAPgB6XPRyH5Oe2uJj2hjoX/4ASk98Ad0jx8OGs6A3BKie
	wP8zkrnQXq4Qnjne7HJO5Kh2M=
X-Google-Smtp-Source: AGHT+IFmyRrY9b5XrzQ6iow4zsbUyYUHGybURNKUpSZXCrzuiJUT9EOG0sFZeJBexlw4mSW12aq4Fv6vjlduxCNdFSo=
X-Received: by 2002:a05:622a:14c9:b0:476:f4e9:314e with SMTP id
 d75a77b69052e-479600a2bd2mr151821cf.25.1744146501531; Tue, 08 Apr 2025
 14:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408164000.3215690-1-fvdl@google.com> <20250408140357.9a708f7547e48d2da1d2fc34@linux-foundation.org>
In-Reply-To: <20250408140357.9a708f7547e48d2da1d2fc34@linux-foundation.org>
From: Frank van der Linden <fvdl@google.com>
Date: Tue, 8 Apr 2025 14:08:10 -0700
X-Gm-Features: ATxdqUFwjyzXo9A2CI9xTBTKMZAAWfOz1vt__1iANqLvh9kPsm1l87QYthjNUPk
Message-ID: <CAPTztWYY6wGBARyTEt2yXCxstyTUXqcGfyUt4ryBue8gGKXrgw@mail.gmail.com>
Subject: Re: [PATCH v2] mm/cma: report base address of single range correctly
To: Andrew Morton <akpm@linux-foundation.org>
Cc: muchun.song@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 2:03=E2=80=AFPM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Tue,  8 Apr 2025 16:40:00 +0000 Frank van der Linden <fvdl@google.com>=
 wrote:
>
> > The cma_declare_contiguous_nid code was refactored by
> > commit c009da4258f9 ("mm, cma: support multiple contiguous
> > ranges, if requested"), so that it could use an internal
> > function to attempt a single range area first, and then
> > try a multi-range one.
> >
> > However, that meant that the actual base address used for
> > the !fixed case (base =3D=3D 0) wasn't available one level up
> > to be printed in the informational message, and it would
> > always end up printing a base address of 0 in the boot
> > message.
> >
> > Make the internal function take a phys_addr_t pointer to
> > the base address, so that the value is available to the
> > caller.
>
> Changes from v1 are:
>
> --- a/mm/cma.c~mm-cma-report-base-address-of-single-range-correctly-v2
> +++ a/mm/cma.c
> @@ -722,14 +722,15 @@ static int __init __cma_declare_contiguo
>         }
>
>         ret =3D cma_init_reserved_mem(base, size, order_per_bit, name, re=
s_cma);
> -       if (ret)
> +       if (ret) {
>                 memblock_phys_free(base, size);
> -       else {
> -               (*res_cma)->nid =3D nid;
> -               *basep =3D base;
> +               return ret;
>         }
>
> -       return ret;
> +       (*res_cma)->nid =3D nid;
> +       *basep =3D base;
> +
> +       return 0;
>  }
>
>  static void cma_debug_show_areas(struct cma *cma)
> _
>
> Which appears to be just a little cleanup?

Correct, it just fixes a style nit that Geert pointed out.

- Frank
