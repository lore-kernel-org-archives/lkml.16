Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D4119DF81;
	Thu,  6 Feb 2025 18:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865688; cv=none; b=b68RbK3zOCd+txwrrTOnwFk36J+/uox3uSJ6YUmu+Poz6mCc24O/ToqRGhS5Gnt4gbsdOzG9ASQXgXMYOWK5tvIOEKKoa5X4Ay99yr5bz5yY5i+rDrjXbzFG910Mks0QnCFfbv2GqZXlZMeeOqBoOcGtopxXzVP2iQbjMOd99Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865688; c=relaxed/simple;
	bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuqsLE7Gl2bMVGt2HJdN1Q5vB6QWqwunXmVVSeqjIdqyN0qYsRZNJas9We0SKz+tfqg3ppp+4q+04lubv0CZQvyyPgryTF9euZx5/eewi05ouMKt4YtPk+N9c5ypdKrclOlUB30ZeuJFBahoj1s6wa+Jd1zKqMhWgCXPr99oDx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlGa+rnB; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlGa+rnB"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so448075f8f.3;
        Thu, 06 Feb 2025 10:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738865685; x=1739470485; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=ZlGa+rnB0qBjXLjtB94jndR60xLZ8Afd3mMszCUXFsha1llRApu4U0MtcU5OhlXBIP
         B52R0qkRqIZX6OTMZexCL3pcWazri6QEmp/MDek1ecFurr0qsKcMdAWSKoXj507ZRSfS
         1tHTlxGUitNYNbUsOVNbnL6Js7Y37PtrjmawWjuXP+Sd4xEE78CHn/Y+inV+0fzMDGuM
         w4+FiD7sR4Mvl//ePr6RBbCgxn1RXx2MO6SVTAz/XOD4kfsuteaZLh9/1LlrPWrDUrLN
         gY7mqHyl0WdFPrm5xW2tLxAtmlgLvOL1xLJIZ8tTS4XazshZGLPlBrob5VZR2wnMEa0l
         iSJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865685; x=1739470485;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wTbbT4CsuJ/iXGmiqeOEuQTztaWXsApJ6CIEHLfEbjE=;
        b=lwQJI1I+kauLjKMvgcJf7UMkijZeSJ3n4YEl3ohrFL2dv6ztm8+pxXKa9JQg4lb7NL
         GhbzURsYXzcCQwmfM/R2i8SxIjk6m9XJxTjrOboGtuvhVSbuTHe32197bmaPyOCpCiKz
         kOkWNP1DhTlMGah4x5Z9IMQZrJpLmd9Qvi3p8i8Wcefdlru6YjhC/RwLliCh4848nHLw
         lQOnlYB+/kp/hDJf1Uh3vjPY8yuR/kK5KEYAqd/XNU6DL9/NxCqCL6WRmFgLaClVxxSc
         2pXWKpewQZAabK4xwLzh8T+CPPxAvj+7jKo2RIyWoWUweS6xHpP+aU37Rj8cbDBgnNRl
         Jl0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVmti7mjwic9U+cpaykg5Hhm+X2YiiGnYqUYbU8AayFN2Q4624WPzozAXtJagHAeE77YKEar9RMSNP1HVFD@vger.kernel.org, AJvYcCXqUMKb1//bjjQiTOw6kNpNDeUWWmZlh+Nv56Q+aI6r6xg/WiF0NK9Oky0y4ELhgDPQyxhEU1wQRD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcMAuRhMYkCUctWnjEhfl1rWd7OeuTOM2G/1U8WNsSeXWKEoU5
	NF9tREj6PLGBcO95fX4YFoJ5VYHxwDLe7D/kgsv5mp70sEtPBIHoDBK/jDhkNr0NhIzz5kBXgoK
	DEr4rDISKVVsxl/K+MPs4BeFO59c=
X-Gm-Gg: ASbGnctY6M6/UwH0STbDQkgjFMgNCIVibWmnNbU1szR0ah5VymuvuFUaCSm7jOagBuO
	1n/hr+Pc0aKnJNE3t6qS/VGQREPo3Glm6VDVg42M5SyY6s+2X2iVAgIh3DDhDC4/KkTpDZrFGug
	==
X-Google-Smtp-Source: AGHT+IHBkaKzKisMLjhYNPQEk4vOcutkS0bItT/CuWo+2lyB11rB/+L1N95UZJSHFEtHE7FQsPK4hkaRlaOSWfeGMWw=
X-Received: by 2002:a05:6000:1acc:b0:38d:c2ef:e291 with SMTP id
 ffacd0b85a97d-38dc2efe475mr1873314f8f.39.1738865684758; Thu, 06 Feb 2025
 10:14:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <808cc6516f47d5f5e811d2c237983767952f3743.1738686764.git.maciej.wieczor-retman@intel.com>
 <CA+fCnZd3sP1_x2c5FvztA6LzsBY3Fq3cD5cJ6FQ+FAnmawe06Q@mail.gmail.com> <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
