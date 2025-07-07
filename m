Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473428C2C4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880235; cv=none; b=YwNhZdvRCTLNh9Rj5OHIdtBeDnp3XlvoWDDEuBNTKEOce3ORANnqmeAcUaHE3FhYp8zLev+Vfgp1z79sPqYUQoZkEQRRCo6rzFLuHWblxgR5kLSfmoqi7bengn6A26/4O/IXJ6tKTQrSvbLQTl0tWvfQS2SD46chq+/hepqM0hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880235; c=relaxed/simple;
	bh=k486wDDxfr0bcvDQG60f8tWDcYoRzeaxKBRKmoxQRu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGa/prUVIqCCwskX21ikwXrOlOalxLIaO4AvDsBB96ZcPwDe1i5aKtY3xhk/v1J0JyCQcVyQLlOf9hDVyZww/Ex+UUr1wqLirPs0CNXmq7t9TEzN04kMnkyzu4TM2D0JwkdL1NcVF4S/ZD4ppL3pt/GmB2VE6xPXxBK0zPuIdYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JJvAdifd; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JJvAdifd"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2445746f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751880231; x=1752485031; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FqKblBf6CUsGl/mCy2pm5G2S6HLKhv5qOw5Xqk6h5bI=;
        b=JJvAdifdCJS8gaL4vnr6imCCvgawj16Stw7XK8qBuYbfT99MQBe7p4BHiWKDnr7jAU
         fKtc7FxmolHHrPDRy7wLHcNMmkX54UJONHvILH+dPRLkDyHa/knZhK867UiCE2h/ou0i
         UdZeOL/hIDGzRyzCN4lumh+Oqsp9LGUIKXsY2S9e/XESLVXc3BghXI6zuMh+JhXcbXd5
         Ou8G5M+rfmLnOcVcgF9vGGp1RydnCvJKQDc/J0sv8ifWNkcjQQmmziMCs8YI19ZBuaxZ
         oJ1dT5rDy9dUuVx39HOzPY7wWdA5QLZxy+/KsVZhmfnJ0uCby85TLXrcM9CR3fIFrHvW
         +F7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751880231; x=1752485031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FqKblBf6CUsGl/mCy2pm5G2S6HLKhv5qOw5Xqk6h5bI=;
        b=IDyxA5AugwjpEUdgdEhk+yenBhn8Mjv4dfs3g6g7DY7PakvipjgXj/d1ibEJXmredv
         nmwjFLBoVz4f+7bqyVpgxwxPfunF/MmXG9ce8fWU4a3+4sNo0tpX1DDJbyRL/9L1kcnx
         tcX0Rt5PAl7rOTrysHUaTYfhJXG1lzdoDvPSx0YpmLxy9OJm6B2Bd1glXk2js4VZ0Fb1
         2wj1BlA1kAZIiD2c3kzZIhLhFHMGzo7dUGYBKgayj1cgQnOImHY23aP7ktfsA25oAjGe
         jo6Z06phy57clgjHgHIbWiv+0y26feyAlzbg+4OCL+5d31y2E0T9QKG3YzQLf1GyIPrR
         xhFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDogXrdVP8xBBiq805UvZ6Gdf2ykgkxlTDF/ynqqABb3xltLQBDJHkMreOc10/W/KtXdy+1X0qEX5hcYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVT+ANNjkTeYeIK+qEe4228AulQ3O21so+d9eM+mwde4KCpS/v
	J3nQZ7IUMaCheY4fYDnhJUHCP7UbMyBDlMHuJdDeIwqv+TelS4B0QsvqysCvJkqMqJ4=
X-Gm-Gg: ASbGncv8rGPjIDpCXy4v0m8k/qxHzQNnj6OFxMZ5QVtZF2+FGNF9M5a270mWA58zxWM
	/4nt+nCEzVz2/XPwrd8fRrWav5cQlMmA4chrXazHzBmqY2hpq12Xa0GDo09pdYm/1r/E83pFrH2
	ipUQJ3Nq4ts3B1Y/DBK8sqPVVpMtXXMlocNGgeJEiN6xV0OaK05f4sL680Ri8l7Q6/NEQoZdsrK
	PmIIG0Sw82xIEsLFSgojfij16uZ1pUVSYDg4fI+ltA8WdzFYSuG9D63RPnJ6TsFDiUgVs6Ni443
	VGitXKxCXhia2KQ8drGnNZK73XyHGIo91hj+CNHNYsWVSoP3mqXLKLamki+OzwVEwqGsZfbv4wo
	=
X-Google-Smtp-Source: AGHT+IHJrPNVBlcjf/0VEyIW2RxUb2n+reYTnzi8FGJY00p2BdD7RT52urYWmFfuCMqVzbeCW5Zitg==
X-Received: by 2002:a05:6000:2386:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b48f763f20mr9641920f8f.0.1751880231361;
        Mon, 07 Jul 2025 02:23:51 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1698e24sm105561945e9.34.2025.07.07.02.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 02:23:50 -0700 (PDT)
Date: Mon, 7 Jul 2025 11:23:49 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, JP Kobryn <inwardvessel@gmail.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Ying Huang <huang.ying.caritas@gmail.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, bpf@vger.kernel.org, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH v3] cgroup: llist: avoid memory tears for llist_node
Message-ID: <6isu4w3ri66t7kli43hpw4mehjvhipzndktbxrar3ttccap6jy@q2f2xdimxpga>
References: <20250704180804.3598503-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gsl2hznmnpg6a4vg"
Content-Disposition: inline
In-Reply-To: <20250704180804.3598503-1-shakeel.butt@linux.dev>


--gsl2hznmnpg6a4vg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3] cgroup: llist: avoid memory tears for llist_node
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 11:08:04AM -0700, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> More specifically the rstat updater and the flusher can race and cause
> a scenario where the stats updater skips adding the css to the
> lockless list but the flusher might not see those updates done by the
> skipped updater.  This is benign race and the subsequent flusher will
> flush those stats and at the moment there aren't any rstat users which
> are not fine with this kind of race.

Yes, the updaters and flushers has always been in a race.

> However some future user might want more stricter guarantee, so let's
> add appropriate comments to ease the job of future users.

I believe there should never be such (external) users as updaters
shouldn't be excluded by flushers in principle. (There is the exclusion
for bookkeeping the updated tree paths correctly though.)

So, thanks for the comments, one should be wary of them when considering
the update updated subtree.

Michal

--gsl2hznmnpg6a4vg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGuSIgAKCRB+PQLnlNv4
CI7wAP4u/qgZyNwgTwsnKQhklrdWHI6kyPoLqOFcM+dj1w9SpwD+IdhdgkfQ/WaU
LR0OIEBPOfWPYJAbpSSCgzEVBHFm8gc=
=Rpm6
-----END PGP SIGNATURE-----

--gsl2hznmnpg6a4vg--
