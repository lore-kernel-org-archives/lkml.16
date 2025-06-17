Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA47F9C0
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750127080; cv=none; b=ulRk+9sy8GHj8dJX/kgFbdK6PWT4N/Yem50aln08XEvIbR1dq3TWQEWr/kRTuYJkV9ovJhjCifjDbB+v4sW/ngjX6lxNvNPL6P6AYErUZ36NDq6qnEYloUnKbhvdgviLetT4M9gZH+cVYvqUwzfCwmU2hxZv0iUEYjT+HtNYivU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750127080; c=relaxed/simple;
	bh=ORtoJMRuO9d8FhNzxd1oc9GUL1sP4jFktHkJDKU8A3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DeL4IH0BFq/O6lEgNGhnTa3w8NvI/DMZxw9HXex0h/fpy/NvrLcTyAzj5PefJIVub9wqMX7d8L4H8Fbqonbt8eHQYwPEZrkfgU3yuMo/yzXdwl1jompND1O3mcc7oYEIB8fPzlyvFhKis51yx7C44NNBiHKtaqHei8jM4WMSEVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EoNr+nuH; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EoNr+nuH"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7fadc35b5so744029137.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 19:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750127078; x=1750731878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+llR/BNeUIRrMxKZBOnCg+cMH1nIiPL149ZGVZhcg8g=;
        b=EoNr+nuHpb0jUppneRAw5eJmYAlp6Lq3gb/tu3k23rJxpr7hyfTOmGWreE5kBScb9I
         JcxP3SCAwn7Sc+thBqbS6lyB4yv/XrGpNYzqUG4FF4WoeDfSXtSyFCfo4xlokF3EjaPE
         /MeKaHK/UDArgGhjkTH7FnhBPnEYEA2s5iQV+HfD1qk01P3l1JniDYw5BMK006vv3y2A
         glia7/Q9Ppjdy7hPdbNymPmam4oUu/ICOuFygwtIpbv8YoR4koTr79J2aRSUoy8zntYS
         gPh0SK4Nd+GvXZ+6k7Vfv4LiIb7U6fACQscGPkBfDxFNzqpKW11tGU9F6/uLuPG8J/N1
         +5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750127078; x=1750731878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+llR/BNeUIRrMxKZBOnCg+cMH1nIiPL149ZGVZhcg8g=;
        b=T1HlodM/17xReAn0qvGGN+4ANbZqtCUgH3DMk6nflj3L2GPUqKP3cfZiA7t0vIjbrD
         5Uc4iWkeCgBgJ5x7dQJASM0DT4txSf8vDdMmcYfUim2GrFTAVkWAAOd/OcYVBYMLMMLs
         U+0d1zSyeJrxzPNSf5JB4ui9TFabBkLkUqSAWPM2k0YauoeRjbmZNVEGm/CScB5WVIIz
         zfRxOMxzT9LZGHRowXA5mxYGwhxDrUNPu9N+PwOKkZbGK9d/uUeafiAJgAdDP/D3Qi99
         Z3583telpgSL8ieg8UurC9/WOW3gANVzfaZfaIXGWf9a4aVfPGX+e0CJCf/KefRN5BaB
         vwcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdzr02dCa23NCnYzgZwoENS4GfXtJikdv9eQHgmM72CHTWTPCz+WtAU5ohKNM7j8EoCYcUsZYXzMOrbA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqRODIgYVK0m6SNWlAnR5Z+61WIIjiZy7HTFvZz4TNVVcwK5Ir
	Ikd7DmA7gwkXQKiN+6huBvX5HBvQb2b81ge9zxWw4G2zhVbaiAnW7KtKHI8WT8WmBLHJj2DURhm
	m0U43IGuvAl00az+XWHQSWsULgbFkzvI=
X-Gm-Gg: ASbGncs6mH7nXIj2D79YrbGYUSNaTmieCeeI0hwEwjPr7huwiVO3yHyr4sBtmmJfjz2
	jQ1HxjW2v3mZSjFL7tGorajAaAh9aJ17oHyGTKW/eD94f/GHKYGYLtwb2I/9CcAgEjDI5NvXVIc
	dN04z2s/5EsbQ8/bPN1BxlX7rm2aV7UlrQNaRJVfAgvFA=
X-Google-Smtp-Source: AGHT+IE2VeznKeUrIu2MJN9HXLxRlTuuDWOcp0+vOijEMkVUfR6r5zGEunSgQftsDFRXYDkmxG9TKuqWxzTqERNtcKw=
X-Received: by 2002:a05:6102:5092:b0:4cb:5d6c:9946 with SMTP id
 ada2fe7eead31-4e7f638b30amr7401833137.10.1750127077791; Mon, 16 Jun 2025
 19:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617020544.57305-1-lance.yang@linux.dev>
In-Reply-To: <20250617020544.57305-1-lance.yang@linux.dev>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 17 Jun 2025 14:24:26 +1200
X-Gm-Features: AX0GCFvJjZPoKykRyQX5q5xkTcKG4T0FMe-9XbIqCKfJjs45uTXohqzDxqgwEqY
Message-ID: <CAGsJ_4ySwMuKGYxywY+RH_FkNvjsThhvFQr+d1++KykOqjxarg@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm/madvise: initialize prev pointer in madvise_walk_vmas
To: Lance Yang <ioworker0@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, Liam.Howlett@oracle.com, 
	vbabka@suse.cz, jannh@google.com, lorenzo.stoakes@oracle.com, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Lance Yang <lance.yang@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 17, 2025 at 2:05=E2=80=AFPM Lance Yang <ioworker0@gmail.com> wr=
ote:
>
> From: Lance Yang <lance.yang@linux.dev>
>
> The prev pointer was uninitialized, which could lead to undefined behavio=
r
> where its address is taken and passed to the visit() callback without bei=
ng
> assigned a value.
>
> Initializing it to NULL makes the code safer and prevents potential bugs
> if a future callback function attempts to read from it.

Is there any read-before-write case here? I haven't found one.

It also looks like we're assuming that *prev =3D=3D NULL implies
a specific condition:

*prev =3D NULL;   /* tell sys_madvise we drop mmap_lock */

*prev =3D NULL; /* mmap_lock has been dropped, prev is stale */

>
> Signed-off-by: Lance Yang <lance.yang@linux.dev>
> ---
>  mm/madvise.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 267d8e4adf31..c87325000303 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -1536,10 +1536,10 @@ int madvise_walk_vmas(struct mm_struct *mm, unsig=
ned long start,
>                                    struct vm_area_struct **prev, unsigned=
 long start,
>                                    unsigned long end, void *arg))
>  {
> +       struct vm_area_struct *prev =3D NULL;
>         struct vm_area_struct *vma;
> -       struct vm_area_struct *prev;
> -       unsigned long tmp;
>         int unmapped_error =3D 0;
> +       unsigned long tmp;
>         int error;
>
>         /*
> --
> 2.49.0
>

Thanks
Barry
