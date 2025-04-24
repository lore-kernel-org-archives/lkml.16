Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C61F3BBC
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 07:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479653; cv=none; b=lzqpSnM85S7+h5ydgkoF8V4GTcSoOkBqVDF0XnZoMIGHpPYuaS+0mvMmLhXzBCZ+ZS8eJ5yfQ6LCLcSnjHs+k/rx+LQP1zptvHAnc9j/1D96/xIXv7EW9UKJV6UIWhZ3Ba9gav0NyPyu4Rq9/BHP5sK+IGqS+9fQp8WB76pxqnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479653; c=relaxed/simple;
	bh=nfS/x7gU72+XZ/1UFNxd1HLffHl8y6g5SuxZxkDA59U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UNNXIzhAbfAGSpDu1J1lRr/qQK1nghTeOhDqBZXi5R0aI1eOcGPl2FOPdKrevkDsEyeMmKSihxR3/raGO2EqwT1DLUhAAD5VTvqv7cDibIzgD+ulDl2OitAjP1zn0HUpPZ27CP8FMSHwQenRuDck8eiZ33cS+cPYfJlNe94eCoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eciZ3AKC; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eciZ3AKC"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736a72220edso681642b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745479651; x=1746084451; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xc6Bs3X2UGLyK7xuUxebVRwe8Yuv6ialkBolRwEEth4=;
        b=eciZ3AKCZNi9nydQQXX83dFrc//SczevNhjo4Pc3xh09twTwV69V1kZz7M9fd6wHzm
         76CYlDppAdBNJJOnGZr1CISUzcjBvdNYEhRheFR1Gb4yVXFWjJhufVi9TRdUzE96LWYU
         3oBYfO5ZSDrsKs9r+b4QlBzxLloWuJOoD9q6jc4+1KfoDcbep/tS0tVWccoh/r+A17Bn
         Cg5JjZ4HvHsY7j/ldA1H+xwYj8ZY1CA7kMD/df2xFInmX0oBmtFdydyHcVojgx2FKg9C
         34ZKtNKpPubD6KFEYhfR++s/3C8OAxUKLFIOkMZkXGdSt+CFz8dHpM0ErzMc2zXqXov3
         rjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479651; x=1746084451;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xc6Bs3X2UGLyK7xuUxebVRwe8Yuv6ialkBolRwEEth4=;
        b=hcKh7ka2iRuVsew5KT1EvrYcHTWjM4FV1ybtYCWPs92CJudQjF7e9D3KRxr96nsCNw
         rYGfb8FZWEP0CyJmJyZT9VQZATdenZiPKCgJ++gc7Y9y63GrZK1VIHl3U+pSzrxzNW0L
         LBp8Wk9V2Nrgz0zXzNZPlm9o3WeZ/8/YXmzSxsK1kijmR/uRNWYIhVT5ocga/WQAem9S
         7pBUy0/Y3ZHlHby044PfY4T4yWhNz54HV6CK43skOz4jgpUbFl2oaRODjGnUiJeoeep8
         C8Vkoq+MgT0Ok514CnsmXoNb28XS54tSZn1LVz295Q+0GCGdeCThF6EbMG4BMBw53g3t
         wm1w==
X-Forwarded-Encrypted: i=1; AJvYcCWwJPRqF5Taxc9kKSl6c4vQc1iq4jdQK0Y4pUKEHi7VEfzH/umFQa1ZJUlN35CUVwE236VhP5O8XePGOMw=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt12nidFoM2lD4IesPfjJK8ygJM+g1PCZARGsfnhLfu4jLR5GE
	cEdSy+CuWi5bKjyyvmpPVBRC4/3/ovxK+fhJXyILX82nFowW/0zXQUw8vGOf2GQ=
X-Gm-Gg: ASbGncu2hj7lqaZaWZHmX40if0z5Nxikctb9I0uDchP2I7SWKnp6BW4VwuLFIu7YMP1
	n5gZuNtTAmczTq/QSK8OIenBdN6qDtThbZmYF9u+QuslotM/rSSX/Dm7JjJ4QSxaQDpvJYGkQx4
	aUm31KKu9nLbMygE/pQmDOSOxui2/vTawzk7khQGUxPU9e7/SKBWiu2KZ3/tW/WDFsmqQdAaQFU
	/Jweh4khUynEHkB13r9r9B8exEENQwYDoCmd+87mKiEr4m8tm9jEExTq+oQLn7a0TvAhkIBGCtC
	BhehGuUwFkJMGyOfYUzoAdXTS4mabi8k9edvwWmFprdJn8Z+KalO
X-Google-Smtp-Source: AGHT+IFfO2QBFWIVhr5m1hx0gDzPpYf2exm/10n5qGHZbkS4yQ7Df4uixIbTqJipsI6JMV03ToC3DA==
X-Received: by 2002:a05:6a00:391d:b0:736:6043:69f9 with SMTP id d2e1a72fcca58-73e247d74cfmr2285546b3a.19.1745479650864;
        Thu, 24 Apr 2025 00:27:30 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a9a0e5sm751557b3a.132.2025.04.24.00.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:27:30 -0700 (PDT)
Date: Thu, 24 Apr 2025 12:57:28 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Lifeng Zheng <zhenglifeng1@huawei.com>, linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Nicholas Chin <nic.c3.14@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] cpufreq: acpi: Re-sync CPU boost state on system
 resume
Message-ID: <20250424072728.bbcbbcxv7x4cumck@vireshk-i7>
References: <cover.1745315548.git.viresh.kumar@linaro.org>
 <d8651db6d8687a0e37d527267ebfec05f209b1b7.1745315548.git.viresh.kumar@linaro.org>
 <CAJZ5v0hWUdRdbPL2=qybaEsNfPzAqdxW+xBrjwy4HaBXnTwD0g@mail.gmail.com>
 <CAJZ5v0jFy9ch4ZcW_zQs6GfvB=LCnzm94d35ifMpdv=VrqTHQA@mail.gmail.com>
 <CAJZ5v0jenM_pYUkTv-qPV21tok15R+KfT497itPO=fLUywDKqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0jenM_pYUkTv-qPV21tok15R+KfT497itPO=fLUywDKqw@mail.gmail.com>

On 23-04-25, 16:59, Rafael J. Wysocki wrote:
> On Wed, Apr 23, 2025 at 4:40 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > > IIUC policy->boost_enabled is false at this point, so say that
> > > boost_state(cpu) returns true and say cpufreq_boost_enabled() returns
> > > false.
> >
> > This cannot happen for CPU 0 because of acpi_cpufreq_boost_init() ->

Right.

> > > cpufreq_online() will see policy->boost_enabled ==
> > > cpufreq_boost_enabled(), so it won't do anything regarding boost, and
> > > say that this happens for all online CPUs.
> >
> > -> so if boost_state(0) returns true, policy->boost_enabled will be
> > set for all policies to start with due to the code in
> > cpufreq_online(), but this is far from obvious.

> > I would at least say in the changelog that set_boost() need not be
> > called directly at the policy initialization time because of the
> > above.

Sure.

> I also think that acpi_cpufreq_resume() may be a better place for
> re-syncing the boost state with policy->boost_enabled because it may
> do that for CPU 0 as well as for the non-boot CPUs.

I thought about that but kept this in acpi_cpufreq_cpu_init() as there
are other corner cases too. A simple CPU hotplug (without
suspend/resume) for example. In that case exit/init will get called
but not resume.

-- 
viresh
