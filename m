Received: from 12.mo561.mail-out.ovh.net (12.mo561.mail-out.ovh.net [188.165.41.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C344C80
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.165.41.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746070428; cv=none; b=kOoVInaH19TgVgoYtjpXAFxc0Bd+w/wA7JyNqa8xOk/8HqYd3Ewzkct/yfYroYD9WiDiQlK6tNHODxXaiFDU68mQGNs6hL17A2w+BM4PoGGVvqkCJyofuc7Za0cAs2iKXPzOPPnK0pDYRSpnzhh3E1Pvj4vDqIHjdE6fEMVfBOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746070428; c=relaxed/simple;
	bh=cgNe+3OAOxlIKumKb00Y9Bg0xhGhpPOcGKx5Zxwtldc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=caV4vdnqB7z+wDe/ft7QT3wF+S0S8KfmBQ6O8TKeGpdDjO8vMLNU+iT+m5/b2kM7Vnt2DD1AKzbs+45nZjcxTGKI3WwHDozUL9oIxQ9fqXohAJtosLyBwPsvTZ01mDBDUryjm1RHMX7veMxy0ZekpnhV9pktFpKjh6X9crkakg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com; spf=pass smtp.mailfrom=3mdeb.com; dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b=M4Tuh07R; arc=none smtp.client-ip=188.165.41.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=3mdeb.com header.i=@3mdeb.com header.b="M4Tuh07R"
Received: from director11.ghost.mail-out.ovh.net (unknown [10.109.148.49])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4ZnshP2byCz1Tvr
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 22:45:09 +0000 (UTC)
Received: from ghost-submission-5b5ff79f4f-rprjd (unknown [10.110.168.167])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 056451FE1E;
	Wed, 30 Apr 2025 22:45:08 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.96])
	by ghost-submission-5b5ff79f4f-rprjd with ESMTPSA
	id ngtvL/SnEmi5GgAAoQYA3w
	(envelope-from <sergii.dmytruk@3mdeb.com>); Wed, 30 Apr 2025 22:45:08 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-96R0010aa7ac36-938c-4c8f-acd6-c85f48ca5d3f,
                    7FFE21389DDF989CCD6FB7268846A7FDE11993D7) smtp.auth=sergii.dmytruk@3mdeb.com
X-OVh-ClientIp:176.111.181.178
From: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
To: linux-kernel@vger.kernel.org
Cc: trenchboot-devel@googlegroups.com
Subject: [RFC PATCH v2 2/9] x86: AMD changes for Secure Launch Resource Table header file
Date: Thu,  1 May 2025 01:44:44 +0300
Message-ID: <3106242e092b9e28dfedb75a81ae4a68b0664c11.1746037489.git.sergii.dmytruk@3mdeb.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
References: <cover.1746037489.git.sergii.dmytruk@3mdeb.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 12102579575522374812
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieejleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuvghrghhiihcuffhmhihtrhhukhcuoehsvghrghhiihdrughmhihtrhhukhesfehmuggvsgdrtghomheqnecuggftrfgrthhtvghrnhephfehfeehudeileeikeffgfffgfefuddtveelvedvhfffgfelvdfgtddutdehfeeinecukfhppeduvdejrddtrddtrddupddujeeirdduuddurddukedurddujeekpdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepshgvrhhgihhirdgumhihthhruhhkseefmhguvggsrdgtohhmpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdfovfetjfhoshhtpehmohehiedumgdpmhhouggvpehsmhhtphhouhht
DKIM-Signature: a=rsa-sha256; bh=Tp9cS7PlRiBXUZqULcyRZnw27hF7l+b4x9U5h5mgUJA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1746053109; v=1;
 b=M4Tuh07R/EEEhryXv0vg5m4qkiCqTzrnKSj3Dhu8VKkMoE0y34IgsdTXfnWXEkJrsaTHsJpL
 lXjkqs23JL6a3aTJh9rDQpcy3+ctb+rjW3yMMXo/RBwJxhfCDgfcnv/W2hscfmDmNC8zrw6ZWP1
 zj4NDOc35B0QaeWzuzEjHEHXLm4ZJDYNzJVs7KCQtlwRvlcKf2C+jpJ5dHbSriuS+ZnbmHUTRZu
 UkaS7QaRoMAygJK3/oqobOV52cmwSKAImliT1cvLWZZUWwAJNQPAPIo+IFwGyTxsfjMD9OpBjT9
 JCFA8Xl4tADuYCo5NO2ZJuinRpGKcr8dPNMCneox0RJMQ==

From: Ross Philipson <ross.philipson@oracle.com>

Introduce the AMD info table that allows the SLRT to be linked in as a
setup_data entry. This allows the SLRT to be found and in addition all
the DLMR information needed by the SKL (Secure Kernel Loader).

Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
---
 include/linux/slr_table.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/slr_table.h b/include/linux/slr_table.h
index fea666250033..aecdb62b8a53 100644
--- a/include/linux/slr_table.h
+++ b/include/linux/slr_table.h
@@ -180,6 +180,21 @@ struct slr_entry_intel_info {
 	struct slr_txt_mtrr_state saved_bsp_mtrrs;
 } __packed;
 
+/*
+ * AMD SKINIT Info table
+ */
+struct slr_entry_amd_info {
+	struct slr_entry_hdr hdr;
+	u64 next;
+	u32 type;
+	u32 len;
+	u64 slrt_size;
+	u64 slrt_base;
+	u64 boot_params_addr;
+	u16 psp_version;
+	u16 reserved[3];
+} __packed;
+
 /*
  * UEFI config measurement entry
  */
-- 
2.49.0

