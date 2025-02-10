Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C71C244195
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202605; cv=none; b=MieJuUv3z8nMsYBEjWYGVHoF9UJe2H7YuLh++JmSOqwDN/EjqUq5RYHZ4p+6Wz3aSdgEtlvi4ijgstDHzHewv58LevOu6IC4YgOUK74GSV/7pzCabPW73rlX113RfGBi0T7qfjcYHEcSB4PVInkAKFrdqFflSacH7gejsk05t6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202605; c=relaxed/simple;
	bh=JwX0FTJ7E53zMSff4xw/NDJGkvTh/vf9GUmKygpIM2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GA8gbAHNW0aDoD1za03EejhUVZ7MNotO73cZchBIf3ZMBTLm7NfJ/HIY3Vp2AdT5Y46aqUcZd0NzrGOmfqIP/P/pRW4reWz9MdjkCmimAngFeF17dfYbT+AF3BoR5uCoLgWUXKtYnlB9dyFdGvkJ8Za6jqa3uPFzuWcqNgLiSGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4QatZHs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4QatZHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739202603;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLF8Cf/xB+6V3hagRkehtOvA3nhCvcxfhJ41oAzlRW8=;
	b=Z4QatZHsJMFzfCANUHCc8vROaVBlw2Kb9UiQnZNnkq3IiNFpwfepfiHU71ilYZnaBriJ+q
	SzWZvlGeWW03emcV+WkwQ7OjRxRGuknjv9xld6rAupRQToQJgzjHgcwqd0xryoL5zrdzgf
	LaOukYPipYnDNLov5vjHrcNBpOFhOHM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-DvE2dkUWOr68L1uu22d8-Q-1; Mon, 10 Feb 2025 10:50:01 -0500
X-MC-Unique: DvE2dkUWOr68L1uu22d8-Q-1
X-Mimecast-MFC-AGG-ID: DvE2dkUWOr68L1uu22d8-Q
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4394b2c19ccso3938935e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202600; x=1739807400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BLF8Cf/xB+6V3hagRkehtOvA3nhCvcxfhJ41oAzlRW8=;
        b=joomMHH2QkpJ4E1EgfJuEYsOtJQVHp68zFKCjUmTxgECiAZBEpzwFEcfE0PCE22Vne
         vROnUQ/DSNlPyxLx4r4j3Mz13jnYFEkKlfMi+O62PvEi+4Oti45IOwyOE8QF1GR9nmif
         EmyayRtGK8aYH4o9bG/ngn6d5XwI5szAcBHE4NHX3ujBRef8Xwa97tJQlye/sAzEvRvu
         UQaps5VEi0SbttIr5qLiRKnoQJb9bRMX2srbPvVc8GFPQOYs6E/ud0UgyiOtvV5yGiyV
         m7pMx6WeRRvcGRLkdqb1BTzULKIFACaTbCsYDIGA2N2G/gxYa3F5uhKhglIIilMEUV3q
         BZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCVEKaTsPg+ji8HEvFEGoXkh6LK4461XRXjwA7ETU6mwEFtzXK16FHxLDBV8IqzC98cUXofspl9H3ydTgTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybEs+LPNFt0YBXDWZgCXe5VmEqSQ3FMokdMkzjGHBayL+gtd23
	ljZtOIGihDwgUi4r8lMespxkPLzLCR9egmtJ8H0lVHJd3KHE+nKEPECuzopi2fvGsqpaGp9V9MY
	4JNVdBEDD28ufX2b92wwHcHu6hvnGYGmObIhxyz7hPuJ3V6VyvxxpwgEADcUgtw==
X-Gm-Gg: ASbGncvFfMabT+N8hm0BPIozee/nJd8pA3J5Z5Qkt26PVSCq6ZqDU1LniaLtZxivLnT
	OlA5O+NQreKwH8T2xQKnyXdLi4zDQw9DW4scvHyVBxojGcoRWTSVuuK874Zn0XWvT38YYJ5K/9o
	nDW6PhIglv1cXXBgW6p2kDh48JP2USSbd6mwQOTXAlcBoUkBZnZGWvCTGj3ttSfJOqpYgNnd+t2
	zhmJ0TjLUC7ws09O9e226iVly5eKk9anhHngqP3D6bDHDykmoqU97WHuPKGYNmia0DYANBOgKdb
	N8OUATlppdTkkWUibGWC4dEPdYUWwWbJqL0TazQlyUBpCP1pMACj/uVYxOW3b9jhN4o=
X-Received: by 2002:a05:600c:3d06:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392f1b8e78mr67201685e9.1.1739202600505;
        Mon, 10 Feb 2025 07:50:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO3zxKwhpNf5G9RIMWhyWsZJwinpmx8lRLWXcdVcXxH5R1Bp8BJUV0bb9Jd4M71qBY3iU3wQ==
X-Received: by 2002:a05:600c:3d06:b0:436:2238:97f6 with SMTP id 5b1f17b1804b1-4392f1b8e78mr67201305e9.1.1739202600117;
        Mon, 10 Feb 2025 07:50:00 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391da96502sm153559395e9.1.2025.02.10.07.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:49:59 -0800 (PST)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] KVM: arm64: trap guest access for REVIDR_EL1 and AIDR_EL1
Date: Mon, 10 Feb 2025 16:49:53 +0100
Message-ID: <20250210154953.27002-5-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210154953.27002-1-sebott@redhat.com>
References: <20250210154953.27002-1-sebott@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Setup a trap for guest access of REVIDR_EL1 and AIDR_EL1 when
the VMs value differs from hardware.

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
 arch/arm64/kvm/sys_regs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 7d588fedb50a..2918872e3d2a 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -4910,6 +4910,10 @@ static void vcpu_set_hcr(struct kvm_vcpu *vcpu)
 	else
 		vcpu->arch.hcr_el2 |= HCR_TID2;
 
+	if ((kvm_read_vm_id_reg(kvm, SYS_REVIDR_EL1) != read_sysreg(REVIDR_EL1)) ||
+	    (kvm_read_vm_id_reg(kvm, SYS_AIDR_EL1) != read_sysreg(AIDR_EL1)))
+		vcpu->arch.hcr_el2 |= HCR_TID1;
+
 	if (vcpu_el1_is_32bit(vcpu))
 		vcpu->arch.hcr_el2 &= ~HCR_RW;
 
-- 
2.42.0

