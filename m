Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E0BE20F07D
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 10:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317293; cv=none; b=dN8QHg8Y2NCRuxl2bkOeumyvoni0+gColXrW5YcpOqoNbskzr51ZQ/5nY6iOQ7hUacQ+7LuT+fU3/e7bxTGyDKxfONlMAErCDKILb4YiX1WzpyvMYWGcn1cHQRdBgGenKr+ztzwyzCMED6hvTjiTY9kyj07mymtqisbPw8Sk2Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317293; c=relaxed/simple;
	bh=vPaSK1YJPMimS0f/8osQJzDVTRZjiow/jJ+CiwFH3dY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YM2bIWMq0Nm0c+AgR5rBL0JANonJwepGMjgXTBtoeUiSA/79SOM/XBxqeTdCw2NReHoKGiEu78vOccjp1J2Q/vvWt76ba9MybiSQOMpdggyZ6vzLCmil547s3jQUUsx9GZRoymNSZc2jvMFq8Vg2CK/eCOIogksmvczwhvXZhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SoDqO9dq; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SoDqO9dq"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe574976so35853985e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317290; x=1745922090; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvWmQrsXg9zHl1MPjQw5tN8WwrpI48NyLqFNhUg6Edg=;
        b=SoDqO9dq0Aa2aew459oPiT2uYtaMADhxTOXvHOJMHiTApHI7ULln7G+pqna6lVlU+C
         NAzXtEpAGlGZmcTRSBCl9kCqoc9cnOscNy/QZvs6fklL4qDTDETydZ+QfiAg93zcNH1U
         wF9VZdiI4dqwx1ncEHTdPW+wE7SnN2LL5lX8Egm5NNmiSN1rdA66ETpMlgKDfdUpLAQw
         +KORWQArmNMTjlwst9DTeQd2o3hXaMmbm15PHboGdd7nvuro6BVUTtknD1VRM7jW2Rpw
         iMNTKWAwS4OIvZAcGXnTSCpUO7S/m5O/M36AKFB2iXrn0oVoaaDXtr0ILX/x2GyImcMF
         C6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317290; x=1745922090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvWmQrsXg9zHl1MPjQw5tN8WwrpI48NyLqFNhUg6Edg=;
        b=ODzxHKEWTfo8p198VXetb0rboXZlRSs0PYLt6TeGb4KUETYinf+WDnhCedqTX0mfbM
         ZQ016NQUBMSldv0XR7z7ZAuuGNhlPm/2CURTvzoFdRsmU6lT/MkIAZwQQ6i0vkBPc8yZ
         ZMMawM0tE+0xfdZfKzr2m1zUEeTWDoFkCntc9CE9wqMnNAmPZkMOt0912UwIHy/3Evhs
         FTDP+uNUsE2CeLWYgUA1dTmMaX4LD1v+qcNMFzZOx6TUJtOi37ZTt5znIA2EFBwY2Tfr
         IzWcsInMyHnLJeDISOgMDT4W2XrajkzY3LTLY4wSkUtlQ5ntnFwBdfnjDXFC5fg+UtXq
         NPcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhohuLvGr2gkZA5utf6zDlEKr9RQN4XPV3bStHUC6OukM9aLsL3BYn5KLW+R5wZS1p7cVv7xy5wJIaEH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMFxe+ZsDNGadKOkfJaOVITWf7Lds+6PIAdyGC30ApxoUetoeV
	1rTtWsaRwx7/ta4IhoJezbu36i00vsOzfVTDIxyvJ9XEAoNZ06XhJth3yISH4rM=
X-Gm-Gg: ASbGncu8vFSaugHJQV8FGybYpSsrZSKnGghIfh98GkM5IL0Th6lyLWjA4k47+Tv+5Kt
	PrICugVXOI4s0wc+FOPDY+roQbcQWLBQKRv/cN8vslnmlVhwcUgxhYVmJk64mhlqsJqneC9aGTx
	F8+0e4YQMeSUiOFolZiM13ox6Xkgzq3Zk85tkoPMK4XgpkoYXpEZaNoyUl1/gZOr35K7Ws5toWn
	W+Wm3YfFFu+iW1D0ugFZIsY7nzxwQJ4CUswo5BoKEYSeGCcXdQ0sAp01EJX209+Qq0MMrguSv5B
	vot5xL+3PhSl/Pn0ebTNDktjTPBzUrGrlJ4UWxMk4GE=
