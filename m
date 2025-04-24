Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA8827B51E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745499465; cv=none; b=meixmcequCTb3M+UOEoc5uQDIc/H7EMR8SABCCN1tHCnPgJgWYnUNluX2Izm2kWhwOMztYu+o+tZ5c9wRbHI2tlHzG6oOvdScK1ZC4zsKYnDa2t1GyhFxz/c+GrmWL69Ty+geEQ5dDjtZgpwzWG43xFu+ZwKY0TonYgQ3HAKN48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745499465; c=relaxed/simple;
	bh=reTdbb+6O0sXBwedeFukDBYju2S+gng4mftDGCp7r68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rsZ0HI6wOUvJaON22tECTEIc66Xb6Lt3pVhWe8ScErdwfbU+Y9iHHVw5uWtWf78iQpQcY1+/C81uJWtZXsAg58iiJDh4vD16MIGp1EmP28f8Jtw1i+c2thXZm8sAuTFMTyaAku4N54IcIWMUzEDomXrIrBIwJxTovijRaBkJqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nI2wKPbP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nI2wKPbP"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a064a3e143so503933f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745499461; x=1746104261; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=nI2wKPbPDt/hA2aXCHz+p57vALDN2e0hpjTHegksYqxT2aEG28AMjyogp5hLa/Se7J
         RvMfNz+b/RK0nTGxhlIWSa9mUUQCwCjv1UaOAm4gBFxAscrFmuRqNUDXmsIO/BEfEbqa
         xPgRj74zkANoWWlSUcFp1weo3fvKoFhAkgSlQV6ZqY4XkxNKS8AW88ToTpcs74wRtf6N
         y+u+JySzY/KXJl0fmBuovbx+mL7K5497jTjUbj6HnczAvxg50JIDFLl80A9dSapQzSxF
         Dt0IVrBcAC3fZmvjDj1Ik3cB4QINSqsHPaf7F1tGy8JBh5+Y6fBc3d1N3vhbyHDQGcuR
         PhCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745499461; x=1746104261;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oPQSBVtSMsvYsAl+gZRdiR2fvyhUD5u3wJ4ZqhPNu8A=;
        b=iinwLJebU4H2V7ZomDzBkPFe2c01U8PbShwldViNKoBM0+AhK8nndhoXXYkc/3vIbf
         oMm78Zomw+NgVAnoMd1xKePHCD3OQbrv3QHdo22PCSDvEZBy416jeGs0Fxy7nMUL+b7u
         lGUGwDK5wmeElHBBq/z9Xm4bwHgU9ma1ZHJPnvovwPb5QZ3x0DLeFa2LEFS9SN450gEX
         PoULyzL4WjZiyriLBLcRVX+NeDQooBjHyzWF/k6J4QAhoJzY25mmd6JCTNzhVdFJR4dP
         OFW8Mb1v2RG13/h8yU5b4H4+BdJZxdXcOyXymPJ00ZuNsRfNYBsGP+7Ez79CH+t0vXIv
         ER8A==
X-Forwarded-Encrypted: i=1; AJvYcCW7vOxOnTISZPZl42lvUlcecYAMWPBAhHqWUelx3qTLtMOja2g4Ew1fRPfCYG0avS6Bhk4ZSSmFuIvxU8E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZWZBzwuF2XVnL4HbHr2Lsa7JsQp9sK5owCX2MYxodBvI4uJaI
	B2EkzX9CZh7MDTVNgB9InVlqzL1DlZn/sIgIARppiD49dP8UTQsluZbbiLOgqg8=
X-Gm-Gg: ASbGncsiAk5360gBPt8XaU/WpqyN2DqeSJUat+BvllRA8h50UNbZepMNCk1FKYlN7m7
	viJLOrJd3LVGk2jsXmihA0mnFOTLhDni62Qlbmwx1IcE0VWpvoa1dTBcNSS0daR5YD9/HtvK1zu
	j1FwGPyoblA6rhAhCCFfnaYipvwx3z4wpDzcuXQ19cDWsEY9HGGFqZfb0b8E2bqo+d5hYxe5uNa
	/RTM0mMa933Blmb0TR0ps0V7yt+ShwCRQoox3aI7BFWCBl02PMRhiaaudP3A5M0Ql4+IzCs4D/L
	+kF6TCY+YVrF3phVuMKFrM40BIfG
