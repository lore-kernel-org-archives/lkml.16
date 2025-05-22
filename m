Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFDB219EB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904508; cv=none; b=fpMHcRtvKo1Zz7kCeLdS9FA8kpOrWy1zzu7tQwp7R8PNZrcBloUq3nqU3ZZZHc/5CyJznEkpJvEZL2q7R2SVA1C25VnWI11eNAw0n0Y3HbEcOjp/wOaZDMtaP0YjeqCXoHxsi4VppBXqMvqBS6GR0TnVLFPw4lvnaJEUf8vMlDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904508; c=relaxed/simple;
	bh=Y2u3Tf3ZtpKkFGrUn/yAhih7xStQrfI/befKd6X4mzc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qrsPrmQ89huEFWgW8983KYLKuzBqPzoic9enhdkiKRsQBY8qRz/HRVaRl1sOcbQx+QrpIDidosWq+bep++LGcFTShn3LwkjZE8I+uyLwqwKXOfPpFnMaDAekBIzyGxUg/Kx2EmQOY2Qs5G7M4VSPj5eM+WIgsAFvvgWor0hCoYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 5ae5a60036eb11f0b29709d653e92f7d-20250522
X-CTIC-Tags:
	HR_CC_AS_FROM, HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN
	HR_FROM_NAME, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT
	HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_TRUSTED
	SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS, DKIM_NOPASS
	DMARC_NOPASS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:ac8dba5b-05ec-4fbc-bab5-e9c9af5f1536,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:15
X-CID-INFO: VERSION:1.1.45,REQID:ac8dba5b-05ec-4fbc-bab5-e9c9af5f1536,IP:0,URL
	:0,TC:0,Content:-5,EDM:25,RT:0,SF:-5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:15
X-CID-META: VersionHash:6493067,CLOUDID:c0436d343feae5af07daef3ffbf139ee,BulkI
	D:250522170134V7A8COOO,BulkQuantity:0,Recheck:0,SF:17|19|38|66|78|102,TC:n
	il,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil
	,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD
X-UUID: 5ae5a60036eb11f0b29709d653e92f7d-20250522
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1413325579; Thu, 22 May 2025 17:01:31 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	dakr@kernel.org,
	andriy.shevchenko@linux.intel.com,
	bartosz.golaszewski@linaro.org
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] devres: Move remaining devm_alloc_percpu and devm_device_add_group to devres.h
Date: Thu, 22 May 2025 17:01:26 +0800
Message-Id: <5ac1e2a127c9df7233ca8ba0696ebb08960d0fc3.1747903894.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit f5e5631df596("devres: Move devm_*_action*() APIs to
devres.h"), But devm_alloc_percpu() and devm_device_add_group didn't be
moved.

so move it.The changes improve header organization by keeping all
resource-managed device APIs in the dedicated devres.h header,
reducing cross-header dependencies and making the interfaces
easier to locate.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 include/linux/device.h        | 21 ---------------------
 include/linux/device/devres.h | 24 ++++++++++++++++++++++++
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 4940db137fff..6dd6ae8f405b 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -281,25 +281,6 @@ int __must_check device_create_bin_file(struct device *dev,
 void device_remove_bin_file(struct device *dev,
 			    const struct bin_attribute *attr);
 
-/**
- * devm_alloc_percpu - Resource-managed alloc_percpu
- * @dev: Device to allocate per-cpu memory for
- * @type: Type to allocate per-cpu memory for
- *
- * Managed alloc_percpu. Per-cpu memory allocated with this function is
- * automatically freed on driver detach.
- *
- * RETURNS:
- * Pointer to allocated memory on success, NULL on failure.
- */
-#define devm_alloc_percpu(dev, type)      \
-	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
-						      __alignof__(type)))
-
-void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
-				   size_t align);
-void devm_free_percpu(struct device *dev, void __percpu *pdata);
-
 struct device_dma_parameters {
 	/*
 	 * a low level driver may set these to teach IOMMU code about
@@ -1127,8 +1108,6 @@ static inline void device_remove_group(struct device *dev,
 	device_remove_groups(dev, groups);
 }
 
-int __must_check devm_device_add_group(struct device *dev,
-				       const struct attribute_group *grp);
 
 /*
  * get_device - atomically increment the reference count for the device.
diff --git a/include/linux/device/devres.h b/include/linux/device/devres.h
index ae696d10faff..624ba81d4d8b 100644
--- a/include/linux/device/devres.h
+++ b/include/linux/device/devres.h
@@ -7,8 +7,10 @@
 #include <linux/numa.h>
 #include <linux/overflow.h>
 #include <linux/stdarg.h>
+#include <linux/sysfs.h>
 #include <linux/types.h>
 #include <asm/bug.h>
+#include <asm/percpu.h>
 
 struct device;
 struct device_node;
@@ -167,4 +169,26 @@ static inline int __devm_add_action_or_reset(struct device *dev, void (*action)(
 
 bool devm_is_action_added(struct device *dev, void (*action)(void *), void *data);
 
+/**
+ * devm_alloc_percpu - Resource-managed alloc_percpu
+ * @dev: Device to allocate per-cpu memory for
+ * @type: Type to allocate per-cpu memory for
+ *
+ * Managed alloc_percpu. Per-cpu memory allocated with this function is
+ * automatically freed on driver detach.
+ *
+ * RETURNS:
+ * Pointer to allocated memory on success, NULL on failure.
+ */
+#define devm_alloc_percpu(dev, type)      \
+	((typeof(type) __percpu *)__devm_alloc_percpu((dev), sizeof(type), \
+						      __alignof__(type)))
+
+void __percpu *__devm_alloc_percpu(struct device *dev, size_t size,
+				   size_t align);
+void devm_free_percpu(struct device *dev, void __percpu *pdata);
+
+int __must_check devm_device_add_group(struct device *dev,
+				       const struct attribute_group *grp);
+
 #endif /* _DEVICE_DEVRES_H_ */
-- 
2.25.1

