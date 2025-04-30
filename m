Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B5C1C7017
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746002302; cv=none; b=ZuAcWNC9NRGUvQOVJgqDfLBfIBBUUowqAdUrLqiANCFvT5b474iGqRKzeUJcC5o/pF5c4qsO+LoSKo+urbPf8R+zxmMAWMD2oygebgOcPuQiPmOZec4OlBb3VAlCqPtqWHLMa09F6LnpAz3T+1EXKZcA8hQJgvfTmI7pGk0b5Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746002302; c=relaxed/simple;
	bh=8zi5cyFcVckW9t2pCIiEBn2bNjtZCSk84A1Zm7fViRk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R7J23RRoUNIs76dWm7j201LzXH1faKQYvQ74/ZryUaZsxOtS5R3FeAweUVECUCCzAUPbbB5DZ3ISlWcxClMhW8eAZRh9502cg5oLM4dLARKLqGqRXErVZQNsWH04ng93nrDCmMoVHch7nx6Kt9DtDTrQZ8OJzPfkXyULI59Psco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=G9UnLdK8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="G9UnLdK8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-acb5cf13996so95098266b.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746002297; x=1746607097; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hw1h6CkpVzZ1WBfBkzfAYu3EbWwU7nqNOd7qFsicdoU=;
        b=G9UnLdK8r+iN0eWelzoAzIFW/A5vA/6jDVRooAJxg7oy9txOWJctSCcKbuIjhmBjx5
         fpzWJyE/bIsmQQu1ccKDlzrOw11yvEfMqgg4qRJ6khzy9rh3z70s7AhyDRrpPUVbKN9N
         5SalCSsxP5rK7zT5aQ/oZqGhzB53Ztees6nOH3B4n+NU8V+t/MUiH9q3zLUyyXWfbZmz
         3HTG7N3TCErlC2RhVkSrANZc1XSqeIWLjsXLLSvSkdQYJIPp7ilveimM0QUj4UGp/u3X
         /xzV7W9BIU19RyIapleKUPK0KWiJ3farSMxP8i50nme8umAC8TjKunK1XI48BFBVn3Bs
         /tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746002297; x=1746607097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hw1h6CkpVzZ1WBfBkzfAYu3EbWwU7nqNOd7qFsicdoU=;
        b=oa+jo0ZLxw9ME6h1elwiIYmT6P154WJQVDtxX+t0PCmv6RdjraigrhP5jFM6k2bqRd
         5hePZLWYSRxLz8CowcQOvcq6onxRSTJlbMEsFIs4JKFOueI2V3FNSUwz94dPyoUKOn53
         LwY+8SwitCWHZ5rFyVh6zyA/RrobEeIA7hGxCq6H16O7+1pwSIlW00qR88iiQl8nWvdm
         I/m1dOgwR7RGnvYG7eyZdQ4tL+yPk6rt4pbomqIzV/wkyW20hZy22WdEsKoXLaTEUb60
         3r2xQXbFjpC8pIbLhPgekSYLkk8K2uHYFMJ7c7Y6zd31MNia7knjALtYbc3+agIEuoTQ
         7dcw==
X-Forwarded-Encrypted: i=1; AJvYcCXPFSVnIrGIrbPx+F/1JEDxdECLUn54bGQMQlzqt7tEAds6QuYPqmksbhJ8hc7Uzdu06T1T+p3A6frTgAA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5BrIocmIQ0htbRMCHzb8WJU98T7ZS268re+9Md6/sIpqT2kr0
	S9QcpGhP5MCtpTVobfSN2n5JC80y7WtfDoUUViHARYFw5525IstNLVOs/DS/bLU=
X-Gm-Gg: ASbGncukhRh/xzlTFAADA08XkFT77DskXOBLep1PrBBD0GsOh9VNYjG6x9yJAOfHRsI
	gpuRFaanZ2nG4wIm1sj74e+Mn0JVnczPmH8L9J40hWacWck/99yTAw+BSpkwVmXpDvGjSsMZdFf
	XybG7vuY3Kgg7g0eO1ncaNFSwVH+nqn3G8Qv/tERyh9HAsEqfgN90ghQfnFwz7Ow897wwjX4EHj
	InavRgWObILWS51cgwCGYSCgUH5yqsfGuMYVnm3crhN2wFKOmhgVWMvmV4HxJZ7bi5rlmluFx0e
	UCEnsQGVPBlcaO6T58B6QEHK9bhUXliU2tZl1sWay5Rtw5p63h5kUusKZ6NefWI7+gXiFC7ohBC
	K5ojKrQ/Y2nvsqGtdsEomKwLqMYbTbg==
X-Google-Smtp-Source: AGHT+IFqkJthPFAOd6c/6owM9CGgAK4lDSph/qo6ciNRRRzE4a0sKhq9+GnkkHtvadbY0MtJiZLKgw==
X-Received: by 2002:a17:907:f497:b0:ac7:9237:60a8 with SMTP id a640c23a62f3a-acedc610398mr81783766b.9.1746002296958;
        Wed, 30 Apr 2025 01:38:16 -0700 (PDT)
Received: from mordecai (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz. [2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acec668dd9csm245517466b.96.2025.04.30.01.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:38:16 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:38:13 +0200
From: Petr Tesarik <ptesarik@suse.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-users@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>,
 catalin.marinas@arm.com, kernel-team@android.com, Mike Galbraith
 <efault@gmx.de>, Peter Collingbourne <pcc@google.com>, Mark Rutland
 <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Neeraj
 Upadhyay <neeraj.upadhyay@kernel.org>, Thiago Jung Bauermann
 <thiago.bauermann@linaro.org>, Mark Brown <broonie@kernel.org>, Kristina
 Martsenko <kristina.martsenko@arm.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Jinjie Ruan <ruanjinjie@huawei.com>, Juri Lelli
 <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>
Subject: Re: [PATCH 0/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250430103813.5bea9f4a@mordecai>
In-Reply-To: <174593068821.431779.9112946165910138990.b4-ty@kernel.org>
References: <20250305104925.189198-1-vschneid@redhat.com>
	<174593068821.431779.9112946165910138990.b4-ty@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.48; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 29 Apr 2025 21:27:52 +0100
Will Deacon <will@kernel.org> wrote:

> On Wed, 05 Mar 2025 11:49:24 +0100, Valentin Schneider wrote:
> > Hey folks,
> > 
> > This is a resubmission of Mark's patch [1]. I didn't end up changing anything
> > other than fluffing up the changelog.
> > 
> > I ran this under an arm64 VM, added some trace_printk's and checked that
> > sched_switch's between runnable hackbench threads would occurr in the right
> > conditions:
> > o with TIF_NEED_RESCHED_LAZY set
> >   o at the tick
> >   o at do_notify_resume()
> > o with TIF_NEED_RESCHED set
> > 
> > [...]  
> 
> Applied to arm64 (for-next/entry), thanks!
> 
> [1/1] arm64: enable PREEMPT_LAZY
>       https://git.kernel.org/arm64/c/c8597e2dd8b6

Great news. Thank you!

Petr T