X-Google-Smtp-Source: AGHT+IGWv3/WPoD+1AaHzmJVHKE9pYWAl7MImqfR1l23ycVK/8svQHojX4uoV4n0a06YqpUIKi6wnQ==
X-Received: by 2002:a05:6000:1e48:b0:391:3cb7:d441 with SMTP id ffacd0b85a97d-3a06cf5f657mr1695750f8f.25.1745499461227;
        Thu, 24 Apr 2025 05:57:41 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a06d54f019sm2068909f8f.96.2025.04.24.05.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 05:57:40 -0700 (PDT)
Date: Thu, 24 Apr 2025 14:57:39 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v5 03/13] riscv: sbi: add FWFT extension interface
Message-ID: <20250424-dc96e54988e25abfc2bb9cf8@orel>
References: <20250417122337.547969-1-cleger@rivosinc.com>
 <20250417122337.547969-4-cleger@rivosinc.com>
 <20250424-c85c9d2f189fe4470038b519@orel>
 <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67e81f13-5e5e-4630-9a3f-73856b952e6e@rivosinc.com>

On Thu, Apr 24, 2025 at 02:32:01PM +0200, Clément Léger wrote:
> 
> 
> On 24/04/2025 13:00, Andrew Jones wrote:
> > On Thu, Apr 17, 2025 at 02:19:50PM +0200, Clément Léger wrote:
> >> This SBI extensions enables supervisor mode to control feature that are
> >> under M-mode control (For instance, Svadu menvcfg ADUE bit, Ssdbltrp
> >> DTE, etc). Add an interface to set local features for a specific cpu
> >> mask as well as for the online cpu mask.
> >>
> >> Signed-off-by: Clément Léger <cleger@rivosinc.com>
> >> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >> ---
> >>  arch/riscv/include/asm/sbi.h | 17 +++++++++++
> >>  arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
> >>  2 files changed, 74 insertions(+)
> >>
> >> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
> >> index 7ec249fea880..c8eab315c80e 100644
> >> --- a/arch/riscv/include/asm/sbi.h
> >> +++ b/arch/riscv/include/asm/sbi.h
> >> @@ -503,6 +503,23 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
> >>  				unsigned long asid);
> >>  long sbi_probe_extension(int ext);
> >>  
> >> +int sbi_fwft_set(u32 feature, unsigned long value, unsigned long flags);
> >> +int sbi_fwft_local_set_cpumask(const cpumask_t *mask, u32 feature,
> >> +			       unsigned long value, unsigned long flags);
> > 
> > I'm confused by the naming that includes 'local' and 'cpumask' together
> > and...
> > 
> >> +/**
> >> + * sbi_fwft_local_set() - Set a feature on all online cpus
> >> + * @feature: The feature to be set
> >> + * @value: The feature value to be set
> >> + * @flags: FWFT feature set flags
> >> + *
> >> + * Return: 0 on success, appropriate linux error code otherwise.
> >> + */
> >> +static inline int sbi_fwft_local_set(u32 feature, unsigned long value,
> >> +				     unsigned long flags)
> >> +{
> >> +	return sbi_fwft_local_set_cpumask(cpu_online_mask, feature, value, flags);
> > 
> > ...that something named with just 'local' is applied to all online cpus.
> > I've always considered 'local' functions to only affect the calling cpu.
> 
> Yeah I thought of that as well, local here refers to the fact that this
> function applies for a local feature (as described in the SBI
> documentation) but agreed that it's really missleading. Any idea for a
> better naming ?

I'd drop 'local' from these names and when we deal with global features we
can add 'global' to their function names. If we really must have something
now, then maybe 'per_cpu' instead of 'local'.

Thanks,
drew
