Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4F02737EB
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341973; cv=none; b=WWvT2fikZ3MzuMEyR3ZgH+9X6WHvKghpcRUzZ6xck5G+8Q3u8f1PeJiVoYjXvqXm95t8lNhKTR51c1VlDeSKFQKP1jOf+m4+nEM2sgBKQoETW618d1/gupXlN0fJNc1NZbnLyA4IB5jVEqjtNdTxiXAnwIeNcQyLXWf1W+pxsBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341973; c=relaxed/simple;
	bh=TrQEbkPOhkr+wXxKi4QhmQRGh+BqEkZVvBvjASyKlYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwg6jEnpQhNIZZH81ysKkBkSjB2GtZzzIwPCNU1mEsweID17Te2Uw3uhtE7xz+0KhSZhnA27j0F/UylWJIoWuWMVwIi838Se71UyvAX4QK4agINbnFG+m8ApAoX9kBlAKNbeCKUN+wqdvd+eZ5AGBjtM9hhkOoIYjKDp/0ijJxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LzSBQ1pv; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LzSBQ1pv"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so459571f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750341969; x=1750946769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TrQEbkPOhkr+wXxKi4QhmQRGh+BqEkZVvBvjASyKlYw=;
        b=LzSBQ1pvPgzNdC/ZTrW29Q8bKLmiCf5MiOHKd+5V0Lp+MVZHSdyYZh9I37uTNd0q1v
         PH6Qd1J2dhu/QQVF+xqduoqOqUgmDOw4XYaWAWNPKuPBlXoH0EL7jmhLn8AcQcxaPNU5
         DGbmXOKQHlD2uFp3wquvtvaN2ml6joJCrUBxszl8pkujNvZ8MurKFbFvPBuEnnMcbQIt
         y5M41RAIMMIK7SjO0V4IBRwzCY4z5AY0qRaQmofoEnnEvYCdVW2a9DxJDzUkEUF9vc4g
         2epwphggVRDWkyTKfUpAmKYAfIpllRUy1lnRcH7omAR5kr0VdbP7vNStOtEfNV4gdfU4
         K9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750341969; x=1750946769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TrQEbkPOhkr+wXxKi4QhmQRGh+BqEkZVvBvjASyKlYw=;
        b=o1BGr9Ai9voYEdkKV9PsVlWEu/ll4469wblo1D+i7Q2DWxM0TUO7s693xJuZtoreBC
         sfYimepDPC5qBH88ZzBUVtjDuWUlAf77oDRyJ1Z5tvDvCbE5BbDkaySsR2MtXQo1nE5A
         x+06fHYCw41N78WYpS9fsuCsqnLCqL+8dSCXyB4mSWi5E3yAPDNx0vtCRcemR5p6Aj+Q
         OZUXSK01An5N48nsuFI1b6uidORk9yt5l7OwPPKMmnppXS4+U6Bfa+fwCgFUZlZQhen+
         jbDWYH2lPafUh5vBDgyAVEBySgrzA1QPZw4L4Je/4UOG8JmzJtBKs8wJeDGYTt880fbf
         dvRw==
X-Forwarded-Encrypted: i=1; AJvYcCW/+/DP21qETi4rQLs6ez9uarAdIpdX8WQW59i5GmGT7BkN/qhO7cw78m837oM1RsvuNOIx1xbTLTGTlKI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn30W/zHTwF0pmwn32Ug4T1wPJKIrCGs1CswGGJ73HrsnkxvsA
	JIf1F+tIAVb14/tdPCDx5W/8pR++rIg4M78wdaozks9YJoW4BXzEqqvg/JJSBdEJPWE=
X-Gm-Gg: ASbGnctomOR+9Y37sE3Gw/qfhhWmpaUj6tieyHYfVJtg1JguH31aL3H2+9XPpJz+iyM
	RANg26sAVr/NDPr6wNE9kULaNTmVwf1CR+WULbccH/uec4B67peLbqQ2sxklKX5o+gqmsM6ymh3
	DrD/xetibiiVPcIxKEAjJPiIWj0WApa1JAlQ9wUndVMSqS4wXPRdoffh8+9u5+ayYNdYZ9T2C1Z
	qPa53syMxgeO+S4EFOrHs3GmzlHzDtV1C6SJZxbyv0mLEyznPC8DTdQcAFez05Ej2rBe95HHAxZ
	BbxtH4kYsDS8wdXI5sL7ZixoV2R8k/HNEHUARSR5R0sRIPauuy2Rhr+U/wwHuwh5
