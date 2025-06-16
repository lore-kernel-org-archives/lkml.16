Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7E92E424D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750078330; cv=none; b=BqQIPxX91ueCC9Aoux2Ysj16xAdmmSV+n3ZGlTO/QUeDF+lpcHXU1juHavoC1oWyDgF/EGb3T6kQX+cSKGH7PQ6zke8MOwX+v25MEeyxINpTSCkWcEBaAhp8vWtGrFkwD6c1541JeO12BYGTOeYShc+CUI9im5GIzgXgqPjIn+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750078330; c=relaxed/simple;
	bh=AmCMqeM8ip7Dt1ebSPNe/cSuAJy4J9p6ep0k5bABpmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a7xyehuGlVKvqlrKNjDxmxUJKDwL67Hc/fKA3jcC+sCOgoFcPPKoxyiq2y1jKgl4zs6MkqDek+d0DHM6mZe9E4RwUhCTYvslL2vzbgKNoa4K9oYdFCEdNWssyPDJ22Lb1FufEkh2en02qWmEIxNK2Nw+SytYYEtijsrscrU+pDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTC4knLk; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTC4knLk"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ad88d77314bso991195666b.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750078327; x=1750683127; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VdB80UlhJ+9kWJi1RPcudsnXRz/L4Ger83HuMVF1zgI=;
        b=fTC4knLk7A4qpnWh7izN/j9x/IMkYpnpcPJ0u44aU1k+vgz5wfO9OPaL5Kgv8qQLip
         v1EpUZ/8QHbDjFMFdWJ/OY2XGcYCLrvpW1qei0raeLAj6GwE7zQxh0pkr3e61CP3JtPa
         EgaUnbV/vgz3Vk2vmmpu3rmIU4wyfma3VrP/ofIxnuH6TDqGMkmZ5kO2EP/e/2OpcBCj
         8M2dzEMSXK4KzhECHuufEC4gc+Cdlq6Hfydy4buuGTXNmIBJcgmydKKanenh8nRvAwii
         +FJqwpzPkOc2ri7Xlj9HLsPFNtFzF0Ct/r9HEvbwkzV3Y7oCqKHVljs8RzDwYo2UbgHn
         ctfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750078327; x=1750683127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VdB80UlhJ+9kWJi1RPcudsnXRz/L4Ger83HuMVF1zgI=;
        b=VqHpU3wPovoECXo7/GhFcB9lR2/64E+RgpEX1oO84E5hFbNJZfk55VNQh/KFGTW1Tm
         GxTD1dkqrUHrYLL5jg3TRSQFqZjYuZ6cB6HNOrffsevW/AKd2fbZLPxAvZIQJb9O+BqF
         d857utgUCWS27e/7di49WrC//KX1FO8oymsjwlcdHM+vvA9ucUUEEXX4yLLCsHqcp1rt
         mC5E9EH5tGsTZFwwjn0n5f+57BxkIfDmzSRBuU2RafgEEpx7YeP2FlBTC7ilX4i+gyD8
         2Y8ZuFOS784KHP1TxAcUd80tIitB0EOkcKMkFrnPFwfC7Tp2KgMCQ7MTizymbMfGqDUZ
         oJgQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/lvqR7114PxSRgheKIjlMh3aEsF8xcZEpJWqP9wn+qgz1V+6S0fxu9y5AuEBjga2g88FKQdBUu4AFPFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXKw2mhmf10PhjbGO0JyIbKtYjMzBM9x/a+eZ2yn4s4XsQGDp
	cXMVCbMrSxbv0iS6HWamiWo6YrBBccXKsJ/7JlCrnMr9UXXvfgq0eBw38a9jeEg+ijLK6J4gZte
	kB3YSYFa3PaCUFRArkVNkAHJ1r7L8fZB1MMWI64x5MA==
X-Gm-Gg: ASbGnct5/+U1CSapfmQbJ2tVfHwmgcDhr7eTQvnOFXmXrQRka/iSX83/NOaQ98Bqkwu
	wf0ZN1RxuxbDQia59UoJdIiE41d9VnWx21kjzgRTI8UzFap8thhcqycnCktJZzO354f6dCye9de
	dgTjDE5HR9y5Eg0qPrN28xxeAkZfDwPeqbC7OQUWag4tIrOFDQG/VpC55rKY8QCBCk0EHnisc=
X-Google-Smtp-Source: AGHT+IFrXESaFiIc0RoD/vRSOAhd3nwzVbSrdNKC+6HYCJVDvmM2bTCscLpJsw329oHv4yeWPAaH6VdydhEFttaexfE=
X-Received: by 2002:a17:907:70b:b0:ad8:a9fc:8146 with SMTP id
 a640c23a62f3a-adfad59065fmr825092166b.44.1750078327209; Mon, 16 Jun 2025
 05:52:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250604110442.8251-1-lirongqing@baidu.com> <54c4aa198131420d9c77542bad5d27e7@baidu.com>
In-Reply-To: <54c4aa198131420d9c77542bad5d27e7@baidu.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 16 Jun 2025 14:51:56 +0200
X-Gm-Features: AX0GCFv_E5GalXutSko7_CfOzvyrBwpmb_dO-wzaCJ71izV5Xe26UYnrYidmlm8
Message-ID: <CAKfTPtBKm7WgwcUHcMXnH3PL3KFSniy02mb6Ag4eQ1fA3e+H3g@mail.gmail.com>
Subject: Re: [PATCH] sched/cputime: Fix a mostly theoretical divide by zero
To: "Li,Rongqing" <lirongqing@baidu.com>
Cc: "mingo@redhat.com" <mingo@redhat.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"juri.lelli@redhat.com" <juri.lelli@redhat.com>, 
	"dietmar.eggemann@arm.com" <dietmar.eggemann@arm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, 
	"bsegall@google.com" <bsegall@google.com>, "mgorman@suse.de" <mgorman@suse.de>, 
	"vschneid@redhat.com" <vschneid@redhat.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Jun 2025 at 13:46, Li,Rongqing <lirongqing@baidu.com> wrote:
>
> >
> > Sum of utime and stime can overflow to 0, when a process with many threads
> > run over total 2^64 ns

Theoretical is the right word; If all 2^32 possible threads belong to
the process, we can get an overflow to 0 after ~4sec run time of each
thread. But then how long will it take to have those 2^32 threads run
4sec on a system ...

It would be good to get number to show how realistic or not it could
be to reach this value

> >
> > Signed-off-by: Li RongQing <lirongqing@baidu.com>
>
>
> Ping
>
> Thanks
>
> -Li
>
> > ---
> >  kernel/sched/cputime.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c index
> > 6dab4854..c35fc4c 100644
> > --- a/kernel/sched/cputime.c
> > +++ b/kernel/sched/cputime.c
> > @@ -579,7 +579,8 @@ void cputime_adjust(struct task_cputime *curr, struct
> > prev_cputime *prev,
> >               goto update;
> >       }
> >
> > -     stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
> > +     if (likely(stime + utime))
> > +             stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
> >       /*
> >        * Because mul_u64_u64_div_u64() can approximate on some
> >        * achitectures; enforce the constraint that: a*b/(b+c) <= a.
> > --
> > 2.9.4
>
