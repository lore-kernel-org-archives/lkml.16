Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF21B2475CB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351794; cv=none; b=Lmy5IBPpNZWP6Picr8HHzAZ74GdSlSiI5CMBfRjowhnzu+njUspQO7iaf/R7XPbYYXPXDxVTd8F8LSnnhET+hccnQl/fHRbA6dKsL8rqx5PRyNj34yOOlUVfN0h+JsX2l4szi+shgKjHancpt8hik9x+1ifwe+CixesZi324D18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351794; c=relaxed/simple;
	bh=S6cjipfxAita73V6JkLosCs6f9j35AYf4JtRigU5I9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XViVUm9z9cnCpRsmeJsCCh3eCCee6zhr9kj+SFwjW91hWrDTDa3JT13gTc0yVTQa2Akfw3JWVjci38gQSqsXdYVlXTqQK1B1zWcCU9LB0bLVZEK6w1QJx9Kl3W64dxLZnRlazBrwzdzSeToQkpswtPcEK7HMLhPvyvBQ7ftgy04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gguqPsN7; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gguqPsN7"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a577f164c8so724059f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751351790; x=1751956590; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EZS2dGfFhz4DV5h9FGWwFN5DAtPdX96LRkBj81DNpcM=;
        b=gguqPsN7Tsz336dNL6RoQmqQZiom3ibRshTpot3aaoFy6CUsqqJ+8gg0psuvuLvPVs
         ILT+QiA04ertZ2Jmo3uwHnoLt5jO7x2Sry9igp/kT/hOIR5qzq2VmG73TYl/d6Y/WCM2
         X7rzBxbCkGjvlNvKK6yZPwAlIbud4PwxBgj9fH6bssN32tL/5IwaTZVUPlXJQkNZUrs7
         DAvRFu7omm6pywA1ZjS9mTH8Jgles4cXVeWoiEYPjLVUW2/hWMtAW4GLZQlXcqGz0yAr
         F6vZEFoq6qN85HJfXCF7tRc4hWkf+sRgM23hkKOwS1aL7RWjIUWIoFVR6xILUbj/AEyE
         FiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351790; x=1751956590;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EZS2dGfFhz4DV5h9FGWwFN5DAtPdX96LRkBj81DNpcM=;
        b=lnpXBg0RniwZlA3rlBGlX0s5XEv5on0RatcD3HRYw01TZJ59NuqW3qfNjvg0wHVx53
         svM++AoKZ4wwzRc6qOntaXYkmAVMW1SctChV2B5k3LoPxLENC1ZjY1lgGWoOj/24oDk+
         EcYnFzW6VinJlqLUItqtkiVe/jzZ0ca2U7Gpbwf/WLHuI3flzaMX926IlZwqjdR8Ix19
         xIG6i2afxN5Ka3++MN7n6I6TpwFmCOaSDTT9JJcxApy6mgdD1yg/5lqs/Af2BOC5hltO
         FW4UIP0ms31kc48nQC6kWAxM40qKrEvtPPN6YhTTGKUfVJjYOdBu+qVu76rgGQydUAg/
         OpzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWARlkjeMOC24XDzjR4TB+oWjz1liuslN3WUW2K6yfNzKi4wNQS2BGtmSkkG2eRYnl0E+zPtslD7emIdG8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHhHklgftftByM6dgvJl0h35sNSYq3TlSljS9a8R5OjgwSUqTO
	T5MAhuARFSELi82J/gp0PMtZ664dPYMpOkLbW4uCZQ8Xnzo+Fnla+1dv1Vsy62ZqypQ=
X-Gm-Gg: ASbGncur5mX+7SVoogHt7Q1LpJnNRHSi6VJoIwC3tHwJAf7Fa6e1ZxDF1BKZi24jxKE
	m+Yv4ItC8CU7uCFgtXO1zAPlD7AQkCt+wTdtsVJlBcibazV7qRZ+jVFVBuXbt3eKBm0L0m1N0Am
	2uomeZ7Im69VeFysNgMqphaWHQHfoEwcZvf8L6wt8ps2HJBEeH+a4RlwZntVyw/5X2DihoijoMV
	u3QSuZR11h+IhZh5W4XwyohbtGcJf+a7R+H7Ic3E3M4H8mMVEoK+7rFyHiA7GTF0mVHp6YtOYJA
	OTjfbMIRiwL/C3h9G2hezpMEiNKz5qvbSy9bZozMQy/FbplcYsw84ZUCkYZ2xEomcvg8tABnTEU
	=
