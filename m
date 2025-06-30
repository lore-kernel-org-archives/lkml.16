Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4BE2E4258
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 17:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751305196; cv=none; b=IBq/YrvvpNR3IZpJqZYfvxWpVUftUgq3oLpeBaDe5GxUypSbOt9wN0dYHWqZBZTFKh8dKE7yN2eu65KcC43itAXghwpRyxdUZWiLwr5F2SLPR5MXbLIkPb0Adic0b40Gjf+oP97SLS0NddyQu0O2K9cetAUyL1IErt3LBiVuhuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751305196; c=relaxed/simple;
	bh=2Y9uMTwID9j6ls06ernf7fmJNC/MA8FlRHuc49tIeXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OD/91AWORXIYQU1+OP8g51c6/mb2vCPrtyU4xWIP26SiaA39DEUA+Q98axgxBO/Nxb/RngWAyDuzwYRiXWvEX2I2vDa/0/wLD7pxSlSPV7i/m5LBLzvy4TDzfKSQz/uLowq2Ca3FfezfeBLVhuYmQkKjfEbWRBHN+YysP+eZ7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F0MsI79S; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F0MsI79S"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4530921461aso31566125e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751305189; x=1751909989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y9uMTwID9j6ls06ernf7fmJNC/MA8FlRHuc49tIeXI=;
        b=F0MsI79Svly9l7hdwSJ1OTrFDSUBy+wqbufyOlCtDhDGkACxNPNI7Bm6buxPGyHRdk
         Ea0OMhNtnWdI7ojFcy2oPlKu0B/5iGWiDHHc/LvGeofggStKan7SNowxK/gdjnvFWJA0
         vY8WgDKRxqy3DespFezjas+aiBDj8rvUwQIIOE7mFFzQzfsMplgmDJcyETUerymqHogV
         peWpw0w49K2XAdRDk+rKU2nqwxq3KiJmXa50Qs1w6ESZSamwju0YnjWJLv3tC96flZLy
         0YR9PLgiF7l40kaay6Ybl1mu0FWEhwgX0LM85Hhm7+eX99hWqW81wnBTQ1jG8tBs1aw/
         NrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305189; x=1751909989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Y9uMTwID9j6ls06ernf7fmJNC/MA8FlRHuc49tIeXI=;
        b=uYkSUJbBaEKZxw9fTHhdtFA/3/dnpPkSdw/XWuZTH+lKmLW6dcObrdZtG8yg9pf9vY
         WgL4IpZ5g2ru7zUX7bYoOmiCGpcbz8eW9u6Md6aS3Oa7F0+Izfvy0v3r6mD5eGs9FI9S
         U+Ou3tAVME+BJmPqHBJ1Yal7nT7HrJJTrZp/1NNLFpytwohjdVmaT8s6MkdNB3k1W/H9
         CbbpqxME91Nysi7eegWSwvlPaxrgNvtG1kUaZKFk6bzA1FSSBz4qlqPQweMPyAsssy0G
         iOsGB9Rf5Wi3QTu1LisewkRNryuihNXPGJQYMqPHYZ8DnQdFfwacYYtZJl5bU7q3B9tm
         JZcg==
X-Forwarded-Encrypted: i=1; AJvYcCVkRslkOhOUGEnmjkaIGzJldvY4E321/WQ/LEPXGmUwGVai1v1b7bb2ZpvJQxLbJJkHQPyg6tUwgRH18+Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGDU1wdnKNBnAb95G0M/LwNElKvv61vxGZhvOBRHNPUXB0FDOo
	/Pmm/H2bktUu0RovW2M8Px/fy3GbkJwHuv+V0HKonoK404Uf3UKWVGMrd11lahxpexcDQnRyokd
	av6bF
