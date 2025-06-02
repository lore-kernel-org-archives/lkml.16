Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706AE2C3244
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 04:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748838756; cv=none; b=DkVhh7vlZiwSxPmNqluL12haziLL1gAF1FcrX0jk+t+MysDa/xiPX9UkD/IKDnslETCIZ1sSnfnM9lyirgRt4wD5Hn9cuYukmiBcN8X77qLjusnwp3fCzwCmBWpPGQbD4bBOJcwzUyq1PA6tis9eu6PrNzhvQ9YN5CT/cZryixI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748838756; c=relaxed/simple;
	bh=yFUrBBSl9D7yxoSth936zMXfdxoF0Zzyhq+QKaWpWrI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HFLge1VKXP+EqDoRSWFgB0r/bt5J2IpS038Bw3Er86HGEpjcDMYV7PuewtWcjEmlRN5kr4I0VmlbZt6nS3ZLW7XR8DoE/oidftJ9yJy3JlHg4D52rsyBrID2e0p8qKgjxS0KnpF8CrfzWQDPrVGs/UFpzr2ku58/5VuZ1z4jV4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=FqsuPl/q; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="FqsuPl/q"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7398d65476eso2729572b3a.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 21:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1748838751; x=1749443551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJq78wY/crLkQo2Nn6KYgcryTBZ4RoIazEZoxMRMUE8=;
        b=FqsuPl/qmUuHRGhI1nBasZZmRz9pm76Mw28/+O3Yv15+t4GSNjw1MNPWFTJ+TBZEKl
         Rqjeb6bZ3NE/+l0gw7460RpjcwZR7ZQP15KNdPDbbDrPa/jjAiruR3QQG5Uu0QVILDYe
         x9zhREMM8IpKFgTQgKqZVsW47g84Jf2jdoj8W1c7yqnVUK/KQ/yYFEKkqo6hhKdL0XiS
         LUbjxktwr9Ve9x6BPG4NRT/3xb0/LFXXIptmAKYoK5opxWc4uUN6S3afURfOgv5N47t3
         gUATKH5SnL0HQg+jTc8Z3xnRwzrSMAozWLSnkjkipKJTa7lEzSIOI7K6qlPdIR7mwh08
         7R3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748838751; x=1749443551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tJq78wY/crLkQo2Nn6KYgcryTBZ4RoIazEZoxMRMUE8=;
        b=JMX/WW+L5qpiwJ0UP8uhK9m8H2NoEZpqGdLU4pARqvrQhwjIYy46I/IffR3NUjP4GD
         gs0jQokyUCvEeiL+kEn69PGA/ei8Hhz2hyEWIEbGn3U8Smjzc5HJiBvrd59O74etkyUk
         qTaIbZfGfmvCdOVk7qUZZ4l3GMM4IdHReHhA76/LP5qtiWQnxnEJ0xDmEZww7FowZ/GF
         JLVW4xTy7oj3dt7LHinv7Z8F/aCQFI2cTHyRdiUiYsLKhtDG0m3WHKB0l3W9Fpcr6TUD
         7r8WaGJ43iU1enlWbBkR36ZQ9sCdlnpil9wONCI6Bhf3SeNPkPbga6l7wpOC78AvWDvJ
         Vncw==
X-Forwarded-Encrypted: i=1; AJvYcCW+xgMgqVdxMYHuHeQ7yliH4yB9lLjMEbyR1QpmQ4a4idIXERf451BFr7Un9/sQJe4jP1Gk5qunXCFlB9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0DGE7fxqPvCSX+DuhkjcayIpkstwur8sEHNNqRg+qZr2UyHLa
	DQ1QdovbBCf5COMpNQqxJhzqa5q6tonvpyHk5AfnukWIJ+GAL090u1NuDRFy+zMRl8U=
X-Gm-Gg: ASbGncsbgbWyP/ozlVLYUBV9HtXMS+XDwS6l6T/L9fSZsCdE9Qj3PMzbvjGpYg5l8gc
	MD4UcOTCqIB/JKFcM4HmPW3E5ks1OHdqj73xoeJf5XTKs2uk7DeepilgMOHpSw/xciOqTTAddcf
	dcF6P1xH/DSmIMtb4K4TbVOR+a6KYUW6SwAyDiC2BD7RfTy75ptMUFLiC+74bL/H7Hc4NCApPXx
	bukCxl5J49Q+0dk5sukkrlgjMTkg050IXFQFNrYpz8XLPtR2G3eWcWOkxfG/3Bn3kVsH4NFvSP8
	giea2o7lkc+4hK+fB0iiHs0fdlN7n8RJeKyQGSq/hs1VG8KZZYVLbsNyKdk4f7WmhYn5Id5h
X-Google-Smtp-Source: AGHT+IFpbhiwxpJDD+phaJIWCFI5dOn68UTJQSMnHJdP1ZxwrJ5R91lg0I+EYR1aQexHnsVAbNnQLQ==
X-Received: by 2002:a05:6a00:a90:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-747ad443d05mr22354742b3a.2.1748838750635;
        Sun, 01 Jun 2025 21:32:30 -0700 (PDT)
Received: from localhost.localdomain ([123.51.235.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab743sm6887118b3a.54.2025.06.01.21.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 21:32:30 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chiang Brian <chiang.brian@inventec.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/2] dt-bindings: trivial: Add tps53685 support
Date: Mon,  2 Jun 2025 12:24:53 +0800
Message-Id: <20250602042454.184643-2-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250602042454.184643-1-chiang.brian@inventec.com>
References: <20250602042454.184643-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device type support for tps53685

Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

v3 -> v8:
  1. No code changed, included Acked-by tag from v2 review
  2. Patch kept in sync with series version
  - Link to v3: https://lore.kernel.org/all/20250515081449.1433772-2-chiang.brian@inventec.com/

v2 -> v3:
	1. Fix the order of patches
	- Link to v2: https://lore.kernel.org/all/20250424132538.2004510-3-chiang.brian@inventec.corp-partner.google.com/

v1 -> v2:
	1. Correct the subject and commit message
	- Link to v1: https://lore.kernel.org/all/20250314032802.3187097-1-chiang.brian@inventec.com/


 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 8da408107e55..e0017ba594dd 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -392,6 +392,8 @@ properties:
           - ti,tps53679
             # TI Dual channel DCAP+ multiphase controller TPS53681
           - ti,tps53681
+            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
+          - ti,tps53685
             # TI Dual channel DCAP+ multiphase controller TPS53688
           - ti,tps53688
             # TI DC-DC converters on PMBus
-- 
2.43.0

