Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD361DA5F
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748600629; cv=none; b=a2DdajsI98TuoeBsFFGdI3A+vvy2fmfs7oZPnYp9jRMZ+5jkncpjijfqqOeS0PW+UoA4llNkQvii+PDKkFDOsJ3U6JLt+XYEmawWJ6EHWwSJTb2dxk6lNULyAopYZCgRhDnpyF2d6TIy7CQGF8RiADhd6PfLYx1EXHUL9bPYirg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748600629; c=relaxed/simple;
	bh=zgT/MjgMpDPsaHt3E56bqSXE2OuI+8D3G3bl84uv0Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O6+Xn7y4w5I4gvInLSi5pkxSkfhXY7Fr2LvwuOZH1mc8X/UfocgjONoDZ7ZVN79VPDYYRW/wjKyJ+0f2j2h1dNgCy0iQZJgN5iHt/vjZftX+e4dVe2yR6iahUi2JndUEqtGFHKEzU27dlcyBfS+VQxUYx/nl+3II/EFcENywKpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b9oWNYnd; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b9oWNYnd"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf214200so15423545e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 03:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748600626; x=1749205426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8KNR9OGSZRtTkE7BYOybOhLSnaQfO55gQ1kPbK5Ff4=;
        b=b9oWNYnd18yffwXfH+8dLq1AnvFtE2DPTMHoAej74IZcf1WgzcRcoL440iFvdayfiJ
         O2DgWsw+NfiHp3vx/jt4FqU3HtjiHOZjUBcD1MFTkXSm+GzxQFUDp4fvq2dER+7dpQBs
         5fkiStlH5pluiKFPHn2xDdlP6qdvwqSvx8TS6QLwwWV0ZaIG7Eph4EKMrVFTjVSgoFMs
         LAmPlz7zevkjK7wvxbrZVD4etVmBIzIBPmlEXmBs6YYVA+eD3RYBET/ku0E0xCzUJ+0h
         NPBdjxhEWDwxEAvje/HoQOe6EcLythIVM3XG7JsCo8z133QkpUS3ju2X1jJUz3KP7jYO
         7Ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748600626; x=1749205426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8KNR9OGSZRtTkE7BYOybOhLSnaQfO55gQ1kPbK5Ff4=;
        b=EuUpK1pykor2jHP2KrWUT70NKnaDZx/rFegMHUPqVfuIRB4DlMpioONoDqYO3WUogs
         E0lBaS4ADe0NwuurpWsHkg5y2VC3XVfJOOvlGCAoztZvSZWKUzLUGh+Zl/e93nR9jOml
         OF7+QjaUU6EHo28uNxM+g+nt94qXTFzOBROXzICqPAaJFyKxTVBdhtRli401r8srdJuY
         xcHPkivA1lA1utbb6oQ1zXwM64vW2TvFYPmEbjjogO0g0NnBr+iIqt4PFjkTHJoRBDDy
         5SOJJi9neU0buTZic2dz2RfzAOGAW4ND0og7eE3HWFOkKswOTZAFmWgjHm3wROPf7rzX
         9WqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq3SIiPD46/qWTAF1Ukiamt0FuIA1TMmrYrRJQQtFSOZ0efFojdp3Ov5Lae0kdzT1JeIZfi8kMMEhbRQ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoOsjqs/ozLvyMdDH0ci3cJEO+bPDtdGIhIqySHEkmNnXMQn35
	oLepsIQsxjdNiqQVn2gXjTd54tkh7T/4YhLRHtUBfjcKZdi1vkiMIljcyCDhBhBaB60=
X-Gm-Gg: ASbGncvTf/b9rK6U0n4LQjThyASY8Clnm9Um/fBZc8ZnA70LMppqPOBXmNMs9NOh45W
	UwEI4cx/aCbV012bn5saIpvxxF+PvZlY8Wsis3z0gnt9IG20XoyeYk0IOj1trgFRqWFBsS6RhJ3
	XJBoo/y9v9x+gae3MZUFlzxw6ulnK9ZKF5OERuNQ67swC/hKUPPb0hn1hPMK+msHQpHE/nMnSCa
	9OjUfi2UmrpeP9Zl1sntbzd/IGOdnMnGn90eo90ko/ETWdCIgOKw7fb8/pQvWcSBbkeupfg+OeY
	Ddo/gnon0ZqRy15q9mI/bYj4IbjPzQSCM3hQoihs/kU1HZysrmSFwet3gxIKPhkZ
X-Google-Smtp-Source: AGHT+IFuFzDUmylAHAIt6CmGydI0iWc1wwvnaWi7Nzf5dxp4QYaKY7sas81SAre3IsvZR01wrooFSg==
X-Received: by 2002:a05:600c:608a:b0:44a:b7a3:b95f with SMTP id 5b1f17b1804b1-450d8868f88mr14079325e9.25.1748600626052;
        Fri, 30 May 2025 03:23:46 -0700 (PDT)
Received: from localhost (109-81-89-112.rct.o2.cz. [109.81.89.112])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450d800658csm13986585e9.27.2025.05.30.03.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 03:23:45 -0700 (PDT)
Date: Fri, 30 May 2025 12:23:44 +0200
From: Michal Hocko <mhocko@suse.com>
To: Aboorva Devarajan <aboorvad@linux.ibm.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
	david@redhat.com, shakeelb@google.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] mm: fix the inaccurate memory statistics issue for
 users
Message-ID: <aDmHMLpMBTPCdRBN@tiehlicka>
References: <3dd21f662925c108cfe706c8954e8c201a327550.1747969935.git.baolin.wang@linux.alibaba.com>
 <ea0963e4b497efb46c2c8e62a30463747cd25bf9.camel@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0963e4b497efb46c2c8e62a30463747cd25bf9.camel@linux.ibm.com>

On Fri 23-05-25 15:44:37, Aboorva Devarajan wrote:
> While this change may introduce some lock contention, it only affects
> the task_mem function which is invoked only when reading
> /proc/[pid]/status. Since this is not on a performance critical path,
> it will be good to have this change in order to get accurate memory
> stats.

This particular function might not be performance critical but you are
exposing a lock contention to the userspace that could be abused and
cause contention controlled by unprivileged user. I do not think we want
that without any control. Or is the pcp lock not really affecting any
actual kernel code path?

So while precision is nice it should be weight against potential side
effects. 
-- 
Michal Hocko
SUSE Labs
