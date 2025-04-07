Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1B4204C11
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744041420; cv=none; b=KsBM4O0IML4XNAyczfgNgEZqv5IPFLWBUNYK9enCUy+36O10vBKWdih9JQo8OhRjI2gntklbs9TjWAvc8w3AqNirVlmFUXSdH7E+829AXGcbqIDEqx51jxV8XmUSJm5YvZnnzsD246Fqklb8yHGrr0/rYGPopqMRXqOfVb5LwLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744041420; c=relaxed/simple;
	bh=y1WkJ8RK4R5I+bfkziFddIwn9rr/OZt308PQdVyLGqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUH6ouk42xjilHHHDu1PnlSaWfnc3TpEWgqJsksYg59U5nwRrdAuTsQIPoY3pssqgfMv8Q7gctqsQVUBYAiV/Jb6MJIcigHJXKSVGnJ76SRxQ5+EHttKfcTnDHeb2QUq16q4nZvjOQsCsemW7ZhnZG0PSGHm4UCCASo1llkJjYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j18y4rDI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j18y4rDI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9C79C4CEEA
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744041419;
	bh=y1WkJ8RK4R5I+bfkziFddIwn9rr/OZt308PQdVyLGqE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=j18y4rDI3LtczPBpRMckYw3GYEL2CmMDusR+9BPHKz9/whWysmi2Hnml9kse+AJxl
	 ojuBS6MtlBc4/eYXrMm2SVpITOx9qvC29Kk1n0XGzpWcMxpWXr1BrtkBhn6wJhcPHE
	 wopOfVpCv/Hccoelw46bDH9DwHM+0aUvxdAIzwmJlhqN2V2mGjZWvMp6iutp0jKqTV
	 B6/VK+GiwhaZ4P9OxpaFrg1EaxJIEDkCO0tor8wcUCEXomlLJ2MPCyeqpBfFAi1asp
	 rlg+w8lg29rBOXFADU58MXK6bD/IgAIGBGCDrr2vHojxfxR5DlMuFF9DC0FkOb34CM
	 ZMdyxQorW6w0g==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5498d2a8b89so5206027e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:56:59 -0700 (PDT)
X-Gm-Message-State: AOJu0YxSHikHlOkD5qKjRC3IqKKU4HymtAk4wrTy2vP51MZ0okNGdoqb
	lLjk6APhCA/ilg17VayRlAgHE6kbulykx9bwhCYQQOKmsTS7nbJOrPGkJkiMNx0oGAXX5iXP0o/
	zLhAYceSqjNHEYjgCUfQTDxFxGmU=
X-Google-Smtp-Source: AGHT+IGPw3FeSYmOtLl1u72XQMszT2qRdbXc8KmHVnxDCIYKuvvnq8stLO4GG/fqNj1/X5CkaOXMIfXQWBcVSU0iFlk=
X-Received: by 2002:a2e:bd17:0:b0:30d:626e:d004 with SMTP id
 38308e7fff4ca-30f0a1318ccmr40111781fa.20.1744041418323; Mon, 07 Apr 2025
 08:56:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
 <CA+G9fYtNcnAEVs70eH2yP5UxRBsfrN2B1nKNcggGQ7FNMAJMmg@mail.gmail.com>
In-Reply-To: <CA+G9fYtNcnAEVs70eH2yP5UxRBsfrN2B1nKNcggGQ7FNMAJMmg@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 7 Apr 2025 18:56:44 +0300
X-Gmail-Original-Message-ID: <CAMj1kXH+z4zAhxMucg5NeaOpfp2p69=sqL78JiwvEsWNjFaJOQ@mail.gmail.com>
X-Gm-Features: ATxdqUHp222YPhP23ektNqMueWbU-f1MSn6nyKwoX3FCBWhckI2Ak6ZRrH9iexQ
Message-ID: <CAMj1kXH+z4zAhxMucg5NeaOpfp2p69=sqL78JiwvEsWNjFaJOQ@mail.gmail.com>
Subject: Re: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log
 but gcc-13 boot pass
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, Ingo Molnar <mingo@kernel.org>, 
	dwmw@amazon.co.uk, "H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 18:17, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> On Mon, 7 Apr 2025 at 17:15, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
> > Linux next-20250407 and no console output.
> >
> > The gcc-13 builds boot pass on qemu-x86_64.
> >
> > First seen on the next-20250407.
> > Bad: next-20250407
> > Good:next-20250404
> >
> > * qemu-x86_64, boot
> >  - boot/clang-20-lkftconfig
> >  - boot/clang-20-lkftconfig-compat
> >  - boot/clang-nightly-lkftconfig
> >
> > Regression Analysis:
> > - New regression? Yes
> > - Reproducibility? Yes
> >
> > Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Anders bisected this and found,
> # first bad commit:
>    [cc34e658c6db493c1524077e95b42d478de58f2b]
>    x86/boot: Move the early GDT/IDT setup code into startup/
>
> Lore report link,
>  - https://lore.kernel.org/all/CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com/
>

Thanks for the report. I'll look into this.
