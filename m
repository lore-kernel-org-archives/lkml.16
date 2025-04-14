Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89D28B50A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744655219; cv=none; b=MujwMAEWVrpBYPgPnWFllNGGyc7p/0MLcR5wuWKXJ9NjxsZMhUz/BZIMTVH8zJhDgEJmyp5cFTunC2zs8WhqSZt9RjLFrfT2uZD45INmRD45cNyZPl+5IDxgFMTD9hh4JtvM4TyszEzGxHyunt9h8CnWwetp4RyMoA1iFKWdDMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744655219; c=relaxed/simple;
	bh=xd5jcO/BnBVZ1KGnoNKPpwebkDQMkVngLYRvhQQPt7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AbCuc1WH5rjijE+zLSvn3OoVm+zBrnS8eb7hMI5arEBLXw/RdAW9BbSsEcsb+nE72QS6nOPJKFXnoo1mWw7wpP07IakAP8XjB29L65sNOUudyrzo6MoJyfjbFSTjuS75463IfspCkqivwYO57zGFeYO7ZuJYUPDRqBd5wKgLVzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BzbTPNFX; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BzbTPNFX"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3913d129c1aso3234937f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744655216; x=1745260016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xd5jcO/BnBVZ1KGnoNKPpwebkDQMkVngLYRvhQQPt7U=;
        b=BzbTPNFXo66w7ZzDCz75iXLFqT9z3TUMPExALvWfv442W5lZ8Cp0eP8gg3S6cwRcXy
         kdpM5GnwjQbR1nty9GJClOUxyyENshN7vEpkdTPrnnCstHjqaU96gYiBm2ti1i0DfQYb
         EkQ8pOZoIp/HSl/OottEP8vzjjMFA4bvfKhI29FVAKADzX3pagM56+jLCCGjMowis1XB
         Eq2APjdfKjN5WaiRu0ga4ZWJlTcggnnEnfrT9KT4MF7oLm9/eBuI8pSGjyYB2Yc8yDu8
         r4iPnVSsQutz/i+OUUiVCJiQ0sJnn4Pa/yJ5zPDWpb01eJOrslf+tt82dt/OEY1b2kn7
         rOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744655216; x=1745260016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xd5jcO/BnBVZ1KGnoNKPpwebkDQMkVngLYRvhQQPt7U=;
        b=H3fmU5JBSpiKAnE2Vf5E42qkOimHcoZgUp0IR4Y397IOAmGJny6cxZKRgUNLU+atHz
         UZIX79n3F/9RYQJasmy/16IvJ3qJp0b8ZRn2ocjjQUrv4eYnhkcDV/ON67pcFGMANGAQ
         UhJdofkmxcC9XCCQpsA5Zi0WQA75AxS7tI0OwYxT6zCC6J9UmJjQCRYIq2STze/ggp8t
         mSGYw+qqQnBNwo4csyDlWrNO3pzt/J3Eul2xdY0IS3f64NCeDmzjUpKXv9yTLZedEJYG
         7M7NAZB534vDRAdI90Ej+8MJgYfb/ZCmvx69oJU+M3Gkh5EdHBseQpvkqoW/RFkPk1fJ
         H2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVTc/7MGOBag5NHf4X7A4pGYPjP0l4Bu8sgMJ9ZXbDQByc4aV6k3Aj4amUEDF/EQB81SfSF8RXCGElXPlo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy00gadU3su71dQVtM+Ndq1nz3cnfriA8X4tzW+D2tj27nsHzDx
	MnFdWQAzhP3nRu6XXTqDeCxFtBVX0wQdTqMTOCjAlmBcsx3myM3sQpG4QjhiHi0=
X-Gm-Gg: ASbGnctOa2dIZiyYNSKNVR3ZUujB1Fo5JfDfCAMOj83VNnKwQLzhqXRRthNdg7QZCaz
	AZzLC0scagnHpd++GJpzDm36PNgA6D7D32icpCgPsJ2nhGKJTVtqeRlnLE/1M4Wi7QIAY/APXfo
	+afWBRqm5i5h/SGIK1KI3GnjD+dEh2lQcieE+eBtq6FnyaUR4+uJ8gMVesdw/khTXpWfr0b7QQ4
	0xUTPW4r8QXHwbPdnNbwnfnoydtyc6Co4eVevqWlvs87mzBOjO7oNNRtlt6IfDh2JZg9kazfkKQ
	L3bOFEyyidO9oslAOKAfO5wkc9m/Pby1JHEeSN86BcU=
X-Google-Smtp-Source: AGHT+IEgtFl79lgav6UWKkPN+8xkDBQnarv3nm1k6JqhcjfOJxYNuRFCM5qVW5DXBpugJOQoLYbwZw==
X-Received: by 2002:a05:6000:40c9:b0:39b:f44b:e176 with SMTP id ffacd0b85a97d-39edc32fee5mr331676f8f.24.1744655215559;
        Mon, 14 Apr 2025 11:26:55 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20626c0csm189776595e9.14.2025.04.14.11.26.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 11:26:55 -0700 (PDT)
Date: Mon, 14 Apr 2025 20:26:53 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Waiman Long <longman@redhat.com>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
Message-ID: <ysc4oguaisa7s5qvdevxyiqoerhmcvywhvfnmnpryaeookmjzc@667ethp4kp4p>
References: <20250414162842.3407796-1-tjmercier@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qatjcuy2nkc33ezb"
Content-Disposition: inline
In-Reply-To: <20250414162842.3407796-1-tjmercier@google.com>


--qatjcuy2nkc33ezb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] cgroup/cpuset-v1: Add missing support for cpuset_v2_mode
MIME-Version: 1.0

Hello.

On Mon, Apr 14, 2025 at 04:28:41PM +0000, "T.J. Mercier" <tjmercier@google.com> wrote:
> Add cgroup v1 parameter parsing to the cpuset filesystem type so that it
> works like the cgroup filesystem type:

Nothing against 'cpuset_v2_mode' for the cpuset_fs_type (when it's
available on cgroup v1) but isn't it too benevolent reusing all of
cgroup1_fs_parameters? AFAICS, this would allow overriding release agent
also for cpuset fs hierarchies among other options from
cgroup1_fs_parameters.

(This would likely end up with a separate .parse_param callback but I
think that's better than adding so many extra features to cpuset fs.)


Thanks,
Michal

--qatjcuy2nkc33ezb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/1TawAKCRAt3Wney77B
SeFhAP4o1uTFfPkkQOlsOgROOemLGJYDrUvCWIEij3sRqZQEJwD+Ltb/wknA2pcO
wBptU3n4FMcngZcezGJlb19l8MTA7gU=
=XJgl
-----END PGP SIGNATURE-----

--qatjcuy2nkc33ezb--
