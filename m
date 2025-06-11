Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE5C2367B9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749628605; cv=none; b=BQJNcLLp04RTeAdectj+TCyowiRipgN7YlYohw/HdeU3MXZ6AUM83dsm/AcjsF8kVpufAGCI8rXU3cP4NlZyJh0GAsAmF3HPNXZ37pgQ4hYZRbpQaPM/TCMTskToJ8cJXAM5u2lvWqll18ft2yEyRtdvn9/ikcGc+iMmJnO+4YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749628605; c=relaxed/simple;
	bh=Cds/bFRGN9RKQW08ZpB23YN3E1MHZ4+MwMSv0Smt3Z0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LNpiVwYNSmW7GV5RUx+hXtD0YSA+8+vU4xLmXqQ1uLC2aDxlJAdIGCL96w9oiwA1CP2veIlFannWycH09pHtBDRpOKZs84dTTrF6JihxGGT9BpM0tI0ENXsGT8Edpc6FYXxnWt8wxwK2CsySKm3ZYzp9djfaOVEat6PNrZfIK/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OXfG8Kil; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OXfG8Kil"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55324062ea8so8208040e87.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749628602; x=1750233402; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7xWU0+iIZBfV5Nl2WnjT76QONoK6dozWW2aQjG6ZTA8=;
        b=OXfG8KiluZapJEuPNGNtgaTaRTMn89gTU1fTXwV7CS+7BkhHpVxeYo8Ev49DSrtJsl
         8ggXtpGWeBjoDBMiAkTqnojwS5H0w+pt6OPMT+rVoIyxxNv2IP5oKzByUxDTRnDbi2vU
         3wwel4l2rqHxDe3u3b29vl3LP9g0+X3+fNsg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749628602; x=1750233402;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xWU0+iIZBfV5Nl2WnjT76QONoK6dozWW2aQjG6ZTA8=;
        b=cO8DRDsiu8K3pWm2mJEqx8AEPbNIBYtaoRhQbGLmuHWJRRw6EF/G3fSMesKOyaA8uH
         +w8i5TXnon175M/R/15xvVlWzwZH6+xJbfPQsbm5c04jp9ALzQeOgcIWMW27p6XQf41v
         sIFrbB09A2j02LA6ecBkksq32HlFsfEjliU1JBNpINNYc2vT4iFo2s5a69X/mdvhAI2H
         mO+orGVJ03SrPXB/DGF+pWglkLJmji5HkMivqLx5VORbs1m7+wM20DGOLOOh9VcnHYzL
         eTsLYkwZjrJHGa0ARmkP4QTLSnvoIVr4201G+fZiLkruo1OPGCU3wToIwWuOAHoQLL0j
         p++Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5UexdQVjf4oyUOriGAyN4dO7yIcNx8HRzeSP+yZeutuT7iG4YLwd9xWx8tb7J8Avsn2yeCHLtZaoL36I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl3B4Wn6pTHVa8/2T5XvxIF55Znwh0cIkh6m2wr+wlte1p6vJ+
	n67/y4Paj39YHZltlaoQIhZezVvi0VQtJ9QKSXbRmjBxzcz22O/+E1jDu/20lwJ8dbaDAn4qv7N
	tM0I=
X-Gm-Gg: ASbGnct5JIpbf+YPkB49FNJww2awo6XWSoM0VXYxsG0HA8UeARlUbRq9pbkdHayRfGa
	7BjCy7jXjn93+SOpMFDMP3VO3srUbagN6d+o+jJbU9jEy4ItB+zhAQnjMNK2k/yfrGoECF3CcEC
	2DK5jbiYMz34rEIiKHcLwzlKJ+E6gTKpvjEYFNCBpGAnTp355eIN6fjX9pdKn9lzXy2CfuV6rJi
	GhIs/5vHB86tHcR8QwPS0OQUWBchlDgn0rZNlsqxdBK+LJDXusSeodbj8hlaFeqRkxyEKS13XAd
	9wiAIkPIm7ve57GUlRiG8n4DpaPLuO2/8FXBgTpSqCjVayt+gscQlv4EpSaHRm/mcitxwODyEQy
	sTv2uyMxHiHbwVboE25q2uIGY
X-Google-Smtp-Source: AGHT+IFgpXV/obmUIKfMi34ZR7RIlHy8+4Krg5u5kdJITmP8N6ZL7v/z7BHKWYd9ga6hc1RqCoOAdA==
X-Received: by 2002:a05:651c:1548:b0:32a:8963:9dc8 with SMTP id 38308e7fff4ca-32b21cbd4bdmr6564731fa.25.1749628601878;
        Wed, 11 Jun 2025 00:56:41 -0700 (PDT)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com. [209.85.167.51])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1d002acsm17127991fa.100.2025.06.11.00.56.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 00:56:41 -0700 (PDT)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5532e0ad84aso6643351e87.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:56:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXB0VXH0xTcvt/kpCT1RI07t3AVyToGnhHsxUtibTzPpqv6s9Vy2oZ+MIrInH/Xsypuve59q1NxsDChs9M=@vger.kernel.org
