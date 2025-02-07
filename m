Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ABD18DB2A
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945253; cv=none; b=LWZ6j2cTRw7PEKkHfbn6kDpNEOlVp6v+JNSn5FHv5/ZKSIxKUJwT/1EnGeAvKNx/t1A8wlsGusGTkFglc8EYgnSgaWc+HiQ/2pJIaZM3sJPIlu1XYf+y/nHlc1YwMXzaXa+l0dkrz55ic4jfKOA9ozxmAKEKFKKKo3JrRTKWnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945253; c=relaxed/simple;
	bh=VWulZbyMlvVfWcva0zZ+7aqmPxY7IsOKefhX2tzM4Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P5lxExXFdVsMoQYHBU1ClhdLvCoUm+pWzAEQA21K1v0v1rcnROUdWyM27iEqVW0ZIBv8Ckpf+51JKaxERIAgJJjgcQr2UHQEJCkDd+Q2Q1Vk+afmDVMwQUyHSkS44RpNL3Tx6MmC7hMo15aGdk2wFrGK1WSO+lLcqfivLHLHGPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=EdX+e7ob; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="EdX+e7ob"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15884065e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:20:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945250; x=1739550050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXWq8j6voTaeGRr8J3gg8YAr/RtfWvANeWegFFYO8S4=;
        b=EdX+e7obc8XknsVYN0HTifu9gY5XLTK5MKKLRpAnzWCtePNaYz1Tv2ROsSo5/BwA9X
         DAE0WBjqpdszp8GAavlTIY4a89Ii5sMbXFsxn3NQjJdkEaA8Hvd/kUmXBBvOqU7pkPlO
         ypyvftQMQ2u0efMlFHgaVCdtRZ76JICtO6EI33VxBWJYBaOlNEb1Z3iiYRUHM6TtYdGS
         IwICyXjVctEegGo62UhFVzqhLG2aXTqaIZKVbGzGvsRUshV+7/Bb6QjIgZ6xOZ1s4WiX
         xdIFRULAv1fFIKWdaXvMWZZObVIrorToQJsiKzIIiGJfTASt9t7aQ8E+9L4nIdJ6rKS7
         Y51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945250; x=1739550050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EXWq8j6voTaeGRr8J3gg8YAr/RtfWvANeWegFFYO8S4=;
        b=Ouwv/ry9+kLaXEBHuG2Ol+Cr1qE4zqPO+Hj4rbE3ZipDYmz74QReez7Qo1vpjKFFuL
         hUfwqAlp5hAWzCOV/oBQcVsoTHfWJJznxex2ARlzogA30Z4EtWca+TJiBGuHt/a3coTT
         2CCm1tWId9q8aMIjmRmjQTIMChW32BswtGSArhaPcs87KtXqKB1VpQuxaQ+4cPnLWcRA
         PicjAtXsccZWYRQqsz5SALWlN1nO8FA+NSGnbxfsUC4hF9L+TvBuOvZQyM//28SL50iR
         myPPbTsoq6tRO7Hbq3PmZsuM5V5MGmooJ0WcW1+iOWmVg/0K/pMexanfsQHf5CJhOeF6
         uk3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXi9G51PWH5x5f5D+1unyyef3dUtiupm1DRrj204o2B9Cz+UNGj2y7wDwKUK0MtI0DJ1WNEhu0eronbiuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC/0RoJv6oY5RB8Ba/aJTNu6AFFBGWSAyqKkCi+Y/eXSMc1j51
	5+GBOcQmBjvkW4i36adSYr6lG2gOv+PG3Ro3btQJ+rMD8JGWwzkaoqRYoQ6HOpo=
X-Gm-Gg: ASbGnctxxeGqTVPkTv8VU577N+7lWR6DfScKU1tQRFVn8jl7tombivipIVQBxY5PxhB
	hK/aREi6nc+j+FZ3ub7F3njXemQXOu9zHmzq61yLpyQQwcXsQ5oYZ9KV/ojEb4dkVadtnNqkLxS
	cevTLcaJyGbdjSPnJVNkb//EhPgqLSOqUWVNRqycbS4dO6VAZJ0pzNztJfDUT6J78oZyOvNjavd
	Jp5h4C/RibqkvLl9bPNMYwIEyxT2DrnCMMcqTgpxq2FAZB4Gj+vnbvsrbKwE8ozLPvnAuepi8ro
	mU2a+fyJV2dSztpXXWuqTTD5+xJumZwUbWz1WR24zQGyFRR9RkO1k9yg5w==
X-Google-Smtp-Source: AGHT+IHh6JwLYQePZBMujNRYI8A6XwD5WkfD3Ot/VtJsrqiS9T18sjhPkT+oNZek1pT+BypYrsY7PQ==
X-Received: by 2002:a05:6000:18a3:b0:38a:a037:a517 with SMTP id ffacd0b85a97d-38dc8dd27f1mr2638562f8f.19.1738945249611;
        Fri, 07 Feb 2025 08:20:49 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4391dfd8448sm60238835e9.38.2025.02.07.08.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:49 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 9/9] riscv: Add Ventana unaligned access table entries
Date: Fri,  7 Feb 2025 17:19:49 +0100
Message-ID: <20250207161939.46139-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ventana harts always have fast unaligned access speeds, so skip the
unnecessary probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/vendorid_list.h     | 1 +
 arch/riscv/kernel/unaligned_access_speed.c | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index a5150cdf34d8..8dd55a847893 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -9,5 +9,6 @@
 #define MICROCHIP_VENDOR_ID	0x029
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
+#define VENTANA_VENDOR_ID	0x61f
 
 #endif
diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index bd6db4c42daf..ff9905274c60 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -14,6 +14,7 @@
 #include <asm/hwprobe.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
+#include <asm/vendorid_list.h>
 
 #include "copy-unaligned.h"
 
@@ -251,6 +252,7 @@ struct unaligned_access_table_entry {
 };
 
 static struct unaligned_access_table_entry unaligned_access_table_entries[] = {
+	{ LEVEL_VENDOR, VENTANA_VENDOR_ID, 0, 0, RISCV_HWPROBE_MISALIGNED_SCALAR_FAST },
 };
 
 /*
@@ -460,6 +462,7 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 #endif
 
 static struct unaligned_access_table_entry vec_unaligned_access_table_entries[] = {
+	{ LEVEL_VENDOR, VENTANA_VENDOR_ID, 0, 0, RISCV_HWPROBE_MISALIGNED_VECTOR_FAST },
 };
 
 static bool check_vector_unaligned_access_table(void)
-- 
2.48.1

