Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A732135DE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596246; cv=none; b=aOvFA2DNfj7vaLG0pc5v+/vU5HwOtK0+6LSllucR6lCuNMqQuZ0Kp5YzT/tE/YfxrM3LPBQx9BWPwL9kyVWfEPwgZvaUG+3G6O7Z1Hx+Pg0nsE/y2VzlDJ1i9s9eTK8oYQSfQ4T/sevqSxZSbKakOgh0voM9CXemNUEJZH7/j/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596246; c=relaxed/simple;
	bh=HQGjOlzvci/jDuFTBkrPI44ZTebsBLaao/xXoxWcPnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3/uHPs/LqxJjvaQNt97T6bX+Q4240klh1CTGUecXWw3kJl15tgz5atjsE9OZXm7iGWiFK7O2hHLzCetu74Vb+L+JR3fTEJsBDQomCxd7qahiz/900DsEU4jbS+U+uds7rdz3GiFovJYWrRu9+oHYJVD45IzbiVBNDjhbeg7184=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NzRbdd68; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NzRbdd68"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso30884445e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743596242; x=1744201042; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u+KkYGiRVTeKTKTukwG7gqG5k92Sb1BtHpbYVZQpWnQ=;
        b=NzRbdd68w/3cF3pfboU0wmUuH71+V+SMeqlZNsXE1auOEArhOpUEAHn+BqbSb2agEd
         pgy6C8kN5Zp8lYLNNHT3YS6kpuLyXEw9+XVNH9INSTDR+xBTa+36BBgsLn6lU9PkIaMN
         0dG44DI6R1lNfG48++w2PaTTRUCWcvnePw+uclOq18uMANbrL5GaWUr45k7GP1Okphl8
         Ku7U5N0a+geqOgnCXGVcEPRiVOzzOQg0Ma6vqRb2hfTsRUn0hIyPVFO6z0Kz6ygWQP5p
         zCz8JlKatPuNhLIlMvfSMKkQt9tn9AAYTHopjAw30CzulrTw6yKmsKPSOkCwYPY6pdA5
         GXOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596242; x=1744201042;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u+KkYGiRVTeKTKTukwG7gqG5k92Sb1BtHpbYVZQpWnQ=;
        b=p+WT7GjUknJfexxmnYzytH/utnOEAVPATg+uh5rz4zGvb4TJna3HeQ4Xz/L9hGrYJs
         0iJPQ0q9TRBkSDJCvRYFsZlz9/ZtOAkmMBwoXm0y+ao4mbNhim0U/177bArhTH/q1TJj
         vrdoGwCnr5NrMqMFLP8pSPjm3t+5pXhJtq4AWMo9/zxPBi4vZgXwZ3ijX2mv6gPcdY61
         yMzD0Nmplau73Sdu6Hp4O/oRF7YFQIeICndzH+k2jSa544X8EY/ulpW1FOsCc2dmG9TP
         eaH6aGnMtxJL38f0wXdAIylIbiqiymNNVicCR+Wmp+qw3K5hJb0biBRkT6KLZBO6ibnj
         jTxA==
X-Forwarded-Encrypted: i=1; AJvYcCV+eTsjDlFRhhF3SQqIg/RThDZv3Hayqyyu0+GWthiNkF4kOpQqPG9BNUlli8Yz0i3Dh1zRl8hGBziuis4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKn29jiCcFxVmJh0QUWSsSHWXTaf5PU6SYq1Jw4m7TTSICRIH/
	Y6kHrQl4MvnlrVAhno93tFoNlY+guzAR+kFDPYMgP7kTOgMCvtQVli0awfvH3xLw24Puxw31ULy
	Q
X-Gm-Gg: ASbGncvwhztzpHJLYLUArMBCkGWYfnx6ivnhpiUOVjQ3dy5J12ccp8wepirUya1Mal8
	h5YknmNqr/liDXWSLQPEzVhx898GGJNSXpYZvKLdNoa9uzCunsGhJRE9WXxM7G52kM1nqMhr6V8
	MWroZYtEr547+fC2bUiFLos3hEFC54zumfIFk2F6SMxswIiMgK1AOvM9eFfuvSk7WJ79yWVD2oc
	zhQweb3BlXQ8FBTxKWliKf3a4FTmaW8q8AZO+xOezdJ7wJqgZixg1YVmdVuelp0YLj+dNNHh4ix
	bwNpAQjPRbr/yvlIYkJWiSFmVV7nm4a/Lra7ssmDXzm8rndYkRACX8G+fA==
X-Google-Smtp-Source: AGHT+IEzL1dLp6w4/vrpTpg8YH1leTJhRx3ESY+EtSrwaEQ5UAajY5nV9dBkST09FFg5gDba1jeZjA==
X-Received: by 2002:a05:600c:3d0c:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-43e8eeb6696mr111382655e9.28.1743596241822;
        Wed, 02 Apr 2025 05:17:21 -0700 (PDT)
