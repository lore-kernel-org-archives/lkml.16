Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDC30E831
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750381837; cv=none; b=dI40R1m7ZKz+eX1MlRuR/WDfQyMJDkcBl4Txn36Lza3YK5ZfYoX0txviyoJcKGmAvpWmwpCm1QtUl1g9goxGy1h/R3bUlxl0MH6oi4JU7z7+lE6v3q4Y1JZSS5AMsojG6qSveemFTRanooXYKU2mJtoBPPHBRwjpF7n0625JaoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750381837; c=relaxed/simple;
	bh=em9T7Qk6z8pDafzaKJ2HIhWzcrVRBQ1HXL9+3WBItRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvzaxx5YlaMoqUlITuWeoshm9Gax4qNwFEhsP5BJDk9fRgqd7ztdGfpR9VDz4HyoDCj2soLW2V7jdT6ShgHPTpgwUITusfMcgKBCV4ZvO+Z/affXBF0X6kcbps18JPm6M3P9qSnS5UTPDMclZOid+vWgH1snMkxoMHDDNScZKpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxRO0rFq; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxRO0rFq"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-748fe69a7baso968548b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750381835; x=1750986635; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1uU/OVQk3fFoQqKV3Oea8mGJxlA8CxtgqGDBA1duic=;
        b=XxRO0rFqDuX17C40w3uqO7tdhRGOjiBnk8x7EiE2t+7V+Le524V6F4Sn1zJQSOwkGn
         +ysWFyiNPZsAwpvhmR09+z7UABoO9WfhJb/jZg/ALZe/GxugbNsMrM+pmRp2FZho9dB6
         aYGA150ANRXmlv54bbbcHQ/8aFTWbrKzKs38dmQ9Ief1ySYJoOsYUhATh23P4rai1CRG
         GqKFQ97ZHKwGqUIU2F3P3UZnRyyuJb2w5dZ/eR3hMmoHganxT7mdiwiTHU4Rv/OF5UG5
         veQyM2IxvzDf+W29xWLnc1E1DaWEZC8ybEF2aukqlPJBlaDbe/awpypKkhsZTb+NWGmm
         Us7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750381835; x=1750986635;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1uU/OVQk3fFoQqKV3Oea8mGJxlA8CxtgqGDBA1duic=;
        b=eq+IX+VjttJsckkAEUSjlwizfoAGFBEmQfsMpcu4pFOouD1re22T37e8Mpfewh6TlX
         D4+qw4gEhIMrw98lbql3utCbaFI3ZntsKdTIz1Q4drKWuHHuPOYkn26tAq8PZzTtcXdv
         0CPzWkplRReXHMDVItD+UyuR41w+G+g3mqCmcokokhNmW+iEqcCviJDC268YMbnjsUMq
         1vsPyJ2as1VE0/sDeteu7lj0JxY074GPxkMjyjZHhoGnZlMnyriZV2QgRJKw1zvYUjgN
         N9iMe1c6WniobqOWk8aRJ3eDfaET2EHIzJGABGXoUKFbI3pk9dTK0VYVPyfABw4tv9Ob
         pH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUA5S7Gg7EGBBCr35iAzIjrU8ERgXhv+OVjr+TNJvfaaehD3DIfveHrsfGYpQl59dK1YRMNCV1kjBc6PrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzE94simioy5ZQFAkrZo3DnxXdV8iLaPp4iDan/DAf5fvZ110s9
	0kcNdaVjk7XCtdvdOTKYhApjTSUwIVbIdmxWuHlK+08JZuZLC/oaFVi4
X-Gm-Gg: ASbGncvl+W+t2AU96r0dBs/nS81e9EjfXcYyB7mvuwQZV069H9vegSNO8UYXt00Pmyw
	RehJmq6Rife3ZgJ2pEfC/myHSVEbDV8tGtr7l83ozdY40zrKMQV30j9Me91DGZH3xIxjctoFxOe
	tg92C9ut5xugzQQSgA/w4Dk0eV5z1DBT/JBL50xAKXNJix/RQfaU3F4krV+elQSoyoCzC8kYdKt
	ob04OJTafw4jswCYLBYOt2fDSsG6MpOS0gPCyJMs2Rje14zxyN5jy2UkXzXxgV0SulhQ2l94vGc
	/U5bVOqWyVjHYcCA5kAiW9ay0OOu0yOBw0g/xBRlTK7+0712frFQwpFh+l9Fi5bk6nPaFVM=
