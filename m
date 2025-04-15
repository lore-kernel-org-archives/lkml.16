Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B017148FE6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744730210; cv=none; b=fWJxL2xFBdljx4qg5QKi86vhBkBp0htITv49VsvORUsVm+73Zf4fscK6jbDUiNZbbuFBYERyNj0Vu1YQ2aq5BB2wHpDCUNX2zEsbTHkxZqf6UhmPGj92zxwUQ3mYXwtavNlivBinU2fOB0jQ4F2vX+O6kRzD2Zo6jx6yzFoYuCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744730210; c=relaxed/simple;
	bh=7LSQEwmVoiHPmM17BefBKFp45q9gGv/SEiq9lDzA8CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJuHfUqbZar5TzJxpsuLik54T//BszmKz38klw2IrLwktCdOi0OG8HHRR6wPAdPmtjsaKUrC8Rqwd5D+Zs8fHEShxB+bqlTvX/7QGQSIbRj8X3urvTwbmW64yWXTTHLCU0vLxURdsnGWpSoLgZnjMajP6eQJDcMMd1lBtCUZveA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AGz5+YWT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AGz5+YWT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13A14C4CEEB;
	Tue, 15 Apr 2025 15:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744730209;
	bh=7LSQEwmVoiHPmM17BefBKFp45q9gGv/SEiq9lDzA8CU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AGz5+YWToJQatsQAbyr1/ITxIkhQCVxdihMzelw89ef7JAXNODuXMX93q3/uZbgv8
	 TZtldK5/eATugiIzSIctHrSb9AVwyiQeyyyPilooYP6Jq0HeydgAKXQTtNRQC/Xiqk
	 rqSGaRPnKJYxIPS4J/qSUDQtBvyzIJtOZj3G6Ylw=
Date: Tue, 15 Apr 2025 17:16:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jinliang Zheng <alexjlzheng@gmail.com>
Cc: alexjlzheng@tencent.com, linux-kernel@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to
 per-fs lock
Message-ID: <2025041506-punk-conflict-ffa3@gregkh>
References: <2025041318-unnatural-caucasian-48d2@gregkh>
 <20250414032054.72526-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414032054.72526-1-alexjlzheng@tencent.com>

On Mon, Apr 14, 2025 at 11:20:54AM +0800, Jinliang Zheng wrote:
> > On Sat, Apr 12, 2025 at 07:50:54PM +0800, alexjlzheng@gmail.com wrote:
> > > On Sat, 12 Apr 2025 08:12:22 +0200, gregkh@linuxfoundation.org wrote:
> > > > On Sat, Apr 13, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > > > > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > > 
> > > > > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > > > > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > > > > 
> > > > > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > > > > put the spinlock into kernfs_root.
> > > > > 
> > > > > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > > > > ---
> > > > >  fs/kernfs/dir.c             | 14 +++++++-------
> > > > >  fs/kernfs/kernfs-internal.h |  1 +
> > > > >  2 files changed, 8 insertions(+), 7 deletions(-)
> > > > 
> > > > What kind of testing / benchmark did you do for this series that shows
> > > > that this works, AND that this actually is measureable?  What workload
> > > > are you doing that causes these changes to be needed?
> > > 
> > > Thank you for your reply. :)
> > > 
> > > We are trying to implement a kernfs-based filesystem that will have
> > > multiple instances running at the same time, i.e., multiple kernfs_roots.
> > 
> > I don't think that kernfs is meant for that very well, what is that
> > filesystem going to be for?
> 
> Thank you for your reply. :)
> 
> Similar to cgroupfs and sysfs, it is used to export the status and configurations
> of some kernel variables in hierarchical modes of the kernel. The only difference
> is that it may have many instances, that is, many kernfs_roots.

Let's see that filesystem first please before determining more, as you
would be adding a new user/kernel api that we all need to argue about :)

Anyway, for the 2 patches that Tejun agrees with here, can you resend
just them?

thanks,

greg k-h
