Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BDA21D3F3
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747759698; cv=none; b=bQWEpD2m2KhSJ3BC0CK55Dpo4lEZcnExXNi2WIB/L6DA+wxNujKpayMb1pHImo2PtYhgLJDbEzB7Jfhwh9e+/vAB7iMRnoBwMl1AbMWtFeSxYzQFzZqszWb8MeJr1sCvGX7NF4SOfxxPi2U/i12MDXk2/yhiW54TdBMGljJYMU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747759698; c=relaxed/simple;
	bh=vaG1AyiwufvK/q6V0BdgNfGV5ktSt1kaK+/KaMzgyxU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fnDli9eZ+T1Pstq5Cu9z/vgasIgmFuv9vUC903liOoy+ngP8gURV0Ccwx2q3BRK9Vqaa3nROGcg2hj4pxmHQkeU8aF5tdCmpb42PmcAWyAATohjGnjN3h4MdnelPjafGGEM5A7WwPC9aLUFFYPQjths6tbOAZD4WLcYpRt0PJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ucbEUtwH; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ucbEUtwH"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e9b2e7a34so2944692a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747759696; x=1748364496; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K8+YuUSYlYqZjaqVi8KvARVNCx6CmbgvfMwxteqHVYw=;
        b=ucbEUtwHFUacrbqMXKkYJF2KNj/F986Jokx3womWSvJLzsdyzIQJhJUAD+xhCIRI6W
         4pKylJcAkMPcmS5Iji65Vh0ayO2CFCStC4PRwj5vHemWxoB3+i9Dyn84I3rwnytJoQxd
         W3rzIy1wbIYwjJwihtfDSCkQSAyMQyc8w4dRLeXj3T6P4lvhfunfbmAaJeGl9ybCJmTI
         8IMyR/s1XradFshsuKwp7Hy97yInB0E6WPONbl9W6wXmCgRZ/JB2fUoSHzazOAakAKJt
         XPBbsMentzSHMUuJU88Pu/D9/+5nIylmrex3U2UME5znsJYTU2GE9YosuQesyVt2w6Dr
         RxhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759696; x=1748364496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8+YuUSYlYqZjaqVi8KvARVNCx6CmbgvfMwxteqHVYw=;
        b=pTE0vrjz+mQme/Dq6syQuKFld9jEKfFSg/isJocO52qNbHUnS4GbDBuUMyua+tmQM8
         UYJ3iKIKwEkejaj5rheaZpbwzIg8sJ0rqH0q9/FKtZ9TDrIoB2T4dTjawvKX9WFnBXfv
         /UTKfnjNogWTDLq5yH22qDgLmKBI5HZ3FEeo/993b4Go60BClcpfLkl2a4McwZvOALm5
         NMOEcZ2wmi4s7Q4j/x3+QPnb72VKbJraepALGRCRwsJaY0BUrid0Qt0L45ZXhydEosSF
         luIjzSQSBFlU0hmuX9XTnEzjwkQFFck24rPBb59ksIFy/scgAZcit7H5RMn7bTmSz6nh
         sr8w==
X-Forwarded-Encrypted: i=1; AJvYcCVHQIxp5DRGonPfUt+QkTFqSoLEsPk6XbvSKhXSrhn+VcshIgHiosmIhFck0OmyFnsPSk/zFetw7Fx2bWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywej6sPYGuq38F1CkTdNdFhzMz9qDr2NcmMfsH1DxfCZkGfsj3F
	ViTaTozBwZyrFeOrAEjCB5aq23j5wGtNuhS0TZHqIIjk7v4OTapKu6Bp1Ph6JsBb1r4G3nmTyXs
	j/gMOBA==
X-Google-Smtp-Source: AGHT+IEu/JMVZpzEiP5lovevj2HceA3rlhx10tlMh6Wzo0F+yguDjIYER5h4LnHBtzjgdiGXgmK1YFTBLWk=
X-Received: from pjbqj14.prod.google.com ([2002:a17:90b:28ce:b0:308:7499:3dfc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2644:b0:309:e195:59d4
 with SMTP id 98e67ed59e1d1-30e7d52b166mr34112928a91.12.1747759695854; Tue, 20
 May 2025 09:48:15 -0700 (PDT)
Date: Tue, 20 May 2025 09:48:04 -0700
In-Reply-To: <20250331182703.725214-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250331182703.725214-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <174774841895.2752531.5751818794863605913.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86/mmu: Use kvm_x86_call() instead of manual static_call()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 31 Mar 2025 11:27:03 -0700, Sean Christopherson wrote:
> Use KVM's preferred kvm_x86_call() wrapper to invoke static calls related
> to mirror page tables.
> 
> No functional change intended.

Applied to kvm-x86 mmu.

[1/1] KVM: x86/mmu: Use kvm_x86_call() instead of manual static_call()
      https://github.com/kvm-x86/linux/commit/6a3d704959bd

--
https://github.com/kvm-x86/linux/tree/next
