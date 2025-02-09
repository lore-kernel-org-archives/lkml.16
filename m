Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB291922D4
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 19:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739130211; cv=none; b=KPYhx3UM+Uteo+B4MztVOOSzVz4cYxUKJ/nBKKaYWQhq3m0CcP0Y62PCWS4QgJmWJaa8V0Um90yYaecmAZpSO3IcBlKlWQoEkAOtyIzvu6Ez5C2ebjemCsFj7CVJVxeWf7/Z83mx5jWFA4MNnc+sOi7znMqXnp8vCivwJnT+5PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739130211; c=relaxed/simple;
	bh=eY+LOEE0CAuEQDygTaDwzp3VBIWS4wQc7Y/dqaU0B4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=upPA5G6Q02npWnr79I9b3S7eo2gnyio16I8ooGvmD/dEJVrfWyjY13IbJk7kQRLfHd819AMxlsGelvpqUcyFeHUXOyr086HwmJpdx9roYO0PdFjoe/G+5ngtBWLqdtPVTzKFPKh24mWZ1BRuKXkDsJSygc1VZvqC2cyYNuwa8Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=abYbKg+H; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="abYbKg+H"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7b80cc3d2so73704766b.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739130207; x=1739735007; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bJK5Dm1zTepUPVPm42tFyMDvmg4IjkhGFViLjAhYWCc=;
        b=abYbKg+H1aivvVCH3Wsgk2QDGZlOQu8QS1mKI96YFjDR5pYu+Xbvj5/dBeUd/6H0or
         HKx5D7XX69U8L8g7CwHfkSyOO+SbLE8jMHBO3AhbbidNL5uVrvUAzEXaVMv/8hgOqXGM
         WX2ZZGVtEi4LagKyIO4Q0wwtTzAXe7Z74x+aY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739130207; x=1739735007;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bJK5Dm1zTepUPVPm42tFyMDvmg4IjkhGFViLjAhYWCc=;
        b=islgAsFLKA2dtH9OjFP6hN4RVxnIhocT1EOYgS+8eDBsq9t+yEsC3UjgZia3xlIT/u
         ueE+hcy11W9ET780FYUkiasce9kg8aPkNkBXQZFlQr9iJwYT9FojGYy6bXrw7ZOWPtu9
         CwkXtxOm38mRJzljQEf2y4r+hS+OniEk2si8B7PIlzjuUZikkI0+S7IbQV3M2iMSBZqT
         y1jRuJ7BVlXsv3e/CUmzZhyEVJ1JWd+wwbbdBVpxaQy8/xJsCf1zBTNFw3s3/T7JnhII
         9GlGAAsivbckCoCYP01aFWV6akdTy4rOXoeaugs24AhratAuVEMikM7VJslgs4ZmHzXL
         QWLA==
X-Forwarded-Encrypted: i=1; AJvYcCVKKctJJIYQtXNvysbn2lxnsbXmxkUHPdHRIITaNJ0Rj/LLUtKjA0SNNWmYn/ycKKKEZSR3mL/p0BFTYKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv+3n8k+V9JVdFyn1e8x/IS/gATCc7TY0kCiVjal6YYTTsyNO6
	xBGzme009aJgl0vrKJZ7UyHQalcNuDVK/4WK4jd56UC5mNrRBfL3uYRY2WGB4NYmPo7xvDCvvxN
	EZcQ=
X-Gm-Gg: ASbGncubjcfxTSPQsA+lmsC5DL9imekSsn7uJ121xMDLRDDX2M3TgD+9COnPqtQnSTS
	u/P54OUIO3dTUt41hiWqobJw/PN8gpadEB8a+3Aw/GWXoy8WDoUfL7fDZVpiDvswc8CTztYUNGt
	5hY6yKrl71gE+ngGjp1UU1hAFqyA3DVTCIGe+6Oxqm81sy56EJLIhqDNIxMeEr4ayXhp1zQGXPH
	MXI9pfkNpeVfPbfjkt1EmhQdI+Qp+dJOhCuB7VLnj6eb0vnRoFn/m2j1crR40PADCcuSMhW5LXD
	bmPtwRqulOXobr7FMgRgrLU8MN51u5jQWVuDrU2pcFYGmgj9e4aF1AqnZFxtd/fNgA==
