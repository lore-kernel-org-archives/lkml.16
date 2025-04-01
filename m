Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31E620CCC9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522452; cv=none; b=a0jOwIoVEH9tpFixWHuqQT6A2Jq67UwDTlzrtrWImQTwK8NHXz+hi+QVdS6kaAg/yfD8EyBT8zdgxKNQIyAt9FCbPoU/akUhG2fw9sQd7fOcgGc2SoQO9n2DYXFIZ4wgoMxYNNgEYD/H9FvftC4kMegqA/vS9BwQO31xcCU8ido=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522452; c=relaxed/simple;
	bh=/1FktzPU3bQuOUmyYNLHWXEww9RqcH6M+s9ZFxSolVI=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WKxtiPYPOJyem/IBwfu5OEMoFtnct/jFOJL3ZYkVSm9y0bTsYS/DQSG5wq4DUO0dek2fmQEtaTcYMafeCggElSMsVRDqdAPb+puEgiXR0XxX9A0JmyU//Mv3sW5QsyjuAeFtQ7J5wQ1GyVQDZdcH5kkN0f3lbSa/SRIlv1R9gJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QBmiJuC9; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QBmiJuC9"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2262051205aso82611155ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 08:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743522450; x=1744127250; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=09ksi7gwePf/rawSt4QCN6SH8sTv7bOhY4udVdTx9rg=;
        b=QBmiJuC9b7vQsPQMyQGAPKTTCQMC8y3dgPoOG/KilG9qnJ+5WvcandWhGe0d8mhQ5q
         o81fIkcNFgvmnCKLambmWUHVbz0kvG3l8I+OP0VfAc7ZzvHN2O67UzbFB4PtdjZVAtxo
         pFSwqOqCLKieLCfepn0Tt/UxQSgU+89eSVuUWyb2e3RuIg3cJuskbaIkWPAWapTvwrwG
         RRILHIexAcnKqMb9p8kw7SG/u4bEM9WUuLJ16oeUUv5uEJn/VbvOhpGlqtiGBgQ9vCKA
         3BygR2jV4Qh9vWpayBR3LXWXxkBKs+y8P9gKKoHbp2r+8oiYVXc1NgSyQPayqsBocPpo
         YtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522450; x=1744127250;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09ksi7gwePf/rawSt4QCN6SH8sTv7bOhY4udVdTx9rg=;
        b=EwVCWtsYdwy0grrZBCgC3QD3PNZMZqTmqaoyna2gtVQzsKUy8NT9nbPLmwMxw8d+Ob
         s5quEw9Sd+Eu3obUrcbF3w/xP3qsNmx28R9a8j3iOwIGfibQEGH19r0KM2+Wf5OYMlrt
         JdVx/KGVsNx21nbRpsssfuRR06agnPM4G+rN78Bg1xNQsd7ot/AEXZ7sn1Ywl4OoQ12O
         5n+Qf/SUr44UZf786LEcGkye4bpqAn5CH8s1gEGq6dQ2he1juySnCF2dH/v7A76rFjPr
         ug43+gvJcRdhfb/JBe/icnSiCtoDwVVjjgXWi6zW/znp24L41px0PbmKmAH4BQfvaa1c
         ZArA==
X-Forwarded-Encrypted: i=1; AJvYcCU+JBFRgQnBeNsL5Y26aZzeN3XfEvlI9O4oq5vggl61ar3NwOXOLPDItDvSsIkhieBpydH41F2mzcjvPgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc4RBx+uNqL3mhE1Bq3XcfcwKZ7lAy9okssditYXrEpaAD7Fec
	CiySo0SBBkMb9s+eOGUeIYyDSTNRwCg68/WiuWXr6lu30HTem2U355YnqzsPXKhbaJD7kE32nKD
	Qbw==
X-Google-Smtp-Source: AGHT+IFTszSRfFdPMZZteThEtt1L+sfoUeDx+PvRrgFsUk/KhpkpCbvaRWftJnoYSOUFtKvH/pXmcBeiSxE=
X-Received: from pfuj5.prod.google.com ([2002:a05:6a00:1305:b0:737:5ee8:8403])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:13a8:b0:736:47a5:e268
 with SMTP id d2e1a72fcca58-73980350150mr19408650b3a.1.1743522449883; Tue, 01
 Apr 2025 08:47:29 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  1 Apr 2025 08:47:25 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250401154727.835231-1-seanjc@google.com>
Subject: [PATCH 0/2] KVM: VMX: Fix lockdep false positive on PI wakeup
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Yan's fix for the PI wakeup deadlock false positive, plus a prep patch to
make the dependency on IRQs being disabled during sched_out explicit.

Sean Christopherson (1):
  KVM: VMX: Assert that IRQs are disabled when putting vCPU on PI wakeup
    list

Yan Zhao (1):
  KVM: VMX: Use separate subclasses for PI wakeup lock to squash false
    positive

 arch/x86/kvm/vmx/posted_intr.c | 37 +++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)


base-commit: 782f9feaa9517caf33186dcdd6b50a8f770ed29b
-- 
2.49.0.472.ge94155a9ec-goog

