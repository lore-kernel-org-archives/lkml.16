Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A63F22FF42
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392174; cv=none; b=Q+8dN68EyABP+pluUUjUIGoPQT8hOheOGzX34kifKJxvwybcRLKoXkE7d2qvqjJlYG7gbFd9XMs+eY+OZAnbztchmz95H/vxiK2Y8Ym7+ydjl+i0MhohpEvhSyzX7jRn18RsGP0AWvTrN5864Or2OPtY87edp/rxphxmF1qslTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392174; c=relaxed/simple;
	bh=Oc4xdSup33Ao3nyy/kmkHgKqOdaTNT3JHZQu3SVOEbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ijREjq6+EV5l+SLdMkap+OrmNiYJF+2BGAb82JPqiM+sGIDtg2HKDZV4e98fPAyI2JmtYNodKHrlUOlSGe4uZJ0Uu2uUIHfIEFW6CjI6Ye1/qzu7Fwr89qi58BNcbbvhe6CUJydaDzaMgY1r/FkI17AuVwjfPAjZVL96tPr+yRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fKnj3fFD; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fKnj3fFD"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so22758255e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744392170; x=1744996970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HU2gsnS9ySnckXz9WXV/Vzi+SMdE2T2Oy6WWzpMls7c=;
        b=fKnj3fFDeUHlv56PJnuWYqqLvnxftV7k554Ypp4k0281DepnW1n/zw/r/GabY7GX3L
         ZpAYhT6ofNGF2xKgZjVuz1k0j3accS9FOmmacpV1fnxI405zIgep2XzzgHEAxub4kABD
         lIRa+UaRBX8sp1YpP+zUuuFCpZyfmaLBkrCnpptIqr2kim3z/sL5DL8bnJ5zd760twnO
         RNnSgyoTFmIiyeyi5I5ZzKkA4CnozkSBCetaLeI66mmN8PKfGBIWfLm0gVnEuNVNFPKR
         g5HzegKHXP/9PxUKMsH1SiYNU/IcObEmTfHty4OoDbEcgpFP+mdVU4YlfSlNo0OwvpFI
         WWCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392170; x=1744996970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HU2gsnS9ySnckXz9WXV/Vzi+SMdE2T2Oy6WWzpMls7c=;
        b=O7qr7k7G3uZ/biW+d0uKH8pNHrl5198yHrvS/p7QDPYlYgcGwwmdU77BhwveBhEeJU
         cEZKgVo58FMD6z0u82S17+TDu0mbFmmesqaILVHsdNNVExim0zi2DKLaOk4dVOoAMDlO
         eiyViyfsXOYbQeubXFt3C8NEv1MaVq2Ck4Q2KcntkoqbRYr+vji9MMvFmRv3ukCDwzfL
         2Cte/e2Mvaab82MSV+x/XWAG3gJ0HsPdNoz5QW/+5Y+vtrgvo2FyPpuBOtNq6cs6yzAL
         ofz6zskjR8VL6vq1pZgz/Lxw7sqcvyz97E/yWRimy/43p2IoDW/7XJxv9/Lti6vpK6LK
         TdlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeWKV1uVN/mCk0eFxV7SYfpz3Mg/WVfhp2+js5JrxjJLcNIFJlJa4veCAI6YmvSQFEgFAKFFJ/WZmkGfY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOkFpPXNCrctztgZnLsjd+Ji7qtwSVcmEs6xEao4xT2/r4wJq
	kgG3UeEb33ZGf03eK9Npcl/NevonLrM0uQYWPNHp/gO8/EIhKyuAUnteAsb2Tfs=
X-Gm-Gg: ASbGncshhQDDIvPHP2ILRHi/TOYoIzgAHT6vfWMhTzmNu4yd4VJS+DRmAaTjeyT5yt3
	SWbJKQPeWaYPp24l0a+m475xG34xuEwhZY8TJRA6J86g/JyXdzf4Ik1D0vMeVcQylqMLY9WvMZd
	cym2wsKU6uRYDCU6gtVAfN8tduniFL+yvUPu9g9Mco1G0mXuOouYfVDIoajaK8g8bzxOeR7/m7G
	Gh6rkwc7t69nwFXoZpZhim74ljSg9jNtL2/KEDG1I8S3HJXIzScWRRqJm4lE1pTr3pGC5KiRek9
	+AJj8DsBQF4hCEIeQcfkg/puLzcP6Kg5e/dS5na8bAE=
X-Google-Smtp-Source: AGHT+IH5Ui2XolRBPBso1SUsosYlFQ732rqt/TsDuV+AdqLa5keAYbHPUYE8a/OQyeY9sUFkldpWiA==
X-Received: by 2002:a05:600c:5008:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43f3a9a68c9mr30732585e9.20.1744392170167;
        Fri, 11 Apr 2025 10:22:50 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20626c0csm96273275e9.14.2025.04.11.10.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:22:49 -0700 (PDT)
Date: Fri, 11 Apr 2025 19:22:48 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Waiman Long <longman@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Tejun Heo <tj@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 2/2] selftests: memcg: Increase error tolerance of
 child memory.current check in test_memcg_protection()
Message-ID: <pcxsack4hwio6ydm6r3e36bkwt6fg5i7vvarqs3fvuslswealj@bk2xi55vrdsn>
References: <20250407162316.1434714-1-longman@redhat.com>
 <20250407162316.1434714-3-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="flingjnfq7xpj56j"
Content-Disposition: inline
In-Reply-To: <20250407162316.1434714-3-longman@redhat.com>


--flingjnfq7xpj56j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/2] selftests: memcg: Increase error tolerance of
 child memory.current check in test_memcg_protection()
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 12:23:16PM -0400, Waiman Long <longman@redhat.com> =
wrote:
>   Child   Actual usage    Expected usage    %err
>   -----   ------------    --------------    ----
>     1       16990208         22020096      -12.9%
>     1       17252352         22020096      -12.1%
>     0       37699584         30408704      +10.7%
>     1       14368768         22020096      -21.0%
>     1       16871424         22020096      -13.2%
>=20
> The current 10% error tolerenace might be right at the time
> test_memcontrol.c was first introduced in v4.18 kernel, but memory
> reclaim have certainly evolved quite a bit since then which may result
> in a bit more run-to-run variation than previously expected.

I like Roman's suggestion of nr_cpus dependence but I assume your
variations were still on the same system, weren't they?
Is it fair to say that reclaim is chaotic [1]? I wonder what may cause
variations between separate runs of the test.

Would it help to `echo 3 >drop_caches` before each run to have more
stable initial conditions? (Not sure if it's OK in selftests.)

<del>Or sleep 0.5s to settle rstat flushing?</del> No, page_counter's
don't suffer that but stock MEMCG_CHARGE_BATCH in percpu stocks.
So maybe drain the stock so that counters are precise after the test?
(Either by executing a dummy memcg on each CPU or via some debugging
API.)

Michal

[1] https://en.wikipedia.org/wiki/Chaos_theory#Chaotic_dynamics

--flingjnfq7xpj56j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ/lP5gAKCRAt3Wney77B
STuPAP9qtXHRJuw6fswvLPcE6FAyBPPV35k6ECqWkmzYm2zgJgD/Q60WvtRy+kc1
RSJih7a7z5QbobgKcZhdynqI/a5/iQI=
=SyIA
-----END PGP SIGNATURE-----

--flingjnfq7xpj56j--
