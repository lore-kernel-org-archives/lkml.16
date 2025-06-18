Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E33251E0E14;
	Wed, 18 Jun 2025 06:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750228623; cv=none; b=btvKNzg4wUJLwLD9QRCRaIfEdCcxVkHAcL4dwACvv8bAjEsyVjL2WarxMEpNoZkcOb9KwPn72usvtKpQt9wpbDEQLfoi/wfzqNi/L2IsRPPwhFKLLgwvRJVdNQTqj7BfZfL3RRs2u/p8PWGeOngp/ux8GLIX035aP/p1pofoGlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750228623; c=relaxed/simple;
	bh=dLBoI4Y294anBsQmhQ6GFAyRu1XvVH50/o1EnGWV75M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8CAXoXkQm7g8lFrC8IJ0WRCI/X4F3G4ccJ3vbv0TZE/5NOjW5RSI5S+Hu8BTrpyhpt8n9jzWmimu79fFsrPTURQOU+CtVkZbV8ojSQeWv+81kPr0wPPjADM+aatOH0dSXEKjO8qkWd4XTjI5OvPOdV5kI1bLn5BnW/VbePDs0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=pAtMcJvP; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="pAtMcJvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=3o
	2xSY68L4BFEQO///ypgcnI/0VLZaCbM2XNC4HBpeY=; b=pAtMcJvPcQ2qTGZhjz
	mbAW9TZwMpF/4HwIa0cCVME1c4bSb1p7kltvnF7qnbtZhv/y7WIYWtIxXfomX8PX
	x717cIA+NlnUzsOvMA13DR3U8xCY9NQKKr87RCjzFosrYMXnHwwbwl8l408YRgIl
	PjamjEjpyuADmQY83GrwT4AXA=
Received: from ProDesk.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDn3xpaXlJo+K25AA--.26565S2;
	Wed, 18 Jun 2025 14:36:14 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: detlev.casanova@collabora.com,
	conor+dt@kernel.org,
	dsimic@manjaro.org,
	kever.yang@rock-chips.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] arm64: dts: rockchip: Enable gpu on rk3576-evb1-v10
Date: Wed, 18 Jun 2025 14:36:01 +0800
Message-ID: <20250618063609.690332-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDn3xpaXlJo+K25AA--.26565S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF1kCF43uw4xXFyDuFy7GFg_yoWxuFg_t3
	Z2gw15XF4rGrn8t34ktayrG34jk34DCa4xWa1rXFWDGF9Ivay8JFW8tay3Kr9xKrW29r4f
	Jay5XasrAasxCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8uBTUUUUUU==
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqA9wXmhSW+dvxQAAsl

From: Andy Yan <andy.yan@rock-chips.com>

Enable gpu for rk3576 evb.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
index 6dfccf44c7f65..21e47155fa690 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
@@ -323,6 +323,11 @@ &eth1m0_rgmii_bus
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
 &hdmi {
 	status = "okay";
 };
-- 
2.43.0

