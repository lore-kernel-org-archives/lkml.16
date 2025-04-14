Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138A27FD71
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744649859; cv=none; b=Thp0HD/rUJfjUekzAXvNsAgZXgMJQyyC3LOb77HVA8fGCsaDkLNgAUBZ0f8MGVJQ8FFJAzCijvr4uJ7RrK+d2pLHXcBmCVXW3LhQqQ8oepkc5bo7K2KHJqbEExGYr8U+/idCx6Cgfw7K6pPjcw2IH0yqaxFTuUVw3vZkYpvM5yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744649859; c=relaxed/simple;
	bh=eQEe/c5oftEZKvKUGmrhpEZY96s5kpSF+ZCfFScouec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qTnU+AFNTssZD/Prwc3dwqOTKBhzwJKoofIHuzPOihGJBe62OQ9uj04FN+l37dKZA4e80QX5L96NNQIbp+DSUxnDEFHnKQdoWoeG3l7uqvSSx0wvhyPBdBdNXYX6opU41cViS3PTVybdALjzWu4Rr89oGJiA5PA70WQn4AVjrxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LrQ6P41k; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LrQ6P41k"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aaecf50578eso831720166b.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1744649854; x=1745254654; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tYczQwi1ciTfnGeQQMxxbpGHfPdtJn0k+Nd8ZiAqFuY=;
        b=LrQ6P41k217ToRlznwyVPCaOW+1Oy9eom3CYDYtXrwOE1OVConGrWUK1oSTANQhM3p
         O0Ab8/rtwfbIeb5qBl1SUAmEFOnb3T9ew2ZyXIlGdZpyykdjrfRbNik4iW8bCYslTq4n
         HkU9e07vTFaLvps5COJPmi2VxrT0NrjRuWy+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744649854; x=1745254654;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tYczQwi1ciTfnGeQQMxxbpGHfPdtJn0k+Nd8ZiAqFuY=;
        b=WP9SM3ByfuX94XJhbKsg0J78jkzFt+j4ulpG8l4GNC3KHBW3ciah2pMihL2ENVfMO0
         4HUAzs8MUVq/n42uUTAWaEp/+RzqSFMKsFi6Q3SOaJAjfbs+E9/pcSG/sk6rCpa+vSHG
         3Yxdg3vEHTnKC96b0WOgDuVlp5yJUguycXPN06IS9L4fbHfQJxXlKU4DSNwUZhPtB36p
         jgmM2o3jhevCKPL4PH/eai1P7QQEV1516Y00Rln31Wzm6yTRfwfKwHPK3pjXuEwl1TqD
         PpMiCiXvoxMyGWugcBitpBAWojJi7V1alwz+U2fP31e+p7BTz5Ri4JlJFpBnou1Rx6FB
         cg5A==
X-Gm-Message-State: AOJu0Yw2GQZbKgXgesccB06qyrUApEr/V+VIxMNxDjNvYlmv5MXG1jHu
	wKCggVHfQnaOFUHSTmlvI3pEXTC45tmmCQ6jnQQ6uPP+jtJMTnvjKByKFaWOLgT8tICj0c9Dex+
	9Ifs=
X-Gm-Gg: ASbGncvzQ7AU/3QMTdJ7r7zKczDWEHLGtdtenRzAT2QQkXaVWdDQK6rWVdu0JE9KCnC
	gaisiCEngiyGbOKWBS5QqFNpCjZEbCttFTDXjdV+wLtsCwqOmaMgEmbGMGBd/+iuwKRpu+syeWZ
	AHyJSIrpGiPy9koBOHaXMvn9mvhZQji3EYVkTnCAb4b9H5zKswnhn3IkFKCmlNjEvj+RfadhrlK
	MX2VzqKxv55kG6hE7JofXjvcN25ZWcAhY1LQRUnBBnfPnyqIwnb2lpjLBXmmmrU5MQiOV8/hp4O
	Zpw+AqeJe54ivApAJb3Eq579tHB5297YrMkH4V8eInPtjUO4It4ZNFzQR4YM7IiPg1EQOS3psS9
	84z95Ll4KwEsv6SI=
