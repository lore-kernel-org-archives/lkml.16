Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F247E107
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 16:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745081273; cv=none; b=PMH0duyy5LqS5+GLctVaTY3/5rAelu29jbdHXphU4VV8W4L7DbOI1bepoH8hEe/RX6h487T6SIL2nWwbi9KNswDo8jRO9lp+eNnUWDbxS+BEA+cchMm4FJrfQJZUKniJLIxEpzzffK4kQSI86nchU+iRnOH61qbGgfXBEqtcX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745081273; c=relaxed/simple;
	bh=hT/lMRuzLt1zOyLHVW8bU55TzCJt0dTyCRlvoPgoGFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DFOPn1y//oLDv6q9kEVzs0p2aOIszcMGEXhWBQbaVNtVHYUww33UDYzcfXI03OOBiCtIqYXA9ROJAUw5MNXHib8bv7NsjZK30hEt9rch2c1xtVSMZRL+IF3EzW5+1VsJHjC7nj/3AH6pniDZ92lObitxj6bP+lHt9Uj1PDbwWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QqFrfZZW; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QqFrfZZW"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-73712952e1cso2631901b3a.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745081271; x=1745686071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
        b=QqFrfZZWEuAXQnBY9oDHLPT0Cyk2t+uG4luK8jTMNWk9IXfR9YvJ1rhtubXd1FkT3r
         /+8EStoKSARHJPGUjuMytEH9Q5PPNcwMtDtM7IMA8YgNkxmnZGvsiz4xDFAY5HBHX3og
         rMp3/Wh/Kc3MnjlPI1H6pMtCd5YB7kXtHRilVnfWdhaYAom+QyjZJ3JBMbj+SnUF37Rx
         ZzfBSEFr6m6JuqyPtSmsXUStGU5EexreN7YLRPPP+YjVtLF0acFSwAmklSMc9vlsFkUc
         q8vOMW+z0WZ3o5AhQo2273AT5Lo78Glawo3Q7Lsmp806DFT8gn32ENIwKowZUux0iWzr
         M+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745081271; x=1745686071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gc6CmYXidkzPLNB0SO00YEXOEa7ICBVRjIrdnfdrG0E=;
        b=kJNJXw74JtONEorZ9iCFhXzDosp+bzBdbGxwt/jidTyBGgU/xnKbi6MU4XzeRa9Lx/
         1iDcLKCXE/LPOU9A3JWcQ3zy2Qd4zYRvkSHBJZQTY5AF7cfFNZdqZ4E+X8JS1QKdeqKn
         z2nuh5e9v47EM+wlQheHd3PXoVPrBE8pM6IDuPgKzxuz9nHvaQ1+FuNnPy77OEWvklI/
         GZ5eMtL/Gr2kmx3e51odK0ACJrpI4jfwXtThm2sBVA20QD4EwteS+QvqMJOmC1txEUFU
         rAkT0m5wFq/gBrH91XqjQrh2sYEgvJb3bwKmKi6SnOTo2DxbtSTzDBrdbMR4wA+mR8I9
         q3pg==
X-Forwarded-Encrypted: i=1; AJvYcCUJNKpeoyIecAd9MqtMmdRMYCgBmHtbsQGx5SFXxy3be3392A0awh8JxC5sOKTtfU8hmDfTg+gZzbjn+PI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx13WaoRuOSUHZyJpUBHwAKlnojElVl8qFy3lCmsOQUyHUZnSd3
	J5pu5/yWJZ3VY0eRpkxAzF+WOsrJJGyLhssHtsdYHRY2euq4l46w
X-Gm-Gg: ASbGncu2KbzHgOEebe5Qj8IBhGBjFTvlBZKSEeb2B7Pw16Sxm8aCZRh3Iw4CLOhcRKJ
	OG3WDCXQ7f05TMnEfLKUkWRU1/kkAsxArQ/6RQa1zuNcxWptIsYTKTzHXu5kIpA14pFjBDrf7N+
	CwrSYQLOc4scch69/HlYHyhu50PHZ+aeuM6vrIL9KRp05FYOSWvneK8wH5YnPFDbdcUZ5l4Kt4Z
	CH/YGlRj2nNld7S6VcyZxkdOSJdhWHuWOUzBmlj8p/EHYd8eqFx+VIcbUvEkcfp5lgQDjoQo+Qr
	tO8bGdCYmya7efbR39u5S3js3Qs3UQC8Erb7Kka6LoITUA6bjQ==
X-Google-Smtp-Source: AGHT+IE196NOTtBedrqto5+VyN6Q2bVQflAXIVFzTCK7aHTA5hvuR7r83bs7gc5R54Ihg852juLtBQ==
X-Received: by 2002:a05:6a00:4484:b0:736:5725:59b4 with SMTP id d2e1a72fcca58-73dc14439f4mr7604376b3a.3.1745081270817;
        Sat, 19 Apr 2025 09:47:50 -0700 (PDT)
Received: from 10.0.2.15 ([112.19.146.144])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaea91asm3497987b3a.167.2025.04.19.09.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 09:47:50 -0700 (PDT)
From: Jiangyong Wang <wjy.scu@gmail.com>
To: yaron.avizrat@intel.com
Cc: obitton@habana.ai,
	ogabbay@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Jiangyong Wang <wjy.scu@gmail.com>
Subject: [PATCH] accel/habanalabs:fix typos found in command_submission.c
Date: Sun, 20 Apr 2025 00:44:31 +0800
Message-Id: <20250419164431.2393-1-wjy.scu@gmail.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos found in drivers/accel/habanalabs/common/command_submission.c.

Signed-off-by: Jiangyong Wang <wjy.scu@gmail.com>
---
 drivers/accel/habanalabs/common/command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/common/command_submission.c b/drivers/accel/habanalabs/common/command_submission.c
index 59823e3c3..c9c61687d 100644
--- a/drivers/accel/habanalabs/common/command_submission.c
+++ b/drivers/accel/habanalabs/common/command_submission.c
@@ -1786,7 +1786,7 @@ static int hl_cs_ctx_switch(struct hl_fpriv *hpriv, union hl_cs_args *args,
 }
 
 /*
- * hl_cs_signal_sob_wraparound_handler: handle SOB value wrapaound case.
+ * hl_cs_signal_sob_wraparound_handler: handle SOB value wraparound case.
  * if the SOB value reaches the max value move to the other SOB reserved
  * to the queue.
  * @hdev: pointer to device structure
-- 
2.39.3

