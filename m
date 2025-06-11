Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6FA923
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628792; cv=none; b=nJQVBLpIgly9pXWPf7mYc7BqdxJaV3GE4rz+VJkWV2xjiDvCdDhCNWUbb5XOPW1netWPUR7lg58IWagqWZYHKZaArmgfKvfP8f0ktqDUowjzT7fgt21v3Vf9m+kytK86OTzEPyaCAk2g9OFJylW9qpHfH3+C2SqjlWNQ2A2e+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628792; c=relaxed/simple;
	bh=kI85mKNpCdxz1vPoZ/NGAywMpzEzXNJcAIFOxF8cIQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMP15mVi6+A8mAnM2Pqa0o59gPK3W5n6hNchuxCAZFfBr64o9x00aH7ZdlHKhdGfEQdt/01g8WmxHSqFkeKFtjtP+EZm/34OXB2bPxcfqqLzf+0np3zMqVNg7hTDo8Id5rFe4208Jy1A7bp1oUJvbP+80Tq5PPTCgBDvGtKKTnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hugvEqEl; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hugvEqEl"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-32934448e8bso55080201fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749628788; x=1750233588; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ULDRRP8J1r9OalZxRSTmjUvWqANoUHadkiZtzLelOB4=;
        b=hugvEqElUr79DiipV4+S1SVIv5BaHS7sMt1T5wfPEzS7nCjAy3GlJusJpJ7byfxJwe
         18vK4QbySEIYA3VSF96q60QmcQpAuF2FJunVADIFSyVV8V0/HQVAQSKF76yiYhl//lgr
         VLLeh9j7wD611reQVdIWEOVvhLj9En3Fw8Zjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628788; x=1750233588;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULDRRP8J1r9OalZxRSTmjUvWqANoUHadkiZtzLelOB4=;
        b=szTiJLx0rsL9J6GuGAmquGP0kzRCNYV6NSEsRbkt+GozvihBOtjVwDMVwu91VWNc2T
         Gf3O9J+YMYTIiVlQ5pqNQ8SIGAvp8KtHa958tt+Z2DDCwbTJrNlgJQIqDFgB4T6MkFEN
         8RjPnD1pnUfndhwp66BNDSz9gsjhMz9oFpf6r+FpbqPzCmJvg01C+pNUPj6FyftbaMsW
         GpFAZ2YV6C06+SCfzWQYKdgoHuxrr9miETha0HAAMqkAgZxpTkYfKIvznWDxHcQF8NUm
         MAfceaBfFdbsmuxBD+OJH/0pN0vuHjizrjOlE/oO9M5WXOrGWNTqEo4SlRk0XP5ZfQAo
         UFfw==
X-Forwarded-Encrypted: i=1; AJvYcCWs4PTP5MLZ4Yp4cv5KJF0uL536oYffz88GKC9vaEo59hxfM8neMIvZGJJaxEDfsqd5aaOSXyGEQFd+Cm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGbjr03e/oXrHErB2wm7f0ZM61QjEGVTL3WNBl64URTiQ+eA9M
	TWcO5n9guBvazCIJVuiKSWzqGasyvqxeY5pntFPEq/Od6G5U0J7NGGkOFz4j16OLscvNoyGC0Pa
	/uHU=
X-Gm-Gg: ASbGnctobrAKUYJcQsWGjdLDauSjgTikRM/3ShlGCBVeKS2ffR4rTJBI5UeiObJmYEV
	pAB2A9O03jIh9CjU2DrOPmnRfaeqRR5CJxpwtON/hfyYM6GV533Mq+SpUaTMparNrKrftE526a2
	AriFphR7BgkRi9w9uDLznU6Izg8xtI3eiQokruJIAsihh8dfIB/f2PYiyP/52zbaQwXZHMF5A82
	L/ZCRTGZSAG1Yc7zLpI5DHV8c985K7hbG3585uWfw7Gl7gTEoZlsuNB8YNI06Gti9emRsPtlRm/
	AxqrHr6D0ISdg9WTK309Jzwa1ZWfKsRmHyhRSNboZSa5U0+fC7Nzze3CUXl5p58qHST2SIa0ye+
	Ulh2CN2nbzBBvfe57bf+XjkOq
