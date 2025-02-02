Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66121A8F94
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 15:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738510442; cv=none; b=aMjj0mfIJEr8XmAmZljmZb2WyaOgPFNTjN4orVd7ZnwXl5pRIHGl7Bi2p7udXnn7s9OaYUrCb7eCgpUH1q8jItXt5g20qrCTwmm9eXILBi7pDtOAUBYYscagii8L5eYtq+I9QkzlB33sfDXwt72WJrRdDVqIn8S4vhj9AEq8RQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738510442; c=relaxed/simple;
	bh=owdRAMzaE7eCsHwDsUOCZHwltpddZ38V0AUoHIOHq1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYrPJeq8PIPcWe+wz+TqPeNtbLA+0G6EQTMYD8BtFEqRRkeH60GNwAdPBGbdNHwfRRmCeURsi/zzEAfnGSPHyW0IISjXp3LXxbetsGMbmbl6MU+hi3Cjk2gWzIgwEpExVN/wSeVokCBlT9HMe9kdejMNpG6JsAG83DiGQj6bFLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TjSkVXIt; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TjSkVXIt"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2162c0f6a39so80208085ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 07:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738510440; x=1739115240; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TU50LgvcMc+vKDA8dmnHN9nuVOU92uamVuQ5fzwgtTw=;
        b=TjSkVXItJZ5ykwhm/8jmbCnxOL3J3FrsEO7Txim8FaXeF+kQjM+7zXemtxq7l8g816
         oHcziL7rp9IXlsCBNeR5o4hPHQXHUjmKUOAQIWKveS5pRhXlKej/Q8wRUHUE2d7/0656
         /7UxCEeIQbCdnBuUgglRWgtraqRmdm3poyl2ojqFJ7EgE3tus56heMPjlds3DfeGdheQ
         suQgZP+lWTyUl4dfSWd0ywXsIFjcM3RR8nqFxh7uFsa05GHUGHEHMg5oNHGNZfQm8R6k
         jNIhPLC2cpKJZwLsekwomuIpt6hPW4VgS2D9lTQWz1P4B/egUcn8iLAbJt09GwdYUyy7
         5feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738510440; x=1739115240;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TU50LgvcMc+vKDA8dmnHN9nuVOU92uamVuQ5fzwgtTw=;
        b=k0Z8HIElLbFMVLKyi7+zja2uW5ySZhez/u7/6xLliZ+7p0XNHIpwJ15IIAkZCWd8hQ
         5uXlnJ5J4zYgpLO7v8HEbPcDtUlA7ZQ1wBRn/r9u4GZdkQLjHuU0urIkCj7/4bOuDdjH
         G9AxTNVbSL4/oJkStRy+FbyMF2DdK2DrL3NqkpoP8mpPC4uDIU+2TGIHhDM/3Lrp+Hdx
         1vcBoKvnh8h1IKqk9Yy2tfVSxrVDPSVgcaw0JTdLTiqZCbH3DVUotlr0q2tlmTW+3Hu/
         Nsx+KesuzHC4SRtQ9bqnqr5xUEoOrrIpBfBxvEu9YkbNNNHimhY1nDHRU4F9MSHWE364
         0KVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHU8SmzV9PyPSFt//qz5bHWfzIDfh76SAj/51CeoPKiX8UmBicbxg26jf3JmavxAg/T7nwSSxXzMP5/xw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVEHtkaV3Npf5XtZX3wttpfpDDQTS/3NPQx0pwXJWMaY8wpjFP
	B20i8jEPMEiGUxqKKyxPOXjRq9ELq2QItis8EU+M0SOAUuleZLNh
X-Gm-Gg: ASbGncs7LIL4gJLC0e237yiv1zTx+J7csl0dFEU4VozKVu2bKuKUfVO7Fw2nCgz3WPN
	dsVsrm0kl9vSFVCCj0B5sTNzImXMBZd5Ys8ABhaj1/hVetRWv9y3A6Knl/1J0YX/jQUzNlfycRn
	lDihDr3nzKSjSNtjL2zi6NOe8ZFRLKO4I48isEM5DRzBFCoI+CZ/2HP+rzY3+zc+HrfCg+Ji6Wo
	b2I7krGQ/ZiEdWO46Mm7gJeAkFkhWD0nCN2D9tXWcSc3Ep1WrVXzRRR0A+pNyN1uy8t5c2Vwrzd
	/82DW/rBjlicTFj1IQur
X-Google-Smtp-Source: AGHT+IEQJ/3z4GNLfJXIKIjIxss+wl17Q4bkZkmAO+OORJWp5u85waZih2S6RQko6yEwSS9CPvQZ2Q==
X-Received: by 2002:a05:6a21:8dc2:b0:1e0:d5be:bf75 with SMTP id adf61e73a8af0-1ed873b6eafmr22453041637.17.1738510439998;
        Sun, 02 Feb 2025 07:33:59 -0800 (PST)
