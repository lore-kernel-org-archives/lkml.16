Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECF829291F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151429; cv=none; b=AzxeVe8zGDu6ArjkYuKdp6XDqvPuJnHIalxPtlyJfwzpWc0kHKLMY+oAna/ukimlNJgURJJASbPzZjf+C/URgh7JsxcvOFAMjFX4KsdGRTeUh0GRPudEmdoHZ2C+2OARTjB6isr2fnqLWuCugRBiMwAA8yXt3jJc16ZyXgfy2Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151429; c=relaxed/simple;
	bh=otoScECg61+ltEOPLG5w32zlzqXsj7xk7GQT57bBCA8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bzE1alK1+7pRYxqEuXYINd/s1BbppryqOppHH4ItkvGltGnDZOtV17wqlvqsHGqoHUdkxqXlBErAWhzVoTDmsXgAeL3wtHY1flZDXtK2u9u6OIZKrnyiCGP3BaBdswrjEGkoVmiwqWrf96ruwkJXsscmP8td66e2eNDsKACLf6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SjRmPx41; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SjRmPx41"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a525eee2e3so4134530f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750151425; x=1750756225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p85MWLRSl7tSClGDzgcJNqp9okEsiysUB+XfmcVwvTk=;
        b=SjRmPx41d23SlAcwWvdKpDTtvPybZ7nawwkf5nD+8YtM92oGGnCeMkIbLD5Yb4epCw
         7gC6oaAyyeDOP0R1nCiVuvQyawzDi3XRcDQ7/C5bdkb3/wxPgNEWQGs7bkjJQOJ14trc
         KfUzuDJMnt+aOEqbjyVP7vZ9pn4jnRr9DvL2YrKh1lZZx7o8YDfO05qGZhJZDwxOyPil
         mJkDeMu5rQU20HISKzy6o+rn0P//Sgh2aO3REdzMSex4DmoVxeJo0rBzj1QDbtqgMaME
         YOARyn0Ck8srvGtrfBGqjNWCt12e/ooPkr8hVGbTMKZAzZJ3eDrXPg3EzF3aydU+NQy8
         YJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151425; x=1750756225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p85MWLRSl7tSClGDzgcJNqp9okEsiysUB+XfmcVwvTk=;
        b=YH3cpO6Xc6vqRJkTbjUFpLF2PheP8kzMMZfNCpduOdKYjCf1f6x06jdjrWJPoWHPsx
         Obhb2AoWmPICD6Ph3VVEcmxyfUW9pbAMGEKRf3fcyAOA7X9+v0SIdBHXSQIUmhqRBTT7
         vO+KHK/k6k2xz7Diz7JcLDQVuLcidcxhQ7kpyMQx4iuxExpIpAJOq7/+xbl+pgZbDGZM
         WGWg2zANQV9cGiqWQxDP9/mOyLm9jkFAz/pFPNa/t0tC+1H1xQFKN64y6hHwY/rcjo/m
         7X0xpQ3g71KZkKNFGNk7tgQcCiOVhHX9U6zM4hA4owDfptKb2PT2rPvNAuDdBEIrQhF4
         SXqw==
X-Forwarded-Encrypted: i=1; AJvYcCWvZBCttFn3N2JdOyf28ypJUzLRVPpzGYKRBmVL6KDFWjaBxkHdyM4LR+GiI7sB0/yE0gevGItd5CtdfA8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/6oHjrvN9Ub1NufHJI/Hg7ozEq/rs121aSZO4y/buCvaMXeOX
	fXNiAj3tGs123SnmEJTzRC61kqlEE+IHQPH3y4eJRhj7XDjtS+cmduNY1vDHfkf42Wg=
X-Gm-Gg: ASbGnctg/AcQaNgba2kAZPYs0Tz3q1gs/K2qREN+9ERtzax4ow7e8fXAvsBBbB3haDe
	iZfaWONwP6kAQ5M+BMnjCdzeknQTBNue0Ng86mvmrqmjmSKKV0xed3C7x2agk/Ips/e6NTattMD
	HB9aep9tIsCcsOA8YwH5XGUMSEMvMOMkpVBAAv2kEXc4g4wqMuzR9H1HO23PEnXFZ2HpRAllv7X
	OHfvn4loQsQImfnNJ8Mb4XZQ001NdKpVPRvjc7EnC8frQ0DUVQimSHTBiqp1bO5Oa3/d4bHyFCT
	OE1/XOcl2MXMpsMea+/8cNTTPMUkEO9RnO25JdAo0e9KgPnVfcFAmhuFJNC/u0T1
