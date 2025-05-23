Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2522B9B7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 07:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747985518; cv=none; b=sMC04QTt6ywlj5bug7HrW2sxjAAqdBLwg7xtYmTUREGRieDgkVrbXNtIakOI7FTkdhwAX93a+73DIhHOWDRwc/qrZJfYR8GNRBRmY4akgdtoAiV0K1bvHENsydv63byuQoCdsVnrepK3DVs6GnMia1JCACfQDCtTAFaIkZ2H5wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747985518; c=relaxed/simple;
	bh=1rU8KfdpOw/wwgN/qzAFAUH/2Puusqm5B5r9ppRAw14=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf3TgS1tFlaJdzLyPRQaoQh9YgrKV7wCarfAF6DdrmLXQSXC+Fqam2U/Bjo4k7L1p3ldQocgBTl+Xme4xjsCgnB2LvHaAoFaI5Q4LbmSMQxAYlPPgiRuIg4jjCJimKRzdYgyE5ksO6qy0yqfU1npJtpccdIayx7Y+gBAGeYtMF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-87be2373596so2655449241.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747985515; x=1748590315;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FD+nL4yd2I4+cbDko5AOqUkYfXfG+wQm1GId2A/CBdM=;
        b=UA4CqtQnBDXpz5irAQzD70B7Wy9QfEErIhSjpIzJJq7COnNrJ6ZIUyMUsDiA9rIYzt
         REs0ZdX8qqmxhX5WQHK5fmQEWXUYEzB6yDeMuQwm43F9nLEVmbxGqmcNYrASgsunmnO0
         4Q+W9BMbT2cHEROUfmfKTz+CCL9EFPcUfwosp+MCfK6uJ1OS2x2E3p20R8HAnjj1/LKC
         PTM/Ez/kFDYCh8T24SGgYCCp8ASeC+5dw9RBSyRe03Z6BK717snY2mxApS7qHL07AIZW
         HGMme+oEIuk6UUdKjObg5WiCh8i0LA2y4PKPNBEjNrnE3iROYVCMesSfy011CIPvMuSH
         2FlA==
X-Gm-Message-State: AOJu0Yyr0FxrlgpagDTd9qPRB6qn2m2INm6UF/osQ2jx6chbZAtd423q
	Cnhbxeu/0SFtUq7SjGcIb8WasAaNqm1c5bFPIZjLFg+uBrjCKp0dzT/S1ueQThrt
X-Gm-Gg: ASbGncsUF2YitBMF9W+O8WMqxgS5EGahew2GsgyXj4AfSLuOw0eNBZ50LqWckDa4tIu
	IkknqkmXN5UFYEc6fBoHnIsKqOd8iT6WgJkHpgRrYhu0eJTO6/3dvaY6vVTwjaWF3rlaXGYuD0o
	SAmbZ7fvEorwMpxZCZAr+0s9gVBeMrx/hg75X4P8kBQk0aOqa0bzZL54NCiiFGCVRrV3mcD0jx9
	LrVBOBL+B1KIYOFpnVs7iLnFxOPrWDWID8tmPiQ8zSgmX/FnKaIfWyWIyS7ddrLkVsFYaxGEBFl
	n8EWNU6nZxxzlLeFFMXsnbxuwA0mqNl+xqNJ0rO5IHxzRKkfQciESX1RvBVHhmbb4MyIRxPW8NU
	byfT3Yv/fvo8MmOrLCG2O7rZE
X-Google-Smtp-Source: AGHT+IF6WCqmWtndt31S/aMgjatCzAyze5HP1mPP1gJK3udqQJsWmjwEJJ9QryKLBRTZD70u7NLi1w==
X-Received: by 2002:a05:6102:2ac3:b0:4dd:b9bc:df71 with SMTP id ada2fe7eead31-4e049e63e87mr22977066137.10.1747985514845;
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com. [209.85.222.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87bec157a69sm11376301241.19.2025.05.23.00.31.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 00:31:54 -0700 (PDT)
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-87bf9d00e1bso1760537241.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 00:31:54 -0700 (PDT)
X-Received: by 2002:a05:6102:8005:b0:4dd:ad20:a334 with SMTP id
 ada2fe7eead31-4e049d57331mr26428808137.7.1747985514143; Fri, 23 May 2025
 00:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20250331190731.5094-2-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 May 2025 09:31:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
X-Gm-Features: AX0GCFtFv5fcH5b31peoUctAzpCxkK7VzeLvAUvdWARN-L5YJkESt2RHNq335aI
Message-ID: <CAMuHMdXmQ2uGR1ntERG7rS=VtNNZ734BMCQu=GaYgQ3sOMpd6g@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: delete email for Shiraz Hashim
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	soc@lists.linux.dev, Shiraz Hashim <quic_shashim@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

CC the address last used in Oct 2024

On Mon, 31 Mar 2025 at 21:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The email address bounced. I couldn't find a newer one in recent git
> history (last activity 9 years ago), so delete this email entry.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9bb1db9979f1..32f15c2ce531 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22627,7 +22627,6 @@ F:      drivers/accessibility/speakup/
>
>  SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT
>  M:     Viresh Kumar <vireshk@kernel.org>
> -M:     Shiraz Hashim <shiraz.linux.kernel@gmail.com>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     soc@lists.linux.dev
>  S:     Maintained

This is now commit 3238532ba55c9bf9 ("MAINTAINERS: delete email for
Shiraz Hashim") upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
