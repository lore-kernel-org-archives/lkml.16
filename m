Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13F72F3E
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747997544; cv=none; b=lE5AlV0tPwKzeYERiWnoMy75ND0FKPT7TNZC6ReO/tjKnVUgqJJgx3uOZPS4OTVgw8aYNmfpYPUal4eIIs6P9AlurRLr3HaKGUcjIlwLWpTAMgy+S2zeEnPpqWCTTT3PDgLCGuElOOFu/xiSLRT3Eh14gyFONEi8OhbFQHKvXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747997544; c=relaxed/simple;
	bh=Ekl+hGAB44Rldtp80MChpA/wZATRMQ1Vak431vW9/qk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=q9Kc55sY1DitpwJ1Fwv/rhcULeye5fAOghCnUkpUqISj1V0gqtfnSW4cQXkft/+Eub74roacCneLSG/i7Xb5CG97UbSwv8YdMBtGpY3cc8eFG8akIU+Ue/2K0y4Dn9+BCdJ6CF79vVhuorBZlLbF8JoKfRcWwsfoO3tn/4PG7q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=m6Eq7HnK; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="m6Eq7HnK"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a374754e03so409767f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 03:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747997541; x=1748602341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=m6Eq7HnKZoBo8XLjvhH83fOPp+KwcyUNJTp4kT5iGDUFP6XrhZZi5IQk0Z45udZDpD
         H1gAkac9vUx2xvQbEPU+lYJfV+KBjUHVUqZyUM93voBBT/XtJYcBcywEtFf8QvithBgw
         bsaEFwBNHu63bWlHgWf3W5GeqDC8ozJ+teEWwz8rfiqJoYriRifT6alPxIe9l6Kgxgq8
         wrJ+NYyebIWUNOMLj6OEK/HO354+KLdJCpFBIhGXUshBqM8UriMr3wkIZvkiEzr0AfFX
         OG7SexElzwLeC2NwVT6rc3Bp5X4wvlZSY01v0K1gr700u/RWADygBIco8ehKzLKUg151
         13RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997541; x=1748602341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMi4ApElv9UTRXKLCAFiLHeHw33aLOhDiUIk/Js8sWU=;
        b=NuiX4vQ/qJUf7ewlJKNNSJXVLXwChqx/mfBFFAX6XAsbTyEtkvXfkveeb8MAmEEnSz
         4RJO5YAeaoPb4OdROqXAhWuhPl3lAs5O9xk6a8Lbyf9ApXZM/+4ygpYswP1RrdBZnExw
         1v5U4h7t+dbmG8EoVL3PTg68HSxdHBlvUUsKRa4i9+RhPt7X+hd0PPAC4/JKvaOeqYKq
         q9tod7CAVAA4GOq7CMvcmWBpEqQm2gf4H3TJs7ra9v8kAjo8PXE6D2hx7j+J5W2SB0+A
         2UulNaERQHk4SPIjavIQFk6wj7HShze85V/Qo9GmiaSQ1vccjb6bKqLptJTDCiWCaJ3T
         0aMA==
X-Forwarded-Encrypted: i=1; AJvYcCWVlgDyr/iV2uOLd0fzDaFE7z6o9ES/2U0EaZ3AWdMadERYdK9Z1DVpqbnzmv77/h9Dz/X6xzRiaRVfTuo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJq+LtfVFziIJD53A82gTIGh2LmlvuDcLZs1wi47/qoP1IDKYM
	0tTRl6CMT2W15GLTDCmBiMqfoGKJfc4OyBTUDEzdDHtP0HGaFOUU8TZ5UKF9iLZD/Fg=
X-Gm-Gg: ASbGncvK5Z90MJMnMO3U+NHzxmTFJ887KQsVCPWFN+NYvEmRJIcKyLE4+oqzBc1ex1l
	z8PQDO69WRAhMHf0B/Y/yREE6PRoEqPB1SAMRLF3WiNTTtsbVc9HZjOr97bPnPvXZnZa7iSuMuQ
	Fu4M/SLvWqOx4E23MwlaZGjmt52vnnFriOkufQ1zXGtmFxNHxOUzz8qxf4J/HuqFalRCBvMjruQ
	VaUJTNPjWCgCI97OJUEXTJ9su6uZqvD+M/lHHsKKDTGdVAcT1GBYaW9+pMYd+r+KdIfNbiyrxts
	7X5VI2jQRl9s1tPc/GIjke9xim9Ri1jXoinpQsVJQrgRDpTKUnvJEIZ1Eq0=
X-Google-Smtp-Source: AGHT+IEZmpBdHidSmMll0Tt/cMd2jy3jhCSZ/4z88K5W2YuxN+ezZzGMi4M3/53vgB32or4XtWGoCA==
X-Received: by 2002:a05:6000:1acc:b0:3a4:7373:7a6a with SMTP id ffacd0b85a97d-3a4c2e443a3mr745998f8f.10.1747997541137;
        Fri, 23 May 2025 03:52:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:be84:d9ad:e5e6:f60b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8cf66sm25590521f8f.87.2025.05.23.03.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:52:20 -0700 (PDT)
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
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
Date: Fri, 23 May 2025 12:47:28 +0200
Message-ID: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We're writing to *tmp, but locking *vcpu.

Fixes: 2121cadec45a ("RISCV: KVM: Introduce mp_state_lock to avoid lock inversion")
Signed-off-by: Radim Krčmář <rkrcmar@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 31fd3cc98d66..6e09b518a5d1 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -143,9 +143,9 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 	struct kvm_vcpu *tmp;
 
 	kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
-		spin_lock(&vcpu->arch.mp_state_lock);
+		spin_lock(&tmp->arch.mp_state_lock);
 		WRITE_ONCE(tmp->arch.mp_state.mp_state, KVM_MP_STATE_STOPPED);
-		spin_unlock(&vcpu->arch.mp_state_lock);
+		spin_unlock(&tmp->arch.mp_state_lock);
 	}
 	kvm_make_all_cpus_request(vcpu->kvm, KVM_REQ_SLEEP);
 
-- 
2.49.0

