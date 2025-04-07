Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD4E18DB03
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032722; cv=none; b=m+YGB4ksPwN0rMgUlkJInVyKfLgnWYyUPKT/5OSkGB12JQ7dM2/Fe/E1FKGppeHv4J6yt1EOMb74kbughE8tb9QKbytYUAWt+PQ7l6GpGNe8NVVilXZLKT30tbAbPilK5EZ1utwqID7kQVlLkGA/gCDwbme/xEhXbjgqa8K5orM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032722; c=relaxed/simple;
	bh=pshHZokkV0X8NdPqgJdsG3+1aBCKOvBdXCK11R1Yk7k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GOKOD7fEGf96amrIYAQZybAfDvJA7ybdg2LGkhjklvWCZb3DkJA5vqfh882U4pe8kb/BFy/oVn+YtiOTT6wdUt+i1YuNfOoHyTiFIhWbQk/hpDeyNaxz9vLy8S+MTWDsj5cm54erN7a2HkapgCRw7wCmWvOisZ1IF6s7h35d8zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SZfwoJl+; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SZfwoJl+"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so3035549a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744032719; x=1744637519; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW7NRP7hVniWiGB6UL0laEFQgAVHaVo7/jjO5z8p93o=;
        b=SZfwoJl+inkc1PQj2UM1YFTUBiLzYsvYPY60/Duo2aYX6KHPUh+xPXllbAUMD9Ed3y
         e2w3wJnZUK9KVaq1tzHd1xDpSIfAc3y/te4dZS+JDWbaHLcydXPhRr1MmOcH1SGYLIN3
         HphOFh7jCZoCbTslXvYkIDR7CR6nCbML0PSYdSA0gLJvxw5LdTEK0wDelHrYy+LExGke
         ybzL1gcQOKwgqqBwkn1foDIejNDYqLsrV9VHFe38d6+Wh7kO3iOmVMklE1v+HzHlp0Ao
         HuNd3/n0N0vFe5gcAoEKSxXmNqblOStKVB0x0npzfNknPloPvweLWlv8KI4/tY+CJN3Q
         Nnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032719; x=1744637519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7NRP7hVniWiGB6UL0laEFQgAVHaVo7/jjO5z8p93o=;
        b=pKrMHG3+mms4c/ds881MlzwgVKOGXdjQOFhmAb7fwhZ8avS5fSY29WeRRooXx2BR2C
         4VXJFYl27baKLQ3BKi9U8+mtQ5gHa2SO266zUN3rzZbiYv5gVlpsq5NYRaRYybxSJK2d
         h0KGId/MB7seCouUEFj8RnkAMJvWZ9MbA6xC80TseMZu/bcsdNziq2PYTKDMKq2QQ4NH
         NS0J286R6ftbm7F/vbCyn0yedT3OjdTOluWgwvy2zF0u1W7MvPc2nEdEB2kRObjbl2h8
         ztmNk2e4ayqzjB5vewlIo5lznNruxtVlHLq4+35va2bBHleyjLfXHOEnLERInsOyrXGt
         9Zsg==
X-Forwarded-Encrypted: i=1; AJvYcCVUmNtNk7S0G6ZCRdJiufqgoLraHuX/mPB9Sxslon+LNBCPUgjk5QvIQZZujRqH8q8p8NiUZSFBVfb61BY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx9I4/jDQqe1kdIb8/dPIN5bmcMe36YyrQ3kjCul7mrp85CXcy
	Ilt+nESn1T704nCcW75SxSCRTLI3OAiU6Rd6bYgSKHMSg5PxT3veaG33gpHDXoYltBdMax7LdNm
	VVuW9eoZywBo5uJLJUXJ1iRlfvec=
X-Gm-Gg: ASbGncv6kGnsa+icFK4sqsrIS+XB9HBBcBpUxbNB4wizEy1moWzDxgMTOHZE/YVgq1I
	DYzHVe7ijlg2AYfEHi5XwNDnOfguat2ORjHI0rmUHH0fgzEEHG/XvpTJWXy73fxlRCNuiM5gjC7
	qDv1A918pzyxRete6JhUrPLYJbUg==
X-Google-Smtp-Source: AGHT+IFBlB6Ga15umPa39EQLS5gekFeGZCivZxz5YF+QtcJdtzN/ayMPgiFJeUDLz8ax5kgoj5rU5Ip1Rp8qsQe8kcM=
X-Received: by 2002:a05:6402:430a:b0:5ed:19b4:98ea with SMTP id
 4fb4d7f45d1cf-5f0837374bamr13633396a12.0.1744032710021; Mon, 07 Apr 2025
 06:31:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
In-Reply-To: <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 7 Apr 2025 21:31:12 +0800
X-Gm-Features: ATxdqUFxa60yAB7AlomJiSWp637JosPrB4u1vsUKdG1vfTWoIp9hVXH1SuDnoCU
Message-ID: <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Subject: Re: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ryan.roberts@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
>
>
> Hi Lance,
>
> Thanks for your feedback, my response is as follows.
>
> --
> Thanks,
> Xavier
>
>
>
>
>
> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
> >Thanks for the patch. Would the following change be better?
> >
> >diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >index 55107d27d3f8..64eb3b2fbf06 100644
> >--- a/arch/arm64/mm/contpte.c
> >+++ b/arch/arm64/mm/contpte.c
> >@@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >
> >               if (pte_young(pte))
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> >+
> >+              if (pte_young(orig_pte) && pte_dirty(orig_pte))
> >+                      break;
> >       }
> >
> >       return orig_pte;
> >--
> >
> >We can check the orig_pte flags directly instead of using extra boolean
> >variables, which gives us an early-exit when both dirty and young flags
> >are set.
> Your way of writing the code is indeed more concise. However, I think
>  using boolean variables might be more efficient. Although it introduces
>  additional variables, comparing boolean values is likely to be more
>  efficient than checking bit settings.
>
> >
> >Also, is this optimization really needed for the common case?
> This function is on a high-frequency execution path. During debugging,
>  I found that in most cases, the first few pages are already marked as
>  both dirty and young. But currently, the program still has to complete
>  the entire loop of 16 ptep iterations, which seriously reduces the effic=
iency.

Hmm... agreed that this patch helps when early PTEs are dirty/young, but
for late-ones-only cases, it only introduces overhead with no benefit, IIUC=
.

So, let's wait for folks to take a look ;)

Thanks,
Lance

> >
> >Thanks,
> >Lance
