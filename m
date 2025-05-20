Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E5225F98A
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747756323; cv=none; b=rDSrdOKI/LJMYyAqjwVC88vBtEJbsw6sRmH9eBRCF5lVDKu05dNq6Wwz8wH5RIvnbQb+rg7PJSIhz/PWPLzOuixaS3/uAus4jYh0YILa+A+gDJWzz/110s6ZIroNZOYDZOE+7x+ZgQugKeUVOF9hKqO6zSsiTHWbYwzPvQrK8ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747756323; c=relaxed/simple;
	bh=yDzB+rK4kRvODtUh32t75bfBwyaPRGI3UZDm8Q5fjNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nqzO3us3LuYo1ucW8YuZt7NsjiCPzK7uu3klyDlxQXQZ0uQI9MGW7lNPUTBDXS/iQYWuI1l1QgPW4jvwM4l1QoepbgsPMiF43nXf0V1AwquWQu1qysG8K55vfD0DaxCrKiAZPMqJhl3qtNO8HAsVisVfaRvBeZSS0f8kycbxrtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRYljoeM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRYljoeM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442d146a1aaso55090445e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747756319; x=1748361119; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hCWgh0ZdhtzvxMZlS8E6PlbHO1fWal8xoyCgd8Qfje4=;
        b=YRYljoeMlUAhaiSzu4nk/CabgUPXx1C1MBPMLHVnhbG1O94ibf85YdMMValeYb6rpf
         K+UOc+Xap3bY3zKBKJ60BwzACxiJ4NmTWtPGIe/fJTy6IAjfpHLIETiPCTuncHM+bzEm
         +4H8Jo9evHlLLxuIUylUQ73pxoIr51NeJrTKiiBToWLPYqjO4+vROYZdWG5vNlaLb2pX
         Vgmn+tcFFmCIPx8FnjlGjonOBr/RYAKNDJ21Bp7dTU8z9VS5ZEqNzjViDNo0Lq+mXEms
         9IB7PvxOUCFwiCHsxQZK6EE5wO4ux7uYYNSjtNwDPEmsLvYq8GSJCitM2cS/qfiRL+BO
         Bj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747756319; x=1748361119;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCWgh0ZdhtzvxMZlS8E6PlbHO1fWal8xoyCgd8Qfje4=;
        b=oAzKKoWH/suMq+GPW6MfTFBftyitrFt6ZbEAXceTDFTIdSrn+ctscFvCG+LpBg6l3I
         G4UGZmcIP1Q1LDMGrSST1dxb9dc3+EeiSWFuE8yqCvw2a59qNqH7X7FjEjp0R7GcMuTM
         hhWgmBa3MDzCGZMt7qs66jmeiDQXlpfoiubOjRolEar4ao9pGbJTVR1dyyy0t8I90hHy
         S1SEyWBMr8Bf8USbx/xbCgdJvXIbWQ/zH6oWfZ4/4UXIONGHQtOueq2gEaiM4W+Hl3VK
         Tr4bqTo9K2ytPg0ojXG1Iw/sNAoDlpw3M8lqAvlOb4cr+5t8XNal6lXu5fXMrLHZ7pPq
         EsBA==
X-Forwarded-Encrypted: i=1; AJvYcCUNam1/mrj4YaWwr28riAniHDM0U33vwC6E2IsSrkQbJ03Fn2FReVYwxA12912Lck5e8y8qG1uYmjcSxjk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKdoipq/46Dys8/qWWtZbRuFA3wQfHN6XEW+01tXOE3sYdAJd2
	ivPOZXNuFEmRgCehas1ou+tUDRxHXVzpL2/Ja92Oxt2RyvhXZr7cxLIw
X-Gm-Gg: ASbGncv5xWjsB0todu+Igi8e2tuTiQoJ+xfx64EjuEYWjH8HYWZJ9M8J5f3x1oSopuQ
	RbCwLttZ4HBUSYfo+e2eXBtoNdZi6rdF4j9I5MZ5OShWTyfY00mLZKahMh7v5hlm3KzJPFfZsUi
	P82/Hd3Tj/PnoYIj+y0OrCR0A5QIycNM/31Yrj7kisCxyE3+l4lzn+zXy40alKUP2o3OSHh1mRS
	h4yB9vMcUnamasVO4fE+SpiR6oWSANkaYX0RQVe/YQvujsflv2xN+qBDy42hPR5PjWuHUXoGIR0
	E+OUKELQs6GRCQidlwIKDMPBVmJJgi1JVAx4zRub7rmt17AqG2LjeJmnNz/8Wt/T
X-Google-Smtp-Source: AGHT+IF8v7bpu4ytKc96dJqlgxfj5DJg0OrRJlXHFHPGOXdl7FlkmEH5AAt0Db9U2W+MWb/T7/n/cw==
X-Received: by 2002:a5d:638e:0:b0:3a3:64b8:ef20 with SMTP id ffacd0b85a97d-3a364b8ef5fmr9383658f8f.52.1747756318554;
        Tue, 20 May 2025 08:51:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9ad:d3b0:ec4c:9f30:1dfe:440a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca62961sm16581478f8f.49.2025.05.20.08.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:51:57 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH] staging: gpib: Fix secondary address restriction
Date: Tue, 20 May 2025 17:51:00 +0200
Message-ID: <20250520155100.5808-1-dpenkler@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GPIB secondary addresses have valid values between 0 and 31
inclusive. The Make Secondary Address function MSA, used to form
the protocol byte, was using the gpib_address_restrict function
erroneously restricting the address range to 0 through 30.

Remove the call to gpib_address_restrict and simply trim the
address to 5 bits.

Fixes: 2da03e7e31aa ("staging: gpib: Add user api include files")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/uapi/gpib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/drivers/staging/gpib/uapi/gpib.h
index 4ca3cc9e0cd7..deb7ffcb7902 100644
--- a/drivers/staging/gpib/uapi/gpib.h
+++ b/drivers/staging/gpib/uapi/gpib.h
@@ -136,7 +136,7 @@ static inline __u8 MTA(unsigned int addr)
 
 static inline __u8 MSA(unsigned int addr)
 {
-	return gpib_address_restrict(addr) | SAD;
+	return (addr & 0x1f) | SAD;
 }
 
 static inline __u8 PPE_byte(unsigned int dio_line, int sense)
-- 
2.49.0

