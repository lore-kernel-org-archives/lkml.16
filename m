Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689BF2AF00
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748957215; cv=none; b=gzYNtyf1phvr78owxWZtild97B+nxAPvUJKTm78Uc+G7ZheaRzyyi7dJLOuIdnYVQmEPO7BXvJO2qPioA5VXkd84lDSC59FOWAX9d4rHvWXVLtfeQxkz1v7PqWpWKF5LA6WUJg5QXVn2njFL1W0zvMl92VnLTjuaFpaQlKm874A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748957215; c=relaxed/simple;
	bh=L7+qtgykgPi3lroglO8RwZIW+N2GCF2llGYrBQ0oYU4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I06KmGTW+oJVqX9yNNoIZhVO45ESGmdWqxDZK+xhff4Wy9hjhsdhptuK+YiPko+ZfLLbSvKu7snOeKZcH5IAUgifgnZ4PUY5F6T7D67DH5E309hGt0HGRVvVH7QPzlQmIgJUKyRubChMjSH0b9srpV2cH6mYvlZ0TEXeuhVg9+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bZRTT9Vy; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bZRTT9Vy"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-74299055c3dso7438087b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748957213; x=1749562013; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6BEXJHtjU9V+ltSdQUZb8ZRixRuCJWu7iAmqz2qP5bA=;
        b=bZRTT9VyNS5GOAu5dKxNgweEqHqrjrxNvdKa92aHhEuIlMwIgDw+wyTmDF6Dm91gtN
         K7pu79f59edwUgdzPOKvdy2O12XcHo0Hi9SAKn4IPmh/+WqdQapbKfJrJEAxE01ogzYb
         hD7GfMUOrsBYba0nxt8USynWQWBJE7VTuDgG1qnQVHXvKPEfz2AR+F4sOFMj3GLYVEQy
         7vNngqQQnWoQ+P4PBTBVY0LDQeUKJKgo9wG6u7/6xeVWOsjv4g7BXYVsnkwabYTg/JQI
         49X2xPUKmuJUX4/C9+xpPPhpxsHQfREDiOkpm1JbVVfUWz3E6PMdfE0TYm1S6Lb1fxX5
         PAWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748957213; x=1749562013;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BEXJHtjU9V+ltSdQUZb8ZRixRuCJWu7iAmqz2qP5bA=;
        b=LfMrZ39onD7hJRJErRY3DF7jnkKI8MiOK02JFddqrk2AKDEW/9AzDHiXNn3E0SolGS
         GoCmK1/xOnAIDsLt2whGTo4xaMGXe0F9kssYthtxXxHBwBBYi3BR7c65jLJvgazu2J/f
         MH9ViPYmLsVOlgcxVpLfl6qObG2Eag0wJQ01+VyDmt19gEJ2WZbf0O3NfKjPBm7awNqH
         7xabnGjF12ID7U8sZkOGNMcsZCXiMAE3++y2eaOVkOR4gc2ge7ZGS47YUScCQEe2kKg1
         c3Ys71tbyTO4vz1ECKOPPDX3AbUTPNm6gvNZmtYsbRdCSOxUMBoDZ2hTrG01B1Zx44HV
         SUrg==
X-Forwarded-Encrypted: i=1; AJvYcCXMKOx4X3nRUBrGoWrIxSAasN1LCo9N7inyz8n+SMmcmLnV1NQeL6RtHRpvr2FSowxfBsRWpYww1XLo5go=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjaTJPdpDS08SGTNf32UdwCYceI0ewEQTNnW3eht93apMPsLwh
	hbvlN17oXtcKOYlCyEQHZj5BEhLwmQNt9uIeDBPm3ZFOcRbRZp0X81vdgHz+khpdt2UjCm7Id4W
	m2MSc+A==
X-Google-Smtp-Source: AGHT+IGaWOJYzlEyg0eyG1P05zKPEo0H8ydP/NrBdiTTYiphzAFMaccGUkuQON6CduTUYVcs2AW60bOD4f8=
X-Received: from pfvo25.prod.google.com ([2002:a05:6a00:1b59:b0:746:1931:952a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:3418:b0:215:e60b:3bd3
 with SMTP id adf61e73a8af0-21ad9799478mr26954618637.29.1748957213638; Tue, 03
 Jun 2025 06:26:53 -0700 (PDT)
Date: Tue, 3 Jun 2025 06:26:51 -0700
In-Reply-To: <aD6tFSu5dvEQs8dJ@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com> <20250529234013.3826933-5-seanjc@google.com>
 <aD6tFSu5dvEQs8dJ@intel.com>
Message-ID: <aD74GyZmU4Z0dMn1@google.com>
Subject: Re: [PATCH 04/28] KVM: SVM: Kill the VM instead of the host if MSR
 interception is buggy
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Jun 03, 2025, Chao Gao wrote:
> On Thu, May 29, 2025 at 04:39:49PM -0700, Sean Christopherson wrote:
> >WARN and kill the VM instead of panicking the host if KVM attempts to set
> >or query MSR interception for an unsupported MSR.  Accessing the MSR
> >interception bitmaps only meaningfully affects post-VMRUN behavior, and
> >KVM_BUG_ON() is guaranteed to prevent the current vCPU from doing VMRUN,
> >i.e. there is no need to panic the entire host.
> >
> >Signed-off-by: Sean Christopherson <seanjc@google.com>
> >---
> > arch/x86/kvm/svm/svm.c | 6 ++++--
> > 1 file changed, 4 insertions(+), 2 deletions(-)
> >
> >diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> >index 36a99b87a47f..d5d11cb0c987 100644
> >--- a/arch/x86/kvm/svm/svm.c
> >+++ b/arch/x86/kvm/svm/svm.c
> >@@ -827,7 +827,8 @@ static bool msr_write_intercepted(struct kvm_vcpu *vcpu, u32 msr)
> > 	bit_write = 2 * (msr & 0x0f) + 1;
> > 	tmp       = msrpm[offset];
> 
> not an issue with this patch. but shouldn't the offset be checked against
> MSR_INVALID before being used to index msrpm[]?

Oof, yes.  To some extent, it _is_ a problem with this patch, because using
KVM_BUG_ON() makes the OOB access less fatal.  Though it's just a load, and code
that should be unreachable, but still worth cleaning up.

Anyways, I'll place the KVM_BUG_ON()s in the right location as part of this patch.

Thanks!
