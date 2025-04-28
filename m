Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA84A35
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838247; cv=none; b=qA9O1UQwZs1MipgbOG7KP5w342ebKQGSWgV/EKIfDK6dqDTbfNT9BduotvG3X+8kGa+zvtYfTTw6Vzbkd7JPNoKGFnYXk4/dp+/+2hHV7+9TKV6uJuw8/9f4vrLWq5LFll3ziEJhBuIEExP0OAQTV8uQfYdH/GGNsPKhkx5l7m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838247; c=relaxed/simple;
	bh=vfkUd/SFbaIO9obNF0WSUKWflUhd3lnWCNlDvlhf+iY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kdNsvr8kj8J75IBcbMEZTNvQpoxA9rZS/AuVIjWSmwLMzxkChmrtgCcg5JLUauchBLG2dv6+tBllgRAkUFfCriYUG8gPbfnI5NNEsmK8uI7mv4V4w7gBWReO7/mNt7XHUsCZbaE+CJt82GXlcdcIXUr/hAZhDYl0CC7aht8h63s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K2DFEW1Y; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K2DFEW1Y"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-51eb1823a8eso2523019e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745838245; x=1746443045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jzsmmdaVE9MxTO85VEncgGmIGV5NMaxeyQJLE/9E4I=;
        b=K2DFEW1Y6ay2h54fVhmY2j3JDwb2zN7p8mOK24xZ/vyyoDJEz+H6a5/7SpLMbibeht
         JItO3yqxoBMnOxm9l7JjJ9p8pz6i6hAoGj+1d9jXRJTWQUWh27vDORGUJJ4YcIdLX+4V
         DXk5bd8jfubBD6ziGz3mEet1cWUdt4xGqXm2I35g8SAVKrYXySwneMSFta5E/Qy/LI+M
         SWlT74QqM5aD6KdOJvsOdSTkvszj5uZlG0WxzY0QsMoVH530FhrepwDM6sTp8RPDvsaa
         sG2HrFsIXPsA7dH1NKBK4edGopjcvqJCffA1aFvh0e3RhlCmomA/BMYiO2h+lf34ozNQ
         mMgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745838245; x=1746443045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/jzsmmdaVE9MxTO85VEncgGmIGV5NMaxeyQJLE/9E4I=;
        b=DtO8Qj4Gl6eefWoPAG5HpzdlsJQFF4UEDaaWXor/lfXkJ57KRzD9YCY7c0o8kd1dCt
         NCD17qIPcZ7OgsSv5ZgOWjy665QQV/Te6N3BVs+7cyJBWtp4IXfubx0kZWw0NpEyqwbr
         Dfz9qg8ghswK9a2k3as0qc7PlfgSGe82dO/gWV+A1uVZMwUAoOMHG3b5+DtCqC4M/uaS
         HBgxtH/VOK+Cu9wITjFFk2ZYvrhW64eYUIlWvyjvh9WlvZk/PxHtNfB6R7TUxQ1jfDpu
         9wkWRXtKfj5F06NjVXVELCI4irTm6EHmZ3+uFBo6LW55z5rQ0iIxACv3QvOttn1IQWsN
         /Ncg==
X-Forwarded-Encrypted: i=1; AJvYcCUOL9AR8qUcxFePHQIoDAeKw9txvtUvWaPF/pjEzLCUfeXPckivW4UYfRGr1NlSLLYMeiGCvBJeM8Ikuqg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGHiHdU82XONaOxH+JAz5M/pn9oAw9s7vpfqBHI75JUtDd+plx
	tvg2xSsH11xtBYY4lzPRSR5rq+/CFH+rZpBH6td3rVxHdPjpBtZMa8fSb5l65hALC5FsCRWRqew
	G3QLBtyqwlwxoe9l+OrTJW2PNiaE=
