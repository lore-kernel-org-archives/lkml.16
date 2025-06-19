Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E57BF2475D0;
	Thu, 19 Jun 2025 06:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750315209; cv=none; b=gQlfJgqX+Z1obMX8YhvKnztJsAulyJhXGAjY0rMS78jBpcp40Yzh9mviiLs4MpNbJRejCE/Mttg0fIWhGedv9wQKHnCIG7lkcYiTFspM/CRzupe0C1rOI8PNqjY9QWH0FIX+eFdM6HT5Tq5oVzmR6O9z9qDLo5EMeu8dXyu0K58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750315209; c=relaxed/simple;
	bh=qGRc9yhLBLb/AMxs7EjYX9iByhqQp0GA6bDte/6ji2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UAaXif5xfYFHN1k72G1lFq5rZng2hze+OY2n3kY8oH4mB00FM4aEgui+E7hRABAxOLTRPQiUTd3UFRgswts6GqX0BFXDW95MTUDs4y+ayM9gk68dVhx7c8GAdoMx1RiW8u9S8emrMjL2ZVx/0R424um6LpCuqkejs5UsNVrG1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=C4s0OJO+; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="C4s0OJO+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vB
	8wLIz0WHvujVMHowKC0Q/8HNa8Qgp3eo7drb5rVz4=; b=C4s0OJO+Ikm4wxq+uu
	gehZUv4bdqSAzq4O3CqCynf8NYH7oW785lT+r/Zd9W3ay2Y+bJzquv6/Vp98APQE
	T56iue+3JgqqQ5yx8neUaafRN9YArz5blAqVkQ8OhQUqogFJiePKHHGU+XaLHdTS
	jeTFTo1c4NN09r0ruRBN2qJlU=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD312OGsFNoUtqyAQ--.3973S6;
	Thu, 19 Jun 2025 14:39:13 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: hjc@rock-chips.com,
	mripard@kernel.org,
	naoki@radxa.com,
	stephen@radxa.com,
	cristian.ciocaltea@collabora.com,
	neil.armstrong@linaro.org,
	Laurent.pinchart@ideasonboard.com,
	yubing.zhang@rock-chips.com,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	sebastian.reichel@collabora.com,
	Andy Yan <andy.yan@rock-chips.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/9] dt-bindings: display: simple-bridge: Add ra620 compatible
Date: Thu, 19 Jun 2025 14:38:50 +0800
Message-ID: <20250619063900.700491-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619063900.700491-1-andyshrk@163.com>
References: <20250619063900.700491-1-andyshrk@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD312OGsFNoUtqyAQ--.3973S6
X-Coremail-Antispam: 1Uf129KBjvdXoWrZw1UZrWxKw4DCw4kKF18Grg_yoWDAFc_X3
	Z7Aw1UJr1FqasYgFs8ZFs7Gry3Xw48KrWrCr10yrs7Ar4S934DKa97J34rGr1rAF1I9Fn7
	ur1fW39rCwsrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8N_-PUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBVxXmhTsFgHLwAAsR

From: Andy Yan <andy.yan@rock-chips.com>

RA620 is a DP to HDMI bridge converter from RADXA, which first
found be used on ROCK 5 ITX.

This chip can be used without involving software.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v3)

Changes in v3:
- First introduced in this version.

 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 43cf4df9811a5..421f99ca42d9b 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -28,6 +28,7 @@ properties:
       - enum:
           - adi,adv7123
           - dumb-vga-dac
+          - radxa,ra620
           - ti,opa362
           - ti,ths8134
           - ti,ths8135
-- 
2.43.0

