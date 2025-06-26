Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B3217739
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 19:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750965213; cv=none; b=lCjqVn44Q894vMD9/TVEzjLziXl7fTsSwMqLt7IjU7vOXfgzjLtHxterZgNhH0q+8LFaPdJ7ZOTocVZfmsESmpP1QxCcYk8zr+wuPdSeTFRjQntuX6/NFMl5CJAf7SuOw2ufd/SpV4aSkwjh5AwyaR1ztkRgHcUsP5J6LCWoWuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750965213; c=relaxed/simple;
	bh=crS18D6pYsOocKn9wnCJEpttlUYW7yRf1rDWWn4k8y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnRimG4cmW79IvJ0BFtIGCBlLpsggNLlU01E33kjVMiNepyA1AP8l5fVWbMYLqjllWrFserIc3f/EubEWrux9zhcTK4WgffSjkxNavysXtDyN81sb8FUardEJZbvYfFD+Nditg606j2osZwwofg91VxV5L/BerAieOmnfowfVJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XasLr8re; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XasLr8re"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a58f79d6e9so20835091cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750965211; x=1751570011; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=crS18D6pYsOocKn9wnCJEpttlUYW7yRf1rDWWn4k8y4=;
        b=XasLr8reO3vrbBr99e5t4kV2TNbCxDx107VzdPPZ0xekEGqJFNGTwV84j+dit0Thip
         f/m3ykGcMqerTw5x5XnDnenOxdvyyE3tfVsmyBjIthaHDefKREYUM2af0V+9UnXKPaVF
         NptBQET6EvPBHBjYTVQLI3tQpu0QaEhSObdK8MXIAnrsLK7x0hM28mtgQwztBHT1snCb
         WavvKdBGm4pkR56YdM6D8KMJl6kw7flVz+KosfP40DFjIqfsOlDLaaAAjjzQ8NPZ3aGi
         vpGCidl333EE8tKa2Wf7vgPAwyOjOxAEWhArR3Rt21nXR73RdY272BiiZT7SkL4G+ckb
         ae1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750965211; x=1751570011;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=crS18D6pYsOocKn9wnCJEpttlUYW7yRf1rDWWn4k8y4=;
        b=xK4KsDYJCzI1SDLNBeHesnOQy1RiV8oX27CmIZpXpmIalVw45wr+eqgqePgtAkF3fK
         kMrmvwJleGmL0pfry6xqLulv78JgCXQoHOpZdSoTNDVlOlzs0beNzq/+x6IqGfhvVo8V
         sM2mMzWk7E+hN9q6AFIALDdwmLEFbmB8dXaTG9HSmwdpQAxhBLAn1KzYR5oF6XadkAey
         Eoud/F5SGiv99t1VrAeehS0EAAOqjvC9Is9azEvZagNnxemlxEQt3smJazRBOFBSA0+q
         z0TsMDAD0ISsBgb7I2zb/TrJjNclUbe8rZR2zQUpzz/8gtyQAy9pE09J1QAPnVxWQnmZ
         JxaA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7pZHOGLmvBgTEpktNjE8+062MhfP52Q9K5GSAoGAVw5SRFaQYQ+UcOuaO489BptBVsBP0KV79azATZM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbcoFHVSEd/wq/J4WaDhAV353Z929t/5qahDCRr3MsqPjYbYE
	A4fY4GjMHFOG/q4V+TgsiNIU6XOI8lECfLghHHvCEWpoIZFffqd1jnUY//+ePAz3U3k=
X-Gm-Gg: ASbGncsXPIaCnlPq0yLUGpTExLtDcl/nWGJ1zbocsL+f8auir0cKh+wzSev4Zgmx4K6
	YzQMwfoS/sXkjVcXOMa6BPZ98yi4NFGDVEdoGChh/WUgTxxtkfpZC+iow4JDI7gu5BiaW2MgGU5
	Cl0xEEvrLyjxHOQj1ZGw/KvJeJTvegIHhc9gtuFqkQmZayMBdU6a+FTmyA09bPUjhCJWbQItcxC
	Y3J3bMq6257aI6jROK91APd0ZNObd5mzNxPsscjGKuIDJRC7N8FfJ26d/icGvO9GZcjmhzLSAyc
	oxf8cVyHZlN3AwI4HlPLRMbb6N4c+bpnIE4dfxG42rh063A1zAX+pku9
X-Google-Smtp-Source: AGHT+IGqA8lQ1cH53ir6fw08KJC7djOdZp2RUrDz1Yj+H2mUSZskC/zuBgb4Amp65i1QQVTm8QBcdA==
X-Received: by 2002:a05:622a:88:b0:494:a23a:cadf with SMTP id d75a77b69052e-4a7fcac48fcmr11154871cf.32.1750965210868;
        Thu, 26 Jun 2025 12:13:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:7aa])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13976bsm2792161cf.18.2025.06.26.12.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 12:13:29 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:13:27 -0500
From: Gregory Price <gourry@gourry.net>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: SeongJae Park <sj@kernel.org>, damon@lists.linux.dev,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com,
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com,
	byungchul@sk.com, ying.huang@linux.alibaba.com, apopple@nvidia.com,
	bijantabatab@micron.com, venkataravis@micron.com,
	emirakhur@micron.com, ajayjoshi@micron.com, vtavarespetr@micron.com
Subject: Re: [RFC PATCH v2 0/2] mm/damon/paddr: Allow interleaving in
 migrate_{hot,cold} actions
Message-ID: <aF2b160mlNozbP4o@gourry-fedora-PF4VCD3F>
References: <20250620180458.5041-1-bijan311@gmail.com>
 <20250620202155.98021-1-sj@kernel.org>
 <aFmq5Y1zKov9__zh@gourry-fedora-PF4VCD3F>
 <CAMvvPS5ievG9Q2w1GEA5BH2mAX-XUR_=oo3AWMnDeUvyRF8jyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvvPS5ievG9Q2w1GEA5BH2mAX-XUR_=oo3AWMnDeUvyRF8jyg@mail.gmail.com>

On Mon, Jun 23, 2025 at 06:21:20PM -0500, Bijan Tabatabai wrote:
> I'm not convinced this is true. If you have a workload that can
> saturate the local bandwidth but not the remote bandwidth, wouldn't
> you want the interleave weights to be more biased towards local memory
> than you would for a workload that can saturate both the local and
> remote bandwidth?
>

That sounds like an argument for task/process/cgroup-local weights, as
opposed to an argument to twiddle global weights.

These things need not solve all problems for everyone.

~Gregory
