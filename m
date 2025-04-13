Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E491D6DB4;
	Sun, 13 Apr 2025 13:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744551823; cv=none; b=IvATDD6HbsbCbCvrTWSh4WyUzs780DsNaZSGdny1vXTiT6QuoE/OkTLz1cEk8BTrpszd52sX3DOj13UvOVC1SlDev1R6z6q5R09GXNQlJKkkOSEMl1iq3XS7iIo5jlVd7WkENvGaynO8KFH0YeaTgzIBeOEPlEVTGlV9kHq5GGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744551823; c=relaxed/simple;
	bh=1Ia2AWT5OhwUbhLRQjR66eedV4eNqMJnlfK+ozgUHpc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f/6iQyw0DAXKDAQO9GSHNRHCLI3phc23hNnoTvnvSr7yERqWTSb9Hv6CrI2ON+r7ROttv89xoO8cAErw8JgsRQXDhOMyXeYlD1S17Ch/rPin7Tput4TNDzdLW/edsZ4Nm+Uir8nZXDJbpGsGgLLGYCyYSnD2g5mAqKggOi4fb1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jUGsNyV8; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jUGsNyV8"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac345bd8e13so597984966b.0;
        Sun, 13 Apr 2025 06:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744551820; x=1745156620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=jUGsNyV8RPcPZjiO5W8+TEM19ZzIEmhkl2XoeZax1HCQc0KSHRoSlVrBdkevaz6eHB
         Jz9LuhyP1T6gtRgBevzQFnwR0LQQs8sVYwI9rjn6FDt9B+emeGvXXk1crx5gQvKo0iTi
         L/Fj22wvyEK2O6+GYSnGMhD37+uerYJZjm4lCmsG6bDDeeo00DUYTElef8BDoeHlQHXq
         Odr9zB9hNDv1ey6UlXDuVtFq0HYEReUAsEap//OJLEATwiyTlkgu1HM7XOPED+eVYjQ8
         y5rhRGOksHaW7pSH4gGEc6sdCZE+Cgv8kWchdOHc+ytfhIueIaC9OsR6ykhf8Z6lxNWP
         jH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744551820; x=1745156620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSogYBlrl731ThFJF3RuKmPw2V8Xexi9sOixYh0Nyzs=;
        b=q0EtdN9YFcYpuMiSX9BWV81Y4gA89k5fRsH+oL2XtxhaR0eFQ3Bl8gKvBOR0MsOgKu
         BTaqJRk5rcImmbAkZuJ8HWZpfiic7foPkg1mVtxIWldRMWHuSUrNycS18f8td6uk+eSC
         NMv4kA2R++MNzirTuFROURCGdXng6R4f+HtmnRNqvvLCTZJ2VFEAHTdLudKA1Sz8xy49
         PmWOKxOhFJqTTXHp/kzfnMUj0AAtrKTJyuqF8X0+3Fnuk4y98lubEGL61LT/6rmBRlyC
         RK2NwxLuScKTg5WYQSvgGGKC3kU3cD0RDPIgnKUYgB7Vi2ObpfXYhmqu2gwCgE9X5HSC
         6Ilg==
X-Forwarded-Encrypted: i=1; AJvYcCUXodg4m49qhLiTIwbzTqXNmG8nIeZgvo5WPZtsPE+0I+hIIkyq+KrwGTJpDfQLACYwhVbl4DBEyx+O@vger.kernel.org, AJvYcCWaIb9cMe6NeXr0vW0ECnvGlSg8xMf7ArdkafDRncVW5QzghEb7j3JMnOPWhu+tkLtWV/TXJDYotRFZ8NJb@vger.kernel.org
X-Gm-Message-State: AOJu0YznfkMAiAzOuo+2c+iDocOnH1ycb8ImlPCoWEFuuGHRhxC6V5cL
	O8nNc0j4rbdzMffNUAE3EJNsLc+pAFWn3RIMrttxGYLu3ZHNQwO0
X-Gm-Gg: ASbGnct+1+3dt8iiOxYxIEpC6Kbq+S8zAZ/4PUeZAEi+4LpZ4ikXKO3V+S9ZVtKm3BR
	ICXapxwOiDolpHOwvR8Sf1MoIDLhfqiTrqhY4I8vivJ9Abtrb+kuiZjiuD0Vla9R6Ba9MQHmbqC
	YBndSJ78LfmC9aMdl60EfPLxFS/j3g3YM8tP7yD7KqhNuDbbw4Hi+eNEj8WFoGlw+DHPrDmiXHb
	QfD79n29DqPaKwoNWGAwc3a8af8KuyHhAmZp4/p0OaLBnK+YaniG1stFI+MLWP5Pc0w48kx3oeq
	bS0JLh/5czDSD5orYFDQFG7RBueJGZJpe4XQ57K49CSM3Tc0lME4XhIZxnM=
X-Google-Smtp-Source: AGHT+IG6IIvTcbFlePkAwHT/05Hid/xlS3qf9C/W84/Ywcx7O1L5k60TXgJeL0SSV6porQsrQjvvUw==
X-Received: by 2002:a17:907:9728:b0:aca:cc55:fd35 with SMTP id a640c23a62f3a-acad36d901fmr776146866b.56.1744551819626;
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
Received: from localhost.localdomain ([37.248.246.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm749422666b.55.2025.04.13.06.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 06:43:39 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: wens@csie.org,
	samuel@sholland.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add Orange Pi 3 LTS board
Date: Sun, 13 Apr 2025 15:42:56 +0200
Message-ID: <20250413134318.66681-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413134318.66681-1-jernej.skrabec@gmail.com>
References: <20250413134318.66681-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Orange Pi 3 LTS board is similar to Orange Pi 3, with slightly different
hardware but mostly same functionality. It has less options than
original variant. eMMC was optional before, now it's always included.
2 GB RAM is now standard, previous variant also has 1 GB RAM version.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f536cdd2c1a6..f417745c799e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -981,6 +981,11 @@ properties:
           - const: xunlong,orangepi-3
           - const: allwinner,sun50i-h6
 
+      - description: Xunlong OrangePi 3 LTS
+        items:
+          - const: xunlong,orangepi-3-lts
+          - const: allwinner,sun50i-h6
+
       - description: Xunlong OrangePi Lite
         items:
           - const: xunlong,orangepi-lite
-- 
2.49.0

