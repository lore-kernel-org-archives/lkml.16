Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E638317E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749400595; cv=none; b=XRsjI5WrE4KvdMe3PL4pgmFtbSeihE/vlqMI6sl4Y0IZBS7n9tlj919vN/lN2ueupVvke+iuYVYE/IyjlsyzZ7AlyC0aifOUO5emPiW27YtqLSMGzGykUzbPLzjipyyrsAcXuZ3X0CDCCseajQ83DZhrq4Z1So52P+Ba+TCJ/84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749400595; c=relaxed/simple;
	bh=hj2yvKwaz4HPBqnod+imLpfi6c1ncbnMWlaRYz+/2Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TyXOkU7G0lhAa7lrk002tE135CmTakgLy/BXLPik0+yKGqU5yQWNNyan8CJEiiVsXU+96mOtTe+7KRbgJcGS6M4eF04A61zMJYds9aha6TdVOUYO7D43KCxN1ErcDOvaB3KOvgNwyGKNU37xQcxfABCD62MgQyU58FstlFJHCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Emu5GhKQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Emu5GhKQ"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450ce671a08so22697345e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 08 Jun 2025 09:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749400592; x=1750005392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JcHy/YwMLMy9jhyQE0SeKG1qlVwYgM1apCAB9rcjt2o=;
        b=Emu5GhKQlPc/o2kE7rF6Eh75Y4A3Bg4liIzN17bm9H9hpdlVQ+FG66w2aqGuC/WVtP
         /fwtkkKALtbCNtU50fAQqrEfN3K76/iBeXoQi2kNKZnmWu4+pPwJYP5HuMPiy48JFC98
         8brtV9E5DhufSjpZ7oBlGUy+mWeuffSQFjCOkvTtNYhrOxks5dIWpde+wrlD7MgFCnIl
         QQK5y2LZLfkqtHI0z7icFFGCfNNUlYz12Q5Hc/r9HtT5dJSg3UUCCsTA23wfpMWCBZmW
         wUkg3zXg2ADZ5ezEEP1l+r4ZPmk0jCZKm0m9fP0MU8TLe9sYXCmxeZlfsyF3LriieKQw
         uFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749400592; x=1750005392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JcHy/YwMLMy9jhyQE0SeKG1qlVwYgM1apCAB9rcjt2o=;
        b=bIEMecFDrL7pJ5Kd1tZennNOAzQjzEYqm4g+DzLpMqttYHyLfYJiL7iIN7wbTGSj7x
         jKR4KXspbBwVlTG2+XH9kDHGGKg/BIzSp775I/cKhv4mluXRPfi7vblVE6SfZ//I0qkO
         gQVkvq2ULSeBoet2+Zin2HcnW4H9Hb5OzS6NFtr/kk0ci1R9atVHdLjfy4/lP7A5Xd7A
         eYFpF8oQbzM7MzJ5C3ymJE+cW5UjlNSNupsh/MzRrLvw1RbO0Cm2AlG0ayEoVjvd+Z4u
         UzpbCFI3Fgk0hORmm/plm2mgpuH30Rt3USFWn9fs24AXX5SdLMr8qufaWQQNliYsMS0S
         0l0A==
X-Forwarded-Encrypted: i=1; AJvYcCXtoZpUxBcFB0kZhxesVMgXNZj8wBpOkIi0/CLVkS4SWu2EFFc/x1X5Xw5nWXwgyL6L0WDF7cK2IUSD7kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWrbv2v7OCsC/basOR/ZivrOK4s6v+dJ5O6Ga02yMojHiDY2+M
	/JZeDL3P5r+3U1mTx77r0wvMTcEXL/2D1Cczi9qtBpkjy/MZP4zPxyyG
X-Gm-Gg: ASbGncuBDtM5LfwEWjkpaKlAapDth19DEMA7F5vksuKtATJytAeQ7rifpO3ISyY5XBx
	Bz/cm+w4QGHOBE2xNwWMn8o7KLNoca57Kj6Bm+Dvtx5VhKOqMQeZhUuKsArAQH2cctwBAUZWFP3
	pyCIvaDULIDzmM0vmXMCscxByYTrFVyP2hrEa9qVyCTMfQRupkTjt5axyjrqTrZS4lWwN03IUvh
	9QAZQxjhHRNVJH2w0oV2Vup0t3re+5ln5Uj4jN0Cee1s3cXwBUkfOKNr1qIantyaxB+iXHddjTZ
	HhXnxqjuubnSB7Zuvm20r2aysMLsiyT7S/eixzdIGaGd7R0GNG8JtvVREU9o32b/yNUBRdPgUGq
	FTJfT69PL/A==
X-Google-Smtp-Source: AGHT+IH3RzRgjVWFh+M2G8uO1iYSf7nzpnq4V3NFj1xtsBA66oG7a/q0SoHc/4qhw72uAI6NwRREUQ==
X-Received: by 2002:a05:6000:420c:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3a5318869f5mr8490128f8f.33.1749400592008;
        Sun, 08 Jun 2025 09:36:32 -0700 (PDT)
Received: from Reodus.localdomain ([83.120.60.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532452d7esm7466396f8f.85.2025.06.08.09.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 09:36:31 -0700 (PDT)
From: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
To: hubcap@omnibond.com
Cc: martin@omnibond.com,
	devel@lists.orangefs.org,
	linux-kernel@vger.kernel.org,
	Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Subject: [PATCH] fs/orangefs: use snprintf() instead of sprintf()
Date: Sun,  8 Jun 2025 20:05:59 +0330
Message-ID: <20250608163559.36401-1-a.jahangirzad@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sprintf() is discouraged for use with bounded destination buffers
as it does not prevent buffer overflows when the formatted output
exceeds the destination buffer size. snprintf() is a safer
alternative as it limits the number of bytes written and ensures
NUL-termination.

Replace sprintf() with snprintf() for copying the debug string
into a temporary buffer, using ORANGEFS_MAX_DEBUG_STRING_LEN as
the maximum size to ensure safe formatting and prevent memory
corruption in edge cases.


Signed-off-by: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
---
 fs/orangefs/orangefs-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugfs.c
index f7095c91660c..e1613e0847e8 100644
--- a/fs/orangefs/orangefs-debugfs.c
+++ b/fs/orangefs/orangefs-debugfs.c
@@ -396,7 +396,7 @@ static ssize_t orangefs_debug_read(struct file *file,
 		goto out;
 
 	mutex_lock(&orangefs_debug_lock);
-	sprintf_ret = sprintf(buf, "%s", (char *)file->private_data);
+	sprintf_ret = snprintf(buf, ORANGEFS_MAX_DEBUG_STRING_LEN, "%s", (char *)file->private_data);
 	mutex_unlock(&orangefs_debug_lock);
 
 	read_ret = simple_read_from_buffer(ubuf, count, ppos, buf, sprintf_ret);
-- 
2.43.0

