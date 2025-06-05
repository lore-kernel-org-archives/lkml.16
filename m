Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC711AAA1C;
	Thu,  5 Jun 2025 16:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749140164; cv=none; b=bLpuvjsKcQYhHaGSznSZq9h2L+KpTmphMTiun8LyB0HxHlfyh9PGX3Dwp7lcaIvMubcSLEvwco8F/GgJngJx07wE1XOZM3TX9I1xcv4UMgBopsLfY7XFq3ZzeD3N1SbWxlTrred8UqlV04RlFUsI/13dc8s2migrK3Q7Lk+RlKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749140164; c=relaxed/simple;
	bh=hxdKP8d4Td5fDMuUGjhIbKeXVValvsUe9aIvDa7yldo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UzcXhQ1WwHj6EoyirpcvC7ZWw6yuWm+aLBv3igzDmmlh+3RZL2IxEM4DU/Qnt9I+zA2RYYr1MnEpdSZn+B3OGNijeH86xb7Zs7UAINcVmdvPpAlTsArpycmgyk8TElbNZZ+1ZR2Cqu/U/ZnnXdbL3YPFAsuabLQTVTHNgwziMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGsUGSTp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGsUGSTp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5009AC4CEEB;
	Thu,  5 Jun 2025 16:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749140164;
	bh=hxdKP8d4Td5fDMuUGjhIbKeXVValvsUe9aIvDa7yldo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=eGsUGSTpiafmq9qnZYc96i2HdB9tbJh72SG2LEaAEeiTSCxTh5JP7m1nmTfJhIzoN
	 k2F4H8JjyFAU1a1yWcutcru1dWpCbuVBbvKFaZXBo43f/yTiwjQXN1XRt7Y5y7lDFZ
	 yUDGShat0NmHZcVp4CRIZwzfqaOdOf1aAD+knhCJC4vqNfe5uEEMnE/lSxwjL2BNEU
	 oq2nCa4fRP++Y4ZXmIrpzvgk2IMUH5HHW4PWT6X8xTPMJvkF+azOwPb/zZmT9Balvv
	 K2AJfP7LvUtasObPCCPkUs3EvWssoVrw8MAQkuE6InWpZkJE9LVopRnE9pOYBIyvZr
	 OGeMNa/sinTAQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: pratyush@kernel.org,  jasonmiu@google.com,  graf@amazon.com,
  changyuanl@google.com,  rppt@kernel.org,  dmatlack@google.com,
  rientjes@google.com,  corbet@lwn.net,  rdunlap@infradead.org,
  ilpo.jarvinen@linux.intel.com,  kanie@linux.alibaba.com,
  ojeda@kernel.org,  aliceryhl@google.com,  masahiroy@kernel.org,
  akpm@linux-foundation.org,  tj@kernel.org,  yoann.congal@smile.fr,
  mmaurer@google.com,  roman.gushchin@linux.dev,  chenridong@huawei.com,
  axboe@kernel.dk,  mark.rutland@arm.com,  jannh@google.com,
  vincent.guittot@linaro.org,  hannes@cmpxchg.org,
  dan.j.williams@intel.com,  david@redhat.com,  joel.granados@kernel.org,
  rostedt@goodmis.org,  anna.schumaker@oracle.com,  song@kernel.org,
  zhangguopeng@kylinos.cn,  linux@weissschuh.net,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org,
  linux-mm@kvack.org,  gregkh@linuxfoundation.org,  tglx@linutronix.de,
  mingo@redhat.com,  bp@alien8.de,  dave.hansen@linux.intel.com,
  x86@kernel.org,  hpa@zytor.com,  rafael@kernel.org,  dakr@kernel.org,
  bartosz.golaszewski@linaro.org,  cw00.choi@samsung.com,
  myungjoo.ham@samsung.com,  yesanishhere@gmail.com,
  Jonathan.Cameron@huawei.com,  quic_zijuhu@quicinc.com,
  aleksander.lobakin@intel.com,  ira.weiny@intel.com,
  andriy.shevchenko@linux.intel.com,  leon@kernel.org,  lukas@wunner.de,
  bhelgaas@google.com,  wagi@kernel.org,  djeffery@redhat.com,
  stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
