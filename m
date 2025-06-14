Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D63815853B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749921532; cv=none; b=CsnVW7eVJwhLWJzhGCivDG9kWMEs+9o31s+sfc6hdwrW59dlDp6GWDA4SDEjtIdy5Iw4Y7M6Z+uE0GNJ3g4oaIhFQqGepX6W1yOE8NfkrBe9rqZJBuIkEwYeAv+oEU7mMXsM4QHncSWvPKJQ/XurCgMnGb7Y9jNEaB7G/WNRbNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749921532; c=relaxed/simple;
	bh=MgXrU5xm51U7Ppw0MWnlwn0lJVHz+qdiz6snWUeylxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fr9crau0Oo2OVuDa9V4rGQlatqrVH5soZpaks0MocZblZXnR4AFWiqCklX1aJ8F+Vf5JphVB81u9fDXV7xaEI13L6CIZ28DDD2pqPR34qJ5jjU+CEc11SPNDNvH+P9u+2FMEkFURWanrrOCOLopERalrfAXFYHu0DP4UH6Nw+bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=U23/ErKX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="U23/ErKX"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso471096866b.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749921528; x=1750526328; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PAJ4VP570mgPuvMDN0jXTjFYhyjECowU+9L45Sn0oyM=;
        b=U23/ErKXpkWxFh06Iq/YGHvKEy0PALsgV/+Yfu+QQL7R3y68p21aKNHd5hCAd/nlW2
         UP578Nk7ga6zH7NWurCnhApTGOHNSI9VDUbtv35ZyjXpKpMILN3HaAXZiBdpsAVpyO0V
         y7G72F5VXGAWuPWlbGjqD/5enQoZa2S03TWi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749921528; x=1750526328;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PAJ4VP570mgPuvMDN0jXTjFYhyjECowU+9L45Sn0oyM=;
        b=LaWq7pP1Hk1f0fSh+xiUAULJW6DjlZJITYr1wlj54hEVxH8m0sl2SxvBJTIWy55Bmk
         9L+c0Smn+EnJTy0zoEKzaRWkwqOxOng5DQVip0C6dVsydZaqKmATRKI44V18uoH2gH5r
         XlKm69jA47gGX1Q8TAUNMocSvUgdgByYPZQtqJrKx4b9iyQSp36acTBgmFKK4675gJSH
         FQxmiw0rtnwaZ1Qtjv8pRIM5CXhgrXwkN2bblIrvh/sogc8W++wh2mVjbbBBpsPVFy08
         JGlSe0tIiuQRZYN72FtVY7j9/BdYQvC0yywqK1ro9pTV10/mj9wXYL6ccAEHWEbtlHgP
         TlmQ==
X-Gm-Message-State: AOJu0YwNIvddf/YrE7ty7+mNLtk3MjgeKAi8WMImUxalQNBaQn9eG8mb
	tLQoTQgGBUJrgGOxmH8FH5YX3q9bvPIuafjZuvBtUaro2DKdy6lN3dcxid85cSUt01zuj394r/m
	xFusfdyY=
X-Gm-Gg: ASbGncvT4vQ1JeXXJ/z093woDD3slAUGDjqSB6OX7U/x8UueRkx2OSsbCPrikV32AEl
	BTSz4gBviMokjmL0y0oThV+qj3IpAe0TSK10OrM0iJmLe4wTvUZBbNQKgTm9lOyIQLnPTRphmkW
	ztSH6KR9n9Q/DNtaJiJoq81Q6oOiriu4KsqAG9GrQ0yQsfxBnBFeNCr3oN5Eu2uBtIHKSbB7IcH
	dkmWB6EJ101UHWjj2RtixGqt12BlnnZ/ZAaA7fSdNWu9nETzEKUiFT0i9S775/dzM+70AFJ+Z+z
	MFOgl15n27iesZqUJnqAxyo4uJYvtozPd1TTW6ChTXrOPwD3Yo7o2estZ8bmwVtbP02NL0/cs8x
	PzqbNZl65jO+eu8OeZEf+FdIL4wNSBA1aq/b2
X-Google-Smtp-Source: AGHT+IH225ACL3p5MyI+NYOthhiTDqlYxHco3qA9m0MoYWaKg9I8TmkL+N3qOl040Z78NVmwecnWOA==
X-Received: by 2002:a17:907:7e92:b0:ad8:97d8:a52e with SMTP id a640c23a62f3a-adfad4f40f1mr326811566b.55.1749921528378;
        Sat, 14 Jun 2025 10:18:48 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892ab29sm331200366b.114.2025.06.14.10.18.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 10:18:45 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ade326e366dso559695366b.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:18:45 -0700 (PDT)
X-Received: by 2002:a17:906:9f88:b0:ad8:96d2:f3e with SMTP id
 a640c23a62f3a-adfad326d9cmr282110066b.22.1749921525142; Sat, 14 Jun 2025
 10:18:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515132719.31868-1-mingo@kernel.org> <20250515132719.31868-10-mingo@kernel.org>
In-Reply-To: <20250515132719.31868-10-mingo@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 14 Jun 2025 10:18:28 -0700
X-Gmail-Original-Message-ID: <CAHk-=winzTt3SCzv8BWGMm0fzrXS0gb59gK0h4dAe0L6hj3X_w@mail.gmail.com>
X-Gm-Features: AX0GCFvLeoqujhii4Ghj58PyM2_2xgYsSIaR_l1hGq5najRN3yK5ufy78Pt-Teg
Message-ID: <CAHk-=winzTt3SCzv8BWGMm0fzrXS0gb59gK0h4dAe0L6hj3X_w@mail.gmail.com>
Subject: Re: [PATCH 09/13] x86/kconfig/64: Enable popular MM options in the defconfig
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	=?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw@amazon.co.uk>, 
	Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, 
	Rik van Riel <riel@surriel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 May 2025 at 06:28, Ingo Molnar <mingo@kernel.org> wrote:
>
> Since the x86 defconfig aims to be a distro kernel work-alike with
> fewer drivers and a shorter build time, enable the following
> MM options that are typically enabled on major Linux distributions:

Ingo, PLEASE STOP.

This whole "enable random crap that distros enable" is completely pointless.

If you want a distro config, then USE the distro config, for chrissake!

The defconfig should be some sane configuration for NORMAL :PEOPLE.

Not for cloud providers - get rid of the stipid cloud virt stuff.

Not for distros - get rid of the silly "distros enable this".

For NORMAL people. People who don't know what they should do without a
default config. People who just have a random machine that they want
to run Linux on and need an initial config for.

This whole "enable random things just because a distro has bad taste
and enables them" is BROKEN.

            Linus
