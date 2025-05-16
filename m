Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA92C181
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401997; cv=none; b=KeG9QlsCReyXrMPR10istZbvkNoPwHc31KlzfAyyJbKcyRVfiNTvt5n4fRPfPlYzNRrA0jCvCX1qebCEVJ8ORoVO0cNomIVlwBDwSL0Mz+/cRVWT0sGUA/WN1sSBZ0wDEdB8tK0hX3vbvBWARA9CeUGzXZnM0tZyYQopwzqpkr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401997; c=relaxed/simple;
	bh=oOqs3k0tlpF5HjyzxYG4IK2pdYHASxUiUCxNE7N6sVQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KEAvvGSBClINJxsi78Wyo7ZkpQHMqxgLIwyMuMbUjUIwRN+8gTuWSCcNprBoHLNpoce3GPVu1VsMZIOviartT5husmHqwp/dQfdEfMD105eHtlMnwYRDvLKhEgWgEMKKALGUY34B/0hYvW+VYNE24P3EQ2oIivBwkQFWNNbqDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NjT84hXe; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NjT84hXe"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b00e4358a34so1288732a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747401994; x=1748006794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jUF92U1DJmFEjkB/6aO1QXrYLsPasET5mz/HpdkaAk0=;
        b=NjT84hXecCf9KCtiUY32vsnEwyF0h8tmXlIMd/UlrjQVnCLXQwbfPy6FAgLewRkDSe
         FK/kvajs/JV6xEsk20fi9J3CHDw3hhjT9pArWxOFAAT0EE8h+Uf95rIAJolFtVBHHklE
         UQc+UA05tS2DaMJ6hylE8SoCF9HvAmVoOThNQpd/AZHZP3DlMv1BooB1fznhuVzm2P5u
         CwLNsMNzPZibm/llen7xkyHQd3aeQw5cR52t5AlaE367br4iI2FjBK0JO9/U2V9bWYyp
         cTElatBDShYV9ZN0V2vFtxrr4bokU/sKEKbkJhPwN+8y/ob/C+19chKQeasl7rcBgmpA
         Jfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747401994; x=1748006794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jUF92U1DJmFEjkB/6aO1QXrYLsPasET5mz/HpdkaAk0=;
        b=PHhCKpMb+FE26rWDwAE7KeAyY1N8OFGrXCoU3+wxovkRHnQLQWDyXpGeUPFHzzAuTq
         KN07WXMp8UKR3dOhm9eOgyKOoKM0Jy3bx4g8x+broI1unrOS33aVkkQTPjSeTB2qiOwT
         y3EmdMzZ+1weKSk0v7pAtXw0P0D/whbUWPEzku7FyZJ47tDxfGn4jPdb805roP7RriMP
         r9bBrK6qPUeTWBuidMFf2zpkPNWEebS+8AKOXV5HslTcHqzQ/G9aI6EHAQ1KC7sYAbsY
         X+Q9L+DxKVWtaLUBiwlQa+pi7EG6nwAN91I6qRWBxP2eBHprtckQ7ULCERwMoMHldEE9
         bkFA==
X-Forwarded-Encrypted: i=1; AJvYcCUvTC8zJlVw1G69WV8nc89dLVvonfqmTmhYXT5Hjv/Vt/ujnVIpKAZRgkbS7SmoC22wj29+DsLxcRUOGcw=@vger.kernel.org
X-Gm-Message-State: AOJu0YweAr3v/YW4dd/0XP1KeZnGt+Ubi0Ke0o6TABIJJ1wcfJjAn3kH
	Ax0Tb/dXnyhg9zPM8hqjkw0QOM2y8HzFQt8Xem8ZOZaGdlkUdLPq5+ZRhoJK6b99R61DSBk7Rar
	ebwpZpw==
X-Google-Smtp-Source: AGHT+IENAvEw35fiE7fP5luIXtFIoumLYQF+Tnj/cRu9Hs0uoimDXOXKxgPyre23vv5rc2HSAcjSbPWRUJQ=
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:2fc:1158:9fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c88e:b0:2fe:b937:2a51
 with SMTP id 98e67ed59e1d1-30e7d5d91f8mr5440318a91.33.1747401994585; Fri, 16
 May 2025 06:26:34 -0700 (PDT)
Date: Fri, 16 May 2025 06:26:32 -0700
In-Reply-To: <20250324173121.1275209-30-mizhang@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324173121.1275209-1-mizhang@google.com> <20250324173121.1275209-30-mizhang@google.com>
Message-ID: <aCc9CKw3DGXXQbbe@google.com>
Subject: Re: [PATCH v4 29/38] KVM: x86/pmu: Switch host/guest PMU context at vm-exit/vm-entry
From: Sean Christopherson <seanjc@google.com>
To: Mingwei Zhang <mizhang@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Liang@google.com, 
	Kan <kan.liang@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yongwei Ma <yongwei.ma@intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Jim Mattson <jmattson@google.com>, 
	Sandipan Das <sandipan.das@amd.com>, Zide Chen <zide.chen@intel.com>, 
	Eranian Stephane <eranian@google.com>, Shukla Manali <Manali.Shukla@amd.com>, 
	Nikunj Dadhania <nikunj.dadhania@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 24, 2025, Mingwei Zhang wrote:
> +	/*
> +	 * Clear hardware selector MSR content and its counter to avoid
> +	 * leakage and also avoid this guest GP counter get accidentally
> +	 * enabled during host running when host enable global ctrl.
> +	 */
> +	for (i = 0; i < pmu->nr_arch_gp_counters; i++) {
> +		pmc = &pmu->gp_counters[i];
> +		eventsel_msr = pmc_msr_addr(pmu, pmu->gp_eventsel_base, i);
> +		counter_msr = pmc_msr_addr(pmu, pmu->gp_counter_base, i);
> +
> +		rdpmcl(i, pmc->counter);
> +		rdmsrl(eventsel_msr, pmc->eventsel_hw);

As pointed out by Dapeng offlist, this RDMSR is unnecessary since event selector
MSRs are always intercepted.

> +		if (pmc->counter)
> +			wrmsrl(counter_msr, 0);
> +		if (pmc->eventsel_hw)
> +			wrmsrl(eventsel_msr, 0);
> +	}
> +
> +	for (i = 0; i < pmu->nr_arch_fixed_counters; i++) {
> +		pmc = &pmu->fixed_counters[i];
> +		counter_msr = pmc_msr_addr(pmu, pmu->fixed_base, i);
> +
> +		rdpmcl(INTEL_PMC_FIXED_RDPMC_BASE | i, pmc->counter);
> +		if (pmc->counter)
> +			wrmsrl(counter_msr, 0);
> +	}
> +
> +}
> +static void intel_put_guest_context(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
> +
> +	/* Global ctrl register is already saved at VM-exit. */
> +	rdmsrl(MSR_CORE_PERF_GLOBAL_STATUS, pmu->global_status);
> +
> +	/* Clear hardware MSR_CORE_PERF_GLOBAL_STATUS MSR, if non-zero. */
> +	if (pmu->global_status)
> +		wrmsrl(MSR_CORE_PERF_GLOBAL_OVF_CTRL, pmu->global_status);
> +
> +	rdmsrl(MSR_CORE_PERF_FIXED_CTR_CTRL, pmu->fixed_ctr_ctrl_hw);

And same thing here.  Though I'm confused as to why KVM always intercept
FIXED_CTR_CTRL.

/me rummages around the SDM

Ahh, because there are Any Thread bits in there.  That absolutely needs to be
called out, probably in the interception logic in pmu_intel.c.  I'll add a comment.
