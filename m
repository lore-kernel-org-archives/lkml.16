Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7D117ADF8
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739045012; cv=none; b=UCcMRuPwiBSFtKC26AjllyKCG6lhb98YhvfG0YgJAP0QNbsjzj1dSv8a1Tvxqy/HjBHmf6+0Kt3W6RWqt38djZEjFEowA2B+UOCtM+CxcnRqkgqhJ8XwENRqqq76Wq6WO95cMWwAdI5S01oNJcA9akwv0qVfg124MQNnWFX+Lf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739045012; c=relaxed/simple;
	bh=AJGPjA2vBe2mQhjSwTRb+LXPJOxsjjHsk16fLuvBC0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SYQahROnR4SIBlydaetWRB9pxUdTrzmS4r7ZovicA4Al9zOnRB8v2gkhSCInvE6rLY0ZR2d1GemEvXI8eZSXbeq4BD8p+IX0NLjp1X/2/t9G5BDPJi+m9MppIvZzewAFmLw8hJwCepMLpZzEYEEsE1iIF2rs9I05/7ZBvS3C27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=agEPuoWb; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="agEPuoWb"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ab77db6334dso395760266b.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739045008; x=1739649808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iYBjQ5V28Z74l1FXDnErVmTh1dw5xbuX4O4FtPTrSJI=;
        b=agEPuoWbGC3GwpuLltaVeFfPBXQo6G2oY88/mc5f2rU9nnJZlbc8qLvzbnT9/Udq0v
         taAnb59wBgAH4u4gtKgY3eOUzVGU9iQp6wckuKjUSemIzN0LuMBw4knx+P6n0N/dYC04
         ZCwsgRlXvmX3XkKUQ1JK1pXSuKl2dIzYY1wI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739045008; x=1739649808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iYBjQ5V28Z74l1FXDnErVmTh1dw5xbuX4O4FtPTrSJI=;
        b=EX6h2TiolT8abkb596Kj6T+a4a7bXP1CJtoVl9BTEL/0yRVVtZEHG/aKziwps3eAIE
         LZ42k7/y6yQEX0I5SABbNPR/hI+5Q655aKrKwMJKbx8MqhQqM/h3RU82aOPAfZEvcE2B
         sQDo/73rA4RFxsTjPbd7FCyDAko6GKGkOhufVWD93mzJuTBi4/fiMWFe/TSsLNEbcCps
         laWN15wJ9FOHg+bAv4NvrmpduBuYtgbNYeD47nLEtJOpVRDUbFpW7Qab8YSU7i6Ft5Ed
         vaIBzFfvNCYlLaV5vyaTDndlNJck0IQylAVsygfUQvN3SemTwWLb/OIp72fC0Io4RHXe
         jMBA==
X-Forwarded-Encrypted: i=1; AJvYcCXfLYCaLr6tXYaezfDa2Syc4KEQZJd2vVGnyPDikQnlXM95aFjnFYlS001Y4u+TIHUY9sbu8xPhuXcSPiU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCq9gps+NQT1f+Y9mSkKPKGdyxW5PNjKmA8J619Fbqylvkxm1U
	z4ZpkJDzlSdaUGo5B1qBT1eTC3XDpKu96sH9tMyjUJ0UJ/da7/wOD7ja37pwtF9DZ602uzhHbHa
	WT4oIMg==
X-Gm-Gg: ASbGncurNnEZYU2TbT2QQ/V+lRYG9hOWqznnbkmrfpKsVR7hrZy0D43tP2mzQtFpx04
	Rh307TVz921AswpGvu3wDBKCsfil/Op3dox+d6VeQ5v3O3c/Ao+875/MVI+eG8cDmFr1AM4Qs3n
	A71n8iv63xbSpTh/kyEWmQLHbXPzb6AZnOjwhmZvYOqHZBSBQHxAVs3BYkZ/aT2RUr21NnPD28A
	4b1XiFKHgn/FrNFp/VHDv5bxzRb8NQwppMGU7GSOMHmuPYi29xrD5glIKo63UUePw2zucevas9y
	pfBWfrXRdL9QlB17TrkVSvAG/5Iydwl2zKhwVYDwwnk6PjZPxR/+b9VQPmvEhNjXkQ==
