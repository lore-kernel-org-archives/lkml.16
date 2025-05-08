Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B087D26E16A
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714712; cv=none; b=pPo7ayJkAkA+PLryRtbcm5XKXNIQczaSLb8MEvoV6V7yeoDxjU0VQwv709mn9LUyi+ke6pZvTpDc/mcwgE1GzHvB/frB89jctIEGpXcgZcBQfMNCOt64TWyLc0dPVA4TEy4CUeXjxrw6wJIMgVJPkdROGHF84wMnaCB6uKu4GNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714712; c=relaxed/simple;
	bh=vvs7XvP+K3DBZ3mhg7d2yMjiTj87uIFFO65p7EPD0XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cWuBE3Bbb+bG568TIaetVo4L5yi8Hr0JKuCO/7OoqWCz0c9wh9sSmiHw7PyyJrO1E5AO8JaAe+oFRF3q+3cHk5yo8ntytxDSSxbkxHcmYdM/L8zZt8KPZkU+566jncmD1WJ5avWT8Rbq8J2Nt5Nf/4USGNems7wiSTVLEIXk9bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=OBUU/7uL; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="OBUU/7uL"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a0b4c828c1so136371f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746714709; x=1747319509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Npf5Cp02vjjlOhdcHZRyKHohJloygz1xYGChAUxnU34=;
        b=OBUU/7uLuwf/9srYtwK3JO+6m0fi30krBiAVBgJlvR0kFa8B1L4Tw4JKLyOD74yQ+N
         RtgPPSE3RHaljlk54t8hGGQxt8jqZd8QZZucJNvugqhvxa3XhEb87b9/4onMNSS2f9hV
         iLkJjUSZZPAr21YKC+/AeHLY/Xh0KZ3aF7AVxYnLo4gAyRBz3MXZFSrK63CH7F5fpGCM
         VhuX0NHH86bualYUDwfKKSlpjoKHUwrHXdVOkxVi7LoJkD7+m0CJn8vKQEGpcIgKlZr3
         LWL3pZm4YA3lfhmuqhpH1uBZ7bVZn2c4Qf6f2s3ev4/ifSc+KT3Et5DcpfUspycWmq1r
         l+Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714709; x=1747319509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Npf5Cp02vjjlOhdcHZRyKHohJloygz1xYGChAUxnU34=;
        b=lq3JT/7na2faX5Zn+4EtF/Ss0zmeq/MtoBwVe1ZPk9DDgQMldd8g0BU8h4XjEYe9tu
         arly71kV3CIX2HuYGhEVpfqL8WiaT5El2uKeJURA5cKMyoohR9zlYGRlmsQSpu2jAPI6
         DOVxFZ6zlqkZicCtvyn9ySleSHoiwuXW6Szk6t5v8XGrO/FdzaVMYIO9V885vCSSa5Zb
         Ul5fMSk+kvyXRQD7AtdXAIVynfbRibJI8UBW7IrLbO7OVbXjJB4oIobScDa2FOybyvlJ
         +VO+Z7sYmVuE83FuPtdWHJO8yk+nWFxYRT1QU4p4ljpaisKRqQcua8kzCE6y2gVU6aa5
         ULsA==
X-Forwarded-Encrypted: i=1; AJvYcCWxf2mvPC3eVt+2+LM01iwysWdY5h/c7UmWPV4anWl99d999SPOy3utmCwujbTdetfsrYe7ozML0FXzJjI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFV9eqjHoAaOEy/1sKfDehIwuFfm0iYeX1Zo+xaIDlULCULPgg
	j6Ll/FTHIMw5aT7VfV5YoaoGeMlRgV+hBN0EFhTW1D+1w0tdeGq4eIkk6JsLrXrt2Ah4EJWyqRz
	g
X-Gm-Gg: ASbGncutoqDzJ0UxSYB9EBNXMLK1L6ejdiATz19izpEC3QGNlJ5HJkQsBjVCASoDES/
	FDPeUI00F7SY/tEyOuzhGZg6hPnYh9guEg4imL/hH1vUJjwsTUXYI8E31PeZIB8ylIn0x0dD/lP
	6XyHet3MbCY1ppngC14FkhtUSVxLOgJEXxHihuU00mG/GdllUbOqGHBZbueeUHerNOGLSakOX+w
	WE7tlh4D8Pj4rJnHWEYhz07R52+horMpwwGMpLhSVxnbpz8bdxSlvD3yLIT4oQulWP278wqPTsh
	+IzDCTdxieJLK1bSSMbmkcXD/FMMtT/sJpK1/XuzbuvEbdY0
X-Google-Smtp-Source: AGHT+IFDKtOArIEDhyzzyyo9ibITZPppPGTsVRUFviwEpobpTYwXsYjaHuTW7dWWMam5suhtm71qqw==
X-Received: by 2002:a05:6000:2dc6:b0:3a0:b3ad:6636 with SMTP id ffacd0b85a97d-3a0b4a0356fmr2554909f8f.4.1746714708992;
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:a451:a252:64ea:9a0e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecccbsm147512f8f.32.2025.05.08.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:31:48 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 1/2] KVM: RISC-V: reset smstateen in a better place
Date: Thu,  8 May 2025 16:28:42 +0200
Message-ID: <20250508142842.1496099-3-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
References: <20250508142842.1496099-2-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This got missed when the series was applied out of order.

Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
Feel free to squash this patch with 376e3c0f8aa5 ("KVM: RISC-V: remove
unnecessary SBI reset state").
---
 arch/riscv/kvm/vcpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 7cc0796999eb..a78f9ec2fa0e 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -60,6 +60,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu)
 
 	memset(cntx, 0, sizeof(*cntx));
 	memset(csr, 0, sizeof(*csr));
+	memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
 
 	/* Restore datap as it's not a part of the guest context. */
 	cntx->vector.datap = vector_datap;
@@ -101,8 +102,6 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_context_reset(vcpu);
 
-	memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
-
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
 	kvm_riscv_vcpu_vector_reset(vcpu);
-- 
2.49.0

