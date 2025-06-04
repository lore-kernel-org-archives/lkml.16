Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195001F94A;
	Wed,  4 Jun 2025 15:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050280; cv=none; b=T/iEsI/ddt5znXUbHbyc5SMh2ObXWd0T6W9SYJKFJzAlf3d5iDYlJnz0ejOgZb1+WQ33xFwpQQAhNTZ4B6AN1rRt2d/Q9zKsS2luWaaKJ3qu98HI/WVwZtMvvkFhuw9AjvTmXkT0kSveylVhrQFZsVn92onl8ftCudVUNRsc3W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050280; c=relaxed/simple;
	bh=EjP0tX3z/aTAdpLBP8CzAHIQr7J/MGL6tjjJP89Xo24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a1McS5mywiHYBQ09ueltECj4hqp+U2BvIe6AS1bK9c8jkEgZfGdwN47HdonsJBmK4fLErwahX6j0sF4tSSb5UB3FSXE09l0+HcKj2bO8lpQ385mJOR+B2adLou85pr7ZVVPDImqlx2HoDLHoA4kMiBUaYBQujvcsXyfEOf+HV5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cifnpytl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cifnpytl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E704BC4CEE4;
	Wed,  4 Jun 2025 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749050279;
	bh=EjP0tX3z/aTAdpLBP8CzAHIQr7J/MGL6tjjJP89Xo24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cifnpytlG90RGruI6sDOS7EhPallxy0BNw64RpE0xSzYWipShW0QF1ZHjyBscGuLh
	 k7eDwaFPh+XMIXF/iuKyEQxOH7ySWyZvdVMi+u7kNfwqdl6ObTUX4Gts59QmX3wcRh
	 Nncq6rP6+SIT9KRtdrDP1wIrfXFxTfXogFevDZkA1P3Hn8f18LdD+Cyb0wc1D8Tx1M
	 /ngsQ1Ldztt2JiQynqjsrzohetey34v53vyDSo2Eyk0rDrgydfhBNIO/+xH9EgHkaC
	 IwEY/TvqZ6RWa3x/ah4pnO52kMq3sYmNyRmNcS5YV9JKqnQ8kkTcMR//9MxvtKwCR6
	 O5z+/9CQvTBwQ==
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
Subject: Re: [RFC v2 04/16] luo: luo_core: Live Update Orchestrator
In-Reply-To: <20250515182322.117840-5-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-5-pasha.tatashin@soleen.com>
Date: Wed, 04 Jun 2025 17:17:50 +0200
Message-ID: <mafs01przv8m9.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Introduce LUO, a mechanism intended to facilitate kernel updates while
> keeping designated devices operational across the transition (e.g., via
> kexec). The primary use case is updating hypervisors with minimal
> disruption to running virtual machines. For userspace side of hypervisor
> update we have copyless migration. LUO is for updating the kernel.
>
> This initial patch lays the groundwork for the LUO subsystem.
>
> Further functionality, including the implementation of state transition
> logic, integration with KHO, and hooks for subsystems and file
> descriptors, will be added in subsequent patches.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
[...]
> +/**
> + * luo_freeze() - Initiate the final freeze notification phase for live update.
> + *
> + * Attempts to transition the live update orchestrator state from
> + * %LIVEUPDATE_STATE_PREPARED to %LIVEUPDATE_STATE_FROZEN. This function is
> + * typically called just before the actual reboot system call (e.g., kexec)
> + * is invoked, either directly by the orchestration tool or potentially from
> + * within the reboot syscall path itself.
> + *
> + * Based on the outcome of the notification process:
> + * - If luo_do_freeze_calls() returns 0 (all callbacks succeeded), the state
> + * is set to %LIVEUPDATE_STATE_FROZEN using luo_set_state(), indicating
> + * readiness for the imminent kexec.
> + * - If luo_do_freeze_calls() returns a negative error code (a callback
> + * failed), the state is reverted to %LIVEUPDATE_STATE_NORMAL using
> + * luo_set_state() to cancel the live update attempt.

Would we end up with a more robust serialization in subsystems or
filesystems if we do not allow freeze to fail? Then they would be forced
to ensure they have everything in order by the time the system goes into
prepared state, and only need to make small adjustments in the freeze
callback.

> + *
> + * @return  0: Success. Negative error otherwise. State is reverted to
> + * %LIVEUPDATE_STATE_NORMAL in case of an error during callbacks.
> + */
> +int luo_freeze(void)
> +{
> +	int ret;
> +
> +	if (down_write_killable(&luo_state_rwsem)) {
> +		pr_warn("[freeze] event canceled by user\n");
> +		return -EAGAIN;
> +	}
> +
> +	if (!is_current_luo_state(LIVEUPDATE_STATE_PREPARED)) {
> +		pr_warn("Can't switch to [%s] from [%s] state\n",
> +			luo_state_str[LIVEUPDATE_STATE_FROZEN],
> +			LUO_STATE_STR);
> +		up_write(&luo_state_rwsem);
> +
> +		return -EINVAL;
> +	}
> +
> +	ret = luo_do_freeze_calls();
> +	if (!ret)
> +		luo_set_state(LIVEUPDATE_STATE_FROZEN);
> +	else
> +		luo_set_state(LIVEUPDATE_STATE_NORMAL);
> +
> +	up_write(&luo_state_rwsem);
> +
> +	return ret;
> +}
[...]

-- 
Regards,
Pratyush Yadav
