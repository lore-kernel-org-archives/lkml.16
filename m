Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652491E1E19;
	Mon, 26 May 2025 07:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748243947; cv=none; b=NFgE49816ykEOjaUgIIU0E2lKsgpaTTVtEnZMaTqomnWQJXSS1eLqLoEgmoI6HOMwkoUAAlzBLcV2+CVX3v0PAjxXn6ADwsIB8KwyxWd+tibuZfhbhVmneYFSCMK1UiUXVuEyIG5la9ctc9rR67xRIJpMuXZnLRXwmtxz33CmVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748243947; c=relaxed/simple;
	bh=MjYPiAp6HUDGi6nKBvrWjFgh7veuqNf/NgjVVb31RgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fzvy20FF7DiuDGq0dnuExdYcmGu/og/lPa5jpPGM6ry4vdeY/tO1w5N/y/7RmeJA4hR7qJmQ3tEMzM6hanMu0quaxkUa9CsO65JU1VsaJbbQrgpBLplGba0Ah+b7SqigqiIOUCWMExDdnPJ1IE0+FvNVovB+j4Y5iebxTghzQ4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p6yYNvk1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6yYNvk1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C92C4CEE7;
	Mon, 26 May 2025 07:18:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748243946;
	bh=MjYPiAp6HUDGi6nKBvrWjFgh7veuqNf/NgjVVb31RgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p6yYNvk1UZWsU9zZbkmavxfC8uunacknREKse3aaucerpdwp9F6kLDMWkQWb6DDod
	 Vc6Uh6UwVuVY395SjjoGbswsZSWGKv5fDXisYecvI9/z2Mgx4to0suQluaTO5ARyDR
	 cG63kecb7/uSZemKj3eKpM5wArxIFa/+FnHesIQiA7Do7pQhoZIBJn7yexMn4i2hwC
	 ntOqS0ITdO9IOFmwN299nG81oVgmitV8y8pm/u/0cfPFyn1yjaOt8K0vRAxxdGnoQP
	 f1RQh2VDJ+u0IVPv+odHaJqBNF7NtF+YKxZRA3sGVC5uj3AlCRrPC1+g/pfx05yZji
	 5Br1R5PcNoMZQ==
Date: Mon, 26 May 2025 10:18:45 +0300
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
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <aDQV1bAt0i8d95MQ@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515182322.117840-6-pasha.tatashin@soleen.com>

On Thu, May 15, 2025 at 06:23:09PM +0000, Pasha Tatashin wrote:
> Integrate the LUO with the KHO framework to enable passing LUO state
> across a kexec reboot.
> 
> This patch introduces the following changes:
> - During the KHO finalization phase allocate FDT blob.
> - Populate this FDT with a LUO compatibility string ("luo-v1") and the
>   current LUO state (`luo_state`).
> - Implement a KHO notifier

Would be nice to have more details about how LUO interacts with KHO, like
how LUO states correspond to the state of KHO, what may trigger
corresponding state transitions etc.
 
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

Does LUO really need that much?

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
> +	if (!fdt_out) {
> +		pr_err("failed to allocate FDT memory\n");
> +		return -ENOMEM;
> +	}
> +
> +	ret = fdt_create_empty_tree(fdt_out, LUO_FDT_SIZE);
> +	if (ret)
> +		goto exit_free;
> +
> +	ret = fdt_setprop(fdt_out, 0, "compatible", LUO_COMPATIBLE,
> +			  strlen(LUO_COMPATIBLE) + 1);
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

At this point LUO should know how many subsystems are participating in live
update, I believe it can properly size the fdt. 

> +
> +	ret = luo_do_prepare_calls();
> +	if (ret)
> +		goto exit_unlock;
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
> +		pr_warn("Failed to register with KHO [%d]\n", ret);
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
> -- 
> 2.49.0.1101.gccaa498523-goog
> 
> 

-- 
Sincerely yours,
Mike.