X-Google-Smtp-Source: AGHT+IEY4C6/nyzdIGcNBaq/Gekk17L401Y5hhEvad9cCzlRBeQS9Kw1k6OjwdJscd2LZQkrx3HJmw==
X-Received: by 2002:a2e:a582:0:b0:32a:6502:df44 with SMTP id 38308e7fff4ca-32b21e45019mr6419821fa.23.1749628788136;
        Wed, 11 Jun 2025 00:59:48 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1b34742sm17731671fa.32.2025.06.11.00.59.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 00:59:47 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-551ed563740so7867484e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:59:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX763y/RZuYMLM2fLzy79gB37N27os82H5s5b01oSHM4NObZ1TSG8sOgn7stBwfBlkcSpXslZLMJzlTIE0=@vger.kernel.org
X-Received: by 2002:a05:6512:3988:b0:553:2944:f3e with SMTP id
 2adb3069b0e04-5539c1d6f11mr678921e87.51.1749628787314; Wed, 11 Jun 2025
 00:59:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org>
 <aeacb653-efb8-42ed-a7ed-3e7be31b8f9d@linux.microsoft.com>
 <CANiDSCviy5SjOwEcEM8_1gtvQzFUS3d=S6vFdvZzVqbif7NKfA@mail.gmail.com> <588d5a4b-72cf-4d2c-8eee-c4240ae067b5@linux.microsoft.com>
In-Reply-To: <588d5a4b-72cf-4d2c-8eee-c4240ae067b5@linux.microsoft.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Jun 2025 09:59:34 +0200
X-Gmail-Original-Message-ID: <CANiDSCuGo4CAaM2qd1FviWoZ-y0Dg6BWYXHmsNOBsXmxZj=ndQ@mail.gmail.com>
X-Gm-Features: AX0GCFuJ-OnqASEGSwJpRPA-DeamvypVOt4R7T55jGMIJ2aacHY0Bzr2ZdumOaY
Message-ID: <CANiDSCuGo4CAaM2qd1FviWoZ-y0Dg6BWYXHmsNOBsXmxZj=ndQ@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies script: Create dummy report
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	Andrew Morton <akpm@linux-foundation.org>, cocci@inria.fr, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 19:35, Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 6/10/2025 6:09 AM, Ricardo Ribalda wrote:
> > Hi
> >
> > On Wed, 29 Jan 2025 at 18:38, Easwar Hariharan
> > <eahariha@linux.microsoft.com> wrote:
> >>
> >> On 1/29/2025 12:06 AM, Ricardo Ribalda wrote:
> >>> When running cocci in report mode, eg:
> >>> $make coccicheck M="$dir" MODE=report
> >>>
> >>> It returns this error:
> >>> virtual rule report not supported
> >>> coccicheck failed
> >>> make: *** [Makefile:251: __sub-make] Error 2
> >>>
> >>> Create a dummy rule to avoid this error and run the other cocci scripts.
> >>>
> >>> Fixes: 551dbd1ec7ff ("coccinelle: misc: add secs_to_jiffies script")
> >>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> >>> ---
> >>>  scripts/coccinelle/misc/secs_to_jiffies.cocci | 6 ++++++
> >>>  1 file changed, 6 insertions(+)
> >>>
> >>> diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> >>> index 8bbb2884ea5d..2d85dca16418 100644
> >>> --- a/scripts/coccinelle/misc/secs_to_jiffies.cocci
> >>> +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> >>> @@ -10,6 +10,7 @@
> >>>  //
> >>>
> >>>  virtual patch
> >>> +virtual report
> >>>
> >>>  @depends on patch@ constant C; @@
> >>>
> >>> @@ -20,3 +21,8 @@ virtual patch
> >>>
> >>>  - msecs_to_jiffies(C * MSEC_PER_SEC)
> >>>  + secs_to_jiffies(C)
> >>> +
> >>> +// Dummy rule for report mode that would otherwise be empty and make spatch
> >>> +// fail ("No rules apply.")
> >>> +@script:python depends on report@
> >>> +@@
> >>>
> >>
> >> Sorry about that, and thanks for the patch!
> >>
> >> FWIW,
> >>
> >> Reviewed-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> >
> > I just checked on 6.16rc1 and it is still failing.
> >
> > Could we land this while Mark's series is under review?
> >
> > Thanks!
> >
>
> Can you provide a pointer to Mark's series? I actually just implemented a proper report and context mode
> which I'm glad to send out.

My bad, it was your series:
https://lore.kernel.org/cocci/e06cb7f5-7aa3-464c-a8a1-2c7b9b6a29eb@web.de/



>
> Thanks,
> Easwar (he/him)



-- 
Ricardo Ribalda
