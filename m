Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E612260C
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 05:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748150214; cv=none; b=oFkqEcXkh8KVhSq+7dOIvMH4zIAC+WO3lsVFJbOPKrjq4JdXTY0lrh4f6qIvzfj5S/Jqsjkmb83IKVP2wn6Txvh0i/ZwnV7vZW97rCfrXcaXLgSY0ikq47iV7BbMJh8Hu+9RkCCtQ1Sh6DeDohYKLG6JZJk2bYkXdnajyisf6nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748150214; c=relaxed/simple;
	bh=+5c0VEkCDydqP+dJvv5yWg3lhMM2EDfhOnBOrhDfWlw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uWjmUGQIJnECEEzQdWDXY1x20y1O1y3NBKJxlKjlWjCTZ0Zco10sk8rS64IzML1tca275A8zHtJkXAMwJ+IOEMbw1RDRfQYrbZJ1rH2LDmN2ZwEvj9YydwNV9dC0ltBx2z/2Gk+b9SA6t2x4ZxPGR/qChzeFdlmuXMvbqZJJDjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XAnc3jSe; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XAnc3jSe"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-441c0d42233so650975e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 22:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748150211; x=1748755011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
        b=XAnc3jSe2MjqDm4pxwwzZaoEBZxjIT3T/TqwBWEQ+m4KfalEGrf191VqSoRABGCV4M
         BUocT2zybtzrZSfieZgH9r/pHGoTle2Yym9mdvKf95GLV37Pg4RszeRflrJDTSzPQtIh
         R1Sh5FXnNvV/LJm/cN+qyVEoUlxqW3ZTxTZ4aVLNfO6BlhGIRX+g0qENpY1gxHG3W73l
         guvvXNS4ksJTXUjBWaABXQJdQ80X/B7WkeyscVWBNu2ggE3qnQCF1TSdy/lQl11+xvGD
         lTqvNaO58EQnbNiWv3zA5GpjblaLmX6/5j2wZTThV9CfqPQ5s2E4vmyTZGLrEiGOMNhM
         kXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748150211; x=1748755011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=msz6xS+TXEWf8BCe56XVsqhhuQHPDAmqJV6W3BuHJYo=;
        b=gQL17POFw+ILEy8tNlzR9hg5EZNwWlbHZDkiPuCzKNPtkav4nXID2qIASS2Wgk88Q0
         zQx5d+mmYAtXTOVNDz171HFjn4Kt/V+I82WN6NOCk6BO0zkMk09Ih8y8oHnOpRBiQxvo
         FSqM4q4doz7yL8x2qouOJ2M6U9lX5T/4hP4mu+4yYBQT0HUd2iTkf6xnR208U+F26Z3s
         Ev/dqSZvYepFwa1Cr7cvptqAcQAG8wPovrj+G1coqxozxmJDjCMz+7m9ZiNf6pDBAP5R
         ShwQFm+TZkUCVhnMAmucZD+gf7/n1VYAs8BtiTg4WmKvrBa7Hda2/LN5tSraPJbYFSbk
         y8XA==
X-Forwarded-Encrypted: i=1; AJvYcCVLDdm5sIWe5upMwYC6NVAtzecJlkr+vdbglvq0zV+b6dO1rjzXRbRx1vMixss5lu2Ga+DrlX5iUHJTkp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqMQcKxer+ftOWroaMyNNJUwLJ/YsoQD1VOIvbffnzpTRyHsU+
	CQTk71nUzx/xsy1TlgS0Xp8/NmDJH/L5FAS74TcPX/At5JxD3BUr5Gs9yVI6dMp33u8=
X-Gm-Gg: ASbGncucBSMsmCgK3nxR4XeDk060p2i6GdFPhSoSBLNrq7Mbr44c8S24gMBo7TFF7/N
	Xp3xseA9olGJF9p0z4BbMYaGZlnthHAWLXZjrlmD9SxlBLBre4t0zzAa5Ob061S/l/qqFCkQQXm
	dVzzkbBaAys8GGtrjiT69Jw/lSNEhXa2GrW7C9uB064iLrZ6FOXhxyc9HUuBfaszeNd+rNPfv62
	xmLaiwknVINnVvrXmOsjp5WFkSrBym2lNZ7IyLQ+wzZIp260Q1WVeS+oJjecQ+AQZPGtTt+I4nM
	ERzoTLDb2l7vGco+j7cO0pEJvwWHS8wrKyDGVRvPGha85BKRoRDrhF4zGdTjUg==
