Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA3E19DF60
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 21:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738272415; cv=none; b=mT8TL4HKndRHld2iOZHwevOPHut9xhg8xRuw/FuU6Z8rBDRnYPaBRxQ/gDqucQI6VDQLtN9KaOkBEzKsLrzZ0VM5OBlbIBIf0zmqgbQqNBRFX5FJEJuiWGDKK0PU0xKYf5gFg9F/IJM6xxE6rctoICaPDSCN6+Az4GxQw7b3z/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738272415; c=relaxed/simple;
	bh=4mHhup+GcNBesBZ+BygeupHzhouLm7vCAlIIxXm4aTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JBlZEVgjjfyT0c9dBI6xnzt8NBd1v1YykdOJRPEojxUVcuAB/h7QMdF600DGKjEXzg1690ojzkNrKOqi0JJLTBx2W13XqtufdDNndx+LxOWRhrOpbKsOJIVdeyWcuKaPSZ1wsibrwuUO+O3bFyeVYZvenyyCc1F0dUKrB5lsfJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9wdRaq9; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9wdRaq9"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-844e10ef3cfso88804139f.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 13:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738272413; x=1738877213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tqkamo/W6pMKSnOTnzoBwQwZ/NjYd08MuGkepnhxhX0=;
        b=k9wdRaq9wDLKxV8mhOawi+SWdwEbT4HUz+4HMrGVzDXFneN38R3i7qHsHvbeeGlmr/
         NG9awBj7E/R/zkxsDAkJkYbOe9ICAnQ1Y3QYO/SWO9fKgMDZrRMFNIMDs0NwbeDZeriO
         x+GuKdv+5mKdtoUlMOC+Q6J1JNo/zxuck3wg8IshXrzoc7VsrraN54nhU0Ap8fXOY6q5
         DqanW57mxXEnSZNQRGAhd1mEgM6mFNfgoGrigTS83LYYi42zwe5R8Oo3QVS6mFsI1Jt8
         2IiBp4nnFZvxWlc50RTsFVl9zYu3rReBEhbWOzHTAML+8eroAuKJ/R9aEjlrLAaeHo+y
         Eumg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738272413; x=1738877213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tqkamo/W6pMKSnOTnzoBwQwZ/NjYd08MuGkepnhxhX0=;
        b=QTRw8wTePmF+fJpNVs5JHYUEEaVwCqgkj8P8iYttMSgFY+ihPTPpiRlsYwa0y70c+3
         KCbVYh1O3SRQxt0tOtH+hxZh94v0dhhz1W2wasLH+sztts+4mE64oAnY9piohvTxVk/H
         zH6Uewdzz88wNdSLHDU1gyw669w0oNCrttjOxQokTy6IF5W1knrA44r6iSdDbgV2qZ6u
         YTcGJm9PgNvfHO3NGGnBBpF+79q1RmSKJdvfelFHVAenv/bNVJ3FCnQ+pHF9qB+uAegQ
         yCHA92PTfSOQETL7o4DlwcBzS/LSuLyerWFhzRygvYUg18TKm5rTPfwn+uHfCQNczrPu
         JleA==
X-Forwarded-Encrypted: i=1; AJvYcCV952HxKFHlZAqZ92LPq3rOG7z7D703PCCqhGUXdre/FpLN2MO4DrtzOqsQgFdF3ll9okGK30HRuiRJsos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsIJhwwPr7mgwwGX9ZQFvhjVmNQOXIjfPdJiuhCkL98osViUsV
	xSGDoq80bAL/GLoiCGBTH9AWQqGpjev/7W2EUWtnG2pGy8RjP37x
X-Gm-Gg: ASbGncunuX2BMFR+popdFJ+o976bLWZlnCh56RrTH/FH/W8XvOHGj7k9455CpNv0tXX
	+rxrj+cgRLdc4qtwZKK/49OJcIFGcrVj4UXOjWwPeD5Mh35FOMTavPiBN0QlIPRHx1WGK2WD8Dv
	w5x9g3gG75KiHJ4TXXKKIEFc4gahMUvx0h7qsOOQrzK/L8danMY65GhO/zQuYsvoqBmy4fVRPeg
	bmogs/RmEHyum0uxm0od2MW+fL6dFzp0AX08d+n7EBZRs5mDSeUomp8Fqd7TFERFKGjz52WJYKz
	kc0l12g9hWwEoYanpscSTuCehw==
X-Google-Smtp-Source: AGHT+IEkLqBHFekG09YoFWTOutpig+q5kged9l+7F7EfV+49vPiL2hEWO25pIxOb0Uvq/rD9kwXQwg==
X-Received: by 2002:a05:6602:418b:b0:843:e8d0:a728 with SMTP id ca18e2360f4ac-8541111199cmr945896239f.4.1738272413235;
        Thu, 30 Jan 2025 13:26:53 -0800 (PST)
Received: from vengeance.tcpc.lan ([97.75.251.196])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ec745b49bcsm518959173.37.2025.01.30.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jan 2025 13:26:52 -0800 (PST)
From: Aaron Kling <luceoscutum@gmail.com>
X-Google-Original-From: Aaron Kling <webgeek1234@gmail.com>
To: 
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Karol Herbst <kherbst@redhat.com>,
	Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Ben Skeggs <bskeggs@redhat.com>,
	dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/pmu: Fix gp10b firmware guard
Date: Thu, 30 Jan 2025 15:25:21 -0600
Message-ID: <20250130212525.2508700-1-webgeek1234@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes: 989863d7cbe5 ("drm/nouveau/pmu: select implementation based on available firmware")
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
index a6f410ba60bc9..d393bc540f862 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp10b.c
@@ -75,7 +75,7 @@ gp10b_pmu_acr = {
 	.bootstrap_multiple_falcons = gp10b_pmu_acr_bootstrap_multiple_falcons,
 };
 
-#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
+#if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC)
 MODULE_FIRMWARE("nvidia/gp10b/pmu/desc.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/image.bin");
 MODULE_FIRMWARE("nvidia/gp10b/pmu/sig.bin");
-- 
2.47.1

