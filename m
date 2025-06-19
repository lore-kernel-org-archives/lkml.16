Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8598184F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750301020; cv=none; b=bUJBGtinN031SYXIQuczPcEJxtozcrvm1oGsXs0S4RjPkv66jjlcAclLvnBsdswILgNPyYWOcwRhHNV9yKgK6bVqANCr3lSf3Y3XjqhgSpWKTtNF2u7wLWrljVhgahC+0r3Fq+/Z2/3cHJYu/6QvLTe3PRbSkwgeavjjPdblgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750301020; c=relaxed/simple;
	bh=TEZ8/B5PIRA8TeGUj8XHrodaSmxj9Wk+vOYlpf1ty3k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j3aJJclZZt0nDM+Xubr1UvJaboxcEVCrEYvrJn5VoUkz8pw63/Y7fW9Z2ceSsIHRLebphbSLxqaRItfp51I7S2bIWAvNLvRqTAk1p7t0T54U9gV4iQizbdoqtmG3xQRVIkpAL6ai5dW//OMh4hx9aVFsWhYRuvMHZtDiYhEIT8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuoLQ6zt; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuoLQ6zt"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade76b8356cso42157866b.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750301017; x=1750905817; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kUXnOCKx0jhCYvp4ZOgMBtTLiQILBrztkB0+hXuR1MM=;
        b=AuoLQ6zt5uoSjD7tkFJ3SLanY+dFj7hvEVyW3deji5GZRzUYJ1lLcQxKpMntbana0n
         tRkbEUGRYMLtYT2htcmQoAiSobV7Zi5Ohzf/ih/ePZEz6whTgDe6UpfEvOQV21jONbCC
         o3LYlVFopSuNHQdFXdDP+/R0R9XLOQ4G/w99gWQtqezdyASonKvIs6440rz30VpvbzSR
         xvD+UXHLd325Wna6IqLESLhi84FOv9C9WOkZ65GlvT31lDi4EHbkZ85fhp4nZ0H4GTN9
         08M2pYNvV+j/ROaGYZ5u3zy/Pj0hvvmQSKSkv+5q+y9BZD/5SPtb2DPdvXXvy27sTml4
         Cdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750301017; x=1750905817;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kUXnOCKx0jhCYvp4ZOgMBtTLiQILBrztkB0+hXuR1MM=;
        b=m49Sq+wFlcSnnFkrlTGivlL9jV4qXOm5uSKdbEuK19eDrAW6AIrmbCqPubtxXuxMvz
         qeP5mDMaAIGjmxby9noZxNAvMSkNNnm3oaGm2tTazbzuO6rYrFf5EPIalH//9+tuNIj8
         i3LS6AtOfhfcolhElfw+6b4V499ZeXz06fhAlnp29C7Hefnf+Un+b6bZvmXFMJyI+2Jm
         LD4ehBkSf1UCg3PajVeZJJab9wQufqZRCmKxS6QZ+AgK7hX2a0tnk6PNUJzgYpOPKNZL
         IguI76tVTnU81Izmq+nyAJ1DlqSZ4yjloe0eodECMvf26fk0Sd1M3UyxKJ8HL5mI1IgW
         B2uQ==
X-Gm-Message-State: AOJu0Yw5yT/qjyJ0tP4cITq73t5+iMgOlIS98WaaoeAAVKRCc+UriMvp
	xU2950cxbTbqSO3DUwJWjdA+BQCH9IZl6hn9Tn5t4NUQE6V3cAbmdR8HVd43zNEV/6J8rQ4H7hG
	KxYnbVxXNFr3MNQDXptCy6CyIJy1VQes=
X-Gm-Gg: ASbGncuKclAbLOVAVLifAGW4Ua090G9XDjh4vR/xWg1Iw1z7aYwuxjmYEC5OmxmRurT
	DtlAPoryzjNAWfik1pi+ltzv6FrxCeBY2OTjvji6MjHXEFTNoEm5R94y5Or9UW618oEyfpY0rFd
	LHhUQdrYh1+sifZI2ReyJKQBomJgz2gMDrddc7Yu1wuQ==
X-Google-Smtp-Source: AGHT+IFrVXOEUwvaWktx81ie7MxAuE0T+Bvh1unQF6rmA8euANAnesJaoc6j0Hhp0JPDN8tf+k76g8IubowVxoSJhjc=
X-Received: by 2002:a17:907:6e9f:b0:ade:35fc:1a73 with SMTP id
 a640c23a62f3a-adfad686483mr1946522866b.55.1750301016655; Wed, 18 Jun 2025
 19:43:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
 <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
In-Reply-To: <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 19 Jun 2025 12:43:25 +1000
X-Gm-Features: Ac12FXzwC2aCrO8LZ3tWxyqSR4EXIngmwIi8dnqdjwmAxZiL4sR3nC4E_HMJei8
Message-ID: <CAPM=9tz2j6aWT0oQ-D74GdgQ0N9Q73y2yEKWvi7XfzDuvTkhaw@mail.gmail.com>
Subject: Re: double free in alternatives/retpoline
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, nik.borisov@suse.com, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 19 Jun 2025 at 12:33, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> [ Adding Mike Rapoport ]
>
> On Wed, 18 Jun 2025 at 19:08, Dave Airlie <airlied@gmail.com> wrote:
> >
> > I've just tried to boot Linux master with KASAN enabled on a laptop here, and it showing a slab UAF for apply_retpolines.
> >
> > I haven't had a chance to bisect yet, and unfortunately I only have a photo of the oops.
>
> Hmm.
>
> I think it's due to commit a82b26451de1 ("x86/its: explicitly manage
> permissions for ITS pages").

It's definitely ITS related, turning off CONFIG_MITIGATIONS_ITS lets
two test machines I have boot.

Dave.
>
> Maybe I'm mis-reading it entirely, but I think that "its_fini_core()"
> thing is entirely bogus. It does that
>
>         kfree(its_pages.pages);
>
> but as far as I can tell, that thing is happily used later by module
> initialization.
>
> Freeing the pages that have been used and marked ROX sounds like it
> should be fine, but I think it should also do
>
>         its_pages.pages = NULL;
>         its_pages->num = 0;
>
> so that any subsequent user that comes along due to modules or
> whatever and does __its_alloc() will DTRT wrt the realloc().
>
> But I might be completely barking up the wrong tree and mis-reading
> things entirely. PeterZ? Mike?
>
>              Linus
