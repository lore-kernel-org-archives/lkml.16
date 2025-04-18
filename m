Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE14442C;
	Fri, 18 Apr 2025 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744935954; cv=none; b=QvGIx5q3IPNBhW3AbZKTW6A2kaxHw5TKfXtIlu11VoCAFdoLeb5CSWHdWyS5kIOuhnwC++JlgEuKgNvPXCt1Ap9GBRB6C2y8u2cQ6afXCZeaFI6vQl0n4kqifjoxMe1Q6o9RsLZ0TbWDDP9royYNup8AUvuQq2bDNMbu7sZXCsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744935954; c=relaxed/simple;
	bh=nzwuK9cUEP2hJaXFoIIQAnDI/7aAaFFrhOefDwr+Psc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u/1hfVFkjE/VfyE7uYvoLJdOcX+ssXPpWcv1RKk4RhjFrem/IPeOBr866mkzID9M/+Jsrhe0ZnOuzwFB7scSSIUuHhid9rCx7OrnELSCS7qmiMWmogHvQkU37+MMIP1ZxHM66mdNe6O5eD3hl7tsQD0GIlsdrol6aXdds6Zrn64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilfQURgB; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilfQURgB"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73712952e1cso1397609b3a.1;
        Thu, 17 Apr 2025 17:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744935952; x=1745540752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mJ4jcbq81h56GyVF6csHHKq2T3Y8+ueSpb7gECKDLyk=;
        b=ilfQURgBKm8qk6jQjvTvmPifX43xHwUG2JMhkxtP0XEFvgJgnZ2eVR8zt+jFhJdpad
         lzN7WVN/7PvNlXHyIcK3TxkWKrQkGC+mf944P0iiq5cwkN4Wn3xnlPRr9gUMbeUzAQDv
         6jbdvDaXYWzVwWnMe5v2otIVPU4Sm+Fr2kI3+FX21j1SnEfPIiXM4bZ//nAJ5q66e4HO
         NrOdsmeVxAcsOOuSu1QZIuluX5B5UV/pegNEIF3GyRp6lbWpBIE5XiSyBIdFzh5JsK82
         dXzUSvUM9bftboGgWmwJUrz7mck+EMgEey/q9seORSJ6+0xhgxR53MGUKb9hkPjmnO3k
         NMfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744935952; x=1745540752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJ4jcbq81h56GyVF6csHHKq2T3Y8+ueSpb7gECKDLyk=;
        b=XBYfU8OB/d8GSkylu+KkzvEHmGW7ABJ5rxLuBamha35Qj/40w1vPvvn70kd2F2z0ka
         9V6XjwW+EowAKc6CLOzwXjHmwc+KUVzUqoSOKC6ombQWzBYLk0ugmGztdnJsT/Rm2sLI
         xaIO4BDopsT0tOc5FHGvHir2riAMi0/uQsU6LYVQibqrvA1wrwCTseU1LkiGLNSaUh9X
         D8AvPUMQtPpoGzyz7qG52UebHqGMsmf6jsFSzYHm496Ybv3P/av6Jx3yFl9scBrYadhx
         XylFmm4lJQH+nx7hOF0kHz5RSKwPJOlYYJtC+fKhpg+fCl+td/r0J/ne134VZCmjR3he
         AO/A==
X-Forwarded-Encrypted: i=1; AJvYcCXS9fwoqlWz/Fq+/72iR6i56XQQBL93f3mGGJhXydvlh+NXz0kNcRp3q2tKM4jS7O9+ISYe7GHxn1Y=@vger.kernel.org, AJvYcCXTfvA7k28RnGZnhwq7UzW9QKhMuH6EnBNS+kReO3JtULNbDAL07f7hArLxdFMVF/fK8ORx/qvkSlpFzICT@vger.kernel.org
X-Gm-Message-State: AOJu0YyTqLoIXk8dLnAdBB8773IwE0BPCX9q0EdOG30P21cTCjdprZIQ
	yXEZbre4XVpdaVTBM7Z/zZpaMEl8N9C9+zRWieRKRgC1VgmYsBeX
X-Gm-Gg: ASbGnctY8jRfzMG2ps1xGt7S6iMVNfq4RMAtFuq5USDpXU2SBEgGsYWbXsLgvlfJOlx
	JQaGCrYnqBAMDv4ujl6qEvYQxFMHxF6KNs2PAZ0Of8dTlNYYIhOtelB26Ng26mk5Ohm5ZDd0Z8N
	M2qf1nSetO1yYEtFX3rgrDeWZr38ngGUvu+LJNDuuUpgHRwJtvbLmjIiQuC2QmG8yoJV1lhBU0X
	o/60R+aupN2Wzv11dQ5IgALcIs5kC1ZAR/4vFnZ7LFoeMJIttf0z1VmUK+GKkpcET202hh+aEwR
	zC8SryW/WeHGTlLii6JnLqYaWTQ5ZB0xjUTUvaNO
X-Google-Smtp-Source: AGHT+IF457L/xS2LzcclamN9a4c8rRGh3s9KFJiJf6ANJjnjPyle4Gdaennd13gdRi6cAZltMYOXtA==
X-Received: by 2002:a05:6a20:d485:b0:1f0:e42e:fb1d with SMTP id adf61e73a8af0-203cbd4513fmr1734877637.36.1744935951850;
        Thu, 17 Apr 2025 17:25:51 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13cd491sm451435a12.46.2025.04.17.17.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 17:25:50 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id C1D224209E46; Fri, 18 Apr 2025 07:25:47 +0700 (WIB)
Date: Fri, 18 Apr 2025 07:25:47 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] documentation: Add nodebugmon for arm64 platforms
Message-ID: <aAGcC2aKnoBmJSzf@archie.me>
References: <20250416062706.2735563-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="06WTJrvb1msiWFYT"
Content-Disposition: inline
In-Reply-To: <20250416062706.2735563-1-anshuman.khandual@arm.com>


--06WTJrvb1msiWFYT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 11:57:06AM +0530, Anshuman Khandual wrote:
> +	nodebugmon
> +			[HW,ARM64] Disable debug monitor
> +			Disables the debug monitor exception handling on the platform
> +			regardless whether breakpoints and watchpoints are programmed
> +			or not. This prevents debug exceptions from being enabled via
> +			MDSCR_EL1 register.

The wording looks good, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--06WTJrvb1msiWFYT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCaAGcBwAKCRD2uYlJVVFO
o+yMAPkB2tMzZI6yUPnbdQHMmL28aSDRE05XrotDef+vGPPIDQEA7f+GBQOHjK2y
myWpk48qlaeUUSbrp9IdgQcu8E02Wwc=
=I9oe
-----END PGP SIGNATURE-----

--06WTJrvb1msiWFYT--