X-Google-Smtp-Source: AGHT+IGhCrY1n0bCSGTojtFVhMrVZUB+uu0uVlbZ4FWlM9pGVwvZlgKGgNo60UlIBTF8KDhhsJtBWg==
X-Received: by 2002:a05:6000:2486:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3a5723978aamr10028419f8f.7.1750151425315;
        Tue, 17 Jun 2025 02:10:25 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e261ebdsm175226505e9.39.2025.06.17.02.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:10:24 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:10:23 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/3] cgroup: add lock guard support for others
Message-ID: <zgfcsd3rsaxrdqhu4kinv7fouurcy6gixsfavx4xx2op3sgynd@s7avawjn7sb4>
References: <20250606161841.44354-1-jemmywong512@gmail.com>
 <20250606161841.44354-4-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="z7ayi4izy43l2hlq"
Content-Disposition: inline
In-Reply-To: <20250606161841.44354-4-jemmywong512@gmail.com>


--z7ayi4izy43l2hlq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 3/3] cgroup: add lock guard support for others
MIME-Version: 1.0

On Sat, Jun 07, 2025 at 12:18:41AM +0800, Jemmy Wong <jemmywong512@gmail.co=
m> wrote:
> Signed-off-by: Jemmy Wong <jemmywong512@gmail.com>
>=20
> ---
>  kernel/cgroup/cgroup-internal.h |  8 ++--
>  kernel/cgroup/cgroup-v1.c       | 11 +++--
>  kernel/cgroup/cgroup.c          | 73 ++++++++++++---------------------
>  3 files changed, 35 insertions(+), 57 deletions(-)
>=20
> diff --git a/kernel/cgroup/cgroup-internal.h b/kernel/cgroup/cgroup-inter=
nal.h
> index b14e61c64a34..5430454d38ca 100644
> --- a/kernel/cgroup/cgroup-internal.h
> +++ b/kernel/cgroup/cgroup-internal.h
> @@ -198,8 +198,6 @@ void put_css_set_locked(struct css_set *cset);
> =20
>  static inline void put_css_set(struct css_set *cset)
>  {
> -	unsigned long flags;
> -
>  	/*
>  	 * Ensure that the refcount doesn't hit zero while any readers
>  	 * can see it. Similar to atomic_dec_and_lock(), but for an
> @@ -208,9 +206,9 @@ static inline void put_css_set(struct css_set *cset)
>  	if (refcount_dec_not_one(&cset->refcount))
>  		return;
> =20
> -	spin_lock_irqsave(&css_set_lock, flags);
> -	put_css_set_locked(cset);
> -	spin_unlock_irqrestore(&css_set_lock, flags);
> +	scoped_guard(spinlock_irqsave, &css_set_lock) {
> +		put_css_set_locked(cset);
> +	}
>  }

This should go to the css_set_lock patch.

>  /*
> diff --git a/kernel/cgroup/cgroup-v1.c b/kernel/cgroup/cgroup-v1.c
> index fcc2d474b470..91c6ba4e441d 100644
> --- a/kernel/cgroup/cgroup-v1.c
> +++ b/kernel/cgroup/cgroup-v1.c
> @@ -1291,7 +1291,6 @@ struct cgroup *task_get_cgroup1(struct task_struct =
*tsk, int hierarchy_id)
>  {
>  	struct cgroup *cgrp =3D ERR_PTR(-ENOENT);
>  	struct cgroup_root *root;
> -	unsigned long flags;
> =20
>  	guard(rcu)();
>  	for_each_root(root) {
> @@ -1300,11 +1299,11 @@ struct cgroup *task_get_cgroup1(struct task_struc=
t *tsk, int hierarchy_id)
>  			continue;
>  		if (root->hierarchy_id !=3D hierarchy_id)
>  			continue;
> -		spin_lock_irqsave(&css_set_lock, flags);
> -		cgrp =3D task_cgroup_from_root(tsk, root);
> -		if (!cgrp || !cgroup_tryget(cgrp))
> -			cgrp =3D ERR_PTR(-ENOENT);
> -		spin_unlock_irqrestore(&css_set_lock, flags);
> +		scoped_guard(spinlock_irqsave, &css_set_lock) {
> +			cgrp =3D task_cgroup_from_root(tsk, root);
> +			if (!cgrp || !cgroup_tryget(cgrp))
> +				cgrp =3D ERR_PTR(-ENOENT);
> +		}

Ditto.

>  		break;
>  	}
> =20
> diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
> index 46b677a066d1..ea98679b01e1 100644
> --- a/kernel/cgroup/cgroup.c
> +++ b/kernel/cgroup/cgroup.c
> @@ -335,28 +335,23 @@ static int cgroup_idr_alloc(struct idr *idr, void *=
ptr, int start, int end,
>  	int ret;
> =20
>  	idr_preload(gfp_mask);
> -	spin_lock_bh(&cgroup_idr_lock);
> -	ret =3D idr_alloc(idr, ptr, start, end, gfp_mask & ~__GFP_DIRECT_RECLAI=
M);
> -	spin_unlock_bh(&cgroup_idr_lock);
> +	scoped_guard(spinlock_bh, &cgroup_idr_lock) {
> +		ret =3D idr_alloc(idr, ptr, start, end, gfp_mask & ~__GFP_DIRECT_RECLA=
IM);
> +	}
>  	idr_preload_end();
>  	return ret;
>  }
> =20
>  static void *cgroup_idr_replace(struct idr *idr, void *ptr, int id)
>  {
> -	void *ret;
> -
> -	spin_lock_bh(&cgroup_idr_lock);
> -	ret =3D idr_replace(idr, ptr, id);
> -	spin_unlock_bh(&cgroup_idr_lock);
> -	return ret;
> +	guard(spinlock_bh)(&cgroup_idr_lock);
> +	return idr_replace(idr, ptr, id);
>  }
> =20
>  static void cgroup_idr_remove(struct idr *idr, int id)
>  {
> -	spin_lock_bh(&cgroup_idr_lock);
> +	guard(spinlock_bh)(&cgroup_idr_lock);
>  	idr_remove(idr, id);
> -	spin_unlock_bh(&cgroup_idr_lock);
>  }
> =20
>  static bool cgroup_has_tasks(struct cgroup *cgrp)
> @@ -583,20 +578,19 @@ struct cgroup_subsys_state *cgroup_get_e_css(struct=
 cgroup *cgrp,
>  	if (!CGROUP_HAS_SUBSYS_CONFIG)
>  		return NULL;
> =20
> -	rcu_read_lock();
> +	guard(rcu)();
> =20
>  	do {
>  		css =3D cgroup_css(cgrp, ss);
> =20
>  		if (css && css_tryget_online(css))
> -			goto out_unlock;
> +			return css;
>  		cgrp =3D cgroup_parent(cgrp);
>  	} while (cgrp);
> =20
>  	css =3D init_css_set.subsys[ss->id];
>  	css_get(css);
> -out_unlock:
> -	rcu_read_unlock();
> +
>  	return css;
>  }
>  EXPORT_SYMBOL_GPL(cgroup_get_e_css);

This should go to the RCU patch.

> @@ -1691,9 +1685,9 @@ static void cgroup_rm_file(struct cgroup *cgrp, con=
st struct cftype *cft)
>  		struct cgroup_subsys_state *css =3D cgroup_css(cgrp, cft->ss);
>  		struct cgroup_file *cfile =3D (void *)css + cft->file_offset;
> =20
> -		spin_lock_irq(&cgroup_file_kn_lock);
> -		cfile->kn =3D NULL;
> -		spin_unlock_irq(&cgroup_file_kn_lock);
> +		scoped_guard(spinlock_irq, &cgroup_file_kn_lock) {
> +			cfile->kn =3D NULL;
> +		}
> =20
>  		timer_delete_sync(&cfile->notify_timer);
>  	}
> @@ -4277,9 +4271,9 @@ static int cgroup_add_file(struct cgroup_subsys_sta=
te *css, struct cgroup *cgrp,
> =20
>  		timer_setup(&cfile->notify_timer, cgroup_file_notify_timer, 0);
> =20
> -		spin_lock_irq(&cgroup_file_kn_lock);
> -		cfile->kn =3D kn;
> -		spin_unlock_irq(&cgroup_file_kn_lock);
> +		scoped_guard(spinlock_irq, &cgroup_file_kn_lock) {
> +			cfile->kn =3D kn;
> +		}
>  	}
> =20
>  	return 0;
> @@ -4534,9 +4528,7 @@ int cgroup_add_legacy_cftypes(struct cgroup_subsys =
*ss, struct cftype *cfts)
>   */
>  void cgroup_file_notify(struct cgroup_file *cfile)
>  {
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&cgroup_file_kn_lock, flags);
> +	guard(spinlock_irqsave)(&cgroup_file_kn_lock);
>  	if (cfile->kn) {
>  		unsigned long last =3D cfile->notified_at;
>  		unsigned long next =3D last + CGROUP_FILE_NOTIFY_MIN_INTV;
> @@ -4548,7 +4540,6 @@ void cgroup_file_notify(struct cgroup_file *cfile)
>  			cfile->notified_at =3D jiffies;
>  		}
>  	}
> -	spin_unlock_irqrestore(&cgroup_file_kn_lock, flags);
>  }
> =20
>  /**
> @@ -4560,10 +4551,10 @@ void cgroup_file_show(struct cgroup_file *cfile, =
bool show)
>  {
>  	struct kernfs_node *kn;
> =20
> -	spin_lock_irq(&cgroup_file_kn_lock);
> -	kn =3D cfile->kn;
> -	kernfs_get(kn);
> -	spin_unlock_irq(&cgroup_file_kn_lock);
> +	scoped_guard(spinlock_irq, &cgroup_file_kn_lock) {
> +		kn =3D cfile->kn;
> +		kernfs_get(kn);
> +	}
> =20
>  	if (kn)
>  		kernfs_show(kn, show);
> @@ -4987,11 +4978,10 @@ static void css_task_iter_advance(struct css_task=
_iter *it)
>  void css_task_iter_start(struct cgroup_subsys_state *css, unsigned int f=
lags,
>  			 struct css_task_iter *it)
>  {
> -	unsigned long irqflags;
> =20
>  	memset(it, 0, sizeof(*it));
> =20
> -	spin_lock_irqsave(&css_set_lock, irqflags);
> +	guard(spinlock_irqsave)(&css_set_lock);
> =20
>  	it->ss =3D css->ss;
>  	it->flags =3D flags;
> @@ -5004,8 +4994,6 @@ void css_task_iter_start(struct cgroup_subsys_state=
 *css, unsigned int flags,
>  	it->cset_head =3D it->cset_pos;
> =20
>  	css_task_iter_advance(it);
> -
> -	spin_unlock_irqrestore(&css_set_lock, irqflags);
>  }
> =20

css_set_lock

>  /**
> @@ -5018,14 +5006,12 @@ void css_task_iter_start(struct cgroup_subsys_sta=
te *css, unsigned int flags,
>   */
>  struct task_struct *css_task_iter_next(struct css_task_iter *it)
>  {
> -	unsigned long irqflags;
> -
>  	if (it->cur_task) {
>  		put_task_struct(it->cur_task);
>  		it->cur_task =3D NULL;
>  	}
> =20
> -	spin_lock_irqsave(&css_set_lock, irqflags);
> +	guard(spinlock_irqsave)(&css_set_lock);
> =20
>  	/* @it may be half-advanced by skips, finish advancing */
>  	if (it->flags & CSS_TASK_ITER_SKIPPED)
> @@ -5038,8 +5024,6 @@ struct task_struct *css_task_iter_next(struct css_t=
ask_iter *it)
>  		css_task_iter_advance(it);
>  	}
> =20
> -	spin_unlock_irqrestore(&css_set_lock, irqflags);
> -
>  	return it->cur_task;
>  }
> =20

