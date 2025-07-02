Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0861224677B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459675; cv=none; b=EoZGtlIuui6esT5udH4sZQ/AcBpZ8iYtex6R+wxc/ZiHg0jFUOTvmUhhNv2xjg3g6F08VmojDwWT3iemdq+PCLuGyOLjEAcFIAC3JsO8iQPm3ppiVCWQTMnvFeecURMRPUAMuVSAGpm93Lm33nMmvkGbDfcQ1JFPuxWtvCb2ayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459675; c=relaxed/simple;
	bh=w4Nwr3rzBU8oAkSw6PUTnXCWYhJ7PZRyve2lIpVTSKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0ylIyPqtO/CnvA8GU42U6mWA0aTeWbCFooEO5Kfpc+FqUt4LP70fwN0y+g8aZVRE6AGKbnAlRlhwMRrxSQTIAHYFVn6ML4dA5i5p4aAGlawPe5ymgLROzZH3dXj3oGo867Tb1YiumVNFzsxrs+ZoZuBkwZKfhju5OKLpn3Rlvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OfaPKYw2; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OfaPKYw2"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso3441749f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 05:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751459672; x=1752064472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYauURT58UhCHylTptKqbdFltvK7gtU+BWTcrPEHD/Y=;
        b=OfaPKYw2cYcn/F5xoa+WPeE5QukO7X43r4yI/zGjhIlRFVN1/WcVa4CaKMdHRCW5wn
         NU7ILLUzmQPzN8yZ7QcGCFftv9uxl8qvVvqgDUH55Hh/HgKHEkYirh1SNfvbOMVTNpuE
         05Irdjn1+XK2Br63ppVnMjra6aXvCtVg3rCfq9PYfIaQaRyAH67FHaMm6oPBx8HtPZsu
         oWFl7mwrstoIwbajC9Gi2fRdoQhyHkzWjjVVscqEgl+w/zXrXBPnKrXbawdNh8LoNgRY
         e4s+6oo4KX9irznTFMh9QjDbILRcz/+VS9FUGNMX6oxnFw36Zbo+1qHUZnl3gLhgeXDL
         ALlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751459672; x=1752064472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYauURT58UhCHylTptKqbdFltvK7gtU+BWTcrPEHD/Y=;
        b=ZvVH0p54gTXcFdyK+lhRlSvnFMIvkuj2k4Ql3J5iEg3obgmIFCrntMBBc/TlcwHB3N
         8ennOVQjG6p/eXxepsnRjEGyuVsOJTscMNbuDm1Z1xgUgDnaAedqbPc0fPSYbkuoRFmE
         TFfW4NVNInADc4K8rLAeLjyV44A+dajl3bvLR/47GX8XQSA5chZnpU3BmIiy86m41qnc
         aOCNWODdCR2DgbW/hKjf16LQkuTeNTLAJ4ex1nXKCe6oeDKSmo6TpbyX9VFc2xCVPFP1
         6yNivm8asi5pWCD8nuka7knTOwb29VCOFB3n0qqBKnxCQpvqibveMP80Q9FDPjKSEjgZ
         1Ayg==
X-Forwarded-Encrypted: i=1; AJvYcCVi8ngbBi5eUJetKZUlXEgYF4ijbYnou7WCnERaZzpgHNuGlmSPK1/qb1c2Tm8UaLuMe4J10EqGKRHOico=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysm1vIx6hP9pAgu0kzwIkLmP0qZcbbqoYE9A9h/ocGawEfWZum
	SnJ/iAWYk7nViTXIboaikJMccNYa8WUrLzH9fhrEBdQYilYq/Ia3ush+HDh6wbTrCM4=
