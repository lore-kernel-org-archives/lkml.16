Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB04329E11F;
	Wed, 25 Jun 2025 09:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750844216; cv=none; b=dJMtEyXraHT/ixa9dxomjJDqVit/EF1uThViwwowF878YHbuoTXIvGoktmhde0E5s2uVe/NpZnyk9/tpiynitKhekNIAIsi5J6PKnwzDYQfMHrL6rTga2lU+oZjdkeKVtZd1of6xTynOdCJ0tAvQp+5xNsrYEAMp6sRIKhtDv+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750844216; c=relaxed/simple;
	bh=LrBJpzLZVKD/XyYH7qiSh64rD3KiYAMp2WwFDXgbxuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OdJwNs+jNpHI4BpMPfRTJA0okDho9VS6cgwMy/bMbdQ1t14vgyyLXXuWiXIVdJyhu/Ba3vmA9vI5LQfTtsbcIU5gBDVMc7ZLbvNU8q7jrgOcjWwDsso+GXMu4osPP8wYzSKsZwoe2yZgt1kk7JHDDqwURvLgektA3bRxYmP6RhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7luPxmv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7luPxmv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6093C4CEEA;
	Wed, 25 Jun 2025 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750844215;
	bh=LrBJpzLZVKD/XyYH7qiSh64rD3KiYAMp2WwFDXgbxuA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u7luPxmvAG9P9gnxLi1A3yj+TGZe9hymhackeGESDMt8cglDHW8K030A7/lXrC7BA
	 ZqqzyA2UeYCa5rWcnQb5uOQvXpCMOuqKPCskFiSHeJeowZQigNSnXsbAdfY18oIbzO
	 I+J752qUcO9IMpx2HRaR3j/9E1xSXo4YTLztGaono20osr3OCGfdvCdyAHdd06Gvn5
	 iQrQiI44bszW+2AssC6Z5/dNmyWOj5L2gRCNZwPLTjJ8+g7wEHxRcoV61QNMskB2QJ
	 jyII/W1OJp+b6cPS2eepOQNhh/sOnJ/0nKsdkvCkZ4gpKQ7E9XZtS4oMbHMb3VHUmC
	 +AvrUrt2Ocaxg==
Date: Wed, 25 Jun 2025 11:36:40 +0200
From: Christian Brauner <brauner@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, bhelgaas@google.com, 
	wagi@kernel.org, djeffery@redhat.com, stuart.w.hayes@gmail.com, ptyadav@amazon.de
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
Message-ID: <20250625-akrobatisch-libellen-352997eb08ef@brauner>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
 <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>

> > I'm not sure why people are so in love with character device based apis.
> > It's terrible. It glues everything to devtmpfs which isn't namespacable
> > in any way. It's terrible to delegate and extremely restrictive in terms
> > of extensiblity if you need additional device entries (aka the loop
> > driver folly).
> >
> > One stupid question: I probably have asked this before and just swapped
> > out that I a) asked this already and b) received an explanation. But why
> > isn't this a singleton simple in-memory filesystem with a flat
> > hierarchy?
> 
> Hi Christian,
> 
> Thank you for the detailed feedback and for raising this important

I don't know about detailed but no problem.

> design question. I appreciate the points you've made about the
> benefits of a filesystem-based API.
> 
> I have thought thoroughly about this and explored various alternatives
> before settling on the ioctl-based interface. This design isn't a
> sudden decision but is based on ongoing conversations that have been
> happening for over two years at LPC, as well as incorporating direct
> feedback I received on LUOv1 at LSF/MM.

Well, Mike mentioned that ultimately you want to interface this with
systemd? And we certainly have never been privy to any of these
uapi design conversations. Which is usually not a good sign...

> 
> The choice for an ioctl-based character device was ultimately driven
> by the specific lifecycle and dependency management requirements of
> the live update process. While a filesystem API offers great
> advantages in visibility and hierarchy, filesystems are not typically
> designed to be state machines with the complex lifecycle, dependency,
> and ownership tracking that LUO needs to manage.
> 
> Let me elaborate on the key aspects that led to the current design:
> 
> 1. session based lifecycle management: The preservation of an FD is
> tied to the open instance of /dev/liveupdate. If a userspace agent
> opens /dev/liveupdate, registers several FDs for preservation, and
> then crashes or exits before the prepare phase is triggered, all FDs
> it registered are automatically unregistered. This "session-scoped"
> behavior is crucial to prevent leaking preserved resources into the
> next kernel if the controlling process fails. This is naturally
> handled by the open() and release() file operations on a character
> device. It's not immediately obvious how a similar automatic,
> session-based cleanup would be implemented with a singleton
> filesystem.

fwiw

fd_context = fsopen("kexecfs")
fd_context = fsconfig(FSCONFIG_CMD_CREATE, ...)
fd_mnt = fsmount(fd_context, ...)

This gets you a private kexecfs instances that's never visible anywhere
in the filesystem hierarchy. When the fd is closed everything gets auto
cleaned up by the kernel. No need to umount or anything.

> 2. state machine: LUO is fundamentally a state machine (NORMAL ->
> PREPARED -> FROZEN -> UPDATED -> NORMAL). As part of this, it provides
> a crucial guarantee: any resource that was successfully preserved but
> not explicitly reclaimed by userspace in the new kernel by the time
> the FINISH event is triggered will be automatically cleaned up and its
> memory released. This prevents leaks of unreclaimed resources and is
> managed by the orchestrator, which is a concept that doesn't map
> cleanly onto standard VFS semantics.

I'm not following this. See above. And also any umount can trivially
just destroy whatever resource is still left in the filesystem.

> 
> 3. dependency tracking: Unlike normal files, preserved resources for
> live update have strong, often complex interdependencies. For example,
> a kvmfd might depend on a guestmemfd; an iommufd can depend on vfiofd,
> eventfd, memfd, and kvmfd. LUO's current design provides explicit
> callback points (prepare, freeze) where these dependencies can be
> validated and tracked by the participating subsystems. If a dependency
> is not met when we are about to freeze, we can fail the entire
> operation and return an error to userspace. The cancel callback
> further allows this complex dependency graph to be unwound safely. A
> filesystem interface based on linkat() or unlink() doesn't inherently
> provide these critical, ordered points for dependency verification and
> rollback.
> 
> While I agree that a filesystem offers superior introspection and
> integration with standard tools, building this complex, stateful
> orchestration logic on top of VFS seemed to be forcing a square peg
> into a round hole. The ioctl interface, while more opaque, provides a
> direct and explicit way to command the state machine and manage these
> complex lifecycle and dependency rules.

I'm not going to argue that you have to switch to this kexecfs idea
but...

You're using a character device that's tied to devmptfs. In other words,
you're already using a filesystem interface. Literally the whole code
here is built on top of filesystem APIs. So this argument is just very
wrong imho. If you can built it on top of a character device using VFS
interfaces you can do it as a minimal filesystem.

You're free to define the filesystem interface any way you like it. We
have a ton of examples there. All your ioctls would just be tied to the
fileystem instance instead of the /dev/somethingsomething character
device. The state machine could just be implemented the same way.

One of my points is that with an fs interface you can have easy state
seralization on a per-service level. IOW, you have a bunch of virtual
machines running as services or some networking services or whatever.
You could just bind-mount an instance of kexecfs into the service and
the service can persist state into the instance and easily recover it
after kexec.

But anyway, you seem to be set on the ioctl() interface, fine.
