Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614A21FDA8C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745713889; cv=none; b=WUjiHeDsAsW5oolI233fy4gDhCuO2uMjILzdADDCJMdu3OXR69DAEOMLD36b1+/OTvFYE1hV2fF7wSmydiU7KRAvknR6eg27PTmYump6IlL5YHUOqOEZaxKIJAiNaYTvgU4SAFcP8o/Fr78TV90XywNABm3VY2MvwcV0IeJq6tU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745713889; c=relaxed/simple;
	bh=AgzPwiGXLA6nx0hLzoXimLP2/tpD66FvISS4pbCQCr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uFvyvJcNhwrfY/5q1XmYARYM6Uas3V7SVwzZ/wjijMNapZxeyXyohMJaqejc37vVfZW0sb8pxaMNWo0cIsAuc2k/v6etNWGCMgZsA6cOcIxqb1YokCybXNpe4JeFgQQDyDKM8JX1M11hBFmflGDyhria/OGTjm+WEvuU7HEmymI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Z63kg8pN; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Z63kg8pN"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f6214f189bso6696202a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745713885; x=1746318685; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
        b=Z63kg8pNNnYQWrNxs9/yD3DGEJgXFQc29x/Hs7AT6J3NoqyLFWe5lOd44Z+oip/5Jk
         5jfw4EXJbG+uzeRrqJnbvTGmo9Hzo3D0TKR7ce7vvxgEgxVBHLmzFUrWYPz6hxjXuGmn
         ZV47NDYNBLp/W9pKAfLl6mZfBmL/ykOmCCl+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745713885; x=1746318685;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kFnF6XQXyjuHCzFQmPZ6cMo/XgSLXx5JlYecXTeUa1Y=;
        b=l9zP5kKg+U355az0xVRc2WWsu4U0Ay/fXPqUytETTxoWhEL7QP302f3mwjrZcmNyLC
         qi47jtri9jcsf9f8xTJ12HJl5SMJi+qu+M3GAzowAdHXentJc2KDZ2RvmDQw/26waJ4r
         YNcyKMMnDTEzz/AFM4JIbxAuTJgw6wwBGQSPzVTYHUZF41WiIjDrhwSi01mkC96oNH78
         2i0tq24OfejEmyZf91rJmkuIMQK0gt+fXxRWzepvLOStaG7ceSTlJpMR4KZHyG1OL7T6
         Jv5mGgmgLUwQr5A/XTQzDZQzo668raC9N4Neib6C3PFCZhccerScbuYqgDpy3/bu4Hg6
         nXVA==
X-Forwarded-Encrypted: i=1; AJvYcCVaddwSSenXffjzaNbdLJ1ut4h16MTimRX31XmciSvR7owB2Wm9N8aORNXRwJcyuH8BO0OeDiJYrK/cOYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1/hediSRorZB0lugqguTJYd84anaqFr8ZY63C36cThvnFtx8o
	0fPHA1yW1UoOhuTQEmAJGgP3ZEAuAfbX1iHhaQJdex9YzL5Q0LXDcRqg0xvdaFu6isbvwvOu5tT
	8Z6GU9g==
X-Gm-Gg: ASbGncuEvzNwJkSdI/2sirGiHEFgTb1csHbsblrg3nmqrMjFLQOJvoPy2ZZ2fCn+4tL
	fNm+XuuXJwRhNw3uP8G8CE5WUiE520HIeDt3wOZ+qYp5E9f7fzKCvNZukqqyaWhmQ66YK3fg5Oo
	U/6uP9a57DjZ6EkKxGcdGPkr2emj2mZzk5M1FLZcdW8lou5C6fCxfhjZsPVv2yrhVPFYMiBPE3T
	sWwt+GFh+ho94MFSsSulT8MeXzw8zuis2On3k241aDG4sfdxuRbeOpqzGzsE1QQ56PW0meUQ5Jo
	tW9feVRnKTBm18naCkN60GJ19iGYPGovs8nEeQMEFUVJ03zh1yaIIhZ6i4WhUWN8CN/nX19kfLA
	ELmBKNplIp/eYMFk=
