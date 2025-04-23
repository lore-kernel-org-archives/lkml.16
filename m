Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3902927FD60
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 15:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745422906; cv=none; b=EaQvy9XFVy71ORoqN+QvBv2nXb72NTZe8ftp8w9x9GP4AkoxvMnVl8f932fzkpM3Lziv1zhILsSPOh9IEwDQ57UYFRhLdLWNjXuByEQO/Fwuqch3SvKvLCHtPD5gFBNbEWvnLrO3FoVZdCxg2a4mnAGZdR9m2OV6SwqwBJ6g3+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745422906; c=relaxed/simple;
	bh=tRB/9U1tz6B7vNhElrvexJPFByCaa9dubFPADr5B5YE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BNxnB2fkUPWG7qJmX0OrDMBhnSu6BALVr0Psona2eJ5mSzDhxgJK+H8PDaRqrnVrysf3VuorXf4M/czRpG4XOzHT2wNhJNQddIJXaB+4RgaodSoiQmkwP1gz8Hj1u0qsuAtHsYV7smNCCWTDtPs1SWC2Fp1IHT++SUUu6cAaPcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P8vR4Fwv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P8vR4Fwv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2bdea5a38so3826766b.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 08:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745422902; x=1746027702; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FY5iFmMpDxty68PdcolHspUbhFrNF3/l2f5Aqnh/ngs=;
        b=P8vR4FwvWwhGr078ZhI1XhmUkH1hQRMdJD7AwHn+LnwZHtmSl6xIzvzDfd0mgrKDD4
         WkpSEkA2ctjnscjt/19QA85fGJELW1d5lc1ttRxfLI5Vx/pU/5qpZMIP5cjQrwOOwmUi
         VFG0BqQIR7ojOTqEpp0HsRCBns7kLmKjpcS1rjyI+gCQcKZyZ+zicmW7jdBnGjQxQRvw
         IMJAciDWiDapb9bUmP1DXUxRHZCQ18T158DNIrR5QjCimOeK/+ztVKVu328Xxmzm/cXu
         5uGGZfDmYgUTV522XGGnIFDB+82PIJRAFDvwMYK7UvBbuIKYIwhTvrmmBLR/doPZMMTN
         Id+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745422902; x=1746027702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FY5iFmMpDxty68PdcolHspUbhFrNF3/l2f5Aqnh/ngs=;
        b=KT1baHBVbQzqslJLRmoM1DZRq7fzGOJUxVnHeWHKhAqdVovq9G2GdjUwhY8lo++qPF
         oK8hDnv3y4dPMzqHb++OGJmpZjqgtYhKP+eFfuFWzL4AmFPbsw9DCnyTWtNb8MsH6fP2
         jaFkoESAvgXAkU+LNgwiF5VWfbd2pjw1lH9updW3QGc5ckN/Pxtj4DE18XoFsrecCgMx
         RyPdO9oxs0zIOlOU3tY8K4TA9XqJsyfanNvWOXWGtrEEWy6AcScq3sKq4U9mch6gDe9w
         vC/aGsG2yu47Fb9PhiuU98Q7a5ehCYKnIpgXMYtKDK6v6RvTYD3ARRu3G7pH4DBygP/N
         rspQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH7+v5vVroxa8Ut2Iman8FcCIcKdZ9Sub2H04RLs+AsAitSoXAgi+X4Tl9B07CpSSFF/RtMb6aWSpTKMs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGhxapnizGxA+9JQ1duuBhl3obIqGJE1Nn/mg+tmSqJxz7Uv4m
	Hd+vjLbKZ7zsm7aoTsr6IO3l+hyDjzLcqH++ecHDIrC9FcYNvCa1ukWgc0Yv88wuoqHmHueKVn0
	AXAspB1IQ02QlcKBZoJMuTeJf2iM=
X-Gm-Gg: ASbGnctxr39DAaHVc54ncM1VTSYCG87cux4hdu/MwIrN73lvvLmc/VhiXJzDTRkuBbD
	afBYwoFtDTAm3pEiW11FOPs63xEUYvvgdasfo+H4dOQ5U04YDP/LBcfHamx1O6zwEY4zgu2eDbE
	gt4vgkh7b3OoebHI2ZA66ce9LR9PKk/s5ixN/YTA==
