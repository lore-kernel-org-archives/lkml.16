Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ED825B2F0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749797881; cv=none; b=Sytgk1cXM2tMVudspA9+87yVRfnC833wula8cyGjwmxhDOnqwvWcBGXNGZq/taQ9ii6qpbzOf+GnRLNGiZl6EzgWQ/5XbE+++xoZOduP3stmws3gVowWRumDQtvZ3Wk4bLUPK9yIcF9HfcW5osH/ByB0mpb5mUQu/biJyukFVCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749797881; c=relaxed/simple;
	bh=staaIYNl2k7avfOSLFZ5XPO76ZWP6t7i2gV9awbxnvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTxeZr/RFgANzeIv9DJ8o6h7EzQ8/KQgDcM4MsuziCYAFrQCVfLwvUsknTWPYoINfk8Gu4fGT9PbxpykWxsWlehn69+HQQeYDQysFTryTheJjd3nikaXTjI1AL26qvibuC4KZabDTbPe2JzTZV0QSO4fEbsAwZdZv5FuN5K1NJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f+nTcRQC; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f+nTcRQC"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so1818825a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 23:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797879; x=1750402679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=f+nTcRQCK4s49Lx1hQmY6hhN5HSOPVDiSLxu65TgcWDTkDI3dmEH4e48FumePTyzGH
         K44McB3d2TyYLjlG2vRc6idIxVudguYpXvhsLSHmw980+honqpqeImxENi9Xmo2cj86y
         YVqBwy17bkXNTAH/mK++Ie2X6ddn6Vod1K/tXyAAUBxDSPwDkE+C0ztw4VNNUUPtwgd0
         9zCAvnebKzyC08dmW/CkuevmAGaW79AV/XbTkJkWPfb8DTJoLIrz4tD19tFrfRPq92HZ
         VfQwtOCQU4X4pDAXA3pQ0jlQtAYaPBOpqX2/VF5eeZ3zfTdBzonKmHWqnZj8qt190E6G
         YpFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797879; x=1750402679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=XwcgJq0d3hVEDdUNDGyDDNDuZzR/5cDpqWHVnaKT/+fiO02qB7lF/m3U3svfCAkZF8
         cV2ucvUMczQOzSpXyzILiJS9R1eAzKZ0ONnqnv6id9CfxZf/K4m9N+n9jw1YrogV/Y+r
         gWJ38mYR3P7QKbpHGrAR4jc4kuz7xOroNgXMfH+ef5poyqAVKq/4LTj9DDuJXtDMw4ba
         VWOCBVmi00dtP5/5K/EJwRmSjLworOk6SQiniXhrdcs1RPZONSCZy4RFMop52o3h0oQO
         7sJK4EJXyYL9W+UrBUioAG8cixSv603KQ7QKLjV8tePYKeV/CdHIsbZ5p9gFnTeDMbRF
         6LFA==
X-Forwarded-Encrypted: i=1; AJvYcCXQWKJAKLFB4oN3+8F9QXQZo+/Ji4DOVJw1dzB5gv6/fCvQhTZMbvbwVIAmJR+0XrquRGZZk2F2xJeWspc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAkAobuUw+gOm22vQ81EPZruR5jvf+ulOGaRNKmG037coQoRDZ
	i6Sn5OJT4QtC8zBRVT6QwOI1Kh7LWSD/FU/ri8HCVy6rcw8GClZj9RVWIFVeUA2dHTg=
X-Gm-Gg: ASbGncsd5yuFQKlF9JPuXky7J9aulVusP5JlCfuCQYhGQKz1toh/HeRze9ImvAbbz4h
	pyA/x+nxTDcGR88xaYhYaqpVMIkFJS+nMbGYknxvV2RRu27OoQYCelMNG9ZSlDuAgr1EBmi03E+
	90X29RYOq9/nCaDcs+DkVD/YEaN+d80161W+SgM9HEvetqF+qcsScCXRLUJyfHiENceY8rqkeA+
	zWTOh1Oa+IZCtBpACCdZWCtmfPjXYTgvzkWrDqBvvteKaYVckhTnQ8DYtYDuHZwF9M0wBUKoe7Z
	KWQ53g6SKQoT16MLu/UdXWrnQ8QkH/Ix66Lk+rJqt541LbtRRD5T8AM7KOC20E1LkzPYv1FoumK
	W6WpTGdmwDtCBs7GdmNc=
X-Google-Smtp-Source: AGHT+IFbsRijVxYSu1XTO+0N6i4HTy+vctiYUi4v1qHZj513C6U95CzPutsxwPcR26VA49ZdTmRG4g==
X-Received: by 2002:a17:90b:1a88:b0:311:b0ec:135f with SMTP id 98e67ed59e1d1-313d9eeab31mr3207474a91.30.1749797879252;
        Thu, 12 Jun 2025 23:57:59 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:57:58 -0700 (PDT)
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
Subject: [PATCH v2 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Fri, 13 Jun 2025 12:27:32 +0530
Message-ID: <20250613065743.737102-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
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