X-Received: by 2002:a05:6512:1106:b0:553:3892:5ecc with SMTP id
 2adb3069b0e04-5539c21945amr752118e87.36.1749628600654; Wed, 11 Jun 2025
 00:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610174521.12294-1-eahariha@linux.microsoft.com> <00e40c21-4797-41df-b082-318f474f76ae@linux.microsoft.com>
In-Reply-To: <00e40c21-4797-41df-b082-318f474f76ae@linux.microsoft.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 11 Jun 2025 09:56:28 +0200
X-Gmail-Original-Message-ID: <CANiDSCsqfvYtD0ScAjWF0vensD3kRfA5tCLVi8UVYvcS8X_oSQ@mail.gmail.com>
X-Gm-Features: AX0GCFsSjG3YU2hML-YtpLfuMZy8nMEytDs7VdvUAV9hGvBg4DkTfOAumhHsTuI
Message-ID: <CANiDSCsqfvYtD0ScAjWF0vensD3kRfA5tCLVi8UVYvcS8X_oSQ@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: misc: secs_to_jiffies: Implement context and
 report modes
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Jakub Kicinski <kuba@kernel.org>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>, 
	"cocci@inria.fr" <cocci@inria.fr>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 19:49, Easwar Hariharan
<eahariha@linux.microsoft.com> wrote:
>
> On 6/10/2025 10:45 AM, Easwar Hariharan wrote:
> > As requested by Ricardo and Jakub, implement report and context  modes
> > for the secs_to_jiffies Coccinelle script. While here, add the option to
> > look for opportunities to use secs_to_jiffies() in headers.
> >
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Jakub Kicinski <kuba@kernel.org>
> > Cc: Ricardo Ribalda <ribalda@chromium.org>
Tested-by: Ricardo Ribalda <ribalda@chromium.org>

With this patch I can run coccicheck MODE=report with no error.

Thanks!


> > Closes: https://lore.kernel.org/all/20250129-secs_to_jiffles-v1-1-35a5e16b9f03@chromium.org/
> > Closes: https://lore.kernel.org/all/20250221162107.409ae333@kernel.org/
> > Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> > ---
> >  scripts/coccinelle/misc/secs_to_jiffies.cocci | 49 +++++++++++++++++--
> >  1 file changed, 44 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/coccinelle/misc/secs_to_jiffies.cocci b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > index 416f348174ca..f3241ce75a7b 100644
> > --- a/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > +++ b/scripts/coccinelle/misc/secs_to_jiffies.cocci
> > @@ -7,26 +7,65 @@
> >  // Confidence: High
> >  // Copyright: (C) 2024 Easwar Hariharan, Microsoft
> >  // Keywords: secs, seconds, jiffies
> > -//
> > +// Options: --include-headers
> >
> >  virtual patch
> > +virtual report
> > +virtual context
> >
> > -@depends on patch@ constant C; @@
> > +@pconst depends on patch@ constant C; @@
> >
> >  - msecs_to_jiffies(C * 1000)
> >  + secs_to_jiffies(C)
> >
> > -@depends on patch@ constant C; @@
> > +@pconstms depends on patch@ constant C; @@
> >
> >  - msecs_to_jiffies(C * MSEC_PER_SEC)
> >  + secs_to_jiffies(C)
> >
> > -@depends on patch@ expression E; @@
> > +@pexpr depends on patch@ expression E; @@
> >
> >  - msecs_to_jiffies(E * 1000)
> >  + secs_to_jiffies(E)
> >
> > -@depends on patch@ expression E; @@
> > +@pexprms depends on patch@ expression E; @@
> >
> >  - msecs_to_jiffies(E * MSEC_PER_SEC)
> >  + secs_to_jiffies(E)
> > +
> > +@r depends on report && !patch@
> > +constant C;
> > +expression E;
> > +position p;
> > +@@
> > +
> > +(
> > +  msecs_to_jiffies(C@p * 1000)
> > +|
> > +  msecs_to_jiffies(C@p * MSEC_PER_SEC)
> > +|
> > +  msecs_to_jiffies(E@p * 1000)
> > +|
> > +  msecs_to_jiffies(E@p * MSEC_PER_SEC)
> > +)
> > +
> > +@c depends on context && !patch@
> > +constant C;
> > +expression E;
> > +@@
> > +
> > +(
> > +* msecs_to_jiffies(C * 1000)
> > +|
> > +* msecs_to_jiffies(C * MSEC_PER_SEC)
> > +|
> > +* msecs_to_jiffies(E * 1000)
> > +|
> > +* msecs_to_jiffies(E * MSEC_PER_SEC)
> > +)
> > +
> > +@script:python depends on report@
> > +p << r.p;
> > +@@
> > +
> > +coccilib.report.print_report(p[0], "WARNING opportunity for secs_to_jiffies()")
>
> Sorry, I was testing sending this to myself before sending to the list, I've added the mailing lists now.
>
> Thanks,
> Easwar (he/him)
>


-- 
Ricardo Ribalda
