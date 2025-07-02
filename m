Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B633196A8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470813; cv=none; b=k/C7pUsaNf3FlAQ2StSCm/bJ1VuO8ybEWa6cQyVYkAlED4ghwVisXmsrCWS+bKyU37Wj3rrb2NATXPdXd3+1cCcr+nmEfVjtAOJw906D6crpkYcvAubuio8FHoXKHhfMyL4BWyLumezU4uuwzfhlp47mHi7LSNSHsV2AtXyF6kU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470813; c=relaxed/simple;
	bh=3leE4hJGTzOnIvybyYzVeLVcLwlH3jXFpp+iCxZd8d4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MQ1qDpgpUAyYiJwtK9fiizgP/KYNPRAfizjv3Kndp/5sAYubcZiNbkedCoX75XuCQ+y4+KI1SotfMlIOszP+9bqTXs98FlaUXTu3UHdKS0qKBYPIIIYEpZt8dfY6s+Car+auFc0iKH+30Y2CApUlyJ4KtjyiTKQ32r8MjAYcrGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=TYeS64cE; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="TYeS64cE"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a43afb04a7so32350891cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1751470809; x=1752075609; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BAXwYrzQQxC3az0StNvnncSbLnK+v9TAGG9M6gj4BwM=;
        b=TYeS64cEbFYo5moSc+SyZtlKUsXjdvl7vAPB4rJbhbX67ODMsT52TsFNg8idhz3Qqq
         o9YXzoWKJd517FOhSBGZnQiw3uNZoKl/gyXZ+5QJ3xF8tCRQJmfZfmPgz0MLImud5TOj
         Srdv3qCsRNavGyMfsRDW8Kev4si+sU4uFfk7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470809; x=1752075609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAXwYrzQQxC3az0StNvnncSbLnK+v9TAGG9M6gj4BwM=;
        b=jeAbYgTuPkioMTjD/WcjR5vKDoPq05DicycMjNMAfPzYl7wASD0yk+jUi26ieFEiVd
         B1DgkWM3aB5x8OSDzmcb9MfWbQHzx0th3pJEoKG55of6c4hCqBCn9vMXS+LaAu2OjugS
         wi6/3gYca2ntN2L+pjwSWAZ0qUOOlrrFo7Bv2HgAqMhCQInNXJ/+fmehahWw53ZXSpx+
         rLFE3Wm6x0e3XGDrpmcQHdNjev3F8P+HTb5o9yEAygocqlai2PR3MTEkb2K8VOx/cWG4
         1d8qVCGlbjFDufVLTqpDAbuwW4QU01xcspEzzfUYvls3oFUDj/nkSB9V6PseHbWmizFi
         AAPw==
X-Forwarded-Encrypted: i=1; AJvYcCVxGnXEQazKrSSnqezqsgR24FA1xNGiqZpYV0hx4YQkUcQ6Tko6/AWlHi/KhjDLAJs2/zFt1ceom9FpFok=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCHyiolpa03rnQgZZDVDCSI125t+PkGClx9YJHBH/MI+xzk1u
	FkwUolYtDoBpGKTU0N1J+dXRmTQAc2gsgN7WoQHwOtZ0fkJqKjtF0kbtS5h7DtpYj3nll6hhYKi
	H6eumVvZcee37fG4h21Z0aqb5R58nf5+jg0D+MQPEKA==
X-Gm-Gg: ASbGncsOFz+dmfyguLKbe+C7CDwwUhJzgpi3aIMmR5Ncxg7rWHqrA48BMCwwtV1RG/w
	V91owDnnZfICBBpU7XF5xYgvTGDVTwyKFRN7e7+iq/u6s7ukwp0Xf2gD14ueSSXceDaxGsEqwml
	J+MHa0c/P6fkOk/c0GmEb0toM2o2v3mcOYQ/ShqA3PxzHRz+OvbFU/RDVTaohiS82JbacaNLEUC
	6Vv
X-Google-Smtp-Source: AGHT+IFNsETd+DqArdws56o/Fjq7V5K7vMfImlLGHwvaIWT00CmQ085htrDrkxaeicglEyem8Wq2gfZsqXYSzAiISlA=
X-Received: by 2002:a05:622a:1889:b0:4a7:6f1e:6fa7 with SMTP id
 d75a77b69052e-4a97690acf4mr60762141cf.19.1751470809458; Wed, 02 Jul 2025
 08:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250520154203.31359-1-luis@igalia.com>
In-Reply-To: <20250520154203.31359-1-luis@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 2 Jul 2025 17:39:58 +0200
X-Gm-Features: Ac12FXz1-wpyaTIFNuFKATECNBotnEswf5YkN6Gav-8CiMX78wlEueoCNXNw21A
Message-ID: <CAJfpegue3szRGZs+ogvYjiVt0YUo-=e+hrj-r=8ZDy11Zgrt9w@mail.gmail.com>
Subject: Re: [PATCH v3] fuse: new workqueue to periodically invalidate expired dentries
To: Luis Henriques <luis@igalia.com>
Cc: Bernd Schubert <bernd@bsbernd.com>, Laura Promberger <laura.promberger@cern.ch>, 
	Dave Chinner <david@fromorbit.com>, Matt Harvey <mharvey@jumptrading.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 May 2025 at 17:42, Luis Henriques <luis@igalia.com> wrote:
>
> This patch adds a new module parameter 'inval_wq' which is used to start a
> workqueue to periodically invalidate expired dentries.  The value of this
> new parameter is the period, in seconds, of the workqueue.  When it is set,
> every new dentry will be added to an rbtree, sorted by the dentry's expiry
> time.
>
> When the workqueue is executed, it will check the dentries in this tree and
> invalidate them if:
>
>   - The dentry has timed-out, or if
>   - The connection epoch has been incremented.

I wonder, why not make the whole infrastructure global?  There's no
reason to have separate rb-trees and workqueues for each fuse
instance.  Contention on the lock would be worse, but it's bad as it
is, so need some solution, e.g. hashed lock, which is better done with
a single instance.

>
> The workqueue will run for, at most, 5 seconds each time.  It will
> reschedule itself if the dentries tree isn't empty.

It should check need_resched() instead.

> diff --git a/fs/fuse/dir.c b/fs/fuse/dir.c
> index 1fb0b15a6088..257ca2b36b94 100644
> --- a/fs/fuse/dir.c
> +++ b/fs/fuse/dir.c
> @@ -34,33 +34,153 @@ static void fuse_advise_use_readdirplus(struct inode *dir)
>         set_bit(FUSE_I_ADVISE_RDPLUS, &fi->state);
>  }
>
> -#if BITS_PER_LONG >= 64
> -static inline void __fuse_dentry_settime(struct dentry *entry, u64 time)
> +struct fuse_dentry {
> +       u64 time;
> +       struct rcu_head rcu;
> +       struct rb_node node;
> +       struct dentry *dentry;
> +};
> +

You lost the union with rcu_head.   Any other field is okay, none of
them matter in rcu protected code.  E.g.

struct fuse_dentry {
        u64 time;
        union {
                struct rcu_head rcu;
                struct rb_node node;
        };
        struct dentry *dentry;
};

Thanks,
Miklos
