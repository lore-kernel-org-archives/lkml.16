Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E7D27B4FA
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 19:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749153025; cv=none; b=QPMZIJlIn2Kgd+q5hasQxx7wYp9UB5rIilEyzLXHxkqmewrPGPGmjLgcL0zNw8D+Jwsmx/SfFwDTkIR2FwHp9CnmfPh2mvUOROzkjEDTTwjaW15QIEN79UNplJJ5jWXtprC7kP2aFRGf+j9mZlazNIFmrIwBh/zny5wYEIb0bTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749153025; c=relaxed/simple;
	bh=TflTtOFYOoUc4cVuPAvdOITqmHHc6pcnCgi8Ql7m9Rk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=p52zw9FLvQnQRW84TKwxPc6AUuaDXb6S1CaN3qrTjaoSfeSxGAvdw/gFcvC4auuQYPl9z9viVKNoObPHtbrPGXeroUzNjxUfOW7TpACBuNBI8t1wW07ZCgG01GEaDysNRMHidyIu7BS8tbCUw6oYbMqhmXaDpsp8CmfuZkWH+LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xaqxAQ1A; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xaqxAQ1A"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311d067b3faso2383276a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 12:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749153023; x=1749757823; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YnwxO9GogIau5EpmXLwXictumDZfroYmuoG/2pq9rqo=;
        b=xaqxAQ1ATqZGky+mSoCaB5oMkhz/SggvCO8PD4H308idUgJnBEI6WPYImsTBLqLpQ+
         PSymqiD/8hchFxGuMpZK8ZhitdgchmeNScyaNTpgOAISkvao6DGvUOFvK+kGbLINPSu6
         1ZMgVAR5eYVdA3VEys+PkGZ5odDR+0S0He0xVs4C5l0obz16er2z2T41xc7LksZQKC7p
         p9EshORctN81C2fdRKn4dW52fD2+IbeMLa6vkCPPfp5LmnKTaVfVyMivjZDTF3aLQA+w
         OwVbL9MjYnpc7VC0ZWFuMFLJ59sJ4R/MDDwv/PE9OI7c3zwk8eZI2hftqobwagFSqUMd
         yi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749153023; x=1749757823;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YnwxO9GogIau5EpmXLwXictumDZfroYmuoG/2pq9rqo=;
        b=ZpN5rYPCyvTwcNPQftCUQxsJyHLabMiHu2CX7uileJo9/4iKFEMmqwIhIP1HrR9QWP
         gnPdVtEC+xOMhPNoYIJOUKhRyQTW/C4qvZk3qQu9ivJkK3lp2SUgU02xnN1Njqg2nbaz
         5xN01wgLuuaMKHdBtD4a8sUk+iYJ4xDhAr7IQhzS3hqowzLon0eMy41cQqNgKg7yqUFR
         6GV4eRNsQA7WlmZz2Sf9vzOss5Zc7SBpy7OXJaH5xZdH+MrtjUXOC5femghj5cmgLtgR
         5r8f1Ie6BCeYVcCZaOvVMfds7rniykPc2o6sRkchJhd1Xv+ffTpLxFVsIzU7h5bSedZD
         7sJw==
X-Forwarded-Encrypted: i=1; AJvYcCWYEDFckwEPMu4pImOW+MNFRkVo7vcvVIuUMkI8f2uzmQy3sdwYVR4dOZux7Hk5wQ7JJIQPn0yUQUSRbt4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0wGfxXqCy5Rbe7CVIazD2/8U1LwYWtynVpjKXdIelj//tWY/T
	QLydRo7w7rNHHb6f+LAoqo1C7FXEpcHgpTcCPEmkZDB34cj88BamY+vuqQ8ZN4Vz9R5zQPY/FHH
	CgMKQhg==
X-Google-Smtp-Source: AGHT+IGp8RVwCKNPkVtRNFf2/Hcg+g70jZPhLr6lPIG7Wja7Cwqp16NUoA0vIqJSdxh6fZRE9ayphp+3AUI=
X-Received: from pjbpa17.prod.google.com ([2002:a17:90b:2651:b0:311:462d:cb60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3851:b0:313:1ea2:a577
 with SMTP id 98e67ed59e1d1-313470736cbmr1304000a91.29.1749153023341; Thu, 05
 Jun 2025 12:50:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  5 Jun 2025 12:50:14 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250605195018.539901-1-seanjc@google.com>
Subject: [PATCH 0/4] KVM: x86: Fix WFS vs. pending SMI WARN
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzbot+c1cbaedc2613058d5194@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

Fix a user-triggerable WARN that syzkaller found by stuffing INIT_RECEIVED,
a.k.a. WFS, and then putting the vCPU into VMX Root Mode (post-VMXON).  Use
the same approach KVM uses for dealing with "impossible" emulation when
running a !URG guest, and simply wait until KVM_RUN to detect that the vCPU
has architecturally impossible state.

Sean Christopherson (4):
  KVM: x86: Drop pending_smi vs. INIT_RECEIVED check when setting
    MP_STATE
  KVM: x86: WARN and reject KVM_RUN if vCPU's MP_STATE is SIPI_RECEIVED
  KVM: x86: Move INIT_RECEIVED vs. INIT/SIPI blocked check to KVM_RUN
  KVM: x86: Refactor handling of SIPI_RECEIVED when setting MP_STATE

 arch/x86/kvm/x86.c | 49 ++++++++++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 19 deletions(-)


base-commit: 61374cc145f4a56377eaf87c7409a97ec7a34041
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog

