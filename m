Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F942258CC9
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 06:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745215642; cv=none; b=imiYF6rEupzRK9nQf3IqM28HQNyllh+lM52wKGOVycZTEvsrquzsTGEPDhqriPFMG9RQSLUazVYPoZFOxgOqfaS3BfaGNfoqufZHduOJJeovfwvMwAM8fw3aUoRoubOa3I+5/ppqH0RfMOifn5CewSy4gZInh7j2tAXX4TNYz6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745215642; c=relaxed/simple;
	bh=njYq3IvVHIoztpuKkJsNyizxP05dXyJWwqc9F0uIHz4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5yhwuWJPkxHluh79fbnmbMOZRLi6dhYnommFkDN02xMjHUDsgHYTK4q/WaBNURlv4wFus8SWIRlPKupi/+2VVQmbcWk1mSg0hcSo52whtWvDgkobIbiEASdxr/68RelcbeT2VFsVHypHYbWMeKDiRr6anbRSSLJbt7Nz6qv6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xhJLErIB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xhJLErIB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5BC2C4CEEC;
	Mon, 21 Apr 2025 06:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745215641;
	bh=njYq3IvVHIoztpuKkJsNyizxP05dXyJWwqc9F0uIHz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xhJLErIBAzeYZblqvhE9Y9VFR06IIFF6imhmAZhW3fmg6zhwUrYkGOzTgYzRjxuaJ
	 qz4GSaKlXRdUS8rY4OQPw6clNBBFDybCUQRbWOWjjPndam4K3Qg2Pt4biJG3soI+Ix
	 R5J0ipMquR/kk14jPNZd761REZQ8mNunFhQgJ/vc=
Date: Mon, 21 Apr 2025 08:07:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinliang Zheng <alexjlzheng@gmail.com>
Cc: alexjlzheng@tencent.com, linux-kernel@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH v2 0/2] kernfs: switch global locks to per-fs lock
Message-ID: <2025042121-cranial-famished-c249@gregkh>
References: <20250415153659.14950-1-alexjlzheng@tencent.com>
 <20250420150244.127569-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420150244.127569-1-alexjlzheng@tencent.com>

On Sun, Apr 20, 2025 at 11:02:44PM +0800, Jinliang Zheng wrote:
> On Tue, 15 Apr 2025 23:36:57 +0800, Jinliang Zheng wrote:
> > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > 
> > The kernfs implementation has big lock granularity so every kernfs-based
> > (e.g., sysfs, cgroup) fs are able to compete the locks. This patchset
> > switches the global locks to per-fs locks.
> > 
> > In fact, the implementation of global locks has not yet introduced
> > performance issues. But in the long run, more and more file systems will
> > be implemented based on the kernfs framework, so this optimization is
> > meaningful.
> > 
> > There are three global locks now, kernfs_idr_lock, kernfs_rename_lock
> > and kernfs_pr_cont_lock. We only switch kernfs_idr_lock and
> > kernfs_rename_lock here, because kernfs_pr_cont_lock is on a cold path.
> > 
> > Changelog:
> > v2: Only switch kernfs_idr_lock and kernfs_rename_lock to per-fs
> > v1: https://lore.kernel.org/all/20250411183109.6334-1-alexjlzheng@tencent.com/
> > 
> > Jinliang Zheng (2):
> >   kernfs: switch global kernfs_idr_lock to per-fs lock
> >   kernfs: switch global kernfs_rename_lock to per-fs lock
> > 
> >  fs/kernfs/dir.c             | 28 +++++++++++++++-------------
> >  fs/kernfs/kernfs-internal.h | 16 ++++++++++++----
> >  2 files changed, 27 insertions(+), 17 deletions(-)
> 
> Ding Dong ~

You ask this 5 days after submitting the last version, and that includes
3 of those days being a national holiday here (4 if you include today).

Please relax, I'll get to them "soon", only start to worry if it's been
more than 2 weeks.

In the meantime, to help out, please take the time to review other patch
submissions on the mailing lists.  To not do so and just expect others
to only review yours is very unbalanced.

thanks,

greg k-h
