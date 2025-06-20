Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2593D29D0E;
	Fri, 20 Jun 2025 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750379954; cv=none; b=Z75pBs/fCYyOWNHDFyyiBujITb3pjJi48fYCXE/QMZLqvr7SyZwzGvl+ZEZIS4emHGbtWz3Xuw2yyTcf7C4Xrvh16AOjV2t5xKxjoeyCR5c7l53H3LBk/f9XV45L8p5U1y2wvSQNX4wJRPZ4OBV0KEmuSDqNDxt8HysIzLNBHY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750379954; c=relaxed/simple;
	bh=l1/IBbUcNDQFheW+9eiIMgANLamPBAEjZlIoFP/QBjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qgu5Z7bovQ/qzq5/gN6e1f7jfr12LMEW48SDPbrJtgxNc5/xgJ3S8Rpg8klESsUC29CKIzxnrj9iDEBFF0AhmHTyQo0jpQwBphjfvqzP9qDJb4kXtGTdpfEodNm7jSjX/NO0MqeysFBxaeoBmKRDe9FR60DwavtdWWiYnZVNprU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2cYMFHi; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2cYMFHi"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23694cec0feso11695295ad.2;
        Thu, 19 Jun 2025 17:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750379952; x=1750984752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LTUCGUOoWGw9YgkFlv+/jq28S9YuS0p6EeVu3wom0RI=;
        b=A2cYMFHiRYC5s2eXwoLh3sWcOxC+ZpRGC1GAzVAQ85yUbL8QgX++gDU6Id0G6gwoW6
         YvsNrs4QUdJ3C+5GrJKY8MOqNFSIvbbYCy/79Oz2LAXEd5OR9u4aLUU/lfYuGpmruHBz
         O3bftpFMjNkvnFnqvbog4TPMTPVyQdDKacJuU3LYcuAkjkVn9Equd1Vs9/mUpeGvZCRF
         66ogblNxBlQLObXUsyuN82xtcc21xZkFKtpgVbK3UYvOVCnPn2/PyKZWxmi4RvVfS/0u
         kl3iUBxRZ6uaYKqcmCWMQmTV056n7KU81tf4zCJcSNDgR9WRQPLo1QTn4zffzXtGvfgP
         jIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750379952; x=1750984752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LTUCGUOoWGw9YgkFlv+/jq28S9YuS0p6EeVu3wom0RI=;
        b=Y/vlB2DNQfKVCVEnHH2dLKUQoz+fdffcKorQoD1/zZNBdOtuCnWALRqtfvQtbZ5Inh
         PJ1xQLOVmx3btwrkThqHNGDmdmUwcmLOTKPg/K9M4aHjY0wED/YOks3TAZOOmnzcdBYx
         xiAQi36H/1vA8setO0htENQWZSIXx9iXnIyb1AXYeHx54L3zHDO2L15+OGQhqy83HBs+
         7WTJtbI6xfvtDMMuNyT2D0tW6/3zxzZ8Ed+Fu7rZjC8j0bnS4/X+ZEl81Mlm2cQxNp85
         2zW2/accxstD5oVjU1JO1Y/wIunpxGlRfeKCSw7rGvcKpg/b2bQHIhJuUd77AWGIkbfB
         Gsjw==
X-Forwarded-Encrypted: i=1; AJvYcCVOA2+tADQ1QCcsoZW74uY4GbuKer4/P9A3EYqsii60iPPmkA7Q+EkGs8ENnRT9ujPoVWtk+6BEsh9l4rq722/RcRry@vger.kernel.org
X-Gm-Message-State: AOJu0YzipeVH5fiZGY1ZUV1sKoKl1dt+92O+pJoOyRDj5K7/6zjvNXoR
	oyuDMDqblC1d5giDMol18sPebUFOqNNWJe/uvpM31tZotR/qHfgcjAe7
