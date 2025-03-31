Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13030FC0B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411938; cv=none; b=pzrHN+ZsNYkV17K8PApP63x4s3qKj+Q5x3MeMXkOcgtBocjylzDszJZ5Pm+3g+1FqWEqgFp8nPCeMgfSqXTTusIHQhrk3PWEtaGLdPCHH+fzvLkQCrd27ZjTyEfCwJfZxWDNDRTyHYD0DJJyccDiHe/y64SXqwsXlkcb6QuDSZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411938; c=relaxed/simple;
	bh=F5TgRC9bCtufyBzH3WXoUaVVpRPo87NkKtuzFw9Wjfg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u9dl/EI79AKytBjHUrYa8zJ69C0DJxAiywLJhfDrPfCNLWxcuiHW29cL0BJngl2mEqQfIuC2mrFiEtvRVPRkLBQYKo8nuVVOxK7G3VNjSJiBzRy11AQrtdCtDJr8QgBi1FJRWxpnH+HO6H+wgMNMSxbeb5czwaXRYgu0VnyLh+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=buVywRIu; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="buVywRIu"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso8094476a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743411934; x=1744016734; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1G/2f/kzgQrI6H05GnwJcV5s7P3UOsc3wy1MZhe8JsE=;
        b=buVywRIul3twAU9cUMua9HYuyAGevUYOhh3071M21/yd4l7r6mcPXmYtdKURH3AwyE
         kVaEAACUDOvJAXfEo4k3/DB60qTsw74qRLy3kmuQa/OnZWEq4ysxQVoQDRzJSbQxA3/R
         TGbuhy9lpxjyWoN0vP0sExGC4VgnJAmYAOVrkZ0PxJxEIPnUBQtpa6sM3bmRtDQQ84XQ
         YgoTmHgIDNUeplKk+zO3TkSFCTmesrg/2v9Aqx+EgwoXQtrgqp3gkEvUDVY6zHnQoe+0
         h8CTVFFpo4YtTfN9L/JQ6CoW4MqQZ3xD2Yg7Re47ExG5fTvEOTXpA3LuBQLflcKcjczg
         t7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411934; x=1744016734;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1G/2f/kzgQrI6H05GnwJcV5s7P3UOsc3wy1MZhe8JsE=;
        b=GOZud5FGcugi2GYOV9fnZFh5x/sBrksF3HjkotvU//gO/g/sjVTIP89+EcF/caC8hK
         /918bKaOmkDxYLDQYaFlsfDtbIliv/2YNiqhVGaxK75s0nkuHaExrM2IZucZpnHjMumK
         8p5jRUJl9F5b+BmVwZbCwakhNDXMdYXcI9bTExPwR/Qehuws1UF/HDq9zcg5gbYmfDAB
         bCKNNpi4vbfskTkJz4nofYUZFiojKJyHhGYHE7+rEtJgVQ4Bih5YUEcVHllOJb+zQeNp
         CyjCtU2sB6o29R9/p+8bLlZ+3RNgkXYVr3nHxC1r4Fwas3ds2LO+yS9IcWgqeNlSC6IP
         XdYA==
X-Forwarded-Encrypted: i=1; AJvYcCU5HSgDnAzT++9OvfLV+dgFWXJSnEy4Sw3IeEh+tpU/RuqeSiI9xxjMTW65wTZkfXTzoMBlnJb1p9ldIuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyG9GhWKvVWxoJisuGhc/4vZL8+m2AJw//nSn5dLEEj+wL5NHA
	/qTo+AEtRZb1mnOd5DBxor/7GG6NidxZOxmmtSG1dXvZZJsUul8uzprpSlNqJuV7iZ15XrwEFw6
	0h+0=
X-Gm-Gg: ASbGnctSAzP2hErQVycCcSPKoJpogL5R/TQryEVNcr7TH1LSGkAIJ0NVDoxbie/S9A3
	wiC1GQ6V4jgs5lvBw8BJOJEfHGev2O1HSlI89GmNuq+rD1ojOycVp3hv6RCqm3ivN2/Sil2iZ3S
	RdPoduLd9uLwwJqylyC7Q3oCM3rzi73uVeljLJuTQjkT9pZXZKFvhSt+/YPasvzKKcPwe1qdHLA
	5O5+9K1XmndaUnn+09zUVKVftrgIttp5HAxADvVfjcho1d6FsIW6r3YLjLJ1TCOZIVE+wJ0gmLx
	3AObxSFBkgIFI5QcIs/Xz22gI0iyLvjfHwmicZonaiv3iBMK2QHd1hYHY7VT9DWulSbMhpj3TeM
	vnvG1iZ+fz/Cj