X-Gm-Gg: ASbGnctDBN7hqyK9pBMfOxJk3dD/WDrvLywrg0CsAECKhUAgILJFG1vVpqJVd8Oh2JR
	myu2DLDqvCsdCjdt9wqPB/I1NjnW8ZVQSaEjARtX9RxrI0WyvXFx1E1wV1Dc7BRcueS+E2HUHvN
	me56lBPvRtQMfael6csxH2hIZtCJnVABO5bN9lGTnHEXYoOX7uH4rCMIRtEJ3mXyxEnL3578Inv
	fE+xguMYJ8H1DJgWsH9BwdKwInXcBol0++gYrmWw3RpTfRm4zTBX+nsnunMIVtCTVgij1H4xfVv
	MxYW5t15ujGxfAMz6ukR0rVIXToBORa9+7YCaa8twAlpUISc+e0y7avrlCR+1HaB
X-Google-Smtp-Source: AGHT+IHpmwTSHq0ZYz8lQTm5DuVgf5H+LAptA4zeTr6a+ZP5dC8xfupiDfgs6zU9Ea25L7XoigSn+A==
X-Received: by 2002:a05:6000:26c7:b0:3a4:fbaf:3f99 with SMTP id ffacd0b85a97d-3b1fe4c8d71mr2056593f8f.13.1751459672276;
        Wed, 02 Jul 2025 05:34:32 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c80b5a3sm15800036f8f.40.2025.07.02.05.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 05:34:31 -0700 (PDT)
Date: Wed, 2 Jul 2025 14:34:29 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shashank Balaji <shashank.mahadasyam@sony.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Shinya Takumi <shinya.takumi@sony.com>
Subject: Re: [PATCH 0/2] selftests/cgroup: better bound for cpu.max tests
Message-ID: <4bqk62cqsv3b4sid76zf3jwvyswdym7bl5wf7r6ouwqvmmvsfv@qztfmjdd7nvc>
References: <20250701-kselftest-cgroup-fix-cpu-max-v1-0-049507ad6832@sony.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="smuhsidh4jj2dmo5"
Content-Disposition: inline
In-Reply-To: <20250701-kselftest-cgroup-fix-cpu-max-v1-0-049507ad6832@sony.com>


--smuhsidh4jj2dmo5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] selftests/cgroup: better bound for cpu.max tests
MIME-Version: 1.0

Hello Shashank.

On Tue, Jul 01, 2025 at 11:13:54PM +0900, Shashank Balaji <shashank.mahadas=
yam@sony.com> wrote:
> cpu.max selftests (both the normal one and the nested one) test the
> working of throttling by setting up cpu.max, running a cpu hog process
> for a specified duration, and comparing usage_usec as reported by
> cpu.stat with the duration of the cpu hog: they should be far enough.
>=20
> Currently, this is done by using values_close, which has two problems:
>=20
> 1. Semantic: values_close is used with an error percentage of 95%, which
>    one will not expect on seeing "values close". The intent it's
> actually going for is "values far".
>=20
> 2. Accuracy: the tests can pass even if usage_usec is upto around double
>    the expected amount. That's too high of a margin for usage_usec.
>=20
> Overall, this patchset improves the readability and accuracy of the
> cpu.max tests.
>=20
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

I think you're getting at an actual bug in the test definition.=20

I think that the test_cpucg_max should either run hog_cpus_timed with
CPU_HOG_CLOCK_PROCESS instead of CPU_HOG_CLOCK_WALL to make sense or the
expected_usage_usec should be defined with the configured quota in mind
(i.e. 1/100).  (The latter seems to make the test more natural.)

With such defined metrics, the asserted expression could be
	values_close(usage_usec, expected_usage_usec, 10)
based on your numbers, error is around 20% so our helper's argument is
roughly half of that. (I'd be fine even with err=3D20 to prevent some
false positives.)

I think those changes could even be in one patch but I leave that up to
you. My comment to your 2nd patch is that I'd like to stick to relative
errors and keep positive values_close() predicate that's used in other
selftests too. (But those 95% in the current code are clumsy given two
different qualities are compared.)

Thanks,
Michal

--smuhsidh4jj2dmo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGUnSQAKCRB+PQLnlNv4
CK12AQC617NY4Bgg95KOUtRUliBbD467q6iN7i8UX5uw1TDHPQD/YDZ9YQbLmR8s
aaGAL35x9nFcbe50VlfD5NyVDwbVugI=
=ntIR
-----END PGP SIGNATURE-----

--smuhsidh4jj2dmo5--
