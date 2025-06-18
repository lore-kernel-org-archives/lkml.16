Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361432550A9
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750237495; cv=none; b=JIXukyOWhXJgX0TMWiY0cWD8SVFCteoaYiLoqMM1uKtbE0wSWPNaSZF9ZfgiQzvx/z33W8KjI8KozkEJhDp3CTpW1t355ldLsNMoy2tXh4DGWrBGeRM9811LSQDGzE+DFB1PTlBwtHl0kg2JK6PLdEgM7N8FUJoukM0Hu38MhoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750237495; c=relaxed/simple;
	bh=YrKaAy38iz5URyCQDyb4pP3EYX9uBc7/3gotimG+KYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YHAXmCH4sDZxmA0MaI6iCQgccJQLfCT1UIV/kxIqwm0dUEHWCT7I27LyZnNiz2qc416UnNhdHWaLOEEuUioThrr38xqomasNDvG0RLv4eaKEXtAIHb1Q9FuDNB0KdG/l+N1VvaI43xJw7rQ4PaJKnxmTC/WFrsWFWDKZ6yRYPHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L6WGCDFt; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L6WGCDFt"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a57c8e247cso3163260f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 02:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750237491; x=1750842291; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gv14o3rhYSCR7Lylt3qG4iprEFfUfkaf9kxFp2mPYeA=;
        b=L6WGCDFtHNoFESliydPA0h8NSyj5aUNN2b0tY3s3gV1olJkYKTpB0H05rJOs7VF71Z
         k7w+n6JS0t7Zvtcb2A9e3Bx+mEHvJqictqLVNqP0fW7s835cEuli8mWPbDxfALF0RRXO
         gHZJ/7Xy/5QWjWf7+IuLE/9cJCwul6kr74hsbFB+3vggaTHysgGlpArm8dJzBNTn6pUr
         5PNBOQUSNxtSEIIUHfCFdc76WsxiW8i5MObSUJgsOwgIm/408auAWAFgy58Xc3QXbdsw
         7YSa8qoqrNS+ik6y9xzMqdSqZTUCeI72L5TS1bET5LcrhwukR7VYoiA5/Eiz2eeoznpP
         itnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750237491; x=1750842291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gv14o3rhYSCR7Lylt3qG4iprEFfUfkaf9kxFp2mPYeA=;
        b=AtxvRql5EDeGSJM4NUA5YrntpFD9Hep6ofcsyhkH9k3f8nCFWyfMV+/y57qvxuiYwA
         Y+pcVFnZEuhu8oCsYH9XjrwCT0HLVAHz5OgXAE1ZZOAn1UCLxVR/FBgqTxszmvUrmik3
         0Rz+F/x3aH5JvICTGOvxQWeqSCewXpcwgZL1RjZ1UGJ4A5OKpIY7b4ToT5pjDJEO8c0/
         XvfrPyXnrRZCNOAEWi7d84Vk2mIGgN0A6znR86ry4Km2PmkeYtnQajs2u+FQZr3Yt/Vf
         Q4+uwqpjh5cnrXFOSMGVE4JCh7gn65rBneYVJuo9c9gc6nj/8vDIAJww/7Y9bvxyeGzL
         U4ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBue59je71xktjw1u+vH4S8Ci8+oDRZx0czGUqIuzYLoezFdeAXTF1FW/5Rj0GIgnwHj9YpwLDX+ROwWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWkPre6LkEqVuTPkFpTqCqiL3BEuzjRyOag5YcsPe6PFvLfYH
	n0TK91IjW270AiZUE5HX9KnuIxUc5OSrJtCf7BCW/vw8Vs/y3MU0TQarQZ8FGRKunfc=
