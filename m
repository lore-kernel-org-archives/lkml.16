Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E35250BF9
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 14:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739284762; cv=none; b=j9icP7nEI/o9UxWSBdzuw1Rmgy7Zt33dWYx0FVgAICz9Roo1zicbddNOaq9okEBV/fO3Hq5UEaY2psaNvVTTBdiVx7+0NSuj2ZR1pJDjNsYBJqqFs9LFo3tYbbsDuy1K1wuCGeiMGN4lk6i1d8ryJVfE4I9ldSIhVRa9u8fWc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739284762; c=relaxed/simple;
	bh=ihZTUnNCx7oVvaG3vXkXUqPeXG57VCMH8qkgDKmY3cM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p5L0mNYxy5nvltCiMZN3oSp7eUrrr9UMzAfr0g2WhR7yPc1KKf18dUug1USP2Omq+71H9eIZhOAgQaUOQQHBxkNre1dxtcShnIAvh7XPtwmHlCqH9BaemVwHTTRMtbstBPMUckcxG33yFHZTqwC1QjMOm8T0N1+nye+vkWq3LXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EIhJJ7wM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EIhJJ7wM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739284760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZoQgH8y9XMOLCDCfjmngqj84Bs20C5H4G6N3AWreEs4=;
	b=EIhJJ7wM+je8WN8Vubu7a76FYr9f+YInAjRFbp/q0evNqkLyLn3l8KV+eN4eN+9njxb7YQ
	ygLVUSsOmj8wirCx6vGkAzYdLpvgOh+n07SRT3BvIPk7rfodTG9ViVkh8OoZpyP8aDexJk
	yYyRoV0I//z7IzD34rGHarHwl2vbYPs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-222-DC0_OMZwMsOPDnCNLJdL4w-1; Tue, 11 Feb 2025 09:39:15 -0500
X-MC-Unique: DC0_OMZwMsOPDnCNLJdL4w-1
X-Mimecast-MFC-AGG-ID: DC0_OMZwMsOPDnCNLJdL4w
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-38dc88ed7caso2579481f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:39:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739284753; x=1739889553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoQgH8y9XMOLCDCfjmngqj84Bs20C5H4G6N3AWreEs4=;
        b=c3nx2Joq1Uz69wznsTJAaQuKMtm8Q1rCVD6gfeahgW/tqSzK7SM/MqmkqgLLE4/xxT
         FhOkctMMhlVeaNVwZhU3c3qx6VUC8y6RN6P+cVttXcObDjudgkPHNm2p91SOoMJKdMmA
         aFI0PjxFMvygCFzINfDD2TfZW7Qt10dw8wOmBBI4nAyxJtF9Z6YiS2mELREbzqTOrKmL
         EIH8GHb+hc3Xa1kP77GDHmg37CAnVPZpI/hGZaDf3sE1cI3lSnVxjAoK1GPzkwmdEXLT
         QDA5sYloWS5SJMSXlt4BajP9XpqI0Ub2iGNZ8oqR4ZZ2Eln9zONTcL7UMHV/c61TLGhN
         IVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnpTKigU7BQ+I6zMGFGfuTGHAO0WzV2znbpcl1S3AVPEP6Gi+kzqUzhgtuyrnlT5TVyxPLyA3+6klFn+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3+Sdrha6WNm7RG4hesRVjyaXr7XJ757ZE1MPxhz0skhHov0Ee
	Puk7/Rn2sk9CZjDSWbzRS8NmYJ77fUgR+u6rU0LS8Pxn1ewYZ6+i8q8spgBQsEShtQhh93jp0BD
	fOKUI6hszEiWsRLvavccJO25vm31GKqTrSj1f+CimE0sAwnI/qzw7GWZKyMORUg==
X-Gm-Gg: ASbGncsJ/DjQeL31Fb2RLmoj2tOcx4K7dNERVCiDfITU8rtmTaE8sv0JEkpSjbSKV3v
	CyKX5gfiaI6KwkxcyoczamXzBH7Phkk+v6Ui8zKkIymNHtmVyzfZ5noQX/hGUeVa2vHh+AgwYtJ
	LJT9ExgQk+25t7nApWKHGGrnjGs3U+qUvEiLpxr+VpiL/r5KRSB/PrEXZuE8X6nJBEvhx3Py/YT
	7eQti8EDi8umh4JtE1+Y1hUNvf310vJd2Td4TB4pN9e6baEBIkxdQRAF2+MPUMAbHsrCQCF/z4n
	TIXGlbqqmWeZ67sJqwm/Dmlu4S+bF6p2Tc/V/6XWlsLJ14XG5AnplCXxqc+iAGB/Muo=
X-Received: by 2002:a5d:6c65:0:b0:38d:e21e:13c6 with SMTP id ffacd0b85a97d-38de21e15bbmr5428373f8f.42.1739284752791;
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnmCgl2Neh2gVGj5aqOcVFIT+QLH9P2T4wOLD+vmwJJ0KUgupsifZ5q/dSypBIiLmFb5E3VQ==
X-Received: by 2002:a5d:6c65:0:b0:38d:e21e:13c6 with SMTP id ffacd0b85a97d-38de21e15bbmr5428350f8f.42.1739284752401;
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
Received: from rh.fritz.box (p200300f6af0e4d00dda53016e366575f.dip0.t-ipconnect.de. [2003:f6:af0e:4d00:dda5:3016:e366:575f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dcc9bd251sm11745833f8f.9.2025.02.11.06.39.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 06:39:12 -0800 (PST)
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
Subject: [PATCH v2 0/4] KVM: arm64: writable MIDR/REVIDR
Date: Tue, 11 Feb 2025 15:39:06 +0100
Message-ID: <20250211143910.16775-1-sebott@redhat.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on prior discussion [1] this series allows VMMs to change
MIDR/REVIDR to enable migration between machines that differ in
these registers. Since these are used for errata handling the
errata management series [2] is a prerequisite for this one.

changes for V2:
* let the guest actually observe the changed MIDR_EL1 value
* extra .set_user function
* added selftest

[1] https://lore.kernel.org/kvmarm/20250124151732.6072-1-shameerali.kolothum.thodi@huawei.com/T/#mb855bc51714095a164a7b26bb8bead1606e4b753
[2] https://lore.kernel.org/kvmarm/20250205132222.55816-1-shameerali.kolothum.thodi@huawei.com/T/

Sebastian Ott (4):
  KVM: arm64: Allow userspace to change MIDR_EL1
  KVM: arm64: Allow userspace to change REVIDR_EL1
  KVM: arm64: Allow userspace to change AIDR_EL1
  KVM: selftests: arm64: Test writes to MIDR,REVIDR,AIDR

 arch/arm64/include/asm/kvm_host.h             |   9 ++
 arch/arm64/kvm/sys_regs.c                     | 151 ++++++++----------
 .../testing/selftests/kvm/arm64/set_id_regs.c |  32 +++-
 3 files changed, 100 insertions(+), 92 deletions(-)

-- 
2.42.0