In-Reply-To: <zwug3yr7p7x7276g5tpwsvuxefkxn2pwggozgq7krdaquqktc5@eefn3vi3tynu>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Thu, 6 Feb 2025 19:14:33 +0100
X-Gm-Features: AWEUYZmr-sZ7H7rQ5pJvdgslU5r_pD-83ZAYiTMD0XxDDSXEdCYqWWqGvarMkGQ
Message-ID: <CA+fCnZfsT3jO96rewM3wZw7n4hHJ44wRDG8g_55NFS5VG34grg@mail.gmail.com>
Subject: Re: [PATCH 01/15] kasan: Allocation enhancement for dense tag-based mode
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: luto@kernel.org, xin@zytor.com, kirill.shutemov@linux.intel.com, 
	palmer@dabbelt.com, tj@kernel.org, brgerst@gmail.com, ardb@kernel.org, 
	dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
	akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, dvyukov@google.com, 
	richard.weiyang@gmail.com, ytcoode@gmail.com, tglx@linutronix.de, 
	hpa@zytor.com, seanjc@google.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, justinstitt@google.com, jason.andryuk@amd.com, 
	glider@google.com, ubizjak@gmail.com, jannh@google.com, bhe@redhat.com, 
	vincenzo.frascino@arm.com, rafael.j.wysocki@intel.com, 
	ndesaulniers@google.com, mingo@redhat.com, catalin.marinas@arm.com, 
	junichi.nomura@nec.com, nathan@kernel.org, ryabinin.a.a@gmail.com, 
	dennis@kernel.org, bp@alien8.de, kevinloughlin@google.com, morbo@google.com, 
	dan.j.williams@intel.com, julian.stecklina@cyberus-technology.de, 
	peterz@infradead.org, cl@linux.com, kees@kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:58=E2=80=AFPM Maciej Wieczor-Retman
<maciej.wieczor-retman@intel.com> wrote:
>
> >Is there a reason these definitions are added to
> >include/linux/kasan.h? At least within this patch, they are only used
> >within mm/kasan, so let's keep them in mm/kasan/kasan.h.
>
> Parts of x86 arch use these later (minimal slab alignment, kasan shadow s=
tart
> address) so I thought it was convenient to already have it in place here?

AFAICT, KASAN_SHADOW_START only relies on KASAN_SHADOW_SCALE_SHIFT,
which is defined arch/x86/include/asm/kasan.h anyway.

And ARCH_SLAB_MINALIGN is defined in asm headers, so the definitions
from include/linux/kasan.h shouldn't be visible to it?

I think that we need to do is to define KASAN_GRANULE_SHIFT next to
KASAN_SHADOW_SCALE_SHIFT for x86 and then use it in mm/kasan/kasan.h
to define KASAN_GRANULE_SIZE for SW_TAGS. (Similarly as with arm64,
where ARCH_SLAB_MINALIGN depends on either KASAN_SHADOW_SCALE_SHIFT or
MTE_GRANULE_SIZE, both of which are defined in arm64 asm headers.)

Btw, I think ARCH_SLAB_MINALIGN needs to be defined in
include/asm/cache.h: at least all other architectures have it there.

> Since I'll be reordering patches I can just move these changes together.

Otherwise, if you need to expose something new in
include/linux/kasan.h, please do it together with the change that uses
it. Or you can even put it into a separate patch with an explanation
of why it's required - at least from the review perspective having
separate smaller patches is often better.

In general, if something doesn't need to get exposed to the rest of
the kernel, keep it in mm/kasan/kasan.h.

> >I think this should also depend on KASAN_OUTLINE: Clang/GCC aren't
> >aware of the dense mode.
>
> I wasn't sure I fully understood how inline/outline interacts with clang/=
gcc on
> x86 (especially that I think some parts are still missing in x86 clang fo=
r
> tag-based KASAN). So I understand that compiling with inline doesn't do
> anything? If so, is it not doing anything because of missing compiler cod=
e or
> something in the kernel?

With inline instrumentation, the compiler directly embeds the
instructions to calculate the shadow address and check the shadow
value. Since the compiler assumes that one shadow byte corresponds to
16 bytes of memory and not 32, the generated instructions won't be
compatible with the dense mode. With outline instrumentation, the
compiler just adds function calls and thus all the shadow calculations
are performed by the C code.

Or did the dense mode work for you with KASAN_INLINE enabled? I would
expect this not to work. Or maybe the inline instrumentation somehow
got auto-disabled...

> >Would it be possible to move this part to kasan_poison_last_granule()?
> >That functions seems to be serving a similar purpose but for the
> >Generic mode.
> >
> >It might also be cleaner to add a kasan_poison_first_granule() that
> >contains the if (addr64 % KASAN_SHADOW_SCALE_SIZE) check.
> ...
> sure, I'll try to move these checks to kasan_poison_first/last_granule.

For kasan_poison_last_granule(), I think the change makes sense. For
kasan_poison_first_granule(), please check whether it gives any
readability benefit - if kasan_poison() is the only caller, maybe
adding another function is not worth it.
