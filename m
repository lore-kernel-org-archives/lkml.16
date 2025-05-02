Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD67741AAC
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 18:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746210316; cv=none; b=PD1XPuEN6VryMqBl5HVZm+G+y0dUQmg+6PbtLYU4PoJMKUs833yOHrulZ50QkzBajs+kAs9CSVUA6uPAX4xXVyLOmc3KnUxuMXxjnynq8peu0Zyo1T9va19tB1BZDq5vtBWnfNMBPn1uGVkRWt2uQwMy+X02k9ZMMUw0kV9B7Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746210316; c=relaxed/simple;
	bh=7988R3mZpKGG6Ak4AjVYu0TJ2HcEVdVBtPTKH/kklsc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcj5QQ3cEP/T4IEs+dTGdszT4Zfd/xI4NALO1+SDWkOo2rsM7jSDvsBVmqwhrhm52SksWVxU9NF6k9JI72Y8njSK5OiKKKyJMsk7JsLx3bveTSviAv9ypdLqFNE4BDbjdKcVZg/Nso03FB410SBSc7JKI6GtSGT2RjuebiYsXro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XkbS006O; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XkbS006O"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2263428c8baso14205ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 11:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746210314; x=1746815114; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Emot1Htzetmhc9hYsA7C5Lev8H41HDZmzIfFRACzMi8=;
        b=XkbS006OiWglzXMoAHq0vCs3PMcGVmUkA4h9xiU04TYsY4Qxw/0JjdkzjMUfd+Otno
         rq4ERrGa3gv2axIGktsOvX9pcIqZMuOc+/Un8XhU5Vr/kBvtktS+hb91nhvl4BC7CPXQ
         fnhl8K+sR4qJibPBRzGQfm4bpU/Ywk65AHxQP9ygvJcg2C+V+RgUF4uv+nXeEmr5Wf8C
         R/proTwxUcNJzmZUeGvKcj3B/QBFdqR3qHOXEDu9ReMHo23MockyQNzQ08idkmqEx3UJ
         06GQsC/+THIAsnAOznpcAT1fhhruM7jIxZTbIo/+trhjlj/WkukFJx1QWBJ5L7a8Z2OE
         Y5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746210314; x=1746815114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Emot1Htzetmhc9hYsA7C5Lev8H41HDZmzIfFRACzMi8=;
        b=G5ndcuFf29lk37gqfirbcG00CtDiMuMGEy8TOBvqNMv1PXIhLT082UfuiyM+SBgFAb
         Zj+dnto6hI/qbLOgcgEPTCHA6RTe+q2cy1vhPgS/1Y5gmOpi4vPFHO0CSY2kXUADbYnj
         Cc8Cescct1wcWzkr0lUtkoYK2jC8Ps66DAA0LKiQYfskDPxSoNY5QXdBejz2+0cr2K1c
         X/CMh44cxXHEFOAUmcVZSVwSKNdC17Q+JzIMNo2cLuS/zQWJQgWpIScgysNXyjoNSvMx
         7/+yV0b9ri18wWHoTV2b2DUDTh4QSKNXmZPbdX/hAVbBVFS23p1y4XyeS3wdU8od9KXK
         FruA==
X-Forwarded-Encrypted: i=1; AJvYcCU2u4ougvMIoqjtaw/7LcdqW72qKIOSHdEL+9q0pK2J4yF/HUDxbnZC583sZwZKdBODG3Le2EJK8v5Ia8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVCBh++1JY7uYiLMDMjmTVCfj4aqrqoDQ98y+4m5TPFtmcJ/nF
	S2mW/f1LVa1FZS0SS5WchyHpXxPjR6sTwCPFsH5zVr3j3X+I9UnN/933Qzj9jMtpdEGNFlygeS0
	GpvikRBfj4Nu2e1sWJEuT8L4rfQpy6CY3eyWA
X-Gm-Gg: ASbGncvQzb3g5G8x7VO0nht1XsSJzW09XoIRkxdnjMh9dlLyLlGtP4mP/W0oG6wS9rN
	umjAI3DkmvGUi9mJgV1jNyFpO5auQTJAOm4/Q0bbLJ3C3CpI5e1Vw3TBug0GkgV9RWhq6CYEtJn
	pcJcoyvc20s8RtLzzM0JzTfd/DMs/cIrexFyCOulKVSgdGfBM09qbG
