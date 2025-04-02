Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91C82356BF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584229; cv=none; b=djySpvQ8wvjyP1/F+9wJrGTvM9ZWtwkmuaI6TmV2m6p7Ykv1ZnlhkbbCsGmJy4kstja7cbfPdl2cjQ1ZFV+Vxf25CnXgVWg+DEhhM+nqsz+BkO4nUvCHko+ud0A9WyDOavPu9pkcA6DgB6FSRiutGrY7qob6YPszQ+/1ZNoq4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584229; c=relaxed/simple;
	bh=gJiKCmOVGHHXuA+rW+U1+1ikV/iMBetNjbldM/AKP2U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ECoeYS6xBprEWH1vrANLr6Fa9MoX1qQySrV7WAcRD+FZnEdT1iYE38ztseh8Z208OADgbx3BmlErXjp51vCu7jxBHQCU68plvAp+XXCGo1adwI6LHGUWHC1WIojUHaBznIoP1M1pXLFLieH7GrwK2C9m9/NzIBCZSSFYNBPdtHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GTdK5wJo; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GTdK5wJo"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227b828de00so112919885ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 01:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743584227; x=1744189027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2L6fD6nlIa393DR0GjOYRfyiTfAg8gVxKRvxkE78qM8=;
        b=GTdK5wJoilLJecuT7t9n5EoAG8ecvNkdFPLxqehYlSLPDLLcISHEYtlw48WsFVZYuS
         joy7AT6m1R43Cwekwwt0iIgBzzih+Q9Oj+BjW6nr79GpwjPWU+6UqtjnTgZ+omfyEpXo
         71VsDxu3CjNcyDIabnBvOj+mT6YL8RVpWXa2nGwAhKg5iIC9cCAST+TJFwhhWL1zlz8F
         +UkA62Fjz0L3pWUOhEh8KmvAjzAwoEMVX3p5forK1vn1ClDiNYPycenUXTwtJQyZXVc/
         GyBfnhfaPmVWXLCTmiP5XwfgO3mQ6N4VJf45fr6c8KwesfG4YdKeP82VydWKng9y35dB
         wntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584227; x=1744189027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2L6fD6nlIa393DR0GjOYRfyiTfAg8gVxKRvxkE78qM8=;
        b=pUZkGvh6GoyCTpgB87c+Vf1KeAgsmEMv7aoPOZ/MNloC4FUoYZoHp1HUvuM06ABLtQ
         GSDE5oHRURakbpCfvV0sIGxvKC4FsSx2+/gVVBTl8T5DZs7mE6XD7p0INT5EFrLd73Ch
         FLF2JkTejcnYkicRHK3FnV9/xiqLyZksdLTJ6d/cUdhzuapdBe4zX+CxYx9dBdVyZBjb
         YARhNELaUZ5P7CD4TMhRomxfnRsg9hTw5+c+12DpnOqAL0MiAaWWaPS2Ppcx2BfZkJwW
         10FJ28UE19y8mJYVHT+n0m6ixrxl4TXbpzoT0clQEjcs5ZX1XZUK9ySttZ61eQBbjvDa
         RlUw==
X-Forwarded-Encrypted: i=1; AJvYcCWhjTCJeWhuGz5OMvqJeFM0BpBDYOEd+9amLMd0+RofEYRaCERBrOfOvt59jSQqVBUY4Hfm6xVrZoX7eGs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwucEr2NHbQGzQFHbEP3hARkwaw4Zz2tomrj1xyuZ2vIY4uDyD8
	vQVt1c5KjDEIvbOVZwHjRwj/vpGV2m0B17u5NcrjW4iN5n6n6q7L