X-Google-Smtp-Source: AGHT+IF8BnR5Mtl4n0HDmKW57VbmUoAqDp637it4wQbSMy1UE8L80h7f9zuu4xRzFCQOuGi/+pIj7w==
X-Received: by 2002:a05:6402:2681:b0:5de:5190:cfc7 with SMTP id 4fb4d7f45d1cf-5de5190d22cmr23371142a12.19.1739130207484;
        Sun, 09 Feb 2025 11:43:27 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab791c89296sm512506566b.106.2025.02.09.11.43.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 11:43:27 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7b80cc3d2so73701966b.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 11:43:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCViUVJnUIHvPJXnrqMmhQoWi2GD+aOhYLnH1iTUkGiIJFaj6yxG9+Lw1R9J/pLgM8eg0yo3JM83vsVqyuc=@vger.kernel.org
X-Received: by 2002:a05:6402:3907:b0:5dc:893d:6df3 with SMTP id
 4fb4d7f45d1cf-5de44e5b84bmr32924793a12.0.1739130204955; Sun, 09 Feb 2025
 11:43:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209174711.60889-1-david.laight.linux@gmail.com>
 <20250209182422.GK3660748@nvidia.com> <20250209190003.661db659@pumpkin>
In-Reply-To: <20250209190003.661db659@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 11:43:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgecfFK=fDpk6+-C_gNOnzRKhO5wwuB7V396GwTRBhBJQ@mail.gmail.com>
X-Gm-Features: AWEUYZk1H6ql_sGrHEzKjC-gC5jO7hHDwKbbSp8AXf5o2F5Ayv6H0Qw3ZibIdkY
Message-ID: <CAHk-=wgecfFK=fDpk6+-C_gNOnzRKhO5wwuB7V396GwTRBhBJQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: Remove the access_ok() call from gup_fast_fallback().
To: David Laight <david.laight.linux@gmail.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, x86@kernel.org, Jan Kara <jack@suse.cz>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 11:00, David Laight <david.laight.linux@gmail.com> wrote:
>
> They still do 'stuff' and end up containing a slow memory synchronising
> instruction (to avoid speculative accesses controlled by the application).
>
> But there are better ways to handle bad user pointers.

Not always. If you use __get_user() and friends, you basically *have*
to use access_ok(), or you have to be playing games (like some tracing
code does, which actually wants to use it as a "I want a kernel
pointer _or_ a user pointer{".

Now, admittedly probably nobody should be using __get_user() and
friends any more. Almost all the reasons for using it are entirely
historical and just not true any more.

But also, comparing against TASK_SIZE_MAX isn't actually the same as
access_ok() historically. We've moved in that direction, yes, but we
very much used to have a distinction between "this is the fixed
maximum", and "this is the actual run-time size".

We've moved towards just using TASK_SIZE_MAX mainly because the
run-time size check was annoyingly expensive is some pretty critical
code.

But historically the TASK_SIZE_MAX thing is the "this is fast but not
exact, use it only for special code that knows what it is doing", and
"access_ok()" was "this is proper"

> So, mostly access_ok() isn't needed outside the architecture code
> that handles userspace accesses.

Oh, there is still a fair amount of code that really does need it.

Admittedly most of it should either be converted to just using regular
get/put_user(), or into the modern "user_access_begin()" model, but we
do have a number of __get/put_user() users that still very much need
that access_ok().

And anything that follows page tables had better check that it's
proper. But in that case, I do believe checking for TASK_SIZE_MAX
tends to be equivalent.

              Linus
