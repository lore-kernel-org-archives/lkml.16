Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0625771
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 06:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743056484; cv=none; b=gteImoZTQvLm2fo6YrWy8rglRx5uUXNwvC6hsEi6IBTkWJcxdYrorKY/39bx2YheL88nuQ8UbDDs4JTRmuCGigvtolvmzxU51vuFUixmiV3/HDy08TEiIuscJj1WhMaY7nXRvYJjr1h7Vn340pTrVZHBoW2fq/e90YOKFbVf3sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743056484; c=relaxed/simple;
	bh=wz7g06T9+IyVxjPU2CNqYvMwL+qAjfcbeojPOHGBNIg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLRHg5wj2B8PSRUVzaaq7W7sln9ZBtLuCwbVdpOcUG0Ut8s++E2zvuJP6vam2R0vP+05oa6NpWOnpbfbUovPgxMPCcwT94+WIv4IpfmYVaj+Bjyt4yuQ68yNU2xxxvyUJltiHpMxqiCcmja4RvzfBL2uBK8yy1wemvPkswx5jOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVcXf+Si; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pVcXf+Si"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4774d68c670so9235781cf.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 23:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743056481; x=1743661281; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjZpaRHfD1Umxo+R51bV2iUPt+iWpjNRuUMsRq8jaIA=;
        b=pVcXf+SiXL6692VykC7uMVH0ZLjBvyHvBMqI1yxfG3N0X2QnELnVVm5e2niF/PA5V5
         i1rnon/B6mdfzsW4Rd7vyqLXQML68dlLhgeIGiWE5ZAtX6oQxc5pUlaZmcfaADOSA3fo
         s/TfQGA4SYOWQGoGgT5o0ZxVDd1gmjJd8njNxEouEw8iQK/Qvy5AE/06yPeGVernwUFJ
         +l9LeknMul4PRRADiYh9SgK2WW+vmQl04FeZBjahD7kMtKAWkN/mgg/2ZC8tFIeiZZC7
         BGMeaFGHgMShCzct2pw3xiA89AJxgO79l9OpHiZIht5ZEBI3GVMcH0IwMEOLdf2FTyvi
         Bm1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743056481; x=1743661281;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EjZpaRHfD1Umxo+R51bV2iUPt+iWpjNRuUMsRq8jaIA=;
        b=svd+g3QzhOhFK9I45x2OPbUvRl0lgulOSWkjPrm6dThAdWTElgrI4vrKubQHP2ZUqT
         FBe/3xgXPI6xC8pkn3j6YT6tK2Vl6ssUAIB04KgPAs+o3Jx0vhsfdVoy1iHwi94EiSGe
         LYsRtjkEQYm3PaagngGdyZCMotBiiOPOWcA6HAqZK9wdbfx9IVZ6QZStMQkrDKK1Jrjz
         LJJ4mbO/ARRViWhtjsRrNgL1XVvhRuxBc18lJ/TK+dZTb2DeEbGunpi5HOakhJ4zmG3Y
         4Z7ZtcsCgpJDKagqgiHRauyUGTn/6aFos/+jwHFFbGLjVWmoiT+okrhG/VkERJd2aSQU
         1aEA==
X-Forwarded-Encrypted: i=1; AJvYcCXhobMqszMBCZHgWOZLleL5wr1pWmloH0o2QYyhoYzAyGcPNjCu1PzkMS0jcRZaN4yv4KazUY9JT+rMI+4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/jo+mONwJ9dMadeH2pQpYj5c8vMfzqz8BzcRcAnM7wsv4+VOb
	iU2wamOSGyYp0njBQs39IqGhmMpmhrKVT8uXgN5rsx/dQxqS+zIert/5GVuNoKVg5p//dOMjfFa
	MqWdf9qWT9uNx3YgWyqRD+WtaVz63U18OYngN
