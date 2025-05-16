Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9482B231C9F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 22:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747434144; cv=none; b=R3EtLshtJER3sut/2v0qSNyWgl0NctxpBU7Pi3LgnWg+JzXKfE5tP4qQvm/0OKzGzNscxLUTrYnHMmBJn2SYtAqihoqW99ULwHZXKA4sE8J5PFwYhN5Xo5cqQXqPb3yhtUp/qc8r+3N03lq/ZQrHDBD1mlqNf/Eo5hRdDk3v03w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747434144; c=relaxed/simple;
	bh=4aS/MJ652v81b0RnjTHvc021sMU1JhBt0gI30JgFrA0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=pzsKoWTTKV6GH4LQtMZb4jh4EnLWmcxHNlKJDgaj4zPLWGWOBqHo14D3yGW2K48jb4oaT9pOZQhc+ULbJUYABSeqKNujTr+pYRfszKovXigPR1IQAaTe1RBGWT2zjntN8Ku2KdF0QPDKISJlzlvTcBCaiR32zbqQjrvJAM9kz+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PY2hhApc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PY2hhApc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747434141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5fonpJMpGpr/dkcO22JHooEc+eK9j6Tfx1lgo9aG2Wo=;
	b=PY2hhApcj/MrVWCj8HzI72I1z8eN7wIRoCQ/Le0UfGnFqQYxk1RWY0l/SOLxyxO+pCvFBw
	L/3zeq4tyWC+AQqq1pi1IMiI1VX2oVbEoLQF//PlnaExsdEzQhZn7rhZZg+w+U8g9c9+Ha
	N99qw0PRQZyfcQ8NSpJvXVT9DgjhL20=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-63-DWH-8PT9M3is1faLPJHYwQ-1; Fri, 16 May 2025 18:22:20 -0400
X-MC-Unique: DWH-8PT9M3is1faLPJHYwQ-1
X-Mimecast-MFC-AGG-ID: DWH-8PT9M3is1faLPJHYwQ_1747434139
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f6ee43c4a6so68356036d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 15:22:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747434139; x=1748038939;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5fonpJMpGpr/dkcO22JHooEc+eK9j6Tfx1lgo9aG2Wo=;
        b=Vnhsff5dDQteRH9xEdWdfDQawRsEourOCcH3s2GJ4hPSgQNotVlG0lujIfi3oLodvy
         wtUsAR5ku4TCpgArO69jRoeRdbvsWXsH7TB18KJ+1ZpYQcG8u35h5szfmiXiUsJM3pUM
         MvgzHFXjFO8ErucE4D9KtyAH3WiBbyvlDeTE5iAJsv7u51iARe6VSuwbkCxdk8449v22
         b6NEtqOHhr43lSKM+YqQUMHr4DC/1/LzAzccEws93RKF4hDtrCMrPtVJdyDgcDdVVX7A
         Dnlfev5YGSp+aM18O8CZhhKUg9wWjKCQG+0QwbWSESOFWSVg+ZwNeUyrLAzOuTB3G2wF
         dssg==
X-Forwarded-Encrypted: i=1; AJvYcCUe/DTTfO9TKBxW8Nmq2FzlwWZEagHKyjnvBh0T9cT87BuwigU2a3Ed9Rd+11f3Nu6ykM5RKOoB+QuD95U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF8Hl3UY9/ofpVfAYzcUTiCu0g+2scz4E6oqDKw5n9C/eBh4xk
	wS5/ULom6Kei5GPBMnv1C/obAB9aiL6psoBbNv54ZoGMIHXZAhmConpm4l9aPNdH7tiYCki3+L4
	ymR6FRNbmKlNNEJqDNGDUvhvlc/6ZgG3C7lT6NjPPE2+vKrObmwc/Nju0ng6NzaCgkQ==
