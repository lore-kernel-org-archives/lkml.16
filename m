Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B6B21C186
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 10:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746096480; cv=none; b=bI6IKiA888hfl/dYd/YiIEMi3aq0HQObi+nGorHdByfmnu62HDrVNV/afUNclNtdS5SW10Zt31VsGcSZGO0zqIaN4u0tnnH4R+/vlHVuFA7WFcAO2WY2Cwo4ELtY200FDtiIN+y9pqXZLzGWMoZy1t9bUzmm9x+/83o88NMzsNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746096480; c=relaxed/simple;
	bh=kBfb3axVpUkipYau/Mq9SyypPgXCwVamodootrN8gC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NmJ03rVs8X4PtKXcHvmDzpgK8dUBI8gwgLE+hdt+LcwtPN2KJjuUHRM6MbifO9vO1Aq/40D1ti8Km72IMCVGJ58Pe+UyqZ3+3Xc/NBjThH9LgA5S3sovnxkys8/qO+3+vW7fpmoHgZ8uW3yjk1OgDx1+M7godmQvL1+7pYM+ukw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdX1caYj; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdX1caYj"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso460399f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 03:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746096477; x=1746701277; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=si3fNE9GQSrIDtSL2LXUzl+e8wIwmtqlcMDREI82glc=;
        b=tdX1caYjewZmnHdV07NfxYjvFz/jiJ5xcbd/NVERKfBaQZ+9qLAmN9oQGrutzQON76
         6QI+px/FM/Ckt8TOx1/3LYgDxAVhkv6dNQEeupy+AFApqw1qU7wtUpvwTZdSFvUD71IN
         vJHSYVVBprnkOaqK6M/tBIllQ1TfEBWmeV8t9cV1T5qJyHwikqCLlXDlqxx6yZan7/Jd
         FO8IB4uJ+fqeMv0Y6aN9YT5s3cYHKAcJ1sOt/O7kIAAeVfn1J9vV1FLyzG8JhiBOrsWD
         +k7ysQsHW7Li8BzJPOMPKLHjkQlNOyi1IrkxkGtp0AoXQ7j1LU8UPihdw7Ey82we7ksG
         oAGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746096477; x=1746701277;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=si3fNE9GQSrIDtSL2LXUzl+e8wIwmtqlcMDREI82glc=;
        b=GvENQeRpamy2cF0wLRfzJDqThYSkCdfBQYJNy6pwm6Ey69J73ceOJuF3GPuGrCzctA
         40UpwuV6U46zyAD2QquZPCOrsv9tdgdsOIoLgZI4/r6mu+4nfWGBOZPJ/dsBdqRdnQLb
         NYx0+ewTZpt4MM4cg2kCipvQ1btPAxfGt8u1v+59Aar/RDEXRDR5tdQPUVEI4WFUs5Na
         E9GQMKoJl0qyAzOp0So+8uEp+dn3Xfj86ybwvKJelQvje3Cc+fKKGc5d+tOHCWZt0udT
         2cULOQErUoA6VnUZnrVlcc25r24bBsF/49mDPuxj8QwH4/nTXNENDd2D0quW96au4FcE
         28GA==
X-Forwarded-Encrypted: i=1; AJvYcCUXe5HOFiYqJSw/CoCtyS7za7Bbk5x2X84EmkX8mL3pnsJV4l1ojtOlZmqfkIJz9YNNNd2c/H/eUyh3hDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrHQGeP2TT2DBrchBc1rwmMWB20d4U9Tjt2tTtSeSpIVgfNeuB
	QPY6aTz8oNvfbQ0/VjMyNW9Kglf+rVYUx4K5WMPBiq0N3ek1h3cKSXR7KtnXBuU=
X-Gm-Gg: ASbGncuGtVkhEXNJrpI3rVmnPaNdNDfKb2npIsBLnzbVQREGtW2FUOkE1HKXXmUUP2L
	yfaum2ZvzBYpxXKgLnxX2MmeEJNl5rPB5/8m1/iLHkqekc33KbShBFWJuGJP/QtsyyCArz9lfsP
	kt3XTXBghMvB8rljSXeJMLCRHIC6qVhfJCYGOp5aAXMAn5ts2IymY8xottoYvRBrM808g4riQKZ
	WNlwMQOviP3mNTOQqX4WJDDFAmjT1CSeNFY0XE65dWg72lGgsg5+A+PoXGUCUeH0NOEXcvD+JLL
	VaafuFhyH344HD9k4W6eT1l+qMIdJVHb3HISDs2U3UP4SnWY55lJ/g==
X-Google-Smtp-Source: AGHT+IHslO86ZF1CU2IPZPf6KTthtEvUGuil8yHuz65YUqPluNBK+P3P3sk3bArImylFI/g6oEQAvQ==
X-Received: by 2002:a05:6000:1ac8:b0:391:3f4f:a169 with SMTP id ffacd0b85a97d-3a08ff3c000mr5090505f8f.32.1746096477139;
        Thu, 01 May 2025 03:47:57 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8f92fsm520512f8f.90.2025.05.01.03.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 03:47:56 -0700 (PDT)
