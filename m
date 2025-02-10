Received: from mr85p00im-ztdg06011201.me.com (mr85p00im-ztdg06011201.me.com [17.58.23.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B1E2309A4
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.23.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739194354; cv=none; b=sxx4MWM8tu5fog1NJQxnH17BUx8T9QC1nKDsEKe6+ZMyTUTk/d5B62PVHzdrLBmFvS9L5FYwgcmtSREiSI8lFd4EdgcBWWP5k5scsLlOF8CabiLWcUMeHoBVDJ6KELAfIE2f+K8Uu5+mZxECoGuUK4aGzKibe5BpoMPGelETodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739194354; c=relaxed/simple;
	bh=e5ri7o/pKQgLDKlyQicTt3kAVTALbarSe2xQ/ZK/7MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojBjBEOe1byiY5ETczLJQHzZmeTiGjsjmR2OPwkqRz5f257T63LzjvDePjjXfTZ/XPDMv3aSTUSeKzN2tJHOfG6KBOylpFqsvj9VlcHQ3yjJ0bLnWrJ8HDH4xzbpZi/8zI901iNgutGro8NNWVpR9EY4lFv5wxLBBuFpAs9/k6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=XdLJHL7q; arc=none smtp.client-ip=17.58.23.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="XdLJHL7q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=BdtS65RHiFl1WFTCHO1gU6ssbrkbzjGtY4ydMrp5+Lk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=XdLJHL7qU/VQWqsyV/WtfW90oziiuTHh68BQr6KITQlL9S/+19VDXp3s04qtsiq9O
	 6I4pfYmgBZ3fEIM3f+4UpPfTUqtUfBKnzsCSOJ0Kz3tGMgalm9toUUs3Ij9q+rcbOH
	 lc+c+8QgZGflxlInbLEG3PQD1+EYQs+1l6zbXvJrTFyLNiU2J4xLF0Goq3GB9K3Fhm
	 86sNoK8HX3ztNcEdX37S83U91Emnd1aBoMvx0iD8qaCVLUCMTtFLvvXPpPWggD4vs3
	 BTTWHs+4WvK+O7xBpA4vOpZupmqMT01KYnWdaEnorZtFgMAgJjnwQB+zLpk+jNdnVW
	 /gG96Ken+6rdw==
Received: from [192.168.1.26] (mr38p00im-dlb-asmtp-mailmevip.me.com [17.57.152.18])
	by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id E4FF19602D3;
	Mon, 10 Feb 2025 13:32:29 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Mon, 10 Feb 2025 21:32:02 +0800
Subject: [PATCH 1/2] phy: core: Remove API
 devm_of_phy_provider_unregister()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250210-remove-apis-v1-1-2aaa866315a7@quicinc.com>
References: <20250210-remove-apis-v1-0-2aaa866315a7@quicinc.com>
In-Reply-To: <20250210-remove-apis-v1-0-2aaa866315a7@quicinc.com>
To: Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>, 
 Yanteng Si <si.yanteng@linux.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: PYqpPWuoolM9S6owRDN_nfSN9kwudjr0
X-Proofpoint-GUID: PYqpPWuoolM9S6owRDN_nfSN9kwudjr0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_07,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=763 clxscore=1015
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2502100113
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

API devm_of_phy_provider_unregister() has not had callers
since 2013-09-27 when it was introduced.

Remove the API.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 Documentation/driver-api/phy/phy.rst                  |  5 +----
 .../translations/zh_CN/driver-api/phy/phy.rst         |  5 +----
 drivers/phy/phy-core.c                                | 19 -------------------
 include/linux/phy/phy.h                               |  6 ------
 4 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/Documentation/driver-api/phy/phy.rst b/Documentation/driver-api/phy/phy.rst
index 81785c084f3ec2dd02af2131fbc8632cb5b33b0b..be3687a2a11bbf84e6e5561b11931ea6db984434 100644
--- a/Documentation/driver-api/phy/phy.rst
+++ b/Documentation/driver-api/phy/phy.rst
@@ -64,12 +64,9 @@ macros can be used to override the node containing the children.
 		__devm_of_phy_provider_register_full(dev, children,
 						     THIS_MODULE, xlate)
 
-	void devm_of_phy_provider_unregister(struct device *dev,
-		struct phy_provider *phy_provider);
 	void of_phy_provider_unregister(struct phy_provider *phy_provider);
 
-devm_of_phy_provider_unregister and of_phy_provider_unregister can be used to
-unregister the PHY.
+of_phy_provider_unregister can be used to unregister the PHY.
 
 Creating the PHY
 ================
diff --git a/Documentation/translations/zh_CN/driver-api/phy/phy.rst b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
index 0d7489081b904d6fc5aa21824c969e325e801297..2d3f98deb92035c44fcb1ff0e3dc8543053140f6 100644
--- a/Documentation/translations/zh_CN/driver-api/phy/phy.rst
+++ b/Documentation/translations/zh_CN/driver-api/phy/phy.rst
@@ -63,12 +63,9 @@ devm_of_phy_provider_register_full() 宏来覆盖包含子节点的节点。
 		__devm_of_phy_provider_register_full(dev, children,
 						     THIS_MODULE, xlate)
 
-	void devm_of_phy_provider_unregister(struct device *dev,
-		struct phy_provider *phy_provider);
 	void of_phy_provider_unregister(struct phy_provider *phy_provider);
 
-devm_of_phy_provider_unregister 和 of_phy_provider_unregister
-可以被用来注销PHY.
+of_phy_provider_unregister() 可以被用来注销PHY.
 
 创建PHY
 =======
diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8dfdce605a905d7f38205727151258af41f807a9..dd6302dfd14d2ec060857fc019268096c33e37a2 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -1248,25 +1248,6 @@ void of_phy_provider_unregister(struct phy_provider *phy_provider)
 }
 EXPORT_SYMBOL_GPL(of_phy_provider_unregister);
 
-/**
- * devm_of_phy_provider_unregister() - remove phy provider from the framework
- * @dev: struct device of the phy provider
- * @phy_provider: phy provider returned by of_phy_provider_register()
- *
- * destroys the devres associated with this phy provider and invokes
- * of_phy_provider_unregister to unregister the phy provider.
- */
-void devm_of_phy_provider_unregister(struct device *dev,
-				     struct phy_provider *phy_provider)
-{
-	int r;
-
-	r = devres_release(dev, devm_phy_provider_release, devm_phy_match,
-			   phy_provider);
-	dev_WARN_ONCE(dev, r, "couldn't find PHY provider device resource\n");
-}
-EXPORT_SYMBOL_GPL(devm_of_phy_provider_unregister);
-
 /**
  * phy_release() - release the phy
  * @dev: the dev member within phy
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 03cd5bae92d3f189d739c453fe4c160dd2a5063e..06037a7eefc4b0319008065d142c9f1caba2c74d 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -288,8 +288,6 @@ struct phy_provider *__devm_of_phy_provider_register(struct device *dev,
 	struct phy * (*of_xlate)(struct device *dev,
 				 const struct of_phandle_args *args));
 void of_phy_provider_unregister(struct phy_provider *phy_provider);
-void devm_of_phy_provider_unregister(struct device *dev,
-	struct phy_provider *phy_provider);
 int phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 void phy_remove_lookup(struct phy *phy, const char *con_id, const char *dev_id);
 #else
@@ -547,10 +545,6 @@ static inline void of_phy_provider_unregister(struct phy_provider *phy_provider)
 {
 }
 
-static inline void devm_of_phy_provider_unregister(struct device *dev,
-	struct phy_provider *phy_provider)
-{
-}
 static inline int
 phy_create_lookup(struct phy *phy, const char *con_id, const char *dev_id)
 {

-- 
2.34.1

