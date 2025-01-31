Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFF714B08A
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738316024; cv=none; b=TaYd7+6ICGEKCox0Ww92McWYyHS8la3/l2kFW+JyPZ6RXU0uD+4YVFgnGdGh+JB+kGJ83YPwBiFuy64CFq/EUYsVLMH5qgplq1f7nOOB43CUf4ym37KAbeJ26SKY9hUOMvlTl+rFSQfVUgkMcqPskZwVgPK59339O1ttO8DiXnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738316024; c=relaxed/simple;
	bh=9psyarGdV+Rf6x2zMJJATLHTqIUxMK5PgiUYtLsiP3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8wh3jO+GmP3W3h5daBguSVUkt1ifk7PqVB6qUNE2i6XaY1y02BpdfsnalgRSs0b1gAceXVi2kSauJJ1VHVk/tLdyFa26Jtau1WDY4kNCw0aX7exd4KNzjA5ACF2vY//Iv6UajrCdeck1M2ZUM3DgAeg0TsvVgWg3jAVlfjD9zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ENU7Qlu8; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ENU7Qlu8"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4363ae65100so19504325e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:33:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738316020; x=1738920820; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4jVAND7Ai4ETwfLpYMCrer3/CF37TNvowAyVGMzEzZ0=;
        b=ENU7Qlu8HPw5RPo6IR0rCRMab4aX6e1as5ErR5GbOwT8vrdQkFCdU1wEYLPWs+Dlyp
         4nQzfw8M8r6HEAjEmDSCycEk2VILJ2ULZP+Y4H+VbuJSToKPKjCZBu4SB42EWECPlZM7
         6O3jaDwYBwlAQwxKKDc2TmjUQ6L61zDBpggCiATfJrLC53mrBZ07h+tFI4ZlS64jn1PF
         fK4DY0WxJB2WBsF80D18wXgZNN7Tn7hK49L+gmzlErlwk1+ge3gjgHHjuTUnmVIbvGSH
         tnY05rMJ+nG9wLhZRtllHd0/k1LpyUeAY6Mc/ujx1P0vdWSXT1xKSLeJGVMLC/ib99g7
         vkjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738316020; x=1738920820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jVAND7Ai4ETwfLpYMCrer3/CF37TNvowAyVGMzEzZ0=;
        b=pzRAQSs2X1NRCUuNONMD2J2zavh8qBWSmfxAODytbKHmNJYKTvsRgd2g3BbDk+ro+y
         /rMH29TnbXqnlvu0xtfopnDa4s3Ace5jqKqdK1+OkvZBiqUgrADx7NCykK+0qOy/T6Lx
         xOfovFiSNXFokAx3O+df1Ld4vsbWOCbuOPq5YxkZe21ynl4U5Lr/gNuFAujrzKCBdY+F
         jXpo9YHHcgTYg4j+vzrnHm69Qo6WrUDZ/3Sfcy5DnkmwL+0sendU73t9+Glhg5f0dqK3
         a9kng2o55rphyHug+uvbc0D3qpCMgjvr5J9/CwxIwXYOzAawpCqwv2P6g7Lt0LFNFj1x
         s2pw==
X-Forwarded-Encrypted: i=1; AJvYcCUibqR+hx06jgfBCoO8si8pSjhP25wUXrNnF+btwtYUdJPA1rMHo5C4DcbfTBmfTDZkXxdXE3lNBXN35qk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWNrv9hxCkRmDo7Di+wrq4VPaPyQj14DYfk6meh4kqFOyVTTD
	j1n1jlrmVtFlz6njsJwEHdthc7RtjtjhlO6PO0b8pR3EyP69zsqnCsM+SE2MNix5pcDcL0SsFmS
	L
X-Gm-Gg: ASbGncv6AOhiuEcVDE1pnKlmqIL5jgTjKhPqlmTvzCt6aiJUcgSAoNQcqMFQEn+8IFK
	yEgwV67Sct3HTx4i8v3siLVhvCbwxT5X02O0iroF0zhzGpnTD2moC8Hb+APh1m8M6GPfVCnXf2g
	En3Z900pV1WFd/n+941Uq+DwEVlJKMPB7wEcZIBeC3kVsYte3vbvTcA0Dpx/LkehsGbkWcpSCAk
	kLh8+/tAwbP+HQCFd+ovArSdZv6tuh4/BMleLisF5J8WWCUWUlcAYiJ2wssdx4mQicsLDn7XdGl
	2rwWjHEOWuhBX+LY2g==
