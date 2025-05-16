Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9F58F5E;
	Fri, 16 May 2025 01:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747358734; cv=none; b=d7PATN0s50xuf1oB27e/FcV5NdaThQMhEOzHgspDaqlEmRYq7+dX0bX1zQN2Hd8tMnmGC7Ap9UH6WyoJfF0l0hJ7mN4uxTYnDfuLAIOdPsblkCT+oOlutdvJflTjtuujd4y61eZYLyDnF0nXhz4bA6ktycoO0vYFooAAPWyAdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747358734; c=relaxed/simple;
	bh=w2zdlmvSlZ3GigXquGzHuzC+WZlwaeRcdQGUvUyy/9A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YvANTmR5xUKIIuA/ANi/X8O8X/bzgQ53Txbx1PZdsYCBh/rAwqQHWWMoFRz3R3M5rxcjxJtyfognmFMXSEKdReQLdIrBilsBZidJ01F0Q7QaPr2Auwjk5ZRjpfsTcbaGw7uQ+6CTvHtPnRpzRa/+f4fkTHOMOpUBI+g/hGnDAtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn; spf=pass smtp.mailfrom=chainsx.cn; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chainsx.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chainsx.cn
X-QQ-mid: zesmtpgz7t1747358649t95b58a98
X-QQ-Originating-IP: 4D8IhlwuFVyJP6Ex4YEy1ES5/F5F7Qaqv9OJJU9+t60=
Received: from chainsx-ubuntu-server.lan ( [182.245.65.180])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 16 May 2025 09:24:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2142816274649629087
EX-QQ-RecipientCnt: 10
From: Hsun Lai <i@chainsx.cn>
To: robh@kernel.org
Cc: i@chainsx.cn,
	conor+dt@kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	sfr@canb.auug.org.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: Add Firefly ROC-RK3588S-PC
Date: Fri, 16 May 2025 09:24:01 +0800
Message-Id: <20250516012402.580468-2-i@chainsx.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516012402.580468-1-i@chainsx.cn>
References: <20250516012402.580468-1-i@chainsx.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:chainsx.cn:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MjqaYNLY8QZGRcV5QIH9KpfgqihH+GF1wHOKv4rGvgdLaDTLlEg3C77j
	d3uibKDe+t25Xzb4KQF4h8plU7XHEYUtapjLco/CMJwi59GeQLUHcViVetvs6xsMSujP3Re
	8Sc+GRefNqPieG6Tzw+wI1nce7/kbYQBHe+FjnE9aOlPIb5kz6T8CJ4sLS1L/l6uRmWsKcX
	xMKjGqJaqa3J/KEZ0lh4c2hwXCrKdMbhbXCuNi0ZHIR27tSWu+ZMN0kiMs8zhvWtpDt6+yN
	fpMHUoGslYZ1hE/HZIz349HTZw6IuEY2vQOuBhfAUNXGqFEN0FT/ntnkYb262DXmML3vAgx
	6UMRmgSpELMKqkM1rAvNKchRx/BtmKdmuDIOS/Qwsu3oDPeo6lixIsYshxPEBtKvKNMh7xh
	lzb5fpwn5cIPTb5RDVMePJRBE6LqdWyTfHhIvX02V/EmpXBFrPCSDmrCoHRpKKDLiIxyJ0j
	mmkb85Y3SH6SZ4z/6AHbs9rT5zdqA8ey6NyEKiQWpWuwwPixVREJlUbcUTHYoFtmA6aiiDi
	ygAkcotb3fEZRtTs/AG3VbfweqPuTC4az2G3V/3GnegdF/3Y7O7lWNeeZ18VRXyRcQ5ymEz
	czCFs1Bi83fRBvZDMYOKRDo2ccTWHFOwwYKDavwXrDeTJZXnuB5grtveyNGJ0bUjTRWm23F
	MtCg9JZdoJsg1Exk4ySfpIsNT10Fs9zstXN9meHB3kZKqC9L+EHwiAHNZCIinWssM+WdrdE
	2987VDUwh1mgljfcpCkaoKu1LHJI/BVaBcDsz8hVDWq36ZQmBe9cJF+QCqvsuoICDRyIqJc
	TkZxijoDjuVhmRnYIrPOBANWBW1saXgBVF87Y1frh1Mijau6ZVuANBtVaVJjkzTnVpnsc8J
	Z4F/zSWtLX5hN2Gk3AHSwQTJEnoKLTHbMjp1xdiyndzAHT39ZsT97J3DggR14vzSoax1ZiK
	dvV/I54eXP94IvhpSXESDPAk4Nyk9McA2CiaBsvxA5gZXu6gi6xVK94Tg
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

This documents Firefly ROC-RK3588S-PC which is a SBC based on RK3588S SoC.

Link: https://wiki.t-firefly.com/en/Station-M3/index.html

Signed-off-by: Hsun Lai <i@chainsx.cn>
---

(no changes since v1)

 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 115c3ca43..701d68aca 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -258,6 +258,11 @@ properties:
           - const: firefly,rk3566-roc-pc
           - const: rockchip,rk3566
 
+      - description: Firefly Station M3
+        items:
+          - const: firefly,rk3588s-roc-pc
+          - const: rockchip,rk3588s
+
       - description: Firefly Station P2
         items:
           - const: firefly,rk3568-roc-pc
-- 
2.34.1

