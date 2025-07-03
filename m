Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FD12652B6
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543489; cv=none; b=WFqewpiKxcQ1XzHnZc042p8pjfVnHPbKK+Woxh+c6AWXruM9OFrMTpPtnmt2gwaD5GaLZlkbJLSpvVMD6r7xaEsqzCCvxkzzbpuBVX23ET/bwGjLY0yBZyjY7PG4DYLO4hGUbAx3BreGtTtUXmrqDvt9iYXjDW0BVQmoPHmGzDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543489; c=relaxed/simple;
	bh=/0j4jswbIRiUGTdneZLrh3IdM0dyf9SEvjzMRbCj49s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fc4mpuzoWqolEFNNm4G04Vqjgmj/A7JYrBjZ3Tzd57jPAi4Fs0GiLvIf3buRD5mDflne2V4pbR2BRHT/5QIkAkkGYuh/jfn8wxObYfYB+94cKnF67JCE7tUDFTP+EjQH1v9THdhxAgAJLhtOReX1Lj8v56EsqSpJwn5BYQp4UY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DWH7Rk6i; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DWH7Rk6i"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45310223677so38721475e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 04:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751543485; x=1752148285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rrrFh3aMNUftYeIl/W20mryU+H1tSv2aJEtukCIEaG8=;
        b=DWH7Rk6iEf6ZpWWi5ZILkwYDe34zDEnZrJhLiOazJpbxIofrBnLZx5c7VMD3/SyWCG
         A49clUQ2VCQ5PcOgVv/m4lxza4M2u9s9ndv9iyoodKJzglXuLFGiG9nj1F+GLBnjgTOb
         u/LTEFt+kV79OVgoxkhEL22rBV+r6vn5tFGI8TRgBy9WZ0+SnV8JbJwr058dtLIDZ+gG
         HBq/OY4DjBu4YcZfo1dWd3vLFL0Z22KrxWNiGqqNzdzjiocj0EPJ0wcC+LIiCcUDlUPu
         D0I/iNwfzlswIdyL+4e5jQCDOTpkPHzIzfPf+LsqRHsnxBLUCXlcdK1O85pRnh/81Vqq
         c0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751543485; x=1752148285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrrFh3aMNUftYeIl/W20mryU+H1tSv2aJEtukCIEaG8=;
        b=KAstkFFDZyfhwCKOdb2LSMXG93Kh2JWa5EhduhzYFYCVf6YxEaBETwpjt6wG5GldlI
         1+MoXydONjVVGo/HlHCRoOm1sCJ15tz5dpiNYm8JkIpblb5sXnrIVN0EOlhEQk3x5UXi
         r6Yvjz4h3usXS8OYur9rXvwbRL1EvhqEIq0E505etenmZ+OA4oJmlWMAr+8TDGTupejV
         Rhyt6XloTPtD7CUNHDFgIvh+5w+9aEFGpmPYERhk0Ak3Afoog/FPOL6DmB6d11GJQawT
         kFFOhUyW8nuNeetCYW18Bu351cdm/ZDWQ8WKz4uRzdbge3g8qmWpgDztMgfRu4mLa5qv
         c2jA==
X-Forwarded-Encrypted: i=1; AJvYcCXQbMs5LyvEsSgeCbASKTYDB6XkmZ5QytBE4b2oWu4eOlTnSmSDFhJvZtqNUMjJQ0gis/MY6j0qZEk9gFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy33Whv6XpUjT73TFhUu6I7EcJL3q59UjJo7Wxz6SHiFppdaxHw
	sqhVqb8u947IxdQdTC77twimFsbHV25eSV2UxJgVc6znyOpkrNdg5uVmkuBo6BawYek=
X-Gm-Gg: ASbGnct3IYyKSsj7IfNWZelYkb5blhnMTmW+eu2E0k3RCz6k5AyU+JW/R61Ra8JY7fd
	8JUEWwBaNPBrrX66vdpq9drJJiCc+SGSikMlFEFQiI2zvmCrZvKx37qC/i4lZLx8A7TvIDIgPwZ
	ZWl0bttyCFD7tsIoGc6o7HTwzuPnVRzkAr1QFE/DN9dd5hS0RFvbRJ9RFCZALr/qtL/pvfbLHNm
	KW3jPYff4J8Cwopw5vlc32VYFHCEZePGTqCH63rAqDxaTCk7J5qCGUGK828F6sBzCCrgrwBVtBj
	MD2HzzcMfftSl07KfJ3QdwewGYiNAGwXBSyd9mG3+J8TdJwdw4CEQmn6PQCs0zufzdJy2PB9xRE
	=
X-Google-Smtp-Source: AGHT+IF7aw9qrLA/mudlWrFYz7YQPrV+N6PiVAkzq0LbHOkvaWMe3Rzuewqn1RS1jI262rd7wVaNWw==
X-Received: by 2002:a05:600c:1396:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-454a372160bmr58039885e9.28.1751543485195;
        Thu, 03 Jul 2025 04:51:25 -0700 (PDT)
Received: from localhost (109-81-23-161.rct.o2.cz. [109.81.23.161])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a88c7fa751sm7511930f8f.25.2025.07.03.04.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 04:51:24 -0700 (PDT)
Date: Thu, 3 Jul 2025 13:51:23 +0200
From: Michal Hocko <mhocko@suse.com>
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Tim Chen <tim.c.chen@intel.com>, linux-kernel@vger.kernel.org,
	Jirka Hladky <jhladky@redhat.com>,
	Srikanth Aithal <Srikanth.Aithal@amd.com>,
	Suneeth D <Suneeth.D@amd.com>, Libo Chen <libo.chen@oracle.com>
Subject: Re: [PATCH] sched/numa: Fix NULL pointer access to mm_struct durng
 task swap
Message-ID: <aGZuuxxTI6tFOTWK@tiehlicka>
References: <20250702163247.324439-1-yu.c.chen@intel.com>
 <aGYutwftSAPgPzf-@tiehlicka>
 <b6b9e035-5227-4aab-a0cb-0ab6e4d57f9a@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b6b9e035-5227-4aab-a0cb-0ab6e4d57f9a@intel.com>

On Thu 03-07-25 17:37:23, Chen, Yu C wrote:
> Hi Michal,
> 
> On 7/3/2025 3:18 PM, Michal Hocko wrote:
> > On Thu 03-07-25 00:32:47, Chen Yu wrote:
[...]
> > > +
> > > +		if (p->mm)
> > > +			count_memcg_event_mm(p->mm, NUMA_TASK_SWAP);
> > > +	}
> > 
> > Why are you testing for p->mm here? Isn't PF_EXITING test sufficient?
> > A robust way to guarantee non-NULL mm against races when a task is
> > exiting is find_lock_task_mm. Probably too heavy weight for this path.
> 
> I suppose we might only need to grab task_lock(p), check if its mm
> pointer is NULL. If yes, we skip the update of memcg event without
> scanning for a non-NULL mm within the process(as find_lock_task_mm()
> does)? If the mm is non-NULL, we update the memcg event with task_lock(p)
> hold and releases it later.

Why not use find_lock_task_mm if task_lock is acceptable for this code
path?
-- 
Michal Hocko
SUSE Labs
