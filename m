Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FC120D51F
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222665; cv=none; b=LA2jJ685dIJABH7nqkjHbGpJzgSIXNMK5BuuNKF0nYdcz3WLSxPI6EjtCUjJ/U3sqaAL3ALhREnRbg+XI8NylmF41P1NESXlVsQpRz9sLn56kxqDNsuKnagEU8SBIQO91EbyfvcYMyvM0y/AUTyq0OQJAVa436XZ5yQZ7CmKj5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222665; c=relaxed/simple;
	bh=E6M0IvoLmXk8zvn7QAi4bJE+3u5ywWMaqGMb1cp3f4A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=pP3vCkcrfQ06/7eWRCGKiFJryQHm6X7iqSScwGJxDm9pvGSb+ytKjwkqVIbWLRLAc9j5UWWjkMQ+kKkCvBhnel5GPKV0PwFbeHpBo+jRQBrpXUXi52JiN0H1MtvA/+WtJF5nMubLM4RUdW/uaF393O7uLe82Y68bwfCpPy0oi+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YOGsvt10; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YOGsvt10"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so2403305a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746222663; x=1746827463; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L5S6kzWyRg3t7ibhxxMYEu25/92uJhpv9EtUoQxKeGk=;
        b=YOGsvt10ihETK7UkeflFAgQFbqAlZJETITu9Ap06+rkxIivojked0at2FmuXBZwx25
         YjLl9oQepJQmAZXPfwZ5zMZK251pUE8IA9rpGS8oLIx1u7Gha4jiUVthjULowISCA3vx
         uw1llKQqrM+oHf7cNk8TTufI/NYJ+pxdddofmrg9Ejac9KXhey8zoQEjLlOPix8hW2O5
         iJFPtvOHgM0Jqsh3CqdiQnLE06qFhcM7seaUR2+3u1NSZdd1KX0g9giKhW4KND+5i6sg
         AvXP/Yqp1PIOJVCyJkyyxRhdL+FgvPCEIZKr5Pus6mmHO9LKri32SU0doWUYpStzk/q3
         MxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222663; x=1746827463;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L5S6kzWyRg3t7ibhxxMYEu25/92uJhpv9EtUoQxKeGk=;
        b=k4RTDaB1nh/xCz+frP6dJUajEKm58riFdghC0sGrZxoMdeXDy/7dErYiOr8LIg7bEn
         OUk31jNkQept+NQPd7eeJYOZzkFCDzRLwJrxWdtXKb2ltWgTfRBw8nTw94z0ZJccPERw
         Awz815fagZpLQxLTOitr6MLiEcZxK12HgeMRbGpuJ/PScfOJDsnsIoQVeOKAhuqB3C+a
         D0O+EC6VNrXWA7Q5DiHqivPJ9fo9ztOfv1Cr2KqGnSFPKrgfUvuNoAY9X1ERo3+87hsH
         a0eVSTEyF8IyQWzcZkDy3FWKfVjvzOI5ZBvxqLRGh9uHYVsdg8Ughll/GpPZkq1p8SXZ
         VMzg==
X-Forwarded-Encrypted: i=1; AJvYcCXc6wOE41CniSowXN/8MlYhXClXgw8lkt+M1MHEOG/saNzrHFEppzs1pGVrdHGPgvO1pAlCjK1KF7RiUPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAoAjiRtTUwtwfRBgjBxKxNL8l+6TXvzgT9UUuFUODKt6Anm+2
	m7TdgFTXVDsdvLzYdP7mn6onIv3H2Z27KdA1HDdFpG6iJlWJQXS492G1r+Puon3IlGRJQ2eYmco
	NLg==
X-Google-Smtp-Source: AGHT+IEqmM5AJyCRJVxSDwYAUvBgTR1EcndjlzikTaOt866pVxcotcKieikdc2dTfpexkvGIF4+QSAcOhiI=
X-Received: from pjbqn8.prod.google.com ([2002:a17:90b:3d48:b0:2ef:d283:5089])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5250:b0:301:a0e9:66f
 with SMTP id 98e67ed59e1d1-30a4e5b2c34mr8131657a91.14.1746222662809; Fri, 02
 May 2025 14:51:02 -0700 (PDT)
Date: Fri,  2 May 2025 14:50:49 -0700
In-Reply-To: <20250430220954.522672-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430220954.522672-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <174622206428.880669.10703752422020171252.b4-ty@google.com>
Subject: Re: [PATCH v2] KVM: x86/mmu: Prevent installing hugepages when mem
 attributes are changing
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Michael Roth <michael.roth@amd.com>
Content-Type: text/plain; charset="utf-8"

On Wed, 30 Apr 2025 15:09:54 -0700, Sean Christopherson wrote:
> When changing memory attributes on a subset of a potential hugepage, add
> the hugepage to the invalidation range tracking to prevent installing a
> hugepage until the attributes are fully updated.  Like the actual hugepage
> tracking updates in kvm_arch_post_set_memory_attributes(), process only
> the head and tail pages, as any potential hugepages that are entirely
> covered by the range will already be tracked.
> 
> [...]

Applied to kvm-x86 fixes, thanks!

[1/1] KVM: x86/mmu: Prevent installing hugepages when mem attributes are changing
      https://github.com/kvm-x86/linux/commit/9129633d568e

--
https://github.com/kvm-x86/linux/tree/next