X-Google-Smtp-Source: AGHT+IEcJnDN7OyY4JFBguUKcLFVGFjVNtkB7wXSfnIUxmCyBN3PrLsgzDawFD8pqHavqueW1oz+Kw==
X-Received: by 2002:a5d:5f4d:0:b0:386:256c:8e59 with SMTP id ffacd0b85a97d-38c519378damr9845345f8f.3.1738316020544;
        Fri, 31 Jan 2025 01:33:40 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b576csm4227208f8f.63.2025.01.31.01.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 01:33:40 -0800 (PST)
Date: Fri, 31 Jan 2025 10:33:38 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Christian Brauner <brauner@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] cgroup: fix race between fork and cgroup.kill
Message-ID: <nsh73lyuoctjbeudj7o35jrkcygnfehhwj5dbf4u3hdvawx54v@nz6l2v5q2iin>
References: <20250131000542.1394856-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jtbw32lzcqctsvga"
Content-Disposition: inline
In-Reply-To: <20250131000542.1394856-1-shakeel.butt@linux.dev>


--jtbw32lzcqctsvga
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] cgroup: fix race between fork and cgroup.kill
MIME-Version: 1.0

On Thu, Jan 30, 2025 at 04:05:42PM -0800, Shakeel Butt <shakeel.butt@linux.=
dev> wrote:
> @@ -6668,6 +6668,7 @@ void cgroup_post_fork(struct task_struct *child,
>  		      struct kernel_clone_args *kargs)
>  	__releases(&cgroup_threadgroup_rwsem) __releases(&cgroup_mutex)
>  {
> +	unsigned int cgrp_kill_seq =3D 0;

This initialization is only needed for the extra "init tasks" branch
(the value should equal to whatever init_css_set.dfl_cgroup has, i.e.
0).

>  	unsigned long cgrp_flags =3D 0;
>  	bool kill =3D false;
>  	struct cgroup_subsys *ss;
> @@ -6681,10 +6682,13 @@ void cgroup_post_fork(struct task_struct *child,
> =20
>  	/* init tasks are special, only link regular threads */
>  	if (likely(child->pid)) {
> -		if (kargs->cgrp)
> +		if (kargs->cgrp) {
>  			cgrp_flags =3D kargs->cgrp->flags;
> -		else
> +			cgrp_kill_seq =3D kargs->cgrp->kill_seq;
> +		} else {

This should not be strictly necessary thanks to cgroup_mutex during
cgroup_kill and CLONE_INTO_CGROUP.

>  			cgrp_flags =3D cset->dfl_cgrp->flags;
> +			cgrp_kill_seq =3D cset->dfl_cgrp->kill_seq;
> +		}
> =20
>  		WARN_ON_ONCE(!list_empty(&child->cg_list));
>  		cset->nr_tasks++;
> @@ -6719,7 +6723,7 @@ void cgroup_post_fork(struct task_struct *child,
>  		 * child down right after we finished preparing it for
>  		 * userspace.
>  		 */
> -		kill =3D test_bit(CGRP_KILL, &cgrp_flags);
> +		kill =3D kargs->kill_seq !=3D cgrp_kill_seq;
>  	}
> =20
>  	spin_unlock_irq(&css_set_lock);

The above are only notes for better understanding, I don't think the fix
needs changes in that regard. Thanks

Reviewed-by: Michal Koutn=FD <mkoutny@suse.com>

--jtbw32lzcqctsvga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ5yY8AAKCRAt3Wney77B
SQxPAQC1JHFXydeDfUZtGe+DtusOXERhm1syeRw5oNET0yL2XAD+Nf/iWTkBn4wg
b3rL3A7T9sHALkkSEQ1pjPSeNQRmrgY=
=Wonb
-----END PGP SIGNATURE-----

--jtbw32lzcqctsvga--
