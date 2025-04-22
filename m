Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941B917A2ED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 04:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745294833; cv=none; b=RyBVE4/bnocvl04Mr1I33BsEIZ8CW1ped27Fq64IaGZ5xAw6F9gdWlCkVTKEFVPSZTYa6uEXrhj6Ivz3xoPOvYjXnTO/GYTmbWU8DoD+Ek23MvvdqLY99uL/6q0VfM3Nkl0blgAcLa3sS5t/1HwJsjQO3yRPznCQOLptjcB28Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745294833; c=relaxed/simple;
	bh=QAdDrtj1nuZWWw4f191Dtr6SFFTVJHIvpOTS7gaWUHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENVKZyq9c6jzViRylOxQ3aFflLeCqaNegZ4dqZwVAVRkpmGqCvvEl9s4icfnQoY/rqG0GecKTnH8/WwaEA7vUN96vKqgm6E6wkC3yWSnbCKeWf67CqvrAkTYT79jBdggUUVVQkHxteUBk00hX/smVjccJyC5Th5Pfn5kX3LI+B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=L7I5E0Uj; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="L7I5E0Uj"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c55b53a459so469264485a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 21:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1745294830; x=1745899630; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pn51hFpFTFagOSHuF4DEwBg/7u0CH8uTd7Ja7DWosA0=;
        b=L7I5E0UjDaJ9Kw43mBYcXRbUwwn0OwmdkoO2lTm+Ox3CRyvs51GKcrCGZPSPq9twdm
         QKMWauOQbhMKMdjEWmUrWrbW1Ynp0vTKmMCLeFiVOU6M0u27qynPP1bPWDu3PlIYataQ
         cO1T3nH15sVSTtg64oVF1lLavVBax9p0eGX12o4bMMZJ846ooTQ1xXcLuRnWBS0ooWdH
         cQUCpPEb84PyJHqncUvvDP6qEu2DIRR9idO40Nm/dj32++eOn1LBnNbx99jpl1XZdPmv
         LRED1mnJnG2nTcszS0DdfPH4B3mtnA3feZ5Nfj5I0+CNJj6hEy/pP7pqHYJOhODtktLV
         LoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745294830; x=1745899630;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pn51hFpFTFagOSHuF4DEwBg/7u0CH8uTd7Ja7DWosA0=;
        b=YRztP57Rvqdix2c+uez2I40E6loubLp/Ar2YD+aCCGhPKnKkzvV/YCVY2bVQMfLObE
         thQRSjKyLXwzK7JDK49jr1o8oOHI9TEvkGme8UcEa4tG9to/SpB+Fqo+4qDdLBG5hCbn
         9llY/fKrguDEwVTffvCsSSNgAYCpD+ogVQFDT7rHf2ziezXv/It/KtYVr3BIC9yiasHC
         3QOZ2nZceNyenr1V8fCNAinRqkGifOxFMXos4MlFjAWXYMkk7dlDj0z2UOsvzXjm7/4D
         EMJc7QZY46d9FLO6suJkSGHK1nR4v0VUKW1l9Ddmf2lQ8HkGkt0OyMsDJIvnnU3Yez/n
         MkqA==
X-Forwarded-Encrypted: i=1; AJvYcCVfx4npPexYVqWHdsLLBPvTK2LpsDGVxKI2w4Cygw1LGxSq0smOZcjVj1DBu5/OJPK8RI2cZ9vP2np6TVU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiG6SZNj2Iiyrm/pxnjS5Og3GQuCL1MPKs5aDMWWAxSmik01p/
	gzFxQ9nA5pO+LJ7glPXNuVu3CD6G7v780nSdCByfrtJYy5MUJFxcfTOCCwvhrfBWpIT2Epni9bD
	h
X-Gm-Gg: ASbGncsuTGE+CsE0SaAawKhh9RYuugPDsYJaZpXTe+l2vzXUyShC/RCAy8lcdbsLcHr
	A/21Rz8Rhj1J7pMbhezY0RoqWvqWKQPl+Jtv033Wx6SdGlIyQgk5FIc9+LGJBoWNiMOIQ2RZIIX
	xRq30l1BIqpOt0yvEhr99J907E8rZQ9AGSq+eZv9SQu20h89yCfiFQxM2SPkZbUOwuZsOCWWe++
	6Ran1llR4akv8EhNJ4QxmiR/UUvsq9shF3y0BxnYaGLesbTdN5I6sSkpCseFLgBzuqksvRkyp8c
	mYmdtX3tBBBERCODHq/rkXVeiuLtRJSykVcncc7/r3M9z5IieUYU/gQlPPcQj4YkIg0YdmP4mID
	yZe03q1msutMv0N10Arc36tc=
X-Google-Smtp-Source: AGHT+IEiqfCY4yW0u7a48f8L6A0kzRDy2F8MnJUbXRTzNqpzbAbE0B6Uy/hIslrtvzFwl6GwITBPpA==
X-Received: by 2002:a05:620a:1929:b0:7c9:2537:be48 with SMTP id af79cd13be357-7c927f81067mr2156091385a.24.1745294830360;
        Mon, 21 Apr 2025 21:07:10 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b6e198sm500347285a.103.2025.04.21.21.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 21:07:09 -0700 (PDT)
Date: Tue, 22 Apr 2025 00:07:08 -0400
From: Gregory Price <gourry@gourry.net>
To: Waiman Long <llong@redhat.com>
Cc: linux-mm@kvack.org, cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com,
	hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
	shakeel.butt@linux.dev, muchun.song@linux.dev, tj@kernel.org,
	mkoutny@suse.com, akpm@linux-foundation.org
Subject: Re: [PATCH v4 2/2] vmscan,cgroup: apply mems_effective to reclaim
Message-ID: <aAcV7GmTJGbC1R_s@gourry-fedora-PF4VCD3F>
References: <20250422012616.1883287-1-gourry@gourry.net>
 <20250422012616.1883287-3-gourry@gourry.net>
 <d7568176-6199-488f-b45a-c494c8baec25@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7568176-6199-488f-b45a-c494c8baec25@redhat.com>

On Mon, Apr 21, 2025 at 10:02:22PM -0400, Waiman Long wrote:
> > +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
> > +{
> > +	struct cgroup_subsys_state *css;
> > +	struct cpuset *cs;
> > +	bool allowed;
> > +
> > +	/*
> > +	 * In v1, mem_cgroup and cpuset are unlikely in the same hierarchy
> > +	 * and mems_allowed is likely to be empty even if we could get to it,
> > +	 * so return true to avoid taking a global lock on the empty check.
> > +	 */
> > +	if (!cpuset_v2())
> > +		return true;
> > +
> > +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
> > +	if (!css)
> > +		return true;
> > +
> > +	cs = container_of(css, struct cpuset, css);
> > +	rcu_read_lock();
> 
> Sorry, I missed the fact that cgroup_get_e_css() will take a reference to
> the css and so it won't go away. In that case, rcu_read_lock() isn't really
> needed. However, I do want a comment to say that accessing effective_mems
> should normally requrie taking either a cpuset_mutex or callback_lock, but
> is skipped in this case to avoid taking a global lock in the reclaim path at
> the expense that the result may be inaccurate in some rare cases.
> 

I'll add a differential patch here.

~Gregory
