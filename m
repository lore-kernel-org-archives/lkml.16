Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDED21D6187
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746208998; cv=none; b=BuVQerJE32cXhE/9/GoijCtXHKjwnxbIx9T/4p8rzoLYCxEETNGcV7+mQyPUbGSPLkDArcXxO6ywb9a8mha1pxhi+dE1C8c4hhHlZ6E+D365UxZnrCmqIxPXzDbCz6AD2Q68zKJsE9dYpAgzPkwoqCxrT5UDsnthPjk4sLl0rPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746208998; c=relaxed/simple;
	bh=izXoVRU+7OViSqYvW7E6kyGuXfCC5s4BnUS6j3QPDTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a22E6iAogseLjUHH6YgzT9BVosGtYj2jYOwh/051asT8VwLDJysSasIDFiLKlzd2kX3pxNMn5j+/4f9C5OEp6kle1P1BF4e+rSj/5r4rAuBnVbeXN3uS45M9OSTO+4HWMNUJoMqLc4dxXzYOSc+oBahXu/OxgvySVbFp6GLGYFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hW321zuB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hW321zuB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2240aad70f2so16555ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746208996; x=1746813796; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+kbJ8+C/uu2ODDuwjMpH5SsAXpV8tPujfUT5kEiVUq8=;
        b=hW321zuBqBAcHC9D/AUZYPLj+J0/ZAiTp4m9GZTcQuhynezRSH2QaNuOoQK0+oYCSy
         FTQ+7FSMLVGN/sFkQ/sQWUSUqLYrKue2wkdzWX7uUsNA+36RH5/m1ZpZoKJWv67Aagnh
         yuZGRJYnIarlJg4LCkrpt66ugQ+s7sGELFa/MQAfBarqw/y6PpZsxglExPXXgSUV7SdV
         UV13Emun3tGQcfPpe+8p3h12U7yHNQxWeLaksWnL0DTSWj22L32zZP8l68YA0PikJKMs
         pfLKsn+rQf6UIjG37SrQW+x43ozF+UmhMSj2v582Kt+lkC8RHQWUe3NAGE4eRsb8RPq6
         LuHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746208996; x=1746813796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+kbJ8+C/uu2ODDuwjMpH5SsAXpV8tPujfUT5kEiVUq8=;
        b=tt3jCez1vJHdEVqyiswcRC39FFrDBwpMEZBzFcXd1DRUrvbv8N2qSYjO+zNFy35Pzj
         5KdYsKfXNMaDN/1/A7Tc10DEXMgGvUEjFFa+K9MVkFvLdh4jPZNCnbhvJKdd+nQHRdms
         nv8FNssQDpfBsqj9SHxDZ/EJUn2qynGsK6XXJQWW8QHMRDJ0L8gefyACoH0N9b0vJXt8
         +4rJfFcTPSWboBNZ4lEzEEd+hCrJfmgw65SL4Jm1JuGGQZ8k6BjQKQKghgkL0jZcQPoo
         cHUYgH9l2mXR7Ifw82Tn6jskn0saMIz1+V488ovtgOSnRhsxSxH0BGyk+tWYEiZ21aHC
         8l0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJW4beulv1E2eSaQAuOZy8EfGCDQ2dT47d6+tbEJQIVpO52edASqQxRDhb/qSn4wDrTj5dKR2JhpRI9e8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFG6Cle7S1p5TqjvJUdHOjW2gvrq5hBNZOAiCZaQKh+ZmVmTGv
	0JaTp/HuuT469WZqTxcwrpu7eDzk/PipcXqyvHu6zt0kgNsKaUu2d2GpauU1RSxUGdR5PE2Mxyq
	J6GQbN08xvUrbsDQF81hYT3004GasR1nN4v/a
X-Gm-Gg: ASbGnctyW6c8SzxWB5Gl6sLMEy8JUKfiR9Nff0fouawqX+T3gTv/LkYi6qgf0MUYheV
	/NPrcQESdgtVgSoyQlzsQ9ZI+zxqbKjKgldHM3M3K3pigdxRPhzYNeVpHYYweEkPf31xOd9nXSL
	s4nIAsU5psr2yM+3pMwaiargZvDWuTgtor91Bm94W3qV42GMkrH1E+
