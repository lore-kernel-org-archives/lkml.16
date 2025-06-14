Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C11175A5
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 10:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749897443; cv=none; b=kmELhMMwabtP6nJSK2gFvHrxzmkaPgunp21rVsOdxhRlu75rG+EGIMn10+yeiv/t8xu7LStMo/H9rCnqOj+tDcp1D1F5gD4ioBuGKuJ9uFqc61nZ5R9vnM6yMr0UIQEDX7mcPddff/EWeSbZYlYTEjObXsFlSDMJ+k7BykkjG5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749897443; c=relaxed/simple;
	bh=V7uu/VARavhUP6rwGCjJXOTwLAbvEiVz1O2YrqzoPZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ieFLHfJTU8LBKvf3KeB9r5bJ9ZIMPzk7lf6MQivzWQvhVt27g2AxjYfdFhVN86s3jTC/zCWcg2grtpmOeG6JMoAm1QugveU/diHNR7AZckQ5pqs2ezQ9Vmjx+HODIVX9FS7oSDdDrN0G65ZuDgHSSKJVKl79OHM/5zEr2cB5i/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqIic4TS; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqIic4TS"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4ee391e6fso217650f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749897440; x=1750502240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
        b=TqIic4TSmaWaJf0Bst3LB64uYxwOnRG+6CncoPUUIWUweyCRK8ZTVoGcNK7TwcUyCw
         k1uHm4ugFEw6GivU0cWtCanu9hxe6e9zZb6RCwsNcKF0CXYn9wiQCVT3gtYzYeTJ4Hna
         RgUCkAQYUxY7vTVgel9UERsXzI1AsnJH4kAB8Y7HUXDf7ScTNNSaxIbn5OdQdO6LXCzl
         m8qB31nFnpA3WqekFKxvUL7suDjUI/0CnxF7U64ik4FdQlBvNGLBQeHQCKzT7TrMmf+J
         G3pQTk3ZhEbYtSQZOn6GqF9u4Z5WBR5YqSueXmIJzbRxiA3AfI4oPVeulEw8W9mzJPxN
         /RnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749897440; x=1750502240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLl1qEEwnvWsAvy9J8JIB4fScmcygAgIc7ADndq+ADY=;
        b=weySwRhJfvXKIa+ON33Rp2rRsWiocl7gsEURS9ruobMwFJ0kAh7ku6XzL+wqpZmRA9
         SgDklKHw1Y44sf/73EEdJKPijGTVqoQXoEy3+bs3oB8uN3VH8qoCgMKrB3R1MGD0FtL8
         U7dCucg7wPWpzRV3NdW8qU00ujn+xJO3LQcK8qQk4IjO2k2hpeQsIneKKFYUV086NqsX
         mxZCIl09RZHxuZ26gHPyRWhPsxQecPt6HOB6ALxhYs8WGThPnzp74Y9X3v5xuRWPBII8
         GUCFyP5p4A/GwBNXKWItZkLyoxVz5wfplF+sWy/RmG6AL3g00++z7hGhvCJeVewNxgeD
         e/Pg==
X-Forwarded-Encrypted: i=1; AJvYcCXkUv5IqjfOzscKxUIb9e1cZth2tcKASCgqiwNi8+pe1xaAR9mHIYblJGCDHjgO2D/PcyosxgioNNK9DnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1XdJfHTmjhCIuJUsy6Yy2xLROrtZlwr1dMZO4POK+u2eXRLck
	23E3xMr0oaOoLUGkzUsQjl0kx3WoDXs6xKqdZzJ02Ap7EP6LRdJ8ac0Azqq9duVw
X-Gm-Gg: ASbGncvpB/iCVq/OCLPaJHXDWS67Wop8C89zm9Cflm0MLuWVsrPbkSbS+Bu1+N7fh5V
	dJnlkPtA3zvZOEW8HzwvF8uLSk8sjjycnzpNNKB2Gib1WVgwsXWbRir+ykzhQtBT0/2dWQBngW2
	pl/tgPBQIL6WBy43KjEhZlqk1etAfUI5EkzvOrTecMcOrWHHmU/iGngTuAAupHw+g+tQhoGuMA4
	aG3VQQw/4nWXLcicPrvUvg8XtYsHEpT6eG0Djgxln5R2XY/twMgn9xK/vgIN6yKAbfsWVO97AFM
	GbtNFN8VsmRecEsj8k/B/YNgvl12Wk6XmcHEk0Vfr/zei6/qkrEGQLhGZkiiwJ9Hq3ugPT1rCtv
	KO08mYmNnIXE6N7tXgdKaB9s+XLN7qQx1Eg==
X-Google-Smtp-Source: AGHT+IEO2WJsG7rm3hmH9d2SJMbbIL0GVTNr61YBvUZhyy9Qp55TsFSXVuwBOr+Ocv8M12TzoBRQiA==
X-Received: by 2002:a05:6000:2f84:b0:3a5:2ee8:ee1d with SMTP id ffacd0b85a97d-3a572e99672mr881171f8f.16.1749897439458;
        Sat, 14 Jun 2025 03:37:19 -0700 (PDT)
Received: from localhost.localdomain ([154.182.223.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24420csm78091745e9.20.2025.06.14.03.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 03:37:18 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: harry.wentland@amd.com,
	sunpeng.li@amd.com,
	siqueira@igalia.com,
	alexander.deucher@amd.com,
	christian.koenig@amd.com,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.com,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH] drm/amd/display: Add kernel-doc for mpc_funcs.mcm and rmcm
Date: Sat, 14 Jun 2025 13:37:09 +0300
Message-Id: <20250614103709.72045-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes documentation build warnings:
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068 
struct member 'mcm' not described in 'mpc_funcs'
- WARNING: ./drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h:1068
struct member 'rmcm' not described in 'mpc_funcs'

Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
index 6e303b81bfb0..ac2957c9fdd2 100644
--- a/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
+++ b/drivers/gpu/drm/amd/display/dc/inc/hw/mpc.h
@@ -1038,6 +1038,16 @@ struct mpc_funcs {
 	*/
 	void (*program_3dlut_size)(struct mpc *mpc, bool is_17x17x17, int mpcc_id);
 
+     /**
+	* @mcm: Multi-Channel Mode configuration operations
+	*
+	* Contains functions for programming Multi-Channel Mode features:
+	* - 3D LUT sizing
+	* - Bias/scale programming
+	* - Bit depth configuration
+	* - LUT read/write control
+	* - LUT population
+	*/
 	struct {
 		void (*program_3dlut_size)(struct mpc *mpc, uint32_t width, int mpcc_id);
 		void (*program_bias_scale)(struct mpc *mpc, uint16_t bias, uint16_t scale, int mpcc_id);
@@ -1050,6 +1060,11 @@ struct mpc_funcs {
 			bool lut_bank_a, int mpcc_id);
 	} mcm;
 
+     /**
+	* @rmcm: Remove Multi-Channel Mode configuration operations
+	*
+	* Contains functions for removing or resetting Multi-Channel Mode features
+	*/
 	struct {
 		void (*enable_3dlut_fl)(struct mpc *mpc, bool enable, int mpcc_id);
 		void (*update_3dlut_fast_load_select)(struct mpc *mpc, int mpcc_id, int hubp_idx);
-- 
2.25.1