X-Gm-Gg: ASbGnctdSSBc1VjezVZVGPWAHaZEvXTwFRuPwxgp7gwx06CHZ10W+abOc0nxyuf4Odu
	kvfoV7avR53n0VqDV/DXxz3C2bekFoj0G6DRKmPAPN3zeHFloClbfL38uzBAhppxeYAXiFSgfnQ
	OajnX5eO318k24UL061R0i54SjEcGBHb4QIARgySeVOk8XhsbxClWPN4cgMiCOePjY/shaMfLrK
	6+f5rqhZR4e48OkpkPhrmnGnlh9Z4MwO+j/MRAvBynHdi1B65UTN65OFttf6qVtlVUJGwrnH+o+
	UjFIZOvjpW4X4YfJy9jC7JfgBhZfpRHUurVCloo2l9tBJYbZrKRVP+YMhiFOiBY1
X-Google-Smtp-Source: AGHT+IFeOWw0lXG4a6XXTyZ+Ni+NsjFyKjDpbATi7KwCxJv6p4hP1tFsL1bqbEFVfcFZVlIKEjCkGA==
X-Received: by 2002:a05:6000:2f88:b0:3a4:f8e9:cef2 with SMTP id ffacd0b85a97d-3a572e6be35mr13559664f8f.36.1750237491310;
        Wed, 18 Jun 2025 02:04:51 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b3c0d3sm16358933f8f.79.2025.06.18.02.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:04:50 -0700 (PDT)
Date: Wed, 18 Jun 2025 11:04:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Zhongkun He <hezhongkun.hzk@bytedance.com>
Cc: Tejun Heo <tj@kernel.org>, Waiman Long <llong@redhat.com>, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
Message-ID: <pkzbpeu7w6jc6tzijldiqutv4maft2nyfjsbmobpjfr5kkn27j@e6bflvg7mewi>
References: <8029d719-9dc2-4c7d-af71-4f6ae99fe256@redhat.com>
 <CACSyD1Mmt54dVRiBibcGsum_rRV=_SwP=dxioAxq=EDmPRnY2Q@mail.gmail.com>
 <aC4J9HDo2LKXYG6l@slm.duckdns.org>
 <CACSyD1MvwPT7i5_PnEp32seeb7X_svdCeFtN6neJ0=QPY1hDsw@mail.gmail.com>
 <aC90-jGtD_tJiP5K@slm.duckdns.org>
 <CACSyD1P+wuSP2jhMsLHBAXDxGoBkWzK54S5BRzh63yby4g0OHw@mail.gmail.com>
 <aDCnnd46qjAvoxZq@slm.duckdns.org>
 <CACSyD1OWe-PkUjmcTtbYCbLi3TrxNQd==-zjo4S9X5Ry3Gwbzg@mail.gmail.com>
 <x7wdhodqgp2qcwnwutuuedhe6iuzj2dqzhazallamsyzdxsf7k@n2tcicd4ai3u>
 <CACSyD1My_UJxhDHNjvRmTyNKHcxjhQr0_SH=wXrOFd+dYa0h4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5fd5vh6qqcct247c"
Content-Disposition: inline
In-Reply-To: <CACSyD1My_UJxhDHNjvRmTyNKHcxjhQr0_SH=wXrOFd+dYa0h4A@mail.gmail.com>


--5fd5vh6qqcct247c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [External] Re: [PATCH] cpuset: introduce non-blocking
 cpuset.mems setting option
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 10:46:02AM +0800, Zhongkun He <hezhongkun.hzk@bytedance.com> wrote:
> It is unnecessary to adjust memory affinity periodically from userspace,
> as it is a costly operation.

It'd be always costly when there's lots of data to migrate.

> Instead, we need to shrink cpuset.mems to explicitly specify the NUMA
> node from which newly allocated pages should come, and migrate the
> pages once in userspace slowly  or adjusted by numa balance.

IIUC, the issue is that there's no set_mempolicy(2) for 3rd party
threads (it only operates on current) OR that the migration path should
be optimized to avoid those latencies -- do you know what is the
contention point?

Thanks,
Michal

--5fd5vh6qqcct247c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFKBLwAKCRB+PQLnlNv4
CASjAP0VYu6p8wvLUhiihCm8ro3s7bzR1Nz4+lPHLRjwqONiTAD/XWemhhLumVN5
UQxjOamLKhzgHdochJGTz24+r+JMGgY=
=Y3Vh
-----END PGP SIGNATURE-----

--5fd5vh6qqcct247c--
