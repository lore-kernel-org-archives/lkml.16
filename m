Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200D02940F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 14:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744984810; cv=none; b=FAofB3D5hVZFQXJGLpmUrFv4Bt4ixo9Op/tG3edq7f+Kpyl9ZFbKY5kM9xtf7h99x1ABv3ZtZaL2B10dSg5MknzoHuQ0jNIrQQUlZVP6nHdXNgjE9o2jvx5fAgZ7cILBTiZ5twNnFWss9RRT8gQ6bucQuzOd3F9SkPkCVIbCiFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744984810; c=relaxed/simple;
	bh=OOxWQo5jkhsV+E6y69Cns2M7MbGoDA+RKgoQAcd0Mss=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u4vi0vU/S1a+SuqG4mQDFa2Pt6+FZkeHCCDLD79zN+XlNrCOkbElk0rfHicUTm0pPkj1Wm64hfnwK7Yyd3bj9t9xzJxoTz8WfL+17lLGqEStnjo0p/k09MhnG+XgGsXvNbtJzgTMYiSSgpPmVgYXZ6Ac1+EJckqo65x3aFjiAhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZR4ctOD/; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZR4ctOD/"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so22315365e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 07:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744984806; x=1745589606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kjpdmRo5fCT3HpvA0OrKjS2rSNs3R0rN1tJfkxoUUFw=;
        b=ZR4ctOD/tGl0OtZSsxn5bh12rKPbc+skHtsu5wPDQYxKuukcyhc1LSO7CHf3gj1rdH
         1aIfLm0zRJGu4GoE1Ty2+TW5YmV9Myc33/3555wWe1hdqqrRHeW64zNdk7lE4ALZ5Pht
         43FbqacLscfcaXFtjqDBxsv7+faicEJBEcGzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744984806; x=1745589606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjpdmRo5fCT3HpvA0OrKjS2rSNs3R0rN1tJfkxoUUFw=;
        b=somy0MSv/PrIMYGavVTcHo0Gkd1yvJ3Cw5zZWh5HWrww2DKjS3l01KuoI+tCxN3KxF
         Xb6zYnrmOLGaNfs1C2pI6yse9lFKmNVcBv8bGtGu0HCsCFGMoQ/HcvTZZVpZ3w9roIaD
         IACPzsulHjXx85U0LQhnHrS4r4p7rp3nEfD0xSzMIK5ohshyJ3OppizGgh7UVpEy9O6R
         v2shdBOmWAZNgScMxj8ZOTKPsWylDTkcxHrdlSxMyv9T+d69s7SDsoxr9KHGgNYYhN0f
         rFtPy1r+UavBCPnPRTOX+AkoYULzOhe5Ip09pHDe56ezNJqQIDjtH1C7dImD2wfiO2KE
         P7xw==
X-Forwarded-Encrypted: i=1; AJvYcCWJoOJE3uSf8T35GHNWbGbAx6381pKwDPAiHVZvdmh+oGLAIFfZd3Uhrr5sn00N1KvoZ3NIAiSxZHm6jCU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMVS2cvXZolyzbLu8MJpbNS7U/RFW8R70Rwz5zbs2QWlumabmq
	2DJfZIfT8g6zjHVAecLaOS6ZvZA/0CYR6TEBVKIRwrIiifJiwhjW9ZeRk2qkosgjJhIVaDhsfeq
	97A==
X-Gm-Gg: ASbGncsLFzAimsPc+tXZErBpbv/RaIxDtBTeFNt7S1SVST0zHs/dNcK2qAwmle9NSXp
	EI2Glq+nkbfBTBokTw37dYP2GkQ1Bi87ue2O1//JzzipgmZYwF8E5W0VILVSLZcpuVXZgfd5M96
	RWYiYwq8UYT/AzqW2fmU+gJW1FDvHYqECdiTfMKQtYzjqE0jFi37LHwxBplc/JkGUMvlEAYs93z
	H86pizMZZ5xML76O2yAoV9a3zXUtCKIQeO6zX8dnHIyZFVihjxzu1TOHhrw9NMrPM0Mg/EFSJ6m
	yDrIaalchqxdP2SvTOWappGu0t+9G8U2c8QqD6dAO+Wjvm6wE+SX0zsyXUcxvecr7NLn+I80hGS
	sN3eiY8vNcXc4sOzDOjKz
X-Google-Smtp-Source: AGHT+IF0JzUg6qmmcsFcjYsQz71JtbbAZ8V+JlcFdgY2MjqT4d/Zq0PZsMq4TMltz2kKNS3wEos+ng==
X-Received: by 2002:a7b:cbd3:0:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-4406979083fmr26115435e9.10.1744984806395;
        Fri, 18 Apr 2025 07:00:06 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (19.50.76.34.bc.googleusercontent.com. [34.76.50.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4404352a5f0sm80958005e9.1.2025.04.18.07.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 07:00:06 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	Dmytro Maluka <dmaluka@chromium.org>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org (maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)),
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-kernel@vger.kernel.org (open list:X86 MM)
Subject: [PATCH] x86/ioremap: Fix off-by-one in e820 check in memremap_should_map_decrypted()
Date: Fri, 18 Apr 2025 13:59:55 +0000
Message-ID: <20250418135955.58190-1-dmaluka@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The end address in e820__get_entry_type() is exclusive, not inclusive.

Note: untested, bug found by code inspection.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 arch/x86/mm/ioremap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index 331e101bf801..a44800a6196e 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -578,7 +578,7 @@ static bool memremap_should_map_decrypted(resource_size_t phys_addr,
 	}
 
 	/* Check if the address is outside kernel usable area */
-	switch (e820__get_entry_type(phys_addr, phys_addr + size - 1)) {
+	switch (e820__get_entry_type(phys_addr, phys_addr + size)) {
 	case E820_TYPE_RESERVED:
 	case E820_TYPE_ACPI:
 	case E820_TYPE_NVS:
-- 
2.49.0.805.g082f7c87e0-goog

