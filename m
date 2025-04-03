Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC46A254853
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 19:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743709796; cv=none; b=kquida8Xu8RTisZhhyVMqZS/l+4o+eluVVEPLmvksDK1J6II88ajgTCk9B9koVnSaK2xGfSy8PjaYU8qrVxgyCdH/vAP/Kq5EeXjlJFlkhTwGabZQkbT9QMuiyLsjlPmoOFK8Hs/6aib1GfYDKGiPF+DzBPUfdVfe9eJxDA+lRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743709796; c=relaxed/simple;
	bh=4k6PPlSzsnZZRkjeVGzLo0bJFjFgyMpZrMA0V0qavtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGLgU97+U9a8g4/d6e0b3VcGfMilEvFTeeRY53y0f4fSJ5FZOzNZWtVQdjrryx8iBtkpfuzjXDpMIdw1vqMR6SUkUQuh5Gc4EUcq7ZfrS7n7NrWu/BgVbFPFhnwbI9X5b1Z9Hs8jiJ3JS4CiTD/A3PHICfDN5U3Shyx3EiHBoeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OIBVjPGj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OIBVjPGj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso858085f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 12:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743709792; x=1744314592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eMantzy2s72seOmCcl9SpDsFXi5byVpuIAT7u7eYgNU=;
        b=OIBVjPGjNmZoBFuQF2qbHJxU/pGw9YCTQjq40iCAcw6CnOdqqMx1S8oUUGTERS2j1H
         +1vpBdS1Ngk9ci486Nk4Jbr3lbKCzUi5PBWSUjG24QwCHLyVqIReiUKXRyvx+aj2YTqD
         NnU5W2GcxUqzTcMW1J9TB8SMhv2hWs2t3UYYY4dK7QNCT4By/E3vx73BZkRu0fxGh8Gj
         gBLBMaqVapK5t/tlcxPWRMg+ozny99F+J/K0uxz/kZtf4PjQNiFv1BWItAsFtXJ73Uva
         YGZ0aibvyMhd2ZOnUGPkajSYUr0q/cQjG9Fp8o+iGoxQwDk31Xk4zyQHwSDNMkSQ6k6e
         vFsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743709792; x=1744314592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eMantzy2s72seOmCcl9SpDsFXi5byVpuIAT7u7eYgNU=;
        b=CX5hcWt/Gc9SC/CQjonTztdNPUThUdkL/St0PpncLDaPKW3SdvCy+o39kG/LSg5BO+
         dmypF/WBMZyzTiywgPgzIUt2JufSLM7iLzuDJ4eA/8qt4yDAps6cJhxsoR6gXpMfbdom
         Jdpf38m5U/L/HrqUjXY9aLZpQSOBwSZGz9c1Q4ALSijaCbgAnF0XI8szkRiHOXPSD/LR
         mir5v0Yb9BY6gHLbcLvSzbYoV81MbumE6IhnmQZPdC6hes5sjB8G0goEvxIFIQYxC0Zf
         13SsFfSZB0KJSQYmyYuhwIUMUxVAbLWLraiP+5M9LNuWAlr088aHZxgrIsREWfMArkoM
         lrqA==
X-Forwarded-Encrypted: i=1; AJvYcCWIoJDo1G8CszmMV8r1dGKKb8PeAqeX1mY9UvFzGCTnnNxI9JMYdRSSE0LNBQNB+8nFsB/6/4f76U3WDT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsRhJhcjLukQAd+rJxeNgxXebCQl5hKEKfOCdy/hvN4uie5esV
	aqU/LVSc7eoqJsqPn3y037IGdDK1ZAo+zvEVDlnmM6OY9ZcfiHq1zsMDYUvR4y4=
