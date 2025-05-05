Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5121F8EF6
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438567; cv=none; b=Od++WrwkmJxaT7UHCSww/7x53sx7gHY8fFCfcU1r6pc/tdRO03dIIt+hObSvbOLbnEOKHZs1YcraU+6rtCLznzAjK0PaQol1d57cxv/3xwshW6MDpy63GATv3nsPmgMEDtXkX9YKTEXLeZaP+kHBc3/atQQXeFnuvO76a1utX1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438567; c=relaxed/simple;
	bh=gvzkYTs5rtpmqTb8VcPZ2BZt4c/wz+av7Ml2LLrsOrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XuQXFlLAJhNK03vPJqszulyUq295ahRbZz7BZwt7e6ukwCFA/1Tb27paBNYX2Gl3T4puWw3GqAClF70GAgb1z37DoM0EI9se+jyZXuCz8qfTn/vOo2k03/96s7S25q6rM1/2nuBWojI33wu5XuTm/P8kPX3xxy50V4V8AZBlO/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cvzRzO5V; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cvzRzO5V"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb415dd8faso629006266b.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746438563; x=1747043363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1BnBvCblRkYEN9Ha75Czu/UHxSFQXfVj92v2hVXdBmw=;
        b=cvzRzO5VSdzYYdu8zwdQc5dPP6cTQ1lEMaSiaO6qdXVWS1vFQyL9eDw6UqSPkpQc7m
         +KVIb95ry0t+iYcjGVzONhlgBoqVi8zXejSnJQxvnT/ucsnAxzc2zeFmh6bx7w/TxyLT
         pSdTJRdsfAz5XdnmHVcppVa4ZlZJmdu81RoVZ1SJFFGaq45p8cLIJMc7zV1Zge7Bd19R
         yCACTwN12kXdhgaNpzTXEFW9HV+XcqnrAUo27YLBMr0CT+7qqQI0bGxHx4YS6+TKulL2
         ansZLDCY4ZlFE+ZyHBve2RELwQiQL2PuMPsq4/eV0dMeeHexBOmlK6WnQIWdk0kCQpRD
         iGyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746438563; x=1747043363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BnBvCblRkYEN9Ha75Czu/UHxSFQXfVj92v2hVXdBmw=;
        b=pSqokcgIIsSVLAWawfIngzYO8IikTMIKHCcocMBjAOV6nYBw4EjSblW8cKX71JkxA8
         uDlwa9sit532wV0exXLsk1KT4cC9/u27EeEFYtmmP2oBiiAdxF5uSVqL+/VzW2Z/m5iW
         3Qej4PQOd6ULyDSUMwmITQpJ8qoj6X8eZKhmv5btMgKc5zkoWvzZZUJDDiVwQ2OMzfWR
         mj1D7Xbej2BWJW6gNELa5p8s5VUnKyiSaMCdAmDyKS44MgFhdeUcGNQ25GXOgV3mX0/X
         450L6cJvbE0rsbN/RrcaqQQNKmwoCyl0pqxkw+xl00l9OiMtGptHkDV6oMjH1FvGzx5G
         VAjA==
X-Forwarded-Encrypted: i=1; AJvYcCUyAyHapdtfDGtF1taeka0Ag1lEeRGbhM6DKcHwAlVjQPoUxVfGr7RgpVwRHS6DO6+rt/D014VuitSoY88=@vger.kernel.org
X-Gm-Message-State: AOJu0YxicOkf50SAaR85WpM8hDJ9sVHBPOBJXfSIciNGrPOp3TjaoEEF
	WVKsXv3wvIKiaYofRmg7pRSLqKfT7eHHRK6oyPfOBojaR5pbL9QUuqN0KYIf3g==