X-Google-Smtp-Source: AGHT+IFaqQKcJYU0wnjYmq4qKpdD7Qb4L05M0qqkdyijsfGrapNInK3N9dhMXV0eheuNB4H3XoJVdQ==
X-Received: by 2002:a5d:6daf:0:b0:39a:c9cb:819f with SMTP id ffacd0b85a97d-39efbae0e1fmr10293740f8f.37.1745317289921;
        Tue, 22 Apr 2025 03:21:29 -0700 (PDT)
Received: from [192.168.1.3] ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa43bf20sm14488732f8f.48.2025.04.22.03.21.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:21:29 -0700 (PDT)
Message-ID: <48640298-effa-42d4-9137-a18a51637f03@linaro.org>
Date: Tue, 22 Apr 2025 11:21:28 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] perf: Allow non-contiguous AUX buffer pages via PMU
 capability
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
 Liang Kan <kan.liang@linux.intel.com>
References: <20250421215818.3800081-1-yabinc@google.com>
 <20250421215818.3800081-2-yabinc@google.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250421215818.3800081-2-yabinc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/04/2025 10:58 pm, Yabin Cui wrote:
> For PMUs like ARM ETM/ETE, contiguous AUX buffers are unnecessary
> and increase memory fragmentation.
> 
> This patch introduces PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES, allowing
> PMUs to request non-contiguous pages for their AUX buffers.
> 
> Signed-off-by: Yabin Cui <yabinc@google.com>
> ---
>   include/linux/perf_event.h  | 1 +
>   kernel/events/ring_buffer.c | 6 ++++++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 0069ba6866a4..26ca35d6a9f2 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -301,6 +301,7 @@ struct perf_event_pmu_context;
>   #define PERF_PMU_CAP_AUX_OUTPUT			0x0080
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE		0x0100
>   #define PERF_PMU_CAP_AUX_PAUSE			0x0200
> +#define PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES	0x0400
>   
>   /**
>    * pmu::scope
> diff --git a/kernel/events/ring_buffer.c b/kernel/events/ring_buffer.c
> index 5130b119d0ae..87f42f4e8edc 100644
> --- a/kernel/events/ring_buffer.c
> +++ b/kernel/events/ring_buffer.c
> @@ -710,6 +710,12 @@ int rb_alloc_aux(struct perf_buffer *rb, struct perf_event *event,
>   		max_order = ilog2(nr_pages);
>   		watermark = 0;
>   	}
> +	/*
> +	 * When the PMU doesn't prefer contiguous AUX buffer pages, favor
> +	 * low-order allocations to reduce memory fragmentation.
> +	 */
> +	if (event->pmu->capabilities & PERF_PMU_CAP_AUX_NON_CONTIGUOUS_PAGES)
> +		max_order = 0;
>   
>   	/*
>   	 * kcalloc_node() is unable to allocate buffer if the size is larger

Hi Yabin,

I was wondering if this is just the opposite of PERF_PMU_CAP_AUX_NO_SG, 
and that order 0 should be used by default for all devices to solve the 
issue you describe. Because we already have PERF_PMU_CAP_AUX_NO_SG for 
devices that need contiguous pages. Then I found commit 5768402fd9c6 
("perf/ring_buffer: Use high order allocations for AUX buffers 
optimistically") that explains that the current allocation strategy is 
an optimization.

Your change seems to decide that for certain devices we want to optimize 
for fragmentation rather than performance. If these are rarely used 
features specifically when looking at performance should we not continue 
to optimize for performance? Or at least make it user configurable?

Thanks
James

