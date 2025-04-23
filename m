Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2D3264A8E
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 03:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745378577; cv=none; b=aoHPUhnqdnCaOohoadiTYYHTgXXiOD9a9T5LceqQeHURKbbDqrEy5qMuS1oPHKN+fAh8AKiV6B1dchu8X9uTGBlAobuzCHD5fIfhgBWiiEnWS+m2anHawl3dWYjoQmMhoyEhN3dyVEazfAkv5xCjVtI1vUjG2Sbh6xTC+G6sX/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745378577; c=relaxed/simple;
	bh=fNehY2HRaSE9VcUxBTEk6a2jhodK6arcVQldbdqJu/Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTrkuBT5C6/B11C1XJAjUZrmpeio424u+Kdu/lT3GMmNrQ2d5leJGcw7C/1mb1oRRMXMDzNbvUr4Cu15dYfJTVkmVgHT4Oc8Jmnon8yJgdWpTdhwlz7RA3aYkeIk8381Dsrce6c9lI0wfRaPJkJVKsA0AajucSfiXXVKQXA34bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 3968fdd41ff211f0a216b1d71e6e1362-20250423
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NO_NAME, HR_CTE_8B, HR_CTT_MISS
	HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_DIGIT_LEN, HR_FROM_NAME
	HR_SJ_DIGIT_LEN, HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM
	HR_SJ_PHRASE, HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_AS_FROM, HR_TO_COUNT
	HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME, IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED
	SA_TRUSTED, SA_EXISTED, SN_TRUSTED, SN_EXISTED, SPF_NOPASS
	DKIM_NOPASS, DMARC_NOPASS, CIE_BAD, CIE_GOOD_SPF, GTI_FG_BS
	GTI_RG_INFO, GTI_C_BU, AMN_T1, AMN_GOOD, AMN_C_TI
	AMN_C_BU
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.45,REQID:992ab264-5b07-4fea-95d1-bf2e0d2b70aa,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:30
X-CID-INFO: VERSION:1.1.45,REQID:992ab264-5b07-4fea-95d1-bf2e0d2b70aa,IP:0,URL
	:0,TC:0,Content:0,EDM:25,RT:0,SF:5,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:30
X-CID-META: VersionHash:6493067,CLOUDID:7e283e1971aeb2bafcd721b3112469a5,BulkI
	D:250423112248AWI4IG9W,BulkQuantity:0,Recheck:0,SF:19|66|72|78|81|82|102,T
	C:nil,Content:0|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-UUID: 3968fdd41ff211f0a216b1d71e6e1362-20250423
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 682090341; Wed, 23 Apr 2025 11:22:45 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: xiaopei01@kylinos.cn
Cc: andriy.shevchenko@linux.intel.com,
	john.g.garry@oracle.com,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	xiaopeitux@foxmail.com,
	xuwei5@hisilicon.com
Subject: [PATCH v3 2/2] lib/logic_pio: add and clean up comment in logic_lib
Date: Wed, 23 Apr 2025 11:22:38 +0800
Message-Id: <56ded65af1f94894ce56cd83bf7c5edef20291bc.1745377493.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1745377493.git.xiaopei01@kylinos.cn>
References: <cover.1745377493.git.xiaopei01@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

1.Add comments that we were previously overlooked for find_io_range()
and logic_pio_trans_cpuaddr().
2.clean up other comment according to kernel-doc

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
changes in v3: add Return section add cleanup
changes in v2: Returns to Return 
---
 lib/logic_pio.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/lib/logic_pio.c b/lib/logic_pio.c
index e29496a38d06..5a080baf2001 100644
--- a/lib/logic_pio.c
+++ b/lib/logic_pio.c
@@ -24,11 +24,12 @@ static DEFINE_MUTEX(io_range_mutex);
  * logic_pio_register_range - register logical PIO range for a host
  * @new_range: pointer to the IO range to be registered.
  *
- * Returns 0 on success, the error code in case of failure.
+ * Register a new IO range node in the IO range list.
+ *
+ * Return: 0 on success, the error code in case of failure.
  * If the range already exists, -EEXIST will be returned, which should be
  * considered a success.
  *
- * Register a new IO range node in the IO range list.
  */
 int logic_pio_register_range(struct logic_pio_hwaddr *new_range)
 {
@@ -118,9 +119,9 @@ void logic_pio_unregister_range(struct logic_pio_hwaddr *range)
  * find_io_range_by_fwnode - find logical PIO range for given FW node
  * @fwnode: FW node handle associated with logical PIO range
  *
- * Returns pointer to node on success, NULL otherwise.
- *
  * Traverse the io_range_list to find the registered node for @fwnode.
+ *
+ * Return: pointer to node on success, NULL otherwise.
  */
 struct logic_pio_hwaddr *find_io_range_by_fwnode(const struct fwnode_handle *fwnode)
 {
@@ -138,7 +139,15 @@ struct logic_pio_hwaddr *find_io_range_by_fwnode(const struct fwnode_handle *fwn
 	return found_range;
 }
 
-/* Return a registered range given an input PIO token */
+/**
+ * find_io_range - find a registered range by PIO
+ * @pio: logical PIO value
+ *
+ * Traverse the io_range_list to find the registered node for @pio.
+ * The input PIO should be unique in the whole logical PIO space.
+ *
+ * Return: a registered range, NULL otherwise.
+ */
 static struct logic_pio_hwaddr *find_io_range(unsigned long pio)
 {
 	struct logic_pio_hwaddr *range, *found_range = NULL;
@@ -162,10 +171,10 @@ static struct logic_pio_hwaddr *find_io_range(unsigned long pio)
  * logic_pio_to_hwaddr - translate logical PIO to HW address
  * @pio: logical PIO value
  *
- * Returns HW address if valid, ~0 otherwise.
- *
  * Translate the input logical PIO to the corresponding hardware address.
  * The input PIO should be unique in the whole logical PIO space.
+ *
+ * Return: HW address if valid, ~0 otherwise.
  */
 resource_size_t logic_pio_to_hwaddr(unsigned long pio)
 {
@@ -179,12 +188,14 @@ resource_size_t logic_pio_to_hwaddr(unsigned long pio)
 }
 
 /**
- * logic_pio_trans_hwaddr - translate HW address to logical PIO
+ * logic_pio_trans_hwaddr - translate HW address to logical PIO by fwnode
  * @fwnode: FW node reference for the host
  * @addr: Host-relative HW address
  * @size: size to translate
  *
- * Returns Logical PIO value if successful, ~0UL otherwise
+ * Translate HW address by fwnode to logical PIO
+ *
+ * Return: Logical PIO value if successful, ~0UL otherwise
  */
 unsigned long logic_pio_trans_hwaddr(const struct fwnode_handle *fwnode,
 				     resource_size_t addr, resource_size_t size)
@@ -204,6 +215,14 @@ unsigned long logic_pio_trans_hwaddr(const struct fwnode_handle *fwnode,
 	return addr - range->hw_start + range->io_start;
 }
 
+/**
+ * logic_pio_trans_cpuaddr - translate CPU address to logical PIO
+ * @addr: Host-relative CPU address
+ *
+ * translate CPU address to logical PIO
+ *
+ * Return: Logical PIO value if successful, ~0UL otherwise
+ */
 unsigned long logic_pio_trans_cpuaddr(resource_size_t addr)
 {
 	struct logic_pio_hwaddr *range;
-- 
2.25.1

