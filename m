Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DA47E107
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745034068; cv=none; b=PtriOvd9kUdWafZApJuSNW2JBjgzVW9a0QNzl4B1+6YO6RocLFh43Bhfjoux4C2nK/mTpB5AsO1ztu+H8WrKQYXHVpR6Ql9eNKJPaHQHG3rCSA7kClTwQaB9bYTslBYZeg8KwFffq41/yo90gXoTZrzEXNkSoMKX8utwBfC5ibs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745034068; c=relaxed/simple;
	bh=PHdsXTX3X2tbXBA7ibrldPy1C6uFMyd0FcF6/SMQ3AY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=okRlJ21b64rTGkx9rlhN5PVkrgsTlo5JbU+sR0w7lSorOspP/KP2MfE4rCpWdIKhFrnQRfuMyMxnNwESRzcRQmtEAGmPbr/lBYxKcX7XVa+aXVl+9dMRPvo+MLsgQNwuwwwc6piNAnD1RtI+BeLWSKhxHk35/r+2RocPt8/uXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=EZJEDGQ0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="EZJEDGQ0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c5568355ffso191626385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745034065; x=1745638865; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vf/SdZzWZ/97U55NJCW7xj0E3zqMD/eAiVLqyHOwDFs=;
        b=EZJEDGQ0FmEbQ4lG28XHQFa7Z+5PvAWw2Foazq+K7DqaCDW1u1/k7dAdDMhYj00shn
         ljFyV+anvi8XNichPVN6tnDhwULLdTqqS4a7HEIJZElhmWaRx0uvbk/h7fFKGtYjT1hP
         PLi1IqCMF2NEH+RotV7pMTXl4iFlH+2B9OSh/6DayNhqnCziAlcDo+dB34q6iUkM23LO
         L8edvFpYeRiE6WlOWd18Ee2kbRYoIpAI8Tz4gIHX2O9vjwOOY9QqMWTg95DjfD+wwKfw
         7vzIEklhrL1BHebuW5unEjnEo5iTi2RxCjd/xaoEF9Sa0RUCR9tQXIt1oVjktlpLK9b9
         k9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745034065; x=1745638865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf/SdZzWZ/97U55NJCW7xj0E3zqMD/eAiVLqyHOwDFs=;
        b=cjivHURhkwkBz91q4pIN+k3mbTn7T9wQ1IstJa+pKuNNIl9zW7Tui08ejnJAdov4qX
         Y7ap1pm8iuilMR4xcWGWkmlD+pyUYfpn5iO0W/xyTwkCvA4+X7M1fsiqlGkGdyxMRa27
         6zYGAofxqmaFlFaj2+W1doIpjVDXiQnreWkhsg1tu1PaFbkvj+vxgIs+F9pAbjKZC8ps
         K9/6NaxHNg+/4spejB/4UAG5Sta5UJ5ylD8aqW3m93mUYKVWuDWZpL4zuJAcDUtZu24A
         fJz4jEeHFrxaYzesw4WC5kyYQIMIDgTrr9Iuh6afWz8j8y4EuWq9jLWLlLpxY+2Brs2B
         Y9jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVblUMNYMiSR3f6FjWNsggBOrwDCe40VjQcU6CycUBjhgalTqdASSPrX1KZNPVmAB0lk/8X/IeOwJgcX3s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyySJjFSuQRIvXLP//33/tU+tHRJkIrzP1/B7nmravt0qFIzGdK
	W7zaeBgKSMSR7Fw0QK5JqqdXl+j8zhnyP8fNNInObF57shuh1/weCrbMC/lSi6s=
X-Gm-Gg: ASbGncsYebRrV5JgF0awKmWY+nrfq5KnZZC5LmVGZznJN2HCZDDHDH02O8P8a76LcQx
	V12h7uig6Ht3XwkH3+lHFGxV53TCYBJnA4IfvA8s6TFv3QgCvG80fADkVrUjE36g4Pw73sjjnqy
	pCEifzXSXpIk85VARPiapf3zS7BWWhnA8M6VR8cx0l/55jh124tril+ASppphnfNfbZvOPX/CUG
	sbRSvMjGYy6ZYsxkUWpOAxWmxOPJLCFNDvcRZRP0+vOZtchoKThurJT3M0EVTfYuTUQJvukVl47
	sv5uIu9WL+CRuHFFNiqPqsvxOxkS/z2jrCQy/B17a3pXWI4AwPFIvKMK9Q++9gze1H1/+oV1X6j
	IT8OpyM2hkSL7eOKqyBxoRis=
X-Google-Smtp-Source: AGHT+IHBuLN56lYhOyNk3hQZI/IKMdqmk7y+jZIExTVI9cAFyXEhsXltOxcEYmpfFoMh81jIo2Y7oQ==
X-Received: by 2002:a05:620a:260e:b0:7c5:94b2:99da with SMTP id af79cd13be357-7c927fb51f8mr786359885a.28.1745034065642;
        Fri, 18 Apr 2025 20:41:05 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c9280de4adsm152367485a.114.2025.04.18.20.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 20:41:05 -0700 (PDT)
Date: Fri, 18 Apr 2025 23:41:03 -0400
From: Gregory Price <gourry@gourry.net>
To: Tejun Heo <tj@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	hannes@cmpxchg.org, mkoutny@suse.com, longman@redhat.com,
	mhocko@kernel.org, roman.gushchin@linux.dev, shakeel.butt@linux.dev,
	muchun.song@linux.dev, akpm@linux-foundation.org
Subject: Re: [PATCH v2 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAMbT0Qh6yyrSJqt@gourry-fedora-PF4VCD3F>
References: <20250418031352.1277966-1-gourry@gourry.net>
 <20250418031352.1277966-2-gourry@gourry.net>
 <aAMTLKolO0GWCoMN@slm.duckdns.org>
 <aAMYOxSOrVpjhtzT@gourry-fedora-PF4VCD3F>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAMYOxSOrVpjhtzT@gourry-fedora-PF4VCD3F>

On Fri, Apr 18, 2025 at 11:27:55PM -0400, Gregory Price wrote:
> On Fri, Apr 18, 2025 at 05:06:20PM -1000, Tejun Heo wrote:
> > Hello,
> > 
> > On Thu, Apr 17, 2025 at 11:13:52PM -0400, Gregory Price wrote:
> > ...
> > > +static inline bool mem_cgroup_node_allowed(struct mem_cgroup *memcg, int nid)
> > > +{
> > > +	return memcg ? cgroup_node_allowed(memcg->css.cgroup, nid) : true;
> > > +}
> > > +
> > ...
> > > +bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
> > > +{
> > > +	return cpuset_node_allowed(cgroup, nid);
> > > +}
> > ...
> > > +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > > +{
> > 
> > What does the indirection through cgroup_node_allowed() add? Why not just
> > call cpuset directly?
> > 
> 
> This is an artifact of me trying to figure out how to get this to build
> with allconfig (matrix of CPUSET and MEM_CGROUP).
> 
... snip ...

Looking back through the include graph again

The reason was lack of inclusion of cpuset.h in memcontrol.c while
chasing the allconfig solution.

I was trying to following the current includes rather than making the
graph more complex - it wasn't clear to me whether going directly to
cpuset.h from memcontrol.c made sense - since memcontrol can be built
without cpuset.

The graph here is a head scratcher.  I'll still try a build with
cpuset.h included in memcontrol.c.

~Gregory
