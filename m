Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E9F27FB12
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411804; cv=none; b=nk2e45i1n/di2/pqtN6qczuJrkzNt/cryrvdS0WKLEjBgULzBeIVEC1rzbAvGqCWbwja0Ld/wuouH+G5rmGGd1NudvpRjNZ+9PpRV492uMByJ7n/F7zjAWMPRwbOw+yrkGCU/IzKGjVAMQVUQ90ygqn/h8CJfmTLUKUqgEWrqT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411804; c=relaxed/simple;
	bh=JPId0eQLV4dcv3sTxXz97sPgv64ajB4V4FeCupYJa+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KM3V5plTQG7B/lAKHOr45lcG2HLBly9GZYnoaHvyTs8bQ1Q69jYAoMy7YfkWmYnd/G1D3CUbXKytepFlzG5YU41rn1KKhnYrU1nv0EyDrYyPMghREKLAsIBDKMsE1ASjsxoiYJ/10clcT3UVtSTaijJVn8rBOpNnQuJKVF8fpF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i8RHISMv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i8RHISMv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750411800;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hd8VIzwj8HNj19g6D59MdbOy8OI+i4DYZ/1MoGvCyOM=;
	b=i8RHISMvY8D1Ie/YWls8jDz7IcUT/2uV0xqZKOkeGBkL1TLQWwWpW3hExeE4CYfwK+lRan
	gU2KT1oJ86dWAEXlJQMrogtzxSJMn3Ah+DYrjXWXgqgHgHIX/tT5T3M1J95aSRASmDNGe7
	kolioOH/FseAbAgVPkS8c50t6o/pm70=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-374-kP3J8eCcMSax1RfdP_gIDg-1; Fri, 20 Jun 2025 05:29:58 -0400
X-MC-Unique: kP3J8eCcMSax1RfdP_gIDg-1
X-Mimecast-MFC-AGG-ID: kP3J8eCcMSax1RfdP_gIDg_1750411797
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eee2398bso702259f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:29:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411797; x=1751016597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hd8VIzwj8HNj19g6D59MdbOy8OI+i4DYZ/1MoGvCyOM=;
        b=RE3Ci9zXHiJwjsgRxPrZIU5h2DEJimycKpkTihmouwZj903bJbNc3C6sNZjjnoFmo9
         6EbzDv/w43ECI3AQvQ3io+zSp9V1Go6fQj4oL1LM3TmziX9AzuRsxEVeUkBewoSqrGjw
         LcuB+YG3K6N0K+MsFXCUJwdKDWZHc2eLp3y0T7GAo/29gzJBDv4IEaaOthu1euCY034U
         bzy6Wfxj5fY7na3svAR7a+rV6k7FzeEz/DqIkxndQflbT7vwIZV1HVYpcarcjuyI/PYh
         o5Wrq7webi1R8HixxzLGP8t3BLG+6SvrEBS6sHh8Xa5FBr4Ej1Uv9AFOtw70Y9OCEz29
         GZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCXsLGStA0fcfR7lzxnMAUdjSsJ3j0txmepqNuaJSJLw65opINZELBJ807FugGozDGV+DxWafBRiIBhkKfw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKwIqPY6IY/adLmObVVFdETNhjPmOOCO96Ej5h050m4vdN8nA
	pWPM5wC1CGXdm7NKQSttZpCyKxEI/gKND7UCC3XUOj2/tHDFc/K2fOfRIEjwRfjX3Mluv/t9Wcr
	dsiAAF9wv+QJGWnQ17a8YNHC5L01ZCWBnP8n0omQ6KCBNSohs9mdu9wwjLCyDNRzCMQ==