X-Google-Smtp-Source: AGHT+IFYZ5Og/LPrj6v29fVm2BOf1qki8zUztiChQu5TWH5+YhTscmSrBeIdsgN0gGcw2f5/E2TFiA==
X-Received: by 2002:a05:6000:4a03:b0:3a4:fc0a:33ca with SMTP id ffacd0b85a97d-3a572397d6amr15059912f8f.4.1750341968150;
        Thu, 19 Jun 2025 07:06:08 -0700 (PDT)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm30681385e9.12.2025.06.19.07.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 07:06:07 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:06:05 +0200
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Shakeel Butt <shakeel.butt@linux.dev>, peterz@infradead.org, 
	akpm@linux-foundation.org, mingo@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	corbet@lwn.net, mgorman@suse.de, mhocko@kernel.org, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, tim.c.chen@intel.com, aubrey.li@intel.com, libo.chen@oracle.com, 
	kprateek.nayak@amd.com, vineethr@linux.ibm.com, venkat88@linux.ibm.com, ayushjai@amd.com, 
	cgroups@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, yu.chen.surf@foxmail.com
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
Message-ID: <zcabngubuvvlo7ddqhv734nmponyowtrtuerhcee25yk3cqxsd@gkyioppho5zt>
References: <cover.1748002400.git.yu.c.chen@intel.com>
 <7ef90a88602ed536be46eba7152ed0d33bad5790.1748002400.git.yu.c.chen@intel.com>
 <cx4s4pnw5ymr4bxxmvrkhc457krq46eh6zamlr4ikp7tn3jsno@xzchjlnnawe5>
 <uuhyie7udxyvbdpccwi7dl5cy26ygkkuxjixpl247u5nqwpcqm@5whxlt5ddswo>
 <a8314889-f036-49ff-9cda-01367ddccf51@intel.com>
 <fpa42ohp54ewxxymaclnmiafdlfs7lbddnqhtv7haksdd5jq6z@mb6jxk3pl2m2>
 <djkzirwswrvhuuloyitnhxcm3sh7ebk6i22tvq2zzm4cb6pl45@t64jvtpl3ys6>
 <c6bfa201-ed88-47df-9402-ead65d7be475@intel.com>
 <h4chrmiscs66vwl4icda2emof4pbhqabpkklpql2azc5iujilm@o2ttlcanwztc>
 <6e52340a-cabf-48db-b9f1-8300c1c13997@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dqfju5slh7y3cmln"
Content-Disposition: inline
In-Reply-To: <6e52340a-cabf-48db-b9f1-8300c1c13997@intel.com>


--dqfju5slh7y3cmln
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 2/2] sched/numa: add statistics of numa balance task
MIME-Version: 1.0

On Thu, Jun 19, 2025 at 09:03:55PM +0800, "Chen, Yu C" <yu.c.chen@intel.com> wrote:
> OK. Since this change has already been addressed in upstream kernel,

Oh, I missed that. (Otherwise I wouldn't have bothered responding
anymore in this case.)

> I can update the numa_task_migrated/numa_task_swapped fields in
> Documentation/admin-guide/cgroup-v2.rst to mention that, these
> activities are not memory related but put here because they are
> closer to numa balance's page statistics.
> Or do you want me to submit a patch to move the items from
> memory.stat to cpu.stat?

I leave it up to you. (It's become sunk cost for me.)

Michal

--dqfju5slh7y3cmln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRCE24Fn/AcRjnLivR+PQLnlNv4CAUCaFQZSwAKCRB+PQLnlNv4
CM3dAQCuYFm+JCgZpwkdQr6jIGP6Ax9dcl0VPZZyVPb3AipPYAEA7ouwjVSo7HYj
QQfbWU/k3DuXFPBdpkExqgZHN55LaQ8=
=gz+O
-----END PGP SIGNATURE-----

--dqfju5slh7y3cmln--