X-Google-Smtp-Source: AGHT+IEnS0W1NZg6BUaKBaLsmGLWSW5k5kMx7vCqjZJE1BvXZ91WD0nASnnl5YMQZHiCSuFVgwr9C6f8WFlXw0DbnC4=
X-Received: by 2002:a17:903:1b68:b0:223:ff93:322f with SMTP id
 d9443c01a7336-22e18a3edc1mr240885ad.2.1746210313713; Fri, 02 May 2025
 11:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410074721.947380-1-yeoreum.yun@arm.com> <20250410074721.947380-3-yeoreum.yun@arm.com>
 <aBT8BWqoljvcAU_w@arm.com>
In-Reply-To: <aBT8BWqoljvcAU_w@arm.com>
From: Peter Collingbourne <pcc@google.com>
Date: Fri, 2 May 2025 11:25:01 -0700
X-Gm-Features: ATxdqUEsIDCdc1MXwbGpU0vqEfxYt1UlHJ7H90sjFz9gZvQP6g4z1_zIOkLmOYo
Message-ID: <CAMn1gO4Ft2R+_CN+XdTsO0YpUQZN7zShMSg-XT90U698Rnifjw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] arm64/mm/fault: use original FAR_EL1 value when
 ARM64_MTE_FAR is supported
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, will@kernel.org, broonie@kernel.org, 
	anshuman.khandual@arm.com, joey.gouly@arm.com, yury.khrustalev@arm.com, 
	maz@kernel.org, oliver.upton@linux.dev, frederic@kernel.org, 
	shmeerali.kolothum.thodi@huawei.com, james.morse@arm.com, 
	mark.rutland@arm.com, huangxiaojia2@huawei.com, akpm@linux-foundation.org, 
	surenb@google.com, robin.murphy@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 2, 2025 at 10:08=E2=80=AFAM Catalin Marinas <catalin.marinas@ar=
m.com> wrote:
>
> + Peter Collingbourne as he added the SA_EXPOSE_TAGBITS flag.
>
> On Thu, Apr 10, 2025 at 08:47:20AM +0100, Yeoreum Yun wrote:
> > Use the original FAR_EL1 value when an MTE tag check fault occurs,
> > if ARM64_MTE_FAR is supported.
> > This allows reports to include not only the logical tag (memory tag)
> > but also the address tag information.
> >
> > Applications that require this information should install a signal hand=
ler with
> > the SA_EXPOSE_TAGBITS flag.
> > While this introduces a minor ABI change,
> > most applications do not set this flag and therefore will not be affect=
ed.
>
> It is indeed a minor ABI in that a tag check fault resulting in a
> signal will report the bits 63:60 as well, not just 59:56 of the address
> (if the signal handler was registered with SA_EXPOSE_TAGBITS).
>
> I don't think user-space would notice but asking Peter.

On Android we don't set bits 63:60 on heap addresses when MTE is
enabled (and userspace programs aren't allowed to modify them in
addresses they get back from the heap allocator either) so the fault
handler should continue to see them as 0. Of course, a userspace
program could be breaking the rules and setting those bits anyway, but
in that case it looks like the only consequence would be that the
error reports from the heap allocator would sometimes be missing some
information (and this could already happen if the access results in a
non-MTE fault) which I think is acceptable.

Peter

>
> > Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> > ---
> >  arch/arm64/mm/fault.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> > index ec0a337891dd..f21d972f99b1 100644
> > --- a/arch/arm64/mm/fault.c
> > +++ b/arch/arm64/mm/fault.c
> > @@ -837,9 +837,12 @@ static int do_tag_check_fault(unsigned long far, u=
nsigned long esr,
> >       /*
> >        * The architecture specifies that bits 63:60 of FAR_EL1 are UNKN=
OWN
> >        * for tag check faults. Set them to corresponding bits in the un=
tagged
> > -      * address.
> > +      * address if ARM64_MTE_FAR isn't supported.
> > +      * Otherwise, bits 63:60 of FAR_EL1 are KNOWN.
> >        */
> > -     far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & MTE_TAG_M=
ASK);
> > +     if (!cpus_have_cap(ARM64_MTE_FAR))
> > +             far =3D (__untagged_addr(far) & ~MTE_TAG_MASK) | (far & M=
TE_TAG_MASK);
> > +
> >       do_bad_area(far, esr, regs);
> >       return 0;
> >  }
> > --
> > LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}
