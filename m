Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B23F289E14
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751475641; cv=none; b=kZ6DK723qn1Ax+SN32cQDSRQGVJOnMixsyU5eDMOSrccOrb8TX44KJfKleBSXiLZPBfxDR//i2lzzOrO2hULWz5V1ChocwA5i+C3tDCb8JUa0g4scROM4p3AsoZAZ1ZneSx7bnY0PN+VtQ0y0wa2bcCmi50kUtMzWZPhNXD9E5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751475641; c=relaxed/simple;
	bh=7R8O9Sy7GmzduITiDik8nmm+DUNuPAZ3smpgXxsr+yA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T62UJs9VNEzsuvrVSRhq/FEfG5nxFIUeQ9KDb+KxqB2lQWZyI2Sth5SZpsX10mgcA80dk/80APx0s/M9fP+3BlgPpgsnr26uJ1GS4Hzjn1zJRnFZQDmjJmnUBSLVNtutzuGfV6gQNMELN0EF3wFxgQtnHzQRmGiYS0cU/v0yiro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tVAO2/3v; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tVAO2/3v"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60b86fc4b47so270a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751475637; x=1752080437; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClpTUPxlw9qKpJZHFHAxlvtkPFSTpQG0D0TAtGQlJmQ=;
        b=tVAO2/3vjnudvBmv1aqgE5qaaEm0lc+U4BWXqj01KUcj1NLnHXjLLiW7ZxPI4Pat6z
         OaX9MfSVDfrhM95YStTu5dLMsOmfG05OkLCA4cqbEMyTarar6DsLGo6t636A9Dp1N7DD
         j8Xv4RwPGsOoI6v+OZyn7AYSWyykuAYwxGOSZSMLGRBMLTnGadzlI5hN49e+1gsA8853
         5As0c5AMuE3QLQPHprT6xdGmioT8Ywy/8/NzkJIy6SCByWwWvzvKlYd3Fluov7MbgJjp
         SgOvKPp3G41rLKq3W7PfBsuGko9tjMTYta7yF/oMp5eb6zUUOU0pNRXQOdJ23cPH8mmV
         ktCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475637; x=1752080437;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClpTUPxlw9qKpJZHFHAxlvtkPFSTpQG0D0TAtGQlJmQ=;
        b=c3ZmTW6eThh75yMaj7kJocJ5EFybgITJotTi+MRGLf4gXhDOYfSwW4gs6TYaZBk5Wc
         YudIcY9JN/b9Gwe/tZEBZzEFWOeRTFtpYhVvUfcRFemQxxpSSgWBJNd785O/ejA1Xyh6
         Bmloi2xDVoQ8WlKUOVJeqNovuF5+1dBkDWhJbKYd81h16gplsL2Wwr4CGhKJHklgwr0E
         yt9F+JUGmsVf7oFaYUX2jkW/e/PWW9Vb9mK/1XRL3irWjEB3+UZnf0Q3E0iVhunZnhig
         2pT2cYsRXkDPm6jaYqC47owtDSjn362mRBvijLQxI3V1M/jo5t9osB/juRpIHoZSj3vE
         Mpvg==
X-Forwarded-Encrypted: i=1; AJvYcCV7aVO1VfIoetZEJJICzcjOa43z7XeZWfBH6M8VgD6DcKt7FLfowdlkrKeyyI6jhnO8T3eSFUOxe3LnFPQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCIoP5P2dksiyfQFkWzNkw3GTs50Bs4tYMqE0mQUCcbJLUGXkk
	en+TH14yXh2aeZYLy8k8OEyterv83wVEhEavyG7em1rZZbQAiQ9IQUCTOk4c0u/PvTAN3J0ia7a
	VVgjBt48CQNLqzwuxE3UrYOtrjqWn1zOccazZl0FY
X-Gm-Gg: ASbGncs9jEck8ZYdEfPSHuTPeYvseJDKiTvKK2rKk3OshHeP/vwzRB5BZzf05Z7SD6/
	isBWWB3/Gqfucq3CDGRnKtvncwAhDnIkaHavEp+KwOP1VnGyB+hAxKW1qT2C1Z1WAxu2g8JtXXk
	eFctCA031Ya8esXH/CxhY483EQ0KeGZoY/OzsUopz/+sJsEzuc1JETnHfDvWaE+iF2HQl4I3Y=
