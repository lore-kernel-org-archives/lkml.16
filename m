Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com [17.58.23.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E916230D19
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194358; cv=none; b=Sc95czhcHzGY48GyOjHE+N4LCxYbCrtMjVNojJgLWe/cuXJIUhdnhG5zNy0B9JBuYEOCZIii937STaHmaSrfzrlf4kIrUF1hnoAGG/lcUfrJXxoN+Qt+oOXvWtkEjYDKMAl1wgzVABx/j1UjIpXvKvTzMlGay+gtfp3tO4uNWIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194358; c=relaxed/simple;
	bh=oxeNg/3kTTYdWOP+m0MjbWQatWl1xtjweDH0uB/M8o0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lSgIha6LJ7n8lA7cd86CbBhF/Qz9TEwp94MloVLcbUal64Bpk16sCQDTzdCsLhF6oRchezTfn9haPQGYCrbfcLdu8hgLUZqyE7ocluMdQa5o9YWWFWc4Ah+WQau3sksaigFq1D5JcU32S6HJ45gHkucF9lsK6fzoAHxybZ5Ip/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=RN42a6ZM; arc=none smtp.client-ip=17.58.23.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="RN42a6ZM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=tfkcqBi0ou5N+iPlIoNtZJvvEZ4xTbBbnOJsMG5xchk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=RN42a6ZMjslZjkVYfWXKILcfiyrKlYgS2WNzV+wR8w1UgukG/CbJ/gtXdZvplUD1b
	 uWWx/FH6x8aORC9gzdBdiq4saxtIFWxCNAZS+RCraFc3kn0/BFhrN8dNTIQVzPdPcm
	 gY/jxQNBNOKq26cMPMR5KQshejjEUCIUtJH3NIb6O4Kmswqu36SRlvp/JRASJrAcCs
	 UXOBZ5BBvrB81YOYwRXT7kzU9ytBplMb4xy3tlSWsgdyt7tfOByOJ7yihCnRbvItW5
	 ElW5Rg4hIyRUTCCJ+P0dXivXvLh06ThhXTrt2MlS0GoGJ0DxAuRMdJy2bOMZd5UVtL
	 9m1JKDcXsXG4A==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 4CBE896018B;
	Mon, 10 Feb 2025 13:32:33 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 10 Feb 2025 21:32:03 +0800
Subject: [PATCH 2/2] phy: core: Remove API devm_phy_destroy()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-remove-apis-v1-2-2aaa866315a7@quicinc.com>
References: <20250210-remove-apis-v1-0-2aaa866315a7@quicinc.com>
In-Reply-To: <20250210-remove-apis-v1-0-2aaa866315a7@quicinc.com>
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: RZ9wNBzzm8BlNtPvaML8Qa5-SHehXFEi
X-Proofpoint-GUID: RZ9wNBzzm8BlNtPvaML8Qa5-SHehXFEi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_07,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2502100113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

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

