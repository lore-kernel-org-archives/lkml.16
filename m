Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D99238C12
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558335; cv=none; b=njclGrUyj/UhdXhBPxkcQ38/Zaz7CScp0cOhGMe6M1s8x9AGDPvauoWo+zEboBO4XdAZtwYv/utRLzQmyLvFnzpro+J/6/pW/p3n1B0F7OHd5rtgBAyIEw0GpJPmKpL9IQGWpxLjt6E5BFznzBWwHghfMcnyR/7kmDbn/Bt5tj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558335; c=relaxed/simple;
	bh=6TojZ78eEbxhRsuBRUuBMZf6SEaQ1t+9yVSxoCPVVQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l9hThCLlnhm1QMdv1bGIz6EcypezGvngwnrgW6sfDbjX79V8FnM4wp+2SXzS+3/VUzx5LG3gcWkjoJ11k/9VGVd8SrzDWu4Ju6sldPewzYbsgXhRX+xC6Yboi1IfogCwKR2bIOj6ItMdqsFYMQKJTR+Fn7grR/B3QK6vSLhTdv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TPvsPcQB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TPvsPcQB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-453634d8609so49855e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 08:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751558331; x=1752163131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CJaN7nbaO6lmM2Mxzm86rsAdldbhCFrvDwkgjL03x1A=;
        b=TPvsPcQBtsQ/mbEPgBEIzslCmWo230SVP/NmsQNJz+otsARABUPjGwzNMu4ONh1Off
         EjrcP58YtOg/8W9znosD54jKFb212u3Viv1NjYeL4ExzXpn4SEfKPNlVx8LOYUK2wWSF
         ofvz6Dlx/MMaOGtDmcBrqH60iCn88qW76sSkmF1bHyE9ulCdplj0zDDJgq9Kp44jwKbz
         7fKAjNWPY0ZdS8uSZLvcrg2ry5uJmxJdz38beSMc+KzaF1gcqI1xeTq87ikFKe8eIOGi
         hZUcDZlJHgA8hp+A5oubB916oBAv/L8i3FztnlQHLKsATbAL23kHJcXkd9hFBv3jLkvB
         0CaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751558331; x=1752163131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJaN7nbaO6lmM2Mxzm86rsAdldbhCFrvDwkgjL03x1A=;
        b=MAUuVo5e/F6xOQE7LE6mMPZZjGw1NxrkyGHzkphgrLlnOpBo1pC51Aw2cWh6BBXBh9
         MD+JcT86Hqvru0mCZ5joLyz9n71HsFN7gz0v4PtY2SSPGwA39Lm9x67wDvpjWfb8y7RC
         BiHhN+TmwNLNinlVs7hWzY8C/Y0mWxr1QKUYQGO5Tx5HZzLPh3UlQVXpeOdgoPkCtZp+
         CGLFxj/p+1YpYzYK4RvV0lLSUzOCOWRpQ3WgaBsBgKIAPlMtrFSN5YjJAN5kvHzt0x5X
         Sr3aqBL00K6qf8bXvEN3fnmhG9N4dyvcxBXhoM2uE+4vXqcHsKa9EEoMH0otRWFNuX3Y
         Nfqw==
X-Forwarded-Encrypted: i=1; AJvYcCWCmXirF2cq8qfBsOVwAGNDXTK/FQoACCZaiF+mfLT93Tj8M/jtzW7lBD46tWLBqsE7vjclEPB6Zdnit8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrITizgmQkQPtEApaXQoOoe5j7F+tFyjETI9BP2jXiVcEw1s4Z
	il9nuHrMO24KzSkFnKFIoi864s0VYLnj7I8fHy1tdfjpzZAqF1J3zCR8aWfGPUaMaz0=
X-Gm-Gg: ASbGncvShl8vKO8dcqXT5+RHrxx++wksFNx3c90Ej0m8MpMD24xKQg1+RXHejajAQWK
	TmVr7f4wwcx5NFls+dVtjjGBoUFNyz7MIJ0Nc8EPs4rHeLCpI8vdRzp+Ht390p29PibtiGqcTWU
	QCoTStpavK2GNrWRuCDwJWU8ez0H05MG1Sm9ClZvVKhjT/Nq72+XlS1GbToFxN6eucBi+FeTiMJ
	A9UJJqjQt45s5vix/NQAfhfMUkJYP/+hVAxTRaOWWKxWURPq6XfZuZ9/ng8JeJEg4lrAHxw9WKC
	5eEo2jjqQDL697i5o7CALLbnwtpL86Y/l/Q47MtLrfF/GPxWXxCVSSaYu4gqCAPP
