Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9023BCF2
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746694939; cv=none; b=eXT7ueVFsUxKIy/Zi+DT5SoCk2FJkTiyjR/QsCtq0+Z9O6mmqKzhK3Qzbl0kp8EZgGdcJIhU2/dxKy0AvJBLQOQxRql9cC2uDoIfOWAowbmaSxF0bFxDGm8+78jpfrmiGXkRADb9y72wVCKS9JNTReI5w4ivgBmadld5gNxd+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746694939; c=relaxed/simple;
	bh=YtBocN+mwqpRE/bEBJJe0JKe/8z8Pk07h5hjKIC/bAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TtOrfhy0j/c6OHsRpEC3LYH9jpZW0FrzkfiXk9cOFDEx3SNeAH7iQUEr6t5sp26dqZtUpTIp3hxZtQHyTjrkK1K3JcRJiULHBrQefNMDLA+XSr+cheO13CQ4qqNO1JrDSBH3hgV77PR+1aK0tN2AA1y7FUtpWmuAz/TvZqU6rlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ur2Qs21g; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ur2Qs21g"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so434536f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746694935; x=1747299735; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TxV/4ni6q0aC0NPRBzz2zpqrQ+HPJcgTCYdiRIa1Dqk=;
        b=ur2Qs21gvQCFXb03IikNwewtTRMRjuUm1Ap/ehmsJJ6EQm6ZBl/1LrZtU7hMJWfpGi
         JEs1FziSUNUdVNUyDMmZusNAK7Ak1Yjxg5Sr5DSbqHg415Xy7WD8Pn15BxsMWaHcyhL5
         agTy+yMBSEEC+JDfWqDtyYSms06tjJiDAbG7Etczdxp3m5Tv3xOFEd/5ojy/Ia5xUHc7
         2yryeZSBoqIr29fmCHx1NLU8gvRgTskkEHz9AFcpIyO/OxiAkTv0U9G9WawXIKMTKTJX
         PY5/NN7taYjtbXsTVxKZ89MEy03UaKZ4HOtz/3n5VmRXqEQ8vRKdVQKacgg2F98xlkOT
         7Ifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746694935; x=1747299735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TxV/4ni6q0aC0NPRBzz2zpqrQ+HPJcgTCYdiRIa1Dqk=;
        b=NAD2wKK9KJwQsk+Iv5BQVif0/d1UD6z1HIl2gtD2Vx/bFDjyHWcaaeuvTCPbTJLCqE
         Z6pLD4SVbOYSVZkdJRpWA1WP16EKCbMgsHSi1Vvd+9JYBRi5bnbRqnBFrNdLRiMrSGiY
         zx4SZtuj5UZUwfS2TYkxxttdGjf9xFyzrQZEn3KgjZvThYEVL/aR0681CHU6PjyqGZ1Q
         uFrCbDGmKaMLfVa+QgWBUKFHKb6VXzm5Gn074ibrl2mv0U4X9QxjIZ7MBfBGfeDf0NBk
         d5DEWcnMxGFQNkOU6qaSGsuEbCchf3/1ePi/wDQL6PROq2f/yjhQgBD2rH1pPkL4ru12
         7Kgw==
X-Forwarded-Encrypted: i=1; AJvYcCVAQCywlXGZBdwXCjacEoDT2PXu4flEDJOJTxLVXbyI9GavToWzyYhCZP86jlRkV2z0FDSVZWR/GugEjaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC20/QrPEd4uOlJAc5TqsBh/BW+S8NV9cChWsr15Oyu4V2LHGw
	091jIZ0PgDaje8VlLD4oovAoBW3UvgMKcga4Prn40NJQqPYE1j2YxzrNwx+E/9g=
X-Gm-Gg: ASbGncu0MXM0A849TxRnnB874OqzGDCurFer+sILW/PcA/9isY8lVCMowOVb/0xvSYH
	6zS5Rf6Jy0N1Dp4fWRej1JPWl5TxiKMDnekCrAuqWaPtvNWqP01MoF3AWeI0zqamD3tcDmuTWzK
	dtf6QsMWDYY/SGx6EsApcHIsb5VVq0boFu2SU0WyK4lLifZZCSUrs48Si3t+eu27Hidy/t9tW1f
	dK6dUcP7n309Ymn8nmoArcieej8I3glCyyQ9OWf1P/ZRCnteuiUAE5aWX4+ybGp3GaY7aIQzIcL
	Z5643e6BCaVbs0RvqXqSiBdkYGjifMF0f8UchbteZuI=
X-Google-Smtp-Source: AGHT+IGND12jBuwGb9fbCT8AT3eW6atqvX53aTSi7rk1Y/3WdjX/LgXU1BNPBra4UmXrAyxLW1UlqQ==
X-Received: by 2002:a5d:47a6:0:b0:391:4873:7943 with SMTP id ffacd0b85a97d-3a0b4a29c0dmr4950605f8f.32.1746694934826;
        Thu, 08 May 2025 02:02:14 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b44ad93asm5693275f8f.91.2025.05.08.02.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 02:02:14 -0700 (PDT)
