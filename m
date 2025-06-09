Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488BA20E71D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 15:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749481413; cv=none; b=h+YQshHaN8Sfqja6TAvtjxolkbrM5KIb02nqFlcH0qm3OkOwYVLb5QkAljRKW1yKHJsTVSotHWlwHX0JmukGpEO7wPgamg/2pZiXJO3kzYPWOBVhx/iq0kQWJ9BfH0WGVbPzAGc+YLFLvRBSeBy7ODVy36AeNGUkLh/7KvzmI1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749481413; c=relaxed/simple;
	bh=l2eWT8HoRY4lQzvoTbRCxTdJU+1Vob2xQfguKELzLr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qhu+b+KimSA5jA6l2t8el1v2Qmn9QzeyiZ4iBK4C54Lr8BISCOA0+GnglY0HAllTzp2tboc+Xxp+ujwVtGEEG3qI6JPZBw6pqu9cAMYcIpse8plPTEqNvJA4oiU0QKcOz9/EXM3DIdWZLpZPdA05VGuX/DlulU1c+JUEceZrf8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jbBcjp91; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jbBcjp91"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e7311e66a8eso3905931276.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 08:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749481411; x=1750086211; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KDb/VOiOtpMJD49T8izFT4MMpxqqKFYyAD2KxXOHMrA=;
        b=jbBcjp916xHUB7OZbYMutoch/JPl4pim1yJUPonZ+B1yQ714nlPkoWCqwoJdokf2ZO
         K2PClTP+jE6sWAALuWew9ie0WJQPxrSsu2XKPeJIT3Ahmk3OhH1JZNFxkMTU5JrgKExj
         zrM464/SgAu+Y4hZC7VgWiIUbNa0AMxx2MNmwgGEFrOebFjy/PmNVelWbhVGXyC3QlxA
         QkNPEMaz1KktUfG2TCgdXik85pxSVUq3cO4UidnYThzedXiirT8hxAN47dG5wzPVBLK7
         6gPU1WF+mlVsw55pFbFGTBhwSjXjrWNHD+zsm1wiHbW6b86pYvKbnjKKWTJHuK41AzBl
         J/Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749481411; x=1750086211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDb/VOiOtpMJD49T8izFT4MMpxqqKFYyAD2KxXOHMrA=;
        b=rlypIMEO10HAFxWK7h3cjQshS25RxcTv/V69o6ljf1VFB2YOkIOrDbPvwvccwcqoD8
         1rvunJhKsS2+tSjcZu2vAvFEe0dBNh4ctE2hl1/V2VWVsB4PWkrWqtA+VrN65INpO9WK
         HhKnU4Fx2xjCg0kmZMn5wfnlmVO1jbkVziVaYjPRPxl3rKjICWQsvSGojTE6T7zUSaLU
         5NXkCDaouiYYwO17mWak91dsncN6AdcHCP9aNSvmLgGg2tjdxjtR2JZkM2I4t4iNlhQn
         HfVEsy0Q7yIqBS3ApEBFw/XEkjDaMDAihmbrxZDfg5RhzJwu4JbrYR46Y1TKLBspEy0b
         Umhg==
X-Forwarded-Encrypted: i=1; AJvYcCWpehykjRdrGrT3faHtj7tVVITmXSf8wy69RwNZq+sfD7Rr/fUX/PG9JgXs7rDSDln59x0R7hdB5aGQ110=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5scWkDkKVn3si9C19Ri9YMLNFXdGNJuQsN1PgbnXv9pdGcNz+
	Xtee/HPPmv4zB9ARX9SmE5kpxgPxo06axZpjpw7AIbXtXArhDhxOz/xy+XSwPQ==