X-Gm-Gg: ASbGncs1Gmg2ns8Ja1jHbbsex9d9YI0/tBboVnvFpZtN6umY3XZtRCeueLbrT6jcrbW
	yaeo6Zz88jYtMEq/3K7YwuWvGKhZowIogFGXiFJcJz/x4rIsEtUWWvvB3jtZdlH4qTMdvgKDmj2
	wYYnOTHzh7/KBJ+xfHxXoXt1W/cRLDP0cpC/DempMSt5J/PVQP4m4e/y1dnBiWosLI1tC91+8Yx
	qx3mPQl3qMp4Xbqe+EU8mhOd1/zvYGuZyVlGM79gh8AUMgxnQddeIVV5Mt2aMN9clMKJoUDberV
	hlA2G8ZJ4PmuHv/sItUaM+ozX23Zh9YJJQ/Ugk2GVpUojIkoqPc=
X-Received: by 2002:a05:6000:4b06:b0:3a4:d98d:76b9 with SMTP id ffacd0b85a97d-3a6d12e1bebmr1516430f8f.41.1750411797390;
        Fri, 20 Jun 2025 02:29:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiY3PBWywzu2JN+DUjCDMKvvRM5vsrzy1ObZgzrMeG3d4lY3DoBZQAiDIf3DKVG0o29mGqJA==
X-Received: by 2002:a05:6000:4b06:b0:3a4:d98d:76b9 with SMTP id ffacd0b85a97d-3a6d12e1bebmr1516414f8f.41.1750411796919;
        Fri, 20 Jun 2025 02:29:56 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.43.84.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4536366326fsm26619345e9.38.2025.06.20.02.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 02:29:56 -0700 (PDT)
Date: Fri, 20 Jun 2025 11:29:52 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Marcel Ziswiler <marcel.ziswiler@codethink.co.uk>
Cc: luca abeni <luca.abeni@santannapisa.it>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vineeth Pillai <vineeth@bitbyteword.org>
Subject: Re: SCHED_DEADLINE tasks missing their deadline with
 SCHED_FLAG_RECLAIM jobs in the mix (using GRUB)
Message-ID: <aFUqELdqM8VcyNCh@jlelli-thinkpadt14gen4.remote.csb>
References: <aBTO3r6Py_emwf1Y@jlelli-thinkpadt14gen4.remote.csb>
 <f532441d8b3cf35e7058305fd9cd3f2cbd3a9fac.camel@codethink.co.uk>
 <20250507222549.183e0b4a@nowhere>
 <92690eb9158c1019dc0945f8298800cad17cae05.camel@codethink.co.uk>
 <20250523214603.043833e3@nowhere>
 <c91a117401225290fbf0390f2ce78c3e0fb3b2d5.camel@codethink.co.uk>
 <aDgrOWgYKb1_xMT6@jlelli-thinkpadt14gen4.remote.csb>
 <8d6dd3013b05225541821132398cb7615cdd874e.camel@codethink.co.uk>
 <aFFdseGAqImLtVCH@jlelli-thinkpadt14gen4.remote.csb>
 <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <880890e699117e02d984ba2bb391c63be5fd71e8.camel@codethink.co.uk>

On 18/06/25 12:24, Marcel Ziswiler wrote:

...

> Yeah, granularity/precision is definitely a concern. We initially even started off with 1 ms sched_deadline =
> sched_period for task 1 but neither of our test systems (amd64-based Intel NUCs and aarch64-based RADXA
> ROCK5Bs) was able to handle that very well. So we opted to increase it to 5 ms which is still rather stressful.

Ah, OK, even though I meant granularity of the 'fake' runtime of the
tasks. In rt-app we simulate it by essentially reading the clock until
that much runtime elapsed (or performing floating point operations) and
in some cases is not super tight.

For runtime enforcement (dl_runtime) and/or period/deadline (dl_{period,
deadline}), did you try enabling HRTICK_DL sched feature? It is kind of
required for parameters under 1ms if one wants precise behavior.

