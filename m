Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82553236441
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795752; cv=none; b=uxAxzoUNSVMySBEC+5G+OG5Ex6RTxJe0Go1l8ttQ0o+XZcRoD0eCQ/6ItTcSxgHiPST11U2i7bxqP/DKv4pRYob4C5nsQerC/s8XWnWRIO6zmLfWPdh/HVou6XSFpKfC8TXis1IrzyRNTi5x2dUDMr51H9eazpoxVO1kDkVP5Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795752; c=relaxed/simple;
	bh=o55GeMY7B+wVncPex3pi9DLfKpWbxRoRoFGIzfLKFO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OA1rGfsn5Qk1Eys32nfPcaCEyDdth71Al5xlHOe+nLcP384aA7CIeAsu6I0afHZE9rWecNZVLmaNkAdkYajTfI0zJGdII8WzYPhuzwk+p2tzPXdfMAovMxRAOpCrQeQiFeTiUhOe1Us1TaKnL5URW3Gyj0+SS7sGHSckxbvuJ9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fapwU1Ms; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fapwU1Ms"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so5245605f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 02:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744795749; x=1745400549; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iwFMU/CIUfhwkOB23SUiFhp0ktZpZfT3Pn6auhe4gJE=;
        b=fapwU1MsfAEEj81+R76jC2w20mJDlmkAzf4VracvO5A+yRBGJYB6pSH9HH+Wgh7js8
         mjE7D6fzn2nqyR5DCJu+cVFDsE2fGMYEgTZ4P3lm44oXh+5hxESq/MYvU4k8WZ5MV/jI
         mzt3hFxOeQvSI7ZxDjqHMGhwDt0XnZ9+A55LWrizZMvE+fa1w7+IdWQrJwO0azZ1eX/L
         plvR9i0tK7+x62sqFgMDbZB+0T2jRSCuIYOpyuEh0OLAhO5r8il5DKA30ud8sUocn0wj
         PpbEbQISOGBs7cs329UGOtn3qMnPtPfSNnZ1RkEqF5N2SsqVoA6JXEoL+7qeWAPcx/QE
         aHxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795749; x=1745400549;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iwFMU/CIUfhwkOB23SUiFhp0ktZpZfT3Pn6auhe4gJE=;
        b=gn/aWA0ddBcp1xkMri6AQpwGUMpLebHwOBpPXKOzIMANVH2IxKkDSJqWwdkbUwjwNl
         2qZ/13hFnVhkc2+eKj2jY4IFmbXhTuhH+wM0WU4rqEUhZOWaegZhHSqZa50oqdpeQ+FN
         sAUbvzXzF3Vczw7mPSkeZYnr05xP6sdoB72Hga0qtvt/dX4rAI5q3M2rr0oVryb9G9nT
         sfhW2XcqYX/C5v1EOJDgMBtuglsNLdzDgdqkT5xo5wP01Yv+wttYFsMiURQe5iWlgLjj
         oZAzfRUDjKIeVnLPv500wu+mM6zSAW+61G9sX9zOTriKYibvBX6VT13e3Ihrkm7QqJiE
         GYaw==
X-Forwarded-Encrypted: i=1; AJvYcCXUC4PYq/zaU2wydGJF0PSJxP8y2DVCxNOrxoBAeF6GE6hP4XCthb65AqneHCSBG1vC9qV++rYBxIsD7G4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/T+lzGiRxfK3IHMfJzyj3xvnDQ+dfI4ctgFm+AhIX61VPo8K/
	fwgBYrEu72NR52Q5jDmqnn87bP+cHAPmfmIMHH6jFf72+TBqoZw9dJpW+oYvtRE=
X-Gm-Gg: ASbGnct6/DUIueofDTtB0eRVNI9XZtraFfRaYu1RoM90Y/6ogmP83ZhzKHAsKKt29dJ
	6snZuWOHrjh94z6p0DBvBDb+EZWh7fnBNJiYfKOUMWTezSxOjbRdKIyjAWu4fuZMexxAcPkqHxM
	oTBySQxEUriC4eknQCzUuwfYI+EhrovsrsvO9YdaNcj4JkIlonmiZ6LYFZNBN3L3cf2HbIBTI0U
	C/Rj4WjyStvVCuwRXdmDIUecahy0ktJFhx0Y0lUV1rBYfCyuCXBiFaap8NQ8qon4hKxeja22p3v
	AMy5io3szIeFXuodJ6Z09Pxd46nvTBjIHihzkvZuA64=
X-Google-Smtp-Source: AGHT+IHG24BI/s6GMoLVsPWuWiDfurxtiJ9IfZU2cz4E6a4f9Ru2A7MtNJxcyIrDsYjvapIyQSdlpg==
X-Received: by 2002:a5d:47ab:0:b0:391:4889:5045 with SMTP id ffacd0b85a97d-39ee5b8b916mr1140442f8f.36.1744795748587;
        Wed, 16 Apr 2025 02:29:08 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445315sm16542282f8f.82.2025.04.16.02.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:29:08 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:29:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] cgroup/cpuset-v1: Add missing support for
 cpuset_v2_mode
Message-ID: <575w7vjlpcvh4yfyvmiqnurenzhdcpdfwjwswb4kulbdimxtuy@pzgqw5aqhn3m>
References: <20250415235308.424643-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="va3lsphxxw3lwntv"
Content-Disposition: inline
In-Reply-To: <20250415235308.424643-1-tjmercier@google.com>


--va3lsphxxw3lwntv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] cgroup/cpuset-v1: Add missing support for
 cpuset_v2_mode
MIME-Version: 1.0

On Tue, Apr 15, 2025 at 11:53:07PM +0000, "T.J. Mercier" <tjmercier@google.=
com> wrote:
=2E..
>  kernel/cgroup/cgroup.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Acked-by: Michal Koutn=FD <mkoutny@suse.com>

--va3lsphxxw3lwntv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/94WQAKCRAt3Wney77B
SbSeAP9JkFLMSl4nksOMab6B62/csP+sac3doIRszWSDmJpZkwEAoCsPrJwLs2W8
otFloLpMdklEoCUND+I45f0k3ytzcAM=
=Kbk5
-----END PGP SIGNATURE-----

--va3lsphxxw3lwntv--