X-Google-Smtp-Source: AGHT+IGif0Eh2+5YkpX39b2tNiXHYnZt3gkMnS36U3DbQWNXHb+22416g9jDeQvpOmxKSTiTERO1uErucZK65/w9jk4=
X-Received: by 2002:a17:902:db0b:b0:21f:631c:7fc9 with SMTP id
 d9443c01a7336-22e189c0121mr194485ad.0.1746208995602; Fri, 02 May 2025
 11:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410080723.953525-1-yeoreum.yun@arm.com> <20250410080723.953525-3-yeoreum.yun@arm.com>
 <390f3d5e-8da6-4286-b8a9-72eabcc3abd5@redhat.com> <aBUC5fsSVzGkQtUV@arm.com>
In-Reply-To: <aBUC5fsSVzGkQtUV@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 2 May 2025 11:03:02 -0700
X-Gm-Features: ATxdqUGj_ouubcbGaHwTQTp7_F0tDIVnLUEUzyS1JU_L9W_1IMMJiAzk-HvEemk
Message-ID: <CAMn1gO7ai3EvHhepJJQXOvjc8_Mp6DEAZg0J1gMKSJTECnU0VA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] prtcl: introduce PR_MTE_STORE_ONLY
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: David Hildenbrand <david@redhat.com>, Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, 
	broonie@kernel.org, anshuman.khandual@arm.com, joey.gouly@arm.com, 
	maz@kernel.org, oliver.upton@linux.dev, frederic@kernel.org, 
	james.morse@arm.com, hardevsinh.palaniya@siliconsignals.io, 
	shameerali.kolothum.thodi@huawei.com, huangxiaojia2@huawei.com, 
	mark.rutland@arm.com, samuel.holland@sifive.com, palmer@rivosinc.com, 
	charlie@rivosinc.com, thiago.bauermann@linaro.org, bgray@linux.ibm.com, 
	tglx@linutronix.de, puranjay@kernel.org, yang@os.amperecomputing.com, 
	mbenes@suse.cz, joel.granados@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:37=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> On Thu, Apr 24, 2025 at 10:34:57PM +0200, David Hildenbrand wrote:
> > On 10.04.25 10:07, Yeoreum Yun wrote:
> > > PR_MTE_STORE_ONLY is used to restrict the MTE tag check for store
> > > opeartion only.
> > >
> > > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > > ---
> > >   include/uapi/linux/prctl.h | 2 ++
> > >   1 file changed, 2 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
> > > index 15c18ef4eb11..83ac566251d8 100644
> > > --- a/include/uapi/linux/prctl.h
> > > +++ b/include/uapi/linux/prctl.h
> > > @@ -244,6 +244,8 @@ struct prctl_mm_map {
> > >   # define PR_MTE_TAG_MASK          (0xffffUL << PR_MTE_TAG_SHIFT)
> > >   /* Unused; kept only for source compatibility */
> > >   # define PR_MTE_TCF_SHIFT         1
> > > +/* MTE tag check store only */
> > > +# define PR_MTE_STORE_ONLY         (1UL << 19)
> >
> > That is the next available bit after PR_MTE_TAG_MASK, correct?
> >
> > Would we want to leave some space to grow PR_MTE_TAG_MASK in the future
> > (could that happen?)?
>
> The current mask covers 16 tags (bits 59:56 of a pointer) and given the
> reluctance to have a tag storage of 4 bits per 16 bytes (3% of RAM), I
> doubt we'd ever grow this.
>
> However, you have a good point, we could indeed leave 32 bits for the
> tag mask, just in case MTE gets so much traction that someone wants 8
> bits per tag (and likely a bigger granule than 16 bytes). It doesn't
> cost us anything to add additional bits from (PR_MTE_TAG_SHIFT + 32).

If it's 8 bits per tag wouldn't the exclusion mask need to be 256
bits? I probably wouldn't try to anticipate this case since it would
likely require a different API anyway.

Peter
