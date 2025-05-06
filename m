Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22C527FD5B
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 12:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536117; cv=none; b=lTFX4lu7d6/nuAycn1Z+7pnwFDIygjAAN/sTT2jjSvIsM2GLetOIHoHC0Uot92dhT5Moo4rCigaQ24rsrcGnGD34lwfubgDZKaDbn50iGWBYNcYPW5ljlAVSsXQMfaQnS7BaAyun3HPhpwPJUnxC4oy7KUj4UwcSsS5f8JttTgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536117; c=relaxed/simple;
	bh=vOfAL/qzO/ycGuh7I27Qepc+xDNQHpOz1aWR0a5fy3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=peEoiMk000waU6XIWI9cEf+przv8U4RUoQDsJF3zYCc+TQfjx4KjiNnZw09K4OvChwbw06SjfKfGvJut84WCVuhKvoUqnjXzgigDgD8CGjTMuKf+Nyf24ePwu+GFXqWf3APpTSR1Jz8OZwpHin8UjbHl+jIDO/p1kGZfvtLsDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qplgLNWU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qplgLNWU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54AEC4CEE4;
	Tue,  6 May 2025 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746536117;
	bh=vOfAL/qzO/ycGuh7I27Qepc+xDNQHpOz1aWR0a5fy3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qplgLNWU3kxHo+hpTvNfQtXL8dlXJWYGVMI0pKZakDrjgsPGg8XXS13qLJW8uZESF
	 asawnBC688YueGJdtlhVY9gK9K3vH5O5jTG0+Hk6MoVOa/ytJ3AF0K0EP2N2lvi50y
	 0OubBsFvSS8MxBEejedOemQseQ8ukQY8C6e/9rAIHjQCL/0bFT+XnMI43YiQKx6+wT
	 ZnjBqWiIWp4zPhbSp1QItSJoY+vPD8eJ25x1shAkidlMbqBuD51re50eU2ojNkonfH
	 cOfidLkNm6WIrv8/II5uLb/ULfp9OuywupFKDGFnedvYPAS08LMFR9Br7ehP1D7HcW
	 Myy0ZNDqtqNBw==
Date: Tue, 6 May 2025 14:55:14 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: Tejun Heo <tj@kernel.org>, linux-kernel@vger.kernel.org,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 0/4] Workqueue: rename system workqueue and add WQ_PERCPU
Message-ID: <aBoGskbRu0RyRXMF@localhost.localdomain>
References: <20250503082834.49413-1-marco.crivellari@suse.com>
 <aBlMLQl504ThYbnf@slm.duckdns.org>
 <CAAofZF60A82utmB2LiVw910cdFDiHd+fPaozUKpQwfXUqv7R_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAofZF60A82utmB2LiVw910cdFDiHd+fPaozUKpQwfXUqv7R_g@mail.gmail.com>

Le Tue, May 06, 2025 at 12:10:18PM +0200, Marco Crivellari a écrit :
> Hi,
> 
> > Can you please make a summary of the discussion here? Referring to old
> > thread is useful but it'd be nice to have the rationales laid out in the
> > patchset - why this is desirable, what is the transition plan and what are
> > the rationales for it? Also, please include a short summary in the patches.
> 
> Sure, thanks for the advice.
> 
> > Let's keep the old names for a release or two and trigger printk_once()
> > warnings about the renames. These are pretty widely used, so I think it
> > warrants a bit of extra effort.
> 
> Good, sounds fine.
> But I don't understand where printk_once() should be placed.
> Can you give me some further guidance?

So one possibility to achieve this is to not do a rename of system_wq
to system_percpu_wq but eventually keep system_wq around and create the
new system_percpu_wq. Convert all current users of system_wq to system_percpu_wq
and warn from queue_work() when system_wq is used.

I would personally prefer that we use WARN_ON_ONCE() so that this really
gets noticed. Tejun what do you think?

Thanks.

-- 
Frederic Weisbecker
SUSE Labs
