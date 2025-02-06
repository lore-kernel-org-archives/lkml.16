Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525A91F4176
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857465; cv=none; b=exkzLyt0R7wTim90hjEDdzR/ALI+V5L9rkf6ATgUJBNINZx02W411DU84znGS2NYm6/8UXTS/IefbDGnXoI/qI/10DQe3fHhwNNd9jT/9iPuRF+kCNL/fMpDYxOE6FfxktG4CnhCVKPy+3sJZjIkalQa0ndwbSdU9NkHOrAVeLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857465; c=relaxed/simple;
	bh=VVbyILDZ8O23cCbLemWssIEyMVaqbxgt8Ip2vBbHLgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZEHZ/mcrpY3F2dTRdZzS7Zp3WhnxBIQXPwl/6Sf4BqW2XyZYG2/e6CWqULh81a/L5/AW2kLDjOMt7XuPhqtDeh7OvuYVQ0ChteMoTFp3qTWivNuNBjyAGaGWefPGECGy9rWJ7GHlEzfpBC1Sgr9q521DzcMQHJDlTXtKASkuhJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LQ7TU7r9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LQ7TU7r9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso7538185e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738857461; x=1739462261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VVbyILDZ8O23cCbLemWssIEyMVaqbxgt8Ip2vBbHLgI=;
        b=LQ7TU7r9X3vpvWHFqz5/RnQFlO7jYbQxA7b6omxtGjka9Sr7TippAcHldsloIeqAGC
         hQZecHToCJ0ZgtwJi6P9t3pokD1eNf8sFoRxSZz/Je7hzL5FlV6bwUV0pKdeOny6XAhi
         VChIqtwJDzCY6vq82syNRoYlqAwbeNesRUWK2MrGn/Si1cv3WRSu6Vg60iQCuDNOMYAe
         9954EY8459nUhTt/BZMIVM5MDJNXMMjoctmT4CHRw4jl9iVhVJH9hgbf38BcXurDl95L
         QHEZCdaCZONEXmC2I+hWprmWJ0yRUGBlFg+cYgbXQCuUsp+miSl0YmS8rQPe2FBmpfii
         QTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857461; x=1739462261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VVbyILDZ8O23cCbLemWssIEyMVaqbxgt8Ip2vBbHLgI=;
        b=ME50LkLQGhq2jeueQ5H28RdwgEHq7q9VIekg+niWwUrcOPPYGFl6CypukrQ5nGJgN1
         O5nQ/N3C6G+CnRZG0/KU6u8cyG/gTnUHGbBqlSK6k3+lEueqquEdcO/ebpwLPhURR5FL
         i/nOqVJQIAcFPmVYhcmw9eEhllS+kQ0Wy1bJP60BDodB3MLGVYhdnKMT4vlkYY6wwgV5
         Vucc24N4rHj7msex/RC1iX1p5tgRdjRJ+IE8NN/Ac9EDPtkhF6Db2Ew24DDpXhwnb4Mt
         /WQrrnvvbUbuB/MvBU/lEZpHTLj04kt2xHieWm0VriDmTLa2U7eMOmwrrYJTIM/wyUPT
         3LYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSFhrh6tWS8vAylKqAXyeXnCFoh4W8kt3/XJ/+1fJvAnLcJ1VwtmUNnyML1VF4nx7JzT2XV84xiMHL0H0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWB5ZoTTBsmCjxbQsKQsJwv4cI0wR+R7NUXgEGQPiiWosfCOef
	Rq/v0ymmIC9zJ82O6ZRrAg8wBlOgJSiPeQryvGWtITG477zjvm4pnfm1Nun4F8k=
X-Gm-Gg: ASbGncsUEnA+LtTrOPRV0UbN9nZj4ySt1KUZXJsm7ADLoyh0Sbag8jSncBu/FpMKr2Y
	fglJfMJ9HmoNfrba8HQqei2elBe6ZpSbBChIrfTcrLqXKHX3N+/7HD1A35DJcABKH7Ya+2fy6ft
	f5OHXGtIhVs6Kgyl75yPVPxDZg7/ELTLF6DqZ0ScrfF+7AXNrwXvH1C/7IeTY52aHS2h3XwQOyW
	+KWg/We5KUVqAaPpK34GoWHQg4j+sw/ABoyYaskHVAnPMLOJ/1tE2Q6AuWHZ/Y8V9FaSuetA8hU
	CkbeUa9f2n0TApr6bw==
X-Google-Smtp-Source: AGHT+IEtnYVZgigZSV9GOOjiw4uU0akvJHJHUr5mEW7I59L42GPOmQnzeJu25Ocod8gQri8uVU0GSg==
X-Received: by 2002:a05:600c:354a:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-4390d435cf2mr78308015e9.11.1738857461578;
        Thu, 06 Feb 2025 07:57:41 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a66esm58718075e9.0.2025.02.06.07.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 07:57:41 -0800 (PST)
Date: Thu, 6 Feb 2025 16:57:39 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: add hierarchical effective limits for v2
Message-ID: <mshcu3puv5zjsnendao73nxnvb2yiprml7aqgndc37d7k4f2em@vqq2l6dj7pxh>
References: <20250205222029.2979048-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="toufq4e4fjypkuvv"
Content-Disposition: inline
In-Reply-To: <20250205222029.2979048-1-shakeel.butt@linux.dev>


--toufq4e4fjypkuvv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] memcg: add hierarchical effective limits for v2
MIME-Version: 1.0

Hello Shakeel.

On Wed, Feb 05, 2025 at 02:20:29PM -0800, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> Memcg-v1 exposes hierarchical_[memory|memsw]_limit counters in its
> memory.stat file which applications can use to get their effective limit
> which is the minimum of limits of itself and all of its ancestors.

I was fan of equal idea too [1]. The referenced series also tackles
change notifications (to make this complete for apps that really want to
scale based on the actual limit). I ceased to like it when I realized
there can be hierarchies when the effective value cannot be effectively
:) determined [2].

> This is pretty useful in environments where cgroup namespace is used
> and the application does not have access to the full view of the
> cgroup hierarchy. Let's expose effective limits for memcg v2 as well.

Also, the case for this exposition was never strongly built.
Why isn't PSI enough in your case?

Thanks,
Michal

[1] https://lore.kernel.org/r/20240606152232.20253-1-mkoutny@suse.com
[2] https://lore.kernel.org/r/7chi6d2sdhwdsfihoxqmtmi4lduea3dsgc7xorvonugkm4qz2j@gehs4slutmtg

--toufq4e4fjypkuvv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTd6mfF2PbEZnpdoAkt3Wney77BSQUCZ6Tb8AAKCRAt3Wney77B
SV0+AQDW1xJCBatKi6xRC0ZESDInrTI1kQ6qqN9CO6w5z8FpQgEA1zRlG0NxFEN7
nUgSeD9K4yF5HvSYXGo3jlGZRYaPPAc=
=wGHN
-----END PGP SIGNATURE-----

--toufq4e4fjypkuvv--
