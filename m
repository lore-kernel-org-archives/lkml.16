Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6C81EE032
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819752; cv=none; b=bhTInZ18/LpdNkEOCoAg9ENRjg5IJoSpj3bRNEGmq4Od6p55Veabb5X4NTMLNMuS86BXTuL+y2p0Fg1OrAUcIEKB636mywCB5yjvCzWUTVaho6jsL+8YnJ8ogugCQE8SbGUj2qqd9m6PZQn4p65H2ucu+Z4iCgxQ7bbIRrt2Rxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819752; c=relaxed/simple;
	bh=hhevQAoaSXWNMR7psqWfCUWbj4Q7A3+E702C4036N/o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mo9OT1NzRXWsvpz70tSUhCdU73Yfqtul3Qx1ycjaoWIf+E2GkoFgL0qt+lwDoI9CL6SYdnASfwkst5oYyU7n3d+nL9g6Jq2ZLGAiCLIU6ySfqqOQAuo3FstWjF/f6wvKznFwb8rtMsYUw7ad9qpV2/IEsF0KToMoaQGxwcQEZVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YuybVPR7; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--qperret.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YuybVPR7"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso570694366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744819749; x=1745424549; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RtCepilI5OBYKPwI8IAZ8i1mwTcn2lnNiKdpddQ34xM=;
        b=YuybVPR7fkIXM9CDZqWr7cIHSelcdtFZu7d/uuMM3M8R75KK0rEo3IlSOT1cNLXsb/
         mhiFzb+bPg0x5b84w64x0Z8Gn+cTawbiqFVrEmAtc25MvH8hp3vw/T9O2XwoBG77gSQJ
         hHlbjAYttJuFEwOp2Rb8Ho6jpa38EuHJsVB2j4iED4hP61kcDMgxzXHVGBuW/Hn7g1Fd
         pYu/EXKIktbyyENOuLMasJd6cQqcjquTgTu8l2rQxF5yjy5cd7q0xwbFKUm0EfLvb6dX
         isDSm3JxbAR4r9obzZ2Xb1Ug8tLK6UW/0dgpbem49IPMduX4cuIBfEJm6vEdcI5R8ubN
         3cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744819749; x=1745424549;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RtCepilI5OBYKPwI8IAZ8i1mwTcn2lnNiKdpddQ34xM=;
        b=N4n/yLHvMosxDTWnCO2fuS2Aw4FsHyGLf2pOxPpxQNKgydfhAqUKOtoPMWItE35kpC
         sp3PZ0fb9KlyjaaXRB9TRZ9Yb3Zx+FIg5MX4m3RBNVVRG87M0iVkkjmiKU4/BzPoaKC+
         eF5bNWS5+STDvfClFRdRJdaoal9GXBqOaD1j1PEcwZKZD37npwDiJQpVcvKrtkHCK9fT
         zK7rusSXjSA3U+9UKpGmeUd2eQQL3CVPgVrHTKH4lO51Gkhl1K9EJ+3/DVFeS/OjcRCz
         9qk7RwKJDRayA6rYPsOgqDmr3MDM3QMXQePfnIwDdYHcEFqaJVHqwCxKuaPLsAmuz3/m
         V/zg==
X-Forwarded-Encrypted: i=1; AJvYcCX3sunqX3IuHTRAJ+9RzJLg+ZRu1oPsVulOSbUkrYQ+3YaHIoEvqeFl6wjnwyTsw9D2L+RxhrkTEV+EnvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8QQVlg9ez2Gn/hl//Tv4kN5FEUbZ90TTYdS9YUQjLTO1Uy/ZD
	zGXwVYM5VcCjlrIsX+Z0tgwnR9GB7hvkCp2be7N9s80wf453iSL+Q365GFI683I1Pyf5oiGVl/b
	17S/8GQ==
X-Google-Smtp-Source: AGHT+IE8dk7jeA22VzWx81hj6NCNcV+aNpnoCWIVeIKMbzFyUD7FL3Q4EHx6osWargcZiCuELO7brSsBTvZK
X-Received: from ejcl9.prod.google.com ([2002:a17:906:789:b0:aca:9c9f:6358])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:7203:b0:ac7:82b3:7ad
 with SMTP id a640c23a62f3a-acb42b6bb71mr224251566b.46.1744819747999; Wed, 16
 Apr 2025 09:09:07 -0700 (PDT)
Date: Wed, 16 Apr 2025 16:08:58 +0000
In-Reply-To: <20250416160900.3078417-1-qperret@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416160900.3078417-1-qperret@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416160900.3078417-3-qperret@google.com>
Subject: [PATCH v3 2/4] KVM: arm64: Don't WARN from __pkvm_host_share_guest()
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Quentin Perret <qperret@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

We currently WARN() if the host attempts to share a page that is not in
an acceptable state with a guest. This isn't strictly necessary and
makes testing much harder, so drop the WARN and make sure to propage the
error code instead.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 709d286999a1..4a0f98943577 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -921,7 +921,6 @@ int __pkvm_host_share_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu,
 		if (page->host_share_guest_count)
 			break;
 		/* Only host to np-guest multi-sharing is tolerated */
-		WARN_ON(1);
 		fallthrough;
 	default:
 		ret = -EPERM;
-- 
2.49.0.604.gff1f9ca942-goog

