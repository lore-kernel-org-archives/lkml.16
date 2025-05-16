Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAC122D4C4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747428883; cv=none; b=a4g5xhFVLZfIDHhrRYeNB2qx9NHCxKooCkbj7N3zdvsAgE0aq5OWWebsYxm1dwAJei73XNHzPvAl8mOQtMifCVl3noVWS17blM1n3Us+y/eMah5LRYL4tv4PN5u6snyYmYWadv90CIP+0CrfK+v+Ajk39ShzeW4ZhfCoRX1Z7Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747428883; c=relaxed/simple;
	bh=QWFG0Ylh5oGGQ0y5MXw7J0v9cLYgY8UG3wLXOKRNB6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ewMZK7C+0fYs7JxrFyY2x+Z060y9TXqwScUIpmywZRZD4fWYz8SnN2I+tGIOGGG961cfhx7/sa7uSUWBHy6ih8DILTtbtcJt3VRu/eQqemgQou7oCkYERiPg40Wv/M204GwFqKvgN59TVM8KndIMocxMLTGbe0vk1WXlc4s49JU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3B7bveB; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3B7bveB"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26f30486f0so997829a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747428881; x=1748033681; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pUEdh5iBFBvuEiqTMp07Lu/KDXTezSp1m3vHIrINdEA=;
        b=P3B7bveBkhciad9rpRDaft6/0HMMZhqJpG1nEqbLj0xg7kYpV3HaLTu52g5UGJDvko
         Vqg9uYus3ZFT9vj40IHW7WeniOxJXjeaYh2lCNE0/RPGuEhvUQGCLBYORocESV9cwVf4
         aaBnXSbVwzu6dgn6zcucOKbaSTrPU1z2mVP6rLMuBJLXlXZZNqVlDx9Tn2krXkKBzmlk
         RvW96lbx5MmYIBF7mGAs53/j+gMcnBnM1U1FlkNKncDYQPr+2ervoCAa1veL2W2Ns79G
         izjRG+89orqrv9SIQT1954b5s3Yyw/bee2kWd2si3c+/uT8E86LPMOxg1mQ4lESPZwqE
         v4EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747428881; x=1748033681;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pUEdh5iBFBvuEiqTMp07Lu/KDXTezSp1m3vHIrINdEA=;
        b=Oe8IPHbI3xAqNkEcGGyGaDRcIc7/1E5ytw+0pUkK5SuKehC/+kGS+xIaVSfVlw5I77
         en3IedkT+x7li3r6Vh2UkFKWVX9u8xuq+GfWKvpcCIwiDdHO7jJnl29TM1sd0T8hykyw
         +zaVY6HcSA6L58PEbRlqJf24d4bbPbQyo6dLjtDf9zf/95akXcq5yINuDwQ6iyxmAY5I
         Ytpn9jmlfOCMxxW9VgI3k17f44dj9fLRPAVVoHl+CZlVQL5/nKL4dROBEuQWVjpf2uJj
         IMIifEHU6cBozp1pWTD1qkEER2ARiN6A5ZhDuC7YS4ZmHK4TcbOsDFJD7/TFl3eiPyLi
         UTQw==
X-Forwarded-Encrypted: i=1; AJvYcCWGIyxUbFydksvzu1R1BmlpyvHGPxRtxFZfnz5itBxYV1338g0iFbScGG6KOcjTyWIgwymPMmCNK5D2dos=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDK64BqDPq52hOCrCMS81NFH47AYmedSGbhB93vLv+Dk9MPw89
	I5mT+3Y25X1ttA4CXXTaK7pmX6WG4cfMubIIVg2GLGSh6fYdbJ6Eize8espyQpUhtcuuW68GUBA
	VZfSnFA==
X-Google-Smtp-Source: AGHT+IEKXMvi6p5AYfeWYVVxoOJp0+T+HCMSwZBivOJAwnUFY68sURx/OiAsfMQfNNX7Rux9VtkV5C8ZiFM=
X-Received: from pgid6.prod.google.com ([2002:a63:ed06:0:b0:b26:de99:6f81])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6f83:b0:1f5:619a:8f79
 with SMTP id adf61e73a8af0-21621876910mr7462694637.1.1747428880970; Fri, 16
 May 2025 13:54:40 -0700 (PDT)
