Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0808F14C5AF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884275; cv=none; b=eC/eO4T5N1RLfHfUXNAO3nkhfLklX0XmNZWGM0q4xis8iAe5eaikISCP56HrxOHkTF0zVh719uqEyFgLVdL/KRsmlaP8XRVLQVI0+IodCwA19WUZYfmgMYb+boyF0w5ClPhkXkbt1/MXj+zPWHj78fRAkHmFJaPONyvkysoyubo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884275; c=relaxed/simple;
	bh=yI/QjEFiRbzYROrrVK9ovHwJdKFgWIa/T1dCRlMSS7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ec0sU7TOZOEdV7eIb5MC5sAAy+FHCYK658iho3xy+nAwn+I4/U0y9pzS86y++FJoj1t/CHJ3aQbLxOiLyUS1Wt6Rx7NLnsXwtZ83M4y1G1UNM/NCXJs2q2aHVik2toLl+UXS1ZP+NoXfFBOJImmzwnVxRCpgjPInXh4Xby+EZzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=O8EqUbW1; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="O8EqUbW1"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7c5e39d1e0eso821742085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1747884270; x=1748489070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E5TjajkYSjEmfGrYxjqmKvH2G1sV9IOth95tHnXoWRY=;
        b=O8EqUbW1wNWMOK9vhBbtDxI5H8wW/6chJ/IZ6MbI+SA47oDf8Ef1/EFjq3f36xIUVo
         dddg8cQSXNxIfb700dLleuCIOKrpqCZ46qNM1QPIza8GN4qTgrXhGr52dzsi8m5GU6SL
         LdE3dGCxuFDgkkRfOFIYHVDQ98lLD+R8QXV217ZMW5E9fCPOtYSoazr2/C9hp+D8cPok
         fey4YqXGEuOJ1lDpUenuLIMvy03Kd0CpnIzo+gk5oxLc1xptlM0mQbXEqfsCh4yp9MeJ
         A5F4Xd/wV5R/5N/H6+TJEEOAsIRGP2FKPHLsNxp1VV89sjjPFXrbWv+W69A5A6frloEz
         /NZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747884270; x=1748489070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5TjajkYSjEmfGrYxjqmKvH2G1sV9IOth95tHnXoWRY=;
        b=HG51gqNE4wd7MZ8SnG7dIofu8xOfYT5WW/jcjXRKdmZWmrZW0sI0q6E+3W34eGFzXJ
         3G8YRkorftM+00wktza7urPPnKpRKBeJ7Z6RFv9rs0BG9GMHEvlGf3qq8njFWTx36Gyz
         YtD+ULAZoIIdQAcIT+Uz1/6Mzo46Gwd8J9eA7ohp16Z29ikbuujQTRjvYp/wGonscgqy
         93LdNwb018rpnRK/NujFX2C043FoNQKT37UwLX0xC0HXS6a9GJVl5xPIgrVi/5nWu5at
         b000E6sbL/zgWQcFsWauJHI5Zphp4WwegsoMcbJKmO+artKgk3yLh7oFXrdFza1ZJLJK
         XpWw==
X-Forwarded-Encrypted: i=1; AJvYcCVbdJUo9Z7oc6klJveZO6WShMxIdEKeIHjHLhp/OI3PfQ2ZoYAujBz13kABiihLSfNoatqgoNpGrHFsb7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrz2HdkBee4nYZo08oVDRL2d61kpPwCB5xldgqZh0MdpDM/Abd
	pk3khnZ9Zyn5Ao5w91e2IThjt1XV5Rf2n1bZIC3rCmjmMjaNnO/4Kz9faiTPRL7ytWE=
