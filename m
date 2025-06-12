Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388ED1E51EB
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714343; cv=none; b=WuXneHE+X5dNIfLo3tKMTQ6rZG2DrfENEI8QfNKy9c++w3fnjkgMvD36BVJGGXNnC8bhLPOlpZSbBewoLnd9vIEa1yU2duoQwQdUrlkR8sf5+pbq3IJL2l7LmzJABDAGF3mtL9Ol4yrvzMFHl9QECZJ/dsESsLH4FhAEkIf2QFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714343; c=relaxed/simple;
	bh=IPP4978znnBT+7XdoT2b281Vaw9mm1eJSch43ipMupU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJq6oOtJdcMVutnqqEfHg6HpqusGp2+GdgJUdU16hLg7XdT9uTdRpoFQ3ZGx/6VnTqThf83zHwHdLe439Yj5Oe61PMwCwa8/2RBSMNk2tICm+p9/cG1ZarEr5iMxEbVgi/TJia+Le4aSd34ovoHCemqhmogwYqMs47Pl9MoQcW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GkcNQ84c; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GkcNQ84c"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-235ae05d224so15837755ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 00:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714341; x=1750319141; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=x/r4HaILg277b3MgONbz0YWOe53JlF7XtF3YrZR19cU=;
        b=GkcNQ84cpt/gxvQ7yl/MToYw0Ik6GQTBjuXHt9vB6vy1eVzc0SDWtSOy0x6kv0g+xS
         eDJ2ncMg/6KfAjWwW07VLkn8VGI6A71ZcbX+VOFry/hd8/uZDHBm6xr/iAsg5As83OE2
         Zfss4u2clvLRo/f/4DMMehD9FjcCe0PbiUg2I0R5e7Gmnw/Cxg+Md0LYIqVxpxcyG7Bn
         BY1fFr8jgx3clqYGOx7m05uZ3jH2s3gbNtAyQZWoXJ0+aSvG2Uca9WxgYaCd7sQJtejC
         bJb8nm7m5FcKCG/uwlMTOiHpaJDLhFK4OnZ37ini7YnggqdEL2ecy0qmLxdsS8M734Eh
         usTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714341; x=1750319141;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x/r4HaILg277b3MgONbz0YWOe53JlF7XtF3YrZR19cU=;
        b=AF4i4dnjVnLj/Ec7Qd2ZIqOX8i7X3cFYEjtgQTi1NWosVH0nwZI+Q4cXAA/lv9cmyO
         Dcx9cd+C/0Aq2EQObbYK/YGgatVrjxWm2sOJiMp80FxaIPEI7aeOjjJVdW2fwVrhNFoW
         ao7BNVIAFsa72WjCv5iD9SgkQo+bNIAkADrbjxU8ywFXo8xaXiyQfT/2vRyupRpKmq0B
         MX9XGVz76IDNtuo5CG6THF1v45eEto79suheW/GZmrZiahGFgoMzJWrKmTFr8yM9vCeK
         kCDS4Ch1TyKpOvxHLHnZacV7ODEXwwKfMbJsWLj9ZLKKnToeKlSEgwIz+ZC21k4bW2IG
         WeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFN994a1E00sAVJ6RzMWtQEdTyi4V1xuzKnFbIbJoDXyKaOWzDSmuvx+VVligQUj9ij5s/t89J3jM3kPo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp/4Q3q8SV7/irH3eC8MtbW9iWpM/5FrTX6dQAAWOTp6ckxy8J
	smN1ibSuLZpLW/looVlWZCK9yLA5+EZr5OlQ6v9LQ9gBbQOpTc1vT21kUvQkZc06
X-Gm-Gg: ASbGncvkaaZ8m9A9nyWeCbkHg6z7PW9ewy0UFdUdCIzxd8ZjRy3W7x+CZQQUJTKWH7x
	WTEtiK7xZk1TBbQLdtEDK7G5Aop2fudQqE+RHeTor/vgJyiVmJRZ4mrO0OoNNS4gXd/DLd9q03U
	12FnOjI9HRo4uYsUE6jyUZPq1+su0qW4jVNvOVOh3ZD3FNSZdR/OZgk655OzlIdfHY8KkzaYY7A
	Ep44uBvXuGJlBtHvo8SHDKXwqDZJDXEws6Uxr7SA0nrwPQcsJOK+TvjyvuPenxwdUJwvE30LLBN
	QMQwfxzf66qDR87fERg98avkiOc6dQC3TKxCYyYffwtv0sb8lcoMKWMlvLUwyduuJMPvVzETPtT
	+9g==
