Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7C22505C6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743687235; cv=none; b=K9ZPbOtubmlCCl4xENHh/kcGkZ0xAzlPlMj7qpXBdiUOkT1h2HGLZU3yaoeq2T03dPgH/2gADonQFmWoRK/ByDTPi6UalPzeJgxtRZoVNyEIwlL4AMaNW2SY3eJ/KhKnTS8YgV//Ty6csvBROHvarm7WHzNC7f7FcG2ox4a+SEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743687235; c=relaxed/simple;
	bh=Q07mWvgDiSZF+9VUo0WcTnHiHZHGL0kzb9D3hs8lea4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QReBSXV1UUrztYdkUt+GOjCxm+P4PpqLhs5nXiERn9Uf8mu2r5O6PC7FyzT6IVzYd59sOFw5lkbc6rEYurOJhqBY9pg0phUxyBaflDQ30Q6FDg/SO7W3Ng+t0C1EOIgYVFsJt/Ls8jmGRVNp34erb8dCWutPXoarQOCIVMcm6+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LfzWIVBo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LfzWIVBo"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso570594f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743687230; x=1744292030; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb/KD7IWlOthI8ejHCX33gR2BZkT9SE1o2UTiT51BYM=;
        b=LfzWIVBohE3rdoNwFpKbYWfTxDM12NPk/H0nZWVO748r0S9rQn2wt5iW9p7d3G4xD5
         wXF1Z3QrQRGp20OtFnBIo6StQifkwHXX4+inBWfj9pSHtDrzkLabPUMsQHOCRPIkDe2+
         7USNC7AcRj5YzmxSFVs30DRZSLyOcM+DDYUoDLWgtCSEqalLCnXYU7+PyCZErbqn0/UQ
         jiqfQSoE8Or6XUiwdV+drlmQJByKNbCf8hpDnoMIE4GM5eahqvHBTeBvvK/vlnZ3yuH2
         QZYoZvG+Wa8l5/a1eOl5cyX3RPvH+3Wjbu8FJmXnnIksKoqwSxFx9yPCJYgLRwmhucD/
         Vigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743687230; x=1744292030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb/KD7IWlOthI8ejHCX33gR2BZkT9SE1o2UTiT51BYM=;
        b=XYU/+4sDkJTdVpCbUm90FkFt4Glkayn8Im/gJWJbRSxfn8EkKuUzimQ4MFwkLSOrjc
         gvbaXrRYp3dB1clPumjJWFG0tx9Extun0Kh9e9+/q1XfRfjljiB64ZuGzWaRi3SyCtG0
         Igrm2d1dXROpClflqvpthnQDSiG2JXKjNAtJRTRHN4yoHu/qNRUU6X7w3jgyuVKtE1t3
         PrhTGD+bIDzxi4NZLRsvBnvcH+xvGWIkFOmBCcz/lgB01fFMmgNmy5c2QZrOJf3MeTj/
         7PZ4LKwBb4xt93GRG96l+ez1AEAyqbVK0f8U35YDKc+m6Z9hEV4nLDONZaNwGMobQuLE
         O1fQ==
X-Forwarded-Encrypted: i=1; AJvYcCU86L2AYsDpgwNHZnOFyonoarjjx4YtiBTTSUpg6f0y7X5S0g6yhe3BvW8d4J6Wq0LjjEVnEoIe7WUMzyg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYnLSPg8Bs0yHzCCXU9vZUSw6j0d13uCy0ugnGeV5/M/RxENFb
	XF8wOxZoAm79R36DRCduvPuzyumv80ilbwFit3av/bRwpkg1+Q8GiwnnQz0Alus=
X-Gm-Gg: ASbGncscjbgxAgoEsEVqLni9uaVba8Ra6wEzbfoKgxQS5U0Xm0WkDsYx7f1XO92RcJZ
	8oJjqTQi7qupc3bPdlK/fBYCe+VsKs8NDbUh7NYr1ivZAcp/ruR/Vhj7+j/u+iSUEPk2PsEDqfS
	U/HJsMLACB/yuAXhScBWhC67mH6+34cRHWkFerZbSyVibyoXMbUxAQRbQ7mIfengjPBeT0TBkAN
	FGNgYAe7MNOigCh3HwknIznudNj5X120WunmAZX/x3SbEX8E04ToNHTKuHfpuLwH0j4iYA37N0d
	uVbuvVyla9YoEXcixLtsT8Ac2kfbc2HjGIQqyMX1cMOxlH8=
X-Google-Smtp-Source: AGHT+IGOeun1szqzJaIz2NJQIc9/iKO4ZbIcGfY69/y5m+JQZGEzXRK+PyNfyfrTvktlbhWekNevrQ==
X-Received: by 2002:a05:6000:2902:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39c3033ae28mr2293896f8f.34.1743687230579;
        Thu, 03 Apr 2025 06:33:50 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a7225sm1816334f8f.26.2025.04.03.06.33.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:33:50 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:33:48 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 07/10] cgroup/cpuset: Remove unneeded goto in
 sched_partition_write() and rename it
Message-ID: <t5gojwcnwdb36ppkhq6hpujmyatckg5wd5eigsnmt2kndfofe7@ymc7tiury62o>
References: <20250330215248.3620801-1-longman@redhat.com>
 <20250330215248.3620801-8-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bgvd7fl2ji2twwup"
Content-Disposition: inline
In-Reply-To: <20250330215248.3620801-8-longman@redhat.com>


--bgvd7fl2ji2twwup
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 07/10] cgroup/cpuset: Remove unneeded goto in
 sched_partition_write() and rename it
MIME-Version: 1.0

On Sun, Mar 30, 2025 at 05:52:45PM -0400, Waiman Long <longman@redhat.com> =
wrote:
> The goto statement in sched_partition_write() is not needed. Remove
> it and rename sched_partition_write()/sched_partition_show() to
> cpuset_partition_write()/cpuset_partition_show().
>=20
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>  kernel/cgroup/cpuset.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
=2E..

Also noticed (here or for the preceding comments&cleanup patch):

--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3525,8 +3525,8 @@ static int cpuset_css_online(struct cgroup_subsys_sta=
te *css)
  * in the default hierarchy where only changes in partition
  * will cause repartitioning.
  *
- * If the cpuset has the 'sched.partition' flag enabled, simulate
- * turning 'sched.partition" off.
+ * If the cpuset has the 'cpus.partition' flag enabled, simulate
+ * turning 'cpus.partition" off.
  */

 static void cpuset_css_offline(struct cgroup_subsys_state *css)


Next time...

--bgvd7fl2ji2twwup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ+6OOgAKCRAt3Wney77B
Se2AAQDOabbdX+KFiR+uz9cakVFtI5Fcv68ZnaABDprIt9e9ZQEAhpLShxYbiO8G
AVAavan6wMIIW9sN9bq1d6mXXD4Vjgk=
=JSS+
-----END PGP SIGNATURE-----

--bgvd7fl2ji2twwup--
