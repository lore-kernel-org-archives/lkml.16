Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4023D28D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641573; cv=none; b=q8kcEpwlYdGqO0BBJWfBG3kiVwrxjnmsPh/LWC9n3MHDL3fK+orRmLUeVNGILZWz1yQfbHE02ECqa0W1+Lk3Te7GVIdl+Hnldk3ZGNn47ogBhhPmADLX2t/SUUJLI6doVXrosw9nPkwbNZvzu97i/ZU4TgN3/DEjVMyoy+8Mx9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641573; c=relaxed/simple;
	bh=E8CW3uF0r3pYKI5vL0qiGCSaZCcinAb+z8OYrt/N84g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mQbPz91zV+1Tpq1G19J2Ro+0m5x0Tjj0roCRiGKut/TEL0sXmoZ4auXyuW4UV1a7wS6O3l7d2i1ZrQXkKTbbY7E3rppPQkasURTtX+4RfjMdold59giyOYlVKnHLQ4Do1eth3b+RllQJnBHC7NRL2meo8eHG9WYpAYarSOSbVSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b=HWMQI26T; arc=none smtp.client-ip=185.136.65.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=florian.bezdeka@siemens.com header.b="HWMQI26T"
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202504141439244e369ea11dacd5bca5
        for <linux-kernel@vger.kernel.org>;
        Mon, 14 Apr 2025 16:39:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=florian.bezdeka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=zbLwYuCFWrEzw2d9sLcC0GKzi6TvOJK9n6fs8Ekwr6I=;
 b=HWMQI26TvI4xQU0etrb+fN1dHr0XQPwBi4SmQWXAbHPyr5Fal3ngKCrvjwGXSWMM2eQeFY
 R+uhienwMfZootBuuFj+BW06bCJDfyWoyMCITsqKpGaoeDNwWO//rRiLmZZEYit0OISkpWPU
 OaPd0m+OaH/VL8wcIOwpz2t936Z9e2QZOIgiK0ns01mw3X2P+77tNsLE7AozpVqgY3WhNeVh
 ggO9BcNFYGhT8cCxYLjCFYMwxERshwq3BzKr9wA3JUZue95Hk7FIhdBkV6QyxwzZYUVZbART
 RuGBsA7XQxqd8L0Tsp2Jj5WU/q4XHO/se62xr2JWguHva7mfl0r4QNzA==;
Message-ID: <7ad8e4fe779d9a63de999aa5572ff204302351f7.camel@siemens.com>
Subject: Re: [RFC PATCH v2 2/7] sched/fair: Handle throttle path for task
 based throttle
From: Florian Bezdeka <florian.bezdeka@siemens.com>
To: Aaron Lu <ziqianlu@bytedance.com>, Valentin Schneider
 <vschneid@redhat.com>,  Ben Segall <bsegall@google.com>, K Prateek Nayak
 <kprateek.nayak@amd.com>, Peter Zijlstra	 <peterz@infradead.org>, Josh Don
 <joshdon@google.com>, Ingo Molnar	 <mingo@redhat.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Xi Wang	 <xii@google.com>
Cc: linux-kernel@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt
 <rostedt@goodmis.org>, Mel Gorman <mgorman@suse.de>,  Chengming Zhou
 <chengming.zhou@linux.dev>, Chuyi Zhou <zhouchuyi@bytedance.com>, Jan
 Kiszka	 <jan.kiszka@siemens.com>
Date: Mon, 14 Apr 2025 16:39:23 +0200
In-Reply-To: <20250409120746.635476-3-ziqianlu@bytedance.com>
References: <20250409120746.635476-1-ziqianlu@bytedance.com>
	 <20250409120746.635476-3-ziqianlu@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-68982:519-21489:flowmailer

On Wed, 2025-04-09 at 20:07 +0800, Aaron Lu wrote:
> @@ -8888,6 +8884,9 @@ pick_next_task_fair(struct rq *rq, struct task_stru=
ct *prev, struct rq_flags *rf
> =C2=A0		goto idle;
> =C2=A0	se =3D &p->se;
> =C2=A0
> +	if (throttled_hierarchy(cfs_rq_of(se)))
> +		task_throttle_setup_work(p);
> +
> =C2=A0#ifdef CONFIG_FAIR_GROUP_SCHED
> =C2=A0	if (prev->sched_class !=3D &fair_sched_class)
> =C2=A0		goto simple;

For testing purposes I would like to backport that to 6.1-stable. The
situation around pick_next_task_fair() seems to have changed meanwhile:

- it moved out of the CONFIG_SMP guard
- Completely different implementation

Backporting to 6.12 looks doable, but 6.6 and below looks challenging
at first glance. Do you have any insights that could help backporting,
especially for this hunk, but maybe even in general?

Best regards,
Florian
