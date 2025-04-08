Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851D622257E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 11:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113024; cv=none; b=dlOVayXqjkraN83qVpdSJru+ygTHQ+htW/y/ghyQDoJpK0vpEMzvrhmlMQ+pumw9MSV/QWJnhrnRxZET5XXSRUf4LIpvZmdSigDmYMoYgS0WXNxD7sDlC0bRc5QNC/LHfo8O1iSF8x2G1ulufcrvU9+cQoHV5ZNLOASQL4ianqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113024; c=relaxed/simple;
	bh=bpyNpFEeFo0aAeUY2o5pLw1lGiiCEM5eEJti7vLYWRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pJreRPmmmIjFg7koDKabKbdLWLG9dRDDsOxnYaILt1L1ZPyVGuil16m/aimOQQRSSIHvT/MNnHoUpGIqu/9tlYkZmfU5ZdHsZoVXTGN7cG94wsFzQDWsNtlGxyNfmANF9jAoeO+bPsiWaZ52pAdkYB3tt2Sq33ZlqRCxrBuJLd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=H9e5YdUf; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="H9e5YdUf"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1744113013; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=2go647+k6sJue3+Dqabd8fg47Qz+7QMamqrKoll0NkY=;
	b=H9e5YdUf/9N1YMM5cvy+Ml3p9WZtg7T89bOUGwheYG+owrjAsRgcZmhh45Y2pkdzowln37uoE1rkXOWE6oQQeY5TsFRlZ3K2qtdrxSZxAU+JzizOB2CaMCb6R0DS3naWr2cXPrAAMccUI5PaBXf/nsDsPEiODYjMhhZjE42LcYI=
Received: from x31i01179.sqa.na131.tbsite.net(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0WWFISVn_1744112694 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 08 Apr 2025 19:44:56 +0800
From: Gao Xiang <hsiangkao@linux.alibaba.com>
To: linux-erofs@lists.ozlabs.org
Cc: LKML <linux-kernel@vger.kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>
Subject: [PATCH 2/2] erofs: fix encoded extents handling
Date: Tue,  8 Apr 2025 19:44:48 +0800
Message-ID: <20250408114448.4040220-2-hsiangkao@linux.alibaba.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
References: <20250408114448.4040220-1-hsiangkao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

 - The MSB 32 bits of `z_fragmentoff` are available only in extent
records of size >= 8B.

 - Use round_down() to calculate `lstart` as well as increase `pos`
   correspondingly for extent records of size == 8B.

Fixes: 1d191b4ca51d ("erofs: implement encoded extent metadata")
Signed-off-by: Gao Xiang <hsiangkao@linux.alibaba.com>
---
 fs/erofs/zmap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/fs/erofs/zmap.c b/fs/erofs/zmap.c
index 8de50df05dfe..14ea47f954f5 100644
--- a/fs/erofs/zmap.c
+++ b/fs/erofs/zmap.c
@@ -559,7 +559,8 @@ static int z_erofs_map_blocks_ext(struct inode *inode,
 			pos += sizeof(__le64);
 			lstart = 0;
 		} else {
-			lstart = map->m_la >> vi->z_lclusterbits;
+			lstart = round_down(map->m_la, 1 << vi->z_lclusterbits);
+			pos += (lstart >> vi->z_lclusterbits) * recsz;
 			pa = EROFS_NULL_ADDR;
 		}
 
@@ -614,7 +615,7 @@ static int z_erofs_map_blocks_ext(struct inode *inode,
 		if (last && (vi->z_advise & Z_EROFS_ADVISE_FRAGMENT_PCLUSTER)) {
 			map->m_flags |= EROFS_MAP_MAPPED | EROFS_MAP_FRAGMENT;
 			vi->z_fragmentoff = map->m_plen;
-			if (recsz >= offsetof(struct z_erofs_extent, pstart_lo))
+			if (recsz > offsetof(struct z_erofs_extent, pstart_lo))
 				vi->z_fragmentoff |= map->m_pa << 32;
 		} else if (map->m_plen) {
 			map->m_flags |= EROFS_MAP_MAPPED |
-- 
2.43.5

