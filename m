Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302791C84A0
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138354; cv=none; b=p6C7+TdedKfFcmkTbaYUe6bAnNb71gwR7VfO1HatJWba7o0xVahmA3MGxVWwKf4ShZO6bkjLH+TmGSPdao6VFJR4CaHBrc0CjFqnubmM0b2HXaK74058oIAwq9vmq1GElzTENjRmFg/W0XKZZk1CqtcZ9mdfcYKZsjVA+y7088k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138354; c=relaxed/simple;
	bh=HPuCt+1fD/pUI/mXntTqmuQxT8nb9RKQ6nUZLoUxe8E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qGabLYBseAVq18FuYuDLkNzBQID/Tps5KeQ369CxB4V+2yEFduBOBFLrP6zf6T9HSN2YiX6ZywG8bgeuSNJ15UnHTWFa6PHXupiuQdJJzrt0qbEKaxcwjGonDhNz0FauVhFtfuDs1BIL1rVwUxp2qspneti06ygsDcObDnPKfto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GYImWMvg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GYImWMvg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-441c122fa56so22027465e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 05:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747138351; x=1747743151; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tqJ7N5MPCKIBPZ28ZuVfeZRrV5rqQYI+Sww0v7Ls2co=;
        b=GYImWMvgCqa7zWkPOesZWpGLBw4x+mrlUNMR/dn9+29VdSR48VV7cpczJ6LF7s+4Sk
         3IxW8Ak6/33lUaDtaFv828ZiL0qNnhTGcxxHdbTi10neJLq4FMrYI7/JSDk7PbnI0lsY
         mYWxWioNDQREC6rslbit3Mbv+v9ImcTGwxU6IZ8hhpqJwjej/ndzfcMtMPhdMRwGwFnk
         dUAtrkMhpFyrLWSEgE5BdzvjahsuJ5CFJlMpBwHJ4BbVIRPf7cao2RyP8r7Or7ioAtto
         occI4+pHRLMQLinaHyMMe11fF0bpPbTEU6y3X9j5dyevyU/bugRwfeEG90y2fVFy8akD
         QCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747138351; x=1747743151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqJ7N5MPCKIBPZ28ZuVfeZRrV5rqQYI+Sww0v7Ls2co=;
        b=Iwja4ESHcp39wVZ8IwbFvDqSWzqo2SJ3pNothcjRF46ZxVgAPutykMGPIBfBKPT3Oe
         tSZiK0+beqJVwFX7ys3xGwHOTExrp040dMZY0isY9TWvM7D7pmMELb94yGVTVBT+lrWO
         Za7wYEE1qtSK35oKpWS1KsFmdvHvUtPH2GAed2oDTSyQkMUQ5WE3aOhS1UWneKjVTvBL
         fFPYkG+QhWY0q7w9wU14Z77zasGAl1fEBxIqAIhHTXh1YuAZWHykn1VxM9sfdPv/Jr+t
         xmUsahLjfXlcNXdkOGsXucV2oY4fDUECZn4YZxUFi2l3cvSe3QNvlIY5i6KH0k0cf9i4
         TBlA==
X-Forwarded-Encrypted: i=1; AJvYcCUapnsmYGNwGyykGIa+r8eza/EgUnUSfPSM+6bCPGUki2asonEjVa8xy8noMZOusLIePtPpsxD3IENNn+I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG5d/mS8UT/hm9z57qElPbB++VPPYRMjB4X1ii+3qbo8Li5Kh9
	Bn3NQInm/RQLKWj0YAL2J2eDFaZxv6E9PmLtRsGmriVwrysA445g/ItUs+bddPOYEiULAzqmKC+
	CtzOQlTtd9g==
X-Google-Smtp-Source: AGHT+IG1OsKgvOvWxbxMpIyjNij9qpe7ZgQZFFjSE4GFLCMtcMJZvIlysSCvcCV8dJuwPiyPNy+cphTfNr8caQ==
X-Received: from wmbdr13.prod.google.com ([2002:a05:600c:608d:b0:441:b607:4ec0])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:40e0:b0:3a2:3c51:7df0 with SMTP id ffacd0b85a97d-3a23c51810fmr3866676f8f.49.1747138351600;
 Tue, 13 May 2025 05:12:31 -0700 (PDT)