X-Gm-Gg: ASbGncsZUspyuOKAvBM4MJtOsFKzys1XaaMdr2aqiwjbVs2QvCc3DFnY5+aO8xQT5+m
	WpZeCXGaoJTIxSJMhONb4ddSKKFpBs5ONjZOoMrzMLvEO58J46t7I2SpGV6GD8A9wq1yi7ny1Tk
	POpXNbAEPPikOwKqvnLXjCtmj5ZAWs1gXah6X4rw7PteQsV153Qd1fqyOFiXFkGdJMOdLUH7QLT
	eaZlgoEi7ozPg05m8KnWoCqVuTNN2V0zzs5wtvEfGme6CmyUb4h7RjXtgE8cKPkmmoVfJAvdP0s
	QGI36ykvlcaOkwQsiUM+LaqC7Dr14Q+V5NgPxTJ9MdS9PZ5gYAp5rHucVgNUmXPpQQ==
X-Google-Smtp-Source: AGHT+IHz8+YVKnZDHNWuHQTnMwBCAJXrGqeDjBuxgEkh1ulItLUELMCnkYHOcOkcHzzQy7hOZoXLkA==
X-Received: by 2002:a05:6000:2512:b0:391:253b:405d with SMTP id ffacd0b85a97d-39d0de62927mr66671f8f.41.1743709791855;
        Thu, 03 Apr 2025 12:49:51 -0700 (PDT)
Received: from localhost (109-81-82-69.rct.o2.cz. [109.81.82.69])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c3020da49sm2517510f8f.80.2025.04.03.12.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 12:49:51 -0700 (PDT)
Date: Thu, 3 Apr 2025 21:49:50 +0200
From: Michal Hocko <mhocko@suse.com>
To: Kees Cook <kees@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>,
	Dave Chinner <david@fromorbit.com>,
	Yafang Shao <laoar.shao@gmail.com>,
	Harry Yoo <harry.yoo@oracle.com>, joel.granados@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, linux-mm@kvack.org,
	Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH] mm: kvmalloc: make kmalloc fast path real fast path
Message-ID: <Z-7mXukKN1eB_AQx@tiehlicka>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <Z-0gPqHVto7PgM1K@dread.disaster.area>
 <Z-0sjd8SEtldbxB1@tiehlicka>
 <zeuszr6ot5qdi46f5gvxa2c5efy4mc6eaea3au52nqnbhjek7o@l43ps2jtip7x>
 <Z-43Q__lSUta2IrM@tiehlicka>
 <Z-48K0OdNxZXcnkB@tiehlicka>
 <202504030920.EB65CCA2@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202504030920.EB65CCA2@keescook>

On Thu 03-04-25 09:21:50, Kees Cook wrote:
> On Thu, Apr 03, 2025 at 09:43:39AM +0200, Michal Hocko wrote:
[...]
> >  mm/slub.c | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/slub.c b/mm/slub.c
> > index b46f87662e71..2da40c2f6478 100644
> > --- a/mm/slub.c
> > +++ b/mm/slub.c
> > @@ -4972,14 +4972,16 @@ static gfp_t kmalloc_gfp_adjust(gfp_t flags, size_t size)
> >  	 * We want to attempt a large physically contiguous block first because
> >  	 * it is less likely to fragment multiple larger blocks and therefore
> >  	 * contribute to a long term fragmentation less than vmalloc fallback.
> > -	 * However make sure that larger requests are not too disruptive - no
> > -	 * OOM killer and no allocation failure warnings as we have a fallback.
> > +	 * However make sure that larger requests are not too disruptive - i.e.
> > +	 * do not direct reclaim unless physically continuous memory is preferred
> > +	 * (__GFP_RETRY_MAYFAIL mode). We still kick in kswapd/kcompactd to start
> > +	 * working in the background but the allocation itself.
> 
> I think a word is missing here? "...but do the allocation..." or
> "...allocation itself happens" ?

Thinking about this some more I would just cut this short and go with
"We still kick in kswapd/kcompactd to start working in the background"

Does that sound better?
-- 
Michal Hocko
SUSE Labs
