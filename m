Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268411DA21
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 14:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746629554; cv=none; b=mWzwJ7Z98Hi1gUCUWCGbMK9isoQCJBgtsGf0G2clW5CTtJzscjht9tcKfM9/gkk+QCSioTwZXUthj0HEP47IE+qQ+w81O/OV7ftmIfLi15XOWD5HQ5ifDurDPJYxkwX2bBfrzYpbR3gLg72JYcC2l4FAKCsm0jimUWvv4WR0f5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746629554; c=relaxed/simple;
	bh=k1Gf6ZXNUH4fEbh4iOt5me+y4uBtymrQIayqnyTR60k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E92hq40ad23Y26vsusiwZukLUFSYNhg2TU1FczNBxiG1P5EBcorQCedytvGG6YN0fe8T76flnH932QJgjIm2X8l+vHnFEUkC4tDM9DqoP/N1jyKMjkdzn3B5oduIEqj76DhdljWlZPZ3lhZHLtcURVZJzSMVe4PWiv5lX8SSv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=lfpnkVrB; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lfpnkVrB"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736b98acaadso6803213b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 07:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746629552; x=1747234352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2PbJx/2qf9yvQbSCx579VYOQTdqNTod1v7Nq4aCt4bM=;
        b=lfpnkVrB+Mb6yxLi3jKF23wKRo3Ir+g45YlQ8Z0KuXA5/RE1MzgYB8SP+LJiJsh2yz
         a3QTKoz8mE77eFVqWAd4dLv4MG2slZkfeSFl/mAj3ZC1yo0Kr8aZZovQ5nTsHvRn5UfE
         tFYLMYxx2AaC/cE4hBaxplZK0FLEVCKeLdm3UtQHmTgvnBbI52/HecEgRoHamXpJnxzS
         SFQ0KMvC2VDI08mdkDyFFLJzKaJsZzqrvqsXtvG91aTFT2+6PUrSGa8jPTIHE3bVCJzk
         ny5rsB4ynGuEQJtpjuiteUhrS6Lc8utYvgcsR443wBmNPZnxf0FriT+JxUu7R9SANANm
         EcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746629552; x=1747234352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2PbJx/2qf9yvQbSCx579VYOQTdqNTod1v7Nq4aCt4bM=;
        b=Zy60oPBwSP5fL85nGa7KXvSF+inOdysHtC+dxCHDk7ahq2LVXfpVx7FCHAX5cwmBzc
         InYAKchcA85kIDGWjxnfK5xTQ2rcCyJjz1qFpPZ74HYU2s9RrLKlMG+2fu7sJAayAxvW
         KqLNCb1m86ACyBAbS578UycE7sy4gUb18QjpRtzniLHFK58+KF3wmjJcp809XhSrEasF
         S567PlwlZdAVDGOTeOR1ZTujUaPheZJaQpRIPUkElI5L9v+qGeMXgCGeslRblAbm6XjK
         9b8OuWfpaUK0u7bZBP8Emv7A8QZNX5522UMq+lG81tTO8029h5Ot0Y2M9HdFe7G3f8Zv
         NrFg==
X-Forwarded-Encrypted: i=1; AJvYcCUdXP5iDZcc/TszFxU5p43EZ7UTXdmwBRbmJg6w1IVi/Hgp9KvyLqLs8wA2KELt+gmrCEfBkv5rvksYvA8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhoOgu7MZksPuoHNcgxkqy5ulmH6E+C5ZFlVOk4sEdkcwtHbi9
	S7SOEjpyP1Qto6KNO7mfTNwpfRl5+k5vhfRowVb2ZVVNY0yvKNV6+RDYUtRYNJU=
X-Gm-Gg: ASbGnctH9RQCUSQFLZt4/3Nmb56edIiytHw4VmyorxXVrxiIVnvlZVXx6Cf2hfjOh8k
	U7qXIF/K+tH7RnR2z8nqUAne9JAemmIlkVTc9XysKPGCUkaEfTZ/BhjnHTNt05MSGahPAQhHpx6
	sqf4tFMSZsybtCYIz8InQoCKta34g0VedGZ1B8vq4udZtpahNKyLn6Q1v8OpNOZ+jZbA0w+Xnia
	UrjWQsqDVvzYNfjSmRas8FQ41xKcQajrxKQhVPEvbzOy9Y4vNT8P3zxQeBrNKcqofMrXgVFUoVV
	QDUK4BkqHb3VUaLnxFyDmpAg4e3UxAHrkY+JI8cdW2gHZrPHMHl8Va46O5ToJ58=
X-Google-Smtp-Source: AGHT+IHOkasL2GgJwXCVGFoLHBna4znAj20AJ6lokVQBKyBAkWnLTqoNP4LTlIWxhlyr4ITOENOT+w==
X-Received: by 2002:a05:6a00:228f:b0:740:a85b:7554 with SMTP id d2e1a72fcca58-740a85b7598mr368218b3a.2.1746629552137;
        Wed, 07 May 2025 07:52:32 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74059020932sm11698928b3a.92.2025.05.07.07.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 07:52:31 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bill O'Donnell <bodonnel@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <joel.granados@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
Date: Wed,  7 May 2025 07:52:18 -0700
Message-ID: <20250507145230.2272871-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the prctl() interface for pointer masking was added, it did not
check that the pointer masking ISA extension was supported, only the
individual submodes. Userspace could still attempt to disable pointer
masking and query the pointer masking state. commit 81de1afb2dd1
("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
the former, as the senvcfg write could crash on older systems.
PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
kernel-internal state and not senvcfg, but it should still be disallowed
for consistency.

Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/process.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 7c244de77180..f7a1a887ae68 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
 	struct thread_info *ti = task_thread_info(task);
 	long ret = 0;
 
+	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
+		return -EINVAL;
+
 	if (is_compat_thread(ti))
 		return -EINVAL;
 
-- 
2.47.2

base-commit: 5bc1018675ec28a8a60d83b378d8c3991faa5a27
branch: up/get-tagged-addr
