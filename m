Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E488523AB91
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 13:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560975; cv=none; b=NHu7p9vr+dCRb3Haw3faw9w6tKpzW4CjJVGxm06G0sOfcxGv9CRwIuimh0KRlaLpLVNNRIl9WZtw5nx8XOiL+p3PMo/twf6UH11Uf5ajzq2A2XXnHhxraAhS4TXdN4WWNvoJT97rUZzWqkOivEKLt0yNWNA+sOxGhCdGO6uHyBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560975; c=relaxed/simple;
	bh=DPKnG3TKgYwS4ZW8XycSxj2euJkWdGU9tFwY5lJRSB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lgv1+xWSGbj7goP0oZM4shbrbdfEBGuk3gaccFuvn2hieAf84M/m05Qk2qV8NxDwOOnH5D/Rsv5AbMOlB+DUy7qjaUeeLqz+ZD0qTOUU4zYCcZEE1yz16CljeM/VLPfhlexrmQqjgdd+SWCJKXsSARxSO+sqYD183nJGhoO44Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ElJtTHn5; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ElJtTHn5"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55350d0eedeso5606141e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749560972; x=1750165772; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lHgVganSUXqkPMCFr70WEyU8s9NnpUIxuGsS5BNhkwY=;
        b=ElJtTHn5L6sVPj/F7Nr0Vo5qhwyVsF4kah0ClqkFvp67x5eOviKkihVeBpYtnwUkxw
         sYVmL0SXGzVNtk7NBGcbtVtEHrahHPYHIErKotkqsRQBU1ASTVxVtJxN7KoqIUyMXdKG
         joZwfGxLl+aYvIapVEkvPbfOfTHg6vTySCHP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560972; x=1750165772;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lHgVganSUXqkPMCFr70WEyU8s9NnpUIxuGsS5BNhkwY=;
        b=Us22G54iwx+S6CbYF9je5luevgkmQtnRH5oc/zTVFZAlxFaogdLN56c94msX0cr8lQ
         gDVXuU/AJhdYbsngWxVjQWbHkRbmIb4dr8wUPaFk9/CQDIRihwJO+YbormwZQG5QKMQP
         h+75AXMUBMMh/M0KqxuTC4flclQpgwftP4biTIIFV9rqywv90hBhIC6Rn6BWzgSyxV5G
         QNLBw8wOy38utIYSnw/pCLExp/fMwxEZlKkzRfQQWQ4jrIFkAcILpbFAIxvkhfd1y00k
         n5ATWz+q25e1OTJ/c0kuhlJ+eAr0Yf11PPMS8A0wZlT4EwTlL05Nhrh9Pq+mf3cZLVLM
         E6/g==
X-Forwarded-Encrypted: i=1; AJvYcCVUfkeVNpnh7r5bl4fHN0x4w7U2FgTaajjzyBQ6EAr/Rf3iguVIgzrSYH7xkT8HD8WVsFp/OjmO1BzWNQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTS9VKETCrjcGSfZDCo8h7SZg1+zVW5pR2YdlddNfCQw9OGsQq
	vCdI68lpC+1shbli+C+Bg5YE15Sz7Zun9GxULG692XsPwcVqUKPgTpEIUtbH/BiEUR2zoLahAS7
	nWqc=
X-Gm-Gg: ASbGncvvXv2eOC/qCwbBSOkKzXaKrF0klyLSRU+jukSRWjgUkG07+cOaqNMktVZZCfX
	3irS7Lat+pn5u6GUQXONniC4k0rAs2HdhmAxZKIZqF0yQTq6mjlhl9ab1/6mJXMJ37sfUiW1iT2
	m7SopHXzKDbR2Z77ZPCLz0c0NyoeGqCz5q1oDhqfN+mg3Dd7NbutEKv7ofLA2pHNqspiY6Kvjvj
	8Cfg5IB989nrOCd60HACVMh75nj9eI2nMsJOOBZbjM6zxQjiLoU4vryQrFEEkks0TT93AIiYeuZ
	OxtBPads1XeEJ08i/FesqegK5NFCuXLzl3AU9402JtuB2dFpyO2ALEaftfm3qmjASkkEU5rXChE
	KfJGTvyaaMojAnoMfCAqr2LPO
X-Google-Smtp-Source: AGHT+IFjF2UXG3EIKxuHuRHCeiKAAg6kaXzDU1s6DwQKNXrxDaYUEsu+wb2TPcTvKEtbiUBv5pm5tg==
X-Received: by 2002:a05:6512:2398:b0:553:252f:adf8 with SMTP id 2adb3069b0e04-55366bd453amr4688789e87.9.1749560971712;
        Tue, 10 Jun 2025 06:09:31 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553926a7d2dsm399581e87.157.2025.06.10.06.09.30
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 06:09:30 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-55350d0eedeso5606104e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 06:09:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6wpDJe1h7ldc5mQEOff0ZQBQlYHozXMRN9/F3Gp9fYMJwmnyB047MuDllPLzTDjMjQQum0amkql9AgkU=@vger.kernel.org
X-Received: by 2002:a05:6512:1294:b0:553:543d:d963 with SMTP id
 2adb3069b0e04-55366c30244mr4804636e87.36.1749560970095; Tue, 10 Jun 2025
 06:09:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org> <aeacb653-efb8-42ed-a7ed-3e7be31b8f9d@linux.microsoft.com>
In-Reply-To: <aeacb653-efb8-42ed-a7ed-3e7be31b8f9d@linux.microsoft.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 10 Jun 2025 15:09:18 +0200
X-Gmail-Original-Message-ID: <CANiDSCviy5SjOwEcEM8_1gtvQzFUS3d=S6vFdvZzVqbif7NKfA@mail.gmail.com>
X-Gm-Features: AX0GCFvQjJu9HZ-Os99-ShsNpf-gTaw_io6WlDFV5wQCq_AZ0qq2K5O0Ohea78c
Message-ID: <CANiDSCviy5SjOwEcEM8_1gtvQzFUS3d=S6vFdvZzVqbif7NKfA@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, cocci@inria.fr, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi

On Wed, 29 Jan 2025 at 18:38, Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 1/29/2025 12:06 AM, Ricardo Ribalda wrote:
> > When running cocci in report mode, eg:
> > $make coccicheck M="$dir" MODE=report
> >
> > It returns this error:
> > virtual rule report not supported
> > coccicheck failed
> > make: *** [Makefile:251: __sub-make] Error 2
> >
> > Create a dummy rule to avoid this error and run the other cocci scripts.
> >
> > Fixes: 551dbd1ec7ff ("coccinelle: misc: add secs_to_jiffies script")
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  scripts/coccinelle/misc/secs_to_jiffies.cocci | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > index 8bbb2884ea5d..2d85dca16418 100644
> > --- a/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > @@ -10,6 +10,7 @@
> >  //
> >
> >  virtual patch
> > +virtual report
> >
> >  @depends on patch@ constant C; @@
> >
> > @@ -20,3 +21,8 @@ virtual patch
> >
> >  - msecs_to_jiffies(C * MSEC_PER_SEC)
> >  + secs_to_jiffies(C)
> > +
> > +// Dummy rule for report mode that would otherwise be empty and make spatch
> > +// fail ("No rules apply.")
> > +@script:python depends on report@
> > +@@
> >
>
> Sorry about that, and thanks for the patch!
>
> FWIW,
>
> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>

I just checked on 6.16rc1 and it is still failing.

Could we land this while Mark's series is under review?

Thanks!


-- 
Ricardo Ribalda