X-Gm-Gg: ASbGncvF+J1koOgAm+M3kCsIzTi6rchPqxJpGMVqT/1BJZ2dhR9LOzBxN6JZXuG3uzh
	HZ90/W2YJklb/f3bs/3GfWfHWUYYu4eLbZqQucUoR/qOtujt2/dXdpRBxtzXkO8uf9SebZQYnPA
	cUKjbi5lrPNT6LyRPOP/5hxkzPbWdlsvrhkThRtPHv8renI9sN1A+zbiYznneqg3KaATNc3iWiM
	yrmrSeQDNhRLvM1X2czDvgAvtjKsYiauJKMZkc5+2cZtwKCpkYG31QjWpavRGtejp2rTj+M20N6
	JLHu4FqN5UEXA0r7OIGgggAsvH/9fHfqDQMgO732Iu4ZIDtO6OqufGaizBRiyZmp+rtaWVRLyAP
	6NKC8H/hEcVyTQV00DA==
X-Google-Smtp-Source: AGHT+IFYGMgq5KfTLL8HI20N+F541w/zDb+X8QB3oV7HJE3GRuklU1l2cXFO8FZH21KvDjj0U5xzlg==
X-Received: by 2002:a17:907:9411:b0:ace:c50a:f87 with SMTP id a640c23a62f3a-ad1a4b040f5mr560069966b.46.1746438563048;
        Mon, 05 May 2025 02:49:23 -0700 (PDT)
Received: from google.com (201.31.90.34.bc.googleusercontent.com. [34.90.31.201])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950ace4sm463710566b.153.2025.05.05.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:49:22 -0700 (PDT)
Date: Mon, 5 May 2025 09:49:17 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bpf: add bpf_msleep_interruptible()
Message-ID: <aBiJnR5MEL5hVXXC@google.com>
References: <20250505063918.3320164-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505063918.3320164-1-senozhatsky@chromium.org>

