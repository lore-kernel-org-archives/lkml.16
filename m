Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C112580CB
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204663; cv=none; b=r5QsH0mUFin/5ABrB3BqrTMggeKesnIs8RVr3oqQVdF3PoV3UsqBvSmyLN0HPP6YOMeU+v0HT7v0yCOyzk3OYEqP7ApRfgrN762zWeEKvpiDDIHRpJrMCKr7E/gzhnwEaAhbv5rlgJIsiOsQYTbbX9c4uy3sJBexYQ+riVAfmc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204663; c=relaxed/simple;
	bh=x90YashPsaPmJstRQwXxOQAPROyvVRHp1IfGEbjo984=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j18/5zE0pFKHz6pm4NRXZm5m7Na8qyaFOeu2DDYHgSHwI6i6egTSNpbRzesJCtr9Qy8eQgmUJkZweJ7lWqw+jU+y3kfa06Xn/zHJsuxqyf4WLf0IIpqQ7OhIxZDIOx8/csD8HuM7Qm8AotodNKMEALiBLWXAslgtC6l409lyrtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V94ddMKC; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V94ddMKC"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ab7d7f0a2cfso29513066b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 08:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739204659; x=1739809459; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x90YashPsaPmJstRQwXxOQAPROyvVRHp1IfGEbjo984=;
        b=V94ddMKC3dsi4o1mxhReyMchHwJBUtMpCgKl22suxuaTInCX8dwcq3CP1sU1rUJTGt
         VQhD4rySZo76TjB/S0D2BklAazjF6ShXhkiEPjM8CTnnc2n0IO1atKl+qzzV2MtXIJXO
         mAX+/zM/c7CGmHitW4N1bYvGeLMbiHwFzd7EcFo+8ua9RHr1/C5Zv+YwyrVpn8NgrBic
         0tm0ssg13Vfs7yzX2+Qu+wiAm135e6pgPC4PrxbJeetbWfGw97bJWbDXQDZbteU3NDmc
         IgPm3ssDl2YBUe+RnX3BhKqbdCLho0cu/Scd3mho7dqe7I0/0kbBGW0OiftWiU7xja3L
         tMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739204659; x=1739809459;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x90YashPsaPmJstRQwXxOQAPROyvVRHp1IfGEbjo984=;
        b=THktrsa5epPtfMFy2/BcyNSBjL5XWWHEAkwSLhz9j1CrF4QoGECDEY2gbXfetPww+r
         psfexRMno38MXKvxyHHGS8TdyUGxECY5Z0NEgClzgMQSKtPJoheRLQZJl/tSmLBY/cPD
         dt3vYdTw/o0nWhZuWH3yeBjldAzkxdiyKcIVGyIH+aOGHqjt2L/IxQHvQ7b08yvQLERk
         DK3SjhzVM69yf4+EyBMMQcRpsi/Dna0yLn/phka6S31ypw9Ig/CyaSL7zaeWkflSPtEW
         8pp1ZlrdRJiV3IK6WY5kfBc1RhkEULdxFPVKlRs+yDyMVUcVpTa9R74+xOtBsqDVf3cd
         BlRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3H7YV70fGZng/hIrcR2kv7FEAa6c0WRcAEcJrNVsVkkhmrs7QrLE/yVYON+Lw1MvT97aLqJw/RvQSSPI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCXLd/FAEvYqFalNe9Zdt9RCmpKKklLBQbjBfep35fvNLDvxsG
	pQxnivC9OTbWvZT15ZmmVJn5QVf54F9FgJEQWXaJl5GJKqIJ/3v92IGoeD1sj6w=
X-Gm-Gg: ASbGncv3LqbcR3E2touGGRq0DHep0dR5YUB509HP+pnXMaZ+KuKptwSjZR1m89GV4Zh
	tiMM+CSzTmkpe8UJ4r0OZ7KZnLDCRG4Vfg4erWwnaTVErhEgb/OaD7mbVaWEw06SmtbS9sGnFDG
	64pL8eYvExjeUNgGQOQhqVy2O8Xga8YQKgqWq742O5Yhc3reDjQ26rw/9sFdcgLxYkJa5tZBce1
	CYHU2ro2Q2bOvi9WRLKE3g1DRxRbBMWMyWdGjaFUvPIrQpUhlWXa5E1Hn051VLNnv54Iq9yqwhZ
	WgR2fm5H0WnscoplDQ==
