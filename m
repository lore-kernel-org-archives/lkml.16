Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AB622F386
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615010; cv=none; b=ZVeYrIcWWfxqtrhVEOQhlshaHz0F7v3CXweDL2RjKPjSf8XO2H52ZSJWgyCKFD0boQdhheMRkUohi2iCHxjZam3p0kRN9e0MRCDIrqsPtWKVM4yBKhMl5GY+W6EJoTJgfSbUJjRm/eDGUmnqhhMY5Px4gtN7yVmg1qdvpjxIMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615010; c=relaxed/simple;
	bh=G1DHqL85O4M7V9gqQeeeLVXS9o1JqvnLgjJ0b/R3998=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FVmK8j79Ud/dkBzEfVK0HtIzd7S8/wV+ajUNHaUI9B4LMKxsD3PaO14SsDygCjKzD/62O2u4qUHI58v6Hma1mMwV0A3bbWflxuKam0CUzSzRNohCmWBXwFg5XJ7DERoBCp+F3UaGjUpVaBrAtUJAmhS0UyF6qKg7klixLlDJqh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kh+0GJAZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kh+0GJAZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE92C4CEEF
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748615009;
	bh=G1DHqL85O4M7V9gqQeeeLVXS9o1JqvnLgjJ0b/R3998=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Kh+0GJAZgF9ocuGGvCpcj14yF/KsAoPDFdkcNZTBX11vSxNlxEVpWvxlhIY/pNRww
	 KKLMXmTOaOG4JfN/kjaQydvmwzMSgbw5O3na6AwKMq7kqap9t0YaWI+dtdC2gIER4J
	 ufOLi4JGLxgnZbAyWisY8tMNSNk5QQ8m7TjMxNHGDTfZuzeofdl2kDIf8D5P5/caVL
	 XekITB6/ZmkITNSae0qeCdR7iz19oUGV1oJsIc5o7y79nTz4MbgjDW61ApyW0xx3nH
	 eQXkqs8HWsCfTTzXEua71lmzYCbznr9wfAa6+nK5VEboNJX0+MoCgBlOMqyY4MjXSD
	 nphD72Vpp7TPw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553280c345cso2797775e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:23:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUOf/WLzcgtnsMtYo/MIkmuJ2SEnMOvbznjMBFdQIsKfFwAKXnNirCc9sIWeVNCej0lIjfncz9mHtNX46U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPlaFzkp8EtDlAEaIN7Y1Ajq3CaRC7l4rswfo/MM73s++hK1+
	gjG+E3dqjR5OuwtLmc/VM5RFF+GuwrmtTby8mxIstykXkfuoxleNzMUjbWreAH9xx/eeaX7Eeck
	61E4zySWsa5xMlP56HxFCrH3sNQjpDxg=
X-Google-Smtp-Source: AGHT+IGt/ob5oIdyFBNz3BNQJMytXMyiUKhYop+0LOnh+OuVTmEFUuUGiES8anXXR0vfHxL+cc3/rDK2U4LsEG3cMBU=
X-Received: by 2002:a05:6512:1150:b0:553:2a2f:22eb with SMTP id
 2adb3069b0e04-5533d1ab3d4mr864981e87.36.1748615007973; Fri, 30 May 2025
 07:23:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529073507.2984959-2-ardb+git@google.com> <20250530133811.GB30622@willie-the-truck>
In-Reply-To: <20250530133811.GB30622@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 30 May 2025 16:23:16 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
X-Gm-Features: AX0GCFv9Ullf4B8cpH7c41fIue3JQUkh9LV84qL1g7sdVxmnSnjW5Ar7V20Dwwk
Message-ID: <CAMj1kXHypqdC9O+8WH7n1=aDOySMScZc2y526S3gc_-QNpqO=w@mail.gmail.com>
Subject: Re: [PATCH] arm64: Disable LLD linker ASSERT()s for the time being
To: Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org, 
	llvm@lists.linux.dev, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, 
	nathan@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 May 2025 at 15:38, Will Deacon <will@kernel.org> wrote:
>
> On Thu, May 29, 2025 at 09:35:08AM +0200, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > It turns out that the way LLD handles ASSERT()s in the linker script can
> > result in spurious failures, so disable them for the newly introduced
> > BSS symbol export checks.
> >
> > Link: https://github.com/ClangBuiltLinux/linux/issues/2094
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  arch/arm64/kernel/image-vars.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/kernel/image-vars.h b/arch/arm64/kernel/image-vars.h
> > index c5266430284b..86f088a16147 100644
> > --- a/arch/arm64/kernel/image-vars.h
> > +++ b/arch/arm64/kernel/image-vars.h
> > @@ -10,6 +10,10 @@
> >  #error This file should only be included in vmlinux.lds.S
> >  #endif
> >
> > +#if defined(CONFIG_LD_IS_LLD) && CONFIG_LLD_VERSION < 210000
> > +#define ASSERT(...)
> > +#endif
> > +
> >  #define PI_EXPORT_SYM(sym)           \
> >       __PI_EXPORT_SYM(sym, __pi_ ## sym, Cannot export BSS symbol sym to startup code)
> >  #define __PI_EXPORT_SYM(sym, pisym, msg)\
> > @@ -142,4 +146,6 @@ KVM_NVHE_ALIAS(kvm_protected_mode_initialized);
> >  _kernel_codesize = ABSOLUTE(__inittext_end - _text);
> >  #endif
> >
> > +#undef ASSERT
>
> What about the ASSERT()s at the end of vmlinux.lds.S? Are they not
> affected by the bug, for some reason?
>
> Also, even with this patch applied, I still see a link failure:
>
>   | ld.lld: error: assignment to symbol __init_end does not converge
>
> with the .config you sent me off-list.
>

That is a different error that has been lurking for a while now; Arnd
occasionally hits it but I haven't seen any other reports of it. AIUI,
the issue is that INIT_IDMAP_DIR_PAGES and INIT_DIR_SIZE are defined
in terms of (_end - KIMAGE_VADDR), resulting in a circular dependency.

The config in the kernel test robot's report [0] appears to build fine
with this patch applied.


[0] https://lore.kernel.org/all/202505261019.OUlitN6m-lkp@intel.com/T/#u
