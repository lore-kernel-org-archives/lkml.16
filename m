Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63BD223320
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748521354; cv=none; b=ZBbv4UpV/JqEti6qXzyNCOXBWzepd/8Fo5PLn3CwCttd9aEjtR2Q4z7x8ekL09en5tMIifvo3vY4aktvZDYqZVGVqKYIIKPUYAeJgzVc9/FiPCfYRkXNVY/y2CWGPSV/cOuQTw8Pv5NeuW3F/JctWhk2+JZ5NctofVCouKtcA+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748521354; c=relaxed/simple;
	bh=8Q54xoWFm5dD4JeLp5GkvQ1SCkN6YSxoGPXQB+KAnIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a3nabaCidcVxOlxm+m5BGdtedE/HlZqgCO+FuI4hr/SDcOgzqJrAtm24MVXYEHhBsCGy3UfVY5P2/jLxbWLPE9YRj1Ez79BiSar8kG+O0vpFq/0URlWqFMNvyPKQmG5Ms5hfcyZArL4Vtlvt9HVN2SmHiHw3b0BKf8GHplKMpjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1G76UBbK; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1G76UBbK"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fac7147cb8so57766d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1748521351; x=1749126151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=1G76UBbKw7eyH+bEqjcpfKOgmSmq93O+PfvgfBfnBMpLSuoLpbZolW6tyxj4Nx4M25
         NDGe542pOTum9L4gCkSzFGsN3uMSdJxRXED3QFxCmnTq/HuP0XPBq7hQIr3AOZD/tzdl
         Dz14Z20cuyJeM3y7ujYoQJQBPdDTfBm7SnletJIaEpXk0njDA74J+ePA2YMu/qJas7eT
         3t2Js0Jx3E+MYtOt69hJraulrF1RyYgBXtSCDYBRTw9VjRrSXw7sqqT5/LHU9FInofzJ
         eE/iIIlAjmnHwTiT+uajRqT6sxxVG2nimthHaGscmjzXKGxuTD0G5JGw2KSUaOfiVuCv
         AdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748521351; x=1749126151;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfZYXxSa6TDC4D9WbSYlB6mVhhaETHCcZWNW+QLW+Ek=;
        b=vPbRDNe5n3kvs7W1qBqDYxKkJwj8E060Kifw69NHk46bSBJ1qBD6bb6g3UPv9UcjyQ
         ABJC+cJweZzxmAoP4tlGByc2P2dKUa6l8K0KrLAo9opkqyTo+UfdjH7PX2is4pFCHLOm
         wF7fAJ5d76AFdWM3QRIX1505Gq1kynZElnnZ1Z/+S08g3gNuU2R3xtl0pEWRIkDhG2xY
         2YKwNocIwSXuK13hg3gs8715XQbR/mUJ3AuwQWpvvW80TMlUhAd+LGi3z2MakDtjoXNE
         YNirb5Umffy916lVecMBnTaC3wN8h+Yrtmlkopbb/XxBVINhlMNP+de5LRcL4jP8A/8H
         O5eA==
X-Forwarded-Encrypted: i=1; AJvYcCUbYS3ednaLeO1IVj1kFTBjXMp2l//DBJfAc160joaqGhpNWhtwe3OA6q1/mbvdeudQi/SP0PTJYwGWP+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk2O9zC2YfSYK1zWTSOru1xdFGhUSGaCZD/mRFXwkndi2aRr7b
	h46UJasrWHQWxUZaqCTMttN1wrt1PkdT1a+1FRvJRS6ZMVhkJOWCnh/pZtRG8Fhnz6Q=
X-Gm-Gg: ASbGncthRFEl6YNevMcaI8Y39spX6X72GQ5BwOhuqMpDRIiUJ+X1NahmzIqsrP7ZKW5
	UNcmNHalh168wZmf425pIObEMuarpMBwbx1pAKTVJ/E0MXvELzw9L8lmx7jEC8fZN9n7i1aYUJG
	ZpGZjXLRHLYdxUXk4YpZbv3IWPBTT+Aogq8PlqLukOTe0+At/FST7WjdFqtDYz9T0pCbXxCf/oj
	qwIQNxuNNhxBo4MoCO68GQxuq9XZrTpObe3/zSxwTcDMipwu6Ao11kNCo9jDb9gCp99IImlpoxB
	8ISeXZ/NCQ/Ed847alkVsqY3awX15KTGF9uivBAieTQZHqwyUJqm+Nbco7UQ49Ms5n3ljXRsTr4
	Vor0VhpgXcA1P0zr03SCDtn5F
X-Google-Smtp-Source: AGHT+IGKJiOHPciyv3QtiOSyy/RZt9nsdwc7fAQpB3gb8J6aM4q7mvFoREGf65Wv1z/Aaq14437gYA==
X-Received: by 2002:a05:6214:212e:b0:6fa:c44f:2ae6 with SMTP id 6a1803df08f44-6fac44f2d96mr79427466d6.38.1748521351418;
        Thu, 29 May 2025 05:22:31 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d5bd30sm8814346d6.67.2025.05.29.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:22:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andi.shyti@kernel.org,
	dlan@gentoo.org,
	troymitchell988@gmail.com
Cc: elder@riscstar.com,
	spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: k1: check for transfer error
Date: Thu, 29 May 2025 07:22:26 -0500
Message-ID: <20250529122227.1921611-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If spacemit_i2c_xfer_msg() times out waiting for a message transfer to
complete, or if the hardware reports an error, it returns a negative
error code (-ETIMEDOUT, -EAGAIN, -ENXIO. or -EIO).

The sole caller of spacemit_i2c_xfer_msg() is spacemit_i2c_xfer(),
which is the i2c_algorithm->xfer callback function.  It currently
does not save the value returned by spacemit_i2c_xfer_msg().

The result is that transfer errors go unreported, and a caller
has no indication anything is wrong.

When this code was out for review, the return value *was* checked
in early versions.  But for some reason, that assignment got dropped
between versions 5 and 6 of the series, perhaps related to reworking
the code to merge spacemit_i2c_xfer_core() into spacemit_i2c_xfer().

Simply assigning the value returned to "ret" fixes the problem.

Fixes: 5ea558473fa31 ("i2c: spacemit: add support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/i2c/busses/i2c-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-k1.c b/drivers/i2c/busses/i2c-k1.c
index 5965b4cf6220e..b68a21fff0b56 100644
--- a/drivers/i2c/busses/i2c-k1.c
+++ b/drivers/i2c/busses/i2c-k1.c
@@ -477,7 +477,7 @@ static int spacemit_i2c_xfer(struct i2c_adapter *adapt, struct i2c_msg *msgs, in
 
 	ret = spacemit_i2c_wait_bus_idle(i2c);
 	if (!ret)
-		spacemit_i2c_xfer_msg(i2c);
+		ret = spacemit_i2c_xfer_msg(i2c);
 	else if (ret < 0)
 		dev_dbg(i2c->dev, "i2c transfer error: %d\n", ret);
 	else

base-commit: a5806cd506af5a7c19bcd596e4708b5c464bfd21
-- 
2.45.2

