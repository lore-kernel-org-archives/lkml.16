Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E152E23CB;
	Sun,  6 Jul 2025 14:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751811885; cv=none; b=PzTanj2frZ+tVoVrdLbhNIW53v6l5W204Ul3D/5wi6l8CXJg5nX7+V6WSEe8fHvzPpUKvt4ileUuDQPUdsIWhUjde2vSUhfo1EYnDkx+IoZ/gIWkEE6UD5X0MO9Fj35B6bvtZNxG/Roh2hEcQcpDVgdPqWyLYUuNCBW3SPORcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751811885; c=relaxed/simple;
	bh=8EiPuAexIkAYxOcKfap4/XV/a6nUkUFc1HdHwQaBiTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC37C3dvhTk1S+mY+TGJPec8quLQSvqZ9QkRNa7ooLKBAJtMoP9dWFOHjPujg6ayysYJGP76BFNg9lfKm52sMSx/K3ZzIQ76lszUODLDoBMQyRkomf4aytPLZXdc7QlE/sCSeECio07yftUPTxA5VxJ1qA+HEI23v/CkO1Mi/L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VB9VGt/8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VB9VGt/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20F90C4CEED;
	Sun,  6 Jul 2025 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751811884;
	bh=8EiPuAexIkAYxOcKfap4/XV/a6nUkUFc1HdHwQaBiTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VB9VGt/8+MSogNJP5j7QmiGc/jfaGRHsqlzpLpQpLJO6KnxsKLmVp2127TbXYTXRp
	 GhHRXvpLpJnCJqEvqoKZ4vm/EJK8Ug7MrwmDLyrK7XbglSPXNTGARAs/wjyzwYy9P4
	 kMPvU2wXRd//0XBcqHCYDnESxmUbNiIG8sWEkks0pnfKcqj54LDLXLYzvMiDxGw226
	 lwsoWu/QaOi0PD0nnlbtbh1TP6Nh3T/h2NVveuw/4zSblE5o0HgbqVvxyE4y4PLuWE
	 Qz6vzsqVg1LLJv2zRjel/GAxQ4MvGedbnAp+yZCk9VQbTdIYG7YoyPlAKzRkLQeayP
	 sWxO9iXbSi+lg==
Date: Sun, 6 Jul 2025 17:24:22 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, pratyush@kernel.org,
	jasonmiu@google.com, graf@amazon.com, changyuanl@google.com,
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
Message-ID: <aGqHFkPWOrD6whv6@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
 <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>

On Tue, Jun 24, 2025 at 11:50:49AM +0200, Christian Brauner wrote:
> On Thu, May 15, 2025 at 06:23:14PM +0000, Pasha Tatashin wrote:
> > Introduce the user-space interface for the Live Update Orchestrator
> > via ioctl commands, enabling external control over the live update
> > process and management of preserved resources.
> > 
> > Create a misc character device at /dev/liveupdate. Access
> > to this device requires the CAP_SYS_ADMIN capability.
> > 
> > A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> > structures. The magic number is registered in
> > Documentation/userspace-api/ioctl/ioctl-number.rst.
> > 
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > ---
> >  .../userspace-api/ioctl/ioctl-number.rst      |   1 +
> >  drivers/misc/liveupdate/Makefile              |   1 +
> >  drivers/misc/liveupdate/luo_ioctl.c           | 199 ++++++++++++
> >  include/linux/liveupdate.h                    |  34 +-
> >  include/uapi/linux/liveupdate.h               | 300 ++++++++++++++++++
> >  5 files changed, 502 insertions(+), 33 deletions(-)
> >  create mode 100644 drivers/misc/liveupdate/luo_ioctl.c
> >  create mode 100644 include/uapi/linux/liveupdate.h

...

> > +static const struct file_operations fops = {
> > +	.owner          = THIS_MODULE,
> > +	.open           = luo_open,
> > +	.unlocked_ioctl = luo_ioctl,
> > +};
> > +
> > +static struct miscdevice liveupdate_miscdev = {
> > +	.minor = MISC_DYNAMIC_MINOR,
> > +	.name  = "liveupdate",
> > +	.fops  = &fops,
> > +};
> 
> I'm not sure why people are so in love with character device based apis.
> It's terrible. It glues everything to devtmpfs which isn't namespacable
> in any way. It's terrible to delegate and extremely restrictive in terms
> of extensiblity if you need additional device entries (aka the loop
> driver folly).
> 
> One stupid question: I probably have asked this before and just swapped
> out that I a) asked this already and b) received an explanation. But why
> isn't this a singleton simple in-memory filesystem with a flat
> hierarchy?
> 
> mount -t kexecfs kexecfs /kexecfs
> 
> So userspace mounts kexecfs (or the kernel does it automagically) and
> then to add fds into that thing you do the following:
> 
> linkat(fd_my_anon_inode_memfd, "", -EBADF, "kexecfs/my_serialized_memfd", AT_EMPTY_PATH)

Having an ability to link a file descriptor to kexecfs would have been
nice. We could even create a dependency hierarchy there, e.g.

mkdir -p kexecfs/vm1/kvm/{iommu,memfd}

linkat(kvmfd, "", -EBADF, "kexecfs/vm1/kvm/kvmfd", AT_EMPTY_PATH)
linkat(iommufd, "", -EBADF, "kexecfs/vm1/kvm/iommu/iommufd", AT_EMPTY_PATH)
linkat(memfd, "", -EBADF, "kexecfs/vm1/kvm/memfd/memfd", AT_EMPTY_PATH)

But unfortunately this won't work because VFS checks that new and old paths
are on the same mount. And even if cross-mount links were allowed, VFS does
not pass the file objects to link* APIs, so preserving a file backed by
anon_inode is another issue.

> which will serialize the fd_my_anon_inode_memfd. You can also do this
> with ioctls on the kexecfs filesystem of course.

ioctls seem to be the only option, but I agree they don't have to be bound
to a miscdev.

-- 
Sincerely yours,
Mike.
