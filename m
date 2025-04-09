Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EC5D477
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744217783; cv=none; b=rwQvjN8QRQpc6MswM/mTOpzVhkn8kJmzNHK2U3tv2F9qn1tT+aaAri4bXJ/ZBAnPNYqnhidRatkEdsa9zClum8YTUNXYQHDGNK8JGyeKFsFuw6umjJiMxKPms5qFdXVcd/aAOJ8/FcEXAAwLDrzf791PDD1m7oSR6H4pvn211aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744217783; c=relaxed/simple;
	bh=CahJy6bgX2TLgx/3RS9Og1YqQekeZkWNYVidjSfotuY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rP5HSo7Pc8Sot/1a17uZYKB3FtYmw8tUVMxtQoOzlH0qyxw5u8GcXVOyR/zw8rkwTvvoUkkuNTLFuvwusmMYUnsqv0UIYqvVIceNp7sHnNwht2Oo0R0xpdbEVTPCdrkvf3SZiNi/xDPqTt7AQrJ/XzBKfu/35aqConZie9YPx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jaqj/Ea6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jaqj/Ea6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3965c995151so3617236f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744217780; x=1744822580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCygb0R9J4//K5NBuySZGPAIajaz7uNogxidzxnmh7I=;
        b=Jaqj/Ea66noBgWIMfDMKIPnxhOd4cUYDblRJcwIHZOhXg9UN7xSrpjMUrUuI8T3MIt
         av69PYIG/o+nT38AiOIkek7OaSoE+hNmLaugqb6hYylJaG8nNXAyxVxnQM06uhOXpqp0
         g1DYGmyNKCVxAskzpxNzb2Bh6U9NNfPXtmpg+6hOYpdt57zE++6nQqRRjvagNwpfEdwT
         h133wfuS912UY1mSxcu1+u1ci8XD+iTxSifd+ggu31QHWRN/HIOa2W2sfkpkw1bJnbmq
         uDwj+ylarVlQkNr8M8i4BF/gBDHg8vbdx/Kyrd5P2R84mYViqHgkkwHyKI9whV4kbCP2
         NC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744217780; x=1744822580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCygb0R9J4//K5NBuySZGPAIajaz7uNogxidzxnmh7I=;
        b=Nd2+q811ZyjsZtxKsdw3BULdArb9hvyN4GxF/FZbw/vO3oA9ZABChICm003PKYkQs1
         J1gC43VK9nuNaoru3XIV/vY9KNbLgMcOj0iSiUrr/AxvqAsYkk0XOkud/xQSQVf5NNzC
         lPc6vQnecALsV5xFa+kMZdkoQdOFW4mXqf88HOMLcY8wJ/ohHDSVaY48TWKLhkgfo9xk
         7i25tVgPzt4XgX5NpIuSnqMBdhpyYDQxruuOBC6qii8VrQffywiy2hFmNV5LXeXw/6V+
         rnwePTgbZDvsc1Obi4U2ipihWBy1+I5TDCeSsEjdHQuN65dpVtSJoHcX0DkpmzT4zNsl
         kk2A==
X-Forwarded-Encrypted: i=1; AJvYcCWh/GAc8bK3hsq+QvAsGY3XpLegEV893OPxnV9jdmRUcwKQJ0mfuYYKQaOKd9Dagkf7LNV1B0IeS3b5qYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7ykdrp9DrG/40bs3HwULpdyAxu8MbNEVfn62dYU9pZF0/EMF7
	ooxDsNtov703o5bPVq93LPCe3En749HmWjJVBWz64i94/XkbshFJ2rCRUsSAvQs=
X-Gm-Gg: ASbGncswVzvoSxCOvyHKIzTbVMpnRq6IF1VAzahS2cOhCmiXT/DsDPOOvWKaBIMW0xV
	48GJrNc13QxXXexVMzxWT/G0s3qfuvrcCtN9uN3MagcEuGflJUCmg+NK6oIeNORChUliA4Gij3g
	CZIgrqub+Nj+etyCE+PPWH1HT20W8emT9YLk3HabV8V3r4ac4MYS/aybHXGuEOXc6tPQwDq0M09
	xroSCMYc58oXWb8+hkwmLWIv1vK9MDW8TOEtOy1gC6xLSB25O+2UtfrDgYb0eD2s8BnQGxE4KZ3
	DKoLCNdFU0O3XaH2EAf2amg2D7iA8BAwLQ6SWRrlOOs=
X-Google-Smtp-Source: AGHT+IHPxSpc27gK9gTsJW2IMf1ahXoIOaZfnAb9plx5JSVsHQKEzviSNHHXsGI8r7rx1qPcS3QdDQ==
X-Received: by 2002:a05:6000:2901:b0:39a:c80b:8283 with SMTP id ffacd0b85a97d-39d87ab60f4mr3607872f8f.31.1744217779850;
        Wed, 09 Apr 2025 09:56:19 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d893fdf3bsm2083438f8f.83.2025.04.09.09.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 09:56:19 -0700 (PDT)
Date: Wed, 9 Apr 2025 18:56:17 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter-devel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, coreteam@netfilter.org, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	David Ahern <dsahern@kernel.org>, Tejun Heo <tj@kernel.org>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jakub Kicinski <kuba@kernel.org>, Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [PATCH v3 0/3] netfilter: Make xt_cgroup independent from net_cls
Message-ID: <o4q7vxrdblnuoiqbiw6qvb52bg5kb33helpfynphbbgt4bjttq@7344qly6lv5f>
References: <20250401115736.1046942-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="we4mrug4rvo3n7yf"
Content-Disposition: inline
In-Reply-To: <20250401115736.1046942-1-mkoutny@suse.com>


--we4mrug4rvo3n7yf
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] netfilter: Make xt_cgroup independent from net_cls
MIME-Version: 1.0

On Tue, Apr 01, 2025 at 01:57:29PM +0200, Michal Koutn=FD <mkoutny@suse.com=
> wrote:
> Changes from v2 (https://lore.kernel.org/r/20250305170935.80558-1-mkoutny=
@suse.com):
> - don't accept zero classid neither (Pablo N. A.)
> - eliminate code that might rely on comparison against zero with
>   !CONFIG_CGROUP_NET_CLASSID

Pablo, just to break possible dilemma with Tejun's routing [1], it makes
sense to me to route this series together via net(filter) git(s).

Also, let me (anyone) know should there be further remarks to this form.

Thanks,
Michal

[1] https://lore.kernel.org/all/Z-zqvmJFI3PkNl6R@slm.duckdns.org/

--we4mrug4rvo3n7yf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/amrQAKCRAt3Wney77B
Sc39AP99KtNaZNwm4vEZCKRSGG9ggne9YFgWlu/J/1H6QhWHhwEAlOeJU05ieaCW
NpbFj/MBd1Gk3x4gfipNegMDLyOinwA=
=mfjY
-----END PGP SIGNATURE-----

--we4mrug4rvo3n7yf--
