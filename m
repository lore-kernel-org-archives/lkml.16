Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289832E7631
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794055; cv=none; b=k0VvS3dCrWZmXNO4IjVhxWRuAkb/fpMVJa+/cQif1Y9I/LBJwGNm0Wh8bHCqWOhfWZxyKfVPhzFDgbhppIfDIb07ofs/uzGvjkYVnsXTHIeLkOvfDdfaX7u/tEWa7Nt/kSJV7FU98gJJChFE5eaoA5xWB1UmIsWzamG01i4f1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794055; c=relaxed/simple;
	bh=QI51cwFq/YB5nOA5i5mKEQvmSHJYx7qPfrbiMFxEcIA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=eSvGSWcDYat1mn3D8KGPL6Fz4nICSJXHrySRWnC9OKVNPPad84gID0MWccxnzkDVV91j0Gbojfj4f1LV+q1ZtlTnDO2kMWRz47SQjSnogZwJWa0UepZ4ev3WNhoQkR1bZvNf+Gpyk+2OdzBrRx6F5WsC00b0JEAPaIYwsYKOGgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mrJCkeyY; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mrJCkeyY"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3583632a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750794053; x=1751398853; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vmX1c5Xt9887t/Wl5FntHs+0LsgfmpqsHqfvT5xmBc=;
        b=mrJCkeyYItwiHcOjidBNfbJrQXQIkXh9Dap/jT7mHXF/F/owWM3j3ROGSNdJ45Q/mU
         SUoNZ0RH5xNvxkesH6OCW/Gh7TE/XZQhPlI4+qZkW6tmZR61Uab4XyG/hCFgK8uSF7vL
         S+PFistXIgIqFCoYWqkpbDvNIGTSyd4eGR5/sUmZdz4d4zEebTqiR7qj2VnvE7fkhjTq
         39AOhoi53Tw4zBn0JSrJINmys5tGonG/Hh1Z00UfSe4VkFb9GkhDzdS12NlJforYvfmw
         7xK+qOlYRAtGh0lP+sqETxTya528H6fHKwVTzwQ/QPY9ar/DFJ7QBJzDi8GLTgy2D7eq
         8HyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794053; x=1751398853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/vmX1c5Xt9887t/Wl5FntHs+0LsgfmpqsHqfvT5xmBc=;
        b=tIIbadIURRm9RnVu3SlqGwXz9BLXdVzKMLSbdEo/LsQaylr9g9euoQYY+3fK3EEmce
         vgteEwIIztlTMnZzSAMc3JZGShITs12qLrAdofNawluBJX/PZDD7NKQr0ss5a60qM+70
         m5HDUF8wagF9lihGkaKsu65jgiwZ9Bk18JRDQDmCl2NVAbaSt+Du2qIPebIsWInrhFvT
         yfbWrhh56As2nfvAjcUPRIlUOUPGLW/wI//19uqrrJphUFR3+QFRoqXTf5RMPlwZvTbn
         6+ol7H0EkHNhLGdojEevhwJ3JMPBO7JhL7FOjD5bwDNUT4bnOgLsY4Oc3F4JoheDBtAP
         VGTw==
X-Forwarded-Encrypted: i=1; AJvYcCXEnOVuIsUdm91Hk6rInkh6gBaZ2pzWpJAZTruUz3trbFaINxjIMfRD4gORFnRmKkb4q+v26kq2/MQCaWM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8iGutrvm3u7Nm9UzguBYHjzlKkk84B4/jHh/IfYApVYLEELBW
	HF0EnFbEw1sAeABofifeNul1Cy72y6Kh2Tbhb+oLB+LRysqlhBiSlyeUFZoJyDZ5LDcIcmYj99f
	gh/o86g==
X-Google-Smtp-Source: AGHT+IEsEvO7d4CyVEj9g3vK+CPWlFNWO9cdjFglM/v2PD0Hi4/XwEOS0vLx5GXBYOLCXHETDH28pGATLhs=
X-Received: from pfjt8.prod.google.com ([2002:a05:6a00:21c8:b0:748:f54a:54d8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1589:b0:21a:bdd2:c2f7
 with SMTP id adf61e73a8af0-2207f330579mr342217637.29.1750794053454; Tue, 24
 Jun 2025 12:40:53 -0700 (PDT)
Date: Tue, 24 Jun 2025 12:38:20 -0700
In-Reply-To: <20250602224459.41505-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250602224459.41505-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.714.g196bf9f422-goog
Message-ID: <175079269575.517785.12142408340158295471.b4-ty@google.com>
Subject: Re: [PATCH 0/2] KVM: SVM: Fix a NULL VMSA deref with MOVE_ENC_CONTEXT
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Potapenko <glider@google.com>, James Houghton <jthoughton@google.com>, 
	Peter Gonda <pgonda@google.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 02 Jun 2025 15:44:57 -0700, Sean Christopherson wrote:
> Fix a NULL VMSA deref bug (which is probably the tip of the iceberg with
> respect to what all can go wrong) due to a race between KVM_CREATE_VCPU and
> KVM_CAP_VM_MOVE_ENC_CONTEXT_FROM, where a non-SEV-ES vCPU can be created in
> an SEV-ES VM.
> 
> Found by running syzkaller on a bare metal SEV-ES host.  C repro below.
> 
> [...]

Applied to kvm-x86 fixes.  Paolo's "Queued, thanks!" seems to have been
premature (though Paolo's mail saved me; I completely forgot about swapping
EINVAL to EBUSY).

[1/2] KVM: SVM: Reject SEV{-ES} intra host migration if vCPU creation is in-flight
      https://github.com/kvm-x86/linux/commit/ecf371f8b02d
[2/2] KVM: SVM: Initialize vmsa_pa in VMCB to INVALID_PAGE if VMSA page is NULL
      https://github.com/kvm-x86/linux/commit/48f15f62418

--
https://github.com/kvm-x86/kvm-unit-tests/tree/next