In-Reply-To: <20250515182322.117840-11-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-11-pasha.tatashin@soleen.com>
Date: Thu, 05 Jun 2025 18:15:55 +0200
Message-ID: <mafs0tt4urwp0.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

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
> ---
[...]
> +static int luo_ioctl_fd_preserve(struct liveupdate_fd *luo_fd)
> +{
> +	struct file *file;
> +	int ret;
> +
> +	file = fget(luo_fd->fd);
> +	if (!file) {
> +		pr_err("Bad file descriptor\n");
> +		return -EBADF;
> +	}
> +
> +	ret = luo_register_file(&luo_fd->token, file);
> +	if (ret)
> +		fput(file);
> +
> +	return ret;
> +}
> +
> +static int luo_ioctl_fd_unpreserve(u64 token)
> +{

This leaks the refcount on the file that preserve took. Perhaps
luo_unregister_file() should return the file it unregistered, so this
can do fput(file)?

> +	return luo_unregister_file(token);
> +}
> +
> +static int luo_ioctl_fd_restore(struct liveupdate_fd *luo_fd)
> +{
> +	struct file *file;
> +	int ret;
> +	int fd;
> +
> +	fd = get_unused_fd_flags(O_CLOEXEC);
> +	if (fd < 0) {
> +		pr_err("Failed to allocate new fd: %d\n", fd);
> +		return fd;
> +	}
> +
> +	ret = luo_retrieve_file(luo_fd->token, &file);
> +	if (ret < 0) {
> +		put_unused_fd(fd);
> +
> +		return ret;
> +	}
> +
> +	fd_install(fd, file);
> +	luo_fd->fd = fd;
> +
> +	return 0;
> +}
> +
> +static int luo_open(struct inode *inodep, struct file *filep)
> +{
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EACCES;
> +
> +	if (filep->f_flags & O_EXCL)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
> +{
> +	void __user *argp = (void __user *)arg;
> +	struct liveupdate_fd luo_fd;
> +	enum liveupdate_state state;
> +	int ret = 0;
> +	u64 token;
> +
> +	if (_IOC_TYPE(cmd) != LIVEUPDATE_IOCTL_TYPE)
> +		return -ENOTTY;
> +
> +	switch (cmd) {
> +	case LIVEUPDATE_IOCTL_GET_STATE:
> +		state = READ_ONCE(luo_state);
> +		if (copy_to_user(argp, &state, sizeof(luo_state)))
> +			ret = -EFAULT;
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_PREPARE:
> +		ret = luo_prepare();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_FREEZE:
> +		ret = luo_freeze();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_FINISH:
> +		ret = luo_finish();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_EVENT_CANCEL:
> +		ret = luo_cancel();
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_PRESERVE:
> +		if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_preserve(&luo_fd);
> +		if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> +			ret = -EFAULT;

luo_unregister_file() is needed here on error.

> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_UNPRESERVE:
> +		if (copy_from_user(&token, argp, sizeof(u64))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_unpreserve(token);
> +		break;
> +
> +	case LIVEUPDATE_IOCTL_FD_RESTORE:
> +		if (copy_from_user(&luo_fd, argp, sizeof(luo_fd))) {
> +			ret = -EFAULT;
> +			break;
> +		}
> +
> +		ret = luo_ioctl_fd_restore(&luo_fd);
> +		if (!ret && copy_to_user(argp, &luo_fd, sizeof(luo_fd)))
> +			ret = -EFAULT;
> +		break;
> +
> +	default:
> +		pr_warn("ioctl: unknown command nr: 0x%x\n", _IOC_NR(cmd));
> +		ret = -ENOTTY;
> +		break;
> +	}
> +
> +	return ret;
> +}
[...]

-- 
Regards,
Pratyush Yadav
