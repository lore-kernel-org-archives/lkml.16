Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03111C84D6
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948569; cv=none; b=Td5XwNcTLHKmVNMnuVatnoHT4LmS31QKICEPqj055QH6P2B3fmja1gTfBbJ+YtplHePfDgWMq3hfVGycEqsFQUyRLoTMidot9975adVnGljcHyMWB5ldf5oWVQja0hy3W3Hi/fwxGUuTk9Lk4+K+5e/1WHQbQ4GgZ9O0d5CkU1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948569; c=relaxed/simple;
	bh=yD+jwp3XvOuIN+FbHxjIKxsde2qvmEkhMOFeyRmm4vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmaE8/XqfwRBInao6Fy4d6NDa/u6ip8w824IZhsPEtAfhJM8DcBMCtZiWKDt6iREVroZrj7YDsMlZhg9NwT+l1wzX665CzGIS57fNziS0BZllTM0onhP0ejlKIRCaS8TQajRm+ZQfxXxO6Q6IoqliH7OlSLRsgshC7wKNS1h5uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXaCLjI+; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXaCLjI+"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2360ff7ac1bso9277855ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948566; x=1751553366; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwfCb3HStzLYNemG0jhj9xtMv8KEqGsstQp467/a7+Q=;
        b=FXaCLjI+oEOSPPDoiDuKPCrjIXfzGsUgYBcNY6Lfkboanek2aaGumUDVtULfGFcnA+
         VWJD6uykdsglJXrvOO7s0ijzdKjg+bo3q7MldZjkjFyF7FaCgGEthrF+KMeaQ5mzE4kA
         Jy9MxR42vj6IB86HFmRUlKNs4HKRITYPXQfSM04pwCJ3OglS7QqqcmsXfgm88C6Vb3M0
         XgEV/ELbizq30ywqcPNTLSnQ3BsyrBPoNzlf0vZGfJZDGvyviNxnJMVpDGDGxveEx2G0
         YQedV3fdoTW3JmQn9XdsX2DROgUqfad8VMaQq9eK4lDy7gWEEJZrNGhAl+PYY8KeOPB+
         oYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948566; x=1751553366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwfCb3HStzLYNemG0jhj9xtMv8KEqGsstQp467/a7+Q=;
        b=YWaTwVbmEK4kpjxhmMTVuBEsWynRMlgyWwesZB+ncuzOrlwmQLyPLDLH9JPe2fJICz
         5XthED0Ib+vOUZH3rGbh4HG4LlEtuFWGPNzIQt+qugohb5b3NeHkrgx+4prTRVzJr3CJ
         VskilYR16cRg9CG+OAI1T6FeU08NrXOtqvWGj6zsqBd878HI+5VkU7A6G9yynrIzVSbh
         mLI6YxcsgDzOIAV1FZv2QeoWEv/jGkEEIDTHkICo7QWW0tjXwnqKKDeIa/oYGcYlwASK
         VkSRExc92TyMdOXqmH9EDAQZNmYAmQ+Zeic8ze2TddimfgsiTPtBPiQLnT1qUd2/kbuV
         kQ2g==
X-Forwarded-Encrypted: i=1; AJvYcCXhoH/QXwYVPKXqvELv1KYoE+/QvmnOUmDKznOF1Tt2er1dBj6wytbinuyDIPAdMcFvGqcaaeLw3wb89Rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/d/kL1hrRp4tyEnG9Kc1ZyFO/GwPAMLCHa81gkhHCZC6w1V3
	dyrORHHjEibdYwY5lIt73zY2LS6qdkIkIgEPaWJTOujka3aAbu5UQKyG
X-Gm-Gg: ASbGncuiLT6NA3BU23/VvI8M2ku+aupTRvpBjnLFioJ1cvqijK1AQC4fAfCkZXtNvYC
	ijpV62GbbGI2ySAptt5G1LxAOck+ylhTewVt4hB64J0YRZi8kmXbzldBPNGBARYu0v4PGB1fK55
	HIppAcIiuabSSaPapnOyIU7Sf0PTofHi3u4Aspc4WMxUPR9mbQSvQJPg5c6AjCJm8kzJ5KzPRkN
	JIqy0eVRfFxVpSSGTCyhMGdDW4E6H+BgLRrHCqMqbmmrddY2IxC6UuOXV12J/k0KDMkgkrgmD1/
	88SWe3CvSpPwucwW19fXurkLK2gvf7c6C1YICYXaAB+5e7E5D5vv3eYv324P1w==
X-Google-Smtp-Source: AGHT+IEVyDPp9k80VDuUCrLNKQmlEtSXfoludbY3B58xoY26SFn1xly7MqN+BYr/f4jui/IQUVyb7A==
X-Received: by 2002:a17:902:d584:b0:236:7333:f183 with SMTP id d9443c01a7336-238c8741569mr50043525ad.19.1750948565864;
        Thu, 26 Jun 2025 07:36:05 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe329bf2sm38555ad.64.2025.06.26.07.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 07:36:05 -0700 (PDT)
