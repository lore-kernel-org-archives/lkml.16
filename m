Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BA53A6FB2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 23:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746487704; cv=none; b=Y6TcvAybDsRQy3cu/T1+Ac5a1dBcKWfoREcfnB2Dyrt1Ptsbn2dAHYwjF6YZYXF/kw4R29oK1ky5diY8zxE1ygIe9kU1ZO7a6eSkc33rEa+tZ5cg2aVy1baeT4ROfGyU79qPNaym1sjWttZLVmedfdzBwVe4e6sKvNBmeD+InIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746487704; c=relaxed/simple;
	bh=qF/Trttt4tQz61wSSpWUhxFb98lleOeI0ZyR+ik0pWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAKINN2vzUuLPNXqmpX3C48X1k45f5sDINtPVzwBFkvPH1VtZA7d7i6cAMfmjqNbDIGj3Jf5LNpe9D7Zvaeoc5tCa0kdC/k3wWI15ajVxujy6V1HcsuAl3qEetupKqwfPhKQ2RB+2NARk8CBE6+iKhxSHZHDBmkcZLF6DMSUUTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fjhiiwUU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjhiiwUU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 683EBC4CEED;
	Mon,  5 May 2025 23:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746487703;
	bh=qF/Trttt4tQz61wSSpWUhxFb98lleOeI0ZyR+ik0pWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fjhiiwUUDYMgwhKt1Cj+n4UdYSVj2EuH5U9MlQnGM9U7s9gPg3NFAcMEdrLqtuj0H
	 40JD6sBLzmVsGAm0hyWxD9ggZ4t1IA3n2gb2uzpxJjKJ9jHFd5N/7x8rMDfS+HudDs
	 j7lrUXdrzIpftJGRk2WR9LtWpKhBLAzaLBsjwr+sYiolw0hkPDqR34HYW+ZBltIqPK
	 dFKzDpOboFfRLY1xVAE6oxGKpLxz5DxmdbAh3SiNpV/+qF9u0DHEilfpi/sJZBPJMr
	 cJ315jlV0Y5n5p5avUyVbelrBKvDu6SGqZOgH/dLBfbFz0t2FeXS/3dkklx6QIi4mw
	 kK+0A5Gm9aGEA==
Date: Mon, 5 May 2025 13:28:22 -1000
From: Tejun Heo <tj@kernel.org>
To: Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Chengming Zhou <zhouchengming@bytedance.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, Chen Ridong <chenridong@huawei.com>
Subject: Re: [PATCH] kernfs: Relax constraint in draining guard
Message-ID: <aBlJlqfAlayxfMc7@slm.duckdns.org>
References: <20250505121201.879823-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250505121201.879823-1-mkoutny@suse.com>

On Mon, May 05, 2025 at 02:12:00PM +0200, Michal Koutný wrote:
> The active reference lifecycle provides the break/unbreak mechanism but
> the active reference is not truly active after unbreak -- callers don't
> use it afterwards but it's important for proper pairing of kn->active
> counting. Assuming this mechanism is in place, the WARN check in
> kernfs_should_drain_open_files() is too sensitive -- it may transiently
> catch those (rightful) callers between
> kernfs_unbreak_active_protection() and kernfs_put_active() as found out by Chen
> Ridong:
> 
> 	kernfs_remove_by_name_ns	kernfs_get_active // active=1
> 	__kernfs_remove					  // active=0x80000002
> 	kernfs_drain			...
> 	wait_event
> 	//waiting (active == 0x80000001)
> 					kernfs_break_active_protection
> 					// active = 0x80000001
> 	// continue
> 					kernfs_unbreak_active_protection
> 					// active = 0x80000002
> 	...
> 	kernfs_should_drain_open_files
> 	// warning occurs
> 					kernfs_put_active
> 
> To avoid the false positives (mind panic_on_warn) remove the check altogether.
> (This is meant as quick fix, I think active reference break/unbreak may be
> simplified with larger rework.)
> 
> Fixes: bdb2fd7fc56e1 ("kernfs: Skip kernfs_drain_open_files() more aggressively")
> Link: https://lore.kernel.org/r/kmmrseckjctb4gxcx2rdminrjnq2b4ipf7562nvfd432ld5v5m@2byj5eedkb2o/
> 
> Cc: Chen Ridong <chenridong@huawei.com>
> Signed-off-by: Michal Koutný <mkoutny@suse.com>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