X-Gm-Gg: ASbGncuqv1nZh6pnGxJtBwBwmnQ9jdx0x/qEFtuH6R1QP/K2hLDprger5xrWrEvXB6y
	Dpert65OxI8KKkzWYqUTCGIX8DyGQ+GhiiBiilic7caYL87tlrZds8KK3dhFbRiZGpxG91McFX8
	n7GDIf6g+BCT4RYMj188JCEB6MW9BjY+1Tre4DbgYCeXda6OBrxbQx28BpuqI8J4ndPfgPExBvB
	C/fjE5BAR+weAgaPMAemkYFYcMsE7gmHjbB6BeDt45ElKiYHziGaUtuMKvUHn5g7DxpRYrtT+v9
	QLH1iJVqnBTub0Q+H/VkbrazcUIBV8Jz0HVMhlefLsobXy+gnqDyI97mnC15YIw4UufatA/XbJq
	xB1g=
X-Google-Smtp-Source: AGHT+IGZgi69Abih38Lloz1v9kLCgGQu6o9alyyOKDi5TM595XFdyW5Z+Sc4LA3KYAlvCBtd3nkQfQ==
X-Received: by 2002:a17:902:e549:b0:223:325c:89f6 with SMTP id d9443c01a7336-2296c605374mr25463065ad.10.1743584226867;
        Wed, 02 Apr 2025 01:57:06 -0700 (PDT)
Received: from twhmp6px (mxsmtp211.mxic.com.tw. [211.75.127.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1dedb5sm103221535ad.176.2025.04.02.01.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 01:57:05 -0700 (PDT)
Received: from hqs-appsw-a2o.mp600.macronix.com (linux-patcher [172.17.236.67])
	by twhmp6px (Postfix) with ESMTPS id 0368E80642;
	Wed,  2 Apr 2025 17:06:10 +0800 (CST)
From: Cheng Ming Lin <linchengming884@gmail.com>
To: tudor.ambarus@linaro.org,
	pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alvinzhou@mxic.com.tw,
	leoyu@mxic.com.tw,
	Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: [PATCH 3/3] mtd: spi-nor: macronix: Move macronix_nor_default_init logic to macronix_nor_late_init
Date: Wed,  2 Apr 2025 16:51:29 +0800
Message-Id: <20250402085129.1027670-4-linchengming884@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250402085129.1027670-1-linchengming884@gmail.com>
References: <20250402085129.1027670-1-linchengming884@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cheng Ming Lin <chengminglin@mxic.com.tw>

Remove macronix_nor_default_init and move its functionality to
macronix_nor_late_init to ensure proper quad_enable initialization.

For MX25L3255E, SFDP follows JESD216, which does not include the Quad
Enable bit Requirements field in its version. When the size field is
removed, manufacturer->fixups->default_init hook is not executed, causing
params->quad_enable not being overwritten with the intended function.
Consequently, it remains as the default spi_nor_sr2_bit1_quad_enable.

By moving quad_enable setup from default_init to late_init, quad_enable
is correctly assigned after spi_nor_init_params, regardless of the size
field removal.

Additionally, according to spi-nor/core.h, quad_enable is more
appropriately placed in late_init, as older SFDP versions did not define
the Quad Enable bit Requirements. This change removes default_init and
moves quad_enable handling to late_init accordingly.

Signed-off-by: Cheng Ming Lin <chengminglin@mxic.com.tw>
---
 drivers/mtd/spi-nor/macronix.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
index 07e0bd0b70a0..216c02b92bfe 100644
--- a/drivers/mtd/spi-nor/macronix.c
+++ b/drivers/mtd/spi-nor/macronix.c
@@ -282,22 +282,17 @@ static int macronix_nor_set_octal_dtr(struct spi_nor *nor, bool enable)
 	return enable ? macronix_nor_octal_dtr_en(nor) : macronix_nor_octal_dtr_dis(nor);
 }
 
-static void macronix_nor_default_init(struct spi_nor *nor)
-{
-	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
-}
-
 static int macronix_nor_late_init(struct spi_nor *nor)
 {
 	if (!nor->params->set_4byte_addr_mode)
 		nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode_en4b_ex4b;
+	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
 	nor->params->set_octal_dtr = macronix_nor_set_octal_dtr;
 
 	return 0;
 }
 
 static const struct spi_nor_fixups macronix_nor_fixups = {
-	.default_init = macronix_nor_default_init,
 	.late_init = macronix_nor_late_init,
 };
 
-- 
2.25.1

