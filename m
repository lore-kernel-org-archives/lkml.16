Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653E9280007
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747432756; cv=none; b=bsKPNVeN2OfCvJ5vEjqYoO9uZx7/TeXfi92xxVqDSGGrFBzmVB3SCAd/V2KiwwpIA4y4QafBKvbtztz7vX1QrsaeFZFK2PwA9yLai9fpgs7QitNIh+e72v1gz2EtactAgs1xqWFIBsna7tfAYv28Bl6LkIMy+GwRETrsGTv+ZR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747432756; c=relaxed/simple;
	bh=VFXkWnnhe9NyGtdfRK3voyLeMbbCfmqIvr0JVqkZYyI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sJMjWE6wcINag1HGlyIuNKuOPv5rrOl0pIe6MqxmKilzEz3GNb3GVtiAGrts5iDGi9ODQgs0SVzzKBnqrG1jf3z1PSJd415eDSGMWcRpF95IAzR3Qx4dc65n4exh91Qac3dZjVGIvoxiKrHXRHTpQslGoEJZEAKt/MsBLMfjHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tn+q7tKn; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tn+q7tKn"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742aa6581caso1119330b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747432754; x=1748037554; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u1w99cJyy/iQBhZn/BNRLMF2m1YvAMi87ARmaI5+Tv8=;
        b=Tn+q7tKnTQ+uNyP0h7nNPXW2BjQrtQzNrnFq4Kpg2nFwuyb2lI8q9d+tybZaDaWiDX
         qoHKBDHTx9AwNxIbvP+rTlbL4LbyjwjPPpDIFaHk24DjRIhJHUUbEFR42Sjl8aclqEU+
         2CEZHB6fxqWffV/cFA5LMEvicXaD4H6At/oDdbnPjVlN3RPHDik6J2b01jL31KpXucbO
         i8qf7nPVDGBjnnCRWzSWfj/runMrJOnQgVtaIok+sT+5D84sPJwje1CL/Q9qfx/9LRs5
         2BT/6p/hV3foX4jORPY6HHG44BuZNbD9hBiO7xYMU5Oqv9hwbJsJwdgd/hanDai2v/Cd
         bKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747432754; x=1748037554;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1w99cJyy/iQBhZn/BNRLMF2m1YvAMi87ARmaI5+Tv8=;
        b=rY5548f7UzQ+IO1VDc05s89Wb5CdpOS9KczS1YFlKCNmD94CozZ70GkL5pnqRxmu64
         hTE4j5lfEmRzD9aPFSJxiG9TvB7TLyejF8yYcYVA/QtTbR4oKunGaZj+doDIp6EFPcgC
         uZLLHSH1IW0EPt9GEcC1zKMqcQhV+CegE6iaV2zb/QUuIgrUQrZf1MrysPvaZOcgjWcI
         ap2+8sfoYowexCcfzTbrEAaYBJpFo0qQRgRHv4pCt2rQjUhXwmviMRfdFDspN8+RAebl
         4n5YMNSJvddZuqoVCkS6YdCjgzxD3Po2uSLAw0eJ8oOi7Q6EUCZvm3e90AZkrmUSv4qh
         o/Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVI02k0AmtzEiKdCCdsIDAm+LZDHEaiWbnkQ2gpyiUeuhLmOtycQVpSgi1uC9cN2qEzgHtUJYI2MEKGwBI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBWm4j9uyB4C5aif3XiDjmEiuHxvTg50x6RaGnrxX0MI2smHpl
	9AcBaJGDHmIMatRNI++duchFjSg148No1WnbXwgp3V6JHxODaAqMXyoQLNjNIqVvM6NscHi1/l4
	bZDAtGQ==
X-Google-Smtp-Source: AGHT+IHAsZsucPTwyu8/l+gK7VJ5LQ39x2jjsx0K0tg8Ne9SZ+ty0kw+qsADg5C1ynw3A4IxwxbFEK7mPfs=
X-Received: from pfblw5.prod.google.com ([2002:a05:6a00:7505:b0:732:2279:bc82])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9144:b0:736:4d05:2e2e
 with SMTP id d2e1a72fcca58-742accc2342mr5199142b3a.6.1747432754653; Fri, 16
 May 2025 14:59:14 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:59:05 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516215909.2551628-1-seanjc@google.com>
Subject: [PATCH 0/4] KVM: selftests: Improve error handling when opening files
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	James Houghton <jthoughton@google.com>
Content-Type: text/plain; charset="UTF-8"

Improve selftests' error reporting when opening a file fails, e.g. so that
failure to access a module param spits out a message about KVM not being
loaded, instead of a cryptic message about a param not being supported.

Sean Christopherson (4):
  KVM: selftests: Verify KVM is loaded when getting a KVM module param
  KVM: selftests: Add __open_path_or_exit() variant to provide extra
    help info
  KVM: selftests: Play nice with EACCES errors in open_path_or_exit()
  KVM: selftests: Print a more helpful message for EACCESS in access
    tracking test

 .../selftests/kvm/access_tracking_perf_test.c |  7 ++----
 .../testing/selftests/kvm/include/kvm_util.h  |  1 +
 .../selftests/kvm/include/x86/processor.h     |  6 ++++-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 23 +++++++++++++++----
 .../testing/selftests/kvm/lib/x86/processor.c | 10 --------
 .../vmx_exception_with_invalid_guest_state.c  |  2 +-
 6 files changed, 28 insertions(+), 21 deletions(-)


base-commit: 7ef51a41466bc846ad794d505e2e34ff97157f7f
-- 
2.49.0.1112.g889b7c5bd8-goog

