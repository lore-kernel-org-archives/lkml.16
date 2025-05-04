Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685915A856
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 18:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381845; cv=none; b=cHkabrvj7Jj7m9BveU6/Vq3I4MpdasunaeemWCO3jbNYA5Hr39Wb3HIvzCmyU5wJso2KLKUpeNddnZnUgNN3VziejzDVxVjWP11PPc5cmhmhDseVt0tNwNB6lIcXzlgylVnjqZ+iU+BqEObvgeI3+Vm21lK8lkFFyNhmkw3y2r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381845; c=relaxed/simple;
	bh=UaJg/oXlVVlH71J/uE4jaOjBRLBjog8JAmqQVusyEe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mHbXJzdpE4K8oO2uaFatk12ldJAagsUis7w3GVIdYPHGsoQWx3iXuLpbwOglve9amSTjormL+E+iZoCR8s6EZQzpJQUhdZLvfd7t7n77jIkXQq83bR4QiHkECHvwo+JcKM/KNYNA+yhGk+WMI3kUSqhbh1eTgJylxsbBqDHYwvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OcMTUZxq; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcMTUZxq"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so48389346d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746381842; x=1746986642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dqgZux5FXC6jpQxX0/Cp/cnWbi59Ir5YhdhDnj9dPOY=;
        b=OcMTUZxqD/TrQDXpXiFqwfRspXB3UXJCDaLe2lsOIAHKLU7EmtfXFEvYFapkGbFgdS
         tABobKCMcAEXZL4wrdMQxfc/5KKWXwXPdn1oToFIBqjP+ipZGyEtBXY0p3eYfNwYUYSC
         9JMETrEe//juLsHbiP8AsrUQLdILHKNZN/nDXDg4hUxQo5bVsjWO1vEzo1aYm7TMl4YN
         XJQxk3OxyMoi022h59VSf6ykZuW3Gq8vwKBX/Gy7akg6jIIvjabLqweQ9HhQli36RMot
         CnEddEsrXdtipiNtGOkZ3iVVXLlstUdl9RI67+2hpsh8TF9PAvcnlHdnsJvYPusPxIOb
         LjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746381842; x=1746986642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dqgZux5FXC6jpQxX0/Cp/cnWbi59Ir5YhdhDnj9dPOY=;
        b=dW+X1Yhuqe1T7OmMhyrOtNPYiQ7bhWFzEkFr6Bq+4FhRlcp2l+K0M6chN5XU9QtyMc
         psDGx+HdbHrSh6lEgq/IfIP6ljB39Xoxs6tnlLUfsSCFF7wcqTIZ6prp8i0Nmiu6fXJC
         6DWLNVynIo6lcJxQ7TV+9n48pzsrzELFaPE24UoeiIpmEtuqjitv1iZ54uVqXHlH229Z
         ZechjZo7g0oStdqXBVSTtKqXrsCNLgbu+ZIeJvNodoV0+7F0N6Kh5Ita4fxGRP47GnxC
         EiLJeSxM3RXU20jszscxYqP3x9ZvguamKLKlPeJ3z7Qh5XntC9XUAMgAdVWbk7f5ytty
         qN1g==
X-Forwarded-Encrypted: i=1; AJvYcCXylyitr75a39THJHUqbLGp0HgRibzWV8LZogt7FYn6OmIktmh84EfggVok2+ehhU+wuUL+HyjAP1MljCk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhu0Dhf4hAofPdgB0LGf8xV677y94Xomrf6b7LbHdHdEAl739h
	c4DBWOTj8ljeR8Y7vwMKyONh5s3g8q9RW9vsqoNxjYJ8cfXj85+b
X-Gm-Gg: ASbGncsRh8JaXd4QTxCzp20wjo6KeOMk7MFvLCFx+lYLasQ5O/wM1DDxv+3dbbFwQ9M
	7m4cZV12nnQ8RXqI5E1Q+jFHSE6Q1KxqvhFRTn00/WHIAY1mAv3PGAZk8Kp4lyFBPqWeLOjFOb1
	li0kbahetgAvzKChrOHF43bcpjYngPJQBvcIScHY3zskXoApPyxNhzKPgP59fm1PJY8iiMS11qP
	KjLRvYPrjFbg6PW+aRfd3wjc1NL5y41+Czl0Bw9aVwAkxMBPg7r3c50PzHo1erOMrpSNw+MUif5
	i88d08Ni71a8qX9Itp5Ov0I7ZbPyPLAxpfrbacNt2vtrOWYDE/H56qbWs0GkRMuTt8Gtc7WnOBx
	6Rgc3syrtjcaOXxi/I7TEw4X5MTS/Dbk=
X-Google-Smtp-Source: AGHT+IGMbIfRMhQoUvejSfzgg6bUhqBP+nC6DutIcrnxW/NMzI78o/M+s9ndiWpbBRD1yBEtB23Wsw==
X-Received: by 2002:a05:6214:21ac:b0:6f5:e2b:988a with SMTP id 6a1803df08f44-6f515490cd1mr153086706d6.13.1746381842157;
        Sun, 04 May 2025 11:04:02 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f47e640sm44566776d6.95.2025.05.04.11.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 11:04:01 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 630741200043;
	Sun,  4 May 2025 14:04:01 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 04 May 2025 14:04:01 -0400
