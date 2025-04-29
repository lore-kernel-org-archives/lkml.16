Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A731FCFC0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745918123; cv=none; b=FIB4OgeqUyoas/eYY1lLKnItRchPO+ICPJrXoULSidFUIhtYkxgBO/jVCVKINDnMvwVUubzA+/jrWKp3sSKa0xh5ccj1n8HL54ch7kRKK3nlobJUmMJkFUHASjB3b/Y66FuSs+ke+WqdpCGyLbMAMLieazys5s88UnpQTVR04e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745918123; c=relaxed/simple;
	bh=wrdFx1Gtzpo+ZnY585kAQi1a37L9hb2gsTe7QClAupY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RAAqWQUiGcjtr/1XNTZFCHeE5eY4quQg1gfDjgxR6WPR6dWTROwvWfraAAPjhzlRfmiXpEDAhEU/0sCgsuBchU9pVTnfOyzsSpluA3uVQQsKiZZn83d6JZUdWALfYYEXaLB03EGlqUJnMhdlJNPRb81qP7grzUeMv7cEYsQoi4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f9qjpRnK; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f9qjpRnK"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso38655045e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745918120; x=1746522920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7G2fRclvCUdeaZUX86sCG13onMiH2oYs4old4kGD3I4=;
        b=f9qjpRnKpZakjGlQqevF2RG1js4YRo4yobZNB2eqYRpbGgB6K+55NeZpUWjAbApTmz
         DviJsT5l1b1Vwc1iI1Uplx+MUgCknu4kxtSWojnCVTXPTxCRoiETSDEjl8hxlCyWoSqM
         GN6xVqN2jeCLLlJP8SqNew0Fa+W8wspBPA4i92lhnietOkx1ynb1K9y4papmauPSdw1h
         vLpChmwvYi6bcN06iWSYuN0pIKlUYZ6WwifO2WCMxaptTV6CsJl5z4UcEynmwn79m9Ht
         nreP60AeYxFpqfpjSSK3Na3AnfPXiJUW1d3oxyWzv/aBfKVIpgZRa+fesWYb/1NgSTTJ
         fhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745918120; x=1746522920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7G2fRclvCUdeaZUX86sCG13onMiH2oYs4old4kGD3I4=;
        b=HLQw5qhZvjYENldog1r+urIYqx6fAkaCVszPY1dUZpgQzvWbfej0hTfQEUEEQtqnS8
         Ip/spy9mkX/ZEFSHydaHK4GactKMK6ZtW8c2IHc8iF7E8bqIKWjtwH03ylReefQWA05g
         fuR95UMT1i1tJEykLzXMLv0AL4Oegt2F5M3fS1uY5FhViIH0/2wayTqW1vPml7kcXvKw
         JtlKUq0FxEzC7fPAwgvZvbr6buArSUb2+HAqCfiKOzcg4WRUPjgHiuhmD8u94hbZ3SZd
         c5xgmZ/aRbHllYTrW7svdHsu5/VKk0ICzW4YLh1KXwb4ydgzHjD9MjDuHrGh/TpdImVU
         oAgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/noIjunFMdi3k1neTCxhd5gJ1cNUlsfKah0iN5RucsAUXyCbcaa0+OFW56jMI7jU538hPr+SgNWVtYEM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbtg/2Y5ezfY9g2wHZSurovtu7ikxaBIjpZ9HIFULOjxiX8EnP
	cOZFAeI6GECGK6rf08MJ0b2zV4RD4410dtwSKSbRphVvsFjlKdeaWn21kSIM3+Q=
X-Gm-Gg: ASbGnctzlyoxNwFRi86wD1J/71yGfeZMvY+OyW3Ju/TcVd6lzanQ4PubcZHPSA+5f4Y
	YyLqBoLbyBPM7J/13oOUIOEyORW3SneSpalqL6boKSc5UmVT2hxd3chYQmE3h9mWMOCI6T1VO46
	a64D5eIme4PKNCpcsv9n0WZGf4ifuOYhxX7HgzvL8qA8hH2U2qlLobvsOQtqDM7s7H3e2SCzs/P
	/EIiMG2s2fmZRp1zo9v1ij1EeDW8dlP8c/2M12t6riGehFFSZuj2me22q+pPbcu717oIawWTSxL
	9YGdH9Mr4slol+aEJ4WRH0x+pkSX
X-Google-Smtp-Source: AGHT+IF3KzUkgVrnps/4CLwE8PJJvYiIIYMaDaAAjNNNF0zL6UGQaiXvuOFTaEzk8NEzIueNlYV68A==
X-Received: by 2002:a05:600c:c0f:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-440ab848800mr97500615e9.21.1745918119902;
        Tue, 29 Apr 2025 02:15:19 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a531dc6csm148546415e9.24.2025.04.29.02.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:15:18 -0700 (PDT)
Date: Tue, 29 Apr 2025 11:15:18 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] KVM: riscv: selftests: Add vector extension tests
Message-ID: <20250429-251342442ffe2d05e6b676e1@orel>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-3-583620219d4f@rivosinc.com>
 <20250425-a2a40c6296018326cdcf7d24@orel>
 <30b2d279-8459-4a72-aad4-29c1ece622b8@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30b2d279-8459-4a72-aad4-29c1ece622b8@linux.dev>

On Mon, Apr 28, 2025 at 05:32:09PM -0700, Atish Patra wrote:
> 
> On 4/25/25 7:20 AM, Andrew Jones wrote:
> > On Mon, Mar 24, 2025 at 05:40:31PM -0700, Atish Patra wrote:
> > > Add vector related tests with the ISA extension standard template.
> > > However, the vector registers are bit tricky as the register length is
> > > variable based on vlenb value of the system. That's why the macros are
> > > defined with a default and overidden with actual value at runtime.
> > > 
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >   tools/testing/selftests/kvm/riscv/get-reg-list.c | 111 ++++++++++++++++++++++-
> > >   1 file changed, 110 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > index 8515921dfdbf..576ab8eb7368 100644
> > > --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> > > @@ -145,7 +145,9 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >   {
> > >   	unsigned long isa_ext_state[KVM_RISCV_ISA_EXT_MAX] = { 0 };
> > >   	struct vcpu_reg_sublist *s;
> > > -	uint64_t feature;
> > > +	uint64_t feature = 0;
> > > +	u64 reg, size;
> > > +	unsigned long vlenb_reg;
> > >   	int rc;
> > >   	for (int i = 0; i < KVM_RISCV_ISA_EXT_MAX; i++)
> > > @@ -173,6 +175,23 @@ void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
> > >   		switch (s->feature_type) {
> > >   		case VCPU_FEATURE_ISA_EXT:
> > >   			feature = RISCV_ISA_EXT_REG(s->feature);
> > > +			if (s->feature == KVM_RISCV_ISA_EXT_V) {
> > > +				/* Enable V extension so that we can get the vlenb register */
> > > +				__vcpu_set_reg(vcpu, feature, 1);
> > We probably want to bail here if __vcpu_set_reg returns an error.
> > 
> Sure. What do you mean by bail here ?
> Continue to the next reg or just assert if it returns error.

Continue to the next sublist, but now that I think of it, let's keep
this line as it is and either add a

 __TEST_REQUIRE(__vcpu_has_ext(vcpu, feature),
                "%s not available, skipping tests", s->name);
 continue;

after it. Or, add a label to the __TEST_REQUIRE already at the bottom of
the loop and then goto that.

Thanks,
drew
