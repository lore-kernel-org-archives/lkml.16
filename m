Received: from outbound.pv.icloud.com (p-west1-cluster3-host6-snip4-3.eps.apple.com [57.103.66.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE6D134AC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747837896; cv=none; b=b9EEV/xR9yXKWXMj0lUSaIYj/G8MsOvCK2oW6nSTfDxVBSdMMme0pK+TnmIbujsDsAV2cdxcovE5AvtvPQ1jifL6wEPZ/nI5RGql34hHH6vXGQ/K7xgswPJxeAByuLVhkpvowmkZZuH+QVaBLQZncskvqmWqjM163GtKqEBYPAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747837896; c=relaxed/simple;
	bh=xsa0RT/ypG4FmEnxsPUK0d/OLdT+kjZu/uYCnpFxzjY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C16Zf4s2V737k3tE7vumABWynkTNLnclQY71rMTbHyG6Vw7Oo8ze+eavO1M22LJE6X95QNRrDhwQIlOYSM8JU9D8MrB7UBlo1U0OcUCUuQV8JiaQ/w5j5SD9sgm02ufz3jFNGkxYzO0/miNPssCEMifpKXeASN8G4xhtuNL3jYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ai-sast.com; spf=pass smtp.mailfrom=ai-sast.com; dkim=pass (2048-bit key) header.d=ai-sast.com header.i=@ai-sast.com header.b=AeYC8jDy; arc=none smtp.client-ip=57.103.66.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ai-sast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ai-sast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ai-sast.com header.i=@ai-sast.com header.b="AeYC8jDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ai-sast.com; s=sig1;
	bh=1f2QKjztcD4hQbD+czokSOxXRLI+8sOKK+DwDjkqyIU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
	b=AeYC8jDy9m+zuZuKoQJimbOmkMYD2b2cW4ZzLL5SvfPq30cyUNpKRY8NPpZXx01+3
	 fJ4FiVoEW4311MNgCA5Mcgat8hO03KodGC/zfnpwV41T+bUX64qE6hVikdimMAyUci
	 qIHsBYjNBaq00P/y6nOClmdypQx0qOLzGvKDLThvSSEIVWUdAAxawd0vsq0vXdORTW
	 o05uMErAG7Rpos9cUe/OXEzjsy4036j1JKdRtlHHJlCIBuURspTIMhRRtZqgbomRU9
	 PEa+ZDpzD0/lmaKRT5FZhJMvbbDiYzX0KcjpATaV16xPrVH1RCC9WqcbAtavFaL2Nw
	 FKJuKpMpOyirA==
Received: from outbound.pv.icloud.com (localhost [127.0.0.1])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id 5075D180126C;
	Wed, 21 May 2025 14:31:30 +0000 (UTC)
Received: from localhost.localdomain (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id DCBCA18002A6;
	Wed, 21 May 2025 14:31:25 +0000 (UTC)
From: Ye Chey <yechey@ai-sast.com>
To: kent.overstreet@linux.dev
Cc: linux-bcachefs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ye Chey <yechey@ai-sast.com>
Subject: [PATCH] bcachefs: fix potential NULL pointer dereference in bch2_bkey_buf_realloc
Date: Wed, 21 May 2025 22:30:33 +0800
Message-ID: <20250521143033.53620-1-yechey@ai-sast.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: EFwjcW8qZ5j-axRvbHXrjI-Y7NssxRNq
X-Proofpoint-ORIG-GUID: EFwjcW8qZ5j-axRvbHXrjI-Y7NssxRNq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 mlxlogscore=759 phishscore=0 malwarescore=0 suspectscore=0
 adultscore=0 clxscore=1030 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503310001 definitions=main-2505210141

Add error checking for mempool_alloc return value to avoid potential NULL
pointer dereference when memory allocation fails.

Signed-off-by: Ye Chey <yechey@ai-sast.com>
---
 fs/bcachefs/bkey_buf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/bcachefs/bkey_buf.h b/fs/bcachefs/bkey_buf.h
index a30c4ae8e..8272a1830 100644
--- a/fs/bcachefs/bkey_buf.h
+++ b/fs/bcachefs/bkey_buf.h
@@ -16,6 +16,8 @@ static inline void bch2_bkey_buf_realloc(struct bkey_buf *s,
 	if (s->k == (void *) s->onstack &&
 	    u64s > ARRAY_SIZE(s->onstack)) {
 		s->k = mempool_alloc(&c->large_bkey_pool, GFP_NOFS);
+		if (!s->k)
+			return;
 		memcpy(s->k, s->onstack, sizeof(s->onstack));
 	}
 }
-- 
2.44.0

