Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B8D227EBB
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 21:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746480511; cv=none; b=lPJZgN02w03R6DWmHqWSajzXdPPfcPMvbf0ObS4AKZ217Teg5nZNSq2394uUdIb3XzIcPVPGbSYbYJZILPXJSFSvebrQh3ZriFP5zatsqQNRbnLMj37kKMaoiysECpZrvrTWu4I0NdpbXqZ0+CpqM1uVKB0RkmgYFnyIcLvckZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746480511; c=relaxed/simple;
	bh=f1hYP84SUeIeWVw/aO7ZbaGocyQWnnY64RH/tbZs0VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U8vGdrCcrvnvFqWZFdqrP2vtTjHQfr5WYpESPusekxjRedt8b3NA3HXvAtGqTHM2zg+b06Nuxs/CfR+cW98wsMjhEMgVILdVbgS0ERx37rJfKR/h84YMZPqtjTX+660+7tuJlB0YwZip2a0mD6l70RYeMFePz/wSWI8/7pcY578=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=g40iMQg1; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="g40iMQg1"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736aaeed234so4404461b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 14:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746480508; x=1747085308; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=26hdnx+Qx/nkLZaujdf27gbYCjpgudGZl7RnEQteaII=;
        b=g40iMQg1ZFuesIP1/B8Evx+4b3rzsfZ7sYHMNEncogXbdTBP5c29r5EUGIr283Kk0W
         mw37q3tVxu1NV6cRnMR/5rHH6BJNEDyv7xV9Qn7yD3fji0eBow67EIdO5dCSH+OdH5zG
         7ioRlPoVy8iSiOlFbSc1EFT2UE+BttLfoF54CChXr3gq30TtbFHFtTjEve0ke8ZLwHa3
         j+iTafkF7Lrr5UfPXe5q7VHKTjBtaF3lBw7ulFBeMqlK7J3jhrCIUYwTGH36PNh7+F23
         BHlYojmAnl0QxwEUM452mspfpOgywYbfJg3lzl/9MHr9Tm6/pliVDpvMxgqcBY71UAV3
         S+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746480508; x=1747085308;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26hdnx+Qx/nkLZaujdf27gbYCjpgudGZl7RnEQteaII=;
        b=iBkz0RZEY0YbRVW0S+VxriIgKtqK75lqN31UP97lK0S/cYozeQ0kVmLX+HmaOqRRNb
         LSLFql1Pfc9JZGzTNa7GC4vvB21R4KsRmxSUoTAIUMHdAaIVIg3Qah5snqECv8qZNc5g
         brLk1GMv74G1yx+5nbGGkIcJR/K1piZVTY0u/e2exwvWAH6+L0Vt2sqyk51mhOic6PsJ
         W+sbp6orW9TSxQMCZd9J2KuL+MbIGLpxB51LjCR7rjP7RAw/lMhyWeJjJOZcF200r2VR
         qsuXnjWp0VegImJMdY3Hu7+udzhtG2Ko4YUOFwhJonO3juhHEKDR1A2fDeyB6hEOypOu
         QAdQ==
X-Gm-Message-State: AOJu0Yz5MtGaZngm2R+Zg9Q44zqeMQm+RXwG7cIFDrwRhwT49blDleCd
	jiegBp4fCg1TdCad1/D19hzMBdgelV6wKIlbQgbg8vVn9AaRiNNJzErY1fzGxYEn4fRvAplm5Mh
	5
X-Gm-Gg: ASbGncv8Adx522qCUUHki/6BGs2skYKyiGBhCRYr4FGTKitNNBinGtzpZqa9gYrkbsL
	i8cr9k0VW6kk/WUkzPwRKIuKHNum2X4ldZ2RFhdnOocHkaEA78VNsP1ffBDx2Q7N799PDAVtt4j
	ePU52ar2hbLMSB+flDnkVfEQfye5SLMVusTd+4BJFKbqQBqpyDElKP8ibnngL/tNWv23BLc0z7Y
	ILxNlQUKv85KCpDej9zgRN9qEIG/RfXtlS55vhwkT+wpeJRiNMA8+3LVrhSgYzL6ODPTefAySDG
	g3Q24ffdd34FJb30PGCGJCcLx07UiKHEHItP7xx29VgxsagFSCbb/A==
X-Google-Smtp-Source: AGHT+IHEMWsBZWNumu9i00+bT5zqJ+OBY6gmgedReBkU4n6QkDfOYR7NZTzbvbGaF1bdlf+ezbf61Q==
X-Received: by 2002:a05:6a20:ce48:b0:1f5:51d5:9ef3 with SMTP id adf61e73a8af0-20e96ae5978mr12840533637.20.1746480508080;
        Mon, 05 May 2025 14:28:28 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dedcc4sm7370367b3a.79.2025.05.05.14.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:28:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:27:38 -0700
Subject: [PATCH] MAINTAINERS: Update Atish's email address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-update_email_address-v1-1-1c24db506fdb@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAEktGWgC/x2MSwqAMBDFriKztlALfq8iUop96oA/OiqCeHeLZ
 JVF8pAgMISa5KGAi4W3NUqWJtRPbh2h2Ecno02uI+rcvTtgsTierfM+QEQVval1VlclqpJiugc
 MfP/btnvfD8uL+XRmAAAA
X-Change-ID: 20250505-update_email_address-6c2901987e87
To: Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org, KVM General <kvm@vger.kernel.org>, 
 kvm-riscv@lists.infradead.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

My personal upstream email account was previously based on gmail which
has become difficult to manage upstream activities lately.

Update it to the more reliable linux.dev account.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 9afde79e1936..f7a81702309e 100644
--- a/.mailmap
+++ b/.mailmap
@@ -105,7 +105,8 @@ Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
 Asutosh Das <quic_asutoshd@quicinc.com> <asutoshd@codeaurora.org>
-Atish Patra <atishp@atishpatra.org> <atish.patra@wdc.com>
+Atish Patra <atish.patra@linux.dev> <atishp@atishpatra.org>
+Atish Patra <atish.patra@linux.dev> <atish.patra@wdc.com>
 Avaneesh Kumar Dwivedi <quic_akdwived@quicinc.com> <akdwived@codeaurora.org>
 Axel Dyks <xl@xlsigned.net>
 Axel Lin <axel.lin@gmail.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index 5f8688630c01..cb8cd92a1ce8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13071,7 +13071,7 @@ F:	arch/powerpc/kvm/
 
 KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)
 M:	Anup Patel <anup@brainfault.org>
-R:	Atish Patra <atishp@atishpatra.org>
+R:	Atish Patra <atish.patra@linux.dev>
 L:	kvm@vger.kernel.org
 L:	kvm-riscv@lists.infradead.org
 L:	linux-riscv@lists.infradead.org
@@ -20878,7 +20878,7 @@ F:	arch/riscv/boot/dts/sifive/
 F:	arch/riscv/boot/dts/starfive/
 
 RISC-V PMU DRIVERS
-M:	Atish Patra <atishp@atishpatra.org>
+M:	Atish Patra <atish.patra@linux.dev>
 R:	Anup Patel <anup@brainfault.org>
 L:	linux-riscv@lists.infradead.org
 S:	Supported

---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250505-update_email_address-6c2901987e87
--
Regards,
Atish patra