Date: Thu, 26 Jun 2025 10:36:03 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Cheng Yu <serein.chengyu@huawei.com>
Cc: linux@rasmusvillemoes.dk, akpm@linux-foundation.org, travis@sgi.com,
	linux-kernel@vger.kernel.org, zhangqiao22@huawei.com,
	tanghui20@huawei.com, chenweilong@huawei.com,
	judy.chenhui@huawei.com, chenjun102@huawei.com
Subject: Re: [PATCH] bitmap-str: Limit the size of ulen in
 bitmap_parselist_user()
Message-ID: <aF1a0w2scIR8zRnQ@yury>
References: <20250626121903.3086789-1-serein.chengyu@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626121903.3086789-1-serein.chengyu@huawei.com>

On Thu, Jun 26, 2025 at 08:19:03PM +0800, Cheng Yu wrote:
> Wu randomly sets the smp_affinity_list of the specified irq through a

Is this Wu a type of fuzzer, or a person? We don't put persons names
in commit messages, other than in tags section.

> code on the linux-5.10.y kernel:
>     ================================
>     ...
>     memcpy((void*)0x20000080, "/proc/irq/18/smp_affinity_list", 30);
>     res = syscall(__NR_openat, /*fd=*/0xffffffffffffff9cul,
>                   /*file=*/0x20000080ul, /*flags=*/1ul, /*mode=*/0ul);
>     r[0] = res;
>     ...
>     syscall(__NR_write, /*fd=*/r[0], /*arg=*/0x20002100ul,
>             /*len=*/0xfffffdfeul);
>     ...
>     ================================
> 
> Warning will be triggered and the call trace is as follows:

So, can you show the warning itself?

> [   69.732366] Call Trace:
> [   69.732373]  ? show_trace_log_lvl+0x1c1/0x2d9
> [   69.732374]  ? show_trace_log_lvl+0x1c1/0x2d9
> [   69.732379]  ? kmalloc_order+0x28/0xf0
> [   69.732389]  ? __alloc_pages_nodemask+0x287/0x300
> [   69.732393]  ? __warn+0x80/0x100
> [   69.732394]  ? __alloc_pages_nodemask+0x287/0x300
> [   69.732397]  ? report_bug+0x9e/0xc0
> [   69.732400]  ? handle_bug+0x41/0x90
> [   69.732402]  ? exc_invalid_op+0x14/0x70
> [   69.732403]  ? asm_exc_invalid_op+0x12/0x20
> [   69.732405]  ? __alloc_pages_nodemask+0x287/0x300
> [   69.732407]  ? bitmap_parselist+0x120/0x120
> [   69.732409]  kmalloc_order+0x28/0xf0
> [   69.732410]  kmalloc_order_trace+0x19/0x90
> [   69.732414]  memdup_user_nul+0x22/0xa0
> [   69.732415]  bitmap_parselist_user+0x35/0x80
> [   69.732419]  write_irq_affinity.constprop.0.isra.0+0xb9/0x110
> [   69.732422]  proc_reg_write+0x4e/0x90
> [   69.732425]  vfs_write+0xbf/0x290
> [   69.732426]  ksys_write+0x5f/0xe0
> [   69.732428]  do_syscall_64+0x30/0x40
> [   69.732430]  entry_SYSCALL_64_after_hwframe+0x67/0xd1
> 
> It is due to the lack of a check for the maximum value of ulen in
> bitmap_parselist_user().
> 
> Fixes: 4b060420a596 ("bitmap, irq: add smp_affinity_list interface to /proc/irq")
> Signed-off-by: Cheng Yu <serein.chengyu@huawei.com>
> Signed-off-by: Wu Guanghao <wuguanghao3@huawei.com>
> ---
>  lib/bitmap-str.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
> index be745209507a..0b5d9ffe20c6 100644
> --- a/lib/bitmap-str.c
> +++ b/lib/bitmap-str.c
> @@ -419,6 +419,9 @@ int bitmap_parselist_user(const char __user *ubuf,
>  	char *buf;
>  	int ret;
>  
> +	if (ulen > PAGE_SIZE)
> +		return -ENOMEM;

This is wrong. A valid cpulist can easily overflow the PAGE_SIZE
limit, see the CPULIST_FILE_MAX_BYTES() macro.

From general perspective, passing huge cpulists is not restricted now,
and what you're proposing here is the change of UAPI. I generally
agree that kernel should reject sizes like '(unsigned)-EINVAL', but the
change should be broadly discussed and documented.

Currently we don't reject huge sizes because users' scrips may
concatenate cpulists from different sources, and we theoretically may
end up with something like [0-1,3-4] x 1000 times, and it's a valid
pattern.

>  	buf = memdup_user_nul(ubuf, ulen);
>  	if (IS_ERR(buf))
>  		return PTR_ERR(buf);
> -- 
> 2.25.1
