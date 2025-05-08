Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F41D22F75E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 23:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745477; cv=none; b=VdHlosImTIISshI1Zszte4VG6Ly/MasURYPRUWH6qc3WzZ9AoKqelmYVBdGz0hZ0LRXPZGyXGd8U8nW46sN1BzzuoY2Zfv6Y493wjhSZa2u+v7/bUxQgj++97zUN9hvPlasg/iyye3aCfxt9YrPpd26NgdsGA+avpulu+z61VNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745477; c=relaxed/simple;
	bh=o9MeEdic2aw5fuiXgCnE5gY7Rjy86uabdHeLWt3OWtg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MRqVeFd3lxokQYTmKknOKOA5WuzTwVJsPX5Qedp36KGZoDrTKkbdcb5BPN2fgE7L5frXyS0fthninO3EGomnajeqNAw6b2/dcCEPRhTqJQtcios1waPp6rB3siXYV4e9u0FA8y3rSPUYBIb2CbcEtknP9DsMZw1fdRH8O2y6e9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2oJsu3Lx; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2oJsu3Lx"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-740b646ff9eso816570b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 16:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746745475; x=1747350275; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UFnJZ/RAlcNSP8DZMSaNIf40AZH7y1/ctvuFTqQKpZw=;
        b=2oJsu3Lx5JPxYgcQU4M51wvLCGjfw5SXjg9UWs2cTdZ4Qk8YYLR5D8b4asIdfza+bV
         Qbh6Dx87grn7oTV7bvdf5WZ6iz6o5DX5ztUg2exo0S6mudlrVheyI5u/au4uV6MJKJcJ
         6LGAdRbURQ4bPIMlaJF09hWeREIDBzN7UGg5CxSFtFux4FXXvlpDrePrkpRZpevLtnn1
         wOne0WFc5+YBXCXdAKdtd69Mna3qivHltJc2uBPc8rYQiKrawklJJ3nsvIb3PppoN/s6
         XMF9wIBiFKf7oNQaXu0nQjAMZoYDttzbPRCNaqgksIGfzGIzvbEuC8UbLBcCKmzbaMe7
         TPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746745475; x=1747350275;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFnJZ/RAlcNSP8DZMSaNIf40AZH7y1/ctvuFTqQKpZw=;
        b=sqf2ucGxwnvShPcY//3lrbnTEvNHI5sVenNwsjPhKK8tX0FyDCCr2V2NylwuKjPwjo
         GMJ3ae2BuEdOpXTNOWLjlHKJhaFKh44nQhckv6C+K9CXtFA99CeQn0bbxLfgzkVIzNLP
         hcv4WK0H7kiFTxwAJXKr6YUITTI5guez/f5aFWp2CaebqY40KlwyLa+UVnUyVKedlwWe
         z/8UL2vSfcsLCpRnRmsdljerICq8NTZkYqiWY+b+hHZlAxhKB7PmEDnh79q5NWyXRsAH
         SZqq4FEUwm0wtEhcMHpOTsRXEAprZ3+3WFKlsNw8xOo/N6w5e0vFID9In7OFPmaTpxGL
         isvA==
X-Forwarded-Encrypted: i=1; AJvYcCX1vU485rmoulc9dD6+HTKi+Ti/fxw6qtABncvPR5DnByVJfxC3Diz0yp/+niSRSc2f3BgOkVAvGvZyWl4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPaWFhKUPMuSDURf40urL3reZFWHbPbhrab/OWEhh6olBIqO1/
	4ZXUtmtDEYqpny6ZMC6WEBlxwfKafGKnTBzoBNoVtLHY1xjRguehlMDQcke2IvMOJ17EBA3rATY
	piQ==
X-Google-Smtp-Source: AGHT+IG4NdTzrTcn/tJ+C+qU+BUxLlmZ3u4ruAx10ti1k6L8LxPT6OHgmEaQdgvRL/L6EYHOM/vcI+YYgpw=
X-Received: from pgax25.prod.google.com ([2002:a05:6a02:2e59:b0:b22:c4d:2874])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:72a4:b0:1f5:8da5:ffe9
 with SMTP id adf61e73a8af0-215abb03afcmr1445565637.12.1746745475574; Thu, 08
 May 2025 16:04:35 -0700 (PDT)
Date: Thu,  8 May 2025 16:04:13 -0700
In-Reply-To: <20250505180300.973137-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505180300.973137-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <174674531183.1512799.1644836485465401885.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=> 1
 VM count transitions
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Larabel <Michael@michaellarabel.com>, Borislav Petkov <bp@alien8.de>
Content-Type: text/plain; charset="utf-8"

On Mon, 05 May 2025 11:03:00 -0700, Sean Christopherson wrote:
> Set the magic BP_SPEC_REDUCE bit to mitigate SRSO when running VMs if and
> only if KVM has at least one active VM.  Leaving the bit set at all times
> unfortunately degrades performance by a wee bit more than expected.
> 
> Use a dedicated spinlock and counter instead of hooking virtualization
> enablement, as changing the behavior of kvm.enable_virt_at_load based on
> SRSO_BP_SPEC_REDUCE is painful, and has its own drawbacks, e.g. could
> result in performance issues for flows that are sensitive to VM creation
> latency.
> 
> [...]

Applied to kvm-x86 fixes.  Assuming -next doesn't explode overnight, I'll get
a pull request sent to Paolo tomorrow.

[1/1] KVM: SVM: Set/clear SRSO's BP_SPEC_REDUCE on 0 <=> 1 VM count transitions
      https://github.com/kvm-x86/linux/commit/e3417ab75ab2

--
https://github.com/kvm-x86/linux/tree/next
