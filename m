Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50FDA2036ED;
	Tue,  1 Apr 2025 12:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743511945; cv=none; b=AiIXzALlvStq5UnrGVTARAAZdxjRPGv1d80QeMiJ4O5muTYU0kLLi418TxVvBHmD0UR2Xp7mzjarnE+djNI3UPWth3JkAHdKe14zc1clF00jJDRddtHB6beccnzmfaXMFDQzIoYNCinlvnmnZidoQ5BFxUMfU9XrrgsKCj2Y16w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743511945; c=relaxed/simple;
	bh=G+DHmr9SMeP8LvmoZ9WUtsQY3x3ZhwAFh+YVcJkgOmg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZjkWieINnOjtxlum/CjMeXKc6oGzTH5bmVJ+QVLnJ+Fvz2J/scJDq3s8jrvRu8qmYa5WwSkjQTFTd2tuQq1ElEHF/DGHlPjkWxS+US4Nd97ap8Vc+uXfIiQ4b9aTCx3MhZUI/C4AT4b/Wmq3jIGSLTnhYRO+iqW3jxM0mn+jXkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED76A14BF;
	Tue,  1 Apr 2025 05:52:25 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E0933F694;
	Tue,  1 Apr 2025 05:52:21 -0700 (PDT)
Message-ID: <8d9ad64b-a5f7-4a44-a557-7edb83322fdf@arm.com>
Date: Tue, 1 Apr 2025 13:51:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] coresight: perf: Update buffer on AUX pause
To: Leo Yan <leo.yan@arm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250311170451.611389-1-leo.yan@arm.com>
 <20250311170451.611389-6-leo.yan@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250311170451.611389-6-leo.yan@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2025 17:04, Leo Yan wrote:
> Due to sinks like ETR and ETB don't support interrupt handling, the
> hardware trace data might be lost for continuous running tasks.
> 
> This commit takes advantage of the AUX pause for updating trace buffer
> to mitigate the trace data losing issue.
> 
> The per CPU sink has its own interrupt handling.  Thus, there will be a
> race condition between the updating buffer in NMI and sink's interrupt
> handler.  To avoid the race condition, this commit disallows updating
> buffer on AUX pause for the per CPU sink.  Currently, this is only
> applied for TRBE.
> 
> Signed-off-by: Leo Yan <leo.yan@arm.com>
> ---
>   .../hwtracing/coresight/coresight-etm-perf.c  | 43 ++++++++++++++++++-
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
> index 2dcf1809cb7f..f1551c08ecb2 100644
> --- a/drivers/hwtracing/coresight/coresight-etm-perf.c
> +++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
> @@ -574,14 +574,53 @@ static void etm_event_start(struct perf_event *event, int flags)
>   	return;
>   }
>   
> -static void etm_event_pause(struct coresight_device *csdev,
> +static void etm_event_pause(struct perf_event *event,
> +			    struct coresight_device *csdev,
>   			    struct etm_ctxt *ctxt)
>   {
> +	int cpu = smp_processor_id();
> +	struct coresight_device *sink;
> +	struct perf_output_handle *handle = &ctxt->handle;
> +	struct coresight_path *path;
> +	unsigned long size;
> +
>   	if (!ctxt->event_data)
>   		return;
>   
>   	/* Stop tracer */
>   	coresight_pause_source(csdev);
> +
> +	path = etm_event_cpu_path(ctxt->event_data, cpu);
> +	sink = coresight_get_sink(path);
> +	if (WARN_ON_ONCE(!sink))
> +		return;
> +
> +	/*
> +	 * The per CPU sink has own interrupt handling, it might have
> +	 * race condition with updating buffer on AUX trace pause if
> +	 * it is invoked from NMI.  To avoid the race condition,
> +	 * disallows updating buffer for the per CPU sink case.
> +	 */
> +	if (coresight_is_percpu_sink(sink))
> +		return;
> +
> +	if (WARN_ON_ONCE(handle->event != event))
> +		return;
> +
> +	if (!sink_ops(sink)->update_buffer)
> +		return;
> +
> +	size = sink_ops(sink)->update_buffer(sink, handle,
> +					     ctxt->event_data->snk_config);

I believe we keep the sink disabled/stopped in update_buffer. We need to
turn it back ON after the "buffer update". May be we could use a flag
to update_buffer() to indicate this is "pause" triggered update.

Cheers
Suzuki


> +	if (READ_ONCE(handle->event)) {
> +		if (!size)
> +			return;
> +
> +		perf_aux_output_end(handle, size);
> +		perf_aux_output_begin(handle, event);
> +	} else {
> +		WARN_ON_ONCE(size);
> +	}
>   }
>   
>   static void etm_event_stop(struct perf_event *event, int mode)
> @@ -595,7 +634,7 @@ static void etm_event_stop(struct perf_event *event, int mode)
>   	struct coresight_path *path;
>   
>   	if (mode & PERF_EF_PAUSE)
> -		return etm_event_pause(csdev, ctxt);
> +		return etm_event_pause(event, csdev, ctxt);
>   
>   	/*
>   	 * If we still have access to the event_data via handle,