X-Gm-Gg: ASbGncvd4MegrKkSjEn2l9VaCfgfY7XrbW/lJPCRCFwd9v4s5+QCDko/urYLI7rb3xq
	YAVEkNgvfRrqXwc1utDmYtsZ2PzGKKQA1EFGzwOPqCrqTvM+MkVbg8AhFGUYGG8mlvSNaWaufeh
	sh76thdRZboRMX/YexAglm4yyQqeWDXjO470RTMpEw8olsW/DzY4ikJAHaQeUtyssqviuAj0Ty8
	FmBfWbXAEUMekbD52caRRHnw/rE9nWab/DirHzgLj3iud3AfI0qqsRPdECaWM/DQccWEC2iw3/2
	cC6ZcyKZB1V2+HdADzM6MXH/OERThhj+ZUfkz1ICSbj95NsL+AiIqmYY04DtCzcW8hW5K5ixocG
	ppVbqtGu8MofdFaiODd0U8IslvyDWV+w=
X-Google-Smtp-Source: AGHT+IFlNZoRIQe8OldWR0UY8ZEOpk/XIxhR5A/zXGfp3gJAu4BbyWQIode8EhuTj4ZM40hjU74YjQ==
X-Received: by 2002:a05:620a:410a:b0:7c5:49e3:3347 with SMTP id af79cd13be357-7cd47fc65c0mr3184975285a.35.1747884269752;
        Wed, 21 May 2025 20:24:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-42.washdc.ftas.verizon.net. [96.255.20.42])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468cb64asm963413385a.99.2025.05.21.20.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:24:29 -0700 (PDT)
Date: Wed, 21 May 2025 23:24:27 -0400
From: Gregory Price <gourry@gourry.net>
To: Zi Yan <ziy@nvidia.com>
Cc: Bharata B Rao <bharata@amd.com>, Donet Tom <donettom@linux.ibm.com>,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
	peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
	rientjes@google.com, sj@kernel.org, weixugc@google.com,
	willy@infradead.org, ying.huang@linux.alibaba.com,
	dave@stgolabs.net, nifan.cxl@gmail.com, joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
Message-ID: <aC6Y6-h7lWLcZIwC@gourry-fedora-PF4VCD3F>
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
 <a6c42783-baf6-4463-a2f5-9a6d3e380865@linux.ibm.com>
 <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6795B38D-7858-4ADE-BB3B-71A1950A284D@nvidia.com>

On Wed, May 21, 2025 at 02:40:53PM -0400, Zi Yan wrote:
> On 21 May 2025, at 14:25, Donet Tom wrote:
> > Hi Bharatha,
> >
> > This is target node ID right?
> 
> In memory tiering mode, folio_last_cpupid() gives page access time
> for slow memory folios. In !folio_use_access_time() case,
> folio_last_cpupid() gives last cpupid. Now it is reused for node
> id. It is too confusing. At least, a new function like folio_get_target_nid()
> should be added to return a nid only if folio is isolated.
>

The really annoying part of all of this is

#ifdef CONFIG_NUMA_BALANCING
#ifdef LAST_CPUPID_NOT_IN_PAGE_FLAGS
static inline int folio_last_cpupid(struct folio *folio)
{
        return folio->_last_cpupid;
}
#else
static inline int folio_last_cpupid(struct folio *folio)
{
        return (folio->flags >> LAST_CPUPID_PGSHIFT) & LAST_CPUPID_MASK;
}
#endif
#else /* !CONFIG_NUMA_BALANCING */
static inline int folio_last_cpupid(struct folio *folio)
{
        return folio_nid(folio); /* XXX */
}
...
#endif

Obviously we don't have to care about the !NUMAB case, but what a silly
muxing we have going on here (I get it, space is tight - the interfaces
are just confusing is all).

My question is whether there's some kind of race condition here if the
mode changes between isolate and fetch.  Can we "fetch a node id" and
end up with a cpupid because someone toggled the between tiering and
balancing?

If we can answer that, then implementing folio_last_cpupid and
folio_last_access_nid can return -1 if called in the wrong mode
(assuming this check isn't too expensive).  That would be a nice cleanup
for readability sake.

~Gregory
