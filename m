Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54F71E503D
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 17:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738259212; cv=none; b=O1q7lX3dm/l5JMTSfhQbTo0IR4nBGJUOwTyIXis/UtN5+Pt8bFVFiGS8RNvhcJCHEeRtzUWRBDPHxtIxsjTLwQ7DgCMkmKOieL5+6MJfV0oIXX1sqT3Okr0MwSqUm818TTNT/1jAE6A2oxhhZ7RS7OdPBmjQMeUHP3FbBgi48ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738259212; c=relaxed/simple;
	bh=ogl1Z2kVUAuTJ+ak39fztfgetEJPSLa4WcOE8DCy6Pc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgY7NJem1eFPigSZjAEJaM1ltiy1YRDmkWlD+AMlK9c8YMphGPQUqzValiuYgYuRcJZ/qk6Ie5aqpzUzLUxYSUK2V9vCNpF5+s7xYie+wFiAF1M0xUKYOzKI49Eedvlh/Fl7TXeqhpf3/qULDjn5ioOazHoVXBbSzCPRx4Y+nHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YZi+b1a/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YZi+b1a/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5db6890b64eso2012371a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738259208; x=1738864008; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5snQbJ38VvBoZa24EBcVoHQPXCYbY/0kZ4L1ZVXjM+M=;
        b=YZi+b1a/jON4BqrLs+ezTnwhL4NgdofSHfrgK+qvtHjDe/ds4mBOY4KYiBBJjXGk/U
         bnQiViaEr7fhHnK7l4c5RvPUAn+IisHW63N6LiLzwooImLYdP5JoPk6IP/w244JK/DTT
         qUFTiOGMxxkcwoBk/7H4LKfv5epKt88UvvlRPLu6D67/qKB7jCjR7Z8twLUBmz1Kjt3D
         AjDDNgCNa75BiyEvtzDkeEnCasLMT/Gwm9qV9PZCFLoKbPC66DG0HrmlPxnXjYZx8XWw
         MTQRJuRotDeuaEi+3NrX60/boLoXyHvVt2a1yEVf5AGr+fqTMxmaLivS6ON4lMqAt+au
         rQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738259208; x=1738864008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5snQbJ38VvBoZa24EBcVoHQPXCYbY/0kZ4L1ZVXjM+M=;
        b=p7ytvZw76VM31v5qN7VVI9qPJTHee/9y2NTnY8gdnvfhS/aAmOHjofCH48+8pfjeVz
         oef0SKobzbYhUoKNei5kKJspkLxDzKksbkktZlTWfbuSmPd94K4fhkk5Wur6a3Rgatc4
         ccSTAL/H9nzF8nKJI07Nq6Cee1LoqFSvbNu0TZFPJXWjSg+JXJ0vZ3QdI1CkzNIat9O9
         n6hJziXjzpv67/fDKmyHzA0pia2VyFVXiZjuIul3Ik37+ub7QtblcI9o2d15fC2zZRjI
         ImbCrzbUJ4rKHym+QwdsTExk3MnVLnDEjhT7QnWKxaE2dlZsbocOUFgiwu5kW90eYZMA
         5RJw==
X-Forwarded-Encrypted: i=1; AJvYcCV+/5T3W4PAHpnRiyzmQ3LaI6cx8qTgq4Wfp7hBLZmdoOrSpa7ijLPSavyfoCnoKptUsBng+mnK/AZrAEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoD25lWmh69hWG+MxjHCVvECk96zJKiV9IKDB2PVdBzSRSIncx
	tEAbk6mfvhjvfcNc45NMVqVNXdMjWjf1RX3i05vHIEkGscB4fC+fkKkTN0tZqy4=
X-Gm-Gg: ASbGncu2/5bmOlwwLsKGVKOM+q/C/iFklRvCwqCMbw9vOnkkb+NlzNxu402B5XoRUoo
	yf4YDoIyTH7PdQaVGOjlEUH6FpqYqGYBadX0k2IhwLBbNAhVynaupfR3zzNwgnSzHekqTG/YS8i
	cED25oZVm2rvXjzlN6mT09insunrfgTWNFwVUeftwmHp+WVuRXvQ3h20G8wQJQwxCHniA42+j+S
	/1PdDa1zkumPh7dnW/uZHBPtKu9aoxA33dSKvBZA79pDbXKm8JDwmKVxmkM4UAB3h5rF+p6zuxJ
	XOH4L/rE6KlhcgO6yeCnYt5dsA==
X-Google-Smtp-Source: AGHT+IECYjOfJz2tOjzTqFxLsspzu/nakrwmV49yfXfMxCTrHiIH5vR5VrgKigD70NLDeXJhSYb9BA==
X-Received: by 2002:a17:907:9726:b0:aa6:b473:8500 with SMTP id a640c23a62f3a-ab6cfda4249mr845523666b.42.1738259208184;
        Thu, 30 Jan 2025 09:46:48 -0800 (PST)
Received: from localhost (109-81-84-37.rct.o2.cz. [109.81.84.37])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab6e47cf883sm154114966b.49.2025.01.30.09.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 09:46:47 -0800 (PST)
Date: Thu, 30 Jan 2025 18:46:46 +0100
From: Michal Hocko <mhocko@suse.com>
To: Waiman Long <llong@redhat.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	Peter Hunt <pehunt@redhat.com>
Subject: Re: [RFC PATCH] mm, memcg: introduce memory.high.throttle
Message-ID: <Z5u7Bk_ph6AJWt4O@tiehlicka>
References: <20250129191204.368199-1-longman@redhat.com>
 <Z5s1DG2YVH78RWpR@tiehlicka>
 <211b394b-3b9a-4872-8c07-b185386487d3@redhat.com>
 <Z5uxVzFf7Pk7yk9f@google.com>
 <a309f420-4a25-4cf5-b6f0-750059c8467c@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a309f420-4a25-4cf5-b6f0-750059c8467c@redhat.com>

On Thu 30-01-25 12:19:38, Waiman Long wrote:
> On 1/30/25 12:05 PM, Roman Gushchin wrote:
> > On Thu, Jan 30, 2025 at 10:05:34AM -0500, Waiman Long wrote:
[...]
> > > > Why cannot they achieve the same with the existing events/metrics we
> > > > already do provide? Most notably PSI which is properly accounted when
> > > > a task is throttled due to memory.high throttling.
> > > That will require the use of a userspace management agent that looks for
> > > these stalling conditions and make the kill, if necessary. There are
> > > certainly users out there that want to get some benefit of using memory.high
> > > like early memory reclaim without the trouble of handling these kind of
> > > stalling conditions.

Could you expand more on that? As long as the memory is reasonably
reclaimable then the hard (max) limit is exactly what you need. If you
want to implement oom policy in the userspace you have high limit to get
notifications about the memory pressure. Why this is insufficient?

> > So you basically want to force the workload into some sort of a proactive
> > reclaim but without an artificial slow down?
> > It makes some sense to me, but
> > 1) Idk if it deserves a new API, because it can be relatively easy implemented
> >    in userspace by a daemon which monitors cgroups usage and reclaims the memory
> >    if necessarily. No kernel changes are needed.
> > 2) If new API is introduced, I think it's better to introduce a new limit,
> >    e.g. memory.target, keeping memory.high semantics intact.
> 
> Yes, you are right about that. Introducing a new "memory.target" without
> disturbing the existing "memory.high" semantics will work for me too.

I thought those usecases want to kill misbehaving containers rather than
burning time trying to reclaim. I do not understand how will such a new
limit help to achieve that.
-- 
Michal Hocko
SUSE Labs
