Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C092EAB67
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 15:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750434345; cv=none; b=gKEwcwEie930RrF6XFPQRNgZP4d2yQW1qGcCZNo7nCXyjOHcGrmFkagTSRAOiZjfmgEtL59fMh92E3WIICCcwxi90cNHpBPiWcy+Q8f3Ym3FM9hMgTWjesUZsj/5yT5kbVzKhvT+NtDSeuj0Nkc/BJPHy24k8FWP0fa+j9ewTGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750434345; c=relaxed/simple;
	bh=9HGUuLKucGQxXQmt3jlyStZam8b2x9uuQn3iyTypahk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3Cj4m/V8RMeuH7NIPaHRb5hKCWycD6CzRBxdCjETydS49akj8DjeyJXE2Hhhx7vLaR2YWS2fMlM/NmAyprvaxMTUnRYUMUwHtNy2msJDdZhHuFip4oY1oIlkdYNLvanl2YWI6v5zhjr6MKRHgmCbe0CghNIChbyuDLx2Ilitao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8V1vKbt; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8V1vKbt"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-553b584ac96so2208654e87.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750434341; x=1751039141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4gHMbfrP62AyybD3k1CrUQ7A0/RCXBAPC12kLOvMpU=;
        b=j8V1vKbtWcCTLz2YCi3LWBWxmKxJYPID2w8SIo6hSchnrxRQOG+DmHzRypKz3gY+z6
         Fe8GTm6o3lC7i5hmJ1DvM92PFKH5pJQasDxxXOUvwcEwUE15yfqlKshrd2ASTT5GR4Xn
         k7yDfnWQFJOAmb96qAdxRKIe5gbl4WvUB4a+rCC9WWpyx7VZRMAZxdIPx1G8FbsXULqL
         StO2YFIY2p1dcUq02AZRpynOtn+GjWfP1yWgxB/J11qtHbq1sEBIzXO5Hj29xqPn7E9E
         jCOZTTTOO0OsXnv/5x0ksb5kx5+fnUlxLiBqhMIAOVvDHWIZW+Ry5DQ35MPGH04dcBn6
         KctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434341; x=1751039141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4gHMbfrP62AyybD3k1CrUQ7A0/RCXBAPC12kLOvMpU=;
        b=Kq2mt6v8On5jmOmfluTW5QIt/GBTP+dEF2v6IJgATAK1jwbk3SPSUvHcbivSZRqhwV
         Dz+iOyDoi6CsdoJi8u3lWM70jTKq9+6fjh3GdMqhKF7gaLu8nOsFPQpmn8IRQNcMPC6c
         c56AmpubfMrNAmvKeSicsoyJ026SrrU+Y1ntGUVhKJlW0RAJGtqlHfxn2L+H29PBbGyS
         i33gzlOU2HBuCZUWOreYu3q3CfFaq/4XHsV+m46u8bAjPn4MrFQJLt1lyDtm7QLKnDRN
         ud/M66Goq8aUgVpZhFKJG2MIPyo1mjU11zdtE7CUdVqcwo6kRfIDyuWkcTDgz2zIMhQW
         Xh4g==
X-Forwarded-Encrypted: i=1; AJvYcCXsOD3kFZZYmbsipQgmHH2U6wbTqJ04JLRP8NtQfdcYF+Op9Bxoa079bN2Tzix8WrUf+9WqXgEP6IW87ME=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxIe6aTPoEQcF5/FR3UVQXvS7ipUEm184i/hMSpmf7AzmRBwej
	r6vFIrU7M1vv5jF9T4dgr5EzCdtDrJrgeK5WPsqNvPNI1hUoos+d/hPp
X-Gm-Gg: ASbGncuiP5meQQBkDC0s4DXjPCLJpv2sJ5djAokdUEcEMU3dvlZ0NS8MqT+z5X/t/en
	YGDib/QwxyVJPAVUYEpMUCxaWwHopamOLPtZCXXDK1TldqKCOVcsb4cAj1fUF7oXrELL5hV/lw3
	eoG5syho+h+1FlCLJQV6nhbRxqOsa1esnN7PWArHgiGV8JENBeE/tGtQ7h/j0EdjFohC1Uqaq2R
	2ZWWgvYNTNoJJyrWTUkzTz2rfbroujI1++y9OJ3x3eAPaJXXF+xNWeP0+m2CAdE9cxXC51C6I/I
	UhG2Jd9Fsn+i3HDPGNhPH15cOf8dKyVV7UquQBEcRM9DiS8cWxG+UgbcxtpmedOvV6TO2AmblFF
	65g==
X-Google-Smtp-Source: AGHT+IHie5DgDR9fAEvkFZRLnTQygV7sMClPhEOHfnmOPQG3XhthUwEw/pgKPY8+lQ5Ma1A4lzeVSg==
X-Received: by 2002:a05:6512:3e17:b0:550:e608:410b with SMTP id 2adb3069b0e04-553e3bfe5dcmr1300695e87.33.1750434340878;
        Fri, 20 Jun 2025 08:45:40 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:4fb5:f16a:579c:6dcb])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553e41cc3bdsm321721e87.216.2025.06.20.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:45:40 -0700 (PDT)
Date: Fri, 20 Jun 2025 17:45:39 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Hao Ge <hao.ge@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Suren Baghdasaryan <surenb@google.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Hao Ge <gehao@kylinos.cn>
Subject: Re: [PATCH] mm/alloc_tag: Fix the kmemleak false positive issue in
 the allocation of the percpu variable tag->counters
