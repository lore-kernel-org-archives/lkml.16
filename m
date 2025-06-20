Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E9C231824
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750410861; cv=none; b=j4N81SAc5qtMLv4HJivqVcluxUHdt5LgsK7cVn5q7GhMrTu+pOLa8igd9Dl/DZtIz8/2KjOwxoDRqMsq15OBHr43In9PzSPdaIPCpAqJPjKfFMceCqzo3OI4eN2qtPqJnxE03xiPBmGSlJfLS3V1y3M/4r2wIMgUz/8KAsvMGLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750410861; c=relaxed/simple;
	bh=6JQhvJalxPVuJ0BnHyAK8SD62QRtStxgHN38B931quw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxCtmao4iu80Q5QsJgzlq95LcO2JbwYRIb03KkYdIz672A5l7RN2Bt64547eFqBbuUN089bm4ksseYvHBxgrRwYsDIcpahyzt+bRNGKcGNL2lKiLR15n7BX4bbWeY/ZPNnJCjzmkepqTigXi7elVf0d5Qm+14AV/m0jalZ7Xcik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v3iCoryz; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v3iCoryz"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so1024238f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750410858; x=1751015658; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NkG74FvNfOLpNfRvSKYgtkPO/d1EcdAB8iHKOo6KSN0=;
        b=v3iCoryzgjVFUD3DaRa/b6Cl2lbJvvhPt2pIrc35Y1vJE4QsquZFC0oCqz4OEBQYZu
         Mjemo/Lf5zhMJh+Vzm1k78xRVmY05QOY1dKxIQrGKKW/Fe9iOHNFrx8fWQNRDUbZjc2/
         ng/w49S3NRe6Ay/OsGCHiRnOUnhKmGYQgaYejXlXlBf/+ZeDAY7XUTLx/1Pb9reg0+lW
         WGaa43o+8oz+NM8X+JRFotyENAqmGP/BRTw1AmP5xi8UIiPE936pC1VauO0zT0rClI+S
         2I8rjNqANuBoSaC6xQKERTiOvLTbYIN7IupLnEDv+RA6dEfOXbTAK3XMUgj1lUZpix/+
         /6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750410858; x=1751015658;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NkG74FvNfOLpNfRvSKYgtkPO/d1EcdAB8iHKOo6KSN0=;
        b=pR3DXcAjfzpJ9KIvRIhwcFF4NraIZ70155oTdcrtRd2H0AVLyji8I3T5UiesDXpb0s
         SFMCvs75YMjY1RNKfMtEpDenCU6TB+znxz2lNKktwHyOqRUOxQq8FrIcBGfqGNIlRzTw
         AIHRPUOX/jcfXgjJPjOFG1AIS7QWQwJYEOApo12R+SSCGKVEKyviWX17UPEQjA6aBsJT
         E5DVbL7fXraCdLRCirxcuwYAtF5QmV/yGhXw1joFH96ASul9kJigHW2F8FHwAWG3L0wr
         WYFw6gkP3b9G1W1ytQnemYatNQ2xs3ig/5YEFsXec8INSmcCea/KUSelWoRtLXC/xMtr
         wuXA==
X-Forwarded-Encrypted: i=1; AJvYcCV9ZG9C5t2YiLd6ltm51YXQLYaU6+dnAlxq138RowA08mBZ/QVUfyHUuTN+6y9mfUV/pD3x44XsOodes+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIlFzcTy3x4683QMG6ye2hCe56HL1/KAaY8Q1O6lCi8IdbwvgG
	3VRfnDDamkcqK/7VKoWq7h3uSInXXxP4SSJdtJkkn3LdVRxLRCi7/SpN/UGY7kPUFs4=