X-Gm-Gg: ASbGncsWmxz+NlYqXxX0uuYDF1NY9losHW97tub343eLIchQIxE2PIRBCnIjFegn5z4
	txHBk4HNq8PbjagGsmDMaYgZOwFsXjHh5IXpE3eqzGiXVT7MUU6nFoKzaq1w2iX2Qm9qPlVesN6
	L2V1RS9KltBxViezdM6p7XBj+YfY4=
X-Google-Smtp-Source: AGHT+IHn5ZnDjkzoC7XvMND87XJOg44tfghgEAuZzea1z8kg6FS7D0n79q1gwjFCJLe+AZI0npFxaG8Nl/ky/7G1qwc=
X-Received: by 2002:a05:622a:5a0a:b0:476:8e3e:2da3 with SMTP id
 d75a77b69052e-4776e1924camr50758751cf.30.1743056481023; Wed, 26 Mar 2025
 23:21:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx> <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
In-Reply-To: <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 27 Mar 2025 07:21:10 +0100
X-Gm-Features: AQ5f1JoDIB2Z5QAp2nNLWuO3dPWKeDawcsEat-roMTWkvrSkw1HQjOuv2jRfmKw
Message-ID: <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
Subject: Re: [tip:timers/core] [posix] 1535cb8028: stress-ng.epoll.ops_per_sec
 36.2% regression
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, 
	lkp@intel.com, linux-kernel@vger.kernel.org, x86@kernel.org, 
	Benjamin Segall <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 10:11=E2=80=AFPM Mateusz Guzik <mjguzik@gmail.com> =
wrote:
>
> On Wed, Mar 26, 2025 at 09:07:51AM +0100, Thomas Gleixner wrote:
> > On Mon, Mar 24 2025 at 14:39, kernel test robot wrote:
> > > kernel test robot noticed a 36.2% regression of stress-ng.epoll.ops_p=
er_sec on:
> > >
> > > commit: 1535cb80286e6fbc834f075039f85274538543c7 ("posix-timers: Impr=
ove hash table performance")
> > > https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git timers/core
> > >
> [snip]
> > > | testcase: change | stress-ng: stress-ng.epoll.ops_per_sec 124.9% im=
provement                       |
> >
> > How on earth can this commit result in both a 36% regression and a 25%
> > improvement with the same test?
> >
> > Unfortunately I can't reproduce any of it. I checked the epoll test
> > source and it uses a posix timer, but that commit makes the hash less
> > contended so there is zero explanation.
> >
>
> The short summary is:
> 1. your change is fine

Let me rephrase this.

Absolutely wonderful series, thanks a lot Thomas for doing it.

Next bottlenecks are now these ones, but showing up in synthetic
benchmarks only.


    33.36%  timer_storm      [kernel.kallsyms]           [k]
inc_rlimit_get_ucounts
            |
             --33.34%--inc_rlimit_get_ucounts
                       posixtimer_init_sigqueue
                       do_timer_create
                       __x64_sys_timer_create
                       do_syscall_64
                       entry_SYSCALL_64_after_hwframe
                       ___timer_create
                       0xe

    32.85%  timer_storm      [kernel.kallsyms]           [k]
dec_rlimit_put_ucounts
            |
             --32.83%--dec_rlimit_put_ucounts
                       posix_timer_unhash_and_free
                       __se_sys_timer_delete
                       do_syscall_64
                       entry_SYSCALL_64_after_hwframe
                       ___timer_delete

     9.61%  timer_storm      [kernel.kallsyms]           [k]
queued_spin_lock_slowpath
            |
            ---queued_spin_lock_slowpath
               |
               |--8.92%--_raw_spin_lock_irqsave
               |          |
               |           --8.91%--get_partial_node
               |                     ___slab_alloc
               |                     kmem_cache_alloc_noprof
               |                     do_timer_create
               |                     __x64_sys_timer_create
               |                     do_syscall_64
               |                     entry_SYSCALL_64_after_hwframe
               |                     ___timer_create
               |                     0xe
               |
