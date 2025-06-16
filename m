Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978482BF002
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 17:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750095807; cv=none; b=hxE9Jw/uOmEpqvFqt1EpCIkyApp9qYkidRf5ARQ3uoPB/mwJ1XpYDpyN6kl+BAfnS63MEKPtdxslYs7nTz4CwUOtjYoI+93tUvhn8FqR9HRxLelmdh1vgea4QYvDT8TN1HPHRmGbyo6iEvulMjX3JsHqiJkdoPT364+1hX2oSS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750095807; c=relaxed/simple;
	bh=4gWRKYjPld+Y1uH823VRVyouLBLTGOzXlpdHtiU3vMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJKAPuEscXSNVFzMNXSduh/GUmT+PRZNK4munZ3F8HDDl3RYicUoIvwEGITemUVrUPN7b3V3quZZW9KrKcMiJZu+ymq24G7XTzRRZlTaDSk4RTotCfLuGHAqoOt5JgbphKg7oJGgUyM0pHb2P5hrI/+M2jr50eyh6Cwb7LKH+ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qtN0Fnqz; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qtN0Fnqz"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d20f799fe9so562860685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 10:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1750095804; x=1750700604; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5/4yKvTkyWVd/1WyBWdEpHbqHXZjmiKnTF2OwJ8AWbI=;
        b=qtN0FnqztxqhC0GPXZamrnxaKrAQsZsiPXNW7I6FF0jhXmxbNgIShbCA/0S28U/gLn
         jlQM1ygmlnE78/29xY6mxZUvYyujXYKDbF3/4jQm2/LYIG5ya9S4Anc5+DfwY89WfiFQ
         yzjVXxguXu5/Ic7gQ3/kHFDl5ul+5ZClQsX5aiEFN4lEaXXuEYcptxyu2ADeC1mRnxJE
         2akvDxKuWCtfqaPWGt1pphWaP/XdLEcO8bIeSRYLtcP2fByoJSqo80fNJxH0wmDysT4v
         0CKVutcSRcqQJPIgIeYTTfUxkom0zfCUjKQUYHzaGPsR3mK0UCH/TvRHWGwNoX5DI/TH
         m0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750095804; x=1750700604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5/4yKvTkyWVd/1WyBWdEpHbqHXZjmiKnTF2OwJ8AWbI=;
        b=ZNrOU9F2HcUhiUc5GolbqJgRbHgTlB8hINhnTrxM+97m76+K6iHD4dUW0XAgeF/LCn
         P1iEeReo58hAqzDDhOOatqcJgpa6/mpjpajyp5mm/z1WzdzO49+nIKxwz/sm5U1OEhI3
         ucdLP1ilf2sA/I4dW0t6y5Ps0zT035W23Hb5C99lqFtX0lztTRm2BEWJr9XTEEnOtt8D
         KTNHk+zFpbokHw7lA1/Txcitc5kGRK3fIFh7UWVFoVqDGpW3F+qqlsWBxtBqkmr8krKT
         PdeWEJdKlKb0772g/8hkT5EwY+JN9Db5c/NCZjVIImVCLqtkaC35csTHxjiMKsQboMwv
         XTbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVuX2jr3bl+Pvj9dkVnZOwD37L7quRFL99RSyXPVfscd0HWOnJ3ZUbQ+lZqf5XVjHgvrYv9DS0rnafn2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU7TKKaZjm6NmK6ywnGTYhQICiToaoA0AQJM8I4KRSKr1OJKFj
	k4lbdIujRW8BiBPXcC9O+1kKW4zGh/XsbS4Nx9TigrKmjR+pQpi+Ic21HgSS7vwfxpk=