Message-ID: <a7c2ff21-4399-4cff-83d9-2fb0da0b5a08@linaro.org>
Date: Thu, 1 May 2025 11:47:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] perf: Allocate non-contiguous AUX pages by default
To: Yabin Cui <yabinc@google.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Liang Kan <kan.liang@linux.intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
References: <20250429213133.922495-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250429213133.922495-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/04/2025 10:31 pm, Yabin Cui wrote:
> perf always allocates contiguous AUX pages based on aux_watermark.
> However, this contiguous allocation doesn't benefit all PMUs. For
> instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> ETR allocates a separate buffer. For these PMUs, allocating contiguous
> AUX pages unnecessarily exacerbates memory fragmentation. This
> fragmentation can prevent their use on long-running devices.
> 
> This patch modifies the perf driver to allocate non-contiguous AUX
> pages by default. For PMUs that can benefit from contiguous pages (
> Intel PT and BTS), a new PMU capability, PERF_PMU_CAP_AUX_PREFER_LARGE
> is introduced to maintain their existing behavior.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
> Changes since v1:
> In v1, default is preferring contiguous pages, and add a flag to
> allocate non-contiguous pages. In v2, default is allocating
> non-contiguous pages, and add a flag to prefer contiguous pages.
> 
> v1 patchset:
> perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> cs_etm
> 
>   arch/x86/events/intel/bts.c |  3 ++-
>   arch/x86/events/intel/pt.c  |  3 ++-
>   include/linux/perf_event.h  |  1 +
>   kernel/events/ring_buffer.c | 18 +++++++++++-------
>   4 files changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/events/intel/bts.c b/arch/x86/events/intel/bts.c
> index a95e6c91c4d7..9129f00e4b9f 100644
> --- a/arch/x86/events/intel/bts.c
> +++ b/arch/x86/events/intel/bts.c
> @@ -625,7 +625,8 @@ static __init int bts_init(void)
>   		return -ENOMEM;
>   
>   	bts_pmu.capabilities	= PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_ITRACE |
> -				  PERF_PMU_CAP_EXCLUSIVE;
> +				  PERF_PMU_CAP_EXCLUSIVE |
> +				  PERF_PMU_CAP_AUX_PREFER_LARGE;
>   	bts_pmu.task_ctx_nr	= perf_sw_context;
>   	bts_pmu.event_init	= bts_event_init;
>   	bts_pmu.add		= bts_event_add;
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index fa37565f6418..37179e813b8c 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1866,7 +1866,8 @@ static __init int pt_init(void)
>   
>   	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>   					   PERF_PMU_CAP_ITRACE |
> -					   PERF_PMU_CAP_AUX_PAUSE;
> +					   PERF_PMU_CAP_AUX_PAUSE |
> +					   PERF_PMU_CAP_AUX_PREFER_LARGE;
>   	pt_pmu.pmu.attr_groups		 = pt_attr_groups;
>   	pt_pmu.pmu.task_ctx_nr		 = perf_sw_context;
>   	pt_pmu.pmu.event_init		 = pt_event_init;
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0069ba6866a4..56d77348c511 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
>   #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
>   #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> +#define PERF_PMU_CAP_AUX_PREFER_LARGE		0x0400
>   
>   /**
>    * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 5130b119d0ae..d76249ce4f17 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -679,7 +679,7 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   {
>   	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>   	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	int ret = -ENOMEM, max_order;
> +	int ret = -ENOMEM, max_order = 0;
>   
>   	if (!has_aux(event))
>   		return -EOPNOTSUPP;
> @@ -689,8 +689,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   
>   	if (!overwrite) {
>   		/*
> -		 * Watermark defaults to half the buffer, and so does the
> -		 * max_order, to aid PMU drivers in double buffering.
> +		 * Watermark defaults to half the buffer, to aid PMU drivers
> +		 * in double buffering.
>   		 */
>   		if (!watermark)
>   			watermark = min_t(unsigned long,
> @@ -698,16 +698,20 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>   
>   		/*
> -		 * Use aux_watermark as the basis for chunking to
> +		 * For PMUs that prefer large contiguous buffers,
> +		 * use aux_watermark as the basis for chunking to
>   		 * help PMU drivers honor the watermark.
>   		 */
> -		max_order = get_order(watermark);
> +		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
> +			max_order = get_order(watermark);
>   	} else {
>   		/*
> -		 * We need to start with the max_order that fits in nr_pages,
> +		 * For PMUs that prefer large contiguous buffers,
> +		 * we need to start with the max_order that fits in nr_pages,
>   		 * not the other way around, hence ilog2() and not get_order.
>   		 */
> -		max_order = ilog2(nr_pages);
> +		if (event->pmu->capabilities & PERF_PMU_CAP_AUX_PREFER_LARGE)
> +			max_order = ilog2(nr_pages);

Doesn't this one need to be 'PERF_PMU_CAP_AUX_PREFER_LARGE | 
PERF_PMU_CAP_AUX_NO_SG', otherwise the NO_SG test further down doesn't 
work for devices that only have NO_SG and not PREFER_LARGE.

NO_SG implies PREFER_LARGE behavior, except that NO_SG additionally hard 
fails if it can't do it in one alloc. But I think you shouldn't have to 
set them both to get the correct behavior.

