Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AF922F152
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 12:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609427; cv=none; b=gneO4GDdkKZCDOIPEq0U+HPmxfHHwrxbr9HUTfH6aFyt6jXiiMqpmFAI/MdJa1Oyh4V1D8x/fy7pvTVPut+nw+uAu/aW4V3tuUHk7RbTwdZPdQeOT8NyXrPITm/5lNKIuovaYWXo8hm4xx8AQ/TTLNMFqpBbiMkg/S3NbmureuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609427; c=relaxed/simple;
	bh=gk8BiJoSOlM3EqZ6vwCloN3a2SIIrJpadfrjVem2k44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RRqr+opiGIwRgfH8a+JZpA9+K9EUKDsYxA9GF9TBW6vNVda50fm8BzTQ+GsADcZTxR1fswk2IUI1cVUEKHfPJqdihGf0M0k8HbCoykKsG1id4xT4qQeBaJYl76W1p/dSSvmBjvRaUYPxrKKpodQAzKmQsCfj+YXHoZd8QEU0nNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qIymp3Lj; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qIymp3Lj"
Date: Fri, 30 May 2025 20:50:08 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748609412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=km2hEb2lbFSiszO5Mv9A3LDpKYpU+31AAVM6oBaOIfc=;
	b=qIymp3LjJaxvfeMmlUqtvh+Ks6XOvtd7Ldxb7h7rWNPAp8jFUFs+KNcDyyuDGIMdFFC8wr
	al2g6TJs8zO1bszqhsws/1tImhCLGlHj5MlCp6ijbJGlqyhxFVmwpfJUXUkcLrHws4LcYX
	ZGQlPBZl54DKqDnwu16vbT1ZIQ6jLjo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Dawei Li <dawei.li@linux.dev>
To: Beleswar Prasad Padhi <b-padhi@ti.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	set_pte_at@outlook.com, dawei.li@linux.dev
Subject: Re: [PATCH v3 3/3] rpmsg: ctrl: Introduce RPMSG_CREATE_EPT_FD_IOCTL
 uAPI
Message-ID: <20250530125008.GA5355@wendao-VirtualBox>
References: <20250519150823.62350-1-dawei.li@linux.dev>
 <20250519150823.62350-4-dawei.li@linux.dev>
 <7e983702-6662-465d-86ac-d515849d731d@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e983702-6662-465d-86ac-d515849d731d@ti.com>
X-Migadu-Flow: FLOW_OUT

HI Beleswar,

Thanks for reviewing.

On Fri, May 30, 2025 at 03:15:28PM +0530, Beleswar Prasad Padhi wrote:
> Hi Dawei,
> 
> On 19/05/25 20:38, Dawei Li wrote:
> > Implement RPMSG_CREATE_EPT_FD_IOCTL, new uAPI for rpmsg ctrl, which
> > shares most of operations of RPMSG_CREATE_EPT_IOCTL except that it
> > returns fd representing eptdev to userspace directly.
> >
> > Possible calling procedures for userspace are:
> > - fd = open("/dev/rpmsg_ctrlX")
> > - ioctl(fd, RPMSG_CREATE_EPT_FD_IOCTL, &info);
> > - fd_ep = info.fd
> 
> 
> We are returning a new fd to userspace from inside an IOCTL itself. Is this a
> standard way of doing things in Kernel space? (see below related comment)

Yes, anon_get_{fd,file} are used extensively in kernel for returning a new
fd to userspace which is associated with an unique data structure in kernel
space, in different ways:

- via ioctl(), some examples are:

 - KVM ioctl(s)
   - KVM_CREATE_VCPU -> kvm_vm_ioctl_create_vcpu
   - KVM_GET_STATS_FD -> kvm_vcpu_ioctl_get_stats_fd
   - KVM_CREATE_DEVICE -> kvm_ioctl_create_device
   - KVM_CREATE_VM -> kvm_dev_ioctl_create_vm 

 - DMA buf/fence/sync ioctls
   - DMA_BUF_IOCTL_EXPORT_SYNC_FILE -> dma_buf_export_sync_file
   - SW_SYNC_IOC_CREATE_FENCE -> sw_sync_ioctl_create_fence
   - Couples of driver implement DMA buf by using anon file _implicitly_:
     - UDMABUF_CREATE -> udmabuf_ioctl_create
     - DMA_HEAP_IOCTL_ALLOC -> dma_heap_ioctl_allocate

 - gpiolib ioctls:
   - GPIO_GET_LINEHANDLE_IOCTL -> linehandle_create
   - GPIO_V2_GET_LINE_IOCTL

 -  IOMMUFD ioctls:

 -  VFIO Ioctls:

 - ....


- via other specific syscalls:
 - epoll_create1
 - bpf 
 - perf_event_open
 - inotify_init
 - ...

> 
> > - operations on fd_ep(write, read, poll ioctl)
> > - ioctl(fd_ep, RPMSG_DESTROY_EPT_IOCTL)
> > - close(fd_ep)
> 
> 
> Can we rely on the userspace to close() the fd_ep? (if not done, could be a
> memory leak..).. Opposed to fd, which we can rely on the userspace to
> close() since they initiated the open() call. I am just trying to understand if
> this is a standard way of doing things...

Good question.

When userland gets a fd from kernel, it's userland's duty to manage and release
the resource when it's done with it, because kernel never knows when the fd and
its resourcen are not needed by userland except process is on exiting. The fact
remains true no matter how fd is generated from kernel:
- open()
- ioctl()
- Other syscalls(epoll_create1, e.g, as listed above)

As a result, kernel & driver provide fops->release() to achieve resource
release when fd is not needed for userland, some callers of it maybe:
- Userland call close() explicitly
- Kernel does the dirty job when user process exits(if some fds are
  still opened):
  - Userland call exit() explicitly.
  - User process was killed by some signals.

Maybe some comments/docs are needed in uAPI?

> 
> > - close(fd)
> >

[snip]

> > +
> > +	if (cmd == RPMSG_CREATE_EPT_IOCTL || cmd == RPMSG_CREATE_DEV_IOCTL ||
> > +	    cmd == RPMSG_RELEASE_DEV_IOCTL) {
> > +		if (copy_from_user(&eptinfo, argp, sizeof(eptinfo)))
> > +			return -EFAULT;
> > +
> > +		memcpy(chinfo.name, eptinfo.name, RPMSG_NAME_SIZE);
> > +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> > +		chinfo.src = eptinfo.src;
> > +		chinfo.dst = eptinfo.dst;
> > +	} else if (cmd == RPMSG_CREATE_EPT_FD_IOCTL) {
> 
> 
> Maybe we can put this 'else if condition' in the first 'if' and treat other
> conditions under 'else', as 'RPMSG_CREATE_EPT_FD_IOCTL' is the only
> ioctl with a different struct type.

Good point! I will try to address it in next respin.

> 
> Thanks,
> Beleswar
> 
> > +		if (copy_from_user(&ept_fd_info, argp, sizeof(ept_fd_info)))
> > +			return -EFAULT;
> > +
> > +		memcpy(chinfo.name, ept_fd_info.name, RPMSG_NAME_SIZE);
> > +		chinfo.name[RPMSG_NAME_SIZE - 1] = '\0';
> > +		chinfo.src = ept_fd_info.src;
> > +		chinfo.dst = ept_fd_info.dst;
> > +	}
> >  

[snip]

Thanks,

	Dawei