css_set_lock

> @@ -5051,13 +5035,10 @@ struct task_struct *css_task_iter_next(struct css=
_task_iter *it)
>   */
>  void css_task_iter_end(struct css_task_iter *it)
>  {
> -	unsigned long irqflags;
> -
>  	if (it->cur_cset) {
> -		spin_lock_irqsave(&css_set_lock, irqflags);
> +		guard(spinlock_irqsave)(&css_set_lock);
>  		list_del(&it->iters_node);
>  		put_css_set_locked(it->cur_cset);
> -		spin_unlock_irqrestore(&css_set_lock, irqflags);
>  	}
> =20
>  	if (it->cur_dcset)

css_set_lock

> @@ -6737,10 +6718,10 @@ void cgroup_post_fork(struct task_struct *child,
>  				 * too. Let's set the JOBCTL_TRAP_FREEZE jobctl bit to
>  				 * get the task into the frozen state.
>  				 */
> -				spin_lock(&child->sighand->siglock);
> -				WARN_ON_ONCE(child->frozen);
> -				child->jobctl |=3D JOBCTL_TRAP_FREEZE;
> -				spin_unlock(&child->sighand->siglock);
> +				scoped_guard(spinlock, &child->sighand->siglock) {
> +					WARN_ON_ONCE(child->frozen);
> +					child->jobctl |=3D JOBCTL_TRAP_FREEZE;
> +				}
> =20
>  				/*
>  				 * Calling cgroup_update_frozen() isn't required here,
> --=20
> 2.43.0
>=20

--z7ayi4izy43l2hlq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFEw/AAKCRB+PQLnlNv4
COhkAP0bs1P9uZ0S6HoPGA8hFuBWiun70gS3IVnF9IkbkChl9wEAnx1ut7HG6VwP
X4WQguNd0f9A30kzYGrpmar5SD6rdAg=
=GmHH
-----END PGP SIGNATURE-----

--z7ayi4izy43l2hlq--