X-Google-Smtp-Source: AGHT+IFtrU4YoQ/j7QsTLU6w1l0Gl0/puRBtn5UoLC4Rc4bLHeuG9LgcLkzyP525KKRGuBzuEKPP5w==
X-Received: by 2002:a05:6000:178e:b0:3a5:8b43:2c19 with SMTP id ffacd0b85a97d-3af48a83a9dmr416781f8f.4.1751351790022;
        Mon, 30 Jun 2025 23:36:30 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5963csm12294776f8f.79.2025.06.30.23.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:36:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH net] dt-bindings: net: sophgo,sg2044-dwmac: Drop status from the example
Date: Tue,  1 Jul 2025 08:36:22 +0200
Message-ID: <20250701063621.23808-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=S6cjipfxAita73V6JkLosCs6f9j35AYf4JtRigU5I9E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoY4Hl6oFY6MC1mYY3tYMqGk+Xq4qtbynXG0VKf
 o4z8NuGJQ6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGOB5QAKCRDBN2bmhouD
 17vkD/4lwb76qcvbDpG1bX92LByyYKigIiXJxiNcw7iJhyOz/uTjY3I9NhZuyiOIqxv40YBYzuJ
 ZvAx5nw8qpRLROL2Lhc+UAZSKriUlMxsZMRuIxDSAG0nUrspxP4Apb2LCGFCDuymBn9X1M6NNx5
 UR3Q7hIMidIXmsBG0EOH28pOoW43+XPX5dEcPYkyYCG0hi5QWCdY+fWzzf9pbbFWBffc6sm/gMG
 6gHkizBuTkNgvf9OQ+6ESUAglErh4kwOyIhcujG18uNr72N1nBHBz74USDZKbEPKznsXaQDbuij
 K0g+2gF503iGxuI8vtSaiA6tpUshj9B8WBDxrUngLZROQs8aJLfrfAUx01OmVzsmGZRIIg57N+g
 Fx+08WIJnvdLlB2Uvv8eoO028JJxeDMsQq/LLs8S1AACMdjEcx5H4mZT+Wplh0QGURXG1t6XFv0
 +w3T6moXyOLD/t3SgDHBwr7lWEnjO5QpbNh0zC+i7WVAxJHc42cbj2q+Lwh6yRKLSKmBcih/yHW
 /TmuvZeauEYDJ35dM5omlLWntZKOpjEt5VDIQkCqrmzb6g5UcWCNBJycKM4ifQxhFLko+XjdaqT
 lXew70S8oxXEXXJm3f/QHfk3pnRDaKIjwDUU030X+Z8KTFueHnKOSEmkf3oAw2Pp6PsRjOTYlhu NSGDdhRSScXbykw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Examples should be complete and should not have a 'status' property,
especially a disabled one because this disables the dt_binding_check of
the example against the schema.  Dropping 'status' property shows
missing other properties - phy-mode and phy-handle.

Fixes: 114508a89ddc ("dt-bindings: net: Add support for Sophgo SG2044 dwmac")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
index 4dd2dc9c678b..8afbd9ebd73f 100644
--- a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
@@ -80,6 +80,8 @@ examples:
       interrupt-parent = <&intc>;
       interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
       interrupt-names = "macirq";
+      phy-handle = <&phy0>;
+      phy-mode = "rgmii-id";
       resets = <&rst 30>;
       reset-names = "stmmaceth";
       snps,multicast-filter-bins = <0>;
@@ -91,7 +93,6 @@ examples:
       snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
       snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
       snps,axi-config = <&gmac0_stmmac_axi_setup>;
-      status = "disabled";
 
       gmac0_mtl_rx_setup: rx-queues-config {
         snps,rx-queues-to-use = <8>;
-- 
2.43.0