X-Gm-Gg: ASbGncuGjRsUGhLYqFzCiPu8cuNk90qu8OYU7eGaOE4cwuO93RhqEKRI3lAAsuXspUH
	uB3qzrZ5Rj5cndhpN+N0S6E/tky3KzCdTRsrDhCo2y2AFV6f5W8at8wHCFM7zEKS1liQZ+8X5Ur
	V3dt74hvOFqQNDp1OG3QEc9g==
X-Google-Smtp-Source: AGHT+IHAAoKo+q6HZD4qnQUEa6i8fn7i3Dc2A5wQDB3rGK8Ujz59aSOTyKpTS9zDrh3q6V+gNad2t7dBWJAaguF650k=
X-Received: by 2002:a05:6122:1e08:b0:520:5f0a:b5a5 with SMTP id
 71dfb90a1353d-52a970e83d9mr4979077e0c.6.1745838245079; Mon, 28 Apr 2025
 04:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
 <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com> <d8228c02-b5c0-47cd-927f-9054d412c7ea@redhat.com>
In-Reply-To: <d8228c02-b5c0-47cd-927f-9054d412c7ea@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Mon, 28 Apr 2025 23:03:54 +1200
X-Gm-Features: ATxdqUEmCpFKQV6pqzYZMin_F-pdxUpHWxmjdqIb2dWZCGrfNGn1p1JrYqVtmMU
Message-ID: <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
Subject: Re: [PATCH] mm: remove useless code
To: David Hildenbrand <david@redhat.com>
Cc: Feng Lee <379943137@qq.com>, akpm@linux-foundation.org, ryan.roberts@arm.com, 
	libang.li@antgroup.com, peterx@redhat.com, maobibo@loongson.cn, 
	lance.yang@linux.dev, anshuman.khandual@arm.com, trivial@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 7:17=E2=80=AFPM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 27.04.25 10:22, Barry Song wrote:
> > On Sun, Apr 27, 2025 at 2:16=E2=80=AFPM Feng Lee <379943137@qq.com> wro=
te:
> >>
> >> Remove unused conditional macros.
> >>
> >> Signed-off-by: Feng Lee <379943137@qq.com>
> >> ---
> >>   include/linux/pgtable.h | 2 --
> >>   1 file changed, 2 deletions(-)
> >>
> >> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >> index b50447ef1c92..47c5a54b7551 100644
> >> --- a/include/linux/pgtable.h
> >> +++ b/include/linux/pgtable.h
> >> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry_t=
 entry, struct folio *folio)
> >>   }
> >>   #endif
> >>
> >> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
> >>   #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
> >> -#endif
> >
> > Do you know who else had pgd_offset_gate() before except ia64?
> >
> > /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
> >     resides in the kernel-mapped segment, hence we use pgd_offset_k()
> >     here.  */
> > #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
> >
> > btw, do we still
> > need pgd_offset_gate() given that nobody needs it now?
> >
> >     1   1168  include/linux/pgtable.h <<GLOBAL>>
> >               #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
> >
> >     2   1112  mm/gup.c <<get_gate_page>>
> >               pgd =3D pgd_offset_gate(mm, address);
> >
>
> Right, we should just remove pgd_offset_gate() completely in this patch
> and simply make the single caller use pgd_offset().

Yes, exactly. The original patch doesn=E2=80=99t seem to be appropriate.

>
> I think we can even do:
>
> diff --git a/mm/gup.c b/mm/gup.c
> index 84461d384ae2b..05dd87ccce155 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm,
> unsigned long address,
>          /* user gate pages are read-only */
>          if (gup_flags & FOLL_WRITE)
>                  return -EFAULT;
> -       if (address > TASK_SIZE)
> -               pgd =3D pgd_offset_k(address);
> -       else
> -               pgd =3D pgd_offset_gate(mm, address);
> +       pgd =3D pgd_offset(address);
>          if (pgd_none(*pgd))
>                  return -EFAULT;
>          p4d =3D p4d_offset(pgd, address);
>
> Unless I am missing something important :)

Technically, it appears to be correct. However, it seems that
pgd_offset_k is primarily used to improve readability by
distinguishing between kernel space and user space?

>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
