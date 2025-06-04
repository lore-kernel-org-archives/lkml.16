Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF331DDA0C;
	Wed,  4 Jun 2025 16:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749054617; cv=none; b=GjMYuikXkdFVA7wTe6lkWJ0UX43Ue+sDiQZK+FNOQbiR1u39+cZPeOklEIqfDL2A37K+Yfm79UJBIBgk7ithwxg4YnCXrW0MqmaGEmNSriBZhBRfBhkPFfF9l7e8SodA/dWGYq2pfH9+t37U00SB9v361cT5jQBofJoXztKtuEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749054617; c=relaxed/simple;
	bh=1Dkfld7z7Nz/jU3LSfpdgyvyWJ0WOr284arW7DyFew4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JC9XJK3vlx+Tckgk/SiIt5BSayWj24ckh1/77yRITdNe65IPFV2Lw0v3rvriLf6uLPDSjZcRnVwC3Di3uOBFs1OTI7Z8Qy7RZH911m2G3RWGarxfbdiS6+stoqQF6eCDDasMNgTvYY4MD4qeAIKwSjOY7UWTaVvXOnk3tdJ6Z38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LX3EfVya; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LX3EfVya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98FC8C4CEE4;
	Wed,  4 Jun 2025 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749054616;
	bh=1Dkfld7z7Nz/jU3LSfpdgyvyWJ0WOr284arW7DyFew4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LX3EfVyaLIfpmPLwRexknSU0TIIK28XO7r0RXp96qDPl8vwqunyVvHzvdu7yKQ/w/
	 ux+Mpd3pS3CC6t2zHvMRibzNivZNuP5TJWYptRmWPSTeBxaD7cHPImZFtu2ZZbGXUQ
	 0EXLq3db7FtfNheso90cWfC1hY35rcEoW5/LeDroePH+N5dq3xd9ECyaykBANnnyDX
	 WLSNcAqLWbZmvJwB84YEgvrMjyla9/b59NSKpLiYbDK7mATzwdbyf50lyasPXLGtLn
	 t9SMREzpOgrkiOoXNbjwptAiehjhoFVC7/0suH3ZzB6OM12ZzSizJzetUKFDHT6vNK
	 GX8Vc8AhBn5oA==
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
Subject: Re: [RFC v2 06/16] luo: luo_subsystems: add subsystem registration
In-Reply-To: <20250515182322.117840-7-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-7-pasha.tatashin@soleen.com>
Date: Wed, 04 Jun 2025 18:30:07 +0200
Message-ID: <mafs0iklbtqpc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Introduce the framework for kernel subsystems (e.g., KVM, IOMMU, device
> drivers) to register with LUO and participate in the live update process
> via callbacks.
>
> Subsystem Registration:
> - Defines struct liveupdate_subsystem in linux/liveupdate.h,
>   which subsystems use to provide their name and optional callbacks
>   (prepare, freeze, cancel, finish). The callbacks accept
>   a u64 *data intended for passing state/handles.
> - Exports liveupdate_register_subsystem() and
>   liveupdate_unregister_subsystem() API functions.
> - Adds drivers/misc/liveupdate/luo_subsystems.c to manage a list
>   of registered subsystems.
>   Registration/unregistration is restricted to
>   specific LUO states (NORMAL/UPDATED).
>
> Callback Framework:
> - The main luo_core.c state transition functions
>   now delegate to new luo_do_subsystems_*_calls() functions
>   defined in luo_subsystems.c.
> - These new functions are intended to iterate through the registered
>   subsystems and invoke their corresponding callbacks.
>
> FDT Integration:
> - Adds a /subsystems subnode within the main LUO FDT created in
>   luo_core.c. This node has its own compatibility string
>   (subsystems-v1).
> - luo_subsystems_fdt_setup() populates this node by adding a
>   property for each registered subsystem, using the subsystem's
>   name.
>   Currently, these properties are initialized with a placeholder
>   u64 value (0).
> - luo_subsystems_startup() is called from luo_core.c on boot to
>   find and validate the /subsystems node in the FDT received via
>   KHO. It panics if the node is missing or incompatible.
> - Adds a stub API function liveupdate_get_subsystem_data() intended
>   for subsystems to retrieve their persisted u64 data from the FDT
>       in the new kernel.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[...]
> +/**
> + * liveupdate_unregister_subsystem - Unregister a kernel subsystem handler from
> + * LUO
> + * @h: Pointer to the same liveupdate_subsystem structure that was used during
> + * registration.
> + *
> + * Unregisters a previously registered subsystem handler. Typically called
> + * during module exit or subsystem teardown. LUO removes the structure from its
> + * internal list; the caller is responsible for any necessary memory cleanup
> + * of the structure itself.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + * -EINVAL if h is NULL.
> + * -ENOENT if the specified handler @h is not found in the registration list.
> + * -EBUSY if LUO is not in the NORMAL state.
> + */
> +int liveupdate_unregister_subsystem(struct liveupdate_subsystem *h)
> +{
> +	struct liveupdate_subsystem *iter;
> +	bool found = false;
> +	int ret = 0;
> +
> +	luo_state_read_enter();
> +	if (!liveupdate_state_normal() && !liveupdate_state_updated()) {
> +		luo_state_read_exit();
> +		return -EBUSY;
> +	}
> +
> +	mutex_lock(&luo_subsystem_list_mutex);
> +	list_for_each_entry(iter, &luo_subsystems_list, list) {
> +		if (iter == h) {
> +			found = true;

Nit: you don't actually need the found variable. You can do the same
check that list_for_each_entry() uses, which is to call
list_entry_is_head().

> +			break;
> +		}
> +	}
> +
> +	if (found) {
> +		list_del_init(&h->list);
> +	} else {
> +		pr_warn("Subsystem handler '%s' not found for unregistration.\n",
> +			h->name);
> +		ret = -ENOENT;
> +	}
> +
> +	mutex_unlock(&luo_subsystem_list_mutex);
> +	luo_state_read_exit();
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(liveupdate_unregister_subsystem);
[...]

-- 
Regards,
Pratyush Yadav
