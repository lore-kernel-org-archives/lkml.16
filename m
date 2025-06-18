Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F74269CE5
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 21:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750281850; cv=none; b=kZxlQFuE90JJ2CrTE7UuonNa8x4RL1Z6Zf6m++5tSVDM31O/fbGvavhVdZF1OgMn+PG5249o1DL/uLtBVKE/kUiukcuGfRqozBjeIBjduUQWd3ot50Fmg/73Wgo/tVtjDDYD3queRsCuXJQTqCD7PsJZVwfoevNK735mSvg/Y+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750281850; c=relaxed/simple;
	bh=daJuqZ6CPc2F4BEIINq8WQRI1vxk2F7eTh7TD4lJ1IM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Cht9pKTVCHMK6qsq14s/shihxSSMX+YfK4+sT5yNbW+r4QeZe+iLQQlZ5MDySDPyl5BeA5AbLvbeS57GPnuYq7atB6FfXbgLPzMBRwzJsWrzFABTFaitetJbMATd+SSCbiIzvZXDnI7hOy3mnf/T8ofPUDBhp8mwnxKPUy6s/RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KpfQHxvS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KpfQHxvS"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23689228a7fso2121235ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 14:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750281849; x=1750886649; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmjcv+c3SYJdbUPkQIE63QBOpY1Ll5uaHYh2Mm3xcqk=;
        b=KpfQHxvS2KWBwwQGxvVwN91DcOQnTcce2kjHFgDZFN5Q7xbRGtmJbkxiqYqxcOzgNO
         ZkPjqdEgeK+qwGVPrqnlXo8VgAoaORtVHmsB9ZFx5qUpWVOwGoxdm3jai0Op1sZ6WK4a
         yrVuWnnle3ZcGsqQUPWKw2/52jSK3yLjkqOkX6z3Qv/aEIwy1+wkGZNkP1kfSs0VARU5
         4xKbKC4Rw289ZZW/61RwoOIZkWm2xwY4ZLdeeu6uGryCGeJ+fDBZCdAWsT5wxZsPX7+Y
         PivyautqylevIFmfYjFLhyi3piTUuv+XRVu/E9lOsi3kd9PAYgj5n9FTCMxrqoMTVxyw
         42XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750281849; x=1750886649;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gmjcv+c3SYJdbUPkQIE63QBOpY1Ll5uaHYh2Mm3xcqk=;
        b=mb+4Nm0Ex/UjQi8avgvccJU+rBH+U5Wj1qbcIGyhLVY1HuOLCfQ93tCwkXAKaJrIYo
         h0PSbtdkB9Odgg6OF3440i5pDJ1QXxufg6tSThSnvVf6gBheXMEBEXKV0N8WDFezlxPu
         UDL5bp3ClfVI3m/WyuUsFTEM0Pk6lqxiN8IAUP9ozPPjJvZOX+npruqZkQxAlAQkicCq
         BXyJcaPIfldlpMCKHek7I1YmI6DT9dD46F6J9x9tRZW1hxCtPvXXYXVPLp/3ve5+MZ73
         qoF5281M87sTlQm4DTMJUKb1FZJbLkmTTDr0XpHphRskV+bnbjYuDSsELYvpVg/SmyEq
         ScHA==
X-Forwarded-Encrypted: i=1; AJvYcCW71JDnAaNEekrL8KUsv2WQXwF+DrQuhFHCn7nwm0RyH2g1ZJbGArdNVJZQMQMyz+j1Vpue19d3OfCVM9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNMuIoopfFdGYLOGJEnCoeMHUAhvjy9ekOBYhnM6BuHW8lTPp6
	0uzlfxk5WYsq29BPpNNYuFdYWLWE+KZHEoVk6eM0b7fX60BhbKuF445Iq/p5kGujcGLr+g3c96l
	Nja2hkQ==
X-Google-Smtp-Source: AGHT+IHYIRVe1M5MEtH4NPGJJPhQYabXBPFOaU9D4Tvr+HcI9dmkyP50P9RhAXSp4MSHU2XdPzmLxQcHX2E=
X-Received: from plgk10.prod.google.com ([2002:a17:902:ce0a:b0:234:8c63:ac2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:708a:b0:236:6f43:7051
 with SMTP id d9443c01a7336-2366f4372d9mr206207245ad.23.1750281848728; Wed, 18
 Jun 2025 14:24:08 -0700 (PDT)
Date: Wed, 18 Jun 2025 14:24:07 -0700
In-Reply-To: <25896236-de8d-4bd9-8a27-da407c0e5a38@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617073234.1020644-1-xin@zytor.com> <20250617073234.1020644-2-xin@zytor.com>
 <fa32b6e9-b087-495a-acf1-a28cfed7e28a@intel.com> <aFHUZh6koJyVi3p-@google.com>
 <25896236-de8d-4bd9-8a27-da407c0e5a38@zytor.com>
Message-ID: <aFMudwy2uO5V8vM5@google.com>
Subject: Re: [PATCH v2 1/2] x86/traps: Initialize DR6 by writing its
 architectural reset value
From: Sean Christopherson <seanjc@google.com>
To: Xin Li <xin@zytor.com>
Cc: Sohil Mehta <sohil.mehta@intel.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	pbonzini@redhat.com, peterz@infradead.org, brgerst@gmail.com, 
	tony.luck@intel.com, fenghuay@nvidia.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 17, 2025, Xin Li wrote:
> On 6/17/2025 1:47 PM, Sean Christopherson wrote:
> > On Tue, Jun 17, 2025, Sohil Mehta wrote:
> > Note, DR6_VOLATILE and DR6_FIXED_1 aren't necessarily aligned with the current
> > architectural definitions (I haven't actually checked),
> 
> I'm not sure what do you mean by "architectural definitions" here.

I was trying to say that there may be bits that have been defined in the SDM,
but are not yet makred as "supported" in DR6_VOLATILE, i.e. that are "incorrectly"
marked as DR6_FIXED_1 (in quotes, because from KVM's perspective, the bits *are*
fixed-1, for the guest).
 
> However because zeroing DR6 leads to different DR6 values depending on
> whether the CPU supports BLD:
> 
>   1) On CPUs with BLD support, DR6 becomes 0xFFFF07F0 (bit 11, DR6.BLD,
>      is cleared).
> 
>   2) On CPUs without BLD, DR6 becomes 0xFFFF0FF0.
> 
> DR6_FIXED_1, if it is still defined to include all bits that can't be
> cleared, is a constant value only on a *specific* CPU architecture,
> i.e., it is not a constant value on all CPU implementations.
> 
> 
> > rather they are KVM's
> > view of the world, i.e. what KVM supports from a virtualization perspective.
> 
> So KVM probably should expose the fixed 1s in DR6 to the guest depending on
> which features, such as BLD or RTM, are enabled and visible to the
> guest or not?
> 
> (Sorry I haven't looked into how the macro DR6_FIXED_1 is used in KVM,
> maybe it's already used in such a way)

Yep, that's exactly what KVM does.  DR6_FIXED_1 is the set of bits that KVM
doesn't yet support for *any* guest.  The per-vCPU set of a fixed-1 bits starts
with DR6_FIXED_1, and adds in bits for features that aren't supported/exposed
to the guest. 

static u64 kvm_dr6_fixed(struct kvm_vcpu *vcpu)
{
	u64 fixed = DR6_FIXED_1;

	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_RTM))
		fixed |= DR6_RTM;

	if (!guest_cpu_cap_has(vcpu, X86_FEATURE_BUS_LOCK_DETECT))
		fixed |= DR6_BUS_LOCK;
	return fixed;
}