X-Google-Smtp-Source: AGHT+IGOdqwh+prx1CMvKrozB3yHTxkvomqeSkFHf9OzqxVK+h2PONAOl4dn1TVwcAb/HP3myCfYHA==
X-Received: by 2002:a05:600c:820d:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-454ab368d5dmr35870815e9.6.1751558330555;
        Thu, 03 Jul 2025 08:58:50 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be5bbfsm29835925e9.34.2025.07.03.08.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:58:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 17:58:48 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH v2] selftests/cgroup: improve the accuracy of cpu.max
 tests
Message-ID: <l3sal6zkvo4lqnfs6fepxytnrmqmqwfvtxudnjm53oigtuatpd@7czfeursgwyh>
References: <20250701-kselftest-cgroup-fix-cpu-max-v1-0-049507ad6832@sony.com>
 <20250703120325.2905314-1-shashank.mahadasyam@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ctwb4begphfg7q3l"
Content-Disposition: inline
In-Reply-To: <20250703120325.2905314-1-shashank.mahadasyam@sony.com>


--ctwb4begphfg7q3l
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] selftests/cgroup: improve the accuracy of cpu.max
 tests
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 09:03:20PM +0900, Shashank Balaji <shashank.mahadas=
yam@sony.com> wrote:
> Current cpu.max tests (both the normal one and the nested one) are inaccu=
rate.
>=20
> They setup cpu.max with 1000 us quota and the default period (100,000 us).
> A cpu hog is run for a duration of 1s as per wall clock time. This corres=
ponds
> to 10 periods, hence an expected usage of 10,000 us. We want the measured
> usage (as per cpu.stat) to be close to 10,000 us.
>=20
> Previously, this approximate equality test was done by
> `!values_close(usage_usec, duration_usec, 95)`: if the absolute
> difference between usage_usec and duration_usec is greater than 95% of
> their sum, then we pass. This is problematic for two reasons:
>=20
> 1. Semantics: When one sees `values_close` they expect the error
>    percentage to be some small number, not 95. The intent behind using
> `values_close` is lost by using a high error percent such as 95. The
> intent it's actually going for is "values far".
>=20
> 2. Bound too wide: The condition translates to the following expression:
>=20
> 	|usage_usec - duration_usec| > (usage_usec + duration_usec)*0.95
>=20
>   	0.05*duration_usec > 1.95*usage_usec (usage < duration)
>=20
> 	usage_usec < 0.0257*duration_usec =3D 25,641 us
>=20
>    So, this condition passes as long as usage_usec is lower than 25,641
> us, while all we want is for it to be close to 10,000 us.
>=20
> Fix this by explicitly calcuating the expected usage duration based on the
> configured quota, default period, and the duration, and compare usage_usec
> and expected_usage_usec using values_close() with a 10% error margin.
>=20
> Also, use snprintf to get the quota string to write to cpu.max instead of
> hardcoding the quota, ensuring a single source of truth.
>=20
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
>=20
> ---
>=20
> Changes in v2:
> - Incorporate Michal's suggestions:
> 	- Merge two patches into one
> 	- Generate the quota string from the variable instead of hardcoding it
> 	- Use values_close() instead of labs()
> 	- Explicitly calculate expected_usage_usec
> - v1: https://lore.kernel.org/all/20250701-kselftest-cgroup-fix-cpu-max-v=
1-0-049507ad6832@sony.com/
> ---
>  tools/testing/selftests/cgroup/test_cpu.c | 63 ++++++++++++++++-------
>  1 file changed, 43 insertions(+), 20 deletions(-)


> -	user_usec =3D cg_read_key_long(cpucg, "cpu.stat", "user_usec");
> -	if (user_usec <=3D 0)
> +	if (usage_usec <=3D 0)
>  		goto cleanup;
> =20
> -	if (user_usec >=3D expected_usage_usec)
> -		goto cleanup;

I think this was a meaningful check. Not sure if dropped accidentally or
on purpose w/out explanation.

After that's addressed, feel free to add
Acked-by: Michal Koutn=FD <mkoutny@suse.com>


--ctwb4begphfg7q3l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGaotgAKCRB+PQLnlNv4
CEdaAP0XHWsChnbaP5kR0bs2fgV1QmnWmul24yC8kEn2cDlzUAD8C2S+dXKJJUMt
We9vCI1hRxJLPl7E7xFaqmhjWJ8dxQo=
=xHRi
-----END PGP SIGNATURE-----

--ctwb4begphfg7q3l--
