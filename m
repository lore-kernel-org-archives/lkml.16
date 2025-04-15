Received: from mail-m49243.qiye.163.com (mail-m49243.qiye.163.com [45.254.49.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2119C274FCB;
	Tue, 15 Apr 2025 05:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744696479; cv=none; b=jZrRs+AL62KPp6P/K0ySadQ3RnkY6YD8yddCL8xwIPojcB5lV4OMIT9Qvj/sHkGcmcuNh3RUjeAUKCiZId/B3NtQ11uo6rwe3cPf4OyWZZtzLJ8TFV1OqRMiq6wZpNw9Lt50Yq8tuI5FVWn/R6V3SUe/eF8yjwwv2OBB5MLT8/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744696479; c=relaxed/simple;
	bh=hrUYP5CdehdjGTXKv9LKCof4H8DlhEJfkYve2U/AWG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gjYevJsF47u7Bi7impIOUbYWqWexY35YnHkvCSjEYIHghZOZbHcX/Gh4lqca2esO+dnbx1052njEWrxeEii5fESYJqYp6Avx+rF7dsFyQC9sEnjgOkMgJG/kvftWHydcKjz2j8rWoTFVttrepYKTH+z+wp59gBvXFreLffLPIY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=jtGENCM+; arc=none smtp.client-ip=45.254.49.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="jtGENCM+"
Received: from localhost.localdomain (unknown [103.29.142.67])
	by smtp.qiye.163.com (Hmail) with ESMTP id 11e6d966d;
	Tue, 15 Apr 2025 13:19:06 +0800 (GMT+08:00)
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
Subject: [PATCH v4 3/7] dt-bindings: rockchip: pmu: Add rk3562 compatible
Date: Tue, 15 Apr 2025 13:18:51 +0800
Message-Id: <20250415051855.59740-4-kever.yang@rock-chips.com>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEIdVkIeTh9CSEpDQ0hMTFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKS0hVSUJVSk9JVU1MWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1
	VKQktLWQY+
X-HM-Tid: 0a9637e304a703afkunm11e6d966d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6Cww6SjJKNBo0TwIRCi4U
	IT4aCSxVSlVKTE9PTUJPSE9DTkxOVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlKS0hVSUJVSk9JVU1MWVdZCAFZQUlLTUg3Bg++
DKIM-Signature:a=rsa-sha256;
	b=jtGENCM+ktq9G0tOxqmN118wdD1TdJcDd0UqC0149qCp5Pg/KTYsnAV/b5MpAP8qH+63VwauZaQuaTthR5Alf3NbWFg+gaYj6L1NgjSnjFQgkiiK3zrw56P3yzCdYIHSAbzUfHakNFaWLzC2DLCJJDOUKFsntLDA3HrxBH7y2g4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=8S7bpP8L+83uDnLeLHDjhzH/u+pvrl1W2ywecgY5JP4=;
	h=date:mime-version:subject:message-id:from;

Add the compatible for the pmu mfd on rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

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

