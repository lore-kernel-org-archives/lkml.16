Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A41290BD4;
	Fri,  9 May 2025 12:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793617; cv=none; b=SW5GGPqf5twtiQ42WZG4RFms67JXZom0nkyItp9dPB9oIKj/sWsz4iUsbMBCeQq3+mrYQ0kreHYPnwTydVM5qJMc/LkYNbpzuva7mZI27gvO/QeeeA+tpA3bO2Fa/cYOH69IEnbxYBzI063wcTvrb7K5zUgHFLnrqZFflfFKMbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793617; c=relaxed/simple;
	bh=VTgyjfrZGKZAmezb4rBQ08cviL/JEGukuMxZcuqc1b0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JWjahxcKohovCIEerc8Ti5jSYDIfFJNDsJ548M5d69v7IJlbToJpMPb7K4b5iHg8+BuQw5ZkgRROZfRMXEJql52NtCmgRtMbZQqM92BRWkdcHws1Ifg2cPcTg9XGiOhYPyTo3DRZ4lwx84iy9aElwAdvKwpLZYUHSvipJKUnK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXd5F3ot; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXd5F3ot"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c922734cc2so256415585a.1;
        Fri, 09 May 2025 05:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746793614; x=1747398414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=nXd5F3otsUHesxXppBEDvWgEZX6C91KarDetkhz0TKJWYwjR7G5CFIKahkfhCamhpz
         L/65RcMeTz0H6y0e30+e+PIgC2uoRNma19b4+9lQLoUuav3xCk0+nOB00tb11wel7Z7s
         GzUmuIkuoL+bw2GJx+DoRbeQezh2+r3OINjv0hsoVhaBOPywrx5AVYch+WcEt8PTHa0j
         yFaH1sGo44SewASZGbj68rpvIZfxULiMsy8c3F8edfFy1yWVwlbS+uWshpvGm0D/G8Hm
         etZ6wHTwhZCU0dAHHFklqKvo8WFkOkbe7TVJTw2nwcVvhFwcyi47Hgg8d99niMFErB1f
         eJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793614; x=1747398414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=le5KQCvWqOEE8uCC3fpbzR33yLLuBj9VjVM/PROhn9Q=;
        b=DNoATHf6JVMjYz24HnpIFYPdIB31jc73W3sWpec012lOjR/676hWD/T1yKIdR9wUME
         cTuqRQVX0Yj1USech5lMatBo3fAJFyQU1KSlj2eSQoSdb+gfpRiY/1UZPBxKhl9PNlhh
         0XqRezwkPjzeboWOCrOU0yifmGFa22MmitGcLjYtVHPA9F72/0RBBlE12PWxdJBwrWzw
         epycRy88ynyMxq+d0cMzOblaA5dFA1elzBpT3gSLuog8Ovr2J6sr6m17TgxyRrBqwuGE
         09uJPziEbdOJl+bHlNuUzNazCpBSoPK9gIH74kMo6hZ8sZN2llQSUI0A+/ZomQOC/30c
         0Gpw==
X-Forwarded-Encrypted: i=1; AJvYcCVaSL05AaDqYdn8mSWwMwbGrsB10vm4M2mbRzMA+g10bAzBn0O0U4IOMF3MtgVkB5x7oXJcehIx6NdVx84N@vger.kernel.org, AJvYcCW6mjmXJUHaydHuwVMzkFWO4NLS5dTskTplU7kGLE09k8Ic8FaVz2J0/jwSq+OJHUIO6oMlf1H0nema@vger.kernel.org
X-Gm-Message-State: AOJu0YyuQW86pEOBx5DhGtnRK+ECEyUZi2VbyS1Pi1Um4cW0fkiKCf1z
	P1D3KyT5QeKhlxjv6IRQaDSSvDpNBNNLfTwXrvwd6QIzwni47x6z
X-Gm-Gg: ASbGncuvuYSOzB3cR/NAOA8fRinCsX4b3ABloc4ZrqjCxND9WiN+V5mfgDyknCBFERP
	khPNKOIQLSBOfUf1Dx4duhGaUzyaKrI4wU9OZdbVkBOWr4Y/HVzncFb+0h38k+JogUJk8BdOQMn
	jPmz3/vfr45G/ED8nY/d3ndZJKfKJ2grYUJZXM2CgnkU0ox93ZXEQAZSkkLCPeLEz6LIPBOjE29
	OeiFb3RNll6E+pKX2B5jQbjkebpfe/kBgluIwVWTs9IU5BSKHRV8s9Lve63HyklU2JkrRKNbLRN
	7/f1muGLsLcFK96YLfmTwYhhiNxmSr6BKoZJnVkbfu3rnEMkyObo
X-Google-Smtp-Source: AGHT+IFmUN1sOyjiXVtW6fvf+qtt5Z/s83L1cfg+MbzsT46u6LjOO/rPg694Jihyms/1VYwtTVnq7w==
X-Received: by 2002:a05:620a:c55:b0:7c5:d71c:6a47 with SMTP id af79cd13be357-7cd0177177bmr410380485a.8.1746793614322;
        Fri, 09 May 2025 05:26:54 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e19asm131843485a.4.2025.05.09.05.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:26:54 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH RESEND v4 2/3] dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
Date: Fri,  9 May 2025 08:26:36 -0400
Message-Id: <20250509122637.26674-3-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250509122637.26674-1-inindev@gmail.com>
References: <20250509122637.26674-1-inindev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds device tree binding support for Luckfox Core3576 Module
based boards, specifically the Luckfox Omni3576, with compatibility for the
Rockchip RK3576 SoC.

Signed-off-by: John Clark <inindev@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 455fbb290b77..92f494bae3bf 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -715,6 +715,13 @@ properties:
           - const: lckfb,tspi-rk3566
           - const: rockchip,rk3566
 
+      - description: Luckfox Core3576 Module based boards
+        items:
+          - enum:
+              - luckfox,omni3576
+          - const: luckfox,core3576
+          - const: rockchip,rk3576
+
       - description: Lunzn FastRhino R66S / R68S
         items:
           - enum:
-- 
2.39.5