Received: from localhost (109-81-92-185.rct.o2.cz. [109.81.92.185])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb5fd138esm18831065e9.13.2025.04.02.05.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:17:21 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:17:20 +0200
From: Michal Hocko <mhocko@suse.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Yafang Shao <laoar.shao@gmail.com>, Harry Yoo <harry.yoo@oracle.com>,
	Kees Cook <kees@kernel.org>, joel.granados@kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	Josef Bacik <josef@toxicpanda.com>, linux-mm@kvack.org
Subject: Re: [PATCH] proc: Avoid costly high-order page allocations when
 reading proc files
Message-ID: <Z-0q0LIsb03f9TfC@tiehlicka>
References: <20250401073046.51121-1-laoar.shao@gmail.com>
 <3315D21B-0772-4312-BCFB-402F408B0EF6@kernel.org>
 <Z-y50vEs_9MbjQhi@harry>
 <CALOAHbBSvMuZnKF_vy3kGGNOCg5N2CgomLhxMxjn8RNwMTrw7A@mail.gmail.com>
 <c6823186-9267-418c-a676-390be9d4524d@suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6823186-9267-418c-a676-390be9d4524d@suse.cz>

On Wed 02-04-25 11:25:12, Vlastimil Babka wrote:
> On 4/2/25 10:42, Yafang Shao wrote:
> > On Wed, Apr 2, 2025 at 12:15 PM Harry Yoo <harry.yoo@oracle.com> wrote:
> >>
> >> On Tue, Apr 01, 2025 at 07:01:04AM -0700, Kees Cook wrote:
> >> >
> >> >
> >> > On April 1, 2025 12:30:46 AM PDT, Yafang Shao <laoar.shao@gmail.com> wrote:
> >> > >While investigating a kcompactd 100% CPU utilization issue in production, I
> >> > >observed frequent costly high-order (order-6) page allocations triggered by
> >> > >proc file reads from monitoring tools. This can be reproduced with a simple
> >> > >test case:
> >> > >
> >> > >  fd = open(PROC_FILE, O_RDONLY);
> >> > >  size = read(fd, buff, 256KB);
> >> > >  close(fd);
> >> > >
> >> > >Although we should modify the monitoring tools to use smaller buffer sizes,
> >> > >we should also enhance the kernel to prevent these expensive high-order
> >> > >allocations.
> >> > >
> >> > >Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> >> > >Cc: Josef Bacik <josef@toxicpanda.com>
> >> > >---
> >> > > fs/proc/proc_sysctl.c | 10 +++++++++-
> >> > > 1 file changed, 9 insertions(+), 1 deletion(-)
> >> > >
> >> > >diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
> >> > >index cc9d74a06ff0..c53ba733bda5 100644
> >> > >--- a/fs/proc/proc_sysctl.c
> >> > >+++ b/fs/proc/proc_sysctl.c
> >> > >@@ -581,7 +581,15 @@ static ssize_t proc_sys_call_handler(struct kiocb *iocb, struct iov_iter *iter,
> >> > >     error = -ENOMEM;
> >> > >     if (count >= KMALLOC_MAX_SIZE)
> >> > >             goto out;
> >> > >-    kbuf = kvzalloc(count + 1, GFP_KERNEL);
> >> > >+
> >> > >+    /*
> >> > >+     * Use vmalloc if the count is too large to avoid costly high-order page
> >> > >+     * allocations.
> >> > >+     */
> >> > >+    if (count < (PAGE_SIZE << PAGE_ALLOC_COSTLY_ORDER))
> >> > >+            kbuf = kvzalloc(count + 1, GFP_KERNEL);
> >> >
> >> > Why not move this check into kvmalloc family?
> >>
> >> Hmm should this check really be in kvmalloc family?
> > 
> > Modifying the existing kvmalloc functions risks performance regressions.
> > Could we instead introduce a new variant like vkmalloc() (favoring
> > vmalloc over kmalloc) or kvmalloc_costless()?
> 
> We have gfp flags and kmalloc_gfp_adjust() to moderate how aggressive
> kmalloc() is before the vmalloc() fallback. It does e.g.:
> 
>                 if (!(flags & __GFP_RETRY_MAYFAIL))
>                         flags |= __GFP_NORETRY;
> 
> However if your problem is kcompactd utilization then the kmalloc() attempt
> would have to avoid ___GFP_KSWAPD_RECLAIM to avoid waking up kswapd and then
> kcompactd. Should we remove the flag for costly orders? Dunno. Ideally the
> deferred compaction mechanism would limit the issue in the first place.

Yes, triggering heavy compation for costly allocations seems to be quite
bad. We have GFP_RETRY_MAYFAIL for that purpose if the caller really
needs the allocation to try really hard.

> The ad-hoc fixing up of a particular place (/proc files reading) or creating
> a new vkmalloc() and then spreading its use as you see other places
> triggering the issue seems quite suboptimal to me.

Yes I absolutely agree.
-- 
Michal Hocko
SUSE Labs
