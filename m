Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFF72ECD3E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794101; cv=none; b=Ig56+1IaF3mqpaKU+DuZ8Z1z0g432jUFiYwJulPz1NBfDQMyxX/tlBUlVsrVwbl7N5b1RXJDRkHrcbevhSLqO9qv1aMQlGToHg3sen8BYrsQJxm0gl5fJE+g+Y7fXlFTpOTxFk5uKrc18bAmhMGEWukluGt3shG6ca7XhFvWS3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794101; c=relaxed/simple;
	bh=EnSuPTvF4DhnwZO1Ijbg2f9PLrxOuT35VfH6B31Xb+4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P01U2ocIjlEBEagk7AyINX48uktJpifkl5VveX0378Q4k9FDBOsNiNW8y0VpB/EUUCokp0bzULx7kwfPvmWf+Z8jdYxFZQ5TBRF9/PheAlTTLPOwMwYLQPqRrBco99WxeMBtN2dF/d01ynGZJc4PPwSvyLTqHio0YpYWdbjoNUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p+Y8pUAs; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p+Y8pUAs"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31315427249so958702a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794099; x=1751398899; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TcDR0ilC08SnX/gngiJov3sYl1/0VcHc8Gnu/5DjpQ=;
        b=p+Y8pUAstNDnqNeT2taK+wDdjfyHqZwQGkytolXDoadIaFlgE9pgHoD5jXpON8KqRj
         OIRUZYBX+Pn0E1aDCAxPR5nSbdtS/MhqMaegtDFvqCe6hU/MZT8B0Rpa02dph5M129DU
         LtCEDybmWO9ObWugIjWWWuKrB9NVdjI1pa9x+o0BpJOwCtuOSGEkYW7PF9fN9lZ+XXWT
         FJtRjFEy32M0dYYb/QsIUDiKPQyakbDcGHDvsMZ25GRU0hoHJWP26O1EUwvCoc7D7jn2
         hNXnqFcMvVUYYBwtGgr60PaPJmrdUTIZVFM8do/Uc2tkZn+CK5/1Nl9mxD1dIV/tZWKL
         iu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794099; x=1751398899;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TcDR0ilC08SnX/gngiJov3sYl1/0VcHc8Gnu/5DjpQ=;
        b=P1MFwKoLmnCUnDq+P5gUhbdbEihExscGUqXg8kXx8T+hQggAFuGiatpHjtWMCbRySS
         tqdComFuk+WC6F24Qe7W0w/pY/Xo7aRVNdWS68mkEc3Y8PZ03ws/hD1EYG2mT7IBAWem
         Lt6wUnouzRyOphBKwhZJ3K3VDpR3TqYRogDbp4fDK7UiEYZP1PxRpnaveRf2eecG+Sd0
         Ol3es2YOas7CEtKNDeZtyePcOlF+eKTO93bGVj/yv9K5MTv/W2p2eoXLt9uD1ZGikLs5
         hWWYepcZZJNCdi0yKKXay2tC5PFGd9iv+kOrQfW4A97AgPCPpvpZOny3ZRJTq1j5zg64
         yFMg==
X-Forwarded-Encrypted: i=1; AJvYcCX3NgSUrghkgTtkfJrdfA1EW95lBdIRVloNzYksB/HpDxFQoTUDOkPjeEAdOQYYUoAKYO4ut3jTVAOmUCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkzOQlbe93xGO3hyosyEyGMfYZV3XVDJZ8ReaCzX8Iuc6M6wv+
	MoyxcQv/IbRnmEsF9W5ch/nAy2XEAVRyahdjt/EW8lnCqzhjLy/5kcQqgInDPGI/4BPzg1Xq9da
	LAgM/6g==
X-Google-Smtp-Source: AGHT+IFbBoWMRk0OScINUnw6Tc/wO2MzRodBFr/PyAQsm0W8Pkgc1eEhPr2RMhZpwxAHIhiM9y/OwUpIO2I=
X-Received: from pjbsc5.prod.google.com ([2002:a17:90b:5105:b0:2fc:3022:36b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2c85:b0:312:e6f1:c05d
 with SMTP id 98e67ed59e1d1-315f25e7388mr192262a91.2.1750794099336; Tue, 24
 Jun 2025 12:41:39 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:30 -0700
In-Reply-To: <20250605195018.539901-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250605195018.539901-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079323951.521058.7931806146009208206.b4-ty@google.com>
Subject: Re: [PATCH 0/4] KVM: x86: Fix WFS vs. pending SMI WARN
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+c1cbaedc2613058d5194@syzkaller.appspotmail.com
Content-Type: text/plain; charset="utf-8"

On Thu, 05 Jun 2025 12:50:14 -0700, Sean Christopherson wrote:
> Fix a user-triggerable WARN that syzkaller found by stuffing INIT_RECEIVED,
> a.k.a. WFS, and then putting the vCPU into VMX Root Mode (post-VMXON).  Use
> the same approach KVM uses for dealing with "impossible" emulation when
> running a !URG guest, and simply wait until KVM_RUN to detect that the vCPU
> has architecturally impossible state.
> 
> Sean Christopherson (4):
>   KVM: x86: Drop pending_smi vs. INIT_RECEIVED check when setting
>     MP_STATE
>   KVM: x86: WARN and reject KVM_RUN if vCPU's MP_STATE is SIPI_RECEIVED
>   KVM: x86: Move INIT_RECEIVED vs. INIT/SIPI blocked check to KVM_RUN
>   KVM: x86: Refactor handling of SIPI_RECEIVED when setting MP_STATE
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/4] KVM: x86: Drop pending_smi vs. INIT_RECEIVED check when setting MP_STATE
      https://github.com/kvm-x86/linux/commit/c4a37acc5193
[2/4] KVM: x86: WARN and reject KVM_RUN if vCPU's MP_STATE is SIPI_RECEIVED
      https://github.com/kvm-x86/linux/commit/16777ebded41
[3/4] KVM: x86: Move INIT_RECEIVED vs. INIT/SIPI blocked check to KVM_RUN
      https://github.com/kvm-x86/linux/commit/0fe3e8d804fd
[4/4] KVM: x86: Refactor handling of SIPI_RECEIVED when setting MP_STATE
      https://github.com/kvm-x86/linux/commit/58c81bc1e71d

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
