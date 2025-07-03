Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD37F29A30E;
	Thu,  3 Jul 2025 07:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751528925; cv=none; b=Rz6C4HF5zXWvpAl41YUQttki+pLDOZoNwq/xZ78b8eC7+7isd1vlpxdK4NSp7WBUZUwXrNy6wAYPtuR/VmqMpgyGZXy5XIs575uxa6qsbbqaInYNqIpn+TrBHeK6C87NgCKwTwN6WI/BOOD2IYkGmHQd4N4hsiR7tpH0fHMe10U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751528925; c=relaxed/simple;
	bh=k9s86Bitakb5EWdaksTRK4OU/QCAaLRPUqXqxzF3t2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wy3J1bPIkzGePKoXhlLB/aE7UNvm3jM9V2UXRko5MYK+Mi/3EYjmyTyNgHuLKfoyzZ9Cv5QeEVVr0quaaE3b6ogrNrYYzpG3CTajcebMK0G27gfwJmT7lGa8Wb5+smbFNk+DyE6P8ZFvIS+h6Wt59KHIu50zOaNiuBxYRSL4IPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GR1OQnx2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GR1OQnx2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10A8C4CEEB;
	Thu,  3 Jul 2025 07:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751528925;
	bh=k9s86Bitakb5EWdaksTRK4OU/QCAaLRPUqXqxzF3t2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GR1OQnx2TADAvu1cP1RgCcyQYr9CIATXKHJ4viMQMTKoRWFrPbCpfWONyvBV8BbQ/
	 rPtFqUAVuGb+GRAwBTnqt79RdfxNdRm/tsDcj4QlOoUnhgozaTRmrBAAio8cG5BAYq
	 FWtZBdSlXdxhM2v/BdjrWPRKWE4zwmeTfF8yDb6A=
Date: Thu, 3 Jul 2025 09:48:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Lin Ma <linma@zju.edu.cn>
Cc: wkang77@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v1 1/2] staging: gdm724x: fix type confusion in
 gdm_lte_event_rcv()
Message-ID: <2025070359-remold-aneurism-c0ac@gregkh>
References: <20250703052723.14616-1-linma@zju.edu.cn>
 <2025070343-halves-prison-c40f@gregkh>
 <97e5af3.9183.197cefa02cc.Coremail.linma@zju.edu.cn>
 <2025070355-uncommon-handlebar-c6f3@gregkh>
 <7792df9a.9245.197cf193a6a.Coremail.linma@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7792df9a.9245.197cf193a6a.Coremail.linma@zju.edu.cn>

On Thu, Jul 03, 2025 at 03:03:46PM +0800, Lin Ma wrote:
> Hello Greg,
> 
> > > ```
> > > 
> > > - by `dev->type`. See ax25_device_event()
> > > ```
> > > static int ax25_device_event(struct notifier_block *this, unsigned long event,
> > >                  void *ptr)
> > > {
> > >     struct net_device *dev = netdev_notifier_info_to_dev(ptr);
> > > 
> > >     ......
> > > 
> > >     /* Reject non AX.25 devices */
> > >     if (dev->type != ARPHRD_AX25)
> > >         return NOTIFY_DONE;
> > > ```
> > 
> > 
> > Those are core functions that all drivers are using, and the "type" of
> > device is also ok to look at.  You are trying to compare a specific
> > callback in this change, which feels wrong to me.
> 
> Got it. I will try to prepare another version.
> 
> > 
> > Wait, what tree are you making this change against?  I don't even see
> > the file you are trying to patch in the latest tree, are you sure it's
> > not just deleted already?
> > 
> > ...
> > 
> > Again, make sure this file is still present in the tree before going
> > further :)
> > 
> > thanks,
> > 
> > greg k-h
> 
> Yes, you are right, just like how I pointed out in the patch:
> 
> """
> This bug was "fixed" in upstream kernel by the commit 1c2d364e7f7f
> ("staging: gdm724x: Remove unused driver"). However, other stable
> versions still contain it. Fix the confusion bug by adding checks.
> """
> 
> That is, together with another identified bug, has already been deleted the
> latest upstream kernel. (see https://lore.kernel.org/lkml/20250703052837.15458-1-linma@zju.edu.cn/T/#u)

That email was not threaded, and also not obvious what was going on, so
I long deleted it from my review queue.

> I sent this patch just because the stable version, like 5.15.186, still
> contains it. T.T

Ah, that was not obvious at all.  Remember, some of us get thousands of
emails a day to review, please make things that you are submitting for
non-mainline kernels very very very obvious as to what is going on.

> Therefore, shall I proceed with the patches? Or maybe the stable tree
> could also delete that vulnerable code?

For a staging driver, it's not an issue, don't worry about it, no distro
should be using it anyway as no one has the hardware :)

thanks,

greg k-h