X-Google-Smtp-Source: AGHT+IGmByPBqZZgvTTBpTqSwdbeinrHTJTfygydSi7iewysEFZMKkmhq9lpCCw19CC48nEVDqOlag==
X-Received: by 2002:a17:906:9c8d:b0:ab7:b93:f77d with SMTP id a640c23a62f3a-ab789a9ed18mr917495066b.3.1739045008073;
        Sat, 08 Feb 2025 12:03:28 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7a275537csm201206866b.66.2025.02.08.12.03.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Feb 2025 12:03:26 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5dcd09af4f9so6609089a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 12:03:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXeJHT6XMHjBYPCRBHAOxRUkjqtYj9rtckjRGLzvQoGIMYPTBso/oKTWnIaRUcafVFF8zp8Vtieuivst1E=@vger.kernel.org
X-Received: by 2002:a05:6402:5252:b0:5dc:5a34:1296 with SMTP id
 4fb4d7f45d1cf-5de45022b20mr8922570a12.16.1739045006312; Sat, 08 Feb 2025
 12:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250208151347.89708-1-david.laight.linux@gmail.com>
 <CAHk-=wicUO4WaEE6b010icQPpq+Gk_ZK5V2hF2iBQe-FqmBc3Q@mail.gmail.com> <20250208190600.18075c88@pumpkin>
In-Reply-To: <20250208190600.18075c88@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 8 Feb 2025 12:03:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=whvmGhOzJJr1LeZ7vdSNt_CE+VJCUJ9FcLe0-Nv8UqgoA@mail.gmail.com>
X-Gm-Features: AWEUYZl5iiB4XZzXu6gQI_yRDYLP1S23MRx2SK6qDmf7MiSIz-0VnfM7Dlycbb4
Message-ID: <CAHk-=whvmGhOzJJr1LeZ7vdSNt_CE+VJCUJ9FcLe0-Nv8UqgoA@mail.gmail.com>
Subject: Re: [PATCH next 1/1] fs: Mark get_sigset_argpack() __always_inline
To: David Laight <david.laight.linux@gmail.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Sat, 8 Feb 2025 at 11:06, David Laight <david.laight.linux@gmail.com> wrote:
>
> Can the 'alternatives' be flipped so the .o doesn't contain loads of nops?

Sadly, no. The instructions generate #UD if the CPU doesn't support SMAP.

Now, arguably the alternatives *should* be fixed up before the first
user space access and thus it would be safe to switch, but honestly, I
don't want to risk some early code doing odd things. The potential
pain would be too damn high.

> It'd be nice to see the clac and lfence.

Heh. I agree 100%, which is why my personal tree has a patch like this:

    -#define LOCK_PREFIX_HERE \
    -           ".pushsection .smp_locks,\"a\"\n"       \
    -           ".balign 4\n"                           \
    -           ".long 671f - .\n" /* offset */         \
    -           ".popsection\n"                         \
    -           "671:"
    +#define LOCK_PREFIX_HERE
  ...
    -#define barrier_nospec() alternative("", "lfence",
X86_FEATURE_LFENCE_RDTSC)
    +#define barrier_nospec() asm volatile("lfence":::"memory")
  ...
    -#define ASM_CLAC \
    -   ALTERNATIVE "", "clac", X86_FEATURE_SMAP
    -
    -#define ASM_STAC \
    -   ALTERNATIVE "", "stac", X86_FEATURE_SMAP
    +#define ASM_CLAC   clac
    +#define ASM_STAC   stac
  ...
    -   /* Note: a barrier is implicit in alternative() */
    -   alternative("", "clac", X86_FEATURE_SMAP);
    +   asm volatile("clac":::"memory");
  ...
    -   /* Note: a barrier is implicit in alternative() */
    -   alternative("", "stac", X86_FEATURE_SMAP);
    +   asm volatile("stac":::"memory");
  ...
    -#define ASM_BARRIER_NOSPEC ALTERNATIVE "", "lfence",
X86_FEATURE_LFENCE_RDTSC
    +#define ASM_BARRIER_NOSPEC lfence

but I've never made it a real usable patch for others. It would have
to be some "modern CPU only" config variable, and nobody else has ever
complained about this until now.

             Linus
