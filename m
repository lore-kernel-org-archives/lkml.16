Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5F61CAA7D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749046405; cv=none; b=egSCP+0ZNnro4yShv+jT0h3FZOYkbIee8+LRDd4SHcv4eaRh5TOkGRyfzD14XWzKYJ7X//bXB8TZY0Zj775UMYBbCbYW18nnuZpm+pbOSEjwX87XEiBYXMG/MexGmZZA4mRAmX/LEIQ8UPvH//ZJ6L/cCjHpSgzR62Ahmkrt3Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749046405; c=relaxed/simple;
	bh=kUD9RaSK90fDmAELeDmPzDaHHzVoXZ5jPa7OuIhm9FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qcRNbq3UTIYKFsJI0opmYDSqmeJA0Z1EqlFFpIwbzvT2/9Fdu58qjqqVXxWk9slHnJ2YkRD7r/AOO5g3NIiUiUMVcjlm5i9+O/S+I5EbVpN3R4JxJUDMZ0H6drFkcnZxfUmx0GEZ5Cwka66xWsNxcd0jc6PsOY/WI2Brkebh/yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Us9N8jsw; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Us9N8jsw"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b26d7ddbfd7so7054369a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 07:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749046404; x=1749651204; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FOubuOKJ0nVRR07NcifP3O4w+OBYodv4aN3itoFdfs4=;
        b=Us9N8jswt7LjC2tSBXmkJ3ZvaPcgk0kiQaeEjnNPa8i/6mmp9CMJJbtsu584PeefJr
         jIua6tgOMxor6jt6IR+oU/f2JNkpjuUHPvoYlUoqR7g3r+Piwvz5koOFTwHKpQHSHo7U
         /1v13wjcKgFB8fsYPDqHbWt7/wRubhPX5HruRkJjpqsRsHm2OAnfvxQiUmLwJyp1rR75
         PIg30LBZ6N7MMratGp6m53ynGQDNHeqhyIJLp+3N2RzJcXENz9Ptl3zZzAH12fRQhTIR
         +m+34eTO+Vz04WV7XKg/I361suAJZj8G9cr5YaFMCtGc/Hjw+48ymefeVsTi3UU9Et8J
         C1FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749046404; x=1749651204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FOubuOKJ0nVRR07NcifP3O4w+OBYodv4aN3itoFdfs4=;
        b=qBFY3HEzpK/ExQp7s7rbxMLyc7EwjcScf+Ww6R0HdwV3HBlJcYMG5oTWNvtTknDvEd
         srECGfUrlyq3GQW6hJHpZT4INKzn6aDgLlQkXCI8G70LQu2OQ+Bd2lNoEvBXD/3d6dJm
         TdPNL+xaTFtYIxmoZ+YYfWh853rwC5QW6cocjSRSfw4TEw5ZDNpDVz8AbNDfEwywN9lW
         Un+7ooYbOI91Iuws/41xSYfUuWvlS+dH8Ewue2Kok+CaIpfK57D0uvDYbW3LZE7DB26I
         DHdgmKoXhnDsQkMu5TkDPd53Ma6uqjjh7V0Gpng811LcjMtDWkMLt5/FetbnQsmQJoxK
         8HIg==
X-Forwarded-Encrypted: i=1; AJvYcCWWzM5bS/chQ4FcSdQzk9FSCQ/PGRY6sS7aC6mAahvQZoVWwhCGpL6q6LSX8vlR87nbP315/kVi1z/5l78=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKAOmjWApMcFoEptgFOMN9KR3058e9lISzKNUswkpKG9UG5rOR
	edxB0RRAfD8bMVDH0Gq6jYkXlwYz5k/S/iA8DNvGJbRyWvduoR5SxT50tvE88g==
X-Gm-Gg: ASbGncsBQeGQnam8Bbn4I5Z4oxOM5HoLI4aw9aAR+R4+L3wgXPVmiKd+gWKN6oFJ2oi
	ucmNTGKlwKqlDZ+qMBsTxNJeVeTV8dcTigJDfM3tjK79nlK12Q37Epb2rcXOJmKIf7FWNsWzB0e
	iOh3m2V4BdpMhW7YoiTXfBYJD2sIo1q4PP98RPPSNqjQGH/jCRk2WrIYJfMoCtsJIWNoyGGEncM
	t17xeaD6B2enDFnzt0ryzzumhG3KrG5KzbzpqKKrClxYpi+ix8TZMfI6pxW+vi0oniJvOXdNgAT
	OMj1zBqcuNWoZZ6q4TarOPpd2AJrNCoJMO4oeq5V1WmzpXxMKck=
X-Google-Smtp-Source: AGHT+IE8ilsTXYJqkqZP8w9qY7x7MzrwQvVHFPgwyHwV5u7WDN7K048ANhZ75TY38hB338uiQTD+sA==
X-Received: by 2002:a17:90b:3ec7:b0:311:9c9a:58da with SMTP id 98e67ed59e1d1-3130cd12ba3mr4615834a91.8.1749046403609;
        Wed, 04 Jun 2025 07:13:23 -0700 (PDT)
Received: from localhost ([216.228.127.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-312e7931d29sm2968092a91.26.2025.06.04.07.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 07:13:23 -0700 (PDT)
Date: Wed, 4 Jun 2025 10:13:21 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Changwoo Min <changwoo@igalia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/topology: Fix for_each_node_numadist() lockup with
 !CONFIG_NUMA
Message-ID: <aEBUgWdZtz8E_2d9@yury>
References: <20250603080402.170601-1-arighi@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603080402.170601-1-arighi@nvidia.com>

On Tue, Jun 03, 2025 at 10:04:02AM +0200, Andrea Righi wrote:
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
> Prevent this by handling NUMA_NO_NODE explicitly in the exit condition.
> 
> Fixes: f09177ca5f242 ("sched/topology: Introduce for_each_node_numadist() iterator")
> Signed-off-by: Andrea Righi <arighi@nvidia.com>
> ---
>  include/linux/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index cd6b4bdc9cfd3..095cda6dbf041 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -310,7 +310,7 @@ sched_numa_hop_mask(unsigned int node, unsigned int hops)
>  #define for_each_node_numadist(node, unvisited)					\
>  	for (int __start = (node),						\
>  	     (node) = nearest_node_nodemask((__start), &(unvisited));		\
> -	     (node) < MAX_NUMNODES;						\
> +	     (node) < MAX_NUMNODES && (node) != NUMA_NO_NODE;			\
>  	     node_clear((node), (unvisited)),					\
>  	     (node) = nearest_node_nodemask((__start), &(unvisited)))

When NUMA is enabled, you add an extra conditional which is never the
true.

When disabled, I think this macro should not be available, or more
likely have a stub implementation, similar to for_each_node_mask()

Thanks,
Yury
