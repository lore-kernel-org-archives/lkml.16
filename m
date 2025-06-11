Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4CA20127D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668688; cv=none; b=GCkcYcmBiUmmnhNre7VUmNFVLR2FUawdglfivy075G3/CJlA5g1TS+k+J4Q9w5OY/qfrcMlgoWJuO47KUCAqBynKK7VUb4hJP81oWFUyDL7kzcBR6tmp3MbymzDACYZ8WQjDUWmnwY5Cb++8SkHnqYP+i7DQu0j+Wh82GLeLs5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668688; c=relaxed/simple;
	bh=+t8ACet9xqwRNJy9b8899wiD25b/003UaXpKZdUYUJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uiAxdG+f5bzkENHvOvUwf6pQpOZkUX/wG6BUoxqcnD9RNM0pRlgEScHhlw7E1+4QbrC5gWc11+A7hCG9R+MdQZ9xaRJFqfvqnO+AD41ObgakF9HRMErT7rN70aHV81did2M5bPVxE9atgoYYhSfWQ0DNalEiL2UPfTwPc/b+Q1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/Sbp4qm; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/Sbp4qm"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b1ff9b276c2so62707a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749668686; x=1750273486; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yu2PImzFHGaLiTWdxu2ihmwRTn972j20R7GA0tijYc4=;
        b=L/Sbp4qmhiLJrc5EZADLmfzNaIlDUr0hY7YliKl/Os9xnuFOVsOAxPb1GJP3/xPljD
         F4EiL1NKg+6yT6u6lhASa1B+n/eN8nUpj55Ch88ewAjpNXNF5qbl7wRMZYdCCUcOqru1
         zdnJCVHpuxonUj0gkpSlKWydxBJ6UmhaOtepp3MyQbDt1GAZN82E21LPnYIBuVzvwDuG
         gcqiEQj3x/Ti8k5ovB5oOCfoWdcHU2cPqMazsaxgUdpeu72jqXY09A2l9ppP/vx6pEhf
         mi3Nzb+iX8mtV2I6L8pPq5fc2XnGgKCLI6fjWojaiMyg/wQDuphRQdOugPT4yzzF2ORn
         jP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668686; x=1750273486;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yu2PImzFHGaLiTWdxu2ihmwRTn972j20R7GA0tijYc4=;
        b=S8uNH9LZeHD1kqI5TWL5zFJgknbDBi0XzbiwTT6lpoPnf+7C/KK+SA3TZtvxpQgOzi
         vVGl8wJxw5n6bS5DV6hzPd/PdQkcjukyTKXS4fyABoMA7xZ11KFG7G0IucghLfWQjMUo
         0a7PQFcb8EH/ZBduDH+66qqQ6XA0pB3t39dqUKXy8A+irN5wkzBFgvVFwkU1Ik2ZX1nA
         BKhzTHFwirrNNM3ALFp9VPEdY1yOQdbVfGB7NUUotXF6g0wOW9M5dp8tEMehHRgCf0gD
         xgR7yI8ali6FSqMudBwrT3twCAodOnq4IqZsLht+NCiR/+0idikFkp3xjiL+2iYAdt/S
         MUBQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+rdMDWORll5NaOHssZuClxz56D+GYfbUrNWAJXdiuzzYaROSdfD3sPvFYmM2t6UHRAOlV2buK4TCkrrQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5vBa0C+gDCiQeIV8R4d+Z4qCM8q03BnhlCb2nSg/G40W8bIAc
	5emUrSUmBxveHtytwRH44zglpiFTodFUuTNj8sCVlXliL+f7Fko3/rz7
X-Gm-Gg: ASbGncvn/0Np248hPNQJAaIjP4pY0zW+iHxsNQ+YsVSsTzzSFjkCE8GgCeNw6D/6zNL
	3gdXVDBzn/QzqHaZnBTumpm2mQamH6T8Wz/KXXLl/d1/ImqdYcbbRsl0o4ho81TJGnmZsJrT9KB
	91Bod6hob95szkhpmLk6HZQZ//RSDuzKwz7otz5s5ju/JSlZzCh2XOcZ0eoeGOHUVq5u/lMLvjQ
	PRe68NgxAlcwLxsOgPWiAdfuh16rIkb0FwsruKXYD7I8q7GzCBz608T/LTb40HwtivDnFqX+ZI+
	0uw4R2Q2UsVn9gdk2Rd6KGR2P1uqL7evYqYijPyB80qp1Snlkuts2Ulo/lQy4Q==
X-Google-Smtp-Source: AGHT+IHlKwUHlG5l5OkH/T5Emuq4G3wP5gvRvJQ20dNe+S3Lsa4RrQlO5tlqWQU83u4ZPK3w8pteOw==
X-Received: by 2002:a17:90b:520f:b0:311:fc8b:31b5 with SMTP id 98e67ed59e1d1-313c069ede0mr408927a91.14.1749668685680;
        Wed, 11 Jun 2025 12:04:45 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b20112d4sm1859375a91.20.2025.06.11.12.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 12:04:44 -0700 (PDT)
Date: Wed, 11 Jun 2025 15:04:42 -0400
From: Yury Norov <yury.norov@gmail.com>
To: John Stultz <jstultz@google.com>
Cc: I Hsin Cheng <richard120310@gmail.com>, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEnTSuVy2Aq8jRk8@yury>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>

On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> >
> > Simplify the procedure of CPU random selection under
> > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > logic is still the same but with this change it can shrink the code size
> > by 18 bytes and increase readability.
> >
> > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > Function                                     old     new   delta
> > clocksource_verify_percpu                   1064    1046     -18
> >
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >  kernel/time/clocksource.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > index bb48498ebb5a..ab580873408b 100644
> > --- a/kernel/time/clocksource.c
> > +++ b/kernel/time/clocksource.c
> > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> >          */
> >         for (i = 1; i < n; i++) {
> >                 cpu = get_random_u32_below(nr_cpu_ids);
> > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > -               if (cpu >= nr_cpu_ids)
> > -                       cpu = cpumask_first(cpu_online_mask);
> > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> >                         cpumask_set_cpu(cpu, &cpus_chosen);
> >         }
> 
> I think Yury submitted the same change here recently:
>   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> 
> Though, I think he has another iteration needed as Thomas had feedback
> on the subject line.
> 
> The bloat-o-meter data is a nice inclusion here!
> 
> Yury: Would you be open to adapting I Hsin Cheng's commit message into
> yours and adding them as co-author via the Co-developed-by: tag?
> (Assuming I Hsin Cheng agrees - See
> Documentation/process/submitting-patches.rst for how to do this
> properly).

Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
I Hsin, do you agree?