Message-ID: <qjmnlgowadwtndmwween63mmpi2krtbioagani4paorzgcecaa@e625xdk4ya52>
References: <20250619183154.2122608-1-hao.ge@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619183154.2122608-1-hao.ge@linux.dev>

Hi,

On 2025-06-20 02:31:54 +0800, Hao Ge wrote:
> From: Hao Ge <gehao@kylinos.cn>
> 
> When loading a module, as long as the module has memory
> allocation operations, kmemleak produces a false positive
> report that resembles the following:
> 
> unreferenced object (percpu) 0x7dfd232a1650 (size 16):
>   comm "modprobe", pid 1301, jiffies 4294940249
>   hex dump (first 16 bytes on cpu 2):
>     00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 0):
>     kmemleak_alloc_percpu+0xb4/0xd0
>     pcpu_alloc_noprof+0x700/0x1098
>     load_module+0xd4/0x348
>     codetag_module_init+0x20c/0x450
>     codetag_load_module+0x70/0xb8
>     load_module+0xef8/0x1608
>     init_module_from_file+0xec/0x158
>     idempotent_init_module+0x354/0x608
>     __arm64_sys_finit_module+0xbc/0x150
>     invoke_syscall+0xd4/0x258
>     el0_svc_common.constprop.0+0xb4/0x240
>     do_el0_svc+0x48/0x68
>     el0_svc+0x40/0xf8
>     el0t_64_sync_handler+0x10c/0x138
>     el0t_64_sync+0x1ac/0x1b0
> 
> This is because the module can only indirectly reference alloc_tag_counters
> through the alloc_tag section, which misleads kmemleak.
> 
> However, we don't have a kmemleak ignore interface for percpu
> allocations yet. So let's create one and invoke it for tag->counters.
> 
> Fixes: 12ca42c23775 ("alloc_tag: allocate percpu counters for module tags dynamically")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---
>  include/linux/kmemleak.h |  1 +
>  lib/alloc_tag.c          |  8 +++++++-
>  mm/kmemleak.c            | 14 ++++++++++++++
>  3 files changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/kmemleak.h b/include/linux/kmemleak.h
> index 93a73c076d16..2ea8e66bf689 100644
> --- a/include/linux/kmemleak.h
> +++ b/include/linux/kmemleak.h
> @@ -28,6 +28,7 @@ extern void kmemleak_update_trace(const void *ptr) __ref;
>  extern void kmemleak_not_leak(const void *ptr) __ref;
>  extern void kmemleak_transient_leak(const void *ptr) __ref;
>  extern void kmemleak_ignore(const void *ptr) __ref;

> +extern void kmemleak_igonore_percpu(const void __percpu *ptr) __ref;

Note that there's no stub defined in the #else block, which means this
will fail to build if CONFIG_DEBUG_KMEMLEAK is disabled.

>  extern void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp) __ref;
>  extern void kmemleak_no_scan(const void *ptr) __ref;
>  extern void kmemleak_alloc_phys(phys_addr_t phys, size_t size,
> diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
> index d48b80f3f007..de6dcf4ea0f5 100644
> --- a/lib/alloc_tag.c
> +++ b/lib/alloc_tag.c
> @@ -10,6 +10,7 @@
>  #include <linux/seq_buf.h>
>  #include <linux/seq_file.h>
>  #include <linux/vmalloc.h>
> +#include <linux/kmemleak.h>
>  
>  #define ALLOCINFO_FILE_NAME		"allocinfo"
>  #define MODULE_ALLOC_TAG_VMAP_SIZE	(100000UL * sizeof(struct alloc_tag))
> @@ -632,8 +633,13 @@ static int load_module(struct module *mod, struct codetag *start, struct codetag
>  			       mod->name);
>  			return -ENOMEM;
>  		}
> -	}
>  
> +		/*
> +		 * Avoid a kmemleak false positive. The pointer to the counters is stored
> +		 * in the alloc_tag section of the module and cannot be directly accessed.
> +		 */
> +		kmemleak_igonore_percpu(tag->counters);
> +	}
>  	return 0;
>  }
>  
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index da9cee34ee1b..8797fe88861e 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -1246,6 +1246,20 @@ void __ref kmemleak_transient_leak(const void *ptr)
>  }
>  EXPORT_SYMBOL(kmemleak_transient_leak);
>  
> +/**

> + * kmemleak_ignore_phys - similar to kmemleak_ignore but taking a percpu

This should match with the function below.

> + *			  address argument
> + * @ptr:	percpu address of the object
> + */
> +void __ref kmemleak_igonore_percpu(const void __percpu *ptr)
> +{
> +	pr_debug("%s(0x%px)\n", __func__, ptr);
> +
> +	if (kmemleak_enabled && ptr && !IS_ERR_PCPU(ptr))
> +		make_black_object((unsigned long)ptr, OBJECT_PERCPU);
> +}
> +EXPORT_SYMBOL_GPL(kmemleak_igonore_percpu);
> +
>  /**
>   * kmemleak_ignore - ignore an allocated object
>   * @ptr:	pointer to beginning of the object
> -- 
> 2.25.1
> 

s/igonore/ignore/

The commit summary should probably also be shortened, it is recommended
to be at most 70-75 characters[1]. Perhaps something like

mm/alloc_tag: Fix kmemleak false positive in percpu tag->counters

could be appropriate?

Regards,
Klara Modin

Link: https://www.kernel.org/doc/html/latest/process/submitting-patches.html [1]
