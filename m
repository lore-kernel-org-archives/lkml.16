Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com [209.85.222.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74A18C930
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529577; cv=none; b=kVpyQoomJ7gnAA7Z8c3bh1D+5nAQmMXG0zQHzbi/eQ9MI3quXlOEQ/PwtJH9Kd/+jS9WD+DQKA0xkRifUHWtVcWPJwPL0z/tQMy4q6cguggOs7+gJMB3wN4gGfkm1z0/7ueRju2pJ51Ht63Inl9meUzji36qk9qjud5g4odS8F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529577; c=relaxed/simple;
	bh=pUIA/RXhgilbz1ISOoGK6YAU8jlldGmdEkdoGdAehQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6mtLPhRdVuiWZ9nq7s+2Ar3py7KaiV34iBwFLcQSABiNUAWVfspJwVk+GEGacOTIxG1P2EcUXn4hmYLpKyMg+qyjp6qRgCilCTtQoaAfjX75N7mBT3TRHHGtH/qIqE79jMoWrDw8H3rHeacKk65RyNz3uGRYO+s2CQIEmXqAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L5+TquSM; arc=none smtp.client-ip=209.85.222.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L5+TquSM"
Received: by mail-qk1-f193.google.com with SMTP id af79cd13be357-7c54f67db99so433389485a.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529575; x=1745134375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=L5+TquSME+YxMzVuvyyWhW4X0qmMNU0/1y7dmMu/xE7hGjKlklNbsS0P8xPngpC9nS
         WnHmA2JJnBC46cwzM6DygJmZEdPwBDEq9OjGEA157WK/uUfbUIHfv/OqBL1zi6av4VRE
         WHM0t6eGsAEk/yRf0zTMMjGZelklvH3ESSd0fdU2U2l7FUzad9ZQ673Rw+L8IX8vbkxd
         dSfDpD6Ww2n7anZzt/lz92ZKou0HJMahvVYzEGMo8gg4bd/zNe44cK0djskTgnQqWJ0h
         ELluqyQ6igzEQcwxHRnOYtB6ZihcZYSTCGphS309RM7NhvNavw1lqvtRW0AkQPJbgRn7
         gKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529575; x=1745134375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=ies2bMAnoTzp+vgN+dhUgVvVdwsfu+ebVKBSQNSsg/KEszEtZIRgfXuY4uL38AHfbO
         HDBeP9sAAYXHxeuqLO5/wEM3rdUQErccLTg4hMpy/NVYN+ZgK4Qf//i7TQwE7cUJ1J4P
         2T8nN/oR8pTB4TB1stEHGqOWGSD+8nDp9K5uSXbwcq+vO67I/oceXJ/MjTgpiXKRcvl8
         h29+CuQE6Ky6+Fo8XfcW5osbiLsUts0sfnVQ+2zaXSslXOq8/P1l5RnkaPz05GI3j1N6
         GQHO+qhPM2hsu3KNNHOYJ0vUJsm9PRan9r0VNB+dW0ZUt016NClnGD7gWWU4GYcS7CJu
         2OXA==
X-Forwarded-Encrypted: i=1; AJvYcCVWjAjPiCQV7y53ZL+gdg4FxdUlTS2wK8uP10vOkdLhEPYvClsG37eOELQkiQFyVjvbI5VwwMA9E4BldMA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCs/dylVkpEjcIOxo7g35D2ZMM9ds8uDA9VvgiZZDud+ZpeMVg
	+S/3JaT0O6c57JTgLuSPmlRbX1cry7RU3Nfs8/H4L+EmsSpop93Z
X-Gm-Gg: ASbGnctXAjtzcep1tkWMr8W3f1bcwzQ/Ievh5fQRpc+tB4LGZuWagBJnyhLnsr8p3FU
	E8rayfQ0f5yr7KcHbf0pHDmCzwrwWKEIBEn20ClOpBd0CZS2IRb5wy4tKy61kJmL2r3C3fjMGFn
	exh1tHNsdwGhEVQU/vTw8MALDVU5wcb8hLKjlEyel5b3fD7zXr1YHXMrtyqJlMRVHw/VgOd4zjB
	Y9qplyY0Co92dOF0d9HScJsQ1aJLVnJDYMwI2Hi0pBv5JHeXOWGOSVd75CPzinE3XpG+fYoR68o
	3En507mH14MKrmWkPy1GQhaU6V1AIL3msvMi9x2BSdm0mk/FgdNM7qty0PGyGCuigzMsYsTExek
	gHVO0camDi6DEVH8Y0w==
X-Google-Smtp-Source: AGHT+IHh7do8k/l7nY7jzUed4eBmOzqjrZqSgir0AaDpT5VzCL16gYZxnsXjqi/syQ2mjP7YJ3yIqQ==
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c7a764cb6bmr1771180085a.4.1744529574458;
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 4/4] staging: greybus: split gb_audio_gb_get_topology into helper functions
Date: Sun, 13 Apr 2025 07:32:20 +0000
Message-ID: <20250413073220.15931-5-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses the TODO in gb_audio_gb_get_topology() by
splitting its logic into two smaller internal helper functions:
  - gb_audio_get_topology_size()
  - gb_audio_read_topology()

This improves modularity and readability while preserving the
original behavior and interface.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 36 +++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..92cfd1a6fc10 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,28 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
+	struct gb_audio_get_topology_size_response resp;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+				NULL, 0, &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
+	*size = le16_to_cpu(resp.size);
+	return 0;
+}
+
+static int gb_audio_gb_read_topology(struct gb_connection *connection,
+				     struct gb_audio_topology **topology,
+				     u16 size)
+{
+	struct gb_audio_topology *topo;
+	int ret;
+
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
@@ -41,6 +48,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 
 	return 0;
 }
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
+	return gb_audio_gb_read_topology(connection, topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
-- 
2.43.0

