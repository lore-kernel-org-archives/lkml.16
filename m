Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com [45.254.49.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382FD2749C5;
	Tue, 15 Apr 2025 05:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744695273; cv=none; b=svP8XQar+KRmPQDEgx7KoH2pBqbvOWe77GQrAbX264WkuvjMQB63OAGkalSJRuI/DNWNBov8jr3zV+YGjAWG7pt8IadDKdJjgTA9FMlKgT46KV0JrBjwD7laHGR+1Ztkac8287ApYrjIEI0UJVJRKhrCZPrdJpYHMaBMgiKZDlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744695273; c=relaxed/simple;
	bh=Tpy/QNYDQyd6q+3c43Vk2WO1/yY4QEEbDrFMjFDmF3s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XY5Gl/WLls1iRRZ7drzTkX+CYFHyXIy8XVMO6k/h7OxUaWzXzewS0hZHNnEUxqcvBy9GilDnuiPxKEPL5C6ox/rw60ZqSTRfnz6lA8uygU1My40m2NpS3K6jBrJCr+PeX7IKz17su1trLqxI8e2dOpGjBPTrKyMuogQWPo86ky4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=e47aDxT1; arc=none smtp.client-ip=45.254.49.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="e47aDxT1"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d9683;
	Tue, 15 Apr 2025 13:19:11 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Dragan Simic <dsimic@manjaro.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/7] dt-bindings: arm: rockchip: Add rk3562 evb2 board
Date: Tue, 15 Apr 2025 13:18:53 +0800
Message-Id: <20250415051855.59740-6-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250415051855.59740-1-kever.yang@rock-chips.com>
References: <20250415051855.59740-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTkxLVh1DH09KGh5IHUNKGlYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e315c703afkunm11e6d9683
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ngg6CCo*ETJKLBodCgEyCikP
	OD0KCiFVSlVKTE9PTUJPSE5ISk1MVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlLQkM3Bg++
DKIM-Signature:a=rsa-sha256;
	b=e47aDxT1kloBlZcWK7cuK59wY4peg4CzWT3p5fjlif+O1fsBWOExcG/FXNePp3XhUMC+EYFLkHGgukA9R7tl7zoAr+36KyP56vXzCq/Luot8I7zQXcgOzLNiFUhr/xSDEXhkVCPx2xaC+KKBKCg0OYfNJZwOdrZ704CoGj6fpwg=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=5Rcl544JYRQBkKjgzj1ImfOm26zzkXaJKROFu1KH30o=;
	h=date:mime-version:subject:message-id:from;

Add device tree documentation for rk3562-evb2-v10.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v4: None
Changes in v3:
- Collect the Acked-by tag

Changes in v2:
- Update in sort order

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 650fb833d96e..ee9f8fb93664 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1057,6 +1057,11 @@ properties:
           - const: rockchip,rk3399-sapphire-excavator
           - const: rockchip,rk3399
 
+      - description: Rockchip RK3562 Evaluation board 2
+        items:
+          - const: rockchip,rk3562-evb2-v10
+          - const: rockchip,rk3562
+
       - description: Rockchip RK3566 BOX Evaluation Demo board
         items:
           - const: rockchip,rk3566-box-demo
-- 
2.25.1

