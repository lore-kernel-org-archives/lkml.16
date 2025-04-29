Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A07125DB15
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916482; cv=none; b=IKalRbdZ2aVEU5Uac/ia2Hk+gYlesCY2l2AjujIpDK0WMAu+8yNgc/N6BKgHkx+xoMvq3vxQDKKhkSxV9sf7OyFAnv2OkHwRJZkgq1ipZDho4iioBFc7rnOtpTeKDAv4H4R44sS7FgyGt1csyS7Fiones0YDC2e0WWLWUz4vTes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916482; c=relaxed/simple;
	bh=+ZagfuJC2OTd2P7p3HpRdZfwzsuJtYmVYIRoQXL/BBA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=QuMa949GTjbpgqxQJhO2oD2AExOqIXdgaymGNbBHHGwLrkV8RejsYb5d/SQIIRv6pqMaQBWJDfztDyOUOF21kueCJa+6qccDn9NcePjluY0q7S6qyvjchhfaWwrB+Y2+8j663vLxnVFW5jigQe3sf93vdXNxupg4RtMpJDdf5nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiayanli.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JbdS+SNQ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiayanli.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JbdS+SNQ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff6167e9ccso6631901a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 01:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745916480; x=1746521280; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KYd3MUONGEmmtl9SUW3Ij+b6oXTZesvP0uBT5hlQeAc=;
        b=JbdS+SNQ1PFyVdJ95ov+Uh1CVf3VI//6JCRFkw8QboPaZ9WxORWaGwaluJH2FJUmaV
         vMyY90I4/KyiWYYMlrfvePokGM89OO+QHvaJuQyp7ORO9pLSgLiMpO8PWLitxP2Kg9Xh
         ayXg2d0scfHVpkXm4LkB4aHReVYZKH7Z2TwosBbW2+MaK1WR4MEgD+lz3sb1CUipvExl
         /iUUr7XAsNKxtymO9qzr5q+F15rK8SxN9Em1rnPg4R+1Dht0JJ2SymaVwliBDfHiabsd
         tX0ruOeKrFRTdAlXqO01/rt+fs+f3qnY1rODWF+lCmt5SKnBrlj+oQygrlV4fuqJ7BL1
         ueaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916480; x=1746521280;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYd3MUONGEmmtl9SUW3Ij+b6oXTZesvP0uBT5hlQeAc=;
        b=KunekDvrCRBV+iSFVJQd7as3sD6rvdphENKc2oAx8d+3zLg8OlooaNfL3fIUq9Y8k5
         U2l2DkdF+G88LXumoJnWXtGsqbpBrfX3qbMSJAfF+41FMyZy/HA1mXDs7cNXPOasp4g3
         r7QCkS+3aWcZHw7kiR4Pa5ljPBa7RW1ODtLslGE0clEPJgiVwBFYqs2fyoYrWssYHZ/i
         ruWqgltceMn6q1SsqlfxL3n9B9zFPbgx/7MuooyNCs31AWP+rNIJvSdmIK/5c3Noe5jv
         hgPnb1SofikNuMjHZYQfUyOU9bQmvh2bG9VlObrTNSQaHvi3/sinEaQW1uFJwCV5XzaX
         BOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeR/ahyOZhhik3pc5phbTaUvhDPc1ui9mRcN7kLUONXKw34DpM+6WtbNZly0lfaysqFN/olMJeN8QDxEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUc6rIO6U7mfyszjk76f4Ykln3pJj8WIfCJaFn242kly+uM3Sv
	ub3T4X2k7bpEtC07DTUK/u91irbQn6bN6LKRfiTILfOvXov9sjNcqmhA6aaHYvcrjuViu8Sx4L7
	/xsCCbaoCcg==
X-Google-Smtp-Source: AGHT+IHHq8YG/UfRHBfkc3mFLRSiExeXVTakUlQOc/lfIufC0Uu3iS0szmQe7j0vFj8WM66psVsi10s8SMyc/A==
X-Received: from pjuu13.prod.google.com ([2002:a17:90b:586d:b0:308:7499:3dfc])
 (user=jiayanli job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5826:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-30a21597ae5mr4908479a91.33.1745916480638;
 Tue, 29 Apr 2025 01:48:00 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:43:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.901.g37484f566f-goog
Message-ID: <20250429084317.1619909-1-jiayanli@google.com>
Subject: [PATCH] x86/microcode/amd: fix the return value when microcode has no update
From: Annie Li <jiayanli@google.com>
To: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Nikolay Borisov <nik.borisov@suse.com>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Annie Li <jiayanli@google.com>
Content-Type: text/plain; charset="UTF-8"

In commit 6f059e634dcd("x86/microcode: Clarify the late load logic"), the
return value is UCODE_OK if the load is up-to-date in amd platform, which
leads to load_late_locked() returning -EBADFD.

This is different from the intel platform, which will return UCODE_NFOUND
and is more reasonable.

Fix the return to UCODE_NFOUND to avoid -EBADFD error.

Fixes: 6f059e634dcd ("x86/microcode: Clarify the late load logic")
Signed-off-by: Annie Li <jiayanli@google.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index b61028cf5c8a3..f90779dc1cac5 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1074,6 +1074,8 @@ static enum ucode_state load_microcode_amd(u8 family, const u8 *data, size_t siz
 	if (ret != UCODE_OK)
 		return ret;
 
+	ret = UCODE_NFOUND;
+
 	for_each_node_with_cpus(nid) {
 		cpu = cpumask_first(cpumask_of_node(nid));
 		c = &cpu_data(cpu);
-- 
2.49.0.901.g37484f566f-goog