Message-ID: <dee41e51-879d-491a-a330-9876660befa9@linaro.org>
Date: Thu, 8 May 2025 10:02:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] perf: Allocate non-contiguous AUX pages by default
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
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
References: <20250507181346.1892103-1-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250507181346.1892103-1-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/05/2025 7:13 pm, Yabin Cui wrote:
> perf always allocates contiguous AUX pages based on aux_watermark.
> However, this contiguous allocation doesn't benefit all PMUs. For
> instance, ARM SPE and TRBE operate with virtual pages, and Coresight
> ETR allocates a separate buffer. For these PMUs, allocating contiguous
> AUX pages unnecessarily exacerbates memory fragmentation. This
> fragmentation can prevent their use on long-running devices.
> 
> This patch modifies the perf driver to be memory-friendly by default,
> by allocating non-contiguous AUX pages. For PMUs requiring contiguous
> pages (Intel BTS and some Intel PT), the existing
> PERF_PMU_CAP_AUX_NO_SG capability can be used. For PMUs that don't
> require but can benefit from contiguous pages (some Intel PT), a new
> capability, PERF_PMU_CAP_AUX_PREFER_LARGE, is added to maintain their
> existing behavior.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
> Changes since v3:
> Add comments and a local variable to explain max_order value
> changes in rb_alloc_aux().
> 
> Changes since v2:
> Let NO_SG imply PREFER_LARGE. So PMUs don't need to set both flags.
> Then the only place needing PREFER_LARGE is intel/pt.c.
> 
> Changes since v1:
> In v1, default is preferring contiguous pages, and add a flag to
> allocate non-contiguous pages. In v2, default is allocating
> non-contiguous pages, and add a flag to prefer contiguous pages.
> 
> v1 patchset:
> perf,coresight: Reduce fragmentation with non-contiguous AUX pages for
> cs_etm
> 
>   arch/x86/events/intel/pt.c  |  2 ++
>   include/linux/perf_event.h  |  1 +
>   kernel/events/ring_buffer.c | 33 ++++++++++++++++++++++++---------
>   3 files changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/events/intel/pt.c b/arch/x86/events/intel/pt.c
> index fa37565f6418..25ead919fc48 100644
> --- a/arch/x86/events/intel/pt.c
> +++ b/arch/x86/events/intel/pt.c
> @@ -1863,6 +1863,8 @@ static __init int pt_init(void)
>   
>   	if (!intel_pt_validate_hw_cap(PT_CAP_topa_multiple_entries))
>   		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_NO_SG;
> +	else
> +		pt_pmu.pmu.capabilities = PERF_PMU_CAP_AUX_PREFER_LARGE;
>   
>   	pt_pmu.pmu.capabilities		|= PERF_PMU_CAP_EXCLUSIVE |
>   					   PERF_PMU_CAP_ITRACE |
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
> index 5130b119d0ae..69c90ea1b79a 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -679,7 +679,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   {
>   	bool overwrite = !(flags & RING_BUFFER_WRITABLE);
>   	int node = (event->cpu == -1) ? -1 : cpu_to_node(event->cpu);
> -	int ret = -ENOMEM, max_order;
> +	/*
> +	 * True if the PMU needs a contiguous AUX buffer (CAP_AUX_NO_SG) or
> +	 * prefers large contiguous pages (CAP_AUX_PREFER_LARGE).
> +	 */
 > +	bool use_contiguous_pages = event->pmu->capabilities & (> +	 
PERF_PMU_CAP_AUX_NO_SG | PERF_PMU_CAP_AUX_PREFER_LARGE);

Reviewed-by: James Clark <james.clark@linaro.org>

Minor nit: this comment is a bit verbose IMO, and it's only describing 
what rather than why. But the other one is ok.

> +	/*
> +	 * Initialize max_order to 0 for page allocation. This allocates single
> +	 * pages to minimize memory fragmentation. This is overriden if
> +	 * use_contiguous_pages is true.
> +	 */
> +	int max_order = 0;
> +	int ret = -ENOMEM;
>   
>   	if (!has_aux(event))
>   		return -EOPNOTSUPP;
> @@ -689,8 +701,8 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
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
> @@ -698,16 +710,19 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   					  (unsigned long)nr_pages << (PAGE_SHIFT - 1));
>   
>   		/*
> -		 * Use aux_watermark as the basis for chunking to
> -		 * help PMU drivers honor the watermark.
> +		 * If using contiguous pages, use aux_watermark as the basis
> +		 * for chunking to help PMU drivers honor the watermark.
>   		 */
> -		max_order = get_order(watermark);
> +		if (use_contiguous_pages)
> +			max_order = get_order(watermark);
>   	} else {
>   		/*
> -		 * We need to start with the max_order that fits in nr_pages,
> -		 * not the other way around, hence ilog2() and not get_order.
> +		 * If using contiguous pages, we need to start with the
> +		 * max_order that fits in nr_pages, not the other way around,
> +		 * hence ilog2() and not get_order.
>   		 */
> -		max_order = ilog2(nr_pages);
> +		if (use_contiguous_pages)
> +			max_order = ilog2(nr_pages);
>   		watermark = 0;
>   	}
>   

