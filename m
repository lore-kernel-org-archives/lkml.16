Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BB31494CF
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354562; cv=none; b=XyvHIIIvnFigmTOkFEQ+DXQgvVnjoEMgYdSS7HpknlOSISPe10ETNqvec100gSzLeQ5xBIW8Lp0MBvYwzaVjAi6rQVmMKD0JzMvofy9IRevbwYasg0v72UxWa4+m+lAtFDNkuvfombCNJGQe4i4aWlPf6G7sLAbq2lZqGn9vCrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354562; c=relaxed/simple;
	bh=uyfEtlalm7/2N01yVWSHdBZ3Ltv3eZdpHMgUF3R+Au8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILGgQSEo1Nwh+whTMfrHOV5Up6AHOuq2vetIE52lmApp5Dj/MJ9PXIV5bX/GU0O6tbL1zGT4Uc+SgasrXrNBkbLbV1p/ByRNNTXwSlY97gE4kdHcoaTaqWDdBA2Sz+vwR7WUNC+fZYYELgo581vcKVm7wj6PCCbXXytD2SNRlVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=ZUyaBb5o; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="ZUyaBb5o"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so397859666b.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738354558; x=1738959358; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+PfSgXSELrUaoTDkqCzKwOcJSGmSEs6lHYZmUXLsucE=;
        b=ZUyaBb5obN+CAyN/xjV2tFQ1ZRHXsUAgOXpO+L4mg9Srd5g0Np6l2ARNvHihj1vbfp
         83uHrJd1XNQktuJIorGPYEHCUFFNvrU3v0sUbY3qUNw6UuZC4ZnyuN5CEI3dWxLcGkBg
         K4SRHfjnV6BXUJ85BZZTzefnjC0wl/Ab8HC6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354558; x=1738959358;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PfSgXSELrUaoTDkqCzKwOcJSGmSEs6lHYZmUXLsucE=;
        b=dP7w7ChY8QDAnYjNPH32Z2yY6NeMnBqrKF6p87KhagAqIdyfp5qdVsrrVKsZuNzHq6
         RCL9WIb4s1p5cMJ2i5SC5jA+SbjxMKLEgv8mqJtn4s2cbE7altKGOts0F3VU0yJyOfu6
         V7PaYue3m7UFERszadZ/secM1AuZES4zLr59z2uxvFmGfDv+m5qoMS27qZ+fmLRICi6M
         uvrNtFr3V5L1iUjIDsePcqFL9HEAUbsl/iua37lDDBsEjGNGWeMQVKrTaXymPw//seIX
         smisQxOoh25/IG5E1oCNGfcosNVr0Pltpaq/xYG7OZnwfaTVCoLha5vyWKIevEsrLDxn
         cEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRVWh9iU6Wc7HsV+Ej6p5H3KbXOw/PANGkiyxfcauN+uwSDi00oMjmLLsKjS7M8O8lzFx04pS3FhfJMrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC+nAJ7jfugMjtNT6gj1mDyj6J8+lxmxGXXTq9ro896ybrel5w
	47doDrg8KcqUxPEVTZyrXcBwfp8DfJtrDpZnYDzKiN6Bj6Q1u7FVK0QftGvcOCFWc6JtynAuJgJ
	a4uQ=
X-Gm-Gg: ASbGncuKJop9rbRn+H7vh5TcFSAhFK3QvR908dCZcMzvlwArJo9P9294wKAS5f/Bj1A
	/5t6dxCa58sER9lObjjC7/iIPnADIc+XveBwx2yM4k99+NmcQDS8yQuOREH90gawPe4iLVBui0c
	usaEZwEqwzH5L17UaZP3hMt4xJ8AEz+uvxD2/49XHX+Qnn1+XZuhDCXPk0tRMxhDng5N/ZVogX9
	Jhpjffxz2O64+MoTiKPkeH79u8ylHO+THxef74NAoTTkYQzCDYegRG7wdgfSX+cgX1swqjv6vVE
	pKnRoLowBxf+ZN3p2cnrX39WkesfvssWvc4L7fU5Lh9lPCSK1aHtKvtdzugy53g4mw==
X-Google-Smtp-Source: AGHT+IHRVV1jZhy43pihZcnluQMwTXZAQuqUOAQcdnoeg2xekLqBiUHKstRraEXiEylEnz/s+omV3A==
X-Received: by 2002:a17:906:6a02:b0:ab3:875f:a246 with SMTP id a640c23a62f3a-ab6cfcb3a99mr1464027966b.7.1738354557832;
        Fri, 31 Jan 2025 12:15:57 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e49ffd42sm349178666b.95.2025.01.31.12.15.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 12:15:57 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5d90a5581fcso4152511a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:15:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVN8hw+ASsDeAY0Xdt0G/VGEPNOXUJsVYD4tBpR0Z5/Uv7+TVdrmizKbRFbs7UQ5utkKHjlAis/GL39CjU=@vger.kernel.org
X-Received: by 2002:a05:6402:2747:b0:5d9:f9b8:e7e5 with SMTP id
 4fb4d7f45d1cf-5dc5efc6f82mr13561155a12.15.1738354556788; Fri, 31 Jan 2025
 12:15:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
In-Reply-To: <CAK7LNAQeyWYm2OZ6p=vWJegs_VZMz5RN+0fze6GG=f-ZGWQ3nA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 12:15:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
X-Gm-Features: AWEUYZlbFPcnU2fZBjulclvXOpxQ-WgVIzYy8hdJtliGciimcsvogBzeWwY4yos
Message-ID: <CAHk-=whzh=4XxP5mQEh9G+xYOjBLxpyV16Hk9NWMp5PszrKRWQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v6.14-rc1
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 11:45, Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
> tags/kbuild-v6.14

Hmm. I was expecting the CONFIG_TRIM_UNUSED_KSYMS fix to come in from
you too. IOW, this:

  https://lore.kernel.org/all/20241214105726.92557-1-masahiroy@kernel.org/

which fixes the "load_utf8() ->symbol_request() -> symbol_get()
returns NULL" case when CONFIG_TRIM_UNUSED_KSYMS is enabled.

Obviously I can apply that patch directly, but the reason I _didn't_
do so was that I was just expecting it to come through the normal
Kbuild tree... Pls advice,

                Linus
