Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC49B2D3233
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532852; cv=none; b=Y4FWxG8mRs28F72wDWb0xTTCOEsIPKNnwIlMYVhX9b9aqH8T3Krw1uuOrwVT3ueJE2Wek3jY305Yn1hVq2DdCk8xvjA5GH5H6LShjsrwmwfsx/xRNuGWrsEi/9hgEdr0GoQmctHivKyK+1scibSrFPchIpMTfC2oEOasw1yvVME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532852; c=relaxed/simple;
	bh=JFKkpB5qKvKhZeE50RzRpYx/axTWHSjZ2/LQoUGc5R4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZbIqmmFruhV600xjQLbWMnOxRc/iP2E2JbOKY8em5XRop7/NffJUeUpDQEXPn1A4aUCfoOFL/ouGGJfMHn6eQT8sNkKOy6E1nB/kY7I2bL4aF/hTGCKt8ty+Ee/I2NvKa9kg1QR77YW7T4uln95mqpNEpcsywtSI2J9CThIobWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C8XaRpAt; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C8XaRpAt"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so4499411f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 01:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751532849; x=1752137649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0VYKYHeFNtZ2oFC545XbMVrPs46y5zmYyM5DegTCqAs=;
        b=C8XaRpAt5qHklIZcuos4uCqQrlsJQXQwWQkMCUHAoOJStTAC2XDZQDf3wQfNByC5Ar
         3B+GAb2AyuU8N3znZkD37FgTLi5cReKgTO6/+0ZUFV4Wmmx4+AxNjhAHhWVpfgryfVbM
         jmcmX9QGZTdfPRq/oWQQ2yzKzV4BgPeTYIJ1KwUokB0YN7JlD+ifNZqFFCn/93R3/NJa
         JQZGAekZb4nWYVZ4QHYCVh+8vKj2oM7hqdYCe6vUX3O5pGDFhy3ii4guayALt7eil2KJ
         DrqwoYePsZ4OYFrvJQHDW5Tfhm58g5bs2qvFENoCkhWlxf1UJccir4ezz4azm8U2Pvlb
         hy7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751532849; x=1752137649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VYKYHeFNtZ2oFC545XbMVrPs46y5zmYyM5DegTCqAs=;
        b=tv+gXZSBZuV+uoDfvUFy9tgRw9E3lZ0a6p0u6VOLVORy8r63oAfPOH5sItOgWKwB0L
         QnviHACuMaawNqNYj50UyReI4Z8zypubt3r1RYgbmam1MAUpxndN7WNf5FwtGjEsmmnA
         21G+Aq6pt0atxc3lFroNgjJaKYGPbIFEV1KPFug3H5VMCCctD+aX0OeP5ljbwz1VG60t
         H+8hs7CfoB0RZSSd7G5Z1EdQTVJsvJg4mfcWt+QXhVu+ySJabVGWnvjDROp9CaqbRofq
         cRVKaB6w5ShGA73oFDvdVAn2QY9Vo5RCzZN2o70ZJrWEdNG7HrpqxQHzy2JuQnWO1OMP
         WQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1HCmSrOmVjRF8281iKmHQ8A0tdThJJV/SWVst8K8Vo5UoNdN2y1uIA1vPZTCSyEnTpi+5u/KltUPksWo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoS9qW3spr/lV44qo8/ddWUiIgT18esfdafINFUNFTwZd/U5p9
	JB6T7U4ezVSlLwr2kHptJs04JY0XXj/dF/yTnSITgWeWdINcxx0T5bknoGBMRAsdlQ0=
X-Gm-Gg: ASbGncvbHekjFJsfStlRPY+ZKu1OFUvnmkVo7FmH6VV0Py4CibBUiS58H/iFAXvtAXO
	+Bee5PjY817W48jC5ycFqP6UGJ+Hp+4ZlaNmoUJ/b8gFOHv1pM0Z0bRX1TaCUtSdaybSdENnm13
	ENC0cfu6tOjNCUPoJKMoaghmskbnWYZcBTkteK2i4nLOAqdYrL7xZgjSYItA+aWKO+UtHGrICiy
	b+JxQYyBCSfY1sKjgWKaE/W3U/3yHbxRldPMBcZ71ujpfO2P13yoNXGzobwUS5UvhOAiTtUOPJf
	kRAN6EC+zVlvfqu7BCllMV3P05P9Zc6V1on9fyk9znmdSjQplK9dgf3dTDdNQzmV
X-Google-Smtp-Source: AGHT+IG6FCyNYgIa+hq5mjmcCPQf8t5hT+32twe1uG80evH2q41a1bXyNguqxgrUUjWMuX1FwBw3BQ==
X-Received: by 2002:a05:6000:2802:b0:3a4:dfc2:b9e1 with SMTP id ffacd0b85a97d-3b32b4277acmr1378083f8f.2.1751532849101;
        Thu, 03 Jul 2025 01:54:09 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fadf3sm18380658f8f.34.2025.07.03.01.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:54:08 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:54:06 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH 0/2] selftests/cgroup: better bound for cpu.max tests
Message-ID: <bhp3gwezbmseeqonh44qjauydis6wdqb7p6digf45hsssicufy@3az65qay67r5>
References: <20250701-kselftest-cgroup-fix-cpu-max-v1-0-049507ad6832@sony.com>
 <4bqk62cqsv3b4sid76zf3jwvyswdym7bl5wf7r6ouwqvmmvsfv@qztfmjdd7nvc>
 <aGXfvfKOjWlH3d0q@JPC00244420>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3xhm54cgfxwbj5xg"
Content-Disposition: inline
In-Reply-To: <aGXfvfKOjWlH3d0q@JPC00244420>


--3xhm54cgfxwbj5xg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] selftests/cgroup: better bound for cpu.max tests
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 10:41:17AM +0900, Shashank Balaji <shashank.mahadas=
yam@sony.com> wrote:
> Going with the more natural way of sticking to CPU_HOG_CLOCK_WALL, the
> second patch does calculate expected_usage_usec based on the configured
> quota, as the code comment explains. So I'm guessesing we're on the same =
page
> about this?

Yes, the expected_usage_usec in the 2nd patch is correct. (It'd be nicer
if the value calculated from the configured cpu.max and not typed out as
a literal that may diverge should be the cpu.max changed in the test.)

> Do you mean something like,
>=20
> 	if (values_close(usage_usec, expected_usage_usec, 10))
> 			goto cleanup;
>=20
> using the positive values_close() predicate. If so, I'm not sure I
> understand because if usage_usec and expected_usage_usec _are_ close,
> then we want the test to pass! We should be using the negative
> predicate.

I meant to use it the same way like test_memcontrol.c does, i.e.
values_close() <=3D> pass.

So codewise it boils down to (a negation, I see why the confusion):
 	if (!values_close(usage_usec, expected_usage_usec, 10))
 		goto cleanup;
	ret =3D KSFT_PASS;


Michal


--3xhm54cgfxwbj5xg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGZFJAAKCRB+PQLnlNv4
CAsXAP91rphar4H3mE6t/Y5+65v7hmlgTBLpdWtP/5RsUzy47QD+OUCtV48Uv0Ap
Bhys8HlODz9OB4yXGDV/QCY+ZNmZdQg=
=o8eK
-----END PGP SIGNATURE-----

--3xhm54cgfxwbj5xg--