X-Google-Smtp-Source: AGHT+IEKscqIKqhpvCpJ15MC4h84VRQbsGzjRxF5xUv7dI5d7FI7aNIh19N39MzB109kEnj8vOnTgA==
X-Received: by 2002:a17:907:7b8e:b0:ac3:b44b:de24 with SMTP id a640c23a62f3a-acad343c611mr1016331466b.2.1744649853954;
        Mon, 14 Apr 2025 09:57:33 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce6fd9sm919047366b.161.2025.04.14.09.57.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:57:33 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so819668366b.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:57:32 -0700 (PDT)
X-Received: by 2002:a17:907:72ca:b0:abf:7453:1f1a with SMTP id
 a640c23a62f3a-acad34fcb7fmr1049492366b.36.1744649852687; Mon, 14 Apr 2025
 09:57:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414102301.332225-1-mingo@kernel.org> <20250414102301.332225-3-mingo@kernel.org>
In-Reply-To: <20250414102301.332225-3-mingo@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 14 Apr 2025 09:57:16 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgCFJ923gMqPYq5YrqUuLM3He-O7wvLfpvwNrySSK0vMw@mail.gmail.com>
X-Gm-Features: ATxdqUEdn57IYM89yqy9QUDf0w4C6re1J-RqA0cqcSJChu_u3ZclK1cuu7ISSv0
Message-ID: <CAHk-=wgCFJ923gMqPYq5YrqUuLM3He-O7wvLfpvwNrySSK0vMw@mail.gmail.com>
Subject: Re: [PATCH 02/17] scsi: bfa: Rename 'timer_mod' to 'timer_module'
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Apr 2025 at 03:23, Ingo Molnar <mingo@kernel.org> wrote:
>
> We'd like to introduce timer_mod() in the kernel, so make
> sure the namespace is clear.

No no, this is horribly wrong.
> -       use_idlect1 = omap_dm_timer_modify_idlect_mask(use_idlect1);
> +       use_idlect1 = omap_dm_timer_moduleify_idlect_mask(use_idlect1);

This was clearly all done with some completely bogus
search-and-replace, and the end result is nonsensical.

That "timer_mod" has *NOTHING* to do with a "module". It's "modify".

> -enum s3c64xx_timer_mode {
> +enum s3c64xx_timer_modulee {

Same thing. It's not "mod" as in "module" it's "mode".

> -                       apic->lapic_timer.timer_mode_mask = 3 << 17;
> +                       apic->lapic_timer.timer_modulee_mask = 3 << 17;

More nonsense.

> -       return apic->lapic_timer.timer_mode == APIC_LVT_TIMER_ONESHOT;
> +       return apic->lapic_timer.timer_modulee == APIC_LVT_TIMER_ONESHOT;

More nonsense.

> -       ti_32k_timer_module_init(np, ti_32k_timer.base);
> +       ti_32k_timer_moduleule_init(np, ti_32k_timer.base);

Even more crazy mindless and completely incorrect changes.

> diff --git a/drivers/scsi/bfa/bfa_ioc.c b/drivers/scsi/bfa/bfa_ioc.c
> index aa68d61a2d0d..4c11e3738f36 100644
> --- a/drivers/scsi/bfa/bfa_ioc.c
> +++ b/drivers/scsi/bfa/bfa_ioc.c
>  #define bfa_ioc_timer_start(__ioc)                                     \
> -       bfa_timer_begin((__ioc)->timer_mod, &(__ioc)->ioc_timer,        \
> +       bfa_timer_begin((__ioc)->timer_module, &(__ioc)->ioc_timer,     \

As far as I can tell, this is the *only* correct conversion, with 95%
of the patch just being complete garbage.

Stop doing search-and-replace.

              Linus