X-Google-Smtp-Source: AGHT+IEZKen+GqDOHtdkyeLLNPETjZemufqDk6C+fKS+SFiLecdoalHH5ETBCA5wdaHh1QGXT8ZLeQ==
X-Received: by 2002:a17:906:aacf:b0:ac7:4d45:f13e with SMTP id a640c23a62f3a-ac74d460c41mr385561566b.13.1743411934297;
        Mon, 31 Mar 2025 02:05:34 -0700 (PDT)
Received: from localhost (host-87-5-222-245.retail.telecomitalia.it. [87.5.222.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927af39sm590257066b.44.2025.03.31.02.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:05:33 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 31 Mar 2025 11:06:50 +0200
To: Song Liu <song@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-toolchains@vger.kernel.org, live-patching@vger.kernel.org,
	indu.bhagat@oracle.com, puranjay@kernel.org, wnliu@google.com,
	irogers@google.com, joe.lawrence@redhat.com, jpoimboe@kernel.org,
	mark.rutland@arm.com, peterz@infradead.org,
	roman.gushchin@linux.dev, rostedt@goodmis.org, will@kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH v3 1/2] arm64: Implement arch_stack_walk_reliable
Message-ID: <Z-pbKrO0w2g-2u3o@apocalypse>
References: <20250320171559.3423224-1-song@kernel.org>
 <20250320171559.3423224-2-song@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320171559.3423224-2-song@kernel.org>

Hi song,

On 10:15 Thu 20 Mar     , Song Liu wrote:
> With proper exception boundary detection, it is possible to implment
> arch_stack_walk_reliable without sframe.
> 
> Note that, arch_stack_walk_reliable does not guarantee getting reliable
> stack in all scenarios. Instead, it can reliably detect when the stack
> trace is not reliable, which is enough to provide reliable livepatching.
> 
> Signed-off-by: Song Liu <song@kernel.org>
> ---
>  arch/arm64/Kconfig             |  2 +-
>  arch/arm64/kernel/stacktrace.c | 66 +++++++++++++++++++++++++---------
>  2 files changed, 51 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 701d980ea921..31d5e1ee6089 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -276,6 +276,7 @@ config ARM64
>  	select HAVE_SOFTIRQ_ON_OWN_STACK
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
> +	select HAVE_RELIABLE_STACKTRACE
>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> @@ -2500,4 +2501,3 @@ endmenu # "CPU Power Management"
>  source "drivers/acpi/Kconfig"
>  
>  source "arch/arm64/kvm/Kconfig"
> -
> diff --git a/arch/arm64/kernel/stacktrace.c b/arch/arm64/kernel/stacktrace.c
> index 1d9d51d7627f..7e07911d8694 100644
> --- a/arch/arm64/kernel/stacktrace.c
> +++ b/arch/arm64/kernel/stacktrace.c
> @@ -56,6 +56,7 @@ struct kunwind_state {
>  	enum kunwind_source source;
>  	union unwind_flags flags;
>  	struct pt_regs *regs;
> +	bool end_on_unreliable;
>  };
>  
>  static __always_inline void
> @@ -230,8 +231,26 @@ kunwind_next_frame_record(struct kunwind_state *state)
>  	new_fp = READ_ONCE(record->fp);
>  	new_pc = READ_ONCE(record->lr);
>  
> -	if (!new_fp && !new_pc)
> -		return kunwind_next_frame_record_meta(state);
> +	if (!new_fp && !new_pc) {
> +		int ret;
> +
> +		ret = kunwind_next_frame_record_meta(state);
> +		if (ret < 0) {
> +			/*
> +			 * This covers two different conditions:
> +			 *  1. ret == -ENOENT, unwinding is done.
> +			 *  2. ret == -EINVAL, unwinding hit error.
> +			 */
> +			return ret;
> +		}
> +		/*
> +		 * Searching across exception boundaries. The stack is now
> +		 * unreliable.
> +		 */
> +		if (state->end_on_unreliable)
> +			return -EINVAL;
> +		return 0;
> +	}
>  
>  	unwind_consume_stack(&state->common, info, fp, sizeof(*record));
>  
> @@ -277,21 +296,24 @@ kunwind_next(struct kunwind_state *state)
>  
>  typedef bool (*kunwind_consume_fn)(const struct kunwind_state *state, void *cookie);
>  
> -static __always_inline void
> +static __always_inline int
>  do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
>  	   void *cookie)
>  {
> -	if (kunwind_recover_return_address(state))
> -		return;
> +	int ret;
>  
> -	while (1) {
> -		int ret;
> +	ret = kunwind_recover_return_address(state);
> +	if (ret)
> +		return ret;
>  
> +	while (1) {
>  		if (!consume_state(state, cookie))
> -			break;
> +			return -EINVAL;
>  		ret = kunwind_next(state);
> +		if (ret == -ENOENT)
> +			return 0;
>  		if (ret < 0)
> -			break;
> +			return ret;
>  	}
>  }
>  
> @@ -324,10 +346,10 @@ do_kunwind(struct kunwind_state *state, kunwind_consume_fn consume_state,
>  			: stackinfo_get_unknown();		\
>  	})
>  
> -static __always_inline void
> +static __always_inline int
>  kunwind_stack_walk(kunwind_consume_fn consume_state,
>  		   void *cookie, struct task_struct *task,
> -		   struct pt_regs *regs)
> +		   struct pt_regs *regs, bool end_on_unreliable)
>  {
>  	struct stack_info stacks[] = {
>  		stackinfo_get_task(task),
> @@ -348,11 +370,12 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>  			.stacks = stacks,
>  			.nr_stacks = ARRAY_SIZE(stacks),
>  		},
> +		.end_on_unreliable = end_on_unreliable,
>  	};
>  
>  	if (regs) {
>  		if (task != current)
> -			return;
> +			return -EINVAL;
>  		kunwind_init_from_regs(&state, regs);
>  	} else if (task == current) {
>  		kunwind_init_from_caller(&state);
> @@ -360,7 +383,7 @@ kunwind_stack_walk(kunwind_consume_fn consume_state,
>  		kunwind_init_from_task(&state, task);
>  	}
>  
> -	do_kunwind(&state, consume_state, cookie);
> +	return do_kunwind(&state, consume_state, cookie);
>  }
>  
>  struct kunwind_consume_entry_data {
> @@ -384,7 +407,18 @@ noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry,
>  		.cookie = cookie,
>  	};
>  
> -	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs);
> +	kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, regs, false);
> +}
> +
> +noinline noinstr int arch_stack_walk_reliable(stack_trace_consume_fn consume_entry,
> +			void *cookie, struct task_struct *task)
> +{
> +	struct kunwind_consume_entry_data data = {
> +		.consume_entry = consume_entry,
> +		.cookie = cookie,
> +	};
> +
> +	return kunwind_stack_walk(arch_kunwind_consume_entry, &data, task, NULL, true);
>  }
>  
>  struct bpf_unwind_consume_entry_data {
> @@ -409,7 +443,7 @@ noinline noinstr void arch_bpf_stack_walk(bool (*consume_entry)(void *cookie, u6
>  		.cookie = cookie,
>  	};
>  
> -	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL);
> +	kunwind_stack_walk(arch_bpf_unwind_consume_entry, &data, current, NULL, false);
>  }
>  
>  static const char *state_source_string(const struct kunwind_state *state)
> @@ -456,7 +490,7 @@ void dump_backtrace(struct pt_regs *regs, struct task_struct *tsk,
>  		return;
>  
>  	printk("%sCall trace:\n", loglvl);
> -	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs);
> +	kunwind_stack_walk(dump_backtrace_entry, (void *)loglvl, tsk, regs, false);
>  
>  	put_task_stack(tsk);
>  }
> -- 
> 2.47.1
> 

Tested-by: Andrea della Porta <andrea.porta@suse.com>

Thanks,
Andrea