X-Gm-Gg: ASbGncsFwf9BrKiNnjFiY/10MqdSR7H6GNA+3mEEmFqCcxAHuM6Dnyo2cyAYOxDdp5u
	Y+ze1KsaYvj/LT0wFpz1cuO5zXxqgTn8vO5R8jt5SbL1Ss42KndwqQ/bCX7dHreMenBzTOog0X8
	XeCQmchvPD9ApUOODhL2sGJu/zOWcjFuOxKRZVbvwzxQpXZQpx8av4OskhPfjNb/V/zOTTg+AZx
	gQeGL1NFuP2dNMDBRZcnFuAuuBKaiLeiLBtmg3bXDokMHHM/UhaGkP5iWesSzSDRVjxJszd/nSP
	kRa4glwRKSylaGgAudXEQDpSz9XKsHoz00kVPzX6KKrJkbnV9VeVuvRhQ/ic59y2CnQ=
X-Google-Smtp-Source: AGHT+IFKL0Lwu/AoRawLPYKXiHmyoNk4t+vpv6fI8ZcV2OBtE6y1UF0PxzrsPMtN5VlkolXwQudCag==
X-Received: by 2002:a05:6000:385:b0:3a4:eee4:f73a with SMTP id ffacd0b85a97d-3a6d27e1f37mr1340801f8f.22.1750410857643;
        Fri, 20 Jun 2025 02:14:17 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1ac5asm1566405f8f.33.2025.06.20.02.14.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:14:17 -0700 (PDT)
Message-ID: <5d44e8b6-ad48-415a-aed6-4c59fcc228b8@linaro.org>
Date: Fri, 20 Jun 2025 10:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] perf/headers: Document PERF_PMU_CAP capability flags
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, Jonathan Corbet <corbet@lwn.net>,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>
References: <20250618-perf-pmu-cap-docs-v1-1-0d34387d6e47@collabora.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250618-perf-pmu-cap-docs-v1-1-0d34387d6e47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 18/06/2025 8:08 pm, Nicolas Frattaroli wrote:
> Over the years, capability flags for perf PMUs were introduced in a
> piecemeal fashion whenever a new driver needed to signal to the perf
> core some limitation or special feature.
> 
> Since one more undocumented flag that can have its meaning inferred from
> the commit message and implementation never seems that bad, it's
> understandable that this resulted in a total of 11 undocumented
> capability flags, which authors of new perf PMU drivers are expected to
> set correctly for their particular device.
> 
> Since I am in the process of becoming such an author of a new perf
> driver, it feels proper to pay it forward by documenting all
> PERF_PMU_CAP_ constants, so that no future person has to go through an
> hour or two of git blame + reading perf core code to figure out which
> capability flags are right for them.
> 
> Add comments in kernel-doc format that describes each flag. This follows
> the somewhat verbose "Object-like macro documentation" format, and can
> be verified with
> 
> 	./scripts/kernel-doc -v -none include/linux/perf_event.h
> 
> The current in-tree kernel documentation does not include a page on the
> perf subsystem, but once it does, these comments should render as proper
> documentation annotation. Until then, they'll also be quite useful for
> anyone looking at the header file.
> 

Reviewed-by: James Clark <james.clark@linaro.org>

> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
> There may be more perf documentation patches in the future, but right
> now I'm focused on getting a minimally viable driver for the hardware
> I'm working on going. Documenting these seemed to have a fairly good
> effort-to-future-payoff ratio though.
> 
> I Cc'd Corbet in case he has any input on the verbosity of the
> kernel-doc syntax here, maybe I'm missing something and all of these
> could be in a single /* comment */, but as it is in this patch doesn't
> seem too awful to me either.
> ---
>   include/linux/perf_event.h | 74 ++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 74 insertions(+)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index ec9d96025683958e909bb2463439dc69634f4ceb..7d749fd5225be12543df6e475277563bf16c05b1 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -294,16 +294,90 @@ struct perf_event_pmu_context;
>   /**
>    * pmu::capabilities flags
>    */
> +
> +/**
> + * define PERF_PMU_CAP_NO_INTERRUPT - \
> + *    PMU is incapable of generating hardware interrupts
> + */
>   #define PERF_PMU_CAP_NO_INTERRUPT	0x0001
> +/**
> + * define PERF_PMU_CAP_NO_NMI - \
> + *    PMU is guaranteed to not generate non-maskable interrupts
> + */
>   #define PERF_PMU_CAP_NO_NMI		0x0002
> +/**
> + * define PERF_PMU_CAP_AUX_NO_SG - \
> + *    PMU does not support using scatter-gather as the output
> + *
> + * The PERF_PMU_CAP_AUX_NO_SG flag indicates that the PMU does not support
> + * scatter-gather for its output buffer, and needs a larger contiguous buffer
> + * to output to.
> + */
>   #define PERF_PMU_CAP_AUX_NO_SG		0x0004
> +/**
> + * define PERF_PMU_CAP_EXTENDED_REGS - \
> + *    PMU is capable of sampling extended registers
> + *
> + * Some architectures have a concept of extended registers, e.g. XMM0 on x86
> + * or VG on arm64. If the PMU is capable of sampling these registers, then the
> + * flag PERF_PMU_CAP_EXTENDED_REGS should be set.
> + */
>   #define PERF_PMU_CAP_EXTENDED_REGS	0x0008
> +/**
> + * define PERF_PMU_CAP_EXCLUSIVE - \
> + *    PMU can only have one scheduled event at a time
> + *
> + * Certain PMU hardware cannot track several events at the same time. Such
> + * hardware must set PERF_PMU_CAP_EXCLUSIVE in order to avoid conflicts.
> + */
>   #define PERF_PMU_CAP_EXCLUSIVE		0x0010
> +/**
> + * define PERF_PMU_CAP_ITRACE - PMU traces instructions
> + *
> + * Some PMU hardware does instruction tracing, in that it traces execution of
> + * each instruction. Setting this capability flag makes the perf core generate
> + * a %PERF_RECORD_ITRACE_START event, recording the profiled task's PID and TID,
> + * to allow tools to properly decode such traces.
> + */
>   #define PERF_PMU_CAP_ITRACE		0x0020
> +/**
> + * define PERF_PMU_CAP_NO_EXCLUDE - \
> + *    PMU is incapable of excluding events based on context
> + *
> + * Some PMU hardware will count events regardless of context, including e.g.
> + * idle, kernel and guest. Drivers for such hardware should set the
> + * PERF_PMU_CAP_NO_EXCLUDE flag to explicitly advertise that they're unable to
> + * help themselves, so that the perf core can reject requests to exclude events
> + * based on context.
> + */
>   #define PERF_PMU_CAP_NO_EXCLUDE		0x0040
> +/**
> + * define PERF_PMU_CAP_AUX_OUTPUT - PMU non-AUX events generate AUX data
> + *
> + * Drivers for PMU hardware that supports non-AUX events which generate data for
> + * AUX events should set PERF_PMU_CAP_AUX_OUTPUT. This flag tells the perf core
> + * to schedule non-AUX events together with AUX events, so that this data isn't
> + * lost.
> + */
>   #define PERF_PMU_CAP_AUX_OUTPUT		0x0080
> +/**
> + * define PERF_PMU_CAP_EXTENDED_HW_TYPE - \
> + *    PMU supports PERF_TYPE_HARDWARE and PERF_TYPE_HW_CACHE
> + */
>   #define PERF_PMU_CAP_EXTENDED_HW_TYPE	0x0100
> +/**
> + * define PERF_PMU_CAP_AUX_PAUSE - \
> + *    PMU can pause and resume AUX area traces based on events
> + */
>   #define PERF_PMU_CAP_AUX_PAUSE		0x0200
> +/**
> + * define PERF_PMU_CAP_AUX_PREFER_LARGE - PMU prefers contiguous output buffers
> + *
> + * The PERF_PMU_CAP_AUX_PREFER_LARGE capability flag is a less strict variant of
> + * %PERF_PMU_CAP_AUX_NO_SG. PMU drivers for hardware that doesn't strictly
> + * require contiguous output buffers, but find the benefits outweigh the
> + * downside of increased memory fragmentation, may set this capability flag.
> + */
>   #define PERF_PMU_CAP_AUX_PREFER_LARGE	0x0400
>   
>   /**
> 
> ---
> base-commit: 31d56636e10e92ced06ead14b7541867f955e41d
> change-id: 20250618-perf-pmu-cap-docs-a13e4ae939ac
> 
> Best regards,