X-Google-Smtp-Source: AGHT+IF/jwowPMNweDb/B2JPyAKFGWGQxdc3mLIKIM4NNW5whKHA8bo7N+3jJruEbrSaU/3hrj+bdA==
X-Received: by 2002:a05:6000:40e0:b0:3a3:62e1:a7dc with SMTP id ffacd0b85a97d-3a4cb434a24mr1333037f8f.1.1748150210738;
        Sat, 24 May 2025 22:16:50 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d67795eesm372940f8f.86.2025.05.24.22.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 22:16:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: mediatek: Constrain iommus
Date: Sun, 25 May 2025 07:16:40 +0200
Message-ID: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3619; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=+5c0VEkCDydqP+dJvv5yWg3lhMM2EDfhOnBOrhDfWlw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoMqe34zQlzL+mH8sYednrPzCB+DkOTefFX/gsg
 CPcqSp2phOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDKntwAKCRDBN2bmhouD
 1+d+D/wO4XWtaSL5Qb2EZcmthSwwShwp2UkTqt4aV2OtyA/7xavezOOZEsI64ORhN+e6aSKIJjt
 8aV5tclmOA+GGI92SpVK3nLJUWcuV1gn87alc+VfrGqU8UfrsDB/lMef5fNZIaqIHJhW3uXoEyK
 jjSdxY2nwJS4tofa8kjxqmuAkmjv/wZasaEbDfw2YiTLu2wWCjmlmO3OsYM9z6KA3j8q1dnW7Dw
 e7tf64cBf5FP0xdNNxBNNWpqggwSqwryvr+6Vxp7GefHghXl/luFwh/31n4jhV5twJXdFX4w6O5
 BIFyepFm4VuMoDeHOXqQsnhUGEob2rU1GSpDzRHtodioeou+G1qQu6RZcRaXILpSMPMY8XTjKfd
 jVQA/q0nNLYctkBfycPA5OiavcADRTUJ5I6a7zUY+7nf689HDwiBzyF9DV6N9djU0jug4Qe37Le
 zzRBlrazoQT2FuQJY9YZiJWwXCG6lv83lYsMSkgHyL98/yTXdy0aHZl08HjdyICYGaHFJ4VnrOy
 0TsfjR0sbuBvtGme9HmCnlehtrp2kRR/gvMEGGAjNWaFb1ANYblR/W0BGN9CsWyiSQoW0Hzq30n
 kxEL8vcOovz7A3QtUcXlvRmkvPf56Mua848yvHoIncqJFWv3t+Ls/bLbqjXzxoH940UIYc7UC1F +hPx0ET/ieWU3Gw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Lists should have fixed constraints, because binding must be specific in
respect to hardware.  Add missing constraints to number of iommus in
Mediatek media devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/display/mediatek/mediatek,ovl-2l.yaml           | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml   | 5 ++---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml  | 4 +---
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml  | 4 +---
 4 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
index bacdfe7d08a6..ac0d924a451b 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
@@ -45,9 +45,8 @@ properties:
       - description: OVL-2L Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..c0fd0a91c4d8 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -65,9 +65,8 @@ properties:
       - description: OVL Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    minItems: 1
+    maxItems: 2
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..7e5234def39a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -64,9 +64,7 @@ properties:
       - description: RDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,rdma-fifo-size:
     description:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..276868c0fde7 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -43,9 +43,7 @@ properties:
       - description: WDMA Clock
 
   iommus:
-    description:
-      This property should point to the respective IOMMU block with master port as argument,
-      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
+    maxItems: 1
 
   mediatek,gce-client-reg:
     description: The register of client driver can be configured by gce with
-- 
2.45.2

