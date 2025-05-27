Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56831F37C5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748339937; cv=none; b=t2Aw9/doNIXblI7mVykYWWSgWITxPsy2WUVAwWjqXD5/AO26aRg2WmPlzPwk7jdvEUWjCNyEw2/VJ2AgcKDkpx8wwHXaruJVmgGzRwbbxvrRplzTtjU+09zUnDcljcb7rv9tHYFKy+2T41I86cEE1isLWRZJEgVi/sxFmt2Q/yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748339937; c=relaxed/simple;
	bh=gPXYMkam9e7YUM5qKqIBAC+BmfBK97NM0JOhRxCvlVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDAWbQJlPseUCV/JngfDj9LHxrIo2ztfJ/xH+rUZC/RSCr+FgObjWfPDJqwv4jnjf7uB02oO+WBseYBJMEx+6NL+9iYcCG499jkkqRE+5lz431wFBtpG04G+qMpSMI5sFrt/Yah1h/hpou2QMqv7q+agYF2Q6DFphhQIAbgMsQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eEzg4l66; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eEzg4l66"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so43684015e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 02:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748339933; x=1748944733; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ovDeM7CFy59ro2G29zEI76iQj5LO8OiJCTjhuKqfgog=;
        b=eEzg4l66tQDN5pumWbXC13F9MqjmL8stt3aOAPNKrWn5mUs36jhHAb6D07pkKcFNQk
         jeqyA+vHBb08Pl7NFs/1PYhsnnMQH8Jam6wqKJA0/9vqcdD4grCjwx/XCdNTgEgsI6NO
         9zuVy0+rTIuV3unOb+1dVLFCBpl/qOENpDfvg9sBH1WFuzO9bS3FYFkB2GsH1H7WAcfM
         qqbhLL8BPgDfWaf0aUpsbZf1PnAEmWsp3G0zdg1SFNnnv2touQeIlNcrCjC1WpFjUm23
         P81ctXq7fhO9M1SIcC9MVEFV/7Rj3oN1p8315QYhBvlVPCPACw9yGUXBMdTMF2Ai1brF
         h7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748339933; x=1748944733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovDeM7CFy59ro2G29zEI76iQj5LO8OiJCTjhuKqfgog=;
        b=glqBNPyceeUCt1TbfV4weCF1yY5bSGHCvTPzasJelNnW64vmPNbbkNbp8wiMFh9hfr
         7H6ClBar/F7vIGMSG/V5lhlelCU5JcNvnO8PrwZ2zXvsTxfWrigohXKq9MXdz/x9uY37
         zcjzNxnwkIbOt/ve+jvBYY0gRNbbUAg42gaMdJ5Dgm6shwEAif6xxULBc50UGmWoTqPb
         9RG4V5w47lCuQJ5ghN78BxRuPwmrEARFPOcGYM06/kReKsjjyKNcEdkfYTiM308uSdsA
         txrl+ubmDS1FEdE218l4I4MqiG2NN5FnbUhTG/OWrUFXbSCAvtzXAEtcD0m+mPNc7Sar
         C0hg==
X-Forwarded-Encrypted: i=1; AJvYcCUFlWpMQPVdDCQCtVsIJFSuF9BAo0PM6e53d4LhEEDEEE1dPsvZ9IuKYdwJXAG8cwy+UX0YwNb8ylxjY3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI8J+4zrpdESBV2+l+CiuItnl+j25gGkpuDNnVRdksxNzqiarS
	9I35R922CbosjYjDDYvRchlFcGlkndnCl7MSrv+/zrxlcga/Cgf0GQuF7MJy9pbwZco=
X-Gm-Gg: ASbGncsZHx6WsQ7M4Gb1JvcYlwpnfipHRWbJAqzLhRxm+5D/Xpg9YKCT0Q3ZeKNrTKW
	fGcGQcO8rLGn3UMfBcztfO84Wrt+W0zC06xmVnrQ2dqP3Y6YXtx/MxprQSWwmaFnpILWtqvEP8+
	UUbPeintA+yz0RwZrzajp3dR0oRvd/CpAyHU+nUKJaPfS/oKQlVhPNJNFXPrWoTP4JJIGGJhujY
	B7xA06uLNm8EsWIQm+EXCPTik2u5zfaW6lrJg7IEp9CS9du4CFkPvTKUJZM7bjIWYe8pTODBvkI
	66TBLSQh35z6Rk8541cZ8HKfj5gxiJfq1ruaW0o+7ERRV3qSM2C3snFWvgaiOdr+
X-Google-Smtp-Source: AGHT+IFtwTUjZn2K0uyc0dB9w9W6AVN79yBgYpvErxn26uh2Ttzg6hAA9ZousEeaV8G5tSv1mKe7kA==
X-Received: by 2002:a05:600c:4e16:b0:43d:98e7:38dc with SMTP id 5b1f17b1804b1-44c917f674amr93208125e9.5.1748339932904;
        Tue, 27 May 2025 02:58:52 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcbe5c4edsm14789285e9.2.2025.05.27.02.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 02:58:52 -0700 (PDT)
Date: Tue, 27 May 2025 11:58:50 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Vishal Chourasia <vishalc@linux.ibm.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
Message-ID: <vzdrzqphpjnvrfynx7ajdrgfraavebig4edipde3kulxp2euqh@7p32zx7ql6k6>
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rntxf4t2quqmp4ym"
Content-Disposition: inline
In-Reply-To: <20250527085335.256045-2-vishalc@linux.ibm.com>


--rntxf4t2quqmp4ym
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
MIME-Version: 1.0

Hello.

On Tue, May 27, 2025 at 02:23:36PM +0530, Vishal Chourasia <vishalc@linux.i=
bm.com> wrote:
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -438,8 +438,8 @@ Controlling Controllers
>  Enabling and Disabling
>  ~~~~~~~~~~~~~~~~~~~~~~
> =20
> -Each cgroup has a "cgroup.controllers" file which lists all
> -controllers available for the cgroup to enable::
> +Each cgroup has a cgroup.controllers file, which lists all the controlle=
rs
> +available for that cgroup and which can be enabled for its children.
> =20
>    # cat cgroup.controllers
>    cpu io memory

Honestly, I see little difference between the two resulting formulations.
Could you perhaps add an example where the documentation confused you or
behavior was not what you expected based on the docs?

Thanks,
Michal

--rntxf4t2quqmp4ym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCaDWM2AAKCRAt3Wney77B
SehkAP4m2JBDAcWV7UZtGTJZhDwiZgZ5EpMBCX5UXgau7TpWXwEAyQspYhrq2elF
Wq/V7UC4bJzdkIoiXD3ldrzKriS6VgQ=
=vJ3L
-----END PGP SIGNATURE-----

--rntxf4t2quqmp4ym--