X-Google-Smtp-Source: AGHT+IEXW9wG25rAqoM0JOgADtS7LivWyhuiuGf3G6h6/6tuV3xZIWYrMzqsVh4jYjIlRAbthiHmtw==
X-Received: by 2002:a17:907:7f03:b0:ab7:5cc9:66fc with SMTP id a640c23a62f3a-ab789c6d927mr1500100966b.50.1739204659076;
        Mon, 10 Feb 2025 08:24:19 -0800 (PST)
Received: from blackdock.suse.cz ([193.86.92.181])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf9f6c1d6sm8012911a12.65.2025.02.10.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 08:24:18 -0800 (PST)
Date: Mon, 10 Feb 2025 17:24:17 +0100
From: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
To: Shakeel Butt <shakeel.butt@linux.dev>, 
	"T.J. Mercier" <tjmercier@google.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, cgroups@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Meta kernel team <kernel-team@meta.com>
Subject: Re: [PATCH] memcg: add hierarchical effective limits for v2
Message-ID: <5jwdklebrnbym6c7ynd5y53t3wq453lg2iup6rj4yux5i72own@ay52cqthg3hy>
References: <20250205222029.2979048-1-shakeel.butt@linux.dev>
 <mshcu3puv5zjsnendao73nxnvb2yiprml7aqgndc37d7k4f2em@vqq2l6dj7pxh>
 <ctuqkowzqhxvpgij762dcuf24i57exuhjjhuh243qhngxi5ymg@lazsczjvy4yd>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ctuqkowzqhxvpgij762dcuf24i57exuhjjhuh243qhngxi5ymg@lazsczjvy4yd>

Hello.

On Thu, Feb 06, 2025 at 11:09:05AM -0800, Shakeel Butt <shakeel.butt@linux.dev> wrote:
> Oh I totally forgot about your series. In my use-case, it is not about
> dynamically knowning how much they can expand and adjust themselves but
> rather knowing statically upfront what resources they have been given.

From the memcg PoV, the effective value doesn't tell how much they were
given (because of sharing).

> More concretely, these are workloads which used to completely occupy a
> single machine, though within containers but without limits. These
> workloads used to look at machine level metrics at startup on how much
> resources are available.

I've been there but haven't found convincing mapping of global to memcg
limits.

The issue is that such a value won't guarantee no OOM when below because
it can be (generally) effectively shared.

(Alas, apps typically don't express their memory needs in units of
PSI. So it boils down to a system wide monitor like systemd-oomd and
cooperation with it.)

> Now these workloads are being moved to multi-tenant environment but
> still the machine is partitioned statically between the workloads. So,
> these workloads need to know upfront how much resources are allocated to
> them upfront and the way the cgroup hierarchy is setup, that information
> is a bit above the tree.

FTR, e.g. in systemd setups, this can be partially overcome by exposed
EffectiveMemoryMax= (the service manager who configures the resources
also can do the ancestry traversal).
kubernetes has downward API where generic resource info is shared into
containers and I recall that lxcfs could mangle procfs
memory info wrt memory limits for legacy apps.


As I think about it, the cgroupns (in)visibility should be resolved by
assigning the proper limit to namespace's root group memory.max (read
only for contained user) and the traversal...


On Thu, Feb 06, 2025 at 11:37:31AM -0800, "T.J. Mercier" <tjmercier@google.com> wrote:
> but having a single file to read instead of walking up the
> tree with multiple reads to calculate an effective limit would be
> nice.

...in kernel is nice but possible performance gain isn't worth hiding
the shareability of the effective limit.


So I wonder what is the current PoV of more MM people...

Michal