On Mon, May 05, 2025 at 03:38:59PM +0900, Sergey Senozhatsky wrote:
> bpf_msleep_interruptible() puts a calling context into an
> interruptible sleep.  This function is expected to be used
> for testing only (perhaps in conjunction with fault-injection)
> to simulate various execution delays or timeouts.
>
> Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> ---
>  include/linux/bpf.h            |  1 +
>  include/uapi/linux/bpf.h       |  9 +++++++++
>  kernel/bpf/helpers.c           | 13 +++++++++++++
>  kernel/trace/bpf_trace.c       |  2 ++
>  tools/include/uapi/linux/bpf.h |  9 +++++++++
>  5 files changed, 34 insertions(+)
> 
> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 3f0cc89c0622..85bd1daaa7df 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -3392,6 +3392,7 @@ extern const struct bpf_func_proto bpf_get_retval_proto;
>  extern const struct bpf_func_proto bpf_user_ringbuf_drain_proto;
>  extern const struct bpf_func_proto bpf_cgrp_storage_get_proto;
>  extern const struct bpf_func_proto bpf_cgrp_storage_delete_proto;
> +extern const struct bpf_func_proto bpf_msleep_interruptible_proto;
>  
>  const struct bpf_func_proto *tracing_prog_func_proto(
>    enum bpf_func_id func_id, const struct bpf_prog *prog);
> diff --git a/include/uapi/linux/bpf.h b/include/uapi/linux/bpf.h
> index 71d5ac83cf5d..cbbb6d70a7a3 100644
> --- a/include/uapi/linux/bpf.h
> +++ b/include/uapi/linux/bpf.h
> @@ -5814,6 +5814,14 @@ union bpf_attr {
>   *		0 on success.
>   *
>   *		**-ENOENT** if the bpf_local_storage cannot be found.
> + *
> + * long bpf_msleep_interruptible(long timeout)
> + *	Description
> + *		Make the current task sleep until *timeout* milliseconds have
> + *		elapsed or until a signal is received.
> + *
> + *	Return
> + *		The remaining time of the sleep duration in milliseconds.
>   */
>  #define ___BPF_FUNC_MAPPER(FN, ctx...)			\
>  	FN(unspec, 0, ##ctx)				\
> @@ -6028,6 +6036,7 @@ union bpf_attr {
>  	FN(user_ringbuf_drain, 209, ##ctx)		\
>  	FN(cgrp_storage_get, 210, ##ctx)		\
>  	FN(cgrp_storage_delete, 211, ##ctx)		\
> +	FN(msleep_interruptible, 212, ##ctx)		\
>  	/* This helper list is effectively frozen. If you are trying to	\
>  	 * add a new helper, you should add a kfunc instead which has	\
>  	 * less stability guarantees. See Documentation/bpf/kfuncs.rst	\

I noticed that you've written the newly proposed BPF helper in the
legacy BPF helper form, which I believe is now discouraged, as also
stated within the above comment. You probably want to respin this
patch series having written this newly proposed BPF helper in BPF
kfuncs [0] form instead.

Additionally, as part of your patch series I think you'll also want to
include some selftests.

[0] https://docs.kernel.org/bpf/kfuncs.html

> diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
> index e3a2662f4e33..0a3449c282f2 100644
> --- a/kernel/bpf/helpers.c
> +++ b/kernel/bpf/helpers.c
> @@ -1905,6 +1905,19 @@ static const struct bpf_func_proto bpf_dynptr_data_proto = {
>  	.arg3_type	= ARG_CONST_ALLOC_SIZE_OR_ZERO,
>  };
>  
> +BPF_CALL_1(bpf_msleep_interruptible, long, timeout)
> +{
> +	return msleep_interruptible(timeout);
> +}
> +
> +const struct bpf_func_proto bpf_msleep_interruptible_proto = {
> +	.func		= bpf_msleep_interruptible,
> +	.gpl_only	= false,
> +	.might_sleep	= true,
> +	.ret_type	= RET_INTEGER,
> +	.arg1_type	= ARG_ANYTHING,
> +};
> +
>  const struct bpf_func_proto bpf_get_current_task_proto __weak;
>  const struct bpf_func_proto bpf_get_current_task_btf_proto __weak;
>  const struct bpf_func_proto bpf_probe_read_user_proto __weak;
> diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
> index 52c432a44aeb..8a0b96aed0c0 100644
> --- a/kernel/trace/bpf_trace.c
> +++ b/kernel/trace/bpf_trace.c
> @@ -1475,6 +1475,8 @@ bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
>  		return &bpf_get_branch_snapshot_proto;
>  	case BPF_FUNC_find_vma:
>  		return &bpf_find_vma_proto;
> +	case BPF_FUNC_msleep_interruptible:
> +		return &bpf_msleep_interruptible_proto;
>  	default:
>  		break;
>  	}
> diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/bpf.h
> index 71d5ac83cf5d..cbbb6d70a7a3 100644
> --- a/tools/include/uapi/linux/bpf.h
> +++ b/tools/include/uapi/linux/bpf.h
> @@ -5814,6 +5814,14 @@ union bpf_attr {
>   *		0 on success.
>   *
>   *		**-ENOENT** if the bpf_local_storage cannot be found.
> + *
> + * long bpf_msleep_interruptible(long timeout)
> + *	Description
> + *		Make the current task sleep until *timeout* milliseconds have
> + *		elapsed or until a signal is received.
> + *
> + *	Return
> + *		The remaining time of the sleep duration in milliseconds.
>   */
>  #define ___BPF_FUNC_MAPPER(FN, ctx...)			\
>  	FN(unspec, 0, ##ctx)				\
> @@ -6028,6 +6036,7 @@ union bpf_attr {
>  	FN(user_ringbuf_drain, 209, ##ctx)		\
>  	FN(cgrp_storage_get, 210, ##ctx)		\
>  	FN(cgrp_storage_delete, 211, ##ctx)		\
> +	FN(msleep_interruptible, 212, ##ctx)		\
>  	/* This helper list is effectively frozen. If you are trying to	\
>  	 * add a new helper, you should add a kfunc instead which has	\
>  	 * less stability guarantees. See Documentation/bpf/kfuncs.rst	\
> -- 
> 2.49.0.906.g1f30a19c02-goog
> 