X-Gm-Gg: ASbGncty23QQjkLZ0ySN6DPOvVADrtuQvuBiywItQgk+xbH6sBc7eU3w2Z9HcVTiQMT
	0tq4xthnDYhiikcl7IXQCiZYIvadjdI+NL8Do0v09XrLkrhJwmiqzLFTTGxGsItWTmxVLE9cmLM
	V0lvfilPvI+GMXezvGCT2rMEL6i0d3UnQ+68SIvXK0sRW58akpU82ri/5PagUd5WlfVvsSD7Jjo
	9R4LS4WBuScUVFP8Az7e1xvrwQyZiUtvRU7dRINK8B8mSXO5lhvs99Aw/MSFd/m5IHyzf+PnFoq
	ahxa2Hj6ZENMN1zs4eA8iSvrKYh/N5UyMbzzGiNSvBV4kavWGmsar6merQ==
X-Google-Smtp-Source: AGHT+IHUYY/n0yispU7eDUw6kgUep9wTEjSSBo8Jf7TL4kZ2IW3kTqXn60pb1DKcSyyGtFKJ/3beCA==
X-Received: by 2002:a05:620a:3728:b0:7d3:8c44:b7b1 with SMTP id af79cd13be357-7d3c6c0962emr1601991885a.3.1750095804599;
        Mon, 16 Jun 2025 10:43:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F ([2620:10d:c091:400::5:cf64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a0fcd34sm51514371cf.0.2025.06.16.10.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 10:43:23 -0700 (PDT)
Date: Mon, 16 Jun 2025 12:43:21 -0500
From: Gregory Price <gourry@gourry.net>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	sj@kernel.org, akpm@linux-foundation.org, corbet@lwn.net,
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	apopple@nvidia.com, bijantabatab@micron.com,
	venkataravis@micron.com, emirakhur@micron.com, ajayjoshi@micron.com,
	vtavarespetr@micron.com, damon@lists.linux.dev
Subject: Re: [RFC PATCH 1/4] mm/mempolicy: Expose policy_nodemask() in
 include/linux/mempolicy.h
Message-ID: <aFBXuTtwhAV7BHeY@gourry-fedora-PF4VCD3F>
References: <20250612181330.31236-1-bijan311@gmail.com>
 <20250612181330.31236-2-bijan311@gmail.com>
 <5a50eeba-b26d-4913-8016-45278608a1ee@redhat.com>
 <CAMvvPS5U8exSvy0fknfhv8ym_dKgMVa7cfMOqn0fGyd+NSjSuQ@mail.gmail.com>
 <e40aa590-f0a2-4666-84b0-c33c8f4fef87@redhat.com>
 <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMvvPS5bTUfAXy4g79tAq+1DWKX79b33Jt=UNBg-xR9BDa7FdA@mail.gmail.com>

On Mon, Jun 16, 2025 at 09:16:55AM -0500, Bijan Tabatabai wrote:
> >
> > Which, you also have during the rmap walk.
> 
> There is another subtle dependency in get_vma_policy.
> It first checks if a VMA policy exists, and if it doesn't, it uses the
> task policy of the current task, which doesn't make sense when called
> by a kdamond thread.
> 
> However, I don't think this will change what seems to be our consensus
> of adding a new helper function.
> 

Hate to interject here, but this gets worse the further you dig in.  The
mempolicy interface as a whole has many, many, many hidden references to
current->mempolicy and current->mems_allowed.  External interface
references to a task or vma mempolicy is a problem i explored somewhat
extensively when I prototyped `set_mempolicy2()`. It did not go well.

Generally, mempolicy is not well structured to allow external actors on
a task's mempolicy.  Accessing a task's mempolicy requires operating in
a task's context or at least taking a reference on that task's mempolicy
(which requires taking the task_struct lock).

I will just say that mempolicy is *extremely* current-task centric - and
very much allocation-time centric (i.e. the internal workings don't
really want to consider migration all that much).  You'll probably find
that this project requires rethinking mempolicy's external interfaces in
general (which is sorely needed anyway).

I think this path to modifying mempolicy to support DAMON is a bit
ambitious for where mempolicy is at the moment. You may be better off
duplicating the interleave-weight logic and making some helper functions
to get the weight data, and then coming back around to generalize it
later.

~Gregory