X-Google-Smtp-Source: AGHT+IHsY3IkRPMAWiV/oNEHDxwZiXXvWUTCgYTFUmxBE/w1oV9lvfecvIdB7cJcgYLQg5h5KHdHcg==
X-Received: by 2002:a05:6402:354a:b0:5eb:801f:6862 with SMTP id 4fb4d7f45d1cf-5f723a1d352mr6792865a12.28.1745713885497;
        Sat, 26 Apr 2025 17:31:25 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7013fe5c1sm3352405a12.17.2025.04.26.17.31.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 17:31:24 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so6753549a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 17:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXofJZJphG78lsOmgrB3v0gAMocWa5MUDGXRL5yekNAvOs/IGH++VudGKbAjltsTX2hFrIJvJk9hvu2shE=@vger.kernel.org
X-Received: by 2002:a17:907:944a:b0:ace:3a90:77 with SMTP id
 a640c23a62f3a-ace73b23775mr666667966b.48.1745713882190; Sat, 26 Apr 2025
 17:31:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com>
 <20250426200513.GA427956@ax162> <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
 <20250426232344.GA1395819@ax162>
In-Reply-To: <20250426232344.GA1395819@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 17:31:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
X-Gm-Features: ATxdqUG4kycEbobY8t6qpPfU6v6hZ5LAqpyt3P0fzgjGlYoNIvpe5smXYXHg7i8
Message-ID: <CAHk-=wha-AgeeqATWRrKuopM4fKhhF_tZE_raQM77qO7Zd3fOQ@mail.gmail.com>
Subject: Re: clang and drm issue: objtool warnings from clang build
To: Nathan Chancellor <nathan@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Harry Wentland <harry.wentland@amd.com>, 
	Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "the arch/x86 maintainers" <x86@kernel.org>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Apr 2025 at 16:23, Nathan Chancellor <nathan@kernel.org> wrote:
>
>  Pardon my ignorance though, isn't something like this
> basically just '-fsanitize=undefined -fsanitize-trap=all'?

Sure. Except -fsanitize=undefined is a horrible horrible thing.

Why? Because it pointlessly adds code to *look* for undefined
behavior, which is only extra overhead.

I)OW, if we have a divide, just *DO THE DIVIDE*. Don't some extra
pointless code to "is the divisor zero, and trap if so".

Because dammit, that's what the divide instruction ALREADY DOES.

The whole concept of "use undefined C behavior to change code
generation" is complete and utter BS. It's wrong. It's stupid. And a
compiler shouldn't do it.

The argument for it is "once it's udnefined, I might as well optimize
it away". But in reality, that argument is pure garbage.

It's garbage for several reasons:

 - there's no real life optimization to have in practice. You aren't
actually improving code generation.

 - there are real and serious downsides in security, and this case is
an example of that very issue

 - the historical reason for most C undefined behavior DOES NOT
ACTUALLY EXIST ANY MORE.

Nick Desaulniers recently pointed me at a paper that is worth reading
by any compiler person:

   https://web.ist.utl.pt/nuno.lopes/pubs/ub-pldi25.pdf

which backs me up on that "UD optimizations aren't actually optimizing
anything" thing.

So please. Clang people need to get a clue. Yes, we care *deeply*
about performance in the kernel, but a C compiler that thinks that
using UD to generate "better" code is a disgrace and pure garbage.
Because security matters a whole lot too, and the downsides of turning
undefined behavior into random garbage are about a million times
bigger than the "I can remove one integer instruction for zero gain".

For the kerrnel, we want to disable absolutely all undefined behavior
crap ideas by the compiler. It's why we use -fwrapv and have for
years. It's why we disable the idiotic "strict alias" stuff that
should never have become part of C. And it's why I want that "turn UD
into unreachable" mindfart fixed.

The notion of "optimizing" unreachable code is crazy. And the notion
of thinking that "UD means unreachable" is so incredibly insane that
any compiler person that thinks it is reasonable should have his head
examined.

               Linus
