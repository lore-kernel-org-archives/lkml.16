Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF467082A
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745033280; cv=none; b=TgNoQY/wamE07rHWBsyTdBS4rd4sdee6ZIz1Ir6Ik9QoLrhmpmzu4EGSgVv021x0rpMYnUkuTD7YBira5G78E1ggFie5sYNduOWyCyKIlPNh5X0DvjFoZQrhaC2hyNzh0VYN9Pn/a1xwlOhqReTfYmOSSxt7WwuPCbcUvK/Jlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745033280; c=relaxed/simple;
	bh=EkdlhuUR/maeZPX8zcin25LaGkgfYCyCpyAOUj7+En0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EQ5RRVP97ZRT7c/KBTmfs+n/6Lkb9u3++31qAAg2QN9FBqo7wObRBb3LIprOG0wgbIgCu1PLDY5khgmOzGaKXhW72fFiEXkN7N1sNf6WDMELEW1AAIotqw/3fRm1d5TkAsyQjUFfKaXabPXUFQMJfxPvgP/CKbaVDiBUvXiXiD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=eCf7t4kQ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="eCf7t4kQ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5e1b40f68so246274885a.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745033278; x=1745638078; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yeXMXSSzOYM79gde1X46jJHnJZxA7c7jB0TbcbsMRB4=;
        b=eCf7t4kQlccDo6yl4Nju9CImvydB+EzHmfZTpBWq67wmUuLhi1575mXROJ65FYweKx
         hPFSBlKK49S6fqj/6i5wS8SmQxURNgd1RMkyKaDoezf3qA3TguY9LrlWoLKcYpPx0WjZ
         IJXmd/sFNkkFLQdOZrB5UEMxszGS/+T+fuNkKbkST4E85Ugm/+XAvcfVJmMFVFX5oCg3
         k5OnXQ2b9hBfJlRp6o7n09ngcP7P+01bVzF8e9o7HCHrQTC/JnNKv7ITNyLfDF9JIq5U
         msgBuSOW3rI0SonHo9u/xsD+jSSm8IxQ88QMu62e9HAOug6wZLMyvo1BUqzdqNU/PVBN
         86Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745033278; x=1745638078;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yeXMXSSzOYM79gde1X46jJHnJZxA7c7jB0TbcbsMRB4=;
        b=ZObDQ7ZOnZGJ7wLt3m2cNR0cZspzWS+XwKzxiTYu8ItL1OCaz+jEqVeolGpL3dq+zS
         x1pXRWzCrGMm8GWfxa7xJEoTKTFOjNh0WwM8gzdHsfsFJ4bqmexmIOhDln5REeEOVPi6
         ET9Ge+Z0ogTWaMNQxb98ke4i4p7cAb0PToGdJJS/kwppAqrv2CK7QFCxNTn5zFiQFSCW
         AoneF/dLaP2hrE5wp6jo1i1OKqL8XQzcxm96bKZwGwmT6xtAQtvKpuOJojUgoJSx1SFL
         iG7GpMr081dYuLwVIp71hckCsh1I8saxb15AiL70Pblvdxhn1EoMILnXpwsPRsTBXUS4
         MHtg==
X-Forwarded-Encrypted: i=1; AJvYcCWukqWU2sXhid0vAXIlwBzqYWouqGgqJ1BS1CyTAD10CfuNLYJfbX2lLTk2AZPPckaiHjsbk0qvyq4CrhY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzam8oeH/Ib4Mx4Y3WQdzuSr+P3WwkVRbXBBiaO9Icjdasi4nzx
	PG928xtyYy0+qjojDarkmIZj4yhdaQzg+b1zKbS5vhNqyPxtt4ijBNLRKj7IIRKhzJ/5Tqe05h2
	G
X-Gm-Gg: ASbGncv5xBazqj7YpDhrl+kB6uwqDZg7oXTUIxvTYiTar2fUjlJlElvw2lfFnyQCgPa
	EJzMeWPCxx7ldZA8P12UVnGg/pU1puZw7gJCbN3F0vuiFU7wn250gTHeV8kmK7HAAZvCq0QLQZp
	IAHfmD6z3MUiA2f1Nc2y8bc1I67jKHq6qsQ4E/m3pz/f5yOAzqobBEVjPOPRaj4HG/ehS3phzCz
	OKLWBl+iFCnm2MpmGcro4/4vJPGTi2J6UJLGYcNKoJKWI35tf7qBt87f5zQ267yRyh0SJA3oOtv
	6VVPab4rrCG6o75ybMtPQn7J7JOZsdjajki1onBdAownUAJUqikSrfxhUAH9nPRKZdHzHDNCGLM
	vfUFpia+6URqbm99mkEVCe7Y=
X-Google-Smtp-Source: AGHT+IFI0fqsWNRil4RH53+meP9hxUVCCEQa8S74bFAShz56Lmc8QxXWWOZOtWwNV00SncAzpszxHg==
X-Received: by 2002:a05:620a:199e:b0:7c5:3ca5:58fb with SMTP id af79cd13be357-7c927f6fedfmr857572785a.4.1745033277742;
        Fri, 18 Apr 2025 20:27:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f6d0sm174315185a.40.2025.04.18.20.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:27:57 -0700 (PDT)
Date: Fri, 18 Apr 2025 23:27:55 -0400
From: Gregory Price <gourry@gourry.net>
To: Tejun Heo <tj@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	hannes@cmpxchg.org, mkoutny@suse.com, longman@redhat.com,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org
Subject: Re: [PATCH v2 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAMYOxSOrVpjhtzT@gourry-fedora-PF4VCD3F>
References: <20250418031352.1277966-1-gourry@gourry.net>
 <20250418031352.1277966-2-gourry@gourry.net>
 <aAMTLKolO0GWCoMN@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAMTLKolO0GWCoMN@slm.duckdns.org>

On Fri, Apr 18, 2025 at 05:06:20PM -1000, Tejun Heo wrote:
> Hello,
> 
> On Thu, Apr 17, 2025 at 11:13:52PM -0400, Gregory Price wrote:
> ...
> > +static inline bool mem_cgroup_node_allowed(struct mem_cgroup *memcg, int nid)
> > +{
> > +	return memcg ? cgroup_node_allowed(memcg->css.cgroup, nid) : true;
> > +}
> > +
> ...
> > +bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
> > +{
> > +	return cpuset_node_allowed(cgroup, nid);
> > +}
> ...
> > +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > +{
> 
> What does the indirection through cgroup_node_allowed() add? Why not just
> call cpuset directly?
> 

This is an artifact of me trying to figure out how to get this to build
with allconfig (matrix of CPUSET and MEM_CGROUP).

I think you're right, I can probably drop it.  I was trying to write :

bool cpuset_node_allowed(struct cpuset *cs, int nid);

and just couldn't do it, so eventually landed on passing the cgroup into
the cpuset function, which means I think I can drop the indirection now.

Will push it and see if allconfig builds.

Thanks

~Gregory