X-Google-Smtp-Source: AGHT+IEkos/uNROJz/Zz+MX/GOvxBe9ubiY46UzkUMeDb5+z/xXrsj6/fN5COhHTycOGbND/qHF87A==
X-Received: by 2002:a17:903:3204:b0:235:efbb:9537 with SMTP id d9443c01a7336-2364cd01898mr36636945ad.3.1749714341403;
        Thu, 12 Jun 2025 00:45:41 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:2c7d:4ae3:493:2da6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e7031efsm7687285ad.188.2025.06.12.00.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:45:40 -0700 (PDT)
Date: Thu, 12 Jun 2025 15:45:36 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: John Stultz <jstultz@google.com>, tglx@linutronix.de, sboyd@kernel.org,
	linux-kernel@vger.kernel.org, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] clocksource: Utilize cpumask_next_wrap() to shrink code
 size
Message-ID: <aEqFoNGGu3eOKBEL@vaxr-BM6660-BM6360>
References: <20250611104506.2270561-1-richard120310@gmail.com>
 <CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com>
 <aEnTSuVy2Aq8jRk8@yury>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aEnTSuVy2Aq8jRk8@yury>

On Wed, Jun 11, 2025 at 03:04:42PM -0400, Yury Norov wrote:
> On Wed, Jun 11, 2025 at 11:35:13AM -0700, John Stultz wrote:
> > On Wed, Jun 11, 2025 at 3:45 AM I Hsin Cheng <richard120310@gmail.com> wrote:
> > >
> > > Simplify the procedure of CPU random selection under
> > > "clocksource_verify_choose_cpus()" with "cpumask_next_wrap()". The
> > > logic is still the same but with this change it can shrink the code size
> > > by 18 bytes and increase readability.
> > >
> > > $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> > > add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-18 (-18)
> > > Function                                     old     new   delta
> > > clocksource_verify_percpu                   1064    1046     -18
> > >
> > > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > > ---
> > >  kernel/time/clocksource.c | 4 +---
> > >  1 file changed, 1 insertion(+), 3 deletions(-)
> > >
> > > diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> > > index bb48498ebb5a..ab580873408b 100644
> > > --- a/kernel/time/clocksource.c
> > > +++ b/kernel/time/clocksource.c
> > > @@ -343,9 +343,7 @@ static void clocksource_verify_choose_cpus(void)
> > >          */
> > >         for (i = 1; i < n; i++) {
> > >                 cpu = get_random_u32_below(nr_cpu_ids);
> > > -               cpu = cpumask_next(cpu - 1, cpu_online_mask);
> > > -               if (cpu >= nr_cpu_ids)
> > > -                       cpu = cpumask_first(cpu_online_mask);
> > > +               cpu = cpumask_next_wrap(cpu - 1, cpu_online_mask);
> > >                 if (!WARN_ON_ONCE(cpu >= nr_cpu_ids))
> > >                         cpumask_set_cpu(cpu, &cpus_chosen);
> > >         }
> > 
> > I think Yury submitted the same change here recently:
> >   https://lore.kernel.org/lkml/20250607141106.563924-3-yury.norov@gmail.com/
> > 
> > Though, I think he has another iteration needed as Thomas had feedback
> > on the subject line.
> > 
> > The bloat-o-meter data is a nice inclusion here!
> > 
> > Yury: Would you be open to adapting I Hsin Cheng's commit message into
> > yours and adding them as co-author via the Co-developed-by: tag?
> > (Assuming I Hsin Cheng agrees - See
> > Documentation/process/submitting-patches.rst for how to do this
> > properly).
> 
> Yeah, bloat-o-meter report is good enough to add co-developed-by tag.
> I Hsin, do you agree?

Sure thing, so do I need to apply the tag myself or we'll follow Yury's
patch work?

Best regards,
I Hsin Cheng

