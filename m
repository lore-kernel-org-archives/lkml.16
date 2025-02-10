Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7043314F70
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739185289; cv=none; b=EFUY4WV0j3fPVbJop5grLsP3h90jKJP+QAdQPUJFIVidRDJPbpR56gcBXnndsNOY+lBEVyaTCURP1YAm87ZncCHV5tlpg7m0bw3SrEMpnxZEnditmrkJmqIR8TlBDi6FvDSWTqUe1CNzUs5bRAv1Us0gq9w7yBN097oKZAKQla8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739185289; c=relaxed/simple;
	bh=A/nHGsRTz5ge9+o5KGIPNXxGsBYgTigtacaF0AB2zNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sEtss/osqOIqHURa/jLXamBms3Of9UdG8wn2AJfnM6UwK38pNt3WpkEd0vY3wwoSHHCOdmmNkJTOSJe11JUyT9azDWeUDnav0qN+kvGrunc9zTzx0zh6xmCYs8GteO+ddrUgeQo2SlpSQvUWAnHRBPCdAAuBBhum2aPS0AJ5MhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=RbUNLXng; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="RbUNLXng"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43634b570c1so27566205e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1739185286; x=1739790086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OSaTCwW/i1a/+xT9ljUvRvwwj+Pxye0xzps/mnFBmXc=;
        b=RbUNLXngexpg0TNRFTTUi2QDkhqsP9DZDYrWcuwbkhLHlFi6CJmiaSSXduw0NF/VKr
         6f9NcgWJGkdRY73qRbpip9xzSqFEJAtP+bKywdTiByH0NJJ0QJejR4vnVmjRnZR4+fPH
         MW38wkWEXA51rgozc3y7+xVHkCZ0gfDLGXxj7MCSLpMjYMOmcnsfkrEhBmffbEIKV6E5
         MYxN3e6R2DRXzAEhZq11G2hx04SwIfZl96KPQkQmZiq3vFIV9/MnK3GqMHqTFtjUG078
         VjmTwAUJfzlN7gKy/GVtm8keirrvCvvlUd0LdVEd8AOh727fHicRUIqbbWKvdSw17Ij1
         AldA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739185286; x=1739790086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OSaTCwW/i1a/+xT9ljUvRvwwj+Pxye0xzps/mnFBmXc=;
        b=t2zJVkWr4dR9vhq4sSliPf3n4jFVxRAL0TyZGGTW9LMNKiHgxJNYGTHnRWQ+/23NwD
         48VXsUjg2/NirjqyU92M17R3doNpwzA9jqMsaT/u8bHj1mOPy37T4WYTjj957SCpDwkI
         b0elHNMgXM3DrU1BgyKms/KooOp4w6vyiwfAUdvAh36m5Zcpc3NhW0Wvz+eBKPXkJ6bA
         kjR5nZoADi2MBdxUl/JOOPOCgCZTmV0bPfoyCrPlduSQolKqWq/QJQSqLQV86O0fmgxD
         njEE8VmVIcUZV9wrncXIx8yUddYPc5Pz7NNn/VRTkUNx9VJbeDkJjdJiDv6TNOKfxt1U
         n5ow==
X-Forwarded-Encrypted: i=1; AJvYcCWDHvLFIIagkUEVfrhDlWa9+h1457LNuyIpsF96S/qyN123q6cLgeCP4Rl4Iw8pMPqsNjMQxTnmNH+5HEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3yYWeaNZLG3qiP/mzpKOZ12Ie5Wzte9EZw/6goP9OU8udwQY3
	UX6nB1N/Nbny8HV78akFowxXS7i5aqmTSpU7lWRePRR4M5ZkVk2TTmhagCw/Uzb+HpV/tXyalNH
	h
X-Gm-Gg: ASbGncvKWp2mMuspqNtfvGqUau81EKS5MIlPAAIs44BoidHcKjoDVUD3fzT9JX3zG7q
	4vT10/4hKq6E0YtLoZl/2nwr2BiowsbjHisy7Z+fOWynuY6KxxOU2NGV5gzShNLfCqei0tERc2b
	h/56Raf2old1S12k2RaufnThJs35DQgMsZCId01ZswXiEG+wlL7TsWOoIbFtwsFrr3e72P+jd0g
	lefJy9FZhBB2Cfm1skfIITjmrhwvwzlZ6xwY9nYYHLWPonPuDB6YKtVqOIAEP8/qIb1PCbG6H15
	WBE=
X-Google-Smtp-Source: AGHT+IFXnQ0KMzWEP0v9mEPLjum+FYzLvCxDqUvIcocuOOZXnHi/RAG0ADvMPBvpRtDBnATrbHxu0g==
X-Received: by 2002:a05:6000:2aa:b0:38d:daf3:be6a with SMTP id ffacd0b85a97d-38ddaf3c061mr5632423f8f.40.1739185285592;
        Mon, 10 Feb 2025 03:01:25 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394779a96dsm16109565e9.4.2025.02.10.03.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 03:01:24 -0800 (PST)
Date: Mon, 10 Feb 2025 12:01:23 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, charlie@rivosinc.com, jesse@rivosinc.com
Subject: Re: [PATCH 0/9] riscv: Unaligned access speed probing fixes and
 skipping
Message-ID: <20250210-c79541eaea0d2d922f019384@orel>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
 <CAK9=C2XmFtLHAxuWJVdvkUHFQTM+mE-D8E4sLvKxxUj_CqcbAQ@mail.gmail.com>
 <20250210-d575562e04d84ca570e26f5d@orel>
 <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9=C2X5Hu_LQHmXUea7Xhq5cHaJqtcncgwUeb2+2uMvbTiW3w@mail.gmail.com>

On Mon, Feb 10, 2025 at 03:28:13PM +0530, Anup Patel wrote:
> On Mon, Feb 10, 2025 at 2:56 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > On Sat, Feb 08, 2025 at 01:29:42PM +0530, Anup Patel wrote:
> > > On Fri, Feb 7, 2025 at 9:49 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> > > >
> > > > The first six patches of this series are fixes and cleanups of the
> > > > unaligned access speed probing code. The next two patches introduce
> > > > support to skip probing by matching vendor/arch/imp ids and checking a
> > > > table for the access speed type. The last patch applies the new skip
> > > > support to Ventana harts.
> > >
> > > Alternatively, we can also skip probing misaligned access when Zicclsm
> > > extension is present in the ISA string. The Zicclsm extension is defined
> > > as part of the ratified RVA23 profile.
> >
> > The definition of Zicclsm doesn't explicitly state that misaligned word
> > accesses will be faster than byte accesses to the same addresses. There's
> > also this spec issue[1] which appears to state that Zicclsm cannot be used
> > to infer fast misaligned accesses.
> >
> > But, like Charlie suggests, maybe we should advocate the creation of an
> > extension (or "named feature") which allows specifically advertising that
> > misaligned accesses are fast.
> >
> > [1] https://github.com/riscv/riscv-isa-manual/issues/1611
> 
> I am not sure when such an extension would show up so for now
> skipping unaligned tests based on implementation ID seems
> reasonable.
> 
> Also, it seems this series is totally skipping the existing boot-time
> print for fast unaligned access. Please try to keep the boot-time
> print in some form.

Sure. We have hwprobe, but now that people are likely used to seeing it
in dmesg, then we should probably keep something there.

Thanks,
drew
