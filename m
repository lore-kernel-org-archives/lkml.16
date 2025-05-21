Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161261E51E0
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843389; cv=none; b=bk9XfDMI6CDE1bOK3fV0GjJ8og2CK4a/6w5VxJotuCQBbxbZwHrApG/5I+MicxhVqUFWw1WYCdmA/5C1BPfPqo9Fy7oX2U/Kj3VwN1U3Jg+deHFOfeeZHn3Wfls9+W81Sy7QEaLS8685kUnISvzUmTeycQFZ7I3WE/afQZE1jVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843389; c=relaxed/simple;
	bh=Pz0A25gFXiiCnMqeLC0p5Rp5lvtM/J3LFMSpqFnzyms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aeFW4osemVWMBCZjR+bkwhwd7JrwQf4DGnIP3wVSZPOA6e9kpdC29E+B22zQ1yFH4uSgJmcJvWcxtCGQ7EaEyZeB9MNG+hS2Y+H9hDIETXJwL4YI2zBDhHFw/k7x4C+PG/8EehfmOgWlR4t8ZxCLTbvWxgWrnXOadyelSnvnN8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vQccBGwV; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vQccBGwV"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo1775481cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747843387; x=1748448187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vap2Fmp/jup7NN2/6dTRhAYx6PUX7E7GIsmSa7sRMi8=;
        b=vQccBGwV204AxLbW7Vze970ODl+OWdagAIue74swtiJqXiBy67O6w1jtvg9a0o57Ag
         7IEip0Odua+OZmguK0ccjjbcd8KQlmyEIs78MksVZ72c5DyVo5wDVbz/vj8owYhdBzW9
         6jUF6oVgRi31W5169nwOEkgMyJgkj7ZMA+ukT73SEjdCfXMW7Z8oyadhUGHElgn0/3Tn
         1mu1+C6Gpp1esAuIR+YoxNYQmoBg+TYnDfvcMFZJVpMlLE/CZQJwqaB4hVbUy1LDjMFc
         OYzT7evmbik6jTPD+jGCkJQ2kTZMxI0zabLVTW1Sbigvxfvdb4EfmYiTI+9BK11NX6vE
         3peA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747843387; x=1748448187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vap2Fmp/jup7NN2/6dTRhAYx6PUX7E7GIsmSa7sRMi8=;
        b=Bzi87FAkG6Inwo3FmW2Kz5G1ZrapniFQrGjcZvMZ7Ifv1WKZZNV+95MYKwwDj8pT6a
         xFkssKvQXgb+n15TyPRHodqLOi2iPege+eKEupujrnn/1gP+Z6fqmxwndOKrORePhE5d
         54CXv7YIyeD6PPBc/YBx9HA/nkNUWYxtFzLS6lmP9jnyg5ym+7H4MwrZ4+D8+qgajQsW
         pZpxoM4v9zizGR0pBP7PdNAtnhKUMs9AoQLB7VWHhdxmWeRYf/lykVZbh6aSw5MXVVXw
         w/HWnTMklamhcPsc+m6fHtFhmepeCnyHt4vzklfT//F/hSkyVkEpC3+IqsRt4IpwrB3O
         o71A==
X-Forwarded-Encrypted: i=1; AJvYcCWX3cmr4rSEeP5wO8fOu705+CkecYp3N2edGOkh0jCcaLZ2OluPX1pJHxFJFXxlEYcVwe+OV5PQ/tDzUdA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrT4H4bfJ1oYZSEkJBN7qgP5Vc2VisD6HyH3wssCvsWbNvY6y/
	JGXWkZU1cZM9OQQsLxSJzNz3OWCH3fPxdoJL+KxtfvHayPrlGV4oxqEhuQqLK5YwW0KmHTj4XrS
	k4P3MLyAsaenzdU2S7ZiHlUHnQ89eOcpdiezu99rt
X-Gm-Gg: ASbGncvbhe20oqQAExqpq6AL0Qlw5zkPSg5LaubSYNow5YTSp5qfPwD77oBSUTuLc2r
	kD1JxCe+y0V7mfR5+GQHO9zrArgVxvY34X9iRAKx1xKlaXEy7FS9HDMtoTZK+I5plJahLzHJdRz
	+vtOIynwyYM4oJCL9eTpBqaX0dfVKoRRMz/55/S1Z5NRW9//XtroJ37TkVLLQ6GuQ2adh8E1QEf
	vfuXzSHZW8Z
X-Google-Smtp-Source: AGHT+IFC8a5TXdX0qE1svILjR510sIlYvhF6hDRbDWibNGaSaoJrbmftu3GRHLkFT+HvyYn1OHcdW3MbY8Nto1AcWok=
X-Received: by 2002:a05:622a:28c:b0:47e:b278:2e07 with SMTP id
 d75a77b69052e-49595c5da5bmr15670171cf.20.1747843386476; Wed, 21 May 2025
 09:03:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521142521.3033264-1-usamaarif642@gmail.com>
In-Reply-To: <20250521142521.3033264-1-usamaarif642@gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 21 May 2025 09:02:54 -0700
X-Gm-Features: AX0GCFvCyckIBVk8R4I8PhbM_DdMu4qHvhXwrSomWLj3BYkkVkexsCZcenpHFPg
Message-ID: <CAJuCfpGtb9j1y93bksErU4NfjPX6tGrP6qvMrazx3+M7dJWtxQ@mail.gmail.com>
Subject: Re: [PATCH] mm: slub: do not warn when allocating slab obj extensions fails
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, hannes@cmpxchg.org, shakeel.butt@linux.dev, 
	vlad.wing@gmail.com, linux-mm@kvack.org, kent.overstreet@linux.dev, 
	cl@gentwo.org, rientjes@google.com, vbabka@suse.cz, roman.gushchin@linux.dev, 
	harry.yoo@oracle.com, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 7:25=E2=80=AFAM Usama Arif <usamaarif642@gmail.com>=
 wrote:
>
> In memory bound systems, a large number of warnings for failing this
> allocation repeatedly may mask any real issues in the system
> during memory pressure being reported in dmesg. Failing this
> allocation is not indicative of a bug, so remove the warning.
>
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> Reported-by: Vlad Poenaru <vlad.wing@gmail.com>
> Closes: https://lore.kernel.org/all/17fab2d6-5a74-4573-bcc3-b75951508f0a@=
gmail.com/
> ---
> v1 -> v2:
> - remove the warning completely. We will have a way in the
>   future to indicate that the mem alloc profile is inaccurate.
> ---
>  mm/slub.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/mm/slub.c b/mm/slub.c
> index dc9e729e1d26..06ab9a558b73 100644
> --- a/mm/slub.c
> +++ b/mm/slub.c
> @@ -2102,9 +2102,7 @@ prepare_slab_obj_exts_hook(struct kmem_cache *s, gf=
p_t flags, void *p)
>
>         slab =3D virt_to_slab(p);
>         if (!slab_obj_exts(slab) &&
> -           WARN(alloc_slab_obj_exts(slab, s, flags, false),
> -                "%s, %s: Failed to create slab extension vector!\n",
> -                __func__, s->name))
> +           alloc_slab_obj_exts(slab, s, flags, false))

I thought we agreed to having pr_warn_once() here. Did I miss something?

>                 return NULL;
>
>         return slab_obj_exts(slab) + obj_to_index(s, slab, p);
> --
> 2.47.1
>