X-Google-Smtp-Source: AGHT+IFHA+d4DJAOsrphxIWdX459tFTjJ+LpSSvNm06COOEqcOetu1tKKvsCTVdGH/iPJn+Mz7jpmw==
X-Received: by 2002:a05:6a00:cd4:b0:748:e772:f952 with SMTP id d2e1a72fcca58-7490d651b3bmr1173053b3a.17.1750381834961;
        Thu, 19 Jun 2025 18:10:34 -0700 (PDT)
Received: from localhost ([202.43.239.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a49ea32sm804721b3a.60.2025.06.19.18.10.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jun 2025 18:10:34 -0700 (PDT)
Date: Fri, 20 Jun 2025 09:10:32 +0800
From: Jiazi Li <jqqlijiazi@gmail.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	"mingzhu.wang" <mingzhu.wang@transsion.com>
Subject: Re: [PATCH] kthread: update comment for __to_kthread
Message-ID: <20250620011032.GA6800@Jiazi.Li>
References: <20250619120104.4622-1-jqqlijiazi@gmail.com>
 <877c17zlcz.fsf@email.froward.int.ebiederm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877c17zlcz.fsf@email.froward.int.ebiederm.org>
User-Agent: Mutt/1.9.4 (2018-02-28)

On Thu, Jun 19, 2025 at 12:34:20PM -0500, Eric W. Biederman wrote:
> Jiazi Li <jqqlijiazi@gmail.com> writes:
> 
> > With commit 343f4c49f243 ("kthread: Don't allocate kthread_struct
> > for init and umh") and commit 753550eb0ce1 ("fork: Explicitly set
> > PF_KTHREAD"), umh task no longer have struct kthread and PF_KTHREAD flag.
> > Io_uring worker thread does not have PF_KTHREAD flag, but worker_private
> > is not null, so update comment for __to_kthread.
> 
> I agree the comment is a bit dated and can use being updated.
> 
> Removing the portion describing the exceptions for init and umh is good
> as they no longer apply.
> 
> However I don't think we want to go on about io_uring and whatever
> else winds up using p->worker_private as exceptions.  That will just
> mean the comment goes stale next time there is a change.
> 
> Can you update the comment to describe what the current rules
> are to detect is something is a kthread?
> 
> Perhaps:
>   *
>   * When "(p->flags & PF_KTHREAD)" is set the task is a kthread and will
>   * always remain a kthread.  For kthreads p->worker_private always
>   * points to a struct kthread.  For tasks that are not kthreads
>   * p->worker_private is used to point to other things.
>   *
>   * Return NULL for any task that is not a kthread.
>   */
> 
> Eric
> 
> 
Ok, thanks for your suggestion.
> > Signed-off-by: Jiazi Li <jqqlijiazi@gmail.com>
> > Signed-off-by: mingzhu.wang <mingzhu.wang@transsion.com>
> > ---
> >  kernel/kthread.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/kernel/kthread.c b/kernel/kthread.c
> > index 85fc068f0083..810cc244b81c 100644
> > --- a/kernel/kthread.c
> > +++ b/kernel/kthread.c
> > @@ -88,13 +88,9 @@ static inline struct kthread *to_kthread(struct task_struct *k)
> >  /*
> >   * Variant of to_kthread() that doesn't assume @p is a kthread.
> >   *
> > - * Per construction; when:
> > - *
> > - *   (p->flags & PF_KTHREAD) && p->worker_private
> > - *
> > - * the task is both a kthread and struct kthread is persistent. However
> > - * PF_KTHREAD on it's own is not, kernel_thread() can exec() (See umh.c and
> > - * begin_new_exec()).
> > + * For io_uring worker thread, p->worker_private point to io_worker
> > + * struct, but they do not have PF_KTHREAD flag.
> > + * Return NULL for such tasks.
> >   */
> >  static inline struct kthread *__to_kthread(struct task_struct *p)
> >  {
