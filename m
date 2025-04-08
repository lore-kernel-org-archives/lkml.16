Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B353FD4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 09:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744104202; cv=none; b=DBWN0I4x6qNmzHSDbOQ2Wby2uTcXSFNuP77vr46yJH6miXu/8sZlXRswHz/PIp3821/EL3xkaun34oIMtQ1YIMPUqzenS/1xjwgovpkOLDpRU+yvfruDRyN3g0BPsbvpxsKVo9x3KHh43kfHAt481UcDFFnydbQgaJlgu/f7/Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744104202; c=relaxed/simple;
	bh=bdnFDgVEI5AOqZfbKX9QQbECCPESHem01GmKSzkyHbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XJo5gPfQsvJ2NPruOWTOniBHu0LXgR5Q+LSplrXqm/SZfo4LK37Sb6drgjFDpXa0AbTKUSvKOriVMAYc2Er5D9KWmHBytJlpSsj7iKPxq6AW0v2K6YXVEODrI+QjCncQ1s0KX/tHrg/wrmcIxdNPA/54n0R0ZmNxc8V/+uO5mY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G1t1zwKH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G1t1zwKH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2295d78b433so50441685ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744104200; x=1744709000; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=G1t1zwKHcBaPUVCJs4l/312aX70OROcWJzXZ1oIy7/S0peYjPesBrBeVgwDWro/epG
         5dsKXfsxIJvfDK5+85594bIu9dcSq7ViuWBVmvt7sKfTg9hs0H4AzMrFx00bY5ZdA174
         cFxc3hmyFCFXiUhaRzmmcrb0Uudq43XlEd4Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744104200; x=1744709000;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNUnjAwr3K7/bh0YQuGEFB/xa4tI2s8atXnUMP1mg7g=;
        b=hMuZ0ATK1uOfMZnsrarEt5yv3/QSyvgt7IqlWlOI4Dny4yRppBlV7XOUtu+KUsrBj5
         t9vYeIVh2VOrFrv1CIsvrEFORupmxgJ7WrKkLb7pU+4YbFBdJRfHS70vP4mBkJCqjWjT
         iFkRcuDezOByxEtqrZWulch68eNfvTH72K4Fw5zNZD2EhkWXygKDuwGKz9iI9kUf6j9Z
         CJuVGfyNFWUeDoIsBC02nmIB4/7VJWNDnuQzieWT5btf+cAMQXLh6u++gnHWq2cOQC/+
         VFk2zHYV+7ZKDIEgOBgpMmbvoanhSgKqnzPFbxLYa4DSJD2+jSYfunoajRR0mB5q6Uxr
         6bTw==
X-Forwarded-Encrypted: i=1; AJvYcCWR5lGd3vXf+IuKrsvbd6gYKlPhUBQWaXKvQa11KA82M3nvfgEguQoCxxnYnORuMk09qGn6VfgXl4AcWco=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyysw8bMCPAtSPJODIf6V/hDOZg70+LZmng8/QlSKjngo9e6BXe
	O9wgOQRA7WiFhPUbXJMmhL59MGcsxBaAomDy6RYB6ub9JON5xUVYE11mlwLa4A==
X-Gm-Gg: ASbGnctV8L8OlfM1p9MQd2Jh/qJ/nbaE0ZkfsQBIfD8sKvAyNQqzyzFZJeRaTsyLAVp
	n7GCUALBavO6qtZUCpLQIjguS4rI/bL7TFMK2KunIOvlBYOC9ecUL/Tqcp8kDq1n5qbwhBfbC4P
	mjsFs3jw3JdPS6cK8AjajAQagTPb5oAm7qjIVeVXwRZGT2hebs21yCyQ2JZCeXpnT8dRSPLPJX3
	CA9PNm9pNXd6FhcqhixKzEC/aYcYHP8xKvtZB5kCtQjGZi5abMp5Pl9V8jczIckf8jkBxdagIq6
	y0KDVbWcViDrrzb2N/4NQDhD0N6zU9WBoLMlOWqidQhQCTq4xWUxZ01zWdSr4cg=
X-Google-Smtp-Source: AGHT+IGPhkSRb5R3PVNGCzYv1a6SJZoNU3t0aIi0QTJm3JWsa/HB1uZ+jzdpdKOIXFpq6puPuDXpRQ==
X-Received: by 2002:a17:902:da85:b0:224:f12:3735 with SMTP id d9443c01a7336-22a8a06b38dmr169101945ad.31.1744104200152;
        Tue, 08 Apr 2025 02:23:20 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:79d9:c941:96f6:ac1c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e477sm95651655ad.122.2025.04.08.02.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:23:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Chengci . Xu" <chengci.xu@mediatek.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188: Fix IOMMU device for rdma0
Date: Tue,  8 Apr 2025 17:23:02 +0800
Message-ID: <20250408092303.3563231-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Based on the comments in the MT8188 IOMMU binding header, the rdma0
device specifies the wrong IOMMU device for the IOMMU port it is
tied to:

    This SoC have two MM IOMMU HWs, this is the connected information:
    iommu-vdo: larb0/2/5/9/10/11A/11C/13/16B/17B/19/21
    iommu-vpp: larb1/3/4/6/7/11B/12/14/15/16A/17A/23/27

rdma0's endpoint is M4U_PORT_L1_DISP_RDMA0 (on larb1), which should use
iommu-vpp, but it is currently tied to iommu-vdo.

Somehow this went undetected until recently in Linux v6.15-rc1 with some
IOMMU subsystem framework changes that caused the IOMMU to no longer
work. The IOMMU would fail to probe if any devices associated with it
could not be successfully attached. Prior to these changes, only the
end device would be left without an IOMMU attached.

Fixes: 7075b21d1a8e ("arm64: dts: mediatek: mt8188: Add display nodes for vdosys0")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 69a8423d3858..29d35ca94597 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2579,7 +2579,7 @@ rdma0: rdma@1c002000 {
 			reg = <0 0x1c002000 0 0x1000>;
 			clocks = <&vdosys0 CLK_VDO0_DISP_RDMA0>;
 			interrupts = <GIC_SPI 638 IRQ_TYPE_LEVEL_HIGH 0>;
-			iommus = <&vdo_iommu M4U_PORT_L1_DISP_RDMA0>;
+			iommus = <&vpp_iommu M4U_PORT_L1_DISP_RDMA0>;
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x2000 0x1000>;
 
-- 
2.49.0.504.g3bcea36a83-goog