X-Google-Smtp-Source: AGHT+IHR/oeBWJlb4wmu01u8pToo9FDg1AmiwDv2N4Y6sp66tX6UMuweAynTZ6K7KqT8Wby0PxAsbuBil7NRcm/Qo2U=
X-Received: by 2002:a17:906:d0c3:b0:ac7:b366:c331 with SMTP id
 a640c23a62f3a-acb74dde4d0mr1497093066b.53.1745422902230; Wed, 23 Apr 2025
 08:41:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wgjZ4fzDKogXwhPXVMA7OmZf9k0o1oB2FJmv-C1e=typA@mail.gmail.com>
 <CAPM=9tzj_OBFJNsN9j7nMs4OR3=V9yrPmaH7VvN-KNYUYhf-vQ@mail.gmail.com>
 <CAADnVQ+KnfDLd-=Mg1BDJxCf80K_=RN0dJy_yp681gf1dQMhtg@mail.gmail.com>
 <mhewqdlvb5ahqordw2nuebq7yvsxo7xvdas4vl6gehmbmypcil@v3fn7nzllglj>
 <896a67ec-9f48-4137-9d34-4bb16861e284@phoronix.com> <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
In-Reply-To: <27d55aab-c2d8-4edf-bab5-91a04b8383c5@suse.cz>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 23 Apr 2025 08:41:30 -0700
X-Gm-Features: ATxdqUFIcenwHiM9UYGGSiwEU3iDIWncv0ysFnfihZeRvDquBA-XPgCy2Q4YDc4
Message-ID: <CAADnVQ+iFBxauKq99=-Xk+BdG+Lv=Xgvwi1dC4fpG0utmXJiiA@mail.gmail.com>
Subject: Re: Linux 6.15-rc3
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Michael Larabel <Michael@phoronix.com>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Dave Airlie <airlied@gmail.com>, Sebastian Sewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Alexei Starovoitov <ast@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 23, 2025 at 1:42=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
>
> ----8<----
> From: Vlastimil Babka <vbabka@suse.cz>
> Date: Wed, 23 Apr 2025 10:21:29 +0200
> Subject: [PATCH] locking/local_lock: fix _Generic() matching of
>  local_trylock_t
>
> Michael Larabel reported [1] a nginx performance regression in v6.15-rc3 =
and
> bisected it to commit 51339d99c013 ("locking/local_lock, mm: replace
> localtry_ helpers with local_trylock_t type")
>
> The problem is the _Generic() usage with a default association that
> masks the fact that "local_trylock_t *" association is not being
> selected as expected. Replacing the default with the only other expected
> type "local_lock_t *" reveals the underlying problem:
>
> ./include/linux/local_lock_internal.h:174:26: error: =E2=80=98_Generic=E2=
=80=99 selector of
> type =E2=80=98__seg_gs local_lock_t *=E2=80=99 is not compatible with any=
 association
>
> The local_locki's are part of __percpu structures and thus the __percpu
> attribute is needed to associate the type properly. Add the attribute
> and keep the default replaced to turn any further mismatches into
> compile errors.
>
> The failure to recognize local_try_lock_t in __local_lock_release()
> means that a local_trylock[_irqsave]() operation will set tl->acquired
> to 1 (there's no _Generic() part in the trylock code), but then
> local_unlock[_irqrestore]() will not set tl->acquired back to 0, so
> further trylock operations will always fail on the same cpu+lock, while
> non-trylock operations continue to work - a lockdep_assert() is also
> not being executed in the _Generic() part of local_lock() code.
>
> This means consume_stock() and refill_stock() operations will fail
> deterministically, resulting in taking the slow paths and worse
> performance.
>
> Fixes: 51339d99c013 ("locking/local_lock, mm: replace localtry_ helpers w=
ith local_trylock_t type")
> Reported-by: Michael Larabel <Michael@phoronix.com>
> Closes: https://www.phoronix.com/review/linux-615-nginx-regression/2 [1]
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>

Acked-by: Alexei Starovoitov <ast@kernel.org>

Another lesson learned. I stayed on gcc-13 for too long :(

Linus,

maybe take the fix directly, since perf regression is severe
for network heavy workloads.

I can confirm netperf -t TCP_STREAM 3x regression and "perf report" shows:

12.90%  netperf          [kernel.kallsyms]           [k] page_counter_uncha=
rge
        |
        ---page_counter_uncharge
           |
           |--11.68%--try_charge_memcg
           |          |
           |           --11.68%--mem_cgroup_charge_skmem
           |                     |
           |                      --11.50%--__sk_mem_raise_allocated
           |                                __sk_mem_schedule
           |                                |
           |                                |--9.42%--tcp_wmem_schedule
           |                                |          tcp_sendmsg_locked
           |                                |          tcp_sendmsg


With the fix memcg accounting takes < 1 %.
