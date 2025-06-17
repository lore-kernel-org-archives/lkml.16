Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F8928AAFE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151359; cv=none; b=lbwjUqnWnfCmVXZZkQpV0XdlAFLcV9ho1AzYAVODLNm6JZJko9GcJbS0OFs/uuvwWM6z7f6vc6h2CXvOhZPVaJXsC7+aYEDiiyrcd3vmzcw3BXhM1X/+lSbFTFKkHLtj6E9vmPh/vxloR7zvWyrvlbJYxcX7yl5GBflIhijKTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151359; c=relaxed/simple;
	bh=1EuzBJOTCRuTh+bXUhNXXsRstdjUOzQiLWRMoOTqmZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMI0ZBMOBB5FnzPZzEfrRNfSluTfnaYrEIk9+Y6RBQSmKWk64N+wfMaH4WcnW5NxMRyoY7jAYSZ9veC3OvDA8UnV1FtzLNh/M9c2Foolj+L6z0SVAtlEX5XoY/ruCTXsMSx4HDSnylsvDjSxuCO5k+4RItE/D0uSh0kwDniDfnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y0djug0p; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y0djug0p"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4530921461aso46420655e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750151355; x=1750756155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=67hmXdGYuBxuLUIzFKnoNocDhsxtxIrQkBw3JogtMN0=;
        b=Y0djug0pKpAXHSE/VS6fpBhf+tvkKX88RtcRVHK1bj4Z9g0eQOKmISkxfeGFoO9s+j
         Tiz289wX7T7tMb3kEJeyGBwcdIRHIHBDR48HYnvnUSWBKZyVLScSvatIxRP7oG1IL6a4
         69kJpBMVD6hhmxLkQHIteTTL7+WxI+0XIo8gSN3IVRzotBGKLDuzIVUQycBuJJ/V4D25
         qaTlBkBR4uCglqviHayXFhbUUygDnSQ8ApSOS2brOZguDE+Q+d1IswLQtwvAyIqN/M3N
         U31snEotvU5xJKuu8DEqjoF7eu8gb3y+lrnZUL19PSWpBS4K+iktcDB/T7/JCuL+Un7U
         hn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151355; x=1750756155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=67hmXdGYuBxuLUIzFKnoNocDhsxtxIrQkBw3JogtMN0=;
        b=XJTYKJ1/6F79+rsSefq3JruP4N/9nujTTyRKIlQZQLhCbMqwseAy0CvM/RvfFbwH9Z
         HCd0/7NyQWJzVmQEtSbvGN8pYjY9bQzAcdThOlrNOCZ6WXSbgMKmRXdQOqjlZm6RhGYb
         qoa9wxItfv+9Ei7CM1QMWkxUjklHBr5MvNu5fd7oZ554rskWaOfSVdOSKivF9dBUyXaJ
         VjgyoHS8ixyLLdkqXmxdgzgS+9ZD4CPLbC177si9GkF0OZV2vVQ5Qfq7sGx3WlBm09g8
         yhuILf6B75pPKhhpO7yFzay5tmIsrLaeLa6R8BO3/lh+bQYj9n6bhup7/QP0gdEt0721
         qArA==
X-Forwarded-Encrypted: i=1; AJvYcCWzD0vLZXtOO0HYW+f8Y+gasYWyKVyhKkxWswlhuHvE3dniVXW69ONPYEfGdaeq4Ib3hJCs1F8vdYCOjek=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnIctFhlICXELCw1IJqJm/rBFlJs9AxP5MIOo0St1uSrTLxpWi
	AjISlLnalK+yN/jGZmmDneCfk38GMvQgjWyRWuFJ2QBgBAQB0qfDdyW2I+SsBGv+oig=
X-Gm-Gg: ASbGnctg5gsoj2N6LHuyGLoDvkl1raQZb4w+rvZEPwMGAytAauuc9wd0eERIyq6KYG7
	VQWjMopa+RmAfewTVZ/yywFHElJsw6AJnYU4iPRTqIt7Qa+QRHh7hgj/OvOQ1a5GlP7r7oxlJq1
	dm5MvPBaIA70li3+zR/LWXDPY7mhpbNOv4+eyP7Lzzmy67LynExBucXVRVjrklTs7BWoDH0p87N
	xdeAx5Ksye1QHFSQ9rXDP+FK/O8UT0eRV9cv6ZjY2UOHUrYpCst5U7sw6OOBIQMoF+rdZ4zEDot
	6ek+ABWTcRnMuenqRF0BN+VVqwGyzTOAEVsMRd+gsxMF3HgkJNVJb4Mb7vJ92AzS
X-Google-Smtp-Source: AGHT+IHDLDoidxwK5Hm81mzEBaOuu2RD8Lte8EMwlWR3lvsilQqT7tB5ntDOfsObExewaMZ36iQ9AQ==
X-Received: by 2002:a05:600c:37c3:b0:43c:fe90:1279 with SMTP id 5b1f17b1804b1-453561ce33bmr274155e9.21.1750151355356;
        Tue, 17 Jun 2025 02:09:15 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2449f1sm173368565e9.23.2025.06.17.02.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:09:14 -0700 (PDT)
Date: Tue, 17 Jun 2025 11:09:13 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/3] cgroup: add lock guard support for cgroup_muetx
Message-ID: <o6i5idjcvyhkw3bgewr2qs2try2xm44wjlsfspolj7da3yc23n@g3x7wgiu3oyd>
References: <20250606161841.44354-1-jemmywong512@gmail.com>
 <20250606161841.44354-2-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nlaedpfqordpxuch"
Content-Disposition: inline
In-Reply-To: <20250606161841.44354-2-jemmywong512@gmail.com>


--nlaedpfqordpxuch
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/3] cgroup: add lock guard support for cgroup_muetx
MIME-Version: 1.0

(typo in subject)

On Sat, Jun 07, 2025 at 12:18:39AM +0800, Jemmy Wong <jemmywong512@gmail.co=
m> wrote:
=2E..
> @@ -5489,14 +5488,14 @@ static void css_free_rwork_fn(struct work_struct =
*work)
>  	}
>  }
> =20
> -static void css_release_work_fn(struct work_struct *work)
> +static inline void css_release_work_fn_locked(struct work_struct *work)
>  {
>  	struct cgroup_subsys_state *css =3D
>  		container_of(work, struct cgroup_subsys_state, destroy_work);
>  	struct cgroup_subsys *ss =3D css->ss;
>  	struct cgroup *cgrp =3D css->cgroup;
> =20
> -	cgroup_lock();
> +	guard(cgroup_mutex)();

I think this should use different name suffix than _locked to
distinguish it from traditional _locked functions that expect a lock
being held. E.g. *_locking? or __* (like __cgroup_task_count()).


--nlaedpfqordpxuch
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFEwtgAKCRB+PQLnlNv4
CE2FAQDjzMzoE3Fh2MUSlE0ouZynega55I7I/C0XccuIggos2AD/e7h1o2QgvMmi
6We6AzgU86/c5l04tFq8wfc4UYez8Q0=
=ZYxO
-----END PGP SIGNATURE-----

--nlaedpfqordpxuch--
