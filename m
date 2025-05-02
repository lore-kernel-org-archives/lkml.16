Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2278C201270;
	Fri,  2 May 2025 20:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746219342; cv=none; b=c4SR69+mO5m/GpreMT9kZXhEHeDzcgXze6uzWiQkeefYqgRvcVwd5GVYIY8punQL3Y6DEBIOElJdGh8oWKNFIudMo1OdJpraSpZ31B7pWuQEXkCetZs1smdf/NpMtH94Dj+il18ziqxW66VxHJZ7It4W/i7m71YyzfFpI+cngNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746219342; c=relaxed/simple;
	bh=0/Mb1ah1rEUvHAqsuoDKRCUnTh0Gomg1mKYpqfwdvic=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TXOVYGBlnw+WuAd45fBSuwcd734yof3Q6rUrz1qzmA52Zc5auKcOZDbp1KFMGuq6ogeKofgvgL2z3PB+Elc5vcFt8uIr+yN7G4kftbaZc8FOeinMal5ceWvzXcw/SlbL1dGKrFy9SexEOp4I33Qrb3MT5eTIoY1ivsD2fg1zjTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0pTSNPO; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0pTSNPO"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so32232256d6.1;
        Fri, 02 May 2025 13:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746219340; x=1746824140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=H0pTSNPOPqC4bBNSDOTgNLXzqn8xeIO7cLS5H85QSd1HVOF0lLhZyHcl9ohhg4Hdr8
         IjDNQvYQ4cjBiQI/Fc6I8IMEWuO1GT36WDrC+f0OQIAhNGsqOZISaQycmUo3pxVXVxJh
         +B1Ij7mrIl2mob1IYP4hUg9TVl3hx8ZwnBBvciQ+waDA8V0H8liCz/FwgiPU80zahT7O
         Qs/E1/bxqAT6+c9GSgookcv/SC0w5gVgwqep5onIJJBHu5JEIrO4cQdXJU+za3XqNr1e
         fo2QrekCoQmIAd/v5Clf4B4Bdh2/V/nUSwGReVzCvLQ8yArXigyFtEiGL3xa/VLIrYO2
         ouhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746219340; x=1746824140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIL4aNRUdWRX+MJw2hpcNbVT2cq828UqZbzjcrK230s=;
        b=bKFdhQqSJNuhCSeRozfOUM1B+z0wDVfLmYzNaNzFt5X0qIwajmDc8S0TEYAqqPOH//
         OuwsCR3kD6MigHmN8fvMCPvmP0/FfJa6NgTchDTjY0iWvZwsaKfSteXefwCFDdFWwWKC
         FIASBVm8ZCbHvnqsppjMNMtyavOuPx6ZslFLGrRP4OBwvmNF2pPiCsijD2k1HrDDiEfV
         3F7Y2t/NzuE0ajRxthhwmrp3idO/jm4UFFC/tiz0D0tk1+DEG74+H19ES+uCd+n1BSix
         s5t4ZQT2WA4kNLCFfpC5NSWah+gSrfaXMP8glw57QHr/N/2BSBLcVESepTJJFgUWtf1C
         q+yw==
X-Forwarded-Encrypted: i=1; AJvYcCW8A8s1iI7nQUPNieeNKJwJwgSMyA4LeIsPpwhCWYeezoMTgHWHbFt46v09t7xPhd6CelFVlZGKSYaOvweI@vger.kernel.org, AJvYcCWmHrGVXpGWI6sv+1iZGHy2tULyB4H5yXO8cMuYg5gIK0+8xtkTI/4l2gNdQWAr+phzThJhn/nt8LV8@vger.kernel.org
X-Gm-Message-State: AOJu0YwfjNpzt10QLazUZN6axOYLnB6L6nvlvdMNn4rQjgVAzIaNgayf
	Lf4yXKIe5BcXj7Iy7itQPB2UX9EmPhdp8p5UPaGLcyMgbk62B0sy
X-Gm-Gg: ASbGncv0EVy2taJBHqY+sbsLQrnN7SAtGOsqxL3JBfLA8Q9iC6yG2SubUD8nhW46jvP
	FR94z2RVOYE1ggwYBB7NVey6vBHBnu1lFtI3wReNVkIhwOBiIVuwfHVlYuE9hUbWehn5oN8VT4D
	QWWRQRLIXwO7vKxrZqcj2SW0TrQhqRIzUj8cWEyyHagbQa8CymIrNbKVID4FXQjNNyQGp2WMUJQ
	0IVXIUTXJeQLWyokPEcSkbevoDY9PWvYeRs3WxK6XY1IeKyVeUmuvDsBlWKHFpw7Z3E0Xx0nwV8
	h8MHJ62EJv2oXFUsKdOhvp+W5dy2DJvNrHz40il74vlq1o9dOJdu
X-Google-Smtp-Source: AGHT+IGl+igKFN/KPHlDs/YVyr2V0LwR8teyjYnKV+4vK2bIalAc9yn2dBCuurYS+RNMr3gn55JlAw==
X-Received: by 2002:a05:6214:19e3:b0:6ef:a8:4062 with SMTP id 6a1803df08f44-6f514b83fe5mr75552706d6.0.1746219339912;
        Fri, 02 May 2025 13:55:39 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d2844sm23129936d6.56.2025.05.02.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 13:55:39 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.frattaroli@collabora.com,
	detlev.casanova@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add luckfox prefix
Date: Fri,  2 May 2025 16:55:31 -0400
Message-Id: <20250502205533.51744-2-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502205533.51744-1-inindev@gmail.com>
References: <20250502205533.51744-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add vendor prefix for Shenzhen Luckfox Technology Co., Ltd., which
produces development boards like the Luckfox Omni3576.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..9391e0c31bb8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -892,6 +892,8 @@ patternProperties:
     description: Liebherr-Werk Nenzing GmbH
   "^lxa,.*":
     description: Linux Automation GmbH
+  "^luckfox,.*":
+    description: Shenzhen Luckfox Technology Co., Ltd.
   "^m5stack,.*":
     description: M5Stack
   "^macnica,.*":
-- 
2.39.5