X-Gm-Gg: ASbGnct0sUriBiKIugAhLEqBeHcbi2Q7bVOaH4GetpxHZt2T5BABDfJ+iN/QsYNJXbL
	QjpBGNbAWh8Tp1cXqM5UK1HKYvWSQuZo+9Txd243kGOGQdK1x3x7HRJLf2icZlM5Xn0qEK+A+6e
	P7g4K0CDDi/WajmKUGAoqbGyFCL77QREQNqzJkuplrq9JPx0YyRtK80u2YFnGXtxjECp7iixcPV
	a4FQCofWDfNIDStcK6PpwrfOZ3y/GnTWXsPR3Lvz6kJ9OEjF3OW/mpnxybpXTuv1jAVbeCJnUU=
X-Received: by 2002:a05:6214:2403:b0:6e8:fee2:aadf with SMTP id 6a1803df08f44-6f8b2d0fd02mr86426226d6.31.1747434139521;
        Fri, 16 May 2025 15:22:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUrIn6rP4ZNfERrYkRl25vG/F/VaADk30h1GiuVp53YChPZqS3M4vyh1WQawf5RzAp5rxlgQ==
X-Received: by 2002:a05:6214:2403:b0:6e8:fee2:aadf with SMTP id 6a1803df08f44-6f8b2d0fd02mr86425186d6.31.1747434137591;
        Fri, 16 May 2025 15:22:17 -0700 (PDT)
Received: from fionn ([76.71.123.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b08ac212sm17299626d6.36.2025.05.16.15.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 15:22:17 -0700 (PDT)
Date: Fri, 16 May 2025 18:22:06 -0400 (EDT)
From: John Kacur <jkacur@redhat.com>
To: Tomas Glozar <tglozar@redhat.com>
cc: Steven Rostedt <rostedt@goodmis.org>, linux-trace-kernel@vger.kernel.org, 
    linux-kernel@vger.kernel.org, Luis Goncalves <lgoncalv@redhat.com>
Subject: Re: [PATCH] rtla: Define _GNU_SOURCE in timerlat_bpf.c
In-Reply-To: <20250430144651.621766-1-tglozar@redhat.com>
Message-ID: <5c64d78a-1650-5404-c2cb-8190627d10fc@redhat.com>
References: <20250430144651.621766-1-tglozar@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Wed, 30 Apr 2025, Tomas Glozar wrote:

> Newer versions of glibc include a definition of struct sched_attr in
> bits/sched.h (included through sched.h which is included by rtla).
> Commit 0eecee340672 ("tools/rtla: fix collision with glibc
> sched_attr/sched_set_attr") has modified the definition of struct
> sched_attr in utils.h, so that it is only applied with older versions of
> glibc that do not define it, in order to prevent build failure.
> 
> The definition in bits/sched.h depends on _GNU_SOURCE.
> timerlat_bpf.c does not define _GNU_SOURCE, making it fall back to the
> definition in utils.h. The latter has two fields less, leading to
> shifted offsets of struct timerlat_params in timerlat_bpf_init.
> 
> Because of the shift, timerlat_bpf_init incorrectly reads
> params->entries as 0 for timerlat-hist and disables the creation of
> histogram maps, causing breakage in BPF sample collection mode:
> 
> $ rtla timerlat hist -d 1s
> Error pulling BPF data
> 
> Fix the issue by also defining _GNU_SOURCE in timerlat_bpf.c.
> 
> Fixes: e34293ddcebd ("rtla/timerlat: Add BPF skeleton to collect samples")
> Signed-off-by: Tomas Glozar <tglozar@redhat.com>
> ---
>  tools/tracing/rtla/src/timerlat_bpf.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tools/tracing/rtla/src/timerlat_bpf.c b/tools/tracing/rtla/src/timerlat_bpf.c
> index 5abee884037a..0bc44ce5d69b 100644
> --- a/tools/tracing/rtla/src/timerlat_bpf.c
> +++ b/tools/tracing/rtla/src/timerlat_bpf.c
> @@ -1,5 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  #ifdef HAVE_BPF_SKEL
> +#define _GNU_SOURCE
>  #include "timerlat.h"
>  #include "timerlat_bpf.h"
>  #include "timerlat.skel.h"
> -- 

This works, and we need it, so
Reviewed-by: John Kacur <jkacur@redhat.com>
--
Question for Tomas, should we spend sometime to make this work for older 
versions of glibc without a definition of struct sched_attr?

