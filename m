Received: from mail-m1973189.qiye.163.com (mail-m1973189.qiye.163.com [220.197.31.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF292033A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746516815; cv=none; b=RYSG7uxgUguOPLiZ4pGNY6zE0Ay+VFzS9Yjv6tXang9YrRzemns3j7nbkG+kN/ZABQpola3zdzZIIJv5nj6wYcikmzrVGu7JRCUpcWhBzL3HU0LlF1v5IM2Bx6NTQnvg6mOkq7k9rUtWNpsvY1g7yxSv9pXnPXai5amvPpAVMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746516815; c=relaxed/simple;
	bh=nTnT41H56NFfzfwDP6sYaJgsbM+rIFepGMFg3dvWngE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S9353fq9/iR+O18sxUvuBUasYYSf6b5l3/lvseKqxNRsNWWBpf8P2YMm5tMCypaT7GFcAmlf1GtocHb7Y4NwV33ebkCh8xod3mRpV9oUhMv4f9L+n5UzHY35H//Gw6SRxCZ3q1zuYUmaOTNzlAjNdXP3Kq1pr/mXrRWAG+bodGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=guFMkTP0; arc=none smtp.client-ip=220.197.31.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="guFMkTP0"
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 140c6eaf2;
	Tue, 6 May 2025 10:57:23 +0800 (GMT+08:00)
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
Subject: [PATCH v5 2/6] dt-bindings: rockchip: pmu: Add rk3562 compatible
Date: Tue,  6 May 2025 10:57:11 +0800
Message-Id: <20250506025715.33595-3-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250506025715.33595-1-kever.yang@rock-chips.com>
References: <20250506025715.33595-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5DT1YYHh1DQx5LSEwaGUJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a96a386d0b703afkunm140c6eaf2
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NxQ6Ghw6FzJJDREpMjMNMDAv
	PzcKFEpVSlVKTE9NTktLSU9PQkhLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0NKNwY+
DKIM-Signature:a=rsa-sha256;
	b=guFMkTP0qNBxhrij+lmM2saCCfyqO7SwolRAgPKvg+uY3pdb45tYo65itycGNdj+h/8n+ruBSRZqhnQoxguoDRFV14rOEGUeujKyjGMVmOhWfrBfBqRnnzt5Wvbs6JghHnJQRcreCHD85kUdBWnqDVr/PPMo+Vbi8gNo3NlnfGU=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LJ5LDuPoTNaHftITtU0a6AsO3YQBapk7pI5GMnaJ3Io=;
	h=date:mime-version:subject:message-id:from;

Add the compatible for the pmu mfd on rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

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

