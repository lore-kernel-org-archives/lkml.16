Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C4827468
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749202505; cv=none; b=oJx1idxjCmXhyOJqmNtKlncUeiUw2PV+gQHZr4C4UbhufYhC1VWifekFaYDj+4UwUwYDAxxTLnB3rkHXZT4yNj75jmCFX6xQ4nDeZm4MdLe4e9z2FPOQBkL9r4de2wISt4jJwqV+NiS2xbDUfyISlPfwY1rZp7lRre8saHpspk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749202505; c=relaxed/simple;
	bh=WgAzWRE7She4otQlVJzaMK08pPPq7NcuL5CVfsMI03w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMdXikOaMsoGgs7X5lMny/JA5PsCCXhKDv7FHc04pIWSaiqLEZDUj+tNrj1btq1HbGwngIJJWpEeCP8Zdf9Lk5Pa5h/FoiNgoZsxxQa37idanb3Ztvw+JsvkZ0GA7bHcOr5y4YFGjhaa7OSZyDo3pQiL+hPxjsRtBqJrWdyXnhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MRA303t/; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MRA303t/"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cea01b9cso6049145e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 02:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749202501; x=1749807301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16WVU7r379wE285Rct5yNMoMsint6/gzKjFKMpi3cK4=;
        b=MRA303t/swoE9ZnEjcNKszLUaoKTtTpsMcjuwrh1eTyRuQM9/5DQxrqXzusY5nkSUo
         aC4F6+mDxqpx/xwFQBnhTYE4+2j7Zluj6mityfUKNvpawAywN/J0vGluT10eRsoD63h1
         igJ3oNbYznJK0IfYSfyZLzvzFok1+1/ku4Ri6J7SnyWpnsonEgB8vbTJuSs0yShF9k+t
         QArUuG6Bu0rauzo6OdxTQ623z7wiLnF+ZnN7jdy2VoQ+czBeAyLndH2Y0wfZvhDc0AlL
         rRKSJp2mvwjp5sgdfgoXzpEjgFSWSpfV0+bBOZA1Q8WXZnHDIG7Az/ThGjiM0bQiY1MY
         t/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749202501; x=1749807301;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16WVU7r379wE285Rct5yNMoMsint6/gzKjFKMpi3cK4=;
        b=iy0psKl55thLziD39OtoZU8tdYTgyzqkN3tJTxEZwzV2vSsO1jWOGsbmiLE9XajjGi
         VxeiqJLcPYXQGj1HLP9wi18eksQGojAH1+Fp/2LNqQR3tKQJi5aZ/Uz/t1j8KgDCreuu
         HZuDu3KtPK/W3CYLjsuVY9suTfIQVatn+EkXObHvh1lFyzTZjUZcEpxNWWlebk42Wqoq
         quMrFKnylUsRkNjqSkC+VVzxwUCg02ntT+ZopddFAkfjC+i/y6J6HYIFOBdlVL0jjWw/
         BsZ/qlPGlZcrj8FHPOj1/iRPN8DBHcFhTsgGg3yWylpzA/Bfi9VRP28wPD9SfAM0s90f
         earg==
X-Forwarded-Encrypted: i=1; AJvYcCX1gus9nVDRV5JR4L79jo7zJuO57vON4pQpgbNImn2DXAVzLRA6MgYTFAKpO6l4/sPt3nplvuImg9eDGdo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJHArgqmu9GBjjP10s6WjKjEcOOlRJj8t8/UDXKM31OgPBzM/
	vPSwbXtnI7tOIFF5GEcS3x1tpSnbhYU681SMQdGDD4IF/L5tLGiNC2AhpN5xvyYKndU=
X-Gm-Gg: ASbGncv6FMeyQU/XXfZ3v7I38Hd88Ej6kN8rRg8Ptesqm1A6qCoIG4tQbomP9d/jNj1
	Dybzc9JsYzKM77rVMs6SKOkB70YO7+P8ji6O3bOK2Qz/w4JNqUyM+S2MurUjfb4XeCWIdlWAdE0
	XS0MMDwm40QDlLQh5ZW1Y5eEB23ASv5kqhp5t2CMiy8QcfF4+m9cycYXCb9VNwVzDuqugc4VXq5
	zSEB3TjpuqGNXPRv05dPueCQX0nvAItG7OZLBB2pWYYsPQugp70bSgNGjyE9u1R0jDse/RVAEVE
	xH4R4NnvQWwxe7xaU7vNS1DViltNYpxvq6/CebEspKZTsGpG36sjrQ==
X-Google-Smtp-Source: AGHT+IEXrINuMkdEIP9xCA7rioc8ocp0d0MYKrrke+NTaRENXHWiMhnlDpotpkYsrzCiqFR7r81jXg==
X-Received: by 2002:a05:600c:4f0f:b0:43c:fa52:7d2d with SMTP id 5b1f17b1804b1-452014d74b6mr22334105e9.20.1749202500773;
        Fri, 06 Jun 2025 02:35:00 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9beasm14825415e9.22.2025.06.06.02.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:35:00 -0700 (PDT)
Date: Fri, 6 Jun 2025 11:34:58 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Jemmy Wong <jemmywong512@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0] cgroup: Add lock guard support
Message-ID: <fo5le4uonsrv24z5gikojq7hxwaqaidgco25pypnppk5h2czap@egdwx6yte4lf>
References: <20250605211053.19200-1-jemmywong512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ua3zb34t3kfdq7gf"
Content-Disposition: inline
In-Reply-To: <20250605211053.19200-1-jemmywong512@gmail.com>


--ua3zb34t3kfdq7gf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v0] cgroup: Add lock guard support
MIME-Version: 1.0

Hello.

On Fri, Jun 06, 2025 at 05:10:53AM +0800, Jemmy Wong <jemmywong512@gmail.co=
m> wrote:
> This change replaces manual lock acquisition and release with lock guards
> to improve code robustness and reduce the risk of lock mismanagement.
> No functional changes to the cgroup logic are introduced.

I like this.
Could you possible split it to individual commits to ease the review
for: cgroup_mutex, css_set_lock, RCU and the rest?

=2E..
> --- a/include/linux/cgroup.h
> +++ b/include/linux/cgroup.h
> @@ -382,6 +382,10 @@ static inline void cgroup_put(struct cgroup *cgrp)
> =20
>  extern struct mutex cgroup_mutex;
> =20
> +DEFINE_LOCK_GUARD_0(cgroup_mutex,
> +	mutex_lock(&cgroup_mutex),
> +	mutex_unlock(&cgroup_mutex))
> +
>  static inline void cgroup_lock(void)
>  {
>  	mutex_lock(&cgroup_mutex);
> @@ -656,6 +660,9 @@ struct cgroup *cgroup_get_from_id(u64 id);
>  struct cgroup_subsys_state;
>  struct cgroup;
> =20
> +extern struct mutex cgroup_mutex;

I assume this was because of the BPF code, which wouldn't be needed in
the end.

=2E..

Thanks,
Michal

--ua3zb34t3kfdq7gf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaEK2NgAKCRAt3Wney77B
SVT1AQCRa4xOZhTwPK9tNZnPZhJdBQ0U0Y4hWIj1hPsIJzCwcgD3Xdkw3M+MD4HW
muBCdmP7vHKczXzk4Fal9QO7O72gAg==
=8HJL
-----END PGP SIGNATURE-----

--ua3zb34t3kfdq7gf--
