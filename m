Received: from mail-m19731115.qiye.163.com (mail-m19731115.qiye.163.com [220.197.31.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D707E289E3F;
	Fri,  9 May 2025 09:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746783622; cv=none; b=JMMjD2FZFTO0dwQIEl3fyvAfglNFjBBxXi8XTcttke/3y4xuOj7VGPzBBz86qFxkFCla/sc6484crcPwwmjX4c9NAHYszRgj/5E5aCh2PQCN6CZyCQ1VNFod1M6zfKR6Tt4p/iPUVpt0iuslCf6J4laBE0bXzIN0VPFVlfiWoCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746783622; c=relaxed/simple;
	bh=hx6xvwT7IfeqG5HXNR816iG6AtqIrLH7kRlV8bFOLLM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R+XMoTHLZn4VdNSqeZMBy5o8pePjFV/VrxBGGOJXVkiHidAt2Xgk/2kXcX05hRFbLAW4S1Ww2D6aeNBTA3V07XREBK8wqzv8FKYOm9gYHVLUPfZ+xW2LPkACN7nyPbiKp5VUjXFu3Zx74aDZD7xT3h+bI8OENjxu6HUsHa+rZPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=H4mOQxuW; arc=none smtp.client-ip=220.197.31.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="H4mOQxuW"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 147bfe069;
	Fri, 9 May 2025 15:17:49 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Elaine Zhang <zhangqing@rock-chips.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/5] dt-bindings: rockchip: pmu: Add rk3562 compatible
Date: Fri,  9 May 2025 15:17:40 +0800
Message-Id: <20250509071744.732412-2-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509071744.732412-1-kever.yang@rock-chips.com>
References: <20250509071744.732412-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCSEhPVkpNTh0aQhhPTx0fTVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0lIQkhDVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a96b3e853a803afkunm147bfe069
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NQw6KQw5SjJKTgINFy8hQzEu
	N0swCkhVSlVKTE9NTExOS0xKSEpCVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlKS0w3Bg++
DKIM-Signature:a=rsa-sha256;
	b=H4mOQxuWlvm+4YFBGQbCYcfSuprHVK9vVshjNNOsXDSvMMWb3JvOC5LWabRikbphzGgoT9JmLoawufz0BHV9kuIG+GnJx/mga/oTUpfFROUWDGXvTVSPaftNQcexPneQ8cqzNk2dMiHSH0rfvzkXXYrndd3KsPMWL4ap6QV5zAA=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=xSFpjwbQMrP+FaeVpl/qngyyHv1MywXzP3kuhNO2yxU=;
	h=date:mime-version:subject:message-id:from;

Add the compatible for the pmu mfd on rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

Changes in v6: None
Changes in v5: None
Changes in v4:
- Collect ack tag

Changes in v3: None
Changes in v2: None

 Documentation/devicetree/bindings/arm/rockchip/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
index 52016a141227..46c1af851be7 100644
--- a/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip/pmu.yaml
@@ -25,6 +25,7 @@ select:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
@@ -43,6 +44,7 @@ properties:
           - rockchip,rk3288-pmu
           - rockchip,rk3368-pmu
           - rockchip,rk3399-pmu
+          - rockchip,rk3562-pmu
           - rockchip,rk3568-pmu
           - rockchip,rk3576-pmu
           - rockchip,rk3588-pmu
-- 
2.25.1

