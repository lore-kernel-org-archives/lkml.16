Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C211C84DF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841116; cv=none; b=KVYM7VIYG3Sv+mkooscWvDRHZZcbxZdU7qN9k4rUUWPFzPq00VEQNDfhGKm3qSG/AB57Cn8n3RDlPMaiWPywf6vDSdno4eXJ6LQl9Xr7cgFPzWQ4RhFmiq7tTQgStXK3irc+nUC1kK2Smi46Rqg/AhwMgNOCADEVlimlwoXzLPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841116; c=relaxed/simple;
	bh=hXBmUgYnqVV/obrfQE+ffzHO/KP6BaKG11lXO0yJS1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CtuPF0eNU+Mk8HTz5AoB8W1smqoVYr3Tsy9j9PGyKandNYzdBF5JOzw+wCbIussgbZwYwGmwaeCTCD7HpiCwwICtjg3Yl/REaVp3F+apUhR8UPl3UxircE5xR+gHmld0Sm+xL1AfMd0NBvedd3nhkd3UrJ1yj1iOpRAx+rgw2os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw; spf=pass smtp.mailfrom=csie.ntu.edu.tw; dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b=JaqFfUzx; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b="JaqFfUzx"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso1667728a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 01:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1750841112; x=1751445912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZgnHfrvb1ohAxqWBg7xDt3QN8B0f9Jh9ZGClguGU7k=;
        b=JaqFfUzx6PtBZE8TWNop/t5SsaMWNEQ2mbs+b7J0pDAw+EU+T55BPlSAHcdpDAXnrD
         6gW9zOXVAeWRKSNea9mBhFWJ7wyekBC/uekGy2TCsALJ8PTfpuBEAqqgjbs4BWFsxmkM
         5i1n/DGOKBcBrSjq+oOIe8cq60uKeT8JP0zpkosnXF6zdRSnBRn+Ckycwv4McosOcoB+
         jIz1D9xGi5ikBcgxWTqsEz7No6s22D6e0MYxpRjF6dt5TKEvM8ivR4d248vxEN7Dr/Nx
         uEZSabvrhjifSZduByFhlXBkKkc/qyS/UFdTTOCmTEmVo9zbUAZC6/hpy+l5BCzFbYhU
         P+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841112; x=1751445912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZgnHfrvb1ohAxqWBg7xDt3QN8B0f9Jh9ZGClguGU7k=;
        b=X3LYr0L7FxVB6BfI4T6tgydb2YyN9oqG6pwF4BG4rGR2FLs2u6qp3VQUTqsMy+nwid
         R9tPPQpM9e6qNJSmBZcdrktUlEPbadCRYBpzLpdt+XFYCUep/s400BubPX9jat3w8bP2
         QxsoVXWb/Jy5uqv7DZHOXiRhsOb0+26V1RLaFEL3rGNUS2BQmo/TIwXb8G4KKJR2qJJu
         JQ+yswHIWZoa4rQCo6OstZOBL/BfFeAYFN38+TnUJNp8xhetWKl3GnRRhY4Xzj1Aox1H
         GPmoWLasQFGmgtHS0jG1ra+ONQ9OEafp6meHpVE0ueKIcYOPa6+D0TwTY468xw+06o/o
         8h3A==
X-Forwarded-Encrypted: i=1; AJvYcCUrRMPRxTkXMLai4CJ5+d2k0dp6PQGCI/Q4sgnosttcPzJq+IUrMt7OqeUdVlam5XNpVA1pCYHf5/hOUCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxut3rT9dRnchpV+dSlB/4tRnSkAAgpruPLOfBElW/1SvLovgzL
	Fhj00opOFAlhc+247rp8DcP3ZQHy8tI3vX+q7mJi+ULwRZDYwd57i06c04JTbFWw0nDQN1XbGX0
	RHLKRi+vrClpI6bbR1OUwyne82VvkPzU9VzryYyEDpIcDn7Jpr0WqfkR98q4=
X-Gm-Gg: ASbGncuV0gMjeX9JCJpOW/ySz491QQaBFoY76Y4Q1M+iIZXfuf3z4CcM1kMfJsJwLrK
	zo5lp9BoU6NgEAUektjoTSoMqUUhXdBH753zpVD1KkGmQF4WMmIUpnNXMLVWQ6eioC3TMUeUcY8
	X+0XL3wTucN6hSV1iozNsFLPgPIDS5AOx5uNTcpGyJRc1tk6+aTZZB8BH2vbGkbjRwFWUHQFBCU
	WvqvnkeqH8Acveg/2JAaul4PtAvYxt7lQhx9jo6iJ9KawI3e2fIN8OpWdyxROTbePlB2BLHXgMC
	xNZZwgLdgfnDMtmPYSmKE9OjtHJaSIsF1ssWX4dKHifToJVxW9HcUB6dIuojGhtOiJBVmX0GnjY
	bPJ1QQIC6elqjrILyrnRwJDYnfMqeH1zrTO/VMkU6RaTDYLnWbWY=
X-Google-Smtp-Source: AGHT+IGyy6YLwss+HffP5SUP+oihK3m9EHxjRmtYMYfXhWdxLxeKPaeGlxm77RQZMQ31nRdwQyAxaQ==
X-Received: by 2002:a17:90b:1a88:b0:311:c970:c9ce with SMTP id 98e67ed59e1d1-315f268a5f6mr3098742a91.28.1750841112061;
        Wed, 25 Jun 2025 01:45:12 -0700 (PDT)
Received: from localhost.localdomain (36-228-0-244.dynamic-ip.hinet.net. [36.228.0.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5441770sm1264154a91.48.2025.06.25.01.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 01:45:11 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>
Subject: [PATCH] KVM: arm64: nv: Fix MI line level calculation in vgic_v3_nested_update_mi()
Date: Wed, 25 Jun 2025 16:47:09 +0800
Message-ID: <20250625084709.3968844-1-r09922117@csie.ntu.edu.tw>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Gm-Spam: 0
X-Gm-Phishy: 0

The state of the vcpu's MI line should be asserted when its
ICH_HCR_EL2.En is set and ICH_MISR_EL2 is non-zero. Using bitwise AND
(&=) directly for this calculation will not give us the correct result
when the LSB of the vcpu's ICH_MISR_EL2 isn't set. Correct this by first
adjusting the return value of vgic_v3_get_misr() into 1 if it is
non-zero.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index 4f6954c30674..ebffad632fd2 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -400,7 +400,7 @@ void vgic_v3_nested_update_mi(struct kvm_vcpu *vcpu)
 
 	level  = __vcpu_sys_reg(vcpu, ICH_HCR_EL2) & ICH_HCR_EL2_En;
 	if (level)
-		level &= vgic_v3_get_misr(vcpu);
+		level &= !!vgic_v3_get_misr(vcpu);
 	kvm_vgic_inject_irq(vcpu->kvm, vcpu,
 			    vcpu->kvm->arch.vgic.mi_intid, level, vcpu);
 }
-- 
2.49.0

