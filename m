Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C8E27BF6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 17:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751391536; cv=none; b=FaR5EY7240HhwrpFHY/sQmMAwkC3T5yw0xxPeej32HETfUUktqm6KmKR1A6Vr1XANuejmymKyAi8jlNsAttRMqNueUji4oncX8B2fHgkfv+z3h3Oe04D4baQR8R+iILuL0bPu5u/6MTVXUBRCtPIBfYXfFjcyXKtKz/MQ+Vt98E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751391536; c=relaxed/simple;
	bh=5zvEsOvSYVhWyUtVM6u5hUWth1qIUNz4CrI6JeOFUK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OscP4ysz4852C0kUeMZL2+Zj6h4Mdj14fxSQpvyPGU0ieJkwexdGV+EprP7NCuDzOr9pO0sYGvx/PdLYhQs9hO/TU6N7+P4QXi1sMH0H4GstlUTWPUb88MI83Oz+ebkuxRxFY+rP6zqbeLQWCgk2k0QADw4+VMPARD6X1239tnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3m89p7lm; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3m89p7lm"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3b37207easo149079066b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 10:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751391533; x=1751996333; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfxUpibom5vvnS0KKvDzUm1M8BKe5OlSJnZe4zWpxjk=;
        b=3m89p7lmr4uKWcrckqhwiCDXdQDRUrXm0INB2+MuiDtvuFTDewVqBk/esztQY/Ao9H
         o25nZk+szTAenBEgGQoK47rNdZGwLhCuYSRNp4OVusFN47tw6znMt4/fYAiWsFRS+J84
         z4qBAlxOfsOHGIoeGBCj0n/F6AzipW5jQVNVO8WgdNu4emAOX4R3wDP3yOTQqtm42uej
         jMfCVks6s4yMokfR/XAWvu9ap43MrRnPOXQGDcWu4ZmfRp2daGb9r8S7v5au9DuD19Hg
         R29DJ5/AxHhp57q6mfSXELWuoK91lAJHqVksIsPFFCZ2k0V6JiThhGyV8UR1KJUVePUo
         pNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751391533; x=1751996333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfxUpibom5vvnS0KKvDzUm1M8BKe5OlSJnZe4zWpxjk=;
        b=h4DwIc9xLCgvc+yN3T6+9HO0t2HG5TvO7BvG33VSJghCttST29W5DxzjIlG3CbKUhH
         v+/y5a5MwOZvBQEyqZ3aiwQedGiZE7r3rwgDGF2aONr2aHukcHBCEDBeoLex0xoXSviR
         aP7sHEBAkUE79mysD1IhLns9DL/WCC/aa6A8Gg8JdkXkum907oSaogFSU7uAYJ6RdqC+
         8DIvG1TEe79LH2WQyaSKdYES+6g9OCvk+K+d4Q4COOcsPBkWTfRfqcDlEXmpRKBJue1C
         j9HQnxiuvBd9CMS9yGl+WMmrH4eoCvrlkyL03PNwqDn93OBW/0Un2+v+toOrZJKfj6mC
         BcTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSrKAzGWN2BqCqGfKC8rva9d2Asrgy8XQRy9L9RyqacHOsyZGZL6mecA/V44Xh/wYIW4Scc29CIlKUH48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhmdYPvp/yUubIUfgAHy0GrKjeEWNvU3nySPhNebleOJT4mcKv
	S8GAUbW1pUDjM8iWY4RRaBvclrxgooV4X5BaTnueAip7mEyiPcdanVFKg+OcXRTspn9czj6QmOX
	UZiN646Gm4331+qjBak4K1CUkyqlCndQ7chG0pdGSBGiTZcjV8TS5PLTreg==
X-Gm-Gg: ASbGncsPkDQ/w0d9pnCJ0QNLZi3uOR1mPUP0HPgc7J3q78XmK4LeppB7BN3fisPMGGu
	DSZA55JJDv9++sC+Xmk7f7aJ8gNYLbUtYgHT2OShSKm4vBlYG0ftubXQVNOKdNPNkU7VTRj+jek
	5fYaYceCpvLSwjYAfcVdI2b/x5xyfl2tdxldkmVLr0
X-Google-Smtp-Source: AGHT+IF+/tonZS3eprL8fBz59HFoDazzWtNrnqbkDEo/bpyI80sUtntiayP1Q+kl77kfKAamsjQgNVIYfD+CC8tFZXo=
X-Received: by 2002:a17:907:e885:b0:ade:4121:8d52 with SMTP id
 a640c23a62f3a-ae34fd6c415mr1795492966b.16.1751391533096; Tue, 01 Jul 2025
 10:38:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250628234034.work.800-kees@kernel.org> <CAG48ez0n1E0iuOxPe=jq4MuuP3w2wMSNixmfNmBbB89jyJBSbA@mail.gmail.com>
 <202507010926.1650356E@keescook>
In-Reply-To: <202507010926.1650356E@keescook>
From: Bill Wendling <morbo@google.com>
Date: Tue, 1 Jul 2025 10:38:36 -0700
X-Gm-Features: Ac12FXzCjsprue_aHpjZnVxD8VXCkB47OcxITm2WNEvN6g9cKXegv-O1gblDGPQ
Message-ID: <CAGG=3QWVM9tTRoGws0X+Jq+m7Fte2JeQC+jUL=EZ5hqGzSY6hg@mail.gmail.com>
Subject: Re: [PATCH] kunit/fortify: Add back "volatile" for sizeof() constants
To: Kees Cook <kees@kernel.org>
Cc: Jann Horn <jannh@google.com>, =?UTF-8?Q?Jannik_Gl=C3=BCckert?= <jannik.glueckert@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, linux-hardening@vger.kernel.org, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Justin Stitt <justinstitt@google.com>, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 1, 2025 at 9:27=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
> On Tue, Jul 01, 2025 at 03:41:35PM +0200, Jann Horn wrote:
> > On Sun, Jun 29, 2025 at 1:40=E2=80=AFAM Kees Cook <kees@kernel.org> wro=
te:
> > > It seems the Clang can see through OPTIMIZER_HIDE_VAR when the consta=
nt
> > > is coming from sizeof.
> >
> > Wait, what? That sounds extremely implausible/broken to me.
> >
Agreed. 'sizeof' should be calculated by the front-end.

> > https://godbolt.org/z/ndeP5chcb also suggests that clang does not
> > generally "see through OPTIMIZER_HIDE_VAR when the constant is coming
> > from sizeof".
>
> I agree -- something is very unstable about this case, and it's been
> very frustrating to pin down.
>
> > Do you have a minimal reproducer of what you're talking about?
>
> I have not had the time to minimize it, no.
>
OPTIMIZER_HIDE_VAR doesn't have a 'volatile' on it. Could that be it?

As a side note, the current definition:

  __asm__ ("" : "=3Dr" (var) : "0" (var))

seems like

  __asm__ ("" : "+r" (var))

with extra steps.

-bw
