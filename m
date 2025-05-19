Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527191DF98D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643273; cv=none; b=rs7t/OCeSUW7YE5Zi1Vz6Qn7Sb3/1pK54pFMbVF0uR7QD4smN8lhq4rNPj34kObegnBcQHlI/D+MHvsn3avyx18UzPaAZq1axmn7EwhOHQiZLJFI1KZqDie7bFdyZyfwFL1boEm3a+ECeokYJ0UwoEEP++OQfuthzVwvgvXGWtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643273; c=relaxed/simple;
	bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgYGF2HW7whUtg+T4nrE1sqAClm3///CYMqeAB+oQzf4O72YxREKLnzM/xl+v/Cl+dps6udyqJOEUhBapyjgOADNdao2JznP1WMKNG3eD2FnRpdIOiksNZK7ydrQ9cs9z70ZKwcdSYBUBnWZjtcqkM//Y2XSr691JVaBo6tga30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LBIzuo8R; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LBIzuo8R"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32805275d68so20296621fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747643269; x=1748248069; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
        b=LBIzuo8RsO2DqFL+UrwEWqlL0KSV6+tC5Jx77sEjCuKUXEiJsQ8YXGJLMCnvyLO2Xd
         +2NjnPimOt1a74VS37x0kpF5M6gzWsTufmY/5DTJbfji4d1aiBfwYKKhOZA9rS06PoQJ
         wl95GBt58g61F71lPmfXLgpdiJSAaHGif7Q2AN3F8ryanqZGA6FXgewFD2TZDGMES9Tn
         2v+SzCi8bojs8IDq1djyCiEEHMckE9RJB1ySOc6ahjVzZs03o1G5Gwz6a66OjfgsCNf3
         dQA/Sjwtin8exCgDXMus7n/WHAnO3csvYtWwD3Nt5Xiord52Q+yjdCqRBWths4f5Xc5q
         QI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643269; x=1748248069;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z3GOOWslze767ZXUnyiXmcPnSLnDPCM4xD6CmiyIW54=;
        b=fWuF4PtJgVj1kk8y95JcwebiRHiW0tihU55bwfVpfYnstC5c7A6rLz6TgpRtx86C4t
         TcmkFAS/JM3mxhxW9jNLuJsAELzJ/KBcqQvYQJBmIzOO3faUfuZvY2WAG3E/DYG2Hf4r
         lspqNNh2E/vHluZzRO8V1oHbxZePNuIf/N3itbA6PrzOQHZo5QJugjChZ6muSLKBRapz
         z4bRWol3JPwEvG7HNlbizpxFTCsdgL4tYskTPvI5uSTXgtauGz4y67HscmJOoevlLr5E
         nzgNwJ/b0qjvxltPV+vrLUZ8NtSTz61KwGgXJI/lB0zkU6Qq72secGaaECuI6Q3xjZ8w
         kvkw==
X-Forwarded-Encrypted: i=1; AJvYcCUXDlBYR0Fi0Qh20EFtNXRHybGQPJ1XqaV9GKz2ZRWsre0h1UK2CUDk0CX21+iSMtWKwzzNu/BZKS80vHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJE0HAp4Y/o0sZLUEi4eznT0/ZIXG/3tqDbS4oxBd/Ty8lCj3L
	CBzGxBUfiVDqboo9jNSntk3fWNYr6pHZhzx4jZD3bc40c2eKwZVrRwZOfrtB/FqQ3Tq2OmUjPbh
	54yViy1rpvL2YfB0JkF93GqCylCYsE5UI6k+gII+pzg==
X-Gm-Gg: ASbGnculcF8/wmhNMP/mzleBFFNOfNF/yQ7F0AvjeVddfEjXnWMkrp1Y2P1rsh3rjho
	VZpC3bKqway3L5deUNkPPSw5HAiT6tAx/uGao97VCiVDhdKPnBt+Q8x8SCg/IWTxg6vH0Y1BAzd
	77UdRB+KpfEVvHFm2jpJeJreJg1M00Ee2uH5urWHZqWrVQVJC+gQtoHn1Xv5vuKRQupFEkfpAlx
	A==
X-Google-Smtp-Source: AGHT+IHkWo3T4fmnBPXjA9hhOFnYmSmUwbX5sPEWAwMYvh43Bud56lnIHt6z8iNgiDx10hwY4T/0DDuc6HSnlwQftFM=
X-Received: by 2002:a05:651c:41d4:b0:30b:b956:53bd with SMTP id
 38308e7fff4ca-328076ef3cemr30688951fa.4.1747643269217; Mon, 19 May 2025
 01:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250519041850.13095-1-chalianis1@gmail.com>
In-Reply-To: <20250519041850.13095-1-chalianis1@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 10:27:38 +0200
X-Gm-Features: AX0GCFunzpV0XliXViisGLif-SfxEjisRlfKg_vdkE0KlhLaS0oVW17eNx19MOA
Message-ID: <CAMRc=MexsDgNRkHtP65t9qe=mR0COMCb+6A5XRqnU3Q7FQOPZg@mail.gmail.com>
Subject: Re: [PATCH] gpiochip: expose gpiochip set data to be able to use it
 with a an usb gpio expander for example.
To: chalianis1@gmail.com
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 6:18=E2=80=AFAM <chalianis1@gmail.com> wrote:
>
> From: Anis Chali <chalianis1@gmail.com>
>
> Signed-off-by: Anis Chali <chalianis1@gmail.com>
> ---

I will definitely need a more elaborate explanation of what you're
trying to do and why. We don't export symbols that have no users in
the kernel so I would at least expect a second patch adding it.

Bart
