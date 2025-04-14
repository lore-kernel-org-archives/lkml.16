Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA701DDD2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744597761; cv=none; b=lOzrzI4bFXzV3pLKlrrV/i9NUyCYtPgy+PJCIWQQrfHPNAkxJhzM3eGjvdksHMFph/NXar1u50yAmNHZlu57m5DscOk92KTCDeGwGDCKCLm1ywKnakhWalhckGbTvWQqyrSakdm77DXmqJxU1p5X7AeVa+P3vQFSXw9DFACr8WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744597761; c=relaxed/simple;
	bh=BJ7THEt1GTK6+SA6dxHEjeTarR6iLMFeutgpn9++7g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sjvw+Msgjgkdr/t9RtiTNjZiqzT1ymGQyRYcvCFBfjWgN7DIbBxSaB0cF2v/MDyGt0wXRdhiX+n1SaxRjVSGH1LdqogNqum1Ovd2q27Cwy5EDAuPWSeqKzMQ0O8yyFFAhZtLyDJFFjJ6jo6JQlpz1zPJTeZBNM+ls2cpUZva4eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jUR8lGCG; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jUR8lGCG"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-227cf12df27so29593805ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 19:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744597758; x=1745202558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NViZKqFg3k58zSD1gl7NtJvPB8DQ6ftWdgoXSK4HdOc=;
        b=jUR8lGCGNvWCOXWdqz2vFaOhB7ipTfQSPyJsyc94ATt8ZKPNe0prs7Ub+wByX09twW
         rwyN6/P/5ukJfVJjtjfJexAtbuKGmkCvaOnA86grkd2rMoJwCLgQk+YvGXCGtuSNLNt1
         XgHTfpMm9G6mX9HnlHoa0tH8P3UozGbDm6/d7nu9L8dWqoI8ZHcw0HWLoVT8emk5XRtW
         voXrb1t0SDepmNxlh0CQEgpF01gYQydc/wRoLx73QoXYM7OZ6i3LvfvZZ/qwT1ojP2ZZ
         rSJsAMQ86yVnOBkd0BHdNmVYdawijCLXmyhf5yoxzKxudZTrmiuC/sVh0thy6izi4n9c
         tzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744597758; x=1745202558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NViZKqFg3k58zSD1gl7NtJvPB8DQ6ftWdgoXSK4HdOc=;
        b=GI88NQQ0E8mQDFSXSLjMlB2itBseMtLDEcXcX3/aD8hbYhnhOJrxTHV9+Valb/atSg
         whYsOrUsTNKO5tobSsaFDx3kkIfrU1KBoy8uwHX9O7RMIekDkKNfKM0IXJj1MIIGtgnw
         GGHXfl8Y/OMVY/6VMetaOXtBEDI0SrYoraBnWsJ67RvGZli24GpZebst9qJXwkHw7Kll
         MjSlDbb2pctv7dQzou0aoa0O7QV77Ct+HsKCUCyfnpYN6o+fap8tArxMCBceL8WLQl0P
         pT2RbvzGgjsXmNV7woJoec3xW9jnZsQ6+yQr8z6P3QIWKFzLzUGWjHPKz5n4QX/awLd4
         u3wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzHcJhiAQWdkDxiHDh8GDBPpWZvfdIka0m4bBTBYP8kL79Ov36SM8nsBvJxSktGlCUM0tuYN8Y6S0Ck/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfiGWKBsHhLyXVhI1gV18RT2wXX02ZFktyQIQwSC11cKuwBwhM
	GlC+cekVnMRFtXb/k4pMGrwOaAvRbMuX+Qj0RGoOs2wcERhJza4qAulfNvHkKh0v0jkjQe6Kpu3
	3OA==
X-Gm-Gg: ASbGncsPUw3v+rGRY53+TJ/8jTQdXOAUAqeoaZR/WEERxreFZMtwQFHwVg2d4l6gcIz
	eexQs2zxzYZ0eDsZGymK7rXkjOfSFDPOLyo2+3gudkZ4MvUNGDabQ5BOXxsabSOSEIK6C+xjt0Q
	XBwcq3GhWScf9Vrf5nEsSGApDtt/nBmUJ3BlAI1kNmJ80TDjzOkkZFEtY5H2kQiL8uK0PicBspo
	WMNIJRyZkbgm53GtvNuw+okF95L0epTc0x+T7hjtLJHecuk345ZH2JzS0zbdpQQNavKN81j/DVi
	XdPAQG9BeFwPhT8Ddq9X+BKZwVaUIHH6QWus6vPRbH9VB5YYSzw=
X-Google-Smtp-Source: AGHT+IFQp0YV8swU6djE6uF9PvxhD1jkKgaxv3MqL1CtZcPgMCSIlzJWBrOiXk0n9IcsvRMsOQMzxw==
X-Received: by 2002:a17:903:1b0b:b0:215:a303:24e9 with SMTP id d9443c01a7336-22bea0253b4mr153115655ad.3.1744597757776;
        Sun, 13 Apr 2025 19:29:17 -0700 (PDT)
Received: from bytedance ([115.190.40.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b65a56sm89338465ad.2.2025.04.13.19.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 19:29:17 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:28:59 +0800
From: Aaron Lu <ziqianlu@bytedance.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-kernel@vger.kernel.org,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>
Subject: Re: [RFC PATCH 3/5] sched/fair: Update overloaded mask in presence
 of pushable task
Message-ID: <20250414022859.GA3326447@bytedance>
References: <20250409111539.23791-1-kprateek.nayak@amd.com>
 <20250409111539.23791-4-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409111539.23791-4-kprateek.nayak@amd.com>

Hi Prateek,

On Wed, Apr 09, 2025 at 11:15:37AM +0000, K Prateek Nayak wrote:
> In presence of pushable tasks on the CPU, set it on the newly introduced
> "overloaded+mask" in sched_domain_shared struct. This will be used by
> the newidle balance to limit the scanning to these overloaded CPUs since
> they contain tasks that could be run on the newly idle target.
> 
> Signed-off-by: K Prateek Nayak <kprateek.nayak@amd.com>
> ---
>  kernel/sched/fair.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 98d3ed2078cd..834fcdd15cac 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -8559,6 +8559,24 @@ static int find_energy_efficient_cpu(struct task_struct *p, int prev_cpu)
>  	return target;
>  }
>  
> +static inline void update_overloaded_mask(int cpu, bool contains_pushable)
> +{
> +	struct sched_domain_shared *sd_share = rcu_dereference(per_cpu(sd_llc_shared, cpu));

I got a suspicious RCU usage warning for this line while testing your
series. Since rq lock is held here, rcu_dereference() should not be
necessary.

> +	cpumask_var_t overloaded_mask;
> +
> +	if (!sd_share)
> +		return;
> +
> +	overloaded_mask = sd_share->overloaded_mask;
> +	if (!overloaded_mask)
> +		return;
> +
> +	if (contains_pushable)
> +		cpumask_set_cpu(cpu, overloaded_mask);
> +	else
> +		cpumask_clear_cpu(cpu, overloaded_mask);
> +}
