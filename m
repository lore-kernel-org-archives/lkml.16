Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070702144CC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601912; cv=none; b=aKs6EANQdZpS5ixPuA7VgTjYQi2ubMQ0dmPVJbjCA3X7S8Nz3B2YOHtTCVCg69d2T7d1DRq4P6hFpRZyBxTsBQ2ssu5ch8RFbZTEuD0MWA3I0P+wJZYwMTP/R+bkn4hlUA53PIsnmzSefANNhEjmRTBOJFj0/deiXojbgdc1slg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601912; c=relaxed/simple;
	bh=8fnvLCB4q9di2/shpRoPyvOXBtQy10A9RXLh9Ei52Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Gt5WjFF1Fod2maTqFdVLmglQWOmAxftOD9Cly584mJFLetVet5D6PX/+ckKswH7iW/bp+kDkJIeNnCb0TReUWXBZsvHMYEEdLcHWHBeP/agmEkIi+WGQtY+DbumrX+yuHSB1AQHPo1sAHs/RMEr/7ltTfkrSVuvwNTuOCOX+xrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=rOX5LKZy; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="rOX5LKZy"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22e4db05fe8so14171195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746601909; x=1747206709; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lzn4RZmbI4fRSaKNfr+/7WaMGj6wGPqEtsSxdD8HoE=;
        b=rOX5LKZyj3kYef9LfyH2XxV7N+JgL3GLrDFTSNHBqAxVAF45jtRc9r77VB6qK5Z40B
         5Sadc1LXuRjUDDsMm88wSCu/Lod0BF3MTMxTJgJcsdHnTbi1305PqZ33DHK9xP5Z/oRE
         eJC2PjsPHbXWcOfI3Sjq7OS06tNmvAGIMx6Iq1gdR2tYwLn4QpSgh5/kqoa0HTtlj9Nc
         x7oexSsGYHOs+GAjb+eIQ0l+B0ke6j0d4VKJ2wat2uPUNqk8dCMPMcp1vaoC5b7/2JPT
         AXpD2ctSn4K8O+RvuOQNztk5x6ZQkMApJBqEH5IIGEVesphW7neSBsPF4DOhGC50ElXX
         dWjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601909; x=1747206709;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lzn4RZmbI4fRSaKNfr+/7WaMGj6wGPqEtsSxdD8HoE=;
        b=YweXRj7sgDHvvMDzhllELRAJCnKeDy+SeRMpOdnof8lT7zYkvq2r8tI2Je7oUcPA0I
         dmpKEzv1+7IsXM6e7s/E2jB9t6waxs8amlZn+2Txm2ZIHhPtG3DltkqF9+Uu5mmYFSvS
         HhtWmyh55dLkdn2nNuggS32yRVzSdIb4mTwaZkMOJ5fMkDwM6E16lA5zO3ELq6XDku9q
         OfqbblGjqm6GiQkRbtnbE+F0V6vfb3FYQ09v3ujBpAeUW0oMQvNgknyvoUsU3NLBLJ7e
         9ePam58hMv9dHqTD8Ht3dPk+HHSRRS6+/MhNPdNwbNSXYCU5JLESQFAIMb9brL5OwwNt
         8RDg==
X-Forwarded-Encrypted: i=1; AJvYcCW1FqGHGeUogSX22ELY9X+EkQwMUxWq6A88tbTwDgV06oZ/vr4M+RgUfwvjYrOsEtxPIk9Lpl4M2K1VyFk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSY/gn2kSg0kNv/U+XFev9jougEeBUCZ7M0nVHoZ6+n7LkR083
	J6ldE9cAmgddSNZpRCT6iIg6Y46eJuv2Gm/zohJOhR8g2UDiETczk74lnO4xXKkziK0F515CiSc
	n
X-Gm-Gg: ASbGnctkNhDG2Y6oPrBRwrctAhblUvx8IymM2kUlpi/4s4gsMBDVdpBo+VyXyQPGdtn
	vbuL+JWrtkM4H4oS6EAw7eAdnTts4M4AGZCRADeDJRiAh53NhoZZOfPQbs5Yp4Iafq4Hns2GRs+
	Q7I07wJ1awIBHCI25btggJmUQOkGHgGtG1Pbl33QLP9Z050CWhPsKZKnIj025DwUxiu9p6MlJpE
	mBtDbDUg/+4QFL21aeJw+HuAhKJLRSV25M8aIFpQRt1muf8t1zUCrE+8+t2ELtrnWIQK2PwJG7n
	6kavdlhA3cY5auP/1zcj/k5m6Bvn1+kDGXtzohN2wTHEgUOf33UGk2Nl
X-Google-Smtp-Source: AGHT+IEe8gp8laZ9M94uel6cyR5zf5BuwHLhDVIoev8vvFvIWWHAWfIW/cCahX6Po9V4t8k//8gPZg==
X-Received: by 2002:a17:902:dad2:b0:220:d909:1734 with SMTP id d9443c01a7336-22e5ea385d9mr35488805ad.14.1746601908970;
        Wed, 07 May 2025 00:11:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb3esm86085475ad.121.2025.05.07.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:11:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 07 May 2025 00:11:30 -0700
Subject: [PATCH core/entry] LoongArch: Fix include order
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-loongarch_include_order-v1-1-e8aada6a3da8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKEHG2gC/x3M0QqDMAxA0V+RPK9YhQ70V2RITVMNSDLSOTbEf
 1/Z43m494RCxlRgbE4wenNhlYru1gBuUVZynKqh933wwd/driprNNxmFtyPRLNaInPLkoMfcsT
 YBaj10yjz53+eANWoJXnZFx7X9QN59SuldQAAAA==
X-Change-ID: 20250506-loongarch_include_order-bbf509faca15
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8fnvLCB4q9di2/shpRoPyvOXBtQy10A9RXLh9Ei52Do=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4Y0+9Kfk5iXskfPnn2td45QyxcD14kLex8u1Z212//0q
 4eVihZaHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEwkqZKRYe+JeF/2yrOb3zVk
 Lfn381HWrgUPp8xr3XKyYY1NurGL5CuGv5IfrR4+uXhwSr22TJSIptACvsfhW7r+Bygcm57RIrL
 8BCcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Reorder some introduced include headers to keep alphabetical order.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")
---
This is a very minor fix to a patch previously applied to the core/entry
tip.
---
 arch/loongarch/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 98bc60d7c550fcc0225e8452f81a7d6cd7888015..3582f591bab286c30127e715c47d485f74d5e2ca 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -13,8 +13,8 @@
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/errno.h>
 #include <linux/entry-common.h>
+#include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -34,8 +34,8 @@
 #include <linux/prctl.h>
 #include <linux/nmi.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/asm.h>
+#include <asm/asm-prototypes.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/elf.h>

---
base-commit: e43b8bb56e537bfc8d9076793091e7679020fc9c
change-id: 20250506-loongarch_include_order-bbf509faca15
-- 
- Charlie

