Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000E3085D4
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 02:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750300440; cv=none; b=ToZsrYcxwn0lxIeNjStBP8Fl5TZuL0IhRKxgiY9J51V3nG6YJBfgQ+4vhsF3cHpgq3qIYladbIcMOKqF15TPUh3lR6z9nzDHLSoGaxju0MawoJyAuDWupIqrKuLoha64CR0vOWPfEWhN6/CULtbau3e6BUBGlhOexF88lGSQGTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750300440; c=relaxed/simple;
	bh=sJUhWzqDYFjVWBrp8d464EFyZmzNGX68WUXiHGxdApA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofNpKeFrzVd3PHukDWOWGvxRgTJOZ2Ybqm+OC79lhesIgZDmbtNaPl08zdd+g9aa75s0JU5lx4X1t+w/B9AuK33TmpVjVlc4vK/RwUchFnqLEbsrIukRFl8poq9P4YKMtKUEp6Q4mGCl8ezLDiif9aLhZWPjApLuvRdHM2dEQM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZhmoJXdj; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZhmoJXdj"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-adf34d5e698so284724366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750300436; x=1750905236; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qZaRIcnLSWTxAUc23lsAeFwA75g32kwb+EZUzCHwX5A=;
        b=ZhmoJXdjqz2umi6EOSILqbQAlyCwFSrcqeu2Gt4u1yd7OiPoZGv/0J0xJnEHzxYViN
         emaA2VhRoREwW8IlT/YYkdh+TQazXH422p5+W5F6E1VBVlW6P/dRUzWe+7w6FvbprPMP
         GszlFXjPdXpvd0MF2rl5JB/ujDvOTA9nBqMFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750300436; x=1750905236;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qZaRIcnLSWTxAUc23lsAeFwA75g32kwb+EZUzCHwX5A=;
        b=L7sSdFkPnQ2W2HSQjO1yqkYCINyRMNREwHRIcab16SI2JJ6MDmRas6fhgqudTcCCa/
         qMQdB94WnwPhoyIqOiNk0Pgnz9I87ubWgsCpJwL+6lJRmrWarojddopmi/xpt5JDoXHo
         bPjGlUv0FGWIuPvcO4JstVFT8b3IJMfZlq0QfbsRPPVNI+2TNg/r/xk3iZaPPYubcY0D
         5wRRfiidID1fyamAqQsWfAT3HUUglgBSPiEu0nPmlsNMJF6EI3UPhr/vK9mJrNAaBOv7
         R9j79qa444rEc7UjB6wdYym6aeJrG/w/7qpVS2oE+5DsZjQJ/E8qGN1kHF16ybwpjAM0
         cikg==
X-Gm-Message-State: AOJu0YwC71IidT+ZnGVcswQvom6vSoe1qBq29d7lP+FRNLnuN4RIMM/4
	DYAsQanGNsVe3ZKLeD9D5UAnOm+2FEFpP45ef5mCtA1cuhimb+HksHkLyDlk86RxBlIdjYTI0qI
	CSewe/CM=
X-Gm-Gg: ASbGnctk4AAAkrCtzEa98P/5Y6KU0FcsZ6larggxr7mg48N6T3mz/iIVtKlaqsjpdN6
	0Lhk5ShqIjlbDJx4/Glw3VbN1JjXH9a+vV0bRKs3ClmidhHk2OWQo0RLXLxGk/d7jYDxsqIv4aX
	hEaM+vVu9CACu8YDUFzAAFJ+paSWAVtQNpaqpMeu59KsVxSrTZSlVjy/wuitujqo6tZMHRB8GWe
	cjDlC/+AeqrNnddcv0aHH4IZkyxG/ASp9IeGKWHxk7Fj4RYzMychLARgBU17lXK+MOCcfl5H68a
	NQMdn3XLLLd1GTwT0euyXVvuBiDoX84f3mx3SI3mBq1u5PD6sGp+h9wy4lNRgpuT0cztNbG/JVm
	j1eVBgt42VMFpfB+zPte8za4c0pBGF7qHZycB
X-Google-Smtp-Source: AGHT+IGP/XFGLUrW93JwCiHX1JM6zLDHyB6TBlXKDB00/Nyc8crDtqWSgXKRqsZ/oJ4nrw9cF0/8mg==
X-Received: by 2002:a17:907:1c27:b0:ad8:93a3:29c2 with SMTP id a640c23a62f3a-ae0353096a8mr168122766b.14.1750300435945;
        Wed, 18 Jun 2025 19:33:55 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adff0e8574fsm547082666b.42.2025.06.18.19.33.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 19:33:55 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so2832767a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:33:54 -0700 (PDT)
X-Received: by 2002:a17:907:980b:b0:ad5:6cfc:e519 with SMTP id
 a640c23a62f3a-ae03526ad71mr181898866b.11.1750300434674; Wed, 18 Jun 2025
 19:33:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
In-Reply-To: <CAPM=9ty750Ex93+9d6DJ1hFJE8XuhXOf7Q7dgXryvhGYLwHbdg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Jun 2025 19:33:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
X-Gm-Features: AX0GCFu-lejFqFkxEUpB5z_OdBN9QFW1K2i6l6NDd37ymUmXQizsHunFMDg14QA
Message-ID: <CAHk-=wgd=MdzRHO=bV=g0G0mMV+7ek-q2WnQ8P5sxwJdau-t=g@mail.gmail.com>
Subject: Re: double free in alternatives/retpoline
To: Dave Airlie <airlied@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, nik.borisov@suse.com, 
	Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

[ Adding Mike Rapoport ]

On Wed, 18 Jun 2025 at 19:08, Dave Airlie <airlied@gmail.com> wrote:
>
> I've just tried to boot Linux master with KASAN enabled on a laptop here, and it showing a slab UAF for apply_retpolines.
>
> I haven't had a chance to bisect yet, and unfortunately I only have a photo of the oops.

Hmm.

I think it's due to commit a82b26451de1 ("x86/its: explicitly manage
permissions for ITS pages").

Maybe I'm mis-reading it entirely, but I think that "its_fini_core()"
thing is entirely bogus. It does that

        kfree(its_pages.pages);

but as far as I can tell, that thing is happily used later by module
initialization.

Freeing the pages that have been used and marked ROX sounds like it
should be fine, but I think it should also do

        its_pages.pages = NULL;
        its_pages->num = 0;

so that any subsequent user that comes along due to modules or
whatever and does __its_alloc() will DTRT wrt the realloc().

But I might be completely barking up the wrong tree and mis-reading
things entirely. PeterZ? Mike?

             Linus
