Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E3527E7DD
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 21:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749157613; cv=none; b=bHsUTwov+ik2mLWcbqc8zmLH2HFRMxRYDfSGilrey2EG1OhArfPqkOhisRaoQ8bQhqRcGrTaxoxPO6lyFPE/FS6KaB7ivojCRXK966DK3pghlOUyvCnus3pwPDCb6WcdUP55ehpDyDjk+48uiHjCFbDSuiW3f59ZTosXfcFgZmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749157613; c=relaxed/simple;
	bh=opgv1wEXerdl0y8fo81eC9+VV0HRKdrhqP6Hc3Nrjv8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWDf/MPuqqk0xTPJ7tAv3N1XAFj+yV7dz5YEh58PQBFSqYtM1FIAWVu5ej1EYU36DvPaqZHH0u20LjLcKah0Oqvxtot7bdysD8fbxeGcBXp4wNeYOh+WmpyOT4sm/VTdPvT6C0TaEdGWjM9jBOFb/W3wV/vlWL/S92oBYqRnFFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Yey3F62d; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Yey3F62d"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555L4iC8025099
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:06:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=+4t+B2pD6+kpWYFt+7p6MEr09BsrqvjyD3ljU+axPAs=;
 b=Yey3F62d/5thvpoAv6BWRhQU/VKUic/00d6QzVimrbhapPndDLIpzXHGS8nHmUtl0jXA
 YhNEAKuRQ8Y6IaQPHTykjONtEc+sV/yqaO3WtY8xMnzTBHuTarUIln5qzsZDEZDPzAVz
 I/hAJ6yAhWHvpgWGcx/70hpqxvpkyoSOPHr5hXmtTvlVgedIiaXJ+nU/p0RmCibi6+s2
 WFoAOgKW7I4DoOCaU328I+w9pDL2imFr0ekT5FgBlD4KHTHXsSUTMLFTYr7SjRvdYOdD
 dYpPEPv0goao46pP1kQhEohXeJl9plropxI8ZaiMsmYny6I3vmM06aSb1zuowzib7Sy8 Zw== 
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 46ywy11xrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:06:50 -0400
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70a4fd518b7so20536867b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 14:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749157609; x=1749762409;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+4t+B2pD6+kpWYFt+7p6MEr09BsrqvjyD3ljU+axPAs=;
        b=uM4JI8i/XxAEMl6wHwAIHf5GLrfXacOtk/cdAOJjTMRgu2tJrNGp2kNfhasu2PoF9B
         ZvSfAhNo5+G2RyfJmcrcg5aFe2ydVKVZ41z3wo71WhDo8bzhFalD9gEP7McPzOYiguc9
         z6t2fe4yJoqjj8qDUNL7UCd9P+WMG475SHmIViFBnctACyWXudrWr2QGdUYGJ2PLP7Vx
         pFxwxhIOtYJpa8t58rH8H/jXb2TOD/T0pb1Yq/CNuVYX7AnhiUVBx/sMWxC6/+o2Ox1z
         PyDfoIxyiPAh2ofzSYe6VUYO+Hv9FSoMMTER+hWQ6WcHW6WVfsWmLxmWEFXlWcSbKmsZ
         3Ajg==
X-Forwarded-Encrypted: i=1; AJvYcCXu30GE3Q1memcoLS9zhLRLl1+8MuXy3YbwJdOaB9Gi5SU6H4MVepCVT0NmgO8Yss2+AHvqMWikWYKQ1GE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxv6AmgaakRNikuKWvm0YmW+PF/nLG7ZN9aYIF+Z7Uk2zKMnuE
	1vL3PnwtOSW5qDin2jk3cyRPVWs+iMxX0UcF0qABr+CT4zhz0uml66F1derex0WzsSut7iEdIhi
	+LeHlTNu2ltYdrkBZEn+VskCh7lj5JWH2fq/Eugr5xrscPcFSZqdyrYHYfIPwOWH9TMoGCLe4uh
	WT47NvWq7/t/9CW5ldeR+4p5QdORVzmZJqnCEu
X-Gm-Gg: ASbGnctQ7r7dEVzjudGXDVDDK6K2W3KCCLllA8aeR35hAIMTJynOMw/DhQtoe8p4TbV
	hkVMwyu714i2CVwJMMg9iQpWWAGYP2R8ELpOPPF5HfMURaucUOrFmAfMQXh3z0fwyPUjZaQ==
X-Received: by 2002:a05:690c:3685:b0:6f9:7a3c:1fe with SMTP id 00721157ae682-710f776cc31mr13836927b3.23.1749157608938;
        Thu, 05 Jun 2025 14:06:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFpswqCHFSqwALooH+sBikcUL5B8njFjFNXDocdSyUUxkugwfcle1F23KSlnDph3jsu+K0GvNMwj824P5EaQo=
X-Received: by 2002:a05:690c:3685:b0:6f9:7a3c:1fe with SMTP id
 00721157ae682-710f776cc31mr13836337b3.23.1749157608327; Thu, 05 Jun 2025
 14:06:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-uffd-fixes-v1-0-9c638c73f047@columbia.edu>
 <20250603-uffd-fixes-v1-2-9c638c73f047@columbia.edu> <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
