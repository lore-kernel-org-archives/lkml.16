Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8014B1E71
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 00:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747269717; cv=none; b=J5Rqvfn5dhhC5CLOsjpKi1B5yima5ZzXsTiUwTlZ0+DDEnW+uRdPmrjmeynmmsy2Yz36wEzeBwVqpGwqZy0A+11grclB/14Oa4dS7sovjqu6JazMAVplrQBsi4UrCqG8CNqD6cMJAdId4JQ+pZ1M0yrjZlbOXDdXwarRbL1LvNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747269717; c=relaxed/simple;
	bh=iFfSERXqavDusfX1VCYEGypsr/UbOLQkpthUgOBORHo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nlT04WjUtbUTA0SJx1NJpEBt4j4lIv82A8B8+7syuUpf2CgzdMwY/DuG1QZJqBCSTl4eUkkTcPlCDsLnHkV8dzdAZzASLsAjIEuPRWrbNhQHs5gRiFoVW6Dx3F8AI4y3uIqFN1ty61cX6f8bVyFMEyV2IFwUoxxhgswHr0c/NNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=u1ISadiA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="u1ISadiA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so719668a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 17:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747269715; x=1747874515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ip9lVrq9USVSeXSDB7Ry76GsvvsCyjvJx3E1UJmIZxg=;
        b=u1ISadiAZpAaCftabQ06ASHhPH/NGcJx2PrPazkovU5v0dj+iy3oYUZ7KNLNDXrRee
         YodszaCJgd/yLiNRsG2eyN/c3ndUs5TyavEBUR6Jo4vMwES8nZTTC43qx/bhA2uFuLCz
         2Vlj89TejxcoL4ygvleWDkLXw4DQ1VgQC1TldwB735MiDa69qXFXjFRoB/xENsfA1j9F
         6VtXi6jCjOLCArZ5p34VYOSZ9IBZhp+/ntLMNm11cuZztYJ1X89D5wW3oSoJWfiX5SIA
         o99DFrnmKDNzG6QRGZTpk7H86vQ9d5Le40+LbPc6a5q6TGSUKr8j9juFNsiTio8yFD4i
         kpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269715; x=1747874515;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ip9lVrq9USVSeXSDB7Ry76GsvvsCyjvJx3E1UJmIZxg=;
        b=MCBbvKSINqXVYlpfNKjpIy4tfshLz/wYv6Wm+idYwRhWOwZx+8dvrqoXcZcaPROmVW
         E2rKh40A/uTSG2WBaso0pIT56O0DfrjiDidlBtOFsipFqwlp43lonBT4uQkW+xi3NyhI
         QlEzx9CMVJ6Oy3iEKI5r95F8TVWnqrqTu/fRzZ6aUtB5vv6FHPq+JFDLuOntVtoqznru
         J/+Y9Zm0ExaoO324tZ9K4cL2CMlDR6BJZ9XW0o3G/JbX1Uw+5cKqtXPMbRxks+QzO5+e
         w+xUozv+yrEhj5jEPXzj3gSn4UvLjg4U/84XWwJDlcnH8VyiJ1z5o9smahp8dV3iz/QI
         YjrA==
X-Forwarded-Encrypted: i=1; AJvYcCWFC+PnKFXONeLU2tW/3lCCSGmFK6BlpRwaGIYW9MvpuxsRvBWX/yLZ84a9DXo8dYwHbccmIq8QrxVUb+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWIUyxVYsVjgE9MyWF5oJ3dqMpXdus4rLwcuprQNjoIVTxuPLv
	oQbEThCr+wc/HoDC7H3/PKobsl7a7Ujoe0K3V9GXCrNxDkEspYwlYv3Cdczp97XL5SN8wvwd28U
	JFQ==
X-Google-Smtp-Source: AGHT+IEQQ2m9ChwSAgqTmcRTO2wVdgVG7h1KF3HTjNgQHsWD0J4xMyzMFU8Gl88ps+nHWYhsRW6yQlC7s94=
X-Received: from pjboe15.prod.google.com ([2002:a17:90b:394f:b0:2ef:7af4:5e8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:55c7:b0:30c:5604:f646
 with SMTP id 98e67ed59e1d1-30e519309bfmr943173a91.25.1747269715611; Wed, 14
 May 2025 17:41:55 -0700 (PDT)
Date: Wed, 14 May 2025 17:41:54 -0700
In-Reply-To: <20250324173121.1275209-24-mizhang@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324173121.1275209-1-mizhang@google.com> <20250324173121.1275209-24-mizhang@google.com>
Message-ID: <aCU4Uuhzo_ovR7r8@google.com>
Subject: Re: [PATCH v4 23/38] KVM: x86/pmu: Configure the interception of PMU MSRs
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

Again, use more precise language.  "Configure interceptions" is akin to "do work".
It gives readers a vague idea of what's going on, but this

  KVM: x86/pmu: Disable interception of select PMU MSRs for mediated vPMUs

is just as concise, and more descriptive.

> +	/*
> +	 * In mediated vPMU, intercept global PMU MSRs when guest PMU only owns
> +	 * a subset of counters provided in HW or its version is less than 2.
> +	 */
> +	if (kvm_mediated_pmu_enabled(vcpu) && kvm_pmu_has_perf_global_ctrl(pmu) &&
> +	    pmu->nr_arch_gp_counters == kvm_pmu_cap.num_counters_gp)

This logic belongs in common code.  Just because AMD doesn't have fixed counters
doesn't mean KVM can't have a superfluous "0 == 0" check.

> +	if (kvm_mediated_pmu_enabled(vcpu) && kvm_pmu_has_perf_global_ctrl(pmu) &&

Just require the guest to have PERF_GLOBAL_CTRL, I don't see any reason to support
v1 PMUs.  It adds complexity and weirdness, and I can't imagine there's a use case.
