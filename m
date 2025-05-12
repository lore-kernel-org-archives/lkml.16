Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952F8295500
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747056618; cv=none; b=laswf8SYKWeJkk1d9HY93HyEPd2xw2yye8ypvY0emTfSLYMJBifFbBaERLb2/SJ50Dgh02fKLQPIBRarrV2bnKXSalhry5QgdNf91QjjYzI3bQTNHQjp3s9w7EgrTc/FNy7ZRJSCuX/O+3Q/VUDJYiGfaHscnbx1M/Y+Hp9jIhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747056618; c=relaxed/simple;
	bh=O8oz5UvKiTFaAgUQe1w3ZHg8nAMDBTrMSIwdDYm3EAE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SFc7K4GC7nvMXuzpJsPUpIY5gwWSui8TnBaRtdafJkvCe9xhEb0+tlsjhVPkoJSwHwb2CWviM+dyp/3xEVFzJwYT96R/Q0syrLNnKScUpEyludkRSuAkkLqRysn6/f9Zk9p2xZ29tXkkBfZTvo5g7/sKKdjboAqLrnktqrk+tk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw; spf=pass smtp.mailfrom=csie.ntu.edu.tw; dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b=hI33z0tR; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csie.ntu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=csie.ntu.edu.tw header.i=@csie.ntu.edu.tw header.b="hI33z0tR"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ccf0e1b3so52130345e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1747056613; x=1747661413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0jvL9bp0RhLH3gFStx+IoQOSIzReGN6we6Sj8t7oo=;
        b=hI33z0tRKXBUNmuOsZuKg5r8twTlx4P15iGap4f4ngJNysiIDcl155Heg65mjy5ecG
         dCBevx51aKjuNLvOcdfJOoA85dBOfw9g6UcF7aEztsJGgoHrcoJhTF1nH7H7MuMaLSLq
         r6rV6g2FOQwNWIYUQMDfnoAGpYHyeyDre7IC1oASimQVlLtPtlO3PMidjCbGpRLYUEpO
         +jO7nDKZae2XDTH9DycBZe+7NHKLJR2s+ZpI7W2w/XFDnxp5XJ3gIhX2q211139Kzk2F
         yb7i3Ydpri3ipYyWNPme3e/5ELZFggnWhHF4WkFvc0BnYV3j3kGpUj9zfYwWaN9xwVz/
         nHEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747056613; x=1747661413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O0jvL9bp0RhLH3gFStx+IoQOSIzReGN6we6Sj8t7oo=;
        b=SX23JiVrAl2eNSWmziAgC2xGDDMHerDUSGnBFZMyscT5LMemczF19nGZBZSr1JsvU7
         kOB1jguYsblBcfsIl9kMSpAVx6LwRQ5OrHvv1QbCxIzKn/kJdNl10awyFVVmdCbhZrR4
         5acXEo75cwPYOZUP0WdLKAuVVk6Lr3JT37hjpvuJ7cQUsKyYgLt+cLVauHrAWkJ42Gox
         tyCcP+Cj9AwBLBI6T4d+JRbBaCe7ODyBKq0+lD3MR/RCMVc/+J7Lv36oPPJ3xVFZveDw
         BAjX5LSCvjoSjZxy11CPsdRQ9NOh+dGZqiizkVeTf4k/limmZEWd9yybgXNfgWm/OpLp
         Dnqw==
X-Forwarded-Encrypted: i=1; AJvYcCVBE+2fscrFvS0PYADb5ogrAxYdMW9wH3wB4HXsot3ESXniJHR85/7fIC7a6D3dhRgnfebxVrYE2216kn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXw2+fwbPy8NpvwOL7A0P9LIu0FZnnKcLCVKpWmQVwz72TZ1Ti
	W9J/CEld3UcCo6ZI9hDsoBcw8BW9+qgPMPpaavqf5xqQIcbbz/AO0GRsZu6bZPtF7ZoIr56YYP+
	fmvX+yhZjh/p/hZcccZr9BlZAoroQcvaWNJ7ca2H5rUwQPsETmF2hVm0=
X-Gm-Gg: ASbGncseIK1DCMsWENahUvxPhTtmv422mmrcQOoa556AtK3Fd1RJ8aS5rkcrhfTqX58
	w/By29INm1aJw3tZQ6tgBPK+4PKbtZA3bm5dUTrE1Wz2++5sNLT0iekXgiEwGZvB+KeUfYpAs82
	/AUfKE0lsLBMVLa/jKw0Hp1zRok4vdFHjRI4bPb445z2EdorpDiMJZ612MusWKVya1p6sWKXbcd
	gP66O2AJcLgIMyIsT/+yhuVlC1Xp3GMXHRxTa0dR8gjjsygctAA7zGpCJeEU/AQw5JFGuj50LTT
	bdVX+C2+VapOhZkgukXAug7OgD3ewUe4nwJ/Xh3ur4UeBaXP6OAX33D2/iDqtjL7dwng9Mv3
X-Google-Smtp-Source: AGHT+IGvjNxhAX66VVq4W0wV6STryscjMOGjWiI63Myou666P8Evc1sc/t303qv3kgeVp110Hjntxg==
X-Received: by 2002:a05:600c:5250:b0:43c:ea1a:720c with SMTP id 5b1f17b1804b1-442d6d6ad52mr105665795e9.18.1747056612621;
        Mon, 12 May 2025 06:30:12 -0700 (PDT)
Received: from localhost.localdomain ([213.157.19.150])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67ee33bsm125593325e9.20.2025.05.12.06.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 06:30:12 -0700 (PDT)
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jintack Lim <jintack@cs.columbia.edu>,
	Christoffer Dall <christoffer.dall@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
Subject: [PATCH] KVM: arm64: nv: Remove clearing of ICH_LR<n>.EOI if ICH_LR<n>.HW == 1
Date: Mon, 12 May 2025 21:32:23 +0800
Message-ID: <20250512133223.866999-1-r09922117@csie.ntu.edu.tw>
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

In the case of ICH_LR<n>.HW == 1, bit 41 of LR is just a part of pINTID
without EOI meaning, and bit 41 will be zeroed by the subsequent clearing
of ICH_LR_PHYS_ID_MASK anyway.
No functional changes intended.

Signed-off-by: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
---
 arch/arm64/kvm/vgic/vgic-v3-nested.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v3-nested.c b/arch/arm64/kvm/vgic/vgic-v3-nested.c
index bfa5bde1f106..4f6954c30674 100644
--- a/arch/arm64/kvm/vgic/vgic-v3-nested.c
+++ b/arch/arm64/kvm/vgic/vgic-v3-nested.c
@@ -240,9 +240,6 @@ static void vgic_v3_create_shadow_lr(struct kvm_vcpu *vcpu,
 			goto next;
 		}
 
-		/* It is illegal to have the EOI bit set with HW */
-		lr &= ~ICH_LR_EOI;
-
 		/* Translate the virtual mapping to the real one */
 		lr &= ~ICH_LR_PHYS_ID_MASK;
 		lr |= FIELD_PREP(ICH_LR_PHYS_ID_MASK, (u64)irq->hwintid);
-- 
2.49.0

