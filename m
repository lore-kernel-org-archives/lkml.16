Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1A017BB6
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744438347; cv=none; b=p9Pl454YUzO2jLTY4vPNAmv7VnVc9xRHCJfrrSxKhtCuw+6ZWuiGFVj0128fayBMm6t7WVx7AIffZgR+g5OFV6d6oaEwW5JmLHA0IUuoANOtCjts8i9hTeGHK7vvfU3svoFXbn9vcIsnfn0FR9FyVL+4hrlF4Kr+hoViR7rYYS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744438347; c=relaxed/simple;
	bh=h8oTTN2YriP6MbhNfhyn96MBZFeleI8dCrvM8e/1T5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kRH8kBJT0LHGX4FcLN8oQIJ6+K55A2Z2Xs31ZER2T6xXV5LXZq9ZHymbTG5HjTmUCuGyGuE+UIELlZuR8MnsyjZxQiXjtqGR2u/hGdQ+dd5HQ/70L33DZj3LN5auhsBmQfDxHoHOf/h+1tUfAMS/zQH0VKxmPhuXzpLs+Fcq21Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0c7bbNF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0c7bbNF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F39C4CEE3;
	Sat, 12 Apr 2025 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744438346;
	bh=h8oTTN2YriP6MbhNfhyn96MBZFeleI8dCrvM8e/1T5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h0c7bbNF3CgUIG2LSKma7pKYL6ii8zHiFS3dG16GiFdmEYVYn/YhI7yqx2D32NNuM
	 FIHdGy/LBgnMKjYGSJOROvo4NPiEtxslF3LskZAZkqvdN29VBXCYLDvVAu0zSZRvkR
	 EEiG56zvZd+DfzAqiXuGaZSnjomUI6yBd5zO6EZg=
Date: Sat, 12 Apr 2025 08:12:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: alexjlzheng@gmail.com
Cc: tj@kernel.org, alexjlzheng@tencent.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to
 per-fs lock
Message-ID: <2025041256-sanction-sandal-7f51@gregkh>
References: <20250411183109.6334-1-alexjlzheng@tencent.com>
 <20250411183109.6334-2-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411183109.6334-2-alexjlzheng@tencent.com>

On Sat, Apr 12, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> From: Jinliang Zheng <alexjlzheng@tencent.com>
> 
> The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> 
> This patch switches the global kernfs_idr_lock to per-fs lock, which
> put the spinlock into kernfs_root.
> 
> Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> ---
>  fs/kernfs/dir.c             | 14 +++++++-------
>  fs/kernfs/kernfs-internal.h |  1 +
>  2 files changed, 8 insertions(+), 7 deletions(-)

What kind of testing / benchmark did you do for this series that shows
that this works, AND that this actually is measureable?  What workload
are you doing that causes these changes to be needed?

thanks,

greg k-h
