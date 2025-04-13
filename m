Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C09AD51
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744530786; cv=none; b=dcnfWC5VXUXmPy189gfGdyAFkooQRfT6mRbVesKSrXm5z2oc83pVpDUKP9huCcDs84Z+ZzKf1psFcQhrZOBNmQWVCAke8SxWsXk8qvFXFAu8Oeak2a8ouJaWthuB+FrO+w0QlwahqpMr7WE4pcvN/62I1Sw4LYZTtDosehkzfiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744530786; c=relaxed/simple;
	bh=VUdOv3+gXY2GDY+TYOAelI+pkWR1Ygxbq42Ra+fmtvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbxCDcXZoRI7PMDzMs+Au6A684UJSFN+nmHNprsF9uFEK/ykpsYKhcTp8giRjGmMl5Vz4FoPbVs4CX01w9hlPs0YdzYVtsjEEWb0tfmcDGTu2JFCNoXo6WiBA2LvVIYJi2bUtx925A26RIIlXqy+peiaHPgmZzGOgAnhfojWLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eWXBFlV6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eWXBFlV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A99C4CEDD;
	Sun, 13 Apr 2025 07:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744530785;
	bh=VUdOv3+gXY2GDY+TYOAelI+pkWR1Ygxbq42Ra+fmtvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWXBFlV6196S1oj6jXuE1jC20F3IZ7LoMG/8mQCzlBpd+9une96JYxAa9/YCoYIKO
	 rOvMO8Ew1XP/WeZL1we3omq91bMEA+XmLkK2r/z7mpGL2xx8wdFgbKhYtfS2qHnx2G
	 g243xSHSzfxnIz+a3mZcQDUd1lUmTzWJrdKW2wlc=
Date: Sun, 13 Apr 2025 09:51:29 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: alexjlzheng@gmail.com
Cc: alexjlzheng@tencent.com, linux-kernel@vger.kernel.org, tj@kernel.org
Subject: Re: [PATCH kernfs 1/3] kernfs: switch global kernfs_idr_lock to
 per-fs lock
Message-ID: <2025041318-unnatural-caucasian-48d2@gregkh>
References: <2025041256-sanction-sandal-7f51@gregkh>
 <20250412115054.25580-1-alexjlzheng@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250412115054.25580-1-alexjlzheng@tencent.com>

On Sat, Apr 12, 2025 at 07:50:54PM +0800, alexjlzheng@gmail.com wrote:
> On Sat, 12 Apr 2025 08:12:22 +0200, gregkh@linuxfoundation.org wrote:
> > On Sat, Apr 13, 2025 at 02:31:07AM +0800, alexjlzheng@gmail.com wrote:
> > > From: Jinliang Zheng <alexjlzheng@tencent.com>
> > > 
> > > The kernfs implementation has big lock granularity(kernfs_idr_lock) so
> > > every kernfs-based(e.g., sysfs, cgroup) fs are able to compete the lock.
> > > 
> > > This patch switches the global kernfs_idr_lock to per-fs lock, which
> > > put the spinlock into kernfs_root.
> > > 
> > > Signed-off-by: Jinliang Zheng <alexjlzheng@tencent.com>
> > > ---
> > >  fs/kernfs/dir.c             | 14 +++++++-------
> > >  fs/kernfs/kernfs-internal.h |  1 +
> > >  2 files changed, 8 insertions(+), 7 deletions(-)
> > 
> > What kind of testing / benchmark did you do for this series that shows
> > that this works, AND that this actually is measureable?  What workload
> > are you doing that causes these changes to be needed?
> 
> Thank you for your reply. :)
> 
> We are trying to implement a kernfs-based filesystem that will have
> multiple instances running at the same time, i.e., multiple kernfs_roots.

I don't think that kernfs is meant for that very well, what is that
filesystem going to be for?

> While investigating the kernfs implementation, we found some global locks
> that would cause noticeable lock contention when there are many filesystem
> instances.
> 
> Fortunately, we found that some optimizations have been made in [1], which
> moved kernfs_rwsem into kernfs_root. But there are still some global locks
> left.
> 
> We think it is also necessary to switch the remaining global locks to
> per-fs. Moreover, we strongly agree with Tejun Heo's point in [1]:
> 
>   "... this is the right thing to do even if there is no concrete
>    performance argument (not saying there isn't). It's just weird to
>    entangle these completely unrelated users in a single rwsem."
> 
> We think kernfs will be widely used to build other filesystems, so we
> strongly recommend switching global locks to per-fs.

I don't strongly object, but I would like to see some real-world numbers first.

thanks,

greg k-h
