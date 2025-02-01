Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B6A1C7B62
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738428843; cv=none; b=HCN2t3V4UpsWEgMGo5OYLV89oViSf9Fg62PTKas7U1O2q34jx2z3lM91OmoMH46jhufmWIOi3ZnMIAf6Y90sTWFKotFiS3E/gHM3ord3kaK87ymN5Abq093PTjEg14KtvQ/LvUTjLG0zoXomXaDoEb1QEMtoSCAg2bm0BW+lLYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738428843; c=relaxed/simple;
	bh=xa+25ur344OEW7t7BkDF9Du5L+MmLYguJNQOy0Mq0xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4RmlwxC8J96WjmjiITAvX+ONLgGVHytA5dSmOHPKXDWG7jvz/5WqyM5pt+vazdNpgCI/UY7v6B1UuYfSK9cmgut/m7WntjDNLgr9vMSF4Yr3gIqLMbjTyXHTSHEZDldvMKescO9zv46TigoPPAbd+XT1VN/sdh+FZdd8NIMTSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=h1tg8ie5; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="h1tg8ie5"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7b6f19a6c04so287673285a.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 08:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1738428841; x=1739033641; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KmDNfJVAoqWOWRyDOjqr6PMbGbgV/Gx/qMdbUArjGps=;
        b=h1tg8ie5GOPeKhbdbln8/Fof6Ix9EXyK2NAD9Ak42BsM25N7bLN8twjyIJMNGmIdSq
         ulbKF0tR8l204wh94VVpKo8qg3WOW3KKcM12wv+XhtfKrAALFuNqkKDceH3R8E0Kd4zV
         S9X8YQnUz8vTi1GkF3YnNrIm7bT57sJKaiyipSB9KcyV/JdetziV8v3T7pGe4aBeBJFg
         fvWBsrby9lFf9qr7rV/b3gW7+JN4FVflrc/F/Mn3GUv0ODBGyoLNTakwrkETXUiaZS1E
         f44BTGy1KmBqar7XCU6EYNp5v2sDIbHt9nZHqRTIBvbD3Ri/634BkWAmuvg1EEORBby4
         RxwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738428841; x=1739033641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KmDNfJVAoqWOWRyDOjqr6PMbGbgV/Gx/qMdbUArjGps=;
        b=g1mtNfqegmRI1RjRPhtogPjL825cY6a+5voDevIWK1lZsbs1E3lMf45xu84krdMjWz
         AGr1nQF6TQ2U28wGfzEOAgyTNZ/6AY+pn17aMpOVFP92RzbryXXXNkJvsM832piZ1BxS
         XbiU3+qmIAZn5FaYB8Bg8EJHSeWz7/N7PkWO9Rceeqi7CNfwgKf+8xW+DbXwABsHFTsH
         +jYOfaVG7eCV/FV8AbyloeUX6ChgqPhf2YpfSsT2w8E2vibcnhaKkb9fUV/trlIH4SHl
         0UJEbshMlWh7urPEqNMMtMK6HjyCbdO4Z0VIlptQua50MELGXUBiGb2OO9f5ehDhwsWW
         qqZQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1+/iY9RYOyx1Rpgtytc6FyoUvwj5A6mdVx4P8fCoy0cta8MbPT8YHc56jfvsANRGlSnsd/XXPEOlcEwk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb1W5GPLanL2/m/Qh/Abw0VWf/kS0E/RvQ2iE8Ir08qv+xjEOq
	LxMsNCFWwUE9P9fXi/6AEDLiMAU/oKbOlo5kECxMPPAEYRDoX67qJG6rzafuTaM=
X-Gm-Gg: ASbGncv9ND/xpQVQAqtB75E3psacDMNwjxwh7NhEhvE9Sw0WBpPscAEQDRrSQzcGtjg
	p/mnqtZQ6U22MHM56Vqs0ySPZUHz7c7DM/GRuH5waoQFcrpnlS/CCZ1dAlrOuWSQ4mCrZNV1gZx
	odIb5L38aW4eogyhLiCsXZ5EHJt3YNEyMT9At6tqZRunc0eU7B+7vAoPfQszUMWgFImcvaZ7TE6
	c2hXaYfiuCCutHE7Qmh4n3j4uoKVdRd6lBMTJrVmpdGpUH/Igf2E3ODN+dvfWX0DHoMADdCtNls
	O205Echd5Kbxxb4ogFO4EEM7ZUCBwSrPgmggd8F4jNjy26ObWhta5ADuDMTVzzs9t/KATdl84Q=
	=
X-Google-Smtp-Source: AGHT+IFFKkIsNUNoiTwwsvCnG0Xbc68Ad9IQzTVMCnnPigzL5AQ+CvWJflgv+MLDJU2UCeqLYNwvWQ==
X-Received: by 2002:a05:620a:471e:b0:7b6:d8aa:7ef8 with SMTP id af79cd13be357-7bffcd8cdd2mr2315439585a.37.1738428840845;
        Sat, 01 Feb 2025 08:54:00 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a90cbe0sm314316485a.102.2025.02.01.08.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 08:54:00 -0800 (PST)
Date: Sat, 1 Feb 2025 11:53:57 -0500
From: Gregory Price <gourry@gourry.net>
To: Honggyu Kim <honggyu.km@gmail.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>, ying.huang@linux.alibaba.com,
	rafael@kernel.org, lenb@kernel.org, gregkh@linuxfoundation.org,
	akpm@linux-foundation.org, honggyu.kim@sk.com, rakie.kim@sk.com,
	dan.j.williams@intel.com, Jonathan.Cameron@huawei.com,
	dave.jiang@intel.com, horen.chuang@linux.dev, hannes@cmpxchg.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-mm@kvack.org, kernel-team@meta.com, kernel_team@skhynix.com,
	42.hyeyoo@gmail.com
Subject: Re: [PATCH v4] Weighted Interleave Auto-tuning
Message-ID: <Z55RpQgsma5wrpfh@gourry-fedora-PF4VCD3F>
References: <20250128222332.3835931-1-joshua.hahnjy@gmail.com>
 <41ab5a11-f8d3-403c-9d68-33eb15aef8fa@gmail.com>
 <Z55QmybX5IkuLv6Q@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z55QmybX5IkuLv6Q@gourry-fedora-PF4VCD3F>

On Sat, Feb 01, 2025 at 11:49:31AM -0500, Gregory Price wrote:
> >   1. the auto mode set the weights as 10:5:1 for node{0-2}.
> >   2. node2 is offlined, then recalculation makes it as 2:1 for node{0,1}.

Point of clarification here:  a hot-unplug event won't cause
recalculation.

What actually causes re-weight is hot-plug reporting new capacity.

So in this scenario, the weight will remain the same for node2.

> >   3. the auto sysfs interface is set to 0 to make it manual mode.
