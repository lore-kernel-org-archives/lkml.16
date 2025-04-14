Received: from outbound.pv.icloud.com (p-west1-cluster3-host12-snip4-8.eps.apple.com [57.103.66.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754992BE7B1
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631369; cv=none; b=ah8YrX7Dk231sVq1LgC6QK+My3x76iyt/5wl5nnPX/NbdGwB/+XsEYPTkpyQIPmK3Y3b07rbIv5dzpItqyuxh+PH9R7b4Tr7mBZnaUFSSGOmVr6eeY4YFH52CLdpRDqlKwIkTj0G0tKrenttRLfikG9bSziC3Vp1gtnTQEjsTZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631369; c=relaxed/simple;
	bh=oxeNg/3kTTYdWOP+m0MjbWQatWl1xtjweDH0uB/M8o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eMy8VrAfKW2KsyGDC4SNds1TPv9UYM3cbnitCQuFfCw9i+yMk/9cf62zzat7HohZPeDz38mA8IJDDmNAHn8YYTC+zEZBbLt6R8HWJaqK0z5xhSUgo4E+KFhtbrz2IAuEs2MfoXwYU5c09RfETd6rY1QPWeqGYT4XybEYhKAn9tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=LRzTG4QB; arc=none smtp.client-ip=57.103.66.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="LRzTG4QB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=tfkcqBi0ou5N+iPlIoNtZJvvEZ4xTbBbnOJsMG5xchk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=LRzTG4QBigC/jg3Qq9QBaxAlc/uPz9dJN9u75EqKXrnFvP5HgKR2/c4DGBAsxW61f
	 BkfM6DUUhSBDWM6PQSJC3hdke8nZ5ivsA2UoPtFlvPAE1FyfTBVbmGOlP22X85hykY
	 /4PTMejljC3OcnJ46HxhT6AxKcEwRQ2T9AP/F9hRdKwDZseC6YSdF5UepMN1Qh2KVf
	 7VK+p71g6+SEBSW6ldE+W6M88GAXhSm5SXTslh1Z+o/pO3sbN8smZrV1U2vG1OVwvQ
	 +8aI2/uQspQVQy2AufC0L3RfcDuqqRaGGguyDsxx+Fdq7nGxl36nzx2OCcIU/2lHGz
	 Sq2/Rc7nT82cQ==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id CA77218000B3;
	Mon, 14 Apr 2025 11:49:24 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id A67D21800289;
	Mon, 14 Apr 2025 11:49:21 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 14 Apr 2025 19:49:05 +0800
Subject: [PATCH RESEND 2/2] phy: core: Remove API devm_phy_destroy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250414-remove-apis-v1-2-6fddc9a5a16d@quicinc.com>
References: <20250414-remove-apis-v1-0-6fddc9a5a16d@quicinc.com>
In-Reply-To: <20250414-remove-apis-v1-0-6fddc9a5a16d@quicinc.com>
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2

From: Zijun Hu <quic_zijuhu@quicinc.com>

API devm_phy_destroy() has not had callers since 2013-09-27
when it was introduced.

Remove the API.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 Documentation/driver-api/phy/phy.rst                    |  6 ++----
 Documentation/translations/zh_CN/driver-api/phy/phy.rst |  7 ++-----
 drivers/phy/phy-core.c                                  | 17 -----------------
 include/linux/phy/phy.h                                 |  5 -----
 4 files changed, 4 insertions(+), 31 deletions(-)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index be3687a2a11bbf84e6e5561b11931ea6db984434..cae03d8a4812b3c4cfca64272cc6b8f83a81d1c8 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -173,13 +173,11 @@ Destroying the PHY
 ==================
 
 When the driver that created the PHY is unloaded, it should destroy the PHY it
-created using one of the following 2 APIs::
+created using the following API::
 
 	void phy_destroy(struct phy *phy);
-	void devm_phy_destroy(struct device *dev, struct phy *phy);
 
-Both these APIs destroy the PHY and devm_phy_destroy destroys the devres
-associated with this PHY.
+The API destroys the PHY.
 
 PM Runtime
 ==========
diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.rst b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
index 2d3f98deb92035c44fcb1ff0e3dc8543053140f6..37c23fcebf11f397d0dc502bbba11a74c525f085 100644
--- a/Documentation/translations/zh_CN/driver-api/phy/phy.rst
+++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
@@ -164,14 +164,11 @@ PHY 关联的设备资源。
 销毁 PHY
 ========
 
-当创建 PHY 的驱动程序被卸载时，它应该使用以下 2 个 API 之一销毁其创
-建的 PHY::
+当创建 PHY 的驱动程序被卸载时，它应该使用以下 API 销毁其创建的 PHY::
 
 	void phy_destroy(struct phy *phy);
-	void devm_phy_destroy(struct device *dev, struct phy *phy);
 
-这两个 API 都会销毁 PHY，并且 devm_phy_destroy 会销毁与此 PHY 关
-联的 devres。
+这个 API 会销毁 PHY。
 
 PM Runtime
 ==========
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index dd6302dfd14d2ec060857fc019268096c33e37a2..8e0e11553e369e06f5ee4cdbb111b4ddb1b34e74 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1107,23 +1107,6 @@ void phy_destroy(struct phy *phy)
 }
 EXPORT_SYMBOL_GPL(phy_destroy);
 
-/**
- * devm_phy_destroy() - destroy the PHY
- * @dev: device that wants to release this phy
- * @phy: the phy returned by devm_phy_get()
- *
- * destroys the devres associated with this phy and invokes phy_destroy
- * to destroy the phy.
- */
-void devm_phy_destroy(struct device *dev, struct phy *phy)
-{
-	int r;
-
-	r = devres_release(dev, devm_phy_consume, devm_phy_match, phy);
-	dev_WARN_ONCE(dev, r, "couldn't find PHY resource\n");
-}
-EXPORT_SYMBOL_GPL(devm_phy_destroy);
-
 /**
  * __of_phy_provider_register() - create/register phy provider with the framework
  * @dev: struct device of the phy provider
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 06037a7eefc4b0319008065d142c9f1caba2c74d..66eb664249ddaa6635bf80d8db115cb21473ceb8 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -278,7 +278,6 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 struct phy *devm_phy_create(struct device *dev, struct device_node *node,
 			    const struct phy_ops *ops);
 void phy_destroy(struct phy *phy);
-void devm_phy_destroy(struct device *dev, struct phy *phy);
 struct phy_provider *__of_phy_provider_register(struct device *dev,
 	struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,
@@ -521,10 +520,6 @@ static inline void phy_destroy(struct phy *phy)
 {
 }
 
-static inline void devm_phy_destroy(struct device *dev, struct phy *phy)
-{
-}
-
 static inline struct phy_provider *__of_phy_provider_register(
 	struct device *dev, struct device_node *children, struct module *owner,
 	struct phy * (*of_xlate)(struct device *dev,

-- 
2.34.1

