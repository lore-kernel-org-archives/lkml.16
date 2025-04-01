Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368BA1F930
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743514458; cv=none; b=J6UJE9W5sByRj+giA/YvJIXNRDaEOcDhii+WArFjpUmfiot7vBAi/9Wf2AMMZWpZRp89FbKKxWXRwov1k9/d9LUnHRoUhZ5cIJbXSh89QcJKjgdlTcVIoMVcls/SSArZwoDzDQIxuwkH9lJcI+Om77rr8zmArPimtU1srlOXBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743514458; c=relaxed/simple;
	bh=b9tOLPXI+LhqU57upgPdTJNcO2Vx6rZyWG+gAdw7cPE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aEpZf+e6lVZZbXOW62yxSrNKfHaYpScVUa/1VvXBVczVSHRB2ZGXV6TaOCSof57NegWAgW1hAcs2TBDFsuSAPBLaoyV8VvNplrZfwEb61jO5/m4nRKMQWDNn2Cat1Kq6sJS5myjAT6cbClEHEP3khrV1FAqT0ckM/HAouwhCEI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjUV1QJM; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjUV1QJM"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-223fb0f619dso103783835ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743514455; x=1744119255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/MSWH/HiBeaFQMdiFwHNOtYn+KeoAUfiMDG3P5XehY8=;
        b=hjUV1QJMFEyA9DgbutBCe6dbirqLj4sKg0mqTs9nSmdUIzAx5anpLK+M1l9MK5XKv3
         cH87BPksgl5hUPgt0mtwupqJ6fOaLjUYgCW4NPr17lPuL0bj5Cm/XyO8kdcV/RW6dz7G
         qgUDSOThRi5m6AcbjRtxF3YbjVib6XILpv0Fh6zZsUwVDo1ykE4YJw/kVW+7OIir+NYg
         cOsHEAlhpoJhSvmZ3WbmYW8Hljzlj2SmPwPdDNfSliDRyHlUxzkT5w8Yuq1ORbUbFHSH
         UdqAzJtFd8ZhKIGGFyhI7GOHdk82jWPdfhSz1P6sazhbcO9FkpPZLVJcQOpJwkFTpn6/
         rQHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743514455; x=1744119255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MSWH/HiBeaFQMdiFwHNOtYn+KeoAUfiMDG3P5XehY8=;
        b=ObRTDuFlFC2/WdZcmYiwpqZfvI65ZfMHyGLziubU015QDvalLOcQqPQyizzhVg+pYp
         9yG/tzpaSj4+2yb3c7vDpmiyFwkP36sj6NrOHfyp1szhyyyvurDTxrJWkiTsZTB+91Kr
         CGN91ssXy2bgVver0uQAWOOqAx4kX/LU8QW2J63prwCipzgj7mvixjkN1dZ6NxtvqkjF
         uHcJr2N5tigsEf6uQNO7Q0n0M6qyoq67kZG5tL11+iK1zZdU75sV0elxHZX0KIq5+A36
         HDKJ+0AvLA/GUczPYTc+ENgWnA+VYnA5+9ssMyykiZNZCV4znUz/o8AWClzh5pIUAPwQ
         Z1xA==
X-Gm-Message-State: AOJu0YxKp8eeio8U2iLJSilZIQ/njpN4+54OAiI5qt97gI1uizqo6O/8
	B5SjAZWWSiTRJberR1yzHyOus6n5tlspFRmvwF1OqZZlQ48lAs8PQS3IthA5ujrRYw==
X-Gm-Gg: ASbGncuHi8RDNXW9Jg/RyHHsKckxLZGg5EAgVp9WDkSjkyY8/aW3aRic1ijF6X+cjxS
	AYu0AMY2B1F4TmfNInXB24Yi+E0GvT6LPI2THraR1T/3XmmITO0yL+CoHV3XLziYuFhxRVOfkQZ
	a0bqiD0luOhuTTS8oQexSpSP2wkyr7TKVwx33w0e1Zpc5zwGj1Y3S5ZIhoClETAwI2+Kk3063Bi
	63hEUKGKTwjOUQ0PWKPxSulgJpdZwRrq9h5CCNmdLn1Il50YQXD3DA+P+dN42S6a+g61BPan9iK
	Gi9qdaGH4Dly8SbAzDO2wAxa5JNpf/JJ5LBsknQnCxarwdnFoflFNO9uwVZ18dmCGfXyjTw=
X-Google-Smtp-Source: AGHT+IGrCwu+4MxibwDWg9L5VXO1vZhQVPm3peKDSlNK/eSh1y83UVBqCiMJb2t9DhsbuKt9LRCTUw==
X-Received: by 2002:a17:902:ce0b:b0:223:5e6a:57ab with SMTP id d9443c01a7336-2295c0ed0e3mr48246625ad.39.1743514455343;
        Tue, 01 Apr 2025 06:34:15 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedfdf0sm88497385ad.64.2025.04.01.06.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 06:34:14 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v1] misc: tps6594-pfsm: Add NULL check in tps6594_pfsm_probe()
Date: Tue,  1 Apr 2025 21:34:04 +0800
Message-Id: <20250401133404.27793-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
tps6594_pfsm_probe() does not check for this case, which results in a
NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: a0df3ef087f8 ("misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/misc/tps6594-pfsm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/misc/tps6594-pfsm.c b/drivers/misc/tps6594-pfsm.c
index 0a24ce44cc37..0d9dad20b6ae 100644
--- a/drivers/misc/tps6594-pfsm.c
+++ b/drivers/misc/tps6594-pfsm.c
@@ -281,6 +281,8 @@ static int tps6594_pfsm_probe(struct platform_device *pdev)
 	pfsm->miscdev.minor = MISC_DYNAMIC_MINOR;
 	pfsm->miscdev.name = devm_kasprintf(dev, GFP_KERNEL, "pfsm-%ld-0x%02x",
 					    tps->chip_id, tps->reg);
+	if (!pfsm->miscdev.name)
+		return -ENOMEM;
 	pfsm->miscdev.fops = &tps6594_pfsm_fops;
 	pfsm->miscdev.parent = dev->parent;
 	pfsm->chip_id = tps->chip_id;
-- 
2.34.1

