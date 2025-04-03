Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9603824E001
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679940; cv=none; b=W9yANp6fBgsgPqsguJLroWcOrBMZrer+SgHt6zhn+24AajToPDgLvQoGNuBnTTslqHvAXIiithxutwzVbecsZFE0Aucc6cl80rB3Fk9bbeW9FlrqkDqLCwnFoB0w97AUZNEVEmuU2+N+wQiPBQcyLvaNcS3lvc11NE1Tu7d7BAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679940; c=relaxed/simple;
	bh=WO1z1H1Mibkl/wzBNl7Xjb98G13d2MySStzMJVGKot4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Anvb/JgTi5o9SpFV2vphwE6Gd1Sfl7XMkmWxt7TYXt2US01Tis8ScmizuEbBJO5WTteualvzSn6g+WG+dWo7sDFRhbCwiZq7641eQiSkUkMztnA6Wj8FFhnSH296rk45aG0TCxrGvhWYbp5M3sjnkuH56jQ/y9KBMb6F1t9CKaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=f/LkW38F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="f/LkW38F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so328455e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1743679937; x=1744284737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=f/LkW38FRYON0y8kpjoZFjil6pP8fLd8oniJFXr1bEkEpq6WdN5ZzbcoV1aXz9HSyY
         JrEF9Exkrk68qlkGIGDJr57o7qmz56uG3momgxS2Qi7l/OahGTE03F3Sjz53Q+rTogbv
         X96N1l4uYRUoDk7boqGB2s+iUkyG8Gh64Fty2fDMCZ9gravHeyPgzLikaNP1qlhkIP3B
         xsU9NCSEmMyoakNAIHfobWwT0x7pfDYrtuqDQwuqmLxW+Ve7TfmOor06AYuDTsTG7RJP
         OVH2d/sEvVztIsdsWaO42kobRsJV24OnzaZNGF1HWCJfFrZ4M1SbBSCoN2rvQnbPlTtV
         dfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679937; x=1744284737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oR6PqtGhCEjz92xi+hsij6mLCExpfkTVXIEuhpc1C/o=;
        b=Sp16HzrHfOVfe7845cT1yOn2QaY3dgudqUs2DtHqtYtTf6liDP7c0lo7EHHjHwK2k6
         3H9MjABmc8bYLOhbmco5coPqjFKFS79MxLG+2rgqioghlP2Nndzil4lmX52izTAg4wyR
         MgIh1KnbegPKCJJ2qwuiXf3agafhOzH6Uns5ScGBUCtmgD/vZSD5mpyf7pZuf3fCOIY/
         NiXRT1xp4TzmdlGF6AGDJZkYGsoo7u+mTGoCWPO8EoKSemUW1C1JnFi89uHGqBG326V4
         eH0vogrOHHRCe6gbJ0dfu9f2111Wasl/X/2qsVSi+7peuFjjrs/z/QEnAUlNn4fycHqV
         CeZA==
X-Forwarded-Encrypted: i=1; AJvYcCVyApk5VNpmqCqQLMuCJRL8bondBP/ydREAXfY2OUDt+hK1ZvSMvkcQoho+AULyYr+i5M6dbzaJsxm059w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlrdTqLuorfouDqNPkC5VouAdvRzqQ8dF0riUtZI2UMAU1nD8j
	21JCZiQ1LKpmx1AcKPu9pcSclVLgEh4ZpDhqv2wlU0dsG9W1BTN2v8wk9SRzq6o=
X-Gm-Gg: ASbGncthQWkPHZnbwK8JeEcMDknBsI0Hj2QufkJLcGsovAy4/26EpgVsA05Y1h6ilnY
	AU2iMNyvu5xnpruYgKeSI4UxNOvzmiyItRBYH/xVAm3UrjzQqqoFcsXgaI6UtY+H/GQqgpxRZqn
	1ObfB7vKLmf9j3dIHLS/xI+K3Ol8MvyLGzKlfyekk7T49un6JAb5DECWf8PvD/UrhTVQThH96ug
	x5YzGEX6eSIOyx3S3IqCZV4JX1pPPwCnHz88etK1brfMSp1vTV14o/QhXjyOmR8Z5oBbKcgX7Vw
	EUSTPTYOD2Jk8nvTtqe54Iv62v8xBrt01I1pJ+b3ozhQGUpNYchBgRbrom9rSKB9qI5mN5V5H/T
	x8w==
X-Google-Smtp-Source: AGHT+IFLuPHIJtkY001V8NzGfGDvy4KWQWKKGAIqS8lFxrZ1d/GjyGP4Yf4pmkBcRsFqmKnj2gYoIw==
X-Received: by 2002:a05:600c:1d12:b0:439:8c80:6aee with SMTP id 5b1f17b1804b1-43db62bc0femr69162255e9.4.1743679936757;
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
Received: from localhost (cst2-173-141.cust.vodafone.cz. [31.30.173.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec169b4e4sm19424775e9.20.2025.04.03.04.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:32:16 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>
Subject: [PATCH 5/5] KVM: RISC-V: reset smstateen CSRs
Date: Thu,  3 Apr 2025 13:25:24 +0200
Message-ID: <20250403112522.1566629-8-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
References: <20250403112522.1566629-3-rkrcmar@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Not resetting smstateen is a potential security hole, because VU might
be able to access state that VS does not properly context-switch.

Fixes: 81f0f314fec9 ("RISCV: KVM: Add sstateen0 context save/restore")
Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 4578863a39e3..ac0fa50bc489 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -65,6 +65,7 @@ static void kvm_riscv_vcpu_context_reset(struct kvm_vcpu *vcpu)
 
 	memset(cntx, 0, sizeof(*cntx));
 	memset(csr, 0, sizeof(*csr));
+	memset(&vcpu->arch.smstateen_csr, 0, sizeof(vcpu->arch.smstateen_csr));
 
 	/* Restore datap as it's not a part of the guest context. */
 	cntx->vector.datap = vector_datap;
-- 
2.48.1

