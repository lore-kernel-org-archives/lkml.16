Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884742641DE
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745869359; cv=none; b=HOW0NQIDQdQLakbUI7mBeHtjHZLvET1CeAzZ+h3521tSbkeOdb5ngWYkREbYCgBKNMWugyTqy/tZEi1Mh1CIjt0TOKiuUMrN4iXN+HspIwQPh31P27g4RMVEtt7akUMvfQUaA+TxbeVdXvRTqIFlSUhGKWzH7hC4Y525oR6KS+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745869359; c=relaxed/simple;
	bh=W/B8TYHnPhSF2zk1/LG3xB6VoRWSRltA13pjtEMPg1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pm6pHrBo1hFxfeMOBAb0RWBJ/OWdy+C0YMVwTa0Nl6LQCo8g5YULSdxXzsRSUYq+LHcRKJA4bSwE2ss7HWx3Ok9MBBsxB9ITO1Do3sKBq/lRGt0Dv0Jp3ASfKw9J1mrmhBhAj3PggnBmIr1Yb2rgj0FPNvi8OAhYzahOdtS0wfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Y/L4REA4; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Y/L4REA4"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so639825666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745869354; x=1746474154; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
        b=Y/L4REA4/H0QWu/svsLh34RSUz21jFn6xqIc3bbbxjxHAPUlA6ZWc5tQFl7pDLSzEo
         AzsHpfxOvkJN4NMl/57c1A9s2seRhlsiDtME8/7agn1zOAmtYYmhlFo4hiJ+vCgkB4ls
         Jrwkfv/1xxM4bc0bYLr5X3XEsqqQ/sWGr1Sdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869354; x=1746474154;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9fgYACCYEdV70Eqrp9KBhgN5b4Wv2A7Z2XX6in9YmNk=;
        b=XmJwMlQhigmc79Gm6A7Jvlrh/Ms/4ISsCG41Msk1QfB8bQ4ZGDOim2GVwEnec9V0fC
         ygREIo9t3Za5Otut4Rw/4GwLvM0O4Plgs4/BrzQD26nE5hZYeqWevehv+WE46eBh3Lzz
         1EWj/GIwee6VXx3jac/CTZuhr8VK4IW0ERjGJuXWp3rPKnpqLzsqMW3wWpvfKXP468ph
         qu+qoaoIaSS/0WQuD+WrblcIxhoOkEjtgFDt0PK1MwWhP+7cykSloLbVYIsFVAeIOUdz
         fmAsIBwJ24+Tb8Dwc0sXbk3Lu0AFG0wrkL4MxAE9wifWhO6+xUkaCJLImRzzSEUl2p42
         h6Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUrM7rR8/GAlCccAVwtHjkvMi8z9UZ2hcAmEUB66ipBhjqUpBVnurhZiUOXu3w0ruPyVE6vLFq3jils3jA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJrhKzA0ZYmQn9AlyFncnwhQnCd9qeXKTUyCSWzavPkNcJ1P6
	rDJEakTbB4OmFqDYSBOZzXLJwxpkKz/ZVnb60A1iTCu7U3Ye+qYelj/1bQL7h34OmeltlY7fEng
	R+W7PLw==
X-Gm-Gg: ASbGncuiYKDnnLKAJQpp5TbJlXpPevCARB/xv0kcivNtJCEdpUjG7ihpouIPd9guZES
	i29RHhzWBmlEp3Cuc25II+n089eN7sXBnx7W6PlxV6t67KMmFc1vREdU0L6jbQoLKJ+cK7d+0i8
	4li1gQ1x73C6godrVTaG1UYedXSOgTzKgMz9zLWiT8GMygPL3rOKvEtAp0EVlgjusQu8XVgMByY
	NsbUYf22PNWVvBa1lMG5rtne9zlhSSi7Eadiz0sMoPUT3rf9zHxmIuBvvu7Dn9MqQEZgO7oMnKn
	y+7s2JPDh0807lso7k2GwYwrPS8YZ/U4nJuCoPEOQVExR/ojVS2HKM7VxTO/+fHvB1veeAo1U0s
	zG3qcWj1oVqmd/9U=
