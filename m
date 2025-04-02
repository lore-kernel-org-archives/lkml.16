Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD292AE77
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584108; cv=none; b=PUUm6VJwayJXjsVq+6vKEaoo1rlnkBAuQBMJB+Ia+04Q59x7yKo9HamqtHctwZVgof38e11iRMZIj0c3I/Krt0xqMmiSYscxrgqXbvsh/OP8Rvv19lI3GXpa1xKrphxMewwb6HOFU3rNK/QqCuv+jkahdqxKgJWIdp+37sG6eZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584108; c=relaxed/simple;
	bh=ncAJeBOeuZgyrT06rISriwnLImcatJr0GbyJS11FwwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OLnPWyYueXGAtqfSyqXBJqGsTKU0x8egsgAWyTxlIrfIkjMKwo13++6OJzFggz6lMvWMwn+abXI5AHPWqlIGZKyJZ5+Zn+c3wmXqpeiL3Q0mZuXXkWQsQaCWkOqC5Fb7NweFChzFfyBqreqZXAd6ZvtOOGcuHSuZ3uZlCWshI8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dtwa5xHc; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dtwa5xHc"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-86ba07fe7a4so5600794241.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743584104; x=1744188904; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkfXltEk1Iw8yonvOKbajZ01xoVadwQJF27RtKU8KBs=;
        b=dtwa5xHcCl5/of6OYlbSenoQsgMPG0Xw2TF2XIFFb0fZ6DStPJzmKhkYiX763Hy8TE
         5JzRkAjTxkgUPyOjUq5z2uOf2LpN/RZEjzyT9yJnW1aygZgXdmchLOhR1xSqDPGGrxeQ
         5mYzOzpGSEUfqcZzrXPsioMT3z2fpGXWNfYVJxcAwP9pf1ov/0G9n5AQdzdJLlC99Qd7
         LpHEEy16mf3b/JI1g2HakpyVMRjGrzCJqissta+WfoKNzU/+gJX8kqCXqiuoJsBavnqG
         5sFW22R2U04iUVQOqrdZB4DFOPYaFlY53gdCuq+nMmqCg2y33xXc041cQfKFn409k7XT
         0K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584104; x=1744188904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkfXltEk1Iw8yonvOKbajZ01xoVadwQJF27RtKU8KBs=;
        b=uC2XOK/jEeoJAT/EcSm/AOtNzYLUa4LsNWzXJY5LqhsUUDCH48opAWfQQ2SPDCah62
         J2VfWuv6rV9Ad/GMmyZelzWgu0WIiiwZNRTHNFMekc7cHRbNsHL95XtHDVk7IiOdFzRa
         axC8/kQ21V8jbnwK706j8IzAWvbZmuoPg7L7iTEzsGRtTHO1is2rE79Mxc3aqp97xe43
         N+OENorHURIao1sgIcvDzs+n2MBijtW4MmpTARjrLL4fWA2UUDwUBtoFEIkKrEYOH8Zv
         xeqWcyt02kCKJxth2W3WmDQTvcon6flGU7Gf1Ggjh4PTleTZI1eyoEAR5+TXN3nGz/NP
         z4iQ==
X-Gm-Message-State: AOJu0Yyh+uW7JLWEpeDydmLMa5+B/EwZkWy6bHpaO3ELY4xL/C/lAabi
	yv1f39cXVizMC5NUPTn9QKg+Jk8217sRn7Nund/t7ZsEAC2TPwJV9g8TUEgmyGAnYBmISjufSbo
	U3wBhLeKrzr8uusS/LyjUWQT5UBqQao0uvAUXut+ysvBu2MYCJIg=
X-Gm-Gg: ASbGncuoveOsxP2ZCfu4SIwM7D3+It6d8y4JGy+sD/WmamYdpVcqDaKJb9tNctS9HrU
	TnTLg9TlCwtXXQAAs5P5aVrh1MKw0x8iF1iB0zUQFFxnSDI+U2JyRu0wy56UYUoVwIq+SHCuBr+
	vR71rN5Y6cTcanI/YOEBuOv59H5UoJh1/zFeqgU6Ot5G5O2WNkPgkUV+bJRLg=
X-Google-Smtp-Source: AGHT+IEievB+pp1aNxi9woKq2lfHUjZwC1Q1KFIgh0dT/EWXbvXwXWvmBfX/gMYpQN/riDxOkHL1mr2rJfv84pPBaGk=
X-Received: by 2002:a05:6102:c47:b0:4bb:eb4a:f9f0 with SMTP id
 ada2fe7eead31-4c6d3a16ccbmr11902354137.24.1743584104537; Wed, 02 Apr 2025
 01:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
In-Reply-To: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 14:24:53 +0530
X-Gm-Features: AQ5f1Jrtv4W-Ik8Dy7MY8QPUm434a5sVsFhaoy_XcVSO_jLH2XT5qCr7_O_JHjg
Message-ID: <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com>
Subject: Re: qemu-i386 boot failed on mainline master - no console output
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Vinod Koul <vkoul@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

+ Linus
+ Greg KH

On Wed, 2 Apr 2025 at 14:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on qemu-i386 devices boot tests failed with defconfig on
> the mainline master no console output.
>

The qemu-i386 boot failed with no console output and is still happening on
the latest mainline master branch.

> First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
> 'char-misc-6.15-rc1' of...)
>  Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
> 'rust-fixes-6.15-merge'
>  Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'
>
> * qemu-i386
>  - boot
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Test regression: qemu-i386 boot failed on mainline master
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Anders bisected this to,
>   # first bad commit:
>     [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
>     Merge tag 'mm-stable-2025-03-30-16-52' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>
> ## Test log
> <No console output.>
>
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> * Git describe: v6.14-12245-g91e5bfe317d8
>
> ## Test
> * Test log: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2vAGjk1bqJ8kqDGEyo2jXerYOcR/logs?format=txt
> * Build link: https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org