In-Reply-To: <84cf5418-42e9-4ec5-bd87-17ba91995c47@redhat.com>
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 5 Jun 2025 17:06:37 -0400
X-Gm-Features: AX0GCFstPrjtQYpw6EfTjM-xcC75nUUqJYkys8M1u1GJ2SLteZ0JyCXfVm1EAzM
Message-ID: <CAKha_sq7QQ5+GQ_4irNcfdNqPgHpNUqHUZe8D0g+-Y-_La4ohQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] userfaultfd: prevent unregistering VMAs through a
 different userfaultfd
To: David Hildenbrand <david@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE5MSBTYWx0ZWRfX51oRjpKba8BF ep0gNAcXO8p9t9ZEVl42InDGXuwFqW6M7vpGu8fqMCj3XI9GCuiuKfiAfEDe6N9vEnDE2++NVwm s2mrXk1M8ETmQ0WnE5pOuHTQuotNaG563uSpr6NipHTRqaelj6Rz1rVAiGuHWWJSqRonMe5rj/0
 r+1ZL/NMWabA7d5/m1gg5yONR31VrYojVMtqCDyKpJUN72x+vMqe3Sjt4Mryg+LHtGQY/EquhtB w4a3RbJnPrbSt1pMen4eRLojmcXgFEjFW/rJF73hLFLxodDNNEOFE/6YvyVJYMES+lEcSv9SV2X fy+O/7nSjubjId+v3fxWHVUw69uOF2VHeSVeVxcCXXuPwZr87Y66msBs88J6sK0mUAyperPrN6z k30J6KJc
X-Proofpoint-GUID: Tx8zgV5lPtvhuDaXreRpwOF5GMwqOEMV
X-Proofpoint-ORIG-GUID: Tx8zgV5lPtvhuDaXreRpwOF5GMwqOEMV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_06,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=10 suspectscore=0 mlxlogscore=834 clxscore=1015 spamscore=0
 mlxscore=0 lowpriorityscore=10 malwarescore=0 impostorscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506050191

On Wed, Jun 4, 2025 at 9:23=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 04.06.25 00:14, Tal Zussman wrote:
> > Currently, a VMA registered with a uffd can be unregistered through a
> > different uffd asssociated with the same mm_struct.
> >
> > Change this behavior to be stricter by requiring VMAs to be unregistere=
d
> > through the same uffd they were registered with.
> >
> > While at it, correct the comment for the no userfaultfd case. This seem=
s
> > to be a copy-paste artifact from the analagous userfaultfd_register()
> > check.
>
> I consider it a BUG that should be fixed. Hoping Peter can share his
> opinion.
>
> >
> > Fixes: 86039bd3b4e6 ("userfaultfd: add new syscall to provide memory ex=
ternalization")
> > Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> > ---
> >   fs/userfaultfd.c | 15 +++++++++++++--
> >   1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/fs/userfaultfd.c b/fs/userfaultfd.c
> > index 22f4bf956ba1..9289e30b24c4 100644
> > --- a/fs/userfaultfd.c
> > +++ b/fs/userfaultfd.c
> > @@ -1477,6 +1477,16 @@ static int userfaultfd_unregister(struct userfau=
ltfd_ctx *ctx,
> >   if (!vma_can_userfault(cur, cur->vm_flags, wp_async))
> >   goto out_unlock;
> >
> > + /*
> > + * Check that this vma isn't already owned by a different
> > + * userfaultfd. This provides for more strict behavior by
> > + * preventing a VMA registered with a userfaultfd from being
> > + * unregistered through a different userfaultfd.
> > + */
> > + if (cur->vm_userfaultfd_ctx.ctx &&
> > +    cur->vm_userfaultfd_ctx.ctx !=3D ctx)
> > + goto out_unlock;
>
> So we allow !cur->vm_userfaultfd_ctx.ctx to allow unregistering when
> there was nothing registered.
>
> A bit weird to set "found =3D true" in that case. Maybe it's fine, just
> raising it ...
>
> > +
> >   found =3D true;
> >   } for_each_vma_range(vmi, cur, end);
> >   BUG_ON(!found);
> > @@ -1491,10 +1501,11 @@ static int userfaultfd_unregister(struct userfa=
ultfd_ctx *ctx,
> >   cond_resched();
> >
> >   BUG_ON(!vma_can_userfault(vma, vma->vm_flags, wp_async));
> > + BUG_ON(vma->vm_userfaultfd_ctx.ctx &&
> > +       vma->vm_userfaultfd_ctx.ctx !=3D ctx);
> >
>
> No new BUG_ON please. VM_WARN_ON_ONCE() if we really care. After all, we
> checked this above ...

Yeah, I mainly added this to maintain symmetry with userfaultfd_register().
I don't think it's really necessary to add this, so I'll remove it for v2.

I'm happy to send another patch (preceding this one) converting all of the
pre-existing userfaultfd BUG_ON()s to VM_WARN_ON_ONCE(). Although I do see
that all uses of VM_WARN_ON_ONCE() are in arch/ or mm/ code, while this fil=
e
is under fs/. Is that fine? Alternatively, I can remove them, but I defer t=
o
you.

> >   /*
> > - * Nothing to do: this vma is already registered into this
> > - * userfaultfd and with the right tracking mode too.
> > + * Nothing to do: this vma is not registered with userfaultfd.
> >   */
> >   if (!vma->vm_userfaultfd_ctx.ctx)
> >   goto skip;
> >
>
>
> --
> Cheers,
>
> David / dhildenb
>