X-Google-Smtp-Source: AGHT+IHCMUcB/0Mi+NsJm28dwX5peQIWtn+cyQ21LErjp92k182YRtfXXd3+M82g9Gb0iU+SBzrWSg==
X-Received: by 2002:a17:907:968f:b0:ace:7f5a:bc2 with SMTP id a640c23a62f3a-acec874c825mr6656566b.37.1745869353825;
        Mon, 28 Apr 2025 12:42:33 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41c91csm668351866b.37.2025.04.28.12.42.33
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:42:33 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6470485e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:42:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmK/+0bgrA7l+G8+ne5bmujJMKSaLIj9WlDKG/S5eg1umYBi5SbA0N/lxc6TxCwzkJhjLz5nQB8u9XJMs=@vger.kernel.org
X-Received: by 2002:a17:907:86a1:b0:ace:5207:e2ec with SMTP id
 a640c23a62f3a-acec84b84bbmr8545366b.4.1745868885415; Mon, 28 Apr 2025
 12:34:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162> <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
 <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
In-Reply-To: <CAGG=3QUk8-Ak7YKnRziO4=0z=1C_7+4jF+6ZeDQ9yF+kuTOHOQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 28 Apr 2025 12:34:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
X-Gm-Features: ATxdqUFMKb4hr1dAUfVb_bErfkkOWxj_7W2ubNDIidp8Hnky6iOrTQdD_4CxoZ8
Message-ID: <CAHk-=wgrT9++rFTnM1vh3bwx2Pcc18anDGQCwEL+0d2nDm3p+A@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Bill Wendling <morbo@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	"the arch/x86 maintainers" <x86@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Apr 2025 at 11:08, Bill Wendling <morbo@google.com> wrote:
>
> This situation is one of the
> easier ones: "do something other than fall into the next function";

Note that the "fall into the next function" is just something that
objtool notices. It *could* be "fall into the next basic block of the
same function, and objtool wouldn't warn, because objtool generally
wouldn't notice (there could be other things that make objtool notice,
of course - things like stack updates being out of whack or similar).

But I really wish that clang would look at a "don't depend on UD as a
code generation model AT ALL" as a flag.

The whole "this is undefined, so I'll generate something different"
model is just wrong.

That said, there are certainly graduations of wrong:

> but there are far more involved examples, of course. And even in this
> case, the compiler needs to know if a "trap" is okay, or would
> returning with garbage in %rax be okay.

Honestly, the least wrong thing is to just NOT HAVE THE CHECK FOR ZERO AT ALL.

IOW, just generate the divide instruction.

I can almost guarantee that that will actually then generate the best
code too, because you'll probably just end up sharing the divide
instruction will all the *normal* cases.

So the best model is to literally remove that pointless and stupid "is
this a divide by zero" code. It's pointless and stupid because it
literally just makes for more work both for the compiler AND it
generates worse code.

Why do extra work to generate worse code?

Btu if some religious nutcase decides that "I will not generate divide
instructions if I know the divisor is zero" is a hill they will die
on, generating a "trap" instruction is certainly not inexcusable.

Generating a random value for %eax is WRONG. Now, that said, it's
clearly less wrong than falling through to some unrelated code
entirely, so it would be an improvement on the *current* situation,
but that's like saying that getting shot in the foot is an improvement
on getting shot in the head: true, but if the alternative is not
getting shot at all, why is that "less bad" alternative even on the
table?

The "just execute random code" is clearly so bad that it *should* be
off the table in the first place, and I don't understand why it is
what clang does now. It's just crazy.

And yes, this really is a very potential and real security issue. In
the kernel I don't think we have this ever happening, partly because a
lot of configurations use gcc which afaik doesn't have this particular
horrendous model of UD.

But this isn't just a kernel issue, it's a "anybody using clang to
build any program that might have security issues would be *insane* to
think this is a good model for dealing with UD". We do more checking
than most on the code generation, so we actually had tools that
noticed this odd code generaton. I can guarantee you that 99% of all
projects out there would never have even noticed.

And who knows what cases we *don't* find.

And obviously hopefully UD doesn't actually happen. But that's like
saying "hopefully we have no bugs". It's not reality.

Using UD to change code generation really is a truly horrendously bad
idea in the first place, but doing it in anything where security might
matter takes "bad idea" to "just don't do this".

                 Linus