> > Order is the same as above, last tasks gets constantly throttled and
> > makes no harm to the rest.
> > 
> > With reclaim (only last misbehaving task) we indeed seem to have a problem:
> > 
> > https://github.com/jlelli/misc/blob/main/deadline-reclaim.png
> > 
> > Essentially all other tasks are experiencing long wakeup delays that
> > cause deadline misses. The bad behaving task seems to be able to almost
> > monopolize the CPU. Interesting to notice that, even if I left max
> > available bandwidth to 95%, the CPU is busy at 100%.
> 
> Yeah, pretty much completely overloaded.
> 
> > So, yeah, Luca, I think we have a problem. :-)
> > 
> > Will try to find more time soon and keep looking into this.
> 
> Thank you very much and just let me know if I can help in any way.

I have been playing a little more with this and noticed (by chance) that
after writing a value on sched_rt_runtime_us (even the 950000 default)
this seem to 'work' - I don't see deadline misses anymore.

I thus have moved my attention to GRUB related per-cpu variables [1] and
noticed something that looks fishy with extra_bw: after boot and w/o any
DEADLINE tasks around (other than dl_servers) all dl_rqs have different
values [2]. E.g.,

  extra_bw   : (u64)447170
  extra_bw   : (u64)604454
  extra_bw   : (u64)656882
  extra_bw   : (u64)691834
  extra_bw   : (u64)718048
  extra_bw   : (u64)739018
  extra_bw   : (u64)756494
  extra_bw   : (u64)771472
  extra_bw   : (u64)784578
  extra_bw   : (u64)796228
  ...

When we write a value to sched_rt_runtime_us only extra_bw of the first
cpu of a root_domain gets updated. So, this might be the reason why
things seem to improve with single CPU domains like in the situation at
hand, but still probably broken in general. I think the issue here is
that we end up calling init_dl_rq_bw_ratio() only for the first cpu
after the introduction of dl_bw_visited() functionality.

So, this might be one thing to look at, but I am honestly still confused
by why we have weird numbers as the above after boot. Also a bit
confused by the actual meaning and purpose of the 5 GRUB variables we
have to deal with.

Luca, Vineeth (for the recent introduction of max_bw), maybe we could
take a step back and re-check (and maybe and document better :) what
each variable is meant to do and how it gets updated?

Thanks!
Juri

1 - Starts at https://elixir.bootlin.com/linux/v6.16-rc2/source/kernel/sched/sched.h#L866
2 - The drgn script I am using
---
#!/usr/bin/env drgn

desc = """
This is a drgn script to show the current root domains configuration. For more
info on drgn, visit https://github.com/osandov/drgn.
"""

import os
import argparse

import drgn
from drgn import FaultError, NULL, Object, alignof, cast, container_of, execscript, implicit_convert, offsetof, reinterpret, sizeof, stack_trace
from drgn.helpers.common import *
from drgn.helpers.linux import *

def print_dl_bws_info():

    print("Retrieving dl_rq  Information:")

    runqueues = prog['runqueues']

    for cpu_id in for_each_possible_cpu(prog):
        try:
            rq = per_cpu(runqueues, cpu_id)

            dl_rq = rq.dl

            print(f"  From CPU: {cpu_id}")

            print(f"  running_bw : {dl_rq.running_bw}")
            print(f"  this_bw    : {dl_rq.this_bw}")
            print(f"  extra_bw   : {dl_rq.extra_bw}")
            print(f"  max_bw     : {dl_rq.max_bw}")
            print(f"  bw_ratio   : {dl_rq.bw_ratio}")

        except drgn.FaultError as fe:
            print(f"  (CPU {cpu_id}: Fault accessing kernel memory: {fe})")
        except AttributeError as ae:
            print(f"  (CPU {cpu_id}: Missing attribute for dl_rq (kernel struct change?): {ae})")
        except Exception as e:
            print(f"  (CPU {cpu_id}: An unexpected error occurred: {e})")

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description=desc,
                                     formatter_class=argparse.RawTextHelpFormatter)
    args = parser.parse_args()

    print_dl_bws_info()
---