X-ME-Sender: <xms:EawXaGCZosEoiSb4rn3l_8T9NFQQca8r3p4BGwrfCF6c7Cpx74a0IA>
    <xme:EawXaAiqfXSWwse0NbRtjW4KiqFwY5ATVPgVA9vbzFNwDYGGtIwlBfI5-aY5moH_C
    35WL-Yq5k0VzHBYaA>
X-ME-Received: <xmr:EawXaJntBCcCl5IeaPmfpuEFNn7cEgyRS4yTl621oM8aE8bT0hSLjf16>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeekkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfel
    leeivedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtoh
    hmpdhrtghpthhtohepphgvthgvrhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    ohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohepfihilhhlrdguvggrtg
    honhesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:EawXaEwMgAb_XiukbBs8vIRyGOIl_60fXlmBXotvoEm6CUFbVFl0Ug>
    <xmx:EawXaLRI5UkbRGHM_EQNun2HsKeM0_gLRa1E4uWWjlZ_pgzo5AHaXQ>
    <xmx:EawXaPZIyBQhKREiS5agwEIs5nl02k0GaM-awjMow7rcT8eocUTjRw>
    <xmx:EawXaESmOdQdL-spz0sEgEowNTg9yFPXgIAq6ihkqJXX-CZ9C_oEtA>
    <xmx:EawXaNCvTW8cm3NLqn2i-Cqhcc4-fv6469useSQKHtb-D9mWCLsitCNO>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 4 May 2025 14:04:00 -0400 (EDT)
Date: Sun, 4 May 2025 11:04:00 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Waiman Long <longman@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] locking/lockdep: Add # of dynamic keys stat to
 /proc/lockdep_stats
Message-ID: <aBesEItGIeHf5v52@Mac.home>
References: <20250425001155.775458-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425001155.775458-1-longman@redhat.com>

On Thu, Apr 24, 2025 at 08:11:55PM -0400, Waiman Long wrote:
> There have been recent reports about running out of lockdep keys
> (MAX_LOCKDEP_KEYS too low!). One possible reason is that too many
> dynamic keys have been registered. A possible culprit is the
> lockdep_register_key() call in qdisc_alloc() of net/sched/sch_generic.c.
> 
> Currently, there is no way to find out how many dynamic keys have been
> registered. Add such a stat to the /proc/lockdep_stats to get better
> clarity.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>

Queued for 6.16.

Regards,
Boqun

> ---
>  kernel/locking/lockdep.c           | 3 +++
>  kernel/locking/lockdep_internals.h | 1 +
>  kernel/locking/lockdep_proc.c      | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
> index 58d78a33ac65..aeedaaaa403c 100644
> --- a/kernel/locking/lockdep.c
> +++ b/kernel/locking/lockdep.c
> @@ -219,6 +219,7 @@ static DECLARE_BITMAP(list_entries_in_use, MAX_LOCKDEP_ENTRIES);
>  static struct hlist_head lock_keys_hash[KEYHASH_SIZE];
>  unsigned long nr_lock_classes;
>  unsigned long nr_zapped_classes;
> +unsigned long nr_dynamic_keys;
>  unsigned long max_lock_class_idx;
>  struct lock_class lock_classes[MAX_LOCKDEP_KEYS];
>  DECLARE_BITMAP(lock_classes_in_use, MAX_LOCKDEP_KEYS);
> @@ -1238,6 +1239,7 @@ void lockdep_register_key(struct lock_class_key *key)
>  			goto out_unlock;
>  	}
>  	hlist_add_head_rcu(&key->hash_entry, hash_head);
> +	nr_dynamic_keys++;
>  out_unlock:
>  	graph_unlock();
>  restore_irqs:
> @@ -6606,6 +6608,7 @@ void lockdep_unregister_key(struct lock_class_key *key)
>  		pf = get_pending_free();
>  		__lockdep_free_key_range(pf, key, 1);
>  		need_callback = prepare_call_rcu_zapped(pf);
> +		nr_dynamic_keys--;
>  	}
>  	lockdep_unlock();
>  	raw_local_irq_restore(flags);
> diff --git a/kernel/locking/lockdep_internals.h b/kernel/locking/lockdep_internals.h
> index 20f9ef58d3d0..82156caf77d1 100644
> --- a/kernel/locking/lockdep_internals.h
> +++ b/kernel/locking/lockdep_internals.h
> @@ -138,6 +138,7 @@ extern unsigned long nr_lock_classes;
>  extern unsigned long nr_zapped_classes;
>  extern unsigned long nr_zapped_lock_chains;
>  extern unsigned long nr_list_entries;
> +extern unsigned long nr_dynamic_keys;
>  long lockdep_next_lockchain(long i);
>  unsigned long lock_chain_count(void);
>  extern unsigned long nr_stack_trace_entries;
> diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
> index 6db0f43fc4df..b52c07c4707c 100644
> --- a/kernel/locking/lockdep_proc.c
> +++ b/kernel/locking/lockdep_proc.c
> @@ -286,6 +286,8 @@ static int lockdep_stats_show(struct seq_file *m, void *v)
>  #endif
>  	seq_printf(m, " lock-classes:                  %11lu [max: %lu]\n",
>  			nr_lock_classes, MAX_LOCKDEP_KEYS);
> +	seq_printf(m, " dynamic-keys:                  %11lu\n",
> +			nr_dynamic_keys);
>  	seq_printf(m, " direct dependencies:           %11lu [max: %lu]\n",
>  			nr_list_entries, MAX_LOCKDEP_ENTRIES);
>  	seq_printf(m, " indirect dependencies:         %11lu\n",
> -- 
> 2.49.0
> 
