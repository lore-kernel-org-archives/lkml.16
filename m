Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56186212B3A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 19:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750274975; cv=none; b=SZPb5Zt77OtchM9NG2Ie6D5MACyLjl49mh6YNdB0QNr7shNgkujQIarwMCyblOmvd4pnhJhoI/zbBnwElSed7mTK87Bzm8NtHmbs138tFBcAKzkMrTJoJhQmLZVXoaeJdqeS+CPGUqrstwOkTC53x3Sq7dK3JLEXW/0L8YQQJH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750274975; c=relaxed/simple;
	bh=EC84Q+n7krh3PBKPeiDn489kr/c1NdIS943x/pEcFs0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e73jPFBm/4CPfX8IMGXF2IWekn1LHubqcz0dqz3mIdajXqr7mynpyRa8KHDyBlAumzkQkW+BC9fIxqF9KBxb+nz4M06NNH4k5YGf3vBlMk+5Q38YX41ZdWsnbc0dBJMvgelV6D59kpMo6tDXRJddowN30E5gW9XYXjQGmQEaIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PF53b8PG; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PF53b8PG"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b31cd61b2a9so42372a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 12:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1750274973; x=1750879773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F8+TZfmF3MLk4xE+85WYNr1ilSLO44mBRcYRUA2SMdE=;
        b=PF53b8PGuTVdV48QkMNQI/AcQXZST1FLGWdJdbTeAqKtU3vWBVFMVi9T2oyhCoMUJ/
         eY9b9jU0AlGlSKIQrBZR4bo0MJb4f4Bdra/Btp1kcYzo8jDw8dAyXMlzMNu+ltnP4L/x
         +9L6vRjU1GprTpe/+ZZjYBFJNdYMYVESr0HzM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750274973; x=1750879773;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8+TZfmF3MLk4xE+85WYNr1ilSLO44mBRcYRUA2SMdE=;
        b=RK0wi1tfW3j3UJn7g9u9kTCq+Awfa8svVIsyMJfcQ0jHMueRZ18hCdhGkfcmu7K34w
         4GMvUvXBN8FA1Jse8VZ8vHjs4zeO6jPNsMldwMmGR98qTe5FTVAbH0+3v9fKKyk8TPZJ
         ZYuAED9CVjI/SkGabAipTJOAmFNoWOXYgz+oEXiKbqluUW0J7tWm1PGHrKlqizJcsBvu
         cIoO+jcdwrS80F4/LUFD9Z5B20gqfVaAapkmedTDbMTyGQsEU38uh20nG9pivIZgTyUL
         IXh0GZj4zeEColZ/CLK4dOTzQupZBFs7YcxCX1Odwog5elxbOAB5xNWpQcDOQIjnDYqI
         eFiw==
X-Forwarded-Encrypted: i=1; AJvYcCUQPr2nUiO5a2HcgIyUXIaf5cTgO3B6PSLINhaizRgMkkV6KxiossDcyRaFD56fqsu3MP65myNm091xXd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyw6RkccSVwcLkyqvPEZMB7GuWpd12FkLw4kHbZyltntjsN0eNw
	ltgJKJwCsWvXQxXHqvE/CqoN6KBNiKkG381hcNtgtR83SwKviH2qg5bGwcnZkKKy+g==
X-Gm-Gg: ASbGncuT8Y8CEBEnpl867ZsiudnED5Z4TqFqrVHxGN+jQgQZp8Ue/kj7JqrUFXV/GSd
	uISgbUrV6QiGQX6FTJUjEAVonFwVHIgApKTnMfjryV7feHZq28+OB2ZXZElxsrEXYP3n95OV6Ma
	KfEgcweqRD2fqkL10HMKW+lQZ/Iq0XDAXwUiVu5Wjc7EgaW77J/ViNnDcOMVBLSQsR5YfJBEu9D
	Kkp4XtZRFlEGtOx+8d6EXqt4du2GHg5IgDkwhumt7C2ELd02xfqn4szqHQ/bdLCJV+i6xQziegL
	WpYDTrQpRxdEXFzAdDqv6q9QCLf8IWvcm7R1EBJcsWwY71EW7f2YoG8IdB1naLcwbn8zPXyZ5g4
	NHE48ZhFKIBOKfCa+0hJnThBHdCc=
X-Google-Smtp-Source: AGHT+IEemXY9lgPJEGcgUMUbG4MenbkaeF3LFGibrarvQsRmFlD2WLnpskK4KRqGLBUdq8hkOorarQ==
X-Received: by 2002:a05:6a21:338c:b0:21e:7d1b:4401 with SMTP id adf61e73a8af0-21fbd55a0e2mr28926494637.22.1750274973514;
        Wed, 18 Jun 2025 12:29:33 -0700 (PDT)
Received: from localhost.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900cec72sm11451139b3a.150.2025.06.18.12.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 12:29:33 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	ian.forbes@broadcom.com,
	martin.krastev@broadcom.com,
	maaz.mombasawala@broadcom.com,
	Marko Kiiskila <marko.kiiskila@broadcom.com>,
	Zack Rusin <zack.rusin@broadcom.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix guests running with TDX/SEV
Date: Wed, 18 Jun 2025 15:29:26 -0400
Message-ID: <20250618192926.1092450-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marko Kiiskila <marko.kiiskila@broadcom.com>

Commit 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as
encrypted by default") changed the default behavior of
memremap(MEMREMAP_WB) and started mapping memory as encrypted.
The driver requires the fifo memory to be decrypted to communicate with
the host but was relaying on the old default behavior of
memremap(MEMREMAP_WB) and thus broke.

Fix it by explicitly specifying the desired behavior and passing
MEMREMAP_DEC to memremap.

Fixes: 81256a50aa0f ("x86/mm: Make memremap(MEMREMAP_WB) map memory as encrypted by default")
Signed-off-by: Marko Kiiskila <marko.kiiskila@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index bc0342c58b4b..8ff958d119be 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -750,7 +750,7 @@ static int vmw_setup_pci_resources(struct vmw_private *dev,
 		dev->fifo_mem = devm_memremap(dev->drm.dev,
 					      fifo_start,
 					      fifo_size,
-					      MEMREMAP_WB);
+					      MEMREMAP_WB | MEMREMAP_DEC);
 
 		if (IS_ERR(dev->fifo_mem)) {
 			drm_err(&dev->drm,
-- 
2.48.1

