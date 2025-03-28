Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA23621421C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 09:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743154855; cv=none; b=coN1OjClylJklDRapTCIS5RXKxqde2br5m5MXJZHBt12PWBXoXgjQzHH487cvw63/PFdSIqWrPwlMhdYKruoXCpOmxY2M6t6YWbV0qTZfN15OyALISRe4njgymEV5P1yj0zLhUDCpK/W9ypz1uNKt6qbpqm/zEy0mMQVEGH4xao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743154855; c=relaxed/simple;
	bh=AFNbJwYwvuSPKikmk3+Df47KychaU1715h9jlya/yrA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=AJyHmGsFTV4ATHAuncbUpDAioVlwZTIiOM3C4mdgqH2e7OI4X5uGwziZxsVBLPHsOZWNIJRBwQmrGm4vJ5OiAVgq9Cu40CU4+S66gWgDYu2PBzsbeNmafq7VPwkr8pucf9X6ZB2m76QQPnD2YpcKflKSNS9zETdOEJsEpnN2hng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com; dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b=GhbZGFYy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaqin.corp-partner.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=huaqin-corp-partner-google-com.20230601.gappssmtp.com header.i=@huaqin-corp-partner-google-com.20230601.gappssmtp.com header.b="GhbZGFYy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-22401f4d35aso42529065ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1743154853; x=1743759653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
        b=GhbZGFYyqAYW7EAZ/08Jeu0UiwP1dYEtTU8S81xNNekSdMghpJk8I2jCuAuW+1er+E
         XEkAR6Kz9hZQlUa4FExvVJe/EpyMJOSH3jwQrkWn+XdFjyPRGao1zABWar/gqzjcfPH0
         n6g/feKrfDBDHI5DdlOr0v/kJ4MWgOfJ2LBcZDhT3YzcXFJereErhLCZJ1dDfsTkyWNj
         CgJ/roEi5t0CDrpcIqiXRZl9Mx4VLu2NTGcf4tDjcgs9f+2uT96KEmsTkjr+oRWkdkXN
         BRGo1l5SZwP0akUMhsdWijWybZU47v2CFzjA6LgS7BSsWoNo1HV3A4R5EEN/bm7sdsq4
         mPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743154853; x=1743759653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjMXfLmHy2KF4ip5PaP1f7WukJ56BcbFiMpRTGURY+I=;
        b=QE0TOS/pqBqKZv0SifD0L0FDYW4ZBEpqgkAzOv+PcewKbLaDCcOEo37rH5hAdPWXGQ
         odyqxaMR+x7fGSvBfOY5Gu8kuQrD2Z7WgnOcWFTXF2jPiYkJbP0VcyMfaR28HJFdbuF9
         CHzR8fOIG9e6iKu/0CwOO8UKo8eXHJxpDDb4Ucm7eBgBq5Hw6Xl4jMGFbGoGIz6I8X2K
         2B+pBAxx2Mve2GEldXJjeKw5QJpCk0wqr3mmqskJWLmrMALURMyA/tjZvC/Ofez9PmJO
         WByMogLgtDNkJgnyQQFp/qHXAEkBUf+HNSBbpQlnPYWCBCtxt7CPSm/LXGu1Ti8EcJmb
         wHFw==
X-Forwarded-Encrypted: i=1; AJvYcCVQuhCQ7E1zLHUQkofpvMw797hu7kTKTVOkLH52cltpsF2ldONBsQO38ZcKfZhBjWbshVnBW9XqKAWghrc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyA6vlz5jEhSkZSqyMlGhaOFJcBHoltv87gCJYxuHGuyLZwttT
	vylRxQc6ztFH0T8g4eFnxULo2leyg4sJfpSCItQNshbmlPO6Olauo8bH1Yisq3w=
X-Gm-Gg: ASbGncvIIMCy6H0kO9/FNCk8Q6JbJDTNvRmpUQr+AUGuSTzXcr1sgSVpy4mc1JrWX4L
	6fPZ0/qTHVpddVqqafwFsEt5chM+RFSfJ+TKEIalXXnzA9AD20h1jeU26hfd8i5gxylccT680Ef
	kBGIaIaPDj8nQFKz2OKVoOIpOiDVW97jsZAzoNcLe57Ru6v5hIgYVSgSqb/8PKwIaeRs3/35r1m
	yHn+ZuJIIxj52cb0n7E1ojUXJik4gHH5+i7pBeohT8TtjnQ6yd4BEztXMwdUX+uBVg7klP4YvqT
	1RakdxCpGAueqluq7nxgsG0kzbj19gxeSmrefPIBRGsWuaPgtrTYklxKZo0rRun6GKjAT/+cFKm
	2t6hDmZ1oKeKZMA==
X-Google-Smtp-Source: AGHT+IGp2o3LkuIAgi71QZgUHz6T+RQ1Ol3kgJLLZiH+h6Iuyl7UW85ocR8eAQzVe59u+58NXlwvcQ==
X-Received: by 2002:a17:903:228c:b0:224:216e:332f with SMTP id d9443c01a7336-22804968a3cmr108743245ad.48.1743154853027;
        Fri, 28 Mar 2025 02:40:53 -0700 (PDT)
Received: from zjn.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7397106c7b7sm1283012b3a.116.2025.03.28.02.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 02:40:52 -0700 (PDT)
From: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
To: sam@ravnborg.org,
	neil.armstrong@linaro.org,
	daniel@ffwll.ch,
	dianders@google.com,
	hsinyi@google.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Subject: [PATCH v9 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
Date: Fri, 28 Mar 2025 17:40:33 +0800
Message-Id: <20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
References: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ponyta is a custom label Chromebook based on MT8186. It is a
self-developed project of Huaqin and has no fixed OEM.

Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
---
Chage in V9:
- No change.

Changes in v8:
- PATCH 1/2: Remove custom label.
- Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/

Chage since V6:
- No change.

Changes in v5:
- PATCH 1/2: Remove sku2147483647.
- Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/

Changes in v4:
- PATCH 1/2: Add more info for Ponyta custom label in commit.
- Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/

Changes in v3:
- PATCH 1/2: Modify lable to label.
- Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/

Chage since V2:
- No change.

---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d..fdc57c140af7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -285,6 +285,16 @@ properties:
           - const: google,steelix-sku393218
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku0
+          - const: google,ponyta
+          - const: mediatek,mt8186
+      - description: Google Ponyta
+        items:
+          - const: google,ponyta-sku1
+          - const: google,ponyta
+          - const: mediatek,mt8186
       - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
         items:
           - const: google,steelix-sku196609
-- 
2.34.1