X-Google-Smtp-Source: AGHT+IG+KOhc493DGFqZhnwt/78T8773N8GPugOIwolsxQo6/kvF01euKel9h9IDyBdJVu9Tl31HX26v2DXluMoxtlI=
X-Received: by 2002:a05:6402:4496:b0:5e6:15d3:ffe7 with SMTP id
 4fb4d7f45d1cf-60e38a8846fmr273711a12.7.1751475636478; Wed, 02 Jul 2025
 10:00:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <68653927.a70a0220.3b7e22.245d.GAE@google.com> <366d45aea0b64cfc82c0988ae5fe6863bbd28261.camel@surriel.com>
 <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
In-Reply-To: <CAG48ez2_4D17XMrEb7+5fwq0RFDFDCsY5OjTB7uaXEzdybxshA@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Wed, 2 Jul 2025 19:00:00 +0200
X-Gm-Features: Ac12FXwfImLCEQ6KEDh5ISUpKfCCFi1cN4aPqsw2TjQT9F76WByIAQEOJPJXEEc
Message-ID: <CAG48ez1VMw=aE88eTfk9BscrmS7axJG=j_TrTui+htLF9-4Wqw@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in flush_tlb_func
To: Rik van Riel <riel@surriel.com>, yury.norov@gmail.com, tglx@linutronix.de
Cc: syzbot <syzbot+084b6e5bc1016723a9c4@syzkaller.appspotmail.com>, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org, 
	luto@kernel.org, mingo@redhat.com, neeraj.upadhyay@kernel.org, 
	paulmck@kernel.org, peterz@infradead.org, syzkaller-bugs@googlegroups.com, 
	x86@kernel.org, kernel-team <kernel-team@meta.com>, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 6:53=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
>
> On Wed, Jul 2, 2025 at 5:24=E2=80=AFPM Rik van Riel <riel@surriel.com> wr=
ote:
> >
> > On Wed, 2025-07-02 at 06:50 -0700, syzbot wrote:
> > >
> > > The issue was bisected to:
> > >
> > > commit a12a498a9738db65152203467820bb15b6102bd2
> > > Author: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > > Date:   Mon Jun 23 00:00:08 2025 +0000
> > >
> > >     smp: Don't wait for remote work done if not needed in
> > > smp_call_function_many_cond()
> >
> > While that change looks like it would increase the
> > likelihood of hitting this issue, it does not look
> > like the root cause.
> >
> > Instead, the stack traces below show that the
> > TLB flush code is being asked to flush the TLB
> > for an mm that is exiting.
> >
> > One CPU is running the TLB flush handler, while
> > another CPU is freeing the mm_struct.
> >
> > The CPU that sent the simultaneous TLB flush
> > is not visible in the stack traces below,
> > but we seem to have various places around the
> > MM where we flush the TLB for another mm,
> > without taking any measures to protect against
> > that mm being freed while the flush is ongoing.
>
> TLB flushes via IPIs on x86 are always synchronous, right?
> flush_tlb_func is only referenced from native_flush_tlb_multi() in
> calls to on_each_cpu_mask() (with wait=3Dtrue) or
> on_each_cpu_cond_mask() (with wait=3D1).
> So I think this is not an issue, unless you're claiming that we call
> native_flush_tlb_multi() with an already-freed info->mm?
>
> And I think the bisected commit really is the buggy one: It looks at
> "nr_cpus", which tracks *how many CPUs we have to IPI*, but assumes
> that "nr_cpus" tracks *how many CPUs we posted work to*. Those numbers
> are not the same: If we post work to a CPU that already had IPI work
> pending, we just add a list entry without sending another IPI.

Or in other words: After that blamed commit, if CPU 1 posts a TLB
flush to CPU 3, and then CPU 2 also quickly posts a TLB flush to CPU
3, then CPU 2 will erroneously not wait for the TLB flush to complete
before reporting flush completion, which AFAICS means we can get both
stale TLB entries and (less often) UAF.

I think the correct version of that commit would be to revert that
commit and instead just move the "run_remote =3D true;" line down, below
the cond_func() check.
