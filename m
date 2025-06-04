Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F6D18E1F;
	Wed,  4 Jun 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749052847; cv=none; b=rcQAVdB8ToVRm2ingzGBhn2Q0Su+mSE+Tyb9Mz0E8f4bjK/RBYF/fqsZXNmT7xGjoD/6f3p5Y2kXR6yYYgjmCcB4lI1dbY+XJsy/hkvD8UMhZkFaiveza1Ruv6deSaQH8zMA/N+MabBEFIE19Mxv98zIjYUrM8V35LRG9+XfMYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749052847; c=relaxed/simple;
	bh=LseHE7CfIFuvvOh+U0FuajD9jbePBoOdvRtrH+xsXB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fylNBakek8ZGMQ5cUCBQdT/T7gamg0qF+oXnl6+R5WJ8aHmSJ+KU6lYD9kZl3ivU+I0MnyFO/wmDsUlnWfHHSu806/yet4qF2FRLrQJfL5KcxvjTrx3iJOGXcgxW1soduIRxahBnMm39aDSeY3wruSYiifEk31By42kgniBC47M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lEPttlt9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lEPttlt9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDB4C4CEED;
	Wed,  4 Jun 2025 16:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749052846;
	bh=LseHE7CfIFuvvOh+U0FuajD9jbePBoOdvRtrH+xsXB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lEPttlt9GFYQAihZiE9qokni6J8/wqL3E19DZR/6mX9ZuSBXulAhtBuhzXgAS1zgG
	 LOdP7zAgrx4pOv5aJitJYeAypb3BW4+i7ZXF/NLQTfEpA5u1buGgswV3+Sa+hkjyZK
	 R3MT9YqpvjYzCda0EmTR830WibZ8YhoSz5CCeMmBkZY7zG1hWIrytoV/Rhkv4zRL5N
	 Q0Wa4YFhUHzgvqjylLUjcxRqbY2k9FygCEyVWlkTOg2f1LXQo1g0n3BgwuAINt/G2v
	 OgfetaDbCH7inlGBeGqgUJYJ8rQwbRL+e+BaVde3d3UVaUhpxBr48Acp/ByH78SVcC
	 nzDnYzj55739A==
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
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
In-Reply-To: <20250515182322.117840-6-pasha.tatashin@soleen.com>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
	<20250515182322.117840-6-pasha.tatashin@soleen.com>
Date: Wed, 04 Jun 2025 18:00:37 +0200
Message-ID: <mafs0sekfts2i.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 15 2025, Pasha Tatashin wrote:

> Integrate the LUO with the KHO framework to enable passing LUO state
> across a kexec reboot.
>
> This patch introduces the following changes:
> - During the KHO finalization phase allocate FDT blob.
> - Populate this FDT with a LUO compatibility string ("luo-v1") and the
>   current LUO state (`luo_state`).
> - Implement a KHO notifier
>
> LUO now depends on `CONFIG_KEXEC_HANDOVER`. The core state transition
> logic (`luo_do_*_calls`) remains unimplemented in this patch.
>
> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> ---
>  drivers/misc/liveupdate/luo_core.c | 222 ++++++++++++++++++++++++++++-
>  1 file changed, 219 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/misc/liveupdate/luo_core.c b/drivers/misc/liveupdate/luo_core.c
> index 919c37b0b4d1..a76e886bc3b1 100644
> --- a/drivers/misc/liveupdate/luo_core.c
> +++ b/drivers/misc/liveupdate/luo_core.c
> @@ -36,9 +36,12 @@
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>  
>  #include <linux/err.h>
> +#include <linux/kexec_handover.h>
>  #include <linux/kobject.h>
> +#include <linux/libfdt.h>
>  #include <linux/liveupdate.h>
>  #include <linux/rwsem.h>
> +#include <linux/sizes.h>
>  #include <linux/string.h>
>  #include "luo_internal.h"
>  
> @@ -55,6 +58,12 @@ const char *const luo_state_str[] = {
>  
>  bool luo_enabled;
>  
> +static void *luo_fdt_out;
> +static void *luo_fdt_in;
> +#define LUO_FDT_SIZE		SZ_1M
> +#define LUO_KHO_ENTRY_NAME	"LUO"
> +#define LUO_COMPATIBLE		"luo-v1"
> +
>  static int __init early_liveupdate_param(char *buf)
>  {
>  	return kstrtobool(buf, &luo_enabled);
> @@ -79,6 +88,60 @@ static inline void luo_set_state(enum liveupdate_state state)
>  	__luo_set_state(state);
>  }
>  
> +/* Called during the prepare phase, to create LUO fdt tree */
> +static int luo_fdt_setup(struct kho_serialization *ser)
> +{
> +	void *fdt_out;
> +	int ret;
> +
> +	fdt_out = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
> +					   get_order(LUO_FDT_SIZE));

Why not alloc_folio()? KHO already deals with folios so it seems
simpler. The kho_{un,}preserve_folio() functions exist exactly for these
kinds of allocations, so LUO also ends up being a first user. You also
won't end up needing kho_unpreserve_phys() and all the __pa() calls.

> +	if (!fdt_out) {
> +		pr_err("failed to allocate FDT memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = fdt_create_empty_tree(fdt_out, LUO_FDT_SIZE);

You are using FDT read/write functions throughout the series to create
new FDTs. The sequential write functions are generally more efficient
since they are meant for creating new FDT blobs. The read/write
functions are better for modifying an existing FDT blob.

Is there a particular reason you do this?

When using FDT SW functions, the creation of the tree would be something
like:

        fdt_create()
        fdt_finish_reservemap()
        fdt_begin_node()

        // Add stuff to FDT

        fdt_end_node()
        fdt_finish()

In this patch, the FDT does not change much after creation so it doesn't
look like it matters much, but in later patches, the FDT is passed to
luo_files_fdt_setup() and luo_subsystems_fdt_setup() which probably
modify the FDT a fair bit.

> +	if (ret)
> +		goto exit_free;
> +
> +	ret = fdt_setprop(fdt_out, 0, "compatible", LUO_COMPATIBLE,
> +			  strlen(LUO_COMPATIBLE) + 1);

fdt_setprop_string() instead? Or if you change to FDT SW,
fdt_property_string().

> +	if (ret)
> +		goto exit_free;
> +
> +	ret = kho_preserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
> +	if (ret)
> +		goto exit_free;
> +
> +	ret = kho_add_subtree(ser, LUO_KHO_ENTRY_NAME, fdt_out);
> +	if (ret)
> +		goto exit_unpreserve;
> +	luo_fdt_out = fdt_out;
> +
> +	return 0;
> +
> +exit_unpreserve:
> +	kho_unpreserve_phys(__pa(fdt_out), LUO_FDT_SIZE);
> +exit_free:
> +	free_pages((unsigned long)fdt_out, get_order(LUO_FDT_SIZE));
> +	pr_err("failed to prepare LUO FDT: %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static void luo_fdt_destroy(void)
> +{
> +	kho_unpreserve_phys(__pa(luo_fdt_out), LUO_FDT_SIZE);
> +	free_pages((unsigned long)luo_fdt_out, get_order(LUO_FDT_SIZE));
> +	luo_fdt_out = NULL;
> +}
> +
> +static int luo_do_prepare_calls(void)
> +{
> +	return 0;
> +}
> +
>  static int luo_do_freeze_calls(void)
>  {
>  	return 0;
> @@ -88,11 +151,111 @@ static void luo_do_finish_calls(void)
>  {
>  }
>  
> -int luo_prepare(void)
> +static void luo_do_cancel_calls(void)
> +{
> +}
> +
> +static int __luo_prepare(struct kho_serialization *ser)
>  {
> +	int ret;
> +
> +	if (down_write_killable(&luo_state_rwsem)) {
> +		pr_warn("[prepare] event canceled by user\n");
> +		return -EAGAIN;
> +	}
> +
> +	if (!is_current_luo_state(LIVEUPDATE_STATE_NORMAL)) {
> +		pr_warn("Can't switch to [%s] from [%s] state\n",
> +			luo_state_str[LIVEUPDATE_STATE_PREPARED],
> +			LUO_STATE_STR);
> +		ret = -EINVAL;
> +		goto exit_unlock;
> +	}
> +
> +	ret = luo_fdt_setup(ser);
> +	if (ret)
> +		goto exit_unlock;
> +
> +	ret = luo_do_prepare_calls();
> +	if (ret)
> +		goto exit_unlock;

With subsystems/filesystems support in place, this can fail. But since
luo_fdt_setup() called kho_add_subtree(), the debugfs file stays around,
and later calls to __luo_prepare() fail because the next
kho_add_subtree() tries to create a debugfs file that already exists. So
you would see an error like below:

    [  767.339920] debugfs: File 'LUO' in directory 'sub_fdts' already present!
    [  767.340613] luo_core: failed to prepare LUO FDT: -17
    [  767.341071] KHO: Failed to convert KHO state tree: -17
    [  767.341593] luo_core: Can't switch to [normal] from [normal] state
    [  767.342175] KHO: Failed to abort KHO finalization: -22

You probably need a kho_remove_subtree() that can be called from the
error paths.

Note that __luo_cancel() is called because failure in a KHO finalize
notifier calls the abort notifiers.

This is also something to fix, since if prepare fails, all other KHO
users who are already serialized won't even get to abort.

This weirdness happens because luo_prepare() and luo_cancel() control
the KHO state machine, but then also get controlled by it via the
notifier callbacks. So the relationship between then is not clear.
__luo_prepare() at least needs access to struct kho_serialization, so it
needs to come from the callback. So I don't have a clear way to clean
this all up off the top of my head.

I suppose one way to fix this would be to move the state check to
luo_cancel() instead. It would probably fix this problem but won't
actually do anything about the murky hierarchy between KHO and LUO.

> +
> +	luo_set_state(LIVEUPDATE_STATE_PREPARED);
> +
> +exit_unlock:
> +	up_write(&luo_state_rwsem);
> +
> +	return ret;
> +}
> +
> +static int __luo_cancel(void)
> +{
> +	if (down_write_killable(&luo_state_rwsem)) {
> +		pr_warn("[cancel] event canceled by user\n");
> +		return -EAGAIN;
> +	}
> +
> +	if (!is_current_luo_state(LIVEUPDATE_STATE_PREPARED) &&
> +	    !is_current_luo_state(LIVEUPDATE_STATE_FROZEN)) {
> +		pr_warn("Can't switch to [%s] from [%s] state\n",
> +			luo_state_str[LIVEUPDATE_STATE_NORMAL],
> +			LUO_STATE_STR);
> +		up_write(&luo_state_rwsem);
> +
> +		return -EINVAL;
> +	}
> +
> +	luo_do_cancel_calls();
> +	luo_fdt_destroy();
> +	luo_set_state(LIVEUPDATE_STATE_NORMAL);
> +
> +	up_write(&luo_state_rwsem);
> +
>  	return 0;
>  }
>  
> +static int luo_kho_notifier(struct notifier_block *self,
> +			    unsigned long cmd, void *v)
> +{
> +	int ret;
> +
> +	switch (cmd) {
> +	case KEXEC_KHO_FINALIZE:
> +		ret = __luo_prepare((struct kho_serialization *)v);
> +		break;
> +	case KEXEC_KHO_ABORT:
> +		ret = __luo_cancel();
> +		break;
> +	default:
> +		return NOTIFY_BAD;
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static struct notifier_block luo_kho_notifier_nb = {
> +	.notifier_call = luo_kho_notifier,
> +};
> +
> +/**
> + * luo_prepare - Initiate the live update preparation phase.
> + *
> + * This function is called to begin the live update process. It attempts to
> + * transition the luo to the ``LIVEUPDATE_STATE_PREPARED`` state.
> + *
> + * If the calls complete successfully, the orchestrator state is set
> + * to ``LIVEUPDATE_STATE_PREPARED``. If any  call fails a
> + * ``LIVEUPDATE_CANCEL`` is sent to roll back any actions.
> + *
> + * @return 0 on success, ``-EAGAIN`` if the state change was cancelled by the
> + * user while waiting for the lock, ``-EINVAL`` if the orchestrator is not in
> + * the normal state, or a negative error code returned by the calls.
> + */
> +int luo_prepare(void)
> +{
> +	return kho_finalize();
> +}
> +
>  /**
>   * luo_freeze() - Initiate the final freeze notification phase for live update.
>   *
> @@ -188,9 +351,23 @@ int luo_finish(void)
>  	return 0;
>  }
>  
> +/**
> + * luo_cancel - Cancel the ongoing live update from prepared or frozen states.
> + *
> + * This function is called to abort a live update that is currently in the
> + * ``LIVEUPDATE_STATE_PREPARED`` state.
> + *
> + * If the state is correct, it triggers the ``LIVEUPDATE_CANCEL`` notifier chain
> + * to allow subsystems to undo any actions performed during the prepare or
> + * freeze events. Finally, the orchestrator state is transitioned back to
> + * ``LIVEUPDATE_STATE_NORMAL``.
> + *
> + * @return 0 on success, or ``-EAGAIN`` if the state change was cancelled by the
> + * user while waiting for the lock.
> + */
>  int luo_cancel(void)
>  {
> -	return 0;
> +	return kho_abort();
>  }
>  
>  void luo_state_read_enter(void)
> @@ -205,7 +382,46 @@ void luo_state_read_exit(void)
>  
>  static int __init luo_startup(void)
>  {
> -	__luo_set_state(LIVEUPDATE_STATE_NORMAL);
> +	phys_addr_t fdt_phys;
> +	int ret;
> +
> +	if (!kho_is_enabled()) {
> +		if (luo_enabled)
> +			pr_warn("Disabling liveupdate because KHO is disabled\n");
> +		luo_enabled = false;
> +		return 0;
> +	}
> +
> +	ret = register_kho_notifier(&luo_kho_notifier_nb);
> +	if (ret) {
> +		luo_enabled = false;

You set luo_enabled to false here, but none of the LUO entry points like
luo_prepare() or luo_freeze() actually check it. So LUO will appear work
just fine even when it hasn't initialized properly.

> +		pr_warn("Failed to register with KHO [%d]\n", ret);

I guess you don't return here so a previous liveupdate can still be
recovered, even though we won't be able to make the next one. If so, a
comment would be nice to point this out.

> +	}
> +
> +	/*
> +	 * Retrieve LUO subtree, and verify its format.  Panic in case of
> +	 * exceptions, since machine devices and memory is in unpredictable
> +	 * state.
> +	 */
> +	ret = kho_retrieve_subtree(LUO_KHO_ENTRY_NAME, &fdt_phys);
> +	if (ret) {
> +		if (ret != -ENOENT) {
> +			panic("failed to retrieve FDT '%s' from KHO: %d\n",
> +			      LUO_KHO_ENTRY_NAME, ret);
> +		}
> +		__luo_set_state(LIVEUPDATE_STATE_NORMAL);
> +
> +		return 0;
> +	}
> +
> +	luo_fdt_in = __va(fdt_phys);
> +	ret = fdt_node_check_compatible(luo_fdt_in, 0, LUO_COMPATIBLE);
> +	if (ret) {
> +		panic("FDT '%s' is incompatible with '%s' [%d]\n",
> +		      LUO_KHO_ENTRY_NAME, LUO_COMPATIBLE, ret);
> +	}
> +
> +	__luo_set_state(LIVEUPDATE_STATE_UPDATED);
>  
>  	return 0;
>  }

-- 
Regards,
Pratyush Yadav
