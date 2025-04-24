Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABCA62701AB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484412; cv=none; b=c2Bx9OOqRBlQg9jJ2ZUu7sst0U1uUowANBnluPtn3KaiYalUZBNTdWEc8WnpZqdemHdZOXfrNQtKxpIq4yCZjuo4NVzIuLrF1yJ37QX06xLK3L4zrG+ILmfx5PUsHjUkgmDV9juGPAhcztQnr2lUbg5K+rgjG3u2w5lNCC2lS3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484412; c=relaxed/simple;
	bh=5QtXLIvhmNW4Lth8Wnr6Zyf9AWSPfQeyw78ET8cJPfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TFmtPDiKU3mvBVLuVGsYjjbYKoG4UfRRrb29auPFyvyurKMAAQJ5+xsak9kMzzTZb1RzRKnPrHGgb+Wt0333lLDTyTsYY/gEb6Fwl6XqorOMFxOH55HI6TeSVSYBR17kHtfycaj8jPIgQoWJAxsFkPcDtIwBjweUfFHQEpen2Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F6131063;
	Thu, 24 Apr 2025 01:46:38 -0700 (PDT)
Received: from [10.163.49.106] (unknown [10.163.49.106])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B5463F59E;
	Thu, 24 Apr 2025 01:46:38 -0700 (PDT)
Message-ID: <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
Date: Thu, 24 Apr 2025 14:16:34 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power
 state
To: Yabin Cui <yabinc@google.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Jie Gan <quic_jiegan@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250423230046.1134389-1-yabinc@google.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20250423230046.1134389-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/24/25 04:30, Yabin Cui wrote:
> Similar to ETE, TRBE may lose its context when a CPU enters low
> power state. To make things worse, if ETE state is restored without
> restoring TRBE state, it can lead to a stuck CPU due to an enabled
> source device with no enabled sink devices.
> 
> This patch introduces support for "arm,coresight-loses-context-with-cpu"

But could "arm,coresight-loses-context-with-cpu" device tree property
be associated wit TRBE devices ? OR this state save and restore needs
to be handled in the firmware.

