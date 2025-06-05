Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D582F221FC9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129591; cv=none; b=rdO577XsgAWMRv58i05UJaLK+8IOOxa7KqBINJLtTPfVSAxb1Sdxmx2SUanueGfaAUFgAaoomh7h2EmKGt0PaiP1tmFBv6mpCCj/iiLG94qbFWJzhNGFSmuY8Gc9wkop4b5OW5ycVy9ZwSafCXQjAPDs7Xu3rn+2qRxLnDV4Szs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129591; c=relaxed/simple;
	bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ut11OcvBzzR8kTI/CsK8LlR8Quwwf3p3eSU0SRh9zJ1JSNgM2RqdLoyCZe4h37M8Hk/1DiuoYhUPYLyoT3StanYAjjJldmbjTO3JSbx172M2+mmWlevz8C8OqiG+T4qaTgtltAU3utoWIdAnyBIWczukxnm9Aldj/SejG91v298=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GIw4aSdu; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GIw4aSdu"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so1028416e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129588; x=1749734388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=GIw4aSduJaHRZqHhbhmNcIhOuzisxSXLzMTlkl6S7WAJVWCCuSNGNr9gZNLvaoCVss
         OXV9R5LqviINNmIXXP61p5qU2CoMjRZwHQj4MqqoZG2XenzkMb8AaECym/XCYtBueNpu
         loPECGK7Xeqfz+zzaRRvbS7HIKc69uwG6xMa1r8EbOW2uIpdLSk/kO6pnn6m5Aaq+7p3
         dRTtxrHVn01scW0VYgnqPYoxRz77DyWQDwaiYZ/eYpL5LqVCq9/oMKfxInfb73abWJq2
         eLl6t7NLk2gbsebTtgbZ7MEc22+EyzhpLtDbfdVTEisovqPxQRvXyKcqzSRF9MKzk60c
         5bIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129588; x=1749734388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TkWDs4JGWp0j+4kyNI1AACr8Xjcxd0tpmZ5qU16RpBs=;
        b=XU0H+Q4byW2WNAD3rgIPW8o+VAFunL1eNKd6PROHXu0amDfHY12UeqybGQ/1YT2DX0
         YK1vl7PSRwy/Y4bFgYRYTf4Xm38FQQMnhvqVdwEfwhDZ1MOlahOezJfl0ACn9K87Cftf
         7m4kWpeCtxbu5fOuUw5YtCfs82BM6FXp7RU6Tdwvwvo7sJbWDQuTwiabgzPr8KaT3FPr
         ntQhxzhUfcnB7ojMF6QuKG0b8mT7T1ENDIbpQ1bmhMbgh6R/GBzbOH0aOn/L71QzNzs6
         WCWv34O2QPIK5T+6yKd8FnNG6TlGL1yB2d5C4vmPEN7Fkfrnxt5cYqfyTqTV4Zd7fMjm
         gkqg==
X-Forwarded-Encrypted: i=1; AJvYcCUrL5BXv+2bWRNUCwZaDbBBUMtTTgh0uCNEQ/s530TysG9vg4eA4xjtZvp8CF0NTa5xAfnR1fABQ7IqxdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnpLIfWcKiG9Kloy+8Bp/1/KuVx5+1/k6riKtNOH3xX5Ln3N/k
	VgKneYpSR0NhJOT3dxPYCXLoPpVgd9uhF7iF5VtHjW2oOSbAZb3sUoe246fnOzZ6UC17p5fmVTq
	V3qchXEc7chQkXPCQK3LbY5qkMe74porMcplPv8wCAQ==
X-Gm-Gg: ASbGncvTpYZinAXkc8HL/kn6CocGAujpHCD3rA7x7wO0JzQ/Fc3xzO+hWWR/MyHxePb
	zEh+/pv43GkLJD9qkPKN0LdCmcC1V0gALhFN37uu9a5m8uzRiT61KTk2Cjf+fpV7aI5elr/Xvuy
	MWLcVHeDx+PXekqdQFTO4AHekG3aC2K5h3
X-Google-Smtp-Source: AGHT+IHwUg8EOutUqp3GD21CE8boOlewudk+gIWQR9a77PpxijELTwnpqH+LGR5idjK89e9n3Wb11FOM+mCZanmNr04=
X-Received: by 2002:a05:6512:224c:b0:553:29a6:3398 with SMTP id
 2adb3069b0e04-55357bd6ee1mr1908588e87.55.1749129587841; Thu, 05 Jun 2025
 06:19:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-tegra186-pinctrl-v1-0-722c7c42394e@gmail.com>
 <CALHNRZ8ndcd3mvGP+W2DVFcm65t4Ai4epNeGigPv=Oo8Cf3LkQ@mail.gmail.com> <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
In-Reply-To: <CALHNRZ91nUSUNPjMNF-4ORvVRCaBSKG+0UKzG4T=ehPaHwBTgA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:19:36 +0200
X-Gm-Features: AX0GCFsdxa_RA3yrubFbUtjyotAsDp7hdaFyuBIGBs0nGmLZ3CxnTUhX5K5TYXs
Message-ID: <CACRpkdb6Qaa_0wahFLG4o7-3gBGAzdKDMVb=ohgiN20dKbrNTw@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: tegra: Add Tegra186 pinmux driver
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 7:37=E2=80=AFPM Aaron Kling <webgeek1234@gmail.com>=
 wrote:

> Friendly reminder about this series.

Can you rebase it on v6.16-rc1 as it comes out next monday and resend?

I will apply it if noone replies with review comments quickly because no
way you should have to wait so long for reviews.

Yours,
Linus Walleij
