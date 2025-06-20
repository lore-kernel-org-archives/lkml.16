Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CFB236442
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750424416; cv=none; b=K/r0CNZlIT03W7WJNxlpINLrom80loz0tXdeZtKJoXFTepj5geuewNtGszFkCiEZ48qJ8shsE32pVB9X5wnJ1PsTxL0knSI1hMcWhcPN8i3877J4zk68xwXU3IqJll4YRcvpeoigiiHkp2LZ23CYFgV2CkJxieCz72cXfOMlpQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750424416; c=relaxed/simple;
	bh=jZZ/xkZYhg27rMIBma/CNy6BmfDLsuguSvLbtNJe22A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j26CqLB7yyhjOnu42QY5vTntHeIBxKd82ca0xAOXHtZveF8KZhe6mYs9Tb9vHB8i/BfKHCc0472dCn4GDbRd1DkJS3xzGeOJ1/rXE3L/fkop9xJU3xZ5ruDNrlNOJD9OF2exURcpbapnwszwtuDOAPSIVU3mLlOVPQMSCxP3754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFez/MPD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFez/MPD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-31306794b30so206927a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750424414; x=1751029214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHusbDYNQFht+VhqQI20ig4TKjH1YnzOWhBaeYQa1tQ=;
        b=RFez/MPDkeDE8UOQycQH+X/IA0PuAqyg1iLEvcX2oK4tAXfUHsHt0ori+VvT2AKpy5
         b583qAOmg7dM24CNODcm6bP9oQj7XNgCqrfhtuPFnm6S4eCfO08O8h0XtW5ILYzz05lr
         MlG0KelUDqMxmmwwaM3sXBCWN78307rWjPyrn2iIKswjFrODNAc0o0FVMT8gS9JrLncD
         uwG2ND1SfIxBGI22yQu8/cLt6CWQ86P+afKgXEL+JavDrG9bncknKLFqqmnT74e3wrQB
         srTwzZPn0owPWN8EgZt8DPmsJfAz1QADHHH9MhvaWCkwG2PA+YL8xuBCjj+dBqtErznJ
         w/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424414; x=1751029214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHusbDYNQFht+VhqQI20ig4TKjH1YnzOWhBaeYQa1tQ=;
        b=A8vWlzkwxO8nvX/6yV4epZoORyU9U8p5xlidPiSNeB9ZTgTbe8WFjgy4DveNlxlKwc
         8No3uhURbzUgl1CiqLiu95mcFoNC9bCZtXnw+S2XFIyx/BPufwJ+/PVu3i+4RmkKlutX
         f9ew8745jHK1PHpjm7HxYW+hK+lKchCM5P77QEX4mZ7D3nEpTMe3z3w1RgL8SZvJaNh+
         IOGhuKSfw3CnfLCki/A7j1Vs8hNL73N5O6U0bl2mk7Onj1+2LsVHvB9aBYiiqxjP0bmS
         sPnFm1wMpK24x9rw2NCOhpEasLPYjml6uqv9RKEg1yiE/ywEU5j2AvS34R9iKsmDHnwn
         bnug==
X-Forwarded-Encrypted: i=1; AJvYcCXkMc5XsvTeLROQG2bKB94YyEe2//JOWc5B4VABpyBn9pLpdqW7umqWxHUQUjhCzYTjTypSQqEbnSvTKx0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXJD2QMvn82YnY46DxCm+CO5NRX+6LOra/yhH25C8vfqkY8jQP
	BxqQ8Zc6/ss8ovFyZy4CYlaxGnl2tpmJXavmwY/M0MJq0vJxPXcQNTaJnlMVVjNqDWH3qbc6/US
	pSrJ1e0zz3sSwHxTotG2QF87OQSIdtWU=
X-Gm-Gg: ASbGncsa8B98taAueiy+xPSbodLRYMn367+HRV1kHeNfBeUWTmy5Jo1kZG+IF+D4/pt
	827JXy7dbz6PSDpmzXROk//nxir5RrCUmtLADKeW/2CBhZtqIphcOnM+w1u0uQlE1ripiupPmpj
	Wd5CiorL8ESGJ0rVsI71gqF02DTzgFl7LahNcPV/6TLc0=
X-Google-Smtp-Source: AGHT+IGlT/p4avAw3OActY0SsgmlHfvmC7u//by9/Qs2X0j+n1a4zqlppZzYwFev8DlDQk3HtgZsp2wYIisHxJvsWIg=
X-Received: by 2002:a17:90b:2709:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3159d8dfa33mr1803795a91.5.1750424413975; Fri, 20 Jun 2025
 06:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620111406.3365763-1-arnd@kernel.org>
In-Reply-To: <20250620111406.3365763-1-arnd@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Jun 2025 15:00:01 +0200
X-Gm-Features: AX0GCFvt549YbePHDFUC5E6wMqoJqx4LlXU3Vlyz-GlYaVfKJhvMdL9vUzaIFzA
Message-ID: <CANiq72mYSPA_S6hT4B2U8Sgt2QTJekuVEKqjJDgQxGVmMX64jA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: change __retain macro for gcc-11
To: Arnd Bergmann <arnd@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Tony Ambardar <tony.ambardar@gmail.com>, 
	Daniel Borkmann <daniel@iogearbox.net>, Arnd Bergmann <arnd@arndb.de>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 1:14=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> Building kernels with CONFIG_LD_DEAD_CODE_DATA_ELIMINATION using gcc-11
> causes compiler warnings:
>
> kernel/cgroup/rstat.c:65:1: error: 'retain' attribute ignored [-Werror=3D=
attributes]
>
> It appears that this version reports __has_attribute(__retain__) as true
> but doesn't actually support the feature.

Hmm... I can't reproduce the error in Compiler Explorer:

    https://godbolt.org/z/roMrfjxGM

And locally with a GCC 11.4 I can see the attribute keeping a function
in the final binary when marked as `retain` against `retain` against
`-ffunction-sections -Wl,--gc-sections`.

Is something else going on?

Cheers,
Miguel
