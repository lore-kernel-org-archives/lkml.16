Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E17920B7F9;
	Wed, 14 May 2025 07:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747207892; cv=none; b=SuZnb8KYRMjJi4uXvlV68Y/6YBKWMHpCSXbadXjMTChQdzwgTk7OCGrzSjRFqwAnL92sivHjZpCN/Oe9XG68pt+V12/yq/njyKHJfJOF48atMeYQ62ZJ4VysftxIC+fQzrJpRzussjZ9AZlO5wbX1IAnUl6QzaTCoW0qfXOU2tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747207892; c=relaxed/simple;
	bh=grntEt+7iBQCbJ+Tq8yJeFtGJyPGVZ5WX+xfwB8NxNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pho2srTkAo9JerPQ5zjwzKXVdz3jh3ONCkZ6aO9zEjD7vBTp+5GKD08coqSvdIJ9Rs0SiAFmZbTviV6y5cTko4Kv9Au4DFZzY93odCt4CrPKgVD56pk/tso8BpeqeFepWpPzEIHdMxw2OzNGprb28aCKpwdHqsdTU4uH9eaehfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mgYnKvoc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mgYnKvoc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF30C4CEF0;
	Wed, 14 May 2025 07:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1747207891;
	bh=grntEt+7iBQCbJ+Tq8yJeFtGJyPGVZ5WX+xfwB8NxNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mgYnKvoc1rVMrGaa3ebTPFdoW/5VS3akc3E3mOlOeYBl5nj7NPa7yupsuBwomwDD8
	 4o7MK+ooT/WUCAFpM2elAlTeN8xm80yAjTb5EKm6Cn6gHDQQ7/fUb/k7rKS0yTETB/
	 jeQvl0YnB1iFUPeDC2aR5oe/CMTd7ubLa2txYkQo=
Date: Wed, 14 May 2025 09:29:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, oneukum@suse.com, stern@rowland.harvard.edu,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <2025051405-glare-crazily-a9fa@gregkh>
References: <20250513113817.11962-1-00107082@163.com>
 <20250514064455.5488-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514064455.5488-1-00107082@163.com>

On Wed, May 14, 2025 at 02:44:55PM +0800, David Wang wrote:
> Hi, 
> 
> Update memory footprints after hours of USB devices usage
> on my system:
> (I have webcam/mic/keyboard/mouse/harddisk connected via USB,
> a full picture of memory footprints is attached below)
> +----------------------+----------------+-------------------------------------------+-----------------------+
> | active memory(bytes) | active objects |               alloc location              | total objects created |
> +----------------------+----------------+-------------------------------------------+-----------------------+
> |        22912         |       24       | core/urb.c:1054:urb_hcpriv_mempool_zalloc |         10523         |
> |        11776         |       31       |        core/urb.c:76:usb_alloc_urb        |         11027         |
> +----------------------+----------------+-------------------------------------------+-----------------------+
> 
> The count for active URB objects remain at low level,
> its peak is about 12KB when I copied 10G file to my harddisk.
> The memory pool in this patch takes about 22KB, its peak is 23KB.
> The patch meant to reuse memory via a mempool, the memory kept in pool is indeed
> the "tradeoff" when the system is idle. (Well, we are talking about mempool anyway.)
> How balance the tradeoff is depends on how well the mempool is managed.
> This patch takes a easy approach: put faith in URB objects management and put
> a single slot of mempool in URB on demands. And the changes, by counting lines
> in this patch, are very simple.
> Base on the profiling, the number of active URB objects are kept at a very low scale,
> only several could have a very long lifecycle.
> I think URB is a good candidate for caching those memory needed for private data.
> But I could be very wrong, due simply to the lack of knowledge.
> 
> And before, without the patch, a 10 minutes webcam usage and copying 10G file to harddisk
> would yield high rate of memory allocation for priviate data in xhci_urb_enqueue:
> +----------------------+----------------+-----------------------------------+-----------------------+
> | active memory(bytes) | active objects |           alloc location          | total objects created |
> +----------------------+----------------+-----------------------------------+-----------------------+
> |        22784         |       23       | host/xhci.c:1555:xhci_urb_enqueue |         894281 << grow|ing very quick
> |        10880         |       31       |    core/urb.c:75:usb_alloc_urb    |          4028         |
> +----------------------+----------------+-----------------------------------+-----------------------+
> I observe a highest allocation rate of 1.5K/s in xhci_urb_enqueue
> when I was copying 10G file, and had my webcam opened at the same time.
> 
> And again, to be honest, I did not observe any observable performance improvement from
> an enduser's point of view with this patch. The only significant improvement is memory footprint
> _numbers_.
> I guess memory allocation is indeed "_really damn fast_", but I still have the mindset of
> "the less allocation the better".

No, this isn't necessarily true at all.  Allocations are fast, and if we
free/allocate things quickly, it's even faster.  USB is limited by the
hardware throughput, which is _very_ slow compared to memory accesses of
the allocator.

So unless you can show that we are using less CPU time, or something
else "real" that is measurable in a real way in userspace, that would
justify the extra complexity, it's going to be hard to get me to agree
that this is something that needs to be addressed at all.

Also, I'm totally confused as to what the "latest" version of this
patchset is...

thanks,

greg k-h
