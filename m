Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15390258A;
	Mon, 26 May 2025 08:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248981; cv=none; b=oA0QjtKtu+wJRSkqy3cil+HTXFOuXHWQsDlncBMWDGhatuQBy/5FsQRaqVnVKWRWcvMhfDBAVkfooyLfx6fZfvQCn5Ss4P+ninm1BOSVjLoxRC8INXmad5X2+LEce9PLs/DSHitnGsub8mM6LbykG+SQhckO/Tt45HiznZEhJLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248981; c=relaxed/simple;
	bh=FcJdfFFxShk3YZXuaYCNmm4+hYbTjiztce8ew17pr90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sIFaYiit3ttKeLfKVuiOBG1yYwCTTlPFdM6gRUyGeg/w25us3Q5jZN6cKGkalja5BPVZdxQmZZZ8MgrgG4qg8r2H3bmoos7EktNM0O3shnGlhCo5Emox37kP/b/sqejN+7vvbjU2Nw7QB3VywzR7WXqbnAPH0eRVC0kAeYQ+MPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnbFa4cH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnbFa4cH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B754C4CEE7;
	Mon, 26 May 2025 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748248980;
	bh=FcJdfFFxShk3YZXuaYCNmm4+hYbTjiztce8ew17pr90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lnbFa4cHSvgK+Qehdz8hCiwz9B6ysGp++OYKv4ATNTws0oMYDe9I5jDgXFUhM9XVQ
	 o8n5XlWze2x4AcdsZIqvrWTZ3Lr8hAPD8f8OGpWQl10XkYeWPwoYIeKBgf1vAPu3Gp
	 SUG42rl3nLDP6CKx2cKGI1RndqSOTCtLfN+V2e8K0qLo3WeQwbMpaXjGRHpMsQ0zLq
	 u2ykFu1MdWX/Zb2PxKGKeThre48Fi+312JSB7zK0d3Kq5PxkhPnz2eg1wIt/XzDN4e
	 /ATyfW7f359XDMhWa8HOY6niQN+kszbFjuPIopg7Sf7SMtYoPE6lp0rhlFJGiRgEl0
	 JhT0KRH5DKQcQ==
Date: Mon, 26 May 2025 11:42:38 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com,
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com,
	corbet@lwn.net, rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com,
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org,
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr,
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com,
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com,
	vincent.guittot@linaro.org, hannes@cmpxchg.org,
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
Message-ID: <aDQpfiykuRrk_xnr@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-11-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:14PM +0000, Pasha Tatashin wrote:
> Introduce the user-space interface for the Live Update Orchestrator
> via ioctl commands, enabling external control over the live update
> process and management of preserved resources.
> 
> Create a misc character device at /dev/liveupdate. Access
> to this device requires the CAP_SYS_ADMIN capability.
> 
> A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> structures. The magic number is registered in
> Documentation/userspace-api/ioctl/ioctl-number.rst.
> 
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
 
...

> -/**
> - * enum liveupdate_state - Defines the possible states of the live update
> - * orchestrator.
> - * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in progress.
> - * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboot; the
> - *                                   LIVEUPDATE_PREPARE callbacks have completed
> - *                                   successfully.
> - *                                   Devices might operate in a limited state
> - *                                   for example the participating devices might
> - *                                   not be allowed to unbind, and also the
> - *                                   setting up of new DMA mappings might be
> - *                                   disabled in this state.
> - * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
> - *                                   (%LIVEUPDATE_FREEZE) has been sent, and the
> - *                                   system is performing its final state saving
> - *                                   within the "blackout window". User
> - *                                   workloads must be suspended. The actual
> - *                                   reboot (kexec) into the next kernel is
> - *                                   imminent.
> - * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the next
> - *                                   kernel via live update the system is now
> - *                                   running the next kernel, awaiting the
> - *                                   finish event.
> - *
> - * These states track the progress and outcome of a live update operation.
> - */
> -enum liveupdate_state  {
> -	LIVEUPDATE_STATE_NORMAL = 0,
> -	LIVEUPDATE_STATE_PREPARED = 1,
> -	LIVEUPDATE_STATE_FROZEN = 2,
> -	LIVEUPDATE_STATE_UPDATED = 3,
> -};
> -

Nit: this seems an unnecessary churn, these definitions can go to
include/uapi from the start.

> diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
> +/**
> + * struct liveupdate_fd - Holds parameters for preserving and restoring file
> + * descriptors across live update.
> + * @fd:    Input for %LIVEUPDATE_IOCTL_FD_PRESERVE: The user-space file
> + *         descriptor to be preserved.
> + *         Output for %LIVEUPDATE_IOCTL_FD_RESTORE: The new file descriptor
> + *         representing the fully restored kernel resource.
> + * @flags: Unused, reserved for future expansion, must be set to 0.
> + * @token: Output for %LIVEUPDATE_IOCTL_FD_PRESERVE: An opaque, unique token
> + *         generated by the kernel representing the successfully preserved
> + *         resource state.
> + *         Input for %LIVEUPDATE_IOCTL_FD_RESTORE: The token previously
> + *         returned by the preserve ioctl for the resource to be restored.
> + *
> + * This structure is used as the argument for the %LIVEUPDATE_IOCTL_FD_PRESERVE
> + * and %LIVEUPDATE_IOCTL_FD_RESTORE ioctls. These ioctls allow specific types
> + * of file descriptors (for example memfd, kvm, iommufd, and VFIO) to have their
> + * underlying kernel state preserved across a live update cycle.
> + *
> + * To preserve an FD, user space passes this struct to
> + * %LIVEUPDATE_IOCTL_FD_PRESERVE with the @fd field set. On success, the
> + * kernel populates the @token field.
> + *
> + * After the live update transition, user space passes the struct populated with
> + * the *same* @token to %LIVEUPDATE_IOCTL_FD_RESTORE. The kernel uses the @token
> + * to find the preserved state and, on success, populates the @fd field with a
> + * new file descriptor referring to the fully restored resource.
> + */
> +struct liveupdate_fd {
> +	int		fd;
> +	__u32		flags;
> +	__u64		token;
> +};

Consider using __aligned_u64 here for size-based versioning.

> +
> +/* The ioctl type, documented in ioctl-number.rst */
> +#define LIVEUPDATE_IOCTL_TYPE		0xBA

...

> +/**
> + * LIVEUPDATE_IOCTL_EVENT_PREPARE - Initiate preparation phase and trigger state
> + * saving.

This (and others below) is more a command than an event IMHO. Maybe just
LIVEUPDATE_IOCTL_PREPARE?

> + * Argument: None.
> + *
> + * Initiates the live update preparation phase. This action corresponds to
> + * the internal %LIVEUPDATE_PREPARE kernel event and can also be triggered

This action is a reason for LIVEUPDATE_PREPARE event, isn't it?
The same applies to other IOCTL_EVENTS

> + * by writing '1' to ``/sys/kernel/liveupdate/prepare``. This typically
> + * triggers the main state saving process for items marked via the PRESERVE
> + * ioctls. This occurs *before* the main "blackout window", while user
> + * applications (e.g., VMs) may still be running. Kernel subsystems
> + * receiving the %LIVEUPDATE_PREPARE event should serialize necessary state.
> + * This command does not transfer data.

I'm not sure I follow what this sentence means.

-- 
Sincerely yours,
Mike.
