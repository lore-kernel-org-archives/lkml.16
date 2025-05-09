Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDE528EA44
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 10:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784812; cv=none; b=sFhHkSx+qjkBUKyWSF3mTkplitMiuzcPSDuSAvuqWvur2f1gqlt5Fi1Fb48Thh+KmLBAJP13ip9PImbYpaSt9301vkHQoIr41fGG08vhUJTJ1NVFt5I1hVREZN1e9Ql8Wkn9hVSIJpRJNERu878AnoEBGsBqGbHkdyUIYOgBVzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784812; c=relaxed/simple;
	bh=urWBHCD5yL4sRcpxDe72lFVdmLkE3SEYkUgV50YJwcU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lj5EvxNj4diaJun4Tn85YnMPasObytRKOSOSDVD95SxRDyIaRjqDe75688zcIM7Jxe1jk578uh4IOI5bEaxuYMNBJ4U11yf1r9QLms5IY09n/Svz6K7I8afA58fdh5OrBYnd7FLm5V5Bgn7zO90vHVW2199US8tkaaL7+8H77lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5iFBG3i; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5iFBG3i"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so2086229b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 03:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746784810; x=1747389610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=etoiHHyRBq2rLgJXv5Y9hE7Q7cEfLHiNK8ewd9bv5mI=;
        b=W5iFBG3ixS81NhqzgF2wpkEoxeIrNrDJJ/yaUwrxxJvbvL/hZIiiEimuCNJ3h6w/yv
         4xrSrH+nJUHM4uZJDavXwzcUJ7HCvhU2N8KowTBssDl9gzvlOy22UaNwXNYuhoLKc+Aa
         w7zn2+MrM6Q+jEg9YfaPYuW/Y035ZiptvmVJ6NC5pyWv9jLNTehypfdvogDfHJntKc8C
         d8+ep1gR4YpsIAzsNMshhemAqmstxQ8z4RK6KDtC0SOUCswivXrIToRJpS1Jzvb+yW+h
         RL7+khT1uYGMlqLKpoZ9EDwEms6VPAPi5Ri0QsDRTahoL5igylKKzCJXiK9x/tuhkybk
         in2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746784810; x=1747389610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=etoiHHyRBq2rLgJXv5Y9hE7Q7cEfLHiNK8ewd9bv5mI=;
        b=DEDqV+PNRezSNVas7/zty7rUDps3eH1lw0QJaqkd6ZFb9Znpy5FjgJ07x/xkLn/OoO
         Lg2xArHYSplcPg4615QniedVLx5B1kyYcfnn02R5wQu9Z2xTbtb6lEZ6lebvkkaD7Q5y
         JmpV4RMU9UK9q1Df8xtVhQgSyr2YmLM7Al1U795Z8znXgxVxVQ2opz0BCRZWg2F7ZELZ
         JpzPsSaCW8LnxUmJDm8YmAjVfKTjzCvdA1PnniHN5m1dBIzHZu55ewV739I36Ue9s8jC
         ZLErpEt0EQRZAhSjVeLAI01PL0SSl7qDON5fFS+pc7HpCHRiikhMayQqjoX6uNFL4o+2
         V/4w==
X-Forwarded-Encrypted: i=1; AJvYcCWB2nPc6wstZ6/38582fvrr5fealb+FgS+S4BIuCqltnpKVaCz5WcFtF42TjaGI8oWmToLTvphK2Byf5dQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfx0fz1MKNgRiK2z4/WL3M3t9vPeg+zA9xfKROOlaf+FIVGYAt
	d6wOJJAfD4E8Ifa24B1fSfCDUziUMPLQ1sMleP3WKRGDbMBa3OttY+FVGg==
X-Gm-Gg: ASbGnct22RgFxabEvfCCi0ibNNQ+HD+DbDQob2V6OUiwq8sOVRp6/s3olWeyTdpELbp
	OLCvUGyZFeads5ViEx6q7i1CKiCjsCW9j8om/I9ZKYMmfUsEc0OGJFrOnCBW9fjI0oox7Jqu6i0
	JYMa1Og9tu6Fl6dCgvlGLjn9UeUy6NcK6ws540vFqGAh7xZ4XIMYOCY2TtfBukOTUCI8x1UvLVU
	YlHcuQlaZxhBpucwzWXJiblf/BYjBfuHRVKiLTRj0A9OFPffOwCWq6PFSJzp3q6nMrHkPPPU1rX
	912cw2CxXCw9yFiooBuCRPU6QfVC2vJ4/gSopg7jre2Ze+PR8SR1
X-Google-Smtp-Source: AGHT+IEQRGYYdmuOQpYE6EFYgcT85Xf/QwhETlpYtJ33rrK6CmDFYaOZXAoRcYjJE621GAnYX0Yxzg==
X-Received: by 2002:a05:6a00:9286:b0:740:a023:5d60 with SMTP id d2e1a72fcca58-7423c032792mr3999373b3a.19.1746784809483;
        Fri, 09 May 2025 03:00:09 -0700 (PDT)
Received: from OSC.. ([106.222.230.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237704f36sm1419403b3a.36.2025.05.09.03.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 03:00:08 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] KVM:FIXME comment is removed since no longer required
Date: Fri,  9 May 2025 15:29:57 +0530
Message-ID: <20250509095957.6271-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIXME comment can be removed since finalize_init_hyp_mode()
is invoked after kvm_init()

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 arch/arm64/kvm/arm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 19ca57def629..36a4b6277537 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2856,10 +2856,6 @@ static __init int kvm_arm_init(void)
 				     "h" : "n"),
 		 cpus_have_final_cap(ARM64_HAS_NESTED_VIRT) ? "+NV2": "");
 
-	/*
-	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
-	 * hypervisor protection is finalized.
-	 */
 	err = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 	if (err)
 		goto out_subs;
-- 
2.43.0