Date: Tue, 13 May 2025 12:12:29 +0000
In-Reply-To: <20250510160335.1898-1-ujwal.kundur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501163827.2598-1-ujwal.kundur@gmail.com> <20250510160335.1898-1-ujwal.kundur@gmail.com>
X-Mailer: aerc 0.20.0
Message-ID: <D9V0UTL5BCLM.1WHR6F4UN14QQ@google.com>
Subject: Re: [PATCH v3 1/1] selftests/mm/uffd: Refactor non-composite global
 vars into struct
From: Brendan Jackman <jackmanb@google.com>
To: Ujwal Kundur <ujwal.kundur@gmail.com>, <akpm@linux-foundation.org>, 
	<peterx@redhat.com>, <shuah@kernel.org>
Cc: <linux-mm@kvack.org>, <linux-kselftest@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat May 10, 2025 at 4:03 PM UTC, Ujwal Kundur wrote:
> Refactor macros and non-composite global variable definitions into a
> struct that is defined at the start of a test and is passed around
> instead of relying on global vars.
>
> Signed-off-by: Ujwal Kundur <ujwal.kundur@gmail.com>

Tested-by: Brendan Jackman <jackmanb@google.com

Using this hacked to enable the uffd tests (I disable them normally
because they're flaky):

https://github.com/bjackman/linux/blob/github-base/.github/scripts/run_local.sh

> ---
>  Changes since v2:
>  - redo patch on mm-new branch
>  Changes since v1:
>  - indentation fixes
>  - squash into single patch to assist bisections

Thanks for this.

> -static void retry_copy_page(int ufd, struct uffdio_copy *uffdio_copy,
> -			    unsigned long offset)
> +static void retry_copy_page(uffd_global_test_opts_t *gopts, struct uffdio_copy *uffdio_copy,
> +							unsigned long offset)
>  {
> -	uffd_test_ops->alias_mapping(&uffdio_copy->dst,
> -				     uffdio_copy->len,
> -				     offset);
> -	if (ioctl(ufd, UFFDIO_COPY, uffdio_copy)) {
> +	uffd_test_ops->alias_mapping(gopts,
> +								&uffdio_copy->dst,
> +								uffdio_copy->len,
> +								offset);

Looks like your editor got a bit excited here :D

There are a few other places where this happened too, e.g. the
are_count() declaration and there's a pthread_create_call() that's quite
messed up.

Unfortunately I don't know of any tool that can find/fix these issues
automatically without also messing up the whole file. Could you just
do a visual skim and fix what you can spot?

>  static void sigalrm(int sig)
>  {
>  	if (sig != SIGALRM)
>  		abort();
> -	test_uffdio_copy_eexist = true;
> +	// TODO: Set this without access to global vars
> +	// gopts->test_uffdio_copy_eexist = true;

Did you mean to leave this like that?

> @@ -1734,6 +1737,27 @@ int main(int argc, char *argv[])
>  		}
>  		for (j = 0; j < n_mems; j++) {
>  			mem_type = &mem_types[j];
> +
> +			// Initialize global test options

Wrong comment style here

> +			uffd_global_test_opts_t gopts;
> +
> +			gopts.map_shared = mem_type->shared;
> +			uffd_test_ops = mem_type->mem_ops;
> +			uffd_test_case_ops = test->test_case_ops;
> +
> +			if (mem_type->mem_flag & (MEM_HUGETLB_PRIVATE | MEM_HUGETLB))
> +				gopts.page_size = default_huge_page_size();
> +			else
> +				gopts.page_size = psize();
> +
> +			/* Ensure we have at least 2 pages */
> +			gopts.nr_pages = MAX(UFFD_TEST_MEM_SIZE, gopts.page_size * 2) / gopts.page_size;
> +			/* TODO: remove this global var.. it's so ugly */

That's done :)

> +			gopts.nr_parallel = 1;
> +
> +			/* Initialize test arguments */

(This comment seems like noise? I could be wrong, not a big deal).


Thanks for these improvements. Bit of a hasty review and I'm not really
qualified to comment on the test logic itself, but aside from that and
my nits:

Reviewed-by: Brendan Jackman <jackmanb@google.com>