> in the TRBE driver. When present, TRBE registers are saved before
> and restored after CPU low power state. To prevent CPU hangs, TRBE
> state is always saved after ETE state and restored after ETE state.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>  .../coresight/coresight-etm4x-core.c          | 13 ++++-
>  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
>  include/linux/coresight.h                     |  6 +++
>  3 files changed, 71 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> index e5972f16abff..1bbaa1249206 100644
> --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  {
>  	int ret = 0;
> +	struct coresight_device *sink;
>  
>  	/* Save the TRFCR irrespective of whether the ETM is ON */
>  	if (drvdata->trfcr)
> @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
>  	 * Save and restore the ETM Trace registers only if
>  	 * the ETM is active.
>  	 */
> -	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> +	if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
>  		ret = __etm4_cpu_save(drvdata);
> +		if (ret == 0) {
> +			sink = coresight_get_percpu_sink(drvdata->cpu);
> +			if (sink && sink_ops(sink)->percpu_save)
> +				sink_ops(sink)->percpu_save(sink);
> +		}
> +	}
>  	return ret;
>  }
>  
> @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  
>  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
>  {
> +	struct coresight_device *sink = coresight_get_percpu_sink(drvdata->cpu);
> +
> +	if (sink && sink_ops(sink)->percpu_restore)
> +		sink_ops(sink)->percpu_restore(sink);
>  	if (drvdata->trfcr)
>  		write_trfcr(drvdata->save_trfcr);
>  	if (drvdata->state_needs_restore)
> diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
> index fff67aac8418..38bf46951a82 100644
> --- a/drivers/hwtracing/coresight/coresight-trbe.c
> +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] = {
>   */
>  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES	256
>  
> +struct trbe_save_state {
> +	u64 trblimitr;
> +	u64 trbbaser;
> +	u64 trbptr;
> +	u64 trbsr;
> +};
> +
>  /*
>   * struct trbe_cpudata: TRBE instance specific data
>   * @trbe_flag		- TRBE dirty/access flag support
> @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] = {
>   * @cpu			- CPU this TRBE belongs to.
>   * @mode		- Mode of current operation. (perf/disabled)
>   * @drvdata		- TRBE specific drvdata
> + * @state_needs_save	- Need to save trace registers when entering cpu idle
> + * @state_needs_restore	- Need to restore trace registers when exiting cpu idle
> + * @save_state		- Saved trace registers
>   * @errata		- Bit map for the errata on this TRBE.
>   */
>  struct trbe_cpudata {
> @@ -133,6 +143,9 @@ struct trbe_cpudata {
>  	enum cs_mode mode;
>  	struct trbe_buf *buf;
>  	struct trbe_drvdata *drvdata;
> +	bool state_needs_save;
> +	bool state_needs_restore;
> +	struct trbe_save_state save_state;
>  	DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
>  };
>  
> @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq, void *dev)
>  	return IRQ_HANDLED;
>  }
>  
> +static void arm_trbe_cpu_save(struct coresight_device *csdev)
> +{
> +	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> +	struct trbe_save_state *state = &cpudata->save_state;
> +
> +	if (cpudata->mode == CS_MODE_DISABLED || !cpudata->state_needs_save)
> +		return;
> +
> +	state->trbbaser = read_sysreg_s(SYS_TRBBASER_EL1);
> +	state->trbptr = read_sysreg_s(SYS_TRBPTR_EL1);
> +	state->trblimitr = read_sysreg_s(SYS_TRBLIMITR_EL1);
> +	state->trbsr = read_sysreg_s(SYS_TRBSR_EL1);
> +	cpudata->state_needs_restore = true;
> +}
> +
> +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> +{
> +	struct trbe_cpudata *cpudata = dev_get_drvdata(&csdev->dev);
> +	struct trbe_save_state *state = &cpudata->save_state;
> +
> +	if (cpudata->state_needs_restore) {
> +		/*
> +		 * To avoid disruption of normal tracing, restore trace
> +		 * registers only when TRBE lost power (TRBLIMITR == 0).
> +		 */
> +		if (read_sysreg_s(SYS_TRBLIMITR_EL1) == 0) {
> +			write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1);
> +			write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> +			write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> +			set_trbe_enabled(cpudata, state->trblimitr);
> +		}
> +		cpudata->state_needs_restore = false;
> +	}
> +}
> +
>  static const struct coresight_ops_sink arm_trbe_sink_ops = {
>  	.enable		= arm_trbe_enable,
>  	.disable	= arm_trbe_disable,
>  	.alloc_buffer	= arm_trbe_alloc_buffer,
>  	.free_buffer	= arm_trbe_free_buffer,
>  	.update_buffer	= arm_trbe_update_buffer,
> +	.percpu_save	= arm_trbe_cpu_save,
> +	.percpu_restore	= arm_trbe_cpu_restore,
>  };
>  
>  static const struct coresight_ops arm_trbe_cs_ops = {
> @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
>  	cpudata->trbe_flag = get_trbe_flag_update(trbidr);
>  	cpudata->cpu = cpu;
>  	cpudata->drvdata = drvdata;
> +	cpudata->state_needs_save = coresight_loses_context_with_cpu(
> +		&drvdata->pdev->dev);
> +	cpudata->state_needs_restore = false;
>  	return;
>  cpu_clear:
>  	cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> index d79a242b271d..fec375d02535 100644
> --- a/include/linux/coresight.h
> +++ b/include/linux/coresight.h
> @@ -362,6 +362,10 @@ enum cs_mode {
>   * @alloc_buffer:	initialises perf's ring buffer for trace collection.
>   * @free_buffer:	release memory allocated in @get_config.
>   * @update_buffer:	update buffer pointers after a trace session.
> + * @percpu_save:	saves state when CPU enters idle state.
> + *			Only set for percpu sink.
> + * @percpu_restore:	restores state when CPU exits idle state.
> + *			only set for percpu sink.
>   */
>  struct coresight_ops_sink {
>  	int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> @@ -374,6 +378,8 @@ struct coresight_ops_sink {
>  	unsigned long (*update_buffer)(struct coresight_device *csdev,
>  			      struct perf_output_handle *handle,
>  			      void *sink_config);
> +	void (*percpu_save)(struct coresight_device *csdev);
> +	void (*percpu_restore)(struct coresight_device *csdev);
>  };
>  
>  /**
