Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0206C3BB48;
	Sun, 27 Apr 2025 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745752030; cv=none; b=d46i/k6MqRi8L36vgPlucUYlUcZ2HajfpVrD7YVYW0MGhXPjMeXvGd9m5q/weI04ggJZd++u2hGLcK7ahyW3pN+uSRAzES8I8YYhYjlWgk+waYOcVOu2Pt2XfSmpxnpGxj1DLQTlA8ONpyyQ7mgVmm3iFBXdVde/fxEp7/1cVhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745752030; c=relaxed/simple;
	bh=OHPq3cQvYAfeMfKNid5wSfhkKzwBaStHV8HzBeC3uzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=scmYD0SzY5M9xqZpPVHy81UIhXjxfcZsvfgrpevQQH60YBWEjv+ZUiNDUhtrIHWJn8CRovsyjdr5i9LSF8V/L/OKB6P0xffbWMVaDS4KLAs0BqEF5GYlkCNynDRARpfTxynYXUBCMd6hKAyECkt6Z1EtxjwwW51FYFafQxXJtl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e5RTEPl9; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e5RTEPl9"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf848528aso26966735e9.2;
        Sun, 27 Apr 2025 04:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745752027; x=1746356827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=e5RTEPl9bV5SMOpgK+SEVJOn7UvePynMcVesIucue+sWLMtzh148vAyWfeT/bqFKHW
         GGdxOg6Am8SSWqB8zsuSmbDJRUNRBIBnqcnG7YJwXqbKuV+b9cvB2mGSRO9vr2MN6Npr
         thRWjGZxBy+eTQqIlly7JadT2UDDHHe2cektpn8LwMqHojvvo8zs/9NhdZGjvMjXlIQk
         eI+Z6dlJhvWluWt/eqvotuopvPCA3DxdiABfaHJACTpVT/wGWts5eUeoQfJSq54rHRs8
         rjvzH2LFtCUve6dYL8tQ9AjIT6L5hPYrvmeNN0RslkglIwvE14r3Efmh81hR+IKnIwDe
         Z7Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745752027; x=1746356827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3KBITx9RJaJB+v1y23nabF6VYlDwF1hnHk+X2NkE0k=;
        b=O0X4ZE+zfGkkrQHr5TneqkMI5mGBIbJDs7GTdExj9UtwYWo+V5p6yx5JQZgdZSBCTN
         2TzIKnk61qaPZB+b+TKC5s6Ll0ff/bPvRs1f9TbPgnCxXKi3XjYg/6UIoAR8piVfxEQ8
         NL+jG3+aguzd82bGVbbCDJgxIAvSYCzgF+iSN1hV8AOnALqpUPHgN3yPd7XQ4kNhkbH0
         FfPOjLHBRpUlBQMY7Oop9XWJcu9ffY4cslS5894DuQwu96HmM7UIHQE5Z45zFYpddyD7
         kVr9Ws7MO3MN/C84HIDM5Hm6CoKHqpeBcV3EnYYs89DT2coiXF3pIx3f7fUfSzzKWkNs
         nQWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtDRkM5YJIm9sEjCGuRM+gkh6nyArn9mZ9y6DujOs5Gzw9ALwnB7gYMgQg3P7FGvwUu3Hsb2Gt9H8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+J9q5O5O9fAg2hlqeqPbiJgQb5Ge7BRUHPN2zgN60jiOPolv
	lWtVVUCltNieA938EoNa1zR8w7BygpNc58w1xTlhRPo8HHcrWqRQCl4zcA==
X-Gm-Gg: ASbGnctWW69jaZ0E64rFiqhN26b5yToh4vTdJABHlveRrbQ0+cs1y5PErw9GVzGxvFr
	5bwrfojbe/eRd5IWKxQHUpDkXnlPlSH1Yu8Tfkle+XjQGB4DsH3sCaGBv8uRiHnbvwJziXSdPMN
	AGJcuajbZKVCR9NQ/f7mR4gSSplUr/HU96K2Y/xrmLm4FHwWcZp1Hmr00L0JkgOAFF24dUmsWwB
	Vtf1YcgUjZypVUqMkbEj6LaqB+coCshCPRIh1Uc5UhMIg6uuzzaxLEGHwTFIPtb6ug9uCZCXO1S
	ch6LKMqmlYJYZDM72vHF3+hLGKLHR0cR5mvxCUy1kuvxoWCk0nwjr4EvGLQZxBmq
X-Google-Smtp-Source: AGHT+IEgf6EklPUG5FhATQl+2eIslLAFPtpAZ2m7OQz/NFioNt+4ZoGb05po/15fgLdfVbsQ4S4v7g==
X-Received: by 2002:a05:600c:a345:b0:43d:7bfa:2739 with SMTP id 5b1f17b1804b1-440a6699937mr64666565e9.23.1745752026911;
        Sun, 27 Apr 2025 04:07:06 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4409d2e00d8sm119948315e9.35.2025.04.27.04.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 04:07:06 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>
Subject: [PATCH] crypto: sun8i-ss: do not use sg_dma_len before calling DMA functions
Date: Sun, 27 Apr 2025 13:05:03 +0200
Message-ID: <20250427110503.14775-1-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing sun8i-ss with multi_v7_defconfig, all CBC algorithm fail crypto
selftests.
This is strange since on sunxi_defconfig, everything was ok.
The problem was in the IV setup loop which never run because sg_dma_len
was 0.

Fixes: 359e893e8af4 ("crypto: sun8i-ss - rework handling of IV")
Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---

If someone know why sunxi_defconfig have sg_dma_len() which always works
even with any DMA call not done.

 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
index 4caf17310e90..ddec1b08d4f6 100644
--- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
@@ -141,7 +141,7 @@ static int sun8i_ss_setup_ivs(struct skcipher_request *areq)
 
 	/* we need to copy all IVs from source in case DMA is bi-directionnal */
 	while (sg && len) {
-		if (sg_dma_len(sg) == 0) {
+		if (sg->length == 0) {
 			sg = sg_next(sg);
 			continue;
 		}
-- 
2.49.0

