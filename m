Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26B913AA53
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 06:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751438574; cv=none; b=mGwPsyJPJ3SUkGOznSoDGXp/t6Lysk2qngg+wad/RDsPEt3ckmyiomhPU2USpFQ5UST//uPYmTGAbhBFBNo7slb/dM+ULmWhXo+zufRLNltLeFBSKLT1XQ9kfTiXInGIvjbPjHVZmxhxYGV2rolEv2zr0gKnIC1er61Tm/gqP5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751438574; c=relaxed/simple;
	bh=GyW877mcPzQ4uRJJlN5TIEGPtLtyctz90spQ+sxk5a0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Btk029yJx59MttghrNhAvtNnKJpMbcxmP0QisKgZRHV/CvmwY4nTkn4bsv3131C2sN8/Z2BoeD+Gde94zfi25Y0kFbpK8GBs/hTbfbEEJwFAhIOIup9pMHJZjKVTNaQzBIfRDqQwZEX0Fr+ZbnOOgQuRD9SVDIPz9B0RWE1zf+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=YY4Tk6Ur; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="YY4Tk6Ur"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so3353546a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 23:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751438572; x=1752043372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z9EZ4Phati0b3r4J3srvUg6U5BmjsKi6c3l/xlKPGx4=;
        b=YY4Tk6UrfH6i/v3QzDJnwo0Eha3ua5nqM2n2cAW33YAHcInJlu1mas6q0zKPX8cZUc
         uGgC1POLjUw7oufIOKunzABCdJn7AOKaj10Ki4JXRa0OYK1aDcAW2AGHx4/lwamHYZBB
         6b9qDWjtqJZudKhBSg8hNWzAhhVU7WE92oU+IyFNYeLMUOgIAWk3sizTExLhx8TC6x/o
         Mr5PKaKP5H9zbei4FCHBQxZ8D38q/C1FEoirt5UuMOk8ymQG8VIL1KVXiX+MFHJv9IJg
         BZ9LIahdDjUt9ucvCpNVNBMB9hubnWsvVocret3ADIeeicb2/xyJrco+Akd47QdJbDCU
         KWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751438572; x=1752043372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z9EZ4Phati0b3r4J3srvUg6U5BmjsKi6c3l/xlKPGx4=;
        b=jIFemHjK98c5OQ+HxiMEzJG1EHzFbQCNfMYipHuTaGU9qCPFmpkqGfPCYDjnrzOmOq
         xbVlU2qCWYErGsaLdQRFzKk4gyvOWLvZTVkJvXj46dxQ12lXOsR590Lt2ERXEE1p3ALT
         iD842Gkioe/xspO/Zzau5TXh6TY9o1iR5YyKq1bTGFeelV/ZSrnS7v/eQWJWnVare1gV
         DoLCB/PgcQYcAQju5esSdNES4p5hP+ZcpsaeY89lXhYHaHB2IYhj8L75jKze/adG5ljk
         iGx5Vn55Uci6lAQyxU24AEMyQnVJdhlYx/cUVziDfzqW/4KAhPGRHXTZWZ7PjGxGql+A
         TEEg==
X-Gm-Message-State: AOJu0YzOeOjfc+VV4BNg1bQafUkmth4ZYMOdVSKPu9gkKG1+2MqxaXQ4
	a4Q/xhDMNluhBq2fKKitvgeUH9ezZiWx3FP/sNnKvLGw3ops8NmOs/q8YYuLO7p2MJ4=
X-Gm-Gg: ASbGncs+kS4WSuVBXAWN07kYTwrImmHp7e38Ngl5cHsZdfhE8+pR5cfFPzfqwP+t97h
	zaAzoRdNx1hun4v39y64lTj2Rt9gDrK+FbMPs8gMgfJzS5DrvxPjXJKcb01j1lh+Nkrw+m30AFr
	FDy7LAqd1pwhiuS9GJ46xPR9CVYCJZHETOSdv4wDdVxlYSFyPLTCij+pioMOiXR+45C50fdxjhL
	2qxq70VCFRtehfgi4/OZDJZT2l6rnHcNXtAGbEf+kDvYQscZZ5tLBOxaPXBRWG4KSEi+oZCGbQ4
	EBTypnac3rjZf0s30Bai5kFa6YQ+cCIb/3lx/GWWp8sXpEUExg9szKtpE0AvK2ZQayJCs+h1cEa
	l2DCy7QH3gGVPW+X1dA==
X-Google-Smtp-Source: AGHT+IFJ9zmlK89dYYgj1n70N+CdCmNhaprpSgGf8BJahRpAbIqGaZGNBAEBSiNChxrDNeo+HpSy6Q==
X-Received: by 2002:a17:90b:54d0:b0:311:fde5:c4be with SMTP id 98e67ed59e1d1-31a90c352d5mr2767102a91.35.1751438571985;
        Tue, 01 Jul 2025 23:42:51 -0700 (PDT)
Received: from T179DVVMRY.bytedance.net ([2001:c10:ff04:0:1000:0:1:f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5441770sm18439960a91.48.2025.07.01.23.42.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 01 Jul 2025 23:42:51 -0700 (PDT)
From: Liangyan <liangyan.peng@bytedance.com>
To: pbonzini@redhat.com,
	vkuznets@redhat.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com
Cc: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	Liangyan <liangyan.peng@bytedance.com>
Subject: [RFC] x86/kvm: Use native qspinlock by default when realtime hinted
Date: Wed,  2 Jul 2025 14:42:18 +0800
Message-Id: <20250702064218.894-1-liangyan.peng@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When KVM_HINTS_REALTIME is set and KVM_FEATURE_PV_UNHALT is clear,
currently guest will use virt_spin_lock.
Since KVM_HINTS_REALTIME is set, use native qspinlock should be safe
and have better performance than virt_spin_lock.

Signed-off-by: Liangyan <liangyan.peng@bytedance.com>
---
 arch/x86/kernel/kvm.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 921c1c783bc1..9080544a4007 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -1072,6 +1072,15 @@ static void kvm_wait(u8 *ptr, u8 val)
  */
 void __init kvm_spinlock_init(void)
 {
+	/*
+	 * Disable PV spinlocks and use native qspinlock when dedicated pCPUs
+	 * are available.
+	 */
+	if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
+		pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME hints\n");
+		goto out;
+	}
+
 	/*
 	 * In case host doesn't support KVM_FEATURE_PV_UNHALT there is still an
 	 * advantage of keeping virt_spin_lock_key enabled: virt_spin_lock() is
@@ -1082,15 +1091,6 @@ void __init kvm_spinlock_init(void)
 		return;
 	}
 
-	/*
-	 * Disable PV spinlocks and use native qspinlock when dedicated pCPUs
-	 * are available.
-	 */
-	if (kvm_para_has_hint(KVM_HINTS_REALTIME)) {
-		pr_info("PV spinlocks disabled with KVM_HINTS_REALTIME hints\n");
-		goto out;
-	}
-
 	if (num_possible_cpus() == 1) {
 		pr_info("PV spinlocks disabled, single CPU\n");
 		goto out;
-- 
2.39.3 (Apple Git-145)

