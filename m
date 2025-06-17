Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418CE28C2A5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165647; cv=none; b=hMBvdOEeDvo7mwgv0JxtFFF6zv+f6jM4Loro1uyPitDlFYp6uOx812w9kadtj7qYXLLbAcwv1weuGsdGQf22qv8hKoDwwG9KZ9GGwbGbQVMReufS2PdgAQNxPqvdtelePsFbhRbTUHtNvSWjiaTTGU/gIA1+2Ja1EhCc2PNfHe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165647; c=relaxed/simple;
	bh=CIMbnrKgmFVi5kaYN6sqoh6PLAmzqT9Mi8IMNLQS31A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=lAcUmG/LWMKeYVUltLesQiK2/Z2wVItIko1KZAA0S0062GtWdcugJCS8ab9/OT/IpH4pqj35wNntakwjvb4M2/F2WSQL9+T3YxZFDRNNiXNd/od5PwsyoQln+Phvw6Fb9ZcGkFlzbL+PVa/DpDEd1ZgpneT7WzG0t/yjuOtCOVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=R86TC1tt; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="R86TC1tt"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250617130006epoutp02dab1db55496fcb8d7cafb0ea82f471ff~J1fuWNGt92363523635epoutp02x
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:00:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250617130006epoutp02dab1db55496fcb8d7cafb0ea82f471ff~J1fuWNGt92363523635epoutp02x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750165206;
	bh=9bjs6tyQvJlVpkSTg41/AKMOBJai+ttI8y78qrC5SFI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=R86TC1tt9IVBIhL9ucxM2zTH+iaEzfEQ2GflSnZ/OsBKqVrsTgQ9tlTDtM938D0JI
	 nRsk7s349VUZoM6m23noNScZSpATBk8pjC2oE7rNqGYZPx8pKJVx77qOI8B3BkB5YW
	 3Yv+GWT/s/medbsT5zuyEEIj1dqHtaHBXwvk7WcY=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250617130006epcas5p3c61719f7276c88a8f33a68b5a16085f3~J1ft0kJFj2917429174epcas5p3i;
	Tue, 17 Jun 2025 13:00:06 +0000 (GMT)
Received: from epcpadp1new (unknown [182.195.40.141]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bM6RB11dnz3hhT4; Tue, 17 Jun
	2025 13:00:06 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250617124040epcas5p3be044cbdc5b33b0b8465d84870a5b280~J1OwPcJVe2103821038epcas5p32;
	Tue, 17 Jun 2025 12:40:40 +0000 (GMT)
Received: from test-PowerEdge-R740xd.samsungds.net (unknown [107.99.41.79])
	by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250617124037epsmtip2cef371dcf7c5946490fabb6832f56b5c~J1Otu9VsC2555425554epsmtip2K;
	Tue, 17 Jun 2025 12:40:37 +0000 (GMT)
From: Neeraj Kumar <s.neeraj@samsung.com>
To: dan.j.williams@intel.com, dave@stgolabs.net,
	jonathan.cameron@huawei.com, dave.jiang@intel.com,
	alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com
Cc: a.manzanares@samsung.com, nifan.cxl@gmail.com, anisa.su@samsung.com,
	vishak.g@samsung.com, krish.reddy@samsung.com, arun.george@samsung.com,
	alok.rathore@samsung.com, s.neeraj@samsung.com, neeraj.kernel@gmail.com,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	nvdimm@lists.linux.dev, gost.dev@samsung.com, cpgs@samsung.com
Subject: [RFC PATCH 12/20] nvdimm/namespace_label: Skip region label during
 namespace creation
Date: Tue, 17 Jun 2025 18:09:36 +0530
Message-Id: <2024918163.301750165206130.JavaMail.epsvc@epcpadp1new>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250617123944.78345-1-s.neeraj@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250617124040epcas5p3be044cbdc5b33b0b8465d84870a5b280
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20250617124040epcas5p3be044cbdc5b33b0b8465d84870a5b280
References: <20250617123944.78345-1-s.neeraj@samsung.com>
	<CGME20250617124040epcas5p3be044cbdc5b33b0b8465d84870a5b280@epcas5p3.samsung.com>

During namespace creation skip presence of region label if present.
Also preserve region label into labels list if present.

Signed-off-by: Neeraj Kumar <s.neeraj@samsung.com>
---
 drivers/nvdimm/namespace_devs.c | 48 +++++++++++++++++++++++++++++----
 1 file changed, 43 insertions(+), 5 deletions(-)

diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
index b081661b7aaa..ca8f8546170c 100644
--- a/drivers/nvdimm/namespace_devs.c
+++ b/drivers/nvdimm/namespace_devs.c
@@ -1976,6 +1976,10 @@ static struct device **scan_labels(struct nd_region *nd_region)
 		if (!nd_label)
 			continue;
 
+		/* skip region labels if present */
+		if (is_region_label(ndd, nd_label))
+			continue;
+
 		/* skip labels that describe extents outside of the region */
 		if (nsl_get_dpa(ndd, &nd_label->ns_label) < nd_mapping->start ||
 		    nsl_get_dpa(ndd, &nd_label->ns_label) > map_end)
@@ -2014,9 +2018,29 @@ static struct device **scan_labels(struct nd_region *nd_region)
 
 	if (count == 0) {
 		struct nd_namespace_pmem *nspm;
+		for (i = 0; i < nd_region->ndr_mappings; i++) {
+			struct nd_label_ent *le, *e;
+			LIST_HEAD(list);
 
-		/* Publish a zero-sized namespace for userspace to configure. */
-		nd_mapping_free_labels(nd_mapping);
+			nd_mapping = &nd_region->mapping[i];
+			if (list_empty(&nd_mapping->labels))
+				continue;
+
+			list_for_each_entry_safe(le, e, &nd_mapping->labels,
+						 list) {
+				struct nd_lsa_label *nd_label = le->label;
+
+				/* preserve region labels if present */
+				if (is_region_label(ndd, nd_label))
+					list_move_tail(&le->list, &list);
+			}
+
+			/* Publish a zero-sized namespace for userspace
+			 * to configure.
+			 */
+			nd_mapping_free_labels(nd_mapping);
+			list_splice_init(&list, &nd_mapping->labels);
+		}
 		nspm = kzalloc(sizeof(*nspm), GFP_KERNEL);
 		if (!nspm)
 			goto err;
@@ -2028,7 +2052,7 @@ static struct device **scan_labels(struct nd_region *nd_region)
 	} else if (is_memory(&nd_region->dev)) {
 		/* clean unselected labels */
 		for (i = 0; i < nd_region->ndr_mappings; i++) {
-			struct list_head *l, *e;
+			struct nd_label_ent *le, *e;
 			LIST_HEAD(list);
 			int j;
 
@@ -2039,10 +2063,24 @@ static struct device **scan_labels(struct nd_region *nd_region)
 			}
 
 			j = count;
-			list_for_each_safe(l, e, &nd_mapping->labels) {
+			list_for_each_entry_safe(le, e, &nd_mapping->labels,
+						 list) {
+				struct nd_lsa_label *nd_label = le->label;
+
+				/* preserve region labels */
+				if (is_region_label(ndd, nd_label)) {
+					list_move_tail(&le->list, &list);
+					continue;
+				}
+
+				/* Once preserving selected ns label done
+				 * break out of loop
+				 */
 				if (!j--)
 					break;
-				list_move_tail(l, &list);
+
+				/* preserve selected ns label */
+				list_move_tail(&le->list, &list);
 			}
 			nd_mapping_free_labels(nd_mapping);
 			list_splice_init(&list, &nd_mapping->labels);
-- 
2.34.1


