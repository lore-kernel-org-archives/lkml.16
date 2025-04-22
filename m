Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178161EA7C6
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 09:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745314289; cv=none; b=IYZ85Yjk3YGHHH7Eo5510MA+8Dlamqo8JzdveZVDD/7/Vc/RpGNb4+/BVWqL6U1T2AokgBjK49QLML8BFtZuE8dSUpiO7p/DPqwx4rVNDNP7PQqG6WhcwTH7oZV8eOtxvLWxkNpiRh2dv0FRcLktWAUtRt7IEelXh8rnqE5+6m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745314289; c=relaxed/simple;
	bh=V5iZrie0NfoNEv+CbNmUGa6+0H1z0sLCiVg0dRInIfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hVqJ3ex4oqMRx+ALpdU7dWmLZ6O2VWilv/1twoP3BTvL4hSQmGkBK6PY5pJilLB6x/NdlfP9F3rVeWwsuYVpnUs7p1pZAfh5Rz0FnaUrlFL2NbUJ7sFi8+voKSONPTCknhiB35T7UURyedc6xoUaFLvxn319zbFQZR8Mt4JJIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V4TTI9/S; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V4TTI9/S"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so562733266b.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 02:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745314285; x=1745919085; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V5iZrie0NfoNEv+CbNmUGa6+0H1z0sLCiVg0dRInIfI=;
        b=V4TTI9/SL+GBdIKfahDSV+IppAdIg4zLJh4lCkiJ3R8knSo0uMqtT+ltpF+9zbW31F
         wHg62cDtDTaAd1ub7NP/N+g9VyEOUb/Jlg35KJT1H1AwZDeO3Q9tfGzRFma4jyauMzxo
         A2zzE5PfpsXOd8VwrKRjUkhX3d3aDdvhsbRYtATTRJBXDM5k4vWoCKdtxnRlnB3r6C3A
         Fg/PI/Kh7HR0NLMtFK/lWo7qbcpY44p93kJ0snAy3VGoAgeT9/s0nycnB+0bB2H228BE
         tUZXezmu2rcrH9mZ6Ad8tWzZx50+cU7cOHCsqflnVyOR30SbhXdH7r+aeg/N2ER4VtMb
         fqFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745314285; x=1745919085;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5iZrie0NfoNEv+CbNmUGa6+0H1z0sLCiVg0dRInIfI=;
        b=UBnXsdh/rjO6cfueJohnp4HZ+eaWMZ8wY0OaXwCKDgogtMgqCadYnijUCSyReC60b5
         jG5PTWQCuPvtZk6aAsrwDCSmlk8wiQ8Lvd2pfHxvHfk/FlqjEeo/s76aD+6jtl9Oslto
         kiJrGoGpCALC2nrhKMyPT0v9SBOGKn9+fpd9BxAL5qX+2POmnF7ldfCdLkDrEknT3lg7
         AGvTTVGbOHOskge7kRLG1rGmy83iQ8lxYyFsk8z4b9Na99j48NPvSfsK3fzBNdbgRQM0
         wRv6JIIF1GRzjlXTi7h+haAV9xW2HA7mmda2vz0dZFWvdfnL5IfgsF8D101m+Tx1YrbW
         5ekQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVKJaqqmABNZKgGuTTYTw1bOLWOqftyFo8Pu10QlC/VR3BPeJxhQ6+J+TGqTh6qAqNciOw4jAUdNimzqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAZ+JJ5wHg+awfoRZFec2i6JejKdwIzD1Yuncs1mzUW2Vfzc86
	kLI6/ua60JpaQvlfrib+BZJw+DADuAjN6qiyrfQRacAuG3deDAYwm0KmddAy8QI=
X-Gm-Gg: ASbGncsoFBY2wYpZo8N/pM0VKpS2uMfZ7hmp1gKbQdgzV7dS5UT9ukyUn6B9V7H8T4a
	BKNWXCGt4G+SV/wofCOS4XLcEkMxpxtC1uO1A1D4kVl/BhvGl0h/v3Te5L592bwDiV2RP6oMqzy
	oVimpvIH/3Q6TncArhWoqkedDKcz6s7gzt85HH/VwlopGmJFSKsgDXPJg8xrBegwQIJu8xgMeyH
	dzVqlsGYOPlZ7JfLeF4yBl7TdDatnl+WaViQPAHTEjYOrNgt8MoiitzZFfSMcDZG+HQhu9xKq8Y
	6VjkVDXQEb01WmXtE08Ua7GMJF8hKvtambdy1VrwbD8=
X-Google-Smtp-Source: AGHT+IEVRJF5sF7x1XS+lNM+Im1WgkH5x+/F/q2jlZU7fETD+EEwteY/YCeGUBJhZQKnxR2YU7TZDw==
X-Received: by 2002:a17:906:5d5:b0:acb:8a2c:fcdb with SMTP id a640c23a62f3a-acb8a2d110cmr880090566b.38.1745314285271;
        Tue, 22 Apr 2025 02:31:25 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6efa5c5asm627390666b.166.2025.04.22.02.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 02:31:24 -0700 (PDT)
Date: Tue, 22 Apr 2025 11:31:23 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Yosry Ahmed <yosry.ahmed@linux.dev>, Tejun Heo <tj@kernel.org>, 
	Greg Thelen <gthelen@google.com>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v2] memcg: introduce non-blocking limit setting option
Message-ID: <jqlq7y3bco4r3jpth23ymf7ghrtxbvc2kthvbqjahlkzsl4mik@euvvqaygeafd>
References: <20250419183545.1982187-1-shakeel.butt@linux.dev>
 <20250422-daumen-ozonbelastung-93d90ca81dfa@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i2qhcekndg5mr4b5"
Content-Disposition: inline
In-Reply-To: <20250422-daumen-ozonbelastung-93d90ca81dfa@brauner>


--i2qhcekndg5mr4b5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] memcg: introduce non-blocking limit setting option
MIME-Version: 1.0

On Tue, Apr 22, 2025 at 11:23:17AM +0200, Christian Brauner <brauner@kernel=
=2Eorg> wrote:
> As written this isn't restricted to admin processes though, no? So any
> unprivileged container can open that file O_NONBLOCK and avoid
> synchronous reclaim?
>=20
> Which might be fine I have no idea but it's something to explicitly
> point out=20

It occurred to me as well but I think this is fine -- changing the
limits of a container is (should be) a privileged operation already
(ensured by file permissions at opening).
IOW, this doesn't allow bypassing the limits to anyone who couldn't have
been able to change them already.

Michal

--i2qhcekndg5mr4b5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaAdh2wAKCRAt3Wney77B
SV5jAQDVSm6Ja4jGC2yTv6E/hAxyTENttqmaX3cnbiAR/btTsAD+NHYf2vRtgkRC
wioHPKWvbJ4uZJ+rnc/qtRcKN2hyhgo=
=b8xl
-----END PGP SIGNATURE-----

--i2qhcekndg5mr4b5--
