Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4466228C5D2;
	Tue, 17 Jun 2025 07:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143787; cv=none; b=Evo7lHuQzrg1mCQCcDmpGexR6KkY16BGNpV2U3JqDfLNX3coH0MM6OR3th3f6m4zUlHMAr84Nw9sykUZyvjlYT2eiAkiVdusdu91hvLwIAJvP9XUCUD8cup+eYZEFy2yteGTBU1bfW6QVvZgbLNpuGFry7tdW4DUmCH8l2Mz/SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143787; c=relaxed/simple;
	bh=dJEq8F2hT61k1w1AqHST/zG24BOat2Aw8uDuHcvUXSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pwl1OAgbLLBCI8qib2GQD2alSIq441yDIWD308b1mt75bec974MWY+bT8AQCQk5KlSv09p4vMx6djX/D9dRbys3oJ0JmU+T8N+Rfz+bjUFs3Vb2M3uiet/UUkdAet9LuJh4K49LRc9V0ygnBDEa3LxwJEF80C8/jjEc9MP57uG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C3JDPN9Y; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C3JDPN9Y"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74865da80c4so3179562b3a.3;
        Tue, 17 Jun 2025 00:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143785; x=1750748585; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=C3JDPN9YpywmeWkXdw2CtJ1wTzZ6+ZdaraVMHWht//9E3J5ZO6Gs3cc+/jwvWsVuqx
         T9kcNNq4ElBfYAkAIMxAoomob5HDfyR9gPyPRzeZLQBC/2LfOv+LCtzVEaTDZslYeV3h
         QIoqRcBiZgG/T2qEsln32bRaSXjMEX+5YZtxrQIBq06VJh0F1g/CAZ6jy6T/2tZsvMDP
         2tc8vG0JQMbk+Y+lLYW+5EfmjrNLio7eZUbq67pB1p1yIBTVh57VqazPFoUDtxgZiX8P
         8OVIrxkYbOuIkj5GuU2VGardNoX+yHOkzeMNbGXtonYA68ccRi4b6PyNoahh3B1+aEl5
         jYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143785; x=1750748585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh0sH4nO9aBejb33du+kXnwSDR3QoyXmXuJp5yem4TI=;
        b=ksYCr43Lj4/8K2bfEhuTIhaXazyU3gFfU6RL6xWERrXA8OWPt4NmnQPgqE7NlgtK5b
         voMX5qUQ2BOrGc8tL3Do26F2u3lTFSDh88cSvzyWtOOHJUzsYxEIVlZ7DHVQP6L92Q12
         SPLAUpuQ8q+T+GW9XgRM7OOHYxv5UqtJUsUvR3nndEvdxbvPJxnylCEZC/EpgUuVC/or
         /pqRuKbWD0Si9MZyGzXFFG4DTYIvjC0mBV5gLW8zCV8bvLHVj4tLsEPd3u0+DRvFqQLS
         8HlkRu94AJPc/yBY+pMrisuAxpruGKYQdzW4/61jMQXImGxdzZlS1niV9ujfqNtuGElI
         tASg==
X-Forwarded-Encrypted: i=1; AJvYcCVXdl6fobXDBoGgQzCLUuRk3yXX9XKE644lPMIvwZkjJBfe2DBcixWZqS61gyYYglHcfSu4xUN88KgigaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiECuEAnkyjJ+E2n0C5A+3vVEhKqZglZ8EVN8az4RhXmLOJMfa
	6mLQXmF+HhizZkI9q2bIz1LCjnj4FdVW9BtKT92+QsvS9iyzwuKUBVl6
X-Gm-Gg: ASbGncvZmat5gwYgzN95p7nReMONhWvqGPizrbxYK97TC1qd/DJbu4xVtUs/7IQS09v
	odA5PMwPPrIQg1tiVbFrH3i9zlmFMubnhvATCq/TWehAJBpcJFl2dOqhXMbLeuLd3cmUHG0uXPs
	G6/M5qJmNMOQwUd8uaOYsaKKiSr76VN7XW6SeEwdCiYtF7Xuf5GormsK2FV1Ly0i1kW3YsL3bFE
	dDwT77wBECMtMOVKOO49V0OGBoDtm3OXGKLtFVBMVSdVpFRQ5hMSAuZZlGpSZU6mwdhWfkYBfjL
	GlaCVGYFJLULJFVrRzhsI4YPIO3Wj8gzGC9m+9ECv8t6MfxDEUYaVpvd48ROUQFscNJMc0Cx
X-Google-Smtp-Source: AGHT+IFqJ+76sZ5zKGvWfOL25dcAZxuQhj7lH5Cur5AxGcIirIkmcfil+8KNWWqlRuFJb6f7BVgQOg==
X-Received: by 2002:a05:6a00:4f82:b0:748:2ebf:7418 with SMTP id d2e1a72fcca58-7489d00e68bmr18901543b3a.24.1750143785393;
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900cec7dsm8065760b3a.153.2025.06.17.00.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:05 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: reset: sophgo: Add CV1800B support
Date: Tue, 17 Jun 2025 15:01:39 +0800
Message-ID: <20250617070144.1149926-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617070144.1149926-1-inochiama@gmail.com>
References: <20250617070144.1149926-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add bindings for the reset generator on the SOPHGO CV1800B
RISC-V SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 1d1b84575960..08d28313b870 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -16,7 +16,9 @@ properties:
           - enum:
               - sophgo,sg2044-reset
           - const: sophgo,sg2042-reset
-      - const: sophgo,sg2042-reset
+      - enum:
+          - sophgo,cv1800b-reset
+          - sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0