X-Gm-Gg: ASbGncujyFhcht7F+8huFDUNBKY7VM8iXgfgVMT3XrHf3lK59isxnhj9KhLC8k8TcGl
	9nvuodjBWndZ/YgOTE4ox1a78UNRjmLYSB3bsrruhT/1HhEPU4SjjYTJ71PyPHEZeevaxn8PjGH
	riLeWUh751X9SpOP3dpQQnxfl+oyNL+j2qA35Qk8HOBcATxR/Ct4nlpUIQ3yV9t9DCretHaLVas
	+ZSjDKuDWXGfdbeizr/QAg1qsvVD4ZmaAIrD5zvNVC83zatILk7aA04WPzgHpyrXE4XQ8eh1HHb
	FTHs6TS4AUMTC7p6d9PNYq2K9rXmBFAYLiGN8qRKZB+kfwnkXAmr/b+oKM54UxhqwCZ4TQAYPci
	Cd1U3DsN2Qg79HFDCP5KOHA==
X-Google-Smtp-Source: AGHT+IEIHbUnfmx5K0rNAxRVC3jD7L1P1PoNM9Go6Po11Q6pda2DdeCd9TIhD6DwrR4VVHJFW1KUtw==
X-Received: by 2002:a05:6902:10c2:b0:e81:996c:aa3a with SMTP id 3f1490d57ef6-e81a21d6507mr16403234276.45.1749481411159;
        Mon, 09 Jun 2025 08:03:31 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e81a41a0fccsm2334568276.48.2025.06.09.08.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 08:03:30 -0700 (PDT)
Date: Mon, 9 Jun 2025 11:03:29 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] sched/topology: Fix for_each_node_numadist() lockup
 with !CONFIG_NUMA
Message-ID: <aEb3wfr3rgL2Pemu@yury>
References: <20250609113536.29743-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609113536.29743-1-arighi@nvidia.com>

On Mon, Jun 09, 2025 at 01:35:36PM +0200, Andrea Righi wrote:
> for_each_node_numadist() can lead to hard lockups on kernels built
> without CONFIG_NUMA. For instance, the following was triggered by
> sched_ext:
> 
>   watchdog: CPU5: Watchdog detected hard LOCKUP on cpu 5
>   ...
>   RIP: 0010:_find_first_and_bit+0x8/0x60
>   ...
>   Call Trace:
>   <TASK>
>    cpumask_any_and_distribute+0x49/0x80
>    pick_idle_cpu_in_node+0xcf/0x140
>    scx_bpf_pick_idle_cpu_node+0xaa/0x110
>    bpf_prog_16ee5b1f077af006_pick_idle_cpu+0x57f/0x5de
>    bpf_prog_df2ce5cfac58ce09_bpfland_select_cpu+0x37/0xf4
>    bpf__sched_ext_ops_select_cpu+0x4b/0xb3
> 
> This happens because nearest_node_nodemask() always returns NUMA_NO_NODE
> (-1) when CONFIG_NUMA is disabled, causing the loop to never terminate,
> as the condition node >= MAX_NUMNODES is never satisfied.
> 
> Prevent this by providing a stub implementation based on
> for_each_node_mask() when CONFIG_NUMA is disabled, which can safely
> processes the single available node while still honoring the unvisited
> nodemask.
> 
> Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  include/linux/topology.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> Changes in v2:
>  - Provide a stub implementation for the !CONFIG_NUMA case
>  - Link to v1: https://lore.kernel.org/all/20250603080402.170601-1-arighi@nvidia.com/
> 
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 33b7fda97d390..97c4f5fc75038 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -304,12 +304,17 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
>   *
>   * Requires rcu_lock to be held.
>   */
> +#ifdef CONFIG_NUMA

While there, can you expand this optimization to MAX_NUMNODES == 1
case?
        #if defined(CONFIG_NUMA) && (MAX_NUMNODES > 1)

With that:

Acked-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>

Thanks,
Yury

>  #define for_each_node_numadist(node, unvisited)					\
>  	for (int __start = (node),						\
>  	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
>  	     (node) < MAX_NUMNODES;						\
>  	     node_clear((node), (unvisited)),					\
>  	     (node) = nearest_node_nodemask((__start), &(unvisited)))
> +#else
> +#define for_each_node_numadist(node, unvisited)					\
> +	for_each_node_mask((node), (unvisited))
> +#endif
>  
>  /**
>   * for_each_numa_hop_mask - iterate over cpumasks of increasing NUMA distance
> -- 
> 2.49.0
