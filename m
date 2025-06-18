Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D512DE1E6
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 11:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750246552; cv=none; b=lSmjjc51lXN5zuk713T73uuKSu4BFnfuyvC4GWywYkBGUj7SI1iz34sXDHOlVdP0uc2AZulTbjj8QEgF1cHhYaAM3otnWMXjc0jMc+nR/xAvXuB9Qmaw3XNs77h1x+AHbN4NSdgGTWgM4lPAemRw/zfeYGV+ak9O1BwCFXNSnGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750246552; c=relaxed/simple;
	bh=staaIYNl2k7avfOSLFZ5XPO76ZWP6t7i2gV9awbxnvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lDtkU6MkjCXtEIvQpahOp4RlN+yYXWGgyY7FJ0CePso0cjygKF4vkOG3ujVvbuSCL09OV+FzmzV5IjBkbjcGhCunv115H8DWlTVMyR6J7PwdaelMYtv+b9fEKl/F24Lcl+lhdKunexKZClOcUoX5H2IPhzQOHCPDijCqTn25m7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=B/0Cs2pQ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="B/0Cs2pQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-234fcadde3eso87660755ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246550; x=1750851350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=B/0Cs2pQL/xg7UU5kTHz3eysHAgz89vxcqTZAIbV7QnddES35CnPkfx5ZwcvJdGPj3
         ZZPVyCWkSvLxr5I6IMPgqBoPFgvUrqDKN5tbktZxu/txfCRmX+foGbt6WRsfWuRAL3oO
         CD0c00c6PhqUmqAfixBfoFez96qvltgR2FUuukilwt8Cs88lYFuKXB/+dVPi0eFxXjGb
         CFKhanAwTC0dtBOVRmwyTH+hOhNsshX/9miaO25MSGw8CZku5uRF4vWU6ntzbBa6FZlG
         r2fYJCKnBjzdEy0AyZdZcU/8MRGzpw9aZdPNRA1DaOdH1xw2zJNbB8+pIklOGy/DwdlY
         eshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246550; x=1750851350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=h7qJqsXfzUuWM+yiCpkXw/JznJHqA9QXkZbFzO8ISJSX1wsJxOsC3AYaUwybzLszUz
         yvhboJlpIM6fY3aBTHInai59hct8N+1fEgbHjA4YtFEH6V6Trsempr0u1+6C80/F9v8l
         ZoyL5pgAIdC3d628JInhM0ciyGn0FIb88kGg6plRpXqjqQOj0RJbaLVojzZRYXi4hQJ7
         Tg50E38fR5/bGDM98ny+FiC6tWBmxeINRm7v31r/LkBnLjlgDjy0glm/Hb4LcR6ruVFP
         54kCTaFTOboMk6n606N//3jWpsa5EpgLkESWApEPnU0X11QYTxNfsyOH/O+tX+dIabUk
         vXXg==
X-Forwarded-Encrypted: i=1; AJvYcCUH0YuRP5mQ4U2+GemtaSyaDw2Qa4zeZVdfho5au+cH0kL7NBFBoyRXQK1aIyQJt4ysN/FmfhHigaUp1Is=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFAY/WWt18lv79NmI3EHn0sMrTDgk7O9tOoUSTmSLKlpCLawBL
	CmCmtp5fsOXiHQxTuO+qDa2WRt8ZBX9Vdj9TUatftYNvCxdbGAOiQSlVhacphI+cz2a2Ml0YGog
	yyt2r
X-Gm-Gg: ASbGncsuSwGOPGnDKORp36cja0XAKX/0KhG77maeajlSE5jX7ZRwrwvGr0ti9xdp450
	TJSNB4FB8tYKV5S1jZZoizyWwfii9u0+R2YKahv6qfEyLnQxBYXGGhQjU3psVYs2OaQUdll+ElI
	Mh7D7v8Y+LRc1ZS/xkl6f/Dhi4r/Wmjy5tYjc9imbWdX807CZnLT/2j2sLPCG/7dKTsrAaxAcWR
	ERymWePlV56MAT30muEv2SkyyzwHISEe1eEzOEQW+UtgDm2yth7fi5EGhMS4w0y8BcqCNkheRni
	yVIYDu883XMngv1E8HtvNOEzTtEhIbZ1017Ub6xaYUDKG1JYsuSl7uNywJdxDwUTTlpjfbVuiPu
	UoqkKxfi/brVUjBeKpw==
X-Google-Smtp-Source: AGHT+IHpQurN4dARXEVEkELnBd1/eFKHOQXO7K5ZeHZVbZ7n3gcsWaLN1FmavIalixJDtUnrPtlsSQ==
X-Received: by 2002:a17:903:b8f:b0:234:a44c:ff8c with SMTP id d9443c01a7336-2366b329f71mr223770515ad.18.1750246549511;
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Wed, 18 Jun 2025 17:05:21 +0530
Message-ID: <20250618113532.471448-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 303aa0a8a5a1..b467dc1f4c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0

