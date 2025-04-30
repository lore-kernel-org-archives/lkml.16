Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19336225A29
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 23:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746055421; cv=none; b=uAhspbXE/3+YlNbw2RqHQ9QaXXX/AmehDoEwuFJWFmPc2OpcTiENmefXMZsqKPTGb+yAaDa2iY+xIGDh7Yp9G41Tl5C2/H5TCQ9+g1vJ/OhhcCVeLIkS5zh7tBTYwrpbkw1BCISb2qH99wzKrK0y+R0gPMiXVi/w3gdQFv8i5JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746055421; c=relaxed/simple;
	bh=fW8tqN4Jv0Q+XFS4iJls5dMAoxcext+fi+pfBSiD7ng=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmuH03Oy94w9yvgHay/rD1sHi53tfk6yfEE7YfK3l+cLO9ZHJbwoQN4M7SilHL+azXaIOpUZFhj0oSHiLlwB2N3MYndB8jsbTgYlzM62aV/bo3layzpdjmqnG38sdi0UTHeb/ZteZ4xgtZdtV0DCuhQobT8ADUv+lBwg0l7mRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDra5OEZ; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDra5OEZ"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4c4e1f16833so125352137.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746055419; x=1746660219; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0OmrzXzEkAyXUbOIVvM9SLB44UQDkpWd3Om5I77M2ZA=;
        b=QDra5OEZANZQLM1N6V+KWocSyeLX3R32WUe4Nwx4cA6Y+Iara1b3ufEdpuQUUbCqXs
         H16hOUjQwSlQUaVI/MLxwIW4vRoKU44W3wc5nKW4Y5BVMgxH7EHaSB4YsRnPfT3RtLed
         nZesqDiaZiQ81PhS2pZLgxsD5TATXjR9q8ahFdRtQ0SP7O4tyq6HS9gbIJhlzsUMtBRu
         rw5mev+UQMH8prPUXGz9l/nkuVy7lHnkdac0MNFtEmLV3Om9ARVqESZLA30/k7WAWyiU
         2rtz7WKsXM5fovIgdHGEAKRX4SPbxw68fCfTcxS61s9gCj85XDpLeQWCnJqRBsS6Frdr
         MQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746055419; x=1746660219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0OmrzXzEkAyXUbOIVvM9SLB44UQDkpWd3Om5I77M2ZA=;
        b=WsLXQB2yCt9TWeiDj2NTtIqzlcYvSMuypNcVX4uf3Tc0Dv0a/5wOyuy2IVDAhnY/31
         KqKfmCD2G8LYGBJRcsNhRVh8D4kLOg8Zhr/qCTAxsN1O2GtI6Q5+bIZiYIg4BXiHVMs6
         wAjJt8Hv/IQojcYMTTnwn0qAsgQtP68GTtWvndCsjD3ztkSiPssNtJ/QnRXN6on/lRwA
         s98IX639URsI2DMfAuTGAlTut/9Eilf2ta0lAop+l+w6sYtq7W569OfrVHTww+iho5vL
         H64Rdbitxn/TR/uOpUPWx2XoA68NYKWxDJaFbAGvQm8YgsBHWcXAf2ygfRShWbgeG2Bz
         A7zg==
X-Forwarded-Encrypted: i=1; AJvYcCXg4bMohK3r9rYPGfoy/0mfB4/ufXGVA32wN/TBwN+ExjqZitARpHgtUtwU3Mpxn3wVcu9St4+q0nwQmws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEv5bruwxx32VK9jcNMmjFxblB9c03K9baOteYvlmoTvuRWEKB
	WnO4xSVtkYm+qEVNAh8OdnwbAaH1of4ycavsF7zIZCD2vzbMKVFPzjHCEbEnTn9jIZERDGeZD6D
	ruQqvKl3g5NnZCrXimH4HidjXw2M=
X-Gm-Gg: ASbGncuUT3c/zMFWy42JtZlmLvHV/R79V4KM9/juh1ysWInNacPsrDpujp0T/Tdz/W1
	evpRd4Hx5fNL1L9q2QAc5aZYMugM6UKrM/39wLI6xy/toFb0mC43eSuRPuChpDLnKRvGuxE5rD+
	eBS8ZCE1GeghFIE4n3X1JT0Q==
X-Google-Smtp-Source: AGHT+IE7JauPCct1OezqTmytM8EWwdhVjXt1NEP5XW3RIBdyV1yN9KvK9Pz0JOeeAaZyy8Px65LDJR71czPsZaXoglk=
X-Received: by 2002:a05:6102:5124:b0:4c5:5aba:94bb with SMTP id
 ada2fe7eead31-4dae8f23dd0mr233021137.3.1746055418782; Wed, 30 Apr 2025
 16:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <tencent_C263C0783702591C464F887E3D3C496E6B08@qq.com>
 <CAGsJ_4wWK6B8GSc=cxPGnPU0Jt_o0YB55yk4+VNOm_hY_iditA@mail.gmail.com>
 <d8228c02-b5c0-47cd-927f-9054d412c7ea@redhat.com> <CAGsJ_4zn158TQV7Nc+vK-kmu6S4kOiFSZyUO7aK9dhwhrEq2cw@mail.gmail.com>
 <f34bf704-6eb1-4591-ad0e-93641a2f1ad4@redhat.com>
In-Reply-To: <f34bf704-6eb1-4591-ad0e-93641a2f1ad4@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Thu, 1 May 2025 11:23:27 +1200
X-Gm-Features: ATxdqUFcmXOHxnyLrPU_ykfxI146Uen-N5xkEBAR_CmnpLVzybV8jY0hpCY5RT4
Message-ID: <CAGsJ_4y5QB7UTD3Mvwqib-c6DYkKCP_9V1s9eVoXLZGx+A5ObA@mail.gmail.com>
Subject: Re: [PATCH] mm: remove useless code
To: David Hildenbrand <david@redhat.com>
Cc: Feng Lee <379943137@qq.com>, akpm@linux-foundation.org, ryan.roberts@arm.com, 
	libang.li@antgroup.com, peterx@redhat.com, maobibo@loongson.cn, 
	lance.yang@linux.dev, anshuman.khandual@arm.com, trivial@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 1:59=E2=80=AFAM David Hildenbrand <david@redhat.com=
> wrote:
>
> On 28.04.25 13:03, Barry Song wrote:
> > On Mon, Apr 28, 2025 at 7:17=E2=80=AFPM David Hildenbrand <david@redhat=
.com> wrote:
> >>
> >> On 27.04.25 10:22, Barry Song wrote:
> >>> On Sun, Apr 27, 2025 at 2:16=E2=80=AFPM Feng Lee <379943137@qq.com> w=
rote:
> >>>>
> >>>> Remove unused conditional macros.
> >>>>
> >>>> Signed-off-by: Feng Lee <379943137@qq.com>
> >>>> ---
> >>>>    include/linux/pgtable.h | 2 --
> >>>>    1 file changed, 2 deletions(-)
> >>>>
> >>>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> >>>> index b50447ef1c92..47c5a54b7551 100644
> >>>> --- a/include/linux/pgtable.h
> >>>> +++ b/include/linux/pgtable.h
> >>>> @@ -1164,9 +1164,7 @@ static inline void arch_swap_restore(swp_entry=
_t entry, struct folio *folio)
> >>>>    }
> >>>>    #endif
> >>>>
> >>>> -#ifndef __HAVE_ARCH_PGD_OFFSET_GATE
> >>>>    #define pgd_offset_gate(mm, addr)      pgd_offset(mm, addr)
> >>>> -#endif
> >>>
> >>> Do you know who else had pgd_offset_gate() before except ia64?
> >>>
> >>> /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
> >>>      resides in the kernel-mapped segment, hence we use pgd_offset_k(=
)
> >>>      here.  */
> >>> #define pgd_offset_gate(mm, addr) pgd_offset_k(addr)
> >>>
> >>> btw, do we still
> >>> need pgd_offset_gate() given that nobody needs it now?
> >>>
> >>>      1   1168  include/linux/pgtable.h <<GLOBAL>>
> >>>                #define pgd_offset_gate(mm, addr) pgd_offset(mm, addr)
> >>>
> >>>      2   1112  mm/gup.c <<get_gate_page>>
> >>>                pgd =3D pgd_offset_gate(mm, address);
> >>>
> >>
> >> Right, we should just remove pgd_offset_gate() completely in this patc=
h
> >> and simply make the single caller use pgd_offset().
> >
> > Yes, exactly. The original patch doesn=E2=80=99t seem to be appropriate=
.
> >
> >>
> >> I think we can even do:
> >>
> >> diff --git a/mm/gup.c b/mm/gup.c
> >> index 84461d384ae2b..05dd87ccce155 100644
> >> --- a/mm/gup.c
> >> +++ b/mm/gup.c
> >> @@ -1106,10 +1106,7 @@ static int get_gate_page(struct mm_struct *mm,
> >> unsigned long address,
> >>           /* user gate pages are read-only */
> >>           if (gup_flags & FOLL_WRITE)
> >>                   return -EFAULT;
> >> -       if (address > TASK_SIZE)
> >> -               pgd =3D pgd_offset_k(address);
> >> -       else
> >> -               pgd =3D pgd_offset_gate(mm, address);
> >> +       pgd =3D pgd_offset(address);
> >>           if (pgd_none(*pgd))
> >>                   return -EFAULT;
> >>           p4d =3D p4d_offset(pgd, address);
> >>
> >> Unless I am missing something important :)
> >
> > Technically, it appears to be correct. However, it seems that
> > pgd_offset_k is primarily used to improve readability by
> > distinguishing between kernel space and user space?
>
> Yeah, but this is GUP ... ("user") ... looks like that check/handling
> was in there ever since git happened.
>
> get_gate_vma() only exists on x86-64 and uml.
>
> I wonder if that could ever actually reside > TASK_SIZE such that we
> would even need that.

I assume that reside > TASK_SIZE can only be true on IA64?

 /* Look up a pgd entry in the gate area.  On IA-64, the gate-area
      resides in the kernel-mapped segment, hence we use pgd_offset_k()
      here.  */
#define pgd_offset_gate(mm, addr) pgd_offset_k(addr)

Since IA64 is dead, is the code also dead? It seems we can safely move
forward with the approach you're proposing.

>
> But this whole gate stuff is confusing ... IIRC it's a single VMA shared
> by all processes, and not actually linked in the maple tree etc.
>
> --
> Cheers,
>
> David / dhildenb
>

Thanks
Barry
