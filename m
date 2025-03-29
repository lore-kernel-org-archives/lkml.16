Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60756FBF
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 12:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250237; cv=none; b=CZA5iIJRJUtaHOBkgxf+iEwhL0Fue5ZKMUrgSD3/sT7wQ0v0gn7VM9v6++pQq9wQT9P5q1WRenRLzeRNynYNEz7nWuJ7V2yzspW30sVhvk9DXydfBrx98945q8X03h4uZkY/VdSxkZ3Hi+U9XV3/ZVD7mmXVHN2KGBimN9C1+OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250237; c=relaxed/simple;
	bh=80jFHIrCBi/yzSoHffaggIFyzzx4mYBt2QJfX0/mmq4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kyARPtb4zcRB1uE+U1W5YCxnxZvXl8we5BeqeMn//0a6Y2CEqRJ+DhmV7AKeBxNH4hcDtPhqKVtH5pgRPHATrtLQEEENJSNw85z5+Tpq2PnYLgR9maeIiVaG18sLLluP63JybvES8t22FnuwhLHr+GWytu80K0PgRSZbqVSrA5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YoYXw7If; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YoYXw7If"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56773C4CEE2;
	Sat, 29 Mar 2025 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743250237;
	bh=80jFHIrCBi/yzSoHffaggIFyzzx4mYBt2QJfX0/mmq4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YoYXw7Ifei7X0/qcZk1nvS2qQ4dQI1uzTLKUV+JUVL5kqkBJ73SMHiqCJx1c0vuhP
	 JxfEXS+mzQ6cqclxZx+pWkEi/NMcxRbGGRbT6s7UFJiwMIrbHptBdgq8I7wEt+SxGE
	 BJR4XmK3GOfnzvHvBhVKD+YK4Nb29oLiiWt/H9/FtXFTNrCfdb8SwezclqzvIPGFSo
	 yoHMtJqrXWvCDMP1GCfK2qr4FG+pxKzV1kLmTSUW2riBD5QFlaiFISKKaPKeIMCXOA
	 eK+XfGYjplHhIYCp3drqW53RaDJBnp2cNuezC+ws5+jA2HBRRnL8r93zT4hqFxRV9l
	 Xc3nx+2QpN9bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC8EC36008;
	Sat, 29 Mar 2025 12:10:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 29 Mar 2025 13:10:04 +0100
Subject: [PATCH v2] ARM: multi_v7_defconfig add /proc/config.gz
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-arm-config_gz-v2-1-f725d331fb5d@ixit.cz>
X-B4-Tracking: v=1; b=H4sIABzj52cC/43OQQ6DIBCF4asY1sXAGFC66j0a0xBBnYXSDMRYj
 XcvmnTf5b94X97Ooif0kd2LnZFfMGKYc8CtYN1o58FzdLkZCFCiAsMtTbwLc4/Da9h47bTSjTL
 WKcPy5k2+x/Xynm3unsLE00je/pRKaAkgBYimlMKArrnkzi7oHrhiKrvtdEaMKdDnurXIU/tz2
 x7H8QV+51ff1QAAAA==
X-Change-ID: 20250329-arm-config_gz-7d656859ad59
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CbA+gZnkNtIFncohuGK/3N46iMOwo2R3h73PJJZfyhA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn5+M8TVTU30peaj6GGd1EoPFBWTPo29JY3IH4+
 Jy5GzOK5tOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+fjPAAKCRBgAj/E00kg
 cszhD/0UJegGCFX+OSuIwG70meXkExgC8YlChrr49t9ZKSZMLiaagx4qX2Wk1Y4hP4Rb55PXgTJ
 H8VhUU3ak18CnRDETxJGqJznu4klqIsZqzKyf2Xz+BIvcpg1rAn6HPp9b+F8s62xd9Eum6uxsiJ
 OqR9uuSYHEIPirUR9x2FAZpPTZyl2+F5w5eXHObikoVsAHERzcSv/5vFblMzyIa1kj9eZ26D6hT
 22EhHwY7e7gI3Ll/nJgz4iv4mJi19UaTWGaBBfrF99bqCDIQAZisZOQHUXo/Erx0dp2q/h4bLJN
 274jm8OpYQTyNTIts76z44MFEcjd5cEMCtm2RoSSaOToOaS/7+OBz6+LUBbTZ/5kv/dz4wuKj5a
 1dwVCsc/9llGXa50oJDWay0P9jgxZ5QtgGCG3Lp3F/sj/idgS9RTbu4BxMEaBW1RZup4ucZBDGo
 6qTd0A6qsc/QY2l0Gt62H5AKtJ5TbBDi9zikMEJXl6yct2T0UQz3ONX1umpMCY/OGhDzLWZ0vY6
 1u9h0vVmtfV3uEYwMMhBzqJYcj3+8FWRLF4K2un2G4SVYWtZpwd+8RiDxNBXp0yJylLj0kquegR
 HrOmJePcSOFuVxc5VMqwdRLbV+vEhHG65oau7cheeZj0sgl/BKc+d+UAnaFLrqqAZ9lsbgTjLJG
 wkheOjZsBNxBWYA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

While 32-bit ARM isn't that widespread, multi_v7_defconfig is used for
building more generic images, where having access to config can be handy.

arm64 and x86_64 already bundle config.gz, so this is an effort to provide
the same level of comfort with ARMv7 devices.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- IKCONFIG is now module instead of built-in (Greg).
- Link to v1: https://lore.kernel.org/r/20230612210208.109267-1-david@ixit.cz
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..16144a519243daee25fbd339b3250e2ff77928ee 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y

---
base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
change-id: 20250329-arm-config_gz-7d656859ad59

Best regards,
-- 
David Heidelberg <david@ixit.cz>