Date: Fri, 16 May 2025 13:54:34 -0700
In-Reply-To: <2d0d274c-6bc0-43c7-a8a8-92aa11872675@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324173121.1275209-1-mizhang@google.com> <20250324173121.1275209-28-mizhang@google.com>
 <2d0d274c-6bc0-43c7-a8a8-92aa11872675@linux.intel.com>
Message-ID: <aCemClX6rKnVFqLt@google.com>
Subject: Re: [PATCH v4 27/38] KVM: x86/pmu: Handle PMU MSRs interception and
 event filtering
From: Sean Christopherson <seanjc@google.com>
To: Dapeng Mi <dapeng1.mi@linux.intel.com>
Cc: Mingwei Zhang <mizhang@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, Liang@google.com, 
	Kan <kan.liang@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yongwei Ma <yongwei.ma@intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Jim Mattson <jmattson@google.com>, Sandipan Das <sandipan.das@amd.com>, 
	Zide Chen <zide.chen@intel.com>, Eranian Stephane <eranian@google.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Nikunj Dadhania <nikunj.dadhania@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 16, 2025, Dapeng Mi wrote:
> On 3/25/2025 1:31 AM, Mingwei Zhang wrote:
> > +	if (kvm_mediated_pmu_enabled(pmu_to_vcpu(pmu))) {
> > +		bool allowed =3D check_pmu_event_filter(pmc);
> > +
> > +		if (pmc_is_gp(pmc)) {
> > +			if (allowed)
> > +				pmc->eventsel_hw |=3D pmc->eventsel &
> > +						    ARCH_PERFMON_EVENTSEL_ENABLE;
> > +			else
> > +				pmc->eventsel_hw &=3D ~ARCH_PERFMON_EVENTSEL_ENABLE;
> > +		} else {
> > +			int idx =3D pmc->idx - KVM_FIXED_PMC_BASE_IDX;
> > +
> > +			if (allowed)
> > +				pmu->fixed_ctr_ctrl_hw =3D pmu->fixed_ctr_ctrl;
>=20
> Sean, just found there is a potential bug here.=C2=A0 The
> "pmu->fixed_ctr_ctrl_hw" should not be assigned to "pmu->fixed_ctr_ctrl"
> here, otherwise the other filtered fixed counter (not this allowed fixed
> counter) could be enabled accidentally.
>=20
> diff --git a/arch/x86/kvm/pmu.c b/arch/x86/kvm/pmu.c
> index ba9d336f1d1d..f32e5f66f73b 100644
> --- a/arch/x86/kvm/pmu.c
> +++ b/arch/x86/kvm/pmu.c
> @@ -473,7 +473,8 @@ static int reprogram_counter(struct kvm_pmc *pmc)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int idx =
=3D pmc->idx - KVM_FIXED_PMC_BASE_IDX;
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (allo=
wed)
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu->fixed_ctr_ctrl_hw =3D pmu->fixed_ctr=
_ctrl;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pmu->fixed_ctr_ctrl_hw |=3D pmu->fixed_ct=
r_ctrl &
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> intel_fixed_bits_by_idx(idx, 0xf);

Hmm, I think that's fine, since pmu->fixed_ctr_ctrl should have changed?  B=
ut I'd
rather play it safe and do (completely untested):

	if (pmc_is_gp(pmc)) {
		pmc->eventsel_hw &=3D ~ARCH_PERFMON_EVENTSEL_ENABLE;
		if (allowed)
			pmc->eventsel_hw |=3D pmc->eventsel &
					    ARCH_PERFMON_EVENTSEL_ENABLE;
	} else {
		u64 mask =3D intel_fixed_bits_by_idx(pmc->idx - KVM_FIXED_PMC_BASE_IDX, 0=
xf);

		pmu->fixed_ctr_ctrl_hw &=3D ~mask;
		if (allowed)
			pmu->fixed_ctr_ctrl_hw |=3D pmu->fixed_ctr_ctrl & mask;
	}