X-Gm-Gg: ASbGncvgFgc3tfbXapwwQ5OssG1jNmp+d4oRTrQkP4J/YDUNMhUT+8rbLBrxdQYdKMH
	6t3YMT5R+CVNpCMe9afBo90ibhJxAPIMqjodiW9x+1/WtknojFABta97geL/JGh+ylSND7Vitfn
	H5N2voToTjrGxHo68W156cWI2G1eagOl9YRG0+L1KI3Wsvkiut2+trLRT/KrMzlKET/FN+N2HNM
	31qHroBiZKsbPjsaAWcE6AwY/fOQDJsanpLabh8yAXPzOk0Z6Zf7GfQ8EXBI4s2GjlGF9CCv2FR
	qTz4QtPJYIXaPmTJFNf7AiC4lzs+ehU3+XneN0dDBtKXKTQo1sdBnNg/XBU3F0z4
X-Google-Smtp-Source: AGHT+IHJy4btGv0fVS1tLOScDjwEh+rbzrQMUABP+ayXSxOTT48qfvdOfpAA/8f2BAYnhuti0aw65A==
X-Received: by 2002:a05:600c:c4ac:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-4538ee85615mr124990995e9.22.1751305189383;
        Mon, 30 Jun 2025 10:39:49 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453923a22fbsm100856365e9.34.2025.06.30.10.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 10:39:48 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:39:47 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: YoungJun Park <youngjun.park@lge.com>
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, hannes@cmpxchg.org, 
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, shikemeng@huaweicloud.com, 
	kasong@tencent.com, nphamcs@gmail.com, bhe@redhat.com, baohua@kernel.org, 
	chrisl@kernel.org, muchun.song@linux.dev, iamjoonsoo.kim@lge.com, 
	taejoon.song@lge.com, gunho.lee@lge.com
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
Message-ID: <bhcx37fve7sgyod3bxsky5wb3zixn4o3dwuiknmpy7fsbqgtli@rmrxmvjro4ht>
References: <20250612103743.3385842-1-youngjun.park@lge.com>
 <20250612103743.3385842-2-youngjun.park@lge.com>
 <pcji4n5tjsgjwbp7r65gfevkr3wyghlbi2vi4mndafzs4w7zs4@2k4citaugdz2>
 <aFIJDQeHmTPJrK57@yjaykim-PowerEdge-T330>
 <rivwhhhkuqy7p4r6mmuhpheaj3c7vcw4w4kavp42avpz7es5vp@hbnvrmgzb5tr>
 <aFKsF9GaI3tZL7C+@yjaykim-PowerEdge-T330>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fpnjag4xaqb26ddt"
Content-Disposition: inline
In-Reply-To: <aFKsF9GaI3tZL7C+@yjaykim-PowerEdge-T330>


--fpnjag4xaqb26ddt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [RFC PATCH 1/2] mm/swap, memcg: basic structure and logic for
 per cgroup swap priority control
MIME-Version: 1.0

On Wed, Jun 18, 2025 at 09:07:51PM +0900, YoungJun Park <youngjun.park@lge.=
com> wrote:
> This is because cgroups can still restrict swap device usage and control=
=20
> device order without requiring explicit priorities for all devices.
> In this view, the cgroup interface serves more as a limit or preference=
=20
> mechanism across the full set of available swap devices, rather than
> requiring full enumeration and configuration.

I was wondering whether your use cases would be catered by having
memory.swap.max limit per device (essentially disable swap to undesired
device(s) for given group). The disadvantage is that memory.swap.max is
already existing as scalar. Alternatively, remapping priorities to
memory.swap.weight -- with sibling vs sibling competition and children
treated with weight of parent when approached from the top. I find this
weight semantics little weird as it'd clash with other .weight which are
dual to this (cgroups compete over one device vs cgroup is choosing
between multiple devices).

Please try to take the existing distribution models into account not to
make something overly unidiomatic,
Michal

--fpnjag4xaqb26ddt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaGLL4AAKCRB+PQLnlNv4
CI2lAP9cNd8Fw/efDHTo0CbYimuJjQR8y9PUoLFpqTT1zfv2CQEAmh2uxUSEceTY
Y2x0oL70yfEQ4Y16HdkMDSN3MpuANAA=
=Xz7b
-----END PGP SIGNATURE-----

--fpnjag4xaqb26ddt--
