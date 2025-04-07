Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77141F873D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 15:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744039047; cv=none; b=mvNGfc42tFKFYLuCl2bFab+60oG9cEdgwF/0a6sOHP6fnpIUM3i80rcIPFdlHEucm7mFJmYWPIJ5GuB9RiYZObFYMmnDz+CBfG+skM3qEh0AkzE1ohClHgHJVV4fvl4TVmvKPAiTJ+fpwAbHnisQjaDwf3Z4yBE8pWPcHCiOm7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744039047; c=relaxed/simple;
	bh=GaZNzpjk/uSgd7Vcok7kqgIyRmErrAqGopWkMjs6OpY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cknKfK+FqprOaJ8dBERyMSqp0bbFKPtiAd2iQ2TYvYpihqqFhrONkCDM5VtRfjDZLdcTHgcCSGlUTW+a6sb2afMn6/9fne4jGbDQpyeZ6kVwoAP4iEt0aBpooUqrQfzQWcaiNCPnMH1KnyeG4h7dhEI+TVfV+A+znl1sDO5RsbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lzbIn2/7; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lzbIn2/7"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-86cce5dac90so1905387241.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 08:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744039044; x=1744643844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KryXeeMhvo1fW/6I9/fSFEwrg48LYI4766MWfuI9U48=;
        b=lzbIn2/7g/12fp9oO0etqdTxF7EBqzHlWCqUgCXRPZ6/Xdl6QpmVO7GdVDZqQVuLWp
         2hDIj/yEoRnjhVQQqO3XJ0LukaA02Inic4InlEmFIfx5SaSSGNuU0ce0a0aGxA+B8LZT
         jkpalZ/5qBxbm60EUaGU4Nn+ViX2+DrQVlLu5EfKHMtwNxqSBrPgYEMOUThcvyNa780k
         MawCUs/rlu9Fucyt5uh9pEjlos/mg0iUlnWhsPfrhWGGykry5xI4t5hdVo0p8QjqcI3e
         dBOfXkpj6/Loo10ugeUWeiwOdgASwe9xwJiAwmXdbK+m1/NstlNAOiJKCAuGi0kIWBvb
         b2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744039044; x=1744643844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KryXeeMhvo1fW/6I9/fSFEwrg48LYI4766MWfuI9U48=;
        b=Hq0JDvsJyWgCqZM8kPD6jNQ+YUXMOAh7i87hkgOAJJReTaA+3Aadf/8gOJINxY+H+E
         3P2YlpmU3jJPjCK+f4Iph4Q+6GNjMkiw18PXbT4TorT+WIigjt2NA4LbBVHnFbV1PtpT
         n92kJjHba+PC1KLvImkARI/u+V5CGVtphBr/57hPOq7xNdnD9et/H8LyXa/RoY2FrVn0
         sX+fVxwCwZPamNEjwAOeXgIf7af3bcxQSSvhZFKvva8+xcllJCgJ4Tc3TfyaJbyfzxxl
         hHHO+gv/5YYbXEFnCl34Q/+cr+HPu4ZrgxmwQ1EawpKJYyowOa9ZnModi+7vYx84Wsra
         Dnnw==
X-Gm-Message-State: AOJu0Yy6bFfuSz/5V8PFnVJWYd7B+SCDFqtKPaVs8LTkMK+KjyJVSMvs
	cC9Zkn/r/HCf+9NPI0YvPB5j8RK+2GRxaEg3yeKUf1ysmlZyXEMSoA49Mq+PfWkswozrRAijUih
	8Evys4xUgCs96M19wPL2G62H8QN2N98osA1IbcdMqPX1xihwwS3w=
X-Gm-Gg: ASbGncsL3cy6pfymh4U0NFU5AeMfLGziJhzopgtS8I8PThUKBfopImUgli2e9QRLrLe
	faQTMp1QRF/hisCYy9tIg3QMHXY30J0ghHCFIlQ+8IefBaAB93y9GPBipvNXWoEnt9ILKFPZ1Km
	nvA1tRXTE9EfJ9ATzHjq7OTlnof3ohsZx6HVJlZuHoH9zpklovsiwlqdkYOCglZ2RBVkH4MA==
X-Google-Smtp-Source: AGHT+IH206FpiM+rgrTfBvzV0b82SkEbcn4bNrTAoNzAs2SHWJTBE9HK0oB8k1t4NMwGB0Ykc0SphwFI8gTwN3tKzBE=
X-Received: by 2002:a05:6122:888:b0:50a:c70b:9453 with SMTP id
 71dfb90a1353d-5276459e61cmr8027565e0c.10.1744039044078; Mon, 07 Apr 2025
 08:17:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
In-Reply-To: <CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 7 Apr 2025 20:47:12 +0530
X-Gm-Features: ATxdqUE5kxlj_8OqC8jsSD6w0dhR5AxZd7mod0ynt5NdSzSdKupNdtTOZT5YBTE
Message-ID: <CA+G9fYtNcnAEVs70eH2yP5UxRBsfrN2B1nKNcggGQ7FNMAJMmg@mail.gmail.com>
Subject: Re: next-20250407: qemu_x86_64 clang-20, clang-nightly no console log
 but gcc-13 boot pass
To: open list <linux-kernel@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, dwmw@amazon.co.uk, 
	"H. Peter Anvin" <hpa@zytor.com>, Kees Cook <keescook@chromium.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Apr 2025 at 17:15, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on qemu-x86_64 with clang-20 and clang-nightly on the
> Linux next-20250407 and no console output.
>
> The gcc-13 builds boot pass on qemu-x86_64.
>
> First seen on the next-20250407.
> Bad: next-20250407
> Good:next-20250404
>
> * qemu-x86_64, boot
>  - boot/clang-20-lkftconfig
>  - boot/clang-20-lkftconfig-compat
>  - boot/clang-nightly-lkftconfig
>
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>
> Boot regression: qemu_x86_64 clang-20, clang-nightly no console log
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Anders bisected this and found,
# first bad commit:
   [cc34e658c6db493c1524077e95b42d478de58f2b]
   x86/boot: Move the early GDT/IDT setup code into startup/

Lore report link,
 - https://lore.kernel.org/all/CA+G9fYt4VVa3kUDR+ze05xM+fRmMBVfbBTsypUq5oOpAfuzjfg@mail.gmail.com/

- Naresh