X-Gm-Gg: ASbGncsgoHyqCPhV1mNnZxs/A6Pxty+Cs/kWxlklrMoeznzEtzanvn0qwp/eNpYho5G
	SgZ6aXBibU1ZgC6vfGRTDGoUJ5LGYeEJO0dv1TfPikQ5rz5L3cDCiZU5012JdjKXQ3wXknZh7JD
	xqCNgqSsUcc8yv0CW/uGOUkVQmfzF6qhaPbCmH/yRzH3JCSq5zmScEcI/beJ9DoOHJvzP+IpJnW
	6e2uMe3H2Fz9NQOJ85KllwPF/fd5IF/ZMNKFMhfu8D7bHOP7BV9EP1VA0f8dLnyEtpqwpYnnB69
	vMFQouqYxD4MULRSX4wosn+KwwBfj6zKAp3hfwAHuSC3eLGJrEaG4WU3eoTczGd7bc37c3gxXbp
	ujfg/PY2J
X-Google-Smtp-Source: AGHT+IEsnon49573ykf7HKyk7csiHL4sl7FYS54aTs8DO+25TgfY+CL+ZJa6gTTuL0rTW5Ou+vUM6Q==
X-Received: by 2002:a17:903:320e:b0:234:e8db:431d with SMTP id d9443c01a7336-237d9764d8cmr12455965ad.20.1750379952177;
        Thu, 19 Jun 2025 17:39:12 -0700 (PDT)
Received: from localhost.localdomain ([203.123.65.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860a8a8sm4578445ad.132.2025.06.19.17.39.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 19 Jun 2025 17:39:11 -0700 (PDT)
From: Xiang Shen <turyshen@gmail.com>
To: acelan.kao@canonical.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Xiang Shen <turyshen@gmail.com>
Subject: [PATCH] platform/x86: intel-vbtn: Fix code style issues
Date: Fri, 20 Jun 2025 10:38:49 +1000
Message-ID: <20250620003849.54442-1-turyshen@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch code style errors:

ERROR: do not use assignment in if condition
+	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {

ERROR: do not use assignment in if condition
+	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {

Signed-off-by: Xiang Shen <turyshen@gmail.com>
---
 drivers/platform/x86/intel/vbtn.c | 38 +++++++++++++++++--------------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
index 232cd12e3c9f..bcc97b06844e 100644
--- a/drivers/platform/x86/intel/vbtn.c
+++ b/drivers/platform/x86/intel/vbtn.c
@@ -160,30 +160,34 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
 
 	guard(mutex)(&priv->mutex);
 
-	if ((ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event))) {
+	ke = sparse_keymap_entry_from_scancode(priv->buttons_dev, event);
+	if (ke) {
 		if (!priv->has_buttons) {
 			dev_warn(&device->dev, "Warning: received 0x%02x button event on a device without buttons, please report this.\n",
 				 event);
 			return;
 		}
 		input_dev = priv->buttons_dev;
-	} else if ((ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event))) {
-		if (!priv->has_switches) {
-			/* See dual_accel_detect.h for more info */
-			if (priv->dual_accel)
-				return;
-
-			dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
-			ret = input_register_device(priv->switches_dev);
-			if (ret)
-				return;
-
-			priv->has_switches = true;
-		}
-		input_dev = priv->switches_dev;
 	} else {
-		dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
-		return;
+		ke = sparse_keymap_entry_from_scancode(priv->switches_dev, event);
+		if (ke) {
+			if (!priv->has_switches) {
+				/* See dual_accel_detect.h for more info */
+				if (priv->dual_accel)
+					return;
+
+				dev_info(&device->dev, "Registering Intel Virtual Switches input-dev after receiving a switch event\n");
+				ret = input_register_device(priv->switches_dev);
+				if (ret)
+					return;
+
+				priv->has_switches = true;
+			}
+			input_dev = priv->switches_dev;
+		} else {
+			dev_dbg(&device->dev, "unknown event index 0x%x\n", event);
+			return;
+		}
 	}
 
 	if (priv->wakeup_mode) {
-- 
2.46.0

