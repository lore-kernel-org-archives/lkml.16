Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4B1EF396
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745701042; cv=none; b=X3oNukY+yGHSLkMVppJlpv+4BKazqOYZrzTAjgiZ5VOYkqIZeBm59yjiQCzLAZVWWFL2uAD7FN9AH15z11jjPOm7gUpi6rsMRgnr2e4ICq+v2CKx/wYRBJ+udS6AKozs5CIN72vzFIhz4QAs/HFZr0amTwIhd7EMjB3NZCaJLBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745701042; c=relaxed/simple;
	bh=vrnKQhr5cfP9Ei4CCB31DhEqb6QWvhLq1OVYP4NPdFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dS/Hsc0ehLh1iTUkISBlagBUqyBYZvDGSBuvUlf0d7NcnGpyYsVyo+5YIfpGOSBGKJDs4g7epYTv2Dibzt7QhdVLNEL/A2FP00k+hmfpx/eovBLUY2xMeX1ksMlB+CtWn6tkMeUojn0qKjtJVzdOYzDzvuIwLqxsUFUabzOZx8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WDu2d7JZ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WDu2d7JZ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5f4ca707e31so5559968a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1745701038; x=1746305838; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
        b=WDu2d7JZIdChj9dkRvwNMXfXn6NrI70pIy18/AhhzN7r5Cywja7os97V6BjKxMNtY8
         9ChkgjNesBEUZNeP6GnSPTsMpLWjCI4AnY5RZTIL5g+ZVBQRYekjQe34Y4okh5SN3/kQ
         EpHmi/+AL51e8ZkQ9ybphkjgbl2+QGtneDw9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745701038; x=1746305838;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UoAad0UF3aMOunyUShqi7DpSlcddCQ3yXawelXX5azs=;
        b=Om9D2UcZna3MmcHZQdhELfv1QIZNUd15HVDaTF9KkAvs3fKzmNge+mWZ1W+xIyZjZx
         d8tI+Gj3Apxu1wQT3TX/IJmIdqz/X3Wd0btujrS7krUStEEO71XR9X0HtSXolr7ptYz/
         TMTsyFg7J3MhUeyxzysu0YQjSwrWtNNYMfZdevTSV8hfCUuM/LSjbcwkcfDiZmVLGMIb
         EJ0tVBiLLPXyeYhP8a9gbjZJ44Q78Vl6WHqLqlawD/8ZDbtF+aABa+f+Tigpp5b/h0y3
         mAH/UOL43oukMNN/FV2Q1Azu2FLGantRm4m7v+5bBeCiQTZmsKNhuZunzFq655ziUkNN
         Rt3w==
X-Forwarded-Encrypted: i=1; AJvYcCWXHVtEotuux/TYNSU/mw/vhQfY5psttbxvyrmn0JDQt/Evpa8eCGLIRFR8t0QXmx1fsAbsw+/V110N2SM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyiD5WZXpN0zbMoAS5s6HVSYq6TyZ0w/wh3HfYZX+HfAcpI0mx
	ZF6WLKZ8KDBjNvvY7TPRlDR/uakkkGPS+R2I4MOu3xJ/Bl7oqUFufVFNzKibEEva8myz5Bw/b8U
	zTq2VlQ==
X-Gm-Gg: ASbGncvZIDMQkEgvR/0/gbal+vVnTC2EJQ4ElAcSjPaoI5s9/U2zqzr3Yz2rf1Iqpme
	+Ryyi5GULIvhCxMxTw1s42cI8l9FUqZ6+GIKiZMngVQZxsg2fdrE9w3Y3r/6AOSS1jd/nthT6HT
	km6BdZWBdfK7iztAgDimvxHou10wdiyZB8enVED6hRLGcdjXHHX+hqlWl0FPJyfA+83UkWa2AdF
	D5cGPtXWlPqFNqSHw6i29C7aIXFZfmic1Nr4nUDtLw7xQXEgYYRmfVsgS7++B50QvZfXeMTgG8I
	hKGehC7Fkk+En1oy5z37z1f0Xyoq/GfPvgSWTy9j2DGeqMy6hF4wjVOx9Mpjc4xCaMfh+Ly1sai
	s5VhW+j1AASRFEC/GktCyMpQH1A==
X-Google-Smtp-Source: AGHT+IEeyUBktqeIzFP7F0NNLVj5tQ/IDnukii6UXu1wZwMhPZe3xQCh+blhKPgkErxOIqHzBqB9ww==
X-Received: by 2002:a05:6402:3496:b0:5f4:d4e7:3c37 with SMTP id 4fb4d7f45d1cf-5f739594b2fmr2951764a12.6.1745701038029;
        Sat, 26 Apr 2025 13:57:18 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7016f66b7sm3223929a12.46.2025.04.26.13.57.15
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 13:57:16 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-acb2faa9f55so429042166b.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:57:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUn/oy82Ik0hJptLtlhm+Uv8zUm2GYDUTiFyl8HdbVq5q4M5OqsAU1b2rvwpMpwNjR1+QifNVpVdscPEtA=@vger.kernel.org
X-Received: by 2002:a17:907:da6:b0:aca:d5e9:9ce with SMTP id
 a640c23a62f3a-ace848c0444mr251602866b.9.1745701035588; Sat, 26 Apr 2025
 13:57:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wiq=E0fwJLFpCc3wPY_9BPZF3dbdqGgVoOmK9Ykj5JEeg@mail.gmail.com>
 <CAHk-=wip2-yTrWpAkrUQ0iejEo2PjReddu4xntwBvdnSvWDbzg@mail.gmail.com> <20250426200513.GA427956@ax162>
In-Reply-To: <20250426200513.GA427956@ax162>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 26 Apr 2025 13:56:59 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
X-Gm-Features: ATxdqUFEDV4hwTKkCo5LsFlF2depTN17SPH8wq3XkwJj60cqlzJsiqa-S0xR4lk
Message-ID: <CAHk-=wgPCbZv0JgqoNWMOO+p=N772YW16xYk_pmb1GU7aeuPFA@mail.gmail.com>
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

On Sat, 26 Apr 2025 at 13:05, Nathan Chancellor <nathan@kernel.org> wrote:
>
>     KBUILD_CFLAGS += -mllvm -trap-unreachable

Hmm. That certainly builds for me, but yeah, it generates new objtool
warnings, notably

   panic() missing __noreturn in .c/.h or NORETURN() in noreturns.h

and I *think* that is because that flag makes clang not honour our
*explicit* "this code is unreachable" annotations.

So now objtool complains about the fact that clang has generated some
random code that follows a call to 'panic()' even though objtool knows
that panic() cannot return.

And those explicit annotations definitely should be honored.

IOW, there's a *big* difference between "the programmer told me this
is unreachable, so I won't generate code past this point" and "I have
decided this is undefined behavior, so now I won't generate code past
this point".

So what I'm asking for is absolutely not "trap on unreachable". That's
wrong and just plain stupid.

I'm asking for "trap on UD instead of *assuming* it's unreachable".

Because clearly that code *can* be reached, it's just doing something undefined.

See? Big big difference.

             Linus