Received: from atom0118 ([2405:201:c009:5a8a:1c53:67e0:65fb:eab4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631c0e4sm6607605b3a.30.2025.02.02.07.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 07:33:59 -0800 (PST)
Date: Sun, 2 Feb 2025 21:03:53 +0530
From: Atul Kumar Pant <atulpant.linux@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, vschneid@redhat.com, linux-kernel@vger.kernel.org,
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org
Subject: Re: [PATCH] sched: Fixes typos in comments and error message
Message-ID: <Z5+QYaRBA9AHp1B1@atom0118>
References: <20250118092026.17406-1-atulpant.linux@gmail.com>
 <a3116f54-36fd-4b4d-bc06-f40489c3b2b3@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3116f54-36fd-4b4d-bc06-f40489c3b2b3@linux.ibm.com>

On Mon, Jan 20, 2025 at 09:38:35AM +0530, Shrikanth Hegde wrote:
> 
> 
> On 1/18/25 14:50, Atul Kumar Pant wrote:
> 
> Not even a single line in changelog?
	
	Sorry, missed adding it.

> Also, did you do this manually or using any tool?
	
	Came through couple of mistakes while reading the code and one using
	codespell tool.
> 
> 
> > Signed-off-by: Atul Kumar Pant <atulpant.linux@gmail.com>
> > ---
> >   kernel/sched/core.c     | 2 +-
> >   kernel/sched/cputime.c  | 2 +-
> >   kernel/sched/topology.c | 2 +-
> >   kernel/sched/wait_bit.c | 2 +-
> >   4 files changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 3e5a6bf58..451e30249 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8998,7 +8998,7 @@ void sched_release_group(struct task_group *tg)
> >   	 * that tg_unthrottle_up() won't add decayed cfs_rq's to it.
> >   	 *
> >   	 * We therefore defer calling unregister_fair_sched_group() to
> > -	 * sched_unregister_group() which is guarantied to get called only after the
> > +	 * sched_unregister_group() which is guaranteed to get called only after the
> >   	 * current RCU grace period has expired.
> >   	 */
> >   	spin_lock_irqsave(&task_group_lock, flags);
> > diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> > index 0bed0fa1a..f8ada8239 100644
> > --- a/kernel/sched/cputime.c
> > +++ b/kernel/sched/cputime.c
> > @@ -584,7 +584,7 @@ void cputime_adjust(struct task_cputime *curr, struct prev_cputime *prev,
> >   	stime = mul_u64_u64_div_u64(stime, rtime, stime + utime);
> >   	/*
> >   	 * Because mul_u64_u64_div_u64() can approximate on some
> > -	 * achitectures; enforce the constraint that: a*b/(b+c) <= a.
> > +	 * architectures; enforce the constraint that: a*b/(b+c) <= a.
> 
> fine.
> 
> >   	 */
> >   	if (unlikely(stime > rtime))
> >   		stime = rtime;
> > diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> > index 9748a4c8d..a9f4fe81a 100644
> > --- a/kernel/sched/topology.c
> > +++ b/kernel/sched/topology.c
> > @@ -2337,7 +2337,7 @@ static struct sched_domain *build_sched_domain(struct sched_domain_topology_leve
> >   		if (!cpumask_subset(sched_domain_span(child),
> >   				    sched_domain_span(sd))) {
> > -			pr_err("BUG: arch topology borken\n");
> > +			pr_err("BUG: arch topology broken\n");
> 
> 
> This is intended. Please look up its meaning and see the earlier mails on
> lkml.

	Thank you pointing this. Removed this in second patch

> 
> >   #ifdef CONFIG_SCHED_DEBUG
> >   			pr_err("     the %s domain not a subset of the %s domain\n",
> >   					child->name, sd->name);
> > diff --git a/kernel/sched/wait_bit.c b/kernel/sched/wait_bit.c
> > index b410b61ce..4197f5ed2 100644
> > --- a/kernel/sched/wait_bit.c
> > +++ b/kernel/sched/wait_bit.c
> > @@ -204,7 +204,7 @@ EXPORT_SYMBOL(init_wait_var_entry);
> >    * given variable to change.  wait_var_event() can be waiting for an
> >    * arbitrary condition to be true and associates that condition with an
> >    * address.  Calling wake_up_var() suggests that the condition has been
> > - * made true, but does not strictly require the condtion to use the
> > + * made true, but does not strictly require the condition to use the
> 
> fine.
> 
> >    * address given.
> >    *
> >    * The wake-up is sent to tasks in a waitqueue selected by hash from a
> 
