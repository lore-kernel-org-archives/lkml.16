Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A660F3595A
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738529702; cv=none; b=OzlwxJ05/xjwYzqFcJ02OOOlBl/qFKX4+GCIBiDJiVmZxq9hWSGzkCau/tPna2HoSysRH8pBkwm5J6AHhla1Be9ZnQtFlewF3vcvbUeS8wba4iG88lhDCM789mTfyV8VMZ0HBzLYbKKCG4JjKm6HzoIwu5jEm2n302yt4UnB8dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738529702; c=relaxed/simple;
	bh=Z1xGyM0DJxijK+QA5KAxL8r8czfnK+MaTHcq8p2reF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N6PBAPTDu6hSI2laiEWH2k6wBXVxYgrXbZHoRCT3t9lLlm+4vPuMKehSnPD75vL0iCadyH9oponQrIVzQlyqVteeWLazRzpVAOZ2ZQf4hc0q7KHgP6r/71GijGL3ipNkvASzZbneXXV3GwI1oZWw95rs7Epx9T93szaNzcp3Wyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c102Aflo; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c102Aflo"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7b98a2e3b3eso201134385a.2
        for <linux-kernel@vger.kernel.org>; Sun, 02 Feb 2025 12:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738529699; x=1739134499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rT2razBgYYJeyhqnDlx7RfYfw1o1xvrrpfPKnMB5vQc=;
        b=c102Afloa9+VWSFwNumOFrb+15jWzt4dwOc+yPz0CA0o5m8xXATCgfA7QsLXEBXkFy
         smARnFDNABzh0PjODdOa3FUJ6cggVA6Nb2SUoRjzr1jpOwHsb7XspnskqTIJ9sPnw3Eo
         jaSSRlGGnf9BnfOgqpRoL2xyD6hlxuCBfTBp4XjRbrqQBfjLqf64n8vVoeMbCvdrkRKY
         TAgijlEqxFvbg+SNZMsLJdJiFIy3O3D7abdWMak5HYiHMaU6zyh9qdHfVQlxkajCjHgU
         +wrOVtd1rH+DNavfe1qI/2kGSlZRMvLiV30gGrAFUSYZdhp5sOXp/4e+q46HW8thAxRs
         o4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738529699; x=1739134499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rT2razBgYYJeyhqnDlx7RfYfw1o1xvrrpfPKnMB5vQc=;
        b=rod2FKYir0M2OtRAHjVzOwJkgymznca9K0QUPpgcRJHCU1K+siIYH7aybQYsaG/e9z
         1vOy4kUHtl2ntUzL4kKUshCaKY2Y1jNPsHyQqO8npIS7mQxsSP+keO8yaSP/hSwhNtJr
         G14sH5crkL8ldOs8kPx3Mxmt6Hoae6PA8cHJQpdD0+bzR/sPL3VKQFqkZqo/cnTX/dqR
         pM/HMJ7UtELtV3c12u16NijMmCKPRCwkjjtktAxtY+im21zcmU+YnjDyzlr15XUQrVya
         k4MO2ppwBNVO0z1vZuQCaar6+1nShaZC9AgGmDVRx/+62mrOR2C0G8Sv/RWQjVKwP7Az
         purA==
X-Forwarded-Encrypted: i=1; AJvYcCVxzRfExMkHr1ntBO2ZD31HLOIkeL6QOYRTTzCXKOwrWzRvp5tJWo32GZFnn5axYmh+/ii/d8xmLsUPva0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRV6MgwsN776/JGd0ntHzSZzku43YmYPGz6RK5wtBMHe2mlRKY
	SV+yWWUEyOtD0AAvXNEa5U5XulE6WxfFnvVC+Vyk9IJ4g9Ua8tBG
X-Gm-Gg: ASbGncv8GOh1VsQS9Ipl/yF9gFIFM3Tx3AggwE6giJ+UrY6tqZ7ZLQT99RHmGtf/1Oe
	UJWDJ/+qrcVvzjO7NEw5kZjrwcouc695r/0YKVhImc+Ud00fjdzwkV6OPK8xtwl7RpmB8rOmVGN
	zaAcEbVlVyOQGg6JTgAJM4TM8PxKHl8a0khwoR1emngXDxjqx3eodoWaisRp7IoaQqyp9Rrxs/+
	N+fRIrysfl+dSoGSSV4f0J1+dWX62hyGPFdB12nRMLYnJ/Xm2Z2acN+XMI89pCCAwZyo3NANtzY
	3IsxNfjMcjh6Y+Ww5F9eKmEwkl+HFhgHXgl19g==
X-Google-Smtp-Source: AGHT+IE+yEzbNvz9i5VKkbMR3ffb0vBqjbRSv2MAfyT5MWhcyo5HeDj2LIiHyPMxpTp1mvukg3bI/Q==
X-Received: by 2002:a05:6214:4008:b0:6d4:b1e:5418 with SMTP id 6a1803df08f44-6e243c648a2mr275585646d6.33.1738529699409;
        Sun, 02 Feb 2025 12:54:59 -0800 (PST)
Received: from newman.cs.purdue.edu ([128.10.127.250])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e25495e76bsm42373246d6.125.2025.02.02.12.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 12:54:59 -0800 (PST)
From: Jiasheng Jiang <jiashengjiangcool@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	gmpy.liaowx@gmail.com,
	kees@kernel.org
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jiasheng Jiang <jiashengjiangcool@gmail.com>
Subject: [PATCH] mtd: Add check for kcalloc()
Date: Sun,  2 Feb 2025 20:54:56 +0000
Message-Id: <20250202205456.40790-1-jiashengjiangcool@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a check for kcalloc() and print an error message if it fails.

Fixes: 78c08247b9d3 ("mtd: Support kmsg dumper based on pstore/blk")
Signed-off-by: Jiasheng Jiang <jiashengjiangcool@gmail.com>
---
 drivers/mtd/mtdpstore.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/mtdpstore.c b/drivers/mtd/mtdpstore.c
index 7ac8ac901306..368997155c07 100644
--- a/drivers/mtd/mtdpstore.c
+++ b/drivers/mtd/mtdpstore.c
@@ -423,6 +423,11 @@ static void mtdpstore_notify_add(struct mtd_info *mtd)
 	longcnt = BITS_TO_LONGS(div_u64(mtd->size, mtd->erasesize));
 	cxt->badmap = kcalloc(longcnt, sizeof(long), GFP_KERNEL);
 
+	if (!cxt->rmmap || !cxt->usedmap || !cxt->badmap) {
+		dev_err(&mtd->dev, "failed to allocate memory for map\n");
+		return;
+	}
+
 	/* just support dmesg right now */
 	cxt->dev.flags = PSTORE_FLAGS_DMESG;
 	cxt->dev.zone.read = mtdpstore_read;
-- 
2.25.1

